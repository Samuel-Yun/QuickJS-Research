# 四个实际设计，不是四套容量参数

全部从固定 M 独立出发，没有把失败修改累计到下一个版本。源/制品身份在 `sNNN.matched.json`，确切修改在 `patches/sNNN.patch`，公开材料原许可随 seed 保留。备选与重复排除见 `ideas.md`；本轮没有读取私有 JWST。

| 版本 | 主要改变 | 修改文件（相对 M） | 主要新成本 |
|---|---|---|---|
| s001 | bytecode 操作数改为 PC→site 正相对距离；运行代码副本与记录同块 | quickjs.c、read_ic_prepare.inc、read_ic_opcodes.inc、read_ic_runtime.inc | 多一份字节码存储/复制，输出恢复和释放顺序需配合 |
| s002 | 从逐 site 的 shape 记录，改成函数内所有 atom/site 竞争的8项直接映射表；site 只保留 atom | quickjs.c、read_ic_types.h、read_ic_prepare.inc、read_ic_opcodes.inc、read_ic_runtime.inc | hash、冲突、shape 替换，函数头+8字节；小函数固定表可能更贵 |
| s003 | 编译/加载时不准备 IC；整个函数第一次进入时才扫描、分配和重写 | quickjs.c（编译、加载、调用入口三处联动） | 每次函数进入的 ready 检查；首次准备进入执行计时 |
| s004 | 当前 JSShape 记上次成功描述符下标，普通查找先核对 hint | quickjs.c（shape 结构、建立、查找、删除） | shape 头实测56→64字节，失败 hint 检查、成功更新及删除失效 |

## s002 的缓存单位与生命周期

不是旧 NG 的“每函数+atom各一个四槽 PIC”，也不是 M 的 site 数组换名字：本实现把一个函数内所有 atom 和访问位置放进同一个8-entry总预算。先按 shape+atom 定位表项，再精确检查二者；从当前对象属性数组取当前值。miss 仍走原查找，合格才更新，碰撞不会让错误 shape/atom 命中。

site 的冷 atom 数组仍随访问位置线性增长，所以不是“总元数据常数”。请求大小为 `align8(4*Nsites)+128`，另外函数头加8字节；只有热 shape/offset 表有固定上界。DWARF 确认 site 元素16→4、函数头144→152，但不能把元素缩小叫总内存节省75%。

替换先保活新 shape、发布新表项，再释放旧 shape，防释放重入看到过期记录；GC/销毁遍历表项，atom 仍由每site拥有。已执行字节码的写出、copy/ROM加载、OOM、GC 和 qjsc 均有针对性检查。未入围，因此没有把表冲突假说包装成实测的 Octane miss 计数。

## s003 与旧 E/c008 的区别

旧 c008 是按字节码长度排除函数，不是运行期延迟。旧 E 仍 eager 建立按site的 atom/PC 记录，再按执行预算分配 vector。s003 对从未进入的函数不建立整份 site 数组，在第一次 `JS_CallInternal` 进入时完成一次准备；不是改旧阈值、不是8次预算，也没有添加 E 的原型/写入覆盖。

首次调用属于计时区间，故该设计是在改变准备成本发生的位置和可能避免未调用函数的准备，不能把它说成已经排除 frontend。OOM 时保留普通可释放字节码；第一进入和 ROM 加载/低内存恢复检查见 `s003.extra.json`。低预算异常可能来自周围 JS 分配，不声称已定位某个元数据 allocation。

## 为什么只实现四个

四个已覆盖寻址/所有权、缓存共享组织、准备生命周期和普通查找后端四种实质机制，满足本轮4～6目标。其余备选不是为了凑足6个就实施：字节码融合尚未验证跳转可否落到第二条指令；弱 shape 尚缺销毁/复用的完整安全通知；其余 prototype/store、旧 K32/容量/inline 变化已经做过。初筛完成后冻结两项入围，不再添加参数变体追逐正结果。
