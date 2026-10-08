# RegExp boundary

Original frozen RegExp input and strict constructor-only Setup; five original
benchmark iterations per Run and checksum1666109 remain checked. Existing N64
baseline is not rerun as a full formal matrix.

Actual d8 help lists trace-regexp-tier-up/exec but this release artifact rejects
the former as a readonly flag: raw/regexp.v8.trace.json retains exit-6/stderr.
Help listing is therefore not sufficient evidence that a diagnostic is usable.
Supported --prof succeeds. profiles/regexp.v8.log has code-creation entries
labelled RegExp and sampled top PCs inside two such registered ranges.
The local parser does top-PC range association only (no C++ symbols or stacks).
Three additional original-N64 profiles are saved, plus a diagnostic with live
process memory maps: `profiles/regexp.mapped/execution_evidence.json` records124
RegExp tick PCs, all124 inside both a registered RegExp code range and an
executable mapping observed in that process. The raw tick, creation record and
mapping permissions are saved together. This corroborates actual native RegExp
execution rather than only an allowing flag. Mapping snapshots are not exactly
simultaneous with every tick; no exact native fraction or per-pattern full
coverage is claimed. Exact artifact source/toolchain is still UNKNOWN.

Fixed JSC source Options.cpp disables useRegExpJIT when disabling JIT; RegExp.cpp
branches on that option and uses Yarr bytecode interpretation. The --sample run
reports110/174 samples in the RegExp category and zero JS JIT tier samples.
RegExp category itself does not say native-JIT: it also covers interpreted Yarr
work. Prior/current fixed flags and source are required for that distinction.

QuickJS uses its C libregexp path, not a JS JIT tier. Native builtin/helpers and
regex are intentionally included in the MAIN metric. None of this difference
is a clean comparison of generic JS dispatch; JS-JIT-off is not all-generated-
runtime-code-off for V8. Do not silently change formal regex flags.
