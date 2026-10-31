# attempt03：同一修复版E，新boot的新采集

attempt01的旧E未通过新增回归，558条时间不用于性能结论。
attempt02修复并通过安全门禁，开始新采集；客户端中断后WSL重启，仅保存169条、
3个全case完整共同轮次。它是外部中断，不是E的新正确性失败。
attempt02的raw和探索性summary保留，不往其中补跨boot位置。

attempt03不再改源码或重建E：复用attempt02精确Release SHA
3d36ec898484efca3a3a445662d1e9cfec1ec83c1fcce98e8cf8e0c7b908e482。
A/d8/snapshot/ICU/系统依赖均再次核SHA；仍同一主机/OS/architecture。
安全门禁的旧实际运行证据被明确复用，路径指向attempt02/raw/validation，
不冒充本boot再次运行的测试；工作负载N1/N2、输入摘要、时钟、校准、正式全部新跑。

独立隐藏Windows进程运行WSL采集，不依附交互式工具PTY；启动PID与日志已公开记录。
不安装服务、计划任务，不更改系统保护、电源或WSL设置。若外部仍终止进程/重启，
本attempt照实中止，不跨boot补齐。启动器不控制也不绕过产品侧的内容提示。
