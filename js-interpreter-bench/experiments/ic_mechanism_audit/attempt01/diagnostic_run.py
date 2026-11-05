"""Bounded N=1/2 diagnostics; compressed aggregate snapshots, never formal times."""
import shutil
from common import *
from run import script

def diagnostic(label,case,n,js=None):
    artifact=read(HERE/'diagnostic_manifest.json')['artifacts'][label]
    assert sha(artifact['binary'])==artifact['sha256']
    js=js or script(case,n,True)
    name=f'{label}.{case}.N{n}'
    archived=HERE/'raw/diagnostic'/f'{name}.json.gz'
    if archived.exists():
        identity=read(HERE/'raw/diagnostic'/f'{name}.identity.json')
        assert identity['binary']['sha256']==artifact['sha256'] and identity['script_sha256']==sha(js) and identity['compressed_sha256']==sha(archived)
        return read(archived)
    report=STORE/'reports'/f'{name}.json';report.parent.mkdir(parents=True,exist_ok=True)
    env=os.environ.copy();env['IC_MECHANISM_REPORT']=str(report)
    run=capture('diag_'+name,[artifact['binary'],js],env=env,timeout=180)
    assert run['exit_code']==0 and not run['stderr'],name
    data=report.read_bytes();out=HERE/'raw/diagnostic'/f'{name}.json.gz'
    save(out,gzip.compress(data,mtime=0))
    save(HERE/'raw/diagnostic'/f'{name}.identity.json',dict(binary=artifact,script_relative=js.relative_to(HERE).as_posix(),script_sha256=sha(js),raw_sha256=hashlib.sha256(data).hexdigest(),compressed_sha256=sha(out),uncompressed_bytes=len(data)))
    return json.loads(data)

def function_name(f):
    name=bytes.fromhex(f['function_hex']).decode(errors='replace')
    source=bytes.fromhex(f['source_hex']).decode(errors='replace')
    original=(HERE/'inputs/richards.js').read_text()
    offset=original.find(source) if source else -1
    if not name and offset>=0:
        match=re.search(r'([\w.$]+)\s*=\s*$',original[:offset])
        if match:name=match[1]
    return name

def rows(report,label,case,n):
    out=[]
    for f in report['functions']:
        name=function_name(f)
        source=bytes.fromhex(f['source_hex']);before=bytes.fromhex(f['code_before_hex'])
        for op in f['opcodes']:
            if op['ic_read_stats_instrumented']:
                assert op['ic_queries']==op['hits']+op['misses'],(label,case,name,op)
            if not op['operations']:continue
            out.append(dict(variant=label,case=case,N=n,instance_id=f['instance_id'],function=name,raw_function_name=bytes.fromhex(f['function_hex']).decode(errors='replace'),source_sha256=hashlib.sha256(source).hexdigest(),code_before_sha256=hashlib.sha256(before).hexdigest(),atom=bytes.fromhex(op['atom_hex']).decode(errors='replace'),**{k:v for k,v in op.items() if k!='atom_hex'}))
    return out

def main():
    verify_runtime();allrows=[];targets=[]
    for label in ['A','B','M']:
        for case in [CASES[0],CASES[2]]:
            for n in [1,2]:
                data=diagnostic(label,case,n);rr=rows(data,label,case,n);allrows+=rr
                fn='m1Read' if case==CASES[0] else 'TaskControlBlock.prototype.isHeldOrSuspended'
                selected=[r for r in rr if r['function']==fn]
                assert selected,(label,fn)
                if case==CASES[0]:
                    selected=[r for r in selected if r['atom']=='x'];assert len(selected)==1
                    s=selected[0];assert s['operations']==4096*n
                    assert s['value_int']==s['operations']
                    if label=='A':assert s['find_normal']==s['operations'] and not s['ic_queries']
                    if label=='M':assert s['ic_queries']==s['operations'] and s['hits']==s['operations']-1 and s['find_normal']==1
                    if label=='B':assert s['ic_queries']==s['operations']-1 and s['hits']==s['ic_queries'] and s['find_with_offset']==1
                else:
                    selected=sorted([r for r in selected if r['atom']=='state'],key=lambda r:r['pc']);assert len(selected)==2
                    assert [r['operations'] for r in selected]==[10671*n,10115*n]
                targets+=selected
                dest=HERE/'bytecode'/case/f'{label}.N{n}.md'
                lines=[f'# {label} {case} N={n}: final compiled bytes before execution / before function free',
                       'Diagnostic binary only; offsets are real opcode starts. Source identity and instance are recorded. Atom IDs/site indices are process-local.\n']
                for f in data['functions']:
                    name=function_name(f)
                    if name!=fn:continue
                    lines += [f'## {name}, instance {f["instance_id"]}',f'Source SHA256: {hashlib.sha256(bytes.fromhex(f["source_hex"])).hexdigest()}',
                              '```javascript',bytes.fromhex(f['source_hex']).decode(errors='replace'),'```',
                              '```text','pc size before-op before-operand -> after-op after-operand [property]']
                    for op in f['opcodes']:
                        atom=bytes.fromhex(op['atom_hex']).decode(errors='replace')
                        args=f'{op["operand_before"]} -> {op["after_op"]} {op["operand_after"]}' if op['size']>=5 else f'-> {op["after_op"]}'
                        lines.append(f'{op["pc"]:4} {op["size"]} {op["before_op"]} {args} [{atom}]')
                    lines+=['```','For non-5-byte operands see the raw hex below; zero exported operand is not a decoded immediate.',
                            'before: `'+f['code_before_hex']+'`','after: `'+f['code_after_hex']+'`']
                save(dest,'\n'.join(lines)+'\n')
    csvout(HERE/'diagnostic_sites.csv',allrows);csvout(HERE/'mechanism_sites.csv',targets)
    regression=[]
    for name in ['read_semantics.js','site_regression.js','legacy_regression.js','multislot.js']:
        src=MIC/'correctness'/name;dst=HERE/'inputs/regression'/name;save(dst,src.read_bytes())
        for label in ['A','M','B']:
            binary=prefixes()['QJS_'+label][0] if label!='B' else read(OLD/'build_manifest.json')['artifacts']['B']['path']
            r=capture('regression_'+label+'_'+name,[binary,dst],timeout=180)
            regression.append(dict(variant=label,test=name,exit_code=r['exit_code'],valid=r['exit_code']==0 and not r['stderr'],stdout=r['stdout']))
    csvout(HERE/'regression.csv',regression);assert all(r['valid'] for r in regression)
    # Scope restoration after getter re-entry and exceptions; not a benchmark variant.
    context=HERE/'inputs/regression/context_scope.js'
    save(context,"""function inner(o){return o.z;}\nfunction outer(o){return o.x;}\nfunction after(o){return o.y;}\nvar gets=0, obj={get x(){gets++;if(gets===2)throw Error('sentinel');return inner({z:7});}};\nif(outer(obj)!==7)throw Error('getter');\ntry{outer(obj);throw Error('missing throw');}catch(e){if(e.message!=='sentinel')throw e;}\nif(after({y:9})!==9||gets!==2)throw Error('after');\nconsole.log('CONTEXT_PASS');\n""")
    for label in ['A','B','M']:
        data=diagnostic(label,'context_scope',1,context);rr=rows(data,label,'context_scope',1)
        for fn,atom,count in [('inner','z',1),('outer','x',2),('after','y',1)]:
            s=[r for r in rr if r['function']==fn and r['atom']==atom];assert len(s)==1 and s[0]['operations']==count
        csvout(HERE/'raw/diagnostic'/f'{label}.context_sites.csv',rr)
    save(HERE/'mechanism_gate.json',dict(status='PASS',diagnostic_processes=15,release_regression_processes=len(regression),N1_N2_checked=True,scope_reentry_exception_checked=True,queries_equal_hits_plus_misses='read opcodes only; write hit counts NOT instrumented',formal_performance=False))
    print('MECHANISM_GATE_PASS',flush=True)
if __name__=='__main__':main()
