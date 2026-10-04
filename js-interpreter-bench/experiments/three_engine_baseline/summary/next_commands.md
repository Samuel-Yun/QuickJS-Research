# Concrete entry points

Next command, from native Windows PowerShell:

```powershell
wsl.exe -d Ubuntu -- python3 -B /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/three_engine_baseline/run_case.py --verify-only
```

It checks the selected distro/architecture, frozen executable/system-library/data hashes, the runtime manifest, adapters/drivers/sources, and preserved old data. It does not build, download or update any runtime.

One explicit correctness recheck, if desired in a later session:

```powershell
wsl.exe -d Ubuntu -- python3 -B /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/three_engine_baseline/run_case.py --engine all --benchmark Octane --case Richards --n 16 --mode correctness
```

One explicit MAIN invocation (not a formal 30-repetition campaign):

```powershell
wsl.exe -d Ubuntu -- python3 -B /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/three_engine_baseline/run_case.py --engine all --benchmark SunSpider --case bitops-bitwise-and --n 16 --mode main
```

The three JSON outputs contain their command and internally measured first-call-inclusive interval. They must not be ranked as formal results. `--mode diagnostic` is separate and performs one disclosed warmup on **each** selected engine; never mix it with MAIN or warm only JSC.

Future full runner inputs: `manifest.json`, `input_manifest.json`, `adapters/manifest.json`, `execution_contract.json`, `cohort.command`, `sunspider_driver.js`, `octane_driver.js`. First extend the common generated-workload mapping and full correctness coverage; then separately authorize/calibrate powers-of-two N using each engine's internal timer and one common N with all three >=1000 ms. Future formal sampling must have the same warmup policy, interleaved order, raw output preservation and consistent statistics; no such campaign is implemented/executed by this preparation stage.

Stored evidence can be independently re-audited from Windows with `python -B experiments/three_engine_baseline/audit_materialized.py` in the project root. The existing evidence files are immutable on resume. Successful runtime execution was already verified in Ubuntu; this materialized audit does not create new timing samples.
