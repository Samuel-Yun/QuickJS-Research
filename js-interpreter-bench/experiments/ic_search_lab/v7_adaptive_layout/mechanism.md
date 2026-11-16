# 本轮实现怎样执行

性能表以 `comparison_*.csv` 和 `aggregate.csv` 为准；这里区分源码解释和独立探针。
新批次为 `explore01 / EXPLORATORY_CLOCK_LIMITED`，不与旧73条隔离数据拼接。
统计区间仍包含首次Run，无计时前workload预跑；重复过程允许IC自然变热。
源生成入口是 `variants.py`，每版对应补丁和SHA在 `patches/`、`identities/`。
本轮没有读取、复制或修改私有jwst源码。

## P1：只复测旧制品

复用v6的24B记录：receiver shape、直接holder shape、offset、atom。
自身命中读取receiver当前值；一层原型命中先核对两边当前shape，再读取holder当前值。
get_field2保留原receiver，不把this改为holder。此轮没有重新实现P1。
旧隔离样本不能评价P1；独立五轮的新数据单列，不混进其他候选批次。

## IO2/IO4：尾部存储与读取接口分开检验

`inline_objects` 只为 `class_id == JS_CLASS_OBJECT && sh->prop_size <= 2/4`
的对象申请尾部槽。prop_size是实际容量，不是源码最后用了几个字段。
独立内部探针实际报告 `sizeof(JSObject)=64`、`sizeof(JSProperty)=16`；
IO2/IO4额外尾部为32/64B。对象头未扩大不等于总分配不增。

```text
创建：p->prop = 合格 ? (JSProperty *)(p+1) : 外部数组
扩容：内嵌容量不足 -> 分配外部数组 -> 复制当前属性 -> 发布标志和指针
释放：仅外部数组另行free；整个对象块始终包含原尾部
LAYOUT命中：读取 p->prop[offset]（仍用s001的handler）
DIRECT命中：先查对象实际inline标志，再选择尾地址或p->prop
```

新增的两个标志是对象状态，不是shape状态。内部探针包含溢出、当前值更新；
IO2_DIRECT及后续IO探针还核对同shape而存储模式不同的两个对象。
DIRECT的C表达式本身不保证少一次load；本次冻结IO2_DIRECT的实际机器码如下。
证据为 `raw/IO2_DIRECT.JS_CallInternal.asm.gz`，制品SHA见 `native.explore01.json`。

```asm
29f35: lea  rdx,[rsi+0x40]
29f39: test BYTE PTR [rsi+0x11],0x1
29f3d: jne  29f43
29f3f: mov  rdx,QWORD PTR [rsi+0x20]
29f43: shl  rax,0x4
29f47: add  rdx,rax
29f4a: mov  rax,QWORD PTR [rdx]
29f4d: mov  rdx,QWORD PTR [rdx+0x8]
```

该静态片段中inline位为真时跳过prop指针加载，但要读标志并条件跳转。
这是真实native寄存器，不是JS虚拟寄存器。未测正式进程逐次命中该分支的次数，
也不能据这段机器码推断总load数或单次读取成本降低。DIRECT相对LAYOUT的同批
完整初筛没有表现为整体更快，故不把它继续叠加为默认底座。
普通对象分配请求、数组含realloc的累计请求、尾部未用槽与RSS是不同指标；
尾部未用槽不是相对基线的精确额外浪费，基线也有预留容量。

## AQ1：按点观察，退出到普通opcode，入口有界再准入

`adaptive_quicken` 的读点由16B增至32B，函数头由144B增至152B（内部探针实测）。

| 状态 | 每次读取做什么 | 转换 |
|---|---|---|
| OBSERVE | 观察计数，走正常属性语义 | 第8次合格own-data读取后装入shape/offset并改专用opcode；不合格则退出 |
| MONO | shape探测；命中读取当前值，清零已有miss计数 | 连续4次失配后恢复普通get_field/get_field2和atom |
| EXIT | 属性读取为普通opcode，不再逐读做IC维护 | 共享JSFunctionBytecode入口在有pending时计数，32次后至多重新观察一次 |

独立ASan内部运行实际观测opcode `246 -> 244 -> 61 -> 246 -> 244 -> 61`，
冷却31次未重入、第32次重入，第二次退出不再重入。原始输出在runs的AQ1/internal。
入口仍检查pending标志；有pending时扫描该函数记录，所以退出不是“零额外成本”。
普通opcode发布、atom归属和shape边释放按顺序完成；保存时转回普通opcode。
它不是旧R/K32的简单改阈值，也不是每个闭包各自一个冷却时钟。

