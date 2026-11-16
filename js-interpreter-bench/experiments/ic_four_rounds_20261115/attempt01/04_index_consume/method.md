# 第 4 轮 INDEX_CONSUME_IC

本轮独立从冻结 C 派生，不含 3B、GROUP_LOAD、CALL_RECIPE 或 CONSTRUCTOR_PLAN。正式 Octane 17 / SunSpider 26 项各一个新进程，C 为跨批次旧单轮，A/EVAL_COLD/V8_ON 为旧 30 次中位数；不把微小差异判为稳定收益。Octane 为 14 suite 分层等权 GM，SunSpider 为 26 项等权 GM，负数代表时间下降。

## 实际覆盖与模板选择

原 C 语义的 probe 跑完整 43 项，在实际 get_array_el 的 PC 统计接收者 class、index/当前 element 类别和消费字节码，不执行额外 JS getter。原候选 `get_array_el;add_loc` 在全集中没有覆盖。按照任务允许的同类替换，改选 **get_array_el;add;put_loc0..3/put_loc8**，只做一种普通 dense Array + int32 累加到局部槽的模板。

这不是预设数组种类：原轨迹中 Gameboy 的 sum PC 13 有 1,310,736 次普通 Array/int 元素的该序列，math-cordic 的 cordicsincos PC 49 有 3,200,000 次 int 元素，bitops-nsieve-bits PC 29 有 640,000 次。大部分 Gameboy 其他读点与 zlib/Mandreel 为 TypedArray，仍回退；NavierStokes 和许多 math 读点是浮点，也不硬套 int32 模板。

随后另建 probe_selected，在原脚本/原 N 下只检查 Gameboy、math-cordic、bitops-nsieve-bits 的完整整数/所有权前提，分别确认可特化 1,310,736、3,200,000、384 次。没有把“元素为 int”直接当作“累加能走 int32 快路”。这三次是独立诊断，不是正式复测。

最终独立 counts 全集：Gameboy **1,310,735 命中 / 1,310,736 尝试**；math-cordic **3,199,999 / 25,600,000**；bitops-nsieve-bits **383 / 640,000**。所有选中模板的入口合计 **4,511,117 命中 / 36,700,864 尝试**，fills=3、fallbacks=32,189,747；其中实际检测到的 int32 加法溢出 128 次，其余多为字符串/浮点、其它 receiver 或当前局部值类别等，不能把所有回退都叫 overflow。完整逐项保留在下表。

## 执行路径、缓存与真正省掉的工作

真实字节码例子为 Gameboy sum PC 13：

```text
C:    ... 累加器值、数组、index 在栈上
      get_array_el
      add
      put_loc0
      ... 原后续字节码

候选: four_index     // 同一个真实 b+PC 的学习记录
      add            // 保留完整指令和原操作数，供回退/合法入口使用
      put_loc0

命中: 当前元素 + 原栈上的 int32 累加器 → 原局部槽
      pc 跳到原 put_loc 后；失配继续原 get_array_el/add/put_loc
```

只有准备扫描确认且同基本块、无内部跳转/catch 入口的点改写；其它 get_array_el 公共路径原样。一个记录绑定函数字节码 + PC，运行时学习接收者 class、整数类别和消费模板，并保存目标局部索引及结束 PC。每函数小旁表 move-to-front 按 PC 定位，不是全局函数名特判；同一函数不同 PC 有各自的学习记录。首次学习仍执行完整原序列。

命中读取**当前** p->u.array.u.values 与 count，要求普通 Array 的 fast_array、整数 index、有效边界、int32 元素和栈上累加器、当前目标局部槽也是 int，并用 int64 算和、仅不溢出 int32 才提交。缓存不持有数组、data 地址、长度或元素值。Array 的 own dense 元素不依赖 prototype 布局；有空洞/访问器、不支持形态、负/非整数/越界下标时都进入原公共读取，Proxy、TypedArray（包括 detach/resize）也完全走原规则。

额外要求 receiver ref_count>1：原读取会先释放数组栈值再做 add，最后一个引用可能触发 native finalizer；该情况必须保留原顺序。当前局部槽 int 守卫还保证直接写回不用跳过旧对象值的释放，捕获局部在 index 求值期间被改成其它类型也回退。计算用原已求值的栈上左操作数，而不是重新读局部值，保留 `s += a[mutateS()]` 的求值顺序。

