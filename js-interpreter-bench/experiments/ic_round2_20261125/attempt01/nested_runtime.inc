/* Parent plans preserve two physical objects. The child binding is resolved
 * currently through ordinary data slots, never a saved constructor result. */
typedef struct NestedRecipe {FourRecipe fields;uint16_t var;uint8_t kind,path_n;JSAtom path[4];JSValue constants[3];FourSite*child;} NestedRecipe;
struct NestedPlan {JSValue wrapper,initializer,apply;JSShape*final;JSAtom init_atom,apply_atom;NestedRecipe r;};
typedef struct NestedSeed {JSValue initializer,apply,proto;JSAtom init_atom,apply_atom;NestedRecipe r;int valid;} NestedSeed;
static int nest_recipe(JSFunctionBytecode*b,NestedRecipe*r){
 memset(r,0,sizeof(*r));
 if(b->arg_count==2&&plan_recipe(b,&r->fields)&&r->fields.n==2){r->kind=2;return 1;}
 const uint8_t*p=b->byte_code_buf,*end=p+b->byte_code_len;
 if(b->arg_count||b->var_count!=1||b->var_ref_count||b->func_kind!=JS_FUNC_NORMAL||b->need_home_object||b->is_derived_class_constructor||!b->has_simple_parameter_list||end-p<10||p[0]!=OP_push_this||p[1]!=OP_put_loc0||p[2]!=OP_get_loc0)return 0;p+=3;
 if(end-p<3||*p!=OP_get_var)return 0;r->var=get_u16(p+1);p+=3;if(r->var>=b->closure_var_count)return 0;
 while(end-p>=5&&(*p==OP_get_field||*p==OP_get_field_rdi)){
  if(r->path_n==4)return 0;r->path[r->path_n++]=*p==OP_get_field?get_u32(p+1):((ReadICSite*)(p+1+get_u32(p+1)))->atom;p+=5;
 }
 if(!r->path_n||p>=end||*p++!=OP_dup)return 0;
 for(unsigned n=0;n<3;n++)if(!np_zero(b,&p,end,&r->constants[n]))return 0;
 if(end-p<3||*p!=OP_four_ctor||get_u16(p+1)>=b->four_count)return 0;
 r->child=&b->four_sites[get_u16(p+1)];if(r->child->argc!=3)return 0;p+=3;
 if(end-p!=6||*p!=OP_put_field||p[5]!=OP_return_undef)return 0;
 r->fields.n=1;r->fields.atom[0]=get_u32(p+1);r->kind=1;return 1;
}
static int nest_binding(JSObject*initializer,const NestedRecipe*r,JSValue*out){
 JSVarRef*v=initializer->u.func.var_refs[r->var];JSValue x=*v->pvalue;if(JS_IsUninitialized(x))return 0;
 for(unsigned n=0;n<r->path_n;n++){if(JS_VALUE_GET_TAG(x)!=JS_TAG_OBJECT||!np_data(JS_VALUE_GET_OBJ(x),r->path[n],&x))return 0;}
 *out=x;return JS_VALUE_GET_TAG(x)==JS_TAG_OBJECT;
}
static int nest_child_ready(JSContext*ctx,const NestedRecipe*r,JSValue child){
 NumericPlan*p=r->child->numeric;JSObject*f;JSValue i,a;
 return p&&JS_VALUE_GET_TAG(child)==JS_TAG_OBJECT&&JS_VALUE_GET_OBJ(child)==JS_VALUE_GET_OBJ(p->wrapper)&&plan_base(ctx,child,child,3,&f)&&plan_proto(f)==p->final->proto&&np_numbers(&p->recipe,(JSValue*)r->constants)&&np_resolve(ctx,p->final->proto,p->init_atom,p->apply_atom,&i,&a)&&JS_VALUE_GET_OBJ(i)==JS_VALUE_GET_OBJ(p->initializer)&&JS_VALUE_GET_OBJ(a)==JS_VALUE_GET_OBJ(p->apply)&&plan_chain(p->final->proto,&p->recipe.fields)&&!np_entry_off;
}
static void nest_release(JSRuntime*rt,NestedPlan*p){if(!p)return;JS_FreeValueRT(rt,p->wrapper);JS_FreeValueRT(rt,p->initializer);JS_FreeValueRT(rt,p->apply);js_free_shape_null(rt,p->final);js_free_rt(rt,p);}
static void nest_mark(JSRuntime*rt,NestedPlan*p,JS_MarkFunc*mark){if(!p)return;JS_MarkValue(rt,p->wrapper,mark);JS_MarkValue(rt,p->initializer,mark);JS_MarkValue(rt,p->apply,mark);mark(rt,&p->final->header);}
static void nest_seed_free(JSContext*ctx,NestedSeed*z){if(!z->valid)return;z->valid=0;JS_FreeValue(ctx,z->initializer);JS_FreeValue(ctx,z->apply);JS_FreeValue(ctx,z->proto);}
static int nest_seed(JSContext*ctx,FourSite*s,JSValue c,JSValue target,NestedSeed*z){
 uintptr_t pc=(uintptr_t)(ctx->rt->current_stack_frame->cur_pc-3);R2C(ctx,pc,0);R2C(ctx,pc,s->argc==0?1:s->argc==2?2:3);
 JSObject*f,*proto;JSAtom init,apply;JSValue i,a,child;NestedRecipe r;
 if((s->argc!=0&&s->argc!=2)||!plan_base(ctx,c,target,s->argc,&f)){R2C(ctx,pc,4);return 0;}
 if(!np_wrapper(f->u.func.function_bytecode,&init,&apply)){R2C(ctx,pc,5);return 0;}
 if(!(proto=plan_proto(f))||!np_resolve(ctx,proto,init,apply,&i,&a)){R2C(ctx,pc,6);return 0;}
 if(JS_VALUE_GET_OBJ(i)->class_id!=JS_CLASS_BYTECODE_FUNCTION||!nest_recipe(JS_VALUE_GET_OBJ(i)->u.func.function_bytecode,&r)||r.kind!=(s->argc==2?2:1)){R2C(ctx,pc,7);return 0;}
 if(!plan_chain(proto,&r.fields)){R2C(ctx,pc,8);return 0;}
 if(r.kind==1&&(!nest_binding(JS_VALUE_GET_OBJ(i),&r,&child)||!nest_child_ready(ctx,&r,child))){R2C(ctx,pc,9);return 0;}
 z->initializer=JS_DupValue(ctx,i);z->apply=JS_DupValue(ctx,a);z->proto=JS_DupValue(ctx,JS_MKPTR(JS_TAG_OBJECT,proto));z->init_atom=init;z->apply_atom=apply;z->r=r;z->valid=1;return 1;
}
static void nest_learn(JSContext*ctx,FourSite*s,JSValue c,JSValue result,NestedSeed*z){
 if(!z->valid||JS_VALUE_GET_TAG(result)!=JS_TAG_OBJECT)return;
 JSObject*f=JS_VALUE_GET_OBJ(c),*o=JS_VALUE_GET_OBJ(result),*proto=plan_proto(f);JSValue i,a,child;
 if(proto!=JS_VALUE_GET_OBJ(z->proto)||!np_resolve(ctx,proto,z->init_atom,z->apply_atom,&i,&a)||JS_VALUE_GET_OBJ(i)!=JS_VALUE_GET_OBJ(z->initializer)||JS_VALUE_GET_OBJ(a)!=JS_VALUE_GET_OBJ(z->apply)||!plan_chain(proto,&z->r.fields)||o->class_id!=JS_CLASS_OBJECT||o->is_exotic||!o->shape->is_hashed||o->shape->proto!=proto||o->shape->prop_count!=z->r.fields.n||o->shape->deleted_prop_count)return;
 JSShapeProperty*d=get_shape_prop(o->shape);for(unsigned j=0;j<z->r.fields.n;j++)if(d[j].atom!=z->r.fields.atom[j]||d[j].flags!=JS_PROP_C_W_E)return;
 if(z->r.kind==1&&(!nest_binding(JS_VALUE_GET_OBJ(i),&z->r,&child)||!nest_child_ready(ctx,&z->r,child)))return;
 NestedPlan*p=js_mallocz_rt(ctx->rt,sizeof(*p));if(!p)return;
 p->wrapper=JS_DupValue(ctx,c);p->initializer=JS_DupValue(ctx,i);p->apply=JS_DupValue(ctx,a);p->final=js_dup_shape(o->shape);p->r=z->r;p->init_atom=z->init_atom;p->apply_atom=z->apply_atom;NestedPlan*old=s->nested;s->nested=p;nest_release(ctx->rt,old);
 R2C(ctx,ctx->rt->current_stack_frame->cur_pc-3,10);
}
static int nest_try(JSContext*ctx,FourSite*s,JSValue c,JSValue t,JSValue*args,JSValue*out){
 NestedPlan*p=s->nested;if(!p)return 0;
 uintptr_t pc=(uintptr_t)(ctx->rt->current_stack_frame->cur_pc-3);R2C(ctx,pc,11);
 JSObject*f;JSValue i,a,child=JS_UNDEFINED;
 if(JS_VALUE_GET_TAG(c)!=JS_TAG_OBJECT||JS_VALUE_GET_OBJ(c)!=JS_VALUE_GET_OBJ(p->wrapper)||!plan_base(ctx,c,t,s->argc,&f)||plan_proto(f)!=p->final->proto||!np_resolve(ctx,p->final->proto,p->init_atom,p->apply_atom,&i,&a)||JS_VALUE_GET_OBJ(i)!=JS_VALUE_GET_OBJ(p->initializer)||JS_VALUE_GET_OBJ(a)!=JS_VALUE_GET_OBJ(p->apply)||!plan_chain(p->final->proto,&p->r.fields)){R2C(ctx,pc,12);return 0;}
 if(p->r.kind==1&&(!nest_binding(JS_VALUE_GET_OBJ(i),&p->r,&child)||!nest_child_ready(ctx,&p->r,child))){R2C(ctx,pc,13);return 0;}
 /* Includes arena rounding and all temporary allocations in the original
    pure child's wrapper/apply path; no GC or user callback between guards
    and the last store. FORCE_GC is already excluded by plan_base. */
 size_t budget=16*JS_MALLOC_ARENA_SIZE;if(ctx->rt->malloc_ctx.malloc_state.malloc_size>SIZE_MAX-budget||ctx->rt->malloc_ctx.malloc_state.malloc_size+budget>ctx->rt->malloc_gc_threshold){R2C(ctx,pc,14);return 0;}
 if(js_check_stack_overflow(ctx->rt,8192+sizeof(JSValue)*s->argc*2)){R2C(ctx,pc,15);return 0;}
 for(unsigned j=0;j<4;j++)if(js_poll_interrupts(ctx))return 0;
 *out=JS_NewObjectFromShape(ctx,js_dup_shape(p->final),JS_CLASS_OBJECT,NULL);if(JS_IsException(*out))return 1;
 JSObject*o=JS_VALUE_GET_OBJ(*out);for(unsigned j=0;j<p->r.fields.n;j++)o->prop[j].u.value=JS_UNDEFINED;
 R2C(ctx,pc,16);
 if(p->r.kind==2){for(unsigned j=0;j<2;j++)o->prop[j].u.value=JS_DupValue(ctx,args[p->r.fields.arg[j]]);R2C(ctx,pc,17);return 1;}
 JSValue result;int handled=0;JSValue owned=JS_DupValue(ctx,child);
 if(ctx->rt->r2_nested_mode==2){handled=np_try(ctx,p->r.child,owned,owned,p->r.constants,&result);if(handled)R2C(ctx,pc,18);}
 if(!handled){R2C(ctx,pc,19);result=JS_CallConstructorInternal(ctx,owned,owned,3,p->r.constants,0);}
 JS_FreeValue(ctx,owned);
 if(JS_IsException(result)){JS_FreeValue(ctx,*out);*out=JS_EXCEPTION;R2C(ctx,pc,20);return 1;}
 o->prop[0].u.value=result;R2C(ctx,pc,21);return 1;
}
