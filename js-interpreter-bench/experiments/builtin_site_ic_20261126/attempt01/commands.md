# 本轮命令

在仓库根目录进入实验目录：

```bash
cd js-interpreter-bench/experiments/builtin_site_ic_20261126/attempt01
```

只核对和重建报告，不运行基准：

```bash
python3 report.py
python3 audit.py
python3 inspect_binary.py
```

构建三个独立源码版本。SHAM/SITE 共用 SITE 二进制，以环境变量区分：

```bash
python3 build.py SPARSE BODY SITE --modes release counts
python3 build.py BODY SITE --modes sanitize
```

已有相同源码和 manifest 就复用；有变化就生成新 rev，原计时二进制保留。`candidate/*-source.tar.gz` 对应本轮真正测过的 Release 源码；可解压到新目录后执行：

```bash
make -j2 -o repl.c qjs qjsc
```

正式版本的核心代码在 `builtin_site_release.inc` / `builtin_opcode.inc`。`builtin_site.inc` 是诊断版，额外带计数及安装字节快照；两者执行同一个 IC 设计。三个独立补丁在 candidate/，均相对冻结 SPARSE；SPARSE 自身的补丁为空。普通 call_method handler 保持原文本。

运行单个正式项目，同时用同一份 ELF 选择 SITE 或 SHAM：

```bash
python3 - <<'PY'
from measure import *
os.sched_setaffinity(0, {2})
out = next_out(HERE, 'manual'); out.mkdir()
for label in ['SPARSE', 'BODY', 'SHAM', 'SITE']:
    r = sample(label, 'octane', 'Typescript', out, 1)
    print(label, r['ms'], 'ms/Run')
PY
```

上例若改成 SunSpider 单项：

```python
r = sample(label, 'sunspider', 'string-base64', out, 1)
```

若改成外部项目：

```python
r = sample(label, 'external', 'Acorn', out, 1)
```

源包和输入 SHA 校验、外部脚本生成：

```bash
python3 fetch_external.py
python3 external.py
```

源包已下载并按用户给定 SHA 校验。脚本生成后需保持固定；输入加载、库加载在计时外。Acorn N=1；MarkdownIt N=256，全部版本一致。不要同时启动多个性能驱动。

语义、实际改写、回退、getter、绑定/间接/多参/尾调用、ASan/UBSan：

```bash
python3 check.py
python3 c_check.py
```

同批九项十对，以及把两个外部项目补到三十对：

```bash
python3 measure.py ten
python3 measure.py focus
```

完整 Octane 17 项、SunSpider 26 项，四版每项一个新进程，父版现场重测：

```bash
python3 full.py
```

独立计数及实际执行缓冲区中的安装字节证据：

```bash
python3 measure.py counts
python3 installation_evidence.py
```

单独的 Acorn Run 指令归因，复用实际 Release 的 quickjs.o，只更换 qjs 启动器添加 Valgrind 开始/结束请求：

```bash
python3 callgrind_run.py
```

现有成功 Callgrind 原始采集会被复用，仅重新解析；不拿其 elapsed_ms 当正式时间。这个工具明确以文件尾 totals 核对自身指令之和，并合并递归上下文名。完整原始文件保留在 callgrind01/。

按既定顺序运行全部主要测量：

```bash
python3 pipeline.py
```

`full.py`、`measure.py` 会为新测量新建编号目录，保留旧记录。`report.py` / `audit.py` 明确读取本次 `full01`、`paired01`、`focus01`、`counts01`，不会把以后新跑的成绩静默替换进去。`focus` 明确补 `paired01` 的外部第 11–30 对。安装证据的源码放在独立 installation 目录，不覆盖主计数二进制。
