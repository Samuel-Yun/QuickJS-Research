<!-- ppt-master-schema: design-spec/v1 -->
# QuickJS weekly 20261017 - Design Spec

## I. Project Information

| Item | Value |
| --- | --- |
| Project Name | weekly_quickjs_20261017 |
| Canvas Format | PPT 16:9, 1280×720 |
| Page Count | 8 |
| Primary Language | zh-CN |
| Target Audience | 导师与编译器/虚拟机课题组 |
| Communication Intent | 汇报真实字节码与属性定位结果，讨论可解释的差异及证据限制 |
| Desired Audience Outcome | 能复述具体指令如何完成源码，并区分观测与未验证解释 |
| Core Message / Ask / Action | 快慢随操作而变；普通own字段是具体候选，但尚未解释总体性能原因 |
| Delivery Context | 马云霄现场讲述，代码须投影可读 |
| Artifact Afterlife | 可编辑周报；与Beamer备选比较 |
| Reading Mode | balanced |
| Content Strategy | 保留已核对事实、限定语和6页正文顺序；完整指令另放2页附录 |
| Design Style | 代码并排讲解 |
| AI Image Acquisition Path | not applicable |
| Generation Mode | continuous |
| Spec Refinement | disabled |
| Speaker Notes | enabled — final Stage-2 proactive policy，复用已核对讲稿 |
| Custom Animations | disabled — final Stage-2 proactive policy |
| Narration Audio | disabled — final Stage-2 proactive policy |
| Created Date | 2026-10-17 |

## II. Canvas Specification

| Property | Value |
| --- | --- |
| Format | PPT 16:9 |
| Dimensions | 1280×720 |
| viewBox | `0 0 1280 720` |
| Margins | 48 px；页脚位于独立下边带 |
| Content Area | 正文 y=104..620，页脚 y=638..706 |

## III. Visual Theme

### Theme Style

- **Mode**: custom
- **Mode Behavior**: 保留六页研究顺序，从同一轮循环怎样执行到方法变体，再回到原程序的具体state位置；每页先展示证据，再陈述可支持的判断及限制。
- **Visual style**: custom
- **Visual Style Behavior**: 白底黑字；代码等宽，列标题加粗，稀疏灰细线分隔共享语义段；比较表按同一数值精度排齐。较长指令给予更宽列，页脚独立，不用图片替代文字。
- **Theme**: 共享标题轴与底部来源带用于定位；核心内容随代码、表格、诊断结论变化。
- **Tone**: 平实、审慎，观察/解释/UNKNOWN明确区分。

### Color Scheme

| Role | HEX | Purpose |
| --- | --- | --- |
| Background | #FFFFFF | 页面 |
| Secondary background | #F4F5F6 | 代码/表头轻底色 |
| Primary | #111111 | 标题 |
| Accent | #111111 | 关键数字加粗 |
| Secondary accent | #555555 | 次级标签 |
| Body text | #111111 | 正文 |
| Secondary text | #555555 | 注释来源 |
| Divider | #B9BDC3 | 分隔线 |

## IV. Typography System

### Font Plan

| Role | Character (Reference) | Primary | English if non-English | Fallback tail |
| --- | --- | --- | --- | --- |
| Title | 中性黑体加粗 | Microsoft YaHei | Arial | sans-serif |
| Body | 中性黑体 | Microsoft YaHei | Arial | sans-serif |
| Code | 等宽原始源码 | Consolas | Consolas | monospace |

- **Title stack**: Arial, Microsoft YaHei, sans-serif
- **Body stack**: Arial, Microsoft YaHei, sans-serif
- **Code stack**: Consolas, Microsoft YaHei, monospace
- **Role rationale**: Code的等宽间距用于对照真实指令，不与正文混淆。

### Font Size Hierarchy

| Purpose | Anchor Size (px) |
| --- | ---: |
| Body | 24 |
| Title | 36 |
| Subtitle | 26 |
| Code | 20 |
| Annotation | 20 |
| Footnote | 14 |

## V. Layout Principles

### Deck-wide Direction

- **Hierarchy direction**: 标题、原始证据、解释、限定语、页脚。
- **Composition tendency**: 对照页匹配语义分组，不强求单条指令一一对应；表格优先占满可读宽度。
- **Cross-page continuity**: 页脚环境相同，诊断页明确数据用途；附录指回正文state函数。
- **Spacing posture**: 证据页较密，结论页留白，来源与正文分开。
- **Spacing anchors**: page margin=48 px; block gap=24 px; column gutter=28 px; corner radius=0 px; body leading=36 px。

## VI. Icon Usage Specification

- **Primary bundled library**: none

| Icon Path | Suitable Scenarios |
| --- | --- |

## VIII. Image Resource List

| Filename | Dimensions | Ratio | Purpose | Type | Image pattern | Crop Policy | Acquire Via | Status | Reference | text_policy | page_role |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |

无外部图片；源码和字节码是应保持可编辑的证据。

## IX. Content Outline

### Part 1: 本周分析

#### Slide 01 - 同一轮求和怎样执行

- **Audience move**: 从引擎快慢概念到能比较同一轮循环的具体值流。
- **Relationships**: 相同源码分别由QJS与V8执行；指令组对照；计时属于完整调用而非单指令。
- **Title**: QuickJS与V8：字节码和属性访问分析
- **Core message**: 数值求和本例QJS更快；不同字节码组织不自动证明成本原因。
- **Content**: 马云霄/截至2026-10-17/本周任务；wbNumericLoop源码，n4096、结果8386560；QJS get_loc1/add_loc/inc_loc/goto8与V8 Ldar/Add/Mov/Star0/Inc/Star1/JumpLoop真实摘录；r0/r1虚拟槽；43.782/54.839 µs每完整调用，ratio1.253；30新进程/引擎，首次调用计入、无workload预跑；指令数非成本。

