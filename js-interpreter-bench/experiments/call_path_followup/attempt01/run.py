"""New four-way followup. Reuse the reviewed timer, driver, capture and decoders.
Run in Ubuntu WSL2. All experiment records are write-once, positions resumable.
"""
import argparse
import importlib.util
import json
import math
import os
import platform
import random
import re
import statistics
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
OLD = ROOT/'experiments/bytecode_whitebox_simple/attempt01'
spec = importlib.util.spec_from_file_location('simple_base', OLD/'run.py')
b = importlib.util.module_from_spec(spec)
spec.loader.exec_module(b)
b.HERE = HERE
b.SEED = 20261017
ENGINES = b.ENGINES
read,save,sha,export = b.read,b.save,b.sha,b.export

def prepare():
    if (HERE/'manifest.json').exists(): return b.verify()
    m=read(OLD/'manifest.json')
    assert (platform.node(),platform.release(),platform.machine()) == (m['host'],m['kernel'],m['architecture'])
    m.update(experiment='call_path_followup/attempt01', seed=b.SEED, repetitions=30,
             entry_script_sha256=sha(__file__), created_date='2026-10-17',
             prior_attempt='bytecode_whitebox_simple/attempt01',
             calibration={'pilot_min_ms':1500,'confirmations_per_engine':3,'confirmation_min_ms':1200,
                          'selection':'first power of two with pilot pair >=1500ms and all 6 independent confirmations >=1200ms',
                          'no_workload_warmup':True},
             inputs={str(p.relative_to(HERE)):sha(p) for p in sorted((HERE/'cases').glob('*'))})
    save(HERE/'manifest.json',m); b.verify()
    assert sha(b.DIAG)==b.DIAG_SHA
    save(HERE/'execution_contract.json',dict(read(OLD/'execution_contract.json'),experiment=m['experiment'],
         formal_samples=240,inner_iterations=4096,expected_per_call=8398848,
         calibration=m['calibration'],state='first call included; subsequent feedback/state evolve; not all-cold'))
    r=b.capture(HERE/'raw/environment.json',['sh','-c','uname -a; cat /etc/os-release; lscpu; free -b; df -h / /mnt/c; gcc --version; python3 --version; uptime; cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor 2>/dev/null; true'])
    save(HERE/'environment.txt',r['stdout']+'\nWSL host power/frequency/background isolation: UNKNOWN/uncontrolled. Same artifacts, different collection date; old/new samples not merged.\n')
    b.capture(HERE/'raw/v8_flags.json',m['engines']['v8']['command_prefix']+['--print-flag-values','-e',"print('FLAGS_OK')"])
    b.capture(HERE/'raw/v8_help.json',m['engines']['v8']['command_prefix']+['--help'])
    preserved={}
    for folder in (OLD,ROOT/'benchmarks/octane/upstream',ROOT/'experiments/timer_recovery/adapters',ROOT/'experiments/three_engine_baseline/adapters'):
        for p in folder.rglob('*'):
            if p.is_file() and '__pycache__' not in p.parts and '.git' not in p.parts: preserved[str(p.relative_to(ROOT))]=sha(p)
    save(HERE/'source_evidence/preservation_before.json',preserved)
    save(HERE/'source_evidence/readme_before.md',(ROOT/'README.md').read_bytes())
    save(HERE/'source_evidence/reused_tools.json',{str(p.relative_to(ROOT)):sha(p) for p in [OLD/'run.py',OLD/'evidence.py',OLD/'native_handlers.py',OLD/'manifest.json',OLD/'audit.json']})
    assert 4096*4095//2+3*4096==8398848
    print('PREPARED',flush=True)

