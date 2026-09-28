# RegExp execution policy

The actual default option dump (`probes/tier/options_default.txt:10`) reports `useRegExpJIT=true`. With `--useJIT=false`, the effective dump (`probes/tier/options_llint_candidate.txt:10`) reports `useRegExpJIT=false`. This is explicitly done by `engines/webkit-fd3406f/Source/JavaScriptCore/runtime/Options.cpp:731-752,880-883`, not inferred from the flag name.

`probes/smoke/regexp_probe.js` was run once with `--traceRegExpJITExecution=true` in default and LLInt-only modes (`OptionsList.h:140`, `yarr/YarrJIT.cpp:2150-2157,7603-7610`). Both returned `REGEXP_PASS:1000`; `regexp_default.stderr.txt` contains RegExp JIT execution trace output, while `regexp_llint_only.stderr.txt` is empty. This confirms default RegExp JIT activity in this probe and no observed RegExp JIT under LLInt-only mode. It does **not** identify all underlying regex interpreter/helper costs.

Consequence: future SunSpider `regexp-dna` and Octane `RegExp` cases include regex engine policy effects. Their elapsed time cannot be labeled solely “LLInt bytecode interpreter performance,” even if JavaScript functions remain in LLInt.
