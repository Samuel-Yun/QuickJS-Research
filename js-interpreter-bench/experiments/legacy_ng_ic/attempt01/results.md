# 旧 NG IC 移植与 Octane A/B：实际结果

本轮已完成隔离移植、A/B新构建、正确性、校准、**960/960有效正式样本**、16项独立诊断与9个机制微测试。完成状态为 `COMPLETE_WITH_DISCLOSED_LIMITATIONS`，详见 [completion.json](analysis/completion.json)。没有修改旧引擎、旧实验或基准算法，没有提交或推送。

## 1. 移植了哪一版，哪些地方不同

底座为 upstream QuickJS **2026-06-04 / 04be246001599f5995fa2f2d8c91a0f198d3f34c**。实际 git 核对：NG 删除提交 `7de6d467ebc3598b5e10169f7be3de5b46ff0245` 的第一/唯一父提交是 **e1b5978775f75f9637c624fc45e69b92d2c15f42**，取这一版，而非重新实现最初#120或采用未合入的#551。元数据与完整删除diff见 `source_evidence/`，机制先记录在 [legacy_design.md](legacy_design.md)。

A是未打补丁的精确底座，B称 `legacy_ng_ic_port`。两边均在同一WSL2主机用GCC13.3.0重新构建，官方Makefile **-O2、无LTO/PGO**，无额外运行参数/GC调整；完整编译链接行见 `raw/build/A_release.1.log`、`B_release.2.log`。没有用旧冻结binary除以新binary。

历史核心保持不变：函数内按atom共享、4槽shape/属性offset、原来的探测/替换顺序、own普通数据属性准入、eager创建、原地重写三种字段opcode、shape/atom强引用与GC、序列化去IC及加载后不重建IC。没有缓存属性值，没有增加原型IC，没有修正下述填槽策略。

必要差异见 [porting_map.md](porting_map.md)：当前API/shape哈希布局、生成入口与writer签名适配；保留当前upstream已有字段内联路径；补齐OOM清理。另有一个明确的语义修复：共享读写atom的写IC命中后检查属性仍可写且非length，避免读缓存登记readonly shape后绕过写权限。安全移植版回归通过；本轮没有实际运行“不安全历史变体”，不将源码推理冒充该变体运行证据。这项保护本身的代价尚未分离。

正式制品已另存 `artifacts/{A,B}/{qjs,qjsc,quickjs.c,quickjs-opcode.h,Makefile}`，B附 `LICENSE.NG`。A qjs SHA256 `0505d8d3af32cc768a10c9eddd5a8c0b30b946ff39d083e512852c27f0912d9d`；B `aedb704e6d38aa48414357911446e47b0b05ef9f35b9c244589b7d36e5318802`。正式B未加入诊断。最终校验只发现两个原始源码文件改变，Makefile及其它底座文件保持一致，见 `source_evidence/final_identity.json`。

## 2. 正确性、覆盖与计时边界

- 每边新增952项显式机制断言通过；原12个smoke两边共24次通过且输出一致。
- 两边 `make -j2 test` 的11个可用测试入口通过；独立ASan+UBSan构建的针对性回归通过。
- 已执行、已经重写IC的编译对象：序列化→加载→执行通过；qjsc嵌入可执行文件通过；192档内存限制的编译失败清理、GC和释放，以及sanitizer版本通过。最初 `sanitizer.json` 的allocation尚未测试记录由后续 `extra.json` 的实际测试补充，旧记录不覆写。未运行完整test262或全Octane sanitizer campaign。
- 冻结Octane2.0官方revision `570ad1ccfe86e3eecba0636c8f932ac08edec517`，所有文件hash复核。18个Run单元中，16个有既有正确性门禁，N=1/2共64/64、选定N共32/32通过。Box2D两边可运行，但没有可信结果门禁，不纳入排名；zlib两边实际报 `read is not defined`，失败stderr保留，不是B独有回归。Splay/Mandreel官方latency指标本模式未定义。全清单见 `coverage.initial.csv`、`coverage.csv`。

