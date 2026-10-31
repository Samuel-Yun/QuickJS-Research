"""Independent matched M/H diagnosis; never used for performance times."""
import argparse
import difflib
import gzip
import hashlib
import importlib.util
import os
import shutil
import sys
from run import HERE,ROOT,PREV,STORE,RUNTIMES,capture,csvout,read,save,sha,one,verify
from campaign import CASES,script,valid_payload
from test_h import script as semantic_script


def build():
    verify()
    sys.path.insert(0,str(PREV))
    spec=importlib.util.spec_from_file_location('old_build',PREV/'diagnostic_build.py')
    old=importlib.util.module_from_spec(spec);spec.loader.exec_module(old)
    manifest={}
    h=read(HERE/'H_manifest.json')
    for label,src in [('M',__import__('pathlib').Path('/home/mzyx/ic_mechanism_audit_attempt01/M')),('H',__import__('pathlib').Path(h['source']))]:
        dst=STORE/(label+'_mechanism');assert not dst.exists()
        names=read(PREV/'sources.json')['M_source_files']
        for name in names:
            p=dst/name;p.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(src/name,p)
        originals={name:(dst/name).read_text() for name in ['quickjs.c','qjs.c','read_ic_opcodes.inc','read_ic_runtime.inc','read_ic_prepare.inc']}
        for name in ['audit_hooks.h','audit_tail.inc']:shutil.copy2(PREV/'diagnostic'/name,dst/name)
        old.instrument('M',dst)
        p=dst/'audit_hooks.h';t=p.read_text()
        t=one(t,'    char *atom;','    unsigned long long admission_found,admission_eligible;\n    unsigned long long admission_reason[7],admission_mask[64],admission_depth[4];\n    unsigned long long h_own_hits,h_proto_hits,h_receiver_misses,h_holder_misses,h_own_fills,h_proto_fills;\n    char *atom;')
        t+='\n'+(HERE/'admission_hooks.inc').read_text()+'\n'+(HERE/'diagnostic/h_counters.inc').read_text();p.write_text(t)
        p=dst/'audit_tail.inc';t=p.read_text()
        t=one(t,r'\"value_other\":%llu}',r'\"value_other\":%llu')
        tail='s->value_int,s->value_object,s->value_other);'
        t=one(t,tail,tail+'\n            admission_json(out,s);hsite_json(out,s);fprintf(out,"}");')
        t=one(t,r'    fprintf(out,"]}\n");fclose(out);',r'    fprintf(out,"]");hglobal_json(out);fprintf(out,"}\n");fclose(out);');p.write_text(t)
        p=dst/'read_ic_opcodes.inc';t=p.read_text()
        t=one(t,'        uint32_t index = get_u32(pc), offset;','        unsigned admission_depth = 0;                                  \\\n        uint32_t index = get_u32(pc), offset;')
        t=one(t,'                if (prs) {','                if (prs) {                                              \\\n                    admission_found(origin,p,prs,admission_depth);')
        t=one(t,'                p = p->shape->proto;','                admission_depth++;                                     \\\n                p = p->shape->proto;')
        t=one(t,'                    audit_hit(); RDI_COUNT(hits);','                    hdiag_hit('+('site->holder_shape != NULL' if label=='H' else '0')+'); audit_hit(); RDI_COUNT(hits);')
        t=one(t,'                RDI_COUNT(shape_misses);','                hdiag_receiver_miss(); RDI_COUNT(shape_misses);')
        if label=='H':
            t=one(t,'                            goto name ## _miss;', '                            { hdiag_holder_miss(); goto name ## _miss; }')
        p.write_text(t)
        p=dst/'read_ic_runtime.inc';t=p.read_text()
        # Cap=1 is the only active branch; the unused PIC code is retained.
        t=one(t,'    audit_change(s->shape ? 2 : 1);','    hdiag_fill('+('holder_shape != NULL' if label=='H' else '0')+',s->shape != NULL);\n    audit_change(s->shape ? 2 : 1);')
        t=t.replace('    js_dup_shape(shape);','    hdiag_retain(shape);\n    js_dup_shape(shape);')
        if label=='H':t=one(t,'    if (holder_shape)\n        js_dup_shape(holder_shape);','    hdiag_retain(holder_shape);\n    if (holder_shape)\n        js_dup_shape(holder_shape);')
        for ctx in ['ctx->rt','rt']:
            for field in ['shape','holder_shape'] if label=='H' else ['shape']:
                needle=f'    js_free_shape_null({ctx}, s->{field});'
                assert t.count(needle)==1,(label,needle,t.count(needle))
                t=t.replace(needle,f'    hdiag_release(s->{field});\n'+needle,1)
        t=one(t,'    js_free_rt(rt, b->read_ic_sites);','    hdiag_free(b->read_ic_count);\n    js_free_rt(rt, b->read_ic_sites);');p.write_text(t)
        p=dst/'read_ic_prepare.inc';t=p.read_text();t=one(t,'    b->read_ic_count = count;','    b->read_ic_count = count;\n    hdiag_alloc(count);');p.write_text(t)
        patch=''.join(''.join(difflib.unified_diff(text.splitlines(True),(dst/name).read_text().splitlines(True),fromfile='a/'+name,tofile='b/'+name)) for name,text in originals.items())
        save(HERE/'diagnostic'/f'{label}_mechanism.patch',patch)
        for name in ['audit_hooks.h','audit_tail.inc']:save(HERE/'diagnostic/generated'/label/name,(dst/name).read_bytes())
        r=capture(label+'.mechanism.build',['make','-j2','qjs'],dst);assert r['exit_code']==0
        manifest[label]=dict(path=str(dst/'qjs'),sha256=sha(dst/'qjs'),source=str(dst),formal=False,
             source_files={name:sha(dst/name) for name in [*originals,'audit_hooks.h','audit_tail.inc']})
    save(HERE/'mechanism_manifest.json',manifest)


