# OWN_SHAPE_GUARD：缩短自有字段读取守卫

三版独立从冻结 SPARSE_CTOR_IC（06aada4）派生。RELAX_CLASS 去掉自有读的 class 限制；SHAPE_ONLY 同时去掉 exotic 限制。只改 keep=0 的自有数据读及 arg0/loc0 融合读。没有叠加之前的读/构造实验，没有修改冻结源码或默认版本。

## Release 时间

每组每版 5 个新进程，按组与轮次轮换版本顺序，CPU 2、Asia/Shanghai、C locale。微基准全部使用同一 N=268,435,456，接收者准备不计时，首次调用计入；真实项目保持原脚本、N、校验及 Setup/Run 边界。下面是中位数，括号内相对本批 SPARSE，负数更快。

| 用例 | SPARSE ms | RELAX_CLASS ms | SHAPE_ONLY ms |
|---|---:|---:|---:|
| object.fused | 5591.4759 | 5575.7134 (-0.28%) | 5554.1459 (-0.67%) |
| object.plain | 6043.4165 | 6056.6479 (+0.22%) | 6154.8629 (+1.84%) |
| function.fused | 5940.0969 | 5607.0292 (-5.61%) | 5643.9923 (-4.98%) |
| regexp.fused | 5923.5528 | 5601.8002 (-5.43%) | 5645.2629 (-4.70%) |
| array.fused | 5929.1275 | 5915.0562 (-0.24%) | 5529.2243 (-6.74%) |
| RegExp.RegExp | 153.7688 | 154.1509 (+0.25%) | 153.0998 (-0.44%) |
| Gameboy.Gameboy | 214.2533 | 210.7049 (-1.66%) | 210.6238 (-1.69%) |
| Typescript.Typescript | 1469.6011 | 1451.5424 (-1.23%) | 1448.3054 (-1.45%) |

### 每轮原始时间与范围

| 用例 | 版本 | 5 次 ms | 最小—最大 ms |
|---|---|---|---:|
| object.fused | SPARSE | 5592.4351, 5591.4759, 5716.0894, 5590.0572, 5525.9574 | 5525.9574—5716.0894 |
| object.fused | RELAX_CLASS | 5575.1516, 5575.7134, 5702.1301, 5574.2182, 5699.1212 | 5574.2182—5702.1301 |
| object.fused | SHAPE_ONLY | 5554.1459, 5768.3281, 5525.0982, 5774.3266, 5551.5442 | 5525.0982—5774.3266 |
| object.plain | SPARSE | 6143.9787, 6043.4165, 6036.1198, 6006.0361, 6145.6267 | 6006.0361—6145.6267 |
| object.plain | RELAX_CLASS | 6056.6479, 5963.8237, 5963.6298, 6056.8545, 6086.1269 | 5963.6298—6086.1269 |
| object.plain | SHAPE_ONLY | 6154.8629, 6188.0722, 6054.9557, 6138.5474, 6157.6163 | 6054.9557—6188.0722 |
| function.fused | SPARSE | 6012.8955, 6287.5542, 5940.0969, 5903.9609, 5916.0550 | 5903.9609—6287.5542 |
| function.fused | RELAX_CLASS | 5704.3871, 5699.8052, 5503.1617, 5607.0292, 5503.1576 | 5503.1576—5704.3871 |
| function.fused | SHAPE_ONLY | 5552.9581, 5770.4736, 5557.1502, 5643.9923, 5768.0157 | 5552.9581—5770.4736 |
| regexp.fused | SPARSE | 5917.0464, 5922.0677, 6011.7102, 6008.6460, 5923.5528 | 5917.0464—6011.7102 |
| regexp.fused | RELAX_CLASS | 5732.3007, 5572.5492, 5601.8002, 5574.7482, 5603.1152 | 5572.5492—5732.3007 |
| regexp.fused | SHAPE_ONLY | 5647.0036, 5554.6373, 5645.2629, 5769.1771, 5525.0973 | 5525.0973—5769.1771 |
| array.fused | SPARSE | 6037.0558, 6009.4735, 5914.9491, 5912.7812, 5929.1275 | 5912.7812—6037.0558 |
| array.fused | RELAX_CLASS | 5881.7571, 5936.6000, 5915.0562, 5912.5615, 6011.0767 | 5881.7571—6011.0767 |
| array.fused | SHAPE_ONLY | 5645.6701, 5527.6423, 5770.7930, 5525.3809, 5529.2243 | 5525.3809—5770.7930 |
| RegExp.RegExp | SPARSE | 153.6131, 154.7194, 153.8994, 153.7688, 153.7203 | 153.6131—154.7194 |
| RegExp.RegExp | RELAX_CLASS | 154.1509, 153.4088, 154.4209, 154.5514, 153.9396 | 153.4088—154.5514 |
| RegExp.RegExp | SHAPE_ONLY | 153.0346, 153.0998, 153.7841, 153.0895, 153.4962 | 153.0346—153.7841 |
| Gameboy.Gameboy | SPARSE | 214.1878, 215.3400, 214.2175, 218.6257, 214.2533 | 214.1878—218.6257 |
| Gameboy.Gameboy | RELAX_CLASS | 210.7049, 210.4899, 210.7429, 210.4138, 210.7542 | 210.4138—210.7542 |
| Gameboy.Gameboy | SHAPE_ONLY | 210.5808, 210.7524, 210.6238, 210.2626, 211.2413 | 210.2626—211.2413 |
| Typescript.Typescript | SPARSE | 1489.9842, 1468.0273, 1465.5727, 1469.6011, 1471.7219 | 1465.5727—1489.9842 |
| Typescript.Typescript | RELAX_CLASS | 1449.4546, 1448.4841, 1454.7469, 1458.4355, 1451.5424 | 1448.4841—1458.4355 |
| Typescript.Typescript | SHAPE_ONLY | 1450.8729, 1451.4882, 1445.3588, 1448.3054, 1444.2109 | 1444.2109—1451.4882 |

