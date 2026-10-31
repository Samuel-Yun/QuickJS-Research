# Frozen design before formal sampling — 2026-10-05

Mode: MAIN_MONOTONIC_V1_DERIVED, first-call-inclusive interpreter-mode execution.
This is a new derived microbenchmark, not Octane scores or pure-loop self time.
Frozen runtime/flags/adapters are in manifest.json. No diagnostic switches in formal commands.

## Selection evidence available before results

Richards: original Scheduler.schedule calls TaskControlBlock.isHeldOrSuspended.
Verified instrumented Run(N=512) counts 5,463,552 predicate entries (10,671/Run),
identical across engines/replicates. Original assertions remain active.
V8 original-N top-PC profile includes GetNamedProperty prominently; those samples
do not identify which object/property, and include startup/Setup.

NavierStokes: original Run(N=32) counts 96 lin_solve and 64 project calls.
JSC original-N sampling identifies lin_solve as the largest function (1190/1692
whole-process samples in replicate 1). Source has a==0 copy path and a=1,c=4
iterative project path. The derivative chooses the latter, not both paths.

## Group R — repeated plain-object field load

A=richards_fields; B=richards_cached. Both test 1024 fixed plain TCB-shaped
objects, state 0..7 uniformly, 256 traversals/Run. Both evaluate held/suspended
predicate and accumulate identical integers. A reads item.state again when held
test is false; B reads it once into a local. No getters or mutation, so caching
within one predicate evaluation is legal for this input.
H0: B/A near 1; removing the redundant field access does not materially change
this fragment. H1: B/A<1 in QJS, and potentially changes the cross-engine gap.
Prediction: QJS may benefit more than V8/JSC; this is not a guaranteed winner.
Falsification: B not faster, or comparable/larger benefit in other engines.
Alternatives: local bytecode/register traffic, dispatch count, branch layout,
reference-count traffic, caller overhead. No IC switch/IC causality isolation.
Changed semantics vs original: no scheduler queues/task allocation/mutations;
state distribution synthetic; predicate inlined inside loop, not a method call.
Thus conclusions apply only to this property-sensitive fragment.

## Group N — numeric stencil representation

A=navier_array; B=navier_f64. Same 64x64 interior, 20 iterations/Run,
a=1,c=4, exact lin_solve general inner-expression evaluation/index progression.
Only representation constructor changes (Array vs Float64Array) for x/x0.
Both have deterministic fractional x0, zero initial x, persistent x across N.
Ghost edges fixed zero. Original per-iteration set_bnd is omitted; this is an
isolated stencil kernel, not the original fluid simulation, and cannot predict
the entire NavierStokes rank.
H0: representation has little impact. H1: representation changes engine gaps;
in QJS it may be slower because the observed source dense-array path has an
explicit class guard and non-Array access goes to JS_GetPropertyValue.
Falsification: B not slower in QJS or the cross-engine relationship is unchanged.
Alternatives: element tagging/storage, conversion, numeric boxing, bounds tests,
helper calls, bytecode dispatch, mutable array specialization. This is not a
single-cost isolation. Correctness oracle is independently written C binary64
implementation with fp contraction disabled and a quantized integer checksum;
expected values are generated from this oracle before an engine is run, never
chosen from engine agreement. No widened tolerances.

## Sampling, correctness, retention

Inputs/required Setup outside, benchNow start, first Run and subsequent N calls,
benchNow stop, checksum/output outside. No explicit warmup. Dynamic helper,
GC/builtin and any first-call frontend remain actual execution costs.
N=1/2 correctness on all 4x3 combinations. Per-group calibration powers of two
from 1, first N for which all 2 variants x3 engines have inner>=1000ms. Max N
1048576; timeout 180s. Independently repeat selected-N correctness.
30 fresh processes per variant/engine =360 expected formal samples.
Six engine permutations each five times per variant; each engine appears in
each position ten times. Fixed seed 20261005, shuffle variant-round pairs.
Schedule, selected N, inputs/driver/protocol/tooling hashes frozen before formal.
Sequential processes only; diagnostics never concurrent with formal sampling.
Every record includes command/flags/hash/adapters/cohort/boot/time/checksum/raw
streams. Stop affected mode on correctness/clock failure; no epsilon/no outlier
deletion; inner positive finite, <=outer+5ms. Below-target formal retained.
Write-once attempt records; identical-protocol valid unique positions resumable.

Statistics: per-call median/mean/sample stddev(n-1)/Tukey-halves IQR/min/max;
B/A means median(B)/median(A), engine ratios V8/QJS,JSC/QJS,JSC/V8.
No cross-machine independence, p-value-based causal claim, or microbenchmark GM
as a substitute for the unchanged complete-suite Octane GM.
