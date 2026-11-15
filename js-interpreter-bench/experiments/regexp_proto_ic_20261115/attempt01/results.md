# 方案 3B：RegExp 直接原型数据属性读取 IC

已从冻结的 C（TRANSITION_EDGE_STRONG）独立实现、编译并跑完。**目标读点几乎全命中，但这轮没有看到整体净收益**：相对旧 C，Octane 几何平均耗时 **+0.2683%**，SunSpider **+0.0658%**。Octane RegExp 为 **153.550436 → 153.499185 ms/Run（−0.0334%）**，基本持平。只有一次新样本，并且跨批次引用旧 C，不能把这些小幅变化判为稳定收益或稳定退化。

本轮只实现这一项改动，没有叠加第二个优化。C 的 strong shape 转换缓存原样保留；没有改正则匹配器、内置函数、调用帧或 benchmark 算法。

## 三个问题的回答

1. **原来拒绝的 5,432,000 次 RegExp `exec` 读取，有 5,431,996 次真正进入新快路，4 次回退，目标读点命中率 99.999926%。** 这是独立计数进程的实际结果，不是把旧的拒绝次数直接当作命中。原 C 诊断确认其中 5,431,999 次落在直接原型普通数据属性，1 次是 AUTOINIT；新版本的 4 次回退为 1 次 AUTOINIT 和 3 次普通数据填充。原型其他懒初始化造成 holder shape 两次变化，需要重新填充；实际 admission 3 次。此命中率的分母只是 RegExp 接收者的目标读点，不是整个 Octane RegExp 的所有命名读取。
2. **每个成功读取省掉原查询循环中的两次 `find_own_property`：接收者查无自有属性，再查直接原型。** 原 C 实际执行 10,864,000 次；3B 剩 8 次，实际差值 10,863,992。增加 RegExp 类别/非 exotic 守卫、接收者 shape 指针比较、直接原型普通对象/非 exotic 守卫及 holder shape 指针比较。命中直接读取 holder 当前属性槽并 DupValue；没有重复 atom/descriptor 检查。填充时还有一次按整个 holder 布局计算 hash 的工作、shape 强引用及可能的全局 shape 表扩容；后续布局变动会走 COW。这些成本均计入 Release 时间。
3. **局部没有明确净收益，两个全集也没有。** RegExp 仅 −0.03%；string-validate-input 对旧 C 为 −1.32%，但仍慢于旧 EVAL_COLD，单轮不足以证明；string-tagcloud +0.50%；CodeLoad.JQuery +0.28%。regexp-dna 虽为 −2.24%，新快路命中是 0，因此不能解释成此 IC 的收益，更不能解释成正则匹配器变快。全集结果见下面完整表格。

## 实际字节码和覆盖

小例子为 `function invoke(re,s){return re.exec(s);}`。最终字节码共 10 字节，调用前后保留相同 opcode 序列：

```text
pc 0: get_arg0
pc 1: get_field2_rdi exec   // 原有静态访问点记录，24 字节
pc 6: get_arg1
pc 7: tail_call_method 1
```

原 C 的只读诊断证据在 [preflight/bytecode.json](preflight/bytecode.json) 和 [preflight/RegExp_counts.json](preflight/RegExp_counts.json)。原负载为原始 measure 脚本，RegExp 的 N=64，不修改 Run 算法。唯一目标点是 `Exec` 函数的 slot 0，实际执行 5,432,000 次。它的 receiver 是非 exotic 的 `JS_CLASS_REGEXP`，注册表没有该类的 exotic handler；实例 shape 已 hashed。直接 holder 为普通对象，但其私有 shape **未 hashed**，直接沿用原 P1 白名单仍不能安全缓存。

原 C 的 5,431,999 次普通数据发现：receiver shape 变化 0，holder shape 地址变化 0；属性 offset 一直为 10，holder 有 20 个槽、无删除槽，初始 shape RC=1，目标 flags=3。**地址稳定不等于布局受保护**：原私有 unhashed shape 可以在原位置变动，不能据此删除 `is_hashed` 检查。

独立计数覆盖全部 43 项；下表只列有 RegExp 接收者命名读取的 7 项，其余 36 项新计数为 0，但仍完整执行并计时。

