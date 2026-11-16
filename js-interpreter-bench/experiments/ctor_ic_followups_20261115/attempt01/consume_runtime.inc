static void consume_observe(JSContext*ctx,FourSite*s,JSValueConst callee,JSValueConst target,JSValueConst result)
{
    FOLLOW(0);
    if(s->consume_kind==3){FOLLOW(5);return;}
    if(!s->consume_kind)return;
    FOLLOW(s->consume_kind); /* 1 immediate, 2 sole-use local bridge */
    if(JS_VALUE_GET_TAG(callee)!=JS_TAG_OBJECT || JS_VALUE_GET_TAG(target)!=JS_TAG_OBJECT ||
       JS_VALUE_GET_OBJ(callee)!=JS_VALUE_GET_OBJ(target))return;
    JSObject*f=JS_VALUE_GET_OBJ(callee);FourRecipe r;
    if(f->class_id!=JS_CLASS_BYTECODE_FUNCTION){FOLLOW(7);return;}
    if(!four_ctor_recipe(f->u.func.function_bytecode,&r)){FOLLOW(8);return;}
    FOLLOW(3);
    int mapped=0;for(unsigned i=0;i<r.n;i++)if(r.atom[i]==s->consume_atom)mapped=1;
    if(!mapped){FOLLOW(9);return;}
    if(JS_VALUE_GET_TAG(result)!=JS_TAG_OBJECT)return;
    JSObject*o=JS_VALUE_GET_OBJ(result);JSProperty*pr;JSShapeProperty*d=find_own_property(&pr,o,s->consume_atom);
    if(o->class_id==JS_CLASS_OBJECT && !o->is_exotic && d && d->flags==JS_PROP_C_W_E){FOLLOW(4);}
}
