/* All recognition is post-final-bytecode. No JavaScript source matching. */
static int ex_load(const uint8_t *p, int *arg, int *idx)
{
    int op = *p;
    if (op >= OP_get_loc0 && op <= OP_get_loc3) { *arg=0; *idx=op-OP_get_loc0; return 1; }
    if (op >= OP_get_arg0 && op <= OP_get_arg3) { *arg=1; *idx=op-OP_get_arg0; return 1; }
    if (op == OP_v6_get_loc0) { *arg=0; *idx=0; return 1; }
    if (op == OP_v6_get_arg0) { *arg=1; *idx=0; return 1; }
    if (op == OP_get_loc || op == OP_get_arg) { *arg=op==OP_get_arg; *idx=get_u16(p+1); return 3; }
    return 0;
}
static int ex_integer(const uint8_t *p, int32_t *value)
{
    if (*p >= OP_push_minus1 && *p <= OP_push_7) { *value=*p-OP_push_0; return 1; }
    if (*p == OP_push_i8) { *value=(int8_t)p[1]; return 2; }
    if (*p == OP_push_i16) { *value=(int16_t)get_u16(p+1); return 3; }
    if (*p == OP_push_i32) { *value=(int32_t)get_u32(p+1); return 5; }
    return 0;
}
static int ex_plain_load(const uint8_t *p)
{
    if (*p == OP_v6_get_loc0) return OP_get_loc0;
    if (*p == OP_v6_get_arg0) return OP_get_arg0;
    return *p;
}

#ifdef EX_DIAGNOSTIC
static int ex_active;
static uint64_t ex_rmw_attempts,ex_rmw_hits,ex_rmw_guard,ex_rmw_type,ex_rmw_overflow;
static uint64_t ex_rmw_const_other,ex_loop_entries,ex_loop_iters,ex_loop_guard;
static uint64_t ex_loop_overflow,ex_loop_checkpoints,ex_edge_queries,ex_edge_hits;
static uint64_t ex_rmw_constants[33];
#define EX_COUNT(x) do { if(ex_active) ++ex_##x; } while(0)
void ex_begin(void) { ex_active=1; }
void ex_end(void)
{
    ex_active=0;
    fprintf(stderr,"EXECUTION_COUNTS:{\"rmw_attempts\":%llu,\"rmw_hits\":%llu,\"rmw_guard\":%llu,"
        "\"rmw_type\":%llu,\"rmw_overflow\":%llu,\"rmw_const_other\":%llu,"
        "\"loop_entries\":%llu,\"loop_iters\":%llu,\"loop_guard\":%llu,\"loop_overflow\":%llu,"
        "\"loop_checkpoints\":%llu,\"edge_queries\":%llu,\"edge_hits\":%llu,\"constants\":[",
        (unsigned long long)ex_rmw_attempts,(unsigned long long)ex_rmw_hits,
        (unsigned long long)ex_rmw_guard,(unsigned long long)ex_rmw_type,(unsigned long long)ex_rmw_overflow,
        (unsigned long long)ex_rmw_const_other,(unsigned long long)ex_loop_entries,
        (unsigned long long)ex_loop_iters,(unsigned long long)ex_loop_guard,(unsigned long long)ex_loop_overflow,
        (unsigned long long)ex_loop_checkpoints,(unsigned long long)ex_edge_queries,(unsigned long long)ex_edge_hits);
    for(int i=0;i<33;i++) fprintf(stderr,"%s%llu",i?",":"",(unsigned long long)ex_rmw_constants[i]);
    fprintf(stderr,"]}\n");
}
#else
#define EX_COUNT(x) ((void)0)
#endif

#ifdef EX_RMW
static int ex_rmw_match(JSFunctionBytecode *b, uint8_t *p, int profiling)
{
    int a,i,a2,i2,n,n2,k;
    int32_t c;
    uint8_t *r,*q,*end=b->byte_code_buf+b->byte_code_len;
    ReadICSite *read,*write;
    if(end-p<14 || !(n=ex_load(p,&a,&i))) return 0;
    if(!(n2=ex_load(p+n,&a2,&i2)) || n!=n2 || a!=a2 || i!=i2) return 0;
    r=p+n+n2;
    if(r+12>end || *r!=OP_get_field_rdi) return 0;
    k=ex_integer(r+5,&c);
    if(!k || (!profiling && c!=1
#ifdef EX_RMW_CONST
              && 0
#endif
              )) return 0;
    q=r+5+k;
    if(q+6>end || q[0]!=OP_add || q[1]!=OP_put_field_shared) return 0;
    read=(ReadICSite *)(r+1+get_u32(r+1));
    write=(ReadICSite *)(q+2+get_u32(q+2));
    if(read!=write) return 0;
    return n;
}
#endif

