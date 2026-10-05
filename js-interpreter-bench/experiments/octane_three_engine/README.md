# Octane three-engine: MAIN_MONOTONIC_V1

同一冻结WSL2 cohort与单调benchNow adapter；不混入旧Windows/Date.now结果。
复用Octane 2.0 commit `570ad1ccfe86e3eecba0636c8f932ac08edec517`和既有strict harness的13 suites/16 Benchmark.run候选，核心算法不修改。

SunSpider独立审计PASS后，由 `../timer_recovery/campaign.py all --attempt 01` 自动执行。
实际兼容性、校准、正式records及最终审计/结果均在 `MAIN_MONOTONIC_V1/attempt01/`。
在审计完成之前不能将候选预算1440视为已完成有效样本。

每sample新进程，必需Setup在外、第一次Run计时、无性能warmup；V8固定`--max-opt=0 --no-lazy`，JSC固定`--useJIT=false --useLLInt=true --validateOptions=true`。
后置验证与TearDown语义沿用 `../octane_strict/harness_audit.md`。
subbenchmark median ratio→完整suite内GM→完整suite间等权GM，不是官方Octane总分；JSC首次frontend与RegExp策略限制明确保留。
