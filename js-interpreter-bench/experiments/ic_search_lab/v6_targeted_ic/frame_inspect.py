"""Static caller/callee native excerpts for the ordinary-ABI K1 reproduction."""
import experiment as e
rows=[]
for cid in ['s001','K1']:
    a=e.measure.artifact(cid);entry=e.lab.load(e.H/('diagnostics/native.'+cid+'.json'))
    symbol=entry['interpreter_symbol'][0]
    address=int(symbol[0],16)
    r=e.capture(['objdump','-d','--start-address='+hex(address),'--stop-address='+hex(address+192),a['path']],
                'native_inspection',cid+'/interpreter_prologue',30,dict(binary_sha256=a['sha256']))
    value=dict(id=cid,interpreter_prologue=r['stdout'],interpreter_size_bytes=int(symbol[1],16),
                handler_windows_source='diagnostics/native.'+cid+'.json',inference='static only, hot spills/time UNKNOWN')
    helpers=[]
    for helper in entry['update_symbols']:
        r=e.capture(['objdump','-d','--disassemble='+helper[3],a['path']],
                    'native_inspection',cid+'/'+helper[3],30,dict(binary_sha256=a['sha256']))
        helpers.append(dict(symbol=helper,disassembly=r['stdout']))
    value['helpers']=helpers;rows.append(value)
e.save('diagnostics/caller_callee_frames.json',rows)
