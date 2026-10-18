# Overleaf使用说明

本包是马云霄本周组会周报的LaTeX Beamer源码，数据截至2026-10-17。
参考本地myx分支提交5d349e82dadd72c876f576415893dd1d46d372be；不填写未知的组会日期。

## 上传与编译

1. 上传 weekly_20261017_overleaf.zip 创建项目，或仅上传 main.tex。
2. 主文件选择 main.tex，编译器选择 XeLaTeX。
3. 使用正常TeX Live环境；建议Overleaf当前可用的TeX Live版本，无需shell-escape。
4. 源码有6页正文和2页完整字节码附录，设计为8页，没有独立封面或目录。

main.tex是可独立输入的单文件，不读取仓库其他文件、图片、绝对路径或在线资源。
中文使用TeX发行版自带Fandol，等宽代码使用Latin Modern Mono；没有Windows/macOS专有字体依赖。
ZIP只放main.tex、notes.md、README_Overleaf.md三个文件；后两个文件是讲稿和说明，不参与编译。
代码用listings，所有代码frame为fragile，不使用minted、外部程序或整页截图。

## 本地验证状态

**未在本地编译。** Windows PATH/常见TeX位置以及现有Ubuntu WSL均未找到XeLaTeX、latexmk。
没有安装庞大TeX环境；因此未生成PDF，未声称通过缺字、Overfull/Underfull日志或逐页视觉检查。
目前完成的是离线数字重算、真实字节码逐行对应、6+2个frame结构/特殊字符/外部依赖与ZIP核查，结果保存为仓库中的validation.json。
正文和代码按可读字号排版，长指令允许折行，来源固定在页脚区域；实际投影和分页仍应以XeLaTeX生成的PDF为准。

未来有编译环境时，可在该目录运行两次：

    xelatex -interaction=nonstopmode -halt-on-error main.tex
    xelatex -interaction=nonstopmode -halt-on-error main.tex

请检查PDF是否8页、日志是否有缺字和Overfull，再逐页看页脚及代码末行。
如果Overleaf报错或溢出，请保留并提供编译log；不要开启shell-escape或替换为本机字体。

## 数据口径与核对

- 只读取已有实验，未运行VM/benchmark、修改VM、提交或推送。
- S1/S2为冻结WSL2 cohort中的正式内部单调计时：首次调用在内，无workload预跑；单位为每完整目标调用微秒，含4096轮及摊薄driver。
- 表内比值为V8 median / QuickJS median；大于1表示V8用时更长，仅是点估计。
- S3为独立插桩诊断，不是正式性能样本；1229是已映射查找区域样本分母，不是程序总耗时。
- 29%取自未四舍五入的2223.2343419999816 / 1718.2762540000003 - 1，不拿显示后整数相除。
- 完整路径和逐页证据在notes.md；历史JSC、code cache和方法外提A/B不作本周成果。

仓库中可选的离线核对脚本（不调用任何JS引擎）：

    python js-interpreter-bench/reports/weekly_20261017/validate_report.py

该命令只读取已有CSV/JSON/dump、核对源码并生成报告验证JSON及Overleaf ZIP，不重跑实验。