#### Slide 02 - 四组调用方式

- **Audience move**: 从方法案例差距到知道一层原型不足以解释它。
- **Relationships**: 四种表达式完成i+bias累加；own与prototype共享循环和方法，仅改变计时外对象建立方式。
- **Title**: 四组调用方式：一层原型够不够解释差距？
- **Core message**: own/prototype的跨引擎比值都约0.557，但组间差值不是纯查找/调用成本。
- **Content**: i0..4095、bias3、结果8398848；inline67.132/60.388/0.900，direct159.969/116.395/0.728，own217.156/120.905/0.557，prototype225.086/125.348/0.557；单位µs/完整调用含4096轮及摊薄driver，240样本；stepPlain显式obj与stepMethod this；参数/receiver/shape/反馈限制；不是上一页单纯求和。
- **Visualization**: call-timings：4组×表达式/QJS/V8/比值的独立表格。
- **Native-ready**: call-timings=yes

#### Slide 03 - 原Richards定位

- **Audience move**: 从run调用的直觉到属性聚合样本的实际分布与分母。
- **Relationships**: Scheduler的currentTcb指向TCB；TCB的task指向任务；取得对象、读方法和调用是不同工作。
- **Title**: 原始 Richards：查找区域样本落在哪里？
- **Core message**: 普通状态/调度字段值得继续看，但不是总体瓶颈证明。
- **Content**: Richards模拟任务调度；原schedule与TCB.run真实摘录；3诊断进程5393内部样本，1229查找区域已映射；currentTcb280/22.8%，state204/16.6%，run79/6.4%，分母1229，多个读写site；189活跃opcode，N1/N2计数核对，39helper探查UNKNOWN；诊断数据非正式性能。
- **Visualization**: lookup-samples：属性×样本/占1229的独立表格。
- **Native-ready**: lookup-samples=yes

#### Slide 04 - state的字节码

- **Audience move**: 能按读取、按位运算、短路、再次读取复述原函数。
- **Relationships**: 第一次读取后进行与/比较；左侧为真短路，否则第二次读取；两引擎完成同一语义。
- **Title**: 选定 this.state：按源码语义分组读字节码
- **Core message**: 真实指令组可以比较值流，但不是CPU指令或成本拆分。
- **Content**: 原isHeldOrSuspended return；调用者this为Scheduler，callee为TCB；QJS0/1/2/3，8/11/13/15，18/19真实摘录；V8 0/4，5/8/13/16/17，19真实摘录；省略必须显式标非连续，完整见附录；虚拟r0非CPU寄存器、offset非nativePC。

#### Slide 05 - 观测与待验证解释

- **Audience move**: 分清查找路径实测、反馈转换实测与每次快路径UNKNOWN。
- **Relationships**: QJS与V8两类证据对照；观察支持候选解释，不构成已证明因果。
- **Title**: 这一处实际知道了什么？
- **Core message**: QJS重复own查找已见；V8可能复用稳定字段反馈仍待验证。
- **Content**: QJS首次state offset3，每Run10671，全own普通数据/整数/一次自身探查，prototype/fallback0，仍shape/hash/描述符/值和receiver引用处理；V8两个位置FBV0/4，0→1，相同map0x189b01023ef1；日志非逐次命中，handler存在不证明执行，源码制品对应有缺口；不是已证性能原因。

#### Slide 06 - 结论与限制

- **Audience move**: 能提出一个有边界的下一步问题，而非宣称找到了总体瓶颈。
- **Relationships**: 三个观察与两项限制相互限定；两种后续证据可供讨论。
- **Title**: 本周能说什么，还有什么不懂？
- **Core message**: 已定位可讨论位置；采样扰动和实际V8路径仍需核实。
- **Content**: 操作改变快慢方向；一层原型不足解释方法案例；普通own字段值得深入；诊断N512冻结1718ms/ctx开启2223ms高约29%，不同批次点估计；两次state10671/10115但样本85/9，1ms请求实际10ms；先验证V8site快路径还是降低扰动复核分布；无总体GM或显著性结论。

### Part 2: 指令附录

#### Slide 07 - QuickJS完整指令

- **Audience move**: 能核对正文省略部分与完整最终序列。
- **Relationships**: 完整指令按真实offset执行，短路跳至return；对应正文第4页。
- **Title**: 附录A：QuickJS 完整最终指令序列
- **Core message**: 16条/29B是静态表示，不是时间。
- **Content**: S3完整16条opcode/operand，含push_0、dup、drop、第二次get_var/eq/return；局部0=this，栈深2；打印诊断构建，不拿其性能代release。

#### Slide 08 - V8完整指令

- **Audience move**: 能用真实dump核对独立反馈槽与短路位置。
- **Relationships**: 完整指令按真实offset执行；与QJS同一源码，不要求逐条对应。
- **Title**: 附录B：Ignition 完整最终指令序列
- **Core message**: 14条/31B不能与QJS条数混成单一成本。
- **Content**: S3完整14条opcode/operand，保留实际跳转目的地址与全部FBV；1虚拟寄存器/frame8B；日志地址只与同一进程对应。

## X. Speaker Notes Requirements

- **Generation**: enabled
- **Filename**: match each SVG filename under `notes/`
- **Content**: 依据已核对notes.md按页转述，保留限制和来源索引，不发明新解释。
- **Total duration**: 正文约10–15分钟，附录按讨论需要。
- **Notes style**: 中文口头讨论；每页2–4句。
- **Presentation purpose**: 汇报真实字节码和属性定位，讨论下一项证据。
