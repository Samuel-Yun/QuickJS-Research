# 负缓存补充例子

在原 bytecode_demo.js 后加入 Unsupported 与独立的 constructUnsupported new 位点，保留 Pair 的正缓存例子；末尾统一输出两个校验和。

实际运行：A 与冻结 SPARSE 均输出 `sum=700, negativeSum=400`。

- construct：正计划=True，负目标=False。
- constructUnsupported：正计划=False，负目标=True。
- Unsupported 的函数体仍有 push_1、add、put_field；负缓存不跳过这些操作。

PPT 适合在正计划讲完之后追加一页：上半放 Unsupported 与调用循环；下半放两种 record 状态，以及“首次判型并记住 / 后续跳过判型但仍普通构造”两条流程。

在 on_demand_ctor_cache 目录复现（新输出目录须不存在）：

```bash
python3 tools/bytecode.py ../../deliverables/ownRead_construct_20261122/negative_demo/bytecode_demo_with_negative.js --engine both --function construct --function constructUnsupported --function Unsupported --output /tmp/negative-demo-bytecode
```

快照证明目标已被记住；本次没有测逐次命中数或性能时间。
