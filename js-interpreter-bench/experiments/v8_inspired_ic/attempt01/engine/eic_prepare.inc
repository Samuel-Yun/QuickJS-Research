static int eic_prepare(JSContext *ctx, JSFunctionBytecode *b)
{
    uint32_t count = 0, index = 0;
    int pos, op;
    for (pos = 0; pos < b->byte_code_len; pos += short_opcode_info(op).size) {
        op = b->byte_code_buf[pos];
        if (op == OP_get_field || op == OP_get_field2 || op == OP_put_field) count++;
    }
    if (!count) return 0;
    if (count > SIZE_MAX / sizeof(EICMeta)) { JS_ThrowOutOfMemory(ctx); return -1; }
    b->eic_meta = js_mallocz(ctx, (size_t)count * sizeof(EICMeta));
    if (!b->eic_meta) return -1;
    b->eic_count = count;
    EIC_COUNT(metadata); eic_account((int64_t)count * sizeof(EICMeta));
    for (pos = 0; pos < b->byte_code_len; pos += short_opcode_info(op).size) {
        uint8_t *pc = b->byte_code_buf + pos;
        op = *pc;
        if (op == OP_get_field || op == OP_get_field2 || op == OP_put_field) {
            b->eic_meta[index].atom = get_u32(pc + 1); /* transfer bytecode atom owner */
            b->eic_meta[index].pc = pos;
            *pc = op == OP_get_field ? OP_get_field_eic :
                op == OP_get_field2 ? OP_get_field2_eic : OP_put_field_eic;
            put_u32(pc + 1, index++);
        }
    }
    assert(index == count);
    return 0;
}
