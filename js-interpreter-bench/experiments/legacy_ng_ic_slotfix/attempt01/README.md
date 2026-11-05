# legacy_ng_ic_slotfix / attempt01

独立新campaign，只修复B的空槽未利用，不修改前轮记录。参考/开始HEAD为
fbc008af922d416c085197903c0747314b140efa，myx；实际状态见recovery/reference.json。
本轮明确授权WSL2及这一项VM改动，覆盖历史README中早期禁止优化/只用Windows的阶段性约束。

先验假设：H1最多容纳4种合格shape；H2减少miss可能被探测与保活代价抵消；
H3不减少单态命中工作，不预定消除Richards退化。结果完成前不写收益结论。

A精确upstream；B前轮最终安全移植；C仅first-empty优先，满槽受害者、index、
容量、准入、共享、eager初始化、布局、命中路径与安全修复不变。没有-DNDEBUG/force_inline。
Crypto两项预先排除主GM，全部16项仍采集，另报包含Crypto的敏感性GM。

最终完成状态见`analysis/completion.json`，正式审计见`analysis/formal_audit.json`。
文件尚不存在即表示对应阶段未完成；不能以脚本存在代替实验已完成。

**本轮已完成**：1440/1440有效正式样本、32次B/C诊断、144次独立内存检查；
前轮960条统计与793940个诊断单位已从真实原始记录重算通过。
主集合（不含Crypto）B/C GM点估计1.002546、A/C 0.928635。
具体事实/限制见`results.md`，判读见`interpretation.md`；逐项表与CI见`analysis/`。

## 三种复现入口（不要混为一谈）

### 1. 仅凭公开raw重算统计：不需要Linux或旧binary

在本attempt目录，用Python3标准库：

```sh
python analyze.py legacy
python analyze.py formal
```

第一条从仓库原有960条正式JSON重算前轮描述统计与配对CI，结果写到本目录recovery/；
第二条只读取本轮manifest/schedule/raw重算ABC统计和审计。两者都不打开记录中的
`/home/mzyx`、`/mnt/c`等旧可执行路径，也不会启动任何VM。
原始路径仅作来源字符串保留；无需伪造旧目录才能分析。

需单独核对当前binary身份时：

```sh
python identity.py
python identity.py --map /home/mzyx/legacy_ng_ic_slotfix_attempt01=/your/restored/builds
```

缺binary会报告MISSING，而不阻塞数据统计或偷偷放宽哈希。

### 2. 重算原始诊断：需要真实计数，不接受汇总反造

```sh
python recover.py verify
python recover.py old-diagnostics
python analyze.py diagnostics
```

前两条校验压缩归档，并结合前轮其它14份公开JSON重建原汇总和完整单位CSV（仅输出gzip）。
第三条读取本轮B/C的压缩原始计数、重新校验不变量并生成诊断表。
都不需要diagnostic binary。解压到全新目录可用：

```sh
python recover.py restore --destination /your/new/restore_directory
```

索引在`recovery/archives.json`，保存原始/压缩SHA256、字节数及来源；许可见`recovery/LICENSES.md`。
若材料缺失会报MISSING/FileNotFoundError，不用新采集冒充旧计数。

### 3. 从源码重建、启动全新campaign：需要Linux/WSL2与GCC工具链

本轮用Ubuntu24.04.2/WSL2 x86_64、GCC13.3.0、官方Makefile -O2，未加-DNDEBUG、LTO/PGO。
实际命令相对于`js-interpreter-bench`：

```sh
E=experiments/legacy_ng_ic_slotfix/attempt01
python3 -B "$E/prepare.py" materials
python3 -B "$E/prepare.py" source
python3 -B "$E/build.py" release
python3 -B "$E/build.py" correctness
python3 -B "$E/diagnostic.py" build
python3 -B "$E/diagnostic.py" micros
python3 -B "$E/run.py" init
python3 -B "$E/run.py" correctness
python3 -B "$E/run.py" calibrate
python3 -B "$E/run.py" formal
python3 -B "$E/analyze.py" formal
python3 -B "$E/diagnostic.py" octane
python3 -B "$E/analyze.py" diagnostics
python3 -B "$E/memory.py"
python3 -B "$E/analyze.py" extras
python3 -B "$E/complete.py"
```

`materials`是原主机的初次归档/旧制品核对步骤，**新机器已有校验过的recovery归档时不要执行它**；
可直接`recover.py verify`后恢复源码，不依赖bare仓库或旧binary。A恢复自精确base.tar.gz；
B应用已公开且固定hash的前轮v2补丁并保留许可证；C应用本轮仅改填槽的补丁/生成器。
没有下载或跟随latest。构建日志保存完整编译/链接参数，最终源码和binary的SHA另存manifest。

