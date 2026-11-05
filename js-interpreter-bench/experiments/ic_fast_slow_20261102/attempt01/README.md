# IC 快路径、普通查找与小范围实现尝试

状态：**全部6060/6060正式记录有效**：机制630、SunSpider3120、micro270、Octane2040。U独立正确性及ASan/UBSan门禁通过，最终制品复核、本地只读参考完整性检查通过；worker已正常退出，没有继续下一轮实验。独立审计采用v2，v1的raytrace文件名误报及失败日志保留，见postprocess_fixes.md。

结论见results.md：条件直接取值有收益，但本轮字节偏移U没有得到Octane整体净加速的证据，三个小案例均退化，不作为已验证的稳定优化推广。全部逐项绝对时间与区间在sunspider/results.md、octane/results.md及各analysis/CSV；native变化见machinecode/U_notes.md，补丁见patches/M_to_U_generated.patch。

底座为已核验的原 A / 原 M / 冻结 V8_ON；E 只作背景。本轮不修改旧实现、旧 raw 或本地只读参考项目。私有审阅材料不进入本目录。

顺序：公开路径审阅 → 七条件采用比例机制实验(630) → 数据依据的修改及正确性 → SunSpider 四条件(3120) → 同批 micro 三条件(270) → Octane 四条件(2040) → raw-only 统计与独立检查。总目标 6060 个正式新进程，pilot/诊断/正确性另计；失败和偏短样本保留，不伪造配额。

已有材料见prior_evidence.md、paths.md、paths.csv、review_guide.md。修改依据见change_plan.md；可应用的最终补丁是patches/M_to_U_generated.patch，早期手写补丁及失败日志保留但不是复现入口。构建树和ELF放独立Linux构建区，不进入普通Git。

## 运行与恢复

以下命令均在本目录、同一Linux/WSL cohort下运行。不要在工作中的采样旁并行启动第二套命令。jobs/的*.started.json和*.done.json、worker.stdout.log给出实际执行状态；隐藏本地WSL worker只负责串行运行，无服务安装、无网络上传。

```sh
# 只重算公开raw，不需要任何旧ELF、Linux用户目录或私有参考项目
python3 analyze.py mechanism --output replay_01
python3 analyze.py sunspider --output replay_01
python3 analyze.py micro --output replay_01
python3 analyze.py octane --output replay_01

# 本轮已在Windows无引擎环境实际执行上述四批重算
python verify_replay.py

# 有冻结制品和已通过U_gate的本机：串行入口（worker已在运行时勿重复）
python3 benchmark.py sunspider
python3 benchmark.py micro
python3 benchmark.py octane
```

raw为只写一次；已经有raw的有效位置不会重跑；有started却没有raw的位置拒绝自动补跑。不能跨boot补位。外部中断需新建campaign/cohort，保留原目录；不能删除标记伪装完整。

同boot下**显式续跑**使用`python3 resume.py sunspider`（也接受mechanism/micro/octane），仅在原worker不再采集时执行。该入口先核对旧frozen身份，保留原冻结时间戳，再跳过已有位置；它不会绕过孤立started标记。不要直接用benchmark.py重写已有frozen的时间戳；普通新campaign入口与续跑入口分开。已完成campaign只提示重算统计，不启动新进程。

最终证据：completion.json、independent_audit_v2.json、post_identity.json、privacy_gate.json；Windows raw-only复算在各replay_windows_01/，一致性见replay_verification.json。首次independent_audit.json不是最终验收，保留它用于说明后处理误报修复。报告中的跨1方向不明确，不等于等效证明；所有区间均为探索性未多重校正。

## 重建与公开材料

runtime.json是原始身份和绝对路径来源记录，不为异机统计而改写。build_u.py从已核验M_source_files逐项复制到独立构建区、应用最终补丁，用官方make构建Release及独立ASan/UBSan版。需要重建时先恢复对应源码：上游commit04be246001599f5995fa2f2d8c91a0f198d3f34c及read_ic_mic/attempt01/patches/A_to_common_M.patch；逐文件匹配ic_mechanism_audit/attempt01/manifest.json的M_source_files，而不是用最新QuickJS。异机路径映射及新二进制哈希必须在新attempt明确记录，不能假装拥有旧ELF哈希。

Octane输入按attempt03的LF_SHA固定，原CRLF字节身份另保留；SunSpider沿用冻结移植文件与既有checksum集合，不新加允差。scripts/为可重建派生JS（已忽略以避免大文件入Git），逐进程SHA保存在raw；通过benchmark.py的script方法可重建。raw-only统计不读取这些派生文件。Box2D另作覆盖，不纳入17项；未测官方latency。

性能是内部monotonic区间：已静态加载后首次Run也在N次内，不额外预跑。GC、helper、builtin、regexp和动态编译保留。V8是严格jitless、no-lazy、use-ic，不用旧max-opt数据。U的prop_offset单位变为字节，仍读当前prop数组、不缓存值、不删守卫；缓存结构和初始化策略未变。采样完成后才报告全套效果，不从静态指令条数推出收益。
