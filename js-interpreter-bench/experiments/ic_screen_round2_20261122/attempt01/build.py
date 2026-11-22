"""Round-two independent sources; previous-round code is read-only reference."""
import argparse
import difflib
import hashlib
import importlib.util
import json
from pathlib import Path
import shutil
import subprocess

import candidates

HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[2]
PACKAGE=ROOT/'on_demand_ctor_cache'
PREV=ROOT/'experiments/ic_screen_20261121/attempt01'
LABELS=['SPARSE','NEG_DIRECT','P2_COLD','PROTO_SMALL','D16_STATIC']
REFERENCES=['OLD_P2','OLD_D16']


def load(name,path):
    spec=importlib.util.spec_from_file_location(name,path)
    module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module);return module


previous=load('round_one_build',PREV/'build.py')
previous.candidates=load('round_one_candidates',PREV/'candidates.py')
COUNTERS=previous.COUNTERS+['negative_tests','eligibility_entries','remember_entries','negative_direct',
 'second_tests','second_hits','upgrades','upgrade_bytes','upgrade_failures',
 'proto0_layers','proto1_layers','proto2_layers','protolarge_layers',
 'active0_layers','active1_layers','active2_layers','activelarge_layers',
 'small_layers','small_desc_reads','small_atom_compares','small_matches','lookup_atom_compares']
previous.COUNTERS=COUNTERS


def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def save(p,d):Path(p).write_text(json.dumps(d,ensure_ascii=False,indent=2)+'\n')


def header(counts):
    s=previous.diag_header(counts)
    if counts:
        s+='#define SCREEN_DIAGNOSTIC 1\n'
        s+='static unsigned screen_proto_lookup;\n'
        s+='''#define PROTO_HIST(p) do { \\
    unsigned n=(p)->shape->prop_count,a=n-(p)->shape->deleted_prop_count; \\
    if(!n)SCREEN(proto0_layers);else if(n==1)SCREEN(proto1_layers);else if(n==2)SCREEN(proto2_layers);else SCREEN(protolarge_layers); \\
    if(!a)SCREEN(active0_layers);else if(a==1)SCREEN(active1_layers);else if(a==2)SCREEN(active2_layers);else SCREEN(activelarge_layers); \\
}while(0)
'''
    else:s+='#define PROTO_HIST(p) ((void)0)\n'
    return s


