# Advisor scope and unresolved identification

Client date: 2026-10-05 (Asia/Shanghai). The user's current self-contained prompt
authorizes diagnostic profiling, derived fragments and a small mechanism matrix.
It replaces the proposed "first perform comprehensive JSC IC switches" ordering.

The user reports that the 0928 discussion requested analysis of why V8 is faster,
representative code/bytecode, separation of generic interpretation and specialized
libraries, broader comparison, and reduction of frontend costs. The raw meeting
recording/transcript is not supplied in this request: these are user-reported scope,
not independently checked quotations.

The engine name around 15:34 and the reported versions "0.6/0.7/0.8" remain
UNKNOWN. A edited transcript reportedly says JSC. Our actual third runtime is
JavaScriptCore/WebKit fd3406f133a4e56d7aaf399ba5611ae44b8da7e9. Do not attribute
this commit, those version numbers, or an IC-switch experiment specifically to
the advisor. Confirm the intended engine and version at the next meeting.

Keep JSC as the existing supplemental comparison. Do not add QuickJS-NG to the
performance cohort; its code/docs may be inspected only as prior engineering.

The baseline and this stage are first-call-inclusive, not pure-loop self time.
Repeated Run changes IC, heap, GC and persistent state even without explicit
warmup. A monotonic timer does not prove frontend compilation has been excluded.