| 表项 | RegExp 接收者目标读取 | 新快路命中 | 回退 | 跳过的原查询循环 own-property 查找 |
|---|---:|---:|---:|---:|
| Octane RegExp | 5,432,000 | 5,431,996 | 4 | 10,863,992 |
| Octane PdfJS | 160 | 157 | 3 | 314 |
| Octane CodeLoad.JQuery | 48,640 | 26,624 | 22,016 | 53,248 |
| Octane Typescript | 205 | 200 | 5 | 400 |
| SunSpider regexp-dna | 2,304 | 0 | 2,304 | 0 |
| SunSpider string-tagcloud | 256 | 254 | 2 | 508 |
| SunSpider string-validate-input | 1,024,000 | 1,023,998 | 2 | 2,047,996 |
| 合计 | 6,507,565 | 6,483,229 | 24,336 | 12,966,458 |

CodeLoad.JQuery 的 `.test` 为 29,696 次 / 命中 26,624；`.source` 为 16,384 次 / 命中 0；`.exec` 为 2,560 次 / 命中 0。冷访问点和 getter 都保留回退。regexp-dna 的 2,304 次全是 `.source` getter，且 keep=0；不能因为这个测试做正则操作，就假定其内部所有匹配都经过 JS 字节码 `exec` 读点。string-tagcloud 和 string-validate-input 的新增命中是 `.test`。Typescript 的新增命中包含 185 次 `.exec` 和 15 次 `.toString`。

计数器只观察原执行路径：读取已找到的 `JSShapeProperty` 描述符，不额外调用 JS getter 或重新执行属性读取。每个存活的字节码实例/静态点分别记录，释放函数时移出地址索引，避免地址重用合并冷点。`normal_lookup_calls` 只数原 RDI 查询循环实际执行的 `find_own_property`，不声称覆盖 getter 或内置函数内部再次进行的查找；`normal_lookup_calls_skipped=2×new_hits` 来自新快路的直接原型保证，且 RegExp 的原 C 前后实际调用差值独立验证了这个数。

## 实现与布局安全

实测 Release 相对 C **只改变两个文件**，补丁为 [release.feature.patch](release.feature.patch)：

- [implementation/read_ic_opcodes.inc](implementation/read_ic_opcodes.inc)：第 35 行左右增加 RegExp 的 `get_field2_rdi` 分支，第 66 行左右增加原查找成功后的缓存填充。普通对象现有 B2/P1 快路保持原先代码；没有给普通对象成功快路前置通用检查。`keep=0` 的新分支可被编译器常量消除；其他非普通对象的保留接收者读取会多做一次 RegExp 类别判断。
- [implementation/read_ic_runtime.inc](implementation/read_ic_runtime.inc)：第 89 行 `rdi_regexp_holder_admit`。只在原查找已经得到直接 holder 的普通数据属性后执行，既不按 atom 名称启用，也不执行第二次 JS 读取。

Admission 对未 hashed holder 要求：普通非 exotic 对象，私有 shape RC=1，无删除槽、非空且所有槽 atom 有效。用现有的 `shape_initial_hash(proto)` 与逐槽 `(atom,完整 flags)` 构造精确布局 hash，再接入原 shape 表，而非仅翻转 `is_hashed`。可选扩容使用 RT 分配器；失败时不缓存、不改变本次读取结果。已 hashed 的 holder 直接复用原保护。

随后原 `v6_proto_update` 强引用接收者及 holder shape。缓存活跃时，当前对象持有的 shape 还被 IC 持有，RC>1；因此原 QuickJS `js_shape_prepare_update` 在删除、描述符变化、换原型和 AUTOINIT 前先 clone shape。新增字段走原 add-property 的 shape 复用/clone 分支。旧 shape 的槽布局在缓存期间不会被原地改成别的属性，命中不用再检查 atom 或 descriptor。

关键原有保护位置（冻结 C 的 quickjs.c 行号同 Release）：`js_shape_prepare_update:10377`，`JS_SetPrototypeInternal:7968/8049`，`JS_AutoInitProperty:8238/8246`，`delete_property:9386/9410`，`add_property` 的 shape 复用/clone 分支约 9277–9317，`js_update_property_flags:10404`。RegExp 类注册约 2007，实例 shape 创建约 49467，现有读 handler 引入在 19261。

原型数据值替换但布局不变时无需失效：命中读的是**当前 holder 对象的当前属性槽**。接收者 shape 的 proto 身份受保护，holder shape 保护 offset；不同 realm 的不同原型通过接收者/holder shape 守卫区分。自有同名属性会改变接收者布局，换原型也会改变 shape，均回退。getter、AUTOINIT、Proxy 或更深原型属性不进入此缓存。

副作用边界也需要计入：holder 接入全局 shape 表后，可能被原有 shape 复用或普通对象 IC 使用；懒初始化可能额外 clone shape。这里没有把这些间接效应隐藏，也不把无新增命中的表项波动归因为本快路。

