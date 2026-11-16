/* Mechanism-only controller. Ordinary bytecode and IC site retain independent
 * atom ownership. Repeating the same configuration never dup's an atom twice.
 * Exact target source/opcode/operand specifications are generated from saved dump.
 */
static int sp_disable;
static JSFunctionBytecode *sp_control_b;
static void sp_control_forget(void *ptr){if(sp_control_b==ptr)sp_control_b=NULL;}
static JSValue sp_control(JSContext *ctx,JSValueConst self,int argc,JSValueConst *argv){
    if(argc!=1||JS_VALUE_GET_TAG(argv[0])!=JS_TAG_OBJECT)return JS_ThrowTypeError(ctx,"control expects function");
    JSObject *obj=JS_VALUE_GET_OBJ(argv[0]);if(obj->class_id!=JS_CLASS_BYTECODE_FUNCTION)return JS_ThrowTypeError(ctx,"bytecode function required");
    JSFunctionBytecode *b=obj->u.func.function_bytecode;
    if(!b->has_debug||b->debug.source_len!=sizeof(sp_target_source)-1||memcmp(b->debug.source,sp_target_source,sizeof(sp_target_source)-1))return JS_NewInt32(ctx,0);
    if(sp_control_b && sp_control_b!=b)return JS_ThrowTypeError(ctx,"multiple target instances");
    if(b->byte_code_len!=sp_expected_length)return JS_ThrowTypeError(ctx,"target length");
    /* Validate every opcode start and non-atom operand, except the three
     * already-restored sites on a repeated OFF call. No guessing by PC/name. */
    for(unsigned j=0;j<sizeof(sp_expected_ops)/sizeof(sp_expected_ops[0]);j++){
        const SPSpec *spec=&sp_expected_ops[j];const uint8_t *pc=b->byte_code_buf+spec->pc;
        int selected=-1;for(unsigned k=0;k<3;k++)if(spec->pc==sp_control_pcs[k])selected=k;
        if(selected>=0 && sp_disable && *pc==OP_get_field){
            unsigned index=sp_control_indices[selected];if(index>=b->read_ic_count||get_u32(pc+1)!=b->read_ic_sites[index].atom)return JS_ThrowTypeError(ctx,"restored atom");
        }else{
            if(*pc!=spec->op)return JS_ThrowTypeError(ctx,"target opcode");
            if(!spec->atom && memcmp(pc+1,sp_expected_code+spec->pc+1,spec->size-1))return JS_ThrowTypeError(ctx,"target operand");
        }
    }
    for(unsigned k=0;k<3;k++){
        unsigned index=sp_control_indices[k];if(index>=b->read_ic_count)return JS_ThrowTypeError(ctx,"target site");
        ReadICSite *site=&b->read_ic_sites[index];uint8_t *pc=b->byte_code_buf+sp_control_pcs[k];
        const char *name=JS_AtomToCString(ctx,site->atom);if(!name)return JS_EXCEPTION;
        int ok=!strcmp(name,k==2?"right":"key");JS_FreeCString(ctx,name);if(!ok)return JS_ThrowTypeError(ctx,"target property");
        /* Actual target sites are all get_field (5 bytes, receiver consumed).
         * Reject get_field2 instead of silently changing receiver semantics. */
        if(*pc==OP_get_field_rdi){
            if(get_u32(pc+1)!=index)return JS_ThrowTypeError(ctx,"target index");
            if(sp_disable){JSAtom atom=JS_DupAtom(ctx,site->atom);*pc=OP_get_field;put_u32(pc+1,atom);}
        }else if(!sp_disable||*pc!=OP_get_field||get_u32(pc+1)!=site->atom)return JS_ThrowTypeError(ctx,"target state");
    }
    sp_control_b=b;return JS_NewInt32(ctx,3);
}
void sp_control_install(JSContext *ctx){
    const char *mode=getenv("SP_DISABLE");if(!mode||(strcmp(mode,"0")&&strcmp(mode,"1"))){fprintf(stderr,"SP_DISABLE must be 0 or 1\n");exit(2);}
    sp_disable=mode[0]=='1';JSValue g=JS_GetGlobalObject(ctx);
    if(JS_SetPropertyStr(ctx,g,"__spControl",JS_NewCFunction(ctx,sp_control,"__spControl",1))<0)abort();JS_FreeValue(ctx,g);
}
