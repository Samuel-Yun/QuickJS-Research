"""One small search lab: append-only process evidence; no legacy worker use.

Preflight is bounded and does not modify/build any runtime. Further stages are
allowed only after its actual result, not merely because this script exists.
"""
import argparse,csv,datetime,difflib,hashlib,io,json,os,platform,re,shutil,signal,subprocess,tarfile,tempfile,time
from pathlib import Path

HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[1]
RUNTIME=ROOT/'experiments/splay_ic_20261104/attempt01/runtime.json'

def stamp():return datetime.datetime.now(datetime.timezone.utc).isoformat()
def load(p):return json.loads(Path(p).read_text(encoding='utf-8'))
def sha(p):
    h=hashlib.sha256()
    with Path(p).open('rb') as f:
        for chunk in iter(lambda:f.read(1048576),b''):h.update(chunk)
    return h.hexdigest()
def boot():return Path('/proc/sys/kernel/random/boot_id').read_text().strip()
def save(p,value):
    p=Path(p);p.parent.mkdir(parents=True,exist_ok=True)
    data=value if isinstance(value,bytes) else (value if isinstance(value,str) else json.dumps(value,ensure_ascii=False,indent=2)+'\n').encode()
    if p.exists():
        assert p.read_bytes()==data, 'write-once conflict '+str(p)
        return
    with p.open('xb') as f:f.write(data);f.flush();os.fsync(f.fileno())
def append(value):
    with (HERE/'runs.jsonl').open('a',encoding='utf-8',newline='\n') as f:
        f.write(json.dumps(value,ensure_ascii=False)+'\n');f.flush();os.fsync(f.fileno())

def capture(command,stage,label,timeout=15,identity=None,cwd=None):
    command=list(map(str,command));begin=time.perf_counter_ns();bid=boot();ts=stamp()
    token=ts+':'+label
    with tempfile.TemporaryFile() as out,tempfile.TemporaryFile() as err:
        p=subprocess.Popen(command,cwd=cwd or ROOT,stdout=out,stderr=err,start_new_session=True)
        append(dict(event='process_start',token=token,timestamp=ts,command=command,stage=stage,label=label,
                    boot_id=bid,parent_pid=os.getpid(),child_pid=p.pid,identity=identity,cwd=str(cwd or ROOT)))
        timed_out=False
        while True:
            pid,status,usage=os.wait4(p.pid,os.WNOHANG)
            if pid:break
            if (time.perf_counter_ns()-begin)/1e9>timeout:
                timed_out=True;os.killpg(p.pid,signal.SIGKILL);pid,status,usage=os.wait4(p.pid,0);break
            time.sleep(.01)
        p.returncode=os.waitstatus_to_exitcode(status);out.seek(0);err.seek(0)
        result=dict(event='process_result',token=token,timestamp=ts,completed_at=stamp(),command=command,stage=stage,label=label,
          boot_id=bid,boot_id_after=boot(),child_pid=p.pid,exit_code=p.returncode,signal=-p.returncode if p.returncode<0 else None,
          timeout=timed_out,stdout=out.read().decode('utf-8',errors='replace'),stderr=err.read().decode('utf-8',errors='replace'),
          outer_start_ns=begin,outer_stop_ns=time.perf_counter_ns(),user_ms=usage.ru_utime*1000,system_ms=usage.ru_stime*1000,
          single_child_peak_rss_kib=usage.ru_maxrss,identity=identity,performance_sample=False,cwd=str(cwd or ROOT))
    result['wall_time_ms']=(result['outer_stop_ns']-begin)/1e6;append(result);return result

