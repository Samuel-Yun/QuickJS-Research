from measure import *
import re,subprocess
# No benchmark execution; inspect the actual measured ELF and source.
rows=[]
for label,types in [('SPARSE',['JSFunctionBytecode','JSRuntime']),('BODY',['JSFunctionBytecode','JSRuntime']),('SITE',['JSFunctionBytecode','JSRuntime','BuiltinSite','BuiltinTable'])]:
 cmd=['gdb','-nx','-batch','-ex','set debuginfod enabled off',binary(label)]
 for n in types:cmd+=['-ex','p/d sizeof('+n+')']
 r=subprocess.run(cmd,capture_output=True,text=True);v=list(map(int,re.findall(r'\$\d+ = (\d+)',r.stdout)));assert len(v)==len(types),(r.stdout,r.stderr);rows.append(dict(label=label,sizes=dict(zip(types,v)),binary_sha256=sha(binary(label)),stdout=r.stdout));print(label,dict(zip(types,v)))
 d=Path(binary(label)).parent;src=(d/'quickjs.c').read_text();start=src.index('        CASE(OP_call_method):\n        CASE(OP_tail_call_method):');end=src.index('        CASE(OP_array_from):',start);(HERE/f'{label}.ordinary_call_method.c.txt').write_text(src[start:end])
 assert src[start:end]==(Path(binary('SPARSE')).parent/'quickjs.c').read_text().split('        CASE(OP_call_method):\n        CASE(OP_tail_call_method):',1)[1].split('        CASE(OP_array_from):',1)[0].join(['        CASE(OP_call_method):\n        CASE(OP_tail_call_method):',''])
 # Addresses and assembly are saved without executing/attaching to the program.
 asm=subprocess.run(['objdump','-d','-l','--no-show-raw-insn','--disassemble=JS_CallInternal',binary(label)],capture_output=True,text=True);(HERE/f'{label}.JS_CallInternal.asm').write_text(asm.stdout)
save(HERE/'sizes.json',rows)
