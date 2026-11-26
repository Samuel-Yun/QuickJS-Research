/* Runs after the original read/four preparation, leaving shared writes alone.
 * Same-length replacement keeps every branch/exception/debug entry valid. */
static void st_prepare(JSContext *ctx, JSFunctionBytecode *b)
{
    /* Keep every body understood by the frozen whole-constructor parser in
     * its original representation. The store IC supplements other bodies. */
    FourRecipe recipe;
    if (plan_recipe(b, &recipe)) { ST_SKIP_CTOR(); return; }
    uint32_t count = 0, index = 0;
    for (int pos = 0, op; pos < b->byte_code_len; pos += short_opcode_info(op).size) {
        op = b->byte_code_buf[pos]; if (op == OP_put_field) count++;
    }
    if (!count) return;
    StoreSite *sites = js_mallocz_rt(ctx->rt, (size_t)count * sizeof(*sites));
    if (!sites) return; /* optional, no pending exception */
    if (!b->read_ic_sites) {
        size_t size = ((size_t)b->byte_code_len + 7) & ~(size_t)7;
        uint8_t *copy = js_mallocz_rt(ctx->rt, size);
        if (!copy) { js_free_rt(ctx->rt, sites); return; }
        memcpy(copy, b->byte_code_buf, b->byte_code_len);
        b->byte_code_buf = copy;
        b->read_ic_sites = (ReadICSite *)(copy + size); /* zero read records */
        ST_CODE_COPY(size);
    }
    b->store_sites = sites; b->store_count = count; ST_PREPARE(count);
    for (int pos = 0, op; pos < b->byte_code_len; pos += short_opcode_info(op).size) {
        uint8_t *pc = b->byte_code_buf + pos; op = *pc;
        if (op == OP_put_field) {
            /* Transfer this opcode's existing atom reference to its record. */
            sites[index].atom = get_u32(pc + 1); sites[index].pc = pos;
            *pc = OP_put_field_sti; put_u32(pc + 1, index++);
        }
    }
    assert(index == count);
}
static int rdi_prepare(JSContext *ctx, JSFunctionBytecode *b)
{
    int ret = rdi_prepare_inner(ctx, b);
    if (ret == 0) st_prepare(ctx, b);
    return ret;
}
