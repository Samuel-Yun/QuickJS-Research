# 本批次停止：BLOCKED_CORRECTNESS

本轮已完成源码接入、原有正确性门禁、校准及558条Octane正式记录；
没有完成计划1530条。随后新增的原生finalizer/C API回归发现旧E错误，
因此这些时间不得用于说明E的净收益、也不与后续修复版本混合。

证据：`campaign_stop.json`、`raw/validation/finalizer_store_v2/{A,E,E_san}.run.json`。
修正测试本身的ClassID初始化后，A通过；E断言退出；E_san在own-store miss
的set_value处报告旧属性指针访问。详见后续 `../attempt02/repair_notes.md`。
前一版测试在A/E注册类时退出的结果也保留，不能当作有效语义对照。

原E源码、binary和冻结manifest没有被替换；raw未删改。558表示已落盘并通过
当时Octane结果门禁的记录，不表示该引擎通过了后来新增的安全检查。
中止时尚未写完结果的started位置保留为缺失，不伪造返回值。

后续attempt02仅修复该生命周期顺序错误，重新构建、验证、校准和采集。
这是新批次，不是往本批次补样本；旧A与d8仍冻结不变。
