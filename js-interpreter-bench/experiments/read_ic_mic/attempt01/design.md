# A/P/M：预先冻结的新逐读点框架（设计v1）

研究问题：稳定own读取能否超过原A；多态输入的四槽命中收益是否抵消搜索/空间；不预定M获胜。
本设计在实现/正确性/pilot/正式采样之前写下。参考HEAD 1f977fd762e4308cbfe141c110ad208bdb1f10a0，
myx，初始工作区干净；未发现适用AGENTS.md。历史数据只作背景，不与本轮相除。
底座为upstream 2026-06-04 / 04be246001599f5995fa2f2d8c91a0f198d3f34c，来自已校验官方源码归档，MIT。
不引入NG其它改动，不带入旧写PIC、atom共享hash或解析期registry。

## 最终site、存储与加载

- 原最终读opcode核查为get_field/get_field2（各5字节，atom32）。get_length、get_array_el及其它读取不覆盖。
- 在resolve_variables/labels、stack_size和最终b建立后扫描一次；只按实际剩余读点分配一个数组。
  每个compiled bytecode实例按最终offset升序编号；运行期身份为实例+offset，不按atom合并。
- 追加两个仅运行期的5字节opcode，现有opcode编号保持不变。atom32操作数改为site index32，
  原atom引用转移到该site，既不多dup也不漏free。热路径直接site数组索引，不查site hash、不存字节级map。
- M预计x64记录16字节：shape*、offset32、atom32；无循环、空余三槽、recent或环形index。
  P预计56字节：shape*[4]、offset32[4]、atom32、recent8、victim8及对齐。
  实际sizeof/对齐由构建核实，不用估计冒充测量。
- b共同增加site指针/count/ready字段（预计16字节）；即使没有读点也有这个函数头代价，无site数组。
  函数定型时一次分配；不做热度阈值、延迟分配或自适应升格。
- 序列化只在输出副本中还原普通opcode和atom，不写shape、offset或运行期指针。
  加载后同样扫描最终字节码、创建空site数组。qjsc嵌入也一样。
  为保证ROM嵌入可重写，只在P/M中把加载bytecode复制到其b自有缓冲，不写只读输入。
  这一零拷贝能力变化共同披露；A保持上游。source模式的Octane不使用ROM路径。
- 分配失败前不改字节码；缓存分配失败走正常OOM清理，不默默取消某版缓存。
  编译定型后fd已经释放，b已完整注册GC；此时失败只释放b，避免重复释放fd转交的资源。

## 准入、安全和相同入口

- P/M相同：receiver必须为非exotic的JS_CLASS_OBJECT；自身普通数据属性、hashed shape。
  排除继承、缺失、getter/setter、Proxy、数组/typed array/RegExp/其它特殊class。
- 强shape引用使已缓存shape的refcount至少包含缓存边。upstream js_shape_prepare_update在描述符/结构变化时
  遇共享shape会clone，旧shape不能原地改变；值更新允许不换shape，命中读取当前对象当前prop值。
- 命中返回JS_DupValue；get_field消费receiver，get_field2保留receiver用于方法this。
  不缓存属性值，不删除异常、引用或cur_pc语义。
- miss共用原upstream GET_FIELD_INLINE的own/原型循环与原慢路径，不为某一版换重helper。
  仅在正常own普通数据命中处尝试更新；继承结果永不缓存。
- P/M同一宏集成及同样force_inline要求；M只有一槽直接shape比较，P先recent，再其余三项。
  比较P/M是这两种具体设计（探测/维护/空间）的整体干预，不是抽象纯容量成本。
- 普通put_field和所有其它写语义的源码保持上游原样；P/M不增加写IC。

## 事先固定的PIC策略

recent=0、victim=0。query先比较recent；miss再按recent+1,+2,+3 mod4搜索，命中更新recent。
更新完整检查已有shape（同shape仅更新offset）；否则按索引0..3找到首空；满槽用victim并令victim=(victim+1)%4。
插入/替换后recent=所选槽；空槽填充不推进victim，命中不推进victim。M总替换其唯一槽。
新shape先dup，旧shape再free，避免释放顺序问题。不能据pilot跑分切换策略。

## 引用与诊断

每个site独立拥有atom；每个非空slot拥有shape强引用。b的GC遍历列出所有非空slot（重复shape边也分别列出），
销毁释放atom/shape/数组。指针不序列化。对循环原型/函数引用以GC和ASan/UBSan验证。
独立诊断保存compiled-instance ID（不跨进程对应）、原始最终字节码、规范化atom映射和offset，
供Python计算跨进程可核对的SHA256；不只按函数名聚合。
诊断query包括首次冷查询，因为site在定型后统一重写；queries=hits+fallback。
分别统计shape比较、更新/替换、占用、创建/使用、fallback原因和shape引用；写操作无本轮query。
计数与正式计时隔离，间接对象图字节UNKNOWN。诊断记录器自己的分配不冒充IC分配。

## 预先固定的实验与统计

A/P/M同工具链官方-O2/-g/-fwrapv，无NDEBUG/LTO/PGO，分别干净构建。M先完成最小原型，再同框架生成P。
Octane保留原16单元；Crypto加载padding未固定，采集但预先排除主GM；Box2D/zlib/官方latency边界不扩展。
独立8微基准：mono_int、mono_ref、own_method、numeric_control、write_control、poly2/4/8。
每完整调用4096轮；前三与控制复用上轮语义，多态用一个read函数site轮流接收预建不同shape对象。
同名不同site、许多函数只跑一次与单函数重复仅做独立诊断，不混正式矩阵。
初次Run在N次内，无额外性能预跑；共同N，APM/PMA/MAP九个独立pilot内部均≥1秒后冻结。
正式每项30组三元组；六排列各5次，seed20261024，组内相邻、每轮项目顺序打乱；目标2160条。
时钟先修记录：父perf_counter_ns绝对start/stop，子内部绝对单调start/stop/elapsed；UTC仅日期。
同钟域核对单调性、分辨率、内外界和串行性，时钟异常停在BLOCKED_TIMER；不修raw、不按快慢筛选。
无自动失败补跑；无异常值删除。性能进程串行，亲和性不特权修改，频率/后台未知如实保留。
主A/M，另P/M、A/P；10000组三元组配对bootstrap中位数之比、95%探索区间。
Octane先suite内子项GM，再suite等权；完整rep轮次跨case分块bootstrap10000次，seed20261024。
微基准不进GM；公开raw标准库重算、CSV LF；跨平台浮点比较预先固定rel_tol=abs_tol=1e-12。
GNU time 16×3×3独立RSS，KiB；不将其时间并入正式结果，不相减中位数推导单操作成本。