def preflight():
    assert not (HERE/'preflight.json').exists(), 'preserve prior preflight; no automatic retry'
    os.sched_setaffinity(0,{2});bid=boot()
    ps=capture(['ps','-eo','pid,ppid,etime,comm,args'],'inventory','prior experiment processes',timeout=10)
    suspicious=[]
    for line in ps['stdout'].splitlines()[1:]:
        if any(x in line for x in ['splay_ic_20261104/attempt01/worker.py','splay_ic_20261104/attempt02/run.py','splay_ic_20261104/attempt02/build.py','splay_ic_20261104/attempt02/finish_build.py']):suspicious.append(line)
        # Any other qjs/d8/compiler/performance runner needs review; do not kill it.
        fields=line.split()
        if len(fields)>3 and (fields[3] in ['qjs','d8','gcc','cc1','cc1plus','g++','make'] or any(x in line for x in ['benchmark.py octane','benchmark.py sunspider'])):suspicious.append(line)
    save(HERE/'prior_process_check.json',dict(timestamp=stamp(),boot_id=bid,suspicious=suspicious,process_output=ps['stdout'],action='wait, never terminate other jobs' if suspicious else 'no known engine/compiler/prior worker active'))
    assert not suspicious,'prior job may still be running; do not proceed'
    env=dict(timestamp=stamp(),boot_id=bid,platform=platform.uname()._asdict(),
        os_release=Path('/etc/os-release').read_text(),cpuinfo=Path('/proc/cpuinfo').read_text(),meminfo=Path('/proc/meminfo').read_text(),
        affinity=sorted(os.sched_getaffinity(0)),temperature='UNKNOWN',power_and_frequency_control='UNKNOWN',background_load_control='UNKNOWN')
    save(HERE/'environment.json',env)
    rt=load(RUNTIME);artifacts={}
    for label in ['A','M']:
        old=rt['artifacts'][label];p=Path(old['path']);actual=dict(path=str(p),expected_sha256=old['sha256'],size=p.stat().st_size,sha256=sha(p),ELF=p.open('rb').read(4)==b'\x7fELF')
        artifacts[label]=actual
        assert actual['ELF'] and actual['sha256']==actual['expected_sha256'],label+' invalid actual artifact'
    source=rt['sources']['M'];source_checks={name:sha(Path(source['path'])/name)==h for name,h in source['files'].items()}
    assert all(source_checks.values()),'seed M source mismatch'
    save(HERE/'seed_identity.json',dict(seed='M',reason='No later implementation has passed a keep gate; U not used',
         A_frozen=True,artifacts=artifacts,source=source,source_checks=source_checks,
         upstream_commit='04be246001599f5995fa2f2d8c91a0f198d3f34c',upstream_version='2026-06-04'))
    # A finite non-benchmark smoke. Separate fresh processes, no candidate ranking,
    # no source edits/builds and no diagnostic controller from the prior attempt.
    js='function smoke(){var s=0,o={bias:3};for(var i=0;i<4096;i++)s+=i+o.bias;return s;}var total=0;for(var k=0;k<10000;k++)total+=smoke();if(total!==83988480000)throw Error("smoke checksum");console.log("SMOKE_PASS:"+total);'
    good=[]
    for rep in range(4):
        for label in (['A','M'] if rep%2==0 else ['M','A']):
            art=artifacts[label]
            r=capture([art['path'],'-e',js],'bounded_smoke',f'{label}.{rep}',timeout=8,
                 identity=dict(binary_sha256=art['sha256'],input_sha256=hashlib.sha256(js.encode()).hexdigest(),repetitions=10000))
            valid=r['exit_code']==0 and not r['stderr'] and r['stdout']=='SMOKE_PASS:83988480000\n' and r['boot_id']==r['boot_id_after']==bid
            good.append(valid);print('BOUNDED_SMOKE',label,rep,valid,r['wall_time_ms'],flush=True)
            if not valid:
                save(HERE/'preflight.json',dict(status='BLOCKED_RUNTIME',valid_smokes=sum(good),completed_smokes=len(good),expected_smokes=8,boot_id=bid))
                raise RuntimeError('saved bounded smoke failure, no candidate changes or ranking')
    save(HERE/'preflight.json',dict(status='PASS_BOUNDED_SMOKE_ONLY',valid_smokes=8,expected_smokes=8,boot_id=bid,
       performance_conditions_established=False,meaning='Allows one serial candidate attempt; not proof a long campaign will survive'))
    source_files={name:(Path(source['path'])/name).read_text() for name in ['read_ic_types.h','read_ic_config.h','read_ic_runtime.inc','read_ic_opcodes.inc','read_ic_prepare.inc']}
    save(HERE/'seed_read_path.json',source_files)
    print('PREFLIGHT_PASS_BOUNDED_ONLY',bid,flush=True)

