"""Rebuildable v7 source transformations, always starting from frozen s001."""
import re


PARENTS = dict(IO2_LAYOUT='s001',IO2_DIRECT='IO2_LAYOUT',IO4_LAYOUT='s001',IO4_DIRECT='IO4_LAYOUT',
               AQ1='s001', AP1='s001', ST1='s001', IO_DIAG='s001')
PARENTS.update(IO2_STATS='IO2_LAYOUT',IO4_STATS='IO4_LAYOUT')
PARENTS['IO_BASE_STATS']='s001'
PARENTS.update(AQ1_STATS='AQ1',AP1_STATS='AP1',ST1_STATS='ST1')


def once(text, old, new):
    assert text.count(old)==1, (text.count(old), old[:160])
    return text.replace(old,new,1)


def inline_objects(files, cap, direct):
    q = files['quickjs.c']
    q = once(q, '    uint8_t is_HTMLDDA : 1;',
             '    uint8_t v7_prop_inline : 1;\n    uint8_t v7_has_inline_tail : 1;\n    uint8_t is_HTMLDDA : 1;')
    marker = '/* make space to hold at least \'count\' properties */'
    helper = '''/* v7: inline storage is an allocation property, not a shape property. */
#define V7_INLINE_CAP CAPACITY
static JSProperty *v7_resize_prop(JSContext *ctx, JSObject *p, uint32_t count)
{
    JSProperty *next;
    if (!p->v7_prop_inline)
        return js_realloc(ctx, p->prop, sizeof(*p->prop) * count);
    if (count <= V7_INLINE_CAP)
        return p->prop;
    next = js_malloc(ctx, sizeof(*next) * count);
    if (!next)
        return NULL;
    memcpy(next, p->prop, sizeof(*next) * p->shape->prop_count);
    /* No VM callback occurs between publishing the storage flag and pointer. */
    p->v7_prop_inline = 0;
    p->prop = next;
    return next;
}

'''.replace('CAPACITY',str(cap))
    q = once(q,marker,helper+marker)
    q = once(q,'new_prop = js_realloc(ctx, p->prop, sizeof(new_prop[0]) * new_size);',
             'new_prop = v7_resize_prop(ctx, p, new_size);') if q.count('new_prop = js_realloc(ctx, p->prop, sizeof(new_prop[0]) * new_size);')==1 else q.replace('new_prop = js_realloc(ctx, p->prop, sizeof(new_prop[0]) * new_size);','new_prop = v7_resize_prop(ctx, p, new_size);')
    q = once(q,'''new_prop = js_realloc(ctx, p->prop, sizeof(p->prop[0]) *
                                      new_sh->prop_size);''',
             'new_prop = v7_resize_prop(ctx, p, new_sh->prop_size);')
    q = once(q,'''    js_trigger_gc(ctx->rt, sizeof(JSObject));
    p = js_malloc(ctx, sizeof(JSObject));''', '''    size_t tail = (class_id == JS_CLASS_OBJECT && sh->prop_size <= V7_INLINE_CAP)
        ? V7_INLINE_CAP * sizeof(JSProperty) : 0;
    js_trigger_gc(ctx->rt, sizeof(JSObject) + tail);
    p = js_malloc(ctx, sizeof(JSObject) + tail);''')
    q = once(q, '    p->is_HTMLDDA = 0;',
             '    p->v7_prop_inline = p->v7_has_inline_tail = (tail != 0);\n    p->is_HTMLDDA = 0;')
    q = once(q,'    p->prop = js_malloc(ctx, sizeof(JSProperty) * sh->prop_size);',
             '    p->prop = tail ? (JSProperty *)(p + 1) : js_malloc(ctx, sizeof(JSProperty) * sh->prop_size);')
    q = once(q,'    js_free_rt(rt, p->prop);',
             '    if (!p->v7_prop_inline)\n        js_free_rt(rt, p->prop);')
    q = once(q,'''        s->obj_count++;
        if (p->prop) {
            s->memory_used_count++;
            s->prop_size += sh->prop_size * sizeof(*p->prop);''', '''        s->obj_count++;
        if (p->v7_has_inline_tail)
            s->obj_size += V7_INLINE_CAP * sizeof(JSProperty);
        if (p->prop) {
            if (!p->v7_prop_inline) {
                s->memory_used_count++;
                s->prop_size += sh->prop_size * sizeof(*p->prop);
            }''')
    assert not re.search(r'js_realloc\(ctx, p->prop', q[q.index(marker):])
    files['quickjs.c'] = q
    if direct:
        files['read_ic_opcodes.inc'] = once(files['read_ic_opcodes.inc'],
            'val = JS_DupValue(ctx, p->prop[offset].u.value);',
            'val = JS_DupValue(ctx, (p->v7_prop_inline ? (JSProperty *)(p + 1) : p->prop)[offset].u.value);')
    return files


