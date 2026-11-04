"""Independent diagnostic/controller builds. Frozen A/M/d8 are read-only."""
from common import *
import difflib,importlib.util,sys

def copy_source(src,dst):
    assert not dst.exists(), 'keep failed build; use another build revision'
    dst.mkdir(parents=True)
    for p in src.iterdir():
        if p.is_file() and (p.suffix in ['.c','.h','.inc','.js','.mjs'] or p.name in ['Makefile','VERSION','LICENSE']):
            shutil.copyfile(p,dst/p.name)

def spec_text():
    f=read(OLD/'diagnostic/splay_final_dump.json')[0]
    source=bytes.fromhex(f['source_hex'])
    assert hashlib.sha256(source).hexdigest()=='138762086ed599b42111191883e57a62e65533df210601253b636eddb39abd43'
    text='static const char sp_target_source[]='+json.dumps(source.decode())+';\n'
    code=bytes.fromhex(f['code_before_hex']);ops=f['opcodes'];pc=0
    for op in ops:assert op['pc']==pc;pc+=op['size']
    assert pc==len(code)
    selected=[next(op for op in ops if op['pc']==p) for p in [43,138,147]]
    assert [x['before_op'] for x in selected]==['get_field_rdi']*3
    text+='static const unsigned sp_control_pcs[3]={43,138,147};\n'
    text+='static const unsigned sp_control_indices[3]={'+','.join(str(int.from_bytes(code[x['pc']+1:x['pc']+5],'little')) for x in selected)+'};\n'
    text+='static const unsigned sp_expected_length='+str(len(code))+';\n'
    text+='static const unsigned char sp_expected_code[]={'+','.join(str(c) for c in code)+'};\n'
    text+='typedef struct SPSpec{unsigned pc,size,op,atom;}SPSpec;\nstatic const SPSpec sp_expected_ops[]={\n'
    text+=',\n'.join('{%d,%d,%d,%d}'%(op['pc'],op['size'],code[op['pc']],bool(op['atom_hex']) and not op['before_op'].endswith('_rdi')) for op in ops)+'\n};\n'
    return text

def add_light(dst):
    source=ROOT/'experiments/ic_mechanism_audit/attempt01/diagnostic_build.py'
    sp=importlib.util.spec_from_file_location('audited_scope_builder',source);m=importlib.util.module_from_spec(sp);sp.loader.exec_module(m)
    for f in ['audit_hooks.h','audit_tail.inc']:
        shutil.copyfile(ROOT/'experiments/ic_mechanism_audit/attempt01/diagnostic'/f,dst/f)
    m.instrument('M',dst)
    shutil.copyfile(HERE/'light_hooks.h',dst/'audit_hooks.h')
    shutil.copyfile(HERE/'light_tail.inc',dst/'audit_tail.inc')
    p=dst/'quickjs.c';s=p.read_text();s=spec_text()+'\nstatic void sp_shape_birth(void*);\nstatic void sp_shape_death(void*);\n'+s
    pattern=r'(static void add_gc_object\(JSRuntime \*rt, JSGCObjectHeader \*h,[^{};]+\)\n\{)'
    s,n=re.subn(pattern,r'\1\n    if(type==JS_GC_OBJ_TYPE_SHAPE)sp_shape_birth(h);',s);assert n==1
    anchor='static void remove_gc_object(JSGCObjectHeader *h)\n{'
    s=one(s,anchor,anchor+'\n    if(js_rc(h)->gc_obj_type==JS_GC_OBJ_TYPE_SHAPE)sp_shape_death(h);')
    a=s.index('#define GET_FIELD_INLINE(');z=s.index('        CASE(OP_get_field):',a);v=s[a:z]
    v=one(v,'                obj = sp[-1];','                obj = sp[-1];                                           \\\n                sp_receiver(ctx,obj,atom);')
    s=s[:a]+v+s[z:];p.write_text(s)
    p=dst/'read_ic_opcodes.inc';s=p.read_text();s=one(s,'        RDI_QUERY();','        RDI_QUERY();                                                    \\\n        sp_receiver(ctx,obj,site->atom);');p.write_text(s)
    p=dst/'read_ic_types.h';s=p.read_text();s=one(s,'#define RDI_REASON(field) ((void)0)','#define RDI_REASON(field) sp_reason(#field)');p.write_text(s)
    p=dst/'read_ic_runtime.inc';s=p.read_text();s=s.replace('    js_dup_shape(shape);','    sp_maint(0);\n    js_dup_shape(shape);')
    s=one(s,'    js_free_shape_null(ctx->rt, s->shape);','    if(s->shape)sp_maint(1);\n    js_free_shape_null(ctx->rt, s->shape);')
    s=one(s,'        js_free_shape_null(rt, s->shape);','        if(s->shape)sp_maint(1);\n        js_free_shape_null(rt, s->shape);');p.write_text(s)
    p=dst/'qjs.c';s=p.read_text();s=one(s,'extern void audit_report(void);','extern void audit_report(void);\nextern void sp_install(JSContext*);\nextern void sp_destroy(void);')
    s=one(s,'        js_std_add_helpers(ctx, argc - optind, argv + optind);','        js_std_add_helpers(ctx, argc - optind, argv + optind);\n        sp_install(ctx);')
    cleanup='    JS_FreeContext(ctx);\n    JS_FreeRuntime(rt);';assert s.count(cleanup)==2;s=s.replace(cleanup,'    sp_destroy();\n'+cleanup);p.write_text(s)

