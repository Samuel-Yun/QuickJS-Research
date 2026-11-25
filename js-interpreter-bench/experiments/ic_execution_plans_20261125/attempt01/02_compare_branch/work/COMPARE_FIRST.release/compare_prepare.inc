static int cmp_binding(JSFunctionBytecode*b,unsigned p,unsigned*slot,unsigned*arg,unsigned*size){
 if(p>=(unsigned)b->byte_code_len)return 0;const uint8_t*c=b->byte_code_buf+p;unsigned op=*c;
 *size=short_opcode_info(op).size;
 if(op>=OP_get_arg0&&op<=OP_get_arg3){*slot=op-OP_get_arg0;*arg=1;}
 else if(op==OP_get_arg){*slot=get_u16(c+1);*arg=1;}
 else if(op>=OP_get_loc0&&op<=OP_get_loc3){*slot=op-OP_get_loc0;*arg=0;}
 else if(op==OP_get_loc8){*slot=c[1];*arg=0;}
 else if(op==OP_get_loc){*slot=get_u16(c+1);*arg=0;}
 else if(op==OP_v6_get_arg0){*slot=0;*arg=3;}
 else if(op==OP_v6_get_loc0){*slot=0;*arg=2;}
 else return 0;
 return *slot<(*arg&1?b->arg_count:b->var_count);
}
static int cmp_field(JSFunctionBytecode*b,unsigned p,JSAtom*atom,ReadICSite**site){
 if(p+5>(unsigned)b->byte_code_len)return 0;
 uint8_t*c=b->byte_code_buf+p;
 if(*c==OP_get_field){*atom=get_u32(c+1);*site=NULL;return 1;}
 if(*c==OP_get_field_rdi){*site=(ReadICSite*)(c+1+get_u32(c+1));*atom=(*site)->atom;return 1;}
 return 0;
}
static int cmp_false(JSFunctionBytecode*b,unsigned p,unsigned*target,unsigned*size){
 if(p>=(unsigned)b->byte_code_len)return 0;uint8_t*c=b->byte_code_buf+p;int64_t t;
 if(*c==OP_if_false8){*size=2;t=(int64_t)p+1+(int8_t)c[1];}
 else if(*c==OP_if_false){*size=5;t=(int64_t)p+1+(int32_t)get_u32(c+1);}
 else return 0;
 if(t<0||t>=b->byte_code_len)return 0;*target=t;return 1;
}
static int cmp_match(JSFunctionBytecode*b,unsigned start,CompareSite*s){
 unsigned p=start,a,aa,az,o,oa,oz,t,tz,a2,aa2,az2,o2,oa2,oz2,e,ez;JSAtom k,k2;ReadICSite*ic,*ic2;
 if(!cmp_binding(b,p,&a,&aa,&az)||aa>1)return 0;p+=az;
 if(!cmp_binding(b,p,&o,&oa,&oz))return 0;p+=oz;
 if(!cmp_field(b,p,&k,&ic))return 0;p+=5;
 if(p>=(unsigned)b->byte_code_len||b->byte_code_buf[p++]!=OP_lt)return 0;
 unsigned branch=p;
 if(!cmp_false(b,p,&t,&tz))return 0;p+=tz;
 unsigned left=p,second=t;
 if(!cmp_binding(b,t,&a2,&aa2,&az2)||aa2!=aa||a2!=a)return 0;t+=az2;
 if(!cmp_binding(b,t,&o2,&oa2,&oz2)||(oa2&1)!=(oa&1)||o2!=o)return 0;t+=oz2;
 unsigned read2=t;
 if(!cmp_field(b,t,&k2,&ic2)||k!=k2)return 0;t+=5;
 if(t>=(unsigned)b->byte_code_len||b->byte_code_buf[t++]!=OP_gt)return 0;
 if(!cmp_false(b,t,&e,&ez))return 0;t+=ez;
 if(s){memset(s,0,sizeof(*s));s->read=ic;s->pc=start;s->read2=read2;s->branch1=branch;s->left=left;s->right=t;s->equal=e;s->second=second;s->a=a;s->b=o;s->a_arg=aa;s->b_arg=oa;s->original=b->byte_code_buf[start];s->size=az;}
 return 1;
}
static size_t compare_extra_size(JSFunctionBytecode*b){
 unsigned n=0;
 for(unsigned p=0;p<(unsigned)b->byte_code_len;p+=short_opcode_info(b->byte_code_buf[p]).size)n+=cmp_match(b,p,NULL);
 return n&&n<65535?n*sizeof(CompareSite)+sizeof(uint16_t)*(size_t)b->byte_code_len:0;
}
static void compare_prepare(JSContext*ctx,JSFunctionBytecode*b){
 size_t size=compare_extra_size(b);if(!size)return;
 unsigned n=(size-sizeof(uint16_t)*(size_t)b->byte_code_len)/sizeof(CompareSite);
 b->compare_sites=(CompareSite*)((uint8_t*)(b->read_ic_sites+b->read_ic_count)+four_extra_size(b));
 b->compare_map=(uint16_t*)(b->compare_sites+n);
 for(unsigned p=0;p<(unsigned)b->byte_code_len;){
  unsigned len=short_opcode_info(b->byte_code_buf[p]).size;CompareSite s;
  if(cmp_match(b,p,&s)){
   unsigned i=b->compare_count++;b->compare_sites[i]=s;
#ifdef FOUR_DIAG
   b->compare_sites[i].diag=four_dnew(ctx,b,p);
#endif
   b->compare_map[p]=i+1;b->compare_map[s.branch1]=i+1;b->compare_map[s.read2]=i+1;
   b->byte_code_buf[p]=s.size==1?OP_compare1:s.size==2?OP_compare2:OP_compare3;
  }p+=len;
 }
 assert(b->compare_count==n);
}
