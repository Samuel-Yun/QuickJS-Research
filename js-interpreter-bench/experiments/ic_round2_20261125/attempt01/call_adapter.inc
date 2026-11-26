/* Only pure, nonobserving field initializers qualify: generic bodies retain
 * the native Function.prototype.call frame. COPY_ARGV remains unchanged. */
typedef struct R2CallRecipe {JSAtom atom[8];uint16_t arg[8];JSValue constant[8];uint8_t n;} R2CallRecipe;
typedef struct R2CallSite {struct R2CallSite*next;uint32_t pc;JSValue target,call;R2CallRecipe r;} R2CallSite;
static JSValue js_function_call(JSContext*,JSValueConst,int,JSValueConst*);
static int r2_call_recipe(JSFunctionBytecode*b,R2CallRecipe*r){
 const uint8_t*p=b->byte_code_buf,*end=p+b->byte_code_len;
 if(b->func_kind!=JS_FUNC_NORMAL||b->var_ref_count||b->closure_var_count||b->need_home_object||b->is_derived_class_constructor||!b->has_simple_parameter_list)return 0;
 r->n=0;if(p+1==end&&*p==OP_return_undef)return 1;
 if(b->var_count!=1||end-p<3||p[0]!=OP_push_this||p[1]!=OP_put_loc0)return 0;p+=2;
 while(p<end&&*p==OP_get_loc0){
  if(r->n==8)return 0;p++;unsigned a=UINT16_MAX;JSValue v=JS_UNDEFINED;
  if(p<end&&*p>=OP_get_arg0&&*p<=OP_get_arg3){a=*p++-OP_get_arg0;}
  else if(end-p>=3&&*p==OP_get_arg){a=get_u16(p+1);p+=3;}
  else if(p<end&&*p>=OP_push_minus1&&*p<=OP_push_7){v=JS_NewInt32(NULL,(int)*p++-OP_push_0);}
  else if(end-p>=2&&*p==OP_push_i8){v=JS_NewInt32(NULL,(int8_t)p[1]);p+=2;}
  else if(end-p>=5&&*p==OP_push_i32){v=JS_NewInt32(NULL,(int32_t)get_u32(p+1));p+=5;}
  else return 0;
  if(a!=UINT16_MAX&&a>=b->arg_count)return 0;
  if(end-p<5||(*p!=OP_put_field&&*p!=OP_put_field_shared))return 0;
  JSAtom atom=*p==OP_put_field?get_u32(p+1):((ReadICSite*)(p+1+get_u32(p+1)))->atom;p+=5;
  for(unsigned n=0;n<r->n;n++)if(r->atom[n]==atom)return 0;
  r->atom[r->n]=atom;r->arg[r->n]=a;r->constant[r->n++]=v;
 }return p+1==end&&*p==OP_return_undef;
}
static int r2_call_guard(JSContext*ctx,JSObject*f,JSValue receiver,unsigned argc,const R2CallRecipe*r){
 JSFunctionBytecode*b=f->u.func.function_bytecode;
 if(ctx->rt->interrupt_handler||b->realm!=ctx||argc<b->arg_count||JS_VALUE_GET_TAG(receiver)!=JS_TAG_OBJECT||js_check_stack_overflow(ctx->rt,4096+sizeof(JSValue)*(argc+b->var_count+b->stack_size)))return 0;
 JSObject*o=JS_VALUE_GET_OBJ(receiver);if(o->class_id!=JS_CLASS_OBJECT||o->is_exotic)return 0;
 for(unsigned n=0;n<r->n;n++){
  JSProperty*p;JSShapeProperty*d=find_own_property(&p,o,r->atom[n]);
  if(d){if((d->flags&JS_PROP_TMASK)||!(d->flags&JS_PROP_WRITABLE)||JS_VALUE_HAS_REF_COUNT(p->u.value))return 0;}
  else{if(!o->extensible)return 0;FourRecipe one={0};one.n=1;one.atom[0]=r->atom[n];if(!plan_chain(o->shape->proto,&one))return 0;}
 }return 1;
}
static void r2_call_free(JSRuntime*rt,R2CallSite*p){while(p){R2CallSite*n=p->next;JS_FreeValueRT(rt,p->target);JS_FreeValueRT(rt,p->call);js_free_rt(rt,p);p=n;}}
static void r2_call_mark(JSRuntime*rt,R2CallSite*p,JS_MarkFunc*mark){for(;p;p=p->next){JS_MarkValue(rt,p->target,mark);JS_MarkValue(rt,p->call,mark);}}
static __attribute__((noinline)) int r2_call_adapter(JSContext*ctx,JSFunctionBytecode*owner,const uint8_t*pc,JSValue call,JSValue target,int argc,JSValue*argv,JSValue*out){
 if(JS_VALUE_GET_TAG(call)!=JS_TAG_OBJECT||JS_VALUE_GET_TAG(target)!=JS_TAG_OBJECT||argc<1)return 0;
 JSObject*c=JS_VALUE_GET_OBJ(call),*f=JS_VALUE_GET_OBJ(target);
 if(c->class_id!=JS_CLASS_C_FUNCTION||c->u.cfunc.realm!=ctx||c->u.cfunc.cproto!=JS_CFUNC_generic||c->u.cfunc.c_function.generic!=js_function_call)return 0;
 r2_target(ctx,(uintptr_t)pc,target,argc);R2C(ctx,pc,0);if(f->class_id!=JS_CLASS_BYTECODE_FUNCTION){R2C(ctx,pc,1);return 0;}
 R2C(ctx,pc,2);if(!ctx->rt->r2_call_mode)return 0;
 uint32_t off=pc-owner->byte_code_buf;R2CallSite*s=NULL;R2CallRecipe temp,*r=&temp;
 if(ctx->rt->r2_call_mode>=2){for(s=owner->r2_calls;s;s=s->next)if(s->pc==off)break;
  if(s&&JS_VALUE_GET_OBJ(s->target)==f&&JS_VALUE_GET_OBJ(s->call)==c){r=&s->r;R2C(ctx,pc,3);}
 }
 if(r==&temp){R2C(ctx,pc,4);if(!r2_call_recipe(f->u.func.function_bytecode,r)){R2C(ctx,pc,5);return 0;}
  if(ctx->rt->r2_call_mode>=2){
   if(!s){s=js_mallocz_rt(ctx->rt,sizeof(*s));if(!s)return 0;s->pc=off;s->next=owner->r2_calls;owner->r2_calls=s;}
   JSValue oldt=s->target,oldc=s->call;s->target=JS_DupValue(ctx,target);s->call=JS_DupValue(ctx,call);s->r=temp;r=&s->r;R2C(ctx,pc,6);JS_FreeValue(ctx,oldt);JS_FreeValue(ctx,oldc);
  }
 }
 if(!r2_call_guard(ctx,f,argv[0],argc-1,r)){R2C(ctx,pc,7);return 0;}
 if(ctx->rt->r2_call_mode==3&&r->n==1&&r->arg[0]!=UINT16_MAX){
  if(js_poll_interrupts(ctx)||js_poll_interrupts(ctx))return 0;
  R2C(ctx,pc,9);R2C(ctx,pc,8);
  int ok=JS_SetPropertyInternal(ctx,argv[0],r->atom[0],JS_DupValue(ctx,argv[r->arg[0]+1]),argv[0],(f->u.func.function_bytecode->js_mode&JS_MODE_STRICT)?JS_PROP_THROW:0);
  *out=ok<0?JS_EXCEPTION:JS_UNDEFINED;return 1;
 }
 if(js_poll_interrupts(ctx))return 0;
 R2C(ctx,pc,8);*out=JS_Call(ctx,target,argv[0],argc-1,argv+1);return 1;
}
