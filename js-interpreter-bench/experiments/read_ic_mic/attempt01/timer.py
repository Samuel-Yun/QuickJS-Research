"""Actual native monotonic clock gate; UTC is never an interval endpoint."""
from common import *
def main():
    m=verify_runtime();clock=time.get_clock_info('perf_counter');rows=[]
    p=HERE/'generated/timer_probe.js'
    save(p,(HERE/'inputs/adapter.js').read_text()+'''
var first=benchNow(),prev=first,minDelta=Infinity,bad=0,now;
for(var i=0;i<100000;i++){now=benchNow();if(now<prev)bad++;if(now>prev)minDelta=Math.min(minDelta,now-prev);prev=now;}
console.log(JSON.stringify({start_ms:first,stop_ms:prev,min_delta_ms:minDelta,backwards:bad}));
''')
    for v in VERSIONS:
        for rep in range(3):
            start=time.perf_counter_ns();r=subprocess.run([m['artifacts'][v]['path'],str(p)],capture_output=True,text=True);stop=time.perf_counter_ns()
            d=json.loads(r.stdout);assert r.returncode==0 and not r.stderr
            assert clock.monotonic and d['backwards']==0 and d['min_delta_ms']>0
            assert start/1e6-1<=d['start_ms']<=d['stop_ms']<=stop/1e6+1
            rows.append(dict(variant=v,rep=rep,outer_start_ns=start,outer_stop_ns=stop,**d))
    save(HERE/'correctness/timer_gate.json',dict(status='PASS',parent_clock=dict(implementation=clock.implementation,resolution_seconds=clock.resolution,monotonic=clock.monotonic),
      child_clock='native performance.now captured before base.js; quickjs-libc.c js_os_now CLOCK_MONOTONIC, ms',bracket_tolerance_ms=1,rows=rows,
      UTC_role='date label only; not used to infer interval endpoints or overlap'))
    print('TIMER_GATE_PASS',flush=True)
if __name__=='__main__':main()
