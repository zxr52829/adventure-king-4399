# 冒险王（Super Tramper）— 4399 · 本地可运行版 + 逆向工程

把 4399 上的 Flash 小游戏《冒险王》从网页里完整取下来，做成一个离线的、双击就能玩的本地版本，同时把游戏本体反编译成可读的 ActionScript 3 源码。

4399 的页面标题叫「勇者之路」，但 SWF 内部的游戏本体是 **《冒险王 / Super Tramper》**。页面上游是别名，游戏是同一个。

---

## 这是什么

| 目录 | 内容 |
| --- | --- |
| `dist/` | **可玩版**。`index.html` + 原始 `game.swf` + Ruffle 运行时，纯前端，不需要 Flash 插件 |
| `ffdec_out/scripts/` | **361 个 `.as` 源文件**，从 SWF 的 AVM2 字节码反编译出来的完整 ActionScript 3 |
| `ffdec_out/images/` | 1048 张图（图集、立绘、UI） |
| `ffdec_out/sounds/` | 23 段音效 |
| `ffdec_out/symbolClass/symbols.csv` | 符号 ID → 类名映射，即库元件清单 |
| `ffdec_font/` | 7 个内嵌字体，导出为 `.ttf` |
| `ffdec_text/` | 63 个静态文本元件的内容 |
| `game.swf` | 原始样本（未修改），16.4 MB |
| `*.py` | 取样本、解析 SWF 结构、打补丁用的脚本 |

---

## 快速开始

**方式一：本地服务器（推荐）**

```bash
cd dist
python -m http.server 8765 --bind 127.0.0.1
```

然后浏览器打开 `http://127.0.0.1:8765/index.html`。

**方式二：直接双击 `dist/index.html`**

部分浏览器在 `file://` 协议下会拦截 WASM 加载，如果白屏就走方式一。

### 操作

- 画面按窗口等比缩放，右下角实时显示放大倍数
- 点「全屏」或按 `F` 键铺满屏幕
- 鼠标移到底部才显示工具条，不挡画面

---

## 源码在哪儿

从 SWF 里提取出来的源码按模块组织在 `ffdec_out/scripts/`：

| 文件 | 大小 | 作用 |
| --- | --- | --- |
| `levelDate.as` | 369 KB | 全部关卡、地图、怪物、掉落和数值配置（硬编码在代码里） |
| `roles/mainrole.as` | 37 KB | 主角：属性、成长、攻击判定 |
| `fightMain.as` | 29 KB | 战斗主循环、伤害结算 |
| `roles/allrole.as` | 21 KB | 角色基类 |
| `keyDealer.as` | 19 KB | 键盘输入 |
| `roles/enemys/bigrole1..7.as` | — | 七种 BOSS |
| `mapdealer.as` | 14 KB | 地图生成和小格逻辑 |
| `roles/pets/petrole*.as` | — | 宠物系统 |
| `Main.as` | 9.8 KB | 主入口、存档（`savedealer`）、场景管理 |
| `FWAd_AS3.as` | 61 KB | 4399 的广告框架，与游戏逻辑无关 |

想找某个功能：

```bash
cd ffdec_out/scripts
grep -rn "function " fightMain.as          # 战斗流程
grep -n "att1\|behit\|damage\|hp" levelDate.as | head   # 数值键名
sed -n '1,80p' roles/mainrole.as           # 主角属性结构
```

---

## 技术细节

### 怎么拿到 SWF 的

4399 的播放页把游戏地址藏在 JS 变量里：

```js
var _strGamePath = "/upload_swf/ftp2/haibo/20101207/4.swf";
```

真实域名在 `/js/server8.js` 里：

```js
var webServer = "//flashs1.4399.com/4399swf";
```

拼起来就是：

```
https://flashs1.4399.com/4399swf/upload_swf/ftp2/haibo/20101207/4.swf
```

### SWF 结构

```
格式      FWS（未压缩）
版本      9，AVM2（ActionScript 3）
大小      16,391,466 bytes
SHA-256   09b3d0860ab7ac51f7bae201f95e250f10a5734e59754c4af867ec92233530a8
帧数      13
标签总数  3189
```

标签分布（节选）：

```
DefineShape         1038     图形
DefineBitsLossless2  686     PNG 资源
DefineSprite         455     影片剪辑
DefineBitsJPEG3      354     JPEG 资源
PlaceObject2         187     舞台放置
DefineSound           22     音效
DoABC                  2     AS3 字节码（415 B + 216,056 B）
DefineFont3            7     内嵌字体
```

### 反编译

用 [JPEXS Free Flash Decompiler](https://github.com/jindrapetrik/jpexs-decompiler) 22.0.1：

```bash
java -jar ffdec-cli.jar -export script,image,sound,binaryData,symbolClass ./ffdec_out game.swf
```

FFDec 不在仓库里（20 MB，官方发布）。自己下载后解压到 `tools/ffdec/`，或者直接找你的本地安装路径。

### 补丁尝试（未完成，代码保留）

`patch_remaster.py` 和 `add_glyphs.py` 是往制作名单面板加一行署名的尝试，**目前没有成功**，`dist/game.swf` 里不含任何补丁。

卡点记录在这里，方便后来的人少走弯路：

1. 内嵌字体「黑体」只嵌了 188 个汉字，没有「制」「b」「y」「Z」「X」「R」。缺失的字形会渲染成空白。
2. 要补齐字形得重写整个 `DefineFont3` tag 的偏移表，这个文件的 `numGlyphs` 字段和实际结构对不上（读出来是 48612，实际约 211），偏移表解析反复出错。
3. `DefineText` 的坑：`glyphAdvance` 是 UI16，原值单位是 em/1024 下的 8704（不是导出后看到的 340）；`MATRIX` 位序是 `hasScale(1) | hasRotate(1) | nTranslateBits(5)`；每个 `DefineText` 必须插在首个 `ShowFrame` 之前。

---

## 版权与用途

**这不是我的作品。** 游戏的著作权归原作者所有：

- 主设计：半瓶神仙醋、肥牛烧烤
- 美术：九等、逍遥布袋、淡淡风、夏小猪、梆小梆、蒋浩然、陶陶、雪糕
- 程序：肥牛烧烤
- 场景编辑：轱辘辘
- 剧情：团子暖

4399 是发行方。Ruffle 是 MIT / Apache-2.0 双许可的开源项目。

本仓库的所有内容**仅用于学习与技术研究**（Flash 时代的 AVM2 逆向、SWF 格式解析、老游戏保存）。请勿用于商业用途、二次分发或任何形式的营利。如果权利人提出异议，仓库会立即删除。

如果你只想玩，请去 [4399 原页面](https://www.4399.com/flash/43841_1.htm) 支持原作者。

---

## 存档说明

本仓库**不包含任何游戏存档**（`.sol` 文件）。存档在 Ruffle 里默认存在浏览器的 Local Storage 中，属于本地数据，不入库。

---

## 环境

- Node.js 22+（仅 Python 快照脚本不需要）
- Python 3.10+（跑 `*.py` 需要 `fontTools`）
- 浏览器：Chrome / Edge 最新版（需要 WebAssembly 和 WebGL 支持）
- Ruffle 0.7.1（已内置于 `dist/ruffle/`）
