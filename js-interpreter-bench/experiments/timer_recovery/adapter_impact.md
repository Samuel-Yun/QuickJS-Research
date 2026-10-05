# Adapter and timer impact

所有三边加载逐字相同的case/N/phase workload+标准driver（generated脚本SHA记在每条record）；只有两个adapter文件按shell加载协议不同。

| Shell | 加载形式（计时外） | workload可见接口及影响 |
|---|---|---|
| qjs | 固定binary，`-I three_engine_baseline/adapters/quickjs.js -I timer_recovery/adapters/quickjs.js <common.js>` | 原生console.log；benchNow捕获原生performance.now并用共同JS wrapper调用 |
| d8 | 固定snapshot和`--max-opt=0 --no-lazy`，随后old adapter、timer adapter、common.js | 原生console.log；同语义benchNow wrapper；不使用jsvu wrapper或Node |
| jsc | `--useJIT=false --useLLInt=true --validateOptions=true`，随后old adapter、timer adapter、common.js | console.log是原Phase2的JS facade（String转换、数组join、原生print）；benchNow捕获原生performance.now |

adapter构造/加载在timer外，不意味着adapter函数永远不进入timer：
benchNow只读两次，其首调用返回至loop/末调用读数前的控制成本自然包含在elapsed差值中，没有伪造零计时器成本。
原workload若调用JSC console.log facade，该JS facade执行/字符串转换/print成本也按原调用位置计入；不能声称所有三边输出binding成本完全相同。
原upstream包含自己的Date/performance统计时，不修改这些API或移出其成本。

timer adapter不读取/改写全局Date.now或performance.now，不用Date作为循环终止。
捕获的native clock对象与函数保存在独立闭包内，benchNow全局属性non-writable/non-configurable；避免workload重置performance对象改变两次计时来源。
不同time origin不影响本进程stop−start；不跨进程减绝对读数。

这些是新harness的显式适配，不是VM优化。三runtime二进制与依赖hash不变；没有新QuickJS计时shell。
完整actual命令、两个adapter/source hashes、环境与计时结果见新mode records/manifest以及clock binding raw。
