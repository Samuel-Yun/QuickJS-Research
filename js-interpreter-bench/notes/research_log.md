# 研究日志

本日志按时间顺序记录研究过程。无法验证的信息写为 `UNKNOWN`，不得猜测。每一步至少包含：日期、做了什么、命令、结果、问题、下一步。

## 日志模板

### YYYY-MM-DD — 标题

**做了什么**

说明本步目的和实际操作。

**命令**

```text
记录可复现的完整命令；未执行命令时写“无”。
```

**结果**

记录输出、退出状态、生成文件和证据位置。

**问题**

记录失败、风险、待验证事项；未知项明确标记为 `UNKNOWN`。

**下一步**

只记录建议动作，不把尚未执行的工作描述为已完成。

---

## 2026-09-20 — 初始化研究项目

**做了什么**

创建项目目录骨架、研究目标说明、实验协议和研究日志。未下载或编译任何引擎，未运行正式 benchmark，未修改任何引擎源码。

**命令**

```powershell
New-Item -ItemType Directory -Force -Path `
  'js-interpreter-bench', `
  'js-interpreter-bench\engines', `
  'js-interpreter-bench\benchmarks', `
  'js-interpreter-bench\scripts', `
  'js-interpreter-bench\results', `
  'js-interpreter-bench\results\raw', `
  'js-interpreter-bench\results\processed', `
  'js-interpreter-bench\notes', `
  'js-interpreter-bench\patches'
```

文档内容通过补丁方式写入 `README.md`、`notes/experiment_protocol.md` 和 `notes/research_log.md`。

**结果**

项目骨架和三份初始文档已创建。正式 benchmark 准入状态：`BLOCKED`。

**问题**

- 四个引擎的 version / commit：`UNKNOWN`。
- 各引擎解释器模式及其验证证据：`UNKNOWN`。
- CPU、OS、architecture、compiler/version：尚未采集。
- build flags、runtime flags：`UNKNOWN`。
- SunSpider 的精确来源和版本：`UNKNOWN`。

**下一步**

在下一阶段只做版本来源调查与解释器模式验证方案设计；经确认后再分别固定 engine commit、工具链和 SunSpider 版本。解释器模式完成验证前不运行正式 benchmark。

---

## 2026-09-20 — 阶段 1：平台与 interpreter-only 可行性调查

**做了什么**

只读采集当前主机的 OS、CPU、architecture、核心数、内存与工具链；从四个项目当前官方仓库、当前分支头、源码 flag/option 定义和官方构建文档核对 interpreter-only 可行性。未 clone/build V8 或 WebKit，未构建任何引擎，未运行 benchmark，未修改引擎源码。

**命令**

```powershell
Get-CimInstance Win32_OperatingSystem
Get-CimInstance Win32_Processor
[System.Runtime.InteropServices.RuntimeInformation]::OSArchitecture
Get-Command gcc, clang, python, python3, py, cmake, ninja, make, `
  mingw32-make, nmake, git, cl, clang-cl, msbuild, gn, autoninja, `
  gperf, bison, flex, perl, ruby, node -ErrorAction SilentlyContinue
