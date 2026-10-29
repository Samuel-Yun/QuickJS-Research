/* Independent diagnostic counters, not present in H release. */
static unsigned long long h_created_functions,h_created_sites,h_used_sites;
static unsigned long long h_requested_bytes,h_live_bytes,h_peak_bytes;
static unsigned long long h_shape_retains,h_shape_releases;
static void hdiag_alloc(unsigned n) {
    if (!n) return;
    h_created_functions++;h_created_sites+=n;
    h_requested_bytes+=(unsigned long long)n*sizeof(ReadICSite);
    h_live_bytes+=(unsigned long long)n*sizeof(ReadICSite);
    if(h_live_bytes>h_peak_bytes)h_peak_bytes=h_live_bytes;
}
static void hdiag_free(unsigned n) {
    assert(h_live_bytes >= (unsigned long long)n*sizeof(ReadICSite));
    h_live_bytes-=(unsigned long long)n*sizeof(ReadICSite);
}
static void hdiag_retain(JSShape *s) {if(s)h_shape_retains++;}
static void hdiag_release(JSShape *s) {if(s)h_shape_releases++;}
static void hdiag_hit(int inherited) {
    if(!audit_active)return;
    if(inherited)audit_active->h_proto_hits++;else audit_active->h_own_hits++;
}
static void hdiag_receiver_miss(void) {if(audit_active)audit_active->h_receiver_misses++;}
static void hdiag_holder_miss(void) {if(audit_active)audit_active->h_holder_misses++;}
static void hdiag_fill(int inherited,int replacement) {
    if(!replacement)h_used_sites++;
    if(!audit_active)return;
    if(inherited)audit_active->h_proto_fills++;else audit_active->h_own_fills++;
}
static void hsite_json(FILE *out,AuditSite *s) {
    fprintf(out,",\"h_own_hits\":%llu,\"h_proto_hits\":%llu,\"h_receiver_misses\":%llu,\"h_holder_misses\":%llu,\"h_own_fills\":%llu,\"h_proto_fills\":%llu",
      s->h_own_hits,s->h_proto_hits,s->h_receiver_misses,s->h_holder_misses,s->h_own_fills,s->h_proto_fills);
}
static void hglobal_json(FILE *out) {
    fprintf(out,",\"cache_lifecycle\":{\"site_sizeof\":%zu,\"created_functions\":%llu,\"created_sites\":%llu,\"used_sites\":%llu,\"requested_bytes_total\":%llu,\"peak_requested_live_bytes\":%llu,\"final_requested_live_bytes\":%llu,\"shape_retains\":%llu,\"shape_releases\":%llu}",
      sizeof(ReadICSite),h_created_functions,h_created_sites,h_used_sites,h_requested_bytes,h_peak_bytes,h_live_bytes,h_shape_retains,h_shape_releases);
}
