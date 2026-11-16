# 两项入围机制：实际少做了什么，又增加了什么

本文只解释机制。性能结论以本目录重新采集的三轮复筛表及最终 decision.json 为准；下面的计数不是耗时，不能除时间得到某条指令的独立成本。

## 共用起点 M

M 在函数准备时把具名读取改为同长度的 `get_field_rdi/get_field2_rdi`，每个位置有 atom、强引用 shape 和属性数组下标。命中前检查对象类型、普通 class、非 exotic 和精确 shape；命中后读取 **当前** `p->prop[offset].u.value`，而不是缓存旧 JS 值。`get_field2` 还要保留 receiver。失配先走原属性查找；只有合格的自身数据属性才更新记录。原型、getter、Proxy 等不能冒充自身数据命中。

原始实现可由 `seed_M.tar.gz` 恢复；重点是 `read_ic_opcodes.inc` 的 `GET_READ_IC`、`read_ic_runtime.inc` 的 `rdi_probe/rdi_update/rdi_free`。编译、加载、GC 和序列化并非独立于这份设计：记录保活 shape，GC 要标记，销毁要释放，保存字节码时要恢复普通 opcode/atom。

## s001：当前 PC 直接找到记录

M 的定位是 `&b->read_ic_sites[index]`。s001 改为：

```c
uint32_t delta = get_u32(pc), offset;
ReadICSite *site = (ReadICSite *)(pc + delta);
```

这是 `patches/s001.patch` 中 `read_ic_opcodes.inc` 的真实片段。准备阶段另外分配一块 `[bytecode 副本 | 8字节对齐 | 16字节记录数组]`，把操作数写成从操作数起始 PC 到对应记录的正距离。指令仍为 5 字节，栈效果、跳转距离和属性数组下标的意义不变。与旧 U 不同：这里改的是 **bytecode 到缓存记录**，不是把属性元素下标换成字节偏移。

独立诊断中 `function read(o){return o.x;}` 的最终 7 字节代码：

```text
M/s004: cf f4 00 00 00 00 28
s001:   cf f4 06 00 00 00 28
```

`get_field_rdi` 从 offset=1 开始，操作数 PC=2，记录从对齐位置 8 开始，所以 delta=6。控制器实测 `pc_relative_record_matches_first=1`，不是仅凭字节猜地址。`narrow_s001.results.json` 留有原始输出。

Release ELF 的实际片段（`native_M.txt` / `native_s001.txt`，相对 `JS_CallInternal` 的偏移）：

```text
M:    +5446 mov (%r12),%eax
      +5450 mov -0x128(%rbp),%rcx
      +5465 shl $0x4,%rax
      +5469 add 0x60(%rcx),%rax
      +5473 mov %rax,%r14
s001: +5430 mov (%r12),%eax
      +5442 lea (%r12,%rax,1),%r14
```

这是非连续摘录，省略中间的对象/类型加载；不是整个 handler。可确认 site 索引缩放和函数头中 sites 基址的取得不再出现在这个定位前缀，不能据此给这些机器指令分配独立时间。

### 两个对象、一次换值，再一次换布局

诊断创建 `left={x:11}`、`right={pad:0,x:22}`，分别用 `[left,left]` 和 `[left,right]` 连读 8192 次；之后 `left.x=99`，再 `left.added=1`。每阶段在计数区间外完成设置和打印，没有性能计时。

- 单态第一次：M/s001 都是 8191 次 hit、1 次 fallback；换值后 8192 次 hit，返回新值；加字段改变布局后 1 次重新查找和更新。
- 两种布局交替：M/s001 都是 8192 次 fallback/update，首次 8191 次替换，后续 8192 次替换。单槽设计未变，不能把寻址改变说成减少失配。
- 守卫、强引用 shape、当前值读取、慢路径均沿 M。保存时通过相对地址取回 atom，写出普通字节码；加载重新准备，磁盘格式里没有本机指针。
- 成本是多复制并保留一份字节码，还需准备扫描及复制。原函数内嵌的旧代码空间不能单独释放。每个有记录函数的这块请求比 M 多 `align8(byte_code_len)`，不叫内存节省。销毁时必须先释放字节码 atom，再释放合并块；补丁也改了这个顺序。

GC、OOM、已执行字节码保存/加载和 qjsc 检查见 `s001.matched.lifecycle.json`。这些是本轮布局门禁，不是完整 test262 或 sanitizer 证明。

