# 读 IC wrapper 内联：A/C/D 独立 campaign

参考提交 `696cfd8530fca5d52e9358a626e03d9280ea7008`，开始时 myx、工作区干净。
只研究 `JS_GetPropertyInternalWithIC` 的调用边界及编译器派生变化，不实现新缓存算法。
最终状态以 `analysis/completion.json` 为准；文件/脚本存在不等于实验完成。

**本轮已实际完成**：1890/1890有效正式样本（Octane1440、微基准450）、42次所选工作量
C/D诊断、10次独立机制诊断、144次GNU time RSS检查。源码/机器码审计通过。
主集合C/D GM=1.002397，95%CI [0.996519,1.005729]，整体方向不明确。
M2与Richards分别减少9.93%和5.11%时间；M1增加1.93%，RegExp增加14.95%。
详细数字与边界见results.md。未提交/推送，未追加下一项优化。

A 是冻结 upstream 04be246001599f5995fa2f2d8c91a0f198d3f34c；C 精确复用上一轮填槽修复；
D=`read_ic_wrapper_inline`，仅在 C 的读 wrapper 声明增加现有 `force_inline`。
共享 probe、写 IC、所有检查和引用处理不改。三者新建目录、同 GCC13.3.0/官方 -O2 构建，
无 -DNDEBUG/LTO/PGO；完整命令见 raw/build。旧时间不并入本轮。

## 计时与事先声明

WSL2 Ubuntu24.04.2 x86_64；实际 host/kernel/制品 hash 见 manifest.json。
Setup、静态加载/编译、适配器在 timer 外，首次 Run 与 N 次重复都在内部单调时钟区间，
无额外性能预热。动态编译、GC/helper/builtin/RegExp 和原计时内断言照常计入。
微基准每次完整目标调用含4096轮；M5的字段验证在 timer 外。五项独立，不计算它们的GM。
driver 的调用、checksum 累加和支撑循环计入，不能称单指令 self-time。

每项共同N倍增，ACD/CDA/DAC三组共9个独立pilot都≥1000ms后冻结。
正式每项30三元组，六排列各5次、固定seed20261023、组内相邻、串行新进程。
目标 Octane1440、微基准450；不删异常值或偏短样本，无自动失败重试。
恢复只跳过已经有记录的位置（包括失败），不补跑到显著。

主要 C/D=median(C)/median(D)，>1为D快；另报A/C、A/D。
逐项10000次三元组配对bootstrap；GM预先定义为suite内子项GM、suite等权GM，
跨全体case共享完整rep轮次分块bootstrap10000次。95%区间为探索性，未多重校正。
Q1/Q3采用Tukey上下半样本中位数，std为n−1样本标准差。
Crypto加载期随机padding仍未证明逐对相同，预先排除主GM，另做含Crypto敏感性。
Box2D缺可信门禁、zlib缺read、官方latency不支持的旧边界保持不变；不是官方Octane总分。

## 入口1：只重算公开数据（不需旧binary/Linux绝对路径）

在本目录使用Python3标准库：

```sh
python analyze.py formal
python analyze.py diagnostics
python supplementary.py
python replay_previous.py
python archives.py verify
python audit.py
python portable_check.py
```

CSV显式LF；上一轮只读重算写入recovery/prior_replay，验证数值和LF规范化文本一致，
不改旧CSV/raw/manifest/hash。身份审计另行 `python identity.py`，可加
`--map /home/mzyx/legacy_ng_ic_read_hit_attempt01=/your/restored/builds`。

独立审计为`PASS_WITH_CLOCK_METADATA_LIMITATION`：UTC开始顺序有序，但82处
“UTC开始+单调时长”的混合推算与下一条UTC不一致（最大873.542ms，原因UNKNOWN）。
原始1440个Octane绝对单调区间不重叠；微基准只记录elapsed，没有绝对起止值。
串行性另由冻结runner的blocking subprocess.run与schedule支持。不修改raw来消除差异。
Windows Python3.11.4公开数据重算：22份输出21份逐字节一致，aggregate.json仅浮点末位
差异且数值在1e-12容差内匹配；原Linux输出保持不变。

## 入口2：源码与诊断材料恢复

源码不需bare历史库。A来自上一轮 recovery/sources/base.tar.gz，C来自上一轮
sources/C_quickjs.c、B_quickjs-opcode.h 及NG archive中的LICENSE；这些全部有冻结hash。
`prepare.py`核验恢复A/C与前轮逐文件身份完全相同，再应用本轮一行干预。
CRLF原始与LF发布身份继续分开保留，不更改历史hash。

诊断raw只提交gzip，原始/压缩SHA与尺寸见逐文件.metadata.json；
`python archives.py restore --destination /new/empty/directory`可恢复原JSON。
计数为整进程、已重写IC查询，单位函数+atom，不是逐site。
占用为每单位生命周期最大值，非时间加权；直接请求字节不等于RSS/间接shape保活。

## 入口3：重建并启动新的 campaign（不能覆盖本目录）

```sh
python new_campaign.py --destination ../attempt02
export IC_READ_STORE=/your/new/linux/builds
export IC_READ_COHORT=your-host-linux-x86_64
cd ../attempt02
python3 -B prepare.py
python3 -B build.py release
python3 -B machinecode.py
python3 -B build.py correctness
python3 -B diagnostic.py build
python3 -B run.py init
python3 -B run.py correctness
python3 -B mechanism.py
python3 -B run.py calibrate
python3 -B run.py formal
python3 -B analyze.py formal
python3 -B diagnostic.py octane
python3 -B analyze.py diagnostics
python3 -B memory.py
python3 -B supplementary.py
python3 -B archives.py verify
python3 -B post_static.py
python3 -B audit.py
python3 -B finish.py
```

Octane submodule必须恢复官方2.0精确commit `570ad1ccfe86e3eecba0636c8f932ac08edec517`，
不能换latest；原始hash及LF规范化hash在recovery/workload_line_endings.json。
不要在完成attempt重跑构建；formal可resume已冻结schedule缺失位置，不覆盖已有raw。
bootstrap/upgrade_analysis仅记录本轮工具复用过程，不是复现时要重复执行的命令。
性能采样不含计数/trace/sanitizer，与诊断/构建串行。大制品放Linux STORE，普通Git不收巨型JSON。

## 证据入口

- correctness/：旧952断言、多槽9场景28151断言、新7场景287断言、上游与序列化门禁。
- machinecode/：正式制品hash、symbols/size、两个读opcode与写opcode局部真实反汇编。
- cases/、bytecode/README.md、correctness/target_units.csv：五项源码与路径，驱动IC活动单列；
  bytecode是执行前最终编译表示，运行期*_ic改写另以计数确认；使用.target_only.txt而非早期宽过滤片段。
- raw/{calibration,pilot,formal,diagnostic,memory}/：阶段独立，命令、stdout/stderr、失败保留。
- analysis/：逐项、GM、端到端、内存、计数、图与审计；results.md为最终直白判读。
- failures.md：初版工具/时钟审计失败、诊断manifest文字更正及保留记录的处理方式。
