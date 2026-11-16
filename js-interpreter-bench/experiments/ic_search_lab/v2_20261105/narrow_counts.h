/* Only included in separately patched diagnostic source, NEVER release timing. */
typedef struct {
    uint64_t queries,hits,fallback,shape_misses,comparisons,updates;
    uint64_t descriptor,inherited,special,unhashed,own_miss,missing,primitive;
    uint64_t inserts,replacements,find_calls,hash_paths,hint_hits,prepares;
} V2NarrowCounters;
static V2NarrowCounters v2d;
static int v2d_on;
#undef RDI_COUNT
#undef RDI_REASON
#undef RDI_QUERY
#undef RDI_OCCUPY
#undef RDI_REPLACE
#define RDI_COUNT(field) do { if(v2d_on) v2d.field++; } while(0)
#define RDI_REASON(field) RDI_COUNT(field)
#define RDI_QUERY() RDI_COUNT(queries)
#define RDI_OCCUPY() RDI_COUNT(inserts)
#define RDI_REPLACE() RDI_COUNT(replacements)
