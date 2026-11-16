/* Independent bridge diagnostic only. Linked bytecode records retained until exit. */
typedef struct BridgeFunction {
    struct BridgeFunction *next;
    JSFunctionBytecode *key;
    char *name;
    int len;
    uint8_t *code;
    char **atoms;
    unsigned long long count[256];
} BridgeFunction;
static BridgeFunction *bridge_functions;
static const char * const bridge_op_names[OP_COUNT] = {
#define DEF(id,size,n_pop,n_push,fmt) #id,
#if SHORT_OPCODES
#define def(id,size,n_pop,n_push,fmt)
#else
#define def(id,size,n_pop,n_push,fmt) "invalid",
#endif
#include "quickjs-opcode.h"
};
static void bridge_count(JSContext *ctx, JSFunctionBytecode *b, const uint8_t *pc, int op)
{
    BridgeFunction *f=bridge_functions;
    for(;f;f=f->next)if(f->key==b)break;
    if(!f) {
        f=calloc(1,sizeof(*f));if(!f)abort();f->key=b;f->len=b->byte_code_len;
        const char *name=JS_AtomToCString(ctx,b->func_name);if(!name)abort();f->name=strdup(name);JS_FreeCString(ctx,name);
        f->code=calloc(f->len,1);f->atoms=calloc(f->len,sizeof(char*));if(!f->code||!f->atoms)abort();memcpy(f->code,b->byte_code_buf,f->len);
        for(int pos=0,opcode;pos<f->len;pos+=short_opcode_info(opcode).size) {
            opcode=f->code[pos];JSAtom atom=JS_ATOM_NULL;
            if(opcode==OP_get_field_rdi||opcode==OP_get_field2_rdi) {
                atom=b->read_ic_sites[get_u32(f->code+pos+1)].atom;
                opcode=opcode==OP_get_field_rdi?OP_get_field:OP_get_field2;f->code[pos]=opcode;
            }
            unsigned fmt=short_opcode_info(opcode).fmt;
            if(fmt==OP_FMT_atom||fmt==OP_FMT_atom_u8||fmt==OP_FMT_atom_u16||fmt==OP_FMT_atom_label_u8||fmt==OP_FMT_atom_label_u16) {
                if(atom==JS_ATOM_NULL)atom=get_u32(f->code+pos+1);
                name=JS_AtomToCString(ctx,atom);if(!name)abort();f->atoms[pos]=strdup(name);JS_FreeCString(ctx,name);memset(f->code+pos+1,0,4);
            }
        }
        f->next=bridge_functions;bridge_functions=f;
    }
    if(pc<b->byte_code_buf||pc>=b->byte_code_buf+b->byte_code_len)abort();
    f->count[op]++;
}
void bridge_report(void)
{
    const char *path=getenv("BRIDGE_REPORT");if(!path)return;FILE *out=fopen(path,"wx");if(!out)abort();
    fprintf(out,"{\"scope\":\"whole process actual computed-goto dispatch, N2; no dynamic compilation in selected workloads\",\"functions\":[");
    for(BridgeFunction *f=bridge_functions;f;f=f->next) {
        fprintf(out,"{\"name_hex\":\"");for(char *s=f->name;*s;s++)fprintf(out,"%02x",(unsigned char)*s);
        fprintf(out,"\",\"normalized_code_hex\":\"");for(int i=0;i<f->len;i++)fprintf(out,"%02x",f->code[i]);fprintf(out,"\",\"atoms\":[");
        int comma=0;for(int i=0;i<f->len;i++)if(f->atoms[i]){fprintf(out,"%s{\"pc\":%d,\"name_hex\":\"",comma++?",":"",i);for(char *s=f->atoms[i];*s;s++)fprintf(out,"%02x",(unsigned char)*s);fprintf(out,"\"}");}
        fprintf(out,"],\"dispatch\":{");comma=0;
        for(int i=0;i<OP_COUNT;i++)if(f->count[i])fprintf(out,"%s\"%s\":%llu",comma++?",":"",bridge_op_names[i],f->count[i]);
        fprintf(out,"}}%s",f->next?",":"");
    }
    fprintf(out,"]}\n");fclose(out);
}
