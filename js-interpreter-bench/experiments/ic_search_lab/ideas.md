# 首批待试思路（枚举，不做退火；最多12个实际候选）

种子M：逐最终get_field/get_field2的16字节own-data单槽；现有site索引、force_inline、精确shape守卫都保留。
M/P/R/U的旧结果只帮助排序，不作为新候选时间的分母。M尚未整体超过A；U负结果不作parent。
下表是待试表，只有candidates.csv里有实际构建/检查/初筛证据才计为已尝试。

|编号|主要类别|问题、位置与依据|
|---|---|---|
|c001|减少反复维护|rdi_update：当失配shape的已验证字段下标与现有槽相同，暂保留旧shape锚点，不进行替换。命中仍须精确shape匹配；新shape仍做正常查找读取当前值。Splay已实际见key同offset的两布局；可能节省retain/release，也可能失去新阶段的稳定命中。|
|c002|小容量/比较顺序|ReadICSite/rdi_probe/rdi_update/rdi_free：两槽PIC。是既有P四槽的容量变体，不是新PIC算法；对两shape避免反复替换，代价是额外槽、比较与shape保活。|
|c003|快慢路径组织|GET_READ_IC/rdi_miss_get：保留hit内联，把正常miss读取与更新移到一个no_inline冷helper；减解释器内重复slow body，增加miss原生调用和cur_pc保存。原查找已内联，不声称只是消除C调用。|
|c004|小容量/比较顺序|以正确的c002为parent，探测固定slot0→slot1，取消recent命中更新；保留等价guard与原替换。可能少写recent，可能让第二槽多一次比较。若c002无效则不实施。|
|c005|缓存记录布局|把冷atom与shape+offset热部分分开，核对packed/未对齐与释放/序列化；减少热扫描footprint但可能增加指针/分配和函数头成本。范围复杂时允许不入首轮，不用危险pointer压缩。|
|c006|准入/覆盖|rdi_prepare仅重写get_field，保留get_field2普通读取。避免一部分继承方法读反复经历无效own IC准入；同时会损失own方法命中。按opcode语义选择，不按benchmark/PC选择。|
|c007|守卫次序|GET_READ_IC在对象tag后先查shape，再保留class/exotic条件；没有删除任何类型或生命周期条件。可少做不匹配对象的class读取，也可能把probe增加到特殊对象。|
|c008|编译准备成本|延迟分配缓存存储到函数实际进入；必须保留atom、反序列化和OOM边界。与既有E的lazy设计明确区分/标为复现方向，不能仅因名字叫lazy就算新算法。复杂时不抢首轮时间。|

不重复“数组化/force_inline”，不拿R/K32换个名字当新设计，不取消shape守卫、不缓存属性值/旧prop指针。
每个实际候选前另写三句说明，先小正确性、再26项单次A_before→候选→A_after。

## 简短公开来源

- 冻结QuickJS官方源码，commit `04be246001599f5995fa2f2d8c91a0f198d3f34c`：[quickjs.c](https://github.com/bellard/quickjs/blob/04be246001599f5995fa2f2d8c91a0f198d3f34c/quickjs.c)。本轮真正编辑的是已有公开M派生文件，以seed_identity/source SHA核对，不冒称upstream已有IC。
- V8官方[Maps / Hidden Classes](https://v8.dev/docs/hidden-classes)，2026-11-04访问；用于理解map/字段布局守卫，不证明本地d8逐次IC命中，也不直接复制其机器码缓存方案。
- WebKit官方[Speculation in JavaScriptCore](https://webkit.org/blog/10308/speculation-in-javascriptcore/)，2020-07-29文章，2026-11-04检索；说明结构/IC处理动态属性的机制背景，不把JIT生成stub的收益等同QJS解释器。
- 本地当前源码/负结果：`read_ic_mic/attempt01/results.md`（M/P），`read_ic_dequickening/attempt01/results.md`（R/K32），`ic_fast_slow_20261102/attempt01/results.md`（U），`splay_ic_20261104/attempt02/site_notes.md`（两种实际布局）。这些是候选假设依据，不是本轮效果证据。

未引用私有JWST。没有为搜索先写长综述或构建V8诊断版。

## 首批后续四条（仍总计最多12个实际候选）

- c009：复现既有P四槽，parent=M，只改容量；明确不是新算法，以同批A对照检查容量趋势。
- c010：rdi_update只首次填充、不替换，保留精确shape守卫；是维护策略枚举，可能少retain/release，也可能锁在冷shape。
- c011：只outline rdi_update，普通find仍展开；是c003的更窄变体，检查slow-body组织范围，而非重复实施相同源码。
- c012：旧槽shape的ref_count>1时保留锚点，否则可替换；不将ref_count等同对象数（其它IC也持有shape）。精确守卫和正常回退不变，多读一个计数。

c008最初是待调查lazy存储；尚未尝试。为避免将完整生命周期改造塞入快速搜索，后续若实施改为明确的静态准入小变体（长度<=16字节的函数不创建IC）；两种不是同一算法，candidates/候选说明将记录变更。不能称已实现lazy反馈。
