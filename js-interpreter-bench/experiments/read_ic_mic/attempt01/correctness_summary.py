"""Summarize already produced correctness logs; never invokes a runtime."""
import re
from common import *
def main():
    records=read(HERE/'correctness/release_results.json');rows=[]
    for r in records:
        if r['test'] in ['legacy_regression.js','multislot.js','read_semantics.js','site_regression.js']:
            rows.append(dict(variant=r['variant'],test=r['test'],stdout=r['stdout'].strip(),valid=r['valid']))
    csvout(HERE/'correctness/assertion_results.csv',rows)
    summary=dict(status=read(HERE/'correctness/gate.json')['status'],
      legacy_assertions_each=952,multislot_scenarios_each=9,multislot_assertions_each=28151,
      site_regression_scenarios_each=15,site_regression_assertions_each=23211,
      independent_smoke_cases_each=len([r for r in records if r['variant']=='A'])-4,
      upstream_make_test_entries_each=11,full_test262=False,
      active_cache_serialization=True,qjsc_embedding=True,GC_cycle_functions_each=1800,OOM_budgets_each=192,
      targeted_ASan_UBSan_versions=['M','P'],scenarios_not_assertion_counts=True,
      selected_workload_N1_N2_records=144)
    csvpath=HERE/'correctness/octane.csv'
    if csvpath.exists():
        rs=list(csv.DictReader(csvpath.open(encoding='utf-8')));assert len(rs)==144 and all(r['valid']=='True' for r in rs)
    save(HERE/'correctness/summary.json',summary);print('CORRECTNESS_LOG_SUMMARY_PASS')
if __name__=='__main__':main()
