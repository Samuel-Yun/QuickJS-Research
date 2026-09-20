# 实验平台记录

## 记录范围

- 采集日期：2026-09-20（Asia/Shanghai）
- 主机：当前本地 Windows 主机
- 本阶段只做只读环境检查；未下载或编译引擎，未运行 benchmark，未修改任何引擎源码。
- 本文件记录的是阶段 1 的环境快照。正式实验前必须重新采集，并同时记录电源模式、后台负载和温控条件。

## 操作系统与硬件

| 项目 | 检测结果 | 状态/说明 |
|---|---|---|
| OS | Microsoft Windows 11 家庭中文版 | 由 `Win32_OperatingSystem.Caption` 返回 |
| OS version | `10.0.26200` | build `26200` |
| OS 位数 | 64-bit | 由 `Win32_OperatingSystem.OSArchitecture` 返回 |
| CPU | AMD Ryzen 7 5800H with Radeon Graphics | 由 `Win32_Processor.Name` 返回 |
| architecture | x86-64 | .NET `OSArchitecture` 返回 `X64` |
| 物理核心数 | 8 | `NumberOfCores` |
| 逻辑处理器数 | 16 | `NumberOfLogicalProcessors` |
| 物理内存 | 17,024,741,376 bytes（约 15.86 GiB） | `TotalVisibleMemorySize × 1024` |

采集命令：

```powershell
Get-CimInstance Win32_OperatingSystem |
  Select-Object Caption, Version, BuildNumber, OSArchitecture, TotalVisibleMemorySize

Get-CimInstance Win32_Processor |
  Select-Object Name, Architecture, NumberOfCores, NumberOfLogicalProcessors

[System.Runtime.InteropServices.RuntimeInformation]::OSArchitecture
```

## 编译器与构建工具

| 工具 | 路径 | 版本/状态 |
|---|---|---|
| GCC | `E:\mingw64\bin\gcc.exe` | GCC 13.1.0，`x86_64-posix-seh-rev1`，MinGW-Builds |
| Clang | — | `NOT_FOUND` |
| MSVC `cl` | — | `NOT_FOUND` |
| `clang-cl` | — | `NOT_FOUND` |
| Python | `D:\python3\python.exe` | Python 3.11.4 |
| Python launcher | `C:\Windows\py.exe` | Python 3.11.4 |
| `python3` | WindowsApps alias | 别名存在但不能执行；不得把它记为可用解释器 |
| CMake | `E:\CMake\bin\cmake.exe` | 4.0.1 |
| Ninja | — | `NOT_FOUND` |
| GNU Make (`make`) | — | `NOT_FOUND` |
| MinGW Make | `E:\mingw64\bin\mingw32-make.exe` | GNU Make 4.2.1 for `x86_64-w64-mingw32` |
| NMake | — | `NOT_FOUND` |
| MSBuild | — | `NOT_FOUND` |
| GN | — | `NOT_FOUND` |
| autoninja | — | `NOT_FOUND` |
| Git | `D:\samuel_yun\Git\cmd\git.exe` | 2.38.1.windows.1 |
| Node.js | `D:\nodejs\node.exe` | v18.12.1 |
| Visual Studio | — | `vswhere.exe` 存在，但未报告已安装实例 |
| gperf / bison / flex | — | `NOT_FOUND` |
| Perl / Ruby | — | `NOT_FOUND` |

版本检查采用 `Get-Command <tool>` 定位，再分别运行 `--version` 或工具对应的版本参数；Visual Studio 使用：

```powershell
& 'C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere.exe' `
  -products * -format json
```

返回结果为空数组，因此当前记录为未检测到 Visual Studio，而不是推测某个版本。

## 对阶段 1 可行性的直接影响

- QuickJS：现有 x86-64 MinGW GCC 支持 GNU computed-goto 扩展，具备编译其当前 direct-dispatch 路径的基本条件；但官方 Makefile 仍依赖类 Unix shell 工具，实际构建成功与否为 `UNKNOWN`。
- PrimJS：缺少其官方流程所需的 GN、Ninja、Clang 和 Habitat 工具；更关键的是，当前 x86-64 Windows 不满足 Template Interpreter 的架构和预生成代码条件。
- V8：缺少 depot_tools/GN/Ninja、Visual Studio C++ 工具链和相应 Windows SDK 环境；本阶段不构建。
- JavaScriptCore：缺少 Visual Studio C++、LLVM/Clang、Ninja、Perl、Ruby、gperf 等官方 Windows 构建依赖；本阶段不构建。
- 当前机器的电源策略、处理器频率策略、温度/降频状态和后台负载尚未采集，均为 `UNKNOWN`。这些信息在正式实验前必须固定或记录。

正式 benchmark 准入状态：`BLOCKED`。原因是四个系统尚未完成本机二进制与 interpreter-only 运行时验证。
