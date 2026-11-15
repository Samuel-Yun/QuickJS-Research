# 第 3 轮 CONSTRUCTOR_PLAN_IC

本轮独立派生自冻结 C，保留其 32 项 strong 转换边缓存；没有带入前两轮或 3B。正式全集为 43 项各一个独立进程，C 使用旧单轮，A/EVAL_COLD/V8_ON 为旧 30 次中位数。以下是新旧单轮跨批次筛选，不是显著性结论。Octane 按 14 suite 分层等权 GM，SunSpider 按 26 项等权 GM；负号为耗时下降。

## 实际覆盖

先从第二轮的独立原 C 调用 probe 中抽取实际构造目标完整字节码，再以本轮 FOUR_PROBE 构建始终执行原构造路径，确认完整模板、原型约束和创建结果。普通直线形状为 `push_this;put_loc0;(get_loc0;get_argN;put_field atom)*;return_undef`，支持 1–8 个不同字段、仅参数到字段的存储、无调用/分支/this 逃逸；不是按 Pair/TreeNode 等名称识别。RayTrace 的真实构造目标大多不是这种直线模板，未特化，也未临时加第二模板。

最终独立 counts 在 Run 区间命中：Richards 1,018、Earley 4,455,701、Boyer 8,211,289、Splay 982,620、PdfJS 6,620、Typescript 2,798、access-binary-trees 3,870,071、access-nbody 415。两套合计 **17,530,532 命中 / 49,231,038 尝试**；31,700,506 次回退完整保留。Splay 的计划可在原 Setup 区间建立，故其 Run 内 fills=0、hits 非零是预期，未额外添加预热。

TreeNode 两个实际静态点为 bottomUpTree PC 26 和 PC 35，实际尝试分别 5,281,792 和 5,488,640 次，命中 1,897,960 和 1,972,111 次。未满足完整窄守卫的调用仍走旧路径；本轮只记录总回退，未把每一条失败守卫再拆为独立原因计数。常见退路包括非直线目标、callee 冷态/缺参、prototype 条件、栈空间或下一次分配会触发 GC。

## 计划、守卫与所有权

具体 new 的原 `call_constructor` 静态点改为同长度 3 字节内部 `four_ctor`，操作数索引该函数字节码尾随记录，记录保留原 argc。学习 actual callee 身份、新目标必须等于该 callee、当前无副作用的 own 数据 `prototype`、初始空 shape、实际最终 shape，以及按源顺序排列的 atom/参数索引。初始和最终 shape 为强引用，callee 也为强 JSValue 引用，均纳入 caller 的 GC mark/free。

只支持普通同步 JS 函数、简单参数、无闭包/额外操作、普通构造器；只接受实参数量至少覆盖形参数量。构造目标是 Proxy、bound、内置、derived、返回自定义对象或 body 有额外行为时走原入口。new.target 不同或 prototype 不是 own 普通数据对象时走原入口，**不额外执行一次可观察的 prototype getter**。

在任何实例字段写入前，逐个检查当前完整原型链：不能有 exotic/Proxy 或 getter/setter，已找到的继承数据属性必须可写，深链超过窄上限也回退。未 hashed 的 Object.prototype 没有被直接信任，更没有引入 3B 的 shape admission；本轮每次看当前描述符，防止后来加 setter/只读字段。这是命中额外仍需付出的成本。

计划建立时，实际慢构造结果必须是普通对象、自有槽数量/顺序/atom 与模板完全一致、flags 均为默认 C_W_E、无删除槽、shape 已 hashed，proto 也与所观察 prototype 一致。所有参数求值已经完成，参数值可以是任意 JSValue，存入本身不做 coercion。最终 shape 的强引用结合原 COW 保证它不会在缓存期间原地改成另一布局。

命中用原 `JS_NewObjectFromShape` 直接采用最终 shape，一次分配最终 prop 容量，再按原源序 Dup 参数填槽，返回新对象；没有走各字段的 JS_SetProperty、全局/边缓存转换搜索或中间布局，也没有进入构造函数 JS 帧。实例对象和 prop 数组仍各分配一次；**不宣称省掉了这两次分配**，省的是旧途中可能发生的 prop 扩容。

有中断 hook、保守栈空间检查失败、原型守卫失败或对象分配即将触发 GC 时，在分配前走原路径。GC 可能执行 native finalizer，故不允许在守卫后跨过这样的 GC；不在已执行可观察步骤后重跑构造。无 hook 的命中仍执行原两个调用入口各一次的 poll，保持中断计数进度。初始空 shape 已存在的学习约束还避免原空布局创建在守卫与分配之间额外申请内存。

x86_64 Release 每个构造静态点记录 96 字节（callee、两个 shape、最多 8 项参数/atom 映射、argc/PC 等）；全部构造点支付记录。函数头新增 pointer+uint32 字段，字段合计 12 字节，实际整体对齐由编译器决定。callee 和 prototype 布局保活可能增加内存与 GC 成本，已包括正式计时。

## 真正减少的工作：不把 C 的边命中当作全局搜索

