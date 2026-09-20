# upstream QuickJS Windows x64 baseline

## 结论

构建状态：`PASS`。

在 Windows 11 x64 上，当前 upstream QuickJS 无需源码 patch，也无需 Makefile patch。现有 Git for Windows Bash 提供了 Makefile 所需的 MSYS/POSIX 工具环境，现有 MinGW64 提供 GCC、GNU Make 和 binutils。Bash 环境中的 `MSYSTEM=MINGW64` 使 upstream Makefile 自动进入原生 Windows 分支。

本阶段没有安装 MSYS2。标准 MSYS2 + MinGW64 仍是脚本优先检查的布局；本机因已有可用的 Git Bash + MinGW64 组合，采用该最小方案，避免额外安装和环境变更。

## 固定源码

| 项目 | 值 |
|---|---|
| Repository | <https://github.com/bellard/quickjs.git> |
| Checkout | `engines/quickjs-upstream` |
| Branch state | detached HEAD |
| Commit | `04be246001599f5995fa2f2d8c91a0f198d3f34c` |
| `VERSION` | `2026-06-04` |
| Source patch | **none** |

构建前脚本会检查精确 commit、`VERSION` 和 tracked worktree 状态。源码目录的 `git diff` 为空。`.obj/`、`repl.c`、`qjsc.exe` 和 `qjs.exe` 是 upstream 构建产物，不是源码修改。

`patches/` 目录本阶段保持不变，因为没有需要保存的 Windows build patch。

## 工具链

| 工具 | 本次使用值 |
|---|---|
| OS/architecture | Windows 11 x64，build 26200 |
| Bash | `D:\samuel_yun\Git\bin\bash.exe`；GNU bash 5.1.16，`x86_64-pc-msys` |
| Compiler | `E:\mingw64\bin\gcc.exe` |
| Compiler version | MinGW-Builds GCC 13.1.0，`x86_64-posix-seh-rev1` |
| Compiler target | `x86_64-w64-mingw32` |
| Make | `E:\mingw64\bin\mingw32-make.exe`；GNU Make 4.2.1 |
| Binutils | 同一 MinGW64 目录中的 `nm.exe`、`objdump.exe` |

`qjs.exe` 导入 `libwinpthread-1.dll`，因此运行时必须保证对应 MinGW64 `bin` 目录在 `PATH` 中，或以其他可复现方式提供完全相同的 DLL。当前脚本在构建和 smoke test 期间临时把选定的 MinGW64 `bin` 放在 `PATH` 首位。

## 构建方案

入口命令：

```powershell
powershell -NoProfile -ExecutionPolicy Bypass `
  -File .\scripts\build_quickjs_windows.ps1
```

PowerShell 脚本会优先检查标准 MSYS2 路径 `C:\msys64`，本机未找到后使用 Git Bash。它调用 [`build_quickjs_windows_msys2.sh`](../scripts/build_quickjs_windows_msys2.sh)，底层命令为：

```bash
export MSYSTEM=MINGW64
mingw32-make.exe clean
mingw32-make.exe -j8 qjs.exe
```

完整入口脚本：[`build_quickjs_windows.ps1`](../scripts/build_quickjs_windows.ps1)。它同时执行 commit 校验、干净构建、smoke test、SHA-256 计算、预处理检查和定向反汇编验证。

## Release/optimized 配置

本次使用 upstream Makefile 的普通 `qjs.exe` 目标。其 optimized object rule 使用 `CFLAGS_OPT`，核心优化参数为：

```text
-O2
```

实际公共编译参数由原始构建日志确认：

```text
-g -Wall -MMD -MF <dependency-file>
-Wno-array-bounds -Wno-format-truncation -Wno-infinite-recursion
-fwrapv
-D_GNU_SOURCE
-DCONFIG_VERSION="2026-06-04"
-D__USE_MINGW_ANSI_STDIO
-O2
```

- `CONFIG_LTO`：未启用。
- sanitizer/profile：未启用。
- `CONFIG_WERROR`：未启用。
- linker 使用 upstream 默认 `-g`，所以最终文件保留调试符号；机器码仍由 `-O2` 优化。调试符号用于 dispatch 验证，未对 interpreter/runtime 做性能修改。
- 未追加非 upstream 的性能调优参数。

完整逐条编译输出保存在 [`quickjs_build.txt`](../results/raw/quickjs_build.txt)。

## 构建产物

| 项目 | 值 |
|---|---|
| Binary | `engines/quickjs-upstream/qjs.exe` |
| Format | PE x86-64 / `pei-x86-64` |
| Size | **5,263,029 bytes** |
| SHA-256 | `6ef16219978ed1cf7d6590b9c9603c65874ad30ac465c67e5fb819da8786b573` |
| Imported DLLs | `KERNEL32.dll`、`msvcrt.dll`、`libwinpthread-1.dll` |

该 SHA-256 对应本次保留调试符号的最终产物。重新链接可能因 PE 元数据产生不同哈希，因此每个正式实验二进制都必须重新记录哈希，不能只依据 commit 认定完全相同。

## Smoke test

测试脚本：[`quickjs_smoke.js`](../scripts/quickjs_smoke.js)。本次运行覆盖：

| 项目 | 结果 |
|---|---|
| arithmetic | `PASS`，结果 50 |
| loop | `PASS`，结果 5050 |
| function | `PASS`，结果 42 |
| array | `PASS`，结果 13 |
| object property | `PASS`，结果 42 |
| string | `PASS`，结果 `QuickJS baseline` |

进程退出码为 0，总状态为 `SMOKE_STATUS=PASS`。原始记录见 [`quickjs_smoke.txt`](../results/raw/quickjs_smoke.txt)。

## 边界

- 没有修改 QuickJS interpreter/runtime 逻辑。
- 没有 build-system patch。
- 没有进行性能优化实验。
- 没有运行 SunSpider 或其他 benchmark。
- 此结果建立了 QuickJS Windows baseline，但整个 P0 benchmark 仍需等待 V8 和统一计时协议完成门禁。
