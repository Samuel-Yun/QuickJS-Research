
/home/mzyx/three_engine_20261004/quickjs-04be246001599f5995fa2f2d8c91a0f198d3f34c/qjs:     file format elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .plt.got:

Disassembly of section .plt.sec:

Disassembly of section .text:

0000000000022a00 <JS_CallInternal>:
   22a00:	55                   	push   rbp
   22a01:	48 89 e5             	mov    rbp,rsp
   22a04:	41 57                	push   r15
   22a06:	41 56                	push   r14
   22a08:	41 55                	push   r13
   22a0a:	41 54                	push   r12
   22a0c:	53                   	push   rbx
   22a0d:	48 81 ec 38 02 00 00 	sub    rsp,0x238
   22a14:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   22a18:	48 89 bd a0 fe ff ff 	mov    QWORD PTR [rbp-0x160],rdi
   22a1f:	48 89 b5 e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rsi
   22a26:	48 89 85 70 fe ff ff 	mov    QWORD PTR [rbp-0x190],rax
   22a2d:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   22a31:	48 89 95 d0 fe ff ff 	mov    QWORD PTR [rbp-0x130],rdx
   22a38:	48 89 85 80 fe ff ff 	mov    QWORD PTR [rbp-0x180],rax
   22a3f:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   22a43:	48 89 8d 78 fe ff ff 	mov    QWORD PTR [rbp-0x188],rcx
   22a4a:	4c 89 85 90 fe ff ff 	mov    QWORD PTR [rbp-0x170],r8
   22a51:	44 89 8d bc fe ff ff 	mov    DWORD PTR [rbp-0x144],r9d
   22a58:	48 89 85 a8 fe ff ff 	mov    QWORD PTR [rbp-0x158],rax
   22a5f:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
   22a66:	00 00 
   22a68:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
   22a6c:	48 8b 47 10          	mov    rax,QWORD PTR [rdi+0x10]
   22a70:	48 89 85 c0 fe ff ff 	mov    QWORD PTR [rbp-0x140],rax
   22a77:	8b 87 a8 01 00 00    	mov    eax,DWORD PTR [rdi+0x1a8]
   22a7d:	89 85 e8 fe ff ff    	mov    DWORD PTR [rbp-0x118],eax
   22a83:	83 e8 01             	sub    eax,0x1
   22a86:	89 87 a8 01 00 00    	mov    DWORD PTR [rdi+0x1a8],eax
   22a8c:	85 c0                	test   eax,eax
   22a8e:	0f 8e 54 05 00 00    	jle    22fe8 <JS_CallInternal+0x5e8>
   22a94:	83 bd d0 fe ff ff ff 	cmp    DWORD PTR [rbp-0x130],0xffffffff
   22a9b:	0f 85 7f 05 00 00    	jne    23020 <JS_CallInternal+0x620>
   22aa1:	48 8b 85 e0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x120]
   22aa8:	0f b7 40 12          	movzx  eax,WORD PTR [rax+0x12]
   22aac:	66 83 f8 0d          	cmp    ax,0xd
   22ab0:	0f 85 99 07 00 00    	jne    2324f <JS_CallInternal+0x84f>
   22ab6:	48 8b 85 e0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x120]
   22abd:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
   22ac1:	48 89 85 d8 fe ff ff 	mov    QWORD PTR [rbp-0x128],rax
   22ac8:	0f b7 78 38          	movzx  edi,WORD PTR [rax+0x38]
   22acc:	8b 85 bc fe ff ff    	mov    eax,DWORD PTR [rbp-0x144]
   22ad2:	39 c7                	cmp    edi,eax
   22ad4:	0f 8f fc 01 00 00    	jg     22cd6 <JS_CallInternal+0x2d6>
   22ada:	8b 45 28             	mov    eax,DWORD PTR [rbp+0x28]
   22add:	83 e0 02             	and    eax,0x2
   22ae0:	0f 45 c7             	cmovne eax,edi
   22ae3:	48 8b 95 d8 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x128]
   22aea:	4c 8b bd c0 fe ff ff 	mov    r15,QWORD PTR [rbp-0x140]
   22af1:	49 89 e8             	mov    r8,rbp
   22af4:	44 0f b7 52 3a       	movzx  r10d,WORD PTR [rdx+0x3a]
   22af9:	0f b7 72 3e          	movzx  esi,WORD PTR [rdx+0x3e]
   22afd:	0f b7 52 40          	movzx  edx,WORD PTR [rdx+0x40]
   22b01:	89 f1                	mov    ecx,esi
   22b03:	44 01 d6             	add    esi,r10d
   22b06:	4c 89 d3             	mov    rbx,r10
   22b09:	01 c6                	add    esi,eax
   22b0b:	49 89 d1             	mov    r9,rdx
   22b0e:	48 63 f6             	movsxd rsi,esi
   22b11:	48 8d 34 72          	lea    rsi,[rdx+rsi*2]
   22b15:	48 c1 e6 03          	shl    rsi,0x3
   22b19:	49 29 f0             	sub    r8,rsi
   22b1c:	4d 3b 87 d0 04 00 00 	cmp    r8,QWORD PTR [r15+0x4d0]
   22b23:	0f 82 d0 07 00 00    	jb     232f9 <JS_CallInternal+0x8f9>
   22b29:	4c 8b bd d8 fe ff ff 	mov    r15,QWORD PTR [rbp-0x128]
   22b30:	44 8b 9d bc fe ff ff 	mov    r11d,DWORD PTR [rbp-0x144]
   22b37:	48 83 c6 17          	add    rsi,0x17
   22b3b:	45 0f b6 47 10       	movzx  r8d,BYTE PTR [r15+0x10]
   22b40:	44 89 9d 38 ff ff ff 	mov    DWORD PTR [rbp-0xc8],r11d
   22b47:	4c 8b 9d e0 fe ff ff 	mov    r11,QWORD PTR [rbp-0x120]
   22b4e:	4c 8b bd d0 fe ff ff 	mov    r15,QWORD PTR [rbp-0x130]
   22b55:	44 89 85 3c ff ff ff 	mov    DWORD PTR [rbp-0xc4],r8d
   22b5c:	49 89 f0             	mov    r8,rsi
   22b5f:	48 81 e6 00 f0 ff ff 	and    rsi,0xfffffffffffff000
   22b66:	4d 8b 73 30          	mov    r14,QWORD PTR [r11+0x30]
   22b6a:	4c 89 9d 08 ff ff ff 	mov    QWORD PTR [rbp-0xf8],r11
   22b71:	49 89 e3             	mov    r11,rsp
   22b74:	49 83 e0 f0          	and    r8,0xfffffffffffffff0
   22b78:	49 29 f3             	sub    r11,rsi
   22b7b:	4c 89 bd 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],r15
   22b82:	4c 89 b5 98 fe ff ff 	mov    QWORD PTR [rbp-0x168],r14
   22b89:	4c 39 dc             	cmp    rsp,r11
   22b8c:	74 15                	je     22ba3 <JS_CallInternal+0x1a3>
   22b8e:	48 81 ec 00 10 00 00 	sub    rsp,0x1000
   22b95:	48 83 8c 24 f8 0f 00 	or     QWORD PTR [rsp+0xff8],0x0
   22b9c:	00 00 
   22b9e:	4c 39 dc             	cmp    rsp,r11
   22ba1:	75 eb                	jne    22b8e <JS_CallInternal+0x18e>
   22ba3:	41 81 e0 ff 0f 00 00 	and    r8d,0xfff
   22baa:	4c 29 c4             	sub    rsp,r8
   22bad:	4d 85 c0             	test   r8,r8
   22bb0:	74 06                	je     22bb8 <JS_CallInternal+0x1b8>
   22bb2:	4a 83 4c 04 f8 00    	or     QWORD PTR [rsp+r8*1-0x8],0x0
   22bb8:	48 8b b5 a8 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x158]
   22bbf:	4c 8d 5c 24 0f       	lea    r11,[rsp+0xf]
   22bc4:	49 83 e3 f0          	and    r11,0xfffffffffffffff0
   22bc8:	4c 89 9d 30 fe ff ff 	mov    QWORD PTR [rbp-0x1d0],r11
   22bcf:	48 89 b5 88 fe ff ff 	mov    QWORD PTR [rbp-0x178],rsi
   22bd6:	85 c0                	test   eax,eax
   22bd8:	0f 85 22 5f 00 00    	jne    28b00 <JS_CallInternal+0x6100>
   22bde:	48 98                	cdqe
   22be0:	48 c1 e0 04          	shl    rax,0x4
   22be4:	4c 01 d8             	add    rax,r11
   22be7:	48 89 85 b0 fe ff ff 	mov    QWORD PTR [rbp-0x150],rax
   22bee:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
   22bf5:	48 8b 85 88 fe ff ff 	mov    rax,QWORD PTR [rbp-0x178]
   22bfc:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
   22c03:	45 85 d2             	test   r10d,r10d
   22c06:	74 30                	je     22c38 <JS_CallInternal+0x238>
   22c08:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
   22c0f:	48 89 de             	mov    rsi,rbx
   22c12:	48 c1 e6 04          	shl    rsi,0x4
   22c16:	48 89 f8             	mov    rax,rdi
   22c19:	48 01 fe             	add    rsi,rdi
   22c1c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   22c20:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
   22c27:	48 83 c0 10          	add    rax,0x10
   22c2b:	48 c7 40 f8 03 00 00 	mov    QWORD PTR [rax-0x8],0x3
   22c32:	00 
   22c33:	48 39 f0             	cmp    rax,rsi
   22c36:	75 e8                	jne    22c20 <JS_CallInternal+0x220>
   22c38:	0f b7 f9             	movzx  edi,cx
   22c3b:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   22c42:	48 c1 e3 04          	shl    rbx,0x4
   22c46:	48 89 f9             	mov    rcx,rdi
   22c49:	48 01 c3             	add    rbx,rax
   22c4c:	48 c1 e1 04          	shl    rcx,0x4
   22c50:	48 8d 3c 0b          	lea    rdi,[rbx+rcx*1]
   22c54:	48 89 bd 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rdi
   22c5b:	66 45 85 c9          	test   r9w,r9w
   22c5f:	74 0b                	je     22c6c <JS_CallInternal+0x26c>
   22c61:	48 c1 e2 03          	shl    rdx,0x3
   22c65:	31 f6                	xor    esi,esi
   22c67:	e8 44 ee fe ff       	call   11ab0 <memset@plt>
   22c6c:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   22c73:	48 8b bd c0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x140]
   22c7a:	48 89 9d 68 fe ff ff 	mov    QWORD PTR [rbp-0x198],rbx
   22c81:	48 8b 41 18          	mov    rax,QWORD PTR [rcx+0x18]
   22c85:	48 8b 49 48          	mov    rcx,QWORD PTR [rcx+0x48]
   22c89:	48 8b 97 f0 04 00 00 	mov    rdx,QWORD PTR [rdi+0x4f0]
   22c90:	48 89 8d e8 fe ff ff 	mov    QWORD PTR [rbp-0x118],rcx
   22c97:	48 8b 8d e0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x120]
   22c9e:	48 89 95 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rdx
   22ca5:	48 8d 95 00 ff ff ff 	lea    rdx,[rbp-0x100]
   22cac:	48 89 97 f0 04 00 00 	mov    QWORD PTR [rdi+0x4f0],rdx
   22cb3:	48 89 8d 60 fe ff ff 	mov    QWORD PTR [rbp-0x1a0],rcx
   22cba:	48 89 95 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rdx
   22cc1:	4c 8d 60 01          	lea    r12,[rax+0x1]
   22cc5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   22cc8:	4c 8d 3d b1 c0 0d 00 	lea    r15,[rip+0xdc0b1]        # fed80 <dispatch_table.83>
   22ccf:	49 89 c5             	mov    r13,rax
   22cd2:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   22cd6:	89 f8                	mov    eax,edi
   22cd8:	e9 06 fe ff ff       	jmp    22ae3 <JS_CallInternal+0xe3>
   22cdd:	f3 0f 1e fa          	endbr64
   22ce1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   22ce8:	f3 0f 1e fa          	endbr64
   22cec:	41 8d 85 4d ff ff ff 	lea    eax,[r13-0xb3]
   22cf3:	48 c7 43 08 00 00 00 	mov    QWORD PTR [rbx+0x8],0x0
   22cfa:	00 
   22cfb:	49 83 c4 01          	add    r12,0x1
   22cff:	48 83 c3 10          	add    rbx,0x10
   22d03:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   22d07:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   22d0d:	49 89 c5             	mov    r13,rax
   22d10:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   22d14:	ff e0                	jmp    rax
   22d16:	f3 0f 1e fa          	endbr64
   22d1a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   22d20:	f3 0f 1e fa          	endbr64
   22d24:	41 8b 44 24 04       	mov    eax,DWORD PTR [r12+0x4]
   22d29:	f3 0f 6f 53 f0       	movdqu xmm2,XMMWORD PTR [rbx-0x10]
   22d2e:	4d 8d 74 24 09       	lea    r14,[r12+0x9]
   22d33:	41 8b 0c 24          	mov    ecx,DWORD PTR [r12]
   22d37:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   22d3e:	89 85 28 fe ff ff    	mov    DWORD PTR [rbp-0x1d8],eax
   22d44:	41 0f b6 44 24 08    	movzx  eax,BYTE PTR [r12+0x8]
   22d4a:	0f 29 95 50 fe ff ff 	movaps XMMWORD PTR [rbp-0x1b0],xmm2
   22d51:	48 8b 95 58 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1a8]
   22d58:	88 85 40 fe ff ff    	mov    BYTE PTR [rbp-0x1c0],al
   22d5e:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   22d65:	89 8d 38 fe ff ff    	mov    DWORD PTR [rbp-0x1c8],ecx
   22d6b:	49 89 d4             	mov    r12,rdx
   22d6e:	4c 89 70 30          	mov    QWORD PTR [rax+0x30],r14
   22d72:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   22d79:	48 89 c6             	mov    rsi,rax
   22d7c:	48 89 85 10 fe ff ff 	mov    QWORD PTR [rbp-0x1f0],rax
   22d83:	e8 28 ac 04 00       	call   6d9b0 <JS_HasProperty>
   22d88:	85 c0                	test   eax,eax
   22d8a:	0f 88 76 07 00 00    	js     23506 <JS_CallInternal+0xb06>
   22d90:	0f 84 75 5e 00 00    	je     28c0b <JS_CallInternal+0x620b>
   22d96:	80 bd 40 fe ff ff 00 	cmp    BYTE PTR [rbp-0x1c0],0x0
   22d9d:	0f 85 d9 05 00 00    	jne    2337c <JS_CallInternal+0x97c>
   22da3:	41 83 ed 71          	sub    r13d,0x71
   22da7:	41 83 fd 04          	cmp    r13d,0x4
   22dab:	0f 87 20 05 00 00    	ja     232d1 <JS_CallInternal+0x8d1>
   22db1:	48 8d 15 98 32 0b 00 	lea    rdx,[rip+0xb3298]        # d6050 <qjsc_repl_size+0x444>
   22db8:	4a 63 04 aa          	movsxd rax,DWORD PTR [rdx+r13*4]
   22dbc:	48 01 d0             	add    rax,rdx
   22dbf:	3e ff e0             	notrack jmp rax
   22dc2:	f3 0f 1e fa          	endbr64
   22dc6:	f3 0f 1e fa          	endbr64
   22dca:	4c 89 a5 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r12
   22dd1:	45 8d 95 14 ff ff ff 	lea    r10d,[r13-0xec]
   22dd8:	4d 63 da             	movsxd r11,r10d
   22ddb:	49 89 de             	mov    r14,rbx
   22dde:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   22de5:	45 89 d1             	mov    r9d,r10d
   22de8:	49 c1 e3 04          	shl    r11,0x4
   22dec:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   22df3:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   22dfa:	41 b8 03 00 00 00    	mov    r8d,0x3
   22e00:	4d 29 de             	sub    r14,r11
   22e03:	4c 89 9d 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r11
   22e0a:	49 8b 76 f0          	mov    rsi,QWORD PTR [r14-0x10]
   22e0e:	49 8b 56 f8          	mov    rdx,QWORD PTR [r14-0x8]
   22e12:	48 89 48 30          	mov    QWORD PTR [rax+0x30],rcx
   22e16:	31 c9                	xor    ecx,ecx
   22e18:	6a 00                	push   0x0
   22e1a:	4d 8d 66 f0          	lea    r12,[r14-0x10]
   22e1e:	41 56                	push   r14
   22e20:	6a 03                	push   0x3
   22e22:	6a 00                	push   0x0
   22e24:	44 89 95 40 fe ff ff 	mov    DWORD PTR [rbp-0x1c0],r10d
   22e2b:	e8 d0 fb ff ff       	call   22a00 <JS_CallInternal>
   22e30:	48 83 c4 20          	add    rsp,0x20
   22e34:	44 8b 95 40 fe ff ff 	mov    r10d,DWORD PTR [rbp-0x1c0]
   22e3b:	4c 8b 9d 38 fe ff ff 	mov    r11,QWORD PTR [rbp-0x1c8]
   22e42:	83 fa 06             	cmp    edx,0x6
   22e45:	49 89 c1             	mov    r9,rax
   22e48:	49 89 d0             	mov    r8,rdx
   22e4b:	48 89 d1             	mov    rcx,rdx
   22e4e:	0f 84 f4 61 00 00    	je     29048 <JS_CallInternal+0x6648>
   22e54:	41 83 fd 23          	cmp    r13d,0x23
   22e58:	0f 84 95 02 00 00    	je     230f3 <JS_CallInternal+0x6f3>
   22e5e:	4d 01 de             	add    r14,r11
   22e61:	45 85 d2             	test   r10d,r10d
   22e64:	78 77                	js     22edd <JS_CallInternal+0x4dd>
   22e66:	4d 89 e5             	mov    r13,r12
   22e69:	4d 89 f0             	mov    r8,r14
   22e6c:	48 89 95 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rdx
   22e73:	45 89 d4             	mov    r12d,r10d
   22e76:	49 89 c6             	mov    r14,rax
   22e79:	eb 0e                	jmp    22e89 <JS_CallInternal+0x489>
   22e7b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   22e80:	49 83 c5 10          	add    r13,0x10
   22e84:	4d 39 c5             	cmp    r13,r8
   22e87:	74 47                	je     22ed0 <JS_CallInternal+0x4d0>
   22e89:	49 8b 4d 08          	mov    rcx,QWORD PTR [r13+0x8]
   22e8d:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
   22e91:	83 f9 f6             	cmp    ecx,0xfffffff6
   22e94:	76 ea                	jbe    22e80 <JS_CallInternal+0x480>
   22e96:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   22e99:	8d 50 ff             	lea    edx,[rax-0x1]
   22e9c:	89 56 fc             	mov    DWORD PTR [rsi-0x4],edx
   22e9f:	85 d2                	test   edx,edx
   22ea1:	7f dd                	jg     22e80 <JS_CallInternal+0x480>
   22ea3:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   22eaa:	48 89 ca             	mov    rdx,rcx
   22ead:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   22eb4:	49 83 c5 10          	add    r13,0x10
   22eb8:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   22ebc:	e8 af 99 ff ff       	call   1c870 <__JS_FreeValueRT>
   22ec1:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
   22ec8:	4d 39 c5             	cmp    r13,r8
   22ecb:	75 bc                	jne    22e89 <JS_CallInternal+0x489>
   22ecd:	0f 1f 00             	nop    DWORD PTR [rax]
   22ed0:	4c 8b 85 38 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c8]
   22ed7:	45 89 e2             	mov    r10d,r12d
   22eda:	4d 89 f1             	mov    r9,r14
   22edd:	41 8d 42 01          	lea    eax,[r10+0x1]
   22ee1:	48 98                	cdqe
   22ee3:	48 c1 e0 04          	shl    rax,0x4
   22ee7:	48 89 c2             	mov    rdx,rax
   22eea:	48 89 d8             	mov    rax,rbx
   22eed:	48 29 d0             	sub    rax,rdx
   22ef0:	4c 89 08             	mov    QWORD PTR [rax],r9
   22ef3:	48 8d 58 10          	lea    rbx,[rax+0x10]
   22ef7:	4c 89 40 08          	mov    QWORD PTR [rax+0x8],r8
   22efb:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   22f02:	4c 8d 60 01          	lea    r12,[rax+0x1]
   22f06:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   22f09:	49 89 c5             	mov    r13,rax
   22f0c:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   22f10:	f3 0f 1e fa          	endbr64
   22f14:	f3 0f 1e fa          	endbr64
   22f18:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   22f1c:	31 f6                	xor    esi,esi
   22f1e:	b9 01 00 00 00       	mov    ecx,0x1
   22f23:	ba 02 00 00 00       	mov    edx,0x2
   22f28:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   22f2f:	45 0f b7 74 24 04    	movzx  r14d,WORD PTR [r12+0x4]
   22f35:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   22f3b:	49 8d 44 24 06       	lea    rax,[r12+0x6]
   22f40:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
   22f47:	48 8d 43 10          	lea    rax,[rbx+0x10]
   22f4b:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
   22f52:	e8 49 33 02 00       	call   462a0 <JS_NewObjectProtoClass>
   22f57:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
   22f5b:	83 7b 08 06          	cmp    DWORD PTR [rbx+0x8],0x6
   22f5f:	48 89 03             	mov    QWORD PTR [rbx],rax
   22f62:	0f 84 23 02 00 00    	je     2318b <JS_CallInternal+0x78b>
   22f68:	41 83 fd 78          	cmp    r13d,0x78
   22f6c:	0f 85 ed 01 00 00    	jne    2315f <JS_CallInternal+0x75f>
   22f72:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   22f79:	4e 8b 2c f0          	mov    r13,QWORD PTR [rax+r14*8]
   22f7d:	41 83 45 fc 01       	add    DWORD PTR [r13-0x4],0x1
   22f82:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
   22f85:	8b 95 50 fe ff ff    	mov    edx,DWORD PTR [rbp-0x1b0]
   22f8b:	b9 22 00 00 00       	mov    ecx,0x22
   22f90:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   22f97:	e8 b4 2a 02 00       	call   45a50 <add_property>
   22f9c:	48 85 c0             	test   rax,rax
   22f9f:	0f 84 e5 88 00 00    	je     2b88a <JS_CallInternal+0x8e8a>
   22fa5:	4c 89 28             	mov    QWORD PTR [rax],r13
   22fa8:	8b b5 50 fe ff ff    	mov    esi,DWORD PTR [rbp-0x1b0]
   22fae:	31 d2                	xor    edx,edx
   22fb0:	48 83 c3 20          	add    rbx,0x20
   22fb4:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   22fbb:	49 83 c4 07          	add    r12,0x7
   22fbf:	e8 bc 0a 01 00       	call   33a80 <__JS_AtomToValue>
   22fc4:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   22fcb:	48 89 01             	mov    QWORD PTR [rcx],rax
   22fce:	48 89 51 08          	mov    QWORD PTR [rcx+0x8],rdx
   22fd2:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   22fd8:	49 89 c5             	mov    r13,rax
   22fdb:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   22fdf:	ff e0                	jmp    rax
   22fe1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   22fe8:	e8 23 fc 00 00       	call   32c10 <__js_poll_interrupts>
   22fed:	85 c0                	test   eax,eax
   22fef:	0f 84 9f fa ff ff    	je     22a94 <JS_CallInternal+0x94>
   22ff5:	31 c0                	xor    eax,eax
   22ff7:	ba 06 00 00 00       	mov    edx,0x6
   22ffc:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
   23000:	64 48 2b 0c 25 28 00 	sub    rcx,QWORD PTR fs:0x28
   23007:	00 00 
   23009:	0f 85 a9 97 00 00    	jne    2c7b8 <JS_CallInternal+0x9db8>
   2300f:	48 8d 65 d8          	lea    rsp,[rbp-0x28]
   23013:	5b                   	pop    rbx
   23014:	41 5c                	pop    r12
   23016:	41 5d                	pop    r13
   23018:	41 5e                	pop    r14
   2301a:	41 5f                	pop    r15
   2301c:	5d                   	pop    rbp
   2301d:	c3                   	ret
   2301e:	66 90                	xchg   ax,ax
   23020:	f6 45 28 04          	test   BYTE PTR [rbp+0x28],0x4
   23024:	0f 84 d6 03 00 00    	je     23400 <JS_CallInternal+0xa00>
   2302a:	48 8b 85 e0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x120]
   23031:	48 8b 48 58          	mov    rcx,QWORD PTR [rax+0x58]
   23035:	48 8b 50 68          	mov    rdx,QWORD PTR [rax+0x68]
   23039:	48 8d 78 50          	lea    rdi,[rax+0x50]
   2303d:	48 89 bd c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rdi
   23044:	48 8b 59 28          	mov    rbx,QWORD PTR [rcx+0x28]
   23048:	48 89 8d 60 fe ff ff 	mov    QWORD PTR [rbp-0x1a0],rcx
   2304f:	48 8b 49 30          	mov    rcx,QWORD PTR [rcx+0x30]
   23053:	48 89 95 30 fe ff ff 	mov    QWORD PTR [rbp-0x1d0],rdx
   2305a:	48 8b 73 48          	mov    rsi,QWORD PTR [rbx+0x48]
   2305e:	48 89 9d d8 fe ff ff 	mov    QWORD PTR [rbp-0x128],rbx
   23065:	48 89 8d 98 fe ff ff 	mov    QWORD PTR [rbp-0x168],rcx
   2306c:	48 89 c1             	mov    rcx,rax
   2306f:	48 89 b5 e8 fe ff ff 	mov    QWORD PTR [rbp-0x118],rsi
   23076:	48 8b 70 70          	mov    rsi,QWORD PTR [rax+0x70]
   2307a:	0f b7 43 3a          	movzx  eax,WORD PTR [rbx+0x3a]
   2307e:	4c 8b a1 80 00 00 00 	mov    r12,QWORD PTR [rcx+0x80]
   23085:	48 89 b5 b0 fe ff ff 	mov    QWORD PTR [rbp-0x150],rsi
   2308c:	48 8b 99 90 00 00 00 	mov    rbx,QWORD PTR [rcx+0x90]
   23093:	48 c7 81 90 00 00 00 	mov    QWORD PTR [rcx+0x90],0x0
   2309a:	00 00 00 00 
   2309e:	48 c1 e0 04          	shl    rax,0x4
   230a2:	48 01 f0             	add    rax,rsi
   230a5:	48 8b b5 c0 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x140]
   230ac:	48 89 85 68 fe ff ff 	mov    QWORD PTR [rbp-0x198],rax
   230b3:	48 8b 86 f0 04 00 00 	mov    rax,QWORD PTR [rsi+0x4f0]
   230ba:	48 89 41 50          	mov    QWORD PTR [rcx+0x50],rax
   230be:	48 89 be f0 04 00 00 	mov    QWORD PTR [rsi+0x4f0],rdi
   230c5:	8b 79 24             	mov    edi,DWORD PTR [rcx+0x24]
   230c8:	85 ff                	test   edi,edi
   230ca:	0f 84 9d 02 00 00    	je     2336d <JS_CallInternal+0x96d>
   230d0:	48 8b 85 30 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1d0]
   230d7:	48 89 85 88 fe ff ff 	mov    QWORD PTR [rbp-0x178],rax
   230de:	e9 bd 00 00 00       	jmp    231a0 <JS_CallInternal+0x7a0>
   230e3:	f3 0f 1e fa          	endbr64
   230e7:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
   230eb:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
   230ef:	48 83 eb 10          	sub    rbx,0x10
   230f3:	48 8b bd d8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x128]
   230fa:	66 83 7f 40 00       	cmp    WORD PTR [rdi+0x40],0x0
   230ff:	0f 85 7b 6b 00 00    	jne    29c80 <JS_CallInternal+0x7280>
   23105:	4c 8b a5 30 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1d0]
   2310c:	49 39 dc             	cmp    r12,rbx
   2310f:	0f 83 1a 01 00 00    	jae    2322f <JS_CallInternal+0x82f>
   23115:	4c 8b ad e8 fe ff ff 	mov    r13,QWORD PTR [rbp-0x118]
   2311c:	49 89 ce             	mov    r14,rcx
   2311f:	49 89 c7             	mov    r15,rax
   23122:	eb 11                	jmp    23135 <JS_CallInternal+0x735>
   23124:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   23128:	49 83 c4 10          	add    r12,0x10
   2312c:	49 39 dc             	cmp    r12,rbx
   2312f:	0f 83 b9 01 00 00    	jae    232ee <JS_CallInternal+0x8ee>
   23135:	4d 8b 44 24 08       	mov    r8,QWORD PTR [r12+0x8]
   2313a:	49 8b 34 24          	mov    rsi,QWORD PTR [r12]
   2313e:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   23142:	76 e4                	jbe    23128 <JS_CallInternal+0x728>
   23144:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   23147:	8d 50 ff             	lea    edx,[rax-0x1]
   2314a:	89 56 fc             	mov    DWORD PTR [rsi-0x4],edx
   2314d:	85 d2                	test   edx,edx
   2314f:	7f d7                	jg     23128 <JS_CallInternal+0x728>
   23151:	49 8b 7d 10          	mov    rdi,QWORD PTR [r13+0x10]
   23155:	4c 89 c2             	mov    rdx,r8
   23158:	e8 13 97 ff ff       	call   1c870 <__JS_FreeValueRT>
   2315d:	eb c9                	jmp    23128 <JS_CallInternal+0x728>
   2315f:	31 c9                	xor    ecx,ecx
   23161:	48 8b b5 c8 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x138]
   23168:	41 83 fd 77          	cmp    r13d,0x77
   2316c:	41 0f b7 d6          	movzx  edx,r14w
   23170:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23177:	0f 94 c1             	sete   cl
   2317a:	e8 81 81 02 00       	call   4b300 <get_var_ref>
   2317f:	49 89 c5             	mov    r13,rax
   23182:	48 85 c0             	test   rax,rax
   23185:	0f 85 f7 fd ff ff    	jne    22f82 <JS_CallInternal+0x582>
   2318b:	48 8b 9d 40 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1c0]
   23192:	4c 8b a5 38 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1c8]
   23199:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   231a0:	48 8b 8d c0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x140]
   231a7:	83 b9 e0 04 00 00 ff 	cmp    DWORD PTR [rcx+0x4e0],0xffffffff
   231ae:	48 8b 81 d8 04 00 00 	mov    rax,QWORD PTR [rcx+0x4d8]
   231b5:	75 39                	jne    231f0 <JS_CallInternal+0x7f0>
   231b7:	66 83 78 12 03       	cmp    WORD PTR [rax+0x12],0x3
   231bc:	75 32                	jne    231f0 <JS_CallInternal+0x7f0>
   231be:	48 8b 48 18          	mov    rcx,QWORD PTR [rax+0x18]
   231c2:	8b 51 18             	mov    edx,DWORD PTR [rcx+0x18]
   231c5:	89 d0                	mov    eax,edx
   231c7:	83 e0 39             	and    eax,0x39
   231ca:	8b 44 81 38          	mov    eax,DWORD PTR [rcx+rax*4+0x38]
   231ce:	48 85 c0             	test   rax,rax
   231d1:	0f 84 f0 64 00 00    	je     296c7 <JS_CallInternal+0x6cc7>
   231d7:	48 8d 14 95 34 00 00 	lea    rdx,[rdx*4+0x34]
   231de:	00 
   231df:	48 8d 04 c2          	lea    rax,[rdx+rax*8]
   231e3:	48 01 c8             	add    rax,rcx
   231e6:	83 78 04 39          	cmp    DWORD PTR [rax+0x4],0x39
   231ea:	0f 85 ca 64 00 00    	jne    296ba <JS_CallInternal+0x6cba>
   231f0:	48 8b 85 c0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x140]
   231f7:	80 b8 e8 04 00 00 00 	cmp    BYTE PTR [rax+0x4e8],0x0
   231fe:	0f 84 39 01 00 00    	je     2333d <JS_CallInternal+0x93d>
   23204:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
   2320b:	b9 06 00 00 00       	mov    ecx,0x6
   23210:	f6 40 11 30          	test   BYTE PTR [rax+0x11],0x30
   23214:	b8 00 00 00 00       	mov    eax,0x0
   23219:	0f 84 d4 fe ff ff    	je     230f3 <JS_CallInternal+0x6f3>
   2321f:	90                   	nop
   23220:	48 8b bd c8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x138]
   23227:	4c 89 67 30          	mov    QWORD PTR [rdi+0x30],r12
   2322b:	48 89 5f 40          	mov    QWORD PTR [rdi+0x40],rbx
   2322f:	48 8b 9d c8 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x138]
   23236:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
   23239:	48 8b 9d c0 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x140]
   23240:	48 89 93 f0 04 00 00 	mov    QWORD PTR [rbx+0x4f0],rdx
   23247:	48 89 ca             	mov    rdx,rcx
   2324a:	e9 ad fd ff ff       	jmp    22ffc <JS_CallInternal+0x5fc>
   2324f:	48 8b 8d c0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x140]
   23256:	48 8d 04 80          	lea    rax,[rax+rax*4]
   2325a:	48 c1 e0 03          	shl    rax,0x3
   2325e:	48 03 81 58 04 00 00 	add    rax,QWORD PTR [rcx+0x458]
   23265:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   23269:	48 85 c0             	test   rax,rax
   2326c:	0f 84 8e 01 00 00    	je     23400 <JS_CallInternal+0xa00>
   23272:	8b 4d 28             	mov    ecx,DWORD PTR [rbp+0x28]
   23275:	48 8b b5 e0 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x120]
   2327c:	44 8b 8d bc fe ff ff 	mov    r9d,DWORD PTR [rbp-0x144]
   23283:	4c 8b 85 90 fe ff ff 	mov    r8,QWORD PTR [rbp-0x170]
   2328a:	48 8b 95 d0 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x130]
   23291:	48 8b bd a0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x160]
   23298:	51                   	push   rcx
   23299:	48 8b 8d 78 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x188]
   232a0:	ff b5 a8 fe ff ff    	push   QWORD PTR [rbp-0x158]
   232a6:	ff d0                	call   rax
   232a8:	59                   	pop    rcx
   232a9:	5e                   	pop    rsi
   232aa:	e9 4d fd ff ff       	jmp    22ffc <JS_CallInternal+0x5fc>
   232af:	8b b5 38 fe ff ff    	mov    esi,DWORD PTR [rbp-0x1c8]
   232b5:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   232bc:	31 d2                	xor    edx,edx
   232be:	4c 8d 63 10          	lea    r12,[rbx+0x10]
   232c2:	e8 b9 07 01 00       	call   33a80 <__JS_AtomToValue>
   232c7:	48 89 03             	mov    QWORD PTR [rbx],rax
   232ca:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
   232ce:	4c 89 e3             	mov    rbx,r12
   232d1:	8b 85 28 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1d8]
   232d7:	83 e8 05             	sub    eax,0x5
   232da:	48 98                	cdqe
   232dc:	49 01 c6             	add    r14,rax
   232df:	41 0f b6 06          	movzx  eax,BYTE PTR [r14]
   232e3:	4d 8d 66 01          	lea    r12,[r14+0x1]
   232e7:	49 89 c5             	mov    r13,rax
   232ea:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   232ee:	4c 89 f1             	mov    rcx,r14
   232f1:	4c 89 f8             	mov    rax,r15
   232f4:	e9 36 ff ff ff       	jmp    2322f <JS_CallInternal+0x82f>
   232f9:	48 8b bd a0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x160]
   23300:	48 8d 35 a4 91 0a 00 	lea    rsi,[rip+0xa91a4]        # cc4ab <_IO_stdin_used+0x4ab>
   23307:	31 c0                	xor    eax,eax
   23309:	e8 82 f7 00 00       	call   32a90 <JS_ThrowInternalError>
   2330e:	e9 e9 fc ff ff       	jmp    22ffc <JS_CallInternal+0x5fc>
   23313:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2331a:	4c 89 ee             	mov    rsi,r13
   2331d:	4c 89 f2             	mov    rdx,r14
   23320:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   23324:	e8 47 95 ff ff       	call   1c870 <__JS_FreeValueRT>
   23329:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   23330:	41 83 fe 05          	cmp    r14d,0x5
   23334:	0f 84 26 5e 00 00    	je     29160 <JS_CallInternal+0x6760>
   2333a:	4c 89 fb             	mov    rbx,r15
   2333d:	48 39 9d 68 fe ff ff 	cmp    QWORD PTR [rbp-0x198],rbx
   23344:	0f 83 ba fe ff ff    	jae    23204 <JS_CallInternal+0x804>
   2334a:	4c 8b 73 f8          	mov    r14,QWORD PTR [rbx-0x8]
   2334e:	4c 8d 7b f0          	lea    r15,[rbx-0x10]
   23352:	4c 8b 6b f0          	mov    r13,QWORD PTR [rbx-0x10]
   23356:	41 83 fe f6          	cmp    r14d,0xfffffff6
   2335a:	76 d4                	jbe    23330 <JS_CallInternal+0x930>
   2335c:	41 8b 45 fc          	mov    eax,DWORD PTR [r13-0x4]
   23360:	83 e8 01             	sub    eax,0x1
   23363:	41 89 45 fc          	mov    DWORD PTR [r13-0x4],eax
   23367:	85 c0                	test   eax,eax
   23369:	7f c5                	jg     23330 <JS_CallInternal+0x930>
   2336b:	eb a6                	jmp    23313 <JS_CallInternal+0x913>
   2336d:	48 89 95 88 fe ff ff 	mov    QWORD PTR [rbp-0x178],rdx
   23374:	4c 89 e0             	mov    rax,r12
   23377:	e9 45 f9 ff ff       	jmp    22cc1 <JS_CallInternal+0x2c1>
   2337c:	48 83 ec 08          	sub    rsp,0x8
   23380:	4c 8b 85 50 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1b0]
   23387:	48 8b b5 10 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1f0]
   2338e:	b9 f1 00 00 00       	mov    ecx,0xf1
   23393:	6a 00                	push   0x0
   23395:	4c 8b 8d 58 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1a8]
   2339c:	4c 89 e2             	mov    rdx,r12
   2339f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   233a6:	e8 95 94 00 00       	call   2c840 <JS_GetPropertyInternal>
   233ab:	59                   	pop    rcx
   233ac:	5e                   	pop    rsi
   233ad:	49 89 c0             	mov    r8,rax
   233b0:	49 89 d4             	mov    r12,rdx
   233b3:	83 fa 06             	cmp    edx,0x6
   233b6:	0f 84 4a 01 00 00    	je     23506 <JS_CallInternal+0xb06>
   233bc:	83 fa ff             	cmp    edx,0xffffffff
   233bf:	0f 84 e5 57 00 00    	je     28baa <JS_CallInternal+0x61aa>
   233c5:	83 fa f6             	cmp    edx,0xfffffff6
   233c8:	0f 86 d5 f9 ff ff    	jbe    22da3 <JS_CallInternal+0x3a3>
   233ce:	8b 40 fc             	mov    eax,DWORD PTR [rax-0x4]
   233d1:	83 e8 01             	sub    eax,0x1
   233d4:	41 89 40 fc          	mov    DWORD PTR [r8-0x4],eax
   233d8:	85 c0                	test   eax,eax
   233da:	0f 8f c3 f9 ff ff    	jg     22da3 <JS_CallInternal+0x3a3>
   233e0:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   233e7:	4c 89 c6             	mov    rsi,r8
   233ea:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   233ee:	e8 7d 94 ff ff       	call   1c870 <__JS_FreeValueRT>
   233f3:	e9 ab f9 ff ff       	jmp    22da3 <JS_CallInternal+0x3a3>
   233f8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   233ff:	00 
   23400:	48 8b bd a0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x160]
   23407:	48 8d 35 57 a7 0a 00 	lea    rsi,[rip+0xaa757]        # cdb65 <_IO_stdin_used+0x1b65>
   2340e:	31 c0                	xor    eax,eax
   23410:	e8 9b d2 00 00       	call   306b0 <JS_ThrowTypeError>
   23415:	e9 e2 fb ff ff       	jmp    22ffc <JS_CallInternal+0x5fc>
   2341a:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   23421:	48 8b 95 58 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1a8]
   23428:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
   2342e:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23435:	48 89 c6             	mov    rsi,rax
   23438:	49 89 c5             	mov    r13,rax
   2343b:	49 89 d4             	mov    r12,rdx
   2343e:	e8 6d a5 04 00       	call   6d9b0 <JS_HasProperty>
   23443:	85 c0                	test   eax,eax
   23445:	0f 88 bb 00 00 00    	js     23506 <JS_CallInternal+0xb06>
   2344b:	b8 03 00 00 00       	mov    eax,0x3
   23450:	b9 00 00 00 00       	mov    ecx,0x0
   23455:	0f 85 0f 70 00 00    	jne    2a46a <JS_CallInternal+0x7a6a>
   2345b:	48 89 0b             	mov    QWORD PTR [rbx],rcx
   2345e:	48 83 c3 10          	add    rbx,0x10
   23462:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
   23466:	e9 66 fe ff ff       	jmp    232d1 <JS_CallInternal+0x8d1>
   2346b:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   23472:	48 8b 95 58 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1a8]
   23479:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
   2347f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23486:	48 89 c6             	mov    rsi,rax
   23489:	e8 22 a5 04 00       	call   6d9b0 <JS_HasProperty>
   2348e:	85 c0                	test   eax,eax
   23490:	0f 8e 4c 86 00 00    	jle    2bae2 <JS_CallInternal+0x90e2>
   23496:	48 83 ec 08          	sub    rsp,0x8
   2349a:	4c 8b 43 e0          	mov    r8,QWORD PTR [rbx-0x20]
   2349e:	4c 8b 4b e8          	mov    r9,QWORD PTR [rbx-0x18]
   234a2:	4c 8d 63 e0          	lea    r12,[rbx-0x20]
   234a6:	4c 8b 95 50 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1b0]
   234ad:	4c 8b 9d 58 fe ff ff 	mov    r11,QWORD PTR [rbp-0x1a8]
   234b4:	68 00 80 00 00       	push   0x8000
   234b9:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
   234bf:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   234c6:	41 53                	push   r11
   234c8:	4c 89 d6             	mov    rsi,r10
   234cb:	4c 89 da             	mov    rdx,r11
   234ce:	41 52                	push   r10
   234d0:	e8 9b a0 00 00       	call   2d570 <JS_SetPropertyInternal>
   234d5:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   234d9:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   234dd:	48 83 c4 20          	add    rsp,0x20
   234e1:	41 89 c5             	mov    r13d,eax
   234e4:	83 fa f6             	cmp    edx,0xfffffff6
   234e7:	76 11                	jbe    234fa <JS_CallInternal+0xafa>
   234e9:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   234ec:	83 e8 01             	sub    eax,0x1
   234ef:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   234f2:	85 c0                	test   eax,eax
   234f4:	0f 8e 55 86 00 00    	jle    2bb4f <JS_CallInternal+0x914f>
   234fa:	4c 89 e3             	mov    rbx,r12
   234fd:	45 85 ed             	test   r13d,r13d
   23500:	0f 89 cb fd ff ff    	jns    232d1 <JS_CallInternal+0x8d1>
   23506:	4d 89 f4             	mov    r12,r14
   23509:	e9 92 fc ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2350e:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   23515:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
   2351b:	45 31 c0             	xor    r8d,r8d
   2351e:	48 8b 95 58 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1a8]
   23525:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2352c:	48 89 c6             	mov    rsi,rax
   2352f:	e8 ec 74 02 00       	call   4aa20 <JS_DeleteProperty>
   23534:	41 89 c4             	mov    r12d,eax
   23537:	85 c0                	test   eax,eax
   23539:	78 cb                	js     23506 <JS_CallInternal+0xb06>
   2353b:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   2353f:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   23543:	83 fa f6             	cmp    edx,0xfffffff6
   23546:	76 11                	jbe    23559 <JS_CallInternal+0xb59>
   23548:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2354b:	83 e8 01             	sub    eax,0x1
   2354e:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   23551:	85 c0                	test   eax,eax
   23553:	0f 8e fb 83 00 00    	jle    2b954 <JS_CallInternal+0x8f54>
   23559:	31 c0                	xor    eax,eax
   2355b:	45 85 e4             	test   r12d,r12d
   2355e:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   23565:	00 
   23566:	0f 95 c0             	setne  al
   23569:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   2356d:	e9 5f fd ff ff       	jmp    232d1 <JS_CallInternal+0x8d1>
   23572:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   23579:	48 8b 95 58 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1a8]
   23580:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
   23586:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2358d:	48 89 c6             	mov    rsi,rax
   23590:	49 89 c5             	mov    r13,rax
   23593:	49 89 d4             	mov    r12,rdx
   23596:	e8 15 a4 04 00       	call   6d9b0 <JS_HasProperty>
   2359b:	85 c0                	test   eax,eax
   2359d:	0f 8e 08 83 00 00    	jle    2b8ab <JS_CallInternal+0x8eab>
   235a3:	48 83 ec 08          	sub    rsp,0x8
   235a7:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
   235ad:	4c 89 ee             	mov    rsi,r13
   235b0:	4c 89 e2             	mov    rdx,r12
   235b3:	4c 8b 8d 58 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1a8]
   235ba:	4c 8b 85 50 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1b0]
   235c1:	6a 00                	push   0x0
   235c3:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   235ca:	e8 71 92 00 00       	call   2c840 <JS_GetPropertyInternal>
   235cf:	41 59                	pop    r9
   235d1:	41 5a                	pop    r10
   235d3:	48 89 c1             	mov    rcx,rax
   235d6:	48 89 d0             	mov    rax,rdx
   235d9:	83 fa 06             	cmp    edx,0x6
   235dc:	0f 84 24 ff ff ff    	je     23506 <JS_CallInternal+0xb06>
   235e2:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   235e6:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   235ea:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
   235ee:	48 89 4b f0          	mov    QWORD PTR [rbx-0x10],rcx
   235f2:	83 fa f6             	cmp    edx,0xfffffff6
   235f5:	0f 86 d6 fc ff ff    	jbe    232d1 <JS_CallInternal+0x8d1>
   235fb:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   235fe:	83 e8 01             	sub    eax,0x1
   23601:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   23604:	85 c0                	test   eax,eax
   23606:	0f 8f c5 fc ff ff    	jg     232d1 <JS_CallInternal+0x8d1>
   2360c:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   23613:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   23617:	e8 54 92 ff ff       	call   1c870 <__JS_FreeValueRT>
   2361c:	e9 b0 fc ff ff       	jmp    232d1 <JS_CallInternal+0x8d1>
   23621:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   23628:	f3 0f 1e fa          	endbr64
   2362c:	f3 0f 1e fa          	endbr64
   23630:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
   23637:	4c 89 e2             	mov    rdx,r12
   2363a:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23641:	44 89 e9             	mov    ecx,r13d
   23644:	48 8d 35 a5 c7 0a 00 	lea    rsi,[rip+0xac7a5]        # cfdf0 <_IO_stdin_used+0x3df0>
   2364b:	48 2b 50 18          	sub    rdx,QWORD PTR [rax+0x18]
   2364f:	31 c0                	xor    eax,eax
   23651:	83 ea 01             	sub    edx,0x1
   23654:	e8 37 f4 00 00       	call   32a90 <JS_ThrowInternalError>
   23659:	e9 42 fb ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2365e:	f3 0f 1e fa          	endbr64
   23662:	f3 0f 1e fa          	endbr64
   23666:	31 c9                	xor    ecx,ecx
   23668:	b8 02 00 00 00       	mov    eax,0x2
   2366d:	e9 ae fb ff ff       	jmp    23220 <JS_CallInternal+0x820>
   23672:	f3 0f 1e fa          	endbr64
   23676:	f3 0f 1e fa          	endbr64
   2367a:	48 83 ec 08          	sub    rsp,0x8
   2367e:	31 c0                	xor    eax,eax
   23680:	41 83 fd 54          	cmp    r13d,0x54
   23684:	41 0f b6 4c 24 04    	movzx  ecx,BYTE PTR [r12+0x4]
   2368a:	0f 94 c0             	sete   al
   2368d:	41 8b 14 24          	mov    edx,DWORD PTR [r12]
   23691:	48 89 de             	mov    rsi,rbx
   23694:	4d 8d 74 24 05       	lea    r14,[r12+0x5]
   23699:	4c 8b 8d c8 fe ff ff 	mov    r9,QWORD PTR [rbp-0x138]
   236a0:	4c 8b 85 98 fe ff ff 	mov    r8,QWORD PTR [rbp-0x168]
   236a7:	50                   	push   rax
   236a8:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   236af:	e8 8c 51 06 00       	call   88840 <js_op_define_class>
   236b4:	41 59                	pop    r9
   236b6:	41 5a                	pop    r10
   236b8:	85 c0                	test   eax,eax
   236ba:	0f 88 a4 84 00 00    	js     2bb64 <JS_CallInternal+0x9164>
   236c0:	41 0f b6 44 24 05    	movzx  eax,BYTE PTR [r12+0x5]
   236c6:	49 83 c4 06          	add    r12,0x6
   236ca:	49 89 c5             	mov    r13,rax
   236cd:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   236d1:	ff e0                	jmp    rax
   236d3:	f3 0f 1e fa          	endbr64
   236d7:	f3 0f 1e fa          	endbr64
   236db:	41 83 fd 52          	cmp    r13d,0x52
   236df:	0f 94 85 50 fe ff ff 	sete   BYTE PTR [rbp-0x1b0]
   236e6:	0f b6 85 50 fe ff ff 	movzx  eax,BYTE PTR [rbp-0x1b0]
   236ed:	41 0f 94 c6          	sete   r14b
   236f1:	45 0f b6 f6          	movzx  r14d,r14b
   236f5:	84 c0                	test   al,al
   236f7:	0f 85 4a 5c 00 00    	jne    29347 <JS_CallInternal+0x6947>
   236fd:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   23701:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
   23706:	89 85 40 fe ff ff    	mov    DWORD PTR [rbp-0x1c0],eax
   2370c:	b8 fe ff ff ff       	mov    eax,0xfffffffe
   23711:	41 0f b6 55 00       	movzx  edx,BYTE PTR [r13+0x0]
   23716:	bf 03 00 00 00       	mov    edi,0x3
   2371b:	48 c7 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],0x0
   23722:	00 00 00 00 
   23726:	44 29 f0             	sub    eax,r14d
   23729:	48 89 bd 18 fe ff ff 	mov    QWORD PTR [rbp-0x1e8],rdi
   23730:	4c 8d 63 f0          	lea    r12,[rbx-0x10]
   23734:	48 98                	cdqe
   23736:	48 89 bd 08 fe ff ff 	mov    QWORD PTR [rbp-0x1f8],rdi
   2373d:	48 c7 85 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],0x3
   23744:	03 00 00 00 
   23748:	48 c1 e0 04          	shl    rax,0x4
   2374c:	48 8b 0c 03          	mov    rcx,QWORD PTR [rbx+rax*1]
   23750:	48 8b 44 03 08       	mov    rax,QWORD PTR [rbx+rax*1+0x8]
   23755:	48 89 85 d0 fd ff ff 	mov    QWORD PTR [rbp-0x230],rax
   2375c:	89 d0                	mov    eax,edx
   2375e:	83 e0 04             	and    eax,0x4
   23761:	48 89 8d d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rcx
   23768:	3c 01                	cmp    al,0x1
   2376a:	19 c0                	sbb    eax,eax
   2376c:	31 f6                	xor    esi,esi
   2376e:	83 e0 fc             	and    eax,0xfffffffc
   23771:	48 89 b5 10 fe ff ff 	mov    QWORD PTR [rbp-0x1f0],rsi
   23778:	48 89 b5 00 fe ff ff 	mov    QWORD PTR [rbp-0x200],rsi
   2377f:	05 05 45 00 00       	add    eax,0x4505
   23784:	83 e2 03             	and    edx,0x3
   23787:	0f 85 34 55 00 00    	jne    28cc1 <JS_CallInternal+0x62c1>
   2378d:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   23791:	0d 02 22 00 00       	or     eax,0x2202
   23796:	8b b5 40 fe ff ff    	mov    esi,DWORD PTR [rbp-0x1c0]
   2379c:	89 85 24 fe ff ff    	mov    DWORD PTR [rbp-0x1dc],eax
   237a2:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   237a9:	48 89 8d 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rcx
   237b0:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
   237b4:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
   237b8:	48 89 85 c8 fd ff ff 	mov    QWORD PTR [rbp-0x238],rax
   237bf:	48 89 8d 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rcx
   237c6:	48 89 8d c0 fd ff ff 	mov    QWORD PTR [rbp-0x240],rcx
   237cd:	e8 4e c8 01 00       	call   40020 <js_get_function_name>
   237d2:	49 89 d1             	mov    r9,rdx
   237d5:	41 83 f9 06          	cmp    r9d,0x6
   237d9:	0f 84 f3 65 00 00    	je     29dd2 <JS_CallInternal+0x73d2>
   237df:	48 83 ec 08          	sub    rsp,0x8
   237e3:	49 89 c0             	mov    r8,rax
   237e6:	b9 3a 00 00 00       	mov    ecx,0x3a
   237eb:	48 8b 95 c0 fd ff ff 	mov    rdx,QWORD PTR [rbp-0x240]
   237f2:	48 8b b5 c8 fd ff ff 	mov    rsi,QWORD PTR [rbp-0x238]
   237f9:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23800:	6a 01                	push   0x1
   23802:	48 89 95 c8 fd ff ff 	mov    QWORD PTR [rbp-0x238],rdx
   23809:	48 89 b5 c0 fd ff ff 	mov    QWORD PTR [rbp-0x240],rsi
   23810:	e8 1b c0 00 00       	call   2f830 <JS_DefinePropertyValue>
   23815:	41 5b                	pop    r11
   23817:	5a                   	pop    rdx
   23818:	85 c0                	test   eax,eax
   2381a:	0f 88 b2 65 00 00    	js     29dd2 <JS_CallInternal+0x73d2>
   23820:	4c 8b 95 d8 fd ff ff 	mov    r10,QWORD PTR [rbp-0x228]
   23827:	48 8b 85 d0 fd ff ff 	mov    rax,QWORD PTR [rbp-0x230]
   2382e:	48 8b b5 c0 fd ff ff 	mov    rsi,QWORD PTR [rbp-0x240]
   23835:	48 8b 95 c8 fd ff ff 	mov    rdx,QWORD PTR [rbp-0x238]
   2383c:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23843:	4c 89 d1             	mov    rcx,r10
   23846:	49 89 c0             	mov    r8,rax
   23849:	4c 89 95 d0 fd ff ff 	mov    QWORD PTR [rbp-0x230],r10
   23850:	48 89 85 d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rax
   23857:	e8 94 a8 ff ff       	call   1e0f0 <js_method_set_home_object>
   2385c:	8b 85 24 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1dc]
   23862:	48 83 ec 08          	sub    rsp,0x8
   23866:	8b 8d 40 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c0]
   2386c:	4c 8b 85 38 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c8]
   23873:	4c 8b 8d 28 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1d8]
   2387a:	48 8b b5 d0 fd ff ff 	mov    rsi,QWORD PTR [rbp-0x230]
   23881:	48 8b 95 d8 fd ff ff 	mov    rdx,QWORD PTR [rbp-0x228]
   23888:	50                   	push   rax
   23889:	ff b5 08 fe ff ff    	push   QWORD PTR [rbp-0x1f8]
   2388f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23896:	ff b5 00 fe ff ff    	push   QWORD PTR [rbp-0x200]
   2389c:	ff b5 18 fe ff ff    	push   QWORD PTR [rbp-0x1e8]
   238a2:	ff b5 10 fe ff ff    	push   QWORD PTR [rbp-0x1f0]
   238a8:	e8 f3 b0 00 00       	call   2e9a0 <JS_DefineProperty>
   238ad:	48 83 c4 30          	add    rsp,0x30
   238b1:	89 c1                	mov    ecx,eax
   238b3:	49 8b 54 24 08       	mov    rdx,QWORD PTR [r12+0x8]
   238b8:	49 8b 34 24          	mov    rsi,QWORD PTR [r12]
   238bc:	83 fa f6             	cmp    edx,0xfffffff6
   238bf:	76 11                	jbe    238d2 <JS_CallInternal+0xed2>
   238c1:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   238c4:	83 e8 01             	sub    eax,0x1
   238c7:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   238ca:	85 c0                	test   eax,eax
   238cc:	0f 8e 8e 64 00 00    	jle    29d60 <JS_CallInternal+0x7360>
   238d2:	80 bd 50 fe ff ff 00 	cmp    BYTE PTR [rbp-0x1b0],0x0
   238d9:	0f 85 bc 55 00 00    	jne    28e9b <JS_CallInternal+0x649b>
   238df:	41 8d 46 01          	lea    eax,[r14+0x1]
   238e3:	4d 8d 65 01          	lea    r12,[r13+0x1]
   238e7:	48 98                	cdqe
   238e9:	48 c1 e0 04          	shl    rax,0x4
   238ed:	48 29 c3             	sub    rbx,rax
   238f0:	85 c9                	test   ecx,ecx
   238f2:	0f 88 a8 f8 ff ff    	js     231a0 <JS_CallInternal+0x7a0>
   238f8:	41 0f b6 45 01       	movzx  eax,BYTE PTR [r13+0x1]
   238fd:	4d 8d 65 02          	lea    r12,[r13+0x2]
   23901:	49 89 c5             	mov    r13,rax
   23904:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   23908:	f3 0f 1e fa          	endbr64
   2390c:	f3 0f 1e fa          	endbr64
   23910:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   23915:	48 8b 8d 98 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x168]
   2391c:	4d 8d 74 24 02       	lea    r14,[r12+0x2]
   23921:	48 8b 14 c1          	mov    rdx,QWORD PTR [rcx+rax*8]
   23925:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
   2392c:	00 
   2392d:	48 8b 42 18          	mov    rax,QWORD PTR [rdx+0x18]
   23931:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
   23935:	83 f9 04             	cmp    ecx,0x4
   23938:	0f 84 62 5b 00 00    	je     294a0 <JS_CallInternal+0x6aa0>
   2393e:	80 7a 12 00          	cmp    BYTE PTR [rdx+0x12],0x0
   23942:	0f 85 58 5b 00 00    	jne    294a0 <JS_CallInternal+0x6aa0>
   23948:	f3 0f 6f 63 f0       	movdqu xmm4,XMMWORD PTR [rbx-0x10]
   2394d:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   23950:	0f 11 20             	movups XMMWORD PTR [rax],xmm4
   23953:	83 f9 f6             	cmp    ecx,0xfffffff6
   23956:	76 11                	jbe    23969 <JS_CallInternal+0xf69>
   23958:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2395b:	83 e8 01             	sub    eax,0x1
   2395e:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   23961:	85 c0                	test   eax,eax
   23963:	0f 8e 18 64 00 00    	jle    29d81 <JS_CallInternal+0x7381>
   23969:	48 83 eb 10          	sub    rbx,0x10
   2396d:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
   23973:	49 83 c4 03          	add    r12,0x3
   23977:	49 89 c5             	mov    r13,rax
   2397a:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2397e:	ff e0                	jmp    rax
   23980:	f3 0f 1e fa          	endbr64
   23984:	f3 0f 1e fa          	endbr64
   23988:	45 0f b7 0c 24       	movzx  r9d,WORD PTR [r12]
   2398d:	49 89 db             	mov    r11,rbx
   23990:	49 8d 4c 24 02       	lea    rcx,[r12+0x2]
   23995:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2399c:	48 89 8d 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rcx
   239a3:	4c 89 c8             	mov    rax,r9
   239a6:	44 89 8d 38 fe ff ff 	mov    DWORD PTR [rbp-0x1c8],r9d
   239ad:	48 c1 e0 04          	shl    rax,0x4
   239b1:	49 29 c3             	sub    r11,rax
   239b4:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
   239bb:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   239c2:	49 8b 73 f0          	mov    rsi,QWORD PTR [r11-0x10]
   239c6:	49 8b 53 f8          	mov    rdx,QWORD PTR [r11-0x8]
   239ca:	4d 8d 73 e0          	lea    r14,[r11-0x20]
   239ce:	48 89 48 30          	mov    QWORD PTR [rax+0x30],rcx
   239d2:	4d 8b 46 08          	mov    r8,QWORD PTR [r14+0x8]
   239d6:	49 8b 4b e0          	mov    rcx,QWORD PTR [r11-0x20]
   239da:	6a 00                	push   0x0
   239dc:	41 53                	push   r11
   239de:	4c 89 9d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r11
   239e5:	6a 03                	push   0x3
   239e7:	6a 00                	push   0x0
   239e9:	e8 12 f0 ff ff       	call   22a00 <JS_CallInternal>
   239ee:	48 83 c4 20          	add    rsp,0x20
   239f2:	4c 8b 9d 50 fe ff ff 	mov    r11,QWORD PTR [rbp-0x1b0]
   239f9:	4c 8b 95 40 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c0]
   23a00:	83 fa 06             	cmp    edx,0x6
   23a03:	48 89 d1             	mov    rcx,rdx
   23a06:	0f 84 52 65 00 00    	je     29f5e <JS_CallInternal+0x755e>
   23a0c:	41 83 fd 25          	cmp    r13d,0x25
   23a10:	0f 84 dd f6 ff ff    	je     230f3 <JS_CallInternal+0x6f3>
   23a16:	4f 8d 2c 13          	lea    r13,[r11+r10*1]
   23a1a:	48 89 9d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rbx
   23a21:	4c 89 f3             	mov    rbx,r14
   23a24:	49 89 d6             	mov    r14,rdx
   23a27:	4c 89 a5 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r12
   23a2e:	4d 89 ec             	mov    r12,r13
   23a31:	49 89 c5             	mov    r13,rax
   23a34:	eb 17                	jmp    23a4d <JS_CallInternal+0x104d>
   23a36:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   23a3d:	00 00 00 
   23a40:	48 83 c3 10          	add    rbx,0x10
   23a44:	4c 39 e3             	cmp    rbx,r12
   23a47:	0f 84 f8 51 00 00    	je     28c45 <JS_CallInternal+0x6245>
   23a4d:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
   23a51:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
   23a54:	83 f9 f6             	cmp    ecx,0xfffffff6
   23a57:	76 e7                	jbe    23a40 <JS_CallInternal+0x1040>
   23a59:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   23a5c:	8d 50 ff             	lea    edx,[rax-0x1]
   23a5f:	89 56 fc             	mov    DWORD PTR [rsi-0x4],edx
   23a62:	85 d2                	test   edx,edx
   23a64:	7f da                	jg     23a40 <JS_CallInternal+0x1040>
   23a66:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   23a6d:	48 89 ca             	mov    rdx,rcx
   23a70:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   23a74:	e8 f7 8d ff ff       	call   1c870 <__JS_FreeValueRT>
   23a79:	eb c5                	jmp    23a40 <JS_CallInternal+0x1040>
   23a7b:	f3 0f 1e fa          	endbr64
   23a7f:	f3 0f 1e fa          	endbr64
   23a83:	49 8d 44 24 02       	lea    rax,[r12+0x2]
   23a88:	45 0f b7 14 24       	movzx  r10d,WORD PTR [r12]
   23a8d:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   23a94:	e9 3f f3 ff ff       	jmp    22dd8 <JS_CallInternal+0x3d8>
   23a99:	f3 0f 1e fa          	endbr64
   23a9d:	f3 0f 1e fa          	endbr64
   23aa1:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   23aa6:	48 8b bd 98 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x168]
   23aad:	4d 8d 74 24 02       	lea    r14,[r12+0x2]
   23ab2:	48 8d 0c c5 00 00 00 	lea    rcx,[rax*8+0x0]
   23ab9:	00 
   23aba:	48 8b 04 c7          	mov    rax,QWORD PTR [rdi+rax*8]
   23abe:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   23ac2:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   23ac5:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   23ac9:	83 f8 04             	cmp    eax,0x4
   23acc:	0f 84 6e 63 00 00    	je     29e40 <JS_CallInternal+0x7440>
   23ad2:	83 f8 f6             	cmp    eax,0xfffffff6
   23ad5:	76 04                	jbe    23adb <JS_CallInternal+0x10db>
   23ad7:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   23adb:	48 89 13             	mov    QWORD PTR [rbx],rdx
   23ade:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
   23ae2:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
   23ae8:	48 83 c3 10          	add    rbx,0x10
   23aec:	49 83 c4 03          	add    r12,0x3
   23af0:	49 89 c5             	mov    r13,rax
   23af3:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   23af7:	ff e0                	jmp    rax
   23af9:	f3 0f 1e fa          	endbr64
   23afd:	45 0f b7 0c 24       	movzx  r9d,WORD PTR [r12]
   23b02:	49 89 de             	mov    r14,rbx
   23b05:	4d 8d 54 24 02       	lea    r10,[r12+0x2]
   23b0a:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23b11:	4c 89 95 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r10
   23b18:	4c 89 c8             	mov    rax,r9
   23b1b:	44 89 8d 40 fe ff ff 	mov    DWORD PTR [rbp-0x1c0],r9d
   23b22:	48 c1 e0 04          	shl    rax,0x4
   23b26:	49 29 c6             	sub    r14,rax
   23b29:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
   23b30:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   23b37:	4d 8b 46 f8          	mov    r8,QWORD PTR [r14-0x8]
   23b3b:	49 8b 4e f0          	mov    rcx,QWORD PTR [r14-0x10]
   23b3f:	4d 8d 6e e0          	lea    r13,[r14-0x20]
   23b43:	49 8b 76 e0          	mov    rsi,QWORD PTR [r14-0x20]
   23b47:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
   23b4b:	4c 89 50 30          	mov    QWORD PTR [rax+0x30],r10
   23b4f:	6a 00                	push   0x0
   23b51:	41 56                	push   r14
   23b53:	e8 98 cb 06 00       	call   906f0 <JS_CallConstructorInternal>
   23b58:	41 5a                	pop    r10
   23b5a:	4c 8b 95 50 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1b0]
   23b61:	83 fa 06             	cmp    edx,0x6
   23b64:	49 89 c1             	mov    r9,rax
   23b67:	49 89 d0             	mov    r8,rdx
   23b6a:	41 5b                	pop    r11
   23b6c:	0f 84 1c 6d 00 00    	je     2a88e <JS_CallInternal+0x7e8e>
   23b72:	4c 8b 9d 38 fe ff ff 	mov    r11,QWORD PTR [rbp-0x1c8]
   23b79:	4d 01 de             	add    r14,r11
   23b7c:	eb 0f                	jmp    23b8d <JS_CallInternal+0x118d>
   23b7e:	66 90                	xchg   ax,ax
   23b80:	49 83 c5 10          	add    r13,0x10
   23b84:	4d 39 f5             	cmp    r13,r14
   23b87:	0f 84 d9 51 00 00    	je     28d66 <JS_CallInternal+0x6366>
   23b8d:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
   23b91:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
   23b95:	83 fa f6             	cmp    edx,0xfffffff6
   23b98:	76 e6                	jbe    23b80 <JS_CallInternal+0x1180>
   23b9a:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   23b9d:	83 e8 01             	sub    eax,0x1
   23ba0:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   23ba3:	85 c0                	test   eax,eax
   23ba5:	7f d9                	jg     23b80 <JS_CallInternal+0x1180>
   23ba7:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   23bae:	4c 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r8
   23bb5:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
   23bbc:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   23bc0:	e8 ab 8c ff ff       	call   1c870 <__JS_FreeValueRT>
   23bc5:	4c 8b 85 38 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c8]
   23bcc:	4c 8b 8d 50 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1b0]
   23bd3:	eb ab                	jmp    23b80 <JS_CallInternal+0x1180>
   23bd5:	f3 0f 1e fa          	endbr64
   23bd9:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   23be0:	4c 8b 43 f8          	mov    r8,QWORD PTR [rbx-0x8]
   23be4:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
   23be8:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   23bec:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   23bf0:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   23bf4:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23bfb:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   23bff:	e8 5c 4a 08 00       	call   a8660 <js_dynamic_import>
   23c04:	49 89 d0             	mov    r8,rdx
   23c07:	83 fa 06             	cmp    edx,0x6
   23c0a:	0f 84 90 f5 ff ff    	je     231a0 <JS_CallInternal+0x7a0>
   23c10:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   23c14:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   23c18:	83 fa f6             	cmp    edx,0xfffffff6
   23c1b:	76 11                	jbe    23c2e <JS_CallInternal+0x122e>
   23c1d:	8b 5e fc             	mov    ebx,DWORD PTR [rsi-0x4]
   23c20:	8d 4b ff             	lea    ecx,[rbx-0x1]
   23c23:	89 4e fc             	mov    DWORD PTR [rsi-0x4],ecx
   23c26:	85 c9                	test   ecx,ecx
   23c28:	0f 8e e2 6b 00 00    	jle    2a810 <JS_CallInternal+0x7e10>
   23c2e:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   23c32:	49 8b 36             	mov    rsi,QWORD PTR [r14]
   23c35:	83 fa f6             	cmp    edx,0xfffffff6
   23c38:	76 11                	jbe    23c4b <JS_CallInternal+0x124b>
   23c3a:	8b 4e fc             	mov    ecx,DWORD PTR [rsi-0x4]
   23c3d:	83 e9 01             	sub    ecx,0x1
   23c40:	89 4e fc             	mov    DWORD PTR [rsi-0x4],ecx
   23c43:	85 c9                	test   ecx,ecx
   23c45:	0f 8e f6 6b 00 00    	jle    2a841 <JS_CallInternal+0x7e41>
   23c4b:	49 89 46 f0          	mov    QWORD PTR [r14-0x10],rax
   23c4f:	4c 89 f3             	mov    rbx,r14
   23c52:	49 83 c4 01          	add    r12,0x1
   23c56:	4d 89 46 f8          	mov    QWORD PTR [r14-0x8],r8
   23c5a:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   23c60:	49 89 c5             	mov    r13,rax
   23c63:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   23c67:	ff e0                	jmp    rax
   23c69:	f3 0f 1e fa          	endbr64
   23c6d:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   23c74:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   23c78:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   23c7c:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23c83:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   23c87:	e8 74 e6 ff ff       	call   22300 <JS_GetPrototype>
   23c8c:	49 89 c6             	mov    r14,rax
   23c8f:	48 89 d1             	mov    rcx,rdx
   23c92:	83 fa 06             	cmp    edx,0x6
   23c95:	0f 84 05 f5 ff ff    	je     231a0 <JS_CallInternal+0x7a0>
   23c9b:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   23c9f:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   23ca3:	83 fa f6             	cmp    edx,0xfffffff6
   23ca6:	76 11                	jbe    23cb9 <JS_CallInternal+0x12b9>
   23ca8:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   23cab:	83 e8 01             	sub    eax,0x1
   23cae:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   23cb1:	85 c0                	test   eax,eax
   23cb3:	0f 8e e8 66 00 00    	jle    2a3a1 <JS_CallInternal+0x79a1>
   23cb9:	4c 89 73 f0          	mov    QWORD PTR [rbx-0x10],r14
   23cbd:	49 83 c4 01          	add    r12,0x1
   23cc1:	48 89 4b f8          	mov    QWORD PTR [rbx-0x8],rcx
   23cc5:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   23ccb:	49 89 c5             	mov    r13,rax
   23cce:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   23cd2:	ff e0                	jmp    rax
   23cd4:	f3 0f 1e fa          	endbr64
   23cd8:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
   23cdc:	4c 8d 6b e0          	lea    r13,[rbx-0x20]
   23ce0:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
   23ce4:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   23ce8:	49 8b 5e 08          	mov    rbx,QWORD PTR [r14+0x8]
   23cec:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
   23cf3:	49 8b 45 08          	mov    rax,QWORD PTR [r13+0x8]
   23cf7:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   23cfe:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
   23d05:	83 fb f9             	cmp    ebx,0xfffffff9
   23d08:	0f 85 a4 5e 00 00    	jne    29bb2 <JS_CallInternal+0x71b2>
   23d0e:	83 f8 f9             	cmp    eax,0xfffffff9
   23d11:	0f 85 9b 5e 00 00    	jne    29bb2 <JS_CallInternal+0x71b2>
   23d17:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23d1e:	ba 12 00 00 00       	mov    edx,0x12
   23d23:	48 8d 8d 50 ff ff ff 	lea    rcx,[rbp-0xb0]
   23d2a:	48 c7 85 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],0x0
   23d31:	00 00 00 00 
   23d35:	48 c7 85 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],0x0
   23d3c:	00 00 00 00 
   23d40:	48 8b 77 48          	mov    rsi,QWORD PTR [rdi+0x48]
   23d44:	83 46 fc 01          	add    DWORD PTR [rsi-0x4],0x1
   23d48:	e8 d3 1f 02 00       	call   45d20 <JS_NewObjectFromShape>
   23d4d:	83 fa 06             	cmp    edx,0x6
   23d50:	0f 84 71 5e 00 00    	je     29bc7 <JS_CallInternal+0x71c7>
   23d56:	f3 0f 7e 85 40 fe ff 	movq   xmm0,QWORD PTR [rbp-0x1c0]
   23d5d:	ff 
   23d5e:	0f 16 85 50 fe ff ff 	movhps xmm0,QWORD PTR [rbp-0x1b0]
   23d65:	0f 11 40 28          	movups XMMWORD PTR [rax+0x28],xmm0
   23d69:	49 89 45 00          	mov    QWORD PTR [r13+0x0],rax
   23d6d:	49 89 55 08          	mov    QWORD PTR [r13+0x8],rdx
   23d71:	41 83 7e f8 06       	cmp    DWORD PTR [r14-0x8],0x6
   23d76:	0f 84 fe 6a 00 00    	je     2a87a <JS_CallInternal+0x7e7a>
   23d7c:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   23d81:	4c 89 f3             	mov    rbx,r14
   23d84:	49 83 c4 01          	add    r12,0x1
   23d88:	49 89 c5             	mov    r13,rax
   23d8b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   23d8f:	ff e0                	jmp    rax
   23d91:	f3 0f 1e fa          	endbr64
   23d95:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   23d9a:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   23d9e:	48 8d b5 f0 fe ff ff 	lea    rsi,[rbp-0x110]
   23da5:	48 8b 8d c8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x138]
   23dac:	4c 8b ad e8 fe ff ff 	mov    r13,QWORD PTR [rbp-0x118]
   23db3:	66 89 85 38 fe ff ff 	mov    WORD PTR [rbp-0x1c8],ax
   23dba:	49 8d 44 24 02       	lea    rax,[r12+0x2]
   23dbf:	48 89 41 30          	mov    QWORD PTR [rcx+0x30],rax
   23dc3:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
   23dc7:	4c 89 ef             	mov    rdi,r13
   23dca:	48 89 85 10 fe ff ff 	mov    QWORD PTR [rbp-0x1f0],rax
   23dd1:	48 8d 43 f0          	lea    rax,[rbx-0x10]
   23dd5:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   23ddc:	e8 7f 03 06 00       	call   84160 <build_arg_list>
   23de1:	49 89 c6             	mov    r14,rax
   23de4:	48 85 c0             	test   rax,rax
   23de7:	0f 84 4c 64 00 00    	je     2a239 <JS_CallInternal+0x7839>
   23ded:	f3 41 0f 6f 9d 70 01 	movdqu xmm3,XMMWORD PTR [r13+0x170]
   23df4:	00 00 
   23df6:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
   23dfa:	41 b8 01 00 00 00    	mov    r8d,0x1
   23e00:	4c 8b 6b e8          	mov    r13,QWORD PTR [rbx-0x18]
   23e04:	0f 29 9d 40 fe ff ff 	movaps XMMWORD PTR [rbp-0x1c0],xmm3
   23e0b:	48 8b 95 40 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c0]
   23e12:	48 89 c7             	mov    rdi,rax
   23e15:	48 8b 8d 48 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b8]
   23e1c:	4c 89 ee             	mov    rsi,r13
   23e1f:	48 89 85 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rax
   23e26:	e8 75 66 ff ff       	call   1a4a0 <js_strict_eq2.isra.0>
   23e2b:	44 8b 95 f0 fe ff ff 	mov    r10d,DWORD PTR [rbp-0x110]
   23e32:	85 c0                	test   eax,eax
   23e34:	0f 84 8e 59 00 00    	je     297c8 <JS_CallInternal+0x6dc8>
   23e3a:	45 85 d2             	test   r10d,r10d
   23e3d:	0f 84 78 59 00 00    	je     297bb <JS_CallInternal+0x6dbb>
   23e43:	49 8b 0e             	mov    rcx,QWORD PTR [r14]
   23e46:	4d 8b 46 08          	mov    r8,QWORD PTR [r14+0x8]
   23e4a:	0f b7 85 38 fe ff ff 	movzx  eax,WORD PTR [rbp-0x1c8]
   23e51:	48 83 ec 08          	sub    rsp,0x8
   23e55:	31 f6                	xor    esi,esi
   23e57:	ba 03 00 00 00       	mov    edx,0x3
   23e5c:	44 89 95 28 fe ff ff 	mov    DWORD PTR [rbp-0x1d8],r10d
   23e63:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23e6a:	41 b9 02 00 00 00    	mov    r9d,0x2
   23e70:	83 e8 02             	sub    eax,0x2
   23e73:	50                   	push   rax
   23e74:	e8 07 e4 01 00       	call   42280 <JS_EvalObject>
   23e79:	44 8b 95 28 fe ff ff 	mov    r10d,DWORD PTR [rbp-0x1d8]
   23e80:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
   23e87:	49 89 d5             	mov    r13,rdx
   23e8a:	59                   	pop    rcx
   23e8b:	5e                   	pop    rsi
   23e8c:	45 85 d2             	test   r10d,r10d
   23e8f:	0f 84 9e 6f 00 00    	je     2ae33 <JS_CallInternal+0x8433>
   23e95:	45 89 d0             	mov    r8d,r10d
   23e98:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   23e9f:	48 89 9d 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rbx
   23ea6:	4c 89 f3             	mov    rbx,r14
   23ea9:	49 c1 e0 04          	shl    r8,0x4
   23ead:	4c 89 a5 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],r12
   23eb4:	4d 01 f0             	add    r8,r14
   23eb7:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
   23ebb:	4d 89 c4             	mov    r12,r8
   23ebe:	eb 0d                	jmp    23ecd <JS_CallInternal+0x14cd>
   23ec0:	48 83 c3 10          	add    rbx,0x10
   23ec4:	4c 39 e3             	cmp    rbx,r12
   23ec7:	0f 84 cc 4e 00 00    	je     28d99 <JS_CallInternal+0x6399>
   23ecd:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
   23ed1:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
   23ed4:	83 f9 f6             	cmp    ecx,0xfffffff6
   23ed7:	76 e7                	jbe    23ec0 <JS_CallInternal+0x14c0>
   23ed9:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   23edc:	8d 50 ff             	lea    edx,[rax-0x1]
   23edf:	89 56 fc             	mov    DWORD PTR [rsi-0x4],edx
   23ee2:	85 d2                	test   edx,edx
   23ee4:	7f da                	jg     23ec0 <JS_CallInternal+0x14c0>
   23ee6:	48 89 ca             	mov    rdx,rcx
   23ee9:	e8 82 89 ff ff       	call   1c870 <__JS_FreeValueRT>
   23eee:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   23ef5:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   23ef9:	eb c5                	jmp    23ec0 <JS_CallInternal+0x14c0>
   23efb:	f3 0f 1e fa          	endbr64
   23eff:	41 0f b7 0c 24       	movzx  ecx,WORD PTR [r12]
   23f04:	49 89 dd             	mov    r13,rbx
   23f07:	41 0f b7 7c 24 02    	movzx  edi,WORD PTR [r12+0x2]
   23f0d:	41 b8 01 00 00 00    	mov    r8d,0x1
   23f13:	48 89 c8             	mov    rax,rcx
   23f16:	89 8d 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],ecx
   23f1c:	49 8d 4c 24 04       	lea    rcx,[r12+0x4]
   23f21:	48 c1 e0 04          	shl    rax,0x4
   23f25:	66 89 bd 38 fe ff ff 	mov    WORD PTR [rbp-0x1c8],di
   23f2c:	49 29 c5             	sub    r13,rax
   23f2f:	49 89 c6             	mov    r14,rax
   23f32:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   23f39:	48 89 8d 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rcx
   23f40:	49 8b 7d f0          	mov    rdi,QWORD PTR [r13-0x10]
   23f44:	49 8b 75 f8          	mov    rsi,QWORD PTR [r13-0x8]
   23f48:	48 89 48 30          	mov    QWORD PTR [rax+0x30],rcx
   23f4c:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   23f53:	f3 0f 6f b8 70 01 00 	movdqu xmm7,XMMWORD PTR [rax+0x170]
   23f5a:	00 
   23f5b:	0f 29 bd 40 fe ff ff 	movaps XMMWORD PTR [rbp-0x1c0],xmm7
   23f62:	48 8b 95 40 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c0]
   23f69:	48 8b 8d 48 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b8]
   23f70:	e8 2b 65 ff ff       	call   1a4a0 <js_strict_eq2.isra.0>
   23f75:	85 c0                	test   eax,eax
   23f77:	0f 84 ca 58 00 00    	je     29847 <JS_CallInternal+0x6e47>
   23f7d:	44 8b 9d 50 fe ff ff 	mov    r11d,DWORD PTR [rbp-0x1b0]
   23f84:	45 85 db             	test   r11d,r11d
   23f87:	0f 84 1a 58 00 00    	je     297a7 <JS_CallInternal+0x6da7>
   23f8d:	49 8b 4d 00          	mov    rcx,QWORD PTR [r13+0x0]
   23f91:	4d 8b 45 08          	mov    r8,QWORD PTR [r13+0x8]
   23f95:	0f b7 85 38 fe ff ff 	movzx  eax,WORD PTR [rbp-0x1c8]
   23f9c:	48 83 ec 08          	sub    rsp,0x8
   23fa0:	41 b9 02 00 00 00    	mov    r9d,0x2
   23fa6:	31 f6                	xor    esi,esi
   23fa8:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   23faf:	ba 03 00 00 00       	mov    edx,0x3
   23fb4:	83 e8 02             	sub    eax,0x2
   23fb7:	50                   	push   rax
   23fb8:	e8 c3 e2 01 00       	call   42280 <JS_EvalObject>
   23fbd:	5f                   	pop    rdi
   23fbe:	41 5a                	pop    r10
   23fc0:	49 89 c1             	mov    r9,rax
   23fc3:	49 89 d0             	mov    r8,rdx
   23fc6:	49 8d 45 f0          	lea    rax,[r13-0x10]
   23fca:	4d 01 f5             	add    r13,r14
   23fcd:	49 89 c6             	mov    r14,rax
   23fd0:	41 83 f8 06          	cmp    r8d,0x6
   23fd4:	75 17                	jne    23fed <JS_CallInternal+0x15ed>
   23fd6:	e9 a7 68 00 00       	jmp    2a882 <JS_CallInternal+0x7e82>
   23fdb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   23fe0:	49 83 c6 10          	add    r14,0x10
   23fe4:	4d 39 ee             	cmp    r14,r13
   23fe7:	0f 84 46 4d 00 00    	je     28d33 <JS_CallInternal+0x6333>
   23fed:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   23ff1:	49 8b 36             	mov    rsi,QWORD PTR [r14]
   23ff4:	83 fa f6             	cmp    edx,0xfffffff6
   23ff7:	76 e7                	jbe    23fe0 <JS_CallInternal+0x15e0>
   23ff9:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   23ffc:	83 e8 01             	sub    eax,0x1
   23fff:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24002:	85 c0                	test   eax,eax
   24004:	7f da                	jg     23fe0 <JS_CallInternal+0x15e0>
   24006:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2400d:	4c 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r8
   24014:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   2401b:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2401f:	e8 4c 88 ff ff       	call   1c870 <__JS_FreeValueRT>
   24024:	4c 8b 85 38 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c8]
   2402b:	4c 8b 8d 40 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c0]
   24032:	eb ac                	jmp    23fe0 <JS_CallInternal+0x15e0>
   24034:	f3 0f 1e fa          	endbr64
   24038:	41 0f b6 44 24 04    	movzx  eax,BYTE PTR [r12+0x4]
   2403e:	41 8b 34 24          	mov    esi,DWORD PTR [r12]
   24042:	49 83 c4 05          	add    r12,0x5
   24046:	3c 04                	cmp    al,0x4
   24048:	0f 87 5d 5f 00 00    	ja     29fab <JS_CallInternal+0x75ab>
   2404e:	48 8d 15 0f 20 0b 00 	lea    rdx,[rip+0xb200f]        # d6064 <qjsc_repl_size+0x458>
   24055:	48 63 04 82          	movsxd rax,DWORD PTR [rdx+rax*4]
   24059:	48 01 d0             	add    rax,rdx
   2405c:	3e ff e0             	notrack jmp rax
   2405f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   24066:	48 8d 35 c3 bc 0a 00 	lea    rsi,[rip+0xabcc3]        # cfd30 <_IO_stdin_used+0x3d30>
   2406d:	31 c0                	xor    eax,eax
   2406f:	e8 2c e7 00 00       	call   327a0 <JS_ThrowReferenceError>
   24074:	e9 27 f1 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   24079:	48 8d 15 1a 84 0a 00 	lea    rdx,[rip+0xa841a]        # cc49a <_IO_stdin_used+0x49a>
   24080:	85 f6                	test   esi,esi
   24082:	0f 85 0f 7b 00 00    	jne    2bb97 <JS_CallInternal+0x9197>
   24088:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2408f:	48 8d 35 60 84 0a 00 	lea    rsi,[rip+0xa8460]        # cc4f6 <_IO_stdin_used+0x4f6>
   24096:	31 c0                	xor    eax,eax
   24098:	e8 03 e7 00 00       	call   327a0 <JS_ThrowReferenceError>
   2409d:	e9 fe f0 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   240a2:	4c 8b bd e8 fe ff ff 	mov    r15,QWORD PTR [rbp-0x118]
   240a9:	48 8d 45 80          	lea    rax,[rbp-0x80]
   240ad:	89 f2                	mov    edx,esi
   240af:	48 89 c6             	mov    rsi,rax
   240b2:	49 8b 7f 10          	mov    rdi,QWORD PTR [r15+0x10]
   240b6:	e8 25 32 ff ff       	call   172e0 <JS_AtomGetStrRT.constprop.0>
   240bb:	48 8d 35 1e 84 0a 00 	lea    rsi,[rip+0xa841e]        # cc4e0 <_IO_stdin_used+0x4e0>
   240c2:	4c 89 ff             	mov    rdi,r15
   240c5:	48 89 c2             	mov    rdx,rax
   240c8:	31 c0                	xor    eax,eax
   240ca:	e8 c1 c1 00 00       	call   30290 <JS_ThrowSyntaxError>
   240cf:	e9 cc f0 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   240d4:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   240db:	e8 90 da 00 00       	call   31b70 <JS_ThrowTypeErrorReadOnly.part.0>
   240e0:	e9 bb f0 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   240e5:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   240ec:	48 8d 35 65 bc 0a 00 	lea    rsi,[rip+0xabc65]        # cfd58 <_IO_stdin_used+0x3d58>
   240f3:	31 c0                	xor    eax,eax
   240f5:	e8 b6 c5 00 00       	call   306b0 <JS_ThrowTypeError>
   240fa:	e9 a1 f0 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   240ff:	f3 0f 1e fa          	endbr64
   24103:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   24107:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   2410c:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   24110:	83 fa f6             	cmp    edx,0xfffffff6
   24113:	76 04                	jbe    24119 <JS_CallInternal+0x1719>
   24115:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
   24119:	48 8b bd 88 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x178]
   24120:	48 c1 e0 04          	shl    rax,0x4
   24124:	48 01 f8             	add    rax,rdi
   24127:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   2412b:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   2412e:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
   24132:	48 89 08             	mov    QWORD PTR [rax],rcx
   24135:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   24139:	76 11                	jbe    2414c <JS_CallInternal+0x174c>
   2413b:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2413e:	83 e8 01             	sub    eax,0x1
   24141:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24144:	85 c0                	test   eax,eax
   24146:	0f 8e 90 62 00 00    	jle    2a3dc <JS_CallInternal+0x79dc>
   2414c:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
   24152:	49 83 c4 03          	add    r12,0x3
   24156:	49 89 c5             	mov    r13,rax
   24159:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2415d:	ff e0                	jmp    rax
   2415f:	f3 0f 1e fa          	endbr64
   24163:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   24168:	48 8b 8d 88 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x178]
   2416f:	48 c1 e0 04          	shl    rax,0x4
   24173:	48 01 c8             	add    rax,rcx
   24176:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   24179:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   2417d:	83 f8 f6             	cmp    eax,0xfffffff6
   24180:	76 04                	jbe    24186 <JS_CallInternal+0x1786>
   24182:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   24186:	48 89 13             	mov    QWORD PTR [rbx],rdx
   24189:	49 83 c4 03          	add    r12,0x3
   2418d:	48 83 c3 10          	add    rbx,0x10
   24191:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
   24195:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2419b:	49 89 c5             	mov    r13,rax
   2419e:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   241a2:	ff e0                	jmp    rax
   241a4:	f3 0f 1e fa          	endbr64
   241a8:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   241ac:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   241b1:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   241b5:	83 fa f6             	cmp    edx,0xfffffff6
   241b8:	76 04                	jbe    241be <JS_CallInternal+0x17be>
   241ba:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
   241be:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
   241c5:	48 c1 e0 04          	shl    rax,0x4
   241c9:	48 01 f8             	add    rax,rdi
   241cc:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   241d0:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   241d3:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
   241d7:	48 89 08             	mov    QWORD PTR [rax],rcx
   241da:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   241de:	76 11                	jbe    241f1 <JS_CallInternal+0x17f1>
   241e0:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   241e3:	83 e8 01             	sub    eax,0x1
   241e6:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   241e9:	85 c0                	test   eax,eax
   241eb:	0f 8e d3 61 00 00    	jle    2a3c4 <JS_CallInternal+0x79c4>
   241f1:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
   241f7:	49 83 c4 03          	add    r12,0x3
   241fb:	49 89 c5             	mov    r13,rax
   241fe:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24202:	ff e0                	jmp    rax
   24204:	f3 0f 1e fa          	endbr64
   24208:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   2420d:	48 8b 8d 88 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x178]
   24214:	f3 0f 6f 63 f0       	movdqu xmm4,XMMWORD PTR [rbx-0x10]
   24219:	48 c1 e0 04          	shl    rax,0x4
   2421d:	48 01 c8             	add    rax,rcx
   24220:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   24224:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   24227:	0f 11 20             	movups XMMWORD PTR [rax],xmm4
   2422a:	83 fa f6             	cmp    edx,0xfffffff6
   2422d:	76 11                	jbe    24240 <JS_CallInternal+0x1840>
   2422f:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24232:	83 e8 01             	sub    eax,0x1
   24235:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24238:	85 c0                	test   eax,eax
   2423a:	0f 8e c9 61 00 00    	jle    2a409 <JS_CallInternal+0x7a09>
   24240:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
   24246:	48 83 eb 10          	sub    rbx,0x10
   2424a:	49 83 c4 03          	add    r12,0x3
   2424e:	49 89 c5             	mov    r13,rax
   24251:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24255:	ff e0                	jmp    rax
   24257:	f3 0f 1e fa          	endbr64
   2425b:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   24260:	48 8b 8d b0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x150]
   24267:	f3 0f 6f 4b f0       	movdqu xmm1,XMMWORD PTR [rbx-0x10]
   2426c:	48 c1 e0 04          	shl    rax,0x4
   24270:	48 01 c8             	add    rax,rcx
   24273:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   24277:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   2427a:	0f 11 08             	movups XMMWORD PTR [rax],xmm1
   2427d:	83 fa f6             	cmp    edx,0xfffffff6
   24280:	76 11                	jbe    24293 <JS_CallInternal+0x1893>
   24282:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24285:	83 e8 01             	sub    eax,0x1
   24288:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2428b:	85 c0                	test   eax,eax
   2428d:	0f 8e 61 61 00 00    	jle    2a3f4 <JS_CallInternal+0x79f4>
   24293:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
   24299:	48 83 eb 10          	sub    rbx,0x10
   2429d:	49 83 c4 03          	add    r12,0x3
   242a1:	49 89 c5             	mov    r13,rax
   242a4:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   242a8:	ff e0                	jmp    rax
   242aa:	f3 0f 1e fa          	endbr64
   242ae:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   242b3:	48 8b 8d b0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x150]
   242ba:	48 c1 e0 04          	shl    rax,0x4
   242be:	48 01 c8             	add    rax,rcx
   242c1:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   242c4:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   242c8:	83 f8 f6             	cmp    eax,0xfffffff6
   242cb:	76 04                	jbe    242d1 <JS_CallInternal+0x18d1>
   242cd:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   242d1:	48 89 13             	mov    QWORD PTR [rbx],rdx
   242d4:	49 83 c4 03          	add    r12,0x3
   242d8:	48 83 c3 10          	add    rbx,0x10
   242dc:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
   242e0:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   242e6:	49 89 c5             	mov    r13,rax
   242e9:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   242ed:	ff e0                	jmp    rax
   242ef:	f3 0f 1e fa          	endbr64
   242f3:	48 8b 85 88 fe ff ff 	mov    rax,QWORD PTR [rbp-0x178]
   242fa:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   242fe:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   24301:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   24305:	83 f8 f6             	cmp    eax,0xfffffff6
   24308:	76 04                	jbe    2430e <JS_CallInternal+0x190e>
   2430a:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   2430e:	48 89 13             	mov    QWORD PTR [rbx],rdx
   24311:	49 83 c4 01          	add    r12,0x1
   24315:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
   24319:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2431f:	48 89 cb             	mov    rbx,rcx
   24322:	49 89 c5             	mov    r13,rax
   24325:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24329:	ff e0                	jmp    rax
   2432b:	f3 0f 1e fa          	endbr64
   2432f:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   24333:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   24337:	83 f8 f6             	cmp    eax,0xfffffff6
   2433a:	76 04                	jbe    24340 <JS_CallInternal+0x1940>
   2433c:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   24340:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
   24347:	48 8b 4f 38          	mov    rcx,QWORD PTR [rdi+0x38]
   2434b:	48 8b 77 30          	mov    rsi,QWORD PTR [rdi+0x30]
   2434f:	48 89 47 38          	mov    QWORD PTR [rdi+0x38],rax
   24353:	48 89 57 30          	mov    QWORD PTR [rdi+0x30],rdx
   24357:	83 f9 f6             	cmp    ecx,0xfffffff6
   2435a:	76 11                	jbe    2436d <JS_CallInternal+0x196d>
   2435c:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2435f:	83 e8 01             	sub    eax,0x1
   24362:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24365:	85 c0                	test   eax,eax
   24367:	0f 8e ad 62 00 00    	jle    2a61a <JS_CallInternal+0x7c1a>
   2436d:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   24372:	49 83 c4 01          	add    r12,0x1
   24376:	49 89 c5             	mov    r13,rax
   24379:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2437d:	ff e0                	jmp    rax
   2437f:	f3 0f 1e fa          	endbr64
   24383:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   24387:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   2438b:	83 f8 f6             	cmp    eax,0xfffffff6
   2438e:	76 04                	jbe    24394 <JS_CallInternal+0x1994>
   24390:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   24394:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
   2439b:	48 8b 4f 08          	mov    rcx,QWORD PTR [rdi+0x8]
   2439f:	48 8b 37             	mov    rsi,QWORD PTR [rdi]
   243a2:	48 89 47 08          	mov    QWORD PTR [rdi+0x8],rax
   243a6:	48 89 17             	mov    QWORD PTR [rdi],rdx
   243a9:	83 f9 f6             	cmp    ecx,0xfffffff6
   243ac:	76 11                	jbe    243bf <JS_CallInternal+0x19bf>
   243ae:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   243b1:	83 e8 01             	sub    eax,0x1
   243b4:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   243b7:	85 c0                	test   eax,eax
   243b9:	0f 8e fa 63 00 00    	jle    2a7b9 <JS_CallInternal+0x7db9>
   243bf:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   243c4:	49 83 c4 01          	add    r12,0x1
   243c8:	49 89 c5             	mov    r13,rax
   243cb:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   243cf:	ff e0                	jmp    rax
   243d1:	f3 0f 1e fa          	endbr64
   243d5:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   243d9:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   243dd:	83 f8 f6             	cmp    eax,0xfffffff6
   243e0:	76 04                	jbe    243e6 <JS_CallInternal+0x19e6>
   243e2:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   243e6:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
   243ed:	48 8b 4f 28          	mov    rcx,QWORD PTR [rdi+0x28]
   243f1:	48 8b 77 20          	mov    rsi,QWORD PTR [rdi+0x20]
   243f5:	48 89 47 28          	mov    QWORD PTR [rdi+0x28],rax
   243f9:	48 89 57 20          	mov    QWORD PTR [rdi+0x20],rdx
   243fd:	83 f9 f6             	cmp    ecx,0xfffffff6
   24400:	76 11                	jbe    24413 <JS_CallInternal+0x1a13>
   24402:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24405:	83 e8 01             	sub    eax,0x1
   24408:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2440b:	85 c0                	test   eax,eax
   2440d:	0f 8e 76 63 00 00    	jle    2a789 <JS_CallInternal+0x7d89>
   24413:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   24418:	49 83 c4 01          	add    r12,0x1
   2441c:	49 89 c5             	mov    r13,rax
   2441f:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24423:	ff e0                	jmp    rax
   24425:	f3 0f 1e fa          	endbr64
   24429:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   24430:	f3 0f 6f 7b f0       	movdqu xmm7,XMMWORD PTR [rbx-0x10]
   24435:	48 83 eb 10          	sub    rbx,0x10
   24439:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
   2443d:	48 8b 70 20          	mov    rsi,QWORD PTR [rax+0x20]
   24441:	0f 11 78 20          	movups XMMWORD PTR [rax+0x20],xmm7
   24445:	83 fa f6             	cmp    edx,0xfffffff6
   24448:	76 11                	jbe    2445b <JS_CallInternal+0x1a5b>
   2444a:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2444d:	83 e8 01             	sub    eax,0x1
   24450:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24453:	85 c0                	test   eax,eax
   24455:	0f 8e 8b 63 00 00    	jle    2a7e6 <JS_CallInternal+0x7de6>
   2445b:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   24460:	49 83 c4 01          	add    r12,0x1
   24464:	49 89 c5             	mov    r13,rax
   24467:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2446b:	ff e0                	jmp    rax
   2446d:	f3 0f 1e fa          	endbr64
   24471:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   24475:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   24479:	83 f8 f6             	cmp    eax,0xfffffff6
   2447c:	76 04                	jbe    24482 <JS_CallInternal+0x1a82>
   2447e:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   24482:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
   24489:	48 8b 4f 18          	mov    rcx,QWORD PTR [rdi+0x18]
   2448d:	48 8b 77 10          	mov    rsi,QWORD PTR [rdi+0x10]
   24491:	48 89 47 18          	mov    QWORD PTR [rdi+0x18],rax
   24495:	48 89 57 10          	mov    QWORD PTR [rdi+0x10],rdx
   24499:	83 f9 f6             	cmp    ecx,0xfffffff6
   2449c:	76 11                	jbe    244af <JS_CallInternal+0x1aaf>
   2449e:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   244a1:	83 e8 01             	sub    eax,0x1
   244a4:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   244a7:	85 c0                	test   eax,eax
   244a9:	0f 8e f2 62 00 00    	jle    2a7a1 <JS_CallInternal+0x7da1>
   244af:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   244b4:	49 83 c4 01          	add    r12,0x1
   244b8:	49 89 c5             	mov    r13,rax
   244bb:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   244bf:	ff e0                	jmp    rax
   244c1:	f3 0f 1e fa          	endbr64
   244c5:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   244cc:	f3 0f 6f 5b f0       	movdqu xmm3,XMMWORD PTR [rbx-0x10]
   244d1:	48 83 eb 10          	sub    rbx,0x10
   244d5:	48 8b 50 38          	mov    rdx,QWORD PTR [rax+0x38]
   244d9:	48 8b 70 30          	mov    rsi,QWORD PTR [rax+0x30]
   244dd:	0f 11 58 30          	movups XMMWORD PTR [rax+0x30],xmm3
   244e1:	83 fa f6             	cmp    edx,0xfffffff6
   244e4:	76 11                	jbe    244f7 <JS_CallInternal+0x1af7>
   244e6:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   244e9:	83 e8 01             	sub    eax,0x1
   244ec:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   244ef:	85 c0                	test   eax,eax
   244f1:	0f 8e da 62 00 00    	jle    2a7d1 <JS_CallInternal+0x7dd1>
   244f7:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   244fc:	49 83 c4 01          	add    r12,0x1
   24500:	49 89 c5             	mov    r13,rax
   24503:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24507:	ff e0                	jmp    rax
   24509:	f3 0f 1e fa          	endbr64
   2450d:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   24514:	f3 0f 6f 73 f0       	movdqu xmm6,XMMWORD PTR [rbx-0x10]
   24519:	48 83 eb 10          	sub    rbx,0x10
   2451d:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
   24521:	48 8b 70 10          	mov    rsi,QWORD PTR [rax+0x10]
   24525:	0f 11 70 10          	movups XMMWORD PTR [rax+0x10],xmm6
   24529:	83 fa f6             	cmp    edx,0xfffffff6
   2452c:	76 11                	jbe    2453f <JS_CallInternal+0x1b3f>
   2452e:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24531:	83 e8 01             	sub    eax,0x1
   24534:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24537:	85 c0                	test   eax,eax
   24539:	0f 8e bc 62 00 00    	jle    2a7fb <JS_CallInternal+0x7dfb>
   2453f:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   24544:	49 83 c4 01          	add    r12,0x1
   24548:	49 89 c5             	mov    r13,rax
   2454b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2454f:	ff e0                	jmp    rax
   24551:	f3 0f 1e fa          	endbr64
   24555:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   2455c:	f3 0f 6f 6b f0       	movdqu xmm5,XMMWORD PTR [rbx-0x10]
   24561:	48 83 eb 10          	sub    rbx,0x10
   24565:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   24569:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   2456c:	0f 11 28             	movups XMMWORD PTR [rax],xmm5
   2456f:	83 fa f6             	cmp    edx,0xfffffff6
   24572:	76 11                	jbe    24585 <JS_CallInternal+0x1b85>
   24574:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24577:	83 e8 01             	sub    eax,0x1
   2457a:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2457d:	85 c0                	test   eax,eax
   2457f:	0f 8e 35 5b 00 00    	jle    2a0ba <JS_CallInternal+0x76ba>
   24585:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   2458a:	49 83 c4 01          	add    r12,0x1
   2458e:	49 89 c5             	mov    r13,rax
   24591:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24595:	ff e0                	jmp    rax
   24597:	f3 0f 1e fa          	endbr64
   2459b:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   245a2:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   245a6:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   245a9:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   245ad:	83 f8 f6             	cmp    eax,0xfffffff6
   245b0:	76 04                	jbe    245b6 <JS_CallInternal+0x1bb6>
   245b2:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   245b6:	48 89 13             	mov    QWORD PTR [rbx],rdx
   245b9:	49 83 c4 01          	add    r12,0x1
   245bd:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
   245c1:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   245c7:	48 89 cb             	mov    rbx,rcx
   245ca:	49 89 c5             	mov    r13,rax
   245cd:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   245d1:	ff e0                	jmp    rax
   245d3:	f3 0f 1e fa          	endbr64
   245d7:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   245db:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   245df:	83 fa f6             	cmp    edx,0xfffffff6
   245e2:	76 04                	jbe    245e8 <JS_CallInternal+0x1be8>
   245e4:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
   245e8:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   245ed:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
   245f4:	48 c1 e0 04          	shl    rax,0x4
   245f8:	48 01 f8             	add    rax,rdi
   245fb:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   245ff:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   24602:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
   24606:	48 89 08             	mov    QWORD PTR [rax],rcx
   24609:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   2460d:	76 11                	jbe    24620 <JS_CallInternal+0x1c20>
   2460f:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24612:	83 e8 01             	sub    eax,0x1
   24615:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24618:	85 c0                	test   eax,eax
   2461a:	0f 8e b7 5e 00 00    	jle    2a4d7 <JS_CallInternal+0x7ad7>
   24620:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
   24626:	49 83 c4 02          	add    r12,0x2
   2462a:	49 89 c5             	mov    r13,rax
   2462d:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24631:	ff e0                	jmp    rax
   24633:	f3 0f 1e fa          	endbr64
   24637:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   2463c:	48 8b 8d b0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x150]
   24643:	48 83 eb 10          	sub    rbx,0x10
   24647:	f3 0f 6f 13          	movdqu xmm2,XMMWORD PTR [rbx]
   2464b:	48 c1 e0 04          	shl    rax,0x4
   2464f:	48 01 c8             	add    rax,rcx
   24652:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   24656:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   24659:	0f 11 10             	movups XMMWORD PTR [rax],xmm2
   2465c:	83 fa f6             	cmp    edx,0xfffffff6
   2465f:	76 11                	jbe    24672 <JS_CallInternal+0x1c72>
   24661:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24664:	83 e8 01             	sub    eax,0x1
   24667:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2466a:	85 c0                	test   eax,eax
   2466c:	0f 8e 50 5e 00 00    	jle    2a4c2 <JS_CallInternal+0x7ac2>
   24672:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
   24678:	49 83 c4 02          	add    r12,0x2
   2467c:	49 89 c5             	mov    r13,rax
   2467f:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24683:	ff e0                	jmp    rax
   24685:	f3 0f 1e fa          	endbr64
   24689:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   2468e:	48 8b 8d b0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x150]
   24695:	48 c1 e0 04          	shl    rax,0x4
   24699:	48 01 c8             	add    rax,rcx
   2469c:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   246a0:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   246a3:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   246a7:	83 f8 f6             	cmp    eax,0xfffffff6
   246aa:	76 04                	jbe    246b0 <JS_CallInternal+0x1cb0>
   246ac:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   246b0:	48 89 13             	mov    QWORD PTR [rbx],rdx
   246b3:	49 83 c4 02          	add    r12,0x2
   246b7:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
   246bb:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   246c1:	48 89 cb             	mov    rbx,rcx
   246c4:	49 89 c5             	mov    r13,rax
   246c7:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   246cb:	ff e0                	jmp    rax
   246cd:	f3 0f 1e fa          	endbr64
   246d1:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   246d8:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   246dc:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
   246e0:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
   246e4:	83 f8 f6             	cmp    eax,0xfffffff6
   246e7:	76 04                	jbe    246ed <JS_CallInternal+0x1ced>
   246e9:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   246ed:	48 89 13             	mov    QWORD PTR [rbx],rdx
   246f0:	49 83 c4 01          	add    r12,0x1
   246f4:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
   246f8:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   246fe:	48 89 cb             	mov    rbx,rcx
   24701:	49 89 c5             	mov    r13,rax
   24704:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24708:	ff e0                	jmp    rax
   2470a:	f3 0f 1e fa          	endbr64
   2470e:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   24715:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   24719:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
   2471d:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   24721:	83 f8 f6             	cmp    eax,0xfffffff6
   24724:	76 04                	jbe    2472a <JS_CallInternal+0x1d2a>
   24726:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   2472a:	48 89 13             	mov    QWORD PTR [rbx],rdx
   2472d:	49 83 c4 01          	add    r12,0x1
   24731:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
   24735:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2473b:	48 89 cb             	mov    rbx,rcx
   2473e:	49 89 c5             	mov    r13,rax
   24741:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24745:	ff e0                	jmp    rax
   24747:	f3 0f 1e fa          	endbr64
   2474b:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   24752:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   24756:	48 8b 50 30          	mov    rdx,QWORD PTR [rax+0x30]
   2475a:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
   2475e:	83 f8 f6             	cmp    eax,0xfffffff6
   24761:	76 04                	jbe    24767 <JS_CallInternal+0x1d67>
   24763:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   24767:	48 89 13             	mov    QWORD PTR [rbx],rdx
   2476a:	49 83 c4 01          	add    r12,0x1
   2476e:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
   24772:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24778:	48 89 cb             	mov    rbx,rcx
   2477b:	49 89 c5             	mov    r13,rax
   2477e:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24782:	ff e0                	jmp    rax
   24784:	f3 0f 1e fa          	endbr64
   24788:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   2478d:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
   24794:	4d 8d 6c 24 02       	lea    r13,[r12+0x2]
   24799:	48 89 c1             	mov    rcx,rax
   2479c:	48 c1 e0 04          	shl    rax,0x4
   247a0:	48 01 f8             	add    rax,rdi
   247a3:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   247a7:	83 fa 04             	cmp    edx,0x4
   247aa:	0f 84 ad 6c 00 00    	je     2b45d <JS_CallInternal+0x8a5d>
   247b0:	48 8b 00             	mov    rax,QWORD PTR [rax]
   247b3:	83 fa f6             	cmp    edx,0xfffffff6
   247b6:	76 04                	jbe    247bc <JS_CallInternal+0x1dbc>
   247b8:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
   247bc:	48 89 03             	mov    QWORD PTR [rbx],rax
   247bf:	49 83 c4 03          	add    r12,0x3
   247c3:	48 83 c3 10          	add    rbx,0x10
   247c7:	48 89 53 f8          	mov    QWORD PTR [rbx-0x8],rdx
   247cb:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   247d1:	49 89 c5             	mov    r13,rax
   247d4:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   247d8:	ff e0                	jmp    rax
   247da:	f3 0f 1e fa          	endbr64
   247de:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   247e3:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
   247ea:	4d 8d 6c 24 02       	lea    r13,[r12+0x2]
   247ef:	48 89 c1             	mov    rcx,rax
   247f2:	48 c1 e0 04          	shl    rax,0x4
   247f6:	48 01 f8             	add    rax,rdi
   247f9:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   247fd:	83 fa 04             	cmp    edx,0x4
   24800:	0f 84 9a 63 00 00    	je     2aba0 <JS_CallInternal+0x81a0>
   24806:	48 8b 00             	mov    rax,QWORD PTR [rax]
   24809:	83 fa f6             	cmp    edx,0xfffffff6
   2480c:	76 04                	jbe    24812 <JS_CallInternal+0x1e12>
   2480e:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
   24812:	48 89 03             	mov    QWORD PTR [rbx],rax
   24815:	49 83 c4 03          	add    r12,0x3
   24819:	48 83 c3 10          	add    rbx,0x10
   2481d:	48 89 53 f8          	mov    QWORD PTR [rbx-0x8],rdx
   24821:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24827:	49 89 c5             	mov    r13,rax
   2482a:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2482e:	ff e0                	jmp    rax
   24830:	f3 0f 1e fa          	endbr64
   24834:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   24839:	48 8b 8d b0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x150]
   24840:	48 c1 e0 04          	shl    rax,0x4
   24844:	48 01 c8             	add    rax,rcx
   24847:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   2484b:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   2484e:	48 c7 40 08 04 00 00 	mov    QWORD PTR [rax+0x8],0x4
   24855:	00 
   24856:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
   2485d:	83 fa f6             	cmp    edx,0xfffffff6
   24860:	76 11                	jbe    24873 <JS_CallInternal+0x1e73>
   24862:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24865:	83 e8 01             	sub    eax,0x1
   24868:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2486b:	85 c0                	test   eax,eax
   2486d:	0f 8e 32 58 00 00    	jle    2a0a5 <JS_CallInternal+0x76a5>
   24873:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
   24879:	49 83 c4 03          	add    r12,0x3
   2487d:	49 89 c5             	mov    r13,rax
   24880:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24884:	ff e0                	jmp    rax
   24886:	f3 0f 1e fa          	endbr64
   2488a:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   2488f:	48 8b 8d 98 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x168]
   24896:	4d 8d 6c 24 02       	lea    r13,[r12+0x2]
   2489b:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
   248a2:	00 
   248a3:	48 8b 04 c1          	mov    rax,QWORD PTR [rcx+rax*8]
   248a7:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   248ab:	83 78 08 04          	cmp    DWORD PTR [rax+0x8],0x4
   248af:	0f 85 d1 65 00 00    	jne    2ae86 <JS_CallInternal+0x8486>
   248b5:	f3 0f 6f 7b f0       	movdqu xmm7,XMMWORD PTR [rbx-0x10]
   248ba:	49 83 c4 03          	add    r12,0x3
   248be:	48 83 eb 10          	sub    rbx,0x10
   248c2:	0f 11 38             	movups XMMWORD PTR [rax],xmm7
   248c5:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   248cb:	49 89 c5             	mov    r13,rax
   248ce:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   248d2:	ff e0                	jmp    rax
   248d4:	f3 0f 1e fa          	endbr64
   248d8:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   248dd:	48 8b bd 98 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x168]
   248e4:	4d 8d 6c 24 02       	lea    r13,[r12+0x2]
   248e9:	48 8d 0c c5 00 00 00 	lea    rcx,[rax*8+0x0]
   248f0:	00 
   248f1:	48 8b 04 c7          	mov    rax,QWORD PTR [rdi+rax*8]
   248f5:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   248f9:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   248fd:	83 fa 04             	cmp    edx,0x4
   24900:	0f 84 dd 64 00 00    	je     2ade3 <JS_CallInternal+0x83e3>
   24906:	f3 0f 6f 73 f0       	movdqu xmm6,XMMWORD PTR [rbx-0x10]
   2490b:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   2490e:	0f 11 30             	movups XMMWORD PTR [rax],xmm6
   24911:	83 fa f6             	cmp    edx,0xfffffff6
   24914:	76 11                	jbe    24927 <JS_CallInternal+0x1f27>
   24916:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24919:	83 e8 01             	sub    eax,0x1
   2491c:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2491f:	85 c0                	test   eax,eax
   24921:	0f 8e 86 5b 00 00    	jle    2a4ad <JS_CallInternal+0x7aad>
   24927:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
   2492d:	48 83 eb 10          	sub    rbx,0x10
   24931:	49 83 c4 03          	add    r12,0x3
   24935:	49 89 c5             	mov    r13,rax
   24938:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2493c:	ff e0                	jmp    rax
   2493e:	f3 0f 1e fa          	endbr64
   24942:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   24946:	48 8b 7b e8          	mov    rdi,QWORD PTR [rbx-0x18]
   2494a:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   2494e:	4c 8b 43 f8          	mov    r8,QWORD PTR [rbx-0x8]
   24952:	49 89 f5             	mov    r13,rsi
   24955:	49 89 fe             	mov    r14,rdi
   24958:	83 ff ff             	cmp    edi,0xffffffff
   2495b:	0f 85 a7 4d 00 00    	jne    29708 <JS_CallInternal+0x6d08>
   24961:	45 85 c0             	test   r8d,r8d
   24964:	0f 85 9e 4d 00 00    	jne    29708 <JS_CallInternal+0x6d08>
   2496a:	66 83 7e 12 02       	cmp    WORD PTR [rsi+0x12],0x2
   2496f:	0f 85 93 4d 00 00    	jne    29708 <JS_CallInternal+0x6d08>
   24975:	3b 4e 38             	cmp    ecx,DWORD PTR [rsi+0x38]
   24978:	0f 83 8a 4d 00 00    	jae    29708 <JS_CallInternal+0x6d08>
   2497e:	89 c8                	mov    eax,ecx
   24980:	48 c1 e0 04          	shl    rax,0x4
   24984:	48 03 46 30          	add    rax,QWORD PTR [rsi+0x30]
   24988:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   2498b:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   2498f:	83 f8 f6             	cmp    eax,0xfffffff6
   24992:	76 04                	jbe    24998 <JS_CallInternal+0x1f98>
   24994:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
   24998:	41 83 fe f6          	cmp    r14d,0xfffffff6
   2499c:	76 13                	jbe    249b1 <JS_CallInternal+0x1fb1>
   2499e:	41 8b 7d fc          	mov    edi,DWORD PTR [r13-0x4]
   249a2:	8d 57 ff             	lea    edx,[rdi-0x1]
   249a5:	41 89 55 fc          	mov    DWORD PTR [r13-0x4],edx
   249a9:	85 d2                	test   edx,edx
   249ab:	0f 8e c6 5c 00 00    	jle    2a677 <JS_CallInternal+0x7c77>
   249b1:	48 89 4b e0          	mov    QWORD PTR [rbx-0x20],rcx
   249b5:	49 83 c4 01          	add    r12,0x1
   249b9:	48 83 eb 10          	sub    rbx,0x10
   249bd:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
   249c1:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   249c7:	49 89 c5             	mov    r13,rax
   249ca:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   249ce:	ff e0                	jmp    rax
   249d0:	f3 0f 1e fa          	endbr64
   249d4:	31 c9                	xor    ecx,ecx
   249d6:	b8 01 00 00 00       	mov    eax,0x1
   249db:	e9 40 e8 ff ff       	jmp    23220 <JS_CallInternal+0x820>
   249e0:	f3 0f 1e fa          	endbr64
   249e4:	31 c9                	xor    ecx,ecx
   249e6:	31 c0                	xor    eax,eax
   249e8:	e9 33 e8 ff ff       	jmp    23220 <JS_CallInternal+0x820>
   249ed:	f3 0f 1e fa          	endbr64
   249f1:	e9 2a e3 ff ff       	jmp    22d20 <JS_CallInternal+0x320>
   249f6:	f3 0f 1e fa          	endbr64
   249fa:	e9 21 e3 ff ff       	jmp    22d20 <JS_CallInternal+0x320>
   249ff:	f3 0f 1e fa          	endbr64
   24a03:	e9 18 e3 ff ff       	jmp    22d20 <JS_CallInternal+0x320>
   24a08:	f3 0f 1e fa          	endbr64
   24a0c:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   24a10:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   24a17:	4c 8d 43 f0          	lea    r8,[rbx-0x10]
   24a1b:	49 8b 50 08          	mov    rdx,QWORD PTR [r8+0x8]
   24a1f:	e8 6c 6f ff ff       	call   1b990 <js_operator_typeof>
   24a24:	83 f8 1b             	cmp    eax,0x1b
   24a27:	74 61                	je     24a8a <JS_CallInternal+0x208a>
   24a29:	49 8b 50 08          	mov    rdx,QWORD PTR [r8+0x8]
   24a2d:	49 8b 30             	mov    rsi,QWORD PTR [r8]
   24a30:	83 fa f6             	cmp    edx,0xfffffff6
   24a33:	76 11                	jbe    24a46 <JS_CallInternal+0x2046>
   24a35:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24a38:	83 e8 01             	sub    eax,0x1
   24a3b:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24a3e:	85 c0                	test   eax,eax
   24a40:	0f 8e ec 48 00 00    	jle    29332 <JS_CallInternal+0x6932>
   24a46:	48 c7 43 f0 00 00 00 	mov    QWORD PTR [rbx-0x10],0x0
   24a4d:	00 
   24a4e:	49 83 c4 01          	add    r12,0x1
   24a52:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   24a59:	00 
   24a5a:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24a60:	49 89 c5             	mov    r13,rax
   24a63:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24a67:	ff e0                	jmp    rax
   24a69:	f3 0f 1e fa          	endbr64
   24a6d:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   24a71:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   24a78:	4c 8d 43 f0          	lea    r8,[rbx-0x10]
   24a7c:	49 8b 50 08          	mov    rdx,QWORD PTR [r8+0x8]
   24a80:	e8 0b 6f ff ff       	call   1b990 <js_operator_typeof>
   24a85:	83 f8 49             	cmp    eax,0x49
   24a88:	75 9f                	jne    24a29 <JS_CallInternal+0x2029>
   24a8a:	49 8b 50 08          	mov    rdx,QWORD PTR [r8+0x8]
   24a8e:	49 8b 30             	mov    rsi,QWORD PTR [r8]
   24a91:	83 fa f6             	cmp    edx,0xfffffff6
   24a94:	76 11                	jbe    24aa7 <JS_CallInternal+0x20a7>
   24a96:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24a99:	83 e8 01             	sub    eax,0x1
   24a9c:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24a9f:	85 c0                	test   eax,eax
   24aa1:	0f 8e 77 63 00 00    	jle    2ae1e <JS_CallInternal+0x841e>
   24aa7:	48 c7 43 f0 01 00 00 	mov    QWORD PTR [rbx-0x10],0x1
   24aae:	00 
   24aaf:	49 83 c4 01          	add    r12,0x1
   24ab3:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   24aba:	00 
   24abb:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24ac1:	49 89 c5             	mov    r13,rax
   24ac4:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24ac8:	ff e0                	jmp    rax
   24aca:	f3 0f 1e fa          	endbr64
   24ace:	83 7b f8 02          	cmp    DWORD PTR [rbx-0x8],0x2
   24ad2:	74 d3                	je     24aa7 <JS_CallInternal+0x20a7>
   24ad4:	4c 8d 43 f0          	lea    r8,[rbx-0x10]
   24ad8:	e9 4c ff ff ff       	jmp    24a29 <JS_CallInternal+0x2029>
   24add:	f3 0f 1e fa          	endbr64
   24ae1:	83 7b f8 03          	cmp    DWORD PTR [rbx-0x8],0x3
   24ae5:	75 ed                	jne    24ad4 <JS_CallInternal+0x20d4>
   24ae7:	eb be                	jmp    24aa7 <JS_CallInternal+0x20a7>
   24ae9:	f3 0f 1e fa          	endbr64
   24aed:	8b 43 f8             	mov    eax,DWORD PTR [rbx-0x8]
   24af0:	83 e8 02             	sub    eax,0x2
   24af3:	83 f8 01             	cmp    eax,0x1
   24af6:	77 dc                	ja     24ad4 <JS_CallInternal+0x20d4>
   24af8:	eb ad                	jmp    24aa7 <JS_CallInternal+0x20a7>
   24afa:	f3 0f 1e fa          	endbr64
   24afe:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   24b03:	49 83 c4 01          	add    r12,0x1
   24b07:	49 89 c5             	mov    r13,rax
   24b0a:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24b0e:	ff e0                	jmp    rax
   24b10:	f3 0f 1e fa          	endbr64
   24b14:	31 c9                	xor    ecx,ecx
   24b16:	b8 03 00 00 00       	mov    eax,0x3
   24b1b:	e9 00 e7 ff ff       	jmp    23220 <JS_CallInternal+0x820>
   24b20:	f3 0f 1e fa          	endbr64
   24b24:	b9 03 00 00 00       	mov    ecx,0x3
   24b29:	31 c0                	xor    eax,eax
   24b2b:	e9 f0 e6 ff ff       	jmp    23220 <JS_CallInternal+0x820>
   24b30:	f3 0f 1e fa          	endbr64
   24b34:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   24b38:	83 f8 fa             	cmp    eax,0xfffffffa
   24b3b:	0f 8d 93 46 00 00    	jge    291d4 <JS_CallInternal+0x67d4>
   24b41:	83 f8 f8             	cmp    eax,0xfffffff8
   24b44:	0f 8c 92 46 00 00    	jl     291dc <JS_CallInternal+0x67dc>
   24b4a:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   24b4f:	49 83 c4 01          	add    r12,0x1
   24b53:	49 89 c5             	mov    r13,rax
   24b56:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24b5a:	ff e0                	jmp    rax
   24b5c:	f3 0f 1e fa          	endbr64
   24b60:	83 7b f8 ff          	cmp    DWORD PTR [rbx-0x8],0xffffffff
   24b64:	74 54                	je     24bba <JS_CallInternal+0x21ba>
   24b66:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   24b6d:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   24b71:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   24b75:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   24b7c:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   24b80:	e8 7b 32 02 00       	call   47e00 <JS_ToObject>
   24b85:	49 89 c1             	mov    r9,rax
   24b88:	49 89 d0             	mov    r8,rdx
   24b8b:	83 fa 06             	cmp    edx,0x6
   24b8e:	0f 84 0c e6 ff ff    	je     231a0 <JS_CallInternal+0x7a0>
   24b94:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   24b98:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   24b9c:	83 fa f6             	cmp    edx,0xfffffff6
   24b9f:	76 11                	jbe    24bb2 <JS_CallInternal+0x21b2>
   24ba1:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24ba4:	83 e8 01             	sub    eax,0x1
   24ba7:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24baa:	85 c0                	test   eax,eax
   24bac:	0f 8e b7 6d 00 00    	jle    2b969 <JS_CallInternal+0x8f69>
   24bb2:	4c 89 4b f0          	mov    QWORD PTR [rbx-0x10],r9
   24bb6:	4c 89 43 f8          	mov    QWORD PTR [rbx-0x8],r8
   24bba:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   24bbf:	49 83 c4 01          	add    r12,0x1
   24bc3:	49 89 c5             	mov    r13,rax
   24bc6:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24bca:	ff e0                	jmp    rax
   24bcc:	f3 0f 1e fa          	endbr64
   24bd0:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   24bd7:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
   24bdc:	45 8b 34 24          	mov    r14d,DWORD PTR [r12]
   24be0:	4c 89 68 30          	mov    QWORD PTR [rax+0x30],r13
   24be4:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   24beb:	44 89 f1             	mov    ecx,r14d
   24bee:	48 8b 80 90 01 00 00 	mov    rax,QWORD PTR [rax+0x190]
   24bf5:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
   24bf9:	8b 42 18             	mov    eax,DWORD PTR [rdx+0x18]
   24bfc:	21 c1                	and    ecx,eax
   24bfe:	8b 4c 8a 38          	mov    ecx,DWORD PTR [rdx+rcx*4+0x38]
   24c02:	48 85 c9             	test   rcx,rcx
   24c05:	0f 84 aa 4d 00 00    	je     299b5 <JS_CallInternal+0x6fb5>
   24c0b:	48 8d 34 85 34 00 00 	lea    rsi,[rax*4+0x34]
   24c12:	00 
   24c13:	48 8d 04 ce          	lea    rax,[rsi+rcx*8]
   24c17:	48 01 d0             	add    rax,rdx
   24c1a:	44 3b 70 04          	cmp    r14d,DWORD PTR [rax+0x4]
   24c1e:	0f 85 83 4d 00 00    	jne    299a7 <JS_CallInternal+0x6fa7>
   24c24:	31 c0                	xor    eax,eax
   24c26:	48 89 03             	mov    QWORD PTR [rbx],rax
   24c29:	49 83 c4 05          	add    r12,0x5
   24c2d:	48 83 c3 10          	add    rbx,0x10
   24c31:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   24c38:	00 
   24c39:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24c3f:	49 89 c5             	mov    r13,rax
   24c42:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24c46:	ff e0                	jmp    rax
   24c48:	f3 0f 1e fa          	endbr64
   24c4c:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   24c53:	4c 8b 6b f0          	mov    r13,QWORD PTR [rbx-0x10]
   24c57:	4c 8b 73 f8          	mov    r14,QWORD PTR [rbx-0x8]
   24c5b:	48 8b 4b e8          	mov    rcx,QWORD PTR [rbx-0x18]
   24c5f:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   24c63:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   24c6a:	4c 89 ee             	mov    rsi,r13
   24c6d:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
   24c71:	4c 89 f2             	mov    rdx,r14
   24c74:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   24c7b:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
   24c82:	e8 09 e7 01 00       	call   43390 <JS_ValueToAtom>
   24c87:	89 c1                	mov    ecx,eax
   24c89:	85 c0                	test   eax,eax
   24c8b:	0f 84 0f e5 ff ff    	je     231a0 <JS_CallInternal+0x7a0>
   24c91:	48 8b b5 40 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c0]
   24c98:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
   24c9f:	41 b8 00 80 00 00    	mov    r8d,0x8000
   24ca5:	89 85 38 fe ff ff    	mov    DWORD PTR [rbp-0x1c8],eax
   24cab:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   24cb2:	e8 69 5d 02 00       	call   4aa20 <JS_DeleteProperty>
   24cb7:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
   24cbd:	41 89 c0             	mov    r8d,eax
   24cc0:	81 f9 f2 00 00 00    	cmp    ecx,0xf2
   24cc6:	0f 8f 4c 4d 00 00    	jg     29a18 <JS_CallInternal+0x7018>
   24ccc:	45 85 c0             	test   r8d,r8d
   24ccf:	0f 88 cb e4 ff ff    	js     231a0 <JS_CallInternal+0x7a0>
   24cd5:	83 bd 50 fe ff ff f6 	cmp    DWORD PTR [rbp-0x1b0],0xfffffff6
   24cdc:	76 1e                	jbe    24cfc <JS_CallInternal+0x22fc>
   24cde:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   24ce5:	8b 41 fc             	mov    eax,DWORD PTR [rcx-0x4]
   24ce8:	89 85 38 fe ff ff    	mov    DWORD PTR [rbp-0x1c8],eax
   24cee:	83 e8 01             	sub    eax,0x1
   24cf1:	89 41 fc             	mov    DWORD PTR [rcx-0x4],eax
   24cf4:	85 c0                	test   eax,eax
   24cf6:	0f 8e 07 69 00 00    	jle    2b603 <JS_CallInternal+0x8c03>
   24cfc:	41 83 fe f6          	cmp    r14d,0xfffffff6
   24d00:	76 13                	jbe    24d15 <JS_CallInternal+0x2315>
   24d02:	41 8b 45 fc          	mov    eax,DWORD PTR [r13-0x4]
   24d06:	83 e8 01             	sub    eax,0x1
   24d09:	41 89 45 fc          	mov    DWORD PTR [r13-0x4],eax
   24d0d:	85 c0                	test   eax,eax
   24d0f:	0f 8e 49 5f 00 00    	jle    2ac5e <JS_CallInternal+0x825e>
   24d15:	31 c0                	xor    eax,eax
   24d17:	45 85 c0             	test   r8d,r8d
   24d1a:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   24d21:	00 
   24d22:	0f 95 c0             	setne  al
   24d25:	48 83 eb 10          	sub    rbx,0x10
   24d29:	49 83 c4 01          	add    r12,0x1
   24d2d:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   24d31:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24d37:	49 89 c5             	mov    r13,rax
   24d3a:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24d3e:	ff e0                	jmp    rax
   24d40:	f3 0f 1e fa          	endbr64
   24d44:	4c 8b 43 f8          	mov    r8,QWORD PTR [rbx-0x8]
   24d48:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   24d4c:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   24d53:	4c 89 c2             	mov    rdx,r8
   24d56:	e8 35 6c ff ff       	call   1b990 <js_operator_typeof>
   24d5b:	41 89 c5             	mov    r13d,eax
   24d5e:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   24d62:	76 11                	jbe    24d75 <JS_CallInternal+0x2375>
   24d64:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24d67:	83 e8 01             	sub    eax,0x1
   24d6a:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24d6d:	85 c0                	test   eax,eax
   24d6f:	0f 8e 56 54 00 00    	jle    2a1cb <JS_CallInternal+0x77cb>
   24d75:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   24d7c:	44 89 ee             	mov    esi,r13d
   24d7f:	ba 01 00 00 00       	mov    edx,0x1
   24d84:	49 83 c4 01          	add    r12,0x1
   24d88:	e8 f3 ec 00 00       	call   33a80 <__JS_AtomToValue>
   24d8d:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   24d91:	48 89 53 f8          	mov    QWORD PTR [rbx-0x8],rdx
   24d95:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24d9b:	49 89 c5             	mov    r13,rax
   24d9e:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24da2:	ff e0                	jmp    rax
   24da4:	f3 0f 1e fa          	endbr64
   24da8:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   24daf:	4c 8b 6b e8          	mov    r13,QWORD PTR [rbx-0x18]
   24db3:	4c 8b 4b e0          	mov    r9,QWORD PTR [rbx-0x20]
   24db7:	4c 8b 73 f8          	mov    r14,QWORD PTR [rbx-0x8]
   24dbb:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   24dbf:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
   24dc3:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   24dca:	41 83 fd ff          	cmp    r13d,0xffffffff
   24dce:	0f 85 00 78 00 00    	jne    2c5d4 <JS_CallInternal+0x9bd4>
   24dd4:	41 83 fe ff          	cmp    r14d,0xffffffff
   24dd8:	0f 84 a2 48 00 00    	je     29680 <JS_CallInternal+0x6c80>
   24dde:	48 8b b5 50 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1b0]
   24de5:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   24dec:	4c 89 f2             	mov    rdx,r14
   24def:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   24df6:	e8 95 e5 01 00       	call   43390 <JS_ValueToAtom>
   24dfb:	85 c0                	test   eax,eax
   24dfd:	0f 84 9d e3 ff ff    	je     231a0 <JS_CallInternal+0x7a0>
   24e03:	4c 8b 8d 40 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c0]
   24e0a:	89 c2                	mov    edx,eax
   24e0c:	49 8b 49 18          	mov    rcx,QWORD PTR [r9+0x18]
   24e10:	8b 71 18             	mov    esi,DWORD PTR [rcx+0x18]
   24e13:	21 f2                	and    edx,esi
   24e15:	8b 54 91 38          	mov    edx,DWORD PTR [rcx+rdx*4+0x38]
   24e19:	48 85 d2             	test   rdx,rdx
   24e1c:	0f 84 29 69 00 00    	je     2b74b <JS_CallInternal+0x8d4b>
   24e22:	48 8d 34 b5 34 00 00 	lea    rsi,[rsi*4+0x34]
   24e29:	00 
   24e2a:	48 8d 14 d6          	lea    rdx,[rsi+rdx*8]
   24e2e:	48 01 ca             	add    rdx,rcx
   24e31:	3b 42 04             	cmp    eax,DWORD PTR [rdx+0x4]
   24e34:	0f 85 03 69 00 00    	jne    2b73d <JS_CallInternal+0x8d3d>
   24e3a:	3d f2 00 00 00       	cmp    eax,0xf2
   24e3f:	0f 8f 6d 50 00 00    	jg     29eb2 <JS_CallInternal+0x74b2>
   24e45:	48 85 d2             	test   rdx,rdx
   24e48:	0f 95 c0             	setne  al
   24e4b:	41 83 fd f6          	cmp    r13d,0xfffffff6
   24e4f:	76 13                	jbe    24e64 <JS_CallInternal+0x2464>
   24e51:	41 8b 49 fc          	mov    ecx,DWORD PTR [r9-0x4]
   24e55:	8d 51 ff             	lea    edx,[rcx-0x1]
   24e58:	41 89 51 fc          	mov    DWORD PTR [r9-0x4],edx
   24e5c:	85 d2                	test   edx,edx
   24e5e:	0f 8e 8b 56 00 00    	jle    2a4ef <JS_CallInternal+0x7aef>
   24e64:	41 83 fe f6          	cmp    r14d,0xfffffff6
   24e68:	76 1e                	jbe    24e88 <JS_CallInternal+0x2488>
   24e6a:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   24e71:	8b 79 fc             	mov    edi,DWORD PTR [rcx-0x4]
   24e74:	8d 57 ff             	lea    edx,[rdi-0x1]
   24e77:	89 bd 40 fe ff ff    	mov    DWORD PTR [rbp-0x1c0],edi
   24e7d:	89 51 fc             	mov    DWORD PTR [rcx-0x4],edx
   24e80:	85 d2                	test   edx,edx
   24e82:	0f 8e 8f 56 00 00    	jle    2a517 <JS_CallInternal+0x7b17>
   24e88:	0f b6 c0             	movzx  eax,al
   24e8b:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   24e92:	00 
   24e93:	49 83 c4 01          	add    r12,0x1
   24e97:	48 83 eb 10          	sub    rbx,0x10
   24e9b:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   24e9f:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24ea5:	49 89 c5             	mov    r13,rax
   24ea8:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24eac:	ff e0                	jmp    rax
   24eae:	f3 0f 1e fa          	endbr64
   24eb2:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   24eb9:	4c 8b 73 f0          	mov    r14,QWORD PTR [rbx-0x10]
   24ebd:	4c 8b 6b f8          	mov    r13,QWORD PTR [rbx-0x8]
   24ec1:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   24ec5:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   24ec9:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   24ecd:	4c 89 f1             	mov    rcx,r14
   24ed0:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   24ed7:	4d 89 e8             	mov    r8,r13
   24eda:	48 89 b5 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rsi
   24ee1:	48 89 95 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rdx
   24ee8:	e8 b3 df 00 00       	call   32ea0 <JS_IsInstanceOf>
   24eed:	89 c1                	mov    ecx,eax
   24eef:	85 c0                	test   eax,eax
   24ef1:	0f 88 a9 e2 ff ff    	js     231a0 <JS_CallInternal+0x7a0>
   24ef7:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
   24efe:	83 fa f6             	cmp    edx,0xfffffff6
   24f01:	76 18                	jbe    24f1b <JS_CallInternal+0x251b>
   24f03:	48 8b b5 40 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c0]
   24f0a:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24f0d:	83 e8 01             	sub    eax,0x1
   24f10:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24f13:	85 c0                	test   eax,eax
   24f15:	0f 8e 85 68 00 00    	jle    2b7a0 <JS_CallInternal+0x8da0>
   24f1b:	41 83 fd f6          	cmp    r13d,0xfffffff6
   24f1f:	76 13                	jbe    24f34 <JS_CallInternal+0x2534>
   24f21:	41 8b 46 fc          	mov    eax,DWORD PTR [r14-0x4]
   24f25:	83 e8 01             	sub    eax,0x1
   24f28:	41 89 46 fc          	mov    DWORD PTR [r14-0x4],eax
   24f2c:	85 c0                	test   eax,eax
   24f2e:	0f 8e fc 66 00 00    	jle    2b630 <JS_CallInternal+0x8c30>
   24f34:	31 c0                	xor    eax,eax
   24f36:	85 c9                	test   ecx,ecx
   24f38:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   24f3f:	00 
   24f40:	0f 95 c0             	setne  al
   24f43:	48 83 eb 10          	sub    rbx,0x10
   24f47:	49 83 c4 01          	add    r12,0x1
   24f4b:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   24f4f:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24f55:	49 89 c5             	mov    r13,rax
   24f58:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24f5c:	ff e0                	jmp    rax
   24f5e:	f3 0f 1e fa          	endbr64
   24f62:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   24f69:	4c 8b 6b f8          	mov    r13,QWORD PTR [rbx-0x8]
   24f6d:	4c 8b 73 e0          	mov    r14,QWORD PTR [rbx-0x20]
   24f71:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   24f75:	48 8b 43 e8          	mov    rax,QWORD PTR [rbx-0x18]
   24f79:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   24f80:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
   24f84:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
   24f8b:	41 83 fd ff          	cmp    r13d,0xffffffff
   24f8f:	0f 85 8d 6e 00 00    	jne    2be22 <JS_CallInternal+0x9422>
   24f95:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
   24f9c:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   24fa3:	4c 89 f6             	mov    rsi,r14
   24fa6:	e8 e5 e3 01 00       	call   43390 <JS_ValueToAtom>
   24fab:	89 c1                	mov    ecx,eax
   24fad:	85 c0                	test   eax,eax
   24faf:	0f 84 eb e1 ff ff    	je     231a0 <JS_CallInternal+0x7a0>
   24fb5:	48 8b b5 40 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c0]
   24fbc:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   24fc3:	4c 89 ea             	mov    rdx,r13
   24fc6:	89 85 38 fe ff ff    	mov    DWORD PTR [rbp-0x1c8],eax
   24fcc:	e8 df 89 04 00       	call   6d9b0 <JS_HasProperty>
   24fd1:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
   24fd7:	41 89 c0             	mov    r8d,eax
   24fda:	81 f9 f2 00 00 00    	cmp    ecx,0xf2
   24fe0:	0f 8f 80 49 00 00    	jg     29966 <JS_CallInternal+0x6f66>
   24fe6:	45 85 c0             	test   r8d,r8d
   24fe9:	0f 88 b1 e1 ff ff    	js     231a0 <JS_CallInternal+0x7a0>
   24fef:	83 bd 50 fe ff ff f6 	cmp    DWORD PTR [rbp-0x1b0],0xfffffff6
   24ff6:	76 13                	jbe    2500b <JS_CallInternal+0x260b>
   24ff8:	41 8b 46 fc          	mov    eax,DWORD PTR [r14-0x4]
   24ffc:	83 e8 01             	sub    eax,0x1
   24fff:	41 89 46 fc          	mov    DWORD PTR [r14-0x4],eax
   25003:	85 c0                	test   eax,eax
   25005:	0f 8e 93 51 00 00    	jle    2a19e <JS_CallInternal+0x779e>
   2500b:	41 83 fd f6          	cmp    r13d,0xfffffff6
   2500f:	76 1e                	jbe    2502f <JS_CallInternal+0x262f>
   25011:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   25018:	8b 41 fc             	mov    eax,DWORD PTR [rcx-0x4]
   2501b:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   25021:	83 e8 01             	sub    eax,0x1
   25024:	89 41 fc             	mov    DWORD PTR [rcx-0x4],eax
   25027:	85 c0                	test   eax,eax
   25029:	0f 8e 12 54 00 00    	jle    2a441 <JS_CallInternal+0x7a41>
   2502f:	31 c0                	xor    eax,eax
   25031:	45 85 c0             	test   r8d,r8d
   25034:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   2503b:	00 
   2503c:	0f 95 c0             	setne  al
   2503f:	48 83 eb 10          	sub    rbx,0x10
   25043:	49 83 c4 01          	add    r12,0x1
   25047:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   2504b:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   25051:	49 89 c5             	mov    r13,rax
   25054:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25058:	ff e0                	jmp    rax
   2505a:	f3 0f 1e fa          	endbr64
   2505e:	48 8b 53 e0          	mov    rdx,QWORD PTR [rbx-0x20]
   25062:	4c 8b 4b e8          	mov    r9,QWORD PTR [rbx-0x18]
   25066:	4c 8b 6b f0          	mov    r13,QWORD PTR [rbx-0x10]
   2506a:	4c 8b 73 f8          	mov    r14,QWORD PTR [rbx-0x8]
   2506e:	48 89 d7             	mov    rdi,rdx
   25071:	45 85 c9             	test   r9d,r9d
   25074:	0f 85 e9 60 00 00    	jne    2b163 <JS_CallInternal+0x8763>
   2507a:	45 85 f6             	test   r14d,r14d
   2507d:	0f 85 81 42 00 00    	jne    29304 <JS_CallInternal+0x6904>
   25083:	31 c0                	xor    eax,eax
   25085:	44 39 ea             	cmp    edx,r13d
   25088:	0f 95 c0             	setne  al
   2508b:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
   2508f:	49 83 c4 01          	add    r12,0x1
   25093:	48 83 eb 10          	sub    rbx,0x10
   25097:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   2509e:	00 
   2509f:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   250a5:	49 89 c5             	mov    r13,rax
   250a8:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   250ac:	ff e0                	jmp    rax
   250ae:	f3 0f 1e fa          	endbr64
   250b2:	48 8b 53 e0          	mov    rdx,QWORD PTR [rbx-0x20]
   250b6:	4c 8b 43 e8          	mov    r8,QWORD PTR [rbx-0x18]
   250ba:	4c 8b 6b f0          	mov    r13,QWORD PTR [rbx-0x10]
   250be:	4c 8b 73 f8          	mov    r14,QWORD PTR [rbx-0x8]
   250c2:	48 89 d7             	mov    rdi,rdx
   250c5:	45 85 c0             	test   r8d,r8d
   250c8:	0f 85 b9 5b 00 00    	jne    2ac87 <JS_CallInternal+0x8287>
   250ce:	45 85 f6             	test   r14d,r14d
   250d1:	0f 85 a9 41 00 00    	jne    29280 <JS_CallInternal+0x6880>
   250d7:	31 c0                	xor    eax,eax
   250d9:	44 39 ea             	cmp    edx,r13d
   250dc:	0f 94 c0             	sete   al
   250df:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
   250e3:	49 83 c4 01          	add    r12,0x1
   250e7:	48 83 eb 10          	sub    rbx,0x10
   250eb:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   250f2:	00 
   250f3:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   250f9:	49 89 c5             	mov    r13,rax
   250fc:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25100:	ff e0                	jmp    rax
   25102:	f3 0f 1e fa          	endbr64
   25106:	4c 8b 73 e0          	mov    r14,QWORD PTR [rbx-0x20]
   2510a:	4c 8b 4b f0          	mov    r9,QWORD PTR [rbx-0x10]
   2510e:	4c 8b 43 f8          	mov    r8,QWORD PTR [rbx-0x8]
   25112:	4c 8b 6b e8          	mov    r13,QWORD PTR [rbx-0x18]
   25116:	4c 89 f7             	mov    rdi,r14
   25119:	4c 89 ce             	mov    rsi,r9
   2511c:	4c 89 c0             	mov    rax,r8
   2511f:	45 85 ed             	test   r13d,r13d
   25122:	0f 85 9d 5f 00 00    	jne    2b0c5 <JS_CallInternal+0x86c5>
   25128:	45 85 c0             	test   r8d,r8d
   2512b:	0f 85 a9 41 00 00    	jne    292da <JS_CallInternal+0x68da>
   25131:	31 c0                	xor    eax,eax
   25133:	45 39 ce             	cmp    r14d,r9d
   25136:	0f 94 c0             	sete   al
   25139:	83 f8 01             	cmp    eax,0x1
   2513c:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   25143:	00 
   25144:	0f 95 c0             	setne  al
   25147:	0f b6 c0             	movzx  eax,al
   2514a:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
   2514e:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25153:	48 83 eb 10          	sub    rbx,0x10
   25157:	49 83 c4 01          	add    r12,0x1
   2515b:	49 89 c5             	mov    r13,rax
   2515e:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25162:	ff e0                	jmp    rax
   25164:	f3 0f 1e fa          	endbr64
   25168:	4c 8b 73 e0          	mov    r14,QWORD PTR [rbx-0x20]
   2516c:	4c 8b 4b f0          	mov    r9,QWORD PTR [rbx-0x10]
   25170:	4c 8b 43 f8          	mov    r8,QWORD PTR [rbx-0x8]
   25174:	4c 8b 6b e8          	mov    r13,QWORD PTR [rbx-0x18]
   25178:	4c 89 f7             	mov    rdi,r14
   2517b:	4c 89 ce             	mov    rsi,r9
   2517e:	4c 89 c0             	mov    rax,r8
   25181:	45 85 ed             	test   r13d,r13d
   25184:	0f 85 9e 5b 00 00    	jne    2ad28 <JS_CallInternal+0x8328>
   2518a:	45 85 c0             	test   r8d,r8d
   2518d:	0f 85 1b 41 00 00    	jne    292ae <JS_CallInternal+0x68ae>
   25193:	45 39 ce             	cmp    r14d,r9d
   25196:	0f 94 c0             	sete   al
   25199:	0f b6 c0             	movzx  eax,al
   2519c:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   251a3:	00 
   251a4:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
   251a8:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   251ad:	48 83 eb 10          	sub    rbx,0x10
   251b1:	49 83 c4 01          	add    r12,0x1
   251b5:	49 89 c5             	mov    r13,rax
   251b8:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   251bc:	ff e0                	jmp    rax
   251be:	f3 0f 1e fa          	endbr64
   251c2:	48 8b 7b f8          	mov    rdi,QWORD PTR [rbx-0x8]
   251c6:	41 8b 34 24          	mov    esi,DWORD PTR [r12]
   251ca:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
   251cf:	4c 8b 53 f0          	mov    r10,QWORD PTR [rbx-0x10]
   251d3:	83 ff ff             	cmp    edi,0xffffffff
   251d6:	0f 85 2a 3e 00 00    	jne    29006 <JS_CallInternal+0x6606>
   251dc:	4c 89 d1             	mov    rcx,r10
   251df:	90                   	nop
   251e0:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
   251e4:	8b 42 18             	mov    eax,DWORD PTR [rdx+0x18]
   251e7:	41 89 c0             	mov    r8d,eax
   251ea:	41 21 f0             	and    r8d,esi
   251ed:	46 8b 44 82 38       	mov    r8d,DWORD PTR [rdx+r8*4+0x38]
   251f2:	4d 85 c0             	test   r8,r8
   251f5:	0f 84 d8 38 00 00    	je     28ad3 <JS_CallInternal+0x60d3>
   251fb:	4c 8d 0c 85 34 00 00 	lea    r9,[rax*4+0x34]
   25202:	00 
   25203:	4b 8d 04 c1          	lea    rax,[r9+r8*8]
   25207:	48 01 d0             	add    rax,rdx
   2520a:	39 70 04             	cmp    DWORD PTR [rax+0x4],esi
   2520d:	0f 85 b0 38 00 00    	jne    28ac3 <JS_CallInternal+0x60c3>
   25213:	80 78 03 3f          	cmp    BYTE PTR [rax+0x3],0x3f
   25217:	0f 87 e9 3d 00 00    	ja     29006 <JS_CallInternal+0x6606>
   2521d:	48 8b 41 20          	mov    rax,QWORD PTR [rcx+0x20]
   25221:	49 c1 e0 04          	shl    r8,0x4
   25225:	4a 8d 54 00 f0       	lea    rdx,[rax+r8*1-0x10]
   2522a:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   2522d:	48 8b 52 08          	mov    rdx,QWORD PTR [rdx+0x8]
   25231:	83 fa f6             	cmp    edx,0xfffffff6
   25234:	76 04                	jbe    2523a <JS_CallInternal+0x283a>
   25236:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
   2523a:	48 89 03             	mov    QWORD PTR [rbx],rax
   2523d:	49 83 c4 05          	add    r12,0x5
   25241:	48 83 c3 10          	add    rbx,0x10
   25245:	48 89 53 f8          	mov    QWORD PTR [rbx-0x8],rdx
   25249:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2524f:	49 89 c5             	mov    r13,rax
   25252:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25256:	ff e0                	jmp    rax
   25258:	f3 0f 1e fa          	endbr64
   2525c:	48 8b 7b f8          	mov    rdi,QWORD PTR [rbx-0x8]
   25260:	41 8b 34 24          	mov    esi,DWORD PTR [r12]
   25264:	4d 8d 74 24 04       	lea    r14,[r12+0x4]
   25269:	4c 8b 53 f0          	mov    r10,QWORD PTR [rbx-0x10]
   2526d:	83 ff ff             	cmp    edi,0xffffffff
   25270:	0f 85 3d 3d 00 00    	jne    28fb3 <JS_CallInternal+0x65b3>
   25276:	4c 89 d1             	mov    rcx,r10
   25279:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   25280:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
   25284:	8b 42 18             	mov    eax,DWORD PTR [rdx+0x18]
   25287:	41 89 c0             	mov    r8d,eax
   2528a:	41 21 f0             	and    r8d,esi
   2528d:	46 8b 44 82 38       	mov    r8d,DWORD PTR [rdx+r8*4+0x38]
   25292:	4d 85 c0             	test   r8,r8
   25295:	0f 84 00 38 00 00    	je     28a9b <JS_CallInternal+0x609b>
   2529b:	4c 8d 0c 85 34 00 00 	lea    r9,[rax*4+0x34]
   252a2:	00 
   252a3:	4b 8d 04 c1          	lea    rax,[r9+r8*8]
   252a7:	48 01 d0             	add    rax,rdx
   252aa:	39 70 04             	cmp    DWORD PTR [rax+0x4],esi
   252ad:	0f 85 d8 37 00 00    	jne    28a8b <JS_CallInternal+0x608b>
   252b3:	80 78 03 3f          	cmp    BYTE PTR [rax+0x3],0x3f
   252b7:	0f 87 f6 3c 00 00    	ja     28fb3 <JS_CallInternal+0x65b3>
   252bd:	48 8b 41 20          	mov    rax,QWORD PTR [rcx+0x20]
   252c1:	49 c1 e0 04          	shl    r8,0x4
   252c5:	4a 8d 54 00 f0       	lea    rdx,[rax+r8*1-0x10]
   252ca:	4c 8b 42 08          	mov    r8,QWORD PTR [rdx+0x8]
   252ce:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   252d1:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   252d5:	76 04                	jbe    252db <JS_CallInternal+0x28db>
   252d7:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
   252db:	4c 8d 6b f0          	lea    r13,[rbx-0x10]
   252df:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
   252e3:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
   252e7:	83 fa f6             	cmp    edx,0xfffffff6
   252ea:	76 11                	jbe    252fd <JS_CallInternal+0x28fd>
   252ec:	8b 4e fc             	mov    ecx,DWORD PTR [rsi-0x4]
   252ef:	83 e9 01             	sub    ecx,0x1
   252f2:	89 4e fc             	mov    DWORD PTR [rsi-0x4],ecx
   252f5:	85 c9                	test   ecx,ecx
   252f7:	0f 8e f6 4c 00 00    	jle    29ff3 <JS_CallInternal+0x75f3>
   252fd:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   25301:	49 83 c4 05          	add    r12,0x5
   25305:	4c 89 43 f8          	mov    QWORD PTR [rbx-0x8],r8
   25309:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2530f:	49 89 c5             	mov    r13,rax
   25312:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25316:	ff e0                	jmp    rax
   25318:	f3 0f 1e fa          	endbr64
   2531c:	83 7b f8 03          	cmp    DWORD PTR [rbx-0x8],0x3
   25320:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   25324:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   25328:	0f 87 02 45 00 00    	ja     29830 <JS_CallInternal+0x6e30>
   2532e:	31 c0                	xor    eax,eax
   25330:	85 d2                	test   edx,edx
   25332:	0f 95 c0             	setne  al
   25335:	85 c0                	test   eax,eax
   25337:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   2533e:	00 
   2533f:	0f 94 c0             	sete   al
   25342:	49 83 c4 01          	add    r12,0x1
   25346:	0f b6 c0             	movzx  eax,al
   25349:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   2534d:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   25353:	49 89 c5             	mov    r13,rax
   25356:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2535a:	ff e0                	jmp    rax
   2535c:	f3 0f 1e fa          	endbr64
   25360:	45 0f b6 34 24       	movzx  r14d,BYTE PTR [r12]
   25365:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2536c:	4d 8d 6c 24 01       	lea    r13,[r12+0x1]
   25371:	4c 8b 43 c0          	mov    r8,QWORD PTR [rbx-0x40]
   25375:	4c 8b 4b c8          	mov    r9,QWORD PTR [rbx-0x38]
   25379:	4c 89 68 30          	mov    QWORD PTR [rax+0x30],r13
   2537d:	44 89 f0             	mov    eax,r14d
   25380:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   25387:	83 e0 01             	and    eax,0x1
   2538a:	4c 89 c6             	mov    rsi,r8
   2538d:	4c 89 ca             	mov    rdx,r9
   25390:	3c 01                	cmp    al,0x1
   25392:	19 c9                	sbb    ecx,ecx
   25394:	48 83 ec 08          	sub    rsp,0x8
   25398:	6a 00                	push   0x0
   2539a:	83 e1 ef             	and    ecx,0xffffffef
   2539d:	83 c1 17             	add    ecx,0x17
   253a0:	e8 9b 74 00 00       	call   2c840 <JS_GetPropertyInternal>
   253a5:	41 58                	pop    r8
   253a7:	41 59                	pop    r9
   253a9:	83 fa 06             	cmp    edx,0x6
   253ac:	0f 84 16 4c 00 00    	je     29fc8 <JS_CallInternal+0x75c8>
   253b2:	8d 72 fe             	lea    esi,[rdx-0x2]
   253b5:	b9 01 00 00 00       	mov    ecx,0x1
   253ba:	83 fe 01             	cmp    esi,0x1
   253bd:	0f 87 3d 40 00 00    	ja     29400 <JS_CallInternal+0x6a00>
   253c3:	48 89 0b             	mov    QWORD PTR [rbx],rcx
   253c6:	49 83 c4 02          	add    r12,0x2
   253ca:	48 83 c3 10          	add    rbx,0x10
   253ce:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   253d5:	00 
   253d6:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   253dc:	49 89 c5             	mov    r13,rax
   253df:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   253e3:	ff e0                	jmp    rax
   253e5:	f3 0f 1e fa          	endbr64
   253e9:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   253f0:	4c 8d 6b f0          	lea    r13,[rbx-0x10]
   253f4:	48 8b 4b c0          	mov    rcx,QWORD PTR [rbx-0x40]
   253f8:	48 c7 85 f0 fd ff ff 	mov    QWORD PTR [rbp-0x210],0x0
   253ff:	00 00 00 00 
   25403:	4c 8b 43 c8          	mov    r8,QWORD PTR [rbx-0x38]
   25407:	48 8b 73 d0          	mov    rsi,QWORD PTR [rbx-0x30]
   2540b:	41 b9 01 00 00 00    	mov    r9d,0x1
   25411:	48 c7 85 f8 fd ff ff 	mov    QWORD PTR [rbp-0x208],0x3
   25418:	03 00 00 00 
   2541c:	48 8b 53 d8          	mov    rdx,QWORD PTR [rbx-0x28]
   25420:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   25427:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   2542b:	6a 02                	push   0x2
   2542d:	41 55                	push   r13
   2542f:	ff b5 f8 fd ff ff    	push   QWORD PTR [rbp-0x208]
   25435:	ff b5 f0 fd ff ff    	push   QWORD PTR [rbp-0x210]
   2543b:	e8 c0 d5 ff ff       	call   22a00 <JS_CallInternal>
   25440:	48 83 c4 20          	add    rsp,0x20
   25444:	48 89 c1             	mov    rcx,rax
   25447:	49 89 d6             	mov    r14,rdx
   2544a:	83 fa 06             	cmp    edx,0x6
   2544d:	0f 84 4d dd ff ff    	je     231a0 <JS_CallInternal+0x7a0>
   25453:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   25457:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   2545b:	83 fa f6             	cmp    edx,0xfffffff6
   2545e:	76 11                	jbe    25471 <JS_CallInternal+0x2a71>
   25460:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25463:	83 e8 01             	sub    eax,0x1
   25466:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25469:	85 c0                	test   eax,eax
   2546b:	0f 8e 5f 4b 00 00    	jle    29fd0 <JS_CallInternal+0x75d0>
   25471:	48 89 4b f0          	mov    QWORD PTR [rbx-0x10],rcx
   25475:	49 83 c4 01          	add    r12,0x1
   25479:	4c 89 73 f8          	mov    QWORD PTR [rbx-0x8],r14
   2547d:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   25483:	49 89 c5             	mov    r13,rax
   25486:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2548a:	ff e0                	jmp    rax
   2548c:	f3 0f 1e fa          	endbr64
   25490:	4c 8b 6b f0          	mov    r13,QWORD PTR [rbx-0x10]
   25494:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
   25498:	48 8b 5b f8          	mov    rbx,QWORD PTR [rbx-0x8]
   2549c:	4c 39 b5 68 fe ff ff 	cmp    QWORD PTR [rbp-0x198],r14
   254a3:	0f 83 ea 37 00 00    	jae    28c93 <JS_CallInternal+0x6293>
   254a9:	4c 89 a5 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r12
   254b0:	4d 89 f4             	mov    r12,r14
   254b3:	49 89 de             	mov    r14,rbx
   254b6:	48 8b 9d 68 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x198]
   254bd:	eb 0a                	jmp    254c9 <JS_CallInternal+0x2ac9>
   254bf:	90                   	nop
   254c0:	4c 39 e3             	cmp    rbx,r12
   254c3:	0f 83 bd 37 00 00    	jae    28c86 <JS_CallInternal+0x6286>
   254c9:	41 83 7c 24 f8 05    	cmp    DWORD PTR [r12-0x8],0x5
   254cf:	0f 84 b1 37 00 00    	je     28c86 <JS_CallInternal+0x6286>
   254d5:	49 8b 4c 24 f8       	mov    rcx,QWORD PTR [r12-0x8]
   254da:	49 83 ec 10          	sub    r12,0x10
   254de:	49 8b 34 24          	mov    rsi,QWORD PTR [r12]
   254e2:	83 f9 f6             	cmp    ecx,0xfffffff6
   254e5:	76 d9                	jbe    254c0 <JS_CallInternal+0x2ac0>
   254e7:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   254ea:	8d 50 ff             	lea    edx,[rax-0x1]
   254ed:	89 56 fc             	mov    DWORD PTR [rsi-0x4],edx
   254f0:	85 d2                	test   edx,edx
   254f2:	7f cc                	jg     254c0 <JS_CallInternal+0x2ac0>
   254f4:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   254fb:	48 89 ca             	mov    rdx,rcx
   254fe:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   25502:	e8 69 73 ff ff       	call   1c870 <__JS_FreeValueRT>
   25507:	eb b7                	jmp    254c0 <JS_CallInternal+0x2ac0>
   25509:	f3 0f 1e fa          	endbr64
   2550d:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   25514:	f3 0f 6f 73 f0       	movdqu xmm6,XMMWORD PTR [rbx-0x10]
   25519:	48 83 eb 10          	sub    rbx,0x10
   2551d:	48 8b 00             	mov    rax,QWORD PTR [rax]
   25520:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   25524:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   25528:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   2552b:	0f 11 30             	movups XMMWORD PTR [rax],xmm6
   2552e:	83 fa f6             	cmp    edx,0xfffffff6
   25531:	76 11                	jbe    25544 <JS_CallInternal+0x2b44>
   25533:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25536:	83 e8 01             	sub    eax,0x1
   25539:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2553c:	85 c0                	test   eax,eax
   2553e:	0f 8e 98 4c 00 00    	jle    2a1dc <JS_CallInternal+0x77dc>
   25544:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25549:	49 83 c4 01          	add    r12,0x1
   2554d:	49 89 c5             	mov    r13,rax
   25550:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25554:	ff e0                	jmp    rax
   25556:	f3 0f 1e fa          	endbr64
   2555a:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   25561:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   25565:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
   25569:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   2556d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   25570:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   25574:	83 f8 f6             	cmp    eax,0xfffffff6
   25577:	76 04                	jbe    2557d <JS_CallInternal+0x2b7d>
   25579:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   2557d:	48 89 13             	mov    QWORD PTR [rbx],rdx
   25580:	49 83 c4 01          	add    r12,0x1
   25584:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
   25588:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2558e:	48 89 cb             	mov    rbx,rcx
   25591:	49 89 c5             	mov    r13,rax
   25594:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25598:	ff e0                	jmp    rax
   2559a:	f3 0f 1e fa          	endbr64
   2559e:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   255a5:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   255a9:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   255ad:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   255b1:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   255b4:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   255b8:	83 f8 f6             	cmp    eax,0xfffffff6
   255bb:	76 04                	jbe    255c1 <JS_CallInternal+0x2bc1>
   255bd:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   255c1:	48 89 13             	mov    QWORD PTR [rbx],rdx
   255c4:	49 83 c4 01          	add    r12,0x1
   255c8:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
   255cc:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   255d2:	48 89 cb             	mov    rbx,rcx
   255d5:	49 89 c5             	mov    r13,rax
   255d8:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   255dc:	ff e0                	jmp    rax
   255de:	f3 0f 1e fa          	endbr64
   255e2:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   255e9:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   255ed:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   255f1:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   255f5:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   255f8:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   255fc:	83 f8 f6             	cmp    eax,0xfffffff6
   255ff:	76 04                	jbe    25605 <JS_CallInternal+0x2c05>
   25601:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   25605:	48 89 13             	mov    QWORD PTR [rbx],rdx
   25608:	49 83 c4 01          	add    r12,0x1
   2560c:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
   25610:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   25616:	48 89 cb             	mov    rbx,rcx
   25619:	49 89 c5             	mov    r13,rax
   2561c:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25620:	ff e0                	jmp    rax
   25622:	f3 0f 1e fa          	endbr64
   25626:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   2562d:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   25631:	48 8b 00             	mov    rax,QWORD PTR [rax]
   25634:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   25638:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   2563b:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   2563f:	83 f8 f6             	cmp    eax,0xfffffff6
   25642:	76 04                	jbe    25648 <JS_CallInternal+0x2c48>
   25644:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   25648:	48 89 13             	mov    QWORD PTR [rbx],rdx
   2564b:	49 83 c4 01          	add    r12,0x1
   2564f:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
   25653:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   25659:	48 89 cb             	mov    rbx,rcx
   2565c:	49 89 c5             	mov    r13,rax
   2565f:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25663:	ff e0                	jmp    rax
   25665:	f3 0f 1e fa          	endbr64
   25669:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   2566d:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   25671:	83 f8 f6             	cmp    eax,0xfffffff6
   25674:	76 04                	jbe    2567a <JS_CallInternal+0x2c7a>
   25676:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   2567a:	48 8b bd 88 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x178]
   25681:	48 8b 4f 38          	mov    rcx,QWORD PTR [rdi+0x38]
   25685:	48 8b 77 30          	mov    rsi,QWORD PTR [rdi+0x30]
   25689:	48 89 47 38          	mov    QWORD PTR [rdi+0x38],rax
   2568d:	48 89 57 30          	mov    QWORD PTR [rdi+0x30],rdx
   25691:	83 f9 f6             	cmp    ecx,0xfffffff6
   25694:	76 11                	jbe    256a7 <JS_CallInternal+0x2ca7>
   25696:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25699:	83 e8 01             	sub    eax,0x1
   2569c:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2569f:	85 c0                	test   eax,eax
   256a1:	0f 8e 4a 4b 00 00    	jle    2a1f1 <JS_CallInternal+0x77f1>
   256a7:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   256ac:	49 83 c4 01          	add    r12,0x1
   256b0:	49 89 c5             	mov    r13,rax
   256b3:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   256b7:	ff e0                	jmp    rax
   256b9:	f3 0f 1e fa          	endbr64
   256bd:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   256c1:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   256c5:	83 f8 f6             	cmp    eax,0xfffffff6
   256c8:	76 04                	jbe    256ce <JS_CallInternal+0x2cce>
   256ca:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   256ce:	48 8b bd 88 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x178]
   256d5:	48 8b 4f 28          	mov    rcx,QWORD PTR [rdi+0x28]
   256d9:	48 8b 77 20          	mov    rsi,QWORD PTR [rdi+0x20]
   256dd:	48 89 47 28          	mov    QWORD PTR [rdi+0x28],rax
   256e1:	48 89 57 20          	mov    QWORD PTR [rdi+0x20],rdx
   256e5:	83 f9 f6             	cmp    ecx,0xfffffff6
   256e8:	76 11                	jbe    256fb <JS_CallInternal+0x2cfb>
   256ea:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   256ed:	83 e8 01             	sub    eax,0x1
   256f0:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   256f3:	85 c0                	test   eax,eax
   256f5:	0f 8e 0e 4b 00 00    	jle    2a209 <JS_CallInternal+0x7809>
   256fb:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25700:	49 83 c4 01          	add    r12,0x1
   25704:	49 89 c5             	mov    r13,rax
   25707:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2570b:	ff e0                	jmp    rax
   2570d:	f3 0f 1e fa          	endbr64
   25711:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   25715:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   25719:	83 f8 f6             	cmp    eax,0xfffffff6
   2571c:	76 04                	jbe    25722 <JS_CallInternal+0x2d22>
   2571e:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   25722:	48 8b bd 88 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x178]
   25729:	48 8b 4f 18          	mov    rcx,QWORD PTR [rdi+0x18]
   2572d:	48 8b 77 10          	mov    rsi,QWORD PTR [rdi+0x10]
   25731:	48 89 47 18          	mov    QWORD PTR [rdi+0x18],rax
   25735:	48 89 57 10          	mov    QWORD PTR [rdi+0x10],rdx
   25739:	83 f9 f6             	cmp    ecx,0xfffffff6
   2573c:	76 11                	jbe    2574f <JS_CallInternal+0x2d4f>
   2573e:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25741:	83 e8 01             	sub    eax,0x1
   25744:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25747:	85 c0                	test   eax,eax
   25749:	0f 8e d2 4a 00 00    	jle    2a221 <JS_CallInternal+0x7821>
   2574f:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25754:	49 83 c4 01          	add    r12,0x1
   25758:	49 89 c5             	mov    r13,rax
   2575b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2575f:	ff e0                	jmp    rax
   25761:	f3 0f 1e fa          	endbr64
   25765:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   25769:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   2576d:	83 f8 f6             	cmp    eax,0xfffffff6
   25770:	76 04                	jbe    25776 <JS_CallInternal+0x2d76>
   25772:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   25776:	48 8b bd 88 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x178]
   2577d:	48 8b 4f 08          	mov    rcx,QWORD PTR [rdi+0x8]
   25781:	48 8b 37             	mov    rsi,QWORD PTR [rdi]
   25784:	48 89 47 08          	mov    QWORD PTR [rdi+0x8],rax
   25788:	48 89 17             	mov    QWORD PTR [rdi],rdx
   2578b:	83 f9 f6             	cmp    ecx,0xfffffff6
   2578e:	76 11                	jbe    257a1 <JS_CallInternal+0x2da1>
   25790:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25793:	83 e8 01             	sub    eax,0x1
   25796:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25799:	85 c0                	test   eax,eax
   2579b:	0f 8e ca 49 00 00    	jle    2a16b <JS_CallInternal+0x776b>
   257a1:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   257a6:	49 83 c4 01          	add    r12,0x1
   257aa:	49 89 c5             	mov    r13,rax
   257ad:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   257b1:	ff e0                	jmp    rax
   257b3:	f3 0f 1e fa          	endbr64
   257b7:	48 8b 85 88 fe ff ff 	mov    rax,QWORD PTR [rbp-0x178]
   257be:	f3 0f 6f 4b f0       	movdqu xmm1,XMMWORD PTR [rbx-0x10]
   257c3:	48 83 eb 10          	sub    rbx,0x10
   257c7:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   257cb:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   257ce:	0f 11 08             	movups XMMWORD PTR [rax],xmm1
   257d1:	83 fa f6             	cmp    edx,0xfffffff6
   257d4:	76 11                	jbe    257e7 <JS_CallInternal+0x2de7>
   257d6:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   257d9:	83 e8 01             	sub    eax,0x1
   257dc:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   257df:	85 c0                	test   eax,eax
   257e1:	0f 8e 6f 49 00 00    	jle    2a156 <JS_CallInternal+0x7756>
   257e7:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   257ec:	49 83 c4 01          	add    r12,0x1
   257f0:	49 89 c5             	mov    r13,rax
   257f3:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   257f7:	ff e0                	jmp    rax
   257f9:	f3 0f 1e fa          	endbr64
   257fd:	48 8b 85 88 fe ff ff 	mov    rax,QWORD PTR [rbp-0x178]
   25804:	f3 0f 6f 53 f0       	movdqu xmm2,XMMWORD PTR [rbx-0x10]
   25809:	48 83 eb 10          	sub    rbx,0x10
   2580d:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
   25811:	48 8b 70 20          	mov    rsi,QWORD PTR [rax+0x20]
   25815:	0f 11 50 20          	movups XMMWORD PTR [rax+0x20],xmm2
   25819:	83 fa f6             	cmp    edx,0xfffffff6
   2581c:	76 11                	jbe    2582f <JS_CallInternal+0x2e2f>
   2581e:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25821:	83 e8 01             	sub    eax,0x1
   25824:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25827:	85 c0                	test   eax,eax
   25829:	0f 8e 12 49 00 00    	jle    2a141 <JS_CallInternal+0x7741>
   2582f:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25834:	49 83 c4 01          	add    r12,0x1
   25838:	49 89 c5             	mov    r13,rax
   2583b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2583f:	ff e0                	jmp    rax
   25841:	f3 0f 1e fa          	endbr64
   25845:	48 8b 85 88 fe ff ff 	mov    rax,QWORD PTR [rbp-0x178]
   2584c:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   25850:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
   25854:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
   25858:	83 f8 f6             	cmp    eax,0xfffffff6
   2585b:	76 04                	jbe    25861 <JS_CallInternal+0x2e61>
   2585d:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   25861:	48 89 13             	mov    QWORD PTR [rbx],rdx
   25864:	49 83 c4 01          	add    r12,0x1
   25868:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
   2586c:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   25872:	48 89 cb             	mov    rbx,rcx
   25875:	49 89 c5             	mov    r13,rax
   25878:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2587c:	ff e0                	jmp    rax
   2587e:	f3 0f 1e fa          	endbr64
   25882:	48 8b 85 88 fe ff ff 	mov    rax,QWORD PTR [rbp-0x178]
   25889:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   2588d:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
   25891:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   25895:	83 f8 f6             	cmp    eax,0xfffffff6
   25898:	76 04                	jbe    2589e <JS_CallInternal+0x2e9e>
   2589a:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   2589e:	48 89 13             	mov    QWORD PTR [rbx],rdx
   258a1:	49 83 c4 01          	add    r12,0x1
   258a5:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
   258a9:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   258af:	48 89 cb             	mov    rbx,rcx
   258b2:	49 89 c5             	mov    r13,rax
   258b5:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   258b9:	ff e0                	jmp    rax
   258bb:	f3 0f 1e fa          	endbr64
   258bf:	48 8b 85 88 fe ff ff 	mov    rax,QWORD PTR [rbp-0x178]
   258c6:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   258ca:	48 8b 50 30          	mov    rdx,QWORD PTR [rax+0x30]
   258ce:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
   258d2:	83 f8 f6             	cmp    eax,0xfffffff6
   258d5:	76 04                	jbe    258db <JS_CallInternal+0x2edb>
   258d7:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   258db:	48 89 13             	mov    QWORD PTR [rbx],rdx
   258de:	49 83 c4 01          	add    r12,0x1
   258e2:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
   258e6:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   258ec:	48 89 cb             	mov    rbx,rcx
   258ef:	49 89 c5             	mov    r13,rax
   258f2:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   258f6:	ff e0                	jmp    rax
   258f8:	f3 0f 1e fa          	endbr64
   258fc:	48 8b 85 88 fe ff ff 	mov    rax,QWORD PTR [rbp-0x178]
   25903:	f3 0f 6f 6b f0       	movdqu xmm5,XMMWORD PTR [rbx-0x10]
   25908:	48 83 eb 10          	sub    rbx,0x10
   2590c:	48 8b 50 38          	mov    rdx,QWORD PTR [rax+0x38]
   25910:	48 8b 70 30          	mov    rsi,QWORD PTR [rax+0x30]
   25914:	0f 11 68 30          	movups XMMWORD PTR [rax+0x30],xmm5
   25918:	83 fa f6             	cmp    edx,0xfffffff6
   2591b:	76 11                	jbe    2592e <JS_CallInternal+0x2f2e>
   2591d:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25920:	83 e8 01             	sub    eax,0x1
   25923:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25926:	85 c0                	test   eax,eax
   25928:	0f 8e fe 47 00 00    	jle    2a12c <JS_CallInternal+0x772c>
   2592e:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25933:	49 83 c4 01          	add    r12,0x1
   25937:	49 89 c5             	mov    r13,rax
   2593a:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2593e:	ff e0                	jmp    rax
   25940:	f3 0f 1e fa          	endbr64
   25944:	48 8b 85 88 fe ff ff 	mov    rax,QWORD PTR [rbp-0x178]
   2594b:	f3 0f 6f 63 f0       	movdqu xmm4,XMMWORD PTR [rbx-0x10]
   25950:	48 83 eb 10          	sub    rbx,0x10
   25954:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
   25958:	48 8b 70 10          	mov    rsi,QWORD PTR [rax+0x10]
   2595c:	0f 11 60 10          	movups XMMWORD PTR [rax+0x10],xmm4
   25960:	83 fa f6             	cmp    edx,0xfffffff6
   25963:	76 11                	jbe    25976 <JS_CallInternal+0x2f76>
   25965:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25968:	83 e8 01             	sub    eax,0x1
   2596b:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2596e:	85 c0                	test   eax,eax
   25970:	0f 8e 59 47 00 00    	jle    2a0cf <JS_CallInternal+0x76cf>
   25976:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   2597b:	49 83 c4 01          	add    r12,0x1
   2597f:	49 89 c5             	mov    r13,rax
   25982:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25986:	ff e0                	jmp    rax
   25988:	f3 0f 1e fa          	endbr64
   2598c:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   25991:	48 8b 8d 98 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x168]
   25998:	48 8b 04 c1          	mov    rax,QWORD PTR [rcx+rax*8]
   2599c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   259a0:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   259a3:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   259a7:	83 f8 f6             	cmp    eax,0xfffffff6
   259aa:	76 04                	jbe    259b0 <JS_CallInternal+0x2fb0>
   259ac:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   259b0:	48 89 13             	mov    QWORD PTR [rbx],rdx
   259b3:	49 83 c4 03          	add    r12,0x3
   259b7:	48 83 c3 10          	add    rbx,0x10
   259bb:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
   259bf:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   259c5:	49 89 c5             	mov    r13,rax
   259c8:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   259cc:	ff e0                	jmp    rax
   259ce:	f3 0f 1e fa          	endbr64
   259d2:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   259d6:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   259da:	83 fa f6             	cmp    edx,0xfffffff6
   259dd:	76 04                	jbe    259e3 <JS_CallInternal+0x2fe3>
   259df:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
   259e3:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   259ea:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   259ee:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   259f2:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   259f6:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   259f9:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
   259fd:	48 89 08             	mov    QWORD PTR [rax],rcx
   25a00:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   25a04:	76 11                	jbe    25a17 <JS_CallInternal+0x3017>
   25a06:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25a09:	83 e8 01             	sub    eax,0x1
   25a0c:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25a0f:	85 c0                	test   eax,eax
   25a11:	0f 8e cd 46 00 00    	jle    2a0e4 <JS_CallInternal+0x76e4>
   25a17:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25a1c:	49 83 c4 01          	add    r12,0x1
   25a20:	49 89 c5             	mov    r13,rax
   25a23:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25a27:	ff e0                	jmp    rax
   25a29:	f3 0f 1e fa          	endbr64
   25a2d:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   25a31:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   25a35:	83 fa f6             	cmp    edx,0xfffffff6
   25a38:	76 04                	jbe    25a3e <JS_CallInternal+0x303e>
   25a3a:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
   25a3e:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   25a45:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
   25a49:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   25a4d:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   25a51:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   25a54:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
   25a58:	48 89 08             	mov    QWORD PTR [rax],rcx
   25a5b:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   25a5f:	76 11                	jbe    25a72 <JS_CallInternal+0x3072>
   25a61:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25a64:	83 e8 01             	sub    eax,0x1
   25a67:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25a6a:	85 c0                	test   eax,eax
   25a6c:	0f 8e 8a 46 00 00    	jle    2a0fc <JS_CallInternal+0x76fc>
   25a72:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25a77:	49 83 c4 01          	add    r12,0x1
   25a7b:	49 89 c5             	mov    r13,rax
   25a7e:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25a82:	ff e0                	jmp    rax
   25a84:	f3 0f 1e fa          	endbr64
   25a88:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   25a8c:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   25a90:	83 fa f6             	cmp    edx,0xfffffff6
   25a93:	76 04                	jbe    25a99 <JS_CallInternal+0x3099>
   25a95:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
   25a99:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   25aa0:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   25aa4:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   25aa8:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   25aac:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   25aaf:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
   25ab3:	48 89 08             	mov    QWORD PTR [rax],rcx
   25ab6:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   25aba:	76 11                	jbe    25acd <JS_CallInternal+0x30cd>
   25abc:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25abf:	83 e8 01             	sub    eax,0x1
   25ac2:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25ac5:	85 c0                	test   eax,eax
   25ac7:	0f 8e 47 46 00 00    	jle    2a114 <JS_CallInternal+0x7714>
   25acd:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25ad2:	49 83 c4 01          	add    r12,0x1
   25ad6:	49 89 c5             	mov    r13,rax
   25ad9:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25add:	ff e0                	jmp    rax
   25adf:	f3 0f 1e fa          	endbr64
   25ae3:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   25ae7:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   25aeb:	83 fa f6             	cmp    edx,0xfffffff6
   25aee:	76 04                	jbe    25af4 <JS_CallInternal+0x30f4>
   25af0:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
   25af4:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   25afb:	48 8b 00             	mov    rax,QWORD PTR [rax]
   25afe:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   25b02:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   25b06:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   25b09:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
   25b0d:	48 89 08             	mov    QWORD PTR [rax],rcx
   25b10:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   25b14:	76 11                	jbe    25b27 <JS_CallInternal+0x3127>
   25b16:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25b19:	83 e8 01             	sub    eax,0x1
   25b1c:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25b1f:	85 c0                	test   eax,eax
   25b21:	0f 8e 27 45 00 00    	jle    2a04e <JS_CallInternal+0x764e>
   25b27:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25b2c:	49 83 c4 01          	add    r12,0x1
   25b30:	49 89 c5             	mov    r13,rax
   25b33:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25b37:	ff e0                	jmp    rax
   25b39:	f3 0f 1e fa          	endbr64
   25b3d:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   25b44:	f3 0f 6f 5b f0       	movdqu xmm3,XMMWORD PTR [rbx-0x10]
   25b49:	48 83 eb 10          	sub    rbx,0x10
   25b4d:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
   25b51:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   25b55:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   25b59:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   25b5c:	0f 11 18             	movups XMMWORD PTR [rax],xmm3
   25b5f:	83 fa f6             	cmp    edx,0xfffffff6
   25b62:	76 11                	jbe    25b75 <JS_CallInternal+0x3175>
   25b64:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25b67:	83 e8 01             	sub    eax,0x1
   25b6a:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25b6d:	85 c0                	test   eax,eax
   25b6f:	0f 8e 06 45 00 00    	jle    2a07b <JS_CallInternal+0x767b>
   25b75:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25b7a:	49 83 c4 01          	add    r12,0x1
   25b7e:	49 89 c5             	mov    r13,rax
   25b81:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25b85:	ff e0                	jmp    rax
   25b87:	f3 0f 1e fa          	endbr64
   25b8b:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   25b92:	f3 0f 6f 4b f0       	movdqu xmm1,XMMWORD PTR [rbx-0x10]
   25b97:	48 83 eb 10          	sub    rbx,0x10
   25b9b:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   25b9f:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   25ba3:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   25ba7:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   25baa:	0f 11 08             	movups XMMWORD PTR [rax],xmm1
   25bad:	83 fa f6             	cmp    edx,0xfffffff6
   25bb0:	76 11                	jbe    25bc3 <JS_CallInternal+0x31c3>
   25bb2:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25bb5:	83 e8 01             	sub    eax,0x1
   25bb8:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25bbb:	85 c0                	test   eax,eax
   25bbd:	0f 8e a3 44 00 00    	jle    2a066 <JS_CallInternal+0x7666>
   25bc3:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25bc8:	49 83 c4 01          	add    r12,0x1
   25bcc:	49 89 c5             	mov    r13,rax
   25bcf:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25bd3:	ff e0                	jmp    rax
   25bd5:	f3 0f 1e fa          	endbr64
   25bd9:	48 8b 85 98 fe ff ff 	mov    rax,QWORD PTR [rbp-0x168]
   25be0:	f3 0f 6f 7b f0       	movdqu xmm7,XMMWORD PTR [rbx-0x10]
   25be5:	48 83 eb 10          	sub    rbx,0x10
   25be9:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   25bed:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   25bf1:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   25bf5:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   25bf8:	0f 11 38             	movups XMMWORD PTR [rax],xmm7
   25bfb:	83 fa f6             	cmp    edx,0xfffffff6
   25bfe:	76 11                	jbe    25c11 <JS_CallInternal+0x3211>
   25c00:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25c03:	83 e8 01             	sub    eax,0x1
   25c06:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25c09:	85 c0                	test   eax,eax
   25c0b:	0f 8e 7f 44 00 00    	jle    2a090 <JS_CallInternal+0x7690>
   25c11:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25c16:	49 83 c4 01          	add    r12,0x1
   25c1a:	49 89 c5             	mov    r13,rax
   25c1d:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25c21:	ff e0                	jmp    rax
   25c23:	f3 0f 1e fa          	endbr64
   25c27:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   25c2b:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   25c30:	48 8b 7b f0          	mov    rdi,QWORD PTR [rbx-0x10]
   25c34:	83 fa f6             	cmp    edx,0xfffffff6
   25c37:	76 04                	jbe    25c3d <JS_CallInternal+0x323d>
   25c39:	83 47 fc 01          	add    DWORD PTR [rdi-0x4],0x1
   25c3d:	48 8b 8d 98 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x168]
   25c44:	48 8b 04 c1          	mov    rax,QWORD PTR [rcx+rax*8]
   25c48:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   25c4c:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
   25c50:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   25c53:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
   25c57:	48 89 38             	mov    QWORD PTR [rax],rdi
   25c5a:	83 f9 f6             	cmp    ecx,0xfffffff6
   25c5d:	76 11                	jbe    25c70 <JS_CallInternal+0x3270>
   25c5f:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25c62:	83 e8 01             	sub    eax,0x1
   25c65:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25c68:	85 c0                	test   eax,eax
   25c6a:	0f 8e 68 46 00 00    	jle    2a2d8 <JS_CallInternal+0x78d8>
   25c70:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
   25c76:	49 83 c4 03          	add    r12,0x3
   25c7a:	49 89 c5             	mov    r13,rax
   25c7d:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25c81:	ff e0                	jmp    rax
   25c83:	f3 0f 1e fa          	endbr64
   25c87:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   25c8c:	48 8b bd 98 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x168]
   25c93:	4d 8d 6c 24 02       	lea    r13,[r12+0x2]
   25c98:	48 8d 0c c5 00 00 00 	lea    rcx,[rax*8+0x0]
   25c9f:	00 
   25ca0:	48 8b 04 c7          	mov    rax,QWORD PTR [rdi+rax*8]
   25ca4:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   25ca8:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   25cab:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   25caf:	83 f8 04             	cmp    eax,0x4
   25cb2:	0f 84 93 51 00 00    	je     2ae4b <JS_CallInternal+0x844b>
   25cb8:	83 f8 f6             	cmp    eax,0xfffffff6
   25cbb:	76 04                	jbe    25cc1 <JS_CallInternal+0x32c1>
   25cbd:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   25cc1:	48 89 13             	mov    QWORD PTR [rbx],rdx
   25cc4:	49 83 c4 03          	add    r12,0x3
   25cc8:	48 83 c3 10          	add    rbx,0x10
   25ccc:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
   25cd0:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   25cd6:	49 89 c5             	mov    r13,rax
   25cd9:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25cdd:	ff e0                	jmp    rax
   25cdf:	f3 0f 1e fa          	endbr64
   25ce3:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   25ce8:	48 8b 8d 98 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x168]
   25cef:	f3 0f 6f 63 f0       	movdqu xmm4,XMMWORD PTR [rbx-0x10]
   25cf4:	48 8b 04 c1          	mov    rax,QWORD PTR [rcx+rax*8]
   25cf8:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   25cfc:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   25d00:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   25d03:	0f 11 20             	movups XMMWORD PTR [rax],xmm4
   25d06:	83 fa f6             	cmp    edx,0xfffffff6
   25d09:	76 11                	jbe    25d1c <JS_CallInternal+0x331c>
   25d0b:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25d0e:	83 e8 01             	sub    eax,0x1
   25d11:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25d14:	85 c0                	test   eax,eax
   25d16:	0f 8e d4 45 00 00    	jle    2a2f0 <JS_CallInternal+0x78f0>
   25d1c:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
   25d22:	48 83 eb 10          	sub    rbx,0x10
   25d26:	49 83 c4 03          	add    r12,0x3
   25d2a:	49 89 c5             	mov    r13,rax
   25d2d:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25d31:	ff e0                	jmp    rax
   25d33:	f3 0f 1e fa          	endbr64
   25d37:	48 8b 43 d8          	mov    rax,QWORD PTR [rbx-0x28]
   25d3b:	48 8b 53 d0          	mov    rdx,QWORD PTR [rbx-0x30]
   25d3f:	83 f8 f6             	cmp    eax,0xfffffff6
   25d42:	76 04                	jbe    25d48 <JS_CallInternal+0x3348>
   25d44:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   25d48:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
   25d4c:	48 8b 43 e8          	mov    rax,QWORD PTR [rbx-0x18]
   25d50:	48 89 13             	mov    QWORD PTR [rbx],rdx
   25d53:	48 8b 53 e0          	mov    rdx,QWORD PTR [rbx-0x20]
   25d57:	83 f8 f6             	cmp    eax,0xfffffff6
   25d5a:	76 04                	jbe    25d60 <JS_CallInternal+0x3360>
   25d5c:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   25d60:	48 89 43 18          	mov    QWORD PTR [rbx+0x18],rax
   25d64:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   25d68:	48 89 53 10          	mov    QWORD PTR [rbx+0x10],rdx
   25d6c:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   25d70:	83 f8 f6             	cmp    eax,0xfffffff6
   25d73:	76 04                	jbe    25d79 <JS_CallInternal+0x3379>
   25d75:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   25d79:	48 89 53 20          	mov    QWORD PTR [rbx+0x20],rdx
   25d7d:	49 83 c4 01          	add    r12,0x1
   25d81:	48 83 c3 30          	add    rbx,0x30
   25d85:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
   25d89:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   25d8f:	49 89 c5             	mov    r13,rax
   25d92:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25d96:	ff e0                	jmp    rax
   25d98:	f3 0f 1e fa          	endbr64
   25d9c:	48 8b 43 e8          	mov    rax,QWORD PTR [rbx-0x18]
   25da0:	48 8b 53 e0          	mov    rdx,QWORD PTR [rbx-0x20]
   25da4:	83 f8 f6             	cmp    eax,0xfffffff6
   25da7:	76 04                	jbe    25dad <JS_CallInternal+0x33ad>
   25da9:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   25dad:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
   25db1:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   25db5:	48 89 13             	mov    QWORD PTR [rbx],rdx
   25db8:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   25dbc:	83 f8 f6             	cmp    eax,0xfffffff6
   25dbf:	76 04                	jbe    25dc5 <JS_CallInternal+0x33c5>
   25dc1:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   25dc5:	48 89 53 10          	mov    QWORD PTR [rbx+0x10],rdx
   25dc9:	49 83 c4 01          	add    r12,0x1
   25dcd:	48 83 c3 20          	add    rbx,0x20
   25dd1:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
   25dd5:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   25ddb:	49 89 c5             	mov    r13,rax
   25dde:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25de2:	ff e0                	jmp    rax
   25de4:	f3 0f 1e fa          	endbr64
   25de8:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   25dec:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   25df0:	83 f8 f6             	cmp    eax,0xfffffff6
   25df3:	76 04                	jbe    25df9 <JS_CallInternal+0x33f9>
   25df5:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   25df9:	48 89 13             	mov    QWORD PTR [rbx],rdx
   25dfc:	49 83 c4 01          	add    r12,0x1
   25e00:	48 83 c3 10          	add    rbx,0x10
   25e04:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
   25e08:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   25e0e:	49 89 c5             	mov    r13,rax
   25e11:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25e15:	ff e0                	jmp    rax
   25e17:	f3 0f 1e fa          	endbr64
   25e1b:	48 8b 53 d8          	mov    rdx,QWORD PTR [rbx-0x28]
   25e1f:	48 8b 73 d0          	mov    rsi,QWORD PTR [rbx-0x30]
   25e23:	83 fa f6             	cmp    edx,0xfffffff6
   25e26:	76 11                	jbe    25e39 <JS_CallInternal+0x3439>
   25e28:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25e2b:	83 e8 01             	sub    eax,0x1
   25e2e:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25e31:	85 c0                	test   eax,eax
   25e33:	0f 8e e1 44 00 00    	jle    2a31a <JS_CallInternal+0x791a>
   25e39:	f3 0f 6f 73 e0       	movdqu xmm6,XMMWORD PTR [rbx-0x20]
   25e3e:	f3 0f 6f 7b f0       	movdqu xmm7,XMMWORD PTR [rbx-0x10]
   25e43:	49 83 c4 01          	add    r12,0x1
   25e47:	48 83 eb 10          	sub    rbx,0x10
   25e4b:	0f 11 73 e0          	movups XMMWORD PTR [rbx-0x20],xmm6
   25e4f:	0f 11 7b f0          	movups XMMWORD PTR [rbx-0x10],xmm7
   25e53:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   25e59:	49 89 c5             	mov    r13,rax
   25e5c:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25e60:	ff e0                	jmp    rax
   25e62:	f3 0f 1e fa          	endbr64
   25e66:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   25e6a:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   25e6e:	83 fa f6             	cmp    edx,0xfffffff6
   25e71:	76 11                	jbe    25e84 <JS_CallInternal+0x3484>
   25e73:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25e76:	83 e8 01             	sub    eax,0x1
   25e79:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25e7c:	85 c0                	test   eax,eax
   25e7e:	0f 8e 81 44 00 00    	jle    2a305 <JS_CallInternal+0x7905>
   25e84:	f3 0f 6f 6b f0       	movdqu xmm5,XMMWORD PTR [rbx-0x10]
   25e89:	49 83 c4 01          	add    r12,0x1
   25e8d:	48 83 eb 10          	sub    rbx,0x10
   25e91:	0f 11 6b f0          	movups XMMWORD PTR [rbx-0x10],xmm5
   25e95:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   25e9b:	49 89 c5             	mov    r13,rax
   25e9e:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25ea2:	ff e0                	jmp    rax
   25ea4:	f3 0f 1e fa          	endbr64
   25ea8:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   25eac:	48 83 eb 10          	sub    rbx,0x10
   25eb0:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
   25eb3:	83 fa f6             	cmp    edx,0xfffffff6
   25eb6:	76 11                	jbe    25ec9 <JS_CallInternal+0x34c9>
   25eb8:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   25ebb:	83 e8 01             	sub    eax,0x1
   25ebe:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   25ec1:	85 c0                	test   eax,eax
   25ec3:	0f 8e 66 44 00 00    	jle    2a32f <JS_CallInternal+0x792f>
   25ec9:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25ece:	49 83 c4 01          	add    r12,0x1
   25ed2:	49 89 c5             	mov    r13,rax
   25ed5:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25ed9:	ff e0                	jmp    rax
   25edb:	f3 0f 1e fa          	endbr64
   25edf:	8b 8d bc fe ff ff    	mov    ecx,DWORD PTR [rbp-0x144]
   25ee5:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   25eea:	4d 8d 6c 24 02       	lea    r13,[r12+0x2]
   25eef:	4c 8d 73 10          	lea    r14,[rbx+0x10]
   25ef3:	48 8b bd a8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x158]
   25efa:	39 c8                	cmp    eax,ecx
   25efc:	0f 4f c1             	cmovg  eax,ecx
   25eff:	48 63 d0             	movsxd rdx,eax
   25f02:	29 c1                	sub    ecx,eax
   25f04:	48 c1 e2 04          	shl    rdx,0x4
   25f08:	89 ce                	mov    esi,ecx
   25f0a:	48 01 fa             	add    rdx,rdi
   25f0d:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   25f14:	e8 e7 36 02 00       	call   49600 <js_create_array>
   25f19:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
   25f1d:	83 7b 08 06          	cmp    DWORD PTR [rbx+0x8],0x6
   25f21:	48 89 03             	mov    QWORD PTR [rbx],rax
   25f24:	0f 84 f8 4f 00 00    	je     2af22 <JS_CallInternal+0x8522>
   25f2a:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
   25f30:	4c 89 f3             	mov    rbx,r14
   25f33:	49 83 c4 03          	add    r12,0x3
   25f37:	49 89 c5             	mov    r13,rax
   25f3a:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25f3e:	ff e0                	jmp    rax
   25f40:	f3 0f 1e fa          	endbr64
   25f44:	41 80 3c 24 06       	cmp    BYTE PTR [r12],0x6
   25f49:	4d 8d 74 24 01       	lea    r14,[r12+0x1]
   25f4e:	0f 87 70 c0 fe ff    	ja     11fc4 <JS_CallInternal.cold>
   25f54:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   25f59:	48 8d 15 18 01 0b 00 	lea    rdx,[rip+0xb0118]        # d6078 <qjsc_repl_size+0x46c>
   25f60:	48 63 04 82          	movsxd rax,DWORD PTR [rdx+rax*4]
   25f64:	48 01 d0             	add    rax,rdx
   25f67:	3e ff e0             	notrack jmp rax
   25f6a:	31 f6                	xor    esi,esi
   25f6c:	b9 01 00 00 00       	mov    ecx,0x1
   25f71:	4c 8d 6b 10          	lea    r13,[rbx+0x10]
   25f75:	ba 02 00 00 00       	mov    edx,0x2
   25f7a:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   25f81:	e8 1a 03 02 00       	call   462a0 <JS_NewObjectProtoClass>
   25f86:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
   25f8a:	83 7b 08 06          	cmp    DWORD PTR [rbx+0x8],0x6
   25f8e:	48 89 03             	mov    QWORD PTR [rbx],rax
   25f91:	0f 84 e9 00 00 00    	je     26080 <JS_CallInternal+0x3680>
   25f97:	4c 89 eb             	mov    rbx,r13
   25f9a:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
   25fa0:	49 83 c4 02          	add    r12,0x2
   25fa4:	49 89 c5             	mov    r13,rax
   25fa7:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   25fab:	ff e0                	jmp    rax
   25fad:	48 8b 85 60 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1a0]
   25fb4:	48 8d 53 10          	lea    rdx,[rbx+0x10]
   25fb8:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
   25fbc:	48 85 c0             	test   rax,rax
   25fbf:	0f 84 71 64 00 00    	je     2c436 <JS_CallInternal+0x9a36>
   25fc5:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
   25fc9:	48 89 03             	mov    QWORD PTR [rbx],rax
   25fcc:	48 c7 43 08 ff ff ff 	mov    QWORD PTR [rbx+0x8],0xffffffffffffffff
   25fd3:	ff 
   25fd4:	48 89 d3             	mov    rbx,rdx
   25fd7:	eb c1                	jmp    25f9a <JS_CallInternal+0x359a>
   25fd9:	83 bd 80 fe ff ff f6 	cmp    DWORD PTR [rbp-0x180],0xfffffff6
   25fe0:	48 8d 43 10          	lea    rax,[rbx+0x10]
   25fe4:	76 0b                	jbe    25ff1 <JS_CallInternal+0x35f1>
   25fe6:	48 8b 8d 70 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x190]
   25fed:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
   25ff1:	48 8b 8d 70 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x190]
   25ff8:	48 89 0b             	mov    QWORD PTR [rbx],rcx
   25ffb:	48 8b 8d 80 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x180]
   26002:	48 89 4b 08          	mov    QWORD PTR [rbx+0x8],rcx
   26006:	48 89 c3             	mov    rbx,rax
   26009:	eb 8f                	jmp    25f9a <JS_CallInternal+0x359a>
   2600b:	48 8b bd c8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x138]
   26012:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   26016:	48 8b 57 10          	mov    rdx,QWORD PTR [rdi+0x10]
   2601a:	48 8b 47 08          	mov    rax,QWORD PTR [rdi+0x8]
   2601e:	83 fa f6             	cmp    edx,0xfffffff6
   26021:	76 04                	jbe    26027 <JS_CallInternal+0x3627>
   26023:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
   26027:	48 89 03             	mov    QWORD PTR [rbx],rax
   2602a:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
   2602e:	48 89 cb             	mov    rbx,rcx
   26031:	e9 64 ff ff ff       	jmp    25f9a <JS_CallInternal+0x359a>
   26036:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
   2603d:	48 8b 8d c8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x138]
   26044:	4c 8d 6b 10          	lea    r13,[rbx+0x10]
   26048:	48 8b 95 a8 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x158]
   2604f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   26056:	44 0f b7 40 38       	movzx  r8d,WORD PTR [rax+0x38]
   2605b:	8b 85 bc fe ff ff    	mov    eax,DWORD PTR [rbp-0x144]
   26061:	41 39 c0             	cmp    r8d,eax
   26064:	89 c6                	mov    esi,eax
   26066:	44 0f 4f c0          	cmovg  r8d,eax
   2606a:	e8 61 54 02 00       	call   4b4d0 <js_build_mapped_arguments>
   2606f:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
   26073:	83 7b 08 06          	cmp    DWORD PTR [rbx+0x8],0x6
   26077:	48 89 03             	mov    QWORD PTR [rbx],rax
   2607a:	0f 85 17 ff ff ff    	jne    25f97 <JS_CallInternal+0x3597>
   26080:	4c 89 eb             	mov    rbx,r13
   26083:	4d 89 f4             	mov    r12,r14
   26086:	e9 15 d1 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2608b:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   26092:	31 f6                	xor    esi,esi
   26094:	4c 8d 6b 10          	lea    r13,[rbx+0x10]
   26098:	e8 13 c8 ff ff       	call   228b0 <JS_GetScriptOrModuleName>
   2609d:	85 c0                	test   eax,eax
   2609f:	0f 84 66 57 00 00    	je     2b80b <JS_CallInternal+0x8e0b>
   260a5:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   260ac:	48 8b 91 b8 01 00 00 	mov    rdx,QWORD PTR [rcx+0x1b8]
   260b3:	48 81 c1 b0 01 00 00 	add    rcx,0x1b0
   260ba:	48 39 d1             	cmp    rcx,rdx
   260bd:	75 16                	jne    260d5 <JS_CallInternal+0x36d5>
   260bf:	e9 b6 66 00 00       	jmp    2c77a <JS_CallInternal+0x9d7a>
   260c4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   260c8:	48 8b 52 08          	mov    rdx,QWORD PTR [rdx+0x8]
   260cc:	48 39 d1             	cmp    rcx,rdx
   260cf:	0f 84 ec 56 00 00    	je     2b7c1 <JS_CallInternal+0x8dc1>
   260d5:	3b 42 f8             	cmp    eax,DWORD PTR [rdx-0x8]
   260d8:	75 ee                	jne    260c8 <JS_CallInternal+0x36c8>
   260da:	48 83 ea 18          	sub    rdx,0x18
   260de:	3d f2 00 00 00       	cmp    eax,0xf2
   260e3:	0f 8f e1 56 00 00    	jg     2b7ca <JS_CallInternal+0x8dca>
   260e9:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   260f0:	48 89 d6             	mov    rsi,rdx
   260f3:	e8 88 c8 ff ff       	call   22980 <JS_GetImportMeta>
   260f8:	48 89 03             	mov    QWORD PTR [rbx],rax
   260fb:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
   260ff:	83 fa 06             	cmp    edx,0x6
   26102:	0f 85 8f fe ff ff    	jne    25f97 <JS_CallInternal+0x3597>
   26108:	e9 73 ff ff ff       	jmp    26080 <JS_CallInternal+0x3680>
   2610d:	0f 1f 00             	nop    DWORD PTR [rax]
   26110:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   26117:	8b 85 bc fe ff ff    	mov    eax,DWORD PTR [rbp-0x144]
   2611d:	4c 8d 6b 10          	lea    r13,[rbx+0x10]
   26121:	48 c7 85 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],0x0
   26128:	00 00 00 00 
   2612c:	48 8b 91 58 01 00 00 	mov    rdx,QWORD PTR [rcx+0x158]
   26133:	48 89 85 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],rax
   2613a:	48 8b 81 50 01 00 00 	mov    rax,QWORD PTR [rcx+0x150]
   26141:	83 fa f6             	cmp    edx,0xfffffff6
   26144:	76 04                	jbe    2614a <JS_CallInternal+0x374a>
   26146:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
   2614a:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   26151:	48 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rax
   26158:	48 89 95 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rdx
   2615f:	48 8b 81 60 01 00 00 	mov    rax,QWORD PTR [rcx+0x160]
   26166:	83 b9 68 01 00 00 f6 	cmp    DWORD PTR [rcx+0x168],0xfffffff6
   2616d:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
   26174:	76 04                	jbe    2617a <JS_CallInternal+0x377a>
   26176:	83 40 fc 02          	add    DWORD PTR [rax-0x4],0x2
   2617a:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   26181:	48 8d 8d 50 ff ff ff 	lea    rcx,[rbp-0xb0]
   26188:	ba 08 00 00 00       	mov    edx,0x8
   2618d:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
   26194:	48 8b 77 38          	mov    rsi,QWORD PTR [rdi+0x38]
   26198:	83 46 fc 01          	add    DWORD PTR [rsi-0x4],0x1
   2619c:	e8 7f fb 01 00       	call   45d20 <JS_NewObjectFromShape>
   261a1:	49 89 c1             	mov    r9,rax
   261a4:	48 89 d1             	mov    rcx,rdx
   261a7:	83 fa 06             	cmp    edx,0x6
   261aa:	0f 84 44 61 00 00    	je     2c2f4 <JS_CallInternal+0x98f4>
   261b0:	8b bd bc fe ff ff    	mov    edi,DWORD PTR [rbp-0x144]
   261b6:	31 c0                	xor    eax,eax
   261b8:	85 ff                	test   edi,edi
   261ba:	0f 8f 08 58 00 00    	jg     2b9c8 <JS_CallInternal+0x8fc8>
   261c0:	49 89 41 30          	mov    QWORD PTR [r9+0x30],rax
   261c4:	8b 85 bc fe ff ff    	mov    eax,DWORD PTR [rbp-0x144]
   261ca:	41 89 41 38          	mov    DWORD PTR [r9+0x38],eax
   261ce:	4c 89 0b             	mov    QWORD PTR [rbx],r9
   261d1:	48 89 4b 08          	mov    QWORD PTR [rbx+0x8],rcx
   261d5:	4c 89 eb             	mov    rbx,r13
   261d8:	e9 bd fd ff ff       	jmp    25f9a <JS_CallInternal+0x359a>
   261dd:	f3 0f 1e fa          	endbr64
   261e1:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   261e5:	0b 53 e8             	or     edx,DWORD PTR [rbx-0x18]
   261e8:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
   261ec:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   261f0:	0f 85 58 4e 00 00    	jne    2b04e <JS_CallInternal+0x864e>
   261f6:	31 c8                	xor    eax,ecx
   261f8:	48 c7 43 e8 00 00 00 	mov    QWORD PTR [rbx-0x18],0x0
   261ff:	00 
   26200:	48 83 eb 10          	sub    rbx,0x10
   26204:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   26208:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   2620d:	49 83 c4 01          	add    r12,0x1
   26211:	49 89 c5             	mov    r13,rax
   26214:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26218:	ff e0                	jmp    rax
   2621a:	f3 0f 1e fa          	endbr64
   2621e:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   26222:	0b 53 e8             	or     edx,DWORD PTR [rbx-0x18]
   26225:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
   26229:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   2622d:	0f 85 fc 51 00 00    	jne    2b42f <JS_CallInternal+0x8a2f>
   26233:	09 c8                	or     eax,ecx
   26235:	48 c7 43 e8 00 00 00 	mov    QWORD PTR [rbx-0x18],0x0
   2623c:	00 
   2623d:	48 83 eb 10          	sub    rbx,0x10
   26241:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   26245:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   2624a:	49 83 c4 01          	add    r12,0x1
   2624e:	49 89 c5             	mov    r13,rax
   26251:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26255:	ff e0                	jmp    rax
   26257:	f3 0f 1e fa          	endbr64
   2625b:	e9 66 cb ff ff       	jmp    22dc6 <JS_CallInternal+0x3c6>
   26260:	f3 0f 1e fa          	endbr64
   26264:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   26268:	0b 43 e8             	or     eax,DWORD PTR [rbx-0x18]
   2626b:	48 8b 4b e0          	mov    rcx,QWORD PTR [rbx-0x20]
   2626f:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   26273:	75 39                	jne    262ae <JS_CallInternal+0x38ae>
   26275:	89 c8                	mov    eax,ecx
   26277:	89 d6                	mov    esi,edx
   26279:	85 c9                	test   ecx,ecx
   2627b:	78 31                	js     262ae <JS_CallInternal+0x38ae>
   2627d:	85 d2                	test   edx,edx
   2627f:	7e 2d                	jle    262ae <JS_CallInternal+0x38ae>
   26281:	99                   	cdq
   26282:	48 c7 43 e8 00 00 00 	mov    QWORD PTR [rbx-0x18],0x0
   26289:	00 
   2628a:	49 83 c4 01          	add    r12,0x1
   2628e:	48 83 eb 10          	sub    rbx,0x10
   26292:	f7 fe                	idiv   esi
   26294:	48 63 d2             	movsxd rdx,edx
   26297:	48 89 53 f0          	mov    QWORD PTR [rbx-0x10],rdx
   2629b:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   262a1:	49 89 c5             	mov    r13,rax
   262a4:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   262a8:	ff e0                	jmp    rax
   262aa:	f3 0f 1e fa          	endbr64
   262ae:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   262b5:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   262bc:	44 89 ea             	mov    edx,r13d
   262bf:	48 89 de             	mov    rsi,rbx
   262c2:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   262c6:	e8 05 dc 02 00       	call   53ed0 <js_binary_arith_slow>
   262cb:	85 c0                	test   eax,eax
   262cd:	0f 85 cd ce ff ff    	jne    231a0 <JS_CallInternal+0x7a0>
   262d3:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   262d8:	48 83 eb 10          	sub    rbx,0x10
   262dc:	49 83 c4 01          	add    r12,0x1
   262e0:	49 89 c5             	mov    r13,rax
   262e3:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   262e7:	ff e0                	jmp    rax
   262e9:	f3 0f 1e fa          	endbr64
   262ed:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   262f1:	0b 43 e8             	or     eax,DWORD PTR [rbx-0x18]
   262f4:	48 8b 4b e0          	mov    rcx,QWORD PTR [rbx-0x20]
   262f8:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   262fc:	75 b0                	jne    262ae <JS_CallInternal+0x38ae>
   262fe:	66 0f ef c0          	pxor   xmm0,xmm0
   26302:	66 0f ef c9          	pxor   xmm1,xmm1
   26306:	f2 0f 2a c1          	cvtsi2sd xmm0,ecx
   2630a:	f2 0f 2a ca          	cvtsi2sd xmm1,edx
   2630e:	f2 0f 5e c1          	divsd  xmm0,xmm1
   26312:	66 0f 2f 05 2e c0 0a 	comisd xmm0,QWORD PTR [rip+0xac02e]        # d2348 <__PRETTY_FUNCTION__.0+0xc8>
   26319:	00 
   2631a:	66 48 0f 7e c0       	movq   rax,xmm0
   2631f:	0f 82 6c 2b 00 00    	jb     28e91 <JS_CallInternal+0x6491>
   26325:	f2 0f 10 0d 23 c0 0a 	movsd  xmm1,QWORD PTR [rip+0xac023]        # d2350 <__PRETTY_FUNCTION__.0+0xd0>
   2632c:	00 
   2632d:	66 0f 2f c8          	comisd xmm1,xmm0
   26331:	0f 82 5a 2b 00 00    	jb     28e91 <JS_CallInternal+0x6491>
   26337:	f2 0f 2c c8          	cvttsd2si ecx,xmm0
   2633b:	66 0f ef c9          	pxor   xmm1,xmm1
   2633f:	ba 08 00 00 00       	mov    edx,0x8
   26344:	f2 0f 2a c9          	cvtsi2sd xmm1,ecx
   26348:	66 48 0f 7e ce       	movq   rsi,xmm1
   2634d:	48 39 f0             	cmp    rax,rsi
   26350:	0f 84 16 58 00 00    	je     2bb6c <JS_CallInternal+0x916c>
   26356:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
   2635a:	49 83 c4 01          	add    r12,0x1
   2635e:	48 83 eb 10          	sub    rbx,0x10
   26362:	48 89 53 f8          	mov    QWORD PTR [rbx-0x8],rdx
   26366:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2636c:	49 89 c5             	mov    r13,rax
   2636f:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26373:	ff e0                	jmp    rax
   26375:	f3 0f 1e fa          	endbr64
   26379:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   2637d:	48 8b 73 e8          	mov    rsi,QWORD PTR [rbx-0x18]
   26381:	48 8b 4b e0          	mov    rcx,QWORD PTR [rbx-0x20]
   26385:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   26389:	89 c7                	mov    edi,eax
   2638b:	09 f7                	or     edi,esi
   2638d:	0f 85 05 4d 00 00    	jne    2b098 <JS_CallInternal+0x8698>
   26393:	48 63 f2             	movsxd rsi,edx
   26396:	48 63 c1             	movsxd rax,ecx
   26399:	48 0f af c6          	imul   rax,rsi
   2639d:	48 63 f0             	movsxd rsi,eax
   263a0:	48 39 c6             	cmp    rsi,rax
   263a3:	0f 85 d3 4c 00 00    	jne    2b07c <JS_CallInternal+0x867c>
   263a9:	48 85 f6             	test   rsi,rsi
   263ac:	0f 84 a0 53 00 00    	je     2b752 <JS_CallInternal+0x8d52>
   263b2:	83 e0 ff             	and    eax,0xffffffff
   263b5:	48 8d 53 f0          	lea    rdx,[rbx-0x10]
   263b9:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
   263bd:	31 c0                	xor    eax,eax
   263bf:	48 89 43 e8          	mov    QWORD PTR [rbx-0x18],rax
   263c3:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   263c8:	48 89 d3             	mov    rbx,rdx
   263cb:	49 83 c4 01          	add    r12,0x1
   263cf:	49 89 c5             	mov    r13,rax
   263d2:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   263d6:	ff e0                	jmp    rax
   263d8:	f3 0f 1e fa          	endbr64
   263dc:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   263e0:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   263e4:	48 8b 7b e0          	mov    rdi,QWORD PTR [rbx-0x20]
   263e8:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   263ec:	89 c6                	mov    esi,eax
   263ee:	09 d6                	or     esi,edx
   263f0:	0f 85 ee 4a 00 00    	jne    2aee4 <JS_CallInternal+0x84e4>
   263f6:	89 fa                	mov    edx,edi
   263f8:	48 63 f1             	movsxd rsi,ecx
   263fb:	48 63 c7             	movsxd rax,edi
   263fe:	29 ca                	sub    edx,ecx
   26400:	48 29 f0             	sub    rax,rsi
   26403:	48 63 ca             	movsxd rcx,edx
   26406:	48 39 c1             	cmp    rcx,rax
   26409:	0f 85 b2 4a 00 00    	jne    2aec1 <JS_CallInternal+0x84c1>
   2640f:	89 d0                	mov    eax,edx
   26411:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
   26415:	31 c0                	xor    eax,eax
   26417:	48 8d 53 f0          	lea    rdx,[rbx-0x10]
   2641b:	48 89 43 e8          	mov    QWORD PTR [rbx-0x18],rax
   2641f:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   26424:	48 89 d3             	mov    rbx,rdx
   26427:	49 83 c4 01          	add    r12,0x1
   2642b:	49 89 c5             	mov    r13,rax
   2642e:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26432:	ff e0                	jmp    rax
   26434:	f3 0f 1e fa          	endbr64
   26438:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   2643d:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   26444:	4d 8d 6c 24 01       	lea    r13,[r12+0x1]
   26449:	48 c1 e0 04          	shl    rax,0x4
   2644d:	48 03 41 50          	add    rax,QWORD PTR [rcx+0x50]
   26451:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   26455:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   26458:	83 fa f6             	cmp    edx,0xfffffff6
   2645b:	76 04                	jbe    26461 <JS_CallInternal+0x3a61>
   2645d:	83 46 fc 01          	add    DWORD PTR [rsi-0x4],0x1
   26461:	4c 8b 85 c8 fe ff ff 	mov    r8,QWORD PTR [rbp-0x138]
   26468:	48 8b 8d 98 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x168]
   2646f:	45 31 c9             	xor    r9d,r9d
   26472:	4c 8d 73 10          	lea    r14,[rbx+0x10]
   26476:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2647d:	e8 be 5c 02 00       	call   4c140 <js_closure>
   26482:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
   26486:	83 7b 08 06          	cmp    DWORD PTR [rbx+0x8],0x6
   2648a:	48 89 03             	mov    QWORD PTR [rbx],rax
   2648d:	0f 84 4b 50 00 00    	je     2b4de <JS_CallInternal+0x8ade>
   26493:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
   26499:	4c 89 f3             	mov    rbx,r14
   2649c:	49 83 c4 02          	add    r12,0x2
   264a0:	49 89 c5             	mov    r13,rax
   264a3:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   264a7:	ff e0                	jmp    rax
   264a9:	f3 0f 1e fa          	endbr64
   264ad:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   264b4:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   264b9:	48 c1 e0 04          	shl    rax,0x4
   264bd:	48 03 41 50          	add    rax,QWORD PTR [rcx+0x50]
   264c1:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   264c5:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   264c8:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   264cc:	83 f8 f6             	cmp    eax,0xfffffff6
   264cf:	76 04                	jbe    264d5 <JS_CallInternal+0x3ad5>
   264d1:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   264d5:	48 89 13             	mov    QWORD PTR [rbx],rdx
   264d8:	49 83 c4 02          	add    r12,0x2
   264dc:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
   264e0:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   264e6:	48 89 cb             	mov    rbx,rcx
   264e9:	49 89 c5             	mov    r13,rax
   264ec:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   264f0:	ff e0                	jmp    rax
   264f2:	f3 0f 1e fa          	endbr64
   264f6:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
   264fa:	48 8b 73 e8          	mov    rsi,QWORD PTR [rbx-0x18]
   264fe:	48 8b 53 e0          	mov    rdx,QWORD PTR [rbx-0x20]
   26502:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
   26506:	89 cf                	mov    edi,ecx
   26508:	09 f7                	or     edi,esi
   2650a:	0f 85 d9 4f 00 00    	jne    2b4e9 <JS_CallInternal+0x8ae9>
   26510:	39 c2                	cmp    edx,eax
   26512:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   26519:	00 
   2651a:	0f 9d c0             	setge  al
   2651d:	48 83 eb 10          	sub    rbx,0x10
   26521:	0f b6 c0             	movzx  eax,al
   26524:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   26528:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   2652d:	49 83 c4 01          	add    r12,0x1
   26531:	49 89 c5             	mov    r13,rax
   26534:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26538:	ff e0                	jmp    rax
   2653a:	f3 0f 1e fa          	endbr64
   2653e:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
   26542:	48 8b 73 e8          	mov    rsi,QWORD PTR [rbx-0x18]
   26546:	48 8b 53 e0          	mov    rdx,QWORD PTR [rbx-0x20]
   2654a:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
   2654e:	89 cf                	mov    edi,ecx
   26550:	09 f7                	or     edi,esi
   26552:	0f 85 c2 45 00 00    	jne    2ab1a <JS_CallInternal+0x811a>
   26558:	39 c2                	cmp    edx,eax
   2655a:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   26561:	00 
   26562:	0f 9f c0             	setg   al
   26565:	48 83 eb 10          	sub    rbx,0x10
   26569:	0f b6 c0             	movzx  eax,al
   2656c:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   26570:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   26575:	49 83 c4 01          	add    r12,0x1
   26579:	49 89 c5             	mov    r13,rax
   2657c:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26580:	ff e0                	jmp    rax
   26582:	f3 0f 1e fa          	endbr64
   26586:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2658d:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   26591:	48 83 eb 10          	sub    rbx,0x10
   26595:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
   26599:	e8 92 bc ff ff       	call   22230 <JS_Throw>
   2659e:	e9 fd cb ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   265a3:	f3 0f 1e fa          	endbr64
   265a7:	49 63 04 24          	movsxd rax,DWORD PTR [r12]
   265ab:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   265b2:	49 8d 54 24 04       	lea    rdx,[r12+0x4]
   265b7:	48 83 c3 10          	add    rbx,0x10
   265bb:	2b 51 18             	sub    edx,DWORD PTR [rcx+0x18]
   265be:	4c 01 e0             	add    rax,r12
   265c1:	48 c7 43 f8 00 00 00 	mov    QWORD PTR [rbx-0x8],0x0
   265c8:	00 
   265c9:	48 89 53 f0          	mov    QWORD PTR [rbx-0x10],rdx
   265cd:	4c 8d 60 01          	lea    r12,[rax+0x1]
   265d1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   265d4:	49 89 c5             	mov    r13,rax
   265d7:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   265db:	f3 0f 1e fa          	endbr64
   265df:	49 63 04 24          	movsxd rax,DWORD PTR [r12]
   265e3:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   265ea:	48 83 c3 10          	add    rbx,0x10
   265ee:	4c 01 e0             	add    rax,r12
   265f1:	2b 41 18             	sub    eax,DWORD PTR [rcx+0x18]
   265f4:	48 c7 43 f8 05 00 00 	mov    QWORD PTR [rbx-0x8],0x5
   265fb:	00 
   265fc:	49 83 c4 05          	add    r12,0x5
   26600:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   26604:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2660a:	49 89 c5             	mov    r13,rax
   2660d:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26611:	ff e0                	jmp    rax
   26613:	f3 0f 1e fa          	endbr64
   26617:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   2661b:	83 7b f8 03          	cmp    DWORD PTR [rbx-0x8],0x3
   2661f:	4d 8d 6c 24 01       	lea    r13,[r12+0x1]
   26624:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   26628:	48 89 c8             	mov    rax,rcx
   2662b:	0f 87 db 32 00 00    	ja     2990c <JS_CallInternal+0x6f0c>
   26631:	48 83 eb 10          	sub    rbx,0x10
   26635:	85 c0                	test   eax,eax
   26637:	75 0d                	jne    26646 <JS_CallInternal+0x3c46>
   26639:	41 0f be 04 24       	movsx  eax,BYTE PTR [r12]
   2663e:	83 e8 01             	sub    eax,0x1
   26641:	48 98                	cdqe
   26643:	49 01 c5             	add    r13,rax
   26646:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   2664d:	8b 81 a8 01 00 00    	mov    eax,DWORD PTR [rcx+0x1a8]
   26653:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   26659:	83 e8 01             	sub    eax,0x1
   2665c:	89 81 a8 01 00 00    	mov    DWORD PTR [rcx+0x1a8],eax
   26662:	85 c0                	test   eax,eax
   26664:	0f 8e c4 4b 00 00    	jle    2b22e <JS_CallInternal+0x882e>
   2666a:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
   2666f:	4d 8d 65 01          	lea    r12,[r13+0x1]
   26673:	49 89 c5             	mov    r13,rax
   26676:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   2667a:	f3 0f 1e fa          	endbr64
   2667e:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   26682:	83 7b f8 03          	cmp    DWORD PTR [rbx-0x8],0x3
   26686:	4d 8d 6c 24 01       	lea    r13,[r12+0x1]
   2668b:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   2668f:	48 89 c8             	mov    rax,rcx
   26692:	0f 87 60 32 00 00    	ja     298f8 <JS_CallInternal+0x6ef8>
   26698:	48 83 eb 10          	sub    rbx,0x10
   2669c:	85 c0                	test   eax,eax
   2669e:	74 0d                	je     266ad <JS_CallInternal+0x3cad>
   266a0:	41 0f be 04 24       	movsx  eax,BYTE PTR [r12]
   266a5:	83 e8 01             	sub    eax,0x1
   266a8:	48 98                	cdqe
   266aa:	49 01 c5             	add    r13,rax
   266ad:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   266b4:	8b 81 a8 01 00 00    	mov    eax,DWORD PTR [rcx+0x1a8]
   266ba:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   266c0:	83 e8 01             	sub    eax,0x1
   266c3:	89 81 a8 01 00 00    	mov    DWORD PTR [rcx+0x1a8],eax
   266c9:	85 c0                	test   eax,eax
   266cb:	0f 8e c2 4e 00 00    	jle    2b593 <JS_CallInternal+0x8b93>
   266d1:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
   266d6:	4d 8d 65 01          	lea    r12,[r13+0x1]
   266da:	49 89 c5             	mov    r13,rax
   266dd:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   266e1:	f3 0f 1e fa          	endbr64
   266e5:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   266e9:	83 7b f8 03          	cmp    DWORD PTR [rbx-0x8],0x3
   266ed:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
   266f2:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   266f6:	48 89 c8             	mov    rax,rcx
   266f9:	0f 87 e5 31 00 00    	ja     298e4 <JS_CallInternal+0x6ee4>
   266ff:	48 83 eb 10          	sub    rbx,0x10
   26703:	85 c0                	test   eax,eax
   26705:	75 0c                	jne    26713 <JS_CallInternal+0x3d13>
   26707:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   2670b:	83 e8 04             	sub    eax,0x4
   2670e:	48 98                	cdqe
   26710:	49 01 c5             	add    r13,rax
   26713:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   2671a:	8b 81 a8 01 00 00    	mov    eax,DWORD PTR [rcx+0x1a8]
   26720:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   26726:	83 e8 01             	sub    eax,0x1
   26729:	89 81 a8 01 00 00    	mov    DWORD PTR [rcx+0x1a8],eax
   2672f:	85 c0                	test   eax,eax
   26731:	0f 8e 94 4e 00 00    	jle    2b5cb <JS_CallInternal+0x8bcb>
   26737:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
   2673c:	4d 8d 65 01          	lea    r12,[r13+0x1]
   26740:	49 89 c5             	mov    r13,rax
   26743:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   26747:	f3 0f 1e fa          	endbr64
   2674b:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   26752:	4d 0f be 2c 24       	movsx  r13,BYTE PTR [r12]
   26757:	8b 81 a8 01 00 00    	mov    eax,DWORD PTR [rcx+0x1a8]
   2675d:	4d 01 e5             	add    r13,r12
   26760:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   26766:	83 e8 01             	sub    eax,0x1
   26769:	89 81 a8 01 00 00    	mov    DWORD PTR [rcx+0x1a8],eax
   2676f:	85 c0                	test   eax,eax
   26771:	0f 8e 38 4e 00 00    	jle    2b5af <JS_CallInternal+0x8baf>
   26777:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
   2677c:	4d 8d 65 01          	lea    r12,[r13+0x1]
   26780:	49 89 c5             	mov    r13,rax
   26783:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   26787:	f3 0f 1e fa          	endbr64
   2678b:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   2678f:	83 7b f8 03          	cmp    DWORD PTR [rbx-0x8],0x3
   26793:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
   26798:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   2679c:	48 89 c8             	mov    rax,rcx
   2679f:	0f 87 2b 31 00 00    	ja     298d0 <JS_CallInternal+0x6ed0>
   267a5:	48 83 eb 10          	sub    rbx,0x10
   267a9:	85 c0                	test   eax,eax
   267ab:	74 0c                	je     267b9 <JS_CallInternal+0x3db9>
   267ad:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   267b1:	83 e8 04             	sub    eax,0x4
   267b4:	48 98                	cdqe
   267b6:	49 01 c5             	add    r13,rax
   267b9:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   267c0:	8b 81 a8 01 00 00    	mov    eax,DWORD PTR [rcx+0x1a8]
   267c6:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   267cc:	83 e8 01             	sub    eax,0x1
   267cf:	89 81 a8 01 00 00    	mov    DWORD PTR [rcx+0x1a8],eax
   267d5:	85 c0                	test   eax,eax
   267d7:	0f 8e 0a 4e 00 00    	jle    2b5e7 <JS_CallInternal+0x8be7>
   267dd:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
   267e2:	4d 8d 65 01          	lea    r12,[r13+0x1]
   267e6:	49 89 c5             	mov    r13,rax
   267e9:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   267ed:	f3 0f 1e fa          	endbr64
   267f1:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   267f8:	4d 0f bf 2c 24       	movsx  r13,WORD PTR [r12]
   267fd:	8b 81 a8 01 00 00    	mov    eax,DWORD PTR [rcx+0x1a8]
   26803:	4d 01 e5             	add    r13,r12
   26806:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   2680c:	83 e8 01             	sub    eax,0x1
   2680f:	89 81 a8 01 00 00    	mov    DWORD PTR [rcx+0x1a8],eax
   26815:	85 c0                	test   eax,eax
   26817:	0f 8e 2c 4d 00 00    	jle    2b549 <JS_CallInternal+0x8b49>
   2681d:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
   26822:	4d 8d 65 01          	lea    r12,[r13+0x1]
   26826:	49 89 c5             	mov    r13,rax
   26829:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   2682d:	f3 0f 1e fa          	endbr64
   26831:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   26838:	4d 63 2c 24          	movsxd r13,DWORD PTR [r12]
   2683c:	8b 81 a8 01 00 00    	mov    eax,DWORD PTR [rcx+0x1a8]
   26842:	4d 01 e5             	add    r13,r12
   26845:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   2684b:	83 e8 01             	sub    eax,0x1
   2684e:	89 81 a8 01 00 00    	mov    DWORD PTR [rcx+0x1a8],eax
   26854:	85 c0                	test   eax,eax
   26856:	0f 8e d1 4c 00 00    	jle    2b52d <JS_CallInternal+0x8b2d>
   2685c:	41 0f b6 45 00       	movzx  eax,BYTE PTR [r13+0x0]
   26861:	4d 8d 65 01          	lea    r12,[r13+0x1]
   26865:	49 89 c5             	mov    r13,rax
   26868:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   2686c:	f3 0f 1e fa          	endbr64
   26870:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   26877:	b9 01 00 00 00       	mov    ecx,0x1
   2687c:	4c 8d 73 10          	lea    r14,[rbx+0x10]
   26880:	48 8b 47 58          	mov    rax,QWORD PTR [rdi+0x58]
   26884:	48 8b 70 10          	mov    rsi,QWORD PTR [rax+0x10]
   26888:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
   2688c:	e8 0f fa 01 00       	call   462a0 <JS_NewObjectProtoClass>
   26891:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
   26895:	83 7b 08 06          	cmp    DWORD PTR [rbx+0x8],0x6
   26899:	48 89 03             	mov    QWORD PTR [rbx],rax
   2689c:	0f 84 d0 3f 00 00    	je     2a872 <JS_CallInternal+0x7e72>
   268a2:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   268a7:	4c 89 f3             	mov    rbx,r14
   268aa:	49 83 c4 01          	add    r12,0x1
   268ae:	49 89 c5             	mov    r13,rax
   268b1:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   268b5:	ff e0                	jmp    rax
   268b7:	f3 0f 1e fa          	endbr64
   268bb:	45 0f b6 2c 24       	movzx  r13d,BYTE PTR [r12]
   268c0:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   268c7:	4d 8d 74 24 01       	lea    r14,[r12+0x1]
   268cc:	49 c1 e5 04          	shl    r13,0x4
   268d0:	49 01 c5             	add    r13,rax
   268d3:	f3 41 0f 6f 55 00    	movdqu xmm2,XMMWORD PTR [r13+0x0]
   268d9:	0f 29 95 f0 fe ff ff 	movaps XMMWORD PTR [rbp-0x110],xmm2
   268e0:	48 8b 95 f8 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x108]
   268e7:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
   268ee:	85 d2                	test   edx,edx
   268f0:	0f 85 5e 27 00 00    	jne    29054 <JS_CallInternal+0x6654>
   268f6:	3d ff ff ff 7f       	cmp    eax,0x7fffffff
   268fb:	0f 84 53 27 00 00    	je     29054 <JS_CallInternal+0x6654>
   26901:	83 c0 01             	add    eax,0x1
   26904:	49 c7 45 08 00 00 00 	mov    QWORD PTR [r13+0x8],0x0
   2690b:	00 
   2690c:	49 89 45 00          	mov    QWORD PTR [r13+0x0],rax
   26910:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
   26916:	49 83 c4 02          	add    r12,0x2
   2691a:	49 89 c5             	mov    r13,rax
   2691d:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26921:	ff e0                	jmp    rax
   26923:	f3 0f 1e fa          	endbr64
   26927:	f3 0f 6f 43 b0       	movdqu xmm0,XMMWORD PTR [rbx-0x50]
   2692c:	f3 0f 6f 7b c0       	movdqu xmm7,XMMWORD PTR [rbx-0x40]
   26931:	49 83 c4 01          	add    r12,0x1
   26935:	f3 0f 6f 5b d0       	movdqu xmm3,XMMWORD PTR [rbx-0x30]
   2693a:	f3 0f 6f 4b e0       	movdqu xmm1,XMMWORD PTR [rbx-0x20]
   2693f:	f3 0f 6f 63 f0       	movdqu xmm4,XMMWORD PTR [rbx-0x10]
   26944:	0f 11 7b b0          	movups XMMWORD PTR [rbx-0x50],xmm7
   26948:	0f 11 5b c0          	movups XMMWORD PTR [rbx-0x40],xmm3
   2694c:	0f 11 4b d0          	movups XMMWORD PTR [rbx-0x30],xmm1
   26950:	0f 11 63 e0          	movups XMMWORD PTR [rbx-0x20],xmm4
   26954:	0f 11 43 f0          	movups XMMWORD PTR [rbx-0x10],xmm0
   26958:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2695e:	49 89 c5             	mov    r13,rax
   26961:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26965:	ff e0                	jmp    rax
   26967:	f3 0f 1e fa          	endbr64
   2696b:	41 8b 0c 24          	mov    ecx,DWORD PTR [r12]
   2696f:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   26973:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
   26978:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   2697c:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   26983:	e8 38 d6 00 00       	call   33fc0 <JS_DefineObjectName.constprop.0>
   26988:	85 c0                	test   eax,eax
   2698a:	0f 88 96 48 00 00    	js     2b226 <JS_CallInternal+0x8826>
   26990:	41 0f b6 44 24 04    	movzx  eax,BYTE PTR [r12+0x4]
   26996:	49 83 c4 05          	add    r12,0x5
   2699a:	49 89 c5             	mov    r13,rax
   2699d:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   269a1:	ff e0                	jmp    rax
   269a3:	f3 0f 1e fa          	endbr64
   269a7:	48 83 ec 08          	sub    rsp,0x8
   269ab:	41 8b 0c 24          	mov    ecx,DWORD PTR [r12]
   269af:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   269b3:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
   269b7:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   269bb:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   269bf:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
   269c4:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   269c8:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   269cf:	68 07 40 00 00       	push   0x4007
   269d4:	e8 57 8e 00 00       	call   2f830 <JS_DefinePropertyValue>
   269d9:	59                   	pop    rcx
   269da:	5e                   	pop    rsi
   269db:	85 c0                	test   eax,eax
   269dd:	0f 88 f6 44 00 00    	js     2aed9 <JS_CallInternal+0x84d9>
   269e3:	41 0f b6 44 24 04    	movzx  eax,BYTE PTR [r12+0x4]
   269e9:	4c 89 f3             	mov    rbx,r14
   269ec:	49 83 c4 05          	add    r12,0x5
   269f0:	49 89 c5             	mov    r13,rax
   269f3:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   269f7:	ff e0                	jmp    rax
   269f9:	f3 0f 1e fa          	endbr64
   269fd:	e9 e6 c2 ff ff       	jmp    22ce8 <JS_CallInternal+0x2e8>
   26a02:	f3 0f 1e fa          	endbr64
   26a06:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
   26a0a:	48 8b 73 e8          	mov    rsi,QWORD PTR [rbx-0x18]
   26a0e:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
   26a12:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   26a16:	89 cf                	mov    edi,ecx
   26a18:	09 f7                	or     edi,esi
   26a1a:	0f 85 7a 4a 00 00    	jne    2b49a <JS_CallInternal+0x8a9a>
   26a20:	39 d0                	cmp    eax,edx
   26a22:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   26a29:	00 
   26a2a:	0f 9e c0             	setle  al
   26a2d:	48 83 eb 10          	sub    rbx,0x10
   26a31:	0f b6 c0             	movzx  eax,al
   26a34:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   26a38:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   26a3d:	49 83 c4 01          	add    r12,0x1
   26a41:	49 89 c5             	mov    r13,rax
   26a44:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26a48:	ff e0                	jmp    rax
   26a4a:	f3 0f 1e fa          	endbr64
   26a4e:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
   26a52:	48 8b 73 e8          	mov    rsi,QWORD PTR [rbx-0x18]
   26a56:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
   26a5a:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   26a5e:	89 cf                	mov    edi,ecx
   26a60:	09 f7                	or     edi,esi
   26a62:	0f 85 f3 44 00 00    	jne    2af5b <JS_CallInternal+0x855b>
   26a68:	39 d0                	cmp    eax,edx
   26a6a:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   26a71:	00 
   26a72:	0f 9c c0             	setl   al
   26a75:	48 83 eb 10          	sub    rbx,0x10
   26a79:	0f b6 c0             	movzx  eax,al
   26a7c:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   26a80:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   26a85:	49 83 c4 01          	add    r12,0x1
   26a89:	49 89 c5             	mov    r13,rax
   26a8c:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26a90:	ff e0                	jmp    rax
   26a92:	f3 0f 1e fa          	endbr64
   26a96:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   26a9a:	0b 53 e8             	or     edx,DWORD PTR [rbx-0x18]
   26a9d:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
   26aa1:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   26aa5:	0f 85 0d 43 00 00    	jne    2adb8 <JS_CallInternal+0x83b8>
   26aab:	d3 e8                	shr    eax,cl
   26aad:	85 c0                	test   eax,eax
   26aaf:	0f 88 2b 2a 00 00    	js     294e0 <JS_CallInternal+0x6ae0>
   26ab5:	66 0f 6e c0          	movd   xmm0,eax
   26ab9:	31 c0                	xor    eax,eax
   26abb:	48 89 43 e8          	mov    QWORD PTR [rbx-0x18],rax
   26abf:	48 83 eb 10          	sub    rbx,0x10
   26ac3:	66 0f d6 43 f0       	movq   QWORD PTR [rbx-0x10],xmm0
   26ac8:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   26acd:	49 83 c4 01          	add    r12,0x1
   26ad1:	49 89 c5             	mov    r13,rax
   26ad4:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26ad8:	ff e0                	jmp    rax
   26ada:	f3 0f 1e fa          	endbr64
   26ade:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   26ae5:	4d 8d 54 24 02       	lea    r10,[r12+0x2]
   26aea:	48 8b 73 d0          	mov    rsi,QWORD PTR [rbx-0x30]
   26aee:	4c 8d 73 e0          	lea    r14,[rbx-0x20]
   26af2:	45 0f b7 0c 24       	movzx  r9d,WORD PTR [r12]
   26af7:	48 8b 53 d8          	mov    rdx,QWORD PTR [rbx-0x28]
   26afb:	4d 89 f0             	mov    r8,r14
   26afe:	b9 02 00 00 00       	mov    ecx,0x2
   26b03:	4c 89 50 30          	mov    QWORD PTR [rax+0x30],r10
   26b07:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   26b0e:	4c 89 95 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r10
   26b15:	e8 46 a2 07 00       	call   a0d60 <js_function_apply>
   26b1a:	4c 8b 95 50 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1b0]
   26b21:	83 fa 06             	cmp    edx,0x6
   26b24:	49 89 c1             	mov    r9,rax
   26b27:	49 89 d0             	mov    r8,rdx
   26b2a:	0f 84 13 43 00 00    	je     2ae43 <JS_CallInternal+0x8443>
   26b30:	48 8b 53 d8          	mov    rdx,QWORD PTR [rbx-0x28]
   26b34:	48 8b 73 d0          	mov    rsi,QWORD PTR [rbx-0x30]
   26b38:	83 fa f6             	cmp    edx,0xfffffff6
   26b3b:	76 11                	jbe    26b4e <JS_CallInternal+0x414e>
   26b3d:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   26b40:	83 e8 01             	sub    eax,0x1
   26b43:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   26b46:	85 c0                	test   eax,eax
   26b48:	0f 8e f7 36 00 00    	jle    2a245 <JS_CallInternal+0x7845>
   26b4e:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   26b52:	49 8b 36             	mov    rsi,QWORD PTR [r14]
   26b55:	83 fa f6             	cmp    edx,0xfffffff6
   26b58:	76 11                	jbe    26b6b <JS_CallInternal+0x416b>
   26b5a:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   26b5d:	83 e8 01             	sub    eax,0x1
   26b60:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   26b63:	85 c0                	test   eax,eax
   26b65:	0f 8e 0b 37 00 00    	jle    2a276 <JS_CallInternal+0x7876>
   26b6b:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   26b6f:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   26b73:	83 fa f6             	cmp    edx,0xfffffff6
   26b76:	76 11                	jbe    26b89 <JS_CallInternal+0x4189>
   26b78:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   26b7b:	83 e8 01             	sub    eax,0x1
   26b7e:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   26b81:	85 c0                	test   eax,eax
   26b83:	0f 8e 1e 37 00 00    	jle    2a2a7 <JS_CallInternal+0x78a7>
   26b89:	4c 89 4b d0          	mov    QWORD PTR [rbx-0x30],r9
   26b8d:	49 83 c4 03          	add    r12,0x3
   26b91:	4c 89 43 d8          	mov    QWORD PTR [rbx-0x28],r8
   26b95:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26b9b:	4c 89 f3             	mov    rbx,r14
   26b9e:	49 89 c5             	mov    r13,rax
   26ba1:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26ba5:	ff e0                	jmp    rax
   26ba7:	f3 0f 1e fa          	endbr64
   26bab:	41 0f b7 14 24       	movzx  edx,WORD PTR [r12]
   26bb0:	49 8d 4c 24 02       	lea    rcx,[r12+0x2]
   26bb5:	48 89 8d 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rcx
   26bbc:	31 c9                	xor    ecx,ecx
   26bbe:	49 89 d6             	mov    r14,rdx
   26bc1:	89 95 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],edx
   26bc7:	49 c1 e6 04          	shl    r14,0x4
   26bcb:	48 89 95 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rdx
   26bd2:	ba 02 00 00 00       	mov    edx,0x2
   26bd7:	4c 29 f3             	sub    rbx,r14
   26bda:	49 89 dd             	mov    r13,rbx
   26bdd:	48 8b 9d e8 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x118]
   26be4:	48 8b 73 30          	mov    rsi,QWORD PTR [rbx+0x30]
   26be8:	48 89 df             	mov    rdi,rbx
   26beb:	83 46 fc 01          	add    DWORD PTR [rsi-0x4],0x1
   26bef:	e8 2c f1 01 00       	call   45d20 <JS_NewObjectFromShape>
   26bf4:	49 89 c0             	mov    r8,rax
   26bf7:	48 89 d1             	mov    rcx,rdx
   26bfa:	83 fa 06             	cmp    edx,0x6
   26bfd:	0f 84 f5 43 00 00    	je     2aff8 <JS_CallInternal+0x85f8>
   26c03:	8b 95 50 fe ff ff    	mov    edx,DWORD PTR [rbp-0x1b0]
   26c09:	85 d2                	test   edx,edx
   26c0b:	0f 85 e2 28 00 00    	jne    294f3 <JS_CallInternal+0x6af3>
   26c11:	4d 89 45 00          	mov    QWORD PTR [r13+0x0],r8
   26c15:	49 8d 5d 10          	lea    rbx,[r13+0x10]
   26c19:	49 83 c4 03          	add    r12,0x3
   26c1d:	49 89 4d 08          	mov    QWORD PTR [r13+0x8],rcx
   26c21:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26c27:	49 89 c5             	mov    r13,rax
   26c2a:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26c2e:	ff e0                	jmp    rax
   26c30:	f3 0f 1e fa          	endbr64
   26c34:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   26c3b:	4c 8b 73 f8          	mov    r14,QWORD PTR [rbx-0x8]
   26c3f:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   26c43:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   26c47:	41 83 fe ff          	cmp    r14d,0xffffffff
   26c4b:	0f 85 c3 50 00 00    	jne    2bd14 <JS_CallInternal+0x9314>
   26c51:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   26c58:	48 8d 8d f0 fe ff ff 	lea    rcx,[rbp-0x110]
   26c5f:	4c 89 f2             	mov    rdx,r14
   26c62:	48 89 b5 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rsi
   26c69:	e8 42 61 00 00       	call   2cdb0 <JS_IteratorGetCompleteValue>
   26c6e:	48 89 c1             	mov    rcx,rax
   26c71:	49 89 d5             	mov    r13,rdx
   26c74:	83 fa 06             	cmp    edx,0x6
   26c77:	0f 84 23 c5 ff ff    	je     231a0 <JS_CallInternal+0x7a0>
   26c7d:	48 8b b5 50 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1b0]
   26c84:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   26c87:	83 e8 01             	sub    eax,0x1
   26c8a:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   26c8d:	85 c0                	test   eax,eax
   26c8f:	0f 8e af 36 00 00    	jle    2a344 <JS_CallInternal+0x7944>
   26c95:	44 8b 95 f0 fe ff ff 	mov    r10d,DWORD PTR [rbp-0x110]
   26c9c:	31 c0                	xor    eax,eax
   26c9e:	4c 89 6b f8          	mov    QWORD PTR [rbx-0x8],r13
   26ca2:	48 c7 43 e0 00 00 00 	mov    QWORD PTR [rbx-0x20],0x0
   26ca9:	00 
   26caa:	45 85 d2             	test   r10d,r10d
   26cad:	48 c7 43 e8 05 00 00 	mov    QWORD PTR [rbx-0x18],0x5
   26cb4:	00 
   26cb5:	0f 95 c0             	setne  al
   26cb8:	48 89 4b f0          	mov    QWORD PTR [rbx-0x10],rcx
   26cbc:	49 83 c4 01          	add    r12,0x1
   26cc0:	48 83 c3 10          	add    rbx,0x10
   26cc4:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   26cc8:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   26ccf:	00 
   26cd0:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26cd6:	49 89 c5             	mov    r13,rax
   26cd9:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26cdd:	ff e0                	jmp    rax
   26cdf:	f3 0f 1e fa          	endbr64
   26ce3:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   26cea:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   26cf1:	ba 01 00 00 00       	mov    edx,0x1
   26cf6:	48 89 de             	mov    rsi,rbx
   26cf9:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   26cfd:	e8 5e e5 06 00       	call   95260 <js_for_of_start>
   26d02:	85 c0                	test   eax,eax
   26d04:	0f 85 96 c4 ff ff    	jne    231a0 <JS_CallInternal+0x7a0>
   26d0a:	48 c7 43 10 00 00 00 	mov    QWORD PTR [rbx+0x10],0x0
   26d11:	00 
   26d12:	49 83 c4 01          	add    r12,0x1
   26d16:	48 83 c3 20          	add    rbx,0x20
   26d1a:	48 c7 43 f8 05 00 00 	mov    QWORD PTR [rbx-0x8],0x5
   26d21:	00 
   26d22:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26d28:	49 89 c5             	mov    r13,rax
   26d2b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26d2f:	ff e0                	jmp    rax
   26d31:	f3 0f 1e fa          	endbr64
   26d35:	48 c7 03 00 00 00 00 	mov    QWORD PTR [rbx],0x0
   26d3c:	49 83 c4 01          	add    r12,0x1
   26d40:	48 83 c3 10          	add    rbx,0x10
   26d44:	48 c7 43 f8 02 00 00 	mov    QWORD PTR [rbx-0x8],0x2
   26d4b:	00 
   26d4c:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26d52:	49 89 c5             	mov    r13,rax
   26d55:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26d59:	ff e0                	jmp    rax
   26d5b:	f3 0f 1e fa          	endbr64
   26d5f:	48 c7 03 00 00 00 00 	mov    QWORD PTR [rbx],0x0
   26d66:	49 83 c4 01          	add    r12,0x1
   26d6a:	48 83 c3 10          	add    rbx,0x10
   26d6e:	48 c7 43 f8 03 00 00 	mov    QWORD PTR [rbx-0x8],0x3
   26d75:	00 
   26d76:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26d7c:	49 89 c5             	mov    r13,rax
   26d7f:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26d83:	ff e0                	jmp    rax
   26d85:	f3 0f 1e fa          	endbr64
   26d89:	41 8b 34 24          	mov    esi,DWORD PTR [r12]
   26d8d:	31 d2                	xor    edx,edx
   26d8f:	4c 8d 73 10          	lea    r14,[rbx+0x10]
   26d93:	49 83 c4 05          	add    r12,0x5
   26d97:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   26d9e:	e8 dd cc 00 00       	call   33a80 <__JS_AtomToValue>
   26da3:	48 89 03             	mov    QWORD PTR [rbx],rax
   26da6:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
   26daa:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26db0:	4c 89 f3             	mov    rbx,r14
   26db3:	49 89 c5             	mov    r13,rax
   26db6:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26dba:	ff e0                	jmp    rax
   26dbc:	f3 0f 1e fa          	endbr64
   26dc0:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   26dc7:	ba 01 00 00 00       	mov    edx,0x1
   26dcc:	4c 8d 73 10          	lea    r14,[rbx+0x10]
   26dd0:	49 83 c4 01          	add    r12,0x1
   26dd4:	be 2f 00 00 00       	mov    esi,0x2f
   26dd9:	e8 a2 cc 00 00       	call   33a80 <__JS_AtomToValue>
   26dde:	48 89 03             	mov    QWORD PTR [rbx],rax
   26de1:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
   26de5:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26deb:	4c 89 f3             	mov    rbx,r14
   26dee:	49 89 c5             	mov    r13,rax
   26df1:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26df5:	ff e0                	jmp    rax
   26df7:	f3 0f 1e fa          	endbr64
   26dfb:	48 c7 03 00 00 00 00 	mov    QWORD PTR [rbx],0x0
   26e02:	49 83 c4 01          	add    r12,0x1
   26e06:	48 83 c3 10          	add    rbx,0x10
   26e0a:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   26e11:	00 
   26e12:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26e18:	49 89 c5             	mov    r13,rax
   26e1b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26e1f:	ff e0                	jmp    rax
   26e21:	f3 0f 1e fa          	endbr64
   26e25:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
   26e2c:	f6 40 10 01          	test   BYTE PTR [rax+0x10],0x1
   26e30:	0f 85 04 24 00 00    	jne    2923a <JS_CallInternal+0x683a>
   26e36:	83 bd 90 fe ff ff ff 	cmp    DWORD PTR [rbp-0x170],0xffffffff
   26e3d:	0f 85 f1 4d 00 00    	jne    2bc34 <JS_CallInternal+0x9234>
   26e43:	48 8b 85 78 fe ff ff 	mov    rax,QWORD PTR [rbp-0x188]
   26e4a:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
   26e4e:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
   26e55:	48 8b 8d 78 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x188]
   26e5c:	48 89 0b             	mov    QWORD PTR [rbx],rcx
   26e5f:	49 83 c4 01          	add    r12,0x1
   26e63:	48 83 c3 10          	add    rbx,0x10
   26e67:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
   26e6b:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26e71:	49 89 c5             	mov    r13,rax
   26e74:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26e78:	ff e0                	jmp    rax
   26e7a:	f3 0f 1e fa          	endbr64
   26e7e:	48 c7 03 01 00 00 00 	mov    QWORD PTR [rbx],0x1
   26e85:	49 83 c4 01          	add    r12,0x1
   26e89:	48 83 c3 10          	add    rbx,0x10
   26e8d:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   26e94:	00 
   26e95:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26e9b:	49 89 c5             	mov    r13,rax
   26e9e:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26ea2:	ff e0                	jmp    rax
   26ea4:	f3 0f 1e fa          	endbr64
   26ea8:	e9 3b be ff ff       	jmp    22ce8 <JS_CallInternal+0x2e8>
   26ead:	f3 0f 1e fa          	endbr64
   26eb1:	e9 32 be ff ff       	jmp    22ce8 <JS_CallInternal+0x2e8>
   26eb6:	f3 0f 1e fa          	endbr64
   26eba:	e9 29 be ff ff       	jmp    22ce8 <JS_CallInternal+0x2e8>
   26ebf:	f3 0f 1e fa          	endbr64
   26ec3:	41 0f bf 04 24       	movsx  eax,WORD PTR [r12]
   26ec8:	48 83 c3 10          	add    rbx,0x10
   26ecc:	49 83 c4 03          	add    r12,0x3
   26ed0:	48 c7 43 f8 00 00 00 	mov    QWORD PTR [rbx-0x8],0x0
   26ed7:	00 
   26ed8:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   26edc:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26ee2:	49 89 c5             	mov    r13,rax
   26ee5:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26ee9:	ff e0                	jmp    rax
   26eeb:	f3 0f 1e fa          	endbr64
   26eef:	41 0f be 04 24       	movsx  eax,BYTE PTR [r12]
   26ef4:	48 83 c3 10          	add    rbx,0x10
   26ef8:	49 83 c4 02          	add    r12,0x2
   26efc:	48 c7 43 f8 00 00 00 	mov    QWORD PTR [rbx-0x8],0x0
   26f03:	00 
   26f04:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   26f08:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26f0e:	49 89 c5             	mov    r13,rax
   26f11:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26f15:	ff e0                	jmp    rax
   26f17:	f3 0f 1e fa          	endbr64
   26f1b:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   26f22:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   26f26:	48 c1 e0 04          	shl    rax,0x4
   26f2a:	48 03 41 50          	add    rax,QWORD PTR [rcx+0x50]
   26f2e:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   26f32:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   26f35:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   26f39:	83 f8 f6             	cmp    eax,0xfffffff6
   26f3c:	76 04                	jbe    26f42 <JS_CallInternal+0x4542>
   26f3e:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   26f42:	48 89 13             	mov    QWORD PTR [rbx],rdx
   26f45:	49 83 c4 05          	add    r12,0x5
   26f49:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
   26f4d:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26f53:	48 89 cb             	mov    rbx,rcx
   26f56:	49 89 c5             	mov    r13,rax
   26f59:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26f5d:	ff e0                	jmp    rax
   26f5f:	f3 0f 1e fa          	endbr64
   26f63:	49 63 04 24          	movsxd rax,DWORD PTR [r12]
   26f67:	48 c7 43 08 07 00 00 	mov    QWORD PTR [rbx+0x8],0x7
   26f6e:	00 
   26f6f:	49 83 c4 05          	add    r12,0x5
   26f73:	48 83 c3 10          	add    rbx,0x10
   26f77:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   26f7b:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26f81:	49 89 c5             	mov    r13,rax
   26f84:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26f88:	ff e0                	jmp    rax
   26f8a:	f3 0f 1e fa          	endbr64
   26f8e:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   26f92:	48 c7 43 08 00 00 00 	mov    QWORD PTR [rbx+0x8],0x0
   26f99:	00 
   26f9a:	49 83 c4 05          	add    r12,0x5
   26f9e:	48 83 c3 10          	add    rbx,0x10
   26fa2:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   26fa6:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26fac:	49 89 c5             	mov    r13,rax
   26faf:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26fb3:	ff e0                	jmp    rax
   26fb5:	f3 0f 1e fa          	endbr64
   26fb9:	e9 2a bd ff ff       	jmp    22ce8 <JS_CallInternal+0x2e8>
   26fbe:	f3 0f 1e fa          	endbr64
   26fc2:	e9 21 bd ff ff       	jmp    22ce8 <JS_CallInternal+0x2e8>
   26fc7:	f3 0f 1e fa          	endbr64
   26fcb:	e9 18 bd ff ff       	jmp    22ce8 <JS_CallInternal+0x2e8>
   26fd0:	f3 0f 1e fa          	endbr64
   26fd4:	f3 0f 6f 43 e0       	movdqu xmm0,XMMWORD PTR [rbx-0x20]
   26fd9:	f3 0f 6f 53 f0       	movdqu xmm2,XMMWORD PTR [rbx-0x10]
   26fde:	49 83 c4 01          	add    r12,0x1
   26fe2:	0f 11 53 e0          	movups XMMWORD PTR [rbx-0x20],xmm2
   26fe6:	0f 11 43 f0          	movups XMMWORD PTR [rbx-0x10],xmm0
   26fea:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   26ff0:	49 89 c5             	mov    r13,rax
   26ff3:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   26ff7:	ff e0                	jmp    rax
   26ff9:	f3 0f 1e fa          	endbr64
   26ffd:	f3 0f 6f 43 e0       	movdqu xmm0,XMMWORD PTR [rbx-0x20]
   27002:	f3 0f 6f 5b d0       	movdqu xmm3,XMMWORD PTR [rbx-0x30]
   27007:	49 83 c4 01          	add    r12,0x1
   2700b:	f3 0f 6f 4b c0       	movdqu xmm1,XMMWORD PTR [rbx-0x40]
   27010:	f3 0f 6f 63 b0       	movdqu xmm4,XMMWORD PTR [rbx-0x50]
   27015:	0f 11 5b e0          	movups XMMWORD PTR [rbx-0x20],xmm3
   27019:	0f 11 4b d0          	movups XMMWORD PTR [rbx-0x30],xmm1
   2701d:	0f 11 63 c0          	movups XMMWORD PTR [rbx-0x40],xmm4
   27021:	0f 11 43 b0          	movups XMMWORD PTR [rbx-0x50],xmm0
   27025:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2702b:	49 89 c5             	mov    r13,rax
   2702e:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27032:	ff e0                	jmp    rax
   27034:	f3 0f 1e fa          	endbr64
   27038:	f3 0f 6f 43 e0       	movdqu xmm0,XMMWORD PTR [rbx-0x20]
   2703d:	f3 0f 6f 73 d0       	movdqu xmm6,XMMWORD PTR [rbx-0x30]
   27042:	49 83 c4 01          	add    r12,0x1
   27046:	f3 0f 6f 7b c0       	movdqu xmm7,XMMWORD PTR [rbx-0x40]
   2704b:	0f 11 73 e0          	movups XMMWORD PTR [rbx-0x20],xmm6
   2704f:	0f 11 7b d0          	movups XMMWORD PTR [rbx-0x30],xmm7
   27053:	0f 11 43 c0          	movups XMMWORD PTR [rbx-0x40],xmm0
   27057:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2705d:	49 89 c5             	mov    r13,rax
   27060:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27064:	ff e0                	jmp    rax
   27066:	f3 0f 1e fa          	endbr64
   2706a:	f3 0f 6f 43 f0       	movdqu xmm0,XMMWORD PTR [rbx-0x10]
   2706f:	f3 0f 6f 53 e0       	movdqu xmm2,XMMWORD PTR [rbx-0x20]
   27074:	49 83 c4 01          	add    r12,0x1
   27078:	f3 0f 6f 6b d0       	movdqu xmm5,XMMWORD PTR [rbx-0x30]
   2707d:	0f 11 53 f0          	movups XMMWORD PTR [rbx-0x10],xmm2
   27081:	0f 11 6b e0          	movups XMMWORD PTR [rbx-0x20],xmm5
   27085:	0f 11 43 d0          	movups XMMWORD PTR [rbx-0x30],xmm0
   27089:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2708f:	49 89 c5             	mov    r13,rax
   27092:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27096:	ff e0                	jmp    rax
   27098:	f3 0f 1e fa          	endbr64
   2709c:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   270a0:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   270a7:	48 c1 e0 04          	shl    rax,0x4
   270ab:	48 03 41 50          	add    rax,QWORD PTR [rcx+0x50]
   270af:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   270b3:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   270b6:	83 fa f6             	cmp    edx,0xfffffff6
   270b9:	76 04                	jbe    270bf <JS_CallInternal+0x46bf>
   270bb:	83 46 fc 01          	add    DWORD PTR [rsi-0x4],0x1
   270bf:	4c 8b 85 c8 fe ff ff 	mov    r8,QWORD PTR [rbp-0x138]
   270c6:	45 31 c9             	xor    r9d,r9d
   270c9:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
   270ce:	4c 8d 73 10          	lea    r14,[rbx+0x10]
   270d2:	48 8b 8d 98 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x168]
   270d9:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   270e0:	e8 5b 50 02 00       	call   4c140 <js_closure>
   270e5:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
   270e9:	83 7b 08 06          	cmp    DWORD PTR [rbx+0x8],0x6
   270ed:	48 89 03             	mov    QWORD PTR [rbx],rax
   270f0:	0f 84 2e 43 00 00    	je     2b424 <JS_CallInternal+0x8a24>
   270f6:	41 0f b6 44 24 04    	movzx  eax,BYTE PTR [r12+0x4]
   270fc:	4c 89 f3             	mov    rbx,r14
   270ff:	49 83 c4 05          	add    r12,0x5
   27103:	49 89 c5             	mov    r13,rax
   27106:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2710a:	ff e0                	jmp    rax
   2710c:	f3 0f 1e fa          	endbr64
   27110:	f3 0f 6f 4b c0       	movdqu xmm1,XMMWORD PTR [rbx-0x40]
   27115:	f3 0f 6f 43 d0       	movdqu xmm0,XMMWORD PTR [rbx-0x30]
   2711a:	49 83 c4 01          	add    r12,0x1
   2711e:	f3 0f 6f 6b e0       	movdqu xmm5,XMMWORD PTR [rbx-0x20]
   27123:	f3 0f 6f 73 f0       	movdqu xmm6,XMMWORD PTR [rbx-0x10]
   27128:	0f 11 4b e0          	movups XMMWORD PTR [rbx-0x20],xmm1
   2712c:	0f 11 6b c0          	movups XMMWORD PTR [rbx-0x40],xmm5
   27130:	0f 11 73 d0          	movups XMMWORD PTR [rbx-0x30],xmm6
   27134:	0f 11 43 f0          	movups XMMWORD PTR [rbx-0x10],xmm0
   27138:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2713e:	49 89 c5             	mov    r13,rax
   27141:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27145:	ff e0                	jmp    rax
   27147:	f3 0f 1e fa          	endbr64
   2714b:	e9 76 bc ff ff       	jmp    22dc6 <JS_CallInternal+0x3c6>
   27150:	f3 0f 1e fa          	endbr64
   27154:	f3 0f 6f 7b f0       	movdqu xmm7,XMMWORD PTR [rbx-0x10]
   27159:	f3 0f 6f 5b e0       	movdqu xmm3,XMMWORD PTR [rbx-0x20]
   2715e:	f3 0f 6f 63 d0       	movdqu xmm4,XMMWORD PTR [rbx-0x30]
   27163:	f3 0f 6f 6b c0       	movdqu xmm5,XMMWORD PTR [rbx-0x40]
   27168:	0f 11 3b             	movups XMMWORD PTR [rbx],xmm7
   2716b:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
   2716f:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   27173:	0f 11 63 e0          	movups XMMWORD PTR [rbx-0x20],xmm4
   27177:	0f 11 5b f0          	movups XMMWORD PTR [rbx-0x10],xmm3
   2717b:	0f 11 6b d0          	movups XMMWORD PTR [rbx-0x30],xmm5
   2717f:	83 f8 f6             	cmp    eax,0xfffffff6
   27182:	76 04                	jbe    27188 <JS_CallInternal+0x4788>
   27184:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   27188:	48 89 53 c0          	mov    QWORD PTR [rbx-0x40],rdx
   2718c:	49 83 c4 01          	add    r12,0x1
   27190:	48 83 c3 10          	add    rbx,0x10
   27194:	48 89 43 b8          	mov    QWORD PTR [rbx-0x48],rax
   27198:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2719e:	49 89 c5             	mov    r13,rax
   271a1:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   271a5:	ff e0                	jmp    rax
   271a7:	f3 0f 1e fa          	endbr64
   271ab:	f3 0f 6f 63 f0       	movdqu xmm4,XMMWORD PTR [rbx-0x10]
   271b0:	f3 0f 6f 6b e0       	movdqu xmm5,XMMWORD PTR [rbx-0x20]
   271b5:	f3 0f 6f 73 d0       	movdqu xmm6,XMMWORD PTR [rbx-0x30]
   271ba:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   271be:	0f 11 23             	movups XMMWORD PTR [rbx],xmm4
   271c1:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
   271c5:	0f 11 6b f0          	movups XMMWORD PTR [rbx-0x10],xmm5
   271c9:	0f 11 73 e0          	movups XMMWORD PTR [rbx-0x20],xmm6
   271cd:	83 f8 f6             	cmp    eax,0xfffffff6
   271d0:	76 04                	jbe    271d6 <JS_CallInternal+0x47d6>
   271d2:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   271d6:	48 89 53 d0          	mov    QWORD PTR [rbx-0x30],rdx
   271da:	49 83 c4 01          	add    r12,0x1
   271de:	48 83 c3 10          	add    rbx,0x10
   271e2:	48 89 43 c8          	mov    QWORD PTR [rbx-0x38],rax
   271e6:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   271ec:	49 89 c5             	mov    r13,rax
   271ef:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   271f3:	ff e0                	jmp    rax
   271f5:	f3 0f 1e fa          	endbr64
   271f9:	f3 0f 6f 73 f0       	movdqu xmm6,XMMWORD PTR [rbx-0x10]
   271fe:	f3 0f 6f 7b e0       	movdqu xmm7,XMMWORD PTR [rbx-0x20]
   27203:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   27207:	0f 11 33             	movups XMMWORD PTR [rbx],xmm6
   2720a:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
   2720e:	0f 11 7b f0          	movups XMMWORD PTR [rbx-0x10],xmm7
   27212:	83 f8 f6             	cmp    eax,0xfffffff6
   27215:	76 04                	jbe    2721b <JS_CallInternal+0x481b>
   27217:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   2721b:	48 89 53 e0          	mov    QWORD PTR [rbx-0x20],rdx
   2721f:	49 83 c4 01          	add    r12,0x1
   27223:	48 83 c3 10          	add    rbx,0x10
   27227:	48 89 43 d8          	mov    QWORD PTR [rbx-0x28],rax
   2722b:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   27231:	49 89 c5             	mov    r13,rax
   27234:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27238:	ff e0                	jmp    rax
   2723a:	f3 0f 1e fa          	endbr64
   2723e:	f3 0f 6f 6b f0       	movdqu xmm5,XMMWORD PTR [rbx-0x10]
   27243:	48 8b 43 e8          	mov    rax,QWORD PTR [rbx-0x18]
   27247:	48 8b 53 e0          	mov    rdx,QWORD PTR [rbx-0x20]
   2724b:	0f 11 2b             	movups XMMWORD PTR [rbx],xmm5
   2724e:	83 f8 f6             	cmp    eax,0xfffffff6
   27251:	76 04                	jbe    27257 <JS_CallInternal+0x4857>
   27253:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   27257:	48 89 53 f0          	mov    QWORD PTR [rbx-0x10],rdx
   2725b:	49 83 c4 01          	add    r12,0x1
   2725f:	48 83 c3 10          	add    rbx,0x10
   27263:	48 89 43 e8          	mov    QWORD PTR [rbx-0x18],rax
   27267:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2726d:	49 89 c5             	mov    r13,rax
   27270:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27274:	ff e0                	jmp    rax
   27276:	f3 0f 1e fa          	endbr64
   2727a:	f3 0f 6f 43 d0       	movdqu xmm0,XMMWORD PTR [rbx-0x30]
   2727f:	f3 0f 6f 7b e0       	movdqu xmm7,XMMWORD PTR [rbx-0x20]
   27284:	49 83 c4 01          	add    r12,0x1
   27288:	f3 0f 6f 5b f0       	movdqu xmm3,XMMWORD PTR [rbx-0x10]
   2728d:	0f 11 7b d0          	movups XMMWORD PTR [rbx-0x30],xmm7
   27291:	0f 11 5b e0          	movups XMMWORD PTR [rbx-0x20],xmm3
   27295:	0f 11 43 f0          	movups XMMWORD PTR [rbx-0x10],xmm0
   27299:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2729f:	49 89 c5             	mov    r13,rax
   272a2:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   272a6:	ff e0                	jmp    rax
   272a8:	f3 0f 1e fa          	endbr64
   272ac:	f3 0f 6f 43 e0       	movdqu xmm0,XMMWORD PTR [rbx-0x20]
   272b1:	f3 0f 6f 73 d0       	movdqu xmm6,XMMWORD PTR [rbx-0x30]
   272b6:	49 83 c4 01          	add    r12,0x1
   272ba:	0f 11 73 e0          	movups XMMWORD PTR [rbx-0x20],xmm6
   272be:	0f 11 43 d0          	movups XMMWORD PTR [rbx-0x30],xmm0
   272c2:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   272c8:	49 89 c5             	mov    r13,rax
   272cb:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   272cf:	ff e0                	jmp    rax
   272d1:	f3 0f 1e fa          	endbr64
   272d5:	f3 0f 6f 43 c0       	movdqu xmm0,XMMWORD PTR [rbx-0x40]
   272da:	f3 0f 6f 63 d0       	movdqu xmm4,XMMWORD PTR [rbx-0x30]
   272df:	49 83 c4 01          	add    r12,0x1
   272e3:	f3 0f 6f 6b e0       	movdqu xmm5,XMMWORD PTR [rbx-0x20]
   272e8:	f3 0f 6f 73 f0       	movdqu xmm6,XMMWORD PTR [rbx-0x10]
   272ed:	0f 11 63 c0          	movups XMMWORD PTR [rbx-0x40],xmm4
   272f1:	0f 11 6b d0          	movups XMMWORD PTR [rbx-0x30],xmm5
   272f5:	0f 11 73 e0          	movups XMMWORD PTR [rbx-0x20],xmm6
   272f9:	0f 11 43 f0          	movups XMMWORD PTR [rbx-0x10],xmm0
   272fd:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   27303:	49 89 c5             	mov    r13,rax
   27306:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2730a:	ff e0                	jmp    rax
   2730c:	f3 0f 1e fa          	endbr64
   27310:	83 bd 80 fe ff ff 03 	cmp    DWORD PTR [rbp-0x180],0x3
   27317:	0f 84 18 48 00 00    	je     2bb35 <JS_CallInternal+0x9135>
   2731d:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27322:	49 83 c4 01          	add    r12,0x1
   27326:	49 89 c5             	mov    r13,rax
   27329:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2732d:	ff e0                	jmp    rax
   2732f:	f3 0f 1e fa          	endbr64
   27333:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   27337:	83 f8 ff             	cmp    eax,0xffffffff
   2733a:	0f 84 74 24 00 00    	je     297b4 <JS_CallInternal+0x6db4>
   27340:	83 f8 03             	cmp    eax,0x3
   27343:	0f 85 24 50 00 00    	jne    2c36d <JS_CallInternal+0x996d>
   27349:	b8 01 00 00 00       	mov    eax,0x1
   2734e:	48 89 03             	mov    QWORD PTR [rbx],rax
   27351:	49 83 c4 01          	add    r12,0x1
   27355:	48 83 c3 10          	add    rbx,0x10
   27359:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   27360:	00 
   27361:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   27367:	49 89 c5             	mov    r13,rax
   2736a:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2736e:	ff e0                	jmp    rax
   27370:	f3 0f 1e fa          	endbr64
   27374:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   27378:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   2737c:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   27380:	4c 8b 43 f8          	mov    r8,QWORD PTR [rbx-0x8]
   27384:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2738b:	e8 a0 99 00 00       	call   30d30 <JS_CheckBrand>
   27390:	85 c0                	test   eax,eax
   27392:	0f 88 08 be ff ff    	js     231a0 <JS_CallInternal+0x7a0>
   27398:	0f 84 32 4b 00 00    	je     2bed0 <JS_CallInternal+0x94d0>
   2739e:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   273a3:	49 83 c4 01          	add    r12,0x1
   273a7:	49 89 c5             	mov    r13,rax
   273aa:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   273ae:	ff e0                	jmp    rax
   273b0:	f3 0f 1e fa          	endbr64
   273b4:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   273bb:	83 bd 80 fe ff ff 03 	cmp    DWORD PTR [rbp-0x180],0x3
   273c2:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   273c6:	0f 84 69 47 00 00    	je     2bb35 <JS_CallInternal+0x9135>
   273cc:	48 8b b5 e0 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x120]
   273d3:	48 8b 95 d0 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x130]
   273da:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   273e1:	e8 1a af ff ff       	call   22300 <JS_GetPrototype>
   273e6:	49 89 c6             	mov    r14,rax
   273e9:	49 89 d5             	mov    r13,rdx
   273ec:	83 fa 06             	cmp    edx,0x6
   273ef:	0f 84 ab bd ff ff    	je     231a0 <JS_CallInternal+0x7a0>
   273f5:	6a 02                	push   0x2
   273f7:	48 8b 8d 70 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x190]
   273fe:	48 89 c6             	mov    rsi,rax
   27401:	ff b5 a8 fe ff ff    	push   QWORD PTR [rbp-0x158]
   27407:	44 8b 8d bc fe ff ff 	mov    r9d,DWORD PTR [rbp-0x144]
   2740e:	4c 8b 85 80 fe ff ff 	mov    r8,QWORD PTR [rbp-0x180]
   27415:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2741c:	e8 cf 92 06 00       	call   906f0 <JS_CallConstructorInternal>
   27421:	48 89 d1             	mov    rcx,rdx
   27424:	5a                   	pop    rdx
   27425:	5e                   	pop    rsi
   27426:	41 83 fd f6          	cmp    r13d,0xfffffff6
   2742a:	76 13                	jbe    2743f <JS_CallInternal+0x4a3f>
   2742c:	41 8b 7e fc          	mov    edi,DWORD PTR [r14-0x4]
   27430:	8d 57 ff             	lea    edx,[rdi-0x1]
   27433:	41 89 56 fc          	mov    DWORD PTR [r14-0x4],edx
   27437:	85 d2                	test   edx,edx
   27439:	0f 8e 2b 2f 00 00    	jle    2a36a <JS_CallInternal+0x796a>
   2743f:	83 f9 06             	cmp    ecx,0x6
   27442:	0f 84 58 bd ff ff    	je     231a0 <JS_CallInternal+0x7a0>
   27448:	48 89 03             	mov    QWORD PTR [rbx],rax
   2744b:	49 83 c4 01          	add    r12,0x1
   2744f:	48 83 c3 10          	add    rbx,0x10
   27453:	48 89 4b f8          	mov    QWORD PTR [rbx-0x8],rcx
   27457:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   2745d:	49 89 c5             	mov    r13,rax
   27460:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27464:	ff e0                	jmp    rax
   27466:	f3 0f 1e fa          	endbr64
   2746a:	b9 03 00 00 00       	mov    ecx,0x3
   2746f:	31 c0                	xor    eax,eax
   27471:	e9 7d bc ff ff       	jmp    230f3 <JS_CallInternal+0x6f3>
   27476:	f3 0f 1e fa          	endbr64
   2747a:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   2747e:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   27482:	4c 8d 6b f0          	lea    r13,[rbx-0x10]
   27486:	4c 8d 73 e0          	lea    r14,[rbx-0x20]
   2748a:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   27491:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   27495:	4d 8b 45 08          	mov    r8,QWORD PTR [r13+0x8]
   27499:	e8 02 26 02 00       	call   49aa0 <JS_AddBrand>
   2749e:	85 c0                	test   eax,eax
   274a0:	0f 88 fa bc ff ff    	js     231a0 <JS_CallInternal+0x7a0>
   274a6:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   274aa:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   274ae:	83 fa f6             	cmp    edx,0xfffffff6
   274b1:	76 11                	jbe    274c4 <JS_CallInternal+0x4ac4>
   274b3:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   274b6:	83 e8 01             	sub    eax,0x1
   274b9:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   274bc:	85 c0                	test   eax,eax
   274be:	0f 8e 60 2b 00 00    	jle    2a024 <JS_CallInternal+0x7624>
   274c4:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
   274c8:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
   274cc:	83 fa f6             	cmp    edx,0xfffffff6
   274cf:	76 11                	jbe    274e2 <JS_CallInternal+0x4ae2>
   274d1:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   274d4:	83 e8 01             	sub    eax,0x1
   274d7:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   274da:	85 c0                	test   eax,eax
   274dc:	0f 8e 68 32 00 00    	jle    2a74a <JS_CallInternal+0x7d4a>
   274e2:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   274e7:	4c 89 f3             	mov    rbx,r14
   274ea:	49 83 c4 01          	add    r12,0x1
   274ee:	49 89 c5             	mov    r13,rax
   274f1:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   274f5:	ff e0                	jmp    rax
   274f7:	f3 0f 1e fa          	endbr64
   274fb:	44 8b 5b f8          	mov    r11d,DWORD PTR [rbx-0x8]
   274ff:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
   27503:	45 85 db             	test   r11d,r11d
   27506:	0f 85 94 1e 00 00    	jne    293a0 <JS_CallInternal+0x69a0>
   2750c:	3d ff ff ff 7f       	cmp    eax,0x7fffffff
   27511:	0f 84 89 1e 00 00    	je     293a0 <JS_CallInternal+0x69a0>
   27517:	83 c0 01             	add    eax,0x1
   2751a:	48 c7 43 f8 00 00 00 	mov    QWORD PTR [rbx-0x8],0x0
   27521:	00 
   27522:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   27526:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   2752b:	49 83 c4 01          	add    r12,0x1
   2752f:	49 89 c5             	mov    r13,rax
   27532:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27536:	ff e0                	jmp    rax
   27538:	f3 0f 1e fa          	endbr64
   2753c:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   27540:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
   27544:	83 fa 02             	cmp    edx,0x2
   27547:	0f 87 5f 1c 00 00    	ja     291ac <JS_CallInternal+0x67ac>
   2754d:	85 c0                	test   eax,eax
   2754f:	0f 84 7e 46 00 00    	je     2bbd3 <JS_CallInternal+0x91d3>
   27555:	3d 00 00 00 80       	cmp    eax,0x80000000
   2755a:	0f 84 3e 43 00 00    	je     2b89e <JS_CallInternal+0x8e9e>
   27560:	f7 d8                	neg    eax
   27562:	48 c7 43 f8 00 00 00 	mov    QWORD PTR [rbx-0x8],0x0
   27569:	00 
   2756a:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   2756e:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27573:	49 83 c4 01          	add    r12,0x1
   27577:	49 89 c5             	mov    r13,rax
   2757a:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2757e:	ff e0                	jmp    rax
   27580:	f3 0f 1e fa          	endbr64
   27584:	4c 8b 43 e8          	mov    r8,QWORD PTR [rbx-0x18]
   27588:	48 8b 4b e0          	mov    rcx,QWORD PTR [rbx-0x20]
   2758c:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
   27590:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   27594:	76 04                	jbe    2759a <JS_CallInternal+0x4b9a>
   27596:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
   2759a:	48 8b 73 d0          	mov    rsi,QWORD PTR [rbx-0x30]
   2759e:	48 8b 53 d8          	mov    rdx,QWORD PTR [rbx-0x28]
   275a2:	41 ff 76 08          	push   QWORD PTR [r14+0x8]
   275a6:	41 b9 07 40 00 00    	mov    r9d,0x4007
   275ac:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   275b3:	41 ff 36             	push   QWORD PTR [r14]
   275b6:	e8 65 bf 01 00       	call   43520 <JS_DefinePropertyValueValue>
   275bb:	59                   	pop    rcx
   275bc:	5e                   	pop    rsi
   275bd:	85 c0                	test   eax,eax
   275bf:	0f 88 99 35 00 00    	js     2ab5e <JS_CallInternal+0x815e>
   275c5:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   275ca:	4c 89 f3             	mov    rbx,r14
   275cd:	49 83 c4 01          	add    r12,0x1
   275d1:	49 89 c5             	mov    r13,rax
   275d4:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   275d8:	ff e0                	jmp    rax
   275da:	f3 0f 1e fa          	endbr64
   275de:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   275e5:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   275e9:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   275ed:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   275f4:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   275f8:	48 8d 43 e0          	lea    rax,[rbx-0x20]
   275fc:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   27603:	e8 88 bd 01 00       	call   43390 <JS_ValueToAtom>
   27608:	41 89 c5             	mov    r13d,eax
   2760b:	45 85 ed             	test   r13d,r13d
   2760e:	0f 84 8c bb ff ff    	je     231a0 <JS_CallInternal+0x7a0>
   27614:	83 7b d8 03          	cmp    DWORD PTR [rbx-0x28],0x3
   27618:	0f 84 70 34 00 00    	je     2aa8e <JS_CallInternal+0x808e>
   2761e:	48 8b 73 d0          	mov    rsi,QWORD PTR [rbx-0x30]
   27622:	48 8b 53 d8          	mov    rdx,QWORD PTR [rbx-0x28]
   27626:	44 89 e9             	mov    ecx,r13d
   27629:	4c 8d 73 d0          	lea    r14,[rbx-0x30]
   2762d:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   27634:	e8 77 63 04 00       	call   6d9b0 <JS_HasProperty>
   27639:	85 c0                	test   eax,eax
   2763b:	0f 8e f5 33 00 00    	jle    2aa36 <JS_CallInternal+0x8036>
   27641:	48 83 ec 08          	sub    rsp,0x8
   27645:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   27649:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   2764d:	44 89 e9             	mov    ecx,r13d
   27650:	49 8b 36             	mov    rsi,QWORD PTR [r14]
   27653:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   27657:	68 00 80 00 00       	push   0x8000
   2765c:	41 ff 76 08          	push   QWORD PTR [r14+0x8]
   27660:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   27667:	41 ff 36             	push   QWORD PTR [r14]
   2766a:	e8 01 5f 00 00       	call   2d570 <JS_SetPropertyInternal>
   2766f:	48 83 c4 20          	add    rsp,0x20
   27673:	89 c3                	mov    ebx,eax
   27675:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   2767c:	0f 8f 35 26 00 00    	jg     29cb7 <JS_CallInternal+0x72b7>
   27682:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   27689:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   2768d:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   27690:	83 fa f6             	cmp    edx,0xfffffff6
   27693:	76 11                	jbe    276a6 <JS_CallInternal+0x4ca6>
   27695:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   27698:	83 e8 01             	sub    eax,0x1
   2769b:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2769e:	85 c0                	test   eax,eax
   276a0:	0f 8e 4a 34 00 00    	jle    2aaf0 <JS_CallInternal+0x80f0>
   276a6:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   276aa:	49 8b 36             	mov    rsi,QWORD PTR [r14]
   276ad:	83 fa f6             	cmp    edx,0xfffffff6
   276b0:	76 11                	jbe    276c3 <JS_CallInternal+0x4cc3>
   276b2:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   276b5:	83 e8 01             	sub    eax,0x1
   276b8:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   276bb:	85 c0                	test   eax,eax
   276bd:	0f 8e 42 34 00 00    	jle    2ab05 <JS_CallInternal+0x8105>
   276c3:	85 db                	test   ebx,ebx
   276c5:	0f 88 b7 41 00 00    	js     2b882 <JS_CallInternal+0x8e82>
   276cb:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   276d0:	4c 89 f3             	mov    rbx,r14
   276d3:	49 83 c4 01          	add    r12,0x1
   276d7:	49 89 c5             	mov    r13,rax
   276da:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   276de:	ff e0                	jmp    rax
   276e0:	f3 0f 1e fa          	endbr64
   276e4:	83 7b d8 ff          	cmp    DWORD PTR [rbx-0x28],0xffffffff
   276e8:	0f 85 4c 20 00 00    	jne    2973a <JS_CallInternal+0x6d3a>
   276ee:	44 8b 5b e8          	mov    r11d,DWORD PTR [rbx-0x18]
   276f2:	45 85 db             	test   r11d,r11d
   276f5:	0f 85 3f 20 00 00    	jne    2973a <JS_CallInternal+0x6d3a>
   276fb:	48 8b 4b d0          	mov    rcx,QWORD PTR [rbx-0x30]
   276ff:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
   27703:	66 83 79 12 02       	cmp    WORD PTR [rcx+0x12],0x2
   27708:	0f 85 2c 20 00 00    	jne    2973a <JS_CallInternal+0x6d3a>
   2770e:	8b 51 38             	mov    edx,DWORD PTR [rcx+0x38]
   27711:	39 d0                	cmp    eax,edx
   27713:	0f 83 53 3f 00 00    	jae    2b66c <JS_CallInternal+0x8c6c>
   27719:	89 c0                	mov    eax,eax
   2771b:	f3 0f 6f 6b f0       	movdqu xmm5,XMMWORD PTR [rbx-0x10]
   27720:	48 c1 e0 04          	shl    rax,0x4
   27724:	48 03 41 30          	add    rax,QWORD PTR [rcx+0x30]
   27728:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   2772c:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   2772f:	0f 11 28             	movups XMMWORD PTR [rax],xmm5
   27732:	83 fa f6             	cmp    edx,0xfffffff6
   27735:	76 11                	jbe    27748 <JS_CallInternal+0x4d48>
   27737:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2773a:	83 e8 01             	sub    eax,0x1
   2773d:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   27740:	85 c0                	test   eax,eax
   27742:	0f 8e 0f 3f 00 00    	jle    2b657 <JS_CallInternal+0x8c57>
   27748:	48 8b 53 d8          	mov    rdx,QWORD PTR [rbx-0x28]
   2774c:	48 83 eb 30          	sub    rbx,0x30
   27750:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
   27753:	83 fa f6             	cmp    edx,0xfffffff6
   27756:	76 11                	jbe    27769 <JS_CallInternal+0x4d69>
   27758:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2775b:	83 e8 01             	sub    eax,0x1
   2775e:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   27761:	85 c0                	test   eax,eax
   27763:	0f 8e 8f 3f 00 00    	jle    2b6f8 <JS_CallInternal+0x8cf8>
   27769:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   2776e:	49 83 c4 01          	add    r12,0x1
   27772:	49 89 c5             	mov    r13,rax
   27775:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27779:	ff e0                	jmp    rax
   2777b:	f3 0f 1e fa          	endbr64
   2777f:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   27783:	0b 53 e8             	or     edx,DWORD PTR [rbx-0x18]
   27786:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
   2778a:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   2778e:	0f 85 0b 38 00 00    	jne    2af9f <JS_CallInternal+0x859f>
   27794:	21 c8                	and    eax,ecx
   27796:	48 c7 43 e8 00 00 00 	mov    QWORD PTR [rbx-0x18],0x0
   2779d:	00 
   2779e:	48 83 eb 10          	sub    rbx,0x10
   277a2:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   277a6:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   277ab:	49 83 c4 01          	add    r12,0x1
   277af:	49 89 c5             	mov    r13,rax
   277b2:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   277b6:	ff e0                	jmp    rax
   277b8:	f3 0f 1e fa          	endbr64
   277bc:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   277c0:	0b 53 e8             	or     edx,DWORD PTR [rbx-0x18]
   277c3:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
   277c7:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   277cb:	0f 85 5c 37 00 00    	jne    2af2d <JS_CallInternal+0x852d>
   277d1:	d3 f8                	sar    eax,cl
   277d3:	48 c7 43 e8 00 00 00 	mov    QWORD PTR [rbx-0x18],0x0
   277da:	00 
   277db:	48 83 eb 10          	sub    rbx,0x10
   277df:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   277e3:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   277e8:	49 83 c4 01          	add    r12,0x1
   277ec:	49 89 c5             	mov    r13,rax
   277ef:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   277f3:	ff e0                	jmp    rax
   277f5:	f3 0f 1e fa          	endbr64
   277f9:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   27800:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   27805:	0f b7 51 38          	movzx  edx,WORD PTR [rcx+0x38]
   27809:	4c 8b 71 28          	mov    r14,QWORD PTR [rcx+0x28]
   2780d:	01 d0                	add    eax,edx
   2780f:	48 98                	cdqe
   27811:	48 8d 04 40          	lea    rax,[rax+rax*2]
   27815:	49 8d 04 86          	lea    rax,[r14+rax*4]
   27819:	44 0f b7 68 0a       	movzx  r13d,WORD PTR [rax+0xa]
   2781e:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   27825:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
   27829:	49 c1 e5 03          	shl    r13,0x3
   2782d:	4c 01 e9             	add    rcx,r13
   27830:	4c 8b 31             	mov    r14,QWORD PTR [rcx]
   27833:	4d 85 f6             	test   r14,r14
   27836:	74 50                	je     27888 <JS_CallInternal+0x4e88>
   27838:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2783f:	48 8b 7f 10          	mov    rdi,QWORD PTR [rdi+0x10]
   27843:	f6 40 3c 04          	test   BYTE PTR [rax+0x3c],0x4
   27847:	0f 85 1d 27 00 00    	jne    29f6a <JS_CallInternal+0x756a>
   2784d:	49 8b 56 18          	mov    rdx,QWORD PTR [r14+0x18]
   27851:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   27854:	48 8b 52 08          	mov    rdx,QWORD PTR [rdx+0x8]
   27858:	83 fa f6             	cmp    edx,0xfffffff6
   2785b:	76 04                	jbe    27861 <JS_CallInternal+0x4e61>
   2785d:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
   27861:	49 8d 7e 20          	lea    rdi,[r14+0x20]
   27865:	66 48 0f 6e e0       	movq   xmm4,rax
   2786a:	49 89 56 28          	mov    QWORD PTR [r14+0x28],rdx
   2786e:	66 48 0f 6e c7       	movq   xmm0,rdi
   27873:	41 c6 46 10 01       	mov    BYTE PTR [r14+0x10],0x1
   27878:	66 0f 6c c4          	punpcklqdq xmm0,xmm4
   2787c:	41 0f 11 46 18       	movups XMMWORD PTR [r14+0x18],xmm0
   27881:	48 c7 01 00 00 00 00 	mov    QWORD PTR [rcx],0x0
   27888:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
   2788e:	49 83 c4 03          	add    r12,0x3
   27892:	49 89 c5             	mov    r13,rax
   27895:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27899:	ff e0                	jmp    rax
   2789b:	f3 0f 1e fa          	endbr64
   2789f:	44 8b 4b f8          	mov    r9d,DWORD PTR [rbx-0x8]
   278a3:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
   278a7:	45 85 c9             	test   r9d,r9d
   278aa:	0f 85 c1 1a 00 00    	jne    29371 <JS_CallInternal+0x6971>
   278b0:	3d ff ff ff 7f       	cmp    eax,0x7fffffff
   278b5:	0f 84 b6 1a 00 00    	je     29371 <JS_CallInternal+0x6971>
   278bb:	83 c0 01             	add    eax,0x1
   278be:	48 c7 43 08 00 00 00 	mov    QWORD PTR [rbx+0x8],0x0
   278c5:	00 
   278c6:	48 89 03             	mov    QWORD PTR [rbx],rax
   278c9:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   278ce:	48 83 c3 10          	add    rbx,0x10
   278d2:	49 83 c4 01          	add    r12,0x1
   278d6:	49 89 c5             	mov    r13,rax
   278d9:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   278dd:	ff e0                	jmp    rax
   278df:	f3 0f 1e fa          	endbr64
   278e3:	44 8b 53 f8          	mov    r10d,DWORD PTR [rbx-0x8]
   278e7:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
   278eb:	45 85 d2             	test   r10d,r10d
   278ee:	0f 85 7b 1b 00 00    	jne    2946f <JS_CallInternal+0x6a6f>
   278f4:	3d 00 00 00 80       	cmp    eax,0x80000000
   278f9:	0f 84 70 1b 00 00    	je     2946f <JS_CallInternal+0x6a6f>
   278ff:	83 e8 01             	sub    eax,0x1
   27902:	48 c7 43 f8 00 00 00 	mov    QWORD PTR [rbx-0x8],0x0
   27909:	00 
   2790a:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   2790e:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27913:	49 83 c4 01          	add    r12,0x1
   27917:	49 89 c5             	mov    r13,rax
   2791a:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2791e:	ff e0                	jmp    rax
   27920:	f3 0f 1e fa          	endbr64
   27924:	8b 7b f8             	mov    edi,DWORD PTR [rbx-0x8]
   27927:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
   2792b:	85 ff                	test   edi,edi
   2792d:	0f 85 6c 1f 00 00    	jne    2989f <JS_CallInternal+0x6e9f>
   27933:	f7 d0                	not    eax
   27935:	48 c7 43 f8 00 00 00 	mov    QWORD PTR [rbx-0x8],0x0
   2793c:	00 
   2793d:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   27941:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27946:	49 83 c4 01          	add    r12,0x1
   2794a:	49 89 c5             	mov    r13,rax
   2794d:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27951:	ff e0                	jmp    rax
   27953:	f3 0f 1e fa          	endbr64
   27957:	45 0f b6 2c 24       	movzx  r13d,BYTE PTR [r12]
   2795c:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   27963:	4d 8d 74 24 01       	lea    r14,[r12+0x1]
   27968:	49 c1 e5 04          	shl    r13,0x4
   2796c:	49 01 c5             	add    r13,rax
   2796f:	f3 41 0f 6f 6d 00    	movdqu xmm5,XMMWORD PTR [r13+0x0]
   27975:	0f 29 ad f0 fe ff ff 	movaps XMMWORD PTR [rbp-0x110],xmm5
   2797c:	48 8b 95 f8 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x108]
   27983:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
   2798a:	85 d2                	test   edx,edx
   2798c:	0f 85 48 17 00 00    	jne    290da <JS_CallInternal+0x66da>
   27992:	3d 00 00 00 80       	cmp    eax,0x80000000
   27997:	0f 84 3d 17 00 00    	je     290da <JS_CallInternal+0x66da>
   2799d:	83 e8 01             	sub    eax,0x1
   279a0:	49 c7 45 08 00 00 00 	mov    QWORD PTR [r13+0x8],0x0
   279a7:	00 
   279a8:	49 89 45 00          	mov    QWORD PTR [r13+0x0],rax
   279ac:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
   279b2:	49 83 c4 02          	add    r12,0x2
   279b6:	49 89 c5             	mov    r13,rax
   279b9:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   279bd:	ff e0                	jmp    rax
   279bf:	f3 0f 1e fa          	endbr64
   279c3:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   279c7:	0b 53 e8             	or     edx,DWORD PTR [rbx-0x18]
   279ca:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
   279ce:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   279d2:	0f 85 81 2f 00 00    	jne    2a959 <JS_CallInternal+0x7f59>
   279d8:	d3 e0                	shl    eax,cl
   279da:	48 c7 43 e8 00 00 00 	mov    QWORD PTR [rbx-0x18],0x0
   279e1:	00 
   279e2:	48 83 eb 10          	sub    rbx,0x10
   279e6:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   279ea:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   279ef:	49 83 c4 01          	add    r12,0x1
   279f3:	49 89 c5             	mov    r13,rax
   279f6:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   279fa:	ff e0                	jmp    rax
   279fc:	f3 0f 1e fa          	endbr64
   27a00:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   27a04:	48 8b 53 f0          	mov    rdx,QWORD PTR [rbx-0x10]
   27a08:	a9 f7 ff ff ff       	test   eax,0xfffffff7
   27a0d:	74 1b                	je     27a2a <JS_CallInternal+0x502a>
   27a0f:	83 e8 01             	sub    eax,0x1
   27a12:	83 f8 01             	cmp    eax,0x1
   27a15:	0f 87 e6 24 00 00    	ja     29f01 <JS_CallInternal+0x7501>
   27a1b:	83 e2 ff             	and    edx,0xffffffff
   27a1e:	48 c7 43 f8 00 00 00 	mov    QWORD PTR [rbx-0x8],0x0
   27a25:	00 
   27a26:	48 89 53 f0          	mov    QWORD PTR [rbx-0x10],rdx
   27a2a:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27a2f:	49 83 c4 01          	add    r12,0x1
   27a33:	49 89 c5             	mov    r13,rax
   27a36:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27a3a:	ff e0                	jmp    rax
   27a3c:	f3 0f 1e fa          	endbr64
   27a40:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   27a44:	4c 8d 6b e0          	lea    r13,[rbx-0x20]
   27a48:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   27a4c:	83 fa f6             	cmp    edx,0xfffffff6
   27a4f:	76 11                	jbe    27a62 <JS_CallInternal+0x5062>
   27a51:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   27a54:	83 e8 01             	sub    eax,0x1
   27a57:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   27a5a:	85 c0                	test   eax,eax
   27a5c:	0f 8e fd 2c 00 00    	jle    2a75f <JS_CallInternal+0x7d5f>
   27a62:	48 8b 43 d8          	mov    rax,QWORD PTR [rbx-0x28]
   27a66:	48 83 eb 30          	sub    rbx,0x30
   27a6a:	83 f8 03             	cmp    eax,0x3
   27a6d:	74 45                	je     27ab4 <JS_CallInternal+0x50b4>
   27a6f:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   27a76:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
   27a79:	31 c9                	xor    ecx,ecx
   27a7b:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
   27a7f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   27a86:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   27a8a:	e8 71 8f 00 00       	call   30a00 <JS_IteratorClose>
   27a8f:	85 c0                	test   eax,eax
   27a91:	0f 85 d1 4a 00 00    	jne    2c568 <JS_CallInternal+0x9b68>
   27a97:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
   27a9b:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
   27a9e:	83 fa f6             	cmp    edx,0xfffffff6
   27aa1:	76 11                	jbe    27ab4 <JS_CallInternal+0x50b4>
   27aa3:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   27aa6:	83 e8 01             	sub    eax,0x1
   27aa9:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   27aac:	85 c0                	test   eax,eax
   27aae:	0f 8e bf 3f 00 00    	jle    2ba73 <JS_CallInternal+0x9073>
   27ab4:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27ab9:	49 83 c4 01          	add    r12,0x1
   27abd:	49 89 c5             	mov    r13,rax
   27ac0:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27ac4:	ff e0                	jmp    rax
   27ac6:	f3 0f 1e fa          	endbr64
   27aca:	83 7b f8 ff          	cmp    DWORD PTR [rbx-0x8],0xffffffff
   27ace:	0f 85 75 36 00 00    	jne    2b149 <JS_CallInternal+0x8749>
   27ad4:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27ad9:	49 83 c4 01          	add    r12,0x1
   27add:	49 89 c5             	mov    r13,rax
   27ae0:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27ae4:	ff e0                	jmp    rax
   27ae6:	f3 0f 1e fa          	endbr64
   27aea:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   27af1:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   27af8:	31 d2                	xor    edx,edx
   27afa:	48 89 de             	mov    rsi,rbx
   27afd:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   27b01:	e8 5a d7 06 00       	call   95260 <js_for_of_start>
   27b06:	85 c0                	test   eax,eax
   27b08:	0f 85 92 b6 ff ff    	jne    231a0 <JS_CallInternal+0x7a0>
   27b0e:	48 c7 43 10 00 00 00 	mov    QWORD PTR [rbx+0x10],0x0
   27b15:	00 
   27b16:	49 83 c4 01          	add    r12,0x1
   27b1a:	48 83 c3 20          	add    rbx,0x20
   27b1e:	48 c7 43 f8 05 00 00 	mov    QWORD PTR [rbx-0x8],0x5
   27b25:	00 
   27b26:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   27b2c:	49 89 c5             	mov    r13,rax
   27b2f:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27b33:	ff e0                	jmp    rax
   27b35:	f3 0f 1e fa          	endbr64
   27b39:	44 8b 43 f8          	mov    r8d,DWORD PTR [rbx-0x8]
   27b3d:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
   27b41:	45 85 c0             	test   r8d,r8d
   27b44:	0f 85 86 18 00 00    	jne    293d0 <JS_CallInternal+0x69d0>
   27b4a:	3d 00 00 00 80       	cmp    eax,0x80000000
   27b4f:	0f 84 7b 18 00 00    	je     293d0 <JS_CallInternal+0x69d0>
   27b55:	83 e8 01             	sub    eax,0x1
   27b58:	48 c7 43 08 00 00 00 	mov    QWORD PTR [rbx+0x8],0x0
   27b5f:	00 
   27b60:	48 89 03             	mov    QWORD PTR [rbx],rax
   27b63:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27b68:	48 83 c3 10          	add    rbx,0x10
   27b6c:	49 83 c4 01          	add    r12,0x1
   27b70:	49 89 c5             	mov    r13,rax
   27b73:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27b77:	ff e0                	jmp    rax
   27b79:	f3 0f 1e fa          	endbr64
   27b7d:	45 0f b6 2c 24       	movzx  r13d,BYTE PTR [r12]
   27b82:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   27b89:	4d 8d 4c 24 01       	lea    r9,[r12+0x1]
   27b8e:	4c 8b 73 f8          	mov    r14,QWORD PTR [rbx-0x8]
   27b92:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   27b96:	49 c1 e5 04          	shl    r13,0x4
   27b9a:	49 01 c5             	add    r13,rax
   27b9d:	44 89 f1             	mov    ecx,r14d
   27ba0:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
   27ba4:	09 d1                	or     ecx,edx
   27ba6:	0f 85 5f 37 00 00    	jne    2b30b <JS_CallInternal+0x890b>
   27bac:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   27bb0:	49 63 c8             	movsxd rcx,r8d
   27bb3:	48 63 d0             	movsxd rdx,eax
   27bb6:	44 01 c0             	add    eax,r8d
   27bb9:	48 01 ca             	add    rdx,rcx
   27bbc:	48 63 c8             	movsxd rcx,eax
   27bbf:	48 39 d1             	cmp    rcx,rdx
   27bc2:	0f 85 2a 37 00 00    	jne    2b2f2 <JS_CallInternal+0x88f2>
   27bc8:	89 c0                	mov    eax,eax
   27bca:	49 89 45 00          	mov    QWORD PTR [r13+0x0],rax
   27bce:	31 c0                	xor    eax,eax
   27bd0:	49 89 45 08          	mov    QWORD PTR [r13+0x8],rax
   27bd4:	48 83 eb 10          	sub    rbx,0x10
   27bd8:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
   27bde:	49 83 c4 02          	add    r12,0x2
   27be2:	49 89 c5             	mov    r13,rax
   27be5:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27be9:	ff e0                	jmp    rax
   27beb:	f3 0f 1e fa          	endbr64
   27bef:	48 8b 7b f8          	mov    rdi,QWORD PTR [rbx-0x8]
   27bf3:	4c 8b 5b e8          	mov    r11,QWORD PTR [rbx-0x18]
   27bf7:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   27bfb:	4c 8b 53 e0          	mov    r10,QWORD PTR [rbx-0x20]
   27bff:	41 89 fe             	mov    r14d,edi
   27c02:	4c 89 de             	mov    rsi,r11
   27c05:	48 89 f9             	mov    rcx,rdi
   27c08:	45 09 de             	or     r14d,r11d
   27c0b:	4c 89 c0             	mov    rax,r8
   27c0e:	0f 85 c6 37 00 00    	jne    2b3da <JS_CallInternal+0x89da>
   27c14:	49 63 ca             	movsxd rcx,r10d
   27c17:	49 63 f0             	movsxd rsi,r8d
   27c1a:	44 01 d0             	add    eax,r10d
   27c1d:	48 01 f1             	add    rcx,rsi
   27c20:	48 63 d0             	movsxd rdx,eax
   27c23:	48 39 ca             	cmp    rdx,rcx
   27c26:	0f 85 96 37 00 00    	jne    2b3c2 <JS_CallInternal+0x89c2>
   27c2c:	89 c0                	mov    eax,eax
   27c2e:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
   27c32:	31 c0                	xor    eax,eax
   27c34:	48 89 43 e8          	mov    QWORD PTR [rbx-0x18],rax
   27c38:	48 83 eb 10          	sub    rbx,0x10
   27c3c:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27c41:	49 83 c4 01          	add    r12,0x1
   27c45:	49 89 c5             	mov    r13,rax
   27c48:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27c4c:	ff e0                	jmp    rax
   27c4e:	f3 0f 1e fa          	endbr64
   27c52:	41 0f b6 3c 24       	movzx  edi,BYTE PTR [r12]
   27c57:	48 8b 8d c8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x138]
   27c5e:	4d 8d 6c 24 01       	lea    r13,[r12+0x1]
   27c63:	45 31 c9             	xor    r9d,r9d
   27c66:	89 fa                	mov    edx,edi
   27c68:	89 f8                	mov    eax,edi
   27c6a:	4c 89 69 30          	mov    QWORD PTR [rcx+0x30],r13
   27c6e:	c1 fa 02             	sar    edx,0x2
   27c71:	83 e0 03             	and    eax,0x3
   27c74:	83 e2 07             	and    edx,0x7
   27c77:	f7 d0                	not    eax
   27c79:	f7 d2                	not    edx
   27c7b:	48 98                	cdqe
   27c7d:	48 63 d2             	movsxd rdx,edx
   27c80:	48 c1 e0 04          	shl    rax,0x4
   27c84:	48 c1 e2 04          	shl    rdx,0x4
   27c88:	48 01 d8             	add    rax,rbx
   27c8b:	48 01 da             	add    rdx,rbx
   27c8e:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   27c91:	48 8b 0a             	mov    rcx,QWORD PTR [rdx]
   27c94:	4c 8b 42 08          	mov    r8,QWORD PTR [rdx+0x8]
   27c98:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   27c9c:	89 f8                	mov    eax,edi
   27c9e:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   27ca5:	c1 f8 05             	sar    eax,0x5
   27ca8:	f7 d0                	not    eax
   27caa:	48 98                	cdqe
   27cac:	48 c1 e0 04          	shl    rax,0x4
   27cb0:	ff 74 03 08          	push   QWORD PTR [rbx+rax*1+0x8]
   27cb4:	ff 34 03             	push   QWORD PTR [rbx+rax*1]
   27cb7:	e8 34 30 06 00       	call   8acf0 <JS_CopyDataProperties>
   27cbc:	41 5e                	pop    r14
   27cbe:	5a                   	pop    rdx
   27cbf:	85 c0                	test   eax,eax
   27cc1:	0f 85 82 47 00 00    	jne    2c449 <JS_CallInternal+0x9a49>
   27cc7:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
   27ccd:	49 83 c4 02          	add    r12,0x2
   27cd1:	49 89 c5             	mov    r13,rax
   27cd4:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27cd8:	ff e0                	jmp    rax
   27cda:	f3 0f 1e fa          	endbr64
   27cde:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   27ce5:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   27cec:	48 89 de             	mov    rsi,rbx
   27cef:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   27cf3:	e8 f8 26 07 00       	call   9a3f0 <js_append_enumerate>
   27cf8:	85 c0                	test   eax,eax
   27cfa:	0f 85 a0 b4 ff ff    	jne    231a0 <JS_CallInternal+0x7a0>
   27d00:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   27d04:	48 83 eb 10          	sub    rbx,0x10
   27d08:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
   27d0b:	83 fa f6             	cmp    edx,0xfffffff6
   27d0e:	76 11                	jbe    27d21 <JS_CallInternal+0x5321>
   27d10:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   27d13:	83 e8 01             	sub    eax,0x1
   27d16:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   27d19:	85 c0                	test   eax,eax
   27d1b:	0f 8e 18 23 00 00    	jle    2a039 <JS_CallInternal+0x7639>
   27d21:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   27d26:	49 83 c4 01          	add    r12,0x1
   27d2a:	49 89 c5             	mov    r13,rax
   27d2d:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27d31:	ff e0                	jmp    rax
   27d33:	f3 0f 1e fa          	endbr64
   27d37:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   27d3e:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   27d42:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
   27d46:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   27d4d:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   27d51:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   27d55:	e8 36 b6 01 00       	call   43390 <JS_ValueToAtom>
   27d5a:	41 89 c5             	mov    r13d,eax
   27d5d:	45 85 ed             	test   r13d,r13d
   27d60:	0f 84 3a b4 ff ff    	je     231a0 <JS_CallInternal+0x7a0>
   27d66:	48 83 ec 08          	sub    rsp,0x8
   27d6a:	4c 8d 53 e0          	lea    r10,[rbx-0x20]
   27d6e:	48 8d 43 d0          	lea    rax,[rbx-0x30]
   27d72:	4c 8b 43 d0          	mov    r8,QWORD PTR [rbx-0x30]
   27d76:	4c 89 95 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r10
   27d7d:	4c 8b 4b d8          	mov    r9,QWORD PTR [rbx-0x28]
   27d81:	44 89 e9             	mov    ecx,r13d
   27d84:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   27d88:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   27d8f:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   27d93:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   27d9a:	6a 00                	push   0x0
   27d9c:	e8 9f 4a 00 00       	call   2c840 <JS_GetPropertyInternal>
   27da1:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   27da8:	4c 8b 95 38 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c8]
   27daf:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
   27db6:	48 89 d0             	mov    rax,rdx
   27db9:	5a                   	pop    rdx
   27dba:	59                   	pop    rcx
   27dbb:	0f 8f 5f 1b 00 00    	jg     29920 <JS_CallInternal+0x6f20>
   27dc1:	83 f8 06             	cmp    eax,0x6
   27dc4:	0f 84 d6 b3 ff ff    	je     231a0 <JS_CallInternal+0x7a0>
   27dca:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   27dce:	49 8b 36             	mov    rsi,QWORD PTR [r14]
   27dd1:	83 fa f6             	cmp    edx,0xfffffff6
   27dd4:	76 11                	jbe    27de7 <JS_CallInternal+0x53e7>
   27dd6:	8b 4e fc             	mov    ecx,DWORD PTR [rsi-0x4]
   27dd9:	83 e9 01             	sub    ecx,0x1
   27ddc:	89 4e fc             	mov    DWORD PTR [rsi-0x4],ecx
   27ddf:	85 c9                	test   ecx,ecx
   27de1:	0f 8e c5 34 00 00    	jle    2b2ac <JS_CallInternal+0x88ac>
   27de7:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
   27deb:	49 8b 32             	mov    rsi,QWORD PTR [r10]
   27dee:	83 fa f6             	cmp    edx,0xfffffff6
   27df1:	76 11                	jbe    27e04 <JS_CallInternal+0x5404>
   27df3:	8b 4e fc             	mov    ecx,DWORD PTR [rsi-0x4]
   27df6:	83 e9 01             	sub    ecx,0x1
   27df9:	89 4e fc             	mov    DWORD PTR [rsi-0x4],ecx
   27dfc:	85 c9                	test   ecx,ecx
   27dfe:	0f 8e 46 34 00 00    	jle    2b24a <JS_CallInternal+0x884a>
   27e04:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   27e0b:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
   27e0f:	48 8b 31             	mov    rsi,QWORD PTR [rcx]
   27e12:	83 fa f6             	cmp    edx,0xfffffff6
   27e15:	76 11                	jbe    27e28 <JS_CallInternal+0x5428>
   27e17:	8b 4e fc             	mov    ecx,DWORD PTR [rsi-0x4]
   27e1a:	83 e9 01             	sub    ecx,0x1
   27e1d:	89 4e fc             	mov    DWORD PTR [rsi-0x4],ecx
   27e20:	85 c9                	test   ecx,ecx
   27e22:	0f 8e 53 34 00 00    	jle    2b27b <JS_CallInternal+0x887b>
   27e28:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   27e2f:	48 89 43 d8          	mov    QWORD PTR [rbx-0x28],rax
   27e33:	49 83 c4 01          	add    r12,0x1
   27e37:	48 89 4b d0          	mov    QWORD PTR [rbx-0x30],rcx
   27e3b:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   27e41:	4c 89 d3             	mov    rbx,r10
   27e44:	49 89 c5             	mov    r13,rax
   27e47:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27e4b:	ff e0                	jmp    rax
   27e4d:	f3 0f 1e fa          	endbr64
   27e51:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   27e58:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   27e5c:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   27e60:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   27e67:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   27e6b:	e8 20 b5 01 00       	call   43390 <JS_ValueToAtom>
   27e70:	41 89 c5             	mov    r13d,eax
   27e73:	45 85 ed             	test   r13d,r13d
   27e76:	0f 84 24 b3 ff ff    	je     231a0 <JS_CallInternal+0x7a0>
   27e7c:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   27e80:	83 fa 03             	cmp    edx,0x3
   27e83:	0f 84 5d 2b 00 00    	je     2a9e6 <JS_CallInternal+0x7fe6>
   27e89:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   27e8d:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   27e94:	44 89 e9             	mov    ecx,r13d
   27e97:	e8 14 5b 04 00       	call   6d9b0 <JS_HasProperty>
   27e9c:	85 c0                	test   eax,eax
   27e9e:	0f 8e e3 2a 00 00    	jle    2a987 <JS_CallInternal+0x7f87>
   27ea4:	48 83 ec 08          	sub    rsp,0x8
   27ea8:	4c 8b 43 e0          	mov    r8,QWORD PTR [rbx-0x20]
   27eac:	4c 8b 4b e8          	mov    r9,QWORD PTR [rbx-0x18]
   27eb0:	44 89 e9             	mov    ecx,r13d
   27eb3:	6a 00                	push   0x0
   27eb5:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   27ebc:	4c 89 c6             	mov    rsi,r8
   27ebf:	4c 89 ca             	mov    rdx,r9
   27ec2:	e8 79 49 00 00       	call   2c840 <JS_GetPropertyInternal>
   27ec7:	5e                   	pop    rsi
   27ec8:	5f                   	pop    rdi
   27ec9:	48 89 c1             	mov    rcx,rax
   27ecc:	49 89 d6             	mov    r14,rdx
   27ecf:	48 89 d0             	mov    rax,rdx
   27ed2:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   27ed9:	0f 8f 09 1e 00 00    	jg     29ce8 <JS_CallInternal+0x72e8>
   27edf:	41 83 fe 06          	cmp    r14d,0x6
   27ee3:	0f 84 b7 b2 ff ff    	je     231a0 <JS_CallInternal+0x7a0>
   27ee9:	48 89 0b             	mov    QWORD PTR [rbx],rcx
   27eec:	49 83 c4 01          	add    r12,0x1
   27ef0:	48 83 c3 10          	add    rbx,0x10
   27ef4:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
   27ef8:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   27efe:	49 89 c5             	mov    r13,rax
   27f01:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27f05:	ff e0                	jmp    rax
   27f07:	f3 0f 1e fa          	endbr64
   27f0b:	48 8b 43 e8          	mov    rax,QWORD PTR [rbx-0x18]
   27f0f:	4c 8b 6b f8          	mov    r13,QWORD PTR [rbx-0x8]
   27f13:	83 f8 ff             	cmp    eax,0xffffffff
   27f16:	0f 85 4a 2c 00 00    	jne    2ab66 <JS_CallInternal+0x8166>
   27f1c:	45 85 ed             	test   r13d,r13d
   27f1f:	0f 85 e4 1b 00 00    	jne    29b09 <JS_CallInternal+0x7109>
   27f25:	48 8b 53 e0          	mov    rdx,QWORD PTR [rbx-0x20]
   27f29:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
   27f2d:	66 83 7a 12 02       	cmp    WORD PTR [rdx+0x12],0x2
   27f32:	0f 85 36 1c 00 00    	jne    29b6e <JS_CallInternal+0x716e>
   27f38:	3b 42 38             	cmp    eax,DWORD PTR [rdx+0x38]
   27f3b:	0f 83 2d 1c 00 00    	jae    29b6e <JS_CallInternal+0x716e>
   27f41:	89 c0                	mov    eax,eax
   27f43:	48 c1 e0 04          	shl    rax,0x4
   27f47:	48 03 42 30          	add    rax,QWORD PTR [rdx+0x30]
   27f4b:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   27f4e:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   27f52:	83 f8 f6             	cmp    eax,0xfffffff6
   27f55:	76 04                	jbe    27f5b <JS_CallInternal+0x555b>
   27f57:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
   27f5b:	48 89 0b             	mov    QWORD PTR [rbx],rcx
   27f5e:	49 83 c4 01          	add    r12,0x1
   27f62:	48 83 c3 10          	add    rbx,0x10
   27f66:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
   27f6a:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   27f70:	49 89 c5             	mov    r13,rax
   27f73:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27f77:	ff e0                	jmp    rax
   27f79:	f3 0f 1e fa          	endbr64
   27f7d:	e9 92 af ff ff       	jmp    22f14 <JS_CallInternal+0x514>
   27f82:	f3 0f 1e fa          	endbr64
   27f86:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   27f8d:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
   27f92:	41 8b 34 24          	mov    esi,DWORD PTR [r12]
   27f96:	48 89 da             	mov    rdx,rbx
   27f99:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   27fa0:	4c 89 68 30          	mov    QWORD PTR [rax+0x30],r13
   27fa4:	e8 77 5b 04 00       	call   6db20 <JS_GetGlobalVarRef>
   27fa9:	85 c0                	test   eax,eax
   27fab:	0f 85 9e 3f 00 00    	jne    2bf4f <JS_CallInternal+0x954f>
   27fb1:	41 0f b6 44 24 04    	movzx  eax,BYTE PTR [r12+0x4]
   27fb7:	48 83 c3 20          	add    rbx,0x20
   27fbb:	49 83 c4 05          	add    r12,0x5
   27fbf:	49 89 c5             	mov    r13,rax
   27fc2:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   27fc6:	ff e0                	jmp    rax
   27fc8:	f3 0f 1e fa          	endbr64
   27fcc:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   27fd1:	48 8b 8d b0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x150]
   27fd8:	4d 8d 6c 24 02       	lea    r13,[r12+0x2]
   27fdd:	48 89 c2             	mov    rdx,rax
   27fe0:	48 c1 e0 04          	shl    rax,0x4
   27fe4:	48 01 c8             	add    rax,rcx
   27fe7:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
   27feb:	83 f9 04             	cmp    ecx,0x4
   27fee:	0f 84 89 34 00 00    	je     2b47d <JS_CallInternal+0x8a7d>
   27ff4:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   27ff8:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   27ffc:	83 fa f6             	cmp    edx,0xfffffff6
   27fff:	76 04                	jbe    28005 <JS_CallInternal+0x5605>
   28001:	83 46 fc 01          	add    DWORD PTR [rsi-0x4],0x1
   28005:	4c 8b 00             	mov    r8,QWORD PTR [rax]
   28008:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
   2800c:	48 89 30             	mov    QWORD PTR [rax],rsi
   2800f:	83 f9 f6             	cmp    ecx,0xfffffff6
   28012:	76 13                	jbe    28027 <JS_CallInternal+0x5627>
   28014:	41 8b 40 fc          	mov    eax,DWORD PTR [r8-0x4]
   28018:	83 e8 01             	sub    eax,0x1
   2801b:	41 89 40 fc          	mov    DWORD PTR [r8-0x4],eax
   2801f:	85 c0                	test   eax,eax
   28021:	0f 8e 5c 21 00 00    	jle    2a183 <JS_CallInternal+0x7783>
   28027:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
   2802d:	49 83 c4 03          	add    r12,0x3
   28031:	49 89 c5             	mov    r13,rax
   28034:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28038:	ff e0                	jmp    rax
   2803a:	f3 0f 1e fa          	endbr64
   2803e:	48 8d 43 e0          	lea    rax,[rbx-0x20]
   28042:	83 7b e8 ff          	cmp    DWORD PTR [rbx-0x18],0xffffffff
   28046:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
   2804a:	4c 8b 43 e0          	mov    r8,QWORD PTR [rbx-0x20]
   2804e:	4c 8b 6b f0          	mov    r13,QWORD PTR [rbx-0x10]
   28052:	4d 8b 4e 08          	mov    r9,QWORD PTR [r14+0x8]
   28056:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   2805d:	0f 85 6a 2f 00 00    	jne    2afcd <JS_CallInternal+0x85cd>
   28063:	41 83 f9 f8          	cmp    r9d,0xfffffff8
   28067:	0f 85 87 31 00 00    	jne    2b1f4 <JS_CallInternal+0x87f4>
   2806d:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   28074:	4c 89 ee             	mov    rsi,r13
   28077:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   2807e:	4c 89 8d 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r9
   28085:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
   28089:	48 89 c7             	mov    rdi,rax
   2808c:	48 89 85 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rax
   28093:	e8 88 ea fe ff       	call   16b20 <js_get_atom_index>
   28098:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
   2809f:	89 c2                	mov    edx,eax
   280a1:	49 8b 70 18          	mov    rsi,QWORD PTR [r8+0x18]
   280a5:	8b 4e 18             	mov    ecx,DWORD PTR [rsi+0x18]
   280a8:	21 c8                	and    eax,ecx
   280aa:	8b 44 86 38          	mov    eax,DWORD PTR [rsi+rax*4+0x38]
   280ae:	48 85 c0             	test   rax,rax
   280b1:	0f 84 8a 37 00 00    	je     2b841 <JS_CallInternal+0x8e41>
   280b7:	4c 8b 8d 38 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c8]
   280be:	48 8d 3c 8d 34 00 00 	lea    rdi,[rcx*4+0x34]
   280c5:	00 
   280c6:	48 8d 0c c7          	lea    rcx,[rdi+rax*8]
   280ca:	48 01 f1             	add    rcx,rsi
   280cd:	3b 51 04             	cmp    edx,DWORD PTR [rcx+0x4]
   280d0:	0f 85 5e 37 00 00    	jne    2b834 <JS_CallInternal+0x8e34>
   280d6:	49 8b 50 20          	mov    rdx,QWORD PTR [r8+0x20]
   280da:	48 c1 e0 04          	shl    rax,0x4
   280de:	48 8d 44 02 f0       	lea    rax,[rdx+rax*1-0x10]
   280e3:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   280e6:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   280ea:	83 f8 f6             	cmp    eax,0xfffffff6
   280ed:	76 04                	jbe    280f3 <JS_CallInternal+0x56f3>
   280ef:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   280f3:	48 89 d1             	mov    rcx,rdx
   280f6:	41 89 c0             	mov    r8d,eax
   280f9:	41 83 f9 f6          	cmp    r9d,0xfffffff6
   280fd:	76 13                	jbe    28112 <JS_CallInternal+0x5712>
   280ff:	41 8b 7d fc          	mov    edi,DWORD PTR [r13-0x4]
   28103:	8d 57 ff             	lea    edx,[rdi-0x1]
   28106:	41 89 55 fc          	mov    DWORD PTR [r13-0x4],edx
   2810a:	85 d2                	test   edx,edx
   2810c:	0f 8e 20 25 00 00    	jle    2a632 <JS_CallInternal+0x7c32>
   28112:	48 8b bd 50 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x1b0]
   28119:	48 8b 57 08          	mov    rdx,QWORD PTR [rdi+0x8]
   2811d:	48 8b 37             	mov    rsi,QWORD PTR [rdi]
   28120:	83 fa f6             	cmp    edx,0xfffffff6
   28123:	76 11                	jbe    28136 <JS_CallInternal+0x5736>
   28125:	8b 7e fc             	mov    edi,DWORD PTR [rsi-0x4]
   28128:	83 ef 01             	sub    edi,0x1
   2812b:	89 7e fc             	mov    DWORD PTR [rsi-0x4],edi
   2812e:	85 ff                	test   edi,edi
   28130:	0f 8e 82 24 00 00    	jle    2a5b8 <JS_CallInternal+0x7bb8>
   28136:	48 89 4b e0          	mov    QWORD PTR [rbx-0x20],rcx
   2813a:	48 89 43 e8          	mov    QWORD PTR [rbx-0x18],rax
   2813e:	4c 89 f3             	mov    rbx,r14
   28141:	41 83 f8 06          	cmp    r8d,0x6
   28145:	0f 84 55 b0 ff ff    	je     231a0 <JS_CallInternal+0x7a0>
   2814b:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   28150:	49 83 c4 01          	add    r12,0x1
   28154:	49 89 c5             	mov    r13,rax
   28157:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2815b:	ff e0                	jmp    rax
   2815d:	f3 0f 1e fa          	endbr64
   28161:	41 8b 34 24          	mov    esi,DWORD PTR [r12]
   28165:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2816c:	4d 8d 6c 24 04       	lea    r13,[r12+0x4]
   28171:	e8 2a b4 00 00       	call   335a0 <JS_NewSymbolFromAtom.constprop.0>
   28176:	83 fa 06             	cmp    edx,0x6
   28179:	0f 84 9f 30 00 00    	je     2b21e <JS_CallInternal+0x881e>
   2817f:	48 89 03             	mov    QWORD PTR [rbx],rax
   28182:	49 83 c4 05          	add    r12,0x5
   28186:	48 83 c3 10          	add    rbx,0x10
   2818a:	48 89 53 f8          	mov    QWORD PTR [rbx-0x8],rdx
   2818e:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   28194:	49 89 c5             	mov    r13,rax
   28197:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2819b:	ff e0                	jmp    rax
   2819d:	f3 0f 1e fa          	endbr64
   281a1:	4c 8b 73 e8          	mov    r14,QWORD PTR [rbx-0x18]
   281a5:	41 8b 0c 24          	mov    ecx,DWORD PTR [r12]
   281a9:	4d 8d 54 24 04       	lea    r10,[r12+0x4]
   281ae:	48 8b 43 e0          	mov    rax,QWORD PTR [rbx-0x20]
   281b2:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   281b6:	4c 8b 6b e0          	mov    r13,QWORD PTR [rbx-0x20]
   281ba:	41 83 fe ff          	cmp    r14d,0xffffffff
   281be:	0f 85 44 14 00 00    	jne    29608 <JS_CallInternal+0x6c08>
   281c4:	4d 8b 4d 18          	mov    r9,QWORD PTR [r13+0x18]
   281c8:	41 8b 79 18          	mov    edi,DWORD PTR [r9+0x18]
   281cc:	89 fe                	mov    esi,edi
   281ce:	21 ce                	and    esi,ecx
   281d0:	41 8b 74 b1 38       	mov    esi,DWORD PTR [r9+rsi*4+0x38]
   281d5:	48 85 f6             	test   rsi,rsi
   281d8:	0f 84 2a 14 00 00    	je     29608 <JS_CallInternal+0x6c08>
   281de:	48 8d 3c bd 34 00 00 	lea    rdi,[rdi*4+0x34]
   281e5:	00 
   281e6:	4c 8d 04 f7          	lea    r8,[rdi+rsi*8]
   281ea:	4d 01 c8             	add    r8,r9
   281ed:	41 39 48 04          	cmp    DWORD PTR [r8+0x4],ecx
   281f1:	0f 85 02 14 00 00    	jne    295f9 <JS_CallInternal+0x6bf9>
   281f7:	49 8b 7d 20          	mov    rdi,QWORD PTR [r13+0x20]
   281fb:	48 c1 e6 04          	shl    rsi,0x4
   281ff:	48 8d 7c 37 f0       	lea    rdi,[rdi+rsi*1-0x10]
   28204:	41 0f b6 70 03       	movzx  esi,BYTE PTR [r8+0x3]
   28209:	40 c0 ee 02          	shr    sil,0x2
   2820d:	83 e6 3a             	and    esi,0x3a
   28210:	40 80 fe 02          	cmp    sil,0x2
   28214:	0f 85 ee 13 00 00    	jne    29608 <JS_CallInternal+0x6c08>
   2821a:	48 8b 57 08          	mov    rdx,QWORD PTR [rdi+0x8]
   2821e:	f3 0f 6f 73 f0       	movdqu xmm6,XMMWORD PTR [rbx-0x10]
   28223:	48 8b 37             	mov    rsi,QWORD PTR [rdi]
   28226:	0f 11 37             	movups XMMWORD PTR [rdi],xmm6
   28229:	83 fa f6             	cmp    edx,0xfffffff6
   2822c:	76 11                	jbe    2823f <JS_CallInternal+0x583f>
   2822e:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   28231:	83 e8 01             	sub    eax,0x1
   28234:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   28237:	85 c0                	test   eax,eax
   28239:	0f 8e ce 34 00 00    	jle    2b70d <JS_CallInternal+0x8d0d>
   2823f:	41 83 fe f6          	cmp    r14d,0xfffffff6
   28243:	76 13                	jbe    28258 <JS_CallInternal+0x5858>
   28245:	41 8b 45 fc          	mov    eax,DWORD PTR [r13-0x4]
   28249:	83 e8 01             	sub    eax,0x1
   2824c:	41 89 45 fc          	mov    DWORD PTR [r13-0x4],eax
   28250:	85 c0                	test   eax,eax
   28252:	0f 8e ca 34 00 00    	jle    2b722 <JS_CallInternal+0x8d22>
   28258:	48 83 eb 20          	sub    rbx,0x20
   2825c:	41 0f b6 44 24 04    	movzx  eax,BYTE PTR [r12+0x4]
   28262:	49 83 c4 05          	add    r12,0x5
   28266:	49 89 c5             	mov    r13,rax
   28269:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2826d:	ff e0                	jmp    rax
   2826f:	f3 0f 1e fa          	endbr64
   28273:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2827a:	48 8b 4b d0          	mov    rcx,QWORD PTR [rbx-0x30]
   2827e:	45 31 c9             	xor    r9d,r9d
   28281:	48 c7 85 e0 fd ff ff 	mov    QWORD PTR [rbp-0x220],0x0
   28288:	00 00 00 00 
   2828c:	48 c7 85 e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],0x3
   28293:	03 00 00 00 
   28297:	4c 8b 43 d8          	mov    r8,QWORD PTR [rbx-0x28]
   2829b:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   2829f:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   282a3:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   282a7:	48 c7 43 f0 00 00 00 	mov    QWORD PTR [rbx-0x10],0x0
   282ae:	00 
   282af:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   282b6:	48 c7 43 f8 03 00 00 	mov    QWORD PTR [rbx-0x8],0x3
   282bd:	00 
   282be:	6a 02                	push   0x2
   282c0:	6a 00                	push   0x0
   282c2:	ff b5 e8 fd ff ff    	push   QWORD PTR [rbp-0x218]
   282c8:	ff b5 e0 fd ff ff    	push   QWORD PTR [rbp-0x220]
   282ce:	e8 2d a7 ff ff       	call   22a00 <JS_CallInternal>
   282d3:	48 83 c4 20          	add    rsp,0x20
   282d7:	83 fa 06             	cmp    edx,0x6
   282da:	0f 84 c0 ae ff ff    	je     231a0 <JS_CallInternal+0x7a0>
   282e0:	48 89 03             	mov    QWORD PTR [rbx],rax
   282e3:	49 83 c4 01          	add    r12,0x1
   282e7:	48 83 c3 10          	add    rbx,0x10
   282eb:	48 89 53 f8          	mov    QWORD PTR [rbx-0x8],rdx
   282ef:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   282f5:	49 89 c5             	mov    r13,rax
   282f8:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   282fc:	ff e0                	jmp    rax
   282fe:	f3 0f 1e fa          	endbr64
   28302:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   28309:	41 0f b6 0c 24       	movzx  ecx,BYTE PTR [r12]
   2830e:	4d 8d 74 24 01       	lea    r14,[r12+0x1]
   28313:	c7 85 f0 fe ff ff 01 	mov    DWORD PTR [rbp-0x110],0x1
   2831a:	00 00 00 
   2831d:	4c 89 70 30          	mov    QWORD PTR [rax+0x30],r14
   28321:	b8 fd ff ff ff       	mov    eax,0xfffffffd
   28326:	29 c8                	sub    eax,ecx
   28328:	48 98                	cdqe
   2832a:	48 c1 e0 04          	shl    rax,0x4
   2832e:	4c 8d 2c 03          	lea    r13,[rbx+rax*1]
   28332:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
   28336:	83 fa 03             	cmp    edx,0x3
   28339:	0f 84 d8 29 00 00    	je     2ad17 <JS_CallInternal+0x8317>
   2833f:	b8 fe ff ff ff       	mov    eax,0xfffffffe
   28344:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
   28348:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2834f:	4c 8d 8d f0 fe ff ff 	lea    r9,[rbp-0x110]
   28356:	29 c8                	sub    eax,ecx
   28358:	48 98                	cdqe
   2835a:	48 c1 e0 04          	shl    rax,0x4
   2835e:	48 01 d8             	add    rax,rbx
   28361:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   28364:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   28368:	e8 e3 e5 06 00       	call   96950 <JS_IteratorNext.constprop.0>
   2836d:	49 89 d1             	mov    r9,rdx
   28370:	48 89 c7             	mov    rdi,rax
   28373:	48 89 d6             	mov    rsi,rdx
   28376:	83 fa 06             	cmp    edx,0x6
   28379:	0f 84 12 17 00 00    	je     29a91 <JS_CallInternal+0x7091>
   2837f:	8b 8d f0 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x110]
   28385:	31 d2                	xor    edx,edx
   28387:	85 c9                	test   ecx,ecx
   28389:	0f 85 11 17 00 00    	jne    29aa0 <JS_CallInternal+0x70a0>
   2838f:	48 89 3b             	mov    QWORD PTR [rbx],rdi
   28392:	49 83 c4 02          	add    r12,0x2
   28396:	48 83 c3 20          	add    rbx,0x20
   2839a:	48 89 73 e8          	mov    QWORD PTR [rbx-0x18],rsi
   2839e:	48 89 53 f0          	mov    QWORD PTR [rbx-0x10],rdx
   283a2:	48 c7 43 f8 01 00 00 	mov    QWORD PTR [rbx-0x8],0x1
   283a9:	00 
   283aa:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   283b0:	49 89 c5             	mov    r13,rax
   283b3:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   283b7:	ff e0                	jmp    rax
   283b9:	f3 0f 1e fa          	endbr64
   283bd:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   283c4:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   283c8:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   283cc:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   283d3:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   283d7:	e8 14 4b 04 00       	call   6cef0 <build_for_in_iterator>
   283dc:	48 89 53 f8          	mov    QWORD PTR [rbx-0x8],rdx
   283e0:	83 7b f8 06          	cmp    DWORD PTR [rbx-0x8],0x6
   283e4:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   283e8:	0f 84 b2 ad ff ff    	je     231a0 <JS_CallInternal+0x7a0>
   283ee:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   283f3:	49 83 c4 01          	add    r12,0x1
   283f7:	49 89 c5             	mov    r13,rax
   283fa:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   283fe:	ff e0                	jmp    rax
   28400:	f3 0f 1e fa          	endbr64
   28404:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2840b:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   28412:	48 89 de             	mov    rsi,rbx
   28415:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   28419:	e8 72 4d 04 00       	call   6d190 <js_for_in_next>
   2841e:	85 c0                	test   eax,eax
   28420:	0f 85 7a ad ff ff    	jne    231a0 <JS_CallInternal+0x7a0>
   28426:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   2842b:	48 83 c3 20          	add    rbx,0x20
   2842f:	49 83 c4 01          	add    r12,0x1
   28433:	49 89 c5             	mov    r13,rax
   28436:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2843a:	ff e0                	jmp    rax
   2843c:	f3 0f 1e fa          	endbr64
   28440:	44 8b 6b f8          	mov    r13d,DWORD PTR [rbx-0x8]
   28444:	48 8b 43 f0          	mov    rax,QWORD PTR [rbx-0x10]
   28448:	45 85 ed             	test   r13d,r13d
   2844b:	0f 85 f3 1a 00 00    	jne    29f44 <JS_CallInternal+0x7544>
   28451:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   28458:	3b 41 20             	cmp    eax,DWORD PTR [rcx+0x20]
   2845b:	0f 83 e3 1a 00 00    	jae    29f44 <JS_CallInternal+0x7544>
   28461:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   28468:	89 c0                	mov    eax,eax
   2846a:	48 83 eb 10          	sub    rbx,0x10
   2846e:	48 03 41 18          	add    rax,QWORD PTR [rcx+0x18]
   28472:	4c 8d 60 01          	lea    r12,[rax+0x1]
   28476:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   28479:	49 89 c5             	mov    r13,rax
   2847c:	41 ff 24 c7          	jmp    QWORD PTR [r15+rax*8]
   28480:	f3 0f 1e fa          	endbr64
   28484:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   28489:	48 8b 8d b0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x150]
   28490:	4d 8d 6c 24 02       	lea    r13,[r12+0x2]
   28495:	48 c1 e0 04          	shl    rax,0x4
   28499:	48 01 c8             	add    rax,rcx
   2849c:	83 78 08 04          	cmp    DWORD PTR [rax+0x8],0x4
   284a0:	0f 85 1a 27 00 00    	jne    2abc0 <JS_CallInternal+0x81c0>
   284a6:	f3 0f 6f 4b f0       	movdqu xmm1,XMMWORD PTR [rbx-0x10]
   284ab:	49 83 c4 03          	add    r12,0x3
   284af:	48 83 eb 10          	sub    rbx,0x10
   284b3:	0f 11 08             	movups XMMWORD PTR [rax],xmm1
   284b6:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   284bc:	49 89 c5             	mov    r13,rax
   284bf:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   284c3:	ff e0                	jmp    rax
   284c5:	f3 0f 1e fa          	endbr64
   284c9:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   284d0:	83 7b d8 ff          	cmp    DWORD PTR [rbx-0x28],0xffffffff
   284d4:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   284d8:	0f 85 64 3b 00 00    	jne    2c042 <JS_CallInternal+0x9642>
   284de:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   284e2:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   284e9:	4c 8d 73 e0          	lea    r14,[rbx-0x20]
   284ed:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   284f1:	e8 9a ae 01 00       	call   43390 <JS_ValueToAtom>
   284f6:	41 89 c5             	mov    r13d,eax
   284f9:	45 85 ed             	test   r13d,r13d
   284fc:	0f 84 9e ac ff ff    	je     231a0 <JS_CallInternal+0x7a0>
   28502:	48 83 ec 08          	sub    rsp,0x8
   28506:	4c 8d 53 d0          	lea    r10,[rbx-0x30]
   2850a:	48 8d 43 c0          	lea    rax,[rbx-0x40]
   2850e:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   28512:	4c 89 95 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r10
   28519:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   2851d:	44 89 e9             	mov    ecx,r13d
   28520:	48 8b 73 d0          	mov    rsi,QWORD PTR [rbx-0x30]
   28524:	48 8b 53 d8          	mov    rdx,QWORD PTR [rbx-0x28]
   28528:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   2852f:	68 00 80 00 00       	push   0x8000
   28534:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2853b:	ff 73 c8             	push   QWORD PTR [rbx-0x38]
   2853e:	ff 73 c0             	push   QWORD PTR [rbx-0x40]
   28541:	e8 2a 50 00 00       	call   2d570 <JS_SetPropertyInternal>
   28546:	48 83 c4 20          	add    rsp,0x20
   2854a:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   28551:	4c 8b 95 40 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c0]
   28558:	89 c3                	mov    ebx,eax
   2855a:	0f 8f f9 14 00 00    	jg     29a59 <JS_CallInternal+0x7059>
   28560:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   28567:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   2856b:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   2856e:	83 fa f6             	cmp    edx,0xfffffff6
   28571:	76 11                	jbe    28584 <JS_CallInternal+0x5b84>
   28573:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   28576:	83 e8 01             	sub    eax,0x1
   28579:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2857c:	85 c0                	test   eax,eax
   2857e:	0f 8e 73 20 00 00    	jle    2a5f7 <JS_CallInternal+0x7bf7>
   28584:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
   28588:	49 8b 32             	mov    rsi,QWORD PTR [r10]
   2858b:	83 fa f6             	cmp    edx,0xfffffff6
   2858e:	76 11                	jbe    285a1 <JS_CallInternal+0x5ba1>
   28590:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   28593:	83 e8 01             	sub    eax,0x1
   28596:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   28599:	85 c0                	test   eax,eax
   2859b:	0f 8e 37 21 00 00    	jle    2a6d8 <JS_CallInternal+0x7cd8>
   285a1:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   285a5:	49 8b 36             	mov    rsi,QWORD PTR [r14]
   285a8:	83 fa f6             	cmp    edx,0xfffffff6
   285ab:	76 11                	jbe    285be <JS_CallInternal+0x5bbe>
   285ad:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   285b0:	83 e8 01             	sub    eax,0x1
   285b3:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   285b6:	85 c0                	test   eax,eax
   285b8:	0f 8e 2f 21 00 00    	jle    2a6ed <JS_CallInternal+0x7ced>
   285be:	85 db                	test   ebx,ebx
   285c0:	0f 88 91 39 00 00    	js     2bf57 <JS_CallInternal+0x9557>
   285c6:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   285cb:	48 8b 9d 50 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1b0]
   285d2:	49 83 c4 01          	add    r12,0x1
   285d6:	49 89 c5             	mov    r13,rax
   285d9:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   285dd:	ff e0                	jmp    rax
   285df:	f3 0f 1e fa          	endbr64
   285e3:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   285e8:	48 8b 8d b0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x150]
   285ef:	4d 8d 6c 24 02       	lea    r13,[r12+0x2]
   285f4:	48 89 c2             	mov    rdx,rax
   285f7:	48 c1 e0 04          	shl    rax,0x4
   285fb:	48 01 c8             	add    rax,rcx
   285fe:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
   28602:	83 f9 04             	cmp    ecx,0x4
   28605:	0f 84 d2 25 00 00    	je     2abdd <JS_CallInternal+0x81dd>
   2860b:	f3 0f 6f 5b f0       	movdqu xmm3,XMMWORD PTR [rbx-0x10]
   28610:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   28613:	0f 11 18             	movups XMMWORD PTR [rax],xmm3
   28616:	83 f9 f6             	cmp    ecx,0xfffffff6
   28619:	76 11                	jbe    2862c <JS_CallInternal+0x5c2c>
   2861b:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2861e:	83 e8 01             	sub    eax,0x1
   28621:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   28624:	85 c0                	test   eax,eax
   28626:	0f 8e d6 20 00 00    	jle    2a702 <JS_CallInternal+0x7d02>
   2862c:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
   28632:	48 83 eb 10          	sub    rbx,0x10
   28636:	49 83 c4 03          	add    r12,0x3
   2863a:	49 89 c5             	mov    r13,rax
   2863d:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28641:	ff e0                	jmp    rax
   28643:	f3 0f 1e fa          	endbr64
   28647:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2864e:	4c 8b 6b f8          	mov    r13,QWORD PTR [rbx-0x8]
   28652:	4c 8b 73 f0          	mov    r14,QWORD PTR [rbx-0x10]
   28656:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   2865a:	41 83 fd ff          	cmp    r13d,0xffffffff
   2865e:	0f 84 ec 0b 00 00    	je     29250 <JS_CallInternal+0x6850>
   28664:	41 83 fd 02          	cmp    r13d,0x2
   28668:	0f 84 e2 0b 00 00    	je     29250 <JS_CallInternal+0x6850>
   2866e:	41 83 fd f6          	cmp    r13d,0xfffffff6
   28672:	76 13                	jbe    28687 <JS_CallInternal+0x5c87>
   28674:	41 8b 46 fc          	mov    eax,DWORD PTR [r14-0x4]
   28678:	83 e8 01             	sub    eax,0x1
   2867b:	41 89 46 fc          	mov    DWORD PTR [r14-0x4],eax
   2867f:	85 c0                	test   eax,eax
   28681:	0f 8e 93 20 00 00    	jle    2a71a <JS_CallInternal+0x7d1a>
   28687:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   2868c:	48 83 eb 10          	sub    rbx,0x10
   28690:	49 83 c4 01          	add    r12,0x1
   28694:	49 89 c5             	mov    r13,rax
   28697:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2869b:	ff e0                	jmp    rax
   2869d:	f3 0f 1e fa          	endbr64
   286a1:	48 8b 4b e0          	mov    rcx,QWORD PTR [rbx-0x20]
   286a5:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   286a9:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   286ad:	4c 8b 43 e8          	mov    r8,QWORD PTR [rbx-0x18]
   286b1:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   286b8:	e8 53 b0 01 00       	call   43710 <JS_DefineObjectNameComputed.constprop.0>
   286bd:	85 c0                	test   eax,eax
   286bf:	0f 88 db aa ff ff    	js     231a0 <JS_CallInternal+0x7a0>
   286c5:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   286ca:	49 83 c4 01          	add    r12,0x1
   286ce:	49 89 c5             	mov    r13,rax
   286d1:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   286d5:	ff e0                	jmp    rax
   286d7:	f3 0f 1e fa          	endbr64
   286db:	48 8b 4b e0          	mov    rcx,QWORD PTR [rbx-0x20]
   286df:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   286e3:	49 83 c4 01          	add    r12,0x1
   286e7:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   286eb:	4c 8b 43 e8          	mov    r8,QWORD PTR [rbx-0x18]
   286ef:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   286f6:	e8 f5 59 ff ff       	call   1e0f0 <js_method_set_home_object>
   286fb:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   28701:	49 89 c5             	mov    r13,rax
   28704:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28708:	ff e0                	jmp    rax
   2870a:	f3 0f 1e fa          	endbr64
   2870e:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
   28712:	83 7b d8 ff          	cmp    DWORD PTR [rbx-0x28],0xffffffff
   28716:	4c 8d 73 e0          	lea    r14,[rbx-0x20]
   2871a:	4c 8b 43 d0          	mov    r8,QWORD PTR [rbx-0x30]
   2871e:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   28722:	4c 8b 6b f0          	mov    r13,QWORD PTR [rbx-0x10]
   28726:	49 8b 46 08          	mov    rax,QWORD PTR [r14+0x8]
   2872a:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   28731:	0f 85 d3 21 00 00    	jne    2a90a <JS_CallInternal+0x7f0a>
   28737:	83 f8 f8             	cmp    eax,0xfffffff8
   2873a:	0f 85 b0 21 00 00    	jne    2a8f0 <JS_CallInternal+0x7ef0>
   28740:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   28747:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   2874e:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   28752:	e8 c9 e3 fe ff       	call   16b20 <js_get_atom_index>
   28757:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
   2875e:	89 c6                	mov    esi,eax
   28760:	49 8b 48 18          	mov    rcx,QWORD PTR [r8+0x18]
   28764:	89 f2                	mov    edx,esi
   28766:	8b 41 18             	mov    eax,DWORD PTR [rcx+0x18]
   28769:	21 c2                	and    edx,eax
   2876b:	8b 54 91 38          	mov    edx,DWORD PTR [rcx+rdx*4+0x38]
   2876f:	48 85 d2             	test   rdx,rdx
   28772:	0f 84 ba 06 00 00    	je     28e32 <JS_CallInternal+0x6432>
   28778:	48 8d 3c 85 34 00 00 	lea    rdi,[rax*4+0x34]
   2877f:	00 
   28780:	48 8d 04 d7          	lea    rax,[rdi+rdx*8]
   28784:	48 01 c8             	add    rax,rcx
   28787:	3b 70 04             	cmp    esi,DWORD PTR [rax+0x4]
   2878a:	0f 85 94 06 00 00    	jne    28e24 <JS_CallInternal+0x6424>
   28790:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   28797:	48 8d 0d a6 39 0a 00 	lea    rcx,[rip+0xa39a6]        # cc144 <_IO_stdin_used+0x144>
   2879e:	48 8d 15 73 76 0a 00 	lea    rdx,[rip+0xa7673]        # cfe18 <_IO_stdin_used+0x3e18>
   287a5:	31 c0                	xor    eax,eax
   287a7:	e8 14 81 00 00       	call   308c0 <__JS_ThrowTypeErrorAtom>
   287ac:	83 bd 50 fe ff ff f6 	cmp    DWORD PTR [rbp-0x1b0],0xfffffff6
   287b3:	76 13                	jbe    287c8 <JS_CallInternal+0x5dc8>
   287b5:	41 8b 45 fc          	mov    eax,DWORD PTR [r13-0x4]
   287b9:	83 e8 01             	sub    eax,0x1
   287bc:	41 89 45 fc          	mov    DWORD PTR [r13-0x4],eax
   287c0:	85 c0                	test   eax,eax
   287c2:	0f 8e 74 36 00 00    	jle    2be3c <JS_CallInternal+0x943c>
   287c8:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   287cc:	49 8b 36             	mov    rsi,QWORD PTR [r14]
   287cf:	4c 89 f3             	mov    rbx,r14
   287d2:	83 fa f6             	cmp    edx,0xfffffff6
   287d5:	0f 86 c5 a9 ff ff    	jbe    231a0 <JS_CallInternal+0x7a0>
   287db:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   287de:	83 e8 01             	sub    eax,0x1
   287e1:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   287e4:	85 c0                	test   eax,eax
   287e6:	0f 8f b4 a9 ff ff    	jg     231a0 <JS_CallInternal+0x7a0>
   287ec:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   287f3:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   287f7:	e8 74 40 ff ff       	call   1c870 <__JS_FreeValueRT>
   287fc:	e9 9f a9 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   28801:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   28808:	f3 0f 1e fa          	endbr64
   2880c:	48 8d 43 e0          	lea    rax,[rbx-0x20]
   28810:	4c 8d 73 f0          	lea    r14,[rbx-0x10]
   28814:	4c 8b 28             	mov    r13,QWORD PTR [rax]
   28817:	48 83 eb 30          	sub    rbx,0x30
   2881b:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   2881f:	83 7b 08 ff          	cmp    DWORD PTR [rbx+0x8],0xffffffff
   28823:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
   28826:	49 8b 36             	mov    rsi,QWORD PTR [r14]
   28829:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   28830:	49 8b 4e 08          	mov    rcx,QWORD PTR [r14+0x8]
   28834:	0f 85 fc 23 00 00    	jne    2ac36 <JS_CallInternal+0x8236>
   2883a:	83 f9 f8             	cmp    ecx,0xfffffff8
   2883d:	0f 85 b7 23 00 00    	jne    2abfa <JS_CallInternal+0x81fa>
   28843:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2884a:	48 89 95 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rdx
   28851:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
   28855:	48 89 c7             	mov    rdi,rax
   28858:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
   2885f:	e8 bc e2 fe ff       	call   16b20 <js_get_atom_index>
   28864:	48 8b 95 40 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c0]
   2886b:	89 c6                	mov    esi,eax
   2886d:	48 8b 7a 18          	mov    rdi,QWORD PTR [rdx+0x18]
   28871:	8b 4f 18             	mov    ecx,DWORD PTR [rdi+0x18]
   28874:	21 c8                	and    eax,ecx
   28876:	8b 44 87 38          	mov    eax,DWORD PTR [rdi+rax*4+0x38]
   2887a:	48 85 c0             	test   rax,rax
   2887d:	0f 84 fa 2e 00 00    	je     2b77d <JS_CallInternal+0x8d7d>
   28883:	4c 8d 04 8d 34 00 00 	lea    r8,[rcx*4+0x34]
   2888a:	00 
   2888b:	49 8d 0c c0          	lea    rcx,[r8+rax*8]
   2888f:	48 01 f9             	add    rcx,rdi
   28892:	3b 71 04             	cmp    esi,DWORD PTR [rcx+0x4]
   28895:	0f 85 d5 2e 00 00    	jne    2b770 <JS_CallInternal+0x8d70>
   2889b:	48 8b 52 20          	mov    rdx,QWORD PTR [rdx+0x20]
   2889f:	48 c1 e0 04          	shl    rax,0x4
   288a3:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   288aa:	48 8d 44 02 f0       	lea    rax,[rdx+rax*1-0x10]
   288af:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   288b3:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   288b6:	48 89 48 08          	mov    QWORD PTR [rax+0x8],rcx
   288ba:	4c 89 28             	mov    QWORD PTR [rax],r13
   288bd:	83 fa f6             	cmp    edx,0xfffffff6
   288c0:	76 11                	jbe    288d3 <JS_CallInternal+0x5ed3>
   288c2:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   288c5:	83 e8 01             	sub    eax,0x1
   288c8:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   288cb:	85 c0                	test   eax,eax
   288cd:	0f 8e 7a 23 00 00    	jle    2ac4d <JS_CallInternal+0x824d>
   288d3:	45 31 ed             	xor    r13d,r13d
   288d6:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
   288da:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
   288dd:	83 fa f6             	cmp    edx,0xfffffff6
   288e0:	76 11                	jbe    288f3 <JS_CallInternal+0x5ef3>
   288e2:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   288e5:	83 e8 01             	sub    eax,0x1
   288e8:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   288eb:	85 c0                	test   eax,eax
   288ed:	0f 8e bb 1d 00 00    	jle    2a6ae <JS_CallInternal+0x7cae>
   288f3:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   288f7:	49 8b 36             	mov    rsi,QWORD PTR [r14]
   288fa:	83 fa f6             	cmp    edx,0xfffffff6
   288fd:	76 11                	jbe    28910 <JS_CallInternal+0x5f10>
   288ff:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   28902:	83 e8 01             	sub    eax,0x1
   28905:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   28908:	85 c0                	test   eax,eax
   2890a:	0f 8e b3 1d 00 00    	jle    2a6c3 <JS_CallInternal+0x7cc3>
   28910:	41 83 fd ff          	cmp    r13d,0xffffffff
   28914:	0f 84 86 a8 ff ff    	je     231a0 <JS_CallInternal+0x7a0>
   2891a:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   2891f:	49 83 c4 01          	add    r12,0x1
   28923:	49 89 c5             	mov    r13,rax
   28926:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   2892a:	ff e0                	jmp    rax
   2892c:	f3 0f 1e fa          	endbr64
   28930:	48 8b 7b f8          	mov    rdi,QWORD PTR [rbx-0x8]
   28934:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   28938:	83 ff ff             	cmp    edi,0xffffffff
   2893b:	0f 85 b7 05 00 00    	jne    28ef8 <JS_CallInternal+0x64f8>
   28941:	48 89 f1             	mov    rcx,rsi
   28944:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   28948:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
   2894c:	8b 42 18             	mov    eax,DWORD PTR [rdx+0x18]
   2894f:	41 89 c0             	mov    r8d,eax
   28952:	41 83 e0 32          	and    r8d,0x32
   28956:	46 8b 44 82 38       	mov    r8d,DWORD PTR [rdx+r8*4+0x38]
   2895b:	4d 85 c0             	test   r8,r8
   2895e:	0f 84 ff 00 00 00    	je     28a63 <JS_CallInternal+0x6063>
   28964:	4c 8d 0c 85 34 00 00 	lea    r9,[rax*4+0x34]
   2896b:	00 
   2896c:	4b 8d 04 c1          	lea    rax,[r9+r8*8]
   28970:	48 01 d0             	add    rax,rdx
   28973:	83 78 04 32          	cmp    DWORD PTR [rax+0x4],0x32
   28977:	0f 85 d6 00 00 00    	jne    28a53 <JS_CallInternal+0x6053>
   2897d:	80 78 03 3f          	cmp    BYTE PTR [rax+0x3],0x3f
   28981:	0f 87 71 05 00 00    	ja     28ef8 <JS_CallInternal+0x64f8>
   28987:	48 8b 41 20          	mov    rax,QWORD PTR [rcx+0x20]
   2898b:	49 c1 e0 04          	shl    r8,0x4
   2898f:	4a 8d 44 00 f0       	lea    rax,[rax+r8*1-0x10]
   28994:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
   28998:	4c 8b 30             	mov    r14,QWORD PTR [rax]
   2899b:	83 f9 f6             	cmp    ecx,0xfffffff6
   2899e:	76 05                	jbe    289a5 <JS_CallInternal+0x5fa5>
   289a0:	41 83 46 fc 01       	add    DWORD PTR [r14-0x4],0x1
   289a5:	4c 8d 6b f0          	lea    r13,[rbx-0x10]
   289a9:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
   289ad:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
   289b1:	83 fa f6             	cmp    edx,0xfffffff6
   289b4:	76 11                	jbe    289c7 <JS_CallInternal+0x5fc7>
   289b6:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   289b9:	83 e8 01             	sub    eax,0x1
   289bc:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   289bf:	85 c0                	test   eax,eax
   289c1:	0f 8e 57 1a 00 00    	jle    2a41e <JS_CallInternal+0x7a1e>
   289c7:	4c 89 73 f0          	mov    QWORD PTR [rbx-0x10],r14
   289cb:	49 83 c4 01          	add    r12,0x1
   289cf:	48 89 4b f8          	mov    QWORD PTR [rbx-0x8],rcx
   289d3:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   289d9:	49 89 c5             	mov    r13,rax
   289dc:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   289e0:	ff e0                	jmp    rax
   289e2:	f3 0f 1e fa          	endbr64
   289e6:	83 7b e8 ff          	cmp    DWORD PTR [rbx-0x18],0xffffffff
   289ea:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   289ee:	48 8b 4b e8          	mov    rcx,QWORD PTR [rbx-0x18]
   289f2:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   289f6:	48 8b 7b f8          	mov    rdi,QWORD PTR [rbx-0x8]
   289fa:	0f 85 b0 0b 00 00    	jne    295b0 <JS_CallInternal+0x6bb0>
   28a00:	85 ff                	test   edi,edi
   28a02:	0f 85 a8 0b 00 00    	jne    295b0 <JS_CallInternal+0x6bb0>
   28a08:	66 83 7e 12 02       	cmp    WORD PTR [rsi+0x12],0x2
   28a0d:	0f 85 9d 0b 00 00    	jne    295b0 <JS_CallInternal+0x6bb0>
   28a13:	44 3b 46 38          	cmp    r8d,DWORD PTR [rsi+0x38]
   28a17:	0f 83 93 0b 00 00    	jae    295b0 <JS_CallInternal+0x6bb0>
   28a1d:	44 89 c0             	mov    eax,r8d
   28a20:	48 c1 e0 04          	shl    rax,0x4
   28a24:	48 03 46 30          	add    rax,QWORD PTR [rsi+0x30]
   28a28:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   28a2b:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   28a2f:	83 f8 f6             	cmp    eax,0xfffffff6
   28a32:	76 04                	jbe    28a38 <JS_CallInternal+0x6038>
   28a34:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   28a38:	48 89 53 f0          	mov    QWORD PTR [rbx-0x10],rdx
   28a3c:	49 83 c4 01          	add    r12,0x1
   28a40:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
   28a44:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   28a4a:	49 89 c5             	mov    r13,rax
   28a4d:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28a51:	ff e0                	jmp    rax
   28a53:	44 8b 00             	mov    r8d,DWORD PTR [rax]
   28a56:	41 81 e0 ff ff ff 03 	and    r8d,0x3ffffff
   28a5d:	0f 85 09 ff ff ff    	jne    2896c <JS_CallInternal+0x5f6c>
   28a63:	f6 41 10 08          	test   BYTE PTR [rcx+0x10],0x8
   28a67:	0f 85 81 04 00 00    	jne    28eee <JS_CallInternal+0x64ee>
   28a6d:	48 8b 4a 30          	mov    rcx,QWORD PTR [rdx+0x30]
   28a71:	48 85 c9             	test   rcx,rcx
   28a74:	0f 85 ce fe ff ff    	jne    28948 <JS_CallInternal+0x5f48>
   28a7a:	4c 8d 6b f0          	lea    r13,[rbx-0x10]
   28a7e:	b9 03 00 00 00       	mov    ecx,0x3
   28a83:	45 31 f6             	xor    r14d,r14d
   28a86:	e9 1e ff ff ff       	jmp    289a9 <JS_CallInternal+0x5fa9>
   28a8b:	44 8b 00             	mov    r8d,DWORD PTR [rax]
   28a8e:	41 81 e0 ff ff ff 03 	and    r8d,0x3ffffff
   28a95:	0f 85 08 c8 ff ff    	jne    252a3 <JS_CallInternal+0x28a3>
   28a9b:	f6 41 10 08          	test   BYTE PTR [rcx+0x10],0x8
   28a9f:	0f 85 04 05 00 00    	jne    28fa9 <JS_CallInternal+0x65a9>
   28aa5:	48 8b 4a 30          	mov    rcx,QWORD PTR [rdx+0x30]
   28aa9:	48 85 c9             	test   rcx,rcx
   28aac:	0f 85 ce c7 ff ff    	jne    25280 <JS_CallInternal+0x2880>
   28ab2:	4c 8d 6b f0          	lea    r13,[rbx-0x10]
   28ab6:	41 b8 03 00 00 00    	mov    r8d,0x3
   28abc:	31 c0                	xor    eax,eax
   28abe:	e9 1c c8 ff ff       	jmp    252df <JS_CallInternal+0x28df>
   28ac3:	44 8b 00             	mov    r8d,DWORD PTR [rax]
   28ac6:	41 81 e0 ff ff ff 03 	and    r8d,0x3ffffff
   28acd:	0f 85 30 c7 ff ff    	jne    25203 <JS_CallInternal+0x2803>
   28ad3:	f6 41 10 08          	test   BYTE PTR [rcx+0x10],0x8
   28ad7:	0f 85 1f 05 00 00    	jne    28ffc <JS_CallInternal+0x65fc>
   28add:	48 8b 4a 30          	mov    rcx,QWORD PTR [rdx+0x30]
   28ae1:	48 85 c9             	test   rcx,rcx
   28ae4:	0f 85 f6 c6 ff ff    	jne    251e0 <JS_CallInternal+0x27e0>
   28aea:	ba 03 00 00 00       	mov    edx,0x3
   28aef:	31 c0                	xor    eax,eax
   28af1:	e9 44 c7 ff ff       	jmp    2523a <JS_CallInternal+0x283a>
   28af6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   28afd:	00 00 00 
   28b00:	8b b5 bc fe ff ff    	mov    esi,DWORD PTR [rbp-0x144]
   28b06:	39 f7                	cmp    edi,esi
   28b08:	41 89 f5             	mov    r13d,esi
   28b0b:	44 0f 4e ef          	cmovle r13d,edi
   28b0f:	45 85 ed             	test   r13d,r13d
   28b12:	0f 8e 07 13 00 00    	jle    29e1f <JS_CallInternal+0x741f>
   28b18:	4c 8b bd a8 fe ff ff 	mov    r15,QWORD PTR [rbp-0x158]
   28b1f:	4d 63 f5             	movsxd r14,r13d
   28b22:	4d 8d 43 08          	lea    r8,[r11+0x8]
   28b26:	49 c1 e6 04          	shl    r14,0x4
   28b2a:	4c 89 fe             	mov    rsi,r15
   28b2d:	4d 01 fe             	add    r14,r15
   28b30:	4c 8b 66 08          	mov    r12,QWORD PTR [rsi+0x8]
   28b34:	4c 8b 3e             	mov    r15,QWORD PTR [rsi]
   28b37:	41 83 fc f6          	cmp    r12d,0xfffffff6
   28b3b:	76 05                	jbe    28b42 <JS_CallInternal+0x6142>
   28b3d:	41 83 47 fc 01       	add    DWORD PTR [r15-0x4],0x1
   28b42:	48 83 c6 10          	add    rsi,0x10
   28b46:	4d 89 78 f8          	mov    QWORD PTR [r8-0x8],r15
   28b4a:	49 83 c0 10          	add    r8,0x10
   28b4e:	4d 89 60 f0          	mov    QWORD PTR [r8-0x10],r12
   28b52:	4c 39 f6             	cmp    rsi,r14
   28b55:	75 d9                	jne    28b30 <JS_CallInternal+0x6130>
   28b57:	44 39 ef             	cmp    edi,r13d
   28b5a:	7e 3c                	jle    28b98 <JS_CallInternal+0x6198>
   28b5c:	44 8d 47 ff          	lea    r8d,[rdi-0x1]
   28b60:	4d 63 e5             	movsxd r12,r13d
   28b63:	45 29 e8             	sub    r8d,r13d
   28b66:	4c 89 e6             	mov    rsi,r12
   28b69:	4d 01 e0             	add    r8,r12
   28b6c:	48 c1 e6 04          	shl    rsi,0x4
   28b70:	49 c1 e0 04          	shl    r8,0x4
   28b74:	4c 01 de             	add    rsi,r11
   28b77:	4f 8d 44 03 10       	lea    r8,[r11+r8*1+0x10]
   28b7c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   28b80:	48 c7 06 00 00 00 00 	mov    QWORD PTR [rsi],0x0
   28b87:	48 83 c6 10          	add    rsi,0x10
   28b8b:	48 c7 46 f8 03 00 00 	mov    QWORD PTR [rsi-0x8],0x3
   28b92:	00 
   28b93:	4c 39 c6             	cmp    rsi,r8
   28b96:	75 e8                	jne    28b80 <JS_CallInternal+0x6180>
   28b98:	89 bd 38 ff ff ff    	mov    DWORD PTR [rbp-0xc8],edi
   28b9e:	4c 89 9d 88 fe ff ff 	mov    QWORD PTR [rbp-0x178],r11
   28ba5:	e9 34 a0 ff ff       	jmp    22bde <JS_CallInternal+0x1de>
   28baa:	48 83 ec 08          	sub    rsp,0x8
   28bae:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
   28bb4:	49 89 d1             	mov    r9,rdx
   28bb7:	48 89 c6             	mov    rsi,rax
   28bba:	6a 00                	push   0x0
   28bbc:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   28bc3:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
   28bca:	e8 71 3c 00 00       	call   2c840 <JS_GetPropertyInternal>
   28bcf:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   28bd6:	48 89 c6             	mov    rsi,rax
   28bd9:	e8 c2 5e ff ff       	call   1eaa0 <JS_ToBoolFree>
   28bde:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
   28be5:	89 c1                	mov    ecx,eax
   28be7:	41 8b 40 fc          	mov    eax,DWORD PTR [r8-0x4]
   28beb:	83 e8 01             	sub    eax,0x1
   28bee:	41 89 40 fc          	mov    DWORD PTR [r8-0x4],eax
   28bf2:	41 5b                	pop    r11
   28bf4:	5a                   	pop    rdx
   28bf5:	85 c0                	test   eax,eax
   28bf7:	0f 8e 2c 35 00 00    	jle    2c129 <JS_CallInternal+0x9729>
   28bfd:	85 c9                	test   ecx,ecx
   28bff:	0f 88 01 a9 ff ff    	js     23506 <JS_CallInternal+0xb06>
   28c05:	0f 84 98 a1 ff ff    	je     22da3 <JS_CallInternal+0x3a3>
   28c0b:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   28c0f:	48 83 eb 10          	sub    rbx,0x10
   28c13:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
   28c16:	83 fa f6             	cmp    edx,0xfffffff6
   28c19:	0f 86 c0 a6 ff ff    	jbe    232df <JS_CallInternal+0x8df>
   28c1f:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   28c22:	83 e8 01             	sub    eax,0x1
   28c25:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   28c28:	85 c0                	test   eax,eax
   28c2a:	0f 8f af a6 ff ff    	jg     232df <JS_CallInternal+0x8df>
   28c30:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   28c37:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   28c3b:	e8 30 3c ff ff       	call   1c870 <__JS_FreeValueRT>
   28c40:	e9 9a a6 ff ff       	jmp    232df <JS_CallInternal+0x8df>
   28c45:	8b 85 38 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1c8]
   28c4b:	48 8b 9d 50 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1b0]
   28c52:	4c 8b a5 40 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1c0]
   28c59:	83 c0 02             	add    eax,0x2
   28c5c:	48 98                	cdqe
   28c5e:	49 83 c4 03          	add    r12,0x3
   28c62:	48 c1 e0 04          	shl    rax,0x4
   28c66:	48 29 c3             	sub    rbx,rax
   28c69:	48 89 da             	mov    rdx,rbx
   28c6c:	48 8d 5b 10          	lea    rbx,[rbx+0x10]
   28c70:	4c 89 2a             	mov    QWORD PTR [rdx],r13
   28c73:	4c 89 72 08          	mov    QWORD PTR [rdx+0x8],r14
   28c77:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   28c7d:	49 89 c5             	mov    r13,rax
   28c80:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28c84:	ff e0                	jmp    rax
   28c86:	4c 89 f3             	mov    rbx,r14
   28c89:	4d 89 e6             	mov    r14,r12
   28c8c:	4c 8b a5 50 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1b0]
   28c93:	48 8b 85 68 fe ff ff 	mov    rax,QWORD PTR [rbp-0x198]
   28c9a:	49 39 c6             	cmp    r14,rax
   28c9d:	0f 84 81 1c 00 00    	je     2a924 <JS_CallInternal+0x7f24>
   28ca3:	4d 89 6e f0          	mov    QWORD PTR [r14-0x10],r13
   28ca7:	49 83 c4 01          	add    r12,0x1
   28cab:	49 89 5e f8          	mov    QWORD PTR [r14-0x8],rbx
   28caf:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   28cb5:	4c 89 f3             	mov    rbx,r14
   28cb8:	49 89 c5             	mov    r13,rax
   28cbb:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28cbf:	ff e0                	jmp    rax
   28cc1:	80 fa 01             	cmp    dl,0x1
   28cc4:	0f 84 76 02 00 00    	je     28f40 <JS_CallInternal+0x6540>
   28cca:	80 cc 10             	or     ah,0x10
   28ccd:	f3 0f 6f 53 f0       	movdqu xmm2,XMMWORD PTR [rbx-0x10]
   28cd2:	8b b5 40 fe ff ff    	mov    esi,DWORD PTR [rbp-0x1c0]
   28cd8:	89 85 24 fe ff ff    	mov    DWORD PTR [rbp-0x1dc],eax
   28cde:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
   28ce2:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   28ce9:	0f 29 95 00 fe ff ff 	movaps XMMWORD PTR [rbp-0x200],xmm2
   28cf0:	48 89 85 c8 fd ff ff 	mov    QWORD PTR [rbp-0x238],rax
   28cf7:	49 8b 44 24 08       	mov    rax,QWORD PTR [r12+0x8]
   28cfc:	48 89 85 c0 fd ff ff 	mov    QWORD PTR [rbp-0x240],rax
   28d03:	e8 18 73 01 00       	call   40020 <js_get_function_name>
   28d08:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   28d0f:	4c 8d 05 2e 34 0a 00 	lea    r8,[rip+0xa342e]        # cc144 <_IO_stdin_used+0x144>
   28d16:	48 8d 35 55 38 0a 00 	lea    rsi,[rip+0xa3855]        # cc572 <_IO_stdin_used+0x572>
   28d1d:	49 89 d1             	mov    r9,rdx
   28d20:	48 89 c2             	mov    rdx,rax
   28d23:	4c 89 c9             	mov    rcx,r9
   28d26:	e8 85 71 01 00       	call   3feb0 <JS_ConcatString3>
   28d2b:	49 89 d1             	mov    r9,rdx
   28d2e:	e9 a2 aa ff ff       	jmp    237d5 <JS_CallInternal+0xdd5>
   28d33:	8b 85 50 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1b0]
   28d39:	49 83 c4 05          	add    r12,0x5
   28d3d:	83 c0 01             	add    eax,0x1
   28d40:	48 98                	cdqe
   28d42:	48 c1 e0 04          	shl    rax,0x4
   28d46:	48 29 c3             	sub    rbx,rax
   28d49:	48 89 da             	mov    rdx,rbx
   28d4c:	48 8d 5b 10          	lea    rbx,[rbx+0x10]
   28d50:	4c 89 0a             	mov    QWORD PTR [rdx],r9
   28d53:	4c 89 42 08          	mov    QWORD PTR [rdx+0x8],r8
   28d57:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   28d5d:	49 89 c5             	mov    r13,rax
   28d60:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28d64:	ff e0                	jmp    rax
   28d66:	8b 85 40 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1c0]
   28d6c:	49 83 c4 03          	add    r12,0x3
   28d70:	83 c0 02             	add    eax,0x2
   28d73:	48 98                	cdqe
   28d75:	48 c1 e0 04          	shl    rax,0x4
   28d79:	48 29 c3             	sub    rbx,rax
   28d7c:	48 89 da             	mov    rdx,rbx
   28d7f:	48 8d 5b 10          	lea    rbx,[rbx+0x10]
   28d83:	4c 89 0a             	mov    QWORD PTR [rdx],r9
   28d86:	4c 89 42 08          	mov    QWORD PTR [rdx+0x8],r8
   28d8a:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   28d90:	49 89 c5             	mov    r13,rax
   28d93:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28d97:	ff e0                	jmp    rax
   28d99:	48 8b 9d 38 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1c8]
   28da0:	4c 8b a5 28 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1d8]
   28da7:	4c 89 f6             	mov    rsi,r14
   28daa:	e8 f1 bc fe ff       	call   14aa0 <__js_free>
   28daf:	41 83 fd 06          	cmp    r13d,0x6
   28db3:	0f 84 80 14 00 00    	je     2a239 <JS_CallInternal+0x7839>
   28db9:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   28dbd:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   28dc1:	83 fa f6             	cmp    edx,0xfffffff6
   28dc4:	76 11                	jbe    28dd7 <JS_CallInternal+0x63d7>
   28dc6:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   28dc9:	83 e8 01             	sub    eax,0x1
   28dcc:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   28dcf:	85 c0                	test   eax,eax
   28dd1:	0f 8e 9d 19 00 00    	jle    2a774 <JS_CallInternal+0x7d74>
   28dd7:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   28dde:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   28de2:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   28de5:	83 fa f6             	cmp    edx,0xfffffff6
   28de8:	76 11                	jbe    28dfb <JS_CallInternal+0x63fb>
   28dea:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   28ded:	83 e8 01             	sub    eax,0x1
   28df0:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   28df3:	85 c0                	test   eax,eax
   28df5:	0f 8e 3a 19 00 00    	jle    2a735 <JS_CallInternal+0x7d35>
   28dfb:	48 8b 85 40 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c0]
   28e02:	4c 89 6b e8          	mov    QWORD PTR [rbx-0x18],r13
   28e06:	49 83 c4 03          	add    r12,0x3
   28e0a:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
   28e0e:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   28e14:	48 8b 9d 50 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1b0]
   28e1b:	49 89 c5             	mov    r13,rax
   28e1e:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28e22:	ff e0                	jmp    rax
   28e24:	8b 10                	mov    edx,DWORD PTR [rax]
   28e26:	81 e2 ff ff ff 03    	and    edx,0x3ffffff
   28e2c:	0f 85 4e f9 ff ff    	jne    28780 <JS_CallInternal+0x5d80>
   28e32:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   28e39:	89 f2                	mov    edx,esi
   28e3b:	b9 07 00 00 00       	mov    ecx,0x7
   28e40:	4c 89 c6             	mov    rsi,r8
   28e43:	e8 08 cc 01 00       	call   45a50 <add_property>
   28e48:	48 85 c0             	test   rax,rax
   28e4b:	0f 84 5b f9 ff ff    	je     287ac <JS_CallInternal+0x5dac>
   28e51:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   28e58:	4c 89 28             	mov    QWORD PTR [rax],r13
   28e5b:	48 89 48 08          	mov    QWORD PTR [rax+0x8],rcx
   28e5f:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   28e63:	49 8b 36             	mov    rsi,QWORD PTR [r14]
   28e66:	83 fa f6             	cmp    edx,0xfffffff6
   28e69:	76 11                	jbe    28e7c <JS_CallInternal+0x647c>
   28e6b:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   28e6e:	83 e8 01             	sub    eax,0x1
   28e71:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   28e74:	85 c0                	test   eax,eax
   28e76:	0f 8e 61 24 00 00    	jle    2b2dd <JS_CallInternal+0x88dd>
   28e7c:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   28e81:	4c 89 f3             	mov    rbx,r14
   28e84:	49 83 c4 01          	add    r12,0x1
   28e88:	49 89 c5             	mov    r13,rax
   28e8b:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   28e8f:	ff e0                	jmp    rax
   28e91:	ba 08 00 00 00       	mov    edx,0x8
   28e96:	e9 bb d4 ff ff       	jmp    26356 <JS_CallInternal+0x3956>
   28e9b:	81 bd 40 fe ff ff f2 	cmp    DWORD PTR [rbp-0x1c0],0xf2
   28ea2:	00 00 00 
   28ea5:	0f 8f 31 0f 00 00    	jg     29ddc <JS_CallInternal+0x73dc>
   28eab:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   28eaf:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   28eb3:	83 fa f6             	cmp    edx,0xfffffff6
   28eb6:	0f 86 23 aa ff ff    	jbe    238df <JS_CallInternal+0xedf>
   28ebc:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   28ebf:	83 e8 01             	sub    eax,0x1
   28ec2:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   28ec5:	85 c0                	test   eax,eax
   28ec7:	0f 8f 12 aa ff ff    	jg     238df <JS_CallInternal+0xedf>
   28ecd:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   28ed4:	89 8d 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],ecx
   28eda:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   28ede:	e8 8d 39 ff ff       	call   1c870 <__JS_FreeValueRT>
   28ee3:	8b 8d 50 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1b0]
   28ee9:	e9 f1 a9 ff ff       	jmp    238df <JS_CallInternal+0xedf>
   28eee:	48 89 ce             	mov    rsi,rcx
   28ef1:	48 c7 c7 ff ff ff ff 	mov    rdi,0xffffffffffffffff
   28ef8:	48 83 ec 08          	sub    rsp,0x8
   28efc:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   28f00:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   28f04:	48 89 fa             	mov    rdx,rdi
   28f07:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   28f0e:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   28f15:	b9 32 00 00 00       	mov    ecx,0x32
   28f1a:	4c 8d 6b f0          	lea    r13,[rbx-0x10]
   28f1e:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   28f22:	6a 00                	push   0x0
   28f24:	e8 17 39 00 00       	call   2c840 <JS_GetPropertyInternal>
   28f29:	5f                   	pop    rdi
   28f2a:	41 58                	pop    r8
   28f2c:	49 89 c6             	mov    r14,rax
   28f2f:	48 89 d1             	mov    rcx,rdx
   28f32:	83 fa 06             	cmp    edx,0x6
   28f35:	0f 85 6e fa ff ff    	jne    289a9 <JS_CallInternal+0x5fa9>
   28f3b:	e9 60 a2 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   28f40:	80 cc 08             	or     ah,0x8
   28f43:	f3 0f 6f 7b f0       	movdqu xmm7,XMMWORD PTR [rbx-0x10]
   28f48:	8b b5 40 fe ff ff    	mov    esi,DWORD PTR [rbp-0x1c0]
   28f4e:	89 85 24 fe ff ff    	mov    DWORD PTR [rbp-0x1dc],eax
   28f54:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
   28f58:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   28f5f:	0f 29 bd 10 fe ff ff 	movaps XMMWORD PTR [rbp-0x1f0],xmm7
   28f66:	48 89 85 c8 fd ff ff 	mov    QWORD PTR [rbp-0x238],rax
   28f6d:	49 8b 44 24 08       	mov    rax,QWORD PTR [r12+0x8]
   28f72:	48 89 85 c0 fd ff ff 	mov    QWORD PTR [rbp-0x240],rax
   28f79:	e8 a2 70 01 00       	call   40020 <js_get_function_name>
   28f7e:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   28f85:	4c 8d 05 b8 31 0a 00 	lea    r8,[rip+0xa31b8]        # cc144 <_IO_stdin_used+0x144>
   28f8c:	48 8d 35 da 35 0a 00 	lea    rsi,[rip+0xa35da]        # cc56d <_IO_stdin_used+0x56d>
   28f93:	49 89 d1             	mov    r9,rdx
   28f96:	48 89 c2             	mov    rdx,rax
   28f99:	4c 89 c9             	mov    rcx,r9
   28f9c:	e8 0f 6f 01 00       	call   3feb0 <JS_ConcatString3>
   28fa1:	49 89 d1             	mov    r9,rdx
   28fa4:	e9 2c a8 ff ff       	jmp    237d5 <JS_CallInternal+0xdd5>
   28fa9:	49 89 ca             	mov    r10,rcx
   28fac:	48 c7 c7 ff ff ff ff 	mov    rdi,0xffffffffffffffff
   28fb3:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   28fba:	48 83 ec 08          	sub    rsp,0x8
   28fbe:	48 89 fa             	mov    rdx,rdi
   28fc1:	89 f1                	mov    ecx,esi
   28fc3:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   28fc7:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   28fcb:	4c 89 d6             	mov    rsi,r10
   28fce:	4c 8d 6b f0          	lea    r13,[rbx-0x10]
   28fd2:	4c 89 70 30          	mov    QWORD PTR [rax+0x30],r14
   28fd6:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   28fdd:	6a 00                	push   0x0
   28fdf:	e8 5c 38 00 00       	call   2c840 <JS_GetPropertyInternal>
   28fe4:	41 5b                	pop    r11
   28fe6:	49 89 d0             	mov    r8,rdx
   28fe9:	5a                   	pop    rdx
   28fea:	41 83 f8 06          	cmp    r8d,0x6
   28fee:	0f 85 eb c2 ff ff    	jne    252df <JS_CallInternal+0x28df>
   28ff4:	4d 89 f4             	mov    r12,r14
   28ff7:	e9 a4 a1 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   28ffc:	49 89 ca             	mov    r10,rcx
   28fff:	48 c7 c7 ff ff ff ff 	mov    rdi,0xffffffffffffffff
   29006:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2900d:	48 83 ec 08          	sub    rsp,0x8
   29011:	48 89 fa             	mov    rdx,rdi
   29014:	89 f1                	mov    ecx,esi
   29016:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   2901a:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   2901e:	4c 89 d6             	mov    rsi,r10
   29021:	4c 89 68 30          	mov    QWORD PTR [rax+0x30],r13
   29025:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2902c:	6a 00                	push   0x0
   2902e:	e8 0d 38 00 00       	call   2c840 <JS_GetPropertyInternal>
   29033:	41 59                	pop    r9
   29035:	41 5a                	pop    r10
   29037:	83 fa 06             	cmp    edx,0x6
   2903a:	0f 85 fa c1 ff ff    	jne    2523a <JS_CallInternal+0x283a>
   29040:	4d 89 ec             	mov    r12,r13
   29043:	e9 58 a1 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   29048:	4c 8b a5 50 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1b0]
   2904f:	e9 4c a1 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   29054:	48 8b 8d c8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x138]
   2905b:	4c 89 71 30          	mov    QWORD PTR [rcx+0x30],r14
   2905f:	83 fa f6             	cmp    edx,0xfffffff6
   29062:	76 04                	jbe    29068 <JS_CallInternal+0x6668>
   29064:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
   29068:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2906f:	48 89 95 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdx
   29076:	48 8d b5 00 ff ff ff 	lea    rsi,[rbp-0x100]
   2907d:	ba 8d 00 00 00       	mov    edx,0x8d
   29082:	48 89 85 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rax
   29089:	e8 c2 ba 02 00       	call   54b50 <js_unary_arith_slow>
   2908e:	85 c0                	test   eax,eax
   29090:	0f 85 8e 34 00 00    	jne    2c524 <JS_CallInternal+0x9b24>
   29096:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
   2909a:	66 0f 6f 9d f0 fe ff 	movdqa xmm3,XMMWORD PTR [rbp-0x110]
   290a1:	ff 
   290a2:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
   290a6:	41 0f 11 5d 00       	movups XMMWORD PTR [r13+0x0],xmm3
   290ab:	83 fa f6             	cmp    edx,0xfffffff6
   290ae:	0f 86 5c d8 ff ff    	jbe    26910 <JS_CallInternal+0x3f10>
   290b4:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   290b7:	83 e8 01             	sub    eax,0x1
   290ba:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   290bd:	85 c0                	test   eax,eax
   290bf:	0f 8f 4b d8 ff ff    	jg     26910 <JS_CallInternal+0x3f10>
   290c5:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   290cc:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   290d0:	e8 9b 37 ff ff       	call   1c870 <__JS_FreeValueRT>
   290d5:	e9 36 d8 ff ff       	jmp    26910 <JS_CallInternal+0x3f10>
   290da:	48 8b 8d c8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x138]
   290e1:	4c 89 71 30          	mov    QWORD PTR [rcx+0x30],r14
   290e5:	83 fa f6             	cmp    edx,0xfffffff6
   290e8:	76 04                	jbe    290ee <JS_CallInternal+0x66ee>
   290ea:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
   290ee:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   290f5:	48 89 95 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdx
   290fc:	48 8d b5 00 ff ff ff 	lea    rsi,[rbp-0x100]
   29103:	ba 8c 00 00 00       	mov    edx,0x8c
   29108:	48 89 85 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rax
   2910f:	e8 3c ba 02 00       	call   54b50 <js_unary_arith_slow>
   29114:	85 c0                	test   eax,eax
   29116:	0f 85 8b 35 00 00    	jne    2c6a7 <JS_CallInternal+0x9ca7>
   2911c:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
   29120:	66 0f 6f a5 f0 fe ff 	movdqa xmm4,XMMWORD PTR [rbp-0x110]
   29127:	ff 
   29128:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
   2912c:	41 0f 11 65 00       	movups XMMWORD PTR [r13+0x0],xmm4
   29131:	83 fa f6             	cmp    edx,0xfffffff6
   29134:	0f 86 72 e8 ff ff    	jbe    279ac <JS_CallInternal+0x4fac>
   2913a:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2913d:	83 e8 01             	sub    eax,0x1
   29140:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29143:	85 c0                	test   eax,eax
   29145:	0f 8f 61 e8 ff ff    	jg     279ac <JS_CallInternal+0x4fac>
   2914b:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   29152:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   29156:	e8 15 37 ff ff       	call   1c870 <__JS_FreeValueRT>
   2915b:	e9 4c e8 ff ff       	jmp    279ac <JS_CallInternal+0x4fac>
   29160:	45 85 ed             	test   r13d,r13d
   29163:	0f 85 4b 30 00 00    	jne    2c1b4 <JS_CallInternal+0x97b4>
   29169:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   2916d:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   29171:	4c 8d 6b e0          	lea    r13,[rbx-0x20]
   29175:	83 fa f6             	cmp    edx,0xfffffff6
   29178:	76 11                	jbe    2918b <JS_CallInternal+0x678b>
   2917a:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2917d:	83 e8 01             	sub    eax,0x1
   29180:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29183:	85 c0                	test   eax,eax
   29185:	0f 8e 95 29 00 00    	jle    2bb20 <JS_CallInternal+0x9120>
   2918b:	48 8b 73 d0          	mov    rsi,QWORD PTR [rbx-0x30]
   2918f:	48 8b 53 d8          	mov    rdx,QWORD PTR [rbx-0x28]
   29193:	b9 01 00 00 00       	mov    ecx,0x1
   29198:	4c 89 eb             	mov    rbx,r13
   2919b:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   291a2:	e8 59 78 00 00       	call   30a00 <JS_IteratorClose>
   291a7:	e9 91 a1 ff ff       	jmp    2333d <JS_CallInternal+0x93d>
   291ac:	83 fa 08             	cmp    edx,0x8
   291af:	0f 85 80 0b 00 00    	jne    29d35 <JS_CallInternal+0x7335>
   291b5:	66 48 0f 6e c0       	movq   xmm0,rax
   291ba:	66 0f 57 05 fe 07 0b 	xorpd  xmm0,XMMWORD PTR [rip+0xb07fe]        # d99c0 <typed_array_size_log2+0x28>
   291c1:	00 
   291c2:	48 c7 43 f8 08 00 00 	mov    QWORD PTR [rbx-0x8],0x8
   291c9:	00 
   291ca:	f2 0f 11 43 f0       	movsd  QWORD PTR [rbx-0x10],xmm0
   291cf:	e9 9a e3 ff ff       	jmp    2756e <JS_CallInternal+0x4b6e>
   291d4:	85 c0                	test   eax,eax
   291d6:	0f 84 6e b9 ff ff    	je     24b4a <JS_CallInternal+0x214a>
   291dc:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   291e3:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   291e7:	b9 01 00 00 00       	mov    ecx,0x1
   291ec:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   291f0:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   291f7:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   291fb:	e8 b0 65 01 00       	call   3f7b0 <JS_ToStringInternal>
   29200:	48 89 c1             	mov    rcx,rax
   29203:	49 89 d5             	mov    r13,rdx
   29206:	83 fa 06             	cmp    edx,0x6
   29209:	0f 84 91 9f ff ff    	je     231a0 <JS_CallInternal+0x7a0>
   2920f:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   29213:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   29217:	83 fa f6             	cmp    edx,0xfffffff6
   2921a:	76 11                	jbe    2922d <JS_CallInternal+0x682d>
   2921c:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2921f:	83 e8 01             	sub    eax,0x1
   29222:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29225:	85 c0                	test   eax,eax
   29227:	0f 8e e4 29 00 00    	jle    2bc11 <JS_CallInternal+0x9211>
   2922d:	48 89 4b f0          	mov    QWORD PTR [rbx-0x10],rcx
   29231:	4c 89 6b f8          	mov    QWORD PTR [rbx-0x8],r13
   29235:	e9 10 b9 ff ff       	jmp    24b4a <JS_CallInternal+0x214a>
   2923a:	83 bd 90 fe ff ff f6 	cmp    DWORD PTR [rbp-0x170],0xfffffff6
   29241:	0f 86 07 dc ff ff    	jbe    26e4e <JS_CallInternal+0x444e>
   29247:	e9 f7 db ff ff       	jmp    26e43 <JS_CallInternal+0x4443>
   2924c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   29250:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   29254:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   29258:	4c 89 f1             	mov    rcx,r14
   2925b:	4d 89 e8             	mov    r8,r13
   2925e:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29265:	41 b9 01 00 00 00    	mov    r9d,0x1
   2926b:	e8 c0 2a 01 00       	call   3bd30 <JS_SetPrototypeInternal>
   29270:	85 c0                	test   eax,eax
   29272:	0f 89 f6 f3 ff ff    	jns    2866e <JS_CallInternal+0x5c6e>
   29278:	e9 23 9f ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2927d:	0f 1f 00             	nop    DWORD PTR [rax]
   29280:	41 83 fe 08          	cmp    r14d,0x8
   29284:	0f 85 0f 0b 00 00    	jne    29d99 <JS_CallInternal+0x7399>
   2928a:	66 0f ef c0          	pxor   xmm0,xmm0
   2928e:	66 49 0f 6e dd       	movq   xmm3,r13
   29293:	31 c0                	xor    eax,eax
   29295:	f2 0f 2a c2          	cvtsi2sd xmm0,edx
   29299:	ba 00 00 00 00       	mov    edx,0x0
   2929e:	66 0f 2e c3          	ucomisd xmm0,xmm3
   292a2:	0f 9b c0             	setnp  al
   292a5:	48 0f 45 c2          	cmovne rax,rdx
   292a9:	e9 31 be ff ff       	jmp    250df <JS_CallInternal+0x26df>
   292ae:	41 83 f8 08          	cmp    r8d,0x8
   292b2:	0f 85 65 09 00 00    	jne    29c1d <JS_CallInternal+0x721d>
   292b8:	66 0f ef c0          	pxor   xmm0,xmm0
   292bc:	66 49 0f 6e d1       	movq   xmm2,r9
   292c1:	ba 00 00 00 00       	mov    edx,0x0
   292c6:	f2 41 0f 2a c6       	cvtsi2sd xmm0,r14d
   292cb:	66 0f 2e c2          	ucomisd xmm0,xmm2
   292cf:	0f 9b c0             	setnp  al
   292d2:	0f 45 c2             	cmovne eax,edx
   292d5:	e9 bf be ff ff       	jmp    25199 <JS_CallInternal+0x2799>
   292da:	41 83 f8 08          	cmp    r8d,0x8
   292de:	0f 85 6c 09 00 00    	jne    29c50 <JS_CallInternal+0x7250>
   292e4:	66 0f ef c0          	pxor   xmm0,xmm0
   292e8:	66 49 0f 6e f9       	movq   xmm7,r9
   292ed:	31 c0                	xor    eax,eax
   292ef:	f2 41 0f 2a c6       	cvtsi2sd xmm0,r14d
   292f4:	66 0f 2e c7          	ucomisd xmm0,xmm7
   292f8:	0f 9b c0             	setnp  al
   292fb:	41 0f 45 c5          	cmovne eax,r13d
   292ff:	e9 35 be ff ff       	jmp    25139 <JS_CallInternal+0x2739>
   29304:	41 83 fe 08          	cmp    r14d,0x8
   29308:	0f 85 19 0b 00 00    	jne    29e27 <JS_CallInternal+0x7427>
   2930e:	66 0f ef c0          	pxor   xmm0,xmm0
   29312:	66 49 0f 6e f5       	movq   xmm6,r13
   29317:	31 c0                	xor    eax,eax
   29319:	f2 0f 2a c2          	cvtsi2sd xmm0,edx
   2931d:	ba 01 00 00 00       	mov    edx,0x1
   29322:	66 0f 2e c6          	ucomisd xmm0,xmm6
   29326:	0f 9a c0             	setp   al
   29329:	48 0f 45 c2          	cmovne rax,rdx
   2932d:	e9 59 bd ff ff       	jmp    2508b <JS_CallInternal+0x268b>
   29332:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   29339:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2933d:	e8 2e 35 ff ff       	call   1c870 <__JS_FreeValueRT>
   29342:	e9 ff b6 ff ff       	jmp    24a46 <JS_CallInternal+0x2046>
   29347:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   2934b:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   2934f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29356:	e8 35 a0 01 00       	call   43390 <JS_ValueToAtom>
   2935b:	89 85 40 fe ff ff    	mov    DWORD PTR [rbp-0x1c0],eax
   29361:	85 c0                	test   eax,eax
   29363:	0f 84 37 9e ff ff    	je     231a0 <JS_CallInternal+0x7a0>
   29369:	4d 89 e5             	mov    r13,r12
   2936c:	e9 9b a3 ff ff       	jmp    2370c <JS_CallInternal+0xd0c>
   29371:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   29378:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2937f:	44 89 ea             	mov    edx,r13d
   29382:	48 89 de             	mov    rsi,rbx
   29385:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   29389:	e8 62 bc 02 00       	call   54ff0 <js_post_inc_slow>
   2938e:	85 c0                	test   eax,eax
   29390:	0f 84 33 e5 ff ff    	je     278c9 <JS_CallInternal+0x4ec9>
   29396:	e9 05 9e ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2939b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   293a0:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   293a7:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   293ae:	44 89 ea             	mov    edx,r13d
   293b1:	48 89 de             	mov    rsi,rbx
   293b4:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   293b8:	e8 93 b7 02 00       	call   54b50 <js_unary_arith_slow>
   293bd:	85 c0                	test   eax,eax
   293bf:	0f 84 61 e1 ff ff    	je     27526 <JS_CallInternal+0x4b26>
   293c5:	e9 d6 9d ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   293ca:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   293d0:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   293d7:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   293de:	44 89 ea             	mov    edx,r13d
   293e1:	48 89 de             	mov    rsi,rbx
   293e4:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   293e8:	e8 03 bc 02 00       	call   54ff0 <js_post_inc_slow>
   293ed:	85 c0                	test   eax,eax
   293ef:	0f 84 6e e7 ff ff    	je     27b63 <JS_CallInternal+0x5163>
   293f5:	e9 a6 9d ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   293fa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   29400:	41 83 e6 02          	and    r14d,0x2
   29404:	48 8d 4b c0          	lea    rcx,[rbx-0x40]
   29408:	48 8b 73 c0          	mov    rsi,QWORD PTR [rbx-0x40]
   2940c:	4c 8b 41 08          	mov    r8,QWORD PTR [rcx+0x8]
   29410:	0f 84 1a 0b 00 00    	je     29f30 <JS_CallInternal+0x7530>
   29416:	48 83 ec 08          	sub    rsp,0x8
   2941a:	45 31 c9             	xor    r9d,r9d
   2941d:	6a 00                	push   0x0
   2941f:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29426:	48 89 f1             	mov    rcx,rsi
   29429:	48 89 c6             	mov    rsi,rax
   2942c:	e8 9f 33 00 00       	call   2c7d0 <JS_CallFree>
   29431:	5e                   	pop    rsi
   29432:	5f                   	pop    rdi
   29433:	48 89 c1             	mov    rcx,rax
   29436:	49 89 d6             	mov    r14,rdx
   29439:	83 fa 06             	cmp    edx,0x6
   2943c:	0f 84 86 0b 00 00    	je     29fc8 <JS_CallInternal+0x75c8>
   29442:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   29446:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   2944a:	83 fa f6             	cmp    edx,0xfffffff6
   2944d:	76 11                	jbe    29460 <JS_CallInternal+0x6a60>
   2944f:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   29452:	83 e8 01             	sub    eax,0x1
   29455:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29458:	85 c0                	test   eax,eax
   2945a:	0f 8e 28 26 00 00    	jle    2ba88 <JS_CallInternal+0x9088>
   29460:	48 89 4b f0          	mov    QWORD PTR [rbx-0x10],rcx
   29464:	31 c9                	xor    ecx,ecx
   29466:	4c 89 73 f8          	mov    QWORD PTR [rbx-0x8],r14
   2946a:	e9 54 bf ff ff       	jmp    253c3 <JS_CallInternal+0x29c3>
   2946f:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   29476:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2947d:	44 89 ea             	mov    edx,r13d
   29480:	48 89 de             	mov    rsi,rbx
   29483:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   29487:	e8 c4 b6 02 00       	call   54b50 <js_unary_arith_slow>
   2948c:	85 c0                	test   eax,eax
   2948e:	0f 84 7a e4 ff ff    	je     2790e <JS_CallInternal+0x4f0e>
   29494:	e9 07 9d ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   29499:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   294a0:	48 8b bd d8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x128]
   294a7:	48 03 77 30          	add    rsi,QWORD PTR [rdi+0x30]
   294ab:	80 7a 11 00          	cmp    BYTE PTR [rdx+0x11],0x0
   294af:	0f 84 8a 10 00 00    	je     2a53f <JS_CallInternal+0x7b3f>
   294b5:	41 83 fd 3a          	cmp    r13d,0x3a
   294b9:	0f 84 89 a4 ff ff    	je     23948 <JS_CallInternal+0xf48>
   294bf:	8b 76 04             	mov    esi,DWORD PTR [rsi+0x4]
   294c2:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   294c9:	83 f9 04             	cmp    ecx,0x4
   294cc:	0f 84 aa 2f 00 00    	je     2c47c <JS_CallInternal+0x9a7c>
   294d2:	e8 99 86 00 00       	call   31b70 <JS_ThrowTypeErrorReadOnly.part.0>
   294d7:	4d 89 f4             	mov    r12,r14
   294da:	e9 c1 9c ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   294df:	90                   	nop
   294e0:	66 0f ef c0          	pxor   xmm0,xmm0
   294e4:	f2 48 0f 2a c0       	cvtsi2sd xmm0,rax
   294e9:	b8 08 00 00 00       	mov    eax,0x8
   294ee:	e9 c8 d5 ff ff       	jmp    26abb <JS_CallInternal+0x40bb>
   294f3:	4c 89 c6             	mov    rsi,r8
   294f6:	48 89 df             	mov    rdi,rbx
   294f9:	48 89 8d 10 fe ff ff 	mov    QWORD PTR [rbp-0x1f0],rcx
   29500:	4c 89 85 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],r8
   29507:	e8 44 21 01 00       	call   3b650 <expand_fast_array>
   2950c:	4c 8b 85 28 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1d8]
   29513:	48 8b 8d 10 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1f0]
   2951a:	85 c0                	test   eax,eax
   2951c:	0f 88 89 25 00 00    	js     2baab <JS_CallInternal+0x90ab>
   29522:	8b 85 50 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1b0]
   29528:	41 89 40 38          	mov    DWORD PTR [r8+0x38],eax
   2952c:	31 c0                	xor    eax,eax
   2952e:	66 90                	xchg   ax,ax
   29530:	f3 41 0f 6f 5c 05 00 	movdqu xmm3,XMMWORD PTR [r13+rax*1+0x0]
   29537:	49 8b 50 30          	mov    rdx,QWORD PTR [r8+0x30]
   2953b:	0f 11 1c 02          	movups XMMWORD PTR [rdx+rax*1],xmm3
   2953f:	48 83 c0 10          	add    rax,0x10
   29543:	4c 39 f0             	cmp    rax,r14
   29546:	75 e8                	jne    29530 <JS_CallInternal+0x6b30>
   29548:	49 8b 40 20          	mov    rax,QWORD PTR [r8+0x20]
   2954c:	48 8b 9d 40 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1c0]
   29553:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   29557:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   2955a:	48 c7 40 08 00 00 00 	mov    QWORD PTR [rax+0x8],0x0
   29561:	00 
   29562:	48 89 18             	mov    QWORD PTR [rax],rbx
   29565:	83 fa f6             	cmp    edx,0xfffffff6
   29568:	0f 86 a3 d6 ff ff    	jbe    26c11 <JS_CallInternal+0x4211>
   2956e:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   29571:	83 e8 01             	sub    eax,0x1
   29574:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29577:	85 c0                	test   eax,eax
   29579:	0f 8f 92 d6 ff ff    	jg     26c11 <JS_CallInternal+0x4211>
   2957f:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   29586:	48 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rcx
   2958d:	4c 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r8
   29594:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   29598:	e8 d3 32 ff ff       	call   1c870 <__JS_FreeValueRT>
   2959d:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   295a4:	4c 8b 85 50 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1b0]
   295ab:	e9 61 d6 ff ff       	jmp    26c11 <JS_CallInternal+0x4211>
   295b0:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   295b7:	48 89 ca             	mov    rdx,rcx
   295ba:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   295be:	4c 89 c0             	mov    rax,r8
   295c1:	49 89 f8             	mov    r8,rdi
   295c4:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   295cb:	48 89 c1             	mov    rcx,rax
   295ce:	e8 dd 38 00 00       	call   2ceb0 <JS_GetPropertyValue>
   295d3:	48 89 c1             	mov    rcx,rax
   295d6:	48 89 d0             	mov    rax,rdx
   295d9:	48 89 ca             	mov    rdx,rcx
   295dc:	83 f8 06             	cmp    eax,0x6
   295df:	0f 85 53 f4 ff ff    	jne    28a38 <JS_CallInternal+0x6038>
   295e5:	45 31 c0             	xor    r8d,r8d
   295e8:	48 c7 43 f8 03 00 00 	mov    QWORD PTR [rbx-0x8],0x3
   295ef:	00 
   295f0:	4c 89 43 f0          	mov    QWORD PTR [rbx-0x10],r8
   295f4:	e9 a7 9b ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   295f9:	41 8b 30             	mov    esi,DWORD PTR [r8]
   295fc:	81 e6 ff ff ff 03    	and    esi,0x3ffffff
   29602:	0f 85 de eb ff ff    	jne    281e6 <JS_CallInternal+0x57e6>
   29608:	48 83 ec 08          	sub    rsp,0x8
   2960c:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   29610:	4c 8b 4b f8          	mov    r9,QWORD PTR [rbx-0x8]
   29614:	48 89 c6             	mov    rsi,rax
   29617:	48 8b bd c8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x138]
   2961e:	4c 89 95 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r10
   29625:	4c 89 57 30          	mov    QWORD PTR [rdi+0x30],r10
   29629:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29630:	68 00 80 00 00       	push   0x8000
   29635:	52                   	push   rdx
   29636:	50                   	push   rax
   29637:	e8 34 3f 00 00       	call   2d570 <JS_SetPropertyInternal>
   2963c:	48 83 c4 20          	add    rsp,0x20
   29640:	41 83 fe f6          	cmp    r14d,0xfffffff6
   29644:	4c 8b 95 50 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1b0]
   2964b:	89 c1                	mov    ecx,eax
   2964d:	76 13                	jbe    29662 <JS_CallInternal+0x6c62>
   2964f:	41 8b 45 fc          	mov    eax,DWORD PTR [r13-0x4]
   29653:	83 e8 01             	sub    eax,0x1
   29656:	41 89 45 fc          	mov    DWORD PTR [r13-0x4],eax
   2965a:	85 c0                	test   eax,eax
   2965c:	0f 8e c4 22 00 00    	jle    2b926 <JS_CallInternal+0x8f26>
   29662:	48 83 eb 20          	sub    rbx,0x20
   29666:	85 c9                	test   ecx,ecx
   29668:	0f 89 ee eb ff ff    	jns    2825c <JS_CallInternal+0x585c>
   2966e:	4d 89 d4             	mov    r12,r10
   29671:	e9 2a 9b ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   29676:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   2967d:	00 00 00 
   29680:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   29687:	4d 89 f0             	mov    r8,r14
   2968a:	4c 89 ce             	mov    rsi,r9
   2968d:	4c 89 ea             	mov    rdx,r13
   29690:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29697:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   2969e:	e8 8d 76 00 00       	call   30d30 <JS_CheckBrand>
   296a3:	85 c0                	test   eax,eax
   296a5:	0f 88 f5 9a ff ff    	js     231a0 <JS_CallInternal+0x7a0>
   296ab:	4c 8b 8d 40 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c0]
   296b2:	0f 95 c0             	setne  al
   296b5:	e9 91 b7 ff ff       	jmp    24e4b <JS_CallInternal+0x244b>
   296ba:	8b 00                	mov    eax,DWORD PTR [rax]
   296bc:	25 ff ff ff 03       	and    eax,0x3ffffff
   296c1:	0f 85 18 9b ff ff    	jne    231df <JS_CallInternal+0x7df>
   296c7:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   296ce:	48 83 ec 08          	sub    rsp,0x8
   296d2:	31 c9                	xor    ecx,ecx
   296d4:	45 31 c9             	xor    r9d,r9d
   296d7:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   296de:	45 31 c0             	xor    r8d,r8d
   296e1:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   296e5:	48 8b 85 c0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x140]
   296ec:	48 8b b0 d8 04 00 00 	mov    rsi,QWORD PTR [rax+0x4d8]
   296f3:	48 8b 90 e0 04 00 00 	mov    rdx,QWORD PTR [rax+0x4e0]
   296fa:	6a 00                	push   0x0
   296fc:	e8 ef 62 00 00       	call   2f9f0 <build_backtrace>
   29701:	59                   	pop    rcx
   29702:	5e                   	pop    rsi
   29703:	e9 e8 9a ff ff       	jmp    231f0 <JS_CallInternal+0x7f0>
   29708:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2970f:	48 89 fa             	mov    rdx,rdi
   29712:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29719:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   2971d:	e8 8e 37 00 00       	call   2ceb0 <JS_GetPropertyValue>
   29722:	48 89 c1             	mov    rcx,rax
   29725:	48 89 d0             	mov    rax,rdx
   29728:	83 fa 06             	cmp    edx,0x6
   2972b:	0f 85 67 b2 ff ff    	jne    24998 <JS_CallInternal+0x1f98>
   29731:	48 83 eb 10          	sub    rbx,0x10
   29735:	e9 66 9a ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2973a:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   29741:	48 8d 7b f0          	lea    rdi,[rbx-0x10]
   29745:	41 b9 00 80 00 00    	mov    r9d,0x8000
   2974b:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   2974f:	48 8d 43 e0          	lea    rax,[rbx-0x20]
   29753:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   29757:	48 83 eb 30          	sub    rbx,0x30
   2975b:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
   2975e:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
   29762:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   29765:	ff 77 08             	push   QWORD PTR [rdi+0x8]
   29768:	ff 37                	push   QWORD PTR [rdi]
   2976a:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29771:	e8 0a 4b 00 00       	call   2e280 <JS_SetPropertyValue>
   29776:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
   2977a:	5f                   	pop    rdi
   2977b:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
   2977e:	41 89 c5             	mov    r13d,eax
   29781:	41 58                	pop    r8
   29783:	83 fa f6             	cmp    edx,0xfffffff6
   29786:	76 11                	jbe    29799 <JS_CallInternal+0x6d99>
   29788:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2978b:	83 e8 01             	sub    eax,0x1
   2978e:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29791:	85 c0                	test   eax,eax
   29793:	0f 8e 1a 22 00 00    	jle    2b9b3 <JS_CallInternal+0x8fb3>
   29799:	45 85 ed             	test   r13d,r13d
   2979c:	0f 89 c7 df ff ff    	jns    27769 <JS_CallInternal+0x4d69>
   297a2:	e9 f9 99 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   297a7:	31 c9                	xor    ecx,ecx
   297a9:	41 b8 03 00 00 00    	mov    r8d,0x3
   297af:	e9 e1 a7 ff ff       	jmp    23f95 <JS_CallInternal+0x1595>
   297b4:	31 c0                	xor    eax,eax
   297b6:	e9 93 db ff ff       	jmp    2734e <JS_CallInternal+0x494e>
   297bb:	31 c9                	xor    ecx,ecx
   297bd:	41 b8 03 00 00 00    	mov    r8d,0x3
   297c3:	e9 82 a6 ff ff       	jmp    23e4a <JS_CallInternal+0x144a>
   297c8:	48 8b b5 28 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1d8]
   297cf:	45 89 d1             	mov    r9d,r10d
   297d2:	4c 89 ea             	mov    rdx,r13
   297d5:	31 c9                	xor    ecx,ecx
   297d7:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   297de:	41 b8 03 00 00 00    	mov    r8d,0x3
   297e4:	48 c7 85 b0 fd ff ff 	mov    QWORD PTR [rbp-0x250],0x0
   297eb:	00 00 00 00 
   297ef:	48 c7 85 b8 fd ff ff 	mov    QWORD PTR [rbp-0x248],0x3
   297f6:	03 00 00 00 
   297fa:	6a 02                	push   0x2
   297fc:	41 56                	push   r14
   297fe:	ff b5 b8 fd ff ff    	push   QWORD PTR [rbp-0x248]
   29804:	ff b5 b0 fd ff ff    	push   QWORD PTR [rbp-0x250]
   2980a:	44 89 95 38 fe ff ff 	mov    DWORD PTR [rbp-0x1c8],r10d
   29811:	e8 ea 91 ff ff       	call   22a00 <JS_CallInternal>
   29816:	44 8b 95 38 fe ff ff 	mov    r10d,DWORD PTR [rbp-0x1c8]
   2981d:	48 83 c4 20          	add    rsp,0x20
   29821:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
   29828:	49 89 d5             	mov    r13,rdx
   2982b:	e9 5c a6 ff ff       	jmp    23e8c <JS_CallInternal+0x148c>
   29830:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29837:	48 89 d6             	mov    rsi,rdx
   2983a:	48 89 c2             	mov    rdx,rax
   2983d:	e8 5e 52 ff ff       	call   1eaa0 <JS_ToBoolFree>
   29842:	e9 ee ba ff ff       	jmp    25335 <JS_CallInternal+0x2935>
   29847:	49 8b 75 f0          	mov    rsi,QWORD PTR [r13-0x10]
   2984b:	49 8b 55 f8          	mov    rdx,QWORD PTR [r13-0x8]
   2984f:	41 b8 03 00 00 00    	mov    r8d,0x3
   29855:	31 c9                	xor    ecx,ecx
   29857:	44 8b 8d 50 fe ff ff 	mov    r9d,DWORD PTR [rbp-0x1b0]
   2985e:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29865:	48 c7 85 a0 fd ff ff 	mov    QWORD PTR [rbp-0x260],0x0
   2986c:	00 00 00 00 
   29870:	48 c7 85 a8 fd ff ff 	mov    QWORD PTR [rbp-0x258],0x3
   29877:	03 00 00 00 
   2987b:	6a 00                	push   0x0
   2987d:	41 55                	push   r13
   2987f:	ff b5 a8 fd ff ff    	push   QWORD PTR [rbp-0x258]
   29885:	ff b5 a0 fd ff ff    	push   QWORD PTR [rbp-0x260]
   2988b:	e8 70 91 ff ff       	call   22a00 <JS_CallInternal>
   29890:	48 83 c4 20          	add    rsp,0x20
   29894:	49 89 c1             	mov    r9,rax
   29897:	49 89 d0             	mov    r8,rdx
   2989a:	e9 27 a7 ff ff       	jmp    23fc6 <JS_CallInternal+0x15c6>
   2989f:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   298a6:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   298ad:	48 89 de             	mov    rsi,rbx
   298b0:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   298b4:	e8 a7 b7 02 00       	call   55060 <js_not_slow>
   298b9:	85 c0                	test   eax,eax
   298bb:	0f 84 80 e0 ff ff    	je     27941 <JS_CallInternal+0x4f41>
   298c1:	e9 da 98 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   298c6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   298cd:	00 00 00 
   298d0:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   298d7:	48 89 ce             	mov    rsi,rcx
   298da:	e8 c1 51 ff ff       	call   1eaa0 <JS_ToBoolFree>
   298df:	e9 c1 ce ff ff       	jmp    267a5 <JS_CallInternal+0x3da5>
   298e4:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   298eb:	48 89 ce             	mov    rsi,rcx
   298ee:	e8 ad 51 ff ff       	call   1eaa0 <JS_ToBoolFree>
   298f3:	e9 07 ce ff ff       	jmp    266ff <JS_CallInternal+0x3cff>
   298f8:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   298ff:	48 89 ce             	mov    rsi,rcx
   29902:	e8 99 51 ff ff       	call   1eaa0 <JS_ToBoolFree>
   29907:	e9 8c cd ff ff       	jmp    26698 <JS_CallInternal+0x3c98>
   2990c:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29913:	48 89 ce             	mov    rsi,rcx
   29916:	e8 85 51 ff ff       	call   1eaa0 <JS_ToBoolFree>
   2991b:	e9 11 cd ff ff       	jmp    26631 <JS_CallInternal+0x3c31>
   29920:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   29927:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
   2992b:	48 8b 97 48 04 00 00 	mov    rdx,QWORD PTR [rdi+0x448]
   29932:	4a 8b 34 ea          	mov    rsi,QWORD PTR [rdx+r13*8]
   29936:	8b 4e fc             	mov    ecx,DWORD PTR [rsi-0x4]
   29939:	8d 51 ff             	lea    edx,[rcx-0x1]
   2993c:	89 56 fc             	mov    DWORD PTR [rsi-0x4],edx
   2993f:	85 d2                	test   edx,edx
   29941:	0f 8f 7a e4 ff ff    	jg     27dc1 <JS_CallInternal+0x53c1>
   29947:	48 89 85 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rax
   2994e:	e8 ad ba fe ff       	call   15400 <JS_FreeAtomStruct>
   29953:	48 8b 85 28 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1d8]
   2995a:	4c 8b 95 38 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c8]
   29961:	e9 5b e4 ff ff       	jmp    27dc1 <JS_CallInternal+0x53c1>
   29966:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2996d:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   29971:	89 c8                	mov    eax,ecx
   29973:	48 8b 97 48 04 00 00 	mov    rdx,QWORD PTR [rdi+0x448]
   2997a:	48 8b 34 c2          	mov    rsi,QWORD PTR [rdx+rax*8]
   2997e:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   29981:	83 e8 01             	sub    eax,0x1
   29984:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29987:	85 c0                	test   eax,eax
   29989:	0f 8f 57 b6 ff ff    	jg     24fe6 <JS_CallInternal+0x25e6>
   2998f:	44 89 85 38 fe ff ff 	mov    DWORD PTR [rbp-0x1c8],r8d
   29996:	e8 65 ba fe ff       	call   15400 <JS_FreeAtomStruct>
   2999b:	44 8b 85 38 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x1c8]
   299a2:	e9 3f b6 ff ff       	jmp    24fe6 <JS_CallInternal+0x25e6>
   299a7:	8b 08                	mov    ecx,DWORD PTR [rax]
   299a9:	81 e1 ff ff ff 03    	and    ecx,0x3ffffff
   299af:	0f 85 5e b2 ff ff    	jne    24c13 <JS_CallInternal+0x2213>
   299b5:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   299bc:	44 89 f1             	mov    ecx,r14d
   299bf:	48 8b b7 80 01 00 00 	mov    rsi,QWORD PTR [rdi+0x180]
   299c6:	48 8b 97 88 01 00 00 	mov    rdx,QWORD PTR [rdi+0x188]
   299cd:	e8 de 3f 04 00       	call   6d9b0 <JS_HasProperty>
   299d2:	85 c0                	test   eax,eax
   299d4:	0f 88 57 2d 00 00    	js     2c731 <JS_CallInternal+0x9d31>
   299da:	b8 01 00 00 00       	mov    eax,0x1
   299df:	0f 84 41 b2 ff ff    	je     24c26 <JS_CallInternal+0x2226>
   299e5:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   299ec:	45 31 c0             	xor    r8d,r8d
   299ef:	44 89 f1             	mov    ecx,r14d
   299f2:	48 8b b7 80 01 00 00 	mov    rsi,QWORD PTR [rdi+0x180]
   299f9:	48 8b 97 88 01 00 00 	mov    rdx,QWORD PTR [rdi+0x188]
   29a00:	e8 1b 10 02 00       	call   4aa20 <JS_DeleteProperty>
   29a05:	85 c0                	test   eax,eax
   29a07:	0f 88 bb 24 00 00    	js     2bec8 <JS_CallInternal+0x94c8>
   29a0d:	0f 95 c0             	setne  al
   29a10:	0f b6 c0             	movzx  eax,al
   29a13:	e9 0e b2 ff ff       	jmp    24c26 <JS_CallInternal+0x2226>
   29a18:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   29a1f:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   29a23:	89 c8                	mov    eax,ecx
   29a25:	48 8b 97 48 04 00 00 	mov    rdx,QWORD PTR [rdi+0x448]
   29a2c:	48 8b 34 c2          	mov    rsi,QWORD PTR [rdx+rax*8]
   29a30:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   29a33:	83 e8 01             	sub    eax,0x1
   29a36:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29a39:	85 c0                	test   eax,eax
   29a3b:	0f 8f 8b b2 ff ff    	jg     24ccc <JS_CallInternal+0x22cc>
   29a41:	44 89 85 38 fe ff ff 	mov    DWORD PTR [rbp-0x1c8],r8d
   29a48:	e8 b3 b9 fe ff       	call   15400 <JS_FreeAtomStruct>
   29a4d:	44 8b 85 38 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x1c8]
   29a54:	e9 73 b2 ff ff       	jmp    24ccc <JS_CallInternal+0x22cc>
   29a59:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   29a60:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   29a64:	48 8b 87 48 04 00 00 	mov    rax,QWORD PTR [rdi+0x448]
   29a6b:	4a 8b 34 e8          	mov    rsi,QWORD PTR [rax+r13*8]
   29a6f:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   29a72:	83 e8 01             	sub    eax,0x1
   29a75:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29a78:	85 c0                	test   eax,eax
   29a7a:	0f 8f e0 ea ff ff    	jg     28560 <JS_CallInternal+0x5b60>
   29a80:	e8 7b b9 fe ff       	call   15400 <JS_FreeAtomStruct>
   29a85:	4c 8b 95 40 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c0]
   29a8c:	e9 cf ea ff ff       	jmp    28560 <JS_CallInternal+0x5b60>
   29a91:	c7 85 f0 fe ff ff ff 	mov    DWORD PTR [rbp-0x110],0xffffffff
   29a98:	ff ff ff 
   29a9b:	b9 ff ff ff ff       	mov    ecx,0xffffffff
   29aa0:	4d 8b 45 08          	mov    r8,QWORD PTR [r13+0x8]
   29aa4:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
   29aa8:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   29aac:	76 11                	jbe    29abf <JS_CallInternal+0x70bf>
   29aae:	8b 7e fc             	mov    edi,DWORD PTR [rsi-0x4]
   29ab1:	8d 57 ff             	lea    edx,[rdi-0x1]
   29ab4:	89 56 fc             	mov    DWORD PTR [rsi-0x4],edx
   29ab7:	85 d2                	test   edx,edx
   29ab9:	0f 8e 27 1e 00 00    	jle    2b8e6 <JS_CallInternal+0x8ee6>
   29abf:	49 c7 45 00 00 00 00 	mov    QWORD PTR [r13+0x0],0x0
   29ac6:	00 
   29ac7:	49 c7 45 08 03 00 00 	mov    QWORD PTR [r13+0x8],0x3
   29ace:	00 
   29acf:	85 c9                	test   ecx,ecx
   29ad1:	0f 88 e6 2c 00 00    	js     2c7bd <JS_CallInternal+0x9dbd>
   29ad7:	41 83 f9 f6          	cmp    r9d,0xfffffff6
   29adb:	76 11                	jbe    29aee <JS_CallInternal+0x70ee>
   29add:	8b 48 fc             	mov    ecx,DWORD PTR [rax-0x4]
   29ae0:	8d 51 ff             	lea    edx,[rcx-0x1]
   29ae3:	89 50 fc             	mov    DWORD PTR [rax-0x4],edx
   29ae6:	85 d2                	test   edx,edx
   29ae8:	0f 8e ca 20 00 00    	jle    2bbb8 <JS_CallInternal+0x91b8>
   29aee:	44 8b 9d f0 fe ff ff 	mov    r11d,DWORD PTR [rbp-0x110]
   29af5:	31 d2                	xor    edx,edx
   29af7:	be 03 00 00 00       	mov    esi,0x3
   29afc:	45 85 db             	test   r11d,r11d
   29aff:	0f 95 c2             	setne  dl
   29b02:	31 ff                	xor    edi,edi
   29b04:	e9 86 e8 ff ff       	jmp    2838f <JS_CallInternal+0x598f>
   29b09:	41 83 fd fa          	cmp    r13d,0xfffffffa
   29b0d:	7d 06                	jge    29b15 <JS_CallInternal+0x7115>
   29b0f:	41 83 fd f8          	cmp    r13d,0xfffffff8
   29b13:	7d 59                	jge    29b6e <JS_CallInternal+0x716e>
   29b15:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   29b1c:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   29b20:	b9 01 00 00 00       	mov    ecx,0x1
   29b25:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   29b29:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29b30:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   29b34:	e8 77 5c 01 00       	call   3f7b0 <JS_ToStringInternal>
   29b39:	49 89 d0             	mov    r8,rdx
   29b3c:	49 89 d5             	mov    r13,rdx
   29b3f:	83 fa 06             	cmp    edx,0x6
   29b42:	0f 84 58 96 ff ff    	je     231a0 <JS_CallInternal+0x7a0>
   29b48:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   29b4c:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   29b50:	83 fa f6             	cmp    edx,0xfffffff6
   29b53:	76 11                	jbe    29b66 <JS_CallInternal+0x7166>
   29b55:	8b 4e fc             	mov    ecx,DWORD PTR [rsi-0x4]
   29b58:	83 e9 01             	sub    ecx,0x1
   29b5b:	89 4e fc             	mov    DWORD PTR [rsi-0x4],ecx
   29b5e:	85 c9                	test   ecx,ecx
   29b60:	0f 8e 04 27 00 00    	jle    2c26a <JS_CallInternal+0x986a>
   29b66:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   29b6a:	4c 89 43 f8          	mov    QWORD PTR [rbx-0x8],r8
   29b6e:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   29b75:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   29b79:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   29b7d:	41 83 fd f6          	cmp    r13d,0xfffffff6
   29b81:	76 04                	jbe    29b87 <JS_CallInternal+0x7187>
   29b83:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
   29b87:	48 8b 73 e0          	mov    rsi,QWORD PTR [rbx-0x20]
   29b8b:	48 8b 53 e8          	mov    rdx,QWORD PTR [rbx-0x18]
   29b8f:	4d 89 e8             	mov    r8,r13
   29b92:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29b99:	e8 12 33 00 00       	call   2ceb0 <JS_GetPropertyValue>
   29b9e:	48 89 c1             	mov    rcx,rax
   29ba1:	48 89 d0             	mov    rax,rdx
   29ba4:	83 fa 06             	cmp    edx,0x6
   29ba7:	0f 85 ae e3 ff ff    	jne    27f5b <JS_CallInternal+0x555b>
   29bad:	e9 ee 95 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   29bb2:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29bb9:	48 8d 35 66 29 0a 00 	lea    rsi,[rip+0xa2966]        # cc526 <_IO_stdin_used+0x526>
   29bc0:	31 c0                	xor    eax,eax
   29bc2:	e8 e9 6a 00 00       	call   306b0 <JS_ThrowTypeError>
   29bc7:	83 fb f6             	cmp    ebx,0xfffffff6
   29bca:	76 1e                	jbe    29bea <JS_CallInternal+0x71ea>
   29bcc:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   29bd3:	8b 41 fc             	mov    eax,DWORD PTR [rcx-0x4]
   29bd6:	89 85 28 fe ff ff    	mov    DWORD PTR [rbp-0x1d8],eax
   29bdc:	83 e8 01             	sub    eax,0x1
   29bdf:	89 41 fc             	mov    DWORD PTR [rcx-0x4],eax
   29be2:	85 c0                	test   eax,eax
   29be4:	0f 8e d0 26 00 00    	jle    2c2ba <JS_CallInternal+0x98ba>
   29bea:	83 bd 38 fe ff ff f6 	cmp    DWORD PTR [rbp-0x1c8],0xfffffff6
   29bf1:	76 1e                	jbe    29c11 <JS_CallInternal+0x7211>
   29bf3:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   29bfa:	8b 41 fc             	mov    eax,DWORD PTR [rcx-0x4]
   29bfd:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   29c03:	83 e8 01             	sub    eax,0x1
   29c06:	89 41 fc             	mov    DWORD PTR [rcx-0x4],eax
   29c09:	85 c0                	test   eax,eax
   29c0b:	0f 8e c4 26 00 00    	jle    2c2d5 <JS_CallInternal+0x98d5>
   29c11:	ba 06 00 00 00       	mov    edx,0x6
   29c16:	31 c0                	xor    eax,eax
   29c18:	e9 4c a1 ff ff       	jmp    23d69 <JS_CallInternal+0x1369>
   29c1d:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   29c24:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29c2b:	31 d2                	xor    edx,edx
   29c2d:	48 89 de             	mov    rsi,rbx
   29c30:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   29c34:	e8 e7 0b 03 00       	call   5a820 <js_eq_slow>
   29c39:	85 c0                	test   eax,eax
   29c3b:	0f 84 67 b5 ff ff    	je     251a8 <JS_CallInternal+0x27a8>
   29c41:	e9 5a 95 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   29c46:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   29c4d:	00 00 00 
   29c50:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   29c57:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29c5e:	ba 01 00 00 00       	mov    edx,0x1
   29c63:	48 89 de             	mov    rsi,rbx
   29c66:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   29c6a:	e8 b1 0b 03 00       	call   5a820 <js_eq_slow>
   29c6f:	85 c0                	test   eax,eax
   29c71:	0f 84 d7 b4 ff ff    	je     2514e <JS_CallInternal+0x274e>
   29c77:	e9 24 95 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   29c7c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   29c80:	48 89 fe             	mov    rsi,rdi
   29c83:	48 8b 95 c8 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x138]
   29c8a:	48 8b bd c0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x140]
   29c91:	48 89 85 d0 fe ff ff 	mov    QWORD PTR [rbp-0x130],rax
   29c98:	48 89 8d e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rcx
   29c9f:	e8 6c 66 ff ff       	call   20310 <close_var_refs>
   29ca4:	48 8b 85 d0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x130]
   29cab:	48 8b 8d e0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x120]
   29cb2:	e9 4e 94 ff ff       	jmp    23105 <JS_CallInternal+0x705>
   29cb7:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   29cbe:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   29cc2:	48 8b 87 48 04 00 00 	mov    rax,QWORD PTR [rdi+0x448]
   29cc9:	4a 8b 34 e8          	mov    rsi,QWORD PTR [rax+r13*8]
   29ccd:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   29cd0:	83 e8 01             	sub    eax,0x1
   29cd3:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29cd6:	85 c0                	test   eax,eax
   29cd8:	0f 8f a4 d9 ff ff    	jg     27682 <JS_CallInternal+0x4c82>
   29cde:	e8 1d b7 fe ff       	call   15400 <JS_FreeAtomStruct>
   29ce3:	e9 9a d9 ff ff       	jmp    27682 <JS_CallInternal+0x4c82>
   29ce8:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29cef:	48 8b 7f 10          	mov    rdi,QWORD PTR [rdi+0x10]
   29cf3:	48 8b 97 48 04 00 00 	mov    rdx,QWORD PTR [rdi+0x448]
   29cfa:	4a 8b 34 ea          	mov    rsi,QWORD PTR [rdx+r13*8]
   29cfe:	8b 56 fc             	mov    edx,DWORD PTR [rsi-0x4]
   29d01:	83 ea 01             	sub    edx,0x1
   29d04:	89 56 fc             	mov    DWORD PTR [rsi-0x4],edx
   29d07:	85 d2                	test   edx,edx
   29d09:	0f 8f d0 e1 ff ff    	jg     27edf <JS_CallInternal+0x54df>
   29d0f:	48 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rcx
   29d16:	4c 89 b5 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r14
   29d1d:	e8 de b6 fe ff       	call   15400 <JS_FreeAtomStruct>
   29d22:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   29d29:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   29d30:	e9 aa e1 ff ff       	jmp    27edf <JS_CallInternal+0x54df>
   29d35:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   29d3c:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29d43:	44 89 ea             	mov    edx,r13d
   29d46:	48 89 de             	mov    rsi,rbx
   29d49:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   29d4d:	e8 fe ad 02 00       	call   54b50 <js_unary_arith_slow>
   29d52:	85 c0                	test   eax,eax
   29d54:	0f 84 14 d8 ff ff    	je     2756e <JS_CallInternal+0x4b6e>
   29d5a:	e9 41 94 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   29d5f:	90                   	nop
   29d60:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   29d67:	89 8d 38 fe ff ff    	mov    DWORD PTR [rbp-0x1c8],ecx
   29d6d:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   29d71:	e8 fa 2a ff ff       	call   1c870 <__JS_FreeValueRT>
   29d76:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
   29d7c:	e9 51 9b ff ff       	jmp    238d2 <JS_CallInternal+0xed2>
   29d81:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   29d88:	48 89 ca             	mov    rdx,rcx
   29d8b:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   29d8f:	e8 dc 2a ff ff       	call   1c870 <__JS_FreeValueRT>
   29d94:	e9 d0 9b ff ff       	jmp    23969 <JS_CallInternal+0xf69>
   29d99:	41 83 fe f6          	cmp    r14d,0xfffffff6
   29d9d:	76 0f                	jbe    29dae <JS_CallInternal+0x73ae>
   29d9f:	41 8b 45 fc          	mov    eax,DWORD PTR [r13-0x4]
   29da3:	83 e8 01             	sub    eax,0x1
   29da6:	41 89 45 fc          	mov    DWORD PTR [r13-0x4],eax
   29daa:	85 c0                	test   eax,eax
   29dac:	7e 07                	jle    29db5 <JS_CallInternal+0x73b5>
   29dae:	31 c0                	xor    eax,eax
   29db0:	e9 2a b3 ff ff       	jmp    250df <JS_CallInternal+0x26df>
   29db5:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   29dbc:	4c 89 ee             	mov    rsi,r13
   29dbf:	4c 89 f2             	mov    rdx,r14
   29dc2:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   29dc6:	e8 a5 2a ff ff       	call   1c870 <__JS_FreeValueRT>
   29dcb:	31 c0                	xor    eax,eax
   29dcd:	e9 0d b3 ff ff       	jmp    250df <JS_CallInternal+0x26df>
   29dd2:	b9 ff ff ff ff       	mov    ecx,0xffffffff
   29dd7:	e9 d7 9a ff ff       	jmp    238b3 <JS_CallInternal+0xeb3>
   29ddc:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   29de3:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   29de7:	8b 85 40 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1c0]
   29ded:	48 8b 97 48 04 00 00 	mov    rdx,QWORD PTR [rdi+0x448]
   29df4:	48 8b 34 c2          	mov    rsi,QWORD PTR [rdx+rax*8]
   29df8:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   29dfb:	83 e8 01             	sub    eax,0x1
   29dfe:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29e01:	85 c0                	test   eax,eax
   29e03:	0f 8f a2 f0 ff ff    	jg     28eab <JS_CallInternal+0x64ab>
   29e09:	89 8d 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],ecx
   29e0f:	e8 ec b5 fe ff       	call   15400 <JS_FreeAtomStruct>
   29e14:	8b 8d 50 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1b0]
   29e1a:	e9 8c f0 ff ff       	jmp    28eab <JS_CallInternal+0x64ab>
   29e1f:	45 31 ed             	xor    r13d,r13d
   29e22:	e9 30 ed ff ff       	jmp    28b57 <JS_CallInternal+0x6157>
   29e27:	41 83 fe f6          	cmp    r14d,0xfffffff6
   29e2b:	0f 87 34 17 00 00    	ja     2b565 <JS_CallInternal+0x8b65>
   29e31:	b8 01 00 00 00       	mov    eax,0x1
   29e36:	e9 50 b2 ff ff       	jmp    2508b <JS_CallInternal+0x268b>
   29e3b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   29e40:	48 8b bd d8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x128]
   29e47:	48 8b 47 30          	mov    rax,QWORD PTR [rdi+0x30]
   29e4b:	48 01 c8             	add    rax,rcx
   29e4e:	8b 48 04             	mov    ecx,DWORD PTR [rax+0x4]
   29e51:	f6 00 08             	test   BYTE PTR [rax],0x8
   29e54:	0f 85 62 26 00 00    	jne    2c4bc <JS_CallInternal+0x9abc>
   29e5a:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29e61:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   29e68:	48 83 ec 08          	sub    rsp,0x8
   29e6c:	41 83 ed 37          	sub    r13d,0x37
   29e70:	4c 89 70 30          	mov    QWORD PTR [rax+0x30],r14
   29e74:	4c 8b 87 80 01 00 00 	mov    r8,QWORD PTR [rdi+0x180]
   29e7b:	4c 8b 8f 88 01 00 00 	mov    r9,QWORD PTR [rdi+0x188]
   29e82:	48 8b b7 80 01 00 00 	mov    rsi,QWORD PTR [rdi+0x180]
   29e89:	48 8b 97 88 01 00 00 	mov    rdx,QWORD PTR [rdi+0x188]
   29e90:	41 55                	push   r13
   29e92:	e8 a9 29 00 00       	call   2c840 <JS_GetPropertyInternal>
   29e97:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
   29e9b:	83 7b 08 06          	cmp    DWORD PTR [rbx+0x8],0x6
   29e9f:	48 89 03             	mov    QWORD PTR [rbx],rax
   29ea2:	58                   	pop    rax
   29ea3:	5a                   	pop    rdx
   29ea4:	0f 85 38 9c ff ff    	jne    23ae2 <JS_CallInternal+0x10e2>
   29eaa:	4d 89 f4             	mov    r12,r14
   29ead:	e9 ee 92 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   29eb2:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   29eb9:	89 c0                	mov    eax,eax
   29ebb:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
   29ebf:	48 8b 8f 48 04 00 00 	mov    rcx,QWORD PTR [rdi+0x448]
   29ec6:	48 8b 34 c1          	mov    rsi,QWORD PTR [rcx+rax*8]
   29eca:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   29ecd:	83 e8 01             	sub    eax,0x1
   29ed0:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   29ed3:	85 c0                	test   eax,eax
   29ed5:	0f 8f 6a af ff ff    	jg     24e45 <JS_CallInternal+0x2445>
   29edb:	4c 89 8d 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r9
   29ee2:	48 89 95 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rdx
   29ee9:	e8 12 b5 fe ff       	call   15400 <JS_FreeAtomStruct>
   29eee:	4c 8b 8d 38 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c8]
   29ef5:	48 8b 95 40 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c0]
   29efc:	e9 44 af ff ff       	jmp    24e45 <JS_CallInternal+0x2445>
   29f01:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   29f08:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29f0f:	44 89 ea             	mov    edx,r13d
   29f12:	48 89 de             	mov    rsi,rbx
   29f15:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   29f19:	e8 32 ac 02 00       	call   54b50 <js_unary_arith_slow>
   29f1e:	85 c0                	test   eax,eax
   29f20:	0f 84 04 db ff ff    	je     27a2a <JS_CallInternal+0x502a>
   29f26:	e9 75 92 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   29f2b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   29f30:	48 83 ec 08          	sub    rsp,0x8
   29f34:	48 8d 4b f0          	lea    rcx,[rbx-0x10]
   29f38:	41 b9 01 00 00 00    	mov    r9d,0x1
   29f3e:	51                   	push   rcx
   29f3f:	e9 db f4 ff ff       	jmp    2941f <JS_CallInternal+0x6a1f>
   29f44:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29f4b:	48 8d 35 e4 25 0a 00 	lea    rsi,[rip+0xa25e4]        # cc536 <_IO_stdin_used+0x536>
   29f52:	31 c0                	xor    eax,eax
   29f54:	e8 37 8b 00 00       	call   32a90 <JS_ThrowInternalError>
   29f59:	e9 42 92 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   29f5e:	4c 8b a5 28 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1d8]
   29f65:	e9 36 92 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   29f6a:	48 89 c6             	mov    rsi,rax
   29f6d:	8b 40 ac             	mov    eax,DWORD PTR [rax-0x54]
   29f70:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   29f76:	83 e8 01             	sub    eax,0x1
   29f79:	89 46 ac             	mov    DWORD PTR [rsi-0x54],eax
   29f7c:	0f 85 cb d8 ff ff    	jne    2784d <JS_CallInternal+0x4e4d>
   29f82:	80 bf a0 04 00 00 02 	cmp    BYTE PTR [rdi+0x4a0],0x2
   29f89:	0f 84 be d8 ff ff    	je     2784d <JS_CallInternal+0x4e4d>
   29f8f:	48 83 ee 50          	sub    rsi,0x50
   29f93:	e8 b8 62 ff ff       	call   20250 <async_func_free.part.0>
   29f98:	48 8b b5 c8 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x138]
   29f9f:	48 8b 4e 28          	mov    rcx,QWORD PTR [rsi+0x28]
   29fa3:	4c 01 e9             	add    rcx,r13
   29fa6:	e9 a2 d8 ff ff       	jmp    2784d <JS_CallInternal+0x4e4d>
   29fab:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   29fb2:	0f b6 d0             	movzx  edx,al
   29fb5:	31 c0                	xor    eax,eax
   29fb7:	48 8d 35 4e 25 0a 00 	lea    rsi,[rip+0xa254e]        # cc50c <_IO_stdin_used+0x50c>
   29fbe:	e8 cd 8a 00 00       	call   32a90 <JS_ThrowInternalError>
   29fc3:	e9 d8 91 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   29fc8:	4d 89 ec             	mov    r12,r13
   29fcb:	e9 d0 91 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   29fd0:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   29fd7:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   29fde:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   29fe2:	e8 89 28 ff ff       	call   1c870 <__JS_FreeValueRT>
   29fe7:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   29fee:	e9 7e b4 ff ff       	jmp    25471 <JS_CallInternal+0x2a71>
   29ff3:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   29ffa:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a001:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   2a008:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a00c:	e8 5f 28 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a011:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
   2a018:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   2a01f:	e9 d9 b2 ff ff       	jmp    252fd <JS_CallInternal+0x28fd>
   2a024:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a02b:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a02f:	e8 3c 28 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a034:	e9 8b d4 ff ff       	jmp    274c4 <JS_CallInternal+0x4ac4>
   2a039:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a040:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a044:	e8 27 28 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a049:	e9 d3 dc ff ff       	jmp    27d21 <JS_CallInternal+0x5321>
   2a04e:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a055:	4c 89 c2             	mov    rdx,r8
   2a058:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a05c:	e8 0f 28 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a061:	e9 c1 ba ff ff       	jmp    25b27 <JS_CallInternal+0x3127>
   2a066:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a06d:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a071:	e8 fa 27 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a076:	e9 48 bb ff ff       	jmp    25bc3 <JS_CallInternal+0x31c3>
   2a07b:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a082:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a086:	e8 e5 27 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a08b:	e9 e5 ba ff ff       	jmp    25b75 <JS_CallInternal+0x3175>
   2a090:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a097:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a09b:	e8 d0 27 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a0a0:	e9 6c bb ff ff       	jmp    25c11 <JS_CallInternal+0x3211>
   2a0a5:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a0ac:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a0b0:	e8 bb 27 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a0b5:	e9 b9 a7 ff ff       	jmp    24873 <JS_CallInternal+0x1e73>
   2a0ba:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a0c1:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a0c5:	e8 a6 27 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a0ca:	e9 b6 a4 ff ff       	jmp    24585 <JS_CallInternal+0x1b85>
   2a0cf:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a0d6:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a0da:	e8 91 27 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a0df:	e9 92 b8 ff ff       	jmp    25976 <JS_CallInternal+0x2f76>
   2a0e4:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a0eb:	4c 89 c2             	mov    rdx,r8
   2a0ee:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a0f2:	e8 79 27 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a0f7:	e9 1b b9 ff ff       	jmp    25a17 <JS_CallInternal+0x3017>
   2a0fc:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a103:	4c 89 c2             	mov    rdx,r8
   2a106:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a10a:	e8 61 27 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a10f:	e9 5e b9 ff ff       	jmp    25a72 <JS_CallInternal+0x3072>
   2a114:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a11b:	4c 89 c2             	mov    rdx,r8
   2a11e:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a122:	e8 49 27 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a127:	e9 a1 b9 ff ff       	jmp    25acd <JS_CallInternal+0x30cd>
   2a12c:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a133:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a137:	e8 34 27 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a13c:	e9 ed b7 ff ff       	jmp    2592e <JS_CallInternal+0x2f2e>
   2a141:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a148:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a14c:	e8 1f 27 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a151:	e9 d9 b6 ff ff       	jmp    2582f <JS_CallInternal+0x2e2f>
   2a156:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a15d:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a161:	e8 0a 27 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a166:	e9 7c b6 ff ff       	jmp    257e7 <JS_CallInternal+0x2de7>
   2a16b:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a172:	48 89 ca             	mov    rdx,rcx
   2a175:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a179:	e8 f2 26 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a17e:	e9 1e b6 ff ff       	jmp    257a1 <JS_CallInternal+0x2da1>
   2a183:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a18a:	4c 89 c6             	mov    rsi,r8
   2a18d:	48 89 ca             	mov    rdx,rcx
   2a190:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a194:	e8 d7 26 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a199:	e9 89 de ff ff       	jmp    28027 <JS_CallInternal+0x5627>
   2a19e:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a1a5:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
   2a1ac:	4c 89 f6             	mov    rsi,r14
   2a1af:	44 89 85 38 fe ff ff 	mov    DWORD PTR [rbp-0x1c8],r8d
   2a1b6:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a1ba:	e8 b1 26 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a1bf:	44 8b 85 38 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x1c8]
   2a1c6:	e9 40 ae ff ff       	jmp    2500b <JS_CallInternal+0x260b>
   2a1cb:	48 8b 7f 10          	mov    rdi,QWORD PTR [rdi+0x10]
   2a1cf:	4c 89 c2             	mov    rdx,r8
   2a1d2:	e8 99 26 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a1d7:	e9 99 ab ff ff       	jmp    24d75 <JS_CallInternal+0x2375>
   2a1dc:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a1e3:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a1e7:	e8 84 26 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a1ec:	e9 53 b3 ff ff       	jmp    25544 <JS_CallInternal+0x2b44>
   2a1f1:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a1f8:	48 89 ca             	mov    rdx,rcx
   2a1fb:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a1ff:	e8 6c 26 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a204:	e9 9e b4 ff ff       	jmp    256a7 <JS_CallInternal+0x2ca7>
   2a209:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a210:	48 89 ca             	mov    rdx,rcx
   2a213:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a217:	e8 54 26 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a21c:	e9 da b4 ff ff       	jmp    256fb <JS_CallInternal+0x2cfb>
   2a221:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a228:	48 89 ca             	mov    rdx,rcx
   2a22b:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a22f:	e8 3c 26 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a234:	e9 16 b5 ff ff       	jmp    2574f <JS_CallInternal+0x2d4f>
   2a239:	4c 8b a5 10 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1f0]
   2a240:	e9 5b 8f ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2a245:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a24c:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   2a253:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
   2a25a:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a25e:	e8 0d 26 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a263:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
   2a26a:	4c 8b 8d 50 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1b0]
   2a271:	e9 d8 c8 ff ff       	jmp    26b4e <JS_CallInternal+0x414e>
   2a276:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a27d:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   2a284:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
   2a28b:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a28f:	e8 dc 25 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a294:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
   2a29b:	4c 8b 8d 50 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1b0]
   2a2a2:	e9 c4 c8 ff ff       	jmp    26b6b <JS_CallInternal+0x416b>
   2a2a7:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a2ae:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   2a2b5:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
   2a2bc:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a2c0:	e8 ab 25 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a2c5:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
   2a2cc:	4c 8b 8d 50 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1b0]
   2a2d3:	e9 b1 c8 ff ff       	jmp    26b89 <JS_CallInternal+0x4189>
   2a2d8:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a2df:	48 89 ca             	mov    rdx,rcx
   2a2e2:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a2e6:	e8 85 25 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a2eb:	e9 80 b9 ff ff       	jmp    25c70 <JS_CallInternal+0x3270>
   2a2f0:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a2f7:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a2fb:	e8 70 25 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a300:	e9 17 ba ff ff       	jmp    25d1c <JS_CallInternal+0x331c>
   2a305:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a30c:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a310:	e8 5b 25 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a315:	e9 6a bb ff ff       	jmp    25e84 <JS_CallInternal+0x3484>
   2a31a:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a321:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a325:	e8 46 25 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a32a:	e9 0a bb ff ff       	jmp    25e39 <JS_CallInternal+0x3439>
   2a32f:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a336:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a33a:	e8 31 25 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a33f:	e9 85 bb ff ff       	jmp    25ec9 <JS_CallInternal+0x34c9>
   2a344:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a34b:	4c 89 f2             	mov    rdx,r14
   2a34e:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   2a355:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a359:	e8 12 25 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a35e:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   2a365:	e9 2b c9 ff ff       	jmp    26c95 <JS_CallInternal+0x4295>
   2a36a:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   2a371:	4c 89 f6             	mov    rsi,r14
   2a374:	4c 89 ea             	mov    rdx,r13
   2a377:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a37e:	48 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rcx
   2a385:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a389:	e8 e2 24 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a38e:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   2a395:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   2a39c:	e9 9e d0 ff ff       	jmp    2743f <JS_CallInternal+0x4a3f>
   2a3a1:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a3a8:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   2a3af:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a3b3:	e8 b8 24 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a3b8:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   2a3bf:	e9 f5 98 ff ff       	jmp    23cb9 <JS_CallInternal+0x12b9>
   2a3c4:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a3cb:	4c 89 c2             	mov    rdx,r8
   2a3ce:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a3d2:	e8 99 24 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a3d7:	e9 15 9e ff ff       	jmp    241f1 <JS_CallInternal+0x17f1>
   2a3dc:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a3e3:	4c 89 c2             	mov    rdx,r8
   2a3e6:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a3ea:	e8 81 24 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a3ef:	e9 58 9d ff ff       	jmp    2414c <JS_CallInternal+0x174c>
   2a3f4:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a3fb:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a3ff:	e8 6c 24 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a404:	e9 8a 9e ff ff       	jmp    24293 <JS_CallInternal+0x1893>
   2a409:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a410:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a414:	e8 57 24 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a419:	e9 22 9e ff ff       	jmp    24240 <JS_CallInternal+0x1840>
   2a41e:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a425:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   2a42c:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a430:	e8 3b 24 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a435:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   2a43c:	e9 86 e5 ff ff       	jmp    289c7 <JS_CallInternal+0x5fc7>
   2a441:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a448:	48 89 ce             	mov    rsi,rcx
   2a44b:	4c 89 ea             	mov    rdx,r13
   2a44e:	44 89 85 50 fe ff ff 	mov    DWORD PTR [rbp-0x1b0],r8d
   2a455:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a459:	e8 12 24 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a45e:	44 8b 85 50 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x1b0]
   2a465:	e9 c5 ab ff ff       	jmp    2502f <JS_CallInternal+0x262f>
   2a46a:	48 83 ec 08          	sub    rsp,0x8
   2a46e:	8b 8d 38 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c8]
   2a474:	4c 89 ee             	mov    rsi,r13
   2a477:	4c 89 e2             	mov    rdx,r12
   2a47a:	4c 8b 85 50 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1b0]
   2a481:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2a488:	6a 00                	push   0x0
   2a48a:	4c 8b 8d 58 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1a8]
   2a491:	e8 aa 23 00 00       	call   2c840 <JS_GetPropertyInternal>
   2a496:	5f                   	pop    rdi
   2a497:	41 58                	pop    r8
   2a499:	48 89 c1             	mov    rcx,rax
   2a49c:	48 89 d0             	mov    rax,rdx
   2a49f:	83 fa 06             	cmp    edx,0x6
   2a4a2:	0f 85 b3 8f ff ff    	jne    2345b <JS_CallInternal+0xa5b>
   2a4a8:	e9 59 90 ff ff       	jmp    23506 <JS_CallInternal+0xb06>
   2a4ad:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a4b4:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a4b8:	e8 b3 23 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a4bd:	e9 65 a4 ff ff       	jmp    24927 <JS_CallInternal+0x1f27>
   2a4c2:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a4c9:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a4cd:	e8 9e 23 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a4d2:	e9 9b a1 ff ff       	jmp    24672 <JS_CallInternal+0x1c72>
   2a4d7:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a4de:	4c 89 c2             	mov    rdx,r8
   2a4e1:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a4e5:	e8 86 23 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a4ea:	e9 31 a1 ff ff       	jmp    24620 <JS_CallInternal+0x1c20>
   2a4ef:	88 85 40 fe ff ff    	mov    BYTE PTR [rbp-0x1c0],al
   2a4f5:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a4fc:	4c 89 ce             	mov    rsi,r9
   2a4ff:	4c 89 ea             	mov    rdx,r13
   2a502:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a506:	e8 65 23 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a50b:	0f b6 85 40 fe ff ff 	movzx  eax,BYTE PTR [rbp-0x1c0]
   2a512:	e9 4d a9 ff ff       	jmp    24e64 <JS_CallInternal+0x2464>
   2a517:	88 85 40 fe ff ff    	mov    BYTE PTR [rbp-0x1c0],al
   2a51d:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a524:	48 89 ce             	mov    rsi,rcx
   2a527:	4c 89 f2             	mov    rdx,r14
   2a52a:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a52e:	e8 3d 23 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a533:	0f b6 85 40 fe ff ff 	movzx  eax,BYTE PTR [rbp-0x1c0]
   2a53a:	e9 49 a9 ff ff       	jmp    24e88 <JS_CallInternal+0x2488>
   2a53f:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2a546:	8b 4e 04             	mov    ecx,DWORD PTR [rsi+0x4]
   2a549:	48 89 b5 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rsi
   2a550:	4c 8b ad e8 fe ff ff 	mov    r13,QWORD PTR [rbp-0x118]
   2a557:	4c 89 70 30          	mov    QWORD PTR [rax+0x30],r14
   2a55b:	49 8b b5 80 01 00 00 	mov    rsi,QWORD PTR [r13+0x180]
   2a562:	49 8b 95 88 01 00 00 	mov    rdx,QWORD PTR [r13+0x188]
   2a569:	4c 89 ef             	mov    rdi,r13
   2a56c:	e8 3f 34 04 00       	call   6d9b0 <JS_HasProperty>
   2a571:	85 c0                	test   eax,eax
   2a573:	0f 88 3b 1f 00 00    	js     2c4b4 <JS_CallInternal+0x9ab4>
   2a579:	4c 8b 95 50 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1b0]
   2a580:	0f 85 10 03 00 00    	jne    2a896 <JS_CallInternal+0x7e96>
   2a586:	49 8b 45 10          	mov    rax,QWORD PTR [r13+0x10]
   2a58a:	4c 89 ef             	mov    rdi,r13
   2a58d:	48 8b 80 f0 04 00 00 	mov    rax,QWORD PTR [rax+0x4f0]
   2a594:	48 85 c0             	test   rax,rax
   2a597:	0f 84 f9 02 00 00    	je     2a896 <JS_CallInternal+0x7e96>
   2a59d:	f6 40 3c 01          	test   BYTE PTR [rax+0x3c],0x1
   2a5a1:	0f 84 ef 02 00 00    	je     2a896 <JS_CallInternal+0x7e96>
   2a5a7:	41 8b 72 04          	mov    esi,DWORD PTR [r10+0x4]
   2a5ab:	4d 89 f4             	mov    r12,r14
   2a5ae:	e8 1d 83 00 00       	call   328d0 <JS_ThrowReferenceErrorNotDefined>
   2a5b3:	e9 e8 8b ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2a5b8:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
   2a5bf:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a5c6:	44 89 85 38 fe ff ff 	mov    DWORD PTR [rbp-0x1c8],r8d
   2a5cd:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a5d1:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   2a5d8:	e8 93 22 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a5dd:	44 8b 85 38 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x1c8]
   2a5e4:	48 8b 85 40 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c0]
   2a5eb:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   2a5f2:	e9 3f db ff ff       	jmp    28136 <JS_CallInternal+0x5736>
   2a5f7:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a5fe:	4c 89 95 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r10
   2a605:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a609:	e8 62 22 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a60e:	4c 8b 95 40 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c0]
   2a615:	e9 6a df ff ff       	jmp    28584 <JS_CallInternal+0x5b84>
   2a61a:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a621:	48 89 ca             	mov    rdx,rcx
   2a624:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a628:	e8 43 22 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a62d:	e9 3b 9d ff ff       	jmp    2436d <JS_CallInternal+0x196d>
   2a632:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
   2a639:	4c 89 ee             	mov    rsi,r13
   2a63c:	4c 89 ca             	mov    rdx,r9
   2a63f:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a646:	44 89 85 28 fe ff ff 	mov    DWORD PTR [rbp-0x1d8],r8d
   2a64d:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a651:	48 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rcx
   2a658:	e8 13 22 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a65d:	44 8b 85 28 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x1d8]
   2a664:	48 8b 85 38 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c8]
   2a66b:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   2a672:	e9 9b da ff ff       	jmp    28112 <JS_CallInternal+0x5712>
   2a677:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   2a67e:	4c 89 ee             	mov    rsi,r13
   2a681:	4c 89 f2             	mov    rdx,r14
   2a684:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a68b:	48 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rcx
   2a692:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a696:	e8 d5 21 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a69b:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   2a6a2:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   2a6a9:	e9 03 a3 ff ff       	jmp    249b1 <JS_CallInternal+0x1fb1>
   2a6ae:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a6b5:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a6b9:	e8 b2 21 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a6be:	e9 30 e2 ff ff       	jmp    288f3 <JS_CallInternal+0x5ef3>
   2a6c3:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a6ca:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a6ce:	e8 9d 21 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a6d3:	e9 38 e2 ff ff       	jmp    28910 <JS_CallInternal+0x5f10>
   2a6d8:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a6df:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a6e3:	e8 88 21 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a6e8:	e9 b4 de ff ff       	jmp    285a1 <JS_CallInternal+0x5ba1>
   2a6ed:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a6f4:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a6f8:	e8 73 21 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a6fd:	e9 bc de ff ff       	jmp    285be <JS_CallInternal+0x5bbe>
   2a702:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a709:	48 89 ca             	mov    rdx,rcx
   2a70c:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a710:	e8 5b 21 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a715:	e9 12 df ff ff       	jmp    2862c <JS_CallInternal+0x5c2c>
   2a71a:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a721:	4c 89 f6             	mov    rsi,r14
   2a724:	4c 89 ea             	mov    rdx,r13
   2a727:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a72b:	e8 40 21 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a730:	e9 52 df ff ff       	jmp    28687 <JS_CallInternal+0x5c87>
   2a735:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a73c:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a740:	e8 2b 21 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a745:	e9 b1 e6 ff ff       	jmp    28dfb <JS_CallInternal+0x63fb>
   2a74a:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a751:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a755:	e8 16 21 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a75a:	e9 83 cd ff ff       	jmp    274e2 <JS_CallInternal+0x4ae2>
   2a75f:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a766:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a76a:	e8 01 21 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a76f:	e9 ee d2 ff ff       	jmp    27a62 <JS_CallInternal+0x5062>
   2a774:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a77b:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a77f:	e8 ec 20 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a784:	e9 4e e6 ff ff       	jmp    28dd7 <JS_CallInternal+0x63d7>
   2a789:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a790:	48 89 ca             	mov    rdx,rcx
   2a793:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a797:	e8 d4 20 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a79c:	e9 72 9c ff ff       	jmp    24413 <JS_CallInternal+0x1a13>
   2a7a1:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a7a8:	48 89 ca             	mov    rdx,rcx
   2a7ab:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a7af:	e8 bc 20 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a7b4:	e9 f6 9c ff ff       	jmp    244af <JS_CallInternal+0x1aaf>
   2a7b9:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a7c0:	48 89 ca             	mov    rdx,rcx
   2a7c3:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a7c7:	e8 a4 20 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a7cc:	e9 ee 9b ff ff       	jmp    243bf <JS_CallInternal+0x19bf>
   2a7d1:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a7d8:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a7dc:	e8 8f 20 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a7e1:	e9 11 9d ff ff       	jmp    244f7 <JS_CallInternal+0x1af7>
   2a7e6:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a7ed:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a7f1:	e8 7a 20 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a7f6:	e9 60 9c ff ff       	jmp    2445b <JS_CallInternal+0x1a5b>
   2a7fb:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a802:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a806:	e8 65 20 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a80b:	e9 2f 9d ff ff       	jmp    2453f <JS_CallInternal+0x1b3f>
   2a810:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   2a817:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a81e:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   2a825:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a829:	e8 42 20 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a82e:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
   2a835:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   2a83c:	e9 ed 93 ff ff       	jmp    23c2e <JS_CallInternal+0x122e>
   2a841:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   2a848:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a84f:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   2a856:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a85a:	e8 11 20 ff ff       	call   1c870 <__JS_FreeValueRT>
   2a85f:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
   2a866:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   2a86d:	e9 d9 93 ff ff       	jmp    23c4b <JS_CallInternal+0x124b>
   2a872:	4c 89 f3             	mov    rbx,r14
   2a875:	e9 26 89 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2a87a:	4c 89 f3             	mov    rbx,r14
   2a87d:	e9 1e 89 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2a882:	4c 8b a5 28 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1d8]
   2a889:	e9 12 89 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2a88e:	4d 89 d4             	mov    r12,r10
   2a891:	e9 0a 89 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2a896:	48 83 ec 08          	sub    rsp,0x8
   2a89a:	41 8b 4a 04          	mov    ecx,DWORD PTR [r10+0x4]
   2a89e:	4c 8b 43 f0          	mov    r8,QWORD PTR [rbx-0x10]
   2a8a2:	48 83 eb 10          	sub    rbx,0x10
   2a8a6:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a8ad:	4c 8b 4b 08          	mov    r9,QWORD PTR [rbx+0x8]
   2a8b1:	48 8b b0 80 01 00 00 	mov    rsi,QWORD PTR [rax+0x180]
   2a8b8:	48 8b 90 88 01 00 00 	mov    rdx,QWORD PTR [rax+0x188]
   2a8bf:	68 00 80 00 00       	push   0x8000
   2a8c4:	48 89 c7             	mov    rdi,rax
   2a8c7:	ff b0 88 01 00 00    	push   QWORD PTR [rax+0x188]
   2a8cd:	ff b0 80 01 00 00    	push   QWORD PTR [rax+0x180]
   2a8d3:	e8 98 2c 00 00       	call   2d570 <JS_SetPropertyInternal>
   2a8d8:	48 83 c4 20          	add    rsp,0x20
   2a8dc:	85 c0                	test   eax,eax
   2a8de:	0f 89 89 90 ff ff    	jns    2396d <JS_CallInternal+0xf6d>
   2a8e4:	4d 89 f4             	mov    r12,r14
   2a8e7:	e9 b4 88 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2a8ec:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   2a8f0:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2a8f7:	48 8d 35 62 1c 0a 00 	lea    rsi,[rip+0xa1c62]        # cc560 <_IO_stdin_used+0x560>
   2a8fe:	31 c0                	xor    eax,eax
   2a900:	e8 ab 5d 00 00       	call   306b0 <JS_ThrowTypeError>
   2a905:	e9 a2 de ff ff       	jmp    287ac <JS_CallInternal+0x5dac>
   2a90a:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2a911:	48 8d 35 3a 1c 0a 00 	lea    rsi,[rip+0xa1c3a]        # cc552 <_IO_stdin_used+0x552>
   2a918:	31 c0                	xor    eax,eax
   2a91a:	e8 91 5d 00 00       	call   306b0 <JS_ThrowTypeError>
   2a91f:	e9 88 de ff ff       	jmp    287ac <JS_CallInternal+0x5dac>
   2a924:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2a92b:	31 c0                	xor    eax,eax
   2a92d:	48 8d 35 14 1c 0a 00 	lea    rsi,[rip+0xa1c14]        # cc548 <_IO_stdin_used+0x548>
   2a934:	e8 57 81 00 00       	call   32a90 <JS_ThrowInternalError>
   2a939:	83 fb f6             	cmp    ebx,0xfffffff6
   2a93c:	76 13                	jbe    2a951 <JS_CallInternal+0x7f51>
   2a93e:	41 8b 45 fc          	mov    eax,DWORD PTR [r13-0x4]
   2a942:	83 e8 01             	sub    eax,0x1
   2a945:	41 89 45 fc          	mov    DWORD PTR [r13-0x4],eax
   2a949:	85 c0                	test   eax,eax
   2a94b:	0f 8e fe 18 00 00    	jle    2c24f <JS_CallInternal+0x984f>
   2a951:	4c 89 f3             	mov    rbx,r14
   2a954:	e9 47 88 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2a959:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2a960:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2a967:	44 89 ea             	mov    edx,r13d
   2a96a:	48 89 de             	mov    rsi,rbx
   2a96d:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   2a971:	e8 8a aa 02 00       	call   55400 <js_binary_logic_slow>
   2a976:	85 c0                	test   eax,eax
   2a978:	0f 85 22 88 ff ff    	jne    231a0 <JS_CallInternal+0x7a0>
   2a97e:	48 83 eb 10          	sub    rbx,0x10
   2a982:	e9 63 d0 ff ff       	jmp    279ea <JS_CallInternal+0x4fea>
   2a987:	0f 85 e3 1b 00 00    	jne    2c570 <JS_CallInternal+0x9b70>
   2a98d:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a994:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a998:	48 8b 87 f0 04 00 00 	mov    rax,QWORD PTR [rdi+0x4f0]
   2a99f:	48 85 c0             	test   rax,rax
   2a9a2:	0f 84 f2 0f 00 00    	je     2b99a <JS_CallInternal+0x8f9a>
   2a9a8:	f6 40 3c 01          	test   BYTE PTR [rax+0x3c],0x1
   2a9ac:	0f 84 e8 0f 00 00    	je     2b99a <JS_CallInternal+0x8f9a>
   2a9b2:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2a9b9:	44 89 ee             	mov    esi,r13d
   2a9bc:	e8 0f 7f 00 00       	call   328d0 <JS_ThrowReferenceErrorNotDefined>
   2a9c1:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   2a9c8:	0f 8e d2 87 ff ff    	jle    231a0 <JS_CallInternal+0x7a0>
   2a9ce:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2a9d5:	44 89 ee             	mov    esi,r13d
   2a9d8:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2a9dc:	e8 8f e9 fe ff       	call   19370 <JS_FreeAtom.part.0.isra.0>
   2a9e1:	e9 ba 87 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2a9e6:	4c 8b bd e8 fe ff ff 	mov    r15,QWORD PTR [rbp-0x118]
   2a9ed:	48 8d 75 80          	lea    rsi,[rbp-0x80]
   2a9f1:	44 89 ea             	mov    edx,r13d
   2a9f4:	49 8b 7f 10          	mov    rdi,QWORD PTR [r15+0x10]
   2a9f8:	e8 e3 c8 fe ff       	call   172e0 <JS_AtomGetStrRT.constprop.0>
   2a9fd:	48 8d 35 89 1b 0a 00 	lea    rsi,[rip+0xa1b89]        # cc58d <_IO_stdin_used+0x58d>
   2aa04:	4c 89 ff             	mov    rdi,r15
   2aa07:	48 89 c2             	mov    rdx,rax
   2aa0a:	31 c0                	xor    eax,eax
   2aa0c:	e8 8f 7d 00 00       	call   327a0 <JS_ThrowReferenceError>
   2aa11:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   2aa18:	0f 8e 82 87 ff ff    	jle    231a0 <JS_CallInternal+0x7a0>
   2aa1e:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2aa25:	44 89 ee             	mov    esi,r13d
   2aa28:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2aa2c:	e8 3f e9 fe ff       	call   19370 <JS_FreeAtom.part.0.isra.0>
   2aa31:	e9 6a 87 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2aa36:	0f 85 07 1b 00 00    	jne    2c543 <JS_CallInternal+0x9b43>
   2aa3c:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2aa43:	48 8b 47 10          	mov    rax,QWORD PTR [rdi+0x10]
   2aa47:	48 8b 80 f0 04 00 00 	mov    rax,QWORD PTR [rax+0x4f0]
   2aa4e:	48 85 c0             	test   rax,rax
   2aa51:	0f 84 ea cb ff ff    	je     27641 <JS_CallInternal+0x4c41>
   2aa57:	f6 40 3c 01          	test   BYTE PTR [rax+0x3c],0x1
   2aa5b:	0f 84 e0 cb ff ff    	je     27641 <JS_CallInternal+0x4c41>
   2aa61:	44 89 ee             	mov    esi,r13d
   2aa64:	e8 67 7e 00 00       	call   328d0 <JS_ThrowReferenceErrorNotDefined>
   2aa69:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   2aa70:	0f 8e 2a 87 ff ff    	jle    231a0 <JS_CallInternal+0x7a0>
   2aa76:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2aa7d:	44 89 ee             	mov    esi,r13d
   2aa80:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2aa84:	e8 e7 e8 fe ff       	call   19370 <JS_FreeAtom.part.0.isra.0>
   2aa89:	e9 12 87 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2aa8e:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2aa95:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
   2aa99:	48 8b 80 f0 04 00 00 	mov    rax,QWORD PTR [rax+0x4f0]
   2aaa0:	48 85 c0             	test   rax,rax
   2aaa3:	0f 84 9f 0f 00 00    	je     2ba48 <JS_CallInternal+0x9048>
   2aaa9:	f6 40 3c 01          	test   BYTE PTR [rax+0x3c],0x1
   2aaad:	0f 84 95 0f 00 00    	je     2ba48 <JS_CallInternal+0x9048>
   2aab3:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2aaba:	44 89 ee             	mov    esi,r13d
   2aabd:	e8 0e 7e 00 00       	call   328d0 <JS_ThrowReferenceErrorNotDefined>
   2aac2:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   2aac9:	0f 8e d1 86 ff ff    	jle    231a0 <JS_CallInternal+0x7a0>
   2aacf:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2aad6:	44 89 ee             	mov    esi,r13d
   2aad9:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2aadd:	e8 8e e8 fe ff       	call   19370 <JS_FreeAtom.part.0.isra.0>
   2aae2:	e9 b9 86 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2aae7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   2aaee:	00 00 
   2aaf0:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2aaf7:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2aafb:	e8 70 1d ff ff       	call   1c870 <__JS_FreeValueRT>
   2ab00:	e9 a1 cb ff ff       	jmp    276a6 <JS_CallInternal+0x4ca6>
   2ab05:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ab0c:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ab10:	e8 5b 1d ff ff       	call   1c870 <__JS_FreeValueRT>
   2ab15:	e9 a9 cb ff ff       	jmp    276c3 <JS_CallInternal+0x4cc3>
   2ab1a:	83 fe 08             	cmp    esi,0x8
   2ab1d:	0f 84 d7 14 00 00    	je     2bffa <JS_CallInternal+0x95fa>
   2ab23:	83 f9 08             	cmp    ecx,0x8
   2ab26:	75 08                	jne    2ab30 <JS_CallInternal+0x8130>
   2ab28:	85 f6                	test   esi,esi
   2ab2a:	0f 84 72 16 00 00    	je     2c1a2 <JS_CallInternal+0x97a2>
   2ab30:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2ab37:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2ab3e:	44 89 ea             	mov    edx,r13d
   2ab41:	48 89 de             	mov    rsi,rbx
   2ab44:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   2ab48:	e8 63 f7 02 00       	call   5a2b0 <js_relational_slow>
   2ab4d:	85 c0                	test   eax,eax
   2ab4f:	0f 85 4b 86 ff ff    	jne    231a0 <JS_CallInternal+0x7a0>
   2ab55:	48 83 eb 10          	sub    rbx,0x10
   2ab59:	e9 12 ba ff ff       	jmp    26570 <JS_CallInternal+0x3b70>
   2ab5e:	4c 89 f3             	mov    rbx,r14
   2ab61:	e9 3a 86 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2ab66:	41 83 fd fa          	cmp    r13d,0xfffffffa
   2ab6a:	0f 8d a2 0f 00 00    	jge    2bb12 <JS_CallInternal+0x9112>
   2ab70:	41 83 fd f8          	cmp    r13d,0xfffffff8
   2ab74:	0f 8d f4 ef ff ff    	jge    29b6e <JS_CallInternal+0x716e>
   2ab7a:	83 e8 02             	sub    eax,0x2
   2ab7d:	83 f8 01             	cmp    eax,0x1
   2ab80:	0f 87 8f ef ff ff    	ja     29b15 <JS_CallInternal+0x7115>
   2ab86:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2ab8d:	48 8d 35 e3 19 0a 00 	lea    rsi,[rip+0xa19e3]        # cc577 <_IO_stdin_used+0x577>
   2ab94:	31 c0                	xor    eax,eax
   2ab96:	e8 15 5b 00 00       	call   306b0 <JS_ThrowTypeError>
   2ab9b:	e9 00 86 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2aba0:	48 8b b5 d8 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x128]
   2aba7:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2abae:	0f b7 d1             	movzx  edx,cx
   2abb1:	31 c9                	xor    ecx,ecx
   2abb3:	4d 89 ec             	mov    r12,r13
   2abb6:	e8 75 7d 00 00       	call   32930 <JS_ThrowReferenceErrorUninitialized2.isra.0>
   2abbb:	e9 e0 85 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2abc0:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2abc7:	48 8d 35 b2 51 0a 00 	lea    rsi,[rip+0xa51b2]        # cfd80 <_IO_stdin_used+0x3d80>
   2abce:	31 c0                	xor    eax,eax
   2abd0:	4d 89 ec             	mov    r12,r13
   2abd3:	e8 c8 7b 00 00       	call   327a0 <JS_ThrowReferenceError>
   2abd8:	e9 c3 85 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2abdd:	48 8b b5 d8 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x128]
   2abe4:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2abeb:	31 c9                	xor    ecx,ecx
   2abed:	4d 89 ec             	mov    r12,r13
   2abf0:	e8 3b 7d 00 00       	call   32930 <JS_ThrowReferenceErrorUninitialized2.isra.0>
   2abf5:	e9 a6 85 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2abfa:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2ac01:	48 8d 35 58 19 0a 00 	lea    rsi,[rip+0xa1958]        # cc560 <_IO_stdin_used+0x560>
   2ac08:	31 c0                	xor    eax,eax
   2ac0a:	e8 a1 5a 00 00       	call   306b0 <JS_ThrowTypeError>
   2ac0f:	83 bd 50 fe ff ff f6 	cmp    DWORD PTR [rbp-0x1b0],0xfffffff6
   2ac16:	76 13                	jbe    2ac2b <JS_CallInternal+0x822b>
   2ac18:	41 8b 45 fc          	mov    eax,DWORD PTR [r13-0x4]
   2ac1c:	83 e8 01             	sub    eax,0x1
   2ac1f:	41 89 45 fc          	mov    DWORD PTR [r13-0x4],eax
   2ac23:	85 c0                	test   eax,eax
   2ac25:	0f 8e 70 16 00 00    	jle    2c29b <JS_CallInternal+0x989b>
   2ac2b:	41 bd ff ff ff ff    	mov    r13d,0xffffffff
   2ac31:	e9 a0 dc ff ff       	jmp    288d6 <JS_CallInternal+0x5ed6>
   2ac36:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2ac3d:	48 8d 35 0e 19 0a 00 	lea    rsi,[rip+0xa190e]        # cc552 <_IO_stdin_used+0x552>
   2ac44:	31 c0                	xor    eax,eax
   2ac46:	e8 65 5a 00 00       	call   306b0 <JS_ThrowTypeError>
   2ac4b:	eb c2                	jmp    2ac0f <JS_CallInternal+0x820f>
   2ac4d:	48 8b bd 38 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x1c8]
   2ac54:	e8 17 1c ff ff       	call   1c870 <__JS_FreeValueRT>
   2ac59:	e9 75 dc ff ff       	jmp    288d3 <JS_CallInternal+0x5ed3>
   2ac5e:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ac65:	4c 89 ee             	mov    rsi,r13
   2ac68:	4c 89 f2             	mov    rdx,r14
   2ac6b:	44 89 85 50 fe ff ff 	mov    DWORD PTR [rbp-0x1b0],r8d
   2ac72:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ac76:	e8 f5 1b ff ff       	call   1c870 <__JS_FreeValueRT>
   2ac7b:	44 8b 85 50 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x1b0]
   2ac82:	e9 8e a0 ff ff       	jmp    24d15 <JS_CallInternal+0x2315>
   2ac87:	41 83 f8 08          	cmp    r8d,0x8
   2ac8b:	0f 84 67 11 00 00    	je     2bdf8 <JS_CallInternal+0x93f8>
   2ac91:	41 83 f8 ff          	cmp    r8d,0xffffffff
   2ac95:	0f 84 17 11 00 00    	je     2bdb2 <JS_CallInternal+0x93b2>
   2ac9b:	41 8d 48 fe          	lea    ecx,[r8-0x2]
   2ac9f:	83 f9 01             	cmp    ecx,0x1
   2aca2:	0f 86 aa 1a 00 00    	jbe    2c752 <JS_CallInternal+0x9d52>
   2aca8:	41 83 f8 f9          	cmp    r8d,0xfffffff9
   2acac:	0f 85 c2 10 00 00    	jne    2bd74 <JS_CallInternal+0x9374>
   2acb2:	41 83 fe f9          	cmp    r14d,0xfffffff9
   2acb6:	0f 85 b8 10 00 00    	jne    2bd74 <JS_CallInternal+0x9374>
   2acbc:	4c 89 ee             	mov    rsi,r13
   2acbf:	48 89 95 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rdx
   2acc6:	4c 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r8
   2accd:	e8 0e d1 fe ff       	call   17de0 <js_string_eq.isra.0>
   2acd2:	48 8b b5 40 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c0]
   2acd9:	48 8b 95 38 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c8]
   2ace0:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   2ace6:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2aced:	e8 de 1c ff ff       	call   1c9d0 <JS_FreeValue>
   2acf2:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2acf9:	4c 89 ee             	mov    rsi,r13
   2acfc:	4c 89 f2             	mov    rdx,r14
   2acff:	e8 cc 1c ff ff       	call   1c9d0 <JS_FreeValue>
   2ad04:	8b 85 50 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1b0]
   2ad0a:	85 c0                	test   eax,eax
   2ad0c:	0f 95 c0             	setne  al
   2ad0f:	0f b6 c0             	movzx  eax,al
   2ad12:	e9 c8 a3 ff ff       	jmp    250df <JS_CallInternal+0x26df>
   2ad17:	ba 01 00 00 00       	mov    edx,0x1
   2ad1c:	be 03 00 00 00       	mov    esi,0x3
   2ad21:	31 ff                	xor    edi,edi
   2ad23:	e9 67 d6 ff ff       	jmp    2838f <JS_CallInternal+0x598f>
   2ad28:	41 83 fd 08          	cmp    r13d,0x8
   2ad2c:	0f 84 d0 13 00 00    	je     2c102 <JS_CallInternal+0x9702>
   2ad32:	41 83 fd ff          	cmp    r13d,0xffffffff
   2ad36:	0f 84 5f 13 00 00    	je     2c09b <JS_CallInternal+0x969b>
   2ad3c:	41 8d 4d fe          	lea    ecx,[r13-0x2]
   2ad40:	83 f9 01             	cmp    ecx,0x1
   2ad43:	0f 86 13 13 00 00    	jbe    2c05c <JS_CallInternal+0x965c>
   2ad49:	4c 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r8
   2ad50:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   2ad57:	41 83 fd f9          	cmp    r13d,0xfffffff9
   2ad5b:	0f 85 bc ee ff ff    	jne    29c1d <JS_CallInternal+0x721d>
   2ad61:	41 83 f8 f9          	cmp    r8d,0xfffffff9
   2ad65:	0f 85 b2 ee ff ff    	jne    29c1d <JS_CallInternal+0x721d>
   2ad6b:	e8 70 d0 fe ff       	call   17de0 <js_string_eq.isra.0>
   2ad70:	4c 89 f6             	mov    rsi,r14
   2ad73:	4c 8b b5 e8 fe ff ff 	mov    r14,QWORD PTR [rbp-0x118]
   2ad7a:	4c 89 ea             	mov    rdx,r13
   2ad7d:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   2ad83:	4c 89 f7             	mov    rdi,r14
   2ad86:	e8 45 1c ff ff       	call   1c9d0 <JS_FreeValue>
   2ad8b:	48 8b b5 40 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c0]
   2ad92:	48 8b 95 38 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c8]
   2ad99:	4c 89 f7             	mov    rdi,r14
   2ad9c:	e8 2f 1c ff ff       	call   1c9d0 <JS_FreeValue>
   2ada1:	8b 85 50 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1b0]
   2ada7:	85 c0                	test   eax,eax
   2ada9:	0f 95 c0             	setne  al
   2adac:	e9 e8 a3 ff ff       	jmp    25199 <JS_CallInternal+0x2799>
   2adb1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   2adb8:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2adbf:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2adc6:	48 89 de             	mov    rsi,rbx
   2adc9:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   2adcd:	e8 5e a4 02 00       	call   55230 <js_shr_slow>
   2add2:	85 c0                	test   eax,eax
   2add4:	0f 85 c6 83 ff ff    	jne    231a0 <JS_CallInternal+0x7a0>
   2adda:	48 83 eb 10          	sub    rbx,0x10
   2adde:	e9 e5 bc ff ff       	jmp    26ac8 <JS_CallInternal+0x40c8>
   2ade3:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
   2adea:	48 8d 15 a9 16 0a 00 	lea    rdx,[rip+0xa16a9]        # cc49a <_IO_stdin_used+0x49a>
   2adf1:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
   2adf5:	8b 44 08 04          	mov    eax,DWORD PTR [rax+rcx*1+0x4]
   2adf9:	85 c0                	test   eax,eax
   2adfb:	0f 85 e9 10 00 00    	jne    2beea <JS_CallInternal+0x94ea>
   2ae01:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2ae08:	48 8d 35 e7 16 0a 00 	lea    rsi,[rip+0xa16e7]        # cc4f6 <_IO_stdin_used+0x4f6>
   2ae0f:	31 c0                	xor    eax,eax
   2ae11:	4d 89 ec             	mov    r12,r13
   2ae14:	e8 87 79 00 00       	call   327a0 <JS_ThrowReferenceError>
   2ae19:	e9 82 83 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2ae1e:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ae25:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ae29:	e8 42 1a ff ff       	call   1c870 <__JS_FreeValueRT>
   2ae2e:	e9 74 9c ff ff       	jmp    24aa7 <JS_CallInternal+0x20a7>
   2ae33:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ae3a:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ae3e:	e9 64 df ff ff       	jmp    28da7 <JS_CallInternal+0x63a7>
   2ae43:	4d 89 d4             	mov    r12,r10
   2ae46:	e9 55 83 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2ae4b:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
   2ae52:	48 8d 15 41 16 0a 00 	lea    rdx,[rip+0xa1641]        # cc49a <_IO_stdin_used+0x49a>
   2ae59:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
   2ae5d:	8b 44 08 04          	mov    eax,DWORD PTR [rax+rcx*1+0x4]
   2ae61:	85 c0                	test   eax,eax
   2ae63:	0f 85 aa 13 00 00    	jne    2c213 <JS_CallInternal+0x9813>
   2ae69:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2ae70:	48 8d 35 7f 16 0a 00 	lea    rsi,[rip+0xa167f]        # cc4f6 <_IO_stdin_used+0x4f6>
   2ae77:	31 c0                	xor    eax,eax
   2ae79:	4d 89 ec             	mov    r12,r13
   2ae7c:	e8 1f 79 00 00       	call   327a0 <JS_ThrowReferenceError>
   2ae81:	e9 1a 83 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2ae86:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
   2ae8d:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
   2ae91:	8b 44 10 04          	mov    eax,DWORD PTR [rax+rdx*1+0x4]
   2ae95:	48 8d 15 fe 15 0a 00 	lea    rdx,[rip+0xa15fe]        # cc49a <_IO_stdin_used+0x49a>
   2ae9c:	85 c0                	test   eax,eax
   2ae9e:	0f 85 8d 13 00 00    	jne    2c231 <JS_CallInternal+0x9831>
   2aea4:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2aeab:	48 8d 35 44 16 0a 00 	lea    rsi,[rip+0xa1644]        # cc4f6 <_IO_stdin_used+0x4f6>
   2aeb2:	31 c0                	xor    eax,eax
   2aeb4:	4d 89 ec             	mov    r12,r13
   2aeb7:	e8 e4 78 00 00       	call   327a0 <JS_ThrowReferenceError>
   2aebc:	e9 df 82 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2aec1:	66 0f ef c0          	pxor   xmm0,xmm0
   2aec5:	f2 48 0f 2a c0       	cvtsi2sd xmm0,rax
   2aeca:	b8 08 00 00 00       	mov    eax,0x8
   2aecf:	f2 0f 11 43 e0       	movsd  QWORD PTR [rbx-0x20],xmm0
   2aed4:	e9 3e b5 ff ff       	jmp    26417 <JS_CallInternal+0x3a17>
   2aed9:	4c 89 f3             	mov    rbx,r14
   2aedc:	4d 89 ec             	mov    r12,r13
   2aedf:	e9 bc 82 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2aee4:	83 fa 08             	cmp    edx,0x8
   2aee7:	0f 84 41 0e 00 00    	je     2bd2e <JS_CallInternal+0x932e>
   2aeed:	83 f8 08             	cmp    eax,0x8
   2aef0:	0f 85 b8 b3 ff ff    	jne    262ae <JS_CallInternal+0x38ae>
   2aef6:	85 d2                	test   edx,edx
   2aef8:	0f 85 b0 b3 ff ff    	jne    262ae <JS_CallInternal+0x38ae>
   2aefe:	66 0f ef c0          	pxor   xmm0,xmm0
   2af02:	f2 0f 2a c7          	cvtsi2sd xmm0,edi
   2af06:	66 48 0f 6e c9       	movq   xmm1,rcx
   2af0b:	f2 0f 5c c1          	subsd  xmm0,xmm1
   2af0f:	48 8d 53 f0          	lea    rdx,[rbx-0x10]
   2af13:	b8 08 00 00 00       	mov    eax,0x8
   2af18:	f2 0f 11 43 e0       	movsd  QWORD PTR [rbx-0x20],xmm0
   2af1d:	e9 f9 b4 ff ff       	jmp    2641b <JS_CallInternal+0x3a1b>
   2af22:	4c 89 f3             	mov    rbx,r14
   2af25:	4d 89 ec             	mov    r12,r13
   2af28:	e9 73 82 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2af2d:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2af34:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2af3b:	44 89 ea             	mov    edx,r13d
   2af3e:	48 89 de             	mov    rsi,rbx
   2af41:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   2af45:	e8 b6 a4 02 00       	call   55400 <js_binary_logic_slow>
   2af4a:	85 c0                	test   eax,eax
   2af4c:	0f 85 4e 82 ff ff    	jne    231a0 <JS_CallInternal+0x7a0>
   2af52:	48 83 eb 10          	sub    rbx,0x10
   2af56:	e9 88 c8 ff ff       	jmp    277e3 <JS_CallInternal+0x4de3>
   2af5b:	83 fe 08             	cmp    esi,0x8
   2af5e:	0f 84 9c 13 00 00    	je     2c300 <JS_CallInternal+0x9900>
   2af64:	83 f9 08             	cmp    ecx,0x8
   2af67:	75 08                	jne    2af71 <JS_CallInternal+0x8571>
   2af69:	85 f6                	test   esi,esi
   2af6b:	0f 84 ed 13 00 00    	je     2c35e <JS_CallInternal+0x995e>
   2af71:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2af78:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2af7f:	44 89 ea             	mov    edx,r13d
   2af82:	48 89 de             	mov    rsi,rbx
   2af85:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   2af89:	e8 22 f3 02 00       	call   5a2b0 <js_relational_slow>
   2af8e:	85 c0                	test   eax,eax
   2af90:	0f 85 0a 82 ff ff    	jne    231a0 <JS_CallInternal+0x7a0>
   2af96:	48 83 eb 10          	sub    rbx,0x10
   2af9a:	e9 e1 ba ff ff       	jmp    26a80 <JS_CallInternal+0x4080>
   2af9f:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2afa6:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2afad:	44 89 ea             	mov    edx,r13d
   2afb0:	48 89 de             	mov    rsi,rbx
   2afb3:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   2afb7:	e8 44 a4 02 00       	call   55400 <js_binary_logic_slow>
   2afbc:	85 c0                	test   eax,eax
   2afbe:	0f 85 dc 81 ff ff    	jne    231a0 <JS_CallInternal+0x7a0>
   2afc4:	48 83 eb 10          	sub    rbx,0x10
   2afc8:	e9 d9 c7 ff ff       	jmp    277a6 <JS_CallInternal+0x4da6>
   2afcd:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2afd4:	48 8d 35 77 15 0a 00 	lea    rsi,[rip+0xa1577]        # cc552 <_IO_stdin_used+0x552>
   2afdb:	31 c0                	xor    eax,eax
   2afdd:	e8 ce 56 00 00       	call   306b0 <JS_ThrowTypeError>
   2afe2:	4c 8b 6b f0          	mov    r13,QWORD PTR [rbx-0x10]
   2afe6:	4d 8b 4e 08          	mov    r9,QWORD PTR [r14+0x8]
   2afea:	48 89 c1             	mov    rcx,rax
   2afed:	41 89 d0             	mov    r8d,edx
   2aff0:	48 89 d0             	mov    rax,rdx
   2aff3:	e9 01 d1 ff ff       	jmp    280f9 <JS_CallInternal+0x56f9>
   2aff8:	8b bd 50 fe ff ff    	mov    edi,DWORD PTR [rbp-0x1b0]
   2affe:	85 ff                	test   edi,edi
   2b000:	74 3d                	je     2b03f <JS_CallInternal+0x863f>
   2b002:	4c 8b a5 e8 fe ff ff 	mov    r12,QWORD PTR [rbp-0x118]
   2b009:	4c 89 eb             	mov    rbx,r13
   2b00c:	4d 01 ee             	add    r14,r13
   2b00f:	eb 09                	jmp    2b01a <JS_CallInternal+0x861a>
   2b011:	48 83 c3 10          	add    rbx,0x10
   2b015:	4c 39 f3             	cmp    rbx,r14
   2b018:	74 25                	je     2b03f <JS_CallInternal+0x863f>
   2b01a:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
   2b01e:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
   2b021:	83 fa f6             	cmp    edx,0xfffffff6
   2b024:	76 eb                	jbe    2b011 <JS_CallInternal+0x8611>
   2b026:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2b029:	83 e8 01             	sub    eax,0x1
   2b02c:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2b02f:	85 c0                	test   eax,eax
   2b031:	7f de                	jg     2b011 <JS_CallInternal+0x8611>
   2b033:	49 8b 7c 24 10       	mov    rdi,QWORD PTR [r12+0x10]
   2b038:	e8 33 18 ff ff       	call   1c870 <__JS_FreeValueRT>
   2b03d:	eb d2                	jmp    2b011 <JS_CallInternal+0x8611>
   2b03f:	4c 8b a5 38 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1c8]
   2b046:	4c 89 eb             	mov    rbx,r13
   2b049:	e9 52 81 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2b04e:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2b055:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b05c:	44 89 ea             	mov    edx,r13d
   2b05f:	48 89 de             	mov    rsi,rbx
   2b062:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   2b066:	e8 95 a3 02 00       	call   55400 <js_binary_logic_slow>
   2b06b:	85 c0                	test   eax,eax
   2b06d:	0f 85 2d 81 ff ff    	jne    231a0 <JS_CallInternal+0x7a0>
   2b073:	48 83 eb 10          	sub    rbx,0x10
   2b077:	e9 8c b1 ff ff       	jmp    26208 <JS_CallInternal+0x3808>
   2b07c:	66 0f ef c0          	pxor   xmm0,xmm0
   2b080:	f2 48 0f 2a c0       	cvtsi2sd xmm0,rax
   2b085:	f2 0f 11 43 e0       	movsd  QWORD PTR [rbx-0x20],xmm0
   2b08a:	48 8d 53 f0          	lea    rdx,[rbx-0x10]
   2b08e:	b8 08 00 00 00       	mov    eax,0x8
   2b093:	e9 27 b3 ff ff       	jmp    263bf <JS_CallInternal+0x39bf>
   2b098:	83 fe 08             	cmp    esi,0x8
   2b09b:	0f 84 8b 0e 00 00    	je     2bf2c <JS_CallInternal+0x952c>
   2b0a1:	83 f8 08             	cmp    eax,0x8
   2b0a4:	0f 85 04 b2 ff ff    	jne    262ae <JS_CallInternal+0x38ae>
   2b0aa:	85 f6                	test   esi,esi
   2b0ac:	0f 85 fc b1 ff ff    	jne    262ae <JS_CallInternal+0x38ae>
   2b0b2:	66 0f ef c9          	pxor   xmm1,xmm1
   2b0b6:	f2 0f 2a c9          	cvtsi2sd xmm1,ecx
   2b0ba:	66 48 0f 6e c2       	movq   xmm0,rdx
   2b0bf:	f2 0f 59 c1          	mulsd  xmm0,xmm1
   2b0c3:	eb c0                	jmp    2b085 <JS_CallInternal+0x8685>
   2b0c5:	41 83 fd 08          	cmp    r13d,0x8
   2b0c9:	0f 84 c5 0e 00 00    	je     2bf94 <JS_CallInternal+0x9594>
   2b0cf:	41 83 fd ff          	cmp    r13d,0xffffffff
   2b0d3:	0f 84 8a 0e 00 00    	je     2bf63 <JS_CallInternal+0x9563>
   2b0d9:	41 8d 4d fe          	lea    ecx,[r13-0x2]
   2b0dd:	83 f9 01             	cmp    ecx,0x1
   2b0e0:	0f 86 d6 0e 00 00    	jbe    2bfbc <JS_CallInternal+0x95bc>
   2b0e6:	4c 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r8
   2b0ed:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   2b0f4:	41 83 fd f9          	cmp    r13d,0xfffffff9
   2b0f8:	0f 85 52 eb ff ff    	jne    29c50 <JS_CallInternal+0x7250>
   2b0fe:	41 83 f8 f9          	cmp    r8d,0xfffffff9
   2b102:	0f 85 48 eb ff ff    	jne    29c50 <JS_CallInternal+0x7250>
   2b108:	e8 d3 cc fe ff       	call   17de0 <js_string_eq.isra.0>
   2b10d:	4c 89 f6             	mov    rsi,r14
   2b110:	4c 8b b5 e8 fe ff ff 	mov    r14,QWORD PTR [rbp-0x118]
   2b117:	4c 89 ea             	mov    rdx,r13
   2b11a:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   2b120:	4c 89 f7             	mov    rdi,r14
   2b123:	e8 a8 18 ff ff       	call   1c9d0 <JS_FreeValue>
   2b128:	48 8b b5 40 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c0]
   2b12f:	48 8b 95 38 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c8]
   2b136:	4c 89 f7             	mov    rdi,r14
   2b139:	e8 92 18 ff ff       	call   1c9d0 <JS_FreeValue>
   2b13e:	8b 85 50 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1b0]
   2b144:	e9 f0 9f ff ff       	jmp    25139 <JS_CallInternal+0x2739>
   2b149:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b150:	48 8d 35 51 4c 0a 00 	lea    rsi,[rip+0xa4c51]        # cfda8 <_IO_stdin_used+0x3da8>
   2b157:	31 c0                	xor    eax,eax
   2b159:	e8 52 55 00 00       	call   306b0 <JS_ThrowTypeError>
   2b15e:	e9 3d 80 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2b163:	41 83 f9 08          	cmp    r9d,0x8
   2b167:	0f 84 9f 12 00 00    	je     2c40c <JS_CallInternal+0x9a0c>
   2b16d:	41 83 f9 ff          	cmp    r9d,0xffffffff
   2b171:	0f 84 4b 12 00 00    	je     2c3c2 <JS_CallInternal+0x99c2>
   2b177:	41 8d 41 fe          	lea    eax,[r9-0x2]
   2b17b:	83 f8 01             	cmp    eax,0x1
   2b17e:	0f 86 55 13 00 00    	jbe    2c4d9 <JS_CallInternal+0x9ad9>
   2b184:	41 83 f9 f9          	cmp    r9d,0xfffffff9
   2b188:	0f 85 f9 11 00 00    	jne    2c387 <JS_CallInternal+0x9987>
   2b18e:	41 83 fe f9          	cmp    r14d,0xfffffff9
   2b192:	0f 85 ef 11 00 00    	jne    2c387 <JS_CallInternal+0x9987>
   2b198:	4c 89 ee             	mov    rsi,r13
   2b19b:	4c 89 8d 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r9
   2b1a2:	48 89 95 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rdx
   2b1a9:	e8 32 cc fe ff       	call   17de0 <js_string_eq.isra.0>
   2b1ae:	48 8b b5 40 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c0]
   2b1b5:	4c 8b 8d 38 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c8]
   2b1bc:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   2b1c2:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b1c9:	4c 89 ca             	mov    rdx,r9
   2b1cc:	e8 ff 17 ff ff       	call   1c9d0 <JS_FreeValue>
   2b1d1:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b1d8:	4c 89 ee             	mov    rsi,r13
   2b1db:	4c 89 f2             	mov    rdx,r14
   2b1de:	e8 ed 17 ff ff       	call   1c9d0 <JS_FreeValue>
   2b1e3:	31 c0                	xor    eax,eax
   2b1e5:	83 bd 50 fe ff ff 01 	cmp    DWORD PTR [rbp-0x1b0],0x1
   2b1ec:	0f 95 c0             	setne  al
   2b1ef:	e9 97 9e ff ff       	jmp    2508b <JS_CallInternal+0x268b>
   2b1f4:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b1fb:	48 8d 35 5e 13 0a 00 	lea    rsi,[rip+0xa135e]        # cc560 <_IO_stdin_used+0x560>
   2b202:	31 c0                	xor    eax,eax
   2b204:	e8 a7 54 00 00       	call   306b0 <JS_ThrowTypeError>
   2b209:	4d 8b 2e             	mov    r13,QWORD PTR [r14]
   2b20c:	4d 8b 4e 08          	mov    r9,QWORD PTR [r14+0x8]
   2b210:	48 89 c1             	mov    rcx,rax
   2b213:	41 89 d0             	mov    r8d,edx
   2b216:	48 89 d0             	mov    rax,rdx
   2b219:	e9 db ce ff ff       	jmp    280f9 <JS_CallInternal+0x56f9>
   2b21e:	4d 89 ec             	mov    r12,r13
   2b221:	e9 7a 7f ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2b226:	4d 89 ec             	mov    r12,r13
   2b229:	e9 72 7f ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2b22e:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b235:	e8 d6 79 00 00       	call   32c10 <__js_poll_interrupts>
   2b23a:	85 c0                	test   eax,eax
   2b23c:	0f 84 28 b4 ff ff    	je     2666a <JS_CallInternal+0x3c6a>
   2b242:	4d 89 ec             	mov    r12,r13
   2b245:	e9 56 7f ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2b24a:	48 89 85 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rax
   2b251:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b258:	4c 89 95 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r10
   2b25f:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b263:	e8 08 16 ff ff       	call   1c870 <__JS_FreeValueRT>
   2b268:	48 8b 85 28 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1d8]
   2b26f:	4c 8b 95 38 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c8]
   2b276:	e9 89 cb ff ff       	jmp    27e04 <JS_CallInternal+0x5404>
   2b27b:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
   2b282:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b289:	4c 89 95 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r10
   2b290:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b294:	e8 d7 15 ff ff       	call   1c870 <__JS_FreeValueRT>
   2b299:	48 8b 85 38 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c8]
   2b2a0:	4c 8b 95 50 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1b0]
   2b2a7:	e9 7c cb ff ff       	jmp    27e28 <JS_CallInternal+0x5428>
   2b2ac:	48 89 85 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rax
   2b2b3:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b2ba:	4c 89 95 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r10
   2b2c1:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b2c5:	e8 a6 15 ff ff       	call   1c870 <__JS_FreeValueRT>
   2b2ca:	48 8b 85 28 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1d8]
   2b2d1:	4c 8b 95 38 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1c8]
   2b2d8:	e9 0a cb ff ff       	jmp    27de7 <JS_CallInternal+0x53e7>
   2b2dd:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b2e4:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b2e8:	e8 83 15 ff ff       	call   1c870 <__JS_FreeValueRT>
   2b2ed:	e9 8a db ff ff       	jmp    28e7c <JS_CallInternal+0x647c>
   2b2f2:	66 0f ef c0          	pxor   xmm0,xmm0
   2b2f6:	b8 08 00 00 00       	mov    eax,0x8
   2b2fb:	f2 48 0f 2a c2       	cvtsi2sd xmm0,rdx
   2b300:	f2 41 0f 11 45 00    	movsd  QWORD PTR [r13+0x0],xmm0
   2b306:	e9 c5 c8 ff ff       	jmp    27bd0 <JS_CallInternal+0x51d0>
   2b30b:	48 83 eb 10          	sub    rbx,0x10
   2b30f:	83 fa 08             	cmp    edx,0x8
   2b312:	0f 84 dd 0e 00 00    	je     2c1f5 <JS_CallInternal+0x97f5>
   2b318:	83 fa f9             	cmp    edx,0xfffffff9
   2b31b:	0f 84 54 08 00 00    	je     2bb75 <JS_CallInternal+0x9175>
   2b321:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2b328:	4c 89 48 30          	mov    QWORD PTR [rax+0x30],r9
   2b32c:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   2b330:	83 fa f6             	cmp    edx,0xfffffff6
   2b333:	0f 87 55 08 00 00    	ja     2bb8e <JS_CallInternal+0x918e>
   2b339:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b340:	48 8d b5 70 ff ff ff 	lea    rsi,[rbp-0x90]
   2b347:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
   2b34e:	48 89 85 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],rax
   2b355:	48 89 95 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rdx
   2b35c:	4c 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],r8
   2b363:	4c 89 b5 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],r14
   2b36a:	e8 11 ac 02 00       	call   55f80 <js_add_slow>
   2b36f:	4c 8b 8d 50 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1b0]
   2b376:	85 c0                	test   eax,eax
   2b378:	0f 85 70 12 00 00    	jne    2c5ee <JS_CallInternal+0x9bee>
   2b37e:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
   2b382:	66 0f 6f bd 50 ff ff 	movdqa xmm7,XMMWORD PTR [rbp-0xb0]
   2b389:	ff 
   2b38a:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
   2b38e:	41 0f 11 7d 00       	movups XMMWORD PTR [r13+0x0],xmm7
   2b393:	83 fa f6             	cmp    edx,0xfffffff6
   2b396:	0f 86 3c c8 ff ff    	jbe    27bd8 <JS_CallInternal+0x51d8>
   2b39c:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2b39f:	83 e8 01             	sub    eax,0x1
   2b3a2:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2b3a5:	85 c0                	test   eax,eax
   2b3a7:	0f 8f 2b c8 ff ff    	jg     27bd8 <JS_CallInternal+0x51d8>
   2b3ad:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b3b4:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b3b8:	e8 b3 14 ff ff       	call   1c870 <__JS_FreeValueRT>
   2b3bd:	e9 16 c8 ff ff       	jmp    27bd8 <JS_CallInternal+0x51d8>
   2b3c2:	66 0f ef c0          	pxor   xmm0,xmm0
   2b3c6:	b8 08 00 00 00       	mov    eax,0x8
   2b3cb:	f2 48 0f 2a c1       	cvtsi2sd xmm0,rcx
   2b3d0:	f2 0f 11 43 e0       	movsd  QWORD PTR [rbx-0x20],xmm0
   2b3d5:	e9 5a c8 ff ff       	jmp    27c34 <JS_CallInternal+0x5234>
   2b3da:	41 83 fb 08          	cmp    r11d,0x8
   2b3de:	0f 84 24 0b 00 00    	je     2bf08 <JS_CallInternal+0x9508>
   2b3e4:	83 ff 08             	cmp    edi,0x8
   2b3e7:	0f 84 f3 07 00 00    	je     2bbe0 <JS_CallInternal+0x91e0>
   2b3ed:	83 c6 07             	add    esi,0x7
   2b3f0:	83 fe 01             	cmp    esi,0x1
   2b3f3:	0f 86 8d 0a 00 00    	jbe    2be86 <JS_CallInternal+0x9486>
   2b3f9:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2b400:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b407:	48 89 de             	mov    rsi,rbx
   2b40a:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   2b40e:	e8 6d ab 02 00       	call   55f80 <js_add_slow>
   2b413:	85 c0                	test   eax,eax
   2b415:	0f 85 85 7d ff ff    	jne    231a0 <JS_CallInternal+0x7a0>
   2b41b:	48 83 eb 10          	sub    rbx,0x10
   2b41f:	e9 18 c8 ff ff       	jmp    27c3c <JS_CallInternal+0x523c>
   2b424:	4c 89 f3             	mov    rbx,r14
   2b427:	4d 89 ec             	mov    r12,r13
   2b42a:	e9 71 7d ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2b42f:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2b436:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b43d:	44 89 ea             	mov    edx,r13d
   2b440:	48 89 de             	mov    rsi,rbx
   2b443:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   2b447:	e8 b4 9f 02 00       	call   55400 <js_binary_logic_slow>
   2b44c:	85 c0                	test   eax,eax
   2b44e:	0f 85 4c 7d ff ff    	jne    231a0 <JS_CallInternal+0x7a0>
   2b454:	48 83 eb 10          	sub    rbx,0x10
   2b458:	e9 e8 ad ff ff       	jmp    26245 <JS_CallInternal+0x3845>
   2b45d:	48 8b b5 d8 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x128]
   2b464:	48 8b bd a0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x160]
   2b46b:	0f b7 d1             	movzx  edx,cx
   2b46e:	31 c9                	xor    ecx,ecx
   2b470:	4d 89 ec             	mov    r12,r13
   2b473:	e8 b8 74 00 00       	call   32930 <JS_ThrowReferenceErrorUninitialized2.isra.0>
   2b478:	e9 23 7d ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2b47d:	48 8b b5 d8 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x128]
   2b484:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b48b:	31 c9                	xor    ecx,ecx
   2b48d:	4d 89 ec             	mov    r12,r13
   2b490:	e8 9b 74 00 00       	call   32930 <JS_ThrowReferenceErrorUninitialized2.isra.0>
   2b495:	e9 06 7d ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2b49a:	83 fe 08             	cmp    esi,0x8
   2b49d:	0f 84 ae 08 00 00    	je     2bd51 <JS_CallInternal+0x9351>
   2b4a3:	85 f6                	test   esi,esi
   2b4a5:	75 09                	jne    2b4b0 <JS_CallInternal+0x8ab0>
   2b4a7:	83 f9 08             	cmp    ecx,0x8
   2b4aa:	0f 84 f9 07 00 00    	je     2bca9 <JS_CallInternal+0x92a9>
   2b4b0:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2b4b7:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b4be:	44 89 ea             	mov    edx,r13d
   2b4c1:	48 89 de             	mov    rsi,rbx
   2b4c4:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   2b4c8:	e8 e3 ed 02 00       	call   5a2b0 <js_relational_slow>
   2b4cd:	85 c0                	test   eax,eax
   2b4cf:	0f 85 cb 7c ff ff    	jne    231a0 <JS_CallInternal+0x7a0>
   2b4d5:	48 83 eb 10          	sub    rbx,0x10
   2b4d9:	e9 5a b5 ff ff       	jmp    26a38 <JS_CallInternal+0x4038>
   2b4de:	4c 89 f3             	mov    rbx,r14
   2b4e1:	4d 89 ec             	mov    r12,r13
   2b4e4:	e9 b7 7c ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2b4e9:	83 fe 08             	cmp    esi,0x8
   2b4ec:	0f 84 7b 07 00 00    	je     2bc6d <JS_CallInternal+0x926d>
   2b4f2:	85 f6                	test   esi,esi
   2b4f4:	75 09                	jne    2b4ff <JS_CallInternal+0x8aff>
   2b4f6:	83 f9 08             	cmp    ecx,0x8
   2b4f9:	0f 84 03 08 00 00    	je     2bd02 <JS_CallInternal+0x9302>
   2b4ff:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2b506:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b50d:	44 89 ea             	mov    edx,r13d
   2b510:	48 89 de             	mov    rsi,rbx
   2b513:	4c 89 60 30          	mov    QWORD PTR [rax+0x30],r12
   2b517:	e8 94 ed 02 00       	call   5a2b0 <js_relational_slow>
   2b51c:	85 c0                	test   eax,eax
   2b51e:	0f 85 7c 7c ff ff    	jne    231a0 <JS_CallInternal+0x7a0>
   2b524:	48 83 eb 10          	sub    rbx,0x10
   2b528:	e9 fb af ff ff       	jmp    26528 <JS_CallInternal+0x3b28>
   2b52d:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b534:	e8 d7 76 00 00       	call   32c10 <__js_poll_interrupts>
   2b539:	85 c0                	test   eax,eax
   2b53b:	0f 84 1b b3 ff ff    	je     2685c <JS_CallInternal+0x3e5c>
   2b541:	4d 89 ec             	mov    r12,r13
   2b544:	e9 57 7c ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2b549:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b550:	e8 bb 76 00 00       	call   32c10 <__js_poll_interrupts>
   2b555:	85 c0                	test   eax,eax
   2b557:	0f 84 c0 b2 ff ff    	je     2681d <JS_CallInternal+0x3e1d>
   2b55d:	4d 89 ec             	mov    r12,r13
   2b560:	e9 3b 7c ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2b565:	41 8b 45 fc          	mov    eax,DWORD PTR [r13-0x4]
   2b569:	83 e8 01             	sub    eax,0x1
   2b56c:	41 89 45 fc          	mov    DWORD PTR [r13-0x4],eax
   2b570:	85 c0                	test   eax,eax
   2b572:	0f 8f b9 e8 ff ff    	jg     29e31 <JS_CallInternal+0x7431>
   2b578:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b57f:	4c 89 ee             	mov    rsi,r13
   2b582:	4c 89 f2             	mov    rdx,r14
   2b585:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b589:	e8 e2 12 ff ff       	call   1c870 <__JS_FreeValueRT>
   2b58e:	e9 9e e8 ff ff       	jmp    29e31 <JS_CallInternal+0x7431>
   2b593:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b59a:	e8 71 76 00 00       	call   32c10 <__js_poll_interrupts>
   2b59f:	85 c0                	test   eax,eax
   2b5a1:	0f 84 2a b1 ff ff    	je     266d1 <JS_CallInternal+0x3cd1>
   2b5a7:	4d 89 ec             	mov    r12,r13
   2b5aa:	e9 f1 7b ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2b5af:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b5b6:	e8 55 76 00 00       	call   32c10 <__js_poll_interrupts>
   2b5bb:	85 c0                	test   eax,eax
   2b5bd:	0f 84 b4 b1 ff ff    	je     26777 <JS_CallInternal+0x3d77>
   2b5c3:	4d 89 ec             	mov    r12,r13
   2b5c6:	e9 d5 7b ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2b5cb:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b5d2:	e8 39 76 00 00       	call   32c10 <__js_poll_interrupts>
   2b5d7:	85 c0                	test   eax,eax
   2b5d9:	0f 84 58 b1 ff ff    	je     26737 <JS_CallInternal+0x3d37>
   2b5df:	4d 89 ec             	mov    r12,r13
   2b5e2:	e9 b9 7b ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2b5e7:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b5ee:	e8 1d 76 00 00       	call   32c10 <__js_poll_interrupts>
   2b5f3:	85 c0                	test   eax,eax
   2b5f5:	0f 84 e2 b1 ff ff    	je     267dd <JS_CallInternal+0x3ddd>
   2b5fb:	4d 89 ec             	mov    r12,r13
   2b5fe:	e9 9d 7b ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2b603:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b60a:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
   2b611:	48 89 ce             	mov    rsi,rcx
   2b614:	44 89 85 38 fe ff ff 	mov    DWORD PTR [rbp-0x1c8],r8d
   2b61b:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b61f:	e8 4c 12 ff ff       	call   1c870 <__JS_FreeValueRT>
   2b624:	44 8b 85 38 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x1c8]
   2b62b:	e9 cc 96 ff ff       	jmp    24cfc <JS_CallInternal+0x22fc>
   2b630:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b637:	4c 89 f6             	mov    rsi,r14
   2b63a:	4c 89 ea             	mov    rdx,r13
   2b63d:	89 8d 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],ecx
   2b643:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b647:	e8 24 12 ff ff       	call   1c870 <__JS_FreeValueRT>
   2b64c:	8b 8d 50 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1b0]
   2b652:	e9 dd 98 ff ff       	jmp    24f34 <JS_CallInternal+0x2534>
   2b657:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b65e:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b662:	e8 09 12 ff ff       	call   1c870 <__JS_FreeValueRT>
   2b667:	e9 dc c0 ff ff       	jmp    27748 <JS_CallInternal+0x4d48>
   2b66c:	39 c2                	cmp    edx,eax
   2b66e:	0f 85 c6 e0 ff ff    	jne    2973a <JS_CallInternal+0x6d3a>
   2b674:	0f b6 51 10          	movzx  edx,BYTE PTR [rcx+0x10]
   2b678:	f7 d2                	not    edx
   2b67a:	83 e2 12             	and    edx,0x12
   2b67d:	0f 85 b7 e0 ff ff    	jne    2973a <JS_CallInternal+0x6d3a>
   2b683:	48 8b 79 18          	mov    rdi,QWORD PTR [rcx+0x18]
   2b687:	48 8b 57 30          	mov    rdx,QWORD PTR [rdi+0x30]
   2b68b:	48 85 d2             	test   rdx,rdx
   2b68e:	74 0a                	je     2b69a <JS_CallInternal+0x8c9a>
   2b690:	f6 42 10 01          	test   BYTE PTR [rdx+0x10],0x1
   2b694:	0f 84 a0 e0 ff ff    	je     2973a <JS_CallInternal+0x6d3a>
   2b69a:	48 8b 71 20          	mov    rsi,QWORD PTR [rcx+0x20]
   2b69e:	44 8b 56 08          	mov    r10d,DWORD PTR [rsi+0x8]
   2b6a2:	45 85 d2             	test   r10d,r10d
   2b6a5:	0f 85 8f e0 ff ff    	jne    2973a <JS_CallInternal+0x6d3a>
   2b6ab:	8d 50 01             	lea    edx,[rax+0x1]
   2b6ae:	39 51 28             	cmp    DWORD PTR [rcx+0x28],edx
   2b6b1:	0f 82 83 e0 ff ff    	jb     2973a <JS_CallInternal+0x6d3a>
   2b6b7:	39 16                	cmp    DWORD PTR [rsi],edx
   2b6b9:	73 1c                	jae    2b6d7 <JS_CallInternal+0x8cd7>
   2b6bb:	44 8b 47 18          	mov    r8d,DWORD PTR [rdi+0x18]
   2b6bf:	42 f6 44 87 3f 08    	test   BYTE PTR [rdi+r8*4+0x3f],0x8
   2b6c5:	0f 84 6f e0 ff ff    	je     2973a <JS_CallInternal+0x6d3a>
   2b6cb:	89 d7                	mov    edi,edx
   2b6cd:	45 31 c9             	xor    r9d,r9d
   2b6d0:	48 89 3e             	mov    QWORD PTR [rsi],rdi
   2b6d3:	4c 89 4e 08          	mov    QWORD PTR [rsi+0x8],r9
   2b6d7:	89 51 38             	mov    DWORD PTR [rcx+0x38],edx
   2b6da:	89 c0                	mov    eax,eax
   2b6dc:	f3 0f 6f 73 f0       	movdqu xmm6,XMMWORD PTR [rbx-0x10]
   2b6e1:	48 c1 e0 04          	shl    rax,0x4
   2b6e5:	48 03 41 30          	add    rax,QWORD PTR [rcx+0x30]
   2b6e9:	0f 11 30             	movups XMMWORD PTR [rax],xmm6
   2b6ec:	e9 57 c0 ff ff       	jmp    27748 <JS_CallInternal+0x4d48>
   2b6f1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   2b6f8:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b6ff:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b703:	e8 68 11 ff ff       	call   1c870 <__JS_FreeValueRT>
   2b708:	e9 5c c0 ff ff       	jmp    27769 <JS_CallInternal+0x4d69>
   2b70d:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b714:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b718:	e8 53 11 ff ff       	call   1c870 <__JS_FreeValueRT>
   2b71d:	e9 1d cb ff ff       	jmp    2823f <JS_CallInternal+0x583f>
   2b722:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b729:	4c 89 ee             	mov    rsi,r13
   2b72c:	4c 89 f2             	mov    rdx,r14
   2b72f:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b733:	e8 38 11 ff ff       	call   1c870 <__JS_FreeValueRT>
   2b738:	e9 1b cb ff ff       	jmp    28258 <JS_CallInternal+0x5858>
   2b73d:	8b 12                	mov    edx,DWORD PTR [rdx]
   2b73f:	81 e2 ff ff ff 03    	and    edx,0x3ffffff
   2b745:	0f 85 df 96 ff ff    	jne    24e2a <JS_CallInternal+0x242a>
   2b74b:	31 d2                	xor    edx,edx
   2b74d:	e9 e8 96 ff ff       	jmp    24e3a <JS_CallInternal+0x243a>
   2b752:	09 ca                	or     edx,ecx
   2b754:	0f 89 58 ac ff ff    	jns    263b2 <JS_CallInternal+0x39b2>
   2b75a:	f2 0f 10 05 5e e2 0a 	movsd  xmm0,QWORD PTR [rip+0xae25e]        # d99c0 <typed_array_size_log2+0x28>
   2b761:	00 
   2b762:	e9 1e f9 ff ff       	jmp    2b085 <JS_CallInternal+0x8685>
   2b767:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   2b76e:	00 00 
   2b770:	8b 01                	mov    eax,DWORD PTR [rcx]
   2b772:	25 ff ff ff 03       	and    eax,0x3ffffff
   2b777:	0f 85 0e d1 ff ff    	jne    2888b <JS_CallInternal+0x5e8b>
   2b77d:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b784:	48 8d 0d b9 09 0a 00 	lea    rcx,[rip+0xa09b9]        # cc144 <_IO_stdin_used+0x144>
   2b78b:	31 c0                	xor    eax,eax
   2b78d:	48 8d 15 34 46 0a 00 	lea    rdx,[rip+0xa4634]        # cfdc8 <_IO_stdin_used+0x3dc8>
   2b794:	e8 27 51 00 00       	call   308c0 <__JS_ThrowTypeErrorAtom>
   2b799:	e9 71 f4 ff ff       	jmp    2ac0f <JS_CallInternal+0x820f>
   2b79e:	66 90                	xchg   ax,ax
   2b7a0:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b7a7:	89 8d 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],ecx
   2b7ad:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b7b1:	e8 ba 10 ff ff       	call   1c870 <__JS_FreeValueRT>
   2b7b6:	8b 8d 50 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1b0]
   2b7bc:	e9 5a 97 ff ff       	jmp    24f1b <JS_CallInternal+0x251b>
   2b7c1:	3d f2 00 00 00       	cmp    eax,0xf2
   2b7c6:	7e 43                	jle    2b80b <JS_CallInternal+0x8e0b>
   2b7c8:	31 d2                	xor    edx,edx
   2b7ca:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   2b7d1:	89 c0                	mov    eax,eax
   2b7d3:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
   2b7d7:	48 8b 8f 48 04 00 00 	mov    rcx,QWORD PTR [rdi+0x448]
   2b7de:	48 8b 34 c1          	mov    rsi,QWORD PTR [rcx+rax*8]
   2b7e2:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2b7e5:	83 e8 01             	sub    eax,0x1
   2b7e8:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2b7eb:	85 c0                	test   eax,eax
   2b7ed:	7f 13                	jg     2b802 <JS_CallInternal+0x8e02>
   2b7ef:	48 89 95 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rdx
   2b7f6:	e8 05 9c fe ff       	call   15400 <JS_FreeAtomStruct>
   2b7fb:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
   2b802:	48 85 d2             	test   rdx,rdx
   2b805:	0f 85 de a8 ff ff    	jne    260e9 <JS_CallInternal+0x36e9>
   2b80b:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b812:	48 8d 35 77 44 0a 00 	lea    rsi,[rip+0xa4477]        # cfc90 <_IO_stdin_used+0x3c90>
   2b819:	31 c0                	xor    eax,eax
   2b81b:	e8 90 4e 00 00       	call   306b0 <JS_ThrowTypeError>
   2b820:	48 c7 03 00 00 00 00 	mov    QWORD PTR [rbx],0x0
   2b827:	48 c7 43 08 06 00 00 	mov    QWORD PTR [rbx+0x8],0x6
   2b82e:	00 
   2b82f:	e9 4c a8 ff ff       	jmp    26080 <JS_CallInternal+0x3680>
   2b834:	8b 01                	mov    eax,DWORD PTR [rcx]
   2b836:	25 ff ff ff 03       	and    eax,0x3ffffff
   2b83b:	0f 85 85 c8 ff ff    	jne    280c6 <JS_CallInternal+0x56c6>
   2b841:	48 8b bd 28 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x1d8]
   2b848:	48 8d 75 80          	lea    rsi,[rbp-0x80]
   2b84c:	e8 8f ba fe ff       	call   172e0 <JS_AtomGetStrRT.constprop.0>
   2b851:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b858:	48 8d 35 69 45 0a 00 	lea    rsi,[rip+0xa4569]        # cfdc8 <_IO_stdin_used+0x3dc8>
   2b85f:	48 89 c2             	mov    rdx,rax
   2b862:	31 c0                	xor    eax,eax
   2b864:	e8 47 4e 00 00       	call   306b0 <JS_ThrowTypeError>
   2b869:	4d 8b 2e             	mov    r13,QWORD PTR [r14]
   2b86c:	4d 8b 4e 08          	mov    r9,QWORD PTR [r14+0x8]
   2b870:	31 c9                	xor    ecx,ecx
   2b872:	41 b8 06 00 00 00    	mov    r8d,0x6
   2b878:	b8 06 00 00 00       	mov    eax,0x6
   2b87d:	e9 77 c8 ff ff       	jmp    280f9 <JS_CallInternal+0x56f9>
   2b882:	4c 89 f3             	mov    rbx,r14
   2b885:	e9 16 79 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2b88a:	48 8b bd c0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x140]
   2b891:	4c 89 ee             	mov    rsi,r13
   2b894:	e8 57 4d ff ff       	call   205f0 <free_var_ref>
   2b899:	e9 ed 78 ff ff       	jmp    2318b <JS_CallInternal+0x78b>
   2b89e:	f2 0f 10 05 9a 6a 0a 	movsd  xmm0,QWORD PTR [rip+0xa6a9a]        # d2340 <__PRETTY_FUNCTION__.0+0xc0>
   2b8a5:	00 
   2b8a6:	e9 17 d9 ff ff       	jmp    291c2 <JS_CallInternal+0x67c2>
   2b8ab:	0f 85 55 7c ff ff    	jne    23506 <JS_CallInternal+0xb06>
   2b8b1:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2b8b8:	48 8b 47 10          	mov    rax,QWORD PTR [rdi+0x10]
   2b8bc:	48 8b 80 f0 04 00 00 	mov    rax,QWORD PTR [rax+0x4f0]
   2b8c3:	48 85 c0             	test   rax,rax
   2b8c6:	0f 84 6a 07 00 00    	je     2c036 <JS_CallInternal+0x9636>
   2b8cc:	f6 40 3c 01          	test   BYTE PTR [rax+0x3c],0x1
   2b8d0:	0f 84 60 07 00 00    	je     2c036 <JS_CallInternal+0x9636>
   2b8d6:	8b b5 38 fe ff ff    	mov    esi,DWORD PTR [rbp-0x1c8]
   2b8dc:	e8 ef 6f 00 00       	call   328d0 <JS_ThrowReferenceErrorNotDefined>
   2b8e1:	e9 20 7c ff ff       	jmp    23506 <JS_CallInternal+0xb06>
   2b8e6:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
   2b8ed:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b8f4:	4c 89 c2             	mov    rdx,r8
   2b8f7:	4c 89 8d 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r9
   2b8fe:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b902:	89 8d 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],ecx
   2b908:	e8 63 0f ff ff       	call   1c870 <__JS_FreeValueRT>
   2b90d:	4c 8b 8d 38 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c8]
   2b914:	48 8b 85 40 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c0]
   2b91b:	8b 8d 50 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1b0]
   2b921:	e9 99 e1 ff ff       	jmp    29abf <JS_CallInternal+0x70bf>
   2b926:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b92d:	4c 89 ee             	mov    rsi,r13
   2b930:	4c 89 f2             	mov    rdx,r14
   2b933:	89 8d 40 fe ff ff    	mov    DWORD PTR [rbp-0x1c0],ecx
   2b939:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b93d:	e8 2e 0f ff ff       	call   1c870 <__JS_FreeValueRT>
   2b942:	8b 8d 40 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c0]
   2b948:	4c 8b 95 50 fe ff ff 	mov    r10,QWORD PTR [rbp-0x1b0]
   2b94f:	e9 0e dd ff ff       	jmp    29662 <JS_CallInternal+0x6c62>
   2b954:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b95b:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b95f:	e8 0c 0f ff ff       	call   1c870 <__JS_FreeValueRT>
   2b964:	e9 f0 7b ff ff       	jmp    23559 <JS_CallInternal+0xb59>
   2b969:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b970:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   2b977:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
   2b97e:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b982:	e8 e9 0e ff ff       	call   1c870 <__JS_FreeValueRT>
   2b987:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
   2b98e:	4c 8b 8d 50 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1b0]
   2b995:	e9 18 92 ff ff       	jmp    24bb2 <JS_CallInternal+0x21b2>
   2b99a:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   2b9a1:	0f 8f 91 09 00 00    	jg     2c338 <JS_CallInternal+0x9938>
   2b9a7:	b8 03 00 00 00       	mov    eax,0x3
   2b9ac:	31 c9                	xor    ecx,ecx
   2b9ae:	e9 36 c5 ff ff       	jmp    27ee9 <JS_CallInternal+0x54e9>
   2b9b3:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b9ba:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b9be:	e8 ad 0e ff ff       	call   1c870 <__JS_FreeValueRT>
   2b9c3:	e9 d1 dd ff ff       	jmp    29799 <JS_CallInternal+0x6d99>
   2b9c8:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2b9cf:	48 89 95 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rdx
   2b9d6:	48 63 d7             	movsxd rdx,edi
   2b9d9:	48 c1 e2 04          	shl    rdx,0x4
   2b9dd:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   2b9e4:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2b9e8:	48 89 d6             	mov    rsi,rdx
   2b9eb:	48 89 95 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rdx
   2b9f2:	e8 59 8f fe ff       	call   14950 <__js_malloc>
   2b9f7:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
   2b9fe:	4c 8b 8d 40 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c0]
   2ba05:	48 85 c0             	test   rax,rax
   2ba08:	48 8b 8d 38 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c8]
   2ba0f:	0f 84 80 0b 00 00    	je     2c595 <JS_CallInternal+0x9b95>
   2ba15:	4c 8b 95 a8 fe ff ff 	mov    r10,QWORD PTR [rbp-0x158]
   2ba1c:	31 f6                	xor    esi,esi
   2ba1e:	4d 8b 44 32 08       	mov    r8,QWORD PTR [r10+rsi*1+0x8]
   2ba23:	49 8b 3c 32          	mov    rdi,QWORD PTR [r10+rsi*1]
   2ba27:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   2ba2b:	76 04                	jbe    2ba31 <JS_CallInternal+0x9031>
   2ba2d:	83 47 fc 01          	add    DWORD PTR [rdi-0x4],0x1
   2ba31:	48 89 3c 30          	mov    QWORD PTR [rax+rsi*1],rdi
   2ba35:	4c 89 44 30 08       	mov    QWORD PTR [rax+rsi*1+0x8],r8
   2ba3a:	48 83 c6 10          	add    rsi,0x10
   2ba3e:	48 39 f2             	cmp    rdx,rsi
   2ba41:	75 db                	jne    2ba1e <JS_CallInternal+0x901e>
   2ba43:	e9 78 a7 ff ff       	jmp    261c0 <JS_CallInternal+0x37c0>
   2ba48:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   2ba4f:	48 8b 91 88 01 00 00 	mov    rdx,QWORD PTR [rcx+0x188]
   2ba56:	48 8b 81 80 01 00 00 	mov    rax,QWORD PTR [rcx+0x180]
   2ba5d:	83 fa f6             	cmp    edx,0xfffffff6
   2ba60:	76 04                	jbe    2ba66 <JS_CallInternal+0x9066>
   2ba62:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
   2ba66:	48 89 43 d0          	mov    QWORD PTR [rbx-0x30],rax
   2ba6a:	48 89 53 d8          	mov    QWORD PTR [rbx-0x28],rdx
   2ba6e:	e9 ab bb ff ff       	jmp    2761e <JS_CallInternal+0x4c1e>
   2ba73:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ba7a:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ba7e:	e8 ed 0d ff ff       	call   1c870 <__JS_FreeValueRT>
   2ba83:	e9 2c c0 ff ff       	jmp    27ab4 <JS_CallInternal+0x50b4>
   2ba88:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2ba8f:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   2ba96:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2ba9a:	e8 d1 0d ff ff       	call   1c870 <__JS_FreeValueRT>
   2ba9f:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   2baa6:	e9 b5 d9 ff ff       	jmp    29460 <JS_CallInternal+0x6a60>
   2baab:	83 f9 f6             	cmp    ecx,0xfffffff6
   2baae:	0f 86 4e f5 ff ff    	jbe    2b002 <JS_CallInternal+0x8602>
   2bab4:	41 8b 40 fc          	mov    eax,DWORD PTR [r8-0x4]
   2bab8:	83 e8 01             	sub    eax,0x1
   2babb:	41 89 40 fc          	mov    DWORD PTR [r8-0x4],eax
   2babf:	85 c0                	test   eax,eax
   2bac1:	0f 8f 3b f5 ff ff    	jg     2b002 <JS_CallInternal+0x8602>
   2bac7:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bace:	4c 89 c6             	mov    rsi,r8
   2bad1:	48 89 ca             	mov    rdx,rcx
   2bad4:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bad8:	e8 93 0d ff ff       	call   1c870 <__JS_FreeValueRT>
   2badd:	e9 20 f5 ff ff       	jmp    2b002 <JS_CallInternal+0x8602>
   2bae2:	0f 85 1e 7a ff ff    	jne    23506 <JS_CallInternal+0xb06>
   2bae8:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2baef:	48 8b 47 10          	mov    rax,QWORD PTR [rdi+0x10]
   2baf3:	48 8b 80 f0 04 00 00 	mov    rax,QWORD PTR [rax+0x4f0]
   2bafa:	48 85 c0             	test   rax,rax
   2bafd:	0f 84 93 79 ff ff    	je     23496 <JS_CallInternal+0xa96>
   2bb03:	f6 40 3c 01          	test   BYTE PTR [rax+0x3c],0x1
   2bb07:	0f 84 89 79 ff ff    	je     23496 <JS_CallInternal+0xa96>
   2bb0d:	e9 c4 fd ff ff       	jmp    2b8d6 <JS_CallInternal+0x8ed6>
   2bb12:	45 85 ed             	test   r13d,r13d
   2bb15:	0f 85 5f f0 ff ff    	jne    2ab7a <JS_CallInternal+0x817a>
   2bb1b:	e9 4e e0 ff ff       	jmp    29b6e <JS_CallInternal+0x716e>
   2bb20:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bb27:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bb2b:	e8 40 0d ff ff       	call   1c870 <__JS_FreeValueRT>
   2bb30:	e9 56 d6 ff ff       	jmp    2918b <JS_CallInternal+0x678b>
   2bb35:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2bb3c:	48 8d 35 bd 41 0a 00 	lea    rsi,[rip+0xa41bd]        # cfd00 <_IO_stdin_used+0x3d00>
   2bb43:	31 c0                	xor    eax,eax
   2bb45:	e8 66 4b 00 00       	call   306b0 <JS_ThrowTypeError>
   2bb4a:	e9 51 76 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2bb4f:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bb56:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bb5a:	e8 11 0d ff ff       	call   1c870 <__JS_FreeValueRT>
   2bb5f:	e9 96 79 ff ff       	jmp    234fa <JS_CallInternal+0xafa>
   2bb64:	4d 89 f4             	mov    r12,r14
   2bb67:	e9 34 76 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2bb6c:	89 c8                	mov    eax,ecx
   2bb6e:	31 d2                	xor    edx,edx
   2bb70:	e9 e1 a7 ff ff       	jmp    26356 <JS_CallInternal+0x3956>
   2bb75:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2bb7c:	41 83 fe f9          	cmp    r14d,0xfffffff9
   2bb80:	4c 89 48 30          	mov    QWORD PTR [rax+0x30],r9
   2bb84:	0f 84 6c 0a 00 00    	je     2c5f6 <JS_CallInternal+0x9bf6>
   2bb8a:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   2bb8e:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
   2bb92:	e9 a2 f7 ff ff       	jmp    2b339 <JS_CallInternal+0x8939>
   2bb97:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   2bb9e:	48 8d 45 80          	lea    rax,[rbp-0x80]
   2bba2:	89 f2                	mov    edx,esi
   2bba4:	48 89 c6             	mov    rsi,rax
   2bba7:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
   2bbab:	e8 30 b7 fe ff       	call   172e0 <JS_AtomGetStrRT.constprop.0>
   2bbb0:	48 89 c2             	mov    rdx,rax
   2bbb3:	e9 d0 84 ff ff       	jmp    24088 <JS_CallInternal+0x1688>
   2bbb8:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   2bbbf:	48 89 c6             	mov    rsi,rax
   2bbc2:	4c 89 ca             	mov    rdx,r9
   2bbc5:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
   2bbc9:	e8 a2 0c ff ff       	call   1c870 <__JS_FreeValueRT>
   2bbce:	e9 1b df ff ff       	jmp    29aee <JS_CallInternal+0x70ee>
   2bbd3:	f2 0f 10 05 e5 dd 0a 	movsd  xmm0,QWORD PTR [rip+0xadde5]        # d99c0 <typed_array_size_log2+0x28>
   2bbda:	00 
   2bbdb:	e9 e2 d5 ff ff       	jmp    291c2 <JS_CallInternal+0x67c2>
   2bbe0:	45 85 db             	test   r11d,r11d
   2bbe3:	0f 85 10 f8 ff ff    	jne    2b3f9 <JS_CallInternal+0x89f9>
   2bbe9:	66 0f ef c9          	pxor   xmm1,xmm1
   2bbed:	f2 41 0f 2a ca       	cvtsi2sd xmm1,r10d
   2bbf2:	66 48 0f 6e c0       	movq   xmm0,rax
   2bbf7:	f2 0f 58 c1          	addsd  xmm0,xmm1
   2bbfb:	48 c7 43 e8 08 00 00 	mov    QWORD PTR [rbx-0x18],0x8
   2bc02:	00 
   2bc03:	48 83 eb 10          	sub    rbx,0x10
   2bc07:	f2 0f 11 43 f0       	movsd  QWORD PTR [rbx-0x10],xmm0
   2bc0c:	e9 2b c0 ff ff       	jmp    27c3c <JS_CallInternal+0x523c>
   2bc11:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bc18:	48 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rcx
   2bc1f:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2bc23:	e8 48 0c ff ff       	call   1c870 <__JS_FreeValueRT>
   2bc28:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   2bc2f:	e9 f9 d5 ff ff       	jmp    2922d <JS_CallInternal+0x682d>
   2bc34:	8b 85 90 fe ff ff    	mov    eax,DWORD PTR [rbp-0x170]
   2bc3a:	83 e8 02             	sub    eax,0x2
   2bc3d:	83 f8 01             	cmp    eax,0x1
   2bc40:	0f 87 8e 00 00 00    	ja     2bcd4 <JS_CallInternal+0x92d4>
   2bc46:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2bc4d:	48 8b 88 80 01 00 00 	mov    rcx,QWORD PTR [rax+0x180]
   2bc54:	48 8b 80 88 01 00 00 	mov    rax,QWORD PTR [rax+0x188]
   2bc5b:	83 f8 f6             	cmp    eax,0xfffffff6
   2bc5e:	0f 86 f8 b1 ff ff    	jbe    26e5c <JS_CallInternal+0x445c>
   2bc64:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
   2bc68:	e9 ef b1 ff ff       	jmp    26e5c <JS_CallInternal+0x445c>
   2bc6d:	66 48 0f 6e ca       	movq   xmm1,rdx
   2bc72:	83 f9 08             	cmp    ecx,0x8
   2bc75:	0f 84 8f 00 00 00    	je     2bd0a <JS_CallInternal+0x930a>
   2bc7b:	85 c9                	test   ecx,ecx
   2bc7d:	0f 85 7c f8 ff ff    	jne    2b4ff <JS_CallInternal+0x8aff>
   2bc83:	66 0f ef c0          	pxor   xmm0,xmm0
   2bc87:	f2 0f 2a c0          	cvtsi2sd xmm0,eax
   2bc8b:	31 c0                	xor    eax,eax
   2bc8d:	66 0f 2f c8          	comisd xmm1,xmm0
   2bc91:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   2bc98:	00 
   2bc99:	0f 93 c0             	setae  al
   2bc9c:	48 83 eb 10          	sub    rbx,0x10
   2bca0:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   2bca4:	e9 7f a8 ff ff       	jmp    26528 <JS_CallInternal+0x3b28>
   2bca9:	66 0f ef c0          	pxor   xmm0,xmm0
   2bcad:	f2 0f 2a c0          	cvtsi2sd xmm0,eax
   2bcb1:	66 48 0f 6e ca       	movq   xmm1,rdx
   2bcb6:	31 c0                	xor    eax,eax
   2bcb8:	66 0f 2f c8          	comisd xmm1,xmm0
   2bcbc:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   2bcc3:	00 
   2bcc4:	0f 93 c0             	setae  al
   2bcc7:	48 83 eb 10          	sub    rbx,0x10
   2bccb:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   2bccf:	e9 64 ad ff ff       	jmp    26a38 <JS_CallInternal+0x4038>
   2bcd4:	48 8b b5 78 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x188]
   2bcdb:	48 8b 95 90 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x170]
   2bce2:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2bce9:	e8 12 c1 01 00       	call   47e00 <JS_ToObject>
   2bcee:	48 89 c1             	mov    rcx,rax
   2bcf1:	48 89 d0             	mov    rax,rdx
   2bcf4:	83 fa 06             	cmp    edx,0x6
   2bcf7:	0f 85 5f b1 ff ff    	jne    26e5c <JS_CallInternal+0x445c>
   2bcfd:	e9 9e 74 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2bd02:	66 0f ef c9          	pxor   xmm1,xmm1
   2bd06:	f2 0f 2a ca          	cvtsi2sd xmm1,edx
   2bd0a:	66 48 0f 6e c0       	movq   xmm0,rax
   2bd0f:	e9 77 ff ff ff       	jmp    2bc8b <JS_CallInternal+0x928b>
   2bd14:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2bd1b:	48 8d 35 86 40 0a 00 	lea    rsi,[rip+0xa4086]        # cfda8 <_IO_stdin_used+0x3da8>
   2bd22:	31 c0                	xor    eax,eax
   2bd24:	e8 87 49 00 00       	call   306b0 <JS_ThrowTypeError>
   2bd29:	e9 72 74 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2bd2e:	66 48 0f 6e c7       	movq   xmm0,rdi
   2bd33:	83 f8 08             	cmp    eax,0x8
   2bd36:	0f 84 ca f1 ff ff    	je     2af06 <JS_CallInternal+0x8506>
   2bd3c:	85 c0                	test   eax,eax
   2bd3e:	0f 85 6a a5 ff ff    	jne    262ae <JS_CallInternal+0x38ae>
   2bd44:	66 0f ef c9          	pxor   xmm1,xmm1
   2bd48:	f2 0f 2a c9          	cvtsi2sd xmm1,ecx
   2bd4c:	e9 ba f1 ff ff       	jmp    2af0b <JS_CallInternal+0x850b>
   2bd51:	66 48 0f 6e c0       	movq   xmm0,rax
   2bd56:	83 f9 08             	cmp    ecx,0x8
   2bd59:	0f 84 52 ff ff ff    	je     2bcb1 <JS_CallInternal+0x92b1>
   2bd5f:	85 c9                	test   ecx,ecx
   2bd61:	0f 85 49 f7 ff ff    	jne    2b4b0 <JS_CallInternal+0x8ab0>
   2bd67:	66 0f ef c9          	pxor   xmm1,xmm1
   2bd6b:	f2 0f 2a ca          	cvtsi2sd xmm1,edx
   2bd6f:	e9 42 ff ff ff       	jmp    2bcb6 <JS_CallInternal+0x92b6>
   2bd74:	4d 89 c1             	mov    r9,r8
   2bd77:	48 89 d7             	mov    rdi,rdx
   2bd7a:	45 31 c0             	xor    r8d,r8d
   2bd7d:	4c 89 ea             	mov    rdx,r13
   2bd80:	4c 89 ce             	mov    rsi,r9
   2bd83:	4c 89 f1             	mov    rcx,r14
   2bd86:	48 89 bd 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rdi
   2bd8d:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   2bd94:	e8 07 e7 fe ff       	call   1a4a0 <js_strict_eq2.isra.0>
   2bd99:	48 8b b5 38 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c8]
   2bda0:	48 8b 95 40 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c0]
   2bda7:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   2bdad:	e9 34 ef ff ff       	jmp    2ace6 <JS_CallInternal+0x82e6>
   2bdb2:	31 c0                	xor    eax,eax
   2bdb4:	41 83 fe ff          	cmp    r14d,0xffffffff
   2bdb8:	75 08                	jne    2bdc2 <JS_CallInternal+0x93c2>
   2bdba:	31 c0                	xor    eax,eax
   2bdbc:	4c 39 ea             	cmp    rdx,r13
   2bdbf:	0f 94 c0             	sete   al
   2bdc2:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2bdc9:	48 89 d6             	mov    rsi,rdx
   2bdcc:	4c 89 c2             	mov    rdx,r8
   2bdcf:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   2bdd5:	e8 f6 0b ff ff       	call   1c9d0 <JS_FreeValue>
   2bdda:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2bde1:	4c 89 ee             	mov    rsi,r13
   2bde4:	4c 89 f2             	mov    rdx,r14
   2bde7:	e8 e4 0b ff ff       	call   1c9d0 <JS_FreeValue>
   2bdec:	48 63 85 50 fe ff ff 	movsxd rax,DWORD PTR [rbp-0x1b0]
   2bdf3:	e9 e7 92 ff ff       	jmp    250df <JS_CallInternal+0x26df>
   2bdf8:	45 85 f6             	test   r14d,r14d
   2bdfb:	75 5e                	jne    2be5b <JS_CallInternal+0x945b>
   2bdfd:	66 0f ef c0          	pxor   xmm0,xmm0
   2be01:	66 48 0f 6e e2       	movq   xmm4,rdx
   2be06:	31 c0                	xor    eax,eax
   2be08:	ba 00 00 00 00       	mov    edx,0x0
   2be0d:	f2 41 0f 2a c5       	cvtsi2sd xmm0,r13d
   2be12:	66 0f 2e c4          	ucomisd xmm0,xmm4
   2be16:	0f 9b c0             	setnp  al
   2be19:	48 0f 45 c2          	cmovne rax,rdx
   2be1d:	e9 bd 92 ff ff       	jmp    250df <JS_CallInternal+0x26df>
   2be22:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2be29:	48 8d 35 71 07 0a 00 	lea    rsi,[rip+0xa0771]        # cc5a1 <_IO_stdin_used+0x5a1>
   2be30:	31 c0                	xor    eax,eax
   2be32:	e8 79 48 00 00       	call   306b0 <JS_ThrowTypeError>
   2be37:	e9 64 73 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2be3c:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2be43:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
   2be4a:	4c 89 ee             	mov    rsi,r13
   2be4d:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2be51:	e8 1a 0a ff ff       	call   1c870 <__JS_FreeValueRT>
   2be56:	e9 6d c9 ff ff       	jmp    287c8 <JS_CallInternal+0x5dc8>
   2be5b:	41 83 fe 08          	cmp    r14d,0x8
   2be5f:	0f 85 d4 08 00 00    	jne    2c739 <JS_CallInternal+0x9d39>
   2be65:	66 48 0f 6e c2       	movq   xmm0,rdx
   2be6a:	66 49 0f 6e ed       	movq   xmm5,r13
   2be6f:	31 c0                	xor    eax,eax
   2be71:	ba 00 00 00 00       	mov    edx,0x0
   2be76:	66 0f 2e c5          	ucomisd xmm0,xmm5
   2be7a:	0f 9b c0             	setnp  al
   2be7d:	48 0f 45 c2          	cmovne rax,rdx
   2be81:	e9 59 92 ff ff       	jmp    250df <JS_CallInternal+0x26df>
   2be86:	83 c1 07             	add    ecx,0x7
   2be89:	83 f9 01             	cmp    ecx,0x1
   2be8c:	0f 87 67 f5 ff ff    	ja     2b3f9 <JS_CallInternal+0x89f9>
   2be92:	4c 89 c1             	mov    rcx,r8
   2be95:	49 89 f8             	mov    r8,rdi
   2be98:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2be9f:	4c 89 d6             	mov    rsi,r10
   2bea2:	4c 89 da             	mov    rdx,r11
   2bea5:	e8 f6 41 01 00       	call   400a0 <JS_ConcatString>
   2beaa:	48 89 43 e0          	mov    QWORD PTR [rbx-0x20],rax
   2beae:	48 8d 43 f0          	lea    rax,[rbx-0x10]
   2beb2:	48 89 53 e8          	mov    QWORD PTR [rbx-0x18],rdx
   2beb6:	83 7b e8 06          	cmp    DWORD PTR [rbx-0x18],0x6
   2beba:	48 89 c3             	mov    rbx,rax
   2bebd:	0f 85 79 bd ff ff    	jne    27c3c <JS_CallInternal+0x523c>
   2bec3:	e9 d8 72 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2bec8:	4d 89 ec             	mov    r12,r13
   2becb:	e9 d0 72 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2bed0:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2bed7:	48 8d 35 ea 05 0a 00 	lea    rsi,[rip+0xa05ea]        # cc4c8 <_IO_stdin_used+0x4c8>
   2bede:	31 c0                	xor    eax,eax
   2bee0:	e8 cb 47 00 00       	call   306b0 <JS_ThrowTypeError>
   2bee5:	e9 b6 72 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2beea:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   2bef1:	89 c2                	mov    edx,eax
   2bef3:	48 8d 75 80          	lea    rsi,[rbp-0x80]
   2bef7:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
   2befb:	e8 e0 b3 fe ff       	call   172e0 <JS_AtomGetStrRT.constprop.0>
   2bf00:	48 89 c2             	mov    rdx,rax
   2bf03:	e9 f9 ee ff ff       	jmp    2ae01 <JS_CallInternal+0x8401>
   2bf08:	66 49 0f 6e ca       	movq   xmm1,r10
   2bf0d:	83 ff 08             	cmp    edi,0x8
   2bf10:	0f 84 dc fc ff ff    	je     2bbf2 <JS_CallInternal+0x91f2>
   2bf16:	85 ff                	test   edi,edi
   2bf18:	0f 85 db f4 ff ff    	jne    2b3f9 <JS_CallInternal+0x89f9>
   2bf1e:	66 0f ef c0          	pxor   xmm0,xmm0
   2bf22:	f2 41 0f 2a c0       	cvtsi2sd xmm0,r8d
   2bf27:	e9 cb fc ff ff       	jmp    2bbf7 <JS_CallInternal+0x91f7>
   2bf2c:	66 48 0f 6e c9       	movq   xmm1,rcx
   2bf31:	83 f8 08             	cmp    eax,0x8
   2bf34:	0f 84 80 f1 ff ff    	je     2b0ba <JS_CallInternal+0x86ba>
   2bf3a:	85 c0                	test   eax,eax
   2bf3c:	0f 85 6c a3 ff ff    	jne    262ae <JS_CallInternal+0x38ae>
   2bf42:	66 0f ef c0          	pxor   xmm0,xmm0
   2bf46:	f2 0f 2a c2          	cvtsi2sd xmm0,edx
   2bf4a:	e9 70 f1 ff ff       	jmp    2b0bf <JS_CallInternal+0x86bf>
   2bf4f:	4d 89 ec             	mov    r12,r13
   2bf52:	e9 49 72 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2bf57:	48 8b 9d 50 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1b0]
   2bf5e:	e9 3d 72 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2bf63:	41 8d 50 fe          	lea    edx,[r8-0x2]
   2bf67:	83 fa 01             	cmp    edx,0x1
   2bf6a:	0f 86 19 05 00 00    	jbe    2c489 <JS_CallInternal+0x9a89>
   2bf70:	83 c0 01             	add    eax,0x1
   2bf73:	0f 85 d7 dc ff ff    	jne    29c50 <JS_CallInternal+0x7250>
   2bf79:	31 c0                	xor    eax,eax
   2bf7b:	4d 39 ce             	cmp    r14,r9
   2bf7e:	4c 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r8
   2bf85:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   2bf8c:	0f 94 c0             	sete   al
   2bf8f:	e9 79 f1 ff ff       	jmp    2b10d <JS_CallInternal+0x870d>
   2bf94:	45 85 c0             	test   r8d,r8d
   2bf97:	0f 85 db 01 00 00    	jne    2c178 <JS_CallInternal+0x9778>
   2bf9d:	66 0f ef c0          	pxor   xmm0,xmm0
   2bfa1:	66 49 0f 6e ce       	movq   xmm1,r14
   2bfa6:	31 d2                	xor    edx,edx
   2bfa8:	f2 41 0f 2a c1       	cvtsi2sd xmm0,r9d
   2bfad:	66 0f 2e c1          	ucomisd xmm0,xmm1
   2bfb1:	0f 9b c2             	setnp  dl
   2bfb4:	0f 44 c2             	cmove  eax,edx
   2bfb7:	e9 7d 91 ff ff       	jmp    25139 <JS_CallInternal+0x2739>
   2bfbc:	41 8d 50 fe          	lea    edx,[r8-0x2]
   2bfc0:	83 fa 01             	cmp    edx,0x1
   2bfc3:	0f 86 06 05 00 00    	jbe    2c4cf <JS_CallInternal+0x9acf>
   2bfc9:	83 c0 01             	add    eax,0x1
   2bfcc:	0f 85 7e dc ff ff    	jne    29c50 <JS_CallInternal+0x7250>
   2bfd2:	41 0f b6 41 11       	movzx  eax,BYTE PTR [r9+0x11]
   2bfd7:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2bfde:	4c 89 c2             	mov    rdx,r8
   2bfe1:	83 e0 01             	and    eax,0x1
   2bfe4:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   2bfea:	e8 e1 09 ff ff       	call   1c9d0 <JS_FreeValue>
   2bfef:	8b 85 50 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1b0]
   2bff5:	e9 3f 91 ff ff       	jmp    25139 <JS_CallInternal+0x2739>
   2bffa:	66 48 0f 6e ca       	movq   xmm1,rdx
   2bfff:	83 f9 08             	cmp    ecx,0x8
   2c002:	0f 84 a2 01 00 00    	je     2c1aa <JS_CallInternal+0x97aa>
   2c008:	85 c9                	test   ecx,ecx
   2c00a:	0f 85 20 eb ff ff    	jne    2ab30 <JS_CallInternal+0x8130>
   2c010:	66 0f ef c0          	pxor   xmm0,xmm0
   2c014:	f2 0f 2a c0          	cvtsi2sd xmm0,eax
   2c018:	31 c0                	xor    eax,eax
   2c01a:	66 0f 2f c8          	comisd xmm1,xmm0
   2c01e:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   2c025:	00 
   2c026:	0f 97 c0             	seta   al
   2c029:	48 83 eb 10          	sub    rbx,0x10
   2c02d:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   2c031:	e9 3a a5 ff ff       	jmp    26570 <JS_CallInternal+0x3b70>
   2c036:	b8 03 00 00 00       	mov    eax,0x3
   2c03b:	31 c9                	xor    ecx,ecx
   2c03d:	e9 a0 75 ff ff       	jmp    235e2 <JS_CallInternal+0xbe2>
   2c042:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c049:	48 8d 35 02 05 0a 00 	lea    rsi,[rip+0xa0502]        # cc552 <_IO_stdin_used+0x552>
   2c050:	31 c0                	xor    eax,eax
   2c052:	e8 59 46 00 00       	call   306b0 <JS_ThrowTypeError>
   2c057:	e9 44 71 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2c05c:	41 8d 50 fe          	lea    edx,[r8-0x2]
   2c060:	83 fa 01             	cmp    edx,0x1
   2c063:	0f 86 92 06 00 00    	jbe    2c6fb <JS_CallInternal+0x9cfb>
   2c069:	83 c0 01             	add    eax,0x1
   2c06c:	0f 85 ab db ff ff    	jne    29c1d <JS_CallInternal+0x721d>
   2c072:	41 0f b6 41 11       	movzx  eax,BYTE PTR [r9+0x11]
   2c077:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c07e:	4c 89 c2             	mov    rdx,r8
   2c081:	83 e0 01             	and    eax,0x1
   2c084:	88 85 50 fe ff ff    	mov    BYTE PTR [rbp-0x1b0],al
   2c08a:	e8 41 09 ff ff       	call   1c9d0 <JS_FreeValue>
   2c08f:	0f b6 85 50 fe ff ff 	movzx  eax,BYTE PTR [rbp-0x1b0]
   2c096:	e9 fe 90 ff ff       	jmp    25199 <JS_CallInternal+0x2799>
   2c09b:	41 8d 50 fe          	lea    edx,[r8-0x2]
   2c09f:	83 fa 01             	cmp    edx,0x1
   2c0a2:	0f 86 5d 06 00 00    	jbe    2c705 <JS_CallInternal+0x9d05>
   2c0a8:	83 c0 01             	add    eax,0x1
   2c0ab:	0f 85 6c db ff ff    	jne    29c1d <JS_CallInternal+0x721d>
   2c0b1:	4d 39 ce             	cmp    r14,r9
   2c0b4:	4c 89 f6             	mov    rsi,r14
   2c0b7:	4c 8b b5 e8 fe ff ff 	mov    r14,QWORD PTR [rbp-0x118]
   2c0be:	4c 89 ea             	mov    rdx,r13
   2c0c1:	0f 94 c0             	sete   al
   2c0c4:	4c 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],r8
   2c0cb:	4c 89 f7             	mov    rdi,r14
   2c0ce:	88 85 50 fe ff ff    	mov    BYTE PTR [rbp-0x1b0],al
   2c0d4:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   2c0db:	e8 f0 08 ff ff       	call   1c9d0 <JS_FreeValue>
   2c0e0:	48 8b b5 40 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c0]
   2c0e7:	48 8b 95 38 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c8]
   2c0ee:	4c 89 f7             	mov    rdi,r14
   2c0f1:	e8 da 08 ff ff       	call   1c9d0 <JS_FreeValue>
   2c0f6:	0f b6 85 50 fe ff ff 	movzx  eax,BYTE PTR [rbp-0x1b0]
   2c0fd:	e9 97 90 ff ff       	jmp    25199 <JS_CallInternal+0x2799>
   2c102:	45 85 c0             	test   r8d,r8d
   2c105:	75 49                	jne    2c150 <JS_CallInternal+0x9750>
   2c107:	66 0f ef c0          	pxor   xmm0,xmm0
   2c10b:	66 49 0f 6e ee       	movq   xmm5,r14
   2c110:	ba 00 00 00 00       	mov    edx,0x0
   2c115:	f2 41 0f 2a c1       	cvtsi2sd xmm0,r9d
   2c11a:	66 0f 2e c5          	ucomisd xmm0,xmm5
   2c11e:	0f 9b c0             	setnp  al
   2c121:	0f 45 c2             	cmovne eax,edx
   2c124:	e9 70 90 ff ff       	jmp    25199 <JS_CallInternal+0x2799>
   2c129:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c130:	4c 89 c6             	mov    rsi,r8
   2c133:	4c 89 e2             	mov    rdx,r12
   2c136:	89 8d 40 fe ff ff    	mov    DWORD PTR [rbp-0x1c0],ecx
   2c13c:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c140:	e8 2b 07 ff ff       	call   1c870 <__JS_FreeValueRT>
   2c145:	8b 8d 40 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x1c0]
   2c14b:	e9 ad ca ff ff       	jmp    28bfd <JS_CallInternal+0x61fd>
   2c150:	41 83 f8 08          	cmp    r8d,0x8
   2c154:	0f 85 c3 da ff ff    	jne    29c1d <JS_CallInternal+0x721d>
   2c15a:	66 49 0f 6e c6       	movq   xmm0,r14
   2c15f:	66 49 0f 6e f1       	movq   xmm6,r9
   2c164:	ba 00 00 00 00       	mov    edx,0x0
   2c169:	66 0f 2e c6          	ucomisd xmm0,xmm6
   2c16d:	0f 9b c0             	setnp  al
   2c170:	0f 45 c2             	cmovne eax,edx
   2c173:	e9 21 90 ff ff       	jmp    25199 <JS_CallInternal+0x2799>
   2c178:	41 83 f8 08          	cmp    r8d,0x8
   2c17c:	0f 85 ce da ff ff    	jne    29c50 <JS_CallInternal+0x7250>
   2c182:	66 49 0f 6e c6       	movq   xmm0,r14
   2c187:	66 49 0f 6e d1       	movq   xmm2,r9
   2c18c:	31 c0                	xor    eax,eax
   2c18e:	ba 00 00 00 00       	mov    edx,0x0
   2c193:	66 0f 2e c2          	ucomisd xmm0,xmm2
   2c197:	0f 9b c0             	setnp  al
   2c19a:	0f 45 c2             	cmovne eax,edx
   2c19d:	e9 97 8f ff ff       	jmp    25139 <JS_CallInternal+0x2739>
   2c1a2:	66 0f ef c9          	pxor   xmm1,xmm1
   2c1a6:	f2 0f 2a ca          	cvtsi2sd xmm1,edx
   2c1aa:	66 48 0f 6e c0       	movq   xmm0,rax
   2c1af:	e9 64 fe ff ff       	jmp    2c018 <JS_CallInternal+0x9618>
   2c1b4:	48 8b 85 c0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x140]
   2c1bb:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   2c1c2:	31 d2                	xor    edx,edx
   2c1c4:	f3 0f 6f 90 d8 04 00 	movdqu xmm2,XMMWORD PTR [rax+0x4d8]
   2c1cb:	00 
   2c1cc:	0f 11 53 f0          	movups XMMWORD PTR [rbx-0x10],xmm2
   2c1d0:	0f 29 95 50 fe ff ff 	movaps XMMWORD PTR [rbp-0x1b0],xmm2
   2c1d7:	48 89 90 d8 04 00 00 	mov    QWORD PTR [rax+0x4d8],rdx
   2c1de:	48 c7 80 e0 04 00 00 	mov    QWORD PTR [rax+0x4e0],0x4
   2c1e5:	04 00 00 00 
   2c1e9:	49 63 c5             	movsxd rax,r13d
   2c1ec:	48 03 41 18          	add    rax,QWORD PTR [rcx+0x18]
   2c1f0:	e9 cc 6a ff ff       	jmp    22cc1 <JS_CallInternal+0x2c1>
   2c1f5:	41 83 fe 08          	cmp    r14d,0x8
   2c1f9:	0f 84 07 03 00 00    	je     2c506 <JS_CallInternal+0x9b06>
   2c1ff:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
   2c206:	4c 89 48 30          	mov    QWORD PTR [rax+0x30],r9
   2c20a:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   2c20e:	e9 26 f1 ff ff       	jmp    2b339 <JS_CallInternal+0x8939>
   2c213:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   2c21a:	89 c2                	mov    edx,eax
   2c21c:	48 8d 75 80          	lea    rsi,[rbp-0x80]
   2c220:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
   2c224:	e8 b7 b0 fe ff       	call   172e0 <JS_AtomGetStrRT.constprop.0>
   2c229:	48 89 c2             	mov    rdx,rax
   2c22c:	e9 38 ec ff ff       	jmp    2ae69 <JS_CallInternal+0x8469>
   2c231:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   2c238:	89 c2                	mov    edx,eax
   2c23a:	48 8d 75 80          	lea    rsi,[rbp-0x80]
   2c23e:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
   2c242:	e8 99 b0 fe ff       	call   172e0 <JS_AtomGetStrRT.constprop.0>
   2c247:	48 89 c2             	mov    rdx,rax
   2c24a:	e9 55 ec ff ff       	jmp    2aea4 <JS_CallInternal+0x84a4>
   2c24f:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c256:	4c 89 ee             	mov    rsi,r13
   2c259:	48 89 da             	mov    rdx,rbx
   2c25c:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c260:	e8 0b 06 ff ff       	call   1c870 <__JS_FreeValueRT>
   2c265:	e9 e7 e6 ff ff       	jmp    2a951 <JS_CallInternal+0x7f51>
   2c26a:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   2c271:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c278:	4c 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r8
   2c27f:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c283:	e8 e8 05 ff ff       	call   1c870 <__JS_FreeValueRT>
   2c288:	4c 8b 85 40 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1c0]
   2c28f:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
   2c296:	e9 cb d8 ff ff       	jmp    29b66 <JS_CallInternal+0x7166>
   2c29b:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c2a2:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
   2c2a9:	4c 89 ee             	mov    rsi,r13
   2c2ac:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c2b0:	e8 bb 05 ff ff       	call   1c870 <__JS_FreeValueRT>
   2c2b5:	e9 71 e9 ff ff       	jmp    2ac2b <JS_CallInternal+0x822b>
   2c2ba:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c2c1:	48 89 ce             	mov    rsi,rcx
   2c2c4:	48 89 da             	mov    rdx,rbx
   2c2c7:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c2cb:	e8 a0 05 ff ff       	call   1c870 <__JS_FreeValueRT>
   2c2d0:	e9 15 d9 ff ff       	jmp    29bea <JS_CallInternal+0x71ea>
   2c2d5:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c2dc:	48 8b 95 38 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c8]
   2c2e3:	48 89 ce             	mov    rsi,rcx
   2c2e6:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c2ea:	e8 81 05 ff ff       	call   1c870 <__JS_FreeValueRT>
   2c2ef:	e9 1d d9 ff ff       	jmp    29c11 <JS_CallInternal+0x7211>
   2c2f4:	48 89 03             	mov    QWORD PTR [rbx],rax
   2c2f7:	48 89 53 08          	mov    QWORD PTR [rbx+0x8],rdx
   2c2fb:	e9 80 9d ff ff       	jmp    26080 <JS_CallInternal+0x3680>
   2c300:	66 48 0f 6e c0       	movq   xmm0,rax
   2c305:	83 f9 08             	cmp    ecx,0x8
   2c308:	74 5c                	je     2c366 <JS_CallInternal+0x9966>
   2c30a:	85 c9                	test   ecx,ecx
   2c30c:	0f 85 5f ec ff ff    	jne    2af71 <JS_CallInternal+0x8571>
   2c312:	66 0f ef c9          	pxor   xmm1,xmm1
   2c316:	f2 0f 2a ca          	cvtsi2sd xmm1,edx
   2c31a:	31 c0                	xor    eax,eax
   2c31c:	66 0f 2f c8          	comisd xmm1,xmm0
   2c320:	48 c7 43 e8 01 00 00 	mov    QWORD PTR [rbx-0x18],0x1
   2c327:	00 
   2c328:	0f 97 c0             	seta   al
   2c32b:	48 83 eb 10          	sub    rbx,0x10
   2c32f:	48 89 43 f0          	mov    QWORD PTR [rbx-0x10],rax
   2c333:	e9 48 a7 ff ff       	jmp    26a80 <JS_CallInternal+0x4080>
   2c338:	48 8b 87 48 04 00 00 	mov    rax,QWORD PTR [rdi+0x448]
   2c33f:	4a 8b 34 e8          	mov    rsi,QWORD PTR [rax+r13*8]
   2c343:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2c346:	83 e8 01             	sub    eax,0x1
   2c349:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2c34c:	85 c0                	test   eax,eax
   2c34e:	0f 8f 53 f6 ff ff    	jg     2b9a7 <JS_CallInternal+0x8fa7>
   2c354:	e8 a7 90 fe ff       	call   15400 <JS_FreeAtomStruct>
   2c359:	e9 49 f6 ff ff       	jmp    2b9a7 <JS_CallInternal+0x8fa7>
   2c35e:	66 0f ef c0          	pxor   xmm0,xmm0
   2c362:	f2 0f 2a c0          	cvtsi2sd xmm0,eax
   2c366:	66 48 0f 6e ca       	movq   xmm1,rdx
   2c36b:	eb ad                	jmp    2c31a <JS_CallInternal+0x991a>
   2c36d:	48 8b bd a0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x160]
   2c374:	48 8d 35 45 39 0a 00 	lea    rsi,[rip+0xa3945]        # cfcc0 <_IO_stdin_used+0x3cc0>
   2c37b:	31 c0                	xor    eax,eax
   2c37d:	e8 2e 43 00 00       	call   306b0 <JS_ThrowTypeError>
   2c382:	e9 19 6e ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2c387:	48 89 d7             	mov    rdi,rdx
   2c38a:	4c 89 ce             	mov    rsi,r9
   2c38d:	45 31 c0             	xor    r8d,r8d
   2c390:	4c 89 ea             	mov    rdx,r13
   2c393:	4c 89 f1             	mov    rcx,r14
   2c396:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   2c39d:	48 89 bd 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rdi
   2c3a4:	e8 f7 e0 fe ff       	call   1a4a0 <js_strict_eq2.isra.0>
   2c3a9:	48 8b b5 38 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c8]
   2c3b0:	4c 8b 8d 40 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c0]
   2c3b7:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   2c3bd:	e9 00 ee ff ff       	jmp    2b1c2 <JS_CallInternal+0x87c2>
   2c3c2:	31 c0                	xor    eax,eax
   2c3c4:	41 83 fe ff          	cmp    r14d,0xffffffff
   2c3c8:	75 08                	jne    2c3d2 <JS_CallInternal+0x99d2>
   2c3ca:	31 c0                	xor    eax,eax
   2c3cc:	4c 39 ea             	cmp    rdx,r13
   2c3cf:	0f 94 c0             	sete   al
   2c3d2:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c3d9:	48 89 d6             	mov    rsi,rdx
   2c3dc:	4c 89 ca             	mov    rdx,r9
   2c3df:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   2c3e5:	e8 e6 05 ff ff       	call   1c9d0 <JS_FreeValue>
   2c3ea:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c3f1:	4c 89 ee             	mov    rsi,r13
   2c3f4:	4c 89 f2             	mov    rdx,r14
   2c3f7:	e8 d4 05 ff ff       	call   1c9d0 <JS_FreeValue>
   2c3fc:	8b 85 50 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1b0]
   2c402:	83 f0 01             	xor    eax,0x1
   2c405:	48 98                	cdqe
   2c407:	e9 7f 8c ff ff       	jmp    2508b <JS_CallInternal+0x268b>
   2c40c:	45 85 f6             	test   r14d,r14d
   2c40f:	75 40                	jne    2c451 <JS_CallInternal+0x9a51>
   2c411:	66 0f ef c0          	pxor   xmm0,xmm0
   2c415:	66 48 0f 6e fa       	movq   xmm7,rdx
   2c41a:	31 c0                	xor    eax,eax
   2c41c:	ba 01 00 00 00       	mov    edx,0x1
   2c421:	f2 41 0f 2a c5       	cvtsi2sd xmm0,r13d
   2c426:	66 0f 2e c7          	ucomisd xmm0,xmm7
   2c42a:	0f 9a c0             	setp   al
   2c42d:	48 0f 45 c2          	cmovne rax,rdx
   2c431:	e9 55 8c ff ff       	jmp    2508b <JS_CallInternal+0x268b>
   2c436:	45 31 ed             	xor    r13d,r13d
   2c439:	48 c7 43 08 03 00 00 	mov    QWORD PTR [rbx+0x8],0x3
   2c440:	00 
   2c441:	4c 89 2b             	mov    QWORD PTR [rbx],r13
   2c444:	e9 8b 9b ff ff       	jmp    25fd4 <JS_CallInternal+0x35d4>
   2c449:	4d 89 ec             	mov    r12,r13
   2c44c:	e9 4f 6d ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2c451:	41 83 fe 08          	cmp    r14d,0x8
   2c455:	0f 85 d1 00 00 00    	jne    2c52c <JS_CallInternal+0x9b2c>
   2c45b:	66 48 0f 6e c2       	movq   xmm0,rdx
   2c460:	66 49 0f 6e cd       	movq   xmm1,r13
   2c465:	31 c0                	xor    eax,eax
   2c467:	ba 01 00 00 00       	mov    edx,0x1
   2c46c:	66 0f 2e c1          	ucomisd xmm0,xmm1
   2c470:	0f 9a c0             	setp   al
   2c473:	48 0f 45 c2          	cmovne rax,rdx
   2c477:	e9 0f 8c ff ff       	jmp    2508b <JS_CallInternal+0x268b>
   2c47c:	e8 df 63 00 00       	call   32860 <JS_ThrowReferenceErrorUninitialized>
   2c481:	4d 89 f4             	mov    r12,r14
   2c484:	e9 17 6d ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2c489:	41 0f b6 46 11       	movzx  eax,BYTE PTR [r14+0x11]
   2c48e:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c495:	4c 89 f6             	mov    rsi,r14
   2c498:	4c 89 ea             	mov    rdx,r13
   2c49b:	83 e0 01             	and    eax,0x1
   2c49e:	89 85 50 fe ff ff    	mov    DWORD PTR [rbp-0x1b0],eax
   2c4a4:	e8 27 05 ff ff       	call   1c9d0 <JS_FreeValue>
   2c4a9:	8b 85 50 fe ff ff    	mov    eax,DWORD PTR [rbp-0x1b0]
   2c4af:	e9 85 8c ff ff       	jmp    25139 <JS_CallInternal+0x2739>
   2c4b4:	4d 89 f4             	mov    r12,r14
   2c4b7:	e9 e4 6c ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2c4bc:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c4c3:	89 ce                	mov    esi,ecx
   2c4c5:	e8 96 63 00 00       	call   32860 <JS_ThrowReferenceErrorUninitialized>
   2c4ca:	e9 db d9 ff ff       	jmp    29eaa <JS_CallInternal+0x74aa>
   2c4cf:	b8 01 00 00 00       	mov    eax,0x1
   2c4d4:	e9 60 8c ff ff       	jmp    25139 <JS_CallInternal+0x2739>
   2c4d9:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c4e0:	4c 89 ee             	mov    rsi,r13
   2c4e3:	4c 89 f2             	mov    rdx,r14
   2c4e6:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
   2c4ed:	e8 de 04 ff ff       	call   1c9d0 <JS_FreeValue>
   2c4f2:	48 8b 8d 50 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1b0]
   2c4f9:	31 c0                	xor    eax,eax
   2c4fb:	44 39 f1             	cmp    ecx,r14d
   2c4fe:	0f 95 c0             	setne  al
   2c501:	e9 85 8b ff ff       	jmp    2508b <JS_CallInternal+0x268b>
   2c506:	66 49 0f 6e c0       	movq   xmm0,r8
   2c50b:	f2 41 0f 58 45 00    	addsd  xmm0,QWORD PTR [r13+0x0]
   2c511:	49 c7 45 08 08 00 00 	mov    QWORD PTR [r13+0x8],0x8
   2c518:	00 
   2c519:	f2 41 0f 11 45 00    	movsd  QWORD PTR [r13+0x0],xmm0
   2c51f:	e9 b4 b6 ff ff       	jmp    27bd8 <JS_CallInternal+0x51d8>
   2c524:	4d 89 f4             	mov    r12,r14
   2c527:	e9 74 6c ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2c52c:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c533:	4c 89 ee             	mov    rsi,r13
   2c536:	4c 89 f2             	mov    rdx,r14
   2c539:	e8 92 04 ff ff       	call   1c9d0 <JS_FreeValue>
   2c53e:	e9 ee d8 ff ff       	jmp    29e31 <JS_CallInternal+0x7431>
   2c543:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   2c54a:	0f 8e 50 6c ff ff    	jle    231a0 <JS_CallInternal+0x7a0>
   2c550:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c557:	44 89 ee             	mov    esi,r13d
   2c55a:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c55e:	e8 0d ce fe ff       	call   19370 <JS_FreeAtom.part.0.isra.0>
   2c563:	e9 38 6c ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2c568:	4c 89 eb             	mov    rbx,r13
   2c56b:	e9 30 6c ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2c570:	41 81 fd f2 00 00 00 	cmp    r13d,0xf2
   2c577:	0f 8e 23 6c ff ff    	jle    231a0 <JS_CallInternal+0x7a0>
   2c57d:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c584:	44 89 ee             	mov    esi,r13d
   2c587:	48 8b 78 10          	mov    rdi,QWORD PTR [rax+0x10]
   2c58b:	e8 e0 cd fe ff       	call   19370 <JS_FreeAtom.part.0.isra.0>
   2c590:	e9 0b 6c ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2c595:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
   2c59c:	4c 8b 60 10          	mov    r12,QWORD PTR [rax+0x10]
   2c5a0:	41 80 bc 24 e9 04 00 	cmp    BYTE PTR [r12+0x4e9],0x0
   2c5a7:	00 00 
   2c5a9:	0f 84 00 01 00 00    	je     2c6af <JS_CallInternal+0x9caf>
   2c5af:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c5b6:	4c 89 ce             	mov    rsi,r9
   2c5b9:	48 89 ca             	mov    rdx,rcx
   2c5bc:	45 31 ff             	xor    r15d,r15d
   2c5bf:	e8 0c 04 ff ff       	call   1c9d0 <JS_FreeValue>
   2c5c4:	4c 89 3b             	mov    QWORD PTR [rbx],r15
   2c5c7:	48 c7 43 08 06 00 00 	mov    QWORD PTR [rbx+0x8],0x6
   2c5ce:	00 
   2c5cf:	e9 ac 9a ff ff       	jmp    26080 <JS_CallInternal+0x3680>
   2c5d4:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c5db:	48 8d 35 bf ff 09 00 	lea    rsi,[rip+0x9ffbf]        # cc5a1 <_IO_stdin_used+0x5a1>
   2c5e2:	31 c0                	xor    eax,eax
   2c5e4:	e8 c7 40 00 00       	call   306b0 <JS_ThrowTypeError>
   2c5e9:	e9 b2 6b ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2c5ee:	4d 89 cc             	mov    r12,r9
   2c5f1:	e9 aa 6b ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2c5f6:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
   2c5fa:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c601:	4c 89 c2             	mov    rdx,r8
   2c604:	4c 89 f1             	mov    rcx,r14
   2c607:	4c 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],r9
   2c60e:	4c 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r8
   2c615:	e8 16 88 fe ff       	call   14e30 <JS_ConcatStringInPlace>
   2c61a:	4c 8b 85 50 fe ff ff 	mov    r8,QWORD PTR [rbp-0x1b0]
   2c621:	4c 8b 8d 40 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1c0]
   2c628:	85 c0                	test   eax,eax
   2c62a:	75 64                	jne    2c690 <JS_CallInternal+0x9c90>
   2c62c:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
   2c630:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
   2c634:	83 fa f6             	cmp    edx,0xfffffff6
   2c637:	76 04                	jbe    2c63d <JS_CallInternal+0x9c3d>
   2c639:	83 46 fc 01          	add    DWORD PTR [rsi-0x4],0x1
   2c63d:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c644:	4c 89 c1             	mov    rcx,r8
   2c647:	4d 89 f0             	mov    r8,r14
   2c64a:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
   2c651:	e8 4a 3a 01 00       	call   400a0 <JS_ConcatString>
   2c656:	4c 8b 8d 50 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1b0]
   2c65d:	83 fa 06             	cmp    edx,0x6
   2c660:	49 89 c0             	mov    r8,rax
   2c663:	49 89 d6             	mov    r14,rdx
   2c666:	0f 84 87 00 00 00    	je     2c6f3 <JS_CallInternal+0x9cf3>
   2c66c:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
   2c670:	49 8b 55 08          	mov    rdx,QWORD PTR [r13+0x8]
   2c674:	4d 89 45 00          	mov    QWORD PTR [r13+0x0],r8
   2c678:	4d 89 75 08          	mov    QWORD PTR [r13+0x8],r14
   2c67c:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c683:	48 89 c6             	mov    rsi,rax
   2c686:	e8 45 03 ff ff       	call   1c9d0 <JS_FreeValue>
   2c68b:	e9 48 b5 ff ff       	jmp    27bd8 <JS_CallInternal+0x51d8>
   2c690:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c697:	4c 89 c6             	mov    rsi,r8
   2c69a:	4c 89 f2             	mov    rdx,r14
   2c69d:	e8 2e 03 ff ff       	call   1c9d0 <JS_FreeValue>
   2c6a2:	e9 31 b5 ff ff       	jmp    27bd8 <JS_CallInternal+0x51d8>
   2c6a7:	4d 89 f4             	mov    r12,r14
   2c6aa:	e9 f1 6a ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2c6af:	41 c6 84 24 e9 04 00 	mov    BYTE PTR [r12+0x4e9],0x1
   2c6b6:	00 01 
   2c6b8:	48 89 c7             	mov    rdi,rax
   2c6bb:	31 c0                	xor    eax,eax
   2c6bd:	48 8d 35 f6 fd 09 00 	lea    rsi,[rip+0x9fdf6]        # cc4ba <_IO_stdin_used+0x4ba>
   2c6c4:	48 89 8d 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rcx
   2c6cb:	4c 89 8d 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],r9
   2c6d2:	e8 b9 63 00 00       	call   32a90 <JS_ThrowInternalError>
   2c6d7:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
   2c6de:	41 c6 84 24 e9 04 00 	mov    BYTE PTR [r12+0x4e9],0x0
   2c6e5:	00 00 
   2c6e7:	4c 8b 8d 50 fe ff ff 	mov    r9,QWORD PTR [rbp-0x1b0]
   2c6ee:	e9 bc fe ff ff       	jmp    2c5af <JS_CallInternal+0x9baf>
   2c6f3:	4d 89 cc             	mov    r12,r9
   2c6f6:	e9 a5 6a ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2c6fb:	b8 01 00 00 00       	mov    eax,0x1
   2c700:	e9 94 8a ff ff       	jmp    25199 <JS_CallInternal+0x2799>
   2c705:	41 0f b6 46 11       	movzx  eax,BYTE PTR [r14+0x11]
   2c70a:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c711:	4c 89 f6             	mov    rsi,r14
   2c714:	4c 89 ea             	mov    rdx,r13
   2c717:	83 e0 01             	and    eax,0x1
   2c71a:	88 85 50 fe ff ff    	mov    BYTE PTR [rbp-0x1b0],al
   2c720:	e8 ab 02 ff ff       	call   1c9d0 <JS_FreeValue>
   2c725:	0f b6 85 50 fe ff ff 	movzx  eax,BYTE PTR [rbp-0x1b0]
   2c72c:	e9 68 8a ff ff       	jmp    25199 <JS_CallInternal+0x2799>
   2c731:	4d 89 ec             	mov    r12,r13
   2c734:	e9 67 6a ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>
   2c739:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c740:	4c 89 ee             	mov    rsi,r13
   2c743:	4c 89 f2             	mov    rdx,r14
   2c746:	e8 85 02 ff ff       	call   1c9d0 <JS_FreeValue>
   2c74b:	31 c0                	xor    eax,eax
   2c74d:	e9 8d 89 ff ff       	jmp    250df <JS_CallInternal+0x26df>
   2c752:	48 8b bd e8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x118]
   2c759:	45 39 f0             	cmp    r8d,r14d
   2c75c:	4c 89 ee             	mov    rsi,r13
   2c75f:	4c 89 f2             	mov    rdx,r14
   2c762:	0f 94 85 50 fe ff ff 	sete   BYTE PTR [rbp-0x1b0]
   2c769:	e8 62 02 ff ff       	call   1c9d0 <JS_FreeValue>
   2c76e:	0f b6 85 50 fe ff ff 	movzx  eax,BYTE PTR [rbp-0x1b0]
   2c775:	e9 65 89 ff ff       	jmp    250df <JS_CallInternal+0x26df>
   2c77a:	3d f2 00 00 00       	cmp    eax,0xf2
   2c77f:	0f 8e 86 f0 ff ff    	jle    2b80b <JS_CallInternal+0x8e0b>
   2c785:	48 8b 8d e8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x118]
   2c78c:	89 c0                	mov    eax,eax
   2c78e:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
   2c792:	48 8b 97 48 04 00 00 	mov    rdx,QWORD PTR [rdi+0x448]
   2c799:	48 8b 34 c2          	mov    rsi,QWORD PTR [rdx+rax*8]
   2c79d:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   2c7a0:	83 e8 01             	sub    eax,0x1
   2c7a3:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   2c7a6:	85 c0                	test   eax,eax
   2c7a8:	0f 8f 5d f0 ff ff    	jg     2b80b <JS_CallInternal+0x8e0b>
   2c7ae:	e8 4d 8c fe ff       	call   15400 <JS_FreeAtomStruct>
   2c7b3:	e9 53 f0 ff ff       	jmp    2b80b <JS_CallInternal+0x8e0b>
   2c7b8:	e8 13 52 fe ff       	call   119d0 <__stack_chk_fail@plt>
   2c7bd:	4d 89 f4             	mov    r12,r14
   2c7c0:	e9 db 69 ff ff       	jmp    231a0 <JS_CallInternal+0x7a0>

Disassembly of section .fini:
