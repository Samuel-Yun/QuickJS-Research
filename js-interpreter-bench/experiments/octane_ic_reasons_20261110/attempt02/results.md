# EVAL_COLD 五个低命中表项：原因分类

每项只运行一个独立原因诊断进程，沿用旧诊断的 N 和 Run 区间；未重测性能。
**五项 queries/hits/misses/own_fills 均与上一轮完全一致**，每次未命中恰好归入一个首要原因。
统计非 length 命名读取，包含普通、融合和原型读取；不调用 getter 两次，只检查现有原始属性描述符。

诊断按“第一条拒绝条件”分类；某类占比不是移除该守卫就必然能缓存的比例，后面可能仍有其他限制。
位点按函数编译实例及其真实 IC 记录计数，函数销毁时解除地址映射，避免地址复用把新位点误算成旧位点。
只执行一次指本次 Run 统计区间内，不能自动等同于整个函数生命周期只访问一次。

## RegExp.RegExp

命中率 0.000796%；读取 7,912,384，未命中 7,912,321。
统计中触及 751 个编译实例位点，0 个只读取一次；
其中 0 个只读一次却进行了自身属性缓存填充。

| 原因 | 次数 | 占未命中 | 占全部读取 |
|---|---:|---:|---:|
| unsupported_receiver_class | 5,432,000 | 68.6524% | 68.6519% |
| primitive_string | 2,480,320 | 31.3476% | 31.3473% |
| own_first_fill | 1 | 0.0000% | 0.0000% |

主要属性与接收类型：

| 属性 | 首要原因 | 类型 | 次数 |
|---|---|---|---:|
| `exec` | unsupported_receiver_class | JS_CLASS_REGEXP | 5,432,000 |
| `replace` | primitive_string | NONE | 2,384,960 |
| `split` | primitive_string | NONE | 82,240 |
| `match` | primitive_string | NONE | 13,120 |
| `run` | own_first_fill | JS_CLASS_OBJECT | 1 |

## Mandreel.Mandreel

命中率 0.293917%；读取 333,428，未命中 332,448。
统计中触及 13 个编译实例位点，0 个只读取一次；
其中 0 个只读一次却进行了自身属性缓存填充。

| 原因 | 次数 | 占未命中 | 占全部读取 |
|---|---:|---:|---:|
| own_unhashed | 332,303 | 99.9564% | 99.6626% |
| unsupported_receiver_class | 133 | 0.0400% | 0.0399% |
| primitive_string | 8 | 0.0024% | 0.0024% |
| autoinit_descriptor | 3 | 0.0009% | 0.0009% |
| own_first_fill | 1 | 0.0003% | 0.0003% |

主要属性与接收类型：

| 属性 | 首要原因 | 类型 | 次数 |
|---|---|---|---:|
| `sqrt` | own_unhashed | JS_CLASS_OBJECT | 134,399 |
| `floor` | own_unhashed | JS_CLASS_OBJECT | 121,106 |
| `cos` | own_unhashed | JS_CLASS_OBJECT | 38,399 |
| `pow` | own_unhashed | JS_CLASS_OBJECT | 38,399 |
| `fromCharCode` | unsupported_receiver_class | JS_CLASS_C_FUNCTION | 133 |
| `charCodeAt` | primitive_string | NONE | 4 |
| `replace` | primitive_string | NONE | 2 |
| `toLowerCase` | primitive_string | NONE | 2 |
| `now` | own_first_fill | JS_CLASS_OBJECT | 1 |
| `cos` | autoinit_descriptor | JS_CLASS_OBJECT | 1 |
| `pow` | autoinit_descriptor | JS_CLASS_OBJECT | 1 |
| `sqrt` | autoinit_descriptor | JS_CLASS_OBJECT | 1 |

## CodeLoad.CodeLoadClosure

命中率 0.000000%；读取 57,344，未命中 57,344。
统计中触及 32,774 个编译实例位点，32,768 个只读取一次；
其中 16,384 个只读一次却进行了自身属性缓存填充。

| 原因 | 次数 | 占未命中 | 占全部读取 |
|---|---:|---:|---:|
| own_first_fill | 16,384 | 28.5714% | 28.5714% |
| primitive_other | 12,288 | 21.4286% | 21.4286% |
| own_unhashed | 12,286 | 21.4251% | 21.4251% |
| unsupported_receiver_class | 8,192 | 14.2857% | 14.2857% |
| primitive_string | 8,192 | 14.2857% | 14.2857% |
| autoinit_descriptor | 2 | 0.0035% | 0.0035% |

主要属性与接收类型：