主模式 **LEGACY_NG_IC_MONOTONIC_V1**：复用已有strict driver，捕获原生 `performance.now` / `CLOCK_MONOTONIC`。source/静态编译、adapter、必需Setup在外；第一次Run及后续N次在内，无计时前Run预热；检查、TearDown、输出在外。GC、helper、builtin、regexp及Run内动态编译仍在内。CodeLoad/Typescript的运行期frontend没有被排除，这不是纯查找耗时。

每单元共同N按2倍增长，达到两边内部时间≥1秒后，以**3对新进程pilot全部≥1秒**复核，再做所选N正确性。pilot和正式分开。正式每单元30对新进程、15AB+15BA，固定seed20261023并打乱每轮项目顺序；串行采样，不与编译或诊断并行。960个样本都≥1秒，零失败、零删除、零补跑。正式采样为北京时间2026-10-23 00:26—00:59，同一个WSL boot id。

**输入限制：** A/B源码、常量和N相同，但Crypto原文件1395–1438行在脚本加载时、`ResetRNG()`之前用原生 `Math.random` 填rng_pool，RSA随机padding并未逐对固定。这是继承协议的缺口，不满足“每个随机输入字节完全一致”。保留Crypto结果但带此限制；不事后改benchmark或重跑筛选。排除Crypto的敏感性GM见下文。其余工作负载也不把“相同源码”自动当作已证明所有内部状态逐字一致。

## 3. 逐项执行时间：14退化，2小幅加速

时间为**ms/一次原Run**；不是单次属性操作成本。speedup=median(A)/median(B)，>1为B更快；变化率=(B/A−1)×100%。每项A/B各30个有效样本。

| Run单元 | A median | B median | A/B | 配对bootstrap 95%CI | B时间变化 |
|---|---:|---:|---:|---|---:|
| Richards | 3.257707 | 3.854753 | 0.8451 | [0.8345,0.8539] | +18.33% |
| DeltaBlue | 6.706532 | 7.311222 | 0.9173 | [0.9108,0.9257] | +9.02% |
| Crypto.Encrypt† | 4.976916 | 5.174311 | 0.9619 | [0.9506,0.9734] | +3.97% |
| Crypto.Decrypt† | 94.033911 | 98.417734 | 0.9555 | [0.9489,0.9638] | +4.66% |
| RayTrace | 36.268904 | 42.952647 | 0.8444 | [0.8339,0.8540] | +18.43% |
| EarleyBoyer.Earley | 6.582762 | 6.789894 | 0.9695 | [0.9512,0.9831] | +3.15% |
| EarleyBoyer.Boyer | 102.040769 | 109.284439 | 0.9337 | [0.9213,0.9410] | +7.10% |
| RegExp | 173.712952 | 176.837155 | 0.9823 | [0.9746,0.9964] | +1.80% |
| Splay | 2.066955 | 2.330618 | 0.8869 | [0.8729,0.9093] | +12.76% |
| NavierStokes | 55.153562 | 54.637542 | 1.0094 | [1.0032,1.0175] | −0.94% |
| PdfJS | 167.700147 | 173.204839 | 0.9682 | [0.9632,0.9818] | +3.28% |
| Mandreel | 1657.582796 | 1627.275914 | 1.0186 | [1.0046,1.0360] | −1.83% |
| Gameboy | 311.561825 | 364.846773 | 0.8540 | [0.8466,0.8662] | +17.10% |
| CodeLoad.Closure | 0.575907 | 0.631574 | 0.9119 | [0.9031,0.9254] | +9.67% |
| CodeLoad.JQuery | 10.047292 | 10.511015 | 0.9559 | [0.9471,0.9652] | +4.62% |
| Typescript | 2032.665233 | 2302.850056 | 0.8827 | [0.8725,0.8877] | +13.29% |

† Crypto随机输入限制如上。本轮没有区间跨1的“方向不明确”单元，不能为了凑分类选一个。区间是按rep配对、10000次重采样重新计算两边中位数之比，固定seed；它是探索性逐项区间，不是已校正的多重检验。平均数、样本标准差、Tukey Q1/Q3/IQR、min/max均在 `analysis/statistics.csv`，实现见 `analyze.py`。

