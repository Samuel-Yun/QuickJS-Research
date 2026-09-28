# Pre-formal diagnostic parser revision

No calibration or formal sample existed at this revision. Initial runner SHA256:
`cf0a9228179a5a12b6f346d44f3088c649f0fe1cdac998397d091176218d2abb`.
New runner SHA256: `d3db8bdb87cb2d7d5138df1c34cc3210c44501664790a2c6eae5c26091b27c6e`.

Initial frontend gate is preserved in `frontend_order/Richards.Richards/`.
Bytecode was present before marker; gate rejected d8's exact developer-feature
diagnostic warning. Only diagnostic invocations may now accept that exact warning.
Formal invocations still reject any stderr. Retest records have `.validated` suffix.
No workload, binary, timer, or formal sampling policy changed.

Second pre-formal revision: `2fe7ad2bc638f593bc34a3c03071c5bc1d7acfac75418d19eccd893dd81e4ba2`.
The initial anonymous-function ordering parser matched the timer marker text
inside a bytecode constant pool, rather than the actual stdout marker line.
Use a line-anchored marker and an anonymous wrapper's LdaGlobal target reference;
preserve that UNKNOWN attempt in EarleyBoyer.Earley.validated. Final attempts have
`.final` suffix. No missing bytecode is inferred from a parser failure.

Timer selection also required further source audit: although both shells expose
native performance.now, quickjs-libc.c:2131-2165 on Windows implements it with
gettimeofday and warns about date updates. An 80-ms no-backwards smoke cannot
establish monotonic-clock semantics. Before any calibration/performance sample,
select common Date.now (observed 1-ms step on both), like SunSpider strict.
Initial smoke.json is retained; smoke_validated.json uses the final Date.now.
Static workload/driver code is unchanged. Config runner SHA and environment timer
were explicitly updated before formal freeze.
