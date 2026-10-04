# Decision

**BLOCKED_TIMER**. See [complete results and evidence](../results.md) and [audit.json](audit.json).

Same WSL2 cohort; MAIN first-call-inclusive interpreter-mode execution time; Date.now; no performance warmup. Correctness **156/156**, compatibility **26/26**. Saved **163 pilot attempts**, including two invalid timer failures. Six provisional selections are not approved after the clock-quality failure. Selected-N validation and formal sampling were not run.

Formal valid/expected **0/2340**. All three geometric means are UNKNOWN/null; performance intersection empty. No rankings or tag-subset claims were produced. The independent evidence/input audit passed, but 180-second clock stability failed with repeated multi-second wall-clock/monotonic discrepancies. Runtimes, flags, core workloads and old data remain unchanged.

Recovery: fix and validate Date.now then start a fresh calibration attempt, or authorize a separately named common monotonic-clock mode. Never reuse contaminated pilot timing as new calibration evidence.
