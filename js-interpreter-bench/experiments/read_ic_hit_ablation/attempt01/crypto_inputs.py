"""Identity/correctness only: pre-load deterministic inputs, never performance."""
import re
from common import *
SEEDS=[1,305419896,3735928559];N=2
def script(seed,bench,observe):
    pre='''
var ciSeed=__SEED__>>>0,ciState=ciSeed,ciWords=[],ciDateCalls=0,ciNowCalls=0,ciPhase='loading';
Math.random=function(){var s=ciState;s^=s<<13;s^=s>>>17;s^=s<<5;ciState=s>>>0;ciWords.push(ciState);return ciState/4294967296;};
var ciNativeDate=Date;
function ciDate(){ciDateCalls++;var a=Array.prototype.slice.call(arguments);if(new.target)return Reflect.construct(ciNativeDate,a,new.target);return ciNativeDate.apply(null,a);}
ciDate.prototype=ciNativeDate.prototype;ciDate.parse=ciNativeDate.parse;ciDate.UTC=ciNativeDate.UTC;
ciDate.now=function(){ciNowCalls++;return ciNativeDate.now();};Date=ciDate;
'''.replace('__SEED__',str(seed))
    hooks='''
var ciBytes=[],ciPads=[],ciSeeds=[],ciInitKeys=[];
var ciOldByte=rng_get_byte;rng_get_byte=function(){var r=ciOldByte();ciBytes.push({phase:ciPhase,value:r});return r;};
var ciOldPad=pkcs1pad2;pkcs1pad2=function(s,n){var r=ciOldPad(s,n);ciPads.push({phase:ciPhase,hex:r.toString(16).padStart(n*2,'0')});return r;};
var ciOldSeed=rng_seed_int;rng_seed_int=function(x){ciSeeds.push({phase:ciPhase,value:x});return ciOldSeed(x);};
var ciOldInit=Arcfour.prototype.init;Arcfour.prototype.init=function(key){ciInitKeys.push({phase:ciPhase,key:key.slice()});return ciOldInit.call(this,key);};
''' if observe else 'var ciBytes=null,ciPads=null,ciSeeds=null,ciInitKeys=null;'
    driver='''
var ciBench=__BENCH__,ciN=__N__,ciSnapshots=[],ciCiphertexts=[],ciPlaintexts=[];
function ciSnapshot(phase){ciSnapshots.push({phase:phase,math_state:ciState,math_calls:ciWords.length,pool:rng_pool.slice(),pool_pointer:rng_pptr,rc4:rng_state?{i:rng_state.i,j:rng_state.j,S:rng_state.S.slice()}:null});}
function ciVerify(){var k=new RSAKey();k.setPublic(nValue,eValue);k.setPrivateEx(nValue,eValue,dValue,pValue,qValue,dmp1Value,dmq1Value,coeffValue);var s=k.decrypt(encrypted);if(s!==TEXT)throw Error('plaintext');ciPlaintexts.push(s);}
ciSnapshot('after_loading');ciPhase='Setup';
var ciTest=BenchmarkSuite.suites[0].benchmarks[ciBench==='Encrypt'?0:1];ciTest.Setup();
if(ciBench==='Decrypt'){ciPhase='Setup_encrypt';encrypt();ciCiphertexts.push(encrypted);ciVerify();}
ciSnapshot('after_Setup');
for(var ciRun=0;ciRun<ciN;ciRun++){ciPhase='Run'+ciRun;ciTest.run();ciCiphertexts.push(encrypted);if(ciBench==='Encrypt')decrypt();ciVerify();ciSnapshot('after_Run'+ciRun);}
ciTest.TearDown();
if(ciDateCalls!==0||ciNowCalls!==0)throw Error('CRYPTO_INPUT_LIMITATION unexpected Date entry');
var ciCore={protocol:'BENCH_ONLY_XORSHIFT32_PRELOAD_V1',seed:ciSeed,N:ciN,benchmark:ciBench,math_words:ciWords,snapshots:ciSnapshots,ciphertexts:ciCiphertexts,plaintexts:ciPlaintexts,TEXT:TEXT,key:{n:nValue,e:eValue,d:dValue,p:pValue,q:qValue,dmp1:dmp1Value,dmq1:dmq1Value,coeff:coeffValue},date_calls:ciDateCalls,date_now_calls:ciNowCalls,correctness:'PASS'};
console.log('CRYPTO_IDENTITY:'+JSON.stringify({core:ciCore,observations:{bytes:ciBytes,padded_messages:ciPads,seed_ints:ciSeeds,init_keys:ciInitKeys}}));
'''.replace('__BENCH__',json.dumps(bench)).replace('__N__',str(N))
    pieces=[pre.encode(),(ROOT/'benchmarks/octane/upstream/base.js').read_bytes(),(ROOT/'benchmarks/octane/upstream/crypto.js').read_bytes(),hooks.encode(),driver.encode()]
    path=HERE/'generated/crypto'/f'seed{seed}.{bench}.{"observed" if observe else "plain"}.js';save(path,b'\n;\n'.join(pieces));return path
