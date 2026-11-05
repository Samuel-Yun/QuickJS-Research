# 目标最终字节码（N2独立诊断）
这是实际编译结果的规范记录：atom操作数的4字节ID清零并另表保留名字；MIC统一回原普通opcode。
不是中间IR。operand_hex按真实小端编码保留，不伪造汇编操作数。

## M4.numeric_control / M / m4Loop
canonical code+atoms SHA256: `66a38112d1155c97fcaaad1179de073d23c2b76828e45acc840121d37534a39c`
18 bytes；完整原记录在 diagnostic/raw/M4.numeric_control.N2.M.dispatch.json.gz。
```text
PC  opcode               operand_hex  atom  ordinary_dispatch / MIC_dispatch
  0 push_0                                          2 / 0
  1 put_loc0                                        2 / 0
  2 push_0                                          2 / 0
  3 put_loc1                                        2 / 0
  4 get_loc1                                        8194 / 0
  5 get_arg0                                        8194 / 0
  6 lt                                              8194 / 0
  7 if_false8             08                        8194 / 0
  9 get_loc1                                        8192 / 0
 10 add_loc               00                        8192 / 0
 12 inc_loc               01                        8192 / 0
 14 goto8                 f5                        8192 / 0
 16 get_loc0                                        2 / 0
 17 return                                          2 / 0
```
实际dispatch为0不代表该逻辑opcode未被融合handler消费。

## M4.numeric_control / M / microRun
canonical code+atoms SHA256: `3b50030f9438af4893ce6f711c8fd456702345c876279dc30060f4407a718836`
9 bytes；完整原记录在 diagnostic/raw/M4.numeric_control.N2.M.dispatch.json.gz。
```text
PC  opcode               operand_hex  atom  ordinary_dispatch / MIC_dispatch
  0 get_var               0000                      2 / 0
  3 push_i16              0010                      2 / 0
  6 tail_call             0100                      2 / 0
```
实际dispatch为0不代表该逻辑opcode未被融合handler消费。

## M4.numeric_control / R / m4Loop
canonical code+atoms SHA256: `66a38112d1155c97fcaaad1179de073d23c2b76828e45acc840121d37534a39c`
18 bytes；完整原记录在 diagnostic/raw/M4.numeric_control.N2.R.dispatch.json.gz。
```text
PC  opcode               operand_hex  atom  ordinary_dispatch / MIC_dispatch
  0 push_0                                          2 / 0
  1 put_loc0                                        2 / 0
  2 push_0                                          2 / 0
  3 put_loc1                                        2 / 0
  4 get_loc1                                        8194 / 0
  5 get_arg0                                        8194 / 0
  6 lt                                              8194 / 0
  7 if_false8             08                        8194 / 0
  9 get_loc1                                        8192 / 0
 10 add_loc               00                        8192 / 0
 12 inc_loc               01                        8192 / 0
 14 goto8                 f5                        8192 / 0
 16 get_loc0                                        2 / 0
 17 return                                          2 / 0
```
实际dispatch为0不代表该逻辑opcode未被融合handler消费。

## M4.numeric_control / R / microRun
canonical code+atoms SHA256: `3b50030f9438af4893ce6f711c8fd456702345c876279dc30060f4407a718836`
9 bytes；完整原记录在 diagnostic/raw/M4.numeric_control.N2.R.dispatch.json.gz。
```text
PC  opcode               operand_hex  atom  ordinary_dispatch / MIC_dispatch
  0 get_var               0000                      2 / 0
  3 push_i16              0010                      2 / 0
  6 tail_call             0100                      2 / 0
```
实际dispatch为0不代表该逻辑opcode未被融合handler消费。

