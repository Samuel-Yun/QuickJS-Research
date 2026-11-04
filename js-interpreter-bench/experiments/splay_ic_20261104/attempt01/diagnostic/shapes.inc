/* Allocation generation, not strong references. add_gc_object is the allocation
 * hook for shape creation, cloning, resizing and compaction in this revision. */
typedef struct SPBirth { void *ptr; uint64_t id; struct SPBirth *next; } SPBirth;
static SPBirth *sp_births[4096];static uint64_t sp_next_shape;
static void sp_shape_birth(void *ptr) {
    unsigned h=((uintptr_t)ptr>>4)&4095;SPBirth *e=sp_births[h];
    for(;e;e=e->next)if(e->ptr==ptr){e->id=++sp_next_shape;return;}
    e=calloc(1,sizeof(*e));if(!e)abort();*e=(SPBirth){ptr,++sp_next_shape,sp_births[h]};sp_births[h]=e;
}
static void sp_receiver(JSContext *ctx,JSValueConst obj,JSAtom atom) {
    /* Bounded focused evidence is added only after Run-site counts choose PCs.
     * This initial phase counter build performs no extra property lookup. */
    (void)ctx;(void)obj;(void)atom;
}
static void sp_reason(const char *name) {
    if(!audit_active)return;
    const char *names[]={"own_miss","descriptor","special","unhashed","inherited","missing","primitive"};
    for(unsigned k=0;k<7;k++)if(!strcmp(name,names[k])){audit_active->reasons[k]++;return;}
    audit_active->reasons[7]++;
}
static JSValue sp_stage(JSContext *ctx,JSValueConst self,int argc,JSValueConst *argv) {
    int32_t n;if(argc!=1||JS_ToInt32(ctx,&n,argv[0])||n<0||n>5)return JS_ThrowTypeError(ctx,"stage");
    if(audit_active)abort();sp_phase=n;return JS_UNDEFINED;
}
void sp_install(JSContext *ctx) {
    JSValue g=JS_GetGlobalObject(ctx);
    if(JS_SetPropertyStr(ctx,g,"__spStage",JS_NewCFunction(ctx,sp_stage,"__spStage",1))<0)abort();
    JS_FreeValue(ctx,g);
}
void sp_destroy(void){sp_phase=5;}
