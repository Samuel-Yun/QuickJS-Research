# Octane strict：组会更新

状态：PASS；13 suites / 16 subbenchmarks；960/960有效正式samples。
QJS lower 1，V8 lower 12，tie 0；V8/QJS GM 0.498093。
旧0.510 / 0.494 → strict 0.498093。

| Octane measurement | QJS lower | V8 lower | V8/QJS GM |
|---|---:|---:|---:|
| Fixed-work source-to-finish | 1/13 | 12/13 | 0.510 |
| Native internal per-call | 1/13 | 12/13 | 0.494 |
| Strict interpreter-mode | 1/13 | 12/13 | 0.498093 |

谨慎结论：在提前完成主要静态frontend、不做性能warmup且JS限制在Ignition的当前Octane strict交集上，V8 在 12/13 个 suite 的聚合 median ratio 较低，方向与旧 Octane 主体一致。不能据此归因于dispatch或计算frontend占比。
限制：仍包含GC/builtin/regexp/动态编译及运行期状态；不是纯interpreter-loop self time。旧模式10reps，新30reps，聚合次序及颗粒度略有不同。