def prepare():
    assert load(HERE/'preflight.json')['status']=='PASS_BOUNDED_SMOKE_ONLY'
    active=HERE/'active';assert not active.exists(), 'one active source tree only; do not overwrite changes'
    seed=load(HERE/'seed_identity.json');src=Path(seed['source']['path'])
    for name,h in seed['source']['files'].items():assert sha(src/name)==h
    active.mkdir();artifacts=HERE/'artifacts';artifacts.mkdir()
    names=[]
    for p in sorted(src.iterdir()):
        if p.is_file() and (p.suffix in ['.c','.h','.inc','.js','.mjs'] or p.name in ['Makefile','VERSION','LICENSE']):
            shutil.copyfile(p,active/p.name);names.append(p.name)
    with tarfile.open(HERE/'seed_M.tar.gz','w:gz') as out:
        for name in names:out.add(active/name,arcname=name,recursive=False)
    copies={}
    for label in ['A','M']:
        frozen=seed['artifacts'][label];p=artifacts/(label+'.qjs');shutil.copyfile(frozen['path'],p);p.chmod(0o755)
        assert sha(p)==frozen['sha256'];copies[label]=dict(path=str(p),sha256=sha(p),size=p.stat().st_size,source='byte-identical copy of frozen '+frozen['path'])
    save(HERE/'workspace.json',dict(active_source=str(active),active_build=str(active),artifacts=copies,
         seed_archive_sha256=sha(HERE/'seed_M.tar.gz'),source_files={name:sha(active/name) for name in names},
         ownership='Created by this lab; no user pre-existing active tree. Candidate logic edits use apply_patch; snapshots/patches retained separately.'))
    r=capture(['gcc','--version'],'inventory','fixed compiler',timeout=10);assert r['exit_code']==0
    print('ONE_ACTIVE_TREE_PREPARED',len(names),flush=True)

def candidate_status(cid,**fields):
    path=HERE/'candidates.csv'
    with path.open(encoding='utf-8',newline='') as f:
        reader=csv.DictReader(f);columns=reader.fieldnames;rows=list(reader)
    selected=[row for row in rows if row['id']==cid];assert len(selected)==1
    selected[0].update(fields)
    append(dict(event='candidate_status',timestamp=stamp(),id=cid,fields=fields))
    s=io.StringIO(newline='');w=csv.DictWriter(s,columns,lineterminator='\n');w.writeheader();w.writerows(rows)
    tmp=path.with_suffix('.pending');tmp.write_text(s.getvalue(),encoding='utf-8');os.replace(tmp,path)

def candidate_metadata_path(cid):
    matched=HERE/(cid+'.matched.json')
    return matched if matched.exists() else HERE/(cid+'.json')

def reconstructed_sources(version):
    workspace=load(HERE/'workspace.json')
    with tarfile.open(HERE/'seed_M.tar.gz','r:gz') as archive:
        source={n:archive.extractfile(n).read() for n in workspace['source_files']}
    if version=='M':return source
    metadata=load(candidate_metadata_path(version))
    source=reconstructed_sources(metadata['parent'])
    patch=HERE/'patches'/(version+'.patch');assert sha(patch)==metadata['patch_sha256']
    lines=patch.read_text().splitlines(True);i=0
    while i<len(lines):
        assert lines[i].startswith('--- a/');name=lines[i][6:].strip();i+=1
        assert lines[i]=='+++ b/'+name+'\n';i+=1
        original=source[name].decode().splitlines(True);out=[];cursor=0
        while i<len(lines) and lines[i].startswith('@@ '):
            match=re.match(r'@@ -(\d+)(?:,(\d+))? \+(\d+)(?:,(\d+))? @@',lines[i]);assert match
            start=int(match[1])-1 if int(match[1]) else 0
            assert start>=cursor;out+=original[cursor:start];cursor=start;i+=1
            while i<len(lines) and not lines[i].startswith(('@@ ','--- a/')):
                line=lines[i];assert line[0] in ' +-'
                if line[0] in ' -':assert original[cursor]==line[1:];cursor+=1
                if line[0] in ' +':out.append(line[1:])
                i+=1
        out+=original[cursor:];source[name]=''.join(out).encode()
    assert {n:hashlib.sha256(v).hexdigest() for n,v in source.items()}==metadata['source_sha256_before_build'], 'patch reconstruction differs from compiled source'
    return source

