
/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SHAPE_ONLY.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002e7a1 <JS_CallInternal+0x8d91>:
   2e7a1:	mov    0x14(%r9),%ecx
   2e7a5:	jmp    2c9cf <JS_CallInternal+0x6fbf>
   2e7aa:	cmp    $0x8,%esi
   2e7ad:	je     300fe <JS_CallInternal+0xa6ee>
   2e7b3:	cmp    $0x8,%ecx
   2e7b6:	jne    2e7c0 <JS_CallInternal+0x8db0>
   2e7b8:	test   %esi,%esi
   2e7ba:	je     30136 <JS_CallInternal+0xa726>
   2e7c0:	mov    -0x150(%rbp),%rax
   2e7c7:	mov    %r10d,%edx
   2e7ca:	mov    %rbx,%rsi
   2e7cd:	mov    %r13,%rdi
   2e7d0:	mov    %r12,0x30(%rax)
   2e7d4:	call   5d870 <js_relational_slow>
   2e7d9:	test   %eax,%eax
   2e7db:	jne    26240 <JS_CallInternal+0x830>
   2e7e1:	sub    $0x10,%rbx
   2e7e5:	jmp    27f40 <JS_CallInternal+0x2530>
   2e7ea:	mov    %rdx,%rax
   2e7ed:	mov    0x10(%r13),%rdi
   2e7f1:	mov    -0x1e0(%rbp),%rdx
   2e7f8:	mov    %ecx,-0x220(%rbp)
   2e7fe:	mov    %rax,%rsi
   2e801:	call   1eb60 <__JS_FreeValueRT>
   2e806:	mov    -0x220(%rbp),%ecx
   2e80c:	jmp    2a57e <JS_CallInternal+0x4b6e>
   2e811:	cmp    $0x8,%esi
   2e814:	je     3055a <JS_CallInternal+0xab4a>
   2e81a:	cmp    $0x8,%ecx
   2e81d:	jne    2e827 <JS_CallInternal+0x8e17>
   2e81f:	test   %esi,%esi
   2e821:	je     30592 <JS_CallInternal+0xab82>
   2e827:	mov    -0x150(%rbp),%rax
   2e82e:	mov    %r10d,%edx
   2e831:	mov    %rbx,%rsi
   2e834:	mov    %r13,%rdi
   2e837:	mov    %r12,0x30(%rax)
   2e83b:	call   5d870 <js_relational_slow>
   2e840:	test   %eax,%eax
   2e842:	jne    26240 <JS_CallInternal+0x830>
   2e848:	sub    $0x10,%rbx
   2e84c:	jmp    27cb1 <JS_CallInternal+0x22a1>
   2e851:	lea    0xaf5a8(%rip),%rsi        # dde00 <_IO_stdin_used+0x3e00>
   2e858:	mov    %r13,%rdi
   2e85b:	xor    %eax,%eax
   2e85d:	call   34e10 <JS_ThrowTypeError>
   2e862:	jmp    26240 <JS_CallInternal+0x830>
   2e867:	rex.B
   2e868:	.byte 0x83


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SHAPE_ONLY.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002d910 <JS_CallInternal+0x7f00>:
   2d910:	mov    0x10(%r9),%eax
   2d914:	cmp    $0xffffffff,%eax
   2d917:	je     2ab85 <JS_CallInternal+0x5175>
   2d91d:	shl    $0x4,%rax
   2d921:	add    0x20(%r10),%rax
   2d925:	mov    (%rax),%rdx
   2d928:	mov    0x8(%rax),%rax
   2d92c:	cmp    $0xfffffff6,%eax
   2d92f:	jbe    2d935 <JS_CallInternal+0x7f25>
   2d931:	addl   $0x1,-0x4(%rdx)
   2d935:	mov    %rdx,%rcx
   2d938:	jmp    2abf1 <JS_CallInternal+0x51e1>
   2d93d:	mov    0x10(%r13),%rdi
   2d941:	mov    %rax,%rdx
   2d944:	mov    %ecx,-0x210(%rbp)
   2d94a:	call   1eb60 <__JS_FreeValueRT>
   2d94f:	mov    -0x210(%rbp),%ecx
   2d955:	jmp    26996 <JS_CallInternal+0xf86>
   2d95a:	mov    0x10(%r13),%rdi
   2d95e:	mov    %ecx,%eax
   2d960:	mov    0x448(%rdi),%rsi
   2d967:	mov    (%rsi,%rax,8),%rsi
   2d96b:	mov    -0x4(%rsi),%eax
   2d96e:	sub    $0x1,%eax
   2d971:	mov    %eax,-0x4(%rsi)
   2d974:	test   %eax,%eax
   2d976:	jg     2bab8 <JS_CallInternal+0x60a8>
   2d97c:	mov    %r9,-0x200(%rbp)
   2d983:	mov    %r9,-0x1e8(%rbp)
   2d98a:	mov    %rdx,-0x1e0(%rbp)
   2d991:	call   16c60 <JS_FreeAtomStruct>
   2d996:	mov    -0x200(%rbp),%r9
   2d99d:	mov    -0x1e8(%rbp),%r8
   2d9a4:	mov    -0x1e0(%rbp),%rdx
   2d9ab:	jmp    2bab8 <JS_CallInternal+0x60a8>
   2d9b0:	xor    %r12d,%r12d
   2d9b3:	jmp    2c2eb <JS_CallInternal+0x68db>
   2d9b8:	cmp    $0xfffffff6,%ecx
   2d9bb:	jbe    2d9d0 <JS_CallInternal+0x7fc0>
   2d9bd:	mov    -0x4(%r10),%eax
   2d9c1:	sub    $0x1,%eax
   2d9c4:	mov    %eax,-0x4(%r10)
   2d9c8:	test   %eax,%eax
   2d9ca:	jle    303ff <JS_CallInternal+0xa9ef>
   2d9d0:	mov    $0x1,%eax
   2d9d5:	.byte 0xe9
   2d9d6:	pop    %rsi
   2d9d7:	.byte 0xa3


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SHAPE_ONLY.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002c266 <JS_CallInternal+0x6856>:
   2c266:	testb  $0x8,0x10(%rdi)
   2c26a:	jne    2c9c5 <JS_CallInternal+0x6fb5>
   2c270:	mov    0x30(%rdx),%rdi
   2c274:	test   %rdi,%rdi
   2c277:	je     2dda1 <JS_CallInternal+0x8391>
   2c27d:	mov    0x18(%rdi),%rdx
   2c281:	jmp    2ab90 <JS_CallInternal+0x5180>
   2c286:	mov    -0x170(%rbp),%esi
   2c28c:	cmp    %esi,%r8d
   2c28f:	mov    %esi,%r12d
   2c292:	cmovle %r8d,%r12d
   2c296:	test   %r12d,%r12d
   2c299:	jle    2d9b0 <JS_CallInternal+0x7fa0>
   2c29f:	mov    %eax,-0x150(%rbp)
   2c2a5:	movslq %r12d,%r13
   2c2a8:	mov    -0x180(%rbp),%r14
   2c2af:	xor    %esi,%esi
   2c2b1:	shl    $0x4,%r13
   2c2b5:	data16 cs nopw 0x0(%rax,%rax,1)
   2c2c0:	mov    0x8(%r14,%rsi,1),%rax
   2c2c5:	mov    (%r14,%rsi,1),%r11
   2c2c9:	cmp    $0xfffffff6,%eax
   2c2cc:	jbe    2c2d3 <JS_CallInternal+0x68c3>
   2c2ce:	addl   $0x1,-0x4(%r11)
   2c2d3:	mov    %r11,(%rdi,%rsi,1)
   2c2d7:	mov    %rax,0x8(%rdi,%rsi,1)
   2c2dc:	add    $0x10,%rsi
   2c2e0:	cmp    %r13,%rsi
   2c2e3:	jne    2c2c0 <JS_CallInternal+0x68b0>
   2c2e5:	mov    -0x150(%rbp),%eax
   2c2eb:	cmp    %r12d,%r8d
   2c2ee:	jle    2c338 <JS_CallInternal+0x6928>
   2c2f0:	lea    -0x1(%r8),%r11d
   2c2f4:	movslq %r12d,%r13
   2c2f7:	sub    %r12d,%r11d
   2c2fa:	mov    %r13,%rsi
   2c2fd:	add    %r13,%r11
   2c300:	shl    $0x4,%rsi
   2c304:	shl    $0x4,%r11
   2c308:	add    %rdi,%rsi
   2c30b:	lea    0x10(%rdi,%r11,1),%r11
   2c310:	nopl   0x0(%rax,%rax,1)
   2c315:	data16 cs nopw 0x0(%rax,%rax,1)
   2c320:	movq   $0x0,(%rsi)
   2c327:	add    $0x10,%rsi
   2c32b:	rex.W
   2c32c:	.byte 0xc7
   2c32d:	rex.RX


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SHAPE_ONLY.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002c259 <JS_CallInternal+0x6849>:
   2c259:	mov    (%rsi),%eax
   2c25b:	and    $0x3ffffff,%eax
   2c260:	jne    2abac <JS_CallInternal+0x519c>
   2c266:	testb  $0x8,0x10(%rdi)
   2c26a:	jne    2c9c5 <JS_CallInternal+0x6fb5>
   2c270:	mov    0x30(%rdx),%rdi
   2c274:	test   %rdi,%rdi
   2c277:	je     2dda1 <JS_CallInternal+0x8391>
   2c27d:	mov    0x18(%rdi),%rdx
   2c281:	jmp    2ab90 <JS_CallInternal+0x5180>
   2c286:	mov    -0x170(%rbp),%esi
   2c28c:	cmp    %esi,%r8d
   2c28f:	mov    %esi,%r12d
   2c292:	cmovle %r8d,%r12d
   2c296:	test   %r12d,%r12d
   2c299:	jle    2d9b0 <JS_CallInternal+0x7fa0>
   2c29f:	mov    %eax,-0x150(%rbp)
   2c2a5:	movslq %r12d,%r13
   2c2a8:	mov    -0x180(%rbp),%r14
   2c2af:	xor    %esi,%esi
   2c2b1:	shl    $0x4,%r13
   2c2b5:	data16 cs nopw 0x0(%rax,%rax,1)
   2c2c0:	mov    0x8(%r14,%rsi,1),%rax
   2c2c5:	mov    (%r14,%rsi,1),%r11
   2c2c9:	cmp    $0xfffffff6,%eax
   2c2cc:	jbe    2c2d3 <JS_CallInternal+0x68c3>
   2c2ce:	addl   $0x1,-0x4(%r11)
   2c2d3:	mov    %r11,(%rdi,%rsi,1)
   2c2d7:	mov    %rax,0x8(%rdi,%rsi,1)
   2c2dc:	add    $0x10,%rsi
   2c2e0:	cmp    %r13,%rsi
   2c2e3:	jne    2c2c0 <JS_CallInternal+0x68b0>
   2c2e5:	mov    -0x150(%rbp),%eax
   2c2eb:	cmp    %r12d,%r8d
   2c2ee:	jle    2c338 <JS_CallInternal+0x6928>
   2c2f0:	lea    -0x1(%r8),%r11d
   2c2f4:	movslq %r12d,%r13
   2c2f7:	sub    %r12d,%r11d
   2c2fa:	mov    %r13,%rsi
   2c2fd:	add    %r13,%r11
   2c300:	shl    $0x4,%rsi
   2c304:	shl    $0x4,%r11
   2c308:	add    %rdi,%rsi
   2c30b:	lea    0x10(%rdi,%r11,1),%r11
   2c310:	nopl   0x0(%rax,%rax,1)
   2c315:	data16 cs nopw 0x0(%rax,%rax,1)
   2c320:	rex.W


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SHAPE_ONLY.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002c9cf <JS_CallInternal+0x6fbf>:
   2c9cf:	sub    $0x8,%rsp
   2c9d3:	mov    -0x10(%rbx),%r8
   2c9d7:	mov    -0x8(%rbx),%r9
   2c9db:	mov    %r10,%rsi
   2c9de:	mov    -0x1e0(%rbp),%rdi
   2c9e5:	mov    -0x150(%rbp),%rax
   2c9ec:	mov    %r11,%rdx
   2c9ef:	mov    %rdi,0x30(%rax)
   2c9f3:	mov    %r13,%rdi
   2c9f6:	push   $0x0
   2c9f8:	call   30e70 <JS_GetPropertyInternal>
   2c9fd:	mov    %rax,%rcx
   2ca00:	mov    %rdx,%rax
   2ca03:	pop    %rdx
   2ca04:	pop    %rsi
   2ca05:	cmp    $0x6,%eax
   2ca08:	jne    2abf1 <JS_CallInternal+0x51e1>
   2ca0e:	mov    -0x1e0(%rbp),%r12
   2ca15:	jmp    26240 <JS_CallInternal+0x830>
   2ca1a:	mov    -0x150(%rbp),%rdi
   2ca21:	mov    %r8,0x30(%rdi)
   2ca25:	cmp    $0xfffffff6,%edx
   2ca28:	jbe    2ca2e <JS_CallInternal+0x701e>
   2ca2a:	addl   $0x1,-0x4(%rax)
   2ca2e:	mov    %rdx,-0x118(%rbp)
   2ca35:	mov    %r13,%rdi
   2ca38:	lea    -0x110(%rbp),%rsi
   2ca3f:	mov    $0x8c,%edx
   2ca44:	mov    %rcx,-0x1e0(%rbp)
   2ca4b:	mov    %r8,-0x1e8(%rbp)
   2ca52:	mov    %rax,-0x120(%rbp)
   2ca59:	call   53260 <js_unary_arith_slow>
   2ca5e:	mov    -0x1e0(%rbp),%rcx
   2ca65:	test   %eax,%eax
   2ca67:	jne    30ab5 <JS_CallInternal+0xb0a5>
   2ca6d:	mov    -0x120(%rbp),%rsi
   2ca74:	mov    (%rcx),%rdx
   2ca77:	mov    0x8(%rcx),%rax
   2ca7b:	mov    %rsi,(%rcx)
   2ca7e:	mov    -0x118(%rbp),%rsi
   2ca85:	mov    %rsi,0x8(%rcx)
   2ca89:	cmp    $0xfffffff6,%eax
   2ca8c:	jbe    2b630 <JS_CallInternal+0x5c20>
   2ca92:	mov    -0x4(%rdx),%ecx
   2ca95:	.byte 0x83
   2ca96:	.byte 0xe9


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SHAPE_ONLY.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002abe8 <JS_CallInternal+0x51d8>:
   2abe8:	cmp    %rdi,%r10
   2abeb:	je     2fb4a <JS_CallInternal+0xa13a>
   2abf1:	mov    -0x8(%rbx),%rsi
   2abf5:	cmp    $0xfffffff6,%esi
   2abf8:	jbe    2ac0f <JS_CallInternal+0x51ff>
   2abfa:	mov    -0x10(%rbx),%rdi
   2abfe:	mov    -0x4(%rdi),%edx
   2ac01:	sub    $0x1,%edx
   2ac04:	mov    %edx,-0x4(%rdi)
   2ac07:	test   %edx,%edx
   2ac09:	jle    2e078 <JS_CallInternal+0x8668>
   2ac0f:	mov    %rcx,-0x10(%rbx)
   2ac13:	add    $0x5,%r12
   2ac17:	mov    %rax,-0x8(%rbx)
   2ac1b:	movzbl -0x1(%r12),%eax
   2ac21:	mov    %rax,%r10
   2ac24:	mov    (%r14,%rax,8),%rax
   2ac28:	jmp    *%rax
   2ac2a:	endbr64
   2ac2e:	mov    -0x8(%rbx),%rax
   2ac32:	mov    -0x10(%rbx),%rdx
   2ac36:	cmp    $0x3,%eax
   2ac39:	ja     2d173 <JS_CallInternal+0x7763>
   2ac3f:	xor    %eax,%eax
   2ac41:	test   %edx,%edx
   2ac43:	setne  %al
   2ac46:	test   %eax,%eax
   2ac48:	movq   $0x1,-0x8(%rbx)
   2ac50:	sete   %al
   2ac53:	add    $0x1,%r12
   2ac57:	movzbl %al,%eax
   2ac5a:	mov    %rax,-0x10(%rbx)
   2ac5e:	movzbl -0x1(%r12),%eax
   2ac64:	mov    %rax,%r10
   2ac67:	mov    (%r14,%rax,8),%rax
   2ac6b:	jmp    *%rax
   2ac6d:	endbr64
   2ac71:	mov    (%r12),%r9d
   2ac75:	mov    -0x8(%rbx),%rax
   2ac79:	lea    0x4(%r12),%rcx
   2ac7e:	mov    %rcx,-0x1e8(%rbp)
   2ac85:	mov    -0x10(%rbx),%r10
   2ac89:	mov    %rax,-0x1e0(%rbp)
   2ac90:	add    %r12,%r9
   2ac93:	cmp    $0xffffffff,%eax
   2ac96:	jne    2e765 <JS_CallInternal+0x8d55>
   2ac9c:	movzwl 0x12(%r10),%eax
   2aca1:	mov    0x18(%r10),%r11
   2aca5:	mov    %ax,-0x200(%rbp)
   2acac:	cmp    $0x1,%ax


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SHAPE_ONLY.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002fb4a <JS_CallInternal+0xa13a>:
   2fb4a:	cmpb   $0x0,0x10(%rdx)
   2fb4e:	je     2abf1 <JS_CallInternal+0x51e1>
   2fb54:	mov    0x8(%r9),%rdi
   2fb58:	xor    %r8d,%r8d
   2fb5b:	sar    $0x4,%rsi
   2fb5f:	addl   $0x1,-0x4(%rdx)
   2fb63:	mov    %rdx,(%r9)
   2fb66:	mov    %r8,0x8(%r9)
   2fb6a:	mov    %esi,0x10(%r9)
   2fb6e:	test   %rdi,%rdi
   2fb71:	je     2fb9b <JS_CallInternal+0xa18b>
   2fb73:	mov    %rdi,%rsi
   2fb76:	mov    0x10(%r13),%rdi
   2fb7a:	mov    %rcx,-0x200(%rbp)
   2fb81:	mov    %rax,-0x1e0(%rbp)
   2fb88:	call   207f0 <js_free_shape>
   2fb8d:	mov    -0x200(%rbp),%rcx
   2fb94:	mov    -0x1e0(%rbp),%rax
   2fb9b:	mov    -0x1e8(%rbp),%rsi
   2fba2:	test   %rsi,%rsi
   2fba5:	je     2abf1 <JS_CallInternal+0x51e1>
   2fbab:	mov    0x10(%r13),%rdi
   2fbaf:	mov    %rcx,-0x1e8(%rbp)
   2fbb6:	mov    %rax,-0x1e0(%rbp)
   2fbbd:	call   207f0 <js_free_shape>
   2fbc2:	mov    -0x1e0(%rbp),%rax
   2fbc9:	mov    -0x1e8(%rbp),%rcx
   2fbd0:	jmp    2abf1 <JS_CallInternal+0x51e1>
   2fbd5:	cmp    %rsi,(%r11)
   2fbd8:	jne    26e0a <JS_CallInternal+0x13fa>
   2fbde:	mov    %rax,%rdx
   2fbe1:	movzwl 0x58(%r11),%r9d
   2fbe6:	mov    0x10(%r13),%rdi
   2fbea:	push   %rax
   2fbeb:	lea    -0x138(%rbp),%rax
   2fbf2:	push   %rax
   2fbf3:	call   19740 <plan_base.isra.0>
   2fbf8:	pop    %rdx
   2fbf9:	pop    %rcx
   2fbfa:	test   %eax,%eax
   2fbfc:	jne    30ac1 <JS_CallInternal+0xb0b1>
   2fc02:	mov    -0x10(%r10),%rdi
   2fc06:	mov    -0x8(%r10),%rdx
   2fc0a:	jmp    26e0a <JS_CallInternal+0x13fa>
   2fc0f:	rex.WB
   2fc10:	.byte 0x8b
   2fc11:	.byte 0x7d


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SHAPE_ONLY.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002ac0f <JS_CallInternal+0x51ff>:
   2ac0f:	mov    %rcx,-0x10(%rbx)
   2ac13:	add    $0x5,%r12
   2ac17:	mov    %rax,-0x8(%rbx)
   2ac1b:	movzbl -0x1(%r12),%eax
   2ac21:	mov    %rax,%r10
   2ac24:	mov    (%r14,%rax,8),%rax
   2ac28:	jmp    *%rax
   2ac2a:	endbr64
   2ac2e:	mov    -0x8(%rbx),%rax
   2ac32:	mov    -0x10(%rbx),%rdx
   2ac36:	cmp    $0x3,%eax
   2ac39:	ja     2d173 <JS_CallInternal+0x7763>
   2ac3f:	xor    %eax,%eax
   2ac41:	test   %edx,%edx
   2ac43:	setne  %al
   2ac46:	test   %eax,%eax
   2ac48:	movq   $0x1,-0x8(%rbx)
   2ac50:	sete   %al
   2ac53:	add    $0x1,%r12
   2ac57:	movzbl %al,%eax
   2ac5a:	mov    %rax,-0x10(%rbx)
   2ac5e:	movzbl -0x1(%r12),%eax
   2ac64:	mov    %rax,%r10
   2ac67:	mov    (%r14,%rax,8),%rax
   2ac6b:	jmp    *%rax
   2ac6d:	endbr64
   2ac71:	mov    (%r12),%r9d
   2ac75:	mov    -0x8(%rbx),%rax
   2ac79:	lea    0x4(%r12),%rcx
   2ac7e:	mov    %rcx,-0x1e8(%rbp)
   2ac85:	mov    -0x10(%rbx),%r10
   2ac89:	mov    %rax,-0x1e0(%rbp)
   2ac90:	add    %r12,%r9
   2ac93:	cmp    $0xffffffff,%eax
   2ac96:	jne    2e765 <JS_CallInternal+0x8d55>
   2ac9c:	movzwl 0x12(%r10),%eax
   2aca1:	mov    0x18(%r10),%r11
   2aca5:	mov    %ax,-0x200(%rbp)
   2acac:	cmp    $0x1,%ax
   2acb0:	je     2d58f <JS_CallInternal+0x7b7f>
   2acb6:	mov    0x14(%r9),%ecx
   2acba:	mov    %r11,%rdx
   2acbd:	mov    %r10,%rdi
   2acc0:	mov    0x18(%rdx),%esi
   2acc3:	mov    %esi,%eax
   2acc5:	and    %ecx,%eax
   2acc7:	mov    0x38(%rdx,%rax,4),%eax
   2accb:	test   %rax,%rax
   2acce:	je     2c239 <JS_CallInternal+0x6829>
   2acd4:	rex.WR
   2acd5:	.byte 0x8d
   2acd6:	.byte 0x4


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SHAPE_ONLY.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002e078 <JS_CallInternal+0x8668>:
   2e078:	mov    %rsi,%rdx
   2e07b:	mov    %rdi,%rsi
   2e07e:	mov    0x10(%r13),%rdi
   2e082:	mov    %rcx,-0x1e8(%rbp)
   2e089:	mov    %rax,-0x1e0(%rbp)
   2e090:	call   1eb60 <__JS_FreeValueRT>
   2e095:	mov    -0x1e8(%rbp),%rcx
   2e09c:	mov    -0x1e0(%rbp),%rax
   2e0a3:	jmp    2ac0f <JS_CallInternal+0x51ff>
   2e0a8:	mov    %rdi,%rsi
   2e0ab:	mov    0x10(%r13),%rdi
   2e0af:	call   1eb60 <__JS_FreeValueRT>
   2e0b4:	jmp    28bac <JS_CallInternal+0x319c>
   2e0b9:	mov    0x10(%r13),%rdi
   2e0bd:	mov    %rcx,%rsi
   2e0c0:	call   1eb60 <__JS_FreeValueRT>
   2e0c5:	jmp    28bfc <JS_CallInternal+0x31ec>
   2e0ca:	mov    %rdi,%rsi
   2e0cd:	mov    0x10(%r13),%rdi
   2e0d1:	call   1eb60 <__JS_FreeValueRT>
   2e0d6:	jmp    28c9d <JS_CallInternal+0x328d>
   2e0db:	mov    0x10(%r13),%rdi
   2e0df:	mov    %rax,%rdx
   2e0e2:	mov    %rcx,%rsi
   2e0e5:	mov    %r8,-0x1e0(%rbp)
   2e0ec:	call   1eb60 <__JS_FreeValueRT>
   2e0f1:	mov    -0x1e0(%rbp),%r8
   2e0f8:	jmp    2c123 <JS_CallInternal+0x6713>
   2e0fd:	mov    0x10(%r13),%rdi
   2e101:	mov    %rcx,%rsi
   2e104:	call   1eb60 <__JS_FreeValueRT>
   2e109:	jmp    2bfc3 <JS_CallInternal+0x65b3>
   2e10e:	mov    0x10(%r13),%rdi
   2e112:	mov    %r9,%rsi
   2e115:	mov    %r10,%rdx
   2e118:	mov    %rcx,-0x1e8(%rbp)
   2e11f:	mov    %rax,-0x1e0(%rbp)
   2e126:	call   1eb60 <__JS_FreeValueRT>
   2e12b:	mov    -0x1e8(%rbp),%rcx
   2e132:	mov    -0x1e0(%rbp),%rax
   2e139:	jmp    2b899 <JS_CallInternal+0x5e89>
   2e13e:	rex.W
   2e13f:	.byte 0x8b


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SHAPE_ONLY.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002d173 <JS_CallInternal+0x7763>:
   2d173:	xchg   %rax,%rdx
   2d175:	mov    %r13,%rdi
   2d178:	mov    %rax,%rsi
   2d17b:	call   213a0 <JS_ToBoolFree>
   2d180:	jmp    2ac46 <JS_CallInternal+0x5236>
   2d185:	mov    %rax,%rsi
   2d188:	mov    %r13,%rdi
   2d18b:	mov    %rcx,-0x1e0(%rbp)
   2d192:	call   213a0 <JS_ToBoolFree>
   2d197:	mov    -0x1e0(%rbp),%rcx
   2d19e:	jmp    2bec1 <JS_CallInternal+0x64b1>
   2d1a3:	mov    %rax,%rsi
   2d1a6:	mov    %r13,%rdi
   2d1a9:	mov    %rcx,-0x1e0(%rbp)
   2d1b0:	call   213a0 <JS_ToBoolFree>
   2d1b5:	mov    -0x1e0(%rbp),%rcx
   2d1bc:	jmp    2a694 <JS_CallInternal+0x4c84>
   2d1c1:	mov    %rax,%rsi
   2d1c4:	mov    %r13,%rdi
   2d1c7:	mov    %rcx,-0x1e0(%rbp)
   2d1ce:	call   213a0 <JS_ToBoolFree>
   2d1d3:	mov    -0x1e0(%rbp),%rcx
   2d1da:	jmp    2a63f <JS_CallInternal+0x4c2f>
   2d1df:	mov    %rax,%rsi
   2d1e2:	mov    %r13,%rdi
   2d1e5:	mov    %rcx,-0x1e0(%rbp)
   2d1ec:	call   213a0 <JS_ToBoolFree>
   2d1f1:	mov    -0x1e0(%rbp),%rcx
   2d1f8:	jmp    2a5e9 <JS_CallInternal+0x4bd9>
   2d1fd:	mov    -0x150(%rbp),%rax
   2d204:	mov    %rbx,%rsi
   2d207:	mov    %r13,%rdi
   2d20a:	mov    %r12,0x30(%rax)
   2d20e:	call   537f0 <js_not_slow>
   2d213:	test   %eax,%eax
   2d215:	je     2a6f2 <JS_CallInternal+0x4ce2>
   2d21b:	jmp    26240 <JS_CallInternal+0x830>
   2d220:	mov    (%rax),%edx
   2d222:	and    $0x3ffffff,%edx
   2d228:	jne    284bb <JS_CallInternal+0x2aab>
   2d22e:	mov    -0x1e0(%rbp),%rdi
   2d235:	sub    $0x8,%rsp
   2d239:	rex.W
   2d23a:	.byte 0x8b
