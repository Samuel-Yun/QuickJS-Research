/* Test-only inspection of real objects, cache records and opcode entries. */
#include "quickjs.c"
static const char *const og_opnames[]={
#define DEF(id,size,pop,push,fmt) #id,
#include "quickjs-opcode.h"
};
_Static_assert(countof(og_opnames)==countof(opcode_info),"opcode names");
static int exotic_gets;
static JSValue exotic_get(JSContext*ctx,JSValueConst obj,JSAtom atom,JSValueConst receiver){exotic_gets++;return JS_NewInt32(ctx,99);}
static void number(JSContext*ctx,JSValue v,int expected){int32_t n;assert(!JS_IsException(v));assert(!JS_ToInt32(ctx,&n,v)&&n==expected);JS_FreeValue(ctx,v);}
static JSValue reader(JSContext*ctx,JSAtom atom){
 const char*s="(function readX(o){return o.x;})";JSValue f=JS_Eval(ctx,s,strlen(s),"reader.js",JS_EVAL_TYPE_GLOBAL);assert(!JS_IsException(f));
 JSFunctionBytecode*b=JS_VALUE_GET_OBJ(f)->u.func.function_bytecode;
 // Numeric names are valid get_field atoms too. Change only this test reader,
 // before its first query; preserve normal atom ownership in both formats.
 for(int pc=0,op;pc<b->byte_code_len;pc+=short_opcode_info(op).size){op=b->byte_code_buf[pc];
  if(op==OP_get_field){JSAtom old=get_u32(b->byte_code_buf+pc+1);put_u32(b->byte_code_buf+pc+1,JS_DupAtom(ctx,atom));JS_FreeAtom(ctx,old);}
#ifdef OG_METHOD
  if(op==OP_get_field_rdi){ReadICSite*s=(ReadICSite*)(b->byte_code_buf+pc+1+get_u32(b->byte_code_buf+pc+1));assert(!s->shape);JSAtom old=s->atom;s->atom=JS_DupAtom(ctx,atom);JS_FreeAtom(ctx,old);}
#endif
 }return f;
}
static JSValue read(JSContext*ctx,JSValue f,JSValue o){return JS_Call(ctx,f,JS_UNDEFINED,1,&o);}
static void snapshot(JSContext*ctx,JSValue f){
 JSFunctionBytecode*b=JS_VALUE_GET_OBJ(f)->u.func.function_bytecode;
 for(int pc=0,op;pc<b->byte_code_len;pc+=short_opcode_info(op).size){op=b->byte_code_buf[pc];int index=op;
#if SHORT_OPCODES
 if(op>=OP_TEMP_START)index+=OP_TEMP_END-OP_TEMP_START;
#endif
 printf("%d %s\n",pc,og_opnames[index]);}
}
int main(void){
 JSRuntime*rt=JS_NewRuntime();JSContext*ctx=JS_NewContext(rt);assert(ctx);
 printf("LAYOUT runtime=%zu object=%zu shape=%zu function=%zu",sizeof(JSRuntime),sizeof(JSObject),sizeof(JSShape),sizeof(JSFunctionBytecode));
#ifdef OG_METHOD
 printf(" read_site=%zu",sizeof(ReadICSite));
 printf("\nOPCODES arg0=%d loc0=%d field=%d field2=%d",OP_v6_get_arg0,OP_v6_get_loc0,OP_get_field_rdi,OP_get_field2_rdi);
#endif
 puts("");
 JSClassID id;JS_NewClassID(&id);JSClassExoticMethods methods={.get_property=exotic_get};JSClassDef cd={.class_name="OwnExotic",.exotic=&methods};assert(JS_NewClass(rt,id,&cd)==0);
 JSAtom x=JS_NewAtom(ctx,"x");JSValue f=reader(ctx,x),ordinary=JS_NewObjectProto(ctx,JS_NULL),exotic=JS_NewObjectProtoClass(ctx,JS_NULL,id);
 assert(JS_DefinePropertyValue(ctx,ordinary,x,JS_NewInt32(ctx,7),JS_PROP_C_W_E)>0);
 assert(JS_DefinePropertyValue(ctx,exotic,x,JS_NewInt32(ctx,11),JS_PROP_C_W_E|JS_PROP_NO_EXOTIC)>0);
 JSObject*a=JS_VALUE_GET_OBJ(ordinary),*b=JS_VALUE_GET_OBJ(exotic);
 assert(a->class_id!=b->class_id && !a->is_exotic && b->is_exotic && a->shape==b->shape && a->shape->is_hashed);
 for(int i=0;i<20;i++){number(ctx,read(ctx,f,ordinary),7);number(ctx,read(ctx,f,exotic),11);}assert(exotic_gets==0);
 snapshot(ctx,f);
 assert(JS_DeleteProperty(ctx,exotic,x,0)>0);assert(a->shape!=b->shape);number(ctx,read(ctx,f,exotic),99);assert(exotic_gets==1);
 JS_FreeValue(ctx,ordinary);JS_FreeValue(ctx,exotic);JS_FreeValue(ctx,f);puts("CROSS_CLASS_SAME_SHAPE_AND_DELETE_PASS");
 // A normal function may change COLD -> BYTECODE without changing its shape.
 const char*fs="(function receiver(){return 0;})";JSValue fun=JS_Eval(ctx,fs,strlen(fs),"function.js",JS_EVAL_TYPE_GLOBAL);assert(!JS_IsException(fun));JS_SetProperty(ctx,fun,x,JS_NewInt32(ctx,17));f=reader(ctx,x);
 number(ctx,read(ctx,f,fun),17);JSShape*before=JS_VALUE_GET_OBJ(fun)->shape;unsigned before_class=JS_VALUE_GET_OBJ(fun)->class_id;
 number(ctx,JS_Call(ctx,fun,JS_UNDEFINED,0,NULL),0);assert(JS_VALUE_GET_OBJ(fun)->shape==before);number(ctx,read(ctx,f,fun),17);
 printf("FUNCTION_CLASS_CHANGE %u -> %u same_shape=1\n",before_class,JS_VALUE_GET_OBJ(fun)->class_id);JS_FreeValue(ctx,fun);JS_FreeValue(ctx,f);
 // Real numeric get_field: ordinary data / dense array / typed array / string.
 JSAtom zero=JS_NewAtom(ctx,"0");f=reader(ctx,zero);ordinary=JS_NewObjectProto(ctx,JS_NULL);JS_SetProperty(ctx,ordinary,zero,JS_NewInt32(ctx,7));
 JSValue array=JS_NewArray(ctx);JS_SetPropertyUint32(ctx,array,0,JS_NewInt32(ctx,3));
 JSValue typed=JS_Eval(ctx,"new Uint8Array([5])",19,"typed.js",JS_EVAL_TYPE_GLOBAL);assert(!JS_IsException(typed));
 JSValue string=JS_Eval(ctx,"new String('z')",15,"string.js",JS_EVAL_TYPE_GLOBAL);assert(!JS_IsException(string));
 for(int i=0;i<20;i++){number(ctx,read(ctx,f,ordinary),7);number(ctx,read(ctx,f,array),3);number(ctx,read(ctx,f,typed),5);JSValue v=read(ctx,f,string);const char*t=JS_ToCString(ctx,v);assert(t&&strcmp(t,"z")==0);JS_FreeCString(ctx,t);JS_FreeValue(ctx,v);}
 snapshot(ctx,f);JS_FreeValue(ctx,f);
 // Detaching an element buffer doesn't invalidate a separate real own x slot.
 JS_SetProperty(ctx,typed,x,JS_NewInt32(ctx,29));f=reader(ctx,x);for(int i=0;i<20;i++)number(ctx,read(ctx,f,typed),29);
 JSValue buffer=JS_GetPropertyStr(ctx,typed,"buffer");JS_DetachArrayBuffer(ctx,buffer);number(ctx,read(ctx,f,typed),29);JS_FreeValue(ctx,buffer);JS_FreeValue(ctx,f);
 f=reader(ctx,zero);JSValue v=read(ctx,f,typed);assert(JS_IsUndefined(v));JS_FreeValue(ctx,v);JS_FreeValue(ctx,f);
 JS_FreeValue(ctx,ordinary);JS_FreeValue(ctx,array);JS_FreeValue(ctx,typed);JS_FreeValue(ctx,string);JS_FreeAtom(ctx,zero);JS_FreeAtom(ctx,x);
 JS_RunGC(rt);JS_FreeContext(ctx);JS_FreeRuntime(rt);puts("NUMERIC_AND_DETACH_AND_GC_PASS");return 0;
}
