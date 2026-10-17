"""Two bounded native-PC diagnostics per case/engine, separate from 240 samples."""
import json
import os
import re
import run as c
from richards import qjs_sample_parse,v8_parse
b=c.b;HERE=c.HERE

def main():
    b.verify();lib=HERE/'probes/pc_sampler.so'
    assert b.sha(lib)==b.read(HERE/'source_evidence/sampler_identity.json')['library_sha256']
    rows=[]
    for case in b.config():
        n=b.read(HERE/'calibration'/f'{case}.json')['N']
        original=b.script(case,n,'formal')
        text=original.read_text()
        assert text.count('var __wbElapsed = benchNow() - __wbStart;')==1
        text=text.replace('var __wbElapsed = benchNow() - __wbStart;',
            'var __cfDiagnosticStop = benchNow(); var __wbElapsed = __cfDiagnosticStop - __wbStart;')
        text=text.replace('N:__wbN,last:', 'start_ms:__wbStart,stop_ms:__cfDiagnosticStop,N:__wbN,last:')
        p=HERE/'probes'/f'{case}_DIAGNOSTIC_PC.js';b.save(p,text)
        for rep in (1,2):
            qcsv=HERE/'diagnostics'/f'{case}.quickjs.rep{rep}.samples.csv'
            qcsv.parent.mkdir(exist_ok=True)
            env=dict(os.environ,LD_PRELOAD=str(lib),CF_SAMPLE_PATH=str(qcsv))
            r=b.capture(HERE/'raw/diagnostics'/f'simple_profile_{case}_quickjs_{rep}.json',b.command('quickjs',p),env=env)
            assert r['exit_code']==0
            payload=json.loads(re.search(r'^WB_RESULT (.+)$',r['stdout'],re.M)[1])
            assert payload['N']==n and payload['last']==8398848
            result=qjs_sample_parse(r,qcsv,payload)
            b.save(HERE/'diagnostics'/f'{case}.quickjs.rep{rep}.summary.json',result)
            rows.extend(dict(case=case,engine='quickjs',rep=rep,scope='internal top PC C/inline function',name=fn,samples=count,total=result['timed_samples']) for fn,count in result['functions'].items())
            log=HERE/'diagnostics'/f'{case}.v8.rep{rep}.log'
            r=b.capture(HERE/'raw/diagnostics'/f'simple_profile_{case}_v8_{rep}.json',b.command('v8',p,('--prof','--no-logfile-per-isolate','--logfile='+str(log))))
            assert r['exit_code']==0 and '"last":8398848' in r['stdout']
            result=v8_parse(log);b.save(HERE/'diagnostics'/f'{case}.v8.rep{rep}.summary.json',result)
            rows.extend(dict(case=case,engine='v8',rep=rep,scope='whole process top PC handler/builtin',name=fn,samples=count,total=result['ticks']) for fn,count in result['top_PC_counts'].items())
            print('SIMPLE_PROFILE',case,rep,flush=True)
    b.export(HERE/'diagnostics/simple_top_pc.csv',rows)
    b.verify()

if __name__=='__main__':main()
