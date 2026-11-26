#ifdef FOUR_DIAG
/* Diagnostics have no ownership of VM values; names/locations are copied. */
typedef struct R2Count {uintptr_t pc;unsigned offset;int line;char name[96];uint64_t c[32];} R2Count;
static R2Count r2_counts[1024];
typedef struct R2Target {uintptr_t pc;JSValue target;uint64_t n;unsigned argc_min,argc_max;char name[96];unsigned type;} R2Target;
static R2Target r2_targets[512];static unsigned r2_target_count;static JSRuntime*r2_target_rt;
static void r2_target(JSContext*ctx,uintptr_t pc,JSValue target,unsigned argc){
 if(!four_active)return;r2_target_rt=ctx->rt;
 for(unsigned n=0;n<r2_target_count;n++)if(r2_targets[n].pc==pc&&JS_VALUE_GET_OBJ(r2_targets[n].target)==JS_VALUE_GET_OBJ(target)){R2Target*t=&r2_targets[n];t->n++;t->argc_min=min_int(t->argc_min,argc);t->argc_max=max_int(t->argc_max,argc);return;}
 assert(r2_target_count<512);R2Target*t=&r2_targets[r2_target_count++];t->pc=pc;t->target=JS_DupValue(ctx,target);t->n=1;t->argc_min=t->argc_max=argc;
 JSObject*f=JS_VALUE_GET_OBJ(target);t->type=f->class_id;
 if(f->class_id==JS_CLASS_BYTECODE_FUNCTION||f->class_id==JS_CLASS_COLD_BYTECODE_FUNCTION){char tmp[96];snprintf(t->name,sizeof(t->name),"%s",JS_AtomGetStr(ctx,tmp,sizeof(tmp),f->u.func.function_bytecode->func_name));}
}
static void r2_target_report(void){fprintf(stderr,"R2_TARGETS:[");for(unsigned n=0;n<r2_target_count;n++){R2Target*t=&r2_targets[n];fprintf(stderr,"%s{\"site_address\":\"%"PRIxPTR"\",\"identity\":%u,\"class\":%u,\"n\":%"PRIu64",\"argc_min\":%u,\"argc_max\":%u,\"target\":",n?",":"",t->pc,n,t->type,t->n,t->argc_min,t->argc_max);four_json_string(t->name);fprintf(stderr,"}");}fprintf(stderr,"]\n");for(unsigned n=0;n<r2_target_count;n++)JS_FreeValueRT(r2_target_rt,r2_targets[n].target);r2_target_count=0;}

static int find_line_num(JSContext*,JSFunctionBytecode*,uint32_t,int*);
static R2Count*r2_count(JSContext*ctx,uintptr_t pc){
 if(!four_active)return NULL;
 unsigned h=(pc^(pc>>12))&1023;
 for(unsigned n=0;n<1024;n++,h=(h+1)&1023){
  R2Count*r=&r2_counts[h];if(r->pc==pc)return r;
  if(!r->pc){r->pc=pc;JSStackFrame*sf=ctx->rt->current_stack_frame;
   if(sf&&JS_VALUE_GET_TAG(sf->cur_func)==JS_TAG_OBJECT){JSObject*f=JS_VALUE_GET_OBJ(sf->cur_func);
    if(f->class_id==JS_CLASS_BYTECODE_FUNCTION){JSFunctionBytecode*b=f->u.func.function_bytecode;int col;
     r->offset=pc-(uintptr_t)b->byte_code_buf;r->line=find_line_num(ctx,b,r->offset,&col);char tmp[96];snprintf(r->name,sizeof(r->name),"%s",JS_AtomGetStr(ctx,tmp,sizeof(tmp),b->func_name));}}
   return r;}
 }abort();
}
#define R2C(ctx,pc,k) do{R2Count*rr=r2_count(ctx,(uintptr_t)(pc));if(rr)rr->c[k]++;}while(0)
static void r2_report(void){r2_target_report();fprintf(stderr,"R2_COUNTS:[");unsigned j=0;for(unsigned n=0;n<1024;n++){R2Count*r=&r2_counts[n];if(!r->pc)continue;fprintf(stderr,"%s{\"pc\":%u,\"line\":%d,\"function\":",j++?",":"",r->offset,r->line);four_json_string(r->name);fprintf(stderr,",\"address\":\"%"PRIxPTR"\",\"c\":[",r->pc);for(unsigned k=0;k<32;k++)fprintf(stderr,"%s%"PRIu64,k?",":"",r->c[k]);fprintf(stderr,"]}");}fprintf(stderr,"]\n");}
#else
#define R2C(ctx,pc,k) ((void)0)
#define r2_target(ctx,pc,target,argc) ((void)0)
#endif
