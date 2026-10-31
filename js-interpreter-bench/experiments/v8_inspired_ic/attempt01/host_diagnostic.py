"""After formal collection only: observe actual zlib read() calls, not timings."""
from common import *
from run import script
def main():
    assert (HERE/'collection_end.json').exists() or (HERE/'campaign_stop.json').exists()
    original=script('zlib.zlib',1,'correctness').read_bytes()
    wrapper=b'''var __eReadEvents=[];var __eOriginalRead=globalThis.read;
globalThis.read=function(path,mode){var result=__eOriginalRead.apply(this,arguments);if(__eReadEvents.length<16)__eReadEvents.push({path:String(path),mode:mode===undefined?null:mode,type:Object.prototype.toString.call(result),bytes:result&&result.byteLength});return result;};
'''
    p=HERE/'scripts/zlib_host_diagnostic.js';save(p,wrapper+original+b'\nconsole.log("HOST_READ_DIAG:"+JSON.stringify(__eReadEvents));\n')
    rows=[]
    for c,pref in prefixes().items():
        cmd=pref+(['--std','-I',str(HERE/'inputs/zlib_read.js')] if c!='V8_ON' else [])+[str(p)]
        r=capture(cmd,'zlib host read diagnostic '+c);assert r['exit_code']==0 and not r['stderr']
        events=json.loads(re.findall(r'^HOST_READ_DIAG:(.*)$',r['stdout'],re.M)[0]);assert 'OCTANE_IC_RESULT:' in r['stdout']
        save(HERE/'raw/diagnostic'/f'zlib_host_{c}.json',dict(**r,read_events=events,diagnostic_not_performance=True,script_sha256=sha(p)))
        rows.append(dict(condition=c,read_events=events))
    save(HERE/'zlib_host_diagnostic.json',dict(N=1,records=rows,scope='original N1 Run; adapter read wrapper only in independent diagnostics; no blanket claim about all shell binary-read return types',timings_used=False))
if __name__=='__main__':main()
