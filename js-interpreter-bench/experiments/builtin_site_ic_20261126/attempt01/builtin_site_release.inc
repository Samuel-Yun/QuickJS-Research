/* Only this builtin's native slow entry can learn. The ordinary method-call
 * handler is untouched. All records live as long as their owning bytecode. */
static JSValue js_string_charCodeAt(JSContext*,JSValueConst,int,JSValueConst*);
#ifdef BIC_SITE
typedef struct BuiltinSite {
    JSValue callee;
    uint32_t pc;
    uint8_t observations, misses, state, action;
} BuiltinSite;
struct BuiltinTable { BuiltinSite **sites;uint32_t count,capacity; };
enum { BIC_OBSERVING, BIC_INSTALLED, BIC_DISABLED };
enum { BIC_CHARCODE=1 };
#endif
/* Basic caller/window checks precede decoding. In particular a bound function
 * can dispatch without a C frame of its own, so prev_frame alone is NOT proof. */
static int bic_caller(JSContext*ctx,JSValueConst receiver,int argc,JSValueConst*argv,
                      JSFunctionBytecode**out,uint32_t*off,JSValue*callee,int*op){
    JSStackFrame*c=ctx->rt->current_stack_frame,*s;JSObject*f,*native;
    if(!c||argc!=1||c->arg_count!=1||c->arg_buf!=argv||JS_VALUE_GET_TAG(c->cur_func)!=JS_TAG_OBJECT)return 0;
    native=JS_VALUE_GET_OBJ(c->cur_func);
    if(native->class_id!=JS_CLASS_C_FUNCTION||native->u.cfunc.realm!=ctx||native->u.cfunc.cproto!=JS_CFUNC_generic||native->u.cfunc.c_function.generic!=js_string_charCodeAt)return 0;
    s=c->prev_frame;if(!s||JS_VALUE_GET_TAG(s->cur_func)!=JS_TAG_OBJECT)return 0;
    f=JS_VALUE_GET_OBJ(s->cur_func);if(f->class_id!=JS_CLASS_BYTECODE_FUNCTION)return 0;
    JSFunctionBytecode*b=f->u.func.function_bytecode;
    if(b->realm!=ctx||!b->read_ic_ready||!b->read_ic_sites||!s->cur_pc)return 0;
    uintptr_t start=(uintptr_t)(s->var_buf+b->var_count),arg=(uintptr_t)argv;
    if(arg<start+2*sizeof(JSValue)||arg>=start+(size_t)b->stack_size*sizeof(JSValue)||(arg-start)%sizeof(JSValue))return 0;
    if(JS_VALUE_GET_TAG(argv[-1])!=JS_TAG_OBJECT||JS_VALUE_GET_OBJ(argv[-1])!=native||JS_VALUE_GET_TAG(argv[-2])!=JS_TAG_STRING||JS_VALUE_GET_STRING(argv[-2])!=JS_VALUE_GET_STRING(receiver))return 0;
    uintptr_t end=(uintptr_t)s->cur_pc,base=(uintptr_t)b->byte_code_buf;
    if(end<base+3||end>base+(size_t)b->byte_code_len)return 0;
    *off=(uint32_t)(end-base-3);*op=b->byte_code_buf[*off];
    if(*op==OP_call_method){if(get_u16(b->byte_code_buf+*off+1)!=1)return 0;}
#ifdef BIC_SITE
    else if(*op==OP_builtin_method1){
        unsigned n=get_u16(b->byte_code_buf+*off+1);
        if(!b->builtin_sites||n>=b->builtin_sites->count||b->builtin_sites->sites[n]->pc!=*off)return 0;
    }
#endif
    else return 0;
    *out=b;*callee=c->cur_func;return 1;
}
static int bic_boundary(JSFunctionBytecode*,uint32_t);
#ifdef BIC_DIAG
#pragma push_macro("free")
#undef free
typedef struct BicDiag {struct BicDiag*next;JSFunctionBytecode*owner;uint32_t pc;int line,col;char function[96],file[256];uint64_t c[16];} BicDiag;
static BicDiag*bic_diags;static uint64_t bic_global[16];
static int find_line_num(JSContext*,JSFunctionBytecode*,uint32_t,int*);
static BicDiag*bic_diag(JSContext*ctx,JSFunctionBytecode*b,uint32_t pc){
    if(!four_active)return NULL;
    for(BicDiag*d=bic_diags;d;d=d->next)if(d->owner==b&&d->pc==pc)return d;
    if(!bic_boundary(b,pc))return NULL;
    BicDiag*d=calloc(1,sizeof(*d));assert(d);d->owner=b;d->pc=pc;d->line=find_line_num(ctx,b,pc,&d->col);
    char tmp[256];snprintf(d->function,sizeof(d->function),"%s",JS_AtomGetStr(ctx,tmp,sizeof(tmp),b->func_name));
    if(b->has_debug)snprintf(d->file,sizeof(d->file),"%s",JS_AtomGetStr(ctx,tmp,sizeof(tmp),b->debug.filename));
    d->next=bic_diags;bic_diags=d;return d;
}
#define BIC_G(k) do{if(four_active)bic_global[k]++;}while(0)
#define BIC_C(ctx,b,pc,k) do{BicDiag*bd=bic_diag(ctx,b,pc);if(bd)bd->c[k]++;}while(0)
static void bic_diag_retire(JSFunctionBytecode*b){for(BicDiag*d=bic_diags;d;d=d->next)if(d->owner==b)d->owner=NULL;}
static void bic_report(void){
    fprintf(stderr,"BIC_COUNTS:{\"global\":[");for(unsigned n=0;n<16;n++)fprintf(stderr,"%s%"PRIu64,n?",":"",bic_global[n]);fprintf(stderr,"],\"sites\":[");unsigned n=0;
    for(BicDiag*d=bic_diags;d;d=d->next){fprintf(stderr,"%s{\"function\":",n++?",":"");four_json_string(d->function);fprintf(stderr,",\"file\":");four_json_string(d->file);fprintf(stderr,",\"line\":%d,\"pc\":%u,\"c\":[",d->line,d->pc);for(unsigned i=0;i<16;i++)fprintf(stderr,"%s%"PRIu64,i?",":"",d->c[i]);fprintf(stderr,"]}");}fprintf(stderr,"]}\n");
}
#pragma pop_macro("free")
#else
#define BIC_G(k) ((void)0)
#define BIC_C(ctx,b,pc,k) ((void)0)
#define bic_diag_retire(b) ((void)0)
#endif
#ifdef BIC_SITE
static void bic_mark(JSRuntime*rt,BuiltinTable*t,JS_MarkFunc*mark){if(t)for(unsigned n=0;n<t->count;n++)JS_MarkValue(rt,t->sites[n]->callee,mark);}
static void bic_free(JSRuntime*rt,BuiltinTable*t){if(!t)return;for(unsigned n=0;n<t->count;n++){JS_FreeValueRT(rt,t->sites[n]->callee);js_free_rt(rt,t->sites[n]);}js_free_rt(rt,t->sites);js_free_rt(rt,t);}
static BuiltinSite*bic_find(BuiltinTable*t,uint32_t pc,unsigned*index){if(t)for(unsigned i=0;i<t->count;i++)if(t->sites[i]->pc==pc){*index=i;return t->sites[i];}return NULL;}
static BuiltinSite*bic_new(JSContext*ctx,JSFunctionBytecode*b,uint32_t pc,JSValue callee,unsigned*index){
    BuiltinTable*t=b->builtin_sites;
    if(!t){t=js_mallocz_rt(ctx->rt,sizeof(*t));if(!t)return NULL;b->builtin_sites=t;BIC_G(8);}
    if(t->count==65536)return NULL;
    if(t->count==t->capacity){unsigned cap=t->capacity?t->capacity*2:4;BuiltinSite**p=js_realloc_rt(ctx->rt,t->sites,cap*sizeof(*p));if(!p)return NULL;t->sites=p;t->capacity=cap;BIC_G(9);}
    BuiltinSite*s=js_mallocz_rt(ctx->rt,sizeof(*s));if(!s)return NULL;s->callee=JS_DupValue(ctx,callee);s->pc=pc;s->action=BIC_CHARCODE;
    *index=t->count;t->sites[t->count++]=s;BIC_C(ctx,b,pc,7);return s;
}
/* None of these functions runs a user getter or re-reads a method property. */
static void bic_learn(JSContext*ctx,JSValueConst receiver,int argc,JSValueConst*argv){
    JSFunctionBytecode*b;uint32_t off;JSValue callee;int op;unsigned n;
    if(!bic_caller(ctx,receiver,argc,argv,&b,&off,&callee,&op)){BIC_G(5);return;}
    if(op==OP_builtin_method1){BIC_C(ctx,b,off,8);return;}
    BIC_C(ctx,b,off,0);
    BuiltinSite*s=bic_find(b->builtin_sites,off,&n);
    if(!s){if(!bic_boundary(b,off))return;s=bic_new(ctx,b,off,callee,&n);if(!s){BIC_G(10);return;}}
    if(s->state!=BIC_OBSERVING)return;
    if(JS_VALUE_GET_OBJ(s->callee)!=JS_VALUE_GET_OBJ(callee)){s->state=BIC_DISABLED;BIC_C(ctx,b,off,6);return;}
    BIC_C(ctx,b,off,1);
    if(++s->observations<8)return;
    /* Patch only the already-private execution image. Keep the record alive
       across GC/reentry. Operand first, opcode last; all instruction sizes stay. */
    if(b->byte_code_buf[off]!=OP_call_method||get_u16(b->byte_code_buf+off+1)!=1)return;
    s->state=BIC_INSTALLED;put_u16(b->byte_code_buf+off+1,n);b->byte_code_buf[off]=OP_builtin_method1;BIC_C(ctx,b,off,2);
}
static void bic_miss(JSContext*ctx,JSFunctionBytecode*b,BuiltinSite*s){
    BIC_C(ctx,b,s->pc,5);
    if(s->state==BIC_INSTALLED&&++s->misses>=8){
        s->state=BIC_DISABLED;put_u16(b->byte_code_buf+s->pc+1,1);b->byte_code_buf[s->pc]=OP_call_method;BIC_C(ctx,b,s->pc,6);
    }
}
#else
static void bic_learn(JSContext*ctx,JSValueConst receiver,int argc,JSValueConst*argv){
#ifdef BIC_DIAG
    JSFunctionBytecode*b;uint32_t off;JSValue callee;int op;
    if(bic_caller(ctx,receiver,argc,argv,&b,&off,&callee,&op))BIC_C(ctx,b,off,0);else BIC_G(5);
#endif
}
#endif
