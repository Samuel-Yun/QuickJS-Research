# V8 官方预编译 Windows x64 artifact

## 状态

`ARTIFACT_ACQUIRED`。

V8 `15.6.21` 的 Windows x64 Release artifact 已从 Google 官方 `chromium-v8` Cloud Storage 渠道取得、解包并固定。版本命令与最小 JavaScript smoke test 均通过。

这只解除“没有可运行 d8/V8 shell”的阻塞，不等于 Ignition-only 已验证。当前尚未保存 flag dump、bytecode evidence 或 tier trace，因此正式 interpreter-only 命令仍为 `BLOCKED`，也不得开始 benchmark。

## 本机与 jsvu

| 项目 | 值 |
|---|---|
| Windows target | `win64` / x64 |
| Node.js | `v18.12.1` |
| npm | `8.19.2` |
| jsvu | `3.0.5`，通过固定版本 `npx --yes jsvu@3.0.5` 获取 |
| jsvu repository | <https://github.com/GoogleChromeLabs/jsvu> |
| jsvu npm package | <https://www.npmjs.com/package/jsvu> |

没有安装或下载 QuickJS-ng、JSC 或其他 jsvu engine。

## 版本查询与固定

`jsvu@3.0.5` 的 `engines/v8/get-latest-version.js` 对 `win64` 查询：

```text
https://storage.googleapis.com/chromium-v8/official/canary/v8-win64-rel-latest.json
```

2026-09-20 的实际响应：

```json
{"version": "15.6.21"}
```

随后立即将版本固定为 `15.6.21`。不再运行会跟随 latest 的 `jsvu --os=win64 --engines=v8`，也不允许自动更新该 artifact。

## 下载来源

jsvu 预测的精确 archive URL：

```text
https://storage.googleapis.com/chromium-v8/official/canary/v8-win64-rel-15.6.21.zip
```

来源为 Google 控制的 `storage.googleapis.com/chromium-v8/official/canary`。这是名称带 `rel` 的 canary Release artifact，不宣称为 Chrome stable channel。

jsvu 自身的 archive 下载在建立 HTTPS 连接后长时间无字节进度，因而被终止。按照实验方案允许的 fallback，使用 jsvu 预测出的同一官方 URL 通过 `curl --ipv4` 直接下载；没有换用第三方镜像或不同 binary。

下载时取得的 HTTP 元数据：

| 项目 | 值 |
|---|---|
| Content-Length | `17,273,292` bytes |
| Last-Modified | `Sat, 19 Sep 2026 13:06:44 GMT` |
| ETag | `a3622eb60fe84909ee3ab584c0b2a81c` |
| Archive SHA-256 | `c36f9ddeec335dcf45735c91c930f99971504259f865a39d9c6ddf0b4a9b119f` |

本地保留的原始 archive：

```text
C:\Users\mzyx\Desktop\0921\js-interpreter-bench\engines\v8-official-15.6.21\archive\v8-win64-rel-15.6.21.zip
```

## 固定 artifact 清单

artifact root：

```text
C:\Users\mzyx\Desktop\0921\js-interpreter-bench\engines\v8-official-15.6.21
```

| 文件 | 大小（bytes） | SHA-256 | 用途 |
|---|---:|---|---|
| `runtime/d8.exe` | 34,526,208 | `1808fe93e1838ba0a0489363fddb1a0399da99c533f537c39b621e4a55cf7d87` | 正式 V8 shell binary |
| `runtime/icudtl.dat` | 10,819,840 | `495c45cc7a65562ec461f860c310c6b66e006acd96833f61d1aa31f77fe18cf1` | ICU data companion |
| `runtime/snapshot_blob.bin` | 374,368 | `900160d7d689b8e7b0c71c5f164a045b608bf5504329ad6dcba8e526ed6df975` | startup snapshot；运行时显式传入 |
| `runtime/v8_build_config.json` | 1,503 | `a738030bfb477382f429f46fc66d75c267b79574760037274174ead2f8935a7e` | 官方 archive 内的 build metadata |
| `archive/v8-win64-rel-15.6.21.zip` | 17,273,292 | `c36f9ddeec335dcf45735c91c930f99971504259f865a39d9c6ddf0b4a9b119f` | 原始官方 archive |

archive 中没有 `natives_blob.bin`。PE import table 还列出 Windows 系统 DLL：`ADVAPI32.dll`、`dbghelp.dll`、`SHELL32.dll`、`KERNEL32.dll`、`WINMM.dll`、`ntdll.dll`、`api-ms-win-core-synch-l1-2-0.dll`。

`d8.exe` 没有 Authenticode signature，也没有 PE FileVersion/ProductVersion 字段；来源可信度因此依赖 HTTPS 官方 archive URL、保留的原始 ZIP 及 SHA-256，而不是文件签名。

## build metadata

`v8_build_config.json` 确认：

- `arch/current_cpu/target_cpu/v8_target_cpu = x64`；
- `clang = true`；
- `component_build = false`；
- `debug_code = false`、`DEBUG_defined = false`、`full_debug = false`；
- `has_maglev = true`、`has_turbofan = true`、`sparkplug_plus = true`；
- `has_jitless = false`；
- `official_build = false`。

最后一项是 archive 自带的 GN build metadata，必须如实保留。它不改变下载渠道属于 Google 官方 `chromium-v8/official` 的事实，但也不能被改写成 `official_build=true`。该 binary 是否能可靠限制为纯 Ignition，必须在下一项独立验证中由实际 flag 和运行证据决定。

## 不使用 jsvu wrapper

官方 ZIP 内的 shell 名为 `d8.exe`。jsvu 的 Windows extraction 逻辑会把它重命名为 `v8-15.6.21.exe`，再生成 `v8-15.6.21.cmd` wrapper，并向 binary 传入 `--snapshot_blob=...`。

本次 jsvu 下载在 extraction 前失败，所以 `C:\Users\mzyx\.jsvu` 下没有生成 wrapper 或 engine binary。正式实验不依赖该目录，直接使用保留原名的官方 `d8.exe`：

```powershell
$runtime = 'C:\Users\mzyx\Desktop\0921\js-interpreter-bench\engines\v8-official-15.6.21\runtime'
& "$runtime\d8.exe" "--snapshot_blob=$runtime\snapshot_blob.bin" script.js
```

`icudtl.dat` 必须与 `d8.exe` 一起保留在 runtime artifact 中。不得把 `.cmd` wrapper、Node.js 或其他宿主作为正式实验 binary。

## 版本与 smoke test

实际输出：

```text
V8 version 15.6.21
VERSION_EXIT=0
V8_PREBUILT_SMOKE=PASS total=10
SMOKE_EXIT=0
```

smoke 脚本为 [`scripts/v8_prebuilt_smoke.js`](../scripts/v8_prebuilt_smoke.js)，原始记录为 [`results/raw/v8_prebuilt_smoke.txt`](../results/raw/v8_prebuilt_smoke.txt)。该操作只是功能验证，不是 benchmark。

## 冻结规则

1. 正式使用前重新核对 `d8.exe`、`icudtl.dat`、`snapshot_blob.bin` 和原始 ZIP 的 SHA-256。
2. 不再用 jsvu latest 更新此目录；若研究新版本，必须建立新的版本化 artifact 目录与独立记录。
3. 不修改、重命名或重新打包 runtime 文件。
4. interpreter-only 验证通过前，不运行 SunSpider 或其他正式 benchmark。

