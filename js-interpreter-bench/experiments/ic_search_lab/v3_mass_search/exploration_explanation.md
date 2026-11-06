# 保留的局部材料 L030

## 缓存里有什么

冻结s001在每个已准备的读取位置保存一份shape和字段下标。L030保留PC相对定位，扩为6槽，把6个shape指针放在一组、6个uint16字段下标放在另一组，另有atom与替换状态。缓存不保存属性值或prop地址。实际ELF的sizeof为72B/site，s001为16B，通用单槽模板控制为24B。sizeof没有包括额外字节码副本、分配器开销或间接保活。证据在 [selected_mechanism.json](selected_mechanism.json)。

类型定义见 [templates/types.h](templates/types.h)，命中、更新、GC标记和释放见 [templates/runtime.inc](templates/runtime.inc)，完整相对parent补丁见 [patches/L030.patch](patches/L030.patch)。[identities/L030.json](identities/L030.json)保存源码、补丁、工具链及冻结制品SHA，能够核对解释对象。

## 一次读取怎样进行

先按原handler检查对象tag、普通class、非exotic和可缓存shape。rdi_probe按固定顺序比较最多6个完整shape指针，匹配时取该槽的字段下标，handler再从对象当前prop数组取值并执行原引用处理。它增加了容量，同时也可能增加比较、元数据读取和保活工作。这个结构属于空间换时间，数组化和force_inline已在既有实现中使用。

全部未命中时仍按原属性语义查询。合格own数据属性才进入rdi_update。它完整检查同shape和空槽，优先空槽，满时沿轮转位置替换。offset>=65535不填入uint16槽。先保活和发布新shape、再释放旧shape，GC标记和销毁遍历全部已占槽。该发布次序是模板已披露的安全适配，比较对象包括这个差异。

## 两个布局与一次换值

以下按实现推演值的流动。

```js
function read(o) { return o.x; }
var a = {x: 1};
var b = {prefix0: 0, x: 2};
read(a);     // 合格时填入shape A与x的下标
read(b);     // 不同布局，合格时填入shape B与另一下标
a.x = 9;
read(a);     // 即使shape不变，读取的也是当前值9
```

删除、改descriptor、原型/getter或不合格对象会通过守卫和原语义路径处理。值改变后返回旧值会违反设计。上述推演的容量部分有独立native探针支持，1/2/3/4/6个布局确认为不同shape，分别占用1/2/3/4/6槽，8和17个布局时占用保持6，并保留结果断言。删除时native finalizer重入读取也通过。[原始诊断记录](selected_mechanism.jsonl)

## 时间证据到哪一步

4轮独立复筛中，RayTrace相对同批s001耗时比为0.9221，access-nbody为1.1180。Octane核心聚合为1.0038，95%探索区间跨1。P013的4槽AoS记录同样为72B/site，它的RayTrace也出现局部改善。这里尚未分离容量、布局、代码布局和编译器决策。[逐项比例与区间](exploration.level3.ratios.csv) [逐项中位数与Q1/Q3](exploration.level3.statistics.csv)

当前没有RayTrace实际cache hit/miss次数，也没有解释nbody退化的native路径证据。这两项原因保留UNKNOWN。窄下标范围外回退的既有独立检查见 [wide_offset_check.json](wide_offset_check.json)，其制品是L006，不冒充L030本次执行记录。

L030作为局部研究材料保留，当前工作底座继续冻结。下一项可检验问题是RayTrace和nbody的实际shape探测次数与普通查找次数怎样变化。没有这些计数或采样时，不把总时间变化归为某次hash或某条指令的独立成本。
