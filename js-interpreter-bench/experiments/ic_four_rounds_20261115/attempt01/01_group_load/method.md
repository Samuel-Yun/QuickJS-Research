# 第 1 轮 GROUP_LOAD_IC

独立从冻结 C 派生，未包含 3B；原 C strong shape 转换缓存保持不变。正式计时为 43 项各一个新进程，C 使用旧单轮，A/EVAL_COLD/V8_ON 为旧 30 次中位数。全部比较是跨批次筛选，不将小差异称为稳定收益。单位 ms/完整 Run，负数代表耗时下降。Octane 为 14 suite 分层等权 GM，SunSpider 为 26 项等权 GM；下方保留全部逐项和耗时之和。

## 实际覆盖

先用只观察、始终执行原读取的 probe 构建跑原 Run 区间。DeltaBlue 两次读取同时满足普通 own 数据字段 1,657,344 次，RayTrace 179,456 次；Richards、access-nbody 没有本模板。全集有覆盖的 9 项：DeltaBlue、Crypto.Encrypt/Decrypt、RayTrace、Boyer、PdfJS、Gameboy、Typescript、access-binary-trees。probe 不启用组合快路，不把可特化次数当作命中。

独立 counts 版：尝试 29,736,336 次，实际命中 29,662,795 次，回退 73,541 次，其中 72,066 次可学习并填入缓存、1,475 次未满足两个 own 数据字段条件。RayTrace 有约 1/3 的布局失配；所有回退均计入正式耗时。逐静态点数据（函数字节码实例内 PC、原字节码 hex）在 runs/counts/*/runs.jsonl；全项覆盖表在 analysis/coverage.csv。

## 实现与真正省掉的工作

识别最终字节码中的同一局部/参数 load → get_field → 相同 load → get_field，要求两个不同 atom、中间无调用/写入、无内部跳转或 catch 入口。RayTrace 的真实例子为匿名函数 PC 353：get_field_rdi(site1) → v6_get_arg0 → get_field_rdi(site2)，前一条也是 get_arg0；DeltaBlue 匿名函数 PC 20 对应 get_loc0 的同类片段。这与 o.a.b 的 CHAIN2 不同。

准备阶段只在这些入口写入 `four_group`，保留长度 5 字节和内部指令；用独立的每组记录保存两个原 ReadICSite、一个 receiver shape、两个 offset 和边界 PC。对首个 B2 borrow 取消绕过入口的改写。命中只检查一次普通对象类别、非 exotic 与 shape，并取得当前 prop 数组，按原顺序 Dup 两个当前槽值；不融合乘法/加法，不缓存值。字段、shape 或任一属性种类不满足时，不修改栈或属性，执行原两段读取。首次学习也继续执行原序列。

两属性必须已经是 own 普通数据字段，且 receiver shape 为 hashed；记录强引用 shape，原 C 的 COW 保证其槽布局不被原地改写。新增 shape 根纳入函数的 GC mark 和 free，不能只缓存裸指针。普通读取 opcode 的原快路没有新增运行时前瞻；只有准备时确认的入口进入新 handler。

相对“两读均已命中的 C”路径，每次组合命中少一次对象类别和 shape 检查、一组 prop 基址获取。分派不能一律计成少两次：C 对 get_loc0/get_arg0 已有 B2 两段借用读取，这类入口原来共两次分派，组合版的普通 load + group 仍是两次；其他局部/参数模板才少两次。按实测命中站点及其 opcode 分类，后者累计省 30,749,956 次分派，B2 情况保守计 0，见 work_saved.json。组合版在 B2 情况反而多出 receiver Dup/Free，这是真实成本。

每个选中组在 x86_64 Release 增加 40 字节记录；原 ReadICSite 仍 24 字节。函数字节码头新增一个指针和一个 uint32 计数，字段合计 12 字节，整体对齐由编译器决定。记录尾随原准备后的字节码/IC 分配，只有匹配组支付组记录开销。

## 最少验证与局部耗时

原 C、Release、counts 和 ASAN+UBSAN 的 safety.js 输出逐字节相同，覆盖当前值更新、字符串/对象值、删除、重定义 getter 且精确检查调用次数、原型属性、Proxy 的 get 顺序、不同 receiver/布局和异常对象。ASAN leak detection 关闭，未跑完整 test262。

serialization.c 先运行编译结果使嵌套函数真正进入新执行镜像，再保存同一编译结果并普通加载、ROM 加载执行；四个构建全部通过。序列化恢复 get_field 和原 atom，拒绝外部序列化流直接载入内部 opcode；所有跨入口组在准备时排除。初版测试错误地尝试直接保存 JS closure 对象，原 C 即拒绝；修正为保存预热后的编译字节码，原始失败记录保留在 qualification.fixture_initial。

同一目标的 1,200 万次微基准：C 344.84 ms，组合版 454.98 ms（+31.94%），counts 确认 11,999,999 次命中。这个局部结果说明省一个守卫未能补偿本例失去 B2 借用后的值管理开销；不是把微基准当作全集覆盖。

## 最终耗时与判断

完整两套新单轮结果及全部回退见下面表格；最终 GM 由 analyze.py 从原始记录计算。主要观察 Gameboy、DeltaBlue、RayTrace 和 access-binary-trees，不能用未进入新 handler 的项目变化证明收益。

结论：保留可复现实验代码，是否有净收益以本轮下方全集结果判断；局部微基准已经显示负收益，不调整第二模板救成绩，也不叠加后续轮次。

## 复现

本轮相对 C 的 release.patch、source.tar.gz 和各构建 manifest 均保留。独立解压源码包后 `make -j2 -o repl.c qjs qjsc`。原仓库公共 build.py、qualify.py、run_bench.py 和 sequence.py 保存过程；构建目录防覆盖，新实验应复制本 attempt 到新目录并调整输入根，保留当前结果。正式单轮命令为 `python3 sequence.py 01_group_load release`，已完成项会跳过，不自动复测。离线 `python3 analyze.py 01_group_load` 重生成表格和实测源码包。

沿用 native_confirmation_20261108/attempt02 的原脚本、N、CPU 2、Asia/Shanghai、Setup/Run 边界；不加 warmup、LTO/PGO、重试或删除不利样本。计数版与 Release 分开。每项对应原过程的原校验均通过。probe 初次选跑三项产生的环境/审计保存在 *.partial3.json；之后只补齐其他项，没有重跑前三项。


编译后 DWARF 核对：本轮 JSFunctionBytecode 从 C 的 144 字节增为 160 字节，即每个函数字节码头实际增加 16 字节；每点记录分别为 40 / 40 / 96 / 16 字节，ReadICSite 均仍为 24 字节。原始测量见公共 layout_sizes.json。本轮 active_safety.json 的真实命中/回退为 23/109；它们保持 strict 指令位置且输出与原 C 一致。

最终判断：**无明显收益**。相对 C 的 Octane GM +0.1408%、SunSpider GM +0.5706%，全部数据在下表。
