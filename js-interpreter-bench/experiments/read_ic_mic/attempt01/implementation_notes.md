# 代码、路径和统计单位

## 与历史 B/C/D 的区别

旧实现以函数+atom共享缓存，读写都覆盖；历史B的四槽结构只被填一槽，不是紧凑MIC。
本轮M/P从冻结upstream重新构建，只缓存最终get_field/get_field2的普通own数据读取；每一处最终PC独立，写保持上游。
没有导入NG运行时代码；只复用既有回归、驱动、源码归档与生命周期经验。M/P同一quickjs.c和模板，正式唯一区别是容量配置1/4。
所以本轮可以比较这两种具体新设计及各自相对A，不能用旧C/D的跨轮绝对时间补成四版结论。

## 一次读怎样走

1. 最终编译完扫描读点，给每处独立记录；将5字节普通读的atom操作数转换成同长的site index，分支偏移不变。atom引用转移到记录。
2. 解释器通过b->read_ic_sites[index]取记录。检查object tag、普通class、非exotic；M直接比shape，P先recent再至多其余3个。
3. 命中从**当前对象**prop[offset]读取当前值并JS_DupValue，不缓存值。get_field释放receiver并覆盖栈顶，get_field2保留receiver、推入方法值。
4. miss仍是上游正常自身/原型散列循环与JS_GetPropertyInternal。只有合格ordinary-own-data/hashed-shape更新缓存；继承、getter、Proxy等不缓存。
5. 强shape引用使结构/描述符修改按上游共享shape的COW规则换shape；新值赋给同offset仍读取新值。函数销毁释放atom、各slot shape和site数组，GC遍历每条shape边。

M/P准入、读取、更新时机、引用/异常/receiver和集成内联要求匹配，P特有recent/victim/额外搜索，M无这些字段。
P按预先固定recent-first和满槽轮转，不根据pilot调策略。比较包括真实探测、维护和空间，不是“纯容量”自变量。
写opcode源虽相同，新增代码可改变机器码布局；控制case出现差异时不能称读IC直接收益。
这里的源相同按LF规范化文本比较：归档A保留前轮CRLF原字节，生成M/P的quickjs.c使用LF；两种哈希均保留，未把换行差异冒充逻辑差异或修改旧哈希。

## 序列化和回收

JS_WriteFunctionBytecode只在输出副本还原普通读opcode/atom；不写运行期指针。加载时atom fixup后重建空记录。
P/M对ROM嵌入复制字节码到可写b缓冲，牺牲同样的ROM零拷贝；A不改。Octane source模式不依赖该路径。
实际测试覆盖已使用记录的保存/加载/执行、qjsc嵌入、OOM预算192、1800函数原型循环GC；M/P各有独立ASan/UBSan。
不是完整test262，也没有穷尽一切OOM位置或host平台。

## 诊断口径和身份

- queries包括第一次冷查询，因为所有读点在定型时被重写。queries=hits+fallback，M槽≤1、P≤4。
- comparisons是query阶段实际shape比较；update_comparisons另计更新扫描。miss原因按正常结果路径互斥分类，不把一次JS读与内部hash探查混为一个计数。
- M没有更新扫描，但rdi_update入口仍有一次同shape判等；原计数器没有单独插这条。报告把其逻辑次数按updates列为明确的source-derived字段，不能把M的update_comparisons=0说成没有更新比较，也不把逻辑数称native cmp实测。
- sites_created是最终读点记录总数；sites_used是queries>0记录数，函数头另计；不是只有命中才“使用”。
- requested_direct_bytes是site数组实际请求+每函数新增16字节组件的累计逻辑请求；peak_live_direct_bytes为这些组件峰值同时存活。不含分配器元数据、诊断记录器和诊断额外b指针。
- shape_ref_increments/decrements是缓存持有边的获取/释放，shape_refs_peak为同时非空slot边数；不含dup-before-free瞬时局部引用，不等于不同shape数量或间接对象图字节。
- lifetime_max_slots分布是每site一生最多填几槽，不是某时刻占用快照。释放后live bytes/functions/shape refs必须为0。
- 原始报告保留instance_id（进程内）、最终offset、原opcode、全函数原始最终码的atom归零版、全atom-PC映射、函数名/文件名与源字节。
  离线用源SHA256与规范码+atom映射SHA256核对；不同进程的instance_id不能直接对应。相同源码反复compile可能canonical身份相同，仍是不同缓存实例；盲目跨进程一一配对为UNKNOWN。
- 报告保留的是变换前最终opcode/atom含义，不是把编译器中间码当执行序列。运行时新opcode只是等长site索引替代。
- 详细诊断覆盖全进程，包括Setup、校验和退出；CodeLoad诊断N上限8，不能将其总量冒充正式N的总量。

## 可确认与仍待确认

布局、机器码存在直接guard、无out-of-line probe，以及目标小探针的实际命中/回退均有独立证据。
正式时间不带计数；诊断计数不等于正式逐次分支轨迹。高命中不保证净收益，text/代码布局、循环支撑、引用、GC和内存交互仍可能影响。
这轮不测单条指令self-time，不由两个中位数相减推初始化或miss成本，不自动加自适应升级。
