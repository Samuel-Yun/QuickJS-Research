static void rdi_diag_prepare(JSContext *ctx, JSFunctionBytecode *b)
{
    unsigned atoms=0,j=0,index=0;int pos,op;
    RDIFunctionDiag *f=calloc(1,sizeof(*f)+b->read_ic_count*sizeof(RDICounters));if(!f)abort();
    f->id=rdi_diag_functions;f->site_count=b->read_ic_count;f->bc_len=b->byte_code_len;
    f->source_id=rdi_diag_source(b);f->name=rdi_diag_atom(ctx,b->func_name);
    f->filename=b->has_debug?rdi_diag_atom(ctx,b->debug.filename):strdup("");
    f->code=calloc(1,f->bc_len);if(!f->code||!f->filename)abort();memcpy(f->code,b->byte_code_buf,f->bc_len);
    for(pos=0;pos<b->byte_code_len;pos+=short_opcode_info(op).size) {
        op=b->byte_code_buf[pos];unsigned fmt=short_opcode_info(op).fmt;
        if(fmt==OP_FMT_atom||fmt==OP_FMT_atom_u8||fmt==OP_FMT_atom_u16||fmt==OP_FMT_atom_label_u8||fmt==OP_FMT_atom_label_u16)atoms++;
    }
    f->atom_count=atoms;f->atoms=calloc(atoms,sizeof(RDIAtomMap));if(atoms&&!f->atoms)abort();
    for(pos=0;pos<b->byte_code_len;pos+=short_opcode_info(op).size) {
        op=b->byte_code_buf[pos];unsigned fmt=short_opcode_info(op).fmt;
        if(fmt==OP_FMT_atom||fmt==OP_FMT_atom_u8||fmt==OP_FMT_atom_u16||fmt==OP_FMT_atom_label_u8||fmt==OP_FMT_atom_label_u16) {
            f->atoms[j].pc=pos;f->atoms[j].name=rdi_diag_atom(ctx,get_u32(b->byte_code_buf+pos+1));j++;
            memset(f->code+pos+1,0,4);
        }
        if(op==OP_get_field||op==OP_get_field2) {
            RDICounters *d=&f->sites[index++];d->pc=pos;d->op=op;
            d->atom=rdi_diag_atom(ctx,get_u32(b->byte_code_buf+pos+1));
        }
    }
    assert(index==b->read_ic_count);f->next=rdi_diag_head;rdi_diag_head=f;b->read_ic_diag=f;
    rdi_diag_sites+=b->read_ic_count;rdi_diag_add_bytes(b->read_ic_count*sizeof(ReadICSite));
}
