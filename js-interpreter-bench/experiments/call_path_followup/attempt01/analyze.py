"""Offline reporting and independent cross-checks; never runs workloads."""
import collections
import csv
import hashlib
import json
import math
import re
import statistics
from pathlib import Path
import run as c
b=c.b;HERE,ROOT=c.HERE,c.ROOT
read,save,sha=b.read,b.save,b.sha

def audit():
    b.verify();rows=[]
    flags=set(read(HERE/'raw/v8_flags.json')['stdout'].splitlines())
    assert {'--max-opt=0','--no-lazy','--no-sparkplug','--no-maglev','--no-turbofan'}<=flags
    for pos in b.schedule():
        case,e=pos['case'],pos['engine'];n=read(HERE/'calibration'/f'{case}.json')['N']
        p=HERE/'raw/formal'/('rep%02d_order%d_%s_%s.json'%(pos['rep'],pos['order'],e,case))
        r=read(p);ms=json.loads(re.search(r'^WB_RESULT (.+)$',r['stdout'],re.M)[1])
        assert r['exit_code']==0 and not r['stderr'] and not r['LD_PRELOAD']
        assert ms['N']==n and ms['last']==8398848 and ms['elapsed_ms']>0
        checksum=((8398848*n+2**31)%2**32)-2**31
        assert ms['checksum']==checksum
        assert ms['elapsed_ms']<=r['outer_wall_ns']/1e6+5
        script=b.script(case,n,'formal');assert r['command']==b.command(e,script)
        assert not any(x.startswith(('--prof','--trace','--print')) for x in r['command'])
        rows.append(dict(pos,N=n,payload=ms,raw=r,script_hash=sha(script)))
    assert len(rows)==240==len(list((HERE/'raw/formal').glob('*.json')))
    exported=list(csv.DictReader((HERE/'raw/timing.csv').open()))
    assert len(exported)==240
    for raw,record in zip(rows,exported):
        assert record['case']==raw['case'] and record['engine']==raw['engine']
        assert int(record['rep'])==raw['rep'] and int(record['order'])==raw['order']
        assert int(record['N'])==raw['N'] and record['script_sha256']==raw['script_hash']
        assert math.isclose(float(record['elapsed_ms']),raw['payload']['elapsed_ms'],rel_tol=1e-12)
    summary=list(csv.DictReader((HERE/'summary.csv').open()))
    for case in b.config():
        cal=read(HERE/'calibration'/f'{case}.json')
        assert len(cal['confirmations'])==6 and all(x['elapsed_ms']>=1200 for x in cal['confirmations'])
        assert all(x['elapsed_ms']>=1500 for x in cal['pilot'])
        groups={e:[r for r in rows if r['case']==case and r['engine']==e] for e in c.ENGINES}
        med={e:statistics.median(r['payload']['elapsed_ms']/r['N'] for r in g) for e,g in groups.items()}
        assert len({r['script_hash'] for r in rows if r['case']==case})==1
        for e,g in groups.items():
            assert len(g)==30 and sorted(r['rep'] for r in g)==list(range(30))
            assert collections.Counter(r['order'] for r in g)=={1:15,2:15}
            vals=[r['payload']['elapsed_ms']/r['N'] for r in g];s=next(x for x in summary if x['case']==case and x['engine']==e)
            q=statistics.quantiles(vals,n=4,method='inclusive')
            for field,value in [('median_ms',med[e]),('q1_ms',q[0]),('q3_ms',q[2]),('sample_stddev_ms',statistics.stdev(vals)),('v8_over_quickjs',med['v8']/med['quickjs'])]:
                assert math.isclose(float(s[field]),value,rel_tol=1e-12)
    checks=list((HERE/'raw/correctness').glob('*.json'));assert len(checks)==24
    for p in checks:
        r=read(p);assert r['exit_code']==0 and '"last":8398848' in r['stdout']
    for rel,h in read(HERE/'source_evidence/preservation_before.json').items():assert sha(ROOT/rel)==h,rel
    result=dict(status='PASS',formal_valid=240,formal_expected=240,correctness_pass=24,
        shape_checks_pass=8,n_confirmations=24,engine_order_each_position=15,
        shared_method_source_and_bytecode=True,trace_or_preload_in_formal=False,
        old_files_preserved=True,outliers_deleted=False,epsilon_used=False,
        below_1000ms=sum(r['payload']['elapsed_ms']<1000 for r in rows),
        boot_ids=sorted({r['raw']['boot_id'] for r in rows}),
        full_opcode_counts_measured=False,V8_IC_hit_rate=None,exact_V8_source_commit=None,
        richards_audit=read(HERE/'richards/audit.json')['status'],
        final_code_hashes={p.name:sha(p) for p in HERE.glob('*.py')},
        entry_code_metadata_correction='raw/recovery.md; formal algorithm and raw unchanged')
    save(HERE/'independent_audit.json',result)
    print(json.dumps(result,indent=2),flush=True)

