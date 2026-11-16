"""Optional existing-GDB read-only memory snapshots at the two native hooks.
Run only in separate N1/N2 diagnostic processes, never validation/profile.
"""
import gdb,hashlib,json,os
records=[]
def snapshot(phase):
    ctx=gdb.parse_and_eval('ctx');glob=ctx['global_obj'];o=glob['u']['ptr'].cast(gdb.lookup_type('JSObject').pointer()).dereference();found=[];visited=set()
    class_id=int(gdb.parse_and_eval('(int)JS_CLASS_BYTECODE_FUNCTION'))
    def walk(o,depth,path):
        address=int(o.address)
        if address in visited:return
        visited.add(address)
        if int(o['class_id'])==class_id:
            b=o['u']['func']['function_bytecode'].dereference()
            if int(b['has_debug']):
                length=int(b['debug']['source_len']);ptr=int(b['debug']['source'])
                if ptr and length>0:
                    source=bytes(gdb.selected_inferior().read_memory(ptr,length));name=source.split(b'(')[0].decode(errors='replace').strip();code=bytes(gdb.selected_inferior().read_memory(int(b['byte_code_buf']),int(b['byte_code_len'])))
                    found.append(dict(path=path,name=name,source_sha256=hashlib.sha256(source).hexdigest(),source_hex=source.hex(),code_hex=code.hex(),arg_count=int(b['arg_count']),var_count=int(b['var_count']),stack_size=int(b['stack_size'])))
        if depth==0:return
        sh=o['shape'].dereference()
        for i in range(int(sh['prop_count'])):
            if int(sh['prop'][i]['flags']) & 48:continue
            val=o['prop'][i]['u']['value']
            if int(val['tag'])!=-1:continue
            fn=val['u']['ptr'].cast(gdb.lookup_type('JSObject').pointer()).dereference()
            walk(fn,depth-1,path+'/'+str(i))
    walk(o,3,'global')
    records.append(dict(phase=phase,functions=found))
class Snap(gdb.Breakpoint):
    def __init__(self,spec,phase):super().__init__(spec,internal=True);self.phase=phase
    def stop(self):
        try:snapshot(self.phase)
        except Exception as e:records.append(dict(phase=self.phase,error=str(e)))
        return False
gdb.execute('set pagination off');gdb.execute('set confirm off');gdb.execute('set disable-randomization off');gdb.execute('handle SIGPROF nostop noprint pass')
if os.environ.get('CALL_BOUNDARY_GDB_BASE')=='1':
    class ClockSnap(gdb.Breakpoint):
        def __init__(self):super().__init__('js_perf_now',internal=True);self.count=0
        def stop(self):
            self.count+=1
            try:snapshot('before' if self.count==1 else 'after')
            except Exception as e:records.append(dict(phase=str(self.count),error=str(e)))
            return False
    ClockSnap()
else:Snap('begin','before');Snap('end','after')
gdb.execute('run')
with open(os.environ['CALL_BOUNDARY_GDB_OUT'],'x') as f:json.dump(records,f,indent=2)
