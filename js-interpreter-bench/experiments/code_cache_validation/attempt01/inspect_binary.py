import re
from common import *
e=verify()['engines']['v8']; binary=e['binary']['path']
symbols=capture('binary_symbols',['nm','--defined-only',binary])
selected=[]
for line in symbols['stdout'].splitlines():
    if any(s in line for s in ('4MainE','7RunMainE','LookupCodeCache','StoreInCodeCache','ExecuteSource','CompileSource','code_cache')):
        selected.append(line)
        s=line.split()[-1]
        if '4MainE' in s or 'LookupCodeCache' in s or 'StoreInCodeCache' in s or 'ExecuteSource' in s or ('CompileSource' in s and '6Script' in s):
            r=capture('assembly2_'+s[:110],['objdump','-d','--disassemble='+s,binary])
            p=subprocess.run(['c++filt'],input=r['stdout'],capture_output=True,text=True)
            save(HERE/'probes'/('demangled_'+s[:110]+'.txt'),p.stdout)
print('\n'.join(selected))
save(HERE/'probes/selected_symbols2.txt','\n'.join(selected)+'\n')
