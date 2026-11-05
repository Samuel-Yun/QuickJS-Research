"""Offline raw-bytecode and candidate-native excerpts, no workload execution."""
import argparse,collections,re
from common import *
def instructions(c):
 text=gzip.open(HERE/'native/final'/c/'JS_CallInternal.txt.gz','rt').read();result=[]
 for s in text.splitlines():
  m=re.match(r'^\s*([0-9a-f]+):\s+((?:[0-9a-f]{2}\s+)+)\s*(.*)$',s)
  if m:result.append((int(m[1],16),m[2].strip(),m[3],s))
 return text,result
def native_entries():
 return list(csv.DictReader((HERE/'native/opcode_entries.csv').open()))
def view(op,limit=70):
 for c in ['M_base','R_base']:
  row=next(r for r in native_entries() if r['condition']==c and r['opcode']==op);addr=int(row['address']);_,ins=instructions(c)
  start=next(i for i,x in enumerate(ins) if x[0]==addr)
  print('\n'+c+' '+op+' '+hex(addr))
  print('\n'.join(x[3] for x in ins[start:start+limit]))
def address(condition,addr,limit):
 _,ins=instructions(condition);start=next(i for i,x in enumerate(ins) if x[0]>=int(addr,16));print('\n'.join(x[3] for x in ins[start:start+limit]))
def build():
 lines=['# 目标最终字节码（N2独立诊断）','这是实际编译结果的规范记录：atom操作数的4字节ID清零并另表保留名字；MIC统一回原普通opcode。','不是中间IR。operand_hex按真实小端编码保留，不伪造汇编操作数。']
 for c,names in [(CASES[0],['m4Loop','microRun']),(CASES[1],['m1Read','microRun']),(CASES[2],['m3Call','m3Step','microRun'])]:
  for v in 'MR':
   d=read(HERE/'diagnostic/raw'/f'{c}.N2.{v}.dispatch.json.gz');opmap={o['id']:o for o in d['opcodes']}
   for f in d['functions']:
    name=bytes.fromhex(f['name_hex']).decode()
    if name not in names:continue
    b=bytes.fromhex(f['normalized_code_hex']);atoms={a['pc']:bytes.fromhex(a['name_hex']).decode() for a in f['atoms']};counts={s['pc']:s for s in f['dispatch']}
    lines += [f'\n## {c} / {v} / {name}',f'canonical code+atoms SHA256: `{digest((f["normalized_code_hex"]+json.dumps(f["atoms"],sort_keys=True)).encode())}`',f'{len(b)} bytes；完整原记录在 diagnostic/raw/{c}.N2.{v}.dispatch.json.gz。','```text','PC  opcode               operand_hex  atom  ordinary_dispatch / MIC_dispatch']
    pc=0
    while pc<len(b):
     o=opmap[b[pc]];s=counts.get(pc,{});lines.append(f'{pc:3} {o["name"]:21} {b[pc+1:pc+o["size"]].hex():12} {atoms.get(pc,""):12} {s.get("ordinary_count",0)} / {s.get("ic_count",0)}');pc+=o['size']
    lines += ['```','实际dispatch为0不代表该逻辑opcode未被融合handler消费。']
 save(HERE/'native/target_bytecode.md','\n'.join(lines)+'\n')
 # Whole entry windows are intentionally not called one path: keep raw instructions and all branches.
 ops=['get_loc1','get_arg0','lt','if_false8','add_loc','inc_loc','goto8','get_field_rdi','get_field2_rdi','call_method','return','push_this']
 index=[]
 for c in ['M_base','R_base']:
  text,ins=instructions(c)
  for op in ops:
   rows=[r for r in native_entries() if r['condition']==c and r['opcode']==op]
   if not rows:continue
   r=rows[0];addr=int(r['address']);start=next(i for i,x in enumerate(ins) if x[0]==addr);part=ins[start:start+90]
   dest=HERE/'native/excerpts'/f'{c}.{op}.asm';save(dest,'; Real contiguous address window; contains mutually exclusive branches / possibly next handler.\n; NOT a dynamically traced path. Complete context in native/final/'+c+'/JS_CallInternal.txt.gz\n'+'\n'.join(x[3] for x in part)+'\n')
   index.append(dict(condition=c,opcode=op,entry=hex(addr),window_end=hex(part[-1][0]),file=dest.relative_to(HERE).as_posix(),dispatch_observation='separate N1/N2 per-PC diagnostic',native_path_observation='UNKNOWN; no native branch trace'))
 csvout(HERE/'native/excerpt_index.csv',index)
 print('OFFLINE_BYTECODE_AND_NATIVE_EXCERPTS_COMPLETE')
if __name__=='__main__':
 p=argparse.ArgumentParser();p.add_argument('--opcode');p.add_argument('--address');p.add_argument('--condition',default='M_base');p.add_argument('--limit',type=int,default=70);a=p.parse_args()
 if a.address:address(a.condition,a.address,a.limit)
 elif a.opcode:view(a.opcode,a.limit)
 else:build()