ReadICSite 仍为 **24 字节/静态点**（有编译期断言），没有新字段、新数组或额外的每点分配；复用原来的 receiver shape、holder shape、offset。只在实际填入 RegExp 直接原型数据属性的记录上增加原 shape 强引用关系。一次 admission 复用已有 JSShape 的 hash/link 字段，可能扩容全局 shape 表；这些不是新增每点元数据。诊断版本另有计数元数据，Release 不含计数或快照代码。C 的 `edge_strong_helpers.inc`、`quickjs.c`、`read_ic_prepare.inc`、字节码格式、`libregexp.c` 与其余源文件哈希均与 C 一致。

## 命中前后的执行路径

```text
C:
  get_field2_rdi
    → 普通对象快路的 class 检查拒绝 RegExp
    → find_own_property(receiver, atom) 未找到
    → find_own_property(direct_prototype, atom) 找到普通数据槽
    → DupValue(当前方法值)，保留 receiver
  → 原 tail_call_method，以原 receiver 为 this

3B 已缓存命中:
  get_field2_rdi
    → RegExp + !exotic
    → receiver shape == cached receiver shape
    → direct prototype 是普通非 exotic 对象
    → holder shape == cached holder shape
    → DupValue(holder->prop[cached_offset].u.value)，保留 receiver
  → 原 tail_call_method，以原 receiver 为 this

3B 任一守卫不满足:
  → 原完整查找/访问器/Proxy 路径
  → 仅普通数据且满足 admission 时更新同一静态点的记录
```

没有减少这个例子的字节码数量、dispatch 数或方法调用次数；只是将两次属性 hash 查找换成守卫和槽读取。正则匹配、结果数组构造、后续字符串操作等仍由原引擎执行。本轮没有做 CPU 分项采样，不能定量断言时间都花在匹配器或哪条守卫；实测只能确认这些查找被跳过后，整个 RegExp 时间没有可观察的改善。

## 验证与计时协议

[qualification/gate.json](qualification/gate.json)：原 C、3B Release、3B counts、3B ASAN+UBSAN 四个构建均通过相同 **194 条定向断言**，输出完全一致；原生双 realm 测试每构建 **96 次调用**，也全部一致。定向测试覆盖反复命中、普通方法换值、同 shape 不同 receiver 的 this、自有属性遮蔽/删除、删除原型字段、换原型/恢复、getter 的次数及抛出的同一异常对象、Proxy 接收者/holder、其他 AUTOINIT、非函数数据值、两 realm 的交错读取。`ping` 任意属性名 32 次读取有 31 次命中，证明没有按 `exec` 名称特判。带计数的失效测试实际有 95 命中 / 18 回退，没有仅在慢路验证语义。

ASAN/UBSAN 无错误；ASAN leak detection 关闭，正常 QuickJS GC/释放断言仍启用。本轮没有跑完整 test262。没有改变字节码表示，因此按任务要求不额外增加 qjsc 保存/加载测试。

原生 Ubuntu 26.04.1、i9-14900，CPU affinity 固定 **2**；gcc 15.2，沿用 C 的 `make -j2 -o repl.c qjs`、`-O2 -fwrapv`。环境、输入和构建哈希见各 `runs/*/*/protocol.json` 与 environment 文件。

- 不带计数 Release：Octane 17 项、SunSpider 26 项，每项 **1 个独立进程**，顺序执行，共 43 个；没有新增 warmup、重试、剔除样本或只跑命中项目。
- 独立 counts 构建：相同 43 项再各 1 个诊断进程；计数时间不进入正式表。另有原 C 的 bytecode/布局诊断，**没有 C 的正式复测**。
- 沿用 `native_confirmation_20261108/attempt02` 的 measure 脚本、固定 N、输入和计时边界；一次样本内 N 次完整 Run 是旧协议，不是本轮重复测试 N 个独立样本。Setup、zlib 输入加载和进程启动仍在计时外；首次调用准备仍在原先的 Run 计时内。
- 所有原结果校验 PASS；输入、脚本、ELF、源码前后哈希不变。`analysis/summary.json` 的离线审计检查 43 个新 Release 进程和 43 个独立计数进程的唯一性与数据一致性。
- **C 是跨批次旧单轮成绩**：Octane 引用 `execution_paths_20261114/attempt01/runs/TRANSITION_EDGE_STRONG/octane/comparison.csv`；SunSpider 引用 `execution_paths_20261114/attempt01/sunspider_timing01/comparison.csv`。A/EVAL_COLD 是历史 30 次确认的中位数；本轮没有复测这两个版本。
- 单位统一为 **ms / 一次完整 Run**，越小越好；变化 `(3B / 对照 - 1) × 100%`，负号代表更快。Octane 继续按 **14 个 suite 等权、拆分子项先做几何平均**，表仍列全 17 项；SunSpider 为 26 项等权几何平均。SunSpider 合计耗时 C=398.200312、3B=397.089025 ms（−0.2791%），它不是几何平均，不能混为同一个指标。

