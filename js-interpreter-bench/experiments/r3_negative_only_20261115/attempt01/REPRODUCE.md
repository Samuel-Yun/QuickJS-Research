# 复现 R3_NEGATIVE_ONLY

仓库根，分支myx，历史实现参考06aada464。原冻结R3源包/manifest由build.py逐文件校验；不从当前qjs源码目录随意取父版。旧实验不改动。

所有构建与运行应在新attempt目录进行（已有work目录拒绝覆盖）：

```bash
cd /home/wssy/workspace/QuickJS-Research
BASE=js-interpreter-bench/experiments/r3_negative_only_20261115/attempt01
REPRO=js-interpreter-bench/experiments/r3_negative_only_20261115/attempt02_reproduce
mkdir "$REPRO"
cp "$BASE"/*.py "$BASE"/*.c "$BASE"/*.js "$BASE"/*.inc "$BASE/method.md" "$REPRO"/
for V in R3 NEGATIVE_ONLY SPARSE LAYOUT_OFF; do
  python3 "$REPRO/build.py" "$V" release
  python3 "$REPRO/build.py" "$V" counts
done
python3 "$REPRO/build.py" NEGATIVE_ONLY san
python3 "$REPRO/qualify.py"
python3 "$REPRO/run.py" target release
python3 "$REPRO/run.py" target counts
python3 "$REPRO/run.py" full release
python3 "$REPRO/analyze.py"
python3 "$REPRO/audit.py"
```

这是复现说明，不代表本次追加轮数。target每版本每项目5次Release新进程、另5次独立计数进程，旋转顺序固定在protocol.schedule，保留每次结果；LAYOUT_OFF作为同布局额外控制仅跑重点项目，不跑完整两套。full只R3/NEGATIVE_ONLY，17+26项各1进程，每项轮换版本先后。不跑A/C/V8，不自动延长。Release计时期间不要编译或并行跑其它CPU2基准。

cpu/locale/input/timer由run.py固定原native_confirmation_20261108/attempt02协议：CPU2、Asia/Shanghai、C locale、原N/输入/校验、Setup不计时、首Run计入且无额外热身；计数脚本只加计数开启/关闭，输出的诊断耗时不用来比较性能。计数版不使用FOUR_DIAG的每点堆日志，元数据布局和Release一致，仍需承认计数代码和helper的扰动；表里不把它和某个Release进程的命中率一一对应。

可直接验证新源码：NEGATIVE_ONLY/source.tar.gz和source.sha256，解压到新目录，进入quickjs-R3_NEGATIVE_ONLY后执行`make -j2 -o repl.c qjs qjsc`。NEGATIVE_ONLY/release.patch相对冻结R3；source manifest/ELF hash/build命令均存档，父版正热函数four_ctor_try源码文本在build.py逐次assert不变。qualification/layout.json核对正缓存96B及原字段offset，负索引在原padding+92；runtime额外24B和16B按需旁表条目有明确记录，不隐藏额外成本。

qualification/runs.jsonl保存语义、internal、serialization命令/输出/失败记录。当前环境LSan不可用，ASan/UBSan使用detect_leaks=0。internal.c直接检查正计划保留及暂时性失败恢复，GC fixture显式清原C强shape缓存仅为排除原有root；benchmark不运行此动作。growth.js额外检查100个动态位点的旁表扩容/负缓存替换/异常行为，不作为计时基准。

原始数据：runs/target/release、target/counts及full/release，每份process_start/process_result/sample三类记录和环境/protocol/audit均保留。大计数有无损.gz，不删本地原JSONL。analysis/target_raw.csv明确列出5次Release ms/Run及独立计数的次数；target_summary.csv有中位数/范围；octane.csv、sunspider.csv为本次同批次逐项对照。离线analyze/audit不跑基准。若用旧输出恢复中断，只跳过完整有效sample，不隐式重试失败样本。
