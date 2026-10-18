# 周报的 PPT Master 版本

- 组会播放/编辑：`weekly_20261017_pptmaster.pptx`。
- 固定显示备份：`preview/weekly_20261017_pptmaster.pdf`。
- 页面预览：`preview/slide_01.png`至`slide_08.png`，来自本机PowerPoint真实导出。
- 推荐及对比依据：`comparison.md`。
- 证据复核：`delivery_validation.json`；`python verify_delivery.py`只读既有研究资料，不运行VM/benchmark。
- 可复用SVG、设计决定、逐页讲稿、导出日志：`weekly_quickjs_20261017/`。

正文6页，另有2页完整指令附录；资料截至2026-10-17，作者马云霄。没有擅自将截止日作为未知的组会日期。原Beamer的`../main.tex`和Overleaf ZIP保持不变。

## 工具来源

使用[hugohe3/ppt-master](https://github.com/hugohe3/ppt-master/blob/main/README_CN.md)官方发布包v6.7.1，release/tag revision `aabf2a0541d9d3b0bdb9e8564a0217f0eaff7815`。

下载URL：`https://github.com/hugohe3/ppt-master/releases/download/v6.7.1/ppt-master-skill-v6.7.1.zip`。

下载包22561995字节，SHA256 `64992f79dff176755032579c6e5437cec3a2296e1cb92a0c8ce031cc7ce3d811`；先运行包内attribution_guard.py，退出码0。下载的工具包在被git忽略的`toolchain/`，未改包内代码。

实际路由为Generate PPTX / Default，用户将最终选择交由执行者；自由设计，单色代码讲解，不启动确认UI、不伪造用户receipt。没有图片生成、外部模型服务、JSC/cache/A-B新实验、提交或推送。

## 导出复现

使用同版本包内 `skills/ppt-master` 的绝对路径作为 `SKILL_DIR`，项目路径为本目录下`weekly_quickjs_20261017`。依次运行：

```powershell
# 每次命令用实际绝对路径替换 SKILL_DIR/PROJECT，不切换工作目录。
python "SKILL_DIR/scripts/svg_quality_checker.py" "PROJECT" --canonical-authoring --stage final --json
python "SKILL_DIR/scripts/total_md_split.py" "PROJECT"
python "SKILL_DIR/scripts/finalize_svg.py" "PROJECT"
python "SKILL_DIR/scripts/svg_to_pptx.py" "PROJECT" --native-charts-and-tables --no-animations
```

导出必须串行，前一条成功才执行后一条。已交付PPTX无需重新导出即可使用。`render_powerpoint.py <pptx> <output>`只读打开指定的新PPT，导出PDF/PNG，不修改原文件；只关闭自己打开的presentation，存在用户PowerPoint时不退出其应用。

实时SVG预览启动曾报`ImportError: cannot import name url_quote from werkzeug.urls`，未改全局依赖，未声称实时服务可用。实际最终验版用PowerPoint16.0完成；Beamer仍未在本地编译，不把PPTX生成的PDF冒充Beamer PDF。
