
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002a170 <JS_CallInternal+0x7ed0>:
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:19250
   2a170:	48 8b bd c8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x138]
   2a177:	41 b9 01 00 00 00    	mov    r9d,0x1
   2a17d:	52                   	push   rdx
   2a17e:	48 89 c2             	mov    rdx,rax
   2a181:	e8 fa 28 00 00       	call   2ca80 <JS_CallFree>
   2a186:	49 89 c7             	mov    r15,rax
   2a189:	49 89 d6             	mov    r14,rdx
   2a18c:	58                   	pop    rax
   2a18d:	5a                   	pop    rdx
   2a18e:	e9 2f f4 ff ff       	jmp    295c2 <JS_CallInternal+0x7322>
JS_GetPropertyInternalWithIC():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:8497
   2a193:	48 8d 85 d0 fe ff ff 	lea    rax,[rbp-0x130]
   2a19a:	8b 8d 20 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1e0]
   2a1a0:	4c 89 f6             	mov    rsi,r14
   2a1a3:	4c 89 95 30 fe ff ff 	mov    QWORD PTR [rbp-0x1d0],r10
   2a1aa:	50                   	push   rax
   2a1ab:	4c 8b 85 00 fe ff ff 	mov    r8,QWORD PTR [rbp-0x200]
   2a1b2:	4c 89 fa             	mov    rdx,r15
   2a1b5:	4c 8b 8d 08 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1f8]
   2a1bc:	48 8b bd c8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x138]
   2a1c3:	6a 00                	push   0x0
   2a1c5:	e8 26 29 00 00       	call   2caf0 <JS_GetPropertyInternalIC>
   2a1ca:	4c 8b 95 30 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1d0]
   2a1d1:	49 89 c7             	mov    r15,rax
   2a1d4:	49 89 d6             	mov    r14,rdx
   2a1d7:	58                   	pop    rax
   2a1d8:	5a                   	pop    rdx
   2a1d9:	e9 92 ca ff ff       	jmp    26c70 <JS_CallInternal+0x49d0>
   2a1de:	48 8d 85 e0 fe ff ff 	lea    rax,[rbp-0x120]
   2a1e5:	4c 89 95 30 fe ff ff 	mov    QWORD PTR [rbp-0x1d0],r10
   2a1ec:	4c 89 f6             	mov    rsi,r14
   2a1ef:	4c 8b 8d 08 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1f8]
   2a1f6:	50                   	push   rax
   2a1f7:	8b 8d 20 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1e0]
   2a1fd:	4c 89 fa             	mov    rdx,r15
   2a200:	4c 8b 85 00 fe ff ff 	mov    r8,QWORD PTR [rbp-0x200]
   2a207:	48 8b bd c8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x138]
   2a20e:	6a 00                	push   0x0
   2a210:	e8 db 28 00 00       	call   2caf0 <JS_GetPropertyInternalIC>
   2a215:	41 59                	pop    r9
   2a217:	41 5a                	pop    r10
   2a219:	48 89 c1             	mov    rcx,rax
   2a21c:	4c 8b 95 30 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1d0]
   2a223:	48 89 d0             	mov    rax,rdx
   2a226:	e9 53 c9 ff ff       	jmp    26b7e <JS_CallInternal+0x48de>
JS_CallInternal():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:18396
   2a22b:	4d 89 dc             	mov    r12,r11
   2a22e:	e9 fd 87 ff ff       	jmp    22a30 <JS_CallInternal+0x790>
   2a233:	48 8b 8d c8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x138]
   2a23a:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
__JS_FreeAtom():
/home/mzyx/legacy_ng_ic_read_hit_attempt01/D/quickjs.c:3501
   2a23e:	48                   	rex.W
   2a23f:	8b                   	.byte 0x8b
