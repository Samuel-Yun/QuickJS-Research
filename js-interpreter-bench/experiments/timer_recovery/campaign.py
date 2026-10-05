"""MAIN_MONOTONIC_V1: fresh calibration, durable records, same-cohort sampling."""
from __future__ import annotations
import argparse, csv, io, importlib.util, itertools, json, math, os
from pathlib import Path
import platform, random, re, statistics, subprocess, sys, time, traceback
from datetime import datetime, timezone
HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[1]
sys.path.insert(0,str(ROOT/'experiments/three_engine_baseline'))
sys.path.insert(0,str(ROOT/'scripts'))
sys.path.insert(0,str(ROOT/'experiments/frontend_isolation'))
import cohort
import run_sunspider as baseline
import run_repeated_mode as repeated
from runtime_setup import save,sha
from validate import command

MODE='MAIN_MONOTONIC_V1'
ENGINES=cohort.ENGINES
TARGET=1000.0
REPS=30
MAX_N=65536
TIMEOUT=300
BENCHMARKS={'Richards':('Richards',),'DeltaBlue':('DeltaBlue',),'Crypto':('Encrypt','Decrypt'),
 'RayTrace':('RayTrace',),'EarleyBoyer':('Earley','Boyer'),'RegExp':('RegExp',),
 'Splay':('Splay',),'NavierStokes':('NavierStokes',),'PdfJS':('PdfJS',),
 'Mandreel':('Mandreel',),'Gameboy':('Gameboy',),'CodeLoad':('CodeLoadClosure','CodeLoadJQuery'),
 'Typescript':('Typescript',)}
OCTANE_FILES={'Richards':('richards.js',),'DeltaBlue':('deltablue.js',),'Crypto':('crypto.js',),
 'RayTrace':('raytrace.js',),'EarleyBoyer':('earley-boyer.js',),'RegExp':('regexp.js',),
 'Splay':('splay.js',),'NavierStokes':('navier-stokes.js',),'PdfJS':('pdfjs.js',),
 'Mandreel':('mandreel.js',),'Gameboy':('gbemu-part1.js','gbemu-part2.js'),
 'CodeLoad':('code-load.js',),'Typescript':('typescript.js','typescript-input.js','typescript-compiler.js')}
PAIRS={'V8/QJS':('v8','quickjs'),'JSC/QJS':('jsc','quickjs'),'JSC/V8':('jsc','v8')}

def stamp():return datetime.now(timezone.utc).isoformat()
def read(path):return json.loads(Path(path).read_text(encoding='utf-8'))
def csv_new(path,records,fields=None):
    records=list(records)
    if not records:return
    out=io.StringIO(newline='');w=csv.DictWriter(out,fields or tuple(records[0]),extrasaction='ignore');w.writeheader()
    for r in records:w.writerow({k:json.dumps(v,separators=(',',':'),ensure_ascii=False) if isinstance(v,(dict,list)) else v for k,v in r.items()})
    data=out.getvalue();path=Path(path)
    if path.exists() and path.read_bytes()!=data.encode():
        # Versioned exports on resume; the durable record journal is authoritative.
        path=path.parent/(path.stem+'.snapshot-'+stamp().replace(':','-')+path.suffix)
    save(path,data)

def allowed():
    p=ROOT/'experiments/frontend_isolation/correctness/repeated.csv'
    if sha(p)!='88c6f0f2725b38f7cde5b15b1b76577f2fcef18aa902eb051780414766157443':raise RuntimeError('old checksum evidence changed')
    out={c:set() for c in baseline.TESTS}
    with p.open(newline='',encoding='utf-8') as f:
        for r in csv.DictReader(f):
            if r['valid']!='True':raise RuntimeError('old correctness invalid')
            out[r['test']].add(r['stdout'][9:])
    return {c:sorted(v) for c,v in out.items()}