def gates():
    b.correctness()
    own=(HERE/'cases/own_method.js').read_text().split('var cfObject =')[0]
    proto=(HERE/'cases/prototype_method.js').read_text().split('var cfPrototype =')[0]
    assert own==proto
    save(HERE/'source_evidence/shared_method_core.json',dict(sha256=__import__('hashlib').sha256(own.encode()).hexdigest(),byte_identical=True))
    for case in b.config():
        p=HERE/'probes'/f'{case}_shape.js'
        text=(HERE/'cases'/f'{case}.js').read_text()
        isown='true' if case=='own_method' else 'false'
        checks="if(cfObject.bias!==3 || !Object.prototype.hasOwnProperty.call(cfObject,'bias')) throw Error('bias');\n"
        if case.endswith('method'):
            checks+=f"if(Object.prototype.hasOwnProperty.call(cfObject,'step')!=={isown} || cfObject.step!==stepMethod) throw Error('step');\n"
        save(p,text+'\n'+checks+"console.log('SHAPE_OK');\n")
        for e in ENGINES:
            r=b.capture(HERE/'raw/diagnostics'/f'{case}_{e}_shape.json',b.command(e,p))
            assert r['exit_code']==0 and 'SHAPE_OK' in r['stdout']

def dump():
    # Base uses function name filenames; archive each case immediately to preserve
    # the two separately generated method dumps without overwriting shared names.
    original=b.config
    totals=[]
    for case,c in original().items():
        b.config=lambda case=case,c=c:{case:c}
        # The reused dumper is write-once. Point only bytecode artifacts to a
        # per-case subtree; raw positions and generated scripts remain shared.
        oldsave=b.save
        def routed(p,v,case=case):
            p=Path(p)
            if 'bytecode' in p.relative_to(HERE).parts:
                rel=p.relative_to(HERE/'bytecode')
                p=HERE/'bytecode'/case/rel
            return oldsave(p,v)
        b.save=routed
        try: b.dumps()
        finally: b.save=oldsave; b.config=original
        counts=list(__import__('csv').DictReader((HERE/'bytecode'/case/'static_counts.csv').open()))
        totals.extend(counts)
    export(HERE/'bytecode/static_counts.csv',totals)
    for e in ENGINES:
        for fn in ('cfMethodLoop','stepMethod'):
            x=read(HERE/'bytecode/own_method'/e/(fn+'.decoded.json'))
            y=read(HERE/'bytecode/prototype_method'/e/(fn+'.decoded.json'))
            # ASLR addresses in V8 jump annotations are not bytecode operands.
            normalize=lambda z: re.sub(r'0x[0-9a-f]+','<address>',json.dumps(z,sort_keys=True))
            assert normalize(x)==normalize(y),(e,fn)
    save(HERE/'source_evidence/method_bytecode_equal.json',dict(both_engines=True,caller_and_callee_equal=True,
         meaning='own/prototype differs in runtime objects, not opcode sequence; not IC equality'))

def paths():
    binary='/home/mzyx/bytecode_whitebox_simple_attempt01_diag/qjs'
    identity=read(OLD/'source_evidence/counter_build_persistent.json')
    assert sha(binary)==identity['sha256']
    save(HERE/'source_evidence/reused_counter_binary.json',identity)
    for case,c in b.config().items():
        fn='stepMethod' if case.endswith('method') else ('stepPlain' if case=='direct_call' else 'cfInline')
        p=HERE/'probes'/f'{case}_paths.js'
        save(p,(HERE/'cases'/f'{case}.js').read_text()+f"\n__mlDiagBegin(cfObject,{fn},{{}},{{}},{{}},{{}},Function.prototype.call);\nvar __cfAnswer={c['call']};\nvar __cfPaths=__mlDiagEnd();\nif(__cfAnswer!==8398848) throw Error('wrong result');\nconsole.log('PATHS '+__cfPaths);\n")
        cmd=b.command('quickjs',p);cmd[0]=binary
        r=b.capture(HERE/'raw/diagnostics'/f'{case}_paths.json',cmd)
        assert r['exit_code']==0 and 'PATHS ' in r['stdout']
        print('PATHS',case,r['stdout'],flush=True)

