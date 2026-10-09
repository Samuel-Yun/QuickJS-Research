# 本周组会 Beamer｜数据截至2026-10-08

汇报者：马云霄。11页正文 + 4页问答附录，无动画；正文讲稿约13分30秒。
所有图表为可编辑TikZ/PGFPlots/LaTeX，不引用实验目录或截图，`main.tex` 单文件可作为编译输入。

## 上传和编译

1. 在Overleaf新建空项目，上传 `weekly_20261008_overleaf.zip`（或仅上传 `main.tex`）。
2. Menu / Settings：Compiler选择 **XeLaTeX**；Main document选择 **main.tex**。
3. 使用当前TeX Live版本。所需ctexbeamer、Fandol、TikZ/PGFPlots、booktabs、listings均为TeX发行版包；无需Windows字体、shell-escape、联网参考文献或外部数据。
4. 编译后应为15页：正文1–11，附录12–15。若遇到问题请导出log；本包没有伪造本地编译通过。

修改日期：编辑 `\newcommand{\ReportDate}{2026-10-08}`。日期表示数据截止，不是假定的组会日期。
汇报者编辑 `\ReportAuthor`；标题直接改各 `\begin{frame}` 的标题参数。单页数据源见 `source_map.md`。

2026-10-09 局部版式修订：仅微调第4、8、10、15页，减少段间距和冗长换行；第8页图高由4.1cm改为3.5cm，数值、Q1/Q3及坐标范围不变。其他页、讲稿和实验数据不变。重新上传本ZIP或替换main.tex后编译；本地编译/视觉检查仍未执行。

2026-10-09 第二轮修订：调整第3、6、7、12、13页。第3页加深并直接标注QJS=1虚线；第6页补Richards定义并拆行prototype标识；第7页重写来源，移除未转义下划线；第12页区分三引擎排列与code cache A/B各15轮；第13页缩短聚合规则并保留因果边界。其余页面及统计数值不变。

## 本地检查的真实状态

- 数据：只读重算已有raw；全量中位数、GM、最新180条六组Q1/Q3和顺序核对；结果在 `data_audit.json`。
- 源码静态检查：frame数量、环境/花括号、外部输入、fragile代码页、图中数值与重算数据、最小ZIP内容；结果在 `validation.json`。这不等于TeX编译。
- **XeLaTeX编译：NOT_RUN。** Windows PATH及常见MiKTeX/TeX Live位置未发现工具；已存在Ubuntu WSL里 `command -v xelatex/latexmk/pdftoppm` 无结果，kpsewhich不存在。未自动安装大型TeX发行版。
- **main.pdf：未生成。** 缺字/Overfull/undefined reference日志检查、15页渲染与逐页视觉审阅均NOT_RUN。源码已经按页面空间做紧凑分组，但没有声称PDF无溢出。
- 未运行任何性能实验、机制探针或引擎构建；未修改原benchmark/raw/summary，未提交/push。

## 文件用途

- `main.tex`：单文件幻灯片，包根目录。
- `speaker_notes.md`：逐页问题与自然口述；页7–9明确共享派生设计、额外own读取/赋值与归因限制。
- `source_map.md`：页码→实验→字段/计算；旧稿只参考版式。
- `data_audit.json`：源HEAD/status、关键文件SHA256、重算全精度、UNKNOWN及未执行项。
- `audit_data.py`：可选本地**离线**复核，不运行runtime。只写本报告目录。
- `validate_report.py` / `validation.json`：离线静态检查与最小包审计。
- `weekly_20261008_overleaf.zip`：只含main.tex和本README，不含raw/runtime、历史文档、脚本或ZIP自身。

本地离线复核（项目根目录，Python 3）：

```powershell
python -B reports/weekly_20261008/audit_data.py
python -B reports/weekly_20261008/validate_report.py
```

未来有XeLaTeX环境时可用：

```text
xelatex -interaction=nonstopmode -halt-on-error main.tex
xelatex -interaction=nonstopmode -halt-on-error main.tex
```

然后检查log中的Missing character、Overfull、undefined references，并把15页渲染后逐页查看。该命令是待执行说明，非已执行证据。
