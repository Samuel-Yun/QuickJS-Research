
/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/RELAX_CLASS.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002cfba <JS_CallInternal+0x75aa>:
   2cfba:	mov    0x1(%r12),%ecx
   2cfbf:	testb  $0x8,0x10(%rdx)
   2cfc3:	jne    291d9 <JS_CallInternal+0x37c9>
   2cfc9:	mov    0x18(%rdx),%rdi
   2cfcd:	cmp    %rdi,0x1(%r12,%rcx,1)
   2cfd2:	jne    291d9 <JS_CallInternal+0x37c9>
   2cfd8:	mov    0x11(%r12,%rcx,1),%eax
   2cfdd:	lea    0x10(%rbx),%rcx
   2cfe1:	shl    $0x4,%rax
   2cfe5:	add    0x20(%rdx),%rax
   2cfe9:	mov    (%rax),%rdx
   2cfec:	mov    0x8(%rax),%rax
   2cff0:	cmp    $0xfffffff6,%eax
   2cff3:	jbe    2cff9 <JS_CallInternal+0x75e9>
   2cff5:	addl   $0x1,-0x4(%rdx)
   2cff9:	mov    %rax,0x8(%rbx)
   2cffd:	lea    0x5(%r12),%rax
   2d002:	mov    %rdx,(%rbx)
   2d005:	lea    0x1(%rax),%r12
   2d009:	movzbl (%rax),%eax
   2d00c:	mov    %rcx,%rbx
   2d00f:	mov    %rax,%r10
   2d012:	jmp    *(%r14,%rax,8)
   2d016:	mov    0x1(%r12),%ecx
   2d01b:	testb  $0x8,0x10(%rdx)
   2d01f:	jne    28b0e <JS_CallInternal+0x30fe>
   2d025:	mov    0x18(%rdx),%rdi
   2d029:	cmp    %rdi,0x1(%r12,%rcx,1)
   2d02e:	jne    28b0e <JS_CallInternal+0x30fe>
   2d034:	mov    0x11(%r12,%rcx,1),%eax
   2d039:	lea    0x10(%rbx),%rcx
   2d03d:	shl    $0x4,%rax
   2d041:	add    0x20(%rdx),%rax
   2d045:	mov    (%rax),%rdx
   2d048:	mov    0x8(%rax),%rax
   2d04c:	cmp    $0xfffffff6,%eax
   2d04f:	jbe    2d055 <JS_CallInternal+0x7645>
   2d051:	addl   $0x1,-0x4(%rdx)
   2d055:	mov    %rax,0x8(%rbx)
   2d059:	lea    0x5(%r12),%rax
   2d05e:	mov    %rdx,(%rbx)
   2d061:	lea    0x1(%rax),%r12
   2d065:	movzbl (%rax),%eax
   2d068:	mov    %rcx,%rbx
   2d06b:	mov    %rax,%r10
   2d06e:	jmp    *(%r14,%rax,8)
   2d072:	mov    -0x150(%rbp),%rax
   2d079:	lea    -0x10(%rbx),%rdi
   2d07d:	rex.B
   2d07e:	.byte 0xb9
   2d07f:	.byte 0
   2d080:	.byte 0x80
	...


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/RELAX_CLASS.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

