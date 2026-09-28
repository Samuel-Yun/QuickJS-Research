# Source coverage addendum (after implementation, not a new exclusion rule)

Additional read-only source audit during sampling. No workload, flag, N, timer,
sample, inclusion policy, or preregistered sensitivity exclusion changed.

- `gbemu-part1.js:326–350,427` contains Resampler.initialize → compileInterpolationFunction → Function("buffer",toCompile); the branch depends on sample rates. `gbemu-part1.js:913,920` constructs Resampler. Run starts the emulator/audio at :42. This is a potential execution-time dynamic frontend path; exact branch counts in formal runs **UNKNOWN** without tracing.
- `gbemu-part2.js:5013` calls compileResizeFrameBufferFunction. Do not assume a dynamic compilation contribution just because a method name includes "compile"; inspect implementation before attribution.
- `pdfjs.js:117–127` flushTimeouts calls a queued function, otherwise eval(next). Run explicitly calls flushTimeouts (:66). Exact string-vs-function callback counts in formal runs **UNKNOWN**; no callbacks were removed.
- `earley-boyer.js:1873` sc_eval helper contains eval(evalStr). Its presence alone does not establish that timed Earley/Boyer executes it; invocation counts **UNKNOWN**.
- `typescript-compiler.js:4791` contains JSON parser fallback eval. Whether timed TS compiler takes that path **UNKNOWN**. TS compiler algorithm parsing its input is not VM source parsing and remains workload cost.
- CodeLoad's indirectEval(src) and Mandreel timeout eval were identified in the pre-implementation audit and remain inside original Run.

The predefined narrow/broad sensitivity sets are focused mechanism analyses,
NOT a guarantee that all dynamic/frontend/builtin work has been removed.
Gameboy and PdfJS remain in main results and in these preset sensitivity subsets;
neither subset is a "pure interpreter" measurement.
