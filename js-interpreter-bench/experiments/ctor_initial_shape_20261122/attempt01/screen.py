"""Apply the predeclared repeated-Tree and stable-hit gates."""
import json
import statistics

from run import HERE,save


def main():
    protocol=json.loads((HERE/'decisions.json').read_text())['screening']
    rows=json.loads((HERE/'candidates/summary.json').read_text())
    lookup={(r['case'],r['label']):r for r in rows}
    parents={'INIT_FREE':'SPARSE','P2_COLD_INIT':'P2_COLD','P2_KEEP_PRIMARY':'P2'}
    result=[]
    for label,parent in parents.items():
        a,b=lookup['tree',parent],lookup['tree',label]
        changes=[100*(y/x-1) for x,y in zip(a['raw_ms'],b['raw_ms'])]
        tree=100*(b['median_ms']/a['median_ms']-1)
        stable=100*(lookup['micro',label]['median_ms']/lookup['micro',parent]['median_ms']-1)
        repeats=sum(x<=protocol['tree_median_change_pct_max'] for x in changes)
        passed=(tree<=protocol['tree_median_change_pct_max'] and
                repeats>=protocol['tree_pairs_at_least_5pct_faster_min'] and
                stable<=protocol['stable_median_regression_pct_max'])
        result.append(dict(label=label,parent=parent,Tree_change_pct=tree,paired_changes_pct=changes,
            pairs_at_least_5pct_faster=repeats,stable_change_pct=stable,pass_full_gate=passed))
    selected=[r['label'] for r in result if r['pass_full_gate']]
    save(HERE/'screen.json',dict(status='PASS',criteria=protocol,results=result,selected=selected))
    print(json.dumps(result,ensure_ascii=False,indent=2),flush=True)


if __name__=='__main__':main()
