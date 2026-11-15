# CONSTRUCT_CONSUME_IC：真实覆盖为零，结束本轮

独立从冻结R3派生并构建probe，不叠加前三轮。完整Octane17/SunSpider26原负载独立进程计数各一次，N/输入/校验与计时脚本边界不改；probe时间不作为候选耗时。

第一形态：紧邻 `call_constructor; get_field_rdi`。第二形态：`call_constructor; put_locN; get_locN; get_field_rdi`，要求局部非captured、全函数静态只两次触及（这次写和这次读）、非eval环境；跨过的任何分支/catch入口均排除。旁表只记录静态形态及读取atom，运行后纯检查实际callee/new.target、原R3模板以及结果的普通自有C_W_E数据字段到实参映射，不额外执行JS读取。没有新增执行优化、没有消除对象或属性存储分配。

两套共49,231,038次构造尝试，其中49,230,525次成功返回后检查；另外513次原异常回退（Gameboy1、JQuery512）不产生可消费结果。第一形态2次（都是zlib原生构造器），合格R3模板0；第二形态0；合格映射自有字段0。因此对象消除0、属性数组消除0、引用/释放省略0。没有真实可用序列，按用户明确例外跳过Release全集；耗时和GM记N/A，不能记0%或用手写样例冒充覆盖。

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
| Richards.Richards | 30720 | 0 | 0 | 0 | 0 |
| DeltaBlue.DeltaBlue | 1169408 | 0 | 0 | 0 | 0 |
| Crypto.Encrypt | 17922 | 0 | 0 | 0 | 0 |
| Crypto.Decrypt | 4416 | 0 | 0 | 0 | 0 |
| RayTrace.RayTrace | 8524288 | 0 | 0 | 0 | 0 |
| EarleyBoyer.Earley | 4511232 | 0 | 0 | 0 | 0 |
| EarleyBoyer.Boyer | 8211328 | 0 | 0 | 0 | 0 |
| RegExp.RegExp | 0 | 0 | 0 | 0 | 0 |
| Splay.Splay | 982620 | 0 | 0 | 0 | 0 |
| NavierStokes.NavierStokes | 64 | 0 | 0 | 0 | 0 |
| PdfJS.PdfJS | 13660 | 0 | 0 | 0 | 0 |
| Mandreel.Mandreel | 0 | 0 | 0 | 0 | 0 |
| Gameboy.Gameboy | 31949 | 0 | 0 | 0 | 0 |
| CodeLoad.CodeLoadClosure | 4096 | 0 | 0 | 0 | 0 |
| CodeLoad.CodeLoadJQuery | 26624 | 0 | 0 | 0 | 0 |
| Typescript.Typescript | 493089 | 0 | 0 | 0 | 0 |
| zlib.zlib | 22 | 2 | 0 | 0 | 0 |
| 3d-cube | 441216 | 0 | 0 | 0 | 0 |
| 3d-morph | 0 | 0 | 0 | 0 | 0 |
| 3d-raytrace | 364544 | 0 | 0 | 0 | 0 |
| access-binary-trees | 10770432 | 0 | 0 | 0 | 0 |
| access-fannkuch | 0 | 0 | 0 | 0 | 0 |
| access-nbody | 3072 | 0 | 0 | 0 | 0 |
| access-nsieve | 0 | 0 | 0 | 0 | 0 |
| bitops-3bit-bits-in-byte | 0 | 0 | 0 | 0 | 0 |
| bitops-bits-in-byte | 0 | 0 | 0 | 0 | 0 |
| bitops-bitwise-and | 0 | 0 | 0 | 0 | 0 |
| bitops-nsieve-bits | 128 | 0 | 0 | 0 | 0 |
| controlflow-recursive | 0 | 0 | 0 | 0 | 0 |
| crypto-aes | 2617984 | 0 | 0 | 0 | 0 |
| crypto-md5 | 0 | 0 | 0 | 0 | 0 |
| crypto-sha1 | 0 | 0 | 0 | 0 | 0 |
| date-format-tofte | 768256 | 0 | 0 | 0 | 0 |
| date-format-xparb | 10240512 | 0 | 0 | 0 | 0 |
| math-cordic | 256 | 0 | 0 | 0 | 0 |
| math-partial-sums | 0 | 0 | 0 | 0 | 0 |
| math-spectral-norm | 0 | 0 | 0 | 0 | 0 |
| regexp-dna | 0 | 0 | 0 | 0 | 0 |
| string-base64 | 0 | 0 | 0 | 0 | 0 |
| string-fasta | 384 | 0 | 0 | 0 | 0 |
| string-tagcloud | 0 | 0 | 0 | 0 | 0 |
| string-unpack-code | 2048 | 0 | 0 | 0 | 0 |
| string-validate-input | 768 | 0 | 0 | 0 | 0 |
