"""Independent counters after all Release timing, never concurrent with it."""
from run import *
def comparison_sites(row):
 # Registration bytes precede opcode replacement. Constructor records start
 # with call_constructor; comparison records start with a local/argument load.
 snapshots=[json.loads(x) for x in (HERE/'bytecode_splay/method.snapshots.jsonl').read_text().splitlines()]
 loads={o['raw'][:2] for b in snapshots for o in b['opcodes'] if o['name'].startswith(('get_arg','get_loc'))}
 return [s for s in row['diagnostic']['FOUR_COUNTS']['sites'] if s['bytecode_hex'][:2] in loads]
def main():
 os.sched_setaffinity(0,{2});assert json.loads((HERE/'full01/complete.json').read_text())['status']=='PASS'
 out=next_out(HERE,'mechanism');out.mkdir();scan=[]
 prior=json.loads(sorted((HERE/'02_compare_branch').glob('counts*/samples.json'))[-1].read_text());splay=next(r for r in prior if r['label']=='COMPARE_FULL')
 for suite in ['octane','sunspider']:
  for c in CATALOG['cases'][suite]:
   r=splay if suite=='octane' and c['name']=='Splay' else bench('COMPARE_FULL',suite,c,out/'scan',mode='counts')
   if r is not splay and r['mode']!='counts':raise AssertionError('diagnostics required')
   sites=comparison_sites(r);entry=dict(suite=suite,case=c['case'],queries=sum(s['attempts'] for s in sites),hits=sum(s['hits'] for s in sites),saved_reads=sum(s['work'][2] for s in sites),saved_dispatch=sum(s['work'][3] for s in sites),regular_ctor_hits=r['diagnostic']['FOUR_COUNTS']['hits']-sum(s['hits'] for s in sites),sites=sites,raw=r)
   scan.append(entry);save(out/'compare_scan.json',scan);print('SCAN',suite,c['name'],entry['queries'],entry['hits'],entry['saved_reads'],flush=True)
 rows=[];old=json.loads((HERE/'03_ctor_coalloc/profile01/samples.json').read_text())[0]
 for suite,case in [('octane','EarleyBoyer.Boyer'),('octane','Splay'),('sunspider','access-binary-trees'),('octane','CodeLoad.Closure')]:
  for l in ['COALLOC_PROFILE','COALLOC','COALLOC_OFF']:
   r=old if l=='COALLOC_PROFILE' and case=='EarleyBoyer.Boyer' else bench(l,suite,native(suite,case),out/'coalloc',mode='counts')
   rows.append(r);save(out/'coalloc.json',rows);print('CO',case,l,r['diagnostic']['CO_WORK'],flush=True)
 save(out/'complete.json',dict(status='PASS',comparison_cases=len(scan),coalloc_cases=len(rows),all_diagnostic=True))
if __name__=='__main__':main()
