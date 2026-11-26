
/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SPARSE.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002cf70 <JS_CallInternal+0x7560>:
   2cf70:	mov    0x1(%r12),%ecx
   2cf75:	lea    0x1(%r12,%rcx,1),%rcx
   2cf7a:	cmpw   $0x1,0x12(%rax)
   2cf7f:	jne    291d9 <JS_CallInternal+0x37c9>
   2cf85:	testb  $0x8,0x10(%rax)
   2cf89:	jne    291d9 <JS_CallInternal+0x37c9>
   2cf8f:	mov    0x18(%rax),%rdi
   2cf93:	cmp    %rdi,(%rcx)
   2cf96:	jne    291d9 <JS_CallInternal+0x37c9>
   2cf9c:	mov    0x10(%rcx),%edx
   2cf9f:	lea    0x10(%rbx),%rcx
   2cfa3:	shl    $0x4,%rdx
   2cfa7:	add    0x20(%rax),%rdx
   2cfab:	mov    %rdx,%rax
   2cfae:	mov    (%rdx),%rdx
   2cfb1:	mov    0x8(%rax),%rax
   2cfb5:	cmp    $0xfffffff6,%eax
   2cfb8:	jbe    2cfbe <JS_CallInternal+0x75ae>
   2cfba:	addl   $0x1,-0x4(%rdx)
   2cfbe:	mov    %rax,0x8(%rbx)
   2cfc2:	lea    0x5(%r12),%rax
   2cfc7:	mov    %rdx,(%rbx)
   2cfca:	lea    0x1(%rax),%r12
   2cfce:	movzbl (%rax),%eax
   2cfd1:	mov    %rcx,%rbx
   2cfd4:	mov    %rax,%r10
   2cfd7:	jmp    *(%r14,%rax,8)
   2cfdb:	nopl   0x0(%rax,%rax,1)
   2cfe0:	mov    0x1(%r12),%ecx
   2cfe5:	lea    0x1(%r12,%rcx,1),%rcx
   2cfea:	cmpw   $0x1,0x12(%rax)
   2cfef:	jne    28b0e <JS_CallInternal+0x30fe>
   2cff5:	testb  $0x8,0x10(%rax)
   2cff9:	jne    28b0e <JS_CallInternal+0x30fe>
   2cfff:	mov    0x18(%rax),%rdi
   2d003:	cmp    %rdi,(%rcx)
   2d006:	jne    28b0e <JS_CallInternal+0x30fe>
   2d00c:	mov    0x10(%rcx),%edx
   2d00f:	lea    0x10(%rbx),%rcx
   2d013:	shl    $0x4,%rdx
   2d017:	add    0x20(%rax),%rdx
   2d01b:	mov    %rdx,%rax
   2d01e:	mov    (%rdx),%rdx
   2d021:	mov    0x8(%rax),%rax
   2d025:	cmp    $0xfffffff6,%eax
   2d028:	jbe    2d02e <JS_CallInternal+0x761e>
   2d02a:	addl   $0x1,-0x4(%rdx)
   2d02e:	mov    %rax,0x8(%rbx)
   2d032:	lea    0x5(%r12),%rax
   2d037:	rex.W


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SPARSE.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

