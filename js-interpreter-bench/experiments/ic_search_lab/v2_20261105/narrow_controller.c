/* Include the exact selected source + separate diagnostic patch. No timing. */
#include "quickjs.c"
static void code(JSValueConst f,const char *phase) {
    JSFunctionBytecode *b=JS_VALUE_GET_OBJ(f)->u.func.function_bytecode;
    printf("CODE phase=%s ready=%u sites=%u bytes=%d hex=",phase,b->read_ic_ready,b->read_ic_count,b->byte_code_len);
    for(int i=0;i<b->byte_code_len;i++)printf("%02x",b->byte_code_buf[i]);
    puts("");
    for(int pos=0;pos<b->byte_code_len;){
        int op=b->byte_code_buf[pos];
        if(op==OP_get_field_rdi){
            uint32_t operand=get_u32(b->byte_code_buf+pos+1);
            printf("FIELD offset=%d opcode=get_field_rdi operand=%u",pos,operand);
#ifdef V2_PC_RELATIVE
            printf(" pc_relative_record_matches_first=%d",(void *)(b->byte_code_buf+pos+1+operand)==(void *)b->read_ic_sites);
#endif
            puts("");
        }else if(op==OP_get_field)printf("FIELD offset=%d opcode=get_field atom=%u\n",pos,get_u32(b->byte_code_buf+pos+1));
        int step=short_opcode_info(op).size;if(!step)abort();pos+=step;
    }
}
int main(int argc,char **argv) {
    int alternating=argc>1&&!strcmp(argv[1],"poly2"),bad=0;
    const int n=8192;
    const char *s="function read(o){return o.x;}function work(a,n){var sum=0;for(var i=0;i<n;i++)sum+=read(a[i&1]);return sum;}var left={x:11},right={pad:0,x:22};var items=[left,left];";
    JSRuntime *rt=JS_NewRuntime();JSContext *ctx=JS_NewContext(rt);
    JSValue init=JS_Eval(ctx,s,strlen(s),"v2narrow.js",0);if(JS_IsException(init))return 2;JS_FreeValue(ctx,init);
    JSValue global=JS_GetGlobalObject(ctx),work=JS_GetPropertyStr(ctx,global,"work"),read=JS_GetPropertyStr(ctx,global,"read");
    JSValue items=JS_GetPropertyStr(ctx,global,"items"),left=JS_GetPropertyStr(ctx,global,"left"),right=JS_GetPropertyStr(ctx,global,"right");
    if(alternating&&JS_SetPropertyUint32(ctx,items,1,JS_DupValue(ctx,right))<0)return 3;
    code(read,"before_first_call");
    for(int phase=0;phase<3;phase++) {
        int lv=phase?99:11;int expected=alternating?(lv+22)*(n/2):lv*n;
        if(phase==1&&JS_SetPropertyStr(ctx,left,"x",JS_NewInt32(ctx,99))<0)return 4;
        if(phase==2&&JS_SetPropertyStr(ctx,left,"added",JS_NewInt32(ctx,1))<0)return 5;
        JSValue args[2]={items,JS_NewInt32(ctx,n)};memset(&v2d,0,sizeof(v2d));v2d_on=1;
        JSValue answer=JS_Call(ctx,work,JS_UNDEFINED,2,args);v2d_on=0;
        int32_t got=-1;bad|=JS_IsException(answer)||JS_ToInt32(ctx,&got,answer)||got!=expected;JS_FreeValue(ctx,answer);
        bad|=v2d.queries!=v2d.hits+v2d.fallback;
        bad|=v2d.queries!=(uint64_t)n; /* do not pass with accidentally inactive hooks */
        printf("COUNT mode=%s phase=%d N=%d result=%d expected=%d queries=%llu hits=%llu fallback=%llu find=%llu hash_paths=%llu updates=%llu replacements=%llu comparisons=%llu inserts=%llu prepares=%llu hint_hits=%llu\n",
            alternating?"poly2":"mono",phase,n,got,expected,(unsigned long long)v2d.queries,(unsigned long long)v2d.hits,
            (unsigned long long)v2d.fallback,(unsigned long long)v2d.find_calls,(unsigned long long)v2d.hash_paths,(unsigned long long)v2d.updates,
            (unsigned long long)v2d.replacements,(unsigned long long)v2d.comparisons,(unsigned long long)v2d.inserts,
            (unsigned long long)v2d.prepares,(unsigned long long)v2d.hint_hits);
        if(phase==0)code(read,"after_first_phase");
    }
    JS_FreeValue(ctx,items);JS_FreeValue(ctx,left);JS_FreeValue(ctx,right);JS_FreeValue(ctx,read);JS_FreeValue(ctx,work);JS_FreeValue(ctx,global);
    JS_RunGC(rt);JS_FreeContext(ctx);JS_FreeRuntime(rt);puts(bad?"NARROW_FAIL":"NARROW_PASS");return bad;
}
