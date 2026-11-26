# QuickJS 下一轮 IC 实验

固定提交为 `myx@abee864f4e50b7aa088b5e14da0e8e3353d333bd`，补丁的底座或父版见下表。新实验使用冻结 SPARSE。这样可以回答这个机会在 RayTrace 专项优化之外能否独立成立。本包保留本地小规模结果，便于在实验室机器上重测。原仓库的最新提交、默认引擎和 benchmark 源文件均无改动。

| 文件 | 用途 |
|---|---|
| instanceof-slot.patch | 从冻结 SPARSE 派生。本地 pilot，同一 ELF 可切换 off、direct、cached。 |
| octane-census.patch | 从冻结 SPARSE 派生。统计 OP_instanceof、实际内置 hook、内置 Function.prototype.call 等机会。 |
| instanceof-counts.patch | 在 instanceof-slot.patch 之上应用。只供诊断，统计真正走到两个短路出口、槽验证成功和槽填充的次数。 |
| call-sites.patch / call-sites.csv | 在 octane-census.patch 之上应用；按实际 PC 和源位置统计 DeltaBlue / Typescript 经内置 call 进入 JS 函数的次数。 |
| census.csv | 原 N、原 Run 区间、17 个 Octane 表项的机会统计。 |
| pilot-hits.csv | 缓存版诊断，Boyer N=32、Earley N=512、PdfJS N=16。 |
| timing.csv / summary.md | 五轮、每轮四种版本、三个表项，原始时间与摘要。 |
| bench.py / collect.py / semantics.js | 四版交错计时、独立计数及针对性语义对照。 |

## Pilot 的机制

对每个 `instanceof` 保留原有的 `@@hasInstance` 读取，getter 原样调用一次。确认当前读到本 realm 的内置 hook、右侧是普通字节码函数后，原始值左操作数直接返回 false；普通对象左侧的直接原型等于右侧当前 `.prototype` 时直接返回 true。其它情况仍走原入口，用刚才读出的 hook。真实 VM 内的 `JS_IsInstanceOf` API 调用继续走原路，只有字节码 handler 传入位点。

- `off` 走普通行为，保留新版解释器布局。另有一份原样编译的 SPARSE。
- `direct` 每次按名查右侧的普通自有 prototype 数据属性。两条快捷返回均可用。
- `cached` 在 direct 上增加由执行 PC 标记的 64 项直接映射表，每项只存 PC 编号与上次的 prototype 槽号。用当前 shape 的槽数、atom 和属性类型验证槽，再读取当前构造函数的值。它不持有旧对象，不保存上次的布尔结果。这是对“缓存槽还能额外省多少”的单独干预。表在 runtime 内，此 x86-64 实现的 64 条记录共 1 KiB，所有候选模式布局相同。

诊断字段 `default_primitive_lhs` 和 `default_direct_proto` 描述读取到默认 hook 的机会。前者没有限定 RHS 类别，后者允许原生构造函数；正式 pilot 还要求普通字节码函数等条件。请用 pilot-hits.csv 的 `primitive_fast` 和 `object_fast` 报告实际快捷返回。`slot_hits` 计槽位验证通过，即使后续直接原型比较失败也可能递增。`builtin_call_all` 是真实进入内置 call 的计数，`call_method_target_JS` 限于普通或冷字节码目标、字节码方法调用入口。

## 在实验室 Linux 上复现

在指定提交的仓库根目录执行。将本压缩包解压到一个目录，设置 `bundle`。其余生成文件均在临时实验目录。使用 GNU make、C 编译器和 Python 3。

```bash
bundle=/absolute/path/to/unpacked-bundle
scripts="$PWD/js-interpreter-bench/experiments/native_confirmation_20261108/attempt02/scripts"
preload="$PWD/js-interpreter-bench/on_demand_ctor_cache/tests/support/zlib_read.js"
work=$(mktemp -d)
for mode in sparse pilot census hits callsites; do
    mkdir "$work/$mode"
    git archive HEAD:js-interpreter-bench/on_demand_ctor_cache/modified | tar -x -C "$work/$mode"
done
(cd "$work/pilot" && patch -p1 < "$bundle/instanceof-slot.patch")
(cd "$work/census" && patch -p1 < "$bundle/octane-census.patch")
(cd "$work/callsites" && patch -p1 < "$bundle/octane-census.patch" && patch -p1 < "$bundle/call-sites.patch")
(cd "$work/hits" && patch -p1 < "$bundle/instanceof-slot.patch" && patch -p1 < "$bundle/instanceof-counts.patch")
for mode in sparse pilot census hits callsites; do
    make -s -C "$work/$mode" -j4 -o repl.c qjs
done
"$work/sparse/qjs" --script "$bundle/semantics.js"
for mode in off direct cached; do
    QJS_INSTANCE_MODE="$mode" "$work/pilot/qjs" --script "$bundle/semantics.js"
done
python3 "$bundle/collect.py" --kind census --engine "$work/census/qjs" --scripts "$scripts" --zlib-preload "$preload" --out "$work/census.csv"
python3 "$bundle/collect.py" --kind instance --engine "$work/hits/qjs" --scripts "$scripts" --zlib-preload "$preload" --out "$work/hits.csv"
python3 "$bundle/collect.py" --kind calls --engine "$work/callsites/qjs" --scripts "$scripts" --zlib-preload "$preload" --out "$work/call-sites.csv"
python3 "$bundle/bench.py" --sparse "$work/sparse/qjs" --candidate "$work/pilot/qjs" --scripts "$scripts" --out "$work/timing.csv" --cpu 2
```

