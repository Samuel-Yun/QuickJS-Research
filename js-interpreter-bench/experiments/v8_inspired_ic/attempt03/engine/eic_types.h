/* MIT, QuickJS research experiment. See LICENSE from fixed upstream A.
 * Metadata belongs to a final bytecode instance; no object pointers serialized. */
typedef struct EICChain {
    uint8_t depth;
    JSShape *shapes[3];
} EICChain;
typedef struct EICEntry {
    JSShape *shape;
    EICChain *chain; /* NULL = own-data handler; otherwise guarded prototype data */
    uint32_t offset;
} EICEntry;
typedef struct EICSite {
    EICEntry mono;
    EICEntry *poly; /* three additional entries, allocated only on second shape */
    uint8_t state, count, unsupported;
} EICSite;
typedef struct EICMeta { JSAtom atom; uint32_t pc; } EICMeta;
enum { EIC_UNINITIALIZED, EIC_MONOMORPHIC, EIC_POLYMORPHIC, EIC_GENERIC };
#ifdef EIC_DIAGNOSTIC
typedef struct EICStats {
    uint64_t queries, hits, fallback, own_hits, proto_hits, store_hits;
    uint64_t mono, poly, generic, recompute, ineligible, alloc_fail;
    uint64_t metadata, vectors, polys, chains, shape_refs, shape_frees;
    uint64_t live_bytes, peak_bytes, requested_bytes, released_bytes;
    uint64_t named_read, named_store, keyed_read, keyed_store, global_read, global_store;
} EICStats;
static EICStats eic_stats;
#define EIC_COUNT(f) (++eic_stats.f)
#else
#define EIC_COUNT(f) ((void)0)
#endif
