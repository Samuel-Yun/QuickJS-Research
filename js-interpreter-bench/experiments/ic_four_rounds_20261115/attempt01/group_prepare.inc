static int four_load(const uint8_t*p,int*kind,int*index)
{
    int op=*p;
    if(op==OP_v6_get_arg0)op=OP_get_arg0;
    if(op==OP_v6_get_loc0)op=OP_get_loc0;
    if(op>=OP_get_arg0 && op<=OP_get_arg3){*kind=1;*index=op-OP_get_arg0;return 1;}
    if(op>=OP_get_loc0 && op<=OP_get_loc3){*kind=0;*index=op-OP_get_loc0;return 1;}
    if(op==OP_get_arg || op==OP_get_loc){*kind=op==OP_get_arg;*index=get_u16(p+1);return 3;}
    return 0;
}
/* All branch/catch targets strictly inside a group exclude it. Interior
 * instructions remain real instructions, with their original stack effects. */
static int four_interior_target(JSFunctionBytecode*b,int begin,int end)
{
    for(int p=0;p<b->byte_code_len;){
        int op=b->byte_code_buf[p],fmt=short_opcode_info(op).fmt,target=-1;
        const uint8_t *v=b->byte_code_buf+p;
        if(fmt==OP_FMT_label)target=p+1+(int32_t)get_u32(v+1);
        else if(fmt==OP_FMT_label8)target=p+1+(int8_t)v[1];
        else if(fmt==OP_FMT_label16)target=p+1+(int16_t)get_u16(v+1);
        else if(fmt==OP_FMT_atom_label_u8)target=p+5+(int32_t)get_u32(v+5);
        if(target>begin && target<end)return 1;
        p+=short_opcode_info(op).size;
    }return 0;
}
static int four_group_match(JSFunctionBytecode*b,int pos,int*entry,int*end)
{
    int k,i,k2,i2,n,n2;uint8_t*p=b->byte_code_buf+pos;
    n=four_load(p,&k,&i);if(!n || pos+n+5>=b->byte_code_len)return 0;
    if(p[n]!=OP_get_field && p[n]!=OP_get_field_rdi)return 0;
    n2=four_load(p+n+5,&k2,&i2);
    if(!n2 || k!=k2 || i!=i2 || pos+n+5+n2+5>b->byte_code_len)return 0;
    int op=p[n+5+n2];if(op!=OP_get_field && op!=OP_get_field_rdi)return 0;
    *entry=pos+n;*end=pos+n+5+n2+5;
    return !four_interior_target(b,pos,*end);
}
static size_t four_extra_size(JSFunctionBytecode*b)
{
    size_t count=0;for(int pos=0;pos<b->byte_code_len;){
        int en,end,op=b->byte_code_buf[pos];
        if(four_group_match(b,pos,&en,&end)){count++;pos=end;}
        else pos+=short_opcode_info(op).size;
    }return count*sizeof(FourSite);
}
static void four_prepare(JSContext*ctx,JSFunctionBytecode*b)
{
    b->four_sites=(FourSite*)(b->read_ic_sites+b->read_ic_count);
    for(int pos=0;pos<b->byte_code_len;){
        int en,end,op=b->byte_code_buf[pos];
        if(!four_group_match(b,pos,&en,&end)){pos+=short_opcode_info(op).size;continue;}
        FourSite*s=&b->four_sites[b->four_count++];uint8_t*p=b->byte_code_buf+en;
        int k,i,n=four_load(p+5,&k,&i);
        s->one=(ReadICSite*)(p+1+get_u32(p+1));
        s->two=(ReadICSite*)(p+5+n+1+get_u32(p+5+n+1));
        if(s->one->atom==s->two->atom){b->four_count--;pos=end;continue;}
        s->pc=en;s->end=end;
#ifdef FOUR_DIAG
        s->diag=four_dnew(ctx,b,en);
#endif
        /* The leading B2 borrow would bypass the group entry when warm. */
        if(op==OP_v6_get_loc0)b->byte_code_buf[pos]=OP_get_loc0;
        if(op==OP_v6_get_arg0)b->byte_code_buf[pos]=OP_get_arg0;
        *p=OP_four_group;
        put_u32(p+1,(uint8_t*)s-(p+1));pos=end;
    }
}
