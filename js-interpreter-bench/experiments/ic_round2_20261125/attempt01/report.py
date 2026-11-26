"""Rebuild the reports from saved records; does not launch benchmarks."""
from run import *
import io,contextlib
FULL=HERE/'full01';M=json.loads((FULL/'summary.json').read_text());COUNTS=json.loads((HERE/'counts01/samples.json').read_text())
DESCRIPTIONS={
'instance':['instanceof','hook_probe','hook_lookup_skipped','hook_path_published','hook_record_overwritten','prototype_slot_validated','prototype_slot_filled','primitive_fast_false','direct_prototype_fast_true','ordinary_hook_lookup'],
'call':['builtin_call_target_object','not_prepared_JS_target','prepared_JS_target','adapter_identity_hit','recipe_parse','unsupported_recipe','adapter_published','receiver_or_budget_reject','native_call_frame_removed','JS_field_initializer_elided'],
'nested':['seed','seed_argc_0','seed_argc_2','seed_other_argc','base_reject','wrapper_reject','method_resolve_reject','initializer_recipe_reject','prototype_write_reject','child_plan_reject','parent_plan_published','parent_plan_probe','parent_live_guard_reject','child_live_guard_reject','GC_budget_reject','stack_reject','parent_allocated','two_arg_parent_commit','existing_child_numeric_plan_used','child_ordinary_constructor','child_exception','nested_parent_commit']}
def table(head,rows):return '\n'.join(['|'+'|'.join(head)+'|','|'+'|'.join(['---']*len(head))+'|',*['|'+'|'.join(map(str,r))+'|'for r in rows]])
def aggregate(label,case):
 r=next(r for r in COUNTS if r['label']==label and case in [r['case'],r['name']]);arr=r['diagnostic'].get('R2_COUNTS',[]);return [sum(s['c'][i]for s in arr)for i in range(32)],r
# Named counts plus copied locations replace undocumented integer arrays.
mechanism=[]
for r in COUNTS:
 family='instance'if r['label'].startswith('INSTANCE')else'call'if r['label'].startswith('CALL')else'nested'
 names=DESCRIPTIONS[family];sites=[]
 for s in r['diagnostic'].get('R2_COUNTS',[]):sites.append(dict(function=s['function'],line=s['line'],pc=s['pc'],counts=dict(zip(names,s['c']))))
 mechanism.append(dict(label=r['label'],case=r['case'],sites=sites,totals={k:sum(s['counts'][k]for s in sites)for k in names},numeric_work=r['diagnostic'].get('NP_WORK')))
save(HERE/'mechanism_counts.json',mechanism)
# Full table directly against A, with the two parents retained.
for suite in ['octane','sunspider']:
 cols=['A','SPARSE','NUMERIC_PLAN','INSTANCE_HOOK','CALL_FIELD','NEST_COMBINED','V8_ON'];rows=[]
 for r in M['rows']:
  if r['suite']!=suite:continue
  rows.append([r['name'],*[f'{r[l+"_ms"]:.4f}'+(f' ({(r[l+"_ms"]/r["A_ms"]-1)*100:+.2f}%)'if l in ['SPARSE','NUMERIC_PLAN','INSTANCE_HOOK','CALL_FIELD','NEST_COMBINED']else'')for l in cols]])
 rows.append(['整体 GM',*[f'{M["statistics"][suite][l]["GM_ms"]:.4f}'+(f' ({M["statistics"][suite][l]["vs_A_percent"]:+.2f}%)'if l not in ['A','V8_ON']else'')for l in cols]])
 (FULL/(suite+'_vs_A.md')).write_text('单位 ms/Run；括号相对历史 A，负数更快；A/SPARSE/NUMERIC_PLAN/V8 为历史记录。\n\n'+table(['表项',*cols],rows)+'\n')
