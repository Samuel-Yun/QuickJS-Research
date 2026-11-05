# NavierStokes evidence chain (counterexample)

1. Frozen `benchmarks/octane/upstream/navier-stokes.js` FluidField.lin_solve
   lines152–179; project calls it with a=1,c=4, twice per update. diffuse uses
   a=0,c=1 copy path. Setup is128x128/20iterations; solver persists across N.
   Original frame15 density checksum77 is retained; N1/2 validation has extra
   calls outside measurement, disclosed in diagnostic records.
2. Original N32 instrumented counters: lin_solve96, project64, advect96,
   set_bnd1728, identical across engines and three independent processes.
   Native QJS counter:105,969,638 get_array_el operations take its in-handler
   dense-Array branch, zero entries to the counted helper branch. This excludes
   get_array_el3/store branches and includes Setup/postvalidation: not all
   memory accesses and not per-opcode time.
3. JSC sampling identifies lin_solve as largest function (rep1 1190/1692);
   V8 top-PC sampling identifies Add, KeyedLoadIC, GetKeyedProperty, Inc, Mul,
   and stores. Only whole-process sampling fractions are available.
4. Derived `microbench/navier_kernel.js` preserves general inner-expression
   indexing and left-to-right arithmetic on a64x64/20iteration stencil. Edges
   stay zero (original set_bnd omitted), x0 is deterministic fractional input,
   x persists; Array vsFloat64Array changes only the representation constructor.
   Independent `tooling/oracle.c` specifies checksums for each N. This does not
   reproduce the complete fluid algorithm or claim its checksum77.
5. Kernel bytecode semantics agree: repeated keyed loads/stores, arithmetic,
   induction updates and conditional loops. QJS diagnostic N1 yields333316
   get_array_el including postchecksum: Array fast333316/slow0; F64 fast0/
   slow333316. The slow label here means leaving the in-handler Array path:
   `qjs.property_value.txt` lines9081ff already has a specialized Float64Array
   bounds-check/load. It is NOT proof of generic name hashing on every access.
6. Fixed binary QJS `quickjs.JS_CallInternal.asm` contains indirect dispatch
   and calls to JS_GetPropertyValue; fixed JSC source has numeric array/typed
   array dispatch and actual llint_op_get_by_val disassembly at0x1a12e1.
   Counts and structure support a representation-sensitive hypothesis, not a
   measured percentage of helper/dispatch/boxing/GC costs.
7. Baseline recomputation: QJS61.663120 < V874.770359, but JSC58.624688 is fastest.
   This differs from Richards; no claim that QuickJS is fastest of all three.
   Formal derivative contrasts are reported separately in summary.
