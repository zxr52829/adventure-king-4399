"""补齐内嵌字体缺失字形，再重打制作名单补丁。

策略：从系统 SimHei 取 制/b/y/Z/X/R 的轮廓（TrueType qCurve 与 Flash 的
quadratic 曲线同构，可直译），以 DefineFont3 的样式重建整个 DefineFont3 tag：
  - 保留原有 211 个字形
  - 追加缺失字形
  - 重建 codeTable，把新字符映射到新 gid
SYMBOLCLASS 不变（字体的 fontId 110 仍指向同一 characterID）。
"""
import struct, sys
from fontTools.ttLib import TTFont
from fontTools.pens.recordingPen import RecordingPen

SWF_IN = 'game.swf'
FONT_OUT = 'patched/game_remaster.swf'

FONT_CID = 110
NEW_CHARS = "制byZXR"


# ---------------- SWF tag 工具 ----------------
def pack_tag(code, data):
    n = len(data)
    if n < 0x3f:
        return struct.pack('<H', (code << 6) | n) + data
    return struct.pack('<H', (code << 6) | 0x3f) + struct.pack('<I', n) + data


def iter_tags(buf):
    p = 0
    while p + 2 <= len(buf):
        th = struct.unpack('<H', buf[p:p + 2])[0]; p += 2
        code = th >> 6; ln = th & 0x3f
        if ln == 0x3f:
            ln = struct.unpack('<I', buf[p:p + 4])[0]; p += 4
        yield code, p, buf[p:p + ln]
        p += ln
        if code == 0:
            return


# ---------------- 1. 解析原 DefineFont3 ----------------
body = open(SWF_IN, 'rb').read()[8:]
n0 = body[0] >> 3
hdr = (5 + 4 * n0 + 7) // 8 + 4
font_tag_off = font_tag_len = None
for code, off, data in iter_tags(body[hdr:]):
    if code == 75 and len(data) >= 2 and struct.unpack('<H', data[:2])[0] == FONT_CID:
        font_tag_off = hdr + off
        font_tag_len = len(data)
        break
assert font_tag_off, '未找到 DefineFont3(110)'
raw = body[font_tag_off:font_tag_off + font_tag_len]

# 头部：fontId(2) flags(1) nameLen(1) name(n) numGlyphs(2)
fontId = struct.unpack('<H', raw[0:2])[0]
flags = raw[2]
nameLen = raw[3]
fontName = raw[4:4 + nameLen]
q = 4 + nameLen
numGlyphs = struct.unpack('<H', raw[q:q + 2])[0]
q += 2
print(f"原字体: id={fontId} flags=0x{flags:02x} name={fontName!r} numGlyphs={numGlyphs}")

wide = bool(flags & 0x08)     # WideOffsets
bp = 2 if wide else 4
offs = []
for i in range(numGlyphs + 1):
    offs.append(struct.unpack('<H' if bp == 2 else '<I', raw[q + bp * i:q + bp * (i + 1)])[0])
codeTableOffset = offs[0]
base = q + bp * (numGlyphs + 1)

glyph_shapes = []
for i in range(numGlyphs):
    s, e = offs[i + 1], offs[i + 2]
    glyph_shapes.append(raw[base + s:base + e])
print("原字形数据总长:", sum(len(g) for g in glyph_shapes), " 首个非空:", len(next(g for g in glyph_shapes if g)))

# 原 codeTable：UI16 数量 + codeUnits
ct = raw[base + codeTableOffset:]
nCodes = struct.unpack('<H', ct[0:2])[0]
codes = list(struct.unpack('<%dH' % nCodes, ct[2:2 + nCodes * 2]))
print("原 codeTable:", nCodes, "个码位")
gid_of_code = {}
for gid, c in enumerate(codes):
    gid_of_code.setdefault(c, gid + 1)   # gid 0 是 .notdef

# ---------------- 2. 从 SimHei 取新字形轮廓 ----------------
src = TTFont('C:/Windows/Fonts/simhei.ttf')
scmap = {}
for t in src['cmap'].tables:
    if t.isUnicode():
        scmap.update(t.cmap)
sgs = src.getGlyphSet()
UPEM_SRC = src['head'].unitsPerEm          # 256
UPEM_DST = 1024                            # DefineFont3 惯例

def num_bits(v, signed=True, min_bits=2):
    if signed:
        v = abs(v)
        n = 1
        while True:
            lo = -(1 << (n - 1))
            hi = (1 << (n - 1)) - 1
            if lo <= v <= hi:
                return max(n, min_bits)
            n += 1
    else:
        return max(v.bit_length(), min_bits)

def sbits(v, n):
    return format(v & ((1 << n) - 1), '0{}b'.format(n))

