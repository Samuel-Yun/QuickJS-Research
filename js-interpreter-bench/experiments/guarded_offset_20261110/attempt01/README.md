# GUARDED_OFFSET

Parent: frozen EVAL_COLD in `native_octane_20261108/attempt11`.

This experiment adds one mechanism: a checked own-property position hint for
ordinary non-exotic receivers whose shape is not interned. It does not expand
receiver classes, cache prototype reads, or change cold-function preparation.

The existing shape-hit and borrowed-load paths are unchanged. In the existing
object fallback, a hint tests its offset against the **current** shape's property
count, atom, and descriptor kind before loading the current value. A failed hint
uses the original lookup. Successful normal lookup of an eligible non-interned
own property records the offset for subsequent reads.

The high bit of `prop_offset` tags hint mode. Both shape pointers are NULL in
this mode; no mutable non-interned shape is retained. Original normal/prototype
fills clear the tag by writing their normal offset. `ReadICSite` retains its
original layout and size. Borrowed loads and shared stores cannot use a tagged
offset because their non-NULL receiver-shape comparison fails. No callbacks or
allocations occur between descriptor validation and value load.

The helper's checks execute only after the original read-cache probe has failed.
This preserves the existing successful path's logic, but machine-code layout and
fallback overhead may still affect other benchmarks. Performance neutrality is
an experimental question.

Files:

- `guarded_offset.inc`: helper source used by the builder.
- `build.py`: verifies the frozen parent and creates a separate source tree.
- `implementation.patch`: complete source patch against the parent.
- `build_manifest.json`: source and ELF identities.
- `safety.js`: property mutation, receiver transitions, getters/exceptions,
  method receiver, eval, readonly/shared stores and property-array growth.
- `qualify.py`: separate diagnostic and ASan/UBSan builds; these are never timed.
- `run.py`: exactly one fresh performance process for each of the 17 Octane
  entries, using the prior confirmation's identical scripts and N. Built-in
  validation is required for every sample. No automatic retry after failure.
- `results.md`, `comparison.csv`, `aggregate.json`: outputs after completion.

Run in a new empty experiment directory, preserving the relative layout:

```sh
python3 -B build.py
python3 -B qualify.py
python3 -B run.py
```

A and EVAL_COLD references are the historical 30-process medians; they are not
new contemporaneous controls. This one-pass screen cannot establish statistical
significance or absence of regression. SunSpider is outside this run's scope.
