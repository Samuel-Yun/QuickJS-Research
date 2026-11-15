# 四轮 IC 独立实验结果

四个候选都从同一冻结 C（TRANSITION_EDGE_STRONG）独立派生，未带入 3B、未叠加赢家。每方案 Octane 17 项和 SunSpider 26 项各 **1 个独立新进程**，共 **172 个正式计时进程**，所有原校验通过。没有单独正式复测 C，也没有追加候选正式轮数。

C 引用旧单轮，A/EVAL_COLD/V8_ON --jitless 引用旧 30 次确认中位数；这是**新旧单轮跨批次筛选**，小幅差异不能证明稳定收益。沿用原脚本、N、CPU 2、Asia/Shanghai、Setup/Run 边界，不加 warmup，不改算法、输入或校验，不加 LTO/PGO。单位 ms/完整 Run，负数表示耗时降低。Octane 为 14 suite 分层等权 GM，SunSpider 为 26 项等权 GM。

| 轮次 | 候选 | 实际命中的负载 | Octane 相对 C | SunSpider 相对 C | 主要回退 | 判断 |
|---|---|---|---:|---:|---|---|
| 1 | [GROUP_LOAD_IC](01_group_load/results.md) | DeltaBlue、RayTrace、Boyer、Gameboy、Typescript 等 9 项 | +0.1408% | +0.5706% | 两个 own 数据字段条件/布局失配 | 无明显收益 |
| 2 | [CALL_RECIPE_IC](02_call_recipe/results.md) | DeltaBlue、RayTrace、PdfJS、Typescript | +2.1756% | +2.0622% | 非短字段函数；SunSpider 全部回退 | 无明显收益 |
| 3 | [CONSTRUCTOR_PLAN_IC](03_constructor_plan/results.md) | Earley/Boyer、Splay、TreeNode、Richards、PdfJS、Typescript、nbody | -0.6401% | -2.1063% | 非直线构造、callee/原型/GC/栈等窄守卫 | 保留，优先候选 |
| 4 | [INDEX_CONSUME_IC](04_index_consume/results.md) | Gameboy、math-cordic、bitops-nsieve-bits | -0.2843% | -0.8473% | 浮点/字符串、当前局部类型、边界和溢出 | 保留为次优候选，幅度较小 |

| 候选 | Octane 相对 A | SunSpider 相对 A | SunSpider 26 项耗时之和（ms） | 合计相对旧 C |
|---|---:|---:|---:|---:|
| GROUP_LOAD_IC | -6.3052% | -1.0060% | 398.764685 | +0.1417% |
| CALL_RECIPE_IC | -4.4014% | +0.4622% | 403.539685 | +1.3409% |
| CONSTRUCTOR_PLAN_IC | -7.0359% | -3.6410% | 393.046935 | -1.2942% |
| INDEX_CONSUME_IC | -6.7030% | -2.4016% | 395.415573 | -0.6993% |

第三轮是本批次两个全集都最好的候选：Boyer **72.1804 → 55.9744 ms（−22.45%）**、Earley **5.1926 → 4.5917（−11.57%）**、access-binary-trees **8.4559 → 4.7762（−43.52%）**。它相对原 A 的累计变化是 Octane **−7.04%**、SunSpider **−3.64%**；仍比旧 V8_ON --jitless 的参考 GM 慢约 **54.43% / 39.64%**。四项百分比不能相加，没有自动组合。

所有逐项（每轮 17+26）、无命中/回退和 A/EVAL_COLD/C/V8 参考耗时均在各轮 results.md 与 analysis/*.csv。`analysis/hot_sites.csv` 只是非零命中点的便捷索引，按进程内记录序号区分同名/匿名函数字节码实例；完整计数保留所有点，未用热站点表过滤性能数据。

## 可复现交付

每轮目录包含：

- `release.patch`：相对同一 C 的补丁，四个补丁均已从原 C 实际应用并核对所有源文件 SHA256。
- `source.tar.gz` / `source.sha256`：实测 Release 的完整源码；直接解压到新目录后执行 `make -j2 -o repl.c qjs qjsc`。以这个源码包复现实测版本，构建 manifest 给出逐文件/ELF 哈希。
- `runs/release/{octane,sunspider}/runs.jsonl`：原始正式计时、进程和校验；每项恰好一次。
- `runs/probe*/` / `runs/counts*/`：原始诊断，`runs.jsonl.gz` 是逐字节无损存档。大明文仍保留本机但忽略入 Git；`raw_storage.json` 记录原始/压缩哈希与大小，已完整解压流核对。新检出可先 `gzip -dk runs.jsonl.gz` 恢复标准明文路径。
- `qualification/`：C/Release/counts/ASAN+UBSAN 差分、准备后字节码保存与普通/ROM 加载、活跃命中/回退检查。第三轮另有 GC 环、实际快路 OOM 与中断测试。ASAN leak detection 关闭；没有声称跑过完整 test262。

四轮的运行时记录大小分别为 **40 / 40 / 96 / 16 字节每点**；ReadICSite 都仍为 24 字节。通过已编译对象的 DWARF 确认，每函数字节码头从 C 的 144 增为 160 字节，实际开销 +16；见 layout_sizes.json。这些成本均计入正式 Release。

公共 `build.py`、`qualify.py`、`run_bench.py`、`sequence.py` 保存过程；构建/验证目录防覆盖，现有计时样本再次执行会跳过，不会自动生成第二轮。诊断模板选择、错误修复和失败测试证据均保留；第三轮 OOM 修复前的计数与构建在 `*.before_oom_fix`，不进入最终成绩。第四轮先否定了无覆盖的 add_loc，再选有真实覆盖的 add+put_loc，未扩充第二执行模板。

离线重新汇总：`python3 summarize.py`（不执行基准）。离线核对源文件、补丁、协议、172 个正式进程和压缩存档：`python3 audit.py`（同样不执行基准）。已有原始日志不在当前目录时，先按上述方法解压；完整诊断保存的 ELF/输入绝对路径沿用本仓库环境。四个独立源码包本身可单独解压编译。

`audit.json` 是交付核对结果；`references.json` 给出所有旧对照表、协议和底座包哈希。未自动 push，也未覆盖冻结底座。
