# E 延迟反馈向量：实际逐次观察

## 程序和结果

目标函数与 attempt01 相同：

```javascript
function readPlusOne(o) {
    return o.x + 1;
}
```

完整 `example.js` 建立 `{x:3}`，调用十次，每次返回 4，总 checksum=40。每次返回后调用 print，GDB 在这个 native print 的第一条机器指令处读取此前保存的目标 bytecode 指针，不调用 inferior helper，不修改/构建 VM。输出只是诊断，没有计时。

使用同一冻结正式 E 和已有独立 E_diag_sites；源文件/二进制 SHA 均核验，完整身份在 `manifest.json`。正式 E 的逐次内存状态与诊断版一致；只有诊断版含路径计数。

|完成读取次数|正式 E heat|反馈向量|缓存条目|诊断版累计查询/命中/回退|
|---:|---:|---|---:|---|
|0|0|未建立|0|0 / 0 / 0|
|1|1|未建立|0|1 / 0 / 1|
|7|7|未建立|0|7 / 0 / 7|
|8|8|已建立|1，单态|8 / 0 / 8|
|9|8|已建立|1，单态|9 / 1 / 8|
|10|8|已建立|1，单态|10 / 2 / 8|

完整 0—10 次均见 `timeline.csv`。本例第八次建立向量并填入 shape/offset，读取本身仍经普通查找；第九次首次命中缓存。`heat` 到 8 后不再自增，因为已有向量无需再调用延迟创建函数。

该阈值按同一 bytecode 的目标属性操作累计。本例每次函数调用只有一次读取，所以恰好等于第八次调用；不能推广成所有函数都在第八次调用创建。

## 字节码和缓存分别放在哪里

执行前与十次调用后，目标字节码原始字节均为 `cf f4 00 00 00 00 b4 9b 28`：

```text
0 get_arg0
1 get_field_eic 0
6 push_1
7 add
8 return
```

site 0 的 metadata 早已记录属性 x 和 PC1。第八次改变的是旁边的 feedback vector/handler，不需要再次改写这段字节码。缓存记录布局守卫和当前属性槽 offset，不缓存“值永远等于3”。

## 证据范围

- `raw/release.feedback.json`：现有冻结正式 E 的执行前和逐次返回后状态。
- `raw/diagnostic.feedback.json`：已有独立诊断版的对应状态及计数。
- `raw/*.gdb.json`：实际命令、退出码、stdout/stderr；`raw/release.correctness.json` 为不带调试器的结果检查。
- `audit.json`：两版状态一致、计数恒等式、checksum、字节码不变及制品 hash 检查通过。

诊断 counters 是全进程计数；已逐步核对执行前查询为零，每次目标调用增加恰好一个查询，故本小程序的计数能对应到这一次读取。不能把这种对应关系套用于完整 Octane。正式 E 未插入 counters，不把诊断版时间作为正式性能结果。

捕获根函数常量池沿用上一轮成功的 ABI 方法：Linux x86_64 SysV 在 `JS_CallInternal` 第一条指令读 rdi/rsi/rdx，解析目标 bytecode；再在每次 native `js_print` 入口读其状态。这些软件断点会影响运行速度，因此本轮不报告性能。

原 attempt01 关于“执行后状态 UNKNOWN”的记录原样保留；本目录是新增的实际后续证据，不回填或改写旧快照。

## 命令

```powershell
wsl.exe -d Ubuntu -- python3 /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/e_ic_bytecode_example/attempt02/run.py
```

已有 raw 只读复用、不覆盖；新诊断请使用新 attempt。没有更新 V8、运行性能测试或修改旧实验/PPT。
