# H：受限直接一层 prototype data 读取

这是独立 attempt。当前完成状态以 `completion.json`（最终交付时生成）和
`analysis_performance/audit.json` 为准，脚本存在不代表已经执行。
准入阶段的不可变快照在 `analysis/audit.json`，其中 H 尚未构建的状态
仅描述当时，不是最终状态。不覆盖之前任何 attempt、raw 或冻结 runtime。

## 问题和范围

从原 M 单槽逐最终读点缓存出发，只增加受限一层继承数据属性。正式
对照为 A/M/H；不运行 V8、JSC 或全 Octane，不外提方法，不引入 PIC/R。
三版在同一 Windows 主机的 Ubuntu24.04.2 WSL2/x86_64 内运行。
准备阶段可能有多个 WSL boot；正式轮块必须同一 boot，并逐条记录。
环境、电源/频率及宿主后台未知项见 `environment.json`、raw/commands。

准入已真实完成：原 Richards 三处均为直接一层、普通对象/data、两边
hashed，N1/N2 均全部合格。计数和组合分母在
`analysis/admission_sites.csv`、`analysis/admission_combinations.csv`。
它不预测收益。`protocol.json`、`measurement_contract.json` 为冻结规则。

## 实现身份

- A upstream `04be246001599f5995fa2f2d8c91a0f198d3f34c`，冻结 ELF
  SHA256 `584335adb82c6052395e5a9526ca1be05480d5d8e60469fd14403156b62a8dd1`。
- M 原有 own-only 单槽，不含 R/SW，冻结 ELF SHA256
  `7b6fa1e896e31988b9d8a5276581477776fbd01ab079a64394b6111def7d87ef`。
- H 的真实 ELF/源码/补丁 SHA 见 `H_manifest.json`。正式源码只改变
  `read_ic_types.h`、`read_ic_runtime.inc`、`read_ic_opcodes.inc` 和
  `quickjs.c` 的 holder-shape GC 边；完整差异 `patches/M_to_H.patch`。
  原 M Makefile/config/prepare/序列化实现不变。
- GCC13.3.0，原 `-O2 -g -fwrapv`，保留断言，无新增 LTO/PGO/NDEBUG/
  frame-pointer/padding。实际编译链接命令保留在 build_H_release.json。
- 非 NULL `holder_shape` 表示继承项；同时比较 receiver shape 与当前
  直接 holder shape，读取当前 prop 数组中的值，不缓存函数值/prop 指针。
  两个新 shape 先保活，再释放旧项；每条持有边独立 mark/free。

## 已执行入口与记录

在本目录，Python3 标准库。WSL 命令是 `python3 -B`，Windows 重算可用
`python -B`。以下命令仅描述本次执行流程，**不要在已完成 attempt 中
重跑采集**；入口拒绝覆盖旧 raw，构建放 `/home/mzyx/prototype_ic_h_attempt01`。

```sh
python3 -B run.py build
python3 -B run.py run
python3 -B run.py analyze
python3 -B build_h.py
python3 -B test_h.py semantic
python3 -B test_h.py lifecycle
python3 -B test_h.py sanitizer
python3 -B mechanism.py build
python3 -B mechanism.py run
python3 -B mechanism.py internal
python3 -B mechanism.py cow_oom
python3 -B campaign.py prepare
python3 -B campaign.py timer
python3 -B campaign.py calibration
python3 -B campaign.py formal
python3 -B analyze.py --output analysis_performance
python3 -B audit_evidence.py
python3 -B close_identity.py
# Windows/native or Linux: metadata and delivery closure, no engines
python -B finalize.py
```

最初失败的测试/覆盖假设及编译记录没有删除；原因与恢复见
`correctness/failure_01.md` 到 `failure_04.md`。首版 lifecycle.js 是保留的
失败测试，正式回归使用 lifecycle_v2.js；不要把前者失败计作 H 回归。
构建请求曾因审批服务中断，恢复及预算口径见 `interruption.md`。

## 正确性和机制

