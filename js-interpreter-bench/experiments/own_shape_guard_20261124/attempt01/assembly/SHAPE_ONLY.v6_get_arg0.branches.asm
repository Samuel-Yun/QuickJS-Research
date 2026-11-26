
/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SHAPE_ONLY.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002cf7c <JS_CallInternal+0x756c>:
   2cf7c:	mov    0x1(%r12),%ecx
   2cf81:	mov    0x18(%rdx),%rdi
   2cf85:	lea    0x1(%r12,%rcx,1),%rcx
   2cf8a:	cmp    %rdi,(%rcx)
   2cf8d:	jne    291d9 <JS_CallInternal+0x37c9>
   2cf93:	mov    0x10(%rcx),%eax
   2cf96:	lea    0x10(%rbx),%rcx
   2cf9a:	shl    $0x4,%rax
   2cf9e:	add    0x20(%rdx),%rax
   2cfa2:	mov    (%rax),%rdx
   2cfa5:	mov    0x8(%rax),%rax
   2cfa9:	cmp    $0xfffffff6,%eax
   2cfac:	jbe    2cfb2 <JS_CallInternal+0x75a2>
   2cfae:	addl   $0x1,-0x4(%rdx)
   2cfb2:	mov    %rax,0x8(%rbx)
   2cfb6:	lea    0x5(%r12),%rax
   2cfbb:	mov    %rdx,(%rbx)
   2cfbe:	lea    0x1(%rax),%r12
   2cfc2:	movzbl (%rax),%eax
   2cfc5:	mov    %rcx,%rbx
   2cfc8:	mov    %rax,%r10
   2cfcb:	jmp    *(%r14,%rax,8)
   2cfcf:	mov    0x1(%r12),%ecx
   2cfd4:	mov    0x18(%rdx),%rdi
   2cfd8:	lea    0x1(%r12,%rcx,1),%rcx
   2cfdd:	cmp    %rdi,(%rcx)
   2cfe0:	jne    28afe <JS_CallInternal+0x30ee>
   2cfe6:	mov    0x10(%rcx),%eax
   2cfe9:	lea    0x10(%rbx),%rcx
   2cfed:	shl    $0x4,%rax
   2cff1:	add    0x20(%rdx),%rax
   2cff5:	mov    (%rax),%rdx
   2cff8:	mov    0x8(%rax),%rax
   2cffc:	cmp    $0xfffffff6,%eax
   2cfff:	jbe    2d005 <JS_CallInternal+0x75f5>
   2d001:	addl   $0x1,-0x4(%rdx)
   2d005:	mov    %rax,0x8(%rbx)
   2d009:	lea    0x5(%r12),%rax
   2d00e:	mov    %rdx,(%rbx)
   2d011:	lea    0x1(%rax),%r12
   2d015:	movzbl (%rax),%eax
   2d018:	mov    %rcx,%rbx
   2d01b:	mov    %rax,%r10
   2d01e:	jmp    *(%r14,%rax,8)
   2d022:	mov    -0x150(%rbp),%rdi
   2d029:	mov    %rdx,%r9
   2d02c:	mov    %rsi,%r10
   2d02f:	mov    %rcx,%rdx
   2d032:	mov    %rdx,%r8
   2d035:	mov    %rax,%rcx
   2d038:	mov    %r9,%rsi
   2d03b:	mov    %r10,%rdx
   2d03e:	mov    %r12,0x30(%rdi)
   2d042:	rex.WR
   2d043:	.byte 0x89


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SHAPE_ONLY.release/qjs:     file format elf64-x86-64


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
   2927a:	jle    2df13 <JS_CallInternal+0x8503>
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


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SHAPE_ONLY.release/qjs:     file format elf64-x86-64


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
   2927a:	jle    2df13 <JS_CallInternal+0x8503>
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
   292d4:	jle    2df02 <JS_CallInternal+0x84f2>
   292da:	movzbl (%r12),%eax
   292df:	add    $0x1,%r12
   292e3:	mov    %rax,%r10
   292e6:	rex.WB
   292e7:	.byte 0x8b
   292e8:	.byte 0x4


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SHAPE_ONLY.release/qjs:     file format elf64-x86-64


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
   2927a:	jle    2df13 <JS_CallInternal+0x8503>
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
   292d4:	jle    2df02 <JS_CallInternal+0x84f2>
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


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SHAPE_ONLY.release/qjs:     file format elf64-x86-64


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
   292d4:	jle    2df02 <JS_CallInternal+0x84f2>
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
   2932d:	jle    2def1 <JS_CallInternal+0x84e1>
   29333:	movzbl (%r12),%eax
   29338:	add    $0x1,%r12
   2933c:	mov    %rax,%r10
   2933f:	mov    (%r14,%rax,8),%rax
   29343:	jmp    *%rax
   29345:	repz
   29346:	.byte 0xf
   29347:	(bad)


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SHAPE_ONLY.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

