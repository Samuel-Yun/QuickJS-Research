#ifndef SCREEN_RUNTIME_OPCODE_INFO_H
#define SCREEN_RUNTIME_OPCODE_INFO_H
typedef struct RuntimeOpcodeInfo {uint8_t size,fmt;} RuntimeOpcodeInfo;
static const RuntimeOpcodeInfo runtime_opcode_table[OP_COUNT+(OP_TEMP_END-OP_TEMP_START)]={
#define FMT(f)
#define DEF(id,size,pop,push,fmt) {size,OP_FMT_##fmt},
#include "quickjs-opcode.h"
#undef DEF
#undef FMT
};
#if SHORT_OPCODES
#define runtime_op_info(op) runtime_opcode_table[(op)>=OP_TEMP_START?(op)+(OP_TEMP_END-OP_TEMP_START):(op)]
#else
#define runtime_op_info(op) runtime_opcode_table[op]
#endif
#endif
