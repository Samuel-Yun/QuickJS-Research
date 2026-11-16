"""Fresh independent diagnostic build using retained IC counters plus per-PC dispatch."""
import argparse,collections,difflib,importlib.util,re,shutil
from common import *
def module():
 spec=importlib.util.spec_from_file_location('prior_lifecycle_diagnostic',OLD/'diagnostic.py');d=importlib.util.module_from_spec(spec);spec.loader.exec_module(d)
 class StoreMap:
  def __truediv__(self,p):
   if p in ['M','R']:return STORE/(p+'_base')
   if p.endswith('_diagnostic'):
    n=1;dest=STORE/p
    while dest.exists():n+=1;dest=STORE/(p+str(n))
    return dest
   return STORE/p
 d.HERE=HERE;d.STORE=StoreMap();d.PREVIOUS=ROOT/'experiments/read_ic_mic/attempt01';return d
def one(s,a,b):assert s.count(a)==1,(a,s.count(a));return s.replace(a,b,1)
def build():
 d=module()
 def intercept(label,cmd,cwd=None,**kw):
  if label.endswith('_diagnostic_build'):
   src=Path(cwd);shutil.copy2(HERE/'counter.inc',src/'counter.inc')
   p=src/'quickjs.c';s=p.read_text()
   s=one(s,'#ifdef OPCODE_ASM_LABEL\n#pragma GCC diagnostic push','static void layout_count(JSContext*,JSFunctionBytecode*,const uint8_t*,int);\n\n#ifdef OPCODE_ASM_LABEL\n#pragma GCC diagnostic push')
   s=one(s,'#define SWITCH(pc)      goto *dispatch_table[opcode = *pc++];','#define SWITCH(pc)      do { opcode=*pc++; layout_count(ctx,b,pc-1,opcode); goto *dispatch_table[opcode]; } while(0);')
   # Definition is before free_function_bytecode, so retirement needs no forward data dependency.
   s=one(s,'#include "read_ic_prepare.inc"','#include "read_ic_prepare.inc"\n#include "counter.inc"')
   pattern=r'(static void free_function_bytecode\(JSRuntime \*rt, JSFunctionBytecode \*b\)\s*\{)'
   assert len(re.findall(pattern,s))==1;s=re.sub(pattern,r'\1\n    layout_retire(b);',s);p.write_text(s)
   p=src/'qjs.c';s=p.read_text();s=one(s,'extern void read_ic_report(void);','extern void read_ic_report(void);\nextern void layout_report(void);');s=one(s,'    read_ic_report();\n    return 0;','    read_ic_report();\n    layout_report();\n    return 0;');p.write_text(s)
   changed=[]
   for p in src.iterdir():
    if not p.is_file() or p.suffix not in ['.c','.h','.inc']:continue
    original=STORE/(label[0]+'_base')/p.name;a=original.read_text() if original.exists() else '';b=p.read_text()
    if a!=b:changed.extend(difflib.unified_diff(a.splitlines(True),b.splitlines(True),fromfile='a/'+p.name if a else '/dev/null',tofile='b/'+p.name))
   save(HERE/'patches'/(src.name+'.patch'),''.join(changed))
  return capture(label,cmd,cwd=cwd,**kw)
 d.capture=intercept;d.build()
def collect():
 d=module();manifest=read(HERE/'diagnostic_manifest.json');records=[]
 for c in CASES:
  for n in [1,2]:
   p=script(c,n,True)
   for v in 'MR':
    a=manifest['artifacts'][v];dest=STORE/f'{c}.N{n}.{v}';e=env();e['READ_IC_REPORT']=str(dest)+'.ic.json';e['LAYOUT_REPORT']=str(dest)+'.dispatch.json'
    r=capture(f'dispatch_{c}_N{n}_{v}',[a['path'],p],e=e);assert r['exit_code']==0 and not r['stderr']
    for kind in ['ic','dispatch']:
     src=Path(str(dest)+'.'+kind+'.json');gz=HERE/'diagnostic/raw'/f'{c}.N{n}.{v}.{kind}.json.gz'
     save(str(gz)+'.metadata.json',dict(**compress(src,gz),command=r['command'],binary_sha256=a['sha256'],script_sha256=sha(p),source_sha256=sha(HERE/'cases'/f'{c}.js') if c!=CASES[3] else sha(ROOT/'benchmarks/octane/upstream/richards.js'),N=n,performance_sample=False))
    d.validate(read(Path(str(dest)+'.ic.json')),v)
    records.append(dict(case=c,N=n,variant=v,stdout=r['stdout'],exit_code=r['exit_code'],stderr=r['stderr']))
 save(HERE/'diagnostic/correctness.json',records);summarize()
