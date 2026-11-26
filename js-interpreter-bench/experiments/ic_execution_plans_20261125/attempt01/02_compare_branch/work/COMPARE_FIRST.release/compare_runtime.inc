typedef struct CompareSite {
 ReadICSite*read;
 uint32_t pc,read2,branch1,left,right,equal,second;
 uint16_t a,b;
 uint8_t a_arg,b_arg,original,size;
#ifdef FOUR_DIAG
 FourDiag*diag;
#endif
} CompareSite;
static size_t compare_extra_size(JSFunctionBytecode*b);
static void compare_prepare(JSContext*ctx,JSFunctionBytecode*b);
#ifdef FOUR_DIAG
static void compare_false(JSFunctionBytecode*b,unsigned pos,int truth){
 if(!b->compare_map||pos>=(unsigned)b->byte_code_len||!b->compare_map[pos])return;
 CompareSite*s=&b->compare_sites[b->compare_map[pos]-1];
 if(pos==s->branch1&&!truth)FOUR_COUNT(s,work1);
}
static void compare_read(JSFunctionBytecode*b,unsigned pos){
 if(!b->compare_map||pos>=(unsigned)b->byte_code_len||!b->compare_map[pos])return;
 CompareSite*s=&b->compare_sites[b->compare_map[pos]-1];if(pos==s->read2)FOUR_COUNT(s,work2);
}
#endif
static int compare_try(JSContext*ctx,CompareSite*s,JSValueConst a,JSValueConst obj,uint32_t*next){
 FOUR_COUNT(s,q);
 if(JS_VALUE_GET_TAG(obj)!=JS_TAG_OBJECT){FOUR_COUNT(s,guard);return 0;}
 JSObject*p=JS_VALUE_GET_OBJ(obj);
 if(p->class_id!=JS_CLASS_OBJECT||p->is_exotic||s->read->holder_shape||s->read->shape!=p->shape){FOUR_COUNT(s,work6);FOUR_COUNT(s,guard);return 0;}
 JSValue v=p->prop[s->read->prop_offset].u.value;
 if(!JS_IsNumber(a)||!JS_IsNumber(v)){FOUR_COUNT(s,guard);return 0;}
 FOUR_COUNT(s,work5);
#ifdef COMPARE_OBSERVE
 FOUR_COUNT(s,guard);return 0;
#endif
 /* Hooks must retain the original poll/PC/stack boundary. */
 if(ctx->rt->interrupt_handler){FOUR_COUNT(s,guard);return 0;}
 double x=JS_VALUE_GET_TAG(a)==JS_TAG_INT?JS_VALUE_GET_INT(a):JS_VALUE_GET_FLOAT64(a);
 double y=JS_VALUE_GET_TAG(v)==JS_TAG_INT?JS_VALUE_GET_INT(v):JS_VALUE_GET_FLOAT64(v);
 if(js_poll_interrupts(ctx))return -1;
 if(x<y)*next=s->left;
 else{
  FOUR_COUNT(s,work1);
#if COMPARE_REUSE
  if(js_poll_interrupts(ctx))return -1;
  *next=x>y?s->right:s->equal;
  FOUR_COUNT(s,work3);
  FOUR_ADD(s,work4,5); /* second load a, load receiver, read, gt, branch */
#else
  *next=s->second;
#endif
 }
 /* First: two loads, field read, lt, conditional -> one handler.
  * If receiver uses a fused prefix it was four dispatches, not five. */
 FOUR_ADD(s,work4,(s->b_arg==2)?3:4);
 FOUR_COUNT(s,h);return 1;
}
