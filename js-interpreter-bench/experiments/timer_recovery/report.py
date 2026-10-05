"""Evidence-backed reporting only after independent audit PASS."""
import csv, json
import campaign as c

def write_report(run,audit,overview):
    with (run.path/'summary/pairwise.csv').open(newline='') as f:pairs=list(csv.DictReader(f))
    with (run.path/'summary/per_case.csv').open(newline='') as f:stats=list(csv.DictReader(f))
    gm='; '.join(f'{p} = {v:.6f}' for p,v in audit['GM'].items())
    lines=[f'# {run.name}: MAIN_MONOTONIC_V1', '',
        '## 实验事实 / Confirmed observations','',
        f'- Cohort: `{audit["cohort"]}`，同一 WSL2 Ubuntu 24.04.2 x86_64 主机；不是 Windows/native Linux 结果。',
        '- 指标：**first-call-inclusive interpreter-mode execution time**，每 sample 新进程；`benchNow()` 浮点毫秒差值仅包住第一次 Run 和后续 Run × N。没有性能 warmup。',
        '- source loading、adapter、必需 Setup 在外；GC、helper、builtin、RegExp、运行中 eval/Function、首次调用仍需的准备和原 Run 断言按实际行为计入。',
        '- QuickJS 2026-06-04/04be246；V8/d8 15.6.21 `--max-opt=0 --no-lazy`；JSC/fd3406f `--useJIT=false --useLLInt=true --validateOptions=true`。完整路径/hash/依赖：`manifest.json`。正式命令没有诊断 trace/LD_PRELOAD。',
        f'- N1/N2 correctness: {audit["initial_correctness_valid"]}/{audit["initial_correctness_expected"]} valid；selected-N correctness: {audit["selected_correctness_valid"]} valid。失败及 exclusions 见 `compatibility.csv`、`failures/`。',
        f'- 正式有效 {audit["formal_valid"]}/{audit["expected_compatible"]}（兼容预算）；原全部候选预算 {audit["expected_all_candidates"]}。',
        '- 每组30；每case六种排列各5次，每引擎每位置10次。`schedule.json`、逐条 command/script hash/checksum/stdout/stderr 在 `records/`；CSV 在 `raw/`。',
        f'- 审计 {audit["status"]}：数量/顺序/flags/hash/正确性/每条时钟链/统计重算/旧数据保全。低于pilot1000ms的正式样本 {audit["formal_below_pilot_threshold_retained"]} 条仍保留；不删 outlier。',
        f'- 完整三引擎共同交集 {len(audit["complete_intersection"])}：'+', '.join(audit['complete_intersection'])+'.',
        '- GM: '+gm+'.',
        '- 每组 median、mean、样本stddev（n−1）、Tukey IQR（下15/上15各取median）、min/max：`summary/per_case.csv`。ratio = 分子 median / 分母 median；大于1表示分子耗时更多。',
        '- 三组 GM 均用同一完整交集，exp(mean(log(ratio)))。'+('Octane先subbenchmark median ratio→完整suite内GM→完整suite间等权GM；不是官方Octane分数。' if run.name=='Octane' else 'SunSpider每case等权。'),'',
        '| Case / Run | QJS ms/call | V8 ms/call | JSC ms/call | V8/QJS | JSC/QJS | JSC/V8 |',
        '|---|---:|---:|---:|---:|---:|---:|']
    med={(r['case'],r['engine']):float(r['median_ms']) for r in stats}
    for r in pairs:
        lines.append('| '+r['case']+' | '+' | '.join(f'{med[r["case"],e]:.6f}' for e in c.ENGINES)+' | '+' | '.join(f'{float(r[p]):.6f}' for p in c.PAIRS)+' |')
    lines+=['','代表性差异和反例（每组ratio的最小/最大，不是原因解释）：','']
    for p in c.PAIRS:
        lo=min(pairs,key=lambda r:float(r[p]));hi=max(pairs,key=lambda r:float(r[p]))
        lines.append(f'- {p}: minimum `{lo["case"]}` {float(lo[p]):.6f}；maximum `{hi["case"]}` {float(hi[p]):.6f}。')
    lines+=['','按预先固定机制标签的敏感性子集：`summary/pairwise_summary.csv`（交集逐项保存）。不是去掉builtin后的“纯解释器”。','']
    if run.name=='Octane':
        lines+=['Setup与状态：Crypto/Decrypt计时外原encrypt()生成输入，可能准备共享RSA helper；Encrypt在timer后原decrypt验证；Splay树/NavierStokes solver跨N演进；低N NavierStokes在timer后继续至第15帧断言并记录额外调用；PdfJS保留全部日志及原TearDown校验；CodeLoad/Mandreel动态eval和runtime统计保留。RegExp仅保留原构造器，省略原Setup的完整priming Run；核心源码不修改。',
            '原zlib与Box2D排除保持，理由在 `existing_exclusions.json`。额外不兼容项在 `compatibility.csv`，partial suite在 `summary/suite_summary.csv`。','']
    lines+=['## 可能解释 / Possible explanations','',
        '差异可能涉及解释器、首次调用准备、IC/对象/GC状态、native helper/builtin/RegExp和workload机制；当前总区间无法定量拆分。时钟变化与平台迁移不等于性能原因。', '',
        '## UNKNOWN','',
        '- JSC首次调用frontend成本、占比及全部静态callee的提前准备覆盖仍UNKNOWN；计时后端改为单调时钟没有移除这部分。',
        '- V8官方prebuilt精确source/toolchain provenance未提供的字段保持UNKNOWN；版本tag源码参照不当作artifact源码证明。',
        '- 原Date.now墙钟跳变的根因（host/WSL/NTP具体来源）仍UNKNOWN。新门禁只依赖已验证的单调链，不需要墙钟稳定。',
        '- 实际物理频率/温度/后台隔离和逐case各机制占比UNKNOWN。','',
        '## 限制','',
        '- 不是pure interpreter-loop self time，不是frontend-excluded strict；V8禁JS tier不等于禁一切native/generated code。JSC useJIT=false的RegExp策略与V8默认策略不同，单独披露，RegExp不作为dispatch证据。',
        '- Date.now仍可能被原workload用于统计/分支；没有全局替换。新harness的终止和预算只依赖固定N/benchNow。',
        '- 旧Windows与Date.now raw/summary完全保留且hash核对，不与本cohort相除。没有优化、升级、旧pilot复用或warmup诊断混表。',
        '- 控制探针PASS不是永久时钟保证；每个pilot/formal都保留内部<=外部+5ms的一致性检查。外部含启动/退出，不要求相等。','',
        '## 复现 / Resume','',
        '在Windows PowerShell：','',
        '```powershell',
        'wsl.exe -d Ubuntu -- python3 -B /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/timer_recovery/campaign.py all --attempt '+run.attempt,
        '```','',
        '有效位置resume不重复采样；所有输入冻结，不自动更新引擎。新的完整独立复现用新的两位attempt（例如02），保留本次attempt。SunSpider审计PASS后自动执行Octane；不执行Prompt5。','']
    c.save(run.path/'results.md','\n'.join(lines))
    c.save(run.path/'README.md',f'# {run.name} / MAIN_MONOTONIC_V1\n\n独立新mode，旧实验未覆盖。完整结果：`results.md`；统计：`summary/`；权威逐条raw：`records/`；可导出CSV：`raw/`；复现命令见结果。\n')
    c.save(run.path/'next_commands.md','```powershell\nwsl.exe -d Ubuntu -- python3 -B /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/timer_recovery/campaign.py all --attempt '+run.attempt+'\n```\n\n已完成的有效位置只核验，不重复。不要开启诊断trace作为正式样本。\n')
