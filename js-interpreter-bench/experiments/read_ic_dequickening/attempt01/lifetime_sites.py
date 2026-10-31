"""Offline canonical source/code/PC families; never pairs raw pointers or cache IDs."""
import collections
from common import *
SUM=['queries','hits','fallback','post_exit_reads','exits','updates','replacements','hash_find_calls','exit_shape_releases','streak_reads','streak_writes','streak_resets']
def groups(data):
    sources={s['source_id']:digest(bytes.fromhex(s['source_hex'])) for s in data['sources']};out=collections.defaultdict(list)
    for f in data['functions']:
        code=digest(json.dumps([f['bytecode_zero_atoms_hex'],f['atoms']],sort_keys=True).encode())
        for s in f['sites']:
            key=(sources.get(f['source_id'],''),code,f['filename_hex'],f['function_hex'],s['pc'],s['opcode'],s['atom_hex'])
            out[key].append(s)
    return out
def summary(ss):
    return dict(instances=len(ss),**{k:sum(s[k] for s in ss) for k in SUM},total_site_reads=sum(s['queries']+s['post_exit_reads'] for s in ss))
def main():
    result=[];notes=['# 按规范函数/源码/最终PC对齐的生命周期观察','',
      '全进程独立诊断，不是timed-region self-time；CodeLoad双方N<=8。重复编译实例只按family聚合，不用instance_id/指针强配对。',
      'source/code/PC唯一且总读数相等才标unique_static_site；其它为family或UNKNOWN，保留差异不强行分配原因。','']
    for c in CASES:
        gg={v:groups(read(HERE/'raw/diagnostic'/f'{c}.{v}.json.gz')) for v in ['M','R']};shared=gg['M'].keys()&gg['R'].keys();rows=[]
        for key in sorted(shared):
            a,b=summary(gg['M'][key]),summary(gg['R'][key]);src,code,file,name,pc,op,atom=key
            unique=bool(src) and a['instances']==b['instances']==1 and a['total_site_reads']==b['total_site_reads']
            rows.append(dict(source_sha256=src or None,canonical_code_atom_sha256=code,function=bytes.fromhex(name).decode(errors='replace'),pc=pc,opcode=op,atom=bytes.fromhex(atom).decode(errors='replace'),
              identity='unique_static_site' if unique else 'canonical_family' if src else 'source_UNKNOWN_code_family',M=a,R=b,hit_delta_R_minus_M=b['hits']-a['hits'],replacement_delta_R_minus_M=b['replacements']-a['replacements']))
        unique=[r for r in rows if r['identity']=='unique_static_site'];exited=[r for r in unique if r['R']['exits']];active=[r for r in unique if not r['R']['exits']]
        point=dict(case=c,matched_canonical_families=len(shared),M_only_families=len(gg['M'].keys()-shared),R_only_families=len(gg['R'].keys()-shared),unique_static_sites=len(unique),family_or_unknown=len(rows)-len(unique),
          unique_exited_sites=len(exited),unique_exited_hit_delta=sum(r['hit_delta_R_minus_M'] for r in exited),unique_active_hit_delta=sum(r['hit_delta_R_minus_M'] for r in active),
          crypto_input_limited=c.startswith('Crypto.'),
          most_replacements=sorted(rows,key=lambda r:r['M']['replacements'],reverse=True)[:8],
          largest_hit_decreases=sorted([r for r in rows if r['hit_delta_R_minus_M']<0],key=lambda r:r['hit_delta_R_minus_M'])[:8])
        result.append(point)
        if c in ['Splay.Splay','Typescript.Typescript','RayTrace.RayTrace','Richards.Richards']:
            notes += ['## '+c,'',f'匹配family {len(shared)}；M-only {point["M_only_families"]}，R-only {point["R_only_families"]}；唯一可对齐静态点 {len(unique)}。',
              f'唯一退出点的R−M命中差 {point["unique_exited_hit_delta"]}；未退出点的命中差 {point["unique_active_hit_delta"]}。这些是位置相关计数，不是时间归因。','',
              '| 函数 | PC | 属性 | M替换 | R替换 | R退出 | M命中 | R命中 | 身份 |','|---|---:|---|---:|---:|---:|---:|---:|---|']
            chosen=point['most_replacements'][:4] if c=='Splay.Splay' else point['largest_hit_decreases'][:4]
            for r in chosen:
                safe=lambda x:x.replace('|','\\|').replace('\n',' ')
                notes.append(f'| {safe(r["function"])} | {r["pc"]} | {safe(r["atom"])} | {r["M"]["replacements"]} | {r["R"]["replacements"]} | {r["R"]["exits"]} | {r["M"]["hits"]} | {r["R"]["hits"]} | {r["identity"]} |')
            notes += ['','完整规范身份与计数见lifetime_site_alignment.json，原始每site均在raw/diagnostic的对应M/R归档。','']
    save(HERE/'analysis/lifetime_site_alignment.json',dict(scope='whole-process diagnostic, grouped canonical families; not native-PC/time attribution',cases=result,indirect_retained_bytes=None))
    save(HERE/'analysis/site_findings.md','\n'.join(notes)+'\n');print('LIFETIME_SITE_ALIGNMENT_PASS',flush=True)
if __name__=='__main__':main()
