# D16_STATIC：实际字节码和 Release 机器码

字节码取自独立计数构建中首次进入执行的 byte_code_buf；汇编取自未插桩 Release 的真实 dispatch_table 入口。从入口跟随条件分支和直接跳转，到下一次间接分派停止；不把编译输出当执行镜像。

| 版本 | 输入 | 融合前缀 | 读取指令字节 | 判断下一条是否短格式 |
|---|---|---|---:|---:|
| OLD_D16 | short | v6_get_arg0 | 3 | 1 |
| OLD_D16 | wide | v6_get_arg0 | 5 | 1 |
| OLD_D16 | short_loc0 | v6_get_loc0 | 3 | 1 |
| OLD_D16 | wide_loc0 | v6_get_loc0 | 5 | 1 |
| D16_STATIC | short | v6s_get_arg0 | 3 | 0 |
| D16_STATIC | wide | v6_get_arg0 | 5 | 0 |
| D16_STATIC | short_loc0 | v6s_get_loc0 | 3 | 0 |
| D16_STATIC | wide_loc0 | v6_get_loc0 | 5 | 0 |

旧 D16 的两种融合入口都会检查下一条 opcode 是否 get_field_rdi16；STATIC 在准备阶段选择专用前缀，源码中不读下一条 opcode 来决定格式。两个 STATIC handler 分别固定 get_u16/跳过 3 字节、get_u32/跳过 5 字节。真实 CFG 指令保存在同目录 .asm.txt；字节码原始字节在 ../targeted/counts/*.image.jsonl。
