import json,hashlib,subprocess,difflib
from pathlib import Path
H=Path(__file__).resolve().parent;ROOT=H.parents[2]
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def once(s,a,b):assert s.count(a)==1,repr(a);return s.replace(a,b,1)
def build(label):
 parent=json.loads((H/'release_manifest.json').read_text())[label];src=Path(parent['elf']).parent;original={n:(src/n).read_bytes().decode() for n in parent['sources']};assert all(sha(src/n)==s for n,s in parent['sources'].items());d=original.copy();q=d['quickjs.c']
 snapshot=(ROOT/'experiments/bytecode_eval_cold_20261110/attempt01/snapshot.inc').read_text()
 if label=='SPARSE':
  d['wb_diag.inc']=(H/'wb_diag.inc').read_text();q=once(q,'#include "read_ic_runtime.inc"','#include "wb_diag.inc"\n#include "read_ic_runtime.inc"')
  a='            *sp++ = JS_DupValue(ctx, object->prop[site->prop_offset].u.value);';q=once(q,a,'            wb_hit(site,1); \\\n'+a)
  r=d['read_ic_runtime.inc'];r=once(r,'    RDI_COUNT(updates);','    RDI_COUNT(updates);\n    wb_fill(s);');d['read_ic_runtime.inc']=r
  o=d['read_ic_opcodes.inc'];o=once(o,'        RDI_QUERY();','        RDI_QUERY(); \\\n        wb_query(site);')
  for a in ['                        val = JS_DupValue(ctx, holder->prop[site->prop_offset].u.value);','                    val = JS_DupValue(ctx, p->prop[offset].u.value);']:
   o=once(o,a,a[:len(a)-len(a.lstrip())]+'wb_hit(site,0); \\\n'+a)
  o=once(o,'        RDI_COUNT(fallback);','        RDI_COUNT(fallback); \\\n        wb_miss(site);');d['read_ic_opcodes.inc']=o
  keys=['q','h','eligible','fill','guard','overflow','work1','work2','work3','work4','work5','work6']
  d['four_diag.inc']=''.join('#define WB_'+k+' '+str(i)+'\n' for i,k in enumerate(keys))+'''#define FOUR_COUNT(s,k) do{if(wb_active && wb_kind==2)wb_ctor[WB_##k]++;}while(0)
#define FOUR_ADD(s,k,n) do{if(wb_active && wb_kind==2)wb_ctor[WB_##k]+=(n);}while(0)
#define FOLLOW(i) do{if(wb_active && wb_kind==2)wb_sparse[i]++;}while(0)
#define FOLLOW_ADD(i,n) do{if(wb_active && wb_kind==2)wb_sparse[i]+=(n);}while(0)
'''
  snapshot=once(snapshot,'        if (atom) { printf(','''        if(op==OP_four_ctor){FourSite*s=&b->four_sites[get_u16(b->byte_code_buf+pos+1)];printf(",\\\"constructor_index\\\":%u,\\\"argc\\\":%u",get_u16(b->byte_code_buf+pos+1),s->argc);}
        if (atom) { printf(''')
  snapshot=once(snapshot,'    printf("]}\\n");', '''    printf("],\\\"construct_sites\\\":[");
    for(uint32_t i=0;i<b->four_count;i++){FourSite*s=&b->four_sites[i];if(i)printf(",");printf("{\\\"index\\\":%u,\\\"pc\\\":%u,\\\"argc\\\":%u,\\\"has_positive_plan\\\":%s,\\\"has_negative_target\\\":%s}",i,s->pc,s->argc,s->plan?"true":"false",JS_IsObject(s->negative)?"true":"false");}
    printf("]}\\n");''')
  d['wb_api.inc']=(H/'wb_api.inc').read_text();q+='\n#define SNAPSHOT_EVAL_COLD 1\n#include "snapshot.inc"\n#include "wb_api.inc"\n'
 else:q+='\n#include "snapshot.inc"\n'
 d['snapshot.inc']=snapshot;d['quickjs.c']=q
 c=d['quickjs-libc.c'];a='void js_std_add_helpers(JSContext *ctx, int argc, char **argv)';decl='extern JSValue qjs_snapshot(JSContext*,JSValueConst,int,JSValueConst*);\n'
 if label=='SPARSE':decl+='extern JSValue wb_begin(JSContext*,JSValueConst,int,JSValueConst*);extern JSValue wb_end(JSContext*,JSValueConst,int,JSValueConst*);\n'
 c=once(c,a,decl+a);a='    JS_SetPropertyStr(ctx, global_obj, "performance", performance);';add='\n    JS_SetPropertyStr(ctx,global_obj,"__snapshot",JS_NewCFunction(ctx,qjs_snapshot,"__snapshot",3));'
 if label=='SPARSE':add+='\n    JS_SetPropertyStr(ctx,global_obj,"__wb_begin",JS_NewCFunction(ctx,wb_begin,"__wb_begin",2));\n    JS_SetPropertyStr(ctx,global_obj,"__wb_end",JS_NewCFunction(ctx,wb_end,"__wb_end",0));'
 d['quickjs-libc.c']=once(c,a,a+add);w=H/'work'/label;w.mkdir(parents=True,exist_ok=False)
 for n,s in d.items():p=w/n;p.parent.mkdir(exist_ok=True,parents=True);p.write_bytes(s.encode())
 if not(w/'compat/test-closefrom.c').exists(): (w/'compat').mkdir(exist_ok=True);(w/'compat/test-closefrom.c').write_bytes((src/'compat/test-closefrom.c').read_bytes())
 patch=''.join(l for n,s in d.items() if original.get(n)!=s for l in difflib.unified_diff(original.get(n,'').splitlines(True),s.splitlines(True),fromfile='a/'+n,tofile='b/'+n));(H/(label+'.diagnostic.patch')).write_text(patch)
 with (H/(label+'.build.log')).open('w') as f:z=subprocess.run(['make','-j2','-o','repl.c','qjs','qjsc'],cwd=w,stdout=f,stderr=subprocess.STDOUT,timeout=300)
 assert z.returncode==0,label
 (H/(label+'.diagnostic.json')).write_text(json.dumps(dict(elf=str(w/'qjs'),elf_sha256=sha(w/'qjs'),sources={n:sha(w/n) for n in d},release_elf_sha256=parent['elf_sha256'],diagnostic_only=True),indent=2));print('BUILD_PASS',label,flush=True)
if __name__=='__main__':build(__import__('sys').argv[1])
