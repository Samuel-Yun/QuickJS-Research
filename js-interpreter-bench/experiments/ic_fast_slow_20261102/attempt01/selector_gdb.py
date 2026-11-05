"""Read only public compiled target identities from the existing M binary."""
import gdb,json,os,re,hashlib
dest=os.environ['FS_SELECTOR_OUTPUT'];records=[];errors=[]
def atom(rt,a):
    p=rt['atom_array'][a].cast(gdb.lookup_type('JSString').pointer()).dereference();wide=int(p['is_wide_char']);n=int(p['len'])
    data=bytes(gdb.selected_inferior().read_memory(p['u']['str16' if wide else 'str8'].address,n*(2 if wide else 1)))
    return data.decode('utf-16-le' if wide else 'utf-8')
class Root(gdb.Breakpoint):
    def stop(self):
        try:
            if records:return False
            f=gdb.selected_frame()
            if (int(f.read_register('rdx'))&((1<<64)-1))!=(1<<64)-1:return False
            o=f.read_register('rsi').cast(gdb.lookup_type('JSObject').pointer()).dereference()
            if int(o['class_id'])!=int(gdb.parse_and_eval('JS_CLASS_BYTECODE_FUNCTION')):return False
            ctx=f.read_register('rdi').cast(gdb.lookup_type('JSContext').pointer()).dereference();rt=ctx['rt'].dereference()
            def walk(bp):
                b=bp.dereference();name=atom(rt,int(b['func_name']))
                if name in ['m1Read','m2Read','polyRead2']:
                    source=bytes(gdb.selected_inferior().read_memory(b['debug']['source'],int(b['debug']['source_len'])))
                    n=int(b['byte_code_len']);raw=bytes(gdb.selected_inferior().read_memory(b['byte_code_buf'],n))
                    records.append(dict(function=name,source=source.decode(),source_sha256=hashlib.sha256(source).hexdigest(),
                       bytecode_hex=raw.hex(),bytecode_bytes=n,site_count=int(b['read_ic_count']),target_pc={'m1Read':13,'m2Read':12,'polyRead2':1}[name],
                       selector='exact debug source bytes + true opcode PC + atom; one compiled instance required'))
                for i in range(int(b['cpool_count'])):
                    v=b['cpool'][i]
                    if int(v['tag'])==-2:walk(v['u']['ptr'].cast(gdb.lookup_type('JSFunctionBytecode').pointer()))
            walk(o['u']['func']['function_bytecode'])
        except Exception as e:errors.append(str(e))
        return False
gdb.execute('set pagination off');gdb.execute('set disable-randomization off');gdb.execute('set print thread-events off')
Root('*JS_CallInternal',internal=True);gdb.execute('run')
with open(dest,'x') as out:json.dump(dict(targets=records,errors=errors),out,indent=2)
