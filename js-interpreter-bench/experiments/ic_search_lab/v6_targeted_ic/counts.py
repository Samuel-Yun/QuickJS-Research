"""Small whole-process counters, separate ELF/source layout and never timings."""
import json
from pathlib import Path
import re
import sys
import experiment as e
from variants import once, patch_apply

FIELDS=['get_field','get_field2','get_length','put_field','put_fast_ordinary','put_fast_other',
 'put_missing_own','put_descriptor_fallback','put_slow','put_created_after_slow','put_failed','property_creations','shape_clones',
 'shape_new','shape_inplace_prepare','shape_shared_prepare','property_array_growth',
 'ic_operations','ic_probe_calls','ic_hits','ic_fallback','ic_updates','ic_replacements',
 'ic_empty_fills','ic_retains','ic_releases','proto_hits','proto_updates','store_ic_hits','store_refreshes','call_fused',
 'compiled_functions','loaded_functions','interpreter_entries','functions_never_entered',
 'functions_entered_once','functions_entered_twice','functions_entered_hot',
 'prepare_calls','prepare_ns','site_bytes_requested','code_copy_bytes','live_linked_bytes','peak_linked_bytes']


def original(cid):
    seed=e.seed_module.seed('s001')
    if cid=='s001':return seed
    if cid in ['d03','d05']:
        return patch_apply(seed,(e.V5/'patches'/(cid+'.patch')).read_text())
    return e.candidate_files(cid)


