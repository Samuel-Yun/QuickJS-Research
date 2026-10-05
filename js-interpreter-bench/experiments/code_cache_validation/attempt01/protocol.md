# CODE_CACHE_EXECUTION_COMPARISON_V1 (independent attempt01)

This is a V8-only, same frozen WSL2 cohort supplement, not a new three-engine ranking.
V8/d8 15.6.21 uses the existing manifest, snapshot, ICU and immutable adapters.
JS flags remain `--max-opt=0 --no-lazy`. A adds `--cache=none`; B adds `--cache=code`.
No frozen engine, benchmark, runner, historical manifest/raw/summary is edited.

## Gate and identity

Only after target-origin serialization, ordered matching consumer deserialization and valid producer/consumer output are observed can B be measured. Diagnostics add only `--trace-serializer --profile-deserialization --print-bytecode`; these switches are absent from formal samples. Diagnostic warnings and full logs are retained.
The actual binary disassembly supplements unavailable version-reference source; tag commit is NOT exact artifact commit proof.
Acceptance is directly evidenced in diagnostic invocations. Formal records do not invent a `rejected` boolean or pretend to trace every hit: they refer to the same target-script/N diagnostic evidence. Nontraced per-invocation acceptance remains UNKNOWN.

Read-only reuse of `timer_recovery/campaign.py:Campaign.source` generates the exact existing standard workload/driver bytes. Original payload mode `MAIN_MONOTONIC_V1` and phase are preserved; runner condition/experiment metadata is the independent identity. These records never enter old MAIN tables.
For each case/N/phase one file is passed to A and both B passes. Correctness phase uses existing each-call rules, with no internal timing. Measure phase uses the existing timed loop and post-checks. Phase differences are explicit and caches are freshly produced for the precise file within each invocation; no stale cache is reused.

## Measurement

Four units: `controlflow-recursive`, `access-binary-trees`, `Richards.Richards`, `NavierStokes.NavierStokes`.
Frozen `benchNow` captures native `performance.now`; only differences within one isolate's origin are used. No global timer replacement.
Startup/VM initialization/source/adapter and required Setup are outside. First workload Run, all N calls, loop/call overhead, first-call preparation if any, GC/helpers/builtins/RegExp/dynamic compilation and original Run assertions remain inside. No consumer or source performance warmup.
B's temporary producer isolate executes the same script, then is disposed; a distinct main isolate consumes serialized in-process `cached_code_map_` data. This is **IN_PROCESS_CROSS_ISOLATE**, not a persistent cache and not two processes. Isolation does not reset CPU/OS/power state; producer activity is a confound. Consumer target is the second segmented payload, NOT process total/N. Both passes must be correct.

N1/N2 independent correctness; new N=1,2,4,... pilot processes until A and B consumer each >=1000ms at the first common N. Maximum N=65536; invocation timeout=120s. Old pilot N is not reused. Selected-N independent correctness is required. Low-N NavierStokes retains its original post-timer continuation to the existing frame-15 assertion; extra_validation_calls are recorded, not silently timed.
30 fresh process invocations/case/condition, expected 240 target samples plus 120 separately exported producer records. Fixed seed 2026100517; each case A-first/B-first exactly 15 rounds, cases shuffled/interleaved. Sequential only; no profiling, traces, LD_PRELOAD, or other engine campaign during sampling. Pilot and formal are separate.

All stdout/stderr, failed positions, zero/invalid clocks and outliers remain. Any correctness/clock exception is saved and stops the affected campaign. Resume only valid unique positions with identical command/script/protocol hash. No automatic failure replacement or epsilon values.
Positive finite floating intervals satisfy stop-start=elapsed, elapsed/N=per-call and internal<=external+5ms; enclosure of B is weak because external includes both passes.

## Statistics and reporting

Median and mean of internal elapsed/N, sample stddev(n-1), Tukey median-of-halves IQR (30 values: lower/upper15), min/max. Ratio=CACHE_CONSUMER median / SOURCE median. Optional four-case descriptive GM=exp(mean(log(ratio))) on the same complete intersection, not engine speed ranking.
Compilation, validation/deserialization and cache-only startup costs remain UNKNOWN without verified monotonic API/source boundaries. Profile-deserialization traces are diagnostics, not these formal metrics. Never infer frontend percentages from execution differences, or identify pure dispatch/IC cost from this experiment. JS JIT restriction does not disable all native runtime/RegExp implementations.
