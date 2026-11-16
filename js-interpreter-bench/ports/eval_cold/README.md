**EVAL_COLD完整实现与移植**

当前最佳探索候选是s001普通读IC + P1 + B2 + PREP2 + READ_STORE + EVAL_COLD。已有Ubuntu五进程中位数中，含zlib的17项/14suite整体相对A耗时-5.70%，相对READ_STORE-0.78%。这不是仅修改eval的一项收益，也没有在本次导出时重新跑Octane；旧对照跨批次，最终仍待同批多轮确认。

本目录的完整补丁从原版A开始。实验目录attempt11/patches/EVAL_COLD.patch仅相对READ_STORE，不能单独应用到原版QuickJS后就得到完整方案。

**实现逻辑**

1. s001为最终字节码的每个get_field/get_field2建立单态读点。记录保存receiver shape、字段槽下标和atom；首次失配仍走原查找，普通数据属性查到后填记录。再次遇到同shape便直接读取当前对象的prop[offset]。缓存的是位置，不是属性值，所以更新属性值后仍取到新值。getter、Proxy、特殊对象、缺失属性等按实现中的条件回退。

2. P1增加holder_shape，用于get_field2保留receiver的属性读取。若属性来自直接原型且两边都是合格普通对象，则缓存receiver shape和直接原型shape。下次双守卫命中后读取原型当前槽值，保留原receiver作为this；没有缓存函数返回值或内联方法体，也没有覆盖任意深度原型链。

3. B2识别get_arg0/get_loc0后紧邻get_field的模式。准备时只等长改写前面的加载opcode；命中时直接从仍由参数/局部槽持有的receiver借用读取字段，省去一次receiver入栈Dup/Free及一次分发，仍对返回字段值执行必要的Dup。失配则恢复普通入栈并继续原读指令。第二条指令保持独立合法入口，跳转不需要重定位。

4. PREP2把原三遍准备降为两遍：第一遍数读点，分配复制的字节码与记录；第二遍同时改写读指令、标记B2。这里的单块code+records布局来自已有底座，不是PREP2新增加的变化。运行期指令以32位PC相对位移直接定位记录。

5. READ_STORE在准备中遇到与前置读点同atom的put_field时，让它复用该读记录。写时重新验证当前receiver是普通对象、shape命中、记录对应own属性、描述符允许直接写；否则走原JS_SetPropertyInternal。读不一定紧邻写，也不依赖前置读支配当前路径；执行时守卫是正确性的必要条件。直接写使用set_value先发布新值再释放旧值，保留native finalizer重入可观察的顺序。

6. EVAL_COLD决定何时做上述准备。js_create_function中，在释放fd前遍历其仍存活的JSFunctionDef祖先；direct/indirect eval来源的普通函数及后代延迟准备，包含Function构造器。静态脚本、module、加载字节码与generator/async仍提前准备。它不按benchmark、文件名、函数名或热度阈值分类。

冷普通函数在js_closure2末尾使用新增的内部JS_CLASS_COLD_BYTECODE_FUNCTION，拥有与原函数相同的mark/finalizer/prototype。首次调用由已有class-call分派进入js_cold_entry_call，检查栈、按需rdi_prepare，切回普通bytecode class，再按原flags/this/new.target/argv所有权进入原调用或构造逻辑。共享b只准备一次；其他冷闭包第一次调用时只需切类别。后续新闭包若b已ready则直接是普通类别。热JS_CallInternal主体与READ_STORE源码相同，没有每次调用增加ready检查。

准备的可选分配失败时保留普通执行图像、原异常状态，ready置位后不重试。没有声称全面OOM兼容。冷类别本身不执行JIT，也不生成机器码。

**需要一起移植的文件与位置**

