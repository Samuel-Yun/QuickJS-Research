/* Standalone diagnostic counters: no VM fields or retained JS references. */
enum LsgCounter {
    LSG_calls, LSG_positive_hits, LSG_positive_hits_with_record,
    LSG_positive_hits_local, LSG_plan_publications, LSG_plan_allocations,
    LSG_local_attempts, LSG_local_successes, LSG_local_failures, LSG_no_local_record,
    LSG_full_checks, LSG_full_check_accepts, LSG_full_check_rejects,
    LSG_proto_lookups_all, LSG_chain_lookups_all, LSG_proto_lookups_hot, LSG_chain_lookups_hot,
    LSG_build_attempts, LSG_build_callee_unhashed, LSG_build_proto_lookups,
    LSG_build_prototype_descriptor, LSG_build_deep, LSG_build_special, LSG_build_chain_unhashed,
    LSG_records_built, LSG_records_freed, LSG_record_allocation_failures,
    LSG_record_requested_bytes, LSG_record_usable_bytes, LSG_shape_refs_held, LSG_shape_refs_released,
    LSG_before_initial_missing, LSG_after_initial_missing, LSG_other_pre_failure, LSG_other_post_failure,
    LSG_plan_allocation_failures, LSG_COUNT_END
};
static const char *lsg_names[] = {
    "calls","positive_hits","positive_hits_with_record","positive_hits_local","plan_publications","plan_allocations",
    "local_attempts","local_successes","local_failures","no_local_record",
    "full_checks","full_check_accepts","full_check_rejects",
    "proto_lookups_all","chain_lookups_all","proto_lookups_hot","chain_lookups_hot",
    "build_attempts","build_callee_unhashed","build_proto_lookups",
    "build_prototype_descriptor","build_deep","build_special","build_chain_unhashed",
    "records_built","records_freed","record_allocation_failures",
    "record_requested_bytes","record_usable_bytes","shape_refs_held","shape_refs_released",
    "before_initial_missing","after_initial_missing","other_pre_failure","other_post_failure",
    "plan_allocation_failures"
};
static uint64_t lsg_counts[LSG_COUNT_END];
static unsigned lsg_full_depth;
static int lsg_this_local;
#define LSG_COUNT(k) (++lsg_counts[LSG_##k])
#define LSG_ADD(k,n) (lsg_counts[LSG_##k] += (n))
#define LSG_FULL_BEGIN() do { LSG_COUNT(full_checks); lsg_full_depth++; } while (0)
#define LSG_FULL_END(ok) do { lsg_full_depth--; if(ok)LSG_COUNT(full_check_accepts);else LSG_COUNT(full_check_rejects); } while (0)
static void __attribute__((destructor)) lsg_report(void)
{
    const char *path=getenv("LSG_OUTPUT");if(!path)return;
    FILE *out=fopen(path,"w");if(!out)return;
    fputs("{",out);
    for(unsigned i=0;i<LSG_COUNT_END;i++)
        fprintf(out,"%s\"%s\":%" PRIu64,i?",":"",lsg_names[i],lsg_counts[i]);
    fprintf(out,",\"FourSite_bytes\":%zu,\"FullPlan_bytes\":%zu",sizeof(FourSite),sizeof(FullPlan));
#ifdef LSG_HAS_LOCAL
    fprintf(out,",\"LocalShapeGuard_bytes\":%zu",sizeof(LocalShapeGuard));
#else
    fputs(",\"LocalShapeGuard_bytes\":0",out);
#endif
    fprintf(out,",\"FullPlan_callee_offset\":%zu,\"FullPlan_initial_offset\":%zu,\"FullPlan_final_offset\":%zu,\"FullPlan_recipe_offset\":%zu}\n",
        offsetof(FullPlan,callee),offsetof(FullPlan,initial),offsetof(FullPlan,final),offsetof(FullPlan,recipe));
    fclose(out);
}
