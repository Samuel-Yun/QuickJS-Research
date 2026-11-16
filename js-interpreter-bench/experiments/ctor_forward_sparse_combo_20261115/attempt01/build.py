"""Compose the two measured implementations, independently over frozen R3."""
import argparse,importlib.util,sys,difflib,hashlib,json,subprocess
from pathlib import Path
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
OLD=ROOT/'experiments/ctor_ic_followups_20261115/attempt01';LABEL='FORWARD_SPARSE'
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def module(name,path):
 spec=importlib.util.spec_from_file_location(name,path);m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);return m
base=module('frozen_followup_builder',OLD/'build.py');sparse=module('frozen_sparse_builder',OLD/'sparse.py')
def source(mode):
 original,d,digest=base.source('01_forward_ctor',mode)
 # Sparse uses follow[0:12], forward independently uses follow[12:20].
 import re
 def remap(s):return re.sub(r'\b(FOLLOW|FOLLOW_ADD)\(([0-7])(?=[,)])',lambda m:m[1]+'('+str(int(m[2])+12),s)
 d['follow_runtime.inc']=remap(d['follow_runtime.inc']);q=remap(d['quickjs.c'])
 q=sparse.apply(d,q,base.once,mode);d['quickjs.c']=q
 return original,d,digest
def main():
 p=argparse.ArgumentParser();p.add_argument('mode',choices=['release','counts','san']);a=p.parse_args()
 original,d,digest=source(a.mode);h=HERE/LABEL;w=h/'work'/a.mode;w.mkdir(parents=True,exist_ok=False)
 for n,s in d.items():f=w/n;f.parent.mkdir(parents=True,exist_ok=True);f.write_text(s)
 patch=''.join(l for n,s in d.items() if original.get(n)!=s for l in difflib.unified_diff(original.get(n,'').splitlines(True),s.splitlines(True),fromfile='a/'+n,tofile='b/'+n))
 (h/(a.mode+'.patch')).write_text(patch)
 cmd=['make','-j2','-o','repl.c',*(['CONFIG_ASAN=y','CONFIG_UBSAN=y'] if a.mode=='san' else []),'qjs','qjsc']
 with (h/(a.mode+'.build.log')).open('w') as f:z=subprocess.run(cmd,cwd=w,stdout=f,stderr=subprocess.STDOUT,timeout=300)
 assert z.returncode==0,'See build log'
 provenance={str(p):sha(p) for p in [OLD/'build.py',OLD/'sparse.py',OLD/'sparse_runtime.inc',OLD/'forward_prepare.inc',OLD/'forward_runtime.inc',Path(__file__)]}
 m=dict(round=LABEL,mode=a.mode,R3_archive_sha256=digest,composition=['01_forward_ctor','03_sparse_ctor'],diagnostic_follow_indices=dict(sparse='0..11',forward='12..19'),provenance=provenance,sources={n:sha(w/n) for n in d},elf=str(w/'qjs'),elf_sha256=sha(w/'qjs'),command=cmd)
 (h/(a.mode+'.manifest.json')).write_text(json.dumps(m,indent=2)+'\n');print('BUILD_PASS',a.mode,flush=True)
if __name__=='__main__':main()