def restore(version,current):
    """Mechanical, checked restore within this lab-owned single active tree only."""
    execution_gate();active=HERE/'active';before=load(candidate_metadata_path(current))
    for n,h in before['source_sha256_after_build'].items():assert sha(active/n)==h,'unrecorded edit; do not overwrite '+n
    target=reconstructed_sources(version)
    append(dict(event='active_source_restore',timestamp=stamp(),from_version=current,to_version=version,boot_id=boot(),
                destination=str(active),meaning='mechanical restoration from preserved public seed+patch; no git branch/reset and no ELF launch'))
    for n,data in target.items():
        if (active/n).read_bytes()!=data:(active/n).write_bytes(data)
    print('ACTIVE_SOURCE_RESTORED',version,'from',current,flush=True)

def lifecycle(cid):
    """Narrow extra gate for metadata/layout changes, not run for every candidate."""
    execution_gate();os.sched_setaffinity(0,{2});active=HERE/'active';art=load(candidate_metadata_path(cid))
    for n,h in art['source_sha256_after_build'].items():assert sha(active/n)==h,'objects must belong to requested candidate'
    objects=[active/'.obj'/(n+'.o') for n in ['quickjs','dtoa','libregexp','libunicode','cutils']]
    results=[];prefix=cid+('.matched' if art.get('build_profile')=='matched' else '')
    if shutil.which('gdb'):
        for label,a in [('M',load(HERE/'workspace.json')['artifacts']['M']),(cid,art)]:
            r=capture(['gdb','-nx','-batch','-ex','set auto-load off','-ex','file '+a['path'],
                       '-ex','p sizeof(ReadICSite)','-ex','p sizeof(JSFunctionBytecode)'],
                       'targeted_dwarf_layout',label,timeout=20,identity={'binary_sha256':a['sha256']})
            results.append(dict(name=label+' DWARF sizeof',exit_code=r['exit_code'],stdout=r['stdout'],stderr=r['stderr'],token=r['token']))
    for name in ['read_roundtrip','roundtrip_slots','gc_cycles']:
        source=ROOT/'experiments/read_ic_mic/attempt01/correctness'/(name+'.c')
        out=HERE/'artifacts'/(prefix+'.'+name);assert not out.exists()
        ident=dict(candidate=cid,source=str(source.relative_to(ROOT)),source_sha256=sha(source),objects={p.name:sha(p) for p in objects})
        r=capture(['gcc','-g','-O2','-I'+str(active),source,*objects,'-lm','-lpthread','-ldl','-o',out],'targeted_lifecycle_build',cid+'.'+name,timeout=30,identity=ident)
        assert r['exit_code']==0,r['stderr']
        r=capture([out],'targeted_lifecycle',cid+'.'+name,timeout=20,identity=ident|{'binary_sha256':sha(out)})
        assert r['exit_code']==0 and not r['stderr'] and 'PASS' in r['stdout'],r
        results.append(dict(name=name,stdout=r['stdout'],valid=True,token=r['token']))
    generated=active/(prefix+'.embedded.c');out=HERE/'artifacts'/(prefix+'.embedded')
    r=capture([active/'qjsc','-e','-o',generated,HERE/'checks.js'],'targeted_embedding_compile',cid,timeout=30)
    assert r['exit_code']==0,r['stderr']
    r=capture(['gcc','-g','-O2','-I'+str(active),generated,*objects,active/'.obj/quickjs-libc.o','-lm','-lpthread','-ldl','-o',out],'targeted_embedding_build',cid,timeout=30,
              identity=dict(candidate=cid,generated_c_sha256=sha(generated),input_sha256=sha(HERE/'checks.js')))
    assert r['exit_code']==0,r['stderr']
    r=capture([out],'targeted_embedding',cid,timeout=20,identity=dict(binary_sha256=sha(out),candidate=cid))
    assert r['exit_code']==0 and not r['stderr'] and r['stdout']=='CHECKS_PASS:7020\n',r
    results.append(dict(name='qjsc embedding',valid=True,stdout=r['stdout'],token=r['token']))
    save(HERE/(prefix+'.lifecycle.json'),dict(status='PASS_NARROW_LAYOUT_LIFECYCLE',candidate=cid,results=results,
        sanitizer=False,full_test262=False,meaning='Extra prerequisites for layout candidate; not final full safety gate'))
    candidate_status(cid,correctness='minimal7020 + warmed serialization/loading + 192 OOM budgets + 1800 GC-cycle cases + qjsc embedding; not sanitizer/full test262')
    print('NARROW_LIFECYCLE_PASS',cid,flush=True)

