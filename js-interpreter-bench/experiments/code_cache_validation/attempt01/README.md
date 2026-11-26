# Independent V8 Code Cache validation

Frozen WSL2 Ubuntu cohort, d8 15.6.21. V8 only: SOURCE_NO_LAZY vs CACHE_NO_LAZY_CONSUMER.
This supplements, and does not replace, either old Windows work or MAIN_MONOTONIC_V1/whitebox data.

From Windows PowerShell, real resolved commands:

```powershell
wsl.exe -d Ubuntu -- python3 -B /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/code_cache_validation/attempt01/mechanism.py
wsl.exe -d Ubuntu -- python3 -B /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/code_cache_validation/attempt01/inspect_binary.py
wsl.exe -d Ubuntu -- python3 -B /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/code_cache_validation/attempt01/run.py all
wsl.exe -d Ubuntu -- python3 -B /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/code_cache_validation/attempt01/analysis/audit.py
wsl.exe -d Ubuntu -- python3 -B /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/code_cache_validation/attempt01/analysis/check_exports.py
```

`all` checks existing prepare/correctness/calibration/measurement and resumes valid unique positions without resampling. Alternatively `run.py correctness`, `calibrate`, `measure` select a stage. Mechanism records are also write-once. For a genuinely new independent repeat, copy only scripts/protocol/probes/preparation.js to a new attempt directory before preparing, not any raw/manifest/schedule/results; each attempt generates independent immutable records. Do not overwrite attempt01.

The completed attempt was tested with `all` again: existing valid positions were reused, with no new process samples. CSV statistics also passed the separate `analysis/check_exports.py` recomputation.

Main evidence: `capabilities.json`, `protocol.md`, `manifest.json`, `input_manifest.json`, `environment_before.json`, `probes/logs/`, `probes/cache_proof/` and actual binary disassembly in `probes/`. Detailed durable per-invocation records are in `records/`; CSV exports and separately labeled producer data in `raw/`; full statistics in `summary/`; audit/results/meeting_notes report explicit UNKNOWNs.

Clock is the frozen benchNow monotonic adapter, not Date.now. B whole-process external time encloses TWO passes and is never interpreted as consumer execution or divided by consumer N. Code-cache trace intervals are diagnostics, not verified compile/deserialize primary metrics. Formal commands have no trace/profiling flags. Both B passes must pass original correctness gates.

Do not run any profiling or other benchmark in parallel. This task stops after audit/report; it does not create a three-engine cache ranking or develop a native persistent-cache harness.
