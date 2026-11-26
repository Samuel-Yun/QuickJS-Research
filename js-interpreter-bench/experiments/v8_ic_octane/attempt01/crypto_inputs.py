"""Finite seed/N identity diagnostics; stream real values into canonical SHA256."""
import collections,threading
from common import *
PRE='''
var __cioWords=[],__cioDates=0,__cioDateNow=0,__cioRandom=Math.random;
Math.random=function(){var value=__cioRandom();__cioWords.push(value*4294967296);return value;};
var __cioNativeDate=Date;
function __cioDate(){__cioDates++;var a=Array.prototype.slice.call(arguments);if(new.target)return Reflect.construct(__cioNativeDate,a,new.target);return __cioNativeDate.apply(null,a);}
__cioDate.prototype=__cioNativeDate.prototype;__cioDate.parse=__cioNativeDate.parse;__cioDate.UTC=__cioNativeDate.UTC;
__cioDate.now=function(){__cioDateNow++;return __cioNativeDate.now();};Date=__cioDate;
'''
DRIVER='''
;(function(){
  var count=__N__,phase='loading';
  function emit(type,data){console.log('CRYPTO_EVENT:'+JSON.stringify({type:type,data:data}));}
  function snapshot(label){return {phase:label,math_state:__icoRngState,math_words:__cioWords,pool:rng_pool.slice(),pool_pointer:rng_pptr,rc4:rng_state?{i:rng_state.i,j:rng_state.j,S:rng_state.S.slice()}:null};}
  var key=new RSAKey();key.setPublic(nValue,eValue);key.setPrivateEx(nValue,eValue,dValue,pValue,qValue,dmp1Value,dmq1Value,coeffValue);
  __HOOKS__
  emit('core',{phase:'keys',protocol:'BENCH_ONLY_XORSHIFT32_PRELOAD_V1',seed:305419896,N:count,benchmark:__BENCH__,TEXT:TEXT,key:{n:nValue,e:eValue,d:dValue,p:pValue,q:qValue,dmp1:dmp1Value,dmq1:dmq1Value,coeff:coeffValue}});
  emit('core',snapshot('after_loading'));
  var test=BenchmarkSuite.suites[0].benchmarks[__INDEX__],run=test.run;
  phase='Setup';test.Setup();
  if(__INDEX__===1){phase='Setup_encrypt';encrypt();}
  emit('core',snapshot('after_Setup'));
  for(var iteration=0;iteration<count;iteration++){
    phase='Run'+iteration;run();
    if(__INDEX__===0)decrypt();
    var plaintext=key.decrypt(encrypted);if(plaintext!==TEXT)throw Error('plaintext mismatch');
    emit('core',{phase:'Run'+iteration,ciphertext:encrypted,plaintext:plaintext,state:snapshot('after_Run'+iteration)});
  }
  test.TearDown();
  if(__cioDates!==0||__cioDateNow!==0||__cioWords.length!==128)throw Error('random/time input boundary changed');
  emit('core',{phase:'finished',correctness:'PASS',N:count,final_ciphertext:encrypted,math_calls:__cioWords.length,date_calls:__cioDates,date_now_calls:__cioDateNow});
})();
'''
HOOKS='''
var oldByte=rng_get_byte;rng_get_byte=function(){var v=oldByte();emit('byte',{phase:phase,value:v});return v;};
var oldPad=pkcs1pad2;pkcs1pad2=function(s,n){var v=oldPad(s,n);emit('padding',{phase:phase,hex:v.toString(16).padStart(n*2,'0')});return v;};
var oldSeed=rng_seed_int;rng_seed_int=function(x){emit('seed',{phase:phase,value:x});return oldSeed(x);};
var oldInit=Arcfour.prototype.init;Arcfour.prototype.init=function(k){emit('init',{phase:phase,key:k.slice()});return oldInit.call(this,k);};
'''
def script(case,n,observed):
    bench=case.split('.')[1];index=0 if bench=='Encrypt' else 1
    driver=DRIVER.replace('__N__',str(n)).replace('__BENCH__',json.dumps(bench)).replace('__INDEX__',str(index)).replace('__HOOKS__',HOOKS if observed else '// Original crypto functions: no observation hooks.')
    parts=[(HERE/'inputs/adapter.js').read_bytes(),(HERE/'inputs/crypto_preload.js').read_bytes(),PRE.encode()]+[(HERE/'inputs/octane'/f).read_bytes() for f in ['base.js','crypto.js']]+[driver.encode()]
    p=HERE/'scripts/crypto_identity'/f'{case}.N{n}.{"observed" if observed else "plain"}.js';save(p,b'\n;\n'.join(parts));return p
