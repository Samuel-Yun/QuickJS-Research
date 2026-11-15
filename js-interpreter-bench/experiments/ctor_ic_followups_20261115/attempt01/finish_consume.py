import json,csv,io,gzip,tarfile,hashlib
from pathlib import Path
H=Path(__file__).resolve().parent/'04_construct_consume';rows=[];tot=[0]*24
for suite in ['octane','sunspider']:
 p=H/'runs/probe'/suite;events=[json.loads(l) for l in (p/'runs.jsonl').read_text().splitlines()];samples=[r for r in events if r['event']=='sample'];assert len(samples)==(17 if suite=='octane' else 26) and all(r['valid'] for r in samples)
 for r in samples:
  f=r['counts']['follow'];tot=[a+b for a,b in zip(tot,f)];rows.append(dict(suite=suite,case=r['case'],N=r['N'],construct_attempts=r['counts']['attempts'],successful_constructs_observed=f[0],immediate_plain_read=f[1],sole_use_local_bridge=f[2],R3_recipe_eligible=f[3],ordinary_own_mapped_field=f[4],interior_branch_reject=f[5],non_bytecode_target=f[7],recipe_reject=f[8],unmapped_field=f[9]))
assert tot[4]==0
out=H/'analysis';out.mkdir(exist_ok=True)
with (out/'coverage.csv').open('w') as f:w=csv.DictWriter(f,fieldnames=list(rows[0]));w.writeheader();w.writerows(rows)
summary=dict(status='NO_REAL_COVERAGE',independent_probe_processes=43,formal_timing_samples=0,consumers=['new;get_field','new;put_loc;get_loc;get_field (sole use, noncaptured)'],counts=dict(construct_attempts=sum(r['construct_attempts'] for r in rows),successful_constructs_observed=tot[0],exception_fallbacks=sum(r['construct_attempts'] for r in rows)-tot[0],immediate_plain_read=tot[1],sole_use_local_bridge=tot[2],R3_recipe_eligible=tot[3],ordinary_own_mapped_field=tot[4],non_bytecode_target=tot[7]),objects_eliminated=0,property_arrays_eliminated=0,reason='The two immediate plain reads are native zlib constructors outside R3; no eligible local bridge; method get_field2 retains object identity and is not a single field consume.',comparison='No fake timings, no microbenchmark-only optimizer, no full candidate Release run per user no-coverage exception')
(out/'summary.json').write_text(json.dumps(summary,indent=2))
m=json.loads((H/'probe.manifest.json').read_text());raw=io.BytesIO()
with tarfile.open(fileobj=raw,mode='w',format=tarfile.USTAR_FORMAT) as t:
 for n,h in sorted(m['sources'].items()):
  data=(Path(m['elf']).parent/n).read_bytes();assert hashlib.sha256(data).hexdigest()==h
  x=tarfile.TarInfo('quickjs-04_construct_consume-probe/'+n);x.size=len(data);x.mode=0o644;t.addfile(x,io.BytesIO(data))
with (H/'probe-source.tar.gz').open('wb') as f:
 with gzip.GzipFile(fileobj=f,mode='wb',mtime=0,filename='') as z:z.write(raw.getvalue())
(H/'probe-source.sha256').write_text(hashlib.sha256((H/'probe-source.tar.gz').read_bytes()).hexdigest()+'  probe-source.tar.gz\n')
text='''# CONSTRUCT_CONSUME_IC：真实覆盖为零，结束本轮

独立从冻结R3派生并构建probe，不叠加前三轮。完整Octane17/SunSpider26原负载独立进程计数各一次，N/输入/校验与计时脚本边界不改；probe时间不作为候选耗时。

第一形态：紧邻 `call_constructor; get_field_rdi`。第二形态：`call_constructor; put_locN; get_locN; get_field_rdi`，要求局部非captured、全函数静态只两次触及（这次写和这次读）、非eval环境；跨过的任何分支/catch入口均排除。旁表只记录静态形态及读取atom，运行后纯检查实际callee/new.target、原R3模板以及结果的普通自有C_W_E数据字段到实参映射，不额外执行JS读取。没有新增执行优化、没有消除对象或属性存储分配。

两套共49,231,038次构造尝试，其中CONSTRUCTS次成功返回后检查；另外513次原异常回退（Gameboy1、JQuery512）不产生可消费结果。第一形态2次（都是zlib原生构造器），合格R3模板0；第二形态0；合格映射自有字段0。因此对象消除0、属性数组消除0、引用/释放省略0。没有真实可用序列，按用户明确例外跳过Release全集；耗时和GM记N/A，不能记0%或用手写样例冒充覆盖。

旧R3完整位点证据在historical_adjacent_census.json：直接get_field仅zlib两个点各1次；另外1410次new后get_field2都是方法读取并保留receiver作this，身份可被后续调用观察，不能当成单字段消费。新probe的所有回退和43项coverage.csv保留。字段atom/函数名/基准名仅用于报告，未用于选择启用路径。

原/新优化字节码：没有任何替换。原R3四_ctor仍正常执行、read仍原正常读取，probe只为静态点增加诊断metadata和运行后不执行JS的检查。probe.patch相对R3，probe-source.tar.gz及SHA含可复现源码，明确不是优化后的Release源包。

复现（新目录）：`python3 js-interpreter-bench/experiments/ctor_ic_followups_20261115/attempt01/build.py 04_construct_consume probe`；`python3 .../sequence.py 04_construct_consume probe`；`python3 .../finish_consume.py`。

| 套件 | 项数 | 有效消费覆盖 | 正式Release耗时 | 相对R3 |
|---|---:|---:|---|---|
| Octane |17|0|未运行（无覆盖）|N/A|
| SunSpider |26|0|未运行（无覆盖）|N/A|

完整计数：

| 表项 | 构造次数 | 立即普通字段读 | 局部桥接 | 符合R3模板 | 自有字段映射 |
|---|---:|---:|---:|---:|---:|
'''.replace('CONSTRUCTS',f'{tot[0]:,}')
for r in rows:text+='| '+r['case']+' | '+' | '.join(str(r[k]) for k in ['construct_attempts','immediate_plain_read','sole_use_local_bridge','R3_recipe_eligible','ordinary_own_mapped_field'])+' |\n'
(H/'results.md').write_text(text);print(json.dumps(summary,indent=2))
