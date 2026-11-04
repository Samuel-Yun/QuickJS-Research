"""Reuse audited property scopes; add explicit stages and bounded shape evidence.
All mutations are to independent diagnostic copies, never frozen runtimes.
"""
from common import *
import importlib.util,shutil,difflib,gzip,collections,sys
OLD=ROOT/'experiments/ic_mechanism_audit/attempt01'
PHASES=['load_compile','setup','run','validation','teardown','destroy']
DIAG=HERE/'diagnostic_v3'
MANIFEST=HERE/'diagnostic_v3_manifest.json'
def build():
    spec=importlib.util.spec_from_file_location('old_diag_builder',OLD/'diagnostic_build.py')
    mod=importlib.util.module_from_spec(spec);spec.loader.exec_module(mod)
    identities={}
    for label in ['A','M']:
        out=DIAG/f'{label}.build.json'
        if out.exists():identities[label]=read(out);continue
        previous=HERE/'diagnostic_v2'/f'{label}.build.json'
        if previous.exists():
            info=read(previous);artifact=Path(info['path'])
            if artifact.exists() and sha(artifact)==info['sha256'] and artifact.open('rb').read(4)==b'\x7fELF':
                check=capture([artifact,'-e','console.log(123)'],label+' verified diagnostic reuse')
                if check['exit_code']==0 and check['stdout']=='123\n' and not check['stderr']:
                    save(DIAG/(label+'.reuse.json'),check);save(out,info);identities[label]=info;continue
        src=Path(read(HERE/'runtime.json')['sources'][label]['path']);dst=STORE/(label+'_diag')
        serial=1
        while dst.exists():serial+=1;dst=STORE/(label+'_diag'+str(serial))
        names=list(read(HERE/'runtime.json')['sources'][label]['files'])
        if label=='M':names=list(read(OLD/'sources.json')['M_source_files'])
        else:
            # The fixed official Makefile needs its full public source inputs.
            names=[p.name for p in src.iterdir() if p.is_file() and (p.suffix in ['.c','.h','.inc','.json','.js','.mjs'] or p.name in ['Makefile','VERSION','LICENSE'])]
        for f in names:
            p=dst/f;p.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(src/f,p)
        for f in ['audit_hooks.h','audit_tail.inc']:shutil.copyfile(OLD/'diagnostic'/f,dst/f)
        originals={f:(dst/f).read_text() for f in ['quickjs.c','qjs.c']+(['read_ic_opcodes.inc','read_ic_runtime.inc','read_ic_types.h'] if label=='M' else [])}
        mod.instrument(label,dst)
        h=(dst/'audit_hooks.h').read_text()
        h=one(h,'    char *atom;','    unsigned long long retains,releases,reasons[8];\n    struct SPShapes *shapes;\n    char *atom;')
        h=one(h,'    AuditSite *sites;','    AuditSite *sites;\n    AuditSite *phases[6];\n    unsigned focus;')
        h+='\nstatic unsigned sp_phase;\nstatic unsigned long long sp_outside_find[6],sp_all_find[6],sp_all_retains[6],sp_all_releases[6];\n'
        h+='static void sp_receiver(JSContext*,JSValueConst,JSAtom);\nstatic void sp_reason(const char*);\nstatic void sp_maint(int k){if(k){sp_all_releases[sp_phase]++;if(audit_active)audit_active->releases++;}else{sp_all_retains[sp_phase]++;if(audit_active)audit_active->retains++;}}\n'
        h=one(h,'static void audit_lookup(int kind) { if(audit_active)', 'static void audit_lookup(int kind) { sp_all_find[sp_phase]++;if(!audit_active)sp_outside_find[sp_phase]++; if(audit_active)')
        # Definitions used by audit_lookup must precede that function.
        decl='static unsigned sp_phase;\nstatic unsigned long long sp_outside_find[6],sp_all_find[6],sp_all_retains[6],sp_all_releases[6];\n'
        h=h.replace(decl,'');h=h.replace('static _Thread_local AuditSite *audit_active;',decl+'static _Thread_local AuditSite *audit_active;')
        h=one(h,'    struct AuditFunction *next;','    struct AuditFunction *next,*hash_next;')
        h=h.replace('    AuditSite *sites;','    AuditSite **sites;').replace('    AuditSite *phases[6];','    AuditSite **phases[6];')
        h=one(h,'static AuditFunction *audit_functions;','static AuditFunction *audit_functions;\nstatic AuditFunction *audit_buckets[4096];')
        (dst/'audit_hooks.h').write_text(h)
        t=(dst/'audit_tail.inc').read_text()
        t=one(t,'    f->next=audit_functions;', '    if(f->source && memmem(f->source,f->source_len,"dummy = left = right",20))f->focus=1;\n    f->next=audit_functions;')
        t=one(t,'unsigned offset=pc-b->byte_code_buf;AuditSite *s=&f->sites[offset];s->operations++;audit_active=s;',
          'unsigned offset=pc-b->byte_code_buf;\n    if(!f->phases[sp_phase]){f->phases[sp_phase]=calloc(f->length,sizeof(AuditSite));if(!f->phases[sp_phase])abort();}\n    AuditSite *s=&f->phases[sp_phase][offset];s->atom=f->sites[offset].atom;s->pc=offset;s->operations++;audit_active=s;')
        # Replace report with compact per-active-site per-phase data, retaining full canonical dump metadata.
        t=t[:t.index('void audit_report(void)')]+(HERE/'diagnostic/report.inc').read_text()
        t+='\n'+(HERE/'diagnostic/shapes.inc').read_text()
        t=one(t,'    for(AuditFunction *f=audit_functions;f;f=f->next)if(!f->freed && f->b==b)return f;',
          '    for(AuditFunction *f=audit_buckets[((uintptr_t)b>>4)&4095];f;f=f->hash_next)if(!f->freed && f->b==b)return f;')
        t=one(t,'    f->next=audit_functions;',
          '    unsigned bucket=((uintptr_t)b>>4)&4095;f->hash_next=audit_buckets[bucket];audit_buckets[bucket]=f;\n    f->next=audit_functions;')
        t=one(t,'        f->sites[pc].pc=pc;','        /* sparse: no counters for non-property opcodes */')
        t=one(t,'        if(atom!=JS_ATOM_NULL)f->sites[pc].atom=audit_atom(ctx,atom);',
          '        if(atom!=JS_ATOM_NULL){f->sites[pc]=calloc(1,sizeof(AuditSite));if(!f->sites[pc])abort();f->sites[pc]->atom=audit_atom(ctx,atom);}')
        t=t.replace('calloc(f->length,sizeof(AuditSite))','calloc(f->length,sizeof(AuditSite*))')
        t=one(t,'    AuditSite *s=&f->phases[sp_phase][offset];s->atom=f->sites[offset].atom;s->pc=offset;s->operations++;audit_active=s;',
          '    if(!f->phases[sp_phase][offset]){f->phases[sp_phase][offset]=calloc(1,sizeof(AuditSite));if(!f->phases[sp_phase][offset])abort();}\n    AuditSite *s=f->phases[sp_phase][offset];s->atom=f->sites[offset]?f->sites[offset]->atom:NULL;s->pc=offset;s->operations++;audit_active=s;')
        t=t.replace('if(f->sites[pc].atom)audit_hex(out,f->sites[pc].atom,strlen(f->sites[pc].atom));',
          'if(f->sites[pc] && f->sites[pc]->atom)audit_hex(out,f->sites[pc]->atom,strlen(f->sites[pc]->atom));')
        t=t.replace('AuditSite *s=&f->phases[phase][pc];if(!s->operations)continue;',
          'AuditSite *s=f->phases[phase][pc];if(!s||!s->operations)continue;')
        (dst/'audit_tail.inc').write_text(t)
        p=dst/'quickjs.c';s=p.read_text()
        # All shape allocation/clone/resize paths call add_gc_object. Every allocation receives a new generation;
        # no diagnostic shape references are retained. Pointer reuse overwrites the generation mapping.
        s='static void sp_shape_birth(void *ptr);\n'+s
        pattern=r'(static void add_gc_object\(JSRuntime \*rt, JSGCObjectHeader \*h,[^{};]+\)\n\{)'
        s,n=re.subn(pattern,r'\1\n    if(type==JS_GC_OBJ_TYPE_SHAPE)sp_shape_birth(h);',s);assert n==1,n
        a=s.index('#define GET_FIELD_INLINE(');z=s.index('        CASE(OP_get_field):',a);v=s[a:z]
        v=one(v,'                obj = sp[-1];','                obj = sp[-1];                                           \\\n                sp_receiver(ctx,obj,atom);')
        s=s[:a]+v+s[z:];p.write_text(s)
        if label=='M':
            p=dst/'read_ic_opcodes.inc';s=p.read_text();s=one(s,'        RDI_QUERY();','        RDI_QUERY();                                                    \\\n        sp_receiver(ctx,obj,site->atom);');p.write_text(s)
            p=dst/'read_ic_types.h';s=p.read_text();s=one(s,'#define RDI_REASON(field) ((void)0)','#define RDI_REASON(field) sp_reason(#field)');p.write_text(s)
            p=dst/'read_ic_runtime.inc';s=p.read_text();s=s.replace('    js_dup_shape(shape);','    sp_maint(0);\n    js_dup_shape(shape);')
            s=one(s,'    js_free_shape_null(ctx->rt, s->shape);','    if(s->shape)sp_maint(1);\n    js_free_shape_null(ctx->rt, s->shape);')
            s=one(s,'        js_free_shape_null(rt, s->shape);','        if(s->shape)sp_maint(1);\n        js_free_shape_null(rt, s->shape);');p.write_text(s)
        p=dst/'qjs.c';s=p.read_text();s=one(s,'extern void audit_report(void);','extern void audit_report(void);\nextern void sp_install(JSContext*);\nextern void sp_destroy(void);')
        s=one(s,'        js_std_add_helpers(ctx, argc - optind, argv + optind);','        js_std_add_helpers(ctx, argc - optind, argv + optind);\n        sp_install(ctx);')
        # This is the main's final cleanup, after all extra validation and output.
        cleanup='    JS_FreeContext(ctx);\n    JS_FreeRuntime(rt);'
        assert s.count(cleanup)==2
        s=s.replace(cleanup,'    sp_destroy();\n'+cleanup);p.write_text(s)
        patch=''.join(''.join(difflib.unified_diff(old.splitlines(True),(dst/f).read_text().splitlines(True),fromfile='a/'+f,tofile='b/'+f)) for f,old in originals.items())
        save(DIAG/f'{dst.name}.diagnostic.patch',patch)
        r=capture(['make','-j2','qjs'],label+' independent diagnostic build',cwd=dst,timeout=300)
        save(HERE/'raw/build'/f'{dst.name}.diagnostic.json',r);assert r['exit_code']==0,r['stderr'][-4000:]
        with (dst/'qjs').open('rb') as f:os.fsync(f.fileno())
        os.sync()
        assert (dst/'qjs').open('rb').read(4)==b'\x7fELF'
        smoke=capture([dst/'qjs','-e','console.log(123)'],label+' new diagnostic executable smoke')
        save(DIAG/(label+'.smoke.json'),smoke);assert smoke['exit_code']==0 and smoke['stdout']=='123\n' and not smoke['stderr']
        info=dict(path=str(dst/'qjs'),sha256=sha(dst/'qjs'),source=str(dst),formal=False,phase_count=6,
          source_sha256={p.name:sha(p) for p in dst.iterdir() if p.is_file() and p.suffix in ['.c','.h','.inc']})
        save(out,info);identities[label]=info;print('DIAGNOSTIC_BUILT',label,flush=True)
    save(MANIFEST,identities)

