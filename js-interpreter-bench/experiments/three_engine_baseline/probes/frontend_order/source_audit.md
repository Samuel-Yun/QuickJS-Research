# Pinned-source frontend investigation

Initial effective-investigation budget: at most about 90 minutes. The investigation stopped after targeted source review and the new static/actual-workload trace tests; no usable no-execution preparation API was established. This was not a claim that the budget was exhausted. Existing disk-cache failure conditions were unchanged, so that procedure was not repeated.

The reviewed WebKit checkout still reports `fd3406f133a4e56d7aaf399ba5611ae44b8da7e9` and clean `git status --short`. Paths below are relative to `engines/webkit-fd3406f/Source/JavaScriptCore`.

- `bytecode/UnlinkedFunctionExecutable.cpp:53-91` parses a FunctionNode and invokes `BytecodeGenerator::generate`; `:245-276` requests/generates the block on demand, and `:250,283-301` decodes cached function blocks lazily.
- `bytecompiler/BytecodeGenerator.h:398-413` puts the `reportBytecodeCompileTimes` event around the **actual generator call**, not merely the bytecode dump. The new probe turns this option on, matches each `Compiled #hash` with the named codeblock's hash, and orders it against markers in the same stderr stream.
- `runtime/ScriptExecutable.cpp:390-424` prepares/installs execution code on request. `runtime/Options.cpp:919-931` shows `forceEagerCompilation` modifying JIT thresholds, concurrent JIT and eval-cache policy; the name does not establish eager static LLInt frontend preparation.
- `jsc.cpp:770-795,2326,3333` exposes `checkSyntax`/loading helpers, but no validated prepare-all-static-functions shell operation. `runtime/TestRunnerUtils.cpp:49-60` only retrieves existing baseline code blocks; it does not generate one. The `numberOfDFGCompiles` getter used in the static probe returns a **synthetic 1,000,000** when JIT is disabled and a block exists (`:62-79`): it is a block-presence signal here, never a count of actual DFG compilations.
- Shell source `jsc.cpp:1416-1513` supports a disk cache, but Phase 1 `cache_prepare.stderr.txt`/`cache_consume.stderr.txt` and lazy decode source do not establish full pre-timer function preparation. Their current hashes were rechecked and recorded in `summary.json`.

New `jsc_source/stderr.txt:179-235` places actual generation of **both** `__tebStaticWorkload` and `__tebStaticChild` between timer-start/stop markers. The eight selected actual Run/workload targets also have matched generation events after the marker (`summary.json`, `actual_*_jsc/`). This directly strengthens the earlier dump-order evidence. Dump timing alone is not used as the generation proof.

V8 `v8_default/` versus `v8_no_lazy/` shows both static functions generated before the marker only in the `--no-lazy` candidate. All eight selected primary Run targets have pre-marker bytecode evidence (`actual_*_v8/`); this does not cover every called helper or all runtime recompilation. QuickJS's same pinned source recursively creates child functions (`quickjs.c:36072-36085`) before top-level evaluation (`:37280`), with the new Linux build using that source unchanged.

No workload was invoked before the MAIN marker. No dynamic eval/Function preparation or code-flushing/recompilation exclusion is claimed. `STATIC_FRONTEND_EXCLUSION = UNKNOWN`; MAIN explicitly includes any remaining first-call frontend work.