def io_diagnostic(files):
    q=files['quickjs.c']
    marker='/* make space to hold at least \'count\' properties */'
    helpers='''static unsigned long long v7_created[17], v7_used[17], v7_hit_offset[17];
static unsigned long long v7_obj_requests, v7_prop_requests, v7_requested_bytes;
static void __attribute__((destructor)) v7_report(void) {
    fprintf(stderr,"V7_IO_HIST {\\\"sizeof_object\\\":%zu,\\\"sizeof_property\\\":%zu,\\\"capacity\\\":[",sizeof(JSObject),sizeof(JSProperty));
    for(int i=0;i<17;i++) fprintf(stderr,"%s%llu",i?",":"",v7_created[i]);
    fprintf(stderr,"],\\\"used_at_free\\\":[");
    for(int i=0;i<17;i++) fprintf(stderr,"%s%llu",i?",":"",v7_used[i]);
    fprintf(stderr,"],\\\"hit_offset\\\":[");
    for(int i=0;i<17;i++) fprintf(stderr,"%s%llu",i?",":"",v7_hit_offset[i]);
    fprintf(stderr,"],\\\"obj_requests\\\":%llu,\\\"prop_requests\\\":%llu,\\\"requested_bytes\\\":%llu}\\n",v7_obj_requests,v7_prop_requests,v7_requested_bytes);
}
'''
    q=once(q,marker,helpers+marker)
    q=once(q,'    p->shape = sh;\n    p->prop = js_malloc(ctx, sizeof(JSProperty) * sh->prop_size);',
       '''    p->shape = sh;
    if (class_id == JS_CLASS_OBJECT) {
        v7_created[sh->prop_size < 16 ? sh->prop_size : 16]++;
        v7_obj_requests++; v7_prop_requests++;
        v7_requested_bytes += sizeof(JSObject) + sizeof(JSProperty) * sh->prop_size;
    }
    p->prop = js_malloc(ctx, sizeof(JSProperty) * sh->prop_size);''')
    q=once(q,'    p->free_mark = 1; /* used to tell the object is invalid when',
       '''    if (p->class_id == JS_CLASS_OBJECT)
        v7_used[p->shape->prop_count < 16 ? p->shape->prop_count : 16]++;
    p->free_mark = 1; /* used to tell the object is invalid when''')
    files['quickjs.c']=q
    files['read_ic_opcodes.inc']=once(files['read_ic_opcodes.inc'],'RDI_COUNT(hits);',
          'RDI_COUNT(hits); v7_hit_offset[offset < 16 ? offset : 16]++;')
    return files


def extra_read_ops(files, suffix):
    """Runtime-only five-byte reads, restored to original atom encoding on write."""
    op1,op2='get_field_'+suffix,'get_field2_'+suffix
    files['quickjs-opcode.h']=once(files['quickjs-opcode.h'],'#undef DEF',
       'DEF('+op1+', 5, 1, 1, u32)\nDEF('+op2+', 5, 1, 2, u32)\n\n#undef DEF')
    q=files['quickjs.c']
    old='op == OP_get_field_rdi || op == OP_get_field2_rdi'
    assert q.count(old)==2
    q=q.replace(old,old+' || op == OP_'+op1+' || op == OP_'+op2)
    q=once(q,'op = (op == OP_get_field_rdi) ? OP_get_field : OP_get_field2;',
           'op = (op == OP_get_field_rdi || op == OP_'+op1+') ? OP_get_field : OP_get_field2;')
    files['quickjs.c']=q
    return files


def adaptive_poly(files):
    files=extra_read_ops(files,'ap')
    files['read_ic_types.h']+='''
/* The mono record stays 16 bytes. Only a poly record uses this owned table. */
#define AP_POLY_FLAG UINT32_C(0x80000000)
typedef struct APEntry { JSShape *shape; uint32_t offset; } APEntry;
typedef struct APTable { uint32_t count, capacity; APEntry entries[]; } APTable;
'''
    helpers='''
static void ap_release(JSRuntime *rt, ReadICSite *s)
{
    JSShape *old=s->shape;
    uint32_t flags=s->prop_offset;
    s->shape=NULL; s->prop_offset=0;
    if (flags & AP_POLY_FLAG) {
        APTable *table=(APTable *)old;
        for (uint32_t i=0;i<table->count;i++) js_free_shape(rt,table->entries[i].shape);
        js_free_rt(rt,table);
    } else js_free_shape_null(rt,old);
}
static force_inline uint32_t ap_probe(ReadICSite *s, JSShape *shape)
{
    APTable *table=(APTable *)s->shape;
    for(uint32_t i=0;i<table->count;i++)
        if(table->entries[i].shape==shape) return table->entries[i].offset;
    return UINT32_MAX;
}
static void ap_update(JSContext *ctx, ReadICSite *s, JSShape *shape,
                      uint32_t offset, uint8_t *opcode)
{
    APTable *table;
    if(offset & AP_POLY_FLAG) return;
    if (!(s->prop_offset & AP_POLY_FLAG)) {
        if (!s->shape) { s->shape=js_dup_shape(shape);s->prop_offset=offset;return; }
        if (s->shape==shape) { s->prop_offset=offset;return; }
        table=js_mallocz_rt(ctx->rt,sizeof(*table)+2*sizeof(APEntry));
        if(!table) return; /* Optional optimization: no JS exception. */
        table->capacity=table->count=2;
        table->entries[0]=(APEntry){s->shape,s->prop_offset};
        table->entries[1]=(APEntry){js_dup_shape(shape),offset};
        s->shape=(JSShape *)table; s->prop_offset=AP_POLY_FLAG;
        *opcode=(*opcode==OP_get_field_rdi)?OP_get_field_ap:OP_get_field2_ap;
        return;
    }
    table=(APTable *)s->shape;
    for(uint32_t i=0;i<table->count;i++) {
        if(table->entries[i].shape==shape) { table->entries[i].offset=offset;return; }
    }
    if(table->count==4) {
        /* Publish the ordinary opcode/atom before releasing edges (reentry). */
        JS_DupAtom(ctx,s->atom);
        *opcode=(*opcode==OP_get_field_ap)?OP_get_field:OP_get_field2;
        put_u32(opcode+1,s->atom);
        ap_release(ctx->rt,s);
        return;
    }
    if(table->capacity==2) {
        APTable *next=js_mallocz_rt(ctx->rt,sizeof(*next)+4*sizeof(APEntry));
        if(!next) return;
        next->capacity=4;next->count=2;
        memcpy(next->entries,table->entries,2*sizeof(APEntry));
        s->shape=(JSShape *)next;js_free_rt(ctx->rt,table);table=next;
    }
    table->entries[table->count++]=(APEntry){js_dup_shape(shape),offset};
}
'''
    rt=files['read_ic_runtime.inc']
    rt=once(rt,'static void rdi_free(',helpers+'\nstatic void rdi_free(')
    rt=once(rt,'        js_free_shape_null(rt, s->shape);','        ap_release(rt,s);')
    files['read_ic_runtime.inc']=rt
    ops=files['read_ic_opcodes.inc']
    ops=once(ops,'#define GET_READ_IC(name, keep)', '#define GET_READ_IC(name, keep, poly)')
    ops=once(ops,'offset = rdi_probe(site, p->shape RDI_DARG(d));',
             'offset = (poly) ? ap_probe(site,p->shape) : rdi_probe(site,p->shape RDI_DARG(d));')
    ops=once(ops,'rdi_update(ctx, site, p->shape, pr - p->prop RDI_DARG(d));',
             'ap_update(ctx,site,p->shape,pr-p->prop,(uint8_t *)pc-5);')
    ops=ops.replace('GET_READ_IC(get_field_rdi, 0);','GET_READ_IC(get_field_rdi, 0, 0);').replace(
        'GET_READ_IC(get_field2_rdi, 1);','GET_READ_IC(get_field2_rdi, 1, 0);')
    ops=once(ops,'#undef GET_READ_IC','''        CASE(OP_get_field_ap):
            GET_READ_IC(get_field_ap, 0, 1);
            BREAK;
        CASE(OP_get_field2_ap):
            GET_READ_IC(get_field2_ap, 1, 1);
            BREAK;
#undef GET_READ_IC''')
    files['read_ic_opcodes.inc']=ops
    q=files['quickjs.c']
    q=once(q,'''                if (b->read_ic_sites[ri].shape)
                    mark_func(rt, &b->read_ic_sites[ri].shape->header);''', '''                ReadICSite *s=&b->read_ic_sites[ri];
                if (s->prop_offset & AP_POLY_FLAG) {
                    APTable *table=(APTable *)s->shape;
                    for(uint32_t j=0;j<table->count;j++)
                        mark_func(rt,&table->entries[j].shape->header);
                } else if(s->shape) mark_func(rt,&s->shape->header);''')
    files['quickjs.c']=q
    return files


