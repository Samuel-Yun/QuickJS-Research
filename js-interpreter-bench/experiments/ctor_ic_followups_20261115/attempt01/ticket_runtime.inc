/* Watch bits are object-local, never a weak raw pointer registry. Strong
 * plan->final->proto and the existing chain own all referenced prototypes. */
static void ticket_mutate(JSContext*ctx,JSObject*p)
{
    JSRuntime*rt=ctx->rt;
    if(p->ctor_ticket_watched){
        FOLLOW(6);
        if(rt->ctor_ticket_epoch==UINT64_MAX)rt->ctor_ticket_disabled=1;
        else rt->ctor_ticket_epoch++;
    }
}
static void ticket_issue(JSContext*ctx,FourSite*s)
{
#ifdef FOLLOW_PROBE
    return;
#endif
    uint16_t queries=0;
    for(unsigned i=0;i<s->recipe.n;i++){
        JSObject*p=s->final->proto;
        while(p){
            p->ctor_ticket_watched=1;queries++;
            JSProperty*pr;JSShapeProperty*d=find_own_property(&pr,p,s->recipe.atom[i]);
            if(d)break;
            p=p->shape->proto;
        }
    }
    s->ticket_queries=queries;s->ticket_epoch=ctx->rt->ctor_ticket_epoch;
    s->ticket_valid=!ctx->rt->ctor_ticket_disabled;FOLLOW(5);
}
static int ticket_check(JSContext*ctx,FourSite*s)
{
#ifdef FOLLOW_PROBE
    return four_ctor_chain(s->final->proto,&s->recipe);
#endif
    if(!ctx->rt->ctor_ticket_disabled && s->ticket_valid && s->ticket_epoch==ctx->rt->ctor_ticket_epoch){
        FOLLOW(2);FOLLOW_ADD(3,s->ticket_queries);return 1;
    }
    FOLLOW(4);
    if(!four_ctor_chain(s->final->proto,&s->recipe))return 0;
    ticket_issue(ctx,s);return 1;
}
