/* Inspection of already resolved callees only. Copies no JS references. */
typedef struct FourCallProbe {unsigned owner,target,pc,kind;FourDiag *diag;struct FourCallProbe *next;} FourCallProbe;
static FourCallProbe *four_call_buckets[65536];
static unsigned four_identity;
static void four_observe_call(JSContext*ctx,JSFunctionBytecode*b,const uint8_t*pc,JSValueConst callee,int kind)
{
    if(!four_active || JS_VALUE_GET_TAG(callee)!=JS_TAG_OBJECT)return;
    JSObject*o=JS_VALUE_GET_OBJ(callee);
    if(o->class_id!=JS_CLASS_BYTECODE_FUNCTION && o->class_id!=JS_CLASS_COLD_BYTECODE_FUNCTION)return;
    JSFunctionBytecode*t=o->u.func.function_bytecode;
    if(t->func_kind!=JS_FUNC_NORMAL || t->byte_code_len>128)return;
    if(!b->four_count)b->four_count=++four_identity;
    if(!t->four_count)t->four_count=++four_identity;
    unsigned pos=pc-b->byte_code_buf,key=(b->four_count*7159u+pos*131u+t->four_count*17u+kind)&65535;
    FourCallProbe *s;
    for(s=four_call_buckets[key];s;s=s->next)if(s->owner==b->four_count && s->target==t->four_count && s->pc==pos && s->kind==(unsigned)kind)break;
    if(!s){
        s=calloc(1,sizeof(*s));assert(s);s->owner=b->four_count;s->target=t->four_count;s->pc=pos;s->kind=kind;
        s->diag=four_dnew(ctx,b,pos);
        const char*n=JS_AtomToCString(ctx,t->func_name);assert(n);s->diag->target=strdup(n);JS_FreeCString(ctx,n);
        memset(s->diag->bytes,0,sizeof(s->diag->bytes));
        for(int i=0;i<t->byte_code_len;i++)snprintf(s->diag->bytes+2*i,3,"%02x",t->byte_code_buf[i]);
        s->next=four_call_buckets[key];four_call_buckets[key]=s;
    }
    s->diag->q++;s->diag->guard++;if(kind)s->diag->eligible++;
}
