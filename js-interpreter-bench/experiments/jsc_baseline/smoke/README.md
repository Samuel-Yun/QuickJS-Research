# Smoke evidence

The executable was exercised only for functionality and correctness, never for performance ranking.

Basic JS: `../probes/smoke/basic.js` covers arithmetic, function call, loop, object property, RegExp and eval. Output `../probes/smoke/basic.stdout.txt`: `SMOKE_PASS:107`.

Shell API: `../probes/smoke/shell_api_probe.js` and `.stdout.txt` record that `print`, `load`, `read`, `readFile`, `quit`, `gc`, `performance.now` and `Date.now` are available, while `console` is `undefined` and `arguments` was `undefined` in this no-argument invocation. The compatibility probes use tiny console/scriptArgs adapters loaded before the unmodified generated workload files. Adapter code is outside the workload's timed region, but adapter use and its setup cost must be documented in any future method.

Eight selected existing strict workloads were each run once with `--useJIT=false --validateOptions=true`, not timed as a performance campaign. Per-case status is `../compatibility_smoke.csv`; stdout/stderr is in `../probes/smoke/compatibility_raw/`. A PASS confirms exit code 0 plus the expected result marker/checksum or suite correctness marker. It does **not** certify all 26 SunSpider or the full Octane suite on JSC.

Re-run on the pinned WSL build from the project root (only when a new smoke is explicitly desired):

```sh
python3 experiments/jsc_baseline/probes/smoke/run_compatibility.py
```

The runner's fixed binary path and selected workload paths are explicit in its source. It is a correctness-only script; do not use it to infer execution speed.
