# 微基准实际字节码

`*.raw.txt`是独立C_bytecode诊断构建的完整原始stdout，命令、脚本/制品身份及stderr在
`../raw/build/bytecode_*.json`，诊断制品SHA在`../correctness/mechanism_gate.json`。
仅开启DUMP_BYTECODE=1，打印编译完成后的最终bytecode；不是qjs -d，也不是中间IR。
诊断binary从不用于正式计时。

阅读时用`*.target_only.txt`，它是从上述真实输出按函数标题边界提取的目标函数，
含M3 caller和callee的各自标题，不把不同函数拼成一个函数。
早期`*.targets.txt`边界过滤过宽，可能包含后续driver函数，**不作为目标函数独立dump使用**；
它们保留用于说明工具修正，不替代原始stdout。

这些dump是**执行前最终编译形式**，所以可见get_field、put_field等普通opcode。
旧IC在运行期将合格位置重写为*_ic；已重写查询/命中证据另见
`../correctness/target_units.csv`（N=2）与`../analysis/micro_target_units.csv`（所选正式N诊断）。
不要把编译期dump说成运行期已改写bytecode的再次打印。

C/D编译规则、输入完全相同，仅运行时读wrapper声明属性不同；源码逐字比较见post_static_audit。
M4目标函数不含字段opcode且无目标IC单位；M5循环为put_field，验证函数的字段读在timer外。
驱动及adapter有自己的属性活动，不能据整进程查询将M4误判成属性读取测试。
