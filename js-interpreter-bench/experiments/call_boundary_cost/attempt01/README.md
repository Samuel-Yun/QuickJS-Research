# 调用边界成本定位：扰动验证失败，已按协议停止

先读 [results.md](results.md) 与 [decision.md](decision.md)。状态是 **BLOCKED_PERTURBATION**，不是已经证明调用成本小，也不是只交付计划：已实际构建并采集两批验证，第一批107/108、第二批108/108，215条全部保留。最终没有负载同时通过两个原定门槛，因此未运行9个长窗口、未做原A成本归因。

## 直接复查

- `summary.csv`、`ratios.csv`：完整第二批统计；`validation_analysis_p7000/`保留首批、`validation_analysis_p23000/`保留整批降频后的结果。禁止跨批拼接。
- `correctness.csv`、`correctness_gate.json`：18个独立N1/N2正确性；两批selected_correctness另有18个有效进程。
- `raw/{pilot_p7000,pilot_p23000,validation_p7000,validation_p23000}/`：命令、制品/脚本/输入SHA、stdout/stderr、内部/外部时长、进程CPU与上下文切换。前者校准，不混入正式验证统计。
- `raw/samples/`：143条SHIM报告的572个gzip文件（PC二进制、meta、begin/end maps）；PC格式是little-endian两个uint64：RIP、CLOCK_MONOTONIC纳秒。原始二进制和解压SHA在各进程JSON，`delivery_analysis_v2/archive_integrity.csv`统一核验。
- `delivery_analysis_v2/delivery.csv`：每进程实际间隔分布、样本数/CPU秒、窗口CPU利用率、溢出、pending、窗口外记录；不作为原A热点表。v1最初只有min/median/max，v2补充mean/p10/p90，二者都来自同一公开raw，未重采或改raw。
- `profile_summary.csv`：长窗口全部未运行，计数留空且标状态，不用0冒充测得零开销。`address_categories.csv`也明确NOT_ATTRIBUTED/UNKNOWN；不能把整个JS_CallInternal算作入口。

## 冻结身份与实际构建

平台：同一Windows宿主的WSL2 Ubuntu24.04.2/x86_64，GCC13.3，源码04be246001599f5995fa2f2d8c91a0f198d3f34c / QuickJS2026-06-04。只研究原版A。

|制品|SHA256|
|---|---|
|冻结BASE|584335adb82c6052395e5a9526ca1be05480d5d8e60469fd14403156b62a8dd1|
|SHIM_OFF 与 SHIM_ON，同一ELF|dfc547ff0db4a4318c812a65f4d2d485a9a2bb169aee405152bf4a596268c437|

绝对路径、所有复用对象SHA、compiler/link flags见manifest.json和initial.json。sampler.c单独编译，仅在qjs.c增加注册调用（sampler_shell.patch）。核心quickjs.o/repl.o及其它VM对象原样复用、顺序不变，sampler.o加在原对象之后、系统库之前。没有加NDEBUG/LTO/PGO/frame-pointer或padding，没有改正式A。

实际命令原样保存在`raw/commands/compile_shell.json`、`compile_sampler.json`、`link_shim.json`；从`make -n -B qjs`提取原构建参数，未在原目录执行重编译。用原对象/原链接命令产生的base_relink_check与冻结BASE逐字节相同。`native_instruction_compare.json`保存原/新JS_CallInternal对照，完整限定函数反汇编在对应raw/commands中，不导出整份引擎。

新binary/对象都留在`/home/mzyx/call_boundary_cost_attempt01/`，不纳入普通Git。当前C编译有_GNU_SOURCE重复定义、header未用参数和语句缩进警告，原始stderr保留；编译/链接退出码均0。没有为消警告更改验证期间的制品。

## 采样与脚本边界

两个新增全局C函数是`__cbBegin`、`__cbEnd`。SHIM脚本相同，ON/OFF只改`CALL_BOUNDARY_ON`；BASE没有两个区间外调用。共同JS workload和标准测量loop逐字保留，对象/静态编译/Setup在计时外；首次Run在内，无额外workload预热。Richards的原断言每Run仍执行，两个微基准保留原结果规则。

