# Baseline

Official source: [WebKit/WebKit](https://github.com/WebKit/WebKit) at fixed commit [`fd3406f133a4e56d7aaf399ba5611ae44b8da7e9`](https://github.com/WebKit/WebKit/commit/fd3406f133a4e56d7aaf399ba5611ae44b8da7e9), committed 2026-09-20 06:07:14 UTC. The clean sparse checkout is `engines/webkit-fd3406f`; the WSL source/build paths, official build command, failure recovery and compiler details are in [build.md](../build.md) and [environment.txt](../environment.txt). Build: Ubuntu 24.04.2 LTS under WSL2, x86_64, GCC 13.3.0, JSCOnly Release (`-O3 -DNDEBUG` per CMake cache), `ENABLE_C_LOOP=OFF`. The actual shell is `/home/mzyx/jsc_build_fd3406f/JSCOnly/Release/bin/jsc`, SHA-256 `65c824a055405bf62b05e21d54515a72a1f0187a4d91225d00a6da969d35879f`; dynamic `libJavaScriptCore.so.1.0.0` is separately frozen in [binary_hashes.txt](../binary_hashes.txt). Basic JS smoke: `SMOKE_PASS:107` (`../probes/smoke/basic.stdout.txt`). This `jsc` has no `--version` output; commit and hashes identify it.

# JSC execution tiers

The current source/build exposes x86_64 offlineasm LLInt, Baseline, DFG and FTL JIT facilities (`Source/JavaScriptCore/CMakeLists.txt:313-331`, `runtime/OptionsList.h:84-88,256`; actual CMake cache). Runtime selection is conditional, not a universal fixed tier sequence. The default hot probe reached subsequent tiers in this build. See [tier_architecture.md](../tier_architecture.md).

# LLInt-only configuration

Validated command for **LLInt-only JavaScript execution**:

```sh
/home/mzyx/jsc_build_fd3406f/JSCOnly/Release/bin/jsc \
  --useJIT=false --useLLInt=true --validateOptions=true script.js
```

`--useJIT=false` invokes `disableAllJITOptions` (`Source/JavaScriptCore/runtime/Options.cpp:731-752,880-883`); the actual `--options` dump has `useLLInt=true`, `useJIT=false`, `useBaselineJIT=false`, `useDFGJIT=false`, `useFTLJIT=false`, and `useRegExpJIT=false` (`../probes/tier/options_llint_candidate.txt`). `--useLLInt=true` is redundant but explicit. This is not a “pure interpreter-only process”: executable-memory/JIT-related policy, RegExp JIT, thunks and other subsystems can be affected. Option booleans `useOSREntryToDFG/FTL` remain true, but their targets are disabled. Full audit: [options_audit.md](../options_audit.md).

# Tier evidence

The fixed `../probes/tier/hot_probe.js` called `hotFunction` 500,000 times. Both runs printed `TIER_CHECKSUM:446201424` and exited normally (`default.stdout.txt`, `llint_only.stdout.txt`). Run commands:

```sh
jsc --verboseCompilation=true --verboseOSR=true --logCompilationChanges=true hot_probe.js
jsc --useJIT=false --useLLInt=true --validateOptions=true \
  --verboseCompilation=true --verboseOSR=true --logCompilationChanges=true hot_probe.js
```

The default positive-control trace (`default.stderr.txt`) includes `JIT compilation successful`, `BaselineFunctionCall`, `Triggering optimized compilation`, `DFGFunctionCall` and `Performing OSR`. The LLInt-only trace (`llint_only.stderr.txt`) contains `Installing ... LLIntFunctionCall` and two `Entered ... osr` *slow-path entry* lines, but no JIT compilation, JIT code installation or successful OSR transition. Source `llint/LLIntSlowPaths.cpp:371-378,418-427,481-499` logs entry **before** checking `useBaselineJIT`; with this option false it returns null. Therefore `llint_only_osr_observed=false` in `audit.json` means **no successful OSR into JIT observed**, not absence of OSR-named log lines. This is probe-level runtime evidence plus source/option evidence; it does not assert a process-wide proof that no native generated code exists.

# Frontend behavior

Source-only `../probes/frontend_order/static_function_probe.js` declares a static function before `MARKER_TIMER_START` and first calls it after the marker. With `--dumpGeneratedBytecodes=true`, the runtime marker occurs at `static_function.stderr.txt:81` and the function bytecode dump at `:82`. `bytecode/UnlinkedFunctionExecutable.cpp:245-276` prepares the code block on request. Thus static declaration is **not sufficient** to prove that all function bytecode generation occurs before a future internal timer. `static_frontend_before_timer=false` for this probe.

The shell has a restricted `diskCachePath` (`runtime/OptionsList.h:616`, `jsc.cpp:1416-1513`). A second-process cache-consumption probe decoded a 3488-byte cache before the timer marker (`cache_consume.stderr.txt:1`), and omitted the fresh `Compiled ... staticWorkload` line, but function code still first appeared after timer start (`:83`). Source `UnlinkedFunctionExecutable.cpp:245-252,283+` may lazily decode cached function blocks on demand. No pre-timer mechanism was validated that guarantees full function preparation *without running the workload*. `forceEagerCompilation` in this revision mainly changes JIT thresholds/eval-cache settings (`runtime/Options.cpp:919-931`). **STATIC_FRONTEND_EXCLUSION = UNKNOWN** for a future strict JSC experiment; do not claim frontend-free timing and do not silently pre-warm the workload.

# RegExp caveat

Default `useRegExpJIT=true` and LLInt candidate `useRegExpJIT=false` are recorded by actual option dumps; default RegExp JIT execution trace was observed, while LLInt-only trace was empty for a matching correctness probe (`../probes/smoke/regexp_default.stderr.txt`, `regexp_llint_only.stderr.txt`). See [regexp_execution_policy.md](../regexp_execution_policy.md). `regexp-dna`/Octane `RegExp` will include regex-runtime policy, not just LLInt bytecode dispatch.

# LLInt IC status

`useLLIntICs=true` in both effective option dumps (`options_*:499`). Current property/call IC paths reference it (`llint/LLIntSlowPaths.cpp:750,864,1089`, `bytecode/CallLinkInfo.cpp:245,274`). See [llint_ic_audit.md](../llint_ic_audit.md). No IC-on/off performance test was run; cache hit rates remain UNKNOWN.

# Compatibility

One correctness smoke per selected case, all exit 0 with the expected strict result marker: SunSpider `bitops-bitwise-and`, `controlflow-recursive`, `regexp-dna`, `string-unpack-code` (4/4); Octane `Richards`, `NavierStokes`, `RegExp`, `CodeLoadClosure` (4/4). Exact outcomes and raw streams are `../compatibility_smoke.csv` and `../probes/smoke/compatibility_raw/`. The existing generated workloads were not edited; small JSC adapters supply `console.log` and Octane `scriptArgs` before loading the workload (`../probes/smoke/shell_adapter.js`, `octane_correctness_adapter.js`). SunSpider wrappers contain their own checksum/allowed-checksum checks; Octane strict output reports `correctness=PASS`. This is **selected-case compatibility**, not full-suite certification or timing. The incidental `elapsed_ms` fields in the correctness stdout are not analyzed as performance samples.

Shell API probe (`../probes/smoke/shell_api.stdout.txt`) found `print`, `load`, `read`, `readFile`, `quit`, `gc`, `performance.now`, and `Date.now`; `console` was undefined, and `arguments` was undefined in that no-argument invocation. Timer probe (`../probes/timer/timer.stdout.txt`) observed 1 ms minimum positive Date.now step and ~0.02 ms performance.now step in 100,000 consecutive calls; `jsc.cpp:3557-3558` uses monotonic time with reduced resolution for performance.now. Retain Date.now for strict method comparability unless separately validated across all engines. These timer checks are not benchmark samples.

# Performance comparability

**NO. PERFORMANCE_COMPARABILITY = NO.** Current QuickJS and V8/d8 results are Windows 11 native; this JSC artifact is an Ubuntu/WSL2 ELF. OS mismatch prevents direct timing comparison with existing Windows QuickJS/V8 results. No JSC/QuickJS/V8 performance ratio or geometric mean is reported.

# Confirmed observations

- A pinned official-source JSCOnly Release shell was built successfully (successful build log and binary/library SHA-256).
- The actual LLInt-only option dump disables Baseline, DFG, FTL and RegExp JIT; default hot probe produced JIT/OSR events, while LLInt-only probe produced no successful JIT transition.
- The source-only static-function probe still prepares function code after a would-be timer start.
- Eight selected strict workload correctness smokes passed once under LLInt-only settings.

# Unknowns

- Whether a future JSC strict wrapper can guarantee *all* static function bytecode decode/link/compile before its timer without altering no-warmup semantics: **UNKNOWN**.
- Full 26-case SunSpider and full Octane compatibility, timer equivalence across three engines, WSL-to-native timing transfer, and performance rank: **UNKNOWN / not tested**.
- Exact system-library hashes, per-workload LLInt IC behavior, and any compiler/link behavior not captured by the saved CMake/cache and generated-command scan: **UNKNOWN**. Engine assertions follow Release `-DNDEBUG`; lightweight `_GLIBCXX_ASSERTIONS=1` was reported at configure time (`../build_configuration.txt`).
- Whether a verified Windows-native JSC artifact matching this revision/build mode can be obtained with current resources: **UNKNOWN**.

# Phase 2 recommendation

Phase 1 **passes mechanism validation**, but **does not authorize direct three-engine timing**. Resolve the environment mismatch first: either re-freeze all three engines on one Linux-native host or obtain/build/revalidate a native Windows JSC. Then solve or explicitly account for JSC's lazy static-function frontend before any “frontend-excluded” strict timing claim. Alternatives are in [phase2_plan.md](phase2_plan.md). No Phase 2 work was started.