def preserved():
    directories=('experiments/three_engine_baseline','experiments/sunspider_three_engine',
                 'experiments/frontend_isolation','experiments/interpreter_mode_execution',
                 'experiments/octane','experiments/octane_strict','experiments/jsc_baseline',
                 'results','notes','scripts')
    paths=[ROOT/'README.md',ROOT/'baseline_manifest.md']
    for d in directories:
        paths.extend(p for p in (ROOT/d).rglob('*') if p.is_file() and '__pycache__' not in p.parts and MODE not in p.parts)
    return {str(p.relative_to(ROOT)):sha(p) for p in sorted(set(paths))}

def input_hashes():
    paths=list(HERE.glob('*.py'))+list((HERE/'adapters').glob('*.js'))+list((HERE/'drivers').glob('*.js'))
    paths += [HERE/'audit.json',HERE/'manifest.json',HERE/'execution_contract.json',HERE/'control.js',HERE/'clock_interpose.c']
    paths += list(baseline.UPSTREAM_DIRECTORY.iterdir())+list(baseline.STANDALONE_DIRECTORY.iterdir())
    paths += [baseline.UPSTREAM_MANIFEST,baseline.STANDALONE_MANIFEST,baseline.STANDALONE_PATCH]
    for line in (ROOT/'experiments/octane/upstream_sha256.txt').read_text().splitlines():
        h,name=line.split('  ',1);p=ROOT/'benchmarks/octane/upstream'/name
        if sha(p)!=h:raise RuntimeError('Octane input changed '+name)
        paths.append(p)
    return {str(p.relative_to(ROOT)):sha(p) for p in sorted(set(paths)) if p.is_file()}

def verify():
    m=cohort.verify()
    if platform.node()!='LAPTOP-QPKCPDCB':raise RuntimeError('frozen host differs')
    if os.environ.get('LD_PRELOAD') or os.environ.get('LD_AUDIT'):raise RuntimeError('diagnostic/environment preload present')
    for p,h in ((baseline.UPSTREAM_MANIFEST,baseline.UPSTREAM_MANIFEST_SHA256),
                (baseline.STANDALONE_MANIFEST,baseline.STANDALONE_MANIFEST_SHA256),
                (baseline.STANDALONE_PATCH,baseline.STANDALONE_PATCH_SHA256)):
        if sha(p)!=h:raise RuntimeError('SunSpider manifest/patch mismatch')
    for directory,manifest in ((baseline.UPSTREAM_DIRECTORY,baseline.UPSTREAM_MANIFEST),
                                (baseline.STANDALONE_DIRECTORY,baseline.STANDALONE_MANIFEST)):
        baseline.verify_directory(directory,baseline.read_manifest(manifest),'frozen SunSpider')
    if read(HERE/'audit.json')['status']!='PASS':raise RuntimeError('new monotonic gate not PASS')
    if (HERE/'preservation_before.json').exists() and read(HERE/'preservation_before.json')!=preserved():raise RuntimeError('old experiments altered')
    if (HERE/'input_manifest.json').exists():
        for p,h in read(HERE/'input_manifest.json').items():
            if sha(ROOT/p)!=h:raise RuntimeError('new input changed; require a new attempt: '+p)
    return m

def initialize():
    m=cohort.verify()
    if read(HERE/'audit.json')['status']!='PASS':raise RuntimeError('timer gate not ready')
    manifest=json.loads(json.dumps(m))
    manifest.update(mode=MODE,old_manifest_sha256=sha(cohort.HERE/'manifest.json'),
        clock='benchNow -> captured native performance.now -> CLOCK_MONOTONIC elapsed milliseconds',
        new_quickjs_shell=False)
    for e in ENGINES:manifest['engines'][e]['timer_adapter']={'path':str(HERE/'adapters'/f'{e}.js'),'sha256':sha(HERE/'adapters'/f'{e}.js')}
    save(HERE/'manifest.json',manifest)
    c=read(cohort.HERE/'execution_contract.json')
    c.update(main_mode=MODE,timer='benchNow',clock_semantics='monotonic elapsed time, fractional milliseconds, process-local differences',
             timer_backend_change_only=True,full_formal_benchmark_authorized_in_this_phase=True,
             floating_payload_check='finite/nonnegative; formal strictly positive; inner <= outer+5ms',
             clock_quality_gate='timer_recovery/audit.json PASS plus every calibration/formal sample consistency check',
             diagnostic_warmup_mode=None)
    save(HERE/'execution_contract.json',c)
    save(HERE/'preservation_before.json',preserved())
    save(HERE/'input_manifest.json',input_hashes())
    verify()

