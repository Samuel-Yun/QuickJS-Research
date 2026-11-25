/* Original experiment code. Not imported from V8. */
#define ST_CHAIN_MAX 4
typedef struct StoreSite {
    JSShape *from, *to;
    JSShape *chain[ST_CHAIN_MAX];
    JSAtom atom;
    uint32_t offset, pc;
    uint8_t depth;
} StoreSite;
typedef struct StDiag StDiag;
typedef struct StoreObservation {
    StoreSite learned;
    StoreSite *target;
    StDiag *diag;
} StoreObservation;
_Static_assert(sizeof(StoreSite) == 64, "store record size");
