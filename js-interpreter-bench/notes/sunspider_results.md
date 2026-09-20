# SunSpider 1.0.2 结果

## 研究问题

> 在禁止 V8 JIT tier-up、仅使用 Ignition interpreter 时，当前 upstream QuickJS 与 V8 Ignition 的 JavaScript 执行性能差异是多少？

本文件只报告实验输入、方法和测量结果，不解释性能差异的原因。

## 来源与版本冻结

| 项目 | 固定值 |
|---|---|
| Benchmark | SunSpider `1.0.2` |
| 官方 repository | <https://github.com/WebKit/WebKit> |
| 固定 commit | [`fd3406f133a4e56d7aaf399ba5611ae44b8da7e9`](https://github.com/WebKit/WebKit/commit/fd3406f133a4e56d7aaf399ba5611ae44b8da7e9) |
| 官方目录 | [`PerformanceTests/SunSpider/tests/sunspider-1.0.2`](https://github.com/WebKit/WebKit/tree/fd3406f133a4e56d7aaf399ba5611ae44b8da7e9/PerformanceTests/SunSpider/tests/sunspider-1.0.2) |
| 获取日期 | `2026-09-20` |
| Upstream 保存目录 | `benchmarks/sunspider/upstream/sunspider-1.0.2/` |
| Standalone workload | `benchmarks/sunspider/standalone/sunspider-1.0.2/` |

官方目录中的 26 个 `.js` cases 和 `LIST` 均已固定。下载后逐文件计算 Git blob SHA-1 并与 GitHub 官方 API 返回值核对；本项目另外保存全部文件的 SHA-256：

- [`SHA256SUMS.upstream.txt`](../benchmarks/sunspider/SHA256SUMS.upstream.txt)，文件自身 SHA-256：`bbe7f444daea654cac808800081ecaab7b30a749d72ef6071fe248229c193790`。
- [`SHA256SUMS.standalone.txt`](../benchmarks/sunspider/SHA256SUMS.standalone.txt)，文件自身 SHA-256：`e383efe54a39e8c18010135390ce2fc98c2618f55bc5078f43fc45c3a8ef98fd`。

运行脚本在 correctness 和正式计时前都会重新核对两个 manifest、全部 workload 文件、patch、两份 engine binary 及其 data/runtime 依赖的 SHA-256。它不会下载、更新或重新构建任何内容。

## Cases

官方 `LIST` 中共有 26 项：

1. `3d-cube`
2. `3d-morph`
3. `3d-raytrace`
4. `access-binary-trees`
5. `access-fannkuch`
6. `access-nbody`
7. `access-nsieve`
8. `bitops-3bit-bits-in-byte`
9. `bitops-bits-in-byte`
10. `bitops-bitwise-and`
11. `bitops-nsieve-bits`
12. `controlflow-recursive`
13. `crypto-aes`
14. `crypto-md5`
15. `crypto-sha1`
16. `date-format-tofte`
17. `date-format-xparb`
18. `math-cordic`
19. `math-partial-sums`
20. `math-spectral-norm`
21. `regexp-dna`
22. `string-base64`
23. `string-fasta`
24. `string-tagcloud`
25. `string-unpack-code`
26. `string-validate-input`

## Browser-only API 与 standalone patch

源码扫描发现：

- `date-format-xparb.js` 的 `getWeekOfYear()` 中直接执行 `document.write(then)`；standalone shell 没有 `document`。
- `3d-raytrace.js` 中另有一次 `document.getElementById` 文本，但它只是被拼接进输出字符串的 canvas 示例代码，不会由 benchmark 执行，因此没有删除。
- 未发现其他实际执行的 `window`、`document`、timer、XHR 或 shell-specific API。

完整修改保存在 [`sunspider-1.0.2-standalone.patch`](../patches/sunspider-1.0.2-standalone.patch)，SHA-256 为 `82ef95ca6a1c7728d2f6b651eaefba6df6765d2f522ef5d7f49127821a40ccb7`。仅有两处修改：

1. 删除 `date-format-xparb.js` 的 `document.write(then)`。它是浏览器输出副作用，不参与返回值或后续计算。
2. `3d-raytrace.js` 的原始正确性哨兵只接受生成字符串长度 `20970`。首次运行中 V8 得到 `20970`，QuickJS 得到 `20969`；两者均完成 workload。standalone patch 将哨兵限定为只接受 `20969` 或 `20970`，其他长度仍抛错。首次 51/52 记录保存在 `results/raw/sunspider_correctness_attempt1_upstream_sentinel.csv`。

除 `3d-raytrace.js` 和 `date-format-xparb.js` 外，其余 24 个 `.js` cases 与 `LIST` 的 upstream/standalone SHA-256 完全相同。两引擎运行同一个 standalone 目录，没有 engine-specific workload 分支。

## Correctness gate

正式计时前，每个 engine/case 各运行一次，共 52 次。有效条件为：退出码 0、stdout 为空、stderr 为空；原 benchmark 内置的错误检查仍会通过抛异常令进程失败。

最终结果：`PASS 52/52`。原始记录为 [`sunspider_correctness.csv`](../results/raw/sunspider_correctness.csv)，SHA-256：`0a4e34dbc499456ac7fd079328141104f68f9e2b77bb96424ad0e63c1b9e330b`。

## 固定 engines 与命令

QuickJS：

```text
C:\Users\mzyx\Desktop\0921\js-interpreter-bench\engines\quickjs-upstream\qjs.exe <case>.js
```

- SHA-256：`6ef16219978ed1cf7d6590b9c9603c65874ad30ac465c67e5fb819da8786b573`。
- 不带额外 runtime flags。

V8 Ignition-only：

```text
C:\Users\mzyx\Desktop\0921\js-interpreter-bench\engines\v8-official-15.6.21\runtime\d8.exe --snapshot_blob=C:\Users\mzyx\Desktop\0921\js-interpreter-bench\engines\v8-official-15.6.21\runtime\snapshot_blob.bin --max-opt=0 <case>.js
```

- SHA-256：`1808fe93e1838ba0a0489363fddb1a0399da99c533f537c39b621e4a55cf7d87`。
- `V8_FLAGS=("--max-opt=0",)`；没有增加、删除或覆盖已验证的 interpreter-only flag。

## 正式实验方法

运行脚本：[`scripts/run_sunspider.py`](../scripts/run_sunspider.py)。

```powershell
python .\scripts\run_sunspider.py correctness
python .\scripts\run_sunspider.py benchmark --iterations 30
```

- Python：`3.11.4`。
- 计时器：`time.perf_counter_ns()`。
- 每个样本启动一个全新的 engine 进程；时间边界从调用 `subprocess.run()` 前到进程退出后，因此包含进程启动、解析/编译、执行和退出时间。
- 每个 engine/case 恰好 30 个正式样本，共 `26 × 2 × 30 = 1560` 行。
- correctness run 不计入这 30 个样本。
- 每轮用固定 seed `20260920` 随机打乱 case 顺序。
- 对每个 case，engine 先后顺序逐轮反转；QuickJS 与 V8 各有 15 次先运行、15 次后运行。
- 所有 1,560 个样本退出码均为 0 且 `valid=true`。
- 没有删除、修剪、winsorize 或替换任何 outlier。

原始数据：[`results/raw/sunspider.csv`](../results/raw/sunspider.csv)，SHA-256：`1e27d75a7d38ab48d5fd3a8b30b8d29b4c47b9ba648a9f080fd10ee3b968df82`。

## 统计定义

处理结果：[`results/processed/sunspider_summary.csv`](../results/processed/sunspider_summary.csv)，SHA-256：`dc558feca2607d416189f17d5509d95d2ae9f73de30bd02967f75f21350184dc`。

每个 engine/case 使用全部 30 个样本计算：

- `median`：中位数；
- `mean`：算术平均；
- `stddev`：sample standard deviation，分母为 `n-1`；
- `IQR`：排序后下半 15 个值与上半 15 个值各自中位数之差；
- `min` / `max`：全部样本的最小值和最大值；
- `V8 / QuickJS ratio`：`V8 median_ns / QuickJS median_ns`。

完整六项统计以纳秒保存在 summary CSV。下表将 median 换算为毫秒，仅用于阅读：

| Case | QuickJS median (ms) | V8 median (ms) | V8 / QuickJS |
|---|---:|---:|---:|
| `3d-cube` | 41.528 | 60.560 | 1.458 |
| `3d-morph` | 33.782 | 59.759 | 1.769 |
| `3d-raytrace` | 26.152 | 56.594 | 2.164 |
| `access-binary-trees` | 22.304 | 43.678 | 1.958 |
| `access-fannkuch` | 46.531 | 73.396 | 1.577 |
| `access-nbody` | 25.551 | 56.084 | 2.195 |
| `access-nsieve` | 34.308 | 48.278 | 1.407 |
| `bitops-3bit-bits-in-byte` | 20.193 | 45.346 | 2.246 |
| `bitops-bits-in-byte` | 29.663 | 56.261 | 1.897 |
| `bitops-bitwise-and` | 21.799 | 49.819 | 2.285 |
| `bitops-nsieve-bits` | 23.460 | 61.743 | 2.632 |
| `controlflow-recursive` | 18.623 | 44.168 | 2.372 |
| `crypto-aes` | 25.830 | 55.083 | 2.133 |
| `crypto-md5` | 18.049 | 47.588 | 2.637 |
| `crypto-sha1` | 17.233 | 48.381 | 2.808 |
| `date-format-tofte` | 41.636 | 48.675 | 1.169 |
| `date-format-xparb` | 31.913 | 44.941 | 1.408 |
| `math-cordic` | 32.374 | 57.533 | 1.777 |
| `math-partial-sums` | 29.105 | 51.074 | 1.755 |
| `math-spectral-norm` | 19.320 | 46.771 | 2.421 |
| `regexp-dna` | 92.660 | 42.163 | 0.455 |
| `string-base64` | 33.227 | 45.233 | 1.361 |
| `string-fasta` | 36.895 | 49.787 | 1.349 |
| `string-tagcloud` | 39.332 | 49.744 | 1.265 |
| `string-unpack-code` | 73.265 | 50.286 | 0.686 |
| `string-validate-input` | 24.360 | 47.096 | 1.933 |

本阶段只形成测量结果，不对上述差异作因果解释。
