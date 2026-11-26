# 改了哪些代码

相对原版 A，忽略 CRLF/LF 表示差异：**2 个原文件发生代码改动，新增 10 个文件**。完整补丁共新增 830 行、删除 15 行。

## 文件清单

| 文件 | 变化 | +行 / −行 | 作用 |
|---|---|---:|---|
| [edge_strong_helpers.inc](../modified/edge_strong_helpers.inc) | 新增 | +39 / −0 | C 的 32 项 shape 转换缓存与引用释放 |
| [four_diag.inc](../modified/four_diag.inc) | 新增 | +59 / −0 | 冻结源码已有的计数宏；正常 Release 下相关宏为空操作 |
| [four_prepare.inc](../modified/four_prepare.inc) | 新增 | +20 / −0 | 识别 new 位点，call_constructor 改为 four_ctor，保存 argc |
| [four_runtime.inc](../modified/four_runtime.inc) | 新增 | +148 / −0 | 构造模板、原型/调用条件、完整计划按需分配和正命中执行 |
| [quickjs-opcode.h](../modified/quickjs-opcode.h) | 修改 | +8 / −0 | 新增 6 个运行时 opcode，原有 opcode 编号不变 |
| [quickjs.c](../modified/quickjs.c) | 修改 | +260 / −15 | 把缓存接入函数/运行时结构、解释器、冷入口、GC、释放和字节码保存加载 |
| [read_ic_config.h](../modified/read_ic_config.h) | 新增 | +1 / −0 | 固定单槽属性读取 IC 配置 |
| [read_ic_opcodes.inc](../modified/read_ic_opcodes.inc) | 新增 | +90 / −0 | get_field_rdi/get_field2_rdi 的命中与原查找回退 |
| [read_ic_prepare.inc](../modified/read_ic_prepare.inc) | 新增 | +61 / −0 | 最终字节码扫描、稳定旁表分配、读写/融合替换，并准备构造位点 |
| [read_ic_runtime.inc](../modified/read_ic_runtime.inc) | 新增 | +76 / −0 | 读缓存探测/更新、shape 引用维护和释放 |
| [read_ic_types.h](../modified/read_ic_types.h) | 新增 | +39 / −0 | 定义每个读取位点的 shape、holder shape、offset 和 atom |
| [sparse_runtime.inc](../modified/sparse_runtime.inc) | 新增 | +29 / −0 | 小记录入口、负目标比较、跳过判型、负记录发布 |

未改动正则匹配器、内置函数实现、QuickJS 公共头文件或基准算法。其它随包文件的 CRLF/LF 表示差异不列为优化。

## quickjs.c 的接入位置

这里的行号对应本目录 `modified/quickjs.c`，不会随旧实验目录变化。

| 行号 | 改动 |
|---:|---|
| 187、2048、2136 | 冷函数类别定义、注册及首次调用入口 |
| 226、393 | `ExEdge` 和运行时 32 项 shape 转换记录 |
| 691、725 | 属性读取记录、构造记录的函数级元数据 |
| 5365、5392、9297 | 历史诊断宏、shape 转换帮助代码与新增属性接入 |
| 6229 | 引入读取 IC、构造计划和诊断实现 |
| 6696、6708 | 属性记录和构造记录的 GC 标记 |
| 17440、20911、36506 | 冷函数分类、首次调用准备、编译后准备时机 |
| 17872、18748、18761 | 局部/参数读取与字段读取融合 |
| 18329 | `OP_four_ctor`：正命中、普通构造、学习与负缓存发布 |
| 19323、19339 | 读 IC handler 与复用读记录的写入路径 |
| 32342 | 引入准备阶段代码 |
| 36529 | 释放负缓存、完整计划、shape 和读取旁表 |
| 37952、37968 | 保存时归一化运行时 opcode、恢复 argc/atom |
| 38861、39015、39183 | 加载可写字节码副本并重新准备 IC |

## 只看最后一层

[R3-to-on-demand-ctor.patch](../patches/R3-to-on-demand-ctor.patch) 只涉及 `four_diag.inc`、`four_prepare.inc`、`four_runtime.inc`、`quickjs.c` 和新增的 `sparse_runtime.inc`。

1. 把原来内嵌的完整构造记录拆成 `FourSite`＋`FullPlan`。
2. 在第一次成功学习到合格计划后才分配 `FullPlan`。
3. 负目标相同时跳过 `plan_slow_eligible` 的重复判型。
4. 普通构造成功后决定是否发布负目标；成功发布正计划时清除负目标。
5. 补上拆分后各引用的 GC 标记与释放。

这份增量的父版是 R3，不是 A。完整移植到 A 用另一份完整补丁。
