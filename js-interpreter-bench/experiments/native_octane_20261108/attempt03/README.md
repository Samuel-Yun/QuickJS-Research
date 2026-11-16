# PREP2 后续三个独立改动

用户授权验证准备分配、B2覆盖与调用/引用管理方向。以冻结PREP2为父版，各新版本完整17项Octane各五个新进程；只采255条新性能记录，复用旧A、P1+B2、PREP2和V8_ON。没有SunSpider或V8_OFF。

|版本|改动|保持的边界|
|---|---|---|
|COALLOC|最终源码编译时统计读点，在函数原分配尾部预留24B记录，字节码直接就地改写|运行时命中逻辑与函数头144B不变；序列化加载仍使用原独立存储回退|
|FUSE_A1L1|在已有arg0/loc0融合之外，只增加arg1/loc1+get_field|保留两条指令长度及第二入口；精确own-data命中才借用，否则正常加载|
|CALL02|正常返回后，对0～2参数的普通调用与方法调用展开释放循环|释放顺序不变；异常、tail call、较大参数数量保持原路径；不改参数所有权协议|

三个版本分别从父版生成，互不叠加。选择依据来自[前一目录的独立诊断](../attempt02/README.md)；selection.json冻结于候选性能采样前。Boyer中arg1/loc1相邻读取命中机会为387518/170470次，RayTrace为86775/22057次，Richards的loc1为36148次，均为N=1 Run区间独立计数。Callgrind将Boyer普通调用清理循环对应源码行归为11712917条Ir，约占总1142069720的1.03%，不是原生CPU时间占比，也不是全部可消除工作。

前一资格批次因新增C API测试误用JS_NewClassID签名，在编译时停止且无正式样本。失败保留在attempt02；本批修正测试重新完整资格检查，引擎变换不变。修正后的原生finalizer检查先独立通过，再冻结本批协议。

安全阶段覆盖常规JS、混合own/prototype、getter/Proxy、重入和异常，C API roundtrip/GC/native finalizer、qjsc以及ASan/UBSan。新增finalizer次序检查覆盖普通/方法调用0～5参数。独立探针验证COALLOC函数内存储、与父版的opcode/atom/site映射、加载回退及八次目标分配失败恢复；也验证两种新融合和三个短参数清理分支实际命中。诊断计数仅存在于单独probe。LSan因既有环境限制关闭，不声称完整test262通过。

串行构建、诊断和性能采样，固定逻辑CPU2；本机GCC15.2，保持-O2 -g -fwrapv -DHAVE_CLOSEFROM，无新增LTO/PGO/NDEBUG。输入/N/首次Run边界复用冻结协议。三个新版本按case交错，每轮轮换位置；父版和旧对照为跨批次探索，统计区间不覆盖未观测到的批次漂移。

`python3 -u -B run.py all`为本批已用的完整入口，冻结后不修改生成器、协议或性能源码，不自动重试失败token。性能完成后，`python3 -B review.py`只读取压缩raw独立复算，不启动runtime。结果见results.md、statistics.csv、aggregate.csv、paired_ratios.csv；raw与源码/输入/制品哈希保留。

已完成255条性能采样、51条Octane正确性及全部专项检查，审计和统计独立复算通过。核心相对PREP2：COALLOC +1.26%、FUSE_A1L1 +0.26%（区间跨零）、CALL02 +0.71%，没有晋级或组合。性能结束后另做五条N=1指令诊断，未并入时间统计。结论见[summary.md](summary.md)，完整表项见[results.md](results.md)。
