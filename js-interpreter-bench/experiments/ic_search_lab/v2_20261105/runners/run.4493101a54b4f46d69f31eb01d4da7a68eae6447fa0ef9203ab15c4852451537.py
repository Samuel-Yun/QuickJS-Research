"""V2 entry. Reuse frozen V1 workload/capture helpers; never write V1 records."""
import argparse,csv,difflib,hashlib,io,json,os,random,shutil,sys,time
from pathlib import Path
HERE=Path(__file__).resolve().parent;PREV=HERE.parent
sys.path.insert(0,str(PREV))
import lab,measure
lab.HERE=HERE;measure.HERE=HERE;measure.SEED=20261105
lab.candidate_metadata_path=lambda cid:HERE/(cid+'.matched.json')
def gate():
    assert not (HERE/'STOP').exists() and not (HERE/'STOP_MATCHED').exists(),'saved stop; no automatic retry'
    assert not (HERE/'decision.json').exists(),'closed search'
    if (HERE/'environment.json').exists():assert lab.boot()==lab.load(HERE/'environment.json')['boot_id'],'BOOT_CHANGED'
lab.execution_gate=gate

def prepare():
    assert not (HERE/'workspace.json').exists(),'one preparation only'
    os.sched_setaffinity(0,{2});old=lab.load(PREV/'workspace.json');env=lab.load(PREV/'environment.postreboot.json')
    env.update(timestamp=lab.stamp(),boot_id=lab.boot(),cpuinfo=Path('/proc/cpuinfo').read_text(),meminfo=Path('/proc/meminfo').read_text(),
       load_average=os.getloadavg(),previous_environment='read-only ../environment.postreboot.json',idle_helper_pid=515,
       compiler=lab.capture(['gcc','--version'],'inventory','compiler')['stdout'])
    lab.save(HERE/'environment.json',env)
    for a in old['artifacts'].values():assert lab.sha(a['path'])==a['sha256']
    shutil.copyfile(PREV/'seed_M.tar.gz',HERE/'seed_M.tar.gz')
    active=HERE/'active';assert not active.exists();active.mkdir()
    lab.save(HERE/'workspace.json',dict(active_source=str(active),active_build=str(active),artifacts=old['artifacts'],
        source_files=old['source_files'],seed_archive_sha256=old['seed_archive_sha256']))
    for n,data in lab.reconstructed_sources('M').items():(active/n).write_bytes(data)
    (active/'compat').mkdir();support=(PREV/'build_support/test-closefrom.c').read_bytes().replace(b'\r\n',b'\n').replace(b'\n',b'\r\n')
    (active/'compat/test-closefrom.c').write_bytes(support)
    assert lab.sha(active/'compat/test-closefrom.c')=='6cd3fc4b77a33b7d496d9d51f32e7a2d62ab00cd604462fd2a8f70ceba52b813'
    shutil.copyfile(PREV/'checks.js',HERE/'checks.js');(HERE/'artifacts').mkdir()
    columns=['id','parent','category','hypothesis','status','patch_sha256','binary_sha256','correctness','sunspider_screen_gm','octane_screen_gm','recheck','decision','build_profile']
    descriptions=[('s001','pc_relative','PC relative bytecode and site allocation'),('s002','shared_table','bounded per-function shape plus atom table'),
                  ('s003','metadata_lifetime','all metadata prepared on first function entry'),('s004','shape_hint','shape-local validated positive lookup hint')]
    stream=io.StringIO(newline='');w=csv.DictWriter(stream,columns,lineterminator='\n');w.writeheader()
    for cid,cat,h in descriptions:w.writerow(dict(id=cid,parent='M',category=cat,hypothesis=h,status='PLANNED',build_profile='matched'))
    lab.save(HERE/'candidates.csv',stream.getvalue())
    protocol=dict(start_commit='0bbfe03062d2dc67e91cdf54033529f03b309886',max_candidates=6,planned_actual_candidates=4,
       boot_id=lab.boot(),seed=20261105,metric='FIRST_CALL_INCLUSIVE_NATIVE_MONOTONIC_V1',warmup_calls=0,
       original_N='reuse fixed previous repetitions; no previous times',screen_order='A,candidate,A',
       shortlist_max=2,recheck_rounds=3,recheck_conditions='A,candidate,actual parent; each position once over3 rounds',
       bootstrap='10000 shared-round paired draws seed20261105; recompute per-case medians and hierarchical GM; exploratory unadjusted',
       final_gate='correctness+supported whole-suite recheck direction+regression check+mechanism evidence; no forced winner',
       final_if_ready='Octane17 A/M/frozen/V8_ON30 each; SunSpider26 A/M/frozen30 each; new data only',
       V8_flags=['--jitless','--no-lazy','--use-ic'],raw_newlines='UTF-8 LF; JSONL/bin/patch -text',
       random_input='original26 retained; 2 unseeded cases acknowledged, not a blanket block; separate seeded sensitivity only if final decision depends on them')
    lab.save(HERE/'protocol.json',protocol)
    # One actual bounded frozen workload per frozen runtime; not a long rerun.
    info=measure.inputs('sunspider');good=[]
    for pos,label in enumerate(['A','M']):
        r=measure.invoke(info,'runtime_gate','access-binary-trees',label,info['N']['access-binary-trees'],'runtime_gate',pos,0,'v2.runtime_gate')
        good.append(r['valid'])
    lab.save(HERE/'preflight.json',dict(status='PASS_BOUNDED_SMOKE_ONLY',real_workload_checks=good,boot_id=lab.boot(),
        previous_complete_evidence='../search_audit.json; new times not merged'))
    print('V2_PREPARED_REAL_WORKLOAD_A_M_PASS',lab.boot(),flush=True)

