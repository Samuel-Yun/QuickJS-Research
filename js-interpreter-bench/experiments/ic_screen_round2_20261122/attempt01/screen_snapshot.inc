/* Diagnostic builds only: snapshot executed images, not compiler output. */
static const char*screen_opcode_names[]={
#define FMT(f)
#define DEF(id,size,pop,push,fmt) #id,
#include "quickjs-opcode.h"
#undef DEF
#undef FMT
};
static void screen_snapshot(JSFunctionBytecode*b)
{
    const char*path=getenv("SCREEN_IMAGE_PATH");if(!path)return;
    char buf[128];const char*name=JS_AtomGetStr(b->realm,buf,sizeof(buf),b->func_name);
    const char*filter=getenv("SCREEN_IMAGE_FUNCTION");if(filter && strcmp(filter,name))return;
    FILE*f=fopen(path,"a");if(!f)return;
    fprintf(f,"{\"function\":\"");
    for(const unsigned char*p=(const unsigned char*)name;*p;p++){
        if(*p=='"' || *p=='\\')fputc('\\',f);
        if(*p>=32)fputc(*p,f);
    }
    fprintf(f,"\",\"bytes\":%d,\"opcodes\":[",b->byte_code_len);
    for(int p=0;p<b->byte_code_len;){
        int op=b->byte_code_buf[p],size=runtime_op_info(op).size,index=op;
#if SHORT_OPCODES
        if(op>=OP_TEMP_START)index+=OP_TEMP_END-OP_TEMP_START;
#endif
        if(p)fputc(',',f);
        fprintf(f,"{\"offset\":%d,\"opcode\":%d,\"name\":\"%s\",\"size\":%d,\"raw\":\"",p,op,screen_opcode_names[index],size);
        for(int j=0;j<size;j++)fprintf(f,"%02x",b->byte_code_buf[p+j]);
        fprintf(f,"\"}");p+=size;
    }
    fprintf(f,"]}\n");fclose(f);
}
