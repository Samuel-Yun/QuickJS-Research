# Retained development failures

- source_audit.py initially assumed every old inventory was a list wrapped in
  `files`; source_inventory_v8_entry.json is a single record. Corrected the reader,
  without changing archived hashes or files.
- internal.c initial/v2 OOM test expected JS_SetMemoryLimit(1) to reject a 40B
  feedback allocation. Actual stdout showed heat7 -> heat8 and a successful vector.
  Fixed A quickjs.c:1549-1591 allocates small blocks from existing arenas; the limit
  is consulted on new arena/large allocation, not each free small block. This was
  an invalid test assumption, not evidence of an E memory-safety defect. v3 uses
  a 512-site vector and an explicit internal heat boundary to force the large
  allocator. Initial/v2 raw records remain, formal E was not changed for this.
- WSL urllib could not verify the intercepted HTTPS certificate chain for three
  missing fixed-commit headers. Normal TLS remained enabled. No retry in that
  trust configuration. A PowerShell file execution was refused by existing policy;
  policy was not changed. Any alternate trust-store attempt is recorded separately.