def instrument(cid):
    files=dict(original(cid));q=files['quickjs.c']
    fields='\n'.join('    unsigned long long '+n+';' for n in FIELDS)
    prefix='''#include <time.h>
static struct {\n'''+fields+'''
} v6_count;
static __typeof__(v6_count) v6_before, v6_after;
static unsigned v6_timer_calls;
void v6_clock_boundary(void) {
    if (++v6_timer_calls==1) v6_before=v6_count;
    else if(v6_timer_calls==2) v6_after=v6_count;
}
static unsigned long long v6_attempt[256], v6_adjacent[256], v6_fused[256];
static unsigned long long v6_clock_ns(void) {
    struct timespec ts; if(clock_gettime(CLOCK_MONOTONIC,&ts)) return 0;
    return (unsigned long long)ts.tv_sec*1000000000ULL+ts.tv_nsec;
}
static void __attribute__((destructor)) v6_report(void) {
    fprintf(stderr,"V6_COUNTERS:{");
'''
    prefix+='\n'.join('    fprintf(stderr,"'+('' if i==0 else ',')+'\\"'+n+'\\":%llu",v6_count.'+n+');'
                      for i,n in enumerate(FIELDS))
    prefix+='''
    fprintf(stderr,",\\"timer_calls\\":%u",v6_timer_calls);
'''
    for field in ['compiled_functions','loaded_functions','interpreter_entries','prepare_calls','prepare_ns','site_bytes_requested','code_copy_bytes']:
        prefix+='    fprintf(stderr,",\\"run_'+field+'\\":%llu",v6_after.'+field+'-v6_before.'+field+');\n'
    prefix+='''
    fprintf(stderr,",\\"site_size\\":%zu,\\"shape_size\\":%zu,\\"function_header_size\\":%zu,\\"fusion\\":[",sizeof(ReadICSite),sizeof(JSShape),sizeof(JSFunctionBytecode));
    int first=1;
    for(int i=0;i<256;i++)if(v6_attempt[i] || v6_fused[i]) {
        fprintf(stderr,"%s{\\"opcode\\":%d,\\"attempts\\":%llu,\\"adjacent\\":%llu,\\"hits\\":%llu}",
                first?"":",",i,v6_attempt[i],v6_adjacent[i],v6_fused[i]);first=0;
    }
    fprintf(stderr,"]}\\n");
}

'''
    q=once(q,'static int rdi_prepare(JSContext *ctx, JSFunctionBytecode *b);',prefix+'static int rdi_prepare(JSContext *ctx, JSFunctionBytecode *b);')
    q=once(q,'    ReadICSite *read_ic_sites;', '    uint32_t v6_diagnostic_entries;\n    ReadICSite *read_ic_sites;')
    q=once(q,' restart:\n    for(;;)', ' restart:\n    ++v6_count.interpreter_entries; ++b->v6_diagnostic_entries;\n    for(;;)')
    free_at=q.rfind('    js_free(ctx, fd);\n')
    assert 'return JS_MKPTR(JS_TAG_FUNCTION_BYTECODE, b);' in q[free_at:free_at+300]
    q=q[:free_at]+'    ++v6_count.compiled_functions;\n'+q[free_at:]
    loaded_at=q.rfind('    b->realm = JS_DupContext(ctx);\n')
    assert 'return obj;' in q[loaded_at:loaded_at+180]
    q=q[:loaded_at]+'    ++v6_count.loaded_functions;\n'+q[loaded_at:]
    anchor='    rdi_free(rt, b);'
    q=once(q,anchor,'''    if (b->v6_diagnostic_entries==0) ++v6_count.functions_never_entered;
    else if (b->v6_diagnostic_entries==1) ++v6_count.functions_entered_once;
    else if (b->v6_diagnostic_entries==2) ++v6_count.functions_entered_twice;
    else ++v6_count.functions_entered_hot;
'''+anchor)
    for name in ['get_field','get_field2','get_length','put_field']:
        q=once(q,'        CASE(OP_'+name+'):', '        CASE(OP_'+name+'):\n            ++v6_count.'+name+';')
    # Only upstream put_field's existing body, not W1's additional handler.
    start=q.index('        CASE(OP_put_field):')
    stop=q.index('        CASE(OP_private_symbol):',start)
    body=q[start:stop]
    body=once(body,'                int ret;','                int ret, v6_had_own = 0;')
    body=once(body,'                    prs = find_own_property(&pr, p, atom);',
              '                    prs = find_own_property(&pr, p, atom);\n                    v6_had_own = prs != NULL;')
    body=once(body,'                    if (!prs)\n', '                    if (!prs) { ++v6_count.put_missing_own; goto put_field_slow_path; }\n                    if (0)\n')
    body=once(body,'                        /* fast path */',
              '                        if(p->class_id==JS_CLASS_OBJECT && !p->is_exotic) ++v6_count.put_fast_ordinary; else ++v6_count.put_fast_other;\n                        /* fast path */')
    body=once(body,'                    } else {\n                        goto put_field_slow_path;',
              '                    } else {\n                        ++v6_count.put_descriptor_fallback;\n                        goto put_field_slow_path;')
    body=once(body,'                put_field_slow_path:\n', '                put_field_slow_path:\n                    ++v6_count.put_slow;\n')
    body=once(body,'                    JS_FreeValue(ctx, obj);\n                    sp -= 2;\n                    if (unlikely(ret < 0))', '''                    if (ret < 0) ++v6_count.put_failed;
                    else if (!v6_had_own && JS_VALUE_GET_TAG(obj)==JS_TAG_OBJECT) {
                        p=JS_VALUE_GET_OBJ(obj);
                        if(p->class_id==JS_CLASS_OBJECT && !p->is_exotic && find_own_property(&pr,p,atom))
                            ++v6_count.put_created_after_slow;
                    }
                    JS_FreeValue(ctx, obj);
                    sp -= 2;
                    if (unlikely(ret < 0))''')
    q=q[:start]+body+q[stop:]
    if cid=='W1':
        start=q.index('        CASE(OP_v6_put_field):');stop=q.index('        CASE(OP_put_field):',start)
        body=q[start:stop]
        body=once(body,'        CASE(OP_v6_put_field):','        CASE(OP_v6_put_field):\n            ++v6_count.put_field;')
        body=once(body,'                            set_value(ctx, &p->prop[offset].u.value, sp[-1]);',
                  '                            ++v6_count.store_ic_hits; ++v6_count.put_fast_ordinary;\n                            set_value(ctx, &p->prop[offset].u.value, sp[-1]);')
        body=once(body,'\n                        prs = find_own_property(&pr, p, atom);\n',
                  '\n                        prs = find_own_property(&pr, p, atom);\n                        if (!prs) ++v6_count.put_missing_own;\n')
        body=once(body,'                            set_value(ctx, &pr->u.value, sp[-1]);',
                  '                            ++v6_count.put_fast_ordinary;\n                            set_value(ctx, &pr->u.value, sp[-1]);')
        body=once(body,'                                prs = find_own_property(&pr, p, atom);',
                  '                                ++v6_count.store_refreshes; prs = find_own_property(&pr, p, atom);')
        body=once(body,'                sf->cur_pc = pc;', '                ++v6_count.put_slow;\n                sf->cur_pc = pc;')
        q=q[:start]+body+q[stop:]
    # Aggregate true implementation events, not inferred time or JS op counts.
    q=once(q,'    /* update the shape hash */', '    ++v6_count.property_creations;\n    /* update the shape hash */')
    q=once(q,'    memcpy(&sh->header + 1, &sh1->header + 1,',
              '    ++v6_count.shape_clones;\n    memcpy(&sh->header + 1, &sh1->header + 1,')
    q=once(q,'    sh->prop_count = 0;\n', '    ++v6_count.shape_new;\n    sh->prop_count = 0;\n')
    anchor='''        } else {
            js_shape_hash_unlink(ctx->rt, sh);
            sh->is_hashed = FALSE;'''
    q=once(q,anchor,'''        } else {
            ++v6_count.shape_inplace_prepare;
            js_shape_hash_unlink(ctx->rt, sh);
            sh->is_hashed = FALSE;''')
    q=once(q,'            /* clone the shape (the resulting one is no longer hashed) */',
              '            ++v6_count.shape_shared_prepare;\n            /* clone the shape (the resulting one is no longer hashed) */')
    q=once(q,'    new_size = max_int(count, sh->prop_size * 3 / 2);',
              '    ++v6_count.property_array_growth;\n    new_size = max_int(count, sh->prop_size * 3 / 2);')
    if cid in ['d03','d05']:
        anchor='    JSValueConst receiver = (slot);'
        # Macro continuation is retained from the original line.
        q=once(q,anchor,'    ++v6_attempt[opcode]; if (*pc == OP_get_field_rdi) ++v6_adjacent[opcode]; \\\n'+anchor)
        q,n=re.subn(r'(?m)^(\s*)pc \+= 5;([ \t]+\\\n)',r'\1++v6_fused[opcode]; pc += 5;\2',q)
        assert n==1,n
    if cid=='B2':
        q=once(q,'    JSValueConst receiver = (slot);',
                 '    ++v6_attempt[opcode]; ++v6_adjacent[opcode]; \\\n    JSValueConst receiver = (slot);')
        q,n=re.subn(r'(?m)^(\s*)pc \+= 5;([ \t]+\\\n)',r'\1++v6_fused[opcode]; pc += 5;\2',q)
        assert n==1,n
    files['quickjs.c']=q
    op=files['read_ic_opcodes.inc']
    for name in ['get_field','get_field2']:
        op=once(op,'        CASE(OP_'+name+'_rdi):',
                '        CASE(OP_'+name+'_rdi):\n            ++v6_count.'+name+';')
    op=once(op,'        RDI_QUERY();','        ++v6_count.ic_operations; RDI_QUERY();')
    op=once(op,'                    RDI_COUNT(hits);','                    ++v6_count.ic_hits; RDI_COUNT(hits);')
    op=once(op,'        RDI_COUNT(fallback);','        ++v6_count.ic_fallback; RDI_COUNT(fallback);')
    if cid in ['P1','C1']:
        op=once(op,'                        val = JS_DupValue(ctx, holder->prop[site->prop_offset].u.value);',
                   '                        ++v6_count.proto_hits; val = JS_DupValue(ctx, holder->prop[site->prop_offset].u.value);')
    files['read_ic_opcodes.inc']=op
    r=files['read_ic_runtime.inc']
    r=once(r,'{\n#if RDI_CAPACITY == 1', '{\n    ++v6_count.ic_probe_calls;\n#if RDI_CAPACITY == 1')
    current='s->layout_id' if cid=='ID_READ' else 's->shape'
    incoming='shape->v6_layout_id' if cid=='ID_READ' else 'shape'
    r=once(r,'    RDI_COUNT(updates);',f'    ++v6_count.ic_updates; if (!{current}) ++v6_count.ic_empty_fills; else if ({current} != {incoming}) ++v6_count.ic_replacements;\n    RDI_COUNT(updates);')
    for value in ['shape','receiver','holder']:
        r=r.replace('    js_dup_shape('+value+');','    ++v6_count.ic_retains; js_dup_shape('+value+');')
    for value in ['s->shape','s->holder_shape','old','old_holder']:
        for runtime in ['ctx->rt','rt']:
            r=r.replace('js_free_shape_null('+runtime+', '+value+');',
                        'if ('+value+') ++v6_count.ic_releases; js_free_shape_null('+runtime+', '+value+');')
    if cid in ['P1','C1']:
        r=once(r,'    JSShape *old = s->shape, *old_holder = s->holder_shape;\n    js_dup_shape(receiver);',
                   '    ++v6_count.proto_updates;\n    JSShape *old = s->shape, *old_holder = s->holder_shape;\n    js_dup_shape(receiver);') if '    js_dup_shape(receiver);' in r else r.replace(
                       '    ++v6_count.ic_retains; js_dup_shape(receiver);',
                       '    ++v6_count.proto_updates; ++v6_count.ic_retains; js_dup_shape(receiver);')
    if cid=='C1':
        files['read_ic_opcodes.inc']=once(files['read_ic_opcodes.inc'],
            '            opcode = OP_call_method; pc++;', '            ++v6_count.call_fused; opcode = OP_call_method; pc++;')
    r=once(r,'    uint32_t i;\n', '    uint32_t i;\n    if (b->read_ic_sites) v6_count.live_linked_bytes -= (((size_t)b->byte_code_len + 7) & ~(size_t)7) + b->read_ic_count*sizeof(ReadICSite);\n')
    files['read_ic_runtime.inc']=r
    p=files['read_ic_prepare.inc']
    p=once(p,'    int pos, op;\n','    int pos, op;\n    unsigned long long v6_begin=v6_clock_ns(); ++v6_count.prepare_calls;\n')
    p=once(p,'    total = code_size + count * sizeof(ReadICSite);',
              '    total = code_size + count * sizeof(ReadICSite);\n    v6_count.site_bytes_requested += count*sizeof(ReadICSite);\n    v6_count.code_copy_bytes += code_size;')
    p=once(p,'    b->read_ic_sites = (ReadICSite *)(linked + code_size);',
              '    b->read_ic_sites = (ReadICSite *)(linked + code_size);\n    v6_count.live_linked_bytes += total;\n    if(v6_count.live_linked_bytes>v6_count.peak_linked_bytes) v6_count.peak_linked_bytes=v6_count.live_linked_bytes;')
    p=p.replace('return 0;', '{ v6_count.prepare_ns += v6_clock_ns()-v6_begin; return 0; }')
    p=p.replace('return -1;', '{ v6_count.prepare_ns += v6_clock_ns()-v6_begin; return -1; }')
    files['read_ic_prepare.inc']=p
    libc=files['quickjs-libc.c']
    libc=once(libc,'static JSValue js_os_now(JSContext *ctx, JSValue this_val,',
              'extern void v6_clock_boundary(void);\nstatic JSValue js_os_now(JSContext *ctx, JSValue this_val,')
    libc=once(libc,'    return JS_NewFloat64(ctx, (double)get_time_ns() / 1e6);',
              '    v6_clock_boundary();\n    return JS_NewFloat64(ctx, (double)get_time_ns() / 1e6);')
    files['quickjs-libc.c']=libc
    return files