def candidate_build(cid,parent,profile=None):
    assert re.fullmatch(r'c\d{3}',cid) and (parent=='M' or re.fullmatch(r'c\d{3}',parent)), 'explicit preserved parent required'
    assert load(HERE/'preflight.json')['status']=='PASS_BOUNDED_SMOKE_ONLY'
    profile=profile or ('matched' if (HERE/'build_configuration_repair.json').exists() else 'legacy')
    suffix='.matched' if profile=='matched' else ''
    support={}
    if profile=='matched':
        support={'compat/test-closefrom.c':'6cd3fc4b77a33b7d496d9d51f32e7a2d62ab00cd604462fd2a8f70ceba52b813'}
        for n,h in support.items():assert sha(HERE/'active'/n)==h,'required build support missing'
    os.sched_setaffinity(0,{2});workspace=load(HERE/'workspace.json');active=Path(workspace['active_source'])
    assert sha(HERE/'seed_M.tar.gz')==workspace['seed_archive_sha256']
    assert not (HERE/(cid+suffix+'.json')).exists(), 'candidate already built in this profile; preserve evidence'
    patch=[];source_hashes={}
    parent_source=reconstructed_sources(parent)
    for name in workspace['source_files']:
        original=parent_source[name];actual=(active/name).read_bytes();source_hashes[name]=hashlib.sha256(actual).hexdigest()
        if actual!=original:
            patch.extend(difflib.unified_diff(original.decode().splitlines(True),actual.decode().splitlines(True),fromfile='a/'+name,tofile='b/'+name))
    assert patch,'no actual candidate modification'
    patch_path=HERE/'patches'/(cid+'.patch');save(patch_path,''.join(patch));patch_hash=sha(patch_path)
    reset_scores={'sunspider_screen_gm':'','octane_screen_gm':'','recheck':''} if profile=='matched' else {}
    candidate_status(cid,status='BUILDING',patch_sha256=patch_hash,decision='not ranked',build_profile=profile,**reset_scores)
    # -B avoids an unchanged timestamp or stale dependency file selecting old code.
    # Same Makefile/toolchain/flags as M; one compiler job only, no parallel sampler.
    r=capture(['make','-B','-j1','qjs','qjsc'],'build',cid,timeout=300,cwd=active,
              identity=dict(id=cid,parent=parent,patch_sha256=patch_hash,source_sha256=source_hashes,build_profile=profile,build_support_files=support))
    if r['exit_code']!=0 or r['boot_id']!=r['boot_id_after']:
        candidate_status(cid,status='BUILD_FAILED',decision='invalid build; no performance ranking')
        raise RuntimeError('candidate build failed; evidence in runs.jsonl')
    if profile=='matched':
        assert '-DHAVE_CLOSEFROM' in r['stdout'],'compiler auto-detection must match frozen M'
        ref=load(ROOT/'experiments/ic_mechanism_audit/attempt01/raw/build/M_clean_release.json')['stdout']
        compile_lines=lambda text:[line.strip() for line in text.splitlines() if line.startswith('gcc ') and ' -c -o ' in line]
        assert sorted(compile_lines(r['stdout']))==sorted(compile_lines(ref)), 'actual compile commands differ from frozen M reference'
    p=HERE/'artifacts'/(cid+suffix+'.qjs');assert not p.exists()
    built=active/'qjs';assert built.open('rb').read(4)==b'\x7fELF';shutil.copyfile(built,p);p.chmod(0o755)
    with p.open('rb') as f:os.fsync(f.fileno())
    art=dict(id=cid,parent=parent,path=str(p),sha256=sha(p),size=p.stat().st_size,ELF=True,patch_sha256=patch_hash,
         seed_archive_sha256=workspace['seed_archive_sha256'],source_sha256_before_build=source_hashes,
         source_sha256_after_build={name:sha(active/name) for name in workspace['source_files']},build_command=r['command'],boot_id=r['boot_id'],
         build_profile=profile,build_support_files=support,compiler_defines_have_closefrom=('-DHAVE_CLOSEFROM' in r['stdout']))
    for n,h in support.items():assert sha(active/n)==h
    save(HERE/(cid+suffix+'.json'),art)
    smoke=capture([p,'-e','console.log(123)'],'candidate_smoke',cid,timeout=8,identity=art)
    if smoke['exit_code']!=0 or smoke['stdout']!='123\n' or smoke['stderr']:
        candidate_status(cid,status='INVALID',binary_sha256=art['sha256'],correctness='smoke failed',decision='exclude invalid candidate')
        raise RuntimeError('candidate smoke failed')
    outputs=[]
    for label,artifact in [('A',workspace['artifacts']['A']),(cid,art)]:
        r=capture([artifact['path'],HERE/'checks.js'],'minimal_correctness',label,timeout=10,
              identity=dict(binary_sha256=artifact['sha256'],input_sha256=sha(HERE/'checks.js'),candidate=cid))
        outputs.append(r)
    valid=all(r['exit_code']==0 and not r['stderr'] and r['stdout']=='CHECKS_PASS:7020\n' and r['boot_id']==r['boot_id_after'] for r in outputs)
    candidate_status(cid,status='CHECKED_NOT_SCREENED' if valid else 'INVALID',binary_sha256=art['sha256'],
        correctness='minimal 7020 assertions / property scenarios; not full safety gate' if valid else 'minimal correctness failed',decision='await 26-case screen' if valid else 'exclude invalid candidate')
    assert valid,'minimal property regression failed; no ranking'
    print('CANDIDATE_MINIMAL_CHECK_PASS',cid,art['sha256'],flush=True)

