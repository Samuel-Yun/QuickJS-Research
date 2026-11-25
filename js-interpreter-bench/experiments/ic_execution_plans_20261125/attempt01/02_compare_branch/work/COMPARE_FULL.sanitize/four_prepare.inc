static size_t four_extra_size(JSFunctionBytecode*b)
{
    unsigned n=0;for(int p=0;p<b->byte_code_len;){int op=b->byte_code_buf[p];n+=op==OP_call_constructor;p+=short_opcode_info(op).size;}
    return n>65535?0:n*sizeof(FourSite);
}
static void four_prepare(JSContext*ctx,JSFunctionBytecode*b)
{
    if(!four_extra_size(b))return;b->four_sites=(FourSite*)(b->read_ic_sites+b->read_ic_count);
    for(int p=0;p<b->byte_code_len;){uint8_t*pc=b->byte_code_buf+p;int op=*pc,n=short_opcode_info(op).size;
        if(op==OP_call_constructor){FourSite*s=&b->four_sites[b->four_count];s->pc=p;s->argc=get_u16(pc+1);
#ifdef FOUR_DIAG
            follow_stats[8]++;follow_stats[11]+=sizeof(FourSite);
#endif
#ifdef FOUR_DIAG
            s->diag=four_dnew(ctx,b,p);
#endif
            *pc=OP_four_ctor;put_u16(pc+1,b->four_count++);
        }p+=n;
    }
}