# Targeted five-pair results and family reports.
targets={f:json.loads((HERE/sub/'targeted01/summary.json').read_text())for f,sub in [('instance','01_instance_hook'),('call','02_call_adapter'),('nested','03_nested_plan')]}
for family,sub,labels in [('instance','01_instance_hook',['INSTANCE_DIRECT','INSTANCE_SLOT','INSTANCE_HOOK']),('call','02_call_adapter',['CALL_DIRECT','CALL_IC','CALL_FIELD']),('nested','03_nested_plan',['NEST_PARENT','NEST_COMBINED'])]:
 lines=[f'# {family}：实现及结果','',
 '定向时间为同批交错的五个独立进程中位数；完整基准每项一个新进程，父版、A、V8 沿用已有记录。完整比较是跨批次单轮筛选。负数表示更快。','',
 table(['版本','Octane GM/ms','相对父版','SunSpider GM/ms','相对父版'],[[l,f'{M["statistics"]["octane"][l]["GM_ms"]:.4f}',f'{M["statistics"]["octane"][l]["vs_parent_percent"]:+.2f}%',f'{M["statistics"]["sunspider"][l]["GM_ms"]:.4f}',f'{M["statistics"]["sunspider"][l]["vs_parent_percent"]:+.2f}%']for l in labels]),'',
 '## 同批定向结果','',table(['表项','模式','中位数 ms/Run','范围','相对同批父版'],[[r['case'],r['label'],f'{r["median"]:.6f}',f'{r["min"]:.6f}–{r["max"]:.6f}',f'{r["percent"]:+.2f}%']for r in targets[family]]),'']
 if family=='instance':
  lines+=['## 缓存和执行路径','',
  '先保留原 SPARSE、同一 ELF 的 OFF，再依次打开直接快捷返回、prototype 槽位提示、hook 路径缓存。缓存按 PC 和当前 RHS 身份识别，读取 holder 当前槽里的 hook 值。只有当前值确实是本 realm 的内置 hasInstance，才使用 primitive=false 或直接原型=true 两个出口。深链 false、Proxy、getter、跨 realm 等保留原查找/调用。',
  '结构修改前检查对象上的登记位：add_property 和 js_shape_prepare_update 使共享版本失效。删除及压缩、描述符/可写性改变、setPrototypeOf 都经过这些入口；数据槽单纯改值不用失效，因为命中时读的是当前值。未哈希原型不靠 shape 指针判断稳定。',
  'JSObject 仍 64B、JSFunctionBytecode 仍 160B。runtime 比 SPARSE 多 1048B（其中槽提示表 1024B）；第一次学到路径后分配 64×56=3584B 的 hook 表。没有 instanceof 的函数不分配记录。表中 RHS/holder 各有强引用，最多 64 条，冲突时交接引用，runtime 最后 GC 前清空。它会延长少量目标的生存期，这是本版的内存成本。','',
  '```c\nif (h->pc != pc || h->epoch != rt->r2_epoch ||\n    JS_VALUE_GET_OBJ(h->rhs) != JS_VALUE_GET_OBJ(rhs)) return 0;\nJSObject *holder = JS_VALUE_GET_OBJ(h->holder);\n*out = JS_DupValue(ctx, holder->prop[h->off].u.value);\n```','',table(['负载','instanceof','省 hook 查找','槽位提示通过','省内置帧'],[[c,*[f'{x:,}'for x in [aggregate('INSTANCE_HOOK',c)[0][0],aggregate('INSTANCE_HOOK',c)[0][2],aggregate('INSTANCE_HOOK',c)[0][5],sum(aggregate('INSTANCE_HOOK',c)[0][7:9])]]]for c in ['EarleyBoyer.Boyer','EarleyBoyer.Earley','PdfJS','CodeLoad.Closure']]),'',
  'Boyer 五对中位数由 54.66997 降到 47.53907 ms，−13.04%；相对 SLOT 再降 5.39%。SLOT 比 DIRECT 并没有更快，不能把减少内置帧和槽缓存混成一种收益。Earley 的完整 hook 版与 SPARSE 基本相当，PdfJS 未见净收益；零覆盖的 Closure 也有小幅成本。全集为 Octane −0.25% / SunSpider +2.00%，不适合直接替换父版。']
 elif family=='call':
  lines+=['## 适配和字段配方','',
  'OP_call_method / tail_call_method 在参数已求值后使用栈里的实际 callee/target；不重读 .call。只有确认为本 realm 内置 Function.prototype.call，且目标完整字节码是空体或纯普通字段初始化时，才允许去掉 native 帧。普通 JS 函数、setter、Proxy、只读接收者和会观察调用栈的目标保留原入口。',
  'DIRECT 每次识别；IC 缓存目标身份和配方；FIELD 在 IC 上只对单个参数字段直接执行 JS_SetPropertyInternal，仍写当前 receiver，不创建对象。目标改变重新学习，值所有权和原来的栈清理保留。适配继续调用 JS_Call，保留原 COPY_ARGV；没有把这笔原本就不属于 apply 的复制算成收益。',
  '每个 JSFunctionBytecode 增加 8B（160→168），每个成功位点额外 232B，按需申请。GC 标记缓存的 call/target，字节码释放时释放。','',
  '```c\nif (mode == FIELD && r->n == 1 && r->arg[0] != UINT16_MAX) {\n    int ok = JS_SetPropertyInternal(ctx, argv[0], r->atom[0],\n        JS_DupValue(ctx, argv[r->arg[0] + 1]), argv[0], flags);\n    *out = ok < 0 ? JS_EXCEPTION : JS_UNDEFINED;\n    return 1;\n}\n*out = JS_Call(ctx, target, argv[0], argc - 1, argv + 1);\n```','',
  table(['负载','实际内置 call→JS','IC 少解析后的解析数','省 native 帧','FIELD 另省 JS 体'],[[c,*[f'{x:,}'for x in [aggregate('CALL_FIELD',c)[0][0],aggregate('CALL_FIELD',c)[0][4],aggregate('CALL_FIELD',c)[0][8],aggregate('CALL_FIELD',c)[0][9]]]]for c in ['DeltaBlue','Typescript']]),'',
  '独立身份统计：DeltaBlue 8 个位点、Typescript 59 个位点，本次 Run 各自都只有一个实际 target，主目标占比都是 100%。这不是目标来回切换造成的退化。',
  'DeltaBlue 同批 SPARSE 4.80371 ms，OFF 就要 5.18653 ms（+7.97%）；FIELD 5.17480 ms（+7.73%）。Typescript FIELD 相对 SPARSE +2.05%。新入口和布局已经付出了成本，减少 native 帧没有抵消它；不把全部变化归因某一个 if。全集三个变体都退化，FIELD 为 Octane +2.92% / SunSpider +3.32%，本轮不保留为默认候选。']
 else:
  lines+=['## 父计划复用已有子计划','',
  '独立从已测 NUMERIC_PLAN 派生。模板只接受：两实参普通字段转发；零实参 wrapper 的 initializer 只有 this.field = new G(三个数值零常量)。按最终准备字节码识别，不使用函数名、字段名或基准名。每次从 initializer 当前 var_ref 解析 G，经普通 data 属性链取得实际目标；getter/TDZ/特殊对象直接退回原入口。',
  '学习成功后保存父 wrapper/initializer/apply/final shape，并用 initializer 内部子位点的 FourSite 找它当前的 NumericPlan，不保存可能被替换的 NumericPlan 裸指针。initializer 强引用使该子位点存储活着。所有 prototype、方法当前值和写入资格继续检查。',
  '父对象先创建，子对象随后创建；子结果每次都是新对象。父属性先初始化 undefined 以保持 GC 可见状态，再放入子结果。预留 16 个 4KiB arena 的 GC 预算，禁止在守卫到最后填槽之间进入 GC/用户回调；不够就走普通构造。保留原中断边界。',
  'PARENT 对照主动让子构造走普通入口；COMBINED 调用既有 np_try。两者都保留父/子各一次 JS_NewObjectFromShape；本轮没有合并对象分配。FourSite 40→48B，每个成功父计划 192B；本次 RayTrace 发布 9 份。','',
  '```c\n*out = JS_NewObjectFromShape(ctx, js_dup_shape(p->final),\n                             JS_CLASS_OBJECT, NULL);\n// 父对象已创建并初始化，当前绑定已验证\nhandled = np_try(ctx, p->r.child, owned, owned,\n                 p->r.constants, &result);\n// 子对象每次新建，接回父字段；不缓存返回值\no->prop[0].u.value = result;\n```','',
  table(['Run 内实际工作','NUMERIC_PLAN','PARENT','COMBINED'],[[name,*[f'{next(r for r in COUNTS if r["label"]==l)["diagnostic"]["NP_WORK"][k]:,}'for l in ['NUMERIC_PLAN','NEST_PARENT','NEST_COMBINED']]]for name,k in [('wrapper 解释帧',0),('数值 initializer 帧',1),('wrapper arguments 物化',2),('原数值计划总提交',4)]]),'',
  'COMBINED 的父计划成功 1,950,966 次：两实参 426,235 次、包含子 new 的父计划 1,524,731 次。父对象仍实际申请 1,950,966 次；嵌套的 1,524,731 个子对象仍实际创建。原数值计划总提交仍为 6,571,489 次，与 NUMERIC_PLAN 相同，因此没有把既有 Color 命中冒充新增收益。',
  'NUMERIC_PLAN 的四个最大外层拒绝点，已将准备前记录与最终镜像按 PC/操作数还原核对：827/PC17 为 argc=0（738,304 次），1082/PC16 为 argc=0（425,984 次），1171/PC568 为 argc=2（195,584 次），1168/PC524 为 argc=0（195,584 次）。它们原来都在三数值模板的实参数量/入口资格处拒绝。组合版分别提交 738,303 / 425,982 / 195,583 / 195,583 次。完整匹配结果在 ../bytecode/numeric_rejected_sites_argc.json。',
 '同批 RayTrace 中位数由 14.94708 降到 12.31468 ms（−17.61%），五对全部更快。PARENT 为 15.59430 ms（+4.33%）：省父层却放弃已有子计划会倒退。COMBINED 全集相对 NUMERIC_PLAN 为 Octane −1.11% / SunSpider +0.23%；相对 SPARSE 为 −4.68% / +1.88%。这轮最值得保留继续复测，但还不能声称解决了 SunSpider 的退化。']
 lines+=['','## 完整逐项数据','']
 for suite in ['octane','sunspider']:lines+=['','### '+suite,'',(FULL/(family+'_'+suite+'.md')).read_text()]
 lines+=['','最大回退：','']
 for l in labels:
  for suite in ['octane','sunspider']:
   w=M['statistics'][suite][l]['worst'];lines.append(f'- {l} / {suite}：{w["name"]} {w[l+"_vs_parent_percent"]:+.2f}%。')
 (HERE/sub/'results.md').write_text('\n'.join(lines)+'\n')