## M1.own_integer / M / m1Read
canonical code+atoms SHA256: `91ae2446f3ecaf16535dc4c18ad2979edb2f649a407e92ba01914d044fc68153`
26 bytes；完整原记录在 diagnostic/raw/M1.own_integer.N2.M.dispatch.json.gz。
```text
PC  opcode               operand_hex  atom  ordinary_dispatch / MIC_dispatch
  0 push_0                                          2 / 0
  1 put_loc0                                        2 / 0
  2 push_0                                          2 / 0
  3 put_loc1                                        2 / 0
  4 get_loc1                                        8194 / 0
  5 push_i16              0010                      8194 / 0
  8 lt                                              8194 / 0
  9 if_false8             0e                        8194 / 0
 11 get_loc0                                        8192 / 0
 12 get_arg0                                        8192 / 0
 13 get_field             00000000     x            0 / 8192
 18 add                                             8192 / 0
 19 put_loc0                                        8192 / 0
 20 inc_loc               01                        8192 / 0
 22 goto8                 ed                        8192 / 0
 24 get_loc0                                        2 / 0
 25 return                                          2 / 0
```
实际dispatch为0不代表该逻辑opcode未被融合handler消费。

## M1.own_integer / M / microRun
canonical code+atoms SHA256: `421f14d7c1d66a0036c449b72766ba7d8a6a3d7838fe0fd0c088cbd0c4d84a2f`
9 bytes；完整原记录在 diagnostic/raw/M1.own_integer.N2.M.dispatch.json.gz。
```text
PC  opcode               operand_hex  atom  ordinary_dispatch / MIC_dispatch
  0 get_var               0000                      2 / 0
  3 get_var               0100                      2 / 0
  6 tail_call             0100                      2 / 0
```
实际dispatch为0不代表该逻辑opcode未被融合handler消费。

## M1.own_integer / R / m1Read
canonical code+atoms SHA256: `91ae2446f3ecaf16535dc4c18ad2979edb2f649a407e92ba01914d044fc68153`
26 bytes；完整原记录在 diagnostic/raw/M1.own_integer.N2.R.dispatch.json.gz。
```text
PC  opcode               operand_hex  atom  ordinary_dispatch / MIC_dispatch
  0 push_0                                          2 / 0
  1 put_loc0                                        2 / 0
  2 push_0                                          2 / 0
  3 put_loc1                                        2 / 0
  4 get_loc1                                        8194 / 0
  5 push_i16              0010                      8194 / 0
  8 lt                                              8194 / 0
  9 if_false8             0e                        8194 / 0
 11 get_loc0                                        8192 / 0
 12 get_arg0                                        8192 / 0
 13 get_field             00000000     x            0 / 8192
 18 add                                             8192 / 0
 19 put_loc0                                        8192 / 0
 20 inc_loc               01                        8192 / 0
 22 goto8                 ed                        8192 / 0
 24 get_loc0                                        2 / 0
 25 return                                          2 / 0
```
实际dispatch为0不代表该逻辑opcode未被融合handler消费。

## M1.own_integer / R / microRun
canonical code+atoms SHA256: `421f14d7c1d66a0036c449b72766ba7d8a6a3d7838fe0fd0c088cbd0c4d84a2f`
9 bytes；完整原记录在 diagnostic/raw/M1.own_integer.N2.R.dispatch.json.gz。
```text
PC  opcode               operand_hex  atom  ordinary_dispatch / MIC_dispatch
  0 get_var               0000                      2 / 0
  3 get_var               0100                      2 / 0
  6 tail_call             0100                      2 / 0
```
实际dispatch为0不代表该逻辑opcode未被融合handler消费。

## M3.own_method / M / m3Step
canonical code+atoms SHA256: `ac8907b9b33409791f559156713f2bf8f5a5d2d1205360777d4f4495eab4e9e6`
11 bytes；完整原记录在 diagnostic/raw/M3.own_method.N2.M.dispatch.json.gz。
```text
PC  opcode               operand_hex  atom  ordinary_dispatch / MIC_dispatch
  0 push_this                                       8192 / 0
  1 put_loc0                                        8192 / 0
  2 get_arg0                                        8192 / 0
  3 get_loc0                                        8192 / 0
  4 get_field             00000000     bias         0 / 8192
  9 add                                             8192 / 0
 10 return                                          8192 / 0
```
实际dispatch为0不代表该逻辑opcode未被融合handler消费。