|文件|职责|
|---|---|
|quickjs.c|函数字节码IC字段；读/融合/共享写handler；编译结束及加载时准备；冷函数class注册、closure、call、constructor、realm、识别和内存核算；GC mark/free；保存加载归一化|
|quickjs-opcode.h|末尾追加5个运行期opcode，保留此前编号|
|read_ic_types.h|ReadICSite与诊断宏定义|
|read_ic_config.h|固定RDI_CAPACITY=1；此完整组合未验证其他capacity|
|read_ic_prepare.inc|两遍准备、代码/记录分配、等长改写、共享读点、可选OOM回退|
|read_ic_runtime.inc|缓存查询/更新；shape强引用、原型holder引用及记录释放|
|read_ic_opcodes.inc|普通/直接原型读命中和原查找回退|

GC、引用计数和保存加载不可省略。替换缓存时先引用新shape并发布，再释放旧shape；函数mark必须遍历两个shape，释放时处理shape、atom和单块执行图像。写字节码时只修改副本，把内部opcode/PC位移还原为普通opcode/atom；读字节码时拥有可写图像并提前准备，不能序列化本进程指针。当前x86_64默认构建记录24B、完整函数头144B；相对READ_STORE未增长，不代表相对原版A没有内存成本。额外保留shape/prototype也可能增加间接内存保活。

**对一份现有QuickJS源码应用**

适用原版：Bellard QuickJS 2026-06-04，commit `04be246001599f5995fa2f2d8c91a0f198d3f34c`。VERSION相同不够，脚本还校验已知C/H/JS源码内容，忽略CRLF/LF差异；生成的repl.c不作为源码锚点。其他commit、QuickJS-NG或有自定义改动的源码，需要按上面位置适配，不能强行套用。

在本项目根目录执行（把source换成你的源码目录；output必须尚不存在且位于source外）：

```bash
python3 -B js-interpreter-bench/ports/eval_cold/apply.py \
  --source /path/to/quickjs --check

python3 -B js-interpreter-bench/ports/eval_cold/apply.py \
  --source /path/to/quickjs --output /tmp/quickjs-eval-cold

make -C /tmp/quickjs-eval-cold -j2 qjs qjsc

/tmp/quickjs-eval-cold/qjs --std \
  js-interpreter-bench/ports/eval_cold/targeted.js
```

脚本需要Python3.9+和GNU patch。它先验证输入及补丁SHA，再复制到新目录，在副本中应用零fuzz完整补丁并核对最终源码；输入目录不修改。保留调用者Makefile，不自动增加LTO/PGO或其他构建调优。只在缺失时补compat/test-closefrom.c以支持原Makefile探测。已生成的旧可执行文件/.obj不会复制，qjs/qjsc及嵌入应用都应重新编译。

如果只需拿到本次实验的确切源码，可把`quickjs-eval-cold-source.tar.gz`解压到一个新的空目录，然后在其中的quickjs-eval-cold目录运行`make -j2 qjs qjsc`。这个包包含32个与冻结EVAL_COLD逐字节一致的引擎文件及一个Makefile探测支持文件，没有对象文件和可执行文件。

`build_bundle.py`在本项目中可重新生成补丁、源码包、manifest和语义检查。`A_to_EVAL_COLD.patch`是678行完整差异；前述两个原文件改动加5个新增IC文件。manifest保存归档、补丁、原版归一化源码和候选源码的SHA。

**实验边界**

候选已经通过专项JS、native保存加载/GC/reentrant store、ASan/UBSan和17条N1负载正确性；没有完整test262，LSan在现有环境关闭。本目录移植结果另做构建及目标语义检查，不把这些检查当作新的性能成绩。

新增内部class使JS_GetClassID可观察首次调用前后类别变化，并增加每context一个prototype槽。嵌入方若依赖原始class ID或内部结构，需要单独适配验证；不宣称完全C API/ABI等效。未来版本移植还须核对opcode空间、函数布局、GC边、原型失效、构造调用参数所有权和保存加载格式。完整实现不是只复制一个rdi_prepare函数。