def calibrate():
    b.verify()
    assert (HERE/'correctness.csv').exists() and (HERE/'source_evidence/method_bytecode_equal.json').exists()
    for case in b.config():
        if (HERE/'calibration'/f'{case}.json').exists(): continue
        rows=[];n=1
        while n<=2**22:
            pair=[b.sample(case,e,n,'calibration','pilot_N'+str(n)) for e in ENGINES]
            rows+=pair
            assert all(r['valid'] for r in pair)
            print('PILOT',case,n,[round(r['elapsed_ms'],2) for r in pair],flush=True)
            if min(r['elapsed_ms'] for r in pair)>=1500:
                checks=[]
                for rep in range(3):
                    for e in (ENGINES if rep%2==0 else tuple(reversed(ENGINES))):
                        x=b.sample(case,e,n,'calibration',f'confirm{rep}_N{n}')
                        checks.append(x);rows.append(x)
                        assert x['valid']
                        print('CONFIRM',case,e,n,round(x['elapsed_ms'],2),flush=True)
                if min(r['elapsed_ms'] for r in checks)>=1200:
                    save(HERE/'calibration'/f'{case}.json',dict(case=case,N=n,pilot=pair,confirmations=checks,policy=b.manifest()['calibration']))
                    export(HERE/'calibration'/f'{case}.csv',rows)
                    break
            n*=2
        else: raise RuntimeError('N cap; retained pilots')

def measure():
    b.verify()
    assert all((HERE/'raw/diagnostics'/f'{c}_paths.json').exists() for c in b.config())
    for pos in b.schedule():
        n=read(HERE/'calibration'/(pos['case']+'.json'))['N']
        label='rep%02d_order%d'%(pos['rep'],pos['order'])
        r=b.sample(pos['case'],pos['engine'],n,'formal',label)
        assert r['valid'],r['record']
        print('FORMAL',pos['rep'],pos['case'],pos['engine'],round(r['elapsed_ms'],2),flush=True)
    b.verify()

def summarize():
    b.verify();rows=[];out=[]
    for pos in b.schedule():
        n=read(HERE/'calibration'/(pos['case']+'.json'))['N']
        label='rep%02d_order%d'%(pos['rep'],pos['order'])
        p=HERE/'raw/formal'/(label+'_'+pos['engine']+'_'+pos['case']+'.json')
        assert p.exists()
        rows.append(dict(b.sample(pos['case'],pos['engine'],n,'formal',label),rep=pos['rep'],order=pos['order']))
    assert len(rows)==240 and all(r['valid'] for r in rows)
    for c in b.config():
        groups={e:[r for r in rows if r['case']==c and r['engine']==e] for e in ENGINES}
        med={e:statistics.median(x['elapsed_per_call_ms'] for x in groups[e]) for e in ENGINES}
        for e,g in groups.items():
            assert len(g)==30 and len({r['rep'] for r in g})==30 and sum(r['order']==1 for r in g)==15
            v=[r['elapsed_per_call_ms'] for r in g];q=statistics.quantiles(v,n=4,method='inclusive')
            out.append(dict(case=c,engine=e,N=g[0]['N'],count=len(g),median_ms=med[e],q1_ms=q[0],q3_ms=q[2],mean_ms=statistics.mean(v),sample_stddev_ms=statistics.stdev(v),IQR_ms=q[2]-q[0],min_ms=min(v),max_ms=max(v),v8_over_quickjs=med['v8']/med['quickjs'],below_1000ms=sum(r['elapsed_ms']<1000 for r in g)))
        assert len({r['script_sha256'] for g in groups.values() for r in g})==1
    export(HERE/'raw/timing.csv',rows);export(HERE/'summary.csv',out)
    preserved=read(HERE/'source_evidence/preservation_before.json')
    assert all(sha(ROOT/p)==h for p,h in preserved.items())
    save(HERE/'audit.json',dict(status='FORMAL_PASS',formal_valid=240,expected=240,correctness_records=len(list((HERE/'raw/correctness').glob('*.json'))),
        balanced_order=True,same_script=True,warmup=False,old_files_preserved=True,
        below_1000ms=sum(r['elapsed_ms']<1000 for r in rows),overall_geomean=None,
        boot_ids=sorted({read(HERE/r['record'])['boot_id'] for r in rows}),
        limitation='point estimates; not step self-times; V8 exact source/IC hit rates UNKNOWN'))
    print('FORMAL_PASS 240/240',flush=True)

def main():
    p=argparse.ArgumentParser();p.add_argument('stage',choices=('prepare','correctness','dump','paths','calibrate','measure','summarize','all'))
    stage=p.parse_args().stage
    stages=dict(prepare=prepare,correctness=gates,dump=dump,paths=paths,calibrate=calibrate,measure=measure,summarize=summarize)
    if stage=='all':
        for f in stages.values(): f()
    else: stages[stage]()

if __name__=='__main__': main()
