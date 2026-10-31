"""Small deterministic estimator tests; no engines or experimental samples."""
from analyze import stats,quant,weights
from common import *
assert stats([1,2,3,4])['median']==2.5 and stats([1,2,3,4])['Q1']==1.5 and stats([1,2,3,4])['Q3']==3.5
assert stats([1,2,3,4,5])['Q1']==1.5 and stats([1,2,3,4,5])['Q3']==4.5
assert abs(stats([1,2,3])['sample_stddev']-1)<1e-12
assert quant([0,10],.025)==.25 and quant([0,10],.975)==9.75
w=weights(BASE_CASES);assert len(w)==16 and abs(sum(w.values())-1)<1e-12
assert len({c.split('.')[0] for c in BASE_CASES})==13
for suite in ['Crypto','EarleyBoyer','CodeLoad']:
    assert abs(sum(v for c,v in w.items() if c.startswith(suite+'.'))-1/13)<1e-12
assert abs(w['Richards.Richards']-1/13)<1e-12
print('ESTIMATOR_TESTS_PASS; within-suite subitems then equal-weight suites; no engine access')
