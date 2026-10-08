# Frozen prospective protocol

MAIN = FIRST_CALL_INCLUSIVE_INTERPRETER_MODE_DERIVED_METHOD_LOOKUP_V1.
Frozen native benchNow adapters, internal floating-point milliseconds.
Metric is first-call-inclusive interpreter-mode derived execution, NOT pure
interpreter-loop self time or fully frontend-excluded time. JSC first-call
frontend remains UNKNOWN/included. GC/helpers/builtins/allocations and residual
preparation remain included. Setup/script loading/output/TearDown are outside.
Original runRichards construction/reset and assertions remain inside every Run.
No explicit workload warmup. Every correctness, pilot and formal invocation is
a fresh process. Formal samples use only frozen runtimes and original flags,
no trace/profile/counters/preload. All experiment processes are serial.

A looks up currentTcb.run on every selected loop iteration, then fn.call(tcb).
B loads currentTcb.run once before that loop, INSIDE each schedule/Run, then
fn.call(tcb). Both add the same local and use the identical .call path. The
TCB.run method body, every task method, object construction, receiver order,
this/zero arguments/return and state evolution stay unchanged. Both fix the
captured Function.prototype.call as a nonwritable OWN call property of the
target function before timing. This added function layout and builtin call
overhead are disclosed, shared by both; original direct-call mode is diagnostic
only. B's preparation executes N times within timing, not once outside timer.

Oracle: unchanged original per-Run queueCount=2322 and holdCount=928 assertions.
Result checksum is an assertion certificate N:2322:928, not an invented
independent numeric checksum. Additional diagnostic wrappers compare receiver
ID/state/packet input/return/state sequence with the original (not formal).
N1/N2 gates: 2 variants x 3 engines x 2 N =12. Independent selected-N gate=6.

Calibration: powers of two from1 to8192, timeout180s; first COMMON N for all six
conditions with INTERNAL elapsed>=1000ms. Original N512 is only a reference.
30 reps/condition =180 targets. Seed20261008. Per variant all six engine
permutations exactly5 times; each engine position10 times. Thirty blocks;
A-first/B-first15 each, shuffled before sampling. No deletion of outliers or
samples subsequently below the pilot threshold. Failure stops affected campaign;
failed raw kept; no retry-until-pass. Resume only frozen config/valid unique slots.

Statistics: elapsed/N milliseconds; median, arithmetic mean, SAMPLE stdev
(n-1), Tukey-halves IQR (median upper15 minus median lower15 for30), min/max.
B/A per engine; V8/QJS, JSC/QJS and JSC/V8 per variant are ratios of group
medians. No derived percentage projected onto original total. No GM for one
two-variant site comparison; no ranking claim across a benchmark suite.

H0: removing repeated selected-method lookups does not preferentially improve
QuickJS relative to V8; prototype lookup is not established as the gap's cause.
H1: B/A QuickJS < B/A V8, and (V8/QJS)_B > (V8/QJS)_A (QJS is slower in the
old original Richards; moving ratio toward1 shrinks that gap). This is a
directional sensitivity prediction, not an exact per-lookup cost claim.
Falsification: equal/opposite relative point estimate, incorrect semantic
sequence, no expected reduction in diagnostic selected lookups, or failure of
common call-path checks. If directions support H1, causal attribution remains
limited by locals/bytecode/branch layout/function lifetime, .call builtin,
IC/GC states, measurement noise and one host. Without self-time no percent
lookup/call time. Alternative: generic bytecode/reference-count/stack/call
bookkeeping, allocation or other own field reads dominates the difference.

Diagnostic budget: one independent same-revision QuickJS clone/build (10min
timeout), original N512 three runs per available condition; three sequence
replicates per original/A/B engine; three counter replicates per variant;
one N1 bytecode dump per variant/engine. No security changes. Existing profiles
remain whole-process/top-PC and cannot become exact internal-Run self-time.
Prior-art lookup is read-only, bounded official single-file source fetches.
