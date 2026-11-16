typedef struct FourIndexProbe {unsigned owner,pc;int cls,itag,vtag;FourDiag*diag;struct FourIndexProbe*next;} FourIndexProbe;
static FourIndexProbe *four_index_buckets[65536];static unsigned four_index_identity;
static void four_index_observe(JSContext*ctx,JSFunctionBytecode*b,const uint8_t*pc,JSValue*sp,JSValue*vars)
{
    if(!four_active)return;int cls=-1,itag=JS_VALUE_GET_TAG(sp[-1]),vtag=-999;JSValue value=JS_UNDEFINED;
    if(JS_VALUE_GET_TAG(sp[-2])==JS_TAG_OBJECT){JSObject*o=JS_VALUE_GET_OBJ(sp[-2]);cls=o->class_id;
        if(cls==JS_CLASS_ARRAY && o->fast_array && itag==JS_TAG_INT && (uint32_t)JS_VALUE_GET_INT(sp[-1])<o->u.array.count){
            value=o->u.array.u.values[(uint32_t)JS_VALUE_GET_INT(sp[-1])];vtag=JS_VALUE_GET_TAG(value);
        }
    }
    if(!b->four_count)b->four_count=++four_index_identity;
    unsigned pos=pc-b->byte_code_buf,key=(b->four_count*7159u+pos*131u+cls*7u+itag*11u+vtag*17u)&65535;
    FourIndexProbe*s;for(s=four_index_buckets[key];s;s=s->next)if(s->owner==b->four_count && s->pc==pos && s->cls==cls && s->itag==itag && s->vtag==vtag)break;
    if(!s){s=calloc(1,sizeof(*s));assert(s);s->owner=b->four_count;s->pc=pos;s->cls=cls;s->itag=itag;s->vtag=vtag;s->diag=four_dnew(ctx,b,pos);
        char text[96];snprintf(text,sizeof(text),"class=%d,index_tag=%d,element_tag=%d",cls,itag,vtag);s->diag->target=strdup(text);
        s->next=four_index_buckets[key];four_index_buckets[key]=s;
    }
    s->diag->q++;s->diag->guard++;
    int local=-1;
    if(pos+3<=b->byte_code_len && pc[1]==OP_add){
        if(pc[2]>=OP_put_loc0 && pc[2]<=OP_put_loc3)local=pc[2]-OP_put_loc0;
        else if(pos+4<=b->byte_code_len && pc[2]==OP_put_loc8)local=pc[3];
    }
    if(local>=0 && local<b->var_count && vtag==JS_TAG_INT &&
       JS_VALUE_GET_TAG(sp[-3])==JS_TAG_INT && JS_VALUE_GET_TAG(vars[local])==JS_TAG_INT &&
       js_rc(JS_VALUE_GET_OBJ(sp[-2]))->ref_count>1){
        int64_t n=(int64_t)JS_VALUE_GET_INT(value)+JS_VALUE_GET_INT(sp[-3]);
        if(n>=INT32_MIN && n<=INT32_MAX)s->diag->eligible++;else s->diag->overflow++;
    }
}