def adaptive_quicken(files):
    files=extra_read_ops(files,'aq')
    files['read_ic_types.h']=once(files['read_ic_types.h'],'    JSAtom atom;\n} ReadICSite;',
       '''    JSAtom atom;
    uint32_t pc_offset, exit_entry;
    uint8_t observed, misses, state, retried;
} ReadICSite;''')
    q=files['quickjs.c']
    q=once(q,'    uint8_t read_ic_ready;', '    uint8_t read_ic_ready;\n    uint8_t aq_pending;\n    uint32_t aq_entries;')
    q=once(q,'    pc = b->byte_code_buf;\n',
       '    aq_entry(caller_ctx,b);\n    pc = b->byte_code_buf;\n')
    files['quickjs.c']=q
    helpers='''
enum { AQ_OBSERVE, AQ_MONO, AQ_EXIT };
static void aq_exit(JSContext *ctx, JSFunctionBytecode *b, ReadICSite *s, uint8_t *opcode)
{
    JSShape *old=s->shape;
    JS_DupAtom(ctx,s->atom);
    *opcode=(*opcode==OP_get_field_rdi || *opcode==OP_get_field_aq)?OP_get_field:OP_get_field2;
    put_u32(opcode+1,s->atom);
    s->state=AQ_EXIT;s->shape=NULL;s->prop_offset=0;s->exit_entry=b->aq_entries;
    if(!s->retried) b->aq_pending=1;
    js_free_shape_null(ctx->rt,old);
}
static force_inline void aq_entry(JSContext *ctx, JSFunctionBytecode *b)
{
    if(unlikely(b->aq_pending)) {
        b->aq_entries++; /* cooldown clock advances at every pending function entry */
        unsigned pending=0;
        for(uint32_t i=0;i<b->read_ic_count;i++) {
            ReadICSite *s=&b->read_ic_sites[i];
            if(s->state!=AQ_EXIT || s->retried) continue;
            if((uint32_t)(b->aq_entries-s->exit_entry)<32) { pending=1;continue; }
            uint8_t *op=b->byte_code_buf+s->pc_offset;
            assert(*op==OP_get_field || *op==OP_get_field2);
            *op=(*op==OP_get_field)?OP_get_field_aq:OP_get_field2_aq;
            put_u32(op+1,(uint8_t *)s-(op+1));
            s->state=AQ_OBSERVE;s->observed=s->misses=0;s->retried=1;
            JS_FreeAtom(ctx,s->atom); /* ordinary operand's extra ownership */
        }
        b->aq_pending=pending;
    }
}
'''
    rt=files['read_ic_runtime.inc']
    rt=once(rt,'static void rdi_free(',helpers+'\nstatic void rdi_free(')
    rt=once(rt,'''    js_dup_shape(shape);
    js_free_shape_null(ctx->rt, s->shape);
    s->shape = shape;
    s->prop_offset = offset;''', '''    JSShape *old=s->shape;
    js_dup_shape(shape);
    s->shape=shape;s->prop_offset=offset;
    js_free_shape_null(ctx->rt,old);''')
    files['read_ic_runtime.inc']=rt
    prep=files['read_ic_prepare.inc']
    prep=once(prep,'            b->read_ic_sites[index].atom = get_u32(pc + 1);',
         '            b->read_ic_sites[index].pc_offset = pos;\n            b->read_ic_sites[index].atom = get_u32(pc + 1);')
    prep=once(prep,'*pc = (op == OP_get_field) ? OP_get_field_rdi : OP_get_field2_rdi;',
                   '*pc = (op == OP_get_field) ? OP_get_field_aq : OP_get_field2_aq;')
    files['read_ic_prepare.inc']=prep
    ops=files['read_ic_opcodes.inc']
    ops=once(ops,'#define GET_READ_IC(name, keep)', '#define GET_READ_IC(name, keep, observe)')
    ops=once(ops,'        RDI_QUERY();',
         '        RDI_QUERY(); \\\n        if((observe) && site->observed<8) site->observed++;')
    ops=once(ops,'offset = rdi_probe(site, p->shape RDI_DARG(d));',
             'offset = (observe) ? UINT32_MAX : rdi_probe(site,p->shape RDI_DARG(d));')
    ops=once(ops,'RDI_COUNT(hits);','RDI_COUNT(hits); if(site->misses) site->misses=0;')
    ops=once(ops,'        RDI_COUNT(fallback);',
        '''        if(!(observe) && site->state==AQ_MONO && ++site->misses>=4) \\
            aq_exit(ctx,b,site,(uint8_t *)pc-5); \\
        RDI_COUNT(fallback);''')
    ops=once(ops,'rdi_update(ctx, site, p->shape, pr - p->prop RDI_DARG(d));',
       '''if(site->state==AQ_MONO || (site->state==AQ_OBSERVE && site->observed==8)) { \\
                            rdi_update(ctx,site,p->shape,pr-p->prop RDI_DARG(d)); \\
                            site->state=AQ_MONO; \\
                            *((uint8_t *)pc-5)=(keep)?OP_get_field2_rdi:OP_get_field_rdi; \\
                        }''')
    ops=once(ops,'    name ## _done:', '''    name ## _done: \\
        if(site->state==AQ_OBSERVE && site->observed==8) \\
            aq_exit(ctx,b,site,(uint8_t *)pc-5);''')
    ops=ops.replace('GET_READ_IC(get_field_rdi, 0);','GET_READ_IC(get_field_rdi, 0, 0);').replace(
        'GET_READ_IC(get_field2_rdi, 1);','GET_READ_IC(get_field2_rdi, 1, 0);')
    ops=once(ops,'#undef GET_READ_IC','''        CASE(OP_get_field_aq):
            GET_READ_IC(get_field_aq, 0, 1);
            BREAK;
        CASE(OP_get_field2_aq):
            GET_READ_IC(get_field2_aq, 1, 1);
            BREAK;
#undef GET_READ_IC''')
    files['read_ic_opcodes.inc']=ops
    return files