def script(case,n,focus=False):
    catalog=read(PREV/'octane/case_catalog.json');r=next(x for x in catalog if x['case']==case)
    inp=PREV/'octane/inputs';parts=[(inp/'adapter.js').read_bytes()]
    if r['suite']=='Crypto':parts.append((inp/'crypto_preload.js').read_bytes())
    parts.extend((inp/'octane'/f).read_bytes() for f in r['files'])
    s=(inp/'driver.js').read_text().replace('__CONFIG__',json.dumps(dict(case=case,N=n,phase='diagnostic'))).replace('__SUITE__',json.dumps(r['suite'])).replace('__INDEX__',str(r['index'])).replace('__BENCHMARK__',json.dumps(r['benchmark']))
    s=s.replace("  if(suite.name!=='Crypto')",'  __spStage(1);\n  if(suite.name!==\'Crypto\')')
    s=s.replace('  var started=now();','  __spStage(2);\n  var started=now();')
    s=s.replace('  var stopped=now();','  var stopped=now();\n  __spStage(3);')
    s=s.replace('  test.TearDown();','  __spStage(4);\n  test.TearDown();')
    parts.append(s.encode());p=HERE/'diagnostic/scripts'/f'{case}.N{n}.js';save(p,b'\n;\n'.join(parts));return p