begin在屏蔽SIGPROF时分配/预触缓冲，先检查原handler为default、timer为0且单线程，不覆盖既有用途；开启后只用lock-free原子和clock_gettime记录。buffer指针/容量在handler可运行期间不变，main在阻塞、停timer、drain pending、恢复旧状态后才读/释放，单线程无同时访问。handler保留errno，无malloc/stdio/锁/VM回溯。实际handler反汇编有lock xadd/add、errno与clock_gettime，记录在raw/commands/sampler_handler_disasm.json；异常栈保护路径存在但不作为正常执行证据。

没有禁用ASLR。保存maps、ELF PT_LOAD；mapping/five_PC_mapping_smoke.csv和对应addr2line raw只验证五个地址的load bias与inline解析，**不是采样分类或热点证据**。目标前后完整bytecode的新直接dump未做，保持UNKNOWN；旧dump/读取和调用次数仅引用前轮，不冒充本次观测。未执行的bytecode_gdb.py、static_map.py全分类入口、review_mapping.py及analyze_profiles.py不是已验证成果；停止后没有为补它们扩大工具准备。

## 只读公开raw重算（不需要旧ELF或/home路径）

在仓库根，用Windows或Linux的Python标准库，给每次重算新的输出目录：

```text
python js-interpreter-bench/experiments/call_boundary_cost/attempt01/analyze_validation.py --period-us 7000 --output /新的目录/replay7
python js-interpreter-bench/experiments/call_boundary_cost/attempt01/analyze_validation.py --period-us 23000 --output /新的目录/replay23
python js-interpreter-bench/experiments/call_boundary_cost/attempt01/analyze_delivery.py --output /新的目录/delivery
python js-interpreter-bench/experiments/call_boundary_cost/attempt01/audit_independent.py
```

前两个入口对同轮完整9进程块重采样10000次，seed20261029；点估计为中位数之比。Q1/Q3为上下半样本的中位数，stddev分母n−1；区间线性百分位。描述统计保留全部有效记录；首批配对只用11完整轮块，第二批12完整轮块。数据中的命令/home路径仅作来源记录，重算不会打开那些binary。

## 中断与失败记录

首批最后一个Richards/SHIM_OFF位置未启动，没有reservation。恢复不补跑、不重试已开始的位置，`recovery_protocol.json`在分析前披露107记录/11完整轮规则，工程阈值不变。首批末条ON的UTC跨度约3h51，而内部/外部单调和CPU约7.2s，原样保留；原因UNKNOWN，不将UTC用于性能。

由于外部中断，原4小时墙钟门禁已跨越；在用户明确继续后另记90分钟有界恢复段，不重写原started.json。WSL在阶段间可能重启，不比较跨boot绝对单调值。原采样器搭建/可用性检查用时小于60分钟。没有claim所有墙钟都在4小时内。

首批仅Richards采样门禁失败，故按预先规则只降频一次23ms、重新采完整108条；第二批三个负载仍至少一项未通过，停止，不再开第三批。第一批较好位置没有拼入第二批。后续长窗口是门禁拒绝，不是工具未写或以其它数据代替。

## 换行与材料恢复

`previous_hash_normalization.csv`逐项给出上一轮5个源制品CRLF SHA与LF正规化SHA。Windows当前字节匹配旧源制品清单；Git LF checkout会有不同SHA，不能改旧hash“修通过”。所有旧raw/清单保持不变。

本attempt局部.gitattributes让新文本为LF，inputs/scripts与gzip不做文本转换。最终public_files_sha256.json同时记录实际字节与LF正规化SHA；未自动提交，不声称已核验提交后的checkout。raw档案解压：`python -m gzip -d 文件.gz`（会生成同目录文件，建议先复制到新临时目录），恢复后对照uncompressed SHA；CSV统计可只凭公开JSON/gzip再算，不依赖大对象或历史bare库。

## 最短恢复路径与实际命令

仅在需要重新研究时，先安排空闲、稳定的同平台窗口，再建立新空attempt并使用独立STORE/cohort，不覆盖本次raw。复用同一BASE与对象，按顺序运行`inspect.py`→`build.py`→`run.py init`→`run.py correctness`→`run.py validate --period-us 7000`，只在原规则允许时完整降频一次。制品/对象丢失则从固定源码与原GCC参数恢复并登记新identity，不能改旧SHA冒充原制品。

本次实际恢复命令为`recover.py seal`、`recover.py fallback`，随后两个raw-only分析与`close_blocked.py`；不能在本attempt再调用validate/profile以补数据。工程门槛未过前不运行长窗口，不安装perf、不sudo、不改内核权限、不构建V8、不增加案例或VM优化。