def canonical(f):return (f['name_hex'],f['normalized_code_hex'],json.dumps(f['atoms'],sort_keys=True))
def summarize():
 rows=[];checks=[];target_names={CASES[0]:['m4Loop'],CASES[1]:['m1Read'],CASES[2]:['m3Call','m3Step'],CASES[3]:[]}
 for c in CASES:
  for n in [1,2]:
   dd={v:read(HERE/'diagnostic/raw'/f'{c}.N{n}.{v}.dispatch.json.gz') for v in 'MR'}
   aa={v:read(HERE/'diagnostic/raw'/f'{c}.N{n}.{v}.ic.json.gz') for v in 'MR'}
   assert collections.Counter(canonical(f) for f in dd['M']['functions'])==collections.Counter(canonical(f) for f in dd['R']['functions']),'WORKLOAD_MISMATCH code '+c
   def counts(data):return collections.Counter({}) if not data['functions'] else collections.Counter((canonical(f),s['pc'],s['ordinary_opcode'],s['ic_opcode'],s['ordinary_count'],s['ic_count']) for f in data['functions'] for s in f['dispatch'])
   def normalized(data):
    out=collections.Counter()
    for f in data['functions']:
     for s in f['dispatch']:out[(canonical(f),s['pc'],s['ordinary_opcode'])]+=s['ordinary_count']+s['ic_count']
    return out
   assert normalized(dd['M'])==normalized(dd['R']),'WORKLOAD_MISMATCH normalized dispatch '+c
   allc={}
   for v in 'MR':
    sites=[s for f in aa[v]['functions'] for s in f['sites']];agg={k:sum(s[k] for s in sites) for k in ['queries','hits','updates','replacements','exits','post_exit_reads','streak_reads','streak_writes','streak_resets']};agg['total_site_reads']=agg['queries']+agg['post_exit_reads'];allc[v]=agg
    rows.append(dict(case=c,N=n,variant=v,scope='whole process IC counters',function='',pc='',opcode='',dispatch_count='',**agg))
    for f in dd[v]['functions']:
     name=bytes.fromhex(f['name_hex']).decode();is_target=name in target_names[c]
     for s in f['dispatch']:
      for kind in ['ordinary','ic']:
       if s[kind+'_count']:
        rows.append(dict(case=c,N=n,variant=v,scope='target function' if is_target else 'non-target function',function=name,pc=s['pc'],opcode=dd[v]['opcodes'][s[kind+'_opcode']]['name'],dispatch_count=s[kind+'_count'],**{k:'' for k in agg}))
   if c!=CASES[3]:
    assert allc['R']['exits']==allc['R']['post_exit_reads']==0
    assert all(allc['M'][k]==allc['R'][k] for k in ['queries','hits','updates','replacements','total_site_reads'])
    assert counts(dd['M'])==counts(dd['R'])
   else:assert allc['M']['total_site_reads']==allc['R']['total_site_reads'] and allc['R']['exits']>0
   checks.append(dict(case=c,N=n,canonical_final_code_equal=True,normalized_per_PC_dispatch_equal=True,raw_dispatch_equal=counts(dd['M'])==counts(dd['R']),M=allc['M'],R=allc['R']))
 csvout(HERE/'diagnostic/counts.csv',rows)
 save(HERE/'diagnostic/gate.json',dict(status='PASS',checks=checks,normalization='per original final PC: ordinary+MIC counts; no claim to count consumed fused opcodes',scope='N1/N2 diagnostics only; source/atom canonical key, not cross-process pointer'))
 print('DYNAMIC_WORKLOAD_GATE_PASS',flush=True)
if __name__=='__main__':
 p=argparse.ArgumentParser();p.add_argument('stage',choices=['build','collect','summarize']);a=p.parse_args();globals()[a.stage]()
