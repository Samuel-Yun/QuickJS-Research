"""Derive one quota-control ELF and independent counter ELF from exact M."""
from common import *
import difflib,shutil
def one(s,a,b):assert s.count(a)==1,(a[:90],s.count(a));return s.replace(a,b,1)
def main():
    m=runtime();source=Path(m['sources']['M']['path'])
    ids=read(ROOT/'experiments/ic_mechanism_audit/attempt01/manifest.json')['M_source_files']
    assert all(sha(source/f)==h for f,h in ids.items())
    built={}
    for label in ['C','C_diag']:
        dst=STORE/label;assert not dst.exists(),'new build directory required';dst.mkdir(parents=True)
        for f in ids:
            p=dst/f;p.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(source/f,p)
        for f in ['fs_control.h','fs_control.inc','fs_selectors_all.inc']:
            shutil.copyfile(HERE/'implementation'/f,dst/f)
        p=dst/'quickjs.c';original=p.read_text();s=original
        s=one(s,'#include "read_ic_types.h"','#include "read_ic_types.h"\n#include "fs_control.h"')
        start=s.index('static force_inline JSShapeProperty *find_own_property(');end=s.index('\n}',start)+2
        body=s[start:end];body=one(body,'    sh = p->shape;','    FS_COUNT(actual_find_own_property_entries);\n    sh = p->shape;')
        body=one(body,'    h = sh->hash_table[h];','    FS_COUNT(bucket_reads);\n    h = sh->hash_table[h];')
        body=one(body,'    while (h) {','    while (h) {\n        FS_COUNT(chain_matches);');s=s[:start]+body+s[end:]
        s=one(s,'#include "read_ic_prepare.inc"','#include "fs_control.inc"\n#include "read_ic_prepare.inc"')
        p.write_text(s)
        p=dst/'read_ic_prepare.inc';s=p.read_text();s=one(s,'    assert(index == count);','    assert(index == count);\n    fs_register(ctx,b);');p.write_text(s)
        p=dst/'read_ic_runtime.inc';s=p.read_text()
        s=one(s,'    RDI_COUNT(updates);','    RDI_COUNT(updates);\n    FS_COUNT(cache_updates);')
        s=one(s,'    js_dup_shape(shape);','    FS_COUNT(shape_retains);\n    js_dup_shape(shape);') if s.count('    js_dup_shape(shape);')==1 else s.replace('    js_dup_shape(shape);','    FS_COUNT(shape_retains);\n    js_dup_shape(shape);')
        s=one(s,'    js_free_shape_null(ctx->rt, s->shape);','    if(s->shape) FS_COUNT(shape_releases);\n    js_free_shape_null(ctx->rt, s->shape);');p.write_text(s)
        p=dst/'read_ic_opcodes.inc';s=p.read_text()
        s=one(s,'        uint32_t index = get_u32(pc), offset;', '        uint32_t index = get_u32(pc), offset;                            \\\n        int fs_forced=0;')
        s=one(s,'        RDI_QUERY();', '        RDI_QUERY();                                                    \\\n        FS_ENTER(site);')
        s=one(s,'                    RDI_COUNT(hits);','                    if (!fs_adopt(site)) {                              \\\n                        FS_COUNT(forced_normal_lookups); fs_forced=1;     \\\n                        goto name ## _normal;                            \\\n                    }                                                    \\\n                    FS_COUNT(offset_reads);                              \\\n                    RDI_COUNT(hits);')
        s=one(s,'                RDI_COUNT(shape_misses);','                RDI_COUNT(shape_misses);                               \\\n                FS_COUNT(true_shape_misses);')
        s=one(s,'        atom = site->atom;', '    name ## _normal:                                                    \\\n        atom = site->atom;')
        s=one(s,'                        rdi_update(ctx, site, p->shape, pr - p->prop RDI_DARG(d));','                        if (!fs_forced) rdi_update(ctx, site, p->shape, pr - p->prop RDI_DARG(d));')
        s=one(s,'            sf->cur_pc = pc;', '            fs_scope=0;                                                  \\\n            sf->cur_pc = pc;')
        s=one(s,'    name ## _done:', '    name ## _done:                                                      \\\n        fs_scope=0;')
        p.write_text(s)
        p=dst/'qjs.c';s=p.read_text();s=one(s,'int main(int argc, char **argv)','extern int JS_FSInstall(JSContext *ctx);\nint main(int argc, char **argv)')
        s=one(s,'        js_std_add_helpers(ctx, argc - optind, argv + optind);','        js_std_add_helpers(ctx, argc - optind, argv + optind);\n        if(JS_FSInstall(ctx)<0) goto fail;');p.write_text(s)
        changes=[]
        for f in ['quickjs.c','read_ic_opcodes.inc','read_ic_runtime.inc','read_ic_prepare.inc','qjs.c','fs_control.h','fs_control.inc','fs_selectors_all.inc']:
            a=(source/f).read_text() if (source/f).exists() else '';b=(dst/f).read_text()
            changes.extend(difflib.unified_diff(a.splitlines(True),b.splitlines(True),fromfile='a/'+f if (source/f).exists() else '/dev/null',tofile='b/'+f))
        if label=='C':save(HERE/'patches/M_to_control.patch',''.join(changes))
        cmd=['make','-j2','qjs','qjsc']
        if label=='C_diag':cmd+=['DEFINES=-D_GNU_SOURCE -DCONFIG_VERSION=\\"2026-06-04\\" -DHAVE_CLOSEFROM -DFS_DIAGNOSTIC']
        result=capture(cmd,label+' build',cwd=dst);save(HERE/'raw/build'/(label+'.json'),result);assert result['exit_code']==0,result['stderr'][-5000:]
        built[label]=dict(path=str(dst/'qjs'),source=str(dst),sha256=sha(dst/'qjs'),size_bytes=(dst/'qjs').stat().st_size,
              source_hashes={f:sha(dst/f) for f in ids}|{f:sha(dst/f) for f in ['fs_control.h','fs_control.inc','fs_selectors_all.inc']},diagnostic=label.endswith('diag'))
        print('BUILT',label,flush=True)
    save(HERE/'control_runtime.json',built)
if __name__=='__main__':main()
