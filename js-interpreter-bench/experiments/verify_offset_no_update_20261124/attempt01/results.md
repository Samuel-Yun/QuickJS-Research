# VERIFY_OFFSET_NO_UPDATE：单槽读 IC 的旧槽验证实验

结果：同槽交替微基准 -11.58%，全集 Octane +0.60%、SunSpider +0.79%。两套整体都没有提速，这版保留为局部实验，不建议替换冻结 SPARSE。

底座：冻结 SPARSE_CTOR_IC / 06aada4。Release 只修改 `read_ic_opcodes.inc`；不改融合入口、构造 IC、字节码编码和 ReadICSite。
CPU 2，Asia/Shanghai，C locale。计数和计时分开；时间来自未插桩 Release。负数表示更快。

## 三组微基准

| 输入 | SPARSE 中位数 ms（范围） | 新版中位数 ms（范围） | 变化 |
|---|---:|---:|---:|
| stable | 3177（3160–3213） | 3188（3170–3230） | +0.35% |
| same_slot | 3784（3778–3792） | 3346（3344–3350） | -11.58% |
| different_slot | 3705（3683–3728） | 3779（3775–3812） | +2.00% |

每组每版 5 个新进程，轮换先后顺序；所有组相同 N，生成对象与序列不计时，首次执行计入。
沿用既有脚手架的 `Date.now()` 包住 `run()`；这些时间包含循环、数组取对象、readX 调用和属性读取。

### 独立计数：每个 readX 位点 65,536 次逻辑读取

| 输入 | 版本 | 融合命中 | 原 shape 命中 | 第二层尝试 | 第二层成功 | 成功/尝试 | 正常查找 | 更新 |
|---|---|---:|---:|---:|---:|---:|---:|---:|
| stable | SPARSE | 65,535 | 0 | 0 | 0 | — | 1 | 1 |
| stable | VERIFY_OFFSET_NO_UPDATE | 65,535 | 0 | 0 | 0 | — | 1 | 1 |
| same_slot | SPARSE | 0 | 0 | 0 | 0 | — | 65,536 | 65,536 |
| same_slot | VERIFY_OFFSET_NO_UPDATE | 32,767 | 0 | 32,768 | 32,768 | 100.00% | 1 | 1 |
| different_slot | SPARSE | 0 | 0 | 0 | 0 | — | 65,536 | 65,536 |
| different_slot | VERIFY_OFFSET_NO_UPDATE | 0 | 0 | 65,535 | 0 | 0.00% | 65,536 | 65,536 |

“第二层成功/尝试”只衡量第二层验证，不是全部读取的命中率。另一个 `readPlain(unused,o)` 使用 arg1，实际字节码没有融合前缀；同样通过三组计数和结果校验，见 `micro_counts.json` 中 plain=true。

## 真实用例：原输入、N 和计时边界

| 表项 | SPARSE 中位数 ms/Run | 新版中位数 ms/Run | 变化 | 新版正常查找 | 新版第二层救回 | 比原版少查找 | 比原版少更新 |
|---|---:|---:|---:|---:|---:|---:|---:|
| RayTrace.RayTrace | 27.8183 | 26.9649 | -3.07% | 14,081,762 | 1,507,584 | 1,100,158 | 1,100,158 |
| Splay.Splay | 1.3382 | 1.3166 | -1.62% | 13,702,466 | 8,644,924 | 6,022,901 | 6,022,901 |
| PdfJS.PdfJS | 119.4747 | 120.5231 | +0.88% | 456,764 | 184,702 | 1,584 | 1,584 |

真实用例每版每项 3 个新进程，交错计时。诊断另跑一次原负载；计数范围是整个脚本（含 Setup/校验），仅统计 keep=0 的读取，不能当成计时区间内的精确次数。静态位点明细见 `target_counts/*.counts.jsonl`。

新增验证成功数不等于净省下的查找数：缓存不再换 shape，一些原本的 shape/融合命中也会转到第二层。例如 PdfJS 的第二层成功 184,702 次，但融合命中少 98,159 次、普通 shape 命中少 84,959 次，净减少的正常查找只有 1,584 次。应看净变化和 Release 时间，不能只看第二层验证成功率。

是否进入全集：至少一个真实用例有第二层成功，且 3 对 Release 新进程中新版均更快，继续同批单轮全集。

## 两套全集：同批次单轮筛选

- octane 整体 GM：+0.60%；最大回退 Gameboy +3.94%。
- sunspider 整体 GM：+0.79%；最大回退 3d-cube +6.36%。

完整逐项表：[Octane](octane.md)、[SunSpider](sunspider.md)。Octane 按 14 suite 分层等权；SunSpider 按 26 项等权。不合并两套分数，不替换默认 SPARSE。

## 新增代码

```c
                if (!keep && site->shape && !site->holder_shape &&
                    site->shape != p->shape && p->shape->is_hashed) {
                    JSShape *sh = p->shape;
                    uint32_t off = site->prop_offset;
                    if (off < sh->prop_count) {
                        JSShapeProperty *desc = &get_shape_prop(sh)[off];
                        if (desc->atom == site->atom &&
                            !(desc->flags & JS_PROP_TMASK)) {
                            val = JS_DupValue(ctx, p->prop[off].u.value);
                            goto name ## _done;
                        }
                    }
                }
```

原 shape 失败后，确认旧槽号仍在范围内、该槽的属性名仍是 x、描述符仍是普通数据属性，就读取当前对象的值。它没有记住第二种 shape，也没有改变第一种 shape 的缓存；省掉的是后续按 atom 查找和 rdi_update 中的 shape 引用增减与记录替换。融合失配和 get_field_rdi 的原 shape 探测都保留。验证失败时继续原完整查找、更新和异常路径。

完整复现：[REPRODUCE.md](REPRODUCE.md)；源码范围与补丁重建检查：[audit.json](audit.json)。
