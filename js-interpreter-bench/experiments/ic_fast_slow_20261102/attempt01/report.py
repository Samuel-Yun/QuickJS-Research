"""Reports from public raw-only analysis; no runtime or private source imports."""
import csv,json,statistics,math
from pathlib import Path
HERE=Path(__file__).resolve().parent
def read(p):return json.loads(p.read_text(encoding='utf-8'))
def csvread(p):return list(csv.DictReader(p.open(encoding='utf-8',newline='')))
def write(p,s):
    assert not p.exists(),str(p)
    p.write_text(s,encoding='utf-8')
def main():
    audit=read(HERE/'independent_audit_v2.json');assert all(x['status']=='PASS' for x in audit.values())
    sections=[];aggregates={};counts=[]
    for kind in ['sunspider','micro','octane']:
        root=HERE/kind;table=csvread(root/'analysis/comparison.csv');ratios=csvread(root/'analysis/ratios.csv');lookup={(r['case'],r['ratio']):r for r in ratios}
        conditions=read(root/'protocol.json')['conditions']
        lines=['# '+kind+'：完整逐项结果','',
          '单位：一次完整Run的内部ms；首次Run计入，无计时前workload预跑。Q1/Q3、stddev、min/max见analysis/statistics.csv。时间比<1表示U更快；区间为同轮配对bootstrap10000次探索性95%，未经多重检验校正。','',
          '|case|N|各条件实际n|'+'|'.join(conditions)+'|U/M [95%]|U/A [95%]'+('|U/V8_ON [95%]' if 'V8_ON' in conditions else '')+'|',
          '|---|---:|---|'+'|'.join('---:' for c in conditions)+'|---|---'+('|---' if 'V8_ON' in conditions else '')+'|']
        for t in table:
            values=[t['case'],t['N'],'/'.join(t[c+'_n'] for c in conditions)]+[f'{float(t[c+"_median_ms"]):.6f}' for c in conditions]
            for ratio in ['U/M','U/A']+(['U/V8_ON'] if 'V8_ON' in conditions else []):
                r=lookup[(t['case'],ratio)];values.append(f'{float(r["point"]):.5f} [{float(r["CI95_low"]):.5f}, {float(r["CI95_high"]):.5f}]')
            lines.append('|'+ '|'.join(values)+'|')
        gm=read(root/'analysis/aggregate.json') if (root/'analysis/aggregate.json').exists() else []
        aggregates[kind]=gm
        if gm:
            lines+=['','## 预先固定集合（非官方分数）','']
            for r in gm:lines.append(f'- {r["set"]}，{r["case_count"]}项/{r["suite_count"]}个等权单元，{r["ratio"]}={r["point"]:.6f} [{r["CI95_low"]:.6f}, {r["CI95_high"]:.6f}]；共享{r["common_rounds"]}完整轮次。')
        um=[r for r in ratios if r['ratio']=='U/M'];better=[r for r in um if float(r['CI95_high'])<1];worse=[r for r in um if float(r['CI95_low'])>1];unclear=[r for r in um if r not in better+worse]
        lines+=['','按探索性区间逐项计数：U/M低于1 '+str(len(better))+'项、高于1 '+str(len(worse))+'项、跨1 '+str(len(unclear))+'项。跨1不是等效证明。']
        lines+=['','相对M变化最大的点估计：']+[f'- {r["case"]} U/M={float(r["point"]):.5f}，{r["direction"]}' for r in sorted(um,key=lambda r:abs(float(r['point'])-1),reverse=True)[:5]]
        write(root/'results.md','\n'.join(lines)+'\n')
        counts.append((kind,len(better),len(worse),len(unclear)))
    lines=['# 本轮实际结论','',
      '## 做了什么','',
      '审阅公开A/M读取路径和实际ELF，完成五档缓存结果采用比例的七条件机制实验630条；从原M独立实现字节偏移U，通过语义/GC/OOM/保存加载/qjsc、上游及独立ASan/UBSan检查。随后全26 SunSpider、三个小案例、全17 Octane同批新测。没有重跑旧240条，没有修改私有只读参考项目，没有堆叠E或扩展handler。','',
      '正式有效数：'+', '.join(f'{k} {v["valid"]}/{v["expected"]}' for k,v in audit.items())+'，合计'+str(sum(v['valid'] for v in audit.values()))+'。所有偏短及异常值保留，详见独立audit。','',
      '## 命中省了什么','',
      'shape匹配后避免按atom读取hash桶/链及描述检查，直接从当前prop取值；仍要定位site、检查receiver类型/class/exotic和shape、处理JSValue复制及receiver所有权。原版A的find本来是内联，不是每次调用一个大native函数。真实miss还会替换缓存、保活/释放shape；强制普通查找不做这些维护。','',
      '## 采用比例与桥接','',
      'C0/C100整数读1.05209 [1.04017,1.06231]，对象引用读1.09785 [1.08647,1.11338]；路径计数与策略一致。但C100/M整数1.06370、引用1.03453，数值控制也1.07106。控制构建不是免费，结论限定在其内部，不能相减扣除开销。整数曲线非单调，不能从总差除次数推导精确hash成本。','',
      '## U改变及全套效果','',
      'U只把缓存中的元素下标换为填充时算好的字节偏移，加了溢出拒绝；仍加当前prop基址。实际ELF两种命中路径不再有property-index左移，site-index缩放保留。没有删除守卫、缓存值或保存旧数组地址。构建参数不变；手写补丁失败记录保留，成功入口是generated.patch。','',
      '三个首次调用计入的小案例是负结果：整数U/M=1.07746、对象引用=1.00843、数值核心=1.08766，对应时间增加约7.75%、0.84%、8.77%。本批不支持“移走命中缩放就能降低稳定读总时间”的简单假设。数值核心无目标字段，但通用driver有按源码推导的N+1次config.N支撑读取，不是整个区间零IC；不能拿它精确扣除布局成本。详见micro/README.md。','']
    for kind in ['sunspider','octane']:
        for r in aggregates[kind]:lines.append(f'- {kind} {r["set"]}：{r["ratio"]}={r["point"]:.6f}，95% [{r["CI95_low"]:.6f},{r["CI95_high"]:.6f}]。')
        for name in sorted({r['set'] for r in aggregates[kind]}):
            lookup={r['ratio']:r for r in aggregates[kind] if r['set']==name}
            old=lookup['M/V8_ON']['point'];new=lookup['U/V8_ON']['point']
            closer=abs(math.log(new))<abs(math.log(old))
            lines.append(f'- {kind} {name}：同批M/V8_ON={old:.6f}→U/V8_ON={new:.6f}；离1的对数距离点估计'+('缩小' if closer else '未缩小')+'，不是对此距离变化做出的显著性或等效检验。')
    lines+=['','逐项时间与区间见sunspider/results.md、octane/results.md；同批micro见micro/results.md，不与热反馈机制批次相除。相对V8的U/V8_ON直接来自这批新V8测量，不使用历史时间。U/M变化也改变其相对V8时间比；若需称“距离缩小”须结合原来比值在1哪侧，不能仅称U自身更快。','']
    for k,b,w,u in counts:lines.append(f'- {k} U/M探索性区间：低于1 {b}项，高于1 {w}项，跨1 {u}项。')
    lines+=['','## 还能与不能解释什么','',
      '路径计数证明干预确实在两条读取路线之间分配；实际机器码证明单位变更改变了目标命中指令。完整基准检验净效果，不以命中率或静态条数代替时间，也不把代码布局/编译器选择的贡献说成已经消除。未测每个复杂案例的精确IC命中占比、单条shift或引用计数self-time，不能把全部变化归因于一条指令。','',
      '机制引用案例是对象引用，不是函数调用；RegExp/native builtin、GC与动态编译仍属于interpreter-mode workload execution。CodeLoad在Run中动态编译，no-lazy不等于所有frontend为零。Box2D只记录运行覆盖，无可信结果门禁，不纳入固定17；官方latency未测。','',
      'WSL2 Ubuntu24.04.2/x86_64，Ryzen75800H，CPU affinity2。功耗、频率/温度和持续宿主后台控制UNKNOWN；perf不可用未调整安全设置。boot严格同campaign，源码/制品身份及flags见runtime与frozen。bootstrap区间是探索性、逐项未校正；跨1不证明等效。','',
      '## 后续边界','',
      '本轮停止在单一字节偏移尝试及完整效果验证。不自动换容量、handler、阈值或叠加另一套IC。若效果弱或负，否定的是“仅移走命中缩放即可稳定带来全套净收益”这一具体假设，不等于IC无价值。下一步需另行提出能区分布局与路径成本的检验；不从当前总时间差反算精确成本。']
    write(HERE/'results.md','\n'.join(lines)+'\n');print('REPORTS_WRITTEN',flush=True)
if __name__=='__main__':main()
