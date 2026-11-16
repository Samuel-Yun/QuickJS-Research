"""Independent same-counter P/M diagnostics, never timed as benefit."""
import argparse,shutil,tarfile
from common import *
FIELDS=['queries','hits','fallback','comparisons','shape_misses','updates','update_comparisons','insertions','replacements','own_miss','descriptor','special','unhashed','inherited','missing','primitive']
def build():
    manifests={}
    for v in ['M','P']:
        dst=STORE/(v+'_diagnostic');attempt=1
        while dst.exists():
            attempt+=1;dst=STORE/(v+'_diagnostic'+str(attempt))
        with tarfile.open(BASE_MATERIALS/'recovery/sources/base.tar.gz') as t:t.extractall(dst)
        for name in ['quickjs.c','quickjs-opcode.h','read_ic_config.h','read_ic_types.h','read_ic_runtime.inc','read_ic_prepare.inc','read_ic_opcodes.inc']:
            shutil.copy2(STORE/v/name,dst/name)
        for name in ['read_ic_diag.h','read_ic_diag_prepare.inc']:shutil.copy2(HERE/'implementation'/name,dst/name)
        p=dst/'quickjs.c';s=p.read_text();p.write_text('#define READ_IC_DIAGNOSTIC 1\n'+s)
        p=dst/'read_ic_prepare.inc';s=p.read_text();p.write_text('#include "read_ic_diag_prepare.inc"\n'+s)
        p=dst/'qjs.c';s=p.read_text();a='int main(int argc, char **argv)';assert s.count(a)==1
        s=s.replace(a,'extern void read_ic_report(void);\n'+a)
        a='    return 0;\n fail:';assert s.count(a)==1;s=s.replace(a,'    read_ic_report();\n    return 0;\n fail:')
        a='    JS_FreeRuntime(rt);\n    return 1;';assert s.count(a)==1;s=s.replace(a,'    JS_FreeRuntime(rt);\n    read_ic_report();\n    return 1;');p.write_text(s)
        r=capture(v+'_diagnostic_build',['make','-j2','qjs'],dst);assert not r['exit_code']
        manifests[v]=dict(binary=str(dst/'qjs'),sha256=sha(dst/'qjs'),formal=False,
          source_hashes={p.name:sha(p) for p in dst.glob('read_ic*') if p.is_file()})
    save(HERE/'diagnostic_manifest.json',dict(versions=manifests,scope='all eagerly rewritten read queries INCLUDING cold/first; whole process',
      counter_layout_same=True,formal_site_layout_unchanged=True,diagnostic_extra_b_pointer_bytes=8,
      direct_bytes='actual site array requests plus audited formal 16-byte function header component; excludes recorder and extra diagnostic b pointer',
      shape_refs_peak='cached occupied-slot references; excludes transient dup-before-free local references',indirect_object_graph_bytes=None))
    print('DIAGNOSTIC_BUILDS_PASS',flush=True)
def validate(data):
    assert data['live_direct_after_free']==data['functions_live_after_free']==data['shape_refs_after_free']==0
    assert data['shape_ref_increments']==data['shape_ref_decrements']
    assert data['site_bytes']==(16 if data['capacity']==1 else 56)
    sites=[s for f in data['functions'] for s in f['sites']]
    assert len(sites)==data['sites_created'] and sum(s['queries']>0 for s in sites)==data['sites_used']
    assert len({f['instance_id'] for f in data['functions']})==len(data['functions'])
    for f in data['functions']:
        code=bytes.fromhex(f['bytecode_zero_atoms_hex']);assert f['freed']==1
        assert len({s['pc'] for s in f['sites']})==len(f['sites'])
        for s in f['sites']:
            assert 0<=s['pc']<len(code) and s['queries']==s['hits']+s['fallback']
            assert sum(s[k] for k in ['own_miss','descriptor','special','unhashed','inherited','missing','primitive'])==s['fallback']
            assert 0<=s['max_occupied']<=data['capacity']
    return data