| 属性 | 首要原因 | 类型 | 次数 |
|---|---|---|---:|
| `toString` | primitive_other | NONE | 12,288 |
| `typeOf` | own_first_fill | JS_CLASS_OBJECT | 4,096 |
| `cloneObject` | own_first_fill | JS_CLASS_OBJECT | 4,096 |
| `now` | unsupported_receiver_class | JS_CLASS_C_FUNCTION | 4,096 |
| `removeUid` | own_first_fill | JS_CLASS_OBJECT | 4,096 |
| `getUid` | own_first_fill | JS_CLASS_OBJECT | 4,096 |
| `random` | own_unhashed | JS_CLASS_OBJECT | 4,096 |
| `replace` | primitive_string | NONE | 4,096 |
| `map` | unsupported_receiver_class | JS_CLASS_ARRAY | 4,096 |
| `split` | primitive_string | NONE | 4,096 |
| `floor` | own_unhashed | JS_CLASS_OBJECT | 4,095 |
| `abs` | own_unhashed | JS_CLASS_OBJECT | 4,095 |
| `floor` | autoinit_descriptor | JS_CLASS_OBJECT | 1 |
| `abs` | autoinit_descriptor | JS_CLASS_OBJECT | 1 |

## CodeLoad.CodeLoadJQuery

命中率 7.414830%；读取 510,976，未命中 473,088。
统计中触及 190,470 个编译实例位点，145,408 个只读取一次；
其中 35,840 个只读一次却进行了自身属性缓存填充。

| 原因 | 次数 | 占未命中 | 占全部读取 |
|---|---:|---:|---:|
| unsupported_receiver_class | 366,080 | 77.3810% | 71.6433% |
| own_first_fill | 42,496 | 8.9827% | 8.3166% |
| missing_property | 28,160 | 5.9524% | 5.5110% |
| primitive_string | 24,576 | 5.1948% | 4.8096% |
| prototype_value_read_not_cached | 6,144 | 1.2987% | 1.2024% |
| own_unhashed | 3,069 | 0.6487% | 0.6006% |
| own_guard_or_shape_change | 1,024 | 0.2165% | 0.2004% |
| primitive_other | 1,024 | 0.2165% | 0.2004% |
| prototype_first_fill | 512 | 0.1082% | 0.1002% |
| autoinit_descriptor | 3 | 0.0006% | 0.0006% |

主要属性与接收类型：

| 属性 | 首要原因 | 类型 | 次数 |
|---|---|---|---:|
| `call` | unsupported_receiver_class | JS_CLASS_BYTECODE_FUNCTION | 48,128 |
| `fn` | unsupported_receiver_class | JS_CLASS_BYTECODE_FUNCTION | 39,936 |
| `test` | unsupported_receiver_class | JS_CLASS_REGEXP | 29,696 |
| `call` | unsupported_receiver_class | JS_CLASS_C_FUNCTION | 26,624 |
| `attrFn` | unsupported_receiver_class | JS_CLASS_BYTECODE_FUNCTION | 25,600 |
| `event` | unsupported_receiver_class | JS_CLASS_BYTECODE_FUNCTION | 17,408 |
| `source` | unsupported_receiver_class | JS_CLASS_REGEXP | 16,384 |
| `type` | unsupported_receiver_class | JS_CLASS_BYTECODE_FUNCTION | 15,872 |
| `extend` | unsupported_receiver_class | JS_CLASS_BYTECODE_FUNCTION | 13,312 |
| `pop` | unsupported_receiver_class | JS_CLASS_ARRAY | 11,776 |
| `each` | unsupported_receiver_class | JS_CLASS_BYTECODE_FUNCTION | 10,240 |
| `call` | unsupported_receiver_class | JS_CLASS_COLD_BYTECODE_FUNCTION | 9,728 |
| `isFunction` | unsupported_receiver_class | JS_CLASS_BYTECODE_FUNCTION | 9,216 |
| `attrHooks` | unsupported_receiver_class | JS_CLASS_BYTECODE_FUNCTION | 8,192 |
| `prototype` | unsupported_receiver_class | JS_CLASS_C_FUNCTION | 7,680 |

## zlib.zlib

命中率 0.505188%；读取 14,648，未命中 14,574。
统计中触及 182 个编译实例位点，146 个只读取一次；
其中 96 个只读一次却进行了自身属性缓存填充。

| 原因 | 次数 | 占未命中 | 占全部读取 |
|---|---:|---:|---:|
| own_unhashed | 14,247 | 97.7563% | 97.2624% |
| own_first_fill | 108 | 0.7410% | 0.7373% |
| unsupported_receiver_class | 101 | 0.6930% | 0.6895% |
| prototype_unhashed | 43 | 0.2950% | 0.2936% |
| primitive_string | 32 | 0.2196% | 0.2185% |
| autoinit_descriptor | 18 | 0.1235% | 0.1229% |
| missing_property | 17 | 0.1166% | 0.1161% |
| own_guard_or_shape_change | 8 | 0.0549% | 0.0546% |

