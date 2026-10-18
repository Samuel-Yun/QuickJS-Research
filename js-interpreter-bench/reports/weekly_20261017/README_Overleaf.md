# Overleaf使用说明

本包是马云霄本周组会周报的LaTeX Beamer源码，数据截至2026-10-17。
证据参考myx提交5d349e82；修订核对当前myx提交5db371f7（2026-10-18）。不填写未知的组会日期，不增加数据截止日之后的实验结果。

## 上传与编译

1. 上传 weekly_20261017_fixed_overleaf.zip 创建项目，或仅上传 main_fixed.tex。
2. 主文件选择 main_fixed.tex，编译器选择 XeLaTeX。
3. 使用正常TeX Live环境；建议Overleaf当前可用的TeX Live版本，无需shell-escape。
4. 源码有6页正文和2页完整字节码附录，设计为8页，没有独立封面或目录。

main_fixed.tex是可独立编译的单文件，不读取仓库其他文件、图片、绝对路径或在线资源。
中文使用TeX发行版自带Fandol，等宽代码使用Latin Modern Mono；没有Windows/macOS专有字体依赖。
新ZIP只放main_fixed.tex、notes.md、README_Overleaf.md三个文件；后两个文件是讲稿和说明，不参与编译。
旧main.tex、weekly_20261017_overleaf.zip保持不变，原讲稿另存notes_original.md。已有PPT Master PDF不是本次TeX编译结果，不能用它替代修订版PDF。
代码用listings，所有代码frame为fragile，不使用minted、外部程序或整页截图。

## 本地验证状态

**修订版未在本地编译。** 2026-10-18复核Windows PATH、常见TeX目录及现有Ubuntu WSL，未找到XeLaTeX、latexmk、tectonic或kpsewhich。
没有安装庞大TeX环境；因此没有main_fixed.pdf，缺字、实际8页输出、代码折行和Overfull hbox/vbox日志均为未验证，不宣称编译或视觉检查通过。
离线核查范围：花括号/环境/表格列数与行末、正文和listing转义、真实指令逐行匹配、8行C源码token匹配、既有数字与原始证据hash、6+2帧及fragile、无外部资源，结果保存于validation_fixed.json。
第1页重新分配源码/指令列宽，第4页补齐短路操作所需指令，第5页用真实C代码替换重复说明。底部页脚仍全部取消；首页正文单独补一行实际平台、QuickJS/V8版本与V8 Ignition参数，QuickJS栏改为“更新sum，弹出栈顶”。其余环境、来源和口径记录在notes.md；离线检查不能证明最终页面没有溢出。

未来有编译环境时，可在该目录运行两次：

    xelatex -interaction=nonstopmode -halt-on-error main_fixed.tex
    xelatex -interaction=nonstopmode -halt-on-error main_fixed.tex

请检查PDF是否8页、日志是否有缺字和Overfull，再逐页看代码末行与正文边界；底部应无页脚文字。
如果Overleaf报错或溢出，请保留并提供编译log；不要开启shell-escape或替换为本机字体。

## 数据口径与核对

- 只读取已有实验，未运行VM/benchmark、修改VM、提交或推送。
- S1/S2为冻结WSL2 cohort中的正式内部单调计时：首次调用在内，无workload预跑；单位为每完整目标调用微秒，含4096轮及摊薄driver。
- 表内比值为V8 median / QuickJS median；大于1表示V8用时更长，仅是点估计。
- S3为独立插桩诊断，不是正式性能样本；1229是已映射查找区域样本分母，不是程序总耗时。
- 29%取自未四舍五入的2223.2343419999816 / 1718.2762540000003 - 1，不拿显示后整数相除。
- 完整路径和逐页证据在notes.md；历史JSC、code cache和方法外提A/B不作本周成果。

仓库中可选的离线核对脚本（不调用任何JS引擎）：

    python js-interpreter-bench/reports/weekly_20261017/validate_fixed_report.py

该命令只读取已有CSV/JSON/dump及QuickJS源码，生成validation_fixed.json和新的Overleaf ZIP，不运行VM或重跑实验。
旧validate_report.py仍针对原main.tex，原validation.json与旧ZIP不覆盖。