def transition(files):
    files['read_ic_types.h']+='''
typedef struct STSite {
    JSShape *old_shape, *new_shape, *guards[2];
    uint32_t offset;
    JSAtom atom;
    uint8_t depth;
} STSite;
'''
    q=files['quickjs.c']
    q=once(q,'    ReadICSite *read_ic_sites;',
        '    STSite *st_sites;\n    uint32_t st_count;\n    ReadICSite *read_ic_sites;')
    q=once(q,'            if (b->realm)\n                mark_func(rt, &b->realm->header);', '''            for(uint32_t i=0;i<b->st_count;i++) {
                STSite *s=&b->st_sites[i];
                if(s->old_shape) mark_func(rt,&s->old_shape->header);
                if(s->new_shape) mark_func(rt,&s->new_shape->header);
                for(unsigned j=0;j<s->depth;j++) if(s->guards[j]) mark_func(rt,&s->guards[j]->header);
            }
            if (b->realm)
                mark_func(rt, &b->realm->header);''')
    # Writer operates on a copy and restores atom ownership/encoding.
    writer='''        if (op == OP_get_field_rdi || op == OP_get_field2_rdi) {
            uint32_t delta = get_u32(bc_buf + pos + 1);'''
    q=once(q,writer,'''        if(op==OP_put_field_st) {
            STSite *site=(STSite *)(b->byte_code_buf+pos+1+get_u32(bc_buf+pos+1));
            assert(site>=b->st_sites && site<b->st_sites+b->st_count);
            bc_buf[pos]=op=OP_put_field;put_u32(bc_buf+pos+1,site->atom);
        }
'''+writer)
    reader='if (op == OP_get_field_rdi || op == OP_get_field2_rdi) {'
    # Only the reader occurrence remains apart from the writer with following delta.
    start=q.index('static int JS_ReadFunctionBytecode') if 'static int JS_ReadFunctionBytecode' in q else q.index('static int JS_ReadFunctionTag')
    head,tail=q[:start],q[start:]
    assert reader in tail
    tail=tail.replace(reader,'if (op == OP_get_field_rdi || op == OP_get_field2_rdi || op==OP_put_field_st) {',1)
    q=head+tail
    files['quickjs.c']=q
    files['quickjs-opcode.h']=once(files['quickjs-opcode.h'],'#undef DEF',
        'DEF(put_field_st, 5, 2, 0, u32)\n\n#undef DEF')
    prep=files['read_ic_prepare.inc']
    prep=once(prep,'uint32_t count = 0, index = 0;','uint32_t count = 0, index = 0, stores = 0, si = 0;')
    prep=once(prep,'        if (op == OP_get_field || op == OP_get_field2) count++;',
        '        if (op == OP_get_field || op == OP_get_field2) count++;\n        if (op == OP_put_field) stores++;')
    prep=once(prep,'    if (!count) return 0;','    if (!count && !stores) return 0;')
    prep=once(prep,'    total = code_size + count * sizeof(ReadICSite);',
        '''    total = code_size + count * sizeof(ReadICSite);
    if(stores>(SIZE_MAX-total)/sizeof(STSite)) { JS_ThrowOutOfMemory(ctx);return -1; }
    total += stores * sizeof(STSite);''')
    prep=once(prep,'    b->read_ic_count = count;',
        '    b->read_ic_count = count;\n    b->st_sites=(STSite *)(b->read_ic_sites+count);\n    b->st_count=stores;')
    prep=once(prep,'        if (op == OP_get_field || op == OP_get_field2) {', '''        if(op==OP_put_field) {
            STSite *s=&b->st_sites[si++];s->atom=get_u32(pc+1);
            *pc=OP_put_field_st;put_u32(pc+1,(uint8_t *)s-(pc+1));
        }
        if (op == OP_get_field || op == OP_get_field2) {''')
    prep=once(prep,'    assert(index == count);','    assert(index == count && si == stores);')
    files['read_ic_prepare.inc']=prep
    helpers='''
static void st_clear(JSRuntime *rt, STSite *s)
{
    STSite old=*s;
    s->old_shape=s->new_shape=NULL;s->depth=0;
    js_free_shape_null(rt,old.old_shape);js_free_shape_null(rt,old.new_shape);
    for(unsigned i=0;i<old.depth;i++) js_free_shape_null(rt,old.guards[i]);
}
static int st_ordinary(JSObject *p)
{ return p->class_id==JS_CLASS_OBJECT && !p->is_exotic && p->extensible && p->shape->is_hashed; }
static int st_snapshot(JSObject *p, JSAtom atom, STSite *s)
{
    JSProperty *pr;
    if(!st_ordinary(p) || find_own_property(&pr,p,atom)) return 0;
    s->old_shape=p->shape;s->depth=0;
    for(p=p->shape->proto;p;p=p->shape->proto) {
        if(s->depth==2 || p->class_id!=JS_CLASS_OBJECT || p->is_exotic || !p->shape->is_hashed || find_own_property(&pr,p,atom)) return 0;
        s->guards[s->depth++]=p->shape;
    }
    return 1;
}
static force_inline int st_guards(JSObject *p, const STSite *s)
{
    p=p->shape->proto;
    for(unsigned i=0;i<s->depth;i++) {
        if(!p || p->is_exotic || p->class_id!=JS_CLASS_OBJECT || p->shape!=s->guards[i]) return 0;
        p=p->shape->proto;
    }
    return !p;
}
static int st_set(JSContext *ctx, STSite *s, JSValueConst obj, JSValue value)
{
    JSObject *p;
    if(JS_VALUE_GET_TAG(obj)==JS_TAG_OBJECT) {
        p=JS_VALUE_GET_OBJ(obj);
        if(s->old_shape && p->shape==s->old_shape && st_ordinary(p) && st_guards(p,s)) {
            JSShape *old=p->shape,*next=s->new_shape;
            if(next->prop_size!=old->prop_size) {
                JSProperty *prop=js_realloc(ctx,p->prop,sizeof(*prop)*next->prop_size);
                if(!prop) { JS_FreeValue(ctx,value);return -1; }
                p->prop=prop;
            }
            p->shape=js_dup_shape(next);
            p->prop[s->offset].u.value=value;
            js_free_shape(ctx->rt,old);
            return 1;
        }
    }
    STSite observed={0};
    int eligible=JS_VALUE_GET_TAG(obj)==JS_TAG_OBJECT && st_snapshot(JS_VALUE_GET_OBJ(obj),s->atom,&observed);
    if(eligible) {
        js_dup_shape(observed.old_shape);
        for(unsigned i=0;i<observed.depth;i++) js_dup_shape(observed.guards[i]);
    }
    int ret=JS_SetPropertyInternal(ctx,obj,s->atom,value,obj,JS_PROP_THROW_STRICT);
    if(eligible) {
        p=JS_VALUE_GET_OBJ(obj);
        JSShape *old=observed.old_shape,*next=p->shape;
        if(ret>0 && st_ordinary(p) && st_guards(p,&observed) && next->proto==old->proto && next->prop_count==old->prop_count+1) {
            JSShapeProperty *a=get_shape_prop(old),*z=get_shape_prop(next);
            unsigned i;
            for(i=0;i<old->prop_count;i++) if(a[i].atom!=z[i].atom || a[i].flags!=z[i].flags) break;
            if(i==old->prop_count && z[i].atom==s->atom && z[i].flags==JS_PROP_C_W_E) {
                STSite previous=*s;
                observed.new_shape=js_dup_shape(next);observed.offset=i;observed.atom=s->atom;
                *s=observed; /* publish all new roots before releasing previous edges */
                observed=(STSite){0};st_clear(ctx->rt,&previous);
            }
        }
        st_clear(ctx->rt,&observed);
    }
    return ret;
}
'''
    rt=files['read_ic_runtime.inc']
    rt=once(rt,'static void rdi_free(',helpers+'\nstatic void rdi_free(')
    rt=once(rt,'    if (b->read_ic_sites) {',
        '''    for(uint32_t j=0;j<b->st_count;j++) {
        JS_FreeAtomRT(rt,b->st_sites[j].atom);st_clear(rt,&b->st_sites[j]);
    }
    b->st_sites=NULL;b->st_count=0;
    if (b->read_ic_sites) {''')
    files['read_ic_runtime.inc']=rt
    files['read_ic_opcodes.inc']+='''
        CASE(OP_put_field_st):
            {
                STSite *s=(STSite *)(pc+get_u32(pc));
                pc+=4;sf->cur_pc=pc;
                int ret;
                if(JS_VALUE_GET_TAG(sp[-2])==JS_TAG_OBJECT) {
                    JSObject *p=JS_VALUE_GET_OBJ(sp[-2]);
                    JSProperty *pr;JSShapeProperty *prs;
                    if(s->old_shape && p->shape==s->old_shape)
                        ret=st_set(ctx,s,sp[-2],sp[-1]);
                    else {
                        prs=find_own_property(&pr,p,s->atom);
                        if(prs && (prs->flags & (JS_PROP_TMASK|JS_PROP_WRITABLE|JS_PROP_LENGTH))==JS_PROP_WRITABLE) {
                            /* Existing own field: upstream lookup and set_value, not a write IC. */
                            set_value(ctx,&pr->u.value,sp[-1]);ret=1;
                        } else ret=st_set(ctx,s,sp[-2],sp[-1]);
                    }
                } else ret=st_set(ctx,s,sp[-2],sp[-1]);
                JS_FreeValue(ctx,sp[-2]);sp-=2;
                if(unlikely(ret<0)) goto exception;
            }
            BREAK;
'''
    return files


