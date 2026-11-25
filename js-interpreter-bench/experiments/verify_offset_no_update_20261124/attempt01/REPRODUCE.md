# 复现命令

在仓库根目录执行。冻结源码不动，构建放在本目录 `work/`。

```bash
cd /home/wssy/workspace/QuickJS-Research
TASK=js-interpreter-bench/experiments/verify_offset_no_update_20261124/attempt01
python3 "$TASK/build.py"
python3 "$TASK/run.py" gate
python3 "$TASK/run.py" pilot
python3 "$TASK/run.py" micro_counts
python3 "$TASK/run.py" micro_time
python3 "$TASK/run.py" target_counts
python3 "$TASK/run.py" target_time
python3 "$TASK/run.py" decide
```

`pilot` 只选一份共同的 N；正式三组、两版使用相同 N。计时固定 CPU 2，C locale、Asia/Shanghai。
每组微基准每版 5 个新进程；真实定向用例每版 3 个新进程。计数单独跑，不用于计时结论。
重复测量时请复制为新的 attempt 并删除复制目录中的生成记录，避免覆盖原始数据。

`decision.json` 记录定向数据是否支持继续跑全集。只有 run_full=true 才执行：

```bash
python3 "$TASK/protocol.py"
python3 "$TASK/run.py" full
```

汇总和审计：

```bash
python3 "$TASK/report.py"
```

手动执行一个样例：

```bash
taskset -c 2 "$TASK/work/VERIFY_OFFSET_NO_UPDATE.release/qjs" "$TASK/micro.js" same_slot 134217728
taskset -c 2 "$TASK/work/SPARSE.release/qjs" "$TASK/micro.js" same_slot 134217728
```

`micro_counts/` 保存真实执行镜像快照 `*.snapshot.jsonl`、目标函数反汇编 `*.bytecode.txt`、计数与 stderr 中的布局证据。
同槽的两种对象 x 分别是 3 和 5；异槽的另一对象是 `{pad:99,x:5}`。每个进程都有结果校验。
`readPlain` 用第二个参数读取，证明普通 get_field_rdi 不依赖融合入口也能生效。

`SPARSE-to-VERIFY_OFFSET_NO_UPDATE.patch` 只有正式优化；`verify_diag.inc` 与 build.py 中的插桩只进 counts 构建。
`raw_timings.csv` 汇集本轮 134 个正式 Release 进程的原始时间；对应 JSON 保留完整命令和 stdout。
诊断每个静态位点使用独立的 C 分配记录，函数释放时移除地址映射，退出时输出，避免地址复用混淆计数。
该诊断存储不持有 JS 对象或 shape 引用，不改变 Release 的 ReadICSite 尺寸。
诊断真实用例的计数覆盖整个脚本，包含 Setup 和校验；Release 的正式计时仍按旧脚本排除 Setup/加载。

## 只追加一轮 Octane

```bash
python3 "$TASK/octane_repeat.py"
```

两版都现场跑，每项每版一个新进程，按表项交替版本先后顺序。复用原 Release 二进制，不重编译，不重跑 SunSpider。
自动建立 `octane_repeat01/`、`octane_repeat02/` 等新目录，保留上一轮数据；目录内给出本轮时间、相对 SPARSE 的百分比和上一轮百分比。