## 实际新增了哪些命中

以下均为独立计数构建，不拿计数构建的耗时下结论。每次逻辑读取只记一次，融合失败交给 get_field_rdi 时不重复记。诊断范围是准备后的 rdi 命名读取；不含遗留 get_length，因此不把它冒充整个解释器的所有属性读取。

| 微基准 / 版本 | 查询 | 融合命中 | 普通 IC 命中 | 正常查找 | rdi_update |
|---|---:|---:|---:|---:|---:|
| object.fused / SPARSE | 65,536 | 65,535 | 0 | 1 | 1 |
| object.fused / RELAX_CLASS | 65,536 | 65,535 | 0 | 1 | 1 |
| object.fused / SHAPE_ONLY | 65,536 | 65,535 | 0 | 1 | 1 |
| object.plain / SPARSE | 65,536 | 0 | 65,535 | 1 | 1 |
| object.plain / RELAX_CLASS | 65,536 | 0 | 65,535 | 1 | 1 |
| object.plain / SHAPE_ONLY | 65,536 | 0 | 65,535 | 1 | 1 |
| function.fused / SPARSE | 65,536 | 0 | 0 | 65,536 | 0 |
| function.fused / RELAX_CLASS | 65,536 | 65,535 | 0 | 1 | 1 |
| function.fused / SHAPE_ONLY | 65,536 | 65,535 | 0 | 1 | 1 |
| regexp.fused / SPARSE | 65,536 | 0 | 0 | 65,536 | 0 |
| regexp.fused / RELAX_CLASS | 65,536 | 65,535 | 0 | 1 | 1 |
| regexp.fused / SHAPE_ONLY | 65,536 | 65,535 | 0 | 1 | 1 |
| array.fused / SPARSE | 65,536 | 0 | 0 | 65,536 | 0 |
| array.fused / RELAX_CLASS | 65,536 | 0 | 0 | 65,536 | 0 |
| array.fused / SHAPE_ONLY | 65,536 | 65,535 | 0 | 1 | 1 |

