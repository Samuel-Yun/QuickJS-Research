# ENTRY1与OWN2五轮探索

完成170条有效性能样本、34条N=1正确性、两版各18项专项检查及ASan/UBSan内部probe，原始审计/统计独立复算通过。两版分别由READ_STORE派生，没有组合或拼接单项最优值。

|版本|核心相对READ_STORE耗时变化|扩展相对READ_STORE耗时变化|核心相对A耗时变化|
|---|---:|---:|---:|
|ENTRY1|+0.63%|+0.63%|-4.42%|
|OWN2|+0.61%|+0.53%|-4.44%|

两者没有超过READ_STORE，不晋级。完整17项、探索区间和五进程中位数见[results.md](results.md)。旧对照复用，跨批次探索不覆盖环境漂移。

ENTRY1：首次普通调用准备，复用ready字节，没有L1的新增计数器、函数头增长和活动栈扫描。冷函数probe确认首次前无IC、首次后准备；可选分配失败保留普通图像和异常状态，不再重试。记录/函数头仍24/144B，保留P1/B2/shared-store，generator/async仍eager。

时间局部改善：Closure -5.73%、JQuery -4.14%、Splay -1.45%、Richards -1.12%；RayTrace +8.78%、Typescript +3.32%、Mandreel +2.07%、Gameboy +1.53%。目标冷代码方向有实际信号，但被其他退化抵消。

OWN2：复用普通read记录的holder指针做同字段下标的第二own shape；get_field2仍是原型守卫，shared-write操作数用对齐地址低位区分两种read来源，运行和保存加载恢复对齐。probe验证两shape同下标稳定、不同下标回退、两类写来源、原型和融合命中、热保存加载。记录与头部不增长，但可能增加间接shape/prototype保活。

时间局部变化：Splay -0.63%、RayTrace -0.31%；Richards +3.63%、Gameboy +2.43%、NavierStokes +1.38%、Typescript +1.12%。两个CodeLoad基本无改善。

性能结束后独立N=1计数比较原READ_STORE控制副本与两候选，所有标记仅包围原Run循环，不计入性能成绩：

|案例|控制准备调用/读点/请求字节|ENTRY1准备调用/读点/请求字节|
|---|---|---|
|CodeLoad.Closure|59 / 219 / 9328|10 / 37 / 2288|
|CodeLoad.JQuery|535 / 3066 / 133192|73 / 510 / 26272|
|RayTrace|0 / 0 / 0|40 / 498 / 16904|
|Richards|0 / 0 / 0|32 / 124 / 4712|
|Boyer|0 / 0 / 0|32 / 136 / 5704|
|Splay|0 / 0 / 0|4 / 34 / 1200|
|Mandreel|0 / 0 / 0|60 / 21 / 4408|

ENTRY1确实省掉未执行函数的准备，也把部分原来Run前的准备移进了Run，并对热函数调用增加ready检查。计数不能分离这些因素、native编译决策与布局对耗时的贡献。

OWN2独立N=1中，RayTrace的第二shape命中为普通probe 6957、B2借用3860；Splay为普通probe 3128、B2 0。Splay仍有6262次不同下标回退和1092次第二shape填充，二shape并未覆盖所有失配。Richards第二shape命中均0。不能用命中数量直接推算周期收益，特别是无命中负载也出现了时间变化。

原始计数、source/runtime/script SHA及独立归档在post_counts；正式170条和诊断不合并。LSan关闭，没有完整test262或全面OOM证明。用户希望继续赶超当前最佳，因此仅对ENTRY1这条有明确CodeLoad信号的方向再做一次冷调用入口修订，独立批次见[attempt09](../attempt09/README.md)。
