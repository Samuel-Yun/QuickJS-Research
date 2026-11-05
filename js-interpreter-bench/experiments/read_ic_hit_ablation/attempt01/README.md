# MIC命中取值路径：四条件同批次消融

本轮是有目的选定的8项机制实验，**不是全Octane，不计算总体GM**。
本轮实际完成1024/1024条有效正式样本、16个workload诊断、12个机制诊断、36个RSS进程及48个Crypto身份检查；无补跑或删除异常值。
本轮20个数据输出、上轮兼容格式29个输出，分别在Windows原生Python的新目录连续重算两次通过，未依赖旧ELF。
结论见 [results.md](results.md)，全部时间和区间见 [analysis/tables.md](analysis/tables.md)；实际计数及平衡/时钟核验见 `analysis/{formal_audit,audit,completion}.json`。
设计在实现前记录于 [design.md](design.md)，四条件协议与输入在 `protocol.json` / `measurement_manifest.json` 冻结。

## 四条件

- A：原版upstream2026-06-04 / 04be246001599f5995fa2f2d8c91a0f198d3f34c。
- M：上轮正式M的源码字节原样恢复、新构建，无开关。
- ON：开关版SW，QJS_READ_IC_MODE=1，候选命中后直接offset取当前值。
- LOOKUP：**同一SW/qjs、同一ELF SHA/argv**，配置值0，候选命中也继续正常hash查找，不额外更新缓存。

SW在pthread_once中native读取一次配置，进程内不可改，runtime私有字段保存值；非法/缺失值拒绝创建runtime。
不在每次读中getenv，不通过JS设置。ON/LOOKUP站点仍16字节，新增runtime存储及代码增量在 `machinecode/` 记录。
正式子进程使用冻结的相关环境白名单（PATH/HOME/USER/LOGNAME/LANG/LC_ALL/LC_CTYPE/TZ/TMPDIR，存在者）；不公布无关会话密钥。
四条件环境键相同，ON/LOOKUP只改变一个等长值。见 `base_environment.json`，原始记录含完整环境身份hash。

## 计时与顺序

同一WSL2 Ubuntu24.04.2/x86_64，GCC13.3.0，官方-O2/-g/-fwrapv，保留断言，无LTO/PGO。
内部原生CLOCK_MONOTONIC毫秒，父绝对monotonic ns起止；UTC只日期。Setup/静态编译在外，首次Run在N次内，无额外预跑。
GC/helper/builtin/regexp/动态编译按原Run计入，不称纯lookup或纯解释器self-time。每个微基准完整调用4096轮。
每项共同N，12独立pilot均>=1秒后冻结。32个四元组：24全排列加两份平衡块，位置/组内有向相邻对均8次，seed20261024。
性能进程串行，不与构建、诊断、RSS或Crypto身份检查并行；不删outlier，不补跑失败。新campaign不混旧时间。

主比较LOOKUP/ON、A/M、M/ON，另A/ON和A/LOOKUP；均>1表示分母条件更快。
10000次四元组配对bootstrap、探索性95%区间；n-1标准差，Tukey-halves四分位。内部ms/Run、外部ms/process分开。
不能相减A→M与LOOKUP→ON百分比推“解释了多少”，不能相减中位数推查找/GC/初始化self-time。

## 数据和证据

`sources/identities.json`、`manifest.json`、`patches/`：源字节、制品、M→SW及A→M差异。`recovery/baseline_M.tar.gz`只含已核对的冻结M源码，不含ELF/bare history，MIT许可证保留。
`correctness/`、`raw/build/`：回归、上游、保存加载/qjsc、GC/OOM、两模式实际sanitizer检查和非法配置。
`machinecode/`：真实native分支、布局、ASLR/加载信息；正式没有诊断符号。
`raw/{correctness,calibration,pilot,selected_correctness,formal}/`：不可覆盖的分阶段新进程记录，完整stdout/stderr/配置/命令/hash/计时。
`raw/diagnostic/*.json.gz`：独立诊断，双SHA旁置；只有门禁和16项选定workload，不能冒充正式分支逐次记录。
`analysis/`：统计、图、状态匹配、RSS、端到端和独立审计。完成后看 `results.md`、`analysis/tables.md`。

