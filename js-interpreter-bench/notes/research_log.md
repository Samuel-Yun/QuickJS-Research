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
