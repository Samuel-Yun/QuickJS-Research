# 实现阅读补充：按实际代码解释

## 静态site和运行期状态不是一回事

`engine/eic_prepare.inc`在最终原子修正后定位三种named opcode，每处8B的
metadata持有atom和opcode起点PC。闭包若共享同一bytecode实例就共享这些位置；
再次编译同一文本是新实例，不按函数名字合并，也不沿用旧NG的函数+atom缓存单位。

`eic_feedback`在该bytecode的第8次目标属性操作申请整个site vector，
不是第8次函数调用。各site初始未初始化；第一次合格访问装单态，第二种shape
才申请额外三项PIC。第五种合格shape进入GENERIC并释放所有缓存引用。
`unsupported`累计到8也转GENERIC；成功更新handler会清零，普通hit不会。
这是本实验的规则，不是从V8默认参数直接复制或已经比较得到的最优策略。

## 命中读当前值，不是缓存属性值

`eic_probe`先检查内嵌entry，只有poly存在时才有界扫描额外entry。
own命中直接读当前receiver的prop[offset]并按QuickJS规则复制JSValue。
prototype命中沿当前链检查每层shape，最后读当前holder的prop数组。
没有缓存旧prop数组地址或函数常量，也没有把虚拟布局解释成V8的in-object字段。
两个对象布局相同不意味着属性值相同，因此不从旧对象取值。

只对普通non-exotic对象和准入时hashed shape建立handler。QuickJS按引用
触发shape COW的条件含is_hashed，不能用一条shape引用推断所有对象都不能原地修改。
链上的每层都受守卫；深链、特殊属性/对象、accessor等保留原查找/慢路径。

## store miss的修复与仍有的工作

own已有writable普通data字段的hit使用当前槽set_value；权限/类型由shape保护。
miss先普通查找、按原规则写入，随后重新取得当前属性才更新反馈。
set_value会释放旧值；缓存更新也可能释放shape/prototype图，二者都可能调用
原生finalizer，所以旧JSProperty指针不能跨这些操作继续使用。
新增回归验证了这一边界；旧失败版本和数据未替换。

冻结实现即使site尚无反馈或已GENERIC，仍会在合格own-store miss后重查一次，
再由eic_update决定是否有事可做。独立诊断的store_refresh_inactive只记录这个
实际频率，不测它的独立时间；本轮不会在看到正式结果后顺手删除它再补旧批次。

## 频率不能代替成本

GENERIC也会进入实验opcode的入口判断后普通回退；metadata仍eager，vector
只按bytecode延后，不是每site懒分配。维护和保活有成本，但N1诊断频率不是
30轮timed-region的动态次数，命中率也不能换算成毫秒。V8参考源码给出的弱Map、
validity cell和构建时生成builtin路径，不等于当前d8逐site实测命中证据。

keyed/global在固定参考源码中有不同的元素、字典、lexical/property-cell语义；
本E未迁移这些handler。完整Octane结果同时包含未覆盖操作、GC和builtin成本，
因此剩余差距不能全归为本IC命中路径的差距。
