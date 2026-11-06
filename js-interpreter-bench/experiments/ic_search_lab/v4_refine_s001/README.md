# s001附近的小修正搜索

本轮已完成。先做17个源码版本的单次完整Octane，其中3个控制、14个修正或parent对照。没有清楚整体信号后，追加48配置的有界交互搜索，42个新配置完成短测，6个源码重复跳过，4个补测完整Octane。最后仅对mx019做5轮独立Octane复核。共2349条有效计时记录，审计通过。[结果](results.md) [最终判断](decision.json)

首批6个修正版本及3个控制见variants.py和candidates.csv。rf000核对精确源码重建与冻结s001的.text一致，rf001单独记录发布新shape后释放旧shape的安全适配，rf008检验通用模板恢复16B记录后的表现。初轮以rf001为共同parent，后续补齐六个直接基于s001的单因素版本，并增加已知object释放及失配更新两项修正。extension.protocol.json保留这次拆分，旧数据未覆盖。组合参数见broad.protocol.json，不把配置数当新算法数。

mx019复核核心/s001=0.996360，95%探索区间[0.993538,1.027799]，相对同.text重建控制也跨1。没有认定稳定超过s001，没有升级底座。按预设保留名额仅复核这一弱信号，其余未重复。未做全量SunSpider或30进程正式确认。

## 计时

主筛选为完整17项Octane，每项同一N，首次Run包含，无额外workload预跑，初始Setup在计时外。内部时钟继续为native CLOCK_MONOTONIC。GC/helper/builtin/RegExp/Run内动态编译按原边界计入。Crypto沿用已验证原N及确定性密文门禁。Box2D及官方latency覆盖限制保留。

每case顺序为s001、随机顺序的候选/A、s001。候选只取一个新进程样本。s001端点max/min>1.15时只允许一次有界复测，两次记录均保留，按最后一次的预定质量规则分析，不挑更快的一次。漂移不阻止其它修正版本测试。单次筛选无置信区间，只分配后续复测预算。

初筛N取历史已冻结N/4，最小1，Crypto保留原N。旧时间不作分母，N仅表示工作量。统计沿用Octane核心16项/13suite、扩展17项/14suite的分层几何平均。

## 构建与正确性

一份active源码和构建位置，每个版本保存相对parent的patch、源码SHA、编译命令及冻结ELF。GCC13.3，-O2 -g -fwrapv -DHAVE_CLOSEFROM，不启用LTO/PGO/NDEBUG。独立ELF不被后续构建覆盖，构建与性能采样串行。

每版先通过已有7020、9013条断言及targeted.js。断言数与场景数分开解释，完整test262/最终sanitizer尚未运行。出现具体正确性失败保留原始记录，失败版本不参加性能筛选。

## 入口与材料

在WSL Ubuntu内执行 python3 refine.py first。environment.json固定本批boot，版本/输入/协议写入workspace.json、identities/和protocol.json，raw为append-only runs.jsonl，progress.json为当前进度。STOP可在下一操作前停止，旧材料不覆盖。

源码解释和每版收益/代价在variants.py的DESIGNS中，运行前先写入raw。未知原因保持UNKNOWN。私有JWST未读取、修改或打包，未重测V8。

## 表格与原始记录

- screen.summary.csv和screen.per_case.csv给出21个完整套件单次筛选，单次数据没有CI。
- broad.summary.csv和broad.per_case.csv给出42个交互配置的固定4项SunSpider、4项Octane短测，两个小集合分别聚合。
- recheck.statistics.csv含mx019及四个对照的median/mean/样本stddev/Q1/Q3/IQR/min/max，单位ms/完整Run。recheck.per_case.csv和recheck.summary.csv给出逐项及分层比例/探索区间。
- audit.json核对2349条记录、2588对进程开始/结束、单一boot、425个独立复核位置及平衡顺序。source_recovery.csv和artifacts.csv记录59个制品的源码恢复与身份。
- runs.jsonl.gz及raw_archive.json保存原始命令、输入/制品SHA、stdout/stderr和时间，可离线解压并校验。未压缩raw和本地ELF在.gitignore中。
- 冻结screen.json中的source_sha256字段实际是binary SHA。真实源码清单位于identities内的source_sha256。decision.json已注明命名问题，原始文件及哈希未改写。

## 离线重算

在本仓库源码中使用标准Python，分析入口只读取本目录的raw归档、协议和inputs.json，不执行VM，也不读取benchmark源码或历史ELF。

    REFINE_ARCHIVE_ONLY=1 python3 followup.py analyze --kind octane

PowerShell先设置 $env:REFINE_ARCHIVE_ONLY='1'，再执行 python followup.py analyze --kind octane。portable_analysis.json记录Windows上归档重算及逐字节一致校验。

## 恢复源码

需要相邻v3_mass_search中的公开seed归档、seed_s001.patch、templates和build_support.tar.gz，以及本目录的runners/identities。recover.py使用制品记录的generator版本，恢复前核对32份源码及构建辅助文件SHA。

    python3 recover.py mx019 --verify-only
    python3 recover.py mx019 /tmp/qjs-mx019-rebuild
    cd /tmp/qjs-mx019-rebuild
    make -j1 qjs qjsc

目标目录须不存在。重建前核对GCC13.3和identities/mx019.json内的编译命令，源文件可以精确恢复，新路径/工具链可能改变ELF SHA。新性能采样应建立独立campaign并先准备对照制品，禁止往本轮已完成raw里补样本。

active/对应最近一次构建，具体来源见active_identity.json。mx019的冻结制品为artifacts/mx019.qjs，源代码可由上述命令恢复，关键差异见patches/mx019.patch。
