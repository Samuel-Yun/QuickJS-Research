/* Run-scoped diagnostics; ep_plan occupies an otherwise unused flag bit. */
static int four_active;
static uint64_t co_hist[34],co_hits,co_one,co_two,co_bytes,co_migrations,co_migration_bytes,co_resizes,co_gc;
static void co_plan(JSObject*p){
 p->ep_plan=1;
 if(!four_active)return;
 co_hits++;unsigned cap=p->shape->prop_size;co_hist[cap<33?cap:33]++;
 if(p->co_props)co_one++;else co_two+=2;
 co_bytes+=sizeof(JSObject)+sizeof(JSProperty)*cap;
}
static void co_resize_event(JSObject*p,size_t bytes){
 if(!four_active||!p->ep_plan)return;co_resizes++;
 if(p->co_props){co_migrations++;co_migration_bytes+=bytes;}
}
static void co_report(void){
 fprintf(stderr,"CO_WORK:{\"hits\":%"PRIu64",\"combined_requests\":%"PRIu64",\"ordinary_requests\":%"PRIu64",\"requested_bytes\":%"PRIu64",\"resizes\":%"PRIu64",\"migrations\":%"PRIu64",\"migration_bytes\":%"PRIu64",\"gc\":%"PRIu64",\"capacity_histogram\":[",co_hits,co_one,co_two,co_bytes,co_resizes,co_migrations,co_migration_bytes,co_gc);
 for(unsigned i=0;i<34;i++)fprintf(stderr,"%s%"PRIu64,i?",":"",co_hist[i]);fprintf(stderr,"]}\n");
}
