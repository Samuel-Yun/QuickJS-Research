/* A new-site plan, not a special case for a JS name or benchmark. */
typedef struct NumericRecipe {FourRecipe fields;JSValue zero[3];} NumericRecipe;
typedef struct NumericPlan {JSValue wrapper,initializer,apply;JSShape*final;NumericRecipe recipe;JSAtom init_atom,apply_atom;} NumericPlan;
typedef struct NumericSeed {JSValue initializer,apply,proto;NumericRecipe recipe;JSAtom init_atom,apply_atom;int valid;} NumericSeed;
static int np_slot(const uint8_t**pp,const uint8_t*end,int put){
 const uint8_t*p=*pp;unsigned i;
 if(p>=end)return -1;
 if(*p>=(put?OP_put_arg0:OP_get_arg0) && *p<=(put?OP_put_arg3:OP_get_arg3)){i=*p-(put?OP_put_arg0:OP_get_arg0);p++;}
 else if(*p==(put?OP_put_arg:OP_get_arg)&&end-p>=3){i=get_u16(p+1);p+=3;}else return -1;
 *pp=p;return i;
}
static const uint8_t*np_jump(const uint8_t*p,const uint8_t*end,int conditional){
 if(p>=end)return NULL;
 if(*p==(conditional?OP_if_false8:OP_goto8)&&end-p>=2)return p+1+(int8_t)p[1];
 if(!conditional&&*p==OP_goto16&&end-p>=3)return p+1+(int16_t)get_u16(p+1);
 if(*p==(conditional?OP_if_false:OP_goto)&&end-p>=5)return p+1+(int32_t)get_u32(p+1);
 return NULL;
}
static int np_zero(JSFunctionBytecode*b,const uint8_t**pp,const uint8_t*end,JSValue*out){
 const uint8_t*p=*pp;JSValue v;
 if(p>=end)return 0;
 if(*p==OP_push_0){v=JS_NewInt32(NULL,0);p++;}
 else if(*p==OP_push_const8&&end-p>=2&&p[1]<b->cpool_count){v=b->cpool[p[1]];p+=2;}
 else if(*p==OP_push_const&&end-p>=5&&get_u32(p+1)<b->cpool_count){v=b->cpool[get_u32(p+1)];p+=5;}
 else return 0;
 if(!JS_IsNumber(v))return 0;
 double n=JS_VALUE_GET_TAG(v)==JS_TAG_INT?JS_VALUE_GET_INT(v):JS_VALUE_GET_FLOAT64(v);
 if(n!=0)return 0;*out=v;*pp=p;return 1;
}
static int np_recipe(JSFunctionBytecode*b,NumericRecipe*r){
 const uint8_t*p=b->byte_code_buf,*end=p+b->byte_code_len;JSValue zeros[3];
 if(b->func_kind!=JS_FUNC_NORMAL||b->arg_count!=3||b->var_count!=1||b->var_ref_count||b->closure_var_count||b->need_home_object||b->is_derived_class_constructor||!b->has_simple_parameter_list||end-p<3||p[0]!=OP_push_this||p[1]!=OP_put_loc0)return 0;
 p+=2;int normalized=*p!=OP_get_loc0;
 if(normalized){
  unsigned seen=0;
  for(unsigned i=0;i<3;i++){
   int a=np_slot(&p,end,0);if(a<0||a>=3||(seen&(1u<<a))||p>=end||*p++!=OP_lnot)return 0;
   const uint8_t*t=np_jump(p,end,1);if(!t)return 0;p+=short_opcode_info(*p).size;
   if(!np_zero(b,&p,end,&zeros[a])||np_slot(&p,end,1)!=a||p!=t)return 0;seen|=1u<<a;
  }
 }
 r->fields.n=3;
 for(unsigned i=0;i<3;i++){
  if(p>=end||*p++!=OP_get_loc0)return 0;
  int a=np_slot(&p,end,0);if(a<0||a>=3)return 0;r->fields.arg[i]=a;
  if(normalized)r->zero[i]=zeros[a];
  else{
   const uint8_t*f=np_jump(p,end,1);if(!f)return 0;p+=short_opcode_info(*p).size;
   if(np_slot(&p,end,0)!=a)return 0;
   const uint8_t*t=np_jump(p,end,0);if(!t)return 0;p+=short_opcode_info(*p).size;
   if(p!=f||!np_zero(b,&p,end,&r->zero[i])||p!=t)return 0;
  }
  if(end-p<5||*p!=OP_put_field)return 0;r->fields.atom[i]=get_u32(p+1);p+=5;
  for(unsigned j=0;j<i;j++)if(r->fields.atom[i]==r->fields.atom[j])return 0;
 }
 return p+1==end&&*p==OP_return_undef;
}
static int np_wrapper(JSFunctionBytecode*b,JSAtom*init,JSAtom*apply){
 const uint8_t*p=b->byte_code_buf;
 if(b->func_kind!=JS_FUNC_NORMAL||b->arg_count||b->var_count!=2||b->var_ref_count||b->closure_var_count||b->need_home_object||b->is_derived_class_constructor||!b->has_simple_parameter_list||b->byte_code_len!=22)return 0;
 int special=p[2]==OP_special_object;
#ifdef NP_OLD_FORWARD
 special|=p[2]==OP_forward_ctor;
#endif
 if(p[0]!=OP_push_this||p[1]!=OP_put_loc0||!special||p[3]!=OP_SPECIAL_OBJECT_ARGUMENTS||p[4]!=OP_put_loc1||(p[5]!=OP_get_loc0&&p[5]!=OP_v6_get_loc0)||(p[6]!=OP_get_field&&p[6]!=OP_get_field_rdi)||(p[11]!=OP_get_field2&&p[11]!=OP_get_field2_rdi)||p[16]!=OP_get_loc0||p[17]!=OP_get_loc1||p[18]!=OP_call_method||get_u16(p+19)!=2||p[21]!=OP_return_undef)return 0;
 *init=p[6]==OP_get_field?get_u32(p+7):((ReadICSite*)(p+7+get_u32(p+7)))->atom;
 *apply=p[11]==OP_get_field2?get_u32(p+12):((ReadICSite*)(p+12+get_u32(p+12)))->atom;
 return 1;
}
static int np_data(JSObject*o,JSAtom atom,JSValue*out){
 for(unsigned depth=0;o&&depth<32;depth++,o=o->shape->proto){
  if(o->is_exotic)return 0;JSProperty*p;JSShapeProperty*d=find_own_property(&p,o,atom);
  if(d){if(d->flags&JS_PROP_TMASK)return 0;*out=p->u.value;return 1;}
 }return 0;
}
static int np_resolve(JSContext*ctx,JSObject*proto,JSAtom init,JSAtom atom,JSValue*i,JSValue*a){
 if(!np_data(proto,init,i)||JS_VALUE_GET_TAG(*i)!=JS_TAG_OBJECT)return 0;
 JSObject*f=JS_VALUE_GET_OBJ(*i);
 if((f->class_id!=JS_CLASS_BYTECODE_FUNCTION&&f->class_id!=JS_CLASS_COLD_BYTECODE_FUNCTION)||f->is_exotic||!np_data(f,atom,a)||JS_VALUE_GET_TAG(*a)!=JS_TAG_OBJECT)return 0;
 JSObject*p=JS_VALUE_GET_OBJ(*a);
 return p->class_id==JS_CLASS_C_FUNCTION&&p->u.cfunc.cproto==JS_CFUNC_generic_magic&&!p->u.cfunc.magic&&p->u.cfunc.c_function.generic_magic==js_function_apply;
}
static int np_numbers(const NumericRecipe*r,JSValue*args){for(unsigned i=0;i<3;i++)if(!JS_IsNumber(args[r->fields.arg[i]]))return 0;return 1;}
static JSValue np_value(JSValue v,JSValue zero){double n=JS_VALUE_GET_TAG(v)==JS_TAG_INT?JS_VALUE_GET_INT(v):JS_VALUE_GET_FLOAT64(v);return n!=0&&!isnan(n)?v:zero;}
static void np_release(JSRuntime*rt,NumericPlan*p){if(!p)return;JS_FreeValueRT(rt,p->wrapper);JS_FreeValueRT(rt,p->initializer);JS_FreeValueRT(rt,p->apply);js_free_shape_null(rt,p->final);js_free_rt(rt,p);}
#ifdef FOUR_DIAG
static uint64_t np_work[8];
static void np_report(void){fprintf(stderr,"NP_WORK:[");for(unsigned n=0;n<8;n++)fprintf(stderr,"%s%"PRIu64,n?",":"",np_work[n]);fprintf(stderr,"]\n");}
#define NP_COUNT(s,k) do{if(four_active)(s)->diag->np[k]++;}while(0)
#define NP_WORK(k,n) do{if(four_active)np_work[k]+=(n);}while(0)
static void np_frame(JSFunctionBytecode*b){JSAtom a,c;NumericRecipe r;if(np_wrapper(b,&a,&c))NP_WORK(0,1);if(np_recipe(b,&r))NP_WORK(1,1);}
static void np_arguments(JSFunctionBytecode*b){JSAtom a,c;if(np_wrapper(b,&a,&c))NP_WORK(2,1);}
static void np_write(JSFunctionBytecode*b){NumericRecipe r;if(np_recipe(b,&r))NP_WORK(3,1);}
#else
#define NP_COUNT(s,k) ((void)0)
#define NP_WORK(k,n) ((void)0)
#endif
#ifndef NUMERIC_OBSERVE_ONLY
/* Rejection stages: identity, wrapper, prototype, resolve/apply, recipe,
 * numbers, inherited write eligibility, budget. First failure only. */