def run(cid):
    e.gate();e.os.sched_setaffinity(0,{2})
    base=original(cid);files=instrument(cid);active=e.H/'active'
    parent=e.measure.artifact(cid)
    # The frozen diagnostic source is recoverable from generator+parent patch.
    for n,text in files.items():(active/n).write_bytes(text.encode())
    ident=dict(parent=cid,parent_sha256=parent['sha256'],
        diagnostic_source_sha256={n:e.lab.sha(active/n) for n in files},
        generator_sha256=e.lab.sha(Path(__file__)),scope='whole process including loading/setup/Run/checks/destruction',
        counter_time_is_not_performance=True)
    tag=e.os.environ.get('V6_DIAG_ATTEMPT','01')
    obj=e.H/'artifacts'/('counts.'+cid+'.'+tag+'.o');target=e.H/'artifacts'/('counts.'+cid+'.'+tag+'.qjs')
    assert not obj.exists() and not target.exists(),'New diagnostic attempt tag required'
    flags=['-O2','-g','-fwrapv','-D_GNU_SOURCE','-DHAVE_CLOSEFROM','-DCONFIG_VERSION="2026-06-04"']
    b=e.capture(['gcc',*flags,'-c',active/'quickjs.c','-o',obj],'counts_build',cid,180,ident)
    if b['exit_code']:
        e.save('counts.'+cid+'.'+tag+'.build_failure.json',b)
        for n,text in base.items():(active/n).write_bytes(text.encode())
        raise RuntimeError(b['stderr'][-2000:])
    libc_obj=e.H/'artifacts'/('counts.'+cid+'.'+tag+'.libc.o')
    b=e.capture(['gcc',*flags,'-c',active/'quickjs-libc.c','-o',libc_obj],'counts_build',cid+'/libc',90,ident)
    assert b['exit_code']==0,b['stderr']
    others=[libc_obj]+[active/'.obj'/(n+'.o') for n in ['qjs','repl','dtoa','libregexp','libunicode','cutils']]
    b=e.capture(['gcc','-g',obj,*others,'-lm','-lpthread','-ldl','-o',target],'counts_link',cid,60,ident)
    assert b['exit_code']==0,b['stderr']
    e.save('diagnostics/'+cid+'.'+tag+'.identity.json',dict(ident,binary_sha256=e.lab.sha(target)))
    cases=['Richards.Richards','DeltaBlue.DeltaBlue','RayTrace.RayTrace','Splay.Splay',
           'CodeLoad.CodeLoadClosure','CodeLoad.CodeLoadJQuery','Typescript.Typescript'] if cid in ['s001','ID_CTRL','ID_READ','L1','W1','P1'] else ['Richards.Richards','Gameboy.Gameboy','NavierStokes.NavierStokes']
    records=[]
    for case in cases+['crypto-sha1','access-nbody','bitops-bitwise-and']:
        kind='octane' if '.' in case else 'sunspider'
        info=e.lab.load(e.H/(kind+'.inputs.json'))
        path=e.measure.script(info,case,1,'mechanism')
        r=e.capture([target,path],'counts_run',cid+'/'+case,120,
                    dict(ident,script_sha256=e.lab.sha(path),N=1))
        lines=[s[len('V6_COUNTERS:'):] for s in r['stderr'].splitlines() if s.startswith('V6_COUNTERS:')]
        assert r['exit_code']==0 and len(lines)==1,(r['stdout'],r['stderr'])
        counters=json.loads(lines[0])
        counters['logical_get_field_including_fusion']=counters['get_field']+sum(v['hits'] for v in counters['fusion'])
        counters['run_boundary_reliable']=counters['timer_calls']==2
        assert counters['live_linked_bytes']==0 and counters['ic_retains']==counters['ic_releases'],counters
        assert counters['ic_operations']==counters['ic_hits']+counters['ic_fallback']+counters['proto_hits'],counters
        prefix='OCTANE_IC_RESULT:' if kind=='octane' else 'TEB_RESULT:'
        payload=json.loads(next(s[len(prefix):] for s in r['stdout'].splitlines() if s.startswith(prefix)))
        assert payload['correctness']=='PASS'
        records.append(dict(condition=cid,case=case,N=1,scope=ident['scope'],counters=counters,token=r['token']))
        print('COUNTS',cid,case,'reads',counters['get_field']+counters['get_field2'],
              'stores',counters['put_field'],'updates',counters['ic_updates'],flush=True)
    e.save('diagnostics/'+cid+'.'+tag+'.json',records)
    for n,text in base.items():(active/n).write_bytes(text.encode())


if __name__=='__main__':
    if sys.argv[1:] == ['--check']:
        for cid in ['s001','d03','d05','B2','ID_CTRL','ID_READ','W1','P1','L1']:
            files=instrument(cid)
            print('COUNTER_SOURCE_GENERATION_PASS',cid,len(files),flush=True)
    else:
        for cid in sys.argv[1:]:
            try:
                run(cid)
            finally:
                for n,text in original(cid).items():
                    (e.H/'active'/n).write_bytes(text.encode())
