/* Diagnostic only. No per-site allocation or cache-policy change. */
static ReadICSite*wb_read_site;
static int wb_active,wb_kind;
static uint64_t wb_read[8],wb_ctor[12],wb_sparse[24];
static force_inline void wb_query(ReadICSite*s){if(wb_active && wb_kind==1 && s==wb_read_site){wb_read[0]++;wb_read[5]++;}}
static force_inline void wb_hit(ReadICSite*s,int fused){if(wb_active && wb_kind==1 && s==wb_read_site){wb_read[1]++;if(fused){wb_read[0]++;wb_read[3]++;}else wb_read[4]++;}}
static force_inline void wb_miss(ReadICSite*s){if(wb_active && wb_kind==1 && s==wb_read_site)wb_read[2]++;}
static force_inline void wb_fill(ReadICSite*s){if(wb_active && wb_kind==1 && s==wb_read_site)wb_read[6]++;}
