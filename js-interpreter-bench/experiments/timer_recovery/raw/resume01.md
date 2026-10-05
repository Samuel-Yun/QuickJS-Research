# Resume after interrupted client/WSL session

Client date: 2026-10-05 (Asia/Shanghai).

Before resuming, 1,463 SunSpider formal journal records were present. Neither
SunSpider's final audit nor Octane's formal run had completed. The previous tool
process session was unavailable and WSL process inspection found no running
campaign. The interruption's cause is UNKNOWN.

Recovery verification passed: the host remains LAPTOP-QPKCPDCB, the kernel
remains 5.15.167.4-microsoft-standard-WSL2, and all frozen runtime, dependency,
benchmark, harness and preserved historical-file hashes passed verification.
See `environment.recovery01.json` for the recovery environment.

The WSL boot ID changed from `3e035c9e-fd4d-4283-a7ce-c1d3e4721a0a` to
`3b479495-ab48-4057-a2e6-824acf4c8cd3`. The campaign resumes attempt01 from
uncompleted positions, preserving valid records. Monotonic intervals are
compared only within their own boot; wall-clock timestamps are metadata, not
timing or cross-boot chronology evidence. No uninterrupted-run claim is made.

Resume command:

```sh
python3 -B experiments/timer_recovery/campaign.py all --attempt 01
```

Reboot/pause-related host thermal, power and background-load differences remain
limitations; no samples are discarded on the basis of their performance.

## Active runner boot identity

A subsequent read-only inspection of the actual resumed runner found boot ID
`94e240b1-774a-4fdc-8be3-8b5e85457d9d`, rather than the recovery-check boot ID
`3b479495-ab48-4057-a2e6-824acf4c8cd3`. Five successive reads of the boot ID
agreed. `ps -eo pid,etimes,args` identified the active campaign as PID 519,
running for 2,730 seconds, while PID 1 had run for 2,733 seconds. The host and
kernel again matched the frozen cohort. The campaign's startup performs its own
runtime/dependency/input preservation checks before any resumed sampling.

This distinguishes the preflight-check boot from the actual resumed-run boot;
it is not evidence that the active campaign survived a reboot. The reason for
the additional boot change between preflight and launcher is UNKNOWN. Actual
sample boot IDs, not an assumed continuous session, are retained in raw and
counted in `summary/completed.json` after completion.

Inspection command (read-only):

```sh
python3 -B -c "from pathlib import Path; import platform,subprocess; print('host',platform.node(),'kernel',platform.release()); print('boot_ids',[Path('/proc/sys/kernel/random/boot_id').read_text().strip() for _ in range(5)]); print(subprocess.run(['ps','-eo','pid,etimes,args'],capture_output=True,text=True).stdout)"
```
