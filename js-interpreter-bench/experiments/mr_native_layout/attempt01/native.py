"""Read exact ELF dispatch tables; save full code, link layouts and load maps."""
import argparse,re,struct
from common import *
def sections(path):
 b=Path(path).read_bytes();assert b[:6]==b'\x7fELF\x02\x01';offset=struct.unpack_from('<Q',b,40)[0];size,num,strings=struct.unpack_from('<HHH',b,58)
 ss=[struct.unpack_from('<IIQQQQIIQQ',b,offset+i*size) for i in range(num)];s=ss[strings];names=b[s[4]:s[4]+s[5]]
 return b,{names[x[0]:].split(b'\0')[0].decode():dict(type=x[1],address=x[3],offset=x[4],size=x[5],flags=x[2],align=x[8]) for x in ss}
def symbols(p):
 out=subprocess.check_output(['nm','-S','--defined-only',p],text=True);result={}
 for s in out.splitlines():
  x=s.split()
  if len(x)==4:result[x[3]]=dict(address=int(x[0],16),size=int(x[1],16),kind=x[2])
 return out,result
def table(p):
 out,syms=symbols(p);keys=[k for k in syms if k.startswith('dispatch_table.')];assert len(keys)==1,keys;s=syms[keys[0]]
 b,ss=sections(p);sec=next(x for x in ss.values() if x['address']<=s['address']<x['address']+x['size']);off=sec['offset']+s['address']-sec['address']
 return list(struct.unpack_from('<'+'Q'*(s['size']//8),b,off)),syms,ss,out
def inspect():
 m=read(HERE/'manifest.final.json');rows=[];opmap=read(HERE/'diagnostic/raw'/f'{CASES[0]}.N1.M.dispatch.json.gz')['opcodes'];checks=[];archive=[];native=HERE/'native/final'
 observed={s['opcode'] for s in __import__('csv').DictReader((HERE/'diagnostic/counts.csv').open()) if s['scope']=='target function'}
 # Include call/return support and normal reads used after exits.
 observed|={'get_field','get_field2','call','call1','call2','call_method','return','push_this','put_loc0','get_arg0','get_loc0','get_loc1','add','add_loc','inc_loc','lt','if_false8','goto8','get_field_rdi','get_field2_rdi'}
 mappings=[]
 for condition,a in m['artifacts'].items():
  exe=a['path'];entries,syms,ss,nm=table(exe);fn=syms['JS_CallInternal'];pbytes=Path(exe).read_bytes()
  assert not any(k in nm for k in ['layout_count','layout_report','bridge_count','read_ic_report','rdi_diag_'])
  text=ss['.text'];blob=pbytes[text['offset']:text['offset']+text['size']]
  rows.append(dict(condition=condition,requested_padding=a['padding_request'],JS_CallInternal=fn['address'],size=fn['size'],mod16=fn['address']%16,mod64=fn['address']%64,mod4096=fn['address']%4096,text_address=text['address'],text_bytes=text['size'],text_sha256=digest(blob),ELF_type='ET_DYN' if struct.unpack_from('<H',pbytes,16)[0]==3 else 'OTHER'))
  save(native/condition/'symbols.txt',nm);save(native/condition/'sections.json',ss)
  save(native/condition/'dispatch_table.json',[dict(opcode=i,address=x) for i,x in enumerate(entries)])
  for op in opmap:
   if op['name'] in observed:
    x=entries[op['id']];mappings.append(dict(condition=condition,opcode=op['name'],opcode_id=op['id'],address=x,hex_address=hex(x),offset_in_JS_CallInternal=x-fn['address'],mod16=x%16,mod64=x%64,mod4096=x%4096,evidence='ELF dispatch_table addend; target dispatch observed only in separate diagnostic'))
  commands=[('JS_CallInternal',['objdump','-d','-l','-M','intel','--disassemble=JS_CallInternal',exe]),('relocations',['readelf','-Wr',exe])]
  if condition.endswith('base'):commands += [('full_disassembly',['objdump','-d','-l','-M','intel',exe]),('quickjs_object_relocations',['objdump','-r',STORE/condition/'.obj/quickjs.o']),('DWARF_lines',['readelf','--debug-dump=decodedline',exe])]
  for name,cmd in commands:
   data=subprocess.check_output(list(map(str,cmd)));dest=native/condition/(name+'.txt.gz');save(dest,gzip.compress(data,mtime=0));archive.append(dict(archive=dest.relative_to(HERE).as_posix(),compressed_sha256=sha(dest),original_sha256=digest(data),original_bytes=len(data)))
  # A separate process: map capture is not a timing sample or workload warmup.
  command=[exe,'-e','let until=performance.now()+1000; while(performance.now()<until){}'];p=subprocess.Popen(command,env=env(),stdout=subprocess.PIPE,stderr=subprocess.PIPE)
  maps='';start=time.perf_counter_ns()
  while p.poll() is None and time.perf_counter_ns()-start<500000000:
   candidate=Path('/proc')/str(p.pid)/'maps'
   if candidate.exists():
    maps=candidate.read_text()
    if exe in maps:break
   time.sleep(.005)
  out,err=p.communicate(timeout=10);save(native/condition/'load_mapping.json',dict(command=command,PID=p.pid,maps=maps,exit_code=p.returncode,stdout=out.decode(),stderr=err.decode(),performance_sample=False,ASLR_unchanged=True))
  assert p.returncode==0 and not err and exe in maps
 for v in 'MR':
  base=next(r for r in rows if r['condition']==v+'_base');zero=next(r for r in rows if r['condition']==v+'_p000')
  assert base['text_sha256']==zero['text_sha256'] and base['JS_CallInternal']==zero['JS_CallInternal']
  offsets={r['JS_CallInternal'] for r in rows if r['condition'].startswith(v+'_p')}
  checks.append(dict(variant=v,zero_text_and_entry_match=True,distinct_positions=len(offsets),effective=len(offsets)>=2))
 csvout(HERE/'layout/addresses.csv',rows);csvout(HERE/'native/opcode_entries.csv',mappings);save(HERE/'native/archives.json',archive)
 save(HERE/'layout/gate.json',dict(status='PASS' if all(c['effective'] for c in checks) else 'BLOCKED_LAYOUT_INTERVENTION',checks=checks,padding_execution='local STT_OBJECT text only; no constructors/export/call; original objects and dispatch table target correspondence verified; no dynamic native trace'))
 print('LAYOUT_GATE',checks,flush=True)
if __name__=='__main__':inspect()
