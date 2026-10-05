# 组会补充：V8 Code Cache

| Case | N | SOURCE median ms/Run | cache consumer median ms/Run | consumer/source |
|---|---:|---:|---:|---:|
| controlflow-recursive | 256 | 6.736512 | 6.718395 | 0.997311 |
| access-binary-trees | 256 | 6.154826 | 6.147127 | 0.998749 |
| Richards.Richards | 512 | 2.173980 | 2.185667 | 1.005376 |
| NavierStokes.NavierStokes | 16 | 73.404625 | 73.015844 | 0.994704 |

- 完成240/240目标样本，另存120生产者记录；同一冻结WSL2/d815.6.21、--max-opt=0 --no-lazy。审计PASS_WITH_DISCLOSED_UNKNOWNS。
- 新增证据：四个目标脚本的序列化origin/size与消费者实际反序列化匹配，区别于旧Windows只看标题的smoke。正式采样不启trace；逐条接受标志仍UNKNOWN。
- --no-lazy是本次提前生成；Code Cache是复用序列化表示。本轮是同进程跨isolate，不是磁盘/跨进程缓存，不是裸Ignition字节码。
- consumer/source四case描述性GM 0.999027。内部elapsed/N不是compile/startup计时，不由这些差值计算frontend占比。
- 生产者无消费者heap状态继承，但可能改变CPU/OS缓存/功耗。不能把A/B差异严格归因缓存，也不能认定dispatch/IC瓶颈。
- 原白盒结果与三引擎主表保持不变。若今后要测compile/deserialize/缓存启动，需要独立native API harness；本阶段不继续。
