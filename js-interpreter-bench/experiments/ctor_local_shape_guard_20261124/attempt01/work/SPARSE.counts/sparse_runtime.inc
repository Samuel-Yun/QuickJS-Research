/* The negative entry owns its target. Only immutable, definitely unsupported
 * bytecode/class is remembered, never prototype/GC/argc-dependent failure. */
static int sparse_same(FourSite*s,JSValueConst c)
{
    return JS_VALUE_GET_TAG(c)==JS_TAG_OBJECT && JS_VALUE_GET_TAG(s->negative)==JS_TAG_OBJECT &&
        JS_VALUE_GET_OBJ(c)==JS_VALUE_GET_OBJ(s->negative);
}
static int four_ctor_try(JSContext*ctx,FourSite*s,JSValueConst c,JSValueConst t,JSValue*a,JSValue*out)
{
    LSG_COUNT(calls);
    if(!s->plan){FOUR_COUNT(s,q);FOUR_COUNT(s,guard);return 0;}
    return plan_try(ctx,s->plan,c,t,a,out);
}
static int four_ctor_slow_eligible(JSContext*ctx,FourSite*s,JSValueConst c,JSValueConst t,unsigned n)
{
    if(sparse_same(s,c)){FOLLOW(2);return 0;}
    return plan_slow_eligible(ctx,c,t,n);
}
static void four_ctor_learn(JSContext*ctx,FourSite*s,JSValueConst c,JSValueConst result)
{
    plan_learn(ctx,s,c,result);
}
static void sparse_remember(JSContext*ctx,FourSite*s,JSValueConst c)
{
    if(sparse_same(s,c) || JS_VALUE_GET_TAG(c)!=JS_TAG_OBJECT)return;
    JSObject*f=JS_VALUE_GET_OBJ(c);FourRecipe r;
    if(f->class_id==JS_CLASS_COLD_BYTECODE_FUNCTION)return;
    if(f->class_id==JS_CLASS_BYTECODE_FUNCTION && plan_recipe(f->u.func.function_bytecode,&r))return;
    JSValue old=s->negative;s->negative=JS_DupValue(ctx,c);FOLLOW(3);JS_FreeValue(ctx,old);
}
