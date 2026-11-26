# CTOR_LOCAL_SHAPE_GUARD 复现

在仓库根目录执行，原冻结源码不动。本目录为独立实验，所有构建在 work/。
已有数据不覆盖；重跑请在相同层级建立新 attempt，复制脚本、.inc、JS、C 测试文件，保留旧 attempt。

```bash
cd /home/wssy/workspace/QuickJS-Research
TASK=js-interpreter-bench/experiments/ctor_local_shape_guard_20261124/attempt01
python3 "$TASK/build.py"
python3 "$TASK/build.py" --labels CTOR_LOCAL_SHAPE_GUARD --modes sanitize
python3 "$TASK/validate.py" fixture
python3 "$TASK/run.py" gate
python3 "$TASK/validate.py" lifetime
python3 "$TASK/validate.py" sanitize
python3 "$TASK/run.py" mechanism
python3 "$TASK/run.py" timing
python3 "$TASK/run.py" decide
python3 "$TASK/callgrind.py"
python3 "$TASK/report.py"
```

正式时间：CPU 2、C locale、Asia/Shanghai，原 SPARSE 和候选每项各 5 个新进程，按轮次交替先后顺序。
白盒使用原 ctor.js positive/100，N=67,108,864；Boyer 使用原测试脚本的固定 N、校验和 Setup/Run 边界。
首次 Run 计入，不额外热身。诊断另跑，不用诊断/ASan/Callgrind 的时间比较速度。

如果 decision.json 的 run_full=true，才追加：

```bash
python3 "$TASK/run.py" full
```

初次定向阶段 run_full=false：真实局部守卫覆盖为 0，且白盒、Boyer 计时均退化，当时没有跑全集。后续按用户要求追加全集，见下节。

手动执行一轮高命中白盒：

```bash
taskset -c 2 "$TASK/work/SPARSE.release/qjs" "$TASK/ctor.js" positive 100 67108864
taskset -c 2 "$TASK/work/CTOR_LOCAL_SHAPE_GUARD.release/qjs" "$TASK/ctor.js" positive 100 67108864
```

独立补丁为 SPARSE-to-CTOR_LOCAL_SHAPE_GUARD.patch。只改 four_runtime.inc、quickjs.c 的 GC/释放位置，并新增 local_shape_guard.inc。
构造慢路资格、initial shape 门槛、对象分配和两次中断检查不改；不改读 IC、槽数、字节码和序列化。

shape_guard_fixture.c 是内部 C 语义测试：在测试中复制并正确哈希普通函数已经物化的布局，以触发局部守卫、失配回原检查及额外记录分配失败。
这些测试操作不进入 Release qjs，不算真实负载覆盖。class 的字节码本来不符合 R3 模板，另有 class_bytecode/ 快照保留证据。

ASan/UBSan 与 QuickJS FreeRuntime 断言均开启；ptrace 环境下关闭 LeakSanitizer，不声称做了 LSan。
Callgrind 整段采集原白盒短输入，再分别列出 plan_proto/plan_chain 的指令数。原基线 plan_try 被内联，不能用它作共同的原生函数入口开关。

## 按用户要求追加完整 Octane / SunSpider

```bash
python3 "$TASK/full_confirmation.py"
```

该命令独立于初次筛选门槛，保留原 decision.json。两版现场同批跑，按表项轮换先后顺序，每项每版各一个新进程，复用未插桩 Release。
自动建立 full_confirmation01/、full_confirmation02/ 等新目录，不覆盖旧结果。各目录内有两套逐项表、GM、原始命令及输出、CSV 和 protocol.json。