def io_stats(files,cap):
    q=files['quickjs.c']
    marker='/* v7: inline storage is an allocation property, not a shape property. */'
    decl='''static uint64_t io_obj_allocs,io_arrays,io_obj_bytes,io_array_bytes,io_tail_allocs,io_spills,io_waste_slots;
static uint64_t io_hits,io_inline_hits;
static void __attribute__((destructor)) v7_io_stats_report(void) {
 fprintf(stderr,"V7_IO_COVERAGE %llu %llu\\n",(unsigned long long)io_hits,(unsigned long long)io_inline_hits);
 fprintf(stderr,"V7_IO_STATS {\\\"object_requests\\\":%llu,\\\"array_requests\\\":%llu,\\\"object_requested_bytes\\\":%llu,\\\"array_requested_bytes\\\":%llu,\\\"tail_allocations\\\":%llu,\\\"spills\\\":%llu,\\\"unused_tail_slots_at_free\\\":%llu}\\n",
 (unsigned long long)io_obj_allocs,(unsigned long long)io_arrays,(unsigned long long)io_obj_bytes,(unsigned long long)io_array_bytes,
 (unsigned long long)io_tail_allocs,(unsigned long long)io_spills,(unsigned long long)io_waste_slots);
}
'''
    q=once(q,marker,decl+marker)
    q=once(q,'    p = js_malloc(ctx, sizeof(JSObject) + tail);',
       '''    if(class_id==JS_CLASS_OBJECT) {
        io_obj_allocs++;io_obj_bytes+=sizeof(JSObject)+tail;
        if(tail) io_tail_allocs++;
    }
    p = js_malloc(ctx, sizeof(JSObject) + tail);''')
    q=once(q,'    p->prop = tail ? (JSProperty *)(p + 1) : js_malloc(ctx, sizeof(JSProperty) * sh->prop_size);',
        '''    if(!tail && class_id==JS_CLASS_OBJECT) {io_arrays++;io_array_bytes+=sizeof(JSProperty)*sh->prop_size;}
    p->prop = tail ? (JSProperty *)(p + 1) : js_malloc(ctx, sizeof(JSProperty) * sh->prop_size);''')
    q=once(q,'    next = js_malloc(ctx, sizeof(*next) * count);',
       '    io_spills++;io_arrays++;io_array_bytes+=sizeof(*next)*count;\n    next = js_malloc(ctx, sizeof(*next) * count);')
    q=once(q,'    if (!p->v7_prop_inline)\n        return js_realloc(ctx, p->prop, sizeof(*p->prop) * count);',
       '''    if (!p->v7_prop_inline) {
        if(p->class_id==JS_CLASS_OBJECT) {io_arrays++;io_array_bytes+=sizeof(*p->prop)*count;}
        return js_realloc(ctx, p->prop, sizeof(*p->prop) * count);
    }''')
    q=once(q,'    p->free_mark = 1; /* used to tell the object is invalid when',
       '''    if(p->v7_has_inline_tail) {
        uint32_t used=p->v7_prop_inline?p->shape->prop_count:0;
        if(used<V7_INLINE_CAP) io_waste_slots+=V7_INLINE_CAP-used;
    }
    p->free_mark = 1; /* used to tell the object is invalid when''')
    files['quickjs.c']=q
    files['read_ic_opcodes.inc']=once(files['read_ic_opcodes.inc'],'RDI_COUNT(hits);',
        'RDI_COUNT(hits);io_hits++;io_inline_hits+=p->v7_prop_inline;')
    return files


