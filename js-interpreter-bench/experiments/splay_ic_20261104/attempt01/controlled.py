from common import *
import shutil,sys,gzip,random,statistics
def build():
    plan=read(HERE/'diagnostic/focus_plan.json');assert [r['pc'] for r in plan['targets']]==[43,138,147]
    f=read(HERE/'diagnostic/splay_final_dump.json')[0];source=bytes.fromhex(f['source_hex']).decode()
    ids={}
    for label in ['C','C_diag']:
        src=Path(runtime()['sources']['M']['path']) if label=='C' else Path(read(HERE/'diagnostic_v3_manifest.json')['M']['source'])
        dst=STORE/label;assert not dst.exists();dst.mkdir(parents=True)
        for p in src.iterdir():
            if p.is_file() and (p.suffix in ['.c','.h','.inc','.js','.mjs'] or p.name in ['Makefile','VERSION','LICENSE']):shutil.copyfile(p,dst/p.name)
        text='static const char sp_target_source[]='+json.dumps(source)+';\n'+(HERE/'diagnostic/control.inc').read_text()
        save(dst/'sp_control.inc',text)
        p=dst/'quickjs.c';p.write_text(p.read_text()+'\n#include "sp_control.inc"\n')
        p=dst/'qjs.c';s=p.read_text();s=one(s,'int main(int argc, char **argv)','extern void sp_control_install(JSContext*);\nint main(int argc, char **argv)')
        s=one(s,'        js_std_add_helpers(ctx, argc - optind, argv + optind);','        js_std_add_helpers(ctx, argc - optind, argv + optind);\n        sp_control_install(ctx);');p.write_text(s)
        r=capture(['make','-j2','qjs','qjsc'],label+' control build',cwd=dst,timeout=300);save(HERE/'raw/build'/(label+'.json'),r);assert r['exit_code']==0,r['stderr'][-3500:]
        ids[label]=dict(path=str(dst/'qjs'),sha256=sha(dst/'qjs'),source=str(dst),formal=False)
    save(HERE/'control_runtime.json',ids)
    save(HERE/'mechanism_plan.md','# 预先冻结的机制对照\n\n选择依据：新 Run 内 N2 计数中 splay_ PC43/key、PC138/key、PC147/right 是前三替换位置。不是耗时排名。\n\n同一个 C ELF，ON 保留它们的 M opcode，OFF 在必需 Setup 完成后、首次计时 Run 前恢复三个普通读取 opcode/atom。每个恢复的 atom 另 dup，保持 bytecode/site 各自所有权；cache shape 边不释放。没有在正式循环加入 mode 分支，不提前执行 Run。\n\n它同时移除这些位置的命中和失配维护，检验的是整个策略的净效果，不是维护 self-time。A/M/C_ON/C_OFF 一起测 Richards、Splay、numeric_control；C_ON/M 为桥接，数值控制不是免费扣除项。三边目标输入和 Run 语义不变。30 配对轮、1050ms 三次独立 pilot、bootstrap10000/seed20261104；偏短和异常值保留。\n')
    print('CONTROL_BUILT',flush=True)
def script(case,n,phase):
    cached=HERE/'mechanism/control_scripts'/case/f'N{n}.{phase}.js'
    if cached.exists():return cached
    import campaign
    # Reuse unchanged public script construction with a lightweight instance.
    c=campaign.Campaign.__new__(campaign.Campaign);c.kind='octane' if '.' in case and not case.startswith('M4.') else 'micro';c.dir=HERE/'mechanism'
    c.catalog=read(PREV/'octane/case_catalog.json')
    # Inputs are public byte-identical copies; the control is outside the timed region.
    for p in (PREV/'octane/inputs').rglob('*'):
        if p.is_file():save(c.dir/'inputs'/p.relative_to(PREV/'octane/inputs'),p.read_bytes())
    for p in (PREV/'cases').glob('*.js'):save(c.dir/'inputs'/p.name,p.read_bytes())
    original=campaign.base.Campaign.script(c,case,n,phase)
    s=original.read_text();target='SplayTree.prototype.splay_' if case=='Splay.Splay' else 'Scheduler.prototype.schedule' if case=='Richards.Richards' else 'microRun'
    hook='if(typeof __spControl==="function"){var __spSelected=__spControl('+target+');if(__spSelected!=='+('3' if case=='Splay.Splay' else '0')+')throw Error("selection");}\n'
    if c.kind=='octane':s=one(s,'  var started=now();',hook+'  var started=now();')
    else:s=one(s,'var start=benchNow();',hook+'var start=benchNow();')
    p=HERE/'mechanism/control_scripts'/case/f'N{n}.{phase}.js';save(p,s);return p
