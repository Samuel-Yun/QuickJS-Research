# Runtime option audit, pinned revision

Command evidence: `/home/mzyx/jsc_build_fd3406f/JSCOnly/Release/bin/jsc --help`, `jsc --options`, and `jsc --useJIT=false --useLLInt=true --validateOptions=true --options`. Full outputs: `probes/smoke/jsc_help.txt`, `probes/tier/options_default.txt`, `probes/tier/options_llint_candidate.txt`. The `--help` syntax is `--<jsc VM option>=<value>`; `--options` reports effective values, which matter more than an option's source initializer. Source paths below are relative to `engines/webkit-fd3406f/Source/JavaScriptCore/`.

| Option | Default → LLInt candidate | Effect and source | Status |
|---|---|---|---|
| `useLLInt` | `true → true` | Allows LLInt; `runtime/OptionsList.h:84`; installation `runtime/ScriptExecutable.cpp:417-424` | Confirmed |
| `useJIT` | `true → false` | Master JIT/executable-memory policy; `runtime/OptionsList.h:85`, `runtime/Options.cpp:731-752,880-883` | Confirmed |
| `useBaselineJIT` | `true → false` | JS Baseline tier; `runtime/OptionsList.h:86`, `runtime/Options.cpp:740` | Confirmed |
| `useDFGJIT` | `true → false` | JS DFG tier; `runtime/OptionsList.h:87`, `runtime/Options.cpp:742` | Confirmed |
| `useFTLJIT` | `true → false` | JS FTL tier; `runtime/OptionsList.h:256`, `runtime/Options.cpp:743` | Confirmed |
| `useRegExpJIT` | `true → false` | Regex JIT, also disabled by master flag; `runtime/OptionsList.h:88`, `runtime/Options.cpp:745` | Confirmed |
| `useOSREntryToDFG` / `useOSREntryToFTL` | `true → true` | These option booleans remain true, **but their JIT targets are disabled**. `runtime/OptionsList.h:253-254`; LLInt's actual JIT-entry guard `llint/LLIntSlowPaths.cpp:371-378,418-427,481-499` | Confirmed booleans; no successful JIT OSR in probe |
| `useLLIntICs` | `true → true` | LLInt property and call inline caches; `runtime/OptionsList.h:654`, `llint/LLIntSlowPaths.cpp:750,864,1089`, `bytecode/CallLinkInfo.cpp:245,274` | Confirmed option/path; cache-hit rates UNKNOWN |
| `dumpGeneratedBytecodes` | `false → false` | Bytecode dump; `runtime/OptionsList.h:112`; explicitly enabled only for frontend probes | Confirmed |
| `verboseCompilation` | `false → false` | Compilation trace; `runtime/OptionsList.h:175`; explicitly enabled in tier probes | Confirmed |
| `logCompilationChanges` | `false → false` | Code-installation events; `runtime/OptionsList.h:177`; explicitly enabled in tier probes | Confirmed |
| `verboseOSR` | `false → false` | OSR slow-path/events; `runtime/OptionsList.h:185`; explicitly enabled in tier probes | Confirmed |
| `validateOptions` | `false → true` | Fail on mistyped VM options; `runtime/OptionsList.h:80`; diagnostic only | Confirmed |
| `forceEagerCompilation` | `false → false` | Name is misleading for this question: current `runtime/Options.cpp:919-931` adjusts JIT thresholds/eval cache; no evidence that it eagerly generates every static function's LLInt bytecode | Frontend use **not** established |
| `diskCachePath` | `null → null` | Restricted shell bytecode cache path; `runtime/OptionsList.h:616`, `jsc.cpp:1416-1513`; used only for exploratory cache probe | Confirmed path; full pre-timer exclusion **not** established |

Primary mechanism-validation command:

```sh
/home/mzyx/jsc_build_fd3406f/JSCOnly/Release/bin/jsc \
  --useJIT=false --useLLInt=true --validateOptions=true workload.js
```

`--useLLInt=true` is explicit but redundant after `--useJIT=false` in this build. `--validateOptions=true` catches typos and was used in probes; it is not a different execution tier. This configuration is **LLInt-only JavaScript execution**, not proof that the whole process contains no generated native code. It additionally changes RegExp JIT, JIT-based thunks and other subsystems via `disableAllJITOptions`.
