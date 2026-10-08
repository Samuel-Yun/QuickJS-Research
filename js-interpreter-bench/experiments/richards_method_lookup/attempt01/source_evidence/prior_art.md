# Primary references and version-fixed NG implementation review

Consulted 2026-10-08. These are prior engineering, NOT current prebuilt-artifact
proof or performance forecasts. No NG build/performance baseline introduced.

1. Hölzle, Chambers, Ungar, ECOOP1991, *Optimizing Dynamically-Typed
   Object-Oriented Languages With Polymorphic Inline Caches*, pp21–38.
   [Authors' publication record](https://research.google/pubs/optimizing-dynamically-typed-object-oriented-languages-with-polymorphic-inline-caches/).
   Per-site multiple receiver-type lookup caching and send specialization are
   established techniques, not a novel contribution from this A/B test.
2. [V8 fast properties](https://v8.dev/blog/fast-properties), dated2017-08-30.
   Shapes/layouts and ICs can avoid repeated general property resolution.
   This design description is not a measurement of our lookup hit rate.
3. [WebKit bytecode format](https://webkit.org/blog/9329/a-new-bytecode-format-for-javascriptcore/), dated2019-06-21.
   Metadata-based inline caching is established interpreter engineering; its
   existence is not a proof of exact hotspot costs in this Richards input.

## Fixed NG version, actual implementation coverage

Reviewed **QuickJS-NG v0.8.0**, [official release](https://github.com/quickjs-ng/quickjs/releases/tag/v0.8.0)
identifying revision **4822912** (full40-digit resolution UNKNOWN), and official
[version-fixed quickjs.c](https://raw.githubusercontent.com/quickjs-ng/quickjs/v0.8.0/quickjs.c).
This is a historical implementation inspection, not a statement about latest.

- Lines549–609: four-shape ring entries store shape and property offset;
  `get_ic_prop_offset` searches and returns a matching offset or miss.
- Lines15384–15460: field/receiver-preserving field bytecodes initially perform
  resolution then can rewrite to cached field bytecodes, preserving receivers.
- Lines6928–7064: filling `add_ic_slot` is conditional on `proto_depth == 0`;
  prototype traversal still occurs when not an own hit.
- Lines7083–7098: cached hit returns the receiver's own property slot;
  otherwise it calls the general lookup helper.

Therefore this pinned implementation's OWN-slot PIC does not by itself cache
our selected inherited TCB.run method. This is a source-coverage distinction,
not a performance ranking or claim that prototype caches are new.

[NG PR884](https://github.com/quickjs-ng/quickjs/pull/884) records removal of
inline caches merged2025-02-06 (displayed merge revision7de6d46). Historical
generic own-property IC overhead was already an engineering concern. The
[difference docs](https://quickjs-ng.github.io/quickjs/diff/) still list PIC;
that prose alone must not be used to infer a particular later implementation.
v0.12.0/db870fd4619bf8c659cf85dd092101ea2a1a8a07 was also located through the
official release, but complete local source acquisition was blocked by HTTPS
certificate verification; its complete current IC coverage remains UNKNOWN.
Do not claim every later version lacks all caching from this partial check.

Read through the official web-source viewer; browser line numbering recorded
above. Local full-file/archive SHA for NG remains UNKNOWN; no source hash was
fabricated. Direct curl fetch failed with SEC_E_UNTRUSTED_ROOT; no TLS/global
security settings were changed. See reference_fetch.py/diagnostic records.

## One prospective question, not implementation in this stage

Can a SMALL inherited-method load cache guarded by receiver shape, prototype
identity/version and own-shadowing checks preserve method lookup semantics and
recover measurable benefit without the startup/memory cost of a generic IC?
Only consider a later independent upstream-revision VM prototype after approval.
Compare against existing PIC/prototype-cache engineering, not a novelty claim.
Measure hit/miss/guard/invalidation costs, per-site memory, initialization,
GC/reference retention and fallback frequency. Preserve correct receivers,
own overrides, deletion/redefinition, getter/Proxy fallback and prototype
mutation; never silently reuse stale methods. Existing v0.8.0 own-slot PIC is
not adequate *for this inherited property*, not generally “inadequate”.