每次命中真正少 **2 次 dispatch（add 和 put_loc）**，全计数累计 **9,022,234 次**；少了元素结果和加法结果两次中间栈写入，3 次独立 sp 更新合成一次。没有省堆分配：int32 本来就不是堆对象；也不声称省去原索引边界保护或本来就已存在的 dense Array 快路。新 PC 旁表、类别/所有权守卫仍有成本。

这是有动态学习状态的静态点 IC 加消费融合实验。没有另跑纯静态融合对照，故不能把整版变化定量归因于“缓存表自身”；可确定的执行路径节省是上述分派和中间值。

x86_64 Release 每个选中点 **16 字节**（PC/end、class、local、kind 和类别记录），无对象/shape 根保活；原 ReadICSite 仍 24 字节。函数头新增 pointer+uint32 字段，字段合计 12 字节，整体对齐由编译器决定。只为结构匹配的点分配记录，没有给全部数组读取增加新运行时前瞻。

## 最少验证与局部时间

C、Release、counts、ASAN/UBSAN 的 safety.js 输出逐字节相同。涵盖 dense 值更新、空洞和 prototype getter、own getter/抛出的同一异常、Proxy get 顺序、负下标/字符串/分数/越界、浮点/字符串/BigInt 及混用 TypeError、int32 溢出、负零、捕获局部在 index 计算期间改变、临时最后引用数组、TypedArray 越界、可 resize ArrayBuffer 缩小/增长及 transfer 后 detach。对应引擎支持这些 API，脚本实际运行了相关分支。

serialization.c 先预热真实执行镜像，再保存/普通加载/ROM 加载；四个构建均通过。只新增一个长度 1 的内部 opcode，存盘还原原 get_array_el，add/put_loc 及所有操作数从未被改写；外部流不接受内部 opcode。

最初的极短微基准在 `return s` 前被编译器折成 `set_loc`，没有进入本模板，计数门槛正确拒绝它。保留该失败于 qualification.fixture_initial；改用只负责驱动同一三指令模板的整数循环微基准，没有改模板或完整负载。最终 1,200 万次：C 128.70 ms，候选 119.43 ms（−7.21%），独立计数命中 11,999,999 次。主 safety 和 serialization 也通过安排后续语句避免同一 peephole，保证验证的是实际内部指令。

额外的 active_safety.json 证明定向语义例子里同时存在真实命中和回退；ASAN leak detection 关闭，未跑完整 test262。

## 最终耗时与结论

完整 43 项单轮数据、相对 C/A 的逐项变化和几何平均均如下。只有 Gameboy、math-cordic、bitops-nsieve-bits 有新命中；不能把其它项的跨批次改善当成本快路收益。所有大量浮点/字符串回退也计入结果，未为了出分扩大第二模板。

## 复现

相对 C 的 release.patch、实测 source.tar.gz 和各构建 manifest 均在本目录；解压源码后 `make -j2 -o repl.c qjs qjsc`。原仓库公共 build.py、qualify.py、sequence.py 和 analyze.py 保留流程，构建目录防覆盖、已有计时样本只跳过，不自动多跑。沿用 native_confirmation_20261108/attempt02 的脚本、输入、N、CPU 2、Asia/Shanghai 和 Setup/Run 计时边界，全部原校验 PASS；没有 LTO/PGO、额外预热或正式 C 复测。大原始诊断以无损 gzip 保存时，可先 `gzip -dk` 恢复 jsonl，正式小计时记录保留原文件。


编译后 DWARF 核对：本轮 JSFunctionBytecode 从 C 的 144 字节增为 160 字节，即每个函数字节码头实际增加 16 字节；每点记录分别为 40 / 40 / 96 / 16 字节，ReadICSite 均仍为 24 字节。原始测量见公共 layout_sizes.json。本轮 active_safety.json 的真实命中/回退为 39/23；它们保持 strict 指令位置且输出与原 C 一致。

最终判断：**保留为次优候选，整体收益较小**。相对 C 的 Octane GM −0.2843%、SunSpider GM −0.8473%；相对原 A 分别 −6.7030%、−2.4016%。单轮不证明稳定收益，未扩充第二模板或追加正式复测。
