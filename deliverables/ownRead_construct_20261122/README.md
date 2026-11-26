# ownRead 与 new：源码展开版

交付文件为 `ownRead与new_源码展开版.pptx`，共 12 页，黑色文字、白底，可编辑，含逐页讲稿备注。

前 4 页直接保留已认可的 `ownRead_源码展开版.pptx`，幻灯片与备注 XML 均逐字节核对。新增第 5～12 页，继续同一份仓库 `tests/bytecode_demo.js` 的 new/construct 部分。

| 页码 | 内容 |
|---|---|
| 1～4 | 原 ownRead 部分，未改 |
| 5 | construct 两版实际字节码、Pair 相同的 17 字节、调用前的栈 |
| 6 | A 的完整 call_constructor handler 与 js_create_from_ctor |
| 7 | A 的完整 JS_CallConstructorInternal，创建 this 后执行 Pair |
| 8 | 冻结 SPARSE 的完整 four_ctor handler：尝试、普通回退、学习、异常、清理 |
| 9 | 完整 plan_recipe 与实际记录结构，说明字段到参数的映射 |
| 10 | 完整 plan_slow_eligible 和 plan_learn，包含 initial 前置条件、按需分配及引用释放 |
| 11 | 完整 plan_base、plan_proto、plan_chain，说明命中仍需执行的检查 |
| 12 | 完整 plan_try：从 final shape 创建新对象、复制实参到属性槽 |

所有新增代码均取自 `js-interpreter-bench/on_demand_ctor_cache/original/` 和 `modified/`，未使用后续实验版。展示的函数及 handler 完整保留；仅去掉空行、拆开同一行的多个语句和调整长行排版。生成脚本按 C token（包含字符串和多字符运算符）核对，未改任何语句或分支。相应原始 C 源码另存为 `*.c.txt`，来源文件、行号和哈希在 `source_evidence.json`。

## 实际字节码

在 `js-interpreter-bench/on_demand_ctor_cache` 中执行，输出目录需要尚不存在：

```bash
python3 tools/bytecode.py tests/bytecode_demo.js --engine both \
  --function ownRead --function construct --function Pair \
  --output /tmp/ownread-construct-bytecode
```

本次原始输出在 `bytecode/`。两版输出 `sum=700`。construct 均为 10 字节，在偏移 6 分别是 `call_constructor 2` 和 `four_ctor record[0] argc=2`；Pair 的 17 字节完全相同。快照显示该位点已学到正计划；没有以快照推算命中次数，也没有加入性能成绩。

## 生成与预览

在仓库根目录执行：

```bash
python3 deliverables/ownRead_construct_20261122/create_pptx.py
python3 deliverables/ownRead_construct_20261122/preview_pptx.py
```

生成脚本读取上一版 PPTX 作为前 4 页的底稿；需保留相邻的 `ownRead_A_vs_SPARSE_20261122_v2/`。依赖 python-pptx、lxml；预览另外需要 Pillow 与本机 Google Chrome。当前环境使用已有的 `/tmp/quickjs-whitebox-slide-deps`。

预览从实际 PPTX XML 的文本、形状和坐标生成，不是 PowerPoint 引擎截图。PPTX 指定中文 KaiTi、英文 Times New Roman、代码 DejaVu Sans Mono；本机预览用 AR PL UKai CN 与 Liberation Serif 替代前两者。

- `preview_1.png`～`preview_12.png`：逐页预览。
- `preview_all.png`：全部 12 页总览。
- `preview_new.png`：仅新增 8 页的总览。
- `讲稿备注.md`：与 PPTX 备注一致的讲稿。
- `content_check.json`：冻结源码、完整函数和实际字节码核对。
- `layout_check.json`：12 页文字边界检查。
- `final_check.json`：最终交付、黑字、可编辑性、前四页保留及备注核对。