实际布局：普通对象 class=1、函数 class=13、RegExp class=18 均非 exotic；数组 class=2 且 exotic。这几组的真实自有 x 描述符和 shape 均已确认可哈希；x 值始终从当前接收者的 prop 数组读取。RELAX_CLASS 新覆盖函数和 RegExp，仍不覆盖数组；SHAPE_ONLY 还覆盖数组真实自有数据槽。密集数组元素、typed-array 元素、字符串虚拟索引不是这种 prop 槽，仍走原路径。RELAX_CLASS 的数组用例没有新增命中，若计时有变化，不能把它算作数组进入缓存的收益。

| 小测试的接收者 | class | exotic | x 的真实槽号 |
|---|---:|---:|---:|
| 普通对象 | 1 | 0 | 0 |
| 函数 | 13 | 0 | 3 |
| RegExp | 18 | 0 | 1 |
| 数组 | 2 | 1 | 1 |

槽号取自运行时描述符和已填的 IC 记录，不按 JS 字面量猜测；以上四组 shape 均已哈希。

| 真实项目 / 版本 | rdi 逻辑读取 | keep=0 查询 | 新类别命中 | 正常查找 | rdi_update |
|---|---:|---:|---:|---:|---:|
| RegExp.RegExp / SPARSE | 8,044,251 | 28 | 0 | 8,044,188 | 21 |
| RegExp.RegExp / RELAX_CLASS | 8,044,251 | 28 | 0 | 8,044,188 | 21 |
| RegExp.RegExp / SHAPE_ONLY | 8,044,251 | 28 | 0 | 8,044,188 | 21 |
| Gameboy.Gameboy / SPARSE | 127,014,512 | 107,215,591 | 0 | 3,926,284 | 3,885 |
| Gameboy.Gameboy / RELAX_CLASS | 127,014,512 | 107,215,591 | 0 | 3,926,284 | 3,886 |
| Gameboy.Gameboy / SHAPE_ONLY | 127,014,512 | 107,215,591 | 0 | 3,926,284 | 3,886 |
| Typescript.Typescript / SPARSE | 69,350,538 | 53,583,527 | 0 | 8,004,450 | 4,080,694 |
| Typescript.Typescript / RELAX_CLASS | 69,350,538 | 53,583,527 | 0 | 8,004,450 | 4,080,694 |
| Typescript.Typescript / SHAPE_ONLY | 69,350,538 | 53,583,527 | 0 | 8,004,450 | 4,080,694 |

三个真实项目的新增类别命中都是 0。RegExp 的 exec 有 5,432,000 次读取，全是 keep=1 的 get_field2_rdi，本轮没有改这条方法读取路径；不是删掉 class 检查就能把继承方法变成自有字段。keep=0 下函数真实自有数据查找在 RegExp / Gameboy / Typescript 分别有 8 / 231 / 38,029 次，但对应 shape 都未哈希，仍不填槽。Gameboy 一个 Error 自有字段从不填变成填槽一次，后面没有重复读取，新增命中仍为 0。普通对象原有热读数量没有增加，时间变化要与更短守卫和编译布局一起判断。

## 实际字节码和 Release 汇编

微基准融合读实际为 `0 v6_get_arg0; 1 get_field_rdi x; 6 return`，普通读实际为 `0 get_arg1; 1 get_field_rdi x; 6 return`。三版编码、7 字节总长及 24B ReadICSite 均不变。micro_counts/ 保留实际执行缓冲区的 snapshot.jsonl、反汇编和前六次读取的对象/缓存 shape、槽号及描述符。

assembly.py 从这三个真实 Release ELF 的 computed-goto 表定位 handler，不使用另编的标签构建。v6_get_arg0 的对象块在 entry 之外，已单独保存 *.object.asm；*.branches.asm 保留分支目标，避免把相邻 opcode 当成快路。

