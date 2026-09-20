# Windows 原生实验平台

## 记录范围

- 采集日期：2026-09-20（Asia/Shanghai）。
- 目标环境：Windows 11 x64 原生环境。
- WSL 不作为主实验环境；本次没有调用 WSL 内的工具。
- 检查方式：Windows CIM、.NET runtime 信息、`Get-Command`、版本命令、`vswhere`、Windows SDK 注册表/目录以及少量常见安装位置。
- 阶段 1 的初始快照只做只读检查。阶段 3 已安装 V8 所需的 Windows C++ 工具链和 depot_tools bundle；没有下载 V8 源码、没有构建 V8、没有运行 benchmark。

## Windows 与硬件

| 项目 | 当前值 | 证据 |
|---|---|---|
| Windows edition | Microsoft Windows 11 家庭版 中文版 | `Win32_OperatingSystem.Caption` |
| Windows version | `10.0.26200` | `Win32_OperatingSystem.Version` |
| Windows build | `26200` | `Win32_OperatingSystem.BuildNumber` |
| architecture | x64 | .NET `OSArchitecture=X64`；OS 报告 64-bit |
| CPU | AMD Ryzen 7 5800H with Radeon Graphics | `Win32_Processor.Name` |
| physical cores | 8 | `NumberOfCores` |
| logical processors | 16 | `NumberOfLogicalProcessors` |
| RAM | 17,024,741,376 bytes（约 15.86 GiB） | `Win32_ComputerSystem.TotalPhysicalMemory` |

采集命令：

```powershell
Get-CimInstance Win32_OperatingSystem
Get-CimInstance Win32_Processor
Get-CimInstance Win32_ComputerSystem
[System.Runtime.InteropServices.RuntimeInformation]::OSArchitecture
```

## 固定磁盘空间

| Drive | Filesystem | Total | Free | 与项目关系 |
|---|---|---:|---:|---|
| `C:\` | NTFS | 200.00 GiB | 30.00 GiB | 项目 workspace 所在盘 |
| `D:\` | NTFS | 100.00 GiB | 15.68 GiB | Git、Python、Node 所在盘 |
| `E:\` | NTFS | 100.00 GiB | 2.04 GiB | GCC/MinGW、CMake 所在盘；空间很低 |
| `F:\` | NTFS | 75.69 GiB | 69.81 GiB | VS Build Tools 与 depot_tools 所在盘；计划中的 V8 checkout 盘 |

磁盘数据来自阶段 3 完成工具安装后的 `[System.IO.DriveInfo]::GetDrives()` 快照；数值会随系统使用变化。当前 Chromium Windows 文档建议至少 100 GB NTFS 空闲空间；该建议面向 Chromium checkout，V8-only 实际需求为 `UNKNOWN`，因此记录为风险而不推测是否足够。

## 工具链与开发工具

| 工具 | 路径/版本 | 状态 |
|---|---|---|
| Git | `D:\samuel_yun\Git\cmd\git.exe`；2.38.1.windows.1 | 可用 |
| Windows PowerShell | `C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe`；5.1.26100.9444 Desktop | 可用 |
| PowerShell 7 (`pwsh`) | — | `NOT_FOUND` |
| Python | `D:\python3\python.exe`；3.11.4 | 可用 |
| Python launcher | `C:\Windows\py.exe`；3.11.4 | 可用 |
| `python3` | WindowsApps alias | 别名存在但不可作为已验证 Python 使用 |
| Visual Studio / Build Tools | `F:\VSBuildTools`；Visual Studio Build Tools 2022 17.14.41（17.14.37710.0） | 可用，但不满足当前 V8 文档要求的 VS 2026 >=18.0 |
| Desktop development with C++ | VS 2022 `Microsoft.VisualStudio.Workload.VCTools` 可用 | 当前文档要求的 VS 2026 NativeDesktop 与 ATL/MFC 未安装 |
| `cl.exe` | MSVC toolset 14.44.35207；19.44.35229.0 | 可用，但不通过当前 V8 版本门禁 |
| MSBuild / NMake | `F:\VSBuildTools\MSBuild\Current\Bin\MSBuild.exe`；MSVC x64 tool directory 中的 `nmake.exe` | 可用（通过 VS developer environment） |
| Windows SDK | `C:\Program Files (x86)\Windows Kits\10`；10.0.26100.0 | 可用，但不满足当前要求的 10.0.28000.2270；Debugging Tools 也未安装 |
| CMake | `E:\CMake\bin\cmake.exe`；4.0.1 | 可用 |
| Ninja | 系统 PATH 中没有；depot_tools CIPD 尚未提供 binary | `NOT_FOUND` / bootstrap blocked |
| Clang / clang-cl | — | `NOT_FOUND` |
| GCC | `E:\mingw64\bin\gcc.exe`；MinGW-Builds GCC 13.1.0 `x86_64-posix-seh` | 可用 |
| G++ | `E:\mingw64\bin\g++.exe`；13.1.0 | 可用 |
| MinGW Make | `E:\mingw64\bin\mingw32-make.exe`；GNU Make 4.2.1 | 可用 |
| `make` | — | `NOT_FOUND` |
| MSYS2 | PATH 及检查的 `C:/D:/E:/F:\msys64` 等常见位置均未发现 | `NOT_FOUND` |
| Node.js | `D:\nodejs\node.exe`；v18.12.1 | 可用 |
| depot_tools | `F:\depot_tools`；revision `0306e4682b4ac35287c726fa35a983157a625902` | 官方 bundle 已安装；CIPD bootstrap blocked，`vpython3.exe`/Ninja 不可用 |

`C:\Windows\System32\bash.exe` 存在，但它是 Windows/WSL 入口，不是 MSYS2。根据当前实验计划，不使用它作为主实验工具。

工具检测命令概要：

```powershell
Get-Command git, powershell, pwsh, python, python3, py, cl, `
  msbuild, nmake, cmake, ninja, clang, clang-cl, gcc, g++, `
  make, mingw32-make, node, gclient, fetch, gn, autoninja

