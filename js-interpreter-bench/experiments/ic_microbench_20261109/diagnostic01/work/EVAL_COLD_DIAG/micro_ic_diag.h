/* Diagnostic-only counters for readLoop's sole x read site.
   The original cache decisions, layout and replacement logic are unchanged. */
static ReadICSite *micro_ic_site;
static unsigned long long micro_ic_queries, micro_ic_hits, micro_ic_misses;
static unsigned long long micro_ic_fused_hits, micro_ic_regular_hits;
static unsigned long long micro_ic_regular_queries, micro_ic_cold_misses;
static unsigned long long micro_ic_fills, micro_ic_watch_count;
static void micro_ic_report(void)
{
    fprintf(stderr, "IC_MICRO_COUNTS:{\"function\":\"readLoop\",\"atom\":\"x\","
        "\"capacity\":%d,\"watched_sites\":%llu,\"queries\":%llu,\"hits\":%llu,"
        "\"misses\":%llu,\"fused_hits\":%llu,\"regular_hits\":%llu,"
        "\"regular_queries\":%llu,\"cold_misses\":%llu,\"fills\":%llu}\n",
        RDI_CAPACITY, micro_ic_watch_count, micro_ic_queries, micro_ic_hits,
        micro_ic_misses, micro_ic_fused_hits, micro_ic_regular_hits,
        micro_ic_regular_queries, micro_ic_cold_misses, micro_ic_fills);
}
static void micro_ic_watch(JSContext *ctx, JSFunctionBytecode *b)
{
    const char *name = JS_AtomToCString(ctx, b->func_name);
    if (!name) abort();
    int match = !strcmp(name, "readLoop");
    JS_FreeCString(ctx, name);
    if (!match) return;
    assert(b->read_ic_count == 1 && micro_ic_watch_count == 0);
    name = JS_AtomToCString(ctx, b->read_ic_sites[0].atom);
    if (!name) abort();
    assert(!strcmp(name, "x"));
    JS_FreeCString(ctx, name);
    micro_ic_site = &b->read_ic_sites[0];
    micro_ic_watch_count++;
    if (atexit(micro_ic_report)) abort();
}
static force_inline void micro_ic_regular_query(ReadICSite *site)
{
    if (site == micro_ic_site) {
        micro_ic_queries++;
        micro_ic_regular_queries++;
    }
}
static force_inline void micro_ic_hit(ReadICSite *site, int fused)
{
    if (site == micro_ic_site) {
        micro_ic_hits++;
        if (fused) { micro_ic_queries++; micro_ic_fused_hits++; }
        else micro_ic_regular_hits++;
    }
}
static force_inline void micro_ic_miss(ReadICSite *site)
{
    if (site == micro_ic_site) {
        micro_ic_misses++;
        if (!site->shape) micro_ic_cold_misses++;
    }
}
static force_inline void micro_ic_fill(ReadICSite *site)
{
    if (site == micro_ic_site) micro_ic_fills++;
}

