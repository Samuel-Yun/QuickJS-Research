"""Read types from the measured Release ELF, without running/attaching it."""
import re
from run import *
if __name__=='__main__':
 rows=[]
 for label,names in [('SPARSE',['JSObject','JSRuntime','JSFunctionBytecode','FourSite','FullPlan']),('NUMERIC_PLAN',['JSObject','JSFunctionBytecode','FourSite','FullPlan','NumericPlan','NumericRecipe']),('COMPARE_FULL',['JSObject','JSFunctionBytecode','FourSite','CompareSite']),('COALLOC',['JSObject','JSFunctionBytecode','FourSite','FullPlan'])]:
  exe=binary(label);cmd=['gdb','-nx','-batch','-ex','set debuginfod enabled off',exe]
  for n in names:cmd+=['-ex','p/d sizeof('+n+')']
  r=subprocess.run(cmd,capture_output=True,text=True);values=list(map(int,re.findall(r'\$\d+ = (\d+)',r.stdout)));assert r.returncode==0 and len(values)==len(names),(r.stdout,r.stderr)
  rows.append(dict(label=label,sizes=dict(zip(names,values)),command=cmd,binary_sha256=sha(exe),stdout=r.stdout,stderr=r.stderr));print(label,dict(zip(names,values)))
 save(HERE/'sizes.json',rows)