gcc --version
python --version
cmake --version
mingw32-make --version
git --version
node --version
```

使用 `git ls-remote` 只读取 QuickJS、PrimJS 和 WebKit 分支头；V8 的 `main` commit 由官方 Gitiles 分支元数据确认。源码内容通过官方 GitHub/Gitiles 页面读取，没有建立本地大型 checkout。

**结果**

- 平台：Windows 11，x86-64，AMD Ryzen 7 5800H，8 核/16 线程，约 15.86 GiB RAM。
- 可用主要工具：GCC 13.1.0、Python 3.11.4、CMake 4.0.1、MinGW GNU Make 4.2.1、Git 2.38.1。
- 缺少 Clang、Visual Studio C++、Ninja、GN、autoninja 等大型引擎构建所需工具。
- 固定候选 commit：QuickJS `04be246...`；PrimJS `7e50bda...`；V8 `68a0ee4...`；WebKit `fd3406f...`。
- QuickJS 当前默认非 Emscripten 路径是 computed-goto direct dispatch。
- PrimJS Template Interpreter 只在当前规则允许的 arm64/预生成 `embedded.S` 目标启用；本机 Windows x86-64 只能落到 C++ switch fallback。
- V8 当前 `--jitless` 源码 implication 会关闭 Sparkplug、Maglev、TurboFan。
- JSC 当前 `useJIT=false` 会调用 `disableAllJITOptions()`，关闭 Baseline/DFG/FTL；x86-64 优化 LLInt 需避免被配置成 C-loop。
- 新增 `notes/platform.md` 与 `notes/engine_feasibility.md`。

**问题**

- 四套实际二进制均未建立，运行时 interpreter-only 证据仍为 `UNKNOWN`。
- PrimJS 优化 Template Interpreter 与当前主机架构不兼容，是当前实验设计的阻断问题。
- V8 与 JSC 的 Windows 构建依赖不齐；JSC 当前 main 的 Windows JSC-only 完整构建路径尚为 `UNKNOWN`。
- 正式 benchmark 准入状态仍为 `BLOCKED`。

**下一步**

按用户要求在阶段 1 停止，等待后续指令。若进入下一阶段，应先决定是否迁移到 PrimJS 支持的 arm64 共同平台，再逐一完成轻量构建与 interpreter-only 运行时验证；在验证通过前不运行正式 benchmark。

---

## 2026-09-20 — 调整为 Windows x64 原生 P0/P1 计划

**做了什么**

重新只读检查 Windows 原生主机、固定磁盘和开发工具；将实验对象调整为 P0 QuickJS + V8、P1 JSC，并将 PrimJS 改为文献和工程参考。更新 README、实验协议、引擎可行性文档，并新增 Windows 平台快照。没有使用 WSL、下载大型源码、构建引擎或运行 benchmark。

**命令**

```powershell
Get-CimInstance Win32_OperatingSystem
Get-CimInstance Win32_Processor
Get-CimInstance Win32_ComputerSystem
[System.Runtime.InteropServices.RuntimeInformation]::OSArchitecture
[System.IO.DriveInfo]::GetDrives()

Get-Command git, powershell, pwsh, python, python3, py, cl, `
  msbuild, nmake, cmake, ninja, clang, clang-cl, gcc, g++, `
  make, mingw32-make, node, gclient, fetch, gn, autoninja

git --version
powershell -NoProfile -Command '$PSVersionTable.PSVersion.ToString()'
python --version
cmake --version
gcc --version
g++ --version
mingw32-make --version
node --version

& 'C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere.exe' `
  -products * -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -format json

Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows Kits\Installed Roots'
```

同时只读检查 Windows SDK、MSYS2 和 depot_tools 的 PATH 标记及少量常见安装位置；没有进行全盘扫描。

**结果**

- Windows 11 `10.0.26200` build `26200`，x64。
- AMD Ryzen 7 5800H，8 个物理核心、16 个逻辑处理器，约 15.86 GiB RAM。
- 项目所在 `C:` 剩余 33.59 GiB；`D:` 13.18 GiB；`E:` 1.54 GiB；`F:` 15.34 GiB。
- 可用：Git 2.38.1、Windows PowerShell 5.1、Python 3.11.4、CMake 4.0.1、MinGW GCC/G++ 13.1、`mingw32-make` 4.2.1、Node.js 18.12.1。
- 未检测到：可用 Visual Studio C++/Build Tools、`cl.exe`、可用 Windows SDK、Ninja、Clang、MSYS2、depot_tools。
- P0 改为 QuickJS + V8；两者完成 Release build 和 interpreter-only 验证即可进入 P0 benchmark。
- JSC 改为 P1，不阻塞 P0；PrimJS 改为 `REFERENCE_ONLY`。
- 新增 `notes/platform_windows.md`，更新 `README.md`、`notes/experiment_protocol.md` 和 `notes/engine_feasibility.md`。

**问题**