先同suite子项等权GM，再13个suite等权GM为 **0.925287**；16Run单元直接等权的次级GM为0.929475，不能混为同一加权方式。排除Crypto后12个suite为 **0.922560**，退化方向未改变。上述均是不完整覆盖下的派生时间比，**不是官方Octane总分**。

## 4. 执行、端到端、内存并不等价

完整逐项联合表在 [final_table.md](analysis/final_table.md) / [final_table.csv](analysis/final_table.csv)，包括30对执行和端到端、CI、原wait4 RSS，以及独立GNU time内存复核。

执行与端到端的方向在本轮16项一致，但比值不完全一样。例如：Richards进程中位数1673.42→1979.04ms；CodeLoadClosure1242.34→1377.01ms，端到端+10.84%（内部+9.67%）；Mandreel3034.32→2990.22ms，端到端−1.45%（内部−1.83%）。外部包含加载/编译/IC创建、Setup、验证与退出，不拿两种中位数相减当精确frontend时间。

**RSS方法问题及补救：** 正式 `os.wait4` 的ru_maxrss包含Python fork/pre-exec足迹，多数低内存项目出现约40MiB平台。独立小对照将父进程增加64MiB时，qjs的wait4读数升至78400KiB，而GNU time的qjs读数2956KiB；见 `analysis/rss_floor_control.json`。因此正式RSS原值和CI全部保留，但低位相等不代表引擎内存相等，`rss_A_over_B.svg` 仅是受污染原值的历史图。

全部16项另用未插桩A/B、相同JS/N、GNU time小launcher完成每边3个新进程（另有shell对照共102次），只作独立内存检查，不加入正式时间统计。CodeLoadClosure中位数 **61684→89712KiB（+45.44%）**；JQuery7336→8676KiB（+18.27%）；Typescript100896→104340KiB（+3.41%）。其它小差异受RSS粒度/ASLR及n=3限制，例如RayTrace3492→3408KiB不能解释成IC减少了所需内存。诊断IC分配请求字节不是这些RSS。

## 5. 独立诊断看到什么

计数构建与正式构建分离，每个兼容Run单元至少一次有效运行，9个微测试通过，释放后记录的IC live bytes均为0。查询不变量逐单位核对通过。范围是**整进程、已重写IC opcode**，不是所有属性操作或仅计时区间；首次普通opcode、未能重写的原型/getter等不在queries分母内。缓存单位是编译函数实例+atom，不能当逐site IC命中率；详细CSV见 `analysis/diagnostic*.csv`。

### 已观察：四槽并未形成四shape缓存

旧 `add_ic_slot` 完整扫描后回到起始index，替换那里；不推进index或优先空槽。新建index=0，运行中最多填1槽。保真移植没有改这一点。

- 8000次读取，1种shape：已重写查询7999，全部命中，每query探测1槽。
- 交替2/4/5/8种shape：各7999查询、**0命中**、4槽探测/query、7999次替换，仍最多填1槽。
- 同函数两个位置读取相同atom、两个不同shape：15998查询0命中；源码和单位标识确认共用缓存，不是两个独立site缓存。
- 400个不同短命Function各执行一次：整进程IC请求89752B、0重写查询；一个函数重复400次：304B、399查询均命中。此为计数和分配对照，不是正式性能比较。

### 代表项：高命中不保证净收益

| 代表项 | 已重写查询 | accepted hit | 查询探测/query | 更新扫描次数 | 观察 |
|---|---:|---:|---:|---:|---|
| Richards | 108541826 | 100% | 1.000 | 355 | 正式内部反而+18.33% |
| RayTrace（最大退化） | 24720110 | 94.22% | 1.173 | 5142402 | miss回退和更新扫描确实存在，但不等于已测出其时间 |
| Splay | 29201147 | 71.25% | 1.862 | 30173242 | 反复替换、前置探测额外工作明显 |
| Mandreel（最大加速） | 1940 | 100% | 1.000 | 162 | 查询很少，不能用“IC命中多”解释−1.83% |
| CodeLoadClosure | 2047 | 100% | 1.000 | 32833 | 120884次IC初始化、454816个atom单元，使用量与创建量悬殊 |

