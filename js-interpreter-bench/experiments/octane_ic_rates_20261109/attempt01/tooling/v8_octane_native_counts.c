/* Diagnostic-only, pinned V8 15.6.21 x64 ELF. Never edits the ELF on disk.
 * Temporary in-process entry trampolines preserve VM registers and flags.
 * Count explicit Ignition named reads, excluding the canonical length name.
 */
#define _GNU_SOURCE
#include <dlfcn.h>
#include <link.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>

static uintptr_t image;
static unsigned char *arena;
static size_t used;
static int active, markers;
typedef struct {
    uint64_t query_all, query_length, miss_all, miss_length;
    uint64_t nofb_all, nofb_length, generic_all, generic_length;
    uint64_t nofb_runtime_all, nofb_runtime_length, bad_frame;
} Stats;
static Stats stats;
static const uintptr_t starts[3] = {0x1d63140,0x1d818c0,0x1d9dfc0};
static const uintptr_t sizes[3] = {0x1078,0x1088,0x1074};
static const uint32_t LENGTH_NAME = 0xe39;

static int named_caller(uintptr_t pc)
{
    for (int i=0;i<3;i++) if (pc>=image+starts[i] && pc<image+starts[i]+sizes[i]) return 1;
    return 0;
}

__attribute__((noinline)) static void query(uintptr_t bytecode, uintptr_t offset, uintptr_t roots, unsigned width)
{
    if (!active) return;
    uint32_t index;
    const void *operand=(void *)(bytecode+offset+1+width);
    if (width==1) index=*(const uint8_t *)operand;
    else if (width==2) index=*(const uint16_t *)operand;
    else index=*(const uint32_t *)operand;
    uintptr_t pool=(uintptr_t)*(uint32_t *)(bytecode+0x17) | *(uintptr_t *)(roots+0x298);
    uint32_t key=*(uint32_t *)(pool+7+4*(uintptr_t)index);
    stats.query_all++;
    if (key==LENGTH_NAME) stats.query_length++;
}

__attribute__((noinline)) static void nofeedback(uintptr_t caller, uint32_t key)
{
    if (!active || !named_caller(caller)) return;
    stats.nofb_all++;
    if (key==LENGTH_NAME) stats.nofb_length++;
}

typedef uintptr_t (*RuntimeFn)(int, uintptr_t *, void *);
static RuntimeFn original_miss, original_generic, original_nofb;

#define WRAPPER(name, original, all, length) \
__attribute__((noinline)) static uintptr_t name(int n, uintptr_t *args, void *isolate) \
{ \
    if (active) { \
        uintptr_t frame=(uintptr_t)__builtin_frame_address(0); \
        uintptr_t parent=(uintptr_t)__builtin_frame_address(1); \
        if (parent<=frame || parent-frame>1048576) stats.bad_frame++; \
        else if (named_caller(((uintptr_t *)parent)[1])) { \
            stats.all++; \
            if (n>=2 && (uint32_t)args[-1]==LENGTH_NAME) stats.length++; \
        } \
    } \
    return original(n,args,isolate); \
}
WRAPPER(runtime_miss,original_miss,miss_all,miss_length)
WRAPPER(runtime_generic,original_generic,generic_all,generic_length)
WRAPPER(runtime_nofb,original_nofb,nofb_runtime_all,nofb_runtime_length)