## 代码、原始数据与复现

- 可独立编译源码包：[candidate/3B_REGEXP_PROTO-source.tar.gz](candidate/3B_REGEXP_PROTO-source.tar.gz)，恰好 34 个原源码文件，仅上述两个文件与 C 不同；[candidate/manifest.json](candidate/manifest.json) 给出全部哈希。相对 C 的补丁已在临时目录以 `patch --fuzz=0` 实际应用，所得 34 个文件与实测 Release 源码逐字节一致。
- 新源码包 SHA256：`9e894fcbf1822cf902d5a8698f6e4744ca85074ba11304bb0c3ed15d67548089`。
- 旧 C 源码包 SHA256：`1365a209918b09c10147ffd8d7efdf86475ea0364d126c6d4ea7c35342f24c87`（保持不变）。
- 实测 Release ELF SHA256：`7bd53aa322c13b8e1d83de8a84b90148445d1f57b4802eea5222b27e3103250d`。
- 正式原始结果：[runs/release/octane/runs.jsonl](runs/release/octane/runs.jsonl)、[runs/release/sunspider/runs.jsonl](runs/release/sunspider/runs.jsonl)。计数原始结果在对应 `runs/counts/` 目录。
- 逐项 CSV：[analysis/octane.csv](analysis/octane.csv)、[analysis/sunspider.csv](analysis/sunspider.csv)；全部命中/回退：[analysis/counts.csv](analysis/counts.csv)。

独立源码编译（解压到新目录）：

```sh
tar -xzf candidate/3B_REGEXP_PROTO-source.tar.gz
cd quickjs-3b-regexp-proto
make -j2 -o repl.c qjs
```

在原仓库、此 attempt 目录下，可用 `python3 analyze.py` 重新生成表格，`python3 package.py` 再次核对源码和补丁；两者均不运行新性能样本。`build.py`、`preflight.py`、`qualify.py`、`run_bench.py`、`sequence.py` 保留本次完整构建/执行流程；构建和定向验证输出目录采取防覆盖策略，重跑实验须用新的 attempt 目录，不能覆盖本轮结果。一次新 Release 全集命令为 `python3 sequence.py release`（仅在新的实验目录且已完成构建与资格校验后执行）。已有结果再次执行此命令会跳过已完成样本，不构成一次新复测。

## 两套完整逐项数据

“新命中 / 回退”仅指 RegExp 接收者的命名字节码读取；0 / 0 代表此项没有这类目标读取，**不代表原引擎的其他 IC 没有命中或回退**。全部回退均保留在时间和计数中。


### octane

| 表项 | A（历史） | EVAL_COLD（历史） | C（旧单轮） | 3B（新单轮） | 3B 相对 C | 新命中 / 回退 |
|---|---:|---:|---:|---:|---:|---:|
| Richards | 2.6391 | 2.2297 | 2.2287 | 2.3026 | +3.32% | 0 / 0 |
| DeltaBlue | 5.8309 | 4.8536 | 4.8016 | 4.8173 | +0.33% | 0 / 0 |
| Crypto.Encrypt | 3.8104 | 3.7474 | 3.7439 | 3.7749 | +0.83% | 0 / 0 |
| Crypto.Decrypt | 72.0293 | 70.4393 | 70.4747 | 70.4628 | -0.02% | 0 / 0 |
| RayTrace | 30.3557 | 28.2978 | 27.2865 | 27.1747 | -0.41% | 0 / 0 |
| EarleyBoyer.Earley | 5.5095 | 5.3102 | 5.1926 | 5.1451 | -0.91% | 0 / 0 |
| EarleyBoyer.Boyer | 81.1169 | 74.3217 | 72.1804 | 70.8812 | -1.80% | 0 / 0 |
| RegExp | 152.9454 | 152.7239 | 153.5504 | 153.4992 | -0.03% | 5,431,996 / 4 |
| Splay | 1.4538 | 1.4669 | 1.3955 | 1.3615 | -2.44% | 0 / 0 |
| NavierStokes | 43.9440 | 42.6952 | 42.6139 | 43.7862 | +2.75% | 0 / 0 |
| PdfJS | 123.4331 | 120.6393 | 120.0320 | 120.2418 | +0.17% | 157 / 3 |
| Mandreel | 1233.3820 | 1156.9303 | 1156.0209 | 1157.3972 | +0.12% | 0 / 0 |
| Gameboy | 226.9138 | 210.8018 | 209.9902 | 214.0760 | +1.95% | 0 / 0 |
| CodeLoad.Closure | 0.4795 | 0.4912 | 0.4894 | 0.4893 | -0.02% | 0 / 0 |
| CodeLoad.JQuery | 8.8014 | 8.9105 | 8.8520 | 8.8772 | +0.28% | 26,624 / 22,016 |
| Typescript | 1540.6784 | 1435.5283 | 1473.2532 | 1456.7921 | -1.12% | 200 / 5 |
| zlib | 5220.1203 | 4794.5364 | 4797.6837 | 4801.9337 | +0.09% | 0 / 0 |

