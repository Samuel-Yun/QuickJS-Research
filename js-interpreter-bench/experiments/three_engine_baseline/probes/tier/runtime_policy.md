# JS tiers, RegExp and native builtins

Current artifact evidence is `summary.json`, `v8_help/`, `v8_candidate_flags/`, `v8_{default,candidate}/`, `jsc_{default,candidate}*/`, and QuickJS binary disassembly. Trace counts are matched diagnostic events, not a claim that each match is a unique successful compilation.

QuickJS's new Linux binary has `DIRECT_DISPATCH=1`, `dispatch_table.83`, and `JS_CallInternal` indexed jumps such as `jmp QWORD PTR [r15+rax*8]` at `22cd2` (`quickjs_macros.txt`, `quickjs_symbols.txt`, `quickjs_JS_CallInternal.txt`). The source implementation is `quickjs.c:52-55,17761-17779`. This verifies the current artifact's dispatch and says nothing about its bottleneck.

Actual Linux d8 help states `max-opt=0` means Ignition/interpreter. Its candidate flag dump disables Sparkplug/Maglev/TurboFan and lazy compilation. Default hot-probe event matches: Sparkplug 11, Maglev 7, TurboFan 6, successful OSR entry 2. Candidate: all those counts 0, interpreted-status matches 333, plus named Ignition bytecode. Supported trace flags were checked in the help and then run; none enter the MAIN command. The [official version tag](https://chromium.googlesource.com/v8/v8/+/refs/tags/15.6.21) was rechecked as `37fb84941c9be9f9914ee50b1ad366f06a1bd764`, but the archive itself does not prove its exact source revision. Attempts to archive the flag header failed TLS/connection checks (`../../runtime/acquisition_diagnostics.json`); current Linux binary help/effective flags/runtime traces are the primary evidence.

JSC effective candidate options have LLInt=true and general/Baseline/DFG/FTL JIT=false. Default hot probe installs later-tier code and performs OSR; candidate installs LLInt code and has no successful JIT transition. Two OSR slow-path-entry log lines remain, which source `llint/LLIntSlowPaths.cpp:371-378,418-427,481-499` places before the false `useBaselineJIT` guard. Source `runtime/Options.cpp:731-752,880-883` disables the JIT subsystems. LLInt IC stays true.

| Runtime | Regex policy in MAIN | Actual evidence / limit |
|---|---|---|
| QuickJS | Its C regex VM executes regex bytecode; not Ignition/LLInt JS dispatch | `quickjs.c:48159,48386` calls `lre_exec`; `libregexp.c:3326+`; regex smoke PASS |
| V8 | Regex native compilation remains permitted: `--no-regexp-interpret-all`, `--regexp-tier-up`, `--regexp-tier-up-ticks=0` | Standard regex smoke PASS; native execution in this probe **UNKNOWN** because `--trace-regexp-tier-up` is readonly in this binary |
| JSC | `useJIT=false` also makes `useRegExpJIT=false` | Default regex trace has RegExpJIT execution; candidate has none; both checksum PASS |

The V8 readonly trace attempt exited -6; stderr and its command remain in `regexp_v8_candidate/`. `regexp_v8_no_trace/` runs the identical probe with normal frozen flags and passes. This optional diagnostic failure is distinct from a runtime or correctness failure; see `regexp_trace_limitation.json`. No flag was added to MAIN to work around it.

GC, native runtime helpers and builtins remain actual workload costs. These flags control JS tiers, not proof of an entirely interpreter-only process. Regex suites are not pure-dispatch evidence, and policy asymmetry must remain visible in future interpretation.
