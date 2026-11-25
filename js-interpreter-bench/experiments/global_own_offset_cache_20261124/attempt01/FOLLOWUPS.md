# 追加测试

2026-11-24 按用户要求，原 SPARSE 与 GLOBAL_OWN_OFFSET_CACHE 同批交错跑完整 Octane 17 项、SunSpider 26 项，各版各项一个新进程。

- [完整结果与逐项表](full_confirmation01/results.md)：Octane +1.40%，SunSpider +2.67%，正数为耗时增加。
- [原始时间](full_confirmation01/raw_timings.csv)、[逐项对比 CSV](full_confirmation01/comparison.csv)、[验证记录](full_confirmation01/validation.json)。
- 复现：`python3 js-interpreter-bench/experiments/global_own_offset_cache_20261124/attempt01/full_confirmation.py`。自动开新目录，不覆盖旧批次。

原 results.md、decision.json、audit.json 保留最初定向筛选记录；其中“未跑全集”描述的是追加测试之前的状态。本次只追加 Release 计时，没有追加全集诊断，不据此给出全集二级命中率。默认冻结源码不改，未 push。
