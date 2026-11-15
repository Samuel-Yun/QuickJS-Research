from pathlib import Path
HERE=Path(__file__).resolve().parent
def apply(d,q,once):
 q=once(q,'    JSShape **shape_hash;\n    void *user_opaque;','    JSShape **shape_hash;\n    void *user_opaque;\n    uint64_t ctor_ticket_epoch;\n    uint8_t ctor_ticket_disabled;')
 q=once(q,'    uint8_t is_HTMLDDA : 1;','    uint8_t ctor_ticket_watched : 1;\n    uint8_t is_HTMLDDA : 1;')
 q=once(q,'    p->is_HTMLDDA = 0;','    p->is_HTMLDDA = 0;\n    p->ctor_ticket_watched = 0;')
 q=once(q,'    JSShape *sh, *new_sh;\n\n    if (unlikely(__JS_AtomIsTaggedInt(prop)))','    JSShape *sh, *new_sh;\n    ticket_mutate(ctx,p);\n\n    if (unlikely(__JS_AtomIsTaggedInt(prop)))')
 q=once(q,'    uint32_t idx = 0;    /* prevent warning */\n\n    sh = p->shape;','    uint32_t idx = 0;    /* prevent warning */\n    ticket_mutate(ctx,p);\n\n    sh = p->shape;')
 s=d['four_runtime.inc'];s=once(s,'    uint16_t argc;','    uint16_t argc;\n    uint8_t ticket_valid;\n    uint16_t ticket_queries;\n    uint64_t ticket_epoch;')
 s=once(s,'    for(unsigned i=0;i<r->n;i++){\n        JSObject*p=proto;', '    FOLLOW(0);\n    for(unsigned i=0;i<r->n;i++){\n        JSObject*p=proto;')
 s=once(s,'            JSProperty*pr;JSShapeProperty*d=find_own_property(&pr,p,r->atom[i]);','            FOLLOW(1);JSProperty*pr;JSShapeProperty*d=find_own_property(&pr,p,r->atom[i]);')
 s=once(s,'static int four_ctor_base(', '#include "ticket_runtime.inc"\nstatic int four_ctor_base(')
 s=once(s,'    FOUR_COUNT(s,fill);','    ticket_issue(ctx,s);\n    FOUR_COUNT(s,fill);')
 s=once(s,'four_ctor_proto(f)==s->final->proto && four_ctor_chain(s->final->proto,&s->recipe)', 'four_ctor_proto(f)==s->final->proto && ticket_check(ctx,s)')
 d['four_runtime.inc']=s;d['ticket_runtime.inc']=(HERE/'ticket_runtime.inc').read_text()
 return q
