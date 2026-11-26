/* Select with a conservative wide-layout bound; verify the final layout
 * before publishing anything. Functions with any control flow remain wide. */
static int rdi_prepare(JSContext*ctx,JSFunctionBytecode*b)
{
    uint32_t count=0,index=0,shorts=0;
    size_t wide_size=((size_t)b->byte_code_len+7)&~(size_t)7;
    int allowed=d16_allowed(b),old_len=b->byte_code_len;
    const uint8_t*old=b->byte_code_buf;
    assert(!b->read_ic_ready && !b->read_ic_sites);
    b->read_ic_ready=1;
    for(int p=0;p<old_len;){
        int op=old[p];
        if(op==OP_get_field || op==OP_get_field2){
            size_t delta=wide_size+count*sizeof(ReadICSite)-(p+1);
            if(allowed && op==OP_get_field && delta<=UINT16_MAX-7)shorts++;
            count++;
        }
        p+=short_opcode_info(op).size;
    }
    if(!count && !four_extra_size(b))return 0;
    if(!allowed)SCREEN(d16_excluded_control);
    int new_len=old_len-2*shorts;
    size_t code_size=((size_t)new_len+7)&~(size_t)7;
    int valid=1,pos=0;
    for(int p=0;p<old_len;){
        int op=old[p],n=short_opcode_info(op).size;
        if(op==OP_get_field || op==OP_get_field2){
            size_t before=wide_size+index*sizeof(ReadICSite)-(p+1);
            if(shorts && op==OP_get_field && before<=UINT16_MAX-7){
                size_t delta=code_size+index*sizeof(ReadICSite)-(pos+1);
                if(delta>UINT16_MAX)valid=0;
                pos+=3;
            }else pos+=n;
            index++;
        }else pos+=n;
        p+=n;
    }
    if(!valid){shorts=0;new_len=old_len;code_size=wide_size;SCREEN(d16_excluded_range);}
    if(count>(SIZE_MAX-code_size)/sizeof(ReadICSite))return 0;
    size_t total=code_size+count*sizeof(ReadICSite)+four_extra_size(b);
    if(total>UINT32_MAX)return 0;
    uint8_t*linked=js_mallocz_rt(ctx->rt,total);if(!linked)return 0;
    b->byte_code_buf=linked;b->byte_code_len=new_len;
    b->read_ic_sites=(ReadICSite*)(linked+code_size);b->read_ic_count=count;
    ReadICSite*last_read=NULL;index=0;pos=0;
    for(int p=0;p<old_len;){
        int op=old[p],n=short_opcode_info(op).size,out_n=n;
        uint8_t*pc=linked+pos;
        memcpy(pc,old+p,n==5 && shorts && op==OP_get_field?3:n);
        if((op==OP_get_arg0 || op==OP_get_loc0) && p+1<old_len && old[p+1]==OP_get_field)
            *pc=op==OP_get_arg0?OP_v6_get_arg0:OP_v6_get_loc0;
        if(op==OP_get_field || op==OP_get_field2){
            ReadICSite*site=&b->read_ic_sites[index];site->atom=get_u32(old+p+1);
            size_t before=wide_size+index*sizeof(ReadICSite)-(p+1);
            size_t delta=(uint8_t*)site-(pc+1);
            if(shorts && op==OP_get_field && before<=UINT16_MAX-7){
                assert(delta<=UINT16_MAX);*pc=OP_get_field_rdi16;put_u16(pc+1,delta);out_n=3;
            }else{
                *pc=op==OP_get_field?OP_get_field_rdi:OP_get_field2_rdi;put_u32(pc+1,delta);
            }
            last_read=site;index++;
        }else if(op==OP_put_field && last_read && get_u32(old+p+1)==last_read->atom){
            JS_FreeAtom(ctx,get_u32(old+p+1));*pc=OP_put_field_shared;
            put_u32(pc+1,(uint8_t*)last_read-(pc+1));
        }
        p+=n;pos+=out_n;
    }
    assert(pos==new_len && index==count);
    SCREEN_ADD(d16_prepared_shorts,shorts);
    SCREEN_ADD(d16_code_saved,old_len-new_len);
    SCREEN_ADD(d16_linked_saved,wide_size-code_size);
    four_prepare(ctx,b);
    return 0;
}
