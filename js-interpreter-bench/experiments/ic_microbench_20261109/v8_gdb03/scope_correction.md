# 入口数为 N，但额外捕获一次全局函数加载

N=16 的目标 GetNamedProperty 入口数已为 16，但首个 LoadIC_NoFeedback 的原生栈
显示来自 LdaGlobalHandler：调用表达式对全局 readLoop 函数的解析仍位于标记区间内。
该次无反馈访问还有一次 LoadNoFeedbackIC_Miss 回退，不应归到 obj.x。

后续也在区间外把 readLoop 函数保存为局部 microReader，再在标记区间内用局部调用。
增加 Slow 与 Noninlined 分支观测，并用多个短 N 检查目标入口数与分支和。
本目录数据不作为最终命中率。
