import zlib, struct, sys
d = open('game.swf','rb').read()
sig = d[:3]
ver = d[3]
flen = struct.unpack('<I', d[4:8])[0]
if sig == b'FWS':
    body = d[8:]
elif sig == b'CWS':
    body = zlib.decompress(d[8:])
elif sig == b'ZWS':
    body = __import__('lzma').decompress(d[12:])
print("sig", sig, "version", ver, "header_len", flen, "actual", len(d), "body", len(body))
pos = 0
n_rect = (struct.unpack('>I', b'\x00' + body[0:3])[0] >> 27) if False else None
# parse RECT bit length
b0 = body[0]
nbits = b0 >> 3
rect_bytes = (5 + 4*nbits + 7)//8
pos = rect_bytes
frate = struct.unpack('<H', body[pos:pos+2])[0]; pos += 2
frames = struct.unpack('<H', body[pos:pos+2])[0]; pos += 2
print("rect_bytes", rect_bytes, "fps_raw", frate, "fps", (frate & 0xff) + ((frate >> 8)/256), "frames", frames)
tags = []
while pos + 2 <= len(body):
    th = struct.unpack('<H', body[pos:pos+2])[0]; pos += 2
    code = th >> 6
    ln = th & 0x3f
    if ln == 0x3f:
        ln = struct.unpack('<I', body[pos:pos+4])[0]; pos += 4
    tags.append((code, ln))
    pos += ln
    if code == 0:
        break
print("tag count", len(tags), "consumed", pos)
from collections import Counter
c = Counter(t[0] for t in tags)
names = {0:'End',1:'ShowFrame',2:'DefineShape',4:'PlaceObject',5:'RemoveObject',6:'DefineBits',7:'DefineButton',9:'SetBackgroundColor',10:'DefineFont',11:'DefineText',12:'DoAction',14:'DefineSound',15:'StartSound',20:'DefineBitsLossless',21:'DefineBitsJPEG2',22:'DefineShape2',24:'Protect',26:'PlaceObject2',32:'DefineShape3',33:'DefineText2',34:'DefineButton2',35:'DefineBitsJPEG3',36:'DefineBitsLossless2',37:'DefineEditText',39:'DefineSprite',43:'FrameLabel',45:'SoundStreamHead',46:'SoundStreamBlock',48:'DefineFont2',56:'ExportAssets',57:'ImportAssets',59:'DoInitAction',60:'DefineVideoStream',61:'VideoFrame',65:'ScriptLimits',69:'FileAttributes',70:'PlaceObject3',73:'DefineFontAlignZones',74:'CSMTextSettings',75:'DefineFont3',76:'SymbolClass',77:'Metadata',82:'DoABC',83:'DefineShape4',86:'DefineSceneAndFrameLabelData',87:'DefineBinaryData',88:'DefineFontName',89:'StartSound2',90:'DefineBitsJPEG4',91:'DefineFont4'}
for code, n in sorted(c.items(), key=lambda x:-x[0]):
    print(f"  tag {code:3d} {names.get(code,'?'):28s} x{n}")
