# Overleaf使用说明

本包是马云霄本周组会周报的LaTeX Beamer源码，数据截至2026-10-17。
证据参考myx提交5d349e82；本轮在myx提交5662e612854d6198c2da1525a234d682547ba6b0基础上于2026-10-19只读核对已有dump。只新增字节码展示，不增加实验或性能数据，不填写未知的组会日期。

## 上传与编译

1. 上传 weekly_20261017_call_bytecode_overleaf.zip 创建项目，或仅上传 main_fixed.tex。
2. 主文件选择 main_fixed.tex，编译器选择 XeLaTeX。
3. 使用正常TeX Live环境；建议Overleaf当前可用的TeX Live版本，无需shell-escape。
4. 源码现在有7页正文和2页完整字节码附录，设计为9页，没有独立封面或目录。

main_fixed.tex是可独立编译的单文件，不读取仓库其他文件、图片、绝对路径或在线资源。
中文使用TeX发行版自带Fandol，等宽代码使用Latin Modern Mono；没有Windows/macOS专有字体依赖。
main_fixed.tex已直接内嵌新增第3页，不需要input其他文件；不要再次input call_bytecode_frame.tex造成重复。
新ZIP包含主稿、全稿notes.md、README、本页独立frame、call_bytecode_notes.md及可选单页示例call_bytecode_minimal.tex。
后者只用于单页预览：主文件改选call_bytecode_minimal.tex时，需要同时上传call_bytecode_frame.tex；整份汇报仍选择main_fixed.tex。
旧main.tex、两个旧Overleaf ZIP、notes_original.md及旧validation结果均保留。修改前main_fixed.tex可从本轮起点提交5662e612还原。已有PPT Master PDF不是本次TeX编译结果。
代码用listings，所有代码frame为fragile，不使用minted、外部程序或整页截图。

## 本地验证状态

**本轮未在本地编译。** 2026-10-19检查Windows PATH及现有Ubuntu WSL，未找到XeLaTeX、latexmk、tectonic或kpsewhich；没有安装TeX环境。
因此没有本轮PDF，实际9页输出、缺字、代码折行和Overfull hbox/vbox日志均未验证，不宣称视觉检查通过。
离线检查由validate_call_bytecode.py执行，结果保存于validation_call_bytecode.json：9个frame、7+2顺序、新增第3页、原有8个frame逐字未改（忽略平台换行）、八份连续片段与真实txt/decoded.json匹配、完整caller/callee讲稿匹配、QJS旧路径计数、TeX结构及源hash。
新增页代码使用局部9.2pt等宽字体、11.2pt行距；缩短表头、增加列间留白及行间隔，分隔线改细，不改变其他页面全局样式。列宽估计不是实际字体或Overfull检查。此前validation_fixed.json只代表旧8帧版本，不作为本轮验证。

未来有编译环境时，可在该目录运行两次：

    xelatex -interaction=nonstopmode -halt-on-error main_fixed.tex
    xelatex -interaction=nonstopmode -halt-on-error main_fixed.tex

请检查PDF是否9页、日志是否有缺字和Overfull，再检查新增第3页四行八个代码框及两句边界说明；其他页面应与原稿一致，底部不恢复旧来源/环境页脚。
如果Overleaf报错或溢出，请保留并提供编译log；不要开启shell-escape或替换为本机字体。

## 数据口径与核对

- 只读取已有实验，未运行VM/benchmark、修改VM、提交或推送。
- S1/S2为冻结WSL2 cohort中的正式内部单调计时：首次调用在内，无workload预跑；单位为每完整目标调用微秒，含4096轮及摊薄driver。
- 表内比值为V8 median / QuickJS median；大于1表示V8用时更长，仅是点估计。
- S3为独立插桩诊断，不是正式性能样本；1229是已映射查找区域样本分母，不是程序总耗时。
- 29%取自未四舍五入的2223.2343419999816 / 1718.2762540000003 - 1，不拿显示后整数相除。
- 完整路径和逐页证据在notes.md；历史JSC、code cache和方法外提A/B不作本周成果。

仓库中可选的离线核对脚本（不调用任何JS引擎）：

    python js-interpreter-bench/reports/weekly_20261017/validate_call_bytecode.py

该命令只读取现有TeX、Git中的修改前主稿、txt/decoded.json及既有路径诊断，生成validation_call_bytecode.json和新的Overleaf ZIP，不运行VM或重跑实验。
旧validate_fixed_report.py假定8个frame，不能用于本轮9帧版本；旧validate_report.py针对原main.tex。旧validation与两个旧ZIP均不覆盖。