def source(label,mode):
    parent='D16' if label in ['OLD_D16','D16_STATIC'] else 'P2' if label=='OLD_P2' else 'SPARSE'
    base,d,identity=previous.source(parent,'release')
    if label=='NEG_DIRECT':candidates.neg_direct(d)
    elif label=='P2_COLD':candidates.p2_cold(d)
    elif label=='PROTO_SMALL':candidates.proto_small(d)
    elif label=='D16_STATIC':candidates.d16_static(d)
    if mode in ['counts','atomcounts']:
        alias='D16' if label in ['OLD_D16','D16_STATIC'] else 'P2' if label in ['OLD_P2','P2_COLD'] else 'M2' if label=='PROTO_SMALL' else 'SPARSE'
        previous.instrument(d,alias)
        s=d['sparse_runtime.inc']
        a='static int sparse_same(FourSite*s,JSValueConst c)\n{'
        s=candidates.once(s,a,a+'\n    SCREEN(negative_tests);')
        pos=s.index('\n{',s.index('static int four_ctor_slow_eligible'))+2
        s=s[:pos]+'\n    SCREEN(eligibility_entries);'+s[pos:]
        a='static void sparse_remember(JSContext*ctx,FourSite*s,JSValueConst c)\n{'
        s=candidates.once(s,a,a+'\n    SCREEN(remember_entries);')
        if label=='OLD_P2':
            s=candidates.once(s,'if(multi_same(p,c) && plan_try(ctx,p,c,t,a,out))return 1;',
                'if(multi_same(p,c) && plan_try(ctx,p,c,t,a,out)){SCREEN(second_hits);return 1;}')
        d['sparse_runtime.inc']=s
        if label!='PROTO_SMALL':
            a='            JSProperty*pr;JSShapeProperty*d=find_own_property(&pr,p,r->atom[i]);'
            d['four_runtime.inc']=candidates.once(d['four_runtime.inc'],a,'            PROTO_HIST(p);\n'+a)
        if label in ['OLD_D16','D16_STATIC']:
            d['screen_snapshot.inc']=(HERE/'screen_snapshot.inc').read_text()
            q=d['quickjs.c']
            q=candidates.once(q,'static void screen_image(JSFunctionBytecode*b)',
                '#include "screen_snapshot.inc"\nstatic void screen_image(JSFunctionBytecode*b)')
            q=candidates.once(q,'    SCREEN(images);SCREEN_ADD(code_bytes,b->byte_code_len);',
                '    screen_snapshot(b);\n    SCREEN(images);SCREEN_ADD(code_bytes,b->byte_code_len);')
            d['quickjs.c']=q
        if mode=='atomcounts':
            q=d['quickjs.c'];a=q.index('static force_inline JSShapeProperty *find_own_property(JSProperty')
            end=q.index('#include "read_ic_runtime.inc"',a)
            section=q[a:end]
            section=candidates.once(section,'        if (likely(pr->atom == atom)) {',
                '        if(screen_proto_lookup)SCREEN(lookup_atom_compares);\n        if (likely(pr->atom == atom)) {')
            helper='''static JSShapeProperty*screen_proto_find(JSProperty**pr,JSObject*p,JSAtom atom)
{
    screen_proto_lookup++;
    JSShapeProperty*d=find_own_property(pr,p,atom);
    screen_proto_lookup--;return d;
}
'''
            q=q[:a]+section+helper+q[end:]
            f=d['four_runtime.inc'];a='find_own_property(&pr,p,r->atom[i])'
            f=candidates.once(f,a,'screen_proto_find(&pr,p,r->atom[i])')
            d.update({'quickjs.c':q,'four_runtime.inc':f})
    if label!='SPARSE' or mode in ['counts','atomcounts']:
        d['screen_diag.h']=header(mode in ['counts','atomcounts'])
        if '#include "screen_diag.h"' not in d['quickjs.c']:
            d['quickjs.c']=candidates.once(d['quickjs.c'],'#include <inttypes.h>',
                '#include <inttypes.h>\n#include "screen_diag.h"')
    return base,d,identity


def main():
    p=argparse.ArgumentParser();p.add_argument('--labels',nargs='+',default=LABELS+REFERENCES)
    p.add_argument('--modes',nargs='+',default=['release','counts']);args=p.parse_args()
    (HERE/'patches').mkdir(exist_ok=True)
    for label in args.labels:
        for mode in args.modes:
            dest=HERE/'work'/(label+'.'+mode);manifest=HERE/(label+'.'+mode+'.manifest.json')
            if manifest.exists():
                m=json.loads(manifest.read_text());assert sha(m['binary'])==m['binary_sha256']
                print('EXISTS',label,mode,flush=True);continue
            try:
                base,d,identity=source(label,mode)
                if dest.exists():shutil.rmtree(dest)
                dest.mkdir(parents=True)
                for n,s in d.items():
                    path=dest/n;path.parent.mkdir(parents=True,exist_ok=True)
                    path.write_bytes(s.replace('\n','\r\n' if identity['modified_line_endings'].get(n)=='CRLF' else '\n').encode())
                if mode=='release' and label in LABELS[1:]:
                    patch=''.join(''.join(difflib.unified_diff(base.get(n,'').splitlines(True),d[n].splitlines(True),
                        fromfile='a/'+n if n in base else '/dev/null',tofile='b/'+n)) for n in d if base.get(n)!=d[n])
                    (HERE/'patches'/(label+'.patch')).write_text(patch)
                command=['make','-j2','-o','repl.c','qjs','qjsc']
                with (HERE/(label+'.'+mode+'.build.log')).open('w') as log:
                    subprocess.run(command,cwd=dest,stdout=log,stderr=subprocess.STDOUT,check=True)
                save(manifest,dict(label=label,mode=mode,parent='frozen SPARSE 06aada4',
                    reference_only=label in REFERENCES,instrumented=mode in ['counts','atomcounts'],binary=str(dest/'qjs'),
                    binary_sha256=sha(dest/'qjs'),command=command,sources={n:sha(dest/n) for n in d}))
                print('BUILD_PASS',label,mode,flush=True)
            except Exception as e:
                save(HERE/(label+'.'+mode+'.failure.json'),dict(error=str(e)))
                print('BUILD_FAIL',label,mode,repr(e),flush=True)


if __name__=='__main__':main()
