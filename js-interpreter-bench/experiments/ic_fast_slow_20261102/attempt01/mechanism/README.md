# 缓存结果采用比例（独立机制实验）

三案例沿用旧 M1.own_integer、M2.own_reference、M4.numeric_control 的完整目标函数与输入。M2 此处是普通对象引用的读取与身份比较，不调用所读引用；不把它说成函数调用。函数值替换/不调用函数值另在语义回归覆盖，不将旧函数调用时间混入本表。

A、原 M 和同一个 C 制品的 100/75/50/25/0% 七条件；五档只在 native 初始化读取 quota。先运行一次同一 microRun（4096 次目标访问）并验证，C 要求唯一选中 site 已填入 shape；准备期间统一直接采用可命中结果。随后 reset 周期/计数，再计 N 次完整 microRun；每个条件准备规则一致。数值目标没有字段读，采用比例为 N/A。

控制器在原有 OBJECT/class/exotic/shape 守卫成功之后，对唯一目标 site 用 period4 的同一递增/掩码/比较结构选择 offset 读取或普通查找。强制查找保留真实 hash/bucket/chain，不再 update/保活/释放缓存；真正 shape mismatch 沿原路径维护。source SHA、真实 PC、atom、唯一 compiled instance 的实际匹配证据在 target_sites_all.json、diagnostic_counts.csv。

控制构建有真实额外分支与全局状态工作，100% 不等于原 M；七条件共同新采数据，报告桥接及数值控制。独立 C_diag 的目标区域计数不参与性能时间；不会用总时间差/读取次数冒充精确 hash self-time。全量 scope 和冻结顺序见 protocol.json/frozen.json；每条件 30 新进程，位置出现4或5次。