def io_base_stats(files):
    # Reuse only the diagnostic globals/printing, not any IO storage logic.
    template=io_stats(inline_objects(files.copy(),2,False),2)['quickjs.c']
    declaration=template[template.index('static uint64_t io_obj_allocs'):template.index('/* v7: inline storage')]
    q=files['quickjs.c']
    marker='/* make space to hold at least \'count\' properties */'
    q=once(q,marker,declaration+marker)
    q=once(q,'    p = js_malloc(ctx, sizeof(JSObject));',
        '''    if(class_id==JS_CLASS_OBJECT) {io_obj_allocs++;io_obj_bytes+=sizeof(JSObject);}
    p = js_malloc(ctx, sizeof(JSObject));''')
    q=once(q,'    p->prop = js_malloc(ctx, sizeof(JSProperty) * sh->prop_size);',
        '''    if(class_id==JS_CLASS_OBJECT) {io_arrays++;io_array_bytes+=sizeof(JSProperty)*sh->prop_size;}
    p->prop = js_malloc(ctx, sizeof(JSProperty) * sh->prop_size);''')
    old='new_prop = js_realloc(ctx, p->prop, sizeof(new_prop[0]) * new_size);'
    assert q.count(old)==2
    q=q.replace(old,'if(p->class_id==JS_CLASS_OBJECT) {io_arrays++;io_array_bytes+=sizeof(*p->prop)*new_size;}\n    '+old)
    old='''new_prop = js_realloc(ctx, p->prop, sizeof(p->prop[0]) *
                                      new_sh->prop_size);'''
    q=once(q,old,'''if(p->class_id==JS_CLASS_OBJECT) {io_arrays++;io_array_bytes+=sizeof(*p->prop)*new_sh->prop_size;}
                '''+old)
    files['quickjs.c']=q
    files['read_ic_opcodes.inc']=once(files['read_ic_opcodes.inc'],'RDI_COUNT(hits);','RDI_COUNT(hits);io_hits++;')
    return files