def notes():
    lines=['# 四组源码—字节码与调用路径\n',
      '正式二进制/模式与上轮相同，收集日期不同，不合并样本。原始dump、命令、stdout/stderr和hash均保留。\n',
      'QJS dump用同revision独立诊断qjs的最终JSFunctionBytecode（DUMP_BYTECODE=1）；不是qjs -d，不是IR。V8 dump来自实际冻结d8。\n',
      '## 实际改变的因素\n',
      '|组别|caller表达式|callee与对象|不能视作单独成本的混杂|\n|---|---|---|---|\n',
      '|inline|i+obj.bias|无小callee，own bias|仍有字段读取、循环、两次加法|\n',
      '|direct_call|stepPlain(obj,i)|全局绑定函数、两个显式参数|全局读取、普通调用、显式对象传递|\n',
      '|own_method|obj.step(i)|一个参数+receiver，own step|方法读取、this管理、对象shape/feedback|\n',
      '|prototype_method|obj.step(i)|同一源码，step在深度1原型|多一层查找、对象shape/布局及反馈可能变化|\n',
      '\n所有组每目标4096次循环，独立结果8398848；没有方法外提、.call/.bind或正式预热。\n']
    counts=[]
    for case,cfg in b.config().items():
        lines += ['\n## '+case+'\n','```js\n'+(HERE/'cases'/f'{case}.js').read_text()+'```\n']
        for fn in cfg['functions']:
            for e in c.ENGINES:
                p=HERE/'bytecode'/case/e/(fn+'.txt')
                text=p.read_text();text=re.sub(r'^WB_RESULT .+\n?','',text,flags=re.M)
                lines+=['\n### '+e+' / '+fn+'\n','```text\n'+text.rstrip()+'\n```\n']
                ins=read(p.with_suffix('.decoded.json'))
                counts.append(dict(case=case,function=fn,engine=e,instructions=len(ins),bytes=sum(x['size'] for x in ins)))
    b.export(HERE/'bytecode/static_counts_rechecked.csv',counts)
    derived=[]
    for case,cfg in b.config().items():
        for e in c.ENGINES:
            main=next(x for x in counts if x['case']==case and x['engine']==e and x['function']==cfg['functions'][0])
            per=main['instructions']-6;tail=10 if e=='quickjs' else 9
            callee=sum(x['instructions'] for x in counts if x['case']==case and x['engine']==e and x['function']!=cfg['functions'][0])
            derived.append(dict(case=case,engine=e,caller_logical_visits=per*4096+tail,callee_logical_visits=callee*4096,
                                total_logical_visits=(per+callee)*4096+tail,kind='DERIVED_NOT_MEASURED',excludes='driver/native dispatch/helper instructions'))
    b.export(HERE/'derived_counts.csv',derived)
    lines += ['\n## 同一轮的值与实现路径（重点own/prototype）\n',
      '原型两组的caller/callee最终opcode序列相同（V8跳转注释地址归一化）；对象建立后的路径不同。证据：source_evidence/shared_method_core.json、method_bytecode_equal.json、raw/diagnostics/*_paths.json。\n',
      '### QuickJS：原型或own方法，i=2，旧sum=7\n',
      '`get_loc0/get_arg0`使栈为[7,obj]；`get_field2 step`得到[7,obj,fn]，保留receiver；`get_loc1`成为[7,obj,fn,2]。`call_method 1`执行this=obj的stepMethod；返回后栈为[7,5]，add/put_loc0保存12。\n',
      'callee的push_this/put_loc0将this保存在局部；get_arg0取2，get_loc0/get_field bias取3，add/return返回5。callee是7条/11字节。stepPlain则get_arg1/get_arg0/get_field/add/return，是5条/9字节；没有显式this局部，但普通调用显式多传一个对象参数。\n',
      '### 源码解释，不当作独立成本测量\n',
      '全部QJS行号指04be246…未改源：quickjs.c:19107 GET_FIELD_INLINE用find_own_property（6135）在shape hash找atom，没找到时沿shape->proto。keep=1保留receiver并追加复制的函数值；keep=0替换栈中的receiver并释放其引用。data/accessor/exotic路径条件不同。\n',
      'quickjs.c:18220 call_method取fn/this/argc并进入17746 JS_CallInternal，检查callable/class、栈空间，准备arg_buf/var_buf/stack_buf和frame（17830附近），然后执行callee；返回后释放receiver、fn、参数对应栈引用。18175的call2传JS_UNDEFINED作this，显式argv包含obj和i。\n',
      '17933的push_this在非strict下检查this tag；本例receiver为object时复制其引用；stepMethod的局部this会初始化并在frame清理时释放。局部/参数读取、bias字段读取也有值复制或释放；quickjs.h:687/707的引用计数仅作用于相应tag，不能把数字当对象计数。\n',
      '这些说明了额外步骤可能出现在哪里；本轮没有把refcount、frame或lookup分别计时，没有给所有动作单独做动态计数。\n',
      '### 实测QJS路径\n',
      '四组均bias own_hit=4096、fallback/helper=0。own_method的step own_hit=4096；prototype_method的step prototype_hit=4096且hops[1]=4096。两组get_field2=4096、selected_entries=4096、selected_direct_call_method=4096；direct_call的stepPlain进入4096次。inline没有额外JS callee（selected_entries=1是目标loop本身）。\n',
      '计数只来自独立诊断进程，不能替换正式release采样；helper=0不表示查找没有成本。\n',
      '### Ignition的同一轮\n',
      'GetNamedProperty a0,step先取得方法，Star3存函数；CallProperty1 r3,a0,r1显式组织fn/receiver/参数，返回值在A。callee直接GetNamedProperty <this>,bias/Add a0/Return，3条/8字节。caller Add r0，再Mov旧sum/Star0保存新sum。虚拟槽位于frame内存，不是CPU物理寄存器。\n',
      'direct_call改为LdaGlobal stepPlain/Star3/CallUndefinedReceiver2 r3,a0,r1；callee GetNamedProperty a0,bias/Add a1/Return，同样3条/8字节。inline没有额外Call但保留字段读取和两次Add。\n',
      '实际handler证据复用上轮同hash d8的bytecode/v8_native/GetNamedProperty.disassembly.txt、CallProperty1.disassembly.txt及source_evidence/v8_native_map.json：可见解码、检查、IC/builtin入口、参数准备和间接分发。code creation/机器码存在不等于该分支实际命中；本轮V8精确source/compiler/GN和IC命中率仍UNKNOWN。\n',
      '\n## 静态长度与动态次数\n',
      'static_counts.csv/重新解码表分开记指令与字节，排除常量池、debug与反馈表。derived_counts.csv是按固定循环控制流推导的逻辑opcode visits（caller加每轮callee），不是实测native dispatch。未建立完整opcode profiler。Add后的short Star可能由同handler处理，不能把逻辑次数当分发次数，也不把elapsed除次数叫指令self-time。\n']
    lines += ['\n## 选定执行区域的实际PC采样\n',
       '四组另外各做2次独立诊断：diagnostics/simple_top_pc.csv及每次summary/原始PC与日志。QJS用正式qjs+独立信号采样库，V8用正式d8 --prof；采样时间均不进入summary.csv。QJS以内部CLOCK_MONOTONIC区间过滤，V8仅whole-process top-PC，不能比较两边百分比大小。\n']
    profile_rows=[]
    for case in b.config():
        for rep in (1,2):
            q=read(HERE/'diagnostics'/f'{case}.quickjs.rep{rep}.summary.json')
            v=read(HERE/'diagnostics'/f'{case}.v8.rep{rep}.summary.json')
            entry=0;this=0
            for loc,n in q['source_lines'].items():
                match=re.search(r'quickjs\.c:(\d+)',loc)
                if match:
                    line=int(match[1])
                    if 17746<=line<=17888:entry+=n
                    if 17933<=line<=17956:this+=n
            profile_rows.append(dict(case=case,rep=rep,qjs_internal_PC=q['timed_samples'],
                qjs_find_own_property=q['functions'].get('find_own_property',0),
                qjs_entry_frame_source_region=entry,qjs_push_this_source_region=this,
                v8_whole_process_PC=v['ticks'],v8_GetNamedProperty=v['top_PC_counts'].get('BytecodeHandler:GetNamedProperty',0),
                v8_InterpreterEntry=v['top_PC_counts'].get('Builtin:InterpreterEntryTrampoline',0)))
    b.export(HERE/'diagnostics/simple_regions.csv',profile_rows)
    lines+=['\n|case/rep|QJS内部样本|shape查找PC|call-entry/frame源码区域PC|push_this源码区域PC|V8整进程样本|GetNamedProperty PC|InterpreterEntry PC|\n',
            '|---|---:|---:|---:|---:|---:|---:|---:|\n']
    for x in profile_rows:
        lines.append('|'+x['case']+'/'+str(x['rep'])+'|'+'|'.join(str(x[k]) for k in list(x)[2:])+'|\n')
    lines+=['\n这些采样支持相关区域实际消耗执行时间，但不是精确成本：QJS请求1ms的ITIMER_PROF在本WSL中观察到约10ms粒度；优化编译行号与内联归属也有限制。push_this区域不含所有分散在header内的引用管理，计数少/为零不等于该步骤免费。callee/driver/属性操作可能共用native代码，未按完整JS栈区分。\n',
            '\n## 原Richards关联\n完整见[richards_analysis.md](richards_analysis.md)，含三个独立采样、原字节码与诊断频率。必须注意TaskControlBlock.run最终是QJS tail_call_method 1，不是此处call_method后继续累加；原程序有四种task receiver、对象/null参数与返回值、状态更新，不能用小程序时间直接外推。\n']
    save(HERE/'case_notes.md',''.join(lines))

if __name__=='__main__':
    notes();audit()
