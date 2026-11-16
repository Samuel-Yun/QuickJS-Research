# 公开raw的重算口径

源码及首批机制采集前已写明的算法在此集中说明；没有改变计算规则。不要将本文件当作新性能样本。

- 各组统计elapsed_ms/N，单位ms/完整Run；内层4096次不再被当成一个指令的self-time。
- median、mean；样本标准差分母n−1。min/max不剔除异常值。
- Q1/Q3为排序后下半组/上半组的中位数（Tukey halves，奇数时不包含全组中位数）。n=30时分别是最低15个/最高15个的中位数；IQR=Q3−Q1。这不是bootstrap区间端点的算法。
- 每case必须按同rep的完整条件组重采样；每次抽取同样数量的rep，重新求各条件中位数，再求中位数之比，不是配对时间比的中位数。B=10000，seed=20261102。
- bootstrap区间端点为排序后索引(B−1)q的线性插值，q=0.025/0.975。探索性、未做多重校正；跨1记方向不明确，不等于证明等效。
- 全26 SunSpider案例等权时间比GM；Octane核心16项/13suite和扩展17项/14suite分别先在suite内部GM，再suite等权。Crypto固定输入包含在内，不按结果排除；Box2D及官方latency不混入。
- 聚合先取所有预定案例共享的完整rep交集，按全局同轮block重采样；同一次bootstrap中所有案例使用相同rep抽样序列。GM=exp(mean(log(ratio)))，不相加不同案例的毫秒。
- 另列M/V8_ON和U/V8_ON，辅助判断时间比是否更接近1；不能仅由U/M<1就断言绝对距离缩小。
- 外部wall/user/system为整个新进程，单位ms/进程。不能将内外中位数相减命名为精确初始化成本。

可移植性：analyze.py、audit.py、report.py只读本目录公开JSON/CSV/manifest，不导入common.py，不访问/home路径，不启动引擎，也不需要私有参考项目。目录内.gitattributes禁用证据文件的Git换行转换，避免克隆时CRLF改变原字节SHA。旧实验的换行及哈希未改动；本说明只约束本次新增材料。
