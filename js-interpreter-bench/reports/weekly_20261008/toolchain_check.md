# 本地工具发现记录

本次查找不安装软件、不运行runtime，只检查用于报告编译的工具。

Windows PowerShell：

```powershell
Get-Command python,xelatex,latexmk,pdftoppm,mutool -ErrorAction SilentlyContinue
```

仅发现 `D:\python3\python.exe`，版本Python3.11.4；未发现TeX/PDF工具。
常见候选目录：`C:\Program Files\MiKTeX`、`C:\Program Files\TeX Live`、`C:\texlive`、`D:\texlive`、`AppData\Local\Programs\MiKTeX`、`AppData\Local\MiKTeX`未发现工具。Local\Programs当前目录列表无TeX安装。

已存在Ubuntu WSL（提升权限仅为读取现有工具）：

```text
wsl.exe -d Ubuntu -- sh -c 'command -v xelatex; command -v latexmk; command -v pdftoppm; command -v fc-list; kpsewhich FandolHei-Regular.otf'
```

stdout只有 `/usr/bin/fc-list`；stderr `kpsewhich: not found`。未发现xelatex/latexmk/pdftoppm。
因此不生成PDF，不宣称缺字/Overfull检查或渲染视觉检查通过。日期可能跨到2026-10-09，本报告**数据截止宏仍为2026-10-08**。
