# V8 Windows x64 build

## 状态

`BLOCKED`。

存在两个彼此独立的阻塞项：

1. V8 source checkout 文档要求 Windows 使用当前 Chromium Windows 指南。该指南在 2026-09-20 要求 Visual Studio 2026（>=18.0.0）、Desktop development with C++ + MFC/ATL、Windows 11 SDK 10.0.28000.2270，并要求 Debugging Tools 10.0.26100.3323 或更高。本机只有 VS 2022 17.14.41、MSVC 19.44、SDK 10.0.26100.0，ATL/MFC 与 Debugging Tools 未安装，因此不满足当前官方工具链要求。
2. depot_tools 无法连接官方 CIPD 服务完成 bootstrap；同时 `chromium.googlesource.com` 的 Git/HTTPS 端点持续超时。

因此本阶段没有开始 `fetch v8`，没有 current checkout，也没有生成 `d8.exe`。

这符合 V8 官方要求：用于构建的 checkout 不能用一个裸 `git clone` 代替，必须由 depot_tools/gclient 获取并同步依赖。[V8 source checkout 文档](https://v8.dev/docs/source-code)明确要求 Windows 先配置 Git、Visual Studio、Windows debugging tools 和 depot_tools，并提醒不要直接 clone V8 仓库。

## 下载前环境检查

原始记录：[`v8_preflight.txt`](../results/raw/v8_preflight.txt)。

| 项目 | 初始状态 | 当前状态 |
|---|---|---|
| Visual Studio / Build Tools | 未安装 | VS 2022 17.14.41 已安装于 `F:\VSBuildTools`，但当前要求是 VS 2026 >=18.0：`NOT_MET` |
| Desktop C++ / ATL/MFC | 未安装 | VS 2022 `VCTools` 可用；当前要求的 VS 2026 NativeDesktop 与 `VC.ATLMFC`：`NOT_FOUND` |
| MSVC | `NOT_FOUND` | 19.44.35229.0 可用，但属于不满足当前版本门禁的 VS 2022 toolset |
| Windows SDK | 不可用 | 10.0.26100.0 可用；当前要求 10.0.28000.2270：`NOT_MET` |
| Debugging Tools for Windows | 未安装 | `NOT_FOUND`；当前官方文档要求 >=10.0.26100.3323 |
| Git | 2.38.1.windows.1 | 可用 |
| Python | 3.11.4 | 可用 |
| depot_tools | 未安装 | 官方 bundle 已安装，但 CIPD bootstrap 未完成 |
| Disk | 最大单盘空闲为 `F:` 73.25 GiB | 阶段结束时 `F:` 69.81 GiB；未下载 V8 |

当前 Chromium Windows 指南给出至少 100 GB NTFS 空闲空间建议。该数字面向 Chromium checkout；V8-only 的实际需求没有在本阶段实测，因此这里只记录为高风险，不自行推测足够或不足。[当前 Windows build instructions](https://chromium.googlesource.com/chromium/src/+/HEAD/docs/windows_build_instructions.md)

已从微软官方下载页取得 VS 2026 Build Tools 稳定引导程序 `18.10.12210.168`，Authenticode 为 Microsoft Corporation 且有效，SHA-256 为 `c71a953a56448193b971b21a5a79ed8c32b4376b9e88fb0365e5c46a6013a804`。静默安装因 UAC 操作被取消而失败（`0x80070642`）；`vswhere` 复核没有新增 VS 2026 instance。没有据此继续尝试 SDK 28000 安装；记录哈希后已删除临时引导程序缓存。

## depot_tools

- 官方 Git clone 地址连续两次连接 `chromium.googlesource.com:443` 超时。
- 随后使用 Google 官方存储端点提供的 depot_tools bundle：`https://storage.googleapis.com/chrome-infra/depot_tools.zip`；该路径只用于恢复完整 depot_tools 仓库元数据，不能替代后续 `fetch`/`gclient sync`。
- Bundle SHA-256：`17b729b8c0164eb8374778735d86c4a6d7736a0be8711faeb47eb950feef176d`。
- depot_tools revision：`0306e4682b4ac35287c726fa35a983157a625902`。
- `.git` 目录已保留，自动更新被关闭以固定 revision。
- `gclient`/`cipd_bin_setup.bat` 无法完成；直接探测官方 CIPD endpoint `https://chrome-infra-packages.appspot.com` 在 20 秒连接超时，curl exit 28。

因此 GN、vpython 等官方组件未完成引导，不能继续 `fetch v8` 或 `gclient sync`。

## V8 commit

- 阶段 1 候选 commit：`68a0ee4aa9a2cba8a43cbd1ed1700828adad618f`。
- 本阶段实际 checkout commit：`UNKNOWN`。

候选值没有被 current checkout 验证，所以不能把它写成已构建版本。构建脚本将它作为预期 commit；网络恢复后必须由 `git rev-parse HEAD` 实际确认。

## 计划中的 Release build

可复现脚本：[`build_v8_windows.ps1`](../scripts/build_v8_windows.ps1)。脚本只允许 depot_tools 的 `fetch v8` + `gclient sync` 流程，不包含直接 `git clone v8` 的后备路径。

脚本的 `-PreflightOnly` 会先强制检查 VS 2026 + ATL/MFC 与 SDK 28000，再检查 depot_tools 的 CIPD bootstrap 产物。当前执行会在 VS 版本门禁处明确报 `BLOCKED`，不会把 VS 2022 或仅有宿主工具链误记为完整预检通过。

计划 GN args：

```gn
is_debug = false
target_cpu = "x64"
v8_target_cpu = "x64"
is_component_build = false
v8_enable_trace_unoptimized = true
v8_enable_trace_ignition = true
v8_enable_trace_baseline_exec = true
```

最后三项用于本阶段的 interpreter/tier 诊断；这是 Release optimized 诊断构建，不应在未评估 tracing support 开销前直接作为正式 benchmark binary。

计划命令：

```text
fetch --nohooks v8
git checkout --detach 68a0ee4aa9a2cba8a43cbd1ed1700828adad618f
gclient sync -D
gn gen out\x64.release
autoninja -C out\x64.release d8
```

官方构建文档给出的高层入口是 `tools/dev/gm.py x64.release`；本脚本使用其底层 GN/Ninja 路径，以便固定和保存 GN args。[V8 build 文档](https://v8.dev/docs/build)

## 未获得的构建记录

| 项目 | 当前值 |
|---|---|
| Actual V8 commit | `UNKNOWN` |
| Bundled Clang revision/version | `UNKNOWN` |
| Final GN args from checkout | `UNKNOWN` |
| Build command execution | 未执行 |
| `d8.exe` size | `UNKNOWN` |
| `d8.exe` SHA-256 | `UNKNOWN` |

没有下载 V8，没有运行 SunSpider，QuickJS baseline 未改变。