# Main human-readable summary.
rows=[]
for l,name in [('INSTANCE_HOOK','instanceof 路径缓存'),('CALL_FIELD','call 适配＋字段配方'),('NEST_COMBINED','父子组合构造计划')]:
 o=M['statistics']['octane'][l];s=M['statistics']['sunspider'][l];rows.append([name,o['parent'],f'{o["vs_parent_percent"]:+.2f}%',f'{s["vs_parent_percent"]:+.2f}%',f'{o["vs_A_percent"]:+.2f}%',f'{s["vs_A_percent"]:+.2f}%'])
text=['# QuickJS IC Round 2','',
 '已完成三个想法的实现、语义与生命周期验证、独立计数、五对定向实验，以及完整 Octane 17 项和 SunSpider 26 项的单轮筛选。三份源码；为分清收益来源，分别保留 3、3、2 个执行模式，共 344 个全集新进程。没有组合三个想法，没有修改冻结源码或默认引擎，没有 push。','',
 table(['主实现','父版','Octane 相对父版','SunSpider 相对父版','Octane 相对 A','SunSpider 相对 A'],rows),'',
 '**最值得继续的是父子组合构造计划。** RayTrace 同批五对中位数减少 17.61%，全集 Octane 相对 NUMERIC_PLAN 再减 1.11%，SunSpider +0.23%。它保留了已有 Color 子计划，新增收益来自省掉父层 wrapper、arguments、apply 和 initializer。',
 '`instanceof` 版 Boyer 同批 −13.04%，但整体只有 −0.25% / +2.00%，属于局部收益。`.call` 版真正省了部分 native 帧和 JS 字段初始化体，然而两套全集都更慢，保留失败记录。','',
 '## 如何看这些数据','',
 '负数表示耗时减少。Octane 用 14 suite 分层等权 GM，SunSpider 用 26 项等权 GM。GM 与逐项时间之和都保留。计数只在 Run 开启，计时使用无计数 Release。全部版本沿用原输入、N、校验、Setup/Run 边界、CPU 2、C locale、Asia/Shanghai、GCC 15.2.0 与 -O2。',
 'A/SPARSE/NUMERIC_PLAN/V8 的全集按本次要求使用历史记录，故整体比较是跨批次单轮筛选。A/V8 来自既有 native_confirmation 的 30 进程中位数；SPARSE 使用上一轮报告里的近期冻结父版单轮，NUMERIC_PLAN 使用其上一轮单轮。不要把 0.2% 这类变化当成已确认收益。现场五对定向父版对照才用于判断专项变化能否重复。',
 'V8_ON 的历史参数是 --jitless --no-lazy --use-ic。用户包里的 EPYC/GCC14.2 时间仅作设计参考，没有混入本轮表格。','',
 '## 数据、代码和复现','',
 '- [全部模式、两套完整逐项表](full01/results.md)，[Octane CSV](full01/octane.csv)，[SunSpider CSV](full01/sunspider.csv)。',
 '- [三个主实现与 A/SPARSE/NUMERIC_PLAN/V8：Octane](full01/octane_vs_A.md)，[SunSpider](full01/sunspider_vs_A.md)：括号相对 A。',
 '- [instanceof 实现和结果](01_instance_hook/results.md)，[call 实现和结果](02_call_adapter/results.md)，[组合构造实现和结果](03_nested_plan/results.md)。各目录有独立补丁、source.tar.gz、Release/计数/ASan+UBSan manifest、五对原始时间。',
 '- [命名后的计数](mechanism_counts.json)，原始计数及实际执行镜像在 counts01/raw/；目标身份在 02_call_adapter/identities01/。',
 '- [验证](validation02/gate.json)、[额外失效/回退验证](extra_validation01/gate.json)、[GC/realm/中断及保存/加载验证](c_validation01/gate.json)、[补丁与计时审计](audit.json)。LSan 在该环境下未启用，ASan/UBSan 及 runtime 释放断言已通过。',
 '- [执行字节码摘录](bytecode.md)，[结构实际大小](sizes.json)，[复现命令](commands.md)。','',
 '各目录的 work/ 是本机编译缓存，不纳入源码交付；source.tar.gz 和 manifest 对应实际测量的版本。结果、补丁和输入哈希经过 audit.py 独立核对。']
(HERE/'README.md').write_text('\n'.join(text)+'\n')
print('REPORTS_WRITTEN')
