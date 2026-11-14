typedef struct ExBits { int m,c,a,idx;int32_t bound;const uint8_t *body,*inc,*shift,*end; } ExBits;
static int ex_bits_match(JSFunctionBytecode *,const uint8_t *,ExBits *);
static int ex_bits_match(JSFunctionBytecode *b,const uint8_t *p,ExBits *out)
{
    const uint8_t *end=b->byte_code_buf+b->byte_code_len,*q,*body,*shift;int n,k,a=0,idx=0;int32_t limit=0;
    if(end-p<18 || !(n=ex_integer(p+1,&limit))) return 0;
    q=p+1+n;
    if(q+15>end || q[0]!=OP_lt || q[1]!=OP_if_false8) return 0;
    body=q+3;k=ex_load(body,&a,&idx);
    if(!k) return 0;
    if(body+k+12>end || body[k]<OP_get_loc0 || body[k]>OP_get_loc3 || body[k+1]!=OP_and || body[k+2]!=OP_if_false8 || body[k+4]!=OP_inc_loc) return 0;
    out->m=body[k]-OP_get_loc0;out->c=body[k+5];
    shift=body+k+6;
    if(shift[0]!=OP_get_loc0+out->m || shift[1]!=OP_push_1 || shift[2]!=OP_shl || shift[3]!=OP_put_loc0+out->m || shift[4]!=OP_goto8) return 0;
    if(shift+5+(int8_t)shift[5]!=p || q+2+(int8_t)q[2]!=shift+6 || body+k+3+(int8_t)body[k+3]!=shift) return 0;
    if(*p!=OP_get_loc0+out->m && *p!=OP_int_loop_bits) return 0;
    if(out->m==out->c || out->c>=b->var_count || !b->vardefs) return 0;
    if(a==0 && (idx==out->m || idx==out->c)) return 0;
    if(idx>=(a?b->arg_count:b->var_count) || b->vardefs[(a?0:b->arg_count)+idx].is_captured) return 0;
    if(b->vardefs[b->arg_count+out->m].is_captured || b->vardefs[b->arg_count+out->c].is_captured) return 0;
    out->a=a;out->idx=idx;out->bound=limit;out->body=body;out->inc=body+k+4;out->shift=shift;out->end=shift+6;
    return 1;
}
