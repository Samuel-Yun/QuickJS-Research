"""Run-only instruction accounting, separate from all Release timing.
The interpreter .o is reused verbatim from the measured Release build.
Only qjs.c receives two Valgrind client-request helpers.
"""
from measure import *
import re

def make_profile(label,out):
 work=Path(binary(label)).parent;q=(work/'qjs.c').read_text()
 q=once(q,'#include "quickjs-libc.h"','''#include "quickjs-libc.h"
#include <valgrind/callgrind.h>
static JSValue cg_begin(JSContext*c,JSValueConst t,int n,JSValueConst*a){CALLGRIND_ZERO_STATS;CALLGRIND_START_INSTRUMENTATION;return JS_UNDEFINED;}
static JSValue cg_end(JSContext*c,JSValueConst t,int n,JSValueConst*a){CALLGRIND_STOP_INSTRUMENTATION;CALLGRIND_DUMP_STATS;return JS_UNDEFINED;}
''')
 anchor='    js_std_add_helpers(ctx, argc - optind, argv + optind);';q=once(q,anchor,anchor+'''\n    {JSValue g=JS_GetGlobalObject(ctx);JS_SetPropertyStr(ctx,g,"__ep_begin",JS_NewCFunction(ctx,cg_begin,"__ep_begin",0));JS_SetPropertyStr(ctx,g,"__ep_end",JS_NewCFunction(ctx,cg_end,"__ep_end",0));JS_FreeValue(ctx,g);}
''')
 src=out/(label+'.loader.c');src.write_text(q);obj=out/(label+'.loader.o');exe=out/(label+'.qjs');od=work/'.obj'
 cmd=['gcc','-g','-O2','-fwrapv','-D_GNU_SOURCE','-DCONFIG_VERSION="2026-06-04"','-DHAVE_CLOSEFROM','-I'+str(work),'-c',str(src),'-o',str(obj)];r=subprocess.run(cmd,capture_output=True,text=True);assert not r.returncode,r.stderr
 objs=[obj,*[od/(n+'.o')for n in ['repl','quickjs','dtoa','libregexp','libunicode','cutils','quickjs-libc']]];link=['gcc','-g','-rdynamic','-o',str(exe),*map(str,objs),'-lm','-lpthread','-ldl'];r=subprocess.run(link,capture_output=True,text=True);assert not r.returncode,r.stderr
 save(out/(label+'.manifest.json'),dict(command=cmd,link=link,interpreter_object=str(od/'quickjs.o'),interpreter_object_sha256=sha(od/'quickjs.o'),binary_sha256=sha(exe),not_a_timing_build=True));return exe

def parse(path):
 names={};fl=fi=fn=cfn='';edge=False;events=[];rows=[];edges=[];summary=None;calls=0
 def name(s):
  m=re.match(r'\((\d+)\)(?: (.*))?$',s)
  if not m:return s
  if m[2]is not None:names[m[1]]=m[2]
  return names[m[1]]
 for raw in path.read_text().splitlines():
  if raw.startswith('summary:'):summary=int(raw.split()[1])
  if raw.startswith('totals:'):summary=int(raw.split()[1])
  if raw.startswith('fl='):fl=fi=name(raw[3:])
  elif raw.startswith('fi=')or raw.startswith('fe='):fi=name(raw[3:])
  elif raw.startswith('fn='):fn=name(raw[3:]);fi=fl
  elif raw.startswith('cfn='):cfn=name(raw[4:])
  elif raw.startswith('calls='):calls=int(raw[6:].split()[0]);edge=True
  elif raw and raw[0].isdigit():
   vals=raw.split();line=int(vals[0]);cost=int(vals[1]);
   if edge:edges.append(dict(file=fi,function=fn,line=line,callee=cfn,Ir=cost,calls=calls));edge=False
   else:rows.append(dict(file=fi,function=fn,line=line,Ir=cost))
 assert summary is not None
 assert sum(r['Ir']for r in rows)==summary,(sum(r['Ir']for r in rows),summary)
 return dict(summary=summary,self=rows,edges=edges)

