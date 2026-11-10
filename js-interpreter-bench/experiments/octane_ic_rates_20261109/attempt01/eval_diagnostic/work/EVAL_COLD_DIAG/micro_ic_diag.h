/* Diagnostic only: all prepared non-length named read sites. */
static int oct_count_active;
static unsigned long long oct_queries, oct_hits, oct_misses, oct_fused_hits;
static unsigned long long oct_proto_hits, oct_regular_queries, oct_own_fills;
static void micro_ic_watch(JSContext *ctx, JSFunctionBytecode *b) { }
static force_inline void micro_ic_regular_query(ReadICSite *site)
{
    if (oct_count_active && site->atom != JS_ATOM_length) {
        oct_queries++; oct_regular_queries++;
    }
}
static force_inline void micro_ic_hit(ReadICSite *site, int fused)
{
    if (oct_count_active && site->atom != JS_ATOM_length) {
        oct_hits++;
        if (fused) { oct_queries++; oct_fused_hits++; }
        else if (site->holder_shape) oct_proto_hits++;
    }
}
static force_inline void micro_ic_miss(ReadICSite *site)
{
    if (oct_count_active && site->atom != JS_ATOM_length) oct_misses++;
}
static force_inline void micro_ic_fill(ReadICSite *site)
{
    if (oct_count_active && site->atom != JS_ATOM_length) oct_own_fills++;
}
void oct_count_begin(void)
{
    oct_queries=oct_hits=oct_misses=oct_fused_hits=oct_proto_hits=0;
    oct_regular_queries=oct_own_fills=0; oct_count_active=1;
}
void oct_count_end(void)
{
    oct_count_active=0;
    fprintf(stderr,"OCTANE_IC_COUNTS:{\"queries\":%llu,\"hits\":%llu,\"misses\":%llu,"
        "\"fused_hits\":%llu,\"proto_hits\":%llu,\"regular_queries\":%llu,\"own_fills\":%llu}\n",
        oct_queries,oct_hits,oct_misses,oct_fused_hits,oct_proto_hits,oct_regular_queries,oct_own_fills);
}
