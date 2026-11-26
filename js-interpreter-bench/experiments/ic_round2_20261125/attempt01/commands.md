# 本轮复现命令

在仓库根目录开始。冻结的 original/modified/ 不作修改。下面仅操作本轮目录。

```bash
cd js-interpreter-bench/experiments/ic_round2_20261125/attempt01
```

只检查现有数据、重新生成表格，不会重跑基准：

```bash
python3 audit.py
python3 report.py
python3 extract_bytecode.py
```

从生成脚本重建三份独立源码。已有相同 manifest 时复用，不覆盖实际测量版本；源码不同会新建 rev 目录：

```bash
python3 build.py SPARSE INSTANCE CALL NESTED --modes release
python3 build.py INSTANCE CALL NESTED --modes counts sanitize
```

也可直接解压各目录的 source.tar.gz，使用其中 Makefile 编译。压缩包内容对应实际测量的 Release 源码，SHA 在 audit.json。NESTED 的父版是已经测过的 NUMERIC_PLAN，独立补丁是 NUMERIC_PLAN-to-NESTED.patch；前两版补丁相对冻结 SPARSE。

语义、守卫失效、GC/realm/中断和保存/加载：

```bash
python3 check.py
python3 extra_check.py
python3 c_check.py
```

三份 ELF 各自带运行模式，用 manifest 定位，避免选错旧 rev。这个示例只运行自己写的 JS，不重跑全集：

```bash
python3 - <<'PY'
import json, os, subprocess
m = json.load(open('01_instance_hook/INSTANCE.release.manifest.json'))
env = dict(os.environ, QJS_INSTANCE_MODE='hook', TZ='Asia/Shanghai', LC_ALL='C', LANG='C')
subprocess.run(['taskset', '-c', '2', m['binary'], '01_instance_hook/semantics.js'], env=env, check=True)
PY
```

模式如下；同一行使用同一份 ELF，控制代码布局差别：

| ELF | 环境变量 | 可选模式 |
|---|---|---|
| INSTANCE | QJS_INSTANCE_MODE | off / direct / cached / hook |
| CALL | QJS_CALL_MODE | off / direct / ic / field |
| NESTED | QJS_NEST_MODE | parent / combined |

定向五对交错复测和独立诊断（新建输出目录，旧数据保留）：

```bash
python3 targeted.py nested
python3 targeted.py call
python3 targeted.py instance
python3 targeted.py counts
python3 target_identity.py
```

完整 Octane 17 项、SunSpider 26 项：各模式各项一个新进程，按表项轮换顺序。A/SPARSE/NUMERIC_PLAN/V8 沿用历史表，不重跑：

```bash
python3 full.py
```

一次顺序跑三组定向及全集（不要同时再启动另一份性能进程）：

```bash
python3 pipeline.py
```

第一次数据在 `full01/`、各组 `targeted01/`、`counts01/`。驱动再次运行会建立新的编号目录；本次 `report.py` 和 `audit.py` 明确读取第一批已测数据，不会静默替换成本机后来跑出的结果。诊断时间不用于性能结论。
