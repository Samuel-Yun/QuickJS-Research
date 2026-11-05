/* Called only after JS_FreeRuntime in independent diagnostic qjs, never release.
 * Whole-process aggregate counters; no per-operation event file or signal handler. */
void JS_EICDumpStats(void)
{
#ifdef EIC_DIAGNOSTIC
    fprintf(stderr,"EIC_STATS:{");
#define PRINT(f) fprintf(stderr,"\"" #f "\":%" PRIu64 ",",eic_stats.f)
    PRINT(queries); PRINT(hits); PRINT(fallback); PRINT(own_hits); PRINT(proto_hits); PRINT(store_hits);
    PRINT(mono); PRINT(poly); PRINT(generic); PRINT(recompute); PRINT(ineligible); PRINT(alloc_fail);
    PRINT(metadata); PRINT(vectors); PRINT(polys); PRINT(chains); PRINT(shape_refs); PRINT(shape_frees);
    PRINT(live_bytes); PRINT(peak_bytes); PRINT(requested_bytes); PRINT(released_bytes);
    PRINT(named_read); PRINT(named_store); PRINT(keyed_read); PRINT(keyed_store); PRINT(global_read); PRINT(global_store);
#undef PRINT
    fprintf(stderr,"\"scope\":\"whole_process_after_FreeRuntime\"}\n");
#endif
}