主要属性与接收类型：

| 属性 | 首要原因 | 类型 | 次数 |
|---|---|---|---:|
| `max` | own_unhashed | JS_CLASS_OBJECT | 14,242 |
| `hasOwnProperty` | prototype_unhashed | JS_CLASS_OBJECT | 43 |
| `push` | unsupported_receiver_class | JS_CLASS_ARRAY | 30 |
| `charCodeAt` | primitive_string | NONE | 18 |
| `Math` | own_first_fill | JS_CLASS_OBJECT | 15 |
| `pop` | unsupported_receiver_class | JS_CLASS_ARRAY | 12 |
| `now` | unsupported_receiver_class | JS_CLASS_C_FUNCTION | 11 |
| `charAt` | primitive_string | NONE | 10 |
| `J` | unsupported_receiver_class | JS_CLASS_BYTECODE_FUNCTION | 10 |
| `I` | unsupported_receiver_class | JS_CLASS_BYTECODE_FUNCTION | 9 |
| `a` | own_guard_or_shape_change | JS_CLASS_OBJECT | 6 |
| `a` | own_first_fill | JS_CLASS_OBJECT | 6 |
| `preRun` | own_first_fill | JS_CLASS_OBJECT | 5 |
| `reverse` | unsupported_receiver_class | JS_CLASS_ARRAY | 4 |
| `split` | primitive_string | NONE | 4 |

## 实现依据与结论

RegExp：5,432,000 次 exec 读取的接收者为 JS_CLASS_REGEXP；2,480,320 次为原始字符串的方法读取，
以 replace/split/match 为主。现有普通与融合 IC 限定 JS_CLASS_OBJECT，原始字符串也不进入该对象路径。

Mandreel：332,303 次未命中是普通自身数据属性但 shape->is_hashed=0，占未命中 99.9564%。
属性为 sqrt/floor/cos/pow，源码对应 Math 函数读取。zlib 同类 14,247 次，占未命中 97.7563%，主要为 Math.max。

Math 构造路径：quickjs.c 的 JS_DEF_OBJECT → JS_NewObjectProtoList（约39693行）→
JS_NewObjectProtoClassAlloc（5783行）→ js_new_shape_nohash（5234行）；该路径明确创建非驻留 shape。
Math 原生函数还使用 AUTOINIT 属性，首次读取会物化函数；math_reproducer 记录到 1 次 AUTOINIT 和随后15次 own_unhashed，16次读取均未命中。

is_hashed 不是“对象有没有属性哈希表”，而是 shape 是否驻留于 runtime 的 shape 共享哈希表。
read_ic_opcodes.inc 约58行明确拒绝给非驻留 shape 填充；原属性查找仍可使用其 hash_table。
js_shape_prepare_update（quickjs.c:10338）仅在 hashed 情况下执行克隆/解除共享，对已 unhashed 的 shape 可原地修改。
因此不能简单删除这一守卫：shape 指针不变时，属性布局或描述符仍可能变化，需要安全的失效/重新校验机制。

Closure：28.5714% 的未命中是首次自身属性填充，且这些填充全部落在本次只读一次的位点上；
57.1429% 的全部读取来自统计区间内只读一次的编译实例位点。其余主要是数字 toString、字符串方法、Math unhashed、Date.now 与数组 map 等覆盖限制。
源码每轮重新 eval 已加盐的代码，填充的位点没有第二次读取，增加槽数不能使它们产生复用。

JQuery：77.3810% 的未命中首先被接收类限制拒绝，以函数、正则、数组等为主；call/fn/attrFn/extend/event/type 是主要属性。
另外 8.9827% 为首次自身属性填充，5.9524% 为不存在的属性（当前不缓存负查询），5.1948% 为原始字符串。

这五项低命中的主要原因是类型/布局覆盖不足及冷位点，而不是单槽形状抖动。
理由描述的是当前实现选择，不是该访问理论上不能优化。支持更多类型或非驻留布局仍须保证描述符/原型/失效正确性。
命中率改善不能等比例换算为整体耗时改善，尤其 zlib 统计中只有14,648次目标读取。

## 诊断局限与身份

原因分类会额外做只读属性查找和分配元数据；仅用于计数，不使用其时间。
为稳定属性名身份，诊断暂持有已触及 atom，到 Run 结束释放；不保活接收对象、函数或 shape。
原 Release 代码、前一轮计数构建、性能数据与日志保持不变。编译失败和错误引号的校验输入均保留，成功校验见 calibration_gate.json。