def diagnose(label,name,js):
    a=read(HERE/'mechanism_manifest.json')[label];assert sha(a['path'])==a['sha256']
    archived=HERE/'raw/mechanism'/f'{label}.{name}.json.gz'
    if archived.exists():
        identity=read(HERE/'raw/mechanism'/f'{label}.{name}.identity.json')
        assert sha(archived)==identity['compressed_sha256'] and sha(js)==identity['script_sha256'] and identity['binary']==a
        raw=gzip.decompress(archived.read_bytes());assert hashlib.sha256(raw).hexdigest()==identity['raw_sha256']
        return __import__('json').loads(raw)
    report=STORE/'mechanism_reports'/f'{label}.{name}.json';report.parent.mkdir(parents=True,exist_ok=True);assert not report.exists()
    env=os.environ.copy();env['IC_MECHANISM_REPORT']=str(report)
    r=capture('mechanism.'+label+'.'+name,[a['path'],js],env=env,timeout=180)
    assert r['exit_code']==0 and not r['stderr']
    data=report.read_bytes();gz=HERE/'raw/mechanism'/f'{label}.{name}.json.gz';save(gz,gzip.compress(data,mtime=0))
    save(HERE/'raw/mechanism'/f'{label}.{name}.identity.json',dict(binary=a,script_relative=js.relative_to(HERE).as_posix(),script_sha256=sha(js),raw_sha256=hashlib.sha256(data).hexdigest(),compressed_sha256=sha(gz),whole_process=True,formal_performance=False))
    d=__import__('json').loads(data);g=d['cache_lifecycle']
    assert not g['final_requested_live_bytes'] and g['shape_retains']==g['shape_releases'],g
    for f in d['functions']:
        for op in f['opcodes']:
            if op['ic_read_stats_instrumented']:
                assert op['ic_queries']==op['hits']+op['misses']
                assert op['hits']==op['h_own_hits']+op['h_proto_hits']
    return d


