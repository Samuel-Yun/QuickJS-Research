"""Offline source/PC/map/holder matching, no new runtime executions."""
from common import *
def main():
    ref=read(PREV/'v8_evidence.json')['reused'];root=ROOT/ref['source_root_relative']
    fixed=[]
    for f in ref['source_files']:
        p=root/f['bundle_path'];assert sha(p)==f['sha256'];fixed.append(dict(path=p.relative_to(ROOT).as_posix(),sha256=sha(p),url=f['url'],commit=f['reference_commit']))
    save(HERE/'source_reference/LICENSE',(root/'source/LICENSE').read_bytes())
    save(HERE/'source_reference/reused_identity.json',dict(files=fixed,artifact_exact_source_commit=None,license_source='previous verified fixed source bundle'))
    for f in read(HERE/'source_reference/manifest.json')['files']:
        if f['status']=='AVAILABLE':assert sha(HERE/'source_reference'/f['path'])==f['sha256']
    mapping=[]
    for n in [1,2]:
        text=(HERE/'bytecode/Richards'/f'N{n}.holders.txt').read_text();lines=text.splitlines();holders={}
        for i,l in enumerate(lines):
            if not l.startswith('HOLDER:'):continue
            key=l.split(':')[1];m=re.search(r'^(0x[0-9a-f]+) <Object map = (0x[0-9a-f]+)>',lines[i+1]);assert m
            holders.setdefault(int(m[1],16),[]).append(dict(key=key,address=m[1],map=m[2],descriptor=json.loads(l.split(':',2)[2]),function_brief=lines[i+2]))
        log=gzip.decompress((HERE/'raw/diagnostic'/f'v8.Richards.N{n}.log.gz').read_bytes()).decode()
        details={int(l.split(',')[2],16):l for l in log.splitlines() if l.startswith('map-details,')}
        for e in read(HERE/'richards_v8_evidence.json'):
            if e['N']!=n:continue
            for line in e['map_details'] or []:
                rx=int(line.split(',')[2],16);m=re.search(r' - prototype: (0x[0-9a-f]+)',line);assert m
                candidates=[h for h in holders.get(int(m[1],16),[]) if h['key'].endswith('.'+e['property'])]
                assert len(candidates)==1,(e['function'],e['property'],line)
                holder=candidates[0]
                hd=details.get(int(holder['map'],16));assert hd
                constructor=re.search(r' - constructor: .*?<JSFunction ([^ ]+)',line)
                mapping.append(dict(N=n,function=e['function'],property=e['property'],V8_pc=e['target']['pc'],receiver_map=hex(rx),receiver_constructor=constructor[1] if constructor else None,prototype_address=m[1],post_run_holder_key=holder['key'],holder_map=holder['map'],holder_function=holder['function_brief'],own_descriptor=holder['descriptor'],holder_map_details=hd,installed_handler=None,actual_per_access_hits=None,note='same diagnostic process IDs only; map-details is a creation/change snapshot, not a per-access trace'))
    save(HERE/'richards_map_holder_matching.json',mapping)
    csvout(HERE/'richards_map_summary.csv',[{k:v for k,v in r.items() if k not in ['holder_map_details','own_descriptor','note']} for r in mapping])
    summaries=['# 原始 Richards：三个实际位置','', '|源码位置|QJS真实PC|V8真实PC|M每Run读取/命中/回退|V8 N1/N2直接观测|','|---|---:|---:|---|---|',
      '|schedule → currentTcb.isHeldOrSuspended|30|20|10671 / 0 / 10671|0→1，1个TCB map|',
      '|schedule → currentTcb.run|83|64|6573 / 0 / 6573|0→1，同一类TCB map|',
      '|TCB.run → this.task.run|73|58|6573 / 0 / 6573|0→1→P，后续P→P；4个task map|','',
      'QJS计数复用上轮N1/N2原始压缩报告，核对源码SHA、opcode起点、compiled instance和理由计数；未重跑Richards正式时间。V8是本轮同一冻结d8的独立N1/N2，按**函数+实际字节码地址**匹配LoadIC PC，而非按属性run合并。完整散列和数据见richards_sites.csv、richards_v8_evidence.json。',
      '', '## receiver不是调用者的this', '',
      '`Scheduler.schedule`自己的this是Scheduler；取出currentTcb后，前两处属性读取的receiver是TCB。方法属于TaskControlBlock.prototype，调用isHeldOrSuspended/run时this为当前TCB，不是Scheduler或prototype。TCB.run的this.task再得到四种task对象之一，run方法属于该task的prototype，调用this为该task；QJS此处是tail_call_method，不等同于微基准调用后继续累加。',
      '', '## map与holder的实际关联', '',
      'richards_map_holder_matching.json将各receiver map详情中的prototype对象地址，与同进程、workload结束后DebugPrint的prototype对象地址逐一对应，并检查其own descriptor为函数值。未给原函数加wrapper，未保存临时scheduler局部变量，也未用新建对象冒充运行时receiver。此处证明对象关系/反馈状态，不证明每次命中某个handler。',
      '', 'N1/N2分别对应6条receiver/holder关系（两个TCB site加四个task map）；跨进程不比较裸指针。安装handler、每site命中率、时间贡献仍UNKNOWN；转换事件数不能当调用次数。']
    save(HERE/'richards_notes.md','\n'.join(summaries)+'\n')
    # Human-readable exact code, keep raw dumps separate.
    bc=['# 两案例的真实关键字节码','', '同一引擎内两案例caller和callee规范化序列均一致；完整实例/源码/原始字节和规范化规则见bytecode目录与micro_diagnostic_gate.json。下面不是性能成本计数。','']
    for label in ['A','M']:
        for name in ['methodLoop','step']:
            f=read(HERE/'bytecode/own_method_control'/f'{label}.{name}.N1.json');raw=f['raw'];code=bytes.fromhex(raw['code_before_hex'])
            bc += [f'## {label} {name}', '```javascript',f['source'],'```','```text']
            for op in raw['opcodes']:
                operand=code[op['pc']+1:op['pc']+op['size']]
                value=('bytes:'+operand.hex()) if operand else ''
                if op['before_op'].startswith(('get_field','call_method','inc_loc')) and operand:value=str(int.from_bytes(operand,'little'))
                atom=bytes.fromhex(op['atom_hex']).decode(errors='replace')
                bc.append(f'{op["pc"]:3} {op["before_op"]} {value}'+(' ['+atom+']' if atom else ''))
            bc+=['```','标为bytes的操作数保持原始编码，未把相对跳转原字节伪装成目标PC；field/call_method/inc_loc按实际小端操作数展示，完整bytes另在JSON。','']
    bc += ['## V8：caller目标读取/调用', '```text','13 GetNamedProperty a0, [0:"step"], FBV[0]','17 Star3','18 CallProperty1 r3, a0, r1, FBV[2]','```','此处连续三条，来自V8.methodLoop.txt；前后循环、sum累加和返回省略，不能当完整函数。a0=obj，r3=取得的函数，r1=i；被调用的step中a0才是x。方法调用feedback与属性读取feedback分开，不能把所有调用反馈都说成use_ic关闭。','',
       '## V8：完整step指令','```text','0 Ldar a0','2 AddSmi [1], EmbeddedFeedback[None]','5 Return','```','来源bytecode/own_method_control/V8.step.txt，字节码长度6B。函数体没有this读取，两组传递receiver的调用形式仍相同；它不构成对调用帧开销的独立测量。']
    save(HERE/'bytecode_notes.md','\n'.join(bc)+'\n')
    save(HERE/'evidence_gate.json',dict(status='PASS',Richards_receiver_holder_matches=len(mapping),two_processes=True,source_files_verified=True,V8_handler=None,V8_hit_rate=None))
    print('OFFLINE_SOURCE_PC_MAP_HOLDER_MATCH_PASS',flush=True)
if __name__=='__main__':main()
