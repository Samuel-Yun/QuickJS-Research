# Richards method-lookup sensitivity: completed targeted experiment

Entry: `run.py all` performs actual correctness/calibration/formal sampling;
write-once resume skips valid completed positions and refuses modified config.
It does NOT rerun any old benchmark or alter production VM binaries.

Read [results.md](results.md), [audit.json](audit.json) and
[meeting_notes.md](meeting_notes.md) for findings and limitations. Frozen
prospective design is [protocol.md](protocol.md)/microbench/design.json.
[next_commands.md](next_commands.md) gives commands on the actual WSL host.

Input contracts: complete frozen Richards algorithm with only the selected
Scheduler.schedule method-call site transformed. A does repeated lookup; B
caches once per timed Run. Both invoke the same function with the same receiver
using a fixed `.call` builtin; target body and original assertions are unchanged.
This is a derived full-Run mechanism sensitivity contrast, not original
end-to-end Richards acceleration or an isolated nanosecond lookup test.

`raw/records/` and `diagnostics/records/` are immutable per-process journals;
raw/journal.jsonl and CSVs are exports. N=512, 180/180 formal, 12 N1/N2 and
6 selected-N checks. No warmup/profile/counter flags in formal runs.
Run loop timer is native monotonic benchNow with first calls included;
JSC first-call preparation and runtime state remain possible included costs.

Exact-byte archives: source_evidence/historical_bytes.zip (45 old Code Cache
identities), microbench/design_bytes.zip, microbench/formal_bytes.zip.
archive_audit.py verifies actual Git tree/archive round trips in an isolated
fixture repository on Windows and Linux, without a commit or changing the
main Git index/branches. No broad EOL normalization.

Historical Windows, failed Date.now, old successful WSL baseline/whitebox/cache
files are unchanged. No NG benchmark, PIC implementation or JIT optimization.
