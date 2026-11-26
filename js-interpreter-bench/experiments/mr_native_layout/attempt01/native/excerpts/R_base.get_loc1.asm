; Real contiguous address window; contains mutually exclusive branches / possibly next handler.
; NOT a dynamically traced path. Complete context in native/final/R_base/JS_CallInternal.txt.gz
   24c6a:	f3 0f 1e fa          	endbr64
   24c6e:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   24c75:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   24c79:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
   24c7d:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   24c81:	83 f8 f6             	cmp    eax,0xfffffff6
   24c84:	76 04                	jbe    24c8a <JS_CallInternal+0x20ea>
   24c86:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   24c8a:	48 89 13             	mov    QWORD PTR [rbx],rdx
   24c8d:	49 83 c4 01          	add    r12,0x1
   24c91:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
   24c95:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24c9b:	48 89 cb             	mov    rbx,rcx
   24c9e:	49 89 c5             	mov    r13,rax
   24ca1:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24ca5:	ff e0                	jmp    rax
   24ca7:	f3 0f 1e fa          	endbr64
   24cab:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
   24cb2:	48 8d 4b 10          	lea    rcx,[rbx+0x10]
   24cb6:	48 8b 50 30          	mov    rdx,QWORD PTR [rax+0x30]
   24cba:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
   24cbe:	83 f8 f6             	cmp    eax,0xfffffff6
   24cc1:	76 04                	jbe    24cc7 <JS_CallInternal+0x2127>
   24cc3:	83 42 fc 01          	add    DWORD PTR [rdx-0x4],0x1
   24cc7:	48 89 13             	mov    QWORD PTR [rbx],rdx
   24cca:	49 83 c4 01          	add    r12,0x1
   24cce:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
   24cd2:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24cd8:	48 89 cb             	mov    rbx,rcx
   24cdb:	49 89 c5             	mov    r13,rax
   24cde:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24ce2:	ff e0                	jmp    rax
   24ce4:	f3 0f 1e fa          	endbr64
   24ce8:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   24ced:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
   24cf4:	4d 8d 6c 24 02       	lea    r13,[r12+0x2]
   24cf9:	48 89 c1             	mov    rcx,rax
   24cfc:	48 c1 e0 04          	shl    rax,0x4
   24d00:	48 01 f8             	add    rax,rdi
   24d03:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   24d07:	83 fa 04             	cmp    edx,0x4
   24d0a:	0f 84 b9 67 00 00    	je     2b4c9 <JS_CallInternal+0x8929>
   24d10:	48 8b 00             	mov    rax,QWORD PTR [rax]
   24d13:	83 fa f6             	cmp    edx,0xfffffff6
   24d16:	76 04                	jbe    24d1c <JS_CallInternal+0x217c>
   24d18:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
   24d1c:	48 89 03             	mov    QWORD PTR [rbx],rax
   24d1f:	49 83 c4 03          	add    r12,0x3
   24d23:	48 83 c3 10          	add    rbx,0x10
   24d27:	48 89 53 f8          	mov    QWORD PTR [rbx-0x8],rdx
   24d2b:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24d31:	49 89 c5             	mov    r13,rax
   24d34:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24d38:	ff e0                	jmp    rax
   24d3a:	f3 0f 1e fa          	endbr64
   24d3e:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   24d43:	48 8b bd b0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x150]
   24d4a:	4d 8d 6c 24 02       	lea    r13,[r12+0x2]
   24d4f:	48 89 c1             	mov    rcx,rax
   24d52:	48 c1 e0 04          	shl    rax,0x4
   24d56:	48 01 f8             	add    rax,rdi
   24d59:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   24d5d:	83 fa 04             	cmp    edx,0x4
   24d60:	0f 84 43 67 00 00    	je     2b4a9 <JS_CallInternal+0x8909>
   24d66:	48 8b 00             	mov    rax,QWORD PTR [rax]
   24d69:	83 fa f6             	cmp    edx,0xfffffff6
   24d6c:	76 04                	jbe    24d72 <JS_CallInternal+0x21d2>
   24d6e:	83 40 fc 01          	add    DWORD PTR [rax-0x4],0x1
   24d72:	48 89 03             	mov    QWORD PTR [rbx],rax
   24d75:	49 83 c4 03          	add    r12,0x3
   24d79:	48 83 c3 10          	add    rbx,0x10
   24d7d:	48 89 53 f8          	mov    QWORD PTR [rbx-0x8],rdx
   24d81:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   24d87:	49 89 c5             	mov    r13,rax
   24d8a:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24d8e:	ff e0                	jmp    rax
   24d90:	f3 0f 1e fa          	endbr64
   24d94:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
   24d99:	48 8b 8d b0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x150]
   24da0:	48 c1 e0 04          	shl    rax,0x4
   24da4:	48 01 c8             	add    rax,rcx
   24da7:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   24dab:	48 8b 30             	mov    rsi,QWORD PTR [rax]
   24dae:	48 c7 40 08 04 00 00 	mov    QWORD PTR [rax+0x8],0x4
   24db5:	00 
   24db6:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
   24dbd:	83 fa f6             	cmp    edx,0xfffffff6
   24dc0:	76 11                	jbe    24dd3 <JS_CallInternal+0x2233>
   24dc2:	8b 46 fc             	mov    eax,DWORD PTR [rsi-0x4]
   24dc5:	83 e8 01             	sub    eax,0x1
