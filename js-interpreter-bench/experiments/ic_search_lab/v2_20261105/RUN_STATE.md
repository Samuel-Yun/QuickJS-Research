# 已完成；下列为采集期检查点，不要再次启动

正式Octane2040/SunSpider2340以及独立关键集230均已完成并审计通过。最终状态看completion.json/audit.json/results.md。原会话52089及7124已正常退出；进度工具曾失败但未重启collector，见monitor_recovery.json。以下保留原检查点供追溯，不能当成仍有采集在运行。

截至开始正式确认：四设计的26+17初筛已完成；s001/s004各三轮26+17复筛共774条已完成；总计1341条计时记录经独立审计有效。仅s001满足冻结主指标门槛，decision.json固定为s001。安全与146条独立pilot均通过，candidate源码/制品/口径已冻结于manifest.json。

当前正式串行命令：先 `final_collect.py collect octane`（2040），成功后同一PowerShell顺序执行 `final_collect.py collect sunspider`（2340）。不可重复启动第二个collector；final_collector.lock保存当前PID/boot/命令。已有protocol不覆盖，只有同boot、同身份、无无效位置才能按已完成位置恢复，不能跨boot拼数据。

本会话工具session：正式采集52089；新idle helper session96149 / LinuxPID3989，marker=IC_SEARCH_V2_FINAL_IDLE，只休眠12小时；旧idle helper515让其自行结束。当前boot=3232ff5b-05a5-4446-ad1c-25dbd2e8e6e7。清理只许在核对PID命令、uid及boot后停止本轮自己的idle，不关闭WSL，不终止其它任务。

正式采集中不编译、不诊断、不跑另一个benchmark，也不编辑final_collect.py、被引用的run/measure/lab或冻结输入/制品。可以只读进度并完善说明。不要把此文件里的工具session号当成跨会话仍有效的系统事实。

完成后实际执行：final_analyze.py、独立audit（含每组30和顺序/哈希/正确性）、按预先independent_repeat_policy决定是否另做关键集10轮；更新results/candidates/README/completion与交付文件哈希。不要自动新增设计、提交或push。

若raw较大，在全部采集关闭后运行archive_raw.py，保留本地原runs.jsonl，以无损runs.jsonl.gz及双SHA公开；analysis/audit支持无原二进制、无解压直接重算。归档后不能继续往同一raw追加而冒充封存数据。

当前active源码是s001，但active/qjs已被安全构建替换为ASan/UBSan；**正式用的是artifacts/s001.matched.qjs，不使用active/qjs**。A/M冻结副本在父目录artifacts。不要因此重建/覆盖正在测的ELF。