static void marker(void)
{
    if (++markers==1) { memset(&stats,0,sizeof(stats)); active=1; return; }
    if (markers!=2) abort();
    active=0;
    fprintf(stderr,"V8_OCTANE_COUNTS:{\"queries_all\":%llu,\"length_queries\":%llu,"
        "\"misses_all\":%llu,\"length_misses\":%llu,\"no_feedback_all\":%llu,\"length_no_feedback\":%llu,"
        "\"generic_runtime_all\":%llu,\"length_generic_runtime\":%llu,"
        "\"no_feedback_runtime_all\":%llu,\"length_no_feedback_runtime\":%llu,\"bad_frame\":%llu}\n",
        (unsigned long long)stats.query_all,(unsigned long long)stats.query_length,
        (unsigned long long)stats.miss_all,(unsigned long long)stats.miss_length,
        (unsigned long long)stats.nofb_all,(unsigned long long)stats.nofb_length,
        (unsigned long long)stats.generic_all,(unsigned long long)stats.generic_length,
        (unsigned long long)stats.nofb_runtime_all,(unsigned long long)stats.nofb_runtime_length,
        (unsigned long long)stats.bad_frame);
}

static unsigned char *allocate(size_t n)
{
    if (used+n>65536) abort();
    unsigned char *p=arena+used; used=(used+n+15)&~15; return p;
}
static void put64(unsigned char **p, uintptr_t n) { memcpy(*p,&n,8); *p+=8; }
static void bytes(unsigned char **p, const unsigned char *s, size_t n) { memcpy(*p,s,n);*p+=n; }
static void absolute_jump(unsigned char **p,uintptr_t target)
{
    static const unsigned char code[]={0xff,0x25,0,0,0,0};
    bytes(p,code,sizeof(code));put64(p,target);
}
static void relative_jump(unsigned char *from,uintptr_t target, unsigned char opcode)
{
    int64_t delta=(int64_t)target-(int64_t)(from+5);
    if (delta<INT32_MIN || delta>INT32_MAX) abort();
    int32_t d=(int32_t)delta;from[0]=opcode;memcpy(from+1,&d,4);
}
static void writable(uintptr_t address,size_t n,int prot)
{
    uintptr_t lo=address&~(uintptr_t)4095, hi=(address+n+4095)&~(uintptr_t)4095;
    if (mprotect((void *)lo,hi-lo,prot)) { perror("mprotect");abort(); }
}
static void patch(uintptr_t address,uintptr_t target,size_t stolen)
{
    writable(address,stolen,PROT_READ|PROT_WRITE|PROT_EXEC);
    relative_jump((unsigned char *)address,target,0xe9);
    memset((void *)(address+5),0x90,stolen-5);
    __builtin___clear_cache((char *)address,(char *)(address+stolen));
    writable(address,stolen,PROT_READ|PROT_EXEC);
}
static void verify(uintptr_t address,const unsigned char *expected,size_t n)
{
    if (memcmp((void *)address,expected,n)) { fprintf(stderr,"V8_COUNTER_PROLOGUE_MISMATCH:%lx\n",(unsigned long)(address-image));abort(); }
}

static void hook_query(uintptr_t off,unsigned width,size_t stolen,const unsigned char *expected)
{
    uintptr_t target=image+off; verify(target,expected,stolen);
    unsigned char *start=allocate(256),*p=start;
    /* Save flags and every SysV caller-saved integer register; callbacks are
       built with -mgeneral-regs-only and cannot clobber SIMD registers. */
    const unsigned char save[]={0x9c,0x50,0x51,0x52,0x56,0x57,0x41,0x50,0x41,0x51,0x41,0x52,0x41,0x53,
        0x49,0x89,0xe3,0x48,0x83,0xe4,0xf0,0x48,0x83,0xec,0x10,0x4c,0x89,0x1c,0x24};
    const unsigned char restore[]={0x48,0x8b,0x24,0x24,0x41,0x5b,0x41,0x5a,0x41,0x59,0x41,0x58,
        0x5f,0x5e,0x5a,0x59,0x58,0x9d};
    bytes(&p,save,sizeof(save));
    if (width) {
        const unsigned char args[]={0x4c,0x89,0xe7,0x4c,0x89,0xce,0x4c,0x89,0xea,0xb9};
        bytes(&p,args,sizeof(args));uint32_t w=width;memcpy(p,&w,4);p+=4;
    } else {
        const unsigned char args[]={0x49,0x8b,0x7b,0x50,0x89,0xce};
        bytes(&p,args,sizeof(args));
    }
    *p++=0x48;*p++=0xb8;put64(&p,width?(uintptr_t)query:(uintptr_t)nofeedback);
    *p++=0xff;*p++=0xd0;
    bytes(&p,restore,sizeof(restore));bytes(&p,(unsigned char *)target,stolen);
    absolute_jump(&p,target+stolen);patch(target,(uintptr_t)start,stolen);
}

