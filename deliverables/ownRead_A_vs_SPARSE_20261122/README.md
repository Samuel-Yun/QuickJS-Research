# ownRead：A 与冻结 SPARSE 的执行过程

交付文件为 `ownRead_A与SPARSE_执行过程.pptx`，16:9，共四页。代码、文字和流程图均为 PowerPoint 原生可编辑对象，每页有 2～4 句讲稿备注。

1. 同一个 JS 的实际字节码，分别解释 IC 编号、delta 和属性槽号。
2. A 的原始 C 节选及 `空栈 → [obj] → [7] → 返回 7`。
3. 冻结版的融合入口：借用参数、定位记录、检查对象布局。
4. 命中读槽、`pc += 5`、首次回退与后续命中的区别。

第 3 页代码拆到第 4 页，保持字号。源码直接来自 `js-interpreter-bench/on_demand_ctor_cache/{original,modified}/quickjs.c`。没有使用后续实验版；没有加入构造缓存或性能测试内容。

## 实际字节码

在 `js-interpreter-bench/on_demand_ctor_cache` 执行：

```bash
python3 tools/bytecode.py ../../deliverables/ownRead_A_vs_SPARSE_20261122/own_read.js \
  --engine both --function ownRead --output /tmp/ownread-bytecode-new
```

输出目录需要尚不存在。本次输出在 `bytecode/`：两版都打印两行 7，`A.txt` 和 `method.txt` 仅显示 ownRead。幻灯片的字节码直接取自这些实际输出，仅收紧列间空白，未更改任何 opcode 或操作数。

## 源码与核对

`*.c.txt` 保存未经节选的相关原始行，`source_evidence.json` 记录文件、行号及 SHA256。幻灯片中的 C 代码仅做排版换行、移除宏行尾续行符，并以 `/* ... */` 标出省略处；没有把伪代码称为原始源码。

`create_pptx.py` 核对冻结包全部源码哈希、两版输出、三条指令的偏移及长度，并检查展示的 C token 与原始源码一致或为其有序节选。`content_check.json` 保存结果。

## 重新生成和预览

```bash
python3 deliverables/ownRead_A_vs_SPARSE_20261122/create_pptx.py
python3 deliverables/ownRead_A_vs_SPARSE_20261122/preview_pptx.py
```

生成脚本使用 `python-pptx` 和 `lxml`；预览另外使用 Pillow 与本机 Google Chrome。当前环境从已有 `/tmp/quickjs-whitebox-slide-deps` 加载依赖。

`preview_1.png` 至 `preview_4.png` 为逐页预览，`preview_all.png` 为四页总览。预览从实际保存的 PPTX XML 读取文本、形状和位置，再由本机浏览器排版；不是 PowerPoint 引擎截图。`layout_check.json` 检查每行文字的宽度、高度及页面边界，随后逐页人工查看。

PPTX 字体指定为：中文 KaiTi（楷体）、英文正文 Times New Roman、代码 DejaVu Sans Mono。本机预览分别使用可用的 AR PL UKai CN 和 Liberation Serif 替代前两者。备注另导出在 `讲稿备注.md`，也可直接在 PowerPoint 的备注区编辑。
