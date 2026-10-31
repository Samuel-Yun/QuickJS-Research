/* Independent E-only test translation unit; never a performance runtime. */
#include "quickjs.c"
static unsigned checks,scenes;
#define CHECK(x) do { checks++;if(!(x)){fprintf(stderr,"EIC_INTERNAL_FAIL line=%d\n",__LINE__);return 1;} } while(0)
static int result(JSContext *ctx,JSValue v,int expected) {
    int32_t n=-1;int ok=!JS_IsException(v)&&!JS_ToInt32(ctx,&n,v)&&n==expected;
    if(!ok&&JS_IsException(v)){JSValue e=JS_GetException(ctx);const char *s=JS_ToCString(ctx,e);fprintf(stderr,"exception:%s\n",s);JS_FreeCString(ctx,s);JS_FreeValue(ctx,e);}
    JS_FreeValue(ctx,v);return ok;
}
static JSValue fn(JSContext *ctx,const char *s){return JS_Eval(ctx,s,strlen(s),"internal.js",JS_EVAL_TYPE_GLOBAL);}
static JSFunctionBytecode *code(JSValue v){return JS_VALUE_GET_OBJ(v)->u.func.function_bytecode;}
int main(void){
    JSRuntime *rt=JS_NewRuntime();JSContext *ctx=JS_NewContext(rt);CHECK(rt&&ctx);
    scenes++;JSValue f=fn(ctx,"(function cold(o){return o.x;})"),o=JS_NewObject(ctx);
    CHECK(!JS_IsException(f));CHECK(JS_SetPropertyStr(ctx,o,"x",JS_NewInt32(ctx,3))>0);
    JSFunctionBytecode *b=code(f);CHECK(b->eic_count==1&&b->eic_meta&&!b->eic_sites);
    for(int i=0;i<7;i++)CHECK(result(ctx,JS_Call(ctx,f,JS_UNDEFINED,1,&o),3));
    CHECK(!b->eic_sites);CHECK(result(ctx,JS_Call(ctx,f,JS_UNDEFINED,1,&o),3));
    CHECK(b->eic_sites&&b->eic_sites[0].state==EIC_MONOMORPHIC&&b->eic_sites[0].count==1);
    CHECK(JS_SetPropertyStr(ctx,o,"x",JS_NewInt32(ctx,9))>0);CHECK(result(ctx,JS_Call(ctx,f,JS_UNDEFINED,1,&o),9));
    JS_FreeValue(ctx,f);JS_FreeValue(ctx,o);
    for(int n=1;n<=8;n+=(n<4?n:1)){
        scenes++;f=fn(ctx,"(function state(o){return o.x;})");JSValue objects[8];
        for(int i=0;i<n;i++){char name[32];snprintf(name,sizeof(name),"tag%d",i);objects[i]=JS_NewObject(ctx);CHECK(JS_SetPropertyStr(ctx,objects[i],name,JS_NewInt32(ctx,i))>0);CHECK(JS_SetPropertyStr(ctx,objects[i],"x",JS_NewInt32(ctx,10+i))>0);}
        for(int i=0;i<160;i++)CHECK(result(ctx,JS_Call(ctx,f,JS_UNDEFINED,1,&objects[i%n]),10+i%n));
        b=code(f);EICSite *s=&b->eic_sites[0];
        if(n<=4)CHECK(s->count==n&&s->state==(n==1?EIC_MONOMORPHIC:EIC_POLYMORPHIC));
        else CHECK(s->state==EIC_GENERIC&&s->count==0&&!s->mono.shape&&!s->poly);
        printf("EIC_STATE shapes=%d state=%d occupancy=%d\n",n,s->state,s->count);
        JS_FreeValue(ctx,f);for(int i=0;i<n;i++)JS_FreeValue(ctx,objects[i]);
    }
    scenes++;f=fn(ctx,"(function two(a,b){return a.x+b.x;})");JSValue args[2]={JS_NewObject(ctx),JS_NewObject(ctx)};
    CHECK(JS_SetPropertyStr(ctx,args[0],"x",JS_NewInt32(ctx,2))>0);CHECK(JS_SetPropertyStr(ctx,args[1],"extra",JS_NewInt32(ctx,0))>0);CHECK(JS_SetPropertyStr(ctx,args[1],"x",JS_NewInt32(ctx,5))>0);
    for(int i=0;i<32;i++)CHECK(result(ctx,JS_Call(ctx,f,JS_UNDEFINED,2,args),7));
    b=code(f);CHECK(b->eic_count==2&&b->eic_meta[0].atom==b->eic_meta[1].atom&&b->eic_meta[0].pc!=b->eic_meta[1].pc);
    CHECK(b->eic_sites[0].mono.shape!=b->eic_sites[1].mono.shape);
    JS_FreeValue(ctx,args[0]);JS_FreeValue(ctx,args[1]);JS_FreeValue(ctx,f);
    scenes++;JSValue p=JS_NewObject(ctx),mid=JS_NewObjectProto(ctx,p),leaf=JS_NewObjectProto(ctx,mid);
    CHECK(JS_SetPropertyStr(ctx,p,"x",JS_NewInt32(ctx,6))>0);f=fn(ctx,"(function proto(o){return o.x;})");
    for(int i=0;i<32;i++)CHECK(result(ctx,JS_Call(ctx,f,JS_UNDEFINED,1,&leaf),6));
    b=code(f);CHECK(b->eic_sites[0].mono.chain&&b->eic_sites[0].mono.chain->depth==2);
    CHECK(JS_SetPropertyStr(ctx,p,"x",JS_NewInt32(ctx,8))>0);CHECK(result(ctx,JS_Call(ctx,f,JS_UNDEFINED,1,&leaf),8));
    CHECK(JS_SetPropertyStr(ctx,mid,"x",JS_NewInt32(ctx,10))>0);CHECK(result(ctx,JS_Call(ctx,f,JS_UNDEFINED,1,&leaf),10));
    JSAtom x=JS_NewAtom(ctx,"x");CHECK(JS_DeleteProperty(ctx,mid,x,JS_PROP_THROW)>0);CHECK(result(ctx,JS_Call(ctx,f,JS_UNDEFINED,1,&leaf),8));
    JSValue p2=JS_NewObject(ctx);CHECK(JS_SetPropertyStr(ctx,p2,"x",JS_NewInt32(ctx,12))>0);CHECK(JS_SetPrototype(ctx,mid,p2)>=0);CHECK(result(ctx,JS_Call(ctx,f,JS_UNDEFINED,1,&leaf),12));
    JS_FreeAtom(ctx,x);JS_FreeValue(ctx,leaf);JS_FreeValue(ctx,mid);JS_FreeValue(ctx,p);JS_FreeValue(ctx,p2);JS_FreeValue(ctx,f);
    scenes++;o=JS_NewObject(ctx);CHECK(JS_SetPropertyStr(ctx,o,"x",JS_NewInt32(ctx,4))>0);
    CHECK(js_shape_prepare_update(ctx,JS_VALUE_GET_OBJ(o),NULL)==0);CHECK(!JS_VALUE_GET_OBJ(o)->shape->is_hashed);
    f=fn(ctx,"(function unhashed(o){return o.x;})");for(int i=0;i<40;i++)CHECK(result(ctx,JS_Call(ctx,f,JS_UNDEFINED,1,&o),4));
    b=code(f);CHECK(b->eic_sites[0].state==EIC_GENERIC&&b->eic_sites[0].count==0);JS_FreeValue(ctx,o);JS_FreeValue(ctx,f);
    /* Small allocations may reuse an existing arena despite a newly reduced
     * system-allocator limit. Force a LARGE feedback vector in this test. */
    scenes++;char source[8192];strcpy(source,"(function failAllocation(o){return 0");
    for(int i=0;i<512;i++)strcat(source,"+o.x");strcat(source,";})");
    f=fn(ctx,source);CHECK(!JS_IsException(f));CHECK(code(f)->eic_count==512);
    code(f)->eic_heat=7; /* internal test sets exactly the allocation boundary */
    o=JS_NewObject(ctx);CHECK(JS_SetPropertyStr(ctx,o,"x",JS_NewInt32(ctx,14))>0);
    JS_SetMemoryLimit(rt,1);CHECK(result(ctx,JS_Call(ctx,f,JS_UNDEFINED,1,&o),7168));JS_SetMemoryLimit(rt,(size_t)-1);
    CHECK(code(f)->eic_sites==NULL&&code(f)->eic_heat==255);JS_FreeValue(ctx,o);JS_FreeValue(ctx,f);
    JS_RunGC(rt);JS_FreeContext(ctx);JS_FreeRuntime(rt);
#ifdef EIC_DIAGNOSTIC
    CHECK(eic_stats.live_bytes==0);CHECK(eic_stats.shape_refs==eic_stats.shape_frees);CHECK(eic_stats.queries==eic_stats.hits+eic_stats.fallback);
    JS_EICDumpStats();
#endif
    printf("EIC_INTERNAL_PASS scenes=%u assertions=%u sizeof_meta=%zu sizeof_site=%zu sizeof_entry=%zu sizeof_chain=%zu\n",scenes,checks,sizeof(EICMeta),sizeof(EICSite),sizeof(EICEntry),sizeof(EICChain));return 0;
}
