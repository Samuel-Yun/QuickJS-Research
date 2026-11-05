2026-10-15: auxiliary branch/shape diagnostic attempt01 failed its added arithmetic
else-arm assertion. Its hand-written expected value -15 was an error: with
(a,b,c)=(7,-3,4), x=-5 and y=10, the else result is x+y=5. Preserved
probes/semantics.js and raw/diagnostics/quickjs_semantics.json unchanged. The
corrected probe uses semantics_attempt02.js and new records. This probe is not a
formal workload/input: all six original case sources, expected results and the
180 collected formal samples remain unchanged. No tolerance was enlarged.
