/* Experimental per-final-read-site IC. No QuickJS-NG runtime code imported. */
#include "read_ic_config.h"
#if RDI_CAPACITY == 1
typedef struct ReadICSite {
    JSShape *shape;
    uint32_t prop_offset;
    JSAtom atom;
} ReadICSite;
#elif RDI_CAPACITY == 4
typedef struct ReadICSite {
    JSShape *shape[4];
    uint32_t prop_offset[4];
    JSAtom atom;
    uint8_t recent, victim;
} ReadICSite;
#else
#error unsupported read IC capacity
#endif
typedef struct RDIFunctionDiag RDIFunctionDiag;
#ifdef READ_IC_DIAGNOSTIC
#define RDI_DPARAM , RDICounters *d
#define RDI_DARG(x) , (x)
#define RDI_COUNT(field) (++d->field)
#define RDI_REASON(field) (++d->field)
#define RDI_DLOCAL(index) RDICounters *d = &b->read_ic_diag->sites[index]
#define RDI_QUERY() rdi_diag_query(d)
#define RDI_OCCUPY() rdi_diag_occupy(d)
#define RDI_REPLACE() (++rdi_diag_shape_unref, ++rdi_diag_shape_ref, ++d->replacements)
#else
#define RDI_DPARAM
#define RDI_DARG(x)
#define RDI_COUNT(field) ((void)0)
#define RDI_REASON(field) ((void)0)
#define RDI_DLOCAL(index)
#define RDI_QUERY() ((void)0)
#define RDI_OCCUPY() ((void)0)
#define RDI_REPLACE() ((void)0)
#endif
