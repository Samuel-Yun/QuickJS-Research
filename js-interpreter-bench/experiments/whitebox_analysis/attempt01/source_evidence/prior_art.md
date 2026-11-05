# Prior engineering, not novelty or fixed-binary proof

Consulted2026-10-05; historical design documents are used for prior art only.
Current binary claims instead cite local fixed source, logs and disassembly.

1. [V8 fast properties](https://v8.dev/blog/fast-properties),2017.
   Describes named-property layouts, object shapes and caching. Property ICs
   and cached offsets are established engineering. It does not prove the exact
   implementation/hit rate of this official15.6.21 prebuilt artifact.
2. [V8 elements kinds](https://v8.dev/blog/elements-kinds),2017 with later update.
   Describes indexed storage specialization and packed/holey/type distinctions.
   Array-to-typed-array changes multiple mechanisms, not one bounds-check cost.
   Document advice is not an interpreter-only benchmark prediction here.
3. [WebKit bytecode format](https://webkit.org/blog/9329/a-new-bytecode-format-for-javascriptcore/),2019.
   Side metadata caches and dispatch/metadata-register tradeoffs are established.
   Current implementation is checked separately in fixed LLInt source/actual lib.
4. [QuickJS-NG differences](https://quickjs-ng.github.io/quickjs/diff/),current official docs.
   Lists opcode fusion, PIC and allocator/parser improvements. These are already
   prior engineering, not a new proposal. No NG binary, benchmark or ranking was
   introduced. NG documentation is not pinned NG implementation/source proof;
   exact NG commit and coverage of any prospective change remain UNKNOWN.

Method references: [V8 profiler](https://v8.dev/docs/profile),
[V8 Linux perf](https://v8.dev/docs/linux-perf),
[kernel perf security](https://cdn.kernel.org/doc/html/latest/admin-guide/perf-security.html).
Actual permission/event probes are saved; no security settings changed.
Sampling is whole-process, not exact internal-Run attribution. The small local
parser is not presented as V8's official complete tick processor.

No credible novel method is established by these measurements. A future idea
must specify a measured bottleneck and memory/correctness/generalization cost,
and compare against these existing techniques before a novelty claim.