00000000000291e6 <JS_CallInternal+0x37d6>:
   291e6:	mov    %rax,(%rbx)
   291e9:	mov    %r12,%rax
   291ec:	lea    0x1(%r12),%r12
   291f1:	mov    %rdx,0x8(%rbx)
   291f5:	movzbl (%rax),%eax
   291f8:	mov    %rcx,%rbx
   291fb:	mov    %rax,%r10
   291fe:	jmp    *(%r14,%rax,8)
   29202:	endbr64
   29206:	mov    -0x190(%rbp),%rax
   2920d:	lea    0x10(%rbx),%rcx
   29211:	mov    (%rax),%rdx
   29214:	mov    0x8(%rax),%rax
   29218:	cmp    $0xfffffff6,%eax
   2921b:	jbe    29221 <JS_CallInternal+0x3811>
   2921d:	addl   $0x1,-0x4(%rdx)
   29221:	mov    %rdx,(%rbx)
   29224:	add    $0x1,%r12
   29228:	mov    %rax,0x8(%rbx)
   2922c:	movzbl -0x1(%r12),%eax
   29232:	mov    %rcx,%rbx
   29235:	mov    %rax,%r10
   29238:	mov    (%r14,%rax,8),%rax
   2923c:	jmp    *%rax
   2923e:	endbr64
   29242:	mov    -0x8(%rbx),%rdx
   29246:	mov    -0x10(%rbx),%rcx
   2924a:	cmp    $0xfffffff6,%edx
   2924d:	jbe    29253 <JS_CallInternal+0x3843>
   2924f:	addl   $0x1,-0x4(%rcx)
   29253:	mov    -0x178(%rbp),%rdi
   2925a:	mov    0x38(%rdi),%rax
   2925e:	mov    0x30(%rdi),%rsi
   29262:	mov    %rdx,0x38(%rdi)
   29266:	mov    %rcx,0x30(%rdi)
   2926a:	cmp    $0xfffffff6,%eax
   2926d:	jbe    29280 <JS_CallInternal+0x3870>
   2926f:	mov    -0x4(%rsi),%ecx
   29272:	lea    -0x1(%rcx),%edx
   29275:	mov    %edx,-0x4(%rsi)
   29278:	test   %edx,%edx
   2927a:	jle    2e573 <JS_CallInternal+0x8b63>
   29280:	movzbl (%r12),%eax
   29285:	add    $0x1,%r12
   29289:	mov    %rax,%r10
   2928c:	mov    (%r14,%rax,8),%rax
   29290:	jmp    *%rax
   29292:	endbr64
   29296:	mov    -0x8(%rbx),%rcx
   2929a:	mov    -0x10(%rbx),%rsi
   2929e:	cmp    $0xfffffff6,%ecx
   292a1:	jbe    292a7 <JS_CallInternal+0x3897>
   292a3:	addl   $0x1,-0x4(%rsi)
   292a7:	mov    -0x188(%rbp),%rax


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SPARSE.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

0000000000029221 <JS_CallInternal+0x3811>:
   29221:	mov    %rdx,(%rbx)
   29224:	add    $0x1,%r12
   29228:	mov    %rax,0x8(%rbx)
   2922c:	movzbl -0x1(%r12),%eax
   29232:	mov    %rcx,%rbx
   29235:	mov    %rax,%r10
   29238:	mov    (%r14,%rax,8),%rax
   2923c:	jmp    *%rax
   2923e:	endbr64
   29242:	mov    -0x8(%rbx),%rdx
   29246:	mov    -0x10(%rbx),%rcx
   2924a:	cmp    $0xfffffff6,%edx
   2924d:	jbe    29253 <JS_CallInternal+0x3843>
   2924f:	addl   $0x1,-0x4(%rcx)
   29253:	mov    -0x178(%rbp),%rdi
   2925a:	mov    0x38(%rdi),%rax
   2925e:	mov    0x30(%rdi),%rsi
   29262:	mov    %rdx,0x38(%rdi)
   29266:	mov    %rcx,0x30(%rdi)
   2926a:	cmp    $0xfffffff6,%eax
   2926d:	jbe    29280 <JS_CallInternal+0x3870>
   2926f:	mov    -0x4(%rsi),%ecx
   29272:	lea    -0x1(%rcx),%edx
   29275:	mov    %edx,-0x4(%rsi)
   29278:	test   %edx,%edx
   2927a:	jle    2e573 <JS_CallInternal+0x8b63>
   29280:	movzbl (%r12),%eax
   29285:	add    $0x1,%r12
   29289:	mov    %rax,%r10
   2928c:	mov    (%r14,%rax,8),%rax
   29290:	jmp    *%rax
   29292:	endbr64
   29296:	mov    -0x8(%rbx),%rcx
   2929a:	mov    -0x10(%rbx),%rsi
   2929e:	cmp    $0xfffffff6,%ecx
   292a1:	jbe    292a7 <JS_CallInternal+0x3897>
   292a3:	addl   $0x1,-0x4(%rsi)
   292a7:	mov    -0x188(%rbp),%rax
   292ae:	mov    0x8(%rax),%rax
   292b2:	mov    0x18(%rax),%rax
   292b6:	mov    0x8(%rax),%rdx
   292ba:	mov    (%rax),%rdi
   292bd:	mov    %rcx,0x8(%rax)
   292c1:	mov    %rsi,(%rax)
   292c4:	cmp    $0xfffffff6,%edx
   292c7:	jbe    292da <JS_CallInternal+0x38ca>
   292c9:	mov    -0x4(%rdi),%eax
   292cc:	sub    $0x1,%eax
   292cf:	mov    %eax,-0x4(%rdi)
   292d2:	test   %eax,%eax
   292d4:	jle    2e562 <JS_CallInternal+0x8b52>
   292da:	movzbl (%r12),%eax
   292df:	add    $0x1,%r12
   292e3:	mov    %rax,%r10
   292e6:	rex.WB
   292e7:	.byte 0x8b
   292e8:	.byte 0x4


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SPARSE.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

