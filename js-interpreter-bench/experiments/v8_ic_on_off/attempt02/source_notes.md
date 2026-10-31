# 固定参考源码与 use_ic 的范围

材料由用户提供，来源声明与 SHA256 见 `materials/V8_IC_Resume_Materials_20261025/source_manifest.json`。本机仅解包、校验和阅读，没有重新下载、关闭 TLS 或构建 V8。参考 commit `37fb84941c9be9f9914ee50b1ad366f06a1bd764` / 15.6.21；**不是现有 d8 精确构建 commit 的证明**。下列行号均相对此包 `source/src/`，完整文件可查。

## 模式与打印限制

- `flags/flag-definitions.h:895–926`：`V8_JITLESS` 是编译期宏；一般构建仍可接受运行时 jitless。后者含义为禁止运行期可执行内存分配，并关闭 TurboFan/Turboshaft、Sparkplug、Maglev 等，强制解释 RegExp；3467–3487 进一步禁用 RegExp tier-up。1127 定义默认 true 的 use_ic；3116 定义默认 true 的 lazy。
- `runtime/runtime-test.cc:2377–2500`：GetFeedback 在编译期 V8_JITLESS 分支返回 undefined；非该构建中，OBJECT_PRINT 不存在时也返回 undefined。不可把这些 `#ifdef` 当成运行时 `--jitless` 的直接分支，也不可从返回 undefined 推断槽为空。
- 同文件 `1286–1306`：无 OBJECT_PRINT 时 DebugPrintImpl 只输出 Brief(object)。实际 release 输出与此限制一致，但缺少完整构建参数，不能反向声称已经验证了所有宏。

## named-property 读取链路

`interpreter/interpreter-generator.cc:598–630` 的 GetNamedProperty 读取 receiver、常量池 name、feedback slot/vector，经 AccessorAssembler 返回值到 accumulator 再 Dispatch。实际稳定 own 探针为 PC0 / FBV[0]，不是按名字推测的位置。

`ic/accessor-assembler.cc:3392–3463` 的 LoadIC_BytecodeHandler 在有 vector 时尝试 monomorphic/polymorphic handler，miss 进入 Runtime_LoadIC_Miss；vector 为 undefined 则走 LoadIC_NoFeedback。**该 handler 本身没有逐次检查 use_ic**，不能把开关解释为删除全部快路径。

`ic/ic.cc:3238–3268` 的 Runtime_LoadIC_Miss 按槽种类调用 LoadIC/LoadGlobalIC/KeyedLoadIC。普通 LoadIC::Load 在 419 行计算：

```cpp
bool use_ic = (state() != NO_FEEDBACK) && v8_flags.use_ic && update_feedback;
```

456–460 行仍建立 LookupIterator 并 LookupForRead；464–465 行只有 use_ic 时调用 UpdateCaches。479–483 行仍通过 Object::GetProperty 取得属性值。UpdateCaches 的 1104、1112–1113 行计算 handler、SetCache、TraceIC。故本轮操作可以解释为门控这些缓存更新/安装，并非删去属性读取语义；源码分支与 ON 有转换、OFF 无对应转换的既有观测不矛盾。后者仍非 OFF 槽直接快照。

## 范围、保留的工作与未核实项

| 路径 | 参考源码中的明确证据 | 边界 |
| --- | --- | --- |
| named load | ic.cc:419,464–465；UpdateCaches:1061–1113 | 关闭更新/安装条件，普通查找和取值仍在 |
| global load | ic.cc:515–534 | 控制 lexical-context feedback 配置；普通 Context::Get 仍在 |
| keyed load | ic.cc:1955–1958,2010–2025 | CanCache 检查 use_ic 并门控 element handler 更新；某些 vector_needs_update 分支仍存在，不能说全部反馈设施被移除 |
| named store | ic.cc:2292,2355–2382 | 控制 UpdateCaches，SetProperty/定义语义仍保留 |
| global store | ic.cc:2172–2189 | 控制 context反馈/stub 配置，实际写 context 仍发生 |
| keyed store | ic.cc:3078–3123 | element 缓存更新受 use_ic 等条件约束；不是全部 keyed 路径逐次命中证明 |

LoadIC_NoFeedback（accessor-assembler.cc:3737–3766）仍有 map/type 检查、GenericPropertyLoad（kDontUseStubCache）及必要 runtime fallback。反馈向量分配、已有 vector/handler 入口、对象 map/descriptor、内建代码和其它内部缓存设施并未据此被证明全部移除；完整余留缓存清单 UNKNOWN。不要把这些静态分支冒充本次目标 site 的逐次路径测量。

## 证据状态

旧 attempt01 的同进程 dump/log 把 stableOwn 的 GetNamedProperty PC0、FBV[0] 与 ON 的 0→1 记录对应；两边累计结果均30000。新 attempt02 重新核验同一制品身份和有效参数后可复用这项证据。`selected_OFF_no_cache_state_verified=null`；无 OFF 日志仅辅助，不能称“已测得无缓存”。新门槛名称为 PASS_WITH_OBSERVABILITY_LIMITATION，结论只涉及 use_ic 配置的净效果。
