typedef struct FourSite {
    JSShape *shape;
    ReadICSite *one,*two;
    uint32_t offset1,offset2,pc,end;
#ifdef FOUR_DIAG
    FourDiag *diag;
#endif
} FourSite;
static int four_group_try(JSContext *ctx,FourSite *s,JSValueConst obj,JSValue *v1,JSValue *v2)
{
    FOUR_COUNT(s,q);
    if(JS_VALUE_GET_TAG(obj)==JS_TAG_OBJECT){
        JSObject *p=JS_VALUE_GET_OBJ(obj);
        if(p->class_id==JS_CLASS_OBJECT && !p->is_exotic){
            if(s->shape==p->shape){
#ifndef FOUR_PROBE
                JSProperty *prop=p->prop;
                *v1=JS_DupValue(ctx,prop[s->offset1].u.value);
                *v2=JS_DupValue(ctx,prop[s->offset2].u.value);
                FOUR_COUNT(s,h);return 1;
#endif
            }
            if(p->shape->is_hashed){
                JSProperty *a,*b;
                JSShapeProperty *da=find_own_property(&a,p,s->one->atom);
                JSShapeProperty *db=find_own_property(&b,p,s->two->atom);
                if(da && db && !(da->flags&JS_PROP_TMASK) && !(db->flags&JS_PROP_TMASK)){
                    FOUR_COUNT(s,eligible);
#ifndef FOUR_PROBE
                    JSShape *old=s->shape;s->shape=js_dup_shape(p->shape);
                    s->offset1=a-p->prop;s->offset2=b-p->prop;
                    js_free_shape_null(ctx->rt,old);FOUR_COUNT(s,fill);
                    /* Cold fill retains the original sequence, separating
                     * learning from actual grouped executions. */
#endif
                }
            }
        }
    }
    FOUR_COUNT(s,guard);return 0;
}
static size_t four_extra_size(JSFunctionBytecode *b);
static void four_prepare(JSContext *ctx,JSFunctionBytecode *b);
