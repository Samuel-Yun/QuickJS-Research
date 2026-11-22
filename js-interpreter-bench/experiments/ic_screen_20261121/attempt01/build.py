"""Reproducible independent variants; never edit the frozen package."""
import argparse
import difflib
import hashlib
import json
from pathlib import Path
import shutil
import subprocess

import candidates

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
PACKAGE = ROOT / 'on_demand_ctor_cache'
LABELS = ['SPARSE', 'M1', 'M2', 'P2', 'P3', 'P4', 'D16']
COUNTERS = ['ctor_calls','positive_hits','normal_constructs','recipe_calls','recipe_reused',
 'plan_publications','chain_layers','descriptor_queries','negative_hits','replacements',
 'extra_allocations','extra_bytes','images','rdi_sites','delta8_sites','delta16_sites',
 'short_sites','code_bytes','linked_bytes','wide_equivalent_linked_bytes',
 'd16_prepared_shorts','d16_code_saved','d16_linked_saved','d16_excluded_control','d16_excluded_range',
 'short_dispatches','short_fused_hits','malloc_requests','malloc_requested_bytes',
 'realloc_requests','realloc_requested_bytes']


def sha(p):
    return hashlib.sha256(Path(p).read_bytes()).hexdigest()


def save(p, d):
    Path(p).write_text(json.dumps(d, ensure_ascii=False, indent=2) + '\n')


def diag_header(counts):
    if not counts:
        return '#define SCREEN(k) ((void)0)\n#define SCREEN_ADD(k,n) ((void)0)\n'
    s = '#include <inttypes.h>\nenum {' + ','.join('SC_'+k for k in COUNTERS) + ',SC_END};\n'
    s += 'static uint64_t screen_counts[SC_END];\n#define SCREEN(k) (++screen_counts[SC_##k])\n#define SCREEN_ADD(k,n) (screen_counts[SC_##k]+=(n))\n'
    s += 'static void __attribute__((destructor)) screen_report(void){fprintf(stderr,"SCREEN_COUNTS:{");\n'
    for i,k in enumerate(COUNTERS):
        s += f'fprintf(stderr,"{"," if i else ""}\\"{k}\\":%" PRIu64,screen_counts[SC_{k}]);\n'
    return s + 'fprintf(stderr,"}\\n");}\n'


def instrument(d, label):
    once = candidates.once
    q,f,s = (d[n] for n in ['quickjs.c','four_runtime.inc','sparse_runtime.inc'])
    q = once(q, '    uint8_t read_ic_ready;', '    uint8_t read_ic_ready;\n    uint8_t screen_seen;')
    q = once(q, 'void *js_malloc_rt(JSRuntime *rt, size_t size)\n{',
        'void *js_malloc_rt(JSRuntime *rt, size_t size)\n{\n    SCREEN(malloc_requests);SCREEN_ADD(malloc_requested_bytes,size);')
    q = once(q, 'void *js_realloc_rt(JSRuntime *rt, void *ptr, size_t size)\n{',
        'void *js_realloc_rt(JSRuntime *rt, void *ptr, size_t size)\n{\n    SCREEN(realloc_requests);SCREEN_ADD(realloc_requested_bytes,size);')
    q = once(q, '                if(!fast){', '''                SCREEN(ctor_calls);
                if(fast)SCREEN(positive_hits);else SCREEN(normal_constructs);
                if(!fast){''')
    f = once(f, '    FOLLOW(0);', '    SCREEN(recipe_calls);FOLLOW(0);')
    if label != 'M2':
        f = once(f, '            if(++depth>32', '            SCREEN(chain_layers);\n            if(++depth>32')
        f = once(f, '            JSProperty*pr;JSShapeProperty*d=find_own_property(&pr,p,r->atom[i]);',
            '            SCREEN(descriptor_queries);\n            JSProperty*pr;JSShapeProperty*d=find_own_property(&pr,p,r->atom[i]);')
    f = once(f, '    FOUR_COUNT(s,fill);', '    SCREEN(plan_publications);FOUR_COUNT(s,fill);')
    if not label.startswith('P'):
        a='    JSValue old=s->callee;JSShape*oldinitial=s->initial,*oldfinal=s->final;'
        f=once(f,a,'''    if(JS_VALUE_GET_TAG(s->callee)==JS_TAG_OBJECT &&
       JS_VALUE_GET_OBJ(s->callee)!=JS_VALUE_GET_OBJ(callee))SCREEN(replacements);
'''+a)
    s = once(s, 'if(sparse_same(s,c)){FOLLOW(2);return 0;}',
        'if(sparse_same(s,c)){SCREEN(negative_hits);FOLLOW(2);return 0;}')
    helper = '''
static void screen_image(JSFunctionBytecode*b)
{
    if(b->screen_seen++){b->screen_seen=1;return;}
    SCREEN(images);SCREEN_ADD(code_bytes,b->byte_code_len);
    unsigned shorts=0;
    for(int p=0;p<b->byte_code_len;){
        int op=b->byte_code_buf[p],short_op=0;
SHORT_CASE
        if(op==OP_get_field_rdi || short_op){
            uint32_t delta=short_op?get_u16(b->byte_code_buf+p+1):get_u32(b->byte_code_buf+p+1);
            SCREEN(rdi_sites);if(delta<=255)SCREEN(delta8_sites);if(delta<=65535)SCREEN(delta16_sites);
            if(short_op){SCREEN(short_sites);shorts++;}
        }
        p+=runtime_op_info(op).size;
    }
    if(b->read_ic_sites){
        size_t meta=b->read_ic_count*sizeof(ReadICSite)+b->four_count*sizeof(FourSite);
        SCREEN_ADD(linked_bytes,((b->byte_code_len+7)&~7)+meta);
        SCREEN_ADD(wide_equivalent_linked_bytes,((b->byte_code_len+2*shorts+7)&~7)+meta);
    }
}
'''.replace('SHORT_CASE', '        short_op=op==OP_get_field_rdi16;' if label=='D16' else '')
    d['runtime_opcode_info.h']=(HERE/'runtime_opcode_info.h').read_text()
    q = once(q, '#include "four_runtime.inc"', '#include "four_runtime.inc"\n#include "runtime_opcode_info.h"\n'+helper)
    q = once(q, '    ctx = b->realm; /* set the current realm */',
        '    ctx = b->realm; /* set the current realm */\n    screen_image(b);')
    if label=='D16':
        a='            *sp++ = JS_DupValue(ctx, object->prop[site->prop_offset].u.value);'
        q=once(q,a,'            if(field_size==3)SCREEN(short_fused_hits);'+chr(92)+'\n'+a)
    d.update({'quickjs.c':q,'four_runtime.inc':f,'sparse_runtime.inc':s})