## s004：在当前 shape 上记住上一次找到的描述符

M 的单槽前端不变。s004 在 `JSShape` 增加 `lookup_hint`，在 `find_own_property` 中先试它：

```c
prop = get_shape_prop(sh);
if (sh->lookup_hint < (uint32_t)sh->prop_count && atom != JS_ATOM_NULL) {
    pr = &prop[sh->lookup_hint];
    if (pr->atom == atom) {
        *ppr = &p->prop[sh->lookup_hint];
        return pr;
    }
}
```

真实片段来自 `patches/s004.patch`。只保存整数下标，每次检查当前 shape 的当前 entry 和 atom。返回当前 descriptor/prop，由调用者继续处理描述符种类、getter 等语义；不跳过这些检查。hint 不匹配仍做原 hash bucket/链查找，成功后更新 hint。**原路径本来只做一次 hash 查找**，不是消除了虚构的重复 hash。它也没有消除 `get_shape_prop` 对 `prop_hash_mask` 的读取。

### 同一检查在 s004 中如何变化

两对象交替读取 `x` 时，单槽仍然每次被另一 shape 替换，因此 MIC 查询/hit/fallback/update 与 M 完全相同。但是每种 shape 自己可以记住它的 `x` 下标：

| 首阶段，N=8192 | MIC hit | fallback/find | hash 路径 | hint 返回 | update |
|---|---:|---:|---:|---:|---:|
| M / s001 | 0 | 8192 | 8192 | 0 | 8192 |
| s004 | 0 | 8192 | 2 | 8190 | 8192 |

换 `left.x=99` 后读取的是新值；此阶段 s004 hash=0、hint=8192。再加字段后同样输出正确结果。本检查中缓存 shape 的保活/COW 和 shape 克隆会影响新 shape 是否继承 hint，因此不把一次观测泛化成任何布局变化都免查找。

`narrow_M.results.json`、`narrow_s001.results.json`、`narrow_s004.results.json` 是三个独立诊断制品的输出，控制器和计数范围一致。`find_own_property` 可内联，`find` 计数是逻辑进入次数，不是实测 native call 指令数。这里也不是 Octane 的逐项动态计数，不能直接推断某基准有同样命中分布。

### 正确性和新增成本

hint 不拥有 atom/shape/value，不引入新 GC 边；失效由范围和当前 atom 验证。但删除还有一个重要窗口：原代码先 unlink，再释放值，最后清 atom。释放值可能运行原生 finalizer 并重入读取，旧 atom 尚未清空。因此 s004 **在 unlink 前先置 hint=UINT32_MAX**。`delete_reentry.c` 的实际输出为 `DELETE_REENTRY_PASS deleted=1 finalized=1 saw_undefined=1`，证明这个有针对性的删除重入场景得到正确结果，不是全体安全性证明。

所有 shape 都多承担存储和失败检查；DWARF 实测本平台 `sizeof(JSShape)` 从 56 增为 64，不是总内存只加4字节，也不是75%节省。频繁交替读不同字段可能使 hint 不断失效。尚无该设计的全套 RSS/间接保活测量，写 UNKNOWN。

Release 片段 `native_s004.txt` 可见 hint 下标/范围检查以及随后 hash 路径；正 hint 分支目标在当前 640 字节窗口之外。完整分支没有因此被假装已反汇编。不过独立窄计数已实际确认过 hint 返回。实际 Release 和诊断布局不同，不能拿诊断耗时当 Release 收益。

## 怎样读这些证据

- 源码：固定 M + 各自 patch，SHA 和32份源文件清单在 `sNNN.matched.json`，不要用现在恢复为 M 的 active 源码解释候选。
- 机器码：`native_manifest.json` 固定 ELF SHA。GDB 的“Source file is more recent”来自活动源码路径复用；输出中自动显示的 C 行不可信，本文只引用真实 ELF 反汇编。
- 实际路径计数：两形状小程序确认机制是否工作；不把它们混进完整套件 GM，不据频率乘一个常数估耗时。
- 性能：另看新进程复筛表及区间。数值/非目标案例也会随代码布局、支撑操作和环境变化，不能全归因于属性查找减少。
- 没有一种机制仅因 C 更短、指令少或局部计数改善就自动成为更快的引擎。复筛若无整套支持，保留这里的局部事实并停止本轮搜索。
