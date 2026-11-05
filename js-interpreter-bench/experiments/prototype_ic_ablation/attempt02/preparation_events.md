# 准备阶段非性能失败记录

这些是命令/记录工具的准备问题，不是qjs正式失败，也不计入465个实验进程。

- 最初git只读检查遇到dubious ownership；改用每命令精确路径
  `git -c safe.directory=C:/Users/mzyx/Desktop/0921 ...`，未改全局Git配置。
- 首次尝试发行版名Ubuntu-24.04，返回WSL_E_DISTRO_NOT_FOUND；
  `wsl --list --verbose`实际仅列Ubuntu/WSL2。未安装新发行版。
- 随后第一次Ubuntu Python检查退出1、无Linux输出，只有WSL localhost代理警告。
  最小`uname -a`成功后，同一只读SHA/file/ldd检查成功；启动失败原因UNKNOWN。
  启动命令间boot曾变化，正式runner内的一个持续Python进程则保存同一boot。
  这些WSL包装器警告在引擎外，不冒充qjs stderr。
- 首次Windows电源方案文本读取的后台解码线程出现
  `UnicodeDecodeError: 'gbk' codec can't decode byte 0xa1 in position 10`；
  host_windows.json保留CPU/AC/电量记录，power_plan为null。
  将powercfg输出先按bytes捕获再UTF-8解码，独立保存host_windows_retry.json，
  未覆盖前记录；结束后保存host_windows_after.json。

新runner只改路径/初始化/采集次序和子进程CPU时间记录。复用旧workload.py生成和校验，
复用旧analyze.py的统计函数；新代码未触碰引擎。所有正式记录一次运行，无失败重试。
