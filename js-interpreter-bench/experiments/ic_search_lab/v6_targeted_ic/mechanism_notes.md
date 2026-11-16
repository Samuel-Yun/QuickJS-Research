# 执行路径和证据范围

## 固定底座与正式/诊断分离

upstream `04be246001599f5995fa2f2d8c91a0f198d3f34c`，QuickJS2026-06-04。
所有新正式制品沿用GCC13.3/-O2/-g/-fwrapv/HAVE_CLOSEFROM，不加NDEBUG/LTO/PGO。
`identities/`保存逐文件源码SHA和实际编译链接命令，`patches/`均可相对s001恢复。
C1逻辑parent为P1，另保留P1→C1差异以单独检查这一项变化。

计数版在函数头增加进入次数，在C中增加计数与两个准备计时调用。
`diagnostics/*.identity.json`记录其不同源码与ELF身份。它们的时间不作为Release性能，
其函数头大小也不能替代正式DWARF大小。正式大小来自 `native_layout.csv`。

## B2借用式融合

真实修改在 `patches/B2.patch` 的 `quickjs.c`、`read_ic_prepare.inc` 和opcode定义。
最终指令遍历按 `short_opcode_info(op).size` 前进，不搜索操作数字节。
只有get_arg0/get_loc0后紧邻get_field_rdi才改写首个1B opcode，后面的5B字段指令保留。

执行时，原arg/var槽仍拥有receiver。普通非exotic对象且已有own-data强shape缓存精确命中，
才从当前prop槽Dup结果，PC跳过随后5字节。区间无回调、分配或释放receiver。
失配只按原加载Dup receiver，下一次分发仍进入原get_field_rdi慢路。
没有跨通用算术、getter或valueOf借用，也没有融合obj.a.b的第二级。

同长保留了原跳转偏移和第二条字段指令入口。测试中的条件汇合
`(flag ? first : second).x`覆盖另一分支直接进入字段读取的情况。
内部探针的7B读取函数首opcode247、次opcode244，见 `internal.B2.json`。
快路不抛异常、不进入用户代码，原SF的PC更新规则不需新增异常入口；
失配仍由原属性handler在进入helper前更新cur_pc。
序列化只改写写出副本为原加载编码，读取拒绝运行期opcode；copy/ROM和qjsc均实际检查。

冻结s001的执行图像在prepare之后，普通读IC更新只改site，不再重写这些opcode。
因此B2专用handler不需要重复检查后继编码。若未来加入dequickening等代码重写，
必须重审这一不变量，不能把当前证明直接套到新组合。

## ID_CTRL / ID_READ

两版共同在JSShape加64位layout_id，在JSRuntime加不回绕计数。
新nohash shape和memcpy克隆清0；hashed空shape只在完成初始化后发ID。
add_shape_property、resize_properties和js_shape_prepare_update在可能修改/分配前失效ID。
发生变化的shape保持0，直到完成普通hashed own-data查找后才发新ID。
原型重连、删除/压缩、descriptor及autoinit转换通过上述修改入口。
全局声明中特殊VARREF直接修改不属于普通JS_CLASS_OBJECT own-data缓存准入。

控制版仍按指针及原强边工作；ID_READ的16B记录改为uint64 ID、uint32 offset和atom。
probe要求非零ID、当前shape仍hashed及ID一致。读当前值，值更新无需换ID。
缓存不保存shape/prop裸指针，没有该记录对应的GC边或shape retain/release。
普通对象自身的shape引用、返回值引用和原GC仍然存在。

runtime-local计数达到UINT64_MAX后饱和，新/变更布局为0，不回绕、不让0命中。
ID不写入保存字节码，不跨runtime解释。新分配清0和不复用ID共同阻止地址ABA，
只有分配时写ID而忽略原地变化是不够的。

`internal.ID_READ.recovery01.json`实测同对象原地变更、同地址不同布局复用、
值替换和上限饱和。`internal_id.c`若未观察到地址复用会失败，而非把未遇到当通过。
普通/只读/getter/Proxy/删除/原型及C finalizer检查见targeted/safety/sanitizer原始记录。
这不是全C API、完整test262或所有可能调用方的证明。

## W1写入

仅重写put_field，保持5B、原atom和栈/strict语义。普通非exotic对象，
已有且可写普通own descriptor才填充，按上游TMASK|WRITABLE|LENGTH掩码检查。
新字段、getter/setter、不可写、长度、特殊类/Proxy走原JS_SetPropertyInternal。

