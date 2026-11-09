# 首次 GDB 短探针未开始计数

GDB 正确停在第一处 SystemBreak，stdout 显示 SIGTRAP 和 OS::DebugBreak。
但此机器 GDB Python API 将其上报为通用 StopEvent，没有 stop_signal 属性，
工具对 SignalEvent 类型名称的断言失败，尚未安装任何计数断点。
记录原样保留。后续改为检查停止次数，并通过两处原生堆栈都包含 SystemBreak
确认区间端点，不依赖该 Python 事件子类名称。
