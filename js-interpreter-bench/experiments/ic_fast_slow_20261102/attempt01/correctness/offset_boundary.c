/* Standalone diagnostic translation unit, NOT the timed ELF. */
#include "quickjs.c"
#include <stdio.h>
int main(void) {
    uint32_t limit=UINT32_MAX/sizeof(JSProperty);
    assert(sizeof(JSProperty)==16);
    assert(rdi_byte_offset(0)==0);
    assert(rdi_byte_offset(1)==sizeof(JSProperty));
    assert(rdi_byte_offset(limit)==limit*sizeof(JSProperty));
    assert(rdi_byte_offset(limit)!=UINT32_MAX);
    assert(rdi_byte_offset(limit+1)==UINT32_MAX);
    assert(rdi_byte_offset(UINT32_MAX)==UINT32_MAX);
    printf("OFFSET_BOUNDARY_PASS checks=6 property_size=%zu limit=%u\n",sizeof(JSProperty),limit);
    return 0;
}
