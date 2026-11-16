; Real contiguous address window; contains mutually exclusive branches / possibly next handler.
; NOT a dynamically traced path. Complete context in native/final/M_base/JS_CallInternal.txt.gz
   24a41:	f3 0f 1e fa          	endbr64
   24a45:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   24a4c:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   24a50:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
   24a54:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   24a58:	83 f8 f6             	cmp    eax,0xfffffff6
   24a5b:	76 04                	jbe    24a61 <JS_CallInternal+0x1fa1>
   24a5d:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   24a61:	48 89 13             	mov    QWORD PTR [rbx],rdx
   24a64:	49 83 c4 01          	add    r12,0x1
   24a68:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
   24a6c:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24a72:	48 89 cb             	mov    rbx,rcx
   24a75:	49 89 c5             	mov    r13,rax
   24a78:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24a7c:	ff e0                	jmp    rax
   24a7e:	f3 0f 1e fa          	endbr64
   24a82:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   24a89:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   24a8d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   24a90:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   24a94:	83 f8 f6             	cmp    eax,0xfffffff6
   24a97:	76 04                	jbe    24a9d <JS_CallInternal+0x1fdd>
   24a99:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   24a9d:	48 89 13             	mov    QWORD PTR [rbx],rdx
   24aa0:	49 83 c4 01          	add    r12,0x1
   24aa4:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
   24aa8:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24aae:	48 89 cb             	mov    rbx,rcx
   24ab1:	49 89 c5             	mov    r13,rax
   24ab4:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24ab8:	ff e0                	jmp    rax
   24aba:	f3 0f 1e fa          	endbr64
   24abe:	48 8b 53 f8          	mov    rdx,QWORD PTR [rbx-0x8]
   24ac2:	48 8b 4b f0          	mov    rcx,QWORD PTR [rbx-0x10]
   24ac6:	83 fa f6             	cmp    edx,0xfffffff6
   24ac9:	76 04                	jbe    24acf <JS_CallInternal+0x200f>
   24acb:	83 41 fc 01          	add    DWORD PTR [rcx-0x4],0x1
   24acf:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   24ad4:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
   24adb:	48 c1 e0 04          	shl    rax,0x4
   24adf:	48 01 f8             	add    rax,rdi
   24ae2:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   24ae6:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   24ae9:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
   24aed:	48 89 08             	mov    QWORD PTR [rax],rcx
   24af0:	41 83 f8 f6          	cmp    r8d,0xfffffff6
   24af4:	76 11                	jbe    24b07 <JS_CallInternal+0x2047>
   24af6:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24af9:	83 e8 01             	sub    eax,0x1
   24afc:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24aff:	85 c0                	test   eax,eax
   24b01:	0f 8e a8 5c 00 00    	jle    2a7af <JS_CallInternal+0x7cef>
   24b07:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
   24b0d:	49 83 c4 02          	add    r12,0x2
   24b11:	49 89 c5             	mov    r13,rax
   24b14:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24b18:	ff e0                	jmp    rax
   24b1a:	f3 0f 1e fa          	endbr64
   24b1e:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   24b23:	48 8b 8d b0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x150]
   24b2a:	48 83 eb 10          	sub    rbx,0x10
   24b2e:	f3 0f 6f 13          	movdqu xmm2,XMMWORD PTR [rbx]
   24b32:	48 c1 e0 04          	shl    rax,0x4
   24b36:	48 01 c8             	add    rax,rcx
   24b39:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   24b3d:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   24b40:	0f 11 10             	movups XMMWORD PTR [rax],xmm2
   24b43:	83 fa f6             	cmp    edx,0xfffffff6
   24b46:	76 11                	jbe    24b59 <JS_CallInternal+0x2099>
   24b48:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24b4b:	83 e8 01             	sub    eax,0x1
   24b4e:	89 46 fc             	mov    DWORD PTR [rsi-0x4],eax
   24b51:	85 c0                	test   eax,eax
   24b53:	0f 8e cd 5a 00 00    	jle    2a626 <JS_CallInternal+0x7b66>
   24b59:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
   24b5f:	49 83 c4 02          	add    r12,0x2
   24b63:	49 89 c5             	mov    r13,rax
   24b66:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24b6a:	ff e0                	jmp    rax
   24b6c:	f3 0f 1e fa          	endbr64
   24b70:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
   24b75:	48 8b 8d b0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x150]
   24b7c:	48 c1 e0 04          	shl    rax,0x4
   24b80:	48 01 c8             	add    rax,rcx
   24b83:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   24b87:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   24b8a:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   24b8e:	83 f8 f6             	cmp    eax,0xfffffff6
   24b91:	76 04                	jbe    24b97 <JS_CallInternal+0x20d7>
