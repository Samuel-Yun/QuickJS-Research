from common import *
from native_inspect import inspect
u=read(HERE/'U_runtime.json')['U']
assert read(HERE/'correctness/U_gate.json')['status']=='PASS'
save(HERE/'machinecode/U_identity.json',inspect('U',u))
print('U_NATIVE_SAVED',flush=True)
