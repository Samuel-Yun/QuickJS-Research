from run import *
LABELS=['SPARSE','BODY','SHAM','SITE']
def main():
 os.sched_setaffinity(0,{2});out=next_out(HERE,'validation');out.mkdir();checks=[]
 semantic=out/'semantics.js';semantic.write_text((HERE/'semantics.js').read_text())
 for script in [semantic,TESTS/'property_reads.js',TESTS/'safety.js']:
  ref=capture('A',script,[],out,script.stem)
  for l in LABELS:
   for mode in ['release','counts','sanitize']:
    actual=ALIASES.get(l,(l,None,None))[0]
    if not(folder(l)/f'{actual}.{mode}.manifest.json').exists():continue
    r=capture(l,script,[],out,script.stem,mode=mode,snapshot=(mode=='counts'and script.stem=='semantics'));assert r['stdout']==ref['stdout'],(l,mode,r['stdout'],ref['stdout']);checks.append(dict(label=l,mode=mode,script=str(script)));print('CHECK',l,mode,script.stem,flush=True)
 for l in ['SHAM','SITE']:
  f=out/f'semantics.{l}.counts.0.snapshot.jsonl';snap=[json.loads(x)for x in f.read_text().splitlines()];ops=[(b['function'],o['pc'],o['size'],o['raw'])for b in snap for o in b['opcodes']if o['name']=='builtin_method1'];assert ops;assert all(o[2]==3 for o in ops);print('PATCHED_EXECUTION_IMAGE',l,ops,flush=True)
  for name in ['boundMethod','argc2','tail','indirect']:
   bb=next(b for b in snap if b['function']==name);assert not any(o['name']=='builtin_method1'for o in bb['opcodes']),name
  assert any(o['name']=='builtin_method1'for b in snap if b['function']=='getterRead'for o in b['opcodes'])
  raw=json.loads((out/f'semantics.{l}.counts.0.json').read_text());counts=json.loads(next(x.split(':',1)[1]for x in raw['stderr'].splitlines()if x.startswith('BIC_COUNTS:')));save(out/(l+'.counts.json'),counts);assert sum(s['c'][2]for s in counts['sites'])>=2;assert sum(s['c'][6]for s in counts['sites'])>=1
  if l=='SITE':assert sum(s['c'][9]for s in counts['sites'])>0
  else:assert sum(s['c'][9]for s in counts['sites'])==0
 save(out/'gate.json',dict(status='PASS',checks=checks,private_image_rewrite_confirmed=True));print('VALIDATED',out,flush=True)
if __name__=='__main__':main()
