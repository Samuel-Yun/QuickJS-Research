"""Shared micro driver. Setup before clock; first target call is inside."""
from common import *
TARGETS={'M1.own_integer':['m1Read'],'M2.own_reference':['m2Read'],
 'M3.own_method':['m3Call','m3Step'],'M4.numeric_control':['m4Loop'],'M5.write_control':['m5Write'],'M6.poly2':['polyRead2'],'M7.poly4':['polyRead4'],'M8.poly8':['polyRead8']}
def make_script(case,n,correctness=False):
    suffix='check' if correctness else 'measure'
    phase='correctness' if correctness else 'measure'
    driver='''
;(function(){
 var count=__N__,last,checksum=0,start=null,stop=null;
 if(__CHECK__){for(var j=0;j<count;j++){last=microRun();microValidate(last);checksum+=last;}}
 else{start=benchNow();for(var j=0;j<count;j++){last=microRun();checksum+=last;}stop=benchNow();microValidate(last);}
 if(!Number.isFinite(checksum)||checksum!==count*__EXPECTED__)throw Error('checksum');
 console.log('TEB_RESULT:'+JSON.stringify({case:__CASE__,N:count,mode:__MODE__,phase:__PHASE__,
 correctness:'PASS',checksum:checksum,last:last,start_ms:start,stop_ms:stop,elapsed_ms:start===null?null:stop-start,
 warmup_calls:0,inner_iterations:4096,first_Run_included:true}));
})();
'''.replace('__N__',str(n)).replace('__CHECK__','true' if correctness else 'false').replace('__CASE__',json.dumps(case)).replace('__MODE__',json.dumps(MODE)).replace('__PHASE__',json.dumps(phase)).replace('__EXPECTED__',str(dict(zip(MICRO_CASES,[12288,4096,8398848,8386560,4096,6144,10240,18432]))[case]))
    p=HERE/'generated'/f'{case}.N{n}.{suffix}.js'
    save(p,(HERE/'inputs/adapter.js').read_bytes()+b'\n;\n'+(HERE/'cases'/f'{case}.js').read_bytes()+driver.encode())
    return p
