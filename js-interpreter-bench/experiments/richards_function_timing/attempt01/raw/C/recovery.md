# C可行性尝试中的恢复

`profiling.py api_profiles`第一次在启动引擎前失败于：

```
assert source.count(r.target_bytes().decode())==1
AssertionError
```

该版本使用Python `read_text()`，把原文件CRLF规范化为LF，未通过逐字身份检查；没有拿它替代原函数或运行正式样本。未执行稿保留于diagnostics/original.cpu_profile.N2048.js。

改用`read_bytes().decode()`保留原始字节，另存original.cpu_profile.N2048.v2.js，通过原函数与源文件逐字检查后才执行C。原稿未覆盖，A/B的输入、正式记录和统计未改变。C入口/计时括界修改仅在独立driver，不改upstream函数/算法。

交付前离线finalize初版错误地要求profile的column56指向`function`关键字。实际源码关键字在列47，列56是该函数参数列表的`(`；查原文件后改为核对参数列表起始。目标URL/行/列与全部原始profile未改变，没有为此重跑采样或修改数据。
