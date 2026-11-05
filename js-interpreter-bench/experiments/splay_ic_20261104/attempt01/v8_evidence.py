"""Bounded official-binary observations, explicitly not a hit-rate profiler."""
from common import *
import gzip,shutil
import diagnose
def main():
    pin();rt=runtime();binary=rt['artifacts']['V8_ON'];assert sha(binary['path'])==binary['sha256']
    help=read(HERE/'raw/preflight/d8_help.json')['stdout']
    needed=['print-bytecode','print-bytecode-filter','log-ic','log-maps','log-maps-details','logfile','logfile-per-isolate','allow-natives-syntax']
    assert all('  --'+f+' ' in help for f in needed)
    source=ROOT/'experiments/v8_qjs_ic_source_compare/attempt01'
    src_manifest=read(source/'source_manifest.json');checks=[]
    for x in src_manifest['V8_files']:
        p=source/x['path'];checks.append(dict(path=str(p.relative_to(ROOT)),sha256=sha(p),expected=x['sha256'],valid=sha(p)==x['sha256']))
    assert all(x['valid'] for x in checks)
    for n in [1,2]:
        p=diagnose.script('Splay.Splay',n);script=HERE/'v8'/f'Splay.N{n}.js'
        # Stage snapshots are outside Run and make no claim about each access.
        hook='function __spStage(n){print("SP_PHASE:"+n);if(n===2||n===3){%DebugPrint(SplayTree.prototype.splay_);}}\n'
        save(script,hook.encode()+p.read_bytes());log=STORE/f'v8_splay_N{n}.log'
        cmd=[binary['path'],*rt['v8_flags'],'--allow-natives-syntax','--print-bytecode','--print-bytecode-filter=*splay*',
          '--log-ic','--log-maps','--log-maps-details','--no-logfile-per-isolate','--logfile='+str(log),str(script)]
        r=capture(cmd,'V8 Splay diagnostic N'+str(n),timeout=300)
        r.update(binary_sha256=binary['sha256'],script_sha256=sha(script),performance_sample=False)
        save(HERE/'v8'/f'N{n}.process.json',r);assert r['exit_code']==0 and 'OCTANE_IC_RESULT:' in r['stdout']
        save(HERE/'v8'/f'N{n}.bytecode_feedback.txt',r['stdout'])
        data=log.read_bytes();save(HERE/'v8'/f'N{n}.log.gz',gzip.compress(data,mtime=0))
        lines=[x for x in data.decode(errors='replace').splitlines() if x.startswith('LoadIC,') and any(','+atom+',' in x for atom in ['key','left','right'])]
        save(HERE/'v8'/f'N{n}.key_left_right_transitions.txt','\n'.join(lines)+'\n')
        save(HERE/'v8'/f'N{n}.archive.json',dict(raw_sha256=hashlib.sha256(data).hexdigest(),compressed_sha256=sha(HERE/'v8'/f'N{n}.log.gz'),events=len(lines),event_scope='whole diagnostic process, includes Setup; not access counts'))
    save(HERE/'v8/status.json',dict(status='OBSERVED_WITH_LIMITATIONS',reference_commit=src_manifest['V8_reference_commit'],actual_binary_source_commit=None,
      reference_checks=checks,Run_successful_fast_path_count=None,Run_runtime_fallback_count=None,total_target_queries=None,
      observations='actual target bytecode and before/after Run feedback snapshots; whole-process IC/Map logs, no hit-rate inference',
      reference_build=dict(status='BLOCKED_DEPENDENCIES',full_reference_checkout=False,gn=shutil.which('gn'),clang=shutil.which('clang'),
        reason='only verified reference source files, no full V8 checkout/GN/Clang; cannot add complete generated-handler counters to official release',
        attempted_rebuild=False,budget_limit_hours=3,official_binary_not_replaced=True,no_failed_download_retry=True)))
    print('V8_EVIDENCE_SAVED_NO_HIT_RATE_CLAIM',flush=True)
if __name__=='__main__':main()
