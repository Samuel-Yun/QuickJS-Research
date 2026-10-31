# 既有证据及本轮补采

所有路径相对 `js-interpreter-bench/experiments/`。本轮没有从汇总表反造原始计数。

|材料|状态|本轮使用方式与边界|
|---|---|---|
|legacy_ng_ic/attempt01/legacy_design.md、porting_map.md、artifacts/B/、build_manifest.json|已有且适用；实机源文件/ELF散列复核|B为最终安全移植；不恢复不安全历史代码。B与本轮A/M正式样本不相除。|
|legacy_ng_ic_slotfix/attempt01/patches、results.md|已有且适用|C仅空槽优先；不能把该问题沿用为新M的缺陷。|
|legacy_ng_ic_read_hit/attempt01/results.md及补丁|已有且适用|D内联读wrapper，仍不是P；旧wrapper成本不能直接解释M。|
|read_ic_mic/attempt01/design.md、implementation/、patches/、sources/identities.json|已有且适用；本轮逐文件复核并干净构建原M|新逐读点框架、容量、准入、序列化及引用管理；16B单槽M与56B四槽P。|
|read_ic_mic/attempt01/raw/formal及analysis/summary.csv|已有且适用；单独历史表|仅重算原批次Richards/own/poly2/poly4，不拼入本轮。|
|read_ic_hit_ablation/attempt01/raw/、analysis/、machinecode/|已有且适用|SW ON/LOOKUP直接取值干预有收益；SW与原M的桥接差异不为零，不能把收益搬回原M。|
|read_ic_dequickening/attempt01及mr_native_layout/attempt01|已有且适用|数值循环无目标读仍变化，代码布局/编译后状态是混杂；本轮不调布局。|
|v8_ic_on_off/attempt02/source_notes.md、材料包source_manifest.json|已有且适用；6文件散列复核|固定官方参考commit 37fb849…，不冒充d8精确构建commit。|
|v8_ic_octane/attempt01/runtime.json、reference_evidence.json|已有且适用；本轮重新核验制品/依赖/生效参数|ON正证据复用；OFF槽直接观测为UNKNOWN，不再反复尝试GetFeedback。|
|richards_site_attribution/attempt01/bytecode、mapping、source_evidence|已有且适用，注明诊断制品身份|原始state源码/双反馈槽/同进程转换及既有handler机器码；不是逐次V8命中记录。|
|本轮diagnostic_sites.csv、mechanism_sites.csv及raw/diagnostic/*.gz|补采已完成|A/B/M的N1/N2、真实最终before/after字节码与逻辑查找/桶/链计数；全诊断进程，不作耗时证据。|
|本轮V8_m1Read.txt、V8_m1_receiver_maps.txt及压缩日志|补采已完成|当前实际目标PC13/FBV0、ON 0→1与同进程receiver map；字段实测为in-object。无逐次命中率。|
|本轮raw/build/v8_GetNamedProperty_actual_machine_code.json|失败已保存|release拒绝只读print-builtin-code选项；不尝试换binary/构建V8，改引用既有反汇编并保留身份限制。|

旧 Richards JavaScript 方法外提 A/B 已暂停，与引擎 A/B 标签无关；本轮未使用该变体。
新诊断以最终 opcode 起点 `pc-1` 建立上下文，不以 `sf->cur_pc` 猜测当前opcode；操作数读取前记录，离线按真实指令长度解码。函数身份包括编译实例、完整函数源码SHA、实际码SHA和PC；匿名函数用冻结原源码中的唯一赋值关联，原匿名名称仍保留。

## 本轮保留的问题与失败

第一次WSL Git状态查询在DrvFS上阻塞，终止自己的查询后改用原生Windows Git，见raw/build/git_status_interruption.json与raw/host_git_status.json。未重置工作区。
第一次M诊断构建触发QuickJS禁止直接malloc的检查，改为仅诊断记录器calloc后重新在独立目录构建；失败日志/补丁保留，正式M源码未改。
第一次离线选择误用匿名函数名，保留selection_failure.json；实际运行成功的原始报告复用，用源码关联后继续，而非重跑/覆盖。
V8诊断开developer-only选项会在stderr给稳定性提示，原文保留；正式命令不含此类选项，正式stderr必须为空。

附加原M理由计数首次离线映射遇source_id=0；保留37个未知源码读点/37次读取，不伪配Richards，见diagnostic_scope_amendment.json。已成功运行的raw未覆盖，也没有重采样。
正式结束后用实际d8静态objdump成功导出Builtins_GetNamedPropertyHandler，见source_evidence/V8_GetNamedProperty_actual.asm；之前print-builtin-code失败仍保留，不再需要重试该flag。
M自身rdi_prepare前/后真实快照见prepare_snapshot_gate.json，补采已完成且不涉及正式性能进程。
