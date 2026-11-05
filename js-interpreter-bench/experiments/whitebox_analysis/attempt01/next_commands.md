# 复核与续跑（当前工作已完成，默认不自动再跑）

PowerShell，从项目根目录：

```powershell
wsl.exe -d Ubuntu -- python3 -B /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/whitebox_analysis/tooling/audit_micro.py
```

Linux同distro的续跑入口（只复用同设计的有效唯一位置，不重跑已完成样本）：

```sh
cd /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench
python3 -B experiments/whitebox_analysis/tooling/run_micro.py formal
```

本轮正式已360/360，不需要恢复。复核diagnostic报告：

```sh
python3 -B experiments/whitebox_analysis/tooling/report.py
```

原始配置/flags/adapter路径在attempt01/manifest.json，selected-N和schedule在
microbench/。resume只适用于当前冻结协议；失败位置保留并需具体诊断，不靠重试到满意。
输入/工具/flags/host改变要建立新attempt/cohort；当前tooling的ATTEMPT常量集中在
common.py，当前版本没有自动新cohort获取器，不能仅替换路径伪称迁移完成。
未来原生Ubuntu迁移须重新准备同版本runtime/依赖/时钟/执行模式验证并生成新manifest。
perf工具未安装；WSL vPMU可读但非native环境等价。V8参考源码下载遇到TLS信任链
失败(raw/reference.*)，本轮不关闭TLS验证或更改系统安全设置。下一阶段需新授权。
