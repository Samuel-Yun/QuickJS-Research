# Excerpt corrections and provenance

The initial `qjs.regexp.txt` was extracted from an incorrect numeric range and
contains string handling, not RegExp compilation. It is retained as an unused
extraction artifact. Use `qjs.regexp_compile.txt` and `qjs.regexp_exec.txt` instead
(lre_compile47630, lre_exec48159 in this fixed revision).

Likewise the initial `qjs.array_store.txt` range precedes OP_put_array_el. It is
not evidence for its store handler. Use `qjs.put_array_el.complete.txt`, starting
at19546. Corrected excerpts do not change VM/benchmark code or formal records.

V8 exact-version logging/tick-source reference retrieval failed with TLS chain
validation errors. See raw/reference.v8.*.json. No insecure TLS override used;
exact artifact source/toolchain remain UNKNOWN. Native RegExp evidence instead
uses the actual binary's own code-range log, ticks and live executable maps.

Initial V8 profile parser outputs retain the initial parser hash. Every profile
has independently regenerated `top_pc_recomputed.json` with the provided current
parser SHA256; ticks/range counts, VM states and raw-log hash are checked against
the initial outputs. No initial result was overwritten. This is a conservative
top-PC classifier, not the official tick processor nor precise self-time.

Boot IDs in formal_audit.json aggregate all correctness/calibration/formal stages.
summary/completion_audit.json gives the separate per-stage boot ledger. Runtime,
kernel,host and hashes are verified unchanged; formal360 samples use one boot.
