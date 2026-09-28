# JSC Phase 1 — baseline and LLInt validation

This directory freezes a JavaScriptCore mechanism-validation baseline. It is **not** a performance comparison. The existing QuickJS and V8/d8 baselines run natively on Windows 11 x64; this JSC executable runs in Ubuntu 24.04 under WSL2. **PERFORMANCE_COMPARABILITY = NO.** Do not place its timings beside the existing Windows results.

Source: official [WebKit/WebKit](https://github.com/WebKit/WebKit), fixed commit `fd3406f133a4e56d7aaf399ba5611ae44b8da7e9`. Build: current checkout's `Tools/Scripts/build-jsc --jsc-only --release`; no WebKit source changes. The source checkout is `engines/webkit-fd3406f` and the WSL build is documented in [build.md](build.md). Shell and library hashes are in [binary_hashes.txt](binary_hashes.txt).

Evidence map:

- `build_attempt.log`, `build_attempt_2.log`: preserved initial sparse-checkout failure and successful Release build.
- `probes/smoke/`: shell, RegExp and eight one-shot workload correctness probes; [compatibility_smoke.csv](compatibility_smoke.csv) is the case index.
- `probes/tier/`: complete option dumps and default/LLInt-only hot-probe stdout/stderr.
- `probes/frontend_order/`: static-function generation and disk-cache ordering; cache use is exploratory, not a benchmark mode.
- `probes/timer/`: timer capability probe only.
- `summary/audit.json`, `summary/results.md`: machine-readable and narrative decisions.
- `summary/phase2_plan.md`: alternatives before any three-way timing.

No SunSpider/Octane performance campaign, IC comparison, or cross-OS performance ratio was run in this phase. Existing QuickJS, V8, and formal benchmark sources were not changed.