命中使用原set_value，先发布新值再释放旧值，再按原顺序释放receiver。
不在可能释放之后继续使用旧JSProperty指针。合格miss写入后重新取得当前p/shape/descriptor，
然后才更新缓存。这里的重查是保留的真实维护代价，不宣称免费。
没有E的未建vector/GENERIC状态，不能把这版称为删除了所有普通慢路。
`native_finalizer.c`五场景包含属性数组增长、删除、重定义、getter和只读。

## P1 / C1

P1只在get_field2的继承普通data位置安装receiver+直接holder强shape守卫。
get_field2本身只是“保留receiver”的语义，也会用于复合赋值，不无条件称方法调用。
命中从当前直接holder当前槽Dup值，receiver仍是原对象，不是prototype。
遮蔽、原型重连或descriptor变化使守卫失配；纯值/方法替换会读出新值。
更新先保活并发布新记录，再释放旧边，之后不复用旧prop指针。
own get_field不增加holder条件，但全部site变成24B，数据布局成本仍存在。

C1在已有P1命中覆盖后才加入。只有继承快路成功且下一条是无参正常call_method，
才在压入当前callee后，模拟正常dispatch的opcode和PC变化，跳到原call_method入口。
它仍执行原JS_CallInternal、callable检查、this、异常与返回清理。
尾调用、带参数、getter/Proxy和own命中不走这条融合。
`obj.m(arg())`不会被移动查找；`call_targeted.js`实际检查实参改变方法仍调用先取到的callee。
原bytecode未删除/重定位，第二条call指令仍可独立进入。
Richards N1记录22,968次实际dispatch绕过，不能称省了22,968次函数调用或RC。

## L1 / K1及冷代码

L1按compiled code body累计普通入口次数，阈值3。闭包共享b时也共享次数，不是逐闭包热度。
在建立新frame及取入口PC之前检查是否已有同b的活跃普通frame，存在时不迁移。
生成器/async保持普通字节码，不迁移挂起图像。可选分配使用rt malloc失败返回，保留旧图像。
初版内部测试错误地要求空异常是null，实际为JS_UNINITIALIZED(tag4)。
旧失败和原测试保留，`internal_lazy_v2.c`改成比较真实原tag；没有修改正式L1制品来通过测试。

L1增加的32位计数使正式函数头144→152B，不能只按4B算代价。
N1 CodeLoad确实有未进入code body，但不等于所有函数都冷。
Typescript静态编译在Run前完成，L1却将598次准备移入Run，这是计时边界中的取舍。

K1仅将rdi_update从force_inline改为no_inline，与旧c011同构，parent现在是s001。
`diagnostics/native.K1.json`、`caller_callee_frames.json`提供匹配Release符号、
序言、get_field/add/shl入口窗口。普通ABI把保存责任分配给caller/callee，
384B静态窗口可能包含邻接块，不能凭序言或栈引用数量认定热循环spill成本。
实际s001/K1的序言都预留0x248字节，JS_CallInternal符号长度分别41,567/41,386B。
函数略小和相同预留都不是运行更快或保存成本相同的证据。
本轮没有Clang/preserve_most、cold属性或新替换策略。

## 计数与内存的限制

`mechanism_summary.csv`区分handler进入与被融合的逻辑get_field操作。
写入新own列是普通慢路返回后观察到新增own，不是每一次add_property helper调用的分区。
property_array_growth原计数只覆盖resize_properties；transition复用时另一路realloc未全部计入，
因此不将其称为所有属性数组扩容总数。逐site完整shape种类/变更轨迹仍UNKNOWN。

Run内编译/准备快照只有当native时钟实际调用恰好2次时使用。
Splay为404次，相关Run内派生字段留空，保留全进程计数。
N=1是driver的计时重复数，不保证全进程只有一次Run。
NavierStokes的原driver还在计时后补验到15帧，N1有14次补验，
因此其上述前瞻计数不能直接当一次timed Run的频次。见diagnostic_scope.csv及原stdout。
诊断prepare_ns含额外时钟调用和插桩，又处于已知时钟问题环境，不作为性能依据。
RSS是GNU time整个进程N1峰值，每组仅3次，不能证明相等或推导间接保活精确字节。
