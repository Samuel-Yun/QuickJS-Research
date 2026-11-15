# 复现

从仓库根执行。旧实验、用户修改及attempt01结果均不覆盖；构建器的work/mode目录必须不存在，否则报错退出。下面仅是复现命令，本次没有自动重跑或追加正式轮数。

父版固定：`js-interpreter-bench/experiments/ic_four_rounds_20261115/attempt01/03_constructor_plan/source.tar.gz`。build.py自动对照相邻source.sha256和release.manifest.json的全部源文件哈希后解包，不从当前工作树取QuickJS代码。已有归档源包也可直接解压到新目录：`tar -xf source.tar.gz -C NEW_DIRECTORY`，再进解压目录执行`make -j2 -o repl.c qjs qjsc`；本机固定gcc/Makefile flags见build.log/manifest，使用本次相同工具链。

重新执行完整实验时，创建同层新attempt（下例路径必须空），仅复制驱动和fixture：

```bash
cd /home/wssy/workspace/QuickJS-Research
BASE=js-interpreter-bench/experiments/ctor_ic_followups_20261115/attempt01
REPRO=js-interpreter-bench/experiments/ctor_ic_followups_20261115/attempt02_reproduce
mkdir "$REPRO"
cp "$BASE"/*.py "$BASE"/*.inc "$BASE"/*.c "$REPRO"/
for ROUND in 01_forward_ctor 02_proto_ticket 03_sparse_ctor; do
  mkdir "$REPRO/$ROUND"
  cp "$BASE/$ROUND/safety.js" "$BASE/$ROUND/micro.js" "$BASE/$ROUND/serialization.c" "$BASE/$ROUND/method.md" "$REPRO/$ROUND/"
done
mkdir "$REPRO/04_construct_consume"
```

按轮次执行，示例第1轮（第2/3轮替换ROUND；不在正式计时期间编译或并行跑其它基准）：

```bash
ROUND=01_forward_ctor
for MODE in probe release counts san; do
  python3 "$REPRO/build.py" "$ROUND" "$MODE"
done
python3 "$REPRO/qualify.py" "$ROUND"
python3 "$REPRO/sequence.py" "$ROUND" counts
python3 "$REPRO/sequence.py" "$ROUND" release
python3 "$REPRO/analyze.py" "$ROUND"
```

第2轮原始chain工作量probe本次仅指定Earley、Boyer、Splay和access-binary-trees；第3轮R3 eager记录/解析probe本次仅指定RayTrace、Boyer、Closure、JQuery及Tree。不是额外正式时间轮数。原始命令与N在runs/probe对应protocol/runs.jsonl中。第3轮`python3 "$REPRO/fault_plan.py"`做可选完整记录分配失败ASan/UBSan回退；第1/2/3轮准备后`python3 "$REPRO/check_ownership.py"`做GC/双realm/native所有权检查。LeakSanitizer在当前sandbox不可用，ASAN_OPTIONS使用detect_leaks=0。

第4轮没有Release候选，本次只跑一次完整独立probe以确认覆盖：

```bash
python3 "$REPRO/build.py" 04_construct_consume probe
python3 "$REPRO/sequence.py" 04_construct_consume probe
python3 "$REPRO/finish_consume.py"
```

本轮probe新归档前的historical_adjacent_census.json来源是冻结R3已有计数，只是取出call_constructor后相邻opcode统计；可从旧R3 runs/counts/{octane,sunspider}/runs.jsonl(.gz)按各site.bytecode_hex解析还原，不需重测原版。

全部基准runner来自native_confirmation_20261108/attempt02的冻结输入/脚本：自动CPU2、TZ=Asia/Shanghai、LC_ALL/LANG=C，Setup不计时，首个Run计入，N与checksum不变，每项独立进程1次；Release直接用原脚本，不加计数或额外热身。诊断单独构建/单独进程；其__four_begin/end不会进入正式计时。原始JSONL同时记录完整命令、ELF哈希、boot、wall/user/system时间、结果、N、checksum和错误。大诊断另有无损.gz，analysis支持明文或.gz。

最后离线汇总及验证：`python3 "$REPRO/finalize.py"`。它不跑基准，验证父版和产物源哈希、逐文件补丁还原、原始43项独立进程和冻结脚本，生成总表。第4轮零覆盖的源包是probe-source.tar.gz/patch，只是诊断，不冒充消除分配的实现；finish_consume.py的断言会阻止在有覆盖时误报零覆盖，此时应继续实现而非沿用本轮结论。
