; Real contiguous address window; contains mutually exclusive branches / possibly next handler.
; NOT a dynamically traced path. Complete context in native/final/M_base/JS_CallInternal.txt.gz
   23f2a:	f3 0f 1e fa          	endbr64
   23f2e:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   23f32:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   23f39:	4d 8d 5c 24 04       	lea    r11,[r12+0x4]
   23f3e:	4c 8b 53 f8          	mov    r10,QWORD PTR [rbx-0x8]
   23f42:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   23f46:	48 c1 e0 04          	shl    rax,0x4
   23f4a:	48 03 41 60          	add    rax,QWORD PTR [rcx+0x60]
   23f4e:	49 89 c6             	mov    r14,rax
   23f51:	41 83 fa ff          	cmp    r10d,0xffffffff
   23f55:	0f 85 5e 72 00 00    	jne    2b1b9 <JS_CallInternal+0x86f9>
   23f5b:	8b 46 10             	mov    eax,DWORD PTR [rsi+0x10]
   23f5e:	4c 8b 6e 18          	mov    r13,QWORD PTR [rsi+0x18]
   23f62:	25 08 00 ff ff       	and    eax,0xffff0008
   23f67:	3d 00 00 01 00       	cmp    eax,0x10000
   23f6c:	0f 84 90 5f 00 00    	je     29f02 <JS_CallInternal+0x7442>
   23f72:	41 8b 4e 0c          	mov    ecx,DWORD PTR [r14+0xc]
   23f76:	48 89 f7             	mov    rdi,rsi
   23f79:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   23f80:	41 8b 45 18          	mov    eax,DWORD PTR [r13+0x18]
   23f84:	89 ca                	mov    edx,ecx
   23f86:	21 c2                	and    edx,eax
   23f88:	41 8b 54 95 38       	mov    edx,DWORD PTR [r13+rdx*4+0x38]
   23f8d:	48 85 d2             	test   rdx,rdx
   23f90:	0f 84 46 4e 00 00    	je     28ddc <JS_CallInternal+0x631c>
   23f96:	4c 8d 04 85 34 00 00 	lea    r8,[rax*4+0x34]
   23f9d:	00 
   23f9e:	49 8d 04 d0          	lea    rax,[r8+rdx*8]
   23fa2:	4c 01 e8             	add    rax,r13
   23fa5:	3b 48 04             	cmp    ecx,DWORD PTR [rax+0x4]
   23fa8:	0f 85 20 4e 00 00    	jne    28dce <JS_CallInternal+0x630e>
   23fae:	80 78 03 3f          	cmp    BYTE PTR [rax+0x3],0x3f
   23fb2:	0f 87 0b 54 00 00    	ja     293c3 <JS_CallInternal+0x6903>
   23fb8:	48 c1 e2 04          	shl    rdx,0x4
   23fbc:	48 8d 42 f0          	lea    rax,[rdx-0x10]
   23fc0:	48 8b 57 20          	mov    rdx,QWORD PTR [rdi+0x20]
   23fc4:	48 01 c2             	add    rdx,rax
   23fc7:	4c 8b 02             	mov    r8,QWORD PTR [rdx]
   23fca:	48 8b 52 08          	mov    rdx,QWORD PTR [rdx+0x8]
   23fce:	83 fa f6             	cmp    edx,0xfffffff6
   23fd1:	76 05                	jbe    23fd8 <JS_CallInternal+0x1518>
   23fd3:	41 83 40 fc 01       	add    DWORD PTR [r8-0x4],0x1
   23fd8:	48 39 fe             	cmp    rsi,rdi
   23fdb:	0f 84 2e 7e 00 00    	je     2be0f <JS_CallInternal+0x934f>
   23fe1:	4c 89 c0             	mov    rax,r8
   23fe4:	48 89 03             	mov    QWORD PTR [rbx],rax
   23fe7:	49 83 c4 05          	add    r12,0x5
   23feb:	48 83 c3 10          	add    rbx,0x10
   23fef:	48 89 53 f8          	mov    QWORD PTR [rbx-0x8],rdx
   23ff3:	41 0f b6 44 24 ff    	movzx  eax,BYTE PTR [r12-0x1]
   23ff9:	49 89 c5             	mov    r13,rax
   23ffc:	49 8b 04 c7          	mov    rax,QWORD PTR [r15+rax*8]
   24000:	ff e0                	jmp    rax
   24002:	f3 0f 1e fa          	endbr64
   24006:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   2400a:	48 8b 8d d8 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x128]
   24011:	4c 8b 53 f8          	mov    r10,QWORD PTR [rbx-0x8]
   24015:	48 8b 73 f0          	mov    rsi,QWORD PTR [rbx-0x10]
   24019:	48 c1 e0 04          	shl    rax,0x4
   2401d:	48 03 41 60          	add    rax,QWORD PTR [rcx+0x60]
   24021:	49 89 c6             	mov    r14,rax
   24024:	49 8d 44 24 04       	lea    rax,[r12+0x4]
   24029:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
   24030:	41 83 fa ff          	cmp    r10d,0xffffffff
   24034:	0f 85 a0 6d 00 00    	jne    2adda <JS_CallInternal+0x831a>
   2403a:	8b 46 10             	mov    eax,DWORD PTR [rsi+0x10]
   2403d:	4c 8b 6e 18          	mov    r13,QWORD PTR [rsi+0x18]
   24041:	25 08 00 ff ff       	and    eax,0xffff0008
   24046:	3d 00 00 01 00       	cmp    eax,0x10000
   2404b:	0f 84 8f 5c 00 00    	je     29ce0 <JS_CallInternal+0x7220>
   24051:	41 8b 4e 0c          	mov    ecx,DWORD PTR [r14+0xc]
   24055:	48 89 f2             	mov    rdx,rsi
   24058:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   2405f:	00 
   24060:	41 8b 45 18          	mov    eax,DWORD PTR [r13+0x18]
   24064:	89 cf                	mov    edi,ecx
   24066:	21 c7                	and    edi,eax
   24068:	41 8b 7c bd 38       	mov    edi,DWORD PTR [r13+rdi*4+0x38]
   2406d:	48 85 ff             	test   rdi,rdi
   24070:	0f 84 38 4d 00 00    	je     28dae <JS_CallInternal+0x62ee>
   24076:	4c 8d 04 85 34 00 00 	lea    r8,[rax*4+0x34]
   2407d:	00 
   2407e:	49 8d 04 f8          	lea    rax,[r8+rdi*8]
   24082:	4c 01 e8             	add    rax,r13
   24085:	3b 48 04             	cmp    ecx,DWORD PTR [rax+0x4]
   24088:	0f 85 12 4d 00 00    	jne    28da0 <JS_CallInternal+0x62e0>
   2408e:	80 78 03 3f          	cmp    BYTE PTR [rax+0x3],0x3f
   24092:	0f 87 c2 52 00 00    	ja     2935a <JS_CallInternal+0x689a>
   24098:	48 89 f9             	mov    rcx,rdi
   2409b:	48 8b 7a 20          	mov    rdi,QWORD PTR [rdx+0x20]
