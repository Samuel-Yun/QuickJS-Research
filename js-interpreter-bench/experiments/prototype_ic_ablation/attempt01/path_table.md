# 路径对照：源事实、计数与尚未量出的成本

固定起点92b2350708494f8037b19bba3a3323cf5e6b3f47，原 H/M 源码只读。
新补丁为 patches/H_to_switch.patch，只有 quickjs.c、qjs.c、
read_ic_opcodes.inc 改变；config、types、prepare、序列化和引用算法未改。

|操作|冻结 M|冻结 H|新 OFF|新 ON|
|---|---|---|---|---|
|site与分配|16B，eager|24B，eager|保留24B/eager|与OFF同一ELF、同样24B/eager|
|own命中|receiver准入/shape，当前prop值，原所有权|仍有holder_shape种类分支，NULL走own|与H相同，不检查实验开关|与OFF同一代码；own命中不需开关判断|
|稳定继承读取|普通receiver/holder查找，每次回退|冷填后receiver/holder守卫，读当前holder.prop|禁止继承填充，每次正常查找；未换回M结构|允许填充，随后沿H继承命中路径|
|继承miss且合格|只普通查找|更新单槽|增加一次开关条件后跳过继承更新|开关条件允许，更新原H单槽|
|缓存替换|own receiver shape引用替换|先保活新receiver/holder shape，再释放旧边|own替换仍发生；不创建继承项|原H规则；task.run仍可能频繁替换|
|own/继承交替|继承不更新own项|完整条目含holder种类/shape参与更新|保留旧own项，继承只返回正常结果|继承可以替换own项；两边状态演化本就不同|
|销毁/GC/加载|原M边与prepare|额外holder_shape独立mark/free；序列化不含运行期项|同一释放/加载代码，继承边从未填入|同一代码，释放实际持有边；加载后重新填充|

开关使用两个file-static int，未增加JSRuntime/JSContext/object/site字段。
qjs CLI main在创建runtime之前调用私有initializer，合法0/1只读取一次，
之后即使环境改变再次调用initializer，也不会改变保存值。没有JS选项
或新生产头文件API。qjsc用于构建时不走qjs CLI入口；专用C序列化host
显式调用私有initializer。不能把这个实验CLI设计宣传为通用嵌入API。

OFF保留正常异常、getter receiver、Proxy/primitive、多层与unhashed
回退。不缓存JSValue/函数/prop数组指针。源码实际只在继承填充处追加
`&& qjs_experiment_proto_ic_enabled`，没有沿用旧SW的强制命中再查找。

## 实际机器码和边界

新Release SHA为e4c346263639aab390a033a7d0bb1892bb747821c68919c816803a65ae98f44d。
一次objdump仅导出JS_CallInternal，完整压缩原文及SHA在raw/和assembly.json。
switch_assembly_excerpt.txt中实际两处比较：

```text
2c2ac: cmp DWORD PTR [rip+0xdad61],0x0  # 107014 <qjs_experiment_proto_ic_enabled>
2c3e7: cmp DWORD PTR [rip+0xdac26],0x0  # 107014 <qjs_experiment_proto_ic_enabled>
```

两处之前可见普通class/exotic及两边hashed条件，之后是条目比较和
shape引用加减，OFF分支跳回保留原查找结果的结束路径。own命中源码
块没有新增开关使用；两处机器码对应两个读取宏展开的继承填充块。
nm未见rdi_probe/rdi_update独立符号，结合force_inline源码支持其在此
构建内联；不是每条指令动态执行记录，更不把汇编条数当周期。

## 动态证据的范围

target_sites.csv按源码SHA、实例、真实最终PC列四workload的N1/N2：
OFF所有继承填充/命中为0，原型目标每次仍进行正常两层own探查；
own_integer仍有own填充和后续命中。ON目标计数与原H已归档计数逐项
一致，包含TCB.run的多receiver替换。冷填充不机械按N翻倍。
两个选项最终字节码、site数相同，实测均24B；缓存数组结束活跃字节
归零且shape边增减平衡。数字循环m4Loop没有目标字段指令，但驱动
有少量IC，不能把它写成全进程零IC。计数范围是整个诊断进程。

ON/OFF若有时间差，只能解释为本实验框架内启用功能的整体增量，
包括少查找、holder守卫、填充/替换、引用与缓存状态后效。ON/H检验
新框架扰动，OFF/M检验保留H公共代码后的差异；它们不能单独拆出
空间、分支、引用或布局成本。numeric_control与own_integer的百分比
也不能相减变成纯IC开销。间接保活峰值/RSS仍UNKNOWN。
