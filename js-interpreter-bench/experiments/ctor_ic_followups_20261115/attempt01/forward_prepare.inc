static int follow_forward_match(JSFunctionBytecode*b)
{
 const uint8_t*p=b->byte_code_buf;
 return b->func_kind==JS_FUNC_NORMAL && !b->arg_count && b->var_count==2 && !b->var_ref_count &&
  !b->closure_var_count && !b->need_home_object && !b->is_derived_class_constructor && b->has_simple_parameter_list &&
  b->byte_code_len==22 && p[0]==OP_push_this && p[1]==OP_put_loc0 && p[2]==OP_special_object && p[3]==1 && p[4]==OP_put_loc1 &&
  (p[5]==OP_get_loc0 || p[5]==OP_v6_get_loc0) && (p[6]==OP_get_field || p[6]==OP_get_field_rdi) &&
  (p[11]==OP_get_field2 || p[11]==OP_get_field2_rdi) && p[16]==OP_get_loc0 && p[17]==OP_get_loc1 &&
  p[18]==OP_call_method && get_u16(p+19)==2 && p[21]==OP_return_undef;
}
static size_t follow_extra_size(JSFunctionBytecode*b){return follow_forward_match(b)?sizeof(FwdSite):0;}
static void follow_prepare(JSContext*ctx,JSFunctionBytecode*b)
{
 if(!follow_forward_match(b))return;
 FwdSite*s=(FwdSite*)((uint8_t*)(b->read_ic_sites+b->read_ic_count)+b->four_count*sizeof(FourSite));b->forward_site=s;
 uint8_t*p=b->byte_code_buf;s->init_atom=((ReadICSite*)(p+7+get_u32(p+7)))->atom;
 s->apply_atom=((ReadICSite*)(p+12+get_u32(p+12)))->atom;s->call_end=21;
#ifdef FOUR_DIAG
 s->diag=four_dnew(ctx,b,2);
#endif
 p[2]=OP_forward_ctor;
}
