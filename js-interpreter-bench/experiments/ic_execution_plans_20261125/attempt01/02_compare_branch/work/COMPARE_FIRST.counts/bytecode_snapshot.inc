/* Inspection build only. Read live execution buffers after the selected script
 * returns. No DUMP_BYTECODE, opcode/layout changes, or interpreter counters. */
static const char *const bc_opcode_names[] = {
#define FMT(f)
#define DEF(id, size, n_pop, n_push, f) #id,
#include "quickjs-opcode.h"
#undef DEF
#undef FMT
};
static const char *const bc_format_names[] = {
#define FMT(f) #f,
#define DEF(id, size, n_pop, n_push, f)
#include "quickjs-opcode.h"
#undef DEF
#undef FMT
};
_Static_assert(countof(bc_opcode_names) == countof(opcode_info), "opcode names");

static void bc_string(FILE *out, const char *s)
{
    const unsigned char *p = (const unsigned char *)s;
    fputc('"', out);
    for (; *p; p++) {
        if (*p == '"' || *p == '\\') { fputc('\\', out); fputc(*p, out); }
        else if (*p < 32) fprintf(out, "\\u%04x", *p);
        else fputc(*p, out);
    }
    fputc('"', out);
}

static void bc_atom(FILE *out, JSContext *ctx, JSAtom atom)
{
    const char *s = JS_AtomToCString(ctx, atom);
    bc_string(out, s ? s : "<atom unavailable>");
    if (s) JS_FreeCString(ctx, s);
}

#ifdef BC_METHOD
static void bc_shape(FILE *out, JSShape *shape)
{
    if (!shape) { fputs("null", out); return; }
    fprintf(out, "{\"is_hashed\":%s,\"prop_count\":%u}",
            shape->is_hashed ? "true" : "false", shape->prop_count);
}
#endif