独立计数的 work[0..5] 依次为：原合格构造窗口中执行的全局目标 shape 搜索、真实 shape 指针切换、prop 数组分配、prop 扩容、快路跳过的逐字段转换路径、快路直接完成的构造数。

| 独立计数范围 | 全局目标 shape 搜索 | shape 指针切换 | prop 分配 | prop 扩容 | 快路跳过字段转换路径 | 完整计划命中 |
|---|---:|---:|---:|---:|---:|---:|
| 原路径 probe 的合格窗口 | 718 | 40,059,748 | 17,905,742 | 4,252,920 | 0 | 0 |
| 最终候选的合格窗口及快路 | 50 | 3,366 | 17,531,159 | 1,733 | 38,932,538 | 17,530,532 |

两列“窗口”不是所有回退构造：只观察在进入旧构造前符合本轮窄语义守卫的窗口，且候选减少分配后 GC 时机改变，窗口数会变化。因此不要把列差值机械视为一一配对的全局节省。所有其它回退仍在总 attempts 和完整性能结果里。

确定的快路工作是：17,530,532 次完整计划直接构造、相应次数不进 JS_CallConstructorInternal/JS_CallInternal 和构造 JS 帧，38,932,538 次原逐字段转换路径不再执行。原 C 已使目标 shape 全局搜索极少（probe 只有 718），故**不是数千万次全局 hash 搜索变成零**。热 Pair 两字段原路径基本没有 prop 扩容；TreeNode 三字段原路径有一次 prop 扩容，本轮计划直接分配最终容量。原对象分配和一个 prop 数组分配依然存在。初始空 shape 查找也被命中路径绕过，但不混入目标 shape 搜索计数。

## 验证、异常修复与局部时间

C、Release、counts、ASAN/UBSAN 的 safety.js 全部输出一致，覆盖换构造器/字段映射、prototype 被替换、后来添加 setter、Object.prototype 只读属性、Proxy 原型/构造器、非对象 prototype、缺参、自定义返回对象和 this 逃逸（这两类回退）、反复创建与释放。预热后编译结果保存/普通加载/ROM 加载也全部通过；存盘还原 call_constructor 和 argc，拒绝直接载入内部 opcode。

interrupt.c 四个构建均为 `interrupt=3 exception=1`。ownership.c 检查 64 组函数→原型→构造点缓存 GC 环，并用预分配的平坦引用数组做受限内存测试，四个构建都能捕获 OOM。计数版该测试进入快路 772 次，其中 1 次实际分配失败，无重新执行构造。

OOM 测试确实发现并修复了异常出口的保活问题：构造快路直接分配失败后，原有回溯格式化可能再次 OOM，替换并释放 current_exception。现在仅在本快路异常出口取出并持有原异常，安全补 caller 的回溯，再恢复同一异常并进入原清理逻辑，避免重复格式化、重试或添加虚假的 callee 帧。其它普通入口保持原样。这是本轮异常所有权修复，不是附加性能优化。

修复前构建、计数及失败证据保存在 *.before_oom_fix、runs/counts.before_oom_fix 和 qualification.before_oom_fix；这些不进入最终时间。初始链表保留的极限内存测试连原 C 都崩溃，随后改为预分配平坦数组以避免无关的长链释放因素；原记录同样保留。修复后重做相关检查和计数，**正式全集只启动了一轮**。ASAN leak detection 关闭，未跑完整 test262。

最终微基准 200 万次三字段构造：C 282.99 ms，候选 134.20 ms（−52.58%），计数命中 1,999,995 次；结果和原 C 相同。

## 最终耗时与结论

相对旧 C：Octane GM **−0.6401%**，SunSpider GM **−2.1063%**；相对原 A 分别 **−7.0359%、−3.6410%**。Boyer 约 −22.5%、Earley 约 −11.6%、access-binary-trees 约 −43.5%，但并非所有项都更快，RegExp、zlib 等仍有跨批次上升。结论：**保留候选**，当前四轮中值得优先研究；没有自动组合或晋升主底座。单轮不能证明小幅整体提升稳定，完整逐项数据保留如下。

## 复现

相对 C 的 release.patch、实测 source.tar.gz 和构建 manifest 位于本目录。源码包解压后 `make -j2 -o repl.c qjs qjsc`。公共 build.py / qualify.py / sequence.py 保存构建、最少验证和原输入单轮过程，已有构建目录防覆盖；已有性能样本只跳过，不会自动再跑。`python3 analyze.py 03_constructor_plan` 只离线生成逐项表与源码包。沿用 native_confirmation_20261108/attempt02 的脚本、固定 N、CPU 2、Asia/Shanghai、Setup/Run 边界与所有原校验。计数和正式 Release 分离，没有 LTO/PGO 或额外预热。


编译后 DWARF 核对：本轮 JSFunctionBytecode 从 C 的 144 字节增为 160 字节，即每个函数字节码头实际增加 16 字节；每点记录分别为 40 / 40 / 96 / 16 字节，ReadICSite 均仍为 24 字节。原始测量见公共 layout_sizes.json。本轮 active_safety.json 的真实命中/回退为 1028/21；它们保持 strict 指令位置且输出与原 C 一致。
