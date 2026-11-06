# 搜索机制及来源

以下是本轮实现依据，不把其他语言中的性能数字外推到 QuickJS。搜索前阅读公开页面和对应实现，未使用私有 JWST。

| 来源 | 版本/位置 | 本轮可验证内容 | 依赖与限制 |
|---|---|---|---|
| [Deegen](https://fredrikbk.com/publications/deegen.pdf) | Xu/Kjolstad, OOPSLA1 2026, §4、消融 | 编译期模板、直接记录寻址、专用回退 | 不移植 Copy-and-Patch/JIT，不外推 Lua/SOM 结果 |
| [Ertl/Paysan](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ECOOP.2024.14) | ECOOP 2024, VM IP 更新 | 安全短链减少一次 dispatch/IP 更新 | 必须保留可进入的原始 opcode、异常 PC 和引用语义 |
| [Larose/Vollmer/Marr](https://www.jot.fm/issues/issue_2026_01/a15.pdf) | JOT 2026, interpreter design tradeoffs | 将布局、分发和表示分别验证 | 其他 VM 的归因不替代本次实际计数 |
| [Luau performance](https://luau.org/performance/) / [GETTABLEKS](https://github.com/luau-lang/luau/blob/master/VM/src/lvmexecute.cpp) | 2026-11-05 读取的公开 master，VM_CASE(LOP_GETTABLEKS) | 预测字段位置，再核对当前条目 | master 精确 commit UNKNOWN；QJS 需检查 hashed shape、live atom、descriptor 和范围 |
| [PEP 659](https://peps.python.org/pep-0659/) | Python 3.11 adaptive specialization proposal | 准入、饱和置信度、冷却与重试 | 与旧 R/K32 的阈值变体单列，不复制 Python 类型假设 |
| [SpiderMonkey CacheIR](https://searchfox.org/firefox-main/source/js/src/jit/CacheIR.h) | 页面显示 0b76543a，2026-08-29 | 精确 shape/atom 守卫与读取当前值分离 | 不生成 JIT stub；多 shape 共享动作仍保留完整守卫 |
| [CPython 3.14](https://docs.python.org/3/whatsnew/3.14.html#new-type-of-interpreter) | 2025-10 发布说明 | tail-call interpreter 作为后续工具链方向 | 主批次 GCC13.3 固定，本轮不引入不同 ABI/编译器 |
| [Hyperband](https://www.jmlr.org/papers/v18/16-558.html) | JMLR 18(185), 2018 | 短测分配预算、机制保留名额、逐层增加重复 | 这里不是实现论文算法的理论保证；小集合可能误排完整套件 |

P 从 s001 扩为有界 PIC，探测固定或 MRU，替换 RR/LRU/CLOCK。热命中可能增加元数据写入，所有 shape 强引用必须标记和释放；非二次幂使用真实取模。

L 比较 index/PC-relative、SoA/hot-cold/受检 u16 属性下标。atom 所有权、输出恢复和合并分配需要联动；额外字节码副本成本仍在。与上一轮 U 的字节偏移、c005 热冷拆分分别记控制关系。

T 保留本地单槽，失配再探函数级有界 set-associative shape+atom 表。与 s002 的“每次都查共享表”不同。runtime 共享没有可靠的 GC 根和多 context 释放方案，先明确 UNSUPPORTED，不把函数级测试冒充 runtime 级。

Q 改准入与失配状态。miss_streak 属旧 R 的机制变体，sampled_rate/confidence/cooldown 分别记录每次查询/命中上的维护成本；不假定这些写入免费。

H 在 site/shape/function+atom 的小 hint 列表中预测下标。只有当前 hashed shape、有效范围、非空且相同 atom 和普通数据 descriptor 才直接读当前值。未 hashed 时用原路径，避开删除 unlink→free→clear atom 的重入窗口。预测不保存 prop 地址或 JS 值。

F 先尝试不删除原字节码的 read+drop 动态短链，跳转到原 drop 仍有效。其他相邻融合未完成目标边界和异常证明时标 UNSUPPORTED，保留实际字节码模式检查，不凭猜测改编译器。

S 对小 shape 的完整描述符数组作有界正/逆向查找，只在无删除且可核验 live 条目时启用。all_own_descriptors 仅返回描述符，调用者继续执行原 descriptor 语义。own_data 若看到其他 descriptor 则完整回退。与 s004 的一次 hint 不同，扫描增加比较与空间局部性取舍。