def accounting(label,data):
 def basefn(s):return re.sub(r"'[0-9]+$",'',s)
 work=Path(binary(label)).parent;src=(work/'quickjs.c').read_text().splitlines()
 def line(needle):return next(i+1 for i,s in enumerate(src)if needle in s)
 # Ir categories use source-attributed instructions; lookup helper edges are
 # counted once, excluding recursively accumulated interpreter call edges.
 gstart=line('#define GET_FIELD_INLINE');gend=line('CASE(OP_put_field_shared)')
 native_entry=line('static JSValue JS_CallInternal(JSContext *caller_ctx,')
 first_case=line('CASE(OP_push_i32)')
 borrow_start=line('#define V6_PREPARED_BORROW');borrow_end=next(i+1 for i in range(borrow_start,len(src))if src[i].startswith('} while (0)'))
 read_self=sum(r['Ir']for r in data['self']if basefn(r['function'])=='JS_CallInternal'and (r['file'].endswith('read_ic_opcodes.inc')or(r['file'].endswith('quickjs.c')and gstart<=r['line']<gend)))
 read_edges=sum(r['Ir']for r in data['edges']if basefn(r['function'])=='JS_CallInternal'and basefn(r['callee'])=='JS_GetPropertyInternal'and (r['file'].endswith('read_ic_opcodes.inc')or(r['file'].endswith('quickjs.c')and gstart<=r['line']<gend)))
 call_entry=sum(r['Ir']for r in data['self']if basefn(r['function'])=='JS_CallInternal'and r['file'].endswith('quickjs.c')and native_entry<=r['line']<first_case and not borrow_start<=r['line']<=borrow_end)
 native_frame=sum(r['Ir']for r in data['self']if basefn(r['function'])=='js_call_c_function')
 char_body=sum(r['Ir']for r in data['edges']if basefn(r['callee'])=='js_string_charCodeAt')
 regex_ir=sum(r['Ir']for r in data['self']if basefn(r['function'])=='lre_exec')
 return dict(label=label,regexp_matcher_self=regex_ir,total_Run_Ir=data['summary'],named_read_handler_self=read_self,named_read_lookup_inclusive=read_edges,named_read_combined=read_self+read_edges,all_call_entry_self=call_entry,all_native_frame_self=native_frame,charCodeAt_body_inclusive=char_body,notes='read: named get_field/get_field2/get_length/rdi handlers plus their JS_GetPropertyInternal edge costs; call entry: all JS_CallInternal entries before dispatch; native frame: all C builtins, excluding their bodies; char body includes its callees. These are instruction counts, not elapsed-time shares.')

def main():
 os.sched_setaffinity(0,{2});out=HERE/'callgrind01';out.mkdir(exist_ok=True);result=[]
 for label in ['BODY','SITE']:
  exe=out/(label+'.qjs')
  if not exe.exists():exe=make_profile(label,out)
  dest=out/(label+'.callgrind');env=dict(ENV,QJS_BUILTIN_MODE='site')
  cmd=['valgrind','--tool=callgrind','--instr-atstart=no','--dump-instr=no','--compress-strings=no','--compress-pos=no','--callgrind-out-file='+str(dest),str(exe),'--std',str(HERE/'external/scripts/Acorn.js'),'1']
  record=out/(label+'.run.json')
  if not record.exists():
   r=subprocess.run(cmd,capture_output=True,text=True,env=env,timeout=1800);save(record,dict(command=cmd,exit_code=r.returncode,stdout=r.stdout,stderr=r.stderr))
  run=json.loads(record.read_text());assert not run['exit_code'],run['stderr'];assert '"hash":1052523795'in run['stdout']
  files=list(out.glob(label+'.callgrind*'));parsed=[(p,parse(p))for p in files];p,d=max(parsed,key=lambda x:x[1]['summary']);save(out/(label+'.decoded.json'),d);a=accounting(label,d);a['file']=str(p);result.append(a);save(out/'summary.json',result);print('CALLGRIND',a,flush=True)
if __name__=='__main__':main()