0000000000029253 <JS_CallInternal+0x3843>:
   29253:	mov    -0x178(%rbp),%rdi
   2925a:	mov    0x38(%rdi),%rax
   2925e:	mov    0x30(%rdi),%rsi
   29262:	mov    %rdx,0x38(%rdi)
   29266:	mov    %rcx,0x30(%rdi)
   2926a:	cmp    $0xfffffff6,%eax
   2926d:	jbe    29280 <JS_CallInternal+0x3870>
   2926f:	mov    -0x4(%rsi),%ecx
   29272:	lea    -0x1(%rcx),%edx
   29275:	mov    %edx,-0x4(%rsi)
   29278:	test   %edx,%edx
   2927a:	jle    2e573 <JS_CallInternal+0x8b63>
   29280:	movzbl (%r12),%eax
   29285:	add    $0x1,%r12
   29289:	mov    %rax,%r10
   2928c:	mov    (%r14,%rax,8),%rax
   29290:	jmp    *%rax
   29292:	endbr64
   29296:	mov    -0x8(%rbx),%rcx
   2929a:	mov    -0x10(%rbx),%rsi
   2929e:	cmp    $0xfffffff6,%ecx
   292a1:	jbe    292a7 <JS_CallInternal+0x3897>
   292a3:	addl   $0x1,-0x4(%rsi)
   292a7:	mov    -0x188(%rbp),%rax
   292ae:	mov    0x8(%rax),%rax
   292b2:	mov    0x18(%rax),%rax
   292b6:	mov    0x8(%rax),%rdx
   292ba:	mov    (%rax),%rdi
   292bd:	mov    %rcx,0x8(%rax)
   292c1:	mov    %rsi,(%rax)
   292c4:	cmp    $0xfffffff6,%edx
   292c7:	jbe    292da <JS_CallInternal+0x38ca>
   292c9:	mov    -0x4(%rdi),%eax
   292cc:	sub    $0x1,%eax
   292cf:	mov    %eax,-0x4(%rdi)
   292d2:	test   %eax,%eax
   292d4:	jle    2e562 <JS_CallInternal+0x8b52>
   292da:	movzbl (%r12),%eax
   292df:	add    $0x1,%r12
   292e3:	mov    %rax,%r10
   292e6:	mov    (%r14,%rax,8),%rax
   292ea:	jmp    *%rax
   292ec:	endbr64
   292f0:	mov    -0x8(%rbx),%rcx
   292f4:	mov    -0x10(%rbx),%rsi
   292f8:	cmp    $0xfffffff6,%ecx
   292fb:	jbe    29301 <JS_CallInternal+0x38f1>
   292fd:	addl   $0x1,-0x4(%rsi)
   29301:	mov    -0x188(%rbp),%rax
   29308:	mov    (%rax),%rax
   2930b:	mov    0x18(%rax),%rax
   2930f:	mov    0x8(%rax),%rdx
   29313:	mov    (%rax),%rdi
   29316:	mov    %rcx,0x8(%rax)
   2931a:	rex.W


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SPARSE.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

