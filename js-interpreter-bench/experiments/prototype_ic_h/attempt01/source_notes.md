# H 实现与已确认的路径

## 准入：本次才补齐的事实

`analysis/admission_sites.csv` 与 `admission_combinations.csv` 来自独立 M
观察版。按真实编译实例、函数源码 SHA256 和最终 opcode 起点匹配：

|原 Richards 位置|PC|N1 读取|直接一层/完全合格|M 普通 own 探查|
|---|---:|---:|---:|---:|
|Scheduler.schedule → isHeldOrSuspended|30|10671|10671|21342|
|Scheduler.schedule → run|83|6573|6573|13146|
|TaskControlBlock.run → task.run|73|6573|6573|13146|

三处组合均为 mask63：receiver/holder 普通 non-exotic OBJECT、直接一层、
普通 data、两边 hashed。互斥首个排除原因均零。分母是各位置成功普通
查找数，也恰好等于其读取数；不是所有 VM 读取的比例。N2 各项翻倍。
原型小例子 methodLoop PC13 的 N1/N2 为4096/8192，全合格。

观察版本没有新增 shape/holder 保活，也没有改 hashed 状态。PC 在
handler 入口直接取 `pc-1`，此时 operand 尚未消费；不是用可能已经
越过操作数的 sf->cur_pc 反推当前指令。before 字节是最终 prepare 后
真实执行的 *_rdi/site_index；完整映射在 analysis/bytecode/ 和 gzip。
观察 helper 只读标量，原查找仍按原顺序执行。

## 最小状态与一次命中

正式差异仅四文件，见 patches/M_to_H.patch 和 H_manifest.json：

1. `implementation/read_ic_types.h`：增加 holder_shape。NULL 是原 own
   槽，非 NULL 是受限继承槽；shape、offset、atom 的原单位不变。
2. `read_ic_opcodes.inc::GET_READ_IC`：receiver 仍需对象 tag、普通 class、
   non-exotic；原 rdi_probe 比较 receiver shape。继承槽随后取得当前
   `receiver->shape->proto`，检查 holder class/exotic/shape，读取当前
   `holder->prop[offset].u.value` 并 JS_DupValue。并未保存旧方法或 prop
   数组地址。own 槽仍读 receiver 当前 prop，多了承担新字段和分支。
3. miss 完整保留原查找。只在成功普通 data 且正好直接 prototype、
   两边 hashed 时填充继承槽；其他情况保留原 helper/异常语义。
4. `get_field` 仍释放临时 receiver 后替换栈顶；`get_field2` 保留原
   receiver，再 push owned value。方法和 tail_call_method 没有修改；
   this 是 receiver，不是 holder。

实际存在 inherited hit 及原 own hit，见 mechanism_sites.csv。正式版本
没有这些计数。此处的加载、tag 检查、shape 比较、值/引用处理和循环
支撑都有成本；计数不能分解成各自耗时。

## 修改与所有权

`read_ic_runtime.inc::rdi_update` 比较 receiver shape 与 holder_shape 的
完整条目。相同 receiver 而 holder shape 改变也会替换；own/继承转换
会设置/清理 holder_shape。新引用先取得，再释放旧引用，避免别名导致
悬空；每条持有边独立计数、mark、free，不做指针去重。

固定底座 04be246… 的 `js_clone_shape`（A quickjs.c:5268–5291）会
Dup prototype 对象和 atom；`js_free_shape0`（5300–5317）释放它们，
shape GC mark（6662–6668）也访问 prototype。因此 receiver shape 已有
到直接 holder 的强边，不另外缓存 holder JSValue。新增 holder_shape
仍是独立边，bytecode GC 遍历新增两行 mark，销毁/替换分别 free。

固定底座 `js_shape_prepare_update`（10302–10326）只对 hashed shape
按引用数 clone/COW；缓存强持有合格 shape 后，已审阅的普通 add/delete、
descriptor 与 SetPrototype 入口改变当前 shape，旧守卫拒绝。未 hashed
shape 不承诺同样行为，所以明确拒绝填充，不能靠多保活来补保护。
仅 data 值/函数值更新可不改 shape，但 H 每次读当前槽，因此不使用
旧结果。对特殊 descriptor/多层/Proxy 等不扩大支持。

回归证明包括：修改前确有 inherited hit；holder 变成合法 unhashed
状态后 holder guard miss 且不填；receiver unhashed 也不填；own/继承
切换；hot bytecode 正常/ROM 重载为空并实际重新填充。见 internal_gate。
序列化和 prepare 沿用 M，不输出 runtime shape/offset。通过 H 导出的
热表示也由 A/M/H 实际执行，且 H qjsc embedding 通过。

## 真实机制与代价，不是性能结论

Richards N1 的 H：前两目标各仅一次 miss，两次普通探查，随后分别
10670/6572 次继承命中。TCB.run PC73 的6573次查询中3023命中、3550
回退，对应7100次普通探查。四 task 单槽仍有替换，不是四槽 PIC。
H 同时覆盖其他合格读点，不只这三个；不能将整体时间差归给一处。

实测 sizeof：M16B/site、H24B/site，own-only site 也承担+8B。Richards
全诊断进程创建311个site，数组请求4976→7464B；这是缓存数组，不是
整个 VM/RSS。N1 shape 边 retain/release 为 M106/106、H7274/7274；
N2 H14374/14374，说明替换也带来维护频率。峰值/最终字节见 cache_memory。
最终数组活跃字节为0；间接保活实际峰值字节与RSS本轮 UNKNOWN。

## 回归覆盖的边界

correctness/inherited_guard_coverage.csv 单列“填充且命中”“填充但无命中”
和“始终回退”。四种交替 receiver 的同一单槽可以每次替换，不能要求
至少命中一次；两层原型则明确不填充。计数与源中初始两次读取结合，
内部 C 又直接检查变更前命中，避免只通过语义却没测到新路径。

ASan/UBSan、有限 GC/异常/重入/OOM/序列化是针对 H 的实际结果，不是
完整 test262。旧测试首轮错误/诊断汇总错误均保留并说明，没有用错误
版本产生正式性能结论。布局与编译器决策仍会影响 A/M/H 时间，不能
把新总时间差叫单次 miss、lookup 或 shape 引用的精确成本。