| 融合命中的检查 | SPARSE | RELAX_CLASS | SHAPE_ONLY |
|---|---|---|---|
| 对象 tag | 保留 | 保留 | 保留 |
| class==Object 的比较/条件跳转 | 有 | 无 | 无 |
| exotic 位测试/条件跳转 | 有 | 有 | 无 |
| shape 比较/条件跳转 | 有 | 有 | 有 |

普通 get_field_rdi 的 Release 汇编也相应去掉这些准入检查。编译器同时改变了寄存器安排和代码位置，不能用源码删掉几个条件，直接推算整段程序必然快多少。get_field2_rdi 的守卫源码、原型 IC 和共享写守卫保持原样。

### Callgrind 指令数（不是耗时）

| 用例 | SPARSE Ir | RELAX_CLASS Ir | SHAPE_ONLY Ir |
|---|---:|---:|---:|
| object.fused | 32,158,110 | 31,896,265 | 31,830,779 |
| object.plain | 35,107,461 | 34,976,419 | 34,910,923 |

N=65,536，未插桩 Release，经 Callgrind 统计整个进程 Ir，包含加载/编译/准备/清理。与几秒长循环的原生 Release 耗时分开看；原始输出和 inclusive 注解在 callgrind/。

## 关键 C 代码

SHAPE_ONLY 的融合入口实际源码如下；RELAX_CLASS 在 shape 比较前还保留 `!object->is_exotic`。
```c
#define V6_PREPARED_BORROW(slot) do {                                    \
    JSValueConst receiver = (slot);                                    \
    if (JS_VALUE_GET_TAG(receiver) == JS_TAG_OBJECT) {                   \
        JSObject *object = JS_VALUE_GET_OBJ(receiver);                  \
        ReadICSite *site = (ReadICSite *)(pc + 1 + get_u32(pc + 1));      \
        if (site->shape == object->shape) {                            \
            *sp++ = JS_DupValue(ctx, object->prop[site->prop_offset].u.value); \
            pc += 5;                                                   \
            break;                                                     \
        }                                                              \
    }                                                                  \
    *sp++ = JS_DupValue(ctx, receiver);                                 \
} while (0)
```

原来在 shape 比较前还要求 Object 类别、非 exotic；现在已证明本记录只装真实自有数据槽，所以可以用当前 shape 直接核对布局。命中仍从当前 object->prop 取当前值，并照旧 DupValue；pc 加 5 跳过后面的 get_field_rdi，失败仍把 receiver 压栈让旧查找处理。

普通 get_field_rdi 的两处配套改动（原始源码节选，中间未改部分省略）：
```c
if (!keep || (p->class_id == JS_CLASS_OBJECT && !p->is_exotic)) {
    /* 原缓存探测和命中收尾不变，省略 */
}
/* 正常查找已确认真实数据描述符后；继承字段仍走上面的原分支 */
else if (keep && (p->class_id != JS_CLASS_OBJECT || p->is_exotic)) { RDI_REASON(special); }
else if (!p->shape->is_hashed) { RDI_REASON(unhashed); }
else {
    RDI_REASON(own_miss);
    rdi_update(ctx, site, p->shape, pr - p->prop RDI_DARG(d));
}
```

keep=0 才放宽；keep=1 的方法读取保留原条件。仍不缓存 getter、继承字段、未哈希布局或虚拟数组元素。两版完整独立补丁在本目录，read_ic_runtime.inc、共享写和构造代码没有改。

## 正确性和布局依据

与 A 对齐的测试通过：已有 property_reads/safety、同布局改值/删除/改 getter、继承字段、Proxy/revoke、数字形式名称、函数调用前后读取、读扩大后共享写仍按旧守卫回退。两候选 ASan/UBSan 通过。内部 C fixture 实测普通对象与自定义 exotic 对象可以共用同一个 shape：双方有真实普通自有槽时，A 本来就在特殊分派前读取；删除后 shape 分离并触发一次 exotic get。另覆盖真实 get_field 的数字 atom、数组/typed array/String、buffer detach 和 GC。内部函数样例实测 class 为 13→13，没有把它写成已实测的 cold→warm 类别转换。

