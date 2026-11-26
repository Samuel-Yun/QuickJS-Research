# 复现零命中构造 IC 对照

这次只研究两个合格构造目标交替进入同一个 new 位点。NORMAL 是冻结 SPARSE_CTOR_IC；BYPASS 只在 `OP_four_ctor` 中直接调用原普通构造，保留记录解码、参数所有权、异常路径和栈清理。COUNTS 独立统计 NORMAL 的实际命中与失配工作，不参与计时。

## 看已有结果

`results.md` 是完整结论；`analysis/samples.csv` 保存两组各 5 次原始时间，`summary.csv` 是中位数及范围。计数按阶段保存到 `analysis/work_counts.csv` 和 `analysis/data.json`。raw/{gate,counts,measure}/runs.jsonl 保留全部命令、进程 PID、起止、退出码、stdout/stderr、校验和与二进制哈希。

```bash
python3 js-interpreter-bench/experiments/ctor_miss_cost_20261121/attempt01/analyze.py
python3 js-interpreter-bench/experiments/ctor_miss_cost_20261121/attempt01/audit.py
```

上面只重新整理已有数据，不会启动性能测试。

## 在新 attempt 重跑

在仓库根目录执行。若 attempt02 已存在，换一个新的编号；不覆盖旧实验。

```bash
BASE=js-interpreter-bench/experiments/ctor_miss_cost_20261121/attempt01
REPRO=js-interpreter-bench/experiments/ctor_miss_cost_20261121/attempt02
mkdir "$REPRO"
cp "$BASE/build.py" "$BASE/run.py" "$BASE/analyze.py" "$BASE/audit.py" "$BASE/probe.inc" "$BASE/probe_site.inc" "$BASE/ctor.js" "$REPRO/"

python3 "$REPRO/build.py" NORMAL
python3 "$REPRO/build.py" BYPASS
python3 "$REPRO/build.py" COUNTS
python3 "$REPRO/run.py" gate
python3 "$REPRO/run.py" counts
python3 "$REPRO/run.py" measure
python3 "$REPRO/analyze.py"
python3 "$REPRO/audit.py"
```

构建从 `ctor_ic_followups_20261115/attempt01/03_sparse_ctor/source.tar.gz` 读取冻结源码，按 manifest/源码包哈希核对。NORMAL 的 38 份源码保持逐字节一致；NORMAL.patch 为空。BYPASS.patch 只有一个 handler 的替换，没有在准备阶段关闭构造记录或改回 opcode。

`ctor.js` 逐字节复用 `sparse_whitebox_20261116/attempt01/ctor.js`。三版参数都是 `positive 0 67108864`。原 JS 中两个函数名是 A/B，循环中的变量名是 C；其角色就是两个合格目标 C/D 交替，文件没有为重命名而改动。长度 65,536 的输入序列先生成，再计时执行 ctorLoop；唯一工作 new 位点的 pc=18、argc=2。

门槛检查只用短输入和旧 safety.js 对照结果、异常行为，并用短高命中输入确认计数版能记录正命中。正式测量仅目标 0% 这一档：两组各 5 个新进程、每轮交换顺序，全部保留。无额外预热，首个调用计入；CPU 2、Asia/Shanghai、C locale。没有重新校准 N，没有跑 Octane/SunSpider，也没有改缓存策略。

COUNTS 通过 `CTOR_PROBE_FUNCTION=ctorLoop` 选择诊断函数及唯一构造位点，不通过改 JS 加开关。使用进程全局计数，未定义 FOUR_DIAG，未增加每点诊断指针或缓存元数据。数组阶段依次是：已有计划尝试、普通构造前资格检查、普通构造后学习、负记录检查、原普通构造。`four` 数组依次是 q/h/eligible/fill/guard/overflow/work1…work6。`negative_queries` 只统计普通构造前的负缓存判断。

计数版时间不进入正式表。其插桩仍会影响生成代码和执行，因此这里报告的是独立诊断进程的命中率及操作次数，不把它冒充 Release 计时进程的逐次轨迹。两组时间的差异代表这条整体缓存路径的成本，未单独测量每个 helper 的耗时。
