/* After short_opcode_info: registration uses FINAL bytecode and actual widths.
 * This only copies metadata. It does not modify instructions/operands. */
static unsigned sa_register(JSContext *ctx, JSFunctionBytecode *b) {
    unsigned id, off; int col, line;
    SAFunc *f;
    if(!sa_enabled) return 0;
    if(sa_nfun+1>=SA_NFUN) abort();
    id=++sa_nfun; f=&sa_fun[id]; f->ptr=b; f->id=id;
    unsigned slot=((uintptr_t)b >> 4)&2047;
    while(sa_fslots[slot] && sa_fun[sa_fslots[slot]].ptr!=b)slot=(slot+1)&2047;
    sa_fslots[slot]=id;
    f->line=find_line_num(ctx,b,-1,&f->col); f->len=b->byte_code_len;
    const char *name=JS_AtomToCString(ctx,b->func_name);
    const char *file=b->has_debug?JS_AtomToCString(ctx,b->debug.filename):NULL;
    f->name=strdup(name?name:""); f->filename=strdup(file?file:"");
    f->is_run=!strcmp(f->name,"runRichards");
    JS_FreeCString(ctx,name);JS_FreeCString(ctx,file);
    f->source=b->has_debug && b->debug.source?strndup(b->debug.source,b->debug.source_len):strdup("");
    f->hex=calloc(2*f->len+1,1);f->sites=calloc(f->len+1,sizeof(unsigned));
    for(off=0;off<f->len;off++)sprintf(f->hex+2*off,"%02x",b->byte_code_buf[off]);
    for(off=0;off<f->len;) {
        unsigned op=b->byte_code_buf[off]; const JSOpCode *oi=&short_opcode_info(op);
        if(!oi->size || off+oi->size>f->len)abort();
        if(op==OP_get_field || op==OP_get_field2 || op==OP_put_field || op==OP_get_length) {
            if(sa_nsite+1>=SA_NSITE)abort();
            SASite *s=&sa_site[++sa_nsite]; f->sites[off]=s->id=sa_nsite;
            s->fid=id;s->offset=off;s->opcode=op;s->name=strdup(oi->name);
            JSAtom atom=op==OP_get_length?JS_ATOM_length:get_u32(b->byte_code_buf+off+1);
            const char *prop=JS_AtomToCString(ctx,atom);s->property=strdup(prop?prop:"UNKNOWN");JS_FreeCString(ctx,prop);
            line=find_line_num(ctx,b,off,&col);s->line=line;s->col=col;
        }
        off+=oi->size;
    }
    return id;
}
