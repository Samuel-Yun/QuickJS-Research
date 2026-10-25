"""Verify supplied references and unchanged runtimes; no downloads or builds."""
import copy
from common import *
BUNDLE=HERE/'materials/V8_IC_Resume_Materials_20261025'
def tree(path):return {p.relative_to(path).as_posix():sha(p) for p in sorted(path.rglob('*'),key=lambda p:p.as_posix()) if p.is_file() and '__pycache__' not in p.parts}
def main():
    if (HERE/'gate.json').exists():
        verify_runtime();assert read(HERE/'gate.json')['status']=='PASS_WITH_OBSERVABILITY_LIMITATION';print('EXISTING_PREPARATION_VERIFIED');return
    save(HERE/'attempt01_identity_before.json',tree(PREVIOUS))
    git=['git','-c','safe.directory='+ROOT.parent.as_posix(),'-C',str(ROOT.parent)]
    gitrows={k:capture(HERE/'raw/capability'/('git_'+k+'.json'),git+args) for k,args in [('HEAD',['rev-parse','HEAD']),('branch',['branch','--show-current']),('worktree',['status','--short'])]}
    assert gitrows['HEAD']['stdout'].strip()=='0bf70fbee135b3b3ebf35040cb9cddc33e543969'
    assert gitrows['branch']['stdout'].strip()=='myx'
    refs=read(BUNDLE/'source_manifest.json');checks=[]
    assert refs['reference_commit']=='37fb84941c9be9f9914ee50b1ad366f06a1bd764' and not refs['artifact_build_commit_proven']
    for item in refs['files']:
        data=(BUNDLE/item['bundle_path']).read_bytes()
        assert len(data)==item['size_bytes'] and hashlib.sha256(data).hexdigest()==item['sha256']
        assert hashlib.sha1(b'blob '+str(len(data)).encode()+b'\0'+data).hexdigest()==item['git_blob_sha1']
        checks.append(dict(path=item['bundle_path'],sha256=item['sha256'],size_bytes=len(data),git_blob_sha1=item['git_blob_sha1']))
    assert len(checks)==6
    save(HERE/'source_verification.json',dict(status='PASS',provided_by='user; not downloaded by this host',archive_sha256=sha(ROOT.parent/'V8_IC_Resume_Materials_20261025.zip'),reference_commit=refs['reference_commit'],artifact_build_commit_proven=False,files=checks))
    m=copy.deepcopy(read(PREVIOUS/'runtime.json'));m.update(cohort='WSL2-'+platform.node()+'-x86_64-useic-20261025-attempt02',started_at=stamp(),campaign_type='use_ic configuration switch comparison',source_bundle_sha256=sha(BUNDLE/'source_manifest.json'))
    save(HERE/'runtime.json',m);save(HERE/'environment.json',environment());verify_runtime()
    source=Path(m['quickjs']['source'])
    assert all(sha(source/p)==h for p,h in m['quickjs']['source_files'].items())
    capture(HERE/'raw/capability/environment.json',['sh','-c','uname -a; cat /etc/os-release; lscpu; free -b; uptime; for p in /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq; do if test -r "$p"; then head -c 200 "$p"; fi; done; true'])
    identity=dict(quickjs_sha256=sha(m['quickjs']['binary']['path']),v8_sha256=sha(m['v8']['binary']['path']),quickjs_source_files_checked=77,dependencies=[dict(path=a['path'],sha256=sha(a['path'])) for a in m['v8']['dependencies']],timestamp=stamp())
    save(HERE/'identity_before.json',identity)
    prefixes_=prefixes();d=m['v8']['binary']['path']
    for label,cmd in [('version',[d,'--version']),('help',[d,'--help']),('default_flags',[d,'--print-flag-values'])]:
        r=capture(HERE/'raw/capability'/(label+'.json'),cmd);assert r['exit_code']==0 and not r['stderr']
    probe=HERE/'probes/basic.js';save(probe,(PREVIOUS/'probes/basic.js').read_bytes())
    vals={}
    for c in CONDITIONS[1:]:
        r=capture(HERE/'raw/capability'/(c+'_flags.json'),prefixes_[c]+['--print-flag-values',str(probe)])
        assert r['exit_code']==0 and not r['stderr'] and 'PROBE_PASS 40000' in r['stdout']
        f=vals[c]=parse_flags(r['stdout']);assert f['jitless'] and not f['lazy']
        for k in ['sparkplug','maglev','turbofan','turboshaft','regexp-tier-up']:assert f[k] is False
        assert f['regexp-interpret-all'] is True
    differences=[k for k in vals[CONDITIONS[1]] if vals[CONDITIONS[1]][k]!=vals[CONDITIONS[2]][k]]
    assert differences==['use-ic'] and vals[CONDITIONS[1]]['use-ic'] and not vals[CONDITIONS[2]]['use-ic']
    default=parse_flags(read(HERE/'raw/capability/default_flags.json')['stdout'])
    csvout(HERE/'effective_flags.csv',[dict(flag=k,default=default.get(k),ON=vals[CONDITIONS[1]][k],OFF=vals[CONDITIONS[2]][k]) for k in sorted(vals[CONDITIONS[1]])])
    original=read(PREVIOUS/'inputs.json');origins=[]
    for name,expected in original['micro_files'].items():
        src=PREVIOUS/'cases'/name;how,b=restore(src.read_bytes(),expected);new=lf(b)
        save(HERE/'cases'/name,new);origins.append(dict(source='attempt01/cases/'+name,original_byte_sha256=expected,as_found_sha256=sha(src),restore=how,LF_sha256=hashlib.sha256(new).hexdigest(),frozen='cases/'+name))
    octane={}
    for name,expected in original['octane_files'].items():
        src=ROOT/'benchmarks/octane/upstream'/name;how,b=restore(src.read_bytes(),expected);octane[name]=b;new=lf(b)
        save(HERE/'cases/octane'/name,new);origins.append(dict(source='benchmarks/octane/upstream/'+name,original_byte_sha256=expected,as_found_sha256=sha(src),restore=how,LF_sha256=hashlib.sha256(new).hexdigest(),frozen='cases/octane/'+name))
    oldline=[]
    # Recover the original mixed-newline script, without changing any historical file/hash.
    import ast
    module=ast.parse((PREVIOUS/'correctness.py').read_text(encoding='utf-8'))
    adapter=next(ast.literal_eval(n.value) for n in module.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id=='ADAPTER' for t in n.targets)).encode()
    oldrecords=read(PREVIOUS/'correctness/results.json')
    for n in [1,2]:
        p=PREVIOUS/'probes/correctness'/f'Richards.N{n}.js';published=lf(p.read_bytes())
        lead=adapter+lf(octane['base.js'])+b'\n;\n'+lf(octane['richards.js']);assert published.startswith(lead)
        restored=adapter+octane['base.js']+b'\n;\n'+octane['richards.js']+published[len(lead):]
        expected=next(r['script_sha256'] for r in oldrecords if r['case']=='Richards' and r['N']==n)
        assert hashlib.sha256(restored).hexdigest()==expected
        oldline.append(dict(script=f'Richards.N{n}.js',historical_raw_sha256=expected,as_found_sha256=sha(p),LF_sha256=hashlib.sha256(published).hexdigest(),restored_mixed_newline_sha256=hashlib.sha256(restored).hexdigest(),verified=True))
    save(HERE/'historical_newline_audit.json',dict(status='PASS',old_files_modified=False,scripts=oldline,rule='adapter/driver LF; base.js and richards.js restored to original bytes by published SHA; separator LF',statistics_sort_key=['case index','condition index','N integer','rep integer','order integer']))
    runtext=lf(octane['richards.js']).decode();body=runtext[runtext.index('function runRichards()'):runtext.index('\nvar COUNT =')];assert not re.search(r'\bthis\b',body)
    save(HERE/'inputs.json',dict(octane_revision=original['octane_revision'],files=origins,Richards_assertions=original['Richards_original_assertions'],captured_Run_this_safe=True,Run_this_reason='runRichards has no entry this; Setup/TearDown retain test receiver; inner method receivers are untouched',new_scripts_newlines='LF; byte identity frozen per script'))
    prev=read(PREVIOUS/'summary/audit.json');assert prev['status']=='BLOCKED_IC_INTERVENTION' and prev['selected_ON_transition_observed']
    transitions=PREVIOUS/'summary/selected_site_transitions.csv';onraw=PREVIOUS/'raw/capability/V8_IC_ON_debug.1.json';log=PREVIOUS/'raw/ic/V8_IC_ON.debug.log'
    dump=read(onraw)['stdout'];address=re.search(r'(0x[0-9a-f]+)\s+@\s*0\s*:\s*33 03 00 00\s+GetNamedProperty',dump).group(1)
    events=[row for row in csv.reader(log.open(encoding='utf-8',newline='')) if row and row[0]=='LoadIC' and int(row[1],16)==int(address,16)]
    assert len(events)==1 and events[0][5:7]==['0','1'] and events[0][8]=='x'
    save(HERE/'on_evidence_reused.json',dict(source_attempt='attempt01',same_binary_sha256=m['v8']['binary']['sha256'],bytecode_PC=0,feedback_slot=0,property='x',transition=events[0],files={p.relative_to(PREVIOUS).as_posix():sha(p) for p in [transitions,onraw,log]},hit_rate=None))
    protocol=read(PREVIOUS/'protocol.json');protocol.update(formal_gate='protocol_amendment.md: configuration switch; no direct OFF snapshot requirement',formal_gate_current='PASS_WITH_OBSERVABILITY_LIMITATION',note='Inherited rules, amended gate before any pilot; no historical time reused',initial_N=dict(Richards=512,own_integer=32768,numeric_control=32768))
    save(HERE/'protocol.json',protocol)
    save(HERE/'gate.json',dict(status='PASS_WITH_OBSERVABILITY_LIMITATION',timestamp=stamp(),same_artifacts_verified=True,reference_sources_verified=True,artifact_source_commit=None,strict_jitless_effective=True,mode_reference_source_consistent=True,only_effective_flag_difference=differences,selected_ON_transition_observed=True,selected_OFF_no_cache_state_verified=None,OFF_no_log_is_proof=False,formal_authorized=True,all_caches_removed=False,protocol_amendment_sha256=sha(HERE/'protocol_amendment.md'),source_notes_sha256=sha(HERE/'source_notes.md')))
    print('PREPARATION_PASS_WITH_OBSERVABILITY_LIMITATION; OFF snapshot UNKNOWN; no performance samples',flush=True)
if __name__=='__main__':main()
