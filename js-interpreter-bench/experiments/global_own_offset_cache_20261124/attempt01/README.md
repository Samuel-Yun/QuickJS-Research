# GLOBAL_OWN_OFFSET_CACHE

独立底座：`on_demand_ctor_cache/modified/` 的冻结 SPARSE_CTOR_IC（06aada4）。不改冻结目录，不叠加其它读 IC 或构造 IC 实验。

设计参考 V8 [`src/ic/stub-cache.h`](https://chromium.googlesource.com/v8/v8/+/aa8cf1f0c2c182ad3bee43a3c90f4567a1aa8b42/src/ic/stub-cache.h)，固定提交 **aa8cf1f0c2c182ad3bee43a3c90f4567a1aa8b42**，该文件 Git blob 为 `41f2f6ca68ed8afd213ce76c7a4aa8dea2f4654f`。
只借鉴跨访问点共享属性访问缓存的思路。V8 参考文件记录 handler；本实验记录普通自有数据字段的槽号。
1024 项直接映射、指针/atom 哈希、弱 shape 反向链表和 QuickJS 失效入口均为本轮新写的实现，没有复制 V8 实现代码，也不将参考提交当作本地 d8 的构建提交。

## 读路径

1. 原单槽命中（包括 v6 融合命中）：原样读取，不看共享表。
2. 已填充自有记录失配，当前接收者是普通非 exotic 对象、shape 已哈希：只选一个桶，同时比较完整 shape 指针和 atom。
3. 二级命中：按该表项的 offset 读当前对象的当前值，DupValue，走原收尾；不更新一级。
4. 二级未命中或不适用：原按名查找。符合原填槽条件的 own data 字段先登记共享表，再调用原 rdi_update。冷读不探表，但会登记。

登记必须在 rdi_update 前完成：后者释放旧 shape 引用，可能进入原生 finalizer。登记本身不分配、不释放 JS 值、不调用 JS；rdi_update 后不再使用旧 descriptor、prop 指针或 shape。重入测试会在回调中递归更新一级记录并使当前 prop[] 搬移，验证返回值和后续读取。

## 弱引用和多记录清理

每个 runtime 内嵌 1024 项，一项 24 B，共 **24,576 B**；runtime 从 2,216 B 到 26,792 B。
表项包含 shape、atom、offset，以及两个 uint16_t 的反向链索引。shape 的 uint16_t 链头放在原有对齐空隙，offsetof=18；sizeof(JSShape) 仍为 56 B，原 hash 偏移仍为 20，属性描述符起点仍为 56。禁用标志占用 runtime 原尾部空隙。
这些值有 C sizeof/offsetof 断言与运行结果验证。JSObject 仍为 64 B，ReadICSite 仍为 24 B。1024 容量由本轮任务固定，没有调参。

表不持有 shape 或 atom 引用。atom 借用 shape 描述符的持有：释放或改描述符之前先失效表项。
同一 shape 可以在多个桶中出现：head/prev/next 是 bucket+1 索引，0 表示结束。冲突替换先 O(1) 摘掉旧记录；失效沿该 shape 的链摘掉全部记录，不扫描 1024 项。
只有 runtime 退出时扫一次固定表，先禁用再清空，随后才释放已有的转换缓存根和对象，防止回调重新登记。

失效和初始化入口：

- `js_shape_hash_unlink`：覆盖已哈希布局的原地追加、取消哈希及释放。
- `js_free_shape0`：未哈希分支也清理，且都在释放 proto/atom 前完成。
- `resize_properties` / `compact_properties`：搬移旧 shape 前清理，新 shape 链头置 0。
- `js_new_shape_nohash`：新 shape 链头置 0。
- `js_clone_shape`：复制后重置新链头，旧 shape 的记录不转移。
- `js_closure_define_global_var`：直接改已有全局属性 flags 的分支额外清理。
- 描述符、getter、只读和原型链修改经原 `js_shape_prepare_update`：唯一已哈希布局先摘除；共享布局复制成新未哈希 shape，新链头为 0，旧布局保持有效。

内置数组/RegExp 模板直接造 shape 的路径在上下文初始化时运行；它们使用的 shape 工厂也初始化链头。已逐处核对全部 shape 分配、复制、释放、描述符和 proto 写入。

## 白盒证据

四组输入使用同一个 readX：同布局、两布局同槽、两布局异槽、四布局轮转。x 值分别为 3/5/7/9，错读 pad=99 会使校验失败。
独立诊断记录最终实际字节码、前几次真实 shape/属性槽、一级/二级计数和最终一级记录。正式计时没有插桩。

`weak_fixture.c` 只进入测试程序，不进入 benchmark qjs。它用实际哈希函数找出确定碰撞：不同 shape/相同 atom/不同 offset，以及同 shape/不同 atom/不同 offset；验证完整键比较。
还覆盖同 shape 两条记录、重复登记、删除、getter、只读、clone、resize、compact、free、循环 GC、runtime 清理和原生重入。没有为测试重写对象布局或强行哈希未哈希 shape。

## 计数口径

`logical_named` 包含解释器的 get_field_rdi/get_field2_rdi、融合读、普通 get_field/get_field2 和 get_length；不包含动态下标 get_array_el 或 C 内部属性 API 查找。
一次融合命中计一次逻辑读取；融合失配由后续 handler 计一次。
分别报告 `secondary_hits / secondary_probes` 和 `secondary_hits / logical_named`。生命周期计数是 runtime 总量，静态位点计数在 sites 中。
诊断完整跑原脚本，包含 Setup/校验；时间只取原计时区间。runtime 清理数另外列出，避免把退出清理算成循环内成本。

## 复现

若原版 A 尚未构建，先执行 `python3 js-interpreter-bench/on_demand_ctor_cache/tools/manage.py build A`。本次复用了已有 A Release，三版 ELF 的 GCC 版本字符串一致，A 在本批重新计时。

```bash
cd /home/wssy/workspace/QuickJS-Research
TASK=js-interpreter-bench/experiments/global_own_offset_cache_20261124/attempt01
python3 "$TASK/build.py"
python3 "$TASK/build.py" --labels GLOBAL_OWN_OFFSET_CACHE --modes sanitize
python3 "$TASK/validate.py"
python3 "$TASK/serialization.py"
python3 "$TASK/run.py" gate
python3 "$TASK/run.py" micro_counts
python3 "$TASK/run.py" pilot
python3 "$TASK/run.py" micro_time
python3 "$TASK/run.py" target_counts
python3 "$TASK/run.py" target_time
python3 "$TASK/run.py" decide
```

先通过弱表失效、重入和 ASan/UBSan，才允许正式计时。白盒三版 A/SPARSE/候选同批各 5 进程；统一 N，输入生成不计时。
A 本身没有这个 IC，只比较同输入耗时。原始每次命令、stdout/stderr 保留在各 phase 目录。

`decision.json` 有真实负载可复现的改善才追加：

```bash
python3 "$TASK/run.py" full_time
python3 "$TASK/run.py" full_counts
```

完整时间为两版每项各一进程，同批轮换；完整诊断只追加候选，每项一进程，计算两套及合计二级覆盖。
若二级命中不足全部逻辑命名读取 1%，停止容量/替换扩展。本轮无论比例如何都不再调容量或替换策略，只报告结果。

补充写入诊断、静态读点定位和报告生成：

```bash
python3 "$TASK/write_counts.py"
python3 "$TASK/map_sites.py"
python3 "$TASK/report.py"
```

写入诊断只添加计数，独立编译，不改 Release；其时间不用于性能比较。静态读点定位使用冻结基线的最终字节码查看构建，耗时也不进入时间表。

ASan/UBSan 开启；ptrace 环境关闭 LSan，保留 QuickJS FreeRuntime 断言。重跑请建立新 attempt 并复制脚本/测试文件，旧记录不覆盖。

新增优化文件：`global_own_offset.inc`；接入与生命周期改动：相对 SPARSE 的补丁。`global_own_diag.inc` 和快照钩子仅用于计数构建。构造 IC、原型读、融合入口、写属性 handler、字节码编码均保持冻结版。

## 后续完整基准

用户要求追加的同批单轮已完成：[完整逐项结果](full_confirmation01/results.md)，Octane **+1.40%**、SunSpider **+2.67%**（相对现场原 SPARSE，正数为耗时增加）。[原始数据、复现入口与旧报告说明](FOLLOWUPS.md)。
