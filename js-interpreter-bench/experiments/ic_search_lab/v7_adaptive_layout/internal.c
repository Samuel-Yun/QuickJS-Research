/* Independent mechanism binary. Never used for performance samples. */
#include "quickjs.c"
#include <stdio.h>

static void eval_ok(JSContext *ctx,const char *source) {
    JSValue v=JS_Eval(ctx,source,strlen(source),"v7-internal",JS_EVAL_TYPE_GLOBAL);
    if(JS_IsException(v)) {
        JSValue x=JS_GetException(ctx);const char *s=JS_ToCString(ctx,x);
        fprintf(stderr,"INTERNAL_EXCEPTION %s\n",s?s:"?");abort();
    }
    JS_FreeValue(ctx,v);
}
static JSValue get(JSContext *ctx,const char *name) {
    JSValue g=JS_GetGlobalObject(ctx),v=JS_GetPropertyStr(ctx,g,name);JS_FreeValue(ctx,g);return v;
}
static JSFunctionBytecode *body(JSContext *ctx) {
    JSValue f=get(ctx,"f");assert(JS_IsObject(f));
    JSFunctionBytecode *b=JS_VALUE_GET_OBJ(f)->u.func.function_bytecode;
    JS_FreeValue(ctx,f);return b;
}
int main(void) {
    JSRuntime *rt=JS_NewRuntime();JSContext *ctx=JS_NewContext(rt);assert(ctx);
    printf("LAYOUT object=%zu property=%zu site=%zu function=%zu\n",sizeof(JSObject),sizeof(JSProperty),sizeof(ReadICSite),sizeof(JSFunctionBytecode));
#ifdef V7_TEST_IO
    eval_ok(ctx,"var o={};o.x=7;function f(o){return o.x;}for(var i=0;i<20;i++)if(f(o)!==7)throw Error('read');");
    JSValue o=get(ctx,"o");JSObject *p=JS_VALUE_GET_OBJ(o);
    assert(p->v7_prop_inline && p->prop==(JSProperty *)(p+1));
    printf("INLINE actual_capacity=%u used=%u\n",p->shape->prop_size,p->shape->prop_count);
    eval_ok(ctx,"var twin={};twin.x=9;");JSValue twin=get(ctx,"twin");
    JSObject *other=JS_VALUE_GET_OBJ(twin);assert(other->shape==p->shape);
    assert(v7_resize_prop(ctx,other,V7_INLINE_CAP+1));
    assert(!other->v7_prop_inline && other->shape==p->shape);
    eval_ok(ctx,"if(f(twin)!==9||f(o)!==7)throw Error('same shape different storage');twin.x=11;if(f(twin)!==11)throw Error('new value');");
    puts("SAME_SHAPE_DIFFERENT_STORAGE_PASS");JS_FreeValue(ctx,twin);
    eval_ok(ctx,"for(var i=0;i<24;i++)o['p'+i]=i;if(o.x!==7||o.p23!==23)throw Error('spill');");
    assert(!p->v7_prop_inline && p->v7_has_inline_tail);
    printf("SPILL actual_capacity=%u used=%u\n",p->shape->prop_size,p->shape->prop_count);
    JS_FreeValue(ctx,o);
#endif
#ifdef V7_TEST_AQ
    eval_ok(ctx,"function f(o){return o.x;}var a={x:1},b={pad:0,x:2};for(var i=0;i<7;i++)f(a);");
    JSFunctionBytecode *b=body(ctx);assert(b->read_ic_count==1);ReadICSite *s=b->read_ic_sites;
#define AQ_LOG() do { \
    uint8_t op=b->byte_code_buf[s->pc_offset]; \
    assert(op==(s->state==AQ_MONO?OP_get_field_rdi:(s->state==AQ_EXIT?OP_get_field:OP_get_field_aq))); \
    printf("AQ state=%u observed=%u misses=%u retried=%u cooldown_entries=%u opcode=%u\n",s->state,s->observed,s->misses,s->retried,b->aq_entries,op); \
} while(0)
    assert(s->state==AQ_OBSERVE && s->observed==7);AQ_LOG();
    eval_ok(ctx,"f(a);");assert(s->state==AQ_MONO);AQ_LOG();
    eval_ok(ctx,"f(b);f(a);f(b);f(a);");assert(s->state==AQ_EXIT);AQ_LOG();
    eval_ok(ctx,"for(var i=0;i<31;i++)f(a);");assert(s->state==AQ_EXIT);AQ_LOG();
    eval_ok(ctx,"f(a);");assert(s->state==AQ_OBSERVE && s->observed==1 && s->retried==1);AQ_LOG();
    eval_ok(ctx,"for(var i=0;i<7;i++)f(a);");assert(s->state==AQ_MONO);AQ_LOG();
    eval_ok(ctx,"f(b);f(a);f(b);f(a);for(var i=0;i<80;i++)f(a);");assert(s->state==AQ_EXIT && s->retried);AQ_LOG();
