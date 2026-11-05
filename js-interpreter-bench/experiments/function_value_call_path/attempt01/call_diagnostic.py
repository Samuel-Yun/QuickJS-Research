"""Only count actual JS_CallInternal entry classification, independent diagnostic copies."""
import difflib,shutil
from common import *
from run import script
from diagnostics import name,TARGET
def one(s,a,b):
    assert s.count(a)==1,(a[:80],s.count(a));return s.replace(a,b,1)
def main():
    verify();source=read(AUDIT/'diagnostic_manifest.json')['artifacts'];manifest={};rows=[]
    for v in ['A','M']:
        src=Path(source[v]['source']);dst=STORE/(v+'_call_diagnostic');attempt=1
        while dst.exists():attempt+=1;dst=STORE/(v+'_call_diagnostic'+str(attempt))
        files=read(HERE/'manifest.json')[v+'_source_files']
        names=set(files)|{'audit_hooks.h','audit_tail.inc'}
        for rel in names:
            p=dst/rel;p.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(src/rel,p)
        old={n:(dst/n).read_text() for n in ['quickjs.c','audit_hooks.h','audit_tail.inc']}
        s=old['audit_hooks.h'];s=one(s,'    unsigned long long operations,ic_queries,hits,misses,cache_probes;','    unsigned long long calls_opcode,calls_bytecode,calls_general;\n    unsigned long long operations,ic_queries,hits,misses,cache_probes;')
        s+='\nstatic _Thread_local AuditSite *audit_pending_call;\nstatic void audit_callsite(JSFunctionBytecode *b,const uint8_t *pc);\n';(dst/'audit_hooks.h').write_text(s)
        s=old['audit_tail.inc'];s+='''
static void audit_callsite(JSFunctionBytecode *b,const uint8_t *pc) {
    AuditFunction *f=audit_function(b);audit_pending_call=NULL;
    if(!f || pc<b->byte_code_buf || pc>=b->byte_code_buf+f->length)return;
    audit_pending_call=&f->sites[pc-b->byte_code_buf];
    audit_pending_call->calls_opcode++;
}
'''
        # Add a separate compact call-site list; property report schema unchanged.
        needle='        fprintf(out,"]}%s",f->next?",":"");'
        replacement='''        fprintf(out,"],\\"calls\\":[");
        unsigned cfirst=1;
        for(unsigned cpc=0;cpc<f->length;cpc++){
            AuditSite *cs=&f->sites[cpc];if(!cs->calls_opcode)continue;
            fprintf(out,"%s{\\"pc\\":%u,\\"opcode\\":\\"%s\\",\\"visits\\":%llu,\\"bytecode_entry\\":%llu,\\"general_entry\\":%llu}",cfirst?"":",",cpc,short_opcode_info(f->before[cpc]).name,cs->calls_opcode,cs->calls_bytecode,cs->calls_general);cfirst=0;
        }
        fprintf(out,"]}%s",f->next?",":"");'''
        s=one(s,needle,replacement);(dst/'audit_tail.inc').write_text(s)
        s=old['quickjs.c']
        anchor='    AuditScope audit_frame __attribute__((cleanup(audit_end)))=audit_pause();'
        s=one(s,anchor,anchor+'\n    AuditSite *audit_entry_call=audit_pending_call;\n    audit_pending_call=NULL;\n    const uint8_t *audit_call_pc=NULL;')
        start=s.index('static JSValue JS_CallInternal(JSContext *caller_ctx,',s.index('#define JS_CALL_FLAG_COPY_ARGV'))
        end=s.index('\n restart:',start);body=s[start:end]
        body=one(body,'    if (unlikely(p->class_id != JS_CLASS_BYTECODE_FUNCTION)) {','    if (unlikely(p->class_id != JS_CLASS_BYTECODE_FUNCTION)) {\n        if(audit_entry_call)audit_entry_call->calls_general++;')
        body=one(body,'    b = p->u.func.function_bytecode;\n\n    if (unlikely(argc', '    if(audit_entry_call)audit_entry_call->calls_bytecode++;\n    b = p->u.func.function_bytecode;\n\n    if (unlikely(argc')
        s=s[:start]+body+s[end:]
        s=one(s,'            call_argc = opcode - OP_call0;','            audit_call_pc=pc-1;\n            call_argc = opcode - OP_call0;')
        for op in ['tail_call','tail_call_method']:
            anchor='        CASE(OP_'+op+'):\n            {\n                call_argc = get_u16(pc);'
            s=one(s,anchor,anchor.replace('                call_argc','                audit_call_pc=pc-1;\n                call_argc'))
        a=s.index('        CASE(OP_call0):');z=s.index('        CASE(OP_array_from):',a);body=s[a:z]
        for call in ['ret_val = JS_CallInternal(ctx, call_argv[-1], JS_UNDEFINED,','ret_val = JS_CallInternal(ctx, call_argv[-1], call_argv[-2],']:
            body=one(body,'                '+call,'                audit_callsite(b,audit_call_pc);\n                '+call)
        s=s[:a]+body+s[z:]
        (dst/'quickjs.c').write_text(s)
        patch=''.join(''.join(difflib.unified_diff(o.splitlines(True),(dst/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n)) for n,o in old.items());save(HERE/'diagnostic'/f'{v}_call_only.patch',patch)
        r=capture(v+'_call_build',['make','-j2','qjs'],cwd=dst);assert r['exit_code']==0
        manifest[v]=dict(binary=str(dst/'qjs'),sha256=sha(dst/'qjs'),parent=source[v],patch_sha256=sha(HERE/'diagnostic'/f'{v}_call_only.patch'),formal=False,source_hashes={n:sha(dst/n) for n in old})
        for case in CASES:
            for n in [1,2]:
                p=STORE/'reports'/f'call.{v}.{case}.N{n}.json';assert not p.exists();env=os.environ.copy();env['IC_MECHANISM_REPORT']=str(p)
                r=capture(f'call.{v}.{case}.N{n}',[dst/'qjs',script(case,n,True)],env=env);assert r['exit_code']==0 and not r['stderr']
                data=p.read_bytes();out=HERE/'raw/call_diagnostic'/f'{v}.{case}.N{n}.json.gz';save(out,gzip.compress(data,mtime=0))
                fs=[f for f in json.loads(data)['functions'] if name(f)==TARGET[case]];assert len(fs)==1
                calls=fs[0]['calls'];expected=0 if case in CASES[:2] else 4096*n
                assert sum(c['visits'] for c in calls)==expected and sum(c['bytecode_entry'] for c in calls)==expected and sum(c['general_entry'] for c in calls)==0
                rows.append(dict(case=case,variant=v,N=n,function=TARGET[case],source_sha256=hashlib.sha256(bytes.fromhex(fs[0]['source_hex'])).hexdigest(),calls=json.dumps(calls),observed_call_opcode=sum(c['visits'] for c in calls),observed_bytecode_entry=sum(c['bytecode_entry'] for c in calls),observed_general_entry=sum(c['general_entry'] for c in calls),raw_sha256=sha(out)))
    save(HERE/'call_diagnostic_manifest.json',manifest);csvout(HERE/'call_counts.csv',rows);save(HERE/'call_gate.json',dict(status='PASS',observed='actual call opcode and callee class branch, specific caller instance+PC',not_observed='CPU self-time, V8 per-access path',scope='registered source-compiled functions only'))
    print('ACTUAL_CALL_BRANCH_GATE_PASS',flush=True)
if __name__=='__main__':main()
