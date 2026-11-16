# 既有门禁及本轮执行范围

基于冻结 Octane `570ad1ccfe86e3eecba0636c8f932ac08edec517`，沿用 `experiments/octane_strict/harness_audit.md` 与 `experiments/read_ic_dequickening/attempt01/inputs/driver.js` 的已审计验证语义，不用“没有崩溃”替代结果门禁。新 driver 只将 Run 引用及 count 捕获到计时前的局部变量，原 workload 不改。

| Run 单元 | 保留的检查及阶段 |
| --- | --- |
| Richards.Richards | 原 Run 的 queueCount=2322、holdCount=928 |
| DeltaBlue.DeltaBlue | 原 chain/projection 约束验证；失败进入原 alert 路径也会使 shell 失败 |
| Crypto.Encrypt | N1/N2、选定N均用原 decrypt 检验末次明文；独立输入验证逐次核对真实密文/明文和RC4状态，原函数/观察hook相同 |
| Crypto.Decrypt | 必需输入encrypt在Setup；原Run逐次明文==TEXT断言，另做输入身份验证 |
| RayTrace.RayTrace | 原renderScene/renderer checksum=2321 |
| EarleyBoyer.Earley | 原RunBenchmark的结果断言 |
| EarleyBoyer.Boyer | 原RunBenchmark的结果断言 |
| RegExp.RegExp | 每Run原5轮checksum=1666109；严格模式保留构造输入，不做Setup的额外完整priming Run |
| Splay.Splay | 原TearDown检查8000节点及严格排序，保留跨Run演化 |
| NavierStokes.NavierStokes | 原frame15 checksum=77；N<15时在timer后继续至15，额外次数逐进程记录 |
| PdfJS.PdfJS | 原TearDown逐日志length36788/hash939524096，保留跨Run日志积累 |
| Mandreel.Mandreel | 原Run的Mandreel_checkState checksum8001026及原TearDown；动态eval仍在Run |
| Gameboy.Gameboy | 原checkFinalState的CPU寄存器、内存等断言 |
| CodeLoad.CodeLoadClosure | 原eval结果与salt断言；动态源码生成/eval留在Run |
| CodeLoad.CodeLoadJQuery | 原eval结果与salt断言；动态源码生成/eval留在Run |
| Typescript.Typescript | 原parseErrors192/193、输出checksum(-412589664)；TS编译器本身是workload |

本轮 `raw/correctness/` 是96个N1/N2新进程，`raw/selected_correctness/` 是选定N的新进程复核；实际完成数见汇总而不是按目标填数。每次保留完整stdout/stderr及退出码。实际注册Run的完整函数源码和this-token检查见 `run_this_audit.json`，相同源文件、suite/index/名称注册检查适用于三条件；workload内部的方法receiver不改变。

## Crypto新输入模式

`BENCH_ONLY_XORSHIFT32_PRELOAD_V1`，唯一正式seed=305419896，在base/crypto求值前安装；Crypto不调用加载后的ResetRNG冒充固定pool，也不在Setup/每次Run重置RC4。只有诊断进程包装原随机字节、padding、seed-int、RC4-init，调用并返回原函数值。正式脚本不装观察hook。

诊断与原函数对照均按实际顺序读取加载pool/指针、128个Math.random字、固定密钥、每次密文/实际解密明文、每Run完整RC4 i/j/S；以Python标准库对逐事件规范化JSON流计算SHA256。观察路径另比随机字节、padding块、seed混入和RC4初始key；所有条件/原函数与hook的核心摘要须相同，三条件hook摘要也须相同。保留事件数、首末3个实际事件、真实初始pool及末次状态，避免存巨大的对象轨迹；流的原stdout整体hash和字节数也记录，未声称保留完整轨迹。诊断额外解密/输出会扰动执行，因此其耗时绝不进入正式表。

输入验证范围严格限当前源码/固定密钥/seed/N及三条件；不是任意输入证明，也不是安全随机数。每个正式Crypto进程的末次密文还须与相应N身份门禁一致。Crypto与旧历史随机输入不作时间比。
