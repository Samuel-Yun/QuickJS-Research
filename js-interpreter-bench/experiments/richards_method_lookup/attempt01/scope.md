# Richards prototype-method lookup sensitivity, attempt01

Only question: can prototype method lookup/call preparation plausibly explain part
of the existing QuickJS versus V8 Richards difference? Negative/insufficient
evidence is an acceptable outcome. No production VM optimization, PIC, JIT,
NG benchmark, broad rerun, branch change, merge, reset or push.

Same existing WSL2 Ubuntu24.04.2 x86_64 cohort, not Windows data. Frozen runtime
identities and adapters are rechecked in manifest.json. The original baseline,
whitebox and Code Cache outputs remain historical and unchanged. Current branch
myx is 4b47217ae2e68b94fe0dc14ca839721584753782; local main/origin/main is
3293a5355f32ba116a015271036005cb2dc24b3b. No remote-ref freshness claim.

Selection before new performance: Scheduler.schedule -> TaskControlBlock.run.
Old counted evidence: 3,365,376 selected entries per N512 = 6,573/Run in all
three engines, separate from task.run (four target prototypes). This does not
prove self-time. The complete original Richards algorithm is retained rather
than reducing the target method to a trivial return. A readable schedule
fragment and exact workload diffs are saved in microbench/source_evidence.

No general JavaScript legality claim: stable plain-data prototype methods,
no own run override/getter/Proxy/method replacement/prototype mutation are
required. Static assignments and diagnostic identity/receiver sequence checks
establish this for these inputs, not arbitrary programs.