Octane是精确gitlink/submodule，不要把主仓库克隆后空目录当完整材料。先用官方
`https://github.com/chromium/octane.git`恢复精确commit
`570ad1ccfe86e3eecba0636c8f932ac08edec517`；例如在全新项目副本：

```sh
git init benchmarks/octane/upstream
git -C benchmarks/octane/upstream remote add origin https://github.com/chromium/octane.git
git -C benchmarks/octane/upstream fetch --depth 1 origin 570ad1ccfe86e3eecba0636c8f932ac08edec517
git -C benchmarks/octane/upstream checkout --detach FETCH_HEAD
```

本campaign原Octane文件同样含CRLF；`recovery/workload_line_endings.json`保留其原始
与LF规范化SHA。全新Linux checkout若只有行尾不同，新campaign的build会核对规范化
内容并记录实际新字节hash/差异列表，不篡改前轮清单；本轮已冻结的1440样本仍用原字节。

上述是实际各阶段入口，**不可在已完成attempt里从头重跑**。
首次正式启动使用`run.py formal`。恢复缺失位置使用下面的独立入口，已记录失败也不自动重试；绝不覆盖旧raw或环境快照：

```sh
python3 -B "$E/resume.py" --check-only
python3 -B "$E/resume.py"
```

原formal入口会创建一次性的pre_formal快照，不应重复调用来覆盖它。
`finish.py --wait-for-formal`可等待本轮结束标记后，串行执行分析→诊断→内存→重算→报告；
无标记时只空闲等待，不与正式性能进程并行启动这些阶段。
如需重建并重新采样，先建新attempt：

```sh
python3 -B "$E/new_campaign.py" --destination experiments/legacy_ng_ic_slotfix/attempt02
export IC_SLOT_STORE=/your/new/linux/build_directory
export IC_SLOT_COHORT=your-new-host-linux-cohort
E=experiments/legacy_ng_ic_slotfix/attempt02
python3 -B "$E/recover.py" verify
python3 -B "$E/prepare.py" source
```

然后按上面的release→correctness→诊断微测试→init→correctness→calibrate→formal顺序运行。
每次campaign必须用全新的IC_SLOT_STORE；新旧时间不合并。
新机器记录实际compiler/host/kernel/cohort；工具链或平台不同不能假称与本轮完全复现。

## 时间和统计合同

- 同一JS/N/输入形状，必需Setup在timer外，首次Run与后续N次在内；无额外性能预热。
  GC、helper、builtin、RegExp、动态编译与原计时内断言照常计入。
- N从前轮起点开始，必要时倍增；三组ABC/BCA/CAB独立pilot共9进程都≥1秒后冻结。
- 每项30组，每组三版本相邻；六种排列各5次，seed20261023；1440是目标而非伪造配额。
- 无自动失败重试，不删除异常值或偏短样本，不改GC选项；版本独有失败单列为回归。
- 主要B/C，另报A/B及A/C；>1表示分母版本更快。按ABC整组配对bootstrap10000次，
  每次重算中位数之比；区间跨1标不明确，未做多重检验校正。
- 主聚合预先排除Crypto，先suite内子项GM、再suite等权GM；另含Crypto敏感性。
  这些都不是完整官方Octane总分，Box2D/zlib/latency限制保持单列。
- 内部ms/Run和新进程ms/process分开，不用中位数相减声称精确初始化时间。
- 内存独立GNU time小launcher，每项每版3新进程，KiB；分布保留，时间不进入正式性能。
  IC请求字节、间接shape保活与RSS不是同一指标。
- B/C诊断完全相同计数实现/布局，整进程范围，只统计已重写IC查询；缓存单位函数+atom。
  max占用分布是生命周期最大值，非时间加权占用；shape完整多样性UNKNOWN。

## 文件管理与已知恢复问题

大型旧记录已压缩，新诊断只以gzip进入raw，plain副本留Linux构建区；
generated脚本和正式二进制副本被本目录.gitignore排除，不往普通Git塞bare历史或大JSON。
本轮不提交/推送、不改用户根.gitignore。

`recovery/line_endings.json`核实：旧A quickjs.c原始CRLF SHA为b4ad0506…，
Git发布LF规范化SHA为a68622ce…；原哈希保留，差异不是源码逻辑变化。
新测量使用原字节archive恢复A，B/C按前轮port生成LF源码；原始与规范化身份分开。
所有JSON/脚本/文档的新Git行尾规范见本目录.gitattributes。

一次WSL递归git status被终止（raw/build/repository.1.json退出-15），不能据它的空stdout宣称检查成功。
开始时Windows原生git已确认HEAD与参考一致、工作区干净；后续不递归子仓库核对另行保存。
