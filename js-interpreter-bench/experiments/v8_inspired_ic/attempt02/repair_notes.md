# attempt02：生命周期修复后的独立批次

attempt01保留 `BLOCKED_CORRECTNESS`。旧E SHA为
`9c63319540ac04e3fc1e6e2055a3e5f178e3377a8b3fc4213bbc3eb711526932`，
其558条已保存记录虽通过Octane结果门禁，但该引擎未通过新增C API回归，
不能作为有效优化结论。未记录完的started位置也不补写。

新增测试最初的 `JSClassID` 未初始化，A/E在注册类时提前返回；该版不是
有效的跨版本对照。`attempt01/correctness/finalizer_store_v2.c` 修正为0后，
A通过，E断言退出，E_san报告store miss路径的属性指针失效。
全部原始结果保留在前一attempt的 `raw/validation/finalizer_store_v2/`。

根因：own-store miss先找到JSProperty，再更新缓存；第五种shape使缓存转
GENERIC，释放旧shape所保活的prototype图，可调用原生finalizer。
该finalizer只通过C API对仍存活的普通对象添加int字段，不执行JS，
但可使目标prop数组重分配。随后沿旧pr写入不安全。
QuickJS文档 `doc/quickjs.texi:874–879` 禁止finalizer执行JS；本测试未执行JS。
这是本实现的嵌入边界检查，不是攻击实验。

修复仅改变own-store miss的提交顺序：先用原set_value完成写入，再重新
查找并核对当前属性，之后才更新反馈；缓存释放后不再使用旧pr。
set_value本身也可释放旧值，因此不能简单把update移后却继续用原指针。
own-store hit无额外重查，反馈组织、容量、准入、其它handler均不变。

这是正确性修复，不是看到性能后调整设计。新E、新构建区、新runtime清单、
新校准和完整A/E/V8_ON新批次；不导入旧性能raw，也不混合两个E哈希。
参考源码从attempt01已核验归档复制，重新核验实际文件SHA，不重试下载。
新增回归必须在Release和新的ASan/UBSan构建都通过，方可冻结新E采样。