def main():
    assert read(HERE/'analysis/formal_audit.json')['status']=='PASS';m=verify_runtime();records=[]
    source=ROOT/'benchmarks/octane/upstream/crypto.js';base=ROOT/'benchmarks/octane/upstream/base.js'
    save(HERE/'crypto/protocol.json',dict(protocol='BENCH_ONLY_XORSHIFT32_PRELOAD_V1',seeds=SEEDS,N=N,formal_performance=False,
      setup='prelude before base.js and crypto.js, NOT ResetRNG after loading',source_sha256=sha(source),base_sha256=sha(base),
      time='crypto rng_seed_time mixes fixed literal1122926989487; Date/Date.now calls observed and must be0',
      hooks='diagnostic wrappers only around original byte/pad/seed/RC4-init; plain script retains original crypto functions',
      warning='deterministic input protocol for benchmark only, NEVER secure cryptography; do not rewrite historical raw'))
    source_lines=source.read_text().splitlines();save(HERE/'crypto/source_random_entries.json',[dict(line=i+1,text=s) for i,s in enumerate(source_lines) if re.search(r'Math\.random|rng_seed_time|rng_seed_int|new SecureRandom|nextBytes|Date|getRandomValues|navigator|window\.',s)])
    for seed in SEEDS:
        for bench in ['Encrypt','Decrypt']:
            for observe in [False,True]:
                path=script(seed,bench,observe)
                for v in VERSIONS:
                    record=HERE/'raw/crypto'/f'seed{seed}.{bench}.{int(observe)}.{v}.json'
                    if record.exists():records.append(read(record));continue
                    start=time.perf_counter_ns();p=subprocess.run([m['artifacts'][v]['path'],str(path)],env=mode_env(v),capture_output=True,text=True,timeout=300);stop=time.perf_counter_ns()
                    matches=re.findall(r'^CRYPTO_IDENTITY:(.*)$',p.stdout,re.M);assert p.returncode==0 and not p.stderr and len(matches)==1,(v,seed,bench,p.stdout,p.stderr)
                    data=json.loads(matches[0]);h=digest(json.dumps(data['core'],sort_keys=True,separators=(',',':')).encode())
                    r=dict(seed=seed,N=N,benchmark=bench,observed=observe,variant=v,command=[m['artifacts'][v]['path'],str(path)],mode_value=config(v),script_sha256=sha(path),binary_sha256=m['artifacts'][v]['sha256'],
                      exit_code=p.returncode,stdout=p.stdout,stderr=p.stderr,outer_start_ns=start,outer_stop_ns=stop,timestamp=stamp(),valid=True,performance_sample=False,core_sha256=h,data=data)
                    save(record,r);records.append(r);print('CRYPTO_IDENTITY',seed,bench,observe,v,'PASS',flush=True)
    results=[]
    for seed in SEEDS:
        for bench in ['Encrypt','Decrypt']:
            rr=[r for r in records if r['seed']==seed and r['benchmark']==bench];assert len(rr)==8 and len({r['core_sha256'] for r in rr})==1
            obs=[r for r in rr if r['observed']];assert len({digest(json.dumps(r['data']['observations'],sort_keys=True).encode()) for r in obs})==1
            d=obs[0]['data'];assert len(d['core']['math_words'])==128 and all(s['math_calls']==128 for s in d['core']['snapshots'])
            assert d['observations']['bytes'] and len(d['observations']['init_keys'])==1 and d['observations']['padded_messages']
            assert all(x['value']==1122926989487 for x in d['observations']['seed_ints'])
            results.append(dict(seed=seed,benchmark=bench,N=N,core_sha256=rr[0]['core_sha256'],all_four_conditions_and_plain_observed_match=True,
              loading_math_draws=128,observed_rng_bytes=len(d['observations']['bytes']),padding_messages=len(d['observations']['padded_messages']),ciphertexts_sha256=digest(json.dumps(d['core']['ciphertexts']).encode())))
    for bench in ['Encrypt','Decrypt']:
        rr=[r for r in results if r['benchmark']==bench];assert len({r['ciphertexts_sha256'] for r in rr})==3
    csvout(HERE/'crypto/identities.csv',results)
    save(HERE/'crypto/audit.json',dict(status='PASS_BOUNDED_INPUT_IDENTITY',actual=len(records),expected=48,valid=sum(r['valid'] for r in records),same_seed_four_modes_and_plain_observed_match=True,different_seeds_change_inputs=True,
      scope='frozen source and keys, specified seeds, N2; not arbitrary N/other engines or security RNG',included_in_formal=False,historical_limitation_not_rewritten=True))
    print('CRYPTO_IDENTITY_48_PASS',flush=True)
if __name__=='__main__':main()