def collect():
    pin();manifest=read(MANIFEST);rows=[];new_count=0
    limit=int(os.environ.get('SP_MAX_NEW','68'))
    blocked=read(HERE/'diagnostic_blocked.json')['positions'] if (HERE/'diagnostic_blocked.json').exists() else {}
    cases=[r['case'] for r in read(PREV/'octane/case_catalog.json') if r['suite']!='Box2D'];assert len(cases)==17
    for case in cases:
        for n in [1,2]:
            for label in ['A','M']:
                name=f'{case}.{label}.N{n}';out=DIAG/'raw'/(name+'.json.gz');rec=DIAG/'raw'/(name+'.process.json')
                if out.exists():continue
                if name in blocked:continue
                p=script(case,n);report=STORE/'reports_v2'/(name+'.json');report.parent.mkdir(parents=True,exist_ok=True)
                attempt=1
                while report.exists():attempt+=1;report=STORE/'reports_v2'/(name+f'.attempt{attempt}.json')
                cmd=[manifest[label]['path']]
                if case=='zlib.zlib':cmd+=['--std','-I',str(PREV/'octane/inputs/zlib_read.js')]
                cmd.append(str(p));r=capture(cmd,name,env=dict(os.environ,IC_MECHANISM_REPORT=str(report)),timeout=600)
                r.update(case=case,condition=label,repetitions=n,script_sha256=sha(p),binary_sha256=manifest[label]['sha256'],performance_sample=False)
                r['diagnostic_attempt']=attempt
                if rec.exists():rec=DIAG/'raw'/(name+f'.attempt{attempt}.process.json')
                save(rec,r);assert r['exit_code']==0 and not r['stderr'],name+str(r)[-1200:]
                data=report.read_bytes();save(out,gzip.compress(data,mtime=0))
                save(DIAG/'raw'/(name+'.archive.json'),dict(raw_sha256=hashlib.sha256(data).hexdigest(),compressed_sha256=sha(out),raw_bytes=len(data)))
                print('DIAGNOSTIC',name,len(data),flush=True)
                new_count+=1
                if new_count>=limit:
                    print('BOUNDED_DIAGNOSTIC_CHUNK',new_count,flush=True);return
    if not (DIAG/'gate.json').exists():summarize()
