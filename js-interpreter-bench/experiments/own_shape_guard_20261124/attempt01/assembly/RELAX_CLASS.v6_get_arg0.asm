
/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/own_shape_guard_20261124/attempt01/work/RELAX_CLASS.release/qjs:     file format elf64-x86-64


Disassembly of section .text:

00000000000291be <JS_CallInternal+0x37ae>:
   291be:	endbr64
   291c2:	mov    -0x190(%rbp),%rax
   291c9:	mov    (%rax),%rdx
   291cc:	mov    0x8(%rax),%rax
   291d0:	cmp    $0xffffffff,%eax
   291d3:	je     2cfba <JS_CallInternal+0x75aa>
   291d9:	lea    0x10(%rbx),%rcx
   291dd:	cmp    $0xfffffff6,%eax
   291e0:	jbe    291e6 <JS_CallInternal+0x37d6>
   291e2:	addl   $0x1,-0x4(%rdx)
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
   292d4:	.byte 0xf
   292d5:	.byte 0x8e
