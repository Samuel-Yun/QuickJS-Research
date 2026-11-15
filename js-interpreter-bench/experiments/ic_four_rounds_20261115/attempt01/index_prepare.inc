static int four_index_match(JSFunctionBytecode*b,int pc,int*local,int*end)
{
    uint8_t*p=b->byte_code_buf+pc;
    if(pc+3>b->byte_code_len || p[0]!=OP_get_array_el || p[1]!=OP_add)return 0;
    if(p[2]>=OP_put_loc0 && p[2]<=OP_put_loc3){*local=p[2]-OP_put_loc0;*end=pc+3;}
    else if(pc+4<=b->byte_code_len && p[2]==OP_put_loc8){*local=p[3];*end=pc+4;}
    else return 0;
    return *local<b->var_count && !four_interior_target(b,pc,*end);
}
static size_t four_extra_size(JSFunctionBytecode*b)
{
    unsigned n=0;for(int p=0;p<b->byte_code_len;){int op=b->byte_code_buf[p],local,end;n+=four_index_match(b,p,&local,&end);p+=short_opcode_info(op).size;}
    return n*sizeof(FourSite);
}
static void four_prepare(JSContext*ctx,JSFunctionBytecode*b)
{
    b->four_sites=(FourSite*)(b->read_ic_sites+b->read_ic_count);
    for(int p=0;p<b->byte_code_len;){int op=b->byte_code_buf[p],local,end,n=short_opcode_info(op).size;
        if(four_index_match(b,p,&local,&end)){FourSite*s=&b->four_sites[b->four_count++];s->pc=p;s->end=end;s->local=local;
#ifdef FOUR_DIAG
            s->diag=four_dnew(ctx,b,p);
#endif
            b->byte_code_buf[p]=OP_four_index;
        }p+=n;
    }
}
