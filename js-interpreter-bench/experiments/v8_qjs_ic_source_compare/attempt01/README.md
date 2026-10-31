# V8 与 QuickJS M/P：own 字段与继承方法的 IC 源码对照

本轮是源码阅读、旧证据离线复核及 **48 个有界语义正确性进程**。没有性能采样、VM 优化补丁、V8 重建、OFF 对照、P/R 新运行或新 profiler。结果见 [results.md](results.md)，一个待验证设计见 [candidate.md](candidate.md)。

## 阅读顺序

1. [results.md](results.md)：共同点、最具体的差别和结论边界。
2. [ic_comparison.md](ic_comparison.md) / [CSV](ic_comparison.csv)：逐项对应代码与真实位点。
3. [own_path.md](own_path.md)、[prototype_path.md](prototype_path.md)：执行步骤、单位、所有权和原型修改保护链。
4. [candidate.md](candidate.md)：只选择“受限直接一层原型数据读取”一个候选；本轮未实现。
5. `correctness.csv`、`raw/`、`evidence_recheck.json`、`source_manifest.json`：实际结果及可复查出处。

## 固定身份

- A：upstream QuickJS 2026-06-04，底座 commit `04be246001599f5995fa2f2d8c91a0f198d3f34c`。
- M：`read_ic_mic/attempt01` 的逐最终字节码读点、单槽实现。本轮复用 `ic_mechanism_audit/attempt01` 的冻结 release；不是早期安全移植 B，也没有 R 退出策略。
- P：同一 M/P 框架、容量 4。本轮只读固定实现及 M→P 配置补丁，不运行 P。它不是旧 QuickJS-NG PIC 的别名。
- V8：官方 d8 15.6.21；`--jitless --no-lazy --use-ic`，沿用相同 snapshot/ICU。参考源码 commit `37fb84941c9be9f9914ee50b1ad366f06a1bd764`；**实际 d8 的精确构建 commit 仍为 UNKNOWN**。
- 本轮新进程在既有 WSL2 主机 `LAPTOP-QPKCPDCB`、x86_64 上执行，kernel `5.15.167.4-microsoft-standard-WSL2`。完整路径、SHA、依赖及前后核对在 `runtime_before.json` / `runtime_after.json`。不是 Windows-native 计时。

|制品|本轮核对 SHA-256|
|---|---|
|A qjs|`584335adb82c6052395e5a9526ca1be05480d5d8e60469fd14403156b62a8dd1`|
|M qjs|`7b6fa1e896e31988b9d8a5276581477776fbd01ab079a64394b6111def7d87ef`|
|d8|`83b744a5953d2662ea723564d4035a333782a0cc85232d1025929a925150b133`|

## 实际执行范围

`cases.js` 的八个静态 read/call 函数在 N=2 时持续复用；每一轮重建案例对象，再执行完整“至少读两次→修改→再读取”序列。N=2 不是新进程的两次 N=1，也不清除函数反馈。四 receiver 案例的 own 键集合与 prototype 都不同；这不等同于直接打印了引擎内部 shape/Map 身份。

`expected.json` 在运行前独立写定。生成的每个 `scripts/*.js` 对三个引擎逐字相同，无引擎分支。`raw/*.json` 保存命令、binary/script/data SHA、完整 stdout/stderr、退出码、预期/实际和 PASS/FAIL。进程墙钟只用于记录/超时，不进入性能表。正确返回不证明某个内部 handler、命中率或失效事件次数。

## 离线复查

在本目录运行，无需旧 Linux binary：

```text
python -B run.py audit
python -B recheck_evidence.py
python -B finalize.py --check
```

前两个入口分别核对本轮 48 条原始记录及旧原始压缩证据。后者需要仓库中的旧诊断文件，不会下载或运行引擎；缺文件就报错，不用旧汇总代替。`finalize.py --check` 只读核对已交付的源码/证据/文件散列，不改文件。

## 在冻结环境做新的正确性 campaign

本 attempt 不可覆盖。复制本轮小型工具/案例到下一个空 attempt，保持 `expected.json`，再在同一 WSL 发行版运行：

```text
python3 -B run.py correctness
python3 -B run.py audit
```

`run.py` 从已有 manifest 读冻结路径，先验 SHA；不调用 jsvu，不替换 runtime。移机可显式调整新 attempt 的路径映射，但 SHA 不得改成另一个版本。已完成 attempt 的 `correctness` 会拒绝重跑。

## 源码与换行

`source_reference/` 仅有相关 V8 文件、QJS 带原始行号摘录和小型 M/P 接入代码/补丁。许可证分别保留；M/P 本地代码不是 V8 或 QuickJS-NG 的原文。固定 URL、commit、原始 SHA、LF 规范化 SHA、Git blob SHA 与摘录范围在 `source_manifest.json` 及 `source_inventory_*.json`。

本轮自写文本为 UTF-8/LF（见本目录 `.gitattributes`）；两份冻结 QJS LICENSE 副本按原始字节保留 CRLF，用 `-text` 防止 Git 归一化。没有改写旧 CRLF 文件或旧哈希。下载正常验证 TLS、每个固定 URL 一次，无漂移 main、源码树或大型 binary。

当前 Windows 会话仍使用未完成目录切换的旧路径；本轮新增目录另同步到 `F:\QuickJS-Research`。这不搬迁 WSL 虚拟磁盘，也不改历史命令中的路径来源。迁移状态与本轮机制结论无关。