00000000000291e6 <JS_CallInternal+0x37d6>:
   291e6:	mov    %rax,0x8(%rbx)
   291ea:	mov    %r12,%rax
   291ed:	lea    0x1(%r12),%r12
   291f2:	mov    %rdx,(%rbx)
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
   2927a:	jle    2e3a9 <JS_CallInternal+0x8999>
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


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/RELAX_CLASS.release/qjs:     file format elf64-x86-64


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
   2927a:	jle    2e3a9 <JS_CallInternal+0x8999>
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
   292d4:	jle    2e398 <JS_CallInternal+0x8988>
   292da:	movzbl (%r12),%eax
   292df:	add    $0x1,%r12
   292e3:	mov    %rax,%r10
   292e6:	rex.WB
   292e7:	.byte 0x8b
   292e8:	.byte 0x4


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/RELAX_CLASS.release/qjs:     file format elf64-x86-64


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
   2927a:	jle    2e3a9 <JS_CallInternal+0x8999>
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
   292d4:	jle    2e398 <JS_CallInternal+0x8988>
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


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/RELAX_CLASS.release/qjs:     file format elf64-x86-64


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
   292d4:	jle    2e398 <JS_CallInternal+0x8988>
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
   2932d:	jle    2e387 <JS_CallInternal+0x8977>
   29333:	movzbl (%r12),%eax
   29338:	add    $0x1,%r12
   2933c:	mov    %rax,%r10
   2933f:	mov    (%r14,%rax,8),%rax
   29343:	jmp    *%rax
   29345:	repz
   29346:	.byte 0xf
   29347:	(bad)


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/RELAX_CLASS.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002e3a9 <JS_CallInternal+0x8999>:
   2e3a9:	mov    0x10(%r13),%rdi
   2e3ad:	mov    %rax,%rdx
   2e3b0:	call   1eb60 <__JS_FreeValueRT>
   2e3b5:	jmp    29280 <JS_CallInternal+0x3870>
   2e3ba:	mov    %rsi,%rdx
   2e3bd:	mov    %rdi,%rsi
   2e3c0:	mov    0x10(%r13),%rdi
   2e3c4:	mov    %rcx,-0x200(%rbp)
   2e3cb:	mov    %rax,-0x1e8(%rbp)
   2e3d2:	mov    %r8,-0x1e0(%rbp)
   2e3d9:	call   1eb60 <__JS_FreeValueRT>
   2e3de:	mov    -0x200(%rbp),%rcx
   2e3e5:	mov    -0x1e8(%rbp),%rax
   2e3ec:	mov    -0x1e0(%rbp),%r8
   2e3f3:	jmp    29afc <JS_CallInternal+0x40ec>
   2e3f8:	mov    %rsi,%rdx
   2e3fb:	mov    %rdi,%rsi
   2e3fe:	mov    0x10(%r13),%rdi
   2e402:	mov    %rcx,-0x200(%rbp)
   2e409:	mov    %rax,-0x1e8(%rbp)
   2e410:	mov    %r8,-0x1e0(%rbp)
   2e417:	call   1eb60 <__JS_FreeValueRT>
   2e41c:	mov    -0x200(%rbp),%rcx
   2e423:	mov    -0x1e8(%rbp),%rax
   2e42a:	mov    -0x1e0(%rbp),%r8
   2e431:	jmp    29b19 <JS_CallInternal+0x4109>
   2e436:	mov    0x10(%r13),%rdi
   2e43a:	mov    %rax,%rdx
   2e43d:	mov    %rcx,%rsi
   2e440:	call   1eb60 <__JS_FreeValueRT>
   2e445:	jmp    2901f <JS_CallInternal+0x360f>
   2e44a:	mov    0x10(%r13),%rdi
   2e44e:	mov    %rax,%rdx
   2e451:	call   1eb60 <__JS_FreeValueRT>
   2e456:	jmp    28fd7 <JS_CallInternal+0x35c7>
   2e45b:	mov    0x10(%r13),%rdi
   2e45f:	mov    %rax,%rdx
   2e462:	call   1eb60 <__JS_FreeValueRT>
   2e467:	jmp    28f85 <JS_CallInternal+0x3575>
   2e46c:	mov    0x10(%r13),%rdi
   2e470:	rex.W


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/RELAX_CLASS.release/qjs:     file format elf64-x86-64


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
   292d4:	jle    2e398 <JS_CallInternal+0x8988>
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
   2932d:	jle    2e387 <JS_CallInternal+0x8977>
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


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/RELAX_CLASS.release/qjs:     file format elf64-x86-64


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
   2932d:	jle    2e387 <JS_CallInternal+0x8977>
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
   2937b:	jle    2e376 <JS_CallInternal+0x8966>
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