诊断hash计数独立于shape比较：记录原find_own_property的bucket/链结点，IC调用上下文另分配到最终PC；不覆盖所有其它helper内部的其它查找实现。
冷首次查询入分母，q=direct+forced+normal；ON forced=0，LOOKUP direct=0，维护/引用/候选序列对齐。
相同源码多次compile按规范code/atom/source/PC及实例签名多重集合核对，不以跨进程instance_id或shape指针对齐。
CodeLoad独立诊断N双方上限8，`diagnostic_plan.json`同时记录正式N；计数为全进程，不外推为正式N总量。
间接保活对象图字节UNKNOWN；直接请求、shape边、RSS、text不同指标。RSS仅三套suite每条件3个GNU time进程，36个，不混正式时间。

## 数据重算：无旧ELF，每次新目录

```sh
python -B portable_check.py
python -B portable_check.py
python -B portable_check.py --previous
python -B portable_check.py --previous
python -B audit.py
python -B archives.py verify
```

`--previous`兼容上轮数据格式，在本attempt的新 `replays/previous_*` 输出，不写旧attempt。
当前数据输出 `replays/current_*`；每次独立目录和audit，当前host/python记录不与旧host字符串比较。
统计从raw重建，RSS也从原始记录重建，不依赖旧缓存CSV；supplementary读取本次新生成中间表。
保留rel/abs=1e-12数值容差，比较真实结构、数值及SVG坐标，不能忽略数值差别。原raw/hash不修改。
恢复诊断原文：`python -B archives.py restore --destination /new/nonexistent/path`。

## 源码重建：进入新attempt，不覆盖本轮

```sh
python -B new_campaign.py ../attempt02
cd ../attempt02
export IC_ABLATION_STORE=/absolute/new/linux/store_attempt02
python -B prepare.py prepare
python -B build.py release
python -B correctness_run.py
python -B diagnostic.py build
python -B mechanism.py
python -B machinecode.py
python -B timer.py
```

源码来自校验过的archive及固定补丁，A/M逐文件核对前轮冻结身份，M归档可公开恢复；不要求旧/home下有ELF或bare仓库。
`prepare.py archive`、`bootstrap.py`是本轮开发来源记录，不是新campaign的必需步骤，不要对已派生模板重复bootstrap。
依赖Linux x86_64、Python3标准库、GCC/make/binutils/gdb、GNU time、开发头文件。源码许可证见归档，Octane BSD通知保留。

## 启动新campaign

```sh
python -B campaign.py pilot
python -B campaign.py formal
python -B campaign.py tail
python -B portable_check.py
```

门禁不足不进入formal，模式/时钟异常保留证据。`run.py formal`可resume：跳过已有位置，包括失败，不自动补跑。
身份检查另设 `python -B identity.py`，可用`--map oldprefix=newprefix`只映射路径、不改SHA；统计不调用它。
本轮收尾另实际运行了 `python -B postcheck.py`，核对三个源码树及release/diagnostic/sanitizer制品与冻结身份；记录在 `analysis/post_runtime_sources.json`。
后台监控以实时文件数为准；1024条和所有campaign尾阶段完成后才写completion。可移植重放/交付检查是随后独立执行的步骤。

## Crypto仅输入身份/正确性

`python -B crypto_inputs.py`在正式采样结束后运行。三个预声明seed、N2、四条件、原算法与观察副本共48进程，不采性能，不进本轮矩阵/GM。
随机协议在base.js/crypto.js加载前安装；冻结源码rng_seed_time实际使用固定常数，不按函数名猜时间来源。
观察完整load/Setup/Run状态、RC4初始化key、实际随机字节/PKCS#1填充和密文；与无观察hook的原函数流程核对。
每seed输入/输出身份必须跨条件一致，改变seed须实际改变密文。不完整则报告CRYPTO_INPUT_LIMITATION，不修改历史结论。
**确定性PRNG仅用于benchmark，禁止用于真实安全加密。**

本轮到证据和分析停止，不自动调策略、提交、推送或切分支。
