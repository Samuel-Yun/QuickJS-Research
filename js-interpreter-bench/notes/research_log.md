# 研究日志

本日志按时间顺序记录研究过程。无法验证的信息写为 `UNKNOWN`，不得猜测。每一步至少包含：日期、做了什么、命令、结果、问题、下一步。

## 日志模板

### YYYY-MM-DD — 标题

**做了什么**

说明本步目的和实际操作。

**命令**

```text
记录可复现的完整命令；未执行命令时写“无”。
```

**结果**

记录输出、退出状态、生成文件和证据位置。

**问题**

记录失败、风险、待验证事项；未知项明确标记为 `UNKNOWN`。

**下一步**

只记录建议动作，不把尚未执行的工作描述为已完成。

---

## 2026-09-20 — 初始化研究项目

**做了什么**

创建项目目录骨架、研究目标说明、实验协议和研究日志。未下载或编译任何引擎，未运行正式 benchmark，未修改任何引擎源码。

**命令**

```powershell
New-Item -ItemType Directory -Force -Path `
  'js-interpreter-bench', `
  'js-interpreter-bench\engines', `
  'js-interpreter-bench\benchmarks', `
  'js-interpreter-bench\scripts', `
  'js-interpreter-bench\results', `
  'js-interpreter-bench\results\raw', `
  'js-interpreter-bench\results\processed', `
  'js-interpreter-bench\notes', `
  'js-interpreter-bench\patches'
```

文档内容通过补丁方式写入 `README.md`、`notes/experiment_protocol.md` 和 `notes/research_log.md`。

**结果**

项目骨架和三份初始文档已创建。正式 benchmark 准入状态：`BLOCKED`。

**问题**

- 四个引擎的 version / commit：`UNKNOWN`。
- 各引擎解释器模式及其验证证据：`UNKNOWN`。
- CPU、OS、architecture、compiler/version：尚未采集。
- build flags、runtime flags：`UNKNOWN`。
- SunSpider 的精确来源和版本：`UNKNOWN`。

**下一步**

在下一阶段只做版本来源调查与解释器模式验证方案设计；经确认后再分别固定 engine commit、工具链和 SunSpider 版本。解释器模式完成验证前不运行正式 benchmark。
