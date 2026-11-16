import json,hashlib,zipfile,collections,subprocess
from pathlib import Path
from build import H,ROOT,sha

def main():
 rel=json.loads((H/'release_manifest.json').read_text())
 for label in ['A','SPARSE']:
  m=rel[label];assert sha(m['elf'])==m['elf_sha256']
  for n,s in m['sources'].items():assert sha(Path(m['elf']).parent/n)==s
  d=json.loads((H/(label+'.diagnostic.json')).read_text());assert sha(d['elf'])==d['elf_sha256']
  for n,s in d['sources'].items():assert sha(Path(d['elf']).parent/n)==s
 p=ROOT/'experiments/ctor_ic_followups_20261115/attempt01/03_sparse_ctor'
 refs={}
 for n in ['source.tar.gz','release.manifest.json']:
  path=p/n;gitpath=str(path.relative_to(ROOT.parent));blob=subprocess.check_output(['git','show','06aada4:'+gitpath],cwd=ROOT.parent);assert hashlib.sha256(blob).hexdigest()==sha(path);refs[gitpath]=sha(path)
 assert (H/'own_read.js').read_bytes()==(ROOT/'benchmarks/ic_hit_rate/own_read.js').read_bytes()
 # The measured loop bodies are identical, even when diagnostic main adds interfaces.
 for name,func,end in [('own_read','function readLoop(','\nfunction selfTest'),('ctor','function ctorLoop(','\nfunction main')]:
  a=(H/(name+'.js')).read_text();b=(H/(name+'.diag.js')).read_text();a=a[a.index(func):a.index(end,a.index(func))];b=b[b.index(func):b.index(end,b.index(func))];assert a==b
 es=[json.loads(s) for s in (H/'raw/measure/runs.jsonl').read_text().splitlines()];rs=[r for r in es if r['event']=='sample'];assert len(rs)==130
 assert collections.Counter((r['kind'],r['target'],r['label']) for r in rs)==collections.Counter({(k,r,l):5 for k,rates in [('read',[0,25,50,75,90,99,100]),('positive',[0,50,100]),('negative',[0,50,100])] for r in rates for l in ['A','SPARSE']})
 assert all(r['elapsed_ms']>3000 for r in rs)
 for phase in ['measure','counts']:
  proto=json.loads((H/'raw'/phase/'protocol.json').read_text());assert proto['CPU']==2 and proto['warmup_calls']==0
  for p,s in proto['frozen'].items():assert sha(p)==s
 d=[r for r in map(json.loads,(H/'raw/counts/runs.jsonl').read_text().splitlines()) if r['event']=='sample'];assert len(d)==13
 for r in d:
  c=r['counts'];n=r['iterations']
  if r['kind']=='read':assert c['read'][0]==n==c['read'][1]+c['read'][2] and c['read'][1]==c['read'][3]+c['read'][4]
  else:assert c['ctor'][0]==n==c['ctor'][1]+c['ctor'][4]
  if r['kind']=='negative':assert c['ctor'][1]==0 and c['ctor'][4]==n
 path=H/'slides/按需构造缓存_命中率白盒实验.pptx'
 import sys
 sys.path.insert(0,'/tmp/quickjs-whitebox-slide-deps')
 from pptx import Presentation
 pr=Presentation(path);assert len(pr.slides)==6 and abs(pr.slide_width/pr.slide_height-16/9)<1e-5;charts=0;tables=0
 for i,s in enumerate(pr.slides):
  for sh in s.shapes:
   assert sh.left>=0 and sh.top>=0 and sh.left+sh.width<=pr.slide_width+10 and sh.top+sh.height<=pr.slide_height+10,(i,sh.name)
   charts+=sh.has_chart;tables+=sh.has_table
 assert charts==2 and tables>=6
 with zipfile.ZipFile(path) as z:
  names=z.namelist();assert len([n for n in names if n.startswith('ppt/embeddings/') and n.endswith('.xlsx')])==2
  # Plot panels must be charts, not rendered screenshots.
  assert not any(n.startswith('ppt/media/') for n in names)
  text=''.join(z.read(n).decode('utf-8') for n in names if n.startswith('ppt/slides/slide') and n.endswith('.xml'))
  assert 'SPARSE_CTOR_IC' not in text and '楷体' in text and 'Times New Roman' in text
 result=dict(status='PASS',method_name='按需构造缓存',fixed_source_commit='06aada4',source_reference_sha256=refs,formal_fresh_processes=130,independent_count_processes=13,all_formal_kernels_over_3s=True,full_suites_rerun=False,actual_live_buffers=True,read_fusion_counted_once=True,slide_count=6,editable_charts=charts,editable_tables=tables,embedded_editable_workbooks=2,plot_screenshots=0,pptx_sha256=sha(path))
 (H/'audit.json').write_text(json.dumps(result,indent=2,ensure_ascii=False));print(json.dumps(result,indent=2,ensure_ascii=False))
if __name__=='__main__':main()
