/* Independent C counters only: no JS references or VM record changes. */
enum OgEvent { OG_logical_named, OG_rdi0_named, OG_rdi1_named, OG_fused_entries,
 OG_hits, OG_fused_hits, OG_field_hits, OG_prototype_hits, OG_normal_lookups,
 OG_own_searches, OG_updates, OG_EVENT_END };
static const char *og_names[]={"logical_named","rdi0_named","rdi1_named","fused_entries",
 "hits","fused_hits","field_hits","prototype_hits","normal_lookups","own_searches","updates"};
enum OgClassEvent { OC_query,OC_hit,OC_nonbaseline_hit,OC_lookup,OC_own_data_miss,
 OC_fill,OC_inherited,OC_descriptor,OC_exotic_dispatch,OC_missing,OC_primitive,OC_EVENT_END };
static const char *oc_names[]={"query","hit","nonbaseline_hit","lookup","own_data_miss",
 "fill","inherited","descriptor","exotic_dispatch","missing","primitive"};
typedef struct OgClass { uint16_t id; uint8_t exotic,hashed; char name[96];
 uint64_t counts[OC_EVENT_END]; struct OgClass *next; } OgClass;
typedef struct OgSite { struct OgSite *next,*all_next; JSFunctionBytecode *owner;
 ReadICSite *key; unsigned id,index,pc,traces; char function[160],filename[200],atom[96];
 uint64_t counts[OG_EVENT_END]; OgClass *classes; } OgSite;
