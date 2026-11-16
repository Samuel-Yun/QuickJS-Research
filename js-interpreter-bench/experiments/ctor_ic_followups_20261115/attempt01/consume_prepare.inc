/* Two fixed straight-line consumers; no general escape analysis. */
static int consume_read_atom(JSFunctionBytecode*b,int pos,JSAtom*a)
{
    if(pos+5>b->byte_code_len || b->byte_code_buf[pos]!=OP_get_field_rdi)return 0;
    uint8_t*p=b->byte_code_buf+pos;ReadICSite*s=(ReadICSite*)(p+1+get_u32(p+1));*a=s->atom;return 1;
}
static int consume_slot(const uint8_t*p,int store,int*index)
{
    int op=*p,base=store?OP_put_loc0:OP_get_loc0;
    if(!store && op==OP_v6_get_loc0)op=OP_get_loc0;
    if(op>=base && op<=base+3){*index=op-base;return 1;}
    if(op==(store?OP_put_loc:OP_get_loc)){*index=get_u16(p+1);return 3;}
    if(op==(store?OP_put_loc8:OP_get_loc8)){*index=p[1];return 2;}
    return 0;
}
static void consume_prepare(JSFunctionBytecode*b,FourSite*s)
{
    int start=s->pc+3,end=start;JSAtom atom;
    if(consume_read_atom(b,start,&atom)){s->consume_kind=1;end+=5;}
    else{
        int index,index2,n,n2;
        if(start>=b->byte_code_len || !(n=consume_slot(b->byte_code_buf+start,1,&index)) ||
           start+n>=b->byte_code_len || !(n2=consume_slot(b->byte_code_buf+start+n,0,&index2)) || index!=index2 ||
           !consume_read_atom(b,start+n+n2,&atom))return;
        /* No debug variable definition / eval / captured local: reject. */
        if(!b->vardefs || index>=b->var_count || b->vardefs[b->arg_count+index].is_captured ||
           b->is_direct_or_indirect_eval || b->var_ref_count)return;
        int touches=0;
        for(int p=0;p<b->byte_code_len;){
            int op=b->byte_code_buf[p],fmt=short_opcode_info(op).fmt,j=-1;
            if(consume_slot(b->byte_code_buf+p,0,&j) || consume_slot(b->byte_code_buf+p,1,&j)){if(j==index)touches++;}
            else if((fmt==OP_FMT_loc || fmt==OP_FMT_loc8) &&
                    (fmt==OP_FMT_loc?get_u16(b->byte_code_buf+p+1):b->byte_code_buf[p+1])==index)return;
            p+=short_opcode_info(op).size;
        }
        if(touches!=2)return;
        s->consume_kind=2;end=start+n+n2+5;
    }
    if(four_interior_target(b,s->pc,end)){s->consume_kind=3;return;}
    s->consume_atom=atom;
}
