# 平台、boot与口径

原A、原M、U及V8_ON均在同一WSL2 Ubuntu24.04.2/x86_64环境执行。主机LAPTOP-QPKCPDCB、Ryzen75800H，guest核报告8核16线程，guest可见RAM约8GB；不是把旧Windows时间与Linux相除。QuickJS编译器GCC13.3.0，Release采用既有-O2 -g -fwrapv、保留断言，无新增LTO/PGO/NDEBUG或布局padding。V8为固定官方预编译制品，其实际构建compiler/build flags/commit保持UNKNOWN，不将QuickJS的GCC参数套用给V8。

runtime.json中的a1d0292d…是最初**制品与环境检查**时的boot；该次WSL调用结束后曾空闲退出。正式串行worker从1068b14c-57e2-45ad-834a-ead7c847e439启动，机制、SunSpider、micro以及Octane各自frozen.json/逐条raw记录此boot。不能把初始环境检查boot当正式计时boot，也没有用两个boot拼齐正式位置。worker只为本任务串行执行并保持WSL可用，最后通过STOP_WORKER退出，不安装服务或定时自启动。

四个campaign目录独立：mechanism有1次显式准备Run，数据仅解释控制构建内的缓存结果采用比例；其余三者首次Run计入、无额外workload预跑，Setup/静态加载在外，GC/helper/builtin/RegExp/运行期动态编译保留。不同campaign的新旧时间不直接相除。micro driver的config.N支撑读见micro/README.md，不能称全区间零IC控制。

每个性能进程只启用记录的普通运行参数，V8固定--jitless --no-lazy --use-ic。诊断计数、字节流观测、gdb/反汇编和sanitizer与性能进程分开；无并行构建或其他本任务基准。实际原生时钟差值必须被外部perf_counter_ns区间包围（5ms浮点/调度容差），不比较绝对时钟原点，UTC仅为溯源。

Linux进程affinity={2}，不声称独占宿主物理核心。持续宿主后台控制、频率/温度、功耗状态UNKNOWN，没有擅改系统配置；逐样本保存guest负载与整个子进程user/system CPU。perf命令一次能力检查退出127，未安装或修改权限。snapshot/ICU显式核对SHA；其它动态库另在post_identity记录，不能声称已持续观测所有系统库。

Crypto采用既有BENCH_ONLY_XORSHIFT32_PRELOAD_V1、seed305419896，N1/N2/selectedN四制品各plain/observed实际核对。复用算法的旧summary scope文字包含three conditions，crypto_identity_reuse.json已明确本轮是四制品、实际8进程；以当前protocol与逐进程记录为准，不把旧文字当少验一个制品。此协议只针对基准输入，不是安全随机数方案。
