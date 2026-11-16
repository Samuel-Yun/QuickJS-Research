# COLD_ENTRY五轮探索

完成85条新性能样本、17条N1负载正确性，以及专项语义/native/ASan/UBSan和修正后的独立probe；原始采样审计与离线统计复算通过。一个固定ELF测17项，旧对照复用。相同引擎源码及构建制品来自attempt09，失败批次不含性能点；此批使用修正后的单参数JS_NewClassID探针并重新资格检查。

|比较|核心16项/13suite耗时变化|含zlib扩展17项/14suite耗时变化|
|---|---:|---:|
|相对A|-4.76%|-5.01%|
|相对READ_STORE|+0.28%|-0.06%|

相对READ_STORE核心比值95%探索区间[0.999301, 1.004761]，扩展[0.996092, 1.001419]，均跨1。不能认为已超过READ_STORE，也不能把扩展相对A的-5.01%称为稳定超过5%。完整17项见[results.md](results.md)，区间不含跨批次未观测漂移。

局部相对READ_STORE：Splay -2.79%、Closure -5.50%、JQuery -3.99%、zlib -4.31%、Mandreel -2.11%；RayTrace +7.89%、Typescript +3.68%、NavierStokes +3.80%、DeltaBlue +2.10%、Boyer +1.36%。保持为探索材料，不晋级默认版本。

用一次性冷函数类别取代ENTRY1每次普通调用的ready检查，准备或回退后切回原bytecode-function类别。热JS_CallInternal源代码与READ_STORE相同。记录24B、函数头144B、对象结构不变，但有额外内部class和每context一个class-prototype槽；原生JS_GetClassID可观察类别变化。private probe覆盖共享字节码、never-called闭包cycle、native参数释放顺序、跨context构造、首次可选OOM、保存加载和三类命中。LSan关闭，没有完整test262或全OOM/API兼容证明。

性能结束后的独立计数与ENTRY1的七项计数一致：Closure准备调用/读点/请求字节10/37/2288，JQuery73/510/26272，RayTrace40/498/16904；父版分别59/219/9328、535/3066/133192、0/0/0。说明全局延迟确实改变准备工作量和发生时机，不能把命中/分配计数直接换算为周期归因。正式性能与post_counts独立归档。

native_layout保存了父版与候选热解释器机器码比较：43057/43089字节，10143/10146条静态指令。进一步去地址、位移和内部跳转偏移后，指令差异定位于一个原NOP被另一个NOP和三条附加对齐NOP替代。没有证据表明新增了三条实际计算指令；这也不是周期等价或缓存行为等价证明。

据实际计数继续验证一个范围更窄的方案：仅eval来源普通函数延迟，静态/module/loaded函数保持eager，独立批次见[attempt11](../attempt11/README.md)。不按benchmark身份选择策略。
