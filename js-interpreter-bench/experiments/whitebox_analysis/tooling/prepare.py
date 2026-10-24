"""Recompute existing raw, preserve history and inspect available diagnostics."""
import csv, json, math, platform, shutil, statistics, subprocess
from pathlib import Path
import common as c

def main():
    c.verify()
    c.ATTEMPT.mkdir(parents=True, exist_ok=True)
    for name in ('cases/richards', 'cases/navier_stokes', 'cases/regexp_boundary',
                 'profiles', 'bytecode', 'source_evidence', 'microbench', 'raw', 'summary'):
        (c.ATTEMPT / name).mkdir(parents=True, exist_ok=True)
    m = {'schema':1, 'cohort':c.baseline.cohort.manifest()['cohort_id'],
         'root':str(c.ROOT), 'output':str(c.ATTEMPT), 'host':platform.node(),
         'kernel':platform.release(), 'architecture':platform.machine(),
         'runtime':c.read(c.ROOT/'experiments/timer_recovery/manifest.json'),
         'baseline_mode':'MAIN_MONOTONIC_V1', 'micro_mode':c.MODE,
         'migration_interface':'ROOT resolved from __file__; runtime paths centralized here. New host requires a new manifest/cohort and validation, not path substitution under this identity.',
         'adapters':{e:[{'path':str(p),'sha256':c.sha(p)} for p in
                       (c.ROOT/'experiments/three_engine_baseline/adapters'/f'{e}.js',
                        c.ROOT/'experiments/timer_recovery/adapters'/f'{e}.js')] for e in c.ENGINES}}
    c.save(c.ATTEMPT/'manifest.json',m)
    c.save(c.ATTEMPT/'preservation_before.json',c.inventory())
    if not (c.ATTEMPT/'environment.before.json').exists():
        c.baseline.environment(c.ATTEMPT/'environment.before.json')
    p=c.ROOT/'experiments/octane_three_engine/MAIN_MONOTONIC_V1/attempt01'
    with (p/'raw/formal.csv').open(newline='') as f: raw=list(csv.DictReader(f))
    with (p/'summary/per_case.csv').open(newline='') as f: reported=list(csv.DictReader(f))
    out=[]; errors=[]; med={}
    for case in ('Richards.Richards','NavierStokes.NavierStokes','RegExp.RegExp'):
        for e in c.ENGINES:
            rows=[r for r in raw if r['case']==case and r['engine']==e and r['valid']=='True']
            if len(rows)!=30: raise RuntimeError('target raw group not 30')
            x=sorted(float(r['elapsed_ms'])/int(r['N']) for r in rows)
            values={'median_ms':statistics.median(x),'mean_ms':statistics.mean(x),
                    'sample_stddev_ms':statistics.stdev(x),'IQR_ms':statistics.median(x[15:])-statistics.median(x[:15]),
                    'min_ms':min(x),'max_ms':max(x)}
            rr=next(r for r in reported if r['case']==case and r['engine']==e)
            for k,v in values.items():
                if not math.isclose(v,float(rr[k]),rel_tol=1e-12,abs_tol=1e-12):errors.append(case+'/'+e+'/'+k)
            med[case,e]=values['median_ms'];out.append({'case':case,'engine':e,'samples':30,**values})
    ratios=[{'case':case,**{pair:med[case,a]/med[case,b] for pair,(a,b) in c.baseline.PAIRS.items()}}
            for case in ('Richards.Richards','NavierStokes.NavierStokes','RegExp.RegExp')]
    c.export(c.ATTEMPT/'summary/baseline_recomputed.csv',out)
    c.export(c.ATTEMPT/'summary/baseline_ratios.csv',ratios)
    c.save(c.ATTEMPT/'summary/baseline_audit.json',{'status':'PASS' if not errors else 'FAIL','errors':errors,
        'raw_sha256':c.sha(p/'raw/formal.csv'),'groups':9,'samples':270,'old_full_benchmark_rerun':False})
    if errors: raise RuntimeError('baseline summary mismatch')
    for name,cmd in {'tools':['sh','-c','command -v perf; command -v gdb; command -v objdump; command -v nm; command -v gcc'],
        'perf_version':['perf','--version'],'gdb_version':['gdb','--version'],
        'perf_access':['sh','-c','printf "perf_event_paranoid="; cat /proc/sys/kernel/perf_event_paranoid; printf "kptr_restrict="; cat /proc/sys/kernel/kptr_restrict'],
        'perf_paths':['sh','-c','find /usr/lib/linux-tools /usr/bin /usr/local/bin -maxdepth 3 -name perf -type f 2>/dev/null'],
        'quickjs_symbols':['nm','-a',m['runtime']['engines']['quickjs']['binary']['path']],
        'jsc_symbols':['nm','-D','--defined-only',m['runtime']['engines']['jsc']['dependencies'][0]['path']],
        'v8_symbols':['nm','-D','--defined-only',m['runtime']['engines']['v8']['binary']['path']]}.items():
        r=c.capture('capability.'+name,cmd,90)
        if name.endswith('_symbols'):c.save(c.ATTEMPT/'source_evidence'/f'{name}.txt',r['stdout'])
    for e in c.ENGINES:
        binary=m['runtime']['engines'][e]['binary']['path']
        cmd=[binary,'--help'] if e!='v8' else [binary,m['runtime']['engines'][e]['command_prefix'][1],'--help']
        r=c.capture('help.'+e,cmd);c.save(c.ATTEMPT/'source_evidence'/f'{e}.help.txt',r['stdout']+r['stderr'])
    print(json.dumps({'status':'BASELINE_RECOMPUTED_PASS','ratios':ratios,'perf':shutil.which('perf')},indent=2),flush=True)

if __name__=='__main__':main()
