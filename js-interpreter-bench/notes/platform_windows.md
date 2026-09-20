# Windows 原生实验平台

## 记录范围

- 采集日期：2026-09-20（Asia/Shanghai）。
- 目标环境：Windows 11 x64 原生环境。
- WSL 不作为主实验环境；本次没有调用 WSL 内的工具。
- 检查方式：Windows CIM、.NET runtime 信息、`Get-Command`、版本命令、`vswhere`、Windows SDK 注册表/目录以及少量常见安装位置。
- 本次只做只读检查；没有下载大型源码、没有构建引擎、没有运行 benchmark。

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
| `C:\` | NTFS | 200.00 GiB | 33.59 GiB | 项目 workspace 所在盘 |
| `D:\` | NTFS | 100.00 GiB | 13.18 GiB | Git、Python、Node 所在盘 |
| `E:\` | NTFS | 100.00 GiB | 1.54 GiB | GCC/MinGW、CMake 所在盘；空间很低 |
| `F:\` | NTFS | 75.69 GiB | 15.34 GiB | 当前未用于项目 |

磁盘数据来自 `[System.IO.DriveInfo]::GetDrives()` 的本次快照。正式下载 V8 或 WebKit 前必须重新确认源码、依赖、构建输出和原始结果的目标盘；本轮不进行下载。

## 工具链与开发工具

| 工具 | 路径/版本 | 状态 |
|---|---|---|
| Git | `D:\samuel_yun\Git\cmd\git.exe`；2.38.1.windows.1 | 可用 |
| Windows PowerShell | `C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe`；5.1.26100.9444 Desktop | 可用 |
| PowerShell 7 (`pwsh`) | — | `NOT_FOUND` |
| Python | `D:\python3\python.exe`；3.11.4 | 可用 |
| Python launcher | `C:\Windows\py.exe`；3.11.4 | 可用 |
| `python3` | WindowsApps alias | 别名存在但不可作为已验证 Python 使用 |
| Visual Studio / Build Tools | `vswhere` 对 VC x86/x64 component 返回 `[]` | 未检测到可用安装 |
| `cl.exe` | — | `NOT_FOUND` |
| MSBuild / NMake | — | `NOT_FOUND` |
| Windows SDK | `Windows Kits\10` 仅发现 `UnionMetadata`，没有可用 `Include`/`Lib`/版本化 `bin`；注册表未返回 Kits root | 未检测到可用 SDK |
| CMake | `E:\CMake\bin\cmake.exe`；4.0.1 | 可用 |
| Ninja | — | `NOT_FOUND` |
| Clang / clang-cl | — | `NOT_FOUND` |
| GCC | `E:\mingw64\bin\gcc.exe`；MinGW-Builds GCC 13.1.0 `x86_64-posix-seh` | 可用 |
| G++ | `E:\mingw64\bin\g++.exe`；13.1.0 | 可用 |
| MinGW Make | `E:\mingw64\bin\mingw32-make.exe`；GNU Make 4.2.1 | 可用 |
| `make` | — | `NOT_FOUND` |
| MSYS2 | PATH 及检查的 `C:/D:/E:/F:\msys64` 等常见位置均未发现 | `NOT_FOUND` |
| Node.js | `D:\nodejs\node.exe`；v18.12.1 | 可用 |
| depot_tools | `gclient`、`fetch`、`gn`、`autoninja` 均不在 PATH；常见目录及 PATH 标记均未发现 | `NOT_FOUND` |

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

本检查没有对所有磁盘进行穷举扫描。因此“未检测到”严格表示当前 shell、标准注册信息和所列常见路径中不可用；未知的非标准安装位置不视为可用工具链。

## 对 P0/P1 的影响

### P0: upstream QuickJS

- x64 MinGW GCC 13.1、G++ 和 `mingw32-make` 可用。
- MSYS2 和普通 `make` 不可用；使用 Git for Windows Bash 提供的 MSYS/POSIX 环境配合现有 MinGW64，upstream Makefile 已成功完成干净构建。
- 已产生 `-O2` optimized `qjs.exe`，并由预处理、符号和反汇编确认 computed-goto dispatch；详见 `notes/quickjs_windows_build.md` 与 `notes/quickjs_interpreter_validation.md`。

### P0: V8 Ignition

- 当前没有可用 Visual Studio C++ Build Tools、`cl.exe`、Windows SDK、Ninja 或 depot_tools。
- 因此原生 Windows V8 构建环境尚未就绪；本轮没有安装依赖或下载 V8。
- `d8.exe` 的 Release build 和 Ignition-only 运行验证均未完成。

### P1: JavaScriptCore LLInt

- 当前 Windows WebKit/JSC 工具链不完整；Clang、Ninja、Visual Studio C++、Windows SDK 等均未检测到。
- JSC 作为 P1 延后处理，不阻塞 QuickJS + V8 的 P0 计划。

## 当前门禁状态

- Windows 原生平台已选定并完成环境快照。
- P0 benchmark：`BLOCKED`；QuickJS baseline 已完成，但 V8、benchmark 固定和统一计时协议尚未完成。
- P1 JSC：`DEFERRED`。
- PrimJS：`REFERENCE_ONLY`。
