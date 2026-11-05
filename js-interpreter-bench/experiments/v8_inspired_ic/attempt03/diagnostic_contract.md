# 独立诊断的解释范围

正式采样没有计数/trace。采集结束后另建E_diag_sites，原E不替换。
运行各正式case的N=1、正确性phase脚本，scope为**全进程**，包含装载、
Setup、Run、后验验证、TearDown和释放，不将它称为timed-region的命中率。
诊断时间不用于任何性能比值。

全球聚合：实际EIC查询、own/prototype/store命中、普通回退、单态/多态/
generic转换、同shape重算、未准入、分配失败、metadata/vector/PIC/chain
创建及shape引用/释放。每进程必须queries=hits+fallback，结束直接存活字节为0，
shape边与直接请求/释放平衡。E没有主动修改通知cell，所以不伪造这种失效计数；
原型守卫失败单独记，重算是确实安装了新handler的事件。

按opcode定义覆盖类别：named read为get_field/get_field2和单列的get_length，
named store为put_field；keyed为get_array_el/get_array_el2/get_array_el3/put_array_el；
binding_varref为get_var/get_var_undef与put_var/put_var_init。get_var执行体使用
var_refs[idx]，不能把这些次数都称为global；精确源码global与其它绑定的拆分UNKNOWN。
其它closure/local/super/private/define等opcode不混成这些类别，也不宣称计了所有绑定读取。
get_var_undef共用get_var执行体，诊断修正重复计数；put_var_init在共用体计一次。

诊断位置计数旁数组不改变EICSite/Entry/Chain布局，但改变诊断bytecode头大小
并增加内存/指令。直接cache accounting仍只计E的metadata8B、Site40B、
PIC额外3×24B、Chain32B；不含诊断旁数组、bytecode头、allocator overhead、
shape/对象间接保活或RSS。它是此N1诊断轨迹的直接请求/峰值，不冒充30轮
正式Release的实测内存峰值。其它内存代价明确UNKNOWN。

只保存每进程最先释放的、查询至少1000次的最多32个代表位点，不称Top耗时。
保留函数debug源码（超8192字节则标truncated、SHA为null）、源码SHA、该进程
编译实例编号、原始opcode起点PC、属性名与类型。不同进程instance不自动对应；
不同函数同名不合并。PC仍对应5字节最终opcode；不是越过atom操作数后的cur_pc。
原函数/benchmark源码不插JS计数。

N1诊断频率不能乘N当作正式Run精确动态次数，也不能把命中率换算时间收益。
这些计数与正式时间是不同证据，受到诊断分配/GC/布局改变的限制。

attempt02另计store_refresh及store_refresh_inactive：修复后的store miss完成
set_value后重新取得当前属性的次数，以及其中无vector或已GENERIC的次数。
这是实际额外查找频率，不是耗时；后者即使无可更新反馈仍按本冻结实现重查。
只在后续独立诊断版增加计数，不改变已冻结Release行为，也不据正式中途方向改E。