def environment(path):
    r={'timestamp_utc':stamp(),'client_date':'2026-10-05 Asia/Shanghai','host':platform.node(),
       'kernel':platform.release(),'architecture':platform.machine(),'WSL_DISTRO_NAME':os.environ.get('WSL_DISTRO_NAME'),
       'load_average':os.getloadavg(),'python_clock_info':vars(time.get_clock_info('perf_counter')),
       'temperature':None,'per_sample_physical_frequency':None,'power_limits':None,
       'background_isolation':'UNKNOWN','boot_id':Path('/proc/sys/kernel/random/boot_id').read_text().strip()}
    for key,cmd in {'CPU':['lscpu'],'OS':['cat','/etc/os-release'],'memory':['free','-b'],
                    'clocksource':['cat','/sys/devices/system/clocksource/clocksource0/current_clocksource'],
                    'background':['ps','-eo','pid,comm,pcpu,pmem','--sort=-pcpu']}.items():
        p=subprocess.run(cmd,capture_output=True,text=True,timeout=30,check=False)
        r[key]={'exit_code':p.returncode,'stdout':p.stdout,'stderr':p.stderr}
    r['runtime_inputs_verified']=True
    save(path,r)

class Campaign:
    def __init__(self,name,attempt='01'):
        self.name=name;self.attempt=attempt
        base='sunspider_three_engine' if name=='SunSpider' else 'octane_three_engine'
        self.path=ROOT/'experiments'/base/MODE/('attempt'+attempt)
        self.path.mkdir(parents=True,exist_ok=True)
        self.units=list(baseline.TESTS) if name=='SunSpider' else [s+'.'+b for s,bs in BENCHMARKS.items() for b in bs]
        self.seed=20261005 if name=='SunSpider' else 20260928
        self.checksums=allowed() if name=='SunSpider' else None

    def setup(self):
        verify()
        cfg={'cohort':cohort.manifest()['cohort_id'],'mode':MODE,'metric':'first-call-inclusive interpreter-mode execution time',
             'benchmark':self.name,'attempt':self.attempt,'units':self.units,'seed':self.seed,
             'warmup_calls':0,'target_ms':TARGET,'max_N':MAX_N,'timeout_seconds':TIMEOUT,'repetitions':REPS,
             'driver_sha256':sha(HERE/'drivers'/('sunspider.js' if self.name=='SunSpider' else 'octane.js')),
             'clock_tolerance_ms':5.0,'statistics':'sample stddev; Tukey halves IQR; ratios of medians',
             'octane_aggregation':'subbenchmark ratios -> complete-suite GM -> equal-suite GM',
             'static_frontend_exclusion':'UNKNOWN; JSC first-call preparation included',
             'old_pilots_reused':False,'old_windows_data_mixed':False,
             'sensitivity_narrow':['RegExp','CodeLoad'],'sensitivity_broad':['RegExp','CodeLoad','Mandreel','Typescript']}
        save(self.path/'config.json',cfg)
        save(self.path/'manifest.json',(HERE/'manifest.json').read_bytes())
        save(self.path/'execution_contract.json',(HERE/'execution_contract.json').read_bytes())
        save(self.path/'input_manifest.json',(HERE/'input_manifest.json').read_bytes())
        if not (self.path/'environment/before.json').exists():environment(self.path/'environment/before.json')

    def unit_info(self,unit):
        return (unit,unit) if self.name=='SunSpider' else tuple(unit.split('.',1))

    def source(self,unit,n,correctness):
        cfg=json.dumps({'case':unit,'N':n,'phase':'correctness' if correctness else 'measure'},separators=(',',':'))
        if self.name=='SunSpider':
            source=b'function __tebSunSpiderWorkload() {\n'+(baseline.STANDALONE_DIRECTORY/(unit+'.js')).read_bytes()
            source+=('\nreturn String('+repeated.CHECKSUM[unit]+');\n}\n').encode()
            driver=(HERE/'drivers/sunspider.js').read_text().replace('__CONFIG__',cfg).replace('__CHECKSUMS__',json.dumps(self.checksums[unit]))
        else:
            suite,b=self.unit_info(unit)
            source=b'\n;\n'.join((ROOT/'benchmarks/octane/upstream'/p).read_bytes() for p in ('base.js',*OCTANE_FILES[suite]))+b'\n;\n'
            driver=(HERE/'drivers/octane.js').read_text().replace('__CONFIG__',cfg).replace('__SUITE__',json.dumps(suite))
            driver=driver.replace('__INDEX__',str(BENCHMARKS[suite].index(b))).replace('__BENCHMARK__',json.dumps(b))
        return source+driver.encode()

    def records(self,stage):
        p=self.path/'records'/stage
        return [read(f) for f in sorted(p.rglob('*.json'))] if p.exists() else []

    def invoke(self,stage,unit,engine,n,rep=0,order=0,permutation=(),schedule_index=0,case_position=0):
        correctness=stage in ('correctness','selected_correctness')
        directory=self.path/'records'/stage/unit
        stem=f'N{n}.rep{rep}.{engine}.order{order}'
        existing=sorted(directory.glob(stem+'.attempt*.json')) if directory.exists() else []
        for f in existing:
            r=read(f)
            if r['valid']:
                if sha(r['script_path'])!=r['script_sha256']:raise RuntimeError('stored script changed')
                return r
        script=self.path/'generated'/f'{unit}.N{n}.{stage if correctness else "measure"}.js'
        save(script,self.source(unit,n,correctness))
        cmd=command(engine,script);suite,b=self.unit_info(unit)
        r={'cohort':cohort.manifest()['cohort_id'],'mode':MODE,'benchmark':self.name,'stage':stage,
           'case':unit,'suite':suite,'subbenchmark':b,'engine':engine,'N':n,'rep':rep,'order':order,
           'permutation':list(permutation),'schedule_index':schedule_index,'round_case_position':case_position,
           'attempt':len(existing)+1,'timestamp_utc':stamp(),'command':cmd,
           'flags':cohort.manifest()['engines'][engine]['runtime_flags'],
           'binary_sha256':cohort.manifest()['engines'][engine]['binary']['sha256'],
           'script_path':str(script),'script_sha256':sha(script),'adapter_sha256':sha(HERE/'adapters'/f'{engine}.js'),
           'warmup_calls':0,'checks_each_call':correctness,'elapsed_ms':None,'elapsed_per_call_ms':None,
           'start_ms':None,'stop_ms':None,'checksum':None,'extra_validation_calls':0,
           'clock_consistency':None,'timeout_seconds':TIMEOUT,'diagnostic_preload':False}
        start=time.perf_counter_ns()
        try:
            p=subprocess.run(cmd,cwd=ROOT,capture_output=True,timeout=TIMEOUT,check=False)
            r.update(exit_code=p.returncode,stdout=p.stdout.decode(errors='replace'),stderr=p.stderr.decode(errors='replace'))
        except subprocess.TimeoutExpired as e:
            r.update(exit_code=None,stdout=(e.stdout or b'').decode(errors='replace'),stderr=(e.stderr or b'').decode(errors='replace'),error='TIMEOUT')
        except OSError as e:r.update(exit_code=None,stdout='',stderr=str(e),error='OSERROR')
        r['outer_stop_ns']=time.perf_counter_ns()
        r['outer_start_ns']=start
        r['outer_wall_ns']=r['outer_stop_ns']-start
        r['boot_id']=Path('/proc/sys/kernel/random/boot_id').read_text().strip()
        try:
            matches=re.findall(r'^TEB_RESULT:(.*)$',r['stdout'],re.M)
            if r['exit_code']!=0 or r['stderr'] or len(matches)!=1:raise ValueError('exit/stderr/result gate failed')
            p=json.loads(matches[0])
            for k,v in {'benchmark':self.name,'case':unit,'mode':MODE,'phase':'correctness' if correctness else 'measure',
                        'N':n,'correctness':'PASS','timer':'benchNow','warmup_calls':0}.items():
                if p.get(k)!=v:raise ValueError('payload identity mismatch '+k)
            if self.name=='SunSpider' and p['checksum'] not in self.checksums[unit]:raise ValueError('frozen checksum gate failed')
            r.update({k:p.get(k) for k in ('elapsed_ms','elapsed_per_call_ms','start_ms','stop_ms','checksum','extra_validation_calls') if k in p})
            if not correctness:
                elapsed=p['elapsed_ms'];a=p['start_ms'];z=p['stop_ms']
                if not all(type(v) in (int,float) and math.isfinite(v) for v in (elapsed,a,z)) or elapsed<0:
                    raise ValueError('CLOCK_CHAIN: nonfinite/negative')
                if elapsed!=z-a or p['elapsed_per_call_ms']!=elapsed/n:raise ValueError('clock/payload arithmetic differs')
                okay=elapsed<=r['outer_wall_ns']/1e6+5.0
                r['clock_consistency']={'pass':okay,'inner_minus_outer_ms':elapsed-r['outer_wall_ns']/1e6,'tolerance_ms':5.0}
                if not okay:raise ValueError('CLOCK_CHAIN: internal > external tolerance')
                if stage=='formal' and elapsed<=0:raise ValueError('zero interval; no epsilon')
            r.update(valid=True,status='PASS',error='')
        except (ValueError,KeyError,TypeError) as e:r.update(valid=False,status='TIMEOUT' if r.get('error')=='TIMEOUT' else 'FAIL',error=r.get('error') or str(e))
        save(directory/(stem+f'.attempt{r["attempt"]:03}.json'),r)
        if not r['valid']:
            save(self.path/'failures'/f'{stage}.{unit}.{engine}.N{n}.rep{rep}.attempt{r["attempt"]:03}.json',r)
        return r

    def correctness(self,selected=None):
        stage='selected_correctness' if selected is not None else 'correctness'
        units=list(selected) if selected is not None else self.units
        good=[];compat=[]
        for u in units:
            ns=(selected[u]['N'],) if selected is not None else (1,2)
            rr=[]
            for n in ns:
                for e in ENGINES:
                    r=self.invoke(stage,u,e,n);rr.append(r)
                    print(f'{self.name} {stage} {u} {e} N={n}: {r["status"]}',flush=True)
            okay=all(r['valid'] for r in rr)
            if okay:good.append(u)
            row={'case':u,'suite':self.unit_info(u)[0],'subbenchmark':self.unit_info(u)[1],
                 **{e+'_status':'PASS' if all(r['valid'] for r in rr if r['engine']==e) else 'FAIL' for e in ENGINES},
                 'included':okay,'reason':'; '.join(r['engine']+': '+r['error'] for r in rr if not r['valid'])}
            compat.append(row)
        csv_new(self.path/'raw'/f'{stage}.csv',self.records(stage))
        if selected is None:
            save(self.path/'compatibility.json',compat);csv_new(self.path/'compatibility.csv',compat)
            if self.name=='Octane':
                save(self.path/'existing_exclusions.json',{'zlib':'QuickJS lacks original read() interface; existing exclusion retained',
                                                          'Box2D':'existing upstream correctness coverage not reliable; excluded from formal statistics'})
        return good

    def calibrate(self,units):
        selected={}
        for u in units:
            n=1
            while n<=MAX_N:
                rr=[self.invoke('calibration',u,e,n,order=i+1) for i,e in enumerate(ENGINES)]
                print(f'{self.name} calibration {u} N={n}: '+', '.join(f'{r["engine"]}={r["elapsed_ms"]}ms/{r["status"]}' for r in rr),flush=True)
                if not all(r['valid'] for r in rr):raise RuntimeError('calibration invalid; retain evidence: '+u)
                if all(r['elapsed_ms']>=TARGET for r in rr):
                    selected[u]={'case':u,'N':n,'script_sha256':rr[0]['script_sha256'],
                                 **{r['engine']+'_calibration_ms':r['elapsed_ms'] for r in rr}}
                    save(self.path/'selected_n'/f'{u}.json',selected[u]);break
                n*=2
            else:raise RuntimeError('calibration MAX_N: '+u)
        csv_new(self.path/'raw/calibration.csv',self.records('calibration'))
        csv_new(self.path/'selected_n.csv',selected.values())
        return selected

    def schedule(self,units):
        rng=random.Random(self.seed);order={}
        for u in units:
            a=list(itertools.permutations(ENGINES))*5;rng.shuffle(a);order[u]=a
        schedule=[]
        for rep in range(1,REPS+1):
            shuffled=list(units);rng.shuffle(shuffled)
            for pos,u in enumerate(shuffled,1):
                for i,e in enumerate(order[u][rep-1],1):
                    schedule.append({'case':u,'engine':e,'rep':rep,'order':i,'permutation':list(order[u][rep-1]),
                                     'round_case_position':pos,'schedule_index':len(schedule)+1})
        save(self.path/'schedule.json',schedule);csv_new(self.path/'schedule.csv',schedule)
        return schedule

    def measure(self,units,selected):
        schedule=self.schedule(units)
        for item in schedule:
            r=self.invoke('formal',item['case'],item['engine'],selected[item['case']]['N'],
                rep=item['rep'],order=item['order'],permutation=item['permutation'],schedule_index=item['schedule_index'],case_position=item['round_case_position'])
            if not r['valid']:raise RuntimeError('invalid sample retained; investigate then resume '+str(item))
            if item['order']==3:print(f'{self.name} FORMAL {item["schedule_index"]}/{len(schedule)} rep={item["rep"]} {item["case"]}',flush=True)
        csv_new(self.path/'raw/formal.csv',self.records('formal'))

    def statistics(self,units):
        allrows=self.records('formal');good=[r for r in allrows if r['valid']]
        groups={};medians={};summary=[]
        for u in units:
            for e in ENGINES:
                rows=[r for r in good if r['case']==u and r['engine']==e]
                if len(rows)!=30 or len({r['rep'] for r in rows})!=30:raise RuntimeError('missing/duplicate formal group')
                x=sorted(r['elapsed_per_call_ms'] for r in rows);mid=len(x)//2
                medians[u,e]=statistics.median(x)
                summary.append({'case':u,'suite':self.unit_info(u)[0],'subbenchmark':self.unit_info(u)[1],'engine':e,
                    'N':rows[0]['N'],'samples':len(x),'median_ms':statistics.median(x),'mean_ms':statistics.mean(x),
                    'sample_stddev_ms':statistics.stdev(x),'IQR_ms':statistics.median(x[mid:])-statistics.median(x[:mid]),
                    'min_ms':x[0],'max_ms':x[-1],'below_calibration_target_count':sum(r['elapsed_ms']<TARGET for r in rows)})
        ratios=[]
        for u in units:ratios.append({'case':u,'suite':self.unit_info(u)[0],'subbenchmark':self.unit_info(u)[1],
             **{p:medians[u,a]/medians[u,b] for p,(a,b) in PAIRS.items()}})
        suite=[]
        if self.name=='Octane':
            for s,names in BENCHMARKS.items():
                members=[r for r in ratios if r['suite']==s]
                complete={r['subbenchmark'] for r in members}==set(names)
                suite.append({'suite':s,'complete':complete,'subbenchmarks':[r['subbenchmark'] for r in members],
                              **{p:math.exp(statistics.mean(math.log(r[p]) for r in members)) if members else None for p in PAIRS}})
            intersection=[r for r in suite if r['complete']]
        else:intersection=ratios
        overview={'cohort':cohort.manifest()['cohort_id'],'mode':MODE,'benchmark':self.name,
                  'formal_valid':len(good),'expected_candidates':len(self.units)*90,
                  'complete_intersection':[r['suite'] if self.name=='Octane' else r['case'] for r in intersection],
                  'GM':{p:math.exp(statistics.mean(math.log(r[p]) for r in intersection)) for p in PAIRS},
                  'winner_counts':{p:{'numerator_lower':sum(r[p]<1 for r in intersection),'denominator_lower':sum(r[p]>1 for r in intersection),
                                     'tie':sum(r[p]==1 for r in intersection)} for p in PAIRS}}
        csv_new(self.path/'summary/per_case.csv',summary);csv_new(self.path/'summary/pairwise.csv',ratios)
        if suite:csv_new(self.path/'summary/suite_summary.csv',suite)
        save(self.path/'summary/overview.json',overview)
        # Mechanism labels fixed by source, never selected according to speed.
        if self.name=='Octane':
            subsets={'all_complete':intersection,'without_RegExp_CodeLoad':[r for r in intersection if r['suite'] not in ('RegExp','CodeLoad')],
                     'without_specialized_broad':[r for r in intersection if r['suite'] not in ('RegExp','CodeLoad','Mandreel','Typescript')]}
        else:
            tags=read(ROOT/'experiments/sunspider_three_engine/config.json')['case_tags']
            tags['string-tagcloud']=sorted(set(tags['string-tagcloud']+['dynamic-code']))
            save(self.path/'mechanism_tags.json',{'tags':tags,'non_exhaustive':True,'pure_builtin_free_claim':False,
                'correction_from_old_description':'string-tagcloud parseJSON eval is tagged dynamic-code; no algorithm change'})
            subsets={'all_complete':intersection}
            for tag in ('RegExp','dynamic-code','runtime-specialized'):
                subsets['tag:'+tag]=[r for r in intersection if tag in tags[r['case']]]
                subsets['without:'+tag]=[r for r in intersection if tag not in tags[r['case']]]
        gmrows=[]
        for subset,rs in subsets.items():
            for p in PAIRS:gmrows.append({'subset':subset,'pair':p,'count':len(rs),
                'intersection':[r.get('case',r.get('suite')) for r in rs],
                'GM':math.exp(statistics.mean(math.log(r[p]) for r in rs)) if rs else None})
        csv_new(self.path/'summary/pairwise_summary.csv',gmrows)
        return overview

    def run(self):
        self.setup();good=self.correctness()
        if not good:raise RuntimeError('no compatible cases')
        selected=self.calibrate(good)
        checks=self.correctness(selected)
        if checks!=good:raise RuntimeError('selected-N correctness failure')
        verify();self.measure(good,selected);self.statistics(good);verify()
        if not (self.path/'environment/after.json').exists():environment(self.path/'environment/after.json')
        save(self.path/'preservation_after.json',preserved())
        from independent_audit import audit
        result=audit(self)
        if result['status']!='PASS':raise RuntimeError('independent audit failed')
        print(self.name+' AUDIT PASS '+json.dumps(result['GM']),flush=True)

def main():
    p=argparse.ArgumentParser();p.add_argument('stage',choices=('all','sunspider','octane','verify'))
    p.add_argument('--attempt',default='01');args=p.parse_args()
    if not re.fullmatch(r'[0-9]{2}',args.attempt):raise ValueError('attempt must be two digits')
    if not (HERE/'input_manifest.json').exists():initialize()
    verify()
    if args.stage=='verify':print('MAIN_MONOTONIC_V1 frozen inputs verified');return
    if args.stage in ('all','sunspider'):Campaign('SunSpider',args.attempt).run()
    if args.stage in ('all','octane'):
        ss=Campaign('SunSpider',args.attempt)
        if read(ss.path/'summary/audit.json')['status']!='PASS':raise RuntimeError('SunSpider must pass independent audit before Octane')
        Campaign('Octane',args.attempt).run()

if __name__=='__main__':
    try:main()
    except Exception:
        print(traceback.format_exc(),flush=True)
        raise
