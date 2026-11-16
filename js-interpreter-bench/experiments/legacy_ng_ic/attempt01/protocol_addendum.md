# 冻结后发现的限制与补充检查

本文件是解释性补充，不修改manifest、protocol、schedule、selected N或正式raw；不改变样本选择规则。

1. `os.wait4`原始peak RSS包含fork/pre-exec高水位，不能按低位平台宣布qjs内存不变。`final_evidence.py`的小shell控制复现此影响。`memory_check.py`以GNU time另收每项目/版本3次新进程，单列内存数据，不并入30对正式时间。
2. Crypto源码加载时在ResetRNG前用Math.random填rng_pool；同一对的随机padding并未逐字固定。保留原来的两项时间并披露，另给排除整个Crypto suite的GM敏感性。没有事后修改JS、选择输入、重采样或剔除异常值。
3. 原始`sanitizer.json`先记录allocation尚未检查，后续`correctness/extra.json`记录192档内存限额及sanitized roundtrip已通过。按时间顺序理解，二者都保留。
4. 诊断汇总第一次在零查询单元格式化None时失败，已生成CSV和原始计数未丢弃；仅修复文字输出，不重跑正式样本。失败终端信息在本轮工具记录，后续补充到failure notes。
5. 正式A/B都没有-DNDEBUG；这是上游Makefile的实际optimized build，新增IC断言与其它生成代码的成本包括在B中，不偷偷换另一组编译参数。
