# Preparation decision

**READY_FIRST_CALL_INCLUSIVE**. All three pinned Linux runtimes executed successfully in the same Ubuntu 24.04.2 WSL2 distro, on the same x86_64 host. [audit.json](audit.json) checks mode evidence, exact correctness positions, standard-script hashes, timer capability and unchanged old data. The latest successful WSL verification before the untraced RegExp probe checked all runtime/dependency/input hashes; the final stored-evidence audit rechecks every correctness record and local preservation/hash manifest. A future sampling session must verify again.

This is the user-authorized independent WSL2 cohort `wsl2-ubuntu2404-x64-20261004`, not a redefinition of the old Windows experiment. Repository/ancestor AGENTS.md was not found. README, baseline_manifest, the protocol and the specified previous experiment documents were read. Existing Windows qjs/d8/snapshot hashes were rechecked against their old frozen values; old results remain separate.

# Frozen artifacts

| Engine/shell | Version / source identity | New cohort executable SHA-256 |
|---|---|---|
| QuickJS/qjs | 2026-06-04, `04be246001599f5995fa2f2d8c91a0f198d3f34c` | `140d5233b0337d91cb0f994ae4a051e49aa04da8802acfaedf0a01b81a620b79` |
| V8/d8 | Official Linux64 canary rel 15.6.21 | `83b744a5953d2662ea723564d4035a333782a0cc85232d1025929a925150b133` |
| JSC/jsc | WebKit `fd3406f133a4e56d7aaf399ba5611ae44b8da7e9` | `65c824a055405bf62b05e21d54515a72a1f0187a4d91225d00a6da969d35879f` |

Evidence: [manifest.json](../manifest.json), `runtime/quickjs_source.json`, `runtime/quickjs_build.log`, `runtime/v8_version.json`, `runtime/*_file.json`, `runtime/*_ldd.json`. Actual binary sizes are 5,090,744 / 53,498,016 / 633,408 bytes respectively. JSC is the unchanged Phase 1 binary; its library hash remains `2ba4fe56f79c97cafafe065454bd5b5c6c168e536ab00d33d5cc48f65b375f79`. The new d8 snapshot hash is `5af8f6d23e18aca97e3d89b1cab0815a56235c29f37728ffe10255fdea035749`, ICU hash `495c45cc7a65562ec461f860c310c6b66e006acd96833f61d1aa31f77fe18cf1`; it is not the Windows snapshot.

Official d8 ZIP: [chromium-v8 storage](https://storage.googleapis.com/chromium-v8/official/canary/v8-linux64-rel-15.6.21.zip), 21,045,495 bytes, SHA-256 `5791134b7e2bca44468e37c536511809d47fb0302ab86d37b875073887be81c1`; CRC checked and original archive retained. The release metadata has clang=true, debug_code=false, sanitizers=false, official_build=false. `official_build=false` is retained as a build field; it does not change the official distribution provenance. Exact source commit, Clang revision and complete GN args remain **UNKNOWN**; the verified version-tag commit is a reference, not artifact source proof.

QuickJS uses the exact old source commit, newly built by upstream `make -j2 qjs qjsc` with GCC 13.3.0 and actual `-O2`, no manual optimization flags or engine patch. JSC keeps official/default CMake Release `-O3 -DNDEBUG` and lightweight standard-library assertions. These are different recorded build configurations, not claimed to be equivalent.

# Platform and controls

[environment.txt](../environment.txt), `runtime/environment_snapshot.json` and `runtime/windows_host_snapshot.json` record AMD Ryzen 7 5800H, 8 physical/16 logical cores, Windows 11 build 26200 host, Linux `5.15.167.4-microsoft-standard-WSL2`, Ubuntu 24.04.2 and guest memory 8,252,641,280 bytes. The host reports balanced power plan; CIM clock metadata is 3201 MHz, not actual per-sample frequency. CPU temperature, power limits, physical frequencies and scheduler isolation remain **UNKNOWN**. Background process/load snapshots were saved; this is not a guarantee of future load. The manifest fixes actual Linux shared-library hashes as well as the explicit snapshot/ICU/JSC library files.

All execution samples in this preparation are WSL2 Linux processes. Windows was used for artifact acquisition and reading/materializing stored evidence. No remote/native Linux host was assumed. Optional final WSL re-audit launch hit two automatic approval-review timeouts; it never started. The completed audit uses the already successful runtime verification plus materialized records; details are `runtime/final_audit_execution.json`.

# Execution mode evidence

| Engine | Frozen MAIN flags | Current artifact evidence |
|---|---|---|
| QuickJS | None | DIRECT_DISPATCH=1, dispatch_table symbol and indexed indirect jumps in the new qjs itself; hot checksum PASS |
| V8 | `--max-opt=0 --no-lazy` plus fixed snapshot path | Effective Sparkplug/Maglev/TurboFan=false; default probe positive; candidate has no successful later-tier/OSR event, interpreted status and Ignition bytecode |
| JSC | `--useJIT=false --useLLInt=true --validateOptions=true` | Effective Baseline/DFG/FTL=false; default probe positive; candidate installs LLInt code and has no successful JIT/OSR transition |

Evidence: `probes/tier/summary.json`, full help/flag/options dumps and default/candidate stdout/stderr. Two JSC OSR slow-path entries remain; current source returns before entering JIT when useBaselineJIT=false. Diagnostic options are separate from the MAIN command prefixes. Detailed source/RegExp/builtin caveats: [runtime_policy.md](../probes/tier/runtime_policy.md). The counts are trace matches, not unique compilation totals.

RegExp policy differs: QuickJS uses its C regex VM, V8 permits regex native compilation, and JSC's master JIT flag disables RegExp JIT. JSC default/candidate regex trace is positive/absent with matching correctness. V8's requested regex trace flag is listed but readonly and failed (-6); the same probe without tracing passes. Its actual regex native execution is **UNKNOWN**, not false. No workaround flag changed MAIN.

# Frontend decision and MAIN boundary

Current JSC `reportBytecodeCompileTimes` logs actual generation of both the static workload and child **between** timer markers (`probes/frontend_order/jsc_source/stderr.txt:179-235`). The code hash associates generation with the named functions; source `BytecodeGenerator.h:398-413` places the report around generation itself. The eight selected actual JSC Run/workload targets also have post-marker generation events. This is stronger evidence than dump ordering alone.

Current source review found no validated no-execution prepare-all mechanism in this frozen shell. `forceEagerCompilation` adjusts JIT thresholds, checkSyntax validates syntax, codeblock getters read existing blocks, and the unchanged Phase 1 disk cache still does not prove eager per-function decode/link. Investigation was bounded by an initial ~90-minute budget and stopped after targeted source/trace checks. No workload pre-call was used to hide lazy preparation. [source_audit.md](../probes/frontend_order/source_audit.md) records locations, coverage and blind spots.

MAIN name: **first-call-inclusive interpreter-mode execution time**. It measures Date.now around the first Run and N−1 further Runs in a new process. Source loading/adapter/top-level evaluation/required Setup precede the timer. JSC first-call frontend, GC, helpers, builtins, regex, dynamic frontend and original in-Run assertions remain inside when they occur. Standard driver variables have a separate `__teb` namespace/IIFE scope. Identical generated core/driver/config goes to every engine, with only preloading transport/console adapters differing outside the timer.

QuickJS recursively compiles static child functions before top-level evaluation; V8 --no-lazy has pre-marker bytecode for both static-probe functions and eight selected primary Run targets. These do not make the **three-engine** mode frontend-excluded: JSC demonstrably differs, and dynamic eval/Function or later code flushing may still compile inside the interval. `STATIC_FRONTEND_EXCLUSION=UNKNOWN`; `READY_PREPARED_NO_WARMUP` is not claimed.

The driver also supports a separately named DIAGNOSTIC mode with one explicit workload warmup on every engine. It was not used for a performance comparison. It changes IC/heap/GC/global/persistent state; no zero-frontend claim or mixed-policy GM is allowed.

# Timer and correctness

Date.now is available in all three; each 200,000-call probe observed minimum positive steps of 1 ms and no backward step. This does not prove monotonicity or a complete error bound. QuickJS Date.now uses gettimeofday (`quickjs.c:55397-55402`). Three native performance.now implementations were also found, with different observed steps; MAIN retains the common Date.now policy. Evidence: `probes/timer/summary.json` and raw commands/streams.

| Correctness group | Cases | N | Outcome |
|---|---|---|---|
| SunSpider | bitops-bitwise-and, controlflow-recursive, regexp-dna, string-unpack-code | 1 / 2 / 16, all three engines | 36/36 PASS |
| Octane | Richards, NavierStokes, RegExp, CodeLoadClosure | 1 / 2 / 16, all three engines | 36/36 PASS |

Total **72/72 independent records**, each a new process, no performance warmup. `probes/correctness/results.csv` links every command, exit code, stdout, stderr, checksum/validation and common script hash. SunSpider validates each returned checksum in correctness mode and retains original assertions. Octane retains original Run/TearDown correctness; NavierStokes N1/N2 continues after the region to its original frame-15 assertion, recording 14/13 extra calls. N16 naturally covers it. RegExp Setup constructs required input and omits the old harness priming Run; CodeLoad and fluid state evolve through Runs without algorithmic reset. PASS is coverage of these mechanisms, not exhaustive semantic proof.

Three untraced bitops MAIN N16 smokes also passed (`probes/timer/main_smoke_*/`), proving the actual driver path works without diagnostic flags. No timing ratio was calculated from these incidental smoke intervals.

# Preservation and limits

`preservation_before.json` equals `preservation_after.json`; the stored-evidence auditor independently recomputes protected file hashes. The old baselines, runner flags, raw data and summaries were not altered. Exact old Windows qjs/d8/snapshot hashes still match their earlier manifest.

Ready for future **same-cohort MAIN** work, not for mixing old Windows measurements or declaring pure interpreter-loop cost. Full-suite compatibility, new calibration N, formal repeated statistics, performance ranks, GC/builtin/regex/frontend cost fractions, thermal/clock behavior and Linux-native generalization remain **UNKNOWN / not measured**. Full formal sampling count here is **0**. The preparation harness supports the eight selected cases only.

# Next command

Use [next_commands.md](next_commands.md). Start by verifying the frozen runtime/dependency/driver/source hashes in Ubuntu before a future run. This phase ends with prepared artifacts and adapters; it does not execute Prompt 3.
