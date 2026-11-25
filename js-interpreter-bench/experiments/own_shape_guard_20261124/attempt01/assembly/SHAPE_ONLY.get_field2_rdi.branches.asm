
/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SHAPE_ONLY.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002e765 <JS_CallInternal+0x8d55>:
   2e765:	mov    0x14(%r9),%ecx
   2e769:	jmp    2c76e <JS_CallInternal+0x6d5e>
   2e76e:	mov    %r13,%rdi
   2e771:	mov    %rcx,-0x1e0(%rbp)
   2e778:	call   370c0 <__js_poll_interrupts>
   2e77d:	mov    -0x1e0(%rbp),%rcx
   2e784:	test   %eax,%eax
   2e786:	je     30d86 <JS_CallInternal+0xb376>
   2e78c:	mov    %rcx,%r12
   2e78f:	jmp    26240 <JS_CallInternal+0x830>
   2e794:	add    $0x10,%rbx
   2e798:	add    $0x4,%r12
   2e79c:	jmp    26240 <JS_CallInternal+0x830>
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
   2e827:	rex.W
   2e828:	.byte 0x8b
   2e829:	.byte 0x85
   2e82a:	mov    $0xfe,%al
   2e82c:	.byte 0xff


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SHAPE_ONLY.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002d58f <JS_CallInternal+0x7b7f>:
   2d58f:	testb  $0x8,0x10(%r10)
   2d594:	jne    2acb6 <JS_CallInternal+0x52a6>
   2d59a:	mov    0x8(%r9),%rcx
   2d59e:	mov    (%r9),%rdx
   2d5a1:	test   %rcx,%rcx
   2d5a4:	je     2fdfa <JS_CallInternal+0xa3ea>
   2d5aa:	mov    0x30(%r11),%rax
   2d5ae:	cmp    %r11,%rdx
   2d5b1:	jne    2acb6 <JS_CallInternal+0x52a6>
   2d5b7:	test   %rax,%rax
   2d5ba:	je     2acb6 <JS_CallInternal+0x52a6>
   2d5c0:	cmpw   $0x1,0x12(%rax)
   2d5c5:	jne    2acb6 <JS_CallInternal+0x52a6>
   2d5cb:	testb  $0x8,0x10(%rax)
   2d5cf:	jne    2acb6 <JS_CallInternal+0x52a6>
   2d5d5:	cmp    0x18(%rax),%rcx
   2d5d9:	jne    2acb6 <JS_CallInternal+0x52a6>
   2d5df:	mov    0x10(%r9),%edx
   2d5e3:	shl    $0x4,%rdx
   2d5e7:	add    0x20(%rax),%rdx
   2d5eb:	mov    %rdx,%rax
   2d5ee:	mov    (%rdx),%rdx
   2d5f1:	mov    0x8(%rax),%rax
   2d5f5:	cmp    $0xfffffff6,%eax
   2d5f8:	jbe    2d5fe <JS_CallInternal+0x7bee>
   2d5fa:	addl   $0x1,-0x4(%rdx)
   2d5fe:	mov    %rdx,%rcx
   2d601:	jmp    2ad2b <JS_CallInternal+0x531b>
   2d606:	cs nopw 0x0(%rax,%rax,1)
   2d610:	cmp    $0xfffffffa,%ecx
   2d613:	jge    2d61a <JS_CallInternal+0x7c0a>
   2d615:	cmp    $0xfffffff8,%ecx
   2d618:	jge    2d672 <JS_CallInternal+0x7c62>
   2d61a:	mov    -0x10(%rbx),%rsi
   2d61e:	mov    -0x8(%rbx),%rdx
   2d622:	mov    $0x1,%ecx
   2d627:	mov    %r13,%rdi
   2d62a:	mov    -0x150(%rbp),%rax
   2d631:	mov    %r12,0x30(%rax)
   2d635:	call   445f0 <JS_ToStringInternal>
   2d63a:	mov    %rax,%r8
   2d63d:	mov    %rdx,%rcx
   2d640:	mov    %rdx,%rax
   2d643:	cmp    $0x6,%edx
   2d646:	je     26240 <JS_CallInternal+0x830>
   2d64c:	mov    -0x8(%rbx),%rsi
   2d650:	cmp    $0xfffffff6,%esi
   2d653:	jbe    2d66a <JS_CallInternal+0x7c5a>
   2d655:	rex.W
   2d656:	.byte 0x8b


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SHAPE_ONLY.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002c239 <JS_CallInternal+0x6829>:
   2c239:	testb  $0x8,0x10(%rdi)
   2c23d:	jne    2c760 <JS_CallInternal+0x6d50>
   2c243:	mov    0x30(%rdx),%rdi
   2c247:	test   %rdi,%rdi
   2c24a:	je     2dc64 <JS_CallInternal+0x8254>
   2c250:	mov    0x18(%rdi),%rdx
   2c254:	jmp    2acc0 <JS_CallInternal+0x52b0>
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
   2c300:	rex.W


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SHAPE_ONLY.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002c22c <JS_CallInternal+0x681c>:
   2c22c:	mov    (%rsi),%eax
   2c22e:	and    $0x3ffffff,%eax
   2c233:	jne    2acdc <JS_CallInternal+0x52cc>
   2c239:	testb  $0x8,0x10(%rdi)
   2c23d:	jne    2c760 <JS_CallInternal+0x6d50>
   2c243:	mov    0x30(%rdx),%rdi
   2c247:	test   %rdi,%rdi
   2c24a:	je     2dc64 <JS_CallInternal+0x8254>
   2c250:	mov    0x18(%rdi),%rdx
   2c254:	jmp    2acc0 <JS_CallInternal+0x52b0>
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


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SHAPE_ONLY.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002c76e <JS_CallInternal+0x6d5e>:
   2c76e:	sub    $0x8,%rsp
   2c772:	mov    -0x8(%rbx),%r9
   2c776:	mov    -0x10(%rbx),%r8
   2c77a:	mov    %r10,%rsi
   2c77d:	mov    -0x1e8(%rbp),%rdx
   2c784:	mov    -0x150(%rbp),%rax
   2c78b:	mov    %r13,%rdi
   2c78e:	mov    -0x1e0(%rbp),%r11
   2c795:	mov    %rdx,0x30(%rax)
   2c799:	push   $0x0
   2c79b:	mov    %r11,%rdx
   2c79e:	call   30e70 <JS_GetPropertyInternal>
   2c7a3:	pop    %r9
   2c7a5:	pop    %r10
   2c7a7:	mov    %rax,%rcx
   2c7aa:	mov    %rdx,%rax
   2c7ad:	cmp    $0x6,%edx
   2c7b0:	jne    2ad2b <JS_CallInternal+0x531b>
   2c7b6:	mov    -0x1e8(%rbp),%r12
   2c7bd:	jmp    26240 <JS_CallInternal+0x830>
   2c7c2:	mov    %rdi,%r9
   2c7c5:	mov    $0xffffffffffffffff,%rax
   2c7cc:	mov    -0x150(%rbp),%rdi
   2c7d3:	sub    $0x8,%rsp
   2c7d7:	mov    -0x10(%rbx),%r8
   2c7db:	mov    %rax,%rdx
   2c7de:	mov    %r10,-0x1e0(%rbp)
   2c7e5:	mov    %r9,%rax
   2c7e8:	mov    -0x8(%rbx),%r9
   2c7ec:	mov    %r10,0x30(%rdi)
   2c7f0:	mov    %rax,%rsi
   2c7f3:	mov    %r13,%rdi
   2c7f6:	push   $0x0
   2c7f8:	call   30e70 <JS_GetPropertyInternal>
   2c7fd:	pop    %rdi
   2c7fe:	pop    %r8
   2c800:	mov    %rdx,%rcx
   2c803:	cmp    $0x6,%edx
   2c806:	jne    287db <JS_CallInternal+0x2dcb>
   2c80c:	mov    -0x1e0(%rbp),%r12
   2c813:	jmp    26240 <JS_CallInternal+0x830>
   2c818:	mov    %rdi,%r9
   2c81b:	mov    $0xffffffffffffffff,%rax
   2c822:	mov    -0x150(%rbp),%rdx
   2c829:	sub    $0x8,%rsp
   2c82d:	mov    -0x10(%rbx),%r8
   2c831:	mov    %r13,%rdi
   2c834:	rex.WR
   2c835:	.byte 0x89


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SHAPE_ONLY.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002ad18 <JS_CallInternal+0x5308>:
   2ad18:	cmp    %rdi,%r10
   2ad1b:	je     2fc23 <JS_CallInternal+0xa213>
   2ad21:	cmp    %rdi,0x30(%r11)
   2ad25:	je     2fee1 <JS_CallInternal+0xa4d1>
   2ad2b:	mov    %rcx,(%rbx)
   2ad2e:	add    $0x5,%r12
   2ad32:	add    $0x10,%rbx
   2ad36:	mov    %rax,-0x8(%rbx)
   2ad3a:	movzbl -0x1(%r12),%eax
   2ad40:	mov    %rax,%r10
   2ad43:	mov    (%r14,%rax,8),%rax
   2ad47:	jmp    *%rax
   2ad49:	endbr64
   2ad4d:	mov    -0x150(%rbp),%rax
   2ad54:	mov    -0x20(%rbx),%rsi
   2ad58:	mov    %r13,%rdi
   2ad5b:	mov    -0x18(%rbx),%rdx
   2ad5f:	mov    -0x10(%rbx),%rcx
   2ad63:	mov    %r12,0x30(%rax)
   2ad67:	mov    -0x8(%rbx),%r8
   2ad6b:	mov    %rcx,-0x200(%rbp)
   2ad72:	mov    %r8,-0x1e8(%rbp)
   2ad79:	mov    %rsi,-0x210(%rbp)
   2ad80:	mov    %rdx,-0x1e0(%rbp)
   2ad87:	call   96350 <JS_IsInstanceOf>
   2ad8c:	test   %eax,%eax
   2ad8e:	js     26240 <JS_CallInternal+0x830>
   2ad94:	mov    -0x1e0(%rbp),%rdx
   2ad9b:	mov    -0x1e8(%rbp),%r8
   2ada2:	mov    -0x200(%rbp),%rcx
   2ada9:	cmp    $0xfffffff6,%edx
   2adac:	jbe    2adc6 <JS_CallInternal+0x53b6>
   2adae:	mov    -0x210(%rbp),%rsi
   2adb5:	mov    -0x4(%rsi),%edi
   2adb8:	sub    $0x1,%edi
   2adbb:	mov    %edi,-0x4(%rsi)
   2adbe:	test   %edi,%edi
   2adc0:	jle    2f661 <JS_CallInternal+0x9c51>
   2adc6:	cmp    $0xfffffff6,%r8d
   2adca:	jbe    2addd <JS_CallInternal+0x53cd>
   2adcc:	mov    -0x4(%rcx),%edx
   2adcf:	sub    $0x1,%edx
   2add2:	mov    %edx,-0x4(%rcx)
   2add5:	test   %edx,%edx
   2add7:	jle    2f690 <JS_CallInternal+0x9c80>
   2addd:	test   %eax,%eax
   2addf:	rex.W


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SHAPE_ONLY.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002fc23 <JS_CallInternal+0xa213>:
   2fc23:	cmpw   $0x1,0x12(%r10)
   2fc29:	jne    2ad2b <JS_CallInternal+0x531b>
   2fc2f:	testb  $0x8,0x10(%r10)
   2fc34:	jne    2ad2b <JS_CallInternal+0x531b>
   2fc3a:	cmpb   $0x0,0x10(%rdx)
   2fc3e:	je     2ad2b <JS_CallInternal+0x531b>
   2fc44:	mov    0x8(%r9),%rdi
   2fc48:	xor    %r11d,%r11d
   2fc4b:	sar    $0x4,%rsi
   2fc4f:	mov    (%r9),%r8
   2fc52:	addl   $0x1,-0x4(%rdx)
   2fc56:	mov    %rdx,(%r9)
   2fc59:	mov    %r11,0x8(%r9)
   2fc5d:	mov    %esi,0x10(%r9)
   2fc61:	test   %rdi,%rdi
   2fc64:	je     2fc9c <JS_CallInternal+0xa28c>
   2fc66:	mov    %rdi,%rsi
   2fc69:	mov    0x10(%r13),%rdi
   2fc6d:	mov    %r8,-0x200(%rbp)
   2fc74:	mov    %rcx,-0x1e8(%rbp)
   2fc7b:	mov    %rax,-0x1e0(%rbp)
   2fc82:	call   207f0 <js_free_shape>
   2fc87:	mov    -0x200(%rbp),%r8
   2fc8e:	mov    -0x1e8(%rbp),%rcx
   2fc95:	mov    -0x1e0(%rbp),%rax
   2fc9c:	test   %r8,%r8
   2fc9f:	je     2ad2b <JS_CallInternal+0x531b>
   2fca5:	mov    0x10(%r13),%rdi
   2fca9:	mov    %r8,%rsi
   2fcac:	mov    %rcx,-0x1e8(%rbp)
   2fcb3:	mov    %rax,-0x1e0(%rbp)
   2fcba:	call   207f0 <js_free_shape>
   2fcbf:	mov    -0x1e0(%rbp),%rax
   2fcc6:	mov    -0x1e8(%rbp),%rcx
   2fccd:	jmp    2ad2b <JS_CallInternal+0x531b>
   2fcd2:	nopw   0x0(%rax,%rax,1)
   2fcd8:	mov    0x10(%r13),%rdi
   2fcdc:	mov    %rsi,%rdx
   2fcdf:	mov    %rcx,%rsi
   2fce2:	mov    %eax,-0x1e0(%rbp)
   2fce8:	.byte 0xe8
   2fce9:	jae    2fcd9 <JS_CallInternal+0xa2c9>


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SHAPE_ONLY.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002fee1 <JS_CallInternal+0xa4d1>:
   2fee1:	cmpw   $0x1,-0x200(%rbp)
   2fee9:	jne    2ad2b <JS_CallInternal+0x531b>
   2feef:	testb  $0x8,0x10(%r10)
   2fef4:	jne    2ad2b <JS_CallInternal+0x531b>
   2fefa:	cmpw   $0x1,0x12(%rdi)
   2feff:	jne    2ad2b <JS_CallInternal+0x531b>
   2ff05:	testb  $0x8,0x10(%rdi)
   2ff09:	jne    2ad2b <JS_CallInternal+0x531b>
   2ff0f:	cmpb   $0x0,0x10(%r11)
   2ff14:	je     2ad2b <JS_CallInternal+0x531b>
   2ff1a:	cmpb   $0x0,0x10(%rdx)
   2ff1e:	je     2ad2b <JS_CallInternal+0x531b>
   2ff24:	mov    (%r9),%r8
   2ff27:	mov    0x8(%r9),%rdi
   2ff2b:	movq   %rdx,%xmm5
   2ff30:	movq   %r11,%xmm0
   2ff35:	addl   $0x1,-0x4(%r11)
   2ff3a:	punpcklqdq %xmm5,%xmm0
   2ff3e:	addl   $0x1,-0x4(%rdx)
   2ff42:	mov    %rsi,%rdx
   2ff45:	sar    $0x4,%rdx
   2ff49:	movups %xmm0,(%r9)
   2ff4d:	mov    %edx,0x10(%r9)
   2ff51:	test   %rdi,%rdi
   2ff54:	jne    2fc66 <JS_CallInternal+0xa256>
   2ff5a:	jmp    2fc9c <JS_CallInternal+0xa28c>
   2ff5f:	mov    -0x1e0(%rbp),%rbx
   2ff66:	jmp    26240 <JS_CallInternal+0x830>
   2ff6b:	lea    -0x2(%rcx),%eax
   2ff6e:	cmp    $0x1,%eax
   2ff71:	jbe    30a62 <JS_CallInternal+0xb052>
   2ff77:	cmp    $0xffffffff,%ecx
   2ff7a:	jne    2d81e <JS_CallInternal+0x7e0e>
   2ff80:	movzbl 0x11(%r9),%r8d
   2ff85:	mov    %rcx,%rdx
   2ff88:	mov    %r9,%rsi
   2ff8b:	mov    %r13,%rdi
   2ff8e:	and    $0x1,%r8d
   2ff92:	mov    %r8d,-0x1e0(%rbp)
   2ff99:	call   1ece0 <JS_FreeValue>
   2ff9e:	mov    -0x1e0(%rbp),%r8d
   2ffa5:	.byte 0xe9
   2ffa6:	lods   (%rsi),%al
   2ffa7:	jl     2ffa8 <JS_CallInternal+0xa598>