0000000000029280 <JS_CallInternal+0x3870>:
   29280:	movzbl (%r12),%eax
   29285:	add    $0x1,%r12
   29289:	mov    %rax,%r10
   2928c:	mov    (%r14,%rax,8),%rax
   29290:	jmp    *%rax
   29292:	endbr64
   29296:	mov    -0x8(%rbx),%rcx
   2929a:	mov    -0x10(%rbx),%rsi
   2929e:	cmp    $0xfffffff6,%ecx
   292a1:	jbe    292a7 <JS_CallInternal+0x3897>
   292a3:	addl   $0x1,-0x4(%rsi)
   292a7:	mov    -0x188(%rbp),%rax
   292ae:	mov    0x8(%rax),%rax
   292b2:	mov    0x18(%rax),%rax
   292b6:	mov    0x8(%rax),%rdx
   292ba:	mov    (%rax),%rdi
   292bd:	mov    %rcx,0x8(%rax)
   292c1:	mov    %rsi,(%rax)
   292c4:	cmp    $0xfffffff6,%edx
   292c7:	jbe    292da <JS_CallInternal+0x38ca>
   292c9:	mov    -0x4(%rdi),%eax
   292cc:	sub    $0x1,%eax
   292cf:	mov    %eax,-0x4(%rdi)
   292d2:	test   %eax,%eax
   292d4:	jle    2e562 <JS_CallInternal+0x8b52>
   292da:	movzbl (%r12),%eax
   292df:	add    $0x1,%r12
   292e3:	mov    %rax,%r10
   292e6:	mov    (%r14,%rax,8),%rax
   292ea:	jmp    *%rax
   292ec:	endbr64
   292f0:	mov    -0x8(%rbx),%rcx
   292f4:	mov    -0x10(%rbx),%rsi
   292f8:	cmp    $0xfffffff6,%ecx
   292fb:	jbe    29301 <JS_CallInternal+0x38f1>
   292fd:	addl   $0x1,-0x4(%rsi)
   29301:	mov    -0x188(%rbp),%rax
   29308:	mov    (%rax),%rax
   2930b:	mov    0x18(%rax),%rax
   2930f:	mov    0x8(%rax),%rdx
   29313:	mov    (%rax),%rdi
   29316:	mov    %rcx,0x8(%rax)
   2931a:	mov    %rsi,(%rax)
   2931d:	cmp    $0xfffffff6,%edx
   29320:	jbe    29333 <JS_CallInternal+0x3923>
   29322:	mov    -0x4(%rdi),%eax
   29325:	sub    $0x1,%eax
   29328:	mov    %eax,-0x4(%rdi)
   2932b:	test   %eax,%eax
   2932d:	jle    2e551 <JS_CallInternal+0x8b41>
   29333:	movzbl (%r12),%eax
   29338:	add    $0x1,%r12
   2933c:	mov    %rax,%r10
   2933f:	mov    (%r14,%rax,8),%rax
   29343:	jmp    *%rax
   29345:	repz
   29346:	.byte 0xf
   29347:	(bad)


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SPARSE.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002e573 <JS_CallInternal+0x8b63>:
   2e573:	mov    0x10(%r13),%rdi
   2e577:	mov    %rax,%rdx
   2e57a:	call   1eb60 <__JS_FreeValueRT>
   2e57f:	jmp    29280 <JS_CallInternal+0x3870>
   2e584:	mov    %rsi,%rdx
   2e587:	mov    %rdi,%rsi
   2e58a:	mov    0x10(%r13),%rdi
   2e58e:	mov    %rcx,-0x200(%rbp)
   2e595:	mov    %rax,-0x1e8(%rbp)
   2e59c:	mov    %r8,-0x1e0(%rbp)
   2e5a3:	call   1eb60 <__JS_FreeValueRT>
   2e5a8:	mov    -0x200(%rbp),%rcx
   2e5af:	mov    -0x1e8(%rbp),%rax
   2e5b6:	mov    -0x1e0(%rbp),%r8
   2e5bd:	jmp    29afc <JS_CallInternal+0x40ec>
   2e5c2:	mov    %rsi,%rdx
   2e5c5:	mov    %rdi,%rsi
   2e5c8:	mov    0x10(%r13),%rdi
   2e5cc:	mov    %rcx,-0x200(%rbp)
   2e5d3:	mov    %rax,-0x1e8(%rbp)
   2e5da:	mov    %r8,-0x1e0(%rbp)
   2e5e1:	call   1eb60 <__JS_FreeValueRT>
   2e5e6:	mov    -0x200(%rbp),%rcx
   2e5ed:	mov    -0x1e8(%rbp),%rax
   2e5f4:	mov    -0x1e0(%rbp),%r8
   2e5fb:	jmp    29b19 <JS_CallInternal+0x4109>
   2e600:	mov    0x10(%r13),%rdi
   2e604:	mov    %rax,%rdx
   2e607:	mov    %rcx,%rsi
   2e60a:	call   1eb60 <__JS_FreeValueRT>
   2e60f:	jmp    2a25d <JS_CallInternal+0x484d>
   2e614:	mov    0x10(%r13),%rdi
   2e618:	mov    %rax,%rdx
   2e61b:	mov    %rcx,%rsi
   2e61e:	call   1eb60 <__JS_FreeValueRT>
   2e623:	jmp    2a2c4 <JS_CallInternal+0x48b4>
   2e628:	xor    %ecx,%ecx
   2e62a:	xchg   %rax,%rdx
   2e62c:	mov    0x10(%r13),%rdi
   2e630:	mov    %ecx,-0x1e0(%rbp)
   2e636:	mov    %rax,%rsi
   2e639:	.byte 0xe8
   2e63a:	.byte 0x22


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SPARSE.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

