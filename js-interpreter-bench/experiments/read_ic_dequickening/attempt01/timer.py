"""Same-domain absolute monotonic clock gate; no Date.now or UTC durations."""
from common import *
def main():
    m=verify_runtime();clock=time.get_clock_info('perf_counter');rows=[];p=HERE/'generated/timer_probe.js'
    save(p,(HERE/'inputs/adapter.js').read_text()+'''
var first=benchNow(),prev=first,minDelta=Infinity,bad=0,now;
for(var i=0;i<100000;i++){now=benchNow();if(now<prev)bad++;if(now>prev)minDelta=Math.min(minDelta,now-prev);prev=now;}
console.log(JSON.stringify({start_ms:first,stop_ms:prev,min_delta_ms:minDelta,backwards:bad}));
''')
    for v in VERSIONS:
        for rep in range(3):
            start=time.perf_counter_ns();r=subprocess.run([m['artifacts'][v]['path'],str(p)],env=clean_env(),capture_output=True,text=True);stop=time.perf_counter_ns();d=json.loads(r.stdout)
            assert r.returncode==0 and not r.stderr and clock.monotonic and d['backwards']==0 and d['min_delta_ms']>0
            assert start/1e6-1<=d['start_ms']<=d['stop_ms']<=stop/1e6+1
            rows.append(dict(variant=v,rep=rep,outer_start_ns=start,outer_stop_ns=stop,**d))
    save(HERE/'correctness/timer_gate.json',dict(status='PASS',parent_clock=dict(implementation=clock.implementation,resolution_seconds=clock.resolution,monotonic=clock.monotonic),child_clock='captured native performance.now CLOCK_MONOTONIC ms',min_positive_delta_includes_call_overhead=True,rows=rows,UTC_role='date only'))
    print('TIMER_GATE_PASS',flush=True)
if __name__=='__main__':main()