def build(cid):
    gate();os.sched_setaffinity(0,{2});assert cid in [f's{i:03}' for i in range(1,5)]
    assert not (HERE/(cid+'.matched.json')).exists();active=HERE/'active';workspace=lab.load(HERE/'workspace.json')
    parent='M';original=lab.reconstructed_sources(parent);patch=[];hashes={}
    for n,base in original.items():
        data=(active/n).read_bytes();hashes[n]=hashlib.sha256(data).hexdigest()
        if data!=base:patch.extend(difflib.unified_diff(base.decode().splitlines(True),data.decode().splitlines(True),fromfile='a/'+n,tofile='b/'+n))
    assert patch;lab.save(HERE/'patches'/(cid+'.patch'),''.join(patch));ph=lab.sha(HERE/'patches'/(cid+'.patch'))
    support={'compat/test-closefrom.c':lab.sha(active/'compat/test-closefrom.c')}
    assert support['compat/test-closefrom.c']=='6cd3fc4b77a33b7d496d9d51f32e7a2d62ab00cd604462fd2a8f70ceba52b813'
    lab.candidate_status(cid,status='BUILDING',patch_sha256=ph)
    r=lab.capture(['make','-B','-j1','qjs','qjsc'],'build',cid,300,dict(source_sha256=hashes,patch_sha256=ph,build_support=support),active)
    assert r['exit_code']==0 and r['boot_id']==r['boot_id_after'],r['stderr']
    commands=lambda s:sorted(x.strip() for x in s.splitlines() if x.startswith('gcc '))
    ref=lab.load(lab.ROOT/'experiments/ic_mechanism_audit/attempt01/raw/build/M_clean_release.json')['stdout']
    assert commands(r['stdout'])==commands(ref),'compile/link configuration mismatch'
    assert hashes=={n:lab.sha(active/n) for n in hashes}
    dest=HERE/'artifacts'/(cid+'.matched.qjs');shutil.copyfile(active/'qjs',dest);dest.chmod(0o755)
    art=dict(id=cid,parent=parent,path=str(dest),sha256=lab.sha(dest),size=dest.stat().st_size,ELF=dest.read_bytes()[:4]==b'\x7fELF',
        source_sha256_before_build=hashes,source_sha256_after_build=hashes,patch_sha256=ph,seed_archive_sha256=workspace['seed_archive_sha256'],
        build_profile='matched',build_support_files=support,boot_id=lab.boot(),build_command=r['command'],compile_link_commands=commands(r['stdout']))
    lab.save(HERE/(cid+'.matched.json'),art)
    smoke=lab.capture([dest,'-e','console.log(123)'],'candidate_smoke',cid,10,art)
    assert smoke['exit_code']==0 and smoke['stdout']=='123\n' and not smoke['stderr']
    for label,a in [('A',workspace['artifacts']['A']),(cid,art)]:
        t=lab.capture([a['path'],HERE/'checks.js'],'minimal_correctness',label,15,dict(binary_sha256=a['sha256'],input_sha256=lab.sha(HERE/'checks.js'),candidate=cid))
        assert t['exit_code']==0 and not t['stderr'] and t['stdout']=='CHECKS_PASS:7020\n'
    lab.candidate_status(cid,status='CHECKED_NOT_SCREENED',binary_sha256=art['sha256'],correctness='7020 assertions; specific lifecycle gate required before screen',decision='not ranked')
    print('V2_BUILD_CHECK_PASS',cid,art['sha256'],flush=True)

