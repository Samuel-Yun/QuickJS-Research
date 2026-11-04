# Splay 修订：得到布局证据，完整实验仍被执行可靠性阻断

状态：**BLOCKED_EXECUTION_UNRELIABLE**，2026-11-04。

从干净的 `myx / f4f1672b9c7cc03701cef7f797aa18597f813a6b` 继续。
本目录是独立修订；[attempt01](../attempt01/README.md) 的44条稀疏诊断、41条密集诊断、失败与 STOP_WORKER 全部保留。
没有启动旧 worker，没有更改 WSL/安全/内存设置，没有修改冻结 A/M/d8，没有提交或推送。

## 已实际完成

- 初始实际核验 A/M/d8、A_diag7/M_diag3 的大小、ELF、SHA256、smoke 与 d8 两项数据依赖；A_diag5 确认0字节，不使用。
- 冻结 A/M 各做 Splay N=1/2：4个独立进程成功，保留宿主与 Linux 子进程记录。
- 独立轻量 M 诊断：阶段聚合 + 三读点详细记录；N=1/2通过，N=2计数吻合旧记录。
- 三个读点均观测到两种活跃 shape，布局与频次完整；转换序列只保留前128次且显式标截断。
- 同 ELF、同 JS 的 C_ON/OFF 控制副本已构建；Splay/numeric、N=1/2、四条件16/16正确性通过，包含重复配置检查。
- 独立计数门禁仅1/6：M.N1保存，随后C_ON.N1未取得子进程退出记录。门禁未通过。
- 旧数据离线重放12个输出逐字一致，不需要 Linux、VM 或私有代码。

**机制正式0/240；Octane正式0/1530（无OPT分支）；独立复测0/120。**
没有校准、bootstrap、性能排名或OPT收益结论；不能用正确性短跑的时间代替正式样本。

## 阅读入口

- [results.md](results.md)：直白结论与四张状态/证据表。
- [site_notes.md](site_notes.md)：shape布局、PC/atom对应与控制源码审阅。
- [engineering_notes.md](engineering_notes.md)：所有失败、有限恢复与具体停点。
- [summary/audit.json](summary/audit.json)：可检查状态与真实数量。
- [summary/execution_tasks.csv](summary/execution_tasks.csv)、[linux_children.csv](summary/linux_children.csv)：宿主退出与单个子进程资源；两层退出码不混用。
- [summary/splay_sites.csv](summary/splay_sites.csv)、[splay_layouts.csv](summary/splay_layouts.csv)：Run内次数、布局与频率。
- [summary/correctness.csv](summary/correctness.csv)、[incomplete_positions.json](summary/incomplete_positions.json)：16个有效结果和1个未完成位置。
- [summary/mechanism_pending.csv](summary/mechanism_pending.csv)、[octane_pending.csv](summary/octane_pending.csv)：缺失值留空，不填时间或比值。

## 入口及恢复边界

Windows上只重算保存证据（已执行；重复运行须输出一致）：

```powershell
python js-interpreter-bench/experiments/splay_ic_20261104/attempt02/finalize_partial.py
```

旧数据原始重放用新输出名，保留旧输出：

```powershell
python js-interpreter-bench/experiments/splay_ic_20261104/attempt01/offline_audit.py --output ../attempt02/replay_another
```

`build.py`/`finish_build.py` 是独立构建工具；`run.py` 包含检查、机制、Octane和复测入口，**尚未获完整门禁，不是READY**。
本目录 `STOP_EXECUTION` 会禁止其启动；不要删除它或继续填旧未完成位置。
`analyze.py` 可对将来完整独立campaign只读统计，本轮无正式样本，未执行该统计。

恢复的最小下一步是排查同一 C_light 的有界 N=1 诊断，而非立刻开长队列；见 [next_commands.md](next_commands.md)。
`reproduce.py` 会先重新验证实际文件身份，并给 Linux 子进程落盘启动记录；本轮停止后未再运行它。
若新环境/boot恢复，保留本目录及不完整位置，在新修订中完成门禁和完整新campaign，不跨boot补样本。

## 制品与大文件

公开源码生成的补丁、诊断头/尾、构建脚本、身份、压缩raw在本目录。
编译产物仅在 `/home/mzyx/splay_ic_20261104_attempt02/`，不加入Git；绝对路径是来源记录，不是跨机器通用路径。
新的 `builds/build04/manifest.json` 仅表示发布时通过实际核验；最后中断之后身份仍为UNKNOWN，不可只凭此文件运行。
无需本地JWST；未读取、复制、打包或引用其私有实现。QuickJS/Octane许可见旧attempt的LICENSE文件。
