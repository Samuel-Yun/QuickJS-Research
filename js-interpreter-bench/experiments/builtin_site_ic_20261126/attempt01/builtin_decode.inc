static int bic_boundary(JSFunctionBytecode*b,uint32_t off){
    uint32_t p=0;
    while(p<off){unsigned op=b->byte_code_buf[p];if(op>=OP_COUNT)return 0;unsigned n=short_opcode_info(op).size;if(!n||n>(uint32_t)b->byte_code_len-p)return 0;p+=n;}
    return p==off;
}
