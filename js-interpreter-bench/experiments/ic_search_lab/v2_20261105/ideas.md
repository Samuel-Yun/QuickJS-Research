# 备选与排除：先查旧方案，再实现

依据：冻结M及上轮12份patch；E attempt03/design.md、R attempt01/results.md、U ic_fast_slow/results.md、旧legacy_ng_ic/legacy_design.md。以下为待测设计，不承诺收益。

1. **s001：PC相对定位、bytecode与记录同块。** M每次从b加载sites基址并用索引定位记录。把可写code副本和对齐记录放一个块，5字节操作数改为从操作数字节到record的正相对距离，handler由当前PC直接定位。命中保留原全部guards和当前值读取；失配仍普通读取/更新。会增加一次代码复制、保留原b内代码空间及指令缓存/数据局部性代价。与U不同：U只改JSProperty元素下标为字节偏移；本项改变的是bytecode→site寻址、所有权和输出恢复，属性offset仍元素下标。与c005的热冷分区不同。写出始终恢复普通opcode/atom；加载重新准备，无磁盘指针/新不兼容格式。
2. **s002：每函数有界shape+atom共享表。** 改逐site强shape引用为每函数固定8-entry直接映射表，site只保留原atom；命中hash(shape,atom)后验证两者及原class/exotic条件，从当前prop取值；miss完整查找后替换目标entry。metadata与table一次分配，GC/free遍历table。省重复shape引用/大函数按site增长的热记录，新增hash、碰撞和函数头指针成本。旧NG是每function+atom各4-shape，本设计是所有atom/位置竞争一个固定总预算；E没有此共享mega表。不是把8槽叫新算法，主要干预是缓存单位/空间上界/所有权。
3. **s003：整份metadata首次函数进入才准备。** M编译/加载即扫描、建site并重写；新方案对从未进入的函数完全不准备，第一次进入时准备整份metadata，之后ready守卫。命中/失配沿M。新增每次函数调用ready检查，并把首次准备分配/扫描移入执行口径。与E不同：E仍eager分配每site atom+PC metadata，仅第8次目标操作才建更大的vector；本方案没有这份eager metadata、无8次预算，也不加E的多态/原型/store。c008只是长度准入，不是此方案。OOM时保留可释放的普通bytecode，调用走原异常清理；不把成本移动后称为排除frontend。
4. **s004：shape本地正查找hint。** 在JSShape保存一个上次成功的属性下标，find_own_property先核对下标范围及当前shape-property的atom，才返回当前descriptor/prop；不匹配照旧hash并更新hint。M前端IC不变，此项改miss与其他helper共用的查找后端。可跨对象/位置/函数共享，只有一个整数，无缓存值/prop地址/atom引用/shape外部保活。删除/重排后仍验证当前entry，不信旧offset。新增所有shape空间和失败hint检查，可能伤害交替字段。旧E/R/P/M均未在JSShape内做此hint；不是省重复hash的虚构叙述，原find本来只做一次hash。
5. **本轮排除：get_loc+get_field融合。** 需要验证所有跳转目的不能落在被融合的第二条指令，当前尚未完成安全目标映射；不能仅匹配字节模式就实施。区别于槽数变体，但本轮不以不完整融合凑数量。
6. **本轮排除：弱shape与全局失效通知。** 可能减少保活/COW，但需要shape销毁/复用及GC根正确通知，当前没有小范围完整证明；不删强引用后直接跑分。
7. **重复排除：一层/三层prototype、named store、lazy vector阈值。** 已由H/E实现；本轮不换名字重复，不把旧诊断覆盖频率直接当时间占比。
8. **重复排除：R/K32 generic退出、容量/inline/守卫顺序。** 第一轮及更早已有实际负/小效果，不能填满本轮候选数量。

## 公开机制参考（2026-11-05实际读取）

- QuickJS官方固定commit04be246001599f5995fa2f2d8c91a0f198d3f34c，quickjs.c；以本地同revision实现核对find、shape、编译/加载/输出/释放。
  https://github.com/bellard/quickjs/blob/04be246001599f5995fa2f2d8c91a0f198d3f34c/quickjs.c
- WebKit官方《A New Bytecode Format for JavaScriptCore》，2019-06-21，文中r237547；参考linked instruction含运行期信息与磁盘表示分离的取舍，不复制其JIT或声称与当前JSC相同。
  https://webkit.org/blog/9329/a-new-bytecode-format-for-javascriptcore/
- V8官方Maps/Hidden Classes，说明shape/map与descriptor定位的关系；仅作结构参考，不证明当前d8逐site命中，也不复制stub。
  https://v8.dev/docs/hidden-classes

s001 hit: PC+relative→site；object/class/non-exotic/exact-shape→current prop→Dup/receiver语义；miss: site.atom→原lookup→合格own data才retain/update。
s002 hit: site.atom→函数table[hash]→shape+atom→current prop；miss: 原lookup→准入→retain新shape/释放旧shape/发布entry。
s003 hit/miss: 函数进入前若未ready先准备；之后完全沿M。首次调用也计时，不偷预跑。
s004 hit: currentShape.hint<count && currentProperties[hint].atom==requested→当前descriptor/prop；miss: 原hash链→有结果才更新hint，缺失/特殊语义仍由调用者处理。

## s004实现前发现的必要安全适配

固定源码delete_property先从hash链移除，再free_property，最后才把entry.atom清为NULL；free_property可能触发原生finalizer并重入属性读取。因此“只检查当前entry.atom”还不足以证明与普通hash查找等价：已unlink但尚未清atom的窗口必须处理。本轮不运行这个不完整版本，计划在unlink之前将当前shape.hint无效化，并用delete_reentry.c检查释放回调中x确实已不可见。这是hint机制必要的修改端保护与成本，不称没有维护开销；不是一个额外性能优化。