RayTrace的高查询函数/atom包括cache54/56的x、y、z，cache89的shapes；这是按频率选取，不是耗时热点排名。CodeLoadClosure诊断累计请求52693664B、峰值存活25520008B，反映eager函数/atom元数据成本，与独立RSS增长相符；这些是**诊断布局**的IC请求字节，包含额外字段，不含记录器/libc管理和shape间接保活，不能直接等同正式B内存增量。完整shape多样性未可靠取得，保留UNKNOWN。

## 6. 目前能解释到哪一步

**源码及机器码支持的解释：** 原A的 `GET_FIELD_INLINE` 已在解释器内做shape/hash查找并取值，不是所有读都调用巨大通用helper。B重写后则取得cache/atom、保存cur_pc，调用 `JS_GetPropertyInternalWithIC`；当前GCC产物该helper未内联，其中又call `get_ic_prop_offset`，命中后从当前对象offset取值、执行必要JS_DupValue；caller仍处理receiver引用。源码位置见 `artifacts/B/quickjs.c:8482,19401`，实际反汇编 `raw/build/B_IC_get.1.log`、`B_IC_probe.1.log` 和A/B解释器汇编。该检查证明新增工作存在，**没有量出它独占多少时间**。

这使“减少哈希查找但增加探测/调用/状态维护，未必净省”成为有具体证据的解释；Richards的零miss说明不能把它的全部退化归给多态miss。RayTrace/Splay的miss、共享与替换有真实计数，但不能把总退化百分比分配给它们。Mandreel只有少量已重写查询，其小幅变化也可能受代码布局、指令缓存、构建结构或其它间接影响，尚缺消融。正式与诊断二进制布局不同，不用诊断耗时验证收益。

**值得保留的设计点：** 缓存位置而非值，读取当前对象的新值；shape guard、严格准入与miss回到原语义；明确atom/shape生命周期、GC边与序列化去IC。这些在本轮语义及内存安全测试中工作，但不等于有性能收益，也不证明本轮未覆盖语义绝对无错。

**限制：** 单一WSL2平台，功耗/逐样本频率UNKNOWN、后台未完全控制；没有IC自耗时/硬件计数分解，代码布局混杂未排除；全shape多样性UNKNOWN；没有编译关闭但保持布局的额外构建。结果只说明这一保真移植、底座与协议，不能推广成“所有IC都无效”。

## 7. 下一轮最多三个候选（本轮未实现）

1. **先检验填槽/替换策略。** 证据：2shape即0命中、只填1槽，Splay/Typescript有大量miss与替换。最小消融仅改变空槽选择/轮转，容量仍4，其余机制固定；单shape及Richards作对照。风险是更长shape生命周期与占用、不同探测长度。这能检验一个具体历史策略问题，不能预言解决Richards退化。
2. **检验同atom跨site共享。** 证据：两个site同atom的15998次查询全miss；单位结构确认共享。最小诊断把这个冲突与互不干扰场景对照，再决定是否做独立site实验。风险是元数据及字节码空间增加；目前还没有Octane逐site成本归因，不能断言改成逐site会更快。
3. **检验eager创建与短命代码成本。** 证据：CodeLoad大量初始化、很少查询，正式时间和独立RSS均增加；微测试也重现创建/使用不匹配。最小后续消融比较只延迟元数据分配的独立版本，保持准入与替换；风险是首次访问负担、OOM/生命周期复杂化，且不能消除已存在的命中路径开销。

优先第1项，因为失效方式已经可用一个2shape例子确定复述，改动与可检验预测最小。若下一轮研究重点仍是Richards，则应另优先拆解单态命中路径的新增工作，而不能拿第1项代替其解释。

复现入口和命令见 [README.md](README.md)。本轮停止于这些结果，不自动实施候选改动。
