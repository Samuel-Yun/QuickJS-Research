"""Offline interpretation of the finite bridge evidence; never launches a VM."""
import collections,re,tarfile
from common import *
def main():
    rows=[];target=None
    matched=HERE/'bridge_check/matched_environment'
    selected=matched if (matched/'audit.json').exists() else HERE/'bridge_check'
    for c in ['M4.numeric_control','Richards.Richards']:
        for v in ['M','SW']:
            d=read(selected/'diagnostic'/f'{c}.{v}.json.gz')
            for f in d['functions']:
                name=bytes.fromhex(f['name_hex']).decode(errors='replace');code=digest(json.dumps([f['normalized_code_hex'],f['atoms']],sort_keys=True).encode())
                for op,n in f['dispatch'].items():rows.append(dict(case=c,variant=v,function=name,canonical_code_atom_sha256=code,opcode=op,actual_dispatches=n,N=2,scope='whole-process diagnostic; fused handler consumption not separate dispatch'))
                if c.startswith('M4') and v=='M' and name=='m4Loop':target=f
    csvout(HERE/'bridge_check/dispatch_counts.csv',rows);assert target
    save(HERE/'bridge_check/numeric_target.json',dict(function='m4Loop',N=2,normalized_code_hex=target['normalized_code_hex'],atoms=target['atoms'],actual_dispatch=target['dispatch'],no_property_read=True,meaning='actual dispatches, not every fused logical operation or native instructions'))
    with tarfile.open(ABLATION/'recovery/baseline_M.tar.gz') as t:source=t.extractfile('quickjs.c').read().decode().splitlines()
    ranges={}
    for op in ['add_loc','inc_loc','lt','if_true8','return']:
        candidates=[i for i,s in enumerate(source) if 'CASE(OP_'+op+'):' in s]
        if not candidates:continue
        start=candidates[0];stop=next((i for i in range(start+1,len(source)) if 'BREAK;' in source[i]),start+1);ranges[op]=(start+1,stop+1)
    sections=[];facts=[]
    for op,(a,b) in ranges.items():
        for v,shift in [('M',0),('SW',9)]:
            asm=(HERE/'bridge_check/machinecode'/f'{v}_JS_CallInternal.asm').read_text();current=None;ins=[]
            for line in asm.splitlines():
                m=re.match(r'(.+\.(?:c|h|inc)):(\d+)',line)
                if m:current=(Path(m[1]).name,int(m[2]))
                if current and current[0]=='quickjs.c' and a+shift<=current[1]<=b+shift and re.match(r'^\s*[0-9a-f]+:\s',line):ins.append(line)
            sections+=['# '+v+' '+op+' source-lines '+str(a+shift)+'..'+str(b+shift)+'; disjoint DWARF-mapped instructions, not a complete CFG',*ins,'']
            facts.append(dict(variant=v,operation=op,source_start=a+shift,source_stop=b+shift,static_mapped_instructions=len(ins),complete_CFG=False))
    save(HERE/'bridge_check/machinecode/numeric_mapped_excerpts.asm','\n'.join(sections)+'\n');csvout(HERE/'bridge_check/machinecode/numeric_mapping.csv',facts)
    m=read(HERE/'bridge_check/manifest.json');summary=[]
    selected_rows=[read(p) for p in (selected/'raw').glob('*.json')]
    assert len(selected_rows)==48 and all(r['environment'].get('QJS_READ_IC_MODE')=='1' for r in selected_rows),'bridge environment match not yet repaired; preserve initial records and run bridge_matched.py after main VM phases'
    with (selected/'summary.csv').open(encoding='utf-8',newline='') as f:summary=list(csv.DictReader(f))
    lines=['# 有限bridge_check：确认开关扰动，停止追分','',
      '精确旧M/SW源码逐文件恢复后新构建。每项12对新进程，M→ON/ON→M各6对、seed20261024，48条全部有效；双方同传mode=1占位，不进AMR主raw。',
      '两项共同N沿用上轮，内部区间全部>=1秒，首次Run在内、没有workload预跑。这里只给小样本点估计，不宣称根因或显著性。','',
      '| 项目 | M ms/Run | ON ms/Run | M/ON | ON/M耗时变化 |','|---|---:|---:|---:|---:|']
    for r in summary:lines.append(f'| {r["case"]} | {float(r["M_ms"]):.6f} | {float(r["ON_ms"]):.6f} | {float(r["M_ON"]):.4f} | {float(r["ON_time_change_pct"]):+.2f}% |')
    lines+=['','## 确认的变化','',
      '独立N2诊断中，规范最终字节码/atom与逐函数实际dispatch计数的多重集合完全匹配；numeric目标无属性读，不进入mode命中分支。',
      f'完整原始计数在{"matched_environment/" if selected==matched else ""}diagnostic/*.json.gz，规范码在numeric_target.json，逐函数各opcode计数在dispatch_counts.csv。handler融合消费的后续逻辑opcode不一定单独dispatch，不能把该表当native instruction计数。',
      '实际M JS_CallInternal起点0x22ac0、大小0xa27f；SW起点0x22ba0、大小0xa2ec（+109字节）。整.text分别762514/762818（+304）。',
      '实际prologue均保存rbp/r15/r14/r13/r12/rbx，局部栈预留均0x248；这没有证明全函数spill或路径都相同。',
      '完整两份JS_CallInternal反汇编保存于machinecode/；numeric_mapped_excerpts.asm按相同原C操作对应，明确为DWARF归属的非连续片段，不把片段拼成完整执行路径。',
      '', '## 支持的解释和UNKNOWN','',
      'JS目标工作量/动态dispatch未变，机器码相对布局和部分派生控制流确有变化；支持继续考虑非目标路径/局部性影响，而不是声称多执行了数值目标的mode判断。',
      '寄存器/栈分配的完整动态影响、分支预测、I-cache与频率/调度的贡献仍UNKNOWN，不能按109字节或一个额外分支计算成本。',
      'perf能力命令非零退出，原始stdout/stderr及状态在../raw/build/bridge_perf_availability.1.json；未取得cycles/instructions工作负载样本，未sudo或改宿主/内核。',
      '没有搜索padding、flag、mode布局，也没有为了追上M改源码。有限检查到此停止；后续AMR不包含SW，用独立新时间回答R净收益。']
    if selected==matched:lines+=['','## 初版配置偏差与恢复','',
      '初始48条M未传旧mode占位，全部原样保留在raw/，不混入本报告表。实际最终48条来自matched_environment/raw/。',
      '偏差在主正式汇总前发现并声明，待主全部VM阶段结束后才串行恢复，补4个同环境N2诊断；原R设计/正式样本不变。',
      '这是配置纠错，不是按时间方向择优。不能把初始48与匹配48当同一批次合并，全部实际桥接性能记录为96条，其中最终配置48条。']
    save(HERE/'bridge_check/results.md','\n'.join(lines)+'\n');print('BRIDGE_OFFLINE_REPORT_COMPLETE',flush=True)
if __name__=='__main__':main()
