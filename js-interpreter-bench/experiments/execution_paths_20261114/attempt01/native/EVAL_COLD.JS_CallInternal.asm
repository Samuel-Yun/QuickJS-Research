
js-interpreter-bench/experiments/native_octane_20261108/attempt11/work/EVAL_COLD/qjs:     file format elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .plt.got:

Disassembly of section .plt.sec:

Disassembly of section .text:

0000000000024f90 <JS_CallInternal>:
   24f90:	55                   	push   %rbp
   24f91:	48 89 e5             	mov    %rsp,%rbp
   24f94:	41 57                	push   %r15
   24f96:	4d 89 c7             	mov    %r8,%r15
   24f99:	41 56                	push   %r14
   24f9b:	49 89 ce             	mov    %rcx,%r14
   24f9e:	41 55                	push   %r13
   24fa0:	49 89 d5             	mov    %rdx,%r13
   24fa3:	41 54                	push   %r12
   24fa5:	49 89 f4             	mov    %rsi,%r12
   24fa8:	53                   	push   %rbx
   24fa9:	48 81 ec 68 02 00 00 	sub    $0x268,%rsp
   24fb0:	48 8b 45 10          	mov    0x10(%rbp),%rax
   24fb4:	48 89 bd 90 fe ff ff 	mov    %rdi,-0x170(%rbp)
   24fbb:	48 89 b5 c8 fe ff ff 	mov    %rsi,-0x138(%rbp)
   24fc2:	48 89 85 58 fe ff ff 	mov    %rax,-0x1a8(%rbp)
   24fc9:	48 8b 45 18          	mov    0x18(%rbp),%rax
   24fcd:	48 89 b5 60 fe ff ff 	mov    %rsi,-0x1a0(%rbp)
   24fd4:	48 89 85 78 fe ff ff 	mov    %rax,-0x188(%rbp)
   24fdb:	48 8b 45 20          	mov    0x20(%rbp),%rax
   24fdf:	48 89 95 68 fe ff ff 	mov    %rdx,-0x198(%rbp)
   24fe6:	48 89 8d 50 fe ff ff 	mov    %rcx,-0x1b0(%rbp)
   24fed:	4c 89 85 70 fe ff ff 	mov    %r8,-0x190(%rbp)
   24ff4:	44 89 8d a8 fe ff ff 	mov    %r9d,-0x158(%rbp)
   24ffb:	48 89 85 98 fe ff ff 	mov    %rax,-0x168(%rbp)
   25002:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
   25009:	00 00 
   2500b:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
   2500f:	48 8b 47 10          	mov    0x10(%rdi),%rax
   25013:	48 89 85 b0 fe ff ff 	mov    %rax,-0x150(%rbp)
   2501a:	8b 87 a8 01 00 00    	mov    0x1a8(%rdi),%eax
   25020:	89 85 c0 fe ff ff    	mov    %eax,-0x140(%rbp)
   25026:	83 e8 01             	sub    $0x1,%eax
   25029:	89 87 a8 01 00 00    	mov    %eax,0x1a8(%rdi)
   2502f:	85 c0                	test   %eax,%eax
   25031:	0f 8e 89 05 00 00    	jle    255c0 <JS_CallInternal+0x630>
   25037:	41 83 fd ff          	cmp    $0xffffffff,%r13d
   2503b:	0f 85 bf 05 00 00    	jne    25600 <JS_CallInternal+0x670>
   25041:	48 8b 85 c8 fe ff ff 	mov    -0x138(%rbp),%rax
   25048:	0f b7 40 12          	movzwl 0x12(%rax),%eax
   2504c:	66 83 f8 0d          	cmp    $0xd,%ax
   25050:	0f 85 a6 07 00 00    	jne    257fc <JS_CallInternal+0x86c>
   25056:	48 8b 85 c8 fe ff ff 	mov    -0x138(%rbp),%rax
   2505d:	48 8b 40 28          	mov    0x28(%rax),%rax
   25061:	48 89 85 c0 fe ff ff 	mov    %rax,-0x140(%rbp)
   25068:	44 0f b7 40 38       	movzwl 0x38(%rax),%r8d
   2506d:	44 3b 85 a8 fe ff ff 	cmp    -0x158(%rbp),%r8d
   25074:	0f 8f ed 01 00 00    	jg     25267 <JS_CallInternal+0x2d7>
   2507a:	8b 45 28             	mov    0x28(%rbp),%eax
   2507d:	83 e0 02             	and    $0x2,%eax
   25080:	41 0f 45 c0          	cmovne %r8d,%eax
   25084:	48 8b bd c0 fe ff ff 	mov    -0x140(%rbp),%rdi
   2508b:	4c 8b 9d b0 fe ff ff 	mov    -0x150(%rbp),%r11
   25092:	44 0f b7 57 3a       	movzwl 0x3a(%rdi),%r10d
   25097:	0f b7 77 3e          	movzwl 0x3e(%rdi),%esi
   2509b:	0f b7 57 40          	movzwl 0x40(%rdi),%edx
   2509f:	48 89 ef             	mov    %rbp,%rdi
   250a2:	48 89 f1             	mov    %rsi,%rcx
   250a5:	44 01 d6             	add    %r10d,%esi
   250a8:	4c 89 d3             	mov    %r10,%rbx
   250ab:	01 c6                	add    %eax,%esi
   250ad:	49 89 d1             	mov    %rdx,%r9
   250b0:	48 63 f6             	movslq %esi,%rsi
   250b3:	48 8d 34 72          	lea    (%rdx,%rsi,2),%rsi
   250b7:	48 c1 e6 03          	shl    $0x3,%rsi
   250bb:	48 29 f7             	sub    %rsi,%rdi
   250be:	49 3b bb d0 04 00 00 	cmp    0x4d0(%r11),%rdi
   250c5:	0f 82 c7 07 00 00    	jb     25892 <JS_CallInternal+0x902>
   250cb:	48 8b bd c0 fe ff ff 	mov    -0x140(%rbp),%rdi
   250d2:	48 83 c6 17          	add    $0x17,%rsi
   250d6:	49 89 f3             	mov    %rsi,%r11
   250d9:	0f b6 7f 10          	movzbl 0x10(%rdi),%edi
   250dd:	49 81 e3 00 f0 ff ff 	and    $0xfffffffffffff000,%r11
   250e4:	4c 89 a5 08 ff ff ff 	mov    %r12,-0xf8(%rbp)
   250eb:	4c 89 ad 10 ff ff ff 	mov    %r13,-0xf0(%rbp)
   250f2:	89 bd 3c ff ff ff    	mov    %edi,-0xc4(%rbp)
   250f8:	8b bd a8 fe ff ff    	mov    -0x158(%rbp),%edi
   250fe:	89 bd 38 ff ff ff    	mov    %edi,-0xc8(%rbp)
   25104:	48 8b bd c8 fe ff ff 	mov    -0x138(%rbp),%rdi
   2510b:	48 8b 7f 30          	mov    0x30(%rdi),%rdi
   2510f:	48 89 bd 88 fe ff ff 	mov    %rdi,-0x178(%rbp)
   25116:	48 89 e7             	mov    %rsp,%rdi
   25119:	4c 29 df             	sub    %r11,%rdi
   2511c:	48 39 fc             	cmp    %rdi,%rsp
   2511f:	74 15                	je     25136 <JS_CallInternal+0x1a6>
   25121:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
   25128:	48 83 8c 24 f8 0f 00 	orq    $0x0,0xff8(%rsp)
   2512f:	00 00 
   25131:	48 39 fc             	cmp    %rdi,%rsp
   25134:	75 eb                	jne    25121 <JS_CallInternal+0x191>
   25136:	81 e6 f0 0f 00 00    	and    $0xff0,%esi
   2513c:	48 29 f4             	sub    %rsi,%rsp
   2513f:	48 85 f6             	test   %rsi,%rsi
   25142:	74 06                	je     2514a <JS_CallInternal+0x1ba>
   25144:	48 83 4c 34 f8 00    	orq    $0x0,-0x8(%rsp,%rsi,1)
   2514a:	48 8b b5 98 fe ff ff 	mov    -0x168(%rbp),%rsi
   25151:	48 8d 7c 24 0f       	lea    0xf(%rsp),%rdi
   25156:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
   2515a:	48 89 bd 28 fe ff ff 	mov    %rdi,-0x1d8(%rbp)
   25161:	48 89 b5 80 fe ff ff 	mov    %rsi,-0x180(%rbp)
   25168:	85 c0                	test   %eax,%eax
   2516a:	0f 85 b4 61 00 00    	jne    2b324 <JS_CallInternal+0x6394>
   25170:	48 98                	cltq
   25172:	48 c1 e0 04          	shl    $0x4,%rax
   25176:	48 01 f8             	add    %rdi,%rax
   25179:	48 89 85 a0 fe ff ff 	mov    %rax,-0x160(%rbp)
   25180:	48 89 85 20 ff ff ff 	mov    %rax,-0xe0(%rbp)
   25187:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2518e:	48 89 85 18 ff ff ff 	mov    %rax,-0xe8(%rbp)
   25195:	45 85 d2             	test   %r10d,%r10d
   25198:	74 3e                	je     251d8 <JS_CallInternal+0x248>
   2519a:	48 8b bd a0 fe ff ff 	mov    -0x160(%rbp),%rdi
   251a1:	48 89 de             	mov    %rbx,%rsi
   251a4:	48 c1 e6 04          	shl    $0x4,%rsi
   251a8:	48 89 f8             	mov    %rdi,%rax
   251ab:	48 01 fe             	add    %rdi,%rsi
   251ae:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   251b5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   251bc:	00 00 00 00 
   251c0:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
   251c7:	48 83 c0 10          	add    $0x10,%rax
   251cb:	48 c7 40 f8 03 00 00 	movq   $0x3,-0x8(%rax)
   251d2:	00 
   251d3:	48 39 f0             	cmp    %rsi,%rax
   251d6:	75 e8                	jne    251c0 <JS_CallInternal+0x230>
   251d8:	48 c1 e3 04          	shl    $0x4,%rbx
   251dc:	48 c1 e1 04          	shl    $0x4,%rcx
   251e0:	48 03 9d a0 fe ff ff 	add    -0x160(%rbp),%rbx
   251e7:	48 8d 3c 0b          	lea    (%rbx,%rcx,1),%rdi
   251eb:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
   251f2:	66 45 85 c9          	test   %r9w,%r9w
   251f6:	74 0b                	je     25203 <JS_CallInternal+0x273>
   251f8:	48 c1 e2 03          	shl    $0x3,%rdx
   251fc:	31 f6                	xor    %esi,%esi
   251fe:	e8 5d c6 fe ff       	call   11860 <memset@plt>
   25203:	48 8b 95 b0 fe ff ff 	mov    -0x150(%rbp),%rdx
   2520a:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   25211:	48 89 9d 48 fe ff ff 	mov    %rbx,-0x1b8(%rbp)
   25218:	48 8b 82 f0 04 00 00 	mov    0x4f0(%rdx),%rax
   2521f:	4c 8b 79 18          	mov    0x18(%rcx),%r15
   25223:	4c 8b 61 48          	mov    0x48(%rcx),%r12
   25227:	48 8b 8d c8 fe ff ff 	mov    -0x138(%rbp),%rcx
   2522e:	48 89 85 00 ff ff ff 	mov    %rax,-0x100(%rbp)
   25235:	48 8d 85 00 ff ff ff 	lea    -0x100(%rbp),%rax
   2523c:	48 89 82 f0 04 00 00 	mov    %rax,0x4f0(%rdx)
   25243:	48 89 8d 40 fe ff ff 	mov    %rcx,-0x1c0(%rbp)
   2524a:	48 89 85 b8 fe ff ff 	mov    %rax,-0x148(%rbp)
   25251:	41 0f b6 07          	movzbl (%r15),%eax
   25255:	4c 8d 35 e4 4a 0e 00 	lea    0xe4ae4(%rip),%r14        # 109d40 <dispatch_table.85>
   2525c:	4d 8d 6f 01          	lea    0x1(%r15),%r13
   25260:	49 89 c2             	mov    %rax,%r10
   25263:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   25267:	44 89 c0             	mov    %r8d,%eax
   2526a:	e9 15 fe ff ff       	jmp    25084 <JS_CallInternal+0xf4>
   2526f:	f3 0f 1e fa          	endbr64
   25273:	66 90                	xchg   %ax,%ax
   25275:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2527c:	00 00 00 00 
   25280:	f3 0f 1e fa          	endbr64
   25284:	41 8d 82 4d ff ff ff 	lea    -0xb3(%r10),%eax
   2528b:	48 c7 43 08 00 00 00 	movq   $0x0,0x8(%rbx)
   25292:	00 
   25293:	49 83 c5 01          	add    $0x1,%r13
   25297:	48 83 c3 10          	add    $0x10,%rbx
   2529b:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2529f:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   252a4:	49 89 c2             	mov    %rax,%r10
   252a7:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   252ab:	ff e0                	jmp    *%rax
   252ad:	f3 0f 1e fa          	endbr64
   252b1:	0f 1f 40 00          	nopl   0x0(%rax)
   252b5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   252bc:	00 00 00 00 
   252c0:	f3 0f 1e fa          	endbr64
   252c4:	41 8b 45 04          	mov    0x4(%r13),%eax
   252c8:	f3 0f 6f 5b f0       	movdqu -0x10(%rbx),%xmm3
   252cd:	4d 8d 7d 09          	lea    0x9(%r13),%r15
   252d1:	4c 89 e7             	mov    %r12,%rdi
   252d4:	41 8b 4d 00          	mov    0x0(%r13),%ecx
   252d8:	44 89 95 00 fe ff ff 	mov    %r10d,-0x200(%rbp)
   252df:	89 85 20 fe ff ff    	mov    %eax,-0x1e0(%rbp)
   252e5:	41 0f b6 45 08       	movzbl 0x8(%r13),%eax
   252ea:	0f 29 9d 30 fe ff ff 	movaps %xmm3,-0x1d0(%rbp)
   252f1:	48 8b 95 38 fe ff ff 	mov    -0x1c8(%rbp),%rdx
   252f8:	88 85 10 fe ff ff    	mov    %al,-0x1f0(%rbp)
   252fe:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   25305:	89 8d f0 fd ff ff    	mov    %ecx,-0x210(%rbp)
   2530b:	49 89 d5             	mov    %rdx,%r13
   2530e:	4c 89 78 30          	mov    %r15,0x30(%rax)
   25312:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   25319:	48 89 c6             	mov    %rax,%rsi
   2531c:	48 89 85 e8 fd ff ff 	mov    %rax,-0x218(%rbp)
   25323:	e8 f8 a5 04 00       	call   6f920 <JS_HasProperty>
   25328:	85 c0                	test   %eax,%eax
   2532a:	0f 88 90 03 00 00    	js     256c0 <JS_CallInternal+0x730>
   25330:	0f 84 3a 61 00 00    	je     2b470 <JS_CallInternal+0x64e0>
   25336:	80 bd 10 fe ff ff 00 	cmpb   $0x0,-0x1f0(%rbp)
   2533d:	44 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10d
   25344:	0f 85 04 06 00 00    	jne    2594e <JS_CallInternal+0x9be>
   2534a:	41 83 ea 71          	sub    $0x71,%r10d
   2534e:	41 83 fa 04          	cmp    $0x4,%r10d
   25352:	0f 87 12 05 00 00    	ja     2586a <JS_CallInternal+0x8da>
   25358:	48 8d 15 05 ce 0b 00 	lea    0xbce05(%rip),%rdx        # e2164 <qjsc_repl_size+0x4b8>
   2535f:	4a 63 04 92          	movslq (%rdx,%r10,4),%rax
   25363:	48 01 d0             	add    %rdx,%rax
   25366:	3e ff e0             	notrack jmp *%rax
   25369:	f3 0f 1e fa          	endbr64
   2536d:	f3 0f 1e fa          	endbr64
   25371:	45 8d 8a 14 ff ff ff 	lea    -0xec(%r10),%r9d
   25378:	4d 89 ef             	mov    %r13,%r15
   2537b:	4d 63 e9             	movslq %r9d,%r13
   2537e:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   25385:	49 89 db             	mov    %rbx,%r11
   25388:	31 c9                	xor    %ecx,%ecx
   2538a:	49 c1 e5 04          	shl    $0x4,%r13
   2538e:	44 89 95 00 fe ff ff 	mov    %r10d,-0x200(%rbp)
   25395:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   2539b:	4c 89 e7             	mov    %r12,%rdi
   2539e:	4d 29 eb             	sub    %r13,%r11
   253a1:	4c 89 78 30          	mov    %r15,0x30(%rax)
   253a5:	49 8b 73 f0          	mov    -0x10(%r11),%rsi
   253a9:	49 8b 53 f8          	mov    -0x8(%r11),%rdx
   253ad:	6a 00                	push   $0x0
   253af:	41 53                	push   %r11
   253b1:	4c 89 9d 10 fe ff ff 	mov    %r11,-0x1f0(%rbp)
   253b8:	6a 03                	push   $0x3
   253ba:	6a 00                	push   $0x0
   253bc:	44 89 8d 30 fe ff ff 	mov    %r9d,-0x1d0(%rbp)
   253c3:	e8 c8 fb ff ff       	call   24f90 <JS_CallInternal>
   253c8:	48 83 c4 20          	add    $0x20,%rsp
   253cc:	48 89 c6             	mov    %rax,%rsi
   253cf:	48 89 d0             	mov    %rdx,%rax
   253d2:	83 fa 06             	cmp    $0x6,%edx
   253d5:	0f 84 e5 02 00 00    	je     256c0 <JS_CallInternal+0x730>
   253db:	48 89 f1             	mov    %rsi,%rcx
   253de:	83 bd 00 fe ff ff 23 	cmpl   $0x23,-0x200(%rbp)
   253e5:	0f 84 97 03 00 00    	je     25782 <JS_CallInternal+0x7f2>
   253eb:	44 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9d
   253f2:	4c 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%r11
   253f9:	45 85 c9             	test   %r9d,%r9d
   253fc:	0f 88 a9 00 00 00    	js     254ab <JS_CallInternal+0x51b>
   25402:	48 89 9d 10 fe ff ff 	mov    %rbx,-0x1f0(%rbp)
   25409:	4c 89 e0             	mov    %r12,%rax
   2540c:	49 8d 5b f0          	lea    -0x10(%r11),%rbx
   25410:	4f 8d 64 1d 00       	lea    0x0(%r13,%r11,1),%r12
   25415:	48 89 95 00 fe ff ff 	mov    %rdx,-0x200(%rbp)
   2541c:	45 89 cd             	mov    %r9d,%r13d
   2541f:	48 89 b5 f0 fd ff ff 	mov    %rsi,-0x210(%rbp)
   25426:	eb 21                	jmp    25449 <JS_CallInternal+0x4b9>
   25428:	66 90                	xchg   %ax,%ax
   2542a:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   25431:	00 00 00 00 
   25435:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2543c:	00 00 00 00 
   25440:	48 83 c3 10          	add    $0x10,%rbx
   25444:	4c 39 e3             	cmp    %r12,%rbx
   25447:	74 47                	je     25490 <JS_CallInternal+0x500>
   25449:	48 8b 73 08          	mov    0x8(%rbx),%rsi
   2544d:	83 fe f6             	cmp    $0xfffffff6,%esi
   25450:	76 ee                	jbe    25440 <JS_CallInternal+0x4b0>
   25452:	48 8b 3b             	mov    (%rbx),%rdi
   25455:	8b 4f fc             	mov    -0x4(%rdi),%ecx
   25458:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2545b:	89 57 fc             	mov    %edx,-0x4(%rdi)
   2545e:	85 d2                	test   %edx,%edx
   25460:	7f de                	jg     25440 <JS_CallInternal+0x4b0>
   25462:	48 89 f1             	mov    %rsi,%rcx
   25465:	48 89 fe             	mov    %rdi,%rsi
   25468:	48 8b 78 10          	mov    0x10(%rax),%rdi
   2546c:	48 83 c3 10          	add    $0x10,%rbx
   25470:	48 89 ca             	mov    %rcx,%rdx
   25473:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2547a:	e8 51 90 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2547f:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   25486:	4c 39 e3             	cmp    %r12,%rbx
   25489:	75 be                	jne    25449 <JS_CallInternal+0x4b9>
   2548b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   25490:	49 89 c4             	mov    %rax,%r12
   25493:	48 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%rbx
   2549a:	48 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%rax
   254a1:	45 89 e9             	mov    %r13d,%r9d
   254a4:	48 8b b5 f0 fd ff ff 	mov    -0x210(%rbp),%rsi
   254ab:	41 83 c1 01          	add    $0x1,%r9d
   254af:	4d 8d 6f 01          	lea    0x1(%r15),%r13
   254b3:	4d 63 c9             	movslq %r9d,%r9
   254b6:	49 c1 e1 04          	shl    $0x4,%r9
   254ba:	4c 29 cb             	sub    %r9,%rbx
   254bd:	48 89 da             	mov    %rbx,%rdx
   254c0:	48 8d 5b 10          	lea    0x10(%rbx),%rbx
   254c4:	48 89 32             	mov    %rsi,(%rdx)
   254c7:	48 89 42 08          	mov    %rax,0x8(%rdx)
   254cb:	41 0f b6 07          	movzbl (%r15),%eax
   254cf:	49 89 c2             	mov    %rax,%r10
   254d2:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   254d6:	f3 0f 1e fa          	endbr64
   254da:	f3 0f 1e fa          	endbr64
   254de:	41 8b 45 00          	mov    0x0(%r13),%eax
   254e2:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   254e6:	31 f6                	xor    %esi,%esi
   254e8:	ba 02 00 00 00       	mov    $0x2,%edx
   254ed:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   254f4:	4c 89 e7             	mov    %r12,%rdi
   254f7:	b9 01 00 00 00       	mov    $0x1,%ecx
   254fc:	4d 8d 7d 06          	lea    0x6(%r13),%r15
   25500:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   25506:	41 0f b7 45 04       	movzwl 0x4(%r13),%eax
   2550b:	44 89 95 f0 fd ff ff 	mov    %r10d,-0x210(%rbp)
   25512:	66 89 85 00 fe ff ff 	mov    %ax,-0x200(%rbp)
   25519:	e8 92 4f 02 00       	call   4a4b0 <JS_NewObjectProtoClass>
   2551e:	48 89 03             	mov    %rax,(%rbx)
   25521:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   25525:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   25529:	0f 84 07 04 00 00    	je     25936 <JS_CallInternal+0x9a6>
   2552f:	44 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%r10d
   25536:	41 83 fa 78          	cmp    $0x78,%r10d
   2553a:	0f 85 cb 03 00 00    	jne    2590b <JS_CallInternal+0x97b>
   25540:	0f b7 85 00 fe ff ff 	movzwl -0x200(%rbp),%eax
   25547:	48 8b 8d 88 fe ff ff 	mov    -0x178(%rbp),%rcx
   2554e:	4c 8b 04 c1          	mov    (%rcx,%rax,8),%r8
   25552:	41 83 40 fc 01       	addl   $0x1,-0x4(%r8)
   25557:	48 8b 33             	mov    (%rbx),%rsi
   2555a:	8b 95 30 fe ff ff    	mov    -0x1d0(%rbp),%edx
   25560:	b9 22 00 00 00       	mov    $0x22,%ecx
   25565:	4c 89 e7             	mov    %r12,%rdi
   25568:	4c 89 85 00 fe ff ff 	mov    %r8,-0x200(%rbp)
   2556f:	e8 ac 43 02 00       	call   49920 <add_property>
   25574:	4c 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%r8
   2557b:	48 85 c0             	test   %rax,%rax
   2557e:	0f 84 86 93 00 00    	je     2e90a <JS_CallInternal+0x997a>
   25584:	4c 89 00             	mov    %r8,(%rax)
   25587:	8b b5 30 fe ff ff    	mov    -0x1d0(%rbp),%esi
   2558d:	31 d2                	xor    %edx,%edx
   2558f:	4c 89 e7             	mov    %r12,%rdi
   25592:	48 83 c3 20          	add    $0x20,%rbx
   25596:	49 83 c5 07          	add    $0x7,%r13
   2559a:	e8 e1 5d 01 00       	call   3b380 <__JS_AtomToValue>
   2559f:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   255a6:	48 89 01             	mov    %rax,(%rcx)
   255a9:	48 89 51 08          	mov    %rdx,0x8(%rcx)
   255ad:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   255b2:	49 89 c2             	mov    %rax,%r10
   255b5:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   255b9:	ff e0                	jmp    *%rax
   255bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   255c0:	e8 fb 04 01 00       	call   35ac0 <__js_poll_interrupts>
   255c5:	85 c0                	test   %eax,%eax
   255c7:	0f 84 6a fa ff ff    	je     25037 <JS_CallInternal+0xa7>
   255cd:	31 c0                	xor    %eax,%eax
   255cf:	ba 06 00 00 00       	mov    $0x6,%edx
   255d4:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   255d8:	64 48 2b 0c 25 28 00 	sub    %fs:0x28,%rcx
   255df:	00 00 
   255e1:	0f 85 00 a1 00 00    	jne    2f6e7 <JS_CallInternal+0xa757>
   255e7:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
   255eb:	5b                   	pop    %rbx
   255ec:	41 5c                	pop    %r12
   255ee:	41 5d                	pop    %r13
   255f0:	41 5e                	pop    %r14
   255f2:	41 5f                	pop    %r15
   255f4:	5d                   	pop    %rbp
   255f5:	c3                   	ret
   255f6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   255fd:	00 00 00 
   25600:	f6 45 28 04          	testb  $0x4,0x28(%rbp)
   25604:	0f 84 d6 03 00 00    	je     259e0 <JS_CallInternal+0xa50>
   2560a:	48 8b 85 c8 fe ff ff 	mov    -0x138(%rbp),%rax
   25611:	48 8b 48 58          	mov    0x58(%rax),%rcx
   25615:	48 8b 70 70          	mov    0x70(%rax),%rsi
   25619:	48 8d 50 50          	lea    0x50(%rax),%rdx
   2561d:	48 8b 78 68          	mov    0x68(%rax),%rdi
   25621:	48 89 95 b8 fe ff ff 	mov    %rdx,-0x148(%rbp)
   25628:	48 8b 59 28          	mov    0x28(%rcx),%rbx
   2562c:	48 89 8d 40 fe ff ff 	mov    %rcx,-0x1c0(%rbp)
   25633:	48 8b 49 30          	mov    0x30(%rcx),%rcx
   25637:	48 89 b5 a0 fe ff ff 	mov    %rsi,-0x160(%rbp)
   2563e:	4c 8b 63 48          	mov    0x48(%rbx),%r12
   25642:	48 89 9d c0 fe ff ff 	mov    %rbx,-0x140(%rbp)
   25649:	48 89 8d 88 fe ff ff 	mov    %rcx,-0x178(%rbp)
   25650:	48 89 c1             	mov    %rax,%rcx
   25653:	0f b7 43 3a          	movzwl 0x3a(%rbx),%eax
   25657:	44 8b 59 24          	mov    0x24(%rcx),%r11d
   2565b:	48 8b 99 90 00 00 00 	mov    0x90(%rcx),%rbx
   25662:	48 89 bd 28 fe ff ff 	mov    %rdi,-0x1d8(%rbp)
   25669:	48 c1 e0 04          	shl    $0x4,%rax
   2566d:	4c 8b b9 80 00 00 00 	mov    0x80(%rcx),%r15
   25674:	48 c7 81 90 00 00 00 	movq   $0x0,0x90(%rcx)
   2567b:	00 00 00 00 
   2567f:	48 01 f0             	add    %rsi,%rax
   25682:	48 8b b5 b0 fe ff ff 	mov    -0x150(%rbp),%rsi
   25689:	48 89 85 48 fe ff ff 	mov    %rax,-0x1b8(%rbp)
   25690:	48 8b 86 f0 04 00 00 	mov    0x4f0(%rsi),%rax
   25697:	48 89 41 50          	mov    %rax,0x50(%rcx)
   2569b:	48 89 96 f0 04 00 00 	mov    %rdx,0x4f0(%rsi)
   256a2:	45 85 db             	test   %r11d,%r11d
   256a5:	0f 84 97 02 00 00    	je     25942 <JS_CallInternal+0x9b2>
   256ab:	48 8b 85 28 fe ff ff 	mov    -0x1d8(%rbp),%rax
   256b2:	48 89 85 80 fe ff ff 	mov    %rax,-0x180(%rbp)
   256b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   256c0:	48 8b 85 b0 fe ff ff 	mov    -0x150(%rbp),%rax
   256c7:	83 b8 e0 04 00 00 ff 	cmpl   $0xffffffff,0x4e0(%rax)
   256ce:	75 41                	jne    25711 <JS_CallInternal+0x781>
   256d0:	48 8b 80 d8 04 00 00 	mov    0x4d8(%rax),%rax
   256d7:	66 83 78 12 03       	cmpw   $0x3,0x12(%rax)
   256dc:	75 33                	jne    25711 <JS_CallInternal+0x781>
   256de:	48 8b 48 18          	mov    0x18(%rax),%rcx
   256e2:	8b 51 18             	mov    0x18(%rcx),%edx
   256e5:	89 d0                	mov    %edx,%eax
   256e7:	83 e0 39             	and    $0x39,%eax
   256ea:	8b 44 81 38          	mov    0x38(%rcx,%rax,4),%eax
   256ee:	48 85 c0             	test   %rax,%rax
   256f1:	0f 84 8f 69 00 00    	je     2c086 <JS_CallInternal+0x70f6>
   256f7:	48 8d 14 95 3c 00 00 	lea    0x3c(,%rdx,4),%rdx
   256fe:	00 
   256ff:	48 8d 44 c2 f8       	lea    -0x8(%rdx,%rax,8),%rax
   25704:	48 01 c8             	add    %rcx,%rax
   25707:	83 78 04 39          	cmpl   $0x39,0x4(%rax)
   2570b:	0f 85 68 69 00 00    	jne    2c079 <JS_CallInternal+0x70e9>
   25711:	48 8b 85 b0 fe ff ff 	mov    -0x150(%rbp),%rax
   25718:	80 b8 e8 04 00 00 00 	cmpb   $0x0,0x4e8(%rax)
   2571f:	0f 84 b8 01 00 00    	je     258dd <JS_CallInternal+0x94d>
   25725:	48 8b 85 c0 fe ff ff 	mov    -0x140(%rbp),%rax
   2572c:	f6 40 11 30          	testb  $0x30,0x11(%rax)
   25730:	0f 84 7c 63 00 00    	je     2bab2 <JS_CallInternal+0x6b22>
   25736:	4d 89 fd             	mov    %r15,%r13
   25739:	b8 06 00 00 00       	mov    $0x6,%eax
   2573e:	31 c9                	xor    %ecx,%ecx
   25740:	48 8b 95 b8 fe ff ff 	mov    -0x148(%rbp),%rdx
   25747:	4c 89 6a 30          	mov    %r13,0x30(%rdx)
   2574b:	48 89 5a 40          	mov    %rbx,0x40(%rdx)
   2574f:	48 8b 9d b8 fe ff ff 	mov    -0x148(%rbp),%rbx
   25756:	48 8b 13             	mov    (%rbx),%rdx
   25759:	48 8b 9d b0 fe ff ff 	mov    -0x150(%rbp),%rbx
   25760:	48 89 93 f0 04 00 00 	mov    %rdx,0x4f0(%rbx)
   25767:	48 89 c2             	mov    %rax,%rdx
   2576a:	48 89 c8             	mov    %rcx,%rax
   2576d:	e9 62 fe ff ff       	jmp    255d4 <JS_CallInternal+0x644>
   25772:	f3 0f 1e fa          	endbr64
   25776:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2577a:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2577e:	48 83 eb 10          	sub    $0x10,%rbx
   25782:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
   25789:	66 83 7a 40 00       	cmpw   $0x0,0x40(%rdx)
   2578e:	0f 85 5c 70 00 00    	jne    2c7f0 <JS_CallInternal+0x7860>
   25794:	4c 8b ad 28 fe ff ff 	mov    -0x1d8(%rbp),%r13
   2579b:	49 39 dd             	cmp    %rbx,%r13
   2579e:	73 af                	jae    2574f <JS_CallInternal+0x7bf>
   257a0:	49 89 c6             	mov    %rax,%r14
   257a3:	49 89 cf             	mov    %rcx,%r15
   257a6:	eb 25                	jmp    257cd <JS_CallInternal+0x83d>
   257a8:	66 90                	xchg   %ax,%ax
   257aa:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   257b1:	00 00 00 00 
   257b5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   257bc:	00 00 00 00 
   257c0:	49 83 c5 10          	add    $0x10,%r13
   257c4:	49 39 dd             	cmp    %rbx,%r13
   257c7:	0f 83 ba 00 00 00    	jae    25887 <JS_CallInternal+0x8f7>
   257cd:	49 8b 75 08          	mov    0x8(%r13),%rsi
   257d1:	83 fe f6             	cmp    $0xfffffff6,%esi
   257d4:	76 ea                	jbe    257c0 <JS_CallInternal+0x830>
   257d6:	49 8b 55 00          	mov    0x0(%r13),%rdx
   257da:	8b 42 fc             	mov    -0x4(%rdx),%eax
   257dd:	83 e8 01             	sub    $0x1,%eax
   257e0:	89 42 fc             	mov    %eax,-0x4(%rdx)
   257e3:	85 c0                	test   %eax,%eax
   257e5:	7f d9                	jg     257c0 <JS_CallInternal+0x830>
   257e7:	48 89 d0             	mov    %rdx,%rax
   257ea:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   257ef:	48 89 f2             	mov    %rsi,%rdx
   257f2:	48 89 c6             	mov    %rax,%rsi
   257f5:	e8 d6 8c ff ff       	call   1e4d0 <__JS_FreeValueRT>
   257fa:	eb c4                	jmp    257c0 <JS_CallInternal+0x830>
   257fc:	48 8b 8d b0 fe ff ff 	mov    -0x150(%rbp),%rcx
   25803:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
   25807:	48 c1 e0 03          	shl    $0x3,%rax
   2580b:	48 03 81 58 04 00 00 	add    0x458(%rcx),%rax
   25812:	48 8b 40 18          	mov    0x18(%rax),%rax
   25816:	48 85 c0             	test   %rax,%rax
   25819:	0f 84 c1 01 00 00    	je     259e0 <JS_CallInternal+0xa50>
   2581f:	8b 5d 28             	mov    0x28(%rbp),%ebx
   25822:	44 8b 8d a8 fe ff ff 	mov    -0x158(%rbp),%r9d
   25829:	4c 89 f1             	mov    %r14,%rcx
   2582c:	4d 89 f8             	mov    %r15,%r8
   2582f:	48 8b bd 90 fe ff ff 	mov    -0x170(%rbp),%rdi
   25836:	4c 89 e6             	mov    %r12,%rsi
   25839:	4c 89 ea             	mov    %r13,%rdx
   2583c:	53                   	push   %rbx
   2583d:	ff b5 98 fe ff ff    	push   -0x168(%rbp)
   25843:	ff d0                	call   *%rax
   25845:	41 59                	pop    %r9
   25847:	41 5a                	pop    %r10
   25849:	e9 86 fd ff ff       	jmp    255d4 <JS_CallInternal+0x644>
   2584e:	8b b5 f0 fd ff ff    	mov    -0x210(%rbp),%esi
   25854:	31 d2                	xor    %edx,%edx
   25856:	4c 89 e7             	mov    %r12,%rdi
   25859:	48 83 c3 10          	add    $0x10,%rbx
   2585d:	e8 1e 5b 01 00       	call   3b380 <__JS_AtomToValue>
   25862:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   25866:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2586a:	8b 85 20 fe ff ff    	mov    -0x1e0(%rbp),%eax
   25870:	83 e8 05             	sub    $0x5,%eax
   25873:	48 98                	cltq
   25875:	49 01 c7             	add    %rax,%r15
   25878:	41 0f b6 07          	movzbl (%r15),%eax
   2587c:	4d 8d 6f 01          	lea    0x1(%r15),%r13
   25880:	49 89 c2             	mov    %rax,%r10
   25883:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   25887:	4c 89 f0             	mov    %r14,%rax
   2588a:	4c 89 f9             	mov    %r15,%rcx
   2588d:	e9 bd fe ff ff       	jmp    2574f <JS_CallInternal+0x7bf>
   25892:	48 8b bd 90 fe ff ff 	mov    -0x170(%rbp),%rdi
   25899:	48 8d 35 2e 2c 0b 00 	lea    0xb2c2e(%rip),%rsi        # d84ce <_IO_stdin_used+0x4ce>
   258a0:	31 c0                	xor    %eax,%eax
   258a2:	e8 59 01 01 00       	call   35a00 <JS_ThrowInternalError>
   258a7:	e9 28 fd ff ff       	jmp    255d4 <JS_CallInternal+0x644>
   258ac:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   258b1:	48 89 ce             	mov    %rcx,%rsi
   258b4:	4c 89 ea             	mov    %r13,%rdx
   258b7:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   258be:	e8 0d 8c ff ff       	call   1e4d0 <__JS_FreeValueRT>
   258c3:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   258ca:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   258d0:	41 83 fd 05          	cmp    $0x5,%r13d
   258d4:	0f 84 79 62 00 00    	je     2bb53 <JS_CallInternal+0x6bc3>
   258da:	4c 89 f3             	mov    %r14,%rbx
   258dd:	48 39 9d 48 fe ff ff 	cmp    %rbx,-0x1b8(%rbp)
   258e4:	0f 83 3b fe ff ff    	jae    25725 <JS_CallInternal+0x795>
   258ea:	4c 8b 6b f8          	mov    -0x8(%rbx),%r13
   258ee:	4c 8d 73 f0          	lea    -0x10(%rbx),%r14
   258f2:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   258f6:	41 83 fd f6          	cmp    $0xfffffff6,%r13d
   258fa:	76 d4                	jbe    258d0 <JS_CallInternal+0x940>
   258fc:	8b 41 fc             	mov    -0x4(%rcx),%eax
   258ff:	83 e8 01             	sub    $0x1,%eax
   25902:	89 41 fc             	mov    %eax,-0x4(%rcx)
   25905:	85 c0                	test   %eax,%eax
   25907:	7f c7                	jg     258d0 <JS_CallInternal+0x940>
   25909:	eb a1                	jmp    258ac <JS_CallInternal+0x91c>
   2590b:	31 c9                	xor    %ecx,%ecx
   2590d:	0f b7 95 00 fe ff ff 	movzwl -0x200(%rbp),%edx
   25914:	41 83 fa 77          	cmp    $0x77,%r10d
   25918:	4c 89 e7             	mov    %r12,%rdi
   2591b:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   25922:	0f 94 c1             	sete   %cl
   25925:	e8 86 39 02 00       	call   492b0 <get_var_ref>
   2592a:	49 89 c0             	mov    %rax,%r8
   2592d:	48 85 c0             	test   %rax,%rax
   25930:	0f 85 21 fc ff ff    	jne    25557 <JS_CallInternal+0x5c7>
   25936:	48 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%rbx
   2593d:	e9 7e fd ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   25942:	48 89 bd 80 fe ff ff 	mov    %rdi,-0x180(%rbp)
   25949:	e9 03 f9 ff ff       	jmp    25251 <JS_CallInternal+0x2c1>
   2594e:	48 83 ec 08          	sub    $0x8,%rsp
   25952:	4d 89 e9             	mov    %r13,%r9
   25955:	4c 89 ea             	mov    %r13,%rdx
   25958:	4c 89 e7             	mov    %r12,%rdi
   2595b:	44 89 95 10 fe ff ff 	mov    %r10d,-0x1f0(%rbp)
   25962:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   25969:	b9 f1 00 00 00       	mov    $0xf1,%ecx
   2596e:	6a 00                	push   $0x0
   25970:	48 8b b5 e8 fd ff ff 	mov    -0x218(%rbp),%rsi
   25977:	e8 04 9f 00 00       	call   2f880 <JS_GetPropertyInternal>
   2597c:	5e                   	pop    %rsi
   2597d:	5f                   	pop    %rdi
   2597e:	49 89 c0             	mov    %rax,%r8
   25981:	49 89 d5             	mov    %rdx,%r13
   25984:	83 fa 06             	cmp    $0x6,%edx
   25987:	0f 84 33 fd ff ff    	je     256c0 <JS_CallInternal+0x730>
   2598d:	83 fa ff             	cmp    $0xffffffff,%edx
   25990:	44 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10d
   25997:	0f 84 6e 5a 00 00    	je     2b40b <JS_CallInternal+0x647b>
   2599d:	83 fa f6             	cmp    $0xfffffff6,%edx
   259a0:	0f 86 a4 f9 ff ff    	jbe    2534a <JS_CallInternal+0x3ba>
   259a6:	8b 40 fc             	mov    -0x4(%rax),%eax
   259a9:	83 e8 01             	sub    $0x1,%eax
   259ac:	41 89 40 fc          	mov    %eax,-0x4(%r8)
   259b0:	85 c0                	test   %eax,%eax
   259b2:	0f 8f 92 f9 ff ff    	jg     2534a <JS_CallInternal+0x3ba>
   259b8:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   259bd:	4c 89 c6             	mov    %r8,%rsi
   259c0:	44 89 95 10 fe ff ff 	mov    %r10d,-0x1f0(%rbp)
   259c7:	e8 04 8b ff ff       	call   1e4d0 <__JS_FreeValueRT>
   259cc:	44 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10d
   259d3:	e9 72 f9 ff ff       	jmp    2534a <JS_CallInternal+0x3ba>
   259d8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   259df:	00 
   259e0:	48 8b bd 90 fe ff ff 	mov    -0x170(%rbp),%rdi
   259e7:	48 8d 35 94 41 0b 00 	lea    0xb4194(%rip),%rsi        # d9b82 <_IO_stdin_used+0x1b82>
   259ee:	31 c0                	xor    %eax,%eax
   259f0:	e8 2b de 00 00       	call   33820 <JS_ThrowTypeError>
   259f5:	e9 da fb ff ff       	jmp    255d4 <JS_CallInternal+0x644>
   259fa:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   25a01:	48 8b 95 38 fe ff ff 	mov    -0x1c8(%rbp),%rdx
   25a08:	4c 89 e7             	mov    %r12,%rdi
   25a0b:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   25a11:	48 89 c6             	mov    %rax,%rsi
   25a14:	48 89 95 10 fe ff ff 	mov    %rdx,-0x1f0(%rbp)
   25a1b:	49 89 c5             	mov    %rax,%r13
   25a1e:	e8 fd 9e 04 00       	call   6f920 <JS_HasProperty>
   25a23:	48 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%rdx
   25a2a:	85 c0                	test   %eax,%eax
   25a2c:	0f 8e 46 8c 00 00    	jle    2e678 <JS_CallInternal+0x96e8>
   25a32:	48 83 ec 08          	sub    $0x8,%rsp
   25a36:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   25a3c:	49 89 d1             	mov    %rdx,%r9
   25a3f:	4c 89 ee             	mov    %r13,%rsi
   25a42:	6a 00                	push   $0x0
   25a44:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   25a4b:	4c 89 e7             	mov    %r12,%rdi
   25a4e:	e8 2d 9e 00 00       	call   2f880 <JS_GetPropertyInternal>
   25a53:	41 59                	pop    %r9
   25a55:	41 5a                	pop    %r10
   25a57:	48 89 c1             	mov    %rax,%rcx
   25a5a:	48 89 d0             	mov    %rdx,%rax
   25a5d:	83 fa 06             	cmp    $0x6,%edx
   25a60:	0f 84 5a fc ff ff    	je     256c0 <JS_CallInternal+0x730>
   25a66:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   25a6a:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   25a6e:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   25a72:	48 89 4b f0          	mov    %rcx,-0x10(%rbx)
   25a76:	83 fa f6             	cmp    $0xfffffff6,%edx
   25a79:	0f 86 eb fd ff ff    	jbe    2586a <JS_CallInternal+0x8da>
   25a7f:	8b 46 fc             	mov    -0x4(%rsi),%eax
   25a82:	83 e8 01             	sub    $0x1,%eax
   25a85:	89 46 fc             	mov    %eax,-0x4(%rsi)
   25a88:	85 c0                	test   %eax,%eax
   25a8a:	0f 8f da fd ff ff    	jg     2586a <JS_CallInternal+0x8da>
   25a90:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   25a95:	e8 36 8a ff ff       	call   1e4d0 <__JS_FreeValueRT>
   25a9a:	e9 cb fd ff ff       	jmp    2586a <JS_CallInternal+0x8da>
   25a9f:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   25aa6:	48 8b 95 38 fe ff ff 	mov    -0x1c8(%rbp),%rdx
   25aad:	4c 89 e7             	mov    %r12,%rdi
   25ab0:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   25ab6:	48 89 c6             	mov    %rax,%rsi
   25ab9:	48 89 95 10 fe ff ff 	mov    %rdx,-0x1f0(%rbp)
   25ac0:	49 89 c5             	mov    %rax,%r13
   25ac3:	e8 58 9e 04 00       	call   6f920 <JS_HasProperty>
   25ac8:	85 c0                	test   %eax,%eax
   25aca:	0f 88 f0 fb ff ff    	js     256c0 <JS_CallInternal+0x730>
   25ad0:	48 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%rdx
   25ad7:	b8 03 00 00 00       	mov    $0x3,%eax
   25adc:	b9 00 00 00 00       	mov    $0x0,%ecx
   25ae1:	0f 85 85 76 00 00    	jne    2d16c <JS_CallInternal+0x81dc>
   25ae7:	48 89 0b             	mov    %rcx,(%rbx)
   25aea:	48 83 c3 10          	add    $0x10,%rbx
   25aee:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   25af2:	e9 73 fd ff ff       	jmp    2586a <JS_CallInternal+0x8da>
   25af7:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   25afe:	48 8b 95 38 fe ff ff 	mov    -0x1c8(%rbp),%rdx
   25b05:	45 31 c0             	xor    %r8d,%r8d
   25b08:	4c 89 e7             	mov    %r12,%rdi
   25b0b:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   25b11:	48 89 c6             	mov    %rax,%rsi
   25b14:	e8 17 7b 02 00       	call   4d630 <JS_DeleteProperty>
   25b19:	41 89 c5             	mov    %eax,%r13d
   25b1c:	85 c0                	test   %eax,%eax
   25b1e:	0f 88 9c fb ff ff    	js     256c0 <JS_CallInternal+0x730>
   25b24:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   25b28:	83 f8 f6             	cmp    $0xfffffff6,%eax
   25b2b:	76 15                	jbe    25b42 <JS_CallInternal+0xbb2>
   25b2d:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   25b31:	8b 51 fc             	mov    -0x4(%rcx),%edx
   25b34:	83 ea 01             	sub    $0x1,%edx
   25b37:	89 51 fc             	mov    %edx,-0x4(%rcx)
   25b3a:	85 d2                	test   %edx,%edx
   25b3c:	0f 8e 6e 8b 00 00    	jle    2e6b0 <JS_CallInternal+0x9720>
   25b42:	31 c0                	xor    %eax,%eax
   25b44:	45 85 ed             	test   %r13d,%r13d
   25b47:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   25b4e:	00 
   25b4f:	0f 95 c0             	setne  %al
   25b52:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   25b56:	e9 0f fd ff ff       	jmp    2586a <JS_CallInternal+0x8da>
   25b5b:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   25b62:	48 8b 95 38 fe ff ff 	mov    -0x1c8(%rbp),%rdx
   25b69:	4c 89 e7             	mov    %r12,%rdi
   25b6c:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   25b72:	48 89 c6             	mov    %rax,%rsi
   25b75:	e8 a6 9d 04 00       	call   6f920 <JS_HasProperty>
   25b7a:	85 c0                	test   %eax,%eax
   25b7c:	0f 8e 43 8b 00 00    	jle    2e6c5 <JS_CallInternal+0x9735>
   25b82:	48 83 ec 08          	sub    $0x8,%rsp
   25b86:	4c 8b 43 e0          	mov    -0x20(%rbx),%r8
   25b8a:	4c 8b 4b e8          	mov    -0x18(%rbx),%r9
   25b8e:	4c 89 e7             	mov    %r12,%rdi
   25b91:	4c 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%r10
   25b98:	4c 8b 9d 38 fe ff ff 	mov    -0x1c8(%rbp),%r11
   25b9f:	68 00 80 00 00       	push   $0x8000
   25ba4:	4c 8d 6b e0          	lea    -0x20(%rbx),%r13
   25ba8:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   25bae:	41 53                	push   %r11
   25bb0:	4c 89 d6             	mov    %r10,%rsi
   25bb3:	4c 89 da             	mov    %r11,%rdx
   25bb6:	41 52                	push   %r10
   25bb8:	e8 13 aa 00 00       	call   305d0 <JS_SetPropertyInternal>
   25bbd:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   25bc1:	48 83 c4 20          	add    $0x20,%rsp
   25bc5:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   25bc8:	76 15                	jbe    25bdf <JS_CallInternal+0xc4f>
   25bca:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   25bce:	8b 5e fc             	mov    -0x4(%rsi),%ebx
   25bd1:	8d 53 ff             	lea    -0x1(%rbx),%edx
   25bd4:	89 56 fc             	mov    %edx,-0x4(%rsi)
   25bd7:	85 d2                	test   %edx,%edx
   25bd9:	0f 8e 7b 8a 00 00    	jle    2e65a <JS_CallInternal+0x96ca>
   25bdf:	4c 89 eb             	mov    %r13,%rbx
   25be2:	85 c0                	test   %eax,%eax
   25be4:	0f 89 80 fc ff ff    	jns    2586a <JS_CallInternal+0x8da>
   25bea:	e9 d1 fa ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   25bef:	90                   	nop
   25bf0:	f3 0f 1e fa          	endbr64
   25bf4:	f3 0f 1e fa          	endbr64
   25bf8:	48 8b 85 c0 fe ff ff 	mov    -0x140(%rbp),%rax
   25bff:	4c 89 ea             	mov    %r13,%rdx
   25c02:	44 89 d1             	mov    %r10d,%ecx
   25c05:	4c 89 e7             	mov    %r12,%rdi
   25c08:	48 8d 35 21 62 0b 00 	lea    0xb6221(%rip),%rsi        # dbe30 <_IO_stdin_used+0x3e30>
   25c0f:	4d 89 ef             	mov    %r13,%r15
   25c12:	48 2b 50 18          	sub    0x18(%rax),%rdx
   25c16:	31 c0                	xor    %eax,%eax
   25c18:	83 ea 01             	sub    $0x1,%edx
   25c1b:	e8 e0 fd 00 00       	call   35a00 <JS_ThrowInternalError>
   25c20:	e9 9b fa ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   25c25:	f3 0f 1e fa          	endbr64
   25c29:	f3 0f 1e fa          	endbr64
   25c2d:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
   25c32:	48 8b 8d 88 fe ff ff 	mov    -0x178(%rbp),%rcx
   25c39:	4d 8d 7d 02          	lea    0x2(%r13),%r15
   25c3d:	48 8b 0c c1          	mov    (%rcx,%rax,8),%rcx
   25c41:	4c 8d 0c c5 00 00 00 	lea    0x0(,%rax,8),%r9
   25c48:	00 
   25c49:	48 8b 41 18          	mov    0x18(%rcx),%rax
   25c4d:	48 8b 50 08          	mov    0x8(%rax),%rdx
   25c51:	83 fa 04             	cmp    $0x4,%edx
   25c54:	0f 84 f0 62 00 00    	je     2bf4a <JS_CallInternal+0x6fba>
   25c5a:	80 79 12 00          	cmpb   $0x0,0x12(%rcx)
   25c5e:	0f 85 e6 62 00 00    	jne    2bf4a <JS_CallInternal+0x6fba>
   25c64:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   25c69:	48 8b 08             	mov    (%rax),%rcx
   25c6c:	0f 11 00             	movups %xmm0,(%rax)
   25c6f:	83 fa f6             	cmp    $0xfffffff6,%edx
   25c72:	76 11                	jbe    25c85 <JS_CallInternal+0xcf5>
   25c74:	8b 41 fc             	mov    -0x4(%rcx),%eax
   25c77:	83 e8 01             	sub    $0x1,%eax
   25c7a:	89 41 fc             	mov    %eax,-0x4(%rcx)
   25c7d:	85 c0                	test   %eax,%eax
   25c7f:	0f 8e d3 6b 00 00    	jle    2c858 <JS_CallInternal+0x78c8>
   25c85:	48 83 eb 10          	sub    $0x10,%rbx
   25c89:	41 0f b6 45 02       	movzbl 0x2(%r13),%eax
   25c8e:	49 83 c5 03          	add    $0x3,%r13
   25c92:	49 89 c2             	mov    %rax,%r10
   25c95:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   25c99:	ff e0                	jmp    *%rax
   25c9b:	f3 0f 1e fa          	endbr64
   25c9f:	f3 0f 1e fa          	endbr64
   25ca3:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
   25ca8:	48 8b 95 88 fe ff ff 	mov    -0x178(%rbp),%rdx
   25caf:	4d 8d 7d 02          	lea    0x2(%r13),%r15
   25cb3:	48 8d 0c c5 00 00 00 	lea    0x0(,%rax,8),%rcx
   25cba:	00 
   25cbb:	48 8b 04 c2          	mov    (%rdx,%rax,8),%rax
   25cbf:	48 8b 40 18          	mov    0x18(%rax),%rax
   25cc3:	48 8b 10             	mov    (%rax),%rdx
   25cc6:	48 8b 40 08          	mov    0x8(%rax),%rax
   25cca:	83 f8 04             	cmp    $0x4,%eax
   25ccd:	0f 84 bd 6d 00 00    	je     2ca90 <JS_CallInternal+0x7b00>
   25cd3:	83 f8 f6             	cmp    $0xfffffff6,%eax
   25cd6:	76 04                	jbe    25cdc <JS_CallInternal+0xd4c>
   25cd8:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   25cdc:	48 89 13             	mov    %rdx,(%rbx)
   25cdf:	48 89 43 08          	mov    %rax,0x8(%rbx)
   25ce3:	41 0f b6 45 02       	movzbl 0x2(%r13),%eax
   25ce8:	48 83 c3 10          	add    $0x10,%rbx
   25cec:	49 83 c5 03          	add    $0x3,%r13
   25cf0:	49 89 c2             	mov    %rax,%r10
   25cf3:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   25cf7:	ff e0                	jmp    *%rax
   25cf9:	f3 0f 1e fa          	endbr64
   25cfd:	f3 0f 1e fa          	endbr64
   25d01:	45 0f b7 4d 00       	movzwl 0x0(%r13),%r9d
   25d06:	4d 8d 7d 02          	lea    0x2(%r13),%r15
   25d0a:	4c 89 e7             	mov    %r12,%rdi
   25d0d:	48 8b 8d b8 fe ff ff 	mov    -0x148(%rbp),%rcx
   25d14:	44 89 95 f0 fd ff ff 	mov    %r10d,-0x210(%rbp)
   25d1b:	45 0f b7 d9          	movzwl %r9w,%r11d
   25d1f:	4c 89 79 30          	mov    %r15,0x30(%rcx)
   25d23:	49 c1 e3 04          	shl    $0x4,%r11
   25d27:	44 89 8d 10 fe ff ff 	mov    %r9d,-0x1f0(%rbp)
   25d2e:	4c 89 d8             	mov    %r11,%rax
   25d31:	49 89 db             	mov    %rbx,%r11
   25d34:	49 29 c3             	sub    %rax,%r11
   25d37:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   25d3e:	4d 8b 43 e8          	mov    -0x18(%r11),%r8
   25d42:	49 8b 4b e0          	mov    -0x20(%r11),%rcx
   25d46:	49 8b 73 f0          	mov    -0x10(%r11),%rsi
   25d4a:	49 8b 53 f8          	mov    -0x8(%r11),%rdx
   25d4e:	6a 00                	push   $0x0
   25d50:	41 53                	push   %r11
   25d52:	4c 89 9d 00 fe ff ff 	mov    %r11,-0x200(%rbp)
   25d59:	6a 03                	push   $0x3
   25d5b:	6a 00                	push   $0x0
   25d5d:	e8 2e f2 ff ff       	call   24f90 <JS_CallInternal>
   25d62:	48 83 c4 20          	add    $0x20,%rsp
   25d66:	49 89 c0             	mov    %rax,%r8
   25d69:	48 89 d0             	mov    %rdx,%rax
   25d6c:	83 fa 06             	cmp    $0x6,%edx
   25d6f:	0f 84 4b f9 ff ff    	je     256c0 <JS_CallInternal+0x730>
   25d75:	4c 89 c1             	mov    %r8,%rcx
   25d78:	83 bd f0 fd ff ff 25 	cmpl   $0x25,-0x210(%rbp)
   25d7f:	0f 84 fd f9 ff ff    	je     25782 <JS_CallInternal+0x7f2>
   25d85:	4c 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%r11
   25d8c:	4c 8b bd 30 fe ff ff 	mov    -0x1d0(%rbp),%r15
   25d93:	4c 89 ad 00 fe ff ff 	mov    %r13,-0x200(%rbp)
   25d9a:	4d 89 e5             	mov    %r12,%r13
   25d9d:	48 89 9d 30 fe ff ff 	mov    %rbx,-0x1d0(%rbp)
   25da4:	4f 8d 24 1f          	lea    (%r15,%r11,1),%r12
   25da8:	4d 8d 7b e0          	lea    -0x20(%r11),%r15
   25dac:	eb 1f                	jmp    25dcd <JS_CallInternal+0xe3d>
   25dae:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   25db5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   25dbc:	00 00 00 00 
   25dc0:	49 83 c7 10          	add    $0x10,%r15
   25dc4:	4d 39 e7             	cmp    %r12,%r15
   25dc7:	0f 84 dd 56 00 00    	je     2b4aa <JS_CallInternal+0x651a>
   25dcd:	49 8b 4f 08          	mov    0x8(%r15),%rcx
   25dd1:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   25dd4:	76 ea                	jbe    25dc0 <JS_CallInternal+0xe30>
   25dd6:	49 8b 37             	mov    (%r15),%rsi
   25dd9:	8b 5e fc             	mov    -0x4(%rsi),%ebx
   25ddc:	8d 53 ff             	lea    -0x1(%rbx),%edx
   25ddf:	89 56 fc             	mov    %edx,-0x4(%rsi)
   25de2:	85 d2                	test   %edx,%edx
   25de4:	7f da                	jg     25dc0 <JS_CallInternal+0xe30>
   25de6:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   25dea:	48 89 ca             	mov    %rcx,%rdx
   25ded:	4c 89 85 20 fe ff ff 	mov    %r8,-0x1e0(%rbp)
   25df4:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   25dfb:	e8 d0 86 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   25e00:	4c 8b 85 20 fe ff ff 	mov    -0x1e0(%rbp),%r8
   25e07:	48 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%rax
   25e0e:	eb b0                	jmp    25dc0 <JS_CallInternal+0xe30>
   25e10:	f3 0f 1e fa          	endbr64
   25e14:	f3 0f 1e fa          	endbr64
   25e18:	45 0f b7 4d 00       	movzwl 0x0(%r13),%r9d
   25e1d:	4d 8d 7d 02          	lea    0x2(%r13),%r15
   25e21:	e9 55 f5 ff ff       	jmp    2537b <JS_CallInternal+0x3eb>
   25e26:	f3 0f 1e fa          	endbr64
   25e2a:	f3 0f 1e fa          	endbr64
   25e2e:	31 c0                	xor    %eax,%eax
   25e30:	b9 02 00 00 00       	mov    $0x2,%ecx
   25e35:	e9 06 f9 ff ff       	jmp    25740 <JS_CallInternal+0x7b0>
   25e3a:	f3 0f 1e fa          	endbr64
   25e3e:	f3 0f 1e fa          	endbr64
   25e42:	48 83 ec 08          	sub    $0x8,%rsp
   25e46:	31 c0                	xor    %eax,%eax
   25e48:	41 83 fa 54          	cmp    $0x54,%r10d
   25e4c:	41 0f b6 4d 04       	movzbl 0x4(%r13),%ecx
   25e51:	0f 94 c0             	sete   %al
   25e54:	41 8b 55 00          	mov    0x0(%r13),%edx
   25e58:	48 89 de             	mov    %rbx,%rsi
   25e5b:	4c 89 e7             	mov    %r12,%rdi
   25e5e:	50                   	push   %rax
   25e5f:	4c 8b 8d b8 fe ff ff 	mov    -0x148(%rbp),%r9
   25e66:	4d 8d 7d 05          	lea    0x5(%r13),%r15
   25e6a:	4c 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%r8
   25e71:	e8 0a c0 06 00       	call   91e80 <js_op_define_class>
   25e76:	41 58                	pop    %r8
   25e78:	41 59                	pop    %r9
   25e7a:	83 f8 ff             	cmp    $0xffffffff,%eax
   25e7d:	0f 84 3d f8 ff ff    	je     256c0 <JS_CallInternal+0x730>
   25e83:	41 0f b6 45 05       	movzbl 0x5(%r13),%eax
   25e88:	49 83 c5 06          	add    $0x6,%r13
   25e8c:	49 89 c2             	mov    %rax,%r10
   25e8f:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   25e93:	ff e0                	jmp    *%rax
   25e95:	f3 0f 1e fa          	endbr64
   25e99:	f3 0f 1e fa          	endbr64
   25e9d:	41 83 fa 52          	cmp    $0x52,%r10d
   25ea1:	0f 94 85 10 fe ff ff 	sete   -0x1f0(%rbp)
   25ea8:	0f 84 7a 5e 00 00    	je     2bd28 <JS_CallInternal+0x6d98>
   25eae:	41 8b 45 00          	mov    0x0(%r13),%eax
   25eb2:	4d 8d 7d 04          	lea    0x4(%r13),%r15
   25eb6:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   25ebc:	0f b6 8d 10 fe ff ff 	movzbl -0x1f0(%rbp),%ecx
   25ec3:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
   25ec8:	41 0f b6 17          	movzbl (%r15),%edx
   25ecc:	bf 03 00 00 00       	mov    $0x3,%edi
   25ed1:	48 c7 85 e0 fd ff ff 	movq   $0x0,-0x220(%rbp)
   25ed8:	00 00 00 00 
   25edc:	29 c8                	sub    %ecx,%eax
   25ede:	89 8d d4 fd ff ff    	mov    %ecx,-0x22c(%rbp)
   25ee4:	48 98                	cltq
   25ee6:	48 89 bd a8 fd ff ff 	mov    %rdi,-0x258(%rbp)
   25eed:	48 c1 e0 04          	shl    $0x4,%rax
   25ef1:	48 89 bd 98 fd ff ff 	mov    %rdi,-0x268(%rbp)
   25ef8:	48 c7 85 d8 fd ff ff 	movq   $0x3,-0x228(%rbp)
   25eff:	03 00 00 00 
   25f03:	48 01 d8             	add    %rbx,%rax
   25f06:	48 8b 08             	mov    (%rax),%rcx
   25f09:	48 8b 40 08          	mov    0x8(%rax),%rax
   25f0d:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   25f14:	89 d0                	mov    %edx,%eax
   25f16:	83 e0 04             	and    $0x4,%eax
   25f19:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   25f20:	3c 01                	cmp    $0x1,%al
   25f22:	19 c0                	sbb    %eax,%eax
   25f24:	31 f6                	xor    %esi,%esi
   25f26:	83 e0 fc             	and    $0xfffffffc,%eax
   25f29:	48 89 b5 a0 fd ff ff 	mov    %rsi,-0x260(%rbp)
   25f30:	48 89 b5 90 fd ff ff 	mov    %rsi,-0x270(%rbp)
   25f37:	05 05 45 00 00       	add    $0x4505,%eax
   25f3c:	83 e2 03             	and    $0x3,%edx
   25f3f:	0f 85 80 56 00 00    	jne    2b5c5 <JS_CallInternal+0x6635>
   25f45:	0d 02 22 00 00       	or     $0x2202,%eax
   25f4a:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   25f4e:	4c 8d 6b f0          	lea    -0x10(%rbx),%r13
   25f52:	4c 89 e7             	mov    %r12,%rdi
   25f55:	89 85 d0 fd ff ff    	mov    %eax,-0x230(%rbp)
   25f5b:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   25f5f:	48 89 8d e0 fd ff ff 	mov    %rcx,-0x220(%rbp)
   25f66:	8b b5 30 fe ff ff    	mov    -0x1d0(%rbp),%esi
   25f6c:	48 89 85 20 fe ff ff 	mov    %rax,-0x1e0(%rbp)
   25f73:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   25f77:	49 8b 45 08          	mov    0x8(%r13),%rax
   25f7b:	48 89 8d d8 fd ff ff 	mov    %rcx,-0x228(%rbp)
   25f82:	48 89 85 e8 fd ff ff 	mov    %rax,-0x218(%rbp)
   25f89:	e8 32 d9 01 00       	call   438c0 <js_get_function_name>
   25f8e:	49 89 c0             	mov    %rax,%r8
   25f91:	49 89 d1             	mov    %rdx,%r9
   25f94:	41 83 f9 06          	cmp    $0x6,%r9d
   25f98:	0f 84 91 69 00 00    	je     2c92f <JS_CallInternal+0x799f>
   25f9e:	48 83 ec 08          	sub    $0x8,%rsp
   25fa2:	48 8b b5 20 fe ff ff 	mov    -0x1e0(%rbp),%rsi
   25fa9:	b9 3a 00 00 00       	mov    $0x3a,%ecx
   25fae:	4c 89 e7             	mov    %r12,%rdi
   25fb1:	6a 01                	push   $0x1
   25fb3:	48 8b 95 e8 fd ff ff 	mov    -0x218(%rbp),%rdx
   25fba:	e8 31 c9 00 00       	call   328f0 <JS_DefinePropertyValue>
   25fbf:	41 5a                	pop    %r10
   25fc1:	41 5b                	pop    %r11
   25fc3:	85 c0                	test   %eax,%eax
   25fc5:	0f 88 64 69 00 00    	js     2c92f <JS_CallInternal+0x799f>
   25fcb:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   25fd2:	4c 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8
   25fd9:	4c 89 e7             	mov    %r12,%rdi
   25fdc:	48 8b b5 20 fe ff ff 	mov    -0x1e0(%rbp),%rsi
   25fe3:	48 8b 95 e8 fd ff ff 	mov    -0x218(%rbp),%rdx
   25fea:	e8 81 9f ff ff       	call   1ff70 <js_method_set_home_object>
   25fef:	8b 85 d0 fd ff ff    	mov    -0x230(%rbp),%eax
   25ff5:	48 83 ec 08          	sub    $0x8,%rsp
   25ff9:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   25fff:	4c 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%r8
   26006:	4c 8b 8d d8 fd ff ff 	mov    -0x228(%rbp),%r9
   2600d:	4c 89 e7             	mov    %r12,%rdi
   26010:	48 8b b5 00 fe ff ff 	mov    -0x200(%rbp),%rsi
   26017:	48 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%rdx
   2601e:	50                   	push   %rax
   2601f:	ff b5 98 fd ff ff    	push   -0x268(%rbp)
   26025:	ff b5 90 fd ff ff    	push   -0x270(%rbp)
   2602b:	ff b5 a8 fd ff ff    	push   -0x258(%rbp)
   26031:	ff b5 a0 fd ff ff    	push   -0x260(%rbp)
   26037:	e8 24 ba 00 00       	call   31a60 <JS_DefineProperty>
   2603c:	48 83 c4 30          	add    $0x30,%rsp
   26040:	89 c1                	mov    %eax,%ecx
   26042:	49 8b 45 08          	mov    0x8(%r13),%rax
   26046:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26049:	76 15                	jbe    26060 <JS_CallInternal+0x10d0>
   2604b:	49 8b 75 00          	mov    0x0(%r13),%rsi
   2604f:	8b 56 fc             	mov    -0x4(%rsi),%edx
   26052:	83 ea 01             	sub    $0x1,%edx
   26055:	89 56 fc             	mov    %edx,-0x4(%rsi)
   26058:	85 d2                	test   %edx,%edx
   2605a:	0f 8e 0a 68 00 00    	jle    2c86a <JS_CallInternal+0x78da>
   26060:	80 bd 10 fe ff ff 00 	cmpb   $0x0,-0x1f0(%rbp)
   26067:	0f 85 d5 56 00 00    	jne    2b742 <JS_CallInternal+0x67b2>
   2606d:	8b 85 d4 fd ff ff    	mov    -0x22c(%rbp),%eax
   26073:	83 c0 01             	add    $0x1,%eax
   26076:	48 98                	cltq
   26078:	48 c1 e0 04          	shl    $0x4,%rax
   2607c:	48 29 c3             	sub    %rax,%rbx
   2607f:	85 c9                	test   %ecx,%ecx
   26081:	0f 88 54 69 00 00    	js     2c9db <JS_CallInternal+0x7a4b>
   26087:	41 0f b6 47 01       	movzbl 0x1(%r15),%eax
   2608c:	4d 8d 6f 02          	lea    0x2(%r15),%r13
   26090:	49 89 c2             	mov    %rax,%r10
   26093:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   26097:	f3 0f 1e fa          	endbr64
   2609b:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   260a0:	49 83 c5 01          	add    $0x1,%r13
   260a4:	49 89 c2             	mov    %rax,%r10
   260a7:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   260ab:	ff e0                	jmp    *%rax
   260ad:	f3 0f 1e fa          	endbr64
   260b1:	31 c0                	xor    %eax,%eax
   260b3:	b9 03 00 00 00       	mov    $0x3,%ecx
   260b8:	e9 83 f6 ff ff       	jmp    25740 <JS_CallInternal+0x7b0>
   260bd:	f3 0f 1e fa          	endbr64
   260c1:	b8 03 00 00 00       	mov    $0x3,%eax
   260c6:	31 c9                	xor    %ecx,%ecx
   260c8:	e9 73 f6 ff ff       	jmp    25740 <JS_CallInternal+0x7b0>
   260cd:	f3 0f 1e fa          	endbr64
   260d1:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   260d8:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   260dc:	4c 89 e7             	mov    %r12,%rdi
   260df:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   260e3:	4c 89 68 30          	mov    %r13,0x30(%rax)
   260e7:	e8 04 05 02 00       	call   465f0 <JS_ValueToAtom>
   260ec:	89 c1                	mov    %eax,%ecx
   260ee:	85 c0                	test   %eax,%eax
   260f0:	0f 84 1f 8e 00 00    	je     2ef15 <JS_CallInternal+0x9f85>
   260f6:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   260fa:	83 fa 03             	cmp    $0x3,%edx
   260fd:	0f 84 75 7e 00 00    	je     2df78 <JS_CallInternal+0x8fe8>
   26103:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   26107:	4c 89 e7             	mov    %r12,%rdi
   2610a:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   26110:	e8 0b 98 04 00       	call   6f920 <JS_HasProperty>
   26115:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2611b:	85 c0                	test   %eax,%eax
   2611d:	0f 8e 95 7f 00 00    	jle    2e0b8 <JS_CallInternal+0x9128>
   26123:	48 83 ec 08          	sub    $0x8,%rsp
   26127:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   2612b:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   2612f:	4c 89 e7             	mov    %r12,%rdi
   26132:	6a 00                	push   $0x0
   26134:	49 89 f0             	mov    %rsi,%r8
   26137:	49 89 d1             	mov    %rdx,%r9
   2613a:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   26140:	e8 3b 97 00 00       	call   2f880 <JS_GetPropertyInternal>
   26145:	59                   	pop    %rcx
   26146:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2614c:	49 89 c7             	mov    %rax,%r15
   2614f:	5e                   	pop    %rsi
   26150:	48 89 d0             	mov    %rdx,%rax
   26153:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   26159:	0f 8f 29 67 00 00    	jg     2c888 <JS_CallInternal+0x78f8>
   2615f:	83 fa 06             	cmp    $0x6,%edx
   26162:	0f 84 90 81 00 00    	je     2e2f8 <JS_CallInternal+0x9368>
   26168:	4c 89 3b             	mov    %r15,(%rbx)
   2616b:	49 83 c5 01          	add    $0x1,%r13
   2616f:	48 83 c3 10          	add    $0x10,%rbx
   26173:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   26177:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2617c:	49 89 c2             	mov    %rax,%r10
   2617f:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26183:	ff e0                	jmp    *%rax
   26185:	f3 0f 1e fa          	endbr64
   26189:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   2618d:	4c 8b 7b f8          	mov    -0x8(%rbx),%r15
   26191:	83 f8 ff             	cmp    $0xffffffff,%eax
   26194:	0f 85 87 64 00 00    	jne    2c621 <JS_CallInternal+0x7691>
   2619a:	45 85 ff             	test   %r15d,%r15d
   2619d:	0f 85 39 81 00 00    	jne    2e2dc <JS_CallInternal+0x934c>
   261a3:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   261a7:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   261ab:	66 83 7a 12 02       	cmpw   $0x2,0x12(%rdx)
   261b0:	0f 85 ea 64 00 00    	jne    2c6a0 <JS_CallInternal+0x7710>
   261b6:	3b 42 38             	cmp    0x38(%rdx),%eax
   261b9:	0f 83 e1 64 00 00    	jae    2c6a0 <JS_CallInternal+0x7710>
   261bf:	89 c0                	mov    %eax,%eax
   261c1:	48 c1 e0 04          	shl    $0x4,%rax
   261c5:	48 03 42 30          	add    0x30(%rdx),%rax
   261c9:	48 8b 10             	mov    (%rax),%rdx
   261cc:	48 8b 40 08          	mov    0x8(%rax),%rax
   261d0:	83 f8 f6             	cmp    $0xfffffff6,%eax
   261d3:	76 04                	jbe    261d9 <JS_CallInternal+0x1249>
   261d5:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   261d9:	48 89 13             	mov    %rdx,(%rbx)
   261dc:	49 83 c5 01          	add    $0x1,%r13
   261e0:	48 83 c3 10          	add    $0x10,%rbx
   261e4:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   261e8:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   261ed:	49 89 c2             	mov    %rax,%r10
   261f0:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   261f4:	ff e0                	jmp    *%rax
   261f6:	f3 0f 1e fa          	endbr64
   261fa:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   261fe:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   26202:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   26206:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2620a:	83 fe ff             	cmp    $0xffffffff,%esi
   2620d:	0f 85 f3 5e 00 00    	jne    2c106 <JS_CallInternal+0x7176>
   26213:	85 c9                	test   %ecx,%ecx
   26215:	0f 85 eb 5e 00 00    	jne    2c106 <JS_CallInternal+0x7176>
   2621b:	66 83 7a 12 02       	cmpw   $0x2,0x12(%rdx)
   26220:	0f 85 e0 5e 00 00    	jne    2c106 <JS_CallInternal+0x7176>
   26226:	3b 42 38             	cmp    0x38(%rdx),%eax
   26229:	0f 83 d7 5e 00 00    	jae    2c106 <JS_CallInternal+0x7176>
   2622f:	89 c0                	mov    %eax,%eax
   26231:	48 c1 e0 04          	shl    $0x4,%rax
   26235:	48 03 42 30          	add    0x30(%rdx),%rax
   26239:	48 8b 10             	mov    (%rax),%rdx
   2623c:	48 8b 40 08          	mov    0x8(%rax),%rax
   26240:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26243:	76 04                	jbe    26249 <JS_CallInternal+0x12b9>
   26245:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   26249:	48 89 53 f0          	mov    %rdx,-0x10(%rbx)
   2624d:	49 83 c5 01          	add    $0x1,%r13
   26251:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   26255:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2625a:	49 89 c2             	mov    %rax,%r10
   2625d:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26261:	ff e0                	jmp    *%rax
   26263:	f3 0f 1e fa          	endbr64
   26267:	4c 8b 4b e8          	mov    -0x18(%rbx),%r9
   2626b:	4c 8b 7b e0          	mov    -0x20(%rbx),%r15
   2626f:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   26273:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   26277:	41 83 f9 ff          	cmp    $0xffffffff,%r9d
   2627b:	0f 85 42 5e 00 00    	jne    2c0c3 <JS_CallInternal+0x7133>
   26281:	85 c0                	test   %eax,%eax
   26283:	0f 85 3a 5e 00 00    	jne    2c0c3 <JS_CallInternal+0x7133>
   26289:	66 41 83 7f 12 02    	cmpw   $0x2,0x12(%r15)
   2628f:	0f 85 2e 5e 00 00    	jne    2c0c3 <JS_CallInternal+0x7133>
   26295:	41 3b 57 38          	cmp    0x38(%r15),%edx
   26299:	0f 83 24 5e 00 00    	jae    2c0c3 <JS_CallInternal+0x7133>
   2629f:	89 d0                	mov    %edx,%eax
   262a1:	48 c1 e0 04          	shl    $0x4,%rax
   262a5:	49 03 47 30          	add    0x30(%r15),%rax
   262a9:	48 8b 08             	mov    (%rax),%rcx
   262ac:	48 8b 40 08          	mov    0x8(%rax),%rax
   262b0:	83 f8 f6             	cmp    $0xfffffff6,%eax
   262b3:	76 04                	jbe    262b9 <JS_CallInternal+0x1329>
   262b5:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   262b9:	41 83 f9 f6          	cmp    $0xfffffff6,%r9d
   262bd:	76 13                	jbe    262d2 <JS_CallInternal+0x1342>
   262bf:	41 8b 77 fc          	mov    -0x4(%r15),%esi
   262c3:	8d 56 ff             	lea    -0x1(%rsi),%edx
   262c6:	41 89 57 fc          	mov    %edx,-0x4(%r15)
   262ca:	85 d2                	test   %edx,%edx
   262cc:	0f 8e f4 6c 00 00    	jle    2cfc6 <JS_CallInternal+0x8036>
   262d2:	48 89 4b e0          	mov    %rcx,-0x20(%rbx)
   262d6:	49 83 c5 01          	add    $0x1,%r13
   262da:	48 83 eb 10          	sub    $0x10,%rbx
   262de:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   262e2:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   262e7:	49 89 c2             	mov    %rax,%r10
   262ea:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   262ee:	ff e0                	jmp    *%rax
   262f0:	f3 0f 1e fa          	endbr64
   262f4:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   262f8:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   262fc:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   26300:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   26304:	89 c6                	mov    %eax,%esi
   26306:	09 d6                	or     %edx,%esi
   26308:	0f 85 29 74 00 00    	jne    2d737 <JS_CallInternal+0x87a7>
   2630e:	48 63 f1             	movslq %ecx,%rsi
   26311:	48 63 c7             	movslq %edi,%rax
   26314:	8d 14 39             	lea    (%rcx,%rdi,1),%edx
   26317:	48 01 f0             	add    %rsi,%rax
   2631a:	48 63 ca             	movslq %edx,%rcx
   2631d:	48 39 c1             	cmp    %rax,%rcx
   26320:	0f 85 f6 73 00 00    	jne    2d71c <JS_CallInternal+0x878c>
   26326:	89 d0                	mov    %edx,%eax
   26328:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   2632f:	00 
   26330:	48 89 43 e0          	mov    %rax,-0x20(%rbx)
   26334:	48 83 eb 10          	sub    $0x10,%rbx
   26338:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2633d:	49 83 c5 01          	add    $0x1,%r13
   26341:	49 89 c2             	mov    %rax,%r10
   26344:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26348:	ff e0                	jmp    *%rax
   2634a:	f3 0f 1e fa          	endbr64
   2634e:	41 0f b6 7d 00       	movzbl 0x0(%r13),%edi
   26353:	48 8b 8d b8 fe ff ff 	mov    -0x148(%rbp),%rcx
   2635a:	4d 8d 7d 01          	lea    0x1(%r13),%r15
   2635e:	45 31 c9             	xor    %r9d,%r9d
   26361:	89 fa                	mov    %edi,%edx
   26363:	89 f8                	mov    %edi,%eax
   26365:	4c 89 79 30          	mov    %r15,0x30(%rcx)
   26369:	c1 fa 02             	sar    $0x2,%edx
   2636c:	83 e0 03             	and    $0x3,%eax
   2636f:	83 e2 07             	and    $0x7,%edx
   26372:	f7 d0                	not    %eax
   26374:	f7 d2                	not    %edx
   26376:	48 98                	cltq
   26378:	48 63 d2             	movslq %edx,%rdx
   2637b:	48 c1 e0 04          	shl    $0x4,%rax
   2637f:	48 c1 e2 04          	shl    $0x4,%rdx
   26383:	48 01 d8             	add    %rbx,%rax
   26386:	48 01 da             	add    %rbx,%rdx
   26389:	48 8b 30             	mov    (%rax),%rsi
   2638c:	48 8b 0a             	mov    (%rdx),%rcx
   2638f:	4c 8b 42 08          	mov    0x8(%rdx),%r8
   26393:	48 8b 50 08          	mov    0x8(%rax),%rdx
   26397:	89 f8                	mov    %edi,%eax
   26399:	4c 89 e7             	mov    %r12,%rdi
   2639c:	c1 f8 05             	sar    $0x5,%eax
   2639f:	f7 d0                	not    %eax
   263a1:	48 98                	cltq
   263a3:	48 c1 e0 04          	shl    $0x4,%rax
   263a7:	ff 74 03 08          	push   0x8(%rbx,%rax,1)
   263ab:	ff 34 03             	push   (%rbx,%rax,1)
   263ae:	e8 4d d3 06 00       	call   93700 <JS_CopyDataProperties>
   263b3:	59                   	pop    %rcx
   263b4:	5e                   	pop    %rsi
   263b5:	85 c0                	test   %eax,%eax
   263b7:	0f 85 03 f3 ff ff    	jne    256c0 <JS_CallInternal+0x730>
   263bd:	41 0f b6 45 01       	movzbl 0x1(%r13),%eax
   263c2:	49 83 c5 02          	add    $0x2,%r13
   263c6:	49 89 c2             	mov    %rax,%r10
   263c9:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   263cd:	ff e0                	jmp    *%rax
   263cf:	f3 0f 1e fa          	endbr64
   263d3:	45 0f b7 4d 00       	movzwl 0x0(%r13),%r9d
   263d8:	49 89 da             	mov    %rbx,%r10
   263db:	4d 8d 7d 02          	lea    0x2(%r13),%r15
   263df:	4c 89 e7             	mov    %r12,%rdi
   263e2:	4c 89 c8             	mov    %r9,%rax
   263e5:	44 89 8d 30 fe ff ff 	mov    %r9d,-0x1d0(%rbp)
   263ec:	48 c1 e0 04          	shl    $0x4,%rax
   263f0:	49 29 c2             	sub    %rax,%r10
   263f3:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   263fa:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   26401:	49 8b 4a f0          	mov    -0x10(%r10),%rcx
   26405:	49 8b 72 e0          	mov    -0x20(%r10),%rsi
   26409:	4d 8b 42 f8          	mov    -0x8(%r10),%r8
   2640d:	49 8b 52 e8          	mov    -0x18(%r10),%rdx
   26411:	4c 89 78 30          	mov    %r15,0x30(%rax)
   26415:	6a 00                	push   $0x0
   26417:	41 52                	push   %r10
   26419:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   26420:	e8 bb 40 07 00       	call   9a4e0 <JS_CallConstructorInternal>
   26425:	59                   	pop    %rcx
   26426:	5e                   	pop    %rsi
   26427:	83 fa 06             	cmp    $0x6,%edx
   2642a:	0f 84 90 f2 ff ff    	je     256c0 <JS_CallInternal+0x730>
   26430:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   26437:	48 89 95 f0 fd ff ff 	mov    %rdx,-0x210(%rbp)
   2643e:	48 89 9d 10 fe ff ff 	mov    %rbx,-0x1f0(%rbp)
   26445:	4d 8d 7a e0          	lea    -0x20(%r10),%r15
   26449:	4c 03 95 00 fe ff ff 	add    -0x200(%rbp),%r10
   26450:	4c 89 ad 00 fe ff ff 	mov    %r13,-0x200(%rbp)
   26457:	4d 89 e5             	mov    %r12,%r13
   2645a:	4d 89 d4             	mov    %r10,%r12
   2645d:	eb 0e                	jmp    2646d <JS_CallInternal+0x14dd>
   2645f:	90                   	nop
   26460:	49 83 c7 10          	add    $0x10,%r15
   26464:	4d 39 e7             	cmp    %r12,%r15
   26467:	0f 84 0f 52 00 00    	je     2b67c <JS_CallInternal+0x66ec>
   2646d:	49 8b 4f 08          	mov    0x8(%r15),%rcx
   26471:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   26474:	76 ea                	jbe    26460 <JS_CallInternal+0x14d0>
   26476:	49 8b 37             	mov    (%r15),%rsi
   26479:	8b 5e fc             	mov    -0x4(%rsi),%ebx
   2647c:	8d 53 ff             	lea    -0x1(%rbx),%edx
   2647f:	89 56 fc             	mov    %edx,-0x4(%rsi)
   26482:	85 d2                	test   %edx,%edx
   26484:	7f da                	jg     26460 <JS_CallInternal+0x14d0>
   26486:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2648a:	48 89 ca             	mov    %rcx,%rdx
   2648d:	48 89 85 20 fe ff ff 	mov    %rax,-0x1e0(%rbp)
   26494:	e8 37 80 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   26499:	48 8b 85 20 fe ff ff 	mov    -0x1e0(%rbp),%rax
   264a0:	eb be                	jmp    26460 <JS_CallInternal+0x14d0>
   264a2:	f3 0f 1e fa          	endbr64
   264a6:	4d 8d 7d 02          	lea    0x2(%r13),%r15
   264aa:	45 0f b7 4d 00       	movzwl 0x0(%r13),%r9d
   264af:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   264b3:	4c 89 e7             	mov    %r12,%rdi
   264b6:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   264bd:	48 8b 53 d8          	mov    -0x28(%rbx),%rdx
   264c1:	4c 8d 43 e0          	lea    -0x20(%rbx),%r8
   264c5:	b9 02 00 00 00       	mov    $0x2,%ecx
   264ca:	4c 89 85 30 fe ff ff 	mov    %r8,-0x1d0(%rbp)
   264d1:	4c 89 78 30          	mov    %r15,0x30(%rax)
   264d5:	e8 a6 54 08 00       	call   ab980 <js_function_apply>
   264da:	48 89 d1             	mov    %rdx,%rcx
   264dd:	83 fa 06             	cmp    $0x6,%edx
   264e0:	0f 84 da f1 ff ff    	je     256c0 <JS_CallInternal+0x730>
   264e6:	48 8b 73 d8          	mov    -0x28(%rbx),%rsi
   264ea:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   264f1:	83 fe f6             	cmp    $0xfffffff6,%esi
   264f4:	76 15                	jbe    2650b <JS_CallInternal+0x157b>
   264f6:	48 8b 7b d0          	mov    -0x30(%rbx),%rdi
   264fa:	8b 57 fc             	mov    -0x4(%rdi),%edx
   264fd:	83 ea 01             	sub    $0x1,%edx
   26500:	89 57 fc             	mov    %edx,-0x4(%rdi)
   26503:	85 d2                	test   %edx,%edx
   26505:	0f 8e 6a 6b 00 00    	jle    2d075 <JS_CallInternal+0x80e5>
   2650b:	49 8b 70 08          	mov    0x8(%r8),%rsi
   2650f:	83 fe f6             	cmp    $0xfffffff6,%esi
   26512:	76 14                	jbe    26528 <JS_CallInternal+0x1598>
   26514:	49 8b 38             	mov    (%r8),%rdi
   26517:	8b 57 fc             	mov    -0x4(%rdi),%edx
   2651a:	83 ea 01             	sub    $0x1,%edx
   2651d:	89 57 fc             	mov    %edx,-0x4(%rdi)
   26520:	85 d2                	test   %edx,%edx
   26522:	0f 8e cf 6a 00 00    	jle    2cff7 <JS_CallInternal+0x8067>
   26528:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   2652c:	83 fe f6             	cmp    $0xfffffff6,%esi
   2652f:	76 15                	jbe    26546 <JS_CallInternal+0x15b6>
   26531:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   26535:	8b 57 fc             	mov    -0x4(%rdi),%edx
   26538:	83 ea 01             	sub    $0x1,%edx
   2653b:	89 57 fc             	mov    %edx,-0x4(%rdi)
   2653e:	85 d2                	test   %edx,%edx
   26540:	0f 8e f0 6a 00 00    	jle    2d036 <JS_CallInternal+0x80a6>
   26546:	48 89 43 d0          	mov    %rax,-0x30(%rbx)
   2654a:	49 83 c5 03          	add    $0x3,%r13
   2654e:	48 89 4b d8          	mov    %rcx,-0x28(%rbx)
   26552:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   26557:	4c 89 c3             	mov    %r8,%rbx
   2655a:	49 89 c2             	mov    %rax,%r10
   2655d:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26561:	ff e0                	jmp    *%rax
   26563:	f3 0f 1e fa          	endbr64
   26567:	49 8b 74 24 30       	mov    0x30(%r12),%rsi
   2656c:	41 0f b7 4d 00       	movzwl 0x0(%r13),%ecx
   26571:	ba 02 00 00 00       	mov    $0x2,%edx
   26576:	4c 89 e7             	mov    %r12,%rdi
   26579:	4d 8d 7d 02          	lea    0x2(%r13),%r15
   2657d:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   26581:	49 89 c9             	mov    %rcx,%r9
   26584:	49 c1 e1 04          	shl    $0x4,%r9
   26588:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2658e:	4c 29 cb             	sub    %r9,%rbx
   26591:	48 89 8d f0 fd ff ff 	mov    %rcx,-0x210(%rbp)
   26598:	31 c9                	xor    %ecx,%ecx
   2659a:	4c 89 8d 00 fe ff ff 	mov    %r9,-0x200(%rbp)
   265a1:	48 89 9d 10 fe ff ff 	mov    %rbx,-0x1f0(%rbp)
   265a8:	e8 53 36 02 00       	call   49c00 <JS_NewObjectFromShape>
   265ad:	4c 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%r8
   265b4:	4c 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%r9
   265bb:	83 fa 06             	cmp    $0x6,%edx
   265be:	48 89 c1             	mov    %rax,%rcx
   265c1:	49 89 d2             	mov    %rdx,%r10
   265c4:	0f 84 29 6b 00 00    	je     2d0f3 <JS_CallInternal+0x8163>
   265ca:	8b 95 30 fe ff ff    	mov    -0x1d0(%rbp),%edx
   265d0:	85 d2                	test   %edx,%edx
   265d2:	0f 85 77 58 00 00    	jne    2be4f <JS_CallInternal+0x6ebf>
   265d8:	4d 89 50 08          	mov    %r10,0x8(%r8)
   265dc:	49 8d 58 10          	lea    0x10(%r8),%rbx
   265e0:	49 83 c5 03          	add    $0x3,%r13
   265e4:	49 89 08             	mov    %rcx,(%r8)
   265e7:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   265ec:	49 89 c2             	mov    %rax,%r10
   265ef:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   265f3:	ff e0                	jmp    *%rax
   265f5:	f3 0f 1e fa          	endbr64
   265f9:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   265fd:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   26601:	4c 89 e7             	mov    %r12,%rdi
   26604:	48 83 eb 10          	sub    $0x10,%rbx
   26608:	4d 89 ef             	mov    %r13,%r15
   2660b:	e8 a0 e0 ff ff       	call   246b0 <JS_Throw>
   26610:	e9 ab f0 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   26615:	f3 0f 1e fa          	endbr64
   26619:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2661d:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   26621:	4c 8d 4b e0          	lea    -0x20(%rbx),%r9
   26625:	4c 89 e7             	mov    %r12,%rdi
   26628:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   2662c:	4c 8b 43 f8          	mov    -0x8(%rbx),%r8
   26630:	4c 89 8d 30 fe ff ff 	mov    %r9,-0x1d0(%rbp)
   26637:	4c 8d 7b f0          	lea    -0x10(%rbx),%r15
   2663b:	e8 30 60 02 00       	call   4c670 <JS_AddBrand>
   26640:	4c 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9
   26647:	83 f8 ff             	cmp    $0xffffffff,%eax
   2664a:	0f 84 94 8b 00 00    	je     2f1e4 <JS_CallInternal+0xa254>
   26650:	49 8b 41 08          	mov    0x8(%r9),%rax
   26654:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26657:	76 15                	jbe    2666e <JS_CallInternal+0x16de>
   26659:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   2665d:	8b 59 fc             	mov    -0x4(%rcx),%ebx
   26660:	8d 53 ff             	lea    -0x1(%rbx),%edx
   26663:	89 51 fc             	mov    %edx,-0x4(%rcx)
   26666:	85 d2                	test   %edx,%edx
   26668:	0f 8e 3f 6a 00 00    	jle    2d0ad <JS_CallInternal+0x811d>
   2666e:	49 8b 47 08          	mov    0x8(%r15),%rax
   26672:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26675:	76 14                	jbe    2668b <JS_CallInternal+0x16fb>
   26677:	49 8b 0f             	mov    (%r15),%rcx
   2667a:	8b 59 fc             	mov    -0x4(%rcx),%ebx
   2667d:	8d 53 ff             	lea    -0x1(%rbx),%edx
   26680:	89 51 fc             	mov    %edx,-0x4(%rcx)
   26683:	85 d2                	test   %edx,%edx
   26685:	0f 8e 27 66 00 00    	jle    2ccb2 <JS_CallInternal+0x7d22>
   2668b:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   26690:	4c 89 cb             	mov    %r9,%rbx
   26693:	49 83 c5 01          	add    $0x1,%r13
   26697:	49 89 c2             	mov    %rax,%r10
   2669a:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2669e:	ff e0                	jmp    *%rax
   266a0:	f3 0f 1e fa          	endbr64
   266a4:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   266a8:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   266ac:	4c 89 e7             	mov    %r12,%rdi
   266af:	49 83 c5 01          	add    $0x1,%r13
   266b3:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   266b7:	4c 8b 43 e8          	mov    -0x18(%rbx),%r8
   266bb:	e8 b0 98 ff ff       	call   1ff70 <js_method_set_home_object>
   266c0:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   266c5:	49 89 c2             	mov    %rax,%r10
   266c8:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   266cc:	ff e0                	jmp    *%rax
   266ce:	f3 0f 1e fa          	endbr64
   266d2:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   266d9:	4c 8b 7b f8          	mov    -0x8(%rbx),%r15
   266dd:	4c 8b 53 f0          	mov    -0x10(%rbx),%r10
   266e1:	4c 89 68 30          	mov    %r13,0x30(%rax)
   266e5:	41 83 ff ff          	cmp    $0xffffffff,%r15d
   266e9:	0f 84 ab 54 00 00    	je     2bb9a <JS_CallInternal+0x6c0a>
   266ef:	41 83 ff 02          	cmp    $0x2,%r15d
   266f3:	0f 84 a1 54 00 00    	je     2bb9a <JS_CallInternal+0x6c0a>
   266f9:	41 83 ff f6          	cmp    $0xfffffff6,%r15d
   266fd:	76 13                	jbe    26712 <JS_CallInternal+0x1782>
   266ff:	41 8b 42 fc          	mov    -0x4(%r10),%eax
   26703:	83 e8 01             	sub    $0x1,%eax
   26706:	41 89 42 fc          	mov    %eax,-0x4(%r10)
   2670a:	85 c0                	test   %eax,%eax
   2670c:	0f 8e 8b 65 00 00    	jle    2cc9d <JS_CallInternal+0x7d0d>
   26712:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   26717:	48 83 eb 10          	sub    $0x10,%rbx
   2671b:	49 83 c5 01          	add    $0x1,%r13
   2671f:	49 89 c2             	mov    %rax,%r10
   26722:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26726:	ff e0                	jmp    *%rax
   26728:	f3 0f 1e fa          	endbr64
   2672c:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   26730:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   26734:	4c 89 e7             	mov    %r12,%rdi
   26737:	4d 89 ef             	mov    %r13,%r15
   2673a:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2673e:	4c 8b 43 e8          	mov    -0x18(%rbx),%r8
   26742:	e8 89 02 02 00       	call   469d0 <JS_DefineObjectNameComputed.constprop.0>
   26747:	83 f8 ff             	cmp    $0xffffffff,%eax
   2674a:	0f 84 70 ef ff ff    	je     256c0 <JS_CallInternal+0x730>
   26750:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   26755:	49 83 c5 01          	add    $0x1,%r13
   26759:	49 89 c2             	mov    %rax,%r10
   2675c:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26760:	ff e0                	jmp    *%rax
   26762:	f3 0f 1e fa          	endbr64
   26766:	41 8b 4d 00          	mov    0x0(%r13),%ecx
   2676a:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2676e:	4c 89 e7             	mov    %r12,%rdi
   26771:	4d 8d 7d 04          	lea    0x4(%r13),%r15
   26775:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   26779:	e8 52 51 01 00       	call   3b8d0 <JS_DefineObjectName.constprop.0>
   2677e:	83 f8 ff             	cmp    $0xffffffff,%eax
   26781:	0f 84 39 ef ff ff    	je     256c0 <JS_CallInternal+0x730>
   26787:	41 0f b6 45 04       	movzbl 0x4(%r13),%eax
   2678c:	49 83 c5 05          	add    $0x5,%r13
   26790:	49 89 c2             	mov    %rax,%r10
   26793:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26797:	ff e0                	jmp    *%rax
   26799:	f3 0f 1e fa          	endbr64
   2679d:	48 83 ec 08          	sub    $0x8,%rsp
   267a1:	41 8b 4d 00          	mov    0x0(%r13),%ecx
   267a5:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   267a9:	4c 89 e7             	mov    %r12,%rdi
   267ac:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   267b0:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   267b4:	4d 8d 7d 04          	lea    0x4(%r13),%r15
   267b8:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   267bc:	68 07 40 00 00       	push   $0x4007
   267c1:	e8 2a c1 00 00       	call   328f0 <JS_DefinePropertyValue>
   267c6:	5a                   	pop    %rdx
   267c7:	59                   	pop    %rcx
   267c8:	85 c0                	test   %eax,%eax
   267ca:	0f 88 cd 6f 00 00    	js     2d79d <JS_CallInternal+0x880d>
   267d0:	41 0f b6 45 04       	movzbl 0x4(%r13),%eax
   267d5:	48 83 eb 10          	sub    $0x10,%rbx
   267d9:	49 83 c5 05          	add    $0x5,%r13
   267dd:	49 89 c2             	mov    %rax,%r10
   267e0:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   267e4:	ff e0                	jmp    *%rax
   267e6:	f3 0f 1e fa          	endbr64
   267ea:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   267ee:	48 8d 43 e0          	lea    -0x20(%rbx),%rax
   267f2:	4c 8b 7b d0          	mov    -0x30(%rbx),%r15
   267f6:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   267fd:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   26801:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   26808:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2680c:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   26810:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   26817:	83 7b d8 ff          	cmpl   $0xffffffff,-0x28(%rbx)
   2681b:	0f 85 ca 75 00 00    	jne    2ddeb <JS_CallInternal+0x8e5b>
   26821:	83 f8 f8             	cmp    $0xfffffff8,%eax
   26824:	0f 85 a8 75 00 00    	jne    2ddd2 <JS_CallInternal+0x8e42>
   2682a:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2682f:	e8 cc 19 ff ff       	call   18200 <js_get_atom_index>
   26834:	49 8b 4f 18          	mov    0x18(%r15),%rcx
   26838:	89 c6                	mov    %eax,%esi
   2683a:	8b 41 18             	mov    0x18(%rcx),%eax
   2683d:	89 f2                	mov    %esi,%edx
   2683f:	21 c2                	and    %eax,%edx
   26841:	8b 54 91 38          	mov    0x38(%rcx,%rdx,4),%edx
   26845:	48 85 d2             	test   %rdx,%rdx
   26848:	0f 84 87 4e 00 00    	je     2b6d5 <JS_CallInternal+0x6745>
   2684e:	48 8d 3c 85 3c 00 00 	lea    0x3c(,%rax,4),%rdi
   26855:	00 
   26856:	48 8d 44 d7 f8       	lea    -0x8(%rdi,%rdx,8),%rax
   2685b:	48 01 c8             	add    %rcx,%rax
   2685e:	39 70 04             	cmp    %esi,0x4(%rax)
   26861:	0f 85 60 4e 00 00    	jne    2b6c7 <JS_CallInternal+0x6737>
   26867:	48 8d 0d d6 18 0b 00 	lea    0xb18d6(%rip),%rcx        # d8144 <_IO_stdin_used+0x144>
   2686e:	4c 89 e7             	mov    %r12,%rdi
   26871:	31 c0                	xor    %eax,%eax
   26873:	4d 89 ef             	mov    %r13,%r15
   26876:	48 8d 15 db 55 0b 00 	lea    0xb55db(%rip),%rdx        # dbe58 <_IO_stdin_used+0x3e58>
   2687d:	e8 ae d1 00 00       	call   33a30 <__JS_ThrowTypeErrorAtom>
   26882:	83 bd 00 fe ff ff f6 	cmpl   $0xfffffff6,-0x200(%rbp)
   26889:	76 1e                	jbe    268a9 <JS_CallInternal+0x1919>
   2688b:	48 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%rbx
   26892:	8b 43 fc             	mov    -0x4(%rbx),%eax
   26895:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   2689b:	83 e8 01             	sub    $0x1,%eax
   2689e:	89 43 fc             	mov    %eax,-0x4(%rbx)
   268a1:	85 c0                	test   %eax,%eax
   268a3:	0f 8e df 89 00 00    	jle    2f288 <JS_CallInternal+0xa2f8>
   268a9:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   268b0:	48 8b 43 08          	mov    0x8(%rbx),%rax
   268b4:	83 f8 f6             	cmp    $0xfffffff6,%eax
   268b7:	0f 86 03 ee ff ff    	jbe    256c0 <JS_CallInternal+0x730>
   268bd:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   268c4:	48 8b 0b             	mov    (%rbx),%rcx
   268c7:	8b 71 fc             	mov    -0x4(%rcx),%esi
   268ca:	8d 56 ff             	lea    -0x1(%rsi),%edx
   268cd:	89 51 fc             	mov    %edx,-0x4(%rcx)
   268d0:	85 d2                	test   %edx,%edx
   268d2:	0f 8f e8 ed ff ff    	jg     256c0 <JS_CallInternal+0x730>
   268d8:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   268dd:	48 89 c2             	mov    %rax,%rdx
   268e0:	48 89 ce             	mov    %rcx,%rsi
   268e3:	e8 e8 7b ff ff       	call   1e4d0 <__JS_FreeValueRT>
   268e8:	e9 d3 ed ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   268ed:	0f 1f 00             	nopl   (%rax)
   268f0:	f3 0f 1e fa          	endbr64
   268f4:	48 8d 43 e0          	lea    -0x20(%rbx),%rax
   268f8:	48 8b 38             	mov    (%rax),%rdi
   268fb:	4c 8d 7b f0          	lea    -0x10(%rbx),%r15
   268ff:	48 83 eb 30          	sub    $0x30,%rbx
   26903:	48 8b 40 08          	mov    0x8(%rax),%rax
   26907:	48 8b 0b             	mov    (%rbx),%rcx
   2690a:	49 8b 37             	mov    (%r15),%rsi
   2690d:	49 8b 57 08          	mov    0x8(%r15),%rdx
   26911:	48 89 bd 30 fe ff ff 	mov    %rdi,-0x1d0(%rbp)
   26918:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2691f:	83 7b 08 ff          	cmpl   $0xffffffff,0x8(%rbx)
   26923:	0f 85 88 75 00 00    	jne    2deb1 <JS_CallInternal+0x8f21>
   26929:	83 fa f8             	cmp    $0xfffffff8,%edx
   2692c:	0f 85 33 75 00 00    	jne    2de65 <JS_CallInternal+0x8ed5>
   26932:	49 8b 44 24 10       	mov    0x10(%r12),%rax
   26937:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2693e:	48 89 c7             	mov    %rax,%rdi
   26941:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   26948:	e8 b3 18 ff ff       	call   18200 <js_get_atom_index>
   2694d:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   26954:	89 c6                	mov    %eax,%esi
   26956:	48 8b 79 18          	mov    0x18(%rcx),%rdi
   2695a:	8b 57 18             	mov    0x18(%rdi),%edx
   2695d:	21 d0                	and    %edx,%eax
   2695f:	8b 44 87 38          	mov    0x38(%rdi,%rax,4),%eax
   26963:	48 85 c0             	test   %rax,%rax
   26966:	0f 84 62 7b 00 00    	je     2e4ce <JS_CallInternal+0x953e>
   2696c:	4c 8d 0c 95 3c 00 00 	lea    0x3c(,%rdx,4),%r9
   26973:	00 
   26974:	48 83 e8 01          	sub    $0x1,%rax
   26978:	49 8d 14 c1          	lea    (%r9,%rax,8),%rdx
   2697c:	48 01 fa             	add    %rdi,%rdx
   2697f:	3b 72 04             	cmp    0x4(%rdx),%esi
   26982:	0f 85 39 7b 00 00    	jne    2e4c1 <JS_CallInternal+0x9531>
   26988:	48 8b b5 30 fe ff ff 	mov    -0x1d0(%rbp),%rsi
   2698f:	48 c1 e0 04          	shl    $0x4,%rax
   26993:	48 03 41 20          	add    0x20(%rcx),%rax
   26997:	48 8b 08             	mov    (%rax),%rcx
   2699a:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2699e:	48 89 30             	mov    %rsi,(%rax)
   269a1:	48 8b b5 10 fe ff ff 	mov    -0x1f0(%rbp),%rsi
   269a8:	48 89 70 08          	mov    %rsi,0x8(%rax)
   269ac:	83 fa f6             	cmp    $0xfffffff6,%edx
   269af:	76 11                	jbe    269c2 <JS_CallInternal+0x1a32>
   269b1:	8b 41 fc             	mov    -0x4(%rcx),%eax
   269b4:	83 e8 01             	sub    $0x1,%eax
   269b7:	89 41 fc             	mov    %eax,-0x4(%rcx)
   269ba:	85 c0                	test   %eax,%eax
   269bc:	0f 8e 8f 74 00 00    	jle    2de51 <JS_CallInternal+0x8ec1>
   269c2:	48 8b 43 08          	mov    0x8(%rbx),%rax
   269c6:	83 f8 f6             	cmp    $0xfffffff6,%eax
   269c9:	0f 87 15 54 00 00    	ja     2bde4 <JS_CallInternal+0x6e54>
   269cf:	49 8b 47 08          	mov    0x8(%r15),%rax
   269d3:	83 f8 f6             	cmp    $0xfffffff6,%eax
   269d6:	76 14                	jbe    269ec <JS_CallInternal+0x1a5c>
   269d8:	49 8b 17             	mov    (%r15),%rdx
   269db:	8b 4a fc             	mov    -0x4(%rdx),%ecx
   269de:	83 e9 01             	sub    $0x1,%ecx
   269e1:	89 4a fc             	mov    %ecx,-0x4(%rdx)
   269e4:	85 c9                	test   %ecx,%ecx
   269e6:	0f 8e 1e 63 00 00    	jle    2cd0a <JS_CallInternal+0x7d7a>
   269ec:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   269f1:	49 83 c5 01          	add    $0x1,%r13
   269f5:	49 89 c2             	mov    %rax,%r10
   269f8:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   269fc:	ff e0                	jmp    *%rax
   269fe:	f3 0f 1e fa          	endbr64
   26a02:	48 8d 43 e0          	lea    -0x20(%rbx),%rax
   26a06:	4c 8d 7b f0          	lea    -0x10(%rbx),%r15
   26a0a:	4c 8b 53 e0          	mov    -0x20(%rbx),%r10
   26a0e:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   26a12:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   26a19:	4d 8b 4f 08          	mov    0x8(%r15),%r9
   26a1d:	83 7b e8 ff          	cmpl   $0xffffffff,-0x18(%rbx)
   26a21:	0f 85 03 74 00 00    	jne    2de2a <JS_CallInternal+0x8e9a>
   26a27:	41 83 f9 f8          	cmp    $0xfffffff8,%r9d
   26a2b:	0f 85 d3 73 00 00    	jne    2de04 <JS_CallInternal+0x8e74>
   26a31:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   26a36:	48 89 d6             	mov    %rdx,%rsi
   26a39:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   26a40:	4c 89 8d f0 fd ff ff 	mov    %r9,-0x210(%rbp)
   26a47:	48 89 bd 20 fe ff ff 	mov    %rdi,-0x1e0(%rbp)
   26a4e:	48 89 95 10 fe ff ff 	mov    %rdx,-0x1f0(%rbp)
   26a55:	e8 a6 17 ff ff       	call   18200 <js_get_atom_index>
   26a5a:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   26a61:	89 c7                	mov    %eax,%edi
   26a63:	49 8b 72 18          	mov    0x18(%r10),%rsi
   26a67:	8b 4e 18             	mov    0x18(%rsi),%ecx
   26a6a:	21 c8                	and    %ecx,%eax
   26a6c:	8b 44 86 38          	mov    0x38(%rsi,%rax,4),%eax
   26a70:	48 85 c0             	test   %rax,%rax
   26a73:	0f 84 fa 6e 00 00    	je     2d973 <JS_CallInternal+0x89e3>
   26a79:	48 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%rdx
   26a80:	4c 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%r9
   26a87:	4c 8d 04 8d 3c 00 00 	lea    0x3c(,%rcx,4),%r8
   26a8e:	00 
   26a8f:	48 83 e8 01          	sub    $0x1,%rax
   26a93:	49 8d 0c c0          	lea    (%r8,%rax,8),%rcx
   26a97:	48 01 f1             	add    %rsi,%rcx
   26a9a:	3b 79 04             	cmp    0x4(%rcx),%edi
   26a9d:	0f 85 c3 6e 00 00    	jne    2d966 <JS_CallInternal+0x89d6>
   26aa3:	48 c1 e0 04          	shl    $0x4,%rax
   26aa7:	49 03 42 20          	add    0x20(%r10),%rax
   26aab:	48 8b 08             	mov    (%rax),%rcx
   26aae:	48 8b 40 08          	mov    0x8(%rax),%rax
   26ab2:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26ab5:	76 04                	jbe    26abb <JS_CallInternal+0x1b2b>
   26ab7:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   26abb:	41 89 c0             	mov    %eax,%r8d
   26abe:	41 83 f9 f6          	cmp    $0xfffffff6,%r9d
   26ac2:	76 11                	jbe    26ad5 <JS_CallInternal+0x1b45>
   26ac4:	8b 72 fc             	mov    -0x4(%rdx),%esi
   26ac7:	83 ee 01             	sub    $0x1,%esi
   26aca:	89 72 fc             	mov    %esi,-0x4(%rdx)
   26acd:	85 f6                	test   %esi,%esi
   26acf:	0f 8e 5a 62 00 00    	jle    2cd2f <JS_CallInternal+0x7d9f>
   26ad5:	48 8b b5 30 fe ff ff 	mov    -0x1d0(%rbp),%rsi
   26adc:	48 8b 76 08          	mov    0x8(%rsi),%rsi
   26ae0:	83 fe f6             	cmp    $0xfffffff6,%esi
   26ae3:	76 1b                	jbe    26b00 <JS_CallInternal+0x1b70>
   26ae5:	48 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%rdx
   26aec:	48 8b 3a             	mov    (%rdx),%rdi
   26aef:	8b 57 fc             	mov    -0x4(%rdi),%edx
   26af2:	83 ea 01             	sub    $0x1,%edx
   26af5:	89 57 fc             	mov    %edx,-0x4(%rdi)
   26af8:	85 d2                	test   %edx,%edx
   26afa:	0f 8e ef 67 00 00    	jle    2d2ef <JS_CallInternal+0x835f>
   26b00:	48 89 4b e0          	mov    %rcx,-0x20(%rbx)
   26b04:	48 89 43 e8          	mov    %rax,-0x18(%rbx)
   26b08:	41 83 f8 06          	cmp    $0x6,%r8d
   26b0c:	0f 84 b7 6e 00 00    	je     2d9c9 <JS_CallInternal+0x8a39>
   26b12:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   26b17:	4c 89 fb             	mov    %r15,%rbx
   26b1a:	49 83 c5 01          	add    $0x1,%r13
   26b1e:	49 89 c2             	mov    %rax,%r10
   26b21:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26b25:	ff e0                	jmp    *%rax
   26b27:	f3 0f 1e fa          	endbr64
   26b2b:	41 8b 75 00          	mov    0x0(%r13),%esi
   26b2f:	4c 89 e7             	mov    %r12,%rdi
   26b32:	4d 8d 7d 04          	lea    0x4(%r13),%r15
   26b36:	e8 c5 f3 00 00       	call   35f00 <JS_NewSymbolFromAtom.constprop.0>
   26b3b:	83 fa 06             	cmp    $0x6,%edx
   26b3e:	0f 84 7c eb ff ff    	je     256c0 <JS_CallInternal+0x730>
   26b44:	48 89 03             	mov    %rax,(%rbx)
   26b47:	49 83 c5 05          	add    $0x5,%r13
   26b4b:	48 83 c3 10          	add    $0x10,%rbx
   26b4f:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   26b53:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   26b58:	49 89 c2             	mov    %rax,%r10
   26b5b:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26b5f:	ff e0                	jmp    *%rax
   26b61:	f3 0f 1e fa          	endbr64
   26b65:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   26b69:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   26b6d:	4c 89 e7             	mov    %r12,%rdi
   26b70:	4c 8d 7b f0          	lea    -0x10(%rbx),%r15
   26b74:	e8 a7 de ff ff       	call   24a20 <js_operator_typeof>
   26b79:	83 f8 49             	cmp    $0x49,%eax
   26b7c:	0f 84 ad 00 00 00    	je     26c2f <JS_CallInternal+0x1c9f>
   26b82:	49 8b 57 08          	mov    0x8(%r15),%rdx
   26b86:	49 8b 0f             	mov    (%r15),%rcx
   26b89:	83 fa f6             	cmp    $0xfffffff6,%edx
   26b8c:	76 11                	jbe    26b9f <JS_CallInternal+0x1c0f>
   26b8e:	8b 41 fc             	mov    -0x4(%rcx),%eax
   26b91:	83 e8 01             	sub    $0x1,%eax
   26b94:	89 41 fc             	mov    %eax,-0x4(%rcx)
   26b97:	85 c0                	test   %eax,%eax
   26b99:	0f 8e 8b 52 00 00    	jle    2be2a <JS_CallInternal+0x6e9a>
   26b9f:	48 c7 43 f0 00 00 00 	movq   $0x0,-0x10(%rbx)
   26ba6:	00 
   26ba7:	49 83 c5 01          	add    $0x1,%r13
   26bab:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   26bb2:	00 
   26bb3:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   26bb8:	49 89 c2             	mov    %rax,%r10
   26bbb:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26bbf:	ff e0                	jmp    *%rax
   26bc1:	f3 0f 1e fa          	endbr64
   26bc5:	83 7b f8 02          	cmpl   $0x2,-0x8(%rbx)
   26bc9:	74 15                	je     26be0 <JS_CallInternal+0x1c50>
   26bcb:	4c 8d 7b f0          	lea    -0x10(%rbx),%r15
   26bcf:	eb b1                	jmp    26b82 <JS_CallInternal+0x1bf2>
   26bd1:	f3 0f 1e fa          	endbr64
   26bd5:	8b 43 f8             	mov    -0x8(%rbx),%eax
   26bd8:	83 e8 02             	sub    $0x2,%eax
   26bdb:	83 f8 01             	cmp    $0x1,%eax
   26bde:	77 eb                	ja     26bcb <JS_CallInternal+0x1c3b>
   26be0:	48 c7 43 f0 01 00 00 	movq   $0x1,-0x10(%rbx)
   26be7:	00 
   26be8:	49 83 c5 01          	add    $0x1,%r13
   26bec:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   26bf3:	00 
   26bf4:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   26bf9:	49 89 c2             	mov    %rax,%r10
   26bfc:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26c00:	ff e0                	jmp    *%rax
   26c02:	f3 0f 1e fa          	endbr64
   26c06:	83 7b f8 03          	cmpl   $0x3,-0x8(%rbx)
   26c0a:	75 bf                	jne    26bcb <JS_CallInternal+0x1c3b>
   26c0c:	eb d2                	jmp    26be0 <JS_CallInternal+0x1c50>
   26c0e:	f3 0f 1e fa          	endbr64
   26c12:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   26c16:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   26c1a:	4c 89 e7             	mov    %r12,%rdi
   26c1d:	4c 8d 7b f0          	lea    -0x10(%rbx),%r15
   26c21:	e8 fa dd ff ff       	call   24a20 <js_operator_typeof>
   26c26:	83 f8 1b             	cmp    $0x1b,%eax
   26c29:	0f 85 53 ff ff ff    	jne    26b82 <JS_CallInternal+0x1bf2>
   26c2f:	49 8b 47 08          	mov    0x8(%r15),%rax
   26c33:	49 8b 17             	mov    (%r15),%rdx
   26c36:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26c39:	76 a5                	jbe    26be0 <JS_CallInternal+0x1c50>
   26c3b:	8b 4a fc             	mov    -0x4(%rdx),%ecx
   26c3e:	83 e9 01             	sub    $0x1,%ecx
   26c41:	89 4a fc             	mov    %ecx,-0x4(%rdx)
   26c44:	85 c9                	test   %ecx,%ecx
   26c46:	7f 98                	jg     26be0 <JS_CallInternal+0x1c50>
   26c48:	48 92                	xchg   %rax,%rdx
   26c4a:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   26c4f:	48 89 c6             	mov    %rax,%rsi
   26c52:	e8 79 78 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   26c57:	eb 87                	jmp    26be0 <JS_CallInternal+0x1c50>
   26c59:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   26c60:	f3 0f 1e fa          	endbr64
   26c64:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   26c69:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   26c70:	4d 8d 7d 01          	lea    0x1(%r13),%r15
   26c74:	48 c1 e0 04          	shl    $0x4,%rax
   26c78:	48 03 41 50          	add    0x50(%rcx),%rax
   26c7c:	48 8b 10             	mov    (%rax),%rdx
   26c7f:	48 8b 40 08          	mov    0x8(%rax),%rax
   26c83:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26c86:	76 04                	jbe    26c8c <JS_CallInternal+0x1cfc>
   26c88:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   26c8c:	48 92                	xchg   %rax,%rdx
   26c8e:	4c 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%r8
   26c95:	45 31 c9             	xor    %r9d,%r9d
   26c98:	4c 89 e7             	mov    %r12,%rdi
   26c9b:	48 8b 8d 88 fe ff ff 	mov    -0x178(%rbp),%rcx
   26ca2:	48 89 c6             	mov    %rax,%rsi
   26ca5:	e8 96 75 02 00       	call   4e240 <js_closure>
   26caa:	48 89 03             	mov    %rax,(%rbx)
   26cad:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   26cb1:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   26cb5:	0f 84 92 6e 00 00    	je     2db4d <JS_CallInternal+0x8bbd>
   26cbb:	41 0f b6 45 01       	movzbl 0x1(%r13),%eax
   26cc0:	48 83 c3 10          	add    $0x10,%rbx
   26cc4:	49 83 c5 02          	add    $0x2,%r13
   26cc8:	49 89 c2             	mov    %rax,%r10
   26ccb:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26ccf:	ff e0                	jmp    *%rax
   26cd1:	f3 0f 1e fa          	endbr64
   26cd5:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   26cdc:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   26ce1:	48 c1 e0 04          	shl    $0x4,%rax
   26ce5:	48 03 41 50          	add    0x50(%rcx),%rax
   26ce9:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   26ced:	48 8b 10             	mov    (%rax),%rdx
   26cf0:	48 8b 40 08          	mov    0x8(%rax),%rax
   26cf4:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26cf7:	76 04                	jbe    26cfd <JS_CallInternal+0x1d6d>
   26cf9:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   26cfd:	48 89 13             	mov    %rdx,(%rbx)
   26d00:	49 83 c5 02          	add    $0x2,%r13
   26d04:	48 89 43 08          	mov    %rax,0x8(%rbx)
   26d08:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   26d0d:	48 89 cb             	mov    %rcx,%rbx
   26d10:	49 89 c2             	mov    %rax,%r10
   26d13:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26d17:	ff e0                	jmp    *%rax
   26d19:	f3 0f 1e fa          	endbr64
   26d1d:	41 0f bf 45 00       	movswl 0x0(%r13),%eax
   26d22:	48 83 c3 10          	add    $0x10,%rbx
   26d26:	49 83 c5 03          	add    $0x3,%r13
   26d2a:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   26d31:	00 
   26d32:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   26d36:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   26d3b:	49 89 c2             	mov    %rax,%r10
   26d3e:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26d42:	ff e0                	jmp    *%rax
   26d44:	f3 0f 1e fa          	endbr64
   26d48:	41 0f be 45 00       	movsbl 0x0(%r13),%eax
   26d4d:	48 83 c3 10          	add    $0x10,%rbx
   26d51:	49 83 c5 02          	add    $0x2,%r13
   26d55:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   26d5c:	00 
   26d5d:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   26d61:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   26d66:	49 89 c2             	mov    %rax,%r10
   26d69:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26d6d:	ff e0                	jmp    *%rax
   26d6f:	f3 0f 1e fa          	endbr64
   26d73:	e9 08 e5 ff ff       	jmp    25280 <JS_CallInternal+0x2f0>
   26d78:	f3 0f 1e fa          	endbr64
   26d7c:	e9 ff e4 ff ff       	jmp    25280 <JS_CallInternal+0x2f0>
   26d81:	f3 0f 1e fa          	endbr64
   26d85:	e9 f6 e4 ff ff       	jmp    25280 <JS_CallInternal+0x2f0>
   26d8a:	f3 0f 1e fa          	endbr64
   26d8e:	e9 ed e4 ff ff       	jmp    25280 <JS_CallInternal+0x2f0>
   26d93:	f3 0f 1e fa          	endbr64
   26d97:	e9 e4 e4 ff ff       	jmp    25280 <JS_CallInternal+0x2f0>
   26d9c:	f3 0f 1e fa          	endbr64
   26da0:	e9 db e4 ff ff       	jmp    25280 <JS_CallInternal+0x2f0>
   26da5:	f3 0f 1e fa          	endbr64
   26da9:	e9 d2 e4 ff ff       	jmp    25280 <JS_CallInternal+0x2f0>
   26dae:	f3 0f 1e fa          	endbr64
   26db2:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   26db9:	41 8b 45 00          	mov    0x0(%r13),%eax
   26dbd:	48 c1 e0 04          	shl    $0x4,%rax
   26dc1:	48 03 41 50          	add    0x50(%rcx),%rax
   26dc5:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   26dc9:	48 8b 10             	mov    (%rax),%rdx
   26dcc:	48 8b 40 08          	mov    0x8(%rax),%rax
   26dd0:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26dd3:	76 04                	jbe    26dd9 <JS_CallInternal+0x1e49>
   26dd5:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   26dd9:	48 89 13             	mov    %rdx,(%rbx)
   26ddc:	49 83 c5 05          	add    $0x5,%r13
   26de0:	48 89 43 08          	mov    %rax,0x8(%rbx)
   26de4:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   26de9:	48 89 cb             	mov    %rcx,%rbx
   26dec:	49 89 c2             	mov    %rax,%r10
   26def:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26df3:	ff e0                	jmp    *%rax
   26df5:	f3 0f 1e fa          	endbr64
   26df9:	49 63 45 00          	movslq 0x0(%r13),%rax
   26dfd:	48 c7 43 08 07 00 00 	movq   $0x7,0x8(%rbx)
   26e04:	00 
   26e05:	49 83 c5 05          	add    $0x5,%r13
   26e09:	48 83 c3 10          	add    $0x10,%rbx
   26e0d:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   26e11:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   26e16:	49 89 c2             	mov    %rax,%r10
   26e19:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26e1d:	ff e0                	jmp    *%rax
   26e1f:	f3 0f 1e fa          	endbr64
   26e23:	41 8b 45 00          	mov    0x0(%r13),%eax
   26e27:	48 c7 43 08 00 00 00 	movq   $0x0,0x8(%rbx)
   26e2e:	00 
   26e2f:	49 83 c5 05          	add    $0x5,%r13
   26e33:	48 83 c3 10          	add    $0x10,%rbx
   26e37:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   26e3b:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   26e40:	49 89 c2             	mov    %rax,%r10
   26e43:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26e47:	ff e0                	jmp    *%rax
   26e49:	f3 0f 1e fa          	endbr64
   26e4d:	e9 1b e5 ff ff       	jmp    2536d <JS_CallInternal+0x3dd>
   26e52:	f3 0f 1e fa          	endbr64
   26e56:	e9 12 e5 ff ff       	jmp    2536d <JS_CallInternal+0x3dd>
   26e5b:	f3 0f 1e fa          	endbr64
   26e5f:	41 8b 45 00          	mov    0x0(%r13),%eax
   26e63:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   26e6a:	48 c1 e0 04          	shl    $0x4,%rax
   26e6e:	48 03 41 50          	add    0x50(%rcx),%rax
   26e72:	48 8b 10             	mov    (%rax),%rdx
   26e75:	48 8b 40 08          	mov    0x8(%rax),%rax
   26e79:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26e7c:	76 04                	jbe    26e82 <JS_CallInternal+0x1ef2>
   26e7e:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   26e82:	48 92                	xchg   %rax,%rdx
   26e84:	4c 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%r8
   26e8b:	45 31 c9             	xor    %r9d,%r9d
   26e8e:	4c 89 e7             	mov    %r12,%rdi
   26e91:	48 8b 8d 88 fe ff ff 	mov    -0x178(%rbp),%rcx
   26e98:	48 89 c6             	mov    %rax,%rsi
   26e9b:	4d 8d 7d 04          	lea    0x4(%r13),%r15
   26e9f:	e8 9c 73 02 00       	call   4e240 <js_closure>
   26ea4:	48 89 03             	mov    %rax,(%rbx)
   26ea7:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   26eab:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   26eaf:	0f 84 03 66 00 00    	je     2d4b8 <JS_CallInternal+0x8528>
   26eb5:	41 0f b6 45 04       	movzbl 0x4(%r13),%eax
   26eba:	48 83 c3 10          	add    $0x10,%rbx
   26ebe:	49 83 c5 05          	add    $0x5,%r13
   26ec2:	49 89 c2             	mov    %rax,%r10
   26ec5:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26ec9:	ff e0                	jmp    *%rax
   26ecb:	f3 0f 1e fa          	endbr64
   26ecf:	f3 0f 6f 53 e0       	movdqu -0x20(%rbx),%xmm2
   26ed4:	f3 0f 6f 4b c0       	movdqu -0x40(%rbx),%xmm1
   26ed9:	49 83 c5 01          	add    $0x1,%r13
   26edd:	f3 0f 6f 43 d0       	movdqu -0x30(%rbx),%xmm0
   26ee2:	0f 11 53 c0          	movups %xmm2,-0x40(%rbx)
   26ee6:	f3 0f 6f 53 f0       	movdqu -0x10(%rbx),%xmm2
   26eeb:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   26eef:	0f 11 53 d0          	movups %xmm2,-0x30(%rbx)
   26ef3:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   26ef7:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   26efc:	49 89 c2             	mov    %rax,%r10
   26eff:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26f03:	ff e0                	jmp    *%rax
   26f05:	f3 0f 1e fa          	endbr64
   26f09:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   26f0e:	f3 0f 6f 4b f0       	movdqu -0x10(%rbx),%xmm1
   26f13:	49 83 c5 01          	add    $0x1,%r13
   26f17:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   26f1b:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   26f1f:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   26f24:	49 89 c2             	mov    %rax,%r10
   26f27:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26f2b:	ff e0                	jmp    *%rax
   26f2d:	f3 0f 1e fa          	endbr64
   26f31:	f3 0f 6f 4b d0       	movdqu -0x30(%rbx),%xmm1
   26f36:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   26f3b:	49 83 c5 01          	add    $0x1,%r13
   26f3f:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   26f43:	f3 0f 6f 4b c0       	movdqu -0x40(%rbx),%xmm1
   26f48:	0f 11 4b d0          	movups %xmm1,-0x30(%rbx)
   26f4c:	f3 0f 6f 4b b0       	movdqu -0x50(%rbx),%xmm1
   26f51:	0f 11 43 b0          	movups %xmm0,-0x50(%rbx)
   26f55:	0f 11 4b c0          	movups %xmm1,-0x40(%rbx)
   26f59:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   26f5e:	49 89 c2             	mov    %rax,%r10
   26f61:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26f65:	ff e0                	jmp    *%rax
   26f67:	f3 0f 1e fa          	endbr64
   26f6b:	f3 0f 6f 4b d0       	movdqu -0x30(%rbx),%xmm1
   26f70:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   26f75:	49 83 c5 01          	add    $0x1,%r13
   26f79:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   26f7d:	f3 0f 6f 4b c0       	movdqu -0x40(%rbx),%xmm1
   26f82:	0f 11 43 c0          	movups %xmm0,-0x40(%rbx)
   26f86:	0f 11 4b d0          	movups %xmm1,-0x30(%rbx)
   26f8a:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   26f8f:	49 89 c2             	mov    %rax,%r10
   26f92:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26f96:	ff e0                	jmp    *%rax
   26f98:	f3 0f 1e fa          	endbr64
   26f9c:	f3 0f 6f 4b e0       	movdqu -0x20(%rbx),%xmm1
   26fa1:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   26fa6:	49 83 c5 01          	add    $0x1,%r13
   26faa:	0f 11 4b f0          	movups %xmm1,-0x10(%rbx)
   26fae:	f3 0f 6f 4b d0       	movdqu -0x30(%rbx),%xmm1
   26fb3:	0f 11 43 d0          	movups %xmm0,-0x30(%rbx)
   26fb7:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   26fbb:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   26fc0:	49 89 c2             	mov    %rax,%r10
   26fc3:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26fc7:	ff e0                	jmp    *%rax
   26fc9:	f3 0f 1e fa          	endbr64
   26fcd:	f3 0f 6f 4b c0       	movdqu -0x40(%rbx),%xmm1
   26fd2:	f3 0f 6f 43 b0       	movdqu -0x50(%rbx),%xmm0
   26fd7:	49 83 c5 01          	add    $0x1,%r13
   26fdb:	0f 11 4b b0          	movups %xmm1,-0x50(%rbx)
   26fdf:	f3 0f 6f 4b d0       	movdqu -0x30(%rbx),%xmm1
   26fe4:	0f 11 4b c0          	movups %xmm1,-0x40(%rbx)
   26fe8:	f3 0f 6f 4b e0       	movdqu -0x20(%rbx),%xmm1
   26fed:	0f 11 4b d0          	movups %xmm1,-0x30(%rbx)
   26ff1:	f3 0f 6f 4b f0       	movdqu -0x10(%rbx),%xmm1
   26ff6:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   26ffa:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   26ffe:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   27003:	49 89 c2             	mov    %rax,%r10
   27006:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2700a:	ff e0                	jmp    *%rax
   2700c:	f3 0f 1e fa          	endbr64
   27010:	f3 0f 6f 4b d0       	movdqu -0x30(%rbx),%xmm1
   27015:	f3 0f 6f 43 c0       	movdqu -0x40(%rbx),%xmm0
   2701a:	49 83 c5 01          	add    $0x1,%r13
   2701e:	0f 11 4b c0          	movups %xmm1,-0x40(%rbx)
   27022:	f3 0f 6f 4b e0       	movdqu -0x20(%rbx),%xmm1
   27027:	0f 11 4b d0          	movups %xmm1,-0x30(%rbx)
   2702b:	f3 0f 6f 4b f0       	movdqu -0x10(%rbx),%xmm1
   27030:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   27034:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   27038:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2703d:	49 89 c2             	mov    %rax,%r10
   27040:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27044:	ff e0                	jmp    *%rax
   27046:	f3 0f 1e fa          	endbr64
   2704a:	f3 0f 6f 4b e0       	movdqu -0x20(%rbx),%xmm1
   2704f:	f3 0f 6f 43 d0       	movdqu -0x30(%rbx),%xmm0
   27054:	49 83 c5 01          	add    $0x1,%r13
   27058:	0f 11 4b d0          	movups %xmm1,-0x30(%rbx)
   2705c:	f3 0f 6f 4b f0       	movdqu -0x10(%rbx),%xmm1
   27061:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   27065:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   27069:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2706e:	49 89 c2             	mov    %rax,%r10
   27071:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27075:	ff e0                	jmp    *%rax
   27077:	f3 0f 1e fa          	endbr64
   2707b:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   27080:	f3 0f 6f 4b d0       	movdqu -0x30(%rbx),%xmm1
   27085:	49 83 c5 01          	add    $0x1,%r13
   27089:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   2708d:	0f 11 43 d0          	movups %xmm0,-0x30(%rbx)
   27091:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   27096:	49 89 c2             	mov    %rax,%r10
   27099:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2709d:	ff e0                	jmp    *%rax
   2709f:	f3 0f 1e fa          	endbr64
   270a3:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   270a8:	0f 11 03             	movups %xmm0,(%rbx)
   270ab:	66 48 0f 7e c2       	movq   %xmm0,%rdx
   270b0:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   270b5:	48 8b 43 08          	mov    0x8(%rbx),%rax
   270b9:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   270bd:	f3 0f 6f 43 d0       	movdqu -0x30(%rbx),%xmm0
   270c2:	0f 11 43 e0          	movups %xmm0,-0x20(%rbx)
   270c6:	f3 0f 6f 43 c0       	movdqu -0x40(%rbx),%xmm0
   270cb:	0f 11 43 d0          	movups %xmm0,-0x30(%rbx)
   270cf:	83 f8 f6             	cmp    $0xfffffff6,%eax
   270d2:	76 04                	jbe    270d8 <JS_CallInternal+0x2148>
   270d4:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   270d8:	48 89 53 c0          	mov    %rdx,-0x40(%rbx)
   270dc:	49 83 c5 01          	add    $0x1,%r13
   270e0:	48 83 c3 10          	add    $0x10,%rbx
   270e4:	48 89 43 b8          	mov    %rax,-0x48(%rbx)
   270e8:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   270ed:	49 89 c2             	mov    %rax,%r10
   270f0:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   270f4:	ff e0                	jmp    *%rax
   270f6:	f3 0f 1e fa          	endbr64
   270fa:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   270ff:	0f 11 03             	movups %xmm0,(%rbx)
   27102:	66 48 0f 7e c2       	movq   %xmm0,%rdx
   27107:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   2710c:	48 8b 43 08          	mov    0x8(%rbx),%rax
   27110:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   27114:	f3 0f 6f 43 d0       	movdqu -0x30(%rbx),%xmm0
   27119:	0f 11 43 e0          	movups %xmm0,-0x20(%rbx)
   2711d:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27120:	76 04                	jbe    27126 <JS_CallInternal+0x2196>
   27122:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27126:	48 89 53 d0          	mov    %rdx,-0x30(%rbx)
   2712a:	49 83 c5 01          	add    $0x1,%r13
   2712e:	48 83 c3 10          	add    $0x10,%rbx
   27132:	48 89 43 c8          	mov    %rax,-0x38(%rbx)
   27136:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2713b:	49 89 c2             	mov    %rax,%r10
   2713e:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27142:	ff e0                	jmp    *%rax
   27144:	f3 0f 1e fa          	endbr64
   27148:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2714d:	0f 11 03             	movups %xmm0,(%rbx)
   27150:	66 48 0f 7e c2       	movq   %xmm0,%rdx
   27155:	48 8b 43 08          	mov    0x8(%rbx),%rax
   27159:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   2715e:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   27162:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27165:	76 04                	jbe    2716b <JS_CallInternal+0x21db>
   27167:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2716b:	48 89 53 e0          	mov    %rdx,-0x20(%rbx)
   2716f:	49 83 c5 01          	add    $0x1,%r13
   27173:	48 83 c3 10          	add    $0x10,%rbx
   27177:	48 89 43 d8          	mov    %rax,-0x28(%rbx)
   2717b:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   27180:	49 89 c2             	mov    %rax,%r10
   27183:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27187:	ff e0                	jmp    *%rax
   27189:	f3 0f 1e fa          	endbr64
   2718d:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   27192:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   27196:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   2719a:	0f 11 03             	movups %xmm0,(%rbx)
   2719d:	83 f8 f6             	cmp    $0xfffffff6,%eax
   271a0:	76 04                	jbe    271a6 <JS_CallInternal+0x2216>
   271a2:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   271a6:	48 89 53 f0          	mov    %rdx,-0x10(%rbx)
   271aa:	49 83 c5 01          	add    $0x1,%r13
   271ae:	48 83 c3 10          	add    $0x10,%rbx
   271b2:	48 89 43 e8          	mov    %rax,-0x18(%rbx)
   271b6:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   271bb:	49 89 c2             	mov    %rax,%r10
   271be:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   271c2:	ff e0                	jmp    *%rax
   271c4:	f3 0f 1e fa          	endbr64
   271c8:	48 8b 43 d8          	mov    -0x28(%rbx),%rax
   271cc:	48 8b 53 d0          	mov    -0x30(%rbx),%rdx
   271d0:	83 f8 f6             	cmp    $0xfffffff6,%eax
   271d3:	76 04                	jbe    271d9 <JS_CallInternal+0x2249>
   271d5:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   271d9:	48 89 43 08          	mov    %rax,0x8(%rbx)
   271dd:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   271e1:	48 89 13             	mov    %rdx,(%rbx)
   271e4:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   271e8:	83 f8 f6             	cmp    $0xfffffff6,%eax
   271eb:	76 04                	jbe    271f1 <JS_CallInternal+0x2261>
   271ed:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   271f1:	48 89 43 18          	mov    %rax,0x18(%rbx)
   271f5:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   271f9:	48 89 53 10          	mov    %rdx,0x10(%rbx)
   271fd:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   27201:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27204:	76 04                	jbe    2720a <JS_CallInternal+0x227a>
   27206:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2720a:	48 89 53 20          	mov    %rdx,0x20(%rbx)
   2720e:	49 83 c5 01          	add    $0x1,%r13
   27212:	48 83 c3 30          	add    $0x30,%rbx
   27216:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2721a:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2721f:	49 89 c2             	mov    %rax,%r10
   27222:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27226:	ff e0                	jmp    *%rax
   27228:	f3 0f 1e fa          	endbr64
   2722c:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   27230:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   27234:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27237:	76 04                	jbe    2723d <JS_CallInternal+0x22ad>
   27239:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2723d:	48 89 43 08          	mov    %rax,0x8(%rbx)
   27241:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   27245:	48 89 13             	mov    %rdx,(%rbx)
   27248:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2724c:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2724f:	76 04                	jbe    27255 <JS_CallInternal+0x22c5>
   27251:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27255:	48 89 53 10          	mov    %rdx,0x10(%rbx)
   27259:	49 83 c5 01          	add    $0x1,%r13
   2725d:	48 83 c3 20          	add    $0x20,%rbx
   27261:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   27265:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2726a:	49 89 c2             	mov    %rax,%r10
   2726d:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27271:	ff e0                	jmp    *%rax
   27273:	f3 0f 1e fa          	endbr64
   27277:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2727b:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2727f:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27282:	76 04                	jbe    27288 <JS_CallInternal+0x22f8>
   27284:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27288:	48 89 13             	mov    %rdx,(%rbx)
   2728b:	49 83 c5 01          	add    $0x1,%r13
   2728f:	48 83 c3 10          	add    $0x10,%rbx
   27293:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   27297:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2729c:	49 89 c2             	mov    %rax,%r10
   2729f:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   272a3:	ff e0                	jmp    *%rax
   272a5:	f3 0f 1e fa          	endbr64
   272a9:	48 8b 43 d8          	mov    -0x28(%rbx),%rax
   272ad:	48 8b 4b d0          	mov    -0x30(%rbx),%rcx
   272b1:	83 f8 f6             	cmp    $0xfffffff6,%eax
   272b4:	76 11                	jbe    272c7 <JS_CallInternal+0x2337>
   272b6:	8b 71 fc             	mov    -0x4(%rcx),%esi
   272b9:	8d 56 ff             	lea    -0x1(%rsi),%edx
   272bc:	89 51 fc             	mov    %edx,-0x4(%rcx)
   272bf:	85 d2                	test   %edx,%edx
   272c1:	0f 8e bb 60 00 00    	jle    2d382 <JS_CallInternal+0x83f2>
   272c7:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   272cc:	49 83 c5 01          	add    $0x1,%r13
   272d0:	48 83 eb 10          	sub    $0x10,%rbx
   272d4:	0f 11 43 e0          	movups %xmm0,-0x20(%rbx)
   272d8:	f3 0f 6f 03          	movdqu (%rbx),%xmm0
   272dc:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   272e0:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   272e5:	49 89 c2             	mov    %rax,%r10
   272e8:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   272ec:	ff e0                	jmp    *%rax
   272ee:	f3 0f 1e fa          	endbr64
   272f2:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   272f6:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   272fa:	83 f8 f6             	cmp    $0xfffffff6,%eax
   272fd:	76 11                	jbe    27310 <JS_CallInternal+0x2380>
   272ff:	8b 51 fc             	mov    -0x4(%rcx),%edx
   27302:	83 ea 01             	sub    $0x1,%edx
   27305:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27308:	85 d2                	test   %edx,%edx
   2730a:	0f 8e 48 60 00 00    	jle    2d358 <JS_CallInternal+0x83c8>
   27310:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   27315:	49 83 c5 01          	add    $0x1,%r13
   27319:	48 83 eb 10          	sub    $0x10,%rbx
   2731d:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   27321:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   27326:	49 89 c2             	mov    %rax,%r10
   27329:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2732d:	ff e0                	jmp    *%rax
   2732f:	f3 0f 1e fa          	endbr64
   27333:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   27337:	48 83 eb 10          	sub    $0x10,%rbx
   2733b:	48 8b 0b             	mov    (%rbx),%rcx
   2733e:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27341:	76 11                	jbe    27354 <JS_CallInternal+0x23c4>
   27343:	8b 51 fc             	mov    -0x4(%rcx),%edx
   27346:	83 ea 01             	sub    $0x1,%edx
   27349:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2734c:	85 d2                	test   %edx,%edx
   2734e:	0f 8e 19 60 00 00    	jle    2d36d <JS_CallInternal+0x83dd>
   27354:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   27359:	49 83 c5 01          	add    $0x1,%r13
   2735d:	49 89 c2             	mov    %rax,%r10
   27360:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27364:	ff e0                	jmp    *%rax
   27366:	f3 0f 1e fa          	endbr64
   2736a:	8b 8d a8 fe ff ff    	mov    -0x158(%rbp),%ecx
   27370:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
   27375:	4c 89 e7             	mov    %r12,%rdi
   27378:	4d 8d 7d 02          	lea    0x2(%r13),%r15
   2737c:	39 c8                	cmp    %ecx,%eax
   2737e:	0f 4f c1             	cmovg  %ecx,%eax
   27381:	48 63 d0             	movslq %eax,%rdx
   27384:	29 c1                	sub    %eax,%ecx
   27386:	48 c1 e2 04          	shl    $0x4,%rdx
   2738a:	89 ce                	mov    %ecx,%esi
   2738c:	48 03 95 98 fe ff ff 	add    -0x168(%rbp),%rdx
   27393:	e8 78 4e 02 00       	call   4c210 <js_create_array>
   27398:	48 89 03             	mov    %rax,(%rbx)
   2739b:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2739f:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   273a3:	0f 84 06 6d 00 00    	je     2e0af <JS_CallInternal+0x911f>
   273a9:	41 0f b6 45 02       	movzbl 0x2(%r13),%eax
   273ae:	48 83 c3 10          	add    $0x10,%rbx
   273b2:	49 83 c5 03          	add    $0x3,%r13
   273b6:	49 89 c2             	mov    %rax,%r10
   273b9:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   273bd:	ff e0                	jmp    *%rax
   273bf:	f3 0f 1e fa          	endbr64
   273c3:	4d 8d 7d 01          	lea    0x1(%r13),%r15
   273c7:	41 80 7d 00 06       	cmpb   $0x6,0x0(%r13)
   273cc:	0f 87 0b b2 fe ff    	ja     125dd <JS_CallInternal.cold>
   273d2:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   273d7:	48 8d 15 9a ad 0b 00 	lea    0xbad9a(%rip),%rdx        # e2178 <qjsc_repl_size+0x4cc>
   273de:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
   273e2:	48 01 d0             	add    %rdx,%rax
   273e5:	3e ff e0             	notrack jmp *%rax
   273e8:	48 8d 43 10          	lea    0x10(%rbx),%rax
   273ec:	b9 01 00 00 00       	mov    $0x1,%ecx
   273f1:	31 f6                	xor    %esi,%esi
   273f3:	ba 02 00 00 00       	mov    $0x2,%edx
   273f8:	4c 89 e7             	mov    %r12,%rdi
   273fb:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   27402:	e8 a9 30 02 00       	call   4a4b0 <JS_NewObjectProtoClass>
   27407:	48 89 03             	mov    %rax,(%rbx)
   2740a:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2740e:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   27412:	0f 84 78 01 00 00    	je     27590 <JS_CallInternal+0x2600>
   27418:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   2741f:	41 0f b6 45 01       	movzbl 0x1(%r13),%eax
   27424:	49 83 c5 02          	add    $0x2,%r13
   27428:	49 89 c2             	mov    %rax,%r10
   2742b:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2742f:	ff e0                	jmp    *%rax
   27431:	48 8b 85 40 fe ff ff 	mov    -0x1c0(%rbp),%rax
   27438:	48 8b 40 38          	mov    0x38(%rax),%rax
   2743c:	48 85 c0             	test   %rax,%rax
   2743f:	0f 84 a5 80 00 00    	je     2f4ea <JS_CallInternal+0xa55a>
   27445:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   27449:	48 83 c3 10          	add    $0x10,%rbx
   2744d:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   27451:	48 c7 43 f8 ff ff ff 	movq   $0xffffffffffffffff,-0x8(%rbx)
   27458:	ff 
   27459:	eb c4                	jmp    2741f <JS_CallInternal+0x248f>
   2745b:	48 8d 43 10          	lea    0x10(%rbx),%rax
   2745f:	49 8b 94 24 58 01 00 	mov    0x158(%r12),%rdx
   27466:	00 
   27467:	48 c7 85 58 ff ff ff 	movq   $0x0,-0xa8(%rbp)
   2746e:	00 00 00 00 
   27472:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   27479:	8b 85 a8 fe ff ff    	mov    -0x158(%rbp),%eax
   2747f:	48 89 85 50 ff ff ff 	mov    %rax,-0xb0(%rbp)
   27486:	49 8b 84 24 50 01 00 	mov    0x150(%r12),%rax
   2748d:	00 
   2748e:	83 fa f6             	cmp    $0xfffffff6,%edx
   27491:	76 04                	jbe    27497 <JS_CallInternal+0x2507>
   27493:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   27497:	41 83 bc 24 68 01 00 	cmpl   $0xfffffff6,0x168(%r12)
   2749e:	00 f6 
   274a0:	48 89 85 60 ff ff ff 	mov    %rax,-0xa0(%rbp)
   274a7:	49 8b 84 24 60 01 00 	mov    0x160(%r12),%rax
   274ae:	00 
   274af:	48 89 95 68 ff ff ff 	mov    %rdx,-0x98(%rbp)
   274b6:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
   274bd:	76 04                	jbe    274c3 <JS_CallInternal+0x2533>
   274bf:	83 40 fc 02          	addl   $0x2,-0x4(%rax)
   274c3:	49 8b 74 24 38       	mov    0x38(%r12),%rsi
   274c8:	48 8d 8d 50 ff ff ff 	lea    -0xb0(%rbp),%rcx
   274cf:	ba 08 00 00 00       	mov    $0x8,%edx
   274d4:	4c 89 e7             	mov    %r12,%rdi
   274d7:	48 89 85 78 ff ff ff 	mov    %rax,-0x88(%rbp)
   274de:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   274e2:	e8 19 27 02 00       	call   49c00 <JS_NewObjectFromShape>
   274e7:	48 89 c1             	mov    %rax,%rcx
   274ea:	83 fa 06             	cmp    $0x6,%edx
   274ed:	0f 84 1a 77 00 00    	je     2ec0d <JS_CallInternal+0x9c7d>
   274f3:	8b 85 a8 fe ff ff    	mov    -0x158(%rbp),%eax
   274f9:	85 c0                	test   %eax,%eax
   274fb:	0f 8f 9e 74 00 00    	jg     2e99f <JS_CallInternal+0x9a0f>
   27501:	48 c7 41 30 00 00 00 	movq   $0x0,0x30(%rcx)
   27508:	00 
   27509:	89 41 38             	mov    %eax,0x38(%rcx)
   2750c:	48 89 0b             	mov    %rcx,(%rbx)
   2750f:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   27513:	e9 00 ff ff ff       	jmp    27418 <JS_CallInternal+0x2488>
   27518:	48 8b 95 b8 fe ff ff 	mov    -0x148(%rbp),%rdx
   2751f:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   27523:	48 8b 42 08          	mov    0x8(%rdx),%rax
   27527:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   2752b:	83 fa f6             	cmp    $0xfffffff6,%edx
   2752e:	76 04                	jbe    27534 <JS_CallInternal+0x25a4>
   27530:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   27534:	48 89 03             	mov    %rax,(%rbx)
   27537:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2753b:	48 89 cb             	mov    %rcx,%rbx
   2753e:	e9 dc fe ff ff       	jmp    2741f <JS_CallInternal+0x248f>
   27543:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   2754a:	48 8d 43 10          	lea    0x10(%rbx),%rax
   2754e:	48 8b 95 98 fe ff ff 	mov    -0x168(%rbp),%rdx
   27555:	4c 89 e7             	mov    %r12,%rdi
   27558:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2755f:	8b 85 a8 fe ff ff    	mov    -0x158(%rbp),%eax
   27565:	44 0f b7 41 38       	movzwl 0x38(%rcx),%r8d
   2756a:	48 8b 8d b8 fe ff ff 	mov    -0x148(%rbp),%rcx
   27571:	89 c6                	mov    %eax,%esi
   27573:	41 39 c0             	cmp    %eax,%r8d
   27576:	44 0f 4f c0          	cmovg  %eax,%r8d
   2757a:	e8 b1 2a 02 00       	call   4a030 <js_build_mapped_arguments>
   2757f:	48 89 03             	mov    %rax,(%rbx)
   27582:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   27586:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   2758a:	0f 85 88 fe ff ff    	jne    27418 <JS_CallInternal+0x2488>
   27590:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   27597:	e9 24 e1 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2759c:	48 8d 43 10          	lea    0x10(%rbx),%rax
   275a0:	31 f6                	xor    %esi,%esi
   275a2:	4c 89 e7             	mov    %r12,%rdi
   275a5:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   275ac:	e8 8f d8 ff ff       	call   24e40 <JS_GetScriptOrModuleName>
   275b1:	89 c2                	mov    %eax,%edx
   275b3:	85 d2                	test   %edx,%edx
   275b5:	0f 84 d9 6e 00 00    	je     2e494 <JS_CallInternal+0x9504>
   275bb:	49 8b 84 24 b8 01 00 	mov    0x1b8(%r12),%rax
   275c2:	00 
   275c3:	49 8d 8c 24 b0 01 00 	lea    0x1b0(%r12),%rcx
   275ca:	00 
   275cb:	48 39 c8             	cmp    %rcx,%rax
   275ce:	75 1d                	jne    275ed <JS_CallInternal+0x265d>
   275d0:	e9 95 6e 00 00       	jmp    2e46a <JS_CallInternal+0x94da>
   275d5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   275dc:	00 00 00 00 
   275e0:	48 8b 40 08          	mov    0x8(%rax),%rax
   275e4:	48 39 c8             	cmp    %rcx,%rax
   275e7:	0f 84 f9 6f 00 00    	je     2e5e6 <JS_CallInternal+0x9656>
   275ed:	3b 50 f8             	cmp    -0x8(%rax),%edx
   275f0:	75 ee                	jne    275e0 <JS_CallInternal+0x2650>
   275f2:	48 83 e8 18          	sub    $0x18,%rax
   275f6:	81 fa f2 00 00 00    	cmp    $0xf2,%edx
   275fc:	0f 8f f2 6f 00 00    	jg     2e5f4 <JS_CallInternal+0x9664>
   27602:	48 89 c6             	mov    %rax,%rsi
   27605:	4c 89 e7             	mov    %r12,%rdi
   27608:	e8 03 d9 ff ff       	call   24f10 <JS_GetImportMeta>
   2760d:	48 89 03             	mov    %rax,(%rbx)
   27610:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   27614:	83 fa 06             	cmp    $0x6,%edx
   27617:	0f 85 fb fd ff ff    	jne    27418 <JS_CallInternal+0x2488>
   2761d:	e9 6e ff ff ff       	jmp    27590 <JS_CallInternal+0x2600>
   27622:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   27628:	48 8d 43 10          	lea    0x10(%rbx),%rax
   2762c:	83 bd 78 fe ff ff f6 	cmpl   $0xfffffff6,-0x188(%rbp)
   27633:	76 0b                	jbe    27640 <JS_CallInternal+0x26b0>
   27635:	48 8b 8d 58 fe ff ff 	mov    -0x1a8(%rbp),%rcx
   2763c:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   27640:	48 8b 8d 58 fe ff ff 	mov    -0x1a8(%rbp),%rcx
   27647:	48 89 0b             	mov    %rcx,(%rbx)
   2764a:	48 8b 8d 78 fe ff ff 	mov    -0x188(%rbp),%rcx
   27651:	48 89 4b 08          	mov    %rcx,0x8(%rbx)
   27655:	48 89 c3             	mov    %rax,%rbx
   27658:	e9 c2 fd ff ff       	jmp    2741f <JS_CallInternal+0x248f>
   2765d:	f3 0f 1e fa          	endbr64
   27661:	49 8b 44 24 58       	mov    0x58(%r12),%rax
   27666:	b9 01 00 00 00       	mov    $0x1,%ecx
   2766b:	4c 89 e7             	mov    %r12,%rdi
   2766e:	48 8b 70 10          	mov    0x10(%rax),%rsi
   27672:	48 8b 50 18          	mov    0x18(%rax),%rdx
   27676:	e8 35 2e 02 00       	call   4a4b0 <JS_NewObjectProtoClass>
   2767b:	48 89 03             	mov    %rax,(%rbx)
   2767e:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   27682:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   27686:	0f 84 e3 61 00 00    	je     2d86f <JS_CallInternal+0x88df>
   2768c:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   27691:	48 83 c3 10          	add    $0x10,%rbx
   27695:	49 83 c5 01          	add    $0x1,%r13
   27699:	49 89 c2             	mov    %rax,%r10
   2769c:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   276a0:	ff e0                	jmp    *%rax
   276a2:	f3 0f 1e fa          	endbr64
   276a6:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   276ad:	49 83 c5 01          	add    $0x1,%r13
   276b1:	48 83 c3 10          	add    $0x10,%rbx
   276b5:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   276bc:	00 
   276bd:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   276c2:	49 89 c2             	mov    %rax,%r10
   276c5:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   276c9:	ff e0                	jmp    *%rax
   276cb:	f3 0f 1e fa          	endbr64
   276cf:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   276d6:	49 83 c5 01          	add    $0x1,%r13
   276da:	48 83 c3 10          	add    $0x10,%rbx
   276de:	48 c7 43 f8 02 00 00 	movq   $0x2,-0x8(%rbx)
   276e5:	00 
   276e6:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   276eb:	49 89 c2             	mov    %rax,%r10
   276ee:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   276f2:	ff e0                	jmp    *%rax
   276f4:	f3 0f 1e fa          	endbr64
   276f8:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   276ff:	49 83 c5 01          	add    $0x1,%r13
   27703:	48 83 c3 10          	add    $0x10,%rbx
   27707:	48 c7 43 f8 03 00 00 	movq   $0x3,-0x8(%rbx)
   2770e:	00 
   2770f:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   27714:	49 89 c2             	mov    %rax,%r10
   27717:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2771b:	ff e0                	jmp    *%rax
   2771d:	f3 0f 1e fa          	endbr64
   27721:	41 8b 75 00          	mov    0x0(%r13),%esi
   27725:	31 d2                	xor    %edx,%edx
   27727:	4c 89 e7             	mov    %r12,%rdi
   2772a:	48 83 c3 10          	add    $0x10,%rbx
   2772e:	49 83 c5 05          	add    $0x5,%r13
   27732:	e8 49 3c 01 00       	call   3b380 <__JS_AtomToValue>
   27737:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2773b:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2773f:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   27744:	49 89 c2             	mov    %rax,%r10
   27747:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2774b:	ff e0                	jmp    *%rax
   2774d:	f3 0f 1e fa          	endbr64
   27751:	ba 01 00 00 00       	mov    $0x1,%edx
   27756:	4c 89 e7             	mov    %r12,%rdi
   27759:	48 83 c3 10          	add    $0x10,%rbx
   2775d:	49 83 c5 01          	add    $0x1,%r13
   27761:	be 2f 00 00 00       	mov    $0x2f,%esi
   27766:	e8 15 3c 01 00       	call   3b380 <__JS_AtomToValue>
   2776b:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2776f:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   27773:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   27778:	49 89 c2             	mov    %rax,%r10
   2777b:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2777f:	ff e0                	jmp    *%rax
   27781:	f3 0f 1e fa          	endbr64
   27785:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   2778c:	49 83 c5 01          	add    $0x1,%r13
   27790:	48 83 c3 10          	add    $0x10,%rbx
   27794:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   2779b:	00 
   2779c:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   277a1:	49 89 c2             	mov    %rax,%r10
   277a4:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   277a8:	ff e0                	jmp    *%rax
   277aa:	f3 0f 1e fa          	endbr64
   277ae:	48 8b 85 c0 fe ff ff 	mov    -0x140(%rbp),%rax
   277b5:	f6 40 10 01          	testb  $0x1,0x10(%rax)
   277b9:	75 0d                	jne    277c8 <JS_CallInternal+0x2838>
   277bb:	83 bd 70 fe ff ff ff 	cmpl   $0xffffffff,-0x190(%rbp)
   277c2:	0f 85 56 71 00 00    	jne    2e91e <JS_CallInternal+0x998e>
   277c8:	83 bd 70 fe ff ff f6 	cmpl   $0xfffffff6,-0x190(%rbp)
   277cf:	76 0b                	jbe    277dc <JS_CallInternal+0x284c>
   277d1:	48 8b 85 50 fe ff ff 	mov    -0x1b0(%rbp),%rax
   277d8:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   277dc:	48 8b 85 70 fe ff ff 	mov    -0x190(%rbp),%rax
   277e3:	48 8b 95 50 fe ff ff 	mov    -0x1b0(%rbp),%rdx
   277ea:	48 89 13             	mov    %rdx,(%rbx)
   277ed:	49 83 c5 01          	add    $0x1,%r13
   277f1:	48 83 c3 10          	add    $0x10,%rbx
   277f5:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   277f9:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   277fe:	49 89 c2             	mov    %rax,%r10
   27801:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27805:	ff e0                	jmp    *%rax
   27807:	f3 0f 1e fa          	endbr64
   2780b:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   27812:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   27816:	48 8b 40 10          	mov    0x10(%rax),%rax
   2781a:	48 8b 40 18          	mov    0x18(%rax),%rax
   2781e:	48 8b 10             	mov    (%rax),%rdx
   27821:	48 8b 40 08          	mov    0x8(%rax),%rax
   27825:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27828:	76 04                	jbe    2782e <JS_CallInternal+0x289e>
   2782a:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2782e:	48 89 13             	mov    %rdx,(%rbx)
   27831:	49 83 c5 01          	add    $0x1,%r13
   27835:	48 89 43 08          	mov    %rax,0x8(%rbx)
   27839:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2783e:	48 89 cb             	mov    %rcx,%rbx
   27841:	49 89 c2             	mov    %rax,%r10
   27844:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27848:	ff e0                	jmp    *%rax
   2784a:	f3 0f 1e fa          	endbr64
   2784e:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   27855:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   27859:	48 8b 40 08          	mov    0x8(%rax),%rax
   2785d:	48 8b 40 18          	mov    0x18(%rax),%rax
   27861:	48 8b 10             	mov    (%rax),%rdx
   27864:	48 8b 40 08          	mov    0x8(%rax),%rax
   27868:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2786b:	76 04                	jbe    27871 <JS_CallInternal+0x28e1>
   2786d:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27871:	48 89 13             	mov    %rdx,(%rbx)
   27874:	49 83 c5 01          	add    $0x1,%r13
   27878:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2787c:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   27881:	48 89 cb             	mov    %rcx,%rbx
   27884:	49 89 c2             	mov    %rax,%r10
   27887:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2788b:	ff e0                	jmp    *%rax
   2788d:	f3 0f 1e fa          	endbr64
   27891:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   27898:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   2789c:	48 8b 00             	mov    (%rax),%rax
   2789f:	48 8b 40 18          	mov    0x18(%rax),%rax
   278a3:	48 8b 10             	mov    (%rax),%rdx
   278a6:	48 8b 40 08          	mov    0x8(%rax),%rax
   278aa:	83 f8 f6             	cmp    $0xfffffff6,%eax
   278ad:	76 04                	jbe    278b3 <JS_CallInternal+0x2923>
   278af:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   278b3:	48 89 13             	mov    %rdx,(%rbx)
   278b6:	49 83 c5 01          	add    $0x1,%r13
   278ba:	48 89 43 08          	mov    %rax,0x8(%rbx)
   278be:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   278c3:	48 89 cb             	mov    %rcx,%rbx
   278c6:	49 89 c2             	mov    %rax,%r10
   278c9:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   278cd:	ff e0                	jmp    *%rax
   278cf:	f3 0f 1e fa          	endbr64
   278d3:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   278d7:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   278db:	83 fa f6             	cmp    $0xfffffff6,%edx
   278de:	76 04                	jbe    278e4 <JS_CallInternal+0x2954>
   278e0:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   278e4:	48 8b bd 80 fe ff ff 	mov    -0x180(%rbp),%rdi
   278eb:	48 8b 47 38          	mov    0x38(%rdi),%rax
   278ef:	48 8b 77 30          	mov    0x30(%rdi),%rsi
   278f3:	48 89 57 38          	mov    %rdx,0x38(%rdi)
   278f7:	48 89 4f 30          	mov    %rcx,0x30(%rdi)
   278fb:	83 f8 f6             	cmp    $0xfffffff6,%eax
   278fe:	76 11                	jbe    27911 <JS_CallInternal+0x2981>
   27900:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   27903:	8d 51 ff             	lea    -0x1(%rcx),%edx
   27906:	89 56 fc             	mov    %edx,-0x4(%rsi)
   27909:	85 d2                	test   %edx,%edx
   2790b:	0f 8e 52 56 00 00    	jle    2cf63 <JS_CallInternal+0x7fd3>
   27911:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   27916:	49 83 c5 01          	add    $0x1,%r13
   2791a:	49 89 c2             	mov    %rax,%r10
   2791d:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27921:	ff e0                	jmp    *%rax
   27923:	f3 0f 1e fa          	endbr64
   27927:	48 8b 95 80 fe ff ff 	mov    -0x180(%rbp),%rdx
   2792e:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   27933:	48 83 eb 10          	sub    $0x10,%rbx
   27937:	48 8b 42 28          	mov    0x28(%rdx),%rax
   2793b:	48 8b 4a 20          	mov    0x20(%rdx),%rcx
   2793f:	0f 11 42 20          	movups %xmm0,0x20(%rdx)
   27943:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27946:	76 11                	jbe    27959 <JS_CallInternal+0x29c9>
   27948:	8b 71 fc             	mov    -0x4(%rcx),%esi
   2794b:	8d 56 ff             	lea    -0x1(%rsi),%edx
   2794e:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27951:	85 d2                	test   %edx,%edx
   27953:	0f 8e 1c 56 00 00    	jle    2cf75 <JS_CallInternal+0x7fe5>
   27959:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2795e:	49 83 c5 01          	add    $0x1,%r13
   27962:	49 89 c2             	mov    %rax,%r10
   27965:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27969:	ff e0                	jmp    *%rax
   2796b:	f3 0f 1e fa          	endbr64
   2796f:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   27973:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   27977:	83 fa f6             	cmp    $0xfffffff6,%edx
   2797a:	76 04                	jbe    27980 <JS_CallInternal+0x29f0>
   2797c:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   27980:	48 8b bd 80 fe ff ff 	mov    -0x180(%rbp),%rdi
   27987:	48 8b 47 28          	mov    0x28(%rdi),%rax
   2798b:	48 8b 77 20          	mov    0x20(%rdi),%rsi
   2798f:	48 89 57 28          	mov    %rdx,0x28(%rdi)
   27993:	48 89 4f 20          	mov    %rcx,0x20(%rdi)
   27997:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2799a:	76 11                	jbe    279ad <JS_CallInternal+0x2a1d>
   2799c:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   2799f:	8d 51 ff             	lea    -0x1(%rcx),%edx
   279a2:	89 56 fc             	mov    %edx,-0x4(%rsi)
   279a5:	85 d2                	test   %edx,%edx
   279a7:	0f 8e 6b 55 00 00    	jle    2cf18 <JS_CallInternal+0x7f88>
   279ad:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   279b2:	49 83 c5 01          	add    $0x1,%r13
   279b6:	49 89 c2             	mov    %rax,%r10
   279b9:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   279bd:	ff e0                	jmp    *%rax
   279bf:	f3 0f 1e fa          	endbr64
   279c3:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   279ca:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   279ce:	48 8b 50 20          	mov    0x20(%rax),%rdx
   279d2:	48 8b 40 28          	mov    0x28(%rax),%rax
   279d6:	83 f8 f6             	cmp    $0xfffffff6,%eax
   279d9:	76 04                	jbe    279df <JS_CallInternal+0x2a4f>
   279db:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   279df:	48 89 13             	mov    %rdx,(%rbx)
   279e2:	49 83 c5 01          	add    $0x1,%r13
   279e6:	48 89 43 08          	mov    %rax,0x8(%rbx)
   279ea:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   279ef:	48 89 cb             	mov    %rcx,%rbx
   279f2:	49 89 c2             	mov    %rax,%r10
   279f5:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   279f9:	ff e0                	jmp    *%rax
   279fb:	f3 0f 1e fa          	endbr64
   279ff:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   27a06:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   27a0a:	48 8b 50 10          	mov    0x10(%rax),%rdx
   27a0e:	48 8b 40 18          	mov    0x18(%rax),%rax
   27a12:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27a15:	76 04                	jbe    27a1b <JS_CallInternal+0x2a8b>
   27a17:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27a1b:	48 89 13             	mov    %rdx,(%rbx)
   27a1e:	49 83 c5 01          	add    $0x1,%r13
   27a22:	48 89 43 08          	mov    %rax,0x8(%rbx)
   27a26:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   27a2b:	48 89 cb             	mov    %rcx,%rbx
   27a2e:	49 89 c2             	mov    %rax,%r10
   27a31:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27a35:	ff e0                	jmp    *%rax
   27a37:	f3 0f 1e fa          	endbr64
   27a3b:	48 8b 8d 80 fe ff ff 	mov    -0x180(%rbp),%rcx
   27a42:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   27a46:	48 8b 01             	mov    (%rcx),%rax
   27a49:	83 fa ff             	cmp    $0xffffffff,%edx
   27a4c:	0f 84 f3 46 00 00    	je     2c145 <JS_CallInternal+0x71b5>
   27a52:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   27a56:	83 fa f6             	cmp    $0xfffffff6,%edx
   27a59:	76 04                	jbe    27a5f <JS_CallInternal+0x2acf>
   27a5b:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   27a5f:	48 89 03             	mov    %rax,(%rbx)
   27a62:	4c 89 e8             	mov    %r13,%rax
   27a65:	4d 8d 6d 01          	lea    0x1(%r13),%r13
   27a69:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   27a6d:	0f b6 00             	movzbl (%rax),%eax
   27a70:	48 89 cb             	mov    %rcx,%rbx
   27a73:	49 89 c2             	mov    %rax,%r10
   27a76:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   27a7a:	f3 0f 1e fa          	endbr64
   27a7e:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   27a85:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   27a89:	48 8b 10             	mov    (%rax),%rdx
   27a8c:	48 8b 40 08          	mov    0x8(%rax),%rax
   27a90:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27a93:	76 04                	jbe    27a99 <JS_CallInternal+0x2b09>
   27a95:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27a99:	48 89 13             	mov    %rdx,(%rbx)
   27a9c:	49 83 c5 01          	add    $0x1,%r13
   27aa0:	48 89 43 08          	mov    %rax,0x8(%rbx)
   27aa4:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   27aa9:	48 89 cb             	mov    %rcx,%rbx
   27aac:	49 89 c2             	mov    %rax,%r10
   27aaf:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27ab3:	ff e0                	jmp    *%rax
   27ab5:	f3 0f 1e fa          	endbr64
   27ab9:	48 8b 95 80 fe ff ff 	mov    -0x180(%rbp),%rdx
   27ac0:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   27ac5:	48 83 eb 10          	sub    $0x10,%rbx
   27ac9:	48 8b 42 08          	mov    0x8(%rdx),%rax
   27acd:	48 8b 0a             	mov    (%rdx),%rcx
   27ad0:	0f 11 02             	movups %xmm0,(%rdx)
   27ad3:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27ad6:	76 11                	jbe    27ae9 <JS_CallInternal+0x2b59>
   27ad8:	8b 71 fc             	mov    -0x4(%rcx),%esi
   27adb:	8d 56 ff             	lea    -0x1(%rsi),%edx
   27ade:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27ae1:	85 d2                	test   %edx,%edx
   27ae3:	0f 8e b6 54 00 00    	jle    2cf9f <JS_CallInternal+0x800f>
   27ae9:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   27aee:	49 83 c5 01          	add    $0x1,%r13
   27af2:	49 89 c2             	mov    %rax,%r10
   27af5:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27af9:	ff e0                	jmp    *%rax
   27afb:	f3 0f 1e fa          	endbr64
   27aff:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   27b06:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   27b0a:	48 8b 50 30          	mov    0x30(%rax),%rdx
   27b0e:	48 8b 40 38          	mov    0x38(%rax),%rax
   27b12:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27b15:	76 04                	jbe    27b1b <JS_CallInternal+0x2b8b>
   27b17:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27b1b:	48 89 13             	mov    %rdx,(%rbx)
   27b1e:	49 83 c5 01          	add    $0x1,%r13
   27b22:	48 89 43 08          	mov    %rax,0x8(%rbx)
   27b26:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   27b2b:	48 89 cb             	mov    %rcx,%rbx
   27b2e:	49 89 c2             	mov    %rax,%r10
   27b31:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27b35:	ff e0                	jmp    *%rax
   27b37:	f3 0f 1e fa          	endbr64
   27b3b:	48 8b 95 80 fe ff ff 	mov    -0x180(%rbp),%rdx
   27b42:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   27b47:	48 83 eb 10          	sub    $0x10,%rbx
   27b4b:	48 8b 42 18          	mov    0x18(%rdx),%rax
   27b4f:	48 8b 4a 10          	mov    0x10(%rdx),%rcx
   27b53:	0f 11 42 10          	movups %xmm0,0x10(%rdx)
   27b57:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27b5a:	76 11                	jbe    27b6d <JS_CallInternal+0x2bdd>
   27b5c:	8b 51 fc             	mov    -0x4(%rcx),%edx
   27b5f:	83 ea 01             	sub    $0x1,%edx
   27b62:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27b65:	85 d2                	test   %edx,%edx
   27b67:	0f 8e 1d 54 00 00    	jle    2cf8a <JS_CallInternal+0x7ffa>
   27b6d:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   27b72:	49 83 c5 01          	add    $0x1,%r13
   27b76:	49 89 c2             	mov    %rax,%r10
   27b79:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27b7d:	ff e0                	jmp    *%rax
   27b7f:	f3 0f 1e fa          	endbr64
   27b83:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   27b87:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   27b8b:	83 fa f6             	cmp    $0xfffffff6,%edx
   27b8e:	76 04                	jbe    27b94 <JS_CallInternal+0x2c04>
   27b90:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   27b94:	48 8b bd 80 fe ff ff 	mov    -0x180(%rbp),%rdi
   27b9b:	48 8b 47 08          	mov    0x8(%rdi),%rax
   27b9f:	48 8b 37             	mov    (%rdi),%rsi
   27ba2:	48 89 57 08          	mov    %rdx,0x8(%rdi)
   27ba6:	48 89 0f             	mov    %rcx,(%rdi)
   27ba9:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27bac:	76 11                	jbe    27bbf <JS_CallInternal+0x2c2f>
   27bae:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   27bb1:	8d 51 ff             	lea    -0x1(%rcx),%edx
   27bb4:	89 56 fc             	mov    %edx,-0x4(%rsi)
   27bb7:	85 d2                	test   %edx,%edx
   27bb9:	0f 8e 7d 53 00 00    	jle    2cf3c <JS_CallInternal+0x7fac>
   27bbf:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   27bc4:	49 83 c5 01          	add    $0x1,%r13
   27bc8:	49 89 c2             	mov    %rax,%r10
   27bcb:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27bcf:	ff e0                	jmp    *%rax
   27bd1:	f3 0f 1e fa          	endbr64
   27bd5:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   27bd9:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   27bdd:	83 fa f6             	cmp    $0xfffffff6,%edx
   27be0:	76 04                	jbe    27be6 <JS_CallInternal+0x2c56>
   27be2:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   27be6:	48 8b bd 80 fe ff ff 	mov    -0x180(%rbp),%rdi
   27bed:	48 8b 47 18          	mov    0x18(%rdi),%rax
   27bf1:	48 8b 77 10          	mov    0x10(%rdi),%rsi
   27bf5:	48 89 57 18          	mov    %rdx,0x18(%rdi)
   27bf9:	48 89 4f 10          	mov    %rcx,0x10(%rdi)
   27bfd:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27c00:	76 11                	jbe    27c13 <JS_CallInternal+0x2c83>
   27c02:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   27c05:	8d 51 ff             	lea    -0x1(%rcx),%edx
   27c08:	89 56 fc             	mov    %edx,-0x4(%rsi)
   27c0b:	85 d2                	test   %edx,%edx
   27c0d:	0f 8e 17 53 00 00    	jle    2cf2a <JS_CallInternal+0x7f9a>
   27c13:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   27c18:	49 83 c5 01          	add    $0x1,%r13
   27c1c:	49 89 c2             	mov    %rax,%r10
   27c1f:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27c23:	ff e0                	jmp    *%rax
   27c25:	f3 0f 1e fa          	endbr64
   27c29:	48 8b b5 80 fe ff ff 	mov    -0x180(%rbp),%rsi
   27c30:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   27c35:	48 83 eb 10          	sub    $0x10,%rbx
   27c39:	48 8b 46 38          	mov    0x38(%rsi),%rax
   27c3d:	48 8b 4e 30          	mov    0x30(%rsi),%rcx
   27c41:	0f 11 46 30          	movups %xmm0,0x30(%rsi)
   27c45:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27c48:	76 11                	jbe    27c5b <JS_CallInternal+0x2ccb>
   27c4a:	8b 51 fc             	mov    -0x4(%rcx),%edx
   27c4d:	83 ea 01             	sub    $0x1,%edx
   27c50:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27c53:	85 d2                	test   %edx,%edx
   27c55:	0f 8e f3 52 00 00    	jle    2cf4e <JS_CallInternal+0x7fbe>
   27c5b:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   27c60:	49 83 c5 01          	add    $0x1,%r13
   27c64:	49 89 c2             	mov    %rax,%r10
   27c67:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27c6b:	ff e0                	jmp    *%rax
   27c6d:	f3 0f 1e fa          	endbr64
   27c71:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   27c75:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   27c79:	83 fa f6             	cmp    $0xfffffff6,%edx
   27c7c:	76 04                	jbe    27c82 <JS_CallInternal+0x2cf2>
   27c7e:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   27c82:	48 8b bd a0 fe ff ff 	mov    -0x160(%rbp),%rdi
   27c89:	48 8b 47 38          	mov    0x38(%rdi),%rax
   27c8d:	48 8b 77 30          	mov    0x30(%rdi),%rsi
   27c91:	48 89 57 38          	mov    %rdx,0x38(%rdi)
   27c95:	48 89 4f 30          	mov    %rcx,0x30(%rdi)
   27c99:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27c9c:	76 11                	jbe    27caf <JS_CallInternal+0x2d1f>
   27c9e:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   27ca1:	8d 51 ff             	lea    -0x1(%rcx),%edx
   27ca4:	89 56 fc             	mov    %edx,-0x4(%rsi)
   27ca7:	85 d2                	test   %edx,%edx
   27ca9:	0f 8e 21 52 00 00    	jle    2ced0 <JS_CallInternal+0x7f40>
   27caf:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   27cb4:	49 83 c5 01          	add    $0x1,%r13
   27cb8:	49 89 c2             	mov    %rax,%r10
   27cbb:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27cbf:	ff e0                	jmp    *%rax
   27cc1:	f3 0f 1e fa          	endbr64
   27cc5:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   27cc9:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   27ccd:	83 fa f6             	cmp    $0xfffffff6,%edx
   27cd0:	76 04                	jbe    27cd6 <JS_CallInternal+0x2d46>
   27cd2:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   27cd6:	48 8b bd a0 fe ff ff 	mov    -0x160(%rbp),%rdi
   27cdd:	48 8b 47 18          	mov    0x18(%rdi),%rax
   27ce1:	48 8b 77 10          	mov    0x10(%rdi),%rsi
   27ce5:	48 89 57 18          	mov    %rdx,0x18(%rdi)
   27ce9:	48 89 4f 10          	mov    %rcx,0x10(%rdi)
   27ced:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27cf0:	76 11                	jbe    27d03 <JS_CallInternal+0x2d73>
   27cf2:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   27cf5:	8d 51 ff             	lea    -0x1(%rcx),%edx
   27cf8:	89 56 fc             	mov    %edx,-0x4(%rsi)
   27cfb:	85 d2                	test   %edx,%edx
   27cfd:	0f 8e f1 51 00 00    	jle    2cef4 <JS_CallInternal+0x7f64>
   27d03:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   27d08:	49 83 c5 01          	add    $0x1,%r13
   27d0c:	49 89 c2             	mov    %rax,%r10
   27d0f:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27d13:	ff e0                	jmp    *%rax
   27d15:	f3 0f 1e fa          	endbr64
   27d19:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   27d1d:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   27d21:	83 fa f6             	cmp    $0xfffffff6,%edx
   27d24:	76 04                	jbe    27d2a <JS_CallInternal+0x2d9a>
   27d26:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   27d2a:	48 8b bd a0 fe ff ff 	mov    -0x160(%rbp),%rdi
   27d31:	48 8b 47 28          	mov    0x28(%rdi),%rax
   27d35:	48 8b 77 20          	mov    0x20(%rdi),%rsi
   27d39:	48 89 57 28          	mov    %rdx,0x28(%rdi)
   27d3d:	48 89 4f 20          	mov    %rcx,0x20(%rdi)
   27d41:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27d44:	76 11                	jbe    27d57 <JS_CallInternal+0x2dc7>
   27d46:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   27d49:	8d 51 ff             	lea    -0x1(%rcx),%edx
   27d4c:	89 56 fc             	mov    %edx,-0x4(%rsi)
   27d4f:	85 d2                	test   %edx,%edx
   27d51:	0f 8e 8b 51 00 00    	jle    2cee2 <JS_CallInternal+0x7f52>
   27d57:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   27d5c:	49 83 c5 01          	add    $0x1,%r13
   27d60:	49 89 c2             	mov    %rax,%r10
   27d63:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27d67:	ff e0                	jmp    *%rax
   27d69:	f3 0f 1e fa          	endbr64
   27d6d:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   27d71:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   27d75:	83 fa f6             	cmp    $0xfffffff6,%edx
   27d78:	76 04                	jbe    27d7e <JS_CallInternal+0x2dee>
   27d7a:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   27d7e:	48 8b bd a0 fe ff ff 	mov    -0x160(%rbp),%rdi
   27d85:	48 8b 47 08          	mov    0x8(%rdi),%rax
   27d89:	48 8b 37             	mov    (%rdi),%rsi
   27d8c:	48 89 57 08          	mov    %rdx,0x8(%rdi)
   27d90:	48 89 0f             	mov    %rcx,(%rdi)
   27d93:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27d96:	76 11                	jbe    27da9 <JS_CallInternal+0x2e19>
   27d98:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   27d9b:	8d 51 ff             	lea    -0x1(%rcx),%edx
   27d9e:	89 56 fc             	mov    %edx,-0x4(%rsi)
   27da1:	85 d2                	test   %edx,%edx
   27da3:	0f 8e 5d 51 00 00    	jle    2cf06 <JS_CallInternal+0x7f76>
   27da9:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   27dae:	49 83 c5 01          	add    $0x1,%r13
   27db2:	49 89 c2             	mov    %rax,%r10
   27db5:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27db9:	ff e0                	jmp    *%rax
   27dbb:	f3 0f 1e fa          	endbr64
   27dbf:	48 8b 95 a0 fe ff ff 	mov    -0x160(%rbp),%rdx
   27dc6:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   27dcb:	48 83 eb 10          	sub    $0x10,%rbx
   27dcf:	48 8b 42 38          	mov    0x38(%rdx),%rax
   27dd3:	48 8b 4a 30          	mov    0x30(%rdx),%rcx
   27dd7:	0f 11 42 30          	movups %xmm0,0x30(%rdx)
   27ddb:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27dde:	76 11                	jbe    27df1 <JS_CallInternal+0x2e61>
   27de0:	8b 51 fc             	mov    -0x4(%rcx),%edx
   27de3:	83 ea 01             	sub    $0x1,%edx
   27de6:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27de9:	85 d2                	test   %edx,%edx
   27deb:	0f 8e c5 54 00 00    	jle    2d2b6 <JS_CallInternal+0x8326>
   27df1:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   27df6:	49 83 c5 01          	add    $0x1,%r13
   27dfa:	49 89 c2             	mov    %rax,%r10
   27dfd:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27e01:	ff e0                	jmp    *%rax
   27e03:	f3 0f 1e fa          	endbr64
   27e07:	48 8b 95 a0 fe ff ff 	mov    -0x160(%rbp),%rdx
   27e0e:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   27e13:	48 83 eb 10          	sub    $0x10,%rbx
   27e17:	48 8b 42 18          	mov    0x18(%rdx),%rax
   27e1b:	48 8b 4a 10          	mov    0x10(%rdx),%rcx
   27e1f:	0f 11 42 10          	movups %xmm0,0x10(%rdx)
   27e23:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27e26:	76 11                	jbe    27e39 <JS_CallInternal+0x2ea9>
   27e28:	8b 51 fc             	mov    -0x4(%rcx),%edx
   27e2b:	83 ea 01             	sub    $0x1,%edx
   27e2e:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27e31:	85 d2                	test   %edx,%edx
   27e33:	0f 8e e0 55 00 00    	jle    2d419 <JS_CallInternal+0x8489>
   27e39:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   27e3e:	49 83 c5 01          	add    $0x1,%r13
   27e42:	49 89 c2             	mov    %rax,%r10
   27e45:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27e49:	ff e0                	jmp    *%rax
   27e4b:	f3 0f 1e fa          	endbr64
   27e4f:	48 8b 95 a0 fe ff ff 	mov    -0x160(%rbp),%rdx
   27e56:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   27e5b:	48 83 eb 10          	sub    $0x10,%rbx
   27e5f:	48 8b 42 28          	mov    0x28(%rdx),%rax
   27e63:	48 8b 4a 20          	mov    0x20(%rdx),%rcx
   27e67:	0f 11 42 20          	movups %xmm0,0x20(%rdx)
   27e6b:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27e6e:	76 11                	jbe    27e81 <JS_CallInternal+0x2ef1>
   27e70:	8b 71 fc             	mov    -0x4(%rcx),%esi
   27e73:	8d 56 ff             	lea    -0x1(%rsi),%edx
   27e76:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27e79:	85 d2                	test   %edx,%edx
   27e7b:	0f 8e c2 55 00 00    	jle    2d443 <JS_CallInternal+0x84b3>
   27e81:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   27e86:	49 83 c5 01          	add    $0x1,%r13
   27e8a:	49 89 c2             	mov    %rax,%r10
   27e8d:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27e91:	ff e0                	jmp    *%rax
   27e93:	f3 0f 1e fa          	endbr64
   27e97:	48 8b 95 a0 fe ff ff 	mov    -0x160(%rbp),%rdx
   27e9e:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   27ea3:	48 83 eb 10          	sub    $0x10,%rbx
   27ea7:	48 8b 42 08          	mov    0x8(%rdx),%rax
   27eab:	48 8b 0a             	mov    (%rdx),%rcx
   27eae:	0f 11 02             	movups %xmm0,(%rdx)
   27eb1:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27eb4:	76 11                	jbe    27ec7 <JS_CallInternal+0x2f37>
   27eb6:	8b 71 fc             	mov    -0x4(%rcx),%esi
   27eb9:	8d 56 ff             	lea    -0x1(%rsi),%edx
   27ebc:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27ebf:	85 d2                	test   %edx,%edx
   27ec1:	0f 8e 67 55 00 00    	jle    2d42e <JS_CallInternal+0x849e>
   27ec7:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   27ecc:	49 83 c5 01          	add    $0x1,%r13
   27ed0:	49 89 c2             	mov    %rax,%r10
   27ed3:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27ed7:	ff e0                	jmp    *%rax
   27ed9:	f3 0f 1e fa          	endbr64
   27edd:	48 8b 85 a0 fe ff ff 	mov    -0x160(%rbp),%rax
   27ee4:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   27ee8:	48 8b 50 30          	mov    0x30(%rax),%rdx
   27eec:	48 8b 40 38          	mov    0x38(%rax),%rax
   27ef0:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27ef3:	76 04                	jbe    27ef9 <JS_CallInternal+0x2f69>
   27ef5:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27ef9:	48 89 13             	mov    %rdx,(%rbx)
   27efc:	49 83 c5 01          	add    $0x1,%r13
   27f00:	48 89 43 08          	mov    %rax,0x8(%rbx)
   27f04:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   27f09:	48 89 cb             	mov    %rcx,%rbx
   27f0c:	49 89 c2             	mov    %rax,%r10
   27f0f:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27f13:	ff e0                	jmp    *%rax
   27f15:	f3 0f 1e fa          	endbr64
   27f19:	48 8b 85 a0 fe ff ff 	mov    -0x160(%rbp),%rax
   27f20:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   27f24:	48 8b 50 20          	mov    0x20(%rax),%rdx
   27f28:	48 8b 40 28          	mov    0x28(%rax),%rax
   27f2c:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27f2f:	76 04                	jbe    27f35 <JS_CallInternal+0x2fa5>
   27f31:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27f35:	48 89 13             	mov    %rdx,(%rbx)
   27f38:	49 83 c5 01          	add    $0x1,%r13
   27f3c:	48 89 43 08          	mov    %rax,0x8(%rbx)
   27f40:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   27f45:	48 89 cb             	mov    %rcx,%rbx
   27f48:	49 89 c2             	mov    %rax,%r10
   27f4b:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27f4f:	ff e0                	jmp    *%rax
   27f51:	f3 0f 1e fa          	endbr64
   27f55:	48 8b 85 a0 fe ff ff 	mov    -0x160(%rbp),%rax
   27f5c:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   27f60:	48 8b 50 10          	mov    0x10(%rax),%rdx
   27f64:	48 8b 40 18          	mov    0x18(%rax),%rax
   27f68:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27f6b:	76 04                	jbe    27f71 <JS_CallInternal+0x2fe1>
   27f6d:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27f71:	48 89 13             	mov    %rdx,(%rbx)
   27f74:	49 83 c5 01          	add    $0x1,%r13
   27f78:	48 89 43 08          	mov    %rax,0x8(%rbx)
   27f7c:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   27f81:	48 89 cb             	mov    %rcx,%rbx
   27f84:	49 89 c2             	mov    %rax,%r10
   27f87:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27f8b:	ff e0                	jmp    *%rax
   27f8d:	f3 0f 1e fa          	endbr64
   27f91:	48 8b 8d a0 fe ff ff 	mov    -0x160(%rbp),%rcx
   27f98:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   27f9c:	48 8b 01             	mov    (%rcx),%rax
   27f9f:	83 fa ff             	cmp    $0xffffffff,%edx
   27fa2:	0f 84 e0 3f 00 00    	je     2bf88 <JS_CallInternal+0x6ff8>
   27fa8:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   27fac:	83 fa f6             	cmp    $0xfffffff6,%edx
   27faf:	76 04                	jbe    27fb5 <JS_CallInternal+0x3025>
   27fb1:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   27fb5:	48 89 03             	mov    %rax,(%rbx)
   27fb8:	4c 89 e8             	mov    %r13,%rax
   27fbb:	4d 8d 6d 01          	lea    0x1(%r13),%r13
   27fbf:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   27fc3:	0f b6 00             	movzbl (%rax),%eax
   27fc6:	48 89 cb             	mov    %rcx,%rbx
   27fc9:	49 89 c2             	mov    %rax,%r10
   27fcc:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   27fd0:	f3 0f 1e fa          	endbr64
   27fd4:	48 8b 85 a0 fe ff ff 	mov    -0x160(%rbp),%rax
   27fdb:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   27fdf:	48 8b 10             	mov    (%rax),%rdx
   27fe2:	48 8b 40 08          	mov    0x8(%rax),%rax
   27fe6:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27fe9:	76 04                	jbe    27fef <JS_CallInternal+0x305f>
   27feb:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27fef:	48 89 13             	mov    %rdx,(%rbx)
   27ff2:	49 83 c5 01          	add    $0x1,%r13
   27ff6:	48 89 43 08          	mov    %rax,0x8(%rbx)
   27ffa:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   27fff:	48 89 cb             	mov    %rcx,%rbx
   28002:	49 89 c2             	mov    %rax,%r10
   28005:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28009:	ff e0                	jmp    *%rax
   2800b:	f3 0f 1e fa          	endbr64
   2800f:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   28013:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   28017:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   2801a:	76 04                	jbe    28020 <JS_CallInternal+0x3090>
   2801c:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   28020:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   28025:	48 c1 e0 04          	shl    $0x4,%rax
   28029:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   28030:	48 8b 50 08          	mov    0x8(%rax),%rdx
   28034:	48 8b 38             	mov    (%rax),%rdi
   28037:	48 89 48 08          	mov    %rcx,0x8(%rax)
   2803b:	48 89 30             	mov    %rsi,(%rax)
   2803e:	83 fa f6             	cmp    $0xfffffff6,%edx
   28041:	76 11                	jbe    28054 <JS_CallInternal+0x30c4>
   28043:	8b 47 fc             	mov    -0x4(%rdi),%eax
   28046:	83 e8 01             	sub    $0x1,%eax
   28049:	89 47 fc             	mov    %eax,-0x4(%rdi)
   2804c:	85 c0                	test   %eax,%eax
   2804e:	0f 8e dd 51 00 00    	jle    2d231 <JS_CallInternal+0x82a1>
   28054:	41 0f b6 45 01       	movzbl 0x1(%r13),%eax
   28059:	49 83 c5 02          	add    $0x2,%r13
   2805d:	49 89 c2             	mov    %rax,%r10
   28060:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28064:	ff e0                	jmp    *%rax
   28066:	f3 0f 1e fa          	endbr64
   2806a:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2806f:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   28074:	48 83 eb 10          	sub    $0x10,%rbx
   28078:	48 c1 e0 04          	shl    $0x4,%rax
   2807c:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   28083:	48 8b 50 08          	mov    0x8(%rax),%rdx
   28087:	48 8b 08             	mov    (%rax),%rcx
   2808a:	0f 11 00             	movups %xmm0,(%rax)
   2808d:	83 fa f6             	cmp    $0xfffffff6,%edx
   28090:	76 11                	jbe    280a3 <JS_CallInternal+0x3113>
   28092:	8b 41 fc             	mov    -0x4(%rcx),%eax
   28095:	83 e8 01             	sub    $0x1,%eax
   28098:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2809b:	85 c0                	test   %eax,%eax
   2809d:	0f 8e 7c 51 00 00    	jle    2d21f <JS_CallInternal+0x828f>
   280a3:	41 0f b6 45 01       	movzbl 0x1(%r13),%eax
   280a8:	49 83 c5 02          	add    $0x2,%r13
   280ac:	49 89 c2             	mov    %rax,%r10
   280af:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   280b3:	ff e0                	jmp    *%rax
   280b5:	f3 0f 1e fa          	endbr64
   280b9:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   280be:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   280c2:	48 c1 e0 04          	shl    $0x4,%rax
   280c6:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   280cd:	48 8b 10             	mov    (%rax),%rdx
   280d0:	48 8b 40 08          	mov    0x8(%rax),%rax
   280d4:	83 f8 f6             	cmp    $0xfffffff6,%eax
   280d7:	76 04                	jbe    280dd <JS_CallInternal+0x314d>
   280d9:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   280dd:	48 89 13             	mov    %rdx,(%rbx)
   280e0:	49 83 c5 02          	add    $0x2,%r13
   280e4:	48 89 43 08          	mov    %rax,0x8(%rbx)
   280e8:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   280ed:	48 89 cb             	mov    %rcx,%rbx
   280f0:	49 89 c2             	mov    %rax,%r10
   280f3:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   280f7:	ff e0                	jmp    *%rax
   280f9:	f3 0f 1e fa          	endbr64
   280fd:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   28101:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   28105:	4c 89 e7             	mov    %r12,%rdi
   28108:	4c 8d 7b f0          	lea    -0x10(%rbx),%r15
   2810c:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   28113:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   28117:	4d 8b 47 08          	mov    0x8(%r15),%r8
   2811b:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2811f:	e8 7c b2 08 00       	call   b33a0 <js_dynamic_import>
   28124:	48 89 c1             	mov    %rax,%rcx
   28127:	48 89 d0             	mov    %rdx,%rax
   2812a:	83 fa 06             	cmp    $0x6,%edx
   2812d:	0f 84 8e 53 00 00    	je     2d4c1 <JS_CallInternal+0x8531>
   28133:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   28137:	83 fe f6             	cmp    $0xfffffff6,%esi
   2813a:	76 15                	jbe    28151 <JS_CallInternal+0x31c1>
   2813c:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   28140:	8b 5f fc             	mov    -0x4(%rdi),%ebx
   28143:	8d 53 ff             	lea    -0x1(%rbx),%edx
   28146:	89 57 fc             	mov    %edx,-0x4(%rdi)
   28149:	85 d2                	test   %edx,%edx
   2814b:	0f 8e 77 52 00 00    	jle    2d3c8 <JS_CallInternal+0x8438>
   28151:	49 8b 77 08          	mov    0x8(%r15),%rsi
   28155:	83 fe f6             	cmp    $0xfffffff6,%esi
   28158:	76 14                	jbe    2816e <JS_CallInternal+0x31de>
   2815a:	49 8b 3f             	mov    (%r15),%rdi
   2815d:	8b 5f fc             	mov    -0x4(%rdi),%ebx
   28160:	8d 53 ff             	lea    -0x1(%rbx),%edx
   28163:	89 57 fc             	mov    %edx,-0x4(%rdi)
   28166:	85 d2                	test   %edx,%edx
   28168:	0f 8e 29 52 00 00    	jle    2d397 <JS_CallInternal+0x8407>
   2816e:	49 89 4f f0          	mov    %rcx,-0x10(%r15)
   28172:	4c 89 fb             	mov    %r15,%rbx
   28175:	49 83 c5 01          	add    $0x1,%r13
   28179:	49 89 47 f8          	mov    %rax,-0x8(%r15)
   2817d:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   28182:	49 89 c2             	mov    %rax,%r10
   28185:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28189:	ff e0                	jmp    *%rax
   2818b:	f3 0f 1e fa          	endbr64
   2818f:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   28196:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2819a:	4c 89 e7             	mov    %r12,%rdi
   2819d:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   281a1:	4c 89 68 30          	mov    %r13,0x30(%rax)
   281a5:	e8 f6 c5 ff ff       	call   247a0 <JS_GetPrototype>
   281aa:	48 89 c1             	mov    %rax,%rcx
   281ad:	49 89 d7             	mov    %rdx,%r15
   281b0:	83 fa 06             	cmp    $0x6,%edx
   281b3:	0f 84 11 5c 00 00    	je     2ddca <JS_CallInternal+0x8e3a>
   281b9:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   281bd:	83 f8 f6             	cmp    $0xfffffff6,%eax
   281c0:	76 15                	jbe    281d7 <JS_CallInternal+0x3247>
   281c2:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   281c6:	8b 56 fc             	mov    -0x4(%rsi),%edx
   281c9:	83 ea 01             	sub    $0x1,%edx
   281cc:	89 56 fc             	mov    %edx,-0x4(%rsi)
   281cf:	85 d2                	test   %edx,%edx
   281d1:	0f 8e 22 52 00 00    	jle    2d3f9 <JS_CallInternal+0x8469>
   281d7:	48 89 4b f0          	mov    %rcx,-0x10(%rbx)
   281db:	49 83 c5 01          	add    $0x1,%r13
   281df:	4c 89 7b f8          	mov    %r15,-0x8(%rbx)
   281e3:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   281e8:	49 89 c2             	mov    %rax,%r10
   281eb:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   281ef:	ff e0                	jmp    *%rax
   281f1:	f3 0f 1e fa          	endbr64
   281f5:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   281f9:	4c 8d 43 f0          	lea    -0x10(%rbx),%r8
   281fd:	4c 8d 7b e0          	lea    -0x20(%rbx),%r15
   28201:	48 8b 5b f0          	mov    -0x10(%rbx),%rbx
   28205:	4c 89 85 f0 fd ff ff 	mov    %r8,-0x210(%rbp)
   2820c:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   28213:	49 8b 47 08          	mov    0x8(%r15),%rax
   28217:	48 89 9d 30 fe ff ff 	mov    %rbx,-0x1d0(%rbp)
   2821e:	49 8b 58 08          	mov    0x8(%r8),%rbx
   28222:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   28229:	83 fb f9             	cmp    $0xfffffff9,%ebx
   2822c:	0f 85 1f 45 00 00    	jne    2c751 <JS_CallInternal+0x77c1>
   28232:	83 f8 f9             	cmp    $0xfffffff9,%eax
   28235:	0f 85 16 45 00 00    	jne    2c751 <JS_CallInternal+0x77c1>
   2823b:	49 8b 74 24 48       	mov    0x48(%r12),%rsi
   28240:	48 8d 8d 50 ff ff ff 	lea    -0xb0(%rbp),%rcx
   28247:	ba 12 00 00 00       	mov    $0x12,%edx
   2824c:	4c 89 e7             	mov    %r12,%rdi
   2824f:	48 c7 85 50 ff ff ff 	movq   $0x0,-0xb0(%rbp)
   28256:	00 00 00 00 
   2825a:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2825e:	48 c7 85 58 ff ff ff 	movq   $0x0,-0xa8(%rbp)
   28265:	00 00 00 00 
   28269:	e8 92 19 02 00       	call   49c00 <JS_NewObjectFromShape>
   2826e:	4c 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8
   28275:	83 fa 06             	cmp    $0x6,%edx
   28278:	0f 84 eb 44 00 00    	je     2c769 <JS_CallInternal+0x77d9>
   2827e:	f3 0f 7e 85 10 fe ff 	movq   -0x1f0(%rbp),%xmm0
   28285:	ff 
   28286:	0f 16 85 30 fe ff ff 	movhps -0x1d0(%rbp),%xmm0
   2828d:	0f 11 40 28          	movups %xmm0,0x28(%rax)
   28291:	49 89 07             	mov    %rax,(%r15)
   28294:	4c 89 c3             	mov    %r8,%rbx
   28297:	49 89 57 08          	mov    %rdx,0x8(%r15)
   2829b:	4d 89 ef             	mov    %r13,%r15
   2829e:	41 83 78 f8 06       	cmpl   $0x6,-0x8(%r8)
   282a3:	0f 84 17 d4 ff ff    	je     256c0 <JS_CallInternal+0x730>
   282a9:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   282ae:	49 83 c5 01          	add    $0x1,%r13
   282b2:	49 89 c2             	mov    %rax,%r10
   282b5:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   282b9:	ff e0                	jmp    *%rax
   282bb:	f3 0f 1e fa          	endbr64
   282bf:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
   282c4:	4d 8d 7d 02          	lea    0x2(%r13),%r15
   282c8:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   282cc:	4c 89 e7             	mov    %r12,%rdi
   282cf:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   282d3:	48 8d b5 dc fe ff ff 	lea    -0x124(%rbp),%rsi
   282da:	66 89 85 10 fe ff ff 	mov    %ax,-0x1f0(%rbp)
   282e1:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   282e8:	4c 89 78 30          	mov    %r15,0x30(%rax)
   282ec:	48 8d 43 f0          	lea    -0x10(%rbx),%rax
   282f0:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   282f7:	e8 c4 47 06 00       	call   8cac0 <build_arg_list>
   282fc:	49 89 c2             	mov    %rax,%r10
   282ff:	48 85 c0             	test   %rax,%rax
   28302:	0f 84 b8 d3 ff ff    	je     256c0 <JS_CallInternal+0x730>
   28308:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   2830c:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   28310:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   28316:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   2831d:	49 8b 94 24 70 01 00 	mov    0x170(%r12),%rdx
   28324:	00 
   28325:	49 8b 8c 24 78 01 00 	mov    0x178(%r12),%rcx
   2832c:	00 
   2832d:	48 89 c6             	mov    %rax,%rsi
   28330:	48 89 bd f0 fd ff ff 	mov    %rdi,-0x210(%rbp)
   28337:	48 89 85 20 fe ff ff 	mov    %rax,-0x1e0(%rbp)
   2833e:	e8 6d 3a ff ff       	call   1bdb0 <js_strict_eq2.isra.0>
   28343:	44 8b 9d dc fe ff ff 	mov    -0x124(%rbp),%r11d
   2834a:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   28351:	85 c0                	test   %eax,%eax
   28353:	0f 84 7e 3f 00 00    	je     2c2d7 <JS_CallInternal+0x7347>
   28359:	0f b7 85 10 fe ff ff 	movzwl -0x1f0(%rbp),%eax
   28360:	83 e8 02             	sub    $0x2,%eax
   28363:	45 85 db             	test   %r11d,%r11d
   28366:	0f 84 5e 3f 00 00    	je     2c2ca <JS_CallInternal+0x733a>
   2836c:	49 8b 0a             	mov    (%r10),%rcx
   2836f:	4d 8b 42 08          	mov    0x8(%r10),%r8
   28373:	48 83 ec 08          	sub    $0x8,%rsp
   28377:	44 89 9d 20 fe ff ff 	mov    %r11d,-0x1e0(%rbp)
   2837e:	31 f6                	xor    %esi,%esi
   28380:	4c 89 e7             	mov    %r12,%rdi
   28383:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   2838a:	41 b9 02 00 00 00    	mov    $0x2,%r9d
   28390:	ba 03 00 00 00       	mov    $0x3,%edx
   28395:	50                   	push   %rax
   28396:	e8 c5 be 01 00       	call   44260 <JS_EvalObject>
   2839b:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   283a2:	44 8b 9d 20 fe ff ff 	mov    -0x1e0(%rbp),%r11d
   283a9:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   283b0:	48 89 95 10 fe ff ff 	mov    %rdx,-0x1f0(%rbp)
   283b7:	59                   	pop    %rcx
   283b8:	5e                   	pop    %rsi
   283b9:	45 85 db             	test   %r11d,%r11d
   283bc:	0f 84 78 31 00 00    	je     2b53a <JS_CallInternal+0x65aa>
   283c2:	45 89 d8             	mov    %r11d,%r8d
   283c5:	48 89 9d 20 fe ff ff 	mov    %rbx,-0x1e0(%rbp)
   283cc:	4c 89 d3             	mov    %r10,%rbx
   283cf:	49 c1 e0 04          	shl    $0x4,%r8
   283d3:	4c 89 95 e8 fd ff ff 	mov    %r10,-0x218(%rbp)
   283da:	4d 01 d0             	add    %r10,%r8
   283dd:	4d 89 e2             	mov    %r12,%r10
   283e0:	4d 89 c4             	mov    %r8,%r12
   283e3:	eb 28                	jmp    2840d <JS_CallInternal+0x347d>
   283e5:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   283ea:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   283f1:	00 00 00 00 
   283f5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   283fc:	00 00 00 00 
   28400:	48 83 c3 10          	add    $0x10,%rbx
   28404:	4c 39 e3             	cmp    %r12,%rbx
   28407:	0f 84 1c 31 00 00    	je     2b529 <JS_CallInternal+0x6599>
   2840d:	48 8b 43 08          	mov    0x8(%rbx),%rax
   28411:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28414:	76 ea                	jbe    28400 <JS_CallInternal+0x3470>
   28416:	48 8b 33             	mov    (%rbx),%rsi
   28419:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   2841c:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2841f:	89 56 fc             	mov    %edx,-0x4(%rsi)
   28422:	85 d2                	test   %edx,%edx
   28424:	7f da                	jg     28400 <JS_CallInternal+0x3470>
   28426:	49 8b 7a 10          	mov    0x10(%r10),%rdi
   2842a:	48 89 c2             	mov    %rax,%rdx
   2842d:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   28434:	e8 97 60 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   28439:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   28440:	eb be                	jmp    28400 <JS_CallInternal+0x3470>
   28442:	f3 0f 1e fa          	endbr64
   28446:	83 bd 78 fe ff ff 03 	cmpl   $0x3,-0x188(%rbp)
   2844d:	0f 84 aa 62 00 00    	je     2e6fd <JS_CallInternal+0x976d>
   28453:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   28458:	49 83 c5 01          	add    $0x1,%r13
   2845c:	49 89 c2             	mov    %rax,%r10
   2845f:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28463:	ff e0                	jmp    *%rax
   28465:	f3 0f 1e fa          	endbr64
   28469:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2846d:	83 f8 ff             	cmp    $0xffffffff,%eax
   28470:	0f 84 82 3b 00 00    	je     2bff8 <JS_CallInternal+0x7068>
   28476:	83 f8 03             	cmp    $0x3,%eax
   28479:	0f 85 11 6a 00 00    	jne    2ee90 <JS_CallInternal+0x9f00>
   2847f:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   28486:	48 c7 43 08 01 00 00 	movq   $0x1,0x8(%rbx)
   2848d:	00 
   2848e:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   28493:	48 83 c3 10          	add    $0x10,%rbx
   28497:	49 83 c5 01          	add    $0x1,%r13
   2849b:	49 89 c2             	mov    %rax,%r10
   2849e:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   284a2:	ff e0                	jmp    *%rax
   284a4:	f3 0f 1e fa          	endbr64
   284a8:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   284ac:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
   284b1:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   284b5:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   284b8:	76 04                	jbe    284be <JS_CallInternal+0x352e>
   284ba:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   284be:	48 c1 e0 04          	shl    $0x4,%rax
   284c2:	48 03 85 80 fe ff ff 	add    -0x180(%rbp),%rax
   284c9:	48 8b 50 08          	mov    0x8(%rax),%rdx
   284cd:	48 8b 38             	mov    (%rax),%rdi
   284d0:	48 89 48 08          	mov    %rcx,0x8(%rax)
   284d4:	48 89 30             	mov    %rsi,(%rax)
   284d7:	83 fa f6             	cmp    $0xfffffff6,%edx
   284da:	76 11                	jbe    284ed <JS_CallInternal+0x355d>
   284dc:	8b 47 fc             	mov    -0x4(%rdi),%eax
   284df:	83 e8 01             	sub    $0x1,%eax
   284e2:	89 47 fc             	mov    %eax,-0x4(%rdi)
   284e5:	85 c0                	test   %eax,%eax
   284e7:	0f 8e 5b 4c 00 00    	jle    2d148 <JS_CallInternal+0x81b8>
   284ed:	41 0f b6 45 02       	movzbl 0x2(%r13),%eax
   284f2:	49 83 c5 03          	add    $0x3,%r13
   284f6:	49 89 c2             	mov    %rax,%r10
   284f9:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   284fd:	ff e0                	jmp    *%rax
   284ff:	f3 0f 1e fa          	endbr64
   28503:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
   28508:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2850d:	48 c1 e0 04          	shl    $0x4,%rax
   28511:	48 03 85 80 fe ff ff 	add    -0x180(%rbp),%rax
   28518:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2851c:	48 8b 08             	mov    (%rax),%rcx
   2851f:	0f 11 00             	movups %xmm0,(%rax)
   28522:	83 fa f6             	cmp    $0xfffffff6,%edx
   28525:	76 11                	jbe    28538 <JS_CallInternal+0x35a8>
   28527:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2852a:	83 e8 01             	sub    $0x1,%eax
   2852d:	89 41 fc             	mov    %eax,-0x4(%rcx)
   28530:	85 c0                	test   %eax,%eax
   28532:	0f 8e 22 4c 00 00    	jle    2d15a <JS_CallInternal+0x81ca>
   28538:	41 0f b6 45 02       	movzbl 0x2(%r13),%eax
   2853d:	48 83 eb 10          	sub    $0x10,%rbx
   28541:	49 83 c5 03          	add    $0x3,%r13
   28545:	49 89 c2             	mov    %rax,%r10
   28548:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2854c:	ff e0                	jmp    *%rax
   2854e:	f3 0f 1e fa          	endbr64
   28552:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   28556:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   2855a:	4c 89 e7             	mov    %r12,%rdi
   2855d:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   28561:	4c 8b 43 f8          	mov    -0x8(%rbx),%r8
   28565:	e8 66 b6 00 00       	call   33bd0 <JS_CheckBrand>
   2856a:	83 f8 ff             	cmp    $0xffffffff,%eax
   2856d:	0f 84 1d 68 00 00    	je     2ed90 <JS_CallInternal+0x9e00>
   28573:	85 c0                	test   %eax,%eax
   28575:	0f 84 fe 67 00 00    	je     2ed79 <JS_CallInternal+0x9de9>
   2857b:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   28580:	49 83 c5 01          	add    $0x1,%r13
   28584:	49 89 c2             	mov    %rax,%r10
   28587:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2858b:	ff e0                	jmp    *%rax
   2858d:	f3 0f 1e fa          	endbr64
   28591:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   28598:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2859c:	83 bd 78 fe ff ff 03 	cmpl   $0x3,-0x188(%rbp)
   285a3:	0f 84 54 61 00 00    	je     2e6fd <JS_CallInternal+0x976d>
   285a9:	48 8b 85 c8 fe ff ff 	mov    -0x138(%rbp),%rax
   285b0:	48 8b 95 68 fe ff ff 	mov    -0x198(%rbp),%rdx
   285b7:	4c 89 e7             	mov    %r12,%rdi
   285ba:	48 89 c6             	mov    %rax,%rsi
   285bd:	48 89 85 60 fe ff ff 	mov    %rax,-0x1a0(%rbp)
   285c4:	48 89 95 68 fe ff ff 	mov    %rdx,-0x198(%rbp)
   285cb:	e8 d0 c1 ff ff       	call   247a0 <JS_GetPrototype>
   285d0:	48 89 c6             	mov    %rax,%rsi
   285d3:	49 89 d7             	mov    %rdx,%r15
   285d6:	83 fa 06             	cmp    $0x6,%edx
   285d9:	0f 84 da 56 00 00    	je     2dcb9 <JS_CallInternal+0x8d29>
   285df:	48 8b 95 78 fe ff ff 	mov    -0x188(%rbp),%rdx
   285e6:	48 8b 85 58 fe ff ff 	mov    -0x1a8(%rbp),%rax
   285ed:	6a 02                	push   $0x2
   285ef:	4c 89 e7             	mov    %r12,%rdi
   285f2:	ff b5 98 fe ff ff    	push   -0x168(%rbp)
   285f8:	44 8b 8d a8 fe ff ff 	mov    -0x158(%rbp),%r9d
   285ff:	49 89 d0             	mov    %rdx,%r8
   28602:	48 89 c1             	mov    %rax,%rcx
   28605:	4c 89 fa             	mov    %r15,%rdx
   28608:	48 89 b5 30 fe ff ff 	mov    %rsi,-0x1d0(%rbp)
   2860f:	e8 cc 1e 07 00       	call   9a4e0 <JS_CallConstructorInternal>
   28614:	41 5a                	pop    %r10
   28616:	41 5b                	pop    %r11
   28618:	49 89 c0             	mov    %rax,%r8
   2861b:	48 89 d1             	mov    %rdx,%rcx
   2861e:	41 83 ff f6          	cmp    $0xfffffff6,%r15d
   28622:	76 18                	jbe    2863c <JS_CallInternal+0x36ac>
   28624:	48 8b b5 30 fe ff ff 	mov    -0x1d0(%rbp),%rsi
   2862b:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2862e:	83 e8 01             	sub    $0x1,%eax
   28631:	89 46 fc             	mov    %eax,-0x4(%rsi)
   28634:	85 c0                	test   %eax,%eax
   28636:	0f 8e 85 56 00 00    	jle    2dcc1 <JS_CallInternal+0x8d31>
   2863c:	4d 89 ef             	mov    %r13,%r15
   2863f:	83 f9 06             	cmp    $0x6,%ecx
   28642:	0f 84 78 d0 ff ff    	je     256c0 <JS_CallInternal+0x730>
   28648:	4c 89 03             	mov    %r8,(%rbx)
   2864b:	49 83 c5 01          	add    $0x1,%r13
   2864f:	48 83 c3 10          	add    $0x10,%rbx
   28653:	48 89 4b f8          	mov    %rcx,-0x8(%rbx)
   28657:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2865c:	49 89 c2             	mov    %rax,%r10
   2865f:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28663:	ff e0                	jmp    *%rax
   28665:	f3 0f 1e fa          	endbr64
   28669:	b8 03 00 00 00       	mov    $0x3,%eax
   2866e:	31 c9                	xor    %ecx,%ecx
   28670:	e9 0d d1 ff ff       	jmp    25782 <JS_CallInternal+0x7f2>
   28675:	f3 0f 1e fa          	endbr64
   28679:	41 0f b7 4d 00       	movzwl 0x0(%r13),%ecx
   2867e:	49 89 da             	mov    %rbx,%r10
   28681:	4d 8d 7d 04          	lea    0x4(%r13),%r15
   28685:	41 0f b7 75 02       	movzwl 0x2(%r13),%esi
   2868a:	49 8b 94 24 70 01 00 	mov    0x170(%r12),%rdx
   28691:	00 
   28692:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   28698:	48 89 c8             	mov    %rcx,%rax
   2869b:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   286a1:	49 8b 8c 24 78 01 00 	mov    0x178(%r12),%rcx
   286a8:	00 
   286a9:	48 c1 e0 04          	shl    $0x4,%rax
   286ad:	66 89 b5 f0 fd ff ff 	mov    %si,-0x210(%rbp)
   286b4:	49 29 c2             	sub    %rax,%r10
   286b7:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   286be:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   286c5:	49 8b 7a f0          	mov    -0x10(%r10),%rdi
   286c9:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   286d0:	4c 89 78 30          	mov    %r15,0x30(%rax)
   286d4:	49 8b 42 f8          	mov    -0x8(%r10),%rax
   286d8:	48 89 bd 20 fe ff ff 	mov    %rdi,-0x1e0(%rbp)
   286df:	48 89 c6             	mov    %rax,%rsi
   286e2:	48 89 85 e8 fd ff ff 	mov    %rax,-0x218(%rbp)
   286e9:	e8 c2 36 ff ff       	call   1bdb0 <js_strict_eq2.isra.0>
   286ee:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   286f5:	85 c0                	test   %eax,%eax
   286f7:	0f 84 68 3b 00 00    	je     2c265 <JS_CallInternal+0x72d5>
   286fd:	0f b7 85 f0 fd ff ff 	movzwl -0x210(%rbp),%eax
   28704:	44 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9d
   2870b:	83 e8 02             	sub    $0x2,%eax
   2870e:	45 85 c9             	test   %r9d,%r9d
   28711:	0f 84 41 3b 00 00    	je     2c258 <JS_CallInternal+0x72c8>
   28717:	49 8b 0a             	mov    (%r10),%rcx
   2871a:	4d 8b 42 08          	mov    0x8(%r10),%r8
   2871e:	48 83 ec 08          	sub    $0x8,%rsp
   28722:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   28729:	31 f6                	xor    %esi,%esi
   2872b:	4c 89 e7             	mov    %r12,%rdi
   2872e:	50                   	push   %rax
   2872f:	41 b9 02 00 00 00    	mov    $0x2,%r9d
   28735:	ba 03 00 00 00       	mov    $0x3,%edx
   2873a:	e8 21 bb 01 00       	call   44260 <JS_EvalObject>
   2873f:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   28746:	5f                   	pop    %rdi
   28747:	48 89 c6             	mov    %rax,%rsi
   2874a:	41 58                	pop    %r8
   2874c:	83 fa 06             	cmp    $0x6,%edx
   2874f:	0f 84 6b cf ff ff    	je     256c0 <JS_CallInternal+0x730>
   28755:	48 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%rax
   2875c:	4c 89 ad 10 fe ff ff 	mov    %r13,-0x1f0(%rbp)
   28763:	4d 8d 7a f0          	lea    -0x10(%r10),%r15
   28767:	49 89 dd             	mov    %rbx,%r13
   2876a:	48 89 b5 00 fe ff ff 	mov    %rsi,-0x200(%rbp)
   28771:	48 89 95 f0 fd ff ff 	mov    %rdx,-0x210(%rbp)
   28778:	4a 8d 1c 10          	lea    (%rax,%r10,1),%rbx
   2877c:	eb 0f                	jmp    2878d <JS_CallInternal+0x37fd>
   2877e:	66 90                	xchg   %ax,%ax
   28780:	49 83 c7 10          	add    $0x10,%r15
   28784:	49 39 df             	cmp    %rbx,%r15
   28787:	0f 84 a5 2e 00 00    	je     2b632 <JS_CallInternal+0x66a2>
   2878d:	49 8b 47 08          	mov    0x8(%r15),%rax
   28791:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28794:	76 ea                	jbe    28780 <JS_CallInternal+0x37f0>
   28796:	49 8b 37             	mov    (%r15),%rsi
   28799:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   2879c:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2879f:	89 56 fc             	mov    %edx,-0x4(%rsi)
   287a2:	85 d2                	test   %edx,%edx
   287a4:	7f da                	jg     28780 <JS_CallInternal+0x37f0>
   287a6:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   287ab:	48 89 c2             	mov    %rax,%rdx
   287ae:	e8 1d 5d ff ff       	call   1e4d0 <__JS_FreeValueRT>
   287b3:	eb cb                	jmp    28780 <JS_CallInternal+0x37f0>
   287b5:	f3 0f 1e fa          	endbr64
   287b9:	41 0f b6 45 04       	movzbl 0x4(%r13),%eax
   287be:	41 8b 75 00          	mov    0x0(%r13),%esi
   287c2:	4d 8d 7d 05          	lea    0x5(%r13),%r15
   287c6:	3c 04                	cmp    $0x4,%al
   287c8:	0f 87 b6 44 00 00    	ja     2cc84 <JS_CallInternal+0x7cf4>
   287ce:	48 8d 15 bf 99 0b 00 	lea    0xb99bf(%rip),%rdx        # e2194 <qjsc_repl_size+0x4e8>
   287d5:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
   287d9:	48 01 d0             	add    %rdx,%rax
   287dc:	3e ff e0             	notrack jmp *%rax
   287df:	48 8d 35 8a 35 0b 00 	lea    0xb358a(%rip),%rsi        # dbd70 <_IO_stdin_used+0x3d70>
   287e6:	4c 89 e7             	mov    %r12,%rdi
   287e9:	31 c0                	xor    %eax,%eax
   287eb:	e8 10 cf 00 00       	call   35700 <JS_ThrowReferenceError>
   287f0:	e9 cb ce ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   287f5:	48 8d 15 c1 fc 0a 00 	lea    0xafcc1(%rip),%rdx        # d84bd <_IO_stdin_used+0x4bd>
   287fc:	85 f6                	test   %esi,%esi
   287fe:	0f 85 7f 5d 00 00    	jne    2e583 <JS_CallInternal+0x95f3>
   28804:	48 8d 35 0e fd 0a 00 	lea    0xafd0e(%rip),%rsi        # d8519 <_IO_stdin_used+0x519>
   2880b:	4c 89 e7             	mov    %r12,%rdi
   2880e:	31 c0                	xor    %eax,%eax
   28810:	e8 eb ce 00 00       	call   35700 <JS_ThrowReferenceError>
   28815:	e9 a6 ce ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2881a:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2881f:	89 f2                	mov    %esi,%edx
   28821:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   28825:	e8 a6 01 ff ff       	call   189d0 <JS_AtomGetStrRT.constprop.0>
   2882a:	48 8d 35 d2 fc 0a 00 	lea    0xafcd2(%rip),%rsi        # d8503 <_IO_stdin_used+0x503>
   28831:	4c 89 e7             	mov    %r12,%rdi
   28834:	48 89 c2             	mov    %rax,%rdx
   28837:	31 c0                	xor    %eax,%eax
   28839:	e8 92 ab 00 00       	call   333d0 <JS_ThrowSyntaxError>
   2883e:	e9 7d ce ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   28843:	4c 89 e7             	mov    %r12,%rdi
   28846:	e8 25 c3 00 00       	call   34b70 <JS_ThrowTypeErrorReadOnly.part.0>
   2884b:	e9 70 ce ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   28850:	48 8d 35 41 35 0b 00 	lea    0xb3541(%rip),%rsi        # dbd98 <_IO_stdin_used+0x3d98>
   28857:	4c 89 e7             	mov    %r12,%rdi
   2885a:	31 c0                	xor    %eax,%eax
   2885c:	e8 bf af 00 00       	call   33820 <JS_ThrowTypeError>
   28861:	e9 5a ce ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   28866:	f3 0f 1e fa          	endbr64
   2886a:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
   2886f:	48 c1 e0 04          	shl    $0x4,%rax
   28873:	48 03 85 80 fe ff ff 	add    -0x180(%rbp),%rax
   2887a:	48 8b 10             	mov    (%rax),%rdx
   2887d:	48 8b 40 08          	mov    0x8(%rax),%rax
   28881:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28884:	76 04                	jbe    2888a <JS_CallInternal+0x38fa>
   28886:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2888a:	48 89 13             	mov    %rdx,(%rbx)
   2888d:	49 83 c5 03          	add    $0x3,%r13
   28891:	48 83 c3 10          	add    $0x10,%rbx
   28895:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   28899:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2889e:	49 89 c2             	mov    %rax,%r10
   288a1:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   288a5:	ff e0                	jmp    *%rax
   288a7:	f3 0f 1e fa          	endbr64
   288ab:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   288af:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
   288b4:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   288b8:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   288bb:	76 04                	jbe    288c1 <JS_CallInternal+0x3931>
   288bd:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   288c1:	48 c1 e0 04          	shl    $0x4,%rax
   288c5:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   288cc:	48 8b 50 08          	mov    0x8(%rax),%rdx
   288d0:	48 8b 38             	mov    (%rax),%rdi
   288d3:	48 89 48 08          	mov    %rcx,0x8(%rax)
   288d7:	48 89 30             	mov    %rsi,(%rax)
   288da:	83 fa f6             	cmp    $0xfffffff6,%edx
   288dd:	76 11                	jbe    288f0 <JS_CallInternal+0x3960>
   288df:	8b 47 fc             	mov    -0x4(%rdi),%eax
   288e2:	83 e8 01             	sub    $0x1,%eax
   288e5:	89 47 fc             	mov    %eax,-0x4(%rdi)
   288e8:	85 c0                	test   %eax,%eax
   288ea:	0f 8e b6 44 00 00    	jle    2cda6 <JS_CallInternal+0x7e16>
   288f0:	41 0f b6 45 02       	movzbl 0x2(%r13),%eax
   288f5:	49 83 c5 03          	add    $0x3,%r13
   288f9:	49 89 c2             	mov    %rax,%r10
   288fc:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28900:	ff e0                	jmp    *%rax
   28902:	f3 0f 1e fa          	endbr64
   28906:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
   2890b:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   28910:	48 c1 e0 04          	shl    $0x4,%rax
   28914:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   2891b:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2891f:	48 8b 08             	mov    (%rax),%rcx
   28922:	0f 11 00             	movups %xmm0,(%rax)
   28925:	83 fa f6             	cmp    $0xfffffff6,%edx
   28928:	76 11                	jbe    2893b <JS_CallInternal+0x39ab>
   2892a:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2892d:	83 e8 01             	sub    $0x1,%eax
   28930:	89 41 fc             	mov    %eax,-0x4(%rcx)
   28933:	85 c0                	test   %eax,%eax
   28935:	0f 8e 9a 43 00 00    	jle    2ccd5 <JS_CallInternal+0x7d45>
   2893b:	41 0f b6 45 02       	movzbl 0x2(%r13),%eax
   28940:	48 83 eb 10          	sub    $0x10,%rbx
   28944:	49 83 c5 03          	add    $0x3,%r13
   28948:	49 89 c2             	mov    %rax,%r10
   2894b:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2894f:	ff e0                	jmp    *%rax
   28951:	f3 0f 1e fa          	endbr64
   28955:	e9 66 c9 ff ff       	jmp    252c0 <JS_CallInternal+0x330>
   2895a:	f3 0f 1e fa          	endbr64
   2895e:	e9 5d c9 ff ff       	jmp    252c0 <JS_CallInternal+0x330>
   28963:	f3 0f 1e fa          	endbr64
   28967:	e9 54 c9 ff ff       	jmp    252c0 <JS_CallInternal+0x330>
   2896c:	f3 0f 1e fa          	endbr64
   28970:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   28974:	83 f8 fa             	cmp    $0xfffffffa,%eax
   28977:	0f 8d 41 31 00 00    	jge    2babe <JS_CallInternal+0x6b2e>
   2897d:	83 f8 f8             	cmp    $0xfffffff8,%eax
   28980:	0f 8c 40 31 00 00    	jl     2bac6 <JS_CallInternal+0x6b36>
   28986:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2898b:	49 83 c5 01          	add    $0x1,%r13
   2898f:	49 89 c2             	mov    %rax,%r10
   28992:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28996:	ff e0                	jmp    *%rax
   28998:	f3 0f 1e fa          	endbr64
   2899c:	83 7b f8 ff          	cmpl   $0xffffffff,-0x8(%rbx)
   289a0:	74 50                	je     289f2 <JS_CallInternal+0x3a62>
   289a2:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   289a9:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   289ad:	4c 89 e7             	mov    %r12,%rdi
   289b0:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   289b4:	4c 89 68 30          	mov    %r13,0x30(%rax)
   289b8:	e8 53 22 02 00       	call   4ac10 <JS_ToObject>
   289bd:	48 89 c1             	mov    %rax,%rcx
   289c0:	49 89 d7             	mov    %rdx,%r15
   289c3:	83 fa 06             	cmp    $0x6,%edx
   289c6:	0f 84 09 5f 00 00    	je     2e8d5 <JS_CallInternal+0x9945>
   289cc:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   289d0:	83 f8 f6             	cmp    $0xfffffff6,%eax
   289d3:	76 15                	jbe    289ea <JS_CallInternal+0x3a5a>
   289d5:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   289d9:	8b 56 fc             	mov    -0x4(%rsi),%edx
   289dc:	83 ea 01             	sub    $0x1,%edx
   289df:	89 56 fc             	mov    %edx,-0x4(%rsi)
   289e2:	85 d2                	test   %edx,%edx
   289e4:	0f 8e f3 5e 00 00    	jle    2e8dd <JS_CallInternal+0x994d>
   289ea:	48 89 4b f0          	mov    %rcx,-0x10(%rbx)
   289ee:	4c 89 7b f8          	mov    %r15,-0x8(%rbx)
   289f2:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   289f7:	49 83 c5 01          	add    $0x1,%r13
   289fb:	49 89 c2             	mov    %rax,%r10
   289fe:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28a02:	ff e0                	jmp    *%rax
   28a04:	f3 0f 1e fa          	endbr64
   28a08:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   28a0f:	4d 8d 7d 04          	lea    0x4(%r13),%r15
   28a13:	41 8b 4d 00          	mov    0x0(%r13),%ecx
   28a17:	4c 89 78 30          	mov    %r15,0x30(%rax)
   28a1b:	49 8b 84 24 90 01 00 	mov    0x190(%r12),%rax
   28a22:	00 
   28a23:	89 ca                	mov    %ecx,%edx
   28a25:	48 8b 70 18          	mov    0x18(%rax),%rsi
   28a29:	8b 46 18             	mov    0x18(%rsi),%eax
   28a2c:	21 c2                	and    %eax,%edx
   28a2e:	8b 54 96 38          	mov    0x38(%rsi,%rdx,4),%edx
   28a32:	48 85 d2             	test   %rdx,%rdx
   28a35:	0f 84 4d 3a 00 00    	je     2c488 <JS_CallInternal+0x74f8>
   28a3b:	48 8d 3c 85 3c 00 00 	lea    0x3c(,%rax,4),%rdi
   28a42:	00 
   28a43:	48 8d 44 d7 f8       	lea    -0x8(%rdi,%rdx,8),%rax
   28a48:	48 01 f0             	add    %rsi,%rax
   28a4b:	3b 48 04             	cmp    0x4(%rax),%ecx
   28a4e:	0f 85 26 3a 00 00    	jne    2c47a <JS_CallInternal+0x74ea>
   28a54:	31 c0                	xor    %eax,%eax
   28a56:	48 89 03             	mov    %rax,(%rbx)
   28a59:	49 83 c5 05          	add    $0x5,%r13
   28a5d:	48 83 c3 10          	add    $0x10,%rbx
   28a61:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   28a68:	00 
   28a69:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   28a6e:	49 89 c2             	mov    %rax,%r10
   28a71:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28a75:	ff e0                	jmp    *%rax
   28a77:	f3 0f 1e fa          	endbr64
   28a7b:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   28a82:	4c 8b 7b f0          	mov    -0x10(%rbx),%r15
   28a86:	4c 89 e7             	mov    %r12,%rdi
   28a89:	4c 89 68 30          	mov    %r13,0x30(%rax)
   28a8d:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   28a91:	4c 89 fe             	mov    %r15,%rsi
   28a94:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   28a9b:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   28a9f:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   28aa6:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   28aaa:	48 89 c2             	mov    %rax,%rdx
   28aad:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   28ab4:	e8 37 db 01 00       	call   465f0 <JS_ValueToAtom>
   28ab9:	85 c0                	test   %eax,%eax
   28abb:	0f 84 dd 55 00 00    	je     2e09e <JS_CallInternal+0x910e>
   28ac1:	48 8b b5 10 fe ff ff 	mov    -0x1f0(%rbp),%rsi
   28ac8:	48 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%rdx
   28acf:	89 c1                	mov    %eax,%ecx
   28ad1:	4c 89 e7             	mov    %r12,%rdi
   28ad4:	41 b8 00 80 00 00    	mov    $0x8000,%r8d
   28ada:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   28ae0:	e8 4b 4b 02 00       	call   4d630 <JS_DeleteProperty>
   28ae5:	44 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%r9d
   28aec:	89 c1                	mov    %eax,%ecx
   28aee:	41 81 f9 f2 00 00 00 	cmp    $0xf2,%r9d
   28af5:	0f 8f f2 39 00 00    	jg     2c4ed <JS_CallInternal+0x755d>
   28afb:	85 c9                	test   %ecx,%ecx
   28afd:	0f 88 d1 4e 00 00    	js     2d9d4 <JS_CallInternal+0x8a44>
   28b03:	83 bd 30 fe ff ff f6 	cmpl   $0xfffffff6,-0x1d0(%rbp)
   28b0a:	76 1e                	jbe    28b2a <JS_CallInternal+0x3b9a>
   28b0c:	48 8b b5 10 fe ff ff 	mov    -0x1f0(%rbp),%rsi
   28b13:	8b 46 fc             	mov    -0x4(%rsi),%eax
   28b16:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   28b1c:	83 e8 01             	sub    $0x1,%eax
   28b1f:	89 46 fc             	mov    %eax,-0x4(%rsi)
   28b22:	85 c0                	test   %eax,%eax
   28b24:	0f 8e 7e 52 00 00    	jle    2dda8 <JS_CallInternal+0x8e18>
   28b2a:	83 bd 00 fe ff ff f6 	cmpl   $0xfffffff6,-0x200(%rbp)
   28b31:	76 13                	jbe    28b46 <JS_CallInternal+0x3bb6>
   28b33:	41 8b 47 fc          	mov    -0x4(%r15),%eax
   28b37:	83 e8 01             	sub    $0x1,%eax
   28b3a:	41 89 47 fc          	mov    %eax,-0x4(%r15)
   28b3e:	85 c0                	test   %eax,%eax
   28b40:	0f 8e 96 4e 00 00    	jle    2d9dc <JS_CallInternal+0x8a4c>
   28b46:	31 c0                	xor    %eax,%eax
   28b48:	85 c9                	test   %ecx,%ecx
   28b4a:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   28b51:	00 
   28b52:	0f 95 c0             	setne  %al
   28b55:	48 83 eb 10          	sub    $0x10,%rbx
   28b59:	49 83 c5 01          	add    $0x1,%r13
   28b5d:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   28b61:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   28b66:	49 89 c2             	mov    %rax,%r10
   28b69:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28b6d:	ff e0                	jmp    *%rax
   28b6f:	f3 0f 1e fa          	endbr64
   28b73:	31 c0                	xor    %eax,%eax
   28b75:	b9 01 00 00 00       	mov    $0x1,%ecx
   28b7a:	e9 c1 cb ff ff       	jmp    25740 <JS_CallInternal+0x7b0>
   28b7f:	f3 0f 1e fa          	endbr64
   28b83:	31 c0                	xor    %eax,%eax
   28b85:	31 c9                	xor    %ecx,%ecx
   28b87:	e9 b4 cb ff ff       	jmp    25740 <JS_CallInternal+0x7b0>
   28b8c:	f3 0f 1e fa          	endbr64
   28b90:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
   28b95:	48 c1 e0 04          	shl    $0x4,%rax
   28b99:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   28ba0:	48 8b 10             	mov    (%rax),%rdx
   28ba3:	48 8b 40 08          	mov    0x8(%rax),%rax
   28ba7:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28baa:	76 04                	jbe    28bb0 <JS_CallInternal+0x3c20>
   28bac:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   28bb0:	48 89 13             	mov    %rdx,(%rbx)
   28bb3:	49 83 c5 03          	add    $0x3,%r13
   28bb7:	48 83 c3 10          	add    $0x10,%rbx
   28bbb:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   28bbf:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   28bc4:	49 89 c2             	mov    %rax,%r10
   28bc7:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28bcb:	ff e0                	jmp    *%rax
   28bcd:	f3 0f 1e fa          	endbr64
   28bd1:	4c 8b 43 f8          	mov    -0x8(%rbx),%r8
   28bd5:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   28bd9:	4c 89 e7             	mov    %r12,%rdi
   28bdc:	4c 89 c2             	mov    %r8,%rdx
   28bdf:	e8 3c be ff ff       	call   24a20 <js_operator_typeof>
   28be4:	41 89 c7             	mov    %eax,%r15d
   28be7:	41 83 f8 f6          	cmp    $0xfffffff6,%r8d
   28beb:	76 11                	jbe    28bfe <JS_CallInternal+0x3c6e>
   28bed:	8b 46 fc             	mov    -0x4(%rsi),%eax
   28bf0:	83 e8 01             	sub    $0x1,%eax
   28bf3:	89 46 fc             	mov    %eax,-0x4(%rsi)
   28bf6:	85 c0                	test   %eax,%eax
   28bf8:	0f 8e 96 41 00 00    	jle    2cd94 <JS_CallInternal+0x7e04>
   28bfe:	ba 01 00 00 00       	mov    $0x1,%edx
   28c03:	44 89 fe             	mov    %r15d,%esi
   28c06:	4c 89 e7             	mov    %r12,%rdi
   28c09:	49 83 c5 01          	add    $0x1,%r13
   28c0d:	e8 6e 27 01 00       	call   3b380 <__JS_AtomToValue>
   28c12:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   28c16:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   28c1a:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   28c1f:	49 89 c2             	mov    %rax,%r10
   28c22:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28c26:	ff e0                	jmp    *%rax
   28c28:	f3 0f 1e fa          	endbr64
   28c2c:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   28c33:	4c 8b 4b e8          	mov    -0x18(%rbx),%r9
   28c37:	4c 89 e7             	mov    %r12,%rdi
   28c3a:	4c 8b 7b f0          	mov    -0x10(%rbx),%r15
   28c3e:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   28c42:	4c 89 68 30          	mov    %r13,0x30(%rax)
   28c46:	4c 8b 43 f8          	mov    -0x8(%rbx),%r8
   28c4a:	4c 89 ca             	mov    %r9,%rdx
   28c4d:	4c 89 f9             	mov    %r15,%rcx
   28c50:	48 89 b5 00 fe ff ff 	mov    %rsi,-0x200(%rbp)
   28c57:	4c 89 85 10 fe ff ff 	mov    %r8,-0x1f0(%rbp)
   28c5e:	4c 89 8d 30 fe ff ff 	mov    %r9,-0x1d0(%rbp)
   28c65:	e8 26 be 06 00       	call   94a90 <JS_IsInstanceOf>
   28c6a:	85 c0                	test   %eax,%eax
   28c6c:	0f 88 1e 30 00 00    	js     2bc90 <JS_CallInternal+0x6d00>
   28c72:	4c 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9
   28c79:	4c 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%r8
   28c80:	41 83 f9 f6          	cmp    $0xfffffff6,%r9d
   28c84:	76 18                	jbe    28c9e <JS_CallInternal+0x3d0e>
   28c86:	48 8b b5 00 fe ff ff 	mov    -0x200(%rbp),%rsi
   28c8d:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   28c90:	8d 51 ff             	lea    -0x1(%rcx),%edx
   28c93:	89 56 fc             	mov    %edx,-0x4(%rsi)
   28c96:	85 d2                	test   %edx,%edx
   28c98:	0f 8e a4 58 00 00    	jle    2e542 <JS_CallInternal+0x95b2>
   28c9e:	41 83 f8 f6          	cmp    $0xfffffff6,%r8d
   28ca2:	76 13                	jbe    28cb7 <JS_CallInternal+0x3d27>
   28ca4:	41 8b 4f fc          	mov    -0x4(%r15),%ecx
   28ca8:	8d 51 ff             	lea    -0x1(%rcx),%edx
   28cab:	41 89 57 fc          	mov    %edx,-0x4(%r15)
   28caf:	85 d2                	test   %edx,%edx
   28cb1:	0f 8e 09 57 00 00    	jle    2e3c0 <JS_CallInternal+0x9430>
   28cb7:	85 c0                	test   %eax,%eax
   28cb9:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   28cc0:	00 
   28cc1:	0f 95 c0             	setne  %al
   28cc4:	48 83 eb 10          	sub    $0x10,%rbx
   28cc8:	49 83 c5 01          	add    $0x1,%r13
   28ccc:	0f b6 c0             	movzbl %al,%eax
   28ccf:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   28cd3:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   28cd8:	49 89 c2             	mov    %rax,%r10
   28cdb:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28cdf:	ff e0                	jmp    *%rax
   28ce1:	f3 0f 1e fa          	endbr64
   28ce5:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   28cec:	4c 8b 4b e8          	mov    -0x18(%rbx),%r9
   28cf0:	4c 8b 53 f0          	mov    -0x10(%rbx),%r10
   28cf4:	4c 8b 7b f8          	mov    -0x8(%rbx),%r15
   28cf8:	4c 89 68 30          	mov    %r13,0x30(%rax)
   28cfc:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   28d00:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   28d07:	41 83 f9 ff          	cmp    $0xffffffff,%r9d
   28d0b:	0f 85 71 69 00 00    	jne    2f682 <JS_CallInternal+0xa6f2>
   28d11:	41 83 ff ff          	cmp    $0xffffffff,%r15d
   28d15:	0f 84 65 36 00 00    	je     2c380 <JS_CallInternal+0x73f0>
   28d1b:	4c 89 d6             	mov    %r10,%rsi
   28d1e:	4c 89 fa             	mov    %r15,%rdx
   28d21:	4c 89 e7             	mov    %r12,%rdi
   28d24:	4c 89 8d 00 fe ff ff 	mov    %r9,-0x200(%rbp)
   28d2b:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   28d32:	4c 89 bd 18 fe ff ff 	mov    %r15,-0x1e8(%rbp)
   28d39:	e8 b2 d8 01 00       	call   465f0 <JS_ValueToAtom>
   28d3e:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   28d45:	4c 8b 9d 18 fe ff ff 	mov    -0x1e8(%rbp),%r11
   28d4c:	85 c0                	test   %eax,%eax
   28d4e:	4c 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%r9
   28d55:	0f 84 5e 57 00 00    	je     2e4b9 <JS_CallInternal+0x9529>
   28d5b:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   28d62:	48 8b 71 18          	mov    0x18(%rcx),%rsi
   28d66:	89 c1                	mov    %eax,%ecx
   28d68:	8b 56 18             	mov    0x18(%rsi),%edx
   28d6b:	21 d1                	and    %edx,%ecx
   28d6d:	8b 4c 8e 38          	mov    0x38(%rsi,%rcx,4),%ecx
   28d71:	48 85 c9             	test   %rcx,%rcx
   28d74:	0f 84 44 58 00 00    	je     2e5be <JS_CallInternal+0x962e>
   28d7a:	48 8d 14 95 3c 00 00 	lea    0x3c(,%rdx,4),%rdx
   28d81:	00 
   28d82:	48 8d 4c ca f8       	lea    -0x8(%rdx,%rcx,8),%rcx
   28d87:	48 01 f1             	add    %rsi,%rcx
   28d8a:	39 41 04             	cmp    %eax,0x4(%rcx)
   28d8d:	0f 85 1d 58 00 00    	jne    2e5b0 <JS_CallInternal+0x9620>
   28d93:	b9 01 00 00 00       	mov    $0x1,%ecx
   28d98:	3d f2 00 00 00       	cmp    $0xf2,%eax
   28d9d:	0f 8f bf 3b 00 00    	jg     2c962 <JS_CallInternal+0x79d2>
   28da3:	41 83 f9 f6          	cmp    $0xfffffff6,%r9d
   28da7:	76 1e                	jbe    28dc7 <JS_CallInternal+0x3e37>
   28da9:	48 8b b5 30 fe ff ff 	mov    -0x1d0(%rbp),%rsi
   28db0:	8b 46 fc             	mov    -0x4(%rsi),%eax
   28db3:	89 85 10 fe ff ff    	mov    %eax,-0x1f0(%rbp)
   28db9:	83 e8 01             	sub    $0x1,%eax
   28dbc:	89 46 fc             	mov    %eax,-0x4(%rsi)
   28dbf:	85 c0                	test   %eax,%eax
   28dc1:	0f 8e 23 44 00 00    	jle    2d1ea <JS_CallInternal+0x825a>
   28dc7:	41 83 ff f6          	cmp    $0xfffffff6,%r15d
   28dcb:	76 13                	jbe    28de0 <JS_CallInternal+0x3e50>
   28dcd:	41 8b 42 fc          	mov    -0x4(%r10),%eax
   28dd1:	83 e8 01             	sub    $0x1,%eax
   28dd4:	41 89 42 fc          	mov    %eax,-0x4(%r10)
   28dd8:	85 c0                	test   %eax,%eax
   28dda:	0f 8e 91 3f 00 00    	jle    2cd71 <JS_CallInternal+0x7de1>
   28de0:	48 89 4b e0          	mov    %rcx,-0x20(%rbx)
   28de4:	49 83 c5 01          	add    $0x1,%r13
   28de8:	48 83 eb 10          	sub    $0x10,%rbx
   28dec:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   28df3:	00 
   28df4:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   28df9:	49 89 c2             	mov    %rax,%r10
   28dfc:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28e00:	ff e0                	jmp    *%rax
   28e02:	f3 0f 1e fa          	endbr64
   28e06:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   28e0d:	4c 8b 7b f8          	mov    -0x8(%rbx),%r15
   28e11:	4c 89 68 30          	mov    %r13,0x30(%rax)
   28e15:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   28e19:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   28e20:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   28e24:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   28e2b:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   28e2f:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   28e36:	41 83 ff ff          	cmp    $0xffffffff,%r15d
   28e3a:	0f 85 0b 5f 00 00    	jne    2ed4b <JS_CallInternal+0x9dbb>
   28e40:	48 8b b5 10 fe ff ff 	mov    -0x1f0(%rbp),%rsi
   28e47:	48 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%rdx
   28e4e:	4c 89 e7             	mov    %r12,%rdi
   28e51:	e8 9a d7 01 00       	call   465f0 <JS_ValueToAtom>
   28e56:	89 c1                	mov    %eax,%ecx
   28e58:	85 c0                	test   %eax,%eax
   28e5a:	0f 84 20 49 00 00    	je     2d780 <JS_CallInternal+0x87f0>
   28e60:	48 8b b5 00 fe ff ff 	mov    -0x200(%rbp),%rsi
   28e67:	4c 89 fa             	mov    %r15,%rdx
   28e6a:	4c 89 e7             	mov    %r12,%rdi
   28e6d:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   28e73:	e8 a8 6a 04 00       	call   6f920 <JS_HasProperty>
   28e78:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   28e7e:	41 89 c0             	mov    %eax,%r8d
   28e81:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   28e87:	0f 8f b4 35 00 00    	jg     2c441 <JS_CallInternal+0x74b1>
   28e8d:	45 85 c0             	test   %r8d,%r8d
   28e90:	0f 88 d8 62 00 00    	js     2f16e <JS_CallInternal+0xa1de>
   28e96:	83 bd 30 fe ff ff f6 	cmpl   $0xfffffff6,-0x1d0(%rbp)
   28e9d:	76 1e                	jbe    28ebd <JS_CallInternal+0x3f2d>
   28e9f:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   28ea6:	8b 41 fc             	mov    -0x4(%rcx),%eax
   28ea9:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   28eaf:	83 e8 01             	sub    $0x1,%eax
   28eb2:	89 41 fc             	mov    %eax,-0x4(%rcx)
   28eb5:	85 c0                	test   %eax,%eax
   28eb7:	0f 8e 32 4e 00 00    	jle    2dcef <JS_CallInternal+0x8d5f>
   28ebd:	41 83 ff f6          	cmp    $0xfffffff6,%r15d
   28ec1:	76 1e                	jbe    28ee1 <JS_CallInternal+0x3f51>
   28ec3:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   28eca:	8b 41 fc             	mov    -0x4(%rcx),%eax
   28ecd:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   28ed3:	83 e8 01             	sub    $0x1,%eax
   28ed6:	89 41 fc             	mov    %eax,-0x4(%rcx)
   28ed9:	85 c0                	test   %eax,%eax
   28edb:	0f 8e 75 4c 00 00    	jle    2db56 <JS_CallInternal+0x8bc6>
   28ee1:	31 c0                	xor    %eax,%eax
   28ee3:	45 85 c0             	test   %r8d,%r8d
   28ee6:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   28eed:	00 
   28eee:	0f 95 c0             	setne  %al
   28ef1:	48 83 eb 10          	sub    $0x10,%rbx
   28ef5:	49 83 c5 01          	add    $0x1,%r13
   28ef9:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   28efd:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   28f02:	49 89 c2             	mov    %rax,%r10
   28f05:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28f09:	ff e0                	jmp    *%rax
   28f0b:	f3 0f 1e fa          	endbr64
   28f0f:	48 8b 4b e8          	mov    -0x18(%rbx),%rcx
   28f13:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   28f17:	4c 8b 53 f0          	mov    -0x10(%rbx),%r10
   28f1b:	4c 8b 7b f8          	mov    -0x8(%rbx),%r15
   28f1f:	85 c9                	test   %ecx,%ecx
   28f21:	0f 85 f7 4c 00 00    	jne    2dc1e <JS_CallInternal+0x8c8e>
   28f27:	45 85 ff             	test   %r15d,%r15d
   28f2a:	0f 85 0a 2d 00 00    	jne    2bc3a <JS_CallInternal+0x6caa>
   28f30:	31 c0                	xor    %eax,%eax
   28f32:	44 39 d2             	cmp    %r10d,%edx
   28f35:	0f 95 c0             	setne  %al
   28f38:	48 89 43 e0          	mov    %rax,-0x20(%rbx)
   28f3c:	49 83 c5 01          	add    $0x1,%r13
   28f40:	48 83 eb 10          	sub    $0x10,%rbx
   28f44:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   28f4b:	00 
   28f4c:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   28f51:	49 89 c2             	mov    %rax,%r10
   28f54:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28f58:	ff e0                	jmp    *%rax
   28f5a:	f3 0f 1e fa          	endbr64
   28f5e:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   28f62:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   28f66:	4c 8b 53 f0          	mov    -0x10(%rbx),%r10
   28f6a:	4c 8b 43 f8          	mov    -0x8(%rbx),%r8
   28f6e:	85 d2                	test   %edx,%edx
   28f70:	0f 85 a0 4d 00 00    	jne    2dd16 <JS_CallInternal+0x8d86>
   28f76:	45 85 c0             	test   %r8d,%r8d
   28f79:	0f 85 8b 2c 00 00    	jne    2bc0a <JS_CallInternal+0x6c7a>
   28f7f:	45 31 ff             	xor    %r15d,%r15d
   28f82:	44 39 d7             	cmp    %r10d,%edi
   28f85:	41 0f 94 c7          	sete   %r15b
   28f89:	4c 89 7b e0          	mov    %r15,-0x20(%rbx)
   28f8d:	49 83 c5 01          	add    $0x1,%r13
   28f91:	48 83 eb 10          	sub    $0x10,%rbx
   28f95:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   28f9c:	00 
   28f9d:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   28fa2:	49 89 c2             	mov    %rax,%r10
   28fa5:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28fa9:	ff e0                	jmp    *%rax
   28fab:	f3 0f 1e fa          	endbr64
   28faf:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   28fb3:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   28fb7:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   28fbb:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   28fbf:	85 d2                	test   %edx,%edx
   28fc1:	0f 85 de 51 00 00    	jne    2e1a5 <JS_CallInternal+0x9215>
   28fc7:	85 c9                	test   %ecx,%ecx
   28fc9:	0f 85 11 2c 00 00    	jne    2bbe0 <JS_CallInternal+0x6c50>
   28fcf:	45 31 ff             	xor    %r15d,%r15d
   28fd2:	44 39 c7             	cmp    %r8d,%edi
   28fd5:	41 0f 94 c7          	sete   %r15b
   28fd9:	41 83 f7 01          	xor    $0x1,%r15d
   28fdd:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   28fe4:	00 
   28fe5:	49 63 c7             	movslq %r15d,%rax
   28fe8:	48 89 43 e0          	mov    %rax,-0x20(%rbx)
   28fec:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   28ff1:	48 83 eb 10          	sub    $0x10,%rbx
   28ff5:	49 83 c5 01          	add    $0x1,%r13
   28ff9:	49 89 c2             	mov    %rax,%r10
   28ffc:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29000:	ff e0                	jmp    *%rax
   29002:	f3 0f 1e fa          	endbr64
   29006:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2900a:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2900e:	4d 8d 7d 01          	lea    0x1(%r13),%r15
   29012:	83 fa 03             	cmp    $0x3,%edx
   29015:	0f 87 db 33 00 00    	ja     2c3f6 <JS_CallInternal+0x7466>
   2901b:	48 83 eb 10          	sub    $0x10,%rbx
   2901f:	85 c0                	test   %eax,%eax
   29021:	75 0d                	jne    29030 <JS_CallInternal+0x40a0>
   29023:	41 0f be 45 00       	movsbl 0x0(%r13),%eax
   29028:	83 e8 01             	sub    $0x1,%eax
   2902b:	48 98                	cltq
   2902d:	49 01 c7             	add    %rax,%r15
   29030:	41 8b 84 24 a8 01 00 	mov    0x1a8(%r12),%eax
   29037:	00 
   29038:	83 e8 01             	sub    $0x1,%eax
   2903b:	41 89 84 24 a8 01 00 	mov    %eax,0x1a8(%r12)
   29042:	00 
   29043:	85 c0                	test   %eax,%eax
   29045:	0f 8e d1 48 00 00    	jle    2d91c <JS_CallInternal+0x898c>
   2904b:	41 0f b6 07          	movzbl (%r15),%eax
   2904f:	4d 8d 6f 01          	lea    0x1(%r15),%r13
   29053:	49 89 c2             	mov    %rax,%r10
   29056:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2905a:	f3 0f 1e fa          	endbr64
   2905e:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   29062:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   29066:	4d 8d 7d 01          	lea    0x1(%r13),%r15
   2906a:	83 fa 03             	cmp    $0x3,%edx
   2906d:	0f 87 63 33 00 00    	ja     2c3d6 <JS_CallInternal+0x7446>
   29073:	48 83 eb 10          	sub    $0x10,%rbx
   29077:	85 c0                	test   %eax,%eax
   29079:	74 0d                	je     29088 <JS_CallInternal+0x40f8>
   2907b:	41 0f be 45 00       	movsbl 0x0(%r13),%eax
   29080:	83 e8 01             	sub    $0x1,%eax
   29083:	48 98                	cltq
   29085:	49 01 c7             	add    %rax,%r15
   29088:	41 8b 84 24 a8 01 00 	mov    0x1a8(%r12),%eax
   2908f:	00 
   29090:	83 e8 01             	sub    $0x1,%eax
   29093:	41 89 84 24 a8 01 00 	mov    %eax,0x1a8(%r12)
   2909a:	00 
   2909b:	85 c0                	test   %eax,%eax
   2909d:	0f 8e b2 51 00 00    	jle    2e255 <JS_CallInternal+0x92c5>
   290a3:	41 0f b6 07          	movzbl (%r15),%eax
   290a7:	4d 8d 6f 01          	lea    0x1(%r15),%r13
   290ab:	49 89 c2             	mov    %rax,%r10
   290ae:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   290b2:	f3 0f 1e fa          	endbr64
   290b6:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   290ba:	0b 53 e8             	or     -0x18(%rbx),%edx
   290bd:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   290c1:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   290c5:	0f 85 db 46 00 00    	jne    2d7a6 <JS_CallInternal+0x8816>
   290cb:	d3 e0                	shl    %cl,%eax
   290cd:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   290d4:	00 
   290d5:	48 83 eb 10          	sub    $0x10,%rbx
   290d9:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   290dd:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   290e2:	49 83 c5 01          	add    $0x1,%r13
   290e6:	49 89 c2             	mov    %rax,%r10
   290e9:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   290ed:	ff e0                	jmp    *%rax
   290ef:	f3 0f 1e fa          	endbr64
   290f3:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   290f7:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   290fb:	83 f8 03             	cmp    $0x3,%eax
   290fe:	0f 87 ac 30 00 00    	ja     2c1b0 <JS_CallInternal+0x7220>
   29104:	31 c0                	xor    %eax,%eax
   29106:	85 d2                	test   %edx,%edx
   29108:	0f 95 c0             	setne  %al
   2910b:	85 c0                	test   %eax,%eax
   2910d:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   29114:	00 
   29115:	0f 94 c0             	sete   %al
   29118:	49 83 c5 01          	add    $0x1,%r13
   2911c:	0f b6 c0             	movzbl %al,%eax
   2911f:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29123:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   29128:	49 89 c2             	mov    %rax,%r10
   2912b:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2912f:	ff e0                	jmp    *%rax
   29131:	f3 0f 1e fa          	endbr64
   29135:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   29139:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   2913d:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   29141:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   29145:	89 cf                	mov    %ecx,%edi
   29147:	09 f7                	or     %esi,%edi
   29149:	0f 85 c1 46 00 00    	jne    2d810 <JS_CallInternal+0x8880>
   2914f:	39 c2                	cmp    %eax,%edx
   29151:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   29158:	00 
   29159:	0f 9f c0             	setg   %al
   2915c:	48 83 eb 10          	sub    $0x10,%rbx
   29160:	0f b6 c0             	movzbl %al,%eax
   29163:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29167:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2916c:	49 83 c5 01          	add    $0x1,%r13
   29170:	49 89 c2             	mov    %rax,%r10
   29173:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29177:	ff e0                	jmp    *%rax
   29179:	f3 0f 1e fa          	endbr64
   2917d:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
   29182:	48 c1 e0 04          	shl    $0x4,%rax
   29186:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   2918d:	48 8b 50 08          	mov    0x8(%rax),%rdx
   29191:	48 8b 08             	mov    (%rax),%rcx
   29194:	48 c7 40 08 04 00 00 	movq   $0x4,0x8(%rax)
   2919b:	00 
   2919c:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
   291a3:	83 fa f6             	cmp    $0xfffffff6,%edx
   291a6:	76 11                	jbe    291b9 <JS_CallInternal+0x4229>
   291a8:	8b 41 fc             	mov    -0x4(%rcx),%eax
   291ab:	83 e8 01             	sub    $0x1,%eax
   291ae:	89 41 fc             	mov    %eax,-0x4(%rcx)
   291b1:	85 c0                	test   %eax,%eax
   291b3:	0f 8e 12 41 00 00    	jle    2d2cb <JS_CallInternal+0x833b>
   291b9:	41 0f b6 45 02       	movzbl 0x2(%r13),%eax
   291be:	49 83 c5 03          	add    $0x3,%r13
   291c2:	49 89 c2             	mov    %rax,%r10
   291c5:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   291c9:	ff e0                	jmp    *%rax
   291cb:	f3 0f 1e fa          	endbr64
   291cf:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   291d6:	4c 89 68 30          	mov    %r13,0x30(%rax)
   291da:	83 7b d8 ff          	cmpl   $0xffffffff,-0x28(%rbx)
   291de:	0f 85 92 5f 00 00    	jne    2f176 <JS_CallInternal+0xa1e6>
   291e4:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   291e8:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   291ec:	48 8d 43 e0          	lea    -0x20(%rbx),%rax
   291f0:	4c 89 e7             	mov    %r12,%rdi
   291f3:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   291fa:	4d 89 ef             	mov    %r13,%r15
   291fd:	e8 ee d3 01 00       	call   465f0 <JS_ValueToAtom>
   29202:	89 c1                	mov    %eax,%ecx
   29204:	85 c0                	test   %eax,%eax
   29206:	0f 84 b4 c4 ff ff    	je     256c0 <JS_CallInternal+0x730>
   2920c:	48 83 ec 08          	sub    $0x8,%rsp
   29210:	4c 8d 53 d0          	lea    -0x30(%rbx),%r10
   29214:	4c 8d 7b c0          	lea    -0x40(%rbx),%r15
   29218:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2921c:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   29223:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   29227:	4c 89 e7             	mov    %r12,%rdi
   2922a:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   2922e:	48 8b 53 d8          	mov    -0x28(%rbx),%rdx
   29232:	68 00 80 00 00       	push   $0x8000
   29237:	41 ff 77 08          	push   0x8(%r15)
   2923b:	41 ff 37             	push   (%r15)
   2923e:	89 85 10 fe ff ff    	mov    %eax,-0x1f0(%rbp)
   29244:	e8 87 73 00 00       	call   305d0 <JS_SetPropertyInternal>
   29249:	8b 8d 10 fe ff ff    	mov    -0x1f0(%rbp),%ecx
   2924f:	48 83 c4 20          	add    $0x20,%rsp
   29253:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   2925a:	89 c3                	mov    %eax,%ebx
   2925c:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   29262:	0f 8f 80 33 00 00    	jg     2c5e8 <JS_CallInternal+0x7658>
   29268:	49 8b 47 08          	mov    0x8(%r15),%rax
   2926c:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2926f:	76 14                	jbe    29285 <JS_CallInternal+0x42f5>
   29271:	49 8b 0f             	mov    (%r15),%rcx
   29274:	8b 71 fc             	mov    -0x4(%rcx),%esi
   29277:	8d 56 ff             	lea    -0x1(%rsi),%edx
   2927a:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2927d:	85 d2                	test   %edx,%edx
   2927f:	0f 8e 7c 47 00 00    	jle    2da01 <JS_CallInternal+0x8a71>
   29285:	49 8b 42 08          	mov    0x8(%r10),%rax
   29289:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2928c:	76 14                	jbe    292a2 <JS_CallInternal+0x4312>
   2928e:	49 8b 0a             	mov    (%r10),%rcx
   29291:	8b 51 fc             	mov    -0x4(%rcx),%edx
   29294:	83 ea 01             	sub    $0x1,%edx
   29297:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2929a:	85 d2                	test   %edx,%edx
   2929c:	0f 8e 25 50 00 00    	jle    2e2c7 <JS_CallInternal+0x9337>
   292a2:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   292a9:	48 8b 41 08          	mov    0x8(%rcx),%rax
   292ad:	83 f8 f6             	cmp    $0xfffffff6,%eax
   292b0:	76 14                	jbe    292c6 <JS_CallInternal+0x4336>
   292b2:	48 8b 09             	mov    (%rcx),%rcx
   292b5:	8b 71 fc             	mov    -0x4(%rcx),%esi
   292b8:	8d 56 ff             	lea    -0x1(%rsi),%edx
   292bb:	89 51 fc             	mov    %edx,-0x4(%rcx)
   292be:	85 d2                	test   %edx,%edx
   292c0:	0f 8e bb 47 00 00    	jle    2da81 <JS_CallInternal+0x8af1>
   292c6:	85 db                	test   %ebx,%ebx
   292c8:	0f 88 1b 5c 00 00    	js     2eee9 <JS_CallInternal+0x9f59>
   292ce:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   292d3:	4c 89 fb             	mov    %r15,%rbx
   292d6:	49 83 c5 01          	add    $0x1,%r13
   292da:	49 89 c2             	mov    %rax,%r10
   292dd:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   292e1:	ff e0                	jmp    *%rax
   292e3:	f3 0f 1e fa          	endbr64
   292e7:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   292eb:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   292ef:	4c 89 e7             	mov    %r12,%rdi
   292f2:	4c 8d 7b e0          	lea    -0x20(%rbx),%r15
   292f6:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   292fd:	4c 89 68 30          	mov    %r13,0x30(%rax)
   29301:	e8 ea d2 01 00       	call   465f0 <JS_ValueToAtom>
   29306:	89 c1                	mov    %eax,%ecx
   29308:	85 c0                	test   %eax,%eax
   2930a:	0f 84 69 47 00 00    	je     2da79 <JS_CallInternal+0x8ae9>
   29310:	83 7b d8 03          	cmpl   $0x3,-0x28(%rbx)
   29314:	0f 84 0a 47 00 00    	je     2da24 <JS_CallInternal+0x8a94>
   2931a:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   2931e:	48 8b 53 d8          	mov    -0x28(%rbx),%rdx
   29322:	4c 8d 5b d0          	lea    -0x30(%rbx),%r11
   29326:	4c 89 e7             	mov    %r12,%rdi
   29329:	4c 89 9d 10 fe ff ff 	mov    %r11,-0x1f0(%rbp)
   29330:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   29336:	e8 e5 65 04 00       	call   6f920 <JS_HasProperty>
   2933b:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   29341:	4c 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%r11
   29348:	85 c0                	test   %eax,%eax
   2934a:	0f 8e 91 50 00 00    	jle    2e3e1 <JS_CallInternal+0x9451>
   29350:	48 83 ec 08          	sub    $0x8,%rsp
   29354:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   29358:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2935c:	4c 89 e7             	mov    %r12,%rdi
   2935f:	49 8b 33             	mov    (%r11),%rsi
   29362:	49 8b 53 08          	mov    0x8(%r11),%rdx
   29366:	68 00 80 00 00       	push   $0x8000
   2936b:	41 ff 73 08          	push   0x8(%r11)
   2936f:	41 ff 33             	push   (%r11)
   29372:	4c 89 9d 10 fe ff ff 	mov    %r11,-0x1f0(%rbp)
   29379:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2937f:	e8 4c 72 00 00       	call   305d0 <JS_SetPropertyInternal>
   29384:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2938a:	48 83 c4 20          	add    $0x20,%rsp
   2938e:	4c 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%r11
   29395:	89 c3                	mov    %eax,%ebx
   29397:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2939d:	0f 8f 75 33 00 00    	jg     2c718 <JS_CallInternal+0x7788>
   293a3:	49 8b 47 08          	mov    0x8(%r15),%rax
   293a7:	83 f8 f6             	cmp    $0xfffffff6,%eax
   293aa:	76 14                	jbe    293c0 <JS_CallInternal+0x4430>
   293ac:	49 8b 0f             	mov    (%r15),%rcx
   293af:	8b 71 fc             	mov    -0x4(%rcx),%esi
   293b2:	8d 56 ff             	lea    -0x1(%rsi),%edx
   293b5:	89 51 fc             	mov    %edx,-0x4(%rcx)
   293b8:	85 d2                	test   %edx,%edx
   293ba:	0f 8e d6 46 00 00    	jle    2da96 <JS_CallInternal+0x8b06>
   293c0:	49 8b 43 08          	mov    0x8(%r11),%rax
   293c4:	83 f8 f6             	cmp    $0xfffffff6,%eax
   293c7:	76 14                	jbe    293dd <JS_CallInternal+0x444d>
   293c9:	49 8b 0b             	mov    (%r11),%rcx
   293cc:	8b 51 fc             	mov    -0x4(%rcx),%edx
   293cf:	83 ea 01             	sub    $0x1,%edx
   293d2:	89 51 fc             	mov    %edx,-0x4(%rcx)
   293d5:	85 d2                	test   %edx,%edx
   293d7:	0f 8e 93 4e 00 00    	jle    2e270 <JS_CallInternal+0x92e0>
   293dd:	85 db                	test   %ebx,%ebx
   293df:	0f 88 d0 4f 00 00    	js     2e3b5 <JS_CallInternal+0x9425>
   293e5:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   293ea:	4c 89 db             	mov    %r11,%rbx
   293ed:	49 83 c5 01          	add    $0x1,%r13
   293f1:	49 89 c2             	mov    %rax,%r10
   293f4:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   293f8:	ff e0                	jmp    *%rax
   293fa:	f3 0f 1e fa          	endbr64
   293fe:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   29402:	41 8b 4d 00          	mov    0x0(%r13),%ecx
   29406:	4d 8d 7d 04          	lea    0x4(%r13),%r15
   2940a:	4c 8b 4b f0          	mov    -0x10(%rbx),%r9
   2940e:	83 f8 ff             	cmp    $0xffffffff,%eax
   29411:	0f 85 95 24 00 00    	jne    2b8ac <JS_CallInternal+0x691c>
   29417:	4c 89 cf             	mov    %r9,%rdi
   2941a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   29420:	4c 8b 47 18          	mov    0x18(%rdi),%r8
   29424:	41 8b 70 18          	mov    0x18(%r8),%esi
   29428:	89 f2                	mov    %esi,%edx
   2942a:	21 ca                	and    %ecx,%edx
   2942c:	41 8b 54 90 38       	mov    0x38(%r8,%rdx,4),%edx
   29431:	48 85 d2             	test   %rdx,%rdx
   29434:	0f 84 6b 1e 00 00    	je     2b2a5 <JS_CallInternal+0x6315>
   2943a:	4c 8d 14 b5 3c 00 00 	lea    0x3c(,%rsi,4),%r10
   29441:	00 
   29442:	48 83 ea 01          	sub    $0x1,%rdx
   29446:	49 8d 34 d2          	lea    (%r10,%rdx,8),%rsi
   2944a:	4c 01 c6             	add    %r8,%rsi
   2944d:	3b 4e 04             	cmp    0x4(%rsi),%ecx
   29450:	0f 85 41 1e 00 00    	jne    2b297 <JS_CallInternal+0x6307>
   29456:	48 8b 7f 20          	mov    0x20(%rdi),%rdi
   2945a:	80 7e 03 3f          	cmpb   $0x3f,0x3(%rsi)
   2945e:	0f 87 48 24 00 00    	ja     2b8ac <JS_CallInternal+0x691c>
   29464:	48 c1 e2 04          	shl    $0x4,%rdx
   29468:	48 01 d7             	add    %rdx,%rdi
   2946b:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   2946f:	48 8b 07             	mov    (%rdi),%rax
   29472:	83 fa f6             	cmp    $0xfffffff6,%edx
   29475:	76 04                	jbe    2947b <JS_CallInternal+0x44eb>
   29477:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2947b:	48 89 03             	mov    %rax,(%rbx)
   2947e:	49 83 c5 05          	add    $0x5,%r13
   29482:	48 83 c3 10          	add    $0x10,%rbx
   29486:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2948a:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2948f:	49 89 c2             	mov    %rax,%r10
   29492:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29496:	ff e0                	jmp    *%rax
   29498:	f3 0f 1e fa          	endbr64
   2949c:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   294a0:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   294a4:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   294a8:	4c 8b 7b f8          	mov    -0x8(%rbx),%r15
   294ac:	85 d2                	test   %edx,%edx
   294ae:	0f 85 64 4c 00 00    	jne    2e118 <JS_CallInternal+0x9188>
   294b4:	45 85 ff             	test   %r15d,%r15d
   294b7:	0f 85 ab 27 00 00    	jne    2bc68 <JS_CallInternal+0x6cd8>
   294bd:	31 c9                	xor    %ecx,%ecx
   294bf:	44 39 c7             	cmp    %r8d,%edi
   294c2:	0f 94 c1             	sete   %cl
   294c5:	48 63 c9             	movslq %ecx,%rcx
   294c8:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   294cf:	00 
   294d0:	48 89 4b e0          	mov    %rcx,-0x20(%rbx)
   294d4:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   294d9:	48 83 eb 10          	sub    $0x10,%rbx
   294dd:	49 83 c5 01          	add    $0x1,%r13
   294e1:	49 89 c2             	mov    %rax,%r10
   294e4:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   294e8:	ff e0                	jmp    *%rax
   294ea:	f3 0f 1e fa          	endbr64
   294ee:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   294f2:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   294f6:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   294fa:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   294fe:	89 cf                	mov    %ecx,%edi
   29500:	09 f7                	or     %esi,%edi
   29502:	0f 85 15 41 00 00    	jne    2d61d <JS_CallInternal+0x868d>
   29508:	39 c2                	cmp    %eax,%edx
   2950a:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   29511:	00 
   29512:	0f 9d c0             	setge  %al
   29515:	48 83 eb 10          	sub    $0x10,%rbx
   29519:	0f b6 c0             	movzbl %al,%eax
   2951c:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29520:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   29525:	49 83 c5 01          	add    $0x1,%r13
   29529:	49 89 c2             	mov    %rax,%r10
   2952c:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29530:	ff e0                	jmp    *%rax
   29532:	f3 0f 1e fa          	endbr64
   29536:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2953a:	0b 53 e8             	or     -0x18(%rbx),%edx
   2953d:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   29541:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   29545:	0f 85 b3 4a 00 00    	jne    2dffe <JS_CallInternal+0x906e>
   2954b:	09 c8                	or     %ecx,%eax
   2954d:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   29554:	00 
   29555:	48 83 eb 10          	sub    $0x10,%rbx
   29559:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2955d:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   29562:	49 83 c5 01          	add    $0x1,%r13
   29566:	49 89 c2             	mov    %rax,%r10
   29569:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2956d:	ff e0                	jmp    *%rax
   2956f:	f3 0f 1e fa          	endbr64
   29573:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   29577:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2957b:	83 fa 02             	cmp    $0x2,%edx
   2957e:	0f 87 a7 25 00 00    	ja     2bb2b <JS_CallInternal+0x6b9b>
   29584:	85 c0                	test   %eax,%eax
   29586:	0f 84 ac 50 00 00    	je     2e638 <JS_CallInternal+0x96a8>
   2958c:	3d 00 00 00 80       	cmp    $0x80000000,%eax
   29591:	0f 84 66 53 00 00    	je     2e8fd <JS_CallInternal+0x996d>
   29597:	f7 d8                	neg    %eax
   29599:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   295a0:	00 
   295a1:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   295a5:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   295aa:	49 83 c5 01          	add    $0x1,%r13
   295ae:	49 89 c2             	mov    %rax,%r10
   295b1:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   295b5:	ff e0                	jmp    *%rax
   295b7:	f3 0f 1e fa          	endbr64
   295bb:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   295bf:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   295c3:	a9 f7 ff ff ff       	test   $0xfffffff7,%eax
   295c8:	74 1b                	je     295e5 <JS_CallInternal+0x4655>
   295ca:	83 e8 01             	sub    $0x1,%eax
   295cd:	83 f8 01             	cmp    $0x1,%eax
   295d0:	0f 87 8d 34 00 00    	ja     2ca63 <JS_CallInternal+0x7ad3>
   295d6:	83 e2 ff             	and    $0xffffffff,%edx
   295d9:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   295e0:	00 
   295e1:	48 89 53 f0          	mov    %rdx,-0x10(%rbx)
   295e5:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   295ea:	49 83 c5 01          	add    $0x1,%r13
   295ee:	49 89 c2             	mov    %rax,%r10
   295f1:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   295f5:	ff e0                	jmp    *%rax
   295f7:	f3 0f 1e fa          	endbr64
   295fb:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   29602:	44 89 d2             	mov    %r10d,%edx
   29605:	48 89 de             	mov    %rbx,%rsi
   29608:	4c 89 e7             	mov    %r12,%rdi
   2960b:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2960f:	e8 dc c2 02 00       	call   558f0 <js_binary_arith_slow>
   29614:	85 c0                	test   %eax,%eax
   29616:	0f 85 05 56 00 00    	jne    2ec21 <JS_CallInternal+0x9c91>
   2961c:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   29621:	48 83 eb 10          	sub    $0x10,%rbx
   29625:	49 83 c5 01          	add    $0x1,%r13
   29629:	49 89 c2             	mov    %rax,%r10
   2962c:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29630:	ff e0                	jmp    *%rax
   29632:	f3 0f 1e fa          	endbr64
   29636:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2963a:	0b 43 e8             	or     -0x18(%rbx),%eax
   2963d:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   29641:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   29645:	75 b4                	jne    295fb <JS_CallInternal+0x466b>
   29647:	89 c8                	mov    %ecx,%eax
   29649:	89 d6                	mov    %edx,%esi
   2964b:	85 c9                	test   %ecx,%ecx
   2964d:	78 ac                	js     295fb <JS_CallInternal+0x466b>
   2964f:	85 d2                	test   %edx,%edx
   29651:	7e a8                	jle    295fb <JS_CallInternal+0x466b>
   29653:	99                   	cltd
   29654:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   2965b:	00 
   2965c:	49 83 c5 01          	add    $0x1,%r13
   29660:	48 83 eb 10          	sub    $0x10,%rbx
   29664:	f7 fe                	idiv   %esi
   29666:	48 63 d2             	movslq %edx,%rdx
   29669:	48 89 53 f0          	mov    %rdx,-0x10(%rbx)
   2966d:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   29672:	49 89 c2             	mov    %rax,%r10
   29675:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29679:	ff e0                	jmp    *%rax
   2967b:	f3 0f 1e fa          	endbr64
   2967f:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   29683:	0b 43 e8             	or     -0x18(%rbx),%eax
   29686:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   2968a:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2968e:	0f 85 67 ff ff ff    	jne    295fb <JS_CallInternal+0x466b>
   29694:	66 0f ef c0          	pxor   %xmm0,%xmm0
   29698:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2969c:	f2 0f 2a c1          	cvtsi2sd %ecx,%xmm0
   296a0:	f2 0f 2a ca          	cvtsi2sd %edx,%xmm1
   296a4:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
   296a8:	66 0f 2f 05 50 4d 0b 	comisd 0xb4d50(%rip),%xmm0        # de400 <__PRETTY_FUNCTION__.0+0xc0>
   296af:	00 
   296b0:	66 48 0f 7e c0       	movq   %xmm0,%rax
   296b5:	0f 82 d7 20 00 00    	jb     2b792 <JS_CallInternal+0x6802>
   296bb:	f2 0f 10 0d 45 4d 0b 	movsd  0xb4d45(%rip),%xmm1        # de408 <__PRETTY_FUNCTION__.0+0xc8>
   296c2:	00 
   296c3:	66 0f 2f c8          	comisd %xmm0,%xmm1
   296c7:	0f 82 c5 20 00 00    	jb     2b792 <JS_CallInternal+0x6802>
   296cd:	f2 0f 2c c8          	cvttsd2si %xmm0,%ecx
   296d1:	66 0f ef ff          	pxor   %xmm7,%xmm7
   296d5:	ba 08 00 00 00       	mov    $0x8,%edx
   296da:	f2 0f 2a f9          	cvtsi2sd %ecx,%xmm7
   296de:	66 48 0f 7e fe       	movq   %xmm7,%rsi
   296e3:	89 c9                	mov    %ecx,%ecx
   296e5:	48 39 f0             	cmp    %rsi,%rax
   296e8:	be 00 00 00 00       	mov    $0x0,%esi
   296ed:	48 0f 44 d6          	cmove  %rsi,%rdx
   296f1:	48 0f 44 c1          	cmove  %rcx,%rax
   296f5:	48 89 43 e0          	mov    %rax,-0x20(%rbx)
   296f9:	49 83 c5 01          	add    $0x1,%r13
   296fd:	48 83 eb 10          	sub    $0x10,%rbx
   29701:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   29705:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2970a:	49 89 c2             	mov    %rax,%r10
   2970d:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29711:	ff e0                	jmp    *%rax
   29713:	f3 0f 1e fa          	endbr64
   29717:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2971b:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   2971f:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   29723:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   29727:	89 c7                	mov    %eax,%edi
   29729:	09 f7                	or     %esi,%edi
   2972b:	0f 85 bb 41 00 00    	jne    2d8ec <JS_CallInternal+0x895c>
   29731:	48 63 f2             	movslq %edx,%rsi
   29734:	48 63 c1             	movslq %ecx,%rax
   29737:	48 0f af c6          	imul   %rsi,%rax
   2973b:	48 63 f0             	movslq %eax,%rsi
   2973e:	48 39 c6             	cmp    %rax,%rsi
   29741:	0f 85 09 41 00 00    	jne    2d850 <JS_CallInternal+0x88c0>
   29747:	48 85 f6             	test   %rsi,%rsi
   2974a:	0f 84 1e 4e 00 00    	je     2e56e <JS_CallInternal+0x95de>
   29750:	83 e0 ff             	and    $0xffffffff,%eax
   29753:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   2975a:	00 
   2975b:	48 83 eb 10          	sub    $0x10,%rbx
   2975f:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29763:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   29768:	49 83 c5 01          	add    $0x1,%r13
   2976c:	49 89 c2             	mov    %rax,%r10
   2976f:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29773:	ff e0                	jmp    *%rax
   29775:	f3 0f 1e fa          	endbr64
   29779:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2977d:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   29781:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   29785:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   29789:	89 c6                	mov    %eax,%esi
   2978b:	09 d6                	or     %edx,%esi
   2978d:	0f 85 1c 41 00 00    	jne    2d8af <JS_CallInternal+0x891f>
   29793:	89 fa                	mov    %edi,%edx
   29795:	48 63 f1             	movslq %ecx,%rsi
   29798:	48 63 c7             	movslq %edi,%rax
   2979b:	29 ca                	sub    %ecx,%edx
   2979d:	48 29 f0             	sub    %rsi,%rax
   297a0:	48 63 ca             	movslq %edx,%rcx
   297a3:	48 39 c1             	cmp    %rax,%rcx
   297a6:	0f 85 e8 40 00 00    	jne    2d894 <JS_CallInternal+0x8904>
   297ac:	89 d0                	mov    %edx,%eax
   297ae:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   297b5:	00 
   297b6:	48 89 43 e0          	mov    %rax,-0x20(%rbx)
   297ba:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   297bf:	48 83 eb 10          	sub    $0x10,%rbx
   297c3:	49 83 c5 01          	add    $0x1,%r13
   297c7:	49 89 c2             	mov    %rax,%r10
   297ca:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   297ce:	ff e0                	jmp    *%rax
   297d0:	f3 0f 1e fa          	endbr64
   297d4:	45 0f b6 4d 00       	movzbl 0x0(%r13),%r9d
   297d9:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   297dd:	4d 8d 7d 01          	lea    0x1(%r13),%r15
   297e1:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   297e5:	49 c1 e1 04          	shl    $0x4,%r9
   297e9:	4c 03 8d a0 fe ff ff 	add    -0x160(%rbp),%r9
   297f0:	89 ce                	mov    %ecx,%esi
   297f2:	49 8b 41 08          	mov    0x8(%r9),%rax
   297f6:	09 c6                	or     %eax,%esi
   297f8:	0f 85 0f 3d 00 00    	jne    2d50d <JS_CallInternal+0x857d>
   297fe:	49 8b 01             	mov    (%r9),%rax
   29801:	48 63 f2             	movslq %edx,%rsi
   29804:	48 63 c8             	movslq %eax,%rcx
   29807:	01 d0                	add    %edx,%eax
   29809:	48 01 f1             	add    %rsi,%rcx
   2980c:	48 63 d0             	movslq %eax,%rdx
   2980f:	48 39 ca             	cmp    %rcx,%rdx
   29812:	0f 85 dd 3c 00 00    	jne    2d4f5 <JS_CallInternal+0x8565>
   29818:	89 c0                	mov    %eax,%eax
   2981a:	49 89 01             	mov    %rax,(%r9)
   2981d:	31 c0                	xor    %eax,%eax
   2981f:	49 89 41 08          	mov    %rax,0x8(%r9)
   29823:	48 83 eb 10          	sub    $0x10,%rbx
   29827:	41 0f b6 45 01       	movzbl 0x1(%r13),%eax
   2982c:	49 83 c5 02          	add    $0x2,%r13
   29830:	49 89 c2             	mov    %rax,%r10
   29833:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29837:	ff e0                	jmp    *%rax
   29839:	f3 0f 1e fa          	endbr64
   2983d:	44 8b 4b f8          	mov    -0x8(%rbx),%r9d
   29841:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   29845:	45 85 c9             	test   %r9d,%r9d
   29848:	0f 85 00 25 00 00    	jne    2bd4e <JS_CallInternal+0x6dbe>
   2984e:	3d 00 00 00 80       	cmp    $0x80000000,%eax
   29853:	0f 84 f5 24 00 00    	je     2bd4e <JS_CallInternal+0x6dbe>
   29859:	83 e8 01             	sub    $0x1,%eax
   2985c:	48 c7 43 08 00 00 00 	movq   $0x0,0x8(%rbx)
   29863:	00 
   29864:	48 89 03             	mov    %rax,(%rbx)
   29867:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2986c:	48 83 c3 10          	add    $0x10,%rbx
   29870:	49 83 c5 01          	add    $0x1,%r13
   29874:	49 89 c2             	mov    %rax,%r10
   29877:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2987b:	ff e0                	jmp    *%rax
   2987d:	f3 0f 1e fa          	endbr64
   29881:	44 8b 5b f8          	mov    -0x8(%rbx),%r11d
   29885:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   29889:	45 85 db             	test   %r11d,%r11d
   2988c:	0f 85 36 24 00 00    	jne    2bcc8 <JS_CallInternal+0x6d38>
   29892:	3d ff ff ff 7f       	cmp    $0x7fffffff,%eax
   29897:	0f 84 2b 24 00 00    	je     2bcc8 <JS_CallInternal+0x6d38>
   2989d:	83 c0 01             	add    $0x1,%eax
   298a0:	48 c7 43 08 00 00 00 	movq   $0x0,0x8(%rbx)
   298a7:	00 
   298a8:	48 89 03             	mov    %rax,(%rbx)
   298ab:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   298b0:	48 83 c3 10          	add    $0x10,%rbx
   298b4:	49 83 c5 01          	add    $0x1,%r13
   298b8:	49 89 c2             	mov    %rax,%r10
   298bb:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   298bf:	ff e0                	jmp    *%rax
   298c1:	f3 0f 1e fa          	endbr64
   298c5:	41 0f b6 4d 00       	movzbl 0x0(%r13),%ecx
   298ca:	4d 8d 7d 01          	lea    0x1(%r13),%r15
   298ce:	48 c1 e1 04          	shl    $0x4,%rcx
   298d2:	48 03 8d a0 fe ff ff 	add    -0x160(%rbp),%rcx
   298d9:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   298dd:	48 8b 01             	mov    (%rcx),%rax
   298e0:	85 d2                	test   %edx,%edx
   298e2:	0f 85 34 21 00 00    	jne    2ba1c <JS_CallInternal+0x6a8c>
   298e8:	3d 00 00 00 80       	cmp    $0x80000000,%eax
   298ed:	0f 84 29 21 00 00    	je     2ba1c <JS_CallInternal+0x6a8c>
   298f3:	83 e8 01             	sub    $0x1,%eax
   298f6:	48 c7 41 08 00 00 00 	movq   $0x0,0x8(%rcx)
   298fd:	00 
   298fe:	48 89 01             	mov    %rax,(%rcx)
   29901:	41 0f b6 45 01       	movzbl 0x1(%r13),%eax
   29906:	49 83 c5 02          	add    $0x2,%r13
   2990a:	49 89 c2             	mov    %rax,%r10
   2990d:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29911:	ff e0                	jmp    *%rax
   29913:	f3 0f 1e fa          	endbr64
   29917:	44 8b 7b f8          	mov    -0x8(%rbx),%r15d
   2991b:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2991f:	45 85 ff             	test   %r15d,%r15d
   29922:	0f 85 70 23 00 00    	jne    2bc98 <JS_CallInternal+0x6d08>
   29928:	3d 00 00 00 80       	cmp    $0x80000000,%eax
   2992d:	0f 84 65 23 00 00    	je     2bc98 <JS_CallInternal+0x6d08>
   29933:	83 e8 01             	sub    $0x1,%eax
   29936:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   2993d:	00 
   2993e:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29942:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   29947:	49 83 c5 01          	add    $0x1,%r13
   2994b:	49 89 c2             	mov    %rax,%r10
   2994e:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29952:	ff e0                	jmp    *%rax
   29954:	f3 0f 1e fa          	endbr64
   29958:	44 8b 43 f8          	mov    -0x8(%rbx),%r8d
   2995c:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   29960:	45 85 c0             	test   %r8d,%r8d
   29963:	0f 85 e8 29 00 00    	jne    2c351 <JS_CallInternal+0x73c1>
   29969:	f7 d0                	not    %eax
   2996b:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   29972:	00 
   29973:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29977:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2997c:	49 83 c5 01          	add    $0x1,%r13
   29980:	49 89 c2             	mov    %rax,%r10
   29983:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29987:	ff e0                	jmp    *%rax
   29989:	f3 0f 1e fa          	endbr64
   2998d:	8b 53 f8             	mov    -0x8(%rbx),%edx
   29990:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   29994:	85 d2                	test   %edx,%edx
   29996:	0f 85 5c 23 00 00    	jne    2bcf8 <JS_CallInternal+0x6d68>
   2999c:	3d ff ff ff 7f       	cmp    $0x7fffffff,%eax
   299a1:	0f 84 51 23 00 00    	je     2bcf8 <JS_CallInternal+0x6d68>
   299a7:	83 c0 01             	add    $0x1,%eax
   299aa:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   299b1:	00 
   299b2:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   299b6:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   299bb:	49 83 c5 01          	add    $0x1,%r13
   299bf:	49 89 c2             	mov    %rax,%r10
   299c2:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   299c6:	ff e0                	jmp    *%rax
   299c8:	f3 0f 1e fa          	endbr64
   299cc:	41 0f b6 4d 00       	movzbl 0x0(%r13),%ecx
   299d1:	4d 8d 7d 01          	lea    0x1(%r13),%r15
   299d5:	48 c1 e1 04          	shl    $0x4,%rcx
   299d9:	48 03 8d a0 fe ff ff 	add    -0x160(%rbp),%rcx
   299e0:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   299e4:	48 8b 01             	mov    (%rcx),%rax
   299e7:	85 d2                	test   %edx,%edx
   299e9:	0f 85 97 1f 00 00    	jne    2b986 <JS_CallInternal+0x69f6>
   299ef:	3d ff ff ff 7f       	cmp    $0x7fffffff,%eax
   299f4:	0f 84 8c 1f 00 00    	je     2b986 <JS_CallInternal+0x69f6>
   299fa:	83 c0 01             	add    $0x1,%eax
   299fd:	48 c7 41 08 00 00 00 	movq   $0x0,0x8(%rcx)
   29a04:	00 
   29a05:	48 89 01             	mov    %rax,(%rcx)
   29a08:	41 0f b6 45 01       	movzbl 0x1(%r13),%eax
   29a0d:	49 83 c5 02          	add    $0x2,%r13
   29a11:	49 89 c2             	mov    %rax,%r10
   29a14:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29a18:	ff e0                	jmp    *%rax
   29a1a:	f3 0f 1e fa          	endbr64
   29a1e:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   29a25:	48 89 de             	mov    %rbx,%rsi
   29a28:	4c 89 e7             	mov    %r12,%rdi
   29a2b:	4c 89 68 30          	mov    %r13,0x30(%rax)
   29a2f:	e8 9c b3 07 00       	call   a4dd0 <js_append_enumerate>
   29a34:	85 c0                	test   %eax,%eax
   29a36:	0f 85 1f 59 00 00    	jne    2f35b <JS_CallInternal+0xa3cb>
   29a3c:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   29a40:	48 83 eb 10          	sub    $0x10,%rbx
   29a44:	83 f8 f6             	cmp    $0xfffffff6,%eax
   29a47:	76 14                	jbe    29a5d <JS_CallInternal+0x4acd>
   29a49:	48 8b 0b             	mov    (%rbx),%rcx
   29a4c:	8b 51 fc             	mov    -0x4(%rcx),%edx
   29a4f:	83 ea 01             	sub    $0x1,%edx
   29a52:	89 51 fc             	mov    %edx,-0x4(%rcx)
   29a55:	85 d2                	test   %edx,%edx
   29a57:	0f 8e 47 37 00 00    	jle    2d1a4 <JS_CallInternal+0x8214>
   29a5d:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   29a62:	49 83 c5 01          	add    $0x1,%r13
   29a66:	49 89 c2             	mov    %rax,%r10
   29a69:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29a6d:	ff e0                	jmp    *%rax
   29a6f:	f3 0f 1e fa          	endbr64
   29a73:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   29a77:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   29a7b:	45 31 c9             	xor    %r9d,%r9d
   29a7e:	4c 89 e7             	mov    %r12,%rdi
   29a81:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   29a88:	48 8b 4b d0          	mov    -0x30(%rbx),%rcx
   29a8c:	48 c7 85 b0 fd ff ff 	movq   $0x0,-0x250(%rbp)
   29a93:	00 00 00 00 
   29a97:	48 c7 85 b8 fd ff ff 	movq   $0x3,-0x248(%rbp)
   29a9e:	03 00 00 00 
   29aa2:	4c 8b 43 d8          	mov    -0x28(%rbx),%r8
   29aa6:	4c 89 68 30          	mov    %r13,0x30(%rax)
   29aaa:	48 c7 43 f0 00 00 00 	movq   $0x0,-0x10(%rbx)
   29ab1:	00 
   29ab2:	48 c7 43 f8 03 00 00 	movq   $0x3,-0x8(%rbx)
   29ab9:	00 
   29aba:	6a 02                	push   $0x2
   29abc:	6a 00                	push   $0x0
   29abe:	ff b5 b8 fd ff ff    	push   -0x248(%rbp)
   29ac4:	ff b5 b0 fd ff ff    	push   -0x250(%rbp)
   29aca:	e8 c1 b4 ff ff       	call   24f90 <JS_CallInternal>
   29acf:	48 83 c4 20          	add    $0x20,%rsp
   29ad3:	83 fa 06             	cmp    $0x6,%edx
   29ad6:	0f 84 fa 40 00 00    	je     2dbd6 <JS_CallInternal+0x8c46>
   29adc:	48 89 03             	mov    %rax,(%rbx)
   29adf:	49 83 c5 01          	add    $0x1,%r13
   29ae3:	48 83 c3 10          	add    $0x10,%rbx
   29ae7:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   29aeb:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   29af0:	49 89 c2             	mov    %rax,%r10
   29af3:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29af7:	ff e0                	jmp    *%rax
   29af9:	f3 0f 1e fa          	endbr64
   29afd:	41 0f b6 4d 00       	movzbl 0x0(%r13),%ecx
   29b02:	41 ba fd ff ff ff    	mov    $0xfffffffd,%r10d
   29b08:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   29b0f:	4d 8d 7d 01          	lea    0x1(%r13),%r15
   29b13:	c7 85 dc fe ff ff 01 	movl   $0x1,-0x124(%rbp)
   29b1a:	00 00 00 
   29b1d:	41 29 ca             	sub    %ecx,%r10d
   29b20:	4c 89 78 30          	mov    %r15,0x30(%rax)
   29b24:	4d 63 d2             	movslq %r10d,%r10
   29b27:	49 c1 e2 04          	shl    $0x4,%r10
   29b2b:	49 01 da             	add    %rbx,%r10
   29b2e:	49 8b 52 08          	mov    0x8(%r10),%rdx
   29b32:	83 fa 03             	cmp    $0x3,%edx
   29b35:	0f 84 a9 3f 00 00    	je     2dae4 <JS_CallInternal+0x8b54>
   29b3b:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
   29b40:	49 8b 32             	mov    (%r10),%rsi
   29b43:	4c 89 e7             	mov    %r12,%rdi
   29b46:	4c 8d 8d dc fe ff ff 	lea    -0x124(%rbp),%r9
   29b4d:	29 c8                	sub    %ecx,%eax
   29b4f:	4c 89 95 30 fe ff ff 	mov    %r10,-0x1d0(%rbp)
   29b56:	48 98                	cltq
   29b58:	48 c1 e0 04          	shl    $0x4,%rax
   29b5c:	48 01 d8             	add    %rbx,%rax
   29b5f:	48 8b 08             	mov    (%rax),%rcx
   29b62:	4c 8b 40 08          	mov    0x8(%rax),%r8
   29b66:	e8 75 6d 07 00       	call   a08e0 <JS_IteratorNext.constprop.0>
   29b6b:	4c 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%r10
   29b72:	48 89 c1             	mov    %rax,%rcx
   29b75:	83 fa 06             	cmp    $0x6,%edx
   29b78:	48 89 d0             	mov    %rdx,%rax
   29b7b:	48 89 d6             	mov    %rdx,%rsi
   29b7e:	48 89 cf             	mov    %rcx,%rdi
   29b81:	0f 84 32 3f 00 00    	je     2dab9 <JS_CallInternal+0x8b29>
   29b87:	44 8b 85 dc fe ff ff 	mov    -0x124(%rbp),%r8d
   29b8e:	31 d2                	xor    %edx,%edx
   29b90:	45 85 c0             	test   %r8d,%r8d
   29b93:	0f 85 64 2e 00 00    	jne    2c9fd <JS_CallInternal+0x7a6d>
   29b99:	48 89 3b             	mov    %rdi,(%rbx)
   29b9c:	49 83 c5 02          	add    $0x2,%r13
   29ba0:	48 83 c3 20          	add    $0x20,%rbx
   29ba4:	48 89 73 e8          	mov    %rsi,-0x18(%rbx)
   29ba8:	48 89 53 f0          	mov    %rdx,-0x10(%rbx)
   29bac:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   29bb3:	00 
   29bb4:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   29bb9:	49 89 c2             	mov    %rax,%r10
   29bbc:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29bc0:	ff e0                	jmp    *%rax
   29bc2:	f3 0f 1e fa          	endbr64
   29bc6:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   29bcd:	31 d2                	xor    %edx,%edx
   29bcf:	48 89 de             	mov    %rbx,%rsi
   29bd2:	4c 89 e7             	mov    %r12,%rdi
   29bd5:	4c 89 68 30          	mov    %r13,0x30(%rax)
   29bd9:	e8 92 55 07 00       	call   9f170 <js_for_of_start>
   29bde:	85 c0                	test   %eax,%eax
   29be0:	0f 85 27 53 00 00    	jne    2ef0d <JS_CallInternal+0x9f7d>
   29be6:	48 c7 43 10 00 00 00 	movq   $0x0,0x10(%rbx)
   29bed:	00 
   29bee:	49 83 c5 01          	add    $0x1,%r13
   29bf2:	48 83 c3 20          	add    $0x20,%rbx
   29bf6:	48 c7 43 f8 05 00 00 	movq   $0x5,-0x8(%rbx)
   29bfd:	00 
   29bfe:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   29c03:	49 89 c2             	mov    %rax,%r10
   29c06:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29c0a:	ff e0                	jmp    *%rax
   29c0c:	f3 0f 1e fa          	endbr64
   29c10:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   29c17:	48 89 de             	mov    %rbx,%rsi
   29c1a:	4c 89 e7             	mov    %r12,%rdi
   29c1d:	4c 89 68 30          	mov    %r13,0x30(%rax)
   29c21:	e8 3a b4 05 00       	call   85060 <js_for_in_next>
   29c26:	85 c0                	test   %eax,%eax
   29c28:	0f 85 eb 4f 00 00    	jne    2ec19 <JS_CallInternal+0x9c89>
   29c2e:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   29c33:	48 83 c3 20          	add    $0x20,%rbx
   29c37:	49 83 c5 01          	add    $0x1,%r13
   29c3b:	49 89 c2             	mov    %rax,%r10
   29c3e:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29c42:	ff e0                	jmp    *%rax
   29c44:	f3 0f 1e fa          	endbr64
   29c48:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   29c4c:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   29c50:	4c 89 e7             	mov    %r12,%rdi
   29c53:	4d 89 ef             	mov    %r13,%r15
   29c56:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   29c5d:	4c 89 68 30          	mov    %r13,0x30(%rax)
   29c61:	e8 6a 58 04 00       	call   6f4d0 <build_for_in_iterator>
   29c66:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29c6a:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   29c6e:	83 7b f8 06          	cmpl   $0x6,-0x8(%rbx)
   29c72:	0f 84 48 ba ff ff    	je     256c0 <JS_CallInternal+0x730>
   29c78:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   29c7d:	49 83 c5 01          	add    $0x1,%r13
   29c81:	49 89 c2             	mov    %rax,%r10
   29c84:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29c88:	ff e0                	jmp    *%rax
   29c8a:	f3 0f 1e fa          	endbr64
   29c8e:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   29c92:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   29c96:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   29c9a:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   29c9e:	89 cf                	mov    %ecx,%edi
   29ca0:	09 f7                	or     %esi,%edi
   29ca2:	0f 85 36 3f 00 00    	jne    2dbde <JS_CallInternal+0x8c4e>
   29ca8:	39 d0                	cmp    %edx,%eax
   29caa:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   29cb1:	00 
   29cb2:	0f 9c c0             	setl   %al
   29cb5:	48 83 eb 10          	sub    $0x10,%rbx
   29cb9:	0f b6 c0             	movzbl %al,%eax
   29cbc:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29cc0:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   29cc5:	49 83 c5 01          	add    $0x1,%r13
   29cc9:	49 89 c2             	mov    %rax,%r10
   29ccc:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29cd0:	ff e0                	jmp    *%rax
   29cd2:	f3 0f 1e fa          	endbr64
   29cd6:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   29cda:	0b 53 e8             	or     -0x18(%rbx),%edx
   29cdd:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   29ce1:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   29ce5:	0f 85 0a 3e 00 00    	jne    2daf5 <JS_CallInternal+0x8b65>
   29ceb:	31 c8                	xor    %ecx,%eax
   29ced:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   29cf4:	00 
   29cf5:	48 83 eb 10          	sub    $0x10,%rbx
   29cf9:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29cfd:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   29d02:	49 83 c5 01          	add    $0x1,%r13
   29d06:	49 89 c2             	mov    %rax,%r10
   29d09:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29d0d:	ff e0                	jmp    *%rax
   29d0f:	f3 0f 1e fa          	endbr64
   29d13:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   29d17:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   29d1b:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   29d1e:	76 04                	jbe    29d24 <JS_CallInternal+0x4d94>
   29d20:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   29d24:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   29d2b:	48 8b 40 10          	mov    0x10(%rax),%rax
   29d2f:	48 8b 40 18          	mov    0x18(%rax),%rax
   29d33:	48 8b 50 08          	mov    0x8(%rax),%rdx
   29d37:	48 8b 38             	mov    (%rax),%rdi
   29d3a:	48 89 48 08          	mov    %rcx,0x8(%rax)
   29d3e:	48 89 30             	mov    %rsi,(%rax)
   29d41:	83 fa f6             	cmp    $0xfffffff6,%edx
   29d44:	76 11                	jbe    29d57 <JS_CallInternal+0x4dc7>
   29d46:	8b 47 fc             	mov    -0x4(%rdi),%eax
   29d49:	83 e8 01             	sub    $0x1,%eax
   29d4c:	89 47 fc             	mov    %eax,-0x4(%rdi)
   29d4f:	85 c0                	test   %eax,%eax
   29d51:	0f 8e 86 35 00 00    	jle    2d2dd <JS_CallInternal+0x834d>
   29d57:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   29d5c:	49 83 c5 01          	add    $0x1,%r13
   29d60:	49 89 c2             	mov    %rax,%r10
   29d63:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29d67:	ff e0                	jmp    *%rax
   29d69:	f3 0f 1e fa          	endbr64
   29d6d:	83 7b d8 ff          	cmpl   $0xffffffff,-0x28(%rbx)
   29d71:	0f 85 95 22 00 00    	jne    2c00c <JS_CallInternal+0x707c>
   29d77:	44 8b 7b e8          	mov    -0x18(%rbx),%r15d
   29d7b:	45 85 ff             	test   %r15d,%r15d
   29d7e:	0f 85 88 22 00 00    	jne    2c00c <JS_CallInternal+0x707c>
   29d84:	48 8b 53 d0          	mov    -0x30(%rbx),%rdx
   29d88:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   29d8c:	66 83 7a 12 02       	cmpw   $0x2,0x12(%rdx)
   29d91:	0f 85 75 22 00 00    	jne    2c00c <JS_CallInternal+0x707c>
   29d97:	8b 4a 38             	mov    0x38(%rdx),%ecx
   29d9a:	39 c8                	cmp    %ecx,%eax
   29d9c:	0f 83 78 45 00 00    	jae    2e31a <JS_CallInternal+0x938a>
   29da2:	89 c0                	mov    %eax,%eax
   29da4:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   29da9:	48 c1 e0 04          	shl    $0x4,%rax
   29dad:	48 03 42 30          	add    0x30(%rdx),%rax
   29db1:	48 8b 50 08          	mov    0x8(%rax),%rdx
   29db5:	48 8b 08             	mov    (%rax),%rcx
   29db8:	0f 11 00             	movups %xmm0,(%rax)
   29dbb:	83 fa f6             	cmp    $0xfffffff6,%edx
   29dbe:	76 11                	jbe    29dd1 <JS_CallInternal+0x4e41>
   29dc0:	8b 41 fc             	mov    -0x4(%rcx),%eax
   29dc3:	83 e8 01             	sub    $0x1,%eax
   29dc6:	89 41 fc             	mov    %eax,-0x4(%rcx)
   29dc9:	85 c0                	test   %eax,%eax
   29dcb:	0f 8e 37 45 00 00    	jle    2e308 <JS_CallInternal+0x9378>
   29dd1:	48 8b 43 d8          	mov    -0x28(%rbx),%rax
   29dd5:	48 83 eb 30          	sub    $0x30,%rbx
   29dd9:	83 f8 f6             	cmp    $0xfffffff6,%eax
   29ddc:	76 14                	jbe    29df2 <JS_CallInternal+0x4e62>
   29dde:	48 8b 0b             	mov    (%rbx),%rcx
   29de1:	8b 71 fc             	mov    -0x4(%rcx),%esi
   29de4:	8d 56 ff             	lea    -0x1(%rsi),%edx
   29de7:	89 51 fc             	mov    %edx,-0x4(%rcx)
   29dea:	85 d2                	test   %edx,%edx
   29dec:	0f 8e ae 45 00 00    	jle    2e3a0 <JS_CallInternal+0x9410>
   29df2:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   29df7:	49 83 c5 01          	add    $0x1,%r13
   29dfb:	49 89 c2             	mov    %rax,%r10
   29dfe:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29e02:	ff e0                	jmp    *%rax
   29e04:	f3 0f 1e fa          	endbr64
   29e08:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   29e0c:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   29e10:	4c 89 e7             	mov    %r12,%rdi
   29e13:	4c 8d 7b f0          	lea    -0x10(%rbx),%r15
   29e17:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   29e1e:	4c 89 68 30          	mov    %r13,0x30(%rax)
   29e22:	e8 c9 c7 01 00       	call   465f0 <JS_ValueToAtom>
   29e27:	89 c1                	mov    %eax,%ecx
   29e29:	85 c0                	test   %eax,%eax
   29e2b:	0f 84 48 3d 00 00    	je     2db79 <JS_CallInternal+0x8be9>
   29e31:	48 83 ec 08          	sub    $0x8,%rsp
   29e35:	4c 8d 5b d0          	lea    -0x30(%rbx),%r11
   29e39:	48 8d 43 e0          	lea    -0x20(%rbx),%rax
   29e3d:	4c 8b 43 d0          	mov    -0x30(%rbx),%r8
   29e41:	4c 89 9d 20 fe ff ff 	mov    %r11,-0x1e0(%rbp)
   29e48:	4c 8b 4b d8          	mov    -0x28(%rbx),%r9
   29e4c:	4c 89 e7             	mov    %r12,%rdi
   29e4f:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   29e53:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   29e57:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   29e5e:	6a 00                	push   $0x0
   29e60:	89 8d f0 fd ff ff    	mov    %ecx,-0x210(%rbp)
   29e66:	e8 15 5a 00 00       	call   2f880 <JS_GetPropertyInternal>
   29e6b:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   29e71:	4c 8b 9d 20 fe ff ff 	mov    -0x1e0(%rbp),%r11
   29e78:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   29e7f:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   29e85:	48 89 95 10 fe ff ff 	mov    %rdx,-0x1f0(%rbp)
   29e8c:	58                   	pop    %rax
   29e8d:	5a                   	pop    %rdx
   29e8e:	0f 8f 72 25 00 00    	jg     2c406 <JS_CallInternal+0x7476>
   29e94:	83 bd 10 fe ff ff 06 	cmpl   $0x6,-0x1f0(%rbp)
   29e9b:	0f 84 e0 3c 00 00    	je     2db81 <JS_CallInternal+0x8bf1>
   29ea1:	49 8b 47 08          	mov    0x8(%r15),%rax
   29ea5:	83 f8 f6             	cmp    $0xfffffff6,%eax
   29ea8:	76 14                	jbe    29ebe <JS_CallInternal+0x4f2e>
   29eaa:	49 8b 0f             	mov    (%r15),%rcx
   29ead:	8b 71 fc             	mov    -0x4(%rcx),%esi
   29eb0:	8d 56 ff             	lea    -0x1(%rsi),%edx
   29eb3:	89 51 fc             	mov    %edx,-0x4(%rcx)
   29eb6:	85 d2                	test   %edx,%edx
   29eb8:	0f 8e 12 37 00 00    	jle    2d5d0 <JS_CallInternal+0x8640>
   29ebe:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   29ec5:	48 8b 41 08          	mov    0x8(%rcx),%rax
   29ec9:	83 f8 f6             	cmp    $0xfffffff6,%eax
   29ecc:	76 14                	jbe    29ee2 <JS_CallInternal+0x4f52>
   29ece:	48 8b 09             	mov    (%rcx),%rcx
   29ed1:	8b 71 fc             	mov    -0x4(%rcx),%esi
   29ed4:	8d 56 ff             	lea    -0x1(%rsi),%edx
   29ed7:	89 51 fc             	mov    %edx,-0x4(%rcx)
   29eda:	85 d2                	test   %edx,%edx
   29edc:	0f 8e a7 3c 00 00    	jle    2db89 <JS_CallInternal+0x8bf9>
   29ee2:	49 8b 43 08          	mov    0x8(%r11),%rax
   29ee6:	83 f8 f6             	cmp    $0xfffffff6,%eax
   29ee9:	76 14                	jbe    29eff <JS_CallInternal+0x4f6f>
   29eeb:	49 8b 0b             	mov    (%r11),%rcx
   29eee:	8b 71 fc             	mov    -0x4(%rcx),%esi
   29ef1:	8d 56 ff             	lea    -0x1(%rsi),%edx
   29ef4:	89 51 fc             	mov    %edx,-0x4(%rcx)
   29ef7:	85 d2                	test   %edx,%edx
   29ef9:	0f 8e e1 35 00 00    	jle    2d4e0 <JS_CallInternal+0x8550>
   29eff:	48 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%rax
   29f06:	49 83 c5 01          	add    $0x1,%r13
   29f0a:	48 89 43 d0          	mov    %rax,-0x30(%rbx)
   29f0e:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   29f15:	48 89 43 d8          	mov    %rax,-0x28(%rbx)
   29f19:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   29f1e:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   29f25:	49 89 c2             	mov    %rax,%r10
   29f28:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29f2c:	ff e0                	jmp    *%rax
   29f2e:	f3 0f 1e fa          	endbr64
   29f32:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   29f36:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   29f3a:	4c 8d 5b f0          	lea    -0x10(%rbx),%r11
   29f3e:	83 f8 f6             	cmp    $0xfffffff6,%eax
   29f41:	76 04                	jbe    29f47 <JS_CallInternal+0x4fb7>
   29f43:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   29f47:	48 92                	xchg   %rax,%rdx
   29f49:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   29f4d:	4c 89 e7             	mov    %r12,%rdi
   29f50:	41 b9 07 40 00 00    	mov    $0x4007,%r9d
   29f56:	49 89 d0             	mov    %rdx,%r8
   29f59:	48 8b 53 d8          	mov    -0x28(%rbx),%rdx
   29f5d:	41 ff 73 08          	push   0x8(%r11)
   29f61:	48 89 c1             	mov    %rax,%rcx
   29f64:	41 ff 33             	push   (%r11)
   29f67:	4d 89 ef             	mov    %r13,%r15
   29f6a:	4c 89 9d 30 fe ff ff 	mov    %r11,-0x1d0(%rbp)
   29f71:	e8 4a c8 01 00       	call   467c0 <JS_DefinePropertyValueValue>
   29f76:	5f                   	pop    %rdi
   29f77:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   29f7e:	41 58                	pop    %r8
   29f80:	85 c0                	test   %eax,%eax
   29f82:	0f 88 38 b7 ff ff    	js     256c0 <JS_CallInternal+0x730>
   29f88:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   29f8d:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   29f94:	49 83 c5 01          	add    $0x1,%r13
   29f98:	49 89 c2             	mov    %rax,%r10
   29f9b:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29f9f:	ff e0                	jmp    *%rax
   29fa1:	f3 0f 1e fa          	endbr64
   29fa5:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   29fa9:	0b 53 e8             	or     -0x18(%rbx),%edx
   29fac:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   29fb0:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   29fb4:	0f 85 39 36 00 00    	jne    2d5f3 <JS_CallInternal+0x8663>
   29fba:	d3 f8                	sar    %cl,%eax
   29fbc:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   29fc3:	00 
   29fc4:	48 83 eb 10          	sub    $0x10,%rbx
   29fc8:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29fcc:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   29fd1:	49 83 c5 01          	add    $0x1,%r13
   29fd5:	49 89 c2             	mov    %rax,%r10
   29fd8:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29fdc:	ff e0                	jmp    *%rax
   29fde:	f3 0f 1e fa          	endbr64
   29fe2:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   29fe6:	0b 53 e8             	or     -0x18(%rbx),%edx
   29fe9:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   29fed:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   29ff1:	0f 85 6e 36 00 00    	jne    2d665 <JS_CallInternal+0x86d5>
   29ff7:	d3 e8                	shr    %cl,%eax
   29ff9:	85 c0                	test   %eax,%eax
   29ffb:	0f 88 3b 1e 00 00    	js     2be3c <JS_CallInternal+0x6eac>
   2a001:	66 0f 6e c0          	movd   %eax,%xmm0
   2a005:	31 c0                	xor    %eax,%eax
   2a007:	48 89 43 e8          	mov    %rax,-0x18(%rbx)
   2a00b:	48 83 eb 10          	sub    $0x10,%rbx
   2a00f:	f2 0f 11 43 f0       	movsd  %xmm0,-0x10(%rbx)
   2a014:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2a019:	49 83 c5 01          	add    $0x1,%r13
   2a01d:	49 89 c2             	mov    %rax,%r10
   2a020:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a024:	ff e0                	jmp    *%rax
   2a026:	f3 0f 1e fa          	endbr64
   2a02a:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2a02e:	0b 53 e8             	or     -0x18(%rbx),%edx
   2a031:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   2a035:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2a039:	0f 85 6d 3b 00 00    	jne    2dbac <JS_CallInternal+0x8c1c>
   2a03f:	21 c8                	and    %ecx,%eax
   2a041:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   2a048:	00 
   2a049:	48 83 eb 10          	sub    $0x10,%rbx
   2a04d:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2a051:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2a056:	49 83 c5 01          	add    $0x1,%r13
   2a05a:	49 89 c2             	mov    %rax,%r10
   2a05d:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a061:	ff e0                	jmp    *%rax
   2a063:	f3 0f 1e fa          	endbr64
   2a067:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2a06b:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   2a06f:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   2a073:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2a077:	89 cf                	mov    %ecx,%edi
   2a079:	09 f7                	or     %esi,%edi
   2a07b:	0f 85 0b 36 00 00    	jne    2d68c <JS_CallInternal+0x86fc>
   2a081:	39 d0                	cmp    %edx,%eax
   2a083:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   2a08a:	00 
   2a08b:	0f 9e c0             	setle  %al
   2a08e:	48 83 eb 10          	sub    $0x10,%rbx
   2a092:	0f b6 c0             	movzbl %al,%eax
   2a095:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2a099:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2a09e:	49 83 c5 01          	add    $0x1,%r13
   2a0a2:	49 89 c2             	mov    %rax,%r10
   2a0a5:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a0a9:	ff e0                	jmp    *%rax
   2a0ab:	f3 0f 1e fa          	endbr64
   2a0af:	41 8b 45 00          	mov    0x0(%r13),%eax
   2a0b3:	4c 8b 5b e8          	mov    -0x18(%rbx),%r11
   2a0b7:	4d 8d 7d 04          	lea    0x4(%r13),%r15
   2a0bb:	4c 8b 53 e0          	mov    -0x20(%rbx),%r10
   2a0bf:	4c 01 e8             	add    %r13,%rax
   2a0c2:	41 83 fb ff          	cmp    $0xffffffff,%r11d
   2a0c6:	75 0c                	jne    2a0d4 <JS_CallInternal+0x5144>
   2a0c8:	66 41 83 7a 12 01    	cmpw   $0x1,0x12(%r10)
   2a0ce:	0f 84 a9 2a 00 00    	je     2cb7d <JS_CallInternal+0x7bed>
   2a0d4:	48 83 ec 08          	sub    $0x8,%rsp
   2a0d8:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2a0dc:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2a0e0:	4c 89 da             	mov    %r11,%rdx
   2a0e3:	48 8b 8d b8 fe ff ff 	mov    -0x148(%rbp),%rcx
   2a0ea:	4c 89 9d 30 fe ff ff 	mov    %r11,-0x1d0(%rbp)
   2a0f1:	4c 89 d6             	mov    %r10,%rsi
   2a0f4:	4c 89 e7             	mov    %r12,%rdi
   2a0f7:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   2a0fe:	4c 89 79 30          	mov    %r15,0x30(%rcx)
   2a102:	8b 48 14             	mov    0x14(%rax),%ecx
   2a105:	68 00 80 00 00       	push   $0x8000
   2a10a:	41 53                	push   %r11
   2a10c:	41 52                	push   %r10
   2a10e:	e8 bd 64 00 00       	call   305d0 <JS_SetPropertyInternal>
   2a113:	4c 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%r11
   2a11a:	48 83 c4 20          	add    $0x20,%rsp
   2a11e:	89 c1                	mov    %eax,%ecx
   2a120:	41 83 fb f6          	cmp    $0xfffffff6,%r11d
   2a124:	76 1a                	jbe    2a140 <JS_CallInternal+0x51b0>
   2a126:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   2a12d:	41 8b 42 fc          	mov    -0x4(%r10),%eax
   2a131:	83 e8 01             	sub    $0x1,%eax
   2a134:	41 89 42 fc          	mov    %eax,-0x4(%r10)
   2a138:	85 c0                	test   %eax,%eax
   2a13a:	0f 8e 28 2d 00 00    	jle    2ce68 <JS_CallInternal+0x7ed8>
   2a140:	48 83 eb 20          	sub    $0x20,%rbx
   2a144:	85 c9                	test   %ecx,%ecx
   2a146:	0f 88 74 b5 ff ff    	js     256c0 <JS_CallInternal+0x730>
   2a14c:	41 0f b6 45 04       	movzbl 0x4(%r13),%eax
   2a151:	49 83 c5 05          	add    $0x5,%r13
   2a155:	49 89 c2             	mov    %rax,%r10
   2a158:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a15c:	ff e0                	jmp    *%rax
   2a15e:	f3 0f 1e fa          	endbr64
   2a162:	49 0f be 45 00       	movsbq 0x0(%r13),%rax
   2a167:	4d 8d 7c 05 00       	lea    0x0(%r13,%rax,1),%r15
   2a16c:	41 8b 84 24 a8 01 00 	mov    0x1a8(%r12),%eax
   2a173:	00 
   2a174:	83 e8 01             	sub    $0x1,%eax
   2a177:	41 89 84 24 a8 01 00 	mov    %eax,0x1a8(%r12)
   2a17e:	00 
   2a17f:	85 c0                	test   %eax,%eax
   2a181:	0f 8e 42 33 00 00    	jle    2d4c9 <JS_CallInternal+0x8539>
   2a187:	41 0f b6 07          	movzbl (%r15),%eax
   2a18b:	4d 8d 6f 01          	lea    0x1(%r15),%r13
   2a18f:	49 89 c2             	mov    %rax,%r10
   2a192:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2a196:	f3 0f 1e fa          	endbr64
   2a19a:	49 0f bf 45 00       	movswq 0x0(%r13),%rax
   2a19f:	4d 8d 7c 05 00       	lea    0x0(%r13,%rax,1),%r15
   2a1a4:	41 8b 84 24 a8 01 00 	mov    0x1a8(%r12),%eax
   2a1ab:	00 
   2a1ac:	83 e8 01             	sub    $0x1,%eax
   2a1af:	41 89 84 24 a8 01 00 	mov    %eax,0x1a8(%r12)
   2a1b6:	00 
   2a1b7:	85 c0                	test   %eax,%eax
   2a1b9:	0f 8e 99 3e 00 00    	jle    2e058 <JS_CallInternal+0x90c8>
   2a1bf:	41 0f b6 07          	movzbl (%r15),%eax
   2a1c3:	4d 8d 6f 01          	lea    0x1(%r15),%r13
   2a1c7:	49 89 c2             	mov    %rax,%r10
   2a1ca:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2a1ce:	f3 0f 1e fa          	endbr64
   2a1d2:	49 63 45 00          	movslq 0x0(%r13),%rax
   2a1d6:	4d 8d 7c 05 00       	lea    0x0(%r13,%rax,1),%r15
   2a1db:	41 8b 84 24 a8 01 00 	mov    0x1a8(%r12),%eax
   2a1e2:	00 
   2a1e3:	83 e8 01             	sub    $0x1,%eax
   2a1e6:	41 89 84 24 a8 01 00 	mov    %eax,0x1a8(%r12)
   2a1ed:	00 
   2a1ee:	85 c0                	test   %eax,%eax
   2a1f0:	0f 8e fb 35 00 00    	jle    2d7f1 <JS_CallInternal+0x8861>
   2a1f6:	41 0f b6 07          	movzbl (%r15),%eax
   2a1fa:	4d 8d 6f 01          	lea    0x1(%r15),%r13
   2a1fe:	49 89 c2             	mov    %rax,%r10
   2a201:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2a205:	f3 0f 1e fa          	endbr64
   2a209:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   2a20d:	4c 8d 7b e0          	lea    -0x20(%rbx),%r15
   2a211:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   2a215:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2a218:	76 11                	jbe    2a22b <JS_CallInternal+0x529b>
   2a21a:	8b 51 fc             	mov    -0x4(%rcx),%edx
   2a21d:	83 ea 01             	sub    $0x1,%edx
   2a220:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2a223:	85 d2                	test   %edx,%edx
   2a225:	0f 8e 03 31 00 00    	jle    2d32e <JS_CallInternal+0x839e>
   2a22b:	4c 8d 5b d0          	lea    -0x30(%rbx),%r11
   2a22f:	83 7b d8 03          	cmpl   $0x3,-0x28(%rbx)
   2a233:	74 51                	je     2a286 <JS_CallInternal+0x52f6>
   2a235:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2a23c:	49 8b 53 08          	mov    0x8(%r11),%rdx
   2a240:	31 c9                	xor    %ecx,%ecx
   2a242:	4c 89 e7             	mov    %r12,%rdi
   2a245:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   2a249:	4c 89 9d 30 fe ff ff 	mov    %r11,-0x1d0(%rbp)
   2a250:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2a254:	e8 b7 9e 06 00       	call   94110 <JS_IteratorClose>
   2a259:	4c 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%r11
   2a260:	85 c0                	test   %eax,%eax
   2a262:	0f 85 07 54 00 00    	jne    2f66f <JS_CallInternal+0xa6df>
   2a268:	49 8b 43 08          	mov    0x8(%r11),%rax
   2a26c:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2a26f:	76 15                	jbe    2a286 <JS_CallInternal+0x52f6>
   2a271:	48 8b 4b d0          	mov    -0x30(%rbx),%rcx
   2a275:	8b 59 fc             	mov    -0x4(%rcx),%ebx
   2a278:	8d 53 ff             	lea    -0x1(%rbx),%edx
   2a27b:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2a27e:	85 d2                	test   %edx,%edx
   2a280:	0f 8e b0 44 00 00    	jle    2e736 <JS_CallInternal+0x97a6>
   2a286:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2a28b:	4c 89 db             	mov    %r11,%rbx
   2a28e:	49 83 c5 01          	add    $0x1,%r13
   2a292:	49 89 c2             	mov    %rax,%r10
   2a295:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a299:	ff e0                	jmp    *%rax
   2a29b:	f3 0f 1e fa          	endbr64
   2a29f:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   2a2a3:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
   2a2a8:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   2a2ac:	83 fe f6             	cmp    $0xfffffff6,%esi
   2a2af:	76 04                	jbe    2a2b5 <JS_CallInternal+0x5325>
   2a2b1:	83 47 fc 01          	addl   $0x1,-0x4(%rdi)
   2a2b5:	48 8b 8d 88 fe ff ff 	mov    -0x178(%rbp),%rcx
   2a2bc:	48 8b 04 c1          	mov    (%rcx,%rax,8),%rax
   2a2c0:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a2c4:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2a2c8:	48 8b 08             	mov    (%rax),%rcx
   2a2cb:	48 89 70 08          	mov    %rsi,0x8(%rax)
   2a2cf:	48 89 38             	mov    %rdi,(%rax)
   2a2d2:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a2d5:	76 11                	jbe    2a2e8 <JS_CallInternal+0x5358>
   2a2d7:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2a2da:	83 e8 01             	sub    $0x1,%eax
   2a2dd:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2a2e0:	85 c0                	test   %eax,%eax
   2a2e2:	0f 8e 18 2b 00 00    	jle    2ce00 <JS_CallInternal+0x7e70>
   2a2e8:	41 0f b6 45 02       	movzbl 0x2(%r13),%eax
   2a2ed:	49 83 c5 03          	add    $0x3,%r13
   2a2f1:	49 89 c2             	mov    %rax,%r10
   2a2f4:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a2f8:	ff e0                	jmp    *%rax
   2a2fa:	f3 0f 1e fa          	endbr64
   2a2fe:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
   2a303:	4d 8d 7d 02          	lea    0x2(%r13),%r15
   2a307:	48 89 c1             	mov    %rax,%rcx
   2a30a:	48 c1 e0 04          	shl    $0x4,%rax
   2a30e:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   2a315:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2a319:	83 fa 04             	cmp    $0x4,%edx
   2a31c:	0f 84 4e 3d 00 00    	je     2e070 <JS_CallInternal+0x90e0>
   2a322:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2a326:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2a32a:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   2a32d:	76 04                	jbe    2a333 <JS_CallInternal+0x53a3>
   2a32f:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2a333:	48 8b 38             	mov    (%rax),%rdi
   2a336:	48 89 48 08          	mov    %rcx,0x8(%rax)
   2a33a:	48 89 30             	mov    %rsi,(%rax)
   2a33d:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a340:	76 11                	jbe    2a353 <JS_CallInternal+0x53c3>
   2a342:	8b 47 fc             	mov    -0x4(%rdi),%eax
   2a345:	83 e8 01             	sub    $0x1,%eax
   2a348:	89 47 fc             	mov    %eax,-0x4(%rdi)
   2a34b:	85 c0                	test   %eax,%eax
   2a34d:	0f 8e 48 2b 00 00    	jle    2ce9b <JS_CallInternal+0x7f0b>
   2a353:	41 0f b6 45 02       	movzbl 0x2(%r13),%eax
   2a358:	49 83 c5 03          	add    $0x3,%r13
   2a35c:	49 89 c2             	mov    %rax,%r10
   2a35f:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a363:	ff e0                	jmp    *%rax
   2a365:	f3 0f 1e fa          	endbr64
   2a369:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
   2a36e:	4d 8d 7d 02          	lea    0x2(%r13),%r15
   2a372:	48 89 c1             	mov    %rax,%rcx
   2a375:	48 c1 e0 04          	shl    $0x4,%rax
   2a379:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   2a380:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2a384:	83 fa 04             	cmp    $0x4,%edx
   2a387:	0f 84 ee 34 00 00    	je     2d87b <JS_CallInternal+0x88eb>
   2a38d:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2a392:	48 8b 08             	mov    (%rax),%rcx
   2a395:	0f 11 00             	movups %xmm0,(%rax)
   2a398:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a39b:	76 11                	jbe    2a3ae <JS_CallInternal+0x541e>
   2a39d:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2a3a0:	83 e8 01             	sub    $0x1,%eax
   2a3a3:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2a3a6:	85 c0                	test   %eax,%eax
   2a3a8:	0f 8e db 2a 00 00    	jle    2ce89 <JS_CallInternal+0x7ef9>
   2a3ae:	41 0f b6 45 02       	movzbl 0x2(%r13),%eax
   2a3b3:	48 83 eb 10          	sub    $0x10,%rbx
   2a3b7:	49 83 c5 03          	add    $0x3,%r13
   2a3bb:	49 89 c2             	mov    %rax,%r10
   2a3be:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a3c2:	ff e0                	jmp    *%rax
   2a3c4:	f3 0f 1e fa          	endbr64
   2a3c8:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
   2a3cd:	4d 8d 7d 02          	lea    0x2(%r13),%r15
   2a3d1:	48 89 c1             	mov    %rax,%rcx
   2a3d4:	48 c1 e0 04          	shl    $0x4,%rax
   2a3d8:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   2a3df:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2a3e3:	83 fa 04             	cmp    $0x4,%edx
   2a3e6:	0f 84 f5 3b 00 00    	je     2dfe1 <JS_CallInternal+0x9051>
   2a3ec:	48 8b 00             	mov    (%rax),%rax
   2a3ef:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a3f2:	76 04                	jbe    2a3f8 <JS_CallInternal+0x5468>
   2a3f4:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2a3f8:	48 89 03             	mov    %rax,(%rbx)
   2a3fb:	49 83 c5 03          	add    $0x3,%r13
   2a3ff:	48 83 c3 10          	add    $0x10,%rbx
   2a403:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2a407:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2a40c:	49 89 c2             	mov    %rax,%r10
   2a40f:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a413:	ff e0                	jmp    *%rax
   2a415:	f3 0f 1e fa          	endbr64
   2a419:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
   2a41e:	4d 8d 7d 02          	lea    0x2(%r13),%r15
   2a422:	48 89 c1             	mov    %rax,%rcx
   2a425:	48 c1 e0 04          	shl    $0x4,%rax
   2a429:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   2a430:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2a434:	83 fa 04             	cmp    $0x4,%edx
   2a437:	0f 84 8b 3b 00 00    	je     2dfc8 <JS_CallInternal+0x9038>
   2a43d:	48 8b 00             	mov    (%rax),%rax
   2a440:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a443:	76 04                	jbe    2a449 <JS_CallInternal+0x54b9>
   2a445:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2a449:	48 89 03             	mov    %rax,(%rbx)
   2a44c:	49 83 c5 03          	add    $0x3,%r13
   2a450:	48 83 c3 10          	add    $0x10,%rbx
   2a454:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2a458:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2a45d:	49 89 c2             	mov    %rax,%r10
   2a460:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a464:	ff e0                	jmp    *%rax
   2a466:	f3 0f 1e fa          	endbr64
   2a46a:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   2a471:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
   2a476:	0f b7 51 38          	movzwl 0x38(%rcx),%edx
   2a47a:	4c 8b 79 28          	mov    0x28(%rcx),%r15
   2a47e:	48 8b 8d b8 fe ff ff 	mov    -0x148(%rbp),%rcx
   2a485:	01 d0                	add    %edx,%eax
   2a487:	48 98                	cltq
   2a489:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
   2a48d:	49 8d 04 87          	lea    (%r15,%rax,4),%rax
   2a491:	44 0f b7 78 0a       	movzwl 0xa(%rax),%r15d
   2a496:	4a 8d 14 fd 00 00 00 	lea    0x0(,%r15,8),%rdx
   2a49d:	00 
   2a49e:	48 03 51 28          	add    0x28(%rcx),%rdx
   2a4a2:	48 8b 02             	mov    (%rdx),%rax
   2a4a5:	48 85 c0             	test   %rax,%rax
   2a4a8:	74 48                	je     2a4f2 <JS_CallInternal+0x5562>
   2a4aa:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2a4af:	f6 41 3c 04          	testb  $0x4,0x3c(%rcx)
   2a4b3:	0f 85 77 27 00 00    	jne    2cc30 <JS_CallInternal+0x7ca0>
   2a4b9:	48 8b 70 18          	mov    0x18(%rax),%rsi
   2a4bd:	48 8b 0e             	mov    (%rsi),%rcx
   2a4c0:	48 8b 76 08          	mov    0x8(%rsi),%rsi
   2a4c4:	83 fe f6             	cmp    $0xfffffff6,%esi
   2a4c7:	76 04                	jbe    2a4cd <JS_CallInternal+0x553d>
   2a4c9:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   2a4cd:	48 89 70 28          	mov    %rsi,0x28(%rax)
   2a4d1:	48 8d 70 20          	lea    0x20(%rax),%rsi
   2a4d5:	66 48 0f 6e e1       	movq   %rcx,%xmm4
   2a4da:	66 48 0f 6e c6       	movq   %rsi,%xmm0
   2a4df:	c6 40 10 01          	movb   $0x1,0x10(%rax)
   2a4e3:	66 0f 6c c4          	punpcklqdq %xmm4,%xmm0
   2a4e7:	0f 11 40 18          	movups %xmm0,0x18(%rax)
   2a4eb:	48 c7 02 00 00 00 00 	movq   $0x0,(%rdx)
   2a4f2:	41 0f b6 45 02       	movzbl 0x2(%r13),%eax
   2a4f7:	49 83 c5 03          	add    $0x3,%r13
   2a4fb:	49 89 c2             	mov    %rax,%r10
   2a4fe:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a502:	ff e0                	jmp    *%rax
   2a504:	f3 0f 1e fa          	endbr64
   2a508:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
   2a50d:	4d 8d 7d 02          	lea    0x2(%r13),%r15
   2a511:	48 c1 e0 04          	shl    $0x4,%rax
   2a515:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   2a51c:	83 78 08 04          	cmpl   $0x4,0x8(%rax)
   2a520:	0f 85 02 3b 00 00    	jne    2e028 <JS_CallInternal+0x9098>
   2a526:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2a52b:	49 83 c5 03          	add    $0x3,%r13
   2a52f:	48 83 eb 10          	sub    $0x10,%rbx
   2a533:	0f 11 00             	movups %xmm0,(%rax)
   2a536:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2a53b:	49 89 c2             	mov    %rax,%r10
   2a53e:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a542:	ff e0                	jmp    *%rax
   2a544:	f3 0f 1e fa          	endbr64
   2a548:	e9 8d af ff ff       	jmp    254da <JS_CallInternal+0x54a>
   2a54d:	f3 0f 1e fa          	endbr64
   2a551:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2a558:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2a55d:	48 83 eb 10          	sub    $0x10,%rbx
   2a561:	48 8b 40 10          	mov    0x10(%rax),%rax
   2a565:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a569:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2a56d:	48 8b 08             	mov    (%rax),%rcx
   2a570:	0f 11 00             	movups %xmm0,(%rax)
   2a573:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a576:	76 11                	jbe    2a589 <JS_CallInternal+0x55f9>
   2a578:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2a57b:	83 e8 01             	sub    $0x1,%eax
   2a57e:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2a581:	85 c0                	test   %eax,%eax
   2a583:	0f 8e 2b 2a 00 00    	jle    2cfb4 <JS_CallInternal+0x8024>
   2a589:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2a58e:	49 83 c5 01          	add    $0x1,%r13
   2a592:	49 89 c2             	mov    %rax,%r10
   2a595:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a599:	ff e0                	jmp    *%rax
   2a59b:	f3 0f 1e fa          	endbr64
   2a59f:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2a5a6:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2a5ab:	48 83 eb 10          	sub    $0x10,%rbx
   2a5af:	48 8b 40 08          	mov    0x8(%rax),%rax
   2a5b3:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a5b7:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2a5bb:	48 8b 08             	mov    (%rax),%rcx
   2a5be:	0f 11 00             	movups %xmm0,(%rax)
   2a5c1:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a5c4:	76 11                	jbe    2a5d7 <JS_CallInternal+0x5647>
   2a5c6:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2a5c9:	83 e8 01             	sub    $0x1,%eax
   2a5cc:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2a5cf:	85 c0                	test   %eax,%eax
   2a5d1:	0f 8e f3 27 00 00    	jle    2cdca <JS_CallInternal+0x7e3a>
   2a5d7:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2a5dc:	49 83 c5 01          	add    $0x1,%r13
   2a5e0:	49 89 c2             	mov    %rax,%r10
   2a5e3:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a5e7:	ff e0                	jmp    *%rax
   2a5e9:	f3 0f 1e fa          	endbr64
   2a5ed:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2a5f4:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2a5f9:	48 83 eb 10          	sub    $0x10,%rbx
   2a5fd:	48 8b 00             	mov    (%rax),%rax
   2a600:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a604:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2a608:	48 8b 08             	mov    (%rax),%rcx
   2a60b:	0f 11 00             	movups %xmm0,(%rax)
   2a60e:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a611:	76 11                	jbe    2a624 <JS_CallInternal+0x5694>
   2a613:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2a616:	83 e8 01             	sub    $0x1,%eax
   2a619:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2a61c:	85 c0                	test   %eax,%eax
   2a61e:	0f 8e 94 27 00 00    	jle    2cdb8 <JS_CallInternal+0x7e28>
   2a624:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2a629:	49 83 c5 01          	add    $0x1,%r13
   2a62d:	49 89 c2             	mov    %rax,%r10
   2a630:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a634:	ff e0                	jmp    *%rax
   2a636:	f3 0f 1e fa          	endbr64
   2a63a:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2a641:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   2a645:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a649:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a64d:	48 8b 10             	mov    (%rax),%rdx
   2a650:	48 8b 40 08          	mov    0x8(%rax),%rax
   2a654:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2a657:	76 04                	jbe    2a65d <JS_CallInternal+0x56cd>
   2a659:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2a65d:	48 89 13             	mov    %rdx,(%rbx)
   2a660:	49 83 c5 01          	add    $0x1,%r13
   2a664:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2a668:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2a66d:	48 89 cb             	mov    %rcx,%rbx
   2a670:	49 89 c2             	mov    %rax,%r10
   2a673:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a677:	ff e0                	jmp    *%rax
   2a679:	f3 0f 1e fa          	endbr64
   2a67d:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2a681:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2a685:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   2a688:	76 04                	jbe    2a68e <JS_CallInternal+0x56fe>
   2a68a:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2a68e:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2a695:	48 8b 00             	mov    (%rax),%rax
   2a698:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a69c:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2a6a0:	48 8b 38             	mov    (%rax),%rdi
   2a6a3:	48 89 48 08          	mov    %rcx,0x8(%rax)
   2a6a7:	48 89 30             	mov    %rsi,(%rax)
   2a6aa:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a6ad:	76 11                	jbe    2a6c0 <JS_CallInternal+0x5730>
   2a6af:	8b 47 fc             	mov    -0x4(%rdi),%eax
   2a6b2:	83 e8 01             	sub    $0x1,%eax
   2a6b5:	89 47 fc             	mov    %eax,-0x4(%rdi)
   2a6b8:	85 c0                	test   %eax,%eax
   2a6ba:	0f 8e 52 27 00 00    	jle    2ce12 <JS_CallInternal+0x7e82>
   2a6c0:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2a6c5:	49 83 c5 01          	add    $0x1,%r13
   2a6c9:	49 89 c2             	mov    %rax,%r10
   2a6cc:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a6d0:	ff e0                	jmp    *%rax
   2a6d2:	f3 0f 1e fa          	endbr64
   2a6d6:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2a6da:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2a6de:	4d 8d 7d 04          	lea    0x4(%r13),%r15
   2a6e2:	83 fa 03             	cmp    $0x3,%edx
   2a6e5:	0f 87 fb 1c 00 00    	ja     2c3e6 <JS_CallInternal+0x7456>
   2a6eb:	48 83 eb 10          	sub    $0x10,%rbx
   2a6ef:	85 c0                	test   %eax,%eax
   2a6f1:	75 0c                	jne    2a6ff <JS_CallInternal+0x576f>
   2a6f3:	41 8b 45 00          	mov    0x0(%r13),%eax
   2a6f7:	83 e8 04             	sub    $0x4,%eax
   2a6fa:	48 98                	cltq
   2a6fc:	49 01 c7             	add    %rax,%r15
   2a6ff:	41 8b 84 24 a8 01 00 	mov    0x1a8(%r12),%eax
   2a706:	00 
   2a707:	83 e8 01             	sub    $0x1,%eax
   2a70a:	41 89 84 24 a8 01 00 	mov    %eax,0x1a8(%r12)
   2a711:	00 
   2a712:	85 c0                	test   %eax,%eax
   2a714:	0f 8e 24 39 00 00    	jle    2e03e <JS_CallInternal+0x90ae>
   2a71a:	41 0f b6 07          	movzbl (%r15),%eax
   2a71e:	4d 8d 6f 01          	lea    0x1(%r15),%r13
   2a722:	49 89 c2             	mov    %rax,%r10
   2a725:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2a729:	f3 0f 1e fa          	endbr64
   2a72d:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2a731:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2a735:	4d 8d 7d 04          	lea    0x4(%r13),%r15
   2a739:	83 fa 03             	cmp    $0x3,%edx
   2a73c:	0f 87 06 1b 00 00    	ja     2c248 <JS_CallInternal+0x72b8>
   2a742:	48 83 eb 10          	sub    $0x10,%rbx
   2a746:	85 c0                	test   %eax,%eax
   2a748:	74 0c                	je     2a756 <JS_CallInternal+0x57c6>
   2a74a:	41 8b 45 00          	mov    0x0(%r13),%eax
   2a74e:	83 e8 04             	sub    $0x4,%eax
   2a751:	48 98                	cltq
   2a753:	49 01 c7             	add    %rax,%r15
   2a756:	41 8b 84 24 a8 01 00 	mov    0x1a8(%r12),%eax
   2a75d:	00 
   2a75e:	83 e8 01             	sub    $0x1,%eax
   2a761:	41 89 84 24 a8 01 00 	mov    %eax,0x1a8(%r12)
   2a768:	00 
   2a769:	85 c0                	test   %eax,%eax
   2a76b:	0f 8e 82 37 00 00    	jle    2def3 <JS_CallInternal+0x8f63>
   2a771:	41 0f b6 07          	movzbl (%r15),%eax
   2a775:	4d 8d 6f 01          	lea    0x1(%r15),%r13
   2a779:	49 89 c2             	mov    %rax,%r10
   2a77c:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2a780:	f3 0f 1e fa          	endbr64
   2a784:	41 0f b7 4d 00       	movzwl 0x0(%r13),%ecx
   2a789:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2a790:	4d 8d 7d 02          	lea    0x2(%r13),%r15
   2a794:	48 8b 04 c8          	mov    (%rax,%rcx,8),%rax
   2a798:	48 8b 50 18          	mov    0x18(%rax),%rdx
   2a79c:	48 8b 42 08          	mov    0x8(%rdx),%rax
   2a7a0:	83 f8 04             	cmp    $0x4,%eax
   2a7a3:	0f 84 9b 37 00 00    	je     2df44 <JS_CallInternal+0x8fb4>
   2a7a9:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2a7ae:	48 8b 0a             	mov    (%rdx),%rcx
   2a7b1:	0f 11 02             	movups %xmm0,(%rdx)
   2a7b4:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2a7b7:	76 11                	jbe    2a7ca <JS_CallInternal+0x583a>
   2a7b9:	8b 51 fc             	mov    -0x4(%rcx),%edx
   2a7bc:	83 ea 01             	sub    $0x1,%edx
   2a7bf:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2a7c2:	85 d2                	test   %edx,%edx
   2a7c4:	0f 8e 79 2b 00 00    	jle    2d343 <JS_CallInternal+0x83b3>
   2a7ca:	41 0f b6 45 02       	movzbl 0x2(%r13),%eax
   2a7cf:	48 83 eb 10          	sub    $0x10,%rbx
   2a7d3:	49 83 c5 03          	add    $0x3,%r13
   2a7d7:	49 89 c2             	mov    %rax,%r10
   2a7da:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a7de:	ff e0                	jmp    *%rax
   2a7e0:	f3 0f 1e fa          	endbr64
   2a7e4:	49 8b b4 24 90 01 00 	mov    0x190(%r12),%rsi
   2a7eb:	00 
   2a7ec:	41 8b 4d 00          	mov    0x0(%r13),%ecx
   2a7f0:	4d 8d 7d 04          	lea    0x4(%r13),%r15
   2a7f4:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2a7fb:	48 8b 7e 18          	mov    0x18(%rsi),%rdi
   2a7ff:	4c 89 78 30          	mov    %r15,0x30(%rax)
   2a803:	89 c8                	mov    %ecx,%eax
   2a805:	8b 57 18             	mov    0x18(%rdi),%edx
   2a808:	21 d0                	and    %edx,%eax
   2a80a:	8b 44 87 38          	mov    0x38(%rdi,%rax,4),%eax
   2a80e:	48 85 c0             	test   %rax,%rax
   2a811:	0f 84 02 23 00 00    	je     2cb19 <JS_CallInternal+0x7b89>
   2a817:	4c 8d 04 95 3c 00 00 	lea    0x3c(,%rdx,4),%r8
   2a81e:	00 
   2a81f:	48 83 e8 01          	sub    $0x1,%rax
   2a823:	49 8d 14 c0          	lea    (%r8,%rax,8),%rdx
   2a827:	48 01 fa             	add    %rdi,%rdx
   2a82a:	39 4a 04             	cmp    %ecx,0x4(%rdx)
   2a82d:	0f 85 d9 22 00 00    	jne    2cb0c <JS_CallInternal+0x7b7c>
   2a833:	48 c1 e0 04          	shl    $0x4,%rax
   2a837:	48 03 46 20          	add    0x20(%rsi),%rax
   2a83b:	48 8b 00             	mov    (%rax),%rax
   2a83e:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a842:	83 78 08 04          	cmpl   $0x4,0x8(%rax)
   2a846:	0f 84 d3 32 00 00    	je     2db1f <JS_CallInternal+0x8b8f>
   2a84c:	f6 42 03 08          	testb  $0x8,0x3(%rdx)
   2a850:	0f 84 af 3c 00 00    	je     2e505 <JS_CallInternal+0x9575>
   2a856:	49 8b 84 24 98 01 00 	mov    0x198(%r12),%rax
   2a85d:	00 
   2a85e:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2a861:	76 04                	jbe    2a867 <JS_CallInternal+0x58d7>
   2a863:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2a867:	48 89 33             	mov    %rsi,(%rbx)
   2a86a:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2a86e:	31 d2                	xor    %edx,%edx
   2a870:	89 ce                	mov    %ecx,%esi
   2a872:	4c 89 e7             	mov    %r12,%rdi
   2a875:	48 83 c3 20          	add    $0x20,%rbx
   2a879:	e8 02 0b 01 00       	call   3b380 <__JS_AtomToValue>
   2a87e:	49 83 c5 05          	add    $0x5,%r13
   2a882:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2a886:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2a88a:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2a88f:	49 89 c2             	mov    %rax,%r10
   2a892:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a896:	ff e0                	jmp    *%rax
   2a898:	f3 0f 1e fa          	endbr64
   2a89c:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2a8a0:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2a8a4:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   2a8a7:	76 04                	jbe    2a8ad <JS_CallInternal+0x591d>
   2a8a9:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2a8ad:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2a8b4:	48 8b 40 08          	mov    0x8(%rax),%rax
   2a8b8:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a8bc:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2a8c0:	48 8b 38             	mov    (%rax),%rdi
   2a8c3:	48 89 48 08          	mov    %rcx,0x8(%rax)
   2a8c7:	48 89 30             	mov    %rsi,(%rax)
   2a8ca:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a8cd:	76 11                	jbe    2a8e0 <JS_CallInternal+0x5950>
   2a8cf:	8b 47 fc             	mov    -0x4(%rdi),%eax
   2a8d2:	83 e8 01             	sub    $0x1,%eax
   2a8d5:	89 47 fc             	mov    %eax,-0x4(%rdi)
   2a8d8:	85 c0                	test   %eax,%eax
   2a8da:	0f 8e fc 24 00 00    	jle    2cddc <JS_CallInternal+0x7e4c>
   2a8e0:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2a8e5:	49 83 c5 01          	add    $0x1,%r13
   2a8e9:	49 89 c2             	mov    %rax,%r10
   2a8ec:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a8f0:	ff e0                	jmp    *%rax
   2a8f2:	f3 0f 1e fa          	endbr64
   2a8f6:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2a8fd:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2a902:	48 83 eb 10          	sub    $0x10,%rbx
   2a906:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a90a:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a90e:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2a912:	48 8b 08             	mov    (%rax),%rcx
   2a915:	0f 11 00             	movups %xmm0,(%rax)
   2a918:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a91b:	76 11                	jbe    2a92e <JS_CallInternal+0x599e>
   2a91d:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2a920:	83 e8 01             	sub    $0x1,%eax
   2a923:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2a926:	85 c0                	test   %eax,%eax
   2a928:	0f 8e f6 24 00 00    	jle    2ce24 <JS_CallInternal+0x7e94>
   2a92e:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2a933:	49 83 c5 01          	add    $0x1,%r13
   2a937:	49 89 c2             	mov    %rax,%r10
   2a93a:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a93e:	ff e0                	jmp    *%rax
   2a940:	f3 0f 1e fa          	endbr64
   2a944:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
   2a949:	48 8b 8d 88 fe ff ff 	mov    -0x178(%rbp),%rcx
   2a950:	48 8b 04 c1          	mov    (%rcx,%rax,8),%rax
   2a954:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a958:	48 8b 10             	mov    (%rax),%rdx
   2a95b:	48 8b 40 08          	mov    0x8(%rax),%rax
   2a95f:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2a962:	76 04                	jbe    2a968 <JS_CallInternal+0x59d8>
   2a964:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2a968:	48 89 13             	mov    %rdx,(%rbx)
   2a96b:	49 83 c5 03          	add    $0x3,%r13
   2a96f:	48 83 c3 10          	add    $0x10,%rbx
   2a973:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2a977:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2a97c:	49 89 c2             	mov    %rax,%r10
   2a97f:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a983:	ff e0                	jmp    *%rax
   2a985:	f3 0f 1e fa          	endbr64
   2a989:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2a98d:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2a991:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   2a994:	76 04                	jbe    2a99a <JS_CallInternal+0x5a0a>
   2a996:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2a99a:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2a9a1:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a9a5:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a9a9:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2a9ad:	48 8b 38             	mov    (%rax),%rdi
   2a9b0:	48 89 48 08          	mov    %rcx,0x8(%rax)
   2a9b4:	48 89 30             	mov    %rsi,(%rax)
   2a9b7:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a9ba:	76 11                	jbe    2a9cd <JS_CallInternal+0x5a3d>
   2a9bc:	8b 47 fc             	mov    -0x4(%rdi),%eax
   2a9bf:	83 e8 01             	sub    $0x1,%eax
   2a9c2:	89 47 fc             	mov    %eax,-0x4(%rdi)
   2a9c5:	85 c0                	test   %eax,%eax
   2a9c7:	0f 8e 21 24 00 00    	jle    2cdee <JS_CallInternal+0x7e5e>
   2a9cd:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2a9d2:	49 83 c5 01          	add    $0x1,%r13
   2a9d6:	49 89 c2             	mov    %rax,%r10
   2a9d9:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a9dd:	ff e0                	jmp    *%rax
   2a9df:	f3 0f 1e fa          	endbr64
   2a9e3:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
   2a9e8:	48 8b 8d 88 fe ff ff 	mov    -0x178(%rbp),%rcx
   2a9ef:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2a9f4:	48 8b 04 c1          	mov    (%rcx,%rax,8),%rax
   2a9f8:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a9fc:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2aa00:	48 8b 08             	mov    (%rax),%rcx
   2aa03:	0f 11 00             	movups %xmm0,(%rax)
   2aa06:	83 fa f6             	cmp    $0xfffffff6,%edx
   2aa09:	76 11                	jbe    2aa1c <JS_CallInternal+0x5a8c>
   2aa0b:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2aa0e:	83 e8 01             	sub    $0x1,%eax
   2aa11:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2aa14:	85 c0                	test   %eax,%eax
   2aa16:	0f 8e 1a 24 00 00    	jle    2ce36 <JS_CallInternal+0x7ea6>
   2aa1c:	41 0f b6 45 02       	movzbl 0x2(%r13),%eax
   2aa21:	48 83 eb 10          	sub    $0x10,%rbx
   2aa25:	49 83 c5 03          	add    $0x3,%r13
   2aa29:	49 89 c2             	mov    %rax,%r10
   2aa2c:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2aa30:	ff e0                	jmp    *%rax
   2aa32:	f3 0f 1e fa          	endbr64
   2aa36:	41 0f b7 55 00       	movzwl 0x0(%r13),%edx
   2aa3b:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2aa42:	4d 8d 7d 02          	lea    0x2(%r13),%r15
   2aa46:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   2aa4a:	48 8b 40 18          	mov    0x18(%rax),%rax
   2aa4e:	83 78 08 04          	cmpl   $0x4,0x8(%rax)
   2aa52:	0f 85 b8 34 00 00    	jne    2df10 <JS_CallInternal+0x8f80>
   2aa58:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2aa5d:	49 83 c5 03          	add    $0x3,%r13
   2aa61:	48 83 eb 10          	sub    $0x10,%rbx
   2aa65:	0f 11 00             	movups %xmm0,(%rax)
   2aa68:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2aa6d:	49 89 c2             	mov    %rax,%r10
   2aa70:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2aa74:	ff e0                	jmp    *%rax
   2aa76:	f3 0f 1e fa          	endbr64
   2aa7a:	41 0f b7 4d 00       	movzwl 0x0(%r13),%ecx
   2aa7f:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2aa86:	4d 8d 7d 02          	lea    0x2(%r13),%r15
   2aa8a:	48 8b 04 c8          	mov    (%rax,%rcx,8),%rax
   2aa8e:	48 8b 40 18          	mov    0x18(%rax),%rax
   2aa92:	48 8b 10             	mov    (%rax),%rdx
   2aa95:	48 8b 40 08          	mov    0x8(%rax),%rax
   2aa99:	83 f8 04             	cmp    $0x4,%eax
   2aa9c:	0f 84 f1 37 00 00    	je     2e293 <JS_CallInternal+0x9303>
   2aaa2:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2aaa5:	76 04                	jbe    2aaab <JS_CallInternal+0x5b1b>
   2aaa7:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2aaab:	48 89 13             	mov    %rdx,(%rbx)
   2aaae:	49 83 c5 03          	add    $0x3,%r13
   2aab2:	48 83 c3 10          	add    $0x10,%rbx
   2aab6:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2aaba:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2aabf:	49 89 c2             	mov    %rax,%r10
   2aac2:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2aac6:	ff e0                	jmp    *%rax
   2aac8:	f3 0f 1e fa          	endbr64
   2aacc:	45 8b 4d 00          	mov    0x0(%r13),%r9d
   2aad0:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2aad4:	4d 8d 7d 04          	lea    0x4(%r13),%r15
   2aad8:	4c 8b 53 f0          	mov    -0x10(%rbx),%r10
   2aadc:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2aae3:	4d 01 e9             	add    %r13,%r9
   2aae6:	83 f8 ff             	cmp    $0xffffffff,%eax
   2aae9:	0f 85 b7 35 00 00    	jne    2e0a6 <JS_CallInternal+0x9116>
   2aaef:	41 0f b7 42 12       	movzwl 0x12(%r10),%eax
   2aaf4:	4d 8b 5a 18          	mov    0x18(%r10),%r11
   2aaf8:	66 89 85 10 fe ff ff 	mov    %ax,-0x1f0(%rbp)
   2aaff:	66 83 f8 01          	cmp    $0x1,%ax
   2ab03:	0f 84 1e 1a 00 00    	je     2c527 <JS_CallInternal+0x7597>
   2ab09:	41 8b 49 14          	mov    0x14(%r9),%ecx
   2ab0d:	4c 89 da             	mov    %r11,%rdx
   2ab10:	4c 89 d7             	mov    %r10,%rdi
   2ab13:	66 90                	xchg   %ax,%ax
   2ab15:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2ab1c:	00 00 00 00 
   2ab20:	8b 72 18             	mov    0x18(%rdx),%esi
   2ab23:	89 f0                	mov    %esi,%eax
   2ab25:	21 c8                	and    %ecx,%eax
   2ab27:	8b 44 82 38          	mov    0x38(%rdx,%rax,4),%eax
   2ab2b:	48 85 c0             	test   %rax,%rax
   2ab2e:	0f 84 a1 07 00 00    	je     2b2d5 <JS_CallInternal+0x6345>
   2ab34:	4c 8d 04 b5 3c 00 00 	lea    0x3c(,%rsi,4),%r8
   2ab3b:	00 
   2ab3c:	48 83 e8 01          	sub    $0x1,%rax
   2ab40:	49 8d 34 c0          	lea    (%r8,%rax,8),%rsi
   2ab44:	48 01 d6             	add    %rdx,%rsi
   2ab47:	39 4e 04             	cmp    %ecx,0x4(%rsi)
   2ab4a:	0f 85 78 07 00 00    	jne    2b2c8 <JS_CallInternal+0x6338>
   2ab50:	4c 8b 47 20          	mov    0x20(%rdi),%r8
   2ab54:	80 7e 03 3f          	cmpb   $0x3f,0x3(%rsi)
   2ab58:	0f 87 98 0d 00 00    	ja     2b8f6 <JS_CallInternal+0x6966>
   2ab5e:	48 c1 e0 04          	shl    $0x4,%rax
   2ab62:	49 01 c0             	add    %rax,%r8
   2ab65:	48 89 c6             	mov    %rax,%rsi
   2ab68:	49 8b 40 08          	mov    0x8(%r8),%rax
   2ab6c:	49 8b 08             	mov    (%r8),%rcx
   2ab6f:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2ab72:	76 04                	jbe    2ab78 <JS_CallInternal+0x5be8>
   2ab74:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   2ab78:	49 89 cf             	mov    %rcx,%r15
   2ab7b:	49 39 fa             	cmp    %rdi,%r10
   2ab7e:	0f 84 ac 3f 00 00    	je     2eb30 <JS_CallInternal+0x9ba0>
   2ab84:	49 39 7b 30          	cmp    %rdi,0x30(%r11)
   2ab88:	0f 84 d6 3e 00 00    	je     2ea64 <JS_CallInternal+0x9ad4>
   2ab8e:	4c 89 3b             	mov    %r15,(%rbx)
   2ab91:	49 83 c5 05          	add    $0x5,%r13
   2ab95:	48 83 c3 10          	add    $0x10,%rbx
   2ab99:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2ab9d:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2aba2:	49 89 c2             	mov    %rax,%r10
   2aba5:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2aba9:	ff e0                	jmp    *%rax
   2abab:	f3 0f 1e fa          	endbr64
   2abaf:	41 8b 45 00          	mov    0x0(%r13),%eax
   2abb3:	4c 8b 5b f8          	mov    -0x8(%rbx),%r11
   2abb7:	4d 8d 7d 04          	lea    0x4(%r13),%r15
   2abbb:	4d 8d 54 05 00       	lea    0x0(%r13,%rax,1),%r10
   2abc0:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2abc4:	41 83 fb ff          	cmp    $0xffffffff,%r11d
   2abc8:	0f 85 76 2f 00 00    	jne    2db44 <JS_CallInternal+0x8bb4>
   2abce:	48 8b 78 18          	mov    0x18(%rax),%rdi
   2abd2:	66 83 78 12 01       	cmpw   $0x1,0x12(%rax)
   2abd7:	0f 84 c3 19 00 00    	je     2c5a0 <JS_CallInternal+0x7610>
   2abdd:	41 8b 4a 14          	mov    0x14(%r10),%ecx
   2abe1:	49 89 c0             	mov    %rax,%r8
   2abe4:	90                   	nop
   2abe5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2abec:	00 00 00 00 
   2abf0:	8b 77 18             	mov    0x18(%rdi),%esi
   2abf3:	89 f2                	mov    %esi,%edx
   2abf5:	21 ca                	and    %ecx,%edx
   2abf7:	8b 54 97 38          	mov    0x38(%rdi,%rdx,4),%edx
   2abfb:	48 85 d2             	test   %rdx,%rdx
   2abfe:	0f 84 ff 06 00 00    	je     2b303 <JS_CallInternal+0x6373>
   2ac04:	4c 8d 0c b5 3c 00 00 	lea    0x3c(,%rsi,4),%r9
   2ac0b:	00 
   2ac0c:	48 83 ea 01          	sub    $0x1,%rdx
   2ac10:	49 8d 34 d1          	lea    (%r9,%rdx,8),%rsi
   2ac14:	48 01 fe             	add    %rdi,%rsi
   2ac17:	39 4e 04             	cmp    %ecx,0x4(%rsi)
   2ac1a:	0f 85 d5 06 00 00    	jne    2b2f5 <JS_CallInternal+0x6365>
   2ac20:	4d 8b 48 20          	mov    0x20(%r8),%r9
   2ac24:	80 7e 03 3f          	cmpb   $0x3f,0x3(%rsi)
   2ac28:	0f 87 19 0d 00 00    	ja     2b947 <JS_CallInternal+0x69b7>
   2ac2e:	48 c1 e2 04          	shl    $0x4,%rdx
   2ac32:	49 01 d1             	add    %rdx,%r9
   2ac35:	49 8b 49 08          	mov    0x8(%r9),%rcx
   2ac39:	49 8b 31             	mov    (%r9),%rsi
   2ac3c:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   2ac3f:	76 04                	jbe    2ac45 <JS_CallInternal+0x5cb5>
   2ac41:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2ac45:	49 89 f7             	mov    %rsi,%r15
   2ac48:	4c 39 c0             	cmp    %r8,%rax
   2ac4b:	0f 84 1d 3b 00 00    	je     2e76e <JS_CallInternal+0x97de>
   2ac51:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2ac55:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2ac58:	76 15                	jbe    2ac6f <JS_CallInternal+0x5cdf>
   2ac5a:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2ac5e:	8b 56 fc             	mov    -0x4(%rsi),%edx
   2ac61:	83 ea 01             	sub    $0x1,%edx
   2ac64:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2ac67:	85 d2                	test   %edx,%edx
   2ac69:	0f 8e d9 21 00 00    	jle    2ce48 <JS_CallInternal+0x7eb8>
   2ac6f:	4c 89 7b f0          	mov    %r15,-0x10(%rbx)
   2ac73:	49 83 c5 05          	add    $0x5,%r13
   2ac77:	48 89 4b f8          	mov    %rcx,-0x8(%rbx)
   2ac7b:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2ac80:	49 89 c2             	mov    %rax,%r10
   2ac83:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2ac87:	ff e0                	jmp    *%rax
   2ac89:	f3 0f 1e fa          	endbr64
   2ac8d:	49 63 45 00          	movslq 0x0(%r13),%rax
   2ac91:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   2ac98:	49 8d 55 04          	lea    0x4(%r13),%rdx
   2ac9c:	48 83 c3 10          	add    $0x10,%rbx
   2aca0:	2b 51 18             	sub    0x18(%rcx),%edx
   2aca3:	4c 01 e8             	add    %r13,%rax
   2aca6:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   2acad:	00 
   2acae:	48 89 53 f0          	mov    %rdx,-0x10(%rbx)
   2acb2:	4c 8d 68 01          	lea    0x1(%rax),%r13
   2acb6:	0f b6 00             	movzbl (%rax),%eax
   2acb9:	49 89 c2             	mov    %rax,%r10
   2acbc:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2acc0:	f3 0f 1e fa          	endbr64
   2acc4:	49 63 45 00          	movslq 0x0(%r13),%rax
   2acc8:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   2accf:	48 83 c3 10          	add    $0x10,%rbx
   2acd3:	4c 01 e8             	add    %r13,%rax
   2acd6:	2b 41 18             	sub    0x18(%rcx),%eax
   2acd9:	48 c7 43 f8 05 00 00 	movq   $0x5,-0x8(%rbx)
   2ace0:	00 
   2ace1:	49 83 c5 05          	add    $0x5,%r13
   2ace5:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2ace9:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2acee:	49 89 c2             	mov    %rax,%r10
   2acf1:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2acf5:	ff e0                	jmp    *%rax
   2acf7:	f3 0f 1e fa          	endbr64
   2acfb:	44 8b 5b f8          	mov    -0x8(%rbx),%r11d
   2acff:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2ad03:	45 85 db             	test   %r11d,%r11d
   2ad06:	0f 85 d8 1c 00 00    	jne    2c9e4 <JS_CallInternal+0x7a54>
   2ad0c:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   2ad13:	3b 41 20             	cmp    0x20(%rcx),%eax
   2ad16:	0f 83 c8 1c 00 00    	jae    2c9e4 <JS_CallInternal+0x7a54>
   2ad1c:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   2ad23:	89 c0                	mov    %eax,%eax
   2ad25:	48 83 eb 10          	sub    $0x10,%rbx
   2ad29:	48 03 41 18          	add    0x18(%rcx),%rax
   2ad2d:	4c 8d 68 01          	lea    0x1(%rax),%r13
   2ad31:	0f b6 00             	movzbl (%rax),%eax
   2ad34:	49 89 c2             	mov    %rax,%r10
   2ad37:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2ad3b:	f3 0f 1e fa          	endbr64
   2ad3f:	4c 8d 7b f0          	lea    -0x10(%rbx),%r15
   2ad43:	48 8b 4b c0          	mov    -0x40(%rbx),%rcx
   2ad47:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   2ad4b:	4c 89 e7             	mov    %r12,%rdi
   2ad4e:	48 8b 53 d8          	mov    -0x28(%rbx),%rdx
   2ad52:	4c 8b 43 c8          	mov    -0x38(%rbx),%r8
   2ad56:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   2ad5c:	48 c7 85 c0 fd ff ff 	movq   $0x0,-0x240(%rbp)
   2ad63:	00 00 00 00 
   2ad67:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2ad6e:	48 c7 85 c8 fd ff ff 	movq   $0x3,-0x238(%rbp)
   2ad75:	03 00 00 00 
   2ad79:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2ad7d:	6a 02                	push   $0x2
   2ad7f:	41 57                	push   %r15
   2ad81:	ff b5 c8 fd ff ff    	push   -0x238(%rbp)
   2ad87:	ff b5 c0 fd ff ff    	push   -0x240(%rbp)
   2ad8d:	e8 fe a1 ff ff       	call   24f90 <JS_CallInternal>
   2ad92:	48 83 c4 20          	add    $0x20,%rsp
   2ad96:	48 89 c1             	mov    %rax,%rcx
   2ad99:	48 89 d0             	mov    %rdx,%rax
   2ad9c:	83 fa 06             	cmp    $0x6,%edx
   2ad9f:	0f 84 b8 28 00 00    	je     2d65d <JS_CallInternal+0x86cd>
   2ada5:	49 8b 77 08          	mov    0x8(%r15),%rsi
   2ada9:	83 fe f6             	cmp    $0xfffffff6,%esi
   2adac:	76 15                	jbe    2adc3 <JS_CallInternal+0x5e33>
   2adae:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   2adb2:	8b 57 fc             	mov    -0x4(%rdi),%edx
   2adb5:	83 ea 01             	sub    $0x1,%edx
   2adb8:	89 57 fc             	mov    %edx,-0x4(%rdi)
   2adbb:	85 d2                	test   %edx,%edx
   2adbd:	0f 8e f6 23 00 00    	jle    2d1b9 <JS_CallInternal+0x8229>
   2adc3:	48 89 4b f0          	mov    %rcx,-0x10(%rbx)
   2adc7:	49 83 c5 01          	add    $0x1,%r13
   2adcb:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2adcf:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2add4:	49 89 c2             	mov    %rax,%r10
   2add7:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2addb:	ff e0                	jmp    *%rax
   2addd:	f3 0f 1e fa          	endbr64
   2ade1:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2ade8:	4c 8b 7b f8          	mov    -0x8(%rbx),%r15
   2adec:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2adf0:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2adf4:	41 83 ff ff          	cmp    $0xffffffff,%r15d
   2adf8:	0f 85 69 44 00 00    	jne    2f267 <JS_CallInternal+0xa2d7>
   2adfe:	48 8d 8d dc fe ff ff 	lea    -0x124(%rbp),%rcx
   2ae05:	4c 89 fa             	mov    %r15,%rdx
   2ae08:	48 89 c6             	mov    %rax,%rsi
   2ae0b:	4c 89 e7             	mov    %r12,%rdi
   2ae0e:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2ae15:	e8 46 b5 05 00       	call   86360 <JS_IteratorGetCompleteValue>
   2ae1a:	48 89 c1             	mov    %rax,%rcx
   2ae1d:	48 89 d0             	mov    %rdx,%rax
   2ae20:	83 fa 06             	cmp    $0x6,%edx
   2ae23:	0f 84 c0 29 00 00    	je     2d7e9 <JS_CallInternal+0x8859>
   2ae29:	48 8b b5 30 fe ff ff 	mov    -0x1d0(%rbp),%rsi
   2ae30:	8b 56 fc             	mov    -0x4(%rsi),%edx
   2ae33:	83 ea 01             	sub    $0x1,%edx
   2ae36:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2ae39:	85 d2                	test   %edx,%edx
   2ae3b:	0f 8e f7 2a 00 00    	jle    2d938 <JS_CallInternal+0x89a8>
   2ae41:	44 8b 8d dc fe ff ff 	mov    -0x124(%rbp),%r9d
   2ae48:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2ae4c:	31 c0                	xor    %eax,%eax
   2ae4e:	48 c7 43 e0 00 00 00 	movq   $0x0,-0x20(%rbx)
   2ae55:	00 
   2ae56:	45 85 c9             	test   %r9d,%r9d
   2ae59:	48 c7 43 e8 05 00 00 	movq   $0x5,-0x18(%rbx)
   2ae60:	00 
   2ae61:	0f 95 c0             	setne  %al
   2ae64:	48 89 4b f0          	mov    %rcx,-0x10(%rbx)
   2ae68:	49 83 c5 01          	add    $0x1,%r13
   2ae6c:	48 83 c3 10          	add    $0x10,%rbx
   2ae70:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2ae74:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   2ae7b:	00 
   2ae7c:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2ae81:	49 89 c2             	mov    %rax,%r10
   2ae84:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2ae88:	ff e0                	jmp    *%rax
   2ae8a:	f3 0f 1e fa          	endbr64
   2ae8e:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2ae95:	ba 01 00 00 00       	mov    $0x1,%edx
   2ae9a:	48 89 de             	mov    %rbx,%rsi
   2ae9d:	4c 89 e7             	mov    %r12,%rdi
   2aea0:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2aea4:	e8 c7 42 07 00       	call   9f170 <js_for_of_start>
   2aea9:	85 c0                	test   %eax,%eax
   2aeab:	0f 85 cf 43 00 00    	jne    2f280 <JS_CallInternal+0xa2f0>
   2aeb1:	48 c7 43 10 00 00 00 	movq   $0x0,0x10(%rbx)
   2aeb8:	00 
   2aeb9:	49 83 c5 01          	add    $0x1,%r13
   2aebd:	48 83 c3 20          	add    $0x20,%rbx
   2aec1:	48 c7 43 f8 05 00 00 	movq   $0x5,-0x8(%rbx)
   2aec8:	00 
   2aec9:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2aece:	49 89 c2             	mov    %rax,%r10
   2aed1:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2aed5:	ff e0                	jmp    *%rax
   2aed7:	f3 0f 1e fa          	endbr64
   2aedb:	83 7b f8 ff          	cmpl   $0xffffffff,-0x8(%rbx)
   2aedf:	0f 85 eb 28 00 00    	jne    2d7d0 <JS_CallInternal+0x8840>
   2aee5:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2aeea:	49 83 c5 01          	add    $0x1,%r13
   2aeee:	49 89 c2             	mov    %rax,%r10
   2aef1:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2aef5:	ff e0                	jmp    *%rax
   2aef7:	f3 0f 1e fa          	endbr64
   2aefb:	45 0f b6 55 00       	movzbl 0x0(%r13),%r10d
   2af00:	4d 8d 7d 01          	lea    0x1(%r13),%r15
   2af04:	48 8b 73 c0          	mov    -0x40(%rbx),%rsi
   2af08:	4c 89 e7             	mov    %r12,%rdi
   2af0b:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2af12:	48 8b 53 c8          	mov    -0x38(%rbx),%rdx
   2af16:	44 88 95 30 fe ff ff 	mov    %r10b,-0x1d0(%rbp)
   2af1d:	49 89 f0             	mov    %rsi,%r8
   2af20:	4c 89 78 30          	mov    %r15,0x30(%rax)
   2af24:	44 89 d0             	mov    %r10d,%eax
   2af27:	49 89 d1             	mov    %rdx,%r9
   2af2a:	83 e0 01             	and    $0x1,%eax
   2af2d:	3c 01                	cmp    $0x1,%al
   2af2f:	19 c9                	sbb    %ecx,%ecx
   2af31:	48 83 ec 08          	sub    $0x8,%rsp
   2af35:	6a 00                	push   $0x0
   2af37:	83 e1 ef             	and    $0xffffffef,%ecx
   2af3a:	83 c1 17             	add    $0x17,%ecx
   2af3d:	e8 3e 49 00 00       	call   2f880 <JS_GetPropertyInternal>
   2af42:	5f                   	pop    %rdi
   2af43:	41 58                	pop    %r8
   2af45:	48 89 c6             	mov    %rax,%rsi
   2af48:	83 fa 06             	cmp    $0x6,%edx
   2af4b:	0f 84 6f a7 ff ff    	je     256c0 <JS_CallInternal+0x730>
   2af51:	8d 4a fe             	lea    -0x2(%rdx),%ecx
   2af54:	b8 01 00 00 00       	mov    $0x1,%eax
   2af59:	83 f9 01             	cmp    $0x1,%ecx
   2af5c:	0f 87 1e 0e 00 00    	ja     2bd80 <JS_CallInternal+0x6df0>
   2af62:	48 89 03             	mov    %rax,(%rbx)
   2af65:	49 83 c5 02          	add    $0x2,%r13
   2af69:	48 83 c3 10          	add    $0x10,%rbx
   2af6d:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   2af74:	00 
   2af75:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2af7a:	49 89 c2             	mov    %rax,%r10
   2af7d:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2af81:	ff e0                	jmp    *%rax
   2af83:	f3 0f 1e fa          	endbr64
   2af87:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2af8b:	48 8d 4b f0          	lea    -0x10(%rbx),%rcx
   2af8f:	48 8b 5b f8          	mov    -0x8(%rbx),%rbx
   2af93:	48 39 8d 48 fe ff ff 	cmp    %rcx,-0x1b8(%rbp)
   2af9a:	0f 83 5f 05 00 00    	jae    2b4ff <JS_CallInternal+0x656f>
   2afa0:	48 89 9d 10 fe ff ff 	mov    %rbx,-0x1f0(%rbp)
   2afa7:	49 89 cf             	mov    %rcx,%r15
   2afaa:	4c 89 e3             	mov    %r12,%rbx
   2afad:	4c 8b a5 48 fe ff ff 	mov    -0x1b8(%rbp),%r12
   2afb4:	4c 89 85 30 fe ff ff 	mov    %r8,-0x1d0(%rbp)
   2afbb:	eb 0c                	jmp    2afc9 <JS_CallInternal+0x6039>
   2afbd:	0f 1f 00             	nopl   (%rax)
   2afc0:	4d 39 fc             	cmp    %r15,%r12
   2afc3:	0f 83 22 05 00 00    	jae    2b4eb <JS_CallInternal+0x655b>
   2afc9:	41 83 7f f8 05       	cmpl   $0x5,-0x8(%r15)
   2afce:	0f 84 17 05 00 00    	je     2b4eb <JS_CallInternal+0x655b>
   2afd4:	49 8b 47 f8          	mov    -0x8(%r15),%rax
   2afd8:	49 83 ef 10          	sub    $0x10,%r15
   2afdc:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2afdf:	76 df                	jbe    2afc0 <JS_CallInternal+0x6030>
   2afe1:	49 8b 37             	mov    (%r15),%rsi
   2afe4:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   2afe7:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2afea:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2afed:	85 d2                	test   %edx,%edx
   2afef:	7f cf                	jg     2afc0 <JS_CallInternal+0x6030>
   2aff1:	48 8b 7b 10          	mov    0x10(%rbx),%rdi
   2aff5:	48 89 c2             	mov    %rax,%rdx
   2aff8:	e8 d3 34 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2affd:	eb c1                	jmp    2afc0 <JS_CallInternal+0x6030>
   2afff:	f3 0f 1e fa          	endbr64
   2b003:	4c 8b 5b e8          	mov    -0x18(%rbx),%r11
   2b007:	41 8b 4d 00          	mov    0x0(%r13),%ecx
   2b00b:	4d 8d 7d 04          	lea    0x4(%r13),%r15
   2b00f:	4c 8b 53 e0          	mov    -0x20(%rbx),%r10
   2b013:	41 83 fb ff          	cmp    $0xffffffff,%r11d
   2b017:	0f 85 b3 11 00 00    	jne    2c1d0 <JS_CallInternal+0x7240>
   2b01d:	49 8b 72 18          	mov    0x18(%r10),%rsi
   2b021:	8b 46 18             	mov    0x18(%rsi),%eax
   2b024:	89 c2                	mov    %eax,%edx
   2b026:	21 ca                	and    %ecx,%edx
   2b028:	8b 54 96 38          	mov    0x38(%rsi,%rdx,4),%edx
   2b02c:	48 85 d2             	test   %rdx,%rdx
   2b02f:	0f 84 9b 11 00 00    	je     2c1d0 <JS_CallInternal+0x7240>
   2b035:	48 8d 3c 85 3c 00 00 	lea    0x3c(,%rax,4),%rdi
   2b03c:	00 
   2b03d:	48 83 ea 01          	sub    $0x1,%rdx
   2b041:	48 8d 04 d7          	lea    (%rdi,%rdx,8),%rax
   2b045:	48 01 f0             	add    %rsi,%rax
   2b048:	3b 48 04             	cmp    0x4(%rax),%ecx
   2b04b:	0f 85 71 11 00 00    	jne    2c1c2 <JS_CallInternal+0x7232>
   2b051:	0f b6 40 03          	movzbl 0x3(%rax),%eax
   2b055:	49 8b 72 20          	mov    0x20(%r10),%rsi
   2b059:	c0 e8 02             	shr    $0x2,%al
   2b05c:	83 e0 3a             	and    $0x3a,%eax
   2b05f:	3c 02                	cmp    $0x2,%al
   2b061:	0f 85 69 11 00 00    	jne    2c1d0 <JS_CallInternal+0x7240>
   2b067:	48 c1 e2 04          	shl    $0x4,%rdx
   2b06b:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2b070:	48 8d 04 16          	lea    (%rsi,%rdx,1),%rax
   2b074:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2b078:	48 8b 08             	mov    (%rax),%rcx
   2b07b:	0f 11 00             	movups %xmm0,(%rax)
   2b07e:	83 fa f6             	cmp    $0xfffffff6,%edx
   2b081:	76 11                	jbe    2b094 <JS_CallInternal+0x6104>
   2b083:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2b086:	83 e8 01             	sub    $0x1,%eax
   2b089:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2b08c:	85 c0                	test   %eax,%eax
   2b08e:	0f 8e a8 33 00 00    	jle    2e43c <JS_CallInternal+0x94ac>
   2b094:	41 83 fb f6          	cmp    $0xfffffff6,%r11d
   2b098:	76 13                	jbe    2b0ad <JS_CallInternal+0x611d>
   2b09a:	41 8b 42 fc          	mov    -0x4(%r10),%eax
   2b09e:	83 e8 01             	sub    $0x1,%eax
   2b0a1:	41 89 42 fc          	mov    %eax,-0x4(%r10)
   2b0a5:	85 c0                	test   %eax,%eax
   2b0a7:	0f 8e 43 34 00 00    	jle    2e4f0 <JS_CallInternal+0x9560>
   2b0ad:	48 83 eb 20          	sub    $0x20,%rbx
   2b0b1:	41 0f b6 45 04       	movzbl 0x4(%r13),%eax
   2b0b6:	49 83 c5 05          	add    $0x5,%r13
   2b0ba:	49 89 c2             	mov    %rax,%r10
   2b0bd:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b0c1:	ff e0                	jmp    *%rax
   2b0c3:	f3 0f 1e fa          	endbr64
   2b0c7:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   2b0cb:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   2b0cf:	83 fe ff             	cmp    $0xffffffff,%esi
   2b0d2:	0f 85 ce 06 00 00    	jne    2b7a6 <JS_CallInternal+0x6816>
   2b0d8:	48 89 f9             	mov    %rdi,%rcx
   2b0db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2b0e0:	4c 8b 41 18          	mov    0x18(%rcx),%r8
   2b0e4:	41 8b 50 18          	mov    0x18(%r8),%edx
   2b0e8:	89 d0                	mov    %edx,%eax
   2b0ea:	83 e0 32             	and    $0x32,%eax
   2b0ed:	41 8b 44 80 38       	mov    0x38(%r8,%rax,4),%eax
   2b0f2:	48 85 c0             	test   %rax,%rax
   2b0f5:	0f 84 46 01 00 00    	je     2b241 <JS_CallInternal+0x62b1>
   2b0fb:	4c 8d 0c 95 3c 00 00 	lea    0x3c(,%rdx,4),%r9
   2b102:	00 
   2b103:	48 83 e8 01          	sub    $0x1,%rax
   2b107:	49 8d 14 c1          	lea    (%r9,%rax,8),%rdx
   2b10b:	4c 01 c2             	add    %r8,%rdx
   2b10e:	83 7a 04 32          	cmpl   $0x32,0x4(%rdx)
   2b112:	0f 85 1c 01 00 00    	jne    2b234 <JS_CallInternal+0x62a4>
   2b118:	48 8b 49 20          	mov    0x20(%rcx),%rcx
   2b11c:	80 7a 03 3f          	cmpb   $0x3f,0x3(%rdx)
   2b120:	0f 87 80 06 00 00    	ja     2b7a6 <JS_CallInternal+0x6816>
   2b126:	48 c1 e0 04          	shl    $0x4,%rax
   2b12a:	48 01 c1             	add    %rax,%rcx
   2b12d:	48 8b 41 08          	mov    0x8(%rcx),%rax
   2b131:	4c 8b 39             	mov    (%rcx),%r15
   2b134:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2b137:	76 05                	jbe    2b13e <JS_CallInternal+0x61ae>
   2b139:	41 83 47 fc 01       	addl   $0x1,-0x4(%r15)
   2b13e:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   2b142:	83 fe f6             	cmp    $0xfffffff6,%esi
   2b145:	76 15                	jbe    2b15c <JS_CallInternal+0x61cc>
   2b147:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2b14b:	8b 51 fc             	mov    -0x4(%rcx),%edx
   2b14e:	83 ea 01             	sub    $0x1,%edx
   2b151:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2b154:	85 d2                	test   %edx,%edx
   2b156:	0f 8e 74 1f 00 00    	jle    2d0d0 <JS_CallInternal+0x8140>
   2b15c:	4c 89 7b f0          	mov    %r15,-0x10(%rbx)
   2b160:	49 83 c5 01          	add    $0x1,%r13
   2b164:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2b168:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2b16d:	49 89 c2             	mov    %rax,%r10
   2b170:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b174:	ff e0                	jmp    *%rax
   2b176:	f3 0f 1e fa          	endbr64
   2b17a:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2b17e:	41 8b 4d 00          	mov    0x0(%r13),%ecx
   2b182:	4d 8d 7d 04          	lea    0x4(%r13),%r15
   2b186:	4c 8b 4b f0          	mov    -0x10(%rbx),%r9
   2b18a:	83 f8 ff             	cmp    $0xffffffff,%eax
   2b18d:	0f 85 cb 06 00 00    	jne    2b85e <JS_CallInternal+0x68ce>
   2b193:	4c 89 cf             	mov    %r9,%rdi
   2b196:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   2b19d:	00 00 00 
   2b1a0:	4c 8b 47 18          	mov    0x18(%rdi),%r8
   2b1a4:	41 8b 70 18          	mov    0x18(%r8),%esi
   2b1a8:	89 f2                	mov    %esi,%edx
   2b1aa:	21 ca                	and    %ecx,%edx
   2b1ac:	41 8b 54 90 38       	mov    0x38(%r8,%rdx,4),%edx
   2b1b1:	48 85 d2             	test   %rdx,%rdx
   2b1b4:	0f 84 b9 00 00 00    	je     2b273 <JS_CallInternal+0x62e3>
   2b1ba:	4c 8d 14 b5 3c 00 00 	lea    0x3c(,%rsi,4),%r10
   2b1c1:	00 
   2b1c2:	48 83 ea 01          	sub    $0x1,%rdx
   2b1c6:	49 8d 34 d2          	lea    (%r10,%rdx,8),%rsi
   2b1ca:	4c 01 c6             	add    %r8,%rsi
   2b1cd:	3b 4e 04             	cmp    0x4(%rsi),%ecx
   2b1d0:	0f 85 8f 00 00 00    	jne    2b265 <JS_CallInternal+0x62d5>
   2b1d6:	48 8b 7f 20          	mov    0x20(%rdi),%rdi
   2b1da:	80 7e 03 3f          	cmpb   $0x3f,0x3(%rsi)
   2b1de:	0f 87 7a 06 00 00    	ja     2b85e <JS_CallInternal+0x68ce>
   2b1e4:	48 c1 e2 04          	shl    $0x4,%rdx
   2b1e8:	48 01 d7             	add    %rdx,%rdi
   2b1eb:	48 8b 47 08          	mov    0x8(%rdi),%rax
   2b1ef:	4c 8b 3f             	mov    (%rdi),%r15
   2b1f2:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2b1f5:	76 05                	jbe    2b1fc <JS_CallInternal+0x626c>
   2b1f7:	41 83 47 fc 01       	addl   $0x1,-0x4(%r15)
   2b1fc:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   2b200:	83 fe f6             	cmp    $0xfffffff6,%esi
   2b203:	76 15                	jbe    2b21a <JS_CallInternal+0x628a>
   2b205:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2b209:	8b 51 fc             	mov    -0x4(%rcx),%edx
   2b20c:	83 ea 01             	sub    $0x1,%edx
   2b20f:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2b212:	85 d2                	test   %edx,%edx
   2b214:	0f 8e 93 1c 00 00    	jle    2cead <JS_CallInternal+0x7f1d>
   2b21a:	4c 89 7b f0          	mov    %r15,-0x10(%rbx)
   2b21e:	49 83 c5 05          	add    $0x5,%r13
   2b222:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2b226:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2b22b:	49 89 c2             	mov    %rax,%r10
   2b22e:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b232:	ff e0                	jmp    *%rax
   2b234:	8b 02                	mov    (%rdx),%eax
   2b236:	25 ff ff ff 03       	and    $0x3ffffff,%eax
   2b23b:	0f 85 c2 fe ff ff    	jne    2b103 <JS_CallInternal+0x6173>
   2b241:	f6 41 10 08          	testb  $0x8,0x10(%rcx)
   2b245:	0f 85 51 05 00 00    	jne    2b79c <JS_CallInternal+0x680c>
   2b24b:	49 8b 48 30          	mov    0x30(%r8),%rcx
   2b24f:	48 85 c9             	test   %rcx,%rcx
   2b252:	0f 85 88 fe ff ff    	jne    2b0e0 <JS_CallInternal+0x6150>
   2b258:	b8 03 00 00 00       	mov    $0x3,%eax
   2b25d:	45 31 ff             	xor    %r15d,%r15d
   2b260:	e9 d9 fe ff ff       	jmp    2b13e <JS_CallInternal+0x61ae>
   2b265:	8b 16                	mov    (%rsi),%edx
   2b267:	81 e2 ff ff ff 03    	and    $0x3ffffff,%edx
   2b26d:	0f 85 4f ff ff ff    	jne    2b1c2 <JS_CallInternal+0x6232>
   2b273:	f6 47 10 08          	testb  $0x8,0x10(%rdi)
   2b277:	0f 85 d7 05 00 00    	jne    2b854 <JS_CallInternal+0x68c4>
   2b27d:	49 8b 78 30          	mov    0x30(%r8),%rdi
   2b281:	48 85 ff             	test   %rdi,%rdi
   2b284:	0f 85 16 ff ff ff    	jne    2b1a0 <JS_CallInternal+0x6210>
   2b28a:	b8 03 00 00 00       	mov    $0x3,%eax
   2b28f:	45 31 ff             	xor    %r15d,%r15d
   2b292:	e9 65 ff ff ff       	jmp    2b1fc <JS_CallInternal+0x626c>
   2b297:	8b 16                	mov    (%rsi),%edx
   2b299:	81 e2 ff ff ff 03    	and    $0x3ffffff,%edx
   2b29f:	0f 85 9d e1 ff ff    	jne    29442 <JS_CallInternal+0x44b2>
   2b2a5:	f6 47 10 08          	testb  $0x8,0x10(%rdi)
   2b2a9:	0f 85 f3 05 00 00    	jne    2b8a2 <JS_CallInternal+0x6912>
   2b2af:	49 8b 78 30          	mov    0x30(%r8),%rdi
   2b2b3:	48 85 ff             	test   %rdi,%rdi
   2b2b6:	0f 85 64 e1 ff ff    	jne    29420 <JS_CallInternal+0x4490>
   2b2bc:	ba 03 00 00 00       	mov    $0x3,%edx
   2b2c1:	31 c0                	xor    %eax,%eax
   2b2c3:	e9 b3 e1 ff ff       	jmp    2947b <JS_CallInternal+0x44eb>
   2b2c8:	8b 06                	mov    (%rsi),%eax
   2b2ca:	25 ff ff ff 03       	and    $0x3ffffff,%eax
   2b2cf:	0f 85 67 f8 ff ff    	jne    2ab3c <JS_CallInternal+0x5bac>
   2b2d5:	f6 47 10 08          	testb  $0x8,0x10(%rdi)
   2b2d9:	0f 85 09 06 00 00    	jne    2b8e8 <JS_CallInternal+0x6958>
   2b2df:	48 8b 7a 30          	mov    0x30(%rdx),%rdi
   2b2e3:	48 85 ff             	test   %rdi,%rdi
   2b2e6:	0f 84 84 18 00 00    	je     2cb70 <JS_CallInternal+0x7be0>
   2b2ec:	48 8b 57 18          	mov    0x18(%rdi),%rdx
   2b2f0:	e9 2b f8 ff ff       	jmp    2ab20 <JS_CallInternal+0x5b90>
   2b2f5:	8b 16                	mov    (%rsi),%edx
   2b2f7:	81 e2 ff ff ff 03    	and    $0x3ffffff,%edx
   2b2fd:	0f 85 09 f9 ff ff    	jne    2ac0c <JS_CallInternal+0x5c7c>
   2b303:	41 f6 40 10 08       	testb  $0x8,0x10(%r8)
   2b308:	0f 85 2f 06 00 00    	jne    2b93d <JS_CallInternal+0x69ad>
   2b30e:	4c 8b 47 30          	mov    0x30(%rdi),%r8
   2b312:	4d 85 c0             	test   %r8,%r8
   2b315:	0f 84 e4 17 00 00    	je     2caff <JS_CallInternal+0x7b6f>
   2b31b:	49 8b 78 18          	mov    0x18(%r8),%rdi
   2b31f:	e9 cc f8 ff ff       	jmp    2abf0 <JS_CallInternal+0x5c60>
   2b324:	8b b5 a8 fe ff ff    	mov    -0x158(%rbp),%esi
   2b32a:	41 39 f0             	cmp    %esi,%r8d
   2b32d:	41 89 f4             	mov    %esi,%r12d
   2b330:	45 0f 4e e0          	cmovle %r8d,%r12d
   2b334:	45 85 e4             	test   %r12d,%r12d
   2b337:	0f 8e fc 15 00 00    	jle    2c939 <JS_CallInternal+0x79a9>
   2b33d:	4d 63 ec             	movslq %r12d,%r13
   2b340:	4c 8b bd 98 fe ff ff 	mov    -0x168(%rbp),%r15
   2b347:	31 f6                	xor    %esi,%esi
   2b349:	49 c1 e5 04          	shl    $0x4,%r13
   2b34d:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   2b354:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2b35b:	00 00 00 00 
   2b35f:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2b366:	00 00 00 00 
   2b36a:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2b371:	00 00 00 00 
   2b375:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2b37c:	00 00 00 00 
   2b380:	4d 8b 5c 37 08       	mov    0x8(%r15,%rsi,1),%r11
   2b385:	4d 8b 34 37          	mov    (%r15,%rsi,1),%r14
   2b389:	41 83 fb f6          	cmp    $0xfffffff6,%r11d
   2b38d:	76 05                	jbe    2b394 <JS_CallInternal+0x6404>
   2b38f:	41 83 46 fc 01       	addl   $0x1,-0x4(%r14)
   2b394:	4c 89 34 37          	mov    %r14,(%rdi,%rsi,1)
   2b398:	4c 89 5c 37 08       	mov    %r11,0x8(%rdi,%rsi,1)
   2b39d:	48 83 c6 10          	add    $0x10,%rsi
   2b3a1:	4c 39 ee             	cmp    %r13,%rsi
   2b3a4:	75 da                	jne    2b380 <JS_CallInternal+0x63f0>
   2b3a6:	45 39 e0             	cmp    %r12d,%r8d
   2b3a9:	7e 4d                	jle    2b3f8 <JS_CallInternal+0x6468>
   2b3ab:	45 8d 58 ff          	lea    -0x1(%r8),%r11d
   2b3af:	4d 63 ec             	movslq %r12d,%r13
   2b3b2:	45 29 e3             	sub    %r12d,%r11d
   2b3b5:	4c 89 ee             	mov    %r13,%rsi
   2b3b8:	4d 01 eb             	add    %r13,%r11
   2b3bb:	48 c1 e6 04          	shl    $0x4,%rsi
   2b3bf:	49 c1 e3 04          	shl    $0x4,%r11
   2b3c3:	48 01 fe             	add    %rdi,%rsi
   2b3c6:	4e 8d 5c 1f 10       	lea    0x10(%rdi,%r11,1),%r11
   2b3cb:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   2b3d2:	00 00 00 
   2b3d5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2b3dc:	00 00 00 00 
   2b3e0:	48 c7 06 00 00 00 00 	movq   $0x0,(%rsi)
   2b3e7:	48 83 c6 10          	add    $0x10,%rsi
   2b3eb:	48 c7 46 f8 03 00 00 	movq   $0x3,-0x8(%rsi)
   2b3f2:	00 
   2b3f3:	4c 39 de             	cmp    %r11,%rsi
   2b3f6:	75 e8                	jne    2b3e0 <JS_CallInternal+0x6450>
   2b3f8:	44 89 85 38 ff ff ff 	mov    %r8d,-0xc8(%rbp)
   2b3ff:	48 89 bd 80 fe ff ff 	mov    %rdi,-0x180(%rbp)
   2b406:	e9 65 9d ff ff       	jmp    25170 <JS_CallInternal+0x1e0>
   2b40b:	48 83 ec 08          	sub    $0x8,%rsp
   2b40f:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   2b415:	49 89 d1             	mov    %rdx,%r9
   2b418:	48 89 c6             	mov    %rax,%rsi
   2b41b:	44 89 95 00 fe ff ff 	mov    %r10d,-0x200(%rbp)
   2b422:	4c 89 e7             	mov    %r12,%rdi
   2b425:	6a 00                	push   $0x0
   2b427:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2b42e:	e8 4d 44 00 00       	call   2f880 <JS_GetPropertyInternal>
   2b433:	4c 89 e7             	mov    %r12,%rdi
   2b436:	48 89 c6             	mov    %rax,%rsi
   2b439:	e8 e2 55 ff ff       	call   20a20 <JS_ToBoolFree>
   2b43e:	4c 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%r8
   2b445:	44 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10d
   2b44c:	41 8b 48 fc          	mov    -0x4(%r8),%ecx
   2b450:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2b453:	85 d2                	test   %edx,%edx
   2b455:	41 89 50 fc          	mov    %edx,-0x4(%r8)
   2b459:	41 5b                	pop    %r11
   2b45b:	59                   	pop    %rcx
   2b45c:	0f 8e ba 38 00 00    	jle    2ed1c <JS_CallInternal+0x9d8c>
   2b462:	85 c0                	test   %eax,%eax
   2b464:	0f 88 56 a2 ff ff    	js     256c0 <JS_CallInternal+0x730>
   2b46a:	0f 84 da 9e ff ff    	je     2534a <JS_CallInternal+0x3ba>
   2b470:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2b474:	48 83 eb 10          	sub    $0x10,%rbx
   2b478:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2b47b:	0f 86 f7 a3 ff ff    	jbe    25878 <JS_CallInternal+0x8e8>
   2b481:	48 8b 0b             	mov    (%rbx),%rcx
   2b484:	8b 71 fc             	mov    -0x4(%rcx),%esi
   2b487:	8d 56 ff             	lea    -0x1(%rsi),%edx
   2b48a:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2b48d:	85 d2                	test   %edx,%edx
   2b48f:	0f 8f e3 a3 ff ff    	jg     25878 <JS_CallInternal+0x8e8>
   2b495:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2b49a:	48 89 c2             	mov    %rax,%rdx
   2b49d:	48 89 ce             	mov    %rcx,%rsi
   2b4a0:	e8 2b 30 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2b4a5:	e9 ce a3 ff ff       	jmp    25878 <JS_CallInternal+0x8e8>
   2b4aa:	8b 95 10 fe ff ff    	mov    -0x1f0(%rbp),%edx
   2b4b0:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2b4b7:	4d 89 ec             	mov    %r13,%r12
   2b4ba:	4c 8b ad 00 fe ff ff 	mov    -0x200(%rbp),%r13
   2b4c1:	83 c2 02             	add    $0x2,%edx
   2b4c4:	48 63 d2             	movslq %edx,%rdx
   2b4c7:	49 83 c5 03          	add    $0x3,%r13
   2b4cb:	48 c1 e2 04          	shl    $0x4,%rdx
   2b4cf:	48 29 d1             	sub    %rdx,%rcx
   2b4d2:	4c 89 01             	mov    %r8,(%rcx)
   2b4d5:	48 8d 59 10          	lea    0x10(%rcx),%rbx
   2b4d9:	48 89 41 08          	mov    %rax,0x8(%rcx)
   2b4dd:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2b4e2:	49 89 c2             	mov    %rax,%r10
   2b4e5:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b4e9:	ff e0                	jmp    *%rax
   2b4eb:	49 89 dc             	mov    %rbx,%r12
   2b4ee:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2b4f5:	48 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%rbx
   2b4fc:	4c 89 f9             	mov    %r15,%rcx
   2b4ff:	48 39 8d 48 fe ff ff 	cmp    %rcx,-0x1b8(%rbp)
   2b506:	0f 84 c0 21 00 00    	je     2d6cc <JS_CallInternal+0x873c>
   2b50c:	48 89 59 f8          	mov    %rbx,-0x8(%rcx)
   2b510:	49 83 c5 01          	add    $0x1,%r13
   2b514:	48 89 cb             	mov    %rcx,%rbx
   2b517:	4c 89 41 f0          	mov    %r8,-0x10(%rcx)
   2b51b:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2b520:	49 89 c2             	mov    %rax,%r10
   2b523:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b527:	ff e0                	jmp    *%rax
   2b529:	4d 89 d4             	mov    %r10,%r12
   2b52c:	48 8b 9d 20 fe ff ff 	mov    -0x1e0(%rbp),%rbx
   2b533:	4c 8b 95 e8 fd ff ff 	mov    -0x218(%rbp),%r10
   2b53a:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2b53f:	4c 89 d6             	mov    %r10,%rsi
   2b542:	e8 a9 aa fe ff       	call   15ff0 <__js_free>
   2b547:	83 bd 10 fe ff ff 06 	cmpl   $0x6,-0x1f0(%rbp)
   2b54e:	0f 84 6c a1 ff ff    	je     256c0 <JS_CallInternal+0x730>
   2b554:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   2b558:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2b55b:	76 15                	jbe    2b572 <JS_CallInternal+0x65e2>
   2b55d:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   2b561:	8b 71 fc             	mov    -0x4(%rcx),%esi
   2b564:	8d 56 ff             	lea    -0x1(%rsi),%edx
   2b567:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2b56a:	85 d2                	test   %edx,%edx
   2b56c:	0f 8e 17 2b 00 00    	jle    2e089 <JS_CallInternal+0x90f9>
   2b572:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2b579:	48 8b 41 08          	mov    0x8(%rcx),%rax
   2b57d:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2b580:	76 14                	jbe    2b596 <JS_CallInternal+0x6606>
   2b582:	48 8b 09             	mov    (%rcx),%rcx
   2b585:	8b 71 fc             	mov    -0x4(%rcx),%esi
   2b588:	8d 56 ff             	lea    -0x1(%rsi),%edx
   2b58b:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2b58e:	85 d2                	test   %edx,%edx
   2b590:	0f 8e f2 21 00 00    	jle    2d788 <JS_CallInternal+0x87f8>
   2b596:	48 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%rax
   2b59d:	49 83 c5 03          	add    $0x3,%r13
   2b5a1:	48 89 43 e0          	mov    %rax,-0x20(%rbx)
   2b5a5:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2b5ac:	48 89 43 e8          	mov    %rax,-0x18(%rbx)
   2b5b0:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2b5b5:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   2b5bc:	49 89 c2             	mov    %rax,%r10
   2b5bf:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b5c3:	ff e0                	jmp    *%rax
   2b5c5:	80 fa 01             	cmp    $0x1,%dl
   2b5c8:	0f 84 22 02 00 00    	je     2b7f0 <JS_CallInternal+0x6860>
   2b5ce:	80 cc 10             	or     $0x10,%ah
   2b5d1:	4c 8d 6b f0          	lea    -0x10(%rbx),%r13
   2b5d5:	f3 0f 6f 73 f0       	movdqu -0x10(%rbx),%xmm6
   2b5da:	4c 89 e7             	mov    %r12,%rdi
   2b5dd:	89 85 d0 fd ff ff    	mov    %eax,-0x230(%rbp)
   2b5e3:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2b5e7:	8b b5 30 fe ff ff    	mov    -0x1d0(%rbp),%esi
   2b5ed:	0f 29 b5 90 fd ff ff 	movaps %xmm6,-0x270(%rbp)
   2b5f4:	48 89 85 20 fe ff ff 	mov    %rax,-0x1e0(%rbp)
   2b5fb:	49 8b 45 08          	mov    0x8(%r13),%rax
   2b5ff:	48 89 85 e8 fd ff ff 	mov    %rax,-0x218(%rbp)
   2b606:	e8 b5 82 01 00       	call   438c0 <js_get_function_name>
   2b60b:	4c 8d 05 32 cb 0a 00 	lea    0xacb32(%rip),%r8        # d8144 <_IO_stdin_used+0x144>
   2b612:	48 8d 35 8e cf 0a 00 	lea    0xacf8e(%rip),%rsi        # d85a7 <_IO_stdin_used+0x5a7>
   2b619:	4c 89 e7             	mov    %r12,%rdi
   2b61c:	48 89 d1             	mov    %rdx,%rcx
   2b61f:	48 89 c2             	mov    %rax,%rdx
   2b622:	e8 f9 80 01 00       	call   43720 <JS_ConcatString3>
   2b627:	49 89 c0             	mov    %rax,%r8
   2b62a:	49 89 d1             	mov    %rdx,%r9
   2b62d:	e9 62 a9 ff ff       	jmp    25f94 <JS_CallInternal+0x1004>
   2b632:	8b 85 30 fe ff ff    	mov    -0x1d0(%rbp),%eax
   2b638:	4c 89 eb             	mov    %r13,%rbx
   2b63b:	48 8b b5 00 fe ff ff 	mov    -0x200(%rbp),%rsi
   2b642:	4c 8b ad 10 fe ff ff 	mov    -0x1f0(%rbp),%r13
   2b649:	48 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%rdx
   2b650:	83 c0 01             	add    $0x1,%eax
   2b653:	48 98                	cltq
   2b655:	49 83 c5 05          	add    $0x5,%r13
   2b659:	48 c1 e0 04          	shl    $0x4,%rax
   2b65d:	48 29 c3             	sub    %rax,%rbx
   2b660:	48 89 d9             	mov    %rbx,%rcx
   2b663:	48 8d 5b 10          	lea    0x10(%rbx),%rbx
   2b667:	48 89 31             	mov    %rsi,(%rcx)
   2b66a:	48 89 51 08          	mov    %rdx,0x8(%rcx)
   2b66e:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2b673:	49 89 c2             	mov    %rax,%r10
   2b676:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b67a:	ff e0                	jmp    *%rax
   2b67c:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2b682:	48 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%rbx
   2b689:	4d 89 ec             	mov    %r13,%r12
   2b68c:	48 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%rdx
   2b693:	4c 8b ad 00 fe ff ff 	mov    -0x200(%rbp),%r13
   2b69a:	83 c1 02             	add    $0x2,%ecx
   2b69d:	48 63 c9             	movslq %ecx,%rcx
   2b6a0:	49 83 c5 03          	add    $0x3,%r13
   2b6a4:	48 c1 e1 04          	shl    $0x4,%rcx
   2b6a8:	48 29 cb             	sub    %rcx,%rbx
   2b6ab:	48 89 de             	mov    %rbx,%rsi
   2b6ae:	48 8d 5b 10          	lea    0x10(%rbx),%rbx
   2b6b2:	48 89 06             	mov    %rax,(%rsi)
   2b6b5:	48 89 56 08          	mov    %rdx,0x8(%rsi)
   2b6b9:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2b6be:	49 89 c2             	mov    %rax,%r10
   2b6c1:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b6c5:	ff e0                	jmp    *%rax
   2b6c7:	8b 10                	mov    (%rax),%edx
   2b6c9:	81 e2 ff ff ff 03    	and    $0x3ffffff,%edx
   2b6cf:	0f 85 81 b1 ff ff    	jne    26856 <JS_CallInternal+0x18c6>
   2b6d5:	89 f2                	mov    %esi,%edx
   2b6d7:	b9 07 00 00 00       	mov    $0x7,%ecx
   2b6dc:	4c 89 fe             	mov    %r15,%rsi
   2b6df:	4c 89 e7             	mov    %r12,%rdi
   2b6e2:	e8 39 e2 01 00       	call   49920 <add_property>
   2b6e7:	48 85 c0             	test   %rax,%rax
   2b6ea:	0f 84 10 2c 00 00    	je     2e300 <JS_CallInternal+0x9370>
   2b6f0:	48 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%rbx
   2b6f7:	48 89 18             	mov    %rbx,(%rax)
   2b6fa:	48 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%rbx
   2b701:	48 89 58 08          	mov    %rbx,0x8(%rax)
   2b705:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   2b70c:	48 8b 43 08          	mov    0x8(%rbx),%rax
   2b710:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2b713:	76 14                	jbe    2b729 <JS_CallInternal+0x6799>
   2b715:	48 8b 0b             	mov    (%rbx),%rcx
   2b718:	8b 59 fc             	mov    -0x4(%rcx),%ebx
   2b71b:	8d 53 ff             	lea    -0x1(%rbx),%edx
   2b71e:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2b721:	85 d2                	test   %edx,%edx
   2b723:	0f 8e 17 2b 00 00    	jle    2e240 <JS_CallInternal+0x92b0>
   2b729:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2b72e:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   2b735:	49 83 c5 01          	add    $0x1,%r13
   2b739:	49 89 c2             	mov    %rax,%r10
   2b73c:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b740:	ff e0                	jmp    *%rax
   2b742:	81 bd 30 fe ff ff f2 	cmpl   $0xf2,-0x1d0(%rbp)
   2b749:	00 00 00 
   2b74c:	0f 8f 7d 11 00 00    	jg     2c8cf <JS_CallInternal+0x793f>
   2b752:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   2b756:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2b759:	0f 86 0e a9 ff ff    	jbe    2606d <JS_CallInternal+0x10dd>
   2b75f:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   2b763:	8b 56 fc             	mov    -0x4(%rsi),%edx
   2b766:	83 ea 01             	sub    $0x1,%edx
   2b769:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2b76c:	85 d2                	test   %edx,%edx
   2b76e:	0f 8f f9 a8 ff ff    	jg     2606d <JS_CallInternal+0x10dd>
   2b774:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2b779:	48 89 c2             	mov    %rax,%rdx
   2b77c:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2b782:	e8 49 2d ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2b787:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2b78d:	e9 db a8 ff ff       	jmp    2606d <JS_CallInternal+0x10dd>
   2b792:	ba 08 00 00 00       	mov    $0x8,%edx
   2b797:	e9 59 df ff ff       	jmp    296f5 <JS_CallInternal+0x4765>
   2b79c:	48 89 cf             	mov    %rcx,%rdi
   2b79f:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
   2b7a6:	48 83 ec 08          	sub    $0x8,%rsp
   2b7aa:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2b7ae:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2b7b2:	48 89 f2             	mov    %rsi,%rdx
   2b7b5:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2b7bc:	48 89 fe             	mov    %rdi,%rsi
   2b7bf:	b9 32 00 00 00       	mov    $0x32,%ecx
   2b7c4:	4c 89 e7             	mov    %r12,%rdi
   2b7c7:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2b7cb:	6a 00                	push   $0x0
   2b7cd:	e8 ae 40 00 00       	call   2f880 <JS_GetPropertyInternal>
   2b7d2:	5f                   	pop    %rdi
   2b7d3:	41 58                	pop    %r8
   2b7d5:	49 89 c7             	mov    %rax,%r15
   2b7d8:	48 89 d0             	mov    %rdx,%rax
   2b7db:	83 fa 06             	cmp    $0x6,%edx
   2b7de:	0f 85 5a f9 ff ff    	jne    2b13e <JS_CallInternal+0x61ae>
   2b7e4:	4d 89 ef             	mov    %r13,%r15
   2b7e7:	e9 d4 9e ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2b7ec:	0f 1f 40 00          	nopl   0x0(%rax)
   2b7f0:	80 cc 08             	or     $0x8,%ah
   2b7f3:	4c 8d 6b f0          	lea    -0x10(%rbx),%r13
   2b7f7:	f3 0f 6f 6b f0       	movdqu -0x10(%rbx),%xmm5
   2b7fc:	4c 89 e7             	mov    %r12,%rdi
   2b7ff:	89 85 d0 fd ff ff    	mov    %eax,-0x230(%rbp)
   2b805:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2b809:	8b b5 30 fe ff ff    	mov    -0x1d0(%rbp),%esi
   2b80f:	0f 29 ad a0 fd ff ff 	movaps %xmm5,-0x260(%rbp)
   2b816:	48 89 85 20 fe ff ff 	mov    %rax,-0x1e0(%rbp)
   2b81d:	49 8b 45 08          	mov    0x8(%r13),%rax
   2b821:	48 89 85 e8 fd ff ff 	mov    %rax,-0x218(%rbp)
   2b828:	e8 93 80 01 00       	call   438c0 <js_get_function_name>
   2b82d:	4c 8d 05 10 c9 0a 00 	lea    0xac910(%rip),%r8        # d8144 <_IO_stdin_used+0x144>
   2b834:	48 8d 35 67 cd 0a 00 	lea    0xacd67(%rip),%rsi        # d85a2 <_IO_stdin_used+0x5a2>
   2b83b:	4c 89 e7             	mov    %r12,%rdi
   2b83e:	48 89 d1             	mov    %rdx,%rcx
   2b841:	48 89 c2             	mov    %rax,%rdx
   2b844:	e8 d7 7e 01 00       	call   43720 <JS_ConcatString3>
   2b849:	49 89 c0             	mov    %rax,%r8
   2b84c:	49 89 d1             	mov    %rdx,%r9
   2b84f:	e9 40 a7 ff ff       	jmp    25f94 <JS_CallInternal+0x1004>
   2b854:	49 89 f9             	mov    %rdi,%r9
   2b857:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   2b85e:	48 8b 95 b8 fe ff ff 	mov    -0x148(%rbp),%rdx
   2b865:	48 83 ec 08          	sub    $0x8,%rsp
   2b869:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2b86d:	4c 89 e7             	mov    %r12,%rdi
   2b870:	4c 89 7a 30          	mov    %r15,0x30(%rdx)
   2b874:	48 89 c2             	mov    %rax,%rdx
   2b877:	4c 89 c8             	mov    %r9,%rax
   2b87a:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2b87e:	6a 00                	push   $0x0
   2b880:	48 89 c6             	mov    %rax,%rsi
   2b883:	e8 f8 3f 00 00       	call   2f880 <JS_GetPropertyInternal>
   2b888:	41 5b                	pop    %r11
   2b88a:	48 89 c1             	mov    %rax,%rcx
   2b88d:	48 89 d0             	mov    %rdx,%rax
   2b890:	5a                   	pop    %rdx
   2b891:	83 f8 06             	cmp    $0x6,%eax
   2b894:	0f 84 26 9e ff ff    	je     256c0 <JS_CallInternal+0x730>
   2b89a:	49 89 cf             	mov    %rcx,%r15
   2b89d:	e9 5a f9 ff ff       	jmp    2b1fc <JS_CallInternal+0x626c>
   2b8a2:	49 89 f9             	mov    %rdi,%r9
   2b8a5:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   2b8ac:	48 83 ec 08          	sub    $0x8,%rsp
   2b8b0:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2b8b4:	48 89 c2             	mov    %rax,%rdx
   2b8b7:	4c 89 c8             	mov    %r9,%rax
   2b8ba:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   2b8c1:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2b8c5:	4c 89 e7             	mov    %r12,%rdi
   2b8c8:	4c 89 7e 30          	mov    %r15,0x30(%rsi)
   2b8cc:	48 89 c6             	mov    %rax,%rsi
   2b8cf:	6a 00                	push   $0x0
   2b8d1:	e8 aa 3f 00 00       	call   2f880 <JS_GetPropertyInternal>
   2b8d6:	41 59                	pop    %r9
   2b8d8:	41 5a                	pop    %r10
   2b8da:	83 fa 06             	cmp    $0x6,%edx
   2b8dd:	0f 85 98 db ff ff    	jne    2947b <JS_CallInternal+0x44eb>
   2b8e3:	e9 d8 9d ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2b8e8:	48 c7 85 30 fe ff ff 	movq   $0xffffffffffffffff,-0x1d0(%rbp)
   2b8ef:	ff ff ff ff 
   2b8f3:	49 89 fa             	mov    %rdi,%r10
   2b8f6:	48 83 ec 08          	sub    $0x8,%rsp
   2b8fa:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2b8fe:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2b902:	4c 89 d6             	mov    %r10,%rsi
   2b905:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2b90c:	4c 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%r11
   2b913:	4c 89 e7             	mov    %r12,%rdi
   2b916:	4c 89 78 30          	mov    %r15,0x30(%rax)
   2b91a:	4c 89 da             	mov    %r11,%rdx
   2b91d:	6a 00                	push   $0x0
   2b91f:	e8 5c 3f 00 00       	call   2f880 <JS_GetPropertyInternal>
   2b924:	5e                   	pop    %rsi
   2b925:	5f                   	pop    %rdi
   2b926:	48 89 c1             	mov    %rax,%rcx
   2b929:	48 89 d0             	mov    %rdx,%rax
   2b92c:	83 fa 06             	cmp    $0x6,%edx
   2b92f:	0f 84 8b 9d ff ff    	je     256c0 <JS_CallInternal+0x730>
   2b935:	49 89 cf             	mov    %rcx,%r15
   2b938:	e9 51 f2 ff ff       	jmp    2ab8e <JS_CallInternal+0x5bfe>
   2b93d:	4c 89 c0             	mov    %r8,%rax
   2b940:	49 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%r11
   2b947:	48 83 ec 08          	sub    $0x8,%rsp
   2b94b:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2b94f:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2b953:	4c 89 da             	mov    %r11,%rdx
   2b956:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   2b95d:	4c 89 e7             	mov    %r12,%rdi
   2b960:	4c 89 7e 30          	mov    %r15,0x30(%rsi)
   2b964:	48 89 c6             	mov    %rax,%rsi
   2b967:	6a 00                	push   $0x0
   2b969:	e8 12 3f 00 00       	call   2f880 <JS_GetPropertyInternal>
   2b96e:	41 59                	pop    %r9
   2b970:	41 5a                	pop    %r10
   2b972:	48 89 d1             	mov    %rdx,%rcx
   2b975:	83 fa 06             	cmp    $0x6,%edx
   2b978:	0f 84 42 9d ff ff    	je     256c0 <JS_CallInternal+0x730>
   2b97e:	49 89 c7             	mov    %rax,%r15
   2b981:	e9 cb f2 ff ff       	jmp    2ac51 <JS_CallInternal+0x5cc1>
   2b986:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   2b98d:	4c 89 7e 30          	mov    %r15,0x30(%rsi)
   2b991:	83 fa f6             	cmp    $0xfffffff6,%edx
   2b994:	76 04                	jbe    2b99a <JS_CallInternal+0x6a0a>
   2b996:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2b99a:	48 89 95 e8 fe ff ff 	mov    %rdx,-0x118(%rbp)
   2b9a1:	4c 89 e7             	mov    %r12,%rdi
   2b9a4:	48 8d b5 f0 fe ff ff 	lea    -0x110(%rbp),%rsi
   2b9ab:	ba 8d 00 00 00       	mov    $0x8d,%edx
   2b9b0:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2b9b7:	48 89 85 e0 fe ff ff 	mov    %rax,-0x120(%rbp)
   2b9be:	e8 9d 5f 02 00       	call   51960 <js_unary_arith_slow>
   2b9c3:	85 c0                	test   %eax,%eax
   2b9c5:	0f 85 f5 9c ff ff    	jne    256c0 <JS_CallInternal+0x730>
   2b9cb:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2b9d2:	48 8b b5 e0 fe ff ff 	mov    -0x120(%rbp),%rsi
   2b9d9:	48 8b 11             	mov    (%rcx),%rdx
   2b9dc:	48 8b 41 08          	mov    0x8(%rcx),%rax
   2b9e0:	48 89 31             	mov    %rsi,(%rcx)
   2b9e3:	48 8b b5 e8 fe ff ff 	mov    -0x118(%rbp),%rsi
   2b9ea:	48 89 71 08          	mov    %rsi,0x8(%rcx)
   2b9ee:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2b9f1:	0f 86 11 e0 ff ff    	jbe    29a08 <JS_CallInternal+0x4a78>
   2b9f7:	8b 4a fc             	mov    -0x4(%rdx),%ecx
   2b9fa:	83 e9 01             	sub    $0x1,%ecx
   2b9fd:	89 4a fc             	mov    %ecx,-0x4(%rdx)
   2ba00:	85 c9                	test   %ecx,%ecx
   2ba02:	0f 8f 00 e0 ff ff    	jg     29a08 <JS_CallInternal+0x4a78>
   2ba08:	48 92                	xchg   %rax,%rdx
   2ba0a:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2ba0f:	48 89 c6             	mov    %rax,%rsi
   2ba12:	e8 b9 2a ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2ba17:	e9 ec df ff ff       	jmp    29a08 <JS_CallInternal+0x4a78>
   2ba1c:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   2ba23:	4c 89 7e 30          	mov    %r15,0x30(%rsi)
   2ba27:	83 fa f6             	cmp    $0xfffffff6,%edx
   2ba2a:	76 04                	jbe    2ba30 <JS_CallInternal+0x6aa0>
   2ba2c:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2ba30:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
   2ba37:	4c 89 e7             	mov    %r12,%rdi
   2ba3a:	48 8d b5 00 ff ff ff 	lea    -0x100(%rbp),%rsi
   2ba41:	ba 8c 00 00 00       	mov    $0x8c,%edx
   2ba46:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2ba4d:	48 89 85 f0 fe ff ff 	mov    %rax,-0x110(%rbp)
   2ba54:	e8 07 5f 02 00       	call   51960 <js_unary_arith_slow>
   2ba59:	85 c0                	test   %eax,%eax
   2ba5b:	0f 85 5f 9c ff ff    	jne    256c0 <JS_CallInternal+0x730>
   2ba61:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2ba68:	48 8b b5 f0 fe ff ff 	mov    -0x110(%rbp),%rsi
   2ba6f:	48 8b 11             	mov    (%rcx),%rdx
   2ba72:	48 8b 41 08          	mov    0x8(%rcx),%rax
   2ba76:	48 89 31             	mov    %rsi,(%rcx)
   2ba79:	48 8b b5 f8 fe ff ff 	mov    -0x108(%rbp),%rsi
   2ba80:	48 89 71 08          	mov    %rsi,0x8(%rcx)
   2ba84:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2ba87:	0f 86 74 de ff ff    	jbe    29901 <JS_CallInternal+0x4971>
   2ba8d:	8b 4a fc             	mov    -0x4(%rdx),%ecx
   2ba90:	83 e9 01             	sub    $0x1,%ecx
   2ba93:	89 4a fc             	mov    %ecx,-0x4(%rdx)
   2ba96:	85 c9                	test   %ecx,%ecx
   2ba98:	0f 8f 63 de ff ff    	jg     29901 <JS_CallInternal+0x4971>
   2ba9e:	48 92                	xchg   %rax,%rdx
   2baa0:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2baa5:	48 89 c6             	mov    %rax,%rsi
   2baa8:	e8 23 2a ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2baad:	e9 4f de ff ff       	jmp    29901 <JS_CallInternal+0x4971>
   2bab2:	b8 06 00 00 00       	mov    $0x6,%eax
   2bab7:	31 c9                	xor    %ecx,%ecx
   2bab9:	e9 c4 9c ff ff       	jmp    25782 <JS_CallInternal+0x7f2>
   2babe:	85 c0                	test   %eax,%eax
   2bac0:	0f 84 c0 ce ff ff    	je     28986 <JS_CallInternal+0x39f6>
   2bac6:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2baca:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2bace:	b9 01 00 00 00       	mov    $0x1,%ecx
   2bad3:	4c 89 e7             	mov    %r12,%rdi
   2bad6:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2badd:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2bae1:	e8 ca 74 01 00       	call   42fb0 <JS_ToStringInternal>
   2bae6:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2baed:	49 89 d7             	mov    %rdx,%r15
   2baf0:	83 fa 06             	cmp    $0x6,%edx
   2baf3:	0f 84 de 30 00 00    	je     2ebd7 <JS_CallInternal+0x9c47>
   2baf9:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2bafd:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2bb00:	76 15                	jbe    2bb17 <JS_CallInternal+0x6b87>
   2bb02:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2bb06:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   2bb09:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2bb0c:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2bb0f:	85 d2                	test   %edx,%edx
   2bb11:	0f 8e ae 30 00 00    	jle    2ebc5 <JS_CallInternal+0x9c35>
   2bb17:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2bb1e:	4c 89 7b f8          	mov    %r15,-0x8(%rbx)
   2bb22:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2bb26:	e9 5b ce ff ff       	jmp    28986 <JS_CallInternal+0x39f6>
   2bb2b:	83 fa 08             	cmp    $0x8,%edx
   2bb2e:	0f 85 f7 0c 00 00    	jne    2c82b <JS_CallInternal+0x789b>
   2bb34:	66 48 0f 6e c0       	movq   %rax,%xmm0
   2bb39:	66 0f 57 05 3f 9f 0b 	xorpd  0xb9f3f(%rip),%xmm0        # e5a80 <typed_array_size_log2+0x28>
   2bb40:	00 
   2bb41:	48 c7 43 f8 08 00 00 	movq   $0x8,-0x8(%rbx)
   2bb48:	00 
   2bb49:	f2 0f 11 43 f0       	movsd  %xmm0,-0x10(%rbx)
   2bb4e:	e9 52 da ff ff       	jmp    295a5 <JS_CallInternal+0x4615>
   2bb53:	85 c9                	test   %ecx,%ecx
   2bb55:	0f 85 4c 36 00 00    	jne    2f1a7 <JS_CallInternal+0xa217>
   2bb5b:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   2bb5f:	4c 8d 6b e0          	lea    -0x20(%rbx),%r13
   2bb63:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2bb66:	76 15                	jbe    2bb7d <JS_CallInternal+0x6bed>
   2bb68:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   2bb6c:	8b 51 fc             	mov    -0x4(%rcx),%edx
   2bb6f:	83 ea 01             	sub    $0x1,%edx
   2bb72:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2bb75:	85 d2                	test   %edx,%edx
   2bb77:	0f 8e c8 2a 00 00    	jle    2e645 <JS_CallInternal+0x96b5>
   2bb7d:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   2bb81:	48 8b 53 d8          	mov    -0x28(%rbx),%rdx
   2bb85:	b9 01 00 00 00       	mov    $0x1,%ecx
   2bb8a:	4c 89 e7             	mov    %r12,%rdi
   2bb8d:	4c 89 eb             	mov    %r13,%rbx
   2bb90:	e8 7b 85 06 00       	call   94110 <JS_IteratorClose>
   2bb95:	e9 43 9d ff ff       	jmp    258dd <JS_CallInternal+0x94d>
   2bb9a:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   2bb9e:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   2bba2:	4c 89 d1             	mov    %r10,%rcx
   2bba5:	4d 89 f8             	mov    %r15,%r8
   2bba8:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   2bbae:	4c 89 e7             	mov    %r12,%rdi
   2bbb1:	4c 89 95 30 fe ff ff 	mov    %r10,-0x1d0(%rbp)
   2bbb8:	4c 89 bd 38 fe ff ff 	mov    %r15,-0x1c8(%rbp)
   2bbbf:	e8 ac 18 01 00       	call   3d470 <JS_SetPrototypeInternal>
   2bbc4:	4c 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%r10
   2bbcb:	85 c0                	test   %eax,%eax
   2bbcd:	0f 89 26 ab ff ff    	jns    266f9 <JS_CallInternal+0x1769>
   2bbd3:	4d 89 ef             	mov    %r13,%r15
   2bbd6:	e9 e5 9a ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2bbdb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2bbe0:	83 f9 08             	cmp    $0x8,%ecx
   2bbe3:	0f 85 d6 0b 00 00    	jne    2c7bf <JS_CallInternal+0x782f>
   2bbe9:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2bbed:	66 49 0f 6e e0       	movq   %r8,%xmm4
   2bbf2:	45 31 ff             	xor    %r15d,%r15d
   2bbf5:	f2 0f 2a c7          	cvtsi2sd %edi,%xmm0
   2bbf9:	66 0f 2e c4          	ucomisd %xmm4,%xmm0
   2bbfd:	41 0f 9b c7          	setnp  %r15b
   2bc01:	44 0f 45 fa          	cmovne %edx,%r15d
   2bc05:	e9 cf d3 ff ff       	jmp    28fd9 <JS_CallInternal+0x4049>
   2bc0a:	41 83 f8 08          	cmp    $0x8,%r8d
   2bc0e:	0f 85 2d 0d 00 00    	jne    2c941 <JS_CallInternal+0x79b1>
   2bc14:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2bc18:	66 49 0f 6e e2       	movq   %r10,%xmm4
   2bc1d:	45 31 ff             	xor    %r15d,%r15d
   2bc20:	b8 00 00 00 00       	mov    $0x0,%eax
   2bc25:	f2 0f 2a c7          	cvtsi2sd %edi,%xmm0
   2bc29:	66 0f 2e c4          	ucomisd %xmm4,%xmm0
   2bc2d:	41 0f 9b c7          	setnp  %r15b
   2bc31:	4c 0f 45 f8          	cmovne %rax,%r15
   2bc35:	e9 4f d3 ff ff       	jmp    28f89 <JS_CallInternal+0x3ff9>
   2bc3a:	41 83 ff 08          	cmp    $0x8,%r15d
   2bc3e:	0f 85 c8 0c 00 00    	jne    2c90c <JS_CallInternal+0x797c>
   2bc44:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2bc48:	66 49 0f 6e e2       	movq   %r10,%xmm4
   2bc4d:	31 c0                	xor    %eax,%eax
   2bc4f:	f2 0f 2a c2          	cvtsi2sd %edx,%xmm0
   2bc53:	66 0f 2e c4          	ucomisd %xmm4,%xmm0
   2bc57:	ba 01 00 00 00       	mov    $0x1,%edx
   2bc5c:	0f 9a c0             	setp   %al
   2bc5f:	48 0f 45 c2          	cmovne %rdx,%rax
   2bc63:	e9 d0 d2 ff ff       	jmp    28f38 <JS_CallInternal+0x3fa8>
   2bc68:	41 83 ff 08          	cmp    $0x8,%r15d
   2bc6c:	0f 85 77 0a 00 00    	jne    2c6e9 <JS_CallInternal+0x7759>
   2bc72:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2bc76:	66 49 0f 6e e0       	movq   %r8,%xmm4
   2bc7b:	31 c9                	xor    %ecx,%ecx
   2bc7d:	f2 0f 2a c7          	cvtsi2sd %edi,%xmm0
   2bc81:	66 0f 2e c4          	ucomisd %xmm4,%xmm0
   2bc85:	0f 9b c1             	setnp  %cl
   2bc88:	0f 45 ca             	cmovne %edx,%ecx
   2bc8b:	e9 35 d8 ff ff       	jmp    294c5 <JS_CallInternal+0x4535>
   2bc90:	4d 89 ef             	mov    %r13,%r15
   2bc93:	e9 28 9a ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2bc98:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2bc9f:	44 89 d2             	mov    %r10d,%edx
   2bca2:	48 89 de             	mov    %rbx,%rsi
   2bca5:	4c 89 e7             	mov    %r12,%rdi
   2bca8:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2bcac:	e8 af 5c 02 00       	call   51960 <js_unary_arith_slow>
   2bcb1:	85 c0                	test   %eax,%eax
   2bcb3:	0f 84 89 dc ff ff    	je     29942 <JS_CallInternal+0x49b2>
   2bcb9:	4d 89 ef             	mov    %r13,%r15
   2bcbc:	e9 ff 99 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2bcc1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   2bcc8:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2bccf:	44 89 d2             	mov    %r10d,%edx
   2bcd2:	48 89 de             	mov    %rbx,%rsi
   2bcd5:	4c 89 e7             	mov    %r12,%rdi
   2bcd8:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2bcdc:	e8 8f 61 02 00       	call   51e70 <js_post_inc_slow>
   2bce1:	85 c0                	test   %eax,%eax
   2bce3:	0f 84 c2 db ff ff    	je     298ab <JS_CallInternal+0x491b>
   2bce9:	4d 89 ef             	mov    %r13,%r15
   2bcec:	e9 cf 99 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2bcf1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   2bcf8:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2bcff:	44 89 d2             	mov    %r10d,%edx
   2bd02:	48 89 de             	mov    %rbx,%rsi
   2bd05:	4c 89 e7             	mov    %r12,%rdi
   2bd08:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2bd0c:	e8 4f 5c 02 00       	call   51960 <js_unary_arith_slow>
   2bd11:	85 c0                	test   %eax,%eax
   2bd13:	0f 84 9d dc ff ff    	je     299b6 <JS_CallInternal+0x4a26>
   2bd19:	4d 89 ef             	mov    %r13,%r15
   2bd1c:	e9 9f 99 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2bd21:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   2bd28:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   2bd2c:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   2bd30:	4c 89 e7             	mov    %r12,%rdi
   2bd33:	4d 89 ef             	mov    %r13,%r15
   2bd36:	e8 b5 a8 01 00       	call   465f0 <JS_ValueToAtom>
   2bd3b:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2bd41:	85 c0                	test   %eax,%eax
   2bd43:	0f 85 73 a1 ff ff    	jne    25ebc <JS_CallInternal+0xf2c>
   2bd49:	e9 72 99 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2bd4e:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2bd55:	44 89 d2             	mov    %r10d,%edx
   2bd58:	48 89 de             	mov    %rbx,%rsi
   2bd5b:	4c 89 e7             	mov    %r12,%rdi
   2bd5e:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2bd62:	e8 09 61 02 00       	call   51e70 <js_post_inc_slow>
   2bd67:	85 c0                	test   %eax,%eax
   2bd69:	0f 84 f8 da ff ff    	je     29867 <JS_CallInternal+0x48d7>
   2bd6f:	4d 89 ef             	mov    %r13,%r15
   2bd72:	e9 49 99 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2bd77:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   2bd7e:	00 00 
   2bd80:	48 8b 4b c0          	mov    -0x40(%rbx),%rcx
   2bd84:	4c 8b 43 c8          	mov    -0x38(%rbx),%r8
   2bd88:	f6 85 30 fe ff ff 02 	testb  $0x2,-0x1d0(%rbp)
   2bd8f:	0f 84 32 0c 00 00    	je     2c9c7 <JS_CallInternal+0x7a37>
   2bd95:	48 83 ec 08          	sub    $0x8,%rsp
   2bd99:	45 31 c9             	xor    %r9d,%r9d
   2bd9c:	6a 00                	push   $0x0
   2bd9e:	4c 89 e7             	mov    %r12,%rdi
   2bda1:	e8 4a 3a 00 00       	call   2f7f0 <JS_CallFree>
   2bda6:	48 89 c1             	mov    %rax,%rcx
   2bda9:	48 89 d0             	mov    %rdx,%rax
   2bdac:	5a                   	pop    %rdx
   2bdad:	5e                   	pop    %rsi
   2bdae:	83 f8 06             	cmp    $0x6,%eax
   2bdb1:	0f 84 09 99 ff ff    	je     256c0 <JS_CallInternal+0x730>
   2bdb7:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   2bdbb:	83 fe f6             	cmp    $0xfffffff6,%esi
   2bdbe:	76 15                	jbe    2bdd5 <JS_CallInternal+0x6e45>
   2bdc0:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   2bdc4:	8b 57 fc             	mov    -0x4(%rdi),%edx
   2bdc7:	83 ea 01             	sub    $0x1,%edx
   2bdca:	89 57 fc             	mov    %edx,-0x4(%rdi)
   2bdcd:	85 d2                	test   %edx,%edx
   2bdcf:	0f 8e 9e 2a 00 00    	jle    2e873 <JS_CallInternal+0x98e3>
   2bdd5:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2bdd9:	31 c0                	xor    %eax,%eax
   2bddb:	48 89 4b f0          	mov    %rcx,-0x10(%rbx)
   2bddf:	e9 7e f1 ff ff       	jmp    2af62 <JS_CallInternal+0x5fd2>
   2bde4:	45 31 c0             	xor    %r8d,%r8d
   2bde7:	48 8b 0b             	mov    (%rbx),%rcx
   2bdea:	8b 71 fc             	mov    -0x4(%rcx),%esi
   2bded:	8d 56 ff             	lea    -0x1(%rsi),%edx
   2bdf0:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2bdf3:	85 d2                	test   %edx,%edx
   2bdf5:	0f 8e ec 0e 00 00    	jle    2cce7 <JS_CallInternal+0x7d57>
   2bdfb:	49 8b 47 08          	mov    0x8(%r15),%rax
   2bdff:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2be02:	76 14                	jbe    2be18 <JS_CallInternal+0x6e88>
   2be04:	49 8b 17             	mov    (%r15),%rdx
   2be07:	8b 4a fc             	mov    -0x4(%rdx),%ecx
   2be0a:	83 e9 01             	sub    $0x1,%ecx
   2be0d:	89 4a fc             	mov    %ecx,-0x4(%rdx)
   2be10:	85 c9                	test   %ecx,%ecx
   2be12:	0f 8e f5 0e 00 00    	jle    2cd0d <JS_CallInternal+0x7d7d>
   2be18:	41 83 f8 ff          	cmp    $0xffffffff,%r8d
   2be1c:	0f 85 ca ab ff ff    	jne    269ec <JS_CallInternal+0x1a5c>
   2be22:	4d 89 ef             	mov    %r13,%r15
   2be25:	e9 96 98 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2be2a:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2be2f:	48 89 ce             	mov    %rcx,%rsi
   2be32:	e8 99 26 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2be37:	e9 63 ad ff ff       	jmp    26b9f <JS_CallInternal+0x1c0f>
   2be3c:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2be40:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
   2be45:	b8 08 00 00 00       	mov    $0x8,%eax
   2be4a:	e9 b8 e1 ff ff       	jmp    2a007 <JS_CallInternal+0x5077>
   2be4f:	48 89 ce             	mov    %rcx,%rsi
   2be52:	4c 89 e7             	mov    %r12,%rdi
   2be55:	4c 89 95 20 fe ff ff 	mov    %r10,-0x1e0(%rbp)
   2be5c:	4c 89 85 00 fe ff ff 	mov    %r8,-0x200(%rbp)
   2be63:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   2be6a:	4c 89 8d e8 fd ff ff 	mov    %r9,-0x218(%rbp)
   2be71:	e8 1a 0d 01 00       	call   3cb90 <expand_fast_array>
   2be76:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   2be7d:	4c 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%r8
   2be84:	83 f8 ff             	cmp    $0xffffffff,%eax
   2be87:	4c 8b 95 20 fe ff ff 	mov    -0x1e0(%rbp),%r10
   2be8e:	4c 8b 8d e8 fd ff ff 	mov    -0x218(%rbp),%r9
   2be95:	0f 84 7e 29 00 00    	je     2e819 <JS_CallInternal+0x9889>
   2be9b:	8b 85 30 fe ff ff    	mov    -0x1d0(%rbp),%eax
   2bea1:	89 41 38             	mov    %eax,0x38(%rcx)
   2bea4:	31 c0                	xor    %eax,%eax
   2bea6:	0f 1f 40 00          	nopl   0x0(%rax)
   2beaa:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2beb1:	00 00 00 00 
   2beb5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2bebc:	00 00 00 00 
   2bec0:	f3 41 0f 6f 04 00    	movdqu (%r8,%rax,1),%xmm0
   2bec6:	48 8b 51 30          	mov    0x30(%rcx),%rdx
   2beca:	0f 11 04 02          	movups %xmm0,(%rdx,%rax,1)
   2bece:	48 83 c0 10          	add    $0x10,%rax
   2bed2:	4c 39 c8             	cmp    %r9,%rax
   2bed5:	75 e9                	jne    2bec0 <JS_CallInternal+0x6f30>
   2bed7:	48 8b 51 20          	mov    0x20(%rcx),%rdx
   2bedb:	48 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%rbx
   2bee2:	48 8b 42 08          	mov    0x8(%rdx),%rax
   2bee6:	48 8b 32             	mov    (%rdx),%rsi
   2bee9:	48 c7 42 08 00 00 00 	movq   $0x0,0x8(%rdx)
   2bef0:	00 
   2bef1:	48 89 1a             	mov    %rbx,(%rdx)
   2bef4:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2bef7:	0f 86 db a6 ff ff    	jbe    265d8 <JS_CallInternal+0x1648>
   2befd:	8b 5e fc             	mov    -0x4(%rsi),%ebx
   2bf00:	8d 53 ff             	lea    -0x1(%rbx),%edx
   2bf03:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2bf06:	85 d2                	test   %edx,%edx
   2bf08:	0f 8f ca a6 ff ff    	jg     265d8 <JS_CallInternal+0x1648>
   2bf0e:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2bf13:	48 89 c2             	mov    %rax,%rdx
   2bf16:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   2bf1d:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   2bf24:	4c 89 85 30 fe ff ff 	mov    %r8,-0x1d0(%rbp)
   2bf2b:	e8 a0 25 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2bf30:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   2bf37:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   2bf3e:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2bf45:	e9 8e a6 ff ff       	jmp    265d8 <JS_CallInternal+0x1648>
   2bf4a:	48 8b b5 c0 fe ff ff 	mov    -0x140(%rbp),%rsi
   2bf51:	4c 03 4e 30          	add    0x30(%rsi),%r9
   2bf55:	80 79 11 00          	cmpb   $0x0,0x11(%rcx)
   2bf59:	0f 84 e4 12 00 00    	je     2d243 <JS_CallInternal+0x82b3>
   2bf5f:	41 83 fa 3a          	cmp    $0x3a,%r10d
   2bf63:	0f 84 fb 9c ff ff    	je     25c64 <JS_CallInternal+0xcd4>
   2bf69:	41 8b 71 04          	mov    0x4(%r9),%esi
   2bf6d:	4c 89 e7             	mov    %r12,%rdi
   2bf70:	83 fa 04             	cmp    $0x4,%edx
   2bf73:	0f 84 e4 36 00 00    	je     2f65d <JS_CallInternal+0xa6cd>
   2bf79:	e8 f2 8b 00 00       	call   34b70 <JS_ThrowTypeErrorReadOnly.part.0>
   2bf7e:	e9 3d 97 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2bf83:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2bf88:	41 8b 4d 01          	mov    0x1(%r13),%ecx
   2bf8c:	49 8d 4c 0d 01       	lea    0x1(%r13,%rcx,1),%rcx
   2bf91:	66 83 78 12 01       	cmpw   $0x1,0x12(%rax)
   2bf96:	0f 85 0c c0 ff ff    	jne    27fa8 <JS_CallInternal+0x3018>
   2bf9c:	f6 40 10 08          	testb  $0x8,0x10(%rax)
   2bfa0:	0f 85 02 c0 ff ff    	jne    27fa8 <JS_CallInternal+0x3018>
   2bfa6:	48 8b 70 18          	mov    0x18(%rax),%rsi
   2bfaa:	48 39 31             	cmp    %rsi,(%rcx)
   2bfad:	0f 85 f5 bf ff ff    	jne    27fa8 <JS_CallInternal+0x3018>
   2bfb3:	8b 51 10             	mov    0x10(%rcx),%edx
   2bfb6:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   2bfba:	48 c1 e2 04          	shl    $0x4,%rdx
   2bfbe:	48 03 50 20          	add    0x20(%rax),%rdx
   2bfc2:	48 89 d0             	mov    %rdx,%rax
   2bfc5:	48 8b 12             	mov    (%rdx),%rdx
   2bfc8:	48 8b 40 08          	mov    0x8(%rax),%rax
   2bfcc:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2bfcf:	76 04                	jbe    2bfd5 <JS_CallInternal+0x7045>
   2bfd1:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2bfd5:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2bfd9:	49 8d 45 05          	lea    0x5(%r13),%rax
   2bfdd:	48 89 13             	mov    %rdx,(%rbx)
   2bfe0:	4c 8d 68 01          	lea    0x1(%rax),%r13
   2bfe4:	0f b6 00             	movzbl (%rax),%eax
   2bfe7:	48 89 cb             	mov    %rcx,%rbx
   2bfea:	49 89 c2             	mov    %rax,%r10
   2bfed:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2bff1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   2bff8:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   2bfff:	48 c7 43 08 01 00 00 	movq   $0x1,0x8(%rbx)
   2c006:	00 
   2c007:	e9 82 c4 ff ff       	jmp    2848e <JS_CallInternal+0x34fe>
   2c00c:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2c013:	48 8d 7b f0          	lea    -0x10(%rbx),%rdi
   2c017:	41 b9 00 80 00 00    	mov    $0x8000,%r9d
   2c01d:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2c021:	48 8d 43 e0          	lea    -0x20(%rbx),%rax
   2c025:	48 8b 08             	mov    (%rax),%rcx
   2c028:	48 83 eb 30          	sub    $0x30,%rbx
   2c02c:	4c 8b 40 08          	mov    0x8(%rax),%r8
   2c030:	48 8b 33             	mov    (%rbx),%rsi
   2c033:	48 8b 53 08          	mov    0x8(%rbx),%rdx
   2c037:	ff 77 08             	push   0x8(%rdi)
   2c03a:	ff 37                	push   (%rdi)
   2c03c:	4c 89 e7             	mov    %r12,%rdi
   2c03f:	e8 3c 52 00 00       	call   31280 <JS_SetPropertyValue>
   2c044:	41 59                	pop    %r9
   2c046:	41 5a                	pop    %r10
   2c048:	41 89 c7             	mov    %eax,%r15d
   2c04b:	48 8b 43 08          	mov    0x8(%rbx),%rax
   2c04f:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2c052:	76 14                	jbe    2c068 <JS_CallInternal+0x70d8>
   2c054:	48 8b 0b             	mov    (%rbx),%rcx
   2c057:	8b 51 fc             	mov    -0x4(%rcx),%edx
   2c05a:	83 ea 01             	sub    $0x1,%edx
   2c05d:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2c060:	85 d2                	test   %edx,%edx
   2c062:	0f 8e f1 26 00 00    	jle    2e759 <JS_CallInternal+0x97c9>
   2c068:	45 85 ff             	test   %r15d,%r15d
   2c06b:	0f 89 81 dd ff ff    	jns    29df2 <JS_CallInternal+0x4e62>
   2c071:	4d 89 ef             	mov    %r13,%r15
   2c074:	e9 47 96 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2c079:	8b 00                	mov    (%rax),%eax
   2c07b:	25 ff ff ff 03       	and    $0x3ffffff,%eax
   2c080:	0f 85 79 96 ff ff    	jne    256ff <JS_CallInternal+0x76f>
   2c086:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2c08d:	48 83 ec 08          	sub    $0x8,%rsp
   2c091:	31 c9                	xor    %ecx,%ecx
   2c093:	45 31 c9             	xor    %r9d,%r9d
   2c096:	45 31 c0             	xor    %r8d,%r8d
   2c099:	4c 89 e7             	mov    %r12,%rdi
   2c09c:	4c 89 78 30          	mov    %r15,0x30(%rax)
   2c0a0:	48 8b 85 b0 fe ff ff 	mov    -0x150(%rbp),%rax
   2c0a7:	48 8b b0 d8 04 00 00 	mov    0x4d8(%rax),%rsi
   2c0ae:	48 8b 90 e0 04 00 00 	mov    0x4e0(%rax),%rdx
   2c0b5:	6a 00                	push   $0x0
   2c0b7:	e8 14 6a 00 00       	call   32ad0 <build_backtrace>
   2c0bc:	59                   	pop    %rcx
   2c0bd:	5e                   	pop    %rsi
   2c0be:	e9 4e 96 ff ff       	jmp    25711 <JS_CallInternal+0x781>
   2c0c3:	48 8b 8d b8 fe ff ff 	mov    -0x148(%rbp),%rcx
   2c0ca:	48 92                	xchg   %rax,%rdx
   2c0cc:	4c 89 fe             	mov    %r15,%rsi
   2c0cf:	4c 89 e7             	mov    %r12,%rdi
   2c0d2:	49 89 d0             	mov    %rdx,%r8
   2c0d5:	4c 89 ca             	mov    %r9,%rdx
   2c0d8:	4c 89 8d 30 fe ff ff 	mov    %r9,-0x1d0(%rbp)
   2c0df:	4c 89 69 30          	mov    %r13,0x30(%rcx)
   2c0e3:	48 89 c1             	mov    %rax,%rcx
   2c0e6:	e8 d5 3d 00 00       	call   2fec0 <JS_GetPropertyValue>
   2c0eb:	48 89 c1             	mov    %rax,%rcx
   2c0ee:	48 89 d0             	mov    %rdx,%rax
   2c0f1:	83 fa 06             	cmp    $0x6,%edx
   2c0f4:	0f 84 22 2d 00 00    	je     2ee1c <JS_CallInternal+0x9e8c>
   2c0fa:	4c 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9
   2c101:	e9 b3 a1 ff ff       	jmp    262b9 <JS_CallInternal+0x1329>
   2c106:	48 8b bd b8 fe ff ff 	mov    -0x148(%rbp),%rdi
   2c10d:	49 89 d1             	mov    %rdx,%r9
   2c110:	49 89 f2             	mov    %rsi,%r10
   2c113:	48 89 ca             	mov    %rcx,%rdx
   2c116:	49 89 d0             	mov    %rdx,%r8
   2c119:	48 89 c1             	mov    %rax,%rcx
   2c11c:	4c 89 ce             	mov    %r9,%rsi
   2c11f:	4c 89 d2             	mov    %r10,%rdx
   2c122:	4c 89 6f 30          	mov    %r13,0x30(%rdi)
   2c126:	4c 89 e7             	mov    %r12,%rdi
   2c129:	e8 92 3d 00 00       	call   2fec0 <JS_GetPropertyValue>
   2c12e:	48 89 c1             	mov    %rax,%rcx
   2c131:	48 89 d0             	mov    %rdx,%rax
   2c134:	83 fa 06             	cmp    $0x6,%edx
   2c137:	0f 84 ba 2a 00 00    	je     2ebf7 <JS_CallInternal+0x9c67>
   2c13d:	48 89 ca             	mov    %rcx,%rdx
   2c140:	e9 04 a1 ff ff       	jmp    26249 <JS_CallInternal+0x12b9>
   2c145:	41 8b 4d 01          	mov    0x1(%r13),%ecx
   2c149:	49 8d 4c 0d 01       	lea    0x1(%r13,%rcx,1),%rcx
   2c14e:	66 83 78 12 01       	cmpw   $0x1,0x12(%rax)
   2c153:	0f 85 f9 b8 ff ff    	jne    27a52 <JS_CallInternal+0x2ac2>
   2c159:	f6 40 10 08          	testb  $0x8,0x10(%rax)
   2c15d:	0f 85 ef b8 ff ff    	jne    27a52 <JS_CallInternal+0x2ac2>
   2c163:	48 8b 70 18          	mov    0x18(%rax),%rsi
   2c167:	48 39 31             	cmp    %rsi,(%rcx)
   2c16a:	0f 85 e2 b8 ff ff    	jne    27a52 <JS_CallInternal+0x2ac2>
   2c170:	8b 51 10             	mov    0x10(%rcx),%edx
   2c173:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   2c177:	48 c1 e2 04          	shl    $0x4,%rdx
   2c17b:	48 03 50 20          	add    0x20(%rax),%rdx
   2c17f:	48 89 d0             	mov    %rdx,%rax
   2c182:	48 8b 12             	mov    (%rdx),%rdx
   2c185:	48 8b 40 08          	mov    0x8(%rax),%rax
   2c189:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2c18c:	76 04                	jbe    2c192 <JS_CallInternal+0x7202>
   2c18e:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2c192:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2c196:	49 8d 45 05          	lea    0x5(%r13),%rax
   2c19a:	48 89 13             	mov    %rdx,(%rbx)
   2c19d:	4c 8d 68 01          	lea    0x1(%rax),%r13
   2c1a1:	0f b6 00             	movzbl (%rax),%eax
   2c1a4:	48 89 cb             	mov    %rcx,%rbx
   2c1a7:	49 89 c2             	mov    %rax,%r10
   2c1aa:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2c1ae:	66 90                	xchg   %ax,%ax
   2c1b0:	48 92                	xchg   %rax,%rdx
   2c1b2:	4c 89 e7             	mov    %r12,%rdi
   2c1b5:	48 89 c6             	mov    %rax,%rsi
   2c1b8:	e8 63 48 ff ff       	call   20a20 <JS_ToBoolFree>
   2c1bd:	e9 49 cf ff ff       	jmp    2910b <JS_CallInternal+0x417b>
   2c1c2:	8b 10                	mov    (%rax),%edx
   2c1c4:	81 e2 ff ff ff 03    	and    $0x3ffffff,%edx
   2c1ca:	0f 85 6d ee ff ff    	jne    2b03d <JS_CallInternal+0x60ad>
   2c1d0:	48 83 ec 08          	sub    $0x8,%rsp
   2c1d4:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2c1d8:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2c1dc:	4c 89 da             	mov    %r11,%rdx
   2c1df:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2c1e6:	4c 89 9d 30 fe ff ff 	mov    %r11,-0x1d0(%rbp)
   2c1ed:	4c 89 d6             	mov    %r10,%rsi
   2c1f0:	4c 89 e7             	mov    %r12,%rdi
   2c1f3:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   2c1fa:	4c 89 78 30          	mov    %r15,0x30(%rax)
   2c1fe:	68 00 80 00 00       	push   $0x8000
   2c203:	41 53                	push   %r11
   2c205:	41 52                	push   %r10
   2c207:	e8 c4 43 00 00       	call   305d0 <JS_SetPropertyInternal>
   2c20c:	4c 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%r11
   2c213:	48 83 c4 20          	add    $0x20,%rsp
   2c217:	41 83 fb f6          	cmp    $0xfffffff6,%r11d
   2c21b:	76 1a                	jbe    2c237 <JS_CallInternal+0x72a7>
   2c21d:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   2c224:	41 8b 4a fc          	mov    -0x4(%r10),%ecx
   2c228:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2c22b:	41 89 52 fc          	mov    %edx,-0x4(%r10)
   2c22f:	85 d2                	test   %edx,%edx
   2c231:	0f 8e 8e 23 00 00    	jle    2e5c5 <JS_CallInternal+0x9635>
   2c237:	48 83 eb 20          	sub    $0x20,%rbx
   2c23b:	85 c0                	test   %eax,%eax
   2c23d:	0f 89 6e ee ff ff    	jns    2b0b1 <JS_CallInternal+0x6121>
   2c243:	e9 78 94 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2c248:	48 89 c6             	mov    %rax,%rsi
   2c24b:	4c 89 e7             	mov    %r12,%rdi
   2c24e:	e8 cd 47 ff ff       	call   20a20 <JS_ToBoolFree>
   2c253:	e9 ea e4 ff ff       	jmp    2a742 <JS_CallInternal+0x57b2>
   2c258:	31 c9                	xor    %ecx,%ecx
   2c25a:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   2c260:	e9 b9 c4 ff ff       	jmp    2871e <JS_CallInternal+0x378e>
   2c265:	48 c7 85 70 fd ff ff 	movq   $0x0,-0x290(%rbp)
   2c26c:	00 00 00 00 
   2c270:	48 8b b5 20 fe ff ff 	mov    -0x1e0(%rbp),%rsi
   2c277:	31 c9                	xor    %ecx,%ecx
   2c279:	4c 89 e7             	mov    %r12,%rdi
   2c27c:	44 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9d
   2c283:	48 8b 95 e8 fd ff ff 	mov    -0x218(%rbp),%rdx
   2c28a:	48 c7 85 78 fd ff ff 	movq   $0x3,-0x288(%rbp)
   2c291:	03 00 00 00 
   2c295:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   2c29b:	6a 00                	push   $0x0
   2c29d:	41 52                	push   %r10
   2c29f:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   2c2a6:	ff b5 78 fd ff ff    	push   -0x288(%rbp)
   2c2ac:	ff b5 70 fd ff ff    	push   -0x290(%rbp)
   2c2b2:	e8 d9 8c ff ff       	call   24f90 <JS_CallInternal>
   2c2b7:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   2c2be:	48 83 c4 20          	add    $0x20,%rsp
   2c2c2:	48 89 c6             	mov    %rax,%rsi
   2c2c5:	e9 82 c4 ff ff       	jmp    2874c <JS_CallInternal+0x37bc>
   2c2ca:	31 c9                	xor    %ecx,%ecx
   2c2cc:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   2c2d2:	e9 9c c0 ff ff       	jmp    28373 <JS_CallInternal+0x33e3>
   2c2d7:	48 8b b5 f0 fd ff ff 	mov    -0x210(%rbp),%rsi
   2c2de:	45 89 d9             	mov    %r11d,%r9d
   2c2e1:	31 c9                	xor    %ecx,%ecx
   2c2e3:	4c 89 e7             	mov    %r12,%rdi
   2c2e6:	48 8b 95 20 fe ff ff 	mov    -0x1e0(%rbp),%rdx
   2c2ed:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   2c2f3:	48 c7 85 80 fd ff ff 	movq   $0x0,-0x280(%rbp)
   2c2fa:	00 00 00 00 
   2c2fe:	48 c7 85 88 fd ff ff 	movq   $0x3,-0x278(%rbp)
   2c305:	03 00 00 00 
   2c309:	6a 02                	push   $0x2
   2c30b:	41 52                	push   %r10
   2c30d:	4c 89 95 e8 fd ff ff 	mov    %r10,-0x218(%rbp)
   2c314:	ff b5 88 fd ff ff    	push   -0x278(%rbp)
   2c31a:	ff b5 80 fd ff ff    	push   -0x280(%rbp)
   2c320:	44 89 9d 00 fe ff ff 	mov    %r11d,-0x200(%rbp)
   2c327:	e8 64 8c ff ff       	call   24f90 <JS_CallInternal>
   2c32c:	4c 8b 95 e8 fd ff ff 	mov    -0x218(%rbp),%r10
   2c333:	44 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%r11d
   2c33a:	48 83 c4 20          	add    $0x20,%rsp
   2c33e:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   2c345:	48 89 95 10 fe ff ff 	mov    %rdx,-0x1f0(%rbp)
   2c34c:	e9 68 c0 ff ff       	jmp    283b9 <JS_CallInternal+0x3429>
   2c351:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2c358:	48 89 de             	mov    %rbx,%rsi
   2c35b:	4c 89 e7             	mov    %r12,%rdi
   2c35e:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2c362:	e8 89 5b 02 00       	call   51ef0 <js_not_slow>
   2c367:	85 c0                	test   %eax,%eax
   2c369:	0f 84 08 d6 ff ff    	je     29977 <JS_CallInternal+0x49e7>
   2c36f:	4d 89 ef             	mov    %r13,%r15
   2c372:	e9 49 93 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2c377:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   2c37e:	00 00 
   2c380:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2c387:	4c 89 ca             	mov    %r9,%rdx
   2c38a:	4c 89 d1             	mov    %r10,%rcx
   2c38d:	4d 89 f8             	mov    %r15,%r8
   2c390:	4c 89 e7             	mov    %r12,%rdi
   2c393:	4c 89 8d 00 fe ff ff 	mov    %r9,-0x200(%rbp)
   2c39a:	48 89 c6             	mov    %rax,%rsi
   2c39d:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   2c3a4:	4c 89 bd 18 fe ff ff 	mov    %r15,-0x1e8(%rbp)
   2c3ab:	e8 20 78 00 00       	call   33bd0 <JS_CheckBrand>
   2c3b0:	83 f8 ff             	cmp    $0xffffffff,%eax
   2c3b3:	0f 84 e2 32 00 00    	je     2f69b <JS_CallInternal+0xa70b>
   2c3b9:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   2c3c0:	4c 8b 9d 18 fe ff ff 	mov    -0x1e8(%rbp),%r11
   2c3c7:	48 63 c8             	movslq %eax,%rcx
   2c3ca:	4c 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%r9
   2c3d1:	e9 cd c9 ff ff       	jmp    28da3 <JS_CallInternal+0x3e13>
   2c3d6:	48 89 c6             	mov    %rax,%rsi
   2c3d9:	4c 89 e7             	mov    %r12,%rdi
   2c3dc:	e8 3f 46 ff ff       	call   20a20 <JS_ToBoolFree>
   2c3e1:	e9 8d cc ff ff       	jmp    29073 <JS_CallInternal+0x40e3>
   2c3e6:	48 89 c6             	mov    %rax,%rsi
   2c3e9:	4c 89 e7             	mov    %r12,%rdi
   2c3ec:	e8 2f 46 ff ff       	call   20a20 <JS_ToBoolFree>
   2c3f1:	e9 f5 e2 ff ff       	jmp    2a6eb <JS_CallInternal+0x575b>
   2c3f6:	48 89 c6             	mov    %rax,%rsi
   2c3f9:	4c 89 e7             	mov    %r12,%rdi
   2c3fc:	e8 1f 46 ff ff       	call   20a20 <JS_ToBoolFree>
   2c401:	e9 15 cc ff ff       	jmp    2901b <JS_CallInternal+0x408b>
   2c406:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2c40b:	89 c8                	mov    %ecx,%eax
   2c40d:	48 8b 97 48 04 00 00 	mov    0x448(%rdi),%rdx
   2c414:	48 8b 34 c2          	mov    (%rdx,%rax,8),%rsi
   2c418:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2c41b:	83 e8 01             	sub    $0x1,%eax
   2c41e:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2c421:	85 c0                	test   %eax,%eax
   2c423:	0f 8f 6b da ff ff    	jg     29e94 <JS_CallInternal+0x4f04>
   2c429:	4c 89 9d f0 fd ff ff 	mov    %r11,-0x210(%rbp)
   2c430:	e8 6b a5 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2c435:	4c 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%r11
   2c43c:	e9 53 da ff ff       	jmp    29e94 <JS_CallInternal+0x4f04>
   2c441:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2c446:	48 8b 87 48 04 00 00 	mov    0x448(%rdi),%rax
   2c44d:	48 8b 34 c8          	mov    (%rax,%rcx,8),%rsi
   2c451:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2c454:	83 e8 01             	sub    $0x1,%eax
   2c457:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2c45a:	85 c0                	test   %eax,%eax
   2c45c:	0f 8f 2b ca ff ff    	jg     28e8d <JS_CallInternal+0x3efd>
   2c462:	44 89 85 f0 fd ff ff 	mov    %r8d,-0x210(%rbp)
   2c469:	e8 32 a5 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2c46e:	44 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8d
   2c475:	e9 13 ca ff ff       	jmp    28e8d <JS_CallInternal+0x3efd>
   2c47a:	8b 10                	mov    (%rax),%edx
   2c47c:	81 e2 ff ff ff 03    	and    $0x3ffffff,%edx
   2c482:	0f 85 bb c5 ff ff    	jne    28a43 <JS_CallInternal+0x3ab3>
   2c488:	49 8b b4 24 80 01 00 	mov    0x180(%r12),%rsi
   2c48f:	00 
   2c490:	4c 89 e7             	mov    %r12,%rdi
   2c493:	49 8b 94 24 88 01 00 	mov    0x188(%r12),%rdx
   2c49a:	00 
   2c49b:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2c4a1:	e8 7a 34 04 00       	call   6f920 <JS_HasProperty>
   2c4a6:	85 c0                	test   %eax,%eax
   2c4a8:	0f 88 12 92 ff ff    	js     256c0 <JS_CallInternal+0x730>
   2c4ae:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2c4b4:	b8 01 00 00 00       	mov    $0x1,%eax
   2c4b9:	0f 84 97 c5 ff ff    	je     28a56 <JS_CallInternal+0x3ac6>
   2c4bf:	49 8b b4 24 80 01 00 	mov    0x180(%r12),%rsi
   2c4c6:	00 
   2c4c7:	49 8b 94 24 88 01 00 	mov    0x188(%r12),%rdx
   2c4ce:	00 
   2c4cf:	45 31 c0             	xor    %r8d,%r8d
   2c4d2:	4c 89 e7             	mov    %r12,%rdi
   2c4d5:	e8 56 11 02 00       	call   4d630 <JS_DeleteProperty>
   2c4da:	85 c0                	test   %eax,%eax
   2c4dc:	0f 88 de 91 ff ff    	js     256c0 <JS_CallInternal+0x730>
   2c4e2:	0f 95 c0             	setne  %al
   2c4e5:	0f b6 c0             	movzbl %al,%eax
   2c4e8:	e9 69 c5 ff ff       	jmp    28a56 <JS_CallInternal+0x3ac6>
   2c4ed:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2c4f2:	44 89 c8             	mov    %r9d,%eax
   2c4f5:	48 8b 97 48 04 00 00 	mov    0x448(%rdi),%rdx
   2c4fc:	48 8b 34 c2          	mov    (%rdx,%rax,8),%rsi
   2c500:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2c503:	83 e8 01             	sub    $0x1,%eax
   2c506:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2c509:	85 c0                	test   %eax,%eax
   2c50b:	0f 8f ea c5 ff ff    	jg     28afb <JS_CallInternal+0x3b6b>
   2c511:	89 8d f0 fd ff ff    	mov    %ecx,-0x210(%rbp)
   2c517:	e8 84 a4 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2c51c:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   2c522:	e9 d4 c5 ff ff       	jmp    28afb <JS_CallInternal+0x3b6b>
   2c527:	41 f6 42 10 08       	testb  $0x8,0x10(%r10)
   2c52c:	0f 85 d7 e5 ff ff    	jne    2ab09 <JS_CallInternal+0x5b79>
   2c532:	49 8b 49 08          	mov    0x8(%r9),%rcx
   2c536:	49 8b 11             	mov    (%r9),%rdx
   2c539:	48 85 c9             	test   %rcx,%rcx
   2c53c:	0f 84 ef 24 00 00    	je     2ea31 <JS_CallInternal+0x9aa1>
   2c542:	49 8b 43 30          	mov    0x30(%r11),%rax
   2c546:	4c 39 da             	cmp    %r11,%rdx
   2c549:	0f 85 ba e5 ff ff    	jne    2ab09 <JS_CallInternal+0x5b79>
   2c54f:	48 85 c0             	test   %rax,%rax
   2c552:	0f 84 b1 e5 ff ff    	je     2ab09 <JS_CallInternal+0x5b79>
   2c558:	66 83 78 12 01       	cmpw   $0x1,0x12(%rax)
   2c55d:	0f 85 a6 e5 ff ff    	jne    2ab09 <JS_CallInternal+0x5b79>
   2c563:	f6 40 10 08          	testb  $0x8,0x10(%rax)
   2c567:	0f 85 9c e5 ff ff    	jne    2ab09 <JS_CallInternal+0x5b79>
   2c56d:	48 3b 48 18          	cmp    0x18(%rax),%rcx
   2c571:	0f 85 92 e5 ff ff    	jne    2ab09 <JS_CallInternal+0x5b79>
   2c577:	41 8b 51 10          	mov    0x10(%r9),%edx
   2c57b:	48 c1 e2 04          	shl    $0x4,%rdx
   2c57f:	48 03 50 20          	add    0x20(%rax),%rdx
   2c583:	48 89 d0             	mov    %rdx,%rax
   2c586:	48 8b 12             	mov    (%rdx),%rdx
   2c589:	48 8b 40 08          	mov    0x8(%rax),%rax
   2c58d:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2c590:	76 04                	jbe    2c596 <JS_CallInternal+0x7606>
   2c592:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2c596:	49 89 d7             	mov    %rdx,%r15
   2c599:	e9 f0 e5 ff ff       	jmp    2ab8e <JS_CallInternal+0x5bfe>
   2c59e:	66 90                	xchg   %ax,%ax
   2c5a0:	f6 40 10 08          	testb  $0x8,0x10(%rax)
   2c5a4:	0f 85 33 e6 ff ff    	jne    2abdd <JS_CallInternal+0x5c4d>
   2c5aa:	49 39 3a             	cmp    %rdi,(%r10)
   2c5ad:	0f 85 2a e6 ff ff    	jne    2abdd <JS_CallInternal+0x5c4d>
   2c5b3:	41 8b 52 10          	mov    0x10(%r10),%edx
   2c5b7:	83 fa ff             	cmp    $0xffffffff,%edx
   2c5ba:	0f 84 1d e6 ff ff    	je     2abdd <JS_CallInternal+0x5c4d>
   2c5c0:	48 c1 e2 04          	shl    $0x4,%rdx
   2c5c4:	48 03 50 20          	add    0x20(%rax),%rdx
   2c5c8:	48 89 d0             	mov    %rdx,%rax
   2c5cb:	48 8b 12             	mov    (%rdx),%rdx
   2c5ce:	48 8b 48 08          	mov    0x8(%rax),%rcx
   2c5d2:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   2c5d5:	76 04                	jbe    2c5db <JS_CallInternal+0x764b>
   2c5d7:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2c5db:	49 89 d7             	mov    %rdx,%r15
   2c5de:	e9 6e e6 ff ff       	jmp    2ac51 <JS_CallInternal+0x5cc1>
   2c5e3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2c5e8:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2c5ed:	48 8b 87 48 04 00 00 	mov    0x448(%rdi),%rax
   2c5f4:	48 8b 34 c8          	mov    (%rax,%rcx,8),%rsi
   2c5f8:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2c5fb:	83 e8 01             	sub    $0x1,%eax
   2c5fe:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2c601:	85 c0                	test   %eax,%eax
   2c603:	0f 8f 5f cc ff ff    	jg     29268 <JS_CallInternal+0x42d8>
   2c609:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   2c610:	e8 8b a3 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2c615:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   2c61c:	e9 47 cc ff ff       	jmp    29268 <JS_CallInternal+0x42d8>
   2c621:	41 83 ff fa          	cmp    $0xfffffffa,%r15d
   2c625:	0f 8d 3a 22 00 00    	jge    2e865 <JS_CallInternal+0x98d5>
   2c62b:	41 83 ff f8          	cmp    $0xfffffff8,%r15d
   2c62f:	7d 6f                	jge    2c6a0 <JS_CallInternal+0x7710>
   2c631:	83 e8 02             	sub    $0x2,%eax
   2c634:	83 f8 01             	cmp    $0x1,%eax
   2c637:	0f 86 b7 28 00 00    	jbe    2eef4 <JS_CallInternal+0x9f64>
   2c63d:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2c641:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2c645:	b9 01 00 00 00       	mov    $0x1,%ecx
   2c64a:	4c 89 e7             	mov    %r12,%rdi
   2c64d:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2c654:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2c658:	e8 53 69 01 00       	call   42fb0 <JS_ToStringInternal>
   2c65d:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2c664:	49 89 d7             	mov    %rdx,%r15
   2c667:	48 89 d0             	mov    %rdx,%rax
   2c66a:	83 fa 06             	cmp    $0x6,%edx
   2c66d:	0f 84 fc 2c 00 00    	je     2f36f <JS_CallInternal+0xa3df>
   2c673:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   2c677:	83 fe f6             	cmp    $0xfffffff6,%esi
   2c67a:	76 15                	jbe    2c691 <JS_CallInternal+0x7701>
   2c67c:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   2c680:	8b 4f fc             	mov    -0x4(%rdi),%ecx
   2c683:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2c686:	89 57 fc             	mov    %edx,-0x4(%rdi)
   2c689:	85 d2                	test   %edx,%edx
   2c68b:	0f 8e a4 28 00 00    	jle    2ef35 <JS_CallInternal+0x9fa5>
   2c691:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2c698:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2c69c:	48 89 4b f0          	mov    %rcx,-0x10(%rbx)
   2c6a0:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2c6a7:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2c6ab:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2c6af:	41 83 ff f6          	cmp    $0xfffffff6,%r15d
   2c6b3:	76 04                	jbe    2c6b9 <JS_CallInternal+0x7729>
   2c6b5:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2c6b9:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   2c6bd:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   2c6c1:	48 89 c1             	mov    %rax,%rcx
   2c6c4:	4d 89 f8             	mov    %r15,%r8
   2c6c7:	4c 89 e7             	mov    %r12,%rdi
   2c6ca:	4d 89 ef             	mov    %r13,%r15
   2c6cd:	e8 ee 37 00 00       	call   2fec0 <JS_GetPropertyValue>
   2c6d2:	48 89 c1             	mov    %rax,%rcx
   2c6d5:	48 89 d0             	mov    %rdx,%rax
   2c6d8:	83 fa 06             	cmp    $0x6,%edx
   2c6db:	0f 84 df 8f ff ff    	je     256c0 <JS_CallInternal+0x730>
   2c6e1:	48 89 ca             	mov    %rcx,%rdx
   2c6e4:	e9 f0 9a ff ff       	jmp    261d9 <JS_CallInternal+0x1249>
   2c6e9:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2c6f0:	31 d2                	xor    %edx,%edx
   2c6f2:	48 89 de             	mov    %rbx,%rsi
   2c6f5:	4c 89 e7             	mov    %r12,%rdi
   2c6f8:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2c6fc:	e8 cf fd 02 00       	call   5c4d0 <js_eq_slow>
   2c701:	85 c0                	test   %eax,%eax
   2c703:	0f 84 cb cd ff ff    	je     294d4 <JS_CallInternal+0x4544>
   2c709:	4d 89 ef             	mov    %r13,%r15
   2c70c:	e9 af 8f ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2c711:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   2c718:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2c71d:	48 8b 87 48 04 00 00 	mov    0x448(%rdi),%rax
   2c724:	48 8b 34 c8          	mov    (%rax,%rcx,8),%rsi
   2c728:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2c72b:	83 e8 01             	sub    $0x1,%eax
   2c72e:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2c731:	85 c0                	test   %eax,%eax
   2c733:	0f 8f 6a cc ff ff    	jg     293a3 <JS_CallInternal+0x4413>
   2c739:	4c 89 9d 30 fe ff ff 	mov    %r11,-0x1d0(%rbp)
   2c740:	e8 5b a2 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2c745:	4c 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%r11
   2c74c:	e9 52 cc ff ff       	jmp    293a3 <JS_CallInternal+0x4413>
   2c751:	48 8d 35 f1 bd 0a 00 	lea    0xabdf1(%rip),%rsi        # d8549 <_IO_stdin_used+0x549>
   2c758:	4c 89 e7             	mov    %r12,%rdi
   2c75b:	31 c0                	xor    %eax,%eax
   2c75d:	e8 be 70 00 00       	call   33820 <JS_ThrowTypeError>
   2c762:	4c 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8
   2c769:	83 fb f6             	cmp    $0xfffffff6,%ebx
   2c76c:	76 1e                	jbe    2c78c <JS_CallInternal+0x77fc>
   2c76e:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2c775:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2c778:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   2c77e:	83 e8 01             	sub    $0x1,%eax
   2c781:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2c784:	85 c0                	test   %eax,%eax
   2c786:	0f 8e 8d 2a 00 00    	jle    2f219 <JS_CallInternal+0xa289>
   2c78c:	83 bd 00 fe ff ff f6 	cmpl   $0xfffffff6,-0x200(%rbp)
   2c793:	76 1e                	jbe    2c7b3 <JS_CallInternal+0x7823>
   2c795:	48 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%rbx
   2c79c:	8b 43 fc             	mov    -0x4(%rbx),%eax
   2c79f:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2c7a5:	83 e8 01             	sub    $0x1,%eax
   2c7a8:	89 43 fc             	mov    %eax,-0x4(%rbx)
   2c7ab:	85 c0                	test   %eax,%eax
   2c7ad:	0f 8e 88 28 00 00    	jle    2f03b <JS_CallInternal+0xa0ab>
   2c7b3:	ba 06 00 00 00       	mov    $0x6,%edx
   2c7b8:	31 c0                	xor    %eax,%eax
   2c7ba:	e9 d2 ba ff ff       	jmp    28291 <JS_CallInternal+0x3301>
   2c7bf:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2c7c6:	ba 01 00 00 00       	mov    $0x1,%edx
   2c7cb:	48 89 de             	mov    %rbx,%rsi
   2c7ce:	4c 89 e7             	mov    %r12,%rdi
   2c7d1:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2c7d5:	e8 f6 fc 02 00       	call   5c4d0 <js_eq_slow>
   2c7da:	85 c0                	test   %eax,%eax
   2c7dc:	0f 84 0a c8 ff ff    	je     28fec <JS_CallInternal+0x405c>
   2c7e2:	4d 89 ef             	mov    %r13,%r15
   2c7e5:	e9 d6 8e ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2c7ea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   2c7f0:	48 8b 95 b8 fe ff ff 	mov    -0x148(%rbp),%rdx
   2c7f7:	48 8b b5 c0 fe ff ff 	mov    -0x140(%rbp),%rsi
   2c7fe:	48 89 8d a8 fe ff ff 	mov    %rcx,-0x158(%rbp)
   2c805:	48 8b bd b0 fe ff ff 	mov    -0x150(%rbp),%rdi
   2c80c:	48 89 85 c8 fe ff ff 	mov    %rax,-0x138(%rbp)
   2c813:	e8 68 5b ff ff       	call   22380 <close_var_refs>
   2c818:	48 8b 8d a8 fe ff ff 	mov    -0x158(%rbp),%rcx
   2c81f:	48 8b 85 c8 fe ff ff 	mov    -0x138(%rbp),%rax
   2c826:	e9 69 8f ff ff       	jmp    25794 <JS_CallInternal+0x804>
   2c82b:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2c832:	44 89 d2             	mov    %r10d,%edx
   2c835:	48 89 de             	mov    %rbx,%rsi
   2c838:	4c 89 e7             	mov    %r12,%rdi
   2c83b:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2c83f:	e8 1c 51 02 00       	call   51960 <js_unary_arith_slow>
   2c844:	85 c0                	test   %eax,%eax
   2c846:	0f 84 59 cd ff ff    	je     295a5 <JS_CallInternal+0x4615>
   2c84c:	4d 89 ef             	mov    %r13,%r15
   2c84f:	e9 6c 8e ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2c854:	0f 1f 40 00          	nopl   0x0(%rax)
   2c858:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2c85d:	48 89 ce             	mov    %rcx,%rsi
   2c860:	e8 6b 1c ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2c865:	e9 1b 94 ff ff       	jmp    25c85 <JS_CallInternal+0xcf5>
   2c86a:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2c86f:	48 89 c2             	mov    %rax,%rdx
   2c872:	89 8d 00 fe ff ff    	mov    %ecx,-0x200(%rbp)
   2c878:	e8 53 1c ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2c87d:	8b 8d 00 fe ff ff    	mov    -0x200(%rbp),%ecx
   2c883:	e9 d8 97 ff ff       	jmp    26060 <JS_CallInternal+0x10d0>
   2c888:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2c88d:	48 8b b7 48 04 00 00 	mov    0x448(%rdi),%rsi
   2c894:	48 8b 34 ce          	mov    (%rsi,%rcx,8),%rsi
   2c898:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   2c89b:	83 e9 01             	sub    $0x1,%ecx
   2c89e:	89 4e fc             	mov    %ecx,-0x4(%rsi)
   2c8a1:	85 c9                	test   %ecx,%ecx
   2c8a3:	0f 8f b6 98 ff ff    	jg     2615f <JS_CallInternal+0x11cf>
   2c8a9:	48 89 95 10 fe ff ff 	mov    %rdx,-0x1f0(%rbp)
   2c8b0:	48 89 95 30 fe ff ff 	mov    %rdx,-0x1d0(%rbp)
   2c8b7:	e8 e4 a0 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2c8bc:	48 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%rdx
   2c8c3:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2c8ca:	e9 90 98 ff ff       	jmp    2615f <JS_CallInternal+0x11cf>
   2c8cf:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2c8d4:	8b 85 30 fe ff ff    	mov    -0x1d0(%rbp),%eax
   2c8da:	48 8b 97 48 04 00 00 	mov    0x448(%rdi),%rdx
   2c8e1:	48 8b 34 c2          	mov    (%rdx,%rax,8),%rsi
   2c8e5:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2c8e8:	83 e8 01             	sub    $0x1,%eax
   2c8eb:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2c8ee:	85 c0                	test   %eax,%eax
   2c8f0:	0f 8f 5c ee ff ff    	jg     2b752 <JS_CallInternal+0x67c2>
   2c8f6:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2c8fc:	e8 9f a0 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2c901:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2c907:	e9 46 ee ff ff       	jmp    2b752 <JS_CallInternal+0x67c2>
   2c90c:	41 83 ff f6          	cmp    $0xfffffff6,%r15d
   2c910:	76 13                	jbe    2c925 <JS_CallInternal+0x7995>
   2c912:	41 8b 42 fc          	mov    -0x4(%r10),%eax
   2c916:	83 e8 01             	sub    $0x1,%eax
   2c919:	41 89 42 fc          	mov    %eax,-0x4(%r10)
   2c91d:	85 c0                	test   %eax,%eax
   2c91f:	0f 8e 04 23 00 00    	jle    2ec29 <JS_CallInternal+0x9c99>
   2c925:	b8 01 00 00 00       	mov    $0x1,%eax
   2c92a:	e9 09 c6 ff ff       	jmp    28f38 <JS_CallInternal+0x3fa8>
   2c92f:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
   2c934:	e9 09 97 ff ff       	jmp    26042 <JS_CallInternal+0x10b2>
   2c939:	45 31 e4             	xor    %r12d,%r12d
   2c93c:	e9 65 ea ff ff       	jmp    2b3a6 <JS_CallInternal+0x6416>
   2c941:	41 83 f8 f6          	cmp    $0xfffffff6,%r8d
   2c945:	76 13                	jbe    2c95a <JS_CallInternal+0x79ca>
   2c947:	41 8b 42 fc          	mov    -0x4(%r10),%eax
   2c94b:	83 e8 01             	sub    $0x1,%eax
   2c94e:	41 89 42 fc          	mov    %eax,-0x4(%r10)
   2c952:	85 c0                	test   %eax,%eax
   2c954:	0f 8e 0a 24 00 00    	jle    2ed64 <JS_CallInternal+0x9dd4>
   2c95a:	45 31 ff             	xor    %r15d,%r15d
   2c95d:	e9 27 c6 ff ff       	jmp    28f89 <JS_CallInternal+0x3ff9>
   2c962:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2c967:	89 c0                	mov    %eax,%eax
   2c969:	48 8b 97 48 04 00 00 	mov    0x448(%rdi),%rdx
   2c970:	48 8b 34 c2          	mov    (%rdx,%rax,8),%rsi
   2c974:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2c977:	83 e8 01             	sub    $0x1,%eax
   2c97a:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2c97d:	85 c0                	test   %eax,%eax
   2c97f:	0f 8f 1e c4 ff ff    	jg     28da3 <JS_CallInternal+0x3e13>
   2c985:	4c 89 95 f0 fd ff ff 	mov    %r10,-0x210(%rbp)
   2c98c:	4c 89 9d f8 fd ff ff 	mov    %r11,-0x208(%rbp)
   2c993:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2c99a:	4c 89 8d 10 fe ff ff 	mov    %r9,-0x1f0(%rbp)
   2c9a1:	e8 fa 9f fe ff       	call   169a0 <JS_FreeAtomStruct>
   2c9a6:	4c 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%r10
   2c9ad:	4c 8b 9d f8 fd ff ff 	mov    -0x208(%rbp),%r11
   2c9b4:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2c9bb:	4c 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%r9
   2c9c2:	e9 dc c3 ff ff       	jmp    28da3 <JS_CallInternal+0x3e13>
   2c9c7:	48 83 ec 08          	sub    $0x8,%rsp
   2c9cb:	48 8d 43 f0          	lea    -0x10(%rbx),%rax
   2c9cf:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   2c9d5:	50                   	push   %rax
   2c9d6:	e9 c3 f3 ff ff       	jmp    2bd9e <JS_CallInternal+0x6e0e>
   2c9db:	49 83 c7 01          	add    $0x1,%r15
   2c9df:	e9 dc 8c ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2c9e4:	48 8d 35 80 bb 0a 00 	lea    0xabb80(%rip),%rsi        # d856b <_IO_stdin_used+0x56b>
   2c9eb:	4c 89 e7             	mov    %r12,%rdi
   2c9ee:	31 c0                	xor    %eax,%eax
   2c9f0:	4d 89 ef             	mov    %r13,%r15
   2c9f3:	e8 08 90 00 00       	call   35a00 <JS_ThrowInternalError>
   2c9f8:	e9 c3 8c ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2c9fd:	49 8b 72 08          	mov    0x8(%r10),%rsi
   2ca01:	83 fe f6             	cmp    $0xfffffff6,%esi
   2ca04:	76 14                	jbe    2ca1a <JS_CallInternal+0x7a8a>
   2ca06:	49 8b 3a             	mov    (%r10),%rdi
   2ca09:	8b 57 fc             	mov    -0x4(%rdi),%edx
   2ca0c:	83 ea 01             	sub    $0x1,%edx
   2ca0f:	89 57 fc             	mov    %edx,-0x4(%rdi)
   2ca12:	85 d2                	test   %edx,%edx
   2ca14:	0f 8e 38 1f 00 00    	jle    2e952 <JS_CallInternal+0x99c2>
   2ca1a:	49 c7 02 00 00 00 00 	movq   $0x0,(%r10)
   2ca21:	49 c7 42 08 03 00 00 	movq   $0x3,0x8(%r10)
   2ca28:	00 
   2ca29:	45 85 c0             	test   %r8d,%r8d
   2ca2c:	0f 88 8e 8c ff ff    	js     256c0 <JS_CallInternal+0x730>
   2ca32:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2ca35:	76 11                	jbe    2ca48 <JS_CallInternal+0x7ab8>
   2ca37:	8b 51 fc             	mov    -0x4(%rcx),%edx
   2ca3a:	83 ea 01             	sub    $0x1,%edx
   2ca3d:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2ca40:	85 d2                	test   %edx,%edx
   2ca42:	0f 8e 47 29 00 00    	jle    2f38f <JS_CallInternal+0xa3ff>
   2ca48:	44 8b 95 dc fe ff ff 	mov    -0x124(%rbp),%r10d
   2ca4f:	31 d2                	xor    %edx,%edx
   2ca51:	be 03 00 00 00       	mov    $0x3,%esi
   2ca56:	45 85 d2             	test   %r10d,%r10d
   2ca59:	0f 95 c2             	setne  %dl
   2ca5c:	31 ff                	xor    %edi,%edi
   2ca5e:	e9 36 d1 ff ff       	jmp    29b99 <JS_CallInternal+0x4c09>
   2ca63:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2ca6a:	44 89 d2             	mov    %r10d,%edx
   2ca6d:	48 89 de             	mov    %rbx,%rsi
   2ca70:	4c 89 e7             	mov    %r12,%rdi
   2ca73:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2ca77:	e8 e4 4e 02 00       	call   51960 <js_unary_arith_slow>
   2ca7c:	85 c0                	test   %eax,%eax
   2ca7e:	0f 84 61 cb ff ff    	je     295e5 <JS_CallInternal+0x4655>
   2ca84:	4d 89 ef             	mov    %r13,%r15
   2ca87:	e9 34 8c ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2ca8c:	0f 1f 40 00          	nopl   0x0(%rax)
   2ca90:	48 8b b5 c0 fe ff ff 	mov    -0x140(%rbp),%rsi
   2ca97:	48 8b 46 30          	mov    0x30(%rsi),%rax
   2ca9b:	48 01 c8             	add    %rcx,%rax
   2ca9e:	8b 48 04             	mov    0x4(%rax),%ecx
   2caa1:	f6 00 08             	testb  $0x8,(%rax)
   2caa4:	0f 85 aa 2a 00 00    	jne    2f554 <JS_CallInternal+0xa5c4>
   2caaa:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2cab1:	48 83 ec 08          	sub    $0x8,%rsp
   2cab5:	41 83 ea 37          	sub    $0x37,%r10d
   2cab9:	4d 8b 84 24 80 01 00 	mov    0x180(%r12),%r8
   2cac0:	00 
   2cac1:	4d 8b 8c 24 88 01 00 	mov    0x188(%r12),%r9
   2cac8:	00 
   2cac9:	49 8b b4 24 80 01 00 	mov    0x180(%r12),%rsi
   2cad0:	00 
   2cad1:	4c 89 e7             	mov    %r12,%rdi
   2cad4:	4c 89 78 30          	mov    %r15,0x30(%rax)
   2cad8:	49 8b 94 24 88 01 00 	mov    0x188(%r12),%rdx
   2cadf:	00 
   2cae0:	41 52                	push   %r10
   2cae2:	e8 99 2d 00 00       	call   2f880 <JS_GetPropertyInternal>
   2cae7:	48 89 03             	mov    %rax,(%rbx)
   2caea:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2caee:	58                   	pop    %rax
   2caef:	5a                   	pop    %rdx
   2caf0:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   2caf4:	0f 85 e9 91 ff ff    	jne    25ce3 <JS_CallInternal+0xd53>
   2cafa:	e9 c1 8b ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2caff:	b9 03 00 00 00       	mov    $0x3,%ecx
   2cb04:	45 31 ff             	xor    %r15d,%r15d
   2cb07:	e9 45 e1 ff ff       	jmp    2ac51 <JS_CallInternal+0x5cc1>
   2cb0c:	8b 02                	mov    (%rdx),%eax
   2cb0e:	25 ff ff ff 03       	and    $0x3ffffff,%eax
   2cb13:	0f 85 06 dd ff ff    	jne    2a81f <JS_CallInternal+0x588f>
   2cb19:	49 8b b4 24 80 01 00 	mov    0x180(%r12),%rsi
   2cb20:	00 
   2cb21:	4c 89 e7             	mov    %r12,%rdi
   2cb24:	49 8b 94 24 88 01 00 	mov    0x188(%r12),%rdx
   2cb2b:	00 
   2cb2c:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2cb32:	e8 e9 2d 04 00       	call   6f920 <JS_HasProperty>
   2cb37:	85 c0                	test   %eax,%eax
   2cb39:	0f 88 81 8b ff ff    	js     256c0 <JS_CallInternal+0x730>
   2cb3f:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2cb45:	0f 84 e3 19 00 00    	je     2e52e <JS_CallInternal+0x959e>
   2cb4b:	49 8b 94 24 88 01 00 	mov    0x188(%r12),%rdx
   2cb52:	00 
   2cb53:	49 8b 84 24 80 01 00 	mov    0x180(%r12),%rax
   2cb5a:	00 
   2cb5b:	83 fa f6             	cmp    $0xfffffff6,%edx
   2cb5e:	76 04                	jbe    2cb64 <JS_CallInternal+0x7bd4>
   2cb60:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2cb64:	48 89 03             	mov    %rax,(%rbx)
   2cb67:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2cb6b:	e9 fe dc ff ff       	jmp    2a86e <JS_CallInternal+0x58de>
   2cb70:	b8 03 00 00 00       	mov    $0x3,%eax
   2cb75:	45 31 ff             	xor    %r15d,%r15d
   2cb78:	e9 11 e0 ff ff       	jmp    2ab8e <JS_CallInternal+0x5bfe>
   2cb7d:	41 f6 42 10 08       	testb  $0x8,0x10(%r10)
   2cb82:	0f 85 4c d5 ff ff    	jne    2a0d4 <JS_CallInternal+0x5144>
   2cb88:	49 8b 4a 18          	mov    0x18(%r10),%rcx
   2cb8c:	48 39 08             	cmp    %rcx,(%rax)
   2cb8f:	0f 85 3f d5 ff ff    	jne    2a0d4 <JS_CallInternal+0x5144>
   2cb95:	48 83 78 08 00       	cmpq   $0x0,0x8(%rax)
   2cb9a:	0f 85 34 d5 ff ff    	jne    2a0d4 <JS_CallInternal+0x5144>
   2cba0:	8b 50 10             	mov    0x10(%rax),%edx
   2cba3:	8b 79 18             	mov    0x18(%rcx),%edi
   2cba6:	48 8d 34 d5 00 00 00 	lea    0x0(,%rdx,8),%rsi
   2cbad:	00 
   2cbae:	48 8d 74 be 3c       	lea    0x3c(%rsi,%rdi,4),%rsi
   2cbb3:	0f b6 4c 31 03       	movzbl 0x3(%rcx,%rsi,1),%ecx
   2cbb8:	c0 e9 02             	shr    $0x2,%cl
   2cbbb:	83 e1 3a             	and    $0x3a,%ecx
   2cbbe:	80 f9 02             	cmp    $0x2,%cl
   2cbc1:	0f 85 0d d5 ff ff    	jne    2a0d4 <JS_CallInternal+0x5144>
   2cbc7:	48 89 d0             	mov    %rdx,%rax
   2cbca:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2cbcf:	4c 89 e7             	mov    %r12,%rdi
   2cbd2:	48 83 eb 20          	sub    $0x20,%rbx
   2cbd6:	48 c1 e0 04          	shl    $0x4,%rax
   2cbda:	49 03 42 20          	add    0x20(%r10),%rax
   2cbde:	4c 89 95 30 fe ff ff 	mov    %r10,-0x1d0(%rbp)
   2cbe5:	49 83 c5 05          	add    $0x5,%r13
   2cbe9:	48 8b 30             	mov    (%rax),%rsi
   2cbec:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2cbf0:	0f 11 00             	movups %xmm0,(%rax)
   2cbf3:	4c 89 9d 10 fe ff ff 	mov    %r11,-0x1f0(%rbp)
   2cbfa:	e8 51 1a ff ff       	call   1e650 <JS_FreeValue>
   2cbff:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2cc06:	48 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%rdx
   2cc0d:	4c 89 e7             	mov    %r12,%rdi
   2cc10:	48 89 c6             	mov    %rax,%rsi
   2cc13:	e8 38 1a ff ff       	call   1e650 <JS_FreeValue>
   2cc18:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2cc1d:	49 89 c2             	mov    %rax,%r10
   2cc20:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2cc24:	ff e0                	jmp    *%rax
   2cc26:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   2cc2d:	00 00 00 
   2cc30:	48 89 ce             	mov    %rcx,%rsi
   2cc33:	8b 49 ac             	mov    -0x54(%rcx),%ecx
   2cc36:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2cc3c:	83 e9 01             	sub    $0x1,%ecx
   2cc3f:	89 4e ac             	mov    %ecx,-0x54(%rsi)
   2cc42:	0f 85 71 d8 ff ff    	jne    2a4b9 <JS_CallInternal+0x5529>
   2cc48:	80 bf a0 04 00 00 02 	cmpb   $0x2,0x4a0(%rdi)
   2cc4f:	0f 84 64 d8 ff ff    	je     2a4b9 <JS_CallInternal+0x5529>
   2cc55:	48 83 ee 50          	sub    $0x50,%rsi
   2cc59:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2cc60:	e8 7b 56 ff ff       	call   222e0 <async_func_free.part.0>
   2cc65:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   2cc6c:	4a 8d 14 fd 00 00 00 	lea    0x0(,%r15,8),%rdx
   2cc73:	00 
   2cc74:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2cc7b:	48 03 56 28          	add    0x28(%rsi),%rdx
   2cc7f:	e9 35 d8 ff ff       	jmp    2a4b9 <JS_CallInternal+0x5529>
   2cc84:	0f b6 d0             	movzbl %al,%edx
   2cc87:	48 8d 35 a1 b8 0a 00 	lea    0xab8a1(%rip),%rsi        # d852f <_IO_stdin_used+0x52f>
   2cc8e:	4c 89 e7             	mov    %r12,%rdi
   2cc91:	31 c0                	xor    %eax,%eax
   2cc93:	e8 68 8d 00 00       	call   35a00 <JS_ThrowInternalError>
   2cc98:	e9 23 8a ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2cc9d:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cca2:	4c 89 d6             	mov    %r10,%rsi
   2cca5:	4c 89 fa             	mov    %r15,%rdx
   2cca8:	e8 23 18 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2ccad:	e9 60 9a ff ff       	jmp    26712 <JS_CallInternal+0x1782>
   2ccb2:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2ccb7:	48 89 c2             	mov    %rax,%rdx
   2ccba:	48 89 ce             	mov    %rcx,%rsi
   2ccbd:	4c 89 8d 30 fe ff ff 	mov    %r9,-0x1d0(%rbp)
   2ccc4:	e8 07 18 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2ccc9:	4c 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9
   2ccd0:	e9 b6 99 ff ff       	jmp    2668b <JS_CallInternal+0x16fb>
   2ccd5:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2ccda:	48 89 ce             	mov    %rcx,%rsi
   2ccdd:	e8 ee 17 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cce2:	e9 54 bc ff ff       	jmp    2893b <JS_CallInternal+0x39ab>
   2cce7:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2ccec:	48 89 c2             	mov    %rax,%rdx
   2ccef:	48 89 ce             	mov    %rcx,%rsi
   2ccf2:	44 89 85 30 fe ff ff 	mov    %r8d,-0x1d0(%rbp)
   2ccf9:	e8 d2 17 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2ccfe:	44 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8d
   2cd05:	e9 f1 f0 ff ff       	jmp    2bdfb <JS_CallInternal+0x6e6b>
   2cd0a:	45 31 c0             	xor    %r8d,%r8d
   2cd0d:	48 92                	xchg   %rax,%rdx
   2cd0f:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cd14:	44 89 85 30 fe ff ff 	mov    %r8d,-0x1d0(%rbp)
   2cd1b:	48 89 c6             	mov    %rax,%rsi
   2cd1e:	e8 ad 17 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cd23:	44 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8d
   2cd2a:	e9 e9 f0 ff ff       	jmp    2be18 <JS_CallInternal+0x6e88>
   2cd2f:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   2cd36:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cd3b:	48 89 d0             	mov    %rdx,%rax
   2cd3e:	4c 89 ca             	mov    %r9,%rdx
   2cd41:	48 89 c6             	mov    %rax,%rsi
   2cd44:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2cd4b:	44 89 85 10 fe ff ff 	mov    %r8d,-0x1f0(%rbp)
   2cd52:	e8 79 17 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cd57:	48 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%rax
   2cd5e:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2cd65:	44 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%r8d
   2cd6c:	e9 64 9d ff ff       	jmp    26ad5 <JS_CallInternal+0x1b45>
   2cd71:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cd76:	4c 89 d6             	mov    %r10,%rsi
   2cd79:	4c 89 fa             	mov    %r15,%rdx
   2cd7c:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2cd83:	e8 48 17 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cd88:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2cd8f:	e9 4c c0 ff ff       	jmp    28de0 <JS_CallInternal+0x3e50>
   2cd94:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cd99:	4c 89 c2             	mov    %r8,%rdx
   2cd9c:	e8 2f 17 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cda1:	e9 58 be ff ff       	jmp    28bfe <JS_CallInternal+0x3c6e>
   2cda6:	48 89 fe             	mov    %rdi,%rsi
   2cda9:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cdae:	e8 1d 17 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cdb3:	e9 38 bb ff ff       	jmp    288f0 <JS_CallInternal+0x3960>
   2cdb8:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cdbd:	48 89 ce             	mov    %rcx,%rsi
   2cdc0:	e8 0b 17 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cdc5:	e9 5a d8 ff ff       	jmp    2a624 <JS_CallInternal+0x5694>
   2cdca:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cdcf:	48 89 ce             	mov    %rcx,%rsi
   2cdd2:	e8 f9 16 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cdd7:	e9 fb d7 ff ff       	jmp    2a5d7 <JS_CallInternal+0x5647>
   2cddc:	48 89 fe             	mov    %rdi,%rsi
   2cddf:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cde4:	e8 e7 16 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cde9:	e9 f2 da ff ff       	jmp    2a8e0 <JS_CallInternal+0x5950>
   2cdee:	48 89 fe             	mov    %rdi,%rsi
   2cdf1:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cdf6:	e8 d5 16 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cdfb:	e9 cd db ff ff       	jmp    2a9cd <JS_CallInternal+0x5a3d>
   2ce00:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2ce05:	48 89 ce             	mov    %rcx,%rsi
   2ce08:	e8 c3 16 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2ce0d:	e9 d6 d4 ff ff       	jmp    2a2e8 <JS_CallInternal+0x5358>
   2ce12:	48 89 fe             	mov    %rdi,%rsi
   2ce15:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2ce1a:	e8 b1 16 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2ce1f:	e9 9c d8 ff ff       	jmp    2a6c0 <JS_CallInternal+0x5730>
   2ce24:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2ce29:	48 89 ce             	mov    %rcx,%rsi
   2ce2c:	e8 9f 16 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2ce31:	e9 f8 da ff ff       	jmp    2a92e <JS_CallInternal+0x599e>
   2ce36:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2ce3b:	48 89 ce             	mov    %rcx,%rsi
   2ce3e:	e8 8d 16 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2ce43:	e9 d4 db ff ff       	jmp    2aa1c <JS_CallInternal+0x5a8c>
   2ce48:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2ce4d:	48 89 c2             	mov    %rax,%rdx
   2ce50:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2ce57:	e8 74 16 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2ce5c:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2ce63:	e9 07 de ff ff       	jmp    2ac6f <JS_CallInternal+0x5cdf>
   2ce68:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2ce6d:	4c 89 d6             	mov    %r10,%rsi
   2ce70:	4c 89 da             	mov    %r11,%rdx
   2ce73:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2ce79:	e8 52 16 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2ce7e:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2ce84:	e9 b7 d2 ff ff       	jmp    2a140 <JS_CallInternal+0x51b0>
   2ce89:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2ce8e:	48 89 ce             	mov    %rcx,%rsi
   2ce91:	e8 3a 16 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2ce96:	e9 13 d5 ff ff       	jmp    2a3ae <JS_CallInternal+0x541e>
   2ce9b:	48 89 fe             	mov    %rdi,%rsi
   2ce9e:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cea3:	e8 28 16 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cea8:	e9 a6 d4 ff ff       	jmp    2a353 <JS_CallInternal+0x53c3>
   2cead:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2ceb2:	48 89 f2             	mov    %rsi,%rdx
   2ceb5:	48 89 ce             	mov    %rcx,%rsi
   2ceb8:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2cebf:	e8 0c 16 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cec4:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2cecb:	e9 4a e3 ff ff       	jmp    2b21a <JS_CallInternal+0x628a>
   2ced0:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2ced5:	48 89 c2             	mov    %rax,%rdx
   2ced8:	e8 f3 15 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cedd:	e9 cd ad ff ff       	jmp    27caf <JS_CallInternal+0x2d1f>
   2cee2:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cee7:	48 89 c2             	mov    %rax,%rdx
   2ceea:	e8 e1 15 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2ceef:	e9 63 ae ff ff       	jmp    27d57 <JS_CallInternal+0x2dc7>
   2cef4:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cef9:	48 89 c2             	mov    %rax,%rdx
   2cefc:	e8 cf 15 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cf01:	e9 fd ad ff ff       	jmp    27d03 <JS_CallInternal+0x2d73>
   2cf06:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cf0b:	48 89 c2             	mov    %rax,%rdx
   2cf0e:	e8 bd 15 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cf13:	e9 91 ae ff ff       	jmp    27da9 <JS_CallInternal+0x2e19>
   2cf18:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cf1d:	48 89 c2             	mov    %rax,%rdx
   2cf20:	e8 ab 15 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cf25:	e9 83 aa ff ff       	jmp    279ad <JS_CallInternal+0x2a1d>
   2cf2a:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cf2f:	48 89 c2             	mov    %rax,%rdx
   2cf32:	e8 99 15 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cf37:	e9 d7 ac ff ff       	jmp    27c13 <JS_CallInternal+0x2c83>
   2cf3c:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cf41:	48 89 c2             	mov    %rax,%rdx
   2cf44:	e8 87 15 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cf49:	e9 71 ac ff ff       	jmp    27bbf <JS_CallInternal+0x2c2f>
   2cf4e:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cf53:	48 89 c2             	mov    %rax,%rdx
   2cf56:	48 89 ce             	mov    %rcx,%rsi
   2cf59:	e8 72 15 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cf5e:	e9 f8 ac ff ff       	jmp    27c5b <JS_CallInternal+0x2ccb>
   2cf63:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cf68:	48 89 c2             	mov    %rax,%rdx
   2cf6b:	e8 60 15 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cf70:	e9 9c a9 ff ff       	jmp    27911 <JS_CallInternal+0x2981>
   2cf75:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cf7a:	48 89 c2             	mov    %rax,%rdx
   2cf7d:	48 89 ce             	mov    %rcx,%rsi
   2cf80:	e8 4b 15 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cf85:	e9 cf a9 ff ff       	jmp    27959 <JS_CallInternal+0x29c9>
   2cf8a:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cf8f:	48 89 c2             	mov    %rax,%rdx
   2cf92:	48 89 ce             	mov    %rcx,%rsi
   2cf95:	e8 36 15 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cf9a:	e9 ce ab ff ff       	jmp    27b6d <JS_CallInternal+0x2bdd>
   2cf9f:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cfa4:	48 89 c2             	mov    %rax,%rdx
   2cfa7:	48 89 ce             	mov    %rcx,%rsi
   2cfaa:	e8 21 15 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cfaf:	e9 35 ab ff ff       	jmp    27ae9 <JS_CallInternal+0x2b59>
   2cfb4:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cfb9:	48 89 ce             	mov    %rcx,%rsi
   2cfbc:	e8 0f 15 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cfc1:	e9 c3 d5 ff ff       	jmp    2a589 <JS_CallInternal+0x55f9>
   2cfc6:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cfcb:	4c 89 ca             	mov    %r9,%rdx
   2cfce:	4c 89 fe             	mov    %r15,%rsi
   2cfd1:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   2cfd8:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2cfdf:	e8 ec 14 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cfe4:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   2cfeb:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2cff2:	e9 db 92 ff ff       	jmp    262d2 <JS_CallInternal+0x1342>
   2cff7:	48 89 f2             	mov    %rsi,%rdx
   2cffa:	48 89 fe             	mov    %rdi,%rsi
   2cffd:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d002:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2d009:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2d010:	4c 89 85 30 fe ff ff 	mov    %r8,-0x1d0(%rbp)
   2d017:	e8 b4 14 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d01c:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2d023:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2d02a:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2d031:	e9 f2 94 ff ff       	jmp    26528 <JS_CallInternal+0x1598>
   2d036:	48 89 f2             	mov    %rsi,%rdx
   2d039:	48 89 fe             	mov    %rdi,%rsi
   2d03c:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d041:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2d048:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2d04f:	4c 89 85 30 fe ff ff 	mov    %r8,-0x1d0(%rbp)
   2d056:	e8 75 14 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d05b:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2d062:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2d069:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2d070:	e9 d1 94 ff ff       	jmp    26546 <JS_CallInternal+0x15b6>
   2d075:	48 89 f2             	mov    %rsi,%rdx
   2d078:	48 89 fe             	mov    %rdi,%rsi
   2d07b:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d080:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2d087:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2d08e:	e8 3d 14 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d093:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2d09a:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2d0a1:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2d0a8:	e9 5e 94 ff ff       	jmp    2650b <JS_CallInternal+0x157b>
   2d0ad:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d0b2:	48 89 c2             	mov    %rax,%rdx
   2d0b5:	48 89 ce             	mov    %rcx,%rsi
   2d0b8:	4c 89 8d 30 fe ff ff 	mov    %r9,-0x1d0(%rbp)
   2d0bf:	e8 0c 14 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d0c4:	4c 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9
   2d0cb:	e9 9e 95 ff ff       	jmp    2666e <JS_CallInternal+0x16de>
   2d0d0:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d0d5:	48 89 f2             	mov    %rsi,%rdx
   2d0d8:	48 89 ce             	mov    %rcx,%rsi
   2d0db:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2d0e2:	e8 e9 13 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d0e7:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2d0ee:	e9 69 e0 ff ff       	jmp    2b15c <JS_CallInternal+0x61cc>
   2d0f3:	8b 9d 30 fe ff ff    	mov    -0x1d0(%rbp),%ebx
   2d0f9:	85 db                	test   %ebx,%ebx
   2d0fb:	74 43                	je     2d140 <JS_CallInternal+0x81b0>
   2d0fd:	4c 89 c3             	mov    %r8,%rbx
   2d100:	4f 8d 2c 01          	lea    (%r9,%r8,1),%r13
   2d104:	4d 89 c6             	mov    %r8,%r14
   2d107:	eb 09                	jmp    2d112 <JS_CallInternal+0x8182>
   2d109:	48 83 c3 10          	add    $0x10,%rbx
   2d10d:	4c 39 eb             	cmp    %r13,%rbx
   2d110:	74 2b                	je     2d13d <JS_CallInternal+0x81ad>
   2d112:	48 8b 43 08          	mov    0x8(%rbx),%rax
   2d116:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2d119:	76 ee                	jbe    2d109 <JS_CallInternal+0x8179>
   2d11b:	48 8b 0b             	mov    (%rbx),%rcx
   2d11e:	8b 51 fc             	mov    -0x4(%rcx),%edx
   2d121:	83 ea 01             	sub    $0x1,%edx
   2d124:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2d127:	85 d2                	test   %edx,%edx
   2d129:	7f de                	jg     2d109 <JS_CallInternal+0x8179>
   2d12b:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d130:	48 89 c2             	mov    %rax,%rdx
   2d133:	48 89 ce             	mov    %rcx,%rsi
   2d136:	e8 95 13 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d13b:	eb cc                	jmp    2d109 <JS_CallInternal+0x8179>
   2d13d:	4d 89 f0             	mov    %r14,%r8
   2d140:	4c 89 c3             	mov    %r8,%rbx
   2d143:	e9 78 85 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2d148:	48 89 fe             	mov    %rdi,%rsi
   2d14b:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d150:	e8 7b 13 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d155:	e9 93 b3 ff ff       	jmp    284ed <JS_CallInternal+0x355d>
   2d15a:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d15f:	48 89 ce             	mov    %rcx,%rsi
   2d162:	e8 69 13 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d167:	e9 cc b3 ff ff       	jmp    28538 <JS_CallInternal+0x35a8>
   2d16c:	48 83 ec 08          	sub    $0x8,%rsp
   2d170:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   2d176:	4c 89 e7             	mov    %r12,%rdi
   2d179:	49 89 d1             	mov    %rdx,%r9
   2d17c:	6a 00                	push   $0x0
   2d17e:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2d185:	4c 89 ee             	mov    %r13,%rsi
   2d188:	e8 f3 26 00 00       	call   2f880 <JS_GetPropertyInternal>
   2d18d:	5f                   	pop    %rdi
   2d18e:	41 58                	pop    %r8
   2d190:	48 89 c1             	mov    %rax,%rcx
   2d193:	48 89 d0             	mov    %rdx,%rax
   2d196:	83 fa 06             	cmp    $0x6,%edx
   2d199:	0f 85 48 89 ff ff    	jne    25ae7 <JS_CallInternal+0xb57>
   2d19f:	e9 1c 85 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2d1a4:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d1a9:	48 89 c2             	mov    %rax,%rdx
   2d1ac:	48 89 ce             	mov    %rcx,%rsi
   2d1af:	e8 1c 13 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d1b4:	e9 a4 c8 ff ff       	jmp    29a5d <JS_CallInternal+0x4acd>
   2d1b9:	48 89 f2             	mov    %rsi,%rdx
   2d1bc:	48 89 fe             	mov    %rdi,%rsi
   2d1bf:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d1c4:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2d1cb:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2d1d2:	e8 f9 12 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d1d7:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2d1de:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2d1e5:	e9 d9 db ff ff       	jmp    2adc3 <JS_CallInternal+0x5e33>
   2d1ea:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d1ef:	4c 89 ca             	mov    %r9,%rdx
   2d1f2:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   2d1f9:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   2d200:	4c 89 9d 08 fe ff ff 	mov    %r11,-0x1f8(%rbp)
   2d207:	e8 c4 12 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d20c:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   2d213:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   2d21a:	e9 a8 bb ff ff       	jmp    28dc7 <JS_CallInternal+0x3e37>
   2d21f:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d224:	48 89 ce             	mov    %rcx,%rsi
   2d227:	e8 a4 12 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d22c:	e9 72 ae ff ff       	jmp    280a3 <JS_CallInternal+0x3113>
   2d231:	48 89 fe             	mov    %rdi,%rsi
   2d234:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d239:	e8 92 12 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d23e:	e9 11 ae ff ff       	jmp    28054 <JS_CallInternal+0x30c4>
   2d243:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2d24a:	41 8b 49 04          	mov    0x4(%r9),%ecx
   2d24e:	4c 89 e7             	mov    %r12,%rdi
   2d251:	4c 89 8d 30 fe ff ff 	mov    %r9,-0x1d0(%rbp)
   2d258:	49 8b b4 24 80 01 00 	mov    0x180(%r12),%rsi
   2d25f:	00 
   2d260:	49 8b 94 24 88 01 00 	mov    0x188(%r12),%rdx
   2d267:	00 
   2d268:	4c 89 78 30          	mov    %r15,0x30(%rax)
   2d26c:	e8 af 26 04 00       	call   6f920 <JS_HasProperty>
   2d271:	85 c0                	test   %eax,%eax
   2d273:	0f 88 47 84 ff ff    	js     256c0 <JS_CallInternal+0x730>
   2d279:	4c 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9
   2d280:	0f 85 d2 01 00 00    	jne    2d458 <JS_CallInternal+0x84c8>
   2d286:	49 8b 44 24 10       	mov    0x10(%r12),%rax
   2d28b:	48 8b 80 f0 04 00 00 	mov    0x4f0(%rax),%rax
   2d292:	48 85 c0             	test   %rax,%rax
   2d295:	0f 84 bd 01 00 00    	je     2d458 <JS_CallInternal+0x84c8>
   2d29b:	f6 40 3c 01          	testb  $0x1,0x3c(%rax)
   2d29f:	0f 84 b3 01 00 00    	je     2d458 <JS_CallInternal+0x84c8>
   2d2a5:	41 8b 71 04          	mov    0x4(%r9),%esi
   2d2a9:	4c 89 e7             	mov    %r12,%rdi
   2d2ac:	e8 8f 85 00 00       	call   35840 <JS_ThrowReferenceErrorNotDefined>
   2d2b1:	e9 0a 84 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2d2b6:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d2bb:	48 89 c2             	mov    %rax,%rdx
   2d2be:	48 89 ce             	mov    %rcx,%rsi
   2d2c1:	e8 0a 12 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d2c6:	e9 26 ab ff ff       	jmp    27df1 <JS_CallInternal+0x2e61>
   2d2cb:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d2d0:	48 89 ce             	mov    %rcx,%rsi
   2d2d3:	e8 f8 11 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d2d8:	e9 dc be ff ff       	jmp    291b9 <JS_CallInternal+0x4229>
   2d2dd:	48 89 fe             	mov    %rdi,%rsi
   2d2e0:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d2e5:	e8 e6 11 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d2ea:	e9 68 ca ff ff       	jmp    29d57 <JS_CallInternal+0x4dc7>
   2d2ef:	48 89 f2             	mov    %rsi,%rdx
   2d2f2:	48 89 fe             	mov    %rdi,%rsi
   2d2f5:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d2fa:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   2d301:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   2d308:	44 89 85 30 fe ff ff 	mov    %r8d,-0x1d0(%rbp)
   2d30f:	e8 bc 11 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d314:	48 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%rax
   2d31b:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   2d322:	44 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8d
   2d329:	e9 d2 97 ff ff       	jmp    26b00 <JS_CallInternal+0x1b70>
   2d32e:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d333:	48 89 c2             	mov    %rax,%rdx
   2d336:	48 89 ce             	mov    %rcx,%rsi
   2d339:	e8 92 11 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d33e:	e9 e8 ce ff ff       	jmp    2a22b <JS_CallInternal+0x529b>
   2d343:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d348:	48 89 c2             	mov    %rax,%rdx
   2d34b:	48 89 ce             	mov    %rcx,%rsi
   2d34e:	e8 7d 11 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d353:	e9 72 d4 ff ff       	jmp    2a7ca <JS_CallInternal+0x583a>
   2d358:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d35d:	48 89 c2             	mov    %rax,%rdx
   2d360:	48 89 ce             	mov    %rcx,%rsi
   2d363:	e8 68 11 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d368:	e9 a3 9f ff ff       	jmp    27310 <JS_CallInternal+0x2380>
   2d36d:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d372:	48 89 c2             	mov    %rax,%rdx
   2d375:	48 89 ce             	mov    %rcx,%rsi
   2d378:	e8 53 11 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d37d:	e9 d2 9f ff ff       	jmp    27354 <JS_CallInternal+0x23c4>
   2d382:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d387:	48 89 c2             	mov    %rax,%rdx
   2d38a:	48 89 ce             	mov    %rcx,%rsi
   2d38d:	e8 3e 11 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d392:	e9 30 9f ff ff       	jmp    272c7 <JS_CallInternal+0x2337>
   2d397:	48 89 f2             	mov    %rsi,%rdx
   2d39a:	48 89 fe             	mov    %rdi,%rsi
   2d39d:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d3a2:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2d3a9:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2d3b0:	e8 1b 11 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d3b5:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2d3bc:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2d3c3:	e9 a6 ad ff ff       	jmp    2816e <JS_CallInternal+0x31de>
   2d3c8:	48 89 f2             	mov    %rsi,%rdx
   2d3cb:	48 89 fe             	mov    %rdi,%rsi
   2d3ce:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d3d3:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2d3da:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2d3e1:	e8 ea 10 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d3e6:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2d3ed:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2d3f4:	e9 58 ad ff ff       	jmp    28151 <JS_CallInternal+0x31c1>
   2d3f9:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d3fe:	48 89 c2             	mov    %rax,%rdx
   2d401:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2d408:	e8 c3 10 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d40d:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2d414:	e9 be ad ff ff       	jmp    281d7 <JS_CallInternal+0x3247>
   2d419:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d41e:	48 89 c2             	mov    %rax,%rdx
   2d421:	48 89 ce             	mov    %rcx,%rsi
   2d424:	e8 a7 10 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d429:	e9 0b aa ff ff       	jmp    27e39 <JS_CallInternal+0x2ea9>
   2d42e:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d433:	48 89 c2             	mov    %rax,%rdx
   2d436:	48 89 ce             	mov    %rcx,%rsi
   2d439:	e8 92 10 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d43e:	e9 84 aa ff ff       	jmp    27ec7 <JS_CallInternal+0x2f37>
   2d443:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d448:	48 89 c2             	mov    %rax,%rdx
   2d44b:	48 89 ce             	mov    %rcx,%rsi
   2d44e:	e8 7d 10 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d453:	e9 29 aa ff ff       	jmp    27e81 <JS_CallInternal+0x2ef1>
   2d458:	48 83 ec 08          	sub    $0x8,%rsp
   2d45c:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2d460:	48 8b 7b f8          	mov    -0x8(%rbx),%rdi
   2d464:	48 83 eb 10          	sub    $0x10,%rbx
   2d468:	41 8b 49 04          	mov    0x4(%r9),%ecx
   2d46c:	49 8b 84 24 80 01 00 	mov    0x180(%r12),%rax
   2d473:	00 
   2d474:	49 8b 94 24 88 01 00 	mov    0x188(%r12),%rdx
   2d47b:	00 
   2d47c:	68 00 80 00 00       	push   $0x8000
   2d481:	49 89 f0             	mov    %rsi,%r8
   2d484:	49 89 f9             	mov    %rdi,%r9
   2d487:	41 ff b4 24 88 01 00 	push   0x188(%r12)
   2d48e:	00 
   2d48f:	48 89 c6             	mov    %rax,%rsi
   2d492:	4c 89 e7             	mov    %r12,%rdi
   2d495:	41 ff b4 24 80 01 00 	push   0x180(%r12)
   2d49c:	00 
   2d49d:	e8 2e 31 00 00       	call   305d0 <JS_SetPropertyInternal>
   2d4a2:	48 83 c4 20          	add    $0x20,%rsp
   2d4a6:	85 c0                	test   %eax,%eax
   2d4a8:	0f 89 db 87 ff ff    	jns    25c89 <JS_CallInternal+0xcf9>
   2d4ae:	e9 0d 82 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2d4b3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2d4b8:	48 83 c3 10          	add    $0x10,%rbx
   2d4bc:	e9 ff 81 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2d4c1:	4d 89 ef             	mov    %r13,%r15
   2d4c4:	e9 f7 81 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2d4c9:	4c 89 e7             	mov    %r12,%rdi
   2d4cc:	e8 ef 85 00 00       	call   35ac0 <__js_poll_interrupts>
   2d4d1:	85 c0                	test   %eax,%eax
   2d4d3:	0f 85 e7 81 ff ff    	jne    256c0 <JS_CallInternal+0x730>
   2d4d9:	e9 a9 cc ff ff       	jmp    2a187 <JS_CallInternal+0x51f7>
   2d4de:	66 90                	xchg   %ax,%ax
   2d4e0:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d4e5:	48 89 c2             	mov    %rax,%rdx
   2d4e8:	48 89 ce             	mov    %rcx,%rsi
   2d4eb:	e8 e0 0f ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d4f0:	e9 0a ca ff ff       	jmp    29eff <JS_CallInternal+0x4f6f>
   2d4f5:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2d4f9:	b8 08 00 00 00       	mov    $0x8,%eax
   2d4fe:	f2 48 0f 2a c1       	cvtsi2sd %rcx,%xmm0
   2d503:	f2 41 0f 11 01       	movsd  %xmm0,(%r9)
   2d508:	e9 12 c3 ff ff       	jmp    2981f <JS_CallInternal+0x488f>
   2d50d:	83 f8 08             	cmp    $0x8,%eax
   2d510:	0f 84 8b 1d 00 00    	je     2f2a1 <JS_CallInternal+0xa311>
   2d516:	83 f8 f9             	cmp    $0xfffffff9,%eax
   2d519:	0f 84 f7 11 00 00    	je     2e716 <JS_CallInternal+0x9786>
   2d51f:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   2d526:	4c 89 7e 30          	mov    %r15,0x30(%rsi)
   2d52a:	49 8b 31             	mov    (%r9),%rsi
   2d52d:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2d530:	0f 87 f7 11 00 00    	ja     2e72d <JS_CallInternal+0x979d>
   2d536:	48 89 b5 50 ff ff ff 	mov    %rsi,-0xb0(%rbp)
   2d53d:	4c 89 e7             	mov    %r12,%rdi
   2d540:	48 83 eb 10          	sub    $0x10,%rbx
   2d544:	48 8d b5 70 ff ff ff 	lea    -0x90(%rbp),%rsi
   2d54b:	4c 89 8d 30 fe ff ff 	mov    %r9,-0x1d0(%rbp)
   2d552:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
   2d559:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
   2d560:	48 89 85 58 ff ff ff 	mov    %rax,-0xa8(%rbp)
   2d567:	e8 34 95 02 00       	call   56aa0 <js_add_slow>
   2d56c:	85 c0                	test   %eax,%eax
   2d56e:	0f 85 4c 81 ff ff    	jne    256c0 <JS_CallInternal+0x730>
   2d574:	4c 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9
   2d57b:	48 8b 95 50 ff ff ff 	mov    -0xb0(%rbp),%rdx
   2d582:	49 8b 09             	mov    (%r9),%rcx
   2d585:	49 8b 41 08          	mov    0x8(%r9),%rax
   2d589:	49 89 11             	mov    %rdx,(%r9)
   2d58c:	48 8b 95 58 ff ff ff 	mov    -0xa8(%rbp),%rdx
   2d593:	49 89 51 08          	mov    %rdx,0x8(%r9)
   2d597:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2d59a:	0f 86 87 c2 ff ff    	jbe    29827 <JS_CallInternal+0x4897>
   2d5a0:	8b 51 fc             	mov    -0x4(%rcx),%edx
   2d5a3:	83 ea 01             	sub    $0x1,%edx
   2d5a6:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2d5a9:	85 d2                	test   %edx,%edx
   2d5ab:	0f 8f 76 c2 ff ff    	jg     29827 <JS_CallInternal+0x4897>
   2d5b1:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d5b6:	48 89 c2             	mov    %rax,%rdx
   2d5b9:	48 89 ce             	mov    %rcx,%rsi
   2d5bc:	e8 0f 0f ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d5c1:	e9 61 c2 ff ff       	jmp    29827 <JS_CallInternal+0x4897>
   2d5c6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   2d5cd:	00 00 00 
   2d5d0:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d5d5:	48 89 c2             	mov    %rax,%rdx
   2d5d8:	48 89 ce             	mov    %rcx,%rsi
   2d5db:	4c 89 9d f0 fd ff ff 	mov    %r11,-0x210(%rbp)
   2d5e2:	e8 e9 0e ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d5e7:	4c 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%r11
   2d5ee:	e9 cb c8 ff ff       	jmp    29ebe <JS_CallInternal+0x4f2e>
   2d5f3:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2d5fa:	44 89 d2             	mov    %r10d,%edx
   2d5fd:	48 89 de             	mov    %rbx,%rsi
   2d600:	4c 89 e7             	mov    %r12,%rdi
   2d603:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2d607:	e8 64 4c 02 00       	call   52270 <js_binary_logic_slow>
   2d60c:	85 c0                	test   %eax,%eax
   2d60e:	0f 85 30 1f 00 00    	jne    2f544 <JS_CallInternal+0xa5b4>
   2d614:	48 83 eb 10          	sub    $0x10,%rbx
   2d618:	e9 af c9 ff ff       	jmp    29fcc <JS_CallInternal+0x503c>
   2d61d:	83 fe 08             	cmp    $0x8,%esi
   2d620:	0f 84 87 18 00 00    	je     2eead <JS_CallInternal+0x9f1d>
   2d626:	83 f9 08             	cmp    $0x8,%ecx
   2d629:	75 08                	jne    2d633 <JS_CallInternal+0x86a3>
   2d62b:	85 f6                	test   %esi,%esi
   2d62d:	0f 84 22 1c 00 00    	je     2f255 <JS_CallInternal+0xa2c5>
   2d633:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2d63a:	44 89 d2             	mov    %r10d,%edx
   2d63d:	48 89 de             	mov    %rbx,%rsi
   2d640:	4c 89 e7             	mov    %r12,%rdi
   2d643:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2d647:	e8 24 e9 02 00       	call   5bf70 <js_relational_slow>
   2d64c:	85 c0                	test   %eax,%eax
   2d64e:	0f 85 f8 1e 00 00    	jne    2f54c <JS_CallInternal+0xa5bc>
   2d654:	48 83 eb 10          	sub    $0x10,%rbx
   2d658:	e9 c3 be ff ff       	jmp    29520 <JS_CallInternal+0x4590>
   2d65d:	4d 89 ef             	mov    %r13,%r15
   2d660:	e9 5b 80 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2d665:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2d66c:	48 89 de             	mov    %rbx,%rsi
   2d66f:	4c 89 e7             	mov    %r12,%rdi
   2d672:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2d676:	e8 25 4a 02 00       	call   520a0 <js_shr_slow>
   2d67b:	85 c0                	test   %eax,%eax
   2d67d:	0f 85 87 20 00 00    	jne    2f70a <JS_CallInternal+0xa77a>
   2d683:	48 83 eb 10          	sub    $0x10,%rbx
   2d687:	e9 88 c9 ff ff       	jmp    2a014 <JS_CallInternal+0x5084>
   2d68c:	83 fe 08             	cmp    $0x8,%esi
   2d68f:	0f 84 53 1c 00 00    	je     2f2e8 <JS_CallInternal+0xa358>
   2d695:	83 f9 08             	cmp    $0x8,%ecx
   2d698:	75 08                	jne    2d6a2 <JS_CallInternal+0x8712>
   2d69a:	85 f6                	test   %esi,%esi
   2d69c:	0f 84 7e 1c 00 00    	je     2f320 <JS_CallInternal+0xa390>
   2d6a2:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2d6a9:	44 89 d2             	mov    %r10d,%edx
   2d6ac:	48 89 de             	mov    %rbx,%rsi
   2d6af:	4c 89 e7             	mov    %r12,%rdi
   2d6b2:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2d6b6:	e8 b5 e8 02 00       	call   5bf70 <js_relational_slow>
   2d6bb:	85 c0                	test   %eax,%eax
   2d6bd:	0f 85 a0 1e 00 00    	jne    2f563 <JS_CallInternal+0xa5d3>
   2d6c3:	48 83 eb 10          	sub    $0x10,%rbx
   2d6c7:	e9 cd c9 ff ff       	jmp    2a099 <JS_CallInternal+0x5109>
   2d6cc:	31 c0                	xor    %eax,%eax
   2d6ce:	48 8d 35 a8 ae 0a 00 	lea    0xaaea8(%rip),%rsi        # d857d <_IO_stdin_used+0x57d>
   2d6d5:	4c 89 e7             	mov    %r12,%rdi
   2d6d8:	4d 89 ef             	mov    %r13,%r15
   2d6db:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2d6e2:	4c 89 85 10 fe ff ff 	mov    %r8,-0x1f0(%rbp)
   2d6e9:	e8 12 83 00 00       	call   35a00 <JS_ThrowInternalError>
   2d6ee:	83 fb f6             	cmp    $0xfffffff6,%ebx
   2d6f1:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2d6f8:	76 1a                	jbe    2d714 <JS_CallInternal+0x8784>
   2d6fa:	4c 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%r8
   2d701:	41 8b 40 fc          	mov    -0x4(%r8),%eax
   2d705:	83 e8 01             	sub    $0x1,%eax
   2d708:	41 89 40 fc          	mov    %eax,-0x4(%r8)
   2d70c:	85 c0                	test   %eax,%eax
   2d70e:	0f 8e f9 18 00 00    	jle    2f00d <JS_CallInternal+0xa07d>
   2d714:	48 89 cb             	mov    %rcx,%rbx
   2d717:	e9 a4 7f ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2d71c:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2d720:	48 c7 43 e8 08 00 00 	movq   $0x8,-0x18(%rbx)
   2d727:	00 
   2d728:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
   2d72d:	f2 0f 11 43 e0       	movsd  %xmm0,-0x20(%rbx)
   2d732:	e9 fd 8b ff ff       	jmp    26334 <JS_CallInternal+0x13a4>
   2d737:	83 fa 08             	cmp    $0x8,%edx
   2d73a:	0f 84 33 1d 00 00    	je     2f473 <JS_CallInternal+0xa4e3>
   2d740:	83 f8 08             	cmp    $0x8,%eax
   2d743:	0f 84 ff 1c 00 00    	je     2f448 <JS_CallInternal+0xa4b8>
   2d749:	8d 72 07             	lea    0x7(%rdx),%esi
   2d74c:	83 fe 01             	cmp    $0x1,%esi
   2d74f:	0f 86 3a 1d 00 00    	jbe    2f48f <JS_CallInternal+0xa4ff>
   2d755:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2d75c:	48 89 de             	mov    %rbx,%rsi
   2d75f:	4c 89 e7             	mov    %r12,%rdi
   2d762:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2d766:	e8 35 93 02 00       	call   56aa0 <js_add_slow>
   2d76b:	85 c0                	test   %eax,%eax
   2d76d:	0f 84 c1 8b ff ff    	je     26334 <JS_CallInternal+0x13a4>
   2d773:	4d 89 ef             	mov    %r13,%r15
   2d776:	e9 45 7f ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2d77b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2d780:	4d 89 ef             	mov    %r13,%r15
   2d783:	e9 38 7f ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2d788:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d78d:	48 89 c2             	mov    %rax,%rdx
   2d790:	48 89 ce             	mov    %rcx,%rsi
   2d793:	e8 38 0d ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d798:	e9 f9 dd ff ff       	jmp    2b596 <JS_CallInternal+0x6606>
   2d79d:	48 83 eb 10          	sub    $0x10,%rbx
   2d7a1:	e9 1a 7f ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2d7a6:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2d7ad:	44 89 d2             	mov    %r10d,%edx
   2d7b0:	48 89 de             	mov    %rbx,%rsi
   2d7b3:	4c 89 e7             	mov    %r12,%rdi
   2d7b6:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2d7ba:	e8 b1 4a 02 00       	call   52270 <js_binary_logic_slow>
   2d7bf:	85 c0                	test   %eax,%eax
   2d7c1:	0f 85 5e 1f 00 00    	jne    2f725 <JS_CallInternal+0xa795>
   2d7c7:	48 83 eb 10          	sub    $0x10,%rbx
   2d7cb:	e9 0d b9 ff ff       	jmp    290dd <JS_CallInternal+0x414d>
   2d7d0:	48 8d 35 11 e6 0a 00 	lea    0xae611(%rip),%rsi        # dbde8 <_IO_stdin_used+0x3de8>
   2d7d7:	4c 89 e7             	mov    %r12,%rdi
   2d7da:	31 c0                	xor    %eax,%eax
   2d7dc:	4d 89 ef             	mov    %r13,%r15
   2d7df:	e8 3c 60 00 00       	call   33820 <JS_ThrowTypeError>
   2d7e4:	e9 d7 7e ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2d7e9:	4d 89 ef             	mov    %r13,%r15
   2d7ec:	e9 cf 7e ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2d7f1:	4c 89 e7             	mov    %r12,%rdi
   2d7f4:	e8 c7 82 00 00       	call   35ac0 <__js_poll_interrupts>
   2d7f9:	85 c0                	test   %eax,%eax
   2d7fb:	0f 85 bf 7e ff ff    	jne    256c0 <JS_CallInternal+0x730>
   2d801:	e9 f0 c9 ff ff       	jmp    2a1f6 <JS_CallInternal+0x5266>
   2d806:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   2d80d:	00 00 00 
   2d810:	83 fe 08             	cmp    $0x8,%esi
   2d813:	0f 84 0c 1c 00 00    	je     2f425 <JS_CallInternal+0xa495>
   2d819:	83 f9 08             	cmp    $0x8,%ecx
   2d81c:	75 08                	jne    2d826 <JS_CallInternal+0x8896>
   2d81e:	85 f6                	test   %esi,%esi
   2d820:	0f 84 97 1a 00 00    	je     2f2bd <JS_CallInternal+0xa32d>
   2d826:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2d82d:	44 89 d2             	mov    %r10d,%edx
   2d830:	48 89 de             	mov    %rbx,%rsi
   2d833:	4c 89 e7             	mov    %r12,%rdi
   2d836:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2d83a:	e8 31 e7 02 00       	call   5bf70 <js_relational_slow>
   2d83f:	85 c0                	test   %eax,%eax
   2d841:	0f 85 ba 1c 00 00    	jne    2f501 <JS_CallInternal+0xa571>
   2d847:	48 83 eb 10          	sub    $0x10,%rbx
   2d84b:	e9 17 b9 ff ff       	jmp    29167 <JS_CallInternal+0x41d7>
   2d850:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2d854:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
   2d859:	48 c7 43 e8 08 00 00 	movq   $0x8,-0x18(%rbx)
   2d860:	00 
   2d861:	48 83 eb 10          	sub    $0x10,%rbx
   2d865:	f2 0f 11 43 f0       	movsd  %xmm0,-0x10(%rbx)
   2d86a:	e9 f4 be ff ff       	jmp    29763 <JS_CallInternal+0x47d3>
   2d86f:	4d 89 ef             	mov    %r13,%r15
   2d872:	48 83 c3 10          	add    $0x10,%rbx
   2d876:	e9 45 7e ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2d87b:	48 8b b5 c0 fe ff ff 	mov    -0x140(%rbp),%rsi
   2d882:	0f b7 d1             	movzwl %cx,%edx
   2d885:	4c 89 e7             	mov    %r12,%rdi
   2d888:	31 c9                	xor    %ecx,%ecx
   2d88a:	e8 11 80 00 00       	call   358a0 <JS_ThrowReferenceErrorUninitialized2.isra.0>
   2d88f:	e9 2c 7e ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2d894:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2d898:	48 c7 43 e8 08 00 00 	movq   $0x8,-0x18(%rbx)
   2d89f:	00 
   2d8a0:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
   2d8a5:	f2 0f 11 43 e0       	movsd  %xmm0,-0x20(%rbx)
   2d8aa:	e9 0b bf ff ff       	jmp    297ba <JS_CallInternal+0x482a>
   2d8af:	83 fa 08             	cmp    $0x8,%edx
   2d8b2:	0f 84 0f 1c 00 00    	je     2f4c7 <JS_CallInternal+0xa537>
   2d8b8:	83 f8 08             	cmp    $0x8,%eax
   2d8bb:	0f 85 3a bd ff ff    	jne    295fb <JS_CallInternal+0x466b>
   2d8c1:	85 d2                	test   %edx,%edx
   2d8c3:	0f 85 32 bd ff ff    	jne    295fb <JS_CallInternal+0x466b>
   2d8c9:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2d8cd:	f2 0f 2a c7          	cvtsi2sd %edi,%xmm0
   2d8d1:	66 48 0f 6e c9       	movq   %rcx,%xmm1
   2d8d6:	f2 0f 5c c1          	subsd  %xmm1,%xmm0
   2d8da:	48 c7 43 e8 08 00 00 	movq   $0x8,-0x18(%rbx)
   2d8e1:	00 
   2d8e2:	f2 0f 11 43 e0       	movsd  %xmm0,-0x20(%rbx)
   2d8e7:	e9 ce be ff ff       	jmp    297ba <JS_CallInternal+0x482a>
   2d8ec:	83 fe 08             	cmp    $0x8,%esi
   2d8ef:	0f 84 6d 17 00 00    	je     2f062 <JS_CallInternal+0xa0d2>
   2d8f5:	83 f8 08             	cmp    $0x8,%eax
   2d8f8:	0f 85 fd bc ff ff    	jne    295fb <JS_CallInternal+0x466b>
   2d8fe:	85 f6                	test   %esi,%esi
   2d900:	0f 85 f5 bc ff ff    	jne    295fb <JS_CallInternal+0x466b>
   2d906:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2d90a:	f2 0f 2a c9          	cvtsi2sd %ecx,%xmm1
   2d90e:	66 48 0f 6e c2       	movq   %rdx,%xmm0
   2d913:	f2 0f 59 c1          	mulsd  %xmm1,%xmm0
   2d917:	e9 3d ff ff ff       	jmp    2d859 <JS_CallInternal+0x88c9>
   2d91c:	4c 89 e7             	mov    %r12,%rdi
   2d91f:	e8 9c 81 00 00       	call   35ac0 <__js_poll_interrupts>
   2d924:	85 c0                	test   %eax,%eax
   2d926:	0f 85 94 7d ff ff    	jne    256c0 <JS_CallInternal+0x730>
   2d92c:	e9 1a b7 ff ff       	jmp    2904b <JS_CallInternal+0x40bb>
   2d931:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   2d938:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d93d:	4c 89 fa             	mov    %r15,%rdx
   2d940:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2d947:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2d94e:	e8 7d 0b ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d953:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2d95a:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2d961:	e9 db d4 ff ff       	jmp    2ae41 <JS_CallInternal+0x5eb1>
   2d966:	8b 01                	mov    (%rcx),%eax
   2d968:	25 ff ff ff 03       	and    $0x3ffffff,%eax
   2d96d:	0f 85 1c 91 ff ff    	jne    26a8f <JS_CallInternal+0x1aff>
   2d973:	89 fa                	mov    %edi,%edx
   2d975:	48 8b bd 20 fe ff ff 	mov    -0x1e0(%rbp),%rdi
   2d97c:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2d980:	e8 4b b0 fe ff       	call   189d0 <JS_AtomGetStrRT.constprop.0>
   2d985:	48 8d 35 7c e4 0a 00 	lea    0xae47c(%rip),%rsi        # dbe08 <_IO_stdin_used+0x3e08>
   2d98c:	4c 89 e7             	mov    %r12,%rdi
   2d98f:	48 89 c2             	mov    %rax,%rdx
   2d992:	31 c0                	xor    %eax,%eax
   2d994:	e8 87 5e 00 00       	call   33820 <JS_ThrowTypeError>
   2d999:	4d 8b 4f 08          	mov    0x8(%r15),%r9
   2d99d:	41 83 f9 f6          	cmp    $0xfffffff6,%r9d
   2d9a1:	0f 87 f4 0b 00 00    	ja     2e59b <JS_CallInternal+0x960b>
   2d9a7:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2d9ae:	48 8b 70 08          	mov    0x8(%rax),%rsi
   2d9b2:	83 fe f6             	cmp    $0xfffffff6,%esi
   2d9b5:	0f 87 6e 16 00 00    	ja     2f029 <JS_CallInternal+0xa099>
   2d9bb:	31 f6                	xor    %esi,%esi
   2d9bd:	48 c7 43 e8 06 00 00 	movq   $0x6,-0x18(%rbx)
   2d9c4:	00 
   2d9c5:	48 89 73 e0          	mov    %rsi,-0x20(%rbx)
   2d9c9:	4c 89 fb             	mov    %r15,%rbx
   2d9cc:	4d 89 ef             	mov    %r13,%r15
   2d9cf:	e9 ec 7c ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2d9d4:	4d 89 ef             	mov    %r13,%r15
   2d9d7:	e9 e4 7c ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2d9dc:	48 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%rdx
   2d9e3:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d9e8:	4c 89 fe             	mov    %r15,%rsi
   2d9eb:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2d9f1:	e8 da 0a ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d9f6:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2d9fc:	e9 45 b1 ff ff       	jmp    28b46 <JS_CallInternal+0x3bb6>
   2da01:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2da06:	48 89 c2             	mov    %rax,%rdx
   2da09:	48 89 ce             	mov    %rcx,%rsi
   2da0c:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   2da13:	e8 b8 0a ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2da18:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   2da1f:	e9 61 b8 ff ff       	jmp    29285 <JS_CallInternal+0x42f5>
   2da24:	49 8b 44 24 10       	mov    0x10(%r12),%rax
   2da29:	48 8b 80 f0 04 00 00 	mov    0x4f0(%rax),%rax
   2da30:	48 85 c0             	test   %rax,%rax
   2da33:	0f 84 6b 0e 00 00    	je     2e8a4 <JS_CallInternal+0x9914>
   2da39:	f6 40 3c 01          	testb  $0x1,0x3c(%rax)
   2da3d:	0f 84 61 0e 00 00    	je     2e8a4 <JS_CallInternal+0x9914>
   2da43:	89 ce                	mov    %ecx,%esi
   2da45:	4c 89 e7             	mov    %r12,%rdi
   2da48:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2da4e:	4d 89 ef             	mov    %r13,%r15
   2da51:	e8 ea 7d 00 00       	call   35840 <JS_ThrowReferenceErrorNotDefined>
   2da56:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2da5c:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2da62:	0f 8e 58 7c ff ff    	jle    256c0 <JS_CallInternal+0x730>
   2da68:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2da6d:	89 ce                	mov    %ecx,%esi
   2da6f:	e8 7c d1 fe ff       	call   1abf0 <JS_FreeAtom.part.0.isra.0>
   2da74:	e9 47 7c ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2da79:	4d 89 ef             	mov    %r13,%r15
   2da7c:	e9 3f 7c ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2da81:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2da86:	48 89 c2             	mov    %rax,%rdx
   2da89:	48 89 ce             	mov    %rcx,%rsi
   2da8c:	e8 3f 0a ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2da91:	e9 30 b8 ff ff       	jmp    292c6 <JS_CallInternal+0x4336>
   2da96:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2da9b:	48 89 c2             	mov    %rax,%rdx
   2da9e:	48 89 ce             	mov    %rcx,%rsi
   2daa1:	4c 89 9d 30 fe ff ff 	mov    %r11,-0x1d0(%rbp)
   2daa8:	e8 23 0a ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2daad:	4c 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%r11
   2dab4:	e9 07 b9 ff ff       	jmp    293c0 <JS_CallInternal+0x4430>
   2dab9:	c7 85 dc fe ff ff ff 	movl   $0xffffffff,-0x124(%rbp)
   2dac0:	ff ff ff 
   2dac3:	49 8b 72 08          	mov    0x8(%r10),%rsi
   2dac7:	83 fe f6             	cmp    $0xfffffff6,%esi
   2daca:	0f 87 fa 0d 00 00    	ja     2e8ca <JS_CallInternal+0x993a>
   2dad0:	49 c7 02 00 00 00 00 	movq   $0x0,(%r10)
   2dad7:	49 c7 42 08 03 00 00 	movq   $0x3,0x8(%r10)
   2dade:	00 
   2dadf:	e9 dc 7b ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2dae4:	ba 01 00 00 00       	mov    $0x1,%edx
   2dae9:	be 03 00 00 00       	mov    $0x3,%esi
   2daee:	31 ff                	xor    %edi,%edi
   2daf0:	e9 a4 c0 ff ff       	jmp    29b99 <JS_CallInternal+0x4c09>
   2daf5:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2dafc:	44 89 d2             	mov    %r10d,%edx
   2daff:	48 89 de             	mov    %rbx,%rsi
   2db02:	4c 89 e7             	mov    %r12,%rdi
   2db05:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2db09:	e8 62 47 02 00       	call   52270 <js_binary_logic_slow>
   2db0e:	85 c0                	test   %eax,%eax
   2db10:	0f 85 64 1b 00 00    	jne    2f67a <JS_CallInternal+0xa6ea>
   2db16:	48 83 eb 10          	sub    $0x10,%rbx
   2db1a:	e9 de c1 ff ff       	jmp    29cfd <JS_CallInternal+0x4d6d>
   2db1f:	48 8d 15 97 a9 0a 00 	lea    0xaa997(%rip),%rdx        # d84bd <_IO_stdin_used+0x4bd>
   2db26:	85 c9                	test   %ecx,%ecx
   2db28:	0f 85 b1 10 00 00    	jne    2ebdf <JS_CallInternal+0x9c4f>
   2db2e:	48 8d 35 e4 a9 0a 00 	lea    0xaa9e4(%rip),%rsi        # d8519 <_IO_stdin_used+0x519>
   2db35:	4c 89 e7             	mov    %r12,%rdi
   2db38:	31 c0                	xor    %eax,%eax
   2db3a:	e8 c1 7b 00 00       	call   35700 <JS_ThrowReferenceError>
   2db3f:	e9 7c 7b ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2db44:	41 8b 4a 14          	mov    0x14(%r10),%ecx
   2db48:	e9 fa dd ff ff       	jmp    2b947 <JS_CallInternal+0x69b7>
   2db4d:	48 83 c3 10          	add    $0x10,%rbx
   2db51:	e9 6a 7b ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2db56:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2db5b:	4c 89 fa             	mov    %r15,%rdx
   2db5e:	48 89 ce             	mov    %rcx,%rsi
   2db61:	44 89 85 30 fe ff ff 	mov    %r8d,-0x1d0(%rbp)
   2db68:	e8 63 09 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2db6d:	44 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8d
   2db74:	e9 68 b3 ff ff       	jmp    28ee1 <JS_CallInternal+0x3f51>
   2db79:	4d 89 ef             	mov    %r13,%r15
   2db7c:	e9 3f 7b ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2db81:	4d 89 ef             	mov    %r13,%r15
   2db84:	e9 37 7b ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2db89:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2db8e:	48 89 c2             	mov    %rax,%rdx
   2db91:	48 89 ce             	mov    %rcx,%rsi
   2db94:	4c 89 9d f0 fd ff ff 	mov    %r11,-0x210(%rbp)
   2db9b:	e8 30 09 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2dba0:	4c 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%r11
   2dba7:	e9 36 c3 ff ff       	jmp    29ee2 <JS_CallInternal+0x4f52>
   2dbac:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2dbb3:	44 89 d2             	mov    %r10d,%edx
   2dbb6:	48 89 de             	mov    %rbx,%rsi
   2dbb9:	4c 89 e7             	mov    %r12,%rdi
   2dbbc:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2dbc0:	e8 ab 46 02 00       	call   52270 <js_binary_logic_slow>
   2dbc5:	85 c0                	test   %eax,%eax
   2dbc7:	0f 85 9a 1a 00 00    	jne    2f667 <JS_CallInternal+0xa6d7>
   2dbcd:	48 83 eb 10          	sub    $0x10,%rbx
   2dbd1:	e9 7b c4 ff ff       	jmp    2a051 <JS_CallInternal+0x50c1>
   2dbd6:	4d 89 ef             	mov    %r13,%r15
   2dbd9:	e9 e2 7a ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2dbde:	83 fe 08             	cmp    $0x8,%esi
   2dbe1:	0f 84 ee 10 00 00    	je     2ecd5 <JS_CallInternal+0x9d45>
   2dbe7:	83 f9 08             	cmp    $0x8,%ecx
   2dbea:	75 08                	jne    2dbf4 <JS_CallInternal+0x8c64>
   2dbec:	85 f6                	test   %esi,%esi
   2dbee:	0f 84 19 11 00 00    	je     2ed0d <JS_CallInternal+0x9d7d>
   2dbf4:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2dbfb:	44 89 d2             	mov    %r10d,%edx
   2dbfe:	48 89 de             	mov    %rbx,%rsi
   2dc01:	4c 89 e7             	mov    %r12,%rdi
   2dc04:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2dc08:	e8 63 e3 02 00       	call   5bf70 <js_relational_slow>
   2dc0d:	85 c0                	test   %eax,%eax
   2dc0f:	0f 85 12 1a 00 00    	jne    2f627 <JS_CallInternal+0xa697>
   2dc15:	48 83 eb 10          	sub    $0x10,%rbx
   2dc19:	e9 a2 c0 ff ff       	jmp    29cc0 <JS_CallInternal+0x4d30>
   2dc1e:	83 f9 08             	cmp    $0x8,%ecx
   2dc21:	0f 84 3b 12 00 00    	je     2ee62 <JS_CallInternal+0x9ed2>
   2dc27:	83 f9 ff             	cmp    $0xffffffff,%ecx
   2dc2a:	0f 84 f8 11 00 00    	je     2ee28 <JS_CallInternal+0x9e98>
   2dc30:	8d 41 fe             	lea    -0x2(%rcx),%eax
   2dc33:	83 f8 01             	cmp    $0x1,%eax
   2dc36:	0f 86 f3 19 00 00    	jbe    2f62f <JS_CallInternal+0xa69f>
   2dc3c:	83 f9 f9             	cmp    $0xfffffff9,%ecx
   2dc3f:	0f 85 7d 11 00 00    	jne    2edc2 <JS_CallInternal+0x9e32>
   2dc45:	41 83 ff f9          	cmp    $0xfffffff9,%r15d
   2dc49:	0f 85 73 11 00 00    	jne    2edc2 <JS_CallInternal+0x9e32>
   2dc4f:	4c 89 d6             	mov    %r10,%rsi
   2dc52:	48 89 d7             	mov    %rdx,%rdi
   2dc55:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   2dc5c:	48 89 8d f0 fd ff ff 	mov    %rcx,-0x210(%rbp)
   2dc63:	48 89 95 10 fe ff ff 	mov    %rdx,-0x1f0(%rbp)
   2dc6a:	e8 81 b7 fe ff       	call   193f0 <js_string_eq.isra.0>
   2dc6f:	48 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%rdx
   2dc76:	48 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%rcx
   2dc7d:	4c 89 e7             	mov    %r12,%rdi
   2dc80:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2dc86:	48 89 d6             	mov    %rdx,%rsi
   2dc89:	48 89 ca             	mov    %rcx,%rdx
   2dc8c:	e8 bf 09 ff ff       	call   1e650 <JS_FreeValue>
   2dc91:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   2dc98:	4d 89 fb             	mov    %r15,%r11
   2dc9b:	4c 89 d6             	mov    %r10,%rsi
   2dc9e:	4c 89 da             	mov    %r11,%rdx
   2dca1:	4c 89 e7             	mov    %r12,%rdi
   2dca4:	e8 a7 09 ff ff       	call   1e650 <JS_FreeValue>
   2dca9:	8b 85 30 fe ff ff    	mov    -0x1d0(%rbp),%eax
   2dcaf:	83 f0 01             	xor    $0x1,%eax
   2dcb2:	48 98                	cltq
   2dcb4:	e9 7f b2 ff ff       	jmp    28f38 <JS_CallInternal+0x3fa8>
   2dcb9:	4d 89 ef             	mov    %r13,%r15
   2dcbc:	e9 ff 79 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2dcc1:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2dcc6:	48 89 95 10 fe ff ff 	mov    %rdx,-0x1f0(%rbp)
   2dccd:	4c 89 fa             	mov    %r15,%rdx
   2dcd0:	4c 89 85 30 fe ff ff 	mov    %r8,-0x1d0(%rbp)
   2dcd7:	e8 f4 07 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2dcdc:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   2dce3:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2dcea:	e9 4d a9 ff ff       	jmp    2863c <JS_CallInternal+0x36ac>
   2dcef:	48 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%rdx
   2dcf6:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2dcfb:	48 89 ce             	mov    %rcx,%rsi
   2dcfe:	44 89 85 f0 fd ff ff 	mov    %r8d,-0x210(%rbp)
   2dd05:	e8 c6 07 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2dd0a:	44 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8d
   2dd11:	e9 a7 b1 ff ff       	jmp    28ebd <JS_CallInternal+0x3f2d>
   2dd16:	83 fa 08             	cmp    $0x8,%edx
   2dd19:	0f 84 1f 14 00 00    	je     2f13e <JS_CallInternal+0xa1ae>
   2dd1f:	83 fa ff             	cmp    $0xffffffff,%edx
   2dd22:	0f 84 c9 13 00 00    	je     2f0f1 <JS_CallInternal+0xa161>
   2dd28:	8d 42 fe             	lea    -0x2(%rdx),%eax
   2dd2b:	83 f8 01             	cmp    $0x1,%eax
   2dd2e:	0f 86 b8 19 00 00    	jbe    2f6ec <JS_CallInternal+0xa75c>
   2dd34:	83 fa f9             	cmp    $0xfffffff9,%edx
   2dd37:	0f 85 48 13 00 00    	jne    2f085 <JS_CallInternal+0xa0f5>
   2dd3d:	41 83 f8 f9          	cmp    $0xfffffff9,%r8d
   2dd41:	0f 85 3e 13 00 00    	jne    2f085 <JS_CallInternal+0xa0f5>
   2dd47:	4c 89 d6             	mov    %r10,%rsi
   2dd4a:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   2dd51:	4c 89 85 f0 fd ff ff 	mov    %r8,-0x210(%rbp)
   2dd58:	48 89 95 00 fe ff ff 	mov    %rdx,-0x200(%rbp)
   2dd5f:	48 89 bd 30 fe ff ff 	mov    %rdi,-0x1d0(%rbp)
   2dd66:	e8 85 b6 fe ff       	call   193f0 <js_string_eq.isra.0>
   2dd6b:	48 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%rdx
   2dd72:	4c 89 e7             	mov    %r12,%rdi
   2dd75:	4c 63 f8             	movslq %eax,%r15
   2dd78:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2dd7f:	48 89 c6             	mov    %rax,%rsi
   2dd82:	e8 c9 08 ff ff       	call   1e650 <JS_FreeValue>
   2dd87:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   2dd8e:	4c 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%r11
   2dd95:	4c 89 e7             	mov    %r12,%rdi
   2dd98:	4c 89 d6             	mov    %r10,%rsi
   2dd9b:	4c 89 da             	mov    %r11,%rdx
   2dd9e:	e8 ad 08 ff ff       	call   1e650 <JS_FreeValue>
   2dda3:	e9 e1 b1 ff ff       	jmp    28f89 <JS_CallInternal+0x3ff9>
   2dda8:	48 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%rdx
   2ddaf:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2ddb4:	89 8d f0 fd ff ff    	mov    %ecx,-0x210(%rbp)
   2ddba:	e8 11 07 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2ddbf:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   2ddc5:	e9 60 ad ff ff       	jmp    28b2a <JS_CallInternal+0x3b9a>
   2ddca:	4d 89 ef             	mov    %r13,%r15
   2ddcd:	e9 ee 78 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2ddd2:	48 8d 35 bc a7 0a 00 	lea    0xaa7bc(%rip),%rsi        # d8595 <_IO_stdin_used+0x595>
   2ddd9:	4c 89 e7             	mov    %r12,%rdi
   2dddc:	31 c0                	xor    %eax,%eax
   2ddde:	4d 89 ef             	mov    %r13,%r15
   2dde1:	e8 3a 5a 00 00       	call   33820 <JS_ThrowTypeError>
   2dde6:	e9 97 8a ff ff       	jmp    26882 <JS_CallInternal+0x18f2>
   2ddeb:	48 8d 35 95 a7 0a 00 	lea    0xaa795(%rip),%rsi        # d8587 <_IO_stdin_used+0x587>
   2ddf2:	4c 89 e7             	mov    %r12,%rdi
   2ddf5:	31 c0                	xor    %eax,%eax
   2ddf7:	4d 89 ef             	mov    %r13,%r15
   2ddfa:	e8 21 5a 00 00       	call   33820 <JS_ThrowTypeError>
   2ddff:	e9 7e 8a ff ff       	jmp    26882 <JS_CallInternal+0x18f2>
   2de04:	48 8d 35 8a a7 0a 00 	lea    0xaa78a(%rip),%rsi        # d8595 <_IO_stdin_used+0x595>
   2de0b:	4c 89 e7             	mov    %r12,%rdi
   2de0e:	31 c0                	xor    %eax,%eax
   2de10:	e8 0b 5a 00 00       	call   33820 <JS_ThrowTypeError>
   2de15:	4d 8b 4f 08          	mov    0x8(%r15),%r9
   2de19:	48 89 c1             	mov    %rax,%rcx
   2de1c:	48 89 d0             	mov    %rdx,%rax
   2de1f:	49 8b 17             	mov    (%r15),%rdx
   2de22:	41 89 c0             	mov    %eax,%r8d
   2de25:	e9 94 8c ff ff       	jmp    26abe <JS_CallInternal+0x1b2e>
   2de2a:	48 8d 35 56 a7 0a 00 	lea    0xaa756(%rip),%rsi        # d8587 <_IO_stdin_used+0x587>
   2de31:	4c 89 e7             	mov    %r12,%rdi
   2de34:	31 c0                	xor    %eax,%eax
   2de36:	e8 e5 59 00 00       	call   33820 <JS_ThrowTypeError>
   2de3b:	4d 8b 4f 08          	mov    0x8(%r15),%r9
   2de3f:	48 89 c1             	mov    %rax,%rcx
   2de42:	48 89 d0             	mov    %rdx,%rax
   2de45:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2de49:	41 89 c0             	mov    %eax,%r8d
   2de4c:	e9 6d 8c ff ff       	jmp    26abe <JS_CallInternal+0x1b2e>
   2de51:	48 8b bd f0 fd ff ff 	mov    -0x210(%rbp),%rdi
   2de58:	48 89 ce             	mov    %rcx,%rsi
   2de5b:	e8 70 06 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2de60:	e9 5d 8b ff ff       	jmp    269c2 <JS_CallInternal+0x1a32>
   2de65:	48 8d 35 29 a7 0a 00 	lea    0xaa729(%rip),%rsi        # d8595 <_IO_stdin_used+0x595>
   2de6c:	4c 89 e7             	mov    %r12,%rdi
   2de6f:	31 c0                	xor    %eax,%eax
   2de71:	e8 aa 59 00 00       	call   33820 <JS_ThrowTypeError>
   2de76:	83 bd 10 fe ff ff f6 	cmpl   $0xfffffff6,-0x1f0(%rbp)
   2de7d:	76 1e                	jbe    2de9d <JS_CallInternal+0x8f0d>
   2de7f:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2de86:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2de89:	89 85 00 fe ff ff    	mov    %eax,-0x200(%rbp)
   2de8f:	83 e8 01             	sub    $0x1,%eax
   2de92:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2de95:	85 c0                	test   %eax,%eax
   2de97:	0f 8e 9f 13 00 00    	jle    2f23c <JS_CallInternal+0xa2ac>
   2de9d:	48 8b 43 08          	mov    0x8(%rbx),%rax
   2dea1:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2dea4:	76 1e                	jbe    2dec4 <JS_CallInternal+0x8f34>
   2dea6:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
   2deac:	e9 36 df ff ff       	jmp    2bde7 <JS_CallInternal+0x6e57>
   2deb1:	48 8d 35 cf a6 0a 00 	lea    0xaa6cf(%rip),%rsi        # d8587 <_IO_stdin_used+0x587>
   2deb8:	4c 89 e7             	mov    %r12,%rdi
   2debb:	31 c0                	xor    %eax,%eax
   2debd:	e8 5e 59 00 00       	call   33820 <JS_ThrowTypeError>
   2dec2:	eb b2                	jmp    2de76 <JS_CallInternal+0x8ee6>
   2dec4:	49 8b 47 08          	mov    0x8(%r15),%rax
   2dec8:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2decb:	0f 86 51 df ff ff    	jbe    2be22 <JS_CallInternal+0x6e92>
   2ded1:	49 8b 17             	mov    (%r15),%rdx
   2ded4:	4d 89 ef             	mov    %r13,%r15
   2ded7:	8b 4a fc             	mov    -0x4(%rdx),%ecx
   2deda:	83 e9 01             	sub    $0x1,%ecx
   2dedd:	89 4a fc             	mov    %ecx,-0x4(%rdx)
   2dee0:	85 c9                	test   %ecx,%ecx
   2dee2:	0f 8f d8 77 ff ff    	jg     256c0 <JS_CallInternal+0x730>
   2dee8:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
   2deee:	e9 1a ee ff ff       	jmp    2cd0d <JS_CallInternal+0x7d7d>
   2def3:	4c 89 e7             	mov    %r12,%rdi
   2def6:	e8 c5 7b 00 00       	call   35ac0 <__js_poll_interrupts>
   2defb:	85 c0                	test   %eax,%eax
   2defd:	0f 85 bd 77 ff ff    	jne    256c0 <JS_CallInternal+0x730>
   2df03:	e9 69 c8 ff ff       	jmp    2a771 <JS_CallInternal+0x57e1>
   2df08:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   2df0f:	00 
   2df10:	48 8b 85 c0 fe ff ff 	mov    -0x140(%rbp),%rax
   2df17:	48 8b 40 30          	mov    0x30(%rax),%rax
   2df1b:	8b 44 d0 04          	mov    0x4(%rax,%rdx,8),%eax
   2df1f:	48 8d 15 97 a5 0a 00 	lea    0xaa597(%rip),%rdx        # d84bd <_IO_stdin_used+0x4bd>
   2df26:	85 c0                	test   %eax,%eax
   2df28:	0f 85 61 12 00 00    	jne    2f18f <JS_CallInternal+0xa1ff>
   2df2e:	48 8d 35 e4 a5 0a 00 	lea    0xaa5e4(%rip),%rsi        # d8519 <_IO_stdin_used+0x519>
   2df35:	4c 89 e7             	mov    %r12,%rdi
   2df38:	31 c0                	xor    %eax,%eax
   2df3a:	e8 c1 77 00 00       	call   35700 <JS_ThrowReferenceError>
   2df3f:	e9 7c 77 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2df44:	48 8b 85 c0 fe ff ff 	mov    -0x140(%rbp),%rax
   2df4b:	48 8d 15 6b a5 0a 00 	lea    0xaa56b(%rip),%rdx        # d84bd <_IO_stdin_used+0x4bd>
   2df52:	48 8b 40 30          	mov    0x30(%rax),%rax
   2df56:	8b 44 c8 04          	mov    0x4(%rax,%rcx,8),%eax
   2df5a:	85 c0                	test   %eax,%eax
   2df5c:	0f 85 bb 0f 00 00    	jne    2ef1d <JS_CallInternal+0x9f8d>
   2df62:	48 8d 35 b0 a5 0a 00 	lea    0xaa5b0(%rip),%rsi        # d8519 <_IO_stdin_used+0x519>
   2df69:	4c 89 e7             	mov    %r12,%rdi
   2df6c:	31 c0                	xor    %eax,%eax
   2df6e:	e8 8d 77 00 00       	call   35700 <JS_ThrowReferenceError>
   2df73:	e9 48 77 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2df78:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2df7d:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2df81:	89 c2                	mov    %eax,%edx
   2df83:	4d 89 ef             	mov    %r13,%r15
   2df86:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2df8c:	e8 3f aa fe ff       	call   189d0 <JS_AtomGetStrRT.constprop.0>
   2df91:	48 8d 35 2a a6 0a 00 	lea    0xaa62a(%rip),%rsi        # d85c2 <_IO_stdin_used+0x5c2>
   2df98:	4c 89 e7             	mov    %r12,%rdi
   2df9b:	48 89 c2             	mov    %rax,%rdx
   2df9e:	31 c0                	xor    %eax,%eax
   2dfa0:	e8 5b 77 00 00       	call   35700 <JS_ThrowReferenceError>
   2dfa5:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2dfab:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2dfb1:	0f 8e 09 77 ff ff    	jle    256c0 <JS_CallInternal+0x730>
   2dfb7:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2dfbc:	89 ce                	mov    %ecx,%esi
   2dfbe:	e8 2d cc fe ff       	call   1abf0 <JS_FreeAtom.part.0.isra.0>
   2dfc3:	e9 f8 76 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2dfc8:	48 8b b5 c0 fe ff ff 	mov    -0x140(%rbp),%rsi
   2dfcf:	0f b7 d1             	movzwl %cx,%edx
   2dfd2:	4c 89 e7             	mov    %r12,%rdi
   2dfd5:	31 c9                	xor    %ecx,%ecx
   2dfd7:	e8 c4 78 00 00       	call   358a0 <JS_ThrowReferenceErrorUninitialized2.isra.0>
   2dfdc:	e9 df 76 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2dfe1:	48 8b b5 c0 fe ff ff 	mov    -0x140(%rbp),%rsi
   2dfe8:	48 8b bd 90 fe ff ff 	mov    -0x170(%rbp),%rdi
   2dfef:	0f b7 d1             	movzwl %cx,%edx
   2dff2:	31 c9                	xor    %ecx,%ecx
   2dff4:	e8 a7 78 00 00       	call   358a0 <JS_ThrowReferenceErrorUninitialized2.isra.0>
   2dff9:	e9 c2 76 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2dffe:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2e005:	44 89 d2             	mov    %r10d,%edx
   2e008:	48 89 de             	mov    %rbx,%rsi
   2e00b:	4c 89 e7             	mov    %r12,%rdi
   2e00e:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2e012:	e8 59 42 02 00       	call   52270 <js_binary_logic_slow>
   2e017:	85 c0                	test   %eax,%eax
   2e019:	0f 85 36 16 00 00    	jne    2f655 <JS_CallInternal+0xa6c5>
   2e01f:	48 83 eb 10          	sub    $0x10,%rbx
   2e023:	e9 35 b5 ff ff       	jmp    2955d <JS_CallInternal+0x45cd>
   2e028:	48 8d 35 91 dd 0a 00 	lea    0xadd91(%rip),%rsi        # dbdc0 <_IO_stdin_used+0x3dc0>
   2e02f:	4c 89 e7             	mov    %r12,%rdi
   2e032:	31 c0                	xor    %eax,%eax
   2e034:	e8 c7 76 00 00       	call   35700 <JS_ThrowReferenceError>
   2e039:	e9 82 76 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2e03e:	4c 89 e7             	mov    %r12,%rdi
   2e041:	e8 7a 7a 00 00       	call   35ac0 <__js_poll_interrupts>
   2e046:	85 c0                	test   %eax,%eax
   2e048:	0f 85 72 76 ff ff    	jne    256c0 <JS_CallInternal+0x730>
   2e04e:	e9 c7 c6 ff ff       	jmp    2a71a <JS_CallInternal+0x578a>
   2e053:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2e058:	4c 89 e7             	mov    %r12,%rdi
   2e05b:	e8 60 7a 00 00       	call   35ac0 <__js_poll_interrupts>
   2e060:	85 c0                	test   %eax,%eax
   2e062:	0f 85 58 76 ff ff    	jne    256c0 <JS_CallInternal+0x730>
   2e068:	e9 52 c1 ff ff       	jmp    2a1bf <JS_CallInternal+0x522f>
   2e06d:	0f 1f 00             	nopl   (%rax)
   2e070:	48 8b b5 c0 fe ff ff 	mov    -0x140(%rbp),%rsi
   2e077:	0f b7 d1             	movzwl %cx,%edx
   2e07a:	4c 89 e7             	mov    %r12,%rdi
   2e07d:	31 c9                	xor    %ecx,%ecx
   2e07f:	e8 1c 78 00 00       	call   358a0 <JS_ThrowReferenceErrorUninitialized2.isra.0>
   2e084:	e9 37 76 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2e089:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e08e:	48 89 c2             	mov    %rax,%rdx
   2e091:	48 89 ce             	mov    %rcx,%rsi
   2e094:	e8 37 04 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2e099:	e9 d4 d4 ff ff       	jmp    2b572 <JS_CallInternal+0x65e2>
   2e09e:	4d 89 ef             	mov    %r13,%r15
   2e0a1:	e9 1a 76 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2e0a6:	41 8b 49 14          	mov    0x14(%r9),%ecx
   2e0aa:	e9 47 d8 ff ff       	jmp    2b8f6 <JS_CallInternal+0x6966>
   2e0af:	48 83 c3 10          	add    $0x10,%rbx
   2e0b3:	e9 08 76 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2e0b8:	0f 85 dd 14 00 00    	jne    2f59b <JS_CallInternal+0xa60b>
   2e0be:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e0c3:	48 8b 87 f0 04 00 00 	mov    0x4f0(%rdi),%rax
   2e0ca:	48 85 c0             	test   %rax,%rax
   2e0cd:	0f 84 2d 07 00 00    	je     2e800 <JS_CallInternal+0x9870>
   2e0d3:	f6 40 3c 01          	testb  $0x1,0x3c(%rax)
   2e0d7:	0f 84 23 07 00 00    	je     2e800 <JS_CallInternal+0x9870>
   2e0dd:	89 ce                	mov    %ecx,%esi
   2e0df:	4c 89 e7             	mov    %r12,%rdi
   2e0e2:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2e0e8:	4d 89 ef             	mov    %r13,%r15
   2e0eb:	e8 50 77 00 00       	call   35840 <JS_ThrowReferenceErrorNotDefined>
   2e0f0:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2e0f6:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2e0fc:	0f 8e be 75 ff ff    	jle    256c0 <JS_CallInternal+0x730>
   2e102:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e107:	89 ce                	mov    %ecx,%esi
   2e109:	e8 e2 ca fe ff       	call   1abf0 <JS_FreeAtom.part.0.isra.0>
   2e10e:	e9 ad 75 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2e113:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2e118:	83 fa 08             	cmp    $0x8,%edx
   2e11b:	0f 84 8b 0b 00 00    	je     2ecac <JS_CallInternal+0x9d1c>
   2e121:	83 fa ff             	cmp    $0xffffffff,%edx
   2e124:	0f 84 3e 0b 00 00    	je     2ec68 <JS_CallInternal+0x9cd8>
   2e12a:	8d 42 fe             	lea    -0x2(%rdx),%eax
   2e12d:	83 f8 01             	cmp    $0x1,%eax
   2e130:	0f 86 08 0b 00 00    	jbe    2ec3e <JS_CallInternal+0x9cae>
   2e136:	83 fa f9             	cmp    $0xfffffff9,%edx
   2e139:	0f 85 aa e5 ff ff    	jne    2c6e9 <JS_CallInternal+0x7759>
   2e13f:	41 83 ff f9          	cmp    $0xfffffff9,%r15d
   2e143:	0f 85 a0 e5 ff ff    	jne    2c6e9 <JS_CallInternal+0x7759>
   2e149:	4c 89 c6             	mov    %r8,%rsi
   2e14c:	4c 89 85 00 fe ff ff 	mov    %r8,-0x200(%rbp)
   2e153:	48 89 bd 10 fe ff ff 	mov    %rdi,-0x1f0(%rbp)
   2e15a:	48 89 95 f0 fd ff ff 	mov    %rdx,-0x210(%rbp)
   2e161:	e8 8a b2 fe ff       	call   193f0 <js_string_eq.isra.0>
   2e166:	48 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%rdx
   2e16d:	4c 89 e7             	mov    %r12,%rdi
   2e170:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2e176:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2e17d:	48 89 c6             	mov    %rax,%rsi
   2e180:	e8 cb 04 ff ff       	call   1e650 <JS_FreeValue>
   2e185:	4c 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%r8
   2e18c:	4c 89 c6             	mov    %r8,%rsi
   2e18f:	4c 89 fa             	mov    %r15,%rdx
   2e192:	4c 89 e7             	mov    %r12,%rdi
   2e195:	e8 b6 04 ff ff       	call   1e650 <JS_FreeValue>
   2e19a:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2e1a0:	e9 20 b3 ff ff       	jmp    294c5 <JS_CallInternal+0x4535>
   2e1a5:	83 fa 08             	cmp    $0x8,%edx
   2e1a8:	0f 84 35 0e 00 00    	je     2efe3 <JS_CallInternal+0xa053>
   2e1ae:	83 fa ff             	cmp    $0xffffffff,%edx
   2e1b1:	0f 84 d2 0d 00 00    	je     2ef89 <JS_CallInternal+0x9ff9>
   2e1b7:	8d 42 fe             	lea    -0x2(%rdx),%eax
   2e1ba:	83 f8 01             	cmp    $0x1,%eax
   2e1bd:	0f 86 95 0d 00 00    	jbe    2ef58 <JS_CallInternal+0x9fc8>
   2e1c3:	83 fa f9             	cmp    $0xfffffff9,%edx
   2e1c6:	0f 85 f3 e5 ff ff    	jne    2c7bf <JS_CallInternal+0x782f>
   2e1cc:	83 f9 f9             	cmp    $0xfffffff9,%ecx
   2e1cf:	0f 85 ea e5 ff ff    	jne    2c7bf <JS_CallInternal+0x782f>
   2e1d5:	4c 89 c6             	mov    %r8,%rsi
   2e1d8:	4c 89 85 10 fe ff ff 	mov    %r8,-0x1f0(%rbp)
   2e1df:	48 89 bd 30 fe ff ff 	mov    %rdi,-0x1d0(%rbp)
   2e1e6:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2e1ed:	48 89 95 f0 fd ff ff 	mov    %rdx,-0x210(%rbp)
   2e1f4:	e8 f7 b1 fe ff       	call   193f0 <js_string_eq.isra.0>
   2e1f9:	48 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%rdx
   2e200:	4c 89 e7             	mov    %r12,%rdi
   2e203:	41 89 c7             	mov    %eax,%r15d
   2e206:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2e20d:	48 89 c6             	mov    %rax,%rsi
   2e210:	e8 3b 04 ff ff       	call   1e650 <JS_FreeValue>
   2e215:	4c 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%r8
   2e21c:	4c 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%r9
   2e223:	4c 89 e7             	mov    %r12,%rdi
   2e226:	4c 89 c6             	mov    %r8,%rsi
   2e229:	4c 89 ca             	mov    %r9,%rdx
   2e22c:	e8 1f 04 ff ff       	call   1e650 <JS_FreeValue>
   2e231:	e9 a3 ad ff ff       	jmp    28fd9 <JS_CallInternal+0x4049>
   2e236:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   2e23d:	00 00 00 
   2e240:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e245:	48 89 c2             	mov    %rax,%rdx
   2e248:	48 89 ce             	mov    %rcx,%rsi
   2e24b:	e8 80 02 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2e250:	e9 d4 d4 ff ff       	jmp    2b729 <JS_CallInternal+0x6799>
   2e255:	4c 89 e7             	mov    %r12,%rdi
   2e258:	e8 63 78 00 00       	call   35ac0 <__js_poll_interrupts>
   2e25d:	85 c0                	test   %eax,%eax
   2e25f:	0f 85 5b 74 ff ff    	jne    256c0 <JS_CallInternal+0x730>
   2e265:	e9 39 ae ff ff       	jmp    290a3 <JS_CallInternal+0x4113>
   2e26a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   2e270:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e275:	48 89 c2             	mov    %rax,%rdx
   2e278:	48 89 ce             	mov    %rcx,%rsi
   2e27b:	4c 89 9d 30 fe ff ff 	mov    %r11,-0x1d0(%rbp)
   2e282:	e8 49 02 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2e287:	4c 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%r11
   2e28e:	e9 4a b1 ff ff       	jmp    293dd <JS_CallInternal+0x444d>
   2e293:	48 8b 85 c0 fe ff ff 	mov    -0x140(%rbp),%rax
   2e29a:	48 8d 15 1c a2 0a 00 	lea    0xaa21c(%rip),%rdx        # d84bd <_IO_stdin_used+0x4bd>
   2e2a1:	48 8b 40 30          	mov    0x30(%rax),%rax
   2e2a5:	8b 44 c8 04          	mov    0x4(%rax,%rcx,8),%eax
   2e2a9:	85 c0                	test   %eax,%eax
   2e2ab:	0f 85 c6 10 00 00    	jne    2f377 <JS_CallInternal+0xa3e7>
   2e2b1:	48 8d 35 61 a2 0a 00 	lea    0xaa261(%rip),%rsi        # d8519 <_IO_stdin_used+0x519>
   2e2b8:	4c 89 e7             	mov    %r12,%rdi
   2e2bb:	31 c0                	xor    %eax,%eax
   2e2bd:	e8 3e 74 00 00       	call   35700 <JS_ThrowReferenceError>
   2e2c2:	e9 f9 73 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2e2c7:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e2cc:	48 89 c2             	mov    %rax,%rdx
   2e2cf:	48 89 ce             	mov    %rcx,%rsi
   2e2d2:	e8 f9 01 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2e2d7:	e9 c6 af ff ff       	jmp    292a2 <JS_CallInternal+0x4312>
   2e2dc:	41 83 ff fa          	cmp    $0xfffffffa,%r15d
   2e2e0:	0f 8d 57 e3 ff ff    	jge    2c63d <JS_CallInternal+0x76ad>
   2e2e6:	41 83 ff f8          	cmp    $0xfffffff8,%r15d
   2e2ea:	0f 8c 4d e3 ff ff    	jl     2c63d <JS_CallInternal+0x76ad>
   2e2f0:	e9 ab e3 ff ff       	jmp    2c6a0 <JS_CallInternal+0x7710>
   2e2f5:	0f 1f 00             	nopl   (%rax)
   2e2f8:	4d 89 ef             	mov    %r13,%r15
   2e2fb:	e9 c0 73 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2e300:	4d 89 ef             	mov    %r13,%r15
   2e303:	e9 7a 85 ff ff       	jmp    26882 <JS_CallInternal+0x18f2>
   2e308:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e30d:	48 89 ce             	mov    %rcx,%rsi
   2e310:	e8 bb 01 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2e315:	e9 b7 ba ff ff       	jmp    29dd1 <JS_CallInternal+0x4e41>
   2e31a:	39 c1                	cmp    %eax,%ecx
   2e31c:	0f 85 ea dc ff ff    	jne    2c00c <JS_CallInternal+0x707c>
   2e322:	0f b6 4a 10          	movzbl 0x10(%rdx),%ecx
   2e326:	f7 d1                	not    %ecx
   2e328:	83 e1 12             	and    $0x12,%ecx
   2e32b:	0f 85 db dc ff ff    	jne    2c00c <JS_CallInternal+0x707c>
   2e331:	48 8b 7a 18          	mov    0x18(%rdx),%rdi
   2e335:	48 8b 4f 30          	mov    0x30(%rdi),%rcx
   2e339:	48 85 c9             	test   %rcx,%rcx
   2e33c:	74 0a                	je     2e348 <JS_CallInternal+0x93b8>
   2e33e:	f6 41 10 01          	testb  $0x1,0x10(%rcx)
   2e342:	0f 84 c4 dc ff ff    	je     2c00c <JS_CallInternal+0x707c>
   2e348:	48 8b 72 20          	mov    0x20(%rdx),%rsi
   2e34c:	83 7e 08 00          	cmpl   $0x0,0x8(%rsi)
   2e350:	0f 85 b6 dc ff ff    	jne    2c00c <JS_CallInternal+0x707c>
   2e356:	8d 48 01             	lea    0x1(%rax),%ecx
   2e359:	39 4a 28             	cmp    %ecx,0x28(%rdx)
   2e35c:	0f 82 aa dc ff ff    	jb     2c00c <JS_CallInternal+0x707c>
   2e362:	39 0e                	cmp    %ecx,(%rsi)
   2e364:	73 1c                	jae    2e382 <JS_CallInternal+0x93f2>
   2e366:	44 8b 47 18          	mov    0x18(%rdi),%r8d
   2e36a:	42 f6 44 87 3f 08    	testb  $0x8,0x3f(%rdi,%r8,4)
   2e370:	0f 84 96 dc ff ff    	je     2c00c <JS_CallInternal+0x707c>
   2e376:	89 cf                	mov    %ecx,%edi
   2e378:	45 31 db             	xor    %r11d,%r11d
   2e37b:	48 89 3e             	mov    %rdi,(%rsi)
   2e37e:	4c 89 5e 08          	mov    %r11,0x8(%rsi)
   2e382:	89 4a 38             	mov    %ecx,0x38(%rdx)
   2e385:	89 c0                	mov    %eax,%eax
   2e387:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2e38c:	48 c1 e0 04          	shl    $0x4,%rax
   2e390:	48 03 42 30          	add    0x30(%rdx),%rax
   2e394:	0f 11 00             	movups %xmm0,(%rax)
   2e397:	e9 35 ba ff ff       	jmp    29dd1 <JS_CallInternal+0x4e41>
   2e39c:	0f 1f 40 00          	nopl   0x0(%rax)
   2e3a0:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e3a5:	48 89 c2             	mov    %rax,%rdx
   2e3a8:	48 89 ce             	mov    %rcx,%rsi
   2e3ab:	e8 20 01 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2e3b0:	e9 3d ba ff ff       	jmp    29df2 <JS_CallInternal+0x4e62>
   2e3b5:	4d 89 ef             	mov    %r13,%r15
   2e3b8:	4c 89 db             	mov    %r11,%rbx
   2e3bb:	e9 00 73 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2e3c0:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e3c5:	4c 89 fe             	mov    %r15,%rsi
   2e3c8:	4c 89 c2             	mov    %r8,%rdx
   2e3cb:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2e3d1:	e8 fa 00 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2e3d6:	8b 85 30 fe ff ff    	mov    -0x1d0(%rbp),%eax
   2e3dc:	e9 d6 a8 ff ff       	jmp    28cb7 <JS_CallInternal+0x3d27>
   2e3e1:	0f 85 bc 12 00 00    	jne    2f6a3 <JS_CallInternal+0xa713>
   2e3e7:	49 8b 44 24 10       	mov    0x10(%r12),%rax
   2e3ec:	48 8b 80 f0 04 00 00 	mov    0x4f0(%rax),%rax
   2e3f3:	48 85 c0             	test   %rax,%rax
   2e3f6:	0f 84 54 af ff ff    	je     29350 <JS_CallInternal+0x43c0>
   2e3fc:	f6 40 3c 01          	testb  $0x1,0x3c(%rax)
   2e400:	0f 84 4a af ff ff    	je     29350 <JS_CallInternal+0x43c0>
   2e406:	89 ce                	mov    %ecx,%esi
   2e408:	4c 89 e7             	mov    %r12,%rdi
   2e40b:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2e411:	4d 89 ef             	mov    %r13,%r15
   2e414:	e8 27 74 00 00       	call   35840 <JS_ThrowReferenceErrorNotDefined>
   2e419:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2e41f:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2e425:	0f 8e 95 72 ff ff    	jle    256c0 <JS_CallInternal+0x730>
   2e42b:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e430:	89 ce                	mov    %ecx,%esi
   2e432:	e8 b9 c7 fe ff       	call   1abf0 <JS_FreeAtom.part.0.isra.0>
   2e437:	e9 84 72 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2e43c:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e441:	48 89 ce             	mov    %rcx,%rsi
   2e444:	4c 89 9d 10 fe ff ff 	mov    %r11,-0x1f0(%rbp)
   2e44b:	4c 89 95 30 fe ff ff 	mov    %r10,-0x1d0(%rbp)
   2e452:	e8 79 00 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2e457:	4c 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%r11
   2e45e:	4c 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%r10
   2e465:	e9 2a cc ff ff       	jmp    2b094 <JS_CallInternal+0x6104>
   2e46a:	81 fa f2 00 00 00    	cmp    $0xf2,%edx
   2e470:	7e 22                	jle    2e494 <JS_CallInternal+0x9504>
   2e472:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e477:	48 8b 87 48 04 00 00 	mov    0x448(%rdi),%rax
   2e47e:	48 8b 34 d0          	mov    (%rax,%rdx,8),%rsi
   2e482:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2e485:	83 e8 01             	sub    $0x1,%eax
   2e488:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2e48b:	85 c0                	test   %eax,%eax
   2e48d:	7f 05                	jg     2e494 <JS_CallInternal+0x9504>
   2e48f:	e8 0c 85 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2e494:	48 8d 35 35 d8 0a 00 	lea    0xad835(%rip),%rsi        # dbcd0 <_IO_stdin_used+0x3cd0>
   2e49b:	4c 89 e7             	mov    %r12,%rdi
   2e49e:	31 c0                	xor    %eax,%eax
   2e4a0:	e8 7b 53 00 00       	call   33820 <JS_ThrowTypeError>
   2e4a5:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   2e4ac:	48 c7 43 08 06 00 00 	movq   $0x6,0x8(%rbx)
   2e4b3:	00 
   2e4b4:	e9 d7 90 ff ff       	jmp    27590 <JS_CallInternal+0x2600>
   2e4b9:	4d 89 ef             	mov    %r13,%r15
   2e4bc:	e9 ff 71 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2e4c1:	8b 02                	mov    (%rdx),%eax
   2e4c3:	25 ff ff ff 03       	and    $0x3ffffff,%eax
   2e4c8:	0f 85 a6 84 ff ff    	jne    26974 <JS_CallInternal+0x19e4>
   2e4ce:	48 8d 0d 6f 9c 0a 00 	lea    0xa9c6f(%rip),%rcx        # d8144 <_IO_stdin_used+0x144>
   2e4d5:	4c 89 e7             	mov    %r12,%rdi
   2e4d8:	31 c0                	xor    %eax,%eax
   2e4da:	48 8d 15 27 d9 0a 00 	lea    0xad927(%rip),%rdx        # dbe08 <_IO_stdin_used+0x3e08>
   2e4e1:	e8 4a 55 00 00       	call   33a30 <__JS_ThrowTypeErrorAtom>
   2e4e6:	e9 8b f9 ff ff       	jmp    2de76 <JS_CallInternal+0x8ee6>
   2e4eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2e4f0:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e4f5:	4c 89 d6             	mov    %r10,%rsi
   2e4f8:	4c 89 da             	mov    %r11,%rdx
   2e4fb:	e8 d0 ff fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2e500:	e9 a8 cb ff ff       	jmp    2b0ad <JS_CallInternal+0x611d>
   2e505:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e50a:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2e50e:	89 ca                	mov    %ecx,%edx
   2e510:	e8 bb a4 fe ff       	call   189d0 <JS_AtomGetStrRT.constprop.0>
   2e515:	48 8d 35 3d a0 0a 00 	lea    0xaa03d(%rip),%rsi        # d8559 <_IO_stdin_used+0x559>
   2e51c:	4c 89 e7             	mov    %r12,%rdi
   2e51f:	48 89 c2             	mov    %rax,%rdx
   2e522:	31 c0                	xor    %eax,%eax
   2e524:	e8 f7 52 00 00       	call   33820 <JS_ThrowTypeError>
   2e529:	e9 92 71 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2e52e:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   2e535:	48 c7 43 08 03 00 00 	movq   $0x3,0x8(%rbx)
   2e53c:	00 
   2e53d:	e9 2c c3 ff ff       	jmp    2a86e <JS_CallInternal+0x58de>
   2e542:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e547:	4c 89 ca             	mov    %r9,%rdx
   2e54a:	89 85 10 fe ff ff    	mov    %eax,-0x1f0(%rbp)
   2e550:	4c 89 85 30 fe ff ff 	mov    %r8,-0x1d0(%rbp)
   2e557:	e8 74 ff fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2e55c:	8b 85 10 fe ff ff    	mov    -0x1f0(%rbp),%eax
   2e562:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2e569:	e9 30 a7 ff ff       	jmp    28c9e <JS_CallInternal+0x3d0e>
   2e56e:	09 ca                	or     %ecx,%edx
   2e570:	0f 89 da b1 ff ff    	jns    29750 <JS_CallInternal+0x47c0>
   2e576:	f2 0f 10 05 02 75 0b 	movsd  0xb7502(%rip),%xmm0        # e5a80 <typed_array_size_log2+0x28>
   2e57d:	00 
   2e57e:	e9 d6 f2 ff ff       	jmp    2d859 <JS_CallInternal+0x88c9>
   2e583:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e588:	89 f2                	mov    %esi,%edx
   2e58a:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2e58e:	e8 3d a4 fe ff       	call   189d0 <JS_AtomGetStrRT.constprop.0>
   2e593:	48 89 c2             	mov    %rax,%rdx
   2e596:	e9 69 a2 ff ff       	jmp    28804 <JS_CallInternal+0x3874>
   2e59b:	49 8b 17             	mov    (%r15),%rdx
   2e59e:	41 b8 06 00 00 00    	mov    $0x6,%r8d
   2e5a4:	31 c9                	xor    %ecx,%ecx
   2e5a6:	b8 06 00 00 00       	mov    $0x6,%eax
   2e5ab:	e9 14 85 ff ff       	jmp    26ac4 <JS_CallInternal+0x1b34>
   2e5b0:	8b 09                	mov    (%rcx),%ecx
   2e5b2:	81 e1 ff ff ff 03    	and    $0x3ffffff,%ecx
   2e5b8:	0f 85 c4 a7 ff ff    	jne    28d82 <JS_CallInternal+0x3df2>
   2e5be:	31 c9                	xor    %ecx,%ecx
   2e5c0:	e9 d3 a7 ff ff       	jmp    28d98 <JS_CallInternal+0x3e08>
   2e5c5:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e5ca:	4c 89 d6             	mov    %r10,%rsi
   2e5cd:	4c 89 da             	mov    %r11,%rdx
   2e5d0:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2e5d6:	e8 f5 fe fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2e5db:	8b 85 30 fe ff ff    	mov    -0x1d0(%rbp),%eax
   2e5e1:	e9 51 dc ff ff       	jmp    2c237 <JS_CallInternal+0x72a7>
   2e5e6:	81 fa f2 00 00 00    	cmp    $0xf2,%edx
   2e5ec:	0f 8e a2 fe ff ff    	jle    2e494 <JS_CallInternal+0x9504>
   2e5f2:	31 c0                	xor    %eax,%eax
   2e5f4:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e5f9:	48 8b 8f 48 04 00 00 	mov    0x448(%rdi),%rcx
   2e600:	48 8b 34 d1          	mov    (%rcx,%rdx,8),%rsi
   2e604:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   2e607:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2e60a:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2e60d:	85 d2                	test   %edx,%edx
   2e60f:	7f 13                	jg     2e624 <JS_CallInternal+0x9694>
   2e611:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2e618:	e8 83 83 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2e61d:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2e624:	48 85 c0             	test   %rax,%rax
   2e627:	0f 85 d5 8f ff ff    	jne    27602 <JS_CallInternal+0x2672>
   2e62d:	e9 62 fe ff ff       	jmp    2e494 <JS_CallInternal+0x9504>
   2e632:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   2e638:	f2 0f 10 05 40 74 0b 	movsd  0xb7440(%rip),%xmm0        # e5a80 <typed_array_size_log2+0x28>
   2e63f:	00 
   2e640:	e9 fc d4 ff ff       	jmp    2bb41 <JS_CallInternal+0x6bb1>
   2e645:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e64a:	48 89 c2             	mov    %rax,%rdx
   2e64d:	48 89 ce             	mov    %rcx,%rsi
   2e650:	e8 7b fe fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2e655:	e9 23 d5 ff ff       	jmp    2bb7d <JS_CallInternal+0x6bed>
   2e65a:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e65f:	48 89 ca             	mov    %rcx,%rdx
   2e662:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2e668:	e8 63 fe fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2e66d:	8b 85 30 fe ff ff    	mov    -0x1d0(%rbp),%eax
   2e673:	e9 67 75 ff ff       	jmp    25bdf <JS_CallInternal+0xc4f>
   2e678:	0f 85 42 70 ff ff    	jne    256c0 <JS_CallInternal+0x730>
   2e67e:	49 8b 44 24 10       	mov    0x10(%r12),%rax
   2e683:	48 8b 80 f0 04 00 00 	mov    0x4f0(%rax),%rax
   2e68a:	48 85 c0             	test   %rax,%rax
   2e68d:	0f 84 d0 0c 00 00    	je     2f363 <JS_CallInternal+0xa3d3>
   2e693:	f6 40 3c 01          	testb  $0x1,0x3c(%rax)
   2e697:	0f 84 c6 0c 00 00    	je     2f363 <JS_CallInternal+0xa3d3>
   2e69d:	8b b5 f0 fd ff ff    	mov    -0x210(%rbp),%esi
   2e6a3:	4c 89 e7             	mov    %r12,%rdi
   2e6a6:	e8 95 71 00 00       	call   35840 <JS_ThrowReferenceErrorNotDefined>
   2e6ab:	e9 10 70 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2e6b0:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e6b5:	48 89 c2             	mov    %rax,%rdx
   2e6b8:	48 89 ce             	mov    %rcx,%rsi
   2e6bb:	e8 10 fe fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2e6c0:	e9 7d 74 ff ff       	jmp    25b42 <JS_CallInternal+0xbb2>
   2e6c5:	0f 85 f5 6f ff ff    	jne    256c0 <JS_CallInternal+0x730>
   2e6cb:	49 8b 44 24 10       	mov    0x10(%r12),%rax
   2e6d0:	48 8b 80 f0 04 00 00 	mov    0x4f0(%rax),%rax
   2e6d7:	48 85 c0             	test   %rax,%rax
   2e6da:	0f 84 a2 74 ff ff    	je     25b82 <JS_CallInternal+0xbf2>
   2e6e0:	f6 40 3c 01          	testb  $0x1,0x3c(%rax)
   2e6e4:	0f 84 98 74 ff ff    	je     25b82 <JS_CallInternal+0xbf2>
   2e6ea:	8b b5 f0 fd ff ff    	mov    -0x210(%rbp),%esi
   2e6f0:	4c 89 e7             	mov    %r12,%rdi
   2e6f3:	e8 48 71 00 00       	call   35840 <JS_ThrowReferenceErrorNotDefined>
   2e6f8:	e9 c3 6f ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2e6fd:	48 8d 35 3c d6 0a 00 	lea    0xad63c(%rip),%rsi        # dbd40 <_IO_stdin_used+0x3d40>
   2e704:	4c 89 e7             	mov    %r12,%rdi
   2e707:	31 c0                	xor    %eax,%eax
   2e709:	4d 89 ef             	mov    %r13,%r15
   2e70c:	e8 0f 51 00 00       	call   33820 <JS_ThrowTypeError>
   2e711:	e9 aa 6f ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2e716:	83 f9 f9             	cmp    $0xfffffff9,%ecx
   2e719:	0f 84 0e 10 00 00    	je     2f72d <JS_CallInternal+0xa79d>
   2e71f:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   2e726:	4c 89 7e 30          	mov    %r15,0x30(%rsi)
   2e72a:	49 8b 31             	mov    (%r9),%rsi
   2e72d:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2e731:	e9 00 ee ff ff       	jmp    2d536 <JS_CallInternal+0x85a6>
   2e736:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e73b:	48 89 c2             	mov    %rax,%rdx
   2e73e:	48 89 ce             	mov    %rcx,%rsi
   2e741:	4c 89 9d 30 fe ff ff 	mov    %r11,-0x1d0(%rbp)
   2e748:	e8 83 fd fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2e74d:	4c 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%r11
   2e754:	e9 2d bb ff ff       	jmp    2a286 <JS_CallInternal+0x52f6>
   2e759:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e75e:	48 89 c2             	mov    %rax,%rdx
   2e761:	48 89 ce             	mov    %rcx,%rsi
   2e764:	e8 67 fd fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2e769:	e9 fa d8 ff ff       	jmp    2c068 <JS_CallInternal+0x70d8>
   2e76e:	66 83 78 12 01       	cmpw   $0x1,0x12(%rax)
   2e773:	0f 85 d8 c4 ff ff    	jne    2ac51 <JS_CallInternal+0x5cc1>
   2e779:	f6 40 10 08          	testb  $0x8,0x10(%rax)
   2e77d:	0f 85 ce c4 ff ff    	jne    2ac51 <JS_CallInternal+0x5cc1>
   2e783:	80 7f 10 00          	cmpb   $0x0,0x10(%rdi)
   2e787:	0f 84 c4 c4 ff ff    	je     2ac51 <JS_CallInternal+0x5cc1>
   2e78d:	49 8b 72 08          	mov    0x8(%r10),%rsi
   2e791:	45 31 db             	xor    %r11d,%r11d
   2e794:	48 c1 fa 04          	sar    $0x4,%rdx
   2e798:	49 8b 02             	mov    (%r10),%rax
   2e79b:	83 47 fc 01          	addl   $0x1,-0x4(%rdi)
   2e79f:	49 89 3a             	mov    %rdi,(%r10)
   2e7a2:	4d 89 5a 08          	mov    %r11,0x8(%r10)
   2e7a6:	41 89 52 10          	mov    %edx,0x10(%r10)
   2e7aa:	48 85 f6             	test   %rsi,%rsi
   2e7ad:	74 26                	je     2e7d5 <JS_CallInternal+0x9845>
   2e7af:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e7b4:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2e7bb:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2e7c2:	e8 89 19 ff ff       	call   20150 <js_free_shape>
   2e7c7:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2e7ce:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2e7d5:	48 85 c0             	test   %rax,%rax
   2e7d8:	0f 84 73 c4 ff ff    	je     2ac51 <JS_CallInternal+0x5cc1>
   2e7de:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e7e3:	48 89 c6             	mov    %rax,%rsi
   2e7e6:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2e7ed:	e8 5e 19 ff ff       	call   20150 <js_free_shape>
   2e7f2:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2e7f9:	e9 53 c4 ff ff       	jmp    2ac51 <JS_CallInternal+0x5cc1>
   2e7fe:	66 90                	xchg   %ax,%ax
   2e800:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2e806:	0f 8f c8 0b 00 00    	jg     2f3d4 <JS_CallInternal+0xa444>
   2e80c:	45 31 ff             	xor    %r15d,%r15d
   2e80f:	b8 03 00 00 00       	mov    $0x3,%eax
   2e814:	e9 4f 79 ff ff       	jmp    26168 <JS_CallInternal+0x11d8>
   2e819:	41 83 fa f6          	cmp    $0xfffffff6,%r10d
   2e81d:	0f 86 da e8 ff ff    	jbe    2d0fd <JS_CallInternal+0x816d>
   2e823:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2e826:	83 e8 01             	sub    $0x1,%eax
   2e829:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2e82c:	85 c0                	test   %eax,%eax
   2e82e:	0f 8f c9 e8 ff ff    	jg     2d0fd <JS_CallInternal+0x816d>
   2e834:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e839:	48 89 ce             	mov    %rcx,%rsi
   2e83c:	4c 89 d2             	mov    %r10,%rdx
   2e83f:	4c 89 85 10 fe ff ff 	mov    %r8,-0x1f0(%rbp)
   2e846:	4c 89 8d 30 fe ff ff 	mov    %r9,-0x1d0(%rbp)
   2e84d:	e8 7e fc fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2e852:	4c 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9
   2e859:	4c 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%r8
   2e860:	e9 98 e8 ff ff       	jmp    2d0fd <JS_CallInternal+0x816d>
   2e865:	45 85 ff             	test   %r15d,%r15d
   2e868:	0f 85 c3 dd ff ff    	jne    2c631 <JS_CallInternal+0x76a1>
   2e86e:	e9 2d de ff ff       	jmp    2c6a0 <JS_CallInternal+0x7710>
   2e873:	48 89 f2             	mov    %rsi,%rdx
   2e876:	48 89 fe             	mov    %rdi,%rsi
   2e879:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e87e:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2e885:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2e88c:	e8 3f fc fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2e891:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2e898:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2e89f:	e9 31 d5 ff ff       	jmp    2bdd5 <JS_CallInternal+0x6e45>
   2e8a4:	49 8b 94 24 88 01 00 	mov    0x188(%r12),%rdx
   2e8ab:	00 
   2e8ac:	49 8b 84 24 80 01 00 	mov    0x180(%r12),%rax
   2e8b3:	00 
   2e8b4:	83 fa f6             	cmp    $0xfffffff6,%edx
   2e8b7:	76 04                	jbe    2e8bd <JS_CallInternal+0x992d>
   2e8b9:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2e8bd:	48 89 43 d0          	mov    %rax,-0x30(%rbx)
   2e8c1:	48 89 53 d8          	mov    %rdx,-0x28(%rbx)
   2e8c5:	e9 50 aa ff ff       	jmp    2931a <JS_CallInternal+0x438a>
   2e8ca:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
   2e8d0:	e9 31 e1 ff ff       	jmp    2ca06 <JS_CallInternal+0x7a76>
   2e8d5:	4d 89 ef             	mov    %r13,%r15
   2e8d8:	e9 e3 6d ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2e8dd:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e8e2:	48 89 c2             	mov    %rax,%rdx
   2e8e5:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2e8ec:	e8 df fb fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2e8f1:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2e8f8:	e9 ed a0 ff ff       	jmp    289ea <JS_CallInternal+0x3a5a>
   2e8fd:	f2 0f 10 05 f3 fa 0a 	movsd  0xafaf3(%rip),%xmm0        # de3f8 <__PRETTY_FUNCTION__.0+0xb8>
   2e904:	00 
   2e905:	e9 37 d2 ff ff       	jmp    2bb41 <JS_CallInternal+0x6bb1>
   2e90a:	48 8b bd b0 fe ff ff 	mov    -0x150(%rbp),%rdi
   2e911:	4c 89 c6             	mov    %r8,%rsi
   2e914:	e8 a7 3d ff ff       	call   226c0 <free_var_ref>
   2e919:	e9 18 70 ff ff       	jmp    25936 <JS_CallInternal+0x9a6>
   2e91e:	8b 85 70 fe ff ff    	mov    -0x190(%rbp),%eax
   2e924:	83 e8 02             	sub    $0x2,%eax
   2e927:	83 f8 01             	cmp    $0x1,%eax
   2e92a:	0f 87 74 0a 00 00    	ja     2f3a4 <JS_CallInternal+0xa414>
   2e930:	49 8b 84 24 88 01 00 	mov    0x188(%r12),%rax
   2e937:	00 
   2e938:	49 8b 94 24 80 01 00 	mov    0x180(%r12),%rdx
   2e93f:	00 
   2e940:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2e943:	0f 86 a1 8e ff ff    	jbe    277ea <JS_CallInternal+0x285a>
   2e949:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2e94d:	e9 98 8e ff ff       	jmp    277ea <JS_CallInternal+0x285a>
   2e952:	48 89 f2             	mov    %rsi,%rdx
   2e955:	48 89 fe             	mov    %rdi,%rsi
   2e958:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e95d:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   2e964:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2e96b:	44 89 85 10 fe ff ff 	mov    %r8d,-0x1f0(%rbp)
   2e972:	4c 89 95 30 fe ff ff 	mov    %r10,-0x1d0(%rbp)
   2e979:	e8 52 fb fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2e97e:	48 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%rax
   2e985:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2e98c:	44 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%r8d
   2e993:	4c 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%r10
   2e99a:	e9 7b e0 ff ff       	jmp    2ca1a <JS_CallInternal+0x7a8a>
   2e99f:	48 63 b5 a8 fe ff ff 	movslq -0x158(%rbp),%rsi
   2e9a6:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e9ab:	48 89 95 f0 fd ff ff 	mov    %rdx,-0x210(%rbp)
   2e9b2:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2e9b9:	48 c1 e6 04          	shl    $0x4,%rsi
   2e9bd:	48 89 b5 10 fe ff ff 	mov    %rsi,-0x1f0(%rbp)
   2e9c4:	e8 b7 74 fe ff       	call   15e80 <__js_malloc>
   2e9c9:	4c 8b 95 98 fe ff ff 	mov    -0x168(%rbp),%r10
   2e9d0:	48 8b b5 10 fe ff ff 	mov    -0x1f0(%rbp),%rsi
   2e9d7:	48 89 c2             	mov    %rax,%rdx
   2e9da:	31 c0                	xor    %eax,%eax
   2e9dc:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2e9e3:	4c 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8
   2e9ea:	48 85 d2             	test   %rdx,%rdx
   2e9ed:	0f 84 78 0b 00 00    	je     2f56b <JS_CallInternal+0xa5db>
   2e9f3:	4d 8b 4c 02 08       	mov    0x8(%r10,%rax,1),%r9
   2e9f8:	49 8b 3c 02          	mov    (%r10,%rax,1),%rdi
   2e9fc:	41 83 f9 f6          	cmp    $0xfffffff6,%r9d
   2ea00:	76 04                	jbe    2ea06 <JS_CallInternal+0x9a76>
   2ea02:	83 47 fc 01          	addl   $0x1,-0x4(%rdi)
   2ea06:	48 89 3c 02          	mov    %rdi,(%rdx,%rax,1)
   2ea0a:	4c 89 4c 02 08       	mov    %r9,0x8(%rdx,%rax,1)
   2ea0f:	48 83 c0 10          	add    $0x10,%rax
   2ea13:	48 39 c6             	cmp    %rax,%rsi
   2ea16:	75 db                	jne    2e9f3 <JS_CallInternal+0x9a63>
   2ea18:	8b 85 a8 fe ff ff    	mov    -0x158(%rbp),%eax
   2ea1e:	48 89 51 30          	mov    %rdx,0x30(%rcx)
   2ea22:	89 41 38             	mov    %eax,0x38(%rcx)
   2ea25:	48 89 0b             	mov    %rcx,(%rbx)
   2ea28:	4c 89 43 08          	mov    %r8,0x8(%rbx)
   2ea2c:	e9 e7 89 ff ff       	jmp    27418 <JS_CallInternal+0x2488>
   2ea31:	4c 39 da             	cmp    %r11,%rdx
   2ea34:	0f 85 cf c0 ff ff    	jne    2ab09 <JS_CallInternal+0x5b79>
   2ea3a:	41 8b 41 10          	mov    0x10(%r9),%eax
   2ea3e:	83 f8 ff             	cmp    $0xffffffff,%eax
   2ea41:	0f 84 c2 c0 ff ff    	je     2ab09 <JS_CallInternal+0x5b79>
   2ea47:	48 c1 e0 04          	shl    $0x4,%rax
   2ea4b:	49 03 42 20          	add    0x20(%r10),%rax
   2ea4f:	48 8b 10             	mov    (%rax),%rdx
   2ea52:	48 8b 40 08          	mov    0x8(%rax),%rax
   2ea56:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2ea59:	0f 86 37 db ff ff    	jbe    2c596 <JS_CallInternal+0x7606>
   2ea5f:	e9 2e db ff ff       	jmp    2c592 <JS_CallInternal+0x7602>
   2ea64:	66 83 bd 10 fe ff ff 	cmpw   $0x1,-0x1f0(%rbp)
   2ea6b:	01 
   2ea6c:	0f 85 1c c1 ff ff    	jne    2ab8e <JS_CallInternal+0x5bfe>
   2ea72:	41 f6 42 10 08       	testb  $0x8,0x10(%r10)
   2ea77:	0f 85 11 c1 ff ff    	jne    2ab8e <JS_CallInternal+0x5bfe>
   2ea7d:	66 83 7f 12 01       	cmpw   $0x1,0x12(%rdi)
   2ea82:	0f 85 06 c1 ff ff    	jne    2ab8e <JS_CallInternal+0x5bfe>
   2ea88:	f6 47 10 08          	testb  $0x8,0x10(%rdi)
   2ea8c:	0f 85 fc c0 ff ff    	jne    2ab8e <JS_CallInternal+0x5bfe>
   2ea92:	41 80 7b 10 00       	cmpb   $0x0,0x10(%r11)
   2ea97:	0f 84 f1 c0 ff ff    	je     2ab8e <JS_CallInternal+0x5bfe>
   2ea9d:	80 7a 10 00          	cmpb   $0x0,0x10(%rdx)
   2eaa1:	0f 84 e7 c0 ff ff    	je     2ab8e <JS_CallInternal+0x5bfe>
   2eaa7:	49 8b 49 08          	mov    0x8(%r9),%rcx
   2eaab:	66 49 0f 6e c3       	movq   %r11,%xmm0
   2eab0:	48 c1 fe 04          	sar    $0x4,%rsi
   2eab4:	4d 8b 01             	mov    (%r9),%r8
   2eab7:	66 48 0f 6e fa       	movq   %rdx,%xmm7
   2eabc:	41 83 43 fc 01       	addl   $0x1,-0x4(%r11)
   2eac1:	66 0f 6c c7          	punpcklqdq %xmm7,%xmm0
   2eac5:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2eac9:	41 89 71 10          	mov    %esi,0x10(%r9)
   2eacd:	41 0f 11 01          	movups %xmm0,(%r9)
   2ead1:	48 85 c9             	test   %rcx,%rcx
   2ead4:	74 29                	je     2eaff <JS_CallInternal+0x9b6f>
   2ead6:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2eadb:	48 89 ce             	mov    %rcx,%rsi
   2eade:	4c 89 85 10 fe ff ff 	mov    %r8,-0x1f0(%rbp)
   2eae5:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2eaec:	e8 5f 16 ff ff       	call   20150 <js_free_shape>
   2eaf1:	4c 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%r8
   2eaf8:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2eaff:	4d 85 c0             	test   %r8,%r8
   2eb02:	0f 84 86 c0 ff ff    	je     2ab8e <JS_CallInternal+0x5bfe>
   2eb08:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2eb0d:	4c 89 c6             	mov    %r8,%rsi
   2eb10:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2eb17:	e8 34 16 ff ff       	call   20150 <js_free_shape>
   2eb1c:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2eb23:	e9 66 c0 ff ff       	jmp    2ab8e <JS_CallInternal+0x5bfe>
   2eb28:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   2eb2f:	00 
   2eb30:	66 41 83 7a 12 01    	cmpw   $0x1,0x12(%r10)
   2eb36:	0f 85 52 c0 ff ff    	jne    2ab8e <JS_CallInternal+0x5bfe>
   2eb3c:	41 f6 42 10 08       	testb  $0x8,0x10(%r10)
   2eb41:	0f 85 47 c0 ff ff    	jne    2ab8e <JS_CallInternal+0x5bfe>
   2eb47:	80 7a 10 00          	cmpb   $0x0,0x10(%rdx)
   2eb4b:	0f 84 3d c0 ff ff    	je     2ab8e <JS_CallInternal+0x5bfe>
   2eb51:	49 8b 79 08          	mov    0x8(%r9),%rdi
   2eb55:	45 31 c0             	xor    %r8d,%r8d
   2eb58:	48 c1 fe 04          	sar    $0x4,%rsi
   2eb5c:	49 8b 09             	mov    (%r9),%rcx
   2eb5f:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2eb63:	49 89 11             	mov    %rdx,(%r9)
   2eb66:	4d 89 41 08          	mov    %r8,0x8(%r9)
   2eb6a:	41 89 71 10          	mov    %esi,0x10(%r9)
   2eb6e:	48 85 ff             	test   %rdi,%rdi
   2eb71:	74 29                	je     2eb9c <JS_CallInternal+0x9c0c>
   2eb73:	48 89 fe             	mov    %rdi,%rsi
   2eb76:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2eb7b:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   2eb82:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2eb89:	e8 c2 15 ff ff       	call   20150 <js_free_shape>
   2eb8e:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   2eb95:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2eb9c:	48 85 c9             	test   %rcx,%rcx
   2eb9f:	0f 84 e9 bf ff ff    	je     2ab8e <JS_CallInternal+0x5bfe>
   2eba5:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2ebaa:	48 89 ce             	mov    %rcx,%rsi
   2ebad:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2ebb4:	e8 97 15 ff ff       	call   20150 <js_free_shape>
   2ebb9:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2ebc0:	e9 c9 bf ff ff       	jmp    2ab8e <JS_CallInternal+0x5bfe>
   2ebc5:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2ebca:	48 89 c2             	mov    %rax,%rdx
   2ebcd:	e8 fe f8 fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2ebd2:	e9 40 cf ff ff       	jmp    2bb17 <JS_CallInternal+0x6b87>
   2ebd7:	4d 89 ef             	mov    %r13,%r15
   2ebda:	e9 e1 6a ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2ebdf:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2ebe4:	89 ca                	mov    %ecx,%edx
   2ebe6:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2ebea:	e8 e1 9d fe ff       	call   189d0 <JS_AtomGetStrRT.constprop.0>
   2ebef:	48 89 c2             	mov    %rax,%rdx
   2ebf2:	e9 37 ef ff ff       	jmp    2db2e <JS_CallInternal+0x8b9e>
   2ebf7:	31 ff                	xor    %edi,%edi
   2ebf9:	48 c7 43 f8 03 00 00 	movq   $0x3,-0x8(%rbx)
   2ec00:	00 
   2ec01:	4d 89 ef             	mov    %r13,%r15
   2ec04:	48 89 7b f0          	mov    %rdi,-0x10(%rbx)
   2ec08:	e9 b3 6a ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2ec0d:	48 89 03             	mov    %rax,(%rbx)
   2ec10:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2ec14:	e9 77 89 ff ff       	jmp    27590 <JS_CallInternal+0x2600>
   2ec19:	4d 89 ef             	mov    %r13,%r15
   2ec1c:	e9 9f 6a ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2ec21:	4d 89 ef             	mov    %r13,%r15
   2ec24:	e9 97 6a ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2ec29:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2ec2e:	4c 89 d6             	mov    %r10,%rsi
   2ec31:	4c 89 fa             	mov    %r15,%rdx
   2ec34:	e8 97 f8 fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2ec39:	e9 e7 dc ff ff       	jmp    2c925 <JS_CallInternal+0x7995>
   2ec3e:	41 8d 47 fe          	lea    -0x2(%r15),%eax
   2ec42:	83 f8 01             	cmp    $0x1,%eax
   2ec45:	0f 86 af 09 00 00    	jbe    2f5fa <JS_CallInternal+0xa66a>
   2ec4b:	41 83 ff ff          	cmp    $0xffffffff,%r15d
   2ec4f:	0f 85 94 da ff ff    	jne    2c6e9 <JS_CallInternal+0x7759>
   2ec55:	41 0f b6 48 11       	movzbl 0x11(%r8),%ecx
   2ec5a:	83 e1 01             	and    $0x1,%ecx
   2ec5d:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2ec63:	e9 24 f5 ff ff       	jmp    2e18c <JS_CallInternal+0x91fc>
   2ec68:	41 8d 47 fe          	lea    -0x2(%r15),%eax
   2ec6c:	83 f8 01             	cmp    $0x1,%eax
   2ec6f:	0f 86 8f 09 00 00    	jbe    2f604 <JS_CallInternal+0xa674>
   2ec75:	41 83 ff ff          	cmp    $0xffffffff,%r15d
   2ec79:	0f 85 6a da ff ff    	jne    2c6e9 <JS_CallInternal+0x7759>
   2ec7f:	4c 39 c7             	cmp    %r8,%rdi
   2ec82:	48 89 fe             	mov    %rdi,%rsi
   2ec85:	4c 89 e7             	mov    %r12,%rdi
   2ec88:	4c 89 85 10 fe ff ff 	mov    %r8,-0x1f0(%rbp)
   2ec8f:	0f 94 c1             	sete   %cl
   2ec92:	0f b6 c9             	movzbl %cl,%ecx
   2ec95:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2ec9b:	e8 b0 f9 fe ff       	call   1e650 <JS_FreeValue>
   2eca0:	4c 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%r8
   2eca7:	e9 e0 f4 ff ff       	jmp    2e18c <JS_CallInternal+0x91fc>
   2ecac:	45 85 ff             	test   %r15d,%r15d
   2ecaf:	0f 85 e3 00 00 00    	jne    2ed98 <JS_CallInternal+0x9e08>
   2ecb5:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2ecb9:	66 48 0f 6e ef       	movq   %rdi,%xmm5
   2ecbe:	31 c9                	xor    %ecx,%ecx
   2ecc0:	f2 41 0f 2a c0       	cvtsi2sd %r8d,%xmm0
   2ecc5:	66 0f 2e c5          	ucomisd %xmm5,%xmm0
   2ecc9:	0f 9b c1             	setnp  %cl
   2eccc:	41 0f 45 cf          	cmovne %r15d,%ecx
   2ecd0:	e9 f0 a7 ff ff       	jmp    294c5 <JS_CallInternal+0x4535>
   2ecd5:	66 48 0f 6e c0       	movq   %rax,%xmm0
   2ecda:	83 f9 08             	cmp    $0x8,%ecx
   2ecdd:	74 36                	je     2ed15 <JS_CallInternal+0x9d85>
   2ecdf:	85 c9                	test   %ecx,%ecx
   2ece1:	0f 85 0d ef ff ff    	jne    2dbf4 <JS_CallInternal+0x8c64>
   2ece7:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2eceb:	f2 0f 2a ca          	cvtsi2sd %edx,%xmm1
   2ecef:	31 c0                	xor    %eax,%eax
   2ecf1:	66 0f 2f c8          	comisd %xmm0,%xmm1
   2ecf5:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   2ecfc:	00 
   2ecfd:	0f 97 c0             	seta   %al
   2ed00:	48 83 eb 10          	sub    $0x10,%rbx
   2ed04:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2ed08:	e9 b3 af ff ff       	jmp    29cc0 <JS_CallInternal+0x4d30>
   2ed0d:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2ed11:	f2 0f 2a c0          	cvtsi2sd %eax,%xmm0
   2ed15:	66 48 0f 6e ca       	movq   %rdx,%xmm1
   2ed1a:	eb d3                	jmp    2ecef <JS_CallInternal+0x9d5f>
   2ed1c:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2ed21:	4c 89 c6             	mov    %r8,%rsi
   2ed24:	4c 89 ea             	mov    %r13,%rdx
   2ed27:	89 85 00 fe ff ff    	mov    %eax,-0x200(%rbp)
   2ed2d:	44 89 95 10 fe ff ff 	mov    %r10d,-0x1f0(%rbp)
   2ed34:	e8 97 f7 fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2ed39:	8b 85 00 fe ff ff    	mov    -0x200(%rbp),%eax
   2ed3f:	44 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10d
   2ed46:	e9 17 c7 ff ff       	jmp    2b462 <JS_CallInternal+0x64d2>
   2ed4b:	48 8d 35 84 98 0a 00 	lea    0xa9884(%rip),%rsi        # d85d6 <_IO_stdin_used+0x5d6>
   2ed52:	4c 89 e7             	mov    %r12,%rdi
   2ed55:	31 c0                	xor    %eax,%eax
   2ed57:	4d 89 ef             	mov    %r13,%r15
   2ed5a:	e8 c1 4a 00 00       	call   33820 <JS_ThrowTypeError>
   2ed5f:	e9 5c 69 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2ed64:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2ed69:	4c 89 d6             	mov    %r10,%rsi
   2ed6c:	4c 89 c2             	mov    %r8,%rdx
   2ed6f:	e8 5c f7 fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2ed74:	e9 e1 db ff ff       	jmp    2c95a <JS_CallInternal+0x79ca>
   2ed79:	48 8d 35 6b 97 0a 00 	lea    0xa976b(%rip),%rsi        # d84eb <_IO_stdin_used+0x4eb>
   2ed80:	4c 89 e7             	mov    %r12,%rdi
   2ed83:	4d 89 ef             	mov    %r13,%r15
   2ed86:	e8 95 4a 00 00       	call   33820 <JS_ThrowTypeError>
   2ed8b:	e9 30 69 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2ed90:	4d 89 ef             	mov    %r13,%r15
   2ed93:	e9 28 69 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2ed98:	41 83 ff 08          	cmp    $0x8,%r15d
   2ed9c:	0f 85 47 d9 ff ff    	jne    2c6e9 <JS_CallInternal+0x7759>
   2eda2:	66 48 0f 6e f7       	movq   %rdi,%xmm6
   2eda7:	66 49 0f 6e f8       	movq   %r8,%xmm7
   2edac:	31 c9                	xor    %ecx,%ecx
   2edae:	b8 00 00 00 00       	mov    $0x0,%eax
   2edb3:	66 0f 2e f7          	ucomisd %xmm7,%xmm6
   2edb7:	0f 9b c1             	setnp  %cl
   2edba:	0f 45 c8             	cmovne %eax,%ecx
   2edbd:	e9 03 a7 ff ff       	jmp    294c5 <JS_CallInternal+0x4535>
   2edc2:	4d 89 fb             	mov    %r15,%r11
   2edc5:	49 89 cf             	mov    %rcx,%r15
   2edc8:	48 89 d7             	mov    %rdx,%rdi
   2edcb:	45 31 c0             	xor    %r8d,%r8d
   2edce:	4c 89 d2             	mov    %r10,%rdx
   2edd1:	4c 89 d9             	mov    %r11,%rcx
   2edd4:	4c 89 fe             	mov    %r15,%rsi
   2edd7:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   2edde:	4c 89 9d 08 fe ff ff 	mov    %r11,-0x1f8(%rbp)
   2ede5:	48 89 bd 10 fe ff ff 	mov    %rdi,-0x1f0(%rbp)
   2edec:	e8 bf cf fe ff       	call   1bdb0 <js_strict_eq2.isra.0>
   2edf1:	48 8b b5 10 fe ff ff 	mov    -0x1f0(%rbp),%rsi
   2edf8:	4c 89 fa             	mov    %r15,%rdx
   2edfb:	4c 89 e7             	mov    %r12,%rdi
   2edfe:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2ee04:	e8 47 f8 fe ff       	call   1e650 <JS_FreeValue>
   2ee09:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   2ee10:	4c 8b 9d 08 fe ff ff 	mov    -0x1f8(%rbp),%r11
   2ee17:	e9 7f ee ff ff       	jmp    2dc9b <JS_CallInternal+0x8d0b>
   2ee1c:	48 83 eb 10          	sub    $0x10,%rbx
   2ee20:	4d 89 ef             	mov    %r13,%r15
   2ee23:	e9 98 68 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2ee28:	31 c0                	xor    %eax,%eax
   2ee2a:	41 83 ff ff          	cmp    $0xffffffff,%r15d
   2ee2e:	75 08                	jne    2ee38 <JS_CallInternal+0x9ea8>
   2ee30:	31 c0                	xor    %eax,%eax
   2ee32:	4c 39 d2             	cmp    %r10,%rdx
   2ee35:	0f 94 c0             	sete   %al
   2ee38:	48 89 d6             	mov    %rdx,%rsi
   2ee3b:	4c 89 e7             	mov    %r12,%rdi
   2ee3e:	48 89 ca             	mov    %rcx,%rdx
   2ee41:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   2ee48:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2ee4e:	e8 fd f7 fe ff       	call   1e650 <JS_FreeValue>
   2ee53:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   2ee5a:	4d 89 fb             	mov    %r15,%r11
   2ee5d:	e9 39 ee ff ff       	jmp    2dc9b <JS_CallInternal+0x8d0b>
   2ee62:	45 85 ff             	test   %r15d,%r15d
   2ee65:	0f 85 8f 05 00 00    	jne    2f3fa <JS_CallInternal+0xa46a>
   2ee6b:	66 48 0f 6e ea       	movq   %rdx,%xmm5
   2ee70:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2ee74:	31 c0                	xor    %eax,%eax
   2ee76:	ba 01 00 00 00       	mov    $0x1,%edx
   2ee7b:	f2 41 0f 2a c2       	cvtsi2sd %r10d,%xmm0
   2ee80:	66 0f 2e c5          	ucomisd %xmm5,%xmm0
   2ee84:	0f 9a c0             	setp   %al
   2ee87:	48 0f 45 c2          	cmovne %rdx,%rax
   2ee8b:	e9 a8 a0 ff ff       	jmp    28f38 <JS_CallInternal+0x3fa8>
   2ee90:	48 8b bd 90 fe ff ff 	mov    -0x170(%rbp),%rdi
   2ee97:	48 8d 35 62 ce 0a 00 	lea    0xace62(%rip),%rsi        # dbd00 <_IO_stdin_used+0x3d00>
   2ee9e:	31 c0                	xor    %eax,%eax
   2eea0:	4d 89 ef             	mov    %r13,%r15
   2eea3:	e8 78 49 00 00       	call   33820 <JS_ThrowTypeError>
   2eea8:	e9 13 68 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2eead:	66 48 0f 6e ca       	movq   %rdx,%xmm1
   2eeb2:	83 f9 08             	cmp    $0x8,%ecx
   2eeb5:	0f 84 a2 03 00 00    	je     2f25d <JS_CallInternal+0xa2cd>
   2eebb:	85 c9                	test   %ecx,%ecx
   2eebd:	0f 85 70 e7 ff ff    	jne    2d633 <JS_CallInternal+0x86a3>
   2eec3:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2eec7:	f2 0f 2a c0          	cvtsi2sd %eax,%xmm0
   2eecb:	31 c0                	xor    %eax,%eax
   2eecd:	66 0f 2f c8          	comisd %xmm0,%xmm1
   2eed1:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   2eed8:	00 
   2eed9:	0f 93 c0             	setae  %al
   2eedc:	48 83 eb 10          	sub    $0x10,%rbx
   2eee0:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2eee4:	e9 37 a6 ff ff       	jmp    29520 <JS_CallInternal+0x4590>
   2eee9:	4c 89 fb             	mov    %r15,%rbx
   2eeec:	4d 89 ef             	mov    %r13,%r15
   2eeef:	e9 cc 67 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2eef4:	48 8d 35 b1 96 0a 00 	lea    0xa96b1(%rip),%rsi        # d85ac <_IO_stdin_used+0x5ac>
   2eefb:	4c 89 e7             	mov    %r12,%rdi
   2eefe:	31 c0                	xor    %eax,%eax
   2ef00:	4d 89 ef             	mov    %r13,%r15
   2ef03:	e8 18 49 00 00       	call   33820 <JS_ThrowTypeError>
   2ef08:	e9 b3 67 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2ef0d:	4d 89 ef             	mov    %r13,%r15
   2ef10:	e9 ab 67 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2ef15:	4d 89 ef             	mov    %r13,%r15
   2ef18:	e9 a3 67 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2ef1d:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2ef22:	89 c2                	mov    %eax,%edx
   2ef24:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2ef28:	e8 a3 9a fe ff       	call   189d0 <JS_AtomGetStrRT.constprop.0>
   2ef2d:	48 89 c2             	mov    %rax,%rdx
   2ef30:	e9 2d f0 ff ff       	jmp    2df62 <JS_CallInternal+0x8fd2>
   2ef35:	48 89 f2             	mov    %rsi,%rdx
   2ef38:	48 89 fe             	mov    %rdi,%rsi
   2ef3b:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2ef40:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2ef47:	e8 84 f5 fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2ef4c:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2ef53:	e9 39 d7 ff ff       	jmp    2c691 <JS_CallInternal+0x7701>
   2ef58:	8d 41 fe             	lea    -0x2(%rcx),%eax
   2ef5b:	83 f8 01             	cmp    $0x1,%eax
   2ef5e:	0f 86 5f 07 00 00    	jbe    2f6c3 <JS_CallInternal+0xa733>
   2ef64:	83 f9 ff             	cmp    $0xffffffff,%ecx
   2ef67:	0f 85 52 d8 ff ff    	jne    2c7bf <JS_CallInternal+0x782f>
   2ef6d:	45 0f b6 78 11       	movzbl 0x11(%r8),%r15d
   2ef72:	4c 89 c6             	mov    %r8,%rsi
   2ef75:	48 89 ca             	mov    %rcx,%rdx
   2ef78:	4c 89 e7             	mov    %r12,%rdi
   2ef7b:	41 83 e7 01          	and    $0x1,%r15d
   2ef7f:	e8 cc f6 fe ff       	call   1e650 <JS_FreeValue>
   2ef84:	e9 50 a0 ff ff       	jmp    28fd9 <JS_CallInternal+0x4049>
   2ef89:	8d 41 fe             	lea    -0x2(%rcx),%eax
   2ef8c:	83 f8 01             	cmp    $0x1,%eax
   2ef8f:	0f 86 39 07 00 00    	jbe    2f6ce <JS_CallInternal+0xa73e>
   2ef95:	83 f9 ff             	cmp    $0xffffffff,%ecx
   2ef98:	0f 85 21 d8 ff ff    	jne    2c7bf <JS_CallInternal+0x782f>
   2ef9e:	4c 39 c7             	cmp    %r8,%rdi
   2efa1:	48 89 fe             	mov    %rdi,%rsi
   2efa4:	4c 89 e7             	mov    %r12,%rdi
   2efa7:	4c 89 85 30 fe ff ff 	mov    %r8,-0x1d0(%rbp)
   2efae:	41 0f 94 c7          	sete   %r15b
   2efb2:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   2efb9:	e8 92 f6 fe ff       	call   1e650 <JS_FreeValue>
   2efbe:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2efc5:	4c 89 e7             	mov    %r12,%rdi
   2efc8:	45 0f b6 ff          	movzbl %r15b,%r15d
   2efcc:	4c 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%r9
   2efd3:	4c 89 c6             	mov    %r8,%rsi
   2efd6:	4c 89 ca             	mov    %r9,%rdx
   2efd9:	e8 72 f6 fe ff       	call   1e650 <JS_FreeValue>
   2efde:	e9 f6 9f ff ff       	jmp    28fd9 <JS_CallInternal+0x4049>
   2efe3:	85 c9                	test   %ecx,%ecx
   2efe5:	0f 85 44 03 00 00    	jne    2f32f <JS_CallInternal+0xa39f>
   2efeb:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2efef:	66 48 0f 6e ef       	movq   %rdi,%xmm5
   2eff4:	45 31 ff             	xor    %r15d,%r15d
   2eff7:	f2 41 0f 2a c0       	cvtsi2sd %r8d,%xmm0
   2effc:	66 0f 2e c5          	ucomisd %xmm5,%xmm0
   2f000:	41 0f 9b c7          	setnp  %r15b
   2f004:	44 0f 45 f9          	cmovne %ecx,%r15d
   2f008:	e9 cc 9f ff ff       	jmp    28fd9 <JS_CallInternal+0x4049>
   2f00d:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2f012:	4c 89 c6             	mov    %r8,%rsi
   2f015:	48 89 da             	mov    %rbx,%rdx
   2f018:	e8 b3 f4 fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2f01d:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2f024:	e9 eb e6 ff ff       	jmp    2d714 <JS_CallInternal+0x8784>
   2f029:	41 b8 06 00 00 00    	mov    $0x6,%r8d
   2f02f:	31 c9                	xor    %ecx,%ecx
   2f031:	b8 06 00 00 00       	mov    $0x6,%eax
   2f036:	e9 aa 7a ff ff       	jmp    26ae5 <JS_CallInternal+0x1b55>
   2f03b:	48 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%rdx
   2f042:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2f047:	48 89 de             	mov    %rbx,%rsi
   2f04a:	4c 89 85 30 fe ff ff 	mov    %r8,-0x1d0(%rbp)
   2f051:	e8 7a f4 fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2f056:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2f05d:	e9 51 d7 ff ff       	jmp    2c7b3 <JS_CallInternal+0x7823>
   2f062:	66 48 0f 6e c9       	movq   %rcx,%xmm1
   2f067:	83 f8 08             	cmp    $0x8,%eax
   2f06a:	0f 84 9e e8 ff ff    	je     2d90e <JS_CallInternal+0x897e>
   2f070:	85 c0                	test   %eax,%eax
   2f072:	0f 85 83 a5 ff ff    	jne    295fb <JS_CallInternal+0x466b>
   2f078:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2f07c:	f2 0f 2a c2          	cvtsi2sd %edx,%xmm0
   2f080:	e9 8e e8 ff ff       	jmp    2d913 <JS_CallInternal+0x8983>
   2f085:	4d 89 c3             	mov    %r8,%r11
   2f088:	49 89 d7             	mov    %rdx,%r15
   2f08b:	45 31 c0             	xor    %r8d,%r8d
   2f08e:	4c 89 d2             	mov    %r10,%rdx
   2f091:	4c 89 d9             	mov    %r11,%rcx
   2f094:	4c 89 fe             	mov    %r15,%rsi
   2f097:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   2f09e:	4c 89 9d 08 fe ff ff 	mov    %r11,-0x1f8(%rbp)
   2f0a5:	48 89 bd 10 fe ff ff 	mov    %rdi,-0x1f0(%rbp)
   2f0ac:	e8 ff cc fe ff       	call   1bdb0 <js_strict_eq2.isra.0>
   2f0b1:	48 8b b5 10 fe ff ff 	mov    -0x1f0(%rbp),%rsi
   2f0b8:	4c 89 fa             	mov    %r15,%rdx
   2f0bb:	4c 89 e7             	mov    %r12,%rdi
   2f0be:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2f0c4:	e8 87 f5 fe ff       	call   1e650 <JS_FreeValue>
   2f0c9:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   2f0d0:	4c 8b 9d 08 fe ff ff 	mov    -0x1f8(%rbp),%r11
   2f0d7:	4c 89 e7             	mov    %r12,%rdi
   2f0da:	4c 89 d6             	mov    %r10,%rsi
   2f0dd:	4c 89 da             	mov    %r11,%rdx
   2f0e0:	e8 6b f5 fe ff       	call   1e650 <JS_FreeValue>
   2f0e5:	4c 63 bd 30 fe ff ff 	movslq -0x1d0(%rbp),%r15
   2f0ec:	e9 98 9e ff ff       	jmp    28f89 <JS_CallInternal+0x3ff9>
   2f0f1:	45 31 ff             	xor    %r15d,%r15d
   2f0f4:	41 83 f8 ff          	cmp    $0xffffffff,%r8d
   2f0f8:	75 0a                	jne    2f104 <JS_CallInternal+0xa174>
   2f0fa:	45 31 ff             	xor    %r15d,%r15d
   2f0fd:	4c 39 d7             	cmp    %r10,%rdi
   2f100:	41 0f 94 c7          	sete   %r15b
   2f104:	48 89 fe             	mov    %rdi,%rsi
   2f107:	4c 89 e7             	mov    %r12,%rdi
   2f10a:	4c 89 95 30 fe ff ff 	mov    %r10,-0x1d0(%rbp)
   2f111:	4c 89 85 10 fe ff ff 	mov    %r8,-0x1f0(%rbp)
   2f118:	e8 33 f5 fe ff       	call   1e650 <JS_FreeValue>
   2f11d:	4c 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%r10
   2f124:	4c 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%r11
   2f12b:	4c 89 e7             	mov    %r12,%rdi
   2f12e:	4c 89 d6             	mov    %r10,%rsi
   2f131:	4c 89 da             	mov    %r11,%rdx
   2f134:	e8 17 f5 fe ff       	call   1e650 <JS_FreeValue>
   2f139:	e9 4b 9e ff ff       	jmp    28f89 <JS_CallInternal+0x3ff9>
   2f13e:	45 85 c0             	test   %r8d,%r8d
   2f141:	0f 85 a5 00 00 00    	jne    2f1ec <JS_CallInternal+0xa25c>
   2f147:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2f14b:	66 48 0f 6e ef       	movq   %rdi,%xmm5
   2f150:	45 31 ff             	xor    %r15d,%r15d
   2f153:	b8 00 00 00 00       	mov    $0x0,%eax
   2f158:	f2 41 0f 2a c2       	cvtsi2sd %r10d,%xmm0
   2f15d:	66 0f 2e c5          	ucomisd %xmm5,%xmm0
   2f161:	41 0f 9b c7          	setnp  %r15b
   2f165:	4c 0f 45 f8          	cmovne %rax,%r15
   2f169:	e9 1b 9e ff ff       	jmp    28f89 <JS_CallInternal+0x3ff9>
   2f16e:	4d 89 ef             	mov    %r13,%r15
   2f171:	e9 4a 65 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2f176:	48 8d 35 0a 94 0a 00 	lea    0xa940a(%rip),%rsi        # d8587 <_IO_stdin_used+0x587>
   2f17d:	4c 89 e7             	mov    %r12,%rdi
   2f180:	31 c0                	xor    %eax,%eax
   2f182:	4d 89 ef             	mov    %r13,%r15
   2f185:	e8 96 46 00 00       	call   33820 <JS_ThrowTypeError>
   2f18a:	e9 31 65 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2f18f:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2f194:	89 c2                	mov    %eax,%edx
   2f196:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2f19a:	e8 31 98 fe ff       	call   189d0 <JS_AtomGetStrRT.constprop.0>
   2f19f:	48 89 c2             	mov    %rax,%rdx
   2f1a2:	e9 87 ed ff ff       	jmp    2df2e <JS_CallInternal+0x8f9e>
   2f1a7:	48 8b 85 b0 fe ff ff 	mov    -0x150(%rbp),%rax
   2f1ae:	31 d2                	xor    %edx,%edx
   2f1b0:	48 63 c9             	movslq %ecx,%rcx
   2f1b3:	f3 0f 6f 80 d8 04 00 	movdqu 0x4d8(%rax),%xmm0
   2f1ba:	00 
   2f1bb:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   2f1bf:	48 89 90 d8 04 00 00 	mov    %rdx,0x4d8(%rax)
   2f1c6:	48 c7 80 e0 04 00 00 	movq   $0x4,0x4e0(%rax)
   2f1cd:	04 00 00 00 
   2f1d1:	48 8b 85 c0 fe ff ff 	mov    -0x140(%rbp),%rax
   2f1d8:	48 03 48 18          	add    0x18(%rax),%rcx
   2f1dc:	49 89 cf             	mov    %rcx,%r15
   2f1df:	e9 6d 60 ff ff       	jmp    25251 <JS_CallInternal+0x2c1>
   2f1e4:	4d 89 ef             	mov    %r13,%r15
   2f1e7:	e9 d4 64 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2f1ec:	41 83 f8 08          	cmp    $0x8,%r8d
   2f1f0:	0f 85 1c 05 00 00    	jne    2f712 <JS_CallInternal+0xa782>
   2f1f6:	66 48 0f 6e f7       	movq   %rdi,%xmm6
   2f1fb:	66 49 0f 6e fa       	movq   %r10,%xmm7
   2f200:	45 31 ff             	xor    %r15d,%r15d
   2f203:	b8 00 00 00 00       	mov    $0x0,%eax
   2f208:	66 0f 2e f7          	ucomisd %xmm7,%xmm6
   2f20c:	41 0f 9b c7          	setnp  %r15b
   2f210:	4c 0f 45 f8          	cmovne %rax,%r15
   2f214:	e9 70 9d ff ff       	jmp    28f89 <JS_CallInternal+0x3ff9>
   2f219:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2f21e:	48 89 ce             	mov    %rcx,%rsi
   2f221:	48 89 da             	mov    %rbx,%rdx
   2f224:	4c 89 85 f0 fd ff ff 	mov    %r8,-0x210(%rbp)
   2f22b:	e8 a0 f2 fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2f230:	4c 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8
   2f237:	e9 50 d5 ff ff       	jmp    2c78c <JS_CallInternal+0x77fc>
   2f23c:	48 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%rdx
   2f243:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2f248:	48 89 ce             	mov    %rcx,%rsi
   2f24b:	e8 80 f2 fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2f250:	e9 48 ec ff ff       	jmp    2de9d <JS_CallInternal+0x8f0d>
   2f255:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2f259:	f2 0f 2a ca          	cvtsi2sd %edx,%xmm1
   2f25d:	66 48 0f 6e c0       	movq   %rax,%xmm0
   2f262:	e9 64 fc ff ff       	jmp    2eecb <JS_CallInternal+0x9f3b>
   2f267:	48 8d 35 7a cb 0a 00 	lea    0xacb7a(%rip),%rsi        # dbde8 <_IO_stdin_used+0x3de8>
   2f26e:	4c 89 e7             	mov    %r12,%rdi
   2f271:	31 c0                	xor    %eax,%eax
   2f273:	4d 89 ef             	mov    %r13,%r15
   2f276:	e8 a5 45 00 00       	call   33820 <JS_ThrowTypeError>
   2f27b:	e9 40 64 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2f280:	4d 89 ef             	mov    %r13,%r15
   2f283:	e9 38 64 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2f288:	48 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%rdx
   2f28f:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2f294:	48 89 de             	mov    %rbx,%rsi
   2f297:	e8 34 f2 fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2f29c:	e9 08 76 ff ff       	jmp    268a9 <JS_CallInternal+0x1919>
   2f2a1:	83 f9 08             	cmp    $0x8,%ecx
   2f2a4:	0f 84 7a 02 00 00    	je     2f524 <JS_CallInternal+0xa594>
   2f2aa:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   2f2b1:	4c 89 7e 30          	mov    %r15,0x30(%rsi)
   2f2b5:	49 8b 31             	mov    (%r9),%rsi
   2f2b8:	e9 79 e2 ff ff       	jmp    2d536 <JS_CallInternal+0x85a6>
   2f2bd:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2f2c1:	f2 0f 2a ca          	cvtsi2sd %edx,%xmm1
   2f2c5:	66 48 0f 6e c0       	movq   %rax,%xmm0
   2f2ca:	31 c0                	xor    %eax,%eax
   2f2cc:	66 0f 2f c8          	comisd %xmm0,%xmm1
   2f2d0:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   2f2d7:	00 
   2f2d8:	0f 97 c0             	seta   %al
   2f2db:	48 83 eb 10          	sub    $0x10,%rbx
   2f2df:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2f2e3:	e9 7f 9e ff ff       	jmp    29167 <JS_CallInternal+0x41d7>
   2f2e8:	66 48 0f 6e c0       	movq   %rax,%xmm0
   2f2ed:	83 f9 08             	cmp    $0x8,%ecx
   2f2f0:	74 36                	je     2f328 <JS_CallInternal+0xa398>
   2f2f2:	85 c9                	test   %ecx,%ecx
   2f2f4:	0f 85 a8 e3 ff ff    	jne    2d6a2 <JS_CallInternal+0x8712>
   2f2fa:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2f2fe:	f2 0f 2a ca          	cvtsi2sd %edx,%xmm1
   2f302:	31 c0                	xor    %eax,%eax
   2f304:	66 0f 2f c8          	comisd %xmm0,%xmm1
   2f308:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   2f30f:	00 
   2f310:	0f 93 c0             	setae  %al
   2f313:	48 83 eb 10          	sub    $0x10,%rbx
   2f317:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2f31b:	e9 79 ad ff ff       	jmp    2a099 <JS_CallInternal+0x5109>
   2f320:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2f324:	f2 0f 2a c0          	cvtsi2sd %eax,%xmm0
   2f328:	66 48 0f 6e ca       	movq   %rdx,%xmm1
   2f32d:	eb d3                	jmp    2f302 <JS_CallInternal+0xa372>
   2f32f:	83 f9 08             	cmp    $0x8,%ecx
   2f332:	0f 85 87 d4 ff ff    	jne    2c7bf <JS_CallInternal+0x782f>
   2f338:	66 48 0f 6e f7       	movq   %rdi,%xmm6
   2f33d:	66 49 0f 6e f8       	movq   %r8,%xmm7
   2f342:	45 31 ff             	xor    %r15d,%r15d
   2f345:	b8 00 00 00 00       	mov    $0x0,%eax
   2f34a:	66 0f 2e f7          	ucomisd %xmm7,%xmm6
   2f34e:	41 0f 9b c7          	setnp  %r15b
   2f352:	44 0f 45 f8          	cmovne %eax,%r15d
   2f356:	e9 7e 9c ff ff       	jmp    28fd9 <JS_CallInternal+0x4049>
   2f35b:	4d 89 ef             	mov    %r13,%r15
   2f35e:	e9 5d 63 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2f363:	b8 03 00 00 00       	mov    $0x3,%eax
   2f368:	31 c9                	xor    %ecx,%ecx
   2f36a:	e9 f7 66 ff ff       	jmp    25a66 <JS_CallInternal+0xad6>
   2f36f:	4d 89 ef             	mov    %r13,%r15
   2f372:	e9 49 63 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2f377:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2f37c:	89 c2                	mov    %eax,%edx
   2f37e:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2f382:	e8 49 96 fe ff       	call   189d0 <JS_AtomGetStrRT.constprop.0>
   2f387:	48 89 c2             	mov    %rax,%rdx
   2f38a:	e9 22 ef ff ff       	jmp    2e2b1 <JS_CallInternal+0x9321>
   2f38f:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2f394:	48 89 c2             	mov    %rax,%rdx
   2f397:	48 89 ce             	mov    %rcx,%rsi
   2f39a:	e8 31 f1 fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2f39f:	e9 a4 d6 ff ff       	jmp    2ca48 <JS_CallInternal+0x7ab8>
   2f3a4:	48 8b 85 50 fe ff ff 	mov    -0x1b0(%rbp),%rax
   2f3ab:	48 8b 95 70 fe ff ff 	mov    -0x190(%rbp),%rdx
   2f3b2:	4c 89 e7             	mov    %r12,%rdi
   2f3b5:	48 89 c6             	mov    %rax,%rsi
   2f3b8:	e8 53 b8 01 00       	call   4ac10 <JS_ToObject>
   2f3bd:	48 89 c1             	mov    %rax,%rcx
   2f3c0:	48 89 d0             	mov    %rdx,%rax
   2f3c3:	83 fa 06             	cmp    $0x6,%edx
   2f3c6:	0f 84 50 01 00 00    	je     2f51c <JS_CallInternal+0xa58c>
   2f3cc:	48 89 ca             	mov    %rcx,%rdx
   2f3cf:	e9 16 84 ff ff       	jmp    277ea <JS_CallInternal+0x285a>
   2f3d4:	48 8b 87 48 04 00 00 	mov    0x448(%rdi),%rax
   2f3db:	48 8b 34 c8          	mov    (%rax,%rcx,8),%rsi
   2f3df:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2f3e2:	83 e8 01             	sub    $0x1,%eax
   2f3e5:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2f3e8:	85 c0                	test   %eax,%eax
   2f3ea:	0f 8f 1c f4 ff ff    	jg     2e80c <JS_CallInternal+0x987c>
   2f3f0:	e8 ab 75 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2f3f5:	e9 12 f4 ff ff       	jmp    2e80c <JS_CallInternal+0x987c>
   2f3fa:	41 83 ff 08          	cmp    $0x8,%r15d
   2f3fe:	0f 85 05 01 00 00    	jne    2f509 <JS_CallInternal+0xa579>
   2f404:	66 48 0f 6e f2       	movq   %rdx,%xmm6
   2f409:	66 49 0f 6e fa       	movq   %r10,%xmm7
   2f40e:	31 c0                	xor    %eax,%eax
   2f410:	ba 01 00 00 00       	mov    $0x1,%edx
   2f415:	66 0f 2e f7          	ucomisd %xmm7,%xmm6
   2f419:	0f 9a c0             	setp   %al
   2f41c:	48 0f 45 c2          	cmovne %rdx,%rax
   2f420:	e9 13 9b ff ff       	jmp    28f38 <JS_CallInternal+0x3fa8>
   2f425:	66 48 0f 6e ca       	movq   %rdx,%xmm1
   2f42a:	83 f9 08             	cmp    $0x8,%ecx
   2f42d:	0f 84 92 fe ff ff    	je     2f2c5 <JS_CallInternal+0xa335>
   2f433:	85 c9                	test   %ecx,%ecx
   2f435:	0f 85 eb e3 ff ff    	jne    2d826 <JS_CallInternal+0x8896>
   2f43b:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2f43f:	f2 0f 2a c0          	cvtsi2sd %eax,%xmm0
   2f443:	e9 82 fe ff ff       	jmp    2f2ca <JS_CallInternal+0xa33a>
   2f448:	85 d2                	test   %edx,%edx
   2f44a:	0f 85 05 e3 ff ff    	jne    2d755 <JS_CallInternal+0x87c5>
   2f450:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2f454:	f2 0f 2a cf          	cvtsi2sd %edi,%xmm1
   2f458:	66 48 0f 6e c1       	movq   %rcx,%xmm0
   2f45d:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
   2f461:	48 c7 43 e8 08 00 00 	movq   $0x8,-0x18(%rbx)
   2f468:	00 
   2f469:	f2 0f 11 43 e0       	movsd  %xmm0,-0x20(%rbx)
   2f46e:	e9 c1 6e ff ff       	jmp    26334 <JS_CallInternal+0x13a4>
   2f473:	66 48 0f 6e cf       	movq   %rdi,%xmm1
   2f478:	83 f8 08             	cmp    $0x8,%eax
   2f47b:	74 db                	je     2f458 <JS_CallInternal+0xa4c8>
   2f47d:	85 c0                	test   %eax,%eax
   2f47f:	0f 85 d0 e2 ff ff    	jne    2d755 <JS_CallInternal+0x87c5>
   2f485:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2f489:	f2 0f 2a c1          	cvtsi2sd %ecx,%xmm0
   2f48d:	eb ce                	jmp    2f45d <JS_CallInternal+0xa4cd>
   2f48f:	8d 70 07             	lea    0x7(%rax),%esi
   2f492:	83 fe 01             	cmp    $0x1,%esi
   2f495:	0f 87 ba e2 ff ff    	ja     2d755 <JS_CallInternal+0x87c5>
   2f49b:	48 89 fe             	mov    %rdi,%rsi
   2f49e:	49 89 c0             	mov    %rax,%r8
   2f4a1:	4c 89 e7             	mov    %r12,%rdi
   2f4a4:	4d 89 ef             	mov    %r13,%r15
   2f4a7:	e8 a4 44 01 00       	call   43950 <JS_ConcatString>
   2f4ac:	48 8d 5b f0          	lea    -0x10(%rbx),%rbx
   2f4b0:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2f4b4:	83 7b f8 06          	cmpl   $0x6,-0x8(%rbx)
   2f4b8:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2f4bc:	0f 85 76 6e ff ff    	jne    26338 <JS_CallInternal+0x13a8>
   2f4c2:	e9 f9 61 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2f4c7:	66 48 0f 6e c7       	movq   %rdi,%xmm0
   2f4cc:	83 f8 08             	cmp    $0x8,%eax
   2f4cf:	0f 84 fc e3 ff ff    	je     2d8d1 <JS_CallInternal+0x8941>
   2f4d5:	85 c0                	test   %eax,%eax
   2f4d7:	0f 85 1e a1 ff ff    	jne    295fb <JS_CallInternal+0x466b>
   2f4dd:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2f4e1:	f2 0f 2a c9          	cvtsi2sd %ecx,%xmm1
   2f4e5:	e9 ec e3 ff ff       	jmp    2d8d6 <JS_CallInternal+0x8946>
   2f4ea:	31 ff                	xor    %edi,%edi
   2f4ec:	48 c7 43 08 03 00 00 	movq   $0x3,0x8(%rbx)
   2f4f3:	00 
   2f4f4:	48 83 c3 10          	add    $0x10,%rbx
   2f4f8:	48 89 7b f0          	mov    %rdi,-0x10(%rbx)
   2f4fc:	e9 1e 7f ff ff       	jmp    2741f <JS_CallInternal+0x248f>
   2f501:	4d 89 ef             	mov    %r13,%r15
   2f504:	e9 b7 61 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2f509:	4c 89 d6             	mov    %r10,%rsi
   2f50c:	4c 89 fa             	mov    %r15,%rdx
   2f50f:	4c 89 e7             	mov    %r12,%rdi
   2f512:	e8 39 f1 fe ff       	call   1e650 <JS_FreeValue>
   2f517:	e9 09 d4 ff ff       	jmp    2c925 <JS_CallInternal+0x7995>
   2f51c:	4d 89 ef             	mov    %r13,%r15
   2f51f:	e9 9c 61 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2f524:	66 48 0f 6e c2       	movq   %rdx,%xmm0
   2f529:	f2 41 0f 58 01       	addsd  (%r9),%xmm0
   2f52e:	49 c7 41 08 08 00 00 	movq   $0x8,0x8(%r9)
   2f535:	00 
   2f536:	48 83 eb 10          	sub    $0x10,%rbx
   2f53a:	f2 41 0f 11 01       	movsd  %xmm0,(%r9)
   2f53f:	e9 e3 a2 ff ff       	jmp    29827 <JS_CallInternal+0x4897>
   2f544:	4d 89 ef             	mov    %r13,%r15
   2f547:	e9 74 61 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2f54c:	4d 89 ef             	mov    %r13,%r15
   2f54f:	e9 6c 61 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2f554:	89 ce                	mov    %ecx,%esi
   2f556:	4c 89 e7             	mov    %r12,%rdi
   2f559:	e8 62 62 00 00       	call   357c0 <JS_ThrowReferenceErrorUninitialized>
   2f55e:	e9 5d 61 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2f563:	4d 89 ef             	mov    %r13,%r15
   2f566:	e9 55 61 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2f56b:	4d 8b 6c 24 10       	mov    0x10(%r12),%r13
   2f570:	41 80 bd e9 04 00 00 	cmpb   $0x0,0x4e9(%r13)
   2f577:	00 
   2f578:	74 41                	je     2f5bb <JS_CallInternal+0xa62b>
   2f57a:	4c 89 c2             	mov    %r8,%rdx
   2f57d:	48 89 ce             	mov    %rcx,%rsi
   2f580:	4c 89 e7             	mov    %r12,%rdi
   2f583:	e8 c8 f0 fe ff       	call   1e650 <JS_FreeValue>
   2f588:	45 31 c0             	xor    %r8d,%r8d
   2f58b:	48 c7 43 08 06 00 00 	movq   $0x6,0x8(%rbx)
   2f592:	00 
   2f593:	4c 89 03             	mov    %r8,(%rbx)
   2f596:	e9 f5 7f ff ff       	jmp    27590 <JS_CallInternal+0x2600>
   2f59b:	4d 89 ef             	mov    %r13,%r15
   2f59e:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2f5a4:	0f 8e 16 61 ff ff    	jle    256c0 <JS_CallInternal+0x730>
   2f5aa:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2f5af:	89 ce                	mov    %ecx,%esi
   2f5b1:	e8 3a b6 fe ff       	call   1abf0 <JS_FreeAtom.part.0.isra.0>
   2f5b6:	e9 05 61 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2f5bb:	41 c6 85 e9 04 00 00 	movb   $0x1,0x4e9(%r13)
   2f5c2:	01 
   2f5c3:	48 8d 35 13 8f 0a 00 	lea    0xa8f13(%rip),%rsi        # d84dd <_IO_stdin_used+0x4dd>
   2f5ca:	4c 89 e7             	mov    %r12,%rdi
   2f5cd:	31 c0                	xor    %eax,%eax
   2f5cf:	4c 89 85 00 fe ff ff 	mov    %r8,-0x200(%rbp)
   2f5d6:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   2f5dd:	e8 1e 64 00 00       	call   35a00 <JS_ThrowInternalError>
   2f5e2:	41 c6 85 e9 04 00 00 	movb   $0x0,0x4e9(%r13)
   2f5e9:	00 
   2f5ea:	4c 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%r8
   2f5f1:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   2f5f8:	eb 80                	jmp    2f57a <JS_CallInternal+0xa5ea>
   2f5fa:	b9 01 00 00 00       	mov    $0x1,%ecx
   2f5ff:	e9 c1 9e ff ff       	jmp    294c5 <JS_CallInternal+0x4535>
   2f604:	0f b6 4f 11          	movzbl 0x11(%rdi),%ecx
   2f608:	48 89 fe             	mov    %rdi,%rsi
   2f60b:	4c 89 e7             	mov    %r12,%rdi
   2f60e:	83 e1 01             	and    $0x1,%ecx
   2f611:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2f617:	e8 34 f0 fe ff       	call   1e650 <JS_FreeValue>
   2f61c:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2f622:	e9 9e 9e ff ff       	jmp    294c5 <JS_CallInternal+0x4535>
   2f627:	4d 89 ef             	mov    %r13,%r15
   2f62a:	e9 91 60 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2f62f:	4c 89 d6             	mov    %r10,%rsi
   2f632:	4c 89 fa             	mov    %r15,%rdx
   2f635:	4c 89 e7             	mov    %r12,%rdi
   2f638:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2f63f:	e8 0c f0 fe ff       	call   1e650 <JS_FreeValue>
   2f644:	31 c0                	xor    %eax,%eax
   2f646:	44 39 bd 30 fe ff ff 	cmp    %r15d,-0x1d0(%rbp)
   2f64d:	0f 95 c0             	setne  %al
   2f650:	e9 e3 98 ff ff       	jmp    28f38 <JS_CallInternal+0x3fa8>
   2f655:	4d 89 ef             	mov    %r13,%r15
   2f658:	e9 63 60 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2f65d:	e8 5e 61 00 00       	call   357c0 <JS_ThrowReferenceErrorUninitialized>
   2f662:	e9 59 60 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2f667:	4d 89 ef             	mov    %r13,%r15
   2f66a:	e9 51 60 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2f66f:	4c 89 fb             	mov    %r15,%rbx
   2f672:	4d 89 ef             	mov    %r13,%r15
   2f675:	e9 46 60 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2f67a:	4d 89 ef             	mov    %r13,%r15
   2f67d:	e9 3e 60 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2f682:	48 8d 35 4d 8f 0a 00 	lea    0xa8f4d(%rip),%rsi        # d85d6 <_IO_stdin_used+0x5d6>
   2f689:	4c 89 e7             	mov    %r12,%rdi
   2f68c:	31 c0                	xor    %eax,%eax
   2f68e:	4d 89 ef             	mov    %r13,%r15
   2f691:	e8 8a 41 00 00       	call   33820 <JS_ThrowTypeError>
   2f696:	e9 25 60 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2f69b:	4d 89 ef             	mov    %r13,%r15
   2f69e:	e9 1d 60 ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2f6a3:	4d 89 ef             	mov    %r13,%r15
   2f6a6:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2f6ac:	0f 8e 0e 60 ff ff    	jle    256c0 <JS_CallInternal+0x730>
   2f6b2:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2f6b7:	89 ce                	mov    %ecx,%esi
   2f6b9:	e8 32 b5 fe ff       	call   1abf0 <JS_FreeAtom.part.0.isra.0>
   2f6be:	e9 fd 5f ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2f6c3:	41 bf 01 00 00 00    	mov    $0x1,%r15d
   2f6c9:	e9 0b 99 ff ff       	jmp    28fd9 <JS_CallInternal+0x4049>
   2f6ce:	44 0f b6 7f 11       	movzbl 0x11(%rdi),%r15d
   2f6d3:	48 89 fe             	mov    %rdi,%rsi
   2f6d6:	4c 89 e7             	mov    %r12,%rdi
   2f6d9:	41 83 e7 01          	and    $0x1,%r15d
   2f6dd:	e8 6e ef fe ff       	call   1e650 <JS_FreeValue>
   2f6e2:	e9 f2 98 ff ff       	jmp    28fd9 <JS_CallInternal+0x4049>
   2f6e7:	e8 e4 25 fe ff       	call   11cd0 <__stack_chk_fail@plt>
   2f6ec:	44 39 c2             	cmp    %r8d,%edx
   2f6ef:	4c 89 d6             	mov    %r10,%rsi
   2f6f2:	4c 89 c2             	mov    %r8,%rdx
   2f6f5:	4c 89 e7             	mov    %r12,%rdi
   2f6f8:	41 0f 94 c7          	sete   %r15b
   2f6fc:	e8 4f ef fe ff       	call   1e650 <JS_FreeValue>
   2f701:	45 0f b6 ff          	movzbl %r15b,%r15d
   2f705:	e9 7f 98 ff ff       	jmp    28f89 <JS_CallInternal+0x3ff9>
   2f70a:	4d 89 ef             	mov    %r13,%r15
   2f70d:	e9 ae 5f ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2f712:	4c 89 d6             	mov    %r10,%rsi
   2f715:	4c 89 c2             	mov    %r8,%rdx
   2f718:	4c 89 e7             	mov    %r12,%rdi
   2f71b:	e8 30 ef fe ff       	call   1e650 <JS_FreeValue>
   2f720:	e9 35 d2 ff ff       	jmp    2c95a <JS_CallInternal+0x79ca>
   2f725:	4d 89 ef             	mov    %r13,%r15
   2f728:	e9 93 5f ff ff       	jmp    256c0 <JS_CallInternal+0x730>
   2f72d:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2f734:	49 8b 31             	mov    (%r9),%rsi
   2f737:	4c 89 e7             	mov    %r12,%rdi
   2f73a:	4c 89 8d 10 fe ff ff 	mov    %r9,-0x1f0(%rbp)
   2f741:	48 89 95 30 fe ff ff 	mov    %rdx,-0x1d0(%rbp)
   2f748:	48 83 eb 10          	sub    $0x10,%rbx
   2f74c:	4c 89 78 30          	mov    %r15,0x30(%rax)
   2f750:	48 89 8d 38 fe ff ff 	mov    %rcx,-0x1c8(%rbp)
   2f757:	e8 f4 6c fe ff       	call   16450 <JS_ConcatStringInPlace>
   2f75c:	4c 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%r10
   2f763:	4c 8b 9d 38 fe ff ff 	mov    -0x1c8(%rbp),%r11
   2f76a:	85 c0                	test   %eax,%eax
   2f76c:	4c 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%r9
   2f773:	75 59                	jne    2f7ce <JS_CallInternal+0xa83e>
   2f775:	49 8b 51 08          	mov    0x8(%r9),%rdx
   2f779:	49 8b 01             	mov    (%r9),%rax
   2f77c:	83 fa f6             	cmp    $0xfffffff6,%edx
   2f77f:	76 04                	jbe    2f785 <JS_CallInternal+0xa7f5>
   2f781:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2f785:	4c 89 d1             	mov    %r10,%rcx
   2f788:	4d 89 d8             	mov    %r11,%r8
   2f78b:	48 89 c6             	mov    %rax,%rsi
   2f78e:	4c 89 e7             	mov    %r12,%rdi
   2f791:	4c 89 8d 30 fe ff ff 	mov    %r9,-0x1d0(%rbp)
   2f798:	e8 b3 41 01 00       	call   43950 <JS_ConcatString>
   2f79d:	48 89 c1             	mov    %rax,%rcx
   2f7a0:	48 89 d0             	mov    %rdx,%rax
   2f7a3:	83 fa 06             	cmp    $0x6,%edx
   2f7a6:	0f 84 14 5f ff ff    	je     256c0 <JS_CallInternal+0x730>
   2f7ac:	4c 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9
   2f7b3:	4c 89 e7             	mov    %r12,%rdi
   2f7b6:	49 8b 31             	mov    (%r9),%rsi
   2f7b9:	49 8b 51 08          	mov    0x8(%r9),%rdx
   2f7bd:	49 89 09             	mov    %rcx,(%r9)
   2f7c0:	49 89 41 08          	mov    %rax,0x8(%r9)
   2f7c4:	e8 87 ee fe ff       	call   1e650 <JS_FreeValue>
   2f7c9:	e9 59 a0 ff ff       	jmp    29827 <JS_CallInternal+0x4897>
   2f7ce:	4c 89 d6             	mov    %r10,%rsi
   2f7d1:	4c 89 da             	mov    %r11,%rdx
   2f7d4:	4c 89 e7             	mov    %r12,%rdi
   2f7d7:	e8 74 ee fe ff       	call   1e650 <JS_FreeValue>
   2f7dc:	e9 46 a0 ff ff       	jmp    29827 <JS_CallInternal+0x4897>

Disassembly of section .fini:
