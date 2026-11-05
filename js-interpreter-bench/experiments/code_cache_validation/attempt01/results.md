# V8 Code Cache supplement: actual results

## Completion and scope

COMPLETED_VERIFIED_IN_PROCESS_CROSS_ISOLATE. Target samples **240/240 valid**, with **120 separate producer records**; producer records are not extra target samples.
WSL2 Ubuntu24.04.2 x86_64, frozen cohort `wsl2-ubuntu2404-x64-20261004`; V8 engine, d8 shell, NOT Node.js.
V8 15.6.21 SHA256 `83b744a5953d2662ea723564d4035a333782a0cc85232d1025929a925150b133`.
Both conditions keep `--max-opt=0 --no-lazy`; A `--cache=none`, B `--cache=code`.
No QuickJS/JSC ranking or main table replacement. Historical inventories including whitebox and both MAIN campaigns are unchanged.

## Evidence before conclusions

1. The previous Windows smoke already showed headings and equal checksums but acceptance remained UNKNOWN: `../../frontend_isolation/raw/mechanism/v8_cache_smoke.txt`. That evidence is acknowledged, not reused as proof of the Linux binary.
2. Actual Linux help, flag dump, four-option smoke and full logs: `probes/logs/`. All `none/code/after-execute/full-code-cache` invocations succeeded. Shell cache options are not listed as ordinary V8 VM flags. Unknown `--trace-deserializer` was not run; actual `--trace-deserialization` was verified and used.
3. Combined diagnostic trace identifies the exact target path at `Serializing from...`; three ordered sizes (two adapters then target) match `Deserializing from...` in the consumer. Consumer shows no new generated-bytecode event and both outputs pass. This holds for all four exact N1 and selected-N target scripts: `probes/cache_proof/`, `summary/cache_evidence.csv`. These are real target serialization/deserialization observations, not merely Produce/Consume headings or snapshot restore logs.
4. `probes/logs/target_deserialization_trace.stdout.txt` additionally contains the minimal target's full source as an AttachedReference and restored bytecode-array objects. Source `--cache=none` diagnostic has snapshot restoration but no corresponding script `Deserializing from`/serialization events.
5. Actual binary disassembly (`probes/demangled_*.txt`) shows `Shell::cached_code_map_`, CachedData buffer copying/lookup; `ExecuteSource` calls CreateCodeCache/StoreInCodeCache before Script::Run for code mode and has a distinct after-Run path. Shell::Main's producer lambda calls Isolate::New at 0x625ce7, RunMain at 0x625e2d, Dispose at 0x625ee2; subsequent consumer runs in the original main isolate at 0x61909a. Thus distinct isolates in one process, NOT two fresh processes. A flags field is temporarily XORed by 1337 at producer isolate construction and restored; its exact field identity is UNKNOWN without reference-source/layout proof, so do not assert every internal isolate parameter is identical. Runtime JS tier flags remain frozen and actual target cache compatibility is evidenced.
6. `CC_TOP` reports prior globals/heap object undefined in both passes and each performs its first call once (`probes/preparation.js`, `probes/logs/cache_code.stdout.txt`). This tests JS state isolation, not machine-state isolation. Producer activity may change CPU/cache/power before consumer.
7. Pinned d8.cc reference retrieval failed (timeout/TLS validation) and browser retrieval also failed. Logs/URLs remain in `probes/source/`; no TLS verification disabled, no whole V8 checkout/build. Reference commit 37fb84941c9be9f9914ee50b1ad366f06a1bd764 is NOT prebuilt exact source/toolchain proof; those remain UNKNOWN.

## Preparation: --no-lazy versus serialized cache

Default-lazy SOURCE probe: cacheStaticWorkload/cacheStaticCallee bytecode generation events appear after `CC_TIMER_START`.
No-lazy SOURCE probe: their generation occurs before `CC_TOP` and timer marker. Code/no-lazy producer serializes before top-level Run; consumer restores before `CC_TOP`, and no new bytecode generation is printed in consumer. Evidence: `probes/logs/bytecode_lazy.stdout.txt`, `bytecode_no_lazy.stdout.txt`, `target_cache_combined.stdout.txt`.
Therefore --no-lazy generates representative static bytecode on this launch before execution; cache reuses serialized compiled representation instead. Neither implies faster interpreter dispatch or exclusion of every frontend operation. Four workload traces retain named static functions/bytecode; exhaustive static coverage, dynamic eval/Function and runtime-generated preparation remain UNKNOWN. This is not a raw Ignition bytecode file interface.

## Correctness and measurement

N1/N2: 16 invocations, 24 checked isolate payloads PASS; selected-N: 8 invocations, 12 checked payloads PASS. Both B passes are validated. Frozen standard drivers preserve checksums/tolerances and original assertions; Octane payload checksum remains null (do not invent one). Richards Run asserts queue/hold totals; NavierStokes preserves original frame-15 checksum assertion and post-timer continuation at small N.
New calibration uses first common power-of-two N with SOURCE and consumer >=1000ms, not old selected-N. Formal 30 per group, each case A-first/B-first 15 times; fixed seed/schedule. Every target and producer internal clock chain passes. Raw stdout/stderr/commands/hash/boot_id and failure details retained in records and CSV. No warmup, no diagnostic/profiling flags in formal commands; no outlier deletion.
The immutable standard payload still says MAIN_MONOTONIC_V1; runner experiment/condition fields map it to this independent supplement, never into the historical table.
Internal elapsed/N includes the first Run, loop/call overhead, GC/helpers/builtins/RegExp and any remaining preparation. Outside: process/VM/source/adapters/required Setup/output. B external process total includes producer and consumer; it is NOT divided by consumer N. Producer and consumer absolute timer origins are never subtracted. First-call diagnostic timings are in N1 cache/source proof logs and N1 pilot records, not warmed consumer timing.

