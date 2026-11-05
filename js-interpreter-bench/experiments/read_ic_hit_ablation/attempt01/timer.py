"""Current four-condition monotonic-domain validation, no workload warmup."""
from common import *
def main():
    m=verify_runtime();clock=time.get_clock_info('perf_counter');rows=[];p=HERE/'generated/timer_probe.js'
    save(p,(HERE/'inputs/adapter.js').read_text()+'''var a=benchNow(),p=a,m=Infinity,bad=0,b;for(var i=0;i<100000;i++){b=benchNow();if(b<p)bad++;if(b>p)m=Math.min(m,b-p);p=b;}console.log(JSON.stringify({start_ms:a,stop_ms:p,min_positive_ms:m,backwards:bad}));''')
    for v in VERSIONS:
        for rep in range(3):
            t=time.perf_counter_ns();r=subprocess.run([m['artifacts'][v]['path'],str(p)],env=mode_env(v),capture_output=True,text=True);u=time.perf_counter_ns();d=json.loads(r.stdout)
            assert not r.returncode and not r.stderr and clock.monotonic and d['backwards']==0 and d['min_positive_ms']>0
            assert t/1e6-1<=d['start_ms']<d['stop_ms']<=u/1e6+1;rows.append(dict(variant=v,rep=rep,outer_start_ns=t,outer_stop_ns=u,**d))
    save(HERE/'correctness/timer_gate.json',dict(status='PASS',parent_implementation=clock.implementation,parent_nominal_resolution_seconds=clock.resolution,child='captured native performance.now CLOCK_MONOTONIC ms',min_positive_delta_includes_call_overhead=True,rows=rows))
    print('TIMER_GATE_PASS',flush=True)
if __name__=='__main__':main()
