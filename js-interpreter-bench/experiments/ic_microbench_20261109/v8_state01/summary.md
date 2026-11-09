# V8 的缓存状态探针：尚无逐次命中率

使用与 performance02 相同的 V8_ON ELF、snapshot 和
`--jitless --no-lazy --use-ic`，另开启状态日志、目标函数字节码输出及 DebugPrint。
分别复用 EVAL_COLD 目标命中率 0% 与 100% 的完整脚本（201,326,592 次读取），
只在末尾追加 `%DebugPrint(readLoop)`。两次 checksum 均正确，ELF 前后 SHA 不变。
本次是诊断，不新增正式性能样本；诊断耗时不并入五轮结果。

目标字节码是 `GetNamedProperty r0, [0:"x"], FBV[2]`，位于 readLoop
字节码偏移 20，源码第 97 行第 20 列，与两次日志中的 x 事件位置一致。

| EVAL_COLD 输入参数 | V8 实测状态事件 | 解释 |
|---:|---|---|
| 0% | `0 → 1 → P` | 未初始化 → 单态 → 多态 |
| 100% | `0 → 1` | 未初始化 → 单态 |

0% 输入使用两种形状交替，EVAL_COLD 单槽每次替换；V8 实际进入多态缓存状态，
因此不能把该输入标为“V8 0% 命中”。稳定的多态缓存可以同时处理两种形状。
但状态事件不是逐次命中记录：**不能把两条日志解释为只有两次未命中，也不能填造命中率。**

现有 `--log-ic` 的帮助说明就是记录 IC state transitions；
已有历史诊断 `ic_mechanism_audit/attempt01/v8_diagnostic_gate.json` 同样把 per_access_hit_rate 留空。
`--runtime-call-stats` 是运行时调用统计，也不自动等价于该目标位点的命中次数。

要得到准确比例，应在独立诊断构建中，对这个函数的目标反馈位点统计总查询、
单态/多态等缓存成功次数、无反馈和回退次数，并确保每次访问只归入一个类别。
计数版只测机制，正式时间继续沿用原 Release ELF。
当前仓库有固定参考源码摘录，可辅助设计插桩，但预编译 artifact 的精确源码提交并未证明，
也没有可直接重建这一制品的完整源码 checkout/构建配置；不能把参考源码诊断版冒充原 ELF。

完整命令/身份见 manifest.json，状态日志见 x.hit*.transitions.txt，
完整原日志另有 *.log.gz，字节码与 DebugPrint 见 state.hit*.stdout。
