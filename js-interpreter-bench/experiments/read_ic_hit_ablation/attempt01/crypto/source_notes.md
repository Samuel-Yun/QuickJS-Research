# 冻结Crypto的输入入口：先看源码

版本固定于本仓库Octane来源，实际hash在crypto/protocol.json及manifest.json，不另取其它版本。

- crypto.js:1415--1425，加载时从Math.random抽取128个16-bit字块形成256-byte pool，随后混入seed。
- crypto.js:1408--1412，rng_seed_time的实际参数是固定1122926989487，并不读取当前时间；不能按名称判断。
- crypto.js:1430--1441，第一次取字节再次混入该常数，用pool初始化RC4，再清空pool；后续字节由RC4状态推进。
- crypto.js:1444--1451，SecureRandom.nextBytes经rng_get_byte取字节；1477--1496的PKCS#1填充排除零字节。
- 其它SecureRandom入口在大整数随机构造/RSA生成代码；本测试使用冻结固定密钥，未调用generate。按实际字节流/状态验证，而非只看密文能否解回。
- base.js:119--133定义ResetRNG，但本轮独立输入driver不在加载后调用它来假装修复已填充pool。
  自适应benchmark框架中的Date计时不用于这里的手动N2输入身份检查；native performance存在，Date/Date.now实际调用计数需为0。

新协议在任何base/crypto源码求值前，安装seed指定的xorshift32 Math.random，整个独立流程保持该协议。
prelude捕获加载draws；原始crypto函数路径与观察包装路径分别新进程运行。
观察包装只记录rng_get_byte、seed_int、RC4初始化key和真实pad结果，不改RSA/RC4/PKCS#1算法。
核心快照记录loading/Setup/每Run的pool、pointer、RC4 i/j/S、明文/密文/密钥和Math随机状态。
规范化SHA在Python中、所有运行之后计算，不把hash函数放进算法。

这只验证预声明seed1/305419896/3735928559、N2、两类Run和冻结源码的边界；不宣称覆盖任意N或版本。
原历史Crypto仍有输入未对齐限制，绝不回写其raw或GM。确定性协议不能用于真实安全加密。
