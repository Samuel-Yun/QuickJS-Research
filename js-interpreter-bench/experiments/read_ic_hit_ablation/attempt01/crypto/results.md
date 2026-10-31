# Crypto：有限输入身份检查，不是性能实验

实际完成48个独立新进程：3个预声明seed × Encrypt/Decrypt × 原函数/观察hook × A/M/ON/LOOKUP，N固定为2。
[audit.json](audit.json)状态为`PASS_BOUNDED_INPUT_IDENTITY`；[identities.csv](identities.csv)保留6组身份摘要。
原始stdout、状态及制品/driver SHA在`../raw/crypto/`。未进入本轮1024条正式矩阵，也未改历史Crypto数据。

## 先核对源码

冻结`crypto.js` SHA256：`6d1bc4f74a7c7b5912010365f8767bbd0f67fcd807a1ed580026a28a0e0129cf`。
加载时128次Math.random形成256字节pool；`rng_seed_time`实际混入固定常量1122926989487，不是当前时间。
首次随机字节初始化RC4，padding会重试零字节；固定密钥的当前路径不调用RSA.generate。
`base.js`的ResetRNG不能修复加载时已生成的pool。本次在base/crypto求值前安装benchmark-only xorshift32协议，
不在Setup/Run前重置已经演化的RC4状态。具体位置及其它入口见[source_notes.md](source_notes.md)、[source_random_entries.json](source_random_entries.json)。

## 实际比对了什么

每个seed/bench的8个进程（四条件×有无观察hook）核心规范化SHA完全一致：
加载后的pool/指针/Math状态，Setup及每Run后的RC4 i/j/S，固定密钥、明文和全部密文。
有hook的四条件还逐项比较了真实随机字节、PKCS#1填充结果、固定seed混入和RC4初始key。
plain保留原crypto函数；观察包装调用原函数并返回原值，未替换RSA/RC4/填充算法。原decrypt断言保持，另核对明文。
Date/Date.now入口的实际观察次数均为0，Math.random均只在加载期调用128次。

| seed | Encrypt随机字节/填充次数 | Decrypt随机字节/填充次数 |
|---|---:|---:|
| 1 | 28 / 2 | 14 / 1 |
| 305419896 | 28 / 2 | 14 / 1 |
| 3735928559 | 29 / 2 | 14 / 1 |

Decrypt的填充发生于计时不存在的本诊断Setup加密；N次解密复用这份密文。Encrypt每Run真实重新填充。
第三个seed的29个字节来自实际字节流，不能强行对齐成28。三种seed的代表性密文摘要也确实不同，
不是仅seed字段不同；所有hash在Python中、运行之后计算。

## 边界和复用

运行`python -B crypto_inputs.py`可按固定协议复查（需本轮冻结Linux ELF，身份检查和统计重放是不同入口）。
driver由脚本生成，原`base.js/crypto.js`按字节拼入，不改算法。
本报告只证明指定3个seed、N2、固定密钥、冻结版本及四条件的有限检查。
任意N、其它源码/引擎、新随机入口仍需验证；不自动允许未来纳入主聚合，更不回填上轮身份记录。
**确定性PRNG只用于benchmark，禁止用于真实安全加密。**
