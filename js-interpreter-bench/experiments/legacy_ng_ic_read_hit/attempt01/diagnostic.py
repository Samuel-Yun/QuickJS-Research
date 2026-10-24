"""Same old counter generator applied to C/D; only declaration anchor adapts."""
import argparse,ast,difflib,shutil,tarfile
from common import *
def one(s,a,b):assert s.count(a)==1,(a[:100],s.count(a));return s.replace(a,b,1)
def build():
    clean=STORE/'diagnostic_base'
    if not clean.exists():
        with tarfile.open(PREVIOUS/'recovery/sources/base.tar.gz','r:gz') as tf:tf.extractall(clean)
    old=(OLD/'diagnostic.py').read_text();tree=ast.parse(old)
    nodes=[n for n in tree.body if (isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id=='HEADER' for t in n.targets)) or (isinstance(n,ast.FunctionDef) and n.name=='build')]
    source=ast.unparse(ast.Module(body=nodes,type_ignores=[]))
    source=one(source,"shutil.copytree(HERE / 'sources/base', DEST)","shutil.copytree(CLEAN, DEST)")
    manifests={}
    for v in ['C','D']:
        evidence=HERE/'diagnostic_builds'/v
        ns=dict(__name__='isolated_counter_generator',HERE=evidence,ROOT=ROOT,STORE=STORE,B=STORE/v,
          DEST=STORE/(v+'_diagnostic'),CLEAN=clean,capture=capture,save=save,sha=sha,one=one,
          shutil=shutil,json=json,difflib=difflib)
        actual_source=source.replace('static JSValue JS_GetPropertyInternalWithIC(', 'static force_inline JSValue JS_GetPropertyInternalWithIC(') if v=='D' else source
        exec(compile(actual_source,'reused_legacy_diagnostic_generator','exec'),ns);ns['build']()
        manifests[v]=read(evidence/'diagnostic_manifest.json')
    save(HERE/'diagnostic_manifest.json',dict(versions=manifests,generator_source_sha256=sha(OLD/'diagnostic.py'),
      generator_scope='identical AST HEADER/build; source/destination paths and D force_inline declaration anchor substituted, preserved in generated code',
      counter_layout_same_C_D=True,range='whole process; rewritten IC opcode queries only',
      occupancy='per-unit maximum occupied slots over lifetime, distribution is not time-weighted occupancy',shape_diversity=None))
def validate(d):
    assert d['live_bytes_after_runtime_free']==0
    assert len(d['units_detail'])==d['units']
    assert len({(u['cache_id'],u['slot']) for u in d['units_detail']})==d['units']
    assert d['requested_bytes_diagnostic_layout']>=d['peak_live_bytes_diagnostic_layout']>=0
    for u in d['units_detail']:
        assert 0<=u['max_filled_slots']<=4
        assert u['ever_filled_slot_mask']&~15==0
        assert u['ever_filled_slot_mask'].bit_count()==u['max_filled_slots']
        for k in ['read','write']:assert u[k+'_queries']==u[k+'_hits']+u[k+'_fallback']
        assert u['shape_hits']+u['shape_misses']==u['read_queries']+u['write_queries']-u['read_nonobject']-u['write_nonobject']
    return d
def collect(label,v,path):
    manifest=read(HERE/'diagnostic_manifest.json')['versions'][v];binary=manifest['binary'];assert sha(binary)==manifest['sha256']
    raw=STORE/'diagnostic_reports'/f'{label}.{v}.json';raw.parent.mkdir(parents=True,exist_ok=True)
    gz=HERE/'raw/diagnostic'/f'{label}.{v}.json.gz'
    if not gz.exists():
        env=os.environ.copy();env['LEGACY_IC_REPORT']=str(raw)
        r=capture(v+'_diag_'+label,[binary,path],env=env);assert r['exit_code']==0 and not r['stderr']
        assert 'PASS' in r['stdout'] or 'TEB_RESULT:' in r['stdout']
        entry=compress(raw,gz);entry.update(label=label,variant=v,campaign='read_hit_attempt01',performance_sample=False,
          binary_sha256=manifest['sha256'],script_sha256=sha(path),command=[binary,str(path)])
        save(Path(str(gz)+'.metadata.json'),entry)
    return validate(read(gz))