def recover():
    """Explicit post-reboot recovery; old STOP and unmatched child stay intact."""
    os.sched_setaffinity(0,{2});bid=boot();seed=load(HERE/'seed_identity.json')
    recovery_path=HERE/('recovery.'+bid+'.json')
    assert not recovery_path.exists(), 'do not overwrite recovery evidence for this boot'
    ps=capture(['ps','-eo','pid,ppid,etime,comm,args'],'recovery_inventory','post-reboot processes')
    suspicious=[]
    for line in ps['stdout'].splitlines()[1:]:
        fields=line.split()
        if len(fields)>3 and fields[3] in ['qjs','d8','gcc','cc1','cc1plus','g++','make']:
            suspicious.append(line)
        if any(x in line for x in ['worker.py','attempt02/run.py','attempt02/build.py','attempt02/finish_build.py']):
            suspicious.append(line)
    assert not suspicious, 'wait for existing work: '+str(suspicious)
    assert bid!=load(HERE/'preflight.json')['boot_id'], 'this recovery expects the user-confirmed reboot'
    for label,art in seed['artifacts'].items():
        assert sha(art['path'])==art['sha256']
        assert sha(HERE/'artifacts'/(label+'.qjs'))==art['sha256']
    js='function smoke(){var s=0,o={bias:3};for(var i=0;i<4096;i++)s+=i+o.bias;return s;}var total=0;for(var k=0;k<10000;k++)total+=smoke();if(total!==83988480000)throw Error("smoke checksum");console.log("SMOKE_PASS:"+total);'
    for rep in range(4):
        for label in (['A','M'] if rep%2==0 else ['M','A']):
            art=seed['artifacts'][label]
            r=capture([art['path'],'-e',js],'recovery_smoke',f'{label}.{rep}',timeout=8,
                      identity={'binary_sha256':art['sha256'],'input_sha256':hashlib.sha256(js.encode()).hexdigest(),'repetitions':10000})
            assert r['exit_code']==0 and not r['stderr'] and r['stdout']=='SMOKE_PASS:83988480000\n' and r['boot_id_after']==bid, 'recovery smoke failed'
            print('RECOVERY_SMOKE',label,rep,r['wall_time_ms'],flush=True)
    save(recovery_path,dict(status='PASS_BOUNDED_SMOKE_ONLY',boot_id=bid,timestamp=stamp(),
        valid_smokes=8,previous_boot=load(HERE/'preflight.json')['boot_id'],process_output=ps['stdout'],
        meminfo=Path('/proc/meminfo').read_text(),compiler=subprocess.check_output(['gcc','--version'],text=True),
        authorization='User explicitly resumed search after Windows reboot; original STOP_SEARCH retained as historical interruption record',
        known_previous_host_pressure='Windows Event2004 repeatedly near commit limit; not proof of each interrupted Linux child cause',
        performance_conditions_established=False))

