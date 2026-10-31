"""Explicit post-interruption exploratory complete-round aggregate; never replace primary."""
import argparse,random,statistics
import analyze
from common import *
def partial(out):
    assert not (out/'exploratory_partial.json').exists(),'no overwrite'
    rr=[read(p) for p in (HERE/'raw/formal').rglob('*.json')]
    records={(r['case'],r['condition'],r['rep']):r for r in rr}
    sets={'POST_INTERRUPT_FIXED16_COMMON_ROUNDS':BASE_CASES,'POST_INTERRUPT_NO_CRYPTO_COMMON_ROUNDS':[k for k in BASE_CASES if not k.startswith('Crypto.')],'POST_INTERRUPT_ADMITTED17_COMMON_ROUNDS':read(HERE/'formal_cases.json')}
    result=[]
    for label,cases in sets.items():
        reps=[rep for rep in range(30) if all((k,c,rep) in records and records[k,c,rep]['valid'] for k in cases for c in CONDITIONS)]
        w=analyze.weights(cases);n=len(reps)
        if n<2:continue
        vals={(k,c):[records[k,c,rep]['elapsed_per_Run_ms'] for rep in reps] for k in cases for c in CONDITIONS}
        pointmed={key:statistics.median(v) for key,v in vals.items()}
        samples={a+'/'+b:[] for a,b in analyze.PAIRS};rng=random.Random(SEED)
        for _ in range(10000):
            ix=[rng.randrange(n) for _ in range(n)]
            med={key:statistics.median(v[i] for i in ix) for key,v in vals.items()}
            for a,b in analyze.PAIRS:samples[a+'/'+b].append(math.exp(sum(w[k]*math.log(med[k,a]/med[k,b]) for k in cases)))
        for a,b in analyze.PAIRS:
            pair=a+'/'+b;point=math.exp(sum(w[k]*math.log(pointmed[k,a]/pointmed[k,b]) for k in cases));lo=analyze.quant(samples[pair],.025);hi=analyze.quant(samples[pair],.975)
            result.append(dict(set=label,ratio=pair,case_count=len(cases),suite_count=len({k.split('.')[0] for k in cases}),planned_rounds=30,complete_common_rounds=n,rep_indices=reps,processes_used=n*len(cases)*5,point=point,CI95_low=lo,CI95_high=hi,time_change_percent=100*(point-1),CI95_change_low=100*(lo-1),CI95_change_high=100*(hi-1),status='improvement' if hi<1 else 'regression' if lo>1 else 'unclear',bootstrap_draws=10000,seed=SEED,primary_result=False,post_interruption_addition=True,cases=cases,by_suite={s:math.exp(statistics.mean(math.log(pointmed[k,a]/pointmed[k,b]) for k in cases if k.split('.')[0]==s)) for s in {k.split('.')[0] for k in cases}}))
    save(out/'exploratory_partial.json',dict(method='interruption_protocol.md; no engine calls; partial completed common-round exploration, primary remains unavailable',results=result))
    csvout(out/'exploratory_partial.csv',[{k:v for k,v in r.items() if k not in ['rep_indices','cases','by_suite']} for r in result])
    text=analyze.mdtable(['集合','比较','Run/suite','共同轮','比值','95%区间','变化%','判断'],[[r['set'],r['ratio'],f'{r["case_count"]}/{r["suite_count"]}',r['complete_common_rounds'],f'{r["point"]:.5f}',f'[{r["CI95_low"]:.5f}, {r["CI95_high"]:.5f}]',f'{r["time_change_percent"]:+.2f}',r['status']] for r in result])
    save(out/'exploratory_partial.md','# 跨boot停止后的共同完整轮探索\n\n不是完整30轮主总体；未替换aggregate.json。\n\n'+text+'\n')
    print('PARTIAL_COMPLETE_ROUNDS_ANALYZED',sorted({r['complete_common_rounds'] for r in result}))
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--output',required=True,type=Path);p.add_argument('--extend-existing',action='store_true');args=p.parse_args()
    if args.extend_existing:assert (args.output/'audit.json').exists()
    else:analyze.main(args.output)
    partial(args.output)