static void bc_function(FILE *out, JSContext *ctx, JSFunctionBytecode *b,
                        unsigned id, int parent)
{
    fprintf(out, "{\"id\":%u,\"parent\":%d,\"function\":", id, parent);
    bc_atom(out, ctx, b->func_name);
    fprintf(out, ",\"byte_code_len\":%d,\"arg_count\":%u,\"var_count\":%u,"
                 "\"stack_size\":%u", b->byte_code_len, b->arg_count,
                 b->var_count, b->stack_size);
#ifdef BC_METHOD
    fprintf(out, ",\"ic_ready\":%s,\"ic_count\":%u,\"ctor_count\":%u",
            b->read_ic_ready ? "true" : "false", b->read_ic_count, b->four_count);
#else
    fputs(",\"ic_ready\":null,\"ic_count\":0,\"ctor_count\":0", out);
#endif
    fputs(",\"opcodes\":[", out);
    for (int pos = 0; pos < b->byte_code_len;) {
        int op = b->byte_code_buf[pos], index = op;
        assert(op < OP_COUNT);
        const JSOpCode *oi = &short_opcode_info(op);
        assert(oi->size && pos + oi->size <= b->byte_code_len);
#if SHORT_OPCODES
        if (op >= OP_TEMP_START) index += OP_TEMP_END - OP_TEMP_START;
#endif
        if (pos) fputc(',', out);
        fprintf(out, "{\"pc\":%d,\"name\":", pos);
        bc_string(out, bc_opcode_names[index]);
        fprintf(out, ",\"size\":%u,\"pop\":%u,\"push\":%u,\"format\":",
                oi->size, oi->n_pop, oi->n_push);
        bc_string(out, bc_format_names[oi->fmt]);
        fputs(",\"raw\":\"", out);
        for (int i = 0; i < oi->size; i++) fprintf(out, "%02x", b->byte_code_buf[pos+i]);
        fputc('"', out);
        switch (oi->fmt) {
        case OP_FMT_atom: case OP_FMT_atom_u8: case OP_FMT_atom_u16:
        case OP_FMT_atom_label_u8: case OP_FMT_atom_label_u16:
            fputs(",\"atom\":", out);
            bc_atom(out, ctx, get_u32(b->byte_code_buf+pos+1));
            break;
        default: break;
        }
        JSAtom binding = JS_ATOM_NULL;
        unsigned slot = 0;
        switch (oi->fmt) {
        case OP_FMT_var_ref:
            slot = get_u16(b->byte_code_buf+pos+1);
            if (slot < b->closure_var_count) binding = b->closure_var[slot].var_name;
            break;
        case OP_FMT_none_var_ref:
            slot = (op - OP_get_var_ref0) % 4;
            if (slot < b->closure_var_count) binding = b->closure_var[slot].var_name;
            break;
        case OP_FMT_loc8: case OP_FMT_loc: case OP_FMT_none_loc:
            slot = oi->fmt == OP_FMT_loc8 ? b->byte_code_buf[pos+1] :
                   oi->fmt == OP_FMT_loc ? get_u16(b->byte_code_buf+pos+1) : (op-OP_get_loc0)%4;
            if (b->vardefs && slot < b->var_count) binding = b->vardefs[b->arg_count+slot].var_name;
            break;
        case OP_FMT_arg: case OP_FMT_none_arg:
            slot = oi->fmt == OP_FMT_arg ? get_u16(b->byte_code_buf+pos+1) : (op-OP_get_arg0)%4;
            if (b->vardefs && slot < b->arg_count) binding = b->vardefs[slot].var_name;
            break;
        default: break;
        }
        if (binding) {
            fputs(",\"binding\":", out); bc_atom(out, ctx, binding);
        }
#ifdef BC_METHOD
        if (op == OP_get_field_rdi || op == OP_get_field2_rdi || op == OP_put_field_shared) {
            uint32_t delta = get_u32(b->byte_code_buf+pos+1);
            ReadICSite *site = (ReadICSite *)(b->byte_code_buf+pos+1+delta);
            assert(site >= b->read_ic_sites && site < b->read_ic_sites+b->read_ic_count);
            fprintf(out, ",\"site_index\":%u,\"delta\":%u,\"atom\":",
                    (unsigned)(site-b->read_ic_sites), delta);
            bc_atom(out, ctx, site->atom);
        } else if (op == OP_four_ctor) {
            unsigned i = get_u16(b->byte_code_buf+pos+1);
            assert(i < b->four_count);
            fprintf(out, ",\"constructor_index\":%u,\"argc\":%u", i, b->four_sites[i].argc);
        }
#endif
        fputc('}', out);
        pos += oi->size;
    }
    fputs("],\"read_sites\":[", out);
#ifdef BC_METHOD
    for (unsigned i = 0; i < b->read_ic_count; i++) {
        ReadICSite *s = &b->read_ic_sites[i];
        if (i) fputc(',', out);
        fprintf(out, "{\"index\":%u,\"atom\":", i); bc_atom(out, ctx, s->atom);
        fprintf(out, ",\"offset\":%u,\"shape\":", s->prop_offset); bc_shape(out, s->shape);
        fputs(",\"holder_shape\":", out); bc_shape(out, s->holder_shape);
        fputc('}', out);
    }
#endif
    fputs("],\"constructor_sites\":[", out);
#ifdef BC_METHOD
    for (unsigned i = 0; i < b->four_count; i++) {
        FourSite *s = &b->four_sites[i];
        if (i) fputc(',', out);
        fprintf(out, "{\"index\":%u,\"pc\":%u,\"argc\":%u,\"positive_plan\":%s,"
                     "\"negative_target\":%s}", i, s->pc, s->argc,
                s->plan ? "true" : "false", JS_IsObject(s->negative) ? "true" : "false");
    }
#endif
    fputs("]}\n", out);
}

static void bc_walk(FILE *out, JSContext *ctx, JSFunctionBytecode *b,
                    int parent, unsigned *next)
{
    unsigned id = (*next)++;
    bc_function(out, ctx, b, id, parent);
    for (int i = 0; i < b->cpool_count; i++) {
        JSValueConst value = b->cpool[i];
        if (JS_VALUE_GET_TAG(value) == JS_TAG_FUNCTION_BYTECODE)
            bc_walk(out, ctx, JS_VALUE_GET_PTR(value), id, next);
    }
}

static int bc_after_script(JSContext *ctx, JSValueConst root)
{
    const char *path = getenv("QJS_INSPECT_OUTPUT");
    if (!path || JS_VALUE_GET_TAG(root) != JS_TAG_FUNCTION_BYTECODE) return -1;
    FILE *out = fopen(path, "w");
    if (!out) return -1;
    unsigned next = 0;
    bc_walk(out, ctx, JS_VALUE_GET_PTR(root), -1, &next);
    int failed = ferror(out);
    if (fclose(out)) failed = 1;
    return failed ? -1 : 0;
}
