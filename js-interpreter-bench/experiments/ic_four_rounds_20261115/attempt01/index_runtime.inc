typedef struct FourSite {
    uint32_t pc,end;
    uint16_t class_id;
    uint8_t local,kind,index_tag,value_tag,acc_tag,reserved;
#ifdef FOUR_DIAG
    FourDiag*diag;
#endif
} FourSite;
/* Per-function move-to-front lookup; each record remains bound to its own PC.
 * Neither an element address nor array length is retained. */
static FourSite*four_index_site(JSFunctionBytecode*b,unsigned pc)
{
    FourSite*s=b->four_sites;
    if(s->pc!=pc){unsigned i=1;while(i<b->four_count && s[i].pc!=pc)i++;
        assert(i<b->four_count);FourSite tmp=s[0];s[0]=s[i];s[i]=tmp;
    }return s;
}
static int four_index_try(JSContext*ctx,FourSite*s,JSValue*sp,JSValue*vars,JSValue*out)
{
    FOUR_COUNT(s,q);
    if(JS_VALUE_GET_TAG(sp[-2])!=JS_TAG_OBJECT || JS_VALUE_GET_TAG(sp[-1])!=JS_TAG_INT ||
       JS_VALUE_GET_TAG(sp[-3])!=JS_TAG_INT || JS_VALUE_GET_TAG(vars[s->local])!=JS_TAG_INT)goto fail;
    JSObject*o=JS_VALUE_GET_OBJ(sp[-2]);
    if(o->class_id!=(s->kind?s->class_id:JS_CLASS_ARRAY) || !o->fast_array ||
       js_rc(o)->ref_count<=1 || (uint32_t)JS_VALUE_GET_INT(sp[-1])>=o->u.array.count)goto fail;
    JSValue value=o->u.array.u.values[(uint32_t)JS_VALUE_GET_INT(sp[-1])];
    if(JS_VALUE_GET_TAG(value)!=JS_TAG_INT)goto fail;
    int64_t n=(int64_t)JS_VALUE_GET_INT(sp[-3])+JS_VALUE_GET_INT(value);
    if(n<INT32_MIN || n>INT32_MAX){FOUR_COUNT(s,overflow);goto fail;}
    if(!s->kind){
        s->class_id=o->class_id;s->kind=1;
        s->index_tag=JS_VALUE_GET_TAG(sp[-1]);s->value_tag=JS_VALUE_GET_TAG(value);s->acc_tag=JS_VALUE_GET_TAG(sp[-3]);
        FOUR_COUNT(s,eligible);FOUR_COUNT(s,fill);goto fail;
    }
    *out=JS_NewInt32(ctx,n);FOUR_COUNT(s,h);FOUR_ADD(s,work1,2);FOUR_ADD(s,work2,2);return 1;
fail:
    FOUR_COUNT(s,guard);return 0;
}
static size_t four_extra_size(JSFunctionBytecode*b);
static void four_prepare(JSContext*ctx,JSFunctionBytecode*b);
