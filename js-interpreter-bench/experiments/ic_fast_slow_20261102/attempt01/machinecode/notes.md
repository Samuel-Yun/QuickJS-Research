# 实际 ELF 的公开读取窗口

身份见 identity.json；窗口来自原 A、指定原 M 和本轮 C 的真实 ELF，不是把 C 源码当机器码。反汇编显式标出 non-contiguous window，省略位置不可当连续执行。

指定原 M 的 get_field_rdi 命中候选区位于 ELF 相对地址 0x29ce0：cmp cached shape/current shape，不等则回普通分支；0x29ce9加载site+8的uint32属性索引，0x29ced检查UINT32_MAX；0x29cf6将索引左移4位，0x29cfa加上当前对象prop数组地址，随后加载JSValue的两个字。Dup 对引用值有tag判断及引用头加一，之后仍有receiver释放/结果保存。

get_field2_rdi 的对应候选区在0x29f02，索引读取0x29f0b，0x29f1a左移4位，0x29f1e加当前prop地址，后续取值与Dup。它保留receiver，不与get_field的清理混同。

注意区分两种左移：handler入口按site index×16定位site（例如0x23f46、0x24019）与上述按property index×16定位JSProperty是两项不同的工作。不能因为看到一条shl就随意命名为属性成本。实际 sizeof(JSProperty) 另由 layouts.json 核对。

普通查找窗口包含 shape mask/bucket、hash链索引/atom比较、普通data检查和取当前值；例如原 M 0x23f80起读取mask/桶，0x23fa5比较atom。没有以静态代码存在断言每个正式样本都经过它；相应工作量由独立控制诊断验证。probe/find 在此处是内联代码，不是额外 native call。

这些地址只适用于identity.json所列ELF，ASLR绝对基址另变。控制C新增policy分支/周期和helper，不能当原M零开销桥接。本轮尚未量出单条load/shift/Dup的时间；静态条数不换算成本。perf一次检查无可用命令（退出127），不安装工具、不修改内核/权限，继续受控测量。
