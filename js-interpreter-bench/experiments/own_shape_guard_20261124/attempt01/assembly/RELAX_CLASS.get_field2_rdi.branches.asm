
/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/RELAX_CLASS.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002ed37 <JS_CallInternal+0x9327>:
   2ed37:	mov    0x14(%r9),%ecx
   2ed3b:	jmp    2c76e <JS_CallInternal+0x6d5e>
   2ed40:	mov    0x10(%r13),%rdi
   2ed44:	mov    %rax,%rdx
   2ed47:	mov    %rcx,%rsi
   2ed4a:	mov    %r11,-0x200(%rbp)
   2ed51:	call   1eb60 <__JS_FreeValueRT>
   2ed56:	mov    -0x200(%rbp),%r11
   2ed5d:	jmp    2b9b1 <JS_CallInternal+0x5fa1>
   2ed62:	mov    0x10(%r13),%rdi
   2ed66:	mov    %rax,%rdx
   2ed69:	mov    %rcx,%rsi
   2ed6c:	mov    %r10,-0x200(%rbp)
   2ed73:	call   1eb60 <__JS_FreeValueRT>
   2ed78:	mov    -0x200(%rbp),%r10
   2ed7f:	jmp    2bc94 <JS_CallInternal+0x6284>
   2ed84:	lea    0xab7fc(%rip),%rsi        # da587 <_IO_stdin_used+0x587>
   2ed8b:	mov    %r13,%rdi
   2ed8e:	xor    %eax,%eax
   2ed90:	mov    %rcx,-0x1e8(%rbp)
   2ed97:	call   34e50 <JS_ThrowTypeError>
   2ed9c:	mov    -0x1e8(%rbp),%rcx
   2eda3:	mov    %rax,%r8
   2eda6:	mov    %rdx,%rax
   2eda9:	mov    -0x10(%rbx),%rdx
   2edad:	mov    0x8(%rcx),%r10
   2edb1:	mov    %eax,%r9d
   2edb4:	jmp    282c2 <JS_CallInternal+0x28b2>
   2edb9:	mov    (%rsi),%eax
   2edbb:	and    $0x3ffffff,%eax
   2edc0:	jne    2828f <JS_CallInternal+0x287f>
   2edc6:	mov    -0x228(%rbp),%rdi
   2edcd:	mov    %r8d,%edx
   2edd0:	lea    -0x80(%rbp),%rsi
   2edd4:	mov    %rcx,-0x1e8(%rbp)
   2eddb:	call   18cd0 <JS_AtomGetStrRT.constprop.0>
   2ede0:	lea    0xaf039(%rip),%rsi        # dde20 <_IO_stdin_used+0x3e20>
   2ede7:	mov    %r13,%rdi
   2edea:	mov    %rax,%rdx
   2eded:	xor    %eax,%eax
   2edef:	call   34e50 <JS_ThrowTypeError>
   2edf4:	mov    -0x1e8(%rbp),%rcx
   2edfb:	mov    0x8(%rcx),%r10


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/RELAX_CLASS.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002d653 <JS_CallInternal+0x7c43>:
   2d653:	testb  $0x8,0x10(%r10)
   2d658:	jne    2acb6 <JS_CallInternal+0x52a6>
   2d65e:	mov    0x8(%r9),%rcx
   2d662:	mov    (%r9),%rdx
   2d665:	test   %rcx,%rcx
   2d668:	je     2fc48 <JS_CallInternal+0xa238>
   2d66e:	mov    0x30(%r11),%rax
   2d672:	cmp    %r11,%rdx
   2d675:	jne    2acb6 <JS_CallInternal+0x52a6>
   2d67b:	test   %rax,%rax
   2d67e:	je     2acb6 <JS_CallInternal+0x52a6>
   2d684:	cmpw   $0x1,0x12(%rax)
   2d689:	jne    2acb6 <JS_CallInternal+0x52a6>
   2d68f:	testb  $0x8,0x10(%rax)
   2d693:	jne    2acb6 <JS_CallInternal+0x52a6>
   2d699:	cmp    0x18(%rax),%rcx
   2d69d:	jne    2acb6 <JS_CallInternal+0x52a6>
   2d6a3:	mov    0x10(%r9),%edx
   2d6a7:	shl    $0x4,%rdx
   2d6ab:	add    0x20(%rax),%rdx
   2d6af:	mov    %rdx,%rax
   2d6b2:	mov    (%rdx),%rdx
   2d6b5:	mov    0x8(%rax),%rax
   2d6b9:	cmp    $0xfffffff6,%eax
   2d6bc:	jbe    2d6c2 <JS_CallInternal+0x7cb2>
   2d6be:	addl   $0x1,-0x4(%rdx)
   2d6c2:	mov    %rdx,%rcx
   2d6c5:	jmp    2ad2b <JS_CallInternal+0x531b>
   2d6ca:	nopw   0x0(%rax,%rax,1)
   2d6d0:	mov    0x10(%r13),%rdi
   2d6d4:	mov    %r9d,%eax
   2d6d7:	mov    0x448(%rdi),%rdx
   2d6de:	mov    (%rdx,%rax,8),%rsi
   2d6e2:	mov    -0x4(%rsi),%eax
   2d6e5:	sub    $0x1,%eax
   2d6e8:	mov    %eax,-0x4(%rsi)
   2d6eb:	test   %eax,%eax
   2d6ed:	jg     2a54f <JS_CallInternal+0x4b3f>
   2d6f3:	mov    %ecx,-0x220(%rbp)
   2d6f9:	call   16c60 <JS_FreeAtomStruct>
   2d6fe:	mov    -0x220(%rbp),%ecx
   2d704:	jmp    2a54f <JS_CallInternal+0x4b3f>
   2d709:	cmp    $0xfffffffa,%ecx
   2d70c:	jge    2d713 <JS_CallInternal+0x7d03>
   2d70e:	cmp    $0xfffffff8,%ecx
   2d711:	jge    2d76b <JS_CallInternal+0x7d5b>
   2d713:	mov    -0x10(%rbx),%rsi
   2d717:	mov    -0x8(%rbx),%rdx


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/RELAX_CLASS.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002c239 <JS_CallInternal+0x6829>:
   2c239:	testb  $0x8,0x10(%rdi)
   2c23d:	jne    2c760 <JS_CallInternal+0x6d50>
   2c243:	mov    0x30(%rdx),%rdi
   2c247:	test   %rdi,%rdi
   2c24a:	je     2dbe8 <JS_CallInternal+0x81d8>
   2c250:	mov    0x18(%rdi),%rdx
   2c254:	jmp    2acc0 <JS_CallInternal+0x52b0>
   2c259:	mov    (%rsi),%edx
   2c25b:	and    $0x3ffffff,%edx
   2c261:	jne    2abac <JS_CallInternal+0x519c>
   2c267:	testb  $0x8,0x10(%r8)
   2c26c:	jne    2c91d <JS_CallInternal+0x6f0d>
   2c272:	mov    0x30(%rdi),%r8
   2c276:	test   %r8,%r8
   2c279:	je     2dd7f <JS_CallInternal+0x836f>
   2c27f:	mov    0x18(%r8),%rdi
   2c283:	jmp    2ab90 <JS_CallInternal+0x5180>
   2c288:	mov    -0x170(%rbp),%esi
   2c28e:	cmp    %esi,%r8d
   2c291:	mov    %esi,%r12d
   2c294:	cmovle %r8d,%r12d
   2c298:	test   %r12d,%r12d
   2c29b:	jle    2d9e4 <JS_CallInternal+0x7fd4>
   2c2a1:	mov    %eax,-0x150(%rbp)
   2c2a7:	movslq %r12d,%r13
   2c2aa:	mov    -0x180(%rbp),%r14
   2c2b1:	xor    %esi,%esi
   2c2b3:	shl    $0x4,%r13
   2c2b7:	nopw   0x0(%rax,%rax,1)
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


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/RELAX_CLASS.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002c22c <JS_CallInternal+0x681c>:
   2c22c:	mov    (%rsi),%eax
   2c22e:	and    $0x3ffffff,%eax
   2c233:	jne    2acdc <JS_CallInternal+0x52cc>
   2c239:	testb  $0x8,0x10(%rdi)
   2c23d:	jne    2c760 <JS_CallInternal+0x6d50>
   2c243:	mov    0x30(%rdx),%rdi
   2c247:	test   %rdi,%rdi
   2c24a:	je     2dbe8 <JS_CallInternal+0x81d8>
   2c250:	mov    0x18(%rdi),%rdx
   2c254:	jmp    2acc0 <JS_CallInternal+0x52b0>
   2c259:	mov    (%rsi),%edx
   2c25b:	and    $0x3ffffff,%edx
   2c261:	jne    2abac <JS_CallInternal+0x519c>
   2c267:	testb  $0x8,0x10(%r8)
   2c26c:	jne    2c91d <JS_CallInternal+0x6f0d>
   2c272:	mov    0x30(%rdi),%r8
   2c276:	test   %r8,%r8
   2c279:	je     2dd7f <JS_CallInternal+0x836f>
   2c27f:	mov    0x18(%r8),%rdi
   2c283:	jmp    2ab90 <JS_CallInternal+0x5180>
   2c288:	mov    -0x170(%rbp),%esi
   2c28e:	cmp    %esi,%r8d
   2c291:	mov    %esi,%r12d
   2c294:	cmovle %r8d,%r12d
   2c298:	test   %r12d,%r12d
   2c29b:	jle    2d9e4 <JS_CallInternal+0x7fd4>
   2c2a1:	mov    %eax,-0x150(%rbp)
   2c2a7:	movslq %r12d,%r13
   2c2aa:	mov    -0x180(%rbp),%r14
   2c2b1:	xor    %esi,%esi
   2c2b3:	shl    $0x4,%r13
   2c2b7:	nopw   0x0(%rax,%rax,1)
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


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/RELAX_CLASS.release/qjs:     file format elf64-x86-64


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
   2c79e:	call   30eb0 <JS_GetPropertyInternal>
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
   2c7f8:	call   30eb0 <JS_GetPropertyInternal>
   2c7fd:	pop    %rdi
   2c7fe:	pop    %r8
   2c800:	mov    %rdx,%rcx
   2c803:	cmp    $0x6,%edx
   2c806:	jne    287eb <JS_CallInternal+0x2ddb>
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


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/RELAX_CLASS.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002ad18 <JS_CallInternal+0x5308>:
   2ad18:	cmp    %rdi,%r10
   2ad1b:	je     2f98f <JS_CallInternal+0x9f7f>
   2ad21:	cmp    %rdi,0x30(%r11)
   2ad25:	je     3035f <JS_CallInternal+0xa94f>
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
   2ad87:	call   96390 <JS_IsInstanceOf>
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
   2adc0:	jle    2f679 <JS_CallInternal+0x9c69>
   2adc6:	cmp    $0xfffffff6,%r8d
   2adca:	jbe    2addd <JS_CallInternal+0x53cd>
   2adcc:	mov    -0x4(%rcx),%edx
   2adcf:	sub    $0x1,%edx
   2add2:	mov    %edx,-0x4(%rcx)
   2add5:	test   %edx,%edx
   2add7:	jle    2f6a8 <JS_CallInternal+0x9c98>
   2addd:	test   %eax,%eax
   2addf:	rex.W


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/RELAX_CLASS.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002f98f <JS_CallInternal+0x9f7f>:
   2f98f:	cmpw   $0x1,0x12(%r10)
   2f995:	jne    2ad2b <JS_CallInternal+0x531b>
   2f99b:	testb  $0x8,0x10(%r10)
   2f9a0:	jne    2ad2b <JS_CallInternal+0x531b>
   2f9a6:	cmpb   $0x0,0x10(%rdx)
   2f9aa:	je     2ad2b <JS_CallInternal+0x531b>
   2f9b0:	mov    0x8(%r9),%rdi
   2f9b4:	xor    %r11d,%r11d
   2f9b7:	sar    $0x4,%rsi
   2f9bb:	mov    (%r9),%r8
   2f9be:	addl   $0x1,-0x4(%rdx)
   2f9c2:	mov    %rdx,(%r9)
   2f9c5:	mov    %r11,0x8(%r9)
   2f9c9:	mov    %esi,0x10(%r9)
   2f9cd:	test   %rdi,%rdi
   2f9d0:	je     2fa08 <JS_CallInternal+0x9ff8>
   2f9d2:	mov    %rdi,%rsi
   2f9d5:	mov    0x10(%r13),%rdi
   2f9d9:	mov    %r8,-0x200(%rbp)
   2f9e0:	mov    %rcx,-0x1e8(%rbp)
   2f9e7:	mov    %rax,-0x1e0(%rbp)
   2f9ee:	call   207f0 <js_free_shape>
   2f9f3:	mov    -0x200(%rbp),%r8
   2f9fa:	mov    -0x1e8(%rbp),%rcx
   2fa01:	mov    -0x1e0(%rbp),%rax
   2fa08:	test   %r8,%r8
   2fa0b:	je     2ad2b <JS_CallInternal+0x531b>
   2fa11:	mov    0x10(%r13),%rdi
   2fa15:	mov    %r8,%rsi
   2fa18:	mov    %rcx,-0x1e8(%rbp)
   2fa1f:	mov    %rax,-0x1e0(%rbp)
   2fa26:	call   207f0 <js_free_shape>
   2fa2b:	mov    -0x1e0(%rbp),%rax
   2fa32:	mov    -0x1e8(%rbp),%rcx
   2fa39:	jmp    2ad2b <JS_CallInternal+0x531b>
   2fa3e:	mov    %rsi,%rdx
   2fa41:	mov    %rdi,%rsi
   2fa44:	mov    0x10(%r13),%rdi
   2fa48:	mov    %rax,-0x220(%rbp)
   2fa4f:	mov    %rcx,-0x210(%rbp)
   2fa56:	rex.WR


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/RELAX_CLASS.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000003035f <JS_CallInternal+0xa94f>:
   3035f:	cmpw   $0x1,-0x200(%rbp)
   30367:	jne    2ad2b <JS_CallInternal+0x531b>
   3036d:	testb  $0x8,0x10(%r10)
   30372:	jne    2ad2b <JS_CallInternal+0x531b>
   30378:	cmpw   $0x1,0x12(%rdi)
   3037d:	jne    2ad2b <JS_CallInternal+0x531b>
   30383:	testb  $0x8,0x10(%rdi)
   30387:	jne    2ad2b <JS_CallInternal+0x531b>
   3038d:	cmpb   $0x0,0x10(%r11)
   30392:	je     2ad2b <JS_CallInternal+0x531b>
   30398:	cmpb   $0x0,0x10(%rdx)
   3039c:	je     2ad2b <JS_CallInternal+0x531b>
   303a2:	mov    (%r9),%r8
   303a5:	mov    0x8(%r9),%rdi
   303a9:	movq   %rdx,%xmm5
   303ae:	movq   %r11,%xmm0
   303b3:	addl   $0x1,-0x4(%r11)
   303b8:	punpcklqdq %xmm5,%xmm0
   303bc:	addl   $0x1,-0x4(%rdx)
   303c0:	mov    %rsi,%rdx
   303c3:	sar    $0x4,%rdx
   303c7:	movups %xmm0,(%r9)
   303cb:	mov    %edx,0x10(%r9)
   303cf:	test   %rdi,%rdi
   303d2:	jne    2f9d2 <JS_CallInternal+0x9fc2>
   303d8:	jmp    2fa08 <JS_CallInternal+0x9ff8>
   303dd:	lea    0xaa107(%rip),%rsi        # da4eb <_IO_stdin_used+0x4eb>
   303e4:	mov    %r13,%rdi
   303e7:	call   34e50 <JS_ThrowTypeError>
   303ec:	jmp    26240 <JS_CallInternal+0x830>
   303f1:	mov    0x10(%r13),%rdi
   303f5:	mov    %rax,%rdx
   303f8:	mov    %rcx,%rsi
   303fb:	call   1eb60 <__JS_FreeValueRT>
   30400:	jmp    2db8d <JS_CallInternal+0x817d>
   30405:	lea    0xaa17b(%rip),%rsi        # da587 <_IO_stdin_used+0x587>
   3040c:	mov    %r13,%rdi
   3040f:	xor    %eax,%eax
   30411:	call   34e50 <JS_ThrowTypeError>
   30416:	jmp    26240 <JS_CallInternal+0x830>
   3041b:	mov    %r8,%r11
   3041e:	mov    %rdx,%r9
   30421:	xor    %r8d,%r8d
   30424:	mov    %r10,%rdx
