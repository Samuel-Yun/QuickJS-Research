"""Predeclared complete-rep-round block bootstrap, shared across cases."""
import collections,math,random,statistics as st
from common import *
def intervals(aggregate,rows,pairs):
    vals={(case,v):[next(r['elapsed_per_call_ms'] for r in rows if r['case']==case and r['variant']==v and r['rep']==rep and r['valid']) for rep in range(30)] for case in OCTANE_CASES for v in VERSIONS}
    main=[c for c in OCTANE_CASES if not c.startswith('Crypto.')]
    def weights(cases):
        groups=collections.Counter(c.split('.')[0] for c in cases)
        return {c:1/len(groups)/groups[c.split('.')[0]] for c in cases}
    ws={'MAIN_no_Crypto':weights(main),'sensitivity_with_Crypto':weights(OCTANE_CASES)}
    samples={label:{a+b:[] for a,b in pairs} for label in ws}
    rng=random.Random(SEED)
    for _ in range(10000):
        ix=[rng.randrange(30) for j in range(30)]
        med={(c,v):st.median(vals[c,v][i] for i in ix) for c in OCTANE_CASES for v in VERSIONS}
        for label,w in ws.items():
            for a,b in pairs:samples[label][a+b].append(math.exp(sum(weight*math.log(med[c,a]/med[c,b]) for c,weight in w.items())))
    def q(a,p):
        a=sorted(a);x=9999*p;i=int(x);return a[i]+(a[min(i+1,9999)]-a[i])*(x-i)
    for label in ws:
        aggregate[label]['interval_method']='10000 complete-rep-round blocks across all cases, paired versions; seed 20261023; percentile interpolated'
        for a,b in pairs:
            low,high=q(samples[label][a+b],.025),q(samples[label][a+b],.975)
            aggregate[label]['comparisons'][a+b].update(CI_low=low,CI_high=high,direction='right_faster' if low>1 else 'right_slower' if high<1 else 'unclear')
