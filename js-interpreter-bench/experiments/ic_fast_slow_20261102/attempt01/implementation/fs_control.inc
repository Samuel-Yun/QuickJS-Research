/* Public experimental controller; policy parsed once, outside workload. */
#include "fs_selectors_all.inc"
static void fs_register(JSContext *ctx, JSFunctionBytecode *b)
{
    const char *source=NULL; unsigned pc=0;
    if (!fs_target_kind || !b->has_debug || !b->debug.source) return;
    if (fs_target_kind==1) {source=fs_source_1;pc=13;}
    if (fs_target_kind==2) {source=fs_source_2;pc=12;}
    if (fs_target_kind==3) {source=fs_source_3;pc=1;}
    if (!source || b->debug.source_len != strlen(source) || memcmp(b->debug.source,source,b->debug.source_len)) return;
    if (pc+5 > b->byte_code_len || b->byte_code_buf[pc]!=OP_get_field_rdi) return;
    unsigned index=get_u32(b->byte_code_buf+pc+1);
    if (index>=b->read_ic_count) return;
    const char *atom=JS_AtomToCString(ctx,b->read_ic_sites[index].atom);
    int match=atom && !strcmp(atom,"x");JS_FreeCString(ctx,atom);
    if (!match) return;
    fs_matched++;fs_target_site=&b->read_ic_sites[index];fs_target_bytecode=b;
}
static JSValue fs_begin_api(JSContext *ctx, JSValueConst this_val, int argc, JSValueConst *argv)
{
    if (fs_in_region || fs_matched!=(fs_target_kind ? 1:0) ||
       (fs_target_kind && (!fs_target_site || !fs_target_site->shape)))
        return JS_ThrowTypeError(ctx,"control target not uniquely prepared");
    fs_phase=0;fs_scope=0;
#ifdef FS_DIAGNOSTIC
    memset(&fs_counts,0,sizeof(fs_counts));
#endif
    fs_in_region=1;return JS_UNDEFINED;
}
static JSValue fs_end_api(JSContext *ctx, JSValueConst this_val, int argc, JSValueConst *argv)
{
    if (!fs_in_region) return JS_ThrowTypeError(ctx,"control region not started");
    fs_in_region=0;fs_scope=0;
#ifdef FS_DIAGNOSTIC
    fprintf(stderr,"FS_COUNTS:{");
#define FS_PRINT(f) fprintf(stderr,"\"" #f "\":%" PRIu64 ",",fs_counts.f)
    FS_PRINT(total_target_reads);FS_PRINT(eligible_shape_matches);FS_PRINT(offset_reads);
    FS_PRINT(forced_normal_lookups);FS_PRINT(true_shape_misses);
    FS_PRINT(actual_find_own_property_entries);FS_PRINT(bucket_reads);FS_PRINT(chain_matches);
    FS_PRINT(cache_updates);FS_PRINT(shape_retains);FS_PRINT(shape_releases);
#undef FS_PRINT
    fprintf(stderr,"\"scope\":\"explicit region + selected source/instance/PC\",\"quota\":%u,\"matched_instances\":%u}\n",fs_quota,fs_matched);
#endif
    return JS_UNDEFINED;
}
int JS_FSInstall(JSContext *ctx)
{
    const char *q=getenv("QJS_FS_QUOTA"),*t=getenv("QJS_FS_TARGET");
    if (!q || strlen(q)!=1 || q[0]<'0' || q[0]>'4' || !t || strlen(t)!=1 || t[0]<'0' || t[0]>'3') {
        fprintf(stderr,"invalid/missing QJS_FS_QUOTA or QJS_FS_TARGET\n");return -1;
    }
    fs_quota=q[0]-'0';fs_target_kind=t[0]-'0';
    JSValue global=JS_GetGlobalObject(ctx);
    int bad=JS_SetPropertyStr(ctx,global,"__icFsBegin",JS_NewCFunction(ctx,fs_begin_api,"__icFsBegin",0))<0;
    bad|=JS_SetPropertyStr(ctx,global,"__icFsEnd",JS_NewCFunction(ctx,fs_end_api,"__icFsEnd",0))<0;
    JS_FreeValue(ctx,global);return bad ? -1:0;
}
