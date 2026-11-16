#include "quickjs.c"
#include <assert.h>
static void run(JSContext*c,const char*s){JSValue v=JS_Eval(c,s,strlen(s),"negative-internal.js",JS_EVAL_TYPE_GLOBAL);if(JS_IsException(v)){JSValue e=JS_GetException(c);const char*z=JS_ToCString(c,e);fprintf(stderr,"%s\n",z);abort();}JS_FreeValue(c,v);}
static JSValue global(JSContext*c,const char*s){JSValue g=JS_GetGlobalObject(c),v=JS_GetPropertyStr(c,g,s);JS_FreeValue(c,g);return v;}
static FourSite*site(JSValue f){JSObject*p=JS_VALUE_GET_OBJ(f);assert(p->class_id==JS_CLASS_BYTECODE_FUNCTION);JSFunctionBytecode*b=p->u.func.function_bytecode;assert(b->four_count==1);return b->four_sites;}
static JSValue seed(JSContext*c,JSValue f){JSValue p=JS_GetPropertyStr(c,f,"prototype"),v=JS_NewObjectProto(c,p);JS_FreeValue(c,p);return v;}
int main(void){
 JSRuntime*rt=JS_NewRuntime();JSContext*c=JS_NewContext(rt);JS_SetGCThreshold(rt,SIZE_MAX);
 run(c,"function Good(a,b){this.x=a;this.y=b;}function Bad(a,b){this.x=a+1;this.y=b;}function Bad2(a,b){this.x=a*2;this.y=b;}function point(c,a,b){return new c(a,b);}function shortpoint(c){return new c(1);}function Cold(a,b){this.x=a;this.y=b;}function Fresh(a,b){this.x=a;this.y=b;}");
 JSValue good=global(c,"Good"),bad=global(c,"Bad"),bad2=global(c,"Bad2"),empty=seed(c,good);
 run(c,"for(var i=0;i<80;i++)point(Good,i,2);");JSValue f=global(c,"point");FourSite*s=site(f);assert(s->final && JS_VALUE_GET_OBJ(s->callee)==JS_VALUE_GET_OBJ(good));JSShape*saved=s->final;
 run(c,"for(var i=0;i<80;i++)point(Bad,i,2);");assert(s->final==saved && JS_VALUE_GET_OBJ(s->callee)==JS_VALUE_GET_OBJ(good));
#ifdef TEST_NEGATIVE
 assert(s->negative_index && JS_VALUE_GET_OBJ(negative_value(rt,s))==JS_VALUE_GET_OBJ(bad));
#endif
 run(c,"for(var i=0;i<80;i++)point(Good,i,2);");assert(s->final==saved);
 run(c,"for(var i=0;i<80;i++)point(Bad2,i,2);");
#ifdef TEST_NEGATIVE
 assert(JS_VALUE_GET_OBJ(negative_value(rt,s))==JS_VALUE_GET_OBJ(bad2));
#endif
 run(c,"for(var i=0;i<80;i++)point(Good,i,2);Object.defineProperty(Good.prototype,'x',{set:function(v){},configurable:true});for(var i=0;i<20;i++)point(Good,i,2);delete Good.prototype.x;for(var i=0;i<80;i++)point(Good,i,2);");assert(s->final==saved);
#ifdef TEST_NEGATIVE
 int reject=99;
 assert(!four_ctor_slow_eligible(c,s,good,good,1,&reject) && !reject); /* argc */
 assert(!four_ctor_slow_eligible(c,s,good,bad,2,&reject) && !reject); /* new.target */
 JS_SetGCThreshold(rt,0);assert(!four_ctor_slow_eligible(c,s,good,good,2,&reject) && !reject);JS_SetGCThreshold(rt,SIZE_MAX);
 run(c,"Cold=eval('(function(a,b){this.x=a;this.y=b;})');");JSValue cold=global(c,"Cold");assert(JS_VALUE_GET_OBJ(cold)->class_id==JS_CLASS_COLD_BYTECODE_FUNCTION);assert(!four_ctor_slow_eligible(c,s,cold,cold,2,&reject) && !reject);
 JSValue ec=seed(c,cold);run(c,"for(var i=0;i<80;i++)point(Cold,i,2);");assert(s->final && JS_VALUE_GET_OBJ(s->callee)==JS_VALUE_GET_OBJ(cold));
 run(c,"Fresh.call({},1,2);");JSValue fresh=global(c,"Fresh"),proto=JS_GetPropertyStr(c,fresh,"prototype");assert(!find_hashed_shape_proto(rt,JS_VALUE_GET_OBJ(proto)));
 assert(!four_ctor_slow_eligible(c,s,fresh,fresh,2,&reject) && !reject); /* missing empty shape not remembered */
 JSValue ef=seed(c,fresh);run(c,"for(var i=0;i<80;i++)point(Fresh,i,2);");assert(JS_VALUE_GET_OBJ(s->callee)==JS_VALUE_GET_OBJ(fresh));
 JS_FreeValue(c,ef);JS_FreeValue(c,proto);JS_FreeValue(c,fresh);JS_FreeValue(c,ec);JS_FreeValue(c,cold);
#endif
 /* Cycle through negative target -> point bytecode -> negative target. */
 run(c,"Bad2.back=point;point=Good=Bad=Bad2=Cold=Fresh=shortpoint=undefined;");
 JS_FreeValue(c,empty);JS_FreeValue(c,good);JS_FreeValue(c,bad);JS_FreeValue(c,bad2);JS_FreeValue(c,f);JS_RunGC(rt);
 /* The inherited C strong shape-edge cache is a real root; flush it only in this GC fixture. */
 ex_edge_clear(rt);JS_RunGC(rt);
#ifdef TEST_NEGATIVE
 assert(!rt->negative_live);
#endif
 JS_FreeContext(c);JS_RunGC(rt);JS_FreeRuntime(rt);puts("POSITIVE_RETAINED_TEMPORARY_RECOVERY_NEGATIVE_GC_PASS");return 0;
}