- QuickJS 在当前纯 PowerShell/MinGW 环境中的 Release 构建尚为 `UNKNOWN`。
- V8 所需 Windows 原生构建工具链尚未就绪。
- JSC Windows 构建继续为 `UNKNOWN`，但不再影响 P0。
- P0 正式 benchmark 仍为 `BLOCKED`；尚未固定 SunSpider 与计时协议，也没有运行时验证证据。

**下一步**

按用户要求在计划调整完成后停止。后续如获指令，应先补齐并验证 P0 所需 Windows 原生工具链，再分别建立 QuickJS 和 V8 的 Release/optimized binary 与 interpreter-only 证据；在 P0 门禁满足前不运行正式 benchmark。

---

## 2026-09-20 — 阶段 2：upstream QuickJS Windows baseline

**做了什么**

从官方仓库检出阶段 1 已固定的 upstream QuickJS commit，在 Windows 11 x64 上使用 Git for Windows Bash + MinGW64 完成干净 optimized build。运行六项功能 smoke test，并通过源码、预处理、对象符号和反汇编验证 computed-goto interpreter dispatch。没有修改 QuickJS 源码或 Makefile，没有运行 benchmark。

**命令**

```powershell
git clone --filter=blob:none --no-checkout `
  https://github.com/bellard/quickjs.git `
  .\engines\quickjs-upstream

git -C .\engines\quickjs-upstream checkout --detach `
  04be246001599f5995fa2f2d8c91a0f198d3f34c

powershell -NoProfile -ExecutionPolicy Bypass `
  -File .\scripts\build_quickjs_windows.ps1
```

构建脚本通过 Bash helper 执行：

```bash
export MSYSTEM=MINGW64
mingw32-make.exe clean
mingw32-make.exe -j8 qjs.exe
```

验证使用 MinGW64 `gcc -dM -E`、`nm -a` 和 `objdump -d -Mintel --disassemble=JS_CallInternal`。

**结果**

- Repository：`https://github.com/bellard/quickjs.git`。
- Commit：`04be246001599f5995fa2f2d8c91a0f198d3f34c`；version `2026-06-04`。
- Compiler：MinGW-Builds GCC 13.1.0，target `x86_64-w64-mingw32`。
- Optimization：upstream `CFLAGS_OPT=-O2`；LTO、sanitizer、profile 未启用。
- `qjs.exe`：5,263,029 bytes；SHA-256 `6ef16219978ed1cf7d6590b9c9603c65874ad30ac465c67e5fb819da8786b573`。
- arithmetic、loop、function、array、object property、string smoke test 全部通过，退出码 0。
- 预处理结果为 `#define DIRECT_DISPATCH 1`。
- `.obj/quickjs.o` 含 `dispatch_table` 和 `JS_CallInternal`，反汇编含 indexed table jump 与 register indirect jump。
- QuickJS tracked source diff 为空；不需要 build-system patch，`patches/` 未新增内容。
- 新增构建脚本、Bash helper、smoke 脚本、两份说明文档和三份 raw evidence。

**问题**

- `qjs.exe` 动态依赖 `libwinpthread-1.dll`，执行环境必须记录并提供相同 MinGW runtime。
- 本次使用 Git Bash 的 MSYS 环境，而非独立 MSYS2 安装；脚本仍优先识别标准 `C:\msys64` 布局。
- PE 重链接可能改变 binary checksum；正式实验必须对实际使用的每个 binary 重新记录 SHA-256。
- QuickJS 门禁已通过，但 P0 benchmark 仍因 V8、SunSpider 固定和计时协议未完成而 `BLOCKED`。

**下一步**

按用户要求在 QuickJS baseline 完成后停止。不下载 V8，不运行 SunSpider。后续只有收到新指令后才进入下一阶段。

---

## 2026-09-20 — 阶段 3：V8 Windows preflight 与网络阻断

**做了什么**

