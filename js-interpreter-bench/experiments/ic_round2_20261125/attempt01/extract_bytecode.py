from common import *
import re
spec=importlib.util.spec_from_file_location('bc',PACKAGE/'tools/bytecode.py');bc=importlib.util.module_from_spec(spec);spec.loader.exec_module(bc)
out=HERE/'bytecode';out.mkdir(exist_ok=True)
def load(pattern):
 p=next((HERE/'counts01/raw').glob(pattern));return p,[json.loads(x)for x in p.read_text().splitlines()]
sections=[]
p,ray=load('*NEST_COMBINED*.snapshot.jsonl')
for title,pred in [('包装函数：实际准备镜像',lambda b:b['byte_code_len']==22 and any(o['name']=='special_object'for o in b['opcodes'])),('两实参 initializer',lambda b:b['byte_code_len']==17 and b['arg_count']==2 and [o['name']for o in b['opcodes']][-1]=='return_undef'),('包含子 new 的 initializer',lambda b:b['byte_code_len']==29 and b['arg_count']==0 and any(o['name']=='four_ctor'for o in b['opcodes']))]:
 selected=[b for b in ray if pred(b)];assert selected,title;b=selected[0];save(out/(str(b['id'])+'.json'),b);sections.append((title,str(p.relative_to(HERE)),bc.disassemble([b])))
p,delta=load('*DeltaBlue*CALL_IC*.snapshot.jsonl')
for title,name in [('被适配的基类字段初始化','Constraint'),('真实 call_method 所在函数','BinaryConstraint')]:
 sel=[b for b in delta if b['function']==name];assert sel,name;sections.append((title,str(p.relative_to(HERE)),bc.disassemble([sel[0]])))
p,typ=load('*Typescript*CALL_IC*.snapshot.jsonl')
for name in ['ASTSpan','Token']:
 sel=[b for b in typ if b['function']==name];assert sel,name;sections.append((name+' 的实际函数体',str(p.relative_to(HERE)),bc.disassemble([sel[0]])))
p,boy=load('*Boyer*INSTANCE_HOOK*.snapshot.jsonl')
sel=[b for b in boy if any(o['name']=='instanceof'for o in b['opcodes'])];assert sel
b=max(sel,key=lambda b:sum(o['name']=='instanceof'for o in b['opcodes']));ops=b['opcodes'];wanted=set()
for i,o in enumerate(ops):
 if o['name']=='instanceof':wanted.update(range(max(0,i-2),min(len(ops),i+3)))
b=dict(b,opcodes=[o for i,o in enumerate(ops)if i in wanted],read_sites=[],constructor_sites=[]);sections.append(('Boyer 的 instanceof 热函数（只摘运算附近）',str(p.relative_to(HERE)),bc.disassemble([b])))
lines=['# 实际执行字节码','',
 '来自 Run 结束后保存的诊断执行镜像；不是只打印改写前的编译输出。诊断记录尺寸会影响 IC delta，不将这里的 delta 当成 Release 元数据的大小。完整镜像和 hash 对应的命令均在 counts01/raw/。','',
 '这轮没有新增 opcode。instanceof、call_method、four_ctor 仍是入口；C handler 按记录选择路径。字节码没换名字不表示没有进入快路，Run 内提交计数才是证据。快照工具的 constructor_sites.positive_plan 只显示旧 FullPlan，不含 NumericPlan/NestedPlan，不能据此判断两者是否命中。','']
for title,p,text in sections:lines+=['## '+title,'','来源：'+p,'','```text',text.rstrip(),'```','']
(HERE/'bytecode.md').write_text('\n'.join(lines)+'\n')
# Match NUMERIC_PLAN's largest rejected outer sites to their true argc.
p,snaps=load('*NUMERIC_PLAN*.snapshot.jsonl');r=next(r for r in json.loads((HERE/'counts01/samples.json').read_text())if r['label']=='NUMERIC_PLAN');rows=[]
for s in sorted(r['diagnostic']['FOUR_COUNTS']['sites'],key=lambda s:sum(s['numeric'][8:16]),reverse=True):
 count=sum(s['numeric'][8:16]);
 if count<10000:continue
 matches=[]
 for b in snaps:
  raw=bytearray.fromhex(''.join(o['raw']for o in b['opcodes']));chunk=bytes.fromhex(s['bytecode_hex']);pc=s['pc']
  # FourDiag captures bytes immediately before this and later constructors
  # are rewritten. Normalize only those operands back for identity matching.
  for op in b['opcodes']:
   if op['name']=='four_ctor' and op['pc']>=pc:
    raw[op['pc']]=chunk[0];raw[op['pc']+1:op['pc']+3]=op['argc'].to_bytes(2,'little')
  if raw[pc:pc+len(chunk)]==chunk:
   for o in b['opcodes']:
    if o['pc']==pc and o['name']=='four_ctor':matches.append(dict(function_id=b['id'],argc=o['argc']))
 rows.append(dict(line=s['source_line'],pc=s['pc'],numeric_seed_rejections=count,argc_candidates=sorted(set(m['argc']for m in matches)),matched_function_ids=[m['function_id']for m in matches]))
save(out/'numeric_rejected_sites_argc.json',rows)
print('BYTECODE_WRITTEN',[(x['line'],x['argc_candidates'],x['numeric_seed_rejections'])for x in rows])