def execution_gate():
    if (HERE/'STOP_SEARCH').exists():
        p=HERE/('recovery.'+boot()+'.json')
        assert p.exists() and load(p)['status']=='PASS_BOUNDED_SMOKE_ONLY' and load(p)['boot_id']==boot(), 'explicit recovery required; old STOP retained'
    assert not (HERE/'STOP_MATCHED').exists(), 'matched campaign stopped; no automatic retry'
    if (HERE/'STOP_CURRENT').exists():
        p=HERE/'build_configuration_repair_validation.json'
        assert p.exists() and load(p)['status']=='PASS_MATCHED_BUILD_AND_BOUNDED_STABILITY' and load(p)['boot_id']==boot(), 'old campaign stopped; explicit matching repair required'

def repair_build(cid,parent):
    """Explicit engineering recovery only. No performance process is started."""
    assert cid=='c006' and parent=='M','repair current active implementation only'
    assert load(HERE/'health_after_drift.json')['status']=='PASS_BOUNDED_A_STABILITY'
    assert load(HERE/'health_after_drift.json')['boot_id']==boot()
    old=load(HERE/(cid+'.json'));active=HERE/'active'
    for n,h in old['source_sha256_after_build'].items():assert sha(active/n)==h,'unrecorded active edit'
    support=HERE/'build_support/test-closefrom.c'
    assert sha(support)=='908292489b2cd6df40663b754af3f9ad320266bb782454cce0890b891c50cd3f'
    raw=support.read_bytes().replace(b'\n',b'\r\n')
    assert hashlib.sha256(raw).hexdigest()=='6cd3fc4b77a33b7d496d9d51f32e7a2d62ab00cd604462fd2a8f70ceba52b813'
    save(active/'compat/test-closefrom.c',raw)
    save(HERE/'build_configuration_repair.json',dict(status='OFFICIAL_COMPAT_RESTORED',timestamp=stamp(),boot_id=boot(),
         source='build_support/test-closefrom.c LF normalized; mechanically restored original CRLF',
         original_sha256=hashlib.sha256(raw).hexdigest(),LF_sha256=sha(support),
         previous_build_records='preserved; excluded from single-factor performance inference',required_define='HAVE_CLOSEFROM'))
    for i in range(1,7):candidate_status(f'c{i:03d}',status='CONFIG_MISMATCH',build_profile='legacy',decision='old build lacked HAVE_CLOSEFROM; preserve but exclude single-factor performance inference')
    candidate_build(cid,parent,'matched')
    art=load(HERE/(cid+'.matched.json'))
    elf=capture(['readelf','-Ws',art['path']],'matched_build_audit',cid,timeout=10,identity=art)
    assert elf['exit_code']==0 and 'closefrom@GLIBC_2.34' in elf['stdout']
    save(HERE/'build_configuration_repair_validation.json',dict(status='PASS_MATCHED_BUILD_AND_BOUNDED_STABILITY',boot_id=boot(),
         candidate=cid,binary_sha256=art['sha256'],compiler_define='HAVE_CLOSEFROM',closefrom_ELF_import=True,
         bounded_A_drift=load(HERE/'health_after_drift.json')['max_over_min'],old_STOP_CURRENT_retained=True,
         meaning='Allows new matched campaigns only, not proof of indefinite host stability'))

