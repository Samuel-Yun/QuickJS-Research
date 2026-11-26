# 暂定讨论对象c004：固定两槽探测（不是已确认优化）

本轮已结束：匹配复筛相对A的聚合区间均跨1，c004没有晋级或替换默认实现。这里说明真实改动及可讨论的机制，不将它称为已获益优化；实际统计见results.md与decision.json。

## 从哪里看代码

- 唯一种子：`seed_M.tar.gz`，由`workspace.json`核对原始32文件。
- M→c002：`patches/c002.patch`，两槽容量、对应GC/释放循环。
- c002→c004：`patches/c004.patch`，仅改变probe策略。`c004.matched.json`记录实际编译源hash、ELF和构建支持文件。
- `active/`随搜索变化，不能把它当c004的历史源。可只读调用`lab.reconstructed_sources('c004')`恢复到内存，源码hash必须与manifest一致。

## 命中时保存、检查和读取什么

每个最终读取位置有自己的记录，不是按函数+atom共享。两槽保存shape强引用与逻辑属性下标；atom用于失配后的普通读取。没有缓存属性值，也没有缓存旧prop数组地址。

先确认receiver是object；命中仍需普通class、非exotic和精确shape匹配。找到槽后从当前对象的`p->prop[offset].u.value`取当前值，按原代码复制JSValue并处理receiver。getter、特殊对象、原型读取等不因本改动获得新的准入。

## 两个probe的区别

c002的真实局部声明是`unsigned i, first = s->recent;`；非首槽命中后还有`s->recent = i;`。c004改为`unsigned i, first = 0;`，去掉probe命中处的这次写入。容量、guard、填充、替换和释放算法都不变。

下面是c004实际`read_ic_runtime.inc`第12—22行的连续片段（只到循环结束，省略函数外层和后面的miss返回；诊断宏在本轮非诊断构建中无计数作用）：

```c
    unsigned i, first = 0;
    RDI_COUNT(comparisons);
    if (s->shape[first] == shape)
        return s->prop_offset[first];
    for (unsigned k = 1; k < RDI_CAPACITY; k++) {
        i = (first + k) & (RDI_CAPACITY - 1);
        RDI_COUNT(comparisons);
        if (s->shape[i] == shape) {
            return s->prop_offset[i];
        }
    }
```

注意：`rdi_update`仍按原设计写recent，本轮没有顺带删除它。也不能仅凭C代码断言编译器生成了几条CPU指令，或每次节省了多少纳秒。

## 用两个布局走一遍（控制流推导，不是运行计数）

```js
function readX(o) { return o.x; }
var a = {x: 11};
var b = {padding: 0, x: 22};
```

在合格的普通own数据属性路径上，第一次读a正常查找并填slot0；第一次读b正常查找并填slot1。两者布局及x下标不同，各槽必须分别保存，不能因为属性名都是x就复用另一个下标。

填好后若严格交替a、b：c002的recent指向上一次的另一种shape，通常要比较两槽；固定0→1时，a一次、b两次。平均1.5次是这个理想序列按源控制流的推导，不是实测native比较次数，也不代表Splay或Octane实际访问顺序。

把`a.x`改为99后，命中也应返回99，因为读取的是当前对象属性值，不是保存的11。新增/删除属性或重定义descriptor可能换shape，不能继续使用旧布局下标；正常miss路径负责读取、决定是否可填槽并处理引用。旧shape由缓存强引用保活，GC标记和函数销毁处按两槽处理。

## 代价和未知

这是小容量与探测组织的取舍，不是新的IC算法。相对M，槽数和保活shape可能增加；相对c002，没有改容量或结构。

计时包括首次Run，之后状态自然变化；不做额外workload预跑。当前没有这些正式进程的逐次命中/分支记录，也没有单条store、一次hash或引用操作的self-time。相关机器码和窄计数只在候选真正值得保留时开展，不能把原始指令条数或旧P诊断冒充本次证据。

代码布局、编译器决策和非目标指令的变化仍可能影响时间。数值案例的变化也不能全部归因于省属性查找。初版漏构建探测文件的时间已排除；本文件的性能讨论仅允许使用`.matched`新数据。实际没有为一个未晋级候选开展正式native分支计数或反汇编成本归因，不能把这里的控制流推导说成运行实测。
