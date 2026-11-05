.section .text
.balign 1
.type mr_unexecuted_padding,@object
mr_unexecuted_padding:
.fill 16,1,0x90
.size mr_unexecuted_padding,.-mr_unexecuted_padding
.section .note.GNU-stack,"",@progbits
