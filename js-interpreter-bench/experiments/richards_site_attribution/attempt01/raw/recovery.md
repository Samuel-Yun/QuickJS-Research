# 开发/失败保留

- 首次 `run.py build` 在生成补丁的唯一性检查停止：`add_gc_object(...FUNCTION_BYTECODE)` 有两处（源码编译和读序列化表示），没有改写任何构建源码或产生诊断样本。将匹配约束为源码编译末尾 `b->realm = JS_DupContext(ctx)`，只注册最终源码编译结果；本轮不使用序列化加载路径。
- Windows 端 `Get-Content` 默认编码曾把中文显示成乱码；随后按 UTF-8 重读，原文件没有改写。
- 首次 GNU patch 因 Windows checkout CRLF 而全体 hunk 拒绝，日志 `build_patch.json` 和独立构建目录 `.rej` 保留。只对新诊断副本机械归一化 LF，再应用同一补丁，记录为 `build_patch_lf.json`；未改变 upstream 文件。
- 首次 make 在链接时失败：QuickJS 禁止源码直接使用 malloc 的宏展开到 `malloc_is_forbidden`。新元数据头改为诊断专用 calloc，原失败 `build.json` 保留，新构建单独日志。没有运行失败构建或产生研究数据。
- 首次离线分析误把全数字的 bytecode hex 列转成整数，fromhex 类型检查即停止；将文本字段显式排除在整数转换之外。原始 CSV 未变，没有因此重跑诊断。
- V8 `%DebugPrint` 在此发布制品只打印短对象身份，没有反馈向量；不据此推导 IC。精确名字 filter 对这个匿名函数的 inferred 显示名没有输出字节码，保留 `v8_selected_site.json`，新增 `v8_selected_site_full.json` 用 `*` 在同进程取得完整 dump 和 IC 日志后离线提取。
- 进度消息曾把活跃 site 数误写成 170；实际离线审计为 **189**，以 count_audit/offset_audit 为准，原始计数没有修改。
