"""Bounded debugger view of frozen Release handlers, never timed samples."""
import os
from pathlib import Path
import run
lab=run.lab;HERE=run.HERE
if __name__=='__main__':
    run.gate();os.sched_setaffinity(0,{2});results=[]
    for label in ['A','M','s001','s004']:
        art=run.measure.artifact(label);assert lab.sha(art['path'])==art['sha256']
        syms=lab.capture(['nm','-S','--defined-only',art['path']],'native_symbols',label,20,dict(binary_sha256=art['sha256']))
        candidates=[line.split()[-1] for line in syms['stdout'].splitlines() if line.split() and line.split()[-1].startswith('dispatch_table')]
        if len(candidates)!=1:
            results.append(dict(label=label,status='UNKNOWN_DISPATCH_SYMBOL',symbols=candidates));continue
        table=candidates[0];op='OP_get_field' if label=='A' else 'OP_get_field_rdi'
        cmd=['gdb','-nx','-batch','-ex','set auto-load off','-ex','set pagination off','-ex','set disable-randomization off',
            '-ex','file '+art['path'],'-ex','set args -e 0','-ex','break JS_CallInternal','-ex','run',
            '-ex',"set $table = (void **)&'"+table+"'",'-ex','p/x '+op,'-ex','p/x $table['+op+']',
            '-ex','disassemble /r $table['+op+'], $table['+op+']+640']
        r=lab.capture(cmd,'native_handler',label,40,dict(binary_sha256=art['sha256'],table_symbol=table,opcode=op,
            caveat='Debugger stops its own -e0 inferior; no performance/warmup sample; addresses belong only to this Release image and process.'))
        lab.save(HERE/('native_'+label+'.txt'),r['stdout'])
        results.append(dict(label=label,exit_code=r['exit_code'],status='DUMP_AVAILABLE' if r['exit_code']==0 else 'UNKNOWN_DEBUGGER_COMMAND',
            token=r['token'],binary_sha256=art['sha256'],output='native_'+label+'.txt',stderr=r['stderr']))
        assert lab.sha(art['path'])==art['sha256']
    lab.save(HERE/'native_manifest.json',dict(results=results,performance_data=False));print(results,flush=True)
