"""Read-only old evidence associations and fixed-source excerpts, after sampling."""
import csv, json, re
from pathlib import Path
import common as c

def main():
    old=c.ROOT/'experiments/whitebox_analysis/attempt01';refs={}
    for name in ('results.md','audit.json','protocol.md','capabilities.json','cases/richards/evidence.md','summary/function_counts.csv','summary/jsc_function_samples.csv','summary/v8_top_pc.csv','bytecode/original.richards.jsc.txt','source_evidence/qjs.field.txt','source_evidence/jsc.LLInt.access.txt'):
        p=old/name
        refs[str(p.relative_to(c.ROOT))]={'sha256_current_bytes':c.sha(p),'historical_recorded_bytes_proof':'separate input-byte audit; current hash is not relabeled as historical run hash'}
    for folder in (old/'profiles').glob('Richards.Richards.*'):
        for p in folder.glob('*'):
            if p.is_file() and (p.name in ('v8.log','top_pc.json','stderr.txt','stdout.txt')): refs[str(p.relative_to(c.ROOT))]={'sha256_current_bytes':c.sha(p),'scope':'whole-process; original N512; pre-existing profiles only'}
    c.save(c.HERE/'source_evidence/reused_evidence.json',refs)
    for name in ('function_counts','jsc_function_samples','v8_top_pc'):
        with (old/f'summary/{name}.csv').open(newline='') as f:
            rows=[r for r in csv.DictReader(f) if 'Richards.Richards' in json.dumps(r)]
        c.export(c.HERE/f'source_evidence/old_richards_{name}.csv',rows)
    q=Path(c.manifest()['runtime']['engines']['quickjs']['binary']['path']).parent/'quickjs.c'
    lines=q.read_text().splitlines();source_hash=c.sha(q)
    for name,a,b in [('property.inline',19107,19170),('property.fallback',8210,8345),('call.entry',17746,17872),('call.method',18220,18239),('call.intrinsic',41240,41248)]:
        c.save(c.HERE/f'source_evidence/qjs.{name}.txt','Upstream revision04be246001599f5995fa2f2d8c91a0f198d3f34c\n'+str(q)+'\nSHA256='+source_hash+'\n'+''.join(f'{i}: {lines[i-1]}\n' for i in range(a,b+1)))
    src=(c.HERE/'source_evidence/original.richards.js').read_text().splitlines()
    patterns=[('Scheduler.schedule -> predicate','Scheduler.prototype.schedule','TaskControlBlock','TaskControlBlock.prototype.isHeldOrSuspended','prototype','state is own'),('Scheduler.schedule -> run','Scheduler.prototype.schedule','TaskControlBlock','TaskControlBlock.prototype.run','prototype','selected inherited method; currentTcb is own scheduler property'),('TCB.run -> task.run','TaskControlBlock.prototype.run','IdleTask/WorkerTask/HandlerTask/DeviceTask','four task prototype run methods','prototype','task is own TCB field; four function targets'),('Task/queue -> Packet.addTo','Packet.prototype.addTo','Packet','Packet.prototype.addTo','prototype','link/id/kind/a1/a2 are own')]
    sites=[]
    for site,caller,receiver,target,storage,note in patterns:
        indexes=[i+1 for i,s in enumerate(src) if caller+' =' in s]
        sites.append({'site':site,'definition_line':indexes[0] if indexes else None,'receiver':receiver,'target':target,'method_storage':storage,'input_mutation':'data/state changes; no method/prototype replacement after definitions','note':note})
    c.export(c.HERE/'source_evidence/sites.csv',sites)
    # Useful cross-engine excerpts, with actual instruction addresses/metadata.
    for v in ('A','B'):
        for e in c.ENGINES:
            p=c.HERE/f'diagnostics/bytecode/{v}.{e}.txt';text=p.read_text()
            if e=='quickjs':
                i=text.index('function: mlSchedule');end=text.find('\n/mnt/',i);block=text[i:end]
            elif e=='jsc':
                i=text.index('mlSchedule#'); end=text.find('\nIdentifiers:',i)
                block=text[i:end if end>=0 else i+10000]
            else: block=text
            c.save(c.HERE/f'source_evidence/{v}.{e}.schedule_bytecode.txt',block)
    print('SOURCE_AND_REUSED_PROFILE_ASSOCIATIONS_SAVED',flush=True)

if __name__=='__main__': main()
