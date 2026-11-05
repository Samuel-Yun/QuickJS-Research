# Richards evidence chain (pre-formal selection)

1. Frozen workload: `benchmarks/octane/upstream/richards.js`,
   Scheduler.schedule and TaskControlBlock.isHeldOrSuspended (lines 188ff/309ff).
   The full Run constructs a new scheduler and asserts queueCount=2322,
   holdCount=928; the diagnostic driver keeps original Setup/Run/TearDown.
2. `summary/function_counts.csv`: original N=512, three independent processes
   per engine, 5,463,552 predicate entries =10,671/Run. These are invocation
   frequencies, not fractions of execution time. Counted copies and diffs in
   profiles retain failed attempts and all original assertions.
3. V8 top-PC profiles (three replicates) resolve GetNamedProperty, interpreter
   entry, StoreIC, calls and branches. Anonymous JSC functions are identified
   by their bytecode hashes, not guessed from an empty function name:
   `bytecode/original.richards.jsc.txt` #EaXyiF is Scheduler.schedule,
   #DDXQoZ is isHeldOrSuspended, #Bkagj7 is TaskControlBlock.run.
   These three hashes are among the leading JSC sampled functions.
4. Candidate kernel: `microbench/richards_fields.js` vs `richards_cached.js`.
   Fixed plain objects with uniform state 0..7; no getters/mutations. Legal
   caching removes the second state read in the false-held half of predicates.
   It removes scheduler/call/allocation/global-state behavior: not a Richards
   replacement and not an IC-only experiment.
5. Actual bytecode: V8 A contains two GetNamedProperty state operations; B
   contains one plus a local. QJS diagnostic N=1 records get_field A393224,
   B262152, difference131072; Setup/driver common accesses included.
   JSC bytecode has get_by_id and additional local moves, with side metadata.
6. Fixed QJS handler: `source_evidence/qjs.field.txt`, find_own_property and
   prototype traversal, JS_GetPropertyInternal fallback. This macro does not
   show a per-bytecode-site field-offset cache; do not generalize to the entire
   VM having no fast paths. Fixed JSC `jsc.LLInt.access.txt` lines1653ff compares
   StructureID/cachedOffset; actual lib disassembly at0x19f9d5 confirms loads,
   compares and slow-path branch. Presence of IC machinery is not its hit rate.
7. Formal H0/H1 and alternatives frozen in protocol.md before correctness and
   sampling. Results are in summary/contrasts.csv, not diagnostic timings.

No evidence here identifies dispatch as the bottleneck. Reference-count work
can be spread across handlers and helpers, not only GC-labelled symbols.