## Descriptive internal execution comparison

| Case | N | SOURCE median ms/Run | cache consumer median ms/Run | consumer/source |
|---|---:|---:|---:|---:|
| controlflow-recursive | 256 | 6.736512 | 6.718395 | 0.997311 |
| access-binary-trees | 256 | 6.154826 | 6.147127 | 0.998749 |
| Richards.Richards | 512 | 2.173980 | 2.185667 | 1.005376 |
| NavierStokes.NavierStokes | 16 | 73.404625 | 73.015844 | 0.994704 |

Four-case descriptive GM consumer/source = **0.999027**; same complete intersection, exp(mean(log(ratio))). No claim of statistical significance or speedup causality.

| Case | Condition | N | median | mean | std(n-1) | IQR | min | max |
|---|---|---:|---:|---:|---:|---:|---:|---:|
| controlflow-recursive | SOURCE_NO_LAZY | 256 | 6.736512 | 6.772854 | 0.288091 | 0.349859 | 6.377937 | 7.654777 |
| controlflow-recursive | CACHE_NO_LAZY_CONSUMER | 256 | 6.718395 | 6.712216 | 0.112374 | 0.118277 | 6.403812 | 6.921824 |
| access-binary-trees | SOURCE_NO_LAZY | 256 | 6.154826 | 6.151681 | 0.125359 | 0.102828 | 5.883680 | 6.425730 |
| access-binary-trees | CACHE_NO_LAZY_CONSUMER | 256 | 6.147127 | 6.138582 | 0.173195 | 0.213918 | 5.829379 | 6.652414 |
| Richards.Richards | SOURCE_NO_LAZY | 512 | 2.173980 | 2.162937 | 0.048040 | 0.035500 | 2.027287 | 2.213855 |
| Richards.Richards | CACHE_NO_LAZY_CONSUMER | 512 | 2.185667 | 2.181152 | 0.062601 | 0.069055 | 2.011092 | 2.306447 |
| NavierStokes.NavierStokes | SOURCE_NO_LAZY | 16 | 73.404625 | 72.937358 | 1.946770 | 1.989750 | 67.928687 | 76.373250 |
| NavierStokes.NavierStokes | CACHE_NO_LAZY_CONSUMER | 16 | 73.015844 | 73.324508 | 3.513494 | 1.702687 | 68.371187 | 89.156938 |

All values above ms/Run (internal elapsed/N). Full precision in `summary/per_condition.csv`, `summary/ratios.csv`. Sample stddev n−1; Tukey halves IQR (lower/upper15). Calibration thresholds select N, not censor later samples; formal target samples below1000ms: 0. Preserved unchanged. Boot IDs: c2785139-8903-4d92-88d0-300aa853d4e5.

## What was and was not measured

Measured: first-call-inclusive internal workload execution in SOURCE and the verified code-cache consumer protocol, plus separate producer internal intervals and external whole-process diagnostic durations.
UNKNOWN: symmetric source compile cost; cache validation/deserialization total cost; cache-only cross-process startup; persistent save/load interface. `profile-deserialization` emits numeric diagnostic intervals (retained), but API/source boundaries and clock semantics were not verified; these are NOT formal stage measurements and are not pure parser/bytecode generation cost.
The selected artifact has no verified standalone cache-file save/consume path in this task. No persistent target-cache artifact or cross-process-cache experiment was produced. This is **IN_PROCESS_CROSS_ISOLATE** only; persistence capability remains UNKNOWN, not falsely declared impossible.
Explicit rejected field is not exposed to JS by the tested CLI. Direct acceptance/deserialization is PROVEN in matched diagnostics; per-formal-invocation acceptance is not traced and is honestly null/UNKNOWN. Every formal record references selected-N diagnostic evidence of its exact script bytes/path/flags. Diagnostic profile times are not used to derive frontend percentages.

## Observations, possible explanations, limits

The four ratios describe the measured internal execution intervals, not eliminated frontend percentages, parser speed or interpreter-loop self time. Both source/no-lazy and cache/no-lazy already prepare representative static code outside the internal region. Remaining A/B differences can reflect producer-induced CPU/OS cache/power state, bytecode allocation/layout, GC/IC/runtime state and noise; these are possible explanations, not identified causes.
This supplement does not establish a new IC/dispatch bottleneck and does not change the existing whitebox mechanism contrasts or three-engine rankings. It improves the evidence for d8 cache capability, not attribution of earlier performance gaps.
A native ScriptCompiler harness with explicit monotonic compile/consume boundaries, CachedData.rejected reporting, hash-keyed cache files and source validation would be worthwhile IF the next question is frontend/cache-startup cost. It is a separately authorized future engineering task, not needed to reinterpret the current internal metric, and was not implemented here.

## Official background (not artifact evidence)

The historical [improved code caching](https://v8.dev/blog/improved-code-caching) article distinguishes serialization from isolate-local reuse and explains why execution can expand cached coverage; [code caching for developers](https://v8.dev/blog/code-caching-for-devs) distinguishes isolate and browser-managed disk caches. Neither establishes this binary's CLI capability. Reference: [15.6.21 d8.cc](https://chromium.googlesource.com/v8/v8/+/refs/tags/15.6.21/src/d8/d8.cc); retrieval failure retained.

See `audit.json`, `protocol.md`, `capabilities.json`, `README.md` for audited scope and exact runnable commands. Stop here; no engine optimization, new main benchmark, or publishing.
