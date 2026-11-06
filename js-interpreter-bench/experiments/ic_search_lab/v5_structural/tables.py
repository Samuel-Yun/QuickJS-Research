"""Compact per-case tables, preserving separate campaigns and their units."""
import csv
import json
from pathlib import Path

H=Path(__file__).resolve().parent


def load(name):
    with (H/name).open(encoding='utf-8',newline='') as stream:
        return list(csv.DictReader(stream))


def table(campaign, conditions, filename):
    stats=load(campaign+'.statistics.csv')
    pairs=load(campaign+'.pairwise.csv')
    cases=list(dict.fromkeys(r['case'] for r in stats))
    rows=[]
    for case in cases:
        entries={r['condition']:r for r in stats if r['case']==case}
        row=dict(case=case,N=entries[conditions[0]]['N'],samples_per_condition=entries[conditions[0]]['n'],unit='ms/complete_Run')
        for label in conditions:
            for key,output in [('median_ms_per_Run','median'),('q1_ms','q1'),('q3_ms','q3')]:
                row[label+'_'+output+'_ms']=entries[label][key]
        for pair in pairs:
            if pair['case']==case:
                name=pair['numerator']+'_over_'+pair['denominator']
                row[name]=pair['median_time_ratio']
                row[name+'_low95']=pair['low95']
                row[name+'_high95']=pair['high95']
        rows.append(row)
    fields=list(rows[0])
    with (H/filename).open('w',encoding='utf-8',newline='') as stream:
        writer=csv.DictWriter(stream,fields,lineterminator='\n')
        writer.writeheader()
        writer.writerows(rows)


if __name__=='__main__':
    table('recovery.v5.octane',['A','s001','mx019','d03','d04'],'comparison_octane.csv')
    table('sun.v5.sunspider',['A','s001','d03','d04'],'comparison_sunspider.csv')
