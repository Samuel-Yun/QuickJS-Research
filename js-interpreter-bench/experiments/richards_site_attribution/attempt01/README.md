# 原始 Richards 属性位置归因（2026-10-17）

已完成，入口：[results.md](results.md)、[site_notes.md](site_notes.md)、[walkthrough.md](walkthrough.md)。
本轮只有机制/正确性/扰动诊断，**0 个新增正式性能样本**；不重跑之前的 240 个样本。

## 固定对象

- WSL2 Ubuntu 24.04.2 x86_64，cohort `wsl2-ubuntu2404-x64-20261004`；不是原生 Linux。
- upstream QuickJS 2026-06-04，commit `04be246001599f5995fa2f2d8c91a0f198d3f34c`，冻结 `qjs` SHA256 `140d5233b0337d91cb0f994ae4a051e49aa04da8802acfaedf0a01b81a620b79`。
- V8 15.6.21 / d8，SHA256 `83b744a5953d2662ea723564d4035a333782a0cc85232d1025929a925150b133`，保留 snapshot/ICU，`--max-opt=0 --no-lazy`；精确源码制品映射 UNKNOWN。
- Octane `570ad1ccfe86e3eecba0636c8f932ac08edec517` 的 base.js/richards.js 原字节，沿用上轮无方法替换的 standalone driver。输入及完整身份在 manifest.json。
- 新诊断 qjs 位于 `/home/mzyx/richards_site_attribution_attempt01_diag/qjs`，SHA256 `913d996ef452ae9006c97824dddf4c4a2d9ed18cc3e1cc9ed77fb07670fb0ce6`。只用于诊断，未替换正式 runtime。

## 复现命令

从 Windows PowerShell 进入同一 WSL（不是重新安装环境）：

```powershell
wsl.exe -d Ubuntu -- bash
```

WSL 中：

```sh
cd /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/richards_site_attribution/attempt01
python3 run.py build
python3 run.py gates
python3 run.py sample
python3 analyze.py all
python3 diagnose.py
python3 selected_site.py
python3 audit.py
python3 check_outputs.py
```

当前目录记录只写一次；复现以上命令会读取已完成的记录，不自动重新采样或覆盖。需要独立复验时复制入口/探针到新 attempt，修改 HERE/BUILD 为新路径，冻结 manifest 对象保持不变，不能覆盖旧输出。
`run.py` 的 command() 给出实际引擎、原配置和适配器；每条 raw JSON 保存最终命令、stdout/stderr、退出码、boot ID、外部时长。`.settings.json` 另存诊断开关和实际 binary/script hash。

## 材料位置

- `scripts/original.N*.js`：原 workload 字节 + 原统一 driver；静态前端在计时外，首次 Run 在内，无 workload 预跑。诊断时长只检查扰动。
- `probes/quickjs_diagnostic.patch`、两个头：独立 native 诊断，不改编译规则。补丁应用及构建失败/恢复在 raw/recovery.md；成功构建日志 raw/build.attempt02.json。
- `raw/counts_N{1,2}.*`：Run 内聚合计数，采样关闭。`origins.csv` 包括无 site 的 helper 查找。
- `raw/sample_ctx{0,1}_rep{1,2,3}.*`：N4096 的三个独立进程/开关，详细计数关闭；原 PC、时间、数字上下文和各自 maps 均保存。20ms 变体单列。
- `mapping/`：每进程 addr2line 内联栈、PC/site 关联、函数身份和所有原生调用来源；不借用旧诊断 binary 地址。
- `bytecode/quickjs/`、`bytecode/v8/`：原函数完整最终字节码和 offset 解码。`original.{frozen,diagnostic}.c` 序列化表示逐字相等。
- `raw/v8_selected_site_full.log` + `bytecode/v8_selected_site_full.same_process.txt`：同一 d8 进程的 IC 转换与字节码地址。
- `summary/`：分次和聚合统计；按函数/属性/op 聚合仍只是相应查找区域的采样，不是函数总 self-time。

不合并旧 Windows/WSL 时间，不新增 VM 优化、不恢复方法外提、不据采样百分比分解跨引擎总时间。
