"""Recompile shell only, link exact original VM/repl objects in original order."""
import difflib,shlex,shutil
from common import *
def main():
    budget(setup=True);initial=read(HERE/'initial.json');src=Path(initial['source']);dst=STORE/'shim';assert not dst.exists();(dst/'.obj').mkdir(parents=True)
    old=(src/'qjs.c').read_text();anchor='    js_std_add_helpers(ctx, argc - optind, argv + optind);';assert old.count(anchor)==1
    new=old.replace('int main(int argc, char **argv)','extern void call_boundary_register(JSContext *ctx);\nint main(int argc, char **argv)',1).replace(anchor,anchor+'\n    call_boundary_register(ctx);',1)
    assert old.count('int main(int argc, char **argv)')==1;save(dst/'qjs.c',new)
    save(HERE/'sampler_shell.patch',''.join(difflib.unified_diff(old.splitlines(True),new.splitlines(True),fromfile='a/qjs.c',tofile='b/qjs.c')))
    save(dst/'sampler.c',(HERE/'sampler.c').read_bytes())
    dry=read(HERE/'raw/commands/make_dry_run.json')['stdout'].splitlines();line=next(l for l in dry if '-o .obj/qjs.o qjs.c' in l)
    cmd=shlex.split(line);cmd+=['-I'+str(src)]
    r=capture('compile_shell',cmd,cwd=dst);assert r['exit_code']==0
    sampler=['gcc','-g','-Wall','-Wextra','-fwrapv','-D_GNU_SOURCE','-O2','-I'+str(src),'-c','-o','.obj/sampler.o','sampler.c'];r=capture('compile_sampler',sampler,cwd=dst);assert r['exit_code']==0
    original=shlex.split(next(l for l in dry if l.startswith('gcc ') and '-o qjs ' in l));link=[];objects=[]
    for arg in original:
        if arg.startswith('.obj/') and arg.endswith('.o'):
            p=dst/arg if arg=='.obj/qjs.o' else src/arg;link.append(str(p));objects.append(dict(role='new_shell' if arg=='.obj/qjs.o' else 'unchanged_VM_or_repl',path=str(p),sha256=sha(p)))
        elif arg=='qjs':link.append(str(dst/'qjs'))
        else:link.append(arg)
    insert=next(i for i,x in enumerate(link) if x=='-lm');link.insert(insert,str(dst/'.obj/sampler.o'))
    r=capture('link_shim',link,cwd=dst);assert r['exit_code']==0
    # Relinking BASE with unchanged objects should reproduce existing ELF exactly.
    reproduce=[str(STORE/'base_relink_check') if x=='qjs' else str(src/x) if x.startswith('.obj/') else x for x in original]
    r=capture('link_base_identity_check',reproduce,cwd=src);assert r['exit_code']==0
    reproduced_sha=sha(STORE/'base_relink_check');assert reproduced_sha==initial['binary']['sha256'],'object/link recipe does not reproduce frozen BASE'
    for label,path in [('shim',dst/'qjs')]:
        capture(label+'_elf_header',['readelf','-h',path]);capture(label+'_call_disasm',['objdump','-d','-Mintel','--disassemble=JS_CallInternal',path])
    baseasm=read(HERE/'raw/commands/base_call_disasm.json')['stdout'];shim=read(HERE/'raw/commands/shim_call_disasm.json')['stdout']
    def ins(text):
        out=[]
        for l in text.splitlines():
            m=re.match(r'\s*([0-9a-f]+):\s+((?:[0-9a-f]{2}\s+)+)\s*(\S.*)',l)
            if m:out.append((int(m[1],16),m[3]))
        return out
    aa,bb=ins(baseasm),ins(shim);assert len(aa)==len(bb)>100
    def norm(items):
        origin=items[0][0];out=[]
        for pc,s in items:
            s=re.sub(r'#[^\n]*','',s).strip();s=re.sub(r'\b[0-9a-f]+ <([^>]+)>',r'<\1>',s);s=re.sub(r'(?<!\w)-?0x[0-9a-f]+\(%rip\)','RIPREL',s);s=re.sub(r'(?<!\w)-?0x[0-9a-f]+(?=\[rip)','RIPREL',s)
            # Intel RIP-relative displacements change as shell data grows.
            s=re.sub(r'\[rip[+-]0x[0-9a-f]+\]','[rip+RELOC]',s);out.append([pc-origin,s])
        return out
    differences=[dict(index=i,BASE=a,SHIM=b) for i,(a,b) in enumerate(zip(norm(aa),norm(bb))) if a!=b]
    save(HERE/'native_instruction_compare.json',dict(base_start=aa[0][0],shim_start=bb[0][0],instructions=len(aa),normalized_differences=differences,normalization='addresses/symbol targets and Intel RIP displacements; original object identity is stronger than text comparison',base_relink_sha256=reproduced_sha,VM_objects_reused=True))
    oldmeta=read(PREV/'manifest.json');manifest=dict(host=platform.node(),kernel=platform.release(),architecture=platform.machine(),cohort='WSL2-call-boundary-20261029-attempt01',mode=MODE,compiler=oldmeta['compiler'],flags=line,link_command=link,A_source_commit='04be246001599f5995fa2f2d8c91a0f198d3f34c',A_source=initial['source'],A_source_files=oldmeta['A_source_files'],artifacts={'BASE':initial['binary'],'SHIM_OFF':dict(path=str(dst/'qjs'),sha256=sha(dst/'qjs')),'SHIM_ON':dict(path=str(dst/'qjs'),sha256=sha(dst/'qjs'))},objects=objects,sampler_object=dict(path=str(dst/'.obj/sampler.o'),sha256=sha(dst/'.obj/sampler.o')),new_global_properties=['__cbBegin','__cbEnd'],LTO=False,PGO=False,NDEBUG=False,frame_pointer_options_added=False,power=None,frequency=None,temperature=None,background='uncontrolled; snapshots recorded',old_manifest_sha256=sha(PREV/'manifest.json'))
    save(HERE/'manifest.json',manifest);save(HERE/'checkpoints/01_sampler_built.json',dict(status='BUILT_NO_VM_RECOMPILE',timestamp=stamp(),source_sampler_sha256=sha(HERE/'sampler.c')))
    print('SAMPLER_BUILT_BASE_RELINK_BYTE_IDENTICAL',len(differences),'native normalized differences',flush=True)
if __name__=='__main__':main()
