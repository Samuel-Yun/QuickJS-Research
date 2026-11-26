#include "runtime_opcode_info.h"
/* Straight-line normal functions only. Debug PCs and serialization retain
 * the original wide coordinate system; translation is off the hot path. */
static int d16_allowed(JSFunctionBytecode*b)
{
    if(b->func_kind!=JS_FUNC_NORMAL)return 0;
    for(int p=0;p<b->byte_code_len;){
        int op=b->byte_code_buf[p];
        switch(runtime_op_info(op).fmt){
        case OP_FMT_label:case OP_FMT_label8:case OP_FMT_label16:
        case OP_FMT_label_u16:case OP_FMT_atom_label_u8:case OP_FMT_atom_label_u16:
            return 0;
        default:break;
        }
        if(op==OP_ret || op==OP_nip_catch)return 0;
        p+=runtime_op_info(op).size;
    }
    return 1;
}
static int d16_wide_len(JSFunctionBytecode*b)
{
    int len=b->byte_code_len;
    for(int p=0;p<b->byte_code_len;){
        int op=b->byte_code_buf[p];if(op==OP_get_field_rdi16)len+=2;
        p+=runtime_op_info(op).size;
    }
    return len;
}
static uint32_t d16_debug_pc(JSFunctionBytecode*b,uint32_t target)
{
    if(target==UINT32_MAX)return target;
    uint32_t extra=0;
    for(uint32_t p=0;p<(uint32_t)b->byte_code_len && p<=target;){
        int op=b->byte_code_buf[p];
        if(op==OP_get_field_rdi16 && target>p)extra+=2;
        p+=runtime_op_info(op).size;
    }
    return target+extra;
}
/* Produce ordinary upstream bytecode, expanding all short fields before
 * atom-index serialization. No copy of the wide image is retained at runtime. */
static void d16_export(JSFunctionBytecode*b,uint8_t*out)
{
    int pos=0;
    for(int p=0;p<b->byte_code_len;){
        const uint8_t*in=b->byte_code_buf+p;
        int op=*in,n=runtime_op_info(op).size;
        if(op==OP_get_field_rdi16 || op==OP_get_field_rdi ||
           op==OP_get_field2_rdi || op==OP_put_field_shared){
            uint32_t delta=op==OP_get_field_rdi16?get_u16(in+1):get_u32(in+1);
            ReadICSite*site=(ReadICSite*)(in+1+delta);
            assert(site>=b->read_ic_sites && site<b->read_ic_sites+b->read_ic_count);
            out[pos]=op==OP_put_field_shared?OP_put_field:
                     op==OP_get_field2_rdi?OP_get_field2:OP_get_field;
            put_u32(out+pos+1,site->atom);pos+=5;
        }else{
            memcpy(out+pos,in,n);
            if(op==OP_four_ctor){
                out[pos]=OP_call_constructor;
                put_u16(out+pos+1,b->four_sites[get_u16(in+1)].argc);
            }else if(op==OP_v6_get_arg0)out[pos]=OP_get_arg0;
            else if(op==OP_v6_get_loc0)out[pos]=OP_get_loc0;
            pos+=n;
        }
        p+=n;
    }
    assert(pos==d16_wide_len(b));
}
