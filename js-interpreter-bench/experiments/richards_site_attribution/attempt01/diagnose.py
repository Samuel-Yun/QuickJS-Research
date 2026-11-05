"""Small additional diagnostics, not new benchmark samples."""
import collections
import os
import re
from pathlib import Path
import run as r
import analyze as a
HERE,ROOT,save,read,sha=r.HERE,r.ROOT,r.save,r.read,r.sha

def main():
    # Exercise getter reentry and exception propagation without relying on names
    # to assert context restoration. Actual nested property counters must differ.
    p=HERE/'probes/context_safety.js';out=HERE/'raw/context_safety'
    env=dict(os.environ,SA_OUT=str(out),SA_CONTEXT='1',SA_COUNT='1',SA_INTERVAL_US='0')
    rr=r.capture(HERE/'raw/context_safety.json',r.command('quickjs',p,True),env=env)
    assert rr['exit_code']==0 and 'CONTEXT_SAFETY PASS' in rr['stdout'],rr
    ss=[a.integerize(x) for x in a.rows(HERE/'raw/context_safety.sites.csv')]
    chosen={x['property']:x for x in ss if x['ops'] and x['property'] in ('first','second','inner','ok')}
    assert set(chosen)=={'first','second','inner','ok'}
    for name in ('first','second'):
        assert chosen[name]['ops']==1 and chosen[name]['fallback']==1 and chosen[name]['probes']==2
    for name in ('inner','ok'):
        assert chosen[name]['ops']==1 and chosen[name]['fallback']==0 and chosen[name]['probes']==1
    save(HERE/'summary/context_safety.json',dict(status='PASS',nested_getter_and_exception=True,sites=chosen,
        scope='test fixture native metadata/counters; no claim of universal exotic/generator coverage'))
    # Verify actual flag existence in saved help before a bounded diagnostic run.
    helptext=read(r.OLD/'raw/v8_help.json')['stdout']
    flags=['--allow-natives-syntax','--log-ic']
    for flag in flags:assert flag+' (' in helptext
    save(HERE/'source_evidence/v8_diagnostic_flags.txt','\n'.join(line for line in helptext.splitlines() if any(flag+' (' in line for flag in flags))+'\n')
    # Original workload bytes remain unchanged; appended inspection after timer.
    # Same flags plus diagnostic-only printing/logging, never formal time.
    for n in (1,32):
        p=HERE/'scripts'/f'DIAGNOSTIC_v8_feedback.N{n}.js'
        inspect="""
console.log('FEEDBACK isHeldOrSuspended');
%DebugPrint(TaskControlBlock.prototype.isHeldOrSuspended);
console.log('FEEDBACK schedule');
%DebugPrint(Scheduler.prototype.schedule);
"""
        save(p,r.source(n)+inspect.encode())
        log=HERE/'raw'/f'v8_ic_N{n}.log'
        rr=r.capture(HERE/'raw'/f'v8_feedback_N{n}.json',r.command('v8',p,extra=tuple(flags+['--no-logfile-per-isolate','--logfile='+str(log)])),timeout=60)
        r.check(rr)
        save(HERE/'bytecode'/f'v8_feedback_N{n}.txt',rr['stdout']+'\nSTDERR\n'+rr['stderr'])
        print('V8_FEEDBACK',n,rr['exit_code'],len(rr['stdout']),flush=True)
    # Dump and IC transition addresses from ONE process (ASLR addresses from
    # different logs/dumps must never be compared as if they were identical).
    assert '--log-code (' in helptext
    log=HERE/'raw/v8_selected_site.log'
    rr=r.capture(HERE/'raw/v8_selected_site.json',r.command('v8',HERE/'scripts/DIAGNOSTIC_v8_feedback.N32.js',
        extra=('--allow-natives-syntax','--log-ic','--log-code','--no-logfile-per-isolate',
               '--logfile='+str(log),'--print-bytecode','--print-bytecode-filter=TaskControlBlock.isHeldOrSuspended')),timeout=60)
    r.check(rr)
    save(HERE/'bytecode/v8_selected_site.same_process.txt',rr['stdout'])
    # The inferred display name is NOT accepted by this binary's exact-name
    # filter for this anonymous function. Keep that attempt, then dump '*'.
    log=HERE/'raw/v8_selected_site_full.log'
    rr=r.capture(HERE/'raw/v8_selected_site_full.json',r.command('v8',HERE/'scripts/DIAGNOSTIC_v8_feedback.N32.js',
        extra=('--allow-natives-syntax','--log-ic','--log-code','--no-logfile-per-isolate',
               '--logfile='+str(log),'--print-bytecode','--print-bytecode-filter=*')),timeout=60)
    r.check(rr)
    save(HERE/'bytecode/v8_selected_site_full.same_process.txt',rr['stdout'])
    # New actual binary's machine code + inline location proof.
    rr=r.capture(HERE/'raw/native_disassembly.json',['objdump','-d','-S','-l','-M','intel','--disassemble=JS_CallInternal',str(r.BUILD/'qjs')])
    assert rr['exit_code']==0
    save(HERE/'source_evidence/JS_CallInternal.diagnostic.disassembly.txt',rr['stdout'])
    for name in ('sa_begin','sa_frame_begin','sa_frame_end'):
        rr=r.capture(HERE/'raw'/f'native_{name}.json',['objdump','-d','-S','-l','-M','intel','--disassemble='+name,str(r.BUILD/'qjs')])
        save(HERE/'source_evidence'/(name+'.disassembly.txt'),rr['stdout'])
    source=(r.BUILD/'quickjs.c').read_text().splitlines()
    # Inventory all find-own references, including sources not active in this run.
    inventory=[]
    for line,text in enumerate(source,1):
        if re.search(r'\bfind_own_property\s*\(',text):inventory.append(dict(diagnostic_line=line,text=text.strip()))
    r.export(HERE/'mapping/find_own_source_inventory.csv',inventory)
    print('CONTEXT_SAFETY_PASS',flush=True)

if __name__=='__main__':main()
