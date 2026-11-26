/* Test-only internal inspection. Never linked into benchmark qjs. */
#include "quickjs.c"
static const char *const st_opcode_names[] = {
#define DEF(id,size,pop,push,fmt) #id,
#include "quickjs-opcode.h"
};
_Static_assert(countof(st_opcode_names)==countof(opcode_info),"opcode name count");
static void check_value(JSContext *ctx, JSValue v, int expected) {
 int32_t n;assert(!JS_IsException(v));assert(!JS_ToInt32(ctx,&n,v)&&n==expected);JS_FreeValue(ctx,v);
}
static JSValue fn(JSContext *ctx) {
 const char *s="(function writeX(o,x){o.x=x;return o.x;})";
 JSValue f=JS_Eval(ctx,s,strlen(s),"fixture.js",JS_EVAL_TYPE_GLOBAL);assert(!JS_IsException(f));return f;
}
static void invoke(JSContext *ctx,JSValue f,JSValue o,int x) {
 JSValue a[2]={o,JS_NewInt32(ctx,x)};check_value(ctx,JS_Call(ctx,f,JS_UNDEFINED,2,a),x);
}
static void snapshot(JSContext *ctx,JSValue f,const char *tag) {
 JSFunctionBytecode *b=JS_VALUE_GET_OBJ(f)->u.func.function_bytecode;
 printf("BYTECODE %s bytes=%d\n",tag,b->byte_code_len);
 for(int pc=0,op;pc<b->byte_code_len;pc+=short_opcode_info(op).size) {
  op=b->byte_code_buf[pc];int index=op;
#if SHORT_OPCODES
  if(index>=OP_TEMP_START)index+=OP_TEMP_END-OP_TEMP_START;
#endif
  printf("%d %s",pc,st_opcode_names[index]);
  if(op==OP_put_field){char buf[64];printf(" %s",JS_AtomGetStr(ctx,buf,sizeof(buf),get_u32(b->byte_code_buf+pc+1)));}
#if STORE_TRANSITION_ENABLED
  if(op==OP_put_field_sti){uint32_t i=get_u32(b->byte_code_buf+pc+1);StoreSite*s=&b->store_sites[i];char buf[64];printf(" site=%u atom=%s",i,JS_AtomGetStr(ctx,buf,sizeof(buf),s->atom));if(s->from)printf(" from_count=%u to_count=%u capacity=%u offset=%u depth=%u",s->from->prop_count,s->to->prop_count,s->from->prop_size,s->offset,s->depth);}
#endif
  puts("");
 }
}
static JSContext *callback_ctx;static JSValue callback_f,callback_receiver;static int callbacks;
static void finalizer(JSRuntime *rt,JSValue v) {
 callbacks++;
 check_value(callback_ctx,JS_GetPropertyStr(callback_ctx,callback_receiver,"x"),37);
 invoke(callback_ctx,callback_f,callback_receiver,41);
}
int main(void) {
 JSRuntime *rt=JS_NewRuntime();JSContext *ctx=JS_NewContext(rt);assert(ctx);
 printf("LAYOUT runtime=%zu function=%zu shape=%zu\n",sizeof(JSRuntime),sizeof(JSFunctionBytecode),sizeof(JSShape));
 JSValue f=fn(ctx),proto=JS_NewObjectProto(ctx,JS_NULL),keeper=JS_NewObjectProto(ctx,proto);
 for(int i=0;i<30;i++){JSValue o=JS_NewObjectProto(ctx,proto);invoke(ctx,f,o,i);JS_FreeValue(ctx,o);}
 snapshot(ctx,f,"learned");
#if STORE_TRANSITION_ENABLED
 JSFunctionBytecode *b=JS_VALUE_GET_OBJ(f)->u.func.function_bytecode;assert(b->store_count==1);
 StoreSite *site=&b->store_sites[0];assert(site->from&&site->to&&site->depth==1);
 assert(site->from->proto==JS_VALUE_GET_OBJ(proto)&&site->to->proto==JS_VALUE_GET_OBJ(proto));
 assert(site->offset==0&&site->from->prop_size==site->to->prop_size);
 assert(JS_VALUE_GET_OBJ(proto)->shape==site->chain[0]);
 // Mutation really uses COW; the old recorded layout must remain unchanged.
 JSShape *old_proto_shape=site->chain[0];
 assert(JS_SetPropertyStr(ctx,proto,"unrelated",JS_NewInt32(ctx,1))>=0);
 assert(JS_VALUE_GET_OBJ(proto)->shape!=old_proto_shape);
 JSValue fallback=JS_NewObjectProto(ctx,proto);invoke(ctx,f,fallback,19);JS_FreeValue(ctx,fallback);
#endif
 // Serialize the actual prepared nested write function via its compiled root.
 const char *program="function serialWrite(o,x){o.x=x;return o.x;}var so=Object.create(null);for(var si=0;si<20;si++){so=Object.create(null);serialWrite(so,7);}so.x;";
 JSValue root=JS_Eval(ctx,program,strlen(program),"serial.js",JS_EVAL_TYPE_GLOBAL|JS_EVAL_FLAG_COMPILE_ONLY);
 assert(!JS_IsException(root));check_value(ctx,JS_EvalFunction(ctx,JS_DupValue(ctx,root)),7);
 size_t len;uint8_t *buf=JS_WriteObject(ctx,&len,root,JS_WRITE_OBJ_BYTECODE);assert(buf);
 for(int rom=0;rom<2;rom++){
  JSValue loaded=JS_ReadObject(ctx,buf,len,JS_READ_OBJ_BYTECODE|(rom?JS_READ_OBJ_ROM_DATA:0));assert(!JS_IsException(loaded));
  check_value(ctx,JS_EvalFunction(ctx,loaded),7);
 }
 js_free(ctx,buf);JS_FreeValue(ctx,root);
 JS_FreeValue(ctx,keeper);JS_FreeValue(ctx,proto);JS_FreeValue(ctx,f);JS_RunGC(rt);
#if STORE_TRANSITION_ENABLED
 // Optional record OOM leaves the ordinary code and atom ownership intact.
 JSFunctionBytecode fake={0};uint8_t code[8]={OP_get_arg0,OP_get_arg1,OP_put_field,0,0,0,0,OP_return_undef};
 JSAtom ax=JS_NewAtom(ctx,"oom_x");put_u32(code+3,ax);fake.byte_code_buf=code;fake.byte_code_len=sizeof(code);
 JS_SetMemoryLimit(rt,rt->malloc_ctx.malloc_state.malloc_size);st_prepare(ctx,&fake);
 assert(!fake.store_sites && fake.byte_code_buf==code && code[2]==OP_put_field);
 JS_SetMemoryLimit(rt,SIZE_MAX);st_prepare(ctx,&fake);assert(fake.store_count==1&&fake.byte_code_buf!=code);
 st_free(rt,&fake);rdi_free(rt,&fake);puts("OPTIONAL_OOM_FALLBACK_PASS");
 // Frozen whole-constructor templates keep ordinary put_field representation.
 const char *whole="function Kept(a,b){this.a=a;this.b=b;}var keepEmpty=Object.create(Kept.prototype);function keptNew(a,b){return new Kept(a,b);}for(var ki=0;ki<30;ki++)keptNew(3,4);";
 JSValue vv=JS_Eval(ctx,whole,strlen(whole),"kept.js",JS_EVAL_TYPE_GLOBAL);assert(!JS_IsException(vv));JS_FreeValue(ctx,vv);
 JSValue global=JS_GetGlobalObject(ctx),kept=JS_GetPropertyStr(ctx,global,"Kept"),call=JS_GetPropertyStr(ctx,global,"keptNew");
 JSFunctionBytecode *kb=JS_VALUE_GET_OBJ(kept)->u.func.function_bytecode,*cb=JS_VALUE_GET_OBJ(call)->u.func.function_bytecode;
 FourRecipe recipe;assert(plan_recipe(kb,&recipe)&&kb->store_count==0&&cb->four_count==1&&cb->four_sites[0].plan);
 JSValue av[2]={JS_NewInt32(ctx,13),JS_NewInt32(ctx,17)},answer;
 assert(four_ctor_try(ctx,&cb->four_sites[0],kept,kept,av,&answer));check_value(ctx,JS_GetPropertyStr(ctx,answer,"a"),13);JS_FreeValue(ctx,answer);
 JS_FreeValue(ctx,global);JS_FreeValue(ctx,kept);JS_FreeValue(ctx,call);puts("WHOLE_CONSTRUCTOR_RETAINED_PASS");
 // Cache -> prototype -> function cycle, plus explicit GC collection.
 f=fn(ctx);proto=JS_NewObjectProto(ctx,JS_NULL);JS_SetPropertyStr(ctx,proto,"f",JS_DupValue(ctx,f));
 keeper=JS_NewObjectProto(ctx,proto);
 for(int i=0;i<20;i++){JSValue o=JS_NewObjectProto(ctx,proto);invoke(ctx,f,o,i);JS_FreeValue(ctx,o);}
 JS_FreeValue(ctx,keeper);JS_FreeValue(ctx,proto);JS_FreeValue(ctx,f);
 ex_edge_clear(rt);JS_RunGC(rt);
 // Old-plan release can run a native callback. It must see the new value and
 // can re-enter the same static point without seeing a half-published plan.
 JSClassID id;JS_NewClassID(&id);JSClassDef cd={"StFinalizer",finalizer};assert(JS_NewClass(rt,id,&cd)==0);
 callback_ctx=ctx;callback_f=fn(ctx);
 JSValue native=JS_NewObjectClass(ctx,id);proto=JS_NewObjectProto(ctx,JS_NULL);
 JS_SetPropertyStr(ctx,proto,"native",native);keeper=JS_NewObjectProto(ctx,proto);
 for(int i=0;i<10;i++){JSValue o=JS_NewObjectProto(ctx,proto);invoke(ctx,callback_f,o,i);JS_FreeValue(ctx,o);}
 b=JS_VALUE_GET_OBJ(callback_f)->u.func.function_bytecode;assert(b->store_sites[0].from);
 JS_FreeValue(ctx,keeper);JS_FreeValue(ctx,proto);
 JSValue next_proto=JS_NewObjectProto(ctx,JS_NULL),next_keeper=JS_NewObjectProto(ctx,next_proto);
 // With transition table disabled, the first write creates the destination;
 // keep it alive so the second write takes the original shape-reuse branch.
 JSValue first=JS_NewObjectProto(ctx,next_proto);invoke(ctx,callback_f,first,31);
 callback_receiver=JS_NewObjectProto(ctx,next_proto);
 JSValue args[2]={callback_receiver,JS_NewInt32(ctx,37)};
 check_value(ctx,JS_Call(ctx,callback_f,JS_UNDEFINED,2,args),41);assert(callbacks==1);
 JS_FreeValue(ctx,first);JS_FreeValue(ctx,next_keeper);JS_FreeValue(ctx,next_proto);
 JS_FreeValue(ctx,callback_receiver);JS_FreeValue(ctx,callback_f);callback_ctx=NULL;
#endif
 JS_FreeContext(ctx);JS_FreeRuntime(rt);puts("STORE_FIXTURE_PASS");return 0;
}
