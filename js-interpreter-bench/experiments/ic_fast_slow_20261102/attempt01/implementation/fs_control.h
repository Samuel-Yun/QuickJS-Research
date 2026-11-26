/* Independent public QuickJS experiment. No private implementation included. */
static ReadICSite *fs_target_site;
static void *fs_target_bytecode;
static unsigned fs_quota, fs_target_kind, fs_phase, fs_matched, fs_in_region;
static unsigned fs_scope;
#ifdef FS_DIAGNOSTIC
typedef struct {
    uint64_t total_target_reads, eligible_shape_matches, offset_reads;
    uint64_t forced_normal_lookups, true_shape_misses;
    uint64_t actual_find_own_property_entries, bucket_reads, chain_matches;
    uint64_t cache_updates, shape_retains, shape_releases;
} FSCounts;
static FSCounts fs_counts;
#define FS_COUNT(field) do { if (fs_scope) ++fs_counts.field; } while (0)
#define FS_ENTER(site) do { fs_scope = fs_in_region && (site)==fs_target_site; FS_COUNT(total_target_reads); } while(0)
#else
#define FS_COUNT(field) ((void)0)
#define FS_ENTER(site) ((void)0)
#endif
static force_inline int fs_adopt(ReadICSite *site)
{
    if (!fs_in_region || site != fs_target_site) return 1;
    unsigned phase=fs_phase;
    fs_phase=(phase+1)&3;
    FS_COUNT(eligible_shape_matches);
    return phase < fs_quota;
}
