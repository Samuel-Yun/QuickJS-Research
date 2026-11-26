# 已确认区间，但补充慢路径断点需修正

N=16，目标命名读取入口恰好 16，10 次无反馈和 2 次 IC miss；
首个无反馈的堆栈来自 GetNamedPropertyHandler，已排除先前的全局函数读取。

额外尝试观测的 Builtins_LoadIC_Slow 在此二进制不存在，GDB 将它留为 pending，
因此其零值不能作为慢路径不存在的证据。后续改用实际存在的 Runtime_GetProperty，
并要求所有计数断点均解析为唯一地址。该探针不作为最终七组数据。