`correctness/semantic.csv` 为严格/非严格两模式、8 场景、A/M/H、N1/N2
的 96 个进程。严格声明真正位于 directive prologue，且有独立 this
断言确认模式。预期来自独立 expected.json，不取某个引擎输出作真值。

H 专用回归覆盖 holder 删除/重插、data/getter、函数变非函数、重入和
异常、结构/链变化、own/继承切换、循环持有关系；上游 make test、
现有 192 个 OOM 编译限额、1800 个 GC 循环、ASan/UBSan、热字节码
跨 A/M/H copy/ROM 加载和嵌入见各 `*_gate.json`。
内部 C 检查直接确认修改前继承命中、合法 unhashed 状态拒绝缓存、
重载缓存为空再填充；大 shape COW 限额失败另有 32 次检查。

`mechanism_sites.csv`、`cache_memory.csv` 是独立 M/H 诊断，不是性能。
全部 5 个 workload 各 N1/N2，另有 14 个语义覆盖与 lifecycle 诊断。
计数是全诊断进程；注册的源码函数按 source SHA/instance/final PC 关联，
未注册预编译/加载函数不能凭零值宣称无工作。内部加载测试显式注册
loaded bytecode，仅服务该测试。每次诊断 shape 边增减及数组活跃字节
归零；请求缓存字节不等于间接保活内存，更不等于 RSS。此轮不量 RSS。

## 性能口径

五个固定原工作负载，微案例每完整 Run 含4096轮；Richards 为原完整
Run，原断言不改。三版同一脚本/输入/N，native performance.now 内部
计时 N 次 Run，首次调用包含在内，没有计时前 workload 预跑。Setup、
静态加载/编译、最终驱动验证/输出在外；GC/helper/原断言在内。
重复会使缓存和状态演化，不称每次全冷、不称查找 self-time。

每版3个独立 pilot 均至少1s才冻结共同 N；低于门槛的正式样本照留。
30个15进程完整块，固定 seed20261029；每案例六排列各5次，每条件
每位置10次，各案例每位置6次。450是目标，不以脚本或计划冒充实际数。
没有自动重试失败、删 outlier、CI驱动追加。正式性能不含诊断/trace。

## 只重算公开 raw（不需要旧 ELF）

在新输出目录执行，不打开任何 `/home` 或 `/mnt` runtime：

```sh
python -B run.py analyze --output replay_admission_new
python -B analyze.py --output replay_performance_new
```

描述统计：内部ms/Run与外部ms/process分开。Q1/Q3为上下半段中位数，
样本标准差分母n-1；ratio为H/M、H/A、M/A，<1分子更快。
10000次固定seed bootstrap以完整15进程块为共同重采样单位，只用完整
块计算配对比值，报告探索性95%线性百分位区间。跨1是方向不明确，
不证明等效，不做总体GM/官方分数，不相减中位数推导初始化或miss成本。

## 恢复源码 / 新 campaign

旧固定源码可由 `legacy_ng_ic_slotfix/attempt01/recovery/sources/base.tar.gz`
及 `read_ic_mic/attempt01/patches/A_to_common_M.patch` 恢复；许可证与来源
沿用其清单，不需要 bare history。当前源树逐文件SHA在 manifest.json。
先审计当前源与冻结 M，再复制到新的空 build 目录，应用 M_to_H.patch；
H 的实现文件也独立保存在 implementation/，用于核对，不替换冻结 M。
精确 ELF 受路径、GCC及布局影响；新构建须登记新身份，不能改旧哈希。

新运行必须新 attempt/STORE 和 manifest，保留原实际路径作为来源。
本轮不提供一个静默重用旧 raw 的“重跑全部”开关。
新 authored 文本 UTF-8/LF；复制旧输入的原字节SHA与LF规范化SHA分开。
新生成 shared scripts 保留旧输入字节片段，用 `.gitattributes -text`
防止 Git 换行转换破坏已记录的 script SHA；不是在算法中做平台特化。
诊断 gzip 的压缩/解压SHA在旁边 identity.json；恢复请输出到新的空路径。
ELF、对象、完整编译树只留构建区，不纳入普通 Git。
