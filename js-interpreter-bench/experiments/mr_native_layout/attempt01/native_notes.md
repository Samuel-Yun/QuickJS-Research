# 实际分派与候选native路径

## 怎样核对，而不是删掉数字比文本

M/R正式源码逐文件身份在sources/identities.json，底座04be246001599f5995fa2f2d8c91a0f198d3f34c。
原M→R补丁不改变quickjs.c；实际正式ELF的JS_CallInternal却分别为41599/42021字节，入口0x22ac0/0x22ba0。
源码定位：quickjs.c:17798（SWITCH）、17954（push_this）、18241（call_method）、18287（return）、19766（add_loc）、20070（inc_loc）；M/R此文件同字节。
真实ELF dispatch_table.85的256个地址在native/final/*/dispatch_table.json；opcode_entries.csv把实际opcode映射到入口、函数内偏移、mod16/64/4096。
diagnostic/raw是另一套制品的实际逐函数/PC分派，不能把诊断版的native地址搬到正式版。
native/excerpts/*.asm是连续地址窗口，**可能跨入其它handler，不能从上到下全部当一次执行路径**；完整上下文和DWARF在native/final/*/*.gz。

link_check.py按原quickjs.o的真实重定位字段位置比较每一字节，不抹掉寄存器、立即数或位移。
八个layout body的变化字节均由这些字段覆盖；relocation_details.csv保留原表达式、前后原始操作数字节和PC32目标。
256个dispatch入口均按该条件实际padding平移。这个检查不是全ELF语义形式证明，也不宣称其它helper全体字节相同。

## numeric：这一轮循环具体做什么

m4Loop完整最终码18字节，14个静态opcode（operand字节不算指令），见native/target_bytecode.md。
N2诊断：PC4/5/6/7各8194次，PC9/10/12/14各8192次；M/R逐PC相同。PC10是add_loc，PC12是inc_loc。
所有结果是8386560，范围不越32位有符号上界；目标没有字段读，也没有streak操作。全进程仍有adapter/driver等少量字段读取，不能说整个进程零属性操作。

下面是静态候选整数路径的边界，不是native分支实测次数：

|操作|M正式地址|R正式地址|实际看到的工作|
|---|---|---|---|
|get_loc1|0x24a41起|0x24c6a起|从[rbp-0x150]取得var_buf，读取局部JSValue的payload/tag，检查引用tag后推到VM栈|
|add_loc|0x26f93—0x27003|0x270f0—0x27160|r13定位var_buf[idx]；rbx是VM栈顶；检查两个tag、做32/64位加法与溢出比较、写回局部、弹16字节，间接dispatch|
|inc_loc|0x2780f—0x27879|0x272aa—0x27314|xmm2读取16字节JSValue并存入[rbp-0x110]临时区，再读tag/payload；非整数/INT_MAX走另一分支，整数加1写回|
|lt|0x27c5a—0x27ca0|0x2786d—0x278b3|读两值tag/payload；整数cmp/setl，写回布尔JSValue，弹栈并dispatch|
|if_false8|0x2813f—0x281a2|0x288a8—0x2890b|读取布尔值，决定下一PC，更新interrupt计数，必要时poll，否则通过r15表间接跳转|
|goto8|0x2820d—0x28249|0x28bb5—0x28bf1|读有符号8位位移，计算目标，interrupt检查，间接dispatch|

这些窗口的相应正常工作保留同样的关键寄存器/内存操作，多个handler的位置和慢分支目标却不同。
例如add_loc里的慢tag分支：M 0x26fc0→0x2b390；R 0x2711d→0x2af1a。
inc_loc两边都存在栈临时保存，不能说这是R新增spill；没有完整动态native trace，也不能说整个函数没有其它spill差别。
r12通常保存当前操作数字节PC，rbx是VM值栈指针，r15用于dispatch表；这些是本次机器码寄存器，不是JS虚拟寄存器。
PC、tag检查、异常/浮点慢路径与引用型值分支分开看；不能把下一handler或互斥分支串起来。

## own_integer：R确实保留了额外命中工作

