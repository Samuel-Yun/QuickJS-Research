# STORE_TRANSITION_IC

底座是 `on_demand_ctor_cache/modified/` 的冻结 SPARSE_CTOR_IC（06aada4）。所有候选源码在本目录 work 中独立构建，冻结源码不改。不继承其它候选，不改 JS 基准、输入、N，不引入 JIT，不 push。

设计参考 V8 [`StoreHandler::StoreTransition` / src/ic/handler-configuration.cc](https://chromium.googlesource.com/v8/v8/+/f4fc9e05f6931668879d7f0a90fe4dcf564f2d59/src/ic/handler-configuration.cc)，实际阅读的固定提交为 `f4fc9e05f6931668879d7f0a90fe4dcf564f2d59`，文件 blob 为 `e5ce9e73ae68657918d4c91ef03d744fcc8210d1`。借鉴“记录目标布局并验证原型条件”的设计思路，没有移植 V8 代码。V8 的 Map、弱 transition handler 和 validity cell 没有照搬；下面的 QuickJS 指令、引用交接、局部 shape 守卫和生命周期处理均为本实验新写。

## 怎样学习

`JS_SetPropertyInternal` 保留原导出接口，内部新增可传 observation 的实现。只有本指令的普通慢路传入 observation；普通 API 调用仍传 NULL。`add_property` 也保留原接口，由内部 observed 实现接收本次 observation。没有 runtime 全局观察指针，嵌套调用各用自己的 C 栈记录。

原路径真正选中“复用已有 to_shape”的分支后，才调用 `st_capture`。同容量、from/to 已哈希、无删除、旧字段逐项 atom/flags 一致、只追加目标 C_W_E 数据字段、普通可扩展对象、非数字下标等条件都成立后，再查短原型链。只接受最多 4 层的普通非 exotic、已哈希原型。最近的同名描述符必须是可写普通数据字段；没有同名属性也可。为简化第一版，还验证并记录后续链及 null 终点。

从原路径已决定复用目标 shape 的这一刻，才增加 from/to/原型层 shape 的引用，原新增写完本次值后才发布到静态位点。没有在原属性查找或分配之前强持有旧 shape，所以不会把本来的就地扩展强迫改成克隆。

setter、已有属性、失败、需要扩容，以及现造新布局都不学习。缓存更新先发布完整新记录，再释放旧记录；放弃的观察记录也释放引用。

## 怎样命中

原 `put_field_shared` 保留。其它普通 `put_field` 准备为同长的 `put_field_sti`：1 字节 opcode + 4 字节位点索引，共 5 字节，跳转/异常/调试位置不变。

先检查普通对象、非 exotic、可扩展、当前 shape == from、槽在容量内，再逐层对照实际原型链和记录 shape、链终点。成功后给 to_shape 加引用，换 shape，将已经求好的 RHS 转交给新增槽，最后释放旧 shape。换布局和值写入之间没有分配、释放或回调。对象和值按原 handler 的栈所有权消费。

命中不进入普通按名查找、`JS_SetPropertyInternal` 的原型查找、`add_property`、全局 32 项转换缓存或全局 shape 搜索；原 32 项缓存本身不改。失配只执行原赋值语义一次。

## 保留整函数构造缓存

冻结的 `plan_recipe` 只认普通 `put_field`。准备时先用原解析器检查函数；符合原构造模板的函数保留原字节码，不加本轮指令。这样不改 `four_runtime.inc`、`sparse_runtime.inc` 或构造资格；新写入 IC 补足 `this.x = x + 1` 等原模板不支持的函数。不能用构造命中消失后的额外字段写入来冒充本 IC 的覆盖。

首次开发诊断发现了这一表示兼容问题，修正前的构建/计数只留在 development_* 和最初的 phase 目录，不进入最终性能表。正式结果使用最终 manifest 指向的构建。

## 引用、GC、序列化和内存

每个改写的静态写点一个 64 B StoreSite：from/to 两个 shape 指针、最多 4 层原型 shape 指针、atom、offset、PC、深度。atom 的原字节码引用转交给记录，没有再 Dup 一份。所有 shape 引用在 function GC 标记和释放时逐一处理，计划替换也释放旧引用；函数原有 FourSite/FullPlan 不改。

JSFunctionBytecode 增加 store_sites 和 store_count（实测大小见 fixture）；runtime、JSObject、JSShape、ReadICSite 不增大。不带读/构造准备镜像的函数另复制一份字节码，避免改 ROM/原始代码；诊断单列请求的记录字节、峰值、释放字节和这类复制的字节数。分配失败保留普通 put_field 和原 atom 所有权。

已哈希且被持有的 shape 不能按原唯一引用路径原地改描述符：`js_shape_prepare_update` 克隆；新增属性也走共享 shape 的克隆/复用路径。删除、flags/getter/只读、AUTOINIT、换原型都经这些入口。普通对象筛选排除了全局对象的特殊 flags 直接写入。原型普通字段值可以原地改变，但赋值资格只依赖描述符而不依赖那个值。守卫还验证实际链的对象条件及终点，不仅比较构造函数或某个 proto 指针。

保存时把运行期 store opcode 恢复成普通 put_field 和 atom。加载器拒绝序列化流中的运行期 store opcode。按需准备在原 rdi_prepare 后执行，ROM 保存/加载单独验证。

## 运行

仓库根目录：

```bash
TASK=js-interpreter-bench/experiments/store_transition_ic_20261124/attempt01
python3 "$TASK/build.py"
python3 "$TASK/build.py" --labels STORE_TRANSITION_IC --modes sanitize
python3 "$TASK/run.py" baseline_counts
python3 "$TASK/run.py" micro_counts
python3 "$TASK/run.py" target_counts
python3 "$TASK/validate.py"
python3 "$TASK/run.py" pilot
python3 "$TASK/run.py" micro_time
python3 "$TASK/run.py" target_time
python3 "$TASK/report.py"
```

不要在已有正式 phase 文件上重跑；复现应复制脚本到新的 attempt 目录（HERE 自动变化），以新编译的独立源码建立记录，不覆盖旧数据。

正式计时：CPU 2、Asia/Shanghai、C locale；未插桩 Release，同批轮换原 SPARSE/候选，每项各 5 个新进程，首次运行计入，没有额外热身。微基准 N 由短测固定，输入相同，测完整循环。真实负载沿用 native_confirmation_20261108/attempt02 的原脚本和固定 N，load/Setup 排除，取原完整 Run 的 ms/Run。

诊断跑完整脚本（含 Setup/校验），不把它的时间列作正式耗时。原 put_field/put_field_shared 分别计数，旧原型/转换缓存的成功不会记为新 IC 命中。每点计数包含函数名、PC、atom，可定位覆盖和拒绝来源。未插桩版不包含计数表、计数分支或输出。

如果两个真实项目没有本 IC 覆盖，或没有可复现收益，就停在定向阶段。微基准有效不自动触发全集，不调容量或资格条件救结果。

## 本轮结果

[完整报告](results.md)：微基准 plain −9.74%、plus_one −23.85%；RayTrace +3.69%、Tree −17.26%（5 轮中位数）。两个真实用例的新 IC 命中均为 0，Tree 诊断中旧构造命中增加，不能归为新写入快路收益。

用户要求追加的[同批单轮全集](full_confirmation01/results.md)：Octane +3.25%、SunSpider +2.62%。冻结源码与默认版未改，未 push。