## 可以直接交给 Codex 的三项任务

### 1. 缓存 instanceof 的默认 hook 解析

以本包 cached、direct 和原 SPARSE 为对照。在 `OP_instanceof` 的具体 PC 学习当前 RHS 和 `@@hasInstance` 的普通数据属性解析路径。优先针对同一个普通 JS 构造器；命中时用已验证的默认 hook 跳过按名查找，再复用已验证的直接原型/原始值动作。允许 RHS.prototype 在同一布局下换值，读取其当前槽；首次实验不缓存任意深度的 false。对于可能原地变化的 unhashed prototype，单凭 shape 地址相同不足以说明属性路径仍有效。选择一种紧凑的依赖失效方案，在遮蔽/删除/改描述符/换链时重学；如果缓存 hook 值，也覆盖普通数据槽的同形换值。getter 交还原入口。让没出现 instanceof 的函数不申请记录。区分当前的槽提示命中、真正跳过的 hook 查找，以及省下的内置调用。固定原 N，至少在 Boyer、Earley、PdfJS 和一个零覆盖用例进行同批交错复测。计数版与计时版独立。目标是拆开三笔收益：省内置帧、缓存 prototype 槽、缓存 hook 解析。先别把它们捆成一个数字。

### 2. 把父类方法的 .call 适配缓存于调用位点

从 SPARSE 独立派生。本包已经列出 DeltaBlue 的 8 个和 Typescript 的 59 个实际调用位置。前者 BinaryConstraint 的第 745 行执行 102,400 次，基类 Constraint 只做 this.strength = strength；后者第 1342 行 _super.call(this) 执行 154,788 次，第 16778 行调用的 Token 构造体只做 this.tokenId = tokenId。先补目标身份稳定性与类型分布。针对集中且稳定的位点，在实际调用 PC 缓存“内置 Function.prototype.call + 普通 JS 目标 + 参数窗口”的动作。命中时用第一个参数作为 this，其余参数保持原数组上的连续窗口；减掉可以归因的原生中间帧。参数求值之后检查已求得的 callee，避免再次读取属性。先以可重用的最小形态试验，同名自定义 .call 正常执行。对于会观察调用栈的目标，应保留可观察的 native 帧语义，或先把原型限定在可以证明不会观察该帧的目标。拿“仅识别内置身份、无位点学习”的直接分派和普通 SPARSE 双重对照。记录省掉的 native 调用和总耗时；没有复制 argv 的地方不要记作省了一次复制。第二个变体在第一个动作之上缓存“普通基类赋一个参数给已有 receiver”的配方。先支持一个字段，保留数据槽/新增字段的原写语义；父类函数身份变化时重新学习。在 receiver 上执行写操作，不能创建新对象。第一轮只比较 SPARSE、直接分派、位点参数适配 IC、适配加字段配方，防止把整段父类调用省下的成本误归于 .call 身份比较。各 PC 是否持续命中同一个 target 仍须实测。

### 3. 让已有构造计划能引用子构造计划

从 NUMERIC_PLAN 独立派生。先把 RayTrace 四个外层 `new` 位点的拒绝细分出实参数量；分别处理两实参普通直接字段转发，以及零实参 wrapper 的 initializer 中存在一次 `this.field = new G(...)` 的形态。重点检验第二种。在父位点记录 outer ctor、initializer、最终布局与子 `new` 位点的现有计划；子目标仍从当前绑定解析，结果每次都要是新对象。不要按 JS 名字启用。第一版保留两次对象创建及对象可观察身份、原求值/分配顺序。遇到可调用 getter 的动态解析，在副作用前回到原路，或让父计划在已完成的子调用后从准确位置继续。比较 NUMERIC_PLAN、仅有父记录但子构造走原路、组合命中三者。报告父/子分别省的解释帧、父对象已物化次数、每个 PC 覆盖和耗时。子 Color 的数百万次已有命中不计入新增收益。探索更广覆盖时先扫描相同形态在其它 suite 是否真实执行。