def restore(current):
    gate();active=HERE/'active';m=lab.load(lab.candidate_metadata_path(current))
    for n,h in m['source_sha256_after_build'].items():assert lab.sha(active/n)==h,'unrecorded active edit '+n
    for n,data in lab.reconstructed_sources('M').items():
        if (active/n).read_bytes()!=data:(active/n).write_bytes(data)
    lab.append(dict(event='active_restore',timestamp=lab.stamp(),from_candidate=current,to='M',boot_id=lab.boot()))
    print('ACTIVE_RESTORED_M_FROM',current,flush=True)

def extra(cid):
    gate();os.sched_setaffinity(0,{2});art=measure.artifact(cid);active=HERE/'active'
    for n,h in art['source_sha256_after_build'].items():assert lab.sha(active/n)==h
    results=[]
    for label,a in [('A',measure.artifact('A')),(cid,art)]:
        r=lab.capture([a['path'],HERE/'semantic_extra.js'],'targeted_semantics',label,15,
             dict(binary_sha256=a['sha256'],script_sha256=lab.sha(HERE/'semantic_extra.js'),candidate=cid))
        assert r['exit_code']==0 and not r['stderr'] and 'V2_SEMANTIC_PASS:' in r['stdout'] and 'V2_ASYNC_PASS\n' in r['stdout']
        results.append(r)
    assert results[0]['stdout']==results[1]['stdout']
    objects=[active/'.obj'/(n+'.o') for n in ['quickjs','dtoa','libregexp','libunicode','cutils']]
    out=HERE/'artifacts'/(cid+'.first_entry_roundtrip')
    r=lab.capture(['gcc','-g','-O2','-I'+str(active),HERE/'first_entry_roundtrip.c',*objects,'-lm','-lpthread','-ldl','-o',out],
        'targeted_first_entry_build',cid,30,dict(source_sha256=lab.sha(HERE/'first_entry_roundtrip.c'),objects={p.name:lab.sha(p) for p in objects}))
    assert r['exit_code']==0,r['stderr']
    r=lab.capture([out],'targeted_first_entry',cid,20,dict(binary_sha256=lab.sha(out),candidate=cid))
    assert r['exit_code']==0 and not r['stderr'] and 'FIRST_ENTRY_ROM_RETRY_PASS' in r['stdout'],r
    lab.save(HERE/(cid+'.extra.json'),dict(status='PASS',semantic_stdout=results[0]['stdout'],
        first_entry_stdout=r['stdout'],tokens=[x['token'] for x in results]+[r['token']],
        limitation='First-entry low budget may fail at surrounding JS allocation, not proof of a specific metadata allocation site.'))
    print('V2_EXTRA_PASS',cid,r['stdout'].strip(),flush=True)

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('action',choices=['prepare','build','restore','lifecycle','extra','screen','screen_pair','recheck']);p.add_argument('args',nargs='*');a=p.parse_args()
    h=lab.sha(Path(__file__));lab.save(HERE/'runners'/('run.'+h+'.py'),Path(__file__).read_bytes())
    if a.action=='prepare':prepare()
    elif a.action=='build':build(*a.args)
    elif a.action=='restore':restore(*a.args)
    elif a.action=='lifecycle':lab.lifecycle(*a.args)
    elif a.action=='extra':extra(*a.args)
    elif a.action=='recheck':
        from recheck import collect
        collect(*a.args)
    elif a.action=='screen_pair':
        gate();cid=a.args[0];assert (HERE/(cid+'.matched.lifecycle.json')).exists() and (HERE/(cid+'.extra.json')).exists()
        measure.screen(cid,'sunspider');gate();measure.screen(cid,'octane')
    elif a.action=='screen':
        gate();cid,kind=a.args;assert (HERE/(cid+'.matched.lifecycle.json')).exists(),'specific lifecycle gate first'
        measure.screen(cid,kind)