00000000000292a7 <JS_CallInternal+0x3897>:
   292a7:	mov    -0x188(%rbp),%rax
   292ae:	mov    0x8(%rax),%rax
   292b2:	mov    0x18(%rax),%rax
   292b6:	mov    0x8(%rax),%rdx
   292ba:	mov    (%rax),%rdi
   292bd:	mov    %rcx,0x8(%rax)
   292c1:	mov    %rsi,(%rax)
   292c4:	cmp    $0xfffffff6,%edx
   292c7:	jbe    292da <JS_CallInternal+0x38ca>
   292c9:	mov    -0x4(%rdi),%eax
   292cc:	sub    $0x1,%eax
   292cf:	mov    %eax,-0x4(%rdi)
   292d2:	test   %eax,%eax
   292d4:	jle    2e562 <JS_CallInternal+0x8b52>
   292da:	movzbl (%r12),%eax
   292df:	add    $0x1,%r12
   292e3:	mov    %rax,%r10
   292e6:	mov    (%r14,%rax,8),%rax
   292ea:	jmp    *%rax
   292ec:	endbr64
   292f0:	mov    -0x8(%rbx),%rcx
   292f4:	mov    -0x10(%rbx),%rsi
   292f8:	cmp    $0xfffffff6,%ecx
   292fb:	jbe    29301 <JS_CallInternal+0x38f1>
   292fd:	addl   $0x1,-0x4(%rsi)
   29301:	mov    -0x188(%rbp),%rax
   29308:	mov    (%rax),%rax
   2930b:	mov    0x18(%rax),%rax
   2930f:	mov    0x8(%rax),%rdx
   29313:	mov    (%rax),%rdi
   29316:	mov    %rcx,0x8(%rax)
   2931a:	mov    %rsi,(%rax)
   2931d:	cmp    $0xfffffff6,%edx
   29320:	jbe    29333 <JS_CallInternal+0x3923>
   29322:	mov    -0x4(%rdi),%eax
   29325:	sub    $0x1,%eax
   29328:	mov    %eax,-0x4(%rdi)
   2932b:	test   %eax,%eax
   2932d:	jle    2e551 <JS_CallInternal+0x8b41>
   29333:	movzbl (%r12),%eax
   29338:	add    $0x1,%r12
   2933c:	mov    %rax,%r10
   2933f:	mov    (%r14,%rax,8),%rax
   29343:	jmp    *%rax
   29345:	endbr64
   29349:	mov    -0x188(%rbp),%rax
   29350:	movdqu -0x10(%rbx),%xmm0
   29355:	sub    $0x10,%rbx
   29359:	mov    0x18(%rax),%rax
   2935d:	mov    0x18(%rax),%rax
   29361:	mov    0x8(%rax),%rdx
   29365:	mov    (%rax),%rcx
   29368:	movups %xmm0,(%rax)
   2936b:	cmp    $0xfffffff6,%edx
   2936e:	.byte 0x76


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SPARSE.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

