/* DIAGNOSTIC ONLY: whole-process invocation counts, never instruction time. */
static uint64_t wb_ops[256], wb_array_fast, wb_array_slow;
static int wb_enabled = -1;
static const char *wb_names[256] = {
#define DEF(id, size, n_pop, n_push, f) [OP_ ## id] = #id,
#define def(id, size, n_pop, n_push, f)
#include "quickjs-opcode.h"
#undef DEF
#undef def
};
static void wb_dump_counts(void) {
    unsigned i;
    for (i=0;i<256;i++) if(wb_ops[i])
        fprintf(stderr,"WB_OPCODE %u %s %llu\n",i,wb_names[i]?wb_names[i]:"unknown",(unsigned long long)wb_ops[i]);
    fprintf(stderr,"WB_ARRAY fast=%llu slow=%llu\n",(unsigned long long)wb_array_fast,(unsigned long long)wb_array_slow);
}
static int wb_count(int opcode) {
    if(wb_enabled<0) {
        wb_enabled=getenv("WB_COUNT")!=NULL;
        if(wb_enabled)atexit(wb_dump_counts);
    }
    if(wb_enabled) wb_ops[opcode]++;
    return opcode;
}
