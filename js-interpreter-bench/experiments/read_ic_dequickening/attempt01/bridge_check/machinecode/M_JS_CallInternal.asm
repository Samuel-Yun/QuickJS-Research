
/home/mzyx/read_ic_dequickening_attempt01/M/qjs:     file format elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .plt.got:

Disassembly of section .plt.sec:

Disassembly of section .text:

0000000000022ac0 <JS_CallInternal>:
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17770
   22ac0:	55                   	push   rbp
   22ac1:	48 89 e5             	mov    rbp,rsp
   22ac4:	41 57                	push   r15
   22ac6:	41 56                	push   r14
   22ac8:	41 55                	push   r13
   22aca:	41 54                	push   r12
   22acc:	53                   	push   rbx
   22acd:	48 81 ec 48 02 00 00 	sub    rsp,0x248
   22ad4:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   22ad8:	48 89 bd a0 fe ff ff 	mov    QWORD PTR [rbp-0x160],rdi
   22adf:	48 89 b5 e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rsi
   22ae6:	48 89 85 70 fe ff ff 	mov    QWORD PTR [rbp-0x190],rax
   22aed:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   22af1:	48 89 95 d0 fe ff ff 	mov    QWORD PTR [rbp-0x130],rdx
   22af8:	48 89 85 80 fe ff ff 	mov    QWORD PTR [rbp-0x180],rax
   22aff:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   22b03:	48 89 8d 78 fe ff ff 	mov    QWORD PTR [rbp-0x188],rcx
   22b0a:	4c 89 85 88 fe ff ff 	mov    QWORD PTR [rbp-0x178],r8
   22b11:	44 89 8d bc fe ff ff 	mov    DWORD PTR [rbp-0x144],r9d
   22b18:	48 89 85 a8 fe ff ff 	mov    QWORD PTR [rbp-0x158],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17771
   22b1f:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
   22b26:	00 00 
   22b28:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
   22b2c:	48 8b 47 10          	mov    rax,QWORD PTR [rdi+0x10]
   22b30:	48 89 85 c0 fe ff ff 	mov    QWORD PTR [rbp-0x140],rax
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7900
   22b37:	8b 87 a8 01 00 00    	mov    eax,DWORD PTR [rdi+0x1a8]
   22b3d:	89 85 e8 fe ff ff    	mov    DWORD PTR [rbp-0x118],eax
   22b43:	83 e8 01             	sub    eax,0x1
   22b46:	89 87 a8 01 00 00    	mov    DWORD PTR [rdi+0x1a8],eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7900 (discriminator 1)
   22b4c:	85 c0                	test   eax,eax
   22b4e:	0f 8e 54 05 00 00    	jle    230a8 <JS_CallInternal+0x5e8>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17810 (discriminator 1)
   22b54:	83 bd d0 fe ff ff ff 	cmp    DWORD PTR [rbp-0x130],0xffffffff
   22b5b:	0f 85 7f 05 00 00    	jne    230e0 <JS_CallInternal+0x620>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17837
   22b61:	48 8b 85 e0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x120]
   22b68:	0f b7 40 12          	movzx  eax,WORD PTR [rax+0x12]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17837 (discriminator 1)
   22b6c:	66 83 f8 0d          	cmp    ax,0xd
   22b70:	0f 85 99 07 00 00    	jne    2330f <JS_CallInternal+0x84f>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17847
   22b76:	48 8b 85 e0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x120]
   22b7d:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
   22b81:	48 89 85 d8 fe ff ff 	mov    QWORD PTR [rbp-0x128],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17849
   22b88:	0f b7 78 38          	movzx  edi,WORD PTR [rax+0x38]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17849 (discriminator 1)
   22b8c:	8b 85 bc fe ff ff    	mov    eax,DWORD PTR [rbp-0x144]
   22b92:	39 c7                	cmp    edi,eax
   22b94:	0f 8f fc 01 00 00    	jg     22d96 <JS_CallInternal+0x2d6>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17850
   22b9a:	8b 45 28             	mov    eax,DWORD PTR [rbp+0x28]
   22b9d:	83 e0 02             	and    eax,0x2
   22ba0:	0f 45 c7             	cmovne eax,edi
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17855
   22ba3:	48 8b 95 d8 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x128]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17858 (discriminator 1)
   22baa:	4c 8b bd c0 fe ff ff 	mov    r15,QWORD PTR [rbp-0x140]
js_check_stack_overflow():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2071 (discriminator 1)
   22bb1:	49 89 e8             	mov    r8,rbp
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17855
   22bb4:	44 0f b7 52 3a       	movzx  r10d,WORD PTR [rdx+0x3a]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17856
   22bb9:	0f b7 72 3e          	movzx  esi,WORD PTR [rdx+0x3e]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17857
   22bbd:	0f b7 52 40          	movzx  edx,WORD PTR [rdx+0x40]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17856
   22bc1:	89 f1                	mov    ecx,esi
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17855
   22bc3:	44 01 d6             	add    esi,r10d
   22bc6:	4c 89 d3             	mov    rbx,r10
   22bc9:	01 c6                	add    esi,eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17857
   22bcb:	49 89 d1             	mov    r9,rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17855
   22bce:	48 63 f6             	movsxd rsi,esi
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17856
   22bd1:	48 8d 34 72          	lea    rsi,[rdx+rsi*2]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17855
   22bd5:	48 c1 e6 03          	shl    rsi,0x3
js_check_stack_overflow():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2071 (discriminator 1)
   22bd9:	49 29 f0             	sub    r8,rsi
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17858 (discriminator 1)
   22bdc:	4d 3b 87 d0 04 00 00 	cmp    r8,QWORD PTR [r15+0x4d0]
   22be3:	0f 82 d0 07 00 00    	jb     233b9 <JS_CallInternal+0x8f9>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17861
   22be9:	4c 8b bd d8 fe ff ff 	mov    r15,QWORD PTR [rbp-0x128]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17864
   22bf0:	4c 8b 9d e0 fe ff ff 	mov    r11,QWORD PTR [rbp-0x120]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17867
   22bf7:	48 83 c6 17          	add    rsi,0x17
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17861
   22bfb:	45 0f b6 47 10       	movzx  r8d,BYTE PTR [r15+0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17863
   22c00:	44 8b bd bc fe ff ff 	mov    r15d,DWORD PTR [rbp-0x144]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17864
   22c07:	4c 89 9d 08 ff ff ff 	mov    QWORD PTR [rbp-0xf8],r11
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17865
   22c0e:	4d 8b 5b 30          	mov    r11,QWORD PTR [r11+0x30]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17861
   22c12:	44 89 85 3c ff ff ff 	mov    DWORD PTR [rbp-0xc4],r8d
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17867
   22c19:	49 89 f0             	mov    r8,rsi
   22c1c:	48 81 e6 00 f0 ff ff 	and    rsi,0xfffffffffffff000
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17863
   22c23:	44 89 bd 38 ff ff ff 	mov    DWORD PTR [rbp-0xc8],r15d
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17864
   22c2a:	4c 8b bd d0 fe ff ff 	mov    r15,QWORD PTR [rbp-0x130]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17867
   22c31:	49 83 e0 f0          	and    r8,0xfffffffffffffff0
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17865
   22c35:	4c 89 9d 98 fe ff ff 	mov    QWORD PTR [rbp-0x168],r11
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17867
   22c3c:	49 89 e3             	mov    r11,rsp
   22c3f:	49 29 f3             	sub    r11,rsi
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17864
   22c42:	4c 89 bd 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],r15
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17867
   22c49:	4c 39 dc             	cmp    rsp,r11
   22c4c:	74 15                	je     22c63 <JS_CallInternal+0x1a3>
   22c4e:	48 81 ec 00 10 00 00 	sub    rsp,0x1000
   22c55:	48 83 8c 24 f8 0f 00 	or     QWORD PTR [rsp+0xff8],0x0
   22c5c:	00 00 
   22c5e:	4c 39 dc             	cmp    rsp,r11
   22c61:	75 eb                	jne    22c4e <JS_CallInternal+0x18e>
   22c63:	41 81 e0 ff 0f 00 00 	and    r8d,0xfff
   22c6a:	4c 29 c4             	sub    rsp,r8
   22c6d:	4d 85 c0             	test   r8,r8
   22c70:	74 06                	je     22c78 <JS_CallInternal+0x1b8>
   22c72:	4a 83 4c 04 f8 00    	or     QWORD PTR [rsp+r8*1-0x8],0x0
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17862
   22c78:	48 8b b5 a8 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x158]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17867
   22c7f:	4c 8d 5c 24 0f       	lea    r11,[rsp+0xf]
   22c84:	49 83 e3 f0          	and    r11,0xfffffffffffffff0
   22c88:	4c 89 9d 30 fe ff ff 	mov    QWORD PTR [rbp-0x1d0],r11
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17862
   22c8f:	48 89 b5 90 fe ff ff 	mov    QWORD PTR [rbp-0x170],rsi
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17868 (discriminator 1)
   22c96:	85 c0                	test   eax,eax
   22c98:	0f 85 5e 61 00 00    	jne    28dfc <JS_CallInternal+0x633c>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17877
   22c9e:	48 98                	cdqe
   22ca0:	48 c1 e0 04          	shl    rax,0x4
   22ca4:	4c 01 d8             	add    rax,r11
   22ca7:	48 89 85 b0 fe ff ff 	mov    QWORD PTR [rbp-0x150],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17878
   22cae:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17879
   22cb5:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
   22cbc:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17881 (discriminator 1)
   22cc3:	45 85 d2             	test   r10d,r10d
   22cc6:	74 30                	je     22cf8 <JS_CallInternal+0x238>
   22cc8:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
   22ccf:	48 89 de             	mov    rsi,rbx
   22cd2:	48 c1 e6 04          	shl    rsi,0x4
   22cd6:	48 89 f8             	mov    rax,rdi
   22cd9:	48 01 fe             	add    rsi,rdi
   22cdc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17882
   22ce0:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17881 (discriminator 1)
   22ce7:	48 83 c0 10          	add    rax,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17882
   22ceb:	48 c7 40 f8 03 00 00 	mov    QWORD PTR [rax-0x8],0x3
   22cf2:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17881 (discriminator 1)
   22cf3:	48 39 f0             	cmp    rax,rsi
   22cf6:	75 e8                	jne    22ce0 <JS_CallInternal+0x220>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17885
   22cf8:	0f b7 f9             	movzx  edi,cx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17884
   22cfb:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   22d02:	48 c1 e3 04          	shl    rbx,0x4
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17885
   22d06:	48 89 f9             	mov    rcx,rdi
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17884
   22d09:	48 01 c3             	add    rbx,rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17885
   22d0c:	48 c1 e1 04          	shl    rcx,0x4
   22d10:	48 8d 3c 0b          	lea    rdi,[rbx+rcx*1]
   22d14:	48 89 bd 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rdi
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17886 (discriminator 1)
   22d1b:	66 45 85 c9          	test   r9w,r9w
   22d1f:	74 0b                	je     22d2c <JS_CallInternal+0x26c>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17887
   22d21:	48 c1 e2 03          	shl    rdx,0x3
   22d25:	31 f6                	xor    esi,esi
   22d27:	e8 84 ed fe ff       	call   11ab0 <memset@plt>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17889
   22d2c:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17890
   22d33:	48 8b bd c0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x140]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17884
   22d3a:	48 89 9d 68 fe ff ff 	mov    QWORD PTR [rbp-0x198],rbx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17889
   22d41:	48 8b 41 18          	mov    rax,QWORD PTR [rcx+0x18]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17892
   22d45:	48 8b 49 48          	mov    rcx,QWORD PTR [rcx+0x48]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17890
   22d49:	48 8b 97 f0 04 00 00 	mov    rdx,QWORD PTR [rdi+0x4f0]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17892
   22d50:	48 89 8d e8 fe ff ff 	mov    QWORD PTR [rbp-0x118],rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17836
   22d57:	48 8b 8d e0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x120]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17890
   22d5e:	48 89 95 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17891
   22d65:	48 8d 95 00 ff ff ff 	lea    rdx,[rbp-0x100]
   22d6c:	48 89 97 f0 04 00 00 	mov    QWORD PTR [rdi+0x4f0],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17836
   22d73:	48 89 8d 60 fe ff ff 	mov    QWORD PTR [rbp-0x1a0],rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17775
   22d7a:	48 89 95 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17899
   22d81:	4c 8d 60 01          	lea    r12,[rax+0x1]
   22d85:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   22d88:	4c 8d 3d f1 cf 0d 00 	lea    r15,[rip+0xdcff1]        # ffd80 <dispatch_table.85>
   22d8f:	49 89 c5             	mov    r13,rax
   22d92:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17850
   22d96:	89 f8                	mov    eax,edi
   22d98:	e9 06 fe ff ff       	jmp    22ba3 <JS_CallInternal+0xe3>
   22d9d:	f3 0f 1e fa          	endbr64
   22da1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   22da8:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17922
   22dac:	41 8d 85 4d ff ff ff 	lea    eax,[r13-0xb3]
   22db3:	48 c7 43 08 00 00 00 	mov    QWORD PTR [rbx+0x8],0x0
   22dba:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17923
   22dbb:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17922
   22dbf:	48 83 c3 10          	add    rbx,0x10
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:562
   22dc3:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17923
   22dc7:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   22dcd:	49 89 c5             	mov    r13,rax
   22dd0:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   22dd4:	ff e0                	jmp    rax
   22dd6:	f3 0f 1e fa          	endbr64
   22dda:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   22de0:	f3 0f 1e fa          	endbr64
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:181
   22de4:	41 8b 44 24 04       	mov    eax,DWORD PTR [r12+0x4]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20529
   22de9:	f3 0f 6f 53 f0       	movdqu xmm2,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20526
   22dee:	4d 8d 74 24 09       	lea    r14,[r12+0x9]
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:181
   22df3:	41 8b 0c 24          	mov    ecx,DWORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20530
   22df7:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:181
   22dfe:	89 85 28 fe ff ff    	mov    DWORD PTR [rbp-0x1d8],eax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20525
   22e04:	41 0f b6 44 24 08    	movzx  eax,BYTE PTR [r12+0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20529
   22e0a:	0f 29 95 50 fe ff ff 	movaps XMMWORD PTR [rbp-0x1b0],xmm2
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20530
   22e11:	48 8b 95 58 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1a8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20525
   22e18:	88 85 40 fe ff ff    	mov    BYTE PTR [rbp-0x1c0],al
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20527
   22e1e:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:181
   22e25:	89 8d 38 fe ff ff    	mov    DWORD PTR [rbp-0x1c8],ecx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20530
   22e2b:	49 89 d4             	mov    r12,rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20527
   22e2e:	4c 89 70 30          	mov    QWORD PTR [rax+0x30],r14
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20530
   22e32:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   22e39:	48 89 c6             	mov    rsi,rax
   22e3c:	48 89 85 10 fe ff ff 	mov    QWORD PTR [rbp-0x1f0],rax
   22e43:	e8 48 b3 04 00       	call   6e190 <JS_HasProperty>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20531 (discriminator 1)
   22e48:	85 c0                	test   eax,eax
   22e4a:	0f 88 76 07 00 00    	js     235c6 <JS_CallInternal+0xb06>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20533
   22e50:	0f 84 b5 60 00 00    	je     28f0b <JS_CallInternal+0x644b>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20534
   22e56:	80 bd 40 fe ff ff 00 	cmp    BYTE PTR [rbp-0x1c0],0x0
   22e5d:	0f 85 d9 05 00 00    	jne    2343c <JS_CallInternal+0x97c>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20541
   22e63:	41 83 ed 71          	sub    r13d,0x71
   22e67:	41 83 fd 04          	cmp    r13d,0x4
   22e6b:	0f 87 20 05 00 00    	ja     23391 <JS_CallInternal+0x8d1>
   22e71:	48 8d 15 58 42 0b 00 	lea    rdx,[rip+0xb4258]        # d70d0 <qjsc_repl_size+0x444>
   22e78:	4a 63 04 aa          	movsxd rax,DWORD PTR [rdx+r13*4]
   22e7c:	48 01 d0             	add    rax,rdx
   22e7f:	3e ff e0             	notrack jmp rax
   22e82:	f3 0f 1e fa          	endbr64
   22e86:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18201
   22e8a:	4c 89 a5 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r12
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18200
   22e91:	45 8d 95 14 ff ff ff 	lea    r10d,[r13-0xec]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18210
   22e98:	4d 63 da             	movsxd r11,r10d
   22e9b:	49 89 de             	mov    r14,rbx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18211
   22e9e:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18212
   22ea5:	45 89 d1             	mov    r9d,r10d
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18210
   22ea8:	49 c1 e3 04          	shl    r11,0x4
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18211
   22eac:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18212
   22eb3:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   22eba:	41 b8 03 00 00 00    	mov    r8d,0x3
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18210
   22ec0:	4d 29 de             	sub    r14,r11
   22ec3:	4c 89 9d 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r11
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18212
   22eca:	49 8b 76 f0          	mov    rsi,QWORD PTR [r14-0x10]
   22ece:	49 8b 56 f8          	mov    rdx,QWORD PTR [r14-0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18211
   22ed2:	48 89 48 30          	mov    QWORD PTR [rax+0x30],rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18212
   22ed6:	31 c9                	xor    ecx,ecx
   22ed8:	6a 00                	push   0x0
   22eda:	4d 8d 66 f0          	lea    r12,[r14-0x10]
   22ede:	41 56                	push   r14
   22ee0:	6a 03                	push   0x3
   22ee2:	6a 00                	push   0x0
   22ee4:	44 89 95 40 fe ff ff 	mov    DWORD PTR [rbp-0x1c0],r10d
   22eeb:	e8 d0 fb ff ff       	call   22ac0 <JS_CallInternal>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18214 (discriminator 2)
   22ef0:	48 83 c4 20          	add    rsp,0x20
   22ef4:	44 8b 95 40 fe ff ff 	mov    r10d,DWORD PTR [rbp-0x1c0]
   22efb:	4c 8b 9d 38 fe ff ff 	mov    r11,QWORD PTR [rbp-0x1c8]
   22f02:	83 fa 06             	cmp    edx,0x6
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18212
   22f05:	49 89 c1             	mov    r9,rax
   22f08:	49 89 d0             	mov    r8,rdx
   22f0b:	48 89 d1             	mov    rcx,rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18214 (discriminator 2)
   22f0e:	0f 84 f8 64 00 00    	je     2940c <JS_CallInternal+0x694c>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18216
   22f14:	41 83 fd 23          	cmp    r13d,0x23
   22f18:	0f 84 95 02 00 00    	je     231b3 <JS_CallInternal+0x6f3>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18218 (discriminator 1)
   22f1e:	4d 01 de             	add    r14,r11
   22f21:	45 85 d2             	test   r10d,r10d
   22f24:	78 77                	js     22f9d <JS_CallInternal+0x4dd>
   22f26:	4d 89 e5             	mov    r13,r12
   22f29:	4d 89 f0             	mov    r8,r14
   22f2c:	48 89 95 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rdx
   22f33:	45 89 d4             	mov    r12d,r10d
   22f36:	49 89 c6             	mov    r14,rax
   22f39:	eb 0e                	jmp    22f49 <JS_CallInternal+0x489>
   22f3b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   22f40:	49 83 c5 10          	add    r13,0x10
   22f44:	4d 39 c5             	cmp    r13,r8
   22f47:	74 47                	je     22f90 <JS_CallInternal+0x4d0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18219
   22f49:	49 8b 4d 08          	mov    rcx,QWORD PTR [r13+0x8]
   22f4d:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   22f51:	83 f9 f6             	cmp    ecx,0xfffffff6
   22f54:	76 ea                	jbe    22f40 <JS_CallInternal+0x480>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   22f56:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   22f59:	8d 50 ff             	lea    edx,[rax-0x1]
   22f5c:	89 56 fc             	mov    DWORD PTR [rsi-0x4],edx
   22f5f:	85 d2                	test   edx,edx
   22f61:	7f dd                	jg     22f40 <JS_CallInternal+0x480>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   22f63:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   22f6a:	48 89 ca             	mov    rdx,rcx
   22f6d:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18218 (discriminator 1)
   22f74:	49 83 c5 10          	add    r13,0x10
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   22f78:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   22f7c:	e8 1f 99 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   22f81:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18218 (discriminator 1)
   22f88:	4d 39 c5             	cmp    r13,r8
   22f8b:	75 bc                	jne    22f49 <JS_CallInternal+0x489>
   22f8d:	0f 1f 00             	nop    DWORD PTR [rax]
   22f90:	4c 8b 85 38 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c8]
   22f97:	45 89 e2             	mov    r10d,r12d
   22f9a:	4d 89 f1             	mov    r9,r14
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18220
   22f9d:	41 8d 42 01          	lea    eax,[r10+0x1]
   22fa1:	48 98                	cdqe
   22fa3:	48 c1 e0 04          	shl    rax,0x4
   22fa7:	48 89 c2             	mov    rdx,rax
   22faa:	48 89 d8             	mov    rax,rbx
   22fad:	48 29 d0             	sub    rax,rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18221
   22fb0:	4c 89 08             	mov    QWORD PTR [rax],r9
   22fb3:	48 8d 58 10          	lea    rbx,[rax+0x10]
   22fb7:	4c 89 40 08          	mov    QWORD PTR [rax+0x8],r8
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18223
   22fbb:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   22fc2:	4c 8d 60 01          	lea    r12,[rax+0x1]
   22fc6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   22fc9:	49 89 c5             	mov    r13,rax
   22fcc:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   22fd0:	f3 0f 1e fa          	endbr64
   22fd4:	f3 0f 1e fa          	endbr64
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:181
   22fd8:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
JS_NewObjectProto():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:5847
   22fdc:	31 f6                	xor    esi,esi
   22fde:	b9 01 00 00 00       	mov    ecx,0x1
   22fe3:	ba 02 00 00 00       	mov    edx,0x2
   22fe8:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:196
   22fef:	45 0f b7 74 24 04    	movzx  r14d,WORD PTR [r12+0x4]
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:181
   22ff5:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18808
   22ffb:	49 8d 44 24 06       	lea    rax,[r12+0x6]
   23000:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18809
   23007:	48 8d 43 10          	lea    rax,[rbx+0x10]
   2300b:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
JS_NewObjectProto():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:5847
   23012:	e8 59 39 02 00       	call   46970 <JS_NewObjectProtoClass>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18809
   23017:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18810 (discriminator 2)
   2301b:	83 7b 08 06          	cmp    DWORD PTR [rbx+0x8],0x6
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18809
   2301f:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18810 (discriminator 2)
   23022:	0f 84 23 02 00 00    	je     2324b <JS_CallInternal+0x78b>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18812
   23028:	41 83 fd 78          	cmp    r13d,0x78
   2302c:	0f 85 ed 01 00 00    	jne    2321f <JS_CallInternal+0x75f>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18813
   23032:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   23039:	4e 8b 2c f0          	mov    r13,QWORD PTR [rax+r14*8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18814 (discriminator 1)
   2303d:	41 83 45 fc 01       	add    DWORD PTR [r13-0x4],0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18820
   23042:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
   23045:	8b 95 50 fe ff ff    	mov    edx,DWORD PTR [rbp-0x1b0]
   2304b:	b9 22 00 00 00       	mov    ecx,0x22
   23050:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23057:	e8 c4 30 02 00       	call   46120 <add_property>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18822
   2305c:	48 85 c0             	test   rax,rax
   2305f:	0f 84 51 8f 00 00    	je     2bfb6 <JS_CallInternal+0x94f6>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18826
   23065:	4c 89 28             	mov    QWORD PTR [rax],r13
JS_AtomToValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3633
   23068:	8b b5 50 fe ff ff    	mov    esi,DWORD PTR [rbp-0x1b0]
   2306e:	31 d2                	xor    edx,edx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18827
   23070:	48 83 c3 20          	add    rbx,0x20
JS_AtomToValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3633
   23074:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18829
   2307b:	49 83 c4 07          	add    r12,0x7
JS_AtomToValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3633
   2307f:	e8 6c 0f 01 00       	call   33ff0 <__JS_AtomToValue>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18827
   23084:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   2308b:	48 89 01             	mov    QWORD PTR [rcx],rax
   2308e:	48 89 51 08          	mov    QWORD PTR [rcx+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18829
   23092:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   23098:	49 89 c5             	mov    r13,rax
   2309b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2309f:	ff e0                	jmp    rax
   230a1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7901
   230a8:	e8 d3 00 01 00       	call   33180 <__js_poll_interrupts>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17808 (discriminator 1)
   230ad:	85 c0                	test   eax,eax
   230af:	0f 84 9f fa ff ff    	je     22b54 <JS_CallInternal+0x94>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17809
   230b5:	31 c0                	xor    eax,eax
   230b7:	ba 06 00 00 00       	mov    edx,0x6
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20734
   230bc:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
   230c0:	64 48 2b 0c 25 28 00 	sub    rcx,QWORD PTR fs:0x28
   230c7:	00 00 
   230c9:	0f 85 19 9c 00 00    	jne    2cce8 <JS_CallInternal+0xa228>
   230cf:	48 8d 65 d8          	lea    rsp,[rbp-0x28]
   230d3:	5b                   	pop    rbx
   230d4:	41 5c                	pop    r12
   230d6:	41 5d                	pop    r13
   230d8:	41 5e                	pop    r14
   230da:	41 5f                	pop    r15
   230dc:	5d                   	pop    rbp
   230dd:	c3                   	ret
   230de:	66 90                	xchg   ax,ax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17811
   230e0:	f6 45 28 04          	test   BYTE PTR [rbp+0x28],0x4
   230e4:	0f 84 d6 03 00 00    	je     234c0 <JS_CallInternal+0xa00>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17815
   230ea:	48 8b 85 e0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x120]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17816
   230f1:	48 8b 48 58          	mov    rcx,QWORD PTR [rax+0x58]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17820
   230f5:	48 8b 50 68          	mov    rdx,QWORD PTR [rax+0x68]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17815
   230f9:	48 8d 78 50          	lea    rdi,[rax+0x50]
   230fd:	48 89 bd c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rdi
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17817
   23104:	48 8b 59 28          	mov    rbx,QWORD PTR [rcx+0x28]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17816
   23108:	48 89 8d 60 fe ff ff 	mov    QWORD PTR [rbp-0x1a0],rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17819
   2310f:	48 8b 49 30          	mov    rcx,QWORD PTR [rcx+0x30]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17820
   23113:	48 89 95 30 fe ff ff 	mov    QWORD PTR [rbp-0x1d0],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17818
   2311a:	48 8b 73 48          	mov    rsi,QWORD PTR [rbx+0x48]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17817
   2311e:	48 89 9d d8 fe ff ff 	mov    QWORD PTR [rbp-0x128],rbx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17819
   23125:	48 89 8d 98 fe ff ff 	mov    QWORD PTR [rbp-0x168],rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17821
   2312c:	48 89 c1             	mov    rcx,rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17818
   2312f:	48 89 b5 e8 fe ff ff 	mov    QWORD PTR [rbp-0x118],rsi
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17821
   23136:	48 8b 70 70          	mov    rsi,QWORD PTR [rax+0x70]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17822
   2313a:	0f b7 43 3a          	movzx  eax,WORD PTR [rbx+0x3a]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17825
   2313e:	4c 8b a1 80 00 00 00 	mov    r12,QWORD PTR [rcx+0x80]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17821
   23145:	48 89 b5 b0 fe ff ff 	mov    QWORD PTR [rbp-0x150],rsi
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17823
   2314c:	48 8b 99 90 00 00 00 	mov    rbx,QWORD PTR [rcx+0x90]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17824
   23153:	48 c7 81 90 00 00 00 	mov    QWORD PTR [rcx+0x90],0x0
   2315a:	00 00 00 00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17822
   2315e:	48 c1 e0 04          	shl    rax,0x4
   23162:	48 01 f0             	add    rax,rsi
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17826
   23165:	48 8b b5 c0 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x140]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17822
   2316c:	48 89 85 68 fe ff ff 	mov    QWORD PTR [rbp-0x198],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17826
   23173:	48 8b 86 f0 04 00 00 	mov    rax,QWORD PTR [rsi+0x4f0]
   2317a:	48 89 41 50          	mov    QWORD PTR [rcx+0x50],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17827
   2317e:	48 89 be f0 04 00 00 	mov    QWORD PTR [rsi+0x4f0],rdi
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17828
   23185:	8b 79 24             	mov    edi,DWORD PTR [rcx+0x24]
   23188:	85 ff                	test   edi,edi
   2318a:	0f 84 9d 02 00 00    	je     2342d <JS_CallInternal+0x96d>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17820
   23190:	48 8b 85 30 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1d0]
   23197:	48 89 85 90 fe ff ff 	mov    QWORD PTR [rbp-0x170],rax
   2319e:	e9 bd 00 00 00       	jmp    23260 <JS_CallInternal+0x7a0>
   231a3:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18288
   231a7:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
   231ab:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
   231af:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20723 (discriminator 1)
   231b3:	48 8b bd d8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x128]
   231ba:	66 83 7f 40 00       	cmp    WORD PTR [rdi+0x40],0x0
   231bf:	0f 85 81 6e 00 00    	jne    2a046 <JS_CallInternal+0x7586>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20728 (discriminator 1)
   231c5:	4c 8b a5 30 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1d0]
   231cc:	49 39 dc             	cmp    r12,rbx
   231cf:	0f 83 1a 01 00 00    	jae    232ef <JS_CallInternal+0x82f>
   231d5:	4c 8b ad e8 fe ff ff 	mov    r13,QWORD PTR [rbp-0x118]
   231dc:	49 89 ce             	mov    r14,rcx
   231df:	49 89 c7             	mov    r15,rax
   231e2:	eb 11                	jmp    231f5 <JS_CallInternal+0x735>
   231e4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20728 (discriminator 3)
   231e8:	49 83 c4 10          	add    r12,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20728 (discriminator 1)
   231ec:	49 39 dc             	cmp    r12,rbx
   231ef:	0f 83 b9 01 00 00    	jae    233ae <JS_CallInternal+0x8ee>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20729
   231f5:	4d 8b 44 24 08       	mov    r8,QWORD PTR [r12+0x8]
   231fa:	49 8b 34 24          	mov    rsi,QWORD PTR [r12]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   231fe:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   23202:	76 e4                	jbe    231e8 <JS_CallInternal+0x728>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   23204:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   23207:	8d 50 ff             	lea    edx,[rax-0x1]
   2320a:	89 56 fc             	mov    DWORD PTR [rsi-0x4],edx
   2320d:	85 d2                	test   edx,edx
   2320f:	7f d7                	jg     231e8 <JS_CallInternal+0x728>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   23211:	49 8b 7d 10          	mov    rdi,QWORD PTR [r13+0x10]
   23215:	4c 89 c2             	mov    rdx,r8
   23218:	e8 83 96 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2321d:	eb c9                	jmp    231e8 <JS_CallInternal+0x728>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18816
   2321f:	31 c9                	xor    ecx,ecx
   23221:	48 8b b5 c8 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x138]
   23228:	41 83 fd 77          	cmp    r13d,0x77
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18807 (discriminator 1)
   2322c:	41 0f b7 d6          	movzx  edx,r14w
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18816
   23230:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23237:	0f 94 c1             	sete   cl
   2323a:	e8 91 87 02 00       	call   4b9d0 <get_var_ref>
   2323f:	49 89 c5             	mov    r13,rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18817
   23242:	48 85 c0             	test   rax,rax
   23245:	0f 85 f7 fd ff ff    	jne    23042 <JS_CallInternal+0x582>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18809
   2324b:	48 8b 9d 40 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1c0]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18808
   23252:	4c 8b a5 38 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1c8]
   23259:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20686
   23260:	48 8b 8d c0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x140]
is_backtrace_needed():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7644
   23267:	83 b9 e0 04 00 00 ff 	cmp    DWORD PTR [rcx+0x4e0],0xffffffff
   2326e:	48 8b 81 d8 04 00 00 	mov    rax,QWORD PTR [rcx+0x4d8]
   23275:	75 39                	jne    232b0 <JS_CallInternal+0x7f0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7647
   23277:	66 83 78 12 03       	cmp    WORD PTR [rax+0x12],0x3
   2327c:	75 32                	jne    232b0 <JS_CallInternal+0x7f0>
find_own_property1():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6130
   2327e:	48 8b 48 18          	mov    rcx,QWORD PTR [rax+0x18]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6131
   23282:	8b 51 18             	mov    edx,DWORD PTR [rcx+0x18]
   23285:	89 d0                	mov    eax,edx
   23287:	83 e0 39             	and    eax,0x39
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6132
   2328a:	8b 44 81 38          	mov    eax,DWORD PTR [rcx+rax*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6134
   2328e:	48 85 c0             	test   rax,rax
   23291:	0f 84 2c 68 00 00    	je     29ac3 <JS_CallInternal+0x7003>
   23297:	48 8d 14 95 34 00 00 	lea    rdx,[rdx*4+0x34]
   2329e:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6135
   2329f:	48 8d 04 c2          	lea    rax,[rdx+rax*8]
   232a3:	48 01 c8             	add    rax,rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6136 (discriminator 1)
   232a6:	83 78 04 39          	cmp    DWORD PTR [rax+0x4],0x39
   232aa:	0f 85 06 68 00 00    	jne    29ab6 <JS_CallInternal+0x6ff6>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20693
   232b0:	48 8b 85 c0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x140]
   232b7:	80 b8 e8 04 00 00 00 	cmp    BYTE PTR [rax+0x4e8],0x0
   232be:	0f 84 39 01 00 00    	je     233fd <JS_CallInternal+0x93d>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20717
   232c4:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20713
   232cb:	b9 06 00 00 00       	mov    ecx,0x6
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20717
   232d0:	f6 40 11 30          	test   BYTE PTR [rax+0x11],0x30
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20713
   232d4:	b8 00 00 00 00       	mov    eax,0x0
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20717
   232d9:	0f 84 d4 fe ff ff    	je     231b3 <JS_CallInternal+0x6f3>
   232df:	90                   	nop
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20719
   232e0:	48 8b bd c8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x138]
   232e7:	4c 89 67 30          	mov    QWORD PTR [rdi+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20720
   232eb:	48 89 5f 40          	mov    QWORD PTR [rdi+0x40],rbx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20732
   232ef:	48 8b 9d c8 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x138]
   232f6:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
   232f9:	48 8b 9d c0 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x140]
   23300:	48 89 93 f0 04 00 00 	mov    QWORD PTR [rbx+0x4f0],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20733
   23307:	48 89 ca             	mov    rdx,rcx
   2330a:	e9 ad fd ff ff       	jmp    230bc <JS_CallInternal+0x5fc>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17839
   2330f:	48 8b 8d c0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x140]
   23316:	48 8d 04 80          	lea    rax,[rax+rax*4]
   2331a:	48 c1 e0 03          	shl    rax,0x3
   2331e:	48 03 81 58 04 00 00 	add    rax,QWORD PTR [rcx+0x458]
   23325:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17840
   23329:	48 85 c0             	test   rax,rax
   2332c:	0f 84 8e 01 00 00    	je     234c0 <JS_CallInternal+0xa00>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17844
   23332:	8b 4d 28             	mov    ecx,DWORD PTR [rbp+0x28]
   23335:	48 8b b5 e0 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x120]
   2333c:	44 8b 8d bc fe ff ff 	mov    r9d,DWORD PTR [rbp-0x144]
   23343:	4c 8b 85 88 fe ff ff 	mov    r8,QWORD PTR [rbp-0x178]
   2334a:	48 8b 95 d0 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x130]
   23351:	48 8b bd a0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x160]
   23358:	51                   	push   rcx
   23359:	48 8b 8d 78 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x188]
   23360:	ff b5 a8 fe ff ff    	push   QWORD PTR [rbp-0x158]
   23366:	ff d0                	call   rax
   23368:	59                   	pop    rcx
   23369:	5e                   	pop    rsi
   2336a:	e9 4d fd ff ff       	jmp    230bc <JS_CallInternal+0x5fc>
JS_AtomToValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3633
   2336f:	8b b5 38 fe ff ff    	mov    esi,DWORD PTR [rbp-0x1c8]
   23375:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2337c:	31 d2                	xor    edx,edx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20587
   2337e:	4c 8d 63 10          	lea    r12,[rbx+0x10]
JS_AtomToValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3633
   23382:	e8 69 0c 01 00       	call   33ff0 <__JS_AtomToValue>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20587
   23387:	48 89 03             	mov    QWORD PTR [rbx],rax
   2338a:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
   2338e:	4c 89 e3             	mov    rbx,r12
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20605
   23391:	8b 85 28 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1d8]
   23397:	83 e8 05             	sub    eax,0x5
   2339a:	48 98                	cdqe
   2339c:	49 01 c6             	add    r14,rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20613
   2339f:	41 0f b6 06          	movzx  eax,BYTE PTR [r14]
   233a3:	4d 8d 66 01          	lea    r12,[r14+0x1]
   233a7:	49 89 c5             	mov    r13,rax
   233aa:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   233ae:	4c 89 f1             	mov    rcx,r14
   233b1:	4c 89 f8             	mov    rax,r15
   233b4:	e9 36 ff ff ff       	jmp    232ef <JS_CallInternal+0x82f>
JS_ThrowStackOverflow():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7812
   233b9:	48 8b bd a0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x160]
   233c0:	48 8d 35 e4 a0 0a 00 	lea    rsi,[rip+0xaa0e4]        # cd4ab <_IO_stdin_used+0x4ab>
   233c7:	31 c0                	xor    eax,eax
   233c9:	e8 32 fc 00 00       	call   33000 <JS_ThrowInternalError>
   233ce:	e9 e9 fc ff ff       	jmp    230bc <JS_CallInternal+0x5fc>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   233d3:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   233da:	4c 89 ee             	mov    rsi,r13
   233dd:	4c 89 f2             	mov    rdx,r14
   233e0:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   233e4:	e8 b7 94 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   233e9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20697
   233f0:	41 83 fe 05          	cmp    r14d,0x5
   233f4:	0f 84 ce 61 00 00    	je     295c8 <JS_CallInternal+0x6b08>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20695
   233fa:	4c 89 fb             	mov    rbx,r15
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20694
   233fd:	48 39 9d 68 fe ff ff 	cmp    QWORD PTR [rbp-0x198],rbx
   23404:	0f 83 ba fe ff ff    	jae    232c4 <JS_CallInternal+0x804>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20695
   2340a:	4c 8b 73 f8          	mov    r14,QWORD PTR [rbx-0x8]
   2340e:	4c 8d 7b f0          	lea    r15,[rbx-0x10]
   23412:	4c 8b 6b f0          	mov    r13,QWORD PTR [rbx-0x10]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   23416:	41 83 fe f6          	cmp    r14d,0xfffffff6
   2341a:	76 d4                	jbe    233f0 <JS_CallInternal+0x930>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   2341c:	41 8b 45 fc          	mov    eax,DWORD PTR [r13-0x4]
   23420:	83 e8 01             	sub    eax,0x1
   23423:	41 89 45 fc          	mov    DWORD PTR [r13-0x4],eax
   23427:	85 c0                	test   eax,eax
   23429:	7f c5                	jg     233f0 <JS_CallInternal+0x930>
   2342b:	eb a6                	jmp    233d3 <JS_CallInternal+0x913>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17820
   2342d:	48 89 95 90 fe ff ff 	mov    QWORD PTR [rbp-0x170],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17825
   23434:	4c 89 e0             	mov    rax,r12
   23437:	e9 45 f9 ff ff       	jmp    22d81 <JS_CallInternal+0x2c1>
JS_GetProperty():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:782
   2343c:	48 83 ec 08          	sub    rsp,0x8
   23440:	4c 8b 85 50 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1b0]
   23447:	48 8b b5 10 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1f0]
   2344e:	b9 f1 00 00 00       	mov    ecx,0xf1
   23453:	6a 00                	push   0x0
   23455:	4c 8b 8d 58 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1a8]
   2345c:	4c 89 e2             	mov    rdx,r12
   2345f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23466:	e8 45 99 00 00       	call   2cdb0 <JS_GetPropertyInternal>
js_has_unscopable():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16015 (discriminator 1)
   2346b:	59                   	pop    rcx
   2346c:	5e                   	pop    rsi
JS_GetProperty():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:782
   2346d:	49 89 c0             	mov    r8,rax
   23470:	49 89 d4             	mov    r12,rdx
js_has_unscopable():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16015 (discriminator 1)
   23473:	83 fa 06             	cmp    edx,0x6
   23476:	0f 84 4a 01 00 00    	je     235c6 <JS_CallInternal+0xb06>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16018 (discriminator 1)
   2347c:	83 fa ff             	cmp    edx,0xffffffff
   2347f:	0f 84 25 5a 00 00    	je     28eaa <JS_CallInternal+0x63ea>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   23485:	83 fa f6             	cmp    edx,0xfffffff6
   23488:	0f 86 d5 f9 ff ff    	jbe    22e63 <JS_CallInternal+0x3a3>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   2348e:	8b 40 fc             	mov    eax,DWORD PTR [rax-0x4]
   23491:	83 e8 01             	sub    eax,0x1
   23494:	41 89 40 fc          	mov    DWORD PTR [r8-0x4],eax
   23498:	85 c0                	test   eax,eax
   2349a:	0f 8f c3 f9 ff ff    	jg     22e63 <JS_CallInternal+0x3a3>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   234a0:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   234a7:	4c 89 c6             	mov    rsi,r8
   234aa:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   234ae:	e8 ed 93 ff ff       	call   1c8a0 <__JS_FreeValueRT>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20538
   234b3:	e9 ab f9 ff ff       	jmp    22e63 <JS_CallInternal+0x3a3>
   234b8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   234bf:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17842
   234c0:	48 8b bd a0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x160]
   234c7:	48 8d 35 d0 b6 0a 00 	lea    rsi,[rip+0xab6d0]        # ceb9e <_IO_stdin_used+0x1b9e>
   234ce:	31 c0                	xor    eax,eax
   234d0:	e8 4b d7 00 00       	call   30c20 <JS_ThrowTypeError>
   234d5:	e9 e2 fb ff ff       	jmp    230bc <JS_CallInternal+0x5fc>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20592
   234da:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   234e1:	48 8b 95 58 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1a8]
   234e8:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
   234ee:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   234f5:	48 89 c6             	mov    rsi,rax
   234f8:	49 89 c5             	mov    r13,rax
   234fb:	49 89 d4             	mov    r12,rdx
   234fe:	e8 8d ac 04 00       	call   6e190 <JS_HasProperty>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20593 (discriminator 1)
   23503:	85 c0                	test   eax,eax
   23505:	0f 88 bb 00 00 00    	js     235c6 <JS_CallInternal+0xb06>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20596
   2350b:	b8 03 00 00 00       	mov    eax,0x3
   23510:	b9 00 00 00 00       	mov    ecx,0x0
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20595
   23515:	0f 85 fd 76 00 00    	jne    2ac18 <JS_CallInternal+0x8158>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20602
   2351b:	48 89 0b             	mov    QWORD PTR [rbx],rcx
   2351e:	48 83 c3 10          	add    rbx,0x10
   23522:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20603
   23526:	e9 66 fe ff ff       	jmp    23391 <JS_CallInternal+0x8d1>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20562
   2352b:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   23532:	48 8b 95 58 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1a8]
   23539:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
   2353f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23546:	48 89 c6             	mov    rsi,rax
   23549:	e8 42 ac 04 00       	call   6e190 <JS_HasProperty>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20563 (discriminator 1)
   2354e:	85 c0                	test   eax,eax
   23550:	0f 8e 74 88 00 00    	jle    2bdca <JS_CallInternal+0x930a>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20571
   23556:	48 83 ec 08          	sub    rsp,0x8
   2355a:	4c 8b 43 e0          	mov    r8,QWORD PTR [rbx-0x20]
   2355e:	4c 8b 4b e8          	mov    r9,QWORD PTR [rbx-0x18]
   23562:	4c 8d 63 e0          	lea    r12,[rbx-0x20]
   23566:	4c 8b 95 50 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1b0]
   2356d:	4c 8b 9d 58 fe ff ff 	mov    r11,QWORD PTR [rbp-0x1a8]
   23574:	68 00 80 00 00       	push   0x8000
   23579:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
   2357f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23586:	41 53                	push   r11
   23588:	4c 89 d6             	mov    rsi,r10
   2358b:	4c 89 da             	mov    rdx,r11
   2358e:	41 52                	push   r10
   23590:	e8 4b a5 00 00       	call   2dae0 <JS_SetPropertyInternal>
   23595:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   23599:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   2359d:	48 83 c4 20          	add    rsp,0x20
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20571
   235a1:	41 89 c5             	mov    r13d,eax
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   235a4:	83 fa f6             	cmp    edx,0xfffffff6
   235a7:	76 11                	jbe    235ba <JS_CallInternal+0xafa>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   235a9:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   235ac:	83 e8 01             	sub    eax,0x1
   235af:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   235b2:	85 c0                	test   eax,eax
   235b4:	0f 8e 40 88 00 00    	jle    2bdfa <JS_CallInternal+0x933a>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20574
   235ba:	4c 89 e3             	mov    rbx,r12
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20575 (discriminator 1)
   235bd:	45 85 ed             	test   r13d,r13d
   235c0:	0f 89 cb fd ff ff    	jns    23391 <JS_CallInternal+0x8d1>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20526
   235c6:	4d 89 f4             	mov    r12,r14
   235c9:	e9 92 fc ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20544
   235ce:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   235d5:	48 8b 95 58 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1a8]
   235dc:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
   235e2:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   235e9:	48 89 c6             	mov    rsi,rax
   235ec:	49 89 c5             	mov    r13,rax
   235ef:	49 89 d4             	mov    r12,rdx
   235f2:	e8 99 ab 04 00       	call   6e190 <JS_HasProperty>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20545 (discriminator 1)
   235f7:	85 c0                	test   eax,eax
   235f9:	0f 8e e4 86 00 00    	jle    2bce3 <JS_CallInternal+0x9223>
JS_GetProperty():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:782
   235ff:	48 83 ec 08          	sub    rsp,0x8
   23603:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
   23609:	4c 89 ee             	mov    rsi,r13
   2360c:	4c 89 e2             	mov    rdx,r12
   2360f:	4c 8b 8d 58 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1a8]
   23616:	4c 8b 85 50 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1b0]
   2361d:	6a 00                	push   0x0
   2361f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23626:	e8 85 97 00 00       	call   2cdb0 <JS_GetPropertyInternal>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20555 (discriminator 2)
   2362b:	41 59                	pop    r9
   2362d:	41 5a                	pop    r10
JS_GetProperty():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:782
   2362f:	48 89 c1             	mov    rcx,rax
   23632:	48 89 d0             	mov    rax,rdx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20555 (discriminator 2)
   23635:	83 fa 06             	cmp    edx,0x6
   23638:	74 8c                	je     235c6 <JS_CallInternal+0xb06>
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   2363a:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   2363e:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   23642:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
   23646:	48 89 4b f0          	mov    QWORD PTR [rbx-0x10],rcx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   2364a:	83 fa f6             	cmp    edx,0xfffffff6
   2364d:	0f 86 3e fd ff ff    	jbe    23391 <JS_CallInternal+0x8d1>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   23653:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   23656:	83 e8 01             	sub    eax,0x1
   23659:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2365c:	85 c0                	test   eax,eax
   2365e:	0f 8f 2d fd ff ff    	jg     23391 <JS_CallInternal+0x8d1>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   23664:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2366b:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2366f:	e8 2c 92 ff ff       	call   1c8a0 <__JS_FreeValueRT>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20559
   23674:	e9 18 fd ff ff       	jmp    23391 <JS_CallInternal+0x8d1>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20579
   23679:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   23680:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
   23686:	45 31 c0             	xor    r8d,r8d
   23689:	48 8b 95 58 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1a8]
   23690:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23697:	48 89 c6             	mov    rsi,rax
   2369a:	e8 51 7a 02 00       	call   4b0f0 <JS_DeleteProperty>
   2369f:	41 89 c4             	mov    r12d,eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20580 (discriminator 1)
   236a2:	85 c0                	test   eax,eax
   236a4:	0f 88 1c ff ff ff    	js     235c6 <JS_CallInternal+0xb06>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20582
   236aa:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   236ae:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   236b2:	83 fa f6             	cmp    edx,0xfffffff6
   236b5:	76 11                	jbe    236c8 <JS_CallInternal+0xc08>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   236b7:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   236ba:	83 e8 01             	sub    eax,0x1
   236bd:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   236c0:	85 c0                	test   eax,eax
   236c2:	0f 8e ed 86 00 00    	jle    2bdb5 <JS_CallInternal+0x92f5>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   236c8:	31 c0                	xor    eax,eax
   236ca:	45 85 e4             	test   r12d,r12d
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20583
   236cd:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   236d4:	00 
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   236d5:	0f 95 c0             	setne  al
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20583
   236d8:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20584
   236dc:	e9 b0 fc ff ff       	jmp    23391 <JS_CallInternal+0x8d1>
   236e1:	f3 0f 1e fa          	endbr64
   236e5:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18518
   236e9:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   236ee:	48 8b 8d 98 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x168]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18517
   236f5:	4d 8d 74 24 02       	lea    r14,[r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18518
   236fa:	48 8b 14 c1          	mov    rdx,QWORD PTR [rcx+rax*8]
   236fe:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
   23705:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18519
   23706:	48 8b 42 18          	mov    rax,QWORD PTR [rdx+0x18]
   2370a:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18519 (discriminator 2)
   2370e:	83 f9 04             	cmp    ecx,0x4
   23711:	0f 84 29 62 00 00    	je     29940 <JS_CallInternal+0x6e80>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18519 (discriminator 1)
   23717:	80 7a 12 00          	cmp    BYTE PTR [rdx+0x12],0x0
   2371b:	0f 85 1f 62 00 00    	jne    29940 <JS_CallInternal+0x6e80>
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   23721:	f3 0f 6f 63 f0       	movdqu xmm4,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   23726:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   23729:	0f 11 20             	movups XMMWORD PTR [rax],xmm4
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   2372c:	83 f9 f6             	cmp    ecx,0xfffffff6
   2372f:	76 11                	jbe    23742 <JS_CallInternal+0xc82>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   23731:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   23734:	83 e8 01             	sub    eax,0x1
   23737:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2373a:	85 c0                	test   eax,eax
   2373c:	0f 8e 66 6a 00 00    	jle    2a1a8 <JS_CallInternal+0x76e8>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18548
   23742:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18551
   23746:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
   2374c:	49 83 c4 03          	add    r12,0x3
   23750:	49 89 c5             	mov    r13,rax
   23753:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   23757:	ff e0                	jmp    rax
   23759:	f3 0f 1e fa          	endbr64
   2375d:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19412
   23761:	48 83 ec 08          	sub    rsp,0x8
   23765:	31 c0                	xor    eax,eax
   23767:	41 83 fd 54          	cmp    r13d,0x54
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19410
   2376b:	41 0f b6 4c 24 04    	movzx  ecx,BYTE PTR [r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19412
   23771:	0f 94 c0             	sete   al
   23774:	41 8b 14 24          	mov    edx,DWORD PTR [r12]
   23778:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19411
   2377b:	4d 8d 74 24 05       	lea    r14,[r12+0x5]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19412
   23780:	4c 8b 8d c8 fe ff ff 	mov    r9,QWORD PTR [rbp-0x138]
   23787:	4c 8b 85 98 fe ff ff 	mov    r8,QWORD PTR [rbp-0x168]
   2378e:	50                   	push   rax
   2378f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23796:	e8 85 58 06 00       	call   89020 <js_op_define_class>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19412 (discriminator 1)
   2379b:	41 59                	pop    r9
   2379d:	41 5a                	pop    r10
   2379f:	85 c0                	test   eax,eax
   237a1:	0f 88 f1 86 00 00    	js     2be98 <JS_CallInternal+0x93d8>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19417
   237a7:	41 0f b6 44 24 05    	movzx  eax,BYTE PTR [r12+0x5]
   237ad:	49 83 c4 06          	add    r12,0x6
   237b1:	49 89 c5             	mov    r13,rax
   237b4:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   237b8:	ff e0                	jmp    rax
   237ba:	f3 0f 1e fa          	endbr64
   237be:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19356
   237c2:	41 83 fd 52          	cmp    r13d,0x52
   237c6:	0f 94 c0             	sete   al
   237c9:	41 0f 94 c6          	sete   r14b
   237cd:	0f b6 c0             	movzx  eax,al
   237d0:	89 85 40 fe ff ff    	mov    DWORD PTR [rbp-0x1c0],eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19357
   237d6:	45 84 f6             	test   r14b,r14b
   237d9:	0f 85 61 60 00 00    	jne    29840 <JS_CallInternal+0x6d80>
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:181
   237df:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19364
   237e3:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:181
   237e8:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19368
   237ee:	8b 8d 40 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c0]
   237f4:	b8 fe ff ff ff       	mov    eax,0xfffffffe
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19366
   237f9:	41 0f b6 55 00       	movzx  edx,BYTE PTR [r13+0x0]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19375
   237fe:	bf 03 00 00 00       	mov    edi,0x3
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19374
   23803:	48 c7 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],0x0
   2380a:	00 00 00 00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18045
   2380e:	4c 8d 63 f0          	lea    r12,[rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19368
   23812:	29 c8                	sub    eax,ecx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19375
   23814:	48 89 bd 18 fe ff ff 	mov    QWORD PTR [rbp-0x1e8],rdi
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19368
   2381b:	48 98                	cdqe
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19376
   2381d:	48 89 bd e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdi
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19374
   23824:	48 c7 85 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],0x3
   2382b:	03 00 00 00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19368
   2382f:	48 c1 e0 04          	shl    rax,0x4
   23833:	48 8b 0c 03          	mov    rcx,QWORD PTR [rbx+rax*1]
   23837:	48 8b 44 03 08       	mov    rax,QWORD PTR [rbx+rax*1+0x8]
   2383c:	48 89 85 c0 fd ff ff 	mov    QWORD PTR [rbp-0x240],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19371
   23843:	89 d0                	mov    eax,edx
   23845:	83 e0 04             	and    eax,0x4
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19368
   23848:	48 89 8d c8 fd ff ff 	mov    QWORD PTR [rbp-0x238],rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19369
   2384f:	3c 01                	cmp    al,0x1
   23851:	19 c0                	sbb    eax,eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19375
   23853:	31 f6                	xor    esi,esi
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19369
   23855:	83 e0 fc             	and    eax,0xfffffffc
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19375
   23858:	48 89 b5 10 fe ff ff 	mov    QWORD PTR [rbp-0x1f0],rsi
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19376
   2385f:	48 89 b5 e0 fd ff ff 	mov    QWORD PTR [rbp-0x220],rsi
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19369
   23866:	05 05 45 00 00       	add    eax,0x4505
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19377
   2386b:	83 e2 03             	and    edx,0x3
   2386e:	0f 85 50 57 00 00    	jne    28fc4 <JS_CallInternal+0x6504>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19378
   23874:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19379
   23878:	0d 02 22 00 00       	or     eax,0x2202
js_method_set_properties():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:5937
   2387d:	8b b5 50 fe ff ff    	mov    esi,DWORD PTR [rbp-0x1b0]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19379
   23883:	89 85 24 fe ff ff    	mov    DWORD PTR [rbp-0x1dc],eax
js_method_set_properties():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:5937
   23889:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19378
   23890:	48 89 8d 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rcx
   23897:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
   2389b:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
   2389f:	48 89 85 d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rax
   238a6:	48 89 8d 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19387
   238ad:	48 89 8d d0 fd ff ff 	mov    QWORD PTR [rbp-0x230],rcx
js_method_set_properties():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:5937
   238b4:	e8 37 ce 01 00       	call   406f0 <js_get_function_name>
   238b9:	49 89 d1             	mov    r9,rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:5943 (discriminator 1)
   238bc:	41 83 f9 06          	cmp    r9d,0x6
   238c0:	0f 84 bb 69 00 00    	je     2a281 <JS_CallInternal+0x77c1>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:5945
   238c6:	48 83 ec 08          	sub    rsp,0x8
   238ca:	49 89 c0             	mov    r8,rax
   238cd:	b9 3a 00 00 00       	mov    ecx,0x3a
   238d2:	48 8b 95 d0 fd ff ff 	mov    rdx,QWORD PTR [rbp-0x230]
   238d9:	48 8b b5 d8 fd ff ff 	mov    rsi,QWORD PTR [rbp-0x228]
   238e0:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   238e7:	6a 01                	push   0x1
   238e9:	48 89 95 b8 fd ff ff 	mov    QWORD PTR [rbp-0x248],rdx
   238f0:	48 89 b5 b0 fd ff ff 	mov    QWORD PTR [rbp-0x250],rsi
   238f7:	e8 a4 c4 00 00       	call   2fda0 <JS_DefinePropertyValue>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:5945 (discriminator 1)
   238fc:	41 5b                	pop    r11
   238fe:	5a                   	pop    rdx
   238ff:	85 c0                	test   eax,eax
   23901:	0f 88 7a 69 00 00    	js     2a281 <JS_CallInternal+0x77c1>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:5948
   23907:	4c 8b 95 c8 fd ff ff 	mov    r10,QWORD PTR [rbp-0x238]
   2390e:	48 8b 85 c0 fd ff ff 	mov    rax,QWORD PTR [rbp-0x240]
   23915:	48 8b b5 b0 fd ff ff 	mov    rsi,QWORD PTR [rbp-0x250]
   2391c:	48 8b 95 b8 fd ff ff 	mov    rdx,QWORD PTR [rbp-0x248]
   23923:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2392a:	4c 89 d1             	mov    rcx,r10
   2392d:	49 89 c0             	mov    r8,rax
   23930:	4c 89 95 d0 fd ff ff 	mov    QWORD PTR [rbp-0x230],r10
   23937:	48 89 85 d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rax
   2393e:	e8 dd a7 ff ff       	call   1e120 <js_method_set_home_object>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19389
   23943:	8b 85 24 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1dc]
   23949:	48 83 ec 08          	sub    rsp,0x8
   2394d:	8b 8d 50 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1b0]
   23953:	4c 8b 85 38 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c8]
   2395a:	4c 8b 8d 28 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1d8]
   23961:	48 8b b5 d0 fd ff ff 	mov    rsi,QWORD PTR [rbp-0x230]
   23968:	48 8b 95 d8 fd ff ff 	mov    rdx,QWORD PTR [rbp-0x228]
   2396f:	50                   	push   rax
   23970:	ff b5 e8 fd ff ff    	push   QWORD PTR [rbp-0x218]
   23976:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2397d:	ff b5 e0 fd ff ff    	push   QWORD PTR [rbp-0x220]
   23983:	ff b5 18 fe ff ff    	push   QWORD PTR [rbp-0x1e8]
   23989:	ff b5 10 fe ff ff    	push   QWORD PTR [rbp-0x1f0]
   2398f:	e8 7c b5 00 00       	call   2ef10 <JS_DefineProperty>
   23994:	48 83 c4 30          	add    rsp,0x30
   23998:	89 c1                	mov    ecx,eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19392
   2399a:	49 8b 54 24 08       	mov    rdx,QWORD PTR [r12+0x8]
   2399f:	49 8b 34 24          	mov    rsi,QWORD PTR [r12]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   239a3:	83 fa f6             	cmp    edx,0xfffffff6
   239a6:	76 11                	jbe    239b9 <JS_CallInternal+0xef9>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   239a8:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   239ab:	83 e8 01             	sub    eax,0x1
   239ae:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   239b1:	85 c0                	test   eax,eax
   239b3:	0f 8e 07 68 00 00    	jle    2a1c0 <JS_CallInternal+0x7700>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19393
   239b9:	45 84 f6             	test   r14b,r14b
   239bc:	0f 85 dc 57 00 00    	jne    2919e <JS_CallInternal+0x66de>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19397
   239c2:	8b 85 40 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1c0]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19366
   239c8:	4d 8d 65 01          	lea    r12,[r13+0x1]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19397
   239cc:	83 c0 01             	add    eax,0x1
   239cf:	48 98                	cdqe
   239d1:	48 c1 e0 04          	shl    rax,0x4
   239d5:	48 29 c3             	sub    rbx,rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19398 (discriminator 1)
   239d8:	85 c9                	test   ecx,ecx
   239da:	0f 88 80 f8 ff ff    	js     23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19401
   239e0:	41 0f b6 45 01       	movzx  eax,BYTE PTR [r13+0x1]
   239e5:	4d 8d 65 02          	lea    r12,[r13+0x2]
   239e9:	49 89 c5             	mov    r13,rax
   239ec:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   239f0:	f3 0f 1e fa          	endbr64
   239f4:	f3 0f 1e fa          	endbr64
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:196
   239f8:	45 0f b7 0c 24       	movzx  r9d,WORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18246
   239fd:	49 89 db             	mov    r11,rbx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18245
   23a00:	49 8d 4c 24 02       	lea    rcx,[r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18248
   23a05:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18245
   23a0c:	48 89 8d 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rcx
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:196
   23a13:	4c 89 c8             	mov    rax,r9
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18244 (discriminator 1)
   23a16:	44 89 8d 38 fe ff ff 	mov    DWORD PTR [rbp-0x1c8],r9d
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18246
   23a1d:	48 c1 e0 04          	shl    rax,0x4
   23a21:	49 29 c3             	sub    r11,rax
   23a24:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18247
   23a2b:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18248
   23a32:	49 8b 73 f0          	mov    rsi,QWORD PTR [r11-0x10]
   23a36:	49 8b 53 f8          	mov    rdx,QWORD PTR [r11-0x8]
   23a3a:	4d 8d 73 e0          	lea    r14,[r11-0x20]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18247
   23a3e:	48 89 48 30          	mov    QWORD PTR [rax+0x30],rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18248
   23a42:	4d 8b 46 08          	mov    r8,QWORD PTR [r14+0x8]
   23a46:	49 8b 4b e0          	mov    rcx,QWORD PTR [r11-0x20]
   23a4a:	6a 00                	push   0x0
   23a4c:	41 53                	push   r11
   23a4e:	4c 89 9d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r11
   23a55:	6a 03                	push   0x3
   23a57:	6a 00                	push   0x0
   23a59:	e8 62 f0 ff ff       	call   22ac0 <JS_CallInternal>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18250 (discriminator 2)
   23a5e:	48 83 c4 20          	add    rsp,0x20
   23a62:	4c 8b 9d 50 fe ff ff 	mov    r11,QWORD PTR [rbp-0x1b0]
   23a69:	4c 8b 95 40 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c0]
   23a70:	83 fa 06             	cmp    edx,0x6
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18248
   23a73:	48 89 d1             	mov    rcx,rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18250 (discriminator 2)
   23a76:	0f 84 8b 68 00 00    	je     2a307 <JS_CallInternal+0x7847>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18252
   23a7c:	41 83 fd 25          	cmp    r13d,0x25
   23a80:	0f 84 2d f7 ff ff    	je     231b3 <JS_CallInternal+0x6f3>
   23a86:	4f 8d 2c 13          	lea    r13,[r11+r10*1]
   23a8a:	48 89 9d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rbx
   23a91:	4c 89 f3             	mov    rbx,r14
   23a94:	49 89 d6             	mov    r14,rdx
   23a97:	4c 89 a5 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r12
   23a9e:	4d 89 ec             	mov    r12,r13
   23aa1:	49 89 c5             	mov    r13,rax
   23aa4:	eb 17                	jmp    23abd <JS_CallInternal+0xffd>
   23aa6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   23aad:	00 00 00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18254 (discriminator 1)
   23ab0:	48 83 c3 10          	add    rbx,0x10
   23ab4:	4c 39 e3             	cmp    rbx,r12
   23ab7:	0f 84 88 54 00 00    	je     28f45 <JS_CallInternal+0x6485>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18255
   23abd:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
   23ac1:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   23ac4:	83 f9 f6             	cmp    ecx,0xfffffff6
   23ac7:	76 e7                	jbe    23ab0 <JS_CallInternal+0xff0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   23ac9:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   23acc:	8d 50 ff             	lea    edx,[rax-0x1]
   23acf:	89 56 fc             	mov    DWORD PTR [rsi-0x4],edx
   23ad2:	85 d2                	test   edx,edx
   23ad4:	7f da                	jg     23ab0 <JS_CallInternal+0xff0>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   23ad6:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   23add:	48 89 ca             	mov    rdx,rcx
   23ae0:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   23ae4:	e8 b7 8d ff ff       	call   1c8a0 <__JS_FreeValueRT>
   23ae9:	eb c5                	jmp    23ab0 <JS_CallInternal+0xff0>
   23aeb:	f3 0f 1e fa          	endbr64
   23aef:	f3 0f 1e fa          	endbr64
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20624
   23af3:	31 c9                	xor    ecx,ecx
   23af5:	b8 02 00 00 00       	mov    eax,0x2
   23afa:	e9 e1 f7 ff ff       	jmp    232e0 <JS_CallInternal+0x820>
   23aff:	f3 0f 1e fa          	endbr64
   23b03:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20681
   23b07:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
   23b0e:	4c 89 e2             	mov    rdx,r12
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20680
   23b11:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23b18:	44 89 e9             	mov    ecx,r13d
   23b1b:	48 8d 35 06 d3 0a 00 	lea    rsi,[rip+0xad306]        # d0e28 <_IO_stdin_used+0x3e28>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20681
   23b22:	48 2b 50 18          	sub    rdx,QWORD PTR [rax+0x18]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20680
   23b26:	31 c0                	xor    eax,eax
   23b28:	83 ea 01             	sub    edx,0x1
   23b2b:	e8 d0 f4 00 00       	call   33000 <JS_ThrowInternalError>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20682
   23b30:	e9 2b f7 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
   23b35:	f3 0f 1e fa          	endbr64
   23b39:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18489
   23b3d:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   23b42:	48 8b bd 98 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x168]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18488
   23b49:	4d 8d 74 24 02       	lea    r14,[r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18489
   23b4e:	48 8d 0c c5 00 00 00 	lea    rcx,[rax*8+0x0]
   23b55:	00 
   23b56:	48 8b 04 c7          	mov    rax,QWORD PTR [rdi+rax*8]
   23b5a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   23b5e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   23b61:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18490 (discriminator 2)
   23b65:	83 f8 04             	cmp    eax,0x4
   23b68:	0f 84 a5 67 00 00    	je     2a313 <JS_CallInternal+0x7853>
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   23b6e:	83 f8 f6             	cmp    eax,0xfffffff6
   23b71:	76 04                	jbe    23b77 <JS_CallInternal+0x10b7>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   23b73:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18505
   23b77:	48 89 13             	mov    QWORD PTR [rbx],rdx
   23b7a:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18509
   23b7e:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18507
   23b84:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18509
   23b88:	49 83 c4 03          	add    r12,0x3
   23b8c:	49 89 c5             	mov    r13,rax
   23b8f:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   23b93:	ff e0                	jmp    rax
   23b95:	f3 0f 1e fa          	endbr64
   23b99:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18207
   23b9d:	49 8d 44 24 02       	lea    rax,[r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18206 (discriminator 1)
   23ba2:	45 0f b7 14 24       	movzx  r10d,WORD PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18207
   23ba7:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18208
   23bae:	e9 e5 f2 ff ff       	jmp    22e98 <JS_CallInternal+0x3d8>
   23bb3:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19941
   23bb7:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19942
   23bbe:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23bc5:	44 89 ea             	mov    edx,r13d
   23bc8:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19941
   23bcb:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19942
   23bcf:	e8 cc 09 03 00       	call   545a0 <js_binary_arith_slow>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19942 (discriminator 1)
   23bd4:	85 c0                	test   eax,eax
   23bd6:	0f 85 84 f6 ff ff    	jne    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19945
   23bdc:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19944
   23be1:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19945
   23be5:	49 83 c4 01          	add    r12,0x1
   23be9:	49 89 c5             	mov    r13,rax
   23bec:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   23bf0:	ff e0                	jmp    rax
   23bf2:	f3 0f 1e fa          	endbr64
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:196
   23bf6:	45 0f b7 0c 24       	movzx  r9d,WORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18228
   23bfb:	49 89 de             	mov    r14,rbx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18227
   23bfe:	4d 8d 54 24 02       	lea    r10,[r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18230
   23c03:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18229
   23c0a:	4c 89 95 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r10
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:196
   23c11:	4c 89 c8             	mov    rax,r9
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18226 (discriminator 1)
   23c14:	44 89 8d 40 fe ff ff 	mov    DWORD PTR [rbp-0x1c0],r9d
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18228
   23c1b:	48 c1 e0 04          	shl    rax,0x4
   23c1f:	49 29 c6             	sub    r14,rax
   23c22:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18229
   23c29:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18230
   23c30:	4d 8b 46 f8          	mov    r8,QWORD PTR [r14-0x8]
   23c34:	49 8b 4e f0          	mov    rcx,QWORD PTR [r14-0x10]
   23c38:	4d 8d 6e e0          	lea    r13,[r14-0x20]
   23c3c:	49 8b 76 e0          	mov    rsi,QWORD PTR [r14-0x20]
   23c40:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18229
   23c44:	4c 89 50 30          	mov    QWORD PTR [rax+0x30],r10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18230
   23c48:	6a 00                	push   0x0
   23c4a:	41 56                	push   r14
   23c4c:	e8 8f d2 06 00       	call   90ee0 <JS_CallConstructorInternal>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18233 (discriminator 2)
   23c51:	41 5b                	pop    r11
   23c53:	4c 8b 95 50 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1b0]
   23c5a:	83 fa 06             	cmp    edx,0x6
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18230
   23c5d:	49 89 c1             	mov    r9,rax
   23c60:	49 89 d0             	mov    r8,rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18233 (discriminator 2)
   23c63:	58                   	pop    rax
   23c64:	0f 84 49 70 00 00    	je     2acb3 <JS_CallInternal+0x81f3>
   23c6a:	4c 8b 9d 38 fe ff ff 	mov    r11,QWORD PTR [rbp-0x1c8]
   23c71:	4d 01 de             	add    r14,r11
   23c74:	eb 17                	jmp    23c8d <JS_CallInternal+0x11cd>
   23c76:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   23c7d:	00 00 00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18235 (discriminator 1)
   23c80:	49 83 c5 10          	add    r13,0x10
   23c84:	4d 39 f5             	cmp    r13,r14
   23c87:	0f 84 a9 53 00 00    	je     29036 <JS_CallInternal+0x6576>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18236
   23c8d:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
   23c91:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   23c95:	83 fa f6             	cmp    edx,0xfffffff6
   23c98:	76 e6                	jbe    23c80 <JS_CallInternal+0x11c0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   23c9a:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   23c9d:	83 e8 01             	sub    eax,0x1
   23ca0:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   23ca3:	85 c0                	test   eax,eax
   23ca5:	7f d9                	jg     23c80 <JS_CallInternal+0x11c0>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   23ca7:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   23cae:	4c 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r8
   23cb5:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
   23cbc:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   23cc0:	e8 db 8b ff ff       	call   1c8a0 <__JS_FreeValueRT>
   23cc5:	4c 8b 85 38 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c8]
   23ccc:	4c 8b 8d 50 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1b0]
   23cd3:	eb ab                	jmp    23c80 <JS_CallInternal+0x11c0>
   23cd5:	f3 0f 1e fa          	endbr64
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18471
   23cd9:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18472
   23ce0:	4c 8b 43 f8          	mov    r8,QWORD PTR [rbx-0x8]
   23ce4:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
   23ce8:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   23cec:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   23cf0:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   23cf4:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18471
   23cfb:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18472
   23cff:	e8 fc 50 08 00       	call   a8e00 <js_dynamic_import>
   23d04:	49 89 d0             	mov    r8,rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18473 (discriminator 1)
   23d07:	83 fa 06             	cmp    edx,0x6
   23d0a:	0f 84 50 f5 ff ff    	je     23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18475
   23d10:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   23d14:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   23d18:	83 fa f6             	cmp    edx,0xfffffff6
   23d1b:	76 11                	jbe    23d2e <JS_CallInternal+0x126e>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   23d1d:	8b 4e fc             	mov    ecx,DWORD PTR [rsi-0x4]
   23d20:	83 e9 01             	sub    ecx,0x1
   23d23:	89 4e fc             	mov    DWORD PTR [rsi-0x4],ecx
   23d26:	85 c9                	test   ecx,ecx
   23d28:	0f 8e 4b 6d 00 00    	jle    2aa79 <JS_CallInternal+0x7fb9>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18476
   23d2e:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   23d32:	49 8b 36             	mov    rsi,QWORD PTR [r14]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   23d35:	83 fa f6             	cmp    edx,0xfffffff6
   23d38:	76 11                	jbe    23d4b <JS_CallInternal+0x128b>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   23d3a:	8b 4e fc             	mov    ecx,DWORD PTR [rsi-0x4]
   23d3d:	83 e9 01             	sub    ecx,0x1
   23d40:	89 4e fc             	mov    DWORD PTR [rsi-0x4],ecx
   23d43:	85 c9                	test   ecx,ecx
   23d45:	0f 8e 5f 6d 00 00    	jle    2aaaa <JS_CallInternal+0x7fea>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18478
   23d4b:	49 89 46 f0          	mov    QWORD PTR [r14-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18477
   23d4f:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18480
   23d52:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18478
   23d56:	4d 89 46 f8          	mov    QWORD PTR [r14-0x8],r8
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18480
   23d5a:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   23d60:	49 89 c5             	mov    r13,rax
   23d63:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   23d67:	ff e0                	jmp    rax
   23d69:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18459
   23d6d:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18460
   23d74:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   23d78:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   23d7c:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18459
   23d83:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18460
   23d87:	e8 34 e6 ff ff       	call   223c0 <JS_GetPrototype>
   23d8c:	49 89 c6             	mov    r14,rax
   23d8f:	48 89 d1             	mov    rcx,rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18461 (discriminator 1)
   23d92:	83 fa 06             	cmp    edx,0x6
   23d95:	0f 84 c5 f4 ff ff    	je     23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18463
   23d9b:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   23d9f:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   23da3:	83 fa f6             	cmp    edx,0xfffffff6
   23da6:	76 11                	jbe    23db9 <JS_CallInternal+0x12f9>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   23da8:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   23dab:	83 e8 01             	sub    eax,0x1
   23dae:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   23db1:	85 c0                	test   eax,eax
   23db3:	0f 8e 82 6b 00 00    	jle    2a93b <JS_CallInternal+0x7e7b>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18464
   23db9:	4c 89 73 f0          	mov    QWORD PTR [rbx-0x10],r14
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18466
   23dbd:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18464
   23dc1:	48 89 4b f8          	mov    QWORD PTR [rbx-0x8],rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18466
   23dc5:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   23dcb:	49 89 c5             	mov    r13,rax
   23dce:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   23dd2:	ff e0                	jmp    rax
   23dd4:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18275
   23dd8:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18274
   23ddf:	4d 8d 54 24 02       	lea    r10,[r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18277
   23de4:	48 8b 73 d0          	mov    rsi,QWORD PTR [rbx-0x30]
   23de8:	4c 8d 73 e0          	lea    r14,[rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18273 (discriminator 1)
   23dec:	45 0f b7 0c 24       	movzx  r9d,WORD PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18277
   23df1:	48 8b 53 d8          	mov    rdx,QWORD PTR [rbx-0x28]
   23df5:	4d 89 f0             	mov    r8,r14
   23df8:	b9 02 00 00 00       	mov    ecx,0x2
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18275
   23dfd:	4c 89 50 30          	mov    QWORD PTR [rax+0x30],r10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18277
   23e01:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18275
   23e08:	4c 89 95 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18277
   23e0f:	e8 ec d6 07 00       	call   a1500 <js_function_apply>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18278 (discriminator 2)
   23e14:	4c 8b 95 50 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1b0]
   23e1b:	83 fa 06             	cmp    edx,0x6
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18277
   23e1e:	49 89 c1             	mov    r9,rax
   23e21:	49 89 d0             	mov    r8,rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18278 (discriminator 2)
   23e24:	0f 84 9b 74 00 00    	je     2b2c5 <JS_CallInternal+0x8805>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18280
   23e2a:	48 8b 53 d8          	mov    rdx,QWORD PTR [rbx-0x28]
   23e2e:	48 8b 73 d0          	mov    rsi,QWORD PTR [rbx-0x30]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   23e32:	83 fa f6             	cmp    edx,0xfffffff6
   23e35:	76 11                	jbe    23e48 <JS_CallInternal+0x1388>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   23e37:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   23e3a:	83 e8 01             	sub    eax,0x1
   23e3d:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   23e40:	85 c0                	test   eax,eax
   23e42:	0f 8e 7c 6a 00 00    	jle    2a8c4 <JS_CallInternal+0x7e04>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18281
   23e48:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   23e4c:	49 8b 36             	mov    rsi,QWORD PTR [r14]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   23e4f:	83 fa f6             	cmp    edx,0xfffffff6
   23e52:	76 11                	jbe    23e65 <JS_CallInternal+0x13a5>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   23e54:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   23e57:	83 e8 01             	sub    eax,0x1
   23e5a:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   23e5d:	85 c0                	test   eax,eax
   23e5f:	0f 8e 90 6a 00 00    	jle    2a8f5 <JS_CallInternal+0x7e35>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18282
   23e65:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   23e69:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   23e6d:	83 fa f6             	cmp    edx,0xfffffff6
   23e70:	76 11                	jbe    23e83 <JS_CallInternal+0x13c3>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   23e72:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   23e75:	83 e8 01             	sub    eax,0x1
   23e78:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   23e7b:	85 c0                	test   eax,eax
   23e7d:	0f 8e 10 6a 00 00    	jle    2a893 <JS_CallInternal+0x7dd3>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18284
   23e83:	4c 89 4b d0          	mov    QWORD PTR [rbx-0x30],r9
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18286
   23e87:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18284
   23e8b:	4c 89 43 d8          	mov    QWORD PTR [rbx-0x28],r8
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18286
   23e8f:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18284
   23e95:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18286
   23e98:	49 89 c5             	mov    r13,rax
   23e9b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   23e9f:	ff e0                	jmp    rax
   23ea1:	f3 0f 1e fa          	endbr64
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:196
   23ea5:	41 0f b7 14 24       	movzx  edx,WORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18262
   23eaa:	49 8d 4c 24 02       	lea    rcx,[r12+0x2]
   23eaf:	48 89 8d 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rcx
JS_NewArray():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:5852 (discriminator 1)
   23eb6:	31 c9                	xor    ecx,ecx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18263
   23eb8:	49 89 d6             	mov    r14,rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18261 (discriminator 1)
   23ebb:	89 95 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],edx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18263
   23ec1:	49 c1 e6 04          	shl    r14,0x4
   23ec5:	48 89 95 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rdx
JS_NewArray():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:5852 (discriminator 1)
   23ecc:	ba 02 00 00 00       	mov    edx,0x2
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18263
   23ed1:	4c 29 f3             	sub    rbx,r14
   23ed4:	49 89 dd             	mov    r13,rbx
JS_NewArray():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:5852
   23ed7:	48 8b 9d e8 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x118]
   23ede:	48 8b 73 30          	mov    rsi,QWORD PTR [rbx+0x30]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:5852 (discriminator 1)
   23ee2:	48 89 df             	mov    rdi,rbx
js_dup_shape():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:5305 (discriminator 1)
   23ee5:	83 46 fc 01          	add    DWORD PTR [rsi-0x4],0x1
JS_NewArray():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:5852 (discriminator 1)
   23ee9:	e8 02 25 02 00       	call   463f0 <JS_NewObjectFromShape>
   23eee:	49 89 c0             	mov    r8,rax
   23ef1:	48 89 d1             	mov    rcx,rdx
js_create_array_free():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:9653 (discriminator 1)
   23ef4:	83 fa 06             	cmp    edx,0x6
   23ef7:	0f 84 22 76 00 00    	je     2b51f <JS_CallInternal+0x8a5f>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:9655
   23efd:	8b 95 50 fe ff ff    	mov    edx,DWORD PTR [rbp-0x1b0]
   23f03:	85 d2                	test   edx,edx
   23f05:	0f 85 72 59 00 00    	jne    2987d <JS_CallInternal+0x6dbd>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18267
   23f0b:	4d 89 45 00          	mov    QWORD PTR [r13+0x0],r8
   23f0f:	49 8d 5d 10          	lea    rbx,[r13+0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18268
   23f13:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18267
   23f17:	49 89 4d 08          	mov    QWORD PTR [r13+0x8],rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18268
   23f1b:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   23f21:	49 89 c5             	mov    r13,rax
   23f24:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   23f28:	ff e0                	jmp    rax
   23f2a:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:70 (discriminator 1)
   23f2e:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   23f32:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   23f39:	4d 8d 5c 24 04       	lea    r11,[r12+0x4]
   23f3e:	4c 8b 53 f8          	mov    r10,QWORD PTR [rbx-0x8]
   23f42:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   23f46:	48 c1 e0 04          	shl    rax,0x4
   23f4a:	48 03 41 60          	add    rax,QWORD PTR [rcx+0x60]
   23f4e:	49 89 c6             	mov    r14,rax
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:70 (discriminator 2)
   23f51:	41 83 fa ff          	cmp    r10d,0xffffffff
   23f55:	0f 85 5e 72 00 00    	jne    2b1b9 <JS_CallInternal+0x86f9>
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:70 (discriminator 1)
   23f5b:	8b 46 10             	mov    eax,DWORD PTR [rsi+0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:70 (discriminator 3)
   23f5e:	4c 8b 6e 18          	mov    r13,QWORD PTR [rsi+0x18]
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:70 (discriminator 1)
   23f62:	25 08 00 ff ff       	and    eax,0xffff0008
   23f67:	3d 00 00 01 00       	cmp    eax,0x10000
   23f6c:	0f 84 90 5f 00 00    	je     29f02 <JS_CallInternal+0x7442>
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:70 (discriminator 6)
   23f72:	41 8b 4e 0c          	mov    ecx,DWORD PTR [r14+0xc]
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:70 (discriminator 8)
   23f76:	48 89 f7             	mov    rdi,rsi
   23f79:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6152
   23f80:	41 8b 45 18          	mov    eax,DWORD PTR [r13+0x18]
   23f84:	89 ca                	mov    edx,ecx
   23f86:	21 c2                	and    edx,eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6153
   23f88:	41 8b 54 95 38       	mov    edx,DWORD PTR [r13+rdx*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6155
   23f8d:	48 85 d2             	test   rdx,rdx
   23f90:	0f 84 46 4e 00 00    	je     28ddc <JS_CallInternal+0x631c>
   23f96:	4c 8d 04 85 34 00 00 	lea    r8,[rax*4+0x34]
   23f9d:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6156
   23f9e:	49 8d 04 d0          	lea    rax,[r8+rdx*8]
   23fa2:	4c 01 e8             	add    rax,r13
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6157 (discriminator 1)
   23fa5:	3b 48 04             	cmp    ecx,DWORD PTR [rax+0x4]
   23fa8:	0f 85 20 4e 00 00    	jne    28dce <JS_CallInternal+0x630e>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:70 (discriminator 1)
   23fae:	80 78 03 3f          	cmp    BYTE PTR [rax+0x3],0x3f
   23fb2:	0f 87 0b 54 00 00    	ja     293c3 <JS_CallInternal+0x6903>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6158
   23fb8:	48 c1 e2 04          	shl    rdx,0x4
   23fbc:	48 8d 42 f0          	lea    rax,[rdx-0x10]
   23fc0:	48 8b 57 20          	mov    rdx,QWORD PTR [rdi+0x20]
   23fc4:	48 01 c2             	add    rdx,rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:70 (discriminator 14)
   23fc7:	4c 8b 02             	mov    r8,QWORD PTR [rdx]
   23fca:	48 8b 52 08          	mov    rdx,QWORD PTR [rdx+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   23fce:	83 fa f6             	cmp    edx,0xfffffff6
   23fd1:	76 05                	jbe    23fd8 <JS_CallInternal+0x1518>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   23fd3:	41 83 40 fc 01       	add    DWORD PTR [r8-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:70 (discriminator 1)
   23fd8:	48 39 fe             	cmp    rsi,rdi
   23fdb:	0f 84 2e 7e 00 00    	je     2be0f <JS_CallInternal+0x934f>
   23fe1:	4c 89 c0             	mov    rax,r8
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:70 (discriminator 30)
   23fe4:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:71
   23fe7:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:70 (discriminator 30)
   23feb:	48 83 c3 10          	add    rbx,0x10
   23fef:	48 89 53 f8          	mov    QWORD PTR [rbx-0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:71
   23ff3:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   23ff9:	49 89 c5             	mov    r13,rax
   23ffc:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24000:	ff e0                	jmp    rax
   24002:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:67 (discriminator 1)
   24006:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   2400a:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   24011:	4c 8b 53 f8          	mov    r10,QWORD PTR [rbx-0x8]
   24015:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   24019:	48 c1 e0 04          	shl    rax,0x4
   2401d:	48 03 41 60          	add    rax,QWORD PTR [rcx+0x60]
   24021:	49 89 c6             	mov    r14,rax
   24024:	49 8d 44 24 04       	lea    rax,[r12+0x4]
   24029:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:67 (discriminator 2)
   24030:	41 83 fa ff          	cmp    r10d,0xffffffff
   24034:	0f 85 a0 6d 00 00    	jne    2adda <JS_CallInternal+0x831a>
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:67 (discriminator 1)
   2403a:	8b 46 10             	mov    eax,DWORD PTR [rsi+0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:67 (discriminator 3)
   2403d:	4c 8b 6e 18          	mov    r13,QWORD PTR [rsi+0x18]
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:67 (discriminator 1)
   24041:	25 08 00 ff ff       	and    eax,0xffff0008
   24046:	3d 00 00 01 00       	cmp    eax,0x10000
   2404b:	0f 84 8f 5c 00 00    	je     29ce0 <JS_CallInternal+0x7220>
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:67 (discriminator 6)
   24051:	41 8b 4e 0c          	mov    ecx,DWORD PTR [r14+0xc]
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:67 (discriminator 8)
   24055:	48 89 f2             	mov    rdx,rsi
   24058:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   2405f:	00 
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6152
   24060:	41 8b 45 18          	mov    eax,DWORD PTR [r13+0x18]
   24064:	89 cf                	mov    edi,ecx
   24066:	21 c7                	and    edi,eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6153
   24068:	41 8b 7c bd 38       	mov    edi,DWORD PTR [r13+rdi*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6155
   2406d:	48 85 ff             	test   rdi,rdi
   24070:	0f 84 38 4d 00 00    	je     28dae <JS_CallInternal+0x62ee>
   24076:	4c 8d 04 85 34 00 00 	lea    r8,[rax*4+0x34]
   2407d:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6156
   2407e:	49 8d 04 f8          	lea    rax,[r8+rdi*8]
   24082:	4c 01 e8             	add    rax,r13
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6157 (discriminator 1)
   24085:	3b 48 04             	cmp    ecx,DWORD PTR [rax+0x4]
   24088:	0f 85 12 4d 00 00    	jne    28da0 <JS_CallInternal+0x62e0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:67 (discriminator 1)
   2408e:	80 78 03 3f          	cmp    BYTE PTR [rax+0x3],0x3f
   24092:	0f 87 c2 52 00 00    	ja     2935a <JS_CallInternal+0x689a>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6158
   24098:	48 89 f9             	mov    rcx,rdi
   2409b:	48 8b 7a 20          	mov    rdi,QWORD PTR [rdx+0x20]
   2409f:	48 c1 e1 04          	shl    rcx,0x4
   240a3:	48 83 e9 10          	sub    rcx,0x10
   240a7:	48 01 cf             	add    rdi,rcx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:67 (discriminator 14)
   240aa:	4c 8b 47 08          	mov    r8,QWORD PTR [rdi+0x8]
   240ae:	48 8b 07             	mov    rax,QWORD PTR [rdi]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   240b1:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   240b5:	76 04                	jbe    240bb <JS_CallInternal+0x15fb>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   240b7:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18045
   240bb:	4c 8d 5b f0          	lea    r11,[rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:67 (discriminator 1)
   240bf:	48 39 f2             	cmp    rdx,rsi
   240c2:	0f 84 56 7c 00 00    	je     2bd1e <JS_CallInternal+0x925e>
   240c8:	49 89 c5             	mov    r13,rax
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:67 (discriminator 31)
   240cb:	49 8b 53 08          	mov    rdx,QWORD PTR [r11+0x8]
   240cf:	49 8b 33             	mov    rsi,QWORD PTR [r11]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   240d2:	83 fa f6             	cmp    edx,0xfffffff6
   240d5:	76 11                	jbe    240e8 <JS_CallInternal+0x1628>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   240d7:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   240da:	83 e8 01             	sub    eax,0x1
   240dd:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   240e0:	85 c0                	test   eax,eax
   240e2:	0f 8e 73 6b 00 00    	jle    2ac5b <JS_CallInternal+0x819b>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:67 (discriminator 1)
   240e8:	4c 89 6b f0          	mov    QWORD PTR [rbx-0x10],r13
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:68
   240ec:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:67 (discriminator 1)
   240f0:	4c 89 43 f8          	mov    QWORD PTR [rbx-0x8],r8
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:68
   240f4:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   240fa:	49 89 c5             	mov    r13,rax
   240fd:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24101:	ff e0                	jmp    rax
   24103:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18449
   24107:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
   2410b:	4c 8d 6b e0          	lea    r13,[rbx-0x20]
   2410f:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
   24113:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   24117:	49 8b 5e 08          	mov    rbx,QWORD PTR [r14+0x8]
   2411b:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
   24122:	49 8b 45 08          	mov    rax,QWORD PTR [r13+0x8]
   24126:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   2412d:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
JS_NewRegexp():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:47686 (discriminator 1)
   24134:	83 fb f9             	cmp    ebx,0xfffffff9
   24137:	0f 85 d3 5f 00 00    	jne    2a110 <JS_CallInternal+0x7650>
   2413d:	83 f8 f9             	cmp    eax,0xfffffff9
   24140:	0f 85 ca 5f 00 00    	jne    2a110 <JS_CallInternal+0x7650>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:47692
   24146:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:47692 (discriminator 1)
   2414d:	ba 12 00 00 00       	mov    edx,0x12
   24152:	48 8d 8d 50 ff ff ff 	lea    rcx,[rbp-0xb0]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:47691
   24159:	48 c7 85 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],0x0
   24160:	00 00 00 00 
   24164:	48 c7 85 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],0x0
   2416b:	00 00 00 00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:47692
   2416f:	48 8b 77 48          	mov    rsi,QWORD PTR [rdi+0x48]
js_dup_shape():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:5305 (discriminator 1)
   24173:	83 46 fc 01          	add    DWORD PTR [rsi-0x4],0x1
JS_NewRegexp():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:47692 (discriminator 1)
   24177:	e8 74 22 02 00       	call   463f0 <JS_NewObjectFromShape>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:47693 (discriminator 1)
   2417c:	83 fa 06             	cmp    edx,0x6
   2417f:	0f 84 a0 5f 00 00    	je     2a125 <JS_CallInternal+0x7665>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:47697
   24185:	f3 0f 7e 85 40 fe ff 	movq   xmm0,QWORD PTR [rbp-0x1c0]
   2418c:	ff 
   2418d:	0f 16 85 50 fe ff ff 	movhps xmm0,QWORD PTR [rbp-0x1b0]
   24194:	0f 11 40 28          	movups XMMWORD PTR [rax+0x28],xmm0
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18449
   24198:	49 89 45 00          	mov    QWORD PTR [r13+0x0],rax
   2419c:	49 89 55 08          	mov    QWORD PTR [r13+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18451 (discriminator 1)
   241a0:	41 83 7e f8 06       	cmp    DWORD PTR [r14-0x8],0x6
   241a5:	0f 84 27 6c 00 00    	je     2add2 <JS_CallInternal+0x8312>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18454
   241ab:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18450
   241b0:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18454
   241b3:	49 83 c4 01          	add    r12,0x1
   241b7:	49 89 c5             	mov    r13,rax
   241ba:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   241be:	ff e0                	jmp    rax
   241c0:	f3 0f 1e fa          	endbr64
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:196
   241c4:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18423
   241c9:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   241cd:	48 8d b5 f0 fe ff ff 	lea    rsi,[rbp-0x110]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18422
   241d4:	48 8b 8d c8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18423
   241db:	4c 8b ad e8 fe ff ff 	mov    r13,QWORD PTR [rbp-0x118]
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:196
   241e2:	66 89 85 38 fe ff ff 	mov    WORD PTR [rbp-0x1c8],ax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18421
   241e9:	49 8d 44 24 02       	lea    rax,[r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18422
   241ee:	48 89 41 30          	mov    QWORD PTR [rcx+0x30],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18423
   241f2:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
   241f6:	4c 89 ef             	mov    rdi,r13
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18421
   241f9:	48 89 85 10 fe ff ff 	mov    QWORD PTR [rbp-0x1f0],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18423
   24200:	48 8d 43 f0          	lea    rax,[rbx-0x10]
   24204:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   2420b:	e8 30 07 06 00       	call   84940 <build_arg_list>
   24210:	49 89 c6             	mov    r14,rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18424
   24213:	48 85 c0             	test   rax,rax
   24216:	0f 84 fd 67 00 00    	je     2aa19 <JS_CallInternal+0x7f59>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18426
   2421c:	f3 41 0f 6f 9d 70 01 	movdqu xmm3,XMMWORD PTR [r13+0x170]
   24223:	00 00 
js_same_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:15927
   24225:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
   24229:	41 b8 01 00 00 00    	mov    r8d,0x1
   2422f:	4c 8b 6b e8          	mov    r13,QWORD PTR [rbx-0x18]
   24233:	0f 29 9d 40 fe ff ff 	movaps XMMWORD PTR [rbp-0x1c0],xmm3
   2423a:	48 8b 95 40 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c0]
   24241:	48 89 c7             	mov    rdi,rax
   24244:	48 8b 8d 48 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b8]
   2424b:	4c 89 ee             	mov    rsi,r13
   2424e:	48 89 85 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rax
   24255:	e8 76 62 ff ff       	call   1a4d0 <js_strict_eq2.isra.0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18427
   2425a:	44 8b 95 f0 fe ff ff 	mov    r10d,DWORD PTR [rbp-0x110]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18426 (discriminator 1)
   24261:	85 c0                	test   eax,eax
   24263:	0f 84 e4 59 00 00    	je     29c4d <JS_CallInternal+0x718d>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18427
   24269:	45 85 d2             	test   r10d,r10d
   2426c:	0f 84 a6 59 00 00    	je     29c18 <JS_CallInternal+0x7158>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18428
   24272:	49 8b 0e             	mov    rcx,QWORD PTR [r14]
   24275:	4d 8b 46 08          	mov    r8,QWORD PTR [r14+0x8]
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:196
   24279:	0f b7 85 38 fe ff ff 	movzx  eax,WORD PTR [rbp-0x1c8]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18431
   24280:	48 83 ec 08          	sub    rsp,0x8
   24284:	31 f6                	xor    esi,esi
   24286:	44 89 95 28 fe ff ff 	mov    DWORD PTR [rbp-0x1d8],r10d
   2428d:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   24294:	41 b9 02 00 00 00    	mov    r9d,0x2
   2429a:	ba 03 00 00 00       	mov    edx,0x3
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18420 (discriminator 1)
   2429f:	83 e8 02             	sub    eax,0x2
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18431
   242a2:	50                   	push   rax
   242a3:	e8 a8 e6 01 00       	call   42950 <JS_EvalObject>
   242a8:	44 8b 95 28 fe ff ff 	mov    r10d,DWORD PTR [rbp-0x1d8]
   242af:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
   242b6:	49 89 d5             	mov    r13,rdx
   242b9:	58                   	pop    rax
   242ba:	5a                   	pop    rdx
free_arg_list():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:41186 (discriminator 1)
   242bb:	45 85 d2             	test   r10d,r10d
   242be:	0f 84 cb 6a 00 00    	je     2ad8f <JS_CallInternal+0x82cf>
   242c4:	45 89 d0             	mov    r8d,r10d
   242c7:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   242ce:	48 89 9d 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rbx
   242d5:	4c 89 f3             	mov    rbx,r14
   242d8:	49 c1 e0 04          	shl    r8,0x4
   242dc:	4c 89 a5 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],r12
   242e3:	4d 01 f0             	add    r8,r14
   242e6:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
   242ea:	4d 89 c4             	mov    r12,r8
   242ed:	eb 0e                	jmp    242fd <JS_CallInternal+0x183d>
   242ef:	90                   	nop
   242f0:	48 83 c3 10          	add    rbx,0x10
   242f4:	4c 39 e3             	cmp    rbx,r12
   242f7:	0f 84 9f 4d 00 00    	je     2909c <JS_CallInternal+0x65dc>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:41187
   242fd:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
   24301:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   24304:	83 f9 f6             	cmp    ecx,0xfffffff6
   24307:	76 e7                	jbe    242f0 <JS_CallInternal+0x1830>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   24309:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2430c:	8d 50 ff             	lea    edx,[rax-0x1]
   2430f:	89 56 fc             	mov    DWORD PTR [rsi-0x4],edx
   24312:	85 d2                	test   edx,edx
   24314:	7f da                	jg     242f0 <JS_CallInternal+0x1830>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   24316:	48 89 ca             	mov    rdx,rcx
   24319:	e8 82 85 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2431e:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   24325:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   24329:	eb c5                	jmp    242f0 <JS_CallInternal+0x1830>
   2432b:	f3 0f 1e fa          	endbr64
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:196
   2432f:	41 0f b7 0c 24       	movzx  ecx,WORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18391
   24334:	49 89 dd             	mov    r13,rbx
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:196
   24337:	41 0f b7 7c 24 02    	movzx  edi,WORD PTR [r12+0x2]
js_same_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:15927
   2433d:	41 b8 01 00 00 00    	mov    r8d,0x1
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:196
   24343:	48 89 c8             	mov    rax,rcx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18388 (discriminator 1)
   24346:	89 8d 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],ecx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18390
   2434c:	49 8d 4c 24 04       	lea    rcx,[r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18391
   24351:	48 c1 e0 04          	shl    rax,0x4
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:196
   24355:	66 89 bd 38 fe ff ff 	mov    WORD PTR [rbp-0x1c8],di
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18391
   2435c:	49 29 c5             	sub    r13,rax
   2435f:	49 89 c6             	mov    r14,rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18392
   24362:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18390
   24369:	48 89 8d 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rcx
js_same_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:15927
   24370:	49 8b 7d f0          	mov    rdi,QWORD PTR [r13-0x10]
   24374:	49 8b 75 f8          	mov    rsi,QWORD PTR [r13-0x8]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18392
   24378:	48 89 48 30          	mov    QWORD PTR [rax+0x30],rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18393
   2437c:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   24383:	f3 0f 6f b8 70 01 00 	movdqu xmm7,XMMWORD PTR [rax+0x170]
   2438a:	00 
   2438b:	0f 29 bd 40 fe ff ff 	movaps XMMWORD PTR [rbp-0x1c0],xmm7
js_same_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:15927
   24392:	48 8b 95 40 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c0]
   24399:	48 8b 8d 48 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b8]
   243a0:	e8 2b 61 ff ff       	call   1a4d0 <js_strict_eq2.isra.0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18393 (discriminator 1)
   243a5:	85 c0                	test   eax,eax
   243a7:	0f 84 13 58 00 00    	je     29bc0 <JS_CallInternal+0x7100>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18394
   243ad:	8b bd 50 fe ff ff    	mov    edi,DWORD PTR [rbp-0x1b0]
   243b3:	85 ff                	test   edi,edi
   243b5:	0f 84 ee 56 00 00    	je     29aa9 <JS_CallInternal+0x6fe9>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18395
   243bb:	49 8b 4d 00          	mov    rcx,QWORD PTR [r13+0x0]
   243bf:	4d 8b 45 08          	mov    r8,QWORD PTR [r13+0x8]
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:196
   243c3:	0f b7 85 38 fe ff ff 	movzx  eax,WORD PTR [rbp-0x1c8]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18398
   243ca:	48 83 ec 08          	sub    rsp,0x8
   243ce:	41 b9 02 00 00 00    	mov    r9d,0x2
   243d4:	31 f6                	xor    esi,esi
   243d6:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   243dd:	ba 03 00 00 00       	mov    edx,0x3
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18389 (discriminator 1)
   243e2:	83 e8 02             	sub    eax,0x2
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18398
   243e5:	50                   	push   rax
   243e6:	e8 65 e5 01 00       	call   42950 <JS_EvalObject>
   243eb:	59                   	pop    rcx
   243ec:	5e                   	pop    rsi
   243ed:	49 89 c1             	mov    r9,rax
   243f0:	49 89 d0             	mov    r8,rdx
JS_IsException():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:643
   243f3:	49 8d 45 f0          	lea    rax,[r13-0x10]
   243f7:	4d 01 f5             	add    r13,r14
   243fa:	49 89 c6             	mov    r14,rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18404 (discriminator 2)
   243fd:	41 83 f8 06          	cmp    r8d,0x6
   24401:	75 1a                	jne    2441d <JS_CallInternal+0x195d>
   24403:	e9 b3 68 00 00       	jmp    2acbb <JS_CallInternal+0x81fb>
   24408:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   2440f:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18406 (discriminator 1)
   24410:	49 83 c6 10          	add    r14,0x10
   24414:	4d 39 ee             	cmp    r14,r13
   24417:	0f 84 4c 4c 00 00    	je     29069 <JS_CallInternal+0x65a9>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18407
   2441d:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   24421:	49 8b 36             	mov    rsi,QWORD PTR [r14]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   24424:	83 fa f6             	cmp    edx,0xfffffff6
   24427:	76 e7                	jbe    24410 <JS_CallInternal+0x1950>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   24429:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2442c:	83 e8 01             	sub    eax,0x1
   2442f:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24432:	85 c0                	test   eax,eax
   24434:	7f da                	jg     24410 <JS_CallInternal+0x1950>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   24436:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2443d:	4c 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r8
   24444:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   2444b:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2444f:	e8 4c 84 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   24454:	4c 8b 85 38 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c8]
   2445b:	4c 8b 8d 40 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c0]
   24462:	eb ac                	jmp    24410 <JS_CallInternal+0x1950>
   24464:	f3 0f 1e fa          	endbr64
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18363
   24468:	41 0f b6 44 24 04    	movzx  eax,BYTE PTR [r12+0x4]
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:181
   2446e:	41 8b 34 24          	mov    esi,DWORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18364
   24472:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18365
   24476:	3c 04                	cmp    al,0x4
   24478:	0f 87 96 5f 00 00    	ja     2a414 <JS_CallInternal+0x7954>
   2447e:	48 8d 15 5f 2c 0b 00 	lea    rdx,[rip+0xb2c5f]        # d70e4 <qjsc_repl_size+0x458>
   24485:	48 63 04 82          	movsxd rax,DWORD PTR [rdx+rax*4]
   24489:	48 01 d0             	add    rax,rdx
   2448c:	3e ff e0             	notrack jmp rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18375
   2448f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   24496:	48 8d 35 cb c8 0a 00 	lea    rsi,[rip+0xac8cb]        # d0d68 <_IO_stdin_used+0x3d68>
   2449d:	31 c0                	xor    eax,eax
   2449f:	e8 6c e8 00 00       	call   32d10 <JS_ThrowReferenceError>
   244a4:	e9 b7 ed ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7851 (discriminator 1)
   244a9:	48 8d 15 ea 8f 0a 00 	lea    rdx,[rip+0xa8fea]        # cd49a <_IO_stdin_used+0x49a>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7851
   244b0:	85 f6                	test   esi,esi
   244b2:	0f 85 bb 7c 00 00    	jne    2c173 <JS_CallInternal+0x96b3>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7851 (discriminator 2)
   244b8:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   244bf:	48 8d 35 30 90 0a 00 	lea    rsi,[rip+0xa9030]        # cd4f6 <_IO_stdin_used+0x4f6>
   244c6:	31 c0                	xor    eax,eax
   244c8:	e8 43 e8 00 00       	call   32d10 <JS_ThrowReferenceError>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7851 (discriminator 2)
   244cd:	e9 8e ed ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
JS_AtomGetStr():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3601
   244d2:	4c 8b b5 e8 fe ff ff 	mov    r14,QWORD PTR [rbp-0x118]
   244d9:	48 8d 45 80          	lea    rax,[rbp-0x80]
   244dd:	89 f2                	mov    edx,esi
   244df:	48 89 c6             	mov    rsi,rax
   244e2:	49 8b 7e 10          	mov    rdi,QWORD PTR [r14+0x10]
   244e6:	e8 25 2e ff ff       	call   17310 <JS_AtomGetStrRT.constprop.0>
__JS_ThrowSyntaxErrorAtom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7746 (discriminator 1)
   244eb:	48 8d 35 ee 8f 0a 00 	lea    rsi,[rip+0xa8fee]        # cd4e0 <_IO_stdin_used+0x4e0>
   244f2:	4c 89 f7             	mov    rdi,r14
JS_AtomGetStr():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3601
   244f5:	48 89 c2             	mov    rdx,rax
__JS_ThrowSyntaxErrorAtom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7746 (discriminator 1)
   244f8:	31 c0                	xor    eax,eax
   244fa:	e8 01 c3 00 00       	call   30800 <JS_ThrowSyntaxError>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7746
   244ff:	e9 5c ed ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18378
   24504:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2450b:	48 8d 35 7e c8 0a 00 	lea    rsi,[rip+0xac87e]        # d0d90 <_IO_stdin_used+0x3d90>
   24512:	31 c0                	xor    eax,eax
   24514:	e8 07 c7 00 00       	call   30c20 <JS_ThrowTypeError>
   24519:	e9 42 ed ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
JS_ThrowTypeErrorReadOnly():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7757
   2451e:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   24525:	e8 b6 db 00 00       	call   320e0 <JS_ThrowTypeErrorReadOnly.part.0>
   2452a:	e9 31 ed ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
   2452f:	f3 0f 1e fa          	endbr64
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:196
   24533:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   24537:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18601
   2453c:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   24540:	83 fa f6             	cmp    edx,0xfffffff6
   24543:	76 04                	jbe    24549 <JS_CallInternal+0x1a89>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   24545:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18601 (discriminator 1)
   24549:	48 8b bd 90 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x170]
   24550:	48 c1 e0 04          	shl    rax,0x4
   24554:	48 01 f8             	add    rax,rdi
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   24557:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   2455b:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   2455e:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
   24562:	48 89 08             	mov    QWORD PTR [rax],rcx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   24565:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   24569:	76 11                	jbe    2457c <JS_CallInternal+0x1abc>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   2456b:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2456e:	83 e8 01             	sub    eax,0x1
   24571:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24574:	85 c0                	test   eax,eax
   24576:	0f 8e f1 61 00 00    	jle    2a76d <JS_CallInternal+0x7cad>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18603
   2457c:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
   24582:	49 83 c4 03          	add    r12,0x3
   24586:	49 89 c5             	mov    r13,rax
   24589:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2458d:	ff e0                	jmp    rax
   2458f:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18592
   24593:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   24598:	48 8b 8d 90 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x170]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   2459f:	f3 0f 6f 63 f0       	movdqu xmm4,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18592
   245a4:	48 c1 e0 04          	shl    rax,0x4
   245a8:	48 01 c8             	add    rax,rcx
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   245ab:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   245af:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   245b2:	0f 11 20             	movups XMMWORD PTR [rax],xmm4
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   245b5:	83 fa f6             	cmp    edx,0xfffffff6
   245b8:	76 11                	jbe    245cb <JS_CallInternal+0x1b0b>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   245ba:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   245bd:	83 e8 01             	sub    eax,0x1
   245c0:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   245c3:	85 c0                	test   eax,eax
   245c5:	0f 8e ba 61 00 00    	jle    2a785 <JS_CallInternal+0x7cc5>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18595
   245cb:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18593
   245d1:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18595
   245d5:	49 83 c4 03          	add    r12,0x3
   245d9:	49 89 c5             	mov    r13,rax
   245dc:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   245e0:	ff e0                	jmp    rax
   245e2:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18583
   245e6:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   245eb:	48 8b 8d 90 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x170]
   245f2:	48 c1 e0 04          	shl    rax,0x4
   245f6:	48 01 c8             	add    rax,rcx
   245f9:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   245fc:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   24600:	83 f8 f6             	cmp    eax,0xfffffff6
   24603:	76 04                	jbe    24609 <JS_CallInternal+0x1b49>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   24605:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18583
   24609:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18586
   2460c:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18584
   24610:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18583
   24614:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18586
   24618:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2461e:	49 89 c5             	mov    r13,rax
   24621:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24625:	ff e0                	jmp    rax
   24627:	f3 0f 1e fa          	endbr64
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:196
   2462b:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   2462f:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18575
   24634:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   24638:	83 fa f6             	cmp    edx,0xfffffff6
   2463b:	76 04                	jbe    24641 <JS_CallInternal+0x1b81>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   2463d:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18575 (discriminator 1)
   24641:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
   24648:	48 c1 e0 04          	shl    rax,0x4
   2464c:	48 01 f8             	add    rax,rdi
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   2464f:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   24653:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   24656:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
   2465a:	48 89 08             	mov    QWORD PTR [rax],rcx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   2465d:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   24661:	76 11                	jbe    24674 <JS_CallInternal+0x1bb4>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   24663:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24666:	83 e8 01             	sub    eax,0x1
   24669:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2466c:	85 c0                	test   eax,eax
   2466e:	0f 8e aa 61 00 00    	jle    2a81e <JS_CallInternal+0x7d5e>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18577
   24674:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
   2467a:	49 83 c4 03          	add    r12,0x3
   2467e:	49 89 c5             	mov    r13,rax
   24681:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24685:	ff e0                	jmp    rax
   24687:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18566
   2468b:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   24690:	48 8b 8d b0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x150]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   24697:	f3 0f 6f 4b f0       	movdqu xmm1,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18566
   2469c:	48 c1 e0 04          	shl    rax,0x4
   246a0:	48 01 c8             	add    rax,rcx
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   246a3:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   246a7:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   246aa:	0f 11 08             	movups XMMWORD PTR [rax],xmm1
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   246ad:	83 fa f6             	cmp    edx,0xfffffff6
   246b0:	76 11                	jbe    246c3 <JS_CallInternal+0x1c03>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   246b2:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   246b5:	83 e8 01             	sub    eax,0x1
   246b8:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   246bb:	85 c0                	test   eax,eax
   246bd:	0f 8e 46 61 00 00    	jle    2a809 <JS_CallInternal+0x7d49>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18569
   246c3:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18567
   246c9:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18569
   246cd:	49 83 c4 03          	add    r12,0x3
   246d1:	49 89 c5             	mov    r13,rax
   246d4:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   246d8:	ff e0                	jmp    rax
   246da:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18557
   246de:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   246e3:	48 8b 8d b0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x150]
   246ea:	48 c1 e0 04          	shl    rax,0x4
   246ee:	48 01 c8             	add    rax,rcx
   246f1:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   246f4:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   246f8:	83 f8 f6             	cmp    eax,0xfffffff6
   246fb:	76 04                	jbe    24701 <JS_CallInternal+0x1c41>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   246fd:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18557
   24701:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18560
   24704:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18558
   24708:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18557
   2470c:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18560
   24710:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24716:	49 89 c5             	mov    r13,rax
   24719:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2471d:	ff e0                	jmp    rax
   2471f:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18622
   24723:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
   2472a:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   2472e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   24731:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   24735:	83 f8 f6             	cmp    eax,0xfffffff6
   24738:	76 04                	jbe    2473e <JS_CallInternal+0x1c7e>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   2473a:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18622
   2473e:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18622 (discriminator 1)
   24741:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18622
   24745:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18622 (discriminator 1)
   24749:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18622
   2474f:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18622 (discriminator 1)
   24752:	49 89 c5             	mov    r13,rax
   24755:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24759:	ff e0                	jmp    rax
   2475b:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18621
   2475f:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   24763:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   24767:	83 f8 f6             	cmp    eax,0xfffffff6
   2476a:	76 04                	jbe    24770 <JS_CallInternal+0x1cb0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   2476c:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   24770:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
   24777:	48 8b 4f 38          	mov    rcx,QWORD PTR [rdi+0x38]
   2477b:	48 8b 77 30          	mov    rsi,QWORD PTR [rdi+0x30]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   2477f:	48 89 47 38          	mov    QWORD PTR [rdi+0x38],rax
   24783:	48 89 57 30          	mov    QWORD PTR [rdi+0x30],rdx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   24787:	83 f9 f6             	cmp    ecx,0xfffffff6
   2478a:	76 11                	jbe    2479d <JS_CallInternal+0x1cdd>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   2478c:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2478f:	83 e8 01             	sub    eax,0x1
   24792:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24795:	85 c0                	test   eax,eax
   24797:	0f 8e 54 60 00 00    	jle    2a7f1 <JS_CallInternal+0x7d31>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18621 (discriminator 2)
   2479d:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   247a2:	49 83 c4 01          	add    r12,0x1
   247a6:	49 89 c5             	mov    r13,rax
   247a9:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   247ad:	ff e0                	jmp    rax
   247af:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18620
   247b3:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   247b7:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   247bb:	83 f8 f6             	cmp    eax,0xfffffff6
   247be:	76 04                	jbe    247c4 <JS_CallInternal+0x1d04>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   247c0:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   247c4:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
   247cb:	48 8b 4f 28          	mov    rcx,QWORD PTR [rdi+0x28]
   247cf:	48 8b 77 20          	mov    rsi,QWORD PTR [rdi+0x20]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   247d3:	48 89 47 28          	mov    QWORD PTR [rdi+0x28],rax
   247d7:	48 89 57 20          	mov    QWORD PTR [rdi+0x20],rdx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   247db:	83 f9 f6             	cmp    ecx,0xfffffff6
   247de:	76 11                	jbe    247f1 <JS_CallInternal+0x1d31>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   247e0:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   247e3:	83 e8 01             	sub    eax,0x1
   247e6:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   247e9:	85 c0                	test   eax,eax
   247eb:	0f 8e 72 60 00 00    	jle    2a863 <JS_CallInternal+0x7da3>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18620 (discriminator 2)
   247f1:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   247f6:	49 83 c4 01          	add    r12,0x1
   247fa:	49 89 c5             	mov    r13,rax
   247fd:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24801:	ff e0                	jmp    rax
   24803:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18619
   24807:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   2480b:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   2480f:	83 f8 f6             	cmp    eax,0xfffffff6
   24812:	76 04                	jbe    24818 <JS_CallInternal+0x1d58>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   24814:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   24818:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
   2481f:	48 8b 4f 18          	mov    rcx,QWORD PTR [rdi+0x18]
   24823:	48 8b 77 10          	mov    rsi,QWORD PTR [rdi+0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   24827:	48 89 47 18          	mov    QWORD PTR [rdi+0x18],rax
   2482b:	48 89 57 10          	mov    QWORD PTR [rdi+0x10],rdx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   2482f:	83 f9 f6             	cmp    ecx,0xfffffff6
   24832:	76 11                	jbe    24845 <JS_CallInternal+0x1d85>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   24834:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24837:	83 e8 01             	sub    eax,0x1
   2483a:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2483d:	85 c0                	test   eax,eax
   2483f:	0f 8e 36 60 00 00    	jle    2a87b <JS_CallInternal+0x7dbb>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18619 (discriminator 2)
   24845:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   2484a:	49 83 c4 01          	add    r12,0x1
   2484e:	49 89 c5             	mov    r13,rax
   24851:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24855:	ff e0                	jmp    rax
   24857:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18618
   2485b:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   2485f:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   24863:	83 f8 f6             	cmp    eax,0xfffffff6
   24866:	76 04                	jbe    2486c <JS_CallInternal+0x1dac>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   24868:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   2486c:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
   24873:	48 8b 4f 08          	mov    rcx,QWORD PTR [rdi+0x8]
   24877:	48 8b 37             	mov    rsi,QWORD PTR [rdi]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   2487a:	48 89 47 08          	mov    QWORD PTR [rdi+0x8],rax
   2487e:	48 89 17             	mov    QWORD PTR [rdi],rdx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   24881:	83 f9 f6             	cmp    ecx,0xfffffff6
   24884:	76 11                	jbe    24897 <JS_CallInternal+0x1dd7>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   24886:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24889:	83 e8 01             	sub    eax,0x1
   2488c:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2488f:	85 c0                	test   eax,eax
   24891:	0f 8e 9f 5f 00 00    	jle    2a836 <JS_CallInternal+0x7d76>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18618 (discriminator 2)
   24897:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   2489c:	49 83 c4 01          	add    r12,0x1
   248a0:	49 89 c5             	mov    r13,rax
   248a3:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   248a7:	ff e0                	jmp    rax
   248a9:	f3 0f 1e fa          	endbr64
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   248ad:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   248b4:	f3 0f 6f 5b f0       	movdqu xmm3,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18617
   248b9:	48 83 eb 10          	sub    rbx,0x10
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   248bd:	48 8b 50 38          	mov    rdx,QWORD PTR [rax+0x38]
   248c1:	48 8b 70 30          	mov    rsi,QWORD PTR [rax+0x30]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   248c5:	0f 11 58 30          	movups XMMWORD PTR [rax+0x30],xmm3
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   248c9:	83 fa f6             	cmp    edx,0xfffffff6
   248cc:	76 11                	jbe    248df <JS_CallInternal+0x1e1f>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   248ce:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   248d1:	83 e8 01             	sub    eax,0x1
   248d4:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   248d7:	85 c0                	test   eax,eax
   248d9:	0f 8e 6f 5f 00 00    	jle    2a84e <JS_CallInternal+0x7d8e>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18617 (discriminator 1)
   248df:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   248e4:	49 83 c4 01          	add    r12,0x1
   248e8:	49 89 c5             	mov    r13,rax
   248eb:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   248ef:	ff e0                	jmp    rax
   248f1:	f3 0f 1e fa          	endbr64
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   248f5:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   248fc:	f3 0f 6f 7b f0       	movdqu xmm7,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18616
   24901:	48 83 eb 10          	sub    rbx,0x10
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   24905:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
   24909:	48 8b 70 20          	mov    rsi,QWORD PTR [rax+0x20]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   2490d:	0f 11 78 20          	movups XMMWORD PTR [rax+0x20],xmm7
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   24911:	83 fa f6             	cmp    edx,0xfffffff6
   24914:	76 11                	jbe    24927 <JS_CallInternal+0x1e67>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   24916:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24919:	83 e8 01             	sub    eax,0x1
   2491c:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2491f:	85 c0                	test   eax,eax
   24921:	0f 8e a0 5e 00 00    	jle    2a7c7 <JS_CallInternal+0x7d07>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18616 (discriminator 1)
   24927:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   2492c:	49 83 c4 01          	add    r12,0x1
   24930:	49 89 c5             	mov    r13,rax
   24933:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24937:	ff e0                	jmp    rax
   24939:	f3 0f 1e fa          	endbr64
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   2493d:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   24944:	f3 0f 6f 73 f0       	movdqu xmm6,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18615
   24949:	48 83 eb 10          	sub    rbx,0x10
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   2494d:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
   24951:	48 8b 70 10          	mov    rsi,QWORD PTR [rax+0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   24955:	0f 11 70 10          	movups XMMWORD PTR [rax+0x10],xmm6
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   24959:	83 fa f6             	cmp    edx,0xfffffff6
   2495c:	76 11                	jbe    2496f <JS_CallInternal+0x1eaf>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   2495e:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24961:	83 e8 01             	sub    eax,0x1
   24964:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24967:	85 c0                	test   eax,eax
   24969:	0f 8e 6d 5e 00 00    	jle    2a7dc <JS_CallInternal+0x7d1c>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18615 (discriminator 1)
   2496f:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   24974:	49 83 c4 01          	add    r12,0x1
   24978:	49 89 c5             	mov    r13,rax
   2497b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2497f:	ff e0                	jmp    rax
   24981:	f3 0f 1e fa          	endbr64
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   24985:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   2498c:	f3 0f 6f 6b f0       	movdqu xmm5,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18614
   24991:	48 83 eb 10          	sub    rbx,0x10
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   24995:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   24999:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   2499c:	0f 11 28             	movups XMMWORD PTR [rax],xmm5
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   2499f:	83 fa f6             	cmp    edx,0xfffffff6
   249a2:	76 11                	jbe    249b5 <JS_CallInternal+0x1ef5>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   249a4:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   249a7:	83 e8 01             	sub    eax,0x1
   249aa:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   249ad:	85 c0                	test   eax,eax
   249af:	0f 8e e5 5d 00 00    	jle    2a79a <JS_CallInternal+0x7cda>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18614 (discriminator 1)
   249b5:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   249ba:	49 83 c4 01          	add    r12,0x1
   249be:	49 89 c5             	mov    r13,rax
   249c1:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   249c5:	ff e0                	jmp    rax
   249c7:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18613
   249cb:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   249d2:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   249d6:	48 8b 50 30          	mov    rdx,QWORD PTR [rax+0x30]
   249da:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   249de:	83 f8 f6             	cmp    eax,0xfffffff6
   249e1:	76 04                	jbe    249e7 <JS_CallInternal+0x1f27>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   249e3:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18613
   249e7:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18613 (discriminator 1)
   249ea:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18613
   249ee:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18613 (discriminator 1)
   249f2:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18613
   249f8:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18613 (discriminator 1)
   249fb:	49 89 c5             	mov    r13,rax
   249fe:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24a02:	ff e0                	jmp    rax
   24a04:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18612
   24a08:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   24a0f:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   24a13:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
   24a17:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   24a1b:	83 f8 f6             	cmp    eax,0xfffffff6
   24a1e:	76 04                	jbe    24a24 <JS_CallInternal+0x1f64>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   24a20:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18612
   24a24:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18612 (discriminator 1)
   24a27:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18612
   24a2b:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18612 (discriminator 1)
   24a2f:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18612
   24a35:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18612 (discriminator 1)
   24a38:	49 89 c5             	mov    r13,rax
   24a3b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24a3f:	ff e0                	jmp    rax
   24a41:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18611
   24a45:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   24a4c:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   24a50:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
   24a54:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   24a58:	83 f8 f6             	cmp    eax,0xfffffff6
   24a5b:	76 04                	jbe    24a61 <JS_CallInternal+0x1fa1>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   24a5d:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18611
   24a61:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18611 (discriminator 1)
   24a64:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18611
   24a68:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18611 (discriminator 1)
   24a6c:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18611
   24a72:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18611 (discriminator 1)
   24a75:	49 89 c5             	mov    r13,rax
   24a78:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24a7c:	ff e0                	jmp    rax
   24a7e:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18610
   24a82:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   24a89:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   24a8d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   24a90:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   24a94:	83 f8 f6             	cmp    eax,0xfffffff6
   24a97:	76 04                	jbe    24a9d <JS_CallInternal+0x1fdd>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   24a99:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18610
   24a9d:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18610 (discriminator 1)
   24aa0:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18610
   24aa4:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18610 (discriminator 1)
   24aa8:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18610
   24aae:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18610 (discriminator 1)
   24ab1:	49 89 c5             	mov    r13,rax
   24ab4:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24ab8:	ff e0                	jmp    rax
   24aba:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18608
   24abe:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   24ac2:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   24ac6:	83 fa f6             	cmp    edx,0xfffffff6
   24ac9:	76 04                	jbe    24acf <JS_CallInternal+0x200f>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   24acb:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18608 (discriminator 1)
   24acf:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   24ad4:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
   24adb:	48 c1 e0 04          	shl    rax,0x4
   24adf:	48 01 f8             	add    rax,rdi
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   24ae2:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   24ae6:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   24ae9:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
   24aed:	48 89 08             	mov    QWORD PTR [rax],rcx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   24af0:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   24af4:	76 11                	jbe    24b07 <JS_CallInternal+0x2047>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   24af6:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24af9:	83 e8 01             	sub    eax,0x1
   24afc:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24aff:	85 c0                	test   eax,eax
   24b01:	0f 8e a8 5c 00 00    	jle    2a7af <JS_CallInternal+0x7cef>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18608 (discriminator 2)
   24b07:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
   24b0d:	49 83 c4 02          	add    r12,0x2
   24b11:	49 89 c5             	mov    r13,rax
   24b14:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24b18:	ff e0                	jmp    rax
   24b1a:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18607
   24b1e:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   24b23:	48 8b 8d b0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x150]
   24b2a:	48 83 eb 10          	sub    rbx,0x10
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   24b2e:	f3 0f 6f 13          	movdqu xmm2,XMMWORD PTR [rbx]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18607
   24b32:	48 c1 e0 04          	shl    rax,0x4
   24b36:	48 01 c8             	add    rax,rcx
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   24b39:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   24b3d:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   24b40:	0f 11 10             	movups XMMWORD PTR [rax],xmm2
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   24b43:	83 fa f6             	cmp    edx,0xfffffff6
   24b46:	76 11                	jbe    24b59 <JS_CallInternal+0x2099>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   24b48:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24b4b:	83 e8 01             	sub    eax,0x1
   24b4e:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24b51:	85 c0                	test   eax,eax
   24b53:	0f 8e cd 5a 00 00    	jle    2a626 <JS_CallInternal+0x7b66>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18607 (discriminator 1)
   24b59:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
   24b5f:	49 83 c4 02          	add    r12,0x2
   24b63:	49 89 c5             	mov    r13,rax
   24b66:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24b6a:	ff e0                	jmp    rax
   24b6c:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18606
   24b70:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   24b75:	48 8b 8d b0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x150]
   24b7c:	48 c1 e0 04          	shl    rax,0x4
   24b80:	48 01 c8             	add    rax,rcx
   24b83:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   24b87:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   24b8a:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   24b8e:	83 f8 f6             	cmp    eax,0xfffffff6
   24b91:	76 04                	jbe    24b97 <JS_CallInternal+0x20d7>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   24b93:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18606
   24b97:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18606 (discriminator 1)
   24b9a:	49 83 c4 02          	add    r12,0x2
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18606
   24b9e:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18606 (discriminator 1)
   24ba2:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18606
   24ba8:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18606 (discriminator 1)
   24bab:	49 89 c5             	mov    r13,rax
   24bae:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24bb2:	ff e0                	jmp    rax
   24bb4:	f3 0f 1e fa          	endbr64
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:196
   24bb8:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18743
   24bbd:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18742
   24bc4:	4d 8d 6c 24 02       	lea    r13,[r12+0x2]
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:196
   24bc9:	48 89 c1             	mov    rcx,rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18743
   24bcc:	48 c1 e0 04          	shl    rax,0x4
   24bd0:	48 01 f8             	add    rax,rdi
   24bd3:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18743 (discriminator 2)
   24bd7:	83 fa 04             	cmp    edx,0x4
   24bda:	0f 84 69 6d 00 00    	je     2b949 <JS_CallInternal+0x8e89>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18747
   24be0:	48 8b 00             	mov    rax,QWORD PTR [rax]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   24be3:	83 fa f6             	cmp    edx,0xfffffff6
   24be6:	76 04                	jbe    24bec <JS_CallInternal+0x212c>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   24be8:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18747
   24bec:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18750
   24bef:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18748
   24bf3:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18747
   24bf7:	48 89 53 f8          	mov    QWORD PTR [rbx-0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18750
   24bfb:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24c01:	49 89 c5             	mov    r13,rax
   24c04:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24c08:	ff e0                	jmp    rax
   24c0a:	f3 0f 1e fa          	endbr64
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:196
   24c0e:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18730
   24c13:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18729
   24c1a:	4d 8d 6c 24 02       	lea    r13,[r12+0x2]
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:196
   24c1f:	48 89 c1             	mov    rcx,rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18730
   24c22:	48 c1 e0 04          	shl    rax,0x4
   24c26:	48 01 f8             	add    rax,rdi
   24c29:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18730 (discriminator 2)
   24c2d:	83 fa 04             	cmp    edx,0x4
   24c30:	0f 84 54 6e 00 00    	je     2ba8a <JS_CallInternal+0x8fca>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18734
   24c36:	48 8b 00             	mov    rax,QWORD PTR [rax]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   24c39:	83 fa f6             	cmp    edx,0xfffffff6
   24c3c:	76 04                	jbe    24c42 <JS_CallInternal+0x2182>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   24c3e:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18734
   24c42:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18737
   24c45:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18735
   24c49:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18734
   24c4d:	48 89 53 f8          	mov    QWORD PTR [rbx-0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18737
   24c51:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24c57:	49 89 c5             	mov    r13,rax
   24c5a:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24c5e:	ff e0                	jmp    rax
   24c60:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18722
   24c64:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   24c69:	48 8b 8d b0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x150]
   24c70:	48 c1 e0 04          	shl    rax,0x4
   24c74:	48 01 c8             	add    rax,rcx
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   24c77:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   24c7b:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   24c7e:	48 c7 40 08 04 00 00 	mov    QWORD PTR [rax+0x8],0x4
   24c85:	00 
   24c86:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   24c8d:	83 fa f6             	cmp    edx,0xfffffff6
   24c90:	76 11                	jbe    24ca3 <JS_CallInternal+0x21e3>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   24c92:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24c95:	83 e8 01             	sub    eax,0x1
   24c98:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24c9b:	85 c0                	test   eax,eax
   24c9d:	0f 8e 6e 59 00 00    	jle    2a611 <JS_CallInternal+0x7b51>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18724
   24ca3:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
   24ca9:	49 83 c4 03          	add    r12,0x3
   24cad:	49 89 c5             	mov    r13,rax
   24cb0:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24cb4:	ff e0                	jmp    rax
   24cb6:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18709
   24cba:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   24cbf:	48 8b 8d 98 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x168]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18708
   24cc6:	4d 8d 6c 24 02       	lea    r13,[r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18709
   24ccb:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
   24cd2:	00 
   24cd3:	48 8b 04 c1          	mov    rax,QWORD PTR [rcx+rax*8]
   24cd7:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18709 (discriminator 2)
   24cdb:	83 78 08 04          	cmp    DWORD PTR [rax+0x8],0x4
   24cdf:	0f 85 39 61 00 00    	jne    2ae1e <JS_CallInternal+0x835e>
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   24ce5:	f3 0f 6f 7b f0       	movdqu xmm7,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18716
   24cea:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18714
   24cee:	48 83 eb 10          	sub    rbx,0x10
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   24cf2:	0f 11 38             	movups XMMWORD PTR [rax],xmm7
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18716
   24cf5:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24cfb:	49 89 c5             	mov    r13,rax
   24cfe:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24d02:	ff e0                	jmp    rax
   24d04:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18696
   24d08:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   24d0d:	48 8b bd 98 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x168]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18695
   24d14:	4d 8d 6c 24 02       	lea    r13,[r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18696
   24d19:	48 8d 0c c5 00 00 00 	lea    rcx,[rax*8+0x0]
   24d20:	00 
   24d21:	48 8b 04 c7          	mov    rax,QWORD PTR [rdi+rax*8]
   24d25:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   24d29:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18696 (discriminator 2)
   24d2d:	83 fa 04             	cmp    edx,0x4
   24d30:	0f 84 23 69 00 00    	je     2b659 <JS_CallInternal+0x8b99>
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   24d36:	f3 0f 6f 73 f0       	movdqu xmm6,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   24d3b:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   24d3e:	0f 11 30             	movups XMMWORD PTR [rax],xmm6
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   24d41:	83 fa f6             	cmp    edx,0xfffffff6
   24d44:	76 11                	jbe    24d57 <JS_CallInternal+0x2297>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   24d46:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24d49:	83 e8 01             	sub    eax,0x1
   24d4c:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24d4f:	85 c0                	test   eax,eax
   24d51:	0f 8e b2 57 00 00    	jle    2a509 <JS_CallInternal+0x7a49>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18703
   24d57:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18701
   24d5d:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18703
   24d61:	49 83 c4 03          	add    r12,0x3
   24d65:	49 89 c5             	mov    r13,rax
   24d68:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24d6c:	ff e0                	jmp    rax
   24d6e:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20663
   24d72:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   24d76:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   24d7d:	4c 8d 43 f0          	lea    r8,[rbx-0x10]
   24d81:	49 8b 50 08          	mov    rdx,QWORD PTR [r8+0x8]
   24d85:	e8 36 6c ff ff       	call   1b9c0 <js_operator_typeof>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20663 (discriminator 1)
   24d8a:	83 f8 1b             	cmp    eax,0x1b
   24d8d:	74 61                	je     24df0 <JS_CallInternal+0x2330>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20675
   24d8f:	49 8b 50 08          	mov    rdx,QWORD PTR [r8+0x8]
   24d93:	49 8b 30             	mov    rsi,QWORD PTR [r8]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   24d96:	83 fa f6             	cmp    edx,0xfffffff6
   24d99:	76 11                	jbe    24dac <JS_CallInternal+0x22ec>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   24d9b:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24d9e:	83 e8 01             	sub    eax,0x1
   24da1:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24da4:	85 c0                	test   eax,eax
   24da6:	0f 8e 4e 49 00 00    	jle    296fa <JS_CallInternal+0x6c3a>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20676
   24dac:	48 c7 43 f0 00 00 00 	mov    QWORD PTR [rbx-0x10],0x0
   24db3:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20677
   24db4:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20676
   24db8:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   24dbf:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20677
   24dc0:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24dc6:	49 89 c5             	mov    r13,rax
   24dc9:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24dcd:	ff e0                	jmp    rax
   24dcf:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20657
   24dd3:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   24dd7:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   24dde:	4c 8d 43 f0          	lea    r8,[rbx-0x10]
   24de2:	49 8b 50 08          	mov    rdx,QWORD PTR [r8+0x8]
   24de6:	e8 d5 6b ff ff       	call   1b9c0 <js_operator_typeof>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20657 (discriminator 1)
   24deb:	83 f8 49             	cmp    eax,0x49
   24dee:	75 9f                	jne    24d8f <JS_CallInternal+0x22cf>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20669
   24df0:	49 8b 50 08          	mov    rdx,QWORD PTR [r8+0x8]
   24df4:	49 8b 30             	mov    rsi,QWORD PTR [r8]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   24df7:	83 fa f6             	cmp    edx,0xfffffff6
   24dfa:	76 11                	jbe    24e0d <JS_CallInternal+0x234d>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   24dfc:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24dff:	83 e8 01             	sub    eax,0x1
   24e02:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24e05:	85 c0                	test   eax,eax
   24e07:	0f 8e 17 69 00 00    	jle    2b724 <JS_CallInternal+0x8c64>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20672
   24e0d:	48 c7 43 f0 01 00 00 	mov    QWORD PTR [rbx-0x10],0x1
   24e14:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20673
   24e15:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20672
   24e19:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   24e20:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20673
   24e21:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24e27:	49 89 c5             	mov    r13,rax
   24e2a:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24e2e:	ff e0                	jmp    rax
   24e30:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20630
   24e34:	31 c9                	xor    ecx,ecx
   24e36:	b8 03 00 00 00       	mov    eax,0x3
   24e3b:	e9 a0 e4 ff ff       	jmp    232e0 <JS_CallInternal+0x820>
   24e40:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20626
   24e44:	b9 03 00 00 00       	mov    ecx,0x3
   24e49:	31 c0                	xor    eax,eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20627
   24e4b:	e9 90 e4 ff ff       	jmp    232e0 <JS_CallInternal+0x820>
   24e50:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20649
   24e54:	83 7b f8 02          	cmp    DWORD PTR [rbx-0x8],0x2
   24e58:	74 b3                	je     24e0d <JS_CallInternal+0x234d>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18045
   24e5a:	4c 8d 43 f0          	lea    r8,[rbx-0x10]
   24e5e:	e9 2c ff ff ff       	jmp    24d8f <JS_CallInternal+0x22cf>
   24e63:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20643
   24e67:	83 7b f8 03          	cmp    DWORD PTR [rbx-0x8],0x3
   24e6b:	75 ed                	jne    24e5a <JS_CallInternal+0x239a>
   24e6d:	eb 9e                	jmp    24e0d <JS_CallInternal+0x234d>
   24e6f:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20635
   24e73:	8b 43 f8             	mov    eax,DWORD PTR [rbx-0x8]
   24e76:	83 e8 02             	sub    eax,0x2
   24e79:	83 f8 01             	cmp    eax,0x1
   24e7c:	77 dc                	ja     24e5a <JS_CallInternal+0x239a>
   24e7e:	eb 8d                	jmp    24e0d <JS_CallInternal+0x234d>
   24e80:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20633
   24e84:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   24e89:	49 83 c4 01          	add    r12,0x1
   24e8d:	49 89 c5             	mov    r13,rax
   24e90:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24e94:	ff e0                	jmp    rax
   24e96:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20620
   24e9a:	31 c9                	xor    ecx,ecx
   24e9c:	b8 01 00 00 00       	mov    eax,0x1
   24ea1:	e9 3a e4 ff ff       	jmp    232e0 <JS_CallInternal+0x820>
   24ea6:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20617
   24eaa:	31 c9                	xor    ecx,ecx
   24eac:	31 c0                	xor    eax,eax
   24eae:	e9 2d e4 ff ff       	jmp    232e0 <JS_CallInternal+0x820>
   24eb3:	f3 0f 1e fa          	endbr64
   24eb7:	e9 24 df ff ff       	jmp    22de0 <JS_CallInternal+0x320>
   24ebc:	f3 0f 1e fa          	endbr64
   24ec0:	e9 1b df ff ff       	jmp    22de0 <JS_CallInternal+0x320>
   24ec5:	f3 0f 1e fa          	endbr64
   24ec9:	e9 12 df ff ff       	jmp    22de0 <JS_CallInternal+0x320>
   24ece:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20486
   24ed2:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   24ed6:	83 f8 fa             	cmp    eax,0xfffffffa
   24ed9:	0f 8d 45 46 00 00    	jge    29524 <JS_CallInternal+0x6a64>
   24edf:	83 f8 f8             	cmp    eax,0xfffffff8
   24ee2:	0f 8c 44 46 00 00    	jl     2952c <JS_CallInternal+0x6a6c>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20500
   24ee8:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   24eed:	49 83 c4 01          	add    r12,0x1
   24ef1:	49 89 c5             	mov    r13,rax
   24ef4:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24ef8:	ff e0                	jmp    rax
   24efa:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20475
   24efe:	83 7b f8 ff          	cmp    DWORD PTR [rbx-0x8],0xffffffff
   24f02:	74 54                	je     24f58 <JS_CallInternal+0x2498>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20476
   24f04:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20477
   24f0b:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   24f0f:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   24f13:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20476
   24f1a:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20477
   24f1e:	e8 ad 35 02 00       	call   484d0 <JS_ToObject>
   24f23:	49 89 c1             	mov    r9,rax
   24f26:	49 89 d0             	mov    r8,rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20478 (discriminator 1)
   24f29:	83 fa 06             	cmp    edx,0x6
   24f2c:	0f 84 2e e3 ff ff    	je     23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20480
   24f32:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   24f36:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   24f3a:	83 fa f6             	cmp    edx,0xfffffff6
   24f3d:	76 11                	jbe    24f50 <JS_CallInternal+0x2490>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   24f3f:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24f42:	83 e8 01             	sub    eax,0x1
   24f45:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24f48:	85 c0                	test   eax,eax
   24f4a:	0f 8e e2 70 00 00    	jle    2c032 <JS_CallInternal+0x9572>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20481
   24f50:	4c 89 4b f0          	mov    QWORD PTR [rbx-0x10],r9
   24f54:	4c 89 43 f8          	mov    QWORD PTR [rbx-0x8],r8
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20483
   24f58:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   24f5d:	49 83 c4 01          	add    r12,0x1
   24f61:	49 89 c5             	mov    r13,rax
   24f64:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24f68:	ff e0                	jmp    rax
   24f6a:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20465
   24f6e:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20464
   24f75:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:181
   24f7a:	45 8b 34 24          	mov    r14d,DWORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20465
   24f7e:	4c 89 68 30          	mov    QWORD PTR [rax+0x30],r13
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6151
   24f82:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6152
   24f89:	44 89 f1             	mov    ecx,r14d
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6151
   24f8c:	48 8b 80 90 01 00 00 	mov    rax,QWORD PTR [rax+0x190]
   24f93:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6152
   24f97:	8b 42 18             	mov    eax,DWORD PTR [rdx+0x18]
   24f9a:	21 c1                	and    ecx,eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6153
   24f9c:	8b 4c 8a 38          	mov    ecx,DWORD PTR [rdx+rcx*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6155
   24fa0:	48 85 c9             	test   rcx,rcx
   24fa3:	0f 84 f6 4e 00 00    	je     29e9f <JS_CallInternal+0x73df>
   24fa9:	48 8d 34 85 34 00 00 	lea    rsi,[rax*4+0x34]
   24fb0:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6156
   24fb1:	48 8d 04 ce          	lea    rax,[rsi+rcx*8]
   24fb5:	48 01 d0             	add    rax,rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6157 (discriminator 1)
   24fb8:	44 3b 70 04          	cmp    r14d,DWORD PTR [rax+0x4]
   24fbc:	0f 85 cf 4e 00 00    	jne    29e91 <JS_CallInternal+0x73d1>
   24fc2:	31 c0                	xor    eax,eax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20470
   24fc4:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20472
   24fc7:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20470
   24fcb:	48 83 c3 10          	add    rbx,0x10
   24fcf:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   24fd6:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20472
   24fd7:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24fdd:	49 89 c5             	mov    r13,rax
   24fe0:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24fe4:	ff e0                	jmp    rax
   24fe6:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20453
   24fea:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
js_operator_delete():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16100
   24ff1:	4c 8b 6b f0          	mov    r13,QWORD PTR [rbx-0x10]
   24ff5:	4c 8b 73 f8          	mov    r14,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16099
   24ff9:	48 8b 4b e8          	mov    rcx,QWORD PTR [rbx-0x18]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20453
   24ffd:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
js_operator_delete():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16101
   25001:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   25008:	4c 89 ee             	mov    rsi,r13
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16099
   2500b:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16101
   2500f:	4c 89 f2             	mov    rdx,r14
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16099
   25012:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   25019:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16101
   25020:	e8 3b ea 01 00       	call   43a60 <JS_ValueToAtom>
   25025:	89 c1                	mov    ecx,eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16102 (discriminator 1)
   25027:	85 c0                	test   eax,eax
   25029:	0f 84 31 e2 ff ff    	je     23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16104
   2502f:	48 8b b5 40 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c0]
   25036:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
   2503d:	41 b8 00 80 00 00    	mov    r8d,0x8000
   25043:	89 85 38 fe ff ff    	mov    DWORD PTR [rbp-0x1c8],eax
   25049:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   25050:	e8 9b 60 02 00       	call   4b0f0 <JS_DeleteProperty>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3735 (discriminator 1)
   25055:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
js_operator_delete():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16104
   2505b:	41 89 c0             	mov    r8d,eax
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3735 (discriminator 1)
   2505e:	81 f9 f2 00 00 00    	cmp    ecx,0xf2
   25064:	0f 8f d6 4e 00 00    	jg     29f40 <JS_CallInternal+0x7480>
js_operator_delete():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16106 (discriminator 1)
   2506a:	45 85 c0             	test   r8d,r8d
   2506d:	0f 88 ed e1 ff ff    	js     23260 <JS_CallInternal+0x7a0>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   25073:	83 bd 50 fe ff ff f6 	cmp    DWORD PTR [rbp-0x1b0],0xfffffff6
   2507a:	76 1e                	jbe    2509a <JS_CallInternal+0x25da>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   2507c:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   25083:	8b 41 fc             	mov    eax,DWORD PTR [rcx-0x4]
   25086:	89 85 38 fe ff ff    	mov    DWORD PTR [rbp-0x1c8],eax
   2508c:	83 e8 01             	sub    eax,0x1
   2508f:	89 41 fc             	mov    DWORD PTR [rcx-0x4],eax
   25092:	85 c0                	test   eax,eax
   25094:	0f 8e 50 61 00 00    	jle    2b1ea <JS_CallInternal+0x872a>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   2509a:	41 83 fe f6          	cmp    r14d,0xfffffff6
   2509e:	76 13                	jbe    250b3 <JS_CallInternal+0x25f3>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   250a0:	41 8b 45 fc          	mov    eax,DWORD PTR [r13-0x4]
   250a4:	83 e8 01             	sub    eax,0x1
   250a7:	41 89 45 fc          	mov    DWORD PTR [r13-0x4],eax
   250ab:	85 c0                	test   eax,eax
   250ad:	0f 8e 0e 61 00 00    	jle    2b1c1 <JS_CallInternal+0x8701>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   250b3:	31 c0                	xor    eax,eax
   250b5:	45 85 c0             	test   r8d,r8d
js_operator_delete():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16110
   250b8:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   250bf:	00 
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   250c0:	0f 95 c0             	setne  al
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20456
   250c3:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20457
   250c7:	49 83 c4 01          	add    r12,0x1
js_operator_delete():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16110
   250cb:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20457
   250cf:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   250d5:	49 89 c5             	mov    r13,rax
   250d8:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   250dc:	ff e0                	jmp    rax
   250de:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18069
   250e2:	48 8b 43 d8          	mov    rax,QWORD PTR [rbx-0x28]
   250e6:	48 8b 53 d0          	mov    rdx,QWORD PTR [rbx-0x30]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   250ea:	83 f8 f6             	cmp    eax,0xfffffff6
   250ed:	76 04                	jbe    250f3 <JS_CallInternal+0x2633>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   250ef:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18069
   250f3:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18070
   250f7:	48 8b 43 e8          	mov    rax,QWORD PTR [rbx-0x18]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18069
   250fb:	48 89 13             	mov    QWORD PTR [rbx],rdx
   250fe:	48 8b 53 e0          	mov    rdx,QWORD PTR [rbx-0x20]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   25102:	83 f8 f6             	cmp    eax,0xfffffff6
   25105:	76 04                	jbe    2510b <JS_CallInternal+0x264b>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   25107:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18070
   2510b:	48 89 43 18          	mov    QWORD PTR [rbx+0x18],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18071
   2510f:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18070
   25113:	48 89 53 10          	mov    QWORD PTR [rbx+0x10],rdx
   25117:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   2511b:	83 f8 f6             	cmp    eax,0xfffffff6
   2511e:	76 04                	jbe    25124 <JS_CallInternal+0x2664>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   25120:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18071
   25124:	48 89 53 20          	mov    QWORD PTR [rbx+0x20],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18073
   25128:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18072
   2512c:	48 83 c3 30          	add    rbx,0x30
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18071
   25130:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18073
   25134:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2513a:	49 89 c5             	mov    r13,rax
   2513d:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25141:	ff e0                	jmp    rax
   25143:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18064
   25147:	48 8b 43 e8          	mov    rax,QWORD PTR [rbx-0x18]
   2514b:	48 8b 53 e0          	mov    rdx,QWORD PTR [rbx-0x20]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   2514f:	83 f8 f6             	cmp    eax,0xfffffff6
   25152:	76 04                	jbe    25158 <JS_CallInternal+0x2698>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   25154:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18064
   25158:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18065
   2515c:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18064
   25160:	48 89 13             	mov    QWORD PTR [rbx],rdx
   25163:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   25167:	83 f8 f6             	cmp    eax,0xfffffff6
   2516a:	76 04                	jbe    25170 <JS_CallInternal+0x26b0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   2516c:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18065
   25170:	48 89 53 10          	mov    QWORD PTR [rbx+0x10],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18067
   25174:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18066
   25178:	48 83 c3 20          	add    rbx,0x20
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18065
   2517c:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18067
   25180:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   25186:	49 89 c5             	mov    r13,rax
   25189:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2518d:	ff e0                	jmp    rax
   2518f:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18060
   25193:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   25197:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   2519b:	83 f8 f6             	cmp    eax,0xfffffff6
   2519e:	76 04                	jbe    251a4 <JS_CallInternal+0x26e4>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   251a0:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18060
   251a4:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18062
   251a7:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18061
   251ab:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18060
   251af:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18062
   251b3:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   251b9:	49 89 c5             	mov    r13,rax
   251bc:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   251c0:	ff e0                	jmp    rax
   251c2:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18054
   251c6:	48 8b 53 d8          	mov    rdx,QWORD PTR [rbx-0x28]
   251ca:	48 8b 73 d0          	mov    rsi,QWORD PTR [rbx-0x30]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   251ce:	83 fa f6             	cmp    edx,0xfffffff6
   251d1:	76 11                	jbe    251e4 <JS_CallInternal+0x2724>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   251d3:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   251d6:	83 e8 01             	sub    eax,0x1
   251d9:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   251dc:	85 c0                	test   eax,eax
   251de:	0f 8e ac 53 00 00    	jle    2a590 <JS_CallInternal+0x7ad0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18055
   251e4:	f3 0f 6f 73 e0       	movdqu xmm6,XMMWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18056
   251e9:	f3 0f 6f 7b f0       	movdqu xmm7,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18058
   251ee:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18057
   251f2:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18055
   251f6:	0f 11 73 e0          	movups XMMWORD PTR [rbx-0x20],xmm6
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18056
   251fa:	0f 11 7b f0          	movups XMMWORD PTR [rbx-0x10],xmm7
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18058
   251fe:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   25204:	49 89 c5             	mov    r13,rax
   25207:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2520b:	ff e0                	jmp    rax
   2520d:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18049
   25211:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   25215:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   25219:	83 fa f6             	cmp    edx,0xfffffff6
   2521c:	76 11                	jbe    2522f <JS_CallInternal+0x276f>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   2521e:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25221:	83 e8 01             	sub    eax,0x1
   25224:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25227:	85 c0                	test   eax,eax
   25229:	0f 8e 4c 53 00 00    	jle    2a57b <JS_CallInternal+0x7abb>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18050
   2522f:	f3 0f 6f 6b f0       	movdqu xmm5,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18052
   25234:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18051
   25238:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18050
   2523c:	0f 11 6b f0          	movups XMMWORD PTR [rbx-0x10],xmm5
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18052
   25240:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   25246:	49 89 c5             	mov    r13,rax
   25249:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2524d:	ff e0                	jmp    rax
   2524f:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18045
   25253:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   25257:	48 83 eb 10          	sub    rbx,0x10
   2525b:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   2525e:	83 fa f6             	cmp    edx,0xfffffff6
   25261:	76 11                	jbe    25274 <JS_CallInternal+0x27b4>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   25263:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25266:	83 e8 01             	sub    eax,0x1
   25269:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2526c:	85 c0                	test   eax,eax
   2526e:	0f 8e 31 53 00 00    	jle    2a5a5 <JS_CallInternal+0x7ae5>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18047
   25274:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25279:	49 83 c4 01          	add    r12,0x1
   2527d:	49 89 c5             	mov    r13,rax
   25280:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25284:	ff e0                	jmp    rax
   25286:	f3 0f 1e fa          	endbr64
min_int():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:90
   2528a:	8b 8d bc fe ff ff    	mov    ecx,DWORD PTR [rbp-0x144]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18035 (discriminator 1)
   25290:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18036
   25295:	4d 8d 6c 24 02       	lea    r13,[r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18038
   2529a:	4c 8d 73 10          	lea    r14,[rbx+0x10]
   2529e:	48 8b bd a8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x158]
min_int():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:90
   252a5:	39 c8                	cmp    eax,ecx
   252a7:	0f 4f c1             	cmovg  eax,ecx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18038
   252aa:	48 63 d0             	movsxd rdx,eax
   252ad:	29 c1                	sub    ecx,eax
   252af:	48 c1 e2 04          	shl    rdx,0x4
   252b3:	89 ce                	mov    esi,ecx
   252b5:	48 01 fa             	add    rdx,rdi
   252b8:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   252bf:	e8 0c 4a 02 00       	call   49cd0 <js_create_array>
   252c4:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18039 (discriminator 2)
   252c8:	83 7b 08 06          	cmp    DWORD PTR [rbx+0x8],0x6
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18038
   252cc:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18039 (discriminator 2)
   252cf:	0f 84 0b 65 00 00    	je     2b7e0 <JS_CallInternal+0x8d20>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18042
   252d5:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18038
   252db:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18042
   252de:	49 83 c4 03          	add    r12,0x3
   252e2:	49 89 c5             	mov    r13,rax
   252e5:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   252e9:	ff e0                	jmp    rax
   252eb:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17990
   252ef:	41 80 3c 24 06       	cmp    BYTE PTR [r12],0x6
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17989
   252f4:	4d 8d 74 24 01       	lea    r14,[r12+0x1]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17990
   252f9:	0f 87 c5 cc fe ff    	ja     11fc4 <JS_CallInternal.cold>
   252ff:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25304:	48 8d 15 ed 1d 0b 00 	lea    rdx,[rip+0xb1ded]        # d70f8 <qjsc_repl_size+0x46c>
   2530b:	48 63 04 82          	movsxd rax,DWORD PTR [rdx+rax*4]
   2530f:	48 01 d0             	add    rax,rdx
   25312:	3e ff e0             	notrack jmp rax
JS_NewObjectProto():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:5847
   25315:	31 f6                	xor    esi,esi
   25317:	b9 01 00 00 00       	mov    ecx,0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18019
   2531c:	4c 8d 6b 10          	lea    r13,[rbx+0x10]
JS_NewObjectProto():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:5847
   25320:	ba 02 00 00 00       	mov    edx,0x2
   25325:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2532c:	e8 3f 16 02 00       	call   46970 <JS_NewObjectProtoClass>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18019
   25331:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18020 (discriminator 2)
   25335:	83 7b 08 06          	cmp    DWORD PTR [rbx+0x8],0x6
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18019
   25339:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18020 (discriminator 2)
   2533c:	0f 84 e9 00 00 00    	je     2542b <JS_CallInternal+0x296b>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18024
   25342:	4c 89 eb             	mov    rbx,r13
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18032
   25345:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
   2534b:	49 83 c4 02          	add    r12,0x2
   2534f:	49 89 c5             	mov    r13,rax
   25352:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25356:	ff e0                	jmp    rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18011
   25358:	48 8b 85 60 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1a0]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17901 (discriminator 1)
   2535f:	48 8d 53 10          	lea    rdx,[rbx+0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18011
   25363:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18012 (discriminator 1)
   25367:	48 85 c0             	test   rax,rax
   2536a:	0f 84 67 74 00 00    	je     2c7d7 <JS_CallInternal+0x9d17>
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   25370:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18015
   25374:	48 89 03             	mov    QWORD PTR [rbx],rax
   25377:	48 c7 43 08 ff ff ff 	mov    QWORD PTR [rbx+0x8],0xffffffffffffffff
   2537e:	ff 
   2537f:	48 89 d3             	mov    rbx,rdx
   25382:	eb c1                	jmp    25345 <JS_CallInternal+0x2885>
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   25384:	83 bd 80 fe ff ff f6 	cmp    DWORD PTR [rbp-0x180],0xfffffff6
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18006
   2538b:	48 8d 43 10          	lea    rax,[rbx+0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   2538f:	76 0b                	jbe    2539c <JS_CallInternal+0x28dc>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   25391:	48 8b 8d 70 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x190]
   25398:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18006
   2539c:	48 8b 8d 70 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x190]
   253a3:	48 89 0b             	mov    QWORD PTR [rbx],rcx
   253a6:	48 8b 8d 80 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x180]
   253ad:	48 89 4b 08          	mov    QWORD PTR [rbx+0x8],rcx
   253b1:	48 89 c3             	mov    rbx,rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18007
   253b4:	eb 8f                	jmp    25345 <JS_CallInternal+0x2885>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18003
   253b6:	48 8b bd c8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x138]
   253bd:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   253c1:	48 8b 57 10          	mov    rdx,QWORD PTR [rdi+0x10]
   253c5:	48 8b 47 08          	mov    rax,QWORD PTR [rdi+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   253c9:	83 fa f6             	cmp    edx,0xfffffff6
   253cc:	76 04                	jbe    253d2 <JS_CallInternal+0x2912>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   253ce:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18003
   253d2:	48 89 03             	mov    QWORD PTR [rbx],rax
   253d5:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
   253d9:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18004
   253dc:	e9 64 ff ff ff       	jmp    25345 <JS_CallInternal+0x2885>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17997
   253e1:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17997 (discriminator 1)
   253e8:	48 8b 8d c8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x138]
   253ef:	4c 8d 6b 10          	lea    r13,[rbx+0x10]
   253f3:	48 8b 95 a8 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x158]
   253fa:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17997
   25401:	44 0f b7 40 38       	movzx  r8d,WORD PTR [rax+0x38]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17997 (discriminator 1)
   25406:	8b 85 bc fe ff ff    	mov    eax,DWORD PTR [rbp-0x144]
   2540c:	41 39 c0             	cmp    r8d,eax
   2540f:	89 c6                	mov    esi,eax
   25411:	44 0f 4f c0          	cmovg  r8d,eax
   25415:	e8 86 67 02 00       	call   4bba0 <js_build_mapped_arguments>
   2541a:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17999 (discriminator 2)
   2541e:	83 7b 08 06          	cmp    DWORD PTR [rbx+0x8],0x6
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17997 (discriminator 1)
   25422:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17999 (discriminator 2)
   25425:	0f 85 17 ff ff ff    	jne    25342 <JS_CallInternal+0x2882>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18036
   2542b:	4c 89 eb             	mov    rbx,r13
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17989
   2542e:	4d 89 f4             	mov    r12,r14
   25431:	e9 2a de ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17992
   25436:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:562
   2543d:	8b 85 bc fe ff ff    	mov    eax,DWORD PTR [rbp-0x144]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17992
   25443:	4c 8d 6b 10          	lea    r13,[rbx+0x10]
js_build_arguments():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16182
   25447:	48 c7 85 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],0x0
   2544e:	00 00 00 00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16183
   25452:	48 8b 91 58 01 00 00 	mov    rdx,QWORD PTR [rcx+0x158]
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:562
   25459:	48 89 85 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],rax
   25460:	48 8b 81 50 01 00 00 	mov    rax,QWORD PTR [rcx+0x150]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   25467:	83 fa f6             	cmp    edx,0xfffffff6
   2546a:	76 04                	jbe    25470 <JS_CallInternal+0x29b0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   2546c:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:713
   25470:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
js_build_arguments():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16183
   25477:	48 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rax
   2547e:	48 89 95 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16184
   25485:	48 8b 81 60 01 00 00 	mov    rax,QWORD PTR [rcx+0x160]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   2548c:	83 b9 68 01 00 00 f6 	cmp    DWORD PTR [rcx+0x168],0xfffffff6
js_build_arguments():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16184 (discriminator 1)
   25493:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   2549a:	76 04                	jbe    254a0 <JS_CallInternal+0x29e0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   2549c:	83 40 fc 02          	add    DWORD PTR [rax-0x4],0x2
js_build_arguments():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16187
   254a0:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16187 (discriminator 1)
   254a7:	48 8d 8d 50 ff ff ff 	lea    rcx,[rbp-0xb0]
   254ae:	ba 08 00 00 00       	mov    edx,0x8
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16185 (discriminator 1)
   254b3:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16187
   254ba:	48 8b 77 38          	mov    rsi,QWORD PTR [rdi+0x38]
js_dup_shape():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:5305 (discriminator 1)
   254be:	83 46 fc 01          	add    DWORD PTR [rsi-0x4],0x1
js_build_arguments():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16187 (discriminator 1)
   254c2:	e8 29 0f 02 00       	call   463f0 <JS_NewObjectFromShape>
   254c7:	49 89 c1             	mov    r9,rax
   254ca:	48 89 d1             	mov    rcx,rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16189 (discriminator 1)
   254cd:	83 fa 06             	cmp    edx,0x6
   254d0:	0f 84 13 73 00 00    	je     2c7e9 <JS_CallInternal+0x9d29>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16195
   254d6:	8b bd bc fe ff ff    	mov    edi,DWORD PTR [rbp-0x144]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16194
   254dc:	31 c0                	xor    eax,eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16195
   254de:	85 ff                	test   edi,edi
   254e0:	0f 8f 3b 6a 00 00    	jg     2bf21 <JS_CallInternal+0x9461>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16203
   254e6:	49 89 41 30          	mov    QWORD PTR [r9+0x30],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16204
   254ea:	8b 85 bc fe ff ff    	mov    eax,DWORD PTR [rbp-0x144]
   254f0:	41 89 41 38          	mov    DWORD PTR [r9+0x38],eax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17992
   254f4:	4c 89 0b             	mov    QWORD PTR [rbx],r9
   254f7:	48 89 4b 08          	mov    QWORD PTR [rbx+0x8],rcx
   254fb:	4c 89 eb             	mov    rbx,r13
   254fe:	e9 42 fe ff ff       	jmp    25345 <JS_CallInternal+0x2885>
js_import_meta():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:30936
   25503:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2550a:	31 f6                	xor    esi,esi
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18024
   2550c:	4c 8d 6b 10          	lea    r13,[rbx+0x10]
js_import_meta():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:30936
   25510:	e8 5b d4 ff ff       	call   22970 <JS_GetScriptOrModuleName>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:30937
   25515:	85 c0                	test   eax,eax
   25517:	0f 84 88 67 00 00    	je     2bca5 <JS_CallInternal+0x91e5>
js_find_loaded_module():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:30026
   2551d:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   25524:	48 8b 91 b8 01 00 00 	mov    rdx,QWORD PTR [rcx+0x1b8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:30026 (discriminator 1)
   2552b:	48 81 c1 b0 01 00 00 	add    rcx,0x1b0
   25532:	48 39 d1             	cmp    rcx,rdx
   25535:	75 16                	jne    2554d <JS_CallInternal+0x2a8d>
   25537:	e9 c2 75 00 00       	jmp    2cafe <JS_CallInternal+0xa03e>
   2553c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:30026 (discriminator 2)
   25540:	48 8b 52 08          	mov    rdx,QWORD PTR [rdx+0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:30026 (discriminator 1)
   25544:	48 39 d1             	cmp    rcx,rdx
   25547:	0f 84 0e 67 00 00    	je     2bc5b <JS_CallInternal+0x919b>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:30028
   2554d:	3b 42 f8             	cmp    eax,DWORD PTR [rdx-0x8]
   25550:	75 ee                	jne    25540 <JS_CallInternal+0x2a80>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:30027
   25552:	48 83 ea 18          	sub    rdx,0x18
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3735 (discriminator 1)
   25556:	3d f2 00 00 00       	cmp    eax,0xf2
   2555b:	0f 8f 03 67 00 00    	jg     2bc64 <JS_CallInternal+0x91a4>
js_import_meta():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:30949
   25561:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   25568:	48 89 d6             	mov    rsi,rdx
   2556b:	e8 d0 d4 ff ff       	call   22a40 <JS_GetImportMeta>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18024
   25570:	48 89 03             	mov    QWORD PTR [rbx],rax
   25573:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18025 (discriminator 2)
   25577:	83 fa 06             	cmp    edx,0x6
   2557a:	0f 85 c2 fd ff ff    	jne    25342 <JS_CallInternal+0x2882>
   25580:	e9 a6 fe ff ff       	jmp    2542b <JS_CallInternal+0x296b>
   25585:	0f 1f 00             	nop    DWORD PTR [rax]
   25588:	f3 0f 1e fa          	endbr64
JS_NewObject():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:5859
   2558c:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   25593:	b9 01 00 00 00       	mov    ecx,0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17983
   25598:	4c 8d 73 10          	lea    r14,[rbx+0x10]
JS_NewObject():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:5859
   2559c:	48 8b 47 58          	mov    rax,QWORD PTR [rdi+0x58]
   255a0:	48 8b 70 10          	mov    rsi,QWORD PTR [rax+0x10]
   255a4:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
   255a8:	e8 c3 13 02 00       	call   46970 <JS_NewObjectProtoClass>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17983
   255ad:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17984 (discriminator 2)
   255b1:	83 7b 08 06          	cmp    DWORD PTR [rbx+0x8],0x6
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17983
   255b5:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17984 (discriminator 2)
   255b8:	0f 84 0c 58 00 00    	je     2adca <JS_CallInternal+0x830a>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17986
   255be:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17983
   255c3:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17986
   255c6:	49 83 c4 01          	add    r12,0x1
   255ca:	49 89 c5             	mov    r13,rax
   255cd:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   255d1:	ff e0                	jmp    rax
   255d3:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17980
   255d7:	48 c7 03 01 00 00 00 	mov    QWORD PTR [rbx],0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17981
   255de:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17980
   255e2:	48 83 c3 10          	add    rbx,0x10
   255e6:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   255ed:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17981
   255ee:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   255f4:	49 89 c5             	mov    r13,rax
   255f7:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   255fb:	ff e0                	jmp    rax
   255fd:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17977
   25601:	48 c7 03 00 00 00 00 	mov    QWORD PTR [rbx],0x0
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17978
   25608:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17977
   2560c:	48 83 c3 10          	add    rbx,0x10
   25610:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   25617:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17978
   25618:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2561e:	49 89 c5             	mov    r13,rax
   25621:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25625:	ff e0                	jmp    rax
   25627:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17958
   2562b:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
   25632:	f6 40 10 01          	test   BYTE PTR [rax+0x10],0x1
   25636:	0f 85 76 3f 00 00    	jne    295b2 <JS_CallInternal+0x6af2>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17960 (discriminator 1)
   2563c:	83 bd 88 fe ff ff ff 	cmp    DWORD PTR [rbp-0x178],0xffffffff
   25643:	0f 85 9b 69 00 00    	jne    2bfe4 <JS_CallInternal+0x9524>
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   25649:	48 8b 85 78 fe ff ff 	mov    rax,QWORD PTR [rbp-0x188]
   25650:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17911
   25654:	48 8b 85 88 fe ff ff 	mov    rax,QWORD PTR [rbp-0x178]
   2565b:	48 8b 8d 78 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x188]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17973
   25662:	48 89 0b             	mov    QWORD PTR [rbx],rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17975
   25665:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17973
   25669:	48 83 c3 10          	add    rbx,0x10
   2566d:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17975
   25671:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   25677:	49 89 c5             	mov    r13,rax
   2567a:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2567e:	ff e0                	jmp    rax
   25680:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19458
   25684:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   25688:	48 8b 7b e8          	mov    rdi,QWORD PTR [rbx-0x18]
   2568c:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   25690:	4c 8b 43 f8          	mov    r8,QWORD PTR [rbx-0x8]
   25694:	49 89 f5             	mov    r13,rsi
   25697:	49 89 fe             	mov    r14,rdi
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19458 (discriminator 1)
   2569a:	83 ff ff             	cmp    edi,0xffffffff
   2569d:	0f 85 dd 42 00 00    	jne    29980 <JS_CallInternal+0x6ec0>
   256a3:	45 85 c0             	test   r8d,r8d
   256a6:	0f 85 d4 42 00 00    	jne    29980 <JS_CallInternal+0x6ec0>
   256ac:	66 83 7e 12 02       	cmp    WORD PTR [rsi+0x12],0x2
   256b1:	0f 85 c9 42 00 00    	jne    29980 <JS_CallInternal+0x6ec0>
   256b7:	3b 4e 38             	cmp    ecx,DWORD PTR [rsi+0x38]
   256ba:	0f 83 c0 42 00 00    	jae    29980 <JS_CallInternal+0x6ec0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19458 (discriminator 9)
   256c0:	89 c8                	mov    eax,ecx
   256c2:	48 c1 e0 04          	shl    rax,0x4
   256c6:	48 03 46 30          	add    rax,QWORD PTR [rsi+0x30]
   256ca:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   256cd:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   256d1:	83 f8 f6             	cmp    eax,0xfffffff6
   256d4:	76 04                	jbe    256da <JS_CallInternal+0x2c1a>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   256d6:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   256da:	41 83 fe f6          	cmp    r14d,0xfffffff6
   256de:	76 13                	jbe    256f3 <JS_CallInternal+0x2c33>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   256e0:	41 8b 7d fc          	mov    edi,DWORD PTR [r13-0x4]
   256e4:	8d 57 ff             	lea    edx,[rdi-0x1]
   256e7:	41 89 55 fc          	mov    DWORD PTR [r13-0x4],edx
   256eb:	85 d2                	test   edx,edx
   256ed:	0f 8e e8 53 00 00    	jle    2aadb <JS_CallInternal+0x801b>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19458 (discriminator 1)
   256f3:	48 89 4b e0          	mov    QWORD PTR [rbx-0x20],rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19459
   256f7:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19458 (discriminator 1)
   256fb:	48 83 eb 10          	sub    rbx,0x10
   256ff:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19459
   25703:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   25709:	49 89 c5             	mov    r13,rax
   2570c:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25710:	ff e0                	jmp    rax
   25712:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18638
   25716:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   2571d:	f3 0f 6f 73 f0       	movdqu xmm6,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18638
   25722:	48 83 eb 10          	sub    rbx,0x10
   25726:	48 8b 00             	mov    rax,QWORD PTR [rax]
   25729:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   2572d:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   25731:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   25734:	0f 11 30             	movups XMMWORD PTR [rax],xmm6
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   25737:	83 fa f6             	cmp    edx,0xfffffff6
   2573a:	76 11                	jbe    2574d <JS_CallInternal+0x2c8d>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   2573c:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2573f:	83 e8 01             	sub    eax,0x1
   25742:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25745:	85 c0                	test   eax,eax
   25747:	0f 8e d1 4d 00 00    	jle    2a51e <JS_CallInternal+0x7a5e>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18638 (discriminator 1)
   2574d:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25752:	49 83 c4 01          	add    r12,0x1
   25756:	49 89 c5             	mov    r13,rax
   25759:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2575d:	ff e0                	jmp    rax
   2575f:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18636
   25763:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   2576a:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   2576e:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
   25772:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   25776:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   25779:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   2577d:	83 f8 f6             	cmp    eax,0xfffffff6
   25780:	76 04                	jbe    25786 <JS_CallInternal+0x2cc6>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   25782:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18636
   25786:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18636 (discriminator 1)
   25789:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18636
   2578d:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18636 (discriminator 1)
   25791:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18636
   25797:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18636 (discriminator 1)
   2579a:	49 89 c5             	mov    r13,rax
   2579d:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   257a1:	ff e0                	jmp    rax
   257a3:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18635
   257a7:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   257ae:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   257b2:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   257b6:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   257ba:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   257bd:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   257c1:	83 f8 f6             	cmp    eax,0xfffffff6
   257c4:	76 04                	jbe    257ca <JS_CallInternal+0x2d0a>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   257c6:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18635
   257ca:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18635 (discriminator 1)
   257cd:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18635
   257d1:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18635 (discriminator 1)
   257d5:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18635
   257db:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18635 (discriminator 1)
   257de:	49 89 c5             	mov    r13,rax
   257e1:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   257e5:	ff e0                	jmp    rax
   257e7:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18637
   257eb:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   257f2:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   257f6:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   257fa:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   257fe:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   25801:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   25805:	83 f8 f6             	cmp    eax,0xfffffff6
   25808:	76 04                	jbe    2580e <JS_CallInternal+0x2d4e>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   2580a:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18637
   2580e:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18637 (discriminator 1)
   25811:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18637
   25815:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18637 (discriminator 1)
   25819:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18637
   2581f:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18637 (discriminator 1)
   25822:	49 89 c5             	mov    r13,rax
   25825:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25829:	ff e0                	jmp    rax
   2582b:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18634
   2582f:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   25836:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   2583a:	48 8b 00             	mov    rax,QWORD PTR [rax]
   2583d:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   25841:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   25844:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   25848:	83 f8 f6             	cmp    eax,0xfffffff6
   2584b:	76 04                	jbe    25851 <JS_CallInternal+0x2d91>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   2584d:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18634
   25851:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18634 (discriminator 1)
   25854:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18634
   25858:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18634 (discriminator 1)
   2585c:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18634
   25862:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18634 (discriminator 1)
   25865:	49 89 c5             	mov    r13,rax
   25868:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2586c:	ff e0                	jmp    rax
   2586e:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18633
   25872:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   25876:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   2587a:	83 f8 f6             	cmp    eax,0xfffffff6
   2587d:	76 04                	jbe    25883 <JS_CallInternal+0x2dc3>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   2587f:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   25883:	48 8b bd 90 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x170]
   2588a:	48 8b 4f 38          	mov    rcx,QWORD PTR [rdi+0x38]
   2588e:	48 8b 77 30          	mov    rsi,QWORD PTR [rdi+0x30]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   25892:	48 89 47 38          	mov    QWORD PTR [rdi+0x38],rax
   25896:	48 89 57 30          	mov    QWORD PTR [rdi+0x30],rdx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   2589a:	83 f9 f6             	cmp    ecx,0xfffffff6
   2589d:	76 11                	jbe    258b0 <JS_CallInternal+0x2df0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   2589f:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   258a2:	83 e8 01             	sub    eax,0x1
   258a5:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   258a8:	85 c0                	test   eax,eax
   258aa:	0f 8e 83 4c 00 00    	jle    2a533 <JS_CallInternal+0x7a73>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18633 (discriminator 2)
   258b0:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   258b5:	49 83 c4 01          	add    r12,0x1
   258b9:	49 89 c5             	mov    r13,rax
   258bc:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   258c0:	ff e0                	jmp    rax
   258c2:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18632
   258c6:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   258ca:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   258ce:	83 f8 f6             	cmp    eax,0xfffffff6
   258d1:	76 04                	jbe    258d7 <JS_CallInternal+0x2e17>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   258d3:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   258d7:	48 8b bd 90 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x170]
   258de:	48 8b 4f 28          	mov    rcx,QWORD PTR [rdi+0x28]
   258e2:	48 8b 77 20          	mov    rsi,QWORD PTR [rdi+0x20]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   258e6:	48 89 47 28          	mov    QWORD PTR [rdi+0x28],rax
   258ea:	48 89 57 20          	mov    QWORD PTR [rdi+0x20],rdx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   258ee:	83 f9 f6             	cmp    ecx,0xfffffff6
   258f1:	76 11                	jbe    25904 <JS_CallInternal+0x2e44>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   258f3:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   258f6:	83 e8 01             	sub    eax,0x1
   258f9:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   258fc:	85 c0                	test   eax,eax
   258fe:	0f 8e 47 4c 00 00    	jle    2a54b <JS_CallInternal+0x7a8b>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18632 (discriminator 2)
   25904:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25909:	49 83 c4 01          	add    r12,0x1
   2590d:	49 89 c5             	mov    r13,rax
   25910:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25914:	ff e0                	jmp    rax
   25916:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18631
   2591a:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   2591e:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   25922:	83 f8 f6             	cmp    eax,0xfffffff6
   25925:	76 04                	jbe    2592b <JS_CallInternal+0x2e6b>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   25927:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   2592b:	48 8b bd 90 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x170]
   25932:	48 8b 4f 18          	mov    rcx,QWORD PTR [rdi+0x18]
   25936:	48 8b 77 10          	mov    rsi,QWORD PTR [rdi+0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   2593a:	48 89 47 18          	mov    QWORD PTR [rdi+0x18],rax
   2593e:	48 89 57 10          	mov    QWORD PTR [rdi+0x10],rdx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   25942:	83 f9 f6             	cmp    ecx,0xfffffff6
   25945:	76 11                	jbe    25958 <JS_CallInternal+0x2e98>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   25947:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2594a:	83 e8 01             	sub    eax,0x1
   2594d:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25950:	85 c0                	test   eax,eax
   25952:	0f 8e 0b 4c 00 00    	jle    2a563 <JS_CallInternal+0x7aa3>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18631 (discriminator 2)
   25958:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   2595d:	49 83 c4 01          	add    r12,0x1
   25961:	49 89 c5             	mov    r13,rax
   25964:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25968:	ff e0                	jmp    rax
   2596a:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18630
   2596e:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   25972:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   25976:	83 f8 f6             	cmp    eax,0xfffffff6
   25979:	76 04                	jbe    2597f <JS_CallInternal+0x2ebf>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   2597b:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   2597f:	48 8b bd 90 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x170]
   25986:	48 8b 4f 08          	mov    rcx,QWORD PTR [rdi+0x8]
   2598a:	48 8b 37             	mov    rsi,QWORD PTR [rdi]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   2598d:	48 89 47 08          	mov    QWORD PTR [rdi+0x8],rax
   25991:	48 89 17             	mov    QWORD PTR [rdi],rdx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   25994:	83 f9 f6             	cmp    ecx,0xfffffff6
   25997:	76 11                	jbe    259aa <JS_CallInternal+0x2eea>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   25999:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2599c:	83 e8 01             	sub    eax,0x1
   2599f:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   259a2:	85 c0                	test   eax,eax
   259a4:	0f 8e 2d 4d 00 00    	jle    2a6d7 <JS_CallInternal+0x7c17>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18630 (discriminator 2)
   259aa:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   259af:	49 83 c4 01          	add    r12,0x1
   259b3:	49 89 c5             	mov    r13,rax
   259b6:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   259ba:	ff e0                	jmp    rax
   259bc:	f3 0f 1e fa          	endbr64
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   259c0:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   259c7:	f3 0f 6f 4b f0       	movdqu xmm1,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18626
   259cc:	48 83 eb 10          	sub    rbx,0x10
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   259d0:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   259d4:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   259d7:	0f 11 08             	movups XMMWORD PTR [rax],xmm1
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   259da:	83 fa f6             	cmp    edx,0xfffffff6
   259dd:	76 11                	jbe    259f0 <JS_CallInternal+0x2f30>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   259df:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   259e2:	83 e8 01             	sub    eax,0x1
   259e5:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   259e8:	85 c0                	test   eax,eax
   259ea:	0f 8e d2 4c 00 00    	jle    2a6c2 <JS_CallInternal+0x7c02>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18626 (discriminator 1)
   259f0:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   259f5:	49 83 c4 01          	add    r12,0x1
   259f9:	49 89 c5             	mov    r13,rax
   259fc:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25a00:	ff e0                	jmp    rax
   25a02:	f3 0f 1e fa          	endbr64
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   25a06:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   25a0d:	f3 0f 6f 53 f0       	movdqu xmm2,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18628
   25a12:	48 83 eb 10          	sub    rbx,0x10
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   25a16:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
   25a1a:	48 8b 70 20          	mov    rsi,QWORD PTR [rax+0x20]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   25a1e:	0f 11 50 20          	movups XMMWORD PTR [rax+0x20],xmm2
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   25a22:	83 fa f6             	cmp    edx,0xfffffff6
   25a25:	76 11                	jbe    25a38 <JS_CallInternal+0x2f78>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   25a27:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25a2a:	83 e8 01             	sub    eax,0x1
   25a2d:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25a30:	85 c0                	test   eax,eax
   25a32:	0f 8e 75 4c 00 00    	jle    2a6ad <JS_CallInternal+0x7bed>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18628 (discriminator 1)
   25a38:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25a3d:	49 83 c4 01          	add    r12,0x1
   25a41:	49 89 c5             	mov    r13,rax
   25a44:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25a48:	ff e0                	jmp    rax
   25a4a:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18624
   25a4e:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
   25a55:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   25a59:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
   25a5d:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   25a61:	83 f8 f6             	cmp    eax,0xfffffff6
   25a64:	76 04                	jbe    25a6a <JS_CallInternal+0x2faa>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   25a66:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18624
   25a6a:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18624 (discriminator 1)
   25a6d:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18624
   25a71:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18624 (discriminator 1)
   25a75:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18624
   25a7b:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18624 (discriminator 1)
   25a7e:	49 89 c5             	mov    r13,rax
   25a81:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25a85:	ff e0                	jmp    rax
   25a87:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18623
   25a8b:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
   25a92:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   25a96:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
   25a9a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   25a9e:	83 f8 f6             	cmp    eax,0xfffffff6
   25aa1:	76 04                	jbe    25aa7 <JS_CallInternal+0x2fe7>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   25aa3:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18623
   25aa7:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18623 (discriminator 1)
   25aaa:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18623
   25aae:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18623 (discriminator 1)
   25ab2:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18623
   25ab8:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18623 (discriminator 1)
   25abb:	49 89 c5             	mov    r13,rax
   25abe:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25ac2:	ff e0                	jmp    rax
   25ac4:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18625
   25ac8:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
   25acf:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   25ad3:	48 8b 50 30          	mov    rdx,QWORD PTR [rax+0x30]
   25ad7:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   25adb:	83 f8 f6             	cmp    eax,0xfffffff6
   25ade:	76 04                	jbe    25ae4 <JS_CallInternal+0x3024>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   25ae0:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18625
   25ae4:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18625 (discriminator 1)
   25ae7:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18625
   25aeb:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18625 (discriminator 1)
   25aef:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18625
   25af5:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18625 (discriminator 1)
   25af8:	49 89 c5             	mov    r13,rax
   25afb:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25aff:	ff e0                	jmp    rax
   25b01:	f3 0f 1e fa          	endbr64
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   25b05:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   25b0c:	f3 0f 6f 6b f0       	movdqu xmm5,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18629
   25b11:	48 83 eb 10          	sub    rbx,0x10
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   25b15:	48 8b 50 38          	mov    rdx,QWORD PTR [rax+0x38]
   25b19:	48 8b 70 30          	mov    rsi,QWORD PTR [rax+0x30]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   25b1d:	0f 11 68 30          	movups XMMWORD PTR [rax+0x30],xmm5
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   25b21:	83 fa f6             	cmp    edx,0xfffffff6
   25b24:	76 11                	jbe    25b37 <JS_CallInternal+0x3077>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   25b26:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25b29:	83 e8 01             	sub    eax,0x1
   25b2c:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25b2f:	85 c0                	test   eax,eax
   25b31:	0f 8e 61 4b 00 00    	jle    2a698 <JS_CallInternal+0x7bd8>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18629 (discriminator 1)
   25b37:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25b3c:	49 83 c4 01          	add    r12,0x1
   25b40:	49 89 c5             	mov    r13,rax
   25b43:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25b47:	ff e0                	jmp    rax
   25b49:	f3 0f 1e fa          	endbr64
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   25b4d:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   25b54:	f3 0f 6f 63 f0       	movdqu xmm4,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18627
   25b59:	48 83 eb 10          	sub    rbx,0x10
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   25b5d:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
   25b61:	48 8b 70 10          	mov    rsi,QWORD PTR [rax+0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   25b65:	0f 11 60 10          	movups XMMWORD PTR [rax+0x10],xmm4
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   25b69:	83 fa f6             	cmp    edx,0xfffffff6
   25b6c:	76 11                	jbe    25b7f <JS_CallInternal+0x30bf>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   25b6e:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25b71:	83 e8 01             	sub    eax,0x1
   25b74:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25b77:	85 c0                	test   eax,eax
   25b79:	0f 8e bc 4a 00 00    	jle    2a63b <JS_CallInternal+0x7b7b>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18627 (discriminator 1)
   25b7f:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25b84:	49 83 c4 01          	add    r12,0x1
   25b88:	49 89 c5             	mov    r13,rax
   25b8b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25b8f:	ff e0                	jmp    rax
   25b91:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18654
   25b95:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   25b9a:	48 8b 8d 98 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x168]
   25ba1:	48 8b 04 c1          	mov    rax,QWORD PTR [rcx+rax*8]
   25ba5:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   25ba9:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   25bac:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   25bb0:	83 f8 f6             	cmp    eax,0xfffffff6
   25bb3:	76 04                	jbe    25bb9 <JS_CallInternal+0x30f9>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   25bb5:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18655
   25bb9:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18658
   25bbc:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18656
   25bc0:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18655
   25bc4:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18658
   25bc8:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   25bce:	49 89 c5             	mov    r13,rax
   25bd1:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25bd5:	ff e0                	jmp    rax
   25bd7:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18645
   25bdb:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   25bdf:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   25be3:	83 fa f6             	cmp    edx,0xfffffff6
   25be6:	76 04                	jbe    25bec <JS_CallInternal+0x312c>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   25be8:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18645 (discriminator 1)
   25bec:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   25bf3:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   25bf7:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   25bfb:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   25bff:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   25c02:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
   25c06:	48 89 08             	mov    QWORD PTR [rax],rcx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   25c09:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   25c0d:	76 11                	jbe    25c20 <JS_CallInternal+0x3160>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   25c0f:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25c12:	83 e8 01             	sub    eax,0x1
   25c15:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25c18:	85 c0                	test   eax,eax
   25c1a:	0f 8e 30 4a 00 00    	jle    2a650 <JS_CallInternal+0x7b90>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18645 (discriminator 2)
   25c20:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25c25:	49 83 c4 01          	add    r12,0x1
   25c29:	49 89 c5             	mov    r13,rax
   25c2c:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25c30:	ff e0                	jmp    rax
   25c32:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18644
   25c36:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   25c3a:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   25c3e:	83 fa f6             	cmp    edx,0xfffffff6
   25c41:	76 04                	jbe    25c47 <JS_CallInternal+0x3187>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   25c43:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18644 (discriminator 1)
   25c47:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   25c4e:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
   25c52:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   25c56:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   25c5a:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   25c5d:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
   25c61:	48 89 08             	mov    QWORD PTR [rax],rcx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   25c64:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   25c68:	76 11                	jbe    25c7b <JS_CallInternal+0x31bb>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   25c6a:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25c6d:	83 e8 01             	sub    eax,0x1
   25c70:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25c73:	85 c0                	test   eax,eax
   25c75:	0f 8e ed 49 00 00    	jle    2a668 <JS_CallInternal+0x7ba8>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18644 (discriminator 2)
   25c7b:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25c80:	49 83 c4 01          	add    r12,0x1
   25c84:	49 89 c5             	mov    r13,rax
   25c87:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25c8b:	ff e0                	jmp    rax
   25c8d:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18643
   25c91:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   25c95:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   25c99:	83 fa f6             	cmp    edx,0xfffffff6
   25c9c:	76 04                	jbe    25ca2 <JS_CallInternal+0x31e2>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   25c9e:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18643 (discriminator 1)
   25ca2:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   25ca9:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   25cad:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   25cb1:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   25cb5:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   25cb8:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
   25cbc:	48 89 08             	mov    QWORD PTR [rax],rcx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   25cbf:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   25cc3:	76 11                	jbe    25cd6 <JS_CallInternal+0x3216>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   25cc5:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25cc8:	83 e8 01             	sub    eax,0x1
   25ccb:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25cce:	85 c0                	test   eax,eax
   25cd0:	0f 8e aa 49 00 00    	jle    2a680 <JS_CallInternal+0x7bc0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18643 (discriminator 2)
   25cd6:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25cdb:	49 83 c4 01          	add    r12,0x1
   25cdf:	49 89 c5             	mov    r13,rax
   25ce2:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25ce6:	ff e0                	jmp    rax
   25ce8:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18642
   25cec:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   25cf0:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   25cf4:	83 fa f6             	cmp    edx,0xfffffff6
   25cf7:	76 04                	jbe    25cfd <JS_CallInternal+0x323d>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   25cf9:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18642 (discriminator 1)
   25cfd:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   25d04:	48 8b 00             	mov    rax,QWORD PTR [rax]
   25d07:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   25d0b:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   25d0f:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   25d12:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
   25d16:	48 89 08             	mov    QWORD PTR [rax],rcx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   25d19:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   25d1d:	76 11                	jbe    25d30 <JS_CallInternal+0x3270>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   25d1f:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25d22:	83 e8 01             	sub    eax,0x1
   25d25:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25d28:	85 c0                	test   eax,eax
   25d2a:	0f 8e 8a 48 00 00    	jle    2a5ba <JS_CallInternal+0x7afa>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18642 (discriminator 2)
   25d30:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25d35:	49 83 c4 01          	add    r12,0x1
   25d39:	49 89 c5             	mov    r13,rax
   25d3c:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25d40:	ff e0                	jmp    rax
   25d42:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18640
   25d46:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   25d4d:	f3 0f 6f 5b f0       	movdqu xmm3,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18640
   25d52:	48 83 eb 10          	sub    rbx,0x10
   25d56:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
   25d5a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   25d5e:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   25d62:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   25d65:	0f 11 18             	movups XMMWORD PTR [rax],xmm3
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   25d68:	83 fa f6             	cmp    edx,0xfffffff6
   25d6b:	76 11                	jbe    25d7e <JS_CallInternal+0x32be>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   25d6d:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25d70:	83 e8 01             	sub    eax,0x1
   25d73:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25d76:	85 c0                	test   eax,eax
   25d78:	0f 8e 69 48 00 00    	jle    2a5e7 <JS_CallInternal+0x7b27>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18640 (discriminator 1)
   25d7e:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25d83:	49 83 c4 01          	add    r12,0x1
   25d87:	49 89 c5             	mov    r13,rax
   25d8a:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25d8e:	ff e0                	jmp    rax
   25d90:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18641
   25d94:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   25d9b:	f3 0f 6f 4b f0       	movdqu xmm1,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18641
   25da0:	48 83 eb 10          	sub    rbx,0x10
   25da4:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   25da8:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   25dac:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   25db0:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   25db3:	0f 11 08             	movups XMMWORD PTR [rax],xmm1
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   25db6:	83 fa f6             	cmp    edx,0xfffffff6
   25db9:	76 11                	jbe    25dcc <JS_CallInternal+0x330c>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   25dbb:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25dbe:	83 e8 01             	sub    eax,0x1
   25dc1:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25dc4:	85 c0                	test   eax,eax
   25dc6:	0f 8e 06 48 00 00    	jle    2a5d2 <JS_CallInternal+0x7b12>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18641 (discriminator 1)
   25dcc:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25dd1:	49 83 c4 01          	add    r12,0x1
   25dd5:	49 89 c5             	mov    r13,rax
   25dd8:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25ddc:	ff e0                	jmp    rax
   25dde:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18639
   25de2:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   25de9:	f3 0f 6f 7b f0       	movdqu xmm7,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18639
   25dee:	48 83 eb 10          	sub    rbx,0x10
   25df2:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   25df6:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   25dfa:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   25dfe:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   25e01:	0f 11 38             	movups XMMWORD PTR [rax],xmm7
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   25e04:	83 fa f6             	cmp    edx,0xfffffff6
   25e07:	76 11                	jbe    25e1a <JS_CallInternal+0x335a>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   25e09:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25e0c:	83 e8 01             	sub    eax,0x1
   25e0f:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25e12:	85 c0                	test   eax,eax
   25e14:	0f 8e e2 47 00 00    	jle    2a5fc <JS_CallInternal+0x7b3c>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18639 (discriminator 1)
   25e1a:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25e1f:	49 83 c4 01          	add    r12,0x1
   25e23:	49 89 c5             	mov    r13,rax
   25e26:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25e2a:	ff e0                	jmp    rax
   25e2c:	f3 0f 1e fa          	endbr64
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:196
   25e30:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   25e34:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18673
   25e39:	48 8b 7b f0          	mov    rdi,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   25e3d:	83 fa f6             	cmp    edx,0xfffffff6
   25e40:	76 04                	jbe    25e46 <JS_CallInternal+0x3386>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   25e42:	83 47 fc 01          	add    DWORD PTR [rdi-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18673 (discriminator 1)
   25e46:	48 8b 8d 98 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x168]
   25e4d:	48 8b 04 c1          	mov    rax,QWORD PTR [rcx+rax*8]
   25e51:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   25e55:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
   25e59:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   25e5c:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
   25e60:	48 89 38             	mov    QWORD PTR [rax],rdi
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   25e63:	83 f9 f6             	cmp    ecx,0xfffffff6
   25e66:	76 11                	jbe    25e79 <JS_CallInternal+0x33b9>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   25e68:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25e6b:	83 e8 01             	sub    eax,0x1
   25e6e:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25e71:	85 c0                	test   eax,eax
   25e73:	0f 8e 12 4d 00 00    	jle    2ab8b <JS_CallInternal+0x80cb>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18675
   25e79:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
   25e7f:	49 83 c4 03          	add    r12,0x3
   25e83:	49 89 c5             	mov    r13,rax
   25e86:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25e8a:	ff e0                	jmp    rax
   25e8c:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18682
   25e90:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   25e95:	48 8b bd 98 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x168]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18681
   25e9c:	4d 8d 6c 24 02       	lea    r13,[r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18682
   25ea1:	48 8d 0c c5 00 00 00 	lea    rcx,[rax*8+0x0]
   25ea8:	00 
   25ea9:	48 8b 04 c7          	mov    rax,QWORD PTR [rdi+rax*8]
   25ead:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   25eb1:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   25eb4:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18683 (discriminator 2)
   25eb8:	83 f8 04             	cmp    eax,0x4
   25ebb:	0f 84 22 4f 00 00    	je     2ade3 <JS_CallInternal+0x8323>
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   25ec1:	83 f8 f6             	cmp    eax,0xfffffff6
   25ec4:	76 04                	jbe    25eca <JS_CallInternal+0x340a>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   25ec6:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18687
   25eca:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18690
   25ecd:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18688
   25ed1:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18687
   25ed5:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18690
   25ed9:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   25edf:	49 89 c5             	mov    r13,rax
   25ee2:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25ee6:	ff e0                	jmp    rax
   25ee8:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18664
   25eec:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   25ef1:	48 8b 8d 98 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x168]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   25ef8:	f3 0f 6f 63 f0       	movdqu xmm4,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18664
   25efd:	48 8b 04 c1          	mov    rax,QWORD PTR [rcx+rax*8]
   25f01:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   25f05:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   25f09:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   25f0c:	0f 11 20             	movups XMMWORD PTR [rax],xmm4
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   25f0f:	83 fa f6             	cmp    edx,0xfffffff6
   25f12:	76 11                	jbe    25f25 <JS_CallInternal+0x3465>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   25f14:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25f17:	83 e8 01             	sub    eax,0x1
   25f1a:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25f1d:	85 c0                	test   eax,eax
   25f1f:	0f 8e 7e 4c 00 00    	jle    2aba3 <JS_CallInternal+0x80e3>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18667
   25f25:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18665
   25f2b:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18667
   25f2f:	49 83 c4 03          	add    r12,0x3
   25f33:	49 89 c5             	mov    r13,rax
   25f36:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25f3a:	ff e0                	jmp    rax
   25f3c:	f3 0f 1e fa          	endbr64
   25f40:	e9 41 cf ff ff       	jmp    22e86 <JS_CallInternal+0x3c6>
   25f45:	f3 0f 1e fa          	endbr64
   25f49:	e9 38 cf ff ff       	jmp    22e86 <JS_CallInternal+0x3c6>
   25f4e:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18188 (discriminator 1)
   25f52:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   25f56:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   25f5d:	48 c1 e0 04          	shl    rax,0x4
   25f61:	48 03 41 50          	add    rax,QWORD PTR [rcx+0x50]
   25f65:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   25f69:	48 8b 30             	mov    rsi,QWORD PTR [rax]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   25f6c:	83 fa f6             	cmp    edx,0xfffffff6
   25f6f:	76 04                	jbe    25f75 <JS_CallInternal+0x34b5>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   25f71:	83 46 fc 01          	add    DWORD PTR [rsi-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18190
   25f75:	4c 8b 85 c8 fe ff ff 	mov    r8,QWORD PTR [rbp-0x138]
   25f7c:	45 31 c9             	xor    r9d,r9d
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18189
   25f7f:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18190
   25f84:	4c 8d 73 10          	lea    r14,[rbx+0x10]
   25f88:	48 8b 8d 98 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x168]
   25f8f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   25f96:	e8 75 68 02 00       	call   4c810 <js_closure>
   25f9b:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18191 (discriminator 2)
   25f9f:	83 7b 08 06          	cmp    DWORD PTR [rbx+0x8],0x6
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18190
   25fa3:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18191 (discriminator 2)
   25fa6:	0f 84 fc 4c 00 00    	je     2aca8 <JS_CallInternal+0x81e8>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18194
   25fac:	41 0f b6 44 24 04    	movzx  eax,BYTE PTR [r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18190
   25fb2:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18194
   25fb5:	49 83 c4 05          	add    r12,0x5
   25fb9:	49 89 c5             	mov    r13,rax
   25fbc:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25fc0:	ff e0                	jmp    rax
   25fc2:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18177
   25fc6:	f3 0f 6f 4b c0       	movdqu xmm1,XMMWORD PTR [rbx-0x40]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18178
   25fcb:	f3 0f 6f 43 d0       	movdqu xmm0,XMMWORD PTR [rbx-0x30]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18184
   25fd0:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18179
   25fd4:	f3 0f 6f 6b e0       	movdqu xmm5,XMMWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18180
   25fd9:	f3 0f 6f 73 f0       	movdqu xmm6,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18181
   25fde:	0f 11 4b e0          	movups XMMWORD PTR [rbx-0x20],xmm1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18179
   25fe2:	0f 11 6b c0          	movups XMMWORD PTR [rbx-0x40],xmm5
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18180
   25fe6:	0f 11 73 d0          	movups XMMWORD PTR [rbx-0x30],xmm6
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18182
   25fea:	0f 11 43 f0          	movups XMMWORD PTR [rbx-0x10],xmm0
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18184
   25fee:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   25ff4:	49 89 c5             	mov    r13,rax
   25ff7:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25ffb:	ff e0                	jmp    rax
   25ffd:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18169
   26001:	f3 0f 6f 43 e0       	movdqu xmm0,XMMWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18170
   26006:	f3 0f 6f 53 f0       	movdqu xmm2,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18173
   2600b:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18170
   2600f:	0f 11 53 e0          	movups XMMWORD PTR [rbx-0x20],xmm2
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18171
   26013:	0f 11 43 f0          	movups XMMWORD PTR [rbx-0x10],xmm0
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18173
   26017:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2601d:	49 89 c5             	mov    r13,rax
   26020:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26024:	ff e0                	jmp    rax
   26026:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18159
   2602a:	f3 0f 6f 43 e0       	movdqu xmm0,XMMWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18160
   2602f:	f3 0f 6f 5b d0       	movdqu xmm3,XMMWORD PTR [rbx-0x30]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18165
   26034:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18161
   26038:	f3 0f 6f 4b c0       	movdqu xmm1,XMMWORD PTR [rbx-0x40]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18162
   2603d:	f3 0f 6f 63 b0       	movdqu xmm4,XMMWORD PTR [rbx-0x50]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18160
   26042:	0f 11 5b e0          	movups XMMWORD PTR [rbx-0x20],xmm3
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18161
   26046:	0f 11 4b d0          	movups XMMWORD PTR [rbx-0x30],xmm1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18162
   2604a:	0f 11 63 c0          	movups XMMWORD PTR [rbx-0x40],xmm4
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18163
   2604e:	0f 11 43 b0          	movups XMMWORD PTR [rbx-0x50],xmm0
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18165
   26052:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26058:	49 89 c5             	mov    r13,rax
   2605b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2605f:	ff e0                	jmp    rax
   26061:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18150
   26065:	f3 0f 6f 43 e0       	movdqu xmm0,XMMWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18151
   2606a:	f3 0f 6f 73 d0       	movdqu xmm6,XMMWORD PTR [rbx-0x30]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18155
   2606f:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18152
   26073:	f3 0f 6f 7b c0       	movdqu xmm7,XMMWORD PTR [rbx-0x40]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18151
   26078:	0f 11 73 e0          	movups XMMWORD PTR [rbx-0x20],xmm6
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18152
   2607c:	0f 11 7b d0          	movups XMMWORD PTR [rbx-0x30],xmm7
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18153
   26080:	0f 11 43 c0          	movups XMMWORD PTR [rbx-0x40],xmm0
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18155
   26084:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2608a:	49 89 c5             	mov    r13,rax
   2608d:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26091:	ff e0                	jmp    rax
   26093:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18141
   26097:	f3 0f 6f 43 f0       	movdqu xmm0,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18142
   2609c:	f3 0f 6f 53 e0       	movdqu xmm2,XMMWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18146
   260a1:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18143
   260a5:	f3 0f 6f 6b d0       	movdqu xmm5,XMMWORD PTR [rbx-0x30]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18142
   260aa:	0f 11 53 f0          	movups XMMWORD PTR [rbx-0x10],xmm2
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18143
   260ae:	0f 11 6b e0          	movups XMMWORD PTR [rbx-0x20],xmm5
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18144
   260b2:	0f 11 43 d0          	movups XMMWORD PTR [rbx-0x30],xmm0
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18146
   260b6:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   260bc:	49 89 c5             	mov    r13,rax
   260bf:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   260c3:	ff e0                	jmp    rax
   260c5:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18130
   260c9:	f3 0f 6f 43 b0       	movdqu xmm0,XMMWORD PTR [rbx-0x50]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18131
   260ce:	f3 0f 6f 7b c0       	movdqu xmm7,XMMWORD PTR [rbx-0x40]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18137
   260d3:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18132
   260d7:	f3 0f 6f 5b d0       	movdqu xmm3,XMMWORD PTR [rbx-0x30]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18133
   260dc:	f3 0f 6f 4b e0       	movdqu xmm1,XMMWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18134
   260e1:	f3 0f 6f 63 f0       	movdqu xmm4,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18131
   260e6:	0f 11 7b b0          	movups XMMWORD PTR [rbx-0x50],xmm7
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18132
   260ea:	0f 11 5b c0          	movups XMMWORD PTR [rbx-0x40],xmm3
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18133
   260ee:	0f 11 4b d0          	movups XMMWORD PTR [rbx-0x30],xmm1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18134
   260f2:	0f 11 63 e0          	movups XMMWORD PTR [rbx-0x20],xmm4
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18135
   260f6:	0f 11 43 f0          	movups XMMWORD PTR [rbx-0x10],xmm0
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18137
   260fa:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26100:	49 89 c5             	mov    r13,rax
   26103:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26107:	ff e0                	jmp    rax
   26109:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18120
   2610d:	f3 0f 6f 43 c0       	movdqu xmm0,XMMWORD PTR [rbx-0x40]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18121
   26112:	f3 0f 6f 63 d0       	movdqu xmm4,XMMWORD PTR [rbx-0x30]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18126
   26117:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18122
   2611b:	f3 0f 6f 6b e0       	movdqu xmm5,XMMWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18123
   26120:	f3 0f 6f 73 f0       	movdqu xmm6,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18121
   26125:	0f 11 63 c0          	movups XMMWORD PTR [rbx-0x40],xmm4
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18122
   26129:	0f 11 6b d0          	movups XMMWORD PTR [rbx-0x30],xmm5
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18123
   2612d:	0f 11 73 e0          	movups XMMWORD PTR [rbx-0x20],xmm6
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18124
   26131:	0f 11 43 f0          	movups XMMWORD PTR [rbx-0x10],xmm0
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18126
   26135:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2613b:	49 89 c5             	mov    r13,rax
   2613e:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26142:	ff e0                	jmp    rax
   26144:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18111
   26148:	f3 0f 6f 43 d0       	movdqu xmm0,XMMWORD PTR [rbx-0x30]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18112
   2614d:	f3 0f 6f 7b e0       	movdqu xmm7,XMMWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18116
   26152:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18113
   26156:	f3 0f 6f 5b f0       	movdqu xmm3,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18112
   2615b:	0f 11 7b d0          	movups XMMWORD PTR [rbx-0x30],xmm7
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18113
   2615f:	0f 11 5b e0          	movups XMMWORD PTR [rbx-0x20],xmm3
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18114
   26163:	0f 11 43 f0          	movups XMMWORD PTR [rbx-0x10],xmm0
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18116
   26167:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2616d:	49 89 c5             	mov    r13,rax
   26170:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26174:	ff e0                	jmp    rax
   26176:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18103
   2617a:	f3 0f 6f 43 e0       	movdqu xmm0,XMMWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18104
   2617f:	f3 0f 6f 73 d0       	movdqu xmm6,XMMWORD PTR [rbx-0x30]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18107
   26184:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18104
   26188:	0f 11 73 e0          	movups XMMWORD PTR [rbx-0x20],xmm6
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18105
   2618c:	0f 11 43 d0          	movups XMMWORD PTR [rbx-0x30],xmm0
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18107
   26190:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26196:	49 89 c5             	mov    r13,rax
   26199:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2619d:	ff e0                	jmp    rax
   2619f:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18093
   261a3:	f3 0f 6f 7b f0       	movdqu xmm7,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18094
   261a8:	f3 0f 6f 5b e0       	movdqu xmm3,XMMWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18095
   261ad:	f3 0f 6f 63 d0       	movdqu xmm4,XMMWORD PTR [rbx-0x30]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18096
   261b2:	f3 0f 6f 6b c0       	movdqu xmm5,XMMWORD PTR [rbx-0x40]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18093
   261b7:	0f 11 3b             	movups XMMWORD PTR [rbx],xmm7
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18094
   261ba:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18093
   261be:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18095
   261c2:	0f 11 63 e0          	movups XMMWORD PTR [rbx-0x20],xmm4
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18094
   261c6:	0f 11 5b f0          	movups XMMWORD PTR [rbx-0x10],xmm3
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18096
   261ca:	0f 11 6b d0          	movups XMMWORD PTR [rbx-0x30],xmm5
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   261ce:	83 f8 f6             	cmp    eax,0xfffffff6
   261d1:	76 04                	jbe    261d7 <JS_CallInternal+0x3717>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   261d3:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18097
   261d7:	48 89 53 c0          	mov    QWORD PTR [rbx-0x40],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18099
   261db:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18098
   261df:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18097
   261e3:	48 89 43 b8          	mov    QWORD PTR [rbx-0x48],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18099
   261e7:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   261ed:	49 89 c5             	mov    r13,rax
   261f0:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   261f4:	ff e0                	jmp    rax
   261f6:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18086
   261fa:	f3 0f 6f 63 f0       	movdqu xmm4,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18087
   261ff:	f3 0f 6f 6b e0       	movdqu xmm5,XMMWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18088
   26204:	f3 0f 6f 73 d0       	movdqu xmm6,XMMWORD PTR [rbx-0x30]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18086
   26209:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   2620d:	0f 11 23             	movups XMMWORD PTR [rbx],xmm4
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18087
   26210:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
   26214:	0f 11 6b f0          	movups XMMWORD PTR [rbx-0x10],xmm5
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18088
   26218:	0f 11 73 e0          	movups XMMWORD PTR [rbx-0x20],xmm6
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   2621c:	83 f8 f6             	cmp    eax,0xfffffff6
   2621f:	76 04                	jbe    26225 <JS_CallInternal+0x3765>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   26221:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18089
   26225:	48 89 53 d0          	mov    QWORD PTR [rbx-0x30],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18091
   26229:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18090
   2622d:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18089
   26231:	48 89 43 c8          	mov    QWORD PTR [rbx-0x38],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18091
   26235:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2623b:	49 89 c5             	mov    r13,rax
   2623e:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26242:	ff e0                	jmp    rax
   26244:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18080
   26248:	f3 0f 6f 73 f0       	movdqu xmm6,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18081
   2624d:	f3 0f 6f 7b e0       	movdqu xmm7,XMMWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18080
   26252:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   26256:	0f 11 33             	movups XMMWORD PTR [rbx],xmm6
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18081
   26259:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
   2625d:	0f 11 7b f0          	movups XMMWORD PTR [rbx-0x10],xmm7
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   26261:	83 f8 f6             	cmp    eax,0xfffffff6
   26264:	76 04                	jbe    2626a <JS_CallInternal+0x37aa>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   26266:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18082
   2626a:	48 89 53 e0          	mov    QWORD PTR [rbx-0x20],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18084
   2626e:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18083
   26272:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18082
   26276:	48 89 43 d8          	mov    QWORD PTR [rbx-0x28],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18084
   2627a:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26280:	49 89 c5             	mov    r13,rax
   26283:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26287:	ff e0                	jmp    rax
   26289:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18075
   2628d:	f3 0f 6f 6b f0       	movdqu xmm5,XMMWORD PTR [rbx-0x10]
   26292:	48 8b 43 e8          	mov    rax,QWORD PTR [rbx-0x18]
   26296:	48 8b 53 e0          	mov    rdx,QWORD PTR [rbx-0x20]
   2629a:	0f 11 2b             	movups XMMWORD PTR [rbx],xmm5
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   2629d:	83 f8 f6             	cmp    eax,0xfffffff6
   262a0:	76 04                	jbe    262a6 <JS_CallInternal+0x37e6>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   262a2:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18076
   262a6:	48 89 53 f0          	mov    QWORD PTR [rbx-0x10],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18078
   262aa:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18077
   262ae:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18076
   262b2:	48 89 43 e8          	mov    QWORD PTR [rbx-0x18],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18078
   262b6:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   262bc:	49 89 c5             	mov    r13,rax
   262bf:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   262c3:	ff e0                	jmp    rax
   262c5:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18350
   262c9:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   262d0:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   262d4:	48 83 eb 10          	sub    rbx,0x10
   262d8:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
   262dc:	e8 0f c0 ff ff       	call   222f0 <JS_Throw>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18351
   262e1:	e9 7a cf ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
   262e6:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18342
   262ea:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   262ee:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   262f2:	4c 8d 6b f0          	lea    r13,[rbx-0x10]
   262f6:	4c 8d 73 e0          	lea    r14,[rbx-0x20]
   262fa:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   26301:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   26305:	4d 8b 45 08          	mov    r8,QWORD PTR [r13+0x8]
   26309:	e8 62 3e 02 00       	call   4a170 <JS_AddBrand>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18342 (discriminator 1)
   2630e:	85 c0                	test   eax,eax
   26310:	0f 88 4a cf ff ff    	js     23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18344
   26316:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   2631a:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   2631e:	83 fa f6             	cmp    edx,0xfffffff6
   26321:	76 11                	jbe    26334 <JS_CallInternal+0x3874>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   26323:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   26326:	83 e8 01             	sub    eax,0x1
   26329:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2632c:	85 c0                	test   eax,eax
   2632e:	0f 8e 4a 49 00 00    	jle    2ac7e <JS_CallInternal+0x81be>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18345
   26334:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
   26338:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   2633c:	83 fa f6             	cmp    edx,0xfffffff6
   2633f:	76 11                	jbe    26352 <JS_CallInternal+0x3892>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   26341:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   26344:	83 e8 01             	sub    eax,0x1
   26347:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2634a:	85 c0                	test   eax,eax
   2634c:	0f 8e 41 49 00 00    	jle    2ac93 <JS_CallInternal+0x81d3>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18347
   26352:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18346
   26357:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18347
   2635a:	49 83 c4 01          	add    r12,0x1
   2635e:	49 89 c5             	mov    r13,rax
   26361:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26365:	ff e0                	jmp    rax
   26367:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18332
   2636b:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   2636f:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   26373:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   26377:	4c 8b 43 f8          	mov    r8,QWORD PTR [rbx-0x8]
   2637b:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   26382:	e8 19 af 00 00       	call   312a0 <JS_CheckBrand>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18333
   26387:	85 c0                	test   eax,eax
   26389:	0f 88 d1 ce ff ff    	js     23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18335
   2638f:	0f 84 0c 63 00 00    	je     2c6a1 <JS_CallInternal+0x9be1>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18340
   26395:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   2639a:	49 83 c4 01          	add    r12,0x1
   2639e:	49 89 c5             	mov    r13,rax
   263a1:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   263a5:	ff e0                	jmp    rax
   263a7:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18317
   263ab:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18318 (discriminator 1)
   263b2:	83 bd 80 fe ff ff 03 	cmp    DWORD PTR [rbp-0x180],0x3
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18317
   263b9:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18318 (discriminator 1)
   263bd:	0f 84 07 5c 00 00    	je     2bfca <JS_CallInternal+0x950a>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18320
   263c3:	48 8b b5 e0 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x120]
   263ca:	48 8b 95 d0 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x130]
   263d1:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   263d8:	e8 e3 bf ff ff       	call   223c0 <JS_GetPrototype>
   263dd:	49 89 c6             	mov    r14,rax
   263e0:	49 89 d5             	mov    r13,rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18321 (discriminator 1)
   263e3:	83 fa 06             	cmp    edx,0x6
   263e6:	0f 84 74 ce ff ff    	je     23260 <JS_CallInternal+0x7a0>
JS_CallConstructor2():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20884
   263ec:	6a 02                	push   0x2
   263ee:	44 8b 8d bc fe ff ff 	mov    r9d,DWORD PTR [rbp-0x144]
   263f5:	48 89 c6             	mov    rsi,rax
   263f8:	ff b5 a8 fe ff ff    	push   QWORD PTR [rbp-0x158]
   263fe:	48 8b 8d 70 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x190]
   26405:	4c 8b 85 80 fe ff ff 	mov    r8,QWORD PTR [rbp-0x180]
   2640c:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   26413:	e8 c8 aa 06 00       	call   90ee0 <JS_CallConstructorInternal>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   26418:	41 58                	pop    r8
   2641a:	41 59                	pop    r9
JS_CallConstructor2():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20884
   2641c:	48 89 d1             	mov    rcx,rdx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   2641f:	41 83 fd f6          	cmp    r13d,0xfffffff6
   26423:	76 13                	jbe    26438 <JS_CallInternal+0x3978>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   26425:	41 8b 7e fc          	mov    edi,DWORD PTR [r14-0x4]
   26429:	8d 57 ff             	lea    edx,[rdi-0x1]
   2642c:	41 89 56 fc          	mov    DWORD PTR [r14-0x4],edx
   26430:	85 d2                	test   edx,edx
   26432:	0f 8e 26 45 00 00    	jle    2a95e <JS_CallInternal+0x7e9e>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18325 (discriminator 1)
   26438:	83 f9 06             	cmp    ecx,0x6
   2643b:	0f 84 1f ce ff ff    	je     23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18327
   26441:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18329
   26444:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18327
   26448:	48 83 c3 10          	add    rbx,0x10
   2644c:	48 89 4b f8          	mov    QWORD PTR [rbx-0x8],rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18329
   26450:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26456:	49 89 c5             	mov    r13,rax
   26459:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2645d:	ff e0                	jmp    rax
   2645f:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18308 (discriminator 1)
   26463:	83 bd 80 fe ff ff 03 	cmp    DWORD PTR [rbp-0x180],0x3
   2646a:	0f 84 5a 5b 00 00    	je     2bfca <JS_CallInternal+0x950a>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18313
   26470:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   26475:	49 83 c4 01          	add    r12,0x1
   26479:	49 89 c5             	mov    r13,rax
   2647c:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26480:	ff e0                	jmp    rax
   26482:	f3 0f 1e fa          	endbr64
JS_IsObject():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:664
   26486:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18296 (discriminator 1)
   2648a:	83 f8 ff             	cmp    eax,0xffffffff
   2648d:	0f 84 1f 35 00 00    	je     299b2 <JS_CallInternal+0x6ef2>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18297 (discriminator 1)
   26493:	83 f8 03             	cmp    eax,0x3
   26496:	0f 85 2d 5e 00 00    	jne    2c2c9 <JS_CallInternal+0x9809>
   2649c:	b8 01 00 00 00       	mov    eax,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18301
   264a1:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18306
   264a4:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18305
   264a8:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18301
   264ac:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   264b3:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18306
   264b4:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   264ba:	49 89 c5             	mov    r13,rax
   264bd:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   264c1:	ff e0                	jmp    rax
   264c3:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18291
   264c7:	b9 03 00 00 00       	mov    ecx,0x3
   264cc:	31 c0                	xor    eax,eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18292
   264ce:	e9 e0 cc ff ff       	jmp    231b3 <JS_CallInternal+0x6f3>
   264d3:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17936
   264d7:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   264dc:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   264e3:	4d 8d 6c 24 01       	lea    r13,[r12+0x1]
   264e8:	48 c1 e0 04          	shl    rax,0x4
   264ec:	48 03 41 50          	add    rax,QWORD PTR [rcx+0x50]
   264f0:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   264f4:	48 8b 30             	mov    rsi,QWORD PTR [rax]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   264f7:	83 fa f6             	cmp    edx,0xfffffff6
   264fa:	76 04                	jbe    26500 <JS_CallInternal+0x3a40>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   264fc:	83 46 fc 01          	add    DWORD PTR [rsi-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17936 (discriminator 1)
   26500:	4c 8b 85 c8 fe ff ff 	mov    r8,QWORD PTR [rbp-0x138]
   26507:	48 8b 8d 98 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x168]
   2650e:	45 31 c9             	xor    r9d,r9d
   26511:	4c 8d 73 10          	lea    r14,[rbx+0x10]
   26515:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2651c:	e8 ef 62 02 00       	call   4c810 <js_closure>
   26521:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17937 (discriminator 2)
   26525:	83 7b 08 06          	cmp    DWORD PTR [rbx+0x8],0x6
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17936 (discriminator 1)
   26529:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17937 (discriminator 2)
   2652c:	0f 84 7e 49 00 00    	je     2aeb0 <JS_CallInternal+0x83f0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17939
   26532:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17936 (discriminator 1)
   26538:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17939
   2653b:	49 83 c4 02          	add    r12,0x2
   2653f:	49 89 c5             	mov    r13,rax
   26542:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26546:	ff e0                	jmp    rax
   26548:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17933
   2654c:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   26553:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   26558:	48 c1 e0 04          	shl    rax,0x4
   2655c:	48 03 41 50          	add    rax,QWORD PTR [rcx+0x50]
   26560:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   26564:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   26567:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   2656b:	83 f8 f6             	cmp    eax,0xfffffff6
   2656e:	76 04                	jbe    26574 <JS_CallInternal+0x3ab4>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   26570:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17933
   26574:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17934
   26577:	49 83 c4 02          	add    r12,0x2
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17933
   2657b:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17934
   2657f:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17933
   26585:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17934
   26588:	49 89 c5             	mov    r13,rax
   2658b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2658f:	ff e0                	jmp    rax
   26591:	f3 0f 1e fa          	endbr64
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:562
   26595:	41 0f bf 04 24       	movsx  eax,WORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17929 (discriminator 1)
   2659a:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17931
   2659e:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17929 (discriminator 1)
   265a2:	48 c7 43 f8 00 00 00 	mov    QWORD PTR [rbx-0x8],0x0
   265a9:	00 
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:562
   265aa:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17931
   265ae:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   265b4:	49 89 c5             	mov    r13,rax
   265b7:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   265bb:	ff e0                	jmp    rax
   265bd:	f3 0f 1e fa          	endbr64
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:562
   265c1:	41 0f be 04 24       	movsx  eax,BYTE PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17925 (discriminator 1)
   265c6:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17927
   265ca:	49 83 c4 02          	add    r12,0x2
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17925 (discriminator 1)
   265ce:	48 c7 43 f8 00 00 00 	mov    QWORD PTR [rbx-0x8],0x0
   265d5:	00 
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:562
   265d6:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17927
   265da:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   265e0:	49 89 c5             	mov    r13,rax
   265e3:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   265e7:	ff e0                	jmp    rax
   265e9:	f3 0f 1e fa          	endbr64
   265ed:	e9 b6 c7 ff ff       	jmp    22da8 <JS_CallInternal+0x2e8>
   265f2:	f3 0f 1e fa          	endbr64
   265f6:	e9 ad c7 ff ff       	jmp    22da8 <JS_CallInternal+0x2e8>
   265fb:	f3 0f 1e fa          	endbr64
   265ff:	e9 a4 c7 ff ff       	jmp    22da8 <JS_CallInternal+0x2e8>
   26604:	f3 0f 1e fa          	endbr64
   26608:	e9 9b c7 ff ff       	jmp    22da8 <JS_CallInternal+0x2e8>
   2660d:	f3 0f 1e fa          	endbr64
   26611:	e9 92 c7 ff ff       	jmp    22da8 <JS_CallInternal+0x2e8>
   26616:	f3 0f 1e fa          	endbr64
   2661a:	e9 89 c7 ff ff       	jmp    22da8 <JS_CallInternal+0x2e8>
   2661f:	f3 0f 1e fa          	endbr64
   26623:	e9 80 c7 ff ff       	jmp    22da8 <JS_CallInternal+0x2e8>
   26628:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17909 (discriminator 1)
   2662c:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   26633:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   26637:	48 c1 e0 04          	shl    rax,0x4
   2663b:	48 03 41 50          	add    rax,QWORD PTR [rcx+0x50]
   2663f:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   26643:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   26646:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   2664a:	83 f8 f6             	cmp    eax,0xfffffff6
   2664d:	76 04                	jbe    26653 <JS_CallInternal+0x3b93>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   2664f:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17909 (discriminator 1)
   26653:	48 89 13             	mov    QWORD PTR [rbx],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17911
   26656:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17909 (discriminator 1)
   2665a:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17911
   2665e:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17909 (discriminator 1)
   26664:	48 89 cb             	mov    rbx,rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17911
   26667:	49 89 c5             	mov    r13,rax
   2666a:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2666e:	ff e0                	jmp    rax
   26670:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17905 (discriminator 1)
   26674:	49 63 04 24          	movsxd rax,DWORD PTR [r12]
   26678:	48 c7 43 08 07 00 00 	mov    QWORD PTR [rbx+0x8],0x7
   2667f:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17907
   26680:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17905 (discriminator 1)
   26684:	48 83 c3 10          	add    rbx,0x10
   26688:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17907
   2668c:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26692:	49 89 c5             	mov    r13,rax
   26695:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26699:	ff e0                	jmp    rax
   2669b:	f3 0f 1e fa          	endbr64
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:562
   2669f:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17901 (discriminator 1)
   266a3:	48 c7 43 08 00 00 00 	mov    QWORD PTR [rbx+0x8],0x0
   266aa:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17903
   266ab:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17901 (discriminator 1)
   266af:	48 83 c3 10          	add    rbx,0x10
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:562
   266b3:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17903
   266b7:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   266bd:	49 89 c5             	mov    r13,rax
   266c0:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   266c4:	ff e0                	jmp    rax
   266c6:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17952
   266ca:	48 c7 03 00 00 00 00 	mov    QWORD PTR [rbx],0x0
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17953
   266d1:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17952
   266d5:	48 83 c3 10          	add    rbx,0x10
   266d9:	48 c7 43 f8 02 00 00 	mov    QWORD PTR [rbx-0x8],0x2
   266e0:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17953
   266e1:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   266e7:	49 89 c5             	mov    r13,rax
   266ea:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   266ee:	ff e0                	jmp    rax
   266f0:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17949
   266f4:	48 c7 03 00 00 00 00 	mov    QWORD PTR [rbx],0x0
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17950
   266fb:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17949
   266ff:	48 83 c3 10          	add    rbx,0x10
   26703:	48 c7 43 f8 03 00 00 	mov    QWORD PTR [rbx-0x8],0x3
   2670a:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17950
   2670b:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26711:	49 89 c5             	mov    r13,rax
   26714:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26718:	ff e0                	jmp    rax
   2671a:	f3 0f 1e fa          	endbr64
JS_AtomToValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3633
   2671e:	41 8b 34 24          	mov    esi,DWORD PTR [r12]
   26722:	31 d2                	xor    edx,edx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17945 (discriminator 1)
   26724:	4c 8d 73 10          	lea    r14,[rbx+0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17947
   26728:	49 83 c4 05          	add    r12,0x5
JS_AtomToValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3633
   2672c:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   26733:	e8 b8 d8 00 00       	call   33ff0 <__JS_AtomToValue>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17945 (discriminator 1)
   26738:	48 89 03             	mov    QWORD PTR [rbx],rax
   2673b:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17947
   2673f:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17945 (discriminator 1)
   26745:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17947
   26748:	49 89 c5             	mov    r13,rax
   2674b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2674f:	ff e0                	jmp    rax
   26751:	f3 0f 1e fa          	endbr64
JS_AtomToString():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3638
   26755:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2675c:	ba 01 00 00 00       	mov    edx,0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17941
   26761:	4c 8d 73 10          	lea    r14,[rbx+0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17942
   26765:	49 83 c4 01          	add    r12,0x1
JS_AtomToString():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3638
   26769:	be 2f 00 00 00       	mov    esi,0x2f
   2676e:	e8 7d d8 00 00       	call   33ff0 <__JS_AtomToValue>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17941
   26773:	48 89 03             	mov    QWORD PTR [rbx],rax
   26776:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17942
   2677a:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17941
   26780:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17942
   26783:	49 89 c5             	mov    r13,rax
   26786:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2678a:	ff e0                	jmp    rax
   2678c:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20202
   26790:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20202 (discriminator 1)
   26794:	0b 53 e8             	or     edx,DWORD PTR [rbx-0x18]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20200
   26797:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20201
   2679b:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20202 (discriminator 1)
   2679f:	0f 85 32 4d 00 00    	jne    2b4d7 <JS_CallInternal+0x8a17>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20203
   267a5:	21 c8                	and    eax,ecx
   267a7:	48 c7 43 e8 00 00 00 	mov    QWORD PTR [rbx-0x18],0x0
   267ae:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20206
   267af:	48 83 eb 10          	sub    rbx,0x10
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:562
   267b3:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20214
   267b7:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   267bc:	49 83 c4 01          	add    r12,0x1
   267c0:	49 89 c5             	mov    r13,rax
   267c3:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   267c7:	ff e0                	jmp    rax
   267c9:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20182
   267cd:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20182 (discriminator 1)
   267d1:	0b 53 e8             	or     edx,DWORD PTR [rbx-0x18]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20180
   267d4:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20181
   267d8:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20182 (discriminator 1)
   267dc:	0f 85 4b 48 00 00    	jne    2b02d <JS_CallInternal+0x856d>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20186
   267e2:	d3 f8                	sar    eax,cl
   267e4:	48 c7 43 e8 00 00 00 	mov    QWORD PTR [rbx-0x18],0x0
   267eb:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20188
   267ec:	48 83 eb 10          	sub    rbx,0x10
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:562
   267f0:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20196
   267f4:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   267f9:	49 83 c4 01          	add    r12,0x1
   267fd:	49 89 c5             	mov    r13,rax
   26800:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26804:	ff e0                	jmp    rax
   26806:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20161
   2680a:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20161 (discriminator 1)
   2680e:	0b 53 e8             	or     edx,DWORD PTR [rbx-0x18]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20159
   26811:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20160
   26815:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20161 (discriminator 1)
   26819:	0f 85 34 50 00 00    	jne    2b853 <JS_CallInternal+0x8d93>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20165
   2681f:	d3 e8                	shr    eax,cl
JS_NewUint32():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:584
   26821:	85 c0                	test   eax,eax
   26823:	0f 88 41 30 00 00    	js     2986a <JS_CallInternal+0x6daa>
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:562
   26829:	66 0f 6e c0          	movd   xmm0,eax
   2682d:	31 c0                	xor    eax,eax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20165
   2682f:	48 89 43 e8          	mov    QWORD PTR [rbx-0x18],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20168
   26833:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20165
   26837:	66 0f d6 43 f0       	movq   QWORD PTR [rbx-0x10],xmm0
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20176
   2683c:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   26841:	49 83 c4 01          	add    r12,0x1
   26845:	49 89 c5             	mov    r13,rax
   26848:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2684c:	ff e0                	jmp    rax
   2684e:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18955 (discriminator 1)
   26852:	49 63 04 24          	movsxd rax,DWORD PTR [r12]
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:562
   26856:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18957
   2685d:	49 8d 54 24 04       	lea    rdx,[r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18958
   26862:	48 83 c3 10          	add    rbx,0x10
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:562
   26866:	2b 51 18             	sub    edx,DWORD PTR [rcx+0x18]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18959
   26869:	4c 01 e0             	add    rax,r12
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18957
   2686c:	48 c7 43 f8 00 00 00 	mov    QWORD PTR [rbx-0x8],0x0
   26873:	00 
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:562
   26874:	48 89 53 f0          	mov    QWORD PTR [rbx-0x10],rdx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18961
   26878:	4c 8d 60 01          	lea    r12,[rax+0x1]
   2687c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   2687f:	49 89 c5             	mov    r13,rax
   26882:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   26886:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18947
   2688a:	49 63 04 24          	movsxd rax,DWORD PTR [r12]
JS_NewCatchOffset():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:567
   2688e:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18948
   26895:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18947
   26899:	4c 01 e0             	add    rax,r12
JS_NewCatchOffset():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:567
   2689c:	2b 41 18             	sub    eax,DWORD PTR [rcx+0x18]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18947
   2689f:	48 c7 43 f8 05 00 00 	mov    QWORD PTR [rbx-0x8],0x5
   268a6:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18951
   268a7:	49 83 c4 05          	add    r12,0x5
JS_NewCatchOffset():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:567
   268ab:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18951
   268af:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   268b5:	49 89 c5             	mov    r13,rax
   268b8:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   268bc:	ff e0                	jmp    rax
   268be:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20364
   268c2:	4c 8b 73 e0          	mov    r14,QWORD PTR [rbx-0x20]
   268c6:	4c 8b 4b f0          	mov    r9,QWORD PTR [rbx-0x10]
   268ca:	4c 8b 43 f8          	mov    r8,QWORD PTR [rbx-0x8]
   268ce:	4c 8b 6b e8          	mov    r13,QWORD PTR [rbx-0x18]
   268d2:	4c 89 f7             	mov    rdi,r14
   268d5:	4c 89 ce             	mov    rsi,r9
   268d8:	4c 89 c0             	mov    rax,r8
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20364 (discriminator 1)
   268db:	45 85 ed             	test   r13d,r13d
   268de:	0f 85 8c 47 00 00    	jne    2b070 <JS_CallInternal+0x85b0>
   268e4:	45 85 c0             	test   r8d,r8d
   268e7:	0f 85 87 2d 00 00    	jne    29674 <JS_CallInternal+0x6bb4>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20364 (discriminator 3)
   268ed:	31 c0                	xor    eax,eax
   268ef:	45 39 ce             	cmp    r14d,r9d
   268f2:	0f 94 c0             	sete   al
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   268f5:	83 f8 01             	cmp    eax,0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20364 (discriminator 31)
   268f8:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   268ff:	00 
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   26900:	0f 95 c0             	setne  al
   26903:	0f b6 c0             	movzx  eax,al
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20364 (discriminator 31)
   26906:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20364
   2690a:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20364 (discriminator 1)
   2690f:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20364
   26913:	49 83 c4 01          	add    r12,0x1
   26917:	49 89 c5             	mov    r13,rax
   2691a:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2691e:	ff e0                	jmp    rax
   26920:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20363
   26924:	4c 8b 73 e0          	mov    r14,QWORD PTR [rbx-0x20]
   26928:	4c 8b 4b f0          	mov    r9,QWORD PTR [rbx-0x10]
   2692c:	4c 8b 43 f8          	mov    r8,QWORD PTR [rbx-0x8]
   26930:	4c 8b 6b e8          	mov    r13,QWORD PTR [rbx-0x18]
   26934:	4c 89 f7             	mov    rdi,r14
   26937:	4c 89 ce             	mov    rsi,r9
   2693a:	4c 89 c0             	mov    rax,r8
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20363 (discriminator 1)
   2693d:	45 85 ed             	test   r13d,r13d
   26940:	0f 85 0d 4e 00 00    	jne    2b753 <JS_CallInternal+0x8c93>
   26946:	45 85 c0             	test   r8d,r8d
   26949:	0f 85 f9 2c 00 00    	jne    29648 <JS_CallInternal+0x6b88>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20363 (discriminator 3)
   2694f:	45 39 ce             	cmp    r14d,r9d
   26952:	0f 94 c0             	sete   al
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   26955:	0f b6 c0             	movzx  eax,al
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20363 (discriminator 31)
   26958:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   2695f:	00 
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   26960:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20363
   26964:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20363 (discriminator 1)
   26969:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20363
   2696d:	49 83 c4 01          	add    r12,0x1
   26971:	49 89 c5             	mov    r13,rax
   26974:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26978:	ff e0                	jmp    rax
   2697a:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19284
   2697e:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
JS_DefinePrivateField():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:8403 (discriminator 1)
   26982:	83 7b d8 ff          	cmp    DWORD PTR [rbx-0x28],0xffffffff
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19284
   26986:	4c 8d 73 e0          	lea    r14,[rbx-0x20]
   2698a:	4c 8b 43 d0          	mov    r8,QWORD PTR [rbx-0x30]
   2698e:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   26992:	4c 8b 6b f0          	mov    r13,QWORD PTR [rbx-0x10]
   26996:	49 8b 46 08          	mov    rax,QWORD PTR [r14+0x8]
   2699a:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
JS_DefinePrivateField():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:8403 (discriminator 1)
   269a1:	0f 85 5e 4b 00 00    	jne    2b505 <JS_CallInternal+0x8a45>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:8408 (discriminator 1)
   269a7:	83 f8 f8             	cmp    eax,0xfffffff8
   269aa:	0f 85 c0 4a 00 00    	jne    2b470 <JS_CallInternal+0x89b0>
js_symbol_to_atom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:9020
   269b0:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   269b7:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   269be:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   269c2:	e8 89 01 ff ff       	call   16b50 <js_get_atom_index>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6151
   269c7:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
js_symbol_to_atom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:9020
   269ce:	89 c6                	mov    esi,eax
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6151
   269d0:	49 8b 48 18          	mov    rcx,QWORD PTR [r8+0x18]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6152
   269d4:	89 f2                	mov    edx,esi
   269d6:	8b 41 18             	mov    eax,DWORD PTR [rcx+0x18]
   269d9:	21 c2                	and    edx,eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6153
   269db:	8b 54 91 38          	mov    edx,DWORD PTR [rcx+rdx*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6155
   269df:	48 85 d2             	test   rdx,rdx
   269e2:	0f 84 4d 27 00 00    	je     29135 <JS_CallInternal+0x6675>
   269e8:	48 8d 3c 85 34 00 00 	lea    rdi,[rax*4+0x34]
   269ef:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6156
   269f0:	48 8d 04 d7          	lea    rax,[rdi+rdx*8]
   269f4:	48 01 c8             	add    rax,rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6157 (discriminator 1)
   269f7:	3b 70 04             	cmp    esi,DWORD PTR [rax+0x4]
   269fa:	0f 85 27 27 00 00    	jne    29127 <JS_CallInternal+0x6667>
JS_DefinePrivateField():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:8416
   26a00:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   26a07:	48 8d 0d 36 67 0a 00 	lea    rcx,[rip+0xa6736]        # cd144 <_IO_stdin_used+0x144>
   26a0e:	48 8d 15 3b a4 0a 00 	lea    rdx,[rip+0xaa43b]        # d0e50 <_IO_stdin_used+0x3e50>
   26a15:	31 c0                	xor    eax,eax
   26a17:	e8 14 a4 00 00       	call   30e30 <__JS_ThrowTypeErrorAtom>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   26a1c:	83 bd 50 fe ff ff f6 	cmp    DWORD PTR [rbp-0x1b0],0xfffffff6
   26a23:	76 13                	jbe    26a38 <JS_CallInternal+0x3f78>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   26a25:	41 8b 45 fc          	mov    eax,DWORD PTR [r13-0x4]
   26a29:	83 e8 01             	sub    eax,0x1
   26a2c:	41 89 45 fc          	mov    DWORD PTR [r13-0x4],eax
   26a30:	85 c0                	test   eax,eax
   26a32:	0f 8e 2c 5c 00 00    	jle    2c664 <JS_CallInternal+0x9ba4>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19285
   26a38:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   26a3c:	49 8b 36             	mov    rsi,QWORD PTR [r14]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19286
   26a3f:	4c 89 f3             	mov    rbx,r14
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   26a42:	83 fa f6             	cmp    edx,0xfffffff6
   26a45:	0f 86 15 c8 ff ff    	jbe    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   26a4b:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   26a4e:	83 e8 01             	sub    eax,0x1
   26a51:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   26a54:	85 c0                	test   eax,eax
   26a56:	0f 8f 04 c8 ff ff    	jg     23260 <JS_CallInternal+0x7a0>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   26a5c:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   26a63:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   26a67:	e8 34 5e ff ff       	call   1c8a0 <__JS_FreeValueRT>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19287
   26a6c:	e9 ef c7 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
   26a71:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   26a78:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19272
   26a7c:	48 8d 43 e0          	lea    rax,[rbx-0x20]
   26a80:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
   26a84:	4c 8b 28             	mov    r13,QWORD PTR [rax]
   26a87:	48 83 eb 30          	sub    rbx,0x30
   26a8b:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_SetPrivateField():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:8461 (discriminator 1)
   26a8f:	83 7b 08 ff          	cmp    DWORD PTR [rbx+0x8],0xffffffff
   26a93:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
   26a96:	49 8b 36             	mov    rsi,QWORD PTR [r14]
   26a99:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   26aa0:	49 8b 4e 08          	mov    rcx,QWORD PTR [r14+0x8]
   26aa4:	0f 85 e0 49 00 00    	jne    2b48a <JS_CallInternal+0x89ca>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:8466 (discriminator 1)
   26aaa:	83 f9 f8             	cmp    ecx,0xfffffff8
   26aad:	0f 85 86 4c 00 00    	jne    2b739 <JS_CallInternal+0x8c79>
js_symbol_to_atom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:9020
   26ab3:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   26aba:	48 89 95 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rdx
   26ac1:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
   26ac5:	48 89 c7             	mov    rdi,rax
   26ac8:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
   26acf:	e8 7c 00 ff ff       	call   16b50 <js_get_atom_index>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6151
   26ad4:	48 8b 95 40 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c0]
js_symbol_to_atom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:9020
   26adb:	89 c6                	mov    esi,eax
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6151
   26add:	48 8b 7a 18          	mov    rdi,QWORD PTR [rdx+0x18]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6152
   26ae1:	8b 4f 18             	mov    ecx,DWORD PTR [rdi+0x18]
   26ae4:	21 c8                	and    eax,ecx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6153
   26ae6:	8b 44 87 38          	mov    eax,DWORD PTR [rdi+rax*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6155
   26aea:	48 85 c0             	test   rax,rax
   26aed:	0f 84 cc 4f 00 00    	je     2babf <JS_CallInternal+0x8fff>
   26af3:	4c 8d 04 8d 34 00 00 	lea    r8,[rcx*4+0x34]
   26afa:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6156
   26afb:	49 8d 0c c0          	lea    rcx,[r8+rax*8]
   26aff:	48 01 f9             	add    rcx,rdi
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6157 (discriminator 1)
   26b02:	3b 71 04             	cmp    esi,DWORD PTR [rcx+0x4]
   26b05:	0f 85 a7 4f 00 00    	jne    2bab2 <JS_CallInternal+0x8ff2>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6158
   26b0b:	48 8b 52 20          	mov    rdx,QWORD PTR [rdx+0x20]
   26b0f:	48 c1 e0 04          	shl    rax,0x4
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   26b13:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6158
   26b1a:	48 8d 44 02 f0       	lea    rax,[rdx+rax*1-0x10]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   26b1f:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   26b23:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   26b26:	48 89 48 08          	mov    QWORD PTR [rax+0x8],rcx
   26b2a:	4c 89 28             	mov    QWORD PTR [rax],r13
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   26b2d:	83 fa f6             	cmp    edx,0xfffffff6
   26b30:	76 11                	jbe    26b43 <JS_CallInternal+0x4083>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   26b32:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   26b35:	83 e8 01             	sub    eax,0x1
   26b38:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   26b3b:	85 c0                	test   eax,eax
   26b3d:	0f 8e 83 49 00 00    	jle    2b4c6 <JS_CallInternal+0x8a06>
JS_SetPrivateField():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:8480
   26b43:	45 31 ed             	xor    r13d,r13d
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19273
   26b46:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
   26b4a:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   26b4d:	83 fa f6             	cmp    edx,0xfffffff6
   26b50:	76 11                	jbe    26b63 <JS_CallInternal+0x40a3>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   26b52:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   26b55:	83 e8 01             	sub    eax,0x1
   26b58:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   26b5b:	85 c0                	test   eax,eax
   26b5d:	0f 8e d6 38 00 00    	jle    2a439 <JS_CallInternal+0x7979>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19274
   26b63:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   26b67:	49 8b 36             	mov    rsi,QWORD PTR [r14]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   26b6a:	83 fa f6             	cmp    edx,0xfffffff6
   26b6d:	76 11                	jbe    26b80 <JS_CallInternal+0x40c0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   26b6f:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   26b72:	83 e8 01             	sub    eax,0x1
   26b75:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   26b78:	85 c0                	test   eax,eax
   26b7a:	0f 8e e3 38 00 00    	jle    2a463 <JS_CallInternal+0x79a3>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19276 (discriminator 1)
   26b80:	41 83 fd ff          	cmp    r13d,0xffffffff
   26b84:	0f 84 d6 c6 ff ff    	je     23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19279
   26b8a:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   26b8f:	49 83 c4 01          	add    r12,0x1
   26b93:	49 89 c5             	mov    r13,rax
   26b96:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26b9a:	ff e0                	jmp    rax
   26b9c:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20037
   26ba0:	44 8b 4b f8          	mov    r9d,DWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20036
   26ba4:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20037
   26ba8:	45 85 c9             	test   r9d,r9d
   26bab:	0f 85 60 2c 00 00    	jne    29811 <JS_CallInternal+0x6d51>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20039 (discriminator 1)
   26bb1:	3d ff ff ff 7f       	cmp    eax,0x7fffffff
   26bb6:	0f 84 55 2c 00 00    	je     29811 <JS_CallInternal+0x6d51>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20041
   26bbc:	83 c0 01             	add    eax,0x1
   26bbf:	48 c7 43 08 00 00 00 	mov    QWORD PTR [rbx+0x8],0x0
   26bc6:	00 
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:562
   26bc7:	48 89 03             	mov    QWORD PTR [rbx],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20050
   26bca:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20048
   26bcf:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20050
   26bd3:	49 83 c4 01          	add    r12,0x1
   26bd7:	49 89 c5             	mov    r13,rax
   26bda:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26bde:	ff e0                	jmp    rax
   26be0:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20019
   26be4:	44 8b 53 f8          	mov    r10d,DWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20018
   26be8:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20019
   26bec:	45 85 d2             	test   r10d,r10d
   26bef:	0f 85 7b 2b 00 00    	jne    29770 <JS_CallInternal+0x6cb0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20021 (discriminator 1)
   26bf5:	3d 00 00 00 80       	cmp    eax,0x80000000
   26bfa:	0f 84 70 2b 00 00    	je     29770 <JS_CallInternal+0x6cb0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20023
   26c00:	83 e8 01             	sub    eax,0x1
   26c03:	48 c7 43 f8 00 00 00 	mov    QWORD PTR [rbx-0x8],0x0
   26c0a:	00 
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:562
   26c0b:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20031
   26c0f:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   26c14:	49 83 c4 01          	add    r12,0x1
   26c18:	49 89 c5             	mov    r13,rax
   26c1b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26c1f:	ff e0                	jmp    rax
   26c21:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19022
   26c25:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
js_iterator_get_value_done():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16772
   26c2c:	4c 8b 73 f8          	mov    r14,QWORD PTR [rbx-0x8]
   26c30:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19022
   26c34:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
js_iterator_get_value_done():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16773 (discriminator 1)
   26c38:	41 83 fe ff          	cmp    r14d,0xffffffff
   26c3c:	0f 85 c5 56 00 00    	jne    2c307 <JS_CallInternal+0x9847>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16777
   26c42:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   26c49:	48 8d 8d f0 fe ff ff 	lea    rcx,[rbp-0x110]
   26c50:	4c 89 f2             	mov    rdx,r14
   26c53:	48 89 b5 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rsi
   26c5a:	e8 c1 66 00 00       	call   2d320 <JS_IteratorGetCompleteValue>
   26c5f:	48 89 c1             	mov    rcx,rax
   26c62:	49 89 d5             	mov    r13,rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16778 (discriminator 1)
   26c65:	83 fa 06             	cmp    edx,0x6
   26c68:	0f 84 f2 c5 ff ff    	je     23260 <JS_CallInternal+0x7a0>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   26c6e:	48 8b b5 50 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1b0]
   26c75:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   26c78:	83 e8 01             	sub    eax,0x1
   26c7b:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   26c7e:	85 c0                	test   eax,eax
   26c80:	0f 8e 4a 3d 00 00    	jle    2a9d0 <JS_CallInternal+0x7f10>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   26c86:	8b bd f0 fe ff ff    	mov    edi,DWORD PTR [rbp-0x110]
   26c8c:	31 c0                	xor    eax,eax
js_iterator_get_value_done():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16784
   26c8e:	4c 89 6b f8          	mov    QWORD PTR [rbx-0x8],r13
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16783
   26c92:	48 c7 43 e0 00 00 00 	mov    QWORD PTR [rbx-0x20],0x0
   26c99:	00 
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   26c9a:	85 ff                	test   edi,edi
js_iterator_get_value_done():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16783
   26c9c:	48 c7 43 e8 05 00 00 	mov    QWORD PTR [rbx-0x18],0x5
   26ca3:	00 
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   26ca4:	0f 95 c0             	setne  al
js_iterator_get_value_done():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16784
   26ca7:	48 89 4b f0          	mov    QWORD PTR [rbx-0x10],rcx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19026
   26cab:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19025
   26caf:	48 83 c3 10          	add    rbx,0x10
js_iterator_get_value_done():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16785
   26cb3:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   26cb7:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   26cbe:	00 
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19026
   26cbf:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26cc5:	49 89 c5             	mov    r13,rax
   26cc8:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26ccc:	ff e0                	jmp    rax
   26cce:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20430
   26cd2:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
js_operator_private_in():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:15976
   26cd9:	4c 8b 6b e8          	mov    r13,QWORD PTR [rbx-0x18]
   26cdd:	4c 8b 4b e0          	mov    r9,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:15977
   26ce1:	4c 8b 73 f8          	mov    r14,QWORD PTR [rbx-0x8]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20430
   26ce5:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
js_operator_private_in():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:15977
   26ce9:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
   26ced:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:15979
   26cf4:	41 83 fd ff          	cmp    r13d,0xffffffff
   26cf8:	0f 85 ef 5f 00 00    	jne    2cced <JS_CallInternal+0xa22d>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:15983 (discriminator 1)
   26cfe:	41 83 fe ff          	cmp    r14d,0xffffffff
   26d02:	0f 84 b1 2c 00 00    	je     299b9 <JS_CallInternal+0x6ef9>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:15994
   26d08:	48 8b b5 50 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1b0]
   26d0f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   26d16:	4c 89 f2             	mov    rdx,r14
   26d19:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   26d20:	e8 3b cd 01 00       	call   43a60 <JS_ValueToAtom>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:15995 (discriminator 1)
   26d25:	85 c0                	test   eax,eax
   26d27:	0f 84 33 c5 ff ff    	je     23260 <JS_CallInternal+0x7a0>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6151
   26d2d:	4c 8b 8d 40 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c0]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6152
   26d34:	89 c2                	mov    edx,eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6151
   26d36:	49 8b 49 18          	mov    rcx,QWORD PTR [r9+0x18]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6152
   26d3a:	8b 71 18             	mov    esi,DWORD PTR [rcx+0x18]
   26d3d:	21 f2                	and    edx,esi
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6153
   26d3f:	8b 54 91 38          	mov    edx,DWORD PTR [rcx+rdx*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6155
   26d43:	48 85 d2             	test   rdx,rdx
   26d46:	0f 84 79 54 00 00    	je     2c1c5 <JS_CallInternal+0x9705>
   26d4c:	48 8d 34 b5 34 00 00 	lea    rsi,[rsi*4+0x34]
   26d53:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6156
   26d54:	48 8d 14 d6          	lea    rdx,[rsi+rdx*8]
   26d58:	48 01 ca             	add    rdx,rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6157 (discriminator 1)
   26d5b:	3b 42 04             	cmp    eax,DWORD PTR [rdx+0x4]
   26d5e:	0f 85 53 54 00 00    	jne    2c1b7 <JS_CallInternal+0x96f7>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3735 (discriminator 1)
   26d64:	3d f2 00 00 00       	cmp    eax,0xf2
   26d69:	0f 8f 49 35 00 00    	jg     2a2b8 <JS_CallInternal+0x77f8>
js_operator_private_in():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16000
   26d6f:	48 85 d2             	test   rdx,rdx
   26d72:	0f 95 c0             	setne  al
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   26d75:	41 83 fd f6          	cmp    r13d,0xfffffff6
   26d79:	76 13                	jbe    26d8e <JS_CallInternal+0x42ce>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   26d7b:	41 8b 49 fc          	mov    ecx,DWORD PTR [r9-0x4]
   26d7f:	8d 51 ff             	lea    edx,[rcx-0x1]
   26d82:	41 89 51 fc          	mov    DWORD PTR [r9-0x4],edx
   26d86:	85 d2                	test   edx,edx
   26d88:	0f 8e 53 37 00 00    	jle    2a4e1 <JS_CallInternal+0x7a21>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   26d8e:	41 83 fe f6          	cmp    r14d,0xfffffff6
   26d92:	76 1e                	jbe    26db2 <JS_CallInternal+0x42f2>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   26d94:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   26d9b:	8b 79 fc             	mov    edi,DWORD PTR [rcx-0x4]
   26d9e:	8d 57 ff             	lea    edx,[rdi-0x1]
   26da1:	89 bd 40 fe ff ff    	mov    DWORD PTR [rbp-0x1c0],edi
   26da7:	89 51 fc             	mov    DWORD PTR [rcx-0x4],edx
   26daa:	85 d2                	test   edx,edx
   26dac:	0f 8e 3d 39 00 00    	jle    2a6ef <JS_CallInternal+0x7c2f>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   26db2:	0f b6 c0             	movzx  eax,al
js_operator_private_in():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16004
   26db5:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   26dbc:	00 
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20434
   26dbd:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20433
   26dc1:	48 83 eb 10          	sub    rbx,0x10
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   26dc5:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20434
   26dc9:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26dcf:	49 89 c5             	mov    r13,rax
   26dd2:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26dd6:	ff e0                	jmp    rax
   26dd8:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20424
   26ddc:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
js_operator_in():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:15952
   26de3:	4c 8b 6b f8          	mov    r13,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:15951
   26de7:	4c 8b 73 e0          	mov    r14,QWORD PTR [rbx-0x20]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20424
   26deb:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
js_operator_in():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:15951
   26def:	48 8b 43 e8          	mov    rax,QWORD PTR [rbx-0x18]
   26df3:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:15952
   26dfa:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
   26dfe:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:15954
   26e05:	41 83 fd ff          	cmp    r13d,0xffffffff
   26e09:	0f 85 3d 55 00 00    	jne    2c34c <JS_CallInternal+0x988c>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:15958
   26e0f:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
   26e16:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   26e1d:	4c 89 f6             	mov    rsi,r14
   26e20:	e8 3b cc 01 00       	call   43a60 <JS_ValueToAtom>
   26e25:	89 c1                	mov    ecx,eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:15959 (discriminator 1)
   26e27:	85 c0                	test   eax,eax
   26e29:	0f 84 31 c4 ff ff    	je     23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:15961
   26e2f:	48 8b b5 40 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c0]
   26e36:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   26e3d:	4c 89 ea             	mov    rdx,r13
   26e40:	89 85 38 fe ff ff    	mov    DWORD PTR [rbp-0x1c8],eax
   26e46:	e8 45 73 04 00       	call   6e190 <JS_HasProperty>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3735 (discriminator 1)
   26e4b:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
js_operator_in():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:15961
   26e51:	41 89 c0             	mov    r8d,eax
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3735 (discriminator 1)
   26e54:	81 f9 f2 00 00 00    	cmp    ecx,0xf2
   26e5a:	0f 8f b9 2e 00 00    	jg     29d19 <JS_CallInternal+0x7259>
js_operator_in():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:15963
   26e60:	45 85 c0             	test   r8d,r8d
   26e63:	0f 88 f7 c3 ff ff    	js     23260 <JS_CallInternal+0x7a0>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   26e69:	83 bd 50 fe ff ff f6 	cmp    DWORD PTR [rbp-0x1b0],0xfffffff6
   26e70:	76 13                	jbe    26e85 <JS_CallInternal+0x43c5>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   26e72:	41 8b 46 fc          	mov    eax,DWORD PTR [r14-0x4]
   26e76:	83 e8 01             	sub    eax,0x1
   26e79:	41 89 46 fc          	mov    DWORD PTR [r14-0x4],eax
   26e7d:	85 c0                	test   eax,eax
   26e7f:	0f 8e a7 47 00 00    	jle    2b62c <JS_CallInternal+0x8b6c>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   26e85:	41 83 fd f6          	cmp    r13d,0xfffffff6
   26e89:	76 1e                	jbe    26ea9 <JS_CallInternal+0x43e9>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   26e8b:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   26e92:	8b 41 fc             	mov    eax,DWORD PTR [rcx-0x4]
   26e95:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   26e9b:	83 e8 01             	sub    eax,0x1
   26e9e:	89 41 fc             	mov    DWORD PTR [rcx-0x4],eax
   26ea1:	85 c0                	test   eax,eax
   26ea3:	0f 8e 6f 4b 00 00    	jle    2ba18 <JS_CallInternal+0x8f58>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   26ea9:	31 c0                	xor    eax,eax
   26eab:	45 85 c0             	test   r8d,r8d
js_operator_in():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:15967
   26eae:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   26eb5:	00 
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   26eb6:	0f 95 c0             	setne  al
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20427
   26eb9:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20428
   26ebd:	49 83 c4 01          	add    r12,0x1
js_operator_in():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:15967
   26ec1:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20428
   26ec5:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26ecb:	49 89 c5             	mov    r13,rax
   26ece:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26ed2:	ff e0                	jmp    rax
   26ed4:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19858
   26ed8:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19857
   26edc:	48 8b 73 e8          	mov    rsi,QWORD PTR [rbx-0x18]
   26ee0:	48 8b 4b e0          	mov    rcx,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19858
   26ee4:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19859 (discriminator 1)
   26ee8:	89 c7                	mov    edi,eax
   26eea:	09 f7                	or     edi,esi
   26eec:	0f 85 6b 4b 00 00    	jne    2ba5d <JS_CallInternal+0x8f9d>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19864
   26ef2:	48 63 f2             	movsxd rsi,edx
   26ef5:	48 63 c1             	movsxd rax,ecx
   26ef8:	48 0f af c6          	imul   rax,rsi
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19865
   26efc:	48 63 f0             	movsxd rsi,eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19865 (discriminator 1)
   26eff:	48 39 c6             	cmp    rsi,rax
   26f02:	0f 85 39 4b 00 00    	jne    2ba41 <JS_CallInternal+0x8f81>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19870 (discriminator 1)
   26f08:	48 85 f6             	test   rsi,rsi
   26f0b:	0f 84 cf 4b 00 00    	je     2bae0 <JS_CallInternal+0x9020>
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:562
   26f11:	83 e0 ff             	and    eax,0xffffffff
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19875
   26f14:	48 8d 53 f0          	lea    rdx,[rbx-0x10]
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:562
   26f18:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19874
   26f1c:	31 c0                	xor    eax,eax
   26f1e:	48 89 43 e8          	mov    QWORD PTR [rbx-0x18],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19901
   26f22:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   26f27:	48 89 d3             	mov    rbx,rdx
   26f2a:	49 83 c4 01          	add    r12,0x1
   26f2e:	49 89 c5             	mov    r13,rax
   26f31:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26f35:	ff e0                	jmp    rax
   26f37:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19819
   26f3b:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19818
   26f3f:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   26f43:	48 8b 7b e0          	mov    rdi,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19819
   26f47:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19820 (discriminator 1)
   26f4b:	89 c6                	mov    esi,eax
   26f4d:	09 d6                	or     esi,edx
   26f4f:	0f 85 64 46 00 00    	jne    2b5b9 <JS_CallInternal+0x8af9>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19823
   26f55:	89 fa                	mov    edx,edi
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19822
   26f57:	48 63 f1             	movsxd rsi,ecx
   26f5a:	48 63 c7             	movsxd rax,edi
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19823
   26f5d:	29 ca                	sub    edx,ecx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19822
   26f5f:	48 29 f0             	sub    rax,rsi
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19823
   26f62:	48 63 ca             	movsxd rcx,edx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19823 (discriminator 1)
   26f65:	48 39 c1             	cmp    rcx,rax
   26f68:	0f 85 33 46 00 00    	jne    2b5a1 <JS_CallInternal+0x8ae1>
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:562
   26f6e:	89 d0                	mov    eax,edx
   26f70:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19826
   26f74:	31 c0                	xor    eax,eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19828
   26f76:	48 8d 53 f0          	lea    rdx,[rbx-0x10]
   26f7a:	48 89 43 e8          	mov    QWORD PTR [rbx-0x18],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19852
   26f7e:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   26f83:	48 89 d3             	mov    rbx,rdx
   26f86:	49 83 c4 01          	add    r12,0x1
   26f8a:	49 89 c5             	mov    r13,rax
   26f8d:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26f91:	ff e0                	jmp    rax
   26f93:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19775
   26f97:	45 0f b6 2c 24       	movzx  r13d,BYTE PTR [r12]
   26f9c:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19772
   26fa3:	4d 8d 4c 24 01       	lea    r9,[r12+0x1]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19774
   26fa8:	4c 8b 73 f8          	mov    r14,QWORD PTR [rbx-0x8]
   26fac:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19775
   26fb0:	49 c1 e5 04          	shl    r13,0x4
   26fb4:	49 01 c5             	add    r13,rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19776 (discriminator 1)
   26fb7:	44 89 f1             	mov    ecx,r14d
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19776
   26fba:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19776 (discriminator 1)
   26fbe:	09 d1                	or     ecx,edx
   26fc0:	0f 85 ca 43 00 00    	jne    2b390 <JS_CallInternal+0x88d0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19778
   26fc6:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   26fca:	49 63 c8             	movsxd rcx,r8d
   26fcd:	48 63 d0             	movsxd rdx,eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19779
   26fd0:	44 01 c0             	add    eax,r8d
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19778
   26fd3:	48 01 ca             	add    rdx,rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19779
   26fd6:	48 63 c8             	movsxd rcx,eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19779 (discriminator 1)
   26fd9:	48 39 d1             	cmp    rcx,rdx
   26fdc:	0f 85 95 43 00 00    	jne    2b377 <JS_CallInternal+0x88b7>
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:562
   26fe2:	89 c0                	mov    eax,eax
   26fe4:	49 89 45 00          	mov    QWORD PTR [r13+0x0],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19782
   26fe8:	31 c0                	xor    eax,eax
   26fea:	49 89 45 08          	mov    QWORD PTR [r13+0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19784
   26fee:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19814
   26ff2:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
   26ff8:	49 83 c4 02          	add    r12,0x2
   26ffc:	49 89 c5             	mov    r13,rax
   26fff:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27003:	ff e0                	jmp    rax
   27005:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19723
   27009:	48 8b 7b f8          	mov    rdi,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19722
   2700d:	4c 8b 5b e8          	mov    r11,QWORD PTR [rbx-0x18]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19723
   27011:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19722
   27015:	4c 8b 53 e0          	mov    r10,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19724 (discriminator 1)
   27019:	41 89 fe             	mov    r14d,edi
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19722
   2701c:	4c 89 de             	mov    rsi,r11
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19723
   2701f:	48 89 f9             	mov    rcx,rdi
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19724 (discriminator 1)
   27022:	45 09 de             	or     r14d,r11d
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19723
   27025:	4c 89 c0             	mov    rax,r8
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19724 (discriminator 1)
   27028:	0f 85 45 42 00 00    	jne    2b273 <JS_CallInternal+0x87b3>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19726
   2702e:	49 63 ca             	movsxd rcx,r10d
   27031:	49 63 f0             	movsxd rsi,r8d
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19727
   27034:	44 01 d0             	add    eax,r10d
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19726
   27037:	48 01 f1             	add    rcx,rsi
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19727
   2703a:	48 63 d0             	movsxd rdx,eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19727 (discriminator 1)
   2703d:	48 39 ca             	cmp    rdx,rcx
   27040:	0f 85 15 42 00 00    	jne    2b25b <JS_CallInternal+0x879b>
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:562
   27046:	89 c0                	mov    eax,eax
   27048:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19730
   2704c:	31 c0                	xor    eax,eax
   2704e:	48 89 43 e8          	mov    QWORD PTR [rbx-0x18],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19732
   27052:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19765
   27056:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   2705b:	49 83 c4 01          	add    r12,0x1
   2705f:	49 89 c5             	mov    r13,rax
   27062:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27066:	ff e0                	jmp    rax
   27068:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20126
   2706c:	8b 7b f8             	mov    edi,DWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20125
   2706f:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20126
   27073:	85 ff                	test   edi,edi
   27075:	0f 85 1a 2b 00 00    	jne    29b95 <JS_CallInternal+0x70d5>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20127
   2707b:	f7 d0                	not    eax
   2707d:	48 c7 43 f8 00 00 00 	mov    QWORD PTR [rbx-0x8],0x0
   27084:	00 
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:562
   27085:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20134
   27089:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   2708e:	49 83 c4 01          	add    r12,0x1
   27092:	49 89 c5             	mov    r13,rax
   27095:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27099:	ff e0                	jmp    rax
   2709b:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20104
   2709f:	45 0f b6 2c 24       	movzx  r13d,BYTE PTR [r12]
   270a4:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20102
   270ab:	4d 8d 74 24 01       	lea    r14,[r12+0x1]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20104
   270b0:	49 c1 e5 04          	shl    r13,0x4
   270b4:	49 01 c5             	add    r13,rax
   270b7:	f3 41 0f 6f 6d 00    	movdqu xmm5,XMMWORD PTR [r13+0x0]
   270bd:	0f 29 ad f0 fe ff ff 	movaps XMMWORD PTR [rbp-0x110],xmm5
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20105
   270c4:	48 8b 95 f8 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x108]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20106
   270cb:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20105
   270d2:	85 d2                	test   edx,edx
   270d4:	0f 85 3e 23 00 00    	jne    29418 <JS_CallInternal+0x6958>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20107 (discriminator 1)
   270da:	3d 00 00 00 80       	cmp    eax,0x80000000
   270df:	0f 84 33 23 00 00    	je     29418 <JS_CallInternal+0x6958>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20109
   270e5:	83 e8 01             	sub    eax,0x1
   270e8:	49 c7 45 08 00 00 00 	mov    QWORD PTR [r13+0x8],0x0
   270ef:	00 
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:562
   270f0:	49 89 45 00          	mov    QWORD PTR [r13+0x0],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20121
   270f4:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
   270fa:	49 83 c4 02          	add    r12,0x2
   270fe:	49 89 c5             	mov    r13,rax
   27101:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27105:	ff e0                	jmp    rax
   27107:	f3 0f 1e fa          	endbr64
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7900
   2710b:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18844 (discriminator 1)
   27112:	4d 63 2c 24          	movsxd r13,DWORD PTR [r12]
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7900
   27116:	8b 81 a8 01 00 00    	mov    eax,DWORD PTR [rcx+0x1a8]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18844 (discriminator 1)
   2711c:	4d 01 e5             	add    r13,r12
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7900
   2711f:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   27125:	83 e8 01             	sub    eax,0x1
   27128:	89 81 a8 01 00 00    	mov    DWORD PTR [rcx+0x1a8],eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7900 (discriminator 1)
   2712e:	85 c0                	test   eax,eax
   27130:	0f 8e 43 40 00 00    	jle    2b179 <JS_CallInternal+0x86b9>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18847
   27136:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
   2713b:	4d 8d 65 01          	lea    r12,[r13+0x1]
   2713f:	49 89 c5             	mov    r13,rax
   27142:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   27146:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20292
   2714a:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
   2714e:	48 8b 73 e8          	mov    rsi,QWORD PTR [rbx-0x18]
   27152:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
   27156:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20292 (discriminator 1)
   2715a:	89 cf                	mov    edi,ecx
   2715c:	09 f7                	or     edi,esi
   2715e:	0f 85 7a 47 00 00    	jne    2b8de <JS_CallInternal+0x8e1e>
   27164:	39 d0                	cmp    eax,edx
   27166:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   2716d:	00 
   2716e:	0f 9e c0             	setle  al
   27171:	48 83 eb 10          	sub    rbx,0x10
   27175:	0f b6 c0             	movzx  eax,al
   27178:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20292
   2717c:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27181:	49 83 c4 01          	add    r12,0x1
   27185:	49 89 c5             	mov    r13,rax
   27188:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2718c:	ff e0                	jmp    rax
   2718e:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19330
   27192:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19331
   27199:	4c 8b 73 f8          	mov    r14,QWORD PTR [rbx-0x8]
   2719d:	4c 8b 6b f0          	mov    r13,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19330
   271a1:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19332 (discriminator 1)
   271a5:	41 83 fe ff          	cmp    r14d,0xffffffff
   271a9:	0f 84 65 24 00 00    	je     29614 <JS_CallInternal+0x6b54>
   271af:	41 83 fe 02          	cmp    r14d,0x2
   271b3:	0f 84 5b 24 00 00    	je     29614 <JS_CallInternal+0x6b54>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   271b9:	41 83 fe f6          	cmp    r14d,0xfffffff6
   271bd:	76 13                	jbe    271d2 <JS_CallInternal+0x4712>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   271bf:	41 8b 45 fc          	mov    eax,DWORD PTR [r13-0x4]
   271c3:	83 e8 01             	sub    eax,0x1
   271c6:	41 89 45 fc          	mov    DWORD PTR [r13-0x4],eax
   271ca:	85 c0                	test   eax,eax
   271cc:	0f 8e e6 39 00 00    	jle    2abb8 <JS_CallInternal+0x80f8>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19339
   271d2:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19337
   271d7:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19339
   271db:	49 83 c4 01          	add    r12,0x1
   271df:	49 89 c5             	mov    r13,rax
   271e2:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   271e6:	ff e0                	jmp    rax
   271e8:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19923
   271ec:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19923 (discriminator 1)
   271f0:	0b 43 e8             	or     eax,DWORD PTR [rbx-0x18]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19921
   271f3:	48 8b 4b e0          	mov    rcx,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19922
   271f7:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19923 (discriminator 1)
   271fb:	0f 85 b6 c9 ff ff    	jne    23bb7 <JS_CallInternal+0x10f7>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19925
   27201:	89 c8                	mov    eax,ecx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19926
   27203:	89 d6                	mov    esi,edx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19929 (discriminator 1)
   27205:	85 c9                	test   ecx,ecx
   27207:	0f 88 aa c9 ff ff    	js     23bb7 <JS_CallInternal+0x10f7>
   2720d:	85 d2                	test   edx,edx
   2720f:	0f 8e a2 c9 ff ff    	jle    23bb7 <JS_CallInternal+0x10f7>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19931
   27215:	99                   	cdq
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19932
   27216:	48 c7 43 e8 00 00 00 	mov    QWORD PTR [rbx-0x18],0x0
   2721d:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19938
   2721e:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19933
   27222:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19931
   27226:	f7 fe                	idiv   esi
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:562
   27228:	48 63 d2             	movsxd rdx,edx
   2722b:	48 89 53 f0          	mov    QWORD PTR [rbx-0x10],rdx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19938
   2722f:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   27235:	49 89 c5             	mov    r13,rax
   27238:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2723c:	ff e0                	jmp    rax
   2723e:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19952
   27242:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19951
   27246:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19953
   2724a:	a9 f7 ff ff ff       	test   eax,0xfffffff7
   2724f:	74 1b                	je     2726c <JS_CallInternal+0x47ac>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19954
   27251:	83 e8 01             	sub    eax,0x1
   27254:	83 f8 01             	cmp    eax,0x1
   27257:	0f 87 2e 30 00 00    	ja     2a28b <JS_CallInternal+0x77cb>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19955
   2725d:	83 e2 ff             	and    edx,0xffffffff
   27260:	48 c7 43 f8 00 00 00 	mov    QWORD PTR [rbx-0x8],0x0
   27267:	00 
   27268:	48 89 53 f0          	mov    QWORD PTR [rbx-0x10],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19962
   2726c:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27271:	49 83 c4 01          	add    r12,0x1
   27275:	49 89 c5             	mov    r13,rax
   27278:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2727c:	ff e0                	jmp    rax
   2727e:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19907
   27282:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19907 (discriminator 1)
   27286:	0b 43 e8             	or     eax,DWORD PTR [rbx-0x18]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19905
   27289:	48 8b 4b e0          	mov    rcx,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19906
   2728d:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19907 (discriminator 1)
   27291:	0f 85 20 c9 ff ff    	jne    23bb7 <JS_CallInternal+0x10f7>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19911
   27297:	66 0f ef c0          	pxor   xmm0,xmm0
   2729b:	66 0f ef c9          	pxor   xmm1,xmm1
   2729f:	f2 0f 2a c1          	cvtsi2sd xmm0,ecx
   272a3:	f2 0f 2a ca          	cvtsi2sd xmm1,edx
   272a7:	f2 0f 5e c1          	divsd  xmm0,xmm1
JS_NewFloat64():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:602
   272ab:	66 0f 2f 05 25 c1 0a 	comisd xmm0,QWORD PTR [rip+0xac125]        # d33d8 <__PRETTY_FUNCTION__.0+0xc8>
   272b2:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:603
   272b3:	66 48 0f 7e c0       	movq   rax,xmm0
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:602
   272b8:	0f 82 d6 1e 00 00    	jb     29194 <JS_CallInternal+0x66d4>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:602 (discriminator 1)
   272be:	f2 0f 10 0d 1a c1 0a 	movsd  xmm1,QWORD PTR [rip+0xac11a]        # d33e0 <__PRETTY_FUNCTION__.0+0xd0>
   272c5:	00 
   272c6:	66 0f 2f c8          	comisd xmm1,xmm0
   272ca:	0f 82 c4 1e 00 00    	jb     29194 <JS_CallInternal+0x66d4>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:604
   272d0:	f2 0f 2c c8          	cvttsd2si ecx,xmm0
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:605
   272d4:	66 0f ef c9          	pxor   xmm1,xmm1
   272d8:	ba 08 00 00 00       	mov    edx,0x8
   272dd:	f2 0f 2a c9          	cvtsi2sd xmm1,ecx
   272e1:	66 48 0f 7e ce       	movq   rsi,xmm1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:608
   272e6:	48 39 f0             	cmp    rax,rsi
   272e9:	0f 84 7b 4e 00 00    	je     2c16a <JS_CallInternal+0x96aa>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19911
   272ef:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19917
   272f3:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19912
   272f7:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19911
   272fb:	48 89 53 f8          	mov    QWORD PTR [rbx-0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19917
   272ff:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   27305:	49 89 c5             	mov    r13,rax
   27308:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2730c:	ff e0                	jmp    rax
   2730e:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20001
   27312:	44 8b 5b f8          	mov    r11d,DWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20000
   27316:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20001
   2731a:	45 85 db             	test   r11d,r11d
   2731d:	0f 85 ec 23 00 00    	jne    2970f <JS_CallInternal+0x6c4f>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20003 (discriminator 1)
   27323:	3d ff ff ff 7f       	cmp    eax,0x7fffffff
   27328:	0f 84 e1 23 00 00    	je     2970f <JS_CallInternal+0x6c4f>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20005
   2732e:	83 c0 01             	add    eax,0x1
   27331:	48 c7 43 f8 00 00 00 	mov    QWORD PTR [rbx-0x8],0x0
   27338:	00 
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:562
   27339:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20013
   2733d:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27342:	49 83 c4 01          	add    r12,0x1
   27346:	49 89 c5             	mov    r13,rax
   27349:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2734d:	ff e0                	jmp    rax
   2734f:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19970
   27353:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19969
   27357:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19971
   2735b:	83 fa 02             	cmp    edx,0x2
   2735e:	0f 87 26 22 00 00    	ja     2958a <JS_CallInternal+0x6aca>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19976 (discriminator 1)
   27364:	85 c0                	test   eax,eax
   27366:	0f 84 3c 4a 00 00    	je     2bda8 <JS_CallInternal+0x92e8>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19980 (discriminator 1)
   2736c:	3d 00 00 00 80       	cmp    eax,0x80000000
   27371:	0f 84 14 4b 00 00    	je     2be8b <JS_CallInternal+0x93cb>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19984
   27377:	f7 d8                	neg    eax
   27379:	48 c7 43 f8 00 00 00 	mov    QWORD PTR [rbx-0x8],0x0
   27380:	00 
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:562
   27381:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19995
   27385:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   2738a:	49 83 c4 01          	add    r12,0x1
   2738e:	49 89 c5             	mov    r13,rax
   27391:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27395:	ff e0                	jmp    rax
   27397:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19069
   2739b:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19070
   273a2:	4c 8d 6b f0          	lea    r13,[rbx-0x10]
JS_Call():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20743
   273a6:	48 8b 4b c0          	mov    rcx,QWORD PTR [rbx-0x40]
   273aa:	48 c7 85 00 fe ff ff 	mov    QWORD PTR [rbp-0x200],0x0
   273b1:	00 00 00 00 
   273b5:	4c 8b 43 c8          	mov    r8,QWORD PTR [rbx-0x38]
   273b9:	48 8b 73 d0          	mov    rsi,QWORD PTR [rbx-0x30]
   273bd:	41 b9 01 00 00 00    	mov    r9d,0x1
   273c3:	48 c7 85 08 fe ff ff 	mov    QWORD PTR [rbp-0x1f8],0x3
   273ca:	03 00 00 00 
   273ce:	48 8b 53 d8          	mov    rdx,QWORD PTR [rbx-0x28]
   273d2:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19069
   273d9:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
JS_Call():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20743
   273dd:	6a 02                	push   0x2
   273df:	41 55                	push   r13
   273e1:	ff b5 08 fe ff ff    	push   QWORD PTR [rbp-0x1f8]
   273e7:	ff b5 00 fe ff ff    	push   QWORD PTR [rbp-0x200]
   273ed:	e8 ce b6 ff ff       	call   22ac0 <JS_CallInternal>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19072 (discriminator 1)
   273f2:	48 83 c4 20          	add    rsp,0x20
JS_Call():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20743
   273f6:	48 89 c1             	mov    rcx,rax
   273f9:	49 89 d6             	mov    r14,rdx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19072 (discriminator 1)
   273fc:	83 fa 06             	cmp    edx,0x6
   273ff:	0f 84 5b be ff ff    	je     23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19074
   27405:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   27409:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   2740d:	83 fa f6             	cmp    edx,0xfffffff6
   27410:	76 11                	jbe    27423 <JS_CallInternal+0x4963>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   27412:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   27415:	83 e8 01             	sub    eax,0x1
   27418:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2741b:	85 c0                	test   eax,eax
   2741d:	0f 8e 55 30 00 00    	jle    2a478 <JS_CallInternal+0x79b8>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19075
   27423:	48 89 4b f0          	mov    QWORD PTR [rbx-0x10],rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19077
   27427:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19075
   2742b:	4c 89 73 f8          	mov    QWORD PTR [rbx-0x8],r14
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19077
   2742f:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   27435:	49 89 c5             	mov    r13,rax
   27438:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2743c:	ff e0                	jmp    rax
   2743e:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19037
   27442:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   27446:	4c 8d 6b e0          	lea    r13,[rbx-0x20]
   2744a:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   2744e:	83 fa f6             	cmp    edx,0xfffffff6
   27451:	76 11                	jbe    27464 <JS_CallInternal+0x49a4>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   27453:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   27456:	83 e8 01             	sub    eax,0x1
   27459:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2745c:	85 c0                	test   eax,eax
   2745e:	0f 8e 37 30 00 00    	jle    2a49b <JS_CallInternal+0x79db>
JS_IsUndefined():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:638
   27464:	48 8b 43 d8          	mov    rax,QWORD PTR [rbx-0x28]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18054
   27468:	48 83 eb 30          	sub    rbx,0x30
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19039 (discriminator 1)
   2746c:	83 f8 03             	cmp    eax,0x3
   2746f:	74 45                	je     274b6 <JS_CallInternal+0x49f6>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19040
   27471:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19041
   27478:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
   2747b:	31 c9                	xor    ecx,ecx
   2747d:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
   27481:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19040
   27488:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19041
   2748c:	e8 df 9a 00 00       	call   30f70 <JS_IteratorClose>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19041 (discriminator 1)
   27491:	85 c0                	test   eax,eax
   27493:	0f 85 0f 58 00 00    	jne    2cca8 <JS_CallInternal+0xa1e8>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19043
   27499:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
   2749d:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   274a0:	83 fa f6             	cmp    edx,0xfffffff6
   274a3:	76 11                	jbe    274b6 <JS_CallInternal+0x49f6>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   274a5:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   274a8:	83 e8 01             	sub    eax,0x1
   274ab:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   274ae:	85 c0                	test   eax,eax
   274b0:	0f 8e 16 4d 00 00    	jle    2c1cc <JS_CallInternal+0x970c>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19046
   274b6:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   274bb:	49 83 c4 01          	add    r12,0x1
   274bf:	49 89 c5             	mov    r13,rax
   274c2:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   274c6:	ff e0                	jmp    rax
   274c8:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20446
   274cc:	4c 8b 43 f8          	mov    r8,QWORD PTR [rbx-0x8]
   274d0:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20447
   274d4:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   274db:	4c 89 c2             	mov    rdx,r8
   274de:	e8 dd 44 ff ff       	call   1b9c0 <js_operator_typeof>
   274e3:	41 89 c5             	mov    r13d,eax
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   274e6:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   274ea:	76 11                	jbe    274fd <JS_CallInternal+0x4a3d>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   274ec:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   274ef:	83 e8 01             	sub    eax,0x1
   274f2:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   274f5:	85 c0                	test   eax,eax
   274f7:	0f 8e 98 34 00 00    	jle    2a995 <JS_CallInternal+0x7ed5>
JS_AtomToString():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3638
   274fd:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   27504:	44 89 ee             	mov    esi,r13d
   27507:	ba 01 00 00 00       	mov    edx,0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20451
   2750c:	49 83 c4 01          	add    r12,0x1
JS_AtomToString():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3638
   27510:	e8 db ca 00 00       	call   33ff0 <__JS_AtomToValue>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20449
   27515:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   27519:	48 89 53 f8          	mov    QWORD PTR [rbx-0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20451
   2751d:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   27523:	49 89 c5             	mov    r13,rax
   27526:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2752a:	ff e0                	jmp    rax
   2752c:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19028 (discriminator 2)
   27530:	83 7b f8 ff          	cmp    DWORD PTR [rbx-0x8],0xffffffff
   27534:	0f 85 8d 37 00 00    	jne    2acc7 <JS_CallInternal+0x8207>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19032
   2753a:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   2753f:	49 83 c4 01          	add    r12,0x1
   27543:	49 89 c5             	mov    r13,rax
   27546:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2754a:	ff e0                	jmp    rax
   2754c:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19623
   27550:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19624
   27557:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   2755b:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   2755f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19623
   27566:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19624
   2756a:	48 8d 43 e0          	lea    rax,[rbx-0x20]
   2756e:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   27575:	e8 e6 c4 01 00       	call   43a60 <JS_ValueToAtom>
   2757a:	41 89 c5             	mov    r13d,eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19625 (discriminator 1)
   2757d:	45 85 ed             	test   r13d,r13d
   27580:	0f 84 da bc ff ff    	je     23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19627 (discriminator 2)
   27586:	83 7b d8 03          	cmp    DWORD PTR [rbx-0x28],0x3
   2758a:	0f 84 44 3a 00 00    	je     2afd4 <JS_CallInternal+0x8514>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19636
   27590:	48 8b 73 d0          	mov    rsi,QWORD PTR [rbx-0x30]
   27594:	48 8b 53 d8          	mov    rdx,QWORD PTR [rbx-0x28]
   27598:	44 89 e9             	mov    ecx,r13d
   2759b:	4c 8d 73 d0          	lea    r14,[rbx-0x30]
   2759f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   275a6:	e8 e5 6b 04 00       	call   6e190 <JS_HasProperty>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19637 (discriminator 1)
   275ab:	85 c0                	test   eax,eax
   275ad:	0f 8e c9 39 00 00    	jle    2af7c <JS_CallInternal+0x84bc>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19648
   275b3:	48 83 ec 08          	sub    rsp,0x8
   275b7:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   275bb:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   275bf:	44 89 e9             	mov    ecx,r13d
   275c2:	49 8b 36             	mov    rsi,QWORD PTR [r14]
   275c5:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   275c9:	68 00 80 00 00       	push   0x8000
   275ce:	41 ff 76 08          	push   QWORD PTR [r14+0x8]
   275d2:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   275d9:	41 ff 36             	push   QWORD PTR [r14]
   275dc:	e8 ff 64 00 00       	call   2dae0 <JS_SetPropertyInternal>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3735 (discriminator 1)
   275e1:	48 83 c4 20          	add    rsp,0x20
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19648
   275e5:	89 c3                	mov    ebx,eax
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3735 (discriminator 1)
   275e7:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   275ee:	0f 8f 89 2a 00 00    	jg     2a07d <JS_CallInternal+0x75bd>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19650
   275f4:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   275fb:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   275ff:	48 8b 30             	mov    rsi,QWORD PTR [rax]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   27602:	83 fa f6             	cmp    edx,0xfffffff6
   27605:	76 11                	jbe    27618 <JS_CallInternal+0x4b58>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   27607:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2760a:	83 e8 01             	sub    eax,0x1
   2760d:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   27610:	85 c0                	test   eax,eax
   27612:	0f 8e 74 3f 00 00    	jle    2b58c <JS_CallInternal+0x8acc>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19651
   27618:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   2761c:	49 8b 36             	mov    rsi,QWORD PTR [r14]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   2761f:	83 fa f6             	cmp    edx,0xfffffff6
   27622:	76 11                	jbe    27635 <JS_CallInternal+0x4b75>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   27624:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   27627:	83 e8 01             	sub    eax,0x1
   2762a:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2762d:	85 c0                	test   eax,eax
   2762f:	0f 8e 26 3a 00 00    	jle    2b05b <JS_CallInternal+0x859b>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19653 (discriminator 1)
   27635:	85 db                	test   ebx,ebx
   27637:	0f 88 6d 44 00 00    	js     2baaa <JS_CallInternal+0x8fea>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19656
   2763d:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19652
   27642:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19656
   27645:	49 83 c4 01          	add    r12,0x1
   27649:	49 89 c5             	mov    r13,rax
   2764c:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27650:	ff e0                	jmp    rax
   27652:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20141
   27656:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20141 (discriminator 1)
   2765a:	0b 53 e8             	or     edx,DWORD PTR [rbx-0x18]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20139
   2765d:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20140
   27661:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20141 (discriminator 1)
   27665:	0f 85 62 3c 00 00    	jne    2b2cd <JS_CallInternal+0x880d>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20146
   2766b:	d3 e0                	shl    eax,cl
   2766d:	48 c7 43 e8 00 00 00 	mov    QWORD PTR [rbx-0x18],0x0
   27674:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20147
   27675:	48 83 eb 10          	sub    rbx,0x10
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:562
   27679:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20155
   2767d:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27682:	49 83 c4 01          	add    r12,0x1
   27686:	49 89 c5             	mov    r13,rax
   27689:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2768d:	ff e0                	jmp    rax
   2768f:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18885
   27693:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18888
   27697:	83 7b f8 03          	cmp    DWORD PTR [rbx-0x8],0x3
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18886
   2769b:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18885
   276a0:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   276a4:	48 89 c8             	mov    rax,rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18888
   276a7:	0f 87 d4 24 00 00    	ja     29b81 <JS_CallInternal+0x70c1>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18893
   276ad:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18894
   276b1:	85 c0                	test   eax,eax
   276b3:	75 0c                	jne    276c1 <JS_CallInternal+0x4c01>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18895 (discriminator 1)
   276b5:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   276b9:	83 e8 04             	sub    eax,0x4
   276bc:	48 98                	cdqe
   276be:	49 01 c5             	add    r13,rax
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7900
   276c1:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   276c8:	8b 81 a8 01 00 00    	mov    eax,DWORD PTR [rcx+0x1a8]
   276ce:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   276d4:	83 e8 01             	sub    eax,0x1
   276d7:	89 81 a8 01 00 00    	mov    DWORD PTR [rcx+0x1a8],eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7900 (discriminator 1)
   276dd:	85 c0                	test   eax,eax
   276df:	0f 8e 0f 3a 00 00    	jle    2b0f4 <JS_CallInternal+0x8634>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18900
   276e5:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
   276ea:	4d 8d 65 01          	lea    r12,[r13+0x1]
   276ee:	49 89 c5             	mov    r13,rax
   276f1:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   276f5:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20294
   276f9:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
   276fd:	48 8b 73 e8          	mov    rsi,QWORD PTR [rbx-0x18]
   27701:	48 8b 53 e0          	mov    rdx,QWORD PTR [rbx-0x20]
   27705:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20294 (discriminator 1)
   27709:	89 cf                	mov    edi,ecx
   2770b:	09 f7                	or     edi,esi
   2770d:	0f 85 20 3c 00 00    	jne    2b333 <JS_CallInternal+0x8873>
   27713:	39 c2                	cmp    edx,eax
   27715:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   2771c:	00 
   2771d:	0f 9d c0             	setge  al
   27720:	48 83 eb 10          	sub    rbx,0x10
   27724:	0f b6 c0             	movzx  eax,al
   27727:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20294
   2772b:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27730:	49 83 c4 01          	add    r12,0x1
   27734:	49 89 c5             	mov    r13,rax
   27737:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2773b:	ff e0                	jmp    rax
   2773d:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19212
   27741:	4c 8b 73 e8          	mov    r14,QWORD PTR [rbx-0x18]
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:181
   27745:	41 8b 0c 24          	mov    ecx,DWORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19210
   27749:	4d 8d 54 24 04       	lea    r10,[r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19212
   2774e:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
   27752:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   27756:	4c 8b 6b e0          	mov    r13,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19213 (discriminator 1)
   2775a:	41 83 fe ff          	cmp    r14d,0xffffffff
   2775e:	0f 85 af 23 00 00    	jne    29b13 <JS_CallInternal+0x7053>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6151
   27764:	4d 8b 4d 18          	mov    r9,QWORD PTR [r13+0x18]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6152
   27768:	41 8b 79 18          	mov    edi,DWORD PTR [r9+0x18]
   2776c:	89 fe                	mov    esi,edi
   2776e:	21 ce                	and    esi,ecx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6153
   27770:	41 8b 74 b1 38       	mov    esi,DWORD PTR [r9+rsi*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6155
   27775:	48 85 f6             	test   rsi,rsi
   27778:	0f 84 95 23 00 00    	je     29b13 <JS_CallInternal+0x7053>
   2777e:	48 8d 3c bd 34 00 00 	lea    rdi,[rdi*4+0x34]
   27785:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6156
   27786:	4c 8d 04 f7          	lea    r8,[rdi+rsi*8]
   2778a:	4d 01 c8             	add    r8,r9
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6157 (discriminator 1)
   2778d:	41 39 48 04          	cmp    DWORD PTR [r8+0x4],ecx
   27791:	0f 85 6d 23 00 00    	jne    29b04 <JS_CallInternal+0x7044>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6158
   27797:	49 8b 7d 20          	mov    rdi,QWORD PTR [r13+0x20]
   2779b:	48 c1 e6 04          	shl    rsi,0x4
   2779f:	48 8d 7c 37 f0       	lea    rdi,[rdi+rsi*1-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19218
   277a4:	41 0f b6 70 03       	movzx  esi,BYTE PTR [r8+0x3]
   277a9:	40 c0 ee 02          	shr    sil,0x2
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19218 (discriminator 1)
   277ad:	83 e6 3a             	and    esi,0x3a
   277b0:	40 80 fe 02          	cmp    sil,0x2
   277b4:	0f 85 59 23 00 00    	jne    29b13 <JS_CallInternal+0x7053>
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   277ba:	48 8b 57 08          	mov    rdx,QWORD PTR [rdi+0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   277be:	f3 0f 6f 73 f0       	movdqu xmm6,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   277c3:	48 8b 37             	mov    rsi,QWORD PTR [rdi]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   277c6:	0f 11 37             	movups XMMWORD PTR [rdi],xmm6
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   277c9:	83 fa f6             	cmp    edx,0xfffffff6
   277cc:	76 11                	jbe    277df <JS_CallInternal+0x4d1f>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   277ce:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   277d1:	83 e8 01             	sub    eax,0x1
   277d4:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   277d7:	85 c0                	test   eax,eax
   277d9:	0f 8e d7 43 00 00    	jle    2bbb6 <JS_CallInternal+0x90f6>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   277df:	41 83 fe f6          	cmp    r14d,0xfffffff6
   277e3:	76 13                	jbe    277f8 <JS_CallInternal+0x4d38>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   277e5:	41 8b 45 fc          	mov    eax,DWORD PTR [r13-0x4]
   277e9:	83 e8 01             	sub    eax,0x1
   277ec:	41 89 45 fc          	mov    DWORD PTR [r13-0x4],eax
   277f0:	85 c0                	test   eax,eax
   277f2:	0f 8e d3 43 00 00    	jle    2bbcb <JS_CallInternal+0x910b>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19226
   277f8:	48 83 eb 20          	sub    rbx,0x20
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19239
   277fc:	41 0f b6 44 24 04    	movzx  eax,BYTE PTR [r12+0x4]
   27802:	49 83 c4 05          	add    r12,0x5
   27806:	49 89 c5             	mov    r13,rax
   27809:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2780d:	ff e0                	jmp    rax
   2780f:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20078
   27813:	45 0f b6 2c 24       	movzx  r13d,BYTE PTR [r12]
   27818:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20076
   2781f:	4d 8d 74 24 01       	lea    r14,[r12+0x1]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20078
   27824:	49 c1 e5 04          	shl    r13,0x4
   27828:	49 01 c5             	add    r13,rax
   2782b:	f3 41 0f 6f 55 00    	movdqu xmm2,XMMWORD PTR [r13+0x0]
   27831:	0f 29 95 f0 fe ff ff 	movaps XMMWORD PTR [rbp-0x110],xmm2
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20079
   27838:	48 8b 95 f8 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x108]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20080
   2783f:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20079
   27846:	85 d2                	test   edx,edx
   27848:	0f 85 50 1c 00 00    	jne    2949e <JS_CallInternal+0x69de>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20081 (discriminator 1)
   2784e:	3d ff ff ff 7f       	cmp    eax,0x7fffffff
   27853:	0f 84 45 1c 00 00    	je     2949e <JS_CallInternal+0x69de>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20083
   27859:	83 c0 01             	add    eax,0x1
   2785c:	49 c7 45 08 00 00 00 	mov    QWORD PTR [r13+0x8],0x0
   27863:	00 
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:562
   27864:	49 89 45 00          	mov    QWORD PTR [r13+0x0],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20095
   27868:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
   2786e:	49 83 c4 02          	add    r12,0x2
   27872:	49 89 c5             	mov    r13,rax
   27875:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27879:	ff e0                	jmp    rax
   2787b:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20056
   2787f:	44 8b 43 f8          	mov    r8d,DWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20055
   27883:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20056
   27887:	45 85 c0             	test   r8d,r8d
   2788a:	0f 85 b0 1e 00 00    	jne    29740 <JS_CallInternal+0x6c80>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20058 (discriminator 1)
   27890:	3d 00 00 00 80       	cmp    eax,0x80000000
   27895:	0f 84 a5 1e 00 00    	je     29740 <JS_CallInternal+0x6c80>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20060
   2789b:	83 e8 01             	sub    eax,0x1
   2789e:	48 c7 43 08 00 00 00 	mov    QWORD PTR [rbx+0x8],0x0
   278a5:	00 
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:562
   278a6:	48 89 03             	mov    QWORD PTR [rbx],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20069
   278a9:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20067
   278ae:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20069
   278b2:	49 83 c4 01          	add    r12,0x1
   278b6:	49 89 c5             	mov    r13,rax
   278b9:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   278bd:	ff e0                	jmp    rax
   278bf:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18992
   278c3:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18993
   278ca:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   278d1:	31 d2                	xor    edx,edx
   278d3:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18992
   278d6:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18993
   278da:	e8 71 e1 06 00       	call   95a50 <js_for_of_start>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18993 (discriminator 1)
   278df:	85 c0                	test   eax,eax
   278e1:	0f 85 79 b9 ff ff    	jne    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18996
   278e7:	48 c7 43 10 00 00 00 	mov    QWORD PTR [rbx+0x10],0x0
   278ee:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18997
   278ef:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18996
   278f3:	48 83 c3 20          	add    rbx,0x20
   278f7:	48 c7 43 f8 05 00 00 	mov    QWORD PTR [rbx-0x8],0x5
   278fe:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18997
   278ff:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   27905:	49 89 c5             	mov    r13,rax
   27908:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2790c:	ff e0                	jmp    rax
   2790e:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20421
   27912:	48 8b 53 e0          	mov    rdx,QWORD PTR [rbx-0x20]
   27916:	4c 8b 4b e8          	mov    r9,QWORD PTR [rbx-0x18]
   2791a:	4c 8b 6b f0          	mov    r13,QWORD PTR [rbx-0x10]
   2791e:	4c 8b 73 f8          	mov    r14,QWORD PTR [rbx-0x8]
   27922:	48 89 d7             	mov    rdi,rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20421 (discriminator 1)
   27925:	45 85 c9             	test   r9d,r9d
   27928:	0f 85 b3 33 00 00    	jne    2ace1 <JS_CallInternal+0x8221>
   2792e:	45 85 f6             	test   r14d,r14d
   27931:	0f 85 67 1d 00 00    	jne    2969e <JS_CallInternal+0x6bde>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   27937:	31 c0                	xor    eax,eax
   27939:	44 39 ea             	cmp    edx,r13d
   2793c:	0f 95 c0             	setne  al
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20421 (discriminator 26)
   2793f:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
   27943:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20421 (discriminator 1)
   27947:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20421 (discriminator 26)
   2794b:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   27952:	00 
   27953:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   27959:	49 89 c5             	mov    r13,rax
   2795c:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27960:	ff e0                	jmp    rax
   27962:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20420
   27966:	48 8b 53 e0          	mov    rdx,QWORD PTR [rbx-0x20]
   2796a:	4c 8b 43 e8          	mov    r8,QWORD PTR [rbx-0x18]
   2796e:	4c 8b 6b f0          	mov    r13,QWORD PTR [rbx-0x10]
   27972:	4c 8b 73 f8          	mov    r14,QWORD PTR [rbx-0x8]
   27976:	48 89 d7             	mov    rdi,rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20420 (discriminator 1)
   27979:	45 85 c0             	test   r8d,r8d
   2797c:	0f 85 12 3d 00 00    	jne    2b694 <JS_CallInternal+0x8bd4>
   27982:	45 85 f6             	test   r14d,r14d
   27985:	0f 85 41 1d 00 00    	jne    296cc <JS_CallInternal+0x6c0c>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20420 (discriminator 3)
   2798b:	31 c0                	xor    eax,eax
   2798d:	44 39 ea             	cmp    edx,r13d
   27990:	0f 94 c0             	sete   al
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20420 (discriminator 26)
   27993:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
   27997:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20420 (discriminator 1)
   2799b:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20420 (discriminator 26)
   2799f:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   279a6:	00 
   279a7:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   279ad:	49 89 c5             	mov    r13,rax
   279b0:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   279b4:	ff e0                	jmp    rax
   279b6:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20436
   279ba:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
js_operator_instanceof():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16032
   279c1:	4c 8b 73 f0          	mov    r14,QWORD PTR [rbx-0x10]
   279c5:	4c 8b 6b f8          	mov    r13,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16031
   279c9:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20436
   279cd:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
js_operator_instanceof():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16031
   279d1:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16033
   279d5:	4c 89 f1             	mov    rcx,r14
   279d8:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   279df:	4d 89 e8             	mov    r8,r13
   279e2:	48 89 b5 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rsi
   279e9:	48 89 95 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rdx
   279f0:	e8 1b ba 00 00       	call   33410 <JS_IsInstanceOf>
   279f5:	89 c1                	mov    ecx,eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16034
   279f7:	85 c0                	test   eax,eax
   279f9:	0f 88 61 b8 ff ff    	js     23260 <JS_CallInternal+0x7a0>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   279ff:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
   27a06:	83 fa f6             	cmp    edx,0xfffffff6
   27a09:	76 18                	jbe    27a23 <JS_CallInternal+0x4f63>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   27a0b:	48 8b b5 40 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c0]
   27a12:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   27a15:	83 e8 01             	sub    eax,0x1
   27a18:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   27a1b:	85 c0                	test   eax,eax
   27a1d:	0f 8e 72 41 00 00    	jle    2bb95 <JS_CallInternal+0x90d5>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   27a23:	41 83 fd f6          	cmp    r13d,0xfffffff6
   27a27:	76 13                	jbe    27a3c <JS_CallInternal+0x4f7c>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   27a29:	41 8b 46 fc          	mov    eax,DWORD PTR [r14-0x4]
   27a2d:	83 e8 01             	sub    eax,0x1
   27a30:	41 89 46 fc          	mov    DWORD PTR [r14-0x4],eax
   27a34:	85 c0                	test   eax,eax
   27a36:	0f 8e f8 41 00 00    	jle    2bc34 <JS_CallInternal+0x9174>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   27a3c:	31 c0                	xor    eax,eax
   27a3e:	85 c9                	test   ecx,ecx
js_operator_instanceof():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16038
   27a40:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   27a47:	00 
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   27a48:	0f 95 c0             	setne  al
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20439
   27a4b:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20440
   27a4f:	49 83 c4 01          	add    r12,0x1
js_operator_instanceof():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16038
   27a53:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20440
   27a57:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   27a5d:	49 89 c5             	mov    r13,rax
   27a60:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27a64:	ff e0                	jmp    rax
   27a66:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20238
   27a6a:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20238 (discriminator 1)
   27a6e:	0b 53 e8             	or     edx,DWORD PTR [rbx-0x18]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20236
   27a71:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20237
   27a75:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20238 (discriminator 1)
   27a79:	0f 85 cc 36 00 00    	jne    2b14b <JS_CallInternal+0x868b>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20239
   27a7f:	31 c8                	xor    eax,ecx
   27a81:	48 c7 43 e8 00 00 00 	mov    QWORD PTR [rbx-0x18],0x0
   27a88:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20242
   27a89:	48 83 eb 10          	sub    rbx,0x10
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:562
   27a8d:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20250
   27a91:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27a96:	49 83 c4 01          	add    r12,0x1
   27a9a:	49 89 c5             	mov    r13,rax
   27a9d:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27aa1:	ff e0                	jmp    rax
   27aa3:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20220
   27aa7:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20220 (discriminator 1)
   27aab:	0b 53 e8             	or     edx,DWORD PTR [rbx-0x18]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20218
   27aae:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20219
   27ab2:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20220 (discriminator 1)
   27ab6:	0f 85 2f 3d 00 00    	jne    2b7eb <JS_CallInternal+0x8d2b>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20221
   27abc:	09 c8                	or     eax,ecx
   27abe:	48 c7 43 e8 00 00 00 	mov    QWORD PTR [rbx-0x18],0x0
   27ac5:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20224
   27ac6:	48 83 eb 10          	sub    rbx,0x10
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:562
   27aca:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20232
   27ace:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27ad3:	49 83 c4 01          	add    r12,0x1
   27ad7:	49 89 c5             	mov    r13,rax
   27ada:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27ade:	ff e0                	jmp    rax
   27ae0:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19710
   27ae4:	41 0f b6 3c 24       	movzx  edi,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19711
   27ae9:	48 8b 8d c8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19710
   27af0:	4d 8d 6c 24 01       	lea    r13,[r12+0x1]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19712
   27af5:	45 31 c9             	xor    r9d,r9d
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19713
   27af8:	89 fa                	mov    edx,edi
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19710
   27afa:	89 f8                	mov    eax,edi
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19711
   27afc:	4c 89 69 30          	mov    QWORD PTR [rcx+0x30],r13
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19713
   27b00:	c1 fa 02             	sar    edx,0x2
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19712
   27b03:	83 e0 03             	and    eax,0x3
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19713
   27b06:	83 e2 07             	and    edx,0x7
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19712
   27b09:	f7 d0                	not    eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19713
   27b0b:	f7 d2                	not    edx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19712
   27b0d:	48 98                	cdqe
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19713
   27b0f:	48 63 d2             	movsxd rdx,edx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19712
   27b12:	48 c1 e0 04          	shl    rax,0x4
   27b16:	48 c1 e2 04          	shl    rdx,0x4
   27b1a:	48 01 d8             	add    rax,rbx
   27b1d:	48 01 da             	add    rdx,rbx
   27b20:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   27b23:	48 8b 0a             	mov    rcx,QWORD PTR [rdx]
   27b26:	4c 8b 42 08          	mov    r8,QWORD PTR [rdx+0x8]
   27b2a:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19714
   27b2e:	89 f8                	mov    eax,edi
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19712
   27b30:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19714
   27b37:	c1 f8 05             	sar    eax,0x5
   27b3a:	f7 d0                	not    eax
   27b3c:	48 98                	cdqe
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19712
   27b3e:	48 c1 e0 04          	shl    rax,0x4
   27b42:	ff 74 03 08          	push   QWORD PTR [rbx+rax*1+0x8]
   27b46:	ff 34 03             	push   QWORD PTR [rbx+rax*1]
   27b49:	e8 92 39 06 00       	call   8b4e0 <JS_CopyDataProperties>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19712 (discriminator 1)
   27b4e:	41 5e                	pop    r14
   27b50:	5a                   	pop    rdx
   27b51:	85 c0                	test   eax,eax
   27b53:	0f 85 57 49 00 00    	jne    2c4b0 <JS_CallInternal+0x99f0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19717
   27b59:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
   27b5f:	49 83 c4 02          	add    r12,0x2
   27b63:	49 89 c5             	mov    r13,rax
   27b66:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27b6a:	ff e0                	jmp    rax
   27b6c:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20293
   27b70:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
   27b74:	48 8b 73 e8          	mov    rsi,QWORD PTR [rbx-0x18]
   27b78:	48 8b 53 e0          	mov    rdx,QWORD PTR [rbx-0x20]
   27b7c:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20293 (discriminator 1)
   27b80:	89 cf                	mov    edi,ecx
   27b82:	09 f7                	or     edi,esi
   27b84:	0f 85 8d 36 00 00    	jne    2b217 <JS_CallInternal+0x8757>
   27b8a:	39 c2                	cmp    edx,eax
   27b8c:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   27b93:	00 
   27b94:	0f 9f c0             	setg   al
   27b97:	48 83 eb 10          	sub    rbx,0x10
   27b9b:	0f b6 c0             	movzx  eax,al
   27b9e:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20293
   27ba2:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27ba7:	49 83 c4 01          	add    r12,0x1
   27bab:	49 89 c5             	mov    r13,rax
   27bae:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27bb2:	ff e0                	jmp    rax
   27bb4:	f3 0f 1e fa          	endbr64
close_lexical_var():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17572
   27bb8:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18792 (discriminator 1)
   27bbf:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
close_lexical_var():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17572
   27bc4:	0f b7 51 38          	movzx  edx,WORD PTR [rcx+0x38]
   27bc8:	4c 8b 51 28          	mov    r10,QWORD PTR [rcx+0x28]
   27bcc:	01 d0                	add    eax,edx
   27bce:	48 98                	cdqe
   27bd0:	48 8d 04 40          	lea    rax,[rax+rax*2]
   27bd4:	49 8d 04 82          	lea    rax,[r10+rax*4]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17573
   27bd8:	44 0f b7 68 0a       	movzx  r13d,WORD PTR [rax+0xa]
   27bdd:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   27be4:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
   27be8:	49 c1 e5 03          	shl    r13,0x3
   27bec:	4c 01 e9             	add    rcx,r13
   27bef:	4c 8b 31             	mov    r14,QWORD PTR [rcx]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17574
   27bf2:	4d 85 f6             	test   r14,r14
   27bf5:	74 50                	je     27c47 <JS_CallInternal+0x5187>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17575
   27bf7:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   27bfe:	48 8b 7f 10          	mov    rdi,QWORD PTR [rdi+0x10]
close_var_ref():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17544
   27c02:	f6 40 3c 04          	test   BYTE PTR [rax+0x3c],0x4
   27c06:	0f 85 b5 27 00 00    	jne    2a3c1 <JS_CallInternal+0x7901>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17548
   27c0c:	49 8b 56 18          	mov    rdx,QWORD PTR [r14+0x18]
   27c10:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   27c13:	48 8b 52 08          	mov    rdx,QWORD PTR [rdx+0x8]
JS_DupValueRT():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:718
   27c17:	83 fa f6             	cmp    edx,0xfffffff6
   27c1a:	76 04                	jbe    27c20 <JS_CallInternal+0x5160>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:720
   27c1c:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
close_var_ref():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17549
   27c20:	49 8d 7e 20          	lea    rdi,[r14+0x20]
   27c24:	66 48 0f 6e e0       	movq   xmm4,rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17548
   27c29:	49 89 56 28          	mov    QWORD PTR [r14+0x28],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17549
   27c2d:	66 48 0f 6e c7       	movq   xmm0,rdi
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17551
   27c32:	41 c6 46 10 01       	mov    BYTE PTR [r14+0x10],0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17549
   27c37:	66 0f 6c c4          	punpcklqdq xmm0,xmm4
   27c3b:	41 0f 11 46 18       	movups XMMWORD PTR [r14+0x18],xmm0
close_lexical_var():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17576
   27c40:	48 c7 01 00 00 00 00 	mov    QWORD PTR [rcx],0x0
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18796
   27c47:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
   27c4d:	49 83 c4 03          	add    r12,0x3
   27c51:	49 89 c5             	mov    r13,rax
   27c54:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27c58:	ff e0                	jmp    rax
   27c5a:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20291
   27c5e:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
   27c62:	48 8b 73 e8          	mov    rsi,QWORD PTR [rbx-0x18]
   27c66:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
   27c6a:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20291 (discriminator 1)
   27c6e:	89 cf                	mov    edi,ecx
   27c70:	09 f7                	or     edi,esi
   27c72:	0f 85 22 3c 00 00    	jne    2b89a <JS_CallInternal+0x8dda>
   27c78:	39 d0                	cmp    eax,edx
   27c7a:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   27c81:	00 
   27c82:	0f 9c c0             	setl   al
   27c85:	48 83 eb 10          	sub    rbx,0x10
   27c89:	0f b6 c0             	movzx  eax,al
   27c8c:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20291
   27c90:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27c95:	49 83 c4 01          	add    r12,0x1
   27c99:	49 89 c5             	mov    r13,rax
   27c9c:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27ca0:	ff e0                	jmp    rax
   27ca2:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19119
   27ca6:	83 7b f8 03          	cmp    DWORD PTR [rbx-0x8],0x3
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19118
   27caa:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   27cae:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19119
   27cb2:	0f 87 11 20 00 00    	ja     29cc9 <JS_CallInternal+0x7209>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19120
   27cb8:	31 c0                	xor    eax,eax
   27cba:	85 d2                	test   edx,edx
   27cbc:	0f 95 c0             	setne  al
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19124
   27cbf:	85 c0                	test   eax,eax
   27cc1:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   27cc8:	00 
   27cc9:	0f 94 c0             	sete   al
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19126
   27ccc:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19124
   27cd0:	0f b6 c0             	movzx  eax,al
   27cd3:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19126
   27cd7:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   27cdd:	49 89 c5             	mov    r13,rax
   27ce0:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27ce4:	ff e0                	jmp    rax
   27ce6:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19085
   27cea:	45 0f b6 34 24       	movzx  r14d,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19086
   27cef:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19085
   27cf6:	4d 8d 6c 24 01       	lea    r13,[r12+0x1]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19086
   27cfb:	4c 8b 43 c0          	mov    r8,QWORD PTR [rbx-0x40]
   27cff:	4c 8b 4b c8          	mov    r9,QWORD PTR [rbx-0x38]
   27d03:	4c 89 68 30          	mov    QWORD PTR [rax+0x30],r13
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19087
   27d07:	44 89 f0             	mov    eax,r14d
JS_GetProperty():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:782
   27d0a:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19087
   27d11:	83 e0 01             	and    eax,0x1
JS_GetProperty():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:782
   27d14:	4c 89 c6             	mov    rsi,r8
   27d17:	4c 89 ca             	mov    rdx,r9
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19087 (discriminator 1)
   27d1a:	3c 01                	cmp    al,0x1
   27d1c:	19 c9                	sbb    ecx,ecx
JS_GetProperty():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:782
   27d1e:	48 83 ec 08          	sub    rsp,0x8
   27d22:	6a 00                	push   0x0
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19087 (discriminator 1)
   27d24:	83 e1 ef             	and    ecx,0xffffffef
   27d27:	83 c1 17             	add    ecx,0x17
JS_GetProperty():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:782
   27d2a:	e8 81 50 00 00       	call   2cdb0 <JS_GetPropertyInternal>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19089 (discriminator 1)
   27d2f:	59                   	pop    rcx
   27d30:	5e                   	pop    rsi
   27d31:	83 fa 06             	cmp    edx,0x6
   27d34:	0f 84 f7 26 00 00    	je     2a431 <JS_CallInternal+0x7971>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19091 (discriminator 1)
   27d3a:	8d 72 fe             	lea    esi,[rdx-0x2]
   27d3d:	b9 01 00 00 00       	mov    ecx,0x1
   27d42:	83 fe 01             	cmp    esi,0x1
   27d45:	0f 87 55 1a 00 00    	ja     297a0 <JS_CallInternal+0x6ce0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19108
   27d4b:	48 89 0b             	mov    QWORD PTR [rbx],rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19111
   27d4e:	49 83 c4 02          	add    r12,0x2
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19109
   27d52:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19108
   27d56:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   27d5d:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19111
   27d5e:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   27d64:	49 89 c5             	mov    r13,rax
   27d67:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27d6b:	ff e0                	jmp    rax
   27d6d:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19051
   27d71:	4c 8b 6b f0          	mov    r13,QWORD PTR [rbx-0x10]
   27d75:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
   27d79:	48 8b 5b f8          	mov    rbx,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19052
   27d7d:	4c 39 b5 68 fe ff ff 	cmp    QWORD PTR [rbp-0x198],r14
   27d84:	0f 83 0c 12 00 00    	jae    28f96 <JS_CallInternal+0x64d6>
   27d8a:	48 89 d8             	mov    rax,rbx
   27d8d:	4c 89 a5 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r12
   27d94:	4c 89 f3             	mov    rbx,r14
   27d97:	4c 8b a5 68 fe ff ff 	mov    r12,QWORD PTR [rbp-0x198]
   27d9e:	49 89 c6             	mov    r14,rax
   27da1:	eb 0e                	jmp    27db1 <JS_CallInternal+0x52f1>
   27da3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   27da8:	49 39 dc             	cmp    r12,rbx
   27dab:	0f 83 d5 11 00 00    	jae    28f86 <JS_CallInternal+0x64c6>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19052 (discriminator 1)
   27db1:	83 7b f8 05          	cmp    DWORD PTR [rbx-0x8],0x5
   27db5:	0f 84 cb 11 00 00    	je     28f86 <JS_CallInternal+0x64c6>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19054
   27dbb:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
   27dbf:	48 83 eb 10          	sub    rbx,0x10
   27dc3:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   27dc6:	83 f9 f6             	cmp    ecx,0xfffffff6
   27dc9:	76 dd                	jbe    27da8 <JS_CallInternal+0x52e8>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   27dcb:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   27dce:	8d 50 ff             	lea    edx,[rax-0x1]
   27dd1:	89 56 fc             	mov    DWORD PTR [rsi-0x4],edx
   27dd4:	85 d2                	test   edx,edx
   27dd6:	7f d0                	jg     27da8 <JS_CallInternal+0x52e8>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   27dd8:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   27ddf:	48 89 ca             	mov    rdx,rcx
   27de2:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   27de6:	e8 b5 4a ff ff       	call   1c8a0 <__JS_FreeValueRT>
   27deb:	eb bb                	jmp    27da8 <JS_CallInternal+0x52e8>
   27ded:	f3 0f 1e fa          	endbr64
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19471
   27df1:	48 8b 43 e8          	mov    rax,QWORD PTR [rbx-0x18]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19471 (discriminator 1)
   27df5:	4c 8b 6b f8          	mov    r13,QWORD PTR [rbx-0x8]
   27df9:	83 f8 ff             	cmp    eax,0xffffffff
   27dfc:	0f 85 d6 1f 00 00    	jne    29dd8 <JS_CallInternal+0x7318>
   27e02:	45 85 ed             	test   r13d,r13d
   27e05:	0f 85 44 36 00 00    	jne    2b44f <JS_CallInternal+0x898f>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19473
   27e0b:	48 8b 53 e0          	mov    rdx,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19474
   27e0f:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19475 (discriminator 1)
   27e13:	66 83 7a 12 02       	cmp    WORD PTR [rdx+0x12],0x2
   27e18:	0f 85 2f 20 00 00    	jne    29e4d <JS_CallInternal+0x738d>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19477 (discriminator 1)
   27e1e:	3b 42 38             	cmp    eax,DWORD PTR [rdx+0x38]
   27e21:	0f 83 26 20 00 00    	jae    29e4d <JS_CallInternal+0x738d>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19479
   27e27:	89 c0                	mov    eax,eax
   27e29:	48 c1 e0 04          	shl    rax,0x4
   27e2d:	48 03 42 30          	add    rax,QWORD PTR [rdx+0x30]
   27e31:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   27e34:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   27e38:	83 f8 f6             	cmp    eax,0xfffffff6
   27e3b:	76 04                	jbe    27e41 <JS_CallInternal+0x5381>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   27e3d:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19507
   27e41:	48 89 0b             	mov    QWORD PTR [rbx],rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19509
   27e44:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19507
   27e48:	48 83 c3 10          	add    rbx,0x10
   27e4c:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19509
   27e50:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   27e56:	49 89 c5             	mov    r13,rax
   27e59:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27e5d:	ff e0                	jmp    rax
   27e5f:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19462 (discriminator 1)
   27e63:	83 7b e8 ff          	cmp    DWORD PTR [rbx-0x18],0xffffffff
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19462
   27e67:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   27e6b:	48 8b 4b e8          	mov    rcx,QWORD PTR [rbx-0x18]
   27e6f:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   27e73:	48 8b 7b f8          	mov    rdi,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19462 (discriminator 1)
   27e77:	0f 85 e3 1b 00 00    	jne    29a60 <JS_CallInternal+0x6fa0>
   27e7d:	85 ff                	test   edi,edi
   27e7f:	0f 85 db 1b 00 00    	jne    29a60 <JS_CallInternal+0x6fa0>
   27e85:	66 83 7e 12 02       	cmp    WORD PTR [rsi+0x12],0x2
   27e8a:	0f 85 d0 1b 00 00    	jne    29a60 <JS_CallInternal+0x6fa0>
   27e90:	44 3b 46 38          	cmp    r8d,DWORD PTR [rsi+0x38]
   27e94:	0f 83 c6 1b 00 00    	jae    29a60 <JS_CallInternal+0x6fa0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19462 (discriminator 9)
   27e9a:	44 89 c0             	mov    eax,r8d
   27e9d:	48 c1 e0 04          	shl    rax,0x4
   27ea1:	48 03 46 30          	add    rax,QWORD PTR [rsi+0x30]
   27ea5:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   27ea8:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   27eac:	83 f8 f6             	cmp    eax,0xfffffff6
   27eaf:	76 04                	jbe    27eb5 <JS_CallInternal+0x53f5>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   27eb1:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19462 (discriminator 18)
   27eb5:	48 89 53 f0          	mov    QWORD PTR [rbx-0x10],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19463
   27eb9:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19462 (discriminator 18)
   27ebd:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19463
   27ec1:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   27ec7:	49 89 c5             	mov    r13,rax
   27eca:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27ece:	ff e0                	jmp    rax
   27ed0:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19553
   27ed4:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19554
   27edb:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   27edf:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
   27ee3:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   27eea:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19553
   27eee:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19554
   27ef2:	e8 69 bb 01 00       	call   43a60 <JS_ValueToAtom>
   27ef7:	41 89 c5             	mov    r13d,eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19555 (discriminator 1)
   27efa:	45 85 ed             	test   r13d,r13d
   27efd:	0f 84 5d b3 ff ff    	je     23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19557
   27f03:	48 83 ec 08          	sub    rsp,0x8
   27f07:	4c 8d 53 e0          	lea    r10,[rbx-0x20]
   27f0b:	48 8d 43 d0          	lea    rax,[rbx-0x30]
   27f0f:	4c 8b 43 d0          	mov    r8,QWORD PTR [rbx-0x30]
   27f13:	4c 89 95 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r10
   27f1a:	4c 8b 4b d8          	mov    r9,QWORD PTR [rbx-0x28]
   27f1e:	44 89 e9             	mov    ecx,r13d
   27f21:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   27f25:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   27f2c:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   27f30:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   27f37:	6a 00                	push   0x0
   27f39:	e8 72 4e 00 00       	call   2cdb0 <JS_GetPropertyInternal>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3735 (discriminator 1)
   27f3e:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   27f45:	4c 8b 95 38 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c8]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19557
   27f4c:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
   27f53:	48 89 d0             	mov    rax,rdx
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3735 (discriminator 1)
   27f56:	5a                   	pop    rdx
   27f57:	59                   	pop    rcx
   27f58:	0f 8f 34 1e 00 00    	jg     29d92 <JS_CallInternal+0x72d2>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19559 (discriminator 2)
   27f5e:	83 f8 06             	cmp    eax,0x6
   27f61:	0f 84 f9 b2 ff ff    	je     23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19561
   27f67:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   27f6b:	49 8b 36             	mov    rsi,QWORD PTR [r14]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   27f6e:	83 fa f6             	cmp    edx,0xfffffff6
   27f71:	76 11                	jbe    27f84 <JS_CallInternal+0x54c4>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   27f73:	8b 4e fc             	mov    ecx,DWORD PTR [rsi-0x4]
   27f76:	83 e9 01             	sub    ecx,0x1
   27f79:	89 4e fc             	mov    DWORD PTR [rsi-0x4],ecx
   27f7c:	85 c9                	test   ecx,ecx
   27f7e:	0f 8e c7 2f 00 00    	jle    2af4b <JS_CallInternal+0x848b>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19562
   27f84:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
   27f88:	49 8b 32             	mov    rsi,QWORD PTR [r10]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   27f8b:	83 fa f6             	cmp    edx,0xfffffff6
   27f8e:	76 11                	jbe    27fa1 <JS_CallInternal+0x54e1>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   27f90:	8b 4e fc             	mov    ecx,DWORD PTR [rsi-0x4]
   27f93:	83 e9 01             	sub    ecx,0x1
   27f96:	89 4e fc             	mov    DWORD PTR [rsi-0x4],ecx
   27f99:	85 c9                	test   ecx,ecx
   27f9b:	0f 8e 48 2f 00 00    	jle    2aee9 <JS_CallInternal+0x8429>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19563
   27fa1:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   27fa8:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
   27fac:	48 8b 31             	mov    rsi,QWORD PTR [rcx]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   27faf:	83 fa f6             	cmp    edx,0xfffffff6
   27fb2:	76 11                	jbe    27fc5 <JS_CallInternal+0x5505>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   27fb4:	8b 4e fc             	mov    ecx,DWORD PTR [rsi-0x4]
   27fb7:	83 e9 01             	sub    ecx,0x1
   27fba:	89 4e fc             	mov    DWORD PTR [rsi-0x4],ecx
   27fbd:	85 c9                	test   ecx,ecx
   27fbf:	0f 8e 55 2f 00 00    	jle    2af1a <JS_CallInternal+0x845a>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19564
   27fc5:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   27fcc:	48 89 43 d8          	mov    QWORD PTR [rbx-0x28],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19567
   27fd0:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19564
   27fd4:	48 89 4b d0          	mov    QWORD PTR [rbx-0x30],rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19567
   27fd8:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19565
   27fde:	4c 89 d3             	mov    rbx,r10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19567
   27fe1:	49 89 c5             	mov    r13,rax
   27fe4:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27fe8:	ff e0                	jmp    rax
   27fea:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19517
   27fee:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19518
   27ff5:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   27ff9:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   27ffd:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19517
   28004:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19518
   28008:	e8 53 ba 01 00       	call   43a60 <JS_ValueToAtom>
   2800d:	41 89 c5             	mov    r13d,eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19519
   28010:	45 85 ed             	test   r13d,r13d
   28013:	0f 84 47 b2 ff ff    	je     23260 <JS_CallInternal+0x7a0>
JS_IsUndefined():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:638
   28019:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19521 (discriminator 2)
   2801d:	83 fa 03             	cmp    edx,0x3
   28020:	0f 84 a2 39 00 00    	je     2b9c8 <JS_CallInternal+0x8f08>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19526
   28026:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   2802a:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   28031:	44 89 e9             	mov    ecx,r13d
   28034:	e8 57 61 04 00       	call   6e190 <JS_HasProperty>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19527 (discriminator 1)
   28039:	85 c0                	test   eax,eax
   2803b:	0f 8e 28 39 00 00    	jle    2b969 <JS_CallInternal+0x8ea9>
JS_GetProperty():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:782
   28041:	48 83 ec 08          	sub    rsp,0x8
   28045:	4c 8b 43 e0          	mov    r8,QWORD PTR [rbx-0x20]
   28049:	4c 8b 4b e8          	mov    r9,QWORD PTR [rbx-0x18]
   2804d:	44 89 e9             	mov    ecx,r13d
   28050:	6a 00                	push   0x0
   28052:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   28059:	4c 89 c6             	mov    rsi,r8
   2805c:	4c 89 ca             	mov    rdx,r9
   2805f:	e8 4c 4d 00 00       	call   2cdb0 <JS_GetPropertyInternal>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3735 (discriminator 1)
   28064:	5e                   	pop    rsi
   28065:	5f                   	pop    rdi
JS_GetProperty():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:782
   28066:	48 89 c1             	mov    rcx,rax
   28069:	49 89 d6             	mov    r14,rdx
   2806c:	48 89 d0             	mov    rax,rdx
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3735 (discriminator 1)
   2806f:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   28076:	0f 8f 7d 1f 00 00    	jg     29ff9 <JS_CallInternal+0x7539>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19542 (discriminator 2)
   2807c:	41 83 fe 06          	cmp    r14d,0x6
   28080:	0f 84 da b1 ff ff    	je     23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19544
   28086:	48 89 0b             	mov    QWORD PTR [rbx],rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19547
   28089:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19545
   2808d:	48 83 c3 10          	add    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19544
   28091:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19547
   28095:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2809b:	49 89 c5             	mov    r13,rax
   2809e:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   280a2:	ff e0                	jmp    rax
   280a4:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19575 (discriminator 1)
   280a8:	83 7b d8 ff          	cmp    DWORD PTR [rbx-0x28],0xffffffff
   280ac:	0f 85 41 19 00 00    	jne    299f3 <JS_CallInternal+0x6f33>
   280b2:	44 8b 5b e8          	mov    r11d,DWORD PTR [rbx-0x18]
   280b6:	45 85 db             	test   r11d,r11d
   280b9:	0f 85 34 19 00 00    	jne    299f3 <JS_CallInternal+0x6f33>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19577
   280bf:	48 8b 4b d0          	mov    rcx,QWORD PTR [rbx-0x30]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19578
   280c3:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19579 (discriminator 1)
   280c7:	66 83 79 12 02       	cmp    WORD PTR [rcx+0x12],0x2
   280cc:	0f 85 21 19 00 00    	jne    299f3 <JS_CallInternal+0x6f33>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19581
   280d2:	8b 51 38             	mov    edx,DWORD PTR [rcx+0x38]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19581 (discriminator 1)
   280d5:	39 d0                	cmp    eax,edx
   280d7:	0f 83 18 3a 00 00    	jae    2baf5 <JS_CallInternal+0x9035>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19603
   280dd:	89 c0                	mov    eax,eax
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   280df:	f3 0f 6f 6b f0       	movdqu xmm5,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19603
   280e4:	48 c1 e0 04          	shl    rax,0x4
   280e8:	48 03 41 30          	add    rax,QWORD PTR [rcx+0x30]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   280ec:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   280f0:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   280f3:	0f 11 28             	movups XMMWORD PTR [rax],xmm5
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   280f6:	83 fa f6             	cmp    edx,0xfffffff6
   280f9:	76 11                	jbe    2810c <JS_CallInternal+0x564c>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   280fb:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   280fe:	83 e8 01             	sub    eax,0x1
   28101:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   28104:	85 c0                	test   eax,eax
   28106:	0f 8e c2 3b 00 00    	jle    2bcce <JS_CallInternal+0x920e>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19605
   2810c:	48 8b 53 d8          	mov    rdx,QWORD PTR [rbx-0x28]
   28110:	48 83 eb 30          	sub    rbx,0x30
   28114:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   28117:	83 fa f6             	cmp    edx,0xfffffff6
   2811a:	76 11                	jbe    2812d <JS_CallInternal+0x566d>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   2811c:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2811f:	83 e8 01             	sub    eax,0x1
   28122:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   28125:	85 c0                	test   eax,eax
   28127:	0f 8e 53 3a 00 00    	jle    2bb80 <JS_CallInternal+0x90c0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19617
   2812d:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   28132:	49 83 c4 01          	add    r12,0x1
   28136:	49 89 c5             	mov    r13,rax
   28139:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2813d:	ff e0                	jmp    rax
   2813f:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18927
   28143:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18929
   28147:	83 7b f8 03          	cmp    DWORD PTR [rbx-0x8],0x3
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18928
   2814b:	4d 8d 6c 24 01       	lea    r13,[r12+0x1]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18927
   28150:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   28154:	48 89 c8             	mov    rax,rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18929
   28157:	0f 87 dc 1a 00 00    	ja     29c39 <JS_CallInternal+0x7179>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18934
   2815d:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18935
   28161:	85 c0                	test   eax,eax
   28163:	75 0d                	jne    28172 <JS_CallInternal+0x56b2>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18936
   28165:	41 0f be 04 24       	movsx  eax,BYTE PTR [r12]
   2816a:	83 e8 01             	sub    eax,0x1
   2816d:	48 98                	cdqe
   2816f:	49 01 c5             	add    r13,rax
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7900
   28172:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   28179:	8b 81 a8 01 00 00    	mov    eax,DWORD PTR [rcx+0x1a8]
   2817f:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   28185:	83 e8 01             	sub    eax,0x1
   28188:	89 81 a8 01 00 00    	mov    DWORD PTR [rcx+0x1a8],eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7900 (discriminator 1)
   2818e:	85 c0                	test   eax,eax
   28190:	0f 8e 07 30 00 00    	jle    2b19d <JS_CallInternal+0x86dd>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18941
   28196:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
   2819b:	4d 8d 65 01          	lea    r12,[r13+0x1]
   2819f:	49 89 c5             	mov    r13,rax
   281a2:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   281a6:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18907
   281aa:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18909
   281ae:	83 7b f8 03          	cmp    DWORD PTR [rbx-0x8],0x3
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18908
   281b2:	4d 8d 6c 24 01       	lea    r13,[r12+0x1]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18907
   281b7:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   281bb:	48 89 c8             	mov    rax,rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18909
   281be:	0f 87 61 1a 00 00    	ja     29c25 <JS_CallInternal+0x7165>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18914
   281c4:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18915
   281c8:	85 c0                	test   eax,eax
   281ca:	74 0d                	je     281d9 <JS_CallInternal+0x5719>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18916
   281cc:	41 0f be 04 24       	movsx  eax,BYTE PTR [r12]
   281d1:	83 e8 01             	sub    eax,0x1
   281d4:	48 98                	cdqe
   281d6:	49 01 c5             	add    r13,rax
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7900
   281d9:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   281e0:	8b 81 a8 01 00 00    	mov    eax,DWORD PTR [rcx+0x1a8]
   281e6:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   281ec:	83 e8 01             	sub    eax,0x1
   281ef:	89 81 a8 01 00 00    	mov    DWORD PTR [rcx+0x1a8],eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7900 (discriminator 1)
   281f5:	85 c0                	test   eax,eax
   281f7:	0f 8e fe 30 00 00    	jle    2b2fb <JS_CallInternal+0x883b>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18921
   281fd:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
   28202:	4d 8d 65 01          	lea    r12,[r13+0x1]
   28206:	49 89 c5             	mov    r13,rax
   28209:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   2820d:	f3 0f 1e fa          	endbr64
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7900
   28211:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18855
   28218:	4d 0f be 2c 24       	movsx  r13,BYTE PTR [r12]
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7900
   2821d:	8b 81 a8 01 00 00    	mov    eax,DWORD PTR [rcx+0x1a8]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18855
   28223:	4d 01 e5             	add    r13,r12
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7900
   28226:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   2822c:	83 e8 01             	sub    eax,0x1
   2822f:	89 81 a8 01 00 00    	mov    DWORD PTR [rcx+0x1a8],eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7900 (discriminator 1)
   28235:	85 c0                	test   eax,eax
   28237:	0f 8e e5 36 00 00    	jle    2b922 <JS_CallInternal+0x8e62>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18858
   2823d:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
   28242:	4d 8d 65 01          	lea    r12,[r13+0x1]
   28246:	49 89 c5             	mov    r13,rax
   28249:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   2824d:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19259
   28251:	48 8d 43 e0          	lea    rax,[rbx-0x20]
JS_GetPrivateField():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:8438 (discriminator 1)
   28255:	83 7b e8 ff          	cmp    DWORD PTR [rbx-0x18],0xffffffff
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19259
   28259:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
   2825d:	4c 8b 43 e0          	mov    r8,QWORD PTR [rbx-0x20]
   28261:	4c 8b 6b f0          	mov    r13,QWORD PTR [rbx-0x10]
   28265:	4d 8b 4e 08          	mov    r9,QWORD PTR [r14+0x8]
   28269:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
JS_GetPrivateField():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:8438 (discriminator 1)
   28270:	0f 85 29 2b 00 00    	jne    2ad9f <JS_CallInternal+0x82df>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:8441 (discriminator 1)
   28276:	41 83 f9 f8          	cmp    r9d,0xfffffff8
   2827a:	0f 85 a1 2e 00 00    	jne    2b121 <JS_CallInternal+0x8661>
js_symbol_to_atom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:9020
   28280:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   28287:	4c 89 ee             	mov    rsi,r13
   2828a:	4c 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r8
   28291:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   28298:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
   2829c:	48 89 c7             	mov    rdi,rax
   2829f:	48 89 85 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rax
   282a6:	e8 a5 e8 fe ff       	call   16b50 <js_get_atom_index>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6151
   282ab:	4c 8b 85 38 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c8]
js_symbol_to_atom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:9020
   282b2:	89 c2                	mov    edx,eax
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6151
   282b4:	49 8b 70 18          	mov    rsi,QWORD PTR [r8+0x18]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6152
   282b8:	8b 4e 18             	mov    ecx,DWORD PTR [rsi+0x18]
   282bb:	21 c8                	and    eax,ecx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6153
   282bd:	8b 44 86 38          	mov    eax,DWORD PTR [rsi+rax*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6155
   282c1:	48 85 c0             	test   rax,rax
   282c4:	0f 84 29 39 00 00    	je     2bbf3 <JS_CallInternal+0x9133>
   282ca:	4c 8b 8d 40 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c0]
   282d1:	48 8d 3c 8d 34 00 00 	lea    rdi,[rcx*4+0x34]
   282d8:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6156
   282d9:	48 8d 0c c7          	lea    rcx,[rdi+rax*8]
   282dd:	48 01 f1             	add    rcx,rsi
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6157 (discriminator 1)
   282e0:	3b 51 04             	cmp    edx,DWORD PTR [rcx+0x4]
   282e3:	0f 85 fd 38 00 00    	jne    2bbe6 <JS_CallInternal+0x9126>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6158
   282e9:	49 8b 50 20          	mov    rdx,QWORD PTR [r8+0x20]
   282ed:	48 c1 e0 04          	shl    rax,0x4
   282f1:	48 8d 44 02 f0       	lea    rax,[rdx+rax*1-0x10]
JS_GetPrivateField():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:8450
   282f6:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   282f9:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   282fd:	83 f8 f6             	cmp    eax,0xfffffff6
   28300:	76 04                	jbe    28306 <JS_CallInternal+0x5846>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   28302:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:713
   28306:	48 89 d1             	mov    rcx,rdx
JS_IsException():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:643
   28309:	41 89 c0             	mov    r8d,eax
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   2830c:	41 83 f9 f6          	cmp    r9d,0xfffffff6
   28310:	76 13                	jbe    28325 <JS_CallInternal+0x5865>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   28312:	41 8b 7d fc          	mov    edi,DWORD PTR [r13-0x4]
   28316:	8d 57 ff             	lea    edx,[rdi-0x1]
   28319:	41 89 55 fc          	mov    DWORD PTR [r13-0x4],edx
   2831d:	85 d2                	test   edx,edx
   2831f:	0f 8e ae 28 00 00    	jle    2abd3 <JS_CallInternal+0x8113>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19261
   28325:	48 8b bd 50 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x1b0]
   2832c:	48 8b 57 08          	mov    rdx,QWORD PTR [rdi+0x8]
   28330:	48 8b 37             	mov    rsi,QWORD PTR [rdi]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   28333:	83 fa f6             	cmp    edx,0xfffffff6
   28336:	76 11                	jbe    28349 <JS_CallInternal+0x5889>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   28338:	8b 7e fc             	mov    edi,DWORD PTR [rsi-0x4]
   2833b:	83 ef 01             	sub    edi,0x1
   2833e:	89 7e fc             	mov    DWORD PTR [rsi-0x4],edi
   28341:	85 ff                	test   edi,edi
   28343:	0f 8e f1 26 00 00    	jle    2aa3a <JS_CallInternal+0x7f7a>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19262
   28349:	48 89 4b e0          	mov    QWORD PTR [rbx-0x20],rcx
   2834d:	48 89 43 e8          	mov    QWORD PTR [rbx-0x18],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19263
   28351:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19264 (discriminator 2)
   28354:	41 83 f8 06          	cmp    r8d,0x6
   28358:	0f 84 02 af ff ff    	je     23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19267
   2835e:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   28363:	49 83 c4 01          	add    r12,0x1
   28367:	49 89 c5             	mov    r13,rax
   2836a:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2836e:	ff e0                	jmp    rax
   28370:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19009
   28374:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
JS_Call():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20743
   2837b:	48 8b 4b d0          	mov    rcx,QWORD PTR [rbx-0x30]
   2837f:	45 31 c9             	xor    r9d,r9d
   28382:	48 c7 85 f0 fd ff ff 	mov    QWORD PTR [rbp-0x210],0x0
   28389:	00 00 00 00 
   2838d:	48 c7 85 f8 fd ff ff 	mov    QWORD PTR [rbp-0x208],0x3
   28394:	03 00 00 00 
   28398:	4c 8b 43 d8          	mov    r8,QWORD PTR [rbx-0x28]
   2839c:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   283a0:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19009
   283a4:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
js_for_await_of_next():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16738
   283a8:	48 c7 43 f0 00 00 00 	mov    QWORD PTR [rbx-0x10],0x0
   283af:	00 
JS_Call():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20743
   283b0:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
js_for_await_of_next():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16738
   283b7:	48 c7 43 f8 03 00 00 	mov    QWORD PTR [rbx-0x8],0x3
   283be:	00 
JS_Call():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20743
   283bf:	6a 02                	push   0x2
   283c1:	6a 00                	push   0x0
   283c3:	ff b5 f8 fd ff ff    	push   QWORD PTR [rbp-0x208]
   283c9:	ff b5 f0 fd ff ff    	push   QWORD PTR [rbp-0x210]
   283cf:	e8 ec a6 ff ff       	call   22ac0 <JS_CallInternal>
js_for_await_of_next():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16743 (discriminator 1)
   283d4:	48 83 c4 20          	add    rsp,0x20
   283d8:	83 fa 06             	cmp    edx,0x6
   283db:	0f 84 7f ae ff ff    	je     23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16745
   283e1:	48 89 03             	mov    QWORD PTR [rbx],rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19013
   283e4:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19012
   283e8:	48 83 c3 10          	add    rbx,0x10
js_for_await_of_next():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16745
   283ec:	48 89 53 f8          	mov    QWORD PTR [rbx-0x8],rdx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19013
   283f0:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   283f6:	49 89 c5             	mov    r13,rax
   283f9:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   283fd:	ff e0                	jmp    rax
   283ff:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19002
   28403:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19000
   2840a:	41 0f b6 0c 24       	movzx  ecx,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19001
   2840f:	4d 8d 74 24 01       	lea    r14,[r12+0x1]
js_for_of_next():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16710
   28414:	c7 85 f0 fe ff ff 01 	mov    DWORD PTR [rbp-0x110],0x1
   2841b:	00 00 00 
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19002
   2841e:	4c 89 70 30          	mov    QWORD PTR [rax+0x30],r14
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19000
   28422:	b8 fd ff ff ff       	mov    eax,0xfffffffd
   28427:	29 c8                	sub    eax,ecx
js_for_of_next():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16712
   28429:	48 98                	cdqe
   2842b:	48 c1 e0 04          	shl    rax,0x4
   2842f:	4c 8d 2c 03          	lea    r13,[rbx+rax*1]
JS_IsUndefined():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:638
   28433:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
js_for_of_next():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16712 (discriminator 2)
   28437:	83 fa 03             	cmp    edx,0x3
   2843a:	0f 84 d0 2c 00 00    	je     2b110 <JS_CallInternal+0x8650>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16713
   28440:	b8 fe ff ff ff       	mov    eax,0xfffffffe
   28445:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
   28449:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   28450:	4c 8d 8d f0 fe ff ff 	lea    r9,[rbp-0x110]
   28457:	29 c8                	sub    eax,ecx
   28459:	48 98                	cdqe
   2845b:	48 c1 e0 04          	shl    rax,0x4
   2845f:	48 01 d8             	add    rax,rbx
   28462:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   28465:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   28469:	e8 d2 ec 06 00       	call   97140 <JS_IteratorNext.constprop.0>
   2846e:	49 89 d1             	mov    r9,rdx
   28471:	48 89 c7             	mov    rdi,rax
   28474:	48 89 d6             	mov    rsi,rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16714 (discriminator 1)
   28477:	83 fa 06             	cmp    edx,0x6
   2847a:	0f 84 01 1b 00 00    	je     29f81 <JS_CallInternal+0x74c1>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16716
   28480:	8b 8d f0 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x110]
   28486:	31 d2                	xor    edx,edx
   28488:	85 c9                	test   ecx,ecx
   2848a:	0f 85 00 1b 00 00    	jne    29f90 <JS_CallInternal+0x74d0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16729
   28490:	48 89 3b             	mov    QWORD PTR [rbx],rdi
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19007
   28493:	49 83 c4 02          	add    r12,0x2
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19005
   28497:	48 83 c3 20          	add    rbx,0x20
js_for_of_next():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16729
   2849b:	48 89 73 e8          	mov    QWORD PTR [rbx-0x18],rsi
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16730
   2849f:	48 89 53 f0          	mov    QWORD PTR [rbx-0x10],rdx
   284a3:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   284aa:	00 
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19007
   284ab:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   284b1:	49 89 c5             	mov    r13,rax
   284b4:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   284b8:	ff e0                	jmp    rax
   284ba:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19015
   284be:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19016
   284c5:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   284cc:	ba 01 00 00 00       	mov    edx,0x1
   284d1:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19015
   284d4:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19016
   284d8:	e8 73 d5 06 00       	call   95a50 <js_for_of_start>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19016 (discriminator 1)
   284dd:	85 c0                	test   eax,eax
   284df:	0f 85 7b ad ff ff    	jne    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19019
   284e5:	48 c7 43 10 00 00 00 	mov    QWORD PTR [rbx+0x10],0x0
   284ec:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19020
   284ed:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19019
   284f1:	48 83 c3 20          	add    rbx,0x20
   284f5:	48 c7 43 f8 05 00 00 	mov    QWORD PTR [rbx-0x8],0x5
   284fc:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19020
   284fd:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   28503:	49 89 c5             	mov    r13,rax
   28506:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2850a:	ff e0                	jmp    rax
   2850c:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18981
   28510:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
js_for_in_start():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16355
   28517:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   2851b:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   2851f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18981
   28526:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
js_for_in_start():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16355
   2852a:	e8 a1 51 04 00       	call   6d6d0 <build_for_in_iterator>
   2852f:	48 89 53 f8          	mov    QWORD PTR [rbx-0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16356 (discriminator 1)
   28533:	83 7b f8 06          	cmp    DWORD PTR [rbx-0x8],0x6
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16355
   28537:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16356 (discriminator 1)
   2853b:	0f 84 1f ad ff ff    	je     23260 <JS_CallInternal+0x7a0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18984
   28541:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   28546:	49 83 c4 01          	add    r12,0x1
   2854a:	49 89 c5             	mov    r13,rax
   2854d:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28551:	ff e0                	jmp    rax
   28553:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18967 (discriminator 1)
   28557:	44 8b 4b f8          	mov    r9d,DWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18966
   2855b:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18967 (discriminator 1)
   2855f:	45 85 c9             	test   r9d,r9d
   28562:	0f 85 1f 1e 00 00    	jne    2a387 <JS_CallInternal+0x78c7>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18970 (discriminator 1)
   28568:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   2856f:	3b 41 20             	cmp    eax,DWORD PTR [rcx+0x20]
   28572:	0f 83 0f 1e 00 00    	jae    2a387 <JS_CallInternal+0x78c7>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18976
   28578:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   2857f:	89 c0                	mov    eax,eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18975
   28581:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18976
   28585:	48 03 41 18          	add    rax,QWORD PTR [rcx+0x18]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18978
   28589:	4c 8d 60 01          	lea    r12,[rax+0x1]
   2858d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   28590:	49 89 c5             	mov    r13,rax
   28593:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   28597:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18986
   2859b:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18987
   285a2:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   285a9:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18986
   285ac:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18987
   285b0:	e8 bb 53 04 00       	call   6d970 <js_for_in_next>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18987 (discriminator 1)
   285b5:	85 c0                	test   eax,eax
   285b7:	0f 85 a3 ac ff ff    	jne    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18990
   285bd:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18989
   285c2:	48 83 c3 20          	add    rbx,0x20
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18990
   285c6:	49 83 c4 01          	add    r12,0x1
   285ca:	49 89 c5             	mov    r13,rax
   285cd:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   285d1:	ff e0                	jmp    rax
   285d3:	f3 0f 1e fa          	endbr64
   285d7:	e9 f8 a9 ff ff       	jmp    22fd4 <JS_CallInternal+0x514>
   285dc:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18835
   285e0:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18834
   285e7:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:181
   285ec:	41 8b 34 24          	mov    esi,DWORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18837
   285f0:	48 89 da             	mov    rdx,rbx
   285f3:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18835
   285fa:	4c 89 68 30          	mov    QWORD PTR [rax+0x30],r13
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18837
   285fe:	e8 fd 5c 04 00       	call   6e300 <JS_GetGlobalVarRef>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18837 (discriminator 1)
   28603:	85 c0                	test   eax,eax
   28605:	0f 85 dd 43 00 00    	jne    2c9e8 <JS_CallInternal+0x9f28>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18841
   2860b:	41 0f b6 44 24 04    	movzx  eax,BYTE PTR [r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18839
   28611:	48 83 c3 20          	add    rbx,0x20
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18841
   28615:	49 83 c4 05          	add    r12,0x5
   28619:	49 89 c5             	mov    r13,rax
   2861c:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28620:	ff e0                	jmp    rax
   28622:	f3 0f 1e fa          	endbr64
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:196
   28626:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18769
   2862b:	48 8b 8d b0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x150]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18768
   28632:	4d 8d 6c 24 02       	lea    r13,[r12+0x2]
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:196
   28637:	48 89 c2             	mov    rdx,rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18769
   2863a:	48 c1 e0 04          	shl    rax,0x4
   2863e:	48 01 c8             	add    rax,rcx
   28641:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18769 (discriminator 2)
   28645:	83 f9 04             	cmp    ecx,0x4
   28648:	0f 84 cb 31 00 00    	je     2b819 <JS_CallInternal+0x8d59>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18773
   2864e:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   28652:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   28656:	83 fa f6             	cmp    edx,0xfffffff6
   28659:	76 04                	jbe    2865f <JS_CallInternal+0x5b9f>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   2865b:	83 46 fc 01          	add    DWORD PTR [rsi-0x4],0x1
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   2865f:	4c 8b 00             	mov    r8,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   28662:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
   28666:	48 89 30             	mov    QWORD PTR [rax],rsi
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   28669:	83 f9 f6             	cmp    ecx,0xfffffff6
   2866c:	76 13                	jbe    28681 <JS_CallInternal+0x5bc1>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   2866e:	41 8b 40 fc          	mov    eax,DWORD PTR [r8-0x4]
   28672:	83 e8 01             	sub    eax,0x1
   28675:	41 89 40 fc          	mov    DWORD PTR [r8-0x4],eax
   28679:	85 c0                	test   eax,eax
   2867b:	0f 8e 96 20 00 00    	jle    2a717 <JS_CallInternal+0x7c57>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18775
   28681:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
   28687:	49 83 c4 03          	add    r12,0x3
   2868b:	49 89 c5             	mov    r13,rax
   2868e:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28692:	ff e0                	jmp    rax
   28694:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19685
   28698:	4c 8b 43 e8          	mov    r8,QWORD PTR [rbx-0x18]
   2869c:	48 8b 4b e0          	mov    rcx,QWORD PTR [rbx-0x20]
   286a0:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   286a4:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   286a8:	76 04                	jbe    286ae <JS_CallInternal+0x5bee>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   286aa:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19685 (discriminator 1)
   286ae:	48 8b 73 d0          	mov    rsi,QWORD PTR [rbx-0x30]
   286b2:	48 8b 53 d8          	mov    rdx,QWORD PTR [rbx-0x28]
   286b6:	41 ff 76 08          	push   QWORD PTR [r14+0x8]
   286ba:	41 b9 07 40 00 00    	mov    r9d,0x4007
   286c0:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   286c7:	41 ff 36             	push   QWORD PTR [r14]
   286ca:	e8 21 b5 01 00       	call   43bf0 <JS_DefinePropertyValueValue>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19688 (discriminator 1)
   286cf:	59                   	pop    rcx
   286d0:	5e                   	pop    rsi
   286d1:	85 c0                	test   eax,eax
   286d3:	0f 88 bc 2a 00 00    	js     2b195 <JS_CallInternal+0x86d5>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19691
   286d9:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19687
   286de:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19691
   286e1:	49 83 c4 01          	add    r12,0x1
   286e5:	49 89 c5             	mov    r13,rax
   286e8:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   286ec:	ff e0                	jmp    rax
   286ee:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19662
   286f2:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19663
   286f9:	83 7b d8 ff          	cmp    DWORD PTR [rbx-0x28],0xffffffff
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19662
   286fd:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19663
   28701:	0f 85 a8 3b 00 00    	jne    2c2af <JS_CallInternal+0x97ef>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19667
   28707:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   2870b:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   28712:	4c 8d 73 e0          	lea    r14,[rbx-0x20]
   28716:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   2871a:	e8 41 b3 01 00       	call   43a60 <JS_ValueToAtom>
   2871f:	41 89 c5             	mov    r13d,eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19668 (discriminator 1)
   28722:	45 85 ed             	test   r13d,r13d
   28725:	0f 84 35 ab ff ff    	je     23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19670
   2872b:	48 83 ec 08          	sub    rsp,0x8
   2872f:	4c 8d 53 d0          	lea    r10,[rbx-0x30]
   28733:	48 8d 43 c0          	lea    rax,[rbx-0x40]
   28737:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   2873b:	4c 89 95 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r10
   28742:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   28746:	44 89 e9             	mov    ecx,r13d
   28749:	48 8b 73 d0          	mov    rsi,QWORD PTR [rbx-0x30]
   2874d:	48 8b 53 d8          	mov    rdx,QWORD PTR [rbx-0x28]
   28751:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   28758:	68 00 80 00 00       	push   0x8000
   2875d:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   28764:	ff 73 c8             	push   QWORD PTR [rbx-0x38]
   28767:	ff 73 c0             	push   QWORD PTR [rbx-0x40]
   2876a:	e8 71 53 00 00       	call   2dae0 <JS_SetPropertyInternal>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3735 (discriminator 1)
   2876f:	48 83 c4 20          	add    rsp,0x20
   28773:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   2877a:	4c 8b 95 40 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c0]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19670
   28781:	89 c3                	mov    ebx,eax
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3735 (discriminator 1)
   28783:	0f 8f d1 15 00 00    	jg     29d5a <JS_CallInternal+0x729a>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19673
   28789:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   28790:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   28794:	48 8b 30             	mov    rsi,QWORD PTR [rax]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   28797:	83 fa f6             	cmp    edx,0xfffffff6
   2879a:	76 11                	jbe    287ad <JS_CallInternal+0x5ced>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   2879c:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2879f:	83 e8 01             	sub    eax,0x1
   287a2:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   287a5:	85 c0                	test   eax,eax
   287a7:	0f 8e 49 22 00 00    	jle    2a9f6 <JS_CallInternal+0x7f36>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19674
   287ad:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
   287b1:	49 8b 32             	mov    rsi,QWORD PTR [r10]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   287b4:	83 fa f6             	cmp    edx,0xfffffff6
   287b7:	76 11                	jbe    287ca <JS_CallInternal+0x5d0a>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   287b9:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   287bc:	83 e8 01             	sub    eax,0x1
   287bf:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   287c2:	85 c0                	test   eax,eax
   287c4:	0f 8e dc 21 00 00    	jle    2a9a6 <JS_CallInternal+0x7ee6>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19675
   287ca:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   287ce:	49 8b 36             	mov    rsi,QWORD PTR [r14]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   287d1:	83 fa f6             	cmp    edx,0xfffffff6
   287d4:	76 11                	jbe    287e7 <JS_CallInternal+0x5d27>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   287d6:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   287d9:	83 e8 01             	sub    eax,0x1
   287dc:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   287df:	85 c0                	test   eax,eax
   287e1:	0f 8e d4 21 00 00    	jle    2a9bb <JS_CallInternal+0x7efb>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19677
   287e7:	85 db                	test   ebx,ebx
   287e9:	0f 88 8e 41 00 00    	js     2c97d <JS_CallInternal+0x9ebd>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19680
   287ef:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19676
   287f4:	48 8b 9d 50 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1b0]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19680
   287fb:	49 83 c4 01          	add    r12,0x1
   287ff:	49 89 c5             	mov    r13,rax
   28802:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28806:	ff e0                	jmp    rax
   28808:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19695
   2880c:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19696
   28813:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2881a:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19695
   2881d:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19696
   28821:	e8 6a 23 07 00       	call   9ab90 <js_append_enumerate>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19696 (discriminator 1)
   28826:	85 c0                	test   eax,eax
   28828:	0f 85 32 aa ff ff    	jne    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19698
   2882e:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   28832:	48 83 eb 10          	sub    rbx,0x10
   28836:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   28839:	83 fa f6             	cmp    edx,0xfffffff6
   2883c:	76 11                	jbe    2884f <JS_CallInternal+0x5d8f>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   2883e:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   28841:	83 e8 01             	sub    eax,0x1
   28844:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   28847:	85 c0                	test   eax,eax
   28849:	0f 8e d7 20 00 00    	jle    2a926 <JS_CallInternal+0x7e66>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19700
   2884f:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   28854:	49 83 c4 01          	add    r12,0x1
   28858:	49 89 c5             	mov    r13,rax
   2885b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2885f:	ff e0                	jmp    rax
   28861:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18865
   28865:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18867
   28869:	83 7b f8 03          	cmp    DWORD PTR [rbx-0x8],0x3
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18866
   2886d:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18865
   28872:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   28876:	48 89 c8             	mov    rax,rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18867
   28879:	0f 87 36 14 00 00    	ja     29cb5 <JS_CallInternal+0x71f5>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18872
   2887f:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18873
   28883:	85 c0                	test   eax,eax
   28885:	74 0c                	je     28893 <JS_CallInternal+0x5dd3>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18874 (discriminator 1)
   28887:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   2888b:	83 e8 04             	sub    eax,0x4
   2888e:	48 98                	cdqe
   28890:	49 01 c5             	add    r13,rax
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7900
   28893:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   2889a:	8b 81 a8 01 00 00    	mov    eax,DWORD PTR [rcx+0x1a8]
   288a0:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   288a6:	83 e8 01             	sub    eax,0x1
   288a9:	89 81 a8 01 00 00    	mov    DWORD PTR [rcx+0x1a8],eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7900 (discriminator 1)
   288af:	85 c0                	test   eax,eax
   288b1:	0f 8e 60 2a 00 00    	jle    2b317 <JS_CallInternal+0x8857>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18879
   288b7:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
   288bc:	4d 8d 65 01          	lea    r12,[r13+0x1]
   288c0:	49 89 c5             	mov    r13,rax
   288c3:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   288c7:	f3 0f 1e fa          	endbr64
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7900
   288cb:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18850 (discriminator 1)
   288d2:	4d 0f bf 2c 24       	movsx  r13,WORD PTR [r12]
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7900
   288d7:	8b 81 a8 01 00 00    	mov    eax,DWORD PTR [rcx+0x1a8]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18850 (discriminator 1)
   288dd:	4d 01 e5             	add    r13,r12
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7900
   288e0:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   288e6:	83 e8 01             	sub    eax,0x1
   288e9:	89 81 a8 01 00 00    	mov    DWORD PTR [rcx+0x1a8],eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7900 (discriminator 1)
   288ef:	85 c0                	test   eax,eax
   288f1:	0f 8e 87 2f 00 00    	jle    2b87e <JS_CallInternal+0x8dbe>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18853
   288f7:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
   288fc:	4d 8d 65 01          	lea    r12,[r13+0x1]
   28900:	49 89 c5             	mov    r13,rax
   28903:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   28907:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19314
   2890b:	41 8b 0c 24          	mov    ecx,DWORD PTR [r12]
   2890f:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19312
   28913:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19314
   28918:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   2891c:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   28923:	e8 08 bc 00 00       	call   34530 <JS_DefineObjectName.constprop.0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19315 (discriminator 1)
   28928:	85 c0                	test   eax,eax
   2892a:	0f 88 8d 29 00 00    	js     2b2bd <JS_CallInternal+0x87fd>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19318
   28930:	41 0f b6 44 24 04    	movzx  eax,BYTE PTR [r12+0x4]
   28936:	49 83 c4 05          	add    r12,0x5
   2893a:	49 89 c5             	mov    r13,rax
   2893d:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28941:	ff e0                	jmp    rax
   28943:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18781
   28947:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   2894c:	48 8b 8d b0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x150]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18780
   28953:	4d 8d 6c 24 02       	lea    r13,[r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18781
   28958:	48 c1 e0 04          	shl    rax,0x4
   2895c:	48 01 c8             	add    rax,rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18781 (discriminator 2)
   2895f:	83 78 08 04          	cmp    DWORD PTR [rax+0x8],0x4
   28963:	0f 85 09 24 00 00    	jne    2ad72 <JS_CallInternal+0x82b2>
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   28969:	f3 0f 6f 4b f0       	movdqu xmm1,XMMWORD PTR [rbx-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18788
   2896e:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18786
   28972:	48 83 eb 10          	sub    rbx,0x10
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   28976:	0f 11 08             	movups XMMWORD PTR [rax],xmm1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18788
   28979:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2897f:	49 89 c5             	mov    r13,rax
   28982:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28986:	ff e0                	jmp    rax
   28988:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19191 (discriminator 4)
   2898c:	48 8b 7b f8          	mov    rdi,QWORD PTR [rbx-0x8]
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:181
   28990:	41 8b 34 24          	mov    esi,DWORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19191 (discriminator 1)
   28994:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19191 (discriminator 4)
   28999:	4c 8b 53 f0          	mov    r10,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19191 (discriminator 1)
   2899d:	83 ff ff             	cmp    edi,0xffffffff
   289a0:	0f 85 15 09 00 00    	jne    292bb <JS_CallInternal+0x67fb>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19191 (discriminator 5)
   289a6:	4c 89 d1             	mov    rcx,r10
   289a9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6151
   289b0:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6152
   289b4:	8b 42 18             	mov    eax,DWORD PTR [rdx+0x18]
   289b7:	41 89 c0             	mov    r8d,eax
   289ba:	41 21 f0             	and    r8d,esi
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6153
   289bd:	46 8b 44 82 38       	mov    r8d,DWORD PTR [rdx+r8*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6155
   289c2:	4d 85 c0             	test   r8,r8
   289c5:	0f 84 b2 03 00 00    	je     28d7d <JS_CallInternal+0x62bd>
   289cb:	4c 8d 0c 85 34 00 00 	lea    r9,[rax*4+0x34]
   289d2:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6156
   289d3:	4b 8d 04 c1          	lea    rax,[r9+r8*8]
   289d7:	48 01 d0             	add    rax,rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6157 (discriminator 1)
   289da:	39 70 04             	cmp    DWORD PTR [rax+0x4],esi
   289dd:	0f 85 8a 03 00 00    	jne    28d6d <JS_CallInternal+0x62ad>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19191 (discriminator 1)
   289e3:	80 78 03 3f          	cmp    BYTE PTR [rax+0x3],0x3f
   289e7:	0f 87 ce 08 00 00    	ja     292bb <JS_CallInternal+0x67fb>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6158
   289ed:	48 8b 41 20          	mov    rax,QWORD PTR [rcx+0x20]
   289f1:	49 c1 e0 04          	shl    r8,0x4
   289f5:	4a 8d 54 00 f0       	lea    rdx,[rax+r8*1-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19191 (discriminator 11)
   289fa:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   289fd:	48 8b 52 08          	mov    rdx,QWORD PTR [rdx+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   28a01:	83 fa f6             	cmp    edx,0xfffffff6
   28a04:	76 04                	jbe    28a0a <JS_CallInternal+0x5f4a>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   28a06:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19191 (discriminator 20)
   28a0a:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19192
   28a0d:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19191 (discriminator 20)
   28a11:	48 83 c3 10          	add    rbx,0x10
   28a15:	48 89 53 f8          	mov    QWORD PTR [rbx-0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19192
   28a19:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   28a1f:	49 89 c5             	mov    r13,rax
   28a22:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28a26:	ff e0                	jmp    rax
   28a28:	f3 0f 1e fa          	endbr64
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:196
   28a2c:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18756
   28a31:	48 8b 8d b0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x150]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18755
   28a38:	4d 8d 6c 24 02       	lea    r13,[r12+0x2]
get_u16():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:196
   28a3d:	48 89 c2             	mov    rdx,rax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18756
   28a40:	48 c1 e0 04          	shl    rax,0x4
   28a44:	48 01 c8             	add    rax,rcx
   28a47:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18756 (discriminator 2)
   28a4b:	83 f9 04             	cmp    ecx,0x4
   28a4e:	0f 84 e2 2d 00 00    	je     2b836 <JS_CallInternal+0x8d76>
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   28a54:	f3 0f 6f 5b f0       	movdqu xmm3,XMMWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   28a59:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   28a5c:	0f 11 18             	movups XMMWORD PTR [rax],xmm3
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   28a5f:	83 f9 f6             	cmp    ecx,0xfffffff6
   28a62:	76 11                	jbe    28a75 <JS_CallInternal+0x5fb5>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   28a64:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   28a67:	83 e8 01             	sub    eax,0x1
   28a6a:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   28a6d:	85 c0                	test   eax,eax
   28a6f:	0f 8e bd 1c 00 00    	jle    2a732 <JS_CallInternal+0x7c72>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18763
   28a75:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18761
   28a7b:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18763
   28a7f:	49 83 c4 03          	add    r12,0x3
   28a83:	49 89 c5             	mov    r13,rax
   28a86:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28a8a:	ff e0                	jmp    rax
   28a8c:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19341
   28a90:	48 8b 4b e0          	mov    rcx,QWORD PTR [rbx-0x20]
   28a94:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19342
   28a98:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19341
   28a9c:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   28aa0:	4c 8b 43 e8          	mov    r8,QWORD PTR [rbx-0x18]
   28aa4:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   28aab:	e8 70 56 ff ff       	call   1e120 <js_method_set_home_object>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19342
   28ab0:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   28ab6:	49 89 c5             	mov    r13,rax
   28ab9:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28abd:	ff e0                	jmp    rax
   28abf:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19322
   28ac3:	48 8b 4b e0          	mov    rcx,QWORD PTR [rbx-0x20]
   28ac7:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   28acb:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   28acf:	4c 8b 43 e8          	mov    r8,QWORD PTR [rbx-0x18]
   28ad3:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   28ada:	e8 01 b3 01 00       	call   43de0 <JS_DefineObjectNameComputed.constprop.0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19323 (discriminator 1)
   28adf:	85 c0                	test   eax,eax
   28ae1:	0f 88 79 a7 ff ff    	js     23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19326
   28ae7:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   28aec:	49 83 c4 01          	add    r12,0x1
   28af0:	49 89 c5             	mov    r13,rax
   28af3:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28af7:	ff e0                	jmp    rax
   28af9:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19299
   28afd:	48 83 ec 08          	sub    rsp,0x8
   28b01:	41 8b 0c 24          	mov    ecx,DWORD PTR [r12]
   28b05:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   28b09:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
   28b0d:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   28b11:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19297
   28b15:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19299
   28b1a:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   28b1e:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   28b25:	68 07 40 00 00       	push   0x4007
   28b2a:	e8 71 72 00 00       	call   2fda0 <JS_DefinePropertyValue>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19302 (discriminator 1)
   28b2f:	59                   	pop    rcx
   28b30:	5e                   	pop    rsi
   28b31:	85 c0                	test   eax,eax
   28b33:	0f 88 05 2e 00 00    	js     2b93e <JS_CallInternal+0x8e7e>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19305
   28b39:	41 0f b6 44 24 04    	movzx  eax,BYTE PTR [r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19301
   28b3f:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19305
   28b42:	49 83 c4 05          	add    r12,0x5
   28b46:	49 89 c5             	mov    r13,rax
   28b49:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28b4d:	ff e0                	jmp    rax
   28b4f:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19248
   28b53:	41 8b 34 24          	mov    esi,DWORD PTR [r12]
   28b57:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19247
   28b5e:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19248
   28b63:	e8 a8 af 00 00       	call   33b10 <JS_NewSymbolFromAtom.constprop.0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19249 (discriminator 1)
   28b68:	83 fa 06             	cmp    edx,0x6
   28b6b:	0f 84 d6 28 00 00    	je     2b447 <JS_CallInternal+0x8987>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19251
   28b71:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19253
   28b74:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19251
   28b78:	48 83 c3 10          	add    rbx,0x10
   28b7c:	48 89 53 f8          	mov    QWORD PTR [rbx-0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19253
   28b80:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   28b86:	49 89 c5             	mov    r13,rax
   28b89:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28b8d:	ff e0                	jmp    rax
   28b8f:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19196 (discriminator 4)
   28b93:	48 8b 7b f8          	mov    rdi,QWORD PTR [rbx-0x8]
   28b97:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19196 (discriminator 1)
   28b9b:	83 ff ff             	cmp    edi,0xffffffff
   28b9e:	0f 85 57 06 00 00    	jne    291fb <JS_CallInternal+0x673b>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19196 (discriminator 5)
   28ba4:	48 89 f1             	mov    rcx,rsi
   28ba7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   28bae:	00 00 
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6151
   28bb0:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6152
   28bb4:	8b 42 18             	mov    eax,DWORD PTR [rdx+0x18]
   28bb7:	41 89 c0             	mov    r8d,eax
   28bba:	41 83 e0 32          	and    r8d,0x32
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6153
   28bbe:	46 8b 44 82 38       	mov    r8d,DWORD PTR [rdx+r8*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6155
   28bc3:	4d 85 c0             	test   r8,r8
   28bc6:	0f 84 79 01 00 00    	je     28d45 <JS_CallInternal+0x6285>
   28bcc:	4c 8d 0c 85 34 00 00 	lea    r9,[rax*4+0x34]
   28bd3:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6156
   28bd4:	4b 8d 04 c1          	lea    rax,[r9+r8*8]
   28bd8:	48 01 d0             	add    rax,rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6157 (discriminator 1)
   28bdb:	83 78 04 32          	cmp    DWORD PTR [rax+0x4],0x32
   28bdf:	0f 85 50 01 00 00    	jne    28d35 <JS_CallInternal+0x6275>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19196 (discriminator 1)
   28be5:	80 78 03 3f          	cmp    BYTE PTR [rax+0x3],0x3f
   28be9:	0f 87 0c 06 00 00    	ja     291fb <JS_CallInternal+0x673b>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6158
   28bef:	48 8b 41 20          	mov    rax,QWORD PTR [rcx+0x20]
   28bf3:	49 c1 e0 04          	shl    r8,0x4
   28bf7:	4a 8d 44 00 f0       	lea    rax,[rax+r8*1-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19196 (discriminator 11)
   28bfc:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
   28c00:	4c 8b 30             	mov    r14,QWORD PTR [rax]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   28c03:	83 f9 f6             	cmp    ecx,0xfffffff6
   28c06:	76 05                	jbe    28c0d <JS_CallInternal+0x614d>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   28c08:	41 83 46 fc 01       	add    DWORD PTR [r14-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18045
   28c0d:	4c 8d 6b f0          	lea    r13,[rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19196 (discriminator 21)
   28c11:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
   28c15:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   28c19:	83 fa f6             	cmp    edx,0xfffffff6
   28c1c:	76 11                	jbe    28c2f <JS_CallInternal+0x616f>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   28c1e:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   28c21:	83 e8 01             	sub    eax,0x1
   28c24:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   28c27:	85 c0                	test   eax,eax
   28c29:	0f 8e 1b 1b 00 00    	jle    2a74a <JS_CallInternal+0x7c8a>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19196 (discriminator 1)
   28c2f:	4c 89 73 f0          	mov    QWORD PTR [rbx-0x10],r14
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19197
   28c33:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19196 (discriminator 1)
   28c37:	48 89 4b f8          	mov    QWORD PTR [rbx-0x8],rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19197
   28c3b:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   28c41:	49 89 c5             	mov    r13,rax
   28c44:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28c48:	ff e0                	jmp    rax
   28c4a:	f3 0f 1e fa          	endbr64
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19187 (discriminator 4)
   28c4e:	48 8b 7b f8          	mov    rdi,QWORD PTR [rbx-0x8]
get_u32():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:181
   28c52:	41 8b 34 24          	mov    esi,DWORD PTR [r12]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19187 (discriminator 1)
   28c56:	4d 8d 74 24 04       	lea    r14,[r12+0x4]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19187 (discriminator 4)
   28c5b:	4c 8b 53 f0          	mov    r10,QWORD PTR [rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19187 (discriminator 1)
   28c5f:	83 ff ff             	cmp    edi,0xffffffff
   28c62:	0f 85 9f 06 00 00    	jne    29307 <JS_CallInternal+0x6847>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19187 (discriminator 5)
   28c68:	4c 89 d1             	mov    rcx,r10
   28c6b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6151
   28c70:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6152
   28c74:	8b 42 18             	mov    eax,DWORD PTR [rdx+0x18]
   28c77:	41 89 c0             	mov    r8d,eax
   28c7a:	41 21 f0             	and    r8d,esi
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6153
   28c7d:	46 8b 44 82 38       	mov    r8d,DWORD PTR [rdx+r8*4+0x38]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6155
   28c82:	4d 85 c0             	test   r8,r8
   28c85:	0f 84 85 00 00 00    	je     28d10 <JS_CallInternal+0x6250>
   28c8b:	4c 8d 0c 85 34 00 00 	lea    r9,[rax*4+0x34]
   28c92:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6156
   28c93:	4b 8d 04 c1          	lea    rax,[r9+r8*8]
   28c97:	48 01 d0             	add    rax,rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6157 (discriminator 1)
   28c9a:	39 70 04             	cmp    DWORD PTR [rax+0x4],esi
   28c9d:	75 65                	jne    28d04 <JS_CallInternal+0x6244>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19187 (discriminator 1)
   28c9f:	80 78 03 3f          	cmp    BYTE PTR [rax+0x3],0x3f
   28ca3:	0f 87 5e 06 00 00    	ja     29307 <JS_CallInternal+0x6847>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6158
   28ca9:	48 8b 41 20          	mov    rax,QWORD PTR [rcx+0x20]
   28cad:	49 c1 e0 04          	shl    r8,0x4
   28cb1:	4a 8d 54 00 f0       	lea    rdx,[rax+r8*1-0x10]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19187 (discriminator 11)
   28cb6:	4c 8b 42 08          	mov    r8,QWORD PTR [rdx+0x8]
   28cba:	48 8b 02             	mov    rax,QWORD PTR [rdx]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   28cbd:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   28cc1:	76 04                	jbe    28cc7 <JS_CallInternal+0x6207>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   28cc3:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18045
   28cc7:	4c 8d 6b f0          	lea    r13,[rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19187 (discriminator 21)
   28ccb:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
   28ccf:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   28cd3:	83 fa f6             	cmp    edx,0xfffffff6
   28cd6:	76 11                	jbe    28ce9 <JS_CallInternal+0x6229>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   28cd8:	8b 4e fc             	mov    ecx,DWORD PTR [rsi-0x4]
   28cdb:	83 e9 01             	sub    ecx,0x1
   28cde:	89 4e fc             	mov    DWORD PTR [rsi-0x4],ecx
   28ce1:	85 c9                	test   ecx,ecx
   28ce3:	0f 8e c7 17 00 00    	jle    2a4b0 <JS_CallInternal+0x79f0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19187 (discriminator 1)
   28ce9:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19188
   28ced:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19187 (discriminator 1)
   28cf1:	4c 89 43 f8          	mov    QWORD PTR [rbx-0x8],r8
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19188
   28cf5:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   28cfb:	49 89 c5             	mov    r13,rax
   28cfe:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28d02:	ff e0                	jmp    rax
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6162
   28d04:	44 8b 00             	mov    r8d,DWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6155
   28d07:	41 81 e0 ff ff ff 03 	and    r8d,0x3ffffff
   28d0e:	75 83                	jne    28c93 <JS_CallInternal+0x61d3>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19187 (discriminator 1)
   28d10:	f6 41 10 08          	test   BYTE PTR [rcx+0x10],0x8
   28d14:	0f 85 e3 05 00 00    	jne    292fd <JS_CallInternal+0x683d>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19187 (discriminator 14)
   28d1a:	48 8b 4a 30          	mov    rcx,QWORD PTR [rdx+0x30]
   28d1e:	48 85 c9             	test   rcx,rcx
   28d21:	0f 85 49 ff ff ff    	jne    28c70 <JS_CallInternal+0x61b0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18045
   28d27:	4c 8d 6b f0          	lea    r13,[rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19187 (discriminator 15)
   28d2b:	41 b8 03 00 00 00    	mov    r8d,0x3
   28d31:	31 c0                	xor    eax,eax
   28d33:	eb 96                	jmp    28ccb <JS_CallInternal+0x620b>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6162
   28d35:	44 8b 00             	mov    r8d,DWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6155
   28d38:	41 81 e0 ff ff ff 03 	and    r8d,0x3ffffff
   28d3f:	0f 85 8f fe ff ff    	jne    28bd4 <JS_CallInternal+0x6114>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19196 (discriminator 1)
   28d45:	f6 41 10 08          	test   BYTE PTR [rcx+0x10],0x8
   28d49:	0f 85 a2 04 00 00    	jne    291f1 <JS_CallInternal+0x6731>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19196 (discriminator 14)
   28d4f:	48 8b 4a 30          	mov    rcx,QWORD PTR [rdx+0x30]
   28d53:	48 85 c9             	test   rcx,rcx
   28d56:	0f 85 54 fe ff ff    	jne    28bb0 <JS_CallInternal+0x60f0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18045
   28d5c:	4c 8d 6b f0          	lea    r13,[rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19196 (discriminator 15)
   28d60:	b9 03 00 00 00       	mov    ecx,0x3
   28d65:	45 31 f6             	xor    r14d,r14d
   28d68:	e9 a4 fe ff ff       	jmp    28c11 <JS_CallInternal+0x6151>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6162
   28d6d:	44 8b 00             	mov    r8d,DWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6155
   28d70:	41 81 e0 ff ff ff 03 	and    r8d,0x3ffffff
   28d77:	0f 85 56 fc ff ff    	jne    289d3 <JS_CallInternal+0x5f13>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19191 (discriminator 1)
   28d7d:	f6 41 10 08          	test   BYTE PTR [rcx+0x10],0x8
   28d81:	0f 85 2a 05 00 00    	jne    292b1 <JS_CallInternal+0x67f1>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19191 (discriminator 14)
   28d87:	48 8b 4a 30          	mov    rcx,QWORD PTR [rdx+0x30]
   28d8b:	48 85 c9             	test   rcx,rcx
   28d8e:	0f 85 1c fc ff ff    	jne    289b0 <JS_CallInternal+0x5ef0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19191 (discriminator 15)
   28d94:	ba 03 00 00 00       	mov    edx,0x3
   28d99:	31 c0                	xor    eax,eax
   28d9b:	e9 6a fc ff ff       	jmp    28a0a <JS_CallInternal+0x5f4a>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6162
   28da0:	8b 38                	mov    edi,DWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6155
   28da2:	81 e7 ff ff ff 03    	and    edi,0x3ffffff
   28da8:	0f 85 d0 b2 ff ff    	jne    2407e <JS_CallInternal+0x15be>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:67 (discriminator 1)
   28dae:	f6 42 10 08          	test   BYTE PTR [rdx+0x10],0x8
   28db2:	0f 85 98 05 00 00    	jne    29350 <JS_CallInternal+0x6890>
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:67 (discriminator 24)
   28db8:	49 8b 55 30          	mov    rdx,QWORD PTR [r13+0x30]
   28dbc:	48 85 d2             	test   rdx,rdx
   28dbf:	0f 84 3d 16 00 00    	je     2a402 <JS_CallInternal+0x7942>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6151
   28dc5:	4c 8b 6a 18          	mov    r13,QWORD PTR [rdx+0x18]
   28dc9:	e9 92 b2 ff ff       	jmp    24060 <JS_CallInternal+0x15a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6162
   28dce:	8b 10                	mov    edx,DWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6155
   28dd0:	81 e2 ff ff ff 03    	and    edx,0x3ffffff
   28dd6:	0f 85 c2 b1 ff ff    	jne    23f9e <JS_CallInternal+0x14de>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:70 (discriminator 1)
   28ddc:	f6 47 10 08          	test   BYTE PTR [rdi+0x10],0x8
   28de0:	0f 85 d3 05 00 00    	jne    293b9 <JS_CallInternal+0x68f9>
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:70 (discriminator 24)
   28de6:	49 8b 7d 30          	mov    rdi,QWORD PTR [r13+0x30]
   28dea:	48 85 ff             	test   rdi,rdi
   28ded:	0f 84 c2 15 00 00    	je     2a3b5 <JS_CallInternal+0x78f5>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6151
   28df3:	4c 8b 6f 18          	mov    r13,QWORD PTR [rdi+0x18]
   28df7:	e9 84 b1 ff ff       	jmp    23f80 <JS_CallInternal+0x14c0>
min_int():
/home/mzyx/read_ic_dequickening_attempt01/M/cutils.h:90
   28dfc:	8b b5 bc fe ff ff    	mov    esi,DWORD PTR [rbp-0x144]
   28e02:	39 f7                	cmp    edi,esi
   28e04:	41 89 f5             	mov    r13d,esi
   28e07:	44 0f 4e ef          	cmovle r13d,edi
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17871 (discriminator 1)
   28e0b:	45 85 ed             	test   r13d,r13d
   28e0e:	0f 8e 2c 14 00 00    	jle    2a240 <JS_CallInternal+0x7780>
   28e14:	4c 8b bd a8 fe ff ff 	mov    r15,QWORD PTR [rbp-0x158]
   28e1b:	4d 63 f5             	movsxd r14,r13d
   28e1e:	4d 8d 43 08          	lea    r8,[r11+0x8]
   28e22:	49 c1 e6 04          	shl    r14,0x4
   28e26:	4c 89 fe             	mov    rsi,r15
   28e29:	4d 01 fe             	add    r14,r15
   28e2c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17872
   28e30:	4c 8b 66 08          	mov    r12,QWORD PTR [rsi+0x8]
   28e34:	4c 8b 3e             	mov    r15,QWORD PTR [rsi]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   28e37:	41 83 fc f6          	cmp    r12d,0xfffffff6
   28e3b:	76 05                	jbe    28e42 <JS_CallInternal+0x6382>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   28e3d:	41 83 47 fc 01       	add    DWORD PTR [r15-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17871 (discriminator 1)
   28e42:	48 83 c6 10          	add    rsi,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17872
   28e46:	4d 89 78 f8          	mov    QWORD PTR [r8-0x8],r15
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17871 (discriminator 1)
   28e4a:	49 83 c0 10          	add    r8,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17872
   28e4e:	4d 89 60 f0          	mov    QWORD PTR [r8-0x10],r12
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17871 (discriminator 1)
   28e52:	4c 39 f6             	cmp    rsi,r14
   28e55:	75 d9                	jne    28e30 <JS_CallInternal+0x6370>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17873 (discriminator 1)
   28e57:	44 39 ef             	cmp    edi,r13d
   28e5a:	7e 3c                	jle    28e98 <JS_CallInternal+0x63d8>
   28e5c:	44 8d 47 ff          	lea    r8d,[rdi-0x1]
   28e60:	4d 63 e5             	movsxd r12,r13d
   28e63:	45 29 e8             	sub    r8d,r13d
   28e66:	4c 89 e6             	mov    rsi,r12
   28e69:	4d 01 e0             	add    r8,r12
   28e6c:	48 c1 e6 04          	shl    rsi,0x4
   28e70:	49 c1 e0 04          	shl    r8,0x4
   28e74:	4c 01 de             	add    rsi,r11
   28e77:	4f 8d 44 03 10       	lea    r8,[r11+r8*1+0x10]
   28e7c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17874
   28e80:	48 c7 06 00 00 00 00 	mov    QWORD PTR [rsi],0x0
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17873 (discriminator 1)
   28e87:	48 83 c6 10          	add    rsi,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17874
   28e8b:	48 c7 46 f8 03 00 00 	mov    QWORD PTR [rsi-0x8],0x3
   28e92:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17873 (discriminator 1)
   28e93:	4c 39 c6             	cmp    rsi,r8
   28e96:	75 e8                	jne    28e80 <JS_CallInternal+0x63c0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17875
   28e98:	89 bd 38 ff ff ff    	mov    DWORD PTR [rbp-0xc8],edi
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17870
   28e9e:	4c 89 9d 90 fe ff ff 	mov    QWORD PTR [rbp-0x170],r11
   28ea5:	e9 f4 9d ff ff       	jmp    22c9e <JS_CallInternal+0x1de>
JS_GetProperty():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:782
   28eaa:	48 83 ec 08          	sub    rsp,0x8
   28eae:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
   28eb4:	49 89 d1             	mov    r9,rdx
   28eb7:	48 89 c6             	mov    rsi,rax
   28eba:	6a 00                	push   0x0
   28ebc:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   28ec3:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
   28eca:	e8 e1 3e 00 00       	call   2cdb0 <JS_GetPropertyInternal>
js_has_unscopable():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16020
   28ecf:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   28ed6:	48 89 c6             	mov    rsi,rax
   28ed9:	e8 f2 5b ff ff       	call   1ead0 <JS_ToBoolFree>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   28ede:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
js_has_unscopable():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16020
   28ee5:	89 c1                	mov    ecx,eax
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   28ee7:	41 8b 40 fc          	mov    eax,DWORD PTR [r8-0x4]
   28eeb:	83 e8 01             	sub    eax,0x1
   28eee:	41 89 40 fc          	mov    DWORD PTR [r8-0x4],eax
   28ef2:	41 5b                	pop    r11
   28ef4:	5a                   	pop    rdx
   28ef5:	85 c0                	test   eax,eax
   28ef7:	0f 8e f7 36 00 00    	jle    2c5f4 <JS_CallInternal+0x9b34>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20536 (discriminator 1)
   28efd:	85 c9                	test   ecx,ecx
   28eff:	0f 88 c1 a6 ff ff    	js     235c6 <JS_CallInternal+0xb06>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20538
   28f05:	0f 84 58 9f ff ff    	je     22e63 <JS_CallInternal+0x3a3>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20609
   28f0b:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   28f0f:	48 83 eb 10          	sub    rbx,0x10
   28f13:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   28f16:	83 fa f6             	cmp    edx,0xfffffff6
   28f19:	0f 86 80 a4 ff ff    	jbe    2339f <JS_CallInternal+0x8df>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   28f1f:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   28f22:	83 e8 01             	sub    eax,0x1
   28f25:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   28f28:	85 c0                	test   eax,eax
   28f2a:	0f 8f 6f a4 ff ff    	jg     2339f <JS_CallInternal+0x8df>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   28f30:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   28f37:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   28f3b:	e8 60 39 ff ff       	call   1c8a0 <__JS_FreeValueRT>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20610
   28f40:	e9 5a a4 ff ff       	jmp    2339f <JS_CallInternal+0x8df>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18256
   28f45:	8b 85 38 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1c8]
   28f4b:	48 8b 9d 50 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1b0]
   28f52:	4c 8b a5 40 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1c0]
   28f59:	83 c0 02             	add    eax,0x2
   28f5c:	48 98                	cdqe
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18259
   28f5e:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18256
   28f62:	48 c1 e0 04          	shl    rax,0x4
   28f66:	48 29 c3             	sub    rbx,rax
   28f69:	48 89 da             	mov    rdx,rbx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18257
   28f6c:	48 8d 5b 10          	lea    rbx,[rbx+0x10]
   28f70:	4c 89 2a             	mov    QWORD PTR [rdx],r13
   28f73:	4c 89 72 08          	mov    QWORD PTR [rdx+0x8],r14
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18259
   28f77:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   28f7d:	49 89 c5             	mov    r13,rax
   28f80:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28f84:	ff e0                	jmp    rax
   28f86:	4c 89 f0             	mov    rax,r14
   28f89:	4c 8b a5 50 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1b0]
   28f90:	49 89 de             	mov    r14,rbx
   28f93:	48 89 c3             	mov    rbx,rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19056 (discriminator 1)
   28f96:	48 8b 85 68 fe ff ff 	mov    rax,QWORD PTR [rbp-0x198]
   28f9d:	49 39 c6             	cmp    r14,rax
   28fa0:	0f 84 51 26 00 00    	je     2b5f7 <JS_CallInternal+0x8b37>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19061
   28fa6:	4d 89 6e f0          	mov    QWORD PTR [r14-0x10],r13
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19063
   28faa:	49 83 c4 01          	add    r12,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19061
   28fae:	49 89 5e f8          	mov    QWORD PTR [r14-0x8],rbx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19063
   28fb2:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   28fb8:	4c 89 f3             	mov    rbx,r14
   28fbb:	49 89 c5             	mov    r13,rax
   28fbe:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28fc2:	ff e0                	jmp    rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19380
   28fc4:	80 fa 01             	cmp    dl,0x1
   28fc7:	0f 84 7b 02 00 00    	je     29248 <JS_CallInternal+0x6788>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19385
   28fcd:	80 cc 10             	or     ah,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19384
   28fd0:	f3 0f 6f 53 f0       	movdqu xmm2,XMMWORD PTR [rbx-0x10]
js_method_set_properties():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:5937
   28fd5:	8b b5 50 fe ff ff    	mov    esi,DWORD PTR [rbp-0x1b0]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19385
   28fdb:	89 85 24 fe ff ff    	mov    DWORD PTR [rbp-0x1dc],eax
   28fe1:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
js_method_set_properties():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:5937
   28fe5:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19384
   28fec:	0f 29 95 e0 fd ff ff 	movaps XMMWORD PTR [rbp-0x220],xmm2
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19387
   28ff3:	48 89 85 d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rax
   28ffa:	49 8b 44 24 08       	mov    rax,QWORD PTR [r12+0x8]
   28fff:	48 89 85 d0 fd ff ff 	mov    QWORD PTR [rbp-0x230],rax
js_method_set_properties():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:5937
   29006:	e8 e5 76 01 00       	call   406f0 <js_get_function_name>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:5941
   2900b:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29012:	4c 8d 05 2b 41 0a 00 	lea    r8,[rip+0xa412b]        # cd144 <_IO_stdin_used+0x144>
   29019:	48 8d 35 52 45 0a 00 	lea    rsi,[rip+0xa4552]        # cd572 <_IO_stdin_used+0x572>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:5937
   29020:	49 89 d1             	mov    r9,rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:5941
   29023:	48 89 c2             	mov    rdx,rax
   29026:	4c 89 c9             	mov    rcx,r9
   29029:	e8 52 75 01 00       	call   40580 <JS_ConcatString3>
   2902e:	49 89 d1             	mov    r9,rdx
   29031:	e9 86 a8 ff ff       	jmp    238bc <JS_CallInternal+0xdfc>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18237
   29036:	8b 85 40 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1c0]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18240
   2903c:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18237
   29040:	83 c0 02             	add    eax,0x2
   29043:	48 98                	cdqe
   29045:	48 c1 e0 04          	shl    rax,0x4
   29049:	48 29 c3             	sub    rbx,rax
   2904c:	48 89 da             	mov    rdx,rbx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18238
   2904f:	48 8d 5b 10          	lea    rbx,[rbx+0x10]
   29053:	4c 89 0a             	mov    QWORD PTR [rdx],r9
   29056:	4c 89 42 08          	mov    QWORD PTR [rdx+0x8],r8
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18240
   2905a:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   29060:	49 89 c5             	mov    r13,rax
   29063:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   29067:	ff e0                	jmp    rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18408
   29069:	8b 85 50 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1b0]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18411
   2906f:	49 83 c4 05          	add    r12,0x5
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18408
   29073:	83 c0 01             	add    eax,0x1
   29076:	48 98                	cdqe
   29078:	48 c1 e0 04          	shl    rax,0x4
   2907c:	48 29 c3             	sub    rbx,rax
   2907f:	48 89 da             	mov    rdx,rbx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18409
   29082:	48 8d 5b 10          	lea    rbx,[rbx+0x10]
   29086:	4c 89 0a             	mov    QWORD PTR [rdx],r9
   29089:	4c 89 42 08          	mov    QWORD PTR [rdx+0x8],r8
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18411
   2908d:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   29093:	49 89 c5             	mov    r13,rax
   29096:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2909a:	ff e0                	jmp    rax
free_arg_list():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18411
   2909c:	48 8b 9d 38 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1c8]
   290a3:	4c 8b a5 28 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1d8]
js_free_rt():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:1816
   290aa:	4c 89 f6             	mov    rsi,r14
   290ad:	e8 ee b9 fe ff       	call   14aa0 <__js_free>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18438 (discriminator 2)
   290b2:	41 83 fd 06          	cmp    r13d,0x6
   290b6:	0f 84 5d 19 00 00    	je     2aa19 <JS_CallInternal+0x7f59>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18440
   290bc:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   290c0:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   290c4:	83 fa f6             	cmp    edx,0xfffffff6
   290c7:	76 11                	jbe    290da <JS_CallInternal+0x661a>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   290c9:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   290cc:	83 e8 01             	sub    eax,0x1
   290cf:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   290d2:	85 c0                	test   eax,eax
   290d4:	0f 8e 4b 19 00 00    	jle    2aa25 <JS_CallInternal+0x7f65>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18441
   290da:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   290e1:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   290e5:	48 8b 30             	mov    rsi,QWORD PTR [rax]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   290e8:	83 fa f6             	cmp    edx,0xfffffff6
   290eb:	76 11                	jbe    290fe <JS_CallInternal+0x663e>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   290ed:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   290f0:	83 e8 01             	sub    eax,0x1
   290f3:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   290f6:	85 c0                	test   eax,eax
   290f8:	0f 8e 50 13 00 00    	jle    2a44e <JS_CallInternal+0x798e>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18443
   290fe:	48 8b 85 40 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c0]
   29105:	4c 89 6b e8          	mov    QWORD PTR [rbx-0x18],r13
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18445
   29109:	49 83 c4 03          	add    r12,0x3
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18443
   2910d:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18445
   29111:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18443
   29117:	48 8b 9d 50 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1b0]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18445
   2911e:	49 89 c5             	mov    r13,rax
   29121:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   29125:	ff e0                	jmp    rax
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6162
   29127:	8b 10                	mov    edx,DWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6155
   29129:	81 e2 ff ff ff 03    	and    edx,0x3ffffff
   2912f:	0f 85 bb d8 ff ff    	jne    269f0 <JS_CallInternal+0x3f30>
JS_DefinePrivateField():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:8420
   29135:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2913c:	89 f2                	mov    edx,esi
   2913e:	b9 07 00 00 00       	mov    ecx,0x7
   29143:	4c 89 c6             	mov    rsi,r8
   29146:	e8 d5 cf 01 00       	call   46120 <add_property>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:8421 (discriminator 1)
   2914b:	48 85 c0             	test   rax,rax
   2914e:	0f 84 c8 d8 ff ff    	je     26a1c <JS_CallInternal+0x3f5c>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:8426
   29154:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   2915b:	4c 89 28             	mov    QWORD PTR [rax],r13
   2915e:	48 89 48 08          	mov    QWORD PTR [rax+0x8],rcx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19285
   29162:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   29166:	49 8b 36             	mov    rsi,QWORD PTR [r14]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   29169:	83 fa f6             	cmp    edx,0xfffffff6
   2916c:	76 11                	jbe    2917f <JS_CallInternal+0x66bf>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   2916e:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   29171:	83 e8 01             	sub    eax,0x1
   29174:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29177:	85 c0                	test   eax,eax
   29179:	0f 8e f8 23 00 00    	jle    2b577 <JS_CallInternal+0x8ab7>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19290
   2917f:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19286
   29184:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19290
   29187:	49 83 c4 01          	add    r12,0x1
   2918b:	49 89 c5             	mov    r13,rax
   2918e:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   29192:	ff e0                	jmp    rax
JS_NewFloat64():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19290
   29194:	ba 08 00 00 00       	mov    edx,0x8
   29199:	e9 51 e1 ff ff       	jmp    272ef <JS_CallInternal+0x482f>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3735 (discriminator 1)
   2919e:	81 bd 50 fe ff ff f2 	cmp    DWORD PTR [rbp-0x1b0],0xf2
   291a5:	00 00 00 
   291a8:	0f 8f 33 10 00 00    	jg     2a1e1 <JS_CallInternal+0x7721>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19395
   291ae:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   291b2:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   291b6:	83 fa f6             	cmp    edx,0xfffffff6
   291b9:	0f 86 03 a8 ff ff    	jbe    239c2 <JS_CallInternal+0xf02>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   291bf:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   291c2:	83 e8 01             	sub    eax,0x1
   291c5:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   291c8:	85 c0                	test   eax,eax
   291ca:	0f 8f f2 a7 ff ff    	jg     239c2 <JS_CallInternal+0xf02>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   291d0:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   291d7:	89 8d 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],ecx
   291dd:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   291e1:	e8 ba 36 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   291e6:	8b 8d 50 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1b0]
   291ec:	e9 d1 a7 ff ff       	jmp    239c2 <JS_CallInternal+0xf02>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19196 (discriminator 13)
   291f1:	48 89 ce             	mov    rsi,rcx
   291f4:	48 c7 c7 ff ff ff ff 	mov    rdi,0xffffffffffffffff
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19196 (discriminator 12)
   291fb:	48 83 ec 08          	sub    rsp,0x8
   291ff:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   29203:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   29207:	48 89 fa             	mov    rdx,rdi
   2920a:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   29211:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29218:	b9 32 00 00 00       	mov    ecx,0x32
   2921d:	4c 8d 6b f0          	lea    r13,[rbx-0x10]
   29221:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   29225:	6a 00                	push   0x0
   29227:	e8 84 3b 00 00       	call   2cdb0 <JS_GetPropertyInternal>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19196 (discriminator 3)
   2922c:	5f                   	pop    rdi
   2922d:	41 58                	pop    r8
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19196 (discriminator 12)
   2922f:	49 89 c6             	mov    r14,rax
   29232:	48 89 d1             	mov    rcx,rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19196 (discriminator 3)
   29235:	83 fa 06             	cmp    edx,0x6
   29238:	0f 85 d3 f9 ff ff    	jne    28c11 <JS_CallInternal+0x6151>
   2923e:	e9 1d a0 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
   29243:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19382
   29248:	80 cc 08             	or     ah,0x8
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19381
   2924b:	f3 0f 6f 7b f0       	movdqu xmm7,XMMWORD PTR [rbx-0x10]
js_method_set_properties():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:5937
   29250:	8b b5 50 fe ff ff    	mov    esi,DWORD PTR [rbp-0x1b0]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19382
   29256:	89 85 24 fe ff ff    	mov    DWORD PTR [rbp-0x1dc],eax
   2925c:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
js_method_set_properties():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:5937
   29260:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19381
   29267:	0f 29 bd 10 fe ff ff 	movaps XMMWORD PTR [rbp-0x1f0],xmm7
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19387
   2926e:	48 89 85 d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rax
   29275:	49 8b 44 24 08       	mov    rax,QWORD PTR [r12+0x8]
   2927a:	48 89 85 d0 fd ff ff 	mov    QWORD PTR [rbp-0x230],rax
js_method_set_properties():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:5937
   29281:	e8 6a 74 01 00       	call   406f0 <js_get_function_name>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:5939
   29286:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2928d:	4c 8d 05 b0 3e 0a 00 	lea    r8,[rip+0xa3eb0]        # cd144 <_IO_stdin_used+0x144>
   29294:	48 8d 35 d2 42 0a 00 	lea    rsi,[rip+0xa42d2]        # cd56d <_IO_stdin_used+0x56d>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:5937
   2929b:	49 89 d1             	mov    r9,rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:5939
   2929e:	48 89 c2             	mov    rdx,rax
   292a1:	4c 89 c9             	mov    rcx,r9
   292a4:	e8 d7 72 01 00       	call   40580 <JS_ConcatString3>
   292a9:	49 89 d1             	mov    r9,rdx
   292ac:	e9 0b a6 ff ff       	jmp    238bc <JS_CallInternal+0xdfc>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19191 (discriminator 13)
   292b1:	49 89 ca             	mov    r10,rcx
   292b4:	48 c7 c7 ff ff ff ff 	mov    rdi,0xffffffffffffffff
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19191 (discriminator 12)
   292bb:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   292c2:	48 83 ec 08          	sub    rsp,0x8
   292c6:	48 89 fa             	mov    rdx,rdi
   292c9:	89 f1                	mov    ecx,esi
   292cb:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   292cf:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   292d3:	4c 89 d6             	mov    rsi,r10
   292d6:	4c 89 68 30          	mov    QWORD PTR [rax+0x30],r13
   292da:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   292e1:	6a 00                	push   0x0
   292e3:	e8 c8 3a 00 00       	call   2cdb0 <JS_GetPropertyInternal>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19191 (discriminator 3)
   292e8:	41 59                	pop    r9
   292ea:	41 5a                	pop    r10
   292ec:	83 fa 06             	cmp    edx,0x6
   292ef:	0f 85 15 f7 ff ff    	jne    28a0a <JS_CallInternal+0x5f4a>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19191 (discriminator 1)
   292f5:	4d 89 ec             	mov    r12,r13
   292f8:	e9 63 9f ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19187 (discriminator 13)
   292fd:	49 89 ca             	mov    r10,rcx
   29300:	48 c7 c7 ff ff ff ff 	mov    rdi,0xffffffffffffffff
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19187 (discriminator 12)
   29307:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2930e:	48 83 ec 08          	sub    rsp,0x8
   29312:	48 89 fa             	mov    rdx,rdi
   29315:	89 f1                	mov    ecx,esi
   29317:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   2931b:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   2931f:	4c 89 d6             	mov    rsi,r10
   29322:	4c 8d 6b f0          	lea    r13,[rbx-0x10]
   29326:	4c 89 70 30          	mov    QWORD PTR [rax+0x30],r14
   2932a:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29331:	6a 00                	push   0x0
   29333:	e8 78 3a 00 00       	call   2cdb0 <JS_GetPropertyInternal>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19187 (discriminator 3)
   29338:	41 5b                	pop    r11
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19187 (discriminator 12)
   2933a:	49 89 d0             	mov    r8,rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19187 (discriminator 3)
   2933d:	5a                   	pop    rdx
   2933e:	41 83 f8 06          	cmp    r8d,0x6
   29342:	0f 85 83 f9 ff ff    	jne    28ccb <JS_CallInternal+0x620b>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19187 (discriminator 1)
   29348:	4d 89 f4             	mov    r12,r14
   2934b:	e9 10 9f ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:67 (discriminator 23)
   29350:	48 89 d6             	mov    rsi,rdx
   29353:	49 c7 c2 ff ff ff ff 	mov    r10,0xffffffffffffffff
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:67 (discriminator 15)
   2935a:	48 83 ec 08          	sub    rsp,0x8
   2935e:	4c 8d 5b f0          	lea    r11,[rbx-0x10]
   29362:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   29366:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   2936a:	48 8b bd 50 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x1b0]
   29371:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   29378:	4c 89 9d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r11
   2937f:	4c 89 d2             	mov    rdx,r10
   29382:	48 89 78 30          	mov    QWORD PTR [rax+0x30],rdi
   29386:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2938d:	6a 00                	push   0x0
   2938f:	e8 1c 3a 00 00       	call   2cdb0 <JS_GetPropertyInternal>
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:67 (discriminator 3)
   29394:	5f                   	pop    rdi
   29395:	4c 8b 9d 40 fe ff ff 	mov    r11,QWORD PTR [rbp-0x1c0]
   2939c:	83 fa 06             	cmp    edx,0x6
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:67 (discriminator 15)
   2939f:	49 89 c5             	mov    r13,rax
   293a2:	49 89 d0             	mov    r8,rdx
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:67 (discriminator 3)
   293a5:	41 59                	pop    r9
   293a7:	0f 85 1e ad ff ff    	jne    240cb <JS_CallInternal+0x160b>
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:67 (discriminator 1)
   293ad:	4c 8b a5 50 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1b0]
   293b4:	e9 a7 9e ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:70 (discriminator 23)
   293b9:	48 89 fe             	mov    rsi,rdi
   293bc:	49 c7 c2 ff ff ff ff 	mov    r10,0xffffffffffffffff
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:70 (discriminator 15)
   293c3:	48 83 ec 08          	sub    rsp,0x8
   293c7:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   293cb:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   293cf:	4c 89 d2             	mov    rdx,r10
   293d2:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   293d9:	4c 89 9d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r11
   293e0:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   293e7:	4c 89 58 30          	mov    QWORD PTR [rax+0x30],r11
   293eb:	6a 00                	push   0x0
   293ed:	e8 be 39 00 00       	call   2cdb0 <JS_GetPropertyInternal>
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:70 (discriminator 3)
   293f2:	59                   	pop    rcx
   293f3:	4c 8b 9d 50 fe ff ff 	mov    r11,QWORD PTR [rbp-0x1b0]
   293fa:	83 fa 06             	cmp    edx,0x6
   293fd:	5e                   	pop    rsi
   293fe:	0f 85 e0 ab ff ff    	jne    23fe4 <JS_CallInternal+0x1524>
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:70 (discriminator 1)
   29404:	4d 89 dc             	mov    r12,r11
   29407:	e9 54 9e ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18215 (discriminator 1)
   2940c:	4c 8b a5 50 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1b0]
   29413:	e9 48 9e ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20112
   29418:	48 8b 8d c8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x138]
   2941f:	4c 89 71 30          	mov    QWORD PTR [rcx+0x30],r14
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   29423:	83 fa f6             	cmp    edx,0xfffffff6
   29426:	76 04                	jbe    2942c <JS_CallInternal+0x696c>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   29428:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20116
   2942c:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20115
   29433:	48 89 95 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20116
   2943a:	48 8d b5 00 ff ff ff 	lea    rsi,[rbp-0x100]
   29441:	ba 8c 00 00 00       	mov    edx,0x8c
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20115
   29446:	48 89 85 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20116
   2944d:	e8 ce bd 02 00       	call   55220 <js_unary_arith_slow>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20116 (discriminator 1)
   29452:	85 c0                	test   eax,eax
   29454:	0f 85 5b 37 00 00    	jne    2cbb5 <JS_CallInternal+0xa0f5>
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   2945a:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   2945e:	66 0f 6f a5 f0 fe ff 	movdqa xmm4,XMMWORD PTR [rbp-0x110]
   29465:	ff 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   29466:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   2946a:	41 0f 11 65 00       	movups XMMWORD PTR [r13+0x0],xmm4
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   2946f:	83 fa f6             	cmp    edx,0xfffffff6
   29472:	0f 86 7c dc ff ff    	jbe    270f4 <JS_CallInternal+0x4634>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   29478:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2947b:	83 e8 01             	sub    eax,0x1
   2947e:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29481:	85 c0                	test   eax,eax
   29483:	0f 8f 6b dc ff ff    	jg     270f4 <JS_CallInternal+0x4634>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   29489:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   29490:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   29494:	e8 07 34 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   29499:	e9 56 dc ff ff       	jmp    270f4 <JS_CallInternal+0x4634>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20086
   2949e:	48 8b 8d c8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x138]
   294a5:	4c 89 71 30          	mov    QWORD PTR [rcx+0x30],r14
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   294a9:	83 fa f6             	cmp    edx,0xfffffff6
   294ac:	76 04                	jbe    294b2 <JS_CallInternal+0x69f2>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   294ae:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20090
   294b2:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20089
   294b9:	48 89 95 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20090
   294c0:	48 8d b5 00 ff ff ff 	lea    rsi,[rbp-0x100]
   294c7:	ba 8d 00 00 00       	mov    edx,0x8d
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20089
   294cc:	48 89 85 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20090
   294d3:	e8 48 bd 02 00       	call   55220 <js_unary_arith_slow>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20090 (discriminator 1)
   294d8:	85 c0                	test   eax,eax
   294da:	0f 85 57 38 00 00    	jne    2cd37 <JS_CallInternal+0xa277>
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   294e0:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   294e4:	66 0f 6f 9d f0 fe ff 	movdqa xmm3,XMMWORD PTR [rbp-0x110]
   294eb:	ff 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   294ec:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   294f0:	41 0f 11 5d 00       	movups XMMWORD PTR [r13+0x0],xmm3
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   294f5:	83 fa f6             	cmp    edx,0xfffffff6
   294f8:	0f 86 6a e3 ff ff    	jbe    27868 <JS_CallInternal+0x4da8>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   294fe:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   29501:	83 e8 01             	sub    eax,0x1
   29504:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29507:	85 c0                	test   eax,eax
   29509:	0f 8f 59 e3 ff ff    	jg     27868 <JS_CallInternal+0x4da8>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   2950f:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   29516:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2951a:	e8 81 33 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2951f:	e9 44 e3 ff ff       	jmp    27868 <JS_CallInternal+0x4da8>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20486
   29524:	85 c0                	test   eax,eax
   29526:	0f 84 bc b9 ff ff    	je     24ee8 <JS_CallInternal+0x2428>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20492
   2952c:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
JS_ToPropertyKey():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:13688
   29533:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   29537:	b9 01 00 00 00       	mov    ecx,0x1
   2953c:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   29540:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20492
   29547:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
JS_ToPropertyKey():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:13688
   2954b:	e8 30 69 01 00       	call   3fe80 <JS_ToStringInternal>
   29550:	48 89 c1             	mov    rcx,rax
   29553:	49 89 d5             	mov    r13,rdx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20494 (discriminator 1)
   29556:	83 fa 06             	cmp    edx,0x6
   29559:	0f 84 01 9d ff ff    	je     23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20496
   2955f:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   29563:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   29567:	83 fa f6             	cmp    edx,0xfffffff6
   2956a:	76 11                	jbe    2957d <JS_CallInternal+0x6abd>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   2956c:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2956f:	83 e8 01             	sub    eax,0x1
   29572:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29575:	85 c0                	test   eax,eax
   29577:	0f 8e 93 2b 00 00    	jle    2c110 <JS_CallInternal+0x9650>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20497
   2957d:	48 89 4b f0          	mov    QWORD PTR [rbx-0x10],rcx
   29581:	4c 89 6b f8          	mov    QWORD PTR [rbx-0x8],r13
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20498
   29585:	e9 5e b9 ff ff       	jmp    24ee8 <JS_CallInternal+0x2428>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19985
   2958a:	83 fa 08             	cmp    edx,0x8
   2958d:	0f 85 e8 0b 00 00    	jne    2a17b <JS_CallInternal+0x76bb>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19986
   29593:	66 48 0f 6e c0       	movq   xmm0,rax
   29598:	66 0f 57 05 c0 14 0b 	xorpd  xmm0,XMMWORD PTR [rip+0xb14c0]        # daa60 <typed_array_size_log2+0x28>
   2959f:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19988
   295a0:	48 c7 43 f8 08 00 00 	mov    QWORD PTR [rbx-0x8],0x8
   295a7:	00 
   295a8:	f2 0f 11 43 f0       	movsd  QWORD PTR [rbx-0x10],xmm0
   295ad:	e9 d3 dd ff ff       	jmp    27385 <JS_CallInternal+0x48c5>
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   295b2:	83 bd 88 fe ff ff f6 	cmp    DWORD PTR [rbp-0x178],0xfffffff6
   295b9:	0f 86 95 c0 ff ff    	jbe    25654 <JS_CallInternal+0x2b94>
   295bf:	e9 85 c0 ff ff       	jmp    25649 <JS_CallInternal+0x2b89>
   295c4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20699
   295c8:	45 85 ed             	test   r13d,r13d
   295cb:	0f 85 7e 2f 00 00    	jne    2c54f <JS_CallInternal+0x9a8f>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20701
   295d1:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   295d5:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   295d9:	4c 8d 6b e0          	lea    r13,[rbx-0x20]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   295dd:	83 fa f6             	cmp    edx,0xfffffff6
   295e0:	76 11                	jbe    295f3 <JS_CallInternal+0x6b33>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   295e2:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   295e5:	83 e8 01             	sub    eax,0x1
   295e8:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   295eb:	85 c0                	test   eax,eax
   295ed:	0f 8e 2a 2a 00 00    	jle    2c01d <JS_CallInternal+0x955d>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20703
   295f3:	48 8b 73 d0          	mov    rsi,QWORD PTR [rbx-0x30]
   295f7:	48 8b 53 d8          	mov    rdx,QWORD PTR [rbx-0x28]
   295fb:	b9 01 00 00 00       	mov    ecx,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20702
   29600:	4c 89 eb             	mov    rbx,r13
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20703
   29603:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2960a:	e8 61 79 00 00       	call   30f70 <JS_IteratorClose>
   2960f:	e9 e9 9d ff ff       	jmp    233fd <JS_CallInternal+0x93d>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19333
   29614:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   29618:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   2961c:	4c 89 e9             	mov    rcx,r13
   2961f:	4d 89 f0             	mov    r8,r14
   29622:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29629:	41 b9 01 00 00 00    	mov    r9d,0x1
   2962f:	e8 cc 2d 01 00       	call   3c400 <JS_SetPrototypeInternal>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19333 (discriminator 1)
   29634:	85 c0                	test   eax,eax
   29636:	0f 89 7d db ff ff    	jns    271b9 <JS_CallInternal+0x46f9>
   2963c:	e9 1f 9c ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
   29641:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20363 (discriminator 4)
   29648:	41 83 f8 08          	cmp    r8d,0x8
   2964c:	0f 85 5c 0a 00 00    	jne    2a0ae <JS_CallInternal+0x75ee>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20363 (discriminator 5)
   29652:	66 0f ef c0          	pxor   xmm0,xmm0
   29656:	66 49 0f 6e d1       	movq   xmm2,r9
   2965b:	ba 00 00 00 00       	mov    edx,0x0
   29660:	f2 41 0f 2a c6       	cvtsi2sd xmm0,r14d
   29665:	66 0f 2e c2          	ucomisd xmm0,xmm2
   29669:	0f 9b c0             	setnp  al
   2966c:	0f 45 c2             	cmovne eax,edx
   2966f:	e9 e1 d2 ff ff       	jmp    26955 <JS_CallInternal+0x3e95>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20364 (discriminator 4)
   29674:	41 83 f8 08          	cmp    r8d,0x8
   29678:	0f 85 62 0a 00 00    	jne    2a0e0 <JS_CallInternal+0x7620>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20364 (discriminator 5)
   2967e:	66 0f ef c0          	pxor   xmm0,xmm0
   29682:	66 49 0f 6e f9       	movq   xmm7,r9
   29687:	31 c0                	xor    eax,eax
   29689:	f2 41 0f 2a c6       	cvtsi2sd xmm0,r14d
   2968e:	66 0f 2e c7          	ucomisd xmm0,xmm7
   29692:	0f 9b c0             	setnp  al
   29695:	41 0f 45 c5          	cmovne eax,r13d
   29699:	e9 57 d2 ff ff       	jmp    268f5 <JS_CallInternal+0x3e35>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20421 (discriminator 4)
   2969e:	41 83 fe 08          	cmp    r14d,0x8
   296a2:	0f 85 7c 0b 00 00    	jne    2a224 <JS_CallInternal+0x7764>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20421 (discriminator 5)
   296a8:	66 0f ef c0          	pxor   xmm0,xmm0
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   296ac:	66 49 0f 6e f5       	movq   xmm6,r13
   296b1:	31 c0                	xor    eax,eax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20421 (discriminator 5)
   296b3:	f2 0f 2a c2          	cvtsi2sd xmm0,edx
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   296b7:	ba 01 00 00 00       	mov    edx,0x1
   296bc:	66 0f 2e c6          	ucomisd xmm0,xmm6
   296c0:	0f 9a c0             	setp   al
   296c3:	48 0f 45 c2          	cmovne rax,rdx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   296c7:	e9 73 e2 ff ff       	jmp    2793f <JS_CallInternal+0x4e7f>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20420 (discriminator 4)
   296cc:	41 83 fe 08          	cmp    r14d,0x8
   296d0:	0f 85 72 0b 00 00    	jne    2a248 <JS_CallInternal+0x7788>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20420 (discriminator 5)
   296d6:	66 0f ef c0          	pxor   xmm0,xmm0
   296da:	66 49 0f 6e dd       	movq   xmm3,r13
   296df:	31 c0                	xor    eax,eax
   296e1:	f2 0f 2a c2          	cvtsi2sd xmm0,edx
   296e5:	ba 00 00 00 00       	mov    edx,0x0
   296ea:	66 0f 2e c3          	ucomisd xmm0,xmm3
   296ee:	0f 9b c0             	setnp  al
   296f1:	48 0f 45 c2          	cmovne rax,rdx
   296f5:	e9 99 e2 ff ff       	jmp    27993 <JS_CallInternal+0x4ed3>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   296fa:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   29701:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   29705:	e8 96 31 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2970a:	e9 9d b6 ff ff       	jmp    24dac <JS_CallInternal+0x22ec>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20008
   2970f:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20009
   29716:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2971d:	44 89 ea             	mov    edx,r13d
   29720:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20008
   29723:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20009
   29727:	e8 f4 ba 02 00       	call   55220 <js_unary_arith_slow>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20009 (discriminator 1)
   2972c:	85 c0                	test   eax,eax
   2972e:	0f 84 09 dc ff ff    	je     2733d <JS_CallInternal+0x487d>
   29734:	e9 27 9b ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
   29739:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20063
   29740:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20064
   29747:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2974e:	44 89 ea             	mov    edx,r13d
   29751:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20063
   29754:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20064
   29758:	e8 63 bf 02 00       	call   556c0 <js_post_inc_slow>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20064 (discriminator 1)
   2975d:	85 c0                	test   eax,eax
   2975f:	0f 84 44 e1 ff ff    	je     278a9 <JS_CallInternal+0x4de9>
   29765:	e9 f6 9a ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
   2976a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20026
   29770:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20027
   29777:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2977e:	44 89 ea             	mov    edx,r13d
   29781:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20026
   29784:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20027
   29788:	e8 93 ba 02 00       	call   55220 <js_unary_arith_slow>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20027 (discriminator 1)
   2978d:	85 c0                	test   eax,eax
   2978f:	0f 84 7a d4 ff ff    	je     26c0f <JS_CallInternal+0x414f>
   29795:	e9 c6 9a ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
   2979a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19094
   297a0:	41 83 e6 02          	and    r14d,0x2
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19070
   297a4:	48 8d 4b c0          	lea    rcx,[rbx-0x40]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19096
   297a8:	48 8b 73 c0          	mov    rsi,QWORD PTR [rbx-0x40]
   297ac:	4c 8b 41 08          	mov    r8,QWORD PTR [rcx+0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19094
   297b0:	0f 84 eb 0b 00 00    	je     2a3a1 <JS_CallInternal+0x78e1>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19096
   297b6:	48 83 ec 08          	sub    rsp,0x8
   297ba:	45 31 c9             	xor    r9d,r9d
   297bd:	6a 00                	push   0x0
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19099
   297bf:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   297c6:	48 89 f1             	mov    rcx,rsi
   297c9:	48 89 c6             	mov    rsi,rax
   297cc:	e8 6f 35 00 00       	call   2cd40 <JS_CallFree>
   297d1:	41 5a                	pop    r10
   297d3:	41 5b                	pop    r11
   297d5:	48 89 c1             	mov    rcx,rax
   297d8:	49 89 d6             	mov    r14,rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19102 (discriminator 1)
   297db:	83 fa 06             	cmp    edx,0x6
   297de:	0f 84 4d 0c 00 00    	je     2a431 <JS_CallInternal+0x7971>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19104
   297e4:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   297e8:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   297ec:	83 fa f6             	cmp    edx,0xfffffff6
   297ef:	76 11                	jbe    29802 <JS_CallInternal+0x6d42>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   297f1:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   297f4:	83 e8 01             	sub    eax,0x1
   297f7:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   297fa:	85 c0                	test   eax,eax
   297fc:	0f 8e 92 29 00 00    	jle    2c194 <JS_CallInternal+0x96d4>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19105
   29802:	48 89 4b f0          	mov    QWORD PTR [rbx-0x10],rcx
   29806:	31 c9                	xor    ecx,ecx
   29808:	4c 89 73 f8          	mov    QWORD PTR [rbx-0x8],r14
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19106
   2980c:	e9 3a e5 ff ff       	jmp    27d4b <JS_CallInternal+0x528b>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20044
   29811:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20045
   29818:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2981f:	44 89 ea             	mov    edx,r13d
   29822:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20044
   29825:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20045
   29829:	e8 92 be 02 00       	call   556c0 <js_post_inc_slow>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20045 (discriminator 1)
   2982e:	85 c0                	test   eax,eax
   29830:	0f 84 94 d3 ff ff    	je     26bca <JS_CallInternal+0x410a>
   29836:	e9 25 9a ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
   2983b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19358
   29840:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   29844:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   29848:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2984f:	e8 0c a2 01 00       	call   43a60 <JS_ValueToAtom>
   29854:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19359 (discriminator 1)
   2985a:	85 c0                	test   eax,eax
   2985c:	0f 84 fe 99 ff ff    	je     23260 <JS_CallInternal+0x7a0>
   29862:	4d 89 e5             	mov    r13,r12
   29865:	e9 84 9f ff ff       	jmp    237ee <JS_CallInternal+0xd2e>
JS_NewUint32():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:587
   2986a:	66 0f ef c0          	pxor   xmm0,xmm0
   2986e:	f2 48 0f 2a c0       	cvtsi2sd xmm0,rax
   29873:	b8 08 00 00 00       	mov    eax,0x8
   29878:	e9 b2 cf ff ff       	jmp    2682f <JS_CallInternal+0x3d6f>
js_create_array_free():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:9657
   2987d:	4c 89 c6             	mov    rsi,r8
   29880:	48 89 df             	mov    rdi,rbx
   29883:	48 89 8d 10 fe ff ff 	mov    QWORD PTR [rbp-0x1f0],rcx
   2988a:	4c 89 85 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],r8
   29891:	e8 8a 24 01 00       	call   3bd20 <expand_fast_array>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:9657 (discriminator 1)
   29896:	4c 8b 85 28 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1d8]
   2989d:	48 8b 8d 10 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1f0]
   298a4:	85 c0                	test   eax,eax
   298a6:	0f 88 87 28 00 00    	js     2c133 <JS_CallInternal+0x9673>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:9664
   298ac:	8b 85 50 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1b0]
   298b2:	41 89 40 38          	mov    DWORD PTR [r8+0x38],eax
   298b6:	31 c0                	xor    eax,eax
   298b8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   298bf:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:9666
   298c0:	f3 41 0f 6f 5c 05 00 	movdqu xmm3,XMMWORD PTR [r13+rax*1+0x0]
   298c7:	49 8b 50 30          	mov    rdx,QWORD PTR [r8+0x30]
   298cb:	0f 11 1c 02          	movups XMMWORD PTR [rdx+rax*1],xmm3
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:9665 (discriminator 1)
   298cf:	48 83 c0 10          	add    rax,0x10
   298d3:	4c 39 f0             	cmp    rax,r14
   298d6:	75 e8                	jne    298c0 <JS_CallInternal+0x6e00>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:9668 (discriminator 1)
   298d8:	49 8b 40 20          	mov    rax,QWORD PTR [r8+0x20]
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   298dc:	48 8b 9d 40 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1c0]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   298e3:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   298e7:	48 8b 30             	mov    rsi,QWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   298ea:	48 c7 40 08 00 00 00 	mov    QWORD PTR [rax+0x8],0x0
   298f1:	00 
   298f2:	48 89 18             	mov    QWORD PTR [rax],rbx
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   298f5:	83 fa f6             	cmp    edx,0xfffffff6
   298f8:	0f 86 0d a6 ff ff    	jbe    23f0b <JS_CallInternal+0x144b>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   298fe:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   29901:	83 e8 01             	sub    eax,0x1
   29904:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29907:	85 c0                	test   eax,eax
   29909:	0f 8f fc a5 ff ff    	jg     23f0b <JS_CallInternal+0x144b>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   2990f:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   29916:	48 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rcx
   2991d:	4c 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r8
   29924:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   29928:	e8 73 2f ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2992d:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   29934:	4c 8b 85 50 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1b0]
   2993b:	e9 cb a5 ff ff       	jmp    23f0b <JS_CallInternal+0x144b>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18521
   29940:	48 8b bd d8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x128]
   29947:	48 03 77 30          	add    rsi,QWORD PTR [rdi+0x30]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18522
   2994b:	80 7a 11 00          	cmp    BYTE PTR [rdx+0x11],0x0
   2994f:	0f 84 bd 11 00 00    	je     2ab12 <JS_CallInternal+0x8052>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18523
   29955:	41 83 fd 3a          	cmp    r13d,0x3a
   29959:	0f 84 c2 9d ff ff    	je     23721 <JS_CallInternal+0xc61>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18497
   2995f:	8b 76 04             	mov    esi,DWORD PTR [rsi+0x4]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18526
   29962:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18525 (discriminator 1)
   29969:	83 f9 04             	cmp    ecx,0x4
   2996c:	0f 84 53 32 00 00    	je     2cbc5 <JS_CallInternal+0xa105>
JS_ThrowTypeErrorReadOnly():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7757
   29972:	e8 69 87 00 00       	call   320e0 <JS_ThrowTypeErrorReadOnly.part.0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18517
   29977:	4d 89 f4             	mov    r12,r14
   2997a:	e9 e1 98 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
   2997f:	90                   	nop
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19458 (discriminator 10)
   29980:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   29987:	48 89 fa             	mov    rdx,rdi
   2998a:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29991:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   29995:	e8 86 3a 00 00       	call   2d420 <JS_GetPropertyValue>
   2999a:	48 89 c1             	mov    rcx,rax
   2999d:	48 89 d0             	mov    rax,rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19458 (discriminator 3)
   299a0:	83 fa 06             	cmp    edx,0x6
   299a3:	0f 85 31 bd ff ff    	jne    256da <JS_CallInternal+0x2c1a>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19458 (discriminator 15)
   299a9:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19458 (discriminator 16)
   299ad:	e9 ae 98 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
   299b2:	31 c0                	xor    eax,eax
   299b4:	e9 e8 ca ff ff       	jmp    264a1 <JS_CallInternal+0x39e1>
js_operator_private_in():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:15985
   299b9:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   299c0:	4d 89 f0             	mov    r8,r14
   299c3:	4c 89 ce             	mov    rsi,r9
   299c6:	4c 89 ea             	mov    rdx,r13
   299c9:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   299d0:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   299d7:	e8 c4 78 00 00       	call   312a0 <JS_CheckBrand>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:15986
   299dc:	85 c0                	test   eax,eax
   299de:	0f 88 7c 98 ff ff    	js     23260 <JS_CallInternal+0x7a0>
   299e4:	4c 8b 8d 40 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c0]
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   299eb:	0f 95 c0             	setne  al
   299ee:	e9 82 d3 ff ff       	jmp    26d75 <JS_CallInternal+0x42b5>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19609
   299f3:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19610
   299fa:	48 8d 7b f0          	lea    rdi,[rbx-0x10]
   299fe:	41 b9 00 80 00 00    	mov    r9d,0x8000
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19609
   29a04:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19610
   29a08:	48 8d 43 e0          	lea    rax,[rbx-0x20]
   29a0c:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   29a10:	48 83 eb 30          	sub    rbx,0x30
   29a14:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
   29a17:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
   29a1b:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   29a1e:	ff 77 08             	push   QWORD PTR [rdi+0x8]
   29a21:	ff 37                	push   QWORD PTR [rdi]
   29a23:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29a2a:	e8 c1 4d 00 00       	call   2e7f0 <JS_SetPropertyValue>
   29a2f:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   29a33:	5f                   	pop    rdi
   29a34:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19610
   29a37:	41 89 c5             	mov    r13d,eax
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   29a3a:	41 58                	pop    r8
   29a3c:	83 fa f6             	cmp    edx,0xfffffff6
   29a3f:	76 11                	jbe    29a52 <JS_CallInternal+0x6f92>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   29a41:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   29a44:	83 e8 01             	sub    eax,0x1
   29a47:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29a4a:	85 c0                	test   eax,eax
   29a4c:	0f 8e 4f 25 00 00    	jle    2bfa1 <JS_CallInternal+0x94e1>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19613 (discriminator 1)
   29a52:	45 85 ed             	test   r13d,r13d
   29a55:	0f 89 d2 e6 ff ff    	jns    2812d <JS_CallInternal+0x566d>
   29a5b:	e9 00 98 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19462 (discriminator 10)
   29a60:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   29a67:	48 89 ca             	mov    rdx,rcx
   29a6a:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   29a6e:	4c 89 c0             	mov    rax,r8
   29a71:	49 89 f8             	mov    r8,rdi
   29a74:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29a7b:	48 89 c1             	mov    rcx,rax
   29a7e:	e8 9d 39 00 00       	call   2d420 <JS_GetPropertyValue>
   29a83:	48 89 c1             	mov    rcx,rax
   29a86:	48 89 d0             	mov    rax,rdx
   29a89:	48 89 ca             	mov    rdx,rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19462 (discriminator 3)
   29a8c:	83 f8 06             	cmp    eax,0x6
   29a8f:	0f 85 20 e4 ff ff    	jne    27eb5 <JS_CallInternal+0x53f5>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19462 (discriminator 14)
   29a95:	45 31 c0             	xor    r8d,r8d
   29a98:	48 c7 43 f8 03 00 00 	mov    QWORD PTR [rbx-0x8],0x3
   29a9f:	00 
   29aa0:	4c 89 43 f0          	mov    QWORD PTR [rbx-0x10],r8
   29aa4:	e9 b7 97 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18397
   29aa9:	31 c9                	xor    ecx,ecx
   29aab:	41 b8 03 00 00 00    	mov    r8d,0x3
   29ab1:	e9 0d a9 ff ff       	jmp    243c3 <JS_CallInternal+0x1903>
find_own_property1():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6139
   29ab6:	8b 00                	mov    eax,DWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6134
   29ab8:	25 ff ff ff 03       	and    eax,0x3ffffff
   29abd:	0f 85 dc 97 ff ff    	jne    2329f <JS_CallInternal+0x7df>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20690
   29ac3:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20691
   29aca:	48 83 ec 08          	sub    rsp,0x8
   29ace:	31 c9                	xor    ecx,ecx
   29ad0:	45 31 c9             	xor    r9d,r9d
   29ad3:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29ada:	45 31 c0             	xor    r8d,r8d
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20690
   29add:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20691
   29ae1:	48 8b 85 c0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x140]
   29ae8:	48 8b b0 d8 04 00 00 	mov    rsi,QWORD PTR [rax+0x4d8]
   29aef:	48 8b 90 e0 04 00 00 	mov    rdx,QWORD PTR [rax+0x4e0]
   29af6:	6a 00                	push   0x0
   29af8:	e8 63 64 00 00       	call   2ff60 <build_backtrace>
   29afd:	59                   	pop    rcx
   29afe:	5e                   	pop    rsi
   29aff:	e9 ac 97 ff ff       	jmp    232b0 <JS_CallInternal+0x7f0>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6162
   29b04:	41 8b 30             	mov    esi,DWORD PTR [r8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6155
   29b07:	81 e6 ff ff ff 03    	and    esi,0x3ffffff
   29b0d:	0f 85 73 dc ff ff    	jne    27786 <JS_CallInternal+0x4cc6>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19230
   29b13:	48 83 ec 08          	sub    rsp,0x8
   29b17:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   29b1b:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   29b1f:	48 89 c6             	mov    rsi,rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19229
   29b22:	48 8b bd c8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x138]
   29b29:	4c 89 95 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r10
   29b30:	4c 89 57 30          	mov    QWORD PTR [rdi+0x30],r10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19230
   29b34:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29b3b:	68 00 80 00 00       	push   0x8000
   29b40:	52                   	push   rdx
   29b41:	50                   	push   rax
   29b42:	e8 99 3f 00 00       	call   2dae0 <JS_SetPropertyInternal>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   29b47:	48 83 c4 20          	add    rsp,0x20
   29b4b:	41 83 fe f6          	cmp    r14d,0xfffffff6
   29b4f:	4c 8b 95 50 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1b0]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19230
   29b56:	89 c1                	mov    ecx,eax
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   29b58:	76 13                	jbe    29b6d <JS_CallInternal+0x70ad>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   29b5a:	41 8b 45 fc          	mov    eax,DWORD PTR [r13-0x4]
   29b5e:	83 e8 01             	sub    eax,0x1
   29b61:	41 89 45 fc          	mov    DWORD PTR [r13-0x4],eax
   29b65:	85 c0                	test   eax,eax
   29b67:	0f 8e 75 25 00 00    	jle    2c0e2 <JS_CallInternal+0x9622>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19233
   29b6d:	48 83 eb 20          	sub    rbx,0x20
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19234 (discriminator 1)
   29b71:	85 c9                	test   ecx,ecx
   29b73:	0f 89 83 dc ff ff    	jns    277fc <JS_CallInternal+0x4d3c>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19210
   29b79:	4d 89 d4             	mov    r12,r10
   29b7c:	e9 df 96 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18891
   29b81:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29b88:	48 89 ce             	mov    rsi,rcx
   29b8b:	e8 40 4f ff ff       	call   1ead0 <JS_ToBoolFree>
   29b90:	e9 18 db ff ff       	jmp    276ad <JS_CallInternal+0x4bed>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20129
   29b95:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20130
   29b9c:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29ba3:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20129
   29ba6:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20130
   29baa:	e8 81 bb 02 00       	call   55730 <js_not_slow>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20130 (discriminator 1)
   29baf:	85 c0                	test   eax,eax
   29bb1:	0f 84 d2 d4 ff ff    	je     27089 <JS_CallInternal+0x45c9>
   29bb7:	e9 a4 96 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
   29bbc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18401
   29bc0:	49 8b 75 f0          	mov    rsi,QWORD PTR [r13-0x10]
   29bc4:	49 8b 55 f8          	mov    rdx,QWORD PTR [r13-0x8]
   29bc8:	41 b8 03 00 00 00    	mov    r8d,0x3
   29bce:	31 c9                	xor    ecx,ecx
   29bd0:	44 8b 8d 50 fe ff ff 	mov    r9d,DWORD PTR [rbp-0x1b0]
   29bd7:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18402
   29bde:	48 c7 85 90 fd ff ff 	mov    QWORD PTR [rbp-0x270],0x0
   29be5:	00 00 00 00 
   29be9:	48 c7 85 98 fd ff ff 	mov    QWORD PTR [rbp-0x268],0x3
   29bf0:	03 00 00 00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18401
   29bf4:	6a 00                	push   0x0
   29bf6:	41 55                	push   r13
   29bf8:	ff b5 98 fd ff ff    	push   QWORD PTR [rbp-0x268]
   29bfe:	ff b5 90 fd ff ff    	push   QWORD PTR [rbp-0x270]
   29c04:	e8 b7 8e ff ff       	call   22ac0 <JS_CallInternal>
   29c09:	48 83 c4 20          	add    rsp,0x20
   29c0d:	49 89 c1             	mov    r9,rax
   29c10:	49 89 d0             	mov    r8,rdx
   29c13:	e9 db a7 ff ff       	jmp    243f3 <JS_CallInternal+0x1933>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18430
   29c18:	31 c9                	xor    ecx,ecx
   29c1a:	41 b8 03 00 00 00    	mov    r8d,0x3
   29c20:	e9 54 a6 ff ff       	jmp    24279 <JS_CallInternal+0x17b9>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18912
   29c25:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29c2c:	48 89 ce             	mov    rsi,rcx
   29c2f:	e8 9c 4e ff ff       	call   1ead0 <JS_ToBoolFree>
   29c34:	e9 8b e5 ff ff       	jmp    281c4 <JS_CallInternal+0x5704>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18932
   29c39:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29c40:	48 89 ce             	mov    rsi,rcx
   29c43:	e8 88 4e ff ff       	call   1ead0 <JS_ToBoolFree>
   29c48:	e9 10 e5 ff ff       	jmp    2815d <JS_CallInternal+0x569d>
JS_Call():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20743
   29c4d:	48 8b b5 28 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1d8]
   29c54:	45 89 d1             	mov    r9d,r10d
   29c57:	4c 89 ea             	mov    rdx,r13
   29c5a:	31 c9                	xor    ecx,ecx
   29c5c:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29c63:	41 b8 03 00 00 00    	mov    r8d,0x3
   29c69:	48 c7 85 a0 fd ff ff 	mov    QWORD PTR [rbp-0x260],0x0
   29c70:	00 00 00 00 
   29c74:	48 c7 85 a8 fd ff ff 	mov    QWORD PTR [rbp-0x258],0x3
   29c7b:	03 00 00 00 
   29c7f:	6a 02                	push   0x2
   29c81:	41 56                	push   r14
   29c83:	ff b5 a8 fd ff ff    	push   QWORD PTR [rbp-0x258]
   29c89:	ff b5 a0 fd ff ff    	push   QWORD PTR [rbp-0x260]
   29c8f:	44 89 95 38 fe ff ff 	mov    DWORD PTR [rbp-0x1c8],r10d
   29c96:	e8 25 8e ff ff       	call   22ac0 <JS_CallInternal>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18434
   29c9b:	44 8b 95 38 fe ff ff 	mov    r10d,DWORD PTR [rbp-0x1c8]
   29ca2:	48 83 c4 20          	add    rsp,0x20
   29ca6:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
   29cad:	49 89 d5             	mov    r13,rdx
   29cb0:	e9 06 a6 ff ff       	jmp    242bb <JS_CallInternal+0x17fb>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18870
   29cb5:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29cbc:	48 89 ce             	mov    rsi,rcx
   29cbf:	e8 0c 4e ff ff       	call   1ead0 <JS_ToBoolFree>
   29cc4:	e9 b6 eb ff ff       	jmp    2887f <JS_CallInternal+0x5dbf>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19122
   29cc9:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29cd0:	48 89 d6             	mov    rsi,rdx
   29cd3:	48 89 c2             	mov    rdx,rax
   29cd6:	e8 f5 4d ff ff       	call   1ead0 <JS_ToBoolFree>
   29cdb:	e9 df df ff ff       	jmp    27cbf <JS_CallInternal+0x51ff>
rdi_probe():
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_runtime.inc:9
   29ce0:	4d 39 2e             	cmp    QWORD PTR [r14],r13
   29ce3:	0f 85 68 a3 ff ff    	jne    24051 <JS_CallInternal+0x1591>
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_runtime.inc:10
   29ce9:	41 8b 46 08          	mov    eax,DWORD PTR [r14+0x8]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:67 (discriminator 1)
   29ced:	83 f8 ff             	cmp    eax,0xffffffff
   29cf0:	0f 84 5b a3 ff ff    	je     24051 <JS_CallInternal+0x1591>
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:67 (discriminator 5)
   29cf6:	48 c1 e0 04          	shl    rax,0x4
   29cfa:	48 03 46 20          	add    rax,QWORD PTR [rsi+0x20]
   29cfe:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   29d02:	4c 8b 28             	mov    r13,QWORD PTR [rax]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   29d05:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   29d09:	76 05                	jbe    29d10 <JS_CallInternal+0x7250>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   29d0b:	41 83 45 fc 01       	add    DWORD PTR [r13-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18045
   29d10:	4c 8d 5b f0          	lea    r11,[rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:67
   29d14:	e9 b2 a3 ff ff       	jmp    240cb <JS_CallInternal+0x160b>
   29d19:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   29d20:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
__JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3436
   29d24:	89 c8                	mov    eax,ecx
   29d26:	48 8b 97 48 04 00 00 	mov    rdx,QWORD PTR [rdi+0x448]
   29d2d:	48 8b 34 c2          	mov    rsi,QWORD PTR [rdx+rax*8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3437 (discriminator 1)
   29d31:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   29d34:	83 e8 01             	sub    eax,0x1
   29d37:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29d3a:	85 c0                	test   eax,eax
   29d3c:	0f 8f 1e d1 ff ff    	jg     26e60 <JS_CallInternal+0x43a0>
   29d42:	44 89 85 38 fe ff ff 	mov    DWORD PTR [rbp-0x1c8],r8d
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3439
   29d49:	e8 b2 b6 fe ff       	call   15400 <JS_FreeAtomStruct>
   29d4e:	44 8b 85 38 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x1c8]
   29d55:	e9 06 d1 ff ff       	jmp    26e60 <JS_CallInternal+0x43a0>
   29d5a:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   29d61:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3436
   29d65:	48 8b 87 48 04 00 00 	mov    rax,QWORD PTR [rdi+0x448]
   29d6c:	4a 8b 34 e8          	mov    rsi,QWORD PTR [rax+r13*8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3437 (discriminator 1)
   29d70:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   29d73:	83 e8 01             	sub    eax,0x1
   29d76:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29d79:	85 c0                	test   eax,eax
   29d7b:	0f 8f 08 ea ff ff    	jg     28789 <JS_CallInternal+0x5cc9>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3439
   29d81:	e8 7a b6 fe ff       	call   15400 <JS_FreeAtomStruct>
   29d86:	4c 8b 95 40 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c0]
   29d8d:	e9 f7 e9 ff ff       	jmp    28789 <JS_CallInternal+0x5cc9>
   29d92:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   29d99:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3436
   29d9d:	48 8b 97 48 04 00 00 	mov    rdx,QWORD PTR [rdi+0x448]
   29da4:	4a 8b 34 ea          	mov    rsi,QWORD PTR [rdx+r13*8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3437 (discriminator 1)
   29da8:	8b 4e fc             	mov    ecx,DWORD PTR [rsi-0x4]
   29dab:	8d 51 ff             	lea    edx,[rcx-0x1]
   29dae:	89 56 fc             	mov    DWORD PTR [rsi-0x4],edx
   29db1:	85 d2                	test   edx,edx
   29db3:	0f 8f a5 e1 ff ff    	jg     27f5e <JS_CallInternal+0x549e>
   29db9:	48 89 85 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3439
   29dc0:	e8 3b b6 fe ff       	call   15400 <JS_FreeAtomStruct>
   29dc5:	48 8b 85 28 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1d8]
   29dcc:	4c 8b 95 38 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c8]
   29dd3:	e9 86 e1 ff ff       	jmp    27f5e <JS_CallInternal+0x549e>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19482
   29dd8:	41 83 fd fa          	cmp    r13d,0xfffffffa
   29ddc:	0f 8d 81 22 00 00    	jge    2c063 <JS_CallInternal+0x95a3>
   29de2:	41 83 fd f8          	cmp    r13d,0xfffffff8
   29de6:	7d 65                	jge    29e4d <JS_CallInternal+0x738d>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19490 (discriminator 2)
   29de8:	83 e8 02             	sub    eax,0x2
   29deb:	83 f8 01             	cmp    eax,0x1
   29dee:	0f 86 ed 23 00 00    	jbe    2c1e1 <JS_CallInternal+0x9721>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19494
   29df4:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
JS_ToPropertyKey():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:13688
   29dfb:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   29dff:	b9 01 00 00 00       	mov    ecx,0x1
   29e04:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   29e08:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19494
   29e0f:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
JS_ToPropertyKey():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:13688
   29e13:	e8 68 60 01 00       	call   3fe80 <JS_ToStringInternal>
   29e18:	49 89 d0             	mov    r8,rdx
   29e1b:	49 89 d5             	mov    r13,rdx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19496 (discriminator 1)
   29e1e:	83 fa 06             	cmp    edx,0x6
   29e21:	0f 84 39 94 ff ff    	je     23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19498
   29e27:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   29e2b:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   29e2f:	83 fa f6             	cmp    edx,0xfffffff6
   29e32:	76 11                	jbe    29e45 <JS_CallInternal+0x7385>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   29e34:	8b 4e fc             	mov    ecx,DWORD PTR [rsi-0x4]
   29e37:	83 e9 01             	sub    ecx,0x1
   29e3a:	89 4e fc             	mov    DWORD PTR [rsi-0x4],ecx
   29e3d:	85 c9                	test   ecx,ecx
   29e3f:	0f 8e 3a 26 00 00    	jle    2c47f <JS_CallInternal+0x99bf>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19499
   29e45:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   29e49:	4c 89 43 f8          	mov    QWORD PTR [rbx-0x8],r8
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19502
   29e4d:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   29e54:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   29e58:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   29e5c:	41 83 fd f6          	cmp    r13d,0xfffffff6
   29e60:	76 04                	jbe    29e66 <JS_CallInternal+0x73a6>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   29e62:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19503 (discriminator 1)
   29e66:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   29e6a:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   29e6e:	4d 89 e8             	mov    r8,r13
   29e71:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29e78:	e8 a3 35 00 00       	call   2d420 <JS_GetPropertyValue>
   29e7d:	48 89 c1             	mov    rcx,rax
   29e80:	48 89 d0             	mov    rax,rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19504 (discriminator 2)
   29e83:	83 fa 06             	cmp    edx,0x6
   29e86:	0f 85 b5 df ff ff    	jne    27e41 <JS_CallInternal+0x5381>
   29e8c:	e9 cf 93 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6162
   29e91:	8b 08                	mov    ecx,DWORD PTR [rax]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6155
   29e93:	81 e1 ff ff ff 03    	and    ecx,0x3ffffff
   29e99:	0f 85 12 b1 ff ff    	jne    24fb1 <JS_CallInternal+0x24f1>
JS_DeleteGlobalVar():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:10928
   29e9f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29ea6:	44 89 f1             	mov    ecx,r14d
   29ea9:	48 8b b7 80 01 00 00 	mov    rsi,QWORD PTR [rdi+0x180]
   29eb0:	48 8b 97 88 01 00 00 	mov    rdx,QWORD PTR [rdi+0x188]
   29eb7:	e8 d4 42 04 00       	call   6e190 <JS_HasProperty>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:10929
   29ebc:	85 c0                	test   eax,eax
   29ebe:	0f 88 43 2e 00 00    	js     2cd07 <JS_CallInternal+0xa247>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:10931
   29ec4:	b8 01 00 00 00       	mov    eax,0x1
   29ec9:	0f 84 f5 b0 ff ff    	je     24fc4 <JS_CallInternal+0x2504>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:10932
   29ecf:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29ed6:	45 31 c0             	xor    r8d,r8d
   29ed9:	44 89 f1             	mov    ecx,r14d
   29edc:	48 8b b7 80 01 00 00 	mov    rsi,QWORD PTR [rdi+0x180]
   29ee3:	48 8b 97 88 01 00 00 	mov    rdx,QWORD PTR [rdi+0x188]
   29eea:	e8 01 12 02 00       	call   4b0f0 <JS_DeleteProperty>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20468 (discriminator 1)
   29eef:	85 c0                	test   eax,eax
   29ef1:	0f 88 4d 24 00 00    	js     2c344 <JS_CallInternal+0x9884>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   29ef7:	0f 95 c0             	setne  al
   29efa:	0f b6 c0             	movzx  eax,al
   29efd:	e9 c2 b0 ff ff       	jmp    24fc4 <JS_CallInternal+0x2504>
rdi_probe():
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_runtime.inc:9
   29f02:	4d 39 2e             	cmp    QWORD PTR [r14],r13
   29f05:	0f 85 67 a0 ff ff    	jne    23f72 <JS_CallInternal+0x14b2>
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_runtime.inc:10
   29f0b:	41 8b 46 08          	mov    eax,DWORD PTR [r14+0x8]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:70 (discriminator 1)
   29f0f:	83 f8 ff             	cmp    eax,0xffffffff
   29f12:	0f 84 5a a0 ff ff    	je     23f72 <JS_CallInternal+0x14b2>
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:70 (discriminator 5)
   29f18:	89 c2                	mov    edx,eax
   29f1a:	48 c1 e2 04          	shl    rdx,0x4
   29f1e:	48 03 56 20          	add    rdx,QWORD PTR [rsi+0x20]
   29f22:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   29f25:	48 8b 52 08          	mov    rdx,QWORD PTR [rdx+0x8]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   29f29:	83 fa f6             	cmp    edx,0xfffffff6
   29f2c:	0f 86 b2 a0 ff ff    	jbe    23fe4 <JS_CallInternal+0x1524>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   29f32:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:70
   29f36:	e9 a9 a0 ff ff       	jmp    23fe4 <JS_CallInternal+0x1524>
   29f3b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   29f40:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   29f47:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
__JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3436
   29f4b:	89 c8                	mov    eax,ecx
   29f4d:	48 8b 97 48 04 00 00 	mov    rdx,QWORD PTR [rdi+0x448]
   29f54:	48 8b 34 c2          	mov    rsi,QWORD PTR [rdx+rax*8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3437 (discriminator 1)
   29f58:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   29f5b:	83 e8 01             	sub    eax,0x1
   29f5e:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29f61:	85 c0                	test   eax,eax
   29f63:	0f 8f 01 b1 ff ff    	jg     2506a <JS_CallInternal+0x25aa>
   29f69:	44 89 85 38 fe ff ff 	mov    DWORD PTR [rbp-0x1c8],r8d
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3439
   29f70:	e8 8b b4 fe ff       	call   15400 <JS_FreeAtomStruct>
   29f75:	44 8b 85 38 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x1c8]
   29f7c:	e9 e9 b0 ff ff       	jmp    2506a <JS_CallInternal+0x25aa>
js_for_of_next():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16715
   29f81:	c7 85 f0 fe ff ff ff 	mov    DWORD PTR [rbp-0x110],0xffffffff
   29f88:	ff ff ff 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16716
   29f8b:	b9 ff ff ff ff       	mov    ecx,0xffffffff
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16719
   29f90:	4d 8b 45 08          	mov    r8,QWORD PTR [r13+0x8]
   29f94:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   29f98:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   29f9c:	76 11                	jbe    29faf <JS_CallInternal+0x74ef>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   29f9e:	8b 7e fc             	mov    edi,DWORD PTR [rsi-0x4]
   29fa1:	8d 57 ff             	lea    edx,[rdi-0x1]
   29fa4:	89 56 fc             	mov    DWORD PTR [rsi-0x4],edx
   29fa7:	85 d2                	test   edx,edx
   29fa9:	0f 8e c2 20 00 00    	jle    2c071 <JS_CallInternal+0x95b1>
js_for_of_next():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16720
   29faf:	49 c7 45 00 00 00 00 	mov    QWORD PTR [r13+0x0],0x0
   29fb6:	00 
   29fb7:	49 c7 45 08 03 00 00 	mov    QWORD PTR [r13+0x8],0x3
   29fbe:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16721
   29fbf:	85 c9                	test   ecx,ecx
   29fc1:	0f 88 d0 2a 00 00    	js     2ca97 <JS_CallInternal+0x9fd7>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   29fc7:	41 83 f9 f6          	cmp    r9d,0xfffffff6
   29fcb:	76 11                	jbe    29fde <JS_CallInternal+0x751e>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   29fcd:	8b 48 fc             	mov    ecx,DWORD PTR [rax-0x4]
   29fd0:	8d 51 ff             	lea    edx,[rcx-0x1]
   29fd3:	89 50 fc             	mov    DWORD PTR [rax-0x4],edx
   29fd6:	85 d2                	test   edx,edx
   29fd8:	0f 8e 0f 1f 00 00    	jle    2beed <JS_CallInternal+0x942d>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   29fde:	44 8b 85 f0 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x110]
   29fe5:	31 d2                	xor    edx,edx
js_for_of_next():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16709
   29fe7:	be 03 00 00 00       	mov    esi,0x3
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   29fec:	45 85 c0             	test   r8d,r8d
   29fef:	0f 95 c2             	setne  dl
js_for_of_next():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16709
   29ff2:	31 ff                	xor    edi,edi
   29ff4:	e9 97 e4 ff ff       	jmp    28490 <JS_CallInternal+0x59d0>
   29ff9:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2a000:	48 8b 7f 10          	mov    rdi,QWORD PTR [rdi+0x10]
__JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3436
   2a004:	48 8b 97 48 04 00 00 	mov    rdx,QWORD PTR [rdi+0x448]
   2a00b:	4a 8b 34 ea          	mov    rsi,QWORD PTR [rdx+r13*8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3437 (discriminator 1)
   2a00f:	8b 56 fc             	mov    edx,DWORD PTR [rsi-0x4]
   2a012:	83 ea 01             	sub    edx,0x1
   2a015:	89 56 fc             	mov    DWORD PTR [rsi-0x4],edx
   2a018:	85 d2                	test   edx,edx
   2a01a:	0f 8f 5c e0 ff ff    	jg     2807c <JS_CallInternal+0x55bc>
   2a020:	48 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rcx
   2a027:	4c 89 b5 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r14
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3439
   2a02e:	e8 cd b3 fe ff       	call   15400 <JS_FreeAtomStruct>
   2a033:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   2a03a:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   2a041:	e9 36 e0 ff ff       	jmp    2807c <JS_CallInternal+0x55bc>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20725
   2a046:	48 89 fe             	mov    rsi,rdi
   2a049:	48 8b 95 c8 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x138]
   2a050:	48 8b bd c0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x140]
   2a057:	48 89 85 d0 fe ff ff 	mov    QWORD PTR [rbp-0x130],rax
   2a05e:	48 89 8d e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rcx
   2a065:	e8 66 63 ff ff       	call   203d0 <close_var_refs>
   2a06a:	48 8b 85 d0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x130]
   2a071:	48 8b 8d e0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x120]
   2a078:	e9 48 91 ff ff       	jmp    231c5 <JS_CallInternal+0x705>
   2a07d:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a084:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
__JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3436
   2a088:	48 8b 87 48 04 00 00 	mov    rax,QWORD PTR [rdi+0x448]
   2a08f:	4a 8b 34 e8          	mov    rsi,QWORD PTR [rax+r13*8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3437 (discriminator 1)
   2a093:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2a096:	83 e8 01             	sub    eax,0x1
   2a099:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2a09c:	85 c0                	test   eax,eax
   2a09e:	0f 8f 50 d5 ff ff    	jg     275f4 <JS_CallInternal+0x4b34>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3439
   2a0a4:	e8 57 b3 fe ff       	call   15400 <JS_FreeAtomStruct>
   2a0a9:	e9 46 d5 ff ff       	jmp    275f4 <JS_CallInternal+0x4b34>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20363 (discriminator 30)
   2a0ae:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2a0b5:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2a0bc:	31 d2                	xor    edx,edx
   2a0be:	48 89 de             	mov    rsi,rbx
   2a0c1:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   2a0c5:	e8 26 0e 03 00       	call   5aef0 <js_eq_slow>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20363 (discriminator 1)
   2a0ca:	85 c0                	test   eax,eax
   2a0cc:	0f 84 92 c8 ff ff    	je     26964 <JS_CallInternal+0x3ea4>
   2a0d2:	e9 89 91 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
   2a0d7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   2a0de:	00 00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20364 (discriminator 30)
   2a0e0:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2a0e7:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2a0ee:	ba 01 00 00 00       	mov    edx,0x1
   2a0f3:	48 89 de             	mov    rsi,rbx
   2a0f6:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   2a0fa:	e8 f1 0d 03 00       	call   5aef0 <js_eq_slow>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20364 (discriminator 1)
   2a0ff:	85 c0                	test   eax,eax
   2a101:	0f 84 03 c8 ff ff    	je     2690a <JS_CallInternal+0x3e4a>
   2a107:	e9 54 91 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
   2a10c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
JS_NewRegexp():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:47688
   2a110:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2a117:	48 8d 35 08 34 0a 00 	lea    rsi,[rip+0xa3408]        # cd526 <_IO_stdin_used+0x526>
   2a11e:	31 c0                	xor    eax,eax
   2a120:	e8 fb 6a 00 00       	call   30c20 <JS_ThrowTypeError>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   2a125:	83 fb f6             	cmp    ebx,0xfffffff6
   2a128:	76 1e                	jbe    2a148 <JS_CallInternal+0x7688>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   2a12a:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   2a131:	8b 41 fc             	mov    eax,DWORD PTR [rcx-0x4]
   2a134:	89 85 28 fe ff ff    	mov    DWORD PTR [rbp-0x1d8],eax
   2a13a:	83 e8 01             	sub    eax,0x1
   2a13d:	89 41 fc             	mov    DWORD PTR [rcx-0x4],eax
   2a140:	85 c0                	test   eax,eax
   2a142:	0f 8e 91 24 00 00    	jle    2c5d9 <JS_CallInternal+0x9b19>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   2a148:	83 bd 38 fe ff ff f6 	cmp    DWORD PTR [rbp-0x1c8],0xfffffff6
   2a14f:	76 1e                	jbe    2a16f <JS_CallInternal+0x76af>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   2a151:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   2a158:	8b 41 fc             	mov    eax,DWORD PTR [rcx-0x4]
   2a15b:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   2a161:	83 e8 01             	sub    eax,0x1
   2a164:	89 41 fc             	mov    DWORD PTR [rcx-0x4],eax
   2a167:	85 c0                	test   eax,eax
   2a169:	0f 8e d6 24 00 00    	jle    2c645 <JS_CallInternal+0x9b85>
JS_NewRegexp():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:47703
   2a16f:	ba 06 00 00 00       	mov    edx,0x6
   2a174:	31 c0                	xor    eax,eax
   2a176:	e9 1d a0 ff ff       	jmp    24198 <JS_CallInternal+0x16d8>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19990
   2a17b:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19991
   2a182:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2a189:	44 89 ea             	mov    edx,r13d
   2a18c:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19990
   2a18f:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19991
   2a193:	e8 88 b0 02 00       	call   55220 <js_unary_arith_slow>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19991 (discriminator 1)
   2a198:	85 c0                	test   eax,eax
   2a19a:	0f 84 e5 d1 ff ff    	je     27385 <JS_CallInternal+0x48c5>
   2a1a0:	e9 bb 90 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
   2a1a5:	0f 1f 00             	nop    DWORD PTR [rax]
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   2a1a8:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a1af:	48 89 ca             	mov    rdx,rcx
   2a1b2:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a1b6:	e8 e5 26 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a1bb:	e9 82 95 ff ff       	jmp    23742 <JS_CallInternal+0xc82>
   2a1c0:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a1c7:	89 8d 38 fe ff ff    	mov    DWORD PTR [rbp-0x1c8],ecx
   2a1cd:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a1d1:	e8 ca 26 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a1d6:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
   2a1dc:	e9 d8 97 ff ff       	jmp    239b9 <JS_CallInternal+0xef9>
   2a1e1:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a1e8:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
__JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3436
   2a1ec:	8b 85 50 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1b0]
   2a1f2:	48 8b 97 48 04 00 00 	mov    rdx,QWORD PTR [rdi+0x448]
   2a1f9:	48 8b 34 c2          	mov    rsi,QWORD PTR [rdx+rax*8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3437 (discriminator 1)
   2a1fd:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2a200:	83 e8 01             	sub    eax,0x1
   2a203:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2a206:	85 c0                	test   eax,eax
   2a208:	0f 8f a0 ef ff ff    	jg     291ae <JS_CallInternal+0x66ee>
   2a20e:	89 8d 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],ecx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3439
   2a214:	e8 e7 b1 fe ff       	call   15400 <JS_FreeAtomStruct>
   2a219:	8b 8d 50 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1b0]
   2a21f:	e9 8a ef ff ff       	jmp    291ae <JS_CallInternal+0x66ee>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   2a224:	41 83 fe f6          	cmp    r14d,0xfffffff6
   2a228:	0f 87 8d 0c 00 00    	ja     2aebb <JS_CallInternal+0x83fb>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20421 (discriminator 16)
   2a22e:	b8 01 00 00 00       	mov    eax,0x1
   2a233:	e9 07 d7 ff ff       	jmp    2793f <JS_CallInternal+0x4e7f>
   2a238:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   2a23f:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17871
   2a240:	45 31 ed             	xor    r13d,r13d
   2a243:	e9 0f ec ff ff       	jmp    28e57 <JS_CallInternal+0x6397>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   2a248:	41 83 fe f6          	cmp    r14d,0xfffffff6
   2a24c:	76 0f                	jbe    2a25d <JS_CallInternal+0x779d>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   2a24e:	41 8b 45 fc          	mov    eax,DWORD PTR [r13-0x4]
   2a252:	83 e8 01             	sub    eax,0x1
   2a255:	41 89 45 fc          	mov    DWORD PTR [r13-0x4],eax
   2a259:	85 c0                	test   eax,eax
   2a25b:	7e 07                	jle    2a264 <JS_CallInternal+0x77a4>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20420 (discriminator 16)
   2a25d:	31 c0                	xor    eax,eax
   2a25f:	e9 2f d7 ff ff       	jmp    27993 <JS_CallInternal+0x4ed3>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   2a264:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a26b:	4c 89 ee             	mov    rsi,r13
   2a26e:	4c 89 f2             	mov    rdx,r14
   2a271:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a275:	e8 26 26 ff ff       	call   1c8a0 <__JS_FreeValueRT>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20420 (discriminator 16)
   2a27a:	31 c0                	xor    eax,eax
   2a27c:	e9 12 d7 ff ff       	jmp    27993 <JS_CallInternal+0x4ed3>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19387
   2a281:	b9 ff ff ff ff       	mov    ecx,0xffffffff
   2a286:	e9 0f 97 ff ff       	jmp    2399a <JS_CallInternal+0xeda>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19957
   2a28b:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19958
   2a292:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2a299:	44 89 ea             	mov    edx,r13d
   2a29c:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19957
   2a29f:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19958
   2a2a3:	e8 78 af 02 00       	call   55220 <js_unary_arith_slow>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19958 (discriminator 1)
   2a2a8:	85 c0                	test   eax,eax
   2a2aa:	0f 84 bc cf ff ff    	je     2726c <JS_CallInternal+0x47ac>
   2a2b0:	e9 ab 8f ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
   2a2b5:	0f 1f 00             	nop    DWORD PTR [rax]
   2a2b8:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
__JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3436
   2a2bf:	89 c0                	mov    eax,eax
   2a2c1:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
   2a2c5:	48 8b 8f 48 04 00 00 	mov    rcx,QWORD PTR [rdi+0x448]
   2a2cc:	48 8b 34 c1          	mov    rsi,QWORD PTR [rcx+rax*8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3437 (discriminator 1)
   2a2d0:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2a2d3:	83 e8 01             	sub    eax,0x1
   2a2d6:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2a2d9:	85 c0                	test   eax,eax
   2a2db:	0f 8f 8e ca ff ff    	jg     26d6f <JS_CallInternal+0x42af>
   2a2e1:	4c 89 8d 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r9
   2a2e8:	48 89 95 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3439
   2a2ef:	e8 0c b1 fe ff       	call   15400 <JS_FreeAtomStruct>
   2a2f4:	4c 8b 8d 38 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c8]
   2a2fb:	48 8b 95 40 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c0]
   2a302:	e9 68 ca ff ff       	jmp    26d6f <JS_CallInternal+0x42af>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18245
   2a307:	4c 8b a5 28 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1d8]
   2a30e:	e9 4d 8f ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18491
   2a313:	48 8b bd d8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x128]
   2a31a:	48 8b 47 30          	mov    rax,QWORD PTR [rdi+0x30]
   2a31e:	48 01 c8             	add    rax,rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18497
   2a321:	8b 48 04             	mov    ecx,DWORD PTR [rax+0x4]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18492
   2a324:	f6 00 08             	test   BYTE PTR [rax],0x8
   2a327:	0f 85 83 29 00 00    	jne    2ccb0 <JS_CallInternal+0xa1f0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18497
   2a32d:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18496
   2a334:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18497
   2a33b:	48 83 ec 08          	sub    rsp,0x8
   2a33f:	41 83 ed 37          	sub    r13d,0x37
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18496
   2a343:	4c 89 70 30          	mov    QWORD PTR [rax+0x30],r14
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18497
   2a347:	4c 8b 87 80 01 00 00 	mov    r8,QWORD PTR [rdi+0x180]
   2a34e:	4c 8b 8f 88 01 00 00 	mov    r9,QWORD PTR [rdi+0x188]
   2a355:	48 8b b7 80 01 00 00 	mov    rsi,QWORD PTR [rdi+0x180]
   2a35c:	48 8b 97 88 01 00 00 	mov    rdx,QWORD PTR [rdi+0x188]
   2a363:	41 55                	push   r13
   2a365:	e8 46 2a 00 00       	call   2cdb0 <JS_GetPropertyInternal>
   2a36a:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18501 (discriminator 1)
   2a36e:	83 7b 08 06          	cmp    DWORD PTR [rbx+0x8],0x6
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18497
   2a372:	48 89 03             	mov    QWORD PTR [rbx],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18501 (discriminator 1)
   2a375:	41 5b                	pop    r11
   2a377:	41 5d                	pop    r13
   2a379:	0f 85 ff 97 ff ff    	jne    23b7e <JS_CallInternal+0x10be>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18488
   2a37f:	4d 89 f4             	mov    r12,r14
   2a382:	e9 d9 8e ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18972
   2a387:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2a38e:	48 8d 35 a1 31 0a 00 	lea    rsi,[rip+0xa31a1]        # cd536 <_IO_stdin_used+0x536>
   2a395:	31 c0                	xor    eax,eax
   2a397:	e8 64 8c 00 00       	call   33000 <JS_ThrowInternalError>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18973
   2a39c:	e9 bf 8e ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19099
   2a3a1:	48 83 ec 08          	sub    rsp,0x8
   2a3a5:	48 8d 4b f0          	lea    rcx,[rbx-0x10]
   2a3a9:	41 b9 01 00 00 00    	mov    r9d,0x1
   2a3af:	51                   	push   rcx
   2a3b0:	e9 0a f4 ff ff       	jmp    297bf <JS_CallInternal+0x6cff>
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:70 (discriminator 25)
   2a3b5:	ba 03 00 00 00       	mov    edx,0x3
   2a3ba:	31 c0                	xor    eax,eax
   2a3bc:	e9 23 9c ff ff       	jmp    23fe4 <JS_CallInternal+0x1524>
async_func_free():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:21032 (discriminator 1)
   2a3c1:	48 89 c6             	mov    rsi,rax
   2a3c4:	8b 40 ac             	mov    eax,DWORD PTR [rax-0x54]
   2a3c7:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   2a3cd:	83 e8 01             	sub    eax,0x1
   2a3d0:	89 46 ac             	mov    DWORD PTR [rsi-0x54],eax
   2a3d3:	0f 85 33 d8 ff ff    	jne    27c0c <JS_CallInternal+0x514c>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:21033
   2a3d9:	80 bf a0 04 00 00 02 	cmp    BYTE PTR [rdi+0x4a0],0x2
   2a3e0:	0f 84 26 d8 ff ff    	je     27c0c <JS_CallInternal+0x514c>
close_var_ref():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17545
   2a3e6:	48 83 ee 50          	sub    rsi,0x50
async_func_free():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17545
   2a3ea:	e8 21 5f ff ff       	call   20310 <async_func_free.part.0>
close_lexical_var():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17576
   2a3ef:	48 8b b5 c8 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x138]
   2a3f6:	48 8b 4e 28          	mov    rcx,QWORD PTR [rsi+0x28]
   2a3fa:	4c 01 e9             	add    rcx,r13
   2a3fd:	e9 0a d8 ff ff       	jmp    27c0c <JS_CallInternal+0x514c>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18045
   2a402:	4c 8d 5b f0          	lea    r11,[rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:67 (discriminator 25)
   2a406:	41 b8 03 00 00 00    	mov    r8d,0x3
   2a40c:	45 31 ed             	xor    r13d,r13d
   2a40f:	e9 b7 9c ff ff       	jmp    240cb <JS_CallInternal+0x160b>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18380
   2a414:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18363
   2a41b:	0f b6 d0             	movzx  edx,al
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18380
   2a41e:	31 c0                	xor    eax,eax
   2a420:	48 8d 35 e5 30 0a 00 	lea    rsi,[rip+0xa30e5]        # cd50c <_IO_stdin_used+0x50c>
   2a427:	e8 d4 8b 00 00       	call   33000 <JS_ThrowInternalError>
   2a42c:	e9 2f 8e ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19085
   2a431:	4d 89 ec             	mov    r12,r13
   2a434:	e9 27 8e ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   2a439:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a440:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a444:	e8 57 24 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a449:	e9 15 c7 ff ff       	jmp    26b63 <JS_CallInternal+0x40a3>
   2a44e:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a455:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a459:	e8 42 24 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a45e:	e9 9b ec ff ff       	jmp    290fe <JS_CallInternal+0x663e>
   2a463:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a46a:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a46e:	e8 2d 24 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a473:	e9 08 c7 ff ff       	jmp    26b80 <JS_CallInternal+0x40c0>
   2a478:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a47f:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   2a486:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a48a:	e8 11 24 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a48f:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   2a496:	e9 88 cf ff ff       	jmp    27423 <JS_CallInternal+0x4963>
   2a49b:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a4a2:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a4a6:	e8 f5 23 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a4ab:	e9 b4 cf ff ff       	jmp    27464 <JS_CallInternal+0x49a4>
   2a4b0:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   2a4b7:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a4be:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   2a4c5:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a4c9:	e8 d2 23 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a4ce:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
   2a4d5:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   2a4dc:	e9 08 e8 ff ff       	jmp    28ce9 <JS_CallInternal+0x6229>
   2a4e1:	88 85 40 fe ff ff    	mov    BYTE PTR [rbp-0x1c0],al
   2a4e7:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a4ee:	4c 89 ce             	mov    rsi,r9
   2a4f1:	4c 89 ea             	mov    rdx,r13
   2a4f4:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a4f8:	e8 a3 23 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a4fd:	0f b6 85 40 fe ff ff 	movzx  eax,BYTE PTR [rbp-0x1c0]
   2a504:	e9 85 c8 ff ff       	jmp    26d8e <JS_CallInternal+0x42ce>
   2a509:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a510:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a514:	e8 87 23 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a519:	e9 39 a8 ff ff       	jmp    24d57 <JS_CallInternal+0x2297>
   2a51e:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a525:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a529:	e8 72 23 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a52e:	e9 1a b2 ff ff       	jmp    2574d <JS_CallInternal+0x2c8d>
   2a533:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a53a:	48 89 ca             	mov    rdx,rcx
   2a53d:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a541:	e8 5a 23 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a546:	e9 65 b3 ff ff       	jmp    258b0 <JS_CallInternal+0x2df0>
   2a54b:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a552:	48 89 ca             	mov    rdx,rcx
   2a555:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a559:	e8 42 23 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a55e:	e9 a1 b3 ff ff       	jmp    25904 <JS_CallInternal+0x2e44>
   2a563:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a56a:	48 89 ca             	mov    rdx,rcx
   2a56d:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a571:	e8 2a 23 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a576:	e9 dd b3 ff ff       	jmp    25958 <JS_CallInternal+0x2e98>
   2a57b:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a582:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a586:	e8 15 23 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a58b:	e9 9f ac ff ff       	jmp    2522f <JS_CallInternal+0x276f>
   2a590:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a597:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a59b:	e8 00 23 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a5a0:	e9 3f ac ff ff       	jmp    251e4 <JS_CallInternal+0x2724>
   2a5a5:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a5ac:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a5b0:	e8 eb 22 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a5b5:	e9 ba ac ff ff       	jmp    25274 <JS_CallInternal+0x27b4>
   2a5ba:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a5c1:	4c 89 c2             	mov    rdx,r8
   2a5c4:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a5c8:	e8 d3 22 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a5cd:	e9 5e b7 ff ff       	jmp    25d30 <JS_CallInternal+0x3270>
   2a5d2:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a5d9:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a5dd:	e8 be 22 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a5e2:	e9 e5 b7 ff ff       	jmp    25dcc <JS_CallInternal+0x330c>
   2a5e7:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a5ee:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a5f2:	e8 a9 22 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a5f7:	e9 82 b7 ff ff       	jmp    25d7e <JS_CallInternal+0x32be>
   2a5fc:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a603:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a607:	e8 94 22 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a60c:	e9 09 b8 ff ff       	jmp    25e1a <JS_CallInternal+0x335a>
   2a611:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a618:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a61c:	e8 7f 22 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a621:	e9 7d a6 ff ff       	jmp    24ca3 <JS_CallInternal+0x21e3>
   2a626:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a62d:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a631:	e8 6a 22 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a636:	e9 1e a5 ff ff       	jmp    24b59 <JS_CallInternal+0x2099>
   2a63b:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a642:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a646:	e8 55 22 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a64b:	e9 2f b5 ff ff       	jmp    25b7f <JS_CallInternal+0x30bf>
   2a650:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a657:	4c 89 c2             	mov    rdx,r8
   2a65a:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a65e:	e8 3d 22 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a663:	e9 b8 b5 ff ff       	jmp    25c20 <JS_CallInternal+0x3160>
   2a668:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a66f:	4c 89 c2             	mov    rdx,r8
   2a672:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a676:	e8 25 22 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a67b:	e9 fb b5 ff ff       	jmp    25c7b <JS_CallInternal+0x31bb>
   2a680:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a687:	4c 89 c2             	mov    rdx,r8
   2a68a:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a68e:	e8 0d 22 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a693:	e9 3e b6 ff ff       	jmp    25cd6 <JS_CallInternal+0x3216>
   2a698:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a69f:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a6a3:	e8 f8 21 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a6a8:	e9 8a b4 ff ff       	jmp    25b37 <JS_CallInternal+0x3077>
   2a6ad:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a6b4:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a6b8:	e8 e3 21 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a6bd:	e9 76 b3 ff ff       	jmp    25a38 <JS_CallInternal+0x2f78>
   2a6c2:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a6c9:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a6cd:	e8 ce 21 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a6d2:	e9 19 b3 ff ff       	jmp    259f0 <JS_CallInternal+0x2f30>
   2a6d7:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a6de:	48 89 ca             	mov    rdx,rcx
   2a6e1:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a6e5:	e8 b6 21 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a6ea:	e9 bb b2 ff ff       	jmp    259aa <JS_CallInternal+0x2eea>
   2a6ef:	88 85 40 fe ff ff    	mov    BYTE PTR [rbp-0x1c0],al
   2a6f5:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a6fc:	48 89 ce             	mov    rsi,rcx
   2a6ff:	4c 89 f2             	mov    rdx,r14
   2a702:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a706:	e8 95 21 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a70b:	0f b6 85 40 fe ff ff 	movzx  eax,BYTE PTR [rbp-0x1c0]
   2a712:	e9 9b c6 ff ff       	jmp    26db2 <JS_CallInternal+0x42f2>
   2a717:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a71e:	4c 89 c6             	mov    rsi,r8
   2a721:	48 89 ca             	mov    rdx,rcx
   2a724:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a728:	e8 73 21 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a72d:	e9 4f df ff ff       	jmp    28681 <JS_CallInternal+0x5bc1>
   2a732:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a739:	48 89 ca             	mov    rdx,rcx
   2a73c:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a740:	e8 5b 21 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a745:	e9 2b e3 ff ff       	jmp    28a75 <JS_CallInternal+0x5fb5>
   2a74a:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a751:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   2a758:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a75c:	e8 3f 21 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a761:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   2a768:	e9 c2 e4 ff ff       	jmp    28c2f <JS_CallInternal+0x616f>
   2a76d:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a774:	4c 89 c2             	mov    rdx,r8
   2a777:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a77b:	e8 20 21 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a780:	e9 f7 9d ff ff       	jmp    2457c <JS_CallInternal+0x1abc>
   2a785:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a78c:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a790:	e8 0b 21 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a795:	e9 31 9e ff ff       	jmp    245cb <JS_CallInternal+0x1b0b>
   2a79a:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a7a1:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a7a5:	e8 f6 20 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a7aa:	e9 06 a2 ff ff       	jmp    249b5 <JS_CallInternal+0x1ef5>
   2a7af:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a7b6:	4c 89 c2             	mov    rdx,r8
   2a7b9:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a7bd:	e8 de 20 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a7c2:	e9 40 a3 ff ff       	jmp    24b07 <JS_CallInternal+0x2047>
   2a7c7:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a7ce:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a7d2:	e8 c9 20 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a7d7:	e9 4b a1 ff ff       	jmp    24927 <JS_CallInternal+0x1e67>
   2a7dc:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a7e3:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a7e7:	e8 b4 20 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a7ec:	e9 7e a1 ff ff       	jmp    2496f <JS_CallInternal+0x1eaf>
   2a7f1:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a7f8:	48 89 ca             	mov    rdx,rcx
   2a7fb:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a7ff:	e8 9c 20 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a804:	e9 94 9f ff ff       	jmp    2479d <JS_CallInternal+0x1cdd>
   2a809:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a810:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a814:	e8 87 20 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a819:	e9 a5 9e ff ff       	jmp    246c3 <JS_CallInternal+0x1c03>
   2a81e:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a825:	4c 89 c2             	mov    rdx,r8
   2a828:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a82c:	e8 6f 20 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a831:	e9 3e 9e ff ff       	jmp    24674 <JS_CallInternal+0x1bb4>
   2a836:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a83d:	48 89 ca             	mov    rdx,rcx
   2a840:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a844:	e8 57 20 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a849:	e9 49 a0 ff ff       	jmp    24897 <JS_CallInternal+0x1dd7>
   2a84e:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a855:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a859:	e8 42 20 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a85e:	e9 7c a0 ff ff       	jmp    248df <JS_CallInternal+0x1e1f>
   2a863:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a86a:	48 89 ca             	mov    rdx,rcx
   2a86d:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a871:	e8 2a 20 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a876:	e9 76 9f ff ff       	jmp    247f1 <JS_CallInternal+0x1d31>
   2a87b:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a882:	48 89 ca             	mov    rdx,rcx
   2a885:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a889:	e8 12 20 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a88e:	e9 b2 9f ff ff       	jmp    24845 <JS_CallInternal+0x1d85>
   2a893:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a89a:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   2a8a1:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
   2a8a8:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a8ac:	e8 ef 1f ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a8b1:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
   2a8b8:	4c 8b 8d 50 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1b0]
   2a8bf:	e9 bf 95 ff ff       	jmp    23e83 <JS_CallInternal+0x13c3>
   2a8c4:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a8cb:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   2a8d2:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
   2a8d9:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a8dd:	e8 be 1f ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a8e2:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
   2a8e9:	4c 8b 8d 50 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1b0]
   2a8f0:	e9 53 95 ff ff       	jmp    23e48 <JS_CallInternal+0x1388>
   2a8f5:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a8fc:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   2a903:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
   2a90a:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a90e:	e8 8d 1f ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a913:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
   2a91a:	4c 8b 8d 50 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1b0]
   2a921:	e9 3f 95 ff ff       	jmp    23e65 <JS_CallInternal+0x13a5>
   2a926:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a92d:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a931:	e8 6a 1f ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a936:	e9 14 df ff ff       	jmp    2884f <JS_CallInternal+0x5d8f>
   2a93b:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a942:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   2a949:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a94d:	e8 4e 1f ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a952:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   2a959:	e9 5b 94 ff ff       	jmp    23db9 <JS_CallInternal+0x12f9>
   2a95e:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   2a965:	4c 89 f6             	mov    rsi,r14
   2a968:	4c 89 ea             	mov    rdx,r13
   2a96b:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a972:	48 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rcx
   2a979:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a97d:	e8 1e 1f ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a982:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   2a989:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   2a990:	e9 a3 ba ff ff       	jmp    26438 <JS_CallInternal+0x3978>
   2a995:	48 8b 7f 10          	mov    rdi,QWORD PTR [rdi+0x10]
   2a999:	4c 89 c2             	mov    rdx,r8
   2a99c:	e8 ff 1e ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a9a1:	e9 57 cb ff ff       	jmp    274fd <JS_CallInternal+0x4a3d>
   2a9a6:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a9ad:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a9b1:	e8 ea 1e ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a9b6:	e9 0f de ff ff       	jmp    287ca <JS_CallInternal+0x5d0a>
   2a9bb:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a9c2:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a9c6:	e8 d5 1e ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a9cb:	e9 17 de ff ff       	jmp    287e7 <JS_CallInternal+0x5d27>
   2a9d0:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a9d7:	4c 89 f2             	mov    rdx,r14
   2a9da:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   2a9e1:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a9e5:	e8 b6 1e ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2a9ea:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   2a9f1:	e9 90 c2 ff ff       	jmp    26c86 <JS_CallInternal+0x41c6>
   2a9f6:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a9fd:	4c 89 95 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r10
   2aa04:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2aa08:	e8 93 1e ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2aa0d:	4c 8b 95 40 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c0]
   2aa14:	e9 94 dd ff ff       	jmp    287ad <JS_CallInternal+0x5ced>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18421
   2aa19:	4c 8b a5 10 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1f0]
   2aa20:	e9 3b 88 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   2aa25:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2aa2c:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2aa30:	e8 6b 1e ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2aa35:	e9 a0 e6 ff ff       	jmp    290da <JS_CallInternal+0x661a>
   2aa3a:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
   2aa41:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2aa48:	44 89 85 38 fe ff ff 	mov    DWORD PTR [rbp-0x1c8],r8d
   2aa4f:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2aa53:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   2aa5a:	e8 41 1e ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2aa5f:	44 8b 85 38 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x1c8]
   2aa66:	48 8b 85 40 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c0]
   2aa6d:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   2aa74:	e9 d0 d8 ff ff       	jmp    28349 <JS_CallInternal+0x5889>
   2aa79:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   2aa80:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2aa87:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   2aa8e:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2aa92:	e8 09 1e ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2aa97:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
   2aa9e:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   2aaa5:	e9 84 92 ff ff       	jmp    23d2e <JS_CallInternal+0x126e>
   2aaaa:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   2aab1:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2aab8:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   2aabf:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2aac3:	e8 d8 1d ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2aac8:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
   2aacf:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   2aad6:	e9 70 92 ff ff       	jmp    23d4b <JS_CallInternal+0x128b>
   2aadb:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
   2aae2:	4c 89 ee             	mov    rsi,r13
   2aae5:	4c 89 f2             	mov    rdx,r14
   2aae8:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2aaef:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   2aaf6:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2aafa:	e8 a1 1d ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2aaff:	48 8b 85 40 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c0]
   2ab06:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   2ab0d:	e9 e1 ab ff ff       	jmp    256f3 <JS_CallInternal+0x2c33>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18531
   2ab12:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18532
   2ab19:	8b 4e 04             	mov    ecx,DWORD PTR [rsi+0x4]
   2ab1c:	48 89 b5 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rsi
   2ab23:	4c 8b ad e8 fe ff ff 	mov    r13,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18531
   2ab2a:	4c 89 70 30          	mov    QWORD PTR [rax+0x30],r14
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18532
   2ab2e:	49 8b b5 80 01 00 00 	mov    rsi,QWORD PTR [r13+0x180]
   2ab35:	49 8b 95 88 01 00 00 	mov    rdx,QWORD PTR [r13+0x188]
   2ab3c:	4c 89 ef             	mov    rdi,r13
   2ab3f:	e8 4c 36 04 00       	call   6e190 <JS_HasProperty>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18533
   2ab44:	85 c0                	test   eax,eax
   2ab46:	0f 88 71 20 00 00    	js     2cbbd <JS_CallInternal+0xa0fd>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18535
   2ab4c:	4c 8b 95 50 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1b0]
   2ab53:	0f 85 00 03 00 00    	jne    2ae59 <JS_CallInternal+0x8399>
is_strict_mode():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2873
   2ab59:	49 8b 45 10          	mov    rax,QWORD PTR [r13+0x10]
   2ab5d:	4c 89 ef             	mov    rdi,r13
   2ab60:	48 8b 80 f0 04 00 00 	mov    rax,QWORD PTR [rax+0x4f0]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2874
   2ab67:	48 85 c0             	test   rax,rax
   2ab6a:	0f 84 e9 02 00 00    	je     2ae59 <JS_CallInternal+0x8399>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2874 (discriminator 1)
   2ab70:	f6 40 3c 01          	test   BYTE PTR [rax+0x3c],0x1
   2ab74:	0f 84 df 02 00 00    	je     2ae59 <JS_CallInternal+0x8399>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18536
   2ab7a:	41 8b 72 04          	mov    esi,DWORD PTR [r10+0x4]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18517
   2ab7e:	4d 89 f4             	mov    r12,r14
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18536
   2ab81:	e8 ba 82 00 00       	call   32e40 <JS_ThrowReferenceErrorNotDefined>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18537
   2ab86:	e9 d5 86 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   2ab8b:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ab92:	48 89 ca             	mov    rdx,rcx
   2ab95:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ab99:	e8 02 1d ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2ab9e:	e9 d6 b2 ff ff       	jmp    25e79 <JS_CallInternal+0x33b9>
   2aba3:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2abaa:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2abae:	e8 ed 1c ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2abb3:	e9 6d b3 ff ff       	jmp    25f25 <JS_CallInternal+0x3465>
   2abb8:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2abbf:	4c 89 ee             	mov    rsi,r13
   2abc2:	4c 89 f2             	mov    rdx,r14
   2abc5:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2abc9:	e8 d2 1c ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2abce:	e9 ff c5 ff ff       	jmp    271d2 <JS_CallInternal+0x4712>
   2abd3:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
   2abda:	4c 89 ee             	mov    rsi,r13
   2abdd:	4c 89 ca             	mov    rdx,r9
   2abe0:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2abe7:	44 89 85 28 fe ff ff 	mov    DWORD PTR [rbp-0x1d8],r8d
   2abee:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2abf2:	48 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rcx
   2abf9:	e8 a2 1c ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2abfe:	44 8b 85 28 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x1d8]
   2ac05:	48 8b 85 38 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c8]
   2ac0c:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   2ac13:	e9 0d d7 ff ff       	jmp    28325 <JS_CallInternal+0x5865>
JS_GetProperty():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:782
   2ac18:	48 83 ec 08          	sub    rsp,0x8
   2ac1c:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
   2ac22:	4c 89 ee             	mov    rsi,r13
   2ac25:	4c 89 e2             	mov    rdx,r12
   2ac28:	4c 8b 85 50 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1b0]
   2ac2f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2ac36:	6a 00                	push   0x0
   2ac38:	4c 8b 8d 58 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1a8]
   2ac3f:	e8 6c 21 00 00       	call   2cdb0 <JS_GetPropertyInternal>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20599 (discriminator 2)
   2ac44:	5f                   	pop    rdi
   2ac45:	41 58                	pop    r8
JS_GetProperty():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:782
   2ac47:	48 89 c1             	mov    rcx,rax
   2ac4a:	48 89 d0             	mov    rax,rdx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20599 (discriminator 2)
   2ac4d:	83 fa 06             	cmp    edx,0x6
   2ac50:	0f 85 c5 88 ff ff    	jne    2351b <JS_CallInternal+0xa5b>
   2ac56:	e9 6b 89 ff ff       	jmp    235c6 <JS_CallInternal+0xb06>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   2ac5b:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ac62:	4c 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r8
   2ac69:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ac6d:	e8 2e 1c ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2ac72:	4c 8b 85 50 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1b0]
   2ac79:	e9 6a 94 ff ff       	jmp    240e8 <JS_CallInternal+0x1628>
   2ac7e:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ac85:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ac89:	e8 12 1c ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2ac8e:	e9 a1 b6 ff ff       	jmp    26334 <JS_CallInternal+0x3874>
   2ac93:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ac9a:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ac9e:	e8 fd 1b ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2aca3:	e9 aa b6 ff ff       	jmp    26352 <JS_CallInternal+0x3892>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18190
   2aca8:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18189
   2acab:	4d 89 ec             	mov    r12,r13
   2acae:	e9 ad 85 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18227
   2acb3:	4d 89 d4             	mov    r12,r10
   2acb6:	e9 a5 85 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18390
   2acbb:	4c 8b a5 28 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1d8]
   2acc2:	e9 99 85 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19029
   2acc7:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2acce:	48 8d 35 0b 61 0a 00 	lea    rsi,[rip+0xa610b]        # d0de0 <_IO_stdin_used+0x3de0>
   2acd5:	31 c0                	xor    eax,eax
   2acd7:	e8 44 5f 00 00       	call   30c20 <JS_ThrowTypeError>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19030
   2acdc:	e9 7f 85 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20421 (discriminator 2)
   2ace1:	41 83 f9 08          	cmp    r9d,0x8
   2ace5:	0f 84 27 1c 00 00    	je     2c912 <JS_CallInternal+0x9e52>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20421 (discriminator 8)
   2aceb:	41 83 f9 ff          	cmp    r9d,0xffffffff
   2acef:	0f 84 d3 1b 00 00    	je     2c8c8 <JS_CallInternal+0x9e08>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20421 (discriminator 14)
   2acf5:	41 8d 41 fe          	lea    eax,[r9-0x2]
   2acf9:	83 f8 01             	cmp    eax,0x1
   2acfc:	0f 86 68 1d 00 00    	jbe    2ca6a <JS_CallInternal+0x9faa>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20421 (discriminator 21)
   2ad02:	41 83 f9 f9          	cmp    r9d,0xfffffff9
   2ad06:	0f 85 81 1b 00 00    	jne    2c88d <JS_CallInternal+0x9dcd>
   2ad0c:	41 83 fe f9          	cmp    r14d,0xfffffff9
   2ad10:	0f 85 77 1b 00 00    	jne    2c88d <JS_CallInternal+0x9dcd>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20421 (discriminator 23)
   2ad16:	4c 89 ee             	mov    rsi,r13
   2ad19:	4c 89 8d 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r9
   2ad20:	48 89 95 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rdx
   2ad27:	e8 e4 d0 fe ff       	call   17e10 <js_string_eq.isra.0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20421 (discriminator 1)
   2ad2c:	48 8b b5 40 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c0]
   2ad33:	4c 8b 8d 38 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20421 (discriminator 23)
   2ad3a:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20421 (discriminator 1)
   2ad40:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2ad47:	4c 89 ca             	mov    rdx,r9
   2ad4a:	e8 b1 1c ff ff       	call   1ca00 <JS_FreeValue>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20421 (discriminator 2)
   2ad4f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2ad56:	4c 89 ee             	mov    rsi,r13
   2ad59:	4c 89 f2             	mov    rdx,r14
   2ad5c:	e8 9f 1c ff ff       	call   1ca00 <JS_FreeValue>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   2ad61:	31 c0                	xor    eax,eax
   2ad63:	83 bd 50 fe ff ff 01 	cmp    DWORD PTR [rbp-0x1b0],0x1
   2ad6a:	0f 95 c0             	setne  al
   2ad6d:	e9 cd cb ff ff       	jmp    2793f <JS_CallInternal+0x4e7f>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18782
   2ad72:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2ad79:	48 8d 35 38 60 0a 00 	lea    rsi,[rip+0xa6038]        # d0db8 <_IO_stdin_used+0x3db8>
   2ad80:	31 c0                	xor    eax,eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18780
   2ad82:	4d 89 ec             	mov    r12,r13
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18782
   2ad85:	e8 86 7f 00 00       	call   32d10 <JS_ThrowReferenceError>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18783
   2ad8a:	e9 d1 84 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
   2ad8f:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ad96:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ad9a:	e9 0b e3 ff ff       	jmp    290aa <JS_CallInternal+0x65ea>
JS_ThrowTypeErrorNotAnObject():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7817
   2ad9f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2ada6:	48 8d 35 a5 27 0a 00 	lea    rsi,[rip+0xa27a5]        # cd552 <_IO_stdin_used+0x552>
   2adad:	31 c0                	xor    eax,eax
   2adaf:	e8 6c 5e 00 00       	call   30c20 <JS_ThrowTypeError>
   2adb4:	4d 8b 4e 08          	mov    r9,QWORD PTR [r14+0x8]
   2adb8:	4c 8b 6b f0          	mov    r13,QWORD PTR [rbx-0x10]
   2adbc:	48 89 c1             	mov    rcx,rax
JS_IsException():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:643
   2adbf:	41 89 d0             	mov    r8d,edx
   2adc2:	48 89 d0             	mov    rax,rdx
JS_GetPrivateField():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:8439
   2adc5:	e9 42 d5 ff ff       	jmp    2830c <JS_CallInternal+0x584c>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17983
   2adca:	4c 89 f3             	mov    rbx,r14
   2adcd:	e9 8e 84 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18450
   2add2:	4c 89 f3             	mov    rbx,r14
   2add5:	e9 86 84 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:67 (discriminator 6)
   2adda:	41 8b 4e 0c          	mov    ecx,DWORD PTR [r14+0xc]
   2adde:	e9 77 e5 ff ff       	jmp    2935a <JS_CallInternal+0x689a>
JS_ThrowReferenceErrorUninitialized2():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7862
   2ade3:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7851 (discriminator 1)
   2adea:	48 8d 15 a9 26 0a 00 	lea    rdx,[rip+0xa26a9]        # cd49a <_IO_stdin_used+0x49a>
JS_ThrowReferenceErrorUninitialized2():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7862
   2adf1:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
   2adf5:	8b 44 08 04          	mov    eax,DWORD PTR [rax+rcx*1+0x4]
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7851
   2adf9:	85 c0                	test   eax,eax
   2adfb:	0f 85 32 16 00 00    	jne    2c433 <JS_CallInternal+0x9973>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7851 (discriminator 2)
   2ae01:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2ae08:	48 8d 35 e7 26 0a 00 	lea    rsi,[rip+0xa26e7]        # cd4f6 <_IO_stdin_used+0x4f6>
   2ae0f:	31 c0                	xor    eax,eax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18681
   2ae11:	4d 89 ec             	mov    r12,r13
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7851 (discriminator 2)
   2ae14:	e8 f7 7e 00 00       	call   32d10 <JS_ThrowReferenceError>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18685
   2ae19:	e9 42 84 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
JS_ThrowReferenceErrorUninitialized2():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7862
   2ae1e:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
   2ae25:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
   2ae29:	8b 44 10 04          	mov    eax,DWORD PTR [rax+rdx*1+0x4]
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7851 (discriminator 1)
   2ae2d:	48 8d 15 66 26 0a 00 	lea    rdx,[rip+0xa2666]        # cd49a <_IO_stdin_used+0x49a>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7851
   2ae34:	85 c0                	test   eax,eax
   2ae36:	0f 85 54 17 00 00    	jne    2c590 <JS_CallInternal+0x9ad0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7851 (discriminator 2)
   2ae3c:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2ae43:	48 8d 35 ac 26 0a 00 	lea    rsi,[rip+0xa26ac]        # cd4f6 <_IO_stdin_used+0x4f6>
   2ae4a:	31 c0                	xor    eax,eax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18708
   2ae4c:	4d 89 ec             	mov    r12,r13
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7851 (discriminator 2)
   2ae4f:	e8 bc 7e 00 00       	call   32d10 <JS_ThrowReferenceError>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18711
   2ae54:	e9 07 84 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18539
   2ae59:	48 83 ec 08          	sub    rsp,0x8
   2ae5d:	41 8b 4a 04          	mov    ecx,DWORD PTR [r10+0x4]
   2ae61:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   2ae65:	48 83 eb 10          	sub    rbx,0x10
   2ae69:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ae70:	4c 8b 4b 08          	mov    r9,QWORD PTR [rbx+0x8]
   2ae74:	48 8b b0 80 01 00 00 	mov    rsi,QWORD PTR [rax+0x180]
   2ae7b:	48 8b 90 88 01 00 00 	mov    rdx,QWORD PTR [rax+0x188]
   2ae82:	68 00 80 00 00       	push   0x8000
   2ae87:	48 89 c7             	mov    rdi,rax
   2ae8a:	ff b0 88 01 00 00    	push   QWORD PTR [rax+0x188]
   2ae90:	ff b0 80 01 00 00    	push   QWORD PTR [rax+0x180]
   2ae96:	e8 45 2c 00 00       	call   2dae0 <JS_SetPropertyInternal>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18542
   2ae9b:	48 83 c4 20          	add    rsp,0x20
   2ae9f:	85 c0                	test   eax,eax
   2aea1:	0f 89 9f 88 ff ff    	jns    23746 <JS_CallInternal+0xc86>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18517
   2aea7:	4d 89 f4             	mov    r12,r14
   2aeaa:	e9 b1 83 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
   2aeaf:	90                   	nop
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17936 (discriminator 1)
   2aeb0:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17936
   2aeb3:	4d 89 ec             	mov    r12,r13
   2aeb6:	e9 a5 83 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   2aebb:	41 8b 45 fc          	mov    eax,DWORD PTR [r13-0x4]
   2aebf:	83 e8 01             	sub    eax,0x1
   2aec2:	41 89 45 fc          	mov    DWORD PTR [r13-0x4],eax
   2aec6:	85 c0                	test   eax,eax
   2aec8:	0f 8f 60 f3 ff ff    	jg     2a22e <JS_CallInternal+0x776e>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   2aece:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2aed5:	4c 89 ee             	mov    rsi,r13
   2aed8:	4c 89 f2             	mov    rdx,r14
   2aedb:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2aedf:	e8 bc 19 ff ff       	call   1c8a0 <__JS_FreeValueRT>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20421 (discriminator 1)
   2aee4:	e9 45 f3 ff ff       	jmp    2a22e <JS_CallInternal+0x776e>
   2aee9:	48 89 85 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rax
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   2aef0:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2aef7:	4c 89 95 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r10
   2aefe:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2af02:	e8 99 19 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2af07:	48 8b 85 28 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1d8]
   2af0e:	4c 8b 95 38 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c8]
   2af15:	e9 87 d0 ff ff       	jmp    27fa1 <JS_CallInternal+0x54e1>
   2af1a:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
   2af21:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2af28:	4c 89 95 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r10
   2af2f:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2af33:	e8 68 19 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2af38:	48 8b 85 38 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c8]
   2af3f:	4c 8b 95 50 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1b0]
   2af46:	e9 7a d0 ff ff       	jmp    27fc5 <JS_CallInternal+0x5505>
   2af4b:	48 89 85 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rax
   2af52:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2af59:	4c 89 95 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r10
   2af60:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2af64:	e8 37 19 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2af69:	48 8b 85 28 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1d8]
   2af70:	4c 8b 95 38 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c8]
   2af77:	e9 08 d0 ff ff       	jmp    27f84 <JS_CallInternal+0x54c4>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19638 (discriminator 1)
   2af7c:	0f 85 41 1d 00 00    	jne    2ccc3 <JS_CallInternal+0xa203>
is_strict_mode():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2873
   2af82:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2af89:	48 8b 47 10          	mov    rax,QWORD PTR [rdi+0x10]
   2af8d:	48 8b 80 f0 04 00 00 	mov    rax,QWORD PTR [rax+0x4f0]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2874
   2af94:	48 85 c0             	test   rax,rax
   2af97:	0f 84 16 c6 ff ff    	je     275b3 <JS_CallInternal+0x4af3>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2874 (discriminator 1)
   2af9d:	f6 40 3c 01          	test   BYTE PTR [rax+0x3c],0x1
   2afa1:	0f 84 0c c6 ff ff    	je     275b3 <JS_CallInternal+0x4af3>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19643
   2afa7:	44 89 ee             	mov    esi,r13d
   2afaa:	e8 91 7e 00 00       	call   32e40 <JS_ThrowReferenceErrorNotDefined>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3735 (discriminator 1)
   2afaf:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   2afb6:	0f 8e a4 82 ff ff    	jle    23260 <JS_CallInternal+0x7a0>
   2afbc:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2afc3:	44 89 ee             	mov    esi,r13d
   2afc6:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2afca:	e8 a1 e4 fe ff       	call   19470 <JS_FreeAtom.part.0.isra.0>
   2afcf:	e9 8c 82 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
is_strict_mode():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2873
   2afd4:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2afdb:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
   2afdf:	48 8b 80 f0 04 00 00 	mov    rax,QWORD PTR [rax+0x4f0]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2874
   2afe6:	48 85 c0             	test   rax,rax
   2afe9:	0f 84 b1 0e 00 00    	je     2bea0 <JS_CallInternal+0x93e0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2874 (discriminator 1)
   2afef:	f6 40 3c 01          	test   BYTE PTR [rax+0x3c],0x1
   2aff3:	0f 84 a7 0e 00 00    	je     2bea0 <JS_CallInternal+0x93e0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19629
   2aff9:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b000:	44 89 ee             	mov    esi,r13d
   2b003:	e8 38 7e 00 00       	call   32e40 <JS_ThrowReferenceErrorNotDefined>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3735 (discriminator 1)
   2b008:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   2b00f:	0f 8e 4b 82 ff ff    	jle    23260 <JS_CallInternal+0x7a0>
   2b015:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b01c:	44 89 ee             	mov    esi,r13d
   2b01f:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b023:	e8 48 e4 fe ff       	call   19470 <JS_FreeAtom.part.0.isra.0>
   2b028:	e9 33 82 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20190
   2b02d:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20191
   2b034:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b03b:	44 89 ea             	mov    edx,r13d
   2b03e:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20190
   2b041:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20191
   2b045:	e8 86 aa 02 00       	call   55ad0 <js_binary_logic_slow>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20191 (discriminator 1)
   2b04a:	85 c0                	test   eax,eax
   2b04c:	0f 85 0e 82 ff ff    	jne    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20193
   2b052:	48 83 eb 10          	sub    rbx,0x10
   2b056:	e9 99 b7 ff ff       	jmp    267f4 <JS_CallInternal+0x3d34>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   2b05b:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b062:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b066:	e8 35 18 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2b06b:	e9 c5 c5 ff ff       	jmp    27635 <JS_CallInternal+0x4b75>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20364 (discriminator 2)
   2b070:	41 83 fd 08          	cmp    r13d,0x8
   2b074:	0f 84 ad 14 00 00    	je     2c527 <JS_CallInternal+0x9a67>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20364 (discriminator 9)
   2b07a:	41 83 fd ff          	cmp    r13d,0xffffffff
   2b07e:	0f 84 72 14 00 00    	je     2c4f6 <JS_CallInternal+0x9a36>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20364 (discriminator 16)
   2b084:	41 8d 4d fe          	lea    ecx,[r13-0x2]
   2b088:	83 f9 01             	cmp    ecx,0x1
   2b08b:	0f 86 27 14 00 00    	jbe    2c4b8 <JS_CallInternal+0x99f8>
   2b091:	4c 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r8
   2b098:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20364 (discriminator 23)
   2b09f:	41 83 fd f9          	cmp    r13d,0xfffffff9
   2b0a3:	0f 85 37 f0 ff ff    	jne    2a0e0 <JS_CallInternal+0x7620>
   2b0a9:	41 83 f8 f9          	cmp    r8d,0xfffffff9
   2b0ad:	0f 85 2d f0 ff ff    	jne    2a0e0 <JS_CallInternal+0x7620>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20364 (discriminator 29)
   2b0b3:	e8 58 cd fe ff       	call   17e10 <js_string_eq.isra.0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20364 (discriminator 1)
   2b0b8:	4c 89 f6             	mov    rsi,r14
   2b0bb:	4c 8b b5 e8 fe ff ff 	mov    r14,QWORD PTR [rbp-0x118]
   2b0c2:	4c 89 ea             	mov    rdx,r13
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20364 (discriminator 29)
   2b0c5:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20364 (discriminator 1)
   2b0cb:	4c 89 f7             	mov    rdi,r14
   2b0ce:	e8 2d 19 ff ff       	call   1ca00 <JS_FreeValue>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20364 (discriminator 2)
   2b0d3:	48 8b b5 40 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c0]
   2b0da:	48 8b 95 38 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c8]
   2b0e1:	4c 89 f7             	mov    rdi,r14
   2b0e4:	e8 17 19 ff ff       	call   1ca00 <JS_FreeValue>
   2b0e9:	8b 85 50 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1b0]
   2b0ef:	e9 01 b8 ff ff       	jmp    268f5 <JS_CallInternal+0x3e35>
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7901
   2b0f4:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b0fb:	e8 80 80 00 00       	call   33180 <__js_poll_interrupts>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18897 (discriminator 2)
   2b100:	85 c0                	test   eax,eax
   2b102:	0f 84 dd c5 ff ff    	je     276e5 <JS_CallInternal+0x4c25>
   2b108:	4d 89 ec             	mov    r12,r13
   2b10b:	e9 50 81 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
js_for_of_next():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16712 (discriminator 2)
   2b110:	ba 01 00 00 00       	mov    edx,0x1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16709
   2b115:	be 03 00 00 00       	mov    esi,0x3
   2b11a:	31 ff                	xor    edi,edi
   2b11c:	e9 6f d3 ff ff       	jmp    28490 <JS_CallInternal+0x59d0>
JS_ThrowTypeErrorNotASymbol():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7838
   2b121:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b128:	48 8d 35 31 24 0a 00 	lea    rsi,[rip+0xa2431]        # cd560 <_IO_stdin_used+0x560>
   2b12f:	31 c0                	xor    eax,eax
   2b131:	e8 ea 5a 00 00       	call   30c20 <JS_ThrowTypeError>
   2b136:	4d 8b 4e 08          	mov    r9,QWORD PTR [r14+0x8]
   2b13a:	4d 8b 2e             	mov    r13,QWORD PTR [r14]
   2b13d:	48 89 c1             	mov    rcx,rax
JS_IsException():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:643
   2b140:	41 89 d0             	mov    r8d,edx
   2b143:	48 89 d0             	mov    rax,rdx
JS_GetPrivateField():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:8442
   2b146:	e9 c1 d1 ff ff       	jmp    2830c <JS_CallInternal+0x584c>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20244
   2b14b:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20245
   2b152:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b159:	44 89 ea             	mov    edx,r13d
   2b15c:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20244
   2b15f:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20245
   2b163:	e8 68 a9 02 00       	call   55ad0 <js_binary_logic_slow>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20245 (discriminator 1)
   2b168:	85 c0                	test   eax,eax
   2b16a:	0f 85 f0 80 ff ff    	jne    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20247
   2b170:	48 83 eb 10          	sub    rbx,0x10
   2b174:	e9 18 c9 ff ff       	jmp    27a91 <JS_CallInternal+0x4fd1>
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7901
   2b179:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b180:	e8 fb 7f 00 00       	call   33180 <__js_poll_interrupts>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18845 (discriminator 2)
   2b185:	85 c0                	test   eax,eax
   2b187:	0f 84 a9 bf ff ff    	je     27136 <JS_CallInternal+0x4676>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18844 (discriminator 1)
   2b18d:	4d 89 ec             	mov    r12,r13
   2b190:	e9 cb 80 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19687
   2b195:	4c 89 f3             	mov    rbx,r14
   2b198:	e9 c3 80 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7901
   2b19d:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b1a4:	e8 d7 7f 00 00       	call   33180 <__js_poll_interrupts>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18938 (discriminator 2)
   2b1a9:	85 c0                	test   eax,eax
   2b1ab:	0f 84 e5 cf ff ff    	je     28196 <JS_CallInternal+0x56d6>
   2b1b1:	4d 89 ec             	mov    r12,r13
   2b1b4:	e9 a7 80 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:70 (discriminator 6)
   2b1b9:	8b 48 0c             	mov    ecx,DWORD PTR [rax+0xc]
   2b1bc:	e9 02 e2 ff ff       	jmp    293c3 <JS_CallInternal+0x6903>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   2b1c1:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b1c8:	4c 89 ee             	mov    rsi,r13
   2b1cb:	4c 89 f2             	mov    rdx,r14
   2b1ce:	44 89 85 50 fe ff ff 	mov    DWORD PTR [rbp-0x1b0],r8d
   2b1d5:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b1d9:	e8 c2 16 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2b1de:	44 8b 85 50 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x1b0]
   2b1e5:	e9 c9 9e ff ff       	jmp    250b3 <JS_CallInternal+0x25f3>
   2b1ea:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b1f1:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
   2b1f8:	48 89 ce             	mov    rsi,rcx
   2b1fb:	44 89 85 38 fe ff ff 	mov    DWORD PTR [rbp-0x1c8],r8d
   2b202:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b206:	e8 95 16 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2b20b:	44 8b 85 38 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x1c8]
   2b212:	e9 83 9e ff ff       	jmp    2509a <JS_CallInternal+0x25da>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20293 (discriminator 2)
   2b217:	83 fe 08             	cmp    esi,0x8
   2b21a:	0f 84 01 11 00 00    	je     2c321 <JS_CallInternal+0x9861>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20293 (discriminator 8)
   2b220:	85 f6                	test   esi,esi
   2b222:	75 09                	jne    2b22d <JS_CallInternal+0x876d>
   2b224:	83 f9 08             	cmp    ecx,0x8
   2b227:	0f 84 ce 0f 00 00    	je     2c1fb <JS_CallInternal+0x973b>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20293 (discriminator 20)
   2b22d:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2b234:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b23b:	44 89 ea             	mov    edx,r13d
   2b23e:	48 89 de             	mov    rsi,rbx
   2b241:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   2b245:	e8 36 f7 02 00       	call   5a980 <js_relational_slow>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20293 (discriminator 1)
   2b24a:	85 c0                	test   eax,eax
   2b24c:	0f 85 0e 80 ff ff    	jne    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20293 (discriminator 22)
   2b252:	48 83 eb 10          	sub    rbx,0x10
   2b256:	e9 47 c9 ff ff       	jmp    27ba2 <JS_CallInternal+0x50e2>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19728
   2b25b:	66 0f ef c0          	pxor   xmm0,xmm0
   2b25f:	b8 08 00 00 00       	mov    eax,0x8
   2b264:	f2 48 0f 2a c1       	cvtsi2sd xmm0,rcx
   2b269:	f2 0f 11 43 e0       	movsd  QWORD PTR [rbx-0x20],xmm0
   2b26e:	e9 db bd ff ff       	jmp    2704e <JS_CallInternal+0x458e>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19733
   2b273:	41 83 fb 08          	cmp    r11d,0x8
   2b277:	0f 84 66 10 00 00    	je     2c2e3 <JS_CallInternal+0x9823>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19733 (discriminator 1)
   2b27d:	83 ff 08             	cmp    edi,0x8
   2b280:	0f 84 2b 0e 00 00    	je     2c0b1 <JS_CallInternal+0x95f1>
JS_IsString():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:653
   2b286:	83 c6 07             	add    esi,0x7
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19752 (discriminator 1)
   2b289:	83 fe 01             	cmp    esi,0x1
   2b28c:	0f 86 94 0f 00 00    	jbe    2c226 <JS_CallInternal+0x9766>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19759
   2b292:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19760
   2b299:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b2a0:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19759
   2b2a3:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19760
   2b2a7:	e8 a4 b3 02 00       	call   56650 <js_add_slow>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19760 (discriminator 1)
   2b2ac:	85 c0                	test   eax,eax
   2b2ae:	0f 85 ac 7f ff ff    	jne    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19762
   2b2b4:	48 83 eb 10          	sub    rbx,0x10
   2b2b8:	e9 99 bd ff ff       	jmp    27056 <JS_CallInternal+0x4596>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19312
   2b2bd:	4d 89 ec             	mov    r12,r13
   2b2c0:	e9 9b 7f ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18274
   2b2c5:	4d 89 d4             	mov    r12,r10
   2b2c8:	e9 93 7f ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20149
   2b2cd:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20150
   2b2d4:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b2db:	44 89 ea             	mov    edx,r13d
   2b2de:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20149
   2b2e1:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20150
   2b2e5:	e8 e6 a7 02 00       	call   55ad0 <js_binary_logic_slow>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20150 (discriminator 1)
   2b2ea:	85 c0                	test   eax,eax
   2b2ec:	0f 85 6e 7f ff ff    	jne    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20152
   2b2f2:	48 83 eb 10          	sub    rbx,0x10
   2b2f6:	e9 82 c3 ff ff       	jmp    2767d <JS_CallInternal+0x4bbd>
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7901
   2b2fb:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b302:	e8 79 7e 00 00       	call   33180 <__js_poll_interrupts>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18918 (discriminator 2)
   2b307:	85 c0                	test   eax,eax
   2b309:	0f 84 ee ce ff ff    	je     281fd <JS_CallInternal+0x573d>
   2b30f:	4d 89 ec             	mov    r12,r13
   2b312:	e9 49 7f ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7901
   2b317:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b31e:	e8 5d 7e 00 00       	call   33180 <__js_poll_interrupts>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18876 (discriminator 2)
   2b323:	85 c0                	test   eax,eax
   2b325:	0f 84 8c d5 ff ff    	je     288b7 <JS_CallInternal+0x5df7>
   2b32b:	4d 89 ec             	mov    r12,r13
   2b32e:	e9 2d 7f ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20294 (discriminator 2)
   2b333:	83 fe 08             	cmp    esi,0x8
   2b336:	0f 84 2c 0f 00 00    	je     2c268 <JS_CallInternal+0x97a8>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20294 (discriminator 8)
   2b33c:	85 f6                	test   esi,esi
   2b33e:	75 09                	jne    2b349 <JS_CallInternal+0x8889>
   2b340:	83 f9 08             	cmp    ecx,0x8
   2b343:	0f 84 57 0f 00 00    	je     2c2a0 <JS_CallInternal+0x97e0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20294 (discriminator 20)
   2b349:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2b350:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b357:	44 89 ea             	mov    edx,r13d
   2b35a:	48 89 de             	mov    rsi,rbx
   2b35d:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   2b361:	e8 1a f6 02 00       	call   5a980 <js_relational_slow>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20294 (discriminator 1)
   2b366:	85 c0                	test   eax,eax
   2b368:	0f 85 f2 7e ff ff    	jne    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20294 (discriminator 22)
   2b36e:	48 83 eb 10          	sub    rbx,0x10
   2b372:	e9 b4 c3 ff ff       	jmp    2772b <JS_CallInternal+0x4c6b>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19780
   2b377:	66 0f ef c0          	pxor   xmm0,xmm0
   2b37b:	b8 08 00 00 00       	mov    eax,0x8
   2b380:	f2 48 0f 2a c2       	cvtsi2sd xmm0,rdx
   2b385:	f2 41 0f 11 45 00    	movsd  QWORD PTR [r13+0x0],xmm0
   2b38b:	e9 5a bc ff ff       	jmp    26fea <JS_CallInternal+0x452a>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18045
   2b390:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19785
   2b394:	83 fa 08             	cmp    edx,0x8
   2b397:	0f 84 e6 12 00 00    	je     2c683 <JS_CallInternal+0x9bc3>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19789
   2b39d:	83 fa f9             	cmp    edx,0xfffffff9
   2b3a0:	0f 84 25 0b 00 00    	je     2becb <JS_CallInternal+0x940b>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19805
   2b3a6:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2b3ad:	4c 89 48 30          	mov    QWORD PTR [rax+0x30],r9
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19806
   2b3b1:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   2b3b5:	83 fa f6             	cmp    edx,0xfffffff6
   2b3b8:	0f 87 26 0b 00 00    	ja     2bee4 <JS_CallInternal+0x9424>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19809
   2b3be:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b3c5:	48 8d b5 70 ff ff ff 	lea    rsi,[rbp-0x90]
   2b3cc:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19806
   2b3d3:	48 89 85 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],rax
   2b3da:	48 89 95 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19807
   2b3e1:	4c 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],r8
   2b3e8:	4c 89 b5 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],r14
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19809
   2b3ef:	e8 5c b2 02 00       	call   56650 <js_add_slow>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19809 (discriminator 1)
   2b3f4:	4c 8b 8d 50 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1b0]
   2b3fb:	85 c0                	test   eax,eax
   2b3fd:	0f 85 e8 17 00 00    	jne    2cbeb <JS_CallInternal+0xa12b>
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   2b403:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   2b407:	66 0f 6f bd 50 ff ff 	movdqa xmm7,XMMWORD PTR [rbp-0xb0]
   2b40e:	ff 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   2b40f:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   2b413:	41 0f 11 7d 00       	movups XMMWORD PTR [r13+0x0],xmm7
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   2b418:	83 fa f6             	cmp    edx,0xfffffff6
   2b41b:	0f 86 d1 bb ff ff    	jbe    26ff2 <JS_CallInternal+0x4532>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   2b421:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2b424:	83 e8 01             	sub    eax,0x1
   2b427:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2b42a:	85 c0                	test   eax,eax
   2b42c:	0f 8f c0 bb ff ff    	jg     26ff2 <JS_CallInternal+0x4532>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   2b432:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b439:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b43d:	e8 5e 14 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2b442:	e9 ab bb ff ff       	jmp    26ff2 <JS_CallInternal+0x4532>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19247
   2b447:	4d 89 ec             	mov    r12,r13
   2b44a:	e9 11 7e ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19482
   2b44f:	41 83 fd fa          	cmp    r13d,0xfffffffa
   2b453:	0f 8d 9b e9 ff ff    	jge    29df4 <JS_CallInternal+0x7334>
   2b459:	41 83 fd f8          	cmp    r13d,0xfffffff8
   2b45d:	0f 8c 91 e9 ff ff    	jl     29df4 <JS_CallInternal+0x7334>
   2b463:	e9 e5 e9 ff ff       	jmp    29e4d <JS_CallInternal+0x738d>
   2b468:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   2b46f:	00 
JS_ThrowTypeErrorNotASymbol():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7838
   2b470:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b477:	48 8d 35 e2 20 0a 00 	lea    rsi,[rip+0xa20e2]        # cd560 <_IO_stdin_used+0x560>
   2b47e:	31 c0                	xor    eax,eax
   2b480:	e8 9b 57 00 00       	call   30c20 <JS_ThrowTypeError>
JS_DefinePrivateField():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:8410
   2b485:	e9 92 b5 ff ff       	jmp    26a1c <JS_CallInternal+0x3f5c>
JS_ThrowTypeErrorNotAnObject():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7817
   2b48a:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b491:	48 8d 35 ba 20 0a 00 	lea    rsi,[rip+0xa20ba]        # cd552 <_IO_stdin_used+0x552>
   2b498:	31 c0                	xor    eax,eax
   2b49a:	e8 81 57 00 00       	call   30c20 <JS_ThrowTypeError>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   2b49f:	83 bd 50 fe ff ff f6 	cmp    DWORD PTR [rbp-0x1b0],0xfffffff6
   2b4a6:	76 13                	jbe    2b4bb <JS_CallInternal+0x89fb>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   2b4a8:	41 8b 45 fc          	mov    eax,DWORD PTR [r13-0x4]
   2b4ac:	83 e8 01             	sub    eax,0x1
   2b4af:	41 89 45 fc          	mov    DWORD PTR [r13-0x4],eax
   2b4b3:	85 c0                	test   eax,eax
   2b4b5:	0f 8e 6c 13 00 00    	jle    2c827 <JS_CallInternal+0x9d67>
JS_SetPrivateField():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:8477
   2b4bb:	41 bd ff ff ff ff    	mov    r13d,0xffffffff
   2b4c1:	e9 80 b6 ff ff       	jmp    26b46 <JS_CallInternal+0x4086>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   2b4c6:	48 8b bd 38 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x1c8]
   2b4cd:	e8 ce 13 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2b4d2:	e9 6c b6 ff ff       	jmp    26b43 <JS_CallInternal+0x4083>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20208
   2b4d7:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20209
   2b4de:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b4e5:	44 89 ea             	mov    edx,r13d
   2b4e8:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20208
   2b4eb:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20209
   2b4ef:	e8 dc a5 02 00       	call   55ad0 <js_binary_logic_slow>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20209 (discriminator 1)
   2b4f4:	85 c0                	test   eax,eax
   2b4f6:	0f 85 64 7d ff ff    	jne    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20211
   2b4fc:	48 83 eb 10          	sub    rbx,0x10
   2b500:	e9 b2 b2 ff ff       	jmp    267b7 <JS_CallInternal+0x3cf7>
JS_ThrowTypeErrorNotAnObject():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7817
   2b505:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b50c:	48 8d 35 3f 20 0a 00 	lea    rsi,[rip+0xa203f]        # cd552 <_IO_stdin_used+0x552>
   2b513:	31 c0                	xor    eax,eax
   2b515:	e8 06 57 00 00       	call   30c20 <JS_ThrowTypeError>
JS_DefinePrivateField():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:8405
   2b51a:	e9 fd b4 ff ff       	jmp    26a1c <JS_CallInternal+0x3f5c>
js_create_array_free():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:9660 (discriminator 1)
   2b51f:	44 8b 95 50 fe ff ff 	mov    r10d,DWORD PTR [rbp-0x1b0]
   2b526:	45 85 d2             	test   r10d,r10d
   2b529:	74 3d                	je     2b568 <JS_CallInternal+0x8aa8>
   2b52b:	4c 8b a5 e8 fe ff ff 	mov    r12,QWORD PTR [rbp-0x118]
   2b532:	4c 89 eb             	mov    rbx,r13
   2b535:	4d 01 ee             	add    r14,r13
   2b538:	eb 09                	jmp    2b543 <JS_CallInternal+0x8a83>
   2b53a:	48 83 c3 10          	add    rbx,0x10
   2b53e:	4c 39 f3             	cmp    rbx,r14
   2b541:	74 25                	je     2b568 <JS_CallInternal+0x8aa8>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:9661
   2b543:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
   2b547:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   2b54a:	83 fa f6             	cmp    edx,0xfffffff6
   2b54d:	76 eb                	jbe    2b53a <JS_CallInternal+0x8a7a>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   2b54f:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2b552:	83 e8 01             	sub    eax,0x1
   2b555:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2b558:	85 c0                	test   eax,eax
   2b55a:	7f de                	jg     2b53a <JS_CallInternal+0x8a7a>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   2b55c:	49 8b 7c 24 10       	mov    rdi,QWORD PTR [r12+0x10]
   2b561:	e8 3a 13 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2b566:	eb d2                	jmp    2b53a <JS_CallInternal+0x8a7a>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18262
   2b568:	4c 8b a5 38 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1c8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18264
   2b56f:	4c 89 eb             	mov    rbx,r13
   2b572:	e9 e9 7c ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   2b577:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b57e:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b582:	e8 19 13 ff ff       	call   1c8a0 <__JS_FreeValueRT>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19287
   2b587:	e9 f3 db ff ff       	jmp    2917f <JS_CallInternal+0x66bf>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   2b58c:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b593:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b597:	e8 04 13 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2b59c:	e9 77 c0 ff ff       	jmp    27618 <JS_CallInternal+0x4b58>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19824
   2b5a1:	66 0f ef c0          	pxor   xmm0,xmm0
   2b5a5:	f2 48 0f 2a c0       	cvtsi2sd xmm0,rax
   2b5aa:	b8 08 00 00 00       	mov    eax,0x8
   2b5af:	f2 0f 11 43 e0       	movsd  QWORD PTR [rbx-0x20],xmm0
   2b5b4:	e9 bd b9 ff ff       	jmp    26f76 <JS_CallInternal+0x44b6>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19829
   2b5b9:	83 fa 08             	cmp    edx,0x8
   2b5bc:	0f 84 7a 13 00 00    	je     2c93c <JS_CallInternal+0x9e7c>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19834
   2b5c2:	83 f8 08             	cmp    eax,0x8
   2b5c5:	0f 85 ec 85 ff ff    	jne    23bb7 <JS_CallInternal+0x10f7>
   2b5cb:	85 d2                	test   edx,edx
   2b5cd:	0f 85 e4 85 ff ff    	jne    23bb7 <JS_CallInternal+0x10f7>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19835
   2b5d3:	66 0f ef c0          	pxor   xmm0,xmm0
   2b5d7:	f2 0f 2a c7          	cvtsi2sd xmm0,edi
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19840
   2b5db:	66 48 0f 6e c9       	movq   xmm1,rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19846
   2b5e0:	f2 0f 5c c1          	subsd  xmm0,xmm1
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19847
   2b5e4:	48 8d 53 f0          	lea    rdx,[rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19830
   2b5e8:	b8 08 00 00 00       	mov    eax,0x8
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19846
   2b5ed:	f2 0f 11 43 e0       	movsd  QWORD PTR [rbx-0x20],xmm0
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19830
   2b5f2:	e9 83 b9 ff ff       	jmp    26f7a <JS_CallInternal+0x44ba>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19057
   2b5f7:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b5fe:	31 c0                	xor    eax,eax
   2b600:	48 8d 35 41 1f 0a 00 	lea    rsi,[rip+0xa1f41]        # cd548 <_IO_stdin_used+0x548>
   2b607:	e8 f4 79 00 00       	call   33000 <JS_ThrowInternalError>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   2b60c:	83 fb f6             	cmp    ebx,0xfffffff6
   2b60f:	76 13                	jbe    2b624 <JS_CallInternal+0x8b64>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   2b611:	41 8b 45 fc          	mov    eax,DWORD PTR [r13-0x4]
   2b615:	83 e8 01             	sub    eax,0x1
   2b618:	41 89 45 fc          	mov    DWORD PTR [r13-0x4],eax
   2b61c:	85 c0                	test   eax,eax
   2b61e:	0f 8e 42 0d 00 00    	jle    2c366 <JS_CallInternal+0x98a6>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19059 (discriminator 1)
   2b624:	4c 89 f3             	mov    rbx,r14
   2b627:	e9 34 7c ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   2b62c:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b633:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
   2b63a:	4c 89 f6             	mov    rsi,r14
   2b63d:	44 89 85 38 fe ff ff 	mov    DWORD PTR [rbp-0x1c8],r8d
   2b644:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b648:	e8 53 12 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2b64d:	44 8b 85 38 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x1c8]
   2b654:	e9 2c b8 ff ff       	jmp    26e85 <JS_CallInternal+0x43c5>
JS_ThrowReferenceErrorUninitialized2():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7862
   2b659:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7851 (discriminator 1)
   2b660:	48 8d 15 33 1e 0a 00 	lea    rdx,[rip+0xa1e33]        # cd49a <_IO_stdin_used+0x49a>
JS_ThrowReferenceErrorUninitialized2():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7862
   2b667:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
   2b66b:	8b 44 08 04          	mov    eax,DWORD PTR [rax+rcx*1+0x4]
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7851
   2b66f:	85 c0                	test   eax,eax
   2b671:	0f 85 e8 12 00 00    	jne    2c95f <JS_CallInternal+0x9e9f>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7851 (discriminator 2)
   2b677:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b67e:	48 8d 35 71 1e 0a 00 	lea    rsi,[rip+0xa1e71]        # cd4f6 <_IO_stdin_used+0x4f6>
   2b685:	31 c0                	xor    eax,eax
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18695
   2b687:	4d 89 ec             	mov    r12,r13
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7851 (discriminator 2)
   2b68a:	e8 81 76 00 00       	call   32d10 <JS_ThrowReferenceError>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18698
   2b68f:	e9 cc 7b ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20420 (discriminator 2)
   2b694:	41 83 f8 08          	cmp    r8d,0x8
   2b698:	0f 84 67 0d 00 00    	je     2c405 <JS_CallInternal+0x9945>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20420 (discriminator 8)
   2b69e:	41 83 f8 ff          	cmp    r8d,0xffffffff
   2b6a2:	0f 84 17 0d 00 00    	je     2c3bf <JS_CallInternal+0x98ff>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20420 (discriminator 14)
   2b6a8:	41 8d 48 fe          	lea    ecx,[r8-0x2]
   2b6ac:	83 f9 01             	cmp    ecx,0x1
   2b6af:	0f 86 5a 16 00 00    	jbe    2cd0f <JS_CallInternal+0xa24f>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20420 (discriminator 21)
   2b6b5:	41 83 f8 f9          	cmp    r8d,0xfffffff9
   2b6b9:	0f 85 c2 0c 00 00    	jne    2c381 <JS_CallInternal+0x98c1>
   2b6bf:	41 83 fe f9          	cmp    r14d,0xfffffff9
   2b6c3:	0f 85 b8 0c 00 00    	jne    2c381 <JS_CallInternal+0x98c1>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20420 (discriminator 23)
   2b6c9:	4c 89 ee             	mov    rsi,r13
   2b6cc:	48 89 95 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rdx
   2b6d3:	4c 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r8
   2b6da:	e8 31 c7 fe ff       	call   17e10 <js_string_eq.isra.0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20420 (discriminator 1)
   2b6df:	48 8b b5 40 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c0]
   2b6e6:	48 8b 95 38 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20420 (discriminator 23)
   2b6ed:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20420 (discriminator 1)
   2b6f3:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b6fa:	e8 01 13 ff ff       	call   1ca00 <JS_FreeValue>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20420 (discriminator 2)
   2b6ff:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b706:	4c 89 ee             	mov    rsi,r13
   2b709:	4c 89 f2             	mov    rdx,r14
   2b70c:	e8 ef 12 ff ff       	call   1ca00 <JS_FreeValue>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   2b711:	8b 85 50 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1b0]
   2b717:	85 c0                	test   eax,eax
   2b719:	0f 95 c0             	setne  al
   2b71c:	0f b6 c0             	movzx  eax,al
   2b71f:	e9 6f c2 ff ff       	jmp    27993 <JS_CallInternal+0x4ed3>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   2b724:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b72b:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b72f:	e8 6c 11 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2b734:	e9 d4 96 ff ff       	jmp    24e0d <JS_CallInternal+0x234d>
JS_ThrowTypeErrorNotASymbol():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7838
   2b739:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b740:	48 8d 35 19 1e 0a 00 	lea    rsi,[rip+0xa1e19]        # cd560 <_IO_stdin_used+0x560>
   2b747:	31 c0                	xor    eax,eax
   2b749:	e8 d2 54 00 00       	call   30c20 <JS_ThrowTypeError>
JS_SetPrivateField():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:8468
   2b74e:	e9 4c fd ff ff       	jmp    2b49f <JS_CallInternal+0x89df>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20363 (discriminator 2)
   2b753:	41 83 fd 08          	cmp    r13d,0x8
   2b757:	0f 84 c5 0f 00 00    	je     2c722 <JS_CallInternal+0x9c62>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20363 (discriminator 9)
   2b75d:	41 83 fd ff          	cmp    r13d,0xffffffff
   2b761:	0f 84 54 0f 00 00    	je     2c6bb <JS_CallInternal+0x9bfb>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20363 (discriminator 16)
   2b767:	41 8d 4d fe          	lea    ecx,[r13-0x2]
   2b76b:	83 f9 01             	cmp    ecx,0x1
   2b76e:	0f 86 d9 0f 00 00    	jbe    2c74d <JS_CallInternal+0x9c8d>
   2b774:	4c 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r8
   2b77b:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20363 (discriminator 23)
   2b782:	41 83 fd f9          	cmp    r13d,0xfffffff9
   2b786:	0f 85 22 e9 ff ff    	jne    2a0ae <JS_CallInternal+0x75ee>
   2b78c:	41 83 f8 f9          	cmp    r8d,0xfffffff9
   2b790:	0f 85 18 e9 ff ff    	jne    2a0ae <JS_CallInternal+0x75ee>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20363 (discriminator 29)
   2b796:	e8 75 c6 fe ff       	call   17e10 <js_string_eq.isra.0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20363 (discriminator 1)
   2b79b:	4c 89 f6             	mov    rsi,r14
   2b79e:	4c 8b b5 e8 fe ff ff 	mov    r14,QWORD PTR [rbp-0x118]
   2b7a5:	4c 89 ea             	mov    rdx,r13
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20363 (discriminator 29)
   2b7a8:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20363 (discriminator 1)
   2b7ae:	4c 89 f7             	mov    rdi,r14
   2b7b1:	e8 4a 12 ff ff       	call   1ca00 <JS_FreeValue>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20363 (discriminator 2)
   2b7b6:	48 8b b5 40 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c0]
   2b7bd:	48 8b 95 38 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c8]
   2b7c4:	4c 89 f7             	mov    rdi,r14
   2b7c7:	e8 34 12 ff ff       	call   1ca00 <JS_FreeValue>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   2b7cc:	8b 85 50 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1b0]
   2b7d2:	85 c0                	test   eax,eax
   2b7d4:	0f 95 c0             	setne  al
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   2b7d7:	e9 79 b1 ff ff       	jmp    26955 <JS_CallInternal+0x3e95>
   2b7dc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18038
   2b7e0:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18036
   2b7e3:	4d 89 ec             	mov    r12,r13
   2b7e6:	e9 75 7a ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20226
   2b7eb:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20227
   2b7f2:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b7f9:	44 89 ea             	mov    edx,r13d
   2b7fc:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20226
   2b7ff:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20227
   2b803:	e8 c8 a2 02 00       	call   55ad0 <js_binary_logic_slow>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20227 (discriminator 1)
   2b808:	85 c0                	test   eax,eax
   2b80a:	0f 85 50 7a ff ff    	jne    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20229
   2b810:	48 83 eb 10          	sub    rbx,0x10
   2b814:	e9 b5 c2 ff ff       	jmp    27ace <JS_CallInternal+0x500e>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18770
   2b819:	48 8b b5 d8 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x128]
   2b820:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b827:	31 c9                	xor    ecx,ecx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18768
   2b829:	4d 89 ec             	mov    r12,r13
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18770
   2b82c:	e8 6f 76 00 00       	call   32ea0 <JS_ThrowReferenceErrorUninitialized2.isra.0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18771
   2b831:	e9 2a 7a ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18757
   2b836:	48 8b b5 d8 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x128]
   2b83d:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b844:	31 c9                	xor    ecx,ecx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18755
   2b846:	4d 89 ec             	mov    r12,r13
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18757
   2b849:	e8 52 76 00 00       	call   32ea0 <JS_ThrowReferenceErrorUninitialized2.isra.0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18758
   2b84e:	e9 0d 7a ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20170
   2b853:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20171
   2b85a:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b861:	48 89 de             	mov    rsi,rbx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20170
   2b864:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20171
   2b868:	e8 93 a0 02 00       	call   55900 <js_shr_slow>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20171 (discriminator 1)
   2b86d:	85 c0                	test   eax,eax
   2b86f:	0f 85 eb 79 ff ff    	jne    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20173
   2b875:	48 83 eb 10          	sub    rbx,0x10
   2b879:	e9 be af ff ff       	jmp    2683c <JS_CallInternal+0x3d7c>
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7901
   2b87e:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b885:	e8 f6 78 00 00       	call   33180 <__js_poll_interrupts>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18851 (discriminator 2)
   2b88a:	85 c0                	test   eax,eax
   2b88c:	0f 84 65 d0 ff ff    	je     288f7 <JS_CallInternal+0x5e37>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18850 (discriminator 1)
   2b892:	4d 89 ec             	mov    r12,r13
   2b895:	e9 c6 79 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20291 (discriminator 2)
   2b89a:	83 fe 08             	cmp    esi,0x8
   2b89d:	0f 84 0d 11 00 00    	je     2c9b0 <JS_CallInternal+0x9ef0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20291 (discriminator 8)
   2b8a3:	83 f9 08             	cmp    ecx,0x8
   2b8a6:	75 08                	jne    2b8b0 <JS_CallInternal+0x8df0>
   2b8a8:	85 f6                	test   esi,esi
   2b8aa:	0f 84 40 11 00 00    	je     2c9f0 <JS_CallInternal+0x9f30>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20291 (discriminator 20)
   2b8b0:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2b8b7:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b8be:	44 89 ea             	mov    edx,r13d
   2b8c1:	48 89 de             	mov    rsi,rbx
   2b8c4:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   2b8c8:	e8 b3 f0 02 00       	call   5a980 <js_relational_slow>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20291 (discriminator 1)
   2b8cd:	85 c0                	test   eax,eax
   2b8cf:	0f 85 8b 79 ff ff    	jne    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20291 (discriminator 22)
   2b8d5:	48 83 eb 10          	sub    rbx,0x10
   2b8d9:	e9 b2 c3 ff ff       	jmp    27c90 <JS_CallInternal+0x51d0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20292 (discriminator 2)
   2b8de:	83 fe 08             	cmp    esi,0x8
   2b8e1:	0f 84 5f 0f 00 00    	je     2c846 <JS_CallInternal+0x9d86>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20292 (discriminator 8)
   2b8e7:	85 f6                	test   esi,esi
   2b8e9:	75 09                	jne    2b8f4 <JS_CallInternal+0x8e34>
   2b8eb:	83 f9 08             	cmp    ecx,0x8
   2b8ee:	0f 84 8a 0f 00 00    	je     2c87e <JS_CallInternal+0x9dbe>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20292 (discriminator 20)
   2b8f4:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2b8fb:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b902:	44 89 ea             	mov    edx,r13d
   2b905:	48 89 de             	mov    rsi,rbx
   2b908:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   2b90c:	e8 6f f0 02 00       	call   5a980 <js_relational_slow>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20292 (discriminator 1)
   2b911:	85 c0                	test   eax,eax
   2b913:	0f 85 47 79 ff ff    	jne    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20292 (discriminator 22)
   2b919:	48 83 eb 10          	sub    rbx,0x10
   2b91d:	e9 5a b8 ff ff       	jmp    2717c <JS_CallInternal+0x46bc>
js_poll_interrupts():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7901
   2b922:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b929:	e8 52 78 00 00       	call   33180 <__js_poll_interrupts>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18856 (discriminator 2)
   2b92e:	85 c0                	test   eax,eax
   2b930:	0f 84 07 c9 ff ff    	je     2823d <JS_CallInternal+0x577d>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18855
   2b936:	4d 89 ec             	mov    r12,r13
   2b939:	e9 22 79 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19301
   2b93e:	4c 89 f3             	mov    rbx,r14
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19297
   2b941:	4d 89 ec             	mov    r12,r13
   2b944:	e9 17 79 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18744
   2b949:	48 8b b5 d8 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x128]
   2b950:	48 8b bd a0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x160]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18741 (discriminator 1)
   2b957:	0f b7 d1             	movzx  edx,cx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18744
   2b95a:	31 c9                	xor    ecx,ecx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18742
   2b95c:	4d 89 ec             	mov    r12,r13
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18744
   2b95f:	e8 3c 75 00 00       	call   32ea0 <JS_ThrowReferenceErrorUninitialized2.isra.0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18745
   2b964:	e9 f7 78 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19528
   2b969:	0f 85 30 11 00 00    	jne    2ca9f <JS_CallInternal+0x9fdf>
is_strict_mode():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2873
   2b96f:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b976:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b97a:	48 8b 87 f0 04 00 00 	mov    rax,QWORD PTR [rdi+0x4f0]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2874
   2b981:	48 85 c0             	test   rax,rax
   2b984:	0f 84 7e 05 00 00    	je     2bf08 <JS_CallInternal+0x9448>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2874 (discriminator 1)
   2b98a:	f6 40 3c 01          	test   BYTE PTR [rax+0x3c],0x1
   2b98e:	0f 84 74 05 00 00    	je     2bf08 <JS_CallInternal+0x9448>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19533
   2b994:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b99b:	44 89 ee             	mov    esi,r13d
   2b99e:	e8 9d 74 00 00       	call   32e40 <JS_ThrowReferenceErrorNotDefined>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3735 (discriminator 1)
   2b9a3:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   2b9aa:	0f 8e b0 78 ff ff    	jle    23260 <JS_CallInternal+0x7a0>
   2b9b0:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b9b7:	44 89 ee             	mov    esi,r13d
   2b9ba:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b9be:	e8 ad da fe ff       	call   19470 <JS_FreeAtom.part.0.isra.0>
   2b9c3:	e9 98 78 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
JS_AtomGetStr():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3601
   2b9c8:	4c 8b b5 e8 fe ff ff 	mov    r14,QWORD PTR [rbp-0x118]
   2b9cf:	48 8d 75 80          	lea    rsi,[rbp-0x80]
   2b9d3:	44 89 ea             	mov    edx,r13d
   2b9d6:	49 8b 7e 10          	mov    rdi,QWORD PTR [r14+0x10]
   2b9da:	e8 31 b9 fe ff       	call   17310 <JS_AtomGetStrRT.constprop.0>
JS_ThrowReferenceErrorNotDefined():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7844 (discriminator 1)
   2b9df:	48 8d 35 a7 1b 0a 00 	lea    rsi,[rip+0xa1ba7]        # cd58d <_IO_stdin_used+0x58d>
   2b9e6:	4c 89 f7             	mov    rdi,r14
JS_AtomGetStr():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3601
   2b9e9:	48 89 c2             	mov    rdx,rax
JS_ThrowReferenceErrorNotDefined():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7844 (discriminator 1)
   2b9ec:	31 c0                	xor    eax,eax
   2b9ee:	e8 1d 73 00 00       	call   32d10 <JS_ThrowReferenceError>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3735 (discriminator 1)
   2b9f3:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   2b9fa:	0f 8e 60 78 ff ff    	jle    23260 <JS_CallInternal+0x7a0>
   2ba00:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ba07:	44 89 ee             	mov    esi,r13d
   2ba0a:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ba0e:	e8 5d da fe ff       	call   19470 <JS_FreeAtom.part.0.isra.0>
   2ba13:	e9 48 78 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   2ba18:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ba1f:	48 89 ce             	mov    rsi,rcx
   2ba22:	4c 89 ea             	mov    rdx,r13
   2ba25:	44 89 85 50 fe ff ff 	mov    DWORD PTR [rbp-0x1b0],r8d
   2ba2c:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ba30:	e8 6b 0e ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2ba35:	44 8b 85 50 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x1b0]
   2ba3c:	e9 68 b4 ff ff       	jmp    26ea9 <JS_CallInternal+0x43e9>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19866
   2ba41:	66 0f ef c0          	pxor   xmm0,xmm0
   2ba45:	f2 48 0f 2a c0       	cvtsi2sd xmm0,rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19895
   2ba4a:	f2 0f 11 43 e0       	movsd  QWORD PTR [rbx-0x20],xmm0
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19896
   2ba4f:	48 8d 53 f0          	lea    rdx,[rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19895
   2ba53:	b8 08 00 00 00       	mov    eax,0x8
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19877
   2ba58:	e9 c1 b4 ff ff       	jmp    26f1e <JS_CallInternal+0x445e>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19876
   2ba5d:	83 fe 08             	cmp    esi,0x8
   2ba60:	0f 84 26 0d 00 00    	je     2c78c <JS_CallInternal+0x9ccc>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19881
   2ba66:	83 f8 08             	cmp    eax,0x8
   2ba69:	0f 85 48 81 ff ff    	jne    23bb7 <JS_CallInternal+0x10f7>
   2ba6f:	85 f6                	test   esi,esi
   2ba71:	0f 85 40 81 ff ff    	jne    23bb7 <JS_CallInternal+0x10f7>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19882
   2ba77:	66 0f ef c9          	pxor   xmm1,xmm1
   2ba7b:	f2 0f 2a c9          	cvtsi2sd xmm1,ecx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19887
   2ba7f:	66 48 0f 6e c2       	movq   xmm0,rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19893
   2ba84:	f2 0f 59 c1          	mulsd  xmm0,xmm1
   2ba88:	eb c0                	jmp    2ba4a <JS_CallInternal+0x8f8a>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18731
   2ba8a:	48 8b b5 d8 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x128]
   2ba91:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18728 (discriminator 1)
   2ba98:	0f b7 d1             	movzx  edx,cx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18731
   2ba9b:	31 c9                	xor    ecx,ecx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18729
   2ba9d:	4d 89 ec             	mov    r12,r13
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18731
   2baa0:	e8 fb 73 00 00       	call   32ea0 <JS_ThrowReferenceErrorUninitialized2.isra.0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18732
   2baa5:	e9 b6 77 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19652
   2baaa:	4c 89 f3             	mov    rbx,r14
   2baad:	e9 ae 77 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6162
   2bab2:	8b 01                	mov    eax,DWORD PTR [rcx]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6155
   2bab4:	25 ff ff ff 03       	and    eax,0x3ffffff
   2bab9:	0f 85 3c b0 ff ff    	jne    26afb <JS_CallInternal+0x403b>
JS_ThrowTypeErrorPrivateNotFound():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:8389
   2babf:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2bac6:	48 8d 0d 77 16 0a 00 	lea    rcx,[rip+0xa1677]        # cd144 <_IO_stdin_used+0x144>
   2bacd:	31 c0                	xor    eax,eax
   2bacf:	48 8d 15 2a 53 0a 00 	lea    rdx,[rip+0xa532a]        # d0e00 <_IO_stdin_used+0x3e00>
   2bad6:	e8 55 53 00 00       	call   30e30 <__JS_ThrowTypeErrorAtom>
   2badb:	e9 bf f9 ff ff       	jmp    2b49f <JS_CallInternal+0x89df>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19870 (discriminator 1)
   2bae0:	09 ca                	or     edx,ecx
   2bae2:	0f 89 29 b4 ff ff    	jns    26f11 <JS_CallInternal+0x4451>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19871
   2bae8:	f2 0f 10 05 70 ef 0a 	movsd  xmm0,QWORD PTR [rip+0xaef70]        # daa60 <typed_array_size_log2+0x28>
   2baef:	00 
   2baf0:	e9 55 ff ff ff       	jmp    2ba4a <JS_CallInternal+0x8f8a>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19583 (discriminator 1)
   2baf5:	39 c2                	cmp    edx,eax
   2baf7:	0f 85 f6 de ff ff    	jne    299f3 <JS_CallInternal+0x6f33>
can_extend_fast_array():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:9959
   2bafd:	0f b6 51 10          	movzx  edx,BYTE PTR [rcx+0x10]
   2bb01:	f7 d2                	not    edx
   2bb03:	83 e2 12             	and    edx,0x12
   2bb06:	0f 85 e7 de ff ff    	jne    299f3 <JS_CallInternal+0x6f33>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:9961
   2bb0c:	48 8b 79 18          	mov    rdi,QWORD PTR [rcx+0x18]
   2bb10:	48 8b 57 30          	mov    rdx,QWORD PTR [rdi+0x30]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:9962
   2bb14:	48 85 d2             	test   rdx,rdx
   2bb17:	74 0a                	je     2bb23 <JS_CallInternal+0x9063>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19583 (discriminator 2)
   2bb19:	f6 42 10 01          	test   BYTE PTR [rdx+0x10],0x1
   2bb1d:	0f 84 d0 de ff ff    	je     299f3 <JS_CallInternal+0x6f33>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19588
   2bb23:	48 8b 71 20          	mov    rsi,QWORD PTR [rcx+0x20]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19588 (discriminator 1)
   2bb27:	44 8b 56 08          	mov    r10d,DWORD PTR [rsi+0x8]
   2bb2b:	45 85 d2             	test   r10d,r10d
   2bb2e:	0f 85 bf de ff ff    	jne    299f3 <JS_CallInternal+0x6f33>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19591
   2bb34:	8d 50 01             	lea    edx,[rax+0x1]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19592 (discriminator 1)
   2bb37:	39 51 28             	cmp    DWORD PTR [rcx+0x28],edx
   2bb3a:	0f 82 b3 de ff ff    	jb     299f3 <JS_CallInternal+0x6f33>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19595
   2bb40:	39 16                	cmp    DWORD PTR [rsi],edx
   2bb42:	73 1c                	jae    2bb60 <JS_CallInternal+0x90a0>
get_shape_prop():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:5138
   2bb44:	44 8b 47 18          	mov    r8d,DWORD PTR [rdi+0x18]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19596 (discriminator 2)
   2bb48:	42 f6 44 87 3f 08    	test   BYTE PTR [rdi+r8*4+0x3f],0x8
   2bb4e:	0f 84 9f de ff ff    	je     299f3 <JS_CallInternal+0x6f33>
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:562
   2bb54:	89 d7                	mov    edi,edx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19598
   2bb56:	45 31 c9             	xor    r9d,r9d
JS_NewInt32():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:562
   2bb59:	48 89 3e             	mov    QWORD PTR [rsi],rdi
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19598
   2bb5c:	4c 89 4e 08          	mov    QWORD PTR [rsi+0x8],r9
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19600
   2bb60:	89 51 38             	mov    DWORD PTR [rcx+0x38],edx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19601
   2bb63:	89 c0                	mov    eax,eax
   2bb65:	f3 0f 6f 73 f0       	movdqu xmm6,XMMWORD PTR [rbx-0x10]
   2bb6a:	48 c1 e0 04          	shl    rax,0x4
   2bb6e:	48 03 41 30          	add    rax,QWORD PTR [rcx+0x30]
   2bb72:	0f 11 30             	movups XMMWORD PTR [rax],xmm6
   2bb75:	e9 92 c5 ff ff       	jmp    2810c <JS_CallInternal+0x564c>
   2bb7a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   2bb80:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bb87:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bb8b:	e8 10 0d ff ff       	call   1c8a0 <__JS_FreeValueRT>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19606
   2bb90:	e9 98 c5 ff ff       	jmp    2812d <JS_CallInternal+0x566d>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   2bb95:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bb9c:	89 8d 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],ecx
   2bba2:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bba6:	e8 f5 0c ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2bbab:	8b 8d 50 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1b0]
   2bbb1:	e9 6d be ff ff       	jmp    27a23 <JS_CallInternal+0x4f63>
   2bbb6:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bbbd:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bbc1:	e8 da 0c ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2bbc6:	e9 14 bc ff ff       	jmp    277df <JS_CallInternal+0x4d1f>
   2bbcb:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bbd2:	4c 89 ee             	mov    rsi,r13
   2bbd5:	4c 89 f2             	mov    rdx,r14
   2bbd8:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bbdc:	e8 bf 0c ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2bbe1:	e9 12 bc ff ff       	jmp    277f8 <JS_CallInternal+0x4d38>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6162
   2bbe6:	8b 01                	mov    eax,DWORD PTR [rcx]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6155
   2bbe8:	25 ff ff ff 03       	and    eax,0x3ffffff
   2bbed:	0f 85 e6 c6 ff ff    	jne    282d9 <JS_CallInternal+0x5819>
JS_AtomGetStr():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3601
   2bbf3:	48 8b bd 28 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x1d8]
   2bbfa:	48 8d 75 80          	lea    rsi,[rbp-0x80]
   2bbfe:	e8 0d b7 fe ff       	call   17310 <JS_AtomGetStrRT.constprop.0>
__JS_ThrowTypeErrorAtom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7738 (discriminator 1)
   2bc03:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2bc0a:	48 8d 35 ef 51 0a 00 	lea    rsi,[rip+0xa51ef]        # d0e00 <_IO_stdin_used+0x3e00>
JS_AtomGetStr():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3601
   2bc11:	48 89 c2             	mov    rdx,rax
__JS_ThrowTypeErrorAtom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7738 (discriminator 1)
   2bc14:	31 c0                	xor    eax,eax
   2bc16:	e8 05 50 00 00       	call   30c20 <JS_ThrowTypeError>
JS_GetPrivateField():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:8448
   2bc1b:	4d 8b 4e 08          	mov    r9,QWORD PTR [r14+0x8]
   2bc1f:	4d 8b 2e             	mov    r13,QWORD PTR [r14]
   2bc22:	31 c9                	xor    ecx,ecx
__JS_ThrowTypeErrorAtom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:8448
   2bc24:	41 b8 06 00 00 00    	mov    r8d,0x6
JS_GetPrivateField():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:8448
   2bc2a:	b8 06 00 00 00       	mov    eax,0x6
   2bc2f:	e9 d8 c6 ff ff       	jmp    2830c <JS_CallInternal+0x584c>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   2bc34:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bc3b:	4c 89 f6             	mov    rsi,r14
   2bc3e:	4c 89 ea             	mov    rdx,r13
   2bc41:	89 8d 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],ecx
   2bc47:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bc4b:	e8 50 0c ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2bc50:	8b 8d 50 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1b0]
   2bc56:	e9 e1 bd ff ff       	jmp    27a3c <JS_CallInternal+0x4f7c>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3735 (discriminator 1)
   2bc5b:	3d f2 00 00 00       	cmp    eax,0xf2
   2bc60:	7e 43                	jle    2bca5 <JS_CallInternal+0x91e5>
   2bc62:	31 d2                	xor    edx,edx
   2bc64:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
__JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3436
   2bc6b:	89 c0                	mov    eax,eax
   2bc6d:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
   2bc71:	48 8b 8f 48 04 00 00 	mov    rcx,QWORD PTR [rdi+0x448]
   2bc78:	48 8b 34 c1          	mov    rsi,QWORD PTR [rcx+rax*8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3437 (discriminator 1)
   2bc7c:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2bc7f:	83 e8 01             	sub    eax,0x1
   2bc82:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2bc85:	85 c0                	test   eax,eax
   2bc87:	7f 13                	jg     2bc9c <JS_CallInternal+0x91dc>
   2bc89:	48 89 95 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3439
   2bc90:	e8 6b 97 fe ff       	call   15400 <JS_FreeAtomStruct>
   2bc95:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
js_import_meta():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:30944
   2bc9c:	48 85 d2             	test   rdx,rdx
   2bc9f:	0f 85 bc 98 ff ff    	jne    25561 <JS_CallInternal+0x2aa1>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:30946
   2bca5:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2bcac:	48 8d 35 15 50 0a 00 	lea    rsi,[rip+0xa5015]        # d0cc8 <_IO_stdin_used+0x3cc8>
   2bcb3:	31 c0                	xor    eax,eax
   2bcb5:	e8 66 4f 00 00       	call   30c20 <JS_ThrowTypeError>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18024
   2bcba:	48 c7 03 00 00 00 00 	mov    QWORD PTR [rbx],0x0
   2bcc1:	48 c7 43 08 06 00 00 	mov    QWORD PTR [rbx+0x8],0x6
   2bcc8:	00 
JS_IsException():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:643
   2bcc9:	e9 5d 97 ff ff       	jmp    2542b <JS_CallInternal+0x296b>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   2bcce:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bcd5:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bcd9:	e8 c2 0b ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2bcde:	e9 29 c4 ff ff       	jmp    2810c <JS_CallInternal+0x564c>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20546
   2bce3:	0f 85 dd 78 ff ff    	jne    235c6 <JS_CallInternal+0xb06>
is_strict_mode():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2873
   2bce9:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2bcf0:	48 8b 47 10          	mov    rax,QWORD PTR [rdi+0x10]
   2bcf4:	48 8b 80 f0 04 00 00 	mov    rax,QWORD PTR [rax+0x4f0]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2874
   2bcfb:	48 85 c0             	test   rax,rax
   2bcfe:	0f 84 17 0b 00 00    	je     2c81b <JS_CallInternal+0x9d5b>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2874 (discriminator 1)
   2bd04:	f6 40 3c 01          	test   BYTE PTR [rax+0x3c],0x1
   2bd08:	0f 84 0d 0b 00 00    	je     2c81b <JS_CallInternal+0x9d5b>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20567
   2bd0e:	8b b5 38 fe ff ff    	mov    esi,DWORD PTR [rbp-0x1c8]
   2bd14:	e8 27 71 00 00       	call   32e40 <JS_ThrowReferenceErrorNotDefined>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20568
   2bd19:	e9 a8 78 ff ff       	jmp    235c6 <JS_CallInternal+0xb06>
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:67 (discriminator 17)
   2bd1e:	8b 52 10             	mov    edx,DWORD PTR [rdx+0x10]
   2bd21:	81 e2 08 00 ff ff    	and    edx,0xffff0008
   2bd27:	81 fa 00 00 01 00    	cmp    edx,0x10000
   2bd2d:	0f 85 95 83 ff ff    	jne    240c8 <JS_CallInternal+0x1608>
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:67 (discriminator 19)
   2bd33:	41 80 7d 10 00       	cmp    BYTE PTR [r13+0x10],0x0
   2bd38:	0f 84 8a 83 ff ff    	je     240c8 <JS_CallInternal+0x1608>
rdi_update():
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_runtime.inc:32
   2bd3e:	49 8b 36             	mov    rsi,QWORD PTR [r14]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:67 (discriminator 21)
   2bd41:	48 c1 f9 04          	sar    rcx,0x4
rdi_update():
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_runtime.inc:32
   2bd45:	4c 39 ee             	cmp    rsi,r13
   2bd48:	74 55                	je     2bd9f <JS_CallInternal+0x92df>
js_dup_shape():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:5305 (discriminator 1)
   2bd4a:	41 83 45 fc 01       	add    DWORD PTR [r13-0x4],0x1
js_free_shape_null():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:5338
   2bd4f:	48 85 f6             	test   rsi,rsi
   2bd52:	74 48                	je     2bd9c <JS_CallInternal+0x92dc>
   2bd54:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:5339
   2bd5b:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bd62:	48 89 8d 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rcx
   2bd69:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bd6d:	4c 89 9d 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r11
   2bd74:	4c 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r8
   2bd7b:	e8 30 25 ff ff       	call   1e2b0 <js_free_shape>
   2bd80:	48 8b 8d 28 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1d8]
   2bd87:	4c 8b 9d 38 fe ff ff 	mov    r11,QWORD PTR [rbp-0x1c8]
   2bd8e:	48 8b 85 40 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c0]
   2bd95:	4c 8b 85 50 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1b0]
rdi_update():
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_runtime.inc:39
   2bd9c:	4d 89 2e             	mov    QWORD PTR [r14],r13
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_runtime.inc:40
   2bd9f:	41 89 4e 08          	mov    DWORD PTR [r14+0x8],ecx
   2bda3:	e9 20 83 ff ff       	jmp    240c8 <JS_CallInternal+0x1608>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19977
   2bda8:	f2 0f 10 05 b0 ec 0a 	movsd  xmm0,QWORD PTR [rip+0xaecb0]        # daa60 <typed_array_size_log2+0x28>
   2bdaf:	00 
   2bdb0:	e9 eb d7 ff ff       	jmp    295a0 <JS_CallInternal+0x6ae0>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   2bdb5:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bdbc:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bdc0:	e8 db 0a ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2bdc5:	e9 fe 78 ff ff       	jmp    236c8 <JS_CallInternal+0xc08>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20564
   2bdca:	0f 85 f6 77 ff ff    	jne    235c6 <JS_CallInternal+0xb06>
is_strict_mode():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2873
   2bdd0:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2bdd7:	48 8b 47 10          	mov    rax,QWORD PTR [rdi+0x10]
   2bddb:	48 8b 80 f0 04 00 00 	mov    rax,QWORD PTR [rax+0x4f0]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2874
   2bde2:	48 85 c0             	test   rax,rax
   2bde5:	0f 84 6b 77 ff ff    	je     23556 <JS_CallInternal+0xa96>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2874 (discriminator 1)
   2bdeb:	f6 40 3c 01          	test   BYTE PTR [rax+0x3c],0x1
   2bdef:	0f 84 61 77 ff ff    	je     23556 <JS_CallInternal+0xa96>
   2bdf5:	e9 14 ff ff ff       	jmp    2bd0e <JS_CallInternal+0x924e>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   2bdfa:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2be01:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2be05:	e8 96 0a ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2be0a:	e9 ab 77 ff ff       	jmp    235ba <JS_CallInternal+0xafa>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:70 (discriminator 17)
   2be0f:	8b 4e 10             	mov    ecx,DWORD PTR [rsi+0x10]
   2be12:	81 e1 08 00 ff ff    	and    ecx,0xffff0008
   2be18:	81 f9 00 00 01 00    	cmp    ecx,0x10000
   2be1e:	0f 85 bd 81 ff ff    	jne    23fe1 <JS_CallInternal+0x1521>
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:70 (discriminator 19)
   2be24:	41 80 7d 10 00       	cmp    BYTE PTR [r13+0x10],0x0
   2be29:	0f 84 b2 81 ff ff    	je     23fe1 <JS_CallInternal+0x1521>
rdi_update():
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_runtime.inc:32
   2be2f:	49 8b 36             	mov    rsi,QWORD PTR [r14]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_opcodes.inc:70 (discriminator 21)
   2be32:	48 c1 f8 04          	sar    rax,0x4
rdi_update():
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_runtime.inc:32
   2be36:	4c 39 ee             	cmp    rsi,r13
   2be39:	74 47                	je     2be82 <JS_CallInternal+0x93c2>
js_dup_shape():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:5305 (discriminator 1)
   2be3b:	41 83 45 fc 01       	add    DWORD PTR [r13-0x4],0x1
js_free_shape_null():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:5338
   2be40:	48 85 f6             	test   rsi,rsi
   2be43:	74 3a                	je     2be7f <JS_CallInternal+0x93bf>
   2be45:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:5339
   2be4c:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2be53:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   2be5a:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2be5e:	48 89 95 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rdx
   2be65:	e8 46 24 ff ff       	call   1e2b0 <js_free_shape>
   2be6a:	48 8b 85 38 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c8]
   2be71:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
   2be78:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
rdi_update():
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_runtime.inc:39
   2be7f:	4d 89 2e             	mov    QWORD PTR [r14],r13
/home/mzyx/read_ic_dequickening_attempt01/M/read_ic_runtime.inc:40
   2be82:	41 89 46 08          	mov    DWORD PTR [r14+0x8],eax
   2be86:	e9 56 81 ff ff       	jmp    23fe1 <JS_CallInternal+0x1521>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19981
   2be8b:	f2 0f 10 05 3d 75 0a 	movsd  xmm0,QWORD PTR [rip+0xa753d]        # d33d0 <__PRETTY_FUNCTION__.0+0xc0>
   2be92:	00 
   2be93:	e9 08 d7 ff ff       	jmp    295a0 <JS_CallInternal+0x6ae0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19411
   2be98:	4d 89 f4             	mov    r12,r14
   2be9b:	e9 c0 73 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19633
   2bea0:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   2bea7:	48 8b 91 88 01 00 00 	mov    rdx,QWORD PTR [rcx+0x188]
   2beae:	48 8b 81 80 01 00 00 	mov    rax,QWORD PTR [rcx+0x180]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   2beb5:	83 fa f6             	cmp    edx,0xfffffff6
   2beb8:	76 04                	jbe    2bebe <JS_CallInternal+0x93fe>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   2beba:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19633
   2bebe:	48 89 43 d0          	mov    QWORD PTR [rbx-0x30],rax
   2bec2:	48 89 53 d8          	mov    QWORD PTR [rbx-0x28],rdx
   2bec6:	e9 c5 b6 ff ff       	jmp    27590 <JS_CallInternal+0x4ad0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19792
   2becb:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19789 (discriminator 1)
   2bed2:	41 83 fe f9          	cmp    r14d,0xfffffff9
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19792
   2bed6:	4c 89 48 30          	mov    QWORD PTR [rax+0x30],r9
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19789 (discriminator 1)
   2beda:	0f 84 13 0d 00 00    	je     2cbf3 <JS_CallInternal+0xa133>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19806
   2bee0:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   2bee4:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
   2bee8:	e9 d1 f4 ff ff       	jmp    2b3be <JS_CallInternal+0x88fe>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   2beed:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   2bef4:	48 89 c6             	mov    rsi,rax
   2bef7:	4c 89 ca             	mov    rdx,r9
   2befa:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
   2befe:	e8 9d 09 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2bf03:	e9 d6 e0 ff ff       	jmp    29fde <JS_CallInternal+0x751e>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3735 (discriminator 1)
   2bf08:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   2bf0f:	0f 8f e0 08 00 00    	jg     2c7f5 <JS_CallInternal+0x9d35>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19537
   2bf15:	b8 03 00 00 00       	mov    eax,0x3
   2bf1a:	31 c9                	xor    ecx,ecx
   2bf1c:	e9 65 c1 ff ff       	jmp    28086 <JS_CallInternal+0x55c6>
js_malloc_rt():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:1811
   2bf21:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bf28:	48 89 95 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rdx
js_build_arguments():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16196
   2bf2f:	48 63 d7             	movsxd rdx,edi
   2bf32:	48 c1 e2 04          	shl    rdx,0x4
   2bf36:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
js_malloc_rt():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:1811
   2bf3d:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bf41:	48 89 d6             	mov    rsi,rdx
   2bf44:	48 89 95 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rdx
   2bf4b:	e8 00 8a fe ff       	call   14950 <__js_malloc>
js_malloc():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:1843 (discriminator 1)
   2bf50:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
   2bf57:	4c 8b 8d 40 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c0]
   2bf5e:	48 85 c0             	test   rax,rax
   2bf61:	48 8b 8d 38 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c8]
   2bf68:	0f 84 56 0b 00 00    	je     2cac4 <JS_CallInternal+0xa004>
   2bf6e:	4c 8b 95 a8 fe ff ff 	mov    r10,QWORD PTR [rbp-0x158]
   2bf75:	31 f6                	xor    esi,esi
js_build_arguments():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16200
   2bf77:	4d 8b 44 32 08       	mov    r8,QWORD PTR [r10+rsi*1+0x8]
   2bf7c:	49 8b 3c 32          	mov    rdi,QWORD PTR [r10+rsi*1]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   2bf80:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   2bf84:	76 04                	jbe    2bf8a <JS_CallInternal+0x94ca>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   2bf86:	83 47 fc 01          	add    DWORD PTR [rdi-0x4],0x1
js_build_arguments():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16200
   2bf8a:	48 89 3c 30          	mov    QWORD PTR [rax+rsi*1],rdi
   2bf8e:	4c 89 44 30 08       	mov    QWORD PTR [rax+rsi*1+0x8],r8
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16199 (discriminator 1)
   2bf93:	48 83 c6 10          	add    rsi,0x10
   2bf97:	48 39 f2             	cmp    rdx,rsi
   2bf9a:	75 db                	jne    2bf77 <JS_CallInternal+0x94b7>
   2bf9c:	e9 45 95 ff ff       	jmp    254e6 <JS_CallInternal+0x2a26>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   2bfa1:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bfa8:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bfac:	e8 ef 08 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2bfb1:	e9 9c da ff ff       	jmp    29a52 <JS_CallInternal+0x6f92>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18823
   2bfb6:	48 8b bd c0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x140]
   2bfbd:	4c 89 ee             	mov    rsi,r13
   2bfc0:	e8 eb 46 ff ff       	call   206b0 <free_var_ref>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18824
   2bfc5:	e9 81 72 ff ff       	jmp    2324b <JS_CallInternal+0x78b>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18310
   2bfca:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2bfd1:	48 8d 35 60 4d 0a 00 	lea    rsi,[rip+0xa4d60]        # d0d38 <_IO_stdin_used+0x3d38>
   2bfd8:	31 c0                	xor    eax,eax
   2bfda:	e8 41 4c 00 00       	call   30c20 <JS_ThrowTypeError>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18311
   2bfdf:	e9 7c 72 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17962
   2bfe4:	8b 85 88 fe ff ff    	mov    eax,DWORD PTR [rbp-0x178]
   2bfea:	83 e8 02             	sub    eax,0x2
   2bfed:	83 f8 01             	cmp    eax,0x1
   2bff0:	0f 87 5b 04 00 00    	ja     2c451 <JS_CallInternal+0x9991>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17963
   2bff6:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bffd:	48 8b 88 80 01 00 00 	mov    rcx,QWORD PTR [rax+0x180]
   2c004:	48 8b 80 88 01 00 00 	mov    rax,QWORD PTR [rax+0x188]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   2c00b:	83 f8 f6             	cmp    eax,0xfffffff6
   2c00e:	0f 86 4e 96 ff ff    	jbe    25662 <JS_CallInternal+0x2ba2>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   2c014:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
   2c018:	e9 45 96 ff ff       	jmp    25662 <JS_CallInternal+0x2ba2>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   2c01d:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c024:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c028:	e8 73 08 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2c02d:	e9 c1 d5 ff ff       	jmp    295f3 <JS_CallInternal+0x6b33>
   2c032:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c039:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   2c040:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
   2c047:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c04b:	e8 50 08 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2c050:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
   2c057:	4c 8b 8d 50 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1b0]
   2c05e:	e9 ed 8e ff ff       	jmp    24f50 <JS_CallInternal+0x2490>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19482
   2c063:	45 85 ed             	test   r13d,r13d
   2c066:	0f 85 7c dd ff ff    	jne    29de8 <JS_CallInternal+0x7328>
   2c06c:	e9 dc dd ff ff       	jmp    29e4d <JS_CallInternal+0x738d>
   2c071:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   2c078:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c07f:	4c 89 c2             	mov    rdx,r8
   2c082:	4c 89 8d 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r9
   2c089:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c08d:	89 8d 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],ecx
   2c093:	e8 08 08 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2c098:	4c 8b 8d 38 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c8]
   2c09f:	48 8b 85 40 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c0]
   2c0a6:	8b 8d 50 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1b0]
   2c0ac:	e9 fe de ff ff       	jmp    29faf <JS_CallInternal+0x74ef>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19738
   2c0b1:	45 85 db             	test   r11d,r11d
   2c0b4:	0f 85 d8 f1 ff ff    	jne    2b292 <JS_CallInternal+0x87d2>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19739
   2c0ba:	66 0f ef c9          	pxor   xmm1,xmm1
   2c0be:	f2 41 0f 2a ca       	cvtsi2sd xmm1,r10d
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19744
   2c0c3:	66 48 0f 6e c0       	movq   xmm0,rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19750
   2c0c8:	f2 0f 58 c1          	addsd  xmm0,xmm1
   2c0cc:	48 c7 43 e8 08 00 00 	mov    QWORD PTR [rbx-0x18],0x8
   2c0d3:	00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19751
   2c0d4:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19750
   2c0d8:	f2 0f 11 43 f0       	movsd  QWORD PTR [rbx-0x10],xmm0
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19734
   2c0dd:	e9 74 af ff ff       	jmp    27056 <JS_CallInternal+0x4596>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   2c0e2:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c0e9:	4c 89 ee             	mov    rsi,r13
   2c0ec:	4c 89 f2             	mov    rdx,r14
   2c0ef:	89 8d 40 fe ff ff    	mov    DWORD PTR [rbp-0x1c0],ecx
   2c0f5:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c0f9:	e8 a2 07 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2c0fe:	8b 8d 40 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c0]
   2c104:	4c 8b 95 50 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1b0]
   2c10b:	e9 5d da ff ff       	jmp    29b6d <JS_CallInternal+0x70ad>
   2c110:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c117:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   2c11e:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c122:	e8 79 07 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2c127:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   2c12e:	e9 4a d4 ff ff       	jmp    2957d <JS_CallInternal+0x6abd>
JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:689
   2c133:	83 f9 f6             	cmp    ecx,0xfffffff6
   2c136:	0f 86 ef f3 ff ff    	jbe    2b52b <JS_CallInternal+0x8a6b>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:691
   2c13c:	41 8b 40 fc          	mov    eax,DWORD PTR [r8-0x4]
   2c140:	83 e8 01             	sub    eax,0x1
   2c143:	41 89 40 fc          	mov    DWORD PTR [r8-0x4],eax
   2c147:	85 c0                	test   eax,eax
   2c149:	0f 8f dc f3 ff ff    	jg     2b52b <JS_CallInternal+0x8a6b>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   2c14f:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c156:	4c 89 c6             	mov    rsi,r8
   2c159:	48 89 ca             	mov    rdx,rcx
   2c15c:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c160:	e8 3b 07 ff ff       	call   1c8a0 <__JS_FreeValueRT>
js_create_array_free():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:9660 (discriminator 1)
   2c165:	e9 c1 f3 ff ff       	jmp    2b52b <JS_CallInternal+0x8a6b>
JS_NewFloat64():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:609
   2c16a:	89 c8                	mov    eax,ecx
   2c16c:	31 d2                	xor    edx,edx
   2c16e:	e9 7c b1 ff ff       	jmp    272ef <JS_CallInternal+0x482f>
JS_AtomGetStr():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3601
   2c173:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   2c17a:	48 8d 45 80          	lea    rax,[rbp-0x80]
   2c17e:	89 f2                	mov    edx,esi
   2c180:	48 89 c6             	mov    rsi,rax
   2c183:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
   2c187:	e8 84 b1 fe ff       	call   17310 <JS_AtomGetStrRT.constprop.0>
   2c18c:	48 89 c2             	mov    rdx,rax
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3601
   2c18f:	e9 24 83 ff ff       	jmp    244b8 <JS_CallInternal+0x19f8>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   2c194:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c19b:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   2c1a2:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c1a6:	e8 f5 06 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2c1ab:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   2c1b2:	e9 4b d6 ff ff       	jmp    29802 <JS_CallInternal+0x6d42>
find_own_property():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6162
   2c1b7:	8b 12                	mov    edx,DWORD PTR [rdx]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6155
   2c1b9:	81 e2 ff ff ff 03    	and    edx,0x3ffffff
   2c1bf:	0f 85 8f ab ff ff    	jne    26d54 <JS_CallInternal+0x4294>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6165
   2c1c5:	31 d2                	xor    edx,edx
   2c1c7:	e9 98 ab ff ff       	jmp    26d64 <JS_CallInternal+0x42a4>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   2c1cc:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c1d3:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c1d7:	e8 c4 06 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2c1dc:	e9 d5 b2 ff ff       	jmp    274b6 <JS_CallInternal+0x49f6>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19491
   2c1e1:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c1e8:	48 8d 35 88 13 0a 00 	lea    rsi,[rip+0xa1388]        # cd577 <_IO_stdin_used+0x577>
   2c1ef:	31 c0                	xor    eax,eax
   2c1f1:	e8 2a 4a 00 00       	call   30c20 <JS_ThrowTypeError>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19492
   2c1f6:	e9 65 70 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20293 (discriminator 10)
   2c1fb:	66 0f ef c9          	pxor   xmm1,xmm1
   2c1ff:	f2 0f 2a ca          	cvtsi2sd xmm1,edx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20293 (discriminator 14)
   2c203:	66 48 0f 6e c0       	movq   xmm0,rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20293 (discriminator 19)
   2c208:	31 c0                	xor    eax,eax
   2c20a:	66 0f 2f c8          	comisd xmm1,xmm0
   2c20e:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   2c215:	00 
   2c216:	0f 97 c0             	seta   al
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20293 (discriminator 1)
   2c219:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20293 (discriminator 19)
   2c21d:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20293
   2c221:	e9 7c b9 ff ff       	jmp    27ba2 <JS_CallInternal+0x50e2>
JS_IsString():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:653
   2c226:	83 c1 07             	add    ecx,0x7
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19752 (discriminator 1)
   2c229:	83 f9 01             	cmp    ecx,0x1
   2c22c:	0f 87 60 f0 ff ff    	ja     2b292 <JS_CallInternal+0x87d2>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19753
   2c232:	4c 89 c1             	mov    rcx,r8
   2c235:	49 89 f8             	mov    r8,rdi
   2c238:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c23f:	4c 89 d6             	mov    rsi,r10
   2c242:	4c 89 da             	mov    rdx,r11
   2c245:	e8 26 45 01 00       	call   40770 <JS_ConcatString>
   2c24a:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19754
   2c24e:	48 8d 43 f0          	lea    rax,[rbx-0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19753
   2c252:	48 89 53 e8          	mov    QWORD PTR [rbx-0x18],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19755 (discriminator 1)
   2c256:	83 7b e8 06          	cmp    DWORD PTR [rbx-0x18],0x6
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19754
   2c25a:	48 89 c3             	mov    rbx,rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19755 (discriminator 1)
   2c25d:	0f 85 f3 ad ff ff    	jne    27056 <JS_CallInternal+0x4596>
   2c263:	e9 f8 6f ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20294 (discriminator 7)
   2c268:	66 48 0f 6e ca       	movq   xmm1,rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20294 (discriminator 12)
   2c26d:	83 f9 08             	cmp    ecx,0x8
   2c270:	74 36                	je     2c2a8 <JS_CallInternal+0x97e8>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20294 (discriminator 15)
   2c272:	85 c9                	test   ecx,ecx
   2c274:	0f 85 cf f0 ff ff    	jne    2b349 <JS_CallInternal+0x8889>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20294 (discriminator 17)
   2c27a:	66 0f ef c0          	pxor   xmm0,xmm0
   2c27e:	f2 0f 2a c0          	cvtsi2sd xmm0,eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20294 (discriminator 19)
   2c282:	31 c0                	xor    eax,eax
   2c284:	66 0f 2f c8          	comisd xmm1,xmm0
   2c288:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   2c28f:	00 
   2c290:	0f 93 c0             	setae  al
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20294 (discriminator 1)
   2c293:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20294 (discriminator 19)
   2c297:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20294
   2c29b:	e9 8b b4 ff ff       	jmp    2772b <JS_CallInternal+0x4c6b>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20294 (discriminator 10)
   2c2a0:	66 0f ef c9          	pxor   xmm1,xmm1
   2c2a4:	f2 0f 2a ca          	cvtsi2sd xmm1,edx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20294 (discriminator 14)
   2c2a8:	66 48 0f 6e c0       	movq   xmm0,rax
   2c2ad:	eb d3                	jmp    2c282 <JS_CallInternal+0x97c2>
JS_ThrowTypeErrorNotAnObject():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7817
   2c2af:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c2b6:	48 8d 35 95 12 0a 00 	lea    rsi,[rip+0xa1295]        # cd552 <_IO_stdin_used+0x552>
   2c2bd:	31 c0                	xor    eax,eax
   2c2bf:	e8 5c 49 00 00       	call   30c20 <JS_ThrowTypeError>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19665
   2c2c4:	e9 97 6f ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18298
   2c2c9:	48 8b bd a0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x160]
   2c2d0:	48 8d 35 21 4a 0a 00 	lea    rsi,[rip+0xa4a21]        # d0cf8 <_IO_stdin_used+0x3cf8>
   2c2d7:	31 c0                	xor    eax,eax
   2c2d9:	e8 42 49 00 00       	call   30c20 <JS_ThrowTypeError>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18299
   2c2de:	e9 7d 6f ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19737
   2c2e3:	66 49 0f 6e ca       	movq   xmm1,r10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19743
   2c2e8:	83 ff 08             	cmp    edi,0x8
   2c2eb:	0f 84 d2 fd ff ff    	je     2c0c3 <JS_CallInternal+0x9603>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19745
   2c2f1:	85 ff                	test   edi,edi
   2c2f3:	0f 85 99 ef ff ff    	jne    2b292 <JS_CallInternal+0x87d2>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19746
   2c2f9:	66 0f ef c0          	pxor   xmm0,xmm0
   2c2fd:	f2 41 0f 2a c0       	cvtsi2sd xmm0,r8d
   2c302:	e9 c1 fd ff ff       	jmp    2c0c8 <JS_CallInternal+0x9608>
js_iterator_get_value_done():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16774
   2c307:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c30e:	48 8d 35 cb 4a 0a 00 	lea    rsi,[rip+0xa4acb]        # d0de0 <_IO_stdin_used+0x3de0>
   2c315:	31 c0                	xor    eax,eax
   2c317:	e8 04 49 00 00       	call   30c20 <JS_ThrowTypeError>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16775
   2c31c:	e9 3f 6f ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20293 (discriminator 7)
   2c321:	66 48 0f 6e ca       	movq   xmm1,rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20293 (discriminator 12)
   2c326:	83 f9 08             	cmp    ecx,0x8
   2c329:	0f 84 d4 fe ff ff    	je     2c203 <JS_CallInternal+0x9743>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20293 (discriminator 15)
   2c32f:	85 c9                	test   ecx,ecx
   2c331:	0f 85 f6 ee ff ff    	jne    2b22d <JS_CallInternal+0x876d>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20293 (discriminator 17)
   2c337:	66 0f ef c0          	pxor   xmm0,xmm0
   2c33b:	f2 0f 2a c0          	cvtsi2sd xmm0,eax
   2c33f:	e9 c4 fe ff ff       	jmp    2c208 <JS_CallInternal+0x9748>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20464
   2c344:	4d 89 ec             	mov    r12,r13
   2c347:	e9 14 6f ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
js_operator_in():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:15955
   2c34c:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c353:	48 8d 35 47 12 0a 00 	lea    rsi,[rip+0xa1247]        # cd5a1 <_IO_stdin_used+0x5a1>
   2c35a:	31 c0                	xor    eax,eax
   2c35c:	e8 bf 48 00 00       	call   30c20 <JS_ThrowTypeError>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:15956
   2c361:	e9 fa 6e ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   2c366:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c36d:	4c 89 ee             	mov    rsi,r13
   2c370:	48 89 da             	mov    rdx,rbx
   2c373:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c377:	e8 24 05 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2c37c:	e9 a3 f2 ff ff       	jmp    2b624 <JS_CallInternal+0x8b64>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20420 (discriminator 24)
   2c381:	4d 89 c1             	mov    r9,r8
   2c384:	48 89 d7             	mov    rdi,rdx
   2c387:	45 31 c0             	xor    r8d,r8d
   2c38a:	4c 89 ea             	mov    rdx,r13
   2c38d:	4c 89 ce             	mov    rsi,r9
   2c390:	4c 89 f1             	mov    rcx,r14
   2c393:	48 89 bd 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rdi
   2c39a:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   2c3a1:	e8 2a e1 fe ff       	call   1a4d0 <js_strict_eq2.isra.0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20420 (discriminator 1)
   2c3a6:	48 8b b5 38 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c8]
   2c3ad:	48 8b 95 40 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c0]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20420 (discriminator 24)
   2c3b4:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20420 (discriminator 1)
   2c3ba:	e9 34 f3 ff ff       	jmp    2b6f3 <JS_CallInternal+0x8c33>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20420 (discriminator 16)
   2c3bf:	31 c0                	xor    eax,eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20420 (discriminator 13)
   2c3c1:	41 83 fe ff          	cmp    r14d,0xffffffff
   2c3c5:	75 08                	jne    2c3cf <JS_CallInternal+0x990f>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20420 (discriminator 15)
   2c3c7:	31 c0                	xor    eax,eax
   2c3c9:	4c 39 ea             	cmp    rdx,r13
   2c3cc:	0f 94 c0             	sete   al
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20420 (discriminator 18)
   2c3cf:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c3d6:	48 89 d6             	mov    rsi,rdx
   2c3d9:	4c 89 c2             	mov    rdx,r8
   2c3dc:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   2c3e2:	e8 19 06 ff ff       	call   1ca00 <JS_FreeValue>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20420 (discriminator 1)
   2c3e7:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c3ee:	4c 89 ee             	mov    rsi,r13
   2c3f1:	4c 89 f2             	mov    rdx,r14
   2c3f4:	e8 07 06 ff ff       	call   1ca00 <JS_FreeValue>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   2c3f9:	48 63 85 50 fe ff ff 	movsxd rax,DWORD PTR [rbp-0x1b0]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   2c400:	e9 8e b5 ff ff       	jmp    27993 <JS_CallInternal+0x4ed3>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20420 (discriminator 7)
   2c405:	45 85 f6             	test   r14d,r14d
   2c408:	0f 85 a0 01 00 00    	jne    2c5ae <JS_CallInternal+0x9aee>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20420 (discriminator 9)
   2c40e:	66 0f ef c0          	pxor   xmm0,xmm0
   2c412:	66 48 0f 6e e2       	movq   xmm4,rdx
   2c417:	31 c0                	xor    eax,eax
   2c419:	ba 00 00 00 00       	mov    edx,0x0
   2c41e:	f2 41 0f 2a c5       	cvtsi2sd xmm0,r13d
   2c423:	66 0f 2e c4          	ucomisd xmm0,xmm4
   2c427:	0f 9b c0             	setnp  al
   2c42a:	48 0f 45 c2          	cmovne rax,rdx
   2c42e:	e9 60 b5 ff ff       	jmp    27993 <JS_CallInternal+0x4ed3>
JS_AtomGetStr():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3601
   2c433:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   2c43a:	89 c2                	mov    edx,eax
   2c43c:	48 8d 75 80          	lea    rsi,[rbp-0x80]
   2c440:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
   2c444:	e8 c7 ae fe ff       	call   17310 <JS_AtomGetStrRT.constprop.0>
   2c449:	48 89 c2             	mov    rdx,rax
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3601
   2c44c:	e9 b0 e9 ff ff       	jmp    2ae01 <JS_CallInternal+0x8341>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17965
   2c451:	48 8b b5 78 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x188]
   2c458:	48 8b 95 88 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x178]
   2c45f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c466:	e8 65 c0 01 00       	call   484d0 <JS_ToObject>
   2c46b:	48 89 c1             	mov    rcx,rax
   2c46e:	48 89 d0             	mov    rax,rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17966 (discriminator 1)
   2c471:	83 fa 06             	cmp    edx,0x6
   2c474:	0f 85 e8 91 ff ff    	jne    25662 <JS_CallInternal+0x2ba2>
   2c47a:	e9 e1 6d ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
   2c47f:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   2c486:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c48d:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   2c494:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c498:	e8 03 04 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2c49d:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
   2c4a4:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   2c4ab:	e9 95 d9 ff ff       	jmp    29e45 <JS_CallInternal+0x7385>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19710
   2c4b0:	4d 89 ec             	mov    r12,r13
   2c4b3:	e9 a8 6d ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20364 (discriminator 22)
   2c4b8:	41 8d 50 fe          	lea    edx,[r8-0x2]
   2c4bc:	83 fa 01             	cmp    edx,0x1
   2c4bf:	0f 86 bb 06 00 00    	jbe    2cb80 <JS_CallInternal+0xa0c0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20364 (discriminator 25)
   2c4c5:	83 c0 01             	add    eax,0x1
   2c4c8:	0f 85 12 dc ff ff    	jne    2a0e0 <JS_CallInternal+0x7620>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20364 (discriminator 26)
   2c4ce:	41 0f b6 41 11       	movzx  eax,BYTE PTR [r9+0x11]
   2c4d3:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c4da:	4c 89 c2             	mov    rdx,r8
   2c4dd:	83 e0 01             	and    eax,0x1
   2c4e0:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   2c4e6:	e8 15 05 ff ff       	call   1ca00 <JS_FreeValue>
   2c4eb:	8b 85 50 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1b0]
   2c4f1:	e9 ff a3 ff ff       	jmp    268f5 <JS_CallInternal+0x3e35>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20364 (discriminator 15)
   2c4f6:	41 8d 50 fe          	lea    edx,[r8-0x2]
   2c4fa:	83 fa 01             	cmp    edx,0x1
   2c4fd:	0f 86 87 06 00 00    	jbe    2cb8a <JS_CallInternal+0xa0ca>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20364 (discriminator 18)
   2c503:	83 c0 01             	add    eax,0x1
   2c506:	0f 85 d4 db ff ff    	jne    2a0e0 <JS_CallInternal+0x7620>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20364 (discriminator 19)
   2c50c:	31 c0                	xor    eax,eax
   2c50e:	4d 39 ce             	cmp    r14,r9
   2c511:	4c 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r8
   2c518:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   2c51f:	0f 94 c0             	sete   al
   2c522:	e9 91 eb ff ff       	jmp    2b0b8 <JS_CallInternal+0x85f8>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20364 (discriminator 8)
   2c527:	45 85 c0             	test   r8d,r8d
   2c52a:	0f 85 eb 00 00 00    	jne    2c61b <JS_CallInternal+0x9b5b>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20364 (discriminator 10)
   2c530:	66 0f ef c0          	pxor   xmm0,xmm0
   2c534:	66 49 0f 6e ce       	movq   xmm1,r14
   2c539:	31 d2                	xor    edx,edx
   2c53b:	f2 41 0f 2a c1       	cvtsi2sd xmm0,r9d
   2c540:	66 0f 2e c1          	ucomisd xmm0,xmm1
   2c544:	0f 9b c2             	setnp  dl
   2c547:	0f 44 c2             	cmove  eax,edx
   2c54a:	e9 a6 a3 ff ff       	jmp    268f5 <JS_CallInternal+0x3e35>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20705
   2c54f:	48 8b 85 c0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x140]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20707
   2c556:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20706
   2c55d:	31 d2                	xor    edx,edx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20705
   2c55f:	f3 0f 6f 90 d8 04 00 	movdqu xmm2,XMMWORD PTR [rax+0x4d8]
   2c566:	00 
   2c567:	0f 11 53 f0          	movups XMMWORD PTR [rbx-0x10],xmm2
   2c56b:	0f 29 95 50 fe ff ff 	movaps XMMWORD PTR [rbp-0x1b0],xmm2
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20706
   2c572:	48 89 90 d8 04 00 00 	mov    QWORD PTR [rax+0x4d8],rdx
   2c579:	48 c7 80 e0 04 00 00 	mov    QWORD PTR [rax+0x4e0],0x4
   2c580:	04 00 00 00 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20707
   2c584:	49 63 c5             	movsxd rax,r13d
   2c587:	48 03 41 18          	add    rax,QWORD PTR [rcx+0x18]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20708
   2c58b:	e9 f1 67 ff ff       	jmp    22d81 <JS_CallInternal+0x2c1>
JS_AtomGetStr():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3601
   2c590:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   2c597:	89 c2                	mov    edx,eax
   2c599:	48 8d 75 80          	lea    rsi,[rbp-0x80]
   2c59d:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
   2c5a1:	e8 6a ad fe ff       	call   17310 <JS_AtomGetStrRT.constprop.0>
   2c5a6:	48 89 c2             	mov    rdx,rax
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3601
   2c5a9:	e9 8e e8 ff ff       	jmp    2ae3c <JS_CallInternal+0x837c>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20420 (discriminator 10)
   2c5ae:	41 83 fe 08          	cmp    r14d,0x8
   2c5b2:	0f 85 1a 06 00 00    	jne    2cbd2 <JS_CallInternal+0xa112>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20420 (discriminator 11)
   2c5b8:	66 48 0f 6e c2       	movq   xmm0,rdx
   2c5bd:	66 49 0f 6e ed       	movq   xmm5,r13
   2c5c2:	31 c0                	xor    eax,eax
   2c5c4:	ba 00 00 00 00       	mov    edx,0x0
   2c5c9:	66 0f 2e c5          	ucomisd xmm0,xmm5
   2c5cd:	0f 9b c0             	setnp  al
   2c5d0:	48 0f 45 c2          	cmovne rax,rdx
   2c5d4:	e9 ba b3 ff ff       	jmp    27993 <JS_CallInternal+0x4ed3>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   2c5d9:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c5e0:	48 89 ce             	mov    rsi,rcx
   2c5e3:	48 89 da             	mov    rdx,rbx
   2c5e6:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c5ea:	e8 b1 02 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2c5ef:	e9 54 db ff ff       	jmp    2a148 <JS_CallInternal+0x7688>
   2c5f4:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c5fb:	4c 89 c6             	mov    rsi,r8
   2c5fe:	4c 89 e2             	mov    rdx,r12
   2c601:	89 8d 40 fe ff ff    	mov    DWORD PTR [rbp-0x1c0],ecx
   2c607:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c60b:	e8 90 02 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2c610:	8b 8d 40 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c0]
   2c616:	e9 e2 c8 ff ff       	jmp    28efd <JS_CallInternal+0x643d>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20364 (discriminator 11)
   2c61b:	41 83 f8 08          	cmp    r8d,0x8
   2c61f:	0f 85 bb da ff ff    	jne    2a0e0 <JS_CallInternal+0x7620>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20364 (discriminator 12)
   2c625:	66 49 0f 6e c6       	movq   xmm0,r14
   2c62a:	66 49 0f 6e d1       	movq   xmm2,r9
   2c62f:	31 c0                	xor    eax,eax
   2c631:	ba 00 00 00 00       	mov    edx,0x0
   2c636:	66 0f 2e c2          	ucomisd xmm0,xmm2
   2c63a:	0f 9b c0             	setnp  al
   2c63d:	0f 45 c2             	cmovne eax,edx
   2c640:	e9 b0 a2 ff ff       	jmp    268f5 <JS_CallInternal+0x3e35>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   2c645:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c64c:	48 8b 95 38 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c8]
   2c653:	48 89 ce             	mov    rsi,rcx
   2c656:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c65a:	e8 41 02 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2c65f:	e9 0b db ff ff       	jmp    2a16f <JS_CallInternal+0x76af>
   2c664:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c66b:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
   2c672:	4c 89 ee             	mov    rsi,r13
   2c675:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c679:	e8 22 02 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2c67e:	e9 b5 a3 ff ff       	jmp    26a38 <JS_CallInternal+0x3f78>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19785 (discriminator 1)
   2c683:	41 83 fe 08          	cmp    r14d,0x8
   2c687:	0f 84 89 03 00 00    	je     2ca16 <JS_CallInternal+0x9f56>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19805
   2c68d:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2c694:	4c 89 48 30          	mov    QWORD PTR [rax+0x30],r9
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19806
   2c698:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   2c69c:	e9 1d ed ff ff       	jmp    2b3be <JS_CallInternal+0x88fe>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18336
   2c6a1:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c6a8:	48 8d 35 19 0e 0a 00 	lea    rsi,[rip+0xa0e19]        # cd4c8 <_IO_stdin_used+0x4c8>
   2c6af:	31 c0                	xor    eax,eax
   2c6b1:	e8 6a 45 00 00       	call   30c20 <JS_ThrowTypeError>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18337
   2c6b6:	e9 a5 6b ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20363 (discriminator 15)
   2c6bb:	41 8d 50 fe          	lea    edx,[r8-0x2]
   2c6bf:	83 fa 01             	cmp    edx,0x1
   2c6c2:	0f 86 6c 03 00 00    	jbe    2ca34 <JS_CallInternal+0x9f74>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20363 (discriminator 18)
   2c6c8:	83 c0 01             	add    eax,0x1
   2c6cb:	0f 85 dd d9 ff ff    	jne    2a0ae <JS_CallInternal+0x75ee>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20363 (discriminator 19)
   2c6d1:	4d 39 ce             	cmp    r14,r9
   2c6d4:	4c 89 f6             	mov    rsi,r14
   2c6d7:	4c 8b b5 e8 fe ff ff 	mov    r14,QWORD PTR [rbp-0x118]
   2c6de:	4c 89 ea             	mov    rdx,r13
   2c6e1:	0f 94 c0             	sete   al
   2c6e4:	4c 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r8
   2c6eb:	4c 89 f7             	mov    rdi,r14
   2c6ee:	88 85 50 fe ff ff    	mov    BYTE PTR [rbp-0x1b0],al
   2c6f4:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   2c6fb:	e8 00 03 ff ff       	call   1ca00 <JS_FreeValue>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20363 (discriminator 1)
   2c700:	48 8b b5 40 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c0]
   2c707:	48 8b 95 38 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c8]
   2c70e:	4c 89 f7             	mov    rdi,r14
   2c711:	e8 ea 02 ff ff       	call   1ca00 <JS_FreeValue>
   2c716:	0f b6 85 50 fe ff ff 	movzx  eax,BYTE PTR [rbp-0x1b0]
   2c71d:	e9 33 a2 ff ff       	jmp    26955 <JS_CallInternal+0x3e95>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20363 (discriminator 8)
   2c722:	45 85 c0             	test   r8d,r8d
   2c725:	0f 85 84 00 00 00    	jne    2c7af <JS_CallInternal+0x9cef>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20363 (discriminator 10)
   2c72b:	66 0f ef c0          	pxor   xmm0,xmm0
   2c72f:	66 49 0f 6e ee       	movq   xmm5,r14
   2c734:	ba 00 00 00 00       	mov    edx,0x0
   2c739:	f2 41 0f 2a c1       	cvtsi2sd xmm0,r9d
   2c73e:	66 0f 2e c5          	ucomisd xmm0,xmm5
   2c742:	0f 9b c0             	setnp  al
   2c745:	0f 45 c2             	cmovne eax,edx
   2c748:	e9 08 a2 ff ff       	jmp    26955 <JS_CallInternal+0x3e95>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20363 (discriminator 22)
   2c74d:	41 8d 50 fe          	lea    edx,[r8-0x2]
   2c751:	83 fa 01             	cmp    edx,0x1
   2c754:	0f 86 06 03 00 00    	jbe    2ca60 <JS_CallInternal+0x9fa0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20363 (discriminator 25)
   2c75a:	83 c0 01             	add    eax,0x1
   2c75d:	0f 85 4b d9 ff ff    	jne    2a0ae <JS_CallInternal+0x75ee>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20363 (discriminator 26)
   2c763:	41 0f b6 41 11       	movzx  eax,BYTE PTR [r9+0x11]
   2c768:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c76f:	4c 89 c2             	mov    rdx,r8
   2c772:	83 e0 01             	and    eax,0x1
   2c775:	88 85 50 fe ff ff    	mov    BYTE PTR [rbp-0x1b0],al
   2c77b:	e8 80 02 ff ff       	call   1ca00 <JS_FreeValue>
   2c780:	0f b6 85 50 fe ff ff 	movzx  eax,BYTE PTR [rbp-0x1b0]
   2c787:	e9 c9 a1 ff ff       	jmp    26955 <JS_CallInternal+0x3e95>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19880
   2c78c:	66 48 0f 6e c9       	movq   xmm1,rcx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19886
   2c791:	83 f8 08             	cmp    eax,0x8
   2c794:	0f 84 e5 f2 ff ff    	je     2ba7f <JS_CallInternal+0x8fbf>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19888
   2c79a:	85 c0                	test   eax,eax
   2c79c:	0f 85 15 74 ff ff    	jne    23bb7 <JS_CallInternal+0x10f7>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19889
   2c7a2:	66 0f ef c0          	pxor   xmm0,xmm0
   2c7a6:	f2 0f 2a c2          	cvtsi2sd xmm0,edx
   2c7aa:	e9 d5 f2 ff ff       	jmp    2ba84 <JS_CallInternal+0x8fc4>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20363 (discriminator 11)
   2c7af:	41 83 f8 08          	cmp    r8d,0x8
   2c7b3:	0f 85 f5 d8 ff ff    	jne    2a0ae <JS_CallInternal+0x75ee>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20363 (discriminator 12)
   2c7b9:	66 49 0f 6e c6       	movq   xmm0,r14
   2c7be:	66 49 0f 6e f1       	movq   xmm6,r9
   2c7c3:	ba 00 00 00 00       	mov    edx,0x0
   2c7c8:	66 0f 2e c6          	ucomisd xmm0,xmm6
   2c7cc:	0f 9b c0             	setnp  al
   2c7cf:	0f 45 c2             	cmovne eax,edx
   2c7d2:	e9 7e a1 ff ff       	jmp    26955 <JS_CallInternal+0x3e95>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18013
   2c7d7:	31 c0                	xor    eax,eax
   2c7d9:	48 c7 43 08 03 00 00 	mov    QWORD PTR [rbx+0x8],0x3
   2c7e0:	00 
   2c7e1:	48 89 03             	mov    QWORD PTR [rbx],rax
   2c7e4:	e9 96 8b ff ff       	jmp    2537f <JS_CallInternal+0x28bf>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17992
   2c7e9:	48 89 03             	mov    QWORD PTR [rbx],rax
   2c7ec:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17993
   2c7f0:	e9 36 8c ff ff       	jmp    2542b <JS_CallInternal+0x296b>
__JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3436
   2c7f5:	48 8b 87 48 04 00 00 	mov    rax,QWORD PTR [rdi+0x448]
   2c7fc:	4a 8b 34 e8          	mov    rsi,QWORD PTR [rax+r13*8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3437 (discriminator 1)
   2c800:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2c803:	83 e8 01             	sub    eax,0x1
   2c806:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2c809:	85 c0                	test   eax,eax
   2c80b:	0f 8f 04 f7 ff ff    	jg     2bf15 <JS_CallInternal+0x9455>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3439
   2c811:	e8 ea 8b fe ff       	call   15400 <JS_FreeAtomStruct>
JS_IsException():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:643
   2c816:	e9 fa f6 ff ff       	jmp    2bf15 <JS_CallInternal+0x9455>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20552
   2c81b:	b8 03 00 00 00       	mov    eax,0x3
   2c820:	31 c9                	xor    ecx,ecx
   2c822:	e9 13 6e ff ff       	jmp    2363a <JS_CallInternal+0xb7a>
__JS_FreeValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:6516
   2c827:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c82e:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
   2c835:	4c 89 ee             	mov    rsi,r13
   2c838:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c83c:	e8 5f 00 ff ff       	call   1c8a0 <__JS_FreeValueRT>
   2c841:	e9 75 ec ff ff       	jmp    2b4bb <JS_CallInternal+0x89fb>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20292 (discriminator 7)
   2c846:	66 48 0f 6e c0       	movq   xmm0,rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20292 (discriminator 12)
   2c84b:	83 f9 08             	cmp    ecx,0x8
   2c84e:	74 36                	je     2c886 <JS_CallInternal+0x9dc6>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20292 (discriminator 15)
   2c850:	85 c9                	test   ecx,ecx
   2c852:	0f 85 9c f0 ff ff    	jne    2b8f4 <JS_CallInternal+0x8e34>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20292 (discriminator 17)
   2c858:	66 0f ef c9          	pxor   xmm1,xmm1
   2c85c:	f2 0f 2a ca          	cvtsi2sd xmm1,edx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20292 (discriminator 19)
   2c860:	31 c0                	xor    eax,eax
   2c862:	66 0f 2f c8          	comisd xmm1,xmm0
   2c866:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   2c86d:	00 
   2c86e:	0f 93 c0             	setae  al
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20292 (discriminator 1)
   2c871:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20292 (discriminator 19)
   2c875:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20292
   2c879:	e9 fe a8 ff ff       	jmp    2717c <JS_CallInternal+0x46bc>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20292 (discriminator 10)
   2c87e:	66 0f ef c0          	pxor   xmm0,xmm0
   2c882:	f2 0f 2a c0          	cvtsi2sd xmm0,eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20292 (discriminator 14)
   2c886:	66 48 0f 6e ca       	movq   xmm1,rdx
   2c88b:	eb d3                	jmp    2c860 <JS_CallInternal+0x9da0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20421 (discriminator 24)
   2c88d:	48 89 d7             	mov    rdi,rdx
   2c890:	4c 89 ce             	mov    rsi,r9
   2c893:	45 31 c0             	xor    r8d,r8d
   2c896:	4c 89 ea             	mov    rdx,r13
   2c899:	4c 89 f1             	mov    rcx,r14
   2c89c:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   2c8a3:	48 89 bd 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rdi
   2c8aa:	e8 21 dc fe ff       	call   1a4d0 <js_strict_eq2.isra.0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20421 (discriminator 1)
   2c8af:	48 8b b5 38 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c8]
   2c8b6:	4c 8b 8d 40 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c0]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20421 (discriminator 24)
   2c8bd:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   2c8c3:	e9 78 e4 ff ff       	jmp    2ad40 <JS_CallInternal+0x8280>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20421 (discriminator 16)
   2c8c8:	31 c0                	xor    eax,eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20421 (discriminator 13)
   2c8ca:	41 83 fe ff          	cmp    r14d,0xffffffff
   2c8ce:	75 08                	jne    2c8d8 <JS_CallInternal+0x9e18>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20421 (discriminator 15)
   2c8d0:	31 c0                	xor    eax,eax
   2c8d2:	4c 39 ea             	cmp    rdx,r13
   2c8d5:	0f 94 c0             	sete   al
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20421 (discriminator 18)
   2c8d8:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c8df:	48 89 d6             	mov    rsi,rdx
   2c8e2:	4c 89 ca             	mov    rdx,r9
   2c8e5:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   2c8eb:	e8 10 01 ff ff       	call   1ca00 <JS_FreeValue>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20421 (discriminator 1)
   2c8f0:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c8f7:	4c 89 ee             	mov    rsi,r13
   2c8fa:	4c 89 f2             	mov    rdx,r14
   2c8fd:	e8 fe 00 ff ff       	call   1ca00 <JS_FreeValue>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   2c902:	8b 85 50 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1b0]
   2c908:	83 f0 01             	xor    eax,0x1
   2c90b:	48 98                	cdqe
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   2c90d:	e9 2d b0 ff ff       	jmp    2793f <JS_CallInternal+0x4e7f>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20421 (discriminator 7)
   2c912:	45 85 f6             	test   r14d,r14d
   2c915:	75 72                	jne    2c989 <JS_CallInternal+0x9ec9>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20421 (discriminator 9)
   2c917:	66 0f ef c0          	pxor   xmm0,xmm0
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   2c91b:	66 48 0f 6e fa       	movq   xmm7,rdx
   2c920:	31 c0                	xor    eax,eax
   2c922:	ba 01 00 00 00       	mov    edx,0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20421 (discriminator 9)
   2c927:	f2 41 0f 2a c5       	cvtsi2sd xmm0,r13d
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   2c92c:	66 0f 2e c7          	ucomisd xmm0,xmm7
   2c930:	0f 9a c0             	setp   al
   2c933:	48 0f 45 c2          	cmovne rax,rdx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   2c937:	e9 03 b0 ff ff       	jmp    2793f <JS_CallInternal+0x4e7f>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19833
   2c93c:	66 48 0f 6e c7       	movq   xmm0,rdi
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19839
   2c941:	83 f8 08             	cmp    eax,0x8
   2c944:	0f 84 91 ec ff ff    	je     2b5db <JS_CallInternal+0x8b1b>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19841
   2c94a:	85 c0                	test   eax,eax
   2c94c:	0f 85 65 72 ff ff    	jne    23bb7 <JS_CallInternal+0x10f7>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19842
   2c952:	66 0f ef c9          	pxor   xmm1,xmm1
   2c956:	f2 0f 2a c9          	cvtsi2sd xmm1,ecx
   2c95a:	e9 81 ec ff ff       	jmp    2b5e0 <JS_CallInternal+0x8b20>
JS_AtomGetStr():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3601
   2c95f:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   2c966:	89 c2                	mov    edx,eax
   2c968:	48 8d 75 80          	lea    rsi,[rbp-0x80]
   2c96c:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
   2c970:	e8 9b a9 fe ff       	call   17310 <JS_AtomGetStrRT.constprop.0>
   2c975:	48 89 c2             	mov    rdx,rax
JS_ThrowReferenceErrorUninitialized():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3601
   2c978:	e9 fa ec ff ff       	jmp    2b677 <JS_CallInternal+0x8bb7>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19676
   2c97d:	48 8b 9d 50 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1b0]
   2c984:	e9 d7 68 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20421 (discriminator 10)
   2c989:	41 83 fe 08          	cmp    r14d,0x8
   2c98d:	75 70                	jne    2c9ff <JS_CallInternal+0x9f3f>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   2c98f:	66 48 0f 6e c2       	movq   xmm0,rdx
   2c994:	66 49 0f 6e cd       	movq   xmm1,r13
   2c999:	31 c0                	xor    eax,eax
   2c99b:	ba 01 00 00 00       	mov    edx,0x1
   2c9a0:	66 0f 2e c1          	ucomisd xmm0,xmm1
   2c9a4:	0f 9a c0             	setp   al
   2c9a7:	48 0f 45 c2          	cmovne rax,rdx
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   2c9ab:	e9 8f af ff ff       	jmp    2793f <JS_CallInternal+0x4e7f>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20291 (discriminator 7)
   2c9b0:	66 48 0f 6e c0       	movq   xmm0,rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20291 (discriminator 12)
   2c9b5:	83 f9 08             	cmp    ecx,0x8
   2c9b8:	74 3e                	je     2c9f8 <JS_CallInternal+0x9f38>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20291 (discriminator 15)
   2c9ba:	85 c9                	test   ecx,ecx
   2c9bc:	0f 85 ee ee ff ff    	jne    2b8b0 <JS_CallInternal+0x8df0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20291 (discriminator 17)
   2c9c2:	66 0f ef c9          	pxor   xmm1,xmm1
   2c9c6:	f2 0f 2a ca          	cvtsi2sd xmm1,edx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20291 (discriminator 19)
   2c9ca:	31 c0                	xor    eax,eax
   2c9cc:	66 0f 2f c8          	comisd xmm1,xmm0
   2c9d0:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   2c9d7:	00 
   2c9d8:	0f 97 c0             	seta   al
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20291 (discriminator 1)
   2c9db:	48 83 eb 10          	sub    rbx,0x10
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20291 (discriminator 19)
   2c9df:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20291
   2c9e3:	e9 a8 b2 ff ff       	jmp    27c90 <JS_CallInternal+0x51d0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18834
   2c9e8:	4d 89 ec             	mov    r12,r13
   2c9eb:	e9 70 68 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20291 (discriminator 10)
   2c9f0:	66 0f ef c0          	pxor   xmm0,xmm0
   2c9f4:	f2 0f 2a c0          	cvtsi2sd xmm0,eax
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20291 (discriminator 14)
   2c9f8:	66 48 0f 6e ca       	movq   xmm1,rdx
   2c9fd:	eb cb                	jmp    2c9ca <JS_CallInternal+0x9f0a>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20421 (discriminator 12)
   2c9ff:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2ca06:	4c 89 ee             	mov    rsi,r13
   2ca09:	4c 89 f2             	mov    rdx,r14
   2ca0c:	e8 ef ff fe ff       	call   1ca00 <JS_FreeValue>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20421 (discriminator 1)
   2ca11:	e9 18 d8 ff ff       	jmp    2a22e <JS_CallInternal+0x776e>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19786
   2ca16:	66 49 0f 6e c0       	movq   xmm0,r8
   2ca1b:	f2 41 0f 58 45 00    	addsd  xmm0,QWORD PTR [r13+0x0]
   2ca21:	49 c7 45 08 08 00 00 	mov    QWORD PTR [r13+0x8],0x8
   2ca28:	00 
   2ca29:	f2 41 0f 11 45 00    	movsd  QWORD PTR [r13+0x0],xmm0
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19788
   2ca2f:	e9 be a5 ff ff       	jmp    26ff2 <JS_CallInternal+0x4532>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20363 (discriminator 17)
   2ca34:	41 0f b6 46 11       	movzx  eax,BYTE PTR [r14+0x11]
   2ca39:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2ca40:	4c 89 f6             	mov    rsi,r14
   2ca43:	4c 89 ea             	mov    rdx,r13
   2ca46:	83 e0 01             	and    eax,0x1
   2ca49:	88 85 50 fe ff ff    	mov    BYTE PTR [rbp-0x1b0],al
   2ca4f:	e8 ac ff fe ff       	call   1ca00 <JS_FreeValue>
   2ca54:	0f b6 85 50 fe ff ff 	movzx  eax,BYTE PTR [rbp-0x1b0]
   2ca5b:	e9 f5 9e ff ff       	jmp    26955 <JS_CallInternal+0x3e95>
   2ca60:	b8 01 00 00 00       	mov    eax,0x1
   2ca65:	e9 eb 9e ff ff       	jmp    26955 <JS_CallInternal+0x3e95>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20421 (discriminator 20)
   2ca6a:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2ca71:	4c 89 ee             	mov    rsi,r13
   2ca74:	4c 89 f2             	mov    rdx,r14
   2ca77:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
   2ca7e:	e8 7d ff fe ff       	call   1ca00 <JS_FreeValue>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   2ca83:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   2ca8a:	31 c0                	xor    eax,eax
   2ca8c:	44 39 f1             	cmp    ecx,r14d
   2ca8f:	0f 95 c0             	setne  al
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   2ca92:	e9 a8 ae ff ff       	jmp    2793f <JS_CallInternal+0x4e7f>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19001
   2ca97:	4d 89 f4             	mov    r12,r14
   2ca9a:	e9 c1 67 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3735 (discriminator 1)
   2ca9f:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   2caa6:	0f 8e b4 67 ff ff    	jle    23260 <JS_CallInternal+0x7a0>
   2caac:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2cab3:	44 89 ee             	mov    esi,r13d
   2cab6:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2caba:	e8 b1 c9 fe ff       	call   19470 <JS_FreeAtom.part.0.isra.0>
   2cabf:	e9 9c 67 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
JS_ThrowOutOfMemory():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7801
   2cac4:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2cacb:	4c 8b 60 10          	mov    r12,QWORD PTR [rax+0x10]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7802
   2cacf:	41 80 bc 24 e9 04 00 	cmp    BYTE PTR [r12+0x4e9],0x0
   2cad6:	00 00 
   2cad8:	74 62                	je     2cb3c <JS_CallInternal+0xa07c>
js_build_arguments():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:16207
   2cada:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2cae1:	4c 89 ce             	mov    rsi,r9
   2cae4:	48 89 ca             	mov    rdx,rcx
   2cae7:	e8 14 ff fe ff       	call   1ca00 <JS_FreeValue>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:17992
   2caec:	31 c0                	xor    eax,eax
   2caee:	48 c7 43 08 06 00 00 	mov    QWORD PTR [rbx+0x8],0x6
   2caf5:	00 
   2caf6:	48 89 03             	mov    QWORD PTR [rbx],rax
   2caf9:	e9 2d 89 ff ff       	jmp    2542b <JS_CallInternal+0x296b>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3735 (discriminator 1)
   2cafe:	3d f2 00 00 00       	cmp    eax,0xf2
   2cb03:	0f 8e 9c f1 ff ff    	jle    2bca5 <JS_CallInternal+0x91e5>
   2cb09:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
__JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3436
   2cb10:	89 c0                	mov    eax,eax
   2cb12:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
   2cb16:	48 8b 97 48 04 00 00 	mov    rdx,QWORD PTR [rdi+0x448]
   2cb1d:	48 8b 34 c2          	mov    rsi,QWORD PTR [rdx+rax*8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3437 (discriminator 1)
   2cb21:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2cb24:	83 e8 01             	sub    eax,0x1
   2cb27:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2cb2a:	85 c0                	test   eax,eax
   2cb2c:	0f 8f 73 f1 ff ff    	jg     2bca5 <JS_CallInternal+0x91e5>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3439
   2cb32:	e8 c9 88 fe ff       	call   15400 <JS_FreeAtomStruct>
js_import_meta():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:30944
   2cb37:	e9 69 f1 ff ff       	jmp    2bca5 <JS_CallInternal+0x91e5>
JS_ThrowOutOfMemory():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7803
   2cb3c:	41 c6 84 24 e9 04 00 	mov    BYTE PTR [r12+0x4e9],0x1
   2cb43:	00 01 
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7804
   2cb45:	48 89 c7             	mov    rdi,rax
   2cb48:	31 c0                	xor    eax,eax
   2cb4a:	48 8d 35 69 09 0a 00 	lea    rsi,[rip+0xa0969]        # cd4ba <_IO_stdin_used+0x4ba>
   2cb51:	48 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rcx
   2cb58:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
   2cb5f:	e8 9c 64 00 00       	call   33000 <JS_ThrowInternalError>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:7805
   2cb64:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   2cb6b:	41 c6 84 24 e9 04 00 	mov    BYTE PTR [r12+0x4e9],0x0
   2cb72:	00 00 
   2cb74:	4c 8b 8d 50 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1b0]
   2cb7b:	e9 5a ff ff ff       	jmp    2cada <JS_CallInternal+0xa01a>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20364 (discriminator 24)
   2cb80:	b8 01 00 00 00       	mov    eax,0x1
   2cb85:	e9 6b 9d ff ff       	jmp    268f5 <JS_CallInternal+0x3e35>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20364 (discriminator 17)
   2cb8a:	41 0f b6 46 11       	movzx  eax,BYTE PTR [r14+0x11]
   2cb8f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2cb96:	4c 89 f6             	mov    rsi,r14
   2cb99:	4c 89 ea             	mov    rdx,r13
   2cb9c:	83 e0 01             	and    eax,0x1
   2cb9f:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   2cba5:	e8 56 fe fe ff       	call   1ca00 <JS_FreeValue>
   2cbaa:	8b 85 50 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1b0]
   2cbb0:	e9 40 9d ff ff       	jmp    268f5 <JS_CallInternal+0x3e35>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20102
   2cbb5:	4d 89 f4             	mov    r12,r14
   2cbb8:	e9 a3 66 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18517
   2cbbd:	4d 89 f4             	mov    r12,r14
   2cbc0:	e9 9b 66 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18526
   2cbc5:	e8 06 62 00 00       	call   32dd0 <JS_ThrowReferenceErrorUninitialized>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18517
   2cbca:	4d 89 f4             	mov    r12,r14
   2cbcd:	e9 8e 66 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20420 (discriminator 12)
   2cbd2:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2cbd9:	4c 89 ee             	mov    rsi,r13
   2cbdc:	4c 89 f2             	mov    rdx,r14
   2cbdf:	e8 1c fe fe ff       	call   1ca00 <JS_FreeValue>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20420 (discriminator 16)
   2cbe4:	31 c0                	xor    eax,eax
   2cbe6:	e9 a8 ad ff ff       	jmp    27993 <JS_CallInternal+0x4ed3>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19810 (discriminator 1)
   2cbeb:	4d 89 cc             	mov    r12,r9
   2cbee:	e9 6d 66 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19793
   2cbf3:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
   2cbf7:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2cbfe:	4c 89 c2             	mov    rdx,r8
   2cc01:	4c 89 f1             	mov    rcx,r14
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19792
   2cc04:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19793
   2cc0b:	4c 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r8
   2cc12:	e8 19 82 fe ff       	call   14e30 <JS_ConcatStringInPlace>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19793 (discriminator 1)
   2cc17:	4c 8b 85 50 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1b0]
   2cc1e:	4c 8b 8d 40 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c0]
   2cc25:	85 c0                	test   eax,eax
   2cc27:	75 60                	jne    2cc89 <JS_CallInternal+0xa1c9>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19796
   2cc29:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
   2cc2d:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
JS_DupValue():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:709
   2cc31:	83 fa f6             	cmp    edx,0xfffffff6
   2cc34:	76 04                	jbe    2cc3a <JS_CallInternal+0xa17a>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:711
   2cc36:	83 46 fc 01          	add    DWORD PTR [rsi-0x4],0x1
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19796 (discriminator 1)
   2cc3a:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2cc41:	4c 89 c1             	mov    rcx,r8
   2cc44:	4d 89 f0             	mov    r8,r14
   2cc47:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
   2cc4e:	e8 1d 3b 01 00       	call   40770 <JS_ConcatString>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19797 (discriminator 1)
   2cc53:	4c 8b 8d 50 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1b0]
   2cc5a:	83 fa 06             	cmp    edx,0x6
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19796 (discriminator 1)
   2cc5d:	49 89 c0             	mov    r8,rax
   2cc60:	49 89 d6             	mov    r14,rdx
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19797 (discriminator 1)
   2cc63:	74 3b                	je     2cca0 <JS_CallInternal+0xa1e0>
set_value():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2676
   2cc65:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   2cc69:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2677
   2cc6d:	4d 89 45 00          	mov    QWORD PTR [r13+0x0],r8
   2cc71:	4d 89 75 08          	mov    QWORD PTR [r13+0x8],r14
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:2678
   2cc75:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2cc7c:	48 89 c6             	mov    rsi,rax
   2cc7f:	e8 7c fd fe ff       	call   1ca00 <JS_FreeValue>
   2cc84:	e9 69 a3 ff ff       	jmp    26ff2 <JS_CallInternal+0x4532>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19794
   2cc89:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2cc90:	4c 89 c6             	mov    rsi,r8
   2cc93:	4c 89 f2             	mov    rdx,r14
   2cc96:	e8 65 fd fe ff       	call   1ca00 <JS_FreeValue>
   2cc9b:	e9 52 a3 ff ff       	jmp    26ff2 <JS_CallInternal+0x4532>
   2cca0:	4d 89 cc             	mov    r12,r9
   2cca3:	e9 b8 65 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:19038
   2cca8:	4c 89 eb             	mov    rbx,r13
   2ccab:	e9 b0 65 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18493
   2ccb0:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2ccb7:	89 ce                	mov    esi,ecx
   2ccb9:	e8 12 61 00 00       	call   32dd0 <JS_ThrowReferenceErrorUninitialized>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:18494
   2ccbe:	e9 bc d6 ff ff       	jmp    2a37f <JS_CallInternal+0x78bf>
JS_FreeAtom():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:3735 (discriminator 1)
   2ccc3:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   2ccca:	0f 8e 90 65 ff ff    	jle    23260 <JS_CallInternal+0x7a0>
   2ccd0:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ccd7:	44 89 ee             	mov    esi,r13d
   2ccda:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ccde:	e8 8d c7 fe ff       	call   19470 <JS_FreeAtom.part.0.isra.0>
   2cce3:	e9 78 65 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20734
   2cce8:	e8 e3 4c fe ff       	call   119d0 <__stack_chk_fail@plt>
js_operator_private_in():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:15980
   2cced:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2ccf4:	48 8d 35 a6 08 0a 00 	lea    rsi,[rip+0xa08a6]        # cd5a1 <_IO_stdin_used+0x5a1>
   2ccfb:	31 c0                	xor    eax,eax
   2ccfd:	e8 1e 3f 00 00       	call   30c20 <JS_ThrowTypeError>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:15981
   2cd02:	e9 59 65 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20464
   2cd07:	4d 89 ec             	mov    r12,r13
   2cd0a:	e9 51 65 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20420 (discriminator 20)
   2cd0f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2cd16:	45 39 f0             	cmp    r8d,r14d
   2cd19:	4c 89 ee             	mov    rsi,r13
   2cd1c:	4c 89 f2             	mov    rdx,r14
   2cd1f:	0f 94 85 50 fe ff ff 	sete   BYTE PTR [rbp-0x1b0]
   2cd26:	e8 d5 fc fe ff       	call   1ca00 <JS_FreeValue>
JS_NewBool():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   2cd2b:	0f b6 85 50 fe ff ff 	movzx  eax,BYTE PTR [rbp-0x1b0]
JS_CallInternal():
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.h:557
   2cd32:	e9 5c ac ff ff       	jmp    27993 <JS_CallInternal+0x4ed3>
/home/mzyx/read_ic_dequickening_attempt01/M/quickjs.c:20076
   2cd37:	4d 89 f4             	mov    r12,r14
   2cd3a:	e9 21 65 ff ff       	jmp    23260 <JS_CallInternal+0x7a0>

Disassembly of section .fini:
