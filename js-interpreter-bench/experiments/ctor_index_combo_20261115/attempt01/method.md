# 第三轮 + 第四轮：CTOR_INDEX_COMBO

已从冻结 C 独立合并第三轮 CONSTRUCTOR_PLAN_IC 和第四轮 INDEX_CONSUME_IC，编译、验证并完成完整 Octane 17 项 / SunSpider 26 项。**每项一个新进程，正式只跑一轮**，43 项原校验均通过。没有重新正式计时 C、第三轮、第四轮、A 或 V8；它们全部沿用已保存的参考成绩。

本轮结论：**Octane 有微小额外收益，SunSpider 没有叠加成功；目前仍优先保留单独第三轮。**

| 方案 | Octane GM 相对 C | SunSpider GM 相对 C | SunSpider 26 项时间之和（ms） |
|---|---:|---:|---:|
| 第三轮（旧单轮） | −0.6401% | −2.1063% | 393.046935 |
| 第四轮（旧单轮） | −0.2843% | −0.8473% | 395.415573 |
| 3+4（新单轮） | **−0.8292%** | **−0.3424%** | **396.418533** |

组合相对第三轮：Octane **−0.1903%**，SunSpider **+1.8019%**；相对第四轮分别 **−0.5464%、+0.5092%**。相对原版 A 的累计变化为 **−7.2128%、−1.9046%**。若仅以两个旧候选的比例相乘作独立效果参考，则为相对 C −0.9226% / −2.9357%；这是比较用的假设值，不是可保证达到的目标，不能把两项百分比相加。

## 实现

来源是前轮实测并已发布的两个源码包，构建时核对各自 source archive SHA256 和逐文件 manifest：

- `ic_four_rounds_20261115/attempt01/03_constructor_plan/source.tar.gz`
- `ic_four_rounds_20261115/attempt01/04_index_consume/source.tar.gz`

没有使用其它方案或引入 3B。构造运行时 helper 与第三轮逐字节相同，保留原型链描述符检查、初始/最终 shape 强引用、callee 身份、GC/栈/中断守卫及 OOM 异常保活修复。索引 helper 只重命名记录类型和旁表字段，保留当前 backing store/长度、整数和溢出、receiver 所有权及所有原回退条件。

合并位置见 `build.py`、实测 `work/release/quickjs.c` 和 `release.patch`。主要整合是：

1. 函数字节码分别保存 ctor 与 index 两组记录；index move-to-front 不会搬动或覆盖 ctor 记录。
2. 继续共用原 rdi_prepare 的一次执行镜像分配，布局为 code → ReadICSite → ctor 记录 → index 记录；两类记录均先计入容量，先准备 ctor，再按实际 ctor 数定位 index 区域。
3. 加入两个互不冲突的内部 opcode；原指令长度、保存/加载恢复及非法外部入口拒绝规则一并保留。
4. 原 GC mark/free 遍历 ctor 强引用；index 记录仍只有整数/类别等元数据，没有数组/数据指针保活。

DWARF 核对：JSFunctionBytecode 为 **176 字节**，对比 C 的 144 和两个单独候选的 160，分别多 32 / 16 字节；ctor 记录仍 **96 字节/点**，index 仍 **16 字节/点**，ReadICSite 仍 24 字节。所有函数头和记录开销都在实测中，未添加 LTO/PGO 或额外优化。

## 验证和实际覆盖

原 C、组合 Release、独立 counts、ASAN/UBSAN：第三轮和第四轮原语义用例输出均一致，包含 setter/只读属性/换构造器和原型、Proxy、自定义返回对象/this 逃逸回退、数组空洞/浮点/字符串/BigInt/溢出/越界、TypedArray resize/detach 等。

新增同一个函数同时构造对象并消费数组的用例；独立计数证明两条快路**各命中 2,000,511 次**，各首次学习回退 1 次，结果与 C 相同。这个用例的预热后字节码保存、普通加载和 ROM 加载也全部通过。另重跑 GC 环、真实快路 OOM、interrupt 检查，均与 C 一致。ASAN leak detection 关闭，未跑完整 test262。

正式基准之外，用独立计数构建跑相同 43 项 / 原 N / 原 Run 区间，按每点原入口 opcode 分开统计：

| 路径 | 尝试 | 实际命中 | 回退 | 学习填充 |
|---|---:|---:|---:|---:|
| 构造计划 | 49,231,038 | 24,218,118 | 25,012,920 | 928 |
| 索引消费 | 36,700,864 | 4,511,117 | 32,189,747 | 3 |

索引消费的三个实际命中负载及命中数保持：Gameboy 1,310,735，math-cordic 3,199,999，bitops-nsieve-bits 383。构造路径 Boyer 8,211,289 / Splay 982,620 等也保留；计数版中 access-binary-trees 构造命中变为 10,558,564（旧第三轮计数为 3,870,071）。

**计数与 Release 必须分开解释。** TreeNode 在计数构建里命中更多，Release 耗时却比旧第三轮高；两种构建的记录尺寸、布局与分配/GC 时机不同，本轮没有直接测量同一个 Release 二进制的逐守卫分布，因此不能用这个计数证明 Release 的 TreeNode 命中率也提高，更不能将其解释成“命中更多却必然更慢”。也没有完成足够的归因实验来区分布局/GC、代码生成和跨批次环境影响。已保存这一不一致，不临时放宽守卫或加第二个优化救成绩。

## 重点逐项对照

| 表项 | 第三轮旧 ms | 第四轮旧 ms | 组合新 ms | 组合相对第三轮 |
|---|---:|---:|---:|---:|
| Earley | 4.5917 | 5.1390 | 4.5882 | −0.08% |
| Boyer | 55.9744 | 71.1880 | 57.2369 | +2.26% |
| Splay | 1.3586 | 1.3599 | 1.3270 | −2.33% |
| Gameboy | 209.7584 | 209.1846 | 211.3133 | +0.74% |
| access-binary-trees | **4.7762** | 8.1391 | **8.6764** | **+81.66%** |
| math-cordic | 17.0436 | 16.8929 | 16.8053 | −1.40% |

尤其不能把 Octane 小幅 GM 改善直接当作 Gameboy 索引消费收益：Gameboy 本次反而高于两个旧候选。SunSpider 的主要回退来自 access-binary-trees，第三轮的这一大项优势没有保留。本轮只据此判断组合未全面胜过第三轮，不宣称微小差异有统计显著性。

## 协议、原始数据和复现

沿用 `native_confirmation_20261108/attempt02` 的脚本、输入、固定 N、CPU 2、Asia/Shanghai、Setup/Run 计时边界和所有原校验。没有新增 warmup、重试、剔除样本或重跑旧版。时间单位为 ms / 完整 Run，负数更快。Octane 为 14 suite 分层等权 GM，列全 17 项；SunSpider 为 26 项等权 GM，并另列逐项时间之和。

本次与 C、第三轮、第四轮的比较是**新旧单轮跨批次筛选**。A/EVAL_COLD/V8_ON --jitless 为之前 30 次确认的中位数，详细值在 CSV 中。

- `release.patch`：相对冻结 C；`R3_to_combo.patch`：相对实测第三轮；两者均实际应用并逐文件核对。
- `source.tar.gz` / `source.sha256`：完整实测 Release 源码，解压到新目录后执行 `make -j2 -o repl.c qjs qjsc`。
- `runs/release/{octane,sunspider}/runs.jsonl`：43 个新进程的原始计时和校验；对应 `runs/counts/` 为独立诊断，时间不进入正式成绩。
- `qualification/gate.json` 和原始记录：同函数共存、原语义差分、所有权/OOM/中断/ROM 验证。
- `analysis/{octane,sunspider,coverage}.csv`：完整时间对照和全部回退；`analysis/summary.json`：聚合数据。

`python3 analyze.py` 只重新汇总已保存数据；`python3 package.py` 只核对并打包，不执行基准。`build.py` 构建目录防覆盖；`python3 sequence.py release` 会跳过本次已完成项，新的正式实验应开新 attempt。原两候选和冻结 C 均保留，未自动 push。

下面给出两套全部逐项表，所有未命中和退化项均保留。
