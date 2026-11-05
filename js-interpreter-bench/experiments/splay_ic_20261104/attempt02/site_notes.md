# 三个Splay读点：观测、实现与未完成控制

目标函数源字节 SHA256：`138762086ed599b42111191883e57a62e65533df210601253b636eddb39abd43`。
冻结 QuickJS 2026-06-04，upstream revision `04be246001599f5995fa2f2d8c91a0f198d3f34c`；M为此前逐读点own-data MIC。
原始源码：[旧冻结 splay.js](../attempt01/inputs/splay.js:332)；完整实际opcode映射：[M_splay_bytecode.md](legacy_replay/M_splay_bytecode.md)。

## 实际Run布局（不是推测）

`last_recovery/Splay.M.N1.counters.json`、`N2.counters.json` 各为一个独立进程。
同进程generation326/329由shape出生事件赋值，销毁时删除映射；不持有JS对象/shape引用。不同进程的generation数字不代表同一对象；下文按布局比对。

|布局代号|own属性下标顺序|key偏移|right偏移|共同条件|
|---|---|---:|---:|---|
|L1|key, value, right, left|0字节|32字节|class_id=1、exotic=0、hashed=1、4个属性|
|L2|key, value, left, right|0字节|48字节|同上|

所有目标属性的holder_depth=0、flags=7（普通数据描述），JSProperty大小16字节。key下标0，right下标2/3。
N=2频次如下，每格是该site在对应receiver shape上的读取次数，不是shape分配次数：

|PC/atom|L1读取|L2读取|查询|命中|回退/真实find|替换|
|---|---:|---:|---:|---:|---:|---:|
|43/key|2249|2359|4608|2432|2176|2176|
|138/key|1313|1363|2676|1347|1329|1329|
|147/right|1157|1199|2356|1209|1147|1147|

两次进程均未溢出布局表，也没有未知generation事件；完整频次与布局已保存。
转换序列仅前128次，`sequence_truncated=true`；总转换数完整，N=2分别2175、1329、1147。
PC43转换比替换少1，是因为缓存已有Setup状态；转换计数从Run第一次receiver才开始，不能强行使两指标相等。

源码事实：Node构造函数只建立key/value（原文件390—393行），left/right原型默认null（399/405行）；树调整会写入left/right（342/360/378/379行等）。这提供形成不同own添加顺序的条件。
运行证据是上表的实际布局；未单独追踪每个布局的全部建立历史，不能把具体出生链当已观测事实。
PC43/138是`current.key`，PC147是`!current.right`；不是预设的Richards方法读取。

## 轻量诊断范围

`light_hooks.h` / `light_tail.inc` 复用既有正常查找、MIC查询/更新与opcode scope挂钩。
只保留6阶段×读写聚合计数、6×3个目标site、每site最多128个generation布局/128个转换。
仅识别目标source对应的一个编译实例，不为所有函数保存字节码/源文本/逐字节阶段表。
shape identity表只保存当前活跃shape的数值身份，实际remove_gc_object时删除；上限65536，溢出显式统计，未发生。
本次峰值活跃shape143、销毁后0；这是诊断跟踪表的数字，不是VM总内存字节或整个程序创建shape数。

`audit_begin` 从参数解码前的`pc-1`获取真实opcode起点；嵌套JS frame使用cleanup恢复上下文。
正式A/M/C的计时不使用这些计数；本次没有实际正式计时。
新轻量N=2与旧计数逐项吻合：Run读取45664，命中23001、回退22663、更新18343、替换18324。
A普通find48864，M25863，差23001；本轮四个恢复进程也核对通过，见summary/splay_recovery_counts.csv。

## C控制：已实现与实际通过的部分

`control.inc` + `build.py:spec_text/add_control` 从真实dump生成：精确完整函数源码、286字节长度、每条opcode起点和非atom操作数规范。
仅目标43/138/147允许从get_field_rdi恢复get_field，site index为3/11/12，atom分别key/key/right；两者都5字节，跳转不移动。
三个实际site均不保留receiver；若拿到get_field2不猜测转换，直接拒绝，因此不会把receiver语义悄悄改掉。
atom类操作数按当前编译实例核对；不能把旧进程的atom编号当跨进程常量。
恢复时普通opcode另DupAtom，site继续持有原atom；重复OFF看到已恢复opcode后校验但不重复dup。
cache shape边不在切换时释放，仍交给原rdi_free；函数销毁会清除controller的非拥有型b指针。
同一个C ELF通过SP_DISABLE=0/1在计时前配置，热读取没有mode分支。
共同JS在必需Setup之后调用controller两次检查幂等；不提前调用Run。四条件使用相同文件。

**实际通过**：两个case、N=1/2、四条件共16个正确性进程，包括重复配置、原断言和正常进程退出。
**未通过/UNKNOWN**：C_light的ON/OFF独立计数门禁、OFF查询/更新减少与普通查找增加的实际计数、sanitizer/完整释放/保存加载检查。
正确性通过不替代这些机制和安全门禁。不得据此声称控制版已可用于正式测量。

## V8补证的边界

复用旧实际dump：本函数PC41/118的key表达式共享FBV[12]，PC127的right对应FBV[26]；见legacy_replay/V8_splay_bytecode.txt。
旧Map/IC日志支持key发生0→1、1→P更新，但覆盖Setup，不是Run逐次查询/命中数。
Run直接反馈槽快照、实际快路径命中/回退仍UNKNOWN。
官方参考commit `37fb84941c9be9f9914ee50b1ad366f06a1bd764` 不等于已知d8精确构建commit；后者UNKNOWN。
未重建/替换V8，也没有因这项UNKNOWN阻止已能完成的QJS诊断。

## 现在可检验的解释，不是收益结论

精确shape守卫在这两个布局之间失配，即使key位于相同下标也会回退、再维护单槽shape边。
right则连字段下标都不同，不能用同offset假设覆盖它。
这缩小了Splay失配的结构来源，但还没有证明维护开销抵消多少查找收益。
4652次目标替换只覆盖全Run18324次替换中的一部分；控制的是命中/查找/维护的策略净效果，不是维护self-time。
同offset不足以取消shape/描述/生命周期守卫；本轮没有放宽它们，没有选择正式OPT。
