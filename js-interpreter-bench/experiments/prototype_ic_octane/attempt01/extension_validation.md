# 扩展覆盖：原始源码、实际命令与验证边界

源码统一为冻结Octane570ad1ccfe86e3eecba0636c8f932ac08edec517。
inputs.json保留历史原字节与归档LF SHA，inputs/octane保留原版权/许可。

## Box2D

原box2d.js:482起MakeNewWorld建立ground及10×5个动态body，:551起runBox2D
把返回world保存在函数局部，执行20次Step(1/60,10,3)，不返回或断言最终状态。
TearDown将全局world/Box2D置null，外部world不是该Run的局部对象。
内部b2Assert是算法/输入约束，未找到可信完整输出门禁。

raw/compatibility/Box2D.Box2D保存五个真实N1进程。命令为runtime.json中各qjs绝对路径
加同一个scripts/Box2D.Box2D/N1.correctness.js；退出均0、stderr为空。
这证明能运行、原内部assert未报错，不证明完整物理结果正确。因此不是“不支持Box2D”，
也不把旧NOT_INCLUDED直接继承；本轮实际验证后仍因结果门禁不足不进入正式矩阵。
未修改MakeNewWorld或Run来暴露结果，也没有从某引擎输出反造expected。

## zlib

raw/compatibility_original/zlib.zlib保存未加适配的五个失败，stderr原文含read未定义。
适配后的五条命令统一为各冻结qjs --std scripts/zlib.zlib/N1.correctness.read.js；
脚本在静态装载阶段定义共享read(path,mode)，只有真正被调用才执行std.open/read。
没有提前调用InitializeZlibBenchmark、Ya或workload。原始zlibEval字符串和算法不改。

zlib-data.js:65起InitializeZlibBenchmark包含一个原始JS字符串；离线按字符串转义
还原后共185151字符（仅用于阅读，没有把解码文本替换进执行脚本）。实际导出_main:a2，
a2识别参数字符'1'后令g=60，分配并生成100000字节，循环调用a1。
a1的尾部有以下真实原断言片段（前后省略，并非完整连续函数）：

```javascript
if((X|0)==1e5){break L331}az(12904,24,14192,12872)
// ... later at the end of a1 ...
if(!bs){i=h;return}
if((aG(f|0,c[1044]|0)|0)==0){i=h;return}else{az(12904,25,14192,12840)}
```

同一字符串的导入映射为az=env.___assert_func、aG=env._strcmp。
因此保留的是原解压长度检查及C strcmp检查，不应称为本轮新增的100kB逐字节独立checksum；
strcmp具有NUL终止边界，原输入也包含0字节，验证强度有这个限制。
没有删除原assert或用退出0单独替代它们。五条件适配N1均退出0且原断言未失败，
再进入N1/N2和选定N验证；它们的真实完成数见raw/summary而不是本说明预填。

read的引用在Run首次动态初始化时；必要时发生的I/O和动态eval仍在Run内。
--std额外宿主模块与static wrapper装载在计时前，五条件相同。
本轮不声称read一定实际进行了文件I/O，也未把它的可能成本单独分离。

兼容检查实际耗时42.740秒，远低于30分钟上限；coverage_frozen在所有性能结果前冻结。
原Splay/Mandreel latency属于另一自适应指标，本轮仍不报告其官方评分。
