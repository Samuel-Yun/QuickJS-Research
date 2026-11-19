# 按需构造缓存

这里单独保存已经测过的“按需构造缓存”版本，技术旧名为 `SPARSE_CTOR_IC`，固定来自提交 `06aada4`。原版 QuickJS A、修改后的代码、补丁分开放。复制整个目录到别处后也能构建，工具不读取 `experiments/`。

日常使用先看仓库根目录的 [常用命令速查](../../常用命令.md)，编译、检查、单项/整套计时和结果查看都集中在那里。

## 从哪里看

| 路径 | 内容 |
|---|---|
| [original/](original/) | 实验对照 A 的干净源码，QuickJS `2026-06-04`，保留原字节和换行 |
| [modified/](modified/) | 按需构造缓存的冻结 Release 源码，可直接逐文件对照 A |
| [完整补丁](patches/A-to-on-demand-ctor.patch) | **从原版 A 到当前方法**，包含当前版本依赖的全部优化 |
| [本轮增量补丁](patches/R3-to-on-demand-ctor.patch) | 只看“按需分配＋负缓存”相对构造计划父版 R3 的变化 |
| [设计说明](docs/design.md) | 缓存什么、命中怎么执行、哪些开销还在 |
| [改动清单](docs/changes.md) | 每个文件和 `quickjs.c` 中各处接入位置 |
| [历史数据](results/README.md) | 已有 Octane/SunSpider 数据及比较口径 |
| [manifest.json](manifest.json) | 两套源码逐文件 SHA-256、原始来源、补丁哈希 |
| [verification/](verification/) | 本次抽取后的构建日志和验证结果 |
| [基准运行说明](tests/README.md) | Octane/SunSpider 单项、整套和 A/按需版对照命令 |
| [字节码查看](tools/字节码查看.md) | 实际运行 JS 后显示两版字节码，可按函数筛选 |

**想看实现，先读 `modified/four_runtime.inc`，再读 `modified/sparse_runtime.inc`，最后看 `quickjs.c` 的 `OP_four_ctor`。** 想移植到 A，使用完整补丁；增量补丁的起点是 R3，不能直接打到 A，也不要在完整补丁后再打一次。

## 这份版本包括什么

```text
原版 A
  → 属性读取 IC、局部变量读取融合、读写共享记录、冷函数准备
  → shape 转换缓存（C）
  → 构造计划 IC（R3）
  → 完整计划按需分配、记住不支持的构造目标（本方法）
```

刚才展示的相对 A：Octane −7.86%、SunSpider −4.45%，属于上面整份版本的成绩。单独最后一层相对旧 R3 的历史单轮变化为 −0.89%、−0.84%。文件名继续使用冻结版本的 `four_*`、`sparse_*`，方便核对原实现；展示名称统一为“按需构造缓存”。

## 构建和验证

需要 Ubuntu 本机的 Python 3、GCC、GNU Make、`patch`。在本目录运行：

```bash
python3 tools/manage.py verify
python3 tools/manage.py build both
python3 tools/manage.py check
```

生成的程序为 `build/A/qjs` 和 `build/method/qjs`，同时构建对应 `qjsc`。工具先复制 A，在副本上应用完整补丁，再核对生成的 38 份文件是否与 `modified/` **逐字节一致**，之后才编译。`original/`、`modified/` 不写入二进制或构建缓存。

只准备代码、不编译：

```bash
python3 tools/manage.py prepare method
```

也可以直接复制 `modified/` 到自己的构建目录，用历史相同命令编译：

```bash
make -j2 -o repl.c qjs qjsc
```

`-o repl.c` 使用随包冻结的 REPL C 文件。两版都带有原 Ubuntu 构建使用的 `compat/test-closefrom.c`；这是同一份构建支持文件，没有归到优化补丁里。

## 换行如何处理

原 A 大部分是 LF，历史方法包的部分未改文件是 CRLF。完整补丁按 LF 生成，因此只显示真正的代码变化：**改动 2 个原文件，新增 10 个实现文件**。不会出现把整份上游代码删掉重加的噪声。

`manage.py` 在构建副本中统一换行、应用补丁，再根据 manifest 还原冻结方法包的原始换行。这样阅读补丁清楚，最终源码也能与历史版本逐字节核对。原始两套源码本身不做改写。

## 本次验证范围

源码抽取检查包括两版 Release 构建、构造/属性读取差分、执行后字节码保存与加载（包括 ROM 输入），结果在 `verification/checks.json`。新增基准入口的检查另存 `verification/benchmark_runner.json`；`results/` 中保留原历史成绩，不混入入口联调的计时。

## 跑 Octane / SunSpider

```bash
# 一个样例，A 与按需版对照
python3 tests/run.py octane Richards --engine both
python3 tests/run.py sunspider access-binary-trees --engine both

# 整套，各一轮
python3 tests/run.py octane --engine both
python3 tests/run.py sunspider --engine both

# 两套一起跑
python3 tests/run.py all --engine both
```

每项结束立即打印 ms/Run，最后生成逐项表。默认每版每项一个新进程、CPU 2，无额外预热；结果保存到新建的 `test_runs/时间戳/`。完整参数见 [tests/README.md](tests/README.md)。
