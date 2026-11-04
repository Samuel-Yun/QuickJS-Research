/* Diagnostic mechanism controller, never the official OPT runtime.
 * Selected bytecode changes happen after mandatory Setup and before timing.
 * There is no per-read mode test. Cache edges remain intact in both modes. */
static int sp_disable;
static JSValue sp_control(JSContext *ctx,JSValueConst self,int argc,JSValueConst *argv) {
    if(argc!=1 || JS_VALUE_GET_TAG(argv[0])!=JS_TAG_OBJECT)return JS_ThrowTypeError(ctx,"control expects function");
    JSObject *obj=JS_VALUE_GET_OBJ(argv[0]);
    if(obj->class_id!=JS_CLASS_BYTECODE_FUNCTION)return JS_ThrowTypeError(ctx,"bytecode function required");
    JSFunctionBytecode *b=obj->u.func.function_bytecode;
    if(!b->has_debug || b->debug.source_len!=sizeof(sp_target_source)-1 || memcmp(b->debug.source,sp_target_source,sizeof(sp_target_source)-1))return JS_NewInt32(ctx,0);
    unsigned pcs[3]={43,138,147};unsigned selected=0;
    for(unsigned k=0;k<3;k++){
        uint8_t *pc=b->byte_code_buf+pcs[k];if(pcs[k]+5>b->byte_code_len)abort();
        int op=*pc;if(op!=OP_get_field_rdi && op!=OP_get_field2_rdi)abort();
        unsigned index=get_u32(pc+1);if(index>=b->read_ic_count)abort();
        if(sp_disable){
            JSAtom atom=JS_DupAtom(ctx,b->read_ic_sites[index].atom);
            *pc=op==OP_get_field_rdi?OP_get_field:OP_get_field2;
            put_u32(pc+1,atom);
        }
        selected++;
    }
    return JS_NewInt32(ctx,selected);
}
void sp_control_install(JSContext *ctx) {
    const char *mode=getenv("SP_DISABLE");
    if(!mode || (strcmp(mode,"0")&&strcmp(mode,"1"))){fprintf(stderr,"SP_DISABLE must be 0 or 1\n");exit(2);}
    sp_disable=mode[0]=='1';JSValue g=JS_GetGlobalObject(ctx);
    if(JS_SetPropertyStr(ctx,g,"__spControl",JS_NewCFunction(ctx,sp_control,"__spControl",1))<0)abort();
    JS_FreeValue(ctx,g);
}