按 V8 当前官方 Windows/source checkout 文档检查并补齐 Visual Studio C++ 与 Windows SDK；安装官方 depot_tools bundle并尝试首次 gclient/CIPD bootstrap。由于官方 googlesource 和 CIPD endpoint 无法连接，没有开始 V8 source checkout、构建或运行时验证。QuickJS baseline 未改变，未运行 SunSpider。

**命令**

```text
vswhere -products * -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64
vs_BuildTools.exe --quiet --wait --norestart --nocache \
  --installPath F:\VSBuildTools \
  --add Microsoft.VisualStudio.Workload.VCTools --includeRecommended

git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git F:\depot_tools
curl -L https://storage.googleapis.com/chrome-infra/depot_tools.zip
gclient --version
cipd_bin_setup.bat
curl -I --connect-timeout 20 --max-time 30 \
  https://chrome-infra-packages.appspot.com
```

**结果**

- Visual Studio Build Tools 2022 17.14.41 安装成功，`vswhere` 报告 complete/launchable/no reboot；MSVC toolset 14.44.35207，`cl` 19.44.35229.0；Windows SDK 10.0.26100.0 可用。
- 再次读取 V8 指向的当前 Chromium Windows 文档后，确认其已经要求 VS 2026 >=18.0、NativeDesktop + ATL/MFC、SDK 10.0.28000.2270 与 Debugging Tools >=10.0.26100.3323；现有 VS 2022/SDK 26100 不满足。
- 微软官方 VS 2026 Build Tools 引导程序版本 18.10.12210.168，签名有效，SHA-256 `c71a953a56448193b971b21a5a79ed8c32b4376b9e88fb0365e5c46a6013a804`；管理员安装因 UAC 操作取消而失败（`0x80070642`），`vswhere` 未发现 VS 2026。
- 哈希与失败证据记录完成后，删除 workspace 中的 depot_tools ZIP 与两个 VS bootstrapper 临时缓存；`F:\depot_tools` 和已安装的 VS 2022 保留。
- depot_tools 官方 Git clone 两次因 `chromium.googlesource.com:443` 超时失败。
- 官方 depot_tools bundle 下载成功，SHA-256 `17b729b8c0164eb8374778735d86c4a6d7736a0be8711faeb47eb950feef176d`。
- depot_tools revision `0306e4682b4ac35287c726fa35a983157a625902`，`.git` 已保留。
- gclient/CIPD bootstrap 无法完成；直接连接 `chrome-infra-packages.appspot.com` 20 秒超时，curl exit 28。
- `build_v8_windows.ps1 -PreflightOnly` 已验证会因 `.cipd_bin\vpython3.exe` 缺失退出 1，不会误报通过或创建 checkout。
- 按当前官方 VS 2026/SDK 28000 要求更新脚本后，最终 preflight 会更早在 VS 2026 + ATL/MFC 门禁处退出 1；上述 CIPD 结果保留为较早一次 preflight 证据。
- `run_v8_ignition.ps1` 已验证会在 `d8.exe` 缺失时退出 1，不会创建伪造的 validation evidence。
- 未运行 `fetch v8`；actual V8 commit、compiler、GN args、`d8.exe` size 均为 `UNKNOWN`。
- 在线当前源码显示 `max_opt=0` 表示最大 tier 为 Ignition，且比 `jitless` 更少改变其他 VM 行为；但没有 current checkout/runtime 证据。

**问题**

- V8 官方源码与 CIPD 服务从当前 Windows 原生网络不可达。
- 当前官方 VS 2026、SDK 28000、ATL/MFC 与 Debugging Tools 工具链门禁也未满足。
- depot_tools 无法引导 vpython/GN，完整 checkout 不可建立。
- 本机单盘空闲空间低于 Chromium Windows 文档的 100 GB 建议；V8-only 实际需求未验证。
- 无法证明 Ignition 正在运行，或 Sparkplug/Maglev/TurboFan 未参与。
- 阶段状态：`BLOCKED`。

**下一步**

按用户要求在无法证明纯 interpreter 模式时停止。需要先恢复 `chromium.googlesource.com` 与 `chrome-infra-packages.appspot.com` 的原生 Windows 网络访问；之后从 depot_tools bootstrap 重新开始，不得用裸 V8 clone 绕过。

