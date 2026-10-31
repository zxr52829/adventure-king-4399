import sys, struct, re, json
sys.stdout.reconfigure(encoding='utf-8', errors='replace')
from fontTools.ttLib import TTFont

SWF = 'game.swf'
body = open(SWF, 'rb').read()[8:]

# ---- 遍历顶层 tag ----
nbits = body[0] >> 3
pos = (5 + 4 * nbits + 7) // 8 + 4
tags = []
while pos + 2 <= len(body):
    th = struct.unpack('<H', body[pos:pos+2])[0]; pos += 2
    code = th >> 6; ln = th & 0x3f
    if ln == 0x3f:
        ln = struct.unpack('<I', body[pos:pos+4])[0]; pos += 4
    tags.append((code, pos, ln)); pos += ln
    if code == 0: break

def iter_tags(buf):
    p = 0
    while p + 2 <= len(buf):
        th = struct.unpack('<H', buf[p:p+2])[0]; p += 2
        c = th >> 6; l = th & 0x3f
        if l == 0x3f:
            l = struct.unpack('<I', buf[p:p+4])[0]; p += 4
        yield c, p, l
        p += l
        if c == 0: break

def sprite_body(buf):
    """跳过 sprite header (spriteId + frameCount) 之后的 tag 流"""
    return buf[4:]

# ---- 字体 glyph 表 ----
font_glyphs = {}   # fontId -> list of unicodes (index = glyphIndex)
f = TTFont('ffdec_font/110_黑体.ttf')
order = f.getGlyphOrder()
cmap = {}
for t in f['cmap'].tables: cmap.update(t.cmap)
rev = {}
for u, g in cmap.items(): rev.setdefault(g, u)
font_glyphs[110] = [rev.get(n) for n in order]

# ---- 收集所有 DefineText，识别“制作名单”那几条 ----
maker_ids = set()
texts = {}
for c, p, l in tags:
    if c == 3:  # DefineShape
        pass

def parse_define_text(raw, chid):
    nb = raw[2] >> 3
    rect_len = (5 + 4 * nb + 7) // 8
    q = 2 + rect_len + 8   # skip RECT + MATRIX(hasScale/hasRotate=0, translate=0)
    # textMatrix: 2 flags bytes + if scale 4 bytes + if rotate 4 bytes + nTranslateBits
    m = raw[2+rect_len:]
    f1 = m[0]; f2 = m[1]
    qq = 2
    if f1 & 0x01: qq += 4
    if f2 & 0x01: qq += 4
    ntb = m[qq]; qq += 1
    tb_bytes = (ntb + 7) // 8 * 2
    qq += tb_bytes
    base = 2 + rect_len + qq
    # text records
    out = []
    r = base
    end = len(raw)
    while r + 2 <= end:
        rl = raw[r]; r += 1
        if rl == 0: break
        rec = raw[r:r+rl]
        # textRecord: flags1, if hasFont fontID(2), if hasColor RGBA(4), if hasX xOffset(2), if hasY yOffset(2), ... glyphCount
        i = 0
        fl = rec[i]; i += 1
        fid = None
        if fl & 0x08:   # hasFont
            fid = struct.unpack('<H', rec[i:i+2])[0]; i += 2
        if fl & 0x04:   # hasColor  (styleFlagsHasColor 通常是 bit2)
            pass
        # 精确标志位：基于 SWF 规范 TEXTRECORD flags: 0x01 hasFont? 这里用 ffdec 已正确解析的结果更稳
        r += rl
        out.append((fl, fid))
    return out

# 直接复用 ffdec 的导出：扫描 ffdec_text 中已知名单文本，反查 characterID
# 建立 chid -> 文本 的映射（用 gid 解码）
text_chids = {}
for c, p, l in tags:
    if c != 11: continue
    raw = body[p:p+l]
    chid = struct.unpack('<H', raw[0:2])[0]
    if 2700 <= chid <= 2760:
        text_chids[chid] = raw

# 解码 2739/2740/2741/2742/2743 字形，确认名单块
names = {}
for chid, raw in sorted(text_chids.items()):
    gids = []
    # 粗暴提取所有 glyphIndex（DefineText 里 GLYPHENTRY: 2bit flags + 6bit? 实际是 16bit index + 16bit advance）
    # 用 ffdec 已解析的 xml 更可靠：这里改成比对已导出的 txt
    pass

# ---- 名单文本元件（来自 ffdec 导出与 xml 交叉确认）----
MAKER_TEXT_CHIDS = [2739, 2740, 2741, 2742, 2743]
print("名单文本元件:", MAKER_TEXT_CHIDS)

# 记录 XML 中 2739-2743 的 tag 区间，用于 Patch 时定位
xml = open('xml/game.xml', encoding='utf-8').read()
print("找到 DefineTextTag 2739..2743:", [f'characterID="{i}"' in xml for i in MAKER_TEXT_CHIDS])