## AP1：单态记录不变，按单个站点分配2→4侧表

`adaptive_poly` 保留16B单态记录。普通单态handler只查原shape字段；
第二种合格shape出现才分配 `APTable + 2*APEntry`，切换独立多态opcode；
第三种才分配容量4，转移旧记录；第五种恢复普通opcode/atom并释放表及shape边。
AP1/internal实测单态记录16B、表头8B、entry16B，两项请求40B、四项请求72B；
输出确认mono、2/2、3/4、4/4，继而第五种shape退出到opcode61。

使用prop_offset高位区分mono/poly，poly时shape字段持有表指针；所有GC/free路径
相应识别，表拥有shape强引用，不缓存属性值或旧prop地址。可选侧表分配OOM不产生
额外JS异常，保留旧状态并完成普通读取。扩容、探测和保活都有成本。
`a02`若制品核验通过会作为新同批对照；不能用其历史时间作本轮分母。
实际容量和退出检查由AP1/internal给出，完整计数由独立AP1_STATS给出（如成功）。

## ST1：新增字段的窄transition，不是已有字段写IC

`transition` 按put_field位置保存old/new shape、atom、offset和最多两层原型shape守卫。
ST1/internal实测每个store记录48B，函数头160B（s001为144B）；
空原型的重复构造确认同一静态put位置取得缓存目标shape并写入本次新值。
只处理可扩展、非exotic、hashed shape的普通对象；原型链各层目标atom必须不存在。
已有own可写数据字段仍执行原find_own_property/set_value，不是W1。

```text
命中：old shape + 普通可扩展对象 + 当前原型守卫全匹配
      -> 必要时扩容 -> 安装new shape -> 写入本次值 -> 释放old shape
失配：检查新增资格 -> 暂时保活旧shape/原型 -> 正常JS_SetPropertyInternal
      -> 核对旧属性前缀、新属性descriptor和新shape -> 发布记录 -> 释放旧边
```

miss的临时保活可能强制原本可原地修改的shape发生COW；资格检查本身还要查属性。
这些是实现新增工作，不能把“transition命中次数”直接解释成省掉多少时间。
缓存不是新发明的共享shape：upstream已有find_hashed_shape_prop。本轮只检验少做重复定位
能否抵过守卫、保活及记录准备成本。新字段与getter、原型写限制、非可扩展对象等
语义由有界回归及独立ASan/UBSan覆盖；未跑完整test262。

## 证据范围

`sanitizer.*.json`和原始process_result给出具体执行的检查；不能据源码存在就宣称命中。
`mechanism_counts.explore01.json`的9组检查均已完成，为独立全进程N=1计数，包含Setup/校验/清理，
不用于正式耗时。inapplicable字段为0不等于操作无成本；ST全局shape哈希查找也非单site归因。
当前计时交叉核验异常被授权降为警告，没有证明计时误差消失；区间和净收益均受此限制。

具体观测：Splay中AP1有37次容量2分配、1次容量4分配，累计表请求1552B，
峰值活跃表字节1512B，结束后表及单态活跃计数均为0。IC命中从BASE的704113
变为1290876，但完整扩展Octane/AP1同批复测点估计仍为+3.13%。
AQ1的Splay IC查询为101689，而BASE为1401166：退出成普通opcode后读取不再
纳入IC查询，所以这不是总属性操作减少。AQ1另有635747次入口检查，其中514次
入口存在pending；这些是频率，不能直接换算为时间。
ST1在Richards、Splay、CodeLoadClosure三个N=1诊断中均没有transition填充或命中；
null原型微测试命中不能代替真实工作负载覆盖，三个案例也不代表其他全部案例/N。

## 后补OOM压力检查的失败仍保留

原探针没有正确处理上游允许的null OOM异常；修订探针仅改诊断JS，不改VM。
`oom_pressure.explore01.json`及全部原ASan失败不删除。修订后的
`oom_followup.explore01.json`仍为LIMITED_OOM_FAILURES，不能作为安全通过。
A/s001独立ASan对照也在异常回溯区域复现；两个相关helper在A、s001和七个候选中
逐字SHA相同。不能因此排除候选新增的其他OOM问题，也不在本轮修补冻结底座。
