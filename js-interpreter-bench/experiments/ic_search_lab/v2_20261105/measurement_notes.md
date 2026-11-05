# 本轮计时与统计的具体边界

沿用旧协议，不更换计时器或 benchmark 算法：两个 shell 的适配器提供 native 单调时钟。指标为 `elapsed_ms/N`，单位 **ms/完整 Run**。不是某条 opcode 的 self-time，也不是新进程从启动到退出的墙钟；外层墙钟另外保存作诊断。

## 区间

- source/driver 加载、可提前完成的编译和 adapter 在内部计时外；不能把所有运行期准备都笼统说成已排除。
- SunSpider：一次 wrapper 调用包含完整原 case，N次循环在内部计时内；计时后验证最终 checksum。原 case 自带的运行期工作与断言仍按实际位置执行。
- Octane：注册核对及原有 Setup 在计时外；取得 `test.run` 后在内部计时内调用N次；原有 TearDown及额外结果门禁在计时后。Crypto.Decrypt 沿既有协议先在计时外调用 encrypt 准备密文，这不等于额外预跑 Decrypt.Run。不能把无额外Run预跑说成所有JS状态全冷。
- RegExp 专门初始化、zlib 宿主读取适配、NavierStokes 额外校验保持现有 driver，逐进程脚本 SHA 可查；没有为新候选单独改变边界。
- 首次 Run 属于N次；不另加 workload warmup。后续重复自然改变 IC、对象、GC 和全局状态。GC/helper/builtin/RegExp及动态执行成本按原行为保留。
- s003 第一次函数进入时才建立 IC metadata，因此其中一些准备可落入 timed Run；这项成本没有被藏到计时外。原版/其余候选也可能有首次运行准备，不能称 pure interpreter-loop。

## 数据集

SunSpider完整26项；`string-base64`、`string-validate-input` 的 Math.random 未种子化，各进程输入不保证逐字相同。本轮保留原模式和两项，不把它们造成的差异直接解释为 IC 时间。若最终决定依赖它们才另做独立 seeded 敏感性模式，不把新模式拼进原26项。

Octane完整固定17项，其中 Crypto 复用确定性 preload 与 N 对应的密文 golden。主聚合核心16项/13suite，扩展加入 zlib 成17项/14suite；同suite多个Run单元先取比值的几何平均，再对suite等权。不是官方分数；Box2D与官方latency不在既有覆盖内。

## 初筛和复筛不能混合

初筛每项只有一个候选进程，前后各一个新A，`ratio=candidate/sqrt(A_before*A_after)`。原始A漂移另外保留；该比值没有统计区间，不能保证消除漂移。`screen_summary.csv` 的普通GM列是case等权诊断列，Octane正式讨论使用core/expanded两列，不与suite等权混称。

复筛为每项A/候选/真实parent M各3个新进程，以整轮配对；固定seed=20261105，每项三种位置各一次，轮内case顺序打乱。绝对时间先除N，再对三个样本取中位数；比值为候选中位数/对照中位数，<1表示候选更快。Q1/Q3用Tukey分半中位数（奇数N排除总体中位数）；n=3时恰好是最小/最大，分布描述非常粗。

10000次共享整轮抽样（seed=20261105），每次重算每项中位数比及预定层级GM；95%使用线性插值百分位。只有3个原始轮次，抽样索引最多27种有序组合，不能把10000称为10000个独立新实验。探索性、未校正多重比较，也有搜索选择偏差。区间跨1表示方向未定，不证明完全无收益。

正式30进程确认仅在 `recheck_policy.json` 的预定门槛满足后才开始。初筛、复筛、正式是不同阶段，不把387条复筛进程写成已经完成30进程正式确认，也不把两名候选的数据拼起来做更大的n。
