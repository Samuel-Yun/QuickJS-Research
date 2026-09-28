# Phase 2 alternatives — not executed

The pinned WSL JSC baseline validates mechanisms, but **cannot** be placed in the existing Windows QuickJS/V8 timing table (`PERFORMANCE_COMPARABILITY = NO`). Two legitimate paths remain:

1. **Unified Linux-native host:** freeze/rebuild or acquire official/reproducible QuickJS, V8/d8 and JSC on the *same Linux-native machine*, verify the interpreter-only configurations again, then re-run correctness and full strict timing. WSL JSC is not automatically comparable to Linux-native results; re-freeze the host/artifacts. Resolve the static-function frontend boundary before labeling the JSC mode frontend-excluded.
2. **Windows-native JSC:** obtain a verified official build/CI artifact with exact WebKit revision and configuration, or build the fixed source using a complete current Windows clang-cl toolchain. Revalidate options, tiers, RegExp, static frontend and correctness on that Windows binary. Merely copying this WSL ELF to Windows is not a Windows-native baseline.

Neither path has been started. No cross-OS GM or performance ranking is valid from Phase 1.
