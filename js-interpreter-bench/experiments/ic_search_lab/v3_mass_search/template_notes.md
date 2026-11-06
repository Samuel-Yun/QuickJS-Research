# 已实现模板与尚未解决的问题

本轮14个代表的源码、patch、compiler命令和制品SHA均在identities/、patches/。source恢复见recover.py；A、M、s001沿用冻结binary。所有候选均为探索配置，不将参数行计作新算法。

## 路径与语义

P/L/Q的命中仍检查对象类型、普通class、非exotic和精确shape，再从当前prop数组读取当前值。多槽用真正的取模处理非二次幂；填槽先完整查重、优先空槽，再按RR/LRU时间戳/CLOCK替换。LRU计数器溢出时重置年龄，非无限精度LRU。新增shape先保活并发布，再释放旧shape。这个发布顺序与冻结M存在差异，属于需要披露的安全适配。

当前Q模板在普通对象的probe内维护策略，冷却/退出阶段跳过probe与填充，但保留RDI操作码及其记录定位。数组、primitive等在class检查前已回退的访问没有进入该策略计数。它的覆盖范围与旧R恢复普通操作码的设计不同，不能用这些配置否定全部退出/准入方案。

T先查本地单槽，失配后查函数级有界(shape,atom)集合。共享命中不自动提升本地槽；admission=2先保留待确认记录，再在重复更新中变为ready。共享表持有shape强引用，GC标记和释放一起适配；atom由同函数site持有。没有runtime级实现。

H保存预测下标，不保存JS值或prop地址。每次核对当前shape为hashed、范围有效、atom非空且相同、descriptor为普通数据，并限制普通非exotic对象。quickjs.c的js_shape_prepare_update在删除前使shape不再hashed，避免unlink→free_property→clear atom窗口。全局/原型/getter等未合格情况仍走原语义。function_atom共享的是hint使用位置，各site仍保留自己的结构存储，没有证明总元数据缩小。

F016动态观察真实get_field_rdi后的drop，执行同样的取值和释放后跳过一次dispatch。原drop字节码保留，跳转直接进入它仍有效；并未新增一个伪造的融合opcode。其他四类融合未完成证明，保持UNSUPPORTED。

S只对无删除、hashed、属性数不超过阈值的普通对象作有界扫描。all_own_descriptors只返回描述符，原调用者继续执行getter/autoinit等语义；own_data看到不支持描述符则回原hash查找。实际代表S005是A底座、阈值3、正向、own_data，其他参数行尚未构建。

## 实际非计时检查

- P012（三槽、MRU、CLOCK）在1/2/3个不同shape下占用1/2/3槽；4/8/17个shape下占用仍为3，形状区别由内部指针核对。这里是占用与正确性，不是查找耗时。
- P012、H014、S005通过删除时native finalizer重入读取。原始stdout在mechanism_checks.json及runs.jsonl。
- L006真实建立offset=66000的自身字段，shape为hashed，32次读取及换值后正确，窄下标缓存占用为0，确认走范围外回退。见wide_offset_check.json。
- 每个代表复用7020条断言，另有9013条针对性断言，并执行GC/OOM、保存加载和qjsc检查。未跑完整test262或最终ASan/UBSan门禁。

## 静态空间和混杂因素

layout_sizes.csv来自实际冻结ELF的DWARF，不执行VM。M/s001的ReadICSite为16B；通用AoS单槽模板会变为24B。因此F016、H014、T等不仅包含名义策略，还包含这个模板布局成本，不能把它们的时间差归为单独的融合或hint成本。P012每site64B，L006为32B，Q代表48B；H014还令JSShape从56B变为72B。

PC相对模板继续保留对齐字节码副本。T增加共享表和shape保活，Q增加每site状态，Hfunction_atom增加owner指针。上述sizeof不是RSS，间接保活、总内存和首次准备净成本仍为UNKNOWN。

冻结基线本轮前后漂移过大，尚未取得可用的完整套件排名。后续恢复时应包含通用单槽模板控制，先把模板打包差异与各机制区别开来；不能因某个短测点更小就归因于少了一次查找。