def policy_stats(files,kind):
    """Narrow integer counters, separate binaries. Never performance versions."""
    fields=['read_queries','read_hits','read_fallback','updates','comparisons','sites_total',
            'mono_probes','poly_probes','mono_installed','mono_active','mono_peak',
            'alloc2','alloc4','requested_bytes','live_bytes','peak_bytes','blocks_live','blocks_peak',
            'entry_checks','pending_entries','specializations','exits','reentries',
            'store_queries','transition_hits','transition_oom','existing_own_fast','generic_set','eligible_snapshot','transition_fills','hash_shape_searches']
    declaration='static uint64_t '+','.join('v7_stat_'+x for x in fields)+';\n'
    declaration+='static void __attribute__((destructor)) v7_policy_report(void) {\n'
    declaration+='fprintf(stderr,"V7_POLICY '+kind+' '+ ' '.join(x+'=%llu' for x in fields)+'\\n",'+','.join('(unsigned long long)v7_stat_'+x for x in fields)+');\n}\n'
    rt=declaration+files['read_ic_runtime.inc']
    rt=rt.replace('RDI_COUNT(comparisons);','RDI_COUNT(comparisons);v7_stat_comparisons++;')
    rt=rt.replace('RDI_COUNT(updates);','RDI_COUNT(updates);v7_stat_updates++;')
    rt=once(rt,'static force_inline uint32_t rdi_probe(ReadICSite *s, JSShape *shape RDI_DPARAM)\n{',
        'static force_inline uint32_t rdi_probe(ReadICSite *s, JSShape *shape RDI_DPARAM)\n{\n    v7_stat_mono_probes++;')
    ops=files['read_ic_opcodes.inc']
    ops=once(ops,'RDI_QUERY();','RDI_QUERY();v7_stat_read_queries++;')
    ops=once(ops,'RDI_COUNT(hits);','RDI_COUNT(hits);v7_stat_read_hits++;')
    ops=once(ops,'RDI_COUNT(fallback);','RDI_COUNT(fallback);v7_stat_read_fallback++;')
    files['read_ic_prepare.inc']=once(files['read_ic_prepare.inc'],'    b->read_ic_count = count;',
        '    b->read_ic_count = count;v7_stat_sites_total+=count;')
    if kind=='AP':
        rt=once(rt,'    APTable *table=(APTable *)s->shape;\n    for(uint32_t i=0;i<table->count;i++)\n        if(table->entries[i].shape==shape) return table->entries[i].offset;',
          '''    APTable *table=(APTable *)s->shape;v7_stat_poly_probes++;
    for(uint32_t i=0;i<table->count;i++) {
        v7_stat_comparisons++;
        if(table->entries[i].shape==shape) return table->entries[i].offset;
    }''')
        rt=once(rt,'    APTable *table;\n    if(offset & AP_POLY_FLAG) return;',
            '    APTable *table;v7_stat_updates++;\n    if(offset & AP_POLY_FLAG) return;')
        rt=once(rt,'if (!s->shape) { s->shape=js_dup_shape(shape);s->prop_offset=offset;return; }',
            'if (!s->shape) {v7_stat_mono_installed++;v7_stat_mono_active++;if(v7_stat_mono_active>v7_stat_mono_peak)v7_stat_mono_peak=v7_stat_mono_active;s->shape=js_dup_shape(shape);s->prop_offset=offset;return; }')
        rt=once(rt,'        table=js_mallocz_rt(ctx->rt,sizeof(*table)+2*sizeof(APEntry));',
            '        v7_stat_alloc2++;v7_stat_requested_bytes+=sizeof(*table)+2*sizeof(APEntry);\n        table=js_mallocz_rt(ctx->rt,sizeof(*table)+2*sizeof(APEntry));')
        rt=once(rt,'        table->capacity=table->count=2;',
            '''        v7_stat_mono_active--;v7_stat_live_bytes+=sizeof(*table)+2*sizeof(APEntry);v7_stat_blocks_live++;
        if(v7_stat_live_bytes>v7_stat_peak_bytes)v7_stat_peak_bytes=v7_stat_live_bytes;
        if(v7_stat_blocks_live>v7_stat_blocks_peak)v7_stat_blocks_peak=v7_stat_blocks_live;
        table->capacity=table->count=2;''')
        rt=once(rt,'        APTable *next=js_mallocz_rt(ctx->rt,sizeof(*next)+4*sizeof(APEntry));',
            '        v7_stat_alloc4++;v7_stat_requested_bytes+=sizeof(APTable)+4*sizeof(APEntry);\n        APTable *next=js_mallocz_rt(ctx->rt,sizeof(*next)+4*sizeof(APEntry));')
        rt=once(rt,'        next->capacity=4;next->count=2;',
            '''        v7_stat_live_bytes+=sizeof(*next)+4*sizeof(APEntry);v7_stat_blocks_live++;
        if(v7_stat_live_bytes>v7_stat_peak_bytes)v7_stat_peak_bytes=v7_stat_live_bytes;
        if(v7_stat_blocks_live>v7_stat_blocks_peak)v7_stat_blocks_peak=v7_stat_blocks_live;
        v7_stat_live_bytes-=sizeof(*table)+2*sizeof(APEntry);v7_stat_blocks_live--;
        next->capacity=4;next->count=2;''')
        rt=once(rt,'        js_free_rt(rt,table);\n    } else js_free_shape_null(rt,old);',
            '''        v7_stat_live_bytes-=sizeof(*table)+table->capacity*sizeof(APEntry);v7_stat_blocks_live--;
        js_free_rt(rt,table);
    } else { if(old)v7_stat_mono_active--;js_free_shape_null(rt,old); }''')
    elif kind=='AQ':
        rt=once(rt,'    JSShape *old=s->shape;\n    JS_DupAtom(ctx,s->atom);',
           '    JSShape *old=s->shape;v7_stat_exits++;\n    JS_DupAtom(ctx,s->atom);')
        rt=once(rt,'static force_inline void aq_entry(JSContext *ctx, JSFunctionBytecode *b)\n{',
           'static force_inline void aq_entry(JSContext *ctx, JSFunctionBytecode *b)\n{\n    v7_stat_entry_checks++;')
        rt=once(rt,'        b->aq_entries++;','        v7_stat_pending_entries++;b->aq_entries++;')
        rt=once(rt,'s->state=AQ_OBSERVE;s->observed=s->misses=0;s->retried=1;',
           's->state=AQ_OBSERVE;s->observed=s->misses=0;s->retried=1;v7_stat_reentries++;')
        ops=once(ops,'site->state=AQ_MONO;',
           'if(site->state!=AQ_MONO)v7_stat_specializations++;site->state=AQ_MONO;')
    elif kind=='ST':
        ops=once(ops,'STSite *s=(STSite *)(pc+get_u32(pc));',
           'STSite *s=(STSite *)(pc+get_u32(pc));v7_stat_store_queries++;')
        ops=once(ops,'set_value(ctx,&pr->u.value,sp[-1]);ret=1;',
           'v7_stat_existing_own_fast++;set_value(ctx,&pr->u.value,sp[-1]);ret=1;')
        rt=once(rt,'if(!prop) { JS_FreeValue(ctx,value);return -1; }',
           'if(!prop) {v7_stat_transition_oom++;JS_FreeValue(ctx,value);return -1; }')
        rt=once(rt,'            p->shape=js_dup_shape(next);',
           '            v7_stat_transition_hits++;p->shape=js_dup_shape(next);')
        rt=once(rt,'    if(eligible) {\n        js_dup_shape(observed.old_shape);',
           '    if(eligible) {\n        v7_stat_eligible_snapshot++;js_dup_shape(observed.old_shape);')
        rt=once(rt,'    int ret=JS_SetPropertyInternal(ctx,obj,s->atom,value,obj,JS_PROP_THROW_STRICT);',
           '    v7_stat_generic_set++;int ret=JS_SetPropertyInternal(ctx,obj,s->atom,value,obj,JS_PROP_THROW_STRICT);')
        rt=once(rt,'                *s=observed;','                v7_stat_transition_fills++;*s=observed;')
        # This older function is defined before the counter declarations, so use a forward extern declaration.
        q=files['quickjs.c']
        marker='static JSShape *find_hashed_shape_prop('
        begin=q.index(marker);brace=q.index('{',begin)
        q=q[:begin]+'extern uint64_t v7_hash_searches;\n'+q[begin:brace+1]+'\n    v7_hash_searches++;'+q[brace+1:]
        files['quickjs.c']=q
        declaration=declaration.replace('static void __attribute__((destructor))', 'uint64_t v7_hash_searches;\nstatic void __attribute__((destructor))')
        rt=rt.replace('static void __attribute__((destructor))', 'uint64_t v7_hash_searches;\nstatic void __attribute__((destructor))',1)
        rt=rt.replace('(unsigned long long)v7_stat_hash_shape_searches','(unsigned long long)v7_hash_searches',1)
    files['read_ic_runtime.inc']=rt
    files['read_ic_opcodes.inc']=ops
    return files


def render(label, seed):
    files=seed.copy()
    if label=='IO_BASE_STATS': return policy_stats(io_base_stats(files),'BASE')
    if label=='AP1_STATS': return policy_stats(adaptive_poly(files),'AP')
    if label=='AQ1_STATS': return policy_stats(adaptive_quicken(files),'AQ')
    if label=='ST1_STATS': return policy_stats(transition(files),'ST')
    if label in ['IO2_STATS','IO4_STATS']:
        return io_stats(inline_objects(files,int(label[2]),False),int(label[2]))
    if label.startswith('IO2_') or label.startswith('IO4_'):
        return inline_objects(files,int(label[2]),label.endswith('DIRECT'))
    if label=='IO_DIAG': return io_diagnostic(files)
    if label=='AP1': return adaptive_poly(files)
    if label=='AQ1': return adaptive_quicken(files)
    if label=='ST1': return transition(files)
    raise ValueError(label)
