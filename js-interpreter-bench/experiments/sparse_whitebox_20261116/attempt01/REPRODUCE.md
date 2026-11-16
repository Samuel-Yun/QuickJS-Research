# 按需构造缓存白盒实验

展示名称统一为“按需构造缓存”；它对应06aada4的SPARSE_CTOR_IC，未换成R3_NEGATIVE_ONLY、组合版或其它候选。原版A为原Ubuntu对照二进制。

从仓库根运行。正式循环固定：读取N=201326592，构造正/负均N=67108864，序列长度65536；所有档位、两版输入与调用次数相同。读取复用benchmarks/ic_hit_rate/own_read.js原文件；另一个ctor.js只有一个new位点。

复现已有实验数据和PPT，不需要重新跑基准：

```bash
python3 js-interpreter-bench/experiments/sparse_whitebox_20261116/attempt01/analyze.py
python3 js-interpreter-bench/experiments/sparse_whitebox_20261116/attempt01/snapshot_cases.py
python3 js-interpreter-bench/experiments/sparse_whitebox_20261116/attempt01/evidence.py
python3 js-interpreter-bench/experiments/sparse_whitebox_20261116/attempt01/create_pptx.py
python3 js-interpreter-bench/experiments/sparse_whitebox_20261116/attempt01/preview.py
python3 js-interpreter-bench/experiments/sparse_whitebox_20261116/attempt01/audit.py
```

create_pptx.py需要python-pptx/lxml/Pillow，当前装在/tmp/quickjs-whitebox-slide-deps。若临时目录已清除：`python3 -m pip install --target /tmp/quickjs-whitebox-slide-deps -r js-interpreter-bench/experiments/sparse_whitebox_20261116/attempt01/slide_requirements.txt`。只用于制作图表，不参与测时。图为PowerPoint原生chart并带嵌入Excel数据，表格为原生table，文本/图形也可编辑。英数Times New Roman、中文楷体，16:9，6页无封面。PNG只作排版预览，未替代PPT内的图表。

完整重跑请在同层新attempt目录复制驱动与输入，保留旧产物；build.py需要work目录为空。先根据原源包/manifest生成release_manifest.json（可复制当前文件，它指向原冻结版本），保留own_read.js/ctor.js及diag脚本。命令顺序：

```bash
BASE=js-interpreter-bench/experiments/sparse_whitebox_20261116/attempt01
REPRO=js-interpreter-bench/experiments/sparse_whitebox_20261116/attempt02_reproduce
mkdir "$REPRO"
cp "$BASE"/*.py "$BASE"/*.inc "$BASE"/*.js "$BASE/config.json" "$BASE/release_manifest.json" "$REPRO"/
python3 "$REPRO/build.py" A
python3 "$REPRO/build.py" SPARSE
python3 "$REPRO/run.py" calibrate
python3 "$REPRO/run.py" gate
python3 "$REPRO/run.py" measure
python3 "$REPRO/run.py" counts
python3 "$REPRO/analyze.py"
python3 "$REPRO/snapshot_cases.py"
python3 "$REPRO/evidence.py"
python3 "$REPRO/create_pptx.py"
python3 "$REPRO/preview.py"
python3 "$REPRO/audit.py"
```

这是复现命令，不是本次自动追加轮数。Release每点5个独立进程，A与按需版交替；独立诊断每点1个同N进程。没有重跑Octane/SunSpider全集。全部固定CPU2、Asia/Shanghai、C locale，生成序列/预测/结果校验不计时，无额外预热，首次循环计入。计数版耗时不用于性能结论。新attempt复制config是重现本次规模；若换机器，先短测再选N，正式所有档位统一N，不根据某一轮结果改N或补跑。

读取：两种shape，x同槽且值3；小于100%档两种布局各占一半，以成对run长度调切换频率，实际命中含融合借用快路。计数read[0..6]依次是查询/命中/失配/融合命中/普通命中/普通查询/填充；断言query=N=hit+miss，hit=fused+regular，不能把融合成功再算一次普通查询。

构造：正计划两个不同身份函数均直接写x/a；负对照两个不同身份函数使用this.x=x+0，结果相同，但其字节码不满足纯参数写字段模板。两者共用原型，计时外保留Object.create(proto)空对象，满足既有空shape学习前提；这是微基准输入设计，没有改引擎学习条件。循环只用一个new C(3,0)，读取结果x累加；正命中/普通构造/负命中/判型分别计数。ctor数组是原正缓存q/h/eligible/fill/guard等；sparse[0]是模板判型入口，sparse[2]是负命中。负命中无论多高，普通构造仍发生。

诊断未定义FOUR_DIAG，没有每点diag指针或每点堆日志，构造记录仍32B/FullPlan96B；仅加计数与快照接口。readLoop/ctorLoop函数本体在Release和诊断脚本中一致。snapshot.inc复用bytecode_eval_cold_20261110快照办法：直接读执行后的byte_code_buf，按当前opcode表解码，解析rdi位点引用和four_ctor记录编号。snapshot_cases.py另取ownRead与A实际循环缓冲区；正式N诊断中保存按需版readLoop/ctorLoop及构造器缓冲区。

原始记录raw/{calibrate,gate,measure,counts}/runs.jsonl包含每个命令、退出码、结果、起止、ELF hash；正式protocol记录脚本/输入hash，固定迭代数和顺序；analysis/statistics.csv报告5次中位数、全范围和CV，samples.csv保存每次时间；counts.csv为实际计数；snapshots含JSON/CSV/可读文本。第6页只引用03_sparse_ctor已有analysis的历史单轮相对A数据，标为“跨批次单轮筛选”。11月9日旧属性结果只核对趋势，不用于本轮曲线。