def invoke(case,n,c,observed):
    path=HERE/'raw/crypto'/f'{case}.N{n}.{c}.{"observed" if observed else "plain"}.json'
    if path.exists():return read(path)
    p=script(case,n,observed);command=prefixes()[c]+[str(p)]
    start=time.perf_counter_ns();r=dict(case=case,N=n,condition=c,observed=observed,seed=CRYPTO_SEED,protocol='BENCH_ONLY_XORSHIFT32_PRELOAD_V1',performance_sample=False,script_relative=p.relative_to(HERE).as_posix(),script_sha256=sha(p),command=command,timestamp=stamp(),boot_id=boot(),valid=False)
    hashes={};counts=collections.Counter();first=collections.defaultdict(list);last=collections.defaultdict(list);full=hashlib.sha256();raw_bytes=0;errors=[];finished=None;stderr=[]
    process=subprocess.Popen(command,cwd=ROOT,env=environment(),stdout=subprocess.PIPE,stderr=subprocess.PIPE,text=True)
    timedout=threading.Event()
    def kill():timedout.set();process.kill()
    timer=threading.Timer(TIMEOUT,kill);timer.start()
    def drain():stderr.append(process.stderr.read())
    thread=threading.Thread(target=drain);thread.start()
    for line in process.stdout:
        encoded=line.encode('utf-8');full.update(encoded);raw_bytes+=len(encoded)
        try:
            assert line.startswith('CRYPTO_EVENT:')
            event=json.loads(line[len('CRYPTO_EVENT:'):]);kind=event['type'];data=event['data']
            canonical=json.dumps(data,sort_keys=True,separators=(',',':'),ensure_ascii=False).encode('utf-8')+b'\n'
            hashes.setdefault(kind,hashlib.sha256()).update(canonical);counts[kind]+=1
            if len(first[kind])<3:first[kind].append(data)
            last[kind].append(data)
            if len(last[kind])>3:last[kind].pop(0)
            if kind=='core' and data.get('phase')=='finished':finished=data
        except (AssertionError,KeyError,ValueError) as e:errors.append(str(e)+line[:200])
    process.wait();timer.cancel();thread.join();stop=time.perf_counter_ns()
    r.update(exit_code=process.returncode,stderr=''.join(stderr),timeout=timedout.is_set(),outer_start_ns=start,outer_stop_ns=stop,outer_wall_ns=stop-start,
        stream_raw_stdout_sha256=full.hexdigest(),stream_stdout_bytes=raw_bytes,canonical_stream_SHA256={k:h.hexdigest() for k,h in hashes.items()},event_counts=dict(counts),first_actual_events=dict(first),last_actual_events=dict(last),finished=finished,stream_errors=errors,
        stdout_storage='streamed canonical SHA256 per event kind plus first/last3 real events; no huge full object trajectory retained')
    r['valid']=r['exit_code']==0 and not r['stderr'] and not r['timeout'] and not errors and bool(finished and finished.get('correctness')=='PASS') and counts['core']==n+4
    if observed:r['valid']=r['valid'] and counts['padding']==(n if case=='Crypto.Encrypt' else 1) and counts['init']==1 and counts['byte']>0
    save(path,r);print('CRYPTO_INPUT',case,'N='+str(n),c,'observed' if observed else 'plain','PASS' if r['valid'] else 'FAIL',flush=True);return r
def validate(case,n):
    dest=HERE/'crypto'/f'{case}.N{n}.json'
    if dest.exists():return read(dest)['status']=='PASS_BOUNDED_INPUT_IDENTITY'
    rows=[invoke(case,n,c,obs) for obs in [False,True] for c in CONDITIONS]
    good=all(r['valid'] for r in rows) and len({r['canonical_stream_SHA256'].get('core') for r in rows})==1
    for kind in ['byte','padding','seed','init']:
        good=good and len({r['canonical_stream_SHA256'].get(kind) for r in rows if r['observed']})==1
    save(dest,dict(status='PASS_BOUNDED_INPUT_IDENTITY' if good else 'BLOCKED_INPUT_IDENTITY',case=case,N=n,seed=CRYPTO_SEED,scope='only current frozen source/keys/seed/N/three conditions; not security RNG',processes=len(rows),core_sha256=rows[0]['canonical_stream_SHA256'].get('core'),observed_event_counts=[r['event_counts'] for r in rows if r['observed']],final_ciphertext=rows[0]['finished'].get('final_ciphertext') if rows[0]['finished'] else None,plain_observed_and_conditions_match=bool(good)))
    if not good:block(case,'input_N'+str(n),'actual core/byte/padding/RC4 identity failed','BLOCKED_INPUT_IDENTITY')
    return bool(good)
