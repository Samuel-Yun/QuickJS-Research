# 第二批四轮：执行约束

来源：用户2026-11-15提示及“还是一样，每个只跑一轮”；中断后用户要求继续。
固定父版：ic_four_rounds_20261115/attempt01/03_constructor_plan/source.tar.gz及manifest/SHA（独立第3轮R3 CONSTRUCTOR_PLAN_IC，非3+4组合）。所有候选独立从同一源码包派生，不自动组合、提交或push。
顺序：01 FORWARD_CTOR_IC，02 CTOR_PROTO_TICKET，03 SPARSE_CTOR_IC，04 CONSTRUCT_CONSUME_IC；每轮先报告后继续。只对所改语义和真实命中/回退做有效差分；引用/所有权改动做ASan/UBSan，内部编码/旁表做保存加载。不能按基准名、函数/构造器/属性/文件名特判，不改benchmark算法/输入/N/校验，不生成运行时机器码。
有覆盖且语义成立的候选：针对性R3/候选对照、独立计数和未插桩Release完整Octane17/SunSpider26各一次（每项一个新进程）。native_confirmation_20261108/attempt02固定脚本、CPU2、Asia/Shanghai、C locale、Setup/Run边界、首Run计入，无额外预热。不新跑R3/C全集；旧对照标跨批次单轮筛选。无真实覆盖/构建不成/语义不成立可不跑全集，保留证据继续。
Octane按14 suite分层等权GM，SunSpider按26项GM，附逐项耗时之和；负数更快，单轮不报显著性。每轮results.md、相对R3补丁、复现命令、原始计时、关键计数和全部表项。终表回答拓展覆盖/降低已有命中成本/只省内存、微基准或无覆盖。失败与退化原样保留，不用第二优化救成绩。
