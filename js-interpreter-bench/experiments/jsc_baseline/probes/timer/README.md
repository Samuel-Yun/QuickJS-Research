# JSC shell timer audit

`timer_probe.js` sampled 100,000 consecutive calls to each timer; `timer.stdout.txt` recorded `Date.now:changes=5,min_positive_delta_ms=1,backwards=0` and `performance.now:changes=390,min_positive_delta_ms=0.019999999999999574,backwards=0`. These are capability observations, **not** timer-resolution guarantees or workload performance measurements.

The pinned `Source/JavaScriptCore/jsc.cpp:3557-3558` implements the shell's `performance.now()` from `MonotonicTime::now()`, then applies reduced-resolution quantization. `Date.now()` is available (`probes/smoke/shell_api.stdout.txt`) and has millisecond granularity in this probe. A single probe with no backward step does not prove Date.now monotonicity. The existing strict QuickJS/V8 method uses `Date.now()`; retain that if a future same-OS three-way strict experiment is authorized, unless a three-engine timer equivalence study justifies a change.