static OgSite *og_hash[16384],*og_all;static unsigned og_serial;
static uint64_t og_totals[OG_EVENT_END];
static unsigned og_bucket(ReadICSite*s){return ((uintptr_t)s>>3)&16383;}
static void og_register(JSContext*ctx,JSFunctionBytecode*b,unsigned index,unsigned pc){
 OgSite*r=calloc(1,sizeof(*r));if(!r)abort();r->owner=b;r->key=&b->read_ic_sites[index];
 r->index=index;r->pc=pc;r->id=++og_serial;char tmp[256];
 snprintf(r->function,sizeof(r->function),"%s",JS_AtomGetStr(ctx,tmp,sizeof(tmp),b->func_name));
 snprintf(r->atom,sizeof(r->atom),"%s",JS_AtomGetStr(ctx,tmp,sizeof(tmp),r->key->atom));
 if(b->has_debug)snprintf(r->filename,sizeof(r->filename),"%s",JS_AtomGetStr(ctx,tmp,sizeof(tmp),b->debug.filename));
 unsigned h=og_bucket(r->key);r->next=og_hash[h];og_hash[h]=r;r->all_next=og_all;og_all=r;
}
static OgSite*og_find(JSFunctionBytecode*b,ReadICSite*s){OgSite*r=og_hash[og_bucket(s)];while(r&&(r->owner!=b||r->key!=s))r=r->next;if(!r)abort();return r;}
static void og_event(JSFunctionBytecode*b,ReadICSite*s,unsigned event){og_find(b,s)->counts[event]++;og_totals[event]++;}
#define OG_EVENT(k) og_event(b,site,OG_##k)
static void og_class(JSContext*ctx,JSFunctionBytecode*b,ReadICSite*s,JSValueConst v,unsigned event){
 OgSite*r=og_find(b,s);unsigned id=0,exotic=0,hashed=0;
 if(JS_VALUE_GET_TAG(v)==JS_TAG_OBJECT){JSObject*p=JS_VALUE_GET_OBJ(v);id=p->class_id;exotic=p->is_exotic;hashed=p->shape->is_hashed;}
 OgClass*c=r->classes;while(c&&(c->id!=id||c->exotic!=exotic||c->hashed!=hashed))c=c->next;
 if(!c){c=calloc(1,sizeof(*c));if(!c)abort();c->id=id;c->exotic=exotic;c->hashed=hashed;
  if(id){char tmp[128];snprintf(c->name,sizeof(c->name),"%s",JS_AtomGetStr(ctx,tmp,sizeof(tmp),ctx->rt->class_array[id].class_name));}
  else strcpy(c->name,"primitive");c->next=r->classes;r->classes=c;}
 c->counts[event]++;if(event==OC_hit&&(id!=JS_CLASS_OBJECT||exotic))c->counts[OC_nonbaseline_hit]++;
}
#define OG_CLASS(v,k) og_class(ctx,b,site,v,OC_##k)
static void og_trace(JSContext*ctx,JSFunctionBytecode*b,ReadICSite*s,JSValueConst v){
 OgSite*r=og_find(b,s);if(r->traces>=6 || (strcmp(r->function,"readX")&&strcmp(r->function,"readPlain")&&strcmp(r->function,"readLoc0")) || JS_VALUE_GET_TAG(v)!=JS_TAG_OBJECT)return;
 JSObject*p=JS_VALUE_GET_OBJ(v);JSShape*sh=p->shape;r->traces++;
 fprintf(stderr,"OG_LAYOUT id=%u function=%s read=%u class=%u exotic=%u hashed=%u shape=%p cached=%p holder=%p offset=%u props=",r->id,r->function,r->traces,p->class_id,p->is_exotic,sh->is_hashed,(void*)sh,(void*)s->shape,(void*)s->holder_shape,s->prop_offset);
 for(unsigned i=0;i<sh->prop_count;i++){JSShapeProperty*d=&get_shape_prop(sh)[i];char tmp[96];fprintf(stderr,"%s%u:%s(flags=%u)",i?",":"",i,JS_AtomGetStr(ctx,tmp,sizeof(tmp),d->atom),d->flags);}fputc('\n',stderr);
}
#define OG_TRACE(v) og_trace(ctx,b,site,v)
static void og_detach(JSFunctionBytecode*b){for(unsigned i=0;i<b->read_ic_count;i++){ReadICSite*s=&b->read_ic_sites[i];OgSite**p=&og_hash[og_bucket(s)];while(*p&&((*p)->owner!=b||(*p)->key!=s))p=&(*p)->next;if(*p)*p=(*p)->next;}}
static void og_string(FILE*f,const char*s){fputc('"',f);for(const unsigned char*p=(const unsigned char*)s;*p;p++){if(*p=='"'||*p=='\\')fputc('\\',f);if(*p<32)fprintf(f,"\\u%04x",*p);else fputc(*p,f);}fputc('"',f);}
static void og_numbers(FILE*f,uint64_t*c,const char**names,unsigned n){fputc('{',f);for(unsigned i=0;i<n;i++)fprintf(f,"%s\"%s\":%"PRIu64,i?",":"",names[i],c[i]);fputc('}',f);}
static void __attribute__((destructor)) og_report(void){
 const char*path=getenv("OG_OUTPUT");if(!path)return;FILE*f=fopen(path,"w");if(!f)return;
 fputs("{\"totals\":",f);og_numbers(f,og_totals,og_names,OG_EVENT_END);
 fprintf(f,",\"layout\":{\"JSRuntime\":%zu,\"JSObject\":%zu,\"JSShape\":%zu,\"ReadICSite\":%zu,\"function\":%zu},\"class_ids\":{\"object\":%u,\"array\":%u,\"regexp\":%u,\"bytecode\":%u,\"cold_bytecode\":%u},\"sites\":[",sizeof(JSRuntime),sizeof(JSObject),sizeof(JSShape),sizeof(ReadICSite),sizeof(JSFunctionBytecode),JS_CLASS_OBJECT,JS_CLASS_ARRAY,JS_CLASS_REGEXP,JS_CLASS_BYTECODE_FUNCTION,JS_CLASS_COLD_BYTECODE_FUNCTION);
 unsigned n=0;for(OgSite*r=og_all;r;r=r->all_next){if(n++)fputc(',',f);fprintf(f,"{\"id\":%u,\"index\":%u,\"pc\":%u,\"function\":",r->id,r->index,r->pc);og_string(f,r->function);fputs(",\"filename\":",f);og_string(f,r->filename);fputs(",\"atom\":",f);og_string(f,r->atom);fputs(",\"counts\":",f);og_numbers(f,r->counts,og_names,OG_EVENT_END);fputs(",\"classes\":[",f);
  unsigned m=0;for(OgClass*c=r->classes;c;c=c->next){if(m++)fputc(',',f);fprintf(f,"{\"class\":%u,\"exotic\":%u,\"hashed\":%u,\"name\":",c->id,c->exotic,c->hashed);og_string(f,c->name);fputs(",\"counts\":",f);og_numbers(f,c->counts,oc_names,OC_EVENT_END);fputc('}',f);}fputs("]}",f);
 }fputs("]}\n",f);fclose(f);
}