& 'C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere.exe' `
  -products * -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -format json

Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows Kits\Installed Roots'
```

阶段 1 没有对所有磁盘进行穷举扫描。阶段 3 对 Visual Studio、Windows SDK 与 depot_tools 的明确安装位置进行了复核；其他“未检测到”仍严格表示当前 shell、标准注册信息和所列常见路径中不可用。

## 对 P0/P1 的影响

### P0: upstream QuickJS

- x64 MinGW GCC 13.1、G++ 和 `mingw32-make` 可用。
- MSYS2 和普通 `make` 不可用；使用 Git for Windows Bash 提供的 MSYS/POSIX 环境配合现有 MinGW64，upstream Makefile 已成功完成干净构建。
- 已产生 `-O2` optimized `qjs.exe`，并由预处理、符号和反汇编确认 computed-goto dispatch；详见 `notes/quickjs_windows_build.md` 与 `notes/quickjs_interpreter_validation.md`。

### P0: V8 Ignition

- 已安装的 VS 2022 17.14.41 / SDK 10.0.26100.0 低于当前官方要求的 VS 2026 / SDK 10.0.28000.2270；ATL/MFC 和 Debugging Tools 也缺失。
- 官方 VS 2026 引导程序已验证签名，但管理员安装因 UAC 操作取消而失败；没有新增 VS 2026 instance。
- 已从官方 bundle 安装 depot_tools revision `0306e4682b4ac35287c726fa35a983157a625902`，但官方 CIPD endpoint 连接超时，bootstrap 未完成。
- `chromium.googlesource.com` 同样不可达，因此没有启动 `fetch v8`；源码构建路线保持 `BLOCKED` 且不再继续。
- 后续已固定 Google 官方预编译 V8 `15.6.21` win64 Release artifact，`d8.exe --version`、最小 smoke test 与 `--max-opt=0` Ignition-only 运行验证均已通过。

### P1: JavaScriptCore LLInt

- Visual Studio C++ 与 Windows SDK 已就绪，但 Clang/Ninja 与 WebKit/JSC 的其余官方依赖未验证，工具链仍不完整。
- JSC 作为 P1 延后处理，不阻塞 QuickJS + V8 的 P0 计划。

## 当前门禁状态

- Windows 原生平台已选定并完成环境快照。
- P0 benchmark：`BLOCKED`；QuickJS baseline 与 V8 prebuilt artifact 已固定，但 V8 Ignition-only 运行验证、benchmark 固定和统一计时协议尚未完成。
- P1 JSC：`DEFERRED`。
- PrimJS：`REFERENCE_ONLY`。