def summarize():
    rows=[];phase_totals=[];maps=[]
    for p in sorted((DIAG/'raw').glob('*.json.gz')):
        d=json.loads(gzip.decompress(p.read_bytes()));name=p.name[:-8];n=int(name.rsplit('.N',1)[1]);label=name.rsplit('.N',1)[0].rsplit('.',1)[1];case=name.rsplit('.N',1)[0].rsplit('.',1)[0]
        for phase in range(6):
            total=collections.Counter()
            for f in d['functions']:
                source=bytes.fromhex(f['source_hex']);source_sha=hashlib.sha256(source).hexdigest();fn=bytes.fromhex(f['function_hex']).decode(errors='replace')
                canon=[]
                for op in f['opcodes']:
                    atom=bytes.fromhex(op['atom_hex']).decode(errors='replace');opname=op['before_op'].replace('_rdi','')
                    canon.append([op['pc'],op['size'],opname,atom])
                    for st in op.get('phases',[]):
                        if st['phase']!=phase:continue
                        counters={k:v for k,v in st.items() if isinstance(v,int) and k not in ['phase']}
                        if 'get_field' in op['before_op'] or op['before_op']=='get_length':
                            assert st['ic_queries']==st['hits']+st['misses']
                            if label=='M' and '_rdi' in op['before_op']:assert st['operations']==st['ic_queries']
                            total.update(counters)
                        rows.append(dict(case=case,condition=label,repetitions=n,phase=PHASES[phase],function=fn,source_sha256=source_sha,instance_id=f['instance_id'],pc=op['pc'],opcode=op['before_op'],atom=atom,**counters))
                if phase==0:maps.append(dict(case=case,condition=label,repetitions=n,instance_id=f['instance_id'],function=fn,source_sha256=source_sha,canonical_ops_sha256=hashlib.sha256(json.dumps(canon,separators=(',',':')).encode()).hexdigest()))
            keys=['operations','ic_queries','hits','misses','updates','insertions','replacements','same_shape_updates','find_normal','bucket_loads','chain_probes','generic_get','retains','releases','own_miss','descriptor','special','unhashed','inherited','missing','primitive']
            phase_totals.append(dict(case=case,condition=label,repetitions=n,phase=PHASES[phase],**{k:total[k] for k in keys},all_context_find=d['global_by_phase'][phase]['all_find'],outside_property_context_find=d['global_by_phase'][phase]['outside_find']))
    csvout(DIAG/'sites.csv',rows);csvout(DIAG/'phase_totals.csv',phase_totals);csvout(DIAG/'function_mapping.csv',maps)
    actual=len(list((DIAG/'raw').glob('*.json.gz')))
    save(DIAG/'gate.json',dict(status='PASS' if actual==68 else 'INCOMPLETE',processes=actual,expected=68,scope=PHASES,performance_inference=False,shape_focus_pending=True))
    print('PHASE_DIAGNOSTICS_PASS',len(rows),flush=True)
if __name__=='__main__':globals()[sys.argv[1]]()