def source(label, mode):
    m=json.loads((PACKAGE/'manifest.json').read_text())
    base={}
    for n,h in m['modified'].items():
        p=PACKAGE/'modified'/n;assert sha(p)==h,n;base[n]=p.read_text()
    d=dict(base)
    if label=='M1':candidates.m1(d)
    elif label=='M2':candidates.m2(d)
    elif label.startswith('P'):candidates.multi(d,int(label[1:]))
    elif label=='D16':candidates.d16(d,HERE)
    if mode=='counts':instrument(d,label)
    if label!='SPARSE' or mode=='counts':
        d['screen_diag.h']=diag_header(mode=='counts')
        d['quickjs.c']=candidates.once(d['quickjs.c'],'#include <inttypes.h>',
                                      '#include <inttypes.h>\n#include "screen_diag.h"')
    return base,d,m


def main():
    p=argparse.ArgumentParser();p.add_argument('--labels',nargs='+',default=LABELS)
    p.add_argument('--modes',nargs='+',default=['release','counts']);args=p.parse_args()
    (HERE/'patches').mkdir(exist_ok=True)
    for label in args.labels:
        for mode in args.modes:
            dest=HERE/'work'/(label+'.'+mode)
            manifest=HERE/(label+'.'+mode+'.manifest.json')
            if manifest.exists():
                m=json.loads(manifest.read_text());assert sha(m['binary'])==m['binary_sha256']
                print('EXISTS',label,mode,flush=True);continue
            try:
                base,d,identity=source(label,mode)
                if dest.exists():shutil.rmtree(dest)
                dest.mkdir(parents=True)
                for n,s in d.items():
                    path=dest/n;path.parent.mkdir(parents=True,exist_ok=True)
                    crlf=identity['modified_line_endings'].get(n)=='CRLF'
                    path.write_bytes(s.replace('\n','\r\n' if crlf else '\n').encode())
                if mode=='release' and label!='SPARSE':
                    patch=''.join(''.join(difflib.unified_diff(base.get(n,'').splitlines(True),d[n].splitlines(True),
                            fromfile='a/'+n if n in base else '/dev/null',tofile='b/'+n))
                            for n in d if base.get(n)!=d[n])
                    (HERE/'patches'/(label+'.patch')).write_text(patch)
                command=['make','-j2','-o','repl.c','qjs','qjsc']
                with (HERE/(label+'.'+mode+'.build.log')).open('w') as log:
                    subprocess.run(command,cwd=dest,stdout=log,stderr=subprocess.STDOUT,check=True)
                save(manifest,dict(label=label,mode=mode,parent='frozen SPARSE 06aada4',
                    instrumented=mode=='counts',binary=str(dest/'qjs'),binary_sha256=sha(dest/'qjs'),
                    command=command,sources={n:sha(dest/n) for n in d}))
                print('BUILD_PASS',label,mode,flush=True)
            except Exception as e:
                save(HERE/(label+'.'+mode+'.failure.json'),dict(error=str(e)))
                print('BUILD_FAIL',label,mode,repr(e),flush=True)


if __name__=='__main__':main()
