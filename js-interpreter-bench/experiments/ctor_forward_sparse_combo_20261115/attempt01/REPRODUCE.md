# 复现组合实验

先在仓库根运行，旧实验保留：

```bash
cd /home/wssy/workspace/QuickJS-Research
BASE=js-interpreter-bench/experiments/ctor_forward_sparse_combo_20261115/attempt01
```

快速独立构建已交付的Release源码：将`$BASE/FORWARD_SPARSE/source.tar.gz`解压到新目录，进入`quickjs-FORWARD_SPARSE`执行`make -j2 -o repl.c qjs qjsc`。源包SHA在相邻source.sha256，原编译flags/工具链由manifest/build.log记录。

从两原版的构建器重新生成/完整测量时，用同层新attempt，保持仓库层级，以便复用冻结原脚本和源包：

```bash
REPRO=js-interpreter-bench/experiments/ctor_forward_sparse_combo_20261115/attempt02_reproduce
mkdir "$REPRO"
cp "$BASE"/*.py "$BASE"/*.c "$REPRO"/
mkdir "$REPRO/FORWARD_SPARSE"
cp "$BASE/FORWARD_SPARSE"/*.js "$BASE/FORWARD_SPARSE"/*.c "$BASE/FORWARD_SPARSE/method.md" "$REPRO/FORWARD_SPARSE/"
for MODE in release counts san; do
  python3 "$REPRO/build.py" "$MODE"
done
python3 "$REPRO/qualify.py"
python3 "$REPRO/sequence.py" FORWARD_SPARSE counts
python3 "$REPRO/sequence.py" FORWARD_SPARSE release
python3 "$REPRO/analyze.py"
python3 "$REPRO/audit.py"
```

这是复现说明，不是本次自动追加的轮数。每个Release表项只一个独立进程；计数为独立构建、独立进程。R3/单版不新跑正式全集，定向样例使用它们原二进制。正式计时期间不要另起CPU2基准或编译。

父版固定源码：`ic_four_rounds_20261115/attempt01/03_constructor_plan/source.tar.gz`；单版构建逻辑：`ctor_ic_followups_20261115/attempt01/{build.py,sparse.py,forward_runtime.inc,forward_prepare.inc,sparse_runtime.inc}`。build.py核对R3源包/逐文件SHA，manifest记录所有合并输入的SHA；audit.py还会核对生成的单版与其旧manifest一致，以及相对R3/两个单版的补丁能精确还原组合源文件。

原始运行记录在FORWARD_SPARSE/runs/{release,counts}/{octane,sunspider}/runs.jsonl，计数另有.gz无损归档。读取脚本、N、checksum、每次命令、退出码、起止时间、ELF/源码/input SHA及环境快照均保留。Release使用native_confirmation_20261108/attempt02的原脚本；计数只在相同Run边界加__four_begin/end，未进入正式时间。CPU2、TZ=Asia/Shanghai、LC_ALL/LANG=C，Setup不计时，首Run计入，warmup_calls=0。