def micros():
    rows=[]
    for n in [1,2,4,5,8]:
        source=f'''function microRead(o){{return o.x;}}
var objects=[],sum=0,expected=0;
for(var j=0;j<{n};j++){{var o={{}};o['extra'+j]=j;o.x=j+1;objects.push(o);}}
for(var i=0;i<8000;i++){{sum+=microRead(objects[i%{n}]);expected+=i%{n}+1;}}
if(sum!==expected)throw Error('checksum');console.log('MICRO_PASS '+sum);
'''
        path=HERE/'correctness/micro'/f'shapes{n}.js';save(path,source)
        # All three release binaries also check the exact same micro workload.
        for v in VERSIONS:
            r=capture(v+'_micro_shapes'+str(n),[STORE/v/'qjs',path]);assert r['exit_code']==0 and 'MICRO_PASS' in r['stdout']
        for v in ['C','D']:
            data=collect('micro_shapes'+str(n),v,path)
            unit=[u for u in data['units_detail'] if bytes.fromhex(u['function_hex'])==b'microRead' and bytes.fromhex(u['atom_hex'])==b'x']
            assert len(unit)==1;u=unit[0]
            assert u['max_filled_slots']==(1 if v=='B' else min(n,4))
            if v=='C' and n<=4:assert u['read_hits']/u['read_queries']>=.99
            rows.append(dict(case='shapes'+str(n),variant=v,queries=u['read_queries'],hits=u['read_hits'],fallback=u['read_fallback'],
              probes=u['probes'],updates=u['updates'],insertions=u['insertions'],replacements=u['replacements'],max_filled=u['max_filled_slots'],valid=True))
    tests={
      'shared_sites':('microShared',2,"function microShared(a,b){var x=a.x;return x+b.x;}var a={x:1,z:2},b={z:3,x:4},s=0;for(var i=0;i<8000;i++)s+=microShared(a,b);if(s!==40000)throw Error('checksum');console.log('MICRO_PASS');"),
      'existing_after_empty':('microExisting',3,"function microExisting(o,k){if(k===0)return o.x;return o.x;}var a=[];for(var j=0;j<3;j++){var o={};o['extra'+j]=j;o.x=j+1;a.push(o);}for(var i=0;i<30;i++)if(microExisting(a[i%3],0)!==i%3+1)throw Error('prime');if(microExisting(a[0],1)!==1)throw Error('existing');console.log('MICRO_PASS');")}
    for label,(name,filled,source) in tests.items():
        path=HERE/'correctness/micro'/f'{label}.js';save(path,source)
        for v in VERSIONS:
            r=capture(v+'_micro_'+label,[STORE/v/'qjs',path]);assert r['exit_code']==0 and 'MICRO_PASS' in r['stdout']
        for v in ['C','D']:
            data=collect('micro_'+label,v,path)
            units=[u for u in data['units_detail'] if bytes.fromhex(u['function_hex']).decode()==name and bytes.fromhex(u['atom_hex'])==b'x']
            assert len(units)==1;u=units[0]
            assert u['max_filled_slots']==(1 if v=='B' else filled)
            rows.append(dict(case=label,variant=v,queries=u['read_queries'],hits=u['read_hits'],fallback=u['read_fallback'],probes=u['probes'],
              updates=u['updates'],insertions=u['insertions'],replacements=u['replacements'],max_filled=u['max_filled_slots'],valid=True))
    csvout(HERE/'correctness/micro_counters.csv',rows)
    save(HERE/'correctness/mechanism_gate.json',dict(status='PASS',target_units_checked=14,release_micro_checks=21,scenarios=7,
      same_atom_still_shared=True,early_empty_does_not_duplicate_existing_shape=True))
    print('MULTISLOT_MECHANISM_PASS',flush=True)
def octane():
    from run import script,verify
    verify();assert read(HERE/'analysis/formal_audit.json')['status']=='PASS'
    for case in CASES:
        n=read(HERE/'selected'/f'{case}.json')['N']
        for v in ['C','D']:collect(case,v,script(case,n))
    print('ALL_DIAGNOSTICS_PASS',flush=True)
if __name__=='__main__':
    ap=argparse.ArgumentParser();ap.add_argument('stage',choices=['build','octane']);a=ap.parse_args();globals()[a.stage]()
