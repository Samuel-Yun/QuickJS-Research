/* Bounded final-before-prepare / final-after-prepare snapshots, never timings. */
static void prep_hex(FILE *f,const void *v,size_t n) {
    const unsigned char *p=v;for(size_t i=0;i<n;i++)fprintf(f,"%02x",p[i]);
}
static void prepare_snapshot(JSContext *ctx,JSFunctionBytecode *b,int stage) {
    const char *path=getenv("IC_PREPARE_REPORT");if(!path)return;
    const char *name=JS_AtomToCString(ctx,b->func_name);if(!name)abort();
    const char *source=(b->has_debug && b->debug.source)?b->debug.source:"";
    size_t n=(b->has_debug && b->debug.source)?b->debug.source_len:0;
    const char *needle="function () {\n  return (this.state & STATE_HELD) != 0";
    int selected=!strcmp(name,"m1Read") || (n>=strlen(needle) && !memcmp(source,needle,strlen(needle)));
    if(!selected){JS_FreeCString(ctx,name);return;}
    FILE *f=fopen(path,"a");if(!f)abort();
    fprintf(f,"{\"stage\":%d,\"function_hex\":\"",stage);prep_hex(f,name,strlen(name));
    fprintf(f,"\",\"source_hex\":\"");prep_hex(f,source,n);
    fprintf(f,"\",\"code_hex\":\"");prep_hex(f,b->byte_code_buf,b->byte_code_len);
    fprintf(f,"\",\"opcodes\":[");
    for(unsigned pc=0;pc<b->byte_code_len;){
        unsigned op=b->byte_code_buf[pc],size=short_opcode_info(op).size;
        if(!size || pc+size>b->byte_code_len)abort();
        if(pc)fprintf(f,",");
        fprintf(f,"{\"pc\":%u,\"size\":%u,\"op\":\"%s\",\"operand32\":%u,\"atom_hex\":\"",pc,size,short_opcode_info(op).name,size>=5?get_u32(b->byte_code_buf+pc+1):0);
        if(op==OP_get_field||op==OP_get_field2||op==OP_get_field_rdi||op==OP_get_field2_rdi){
            JSAtom atom=get_u32(b->byte_code_buf+pc+1);
            if(stage)atom=b->read_ic_sites[atom].atom;
            const char *a=JS_AtomToCString(ctx,atom);if(!a)abort();prep_hex(f,a,strlen(a));JS_FreeCString(ctx,a);
        }
        fprintf(f,"\"}");pc+=size;
    }
    fprintf(f,"]}\n");fclose(f);JS_FreeCString(ctx,name);
}
