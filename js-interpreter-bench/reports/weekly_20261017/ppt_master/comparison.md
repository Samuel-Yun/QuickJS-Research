# 本次组会推荐：PPT Master 版

推荐使用 `weekly_20261017_pptmaster.pptx`，另备 `preview/weekly_20261017_pptmaster.pdf` 防止换机器时字体替换。

| 比较项 | 本次 PPT Master 版 | 已有 Beamer 版 |
| --- | --- | --- |
| 投影检查 | 已用本机 PowerPoint 16.0 渲染8页，逐页看过；未见截断、乱码或来源/页脚重叠 | 未在本地编译，没有最终PDF的视觉证据；不能断言效果较差 |
| 代码阅读 | 等宽代码，V8长指令使用宽列；源码/指令、原程序/计数分组清楚 | 源码层面也有并排代码和完整附录，但实际换行须在Overleaf检查 |
| 临场修改 | 文字、代码均可编辑；两张表为原生PowerPoint表格，适合老师讨论时改字/加批注 | 修改TeX后重新编译；适合代码版本控制与统一排版 |
| 可携带性 | 本版用Arial/微软雅黑/Consolas；换到缺字体的机器可能替换，建议同时带PDF | 使用TeX自带Fandol字体，Overleaf XeLaTeX环境更独立 |
| 内容与结论 | 同一冻结资料，6页正文+2页完整指令附录；不增加实验、总体排名或因果结论 | 保留原文件及Overleaf ZIP，不覆盖 |

因此本次优先选PPTX的依据是：已经检查实际播放版、原始指令可读、改动方便，不是“PPT Master天然比Beamer好看”。没有两个都编译完成的成品，不能声称做过严格的视觉A/B；Beamer仍是可用的Overleaf备选。

## 实际检查

PPT Master SVG检查8/8通过、0错误/0警告；原生导出postflight通过。PowerPoint实际打开、导出PDF和8张1600×900 PNG；文本范围检查未见越出幻灯片，两个原生表格也逐页目视检查过。没有把页面作为图片贴入PPTX。

数字、完整附录指令与既有CSV/decoded.json复核见 `delivery_validation.json`。统计仍为完整目标调用的中位时间点估计；诊断采样与插桩时长未混入正式性能表。

## 对工具的使用感受

本版实际使用PPT Master的规划/字号与页面检查、SVG→原生DrawingML导出、原生表格和讲稿流程，不是用截图替代PPT。它便于生成可直接编辑和检查的PowerPoint文件；本机实时预览因Flask/Werkzeug不兼容未能启动，改用最终PowerPoint渲染检查，没有为此修改全局Python环境。此处只对本次交付判断，不把一次运行概括为对该项目所有能力的评测。