为什么 SHAPE_ONLY 可以读：填槽仍必须正常查找到接收者本身的真实普通数据描述符，并且 shape 已哈希。IC 持有该 shape，删除、类型转换、属性移动、改原型等更新在共享布局上采用复制，不能悄悄把旧槽变成别的属性。每次都读当前对象的当前值；不假定同 shape 等于同 class，也不缓存特殊 API 返回的虚拟属性。逐入口核查见 layout_proof.md。

未增加任何静态点、函数或运行时元数据；ReadICSite 24B、JSFunctionBytecode 160B、JSRuntime 2216B、JSShape 56B、JSObject 64B 均与冻结 SPARSE 相同。不改字节码表示，因此没有为本次守卫改动另做 qjsc 格式改动。LSan 在当前 ptrace 环境关闭，ASan/UBSan 和 runtime 释放断言正常执行。

## 是否继续跑全集

- RELAX_CLASS：有真实项目连续 5 对均更快，进入同批单轮全集。
  RegExp.RegExp 五对变化：+0.35%, -0.85%, +0.34%, +0.51%, +0.14%。
  Gameboy.Gameboy 五对变化：-1.63%, -2.25%, -1.62%, -3.76%, -1.63%。
  Typescript.Typescript 五对变化：-2.72%, -1.33%, -0.74%, -0.76%, -1.37%。
- SHAPE_ONLY：有真实项目连续 5 对均更快，进入同批单轮全集。
  RegExp.RegExp 五对变化：-0.38%, -1.05%, -0.07%, -0.44%, -0.15%。
  Gameboy.Gameboy 五对变化：-1.68%, -2.13%, -1.68%, -3.83%, -1.41%。
  Typescript.Typescript 五对变化：-2.62%, -1.13%, -1.38%, -1.45%, -1.87%。

### 同批单轮全集

| 版本 | Octane 整体 GM | SunSpider 整体 GM |
|---|---:|---:|
| SPARSE | +0.00% | +0.00% |
| RELAX_CLASS | -0.15% | -0.05% |
| SHAPE_ONLY | -0.03% | +0.72% |

Octane 按 14 suite 分层等权，SunSpider 按 26 项等权。两套逐项表、ms/Run 与逐项耗时之和见 full_confirmation01/results.md。本批基线重新测量，一项一版一个新进程；单轮不报显著性。

两版都没有显示明显的整体收益。RELAX_CLASS 两套仅有不到 0.2% 的耗时下降；SHAPE_ONLY 的 Octane 几乎持平，SunSpider 略慢。保留实验，不替换冻结版。
SHAPE_ONLY 的 Gameboy 定向 5 对都更快，但全集这一轮为 +0.28%；两批结果均保留，不追加重测来挑结果。

计数证明范围是否扩大，汇编证明守卫是否减少，Release 时间才说明是否更快。没有把小测试新增命中解释成正则匹配器变快，也不把跨版本的代码布局差异排除在时间变化之外。本轮结果保留为实验，不替换冻结 SPARSE，不 push。

## 复现

首次运行顺序（先 cd 到本实验目录）：

```sh
python3 build.py
python3 build.py --labels RELAX_CLASS SHAPE_ONLY --modes sanitize
python3 validate.py
python3 run.py micro_counts
python3 run.py target_counts
python3 assembly.py
python3 instructions.py
python3 run.py pilot
python3 run.py micro_time
python3 run.py target_time
python3 run.py decide
python3 full_confirmation.py  # 没有合格候选时直接结束，不启动全集
python3 report.py
```

上面的命令需先 cd 到本实验目录。原始记录默认拒绝覆盖；完整复跑时把脚本、inc、JS、C 文件复制到同级新的 attempt 目录后运行。build.py 每版从冻结目录生成独立源码，验证 manifest 哈希；补丁独立对 SPARSE，不需要按顺序应用。
