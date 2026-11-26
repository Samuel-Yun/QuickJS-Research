/* Final-bytecode preparation. On allocation failure no opcode is rewritten. */
static int rdi_prepare(JSContext *ctx, JSFunctionBytecode *b)
{
    uint32_t count = 0, index = 0;
    int pos, op;
    assert(!b->read_ic_ready && !b->read_ic_sites);
    b->read_ic_ready = 1;
    for (pos = 0; pos < b->byte_code_len; pos += short_opcode_info(op).size) {
        op = b->byte_code_buf[pos];
        if (op == OP_get_field || op == OP_get_field2) count++;
    }
    if (!count) return 0;
    size_t code_size = SEARCH_PC_REL ? (((size_t)b->byte_code_len + 7) & ~(size_t)7) : 0;
    size_t atom_size = SEARCH_LAYOUT == 2 ? (size_t)count * sizeof(JSAtom) : 0;
    if (count > (SIZE_MAX - code_size - atom_size - 7 - SEARCH_TABLE_ENTRIES * sizeof(SearchEntry)) / sizeof(ReadICSite)) {
        JS_ThrowOutOfMemory(ctx); return -1;
    }
    size_t table_start = (code_size + count * sizeof(ReadICSite) + atom_size + 7) & ~(size_t)7;
    size_t total = table_start + SEARCH_TABLE_ENTRIES * sizeof(SearchEntry);
    if (total > UINT32_MAX) { JS_ThrowOutOfMemory(ctx); return -1; }
    uint8_t *linked = js_mallocz(ctx, total);
    if (!linked) return -1;
#if SEARCH_PC_REL
    memcpy(linked, b->byte_code_buf, b->byte_code_len);
    b->byte_code_buf = linked;
#endif
    b->read_ic_sites = (ReadICSite *)(linked + code_size);
    b->read_ic_count = count;
#if SEARCH_LAYOUT == 2
    b->read_ic_atoms = (JSAtom *)(b->read_ic_sites + count);
#endif
#if SEARCH_TABLE_ENTRIES
    b->read_ic_shared = (SearchEntry *)(linked + table_start);
    b->read_ic_shared_cursor = 0;
#endif
    for (pos = 0; pos < b->byte_code_len; pos += short_opcode_info(op).size) {
        uint8_t *pc = b->byte_code_buf + pos;
        op = *pc;
        if (op == OP_get_field || op == OP_get_field2) {
            JSAtom atom = get_u32(pc + 1);
#if SEARCH_LAYOUT == 2
            b->read_ic_atoms[index] = atom;
#else
            b->read_ic_sites[index].atom = atom;
#endif
#if SEARCH_HINT_SCOPE == 3
            b->read_ic_sites[index].hint_owner = &b->read_ic_sites[index];
            for (uint32_t j = 0; j < index; j++)
                if (rdi_atom(b, &b->read_ic_sites[j]) == atom) {
                    b->read_ic_sites[index].hint_owner = b->read_ic_sites[j].hint_owner;
                    break;
                }
#endif
            *pc = op == OP_get_field ? OP_get_field_rdi : OP_get_field2_rdi;
#if SEARCH_PC_REL
            put_u32(pc + 1, (uint8_t *)&b->read_ic_sites[index] - (pc + 1));
#else
            put_u32(pc + 1, index);
#endif
            index++;
        }
    }
    assert(index == count);
    return 0;
}
