/* Permanent dequickening. Called before the threshold miss performs a lookup. */
static BOOL rdi_exit(JSContext *ctx, JSFunctionBytecode *b, uint32_t index,
                     uint8_t *instruction RDI_DPARAM)
{
    ReadICSite *site=&b->read_ic_sites[index];
    int op=*instruction;
    if(op==OP_get_field || op==OP_get_field2)
        return FALSE; /* completed earlier, including a reentrant invocation */
    assert((op==OP_get_field_rdi || op==OP_get_field2_rdi) && get_u32(instruction+1)==index);
    assert(site->miss_streak==32);
    JSAtom atom=JS_DupAtom(ctx,site->atom);
    JSShape *old_shape=site->shape;
    site->shape=NULL;
    site->prop_offset=0;
    put_u32(instruction+1,atom);
    *instruction=(op==OP_get_field_rdi)?OP_get_field:OP_get_field2;
    RDI_EXIT_RECORD(instruction,old_shape);
    /* No partially updated opcode/site may be visible when references are released. */
    js_free_shape_null(ctx->rt,old_shape);
    return TRUE;
}
