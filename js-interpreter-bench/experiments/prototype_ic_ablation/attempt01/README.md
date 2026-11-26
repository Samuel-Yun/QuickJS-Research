# 原H的同ELF原型填充开关：attempt01

**状态PERFORMANCE_ENV_UNSTABLE：正式0/384。** 两组原H稳定性检查
超限，按原协议停止。不是已完成384样本，也没有ON/OFF性能结论。
读results.md、decision.md；机器可读结论在analysis_final/audit.json。

## 固定来源与实现

仓库myx起点92b2350708494f8037b19bba3a3323cf5e6b3f47。先核对实际
工作区和原H清单，原M/H只读；源码、旧raw/summary没有改写。

- 原M SHA：7b6fa1e896e31988b9d8a5276581477776fbd01ab079a64394b6111def7d87ef。
- 原H SHA：37b1aa9f755e94fb0db61a789d78c97addbff61835b99f3288a3ceb26e8932e4。
- 新switch SHA：e4c346263639aab390a033a7d0bb1892bb747821c68919c816803a65ae98f44d。
- 编译源码/完整命令/flags在manifest.json与raw/commands，GCC13.3，
  仍为-O2 -g -fwrapv，无新增NDEBUG/LTO/PGO/frame-pointer/padding。

H→switch补丁只动三文件。switch_init.inc保存两个file-static int；
qjs main在创建runtime前初始化，只接受明确0/1；不在JS暴露API、
不增加runtime对象字段。仅继承填充条件检查已保存值，own IC仍在。
两条件保留H同样24B/site、eager数组和holder类型/shape守卫；OFF不是M。
初始化为本实验CLI私有接点，不把它当作通用生产嵌入API。

## 计时与止损

四个原workload从H实际归档脚本复制，初始N脚本逐字一致；只有共同N
需要倍增时才允许改外层次数常量，本批无需倍增。原JS payload mode
仍是H_FIRST_CALL_INCLUSIVE_MONOTONIC_V1（为保持字节身份未改标签），
外层raw独立标本批cohort。adapter、循环/方法、断言与输入没有改。

native performance.now/CLOCK_MONOTONIC内部计N次完整Run，首次包含，
不提前预跑。微例对象/Setup在外，Richards Run原有创建和GC/helper/
断言在内；不是每次都冷，也不是属性self-time。外部perf_counter_ns
另列，不用UTC差计时。各条件相同固定CPU15，不能保证宿主频率稳定。

32个pilot均≥1s，共同N为8192/16384/32768/512，16个选定N校验通过。
原H numeric_control/N32768两组各12次：IQR/median为10.659%/12.642%，
max/min为1.43864/1.42780，均超过10%或1.25的工程止损线。中间只
整理一次，未改源码/N/系统设置；无第三组，不运行384正式进程。

schedule.json预先冻结24轮、每轮16位置，四条件全部24排列各一次、
案例各位置6次；这是计划。analysis_final/missing.json保留384个缺失。
正式summary/ratios空值标NOT_RUN，不填pilot、历史时间、epsilon或假区间。
分析脚本若有完整块可按预定10000次块级bootstrap计算，但本批实际0次。

## 已执行步骤（复查用，禁止在本attempt重新采样）

```sh
python3 -B build.py build
python3 -B test.py semantic
python3 -B prepare.py
# prepare在新C测试编译处停止，保留serial_build.json
python3 -B finish_prepare.py
# 修正C测试后热加载通过；新sanitizer构建被WSL重启中断
python3 -B inspect_build.py
python3 -B close_preparation.py
python3 -B performance.py
python3 -B close_identity.py
python -B finalize.py
```

Windows额外只读host_record.py保存Git、电源方案、供电权限拒绝及
进程累计CPU快照。累计CPU不是当前后台利用率；供电/频率仍UNKNOWN。
WSL性能阶段同一boot；准备阶段重启记录另存，未拼接绝对单调时间。
所有构建在/home/mzyx/prototype_ic_ablation_attempt01，不放进普通Git。

## 只用公开raw重算（不用WSL或旧runtime）

Python3标准库，Windows/Linux均可；从项目根目录示例：

```sh
python -B js-interpreter-bench/experiments/prototype_ic_ablation/attempt01/analyze.py --output replay_ablation_new
```

脚本校验16份gzip压缩/解压SHA、script SHA、OFF零继承项、24B与引用
平衡，重算两个稳定性组的Tukey四分位数/门槛，审计计划排列与实际缺失。
不打开manifest中/home或/mnt下的ELF。输出目录必须新建，拒绝覆盖。
analysis是首次分析末尾打印错误前留下的完整文件，analysis_final是
修正CLI成功执行的结果；两份逐字节核对，不隐藏开发失败（failures.md）。

## 结果索引与恢复边界

- correctness.csv：64个新语义进程，旧修正版strict directive与独立断言保留。
- workload_correctness.csv：四案例四条件N1/N2，共32进程。
- target_sites.csv、mechanism_sites.csv、cache_memory.csv：全进程诊断，
  source SHA/instance/final PC关联，不是性能。bytecode_comparison.json
  核验ON/OFF最终字节码/site数相同；数组请求字节不等于RSS。
- gates/serialization.json：同一C host、ON热写、OFF/ON copy/ROM读，
  OFF仍不填继承、ON重填，环境后改不变选项，引用清理平衡。
- gates/sanitizer.json：明确未完成，不能冒充PASS。原H OOM/GC/ASan
  仅引用其已验证范围；本轮不再建一套OOM或采样器。
- assembly.json、switch_assembly_excerpt.txt：一次有限真实反汇编；
  path_table.md区分源码、实际计数与候选成本。
- raw/commands含每进程命令、option、返回值/退出码、stdout/stderr、
  内外单调时间、boot、affinity与其余环境SHA；首次失败原样保留。

诊断gzip旁identity.json含压缩/解压SHA，脚本直接读取，不需手工解压。
新文本LF；复制旧JS保留字节，scripts/inputs用Git -text防止换行改SHA。
不用bare历史或巨型归档。源码恢复沿原H README的固定base+M+H补丁，
再应用本H_to_switch.patch；当前ELF存在且身份已核验，无需重建它。

**下一次运行必须新attempt/cohort、独立STORE和输出。** 复用这三个
冻结ELF与原输入，先核验哈希/依赖，按相同协议在安静窗口检查；不要
清理本attempt、重跑已有位置或把新boot补入旧计划。需要复用旧门禁
时明确标来源，不将其计作新执行。当前停止，不自动开始后续策略。
