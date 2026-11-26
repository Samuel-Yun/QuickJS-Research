/* Count build only: no FOUR_DIAG, no extra fields or per-site allocation. */
enum {MC_q,MC_h,MC_eligible,MC_fill,MC_guard,MC_overflow,
      MC_work1,MC_work2,MC_work3,MC_work4,MC_work5,MC_work6,MC_COUNT};
static uint64_t mc_four[MC_COUNT],mc_recipe[5],mc_base[5],mc_proto[5],mc_chain[5];
static uint64_t mc_descriptors[5],mc_empty[5];
static uint64_t mc_no_plan,mc_identity_mismatch,mc_normal,mc_negative_queries,mc_negative_hits;
static uint64_t mc_initial_unchanged,mc_final_unchanged;
static int mc_active,mc_stage;
static void *mc_site;
static JSFunctionBytecode *mc_function;
static unsigned mc_pc,mc_argc;
#define FOUR_COUNT(s,k) do{if(mc_active)mc_four[MC_##k]++;}while(0)
#define FOUR_ADD(s,k,n) do{if(mc_active)mc_four[MC_##k]+=(n);}while(0)
#define FOLLOW(i) do{if(mc_active){if((i)==0)mc_recipe[mc_stage]++;else if((i)==2)mc_negative_hits++;}}while(0)
#define FOLLOW_ADD(i,n) ((void)0)
#define MC_STAGE(field) do{if(mc_active)mc_##field[mc_stage]++;}while(0)
static JSShape *mc_find_empty(JSRuntime*rt,JSObject*proto)
{
    MC_STAGE(empty);
    return find_hashed_shape_proto(rt,proto);
}
static void mc_array(const char *name,const uint64_t *v,unsigned n)
{
    fprintf(stderr,",\"%s\":[",name);
    for(unsigned i=0;i<n;i++)fprintf(stderr,"%s%llu",i?",":"",(unsigned long long)v[i]);
    fputc(']',stderr);
}
static void mc_report(void)
{
    fprintf(stderr,"CTOR_MISS_COUNTS:{\"pc\":%u,\"argc\":%u,\"site_count\":1",mc_pc,mc_argc);
    mc_array("four",mc_four,MC_COUNT);mc_array("recipe",mc_recipe,5);
    mc_array("base",mc_base,5);mc_array("prototype",mc_proto,5);
    mc_array("chain",mc_chain,5);mc_array("chain_descriptors",mc_descriptors,5);
    mc_array("empty_shape_search",mc_empty,5);
    fprintf(stderr,",\"no_plan\":%llu,\"identity_mismatch\":%llu,\"normal_constructions\":%llu,"
        "\"negative_queries\":%llu,\"negative_hits\":%llu,\"initial_unchanged\":%llu,\"final_unchanged\":%llu}\n",
        (unsigned long long)mc_no_plan,(unsigned long long)mc_identity_mismatch,
        (unsigned long long)mc_normal,(unsigned long long)mc_negative_queries,(unsigned long long)mc_negative_hits,
        (unsigned long long)mc_initial_unchanged,(unsigned long long)mc_final_unchanged);
}
