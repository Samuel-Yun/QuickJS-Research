# 恢复命令：只在Windows和WSL恢复后执行

本轮的唯一一次可用性重试已失败，不自动运行下列命令。
WSL错误为`Wsl/Service/CreateInstance/CreateVm/WSAENOTCONN`；随后Windows报告
`0x800705AF`（页面文件太小）。先恢复宿主资源与WSL可用性，具体因果仍UNKNOWN。
没有自动关闭distro、改服务、改页面文件或重启主机。

在Windows PowerShell核验WSL可启动：

```powershell
wsl.exe -d Ubuntu --exec /bin/cat /proc/sys/kernel/random/boot_id
```

以下路径对应当前仓库，不改冻结制品，不重跑旧诊断。
单独终端保活（新tag；不得删除旧STOP）：

```powershell
wsl.exe -d Ubuntu --exec python3 -u /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/ic_search_lab/v6_targeted_ic/keeper.py accept02
```

另一个终端依次执行；任何命令失败就停止，不盲目粘贴全部执行：

```powershell
wsl.exe -d Ubuntu --exec python3 -u /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/ic_search_lab/v6_targeted_ic/clock_check.py accept02
wsl.exe -d Ubuntu --exec env V6_EPOCH=accept02 python3 -u /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/ic_search_lab/v6_targeted_ic/accept_performance.py precheck
wsl.exe -d Ubuntu --exec env V6_EPOCH=accept02 python3 -u /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/ic_search_lab/v6_targeted_ic/accept_performance.py full --name full_accept02_sunspider --kind sunspider --labels A s001 B2 K1 L1
```

这是全新390条SunSpider批次，绝不补接accept01的2条，也不覆盖其protocol/raw。
若boot、OS、依赖或工具链有变化，单列新cohort/批次说明。不要把新旧boot拼成配对轮。
Octane已完成的255条和新SunSpider分别统计；不跨suite或boot求一个混合GM。
换机器或文件迁移时先显式恢复制品路径并核验SHA，不能偷偷重建后冒用旧身份。

新批次完成后再单独归档、重算，并判断是否满足正式30轮的原条件；没有明显超过s001
或可接受适用场景时，不为了完成配额而启动正式30轮。

无需运行WSL即可重算本次已保存的统计：

```powershell
python js-interpreter-bench/experiments/ic_search_lab/v6_targeted_ic/performance_report.py summary --epoch accept01
```

注意：旧analyze.py只对应以前隔离的记录，它不是本次新时间的统计入口。
