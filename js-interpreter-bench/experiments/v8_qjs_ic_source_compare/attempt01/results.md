# V8 与 M/P：都能跳过查找，但覆盖和保护方式不同

## 做了什么

本轮沿冻结 QuickJS A、当前逐读点 M/P 和固定 V8 参考源码，读了 own 命中、miss 更新、原型 handler、shape/Map 修改及生命周期；从原始压缩诊断复核真实位点。只补取少数固定 commit 的官方文件，未重建或替换 runtime。另运行 A/M/V8_ON 各八案例 × N1/N2，**48/48 个新进程 PASS，零性能样本**。runtime、snapshot/ICU 的前后 SHA 一致，命令/完整输出在 `raw/`，独立复查入口见 README。

## 两边已经有哪些共同点

当前 M 不是“没有向量的简单缓存”：它也有外部 site 数组。最终编译阶段把 atom 操作数改成 site 索引；V8 的 GetNamedProperty 本来就带 name 与反馈槽索引。两边都用对象布局身份缩小取值工作，都有 miss 后的普通语义路径，但缓存记录及覆盖范围不同。M/P 不是早期按函数+atom共享的旧 NG 移植版；不能把旧版空槽问题当作当前 M 的解释。（`own_path.md` §2–4；实际接入 patch 与四个 read_ic 文件。）

对稳定 own 读，旧 M1 的 N2 原始记录再次核对为：A 执行 8192 次普通 find，M 只有一次，另 8191 次命中。这支持 **M 已实际省去重复 hash 定位**。命中仍要定位 site、检查 object/class/exotic、比较 shape、读当前 prop 槽及处理值/receiver 引用。V8 参考路径则匹配反馈 Map、解释 handler，并可从对象本体读取字段。它也不是零检查；两边 offset 单位和布局不同。不能从源码步骤数推出哪一步贡献了多少时间。（`evidence_recheck.json:own_integer`；`own_path.md` §3–5。）

最新 `function_value_call_path/attempt01/ratios.csv` 仅作同批背景：own 方法中 M 相对 A 耗时减少约 7.06%，但 M/V8_ON 仍为 1.3348；local 函数每 Run 目标字段只读一次，M/V8_ON 仍为 1.3310。不调用的数字读也有距离。因此剩余距离不能预先全归为 JS 调用、函数值引用或属性查找。上一轮 call_boundary_cost 的扰动门槛未过，成本归因未完成；本轮不使用其 PC 数分解原 A。

## 最具体的覆盖差别

原始 Richards 三处继承方法读取，M 每 Run 分别为 10671、6573、6573 次 inherited 回退，命中为零；本轮按函数源码 SHA、编译实例、PC30/83/73 从原 gzip 重查，N2 对应增长也一致。V8 两个 TCB 位置有单态转换，task.run 有四类 receiver 的多态记录；12 条同进程 receiver/holder 关系可核对。这是实际访问与对象关系证据，**不是位点耗时或逐次命中率**。（`prototype_path.md` §1–2；`evidence_recheck.json:Richards,V8_Richards`。）

V8 参考源码有至少两种相关方案：保护原型关系后，按 holder 字段位置读取当前值；条件合格时，也可能使用 ConstantFromPrototype。内部 const 不等于 JS 不可写。没有实际 handler 编码时，不能断言原 Richards 使用了哪一种。固定参考提交也不能冒充实际 d8 的精确构建 commit。（`ic.cc:1391–1433`；`handler-configuration.cc:119–150`。）

另核对了一个容易沿用旧说法的细节：固定源码默认多态有效 Map 上限为 **10**，旧同 d8 的实际 flags 也为 10，不是“V8 永远四槽”。反馈槽编号也不是容量。它不证明更大容量更快，更不能从中计算本次 Richards 的收益。（`prototype_path.md` §2。）

## 保护条件中最需要记住的一点

QuickJS 的 shape 引用不能不加条件地当成原型版本号。`js_shape_prepare_update` **只在 hashed shape 上**按引用数决定 COW；未 hashed shape 可能原地修改。receiver shape 也只持有 prototype 对象指针，不能单独保护该对象里的结构/值变化。因而“保存 receiver shape，然后缓存方法函数值”不是本轮可以直接采用的安全方案。（固定 A `quickjs.c:10302–10326,7978–7983,9705–9713`。）

本轮还追清楚 V8 参考的 data→getter 修改链：Map/原型用户保护失效，旧 handler 检查失败后进入 lookup 与重算。48 个语义测试验证了换值、换方法、遮蔽/删除、换链、getter receiver 与异常身份；并未观测这些测试各自的内部失效次数。（`prototype_path.md` §4；`correctness.csv`。）

## 下一步只留下一个假设

候选是 **普通对象、直接一层 prototype、两边均 hashed 的 data 读取**：保活并比较 receiver/holder 两个 shape，但每次读 holder 的当前 prop 槽，不缓存函数值。这样可复用已有 COW 与 mark/free 接点，避免直接引入 V8 整套原型用户系统。支持、排除、所有权和修改场景逐项写在 `candidate.md`；预计 site 从 16B 增到 24B 是布局推导，不是已测内存结果。

仍缺的首要覆盖证据是：原 Richards 的实际 QJS holder 在这些读点有多少满足 hashed 准入。收益、额外保活/COW/分支代价以及是否改善 Richards 均未知。下一轮应先验证这个准入条件，再做最小补丁的语义与同批对照；若覆盖少或无净收益，就收窄/否定这一个假设，不把“选出候选”写成“找到了主要瓶颈”。本轮至此停止，未实施候选。