def add_control(dst,light=False):
    p=dst/'quickjs.c';s=p.read_text()
    if not light:s=spec_text()+'\n'+s
    s='static void sp_control_forget(void*);\n'+s
    s=one(s,'static void free_function_bytecode(JSRuntime *rt, JSFunctionBytecode *b)\n{','static void free_function_bytecode(JSRuntime *rt, JSFunctionBytecode *b)\n{\n    sp_control_forget(b);')
    s+='\n#include "sp_control.inc"\n';p.write_text(s)
    shutil.copyfile(HERE/'control.inc',dst/'sp_control.inc')
    p=dst/'qjs.c';s=p.read_text();s=one(s,'int main(int argc, char **argv)','extern void sp_control_install(JSContext*);\nint main(int argc, char **argv)')
    s=one(s,'        js_std_add_helpers(ctx, argc - optind, argv + optind);','        js_std_add_helpers(ctx, argc - optind, argv + optind);\n        sp_control_install(ctx);');p.write_text(s)

def main():
    pin();rev=sys.argv[1] if len(sys.argv)>1 else 'build01';out=HERE/'builds'/rev
    assert not out.exists(), 'new revision required'
    src=Path(runtime()['sources']['M']['path']);ids={}
    for name,h in runtime()['sources']['M']['files'].items():
        assert sha(src/name)==h, 'frozen M source changed: '+name
    for label in ['M_light','C','C_light']:
        dst=STORE/rev/label;copy_source(src,dst)
        original={p.name:p.read_text() for p in dst.iterdir() if p.suffix in ['.c','.h','.inc']}
        if label!='C':add_light(dst)
        if label.startswith('C'):add_control(dst,light=label=='C_light')
        patch=''.join(''.join(difflib.unified_diff(original.get(p.name,'').splitlines(True),p.read_text().splitlines(True),fromfile='a/'+p.name,tofile='b/'+p.name)) for p in dst.iterdir() if p.suffix in ['.c','.h','.inc'] and p.read_text()!=original.get(p.name,''))
        save(out/(label+'.patch'),patch)
        r=capture(['make','-j2','qjs','qjsc'],label+' independent build',cwd=dst,timeout=300);save(out/(label+'.build.json'),r)
        assert r['exit_code']==0,r['stderr'][-4000:]
        exe=dst/'qjs'
        with exe.open('rb') as f:assert f.read(4)==b'\x7fELF';os.fsync(f.fileno())
        smoke=capture([exe,'-e','console.log(123)'],label+' smoke',env=dict(os.environ,SP_DISABLE='0'),timeout=15)
        save(out/(label+'.smoke.json'),smoke);assert smoke['exit_code']==0 and smoke['stdout']=='123\n' and not smoke['stderr']
        ids[label]=dict(path=str(exe),size=exe.stat().st_size,sha256=sha(exe),source=str(dst),formal=label=='C',
            purpose='mechanism-only; never OPT' if label=='C' else 'diagnostic-only; never performance',
            source_sha256={p.name:sha(p) for p in dst.iterdir() if p.suffix in ['.c','.h','.inc']})
        save(out/(label+'.verified.json'),ids[label]);print('BUILT_VERIFIED',label,exe.stat().st_size,flush=True)
    save(out/'manifest.json',ids)

if __name__=='__main__':main()