def rebuild_frozen(cid,current):
    """Rebuild an already preserved algorithm in corrected configuration, not a new candidate."""
    execution_gate();assert (HERE/'build_configuration_repair_validation.json').exists()
    old=load(HERE/(cid+'.json'));assert not (HERE/(cid+'.matched.json')).exists()
    restore(cid,current)
    candidate_build(cid,old['parent'],'matched')
    new=load(HERE/(cid+'.matched.json'))
    assert new['source_sha256_before_build']==old['source_sha256_before_build'],'IC algorithm changed during configuration repair'
    assert new['patch_sha256']==old['patch_sha256'],'repair cannot silently change the candidate patch'
    append(dict(event='same_algorithm_rebuilt_matching_configuration',timestamp=stamp(),id=cid,
         old_binary_sha256=old['sha256'],new_binary_sha256=new['sha256'],same_32_algorithm_source_hashes=True,
         old_build_kept=True,old_times_reused=False))

def snapshot_environment():
    execution_gate();os.sched_setaffinity(0,{2})
    save(HERE/'environment.postreboot.json',dict(timestamp=stamp(),boot_id=boot(),platform=platform.uname()._asdict(),
         os_release=Path('/etc/os-release').read_text(),cpuinfo=Path('/proc/cpuinfo').read_text(),meminfo=Path('/proc/meminfo').read_text(),
         compiler=subprocess.check_output(['gcc','--version'],text=True),affinity=sorted(os.sched_getaffinity(0)),load_average=os.getloadavg(),
         temperature='UNKNOWN',power_and_frequency_control='UNKNOWN',host_background_load_control='UNKNOWN',
         WSL_idle_session='PID520 sleeping, started only to retain current VM boot between tool calls; not a workload or sampler',
         previous_host_checkpoint={'local_time':'2026-11-04T20:09:57+08:00','commit_GiB':11.56,'commit_percent_rounded':40,'available_GiB':7.94,'kernel_pools_GiB':1.31},
         flags='Existing Makefile -O2 -g -fwrapv; no new NDEBUG/LTO/PGO/padding'))

if __name__=='__main__':
    parser=argparse.ArgumentParser();parser.add_argument('stage',choices=['preflight','prepare','build','recover','restore','lifecycle','snapshot_environment','repair_build','rebuild_frozen']);parser.add_argument('id',nargs='?');parser.add_argument('parent',nargs='?',default='M');args=parser.parse_args()
    if args.stage not in ['recover','repair_build']:execution_gate()
    if args.stage=='build':candidate_build(args.id,args.parent)
    elif args.stage=='restore':restore(args.id,args.parent)
    elif args.stage=='lifecycle':lifecycle(args.id)
    elif args.stage=='repair_build':repair_build(args.id,args.parent)
    elif args.stage=='rebuild_frozen':rebuild_frozen(args.id,args.parent)
    else:globals()[args.stage]()
