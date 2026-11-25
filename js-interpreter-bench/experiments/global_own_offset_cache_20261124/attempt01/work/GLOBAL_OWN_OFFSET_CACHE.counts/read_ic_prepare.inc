/* Called only for fully built b, after all compiler passes / atom fixups. */
static int rdi_prepare(JSContext *ctx, JSFunctionBytecode *b)
{
    uint32_t count = 0, index = 0;
    size_t code_size, total;
    uint8_t *linked;
    int pos, op;
    ReadICSite *last_read = NULL;
    assert(!b->read_ic_ready && !b->read_ic_sites);
    b->read_ic_ready = 1;
#ifdef READ_IC_DIAGNOSTIC
    rdi_diag_header_init();
#endif
    for (pos = 0; pos < b->byte_code_len; pos += short_opcode_info(op).size) {
        op = b->byte_code_buf[pos];
        if (op == OP_get_field || op == OP_get_field2) count++;
    }
    if (!count && !four_extra_size(b)) return 0;
    code_size = ((size_t)b->byte_code_len + 7) & ~(size_t)7;
    if (count > (SIZE_MAX - code_size) / sizeof(ReadICSite)) {
        return 0; /* optional optimization, retain ordinary image */
    }
    total = code_size + count * sizeof(ReadICSite) + four_extra_size(b);
    if (total > UINT32_MAX) {
        return 0; /* optional optimization, retain ordinary image */
    }
    linked = js_mallocz_rt(ctx->rt, total);
    if (!linked) return 0; /* no pending-exception mutation, no retry */
    memcpy(linked, b->byte_code_buf, b->byte_code_len);
    b->byte_code_buf = linked;
    b->read_ic_sites = (ReadICSite *)(linked + code_size);
    b->read_ic_count = count;
#ifdef READ_IC_DIAGNOSTIC
    rdi_diag_prepare(ctx, b);
#endif
    for (pos = 0; pos < b->byte_code_len; pos += short_opcode_info(op).size) {
        uint8_t *pc = b->byte_code_buf + pos;
        op = *pc;
        /* The following instruction is still ordinary, not rewritten yet.
           Both replacements preserve instruction lengths and branch entries. */
        if ((op == OP_get_loc0 || op == OP_get_arg0) &&
            pos + 1 < b->byte_code_len && pc[1] == OP_get_field) {
            *pc = (op == OP_get_loc0) ? OP_v6_get_loc0 : OP_v6_get_arg0;
        }
        if (op == OP_get_field || op == OP_get_field2) {
            b->read_ic_sites[index].atom = get_u32(pc + 1);
            *pc = (op == OP_get_field) ? OP_get_field_rdi : OP_get_field2_rdi;
            last_read = &b->read_ic_sites[index];
            put_u32(pc + 1, (uint8_t *)&b->read_ic_sites[index++] - (pc + 1));
            go_diag_register(ctx,b,index-1,pos);
        } else if (op == OP_put_field && last_read &&
                   get_u32(pc + 1) == last_read->atom) {
            /* The read site retains this atom. The rewritten write no longer does. */
            JS_FreeAtom(ctx, get_u32(pc + 1));
            *pc = OP_put_field_shared;
            put_u32(pc + 1, (uint8_t *)last_read - (pc + 1));
        }
    }
    assert(index == count);
    four_prepare(ctx,b);
    return 0;
}
