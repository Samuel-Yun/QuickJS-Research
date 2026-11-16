#include <signal.h>
#include <execinfo.h>
#include <unistd.h>
#include <stdlib.h>
#define main ownmain
#include "../ownership.c"
#undef main
static void fail(int s){void*p[64];int n=backtrace(p,64);backtrace_symbols_fd(p,n,2);_Exit(128+s);}
int main(void){signal(SIGSEGV,fail);signal(SIGABRT,fail);return ownmain();}