#ifdef EX_RMW_UPDATE
static int ex_rmw_field2_match(JSFunctionBytecode *b,uint8_t *p,int profiling)
{
    uint8_t *end=b->byte_code_buf+b->byte_code_len,*q;
    ReadICSite *r,*w;int32_t c;int n;
    if(end-p<11 || *p!=OP_get_field2_rdi) return 0;
    q=p+5;
    if(*q==OP_inc) q++;
    else {
        n=ex_integer(q,&c);
        if(!n || (c!=1 && !profiling) || q+n+6>end || q[n]!=OP_add) return 0;
        q+=n+1;
    }
    if(q+5>end || *q!=OP_put_field_shared) return 0;
    r=(ReadICSite *)(p+1+get_u32(p+1));w=(ReadICSite *)(q+1+get_u32(q+1));
    return r==w;
}
#endif

#ifdef EX_LOOP
typedef struct ExLoop { int i,s,barg,bi,bsize; int32_t bound; const uint8_t *body,*end; } ExLoop;
static int ex_loop_match(JSFunctionBytecode *b, const uint8_t *p, ExLoop *out)
{
    const uint8_t *end=b->byte_code_buf+b->byte_code_len,*q,*body;
    int n,a=0,idx=0; int32_t c=0;
    if(end-p<12) return 0;
    n=ex_load(p+1,&a,&idx);
    if(!n) { n=ex_integer(p+1,&c); a=2; }
    if(!n) return 0;
    q=p+1+n;
    if(q+10>end || q[0]!=OP_lt || q[1]!=OP_if_false8) return 0;
    body=q+3;
    if(body[0]<OP_get_loc0 || body[0]>OP_get_loc3 || body[1]!=OP_add_loc || body[3]!=OP_inc_loc || body[5]!=OP_goto8) return 0;
    out->i=body[0]-OP_get_loc0; out->s=body[2];
    if(body[4]!=out->i || body+6+(int8_t)body[6]!=p || q+2+(int8_t)q[2]!=body+7) return 0;
    if(*p!=OP_get_loc0+out->i && *p!=OP_int_loop_kernel) return 0;
    if(out->i==out->s || out->s>=b->var_count || !b->vardefs) return 0;
    if(a==0 && (idx==out->i || idx==out->s)) return 0;
    if(a<2 && (idx>=(a?b->arg_count:b->var_count) || b->vardefs[(a?0:b->arg_count)+idx].is_captured)) return 0;
    if(b->vardefs[b->arg_count+out->i].is_captured || b->vardefs[b->arg_count+out->s].is_captured) return 0;
    out->barg=a;out->bi=idx;out->bound=c;out->bsize=n;out->body=body;out->end=body+7;
    return 1;
}
#endif

static int ex_has_candidates(JSFunctionBytecode *b)
{
#ifdef EX_LOOP
    ExLoop loop;
    for(int pos=0;pos<b->byte_code_len;) {
        int op=b->byte_code_buf[pos];
        if(ex_loop_match(b,b->byte_code_buf+pos,&loop)) return 1;
        pos+=short_opcode_info(op).size;
    }
#endif
#ifdef EX_BITS
    ExBits bits;
    for(int pos=0;pos<b->byte_code_len;) {
        int op=b->byte_code_buf[pos];
        if(ex_bits_match(b,b->byte_code_buf+pos,&bits)) return 1;
        pos+=short_opcode_info(op).size;
    }
#endif
    return 0;
}
static void ex_prepare(JSFunctionBytecode *b)
{
    uint8_t *previous=NULL;
    for(int pos=0;pos<b->byte_code_len;) {
        uint8_t *p=b->byte_code_buf+pos; int op=*p,n=short_opcode_info(op).size;
#ifdef EX_RMW
        int entry=ex_rmw_match(b,p,
#ifdef EX_DIAGNOSTIC
            1
#else
            0
#endif
            );
        if(entry) *p=entry==1?OP_field_rmw_i32:OP_field_rmw_i32_wide;
#endif
#ifdef EX_RMW_UPDATE
        int a,i;
        if(previous && ex_load(previous,&a,&i) && ex_rmw_field2_match(b,p,
#ifdef EX_DIAGNOSTIC
            1
#else
            0
#endif
            )) *p=OP_field_rmw_update;
#endif
#ifdef EX_LOOP
        ExLoop loop;
        if(ex_loop_match(b,p,&loop)) *p=OP_int_loop_kernel;
#endif
#ifdef EX_BITS
        ExBits bits;
        if(ex_bits_match(b,p,&bits)) *p=OP_int_loop_bits;
#endif
        previous=p;pos+=n;
    }
}