get_field_rdi入口：M0x24002，R0x2410f。M用shl rax,4计算16字节site；R0x24139的lea rax,[rax+rax*2]接0x2413d的*8为24字节。
R0x24152先读[site+0x10]的streak，shape/offset命中候选经0x2a0d0→0x2b662，0x2b670 test cl,cl、0x2b672 je跳过0x2b674的清零store。
M命中候选在0x29ce0起，没有streak检查。诊断确认目标8192查询/8191命中（N2），两边命中/更新相同，R无退出；R实际策略检查/条件写不为零。
这里的策略计数不是CPU load/store次数。site stride/数据布局、代码派生与检查在总比较里同时存在，不把差值分摊成一次streak成本。

## own_method：方法取值、receiver、调用和返回

caller m3Call的原PC13为get_field2_rdi，PC19为call_method；callee m3Step有push_this、put_loc0，再读bias、add、return。完整实际码见target_bytecode.md。
M get_field2_rdi入口0x23f2a：shape检查分支0x23f6c→0x29f02；成功后取prop[offset]并对函数引用加计数，经0x23fe4回到公共完成部分。
R入口0x2400a：0x2402c/0x24030算24字节site，0x2404e读streak，shape分支0x2405d→0x29fc0→0x2b180；offset有效后0x2b18d test/je条件清零，再取prop值并处理引用，经0x240f0完成。
上述是从实际正式代码和对应C实现追出的候选边；独立诊断命中计数支持语义路径，但没有逐次正式native分支记录。

get_field2保留原receiver，不把函数所在位置当this。caller把receiver/function/i放在VM栈；call_method从sp-call_argc定位参数、读函数和receiver、保存sf->cur_pc，递归调用JS_CallInternal。
M0x239f8—0x23a69与R0x23ad8—0x23b49保留同样参数读取/栈槽保存，call目标分别是本版JS_CallInternal，返回后再检查异常与tail opcode并释放调用参数/函数/receiver。
callee push_this的对象正常候选在M0x2563c—0x2567e、R0x2576c—0x257ae，包含receiver引用加计数和JSValue推栈；随后读取bias的整数结果与函数对象引用的处理不能混为一谈。
return取回结果，进入done处理局部值/参数/帧；M0x231a3起、R0x23283起。两边prologue保存rbp/r15/r14/r13/r12/rbx，局部栈预留0x248。
相同prologue、个别相同正常片段不证明整条调用路径相同，更不能用它宣布引用管理或某条C判断解释了性能。

## Richards与归一化范围

采样前correctness-driver N2全进程M/R分别403808/323582次IC查询；R另有80226次恢复普通读取，合计403808。命中同为322728，R退出21点。
采样后另用**精确measurement driver**独立N2复核：M/R查询403809/323583，R post仍80226，命中同为322727、更新同为105、R退出21点。该scope不能与correctness-driver表混算；原始记录分别保留。
原始每PC dispatch保留IC和ordinary两通道；归一化只将同一原始PC两通道相加，不改变返回、分支或其它opcode。
这不声称所有JS属性读均能用一个IC字段覆盖；也不把融合handler消费的逻辑opcode冒充一次native dispatch。
Richards有真实退出，不与三个无退出micro作同等单因素机制归因。诊断是N1/N2，不外推正式N512的精确生命周期计数。

## 固定链接摆放的作用和盲区

p000逐字节匹配base .text；其余16/32/48平移正常quickjs .text贡献，原对象相同，handler内部相对顺序不重排。
初版padding缺GNU property note（原对象FEATURE_1_AND=IBT|SHSTK）导致PLT/前缀变化，零条件不等价，保留于layout/initial_zero_failure.json、manifest.initial.json及native/初版目录。
正式八条件使用复制原note的同一种padding对象；没有换链接方法、增加padding值或试更快参数。
padding是局部STT_OBJECT、无重定位/构造器/JS入口，不是函数，不在dispatch表；正常调用/返回与原对象保持。静态引用及链接材料见links/final与padding/；没有动态native覆盖率证明。
保留ASLR，各条件独立load_mapping.json记录了实际加载映射；函数相对位置与页内低位不等于跨进程绝对基址。
这是代码摆放/地址关系干预，可能影响分支目标关系和其它局部性；不是单一I-cache实验。perf不可用，cycles/instructions/branch-misses和精确动态native路径均UNKNOWN。
