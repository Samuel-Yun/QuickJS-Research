# 结构性 IC 原型搜索

本轮从冻结 s001 分别尝试冷端多态、共享字段动作、原型结构版本、借用 receiver 的指令融合、结果类型专用读取、普通调用元数据预解码。A、s001、mx019 均保留原制品。私有 JWST 未读取，也未纳入材料。

所有新增源码和实验位于此目录。active 是可重复构建的活动目录，artifacts 为不可覆盖的按编号制品。patches 从原 s001 生成，identities 分开记录源码文件 SHA256 和 binary SHA256。既有 v3/v4 原始记录保持不变。

## 固定口径

WSL2 Ubuntu24.04.2 x86_64，同一 boot，CPU2 affinity。GCC13.3，`-O2 -g -fwrapv -DHAVE_CLOSEFROM`，无 LTO/PGO、额外 NDEBUG 或地址填充。功耗、温度和后台负载控制为 UNKNOWN。

复用原生内部单调时钟、固定 Octane17项和 SunSpider26项、已验证输入与断言。加载、Setup 在外，首次完整 Run 计入 N 次执行，无计时前 workload warmup。GC、builtin、RegExp 等保留在实际执行区间。探索沿用旧 N 的四分之一，至少1，Crypto 保持原 N 以验证确定性密文。低于1秒仍保留并标记。

正式改动前运行同一个 s001 文件的两个标签空对照。候选单次完整 Octane 与同批 s001 比较，按 case 平衡 AB/BA。单次结果只有点估计。零散漂移不会变成无限停机门槛。完整阶段与固定晋级规则见 protocol.json，失败、偏短和异常值保存在 runs.jsonl。

## 运行入口

在本目录内使用 Linux Python。

```sh
python3 run.py prepare
python3 run.py null
python3 run.py build a01
python3 run.py screen a01
python3 run.py compare a01 --rounds 5 --tag independent
python3 run.py compare a01 --kind sunspider --rounds 3 --tag sensitivity
```

同 campaign 可恢复尚未完成的有效位置。存在正确性/进程失败时保存原记录并停止该 campaign，显式解决后使用新 campaign。不能覆盖旧样本或择优补测。

## 设计参考

以下为机制参考，不能用来证明当前 d8 制品的精确实现。

- PEP659 的小范围专门化、quickening 和低成本回退，2021 年提出。[PEP659](https://peps.python.org/pep-0659/)
- Luau 官方性能说明中的 interpreter 字段预测和方法调用组织。[Luau](https://luau.org/performance/)
- V8 文档固定 commit `bcefebe8498628369427a91063982fc0160da99f` 的 shape/handler 和 prototype validity 概念，源码对应关系另行限制。[V8](https://chromium.googlesource.com/v8/v8/+/bcefebe8498628369427a91063982fc0160da99f/docs/runtime/hidden-classes-and-ics.md)

探索得分、正确性覆盖、未完成项最终以 results.md 和 decision.json 为准。这里的命令不表示已经完成正式30轮验证。

## 本轮实际交付

已完成11个完整 Octane 初筛、425条有效恢复复测、416条完整 SunSpider 复测。d03 的 Octane 核心/s001为0.9898，SunSpider/s001为1.0064且crypto-sha1回归约13.5%。d04整体方向不明确且RegExp回归。第12个原型d05通过正确性，在11/51条后触发计时环境门禁。正式30轮尚未启动。

当前状态见 `PERFORMANCE_STOP.json`。原始独立批次372条和d05部分记录分开保存，完整有效批次的统计没有纳入它们。活动源码已恢复到s001，重建工作副本与冻结s001的`.text`相同，完整SHA不同，详见active_status.json。所有统计仍对应各自identity记录里的冻结制品。

### 离线重算

```sh
python3 analyze.py recovery.v5.octane
python3 analyze.py recovery.v5.octane --base A
python3 analyze.py recovery.v5.octane --base mx019
python3 analyze.py sun.v5.sunspider
python3 analyze.py sun.v5.sunspider --base A
python3 tables.py
python3 audit.py
```

这些入口仅需本目录JSON/CSV和原始归档，既有绝对binary路径只作为来源身份。归档SHA与恢复方法见raw_archive.json。`STRUCTURAL_ARCHIVE_ONLY=1`可强制读取gzip。audit.py中的历史原始文件核对在那些文件可用时执行，缺失会明确标记。

### 恢复源码与新构建

```sh
python3 recover.py d03 --destination /tmp/qjs-d03-source
tar -xf ../v3_mass_search/build_support.tar.gz -C /tmp/qjs-d03-source compat/test-closefrom.c
make -C /tmp/qjs-d03-source -j1 qjs qjsc
```

recover.py先核对patch和全部32个源码文件。它依赖共享的v3固定seed_M.tar.gz、seed_s001.patch和generate.py。补丁均相对s001，logical parent另见candidates.csv。新目录构建会产生新的制品身份，应建立新manifest/cohort；不能把历史完整SHA换成新值。

### 继续采样所需条件

先解决UTC/单调跨度不连续，保存稳定性探针与新环境，再建立明确的新campaign和恢复协议。当前门禁会拒绝直接续跑性能。d05的下一步是重采完整17项与26项同批对照，保留已有11条为受阻记录；相关剩余问题见results.md。此处的构建与诊断命令独立于正式采样。
