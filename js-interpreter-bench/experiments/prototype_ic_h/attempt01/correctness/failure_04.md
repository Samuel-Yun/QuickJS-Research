首版内部 COW/OOM 探针退出 3，见 H.cow_oom.run.json。源码核查发现
该 revision 的 <=512B 分配会复用已存在的 arena 空闲块（A quickjs.c:
1550–1580）；JS_SetMemoryLimit 检查底层 arena/large 分配，不能保证
下一次小 shape 克隆必失败。这不是已确认的 H 语义失败。

修正的内部测试构建 129 属性的合法 hashed holder，断言克隆大小 >512B，
然后设置 limit=0，迫使 large 分配失败；检查失败后旧 shape、缓存和值
均保留，再恢复上限并调用同一读取函数。正式 benchmark 和 H 未改变。
新结果记录 build2/run2；原失败保留。若新检查仍失败，禁止正式计时。
