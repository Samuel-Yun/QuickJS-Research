#include <stdio.h>
#define SHORT_OPCODES 1
int main(void){
#define DEF(id,size,pop,push,f) printf("%s %d %s\n",#id,size,#f);
#define def(id,size,pop,push,f)
#include "quickjs-opcode.h"
return 0;}
