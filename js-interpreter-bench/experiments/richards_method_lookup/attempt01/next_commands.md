# Actual environment: PowerShell -> existing Ubuntu WSL distro

Read-only/audit recomputation (no new performance samples):

```powershell
wsl.exe -d Ubuntu -- python3 -B /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/richards_method_lookup/attempt01/audit.py
wsl.exe -d Ubuntu -- python3 -B /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/richards_method_lookup/attempt01/report.py
python C:\Users\mzyx\Desktop\0921\js-interpreter-bench\experiments\richards_method_lookup\attempt01\archive_audit.py
```

Exact-protocol safe resume (all180 are already valid, so no new performance
invocations; rejects changed binary/deps/adapter/input/config):

```powershell
wsl.exe -d Ubuntu -- python3 -B /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/richards_method_lookup/attempt01/run.py all
```

Preparation/diagnostic entry points (write-once evidence; a missing artifact
must be restored rather than overwritten):

```powershell
wsl.exe -d Ubuntu -- python3 -B /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/richards_method_lookup/attempt01/prepare.py
wsl.exe -d Ubuntu -- python3 -B /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/richards_method_lookup/attempt01/diagnose.py
wsl.exe -d Ubuntu -- python3 -B /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/richards_method_lookup/attempt01/collect_evidence.py
```

All paths refer to this host, not a hypothetical remote Ubuntu. Host/runtime
migration, another sampling run or a changed design requires a new attempt.
Do not delete records to force regeneration. No command automatically upgrades
engines. The temporary source diagnostic build under /home/mzyx is independent
of the formal qjs. TLS/reference acquisition failures are preserved; do not
disable certificate verification or security policy to hide them.

Stop point: no subsequent VM prototype or new benchmark is authorized/executed
by these audit commands. Next scientific question is documented in results.md;
proposal is not implementation in this stage.