---

## 2026-09-20 — 阶段 3 调整：V8 官方预编译 artifact

**做了什么**

停止源码构建路线，不再继续 VS 2026、SDK 28000、depot_tools/CIPD 或 `fetch v8`。检查 Node/npm，固定 `jsvu@3.0.5`，只查询 win64 V8。jsvu 查得当前版本 `15.6.21` 并预测 Google 官方 archive URL；jsvu 下载长时间无进度后，直接下载同一官方 archive。保存原始 ZIP，解包并哈希实际 `d8.exe` 与 data files，随后运行版本命令和最小 smoke test。没有运行 benchmark、SunSpider 或 JSC，也没有修改 QuickJS。

**命令**

```text
node --version
npm --version
npx --yes jsvu@3.0.5 --help
jsvu v8@15.6.21 --os=win64
curl --ipv4 -L https://storage.googleapis.com/chromium-v8/official/canary/v8-win64-rel-15.6.21.zip
d8.exe --snapshot_blob=...\snapshot_blob.bin --version
d8.exe --snapshot_blob=...\snapshot_blob.bin scripts\v8_prebuilt_smoke.js
```

**结果**

- Node.js `v18.12.1`；npm `8.19.2`；jsvu `3.0.5`。
- jsvu 查询 URL 返回 V8 `15.6.21`；版本已固定，不再自动更新 latest。
- 官方 archive 为 `v8-win64-rel-15.6.21.zip`，17,273,292 bytes，SHA-256 `c36f9ddeec335dcf45735c91c930f99971504259f865a39d9c6ddf0b4a9b119f`。
- 原始 `d8.exe` 为 34,526,208 bytes，SHA-256 `1808fe93e1838ba0a0489363fddb1a0399da99c533f537c39b621e4a55cf7d87`。
- 伴随 artifact：`icudtl.dat`、`snapshot_blob.bin`、`v8_build_config.json`；原始 ZIP 也已保留。
- `V8 version 15.6.21`，退出码 0。
- `V8_PREBUILT_SMOKE=PASS total=10`，退出码 0。
- 正式 binary 是 archive 原始 `d8.exe`，不使用 jsvu wrapper 或 Node.js。

**问题**

- jsvu 自身下载停滞，最终使用它预测的同一 Google 官方 URL 直接下载。
- `v8_build_config.json` 显示 `has_jitless=false`、`official_build=false`，但 `has_maglev=true`、`has_turbofan=true`；这些值必须在 interpreter-only 方案中如实考虑。
- 尚未取得 flag dump、bytecode、Ignition execution 或 tier trace；正式 interpreter 命令仍为 `BLOCKED`。

**下一步**

按用户要求在 artifact 获取、固定和 smoke test 后停止。不运行 SunSpider；下一阶段只有在收到新指令后，才对这份固定 binary 验证 `--max-opt=0` 及 Sparkplug/Maglev/TurboFan 未参与。

---

## 2026-09-20 — 阶段 4：V8 Ignition-only 运行时验证

**做了什么**

只使用已固定的官方 V8 `15.6.21` Windows x64 artifact，保存完整 `--help` 和 default/A/B `--print-flag-values`。从 V8 官方 `15.6.21` tag 确认对应 commit 和五个目标 flag 的定义。创建 500,000 次调用的 tier 热点探针，分别在 default 与 `--max-opt=0` 下运行 bytecode 和 tier/compilation trace。没有运行 SunSpider、正式 benchmark，也没有修改任何引擎源码。

**命令**

```powershell
$runtime = '.\engines\v8-official-15.6.21\runtime'
& "$runtime\d8.exe" "--snapshot_blob=$runtime\snapshot_blob.bin" --help
& "$runtime\d8.exe" "--snapshot_blob=$runtime\snapshot_blob.bin" --print-flag-values -e 0
& "$runtime\d8.exe" "--snapshot_blob=$runtime\snapshot_blob.bin" --max-opt=0 --print-flag-values -e 0
& "$runtime\d8.exe" "--snapshot_blob=$runtime\snapshot_blob.bin" --jitless --print-flag-values -e 0

powershell -NoProfile -ExecutionPolicy Bypass `
  -File .\scripts\run_v8_ignition.ps1
