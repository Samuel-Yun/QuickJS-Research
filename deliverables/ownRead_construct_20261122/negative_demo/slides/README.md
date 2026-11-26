# 按用户修改底稿追加负缓存说明

交付：`ownRead与new_源码展开版_补充负缓存.pptx`，共 14 页。

使用的是用户放在仓库根目录、已删除页底出处小字的文件。按用户要求，原文件已经移到 `input/ownRead与new_源码展开版.pptx`，移动前后的 SHA256 一致，记录在 `input_manifest.json`。没有用此前生成的未删脚注版本替代用户底稿。

- 原 12 页及其备注逐字节保留，不恢复已删除的说明小字。
- 第 13 页：独立负缓存 JS、实际 Unsupported 字节码和构造位点的负目标状态。
- 第 14 页：完整 sparse_same、four_ctor_slow_eligible、sparse_remember，以及首次和后续同目标的流程。
- 新增页沿用黑字、白底、楷体中文、Times New Roman 英文及等宽代码。只保留与用户底稿一致的页码，没有新增页底出处说明。

原始运行与 JS 在上一层 `negative_demo/`。两版输出均为 `sum=700, negativeSum=400`，快照显示 Unsupported 位点正计划=False、负目标=True；没有把快照写成命中次数或性能统计。代码来自冻结 `modified/sparse_runtime.inc`，完整函数与 C token 均已核对。

`preview_13.png`、`preview_14.png` 为新增两页预览；`preview_negative.png` 为这两页的总览，`preview_all.png` 包含全部 14 页。预览从实际 PPTX 的文本、形状和坐标生成，本机字体使用相应替代字库，不是 PowerPoint 引擎截图。

`讲稿备注.md` 同时导出全部备注。新底稿的备注母版没有正文占位符，生成器只为新增页复用已有备注正文框，没有改动旧页或旧备注母版。

在仓库根目录重新生成：

```bash
python3 deliverables/ownRead_construct_20261122/negative_demo/slides/create_pptx.py
python3 deliverables/ownRead_construct_20261122/negative_demo/slides/preview_pptx.py
```

依赖与前版相同：python-pptx、lxml；预览另用 Pillow 和本机 Chrome。`content_check.json` 核对来源与保留情况，`layout_check.json` 核对逐页文字边界，`final_check.json` 保存最终交付核对。
