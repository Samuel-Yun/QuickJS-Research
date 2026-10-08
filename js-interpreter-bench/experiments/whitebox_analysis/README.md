# Representative white-box stage

Current cohort: WSL2 Ubuntu 24.04.2 x86_64, frozen three-engine runtime.
All new evidence is in `attempt01/`; old baseline files are preserved.
No VM optimization, engine replacement, full baseline rerun or IC-switch matrix.

Tooling entry points (run with Linux Python in the same Ubuntu distro):

```sh
python3 -B experiments/whitebox_analysis/tooling/prepare.py
python3 -B experiments/whitebox_analysis/tooling/diagnostics.py
python3 -B experiments/whitebox_analysis/tooling/native_diagnostics.py
python3 -B experiments/whitebox_analysis/tooling/run_micro.py prepare
python3 -B experiments/whitebox_analysis/tooling/code_evidence.py
python3 -B experiments/whitebox_analysis/tooling/run_micro.py formal
python3 -B experiments/whitebox_analysis/tooling/audit_micro.py
```

Do not run profiling while formal sampling is active. Existing records are
write-once. Resume uses the same frozen design, binary/adapter/script hashes
and valid unique schedule position. New engine/tooling/protocol changes require
a new attempt/cohort rather than editing previous outputs. See the final
`attempt01/next_commands.md` for verification and migration limitations.

The formal metric remains first-call-inclusive interpreter-mode execution.
Monotonic timing is not evidence that frontend preparation is completely excluded.
Whole-process diagnostic counts/samples are not exact timed-Run attribution.
