/* Called only for fully built b, after all compiler passes / atom fixups. */
static int rdi_prepare(JSContext *ctx, JSFunctionBytecode *b)
{
    uint32_t count = 0, index = 0;
    int pos, op;
    assert(!b->read_ic_ready && !b->read_ic_sites);
    b->read_ic_ready = 1;
#ifdef READ_IC_DIAGNOSTIC
    rdi_diag_header_init();
#endif
    for (pos = 0; pos < b->byte_code_len; pos += short_opcode_info(op).size) {
        op = b->byte_code_buf[pos];
        if (op == OP_get_field || op == OP_get_field2) count++;
    }
    if (!count) return 0;
    if (count > SIZE_MAX / sizeof(ReadICSite)) {
        JS_ThrowOutOfMemory(ctx);
        return -1;
    }
    b->read_ic_sites = js_mallocz(ctx, count * sizeof(ReadICSite));
    if (!b->read_ic_sites) return -1;
    b->read_ic_count = count;
#ifdef READ_IC_DIAGNOSTIC
    rdi_diag_prepare(ctx, b);
#endif
    for (pos = 0; pos < b->byte_code_len; pos += short_opcode_info(op).size) {
        uint8_t *pc = b->byte_code_buf + pos;
        op = *pc;
        if (op == OP_get_field || op == OP_get_field2) {
            b->read_ic_sites[index].atom = get_u32(pc + 1);
            *pc = (op == OP_get_field) ? OP_get_field_rdi : OP_get_field2_rdi;
            put_u32(pc + 1, index++);
        }
    }
    assert(index == count);
    return 0;
}
