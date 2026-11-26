# TRANSITION_EDGE_STRONG 源码候选

独立从冻结EVAL_COLD派生，不包含FIELD_RMW或INT_LOOP，也不包含诊断计数。
这是单轮筛选候选：Octane相对旧EVAL_COLD约−0.77%，相对旧A约−6.44%，Typescript仍有退化。
不是已多轮确认的新默认版本。未测新的SunSpider时间。

在新的空目录解压，再构建：

```sh
tar -xzf TRANSITION_EDGE_STRONG-source.tar.gz
cd quickjs-transition-edge
make -j2 -o repl.c qjs qjsc
```

当前原型针对同一x86_64 Ubuntu环境；编译时验证JSShape为56字节、缓存项为24字节。
缓存32项，保存原shape、atom、完整flags和目标shape，保活两端布局；不修改属性数组扩容和初始化代码。
运行时退出先清空缓存；COW、GC及保活成本包含在实验内。
包内没有对象文件或ELF。源码身份见manifest.json；同源改动补丁另在../patches/。