def run():
    rows=[];memory=[]
    for label in ['M','H']:
        for case in CASES:
            for n in [1,2]:
                p=script(case,n,True);d=diagnose(label,f'{case}.N{n}',p)
                command=read(HERE/'raw/commands'/f'mechanism.{label}.{case}.N{n}.json')
                valid_payload(command,case,n,True)
                memory.append(dict(variant=label,case=case,N=n,**d['cache_lifecycle']))
                for f in d['functions']:
                    source=bytes.fromhex(f['source_hex'])
                    for op in f['opcodes']:
                        if not op['ic_queries']:continue
                        rows.append(dict(variant=label,case=case,N=n,source_sha256=hashlib.sha256(source).hexdigest(),instance_id=f['instance_id'],
                          function=bytes.fromhex(f['function_hex']).decode(errors='replace'),pc=op['pc'],opcode=op['before_op'],atom=bytes.fromhex(op['atom_hex']).decode(errors='replace'),
                          queries=op['ic_queries'],hits=op['hits'],fallback=op['misses'],own_hits=op['h_own_hits'],proto_hits=op['h_proto_hits'],
                          receiver_misses=op['h_receiver_misses'],holder_misses=op['h_holder_misses'],own_fills=op['h_own_fills'],proto_fills=op['h_proto_fills'],
                          normal_find=op['find_normal'],replacements=op['replacements'],eligible_normal_found=op['admission']['eligible']))
    csvout(HERE/'mechanism_sites.csv',rows);csvout(HERE/'cache_memory.csv',memory)
    # Actual inherited fills/hits before mutation: inspect targeted static functions.
    coverage=[]
    for strict in [False,True]:
        for case in ['prototype_update','method_replace','shadow_delete','receiver_prototype','intermediate_prototype','data_to_getter','four_receivers']:
            p=semantic_script(case,1,strict);name=f'{"strict" if strict else "non_strict"}.{case}.N1'
            d=diagnose('H',name,p)
            target={'prototype_update':'readPrototype','method_replace':'callReplacedMethod','shadow_delete':'readShadowed','receiver_prototype':'readChangedPrototype','intermediate_prototype':'readChangedChain','data_to_getter':'readGetter','four_receivers':'callFourMaps'}[case]
            found=[]
            for f in d['functions']:
                if bytes.fromhex(f['function_hex']).decode()!=target:continue
                for op in f['opcodes']:
                    if op['ic_queries']:found.append(op)
            assert len(found)==1,(case,len(found));op=found[0]
            coverage.append(dict(case=case,strict=strict,pc=op['pc'],queries=op['ic_queries'],proto_fills=op['h_proto_fills'],proto_hits=op['h_proto_hits'],
                 holder_misses=op['h_holder_misses'],receiver_misses=op['h_receiver_misses'],guard_coverage='INHERITED_FILLED_AND_HIT' if op['h_proto_hits'] else 'FILLED_BUT_NO_HIT' if op['h_proto_fills'] else 'FALLBACK_SEMANTICS_ONLY'))
            if case not in ['intermediate_prototype','four_receivers']:assert op['h_proto_fills']>=1 and op['h_proto_hits']>=1
            elif case=='intermediate_prototype':assert not op['h_proto_fills'] and not op['h_proto_hits']
            else:assert op['h_proto_fills']>=1  # Four alternating shapes can thrash a single slot.
    # Rich lifecycle source starts with two calls at every subsequently mutated site.
    d=diagnose('H','lifecycle_v2',HERE/'correctness/lifecycle_v2.js')
    csvout(HERE/'correctness/inherited_guard_coverage.csv',coverage)
    save(HERE/'correctness/mechanism_gate.json',dict(status='PASS',workload_diagnostic_processes=20,semantic_coverage_processes=14,lifecycle_diagnostic_processes=1,
         queries_equal_hits_plus_fallback=True,shape_edge_balance=True,site_sizeof={'M':16,'H':24},scope='whole process, not timed interval',unsupported_multihop_not_filled=True))
    print('MECHANISM_GATE_PASS',flush=True)


def internal():
    from pathlib import Path
    m=read(HERE/'mechanism_manifest.json')['H'];src=Path(m['source'])
    out=src/'internal_check'
    cmd=['gcc','-O2','-g','-fwrapv','-D_GNU_SOURCE','-DCONFIG_VERSION="2026-06-04"','-I'+str(src),HERE/'correctness/internal.c']
    cmd+=[src/'.obj'/(x+'.o') for x in ['dtoa','libregexp','libunicode','cutils']]+['-lm','-lpthread','-ldl','-o',out]
    r=capture('H.internal.build2',cmd,timeout=600);assert r['exit_code']==0
    report=STORE/'internal_report.json';assert not report.exists()
    env=os.environ.copy();env['IC_MECHANISM_REPORT']=str(report)
    r=capture('H.internal.run',[out],env=env,timeout=180);assert r['exit_code']==0 and not r['stderr']
    save(HERE/'raw/mechanism/H.internal.json.gz',gzip.compress(report.read_bytes(),mtime=0))
    save(HERE/'correctness/internal_gate.json',dict(status='PASS',unhashed_holder_rejected=True,unhashed_receiver_rejected=True,
          inherited_hit_before_mutation=True,own_inherited_transition=True,hot_reload_empty_and_refilled=True,
          ROM_and_copy=True,shape_edge_balance=True,output=r['stdout']))


def cow_oom():
    from pathlib import Path
    src=Path(read(HERE/'mechanism_manifest.json')['H']['source']);out=src/'cow_oom_check'
    cmd=['gcc','-O2','-g','-fwrapv','-D_GNU_SOURCE','-DCONFIG_VERSION="2026-06-04"','-I'+str(src),HERE/'correctness/cow_oom.c']
    cmd+=[src/'.obj'/(x+'.o') for x in ['dtoa','libregexp','libunicode','cutils']]+['-lm','-lpthread','-ldl','-o',out]
    r=capture('H.cow_oom.build2',cmd,timeout=600);assert r['exit_code']==0
    r=capture('H.cow_oom.run2',[out]);assert r['exit_code']==0 and not r['stderr']
    save(HERE/'correctness/cow_oom_gate.json',dict(status='PASS',failed_COW_limits=32,old_cached_shape_and_value_preserved=True,shape_edge_balance=True,output=r['stdout']))


if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('stage',choices=['build','run','internal','cow_oom']);a=p.parse_args();globals()[a.stage]()