def invoke(stage,case,c,n,rep,pos):
    dst=HERE/'mechanism/raw'/stage/case/f'{c}.N{n}.rep{rep:02d}.pos{pos}.json'
    if dst.exists():return read(dst)
    artifact=read(HERE/'control_runtime.json')['C'] if c.startswith('C_') else runtime()['artifacts'][c]
    p=script(case,n,stage);cmd=[artifact['path'],str(p)];env=dict(os.environ,SP_DISABLE='1' if c=='C_OFF' else '0')
    marker=HERE/'mechanism/started'/stage/case/dst.name
    assert not marker.exists(),'orphaned position: preserve and diagnose, never silently rerun'
    save(marker,dict(command=cmd,timestamp=stamp(),boot_id=boot(),environment_control=env['SP_DISABLE']))
    r=capture(cmd,'controlled '+case+' '+c,env=env)
    prefix='MICRO_RESULT:' if case.startswith('M4.') else 'OCTANE_IC_RESULT:'
    ss=[x[len(prefix):] for x in r['stdout'].splitlines() if x.startswith(prefix)];payload=json.loads(ss[0]) if len(ss)==1 else {}
    valid=r['exit_code']==0 and not r['stderr'] and payload.get('correctness')=='PASS' and payload.get('N')==n and payload.get('warmup_calls')==0
    elapsed=payload.get('elapsed_ms');valid=valid and elapsed is not None and elapsed>=0 and elapsed<=r['external_wall_ms']+5 and r['boot_id']==r['boot_id_after']
    if stage in ['pilot','formal']:valid=valid and elapsed>0
    r.update(case=case,condition=c,N=n,repetitions=n,rep=rep,order=pos,stage=stage,valid=bool(valid),elapsed_ms=elapsed,elapsed_per_Run_ms=elapsed/n if elapsed is not None else None,
      flags=[],binary_sha256=artifact['sha256'],script_sha256=sha(p),script_relative=p.relative_to(HERE).as_posix(),payload=payload,environment_control=env['SP_DISABLE'],
      mode='FIRST_CALL_INCLUSIVE_SELECTED_ORDINARY_CONTROL',checksum=payload.get('checksum'),performance_sample=stage=='formal')
    save(dst,r);print('CONTROL',stage,case,c,n,rep,valid,elapsed,flush=True);assert valid,'recorded failure'
    return r
def checks():
    for case in ['Splay.Splay','Richards.Richards','M4.numeric_control']:
        for n in [1,2]:
            for pos,c in enumerate(['A','M','C_ON','C_OFF']):invoke('correctness',case,c,n,n,pos)
    # Actual diagnostics verify the ordinary/IC split; no formal timing claims.
    import diagnose
    art=read(HERE/'control_runtime.json')['C_diag']
    for mode in [0,1]:
        p=diagnose.script('Splay.Splay',2);s=p.read_text();s=one(s,'  var started=now();','  if(__spControl(SplayTree.prototype.splay_)!==3)throw Error("selection");\n  var started=now();')
        dest=HERE/'mechanism/diagnostic/Splay.control.js';save(dest,s);report=STORE/f'Cdiag_mode{mode}.json'
        r=capture([art['path'],dest],'control actual counts',env=dict(os.environ,SP_DISABLE=str(mode),IC_MECHANISM_REPORT=str(report)))
        save(HERE/'mechanism/diagnostic'/f'mode{mode}.process.json',r);assert r['exit_code']==0 and not r['stderr']
        data=report.read_bytes();save(HERE/'mechanism/diagnostic'/f'mode{mode}.json.gz',gzip.compress(data,mtime=0))
        d=json.loads(data);f=next(f for f in d['functions'] if b'dummy = left = right' in bytes.fromhex(f['source_hex']))
        for op in f['opcodes']:
            if op['pc'] not in [43,138,147]:continue
            run=next(s for s in op['phases'] if s['phase']==2)
            assert run['operations']>0 and (run['ic_queries']==0 if mode else run['ic_queries']==run['operations'])
            if mode:assert run['updates']==run['replacements']==run['hits']==0
    save(HERE/'mechanism/gate.json',dict(status='PASS',first_Run_included=True,extra_workload_preparation_calls=0,selected_pcs=[43,138,147],actual_counter_verification=True))
def run():
    pin();assert read(HERE/'mechanism/gate.json')['status']=='PASS'
    cs=['A','M','C_ON','C_OFF'];cases=['Splay.Splay','Richards.Richards','M4.numeric_control'];root=HERE/'mechanism'
    save(root/'protocol.json',dict(conditions=cs,cases=cases,repetitions=30,seed=SEED,pilot_per_condition=3,threshold_ms=1000,margin_ms=1050,performance_warmup_calls=0,scope='first call inclusive; selected ordinary treatment outside timer'))
    for case in cases:
        out=root/'selected'/(case+'.json')
        if out.exists():continue
        rr=[read(p) for p in (root/'raw/correctness'/case).glob('*.json')];unit=min(r['elapsed_per_Run_ms'] for r in rr if r['elapsed_per_Run_ms']>0)
        n=2**max(0,math.ceil(math.log2(1300/unit)))
        while n<=MAX_N:
            pilots=[invoke('pilot',case,c,n,k,j) for k in range(3) for j,c in enumerate(cs[k:]+cs[:k])]
            if min(r['elapsed_ms'] for r in pilots)>=1050:
                save(out,dict(case=case,N=n,pilot_count=12,min_pilot_ms=min(r['elapsed_ms'] for r in pilots)));break
            n*=2
        else:raise RuntimeError('Nmax')
    import campaign
    rng=random.Random(SEED);orders={c:campaign.base.balanced(cs,c,rng) for c in cases};schedule=[]
    for rep in range(30):
        cc=cases.copy();rng.shuffle(cc)
        for case in cc:
            for pos,c in enumerate(orders[case][rep]):schedule.append(dict(case=case,condition=c,rep=rep,order=pos,N=read(root/'selected'/(case+'.json'))['N']))
    save(root/'schedule.json',schedule)
    arts={c:read(HERE/'control_runtime.json')['C'] if c.startswith('C_') else runtime()['artifacts'][c] for c in cs}
    save(root/'frozen.json',dict(boot_id=boot(),artifacts=arts,script_hashes={c:sha(script(c,read(root/'selected'/(c+'.json'))['N'],'formal')) for c in cases},schedule_sha256=sha(root/'schedule.json')))
    for row in schedule:
        assert boot()==read(root/'frozen.json')['boot_id']
        invoke('formal',row['case'],row['condition'],row['N'],row['rep'],row['order'])
    save(root/'collected.json',dict(actual=len(schedule),expected=360,boot_id=boot(),timestamp=stamp()))
if __name__=='__main__':globals()[sys.argv[1]]()
