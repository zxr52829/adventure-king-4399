"""在 4399《冒险王》制作名单面板追加 “游戏重制 by ZXR”。

踩坑记录（按发生顺序）：
  1. glyphIndex/glyphAdvance 是 UI16 → 必须 <= 65535；ADV=340 是导出后的缩放值，
     tag 里原值是 8704（=340*25.6，单位 em/1024）。写成 340 直接把后面的字段顶爆。
  2. MATRIX 位序是 hasScale(1) | hasRotate(1) | nTranslateBits(5)，写反会让
     TEXTRECORD 从错误位置开始读，FFDec 报 Premature end of stream。
  3. DefineText 必须插在首个 ShowFrame 之前（Flash 按帧序解析定义）。
  4. 单条 TEXTRECORD 承载有限（GLYPHENTRY 4 字节 + 样式头），长行必须拆多条。
  5. 本 SWF 每个 DefineSprite 开头有一个 9 字节的循环引用 PlaceObject2，
     原样保留即可，不要当成异常。
"""
import struct
from fontTools.ttLib import TTFont

SRC = 'game.swf'
OUT = 'patched/game_remaster.swf'
SPRITE_ID = 2744
FONT_ID = 110
ADV_EM = 8704          # 与原生名单一致：原 tag 中 glyphAdvance=8704
HEIGHT_EM = 8704
Y_OFF_EM = 7680        # 首行原值，行距约 83456/25.6
GLYPHS_PER_RECORD = 2
TEXT = "游戏重制 by ZXR"


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
        yield code, buf[p:p + ln]
        p += ln
        if code == 0:
            return


def sbits(v, n):
    return format(v & ((1 << n) - 1), '0{}b'.format(n))


def rect_bytes(vals):
    n = 1
    for v in vals:
        n = max(n, abs(v).bit_length() + 1)
    bits = format(n, '05b') + ''.join(sbits(v, n) for v in vals)
    bits += '0' * ((8 - len(bits) % 8) % 8)
    return bytes(int(bits[i:i + 8], 2) for i in range(0, len(bits), 8))


def matrix_identity():
    bits = format(0, '01b') + format(0, '01b') + format(0, '05b')
    bits += '0' * ((8 - len(bits) % 8) % 8)
    return bytes(int(bits[i:i + 8], 2) for i in range(0, len(bits), 8))


# ---------- 字形 ----------
font = TTFont('ffdec_font/110_黑体.ttf')
order = font.getGlyphOrder()
name2uni = {}
for t in font['cmap'].tables:
    for u, n in t.cmap.items():
        name2uni.setdefault(n, u)
uni2gid = {}
for gid, n in enumerate(order):
    u = name2uni.get(n)
    if u is not None and u not in uni2gid:
        uni2gid[u] = gid

gids, missing = [], []
for ch in TEXT:
    gid = uni2gid.get(ord(ch))
    if gid is None:
        missing.append(ch); gid = 0
    gids.append(gid)
print("文本:", TEXT)
print("glyph:", gids, " (>65535 会溢出 UI16)")
assert all(0 <= g <= 65535 for g in gids)
print("字体缺字（gid0 占位，显示为空白）:", missing)

# ---------- 组装 ----------
width = 32 + ADV_EM * len(gids)
payload = rect_bytes([0, width, -64, Y_OFF_EM + HEIGHT_EM])
payload += matrix_identity()

for i in range(0, len(gids), GLYPHS_PER_RECORD):
    chunk = gids[i:i + GLYPHS_PER_RECORD]
    rec = bytearray()
    rec.append(0x80 | 0x08 | 0x04 | 0x20)     # hasFont | hasColor | hasYOffset
    rec += struct.pack('<H', FONT_ID)
    rec += bytes([0x00, 0x00, 0xFF, 0x00])    # 红
    rec += struct.pack('<h', Y_OFF_EM)
    rec.append(len(chunk))
    for g in chunk:
        rec += struct.pack('<HH', g, ADV_EM)
    payload += struct.pack('<H', len(rec)) + bytes(rec)
payload += b'\x00\x00'
print("payload:", len(payload), "bytes")

# ---------- 重建 ----------
raw = open(SRC, 'rb').read()
assert raw[:3] == b'FWS'
orig = raw[8:]
n0 = orig[0] >> 3
hdr = (5 + 4 * n0 + 7) // 8 + 4
top = list(iter_tags(orig[hdr:]))

CID_CODES = {2, 6, 11, 20, 21, 22, 32, 33, 34, 35, 36, 37, 39, 45, 48, 75, 76, 83, 87, 90}
NEW_CID = max(struct.unpack('<H', d[:2])[0] for c, d in top if c in CID_CODES and len(d) >= 2) + 1
NEW_TAG = pack_tag(11, struct.pack('<H', NEW_CID) + payload)
print("新 characterID:", NEW_CID)

out = bytearray(raw[:8]) + bytearray(orig[:hdr])
rebuilt = 0
for code, data in top:
    if code == 39 and len(data) >= 4 and struct.unpack('<H', data[:2])[0] == SPRITE_ID:
        out += NEW_TAG
        sid, fcount = struct.unpack('<HH', data[:4])
        body = bytearray(struct.pack('<HH', sid, fcount + 1))
        placed = False
        for c, d in iter_tags(data[4:]):
            if c == 1 and not placed:
                po = bytearray([0x06])
                po += struct.pack('<H', 130)
                po += struct.pack('<H', NEW_CID)
                po += matrix_identity()
                body += pack_tag(26, bytes(po))
                placed = True
            body += pack_tag(c, d)
        assert placed
        out += pack_tag(39, bytes(body))
        rebuilt += 1
    else:
        out += pack_tag(code, data)

assert rebuilt == 1
out[4:8] = struct.pack('<I', len(out))
open(OUT, 'wb').write(bytes(out))
print(f"写出 {OUT}: {len(out)} bytes")