def collect(label,v,path):
    m=read(HERE/'diagnostic_manifest.json')['versions'][v];assert sha(m['binary'])==m['sha256']
    gz=HERE/'raw/diagnostic'/f'{label}.{v}.json.gz';plain=STORE/'diagnostic_reports'/f'{label}.{v}.json';plain.parent.mkdir(parents=True,exist_ok=True)
    if not gz.exists():
        env=os.environ.copy();env['READ_IC_REPORT']=str(plain)
        r=capture(v+'_diag_'+label,[m['binary'],path],env=env,timeout=900);assert not r['exit_code'] and not r['stderr'] and ('PASS' in r['stdout'] or 'TEB_RESULT:' in r['stdout'])
        metadata=compress(plain,gz);metadata.update(case=label,variant=v,binary_sha256=m['sha256'],script_sha256=sha(path),command=[m['binary'],str(path)],performance_sample=False)
        save(str(gz)+'.metadata.json',metadata)
    return validate(read(gz))
def run():
    import run as runner
    runner.verify();assert read(HERE/'analysis/formal_audit.json')['status']=='PASS'
    plan={c:dict(formal_N=read(HERE/'selected'/f'{c}.json')['N'],diagnostic_N=min(8,read(HERE/'selected'/f'{c}.json')['N']) if c.startswith('CodeLoad.') else read(HERE/'selected'/f'{c}.json')['N']) for c in CASES}
    save(HERE/'diagnostic_plan.json',dict(scope='whole diagnostic process, NOT formal timed region',cases=plan,
      CodeLoad_rule='both versions cap N at 8, fixed before diagnosis; per-function bytecode/source/atom retention otherwise grows very large; no extrapolated full-N counts'))
    for c in CASES:
        n=plan[c]['diagnostic_N']
        for v in ['P','M']:collect(c,v,runner.script(c,n))
    print('ALL_48_DIAGNOSTICS_PASS',flush=True)
def summarize():
    rows=[];occupancy=[]
    import collections
    for c in CASES:
        for v in ['P','M']:
            d=validate(read(HERE/'raw/diagnostic'/f'{c}.{v}.json.gz'));sites=[s for f in d['functions'] for s in f['sites']]
            total={k:sum(s[k] for s in sites) for k in FIELDS};q=total['queries']
            ns=read(HERE/'diagnostic_plan.json')['cases'][c]
            row=dict(case=c,variant=v,**ns,**total,hit_fraction=total['hits']/q if q else None,comparisons_per_query=total['comparisons']/q if q else None)
            # update_comparisons records the PIC update scan. M's one equality
            # check is not instrumented separately; disclose a source-derived
            # logical count rather than falsely presenting zero native work.
            row['M_update_identity_checks_source_derived']=total['updates'] if v=='M' else 0
            row['logical_shape_checks_mixed_observed_derived']=total['comparisons']+total['update_comparisons']+row['M_update_identity_checks_source_derived']
            row.update({k:d[k] for k in ['capacity','site_bytes','finalized_functions','sites_created','sites_used','requested_direct_bytes','peak_live_direct_bytes','live_direct_after_free','shape_ref_increments','shape_ref_decrements','shape_refs_peak','shape_refs_after_free']});rows.append(row)
            counts=collections.Counter(s['max_occupied'] for s in sites)
            for n in range(d['capacity']+1):occupancy.append(dict(case=c,variant=v,lifetime_max_slots=n,sites=counts[n],total_sites=len(sites)))
    csvout(HERE/'analysis/diagnostic_summary.csv',rows);csvout(HERE/'analysis/occupancy.csv',occupancy)
    print('DIAGNOSTIC_REPLAY_PASS',flush=True)
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('stage',choices=['build','run','summarize']);a=p.parse_args();globals()[a.stage]()
