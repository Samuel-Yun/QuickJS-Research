/* Aggregate stages + exactly three Splay sites. No per-byte/function history. */
typedef struct AuditSite {
    uint64_t operations,ic_queries,hits,misses,cache_probes;
    uint64_t updates,insertions,replacements,same_shape_updates;
    uint64_t find_normal,find_with_offset,buckets,chain_probes,generic_get;
    uint64_t value_int,value_object,value_other,retains,releases,reasons[8];
} AuditSite;
typedef struct AuditScope { AuditSite *previous,*focus; } AuditScope;
static unsigned sp_phase;
static AuditSite sp_totals[6][2],sp_sites[6][3];
static uint64_t sp_all_find[6],sp_outside_find[6];
static AuditSite *audit_active,*audit_focus_active;
static JSFunctionBytecode *sp_focus_b;
static unsigned sp_focus_instances;
static const unsigned sp_pcs[3]={43,138,147};
static void audit_register(JSContext*,JSFunctionBytecode*);
static void audit_free(JSFunctionBytecode*);
static AuditScope audit_begin(JSFunctionBytecode*,const uint8_t*);
static AuditScope audit_pause(void){AuditScope s={audit_active,audit_focus_active};audit_active=audit_focus_active=NULL;return s;}
static void audit_end(AuditScope *s){audit_active=s->previous;audit_focus_active=s->focus;}
#define SP_INC(field) do {if(audit_active)audit_active->field++;if(audit_focus_active)audit_focus_active->field++;}while(0)
static void audit_lookup(int kind){sp_all_find[sp_phase]++;if(!audit_active)sp_outside_find[sp_phase]++;if(kind)SP_INC(find_with_offset);else SP_INC(find_normal);}
static void audit_bucket(void){SP_INC(buckets);}
static void audit_chain(void){SP_INC(chain_probes);}
static void audit_probe(void){SP_INC(cache_probes);}
static void audit_hit(void){SP_INC(hits);}
static void audit_miss(void){SP_INC(misses);}
static void audit_generic(void){SP_INC(generic_get);}
static void audit_change(int k){if(k==0)SP_INC(updates);else if(k==1)SP_INC(insertions);else if(k==2)SP_INC(replacements);else SP_INC(same_shape_updates);}
static void audit_value(JSValueConst v){if(JS_VALUE_GET_TAG(v)==JS_TAG_INT)SP_INC(value_int);else if(JS_VALUE_GET_TAG(v)==JS_TAG_OBJECT)SP_INC(value_object);else SP_INC(value_other);}
static void sp_maint(int k){if(k)SP_INC(releases);else SP_INC(retains);}
static void sp_reason(const char *s){const char *names[]={"own_miss","descriptor","special","unhashed","inherited","missing","primitive"};unsigned k;for(k=0;k<7;k++)if(!strcmp(s,names[k]))break;if(audit_active)audit_active->reasons[k]++;if(audit_focus_active)audit_focus_active->reasons[k]++;}
static void sp_receiver(JSContext*,JSValueConst,JSAtom);
#define AUDIT_SCOPE(b,pc) AuditScope audit_local __attribute__((cleanup(audit_end)))=audit_begin((b),(pc))