00000000000292da <JS_CallInternal+0x38ca>:
   292da:	movzbl (%r12),%eax
   292df:	add    $0x1,%r12
   292e3:	mov    %rax,%r10
   292e6:	mov    (%r14,%rax,8),%rax
   292ea:	jmp    *%rax
   292ec:	endbr64
   292f0:	mov    -0x8(%rbx),%rcx
   292f4:	mov    -0x10(%rbx),%rsi
   292f8:	cmp    $0xfffffff6,%ecx
   292fb:	jbe    29301 <JS_CallInternal+0x38f1>
   292fd:	addl   $0x1,-0x4(%rsi)
   29301:	mov    -0x188(%rbp),%rax
   29308:	mov    (%rax),%rax
   2930b:	mov    0x18(%rax),%rax
   2930f:	mov    0x8(%rax),%rdx
   29313:	mov    (%rax),%rdi
   29316:	mov    %rcx,0x8(%rax)
   2931a:	mov    %rsi,(%rax)
   2931d:	cmp    $0xfffffff6,%edx
   29320:	jbe    29333 <JS_CallInternal+0x3923>
   29322:	mov    -0x4(%rdi),%eax
   29325:	sub    $0x1,%eax
   29328:	mov    %eax,-0x4(%rdi)
   2932b:	test   %eax,%eax
   2932d:	jle    2e551 <JS_CallInternal+0x8b41>
   29333:	movzbl (%r12),%eax
   29338:	add    $0x1,%r12
   2933c:	mov    %rax,%r10
   2933f:	mov    (%r14,%rax,8),%rax
   29343:	jmp    *%rax
   29345:	endbr64
   29349:	mov    -0x188(%rbp),%rax
   29350:	movdqu -0x10(%rbx),%xmm0
   29355:	sub    $0x10,%rbx
   29359:	mov    0x18(%rax),%rax
   2935d:	mov    0x18(%rax),%rax
   29361:	mov    0x8(%rax),%rdx
   29365:	mov    (%rax),%rcx
   29368:	movups %xmm0,(%rax)
   2936b:	cmp    $0xfffffff6,%edx
   2936e:	jbe    29381 <JS_CallInternal+0x3971>
   29370:	mov    -0x4(%rcx),%eax
   29373:	sub    $0x1,%eax
   29376:	mov    %eax,-0x4(%rcx)
   29379:	test   %eax,%eax
   2937b:	jle    2e540 <JS_CallInternal+0x8b30>
   29381:	movzbl (%r12),%eax
   29386:	add    $0x1,%r12
   2938a:	mov    %rax,%r10
   2938d:	mov    (%r14,%rax,8),%rax
   29391:	jmp    *%rax
   29393:	endbr64
   29397:	mov    -0x188(%rbp),%rax
   2939e:	repz
   2939f:	.byte 0xf
   293a0:	outsl  (%rsi),(%dx)
   293a1:	rex.XB