000000000002df13 <JS_CallInternal+0x8503>:
   2df13:	mov    0x10(%r13),%rdi
   2df17:	mov    %rax,%rdx
   2df1a:	call   1eb60 <__JS_FreeValueRT>
   2df1f:	jmp    29280 <JS_CallInternal+0x3870>
   2df24:	mov    %rsi,%rdx
   2df27:	mov    %rdi,%rsi
   2df2a:	mov    0x10(%r13),%rdi
   2df2e:	mov    %rcx,-0x200(%rbp)
   2df35:	mov    %rax,-0x1e8(%rbp)
   2df3c:	mov    %r8,-0x1e0(%rbp)
   2df43:	call   1eb60 <__JS_FreeValueRT>
   2df48:	mov    -0x200(%rbp),%rcx
   2df4f:	mov    -0x1e8(%rbp),%rax
   2df56:	mov    -0x1e0(%rbp),%r8
   2df5d:	jmp    29afc <JS_CallInternal+0x40ec>
   2df62:	mov    %rsi,%rdx
   2df65:	mov    %rdi,%rsi
   2df68:	mov    0x10(%r13),%rdi
   2df6c:	mov    %rcx,-0x200(%rbp)
   2df73:	mov    %rax,-0x1e8(%rbp)
   2df7a:	mov    %r8,-0x1e0(%rbp)
   2df81:	call   1eb60 <__JS_FreeValueRT>
   2df86:	mov    -0x200(%rbp),%rcx
   2df8d:	mov    -0x1e8(%rbp),%rax
   2df94:	mov    -0x1e0(%rbp),%r8
   2df9b:	jmp    29b19 <JS_CallInternal+0x4109>
   2dfa0:	mov    0x10(%r13),%rdi
   2dfa4:	mov    %rcx,%rsi
   2dfa7:	call   1eb60 <__JS_FreeValueRT>
   2dfac:	jmp    2715e <JS_CallInternal+0x174e>
   2dfb1:	mov    %rsi,%rdx
   2dfb4:	mov    %rdi,%rsi
   2dfb7:	mov    0x10(%r13),%rdi
   2dfbb:	mov    %rax,-0x200(%rbp)
   2dfc2:	mov    %rcx,-0x1e8(%rbp)
   2dfc9:	call   1eb60 <__JS_FreeValueRT>
   2dfce:	mov    -0x200(%rbp),%rax
   2dfd5:	rex.W
   2dfd6:	.byte 0x8b
   2dfd7:	lea    (%rax),%ebx
   2dfd9:	(bad)
   2dfda:	.byte 0xff


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SHAPE_ONLY.release/qjs:     file format elf64-x86-64


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
   292d4:	jle    2df02 <JS_CallInternal+0x84f2>
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
   2932d:	jle    2def1 <JS_CallInternal+0x84e1>
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


/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/SHAPE_ONLY.release/qjs:     file format elf64-x86-64


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
   2932d:	jle    2def1 <JS_CallInternal+0x84e1>
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
   2937b:	jle    2dee0 <JS_CallInternal+0x84d0>
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