#endif
#ifdef V7_TEST_AP
    eval_ok(ctx,"function f(o){return o.x;}var a=[];for(var i=0;i<8;i++){var o={};for(var j=0;j<i;j++)o['p'+j]=j;o.x=i;a.push(o);}f(a[0]);");
    JSFunctionBytecode *b=body(ctx);assert(b->read_ic_count==1);ReadICSite *s=b->read_ic_sites;
    assert(sizeof(ReadICSite)==16 && s->shape && !(s->prop_offset&AP_POLY_FLAG));
    uint8_t *site_op=NULL;
    for(int pos=0;pos<b->byte_code_len;pos+=short_opcode_info(b->byte_code_buf[pos]).size)
        if(b->byte_code_buf[pos]==OP_get_field_rdi) site_op=b->byte_code_buf+pos;
    assert(site_op);
    printf("AP mono\n");
    for(unsigned i=1;i<4;i++) {
        const char *calls[]={"f(a[1]);","f(a[2]);","f(a[3]);"};eval_ok(ctx,calls[i-1]);
        assert(s->prop_offset&AP_POLY_FLAG);APTable *t=(APTable *)s->shape;
        assert(*site_op==OP_get_field_ap);
        assert(t->count==i+1 && t->capacity==(i==1?2:4));
        printf("AP count=%u capacity=%u requested_bytes=%zu\n",t->count,t->capacity,sizeof(*t)+t->capacity*sizeof(APEntry));
    }
    eval_ok(ctx,"f(a[4]);for(var i=0;i<80;i++)if(f(a[i%8])!==i%8)throw Error('value');");
    assert(!s->shape && !(s->prop_offset&AP_POLY_FLAG) && *site_op==OP_get_field);printf("AP fifth-shape exit opcode=%u\n",*site_op);
#endif
#ifdef V7_TEST_ST
    eval_ok(ctx,"function f(o,x){o.x=x;return o;}var a=Object.create(null);f(a,7);");
    JSFunctionBytecode *b=body(ctx);assert(b->st_count==1);STSite *s=b->st_sites;
    assert(s->old_shape && s->new_shape && s->new_shape->prop_count==s->old_shape->prop_count+1);
    eval_ok(ctx,"var c=Object.create(null);");JSValue c=get(ctx,"c");
    assert(JS_VALUE_GET_OBJ(c)->shape==s->old_shape);
    assert(st_ordinary(JS_VALUE_GET_OBJ(c)) && st_guards(JS_VALUE_GET_OBJ(c),s));
    int st_opcodes=0;
    for(int pos=0;pos<b->byte_code_len;pos+=short_opcode_info(b->byte_code_buf[pos]).size)
        st_opcodes+=(b->byte_code_buf[pos]==OP_put_field_st);
    assert(st_opcodes==1);
    eval_ok(ctx,"f(c,12);if(c.x!==12)throw Error('transition');");
    assert(JS_VALUE_GET_OBJ(c)->shape==s->new_shape);
    printf("ST repeated-construction transition confirmed site=%zu offset=%u depth=%u\n",sizeof(STSite),s->offset,s->depth);
    JS_FreeValue(ctx,c);
#endif
    JS_RunGC(rt);JS_FreeContext(ctx);JS_FreeRuntime(rt);
    puts("V7_INTERNAL_PASS");return 0;
}
