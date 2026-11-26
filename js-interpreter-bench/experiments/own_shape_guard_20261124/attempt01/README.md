# OWN_SHAPE_GUARD

独立两档自有字段读实验。完整结果和复现命令：[results.md](results.md)。

机制：RELAX_CLASS 去掉 Object 类别限制，SHAPE_ONLY 进一步用 shape 验证已填入的真实自有数据槽。布局证明：[layout_proof.md](layout_proof.md)。

补丁：SPARSE-to-RELAX_CLASS.patch、SPARSE-to-SHAPE_ONLY.patch。两版各自对冻结 SPARSE，不叠加。

计时：raw_timings.csv、timing_comparison.csv、micro_time/、target_time/。计数：micro_counts/、target_counts/ 及 coverage CSV。
字节码：micro_counts/*.snapshot.jsonl、*.bytecode.txt。Release 汇编：assembly/。正确性和 ASan/UBSan：gate.json、validation/、validation_js/。
