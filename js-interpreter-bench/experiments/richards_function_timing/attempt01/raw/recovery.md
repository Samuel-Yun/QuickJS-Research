# 本轮入口与解析恢复记录

1. prepare首次启动前，新run.py一处多余右括号造成Python SyntaxError，未启动任何引擎；修正后prepare成功。runtime与输入身份未改变。
2. correctness的24条独立执行全部PASS。V8精确`--print-bytecode-filter=TaskControlBlock.isHeldOrSuspended`只输出结果、没有dump；该原始输出保留于`v8_dump.json`与`diagnostics/v8_target_bytecode.txt`。
3. 独立重试使用`--print-bytecode-filter=*isHeldOrSuspended*`，本制品输出了多个函数。初版解码器将所有函数合在一起，比较失败；不是已经观测到目标函数字节码改变。
4. 修正为按真实目标函数header及下一header抽取一个完整区段；全量输出保留，目标区段另存`diagnostics/v8_target_bytecode.selected.txt`。不修改指令、操作数或运行配置来凑长度。恢复后才允许进入pilot与formal。

已完成位置由写一次记录恢复，未重采或覆盖旧输出；没有正式采样在上述错误前发生。