```

源码核对 URL：

```text
https://chromium.googlesource.com/v8/v8/+/refs/tags/15.6.21
https://chromium.googlesource.com/v8/v8/+/37fb84941c9be9f9914ee50b1ad366f06a1bd764/src/flags/flag-definitions.h
```

**结果**

- 官方 tag `15.6.21` 指向 commit `37fb84941c9be9f9914ee50b1ad366f06a1bd764`。
- 当前 binary 支持 `max-opt`、`jitless`、`sparkplug`、`maglev`、`turbofan`、`print-bytecode`、`trace-baseline`、`trace-opt`、`trace-opt-status`、`trace-deopt`、`trace-osr`。
- 当前 binary 不支持 `trace-ignition` 和 `trace-baseline-exec`；验证命令没有传入这两个 flag。
- 候选 A 的最终值为 `max_opt=0`、`sparkplug=false`、`maglev=false`、`turbofan=false`，同时 `jitless=false`、`regexp_interpret_all=false`。
- 候选 B 会令 `jitless=true`、`regexp_interpret_all=true`，因此没有选作正式模式。
- default 控制组对同一探针产生 Sparkplug、Maglev、TurboFan 和 OSR 事件，证明探针足以触发 tier-up。
- 候选 A 产生 333 个 `INTERPRETED_FUNCTION` 状态；Sparkplug/baseline、Maglev、TurboFan 和 OSR entry 事件均为 0。
- 候选 A 的 bytecode 输出包含 `generated bytecode for function: tierProbeTarget`。
- 两组结果一致：`V8_TIER_PROBE iterations=500000 checksum=1301262660`，退出码均为 0。
- 自动门禁 `STATUS=PASS`；完整证据位于 `results/raw/v8_validation/`。

**问题**

- prebuilt 不提供 `--trace-ignition`；使用实际存在的 `--trace-opt-status` 获得 `INTERPRETED_FUNCTION` 运行状态，并结合最终 flag values、Ignition bytecode、default 对照和零 higher-tier 事件完成证据链。
- `max_opt` 对 higher-tier flags 使用 weak implications；正式命令不得追加显式冲突的 `--sparkplug`、`--maglev` 或 `--turbofan`。
- 诊断 trace flags 属于 developer-only，会产生警告；正式 benchmark 命令不包含这些诊断 flags。

**下一步**

阶段 4 到此停止。P0 引擎门禁已经通过，但没有运行 benchmark。后续需单独固定 SunSpider 来源/版本/校验值，并预先确定计时边界、进程模型、重复次数和原始数据格式，然后才能进入正式实验。

---

## 2026-09-20 — Correctness 阶段：QuickJS 与 V8 Ignition

**做了什么**

在不重建 QuickJS、不更新 V8、不调用 jsvu、不改变正式 runtime flags 的前提下，建立 12 项统一 JavaScript correctness suite。所有测试只使用标准 JavaScript 与 `console.log`，输出确定的单行 checksum。Python runner 显式固定两份 binary、V8 `--max-opt=0`、snapshot 以及相关 artifact SHA-256，并保存逐引擎、逐测试结果。

**命令**

```powershell
python .\scripts\run_smoke_all.py
```

**结果**

- 覆盖 integer arithmetic、floating point、loops、branches、functions、recursion、arrays、object property access、strings、closure、exceptions、bit operations。
- QuickJS 12/12 通过；V8 Ignition-only 12/12 通过；总计 `PASS 24/24`。
- 每行同时满足：退出码 0、stdout 精确等于预设 checksum、stderr 为空。
- 最终原始结果保存为 `results/raw/correctness.csv`，包含 `engine,test,stdout,stderr,exit_code,valid` 六列。
- runner 执行前复核 QuickJS、V8、snapshot、ICU data 与 `libwinpthread-1.dll` 的固定 SHA-256；没有从 PATH 自动选择其他引擎 binary。
- runner 拒绝覆盖已有 raw CSV；复现时必须通过 `--output` 使用新文件名。

**问题**

首次运行是 22/24：两个失败行均为 object property 测试。原因是 runner 中的预设值误把删除操作发生前已经累加的 `k3=9` 再次扣除；两个引擎实际都正确输出 `2917`，退出码均为 0、stderr 均为空。这是测试清单错误，不是引擎差异。首次 CSV 已原样保留为 `results/raw/correctness_attempt1_expected_value_error.csv`；修正预设值后重新生成最终 `correctness.csv`。

**下一步**

Correctness 门禁为 `PASS`。本阶段没有运行正式 benchmark；仍需先固定 SunSpider 来源、版本和校验值，并完成正式计时及数据协议。

---

## 2026-09-20 — SunSpider 1.0.2 准备、correctness 与正式运行

**做了什么**

从 WebKit 官方仓库的固定 commit `fd3406f133a4e56d7aaf399ba5611ae44b8da7e9` 获取 `PerformanceTests/SunSpider/tests/sunspider-1.0.2`，逐文件核对官方 Git blob SHA-1，并为 upstream 和 standalone 目录分别保存 SHA-256 manifest。检查全部 26 个 case 的 browser-only API，以同一份 standalone workload 运行 QuickJS 与 V8。所有移植改动保存为 `patches/sunspider-1.0.2-standalone.patch`。

correctness gate 通过后，用固定 runner 对每个 engine/case 运行 30 次。每轮用固定 seed `20260920` 随机化 case 顺序，并逐轮反转同一 case 的引擎先后次序；每个引擎对每个 case 各有 15 次先运行、15 次后运行。计时使用 `time.perf_counter_ns()`，保留全部样本，不删除 outlier。

**命令**

```powershell
python .\scripts\run_sunspider.py correctness
python .\scripts\run_sunspider.py benchmark --iterations 30
```

**结果**

- 官方 `LIST` 共 26 个 case；upstream 目录共固定 26 个 `.js` 和一个 `LIST`。
- SunSpider correctness gate 为 `PASS 52/52`。
- 正式数据为 `26 × 2 × 30 = 1,560` 行；全部 `exit_code=0`、`valid=true`。
- 每个 engine/case 恰好有 30 个样本；交错顺序复核通过。
- `results/raw/sunspider.csv` SHA-256：`1e27d75a7d38ab48d5fd3a8b30b8d29b4c47b9ba648a9f080fd10ee3b968df82`。
- `results/processed/sunspider_summary.csv` SHA-256：`dc558feca2607d416189f17d5509d95d2ae9f73de30bd02967f75f21350184dc`。
- 独立复算 26 个 case 的 median、mean、sample stddev、Tukey IQR、min、max 和 `V8 / QuickJS` median ratio，均与汇总 CSV 一致。
- 在临时 upstream 副本上应用 standalone patch 后，全部 27 个文件与 standalone manifest 精确匹配；临时副本随后删除。

**问题**

- `date-format-xparb.js` 实际执行 `document.write(then)`；standalone patch 只删除这一浏览器输出副作用。
- 首次 correctness 为 51/52：`3d-raytrace.js` 的内置哨兵只接受生成字符串长度 `20970`，V8 得到 `20970`，QuickJS 得到 `20969`，但两者均完成相同 workload。首次证据原样保存在 `results/raw/sunspider_correctness_attempt1_upstream_sentinel.csv`。最终 patch 只把该哨兵限制改为接受 `20969` 或 `20970`，其他长度仍失败；两引擎继续执行完全相同的 JS 文件。
- 每个样本使用全新进程，因此 `wall_time_ns` 明确包含进程启动、解析/编译、执行和退出；结果不得被描述成只测量循环体时间。

**下一步**

本阶段已经完成并停止。不在本阶段解释性能差异原因；后续分析必须引用固定原始数据和当前运行配置，不得混入 JIT-enabled、其他主机或更新后的引擎结果。

---

## 2026-09-24 至 2026-09-25 — frontend 开销摊薄实验

**做了什么**

审查固定 QuickJS `qjs/qjsc` 的 help、本地 `qjsc.c`、`quickjs-libc.c`、官方自带 `quickjs.texi`，以及固定 d8 的 help 和实际 `--cache=code` smoke；确认 `qjsc` 嵌入字节码可执行路径和 d8 Code Cache 路径不构成对称的预编译文件启动实验。用现有 QuickJS `.obj` 仅链接一个独立 qjsc checksum probe，可执行文件未替换原 qjs。另以原 26 个 standalone SunSpider case 生成同一份双引擎函数包装，建立 same-process repeated execution 模式，并增加 N=1 的函数包装控制组。所有实验仍在固定 `--max-opt=0` 的 d8 下运行；第一轮 raw 数据未覆盖。

**命令**

```powershell
python experiments/frontend_isolation/probe_mechanisms.py
python experiments/frontend_isolation/run_source_mode.py
python experiments/frontend_isolation/run_repeated_mode.py correctness
python experiments/frontend_isolation/run_repeated_mode.py calibrate
python experiments/frontend_isolation/run_repeated_mode.py measure
python experiments/frontend_isolation/run_repeated_mode.py summarize
python experiments/frontend_isolation/run_wrapped_once_control.py measure
python experiments/frontend_isolation/run_wrapped_once_control.py summarize
python experiments/frontend_isolation/compare_modes.py
```

`qjsc` smoke 的具体生成/链接命令和 SHA-256 记录在 `experiments/frontend_isolation/README.md`。

**结果**

- `qjsc` 嵌入字节码 smoke 与源文件路径均输出 `QJSC_CHECKSUM=333833500`；固定 d8 `--cache=code` 在同一次启动中输出一次 Produce 和一次 Consume 标签，并各执行一次同一 probe。
- repeated mode correctness：26×2×2 = 104/104 PASS；正式测量：26×2×30 = 1560/1560 有效；N=1 包装对照：1560/1560 有效。生成 JS 的 SHA-256 与原始 CSV 所记值逐 case 一致。
- 第一轮 source-to-finish 为 QuickJS median 较低 24/26、V8/Q 几何均值 1.693695375；N=1 包装对照为 24/26、1.679296864；same-process repeated 为 10/26、0.608303510。26/26 个 ratio 相对第一轮下降。
- 全部原始数据、校准 N、完整统计、逐 case 描述性比较保存在 `experiments/frontend_isolation/`；最终解读见 `summary/results.md`。原 `results/raw/sunspider.csv` SHA-256 仍为 `1e27d75a7d38ab48d5fd3a8b30b8d29b4c47b9ba648a9f080fd10ee3b968df82`。

**问题**

- `qjsc` 与 d8 的预编译/Code Cache 路径计时边界不对称；d8 的缓存实际命中及可否独立跨进程保存/消费当前为 UNKNOWN，不生成伪 Mode 2 ratio。
- 首次 crypto-aes checksum 使用随 nonce/编码变化的密文长度导致 N=2 失败，失败 CSV 已保留；改用解密明文长度并保留原明文相等断言后全部 PASS。
- pilot 双引擎均 ≥200 ms，但后续 1560 个样本中 51 个短于 200 ms，最低 187.868 ms；全部保留。
- 函数包装、进程内状态/缓存、`eval`、RegExp 与 builtins 仍可能影响 Mode 3。不能仅凭两模式 ratio 量化 startup、VM init、parser、bytecode compiler 或 interpreter loop 的独立贡献。

**下一步**

本阶段在“frontend-amortized 观察”层面完成，在“真正隔离 frontend 并量化分项贡献”层面未完成。若继续，应先设计可验证且尽量对称的计时边界或逐阶段仪器化，不应把当前 Mode 3 改称纯解释器时间；本阶段停止，不开展 QuickJS 优化。
