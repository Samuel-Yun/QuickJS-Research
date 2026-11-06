# QuickJS IC mass search

2026-11-06 本轮搜索完成。实际筛选248个配置，40个标为不支持，28个完成全套单次测量，4个另做完整套件4轮复筛。新campaign共9791条有效计时记录。当前没有复筛支持的整体优势，不升级底座，不启动30进程正式确认。RayTrace的局部改善与nbody退化一起保留。结论见 [exploration_results.md](exploration_results.md)，解释见 [exploration_explanation.md](exploration_explanation.md)。

当前 campaign 由 exploration.active_campaign.json 指定，最终进度见 exploration02.progress.json。新规则见 protocol_amendment02_exploration.json。本轮保留15%漂移标记与一次复测。配置经过构建、正确性及8项实测后才计入完成，短测只分配后续预算。最终42块中37块直接通过，5块在一次复测后通过。

首批96个配置完成后，候选 S001 与冻结基线 s001 在 NTFS 上发生元数据文件名冲突，状态守卫在写入前停止。基线哈希完整保留。修复为独立 candidate_S001 文件名后，恢复检查发现 WSL boot 已变化，因而新建 exploration02 campaign，重新采集全部初筛及同批对照。旧96个配置的原始数据、协议、检查点和失败记录保持原样。详见 protocol_amendment03_new_boot.json。既有二进制经过SHA检查后复用，旧时间不作新campaign分母。

前一阶段的BLOCKED_TIMING_DRIFT、原STOP及失败恢复证据保留。checkpoint_20261105_public.tar.gz保存旧evidence_manifest所对应的完整公开快照。results.md及raw_archive.json记载旧停点，新增campaign的结果另行保存。

本轮从 myx/dafef00c9a5231208253c76329b9d13eb26cc564 开始，独立记录，不引用旧耗时作分母。288 是初始配置数，实际已构建、已校验和已采样数量由 candidates.csv 与 runs.jsonl 给出。

一份 active 源码/构建位置，artifacts 中保留冻结 ELF，不覆盖运行中的程序。原版 A、M、s001 不重建。私有 jwst-compiler 不读取、不打包。模板和生成器是公开 M+s001 的衍生实现，原 MIT LICENSE 随恢复材料保留。

早期控制器为 `python3 search.py prepare|pilot|screen|level2|recheck|analyze|audit`，关联原STOP及历史停点。当前结果复算使用下方study_stats_20261106.py入口。构建、采样串行，每个完成块有检查点，已完成raw保持可离线分析。

计时使用冻结的内部 native CLOCK_MONOTONIC，首次 Run 计入，无计时前 workload 预跑。初始 Setup 在计时外，Run 内 GC/builtin/RegExp/动态编译保留。短测只作预算分配，不作为正式性能结果。两项 SunSpider 随机输入限制及 Octane Crypto 原 N 密文门禁沿用。

环境、模板支持边界、实际阶段和结果随真实执行写入 environment.json、protocol.json、template_checks.jsonl、candidates.csv、runs.jsonl 及 results.md。没有完成的阶段明确标注，不能根据 PLANNED 行数声称测试完成。

A 源码归档保留原 CRLF 字节和原始 SHA256。生成 S/A 工作副本时统一将 CRLF 规范化为 LF，再应用模板；seed_A.tar.gz 不改写。生成器首次未处理该差异的失败见 pilot_generator_failure01.json，未被记作引擎崩溃。历史 M/s001 的源码和 binary 均未改写。

raw为UTF-8/LF；runners及templates用Git -text保留精确字节。少量PowerShell产生的环境/控制器JSON保留原始换行，JSON同样禁用Git转换；不把它们的字节hash误作LF规范化hash。

新探索入口为`python3 explore_20261106.py collect`。一次运行串行构建和采样，已完成块自动跳过。新建STOP_EXPLORATION可在下一进程前正常停止。CTRL000为24B AoS单槽模板控制，不计作初始288项中的新候选，也不混入套件聚合。

## 结果入口

- [exploration.candidates.csv](exploration.candidates.csv)列出288项的支持、实测、晋级和去留，额外两个模板控制独立保存在state.json中。
- [exploration.coverage.csv](exploration.coverage.csv)按七类列出248项初筛、28项全套与4项复筛覆盖。
- [exploration.level2.per_case.csv](exploration.level2.per_case.csv)及其summary为28个候选的全套单次数据，仅作探索。
- [exploration.level3.statistics.csv](exploration.level3.statistics.csv)列出4轮每组median/mean/样本stddev/Q1/Q3/IQR/min/max，单位为ms/完整Run。
- [exploration.level3.ratios.csv](exploration.level3.ratios.csv)和[exploration.recheck_overview.csv](exploration.recheck_overview.csv)分别提供逐项与分层聚合，耗时比为候选/同批分母。
- [exploration.audit.json](exploration.audit.json)核对9791条有效记录、boot、位置与无未闭合进程。[portable_verification_20261106.json](portable_verification_20261106.json)记录Windows上不访问ELF、仅用压缩raw重算的成功验证，并核对248份源码可恢复。
- [postflight_exploration_20261106.json](postflight_exploration_20261106.json)核验253份ELF，其中248个候选、2个模板控制、3个冻结基线。248个候选的实际ELF SHA均不同。

## 只重算统计

在本目录使用标准Python即可。`study_stats_20261106.py`读取current_raw_archive.json所指的约8MB压缩文件，并校验压缩与解压SHA。它的分析入口不执行VM，也不要求历史/home或/mnt路径可访问。

```sh
IC_SEARCH_V3_CURRENT_ARCHIVE_ONLY=1 python3 study_stats_20261106.py recheck
IC_SEARCH_V3_CURRENT_ARCHIVE_ONLY=1 python3 study_stats_20261106.py audit
```

PowerShell先执行`$env:IC_SEARCH_V3_CURRENT_ARCHIVE_ONLY='1'`，随后执行同样的两个Python命令。现有原始CSV应先保留，需要比较重算输出时可使用verify_portable_20261106.py的独立输出方式。

## 恢复源码与重建新campaign

需要仓库中的公开源码归档、模板、identities、runners、patches和build_support.tar.gz。下面只写入一个新目录，已有目标目录会拒绝覆盖。历史generator版本按制品记录的SHA从runners恢复。许可证随源码归档保留。

```sh
python3 recover.py L030 /tmp/qjs-L030-rebuild
cd /tmp/qjs-L030-rebuild
make -j1 qjs qjsc
```

make前核对compiler与identities/L030.json中的原编译命令。原批次为GCC13.3、-O2 -g -fwrapv -DHAVE_CLOSEFROM，未启用LTO/PGO/NDEBUG。可验证源码一致，重新构建的调试路径或工具链变化可能改变ELF SHA。

历史采样入口是explore_20261106.py、promote_20261106.py full和recheck，配置与顺序均已冻结。新采样应新建campaign tag及协议指针，先记录新boot和制品，保留现有protocol、raw和检查点。当前campaign已完成，collect仅报告完成。不要将新进程加进已完成campaign。

## 本地大文件与公开材料

active/、artifacts/、未压缩runs.jsonl与progress日志按.gitignore保留在本地。正式raw约224MB，current_raw_archive.json所指gzip约8MB，旧压缩快照保留。selected_mechanism.jsonl为单独的诊断原始记录。统计恢复与重建入口分开，不要求把ELF或bare历史库纳入Git。私有JWST没有读取或打包。
