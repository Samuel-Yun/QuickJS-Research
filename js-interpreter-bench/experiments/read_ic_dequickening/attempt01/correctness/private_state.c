/* Standalone correctness translation unit, not a formal timing binary. */
#include "quickjs.c"
#include <stdio.h>
static unsigned assertions,scenarios;
#define CHECK(x) do{assertions++;if(!(x)){fprintf(stderr,"private state fail line=%d\n",__LINE__);return 1;}}while(0)
static JSValue evaluate(JSContext *ctx,const char *s,int flags){return JS_Eval(ctx,s,strlen(s),"private_state.js",flags);}
static int number(JSContext *ctx,JSValue v,int expected){int32_t n=-1;int bad=JS_IsException(v)||JS_ToInt32(ctx,&n,v)||n!=expected;JS_FreeValue(ctx,v);return !bad;}
static void scan(JSFunctionBytecode *b,int reset,unsigned *active,unsigned *exited){
    for(unsigned i=0;i<b->read_ic_count;i++){
        ReadICSite *s=&b->read_ic_sites[i];
        if(s->miss_streak==32)(*exited)++;else (*active)++;
        if(reset)assert(s->miss_streak==0 && s->shape==NULL);
    }
    for(int i=0;i<b->cpool_count;i++)if(JS_VALUE_GET_TAG(b->cpool[i])==JS_TAG_FUNCTION_BYTECODE)scan(JS_VALUE_GET_PTR(b->cpool[i]),reset,active,exited);
}
int main(void){
    JSRuntime *rt=JS_NewRuntime();JSContext *ctx=JS_NewContext(rt);CHECK(rt&&ctx);
    scenarios++;
    JSValue fn=evaluate(ctx,"(function privateOwn(o){return o.x;})",0);CHECK(!JS_IsException(fn));
    JSValue obj=JS_NewObject(ctx);CHECK(JS_SetPropertyStr(ctx,obj,"x",JS_NewInt32(ctx,3))>0);
    for(int i=0;i<4;i++)CHECK(number(ctx,JS_Call(ctx,fn,JS_UNDEFINED,1,&obj),3));
    JSFunctionBytecode *b=JS_VALUE_GET_OBJ(fn)->u.func.function_bytecode;CHECK(b->read_ic_count==1);
    ReadICSite *site=&b->read_ic_sites[0];CHECK(site->shape && site->miss_streak==0);
    uint8_t *ip=NULL;for(int pc=0,op;pc<b->byte_code_len;pc+=short_opcode_info(op).size){op=b->byte_code_buf[pc];if(op==OP_get_field_rdi){ip=b->byte_code_buf+pc;break;}}CHECK(ip);
    JSAtom atom=site->atom;JS_DupAtom(ctx,atom);int refs=js_rc(rt->atom_array[atom])->ref_count;
    site->miss_streak=32;CHECK(rdi_exit(ctx,b,0,ip));CHECK(*ip==OP_get_field && get_u32(ip+1)==atom && !site->shape);
    CHECK(js_rc(rt->atom_array[atom])->ref_count==refs+1);CHECK(!rdi_exit(ctx,b,0,ip));CHECK(js_rc(rt->atom_array[atom])->ref_count==refs+1);
    CHECK(JS_SetPropertyStr(ctx,obj,"x",JS_NewInt32(ctx,9))>0);CHECK(number(ctx,JS_Call(ctx,fn,JS_UNDEFINED,1,&obj),9));
    int before=js_rc(rt->atom_array[atom])->ref_count;JS_FreeValue(ctx,fn);CHECK(js_rc(rt->atom_array[atom])->ref_count==before-2);JS_FreeAtom(ctx,atom);
    scenarios++;
    fn=evaluate(ctx,"(function privateUnhashed(o){return o.x;})",0);CHECK(!JS_IsException(fn));
    JSObject *p=JS_VALUE_GET_OBJ(obj);CHECK(js_shape_prepare_update(ctx,p,NULL)==0);CHECK(!p->shape->is_hashed);
    for(int i=0;i<40;i++)CHECK(number(ctx,JS_Call(ctx,fn,JS_UNDEFINED,1,&obj),9));
    b=JS_VALUE_GET_OBJ(fn)->u.func.function_bytecode;CHECK(b->read_ic_count==1 && b->read_ic_sites[0].miss_streak==32 && !b->read_ic_sites[0].shape);JS_FreeValue(ctx,fn);JS_FreeValue(ctx,obj);
    scenarios++;
    const char *source="function pStable(o){return o.x;}function pExit(o){return o.x;}var po={x:3},pp=Object.create({x:4});for(var i=0;i<64;i++){if(pStable(po)!==3||pExit(pp)!==4)throw Error('wrong');}7;";
    JSValue compiled=evaluate(ctx,source,JS_EVAL_FLAG_COMPILE_ONLY);CHECK(!JS_IsException(compiled));CHECK(number(ctx,JS_EvalFunction(ctx,JS_DupValue(ctx,compiled)),7));
    unsigned active=0,exited=0;scan(JS_VALUE_GET_PTR(compiled),0,&active,&exited);CHECK(active>0 && exited>0);
    size_t size;uint8_t *buf=JS_WriteObject(ctx,&size,compiled,JS_WRITE_OBJ_BYTECODE);CHECK(buf&&size);
    for(int rom=0;rom<2;rom++){
        JSValue loaded=JS_ReadObject(ctx,buf,size,JS_READ_OBJ_BYTECODE|(rom?JS_READ_OBJ_ROM_DATA:0));CHECK(!JS_IsException(loaded));
        active=exited=0;scan(JS_VALUE_GET_PTR(loaded),1,&active,&exited);CHECK(active>0 && exited==0);CHECK(number(ctx,JS_EvalFunction(ctx,loaded),7));
    }
    js_free(ctx,buf);JS_FreeValue(ctx,compiled);JS_RunGC(rt);JS_FreeContext(ctx);JS_FreeRuntime(rt);
    printf("PRIVATE_STATE_PASS scenarios=%u assertions=%u idempotent_atom_refs_unhashed_mixed_ROM_reset\n",scenarios,assertions);return 0;
}
