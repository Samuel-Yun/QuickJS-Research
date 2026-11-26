# ownRead 源码展开版

交付文件：`ownRead_源码展开版.pptx`，四页，可编辑，全部使用黑色字体。保留上一版文件，便于对比。

这次原样运行仓库 `on_demand_ctor_cache/tests/bytecode_demo.js`，没有使用之前两次 print 的最小脚本。两版输出均为 `sum=700`；本例 ownRead 读取的值是 3。construct 仅作为示例的背景，本版尚未分析它的执行过程。

1. 完整 bytecode_demo.js，加 ownRead 的两版实际字节码。
2. A 的 get_arg0/get_field 入口，以及完整 GET_FIELD_INLINE，左右两列连续阅读。
3. 冻结 SPARSE 的入口和完整 V6_PREPARED_BORROW，所有守卫、命中体及回退均保留。
4. 首次正常查找、普通自有字段的缓存填充路径、完整 rdi_update、完整 return handler。

第 2、3 页没有删除宏内任何语句、分支或注释；只移除宏行尾续行符、空行并重新排版。第 4 页 GET_READ_IC 是明确标注的自有字段路径节选，原型及特殊对象的其他分支未放入幻灯片；完整原文件内容在 `SPARSE_GET_READ_IC.c.txt`。所有 C 展示均做了源码 token 对照，不以伪代码代替源码。

字体：中文 KaiTi、英文正文 Times New Roman、代码 DejaVu Sans Mono。预览由实际 PPTX 的原生文字及形状生成，本机中文使用 AR PL UKai CN、英文使用 Liberation Serif 作为替代；不是 PowerPoint 引擎截图。逐页预览为 `preview_1.png` 至 `preview_4.png`，总览为 `preview_all.png`。讲稿已写入每页备注，也单独保存为 `讲稿备注.md`。

复现字节码，在 `js-interpreter-bench/on_demand_ctor_cache` 中运行，输出目录须尚不存在：

```bash
python3 tools/bytecode.py tests/bytecode_demo.js --engine both --function ownRead --output /tmp/ownread-demo-bytecode
```

在仓库根目录重新生成 PPTX 和预览：

```bash
python3 deliverables/ownRead_A_vs_SPARSE_20261122_v2/create_pptx.py
python3 deliverables/ownRead_A_vs_SPARSE_20261122_v2/preview_pptx.py
```

生成依赖 python-pptx、lxml；预览另需 Pillow 和本机 Chrome。脚本会核对冻结原始/修改源码哈希、原例子的字节一致性、字节码及源码，结果在 `content_check.json`。`layout_check.json` 保存逐页文字边界检查，`final_check.json` 保存最终交付核对。