3B 几何平均时间变化：相对 A **-6.1859%**；相对 EVAL_COLD **-0.5040%**；相对 C **+0.2683%**。

### sunspider

| 表项 | A（历史） | EVAL_COLD（历史） | C（旧单轮） | 3B（新单轮） | 3B 相对 C | 新命中 / 回退 |
|---|---:|---:|---:|---:|---:|---:|
| 3d-cube | 14.8912 | 14.2712 | 14.2283 | 14.3286 | +0.70% | 0 / 0 |
| 3d-morph | 11.5679 | 10.9116 | 10.9430 | 11.1332 | +1.74% | 0 / 0 |
| 3d-raytrace | 11.4081 | 11.2670 | 11.3190 | 11.1853 | -1.18% | 0 / 0 |
| access-binary-trees | 9.1886 | 8.5500 | 8.4559 | 8.5229 | +0.79% | 0 / 0 |
| access-fannkuch | 27.7821 | 25.7748 | 25.8176 | 26.2014 | +1.49% | 0 / 0 |
| access-nbody | 10.4995 | 11.0452 | 10.8443 | 10.9996 | +1.43% | 0 / 0 |
| access-nsieve | 14.9587 | 14.7079 | 14.7683 | 14.8174 | +0.33% | 0 / 0 |
| bitops-3bit-bits-in-byte | 6.9940 | 7.1616 | 7.0622 | 7.0507 | -0.16% | 0 / 0 |
| bitops-bits-in-byte | 16.7298 | 17.0508 | 16.7820 | 15.9848 | -4.75% | 0 / 0 |
| bitops-bitwise-and | 6.8071 | 6.5049 | 6.5286 | 6.5017 | -0.41% | 0 / 0 |
| bitops-nsieve-bits | 11.5619 | 11.0754 | 11.0785 | 11.1274 | +0.44% | 0 / 0 |
| controlflow-recursive | 5.0073 | 4.9915 | 4.9927 | 5.0030 | +0.21% | 0 / 0 |
| crypto-aes | 9.9901 | 10.0178 | 9.7208 | 9.7404 | +0.20% | 0 / 0 |
| crypto-md5 | 5.2104 | 4.9782 | 4.9672 | 4.9589 | -0.17% | 0 / 0 |
| crypto-sha1 | 4.7040 | 4.5532 | 4.5359 | 4.5372 | +0.03% | 0 / 0 |
| date-format-tofte | 21.9732 | 22.1187 | 21.7600 | 21.7395 | -0.09% | 0 / 0 |
| date-format-xparb | 16.7536 | 17.0097 | 17.1612 | 17.2308 | +0.41% | 0 / 0 |
| math-cordic | 17.1500 | 17.1881 | 17.1387 | 17.2394 | +0.59% | 0 / 0 |
| math-partial-sums | 8.2638 | 8.2515 | 8.3023 | 8.2985 | -0.05% | 0 / 0 |
| math-spectral-norm | 6.1894 | 6.0590 | 6.0214 | 6.0539 | +0.54% | 0 / 0 |
| regexp-dna | 72.9556 | 72.8541 | 74.5166 | 72.8454 | -2.24% | 0 / 2,304 |
| string-base64 | 10.4522 | 10.4706 | 10.5066 | 10.5891 | +0.78% | 0 / 0 |
| string-fasta | 18.2869 | 17.4477 | 17.5321 | 18.0117 | +2.74% | 0 / 0 |
| string-tagcloud | 19.2558 | 19.2207 | 19.0723 | 19.1670 | +0.50% | 254 / 2 |
| string-unpack-code | 34.3425 | 34.1356 | 34.8423 | 34.6417 | -0.58% | 0 / 0 |
| string-validate-input | 8.9260 | 9.0582 | 9.3026 | 9.1794 | -1.32% | 1,023,998 / 2 |

3B 几何平均时间变化：相对 A **-1.5028%**；相对 EVAL_COLD **-0.0161%**；相对 C **+0.0658%**。
