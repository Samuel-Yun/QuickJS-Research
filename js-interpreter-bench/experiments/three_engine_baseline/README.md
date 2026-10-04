# Three-engine cohort — Phase 2 preparation

Status: **READY_FIRST_CALL_INCLUSIVE** ([audit](summary/audit.json)). Cohort: `wsl2-ubuntu2404-x64-20261004`, Ubuntu 24.04.2 / WSL2 / x86_64 on this Windows 11 host. The user explicitly authorized this separate WSL2 cohort on 2026-10-04. The old README/protocol's Windows-only definitions and all previous results remain unchanged. New WSL measurements must never be combined with old Windows measurements.

| Runtime | Frozen identity | Build and execution |
|---|---|---|
| upstream QuickJS/qjs | 2026-06-04; `04be246001599f5995fa2f2d8c91a0f198d3f34c` | New Linux build, upstream `make -j2 qjs qjsc`, GCC 13.3.0, actual `-O2`; no runtime tier flag |
| V8/d8 | Official Linux64 canary `rel` 15.6.21 | [Official archive](https://storage.googleapis.com/chromium-v8/official/canary/v8-linux64-rel-15.6.21.zip); fixed snapshot/ICU; `--max-opt=0 --no-lazy`; exact compiler/source commit UNKNOWN |
| JavaScriptCore/jsc | WebKit `fd3406f133a4e56d7aaf399ba5611ae44b8da7e9` | Reused Phase 1 JSCOnly Release artifact, verified shell/library hashes; `-O3 -DNDEBUG`; `--useJIT=false --useLLInt=true --validateOptions=true` |

[manifest.json](manifest.json) records absolute paths, SHA-256, sizes, flags, archive and actual shared-library dependencies. It references [adapters/manifest.json](adapters/manifest.json). [input_manifest.json](input_manifest.json) binds the manifest, adapters, standard drivers, selected workload sources and probe implementation. Initial input freezing was extended to include adapter metadata and the runtime manifest; the initial freeze remains in `input_manifest.initial.json`. Workloads and execution flags did not change during this extension. No engine patch was applied.

The MAIN metric is **first-call-inclusive interpreter-mode execution time**. Each future sample is a fresh process; adapter/source/top-level evaluation/required Setup are before the Date.now interval, and the **first** Run plus N−1 further Runs are inside. No performance warmup. JSC's first-call function parsing/bytecode preparation is included when it occurs. GC, helpers, builtin/regex costs, dynamic compilation and original in-Run assertions remain included. This is not frontend-excluded strict timing or interpreter-loop self time. Full machine-readable policy: [execution_contract.json](execution_contract.json).

Completed gates: current-binary dispatch/tier evidence; default positive controls; static and selected-workload frontend ordering; common Date.now capability; 72 independent correctness invocations (8 cases × 3 engines × N=1/2/16), all PASS. Three untraced MAIN timer smokes verify the new timing driver. No calibration campaign, formal benchmark table, ratios or geometric mean were generated.

Selected workloads: SunSpider `bitops-bitwise-and`, `controlflow-recursive`, `regexp-dna`, `string-unpack-code`; Octane `Richards`, `NavierStokes`, `RegExp`, `CodeLoadClosure`. The same generated JS core/standard driver/config is given to all three shells. `qjs -I` and multiple-file d8/jsc loading are recorded transport differences. Existing benchmark sources were not edited. The Octane driver retains old strict's disclosed RegExp input-construction-only Setup and post-region NavierStokes frame-15 validation; state progresses through repeated Runs.

Entry point from native Windows PowerShell:

```powershell
wsl.exe -d Ubuntu -- python3 -B /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/three_engine_baseline/run_case.py --verify-only
```

Probe scripts and stdout/stderr/commands are under `probes/{tier,frontend_order,timer,correctness}/`; [summary/results.md](summary/results.md) explains their boundaries and UNKNOWNs. [summary/next_commands.md](summary/next_commands.md) gives concrete single-case commands for follow-up. This preparation harness only supports the eight listed cases; full-suite expansion and formal sampling belong to a later authorized phase.
