# Splay 的逐读点 IC：Run 内诊断与受控验证

本轮从 myx / 894e0a35ff331d4235370dc26112e5916c27c567 开始；旧实验不可改写。
入口 `python3 run.py <stage>`。实际阶段及完成数以 progress.json / 原始记录为准；本文件不预告实验成功。

- A/M/官方 d8 优先复用冻结制品；U 不参与。
- 第一阶段为 17 项 × A/M × repetitions=1/2 的分阶段诊断。计数、正式时间分开。
- 以源码 SHA、规范化指令/atom 序列、独立编译实例与真实 opcode PC 标识位置。
- 根据诊断及机制对照再决定唯一 OPT；证据不足时明确不实现。
- 正式边界沿用 FIRST_CALL_INCLUSIVE，可靠原生单调时钟；无额外 workload 预跑。
- 所有发布材料只据公开 QuickJS/Octane/V8；不读取或复制私有 JWST。

预先约定统计：30 个完整配对轮次、bootstrap 10000 次、seed=20261104；
Octane 核心16项/13suite及扩展17项/14suite，suite 内 GM 后 suite 等权。
失败和偏短样本保留；未知制品来源/温度/频率/背景控制标 UNKNOWN。

## 实际状态：BLOCKED_ENVIRONMENT_PARTIAL

已保存新稀疏诊断44/68条、旧密集41条另存、官方d8的Splay N1/N2真实dump和IC/Map日志。
**正式性能0条，机制计时0条，没有OPT。** 缺失/未知不能当通过；见 [results.md](results.md)、[site_notes.md](site_notes.md)、[summary_v2/audit.json](summary_v2/audit.json)。

权威摘要为 `summary_v2/`。`summary/` 是首次离线输出，保留；`v8/status_v2.json` 更正初版把函数身份打印称为反馈快照的过强措辞。

### 不需要任何引擎的复核

```text
python offline_audit.py --output replay_new
```

只依赖本目录公开raw/归档、inputs及JSON身份记录，不访问/home、不需要WSL、旧binary或JWST。
已实际执行Windows重放，`summary_v2`与`replay_v2`逐字一致，见replay_verification.json。
`.json.gz`可以用Python/gzip标准工具解压；各archive.json给出压缩/解压SHA256。大未压缩报告与构建产物留在Linux STORE，不放普通Git。

### 恢复前须知

WSL重复消失、boot变化，且一份新诊断ELF变为0字节。原因UNKNOWN，不能归咎某engine；冻结正式A/M/d8及其源/依赖收尾复核通过。
先确认WSL能稳定完成独立有界诊断，再核验 `diagnostic_v3_manifest.json` 中的实际binary。
损坏的诊断制品应新建修订构建，不能修改旧manifest/hash掩盖不一致。

```text
wsl -d Ubuntu --exec env SP_MAX_NEW=2 python3 /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/splay_ic_20261104/attempt01/diagnose.py collect
```

该命令仅是**在制品核验通过、WSL恢复之后**的有界诊断入口；`diagnostic_blocked.json` 的两个待保存位置仍须独立调查，不会被它自动宣称修复。
`focused.py`、`controlled.py` 和新 `campaign.py` 尚未完整执行验证，不应把“有脚本”当作“实验就绪”。
必须补完机制门禁和唯一候选决策，再启动新的正式campaign；不要直接执行旧queue中的任务。
`STOP_WORKER`已禁止后台队列，所有失败/中断记录保留。没有自动提交、推送或修改历史数据。
