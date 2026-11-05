# 当前停止；下一次明确恢复时用的最短复现

本轮不再自动执行任何实验。不要删除attempt01/STOP_WORKER或本目录STOP_EXECUTION，不重开旧collect/worker，不补旧未完成位置。

先在用户认可的稳定执行环境中运行最小C_light诊断，仍用新label保存结果。
下面命令**本轮尚未执行**，是精确恢复入口，不是已通过证明。需从仓库根目录执行，允许访问既有WSL Ubuntu。

```powershell
python js-interpreter-bench/experiments/splay_ic_20261104/attempt02/host_run.py manual_repro01 --timeout 35 --hypothesis "Locate the missing C_ON diagnostic completion with an acknowledged Linux child PID" --changed-factor "New bounded recorder only; same verified artifact and JS" -- -d Ubuntu --cd / --exec python3 /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/splay_ic_20261104/attempt02/reproduce.py manual_repro01
```

reproduce.py检查实际ELF、大小、SHA和目标JS SHA。身份不符先报告，不能只读旧manifest继续。
它设置SP_DISABLE=0，保持冻结脚本/输入，并提前保存Linux child PID和boot；引擎上限15秒。
计数输出路径使用新的label，不覆盖已存在的wx文件。若需OFF另选新label并加`--off`；不要只改label便无限重试。

如果仍出现宿主退出而没有Linux完成记录，保留recovery/manual_repro01及reproductions/manual_repro01，交由宿主/WSL执行环境排查；根因仍UNKNOWN。不要称为C_ON正确性失败。
若能稳定完成，**新建attempt03/新campaign**，核验冻结制品/依赖/host，再补完6个计数门禁；16个旧正确性记录可作历史证据，但不伪造新的完整门禁。
之后才是240机制正式→唯一OPT决策→17项1530或2040正式→Splay/numeric独立复测。新正式campaign要求单一boot，不能把本轮短正确性时间补入。

当前可立即安全执行的只有离线重放：

```powershell
python js-interpreter-bench/experiments/splay_ic_20261104/attempt02/finalize_partial.py
```

该命令只读raw，检查已有次数/布局/身份记录，不启动引擎。summary中没有中位时间、比值或GM。
