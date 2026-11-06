/* Public experimental templates derived from the frozen MIT-licensed M. */
#include "read_ic_config.h"
typedef struct SearchHints {
    uint32_t offsets[SEARCH_HINTS]; /* encoded offset+1; zero is empty */
    uint32_t pending;
    uint8_t victim;
} SearchHints;
typedef struct SearchEntry {
    JSShape *shape;
    uint32_t offset;
    JSAtom atom;
    uint8_t ready;
} SearchEntry;
typedef struct ReadICSite {
#if SEARCH_LAYOUT == 1
    JSShape *shapes[SEARCH_SLOTS];
    uint32_t offsets[SEARCH_SLOTS];
#elif SEARCH_LAYOUT == 3
    JSShape *shapes[SEARCH_SLOTS];
    uint16_t offsets[SEARCH_SLOTS];
#else
    struct { JSShape *shape; uint32_t offset; } entries[SEARCH_SLOTS];
#endif
#if SEARCH_LAYOUT != 2
    JSAtom atom;
#endif
#if SEARCH_MRU
    uint8_t recent;
#endif
#if SEARCH_SLOTS > 1
    uint8_t victim;
#endif
#if SEARCH_EVICTION == 1
    uint32_t age[SEARCH_SLOTS], tick;
#elif SEARCH_EVICTION == 2
    uint8_t referenced[SEARCH_SLOTS];
#endif
#if SEARCH_POLICY
    uint32_t seen, queries, misses, streak, cooldown;
    uint8_t confidence, skip_update;
#endif
#if SEARCH_HINT_SCOPE == 1 || SEARCH_HINT_SCOPE == 3
    SearchHints hints;
#endif
#if SEARCH_HINT_SCOPE == 3
    struct ReadICSite *hint_owner;
#endif
} ReadICSite;
typedef struct RDIFunctionDiag RDIFunctionDiag;
#define RDI_DPARAM
#define RDI_DARG(x)
#define RDI_COUNT(field) ((void)0)
#define RDI_REASON(field) ((void)0)
#define RDI_DLOCAL(index)
#define RDI_QUERY() ((void)0)
#define RDI_OCCUPY() ((void)0)
#define RDI_REPLACE() ((void)0)
