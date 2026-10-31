/* Diagnostic only: actual computed-goto dispatch, not logical/fused/CPU instructions. */
typedef struct LayoutFunction {
    struct LayoutFunction *next;
    JSFunctionBytecode *key;
    unsigned id;
    char *name, *filename;
    int len;
    uint8_t *code;
    char **atoms;
    unsigned long long *counts;
    uint8_t *op_at_pc;
} LayoutFunction;
static LayoutFunction *layout_functions;
static unsigned layout_next_id;
static const char *const layout_op_names[OP_COUNT]={
#define DEF(id,size,n_pop,n_push,fmt) #id,
#if SHORT_OPCODES
#define def(id,size,n_pop,n_push,fmt)
#else
#define def(id,size,n_pop,n_push,fmt) "invalid",
#endif
#include "quickjs-opcode.h"
};
static void layout_retire(JSFunctionBytecode *b) {
    for(LayoutFunction *f=layout_functions;f;f=f->next)if(f->key==b){f->key=NULL;return;}
}
static void layout_count(JSContext *ctx, JSFunctionBytecode *b, const uint8_t *pc, int op) {
    LayoutFunction *f=layout_functions;
    for(;f;f=f->next)if(f->key==b)break;
    if(!f){
        f=calloc(1,sizeof(*f));if(!f)abort();f->key=b;f->id=++layout_next_id;f->len=b->byte_code_len;
        const char *s=JS_AtomToCString(ctx,b->func_name);if(!s)abort();f->name=strdup(s);JS_FreeCString(ctx,s);
        s=b->has_debug?JS_AtomToCString(ctx,b->debug.filename):"";if(!s)abort();f->filename=strdup(s);if(b->has_debug)JS_FreeCString(ctx,s);
        f->code=calloc(f->len,1);f->atoms=calloc(f->len,sizeof(char*));
        f->counts=calloc(f->len*2,sizeof(unsigned long long));f->op_at_pc=calloc(f->len,1);
        if(!f->code||!f->atoms||!f->counts||!f->op_at_pc)abort();
        memcpy(f->code,b->byte_code_buf,f->len);
        for(int pos=0,opcode;pos<f->len;pos+=short_opcode_info(opcode).size){
            opcode=f->code[pos];JSAtom atom=JS_ATOM_NULL;
            if(opcode==OP_get_field_rdi||opcode==OP_get_field2_rdi){atom=b->read_ic_sites[get_u32(f->code+pos+1)].atom;opcode=opcode==OP_get_field_rdi?OP_get_field:OP_get_field2;f->code[pos]=opcode;}
            unsigned fmt=short_opcode_info(opcode).fmt;
            if(fmt==OP_FMT_atom||fmt==OP_FMT_atom_u8||fmt==OP_FMT_atom_u16||fmt==OP_FMT_atom_label_u8||fmt==OP_FMT_atom_label_u16){
                if(atom==JS_ATOM_NULL)atom=get_u32(f->code+pos+1);
                s=JS_AtomToCString(ctx,atom);if(!s)abort();f->atoms[pos]=strdup(s);JS_FreeCString(ctx,s);memset(f->code+pos+1,0,4);
            }
        }
        f->next=layout_functions;layout_functions=f;
    }
    if(pc<b->byte_code_buf||pc>=b->byte_code_buf+b->byte_code_len)abort();
    unsigned off=pc-b->byte_code_buf;
    /* A site may change only MIC -> ordinary, two channels keep both raw counts. */
    unsigned base=f->code[off];
    if(op==OP_get_field_rdi||op==OP_get_field2_rdi){f->counts[off*2+1]++;f->op_at_pc[off]=op;}
    else {if(base!=op)abort();f->counts[off*2]++;}
}
static void layout_hex(FILE *o,const char *s){for(;*s;s++)fprintf(o,"%02x",(unsigned char)*s);}
void layout_report(void){
    const char *path=getenv("LAYOUT_REPORT");if(!path)return;FILE *o=fopen(path,"wx");if(!o)abort();
    fprintf(o,"{\"scope\":\"whole process actual dispatch, per function lifetime and original PC; normal/IC channels\",\"opcodes\":[");
    for(int i=0;i<OP_COUNT;i++)fprintf(o,"%s{\"id\":%d,\"name\":\"%s\",\"size\":%u}",i?",":"",i,layout_op_names[i],short_opcode_info(i).size);
    fprintf(o,"],\"functions\":[");
    for(LayoutFunction *f=layout_functions;f;f=f->next){
        fprintf(o,"{\"id\":%u,\"name_hex\":\"",f->id);layout_hex(o,f->name);fprintf(o,"\",\"filename_hex\":\"");layout_hex(o,f->filename);
        fprintf(o,"\",\"normalized_code_hex\":\"");for(int i=0;i<f->len;i++)fprintf(o,"%02x",f->code[i]);fprintf(o,"\",\"atoms\":[");int comma=0;
        for(int i=0;i<f->len;i++)if(f->atoms[i]){fprintf(o,"%s{\"pc\":%d,\"name_hex\":\"",comma++?",":"",i);layout_hex(o,f->atoms[i]);fprintf(o,"\"}");}
        fprintf(o,"],\"dispatch\":[");comma=0;
        for(int i=0;i<f->len;i++)if(f->counts[i*2]||f->counts[i*2+1]){
            fprintf(o,"%s{\"pc\":%d,\"ordinary_opcode\":%u,\"ordinary_count\":%llu,\"ic_opcode\":%u,\"ic_count\":%llu}",comma++?",":"",i,f->code[i],f->counts[i*2],f->op_at_pc[i],f->counts[i*2+1]);
        }
        fprintf(o,"]}%s",f->next?",":"");
    }
    fprintf(o,"]}\n");fclose(o);
}