static RuntimeFn hook_runtime(uintptr_t off,RuntimeFn replacement,const unsigned char *expected)
{
    uintptr_t target=image+off;verify(target,expected,20);
    unsigned char *copy=allocate(64),*p=copy;
    bytes(&p,(unsigned char *)target,20);absolute_jump(&p,target+20);
    unsigned char *jump=allocate(32);p=jump;absolute_jump(&p,(uintptr_t)replacement);
    patch(target,(uintptr_t)jump,20);return (RuntimeFn)copy;
}

static int find_image(struct dl_phdr_info *info,size_t size,void *data)
{
    if (!info->dlpi_name || !info->dlpi_name[0]) { image=info->dlpi_addr;return 1; }return 0;
}

__attribute__((constructor)) static void initialize(void)
{
    dl_iterate_phdr(find_image,NULL);if(!image)abort();
    for (uintptr_t d=0x200000;d<0x40000000;d+=0x100000) {
        void *p=mmap((void *)(image-d),65536,PROT_READ|PROT_WRITE|PROT_EXEC,
            MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
        if (p!=MAP_FAILED) { arena=p;break; }
    }
    if(!arena)abort();
    const unsigned char narrow[]={0x4c,0x8b,0xc5,0x4f,0x0f,0xbe,0x5c,0x0c,0x01};
    const unsigned char wide[]={0x4c,0x8b,0xc5,0x4f,0x0f,0xbf,0x5c,0x0c,0x01};
    const unsigned char extra[]={0x4c,0x8b,0xc5,0x4f,0x63,0x5c,0x0c,0x01};
    const unsigned char nf[]={0x44,0x8b,0xc2,0xf6,0xc2,0x01};
    hook_query(starts[0],1,sizeof(narrow),narrow);
    hook_query(starts[1],2,sizeof(wide),wide);
    hook_query(starts[2],4,sizeof(extra),extra);
    hook_query(0x1ba14c0,0,sizeof(nf),nf);
    const unsigned char miss[]={0x55,0x48,0x89,0xe5,0x41,0x57,0x41,0x56,0x41,0x55,0x41,0x54,0x53,0x48,0x81,0xec,0x28,0x01,0,0};
    const unsigned char generic[]={0x55,0x48,0x89,0xe5,0x41,0x57,0x41,0x56,0x41,0x55,0x41,0x54,0x53,0x48,0x81,0xec,0xa8,0,0,0};
    const unsigned char nofb[]={0x55,0x48,0x89,0xe5,0x41,0x57,0x41,0x56,0x41,0x55,0x41,0x54,0x53,0x48,0x81,0xec,0x18,0x01,0,0};
    original_miss=hook_runtime(0x8f3080,runtime_miss,miss);
    original_generic=hook_runtime(0xc02530,runtime_generic,generic);
    original_nofb=hook_runtime(0x8f3bf0,runtime_nofb,nofb);
    uintptr_t call=image+0xc20f52; const unsigned char expected[]={0xe8,0xa1,0x37,0x1b,0x01};
    verify(call,expected,5);
    unsigned char *jump=allocate(32),*p=jump;absolute_jump(&p,(uintptr_t)marker);
    writable(call,5,PROT_READ|PROT_WRITE|PROT_EXEC);relative_jump((unsigned char *)call,(uintptr_t)jump,0xe8);
    writable(call,5,PROT_READ|PROT_EXEC);
    if(mprotect(arena,65536,PROT_READ|PROT_EXEC))abort();
}