static int np_seed(JSContext*ctx,FourSite*s,JSValue c,JSValue t,JSValue*args,NumericSeed*z){
 JSObject*f,*proto;JSAtom init,apply;JSValue i,a;NumericRecipe r;int reason=0;
 NP_COUNT(s,0);
 if(s->argc<3||!plan_base(ctx,c,t,s->argc,&f))goto no;
 reason=1;if(!np_wrapper(f->u.func.function_bytecode,&init,&apply))goto no;NP_COUNT(s,1);
 reason=2;if(!(proto=plan_proto(f)))goto no;
 reason=3;if(!np_resolve(ctx,proto,init,apply,&i,&a))goto no;
 reason=4;if(!np_recipe(JS_VALUE_GET_OBJ(i)->u.func.function_bytecode,&r))goto no;NP_COUNT(s,2);
 reason=5;if(!np_numbers(&r,args))goto no;NP_COUNT(s,3);
 reason=6;if(!plan_chain(proto,&r.fields))goto no;
 reason=7;if(js_check_stack_overflow(ctx->rt,4096+sizeof(JSValue)*(size_t)s->argc*2))goto no;
 z->initializer=JS_DupValue(ctx,i);z->apply=JS_DupValue(ctx,a);z->proto=JS_DupValue(ctx,JS_MKPTR(JS_TAG_OBJECT,proto));z->recipe=r;z->init_atom=init;z->apply_atom=apply;z->valid=1;return 1;
 no:NP_COUNT(s,8+reason);return 0;
}
static void np_learn(JSContext*ctx,FourSite*s,JSValue c,JSValue result,NumericSeed*z){
 if(!z->valid||JS_VALUE_GET_TAG(result)!=JS_TAG_OBJECT)return;
 JSObject*f=JS_VALUE_GET_OBJ(c),*o=JS_VALUE_GET_OBJ(result),*proto=plan_proto(f);JSValue i,a;
 if(proto!=JS_VALUE_GET_OBJ(z->proto)||!np_resolve(ctx,proto,z->init_atom,z->apply_atom,&i,&a)||JS_VALUE_GET_OBJ(i)!=JS_VALUE_GET_OBJ(z->initializer)||JS_VALUE_GET_OBJ(a)!=JS_VALUE_GET_OBJ(z->apply)||!plan_chain(proto,&z->recipe.fields)||o->class_id!=JS_CLASS_OBJECT||o->is_exotic||!o->shape->is_hashed||o->shape->proto!=proto||o->shape->prop_count!=3||o->shape->deleted_prop_count)return;
 JSShapeProperty*d=get_shape_prop(o->shape);for(unsigned j=0;j<3;j++)if(d[j].atom!=z->recipe.fields.atom[j]||d[j].flags!=JS_PROP_C_W_E)return;
 NumericPlan*p=js_mallocz_rt(ctx->rt,sizeof(*p));if(!p){NP_COUNT(s,17);return;}
 p->wrapper=JS_DupValue(ctx,c);p->initializer=JS_DupValue(ctx,z->initializer);p->apply=JS_DupValue(ctx,z->apply);p->final=js_dup_shape(o->shape);p->recipe=z->recipe;p->init_atom=z->init_atom;p->apply_atom=z->apply_atom;
 NumericPlan*old=s->numeric;s->numeric=p;NP_COUNT(s,4);np_release(ctx->rt,old);
}
static void np_seed_free(JSContext*ctx,NumericSeed*z){if(z->valid){z->valid=0;JS_FreeValue(ctx,z->initializer);JS_FreeValue(ctx,z->apply);JS_FreeValue(ctx,z->proto);}}
static int np_try(JSContext*ctx,FourSite*s,JSValue c,JSValue t,JSValue*args,JSValue*out){
 NumericPlan*p=s->numeric;if(!p)return 0;NP_COUNT(s,5);
 JSObject*f;JSValue i,a;
 if(JS_VALUE_GET_TAG(c)!=JS_TAG_OBJECT||JS_VALUE_GET_OBJ(c)!=JS_VALUE_GET_OBJ(p->wrapper)||!plan_base(ctx,c,t,s->argc,&f)||plan_proto(f)!=p->final->proto||!np_numbers(&p->recipe,args)||!np_resolve(ctx,p->final->proto,p->init_atom,p->apply_atom,&i,&a)||JS_VALUE_GET_OBJ(i)!=JS_VALUE_GET_OBJ(p->initializer)||JS_VALUE_GET_OBJ(a)!=JS_VALUE_GET_OBJ(p->apply)||!plan_chain(p->final->proto,&p->recipe.fields)||js_check_stack_overflow(ctx->rt,4096+sizeof(JSValue)*(size_t)s->argc*2)){NP_COUNT(s,6);return 0;}
#ifdef NUMERIC_ENTRY_OFF
 return 0;
#endif
 /* ctor, wrapper call, native apply call, initializer call. No hooks accepted. */
 for(unsigned n=0;n<4;n++)if(js_poll_interrupts(ctx))return 0;
 *out=JS_NewObjectFromShape(ctx,js_dup_shape(p->final),JS_CLASS_OBJECT,NULL);
 if(JS_IsException(*out)){NP_COUNT(s,18);return 1;}
 JSObject*o=JS_VALUE_GET_OBJ(*out);
 for(unsigned n=0;n<3;n++)o->prop[n].u.value=np_value(args[p->recipe.fields.arg[n]],p->recipe.zero[n]);
 NP_COUNT(s,7);NP_WORK(4,1);NP_WORK(5,3);return 1;
}
#endif
