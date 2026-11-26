# 读 IC 完整代码修订

交付文件：`ownRead与new_源码展开版_读IC完整.pptx`，共 16 页。

以已经基于用户删脚注底稿制作的 14 页版本为起点，将原来只有片段的第 4 页替换为三页：

- 第 4 页：完整 GET_READ_IC 前半，定位记录、探测缓存、命中取槽。
- 第 5 页：完整后半，常规查找、原型及特殊对象处理、缓存更新、共同收尾、两个 opcode 入口与 undef。
- 第 6 页：当前配置和完整单槽记录结构，以及完整 rdi_probe、rdi_update、v6_proto_update、return handler。

第 4、5 页连接后的 C token 与冻结 `modified/read_ic_opcodes.inc` 全文件一致，所有语句、分支、标签、注释和诊断宏均保留。仅移除宏行尾续行符、空行，并重新缩进、换行及分栏。完整原始代码同时保存为 `*.c.txt`。

原第 1～3 页保持原样，原第 5～14 页顺延为第 7～16 页。除页码外，这些页面的全部内容及备注均未改动，构造和负缓存部分保留。继续使用黑色文字，不加页底出处小字；仅保留原有风格的页码。

中文 KaiTi，英文正文 Times New Roman，代码 DejaVu Sans Mono。内容均为原生可编辑文字和形状。逐页预览从实际 PPTX XML 生成，本机字体使用相应替代字库，不是 PowerPoint 引擎截图。

- `preview_4.png`～`preview_6.png`：本次修订的三页。
- `preview_read_ic.png`：三页总览。
- `preview_all.png`：全部 16 页总览。
- `讲稿备注.md`：每页讲稿，亦写在 PPTX 备注中。
- `content_check.json`：完整源码及保留页面核对。
- `layout_check.json`：16 页文字边界检查。
- `final_check.json`：从实际 PPTX 再提取 C token，对照完整宏，并核对未改页面和全部备注。

在仓库根目录重新生成：

```bash
python3 deliverables/ownRead_construct_20261122/negative_demo/slides/read_ic_complete_20261123/create_pptx.py
python3 deliverables/ownRead_construct_20261122/negative_demo/slides/read_ic_complete_20261123/preview_pptx.py
```

生成依赖 python-pptx、lxml，预览另需 Pillow 与本机 Chrome；当前环境沿用 `/tmp/quickjs-whitebox-slide-deps`。生成器需要保留上一级的 14 页底稿。