## M3.own_method / M / m3Call
canonical code+atoms SHA256: `09f4d01ddab1f3b193af6c582dc11198d0f9e49415dd21394879d778e24d0dd0`
30 bytes；完整原记录在 diagnostic/raw/M3.own_method.N2.M.dispatch.json.gz。
```text
PC  opcode               operand_hex  atom  ordinary_dispatch / MIC_dispatch
  0 push_0                                          2 / 0
  1 put_loc0                                        2 / 0
  2 push_0                                          2 / 0
  3 put_loc1                                        2 / 0
  4 get_loc1                                        8194 / 0
  5 push_i16              0010                      8194 / 0
  8 lt                                              8194 / 0
  9 if_false8             12                        8194 / 0
 11 get_loc0                                        8192 / 0
 12 get_arg0                                        8192 / 0
 13 get_field2            00000000     step         0 / 8192
 18 get_loc1                                        8192 / 0
 19 call_method           0100                      8192 / 0
 22 add                                             8192 / 0
 23 put_loc0                                        8192 / 0
 24 inc_loc               01                        8192 / 0
 26 goto8                 e9                        8192 / 0
 28 get_loc0                                        2 / 0
 29 return                                          2 / 0
```
实际dispatch为0不代表该逻辑opcode未被融合handler消费。

## M3.own_method / M / microRun
canonical code+atoms SHA256: `421f14d7c1d66a0036c449b72766ba7d8a6a3d7838fe0fd0c088cbd0c4d84a2f`
9 bytes；完整原记录在 diagnostic/raw/M3.own_method.N2.M.dispatch.json.gz。
```text
PC  opcode               operand_hex  atom  ordinary_dispatch / MIC_dispatch
  0 get_var               0000                      2 / 0
  3 get_var               0100                      2 / 0
  6 tail_call             0100                      2 / 0
```
实际dispatch为0不代表该逻辑opcode未被融合handler消费。

## M3.own_method / R / m3Step
canonical code+atoms SHA256: `ac8907b9b33409791f559156713f2bf8f5a5d2d1205360777d4f4495eab4e9e6`
11 bytes；完整原记录在 diagnostic/raw/M3.own_method.N2.R.dispatch.json.gz。
```text
PC  opcode               operand_hex  atom  ordinary_dispatch / MIC_dispatch
  0 push_this                                       8192 / 0
  1 put_loc0                                        8192 / 0
  2 get_arg0                                        8192 / 0
  3 get_loc0                                        8192 / 0
  4 get_field             00000000     bias         0 / 8192
  9 add                                             8192 / 0
 10 return                                          8192 / 0
```
实际dispatch为0不代表该逻辑opcode未被融合handler消费。

## M3.own_method / R / m3Call
canonical code+atoms SHA256: `09f4d01ddab1f3b193af6c582dc11198d0f9e49415dd21394879d778e24d0dd0`
30 bytes；完整原记录在 diagnostic/raw/M3.own_method.N2.R.dispatch.json.gz。
```text
PC  opcode               operand_hex  atom  ordinary_dispatch / MIC_dispatch
  0 push_0                                          2 / 0
  1 put_loc0                                        2 / 0
  2 push_0                                          2 / 0
  3 put_loc1                                        2 / 0
  4 get_loc1                                        8194 / 0
  5 push_i16              0010                      8194 / 0
  8 lt                                              8194 / 0
  9 if_false8             12                        8194 / 0
 11 get_loc0                                        8192 / 0
 12 get_arg0                                        8192 / 0
 13 get_field2            00000000     step         0 / 8192
 18 get_loc1                                        8192 / 0
 19 call_method           0100                      8192 / 0
 22 add                                             8192 / 0
 23 put_loc0                                        8192 / 0
 24 inc_loc               01                        8192 / 0
 26 goto8                 e9                        8192 / 0
 28 get_loc0                                        2 / 0
 29 return                                          2 / 0
```
实际dispatch为0不代表该逻辑opcode未被融合handler消费。

## M3.own_method / R / microRun
canonical code+atoms SHA256: `421f14d7c1d66a0036c449b72766ba7d8a6a3d7838fe0fd0c088cbd0c4d84a2f`
9 bytes；完整原记录在 diagnostic/raw/M3.own_method.N2.R.dispatch.json.gz。
```text
PC  opcode               operand_hex  atom  ordinary_dispatch / MIC_dispatch
  0 get_var               0000                      2 / 0
  3 get_var               0100                      2 / 0
  6 tail_call             0100                      2 / 0
```
实际dispatch为0不代表该逻辑opcode未被融合handler消费。
