# Static function frontend order

`static_function_probe.js` declares `staticWorkload` before a marker and calls it for the first time after `MARKER_TIMER_START`. No workload warmup occurs. The JSC command was:

```sh
jsc --useJIT=false --dumpGeneratedBytecodes=true static_function_probe.js
```

In `static_function.stderr.txt`, `MARKER_TIMER_START` is the runtime line 81, and the `staticWorkload` bytecode dump starts at runtime line 82. Because global bytecode output already preceded the runtime markers, this order is evidence that the function's code is prepared/installed at first call **inside** the proposed timer region. `Source/JavaScriptCore/bytecode/UnlinkedFunctionExecutable.cpp:245-276` generates an unlinked function code block on demand. Static declaration alone does not establish pre-timer function bytecode generation.

The `--forceEagerCompilation` option was inspected but `Source/JavaScriptCore/runtime/Options.cpp:919-931` only changes thresholds/eval-cache behavior; there is no evidence that it eagerly prepares all LLInt function bytecode. No workload pre-call was used because that would warm ICs/runtime state and change the existing no-performance-warmup semantics.

Exploratory disk-cache path: `jsc --useJIT=false --diskCachePath=<cache directory> --dumpGeneratedBytecodes=true --verboseCompilation=true static_function_probe.js` was run once to populate and once in a fresh process to consume the cache. `cache_prepare.stderr.txt:82-83` shows first-call function compilation after timer start. `cache_consume.stderr.txt:1` shows a 3488-byte cache decoded before timer start, and no fresh `Compiled ... staticWorkload` line, **but** the function bytecode dump still begins after timer start (`:82-83`). Current source `UnlinkedFunctionExecutable.cpp:245-252,283+` calls `decodeCachedCodeBlocks` lazily on the function's first `unlinkedCodeBlockFor` request. Therefore the cache is not demonstrated to eliminate all frontend/decode/link work from the timed region. It is not an approved cached benchmark mode.

Decision: `static_frontend_before_timer=false` for the source-only first-call probe. `STATIC_FRONTEND_EXCLUSION=UNKNOWN` for a future strict JSC workload; no pre-timer mechanism with unchanged no-warmup semantics was validated. Distinguish this from “cache does not exist”: the shell's cache path exists (`jsc.cpp:1416-1513`), but its boundary is insufficiently established.