def encode_shape(pen_value):
    """把 RecordingPen 的 qCurve 描线编码成 DefineFont3 的 SHAPE 结构"""
    pts = []          # (x, y, onCurve)
    ends = []         # 每个子路径最后一点的索引
    for op, args in pen_value:
        if op == 'moveTo':
            x, y = args[0]
            pts.append((round(x), round(y), True))
        elif op == 'lineTo':
            x, y = args[0]
            pts.append((round(x), round(y), True))
        elif op == 'qCurveTo':
            for a in args[:-1]:
                if a is None:
                    continue
                pts.append((round(a[0]), round(a[1]), False))
            last = args[-1]
            if last is not None:
                pts.append((round(last[0]), round(last[1]), True))
        elif op == 'closePath':
            if pts:
                ends.append(len(pts) - 1)
        elif op == 'endPath':
            if pts and (not ends or ends[-1] != len(pts) - 1):
                ends.append(len(pts) - 1)
    if not pts:
        return b''
    if not ends or ends[-1] != len(pts) - 1:
        ends.append(len(pts) - 1)

    xs = [p[0] for p in pts] + [0]
    ys = [p[1] for p in pts] + [0]
    xmin, xmax, ymin, ymax = min(xs), max(xs), min(ys), max(ys)
    nbx = num_bits(max(abs(xmin), abs(xmax)))
    nby = num_bits(max(abs(ymin), abs(ymax)))

    out = bytearray()
    # numFillBits=1, numLineBits=1
    out += bytes([0x01])
    # 一个填充样式（solid），一个线样式
    out += bytes([0x00])                 # fill type 0x00 = solid
    out += struct.pack('>H', 0x0000)     # RGB black（颜色由 textColor 覆盖）
    out += struct.pack('>H', 20)         # line width

    # 位流
    bits = []
    bits.append(sbits(1, 4))             # NumFillBits = 1
    bits.append(sbits(1, 4))             # NumLineBits = 1
    start = 0
    for e in ends:
        sub = pts[start:e + 1]
        start = e + 1
        if not sub:
            continue
        x0, y0, _ = sub[0]
        bits.append('1')                                  # StateMoveTo
        bits.append(sbits(nbx, 5) + sbits(x0, nbx))
        bits.append(sbits(nby, 5) + sbits(y0, nby))
        # 样式
        bits.append(sbits(1, 1))          # FillStyle1 = 1
        bits.append('0')                  # FillStyle0 = 0
        bits.append(sbits(1, 1))          # LineStyle = 1
        prev = (x0, y0)
        for (x, y, on) in sub[1:]:
            bits.append('1' if on else '0')
            bits.append(sbits(x - prev[0], nbx))
            bits.append(sbits(y - prev[1], nby))
            prev = (x, y)
    # 结束：位数足够表示 0 即可
    bits.append(sbits(0, 4))              # NumFillBits = 0
    bits.append(sbits(0, 4))              # NumLineBits = 0
    blob = ''.join(bits)
    blob += '0' * ((8 - len(blob) % 8) % 8)
    out += bytes(int(blob[i:i + 8], 2) for i in range(0, len(blob), 8))
    return bytes(out)

new_shapes = {}
for ch in NEW_CHARS:
    code = ord(ch)
    if code in gid_of_code:
        continue
    gname = scmap[code]
    pen = RecordingPen()
    sgs[gname].draw(pen)
    # 缩放到 1024 em
    scaled = []
    for op, args in pen.value:
        if op in ('moveTo', 'lineTo'):
            scaled.append((op, tuple((a[0] * UPEM_DST / UPEM_SRC, a[1] * UPEM_DST / UPEM_SRC) for a in args)))
        elif op == 'qCurveTo':
            scaled.append((op, tuple(None if a is None else (a[0] * UPEM_DST / UPEM_SRC, a[1] * UPEM_DST / UPEM_SRC) for a in args)))
        else:
            scaled.append((op, args))
    new_shapes[code] = encode_shape(scaled)
    print(f"  新增 {ch!r} U+{code:04X} 轮廓 {len(new_shapes[code])} bytes")

# ---------------- 3. 重建 DefineFont3 ----------------
all_shapes = list(glyph_shapes)
new_codes = list(codes)
for ch in NEW_CHARS:
    code = ord(ch)
    if code in gid_of_code:
        continue
    all_shapes.append(new_shapes[code])
    new_codes.append(code)
    gid_of_code[code] = len(all_shapes)   # gid = 索引 + 1? 见下

# 重新计算 gid：字形切片索引 0..n-1 对应 gid 1..n
gid_of_code.clear()
for i, c in enumerate(new_codes):
    gid_of_code.setdefault(c, i + 1)

new_count = len(all_shapes)
print("新 numGlyphs:", new_count, " 新 codeTable:", len(new_codes))

# 断言所有偏移 <= 65535（UI16）
shape_offsets = []
acc = 0
for g in all_shapes:
    shape_offsets.append(acc)
    acc += len(g)
shape_offsets.append(acc)
code_table_offset = acc
assert max(shape_offsets) <= 0xFFFF, f"偏移溢出: {max(shape_offsets)}"
assert acc + 2 + len(new_codes) * 2 <= 0xFFFF, "整体超出 UI16 偏移范围"

out = bytearray()
out += struct.pack('<H', fontId)
out += bytes([flags & ~0x08])         # 清 WideOffsets -> UI16 偏移
out += bytes([nameLen]) + fontName
out += struct.pack('<H', new_count)
# DefineFont3 的偏移表：numGlyphs+1 项，首项是 codeTableOffset 的占位
offs = [code_table_offset] + [0] * new_count
for i in range(new_count):
    offs[i] = shape_offsets[i]
offs[0] = code_table_offset
# 结构：numGlyphs 个偏移 + codeTableOffset 在最后
table = [shape_offsets[i] for i in range(new_count)]
for o in table:
    out += struct.pack('<H', o)
for g in all_shapes:
    out += g
out += struct.pack('<H', len(new_codes))
for c in new_codes:
    out += struct.pack('<H', c)

new_font_tag = pack_tag(75, bytes(out))
print(f"新 DefineFont3 tag: {len(new_font_tag)} bytes（原 {font_tag_len + 6}）")

# ---------------- 4. 写回 SWF ----------------
whole = open(SWF_IN, 'rb').read()
prefix = whole[:8 + font_tag_off]
suffix = whole[8 + font_tag_off + font_tag_len:]
res = bytearray(prefix) + new_font_tag + bytearray(suffix)
res[4:8] = struct.pack('<I', len(res))
open(FONT_OUT, 'wb').write(bytes(res))
print("写出", FONT_OUT, len(res), "bytes")
