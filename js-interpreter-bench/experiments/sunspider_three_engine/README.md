# SunSpider three-engine comparison

Current decision: **BLOCKED_TIMER**. All 156 N=1/2 correctness invocations PASS (26/26 compatible cases), but the Date.now wall clock fails quality checks. No formal samples or performance GM exist. Do not treat provisional calibration selections as approved N. See `results.md`, `summary/audit.json`, the retained failed pilots and `diagnostics/stabilization/`.

Independent campaign in the existing `wsl2-ubuntu2404-x64-20261004` cohort. No old Windows timings enter any statistic. Runtimes/flags are inherited from `../three_engine_baseline/manifest.json`; no build or download is performed.

MAIN: **first-call-inclusive interpreter-mode execution time**, internally measured by Date.now, first workload call included, no performance warmup. The unchanged standalone workload bytes are wrapped in one function with the previously frozen checksum expression; the unchanged Prompt 2 standard driver is embedded identically for all engines. Adapters load before the script. Static JSC first-call frontend remains included; dynamic compilation, GC, helpers, native builtins and RegExp remain actual timed costs. Not pure interpreter-loop timing.

First validate all 26 cases at N=1/2 on three engines, using frozen old correctness values and original assertions/tolerances. Choose the first common N=1,2,4,... with all internal intervals >=1000 ms; cap N=65536, each process timeout=300 seconds. Independently check every selected-N call. Then collect 30 fresh-process samples per case/engine. Six permutations occur five times per case; each engine occupies each position ten times. Seed=20261005. Keep below-target samples and all outliers.

Optional independent **DIAGNOSTIC_ONE_EXPLICIT_WARMUP**: predeclared cases access-binary-trees, date-format-xparb, regexp-dna, string-unpack-code; exactly one explicit workload call before the timer on all three engines. Separate calibration/raw/statistics, 30 repetitions. It changes IC/heap/GC/global/persistent state, not simply frontend cost. Never mix it into MAIN.

Original campaign command (do not resume until the clock issue is resolved):

```powershell
wsl.exe -d Ubuntu -- python3 -B /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/sunspider_three_engine/run.py all
```

The journal in `records/` saves each position and failed attempt separately with exclusive creation. Resume skips valid completed positions. `raw/` CSV exports are write-once views of that journal; no evidence is overwritten. Commands, hashes, streams, timestamps and external wall time (diagnostic only) are retained. Statistics use elapsed_ms/N, sample standard deviation, Tukey median-of-halves IQR, ratios of medians, and exp(mean(log(ratio))) on one shared complete intersection. Tag subsets are mechanism-sensitive descriptions, not builtin-free timing.

Verification only: `run.py verify`. Independent audit: `audit.py`. Final files include config/input/runtime manifests, environment snapshots, compatibility, selected N, schedule, raw, per-case/pairwise summaries and `summary/audit.json` / `results.md`.

The bounded read-only clock-settling reproduction is `run_stable.py`; it waits up to 180 seconds for twelve consecutive five-second checks agreeing with a monotonic clock (within 5 ms) and NTP synchronized, without workload warmup or system changes. The recorded attempt failed. Its current default is **diagnostic only**, even if the gate passes. The original launcher is preserved in `diagnostics/launchers/run_stable.before_blocked.py`; the post-block safeguard also rejects resuming contaminated pilots. Recovery requires either fixing and revalidating Date.now then starting a **fresh calibration attempt**, or authorizing an independently named uniform monotonic-clock mode. Existing positive clock-contaminated pilots must not be reused as a fresh calibration. `finalize_blocked.py` independently reconstructs source/driver bytes and rechecks all saved correctness/pilot commands/hashes; it records the honest pre-formal stop instead of invoking the full-sampling auditor on missing data. `audit.py` is for a completed campaign, not a substitute for this blocked-stage audit.
