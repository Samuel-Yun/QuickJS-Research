
/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/execution_paths_20261114/attempt01/work/TRANSITION_EDGE_STRONG.release/qjs:     file format elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .plt.got:

Disassembly of section .plt.sec:

Disassembly of section .text:

0000000000025010 <JS_CallInternal>:
   25010:	55                   	push   %rbp
   25011:	48 89 e5             	mov    %rsp,%rbp
   25014:	41 57                	push   %r15
   25016:	4d 89 c7             	mov    %r8,%r15
   25019:	41 56                	push   %r14
   2501b:	49 89 ce             	mov    %rcx,%r14
   2501e:	41 55                	push   %r13
   25020:	49 89 d5             	mov    %rdx,%r13
   25023:	41 54                	push   %r12
   25025:	49 89 f4             	mov    %rsi,%r12
   25028:	53                   	push   %rbx
   25029:	48 81 ec 68 02 00 00 	sub    $0x268,%rsp
   25030:	48 8b 45 10          	mov    0x10(%rbp),%rax
   25034:	48 89 bd 90 fe ff ff 	mov    %rdi,-0x170(%rbp)
   2503b:	48 89 b5 c8 fe ff ff 	mov    %rsi,-0x138(%rbp)
   25042:	48 89 85 58 fe ff ff 	mov    %rax,-0x1a8(%rbp)
   25049:	48 8b 45 18          	mov    0x18(%rbp),%rax
   2504d:	48 89 b5 60 fe ff ff 	mov    %rsi,-0x1a0(%rbp)
   25054:	48 89 85 78 fe ff ff 	mov    %rax,-0x188(%rbp)
   2505b:	48 8b 45 20          	mov    0x20(%rbp),%rax
   2505f:	48 89 95 68 fe ff ff 	mov    %rdx,-0x198(%rbp)
   25066:	48 89 8d 50 fe ff ff 	mov    %rcx,-0x1b0(%rbp)
   2506d:	4c 89 85 70 fe ff ff 	mov    %r8,-0x190(%rbp)
   25074:	44 89 8d a8 fe ff ff 	mov    %r9d,-0x158(%rbp)
   2507b:	48 89 85 98 fe ff ff 	mov    %rax,-0x168(%rbp)
   25082:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
   25089:	00 00 
   2508b:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
   2508f:	48 8b 47 10          	mov    0x10(%rdi),%rax
   25093:	48 89 85 b0 fe ff ff 	mov    %rax,-0x150(%rbp)
   2509a:	8b 87 a8 01 00 00    	mov    0x1a8(%rdi),%eax
   250a0:	89 85 c0 fe ff ff    	mov    %eax,-0x140(%rbp)
   250a6:	83 e8 01             	sub    $0x1,%eax
   250a9:	89 87 a8 01 00 00    	mov    %eax,0x1a8(%rdi)
   250af:	85 c0                	test   %eax,%eax
   250b1:	0f 8e 89 05 00 00    	jle    25640 <JS_CallInternal+0x630>
   250b7:	41 83 fd ff          	cmp    $0xffffffff,%r13d
   250bb:	0f 85 bf 05 00 00    	jne    25680 <JS_CallInternal+0x670>
   250c1:	48 8b 85 c8 fe ff ff 	mov    -0x138(%rbp),%rax
   250c8:	0f b7 40 12          	movzwl 0x12(%rax),%eax
   250cc:	66 83 f8 0d          	cmp    $0xd,%ax
   250d0:	0f 85 a6 07 00 00    	jne    2587c <JS_CallInternal+0x86c>
   250d6:	48 8b 85 c8 fe ff ff 	mov    -0x138(%rbp),%rax
   250dd:	48 8b 40 28          	mov    0x28(%rax),%rax
   250e1:	48 89 85 c0 fe ff ff 	mov    %rax,-0x140(%rbp)
   250e8:	44 0f b7 40 38       	movzwl 0x38(%rax),%r8d
   250ed:	44 3b 85 a8 fe ff ff 	cmp    -0x158(%rbp),%r8d
   250f4:	0f 8f ed 01 00 00    	jg     252e7 <JS_CallInternal+0x2d7>
   250fa:	8b 45 28             	mov    0x28(%rbp),%eax
   250fd:	83 e0 02             	and    $0x2,%eax
   25100:	41 0f 45 c0          	cmovne %r8d,%eax
   25104:	48 8b bd c0 fe ff ff 	mov    -0x140(%rbp),%rdi
   2510b:	4c 8b 9d b0 fe ff ff 	mov    -0x150(%rbp),%r11
   25112:	44 0f b7 57 3a       	movzwl 0x3a(%rdi),%r10d
   25117:	0f b7 77 3e          	movzwl 0x3e(%rdi),%esi
   2511b:	0f b7 57 40          	movzwl 0x40(%rdi),%edx
   2511f:	48 89 ef             	mov    %rbp,%rdi
   25122:	48 89 f1             	mov    %rsi,%rcx
   25125:	44 01 d6             	add    %r10d,%esi
   25128:	4c 89 d3             	mov    %r10,%rbx
   2512b:	01 c6                	add    %eax,%esi
   2512d:	49 89 d1             	mov    %rdx,%r9
   25130:	48 63 f6             	movslq %esi,%rsi
   25133:	48 8d 34 72          	lea    (%rdx,%rsi,2),%rsi
   25137:	48 c1 e6 03          	shl    $0x3,%rsi
   2513b:	48 29 f7             	sub    %rsi,%rdi
   2513e:	49 3b bb d0 04 00 00 	cmp    0x4d0(%r11),%rdi
   25145:	0f 82 c7 07 00 00    	jb     25912 <JS_CallInternal+0x902>
   2514b:	48 8b bd c0 fe ff ff 	mov    -0x140(%rbp),%rdi
   25152:	48 83 c6 17          	add    $0x17,%rsi
   25156:	49 89 f3             	mov    %rsi,%r11
   25159:	0f b6 7f 10          	movzbl 0x10(%rdi),%edi
   2515d:	49 81 e3 00 f0 ff ff 	and    $0xfffffffffffff000,%r11
   25164:	4c 89 a5 08 ff ff ff 	mov    %r12,-0xf8(%rbp)
   2516b:	4c 89 ad 10 ff ff ff 	mov    %r13,-0xf0(%rbp)
   25172:	89 bd 3c ff ff ff    	mov    %edi,-0xc4(%rbp)
   25178:	8b bd a8 fe ff ff    	mov    -0x158(%rbp),%edi
   2517e:	89 bd 38 ff ff ff    	mov    %edi,-0xc8(%rbp)
   25184:	48 8b bd c8 fe ff ff 	mov    -0x138(%rbp),%rdi
   2518b:	48 8b 7f 30          	mov    0x30(%rdi),%rdi
   2518f:	48 89 bd 88 fe ff ff 	mov    %rdi,-0x178(%rbp)
   25196:	48 89 e7             	mov    %rsp,%rdi
   25199:	4c 29 df             	sub    %r11,%rdi
   2519c:	48 39 fc             	cmp    %rdi,%rsp
   2519f:	74 15                	je     251b6 <JS_CallInternal+0x1a6>
   251a1:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
   251a8:	48 83 8c 24 f8 0f 00 	orq    $0x0,0xff8(%rsp)
   251af:	00 00 
   251b1:	48 39 fc             	cmp    %rdi,%rsp
   251b4:	75 eb                	jne    251a1 <JS_CallInternal+0x191>
   251b6:	81 e6 f0 0f 00 00    	and    $0xff0,%esi
   251bc:	48 29 f4             	sub    %rsi,%rsp
   251bf:	48 85 f6             	test   %rsi,%rsi
   251c2:	74 06                	je     251ca <JS_CallInternal+0x1ba>
   251c4:	48 83 4c 34 f8 00    	orq    $0x0,-0x8(%rsp,%rsi,1)
   251ca:	48 8b b5 98 fe ff ff 	mov    -0x168(%rbp),%rsi
   251d1:	48 8d 7c 24 0f       	lea    0xf(%rsp),%rdi
   251d6:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
   251da:	48 89 bd 28 fe ff ff 	mov    %rdi,-0x1d8(%rbp)
   251e1:	48 89 b5 80 fe ff ff 	mov    %rsi,-0x180(%rbp)
   251e8:	85 c0                	test   %eax,%eax
   251ea:	0f 85 b4 61 00 00    	jne    2b3a4 <JS_CallInternal+0x6394>
   251f0:	48 98                	cltq
   251f2:	48 c1 e0 04          	shl    $0x4,%rax
   251f6:	48 01 f8             	add    %rdi,%rax
   251f9:	48 89 85 a0 fe ff ff 	mov    %rax,-0x160(%rbp)
   25200:	48 89 85 20 ff ff ff 	mov    %rax,-0xe0(%rbp)
   25207:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2520e:	48 89 85 18 ff ff ff 	mov    %rax,-0xe8(%rbp)
   25215:	45 85 d2             	test   %r10d,%r10d
   25218:	74 3e                	je     25258 <JS_CallInternal+0x248>
   2521a:	48 8b bd a0 fe ff ff 	mov    -0x160(%rbp),%rdi
   25221:	48 89 de             	mov    %rbx,%rsi
   25224:	48 c1 e6 04          	shl    $0x4,%rsi
   25228:	48 89 f8             	mov    %rdi,%rax
   2522b:	48 01 fe             	add    %rdi,%rsi
   2522e:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   25235:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2523c:	00 00 00 00 
   25240:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
   25247:	48 83 c0 10          	add    $0x10,%rax
   2524b:	48 c7 40 f8 03 00 00 	movq   $0x3,-0x8(%rax)
   25252:	00 
   25253:	48 39 f0             	cmp    %rsi,%rax
   25256:	75 e8                	jne    25240 <JS_CallInternal+0x230>
   25258:	48 c1 e3 04          	shl    $0x4,%rbx
   2525c:	48 c1 e1 04          	shl    $0x4,%rcx
   25260:	48 03 9d a0 fe ff ff 	add    -0x160(%rbp),%rbx
   25267:	48 8d 3c 0b          	lea    (%rbx,%rcx,1),%rdi
   2526b:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
   25272:	66 45 85 c9          	test   %r9w,%r9w
   25276:	74 0b                	je     25283 <JS_CallInternal+0x273>
   25278:	48 c1 e2 03          	shl    $0x3,%rdx
   2527c:	31 f6                	xor    %esi,%esi
   2527e:	e8 dd c5 fe ff       	call   11860 <memset@plt>
   25283:	48 8b 95 b0 fe ff ff 	mov    -0x150(%rbp),%rdx
   2528a:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   25291:	48 89 9d 48 fe ff ff 	mov    %rbx,-0x1b8(%rbp)
   25298:	48 8b 82 f0 04 00 00 	mov    0x4f0(%rdx),%rax
   2529f:	4c 8b 79 18          	mov    0x18(%rcx),%r15
   252a3:	4c 8b 61 48          	mov    0x48(%rcx),%r12
   252a7:	48 8b 8d c8 fe ff ff 	mov    -0x138(%rbp),%rcx
   252ae:	48 89 85 00 ff ff ff 	mov    %rax,-0x100(%rbp)
   252b5:	48 8d 85 00 ff ff ff 	lea    -0x100(%rbp),%rax
   252bc:	48 89 82 f0 04 00 00 	mov    %rax,0x4f0(%rdx)
   252c3:	48 89 8d 40 fe ff ff 	mov    %rcx,-0x1c0(%rbp)
   252ca:	48 89 85 b8 fe ff ff 	mov    %rax,-0x148(%rbp)
   252d1:	41 0f b6 07          	movzbl (%r15),%eax
   252d5:	4c 8d 35 64 4a 0e 00 	lea    0xe4a64(%rip),%r14        # 109d40 <dispatch_table.86>
   252dc:	4d 8d 6f 01          	lea    0x1(%r15),%r13
   252e0:	49 89 c2             	mov    %rax,%r10
   252e3:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   252e7:	44 89 c0             	mov    %r8d,%eax
   252ea:	e9 15 fe ff ff       	jmp    25104 <JS_CallInternal+0xf4>
   252ef:	f3 0f 1e fa          	endbr64
   252f3:	66 90                	xchg   %ax,%ax
   252f5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   252fc:	00 00 00 00 
   25300:	f3 0f 1e fa          	endbr64
   25304:	41 8d 82 4d ff ff ff 	lea    -0xb3(%r10),%eax
   2530b:	48 c7 43 08 00 00 00 	movq   $0x0,0x8(%rbx)
   25312:	00 
   25313:	49 83 c5 01          	add    $0x1,%r13
   25317:	48 83 c3 10          	add    $0x10,%rbx
   2531b:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2531f:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   25324:	49 89 c2             	mov    %rax,%r10
   25327:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2532b:	ff e0                	jmp    *%rax
   2532d:	f3 0f 1e fa          	endbr64
   25331:	0f 1f 40 00          	nopl   0x0(%rax)
   25335:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2533c:	00 00 00 00 
   25340:	f3 0f 1e fa          	endbr64
   25344:	41 8b 45 04          	mov    0x4(%r13),%eax
   25348:	f3 0f 6f 5b f0       	movdqu -0x10(%rbx),%xmm3
   2534d:	4d 8d 7d 09          	lea    0x9(%r13),%r15
   25351:	4c 89 e7             	mov    %r12,%rdi
   25354:	41 8b 4d 00          	mov    0x0(%r13),%ecx
   25358:	44 89 95 00 fe ff ff 	mov    %r10d,-0x200(%rbp)
   2535f:	89 85 20 fe ff ff    	mov    %eax,-0x1e0(%rbp)
   25365:	41 0f b6 45 08       	movzbl 0x8(%r13),%eax
   2536a:	0f 29 9d 30 fe ff ff 	movaps %xmm3,-0x1d0(%rbp)
   25371:	48 8b 95 38 fe ff ff 	mov    -0x1c8(%rbp),%rdx
   25378:	88 85 10 fe ff ff    	mov    %al,-0x1f0(%rbp)
   2537e:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   25385:	89 8d f0 fd ff ff    	mov    %ecx,-0x210(%rbp)
   2538b:	49 89 d5             	mov    %rdx,%r13
   2538e:	4c 89 78 30          	mov    %r15,0x30(%rax)
   25392:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   25399:	48 89 c6             	mov    %rax,%rsi
   2539c:	48 89 85 e8 fd ff ff 	mov    %rax,-0x218(%rbp)
   253a3:	e8 b8 a7 04 00       	call   6fb60 <JS_HasProperty>
   253a8:	85 c0                	test   %eax,%eax
   253aa:	0f 88 90 03 00 00    	js     25740 <JS_CallInternal+0x730>
   253b0:	0f 84 3a 61 00 00    	je     2b4f0 <JS_CallInternal+0x64e0>
   253b6:	80 bd 10 fe ff ff 00 	cmpb   $0x0,-0x1f0(%rbp)
   253bd:	44 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10d
   253c4:	0f 85 04 06 00 00    	jne    259ce <JS_CallInternal+0x9be>
   253ca:	41 83 ea 71          	sub    $0x71,%r10d
   253ce:	41 83 fa 04          	cmp    $0x4,%r10d
   253d2:	0f 87 12 05 00 00    	ja     258ea <JS_CallInternal+0x8da>
   253d8:	48 8d 15 c5 cd 0b 00 	lea    0xbcdc5(%rip),%rdx        # e21a4 <qjsc_repl_size+0x4b8>
   253df:	4a 63 04 92          	movslq (%rdx,%r10,4),%rax
   253e3:	48 01 d0             	add    %rdx,%rax
   253e6:	3e ff e0             	notrack jmp *%rax
   253e9:	f3 0f 1e fa          	endbr64
   253ed:	f3 0f 1e fa          	endbr64
   253f1:	45 8d 8a 14 ff ff ff 	lea    -0xec(%r10),%r9d
   253f8:	4d 89 ef             	mov    %r13,%r15
   253fb:	4d 63 e9             	movslq %r9d,%r13
   253fe:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   25405:	49 89 db             	mov    %rbx,%r11
   25408:	31 c9                	xor    %ecx,%ecx
   2540a:	49 c1 e5 04          	shl    $0x4,%r13
   2540e:	44 89 95 00 fe ff ff 	mov    %r10d,-0x200(%rbp)
   25415:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   2541b:	4c 89 e7             	mov    %r12,%rdi
   2541e:	4d 29 eb             	sub    %r13,%r11
   25421:	4c 89 78 30          	mov    %r15,0x30(%rax)
   25425:	49 8b 73 f0          	mov    -0x10(%r11),%rsi
   25429:	49 8b 53 f8          	mov    -0x8(%r11),%rdx
   2542d:	6a 00                	push   $0x0
   2542f:	41 53                	push   %r11
   25431:	4c 89 9d 10 fe ff ff 	mov    %r11,-0x1f0(%rbp)
   25438:	6a 03                	push   $0x3
   2543a:	6a 00                	push   $0x0
   2543c:	44 89 8d 30 fe ff ff 	mov    %r9d,-0x1d0(%rbp)
   25443:	e8 c8 fb ff ff       	call   25010 <JS_CallInternal>
   25448:	48 83 c4 20          	add    $0x20,%rsp
   2544c:	48 89 c6             	mov    %rax,%rsi
   2544f:	48 89 d0             	mov    %rdx,%rax
   25452:	83 fa 06             	cmp    $0x6,%edx
   25455:	0f 84 e5 02 00 00    	je     25740 <JS_CallInternal+0x730>
   2545b:	48 89 f1             	mov    %rsi,%rcx
   2545e:	83 bd 00 fe ff ff 23 	cmpl   $0x23,-0x200(%rbp)
   25465:	0f 84 97 03 00 00    	je     25802 <JS_CallInternal+0x7f2>
   2546b:	44 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9d
   25472:	4c 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%r11
   25479:	45 85 c9             	test   %r9d,%r9d
   2547c:	0f 88 a9 00 00 00    	js     2552b <JS_CallInternal+0x51b>
   25482:	48 89 9d 10 fe ff ff 	mov    %rbx,-0x1f0(%rbp)
   25489:	4c 89 e0             	mov    %r12,%rax
   2548c:	49 8d 5b f0          	lea    -0x10(%r11),%rbx
   25490:	4f 8d 64 1d 00       	lea    0x0(%r13,%r11,1),%r12
   25495:	48 89 95 00 fe ff ff 	mov    %rdx,-0x200(%rbp)
   2549c:	45 89 cd             	mov    %r9d,%r13d
   2549f:	48 89 b5 f0 fd ff ff 	mov    %rsi,-0x210(%rbp)
   254a6:	eb 21                	jmp    254c9 <JS_CallInternal+0x4b9>
   254a8:	66 90                	xchg   %ax,%ax
   254aa:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   254b1:	00 00 00 00 
   254b5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   254bc:	00 00 00 00 
   254c0:	48 83 c3 10          	add    $0x10,%rbx
   254c4:	4c 39 e3             	cmp    %r12,%rbx
   254c7:	74 47                	je     25510 <JS_CallInternal+0x500>
   254c9:	48 8b 73 08          	mov    0x8(%rbx),%rsi
   254cd:	83 fe f6             	cmp    $0xfffffff6,%esi
   254d0:	76 ee                	jbe    254c0 <JS_CallInternal+0x4b0>
   254d2:	48 8b 3b             	mov    (%rbx),%rdi
   254d5:	8b 4f fc             	mov    -0x4(%rdi),%ecx
   254d8:	8d 51 ff             	lea    -0x1(%rcx),%edx
   254db:	89 57 fc             	mov    %edx,-0x4(%rdi)
   254de:	85 d2                	test   %edx,%edx
   254e0:	7f de                	jg     254c0 <JS_CallInternal+0x4b0>
   254e2:	48 89 f1             	mov    %rsi,%rcx
   254e5:	48 89 fe             	mov    %rdi,%rsi
   254e8:	48 8b 78 10          	mov    0x10(%rax),%rdi
   254ec:	48 83 c3 10          	add    $0x10,%rbx
   254f0:	48 89 ca             	mov    %rcx,%rdx
   254f3:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   254fa:	e8 d1 8f ff ff       	call   1e4d0 <__JS_FreeValueRT>
   254ff:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   25506:	4c 39 e3             	cmp    %r12,%rbx
   25509:	75 be                	jne    254c9 <JS_CallInternal+0x4b9>
   2550b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   25510:	49 89 c4             	mov    %rax,%r12
   25513:	48 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%rbx
   2551a:	48 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%rax
   25521:	45 89 e9             	mov    %r13d,%r9d
   25524:	48 8b b5 f0 fd ff ff 	mov    -0x210(%rbp),%rsi
   2552b:	41 83 c1 01          	add    $0x1,%r9d
   2552f:	4d 8d 6f 01          	lea    0x1(%r15),%r13
   25533:	4d 63 c9             	movslq %r9d,%r9
   25536:	49 c1 e1 04          	shl    $0x4,%r9
   2553a:	4c 29 cb             	sub    %r9,%rbx
   2553d:	48 89 da             	mov    %rbx,%rdx
   25540:	48 8d 5b 10          	lea    0x10(%rbx),%rbx
   25544:	48 89 32             	mov    %rsi,(%rdx)
   25547:	48 89 42 08          	mov    %rax,0x8(%rdx)
   2554b:	41 0f b6 07          	movzbl (%r15),%eax
   2554f:	49 89 c2             	mov    %rax,%r10
   25552:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   25556:	f3 0f 1e fa          	endbr64
   2555a:	f3 0f 1e fa          	endbr64
   2555e:	41 8b 45 00          	mov    0x0(%r13),%eax
   25562:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   25566:	31 f6                	xor    %esi,%esi
   25568:	ba 02 00 00 00       	mov    $0x2,%edx
   2556d:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   25574:	4c 89 e7             	mov    %r12,%rdi
   25577:	b9 01 00 00 00       	mov    $0x1,%ecx
   2557c:	4d 8d 7d 06          	lea    0x6(%r13),%r15
   25580:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   25586:	41 0f b7 45 04       	movzwl 0x4(%r13),%eax
   2558b:	44 89 95 f0 fd ff ff 	mov    %r10d,-0x210(%rbp)
   25592:	66 89 85 00 fe ff ff 	mov    %ax,-0x200(%rbp)
   25599:	e8 52 51 02 00       	call   4a6f0 <JS_NewObjectProtoClass>
   2559e:	48 89 03             	mov    %rax,(%rbx)
   255a1:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   255a5:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   255a9:	0f 84 07 04 00 00    	je     259b6 <JS_CallInternal+0x9a6>
   255af:	44 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%r10d
   255b6:	41 83 fa 78          	cmp    $0x78,%r10d
   255ba:	0f 85 cb 03 00 00    	jne    2598b <JS_CallInternal+0x97b>
   255c0:	0f b7 85 00 fe ff ff 	movzwl -0x200(%rbp),%eax
   255c7:	48 8b 8d 88 fe ff ff 	mov    -0x178(%rbp),%rcx
   255ce:	4c 8b 04 c1          	mov    (%rcx,%rax,8),%r8
   255d2:	41 83 40 fc 01       	addl   $0x1,-0x4(%r8)
   255d7:	48 8b 33             	mov    (%rbx),%rsi
   255da:	8b 95 30 fe ff ff    	mov    -0x1d0(%rbp),%edx
   255e0:	b9 22 00 00 00       	mov    $0x22,%ecx
   255e5:	4c 89 e7             	mov    %r12,%rdi
   255e8:	4c 89 85 00 fe ff ff 	mov    %r8,-0x200(%rbp)
   255ef:	e8 ac 43 02 00       	call   499a0 <add_property>
   255f4:	4c 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%r8
   255fb:	48 85 c0             	test   %rax,%rax
   255fe:	0f 84 86 93 00 00    	je     2e98a <JS_CallInternal+0x997a>
   25604:	4c 89 00             	mov    %r8,(%rax)
   25607:	8b b5 30 fe ff ff    	mov    -0x1d0(%rbp),%esi
   2560d:	31 d2                	xor    %edx,%edx
   2560f:	4c 89 e7             	mov    %r12,%rdi
   25612:	48 83 c3 20          	add    $0x20,%rbx
   25616:	49 83 c5 07          	add    $0x7,%r13
   2561a:	e8 e1 5d 01 00       	call   3b400 <__JS_AtomToValue>
   2561f:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   25626:	48 89 01             	mov    %rax,(%rcx)
   25629:	48 89 51 08          	mov    %rdx,0x8(%rcx)
   2562d:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   25632:	49 89 c2             	mov    %rax,%r10
   25635:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   25639:	ff e0                	jmp    *%rax
   2563b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   25640:	e8 fb 04 01 00       	call   35b40 <__js_poll_interrupts>
   25645:	85 c0                	test   %eax,%eax
   25647:	0f 84 6a fa ff ff    	je     250b7 <JS_CallInternal+0xa7>
   2564d:	31 c0                	xor    %eax,%eax
   2564f:	ba 06 00 00 00       	mov    $0x6,%edx
   25654:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   25658:	64 48 2b 0c 25 28 00 	sub    %fs:0x28,%rcx
   2565f:	00 00 
   25661:	0f 85 00 a1 00 00    	jne    2f767 <JS_CallInternal+0xa757>
   25667:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
   2566b:	5b                   	pop    %rbx
   2566c:	41 5c                	pop    %r12
   2566e:	41 5d                	pop    %r13
   25670:	41 5e                	pop    %r14
   25672:	41 5f                	pop    %r15
   25674:	5d                   	pop    %rbp
   25675:	c3                   	ret
   25676:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   2567d:	00 00 00 
   25680:	f6 45 28 04          	testb  $0x4,0x28(%rbp)
   25684:	0f 84 d6 03 00 00    	je     25a60 <JS_CallInternal+0xa50>
   2568a:	48 8b 85 c8 fe ff ff 	mov    -0x138(%rbp),%rax
   25691:	48 8b 48 58          	mov    0x58(%rax),%rcx
   25695:	48 8b 70 70          	mov    0x70(%rax),%rsi
   25699:	48 8d 50 50          	lea    0x50(%rax),%rdx
   2569d:	48 8b 78 68          	mov    0x68(%rax),%rdi
   256a1:	48 89 95 b8 fe ff ff 	mov    %rdx,-0x148(%rbp)
   256a8:	48 8b 59 28          	mov    0x28(%rcx),%rbx
   256ac:	48 89 8d 40 fe ff ff 	mov    %rcx,-0x1c0(%rbp)
   256b3:	48 8b 49 30          	mov    0x30(%rcx),%rcx
   256b7:	48 89 b5 a0 fe ff ff 	mov    %rsi,-0x160(%rbp)
   256be:	4c 8b 63 48          	mov    0x48(%rbx),%r12
   256c2:	48 89 9d c0 fe ff ff 	mov    %rbx,-0x140(%rbp)
   256c9:	48 89 8d 88 fe ff ff 	mov    %rcx,-0x178(%rbp)
   256d0:	48 89 c1             	mov    %rax,%rcx
   256d3:	0f b7 43 3a          	movzwl 0x3a(%rbx),%eax
   256d7:	44 8b 59 24          	mov    0x24(%rcx),%r11d
   256db:	48 8b 99 90 00 00 00 	mov    0x90(%rcx),%rbx
   256e2:	48 89 bd 28 fe ff ff 	mov    %rdi,-0x1d8(%rbp)
   256e9:	48 c1 e0 04          	shl    $0x4,%rax
   256ed:	4c 8b b9 80 00 00 00 	mov    0x80(%rcx),%r15
   256f4:	48 c7 81 90 00 00 00 	movq   $0x0,0x90(%rcx)
   256fb:	00 00 00 00 
   256ff:	48 01 f0             	add    %rsi,%rax
   25702:	48 8b b5 b0 fe ff ff 	mov    -0x150(%rbp),%rsi
   25709:	48 89 85 48 fe ff ff 	mov    %rax,-0x1b8(%rbp)
   25710:	48 8b 86 f0 04 00 00 	mov    0x4f0(%rsi),%rax
   25717:	48 89 41 50          	mov    %rax,0x50(%rcx)
   2571b:	48 89 96 f0 04 00 00 	mov    %rdx,0x4f0(%rsi)
   25722:	45 85 db             	test   %r11d,%r11d
   25725:	0f 84 97 02 00 00    	je     259c2 <JS_CallInternal+0x9b2>
   2572b:	48 8b 85 28 fe ff ff 	mov    -0x1d8(%rbp),%rax
   25732:	48 89 85 80 fe ff ff 	mov    %rax,-0x180(%rbp)
   25739:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   25740:	48 8b 85 b0 fe ff ff 	mov    -0x150(%rbp),%rax
   25747:	83 b8 e0 04 00 00 ff 	cmpl   $0xffffffff,0x4e0(%rax)
   2574e:	75 41                	jne    25791 <JS_CallInternal+0x781>
   25750:	48 8b 80 d8 04 00 00 	mov    0x4d8(%rax),%rax
   25757:	66 83 78 12 03       	cmpw   $0x3,0x12(%rax)
   2575c:	75 33                	jne    25791 <JS_CallInternal+0x781>
   2575e:	48 8b 48 18          	mov    0x18(%rax),%rcx
   25762:	8b 51 18             	mov    0x18(%rcx),%edx
   25765:	89 d0                	mov    %edx,%eax
   25767:	83 e0 39             	and    $0x39,%eax
   2576a:	8b 44 81 38          	mov    0x38(%rcx,%rax,4),%eax
   2576e:	48 85 c0             	test   %rax,%rax
   25771:	0f 84 8f 69 00 00    	je     2c106 <JS_CallInternal+0x70f6>
   25777:	48 8d 14 95 3c 00 00 	lea    0x3c(,%rdx,4),%rdx
   2577e:	00 
   2577f:	48 8d 44 c2 f8       	lea    -0x8(%rdx,%rax,8),%rax
   25784:	48 01 c8             	add    %rcx,%rax
   25787:	83 78 04 39          	cmpl   $0x39,0x4(%rax)
   2578b:	0f 85 68 69 00 00    	jne    2c0f9 <JS_CallInternal+0x70e9>
   25791:	48 8b 85 b0 fe ff ff 	mov    -0x150(%rbp),%rax
   25798:	80 b8 e8 04 00 00 00 	cmpb   $0x0,0x4e8(%rax)
   2579f:	0f 84 b8 01 00 00    	je     2595d <JS_CallInternal+0x94d>
   257a5:	48 8b 85 c0 fe ff ff 	mov    -0x140(%rbp),%rax
   257ac:	f6 40 11 30          	testb  $0x30,0x11(%rax)
   257b0:	0f 84 7c 63 00 00    	je     2bb32 <JS_CallInternal+0x6b22>
   257b6:	4d 89 fd             	mov    %r15,%r13
   257b9:	b8 06 00 00 00       	mov    $0x6,%eax
   257be:	31 c9                	xor    %ecx,%ecx
   257c0:	48 8b 95 b8 fe ff ff 	mov    -0x148(%rbp),%rdx
   257c7:	4c 89 6a 30          	mov    %r13,0x30(%rdx)
   257cb:	48 89 5a 40          	mov    %rbx,0x40(%rdx)
   257cf:	48 8b 9d b8 fe ff ff 	mov    -0x148(%rbp),%rbx
   257d6:	48 8b 13             	mov    (%rbx),%rdx
   257d9:	48 8b 9d b0 fe ff ff 	mov    -0x150(%rbp),%rbx
   257e0:	48 89 93 f0 04 00 00 	mov    %rdx,0x4f0(%rbx)
   257e7:	48 89 c2             	mov    %rax,%rdx
   257ea:	48 89 c8             	mov    %rcx,%rax
   257ed:	e9 62 fe ff ff       	jmp    25654 <JS_CallInternal+0x644>
   257f2:	f3 0f 1e fa          	endbr64
   257f6:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   257fa:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   257fe:	48 83 eb 10          	sub    $0x10,%rbx
   25802:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
   25809:	66 83 7a 40 00       	cmpw   $0x0,0x40(%rdx)
   2580e:	0f 85 5c 70 00 00    	jne    2c870 <JS_CallInternal+0x7860>
   25814:	4c 8b ad 28 fe ff ff 	mov    -0x1d8(%rbp),%r13
   2581b:	49 39 dd             	cmp    %rbx,%r13
   2581e:	73 af                	jae    257cf <JS_CallInternal+0x7bf>
   25820:	49 89 c6             	mov    %rax,%r14
   25823:	49 89 cf             	mov    %rcx,%r15
   25826:	eb 25                	jmp    2584d <JS_CallInternal+0x83d>
   25828:	66 90                	xchg   %ax,%ax
   2582a:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   25831:	00 00 00 00 
   25835:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2583c:	00 00 00 00 
   25840:	49 83 c5 10          	add    $0x10,%r13
   25844:	49 39 dd             	cmp    %rbx,%r13
   25847:	0f 83 ba 00 00 00    	jae    25907 <JS_CallInternal+0x8f7>
   2584d:	49 8b 75 08          	mov    0x8(%r13),%rsi
   25851:	83 fe f6             	cmp    $0xfffffff6,%esi
   25854:	76 ea                	jbe    25840 <JS_CallInternal+0x830>
   25856:	49 8b 55 00          	mov    0x0(%r13),%rdx
   2585a:	8b 42 fc             	mov    -0x4(%rdx),%eax
   2585d:	83 e8 01             	sub    $0x1,%eax
   25860:	89 42 fc             	mov    %eax,-0x4(%rdx)
   25863:	85 c0                	test   %eax,%eax
   25865:	7f d9                	jg     25840 <JS_CallInternal+0x830>
   25867:	48 89 d0             	mov    %rdx,%rax
   2586a:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2586f:	48 89 f2             	mov    %rsi,%rdx
   25872:	48 89 c6             	mov    %rax,%rsi
   25875:	e8 56 8c ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2587a:	eb c4                	jmp    25840 <JS_CallInternal+0x830>
   2587c:	48 8b 8d b0 fe ff ff 	mov    -0x150(%rbp),%rcx
   25883:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
   25887:	48 c1 e0 03          	shl    $0x3,%rax
   2588b:	48 03 81 58 04 00 00 	add    0x458(%rcx),%rax
   25892:	48 8b 40 18          	mov    0x18(%rax),%rax
   25896:	48 85 c0             	test   %rax,%rax
   25899:	0f 84 c1 01 00 00    	je     25a60 <JS_CallInternal+0xa50>
   2589f:	8b 5d 28             	mov    0x28(%rbp),%ebx
   258a2:	44 8b 8d a8 fe ff ff 	mov    -0x158(%rbp),%r9d
   258a9:	4c 89 f1             	mov    %r14,%rcx
   258ac:	4d 89 f8             	mov    %r15,%r8
   258af:	48 8b bd 90 fe ff ff 	mov    -0x170(%rbp),%rdi
   258b6:	4c 89 e6             	mov    %r12,%rsi
   258b9:	4c 89 ea             	mov    %r13,%rdx
   258bc:	53                   	push   %rbx
   258bd:	ff b5 98 fe ff ff    	push   -0x168(%rbp)
   258c3:	ff d0                	call   *%rax
   258c5:	41 59                	pop    %r9
   258c7:	41 5a                	pop    %r10
   258c9:	e9 86 fd ff ff       	jmp    25654 <JS_CallInternal+0x644>
   258ce:	8b b5 f0 fd ff ff    	mov    -0x210(%rbp),%esi
   258d4:	31 d2                	xor    %edx,%edx
   258d6:	4c 89 e7             	mov    %r12,%rdi
   258d9:	48 83 c3 10          	add    $0x10,%rbx
   258dd:	e8 1e 5b 01 00       	call   3b400 <__JS_AtomToValue>
   258e2:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   258e6:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   258ea:	8b 85 20 fe ff ff    	mov    -0x1e0(%rbp),%eax
   258f0:	83 e8 05             	sub    $0x5,%eax
   258f3:	48 98                	cltq
   258f5:	49 01 c7             	add    %rax,%r15
   258f8:	41 0f b6 07          	movzbl (%r15),%eax
   258fc:	4d 8d 6f 01          	lea    0x1(%r15),%r13
   25900:	49 89 c2             	mov    %rax,%r10
   25903:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   25907:	4c 89 f0             	mov    %r14,%rax
   2590a:	4c 89 f9             	mov    %r15,%rcx
   2590d:	e9 bd fe ff ff       	jmp    257cf <JS_CallInternal+0x7bf>
   25912:	48 8b bd 90 fe ff ff 	mov    -0x170(%rbp),%rdi
   25919:	48 8d 35 ae 2b 0b 00 	lea    0xb2bae(%rip),%rsi        # d84ce <_IO_stdin_used+0x4ce>
   25920:	31 c0                	xor    %eax,%eax
   25922:	e8 59 01 01 00       	call   35a80 <JS_ThrowInternalError>
   25927:	e9 28 fd ff ff       	jmp    25654 <JS_CallInternal+0x644>
   2592c:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   25931:	48 89 ce             	mov    %rcx,%rsi
   25934:	4c 89 ea             	mov    %r13,%rdx
   25937:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2593e:	e8 8d 8b ff ff       	call   1e4d0 <__JS_FreeValueRT>
   25943:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2594a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   25950:	41 83 fd 05          	cmp    $0x5,%r13d
   25954:	0f 84 79 62 00 00    	je     2bbd3 <JS_CallInternal+0x6bc3>
   2595a:	4c 89 f3             	mov    %r14,%rbx
   2595d:	48 39 9d 48 fe ff ff 	cmp    %rbx,-0x1b8(%rbp)
   25964:	0f 83 3b fe ff ff    	jae    257a5 <JS_CallInternal+0x795>
   2596a:	4c 8b 6b f8          	mov    -0x8(%rbx),%r13
   2596e:	4c 8d 73 f0          	lea    -0x10(%rbx),%r14
   25972:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   25976:	41 83 fd f6          	cmp    $0xfffffff6,%r13d
   2597a:	76 d4                	jbe    25950 <JS_CallInternal+0x940>
   2597c:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2597f:	83 e8 01             	sub    $0x1,%eax
   25982:	89 41 fc             	mov    %eax,-0x4(%rcx)
   25985:	85 c0                	test   %eax,%eax
   25987:	7f c7                	jg     25950 <JS_CallInternal+0x940>
   25989:	eb a1                	jmp    2592c <JS_CallInternal+0x91c>
   2598b:	31 c9                	xor    %ecx,%ecx
   2598d:	0f b7 95 00 fe ff ff 	movzwl -0x200(%rbp),%edx
   25994:	41 83 fa 77          	cmp    $0x77,%r10d
   25998:	4c 89 e7             	mov    %r12,%rdi
   2599b:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   259a2:	0f 94 c1             	sete   %cl
   259a5:	e8 86 39 02 00       	call   49330 <get_var_ref>
   259aa:	49 89 c0             	mov    %rax,%r8
   259ad:	48 85 c0             	test   %rax,%rax
   259b0:	0f 85 21 fc ff ff    	jne    255d7 <JS_CallInternal+0x5c7>
   259b6:	48 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%rbx
   259bd:	e9 7e fd ff ff       	jmp    25740 <JS_CallInternal+0x730>
   259c2:	48 89 bd 80 fe ff ff 	mov    %rdi,-0x180(%rbp)
   259c9:	e9 03 f9 ff ff       	jmp    252d1 <JS_CallInternal+0x2c1>
   259ce:	48 83 ec 08          	sub    $0x8,%rsp
   259d2:	4d 89 e9             	mov    %r13,%r9
   259d5:	4c 89 ea             	mov    %r13,%rdx
   259d8:	4c 89 e7             	mov    %r12,%rdi
   259db:	44 89 95 10 fe ff ff 	mov    %r10d,-0x1f0(%rbp)
   259e2:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   259e9:	b9 f1 00 00 00       	mov    $0xf1,%ecx
   259ee:	6a 00                	push   $0x0
   259f0:	48 8b b5 e8 fd ff ff 	mov    -0x218(%rbp),%rsi
   259f7:	e8 04 9f 00 00       	call   2f900 <JS_GetPropertyInternal>
   259fc:	5e                   	pop    %rsi
   259fd:	5f                   	pop    %rdi
   259fe:	49 89 c0             	mov    %rax,%r8
   25a01:	49 89 d5             	mov    %rdx,%r13
   25a04:	83 fa 06             	cmp    $0x6,%edx
   25a07:	0f 84 33 fd ff ff    	je     25740 <JS_CallInternal+0x730>
   25a0d:	83 fa ff             	cmp    $0xffffffff,%edx
   25a10:	44 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10d
   25a17:	0f 84 6e 5a 00 00    	je     2b48b <JS_CallInternal+0x647b>
   25a1d:	83 fa f6             	cmp    $0xfffffff6,%edx
   25a20:	0f 86 a4 f9 ff ff    	jbe    253ca <JS_CallInternal+0x3ba>
   25a26:	8b 40 fc             	mov    -0x4(%rax),%eax
   25a29:	83 e8 01             	sub    $0x1,%eax
   25a2c:	41 89 40 fc          	mov    %eax,-0x4(%r8)
   25a30:	85 c0                	test   %eax,%eax
   25a32:	0f 8f 92 f9 ff ff    	jg     253ca <JS_CallInternal+0x3ba>
   25a38:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   25a3d:	4c 89 c6             	mov    %r8,%rsi
   25a40:	44 89 95 10 fe ff ff 	mov    %r10d,-0x1f0(%rbp)
   25a47:	e8 84 8a ff ff       	call   1e4d0 <__JS_FreeValueRT>
   25a4c:	44 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10d
   25a53:	e9 72 f9 ff ff       	jmp    253ca <JS_CallInternal+0x3ba>
   25a58:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   25a5f:	00 
   25a60:	48 8b bd 90 fe ff ff 	mov    -0x170(%rbp),%rdi
   25a67:	48 8d 35 2c 41 0b 00 	lea    0xb412c(%rip),%rsi        # d9b9a <_IO_stdin_used+0x1b9a>
   25a6e:	31 c0                	xor    %eax,%eax
   25a70:	e8 2b de 00 00       	call   338a0 <JS_ThrowTypeError>
   25a75:	e9 da fb ff ff       	jmp    25654 <JS_CallInternal+0x644>
   25a7a:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   25a81:	48 8b 95 38 fe ff ff 	mov    -0x1c8(%rbp),%rdx
   25a88:	4c 89 e7             	mov    %r12,%rdi
   25a8b:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   25a91:	48 89 c6             	mov    %rax,%rsi
   25a94:	48 89 95 10 fe ff ff 	mov    %rdx,-0x1f0(%rbp)
   25a9b:	49 89 c5             	mov    %rax,%r13
   25a9e:	e8 bd a0 04 00       	call   6fb60 <JS_HasProperty>
   25aa3:	48 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%rdx
   25aaa:	85 c0                	test   %eax,%eax
   25aac:	0f 8e 46 8c 00 00    	jle    2e6f8 <JS_CallInternal+0x96e8>
   25ab2:	48 83 ec 08          	sub    $0x8,%rsp
   25ab6:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   25abc:	49 89 d1             	mov    %rdx,%r9
   25abf:	4c 89 ee             	mov    %r13,%rsi
   25ac2:	6a 00                	push   $0x0
   25ac4:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   25acb:	4c 89 e7             	mov    %r12,%rdi
   25ace:	e8 2d 9e 00 00       	call   2f900 <JS_GetPropertyInternal>
   25ad3:	41 59                	pop    %r9
   25ad5:	41 5a                	pop    %r10
   25ad7:	48 89 c1             	mov    %rax,%rcx
   25ada:	48 89 d0             	mov    %rdx,%rax
   25add:	83 fa 06             	cmp    $0x6,%edx
   25ae0:	0f 84 5a fc ff ff    	je     25740 <JS_CallInternal+0x730>
   25ae6:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   25aea:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   25aee:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   25af2:	48 89 4b f0          	mov    %rcx,-0x10(%rbx)
   25af6:	83 fa f6             	cmp    $0xfffffff6,%edx
   25af9:	0f 86 eb fd ff ff    	jbe    258ea <JS_CallInternal+0x8da>
   25aff:	8b 46 fc             	mov    -0x4(%rsi),%eax
   25b02:	83 e8 01             	sub    $0x1,%eax
   25b05:	89 46 fc             	mov    %eax,-0x4(%rsi)
   25b08:	85 c0                	test   %eax,%eax
   25b0a:	0f 8f da fd ff ff    	jg     258ea <JS_CallInternal+0x8da>
   25b10:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   25b15:	e8 b6 89 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   25b1a:	e9 cb fd ff ff       	jmp    258ea <JS_CallInternal+0x8da>
   25b1f:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   25b26:	48 8b 95 38 fe ff ff 	mov    -0x1c8(%rbp),%rdx
   25b2d:	4c 89 e7             	mov    %r12,%rdi
   25b30:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   25b36:	48 89 c6             	mov    %rax,%rsi
   25b39:	48 89 95 10 fe ff ff 	mov    %rdx,-0x1f0(%rbp)
   25b40:	49 89 c5             	mov    %rax,%r13
   25b43:	e8 18 a0 04 00       	call   6fb60 <JS_HasProperty>
   25b48:	85 c0                	test   %eax,%eax
   25b4a:	0f 88 f0 fb ff ff    	js     25740 <JS_CallInternal+0x730>
   25b50:	48 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%rdx
   25b57:	b8 03 00 00 00       	mov    $0x3,%eax
   25b5c:	b9 00 00 00 00       	mov    $0x0,%ecx
   25b61:	0f 85 85 76 00 00    	jne    2d1ec <JS_CallInternal+0x81dc>
   25b67:	48 89 0b             	mov    %rcx,(%rbx)
   25b6a:	48 83 c3 10          	add    $0x10,%rbx
   25b6e:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   25b72:	e9 73 fd ff ff       	jmp    258ea <JS_CallInternal+0x8da>
   25b77:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   25b7e:	48 8b 95 38 fe ff ff 	mov    -0x1c8(%rbp),%rdx
   25b85:	45 31 c0             	xor    %r8d,%r8d
   25b88:	4c 89 e7             	mov    %r12,%rdi
   25b8b:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   25b91:	48 89 c6             	mov    %rax,%rsi
   25b94:	e8 d7 7c 02 00       	call   4d870 <JS_DeleteProperty>
   25b99:	41 89 c5             	mov    %eax,%r13d
   25b9c:	85 c0                	test   %eax,%eax
   25b9e:	0f 88 9c fb ff ff    	js     25740 <JS_CallInternal+0x730>
   25ba4:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   25ba8:	83 f8 f6             	cmp    $0xfffffff6,%eax
   25bab:	76 15                	jbe    25bc2 <JS_CallInternal+0xbb2>
   25bad:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   25bb1:	8b 51 fc             	mov    -0x4(%rcx),%edx
   25bb4:	83 ea 01             	sub    $0x1,%edx
   25bb7:	89 51 fc             	mov    %edx,-0x4(%rcx)
   25bba:	85 d2                	test   %edx,%edx
   25bbc:	0f 8e 6e 8b 00 00    	jle    2e730 <JS_CallInternal+0x9720>
   25bc2:	31 c0                	xor    %eax,%eax
   25bc4:	45 85 ed             	test   %r13d,%r13d
   25bc7:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   25bce:	00 
   25bcf:	0f 95 c0             	setne  %al
   25bd2:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   25bd6:	e9 0f fd ff ff       	jmp    258ea <JS_CallInternal+0x8da>
   25bdb:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   25be2:	48 8b 95 38 fe ff ff 	mov    -0x1c8(%rbp),%rdx
   25be9:	4c 89 e7             	mov    %r12,%rdi
   25bec:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   25bf2:	48 89 c6             	mov    %rax,%rsi
   25bf5:	e8 66 9f 04 00       	call   6fb60 <JS_HasProperty>
   25bfa:	85 c0                	test   %eax,%eax
   25bfc:	0f 8e 43 8b 00 00    	jle    2e745 <JS_CallInternal+0x9735>
   25c02:	48 83 ec 08          	sub    $0x8,%rsp
   25c06:	4c 8b 43 e0          	mov    -0x20(%rbx),%r8
   25c0a:	4c 8b 4b e8          	mov    -0x18(%rbx),%r9
   25c0e:	4c 89 e7             	mov    %r12,%rdi
   25c11:	4c 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%r10
   25c18:	4c 8b 9d 38 fe ff ff 	mov    -0x1c8(%rbp),%r11
   25c1f:	68 00 80 00 00       	push   $0x8000
   25c24:	4c 8d 6b e0          	lea    -0x20(%rbx),%r13
   25c28:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   25c2e:	41 53                	push   %r11
   25c30:	4c 89 d6             	mov    %r10,%rsi
   25c33:	4c 89 da             	mov    %r11,%rdx
   25c36:	41 52                	push   %r10
   25c38:	e8 13 aa 00 00       	call   30650 <JS_SetPropertyInternal>
   25c3d:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   25c41:	48 83 c4 20          	add    $0x20,%rsp
   25c45:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   25c48:	76 15                	jbe    25c5f <JS_CallInternal+0xc4f>
   25c4a:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   25c4e:	8b 5e fc             	mov    -0x4(%rsi),%ebx
   25c51:	8d 53 ff             	lea    -0x1(%rbx),%edx
   25c54:	89 56 fc             	mov    %edx,-0x4(%rsi)
   25c57:	85 d2                	test   %edx,%edx
   25c59:	0f 8e 7b 8a 00 00    	jle    2e6da <JS_CallInternal+0x96ca>
   25c5f:	4c 89 eb             	mov    %r13,%rbx
   25c62:	85 c0                	test   %eax,%eax
   25c64:	0f 89 80 fc ff ff    	jns    258ea <JS_CallInternal+0x8da>
   25c6a:	e9 d1 fa ff ff       	jmp    25740 <JS_CallInternal+0x730>
   25c6f:	90                   	nop
   25c70:	f3 0f 1e fa          	endbr64
   25c74:	f3 0f 1e fa          	endbr64
   25c78:	48 8b 85 c0 fe ff ff 	mov    -0x140(%rbp),%rax
   25c7f:	4c 89 ea             	mov    %r13,%rdx
   25c82:	44 89 d1             	mov    %r10d,%ecx
   25c85:	4c 89 e7             	mov    %r12,%rdi
   25c88:	48 8d 35 b9 61 0b 00 	lea    0xb61b9(%rip),%rsi        # dbe48 <_IO_stdin_used+0x3e48>
   25c8f:	4d 89 ef             	mov    %r13,%r15
   25c92:	48 2b 50 18          	sub    0x18(%rax),%rdx
   25c96:	31 c0                	xor    %eax,%eax
   25c98:	83 ea 01             	sub    $0x1,%edx
   25c9b:	e8 e0 fd 00 00       	call   35a80 <JS_ThrowInternalError>
   25ca0:	e9 9b fa ff ff       	jmp    25740 <JS_CallInternal+0x730>
   25ca5:	f3 0f 1e fa          	endbr64
   25ca9:	f3 0f 1e fa          	endbr64
   25cad:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
   25cb2:	48 8b 8d 88 fe ff ff 	mov    -0x178(%rbp),%rcx
   25cb9:	4d 8d 7d 02          	lea    0x2(%r13),%r15
   25cbd:	48 8b 0c c1          	mov    (%rcx,%rax,8),%rcx
   25cc1:	4c 8d 0c c5 00 00 00 	lea    0x0(,%rax,8),%r9
   25cc8:	00 
   25cc9:	48 8b 41 18          	mov    0x18(%rcx),%rax
   25ccd:	48 8b 50 08          	mov    0x8(%rax),%rdx
   25cd1:	83 fa 04             	cmp    $0x4,%edx
   25cd4:	0f 84 f0 62 00 00    	je     2bfca <JS_CallInternal+0x6fba>
   25cda:	80 79 12 00          	cmpb   $0x0,0x12(%rcx)
   25cde:	0f 85 e6 62 00 00    	jne    2bfca <JS_CallInternal+0x6fba>
   25ce4:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   25ce9:	48 8b 08             	mov    (%rax),%rcx
   25cec:	0f 11 00             	movups %xmm0,(%rax)
   25cef:	83 fa f6             	cmp    $0xfffffff6,%edx
   25cf2:	76 11                	jbe    25d05 <JS_CallInternal+0xcf5>
   25cf4:	8b 41 fc             	mov    -0x4(%rcx),%eax
   25cf7:	83 e8 01             	sub    $0x1,%eax
   25cfa:	89 41 fc             	mov    %eax,-0x4(%rcx)
   25cfd:	85 c0                	test   %eax,%eax
   25cff:	0f 8e d3 6b 00 00    	jle    2c8d8 <JS_CallInternal+0x78c8>
   25d05:	48 83 eb 10          	sub    $0x10,%rbx
   25d09:	41 0f b6 45 02       	movzbl 0x2(%r13),%eax
   25d0e:	49 83 c5 03          	add    $0x3,%r13
   25d12:	49 89 c2             	mov    %rax,%r10
   25d15:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   25d19:	ff e0                	jmp    *%rax
   25d1b:	f3 0f 1e fa          	endbr64
   25d1f:	f3 0f 1e fa          	endbr64
   25d23:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
   25d28:	48 8b 95 88 fe ff ff 	mov    -0x178(%rbp),%rdx
   25d2f:	4d 8d 7d 02          	lea    0x2(%r13),%r15
   25d33:	48 8d 0c c5 00 00 00 	lea    0x0(,%rax,8),%rcx
   25d3a:	00 
   25d3b:	48 8b 04 c2          	mov    (%rdx,%rax,8),%rax
   25d3f:	48 8b 40 18          	mov    0x18(%rax),%rax
   25d43:	48 8b 10             	mov    (%rax),%rdx
   25d46:	48 8b 40 08          	mov    0x8(%rax),%rax
   25d4a:	83 f8 04             	cmp    $0x4,%eax
   25d4d:	0f 84 bd 6d 00 00    	je     2cb10 <JS_CallInternal+0x7b00>
   25d53:	83 f8 f6             	cmp    $0xfffffff6,%eax
   25d56:	76 04                	jbe    25d5c <JS_CallInternal+0xd4c>
   25d58:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   25d5c:	48 89 13             	mov    %rdx,(%rbx)
   25d5f:	48 89 43 08          	mov    %rax,0x8(%rbx)
   25d63:	41 0f b6 45 02       	movzbl 0x2(%r13),%eax
   25d68:	48 83 c3 10          	add    $0x10,%rbx
   25d6c:	49 83 c5 03          	add    $0x3,%r13
   25d70:	49 89 c2             	mov    %rax,%r10
   25d73:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   25d77:	ff e0                	jmp    *%rax
   25d79:	f3 0f 1e fa          	endbr64
   25d7d:	f3 0f 1e fa          	endbr64
   25d81:	45 0f b7 4d 00       	movzwl 0x0(%r13),%r9d
   25d86:	4d 8d 7d 02          	lea    0x2(%r13),%r15
   25d8a:	4c 89 e7             	mov    %r12,%rdi
   25d8d:	48 8b 8d b8 fe ff ff 	mov    -0x148(%rbp),%rcx
   25d94:	44 89 95 f0 fd ff ff 	mov    %r10d,-0x210(%rbp)
   25d9b:	45 0f b7 d9          	movzwl %r9w,%r11d
   25d9f:	4c 89 79 30          	mov    %r15,0x30(%rcx)
   25da3:	49 c1 e3 04          	shl    $0x4,%r11
   25da7:	44 89 8d 10 fe ff ff 	mov    %r9d,-0x1f0(%rbp)
   25dae:	4c 89 d8             	mov    %r11,%rax
   25db1:	49 89 db             	mov    %rbx,%r11
   25db4:	49 29 c3             	sub    %rax,%r11
   25db7:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   25dbe:	4d 8b 43 e8          	mov    -0x18(%r11),%r8
   25dc2:	49 8b 4b e0          	mov    -0x20(%r11),%rcx
   25dc6:	49 8b 73 f0          	mov    -0x10(%r11),%rsi
   25dca:	49 8b 53 f8          	mov    -0x8(%r11),%rdx
   25dce:	6a 00                	push   $0x0
   25dd0:	41 53                	push   %r11
   25dd2:	4c 89 9d 00 fe ff ff 	mov    %r11,-0x200(%rbp)
   25dd9:	6a 03                	push   $0x3
   25ddb:	6a 00                	push   $0x0
   25ddd:	e8 2e f2 ff ff       	call   25010 <JS_CallInternal>
   25de2:	48 83 c4 20          	add    $0x20,%rsp
   25de6:	49 89 c0             	mov    %rax,%r8
   25de9:	48 89 d0             	mov    %rdx,%rax
   25dec:	83 fa 06             	cmp    $0x6,%edx
   25def:	0f 84 4b f9 ff ff    	je     25740 <JS_CallInternal+0x730>
   25df5:	4c 89 c1             	mov    %r8,%rcx
   25df8:	83 bd f0 fd ff ff 25 	cmpl   $0x25,-0x210(%rbp)
   25dff:	0f 84 fd f9 ff ff    	je     25802 <JS_CallInternal+0x7f2>
   25e05:	4c 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%r11
   25e0c:	4c 8b bd 30 fe ff ff 	mov    -0x1d0(%rbp),%r15
   25e13:	4c 89 ad 00 fe ff ff 	mov    %r13,-0x200(%rbp)
   25e1a:	4d 89 e5             	mov    %r12,%r13
   25e1d:	48 89 9d 30 fe ff ff 	mov    %rbx,-0x1d0(%rbp)
   25e24:	4f 8d 24 1f          	lea    (%r15,%r11,1),%r12
   25e28:	4d 8d 7b e0          	lea    -0x20(%r11),%r15
   25e2c:	eb 1f                	jmp    25e4d <JS_CallInternal+0xe3d>
   25e2e:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   25e35:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   25e3c:	00 00 00 00 
   25e40:	49 83 c7 10          	add    $0x10,%r15
   25e44:	4d 39 e7             	cmp    %r12,%r15
   25e47:	0f 84 dd 56 00 00    	je     2b52a <JS_CallInternal+0x651a>
   25e4d:	49 8b 4f 08          	mov    0x8(%r15),%rcx
   25e51:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   25e54:	76 ea                	jbe    25e40 <JS_CallInternal+0xe30>
   25e56:	49 8b 37             	mov    (%r15),%rsi
   25e59:	8b 5e fc             	mov    -0x4(%rsi),%ebx
   25e5c:	8d 53 ff             	lea    -0x1(%rbx),%edx
   25e5f:	89 56 fc             	mov    %edx,-0x4(%rsi)
   25e62:	85 d2                	test   %edx,%edx
   25e64:	7f da                	jg     25e40 <JS_CallInternal+0xe30>
   25e66:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   25e6a:	48 89 ca             	mov    %rcx,%rdx
   25e6d:	4c 89 85 20 fe ff ff 	mov    %r8,-0x1e0(%rbp)
   25e74:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   25e7b:	e8 50 86 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   25e80:	4c 8b 85 20 fe ff ff 	mov    -0x1e0(%rbp),%r8
   25e87:	48 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%rax
   25e8e:	eb b0                	jmp    25e40 <JS_CallInternal+0xe30>
   25e90:	f3 0f 1e fa          	endbr64
   25e94:	f3 0f 1e fa          	endbr64
   25e98:	45 0f b7 4d 00       	movzwl 0x0(%r13),%r9d
   25e9d:	4d 8d 7d 02          	lea    0x2(%r13),%r15
   25ea1:	e9 55 f5 ff ff       	jmp    253fb <JS_CallInternal+0x3eb>
   25ea6:	f3 0f 1e fa          	endbr64
   25eaa:	f3 0f 1e fa          	endbr64
   25eae:	31 c0                	xor    %eax,%eax
   25eb0:	b9 02 00 00 00       	mov    $0x2,%ecx
   25eb5:	e9 06 f9 ff ff       	jmp    257c0 <JS_CallInternal+0x7b0>
   25eba:	f3 0f 1e fa          	endbr64
   25ebe:	f3 0f 1e fa          	endbr64
   25ec2:	48 83 ec 08          	sub    $0x8,%rsp
   25ec6:	31 c0                	xor    %eax,%eax
   25ec8:	41 83 fa 54          	cmp    $0x54,%r10d
   25ecc:	41 0f b6 4d 04       	movzbl 0x4(%r13),%ecx
   25ed1:	0f 94 c0             	sete   %al
   25ed4:	41 8b 55 00          	mov    0x0(%r13),%edx
   25ed8:	48 89 de             	mov    %rbx,%rsi
   25edb:	4c 89 e7             	mov    %r12,%rdi
   25ede:	50                   	push   %rax
   25edf:	4c 8b 8d b8 fe ff ff 	mov    -0x148(%rbp),%r9
   25ee6:	4d 8d 7d 05          	lea    0x5(%r13),%r15
   25eea:	4c 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%r8
   25ef1:	e8 ca c1 06 00       	call   920c0 <js_op_define_class>
   25ef6:	41 58                	pop    %r8
   25ef8:	41 59                	pop    %r9
   25efa:	83 f8 ff             	cmp    $0xffffffff,%eax
   25efd:	0f 84 3d f8 ff ff    	je     25740 <JS_CallInternal+0x730>
   25f03:	41 0f b6 45 05       	movzbl 0x5(%r13),%eax
   25f08:	49 83 c5 06          	add    $0x6,%r13
   25f0c:	49 89 c2             	mov    %rax,%r10
   25f0f:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   25f13:	ff e0                	jmp    *%rax
   25f15:	f3 0f 1e fa          	endbr64
   25f19:	f3 0f 1e fa          	endbr64
   25f1d:	41 83 fa 52          	cmp    $0x52,%r10d
   25f21:	0f 94 85 10 fe ff ff 	sete   -0x1f0(%rbp)
   25f28:	0f 84 7a 5e 00 00    	je     2bda8 <JS_CallInternal+0x6d98>
   25f2e:	41 8b 45 00          	mov    0x0(%r13),%eax
   25f32:	4d 8d 7d 04          	lea    0x4(%r13),%r15
   25f36:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   25f3c:	0f b6 8d 10 fe ff ff 	movzbl -0x1f0(%rbp),%ecx
   25f43:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
   25f48:	41 0f b6 17          	movzbl (%r15),%edx
   25f4c:	bf 03 00 00 00       	mov    $0x3,%edi
   25f51:	48 c7 85 e0 fd ff ff 	movq   $0x0,-0x220(%rbp)
   25f58:	00 00 00 00 
   25f5c:	29 c8                	sub    %ecx,%eax
   25f5e:	89 8d d4 fd ff ff    	mov    %ecx,-0x22c(%rbp)
   25f64:	48 98                	cltq
   25f66:	48 89 bd a8 fd ff ff 	mov    %rdi,-0x258(%rbp)
   25f6d:	48 c1 e0 04          	shl    $0x4,%rax
   25f71:	48 89 bd 98 fd ff ff 	mov    %rdi,-0x268(%rbp)
   25f78:	48 c7 85 d8 fd ff ff 	movq   $0x3,-0x228(%rbp)
   25f7f:	03 00 00 00 
   25f83:	48 01 d8             	add    %rbx,%rax
   25f86:	48 8b 08             	mov    (%rax),%rcx
   25f89:	48 8b 40 08          	mov    0x8(%rax),%rax
   25f8d:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   25f94:	89 d0                	mov    %edx,%eax
   25f96:	83 e0 04             	and    $0x4,%eax
   25f99:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   25fa0:	3c 01                	cmp    $0x1,%al
   25fa2:	19 c0                	sbb    %eax,%eax
   25fa4:	31 f6                	xor    %esi,%esi
   25fa6:	83 e0 fc             	and    $0xfffffffc,%eax
   25fa9:	48 89 b5 a0 fd ff ff 	mov    %rsi,-0x260(%rbp)
   25fb0:	48 89 b5 90 fd ff ff 	mov    %rsi,-0x270(%rbp)
   25fb7:	05 05 45 00 00       	add    $0x4505,%eax
   25fbc:	83 e2 03             	and    $0x3,%edx
   25fbf:	0f 85 80 56 00 00    	jne    2b645 <JS_CallInternal+0x6635>
   25fc5:	0d 02 22 00 00       	or     $0x2202,%eax
   25fca:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   25fce:	4c 8d 6b f0          	lea    -0x10(%rbx),%r13
   25fd2:	4c 89 e7             	mov    %r12,%rdi
   25fd5:	89 85 d0 fd ff ff    	mov    %eax,-0x230(%rbp)
   25fdb:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   25fdf:	48 89 8d e0 fd ff ff 	mov    %rcx,-0x220(%rbp)
   25fe6:	8b b5 30 fe ff ff    	mov    -0x1d0(%rbp),%esi
   25fec:	48 89 85 20 fe ff ff 	mov    %rax,-0x1e0(%rbp)
   25ff3:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   25ff7:	49 8b 45 08          	mov    0x8(%r13),%rax
   25ffb:	48 89 8d d8 fd ff ff 	mov    %rcx,-0x228(%rbp)
   26002:	48 89 85 e8 fd ff ff 	mov    %rax,-0x218(%rbp)
   26009:	e8 32 d9 01 00       	call   43940 <js_get_function_name>
   2600e:	49 89 c0             	mov    %rax,%r8
   26011:	49 89 d1             	mov    %rdx,%r9
   26014:	41 83 f9 06          	cmp    $0x6,%r9d
   26018:	0f 84 91 69 00 00    	je     2c9af <JS_CallInternal+0x799f>
   2601e:	48 83 ec 08          	sub    $0x8,%rsp
   26022:	48 8b b5 20 fe ff ff 	mov    -0x1e0(%rbp),%rsi
   26029:	b9 3a 00 00 00       	mov    $0x3a,%ecx
   2602e:	4c 89 e7             	mov    %r12,%rdi
   26031:	6a 01                	push   $0x1
   26033:	48 8b 95 e8 fd ff ff 	mov    -0x218(%rbp),%rdx
   2603a:	e8 31 c9 00 00       	call   32970 <JS_DefinePropertyValue>
   2603f:	41 5a                	pop    %r10
   26041:	41 5b                	pop    %r11
   26043:	85 c0                	test   %eax,%eax
   26045:	0f 88 64 69 00 00    	js     2c9af <JS_CallInternal+0x799f>
   2604b:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   26052:	4c 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8
   26059:	4c 89 e7             	mov    %r12,%rdi
   2605c:	48 8b b5 20 fe ff ff 	mov    -0x1e0(%rbp),%rsi
   26063:	48 8b 95 e8 fd ff ff 	mov    -0x218(%rbp),%rdx
   2606a:	e8 01 9f ff ff       	call   1ff70 <js_method_set_home_object>
   2606f:	8b 85 d0 fd ff ff    	mov    -0x230(%rbp),%eax
   26075:	48 83 ec 08          	sub    $0x8,%rsp
   26079:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2607f:	4c 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%r8
   26086:	4c 8b 8d d8 fd ff ff 	mov    -0x228(%rbp),%r9
   2608d:	4c 89 e7             	mov    %r12,%rdi
   26090:	48 8b b5 00 fe ff ff 	mov    -0x200(%rbp),%rsi
   26097:	48 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%rdx
   2609e:	50                   	push   %rax
   2609f:	ff b5 98 fd ff ff    	push   -0x268(%rbp)
   260a5:	ff b5 90 fd ff ff    	push   -0x270(%rbp)
   260ab:	ff b5 a8 fd ff ff    	push   -0x258(%rbp)
   260b1:	ff b5 a0 fd ff ff    	push   -0x260(%rbp)
   260b7:	e8 24 ba 00 00       	call   31ae0 <JS_DefineProperty>
   260bc:	48 83 c4 30          	add    $0x30,%rsp
   260c0:	89 c1                	mov    %eax,%ecx
   260c2:	49 8b 45 08          	mov    0x8(%r13),%rax
   260c6:	83 f8 f6             	cmp    $0xfffffff6,%eax
   260c9:	76 15                	jbe    260e0 <JS_CallInternal+0x10d0>
   260cb:	49 8b 75 00          	mov    0x0(%r13),%rsi
   260cf:	8b 56 fc             	mov    -0x4(%rsi),%edx
   260d2:	83 ea 01             	sub    $0x1,%edx
   260d5:	89 56 fc             	mov    %edx,-0x4(%rsi)
   260d8:	85 d2                	test   %edx,%edx
   260da:	0f 8e 0a 68 00 00    	jle    2c8ea <JS_CallInternal+0x78da>
   260e0:	80 bd 10 fe ff ff 00 	cmpb   $0x0,-0x1f0(%rbp)
   260e7:	0f 85 d5 56 00 00    	jne    2b7c2 <JS_CallInternal+0x67b2>
   260ed:	8b 85 d4 fd ff ff    	mov    -0x22c(%rbp),%eax
   260f3:	83 c0 01             	add    $0x1,%eax
   260f6:	48 98                	cltq
   260f8:	48 c1 e0 04          	shl    $0x4,%rax
   260fc:	48 29 c3             	sub    %rax,%rbx
   260ff:	85 c9                	test   %ecx,%ecx
   26101:	0f 88 54 69 00 00    	js     2ca5b <JS_CallInternal+0x7a4b>
   26107:	41 0f b6 47 01       	movzbl 0x1(%r15),%eax
   2610c:	4d 8d 6f 02          	lea    0x2(%r15),%r13
   26110:	49 89 c2             	mov    %rax,%r10
   26113:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   26117:	f3 0f 1e fa          	endbr64
   2611b:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   26120:	49 83 c5 01          	add    $0x1,%r13
   26124:	49 89 c2             	mov    %rax,%r10
   26127:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2612b:	ff e0                	jmp    *%rax
   2612d:	f3 0f 1e fa          	endbr64
   26131:	31 c0                	xor    %eax,%eax
   26133:	b9 03 00 00 00       	mov    $0x3,%ecx
   26138:	e9 83 f6 ff ff       	jmp    257c0 <JS_CallInternal+0x7b0>
   2613d:	f3 0f 1e fa          	endbr64
   26141:	b8 03 00 00 00       	mov    $0x3,%eax
   26146:	31 c9                	xor    %ecx,%ecx
   26148:	e9 73 f6 ff ff       	jmp    257c0 <JS_CallInternal+0x7b0>
   2614d:	f3 0f 1e fa          	endbr64
   26151:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   26158:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2615c:	4c 89 e7             	mov    %r12,%rdi
   2615f:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   26163:	4c 89 68 30          	mov    %r13,0x30(%rax)
   26167:	e8 04 05 02 00       	call   46670 <JS_ValueToAtom>
   2616c:	89 c1                	mov    %eax,%ecx
   2616e:	85 c0                	test   %eax,%eax
   26170:	0f 84 1f 8e 00 00    	je     2ef95 <JS_CallInternal+0x9f85>
   26176:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   2617a:	83 fa 03             	cmp    $0x3,%edx
   2617d:	0f 84 75 7e 00 00    	je     2dff8 <JS_CallInternal+0x8fe8>
   26183:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   26187:	4c 89 e7             	mov    %r12,%rdi
   2618a:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   26190:	e8 cb 99 04 00       	call   6fb60 <JS_HasProperty>
   26195:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2619b:	85 c0                	test   %eax,%eax
   2619d:	0f 8e 95 7f 00 00    	jle    2e138 <JS_CallInternal+0x9128>
   261a3:	48 83 ec 08          	sub    $0x8,%rsp
   261a7:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   261ab:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   261af:	4c 89 e7             	mov    %r12,%rdi
   261b2:	6a 00                	push   $0x0
   261b4:	49 89 f0             	mov    %rsi,%r8
   261b7:	49 89 d1             	mov    %rdx,%r9
   261ba:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   261c0:	e8 3b 97 00 00       	call   2f900 <JS_GetPropertyInternal>
   261c5:	59                   	pop    %rcx
   261c6:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   261cc:	49 89 c7             	mov    %rax,%r15
   261cf:	5e                   	pop    %rsi
   261d0:	48 89 d0             	mov    %rdx,%rax
   261d3:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   261d9:	0f 8f 29 67 00 00    	jg     2c908 <JS_CallInternal+0x78f8>
   261df:	83 fa 06             	cmp    $0x6,%edx
   261e2:	0f 84 90 81 00 00    	je     2e378 <JS_CallInternal+0x9368>
   261e8:	4c 89 3b             	mov    %r15,(%rbx)
   261eb:	49 83 c5 01          	add    $0x1,%r13
   261ef:	48 83 c3 10          	add    $0x10,%rbx
   261f3:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   261f7:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   261fc:	49 89 c2             	mov    %rax,%r10
   261ff:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26203:	ff e0                	jmp    *%rax
   26205:	f3 0f 1e fa          	endbr64
   26209:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   2620d:	4c 8b 7b f8          	mov    -0x8(%rbx),%r15
   26211:	83 f8 ff             	cmp    $0xffffffff,%eax
   26214:	0f 85 87 64 00 00    	jne    2c6a1 <JS_CallInternal+0x7691>
   2621a:	45 85 ff             	test   %r15d,%r15d
   2621d:	0f 85 39 81 00 00    	jne    2e35c <JS_CallInternal+0x934c>
   26223:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   26227:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2622b:	66 83 7a 12 02       	cmpw   $0x2,0x12(%rdx)
   26230:	0f 85 ea 64 00 00    	jne    2c720 <JS_CallInternal+0x7710>
   26236:	3b 42 38             	cmp    0x38(%rdx),%eax
   26239:	0f 83 e1 64 00 00    	jae    2c720 <JS_CallInternal+0x7710>
   2623f:	89 c0                	mov    %eax,%eax
   26241:	48 c1 e0 04          	shl    $0x4,%rax
   26245:	48 03 42 30          	add    0x30(%rdx),%rax
   26249:	48 8b 10             	mov    (%rax),%rdx
   2624c:	48 8b 40 08          	mov    0x8(%rax),%rax
   26250:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26253:	76 04                	jbe    26259 <JS_CallInternal+0x1249>
   26255:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   26259:	48 89 13             	mov    %rdx,(%rbx)
   2625c:	49 83 c5 01          	add    $0x1,%r13
   26260:	48 83 c3 10          	add    $0x10,%rbx
   26264:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   26268:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2626d:	49 89 c2             	mov    %rax,%r10
   26270:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26274:	ff e0                	jmp    *%rax
   26276:	f3 0f 1e fa          	endbr64
   2627a:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   2627e:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   26282:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   26286:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2628a:	83 fe ff             	cmp    $0xffffffff,%esi
   2628d:	0f 85 f3 5e 00 00    	jne    2c186 <JS_CallInternal+0x7176>
   26293:	85 c9                	test   %ecx,%ecx
   26295:	0f 85 eb 5e 00 00    	jne    2c186 <JS_CallInternal+0x7176>
   2629b:	66 83 7a 12 02       	cmpw   $0x2,0x12(%rdx)
   262a0:	0f 85 e0 5e 00 00    	jne    2c186 <JS_CallInternal+0x7176>
   262a6:	3b 42 38             	cmp    0x38(%rdx),%eax
   262a9:	0f 83 d7 5e 00 00    	jae    2c186 <JS_CallInternal+0x7176>
   262af:	89 c0                	mov    %eax,%eax
   262b1:	48 c1 e0 04          	shl    $0x4,%rax
   262b5:	48 03 42 30          	add    0x30(%rdx),%rax
   262b9:	48 8b 10             	mov    (%rax),%rdx
   262bc:	48 8b 40 08          	mov    0x8(%rax),%rax
   262c0:	83 f8 f6             	cmp    $0xfffffff6,%eax
   262c3:	76 04                	jbe    262c9 <JS_CallInternal+0x12b9>
   262c5:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   262c9:	48 89 53 f0          	mov    %rdx,-0x10(%rbx)
   262cd:	49 83 c5 01          	add    $0x1,%r13
   262d1:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   262d5:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   262da:	49 89 c2             	mov    %rax,%r10
   262dd:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   262e1:	ff e0                	jmp    *%rax
   262e3:	f3 0f 1e fa          	endbr64
   262e7:	4c 8b 4b e8          	mov    -0x18(%rbx),%r9
   262eb:	4c 8b 7b e0          	mov    -0x20(%rbx),%r15
   262ef:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   262f3:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   262f7:	41 83 f9 ff          	cmp    $0xffffffff,%r9d
   262fb:	0f 85 42 5e 00 00    	jne    2c143 <JS_CallInternal+0x7133>
   26301:	85 c0                	test   %eax,%eax
   26303:	0f 85 3a 5e 00 00    	jne    2c143 <JS_CallInternal+0x7133>
   26309:	66 41 83 7f 12 02    	cmpw   $0x2,0x12(%r15)
   2630f:	0f 85 2e 5e 00 00    	jne    2c143 <JS_CallInternal+0x7133>
   26315:	41 3b 57 38          	cmp    0x38(%r15),%edx
   26319:	0f 83 24 5e 00 00    	jae    2c143 <JS_CallInternal+0x7133>
   2631f:	89 d0                	mov    %edx,%eax
   26321:	48 c1 e0 04          	shl    $0x4,%rax
   26325:	49 03 47 30          	add    0x30(%r15),%rax
   26329:	48 8b 08             	mov    (%rax),%rcx
   2632c:	48 8b 40 08          	mov    0x8(%rax),%rax
   26330:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26333:	76 04                	jbe    26339 <JS_CallInternal+0x1329>
   26335:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   26339:	41 83 f9 f6          	cmp    $0xfffffff6,%r9d
   2633d:	76 13                	jbe    26352 <JS_CallInternal+0x1342>
   2633f:	41 8b 77 fc          	mov    -0x4(%r15),%esi
   26343:	8d 56 ff             	lea    -0x1(%rsi),%edx
   26346:	41 89 57 fc          	mov    %edx,-0x4(%r15)
   2634a:	85 d2                	test   %edx,%edx
   2634c:	0f 8e f4 6c 00 00    	jle    2d046 <JS_CallInternal+0x8036>
   26352:	48 89 4b e0          	mov    %rcx,-0x20(%rbx)
   26356:	49 83 c5 01          	add    $0x1,%r13
   2635a:	48 83 eb 10          	sub    $0x10,%rbx
   2635e:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   26362:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   26367:	49 89 c2             	mov    %rax,%r10
   2636a:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2636e:	ff e0                	jmp    *%rax
   26370:	f3 0f 1e fa          	endbr64
   26374:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   26378:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   2637c:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   26380:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   26384:	89 c6                	mov    %eax,%esi
   26386:	09 d6                	or     %edx,%esi
   26388:	0f 85 29 74 00 00    	jne    2d7b7 <JS_CallInternal+0x87a7>
   2638e:	48 63 f1             	movslq %ecx,%rsi
   26391:	48 63 c7             	movslq %edi,%rax
   26394:	8d 14 39             	lea    (%rcx,%rdi,1),%edx
   26397:	48 01 f0             	add    %rsi,%rax
   2639a:	48 63 ca             	movslq %edx,%rcx
   2639d:	48 39 c1             	cmp    %rax,%rcx
   263a0:	0f 85 f6 73 00 00    	jne    2d79c <JS_CallInternal+0x878c>
   263a6:	89 d0                	mov    %edx,%eax
   263a8:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   263af:	00 
   263b0:	48 89 43 e0          	mov    %rax,-0x20(%rbx)
   263b4:	48 83 eb 10          	sub    $0x10,%rbx
   263b8:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   263bd:	49 83 c5 01          	add    $0x1,%r13
   263c1:	49 89 c2             	mov    %rax,%r10
   263c4:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   263c8:	ff e0                	jmp    *%rax
   263ca:	f3 0f 1e fa          	endbr64
   263ce:	41 0f b6 7d 00       	movzbl 0x0(%r13),%edi
   263d3:	48 8b 8d b8 fe ff ff 	mov    -0x148(%rbp),%rcx
   263da:	4d 8d 7d 01          	lea    0x1(%r13),%r15
   263de:	45 31 c9             	xor    %r9d,%r9d
   263e1:	89 fa                	mov    %edi,%edx
   263e3:	89 f8                	mov    %edi,%eax
   263e5:	4c 89 79 30          	mov    %r15,0x30(%rcx)
   263e9:	c1 fa 02             	sar    $0x2,%edx
   263ec:	83 e0 03             	and    $0x3,%eax
   263ef:	83 e2 07             	and    $0x7,%edx
   263f2:	f7 d0                	not    %eax
   263f4:	f7 d2                	not    %edx
   263f6:	48 98                	cltq
   263f8:	48 63 d2             	movslq %edx,%rdx
   263fb:	48 c1 e0 04          	shl    $0x4,%rax
   263ff:	48 c1 e2 04          	shl    $0x4,%rdx
   26403:	48 01 d8             	add    %rbx,%rax
   26406:	48 01 da             	add    %rbx,%rdx
   26409:	48 8b 30             	mov    (%rax),%rsi
   2640c:	48 8b 0a             	mov    (%rdx),%rcx
   2640f:	4c 8b 42 08          	mov    0x8(%rdx),%r8
   26413:	48 8b 50 08          	mov    0x8(%rax),%rdx
   26417:	89 f8                	mov    %edi,%eax
   26419:	4c 89 e7             	mov    %r12,%rdi
   2641c:	c1 f8 05             	sar    $0x5,%eax
   2641f:	f7 d0                	not    %eax
   26421:	48 98                	cltq
   26423:	48 c1 e0 04          	shl    $0x4,%rax
   26427:	ff 74 03 08          	push   0x8(%rbx,%rax,1)
   2642b:	ff 34 03             	push   (%rbx,%rax,1)
   2642e:	e8 0d d5 06 00       	call   93940 <JS_CopyDataProperties>
   26433:	59                   	pop    %rcx
   26434:	5e                   	pop    %rsi
   26435:	85 c0                	test   %eax,%eax
   26437:	0f 85 03 f3 ff ff    	jne    25740 <JS_CallInternal+0x730>
   2643d:	41 0f b6 45 01       	movzbl 0x1(%r13),%eax
   26442:	49 83 c5 02          	add    $0x2,%r13
   26446:	49 89 c2             	mov    %rax,%r10
   26449:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2644d:	ff e0                	jmp    *%rax
   2644f:	f3 0f 1e fa          	endbr64
   26453:	45 0f b7 4d 00       	movzwl 0x0(%r13),%r9d
   26458:	49 89 da             	mov    %rbx,%r10
   2645b:	4d 8d 7d 02          	lea    0x2(%r13),%r15
   2645f:	4c 89 e7             	mov    %r12,%rdi
   26462:	4c 89 c8             	mov    %r9,%rax
   26465:	44 89 8d 30 fe ff ff 	mov    %r9d,-0x1d0(%rbp)
   2646c:	48 c1 e0 04          	shl    $0x4,%rax
   26470:	49 29 c2             	sub    %rax,%r10
   26473:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   2647a:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   26481:	49 8b 4a f0          	mov    -0x10(%r10),%rcx
   26485:	49 8b 72 e0          	mov    -0x20(%r10),%rsi
   26489:	4d 8b 42 f8          	mov    -0x8(%r10),%r8
   2648d:	49 8b 52 e8          	mov    -0x18(%r10),%rdx
   26491:	4c 89 78 30          	mov    %r15,0x30(%rax)
   26495:	6a 00                	push   $0x0
   26497:	41 52                	push   %r10
   26499:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   264a0:	e8 7b 42 07 00       	call   9a720 <JS_CallConstructorInternal>
   264a5:	59                   	pop    %rcx
   264a6:	5e                   	pop    %rsi
   264a7:	83 fa 06             	cmp    $0x6,%edx
   264aa:	0f 84 90 f2 ff ff    	je     25740 <JS_CallInternal+0x730>
   264b0:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   264b7:	48 89 95 f0 fd ff ff 	mov    %rdx,-0x210(%rbp)
   264be:	48 89 9d 10 fe ff ff 	mov    %rbx,-0x1f0(%rbp)
   264c5:	4d 8d 7a e0          	lea    -0x20(%r10),%r15
   264c9:	4c 03 95 00 fe ff ff 	add    -0x200(%rbp),%r10
   264d0:	4c 89 ad 00 fe ff ff 	mov    %r13,-0x200(%rbp)
   264d7:	4d 89 e5             	mov    %r12,%r13
   264da:	4d 89 d4             	mov    %r10,%r12
   264dd:	eb 0e                	jmp    264ed <JS_CallInternal+0x14dd>
   264df:	90                   	nop
   264e0:	49 83 c7 10          	add    $0x10,%r15
   264e4:	4d 39 e7             	cmp    %r12,%r15
   264e7:	0f 84 0f 52 00 00    	je     2b6fc <JS_CallInternal+0x66ec>
   264ed:	49 8b 4f 08          	mov    0x8(%r15),%rcx
   264f1:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   264f4:	76 ea                	jbe    264e0 <JS_CallInternal+0x14d0>
   264f6:	49 8b 37             	mov    (%r15),%rsi
   264f9:	8b 5e fc             	mov    -0x4(%rsi),%ebx
   264fc:	8d 53 ff             	lea    -0x1(%rbx),%edx
   264ff:	89 56 fc             	mov    %edx,-0x4(%rsi)
   26502:	85 d2                	test   %edx,%edx
   26504:	7f da                	jg     264e0 <JS_CallInternal+0x14d0>
   26506:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2650a:	48 89 ca             	mov    %rcx,%rdx
   2650d:	48 89 85 20 fe ff ff 	mov    %rax,-0x1e0(%rbp)
   26514:	e8 b7 7f ff ff       	call   1e4d0 <__JS_FreeValueRT>
   26519:	48 8b 85 20 fe ff ff 	mov    -0x1e0(%rbp),%rax
   26520:	eb be                	jmp    264e0 <JS_CallInternal+0x14d0>
   26522:	f3 0f 1e fa          	endbr64
   26526:	4d 8d 7d 02          	lea    0x2(%r13),%r15
   2652a:	45 0f b7 4d 00       	movzwl 0x0(%r13),%r9d
   2652f:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   26533:	4c 89 e7             	mov    %r12,%rdi
   26536:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2653d:	48 8b 53 d8          	mov    -0x28(%rbx),%rdx
   26541:	4c 8d 43 e0          	lea    -0x20(%rbx),%r8
   26545:	b9 02 00 00 00       	mov    $0x2,%ecx
   2654a:	4c 89 85 30 fe ff ff 	mov    %r8,-0x1d0(%rbp)
   26551:	4c 89 78 30          	mov    %r15,0x30(%rax)
   26555:	e8 66 56 08 00       	call   abbc0 <js_function_apply>
   2655a:	48 89 d1             	mov    %rdx,%rcx
   2655d:	83 fa 06             	cmp    $0x6,%edx
   26560:	0f 84 da f1 ff ff    	je     25740 <JS_CallInternal+0x730>
   26566:	48 8b 73 d8          	mov    -0x28(%rbx),%rsi
   2656a:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   26571:	83 fe f6             	cmp    $0xfffffff6,%esi
   26574:	76 15                	jbe    2658b <JS_CallInternal+0x157b>
   26576:	48 8b 7b d0          	mov    -0x30(%rbx),%rdi
   2657a:	8b 57 fc             	mov    -0x4(%rdi),%edx
   2657d:	83 ea 01             	sub    $0x1,%edx
   26580:	89 57 fc             	mov    %edx,-0x4(%rdi)
   26583:	85 d2                	test   %edx,%edx
   26585:	0f 8e 6a 6b 00 00    	jle    2d0f5 <JS_CallInternal+0x80e5>
   2658b:	49 8b 70 08          	mov    0x8(%r8),%rsi
   2658f:	83 fe f6             	cmp    $0xfffffff6,%esi
   26592:	76 14                	jbe    265a8 <JS_CallInternal+0x1598>
   26594:	49 8b 38             	mov    (%r8),%rdi
   26597:	8b 57 fc             	mov    -0x4(%rdi),%edx
   2659a:	83 ea 01             	sub    $0x1,%edx
   2659d:	89 57 fc             	mov    %edx,-0x4(%rdi)
   265a0:	85 d2                	test   %edx,%edx
   265a2:	0f 8e cf 6a 00 00    	jle    2d077 <JS_CallInternal+0x8067>
   265a8:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   265ac:	83 fe f6             	cmp    $0xfffffff6,%esi
   265af:	76 15                	jbe    265c6 <JS_CallInternal+0x15b6>
   265b1:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   265b5:	8b 57 fc             	mov    -0x4(%rdi),%edx
   265b8:	83 ea 01             	sub    $0x1,%edx
   265bb:	89 57 fc             	mov    %edx,-0x4(%rdi)
   265be:	85 d2                	test   %edx,%edx
   265c0:	0f 8e f0 6a 00 00    	jle    2d0b6 <JS_CallInternal+0x80a6>
   265c6:	48 89 43 d0          	mov    %rax,-0x30(%rbx)
   265ca:	49 83 c5 03          	add    $0x3,%r13
   265ce:	48 89 4b d8          	mov    %rcx,-0x28(%rbx)
   265d2:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   265d7:	4c 89 c3             	mov    %r8,%rbx
   265da:	49 89 c2             	mov    %rax,%r10
   265dd:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   265e1:	ff e0                	jmp    *%rax
   265e3:	f3 0f 1e fa          	endbr64
   265e7:	49 8b 74 24 30       	mov    0x30(%r12),%rsi
   265ec:	41 0f b7 4d 00       	movzwl 0x0(%r13),%ecx
   265f1:	ba 02 00 00 00       	mov    $0x2,%edx
   265f6:	4c 89 e7             	mov    %r12,%rdi
   265f9:	4d 8d 7d 02          	lea    0x2(%r13),%r15
   265fd:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   26601:	49 89 c9             	mov    %rcx,%r9
   26604:	49 c1 e1 04          	shl    $0x4,%r9
   26608:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2660e:	4c 29 cb             	sub    %r9,%rbx
   26611:	48 89 8d f0 fd ff ff 	mov    %rcx,-0x210(%rbp)
   26618:	31 c9                	xor    %ecx,%ecx
   2661a:	4c 89 8d 00 fe ff ff 	mov    %r9,-0x200(%rbp)
   26621:	48 89 9d 10 fe ff ff 	mov    %rbx,-0x1f0(%rbp)
   26628:	e8 13 38 02 00       	call   49e40 <JS_NewObjectFromShape>
   2662d:	4c 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%r8
   26634:	4c 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%r9
   2663b:	83 fa 06             	cmp    $0x6,%edx
   2663e:	48 89 c1             	mov    %rax,%rcx
   26641:	49 89 d2             	mov    %rdx,%r10
   26644:	0f 84 29 6b 00 00    	je     2d173 <JS_CallInternal+0x8163>
   2664a:	8b 95 30 fe ff ff    	mov    -0x1d0(%rbp),%edx
   26650:	85 d2                	test   %edx,%edx
   26652:	0f 85 77 58 00 00    	jne    2becf <JS_CallInternal+0x6ebf>
   26658:	4d 89 50 08          	mov    %r10,0x8(%r8)
   2665c:	49 8d 58 10          	lea    0x10(%r8),%rbx
   26660:	49 83 c5 03          	add    $0x3,%r13
   26664:	49 89 08             	mov    %rcx,(%r8)
   26667:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2666c:	49 89 c2             	mov    %rax,%r10
   2666f:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26673:	ff e0                	jmp    *%rax
   26675:	f3 0f 1e fa          	endbr64
   26679:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2667d:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   26681:	4c 89 e7             	mov    %r12,%rdi
   26684:	48 83 eb 10          	sub    $0x10,%rbx
   26688:	4d 89 ef             	mov    %r13,%r15
   2668b:	e8 a0 e0 ff ff       	call   24730 <JS_Throw>
   26690:	e9 ab f0 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   26695:	f3 0f 1e fa          	endbr64
   26699:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2669d:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   266a1:	4c 8d 4b e0          	lea    -0x20(%rbx),%r9
   266a5:	4c 89 e7             	mov    %r12,%rdi
   266a8:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   266ac:	4c 8b 43 f8          	mov    -0x8(%rbx),%r8
   266b0:	4c 89 8d 30 fe ff ff 	mov    %r9,-0x1d0(%rbp)
   266b7:	4c 8d 7b f0          	lea    -0x10(%rbx),%r15
   266bb:	e8 f0 61 02 00       	call   4c8b0 <JS_AddBrand>
   266c0:	4c 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9
   266c7:	83 f8 ff             	cmp    $0xffffffff,%eax
   266ca:	0f 84 94 8b 00 00    	je     2f264 <JS_CallInternal+0xa254>
   266d0:	49 8b 41 08          	mov    0x8(%r9),%rax
   266d4:	83 f8 f6             	cmp    $0xfffffff6,%eax
   266d7:	76 15                	jbe    266ee <JS_CallInternal+0x16de>
   266d9:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   266dd:	8b 59 fc             	mov    -0x4(%rcx),%ebx
   266e0:	8d 53 ff             	lea    -0x1(%rbx),%edx
   266e3:	89 51 fc             	mov    %edx,-0x4(%rcx)
   266e6:	85 d2                	test   %edx,%edx
   266e8:	0f 8e 3f 6a 00 00    	jle    2d12d <JS_CallInternal+0x811d>
   266ee:	49 8b 47 08          	mov    0x8(%r15),%rax
   266f2:	83 f8 f6             	cmp    $0xfffffff6,%eax
   266f5:	76 14                	jbe    2670b <JS_CallInternal+0x16fb>
   266f7:	49 8b 0f             	mov    (%r15),%rcx
   266fa:	8b 59 fc             	mov    -0x4(%rcx),%ebx
   266fd:	8d 53 ff             	lea    -0x1(%rbx),%edx
   26700:	89 51 fc             	mov    %edx,-0x4(%rcx)
   26703:	85 d2                	test   %edx,%edx
   26705:	0f 8e 27 66 00 00    	jle    2cd32 <JS_CallInternal+0x7d22>
   2670b:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   26710:	4c 89 cb             	mov    %r9,%rbx
   26713:	49 83 c5 01          	add    $0x1,%r13
   26717:	49 89 c2             	mov    %rax,%r10
   2671a:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2671e:	ff e0                	jmp    *%rax
   26720:	f3 0f 1e fa          	endbr64
   26724:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   26728:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2672c:	4c 89 e7             	mov    %r12,%rdi
   2672f:	49 83 c5 01          	add    $0x1,%r13
   26733:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   26737:	4c 8b 43 e8          	mov    -0x18(%rbx),%r8
   2673b:	e8 30 98 ff ff       	call   1ff70 <js_method_set_home_object>
   26740:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   26745:	49 89 c2             	mov    %rax,%r10
   26748:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2674c:	ff e0                	jmp    *%rax
   2674e:	f3 0f 1e fa          	endbr64
   26752:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   26759:	4c 8b 7b f8          	mov    -0x8(%rbx),%r15
   2675d:	4c 8b 53 f0          	mov    -0x10(%rbx),%r10
   26761:	4c 89 68 30          	mov    %r13,0x30(%rax)
   26765:	41 83 ff ff          	cmp    $0xffffffff,%r15d
   26769:	0f 84 ab 54 00 00    	je     2bc1a <JS_CallInternal+0x6c0a>
   2676f:	41 83 ff 02          	cmp    $0x2,%r15d
   26773:	0f 84 a1 54 00 00    	je     2bc1a <JS_CallInternal+0x6c0a>
   26779:	41 83 ff f6          	cmp    $0xfffffff6,%r15d
   2677d:	76 13                	jbe    26792 <JS_CallInternal+0x1782>
   2677f:	41 8b 42 fc          	mov    -0x4(%r10),%eax
   26783:	83 e8 01             	sub    $0x1,%eax
   26786:	41 89 42 fc          	mov    %eax,-0x4(%r10)
   2678a:	85 c0                	test   %eax,%eax
   2678c:	0f 8e 8b 65 00 00    	jle    2cd1d <JS_CallInternal+0x7d0d>
   26792:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   26797:	48 83 eb 10          	sub    $0x10,%rbx
   2679b:	49 83 c5 01          	add    $0x1,%r13
   2679f:	49 89 c2             	mov    %rax,%r10
   267a2:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   267a6:	ff e0                	jmp    *%rax
   267a8:	f3 0f 1e fa          	endbr64
   267ac:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   267b0:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   267b4:	4c 89 e7             	mov    %r12,%rdi
   267b7:	4d 89 ef             	mov    %r13,%r15
   267ba:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   267be:	4c 8b 43 e8          	mov    -0x18(%rbx),%r8
   267c2:	e8 89 02 02 00       	call   46a50 <JS_DefineObjectNameComputed.constprop.0>
   267c7:	83 f8 ff             	cmp    $0xffffffff,%eax
   267ca:	0f 84 70 ef ff ff    	je     25740 <JS_CallInternal+0x730>
   267d0:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   267d5:	49 83 c5 01          	add    $0x1,%r13
   267d9:	49 89 c2             	mov    %rax,%r10
   267dc:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   267e0:	ff e0                	jmp    *%rax
   267e2:	f3 0f 1e fa          	endbr64
   267e6:	41 8b 4d 00          	mov    0x0(%r13),%ecx
   267ea:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   267ee:	4c 89 e7             	mov    %r12,%rdi
   267f1:	4d 8d 7d 04          	lea    0x4(%r13),%r15
   267f5:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   267f9:	e8 52 51 01 00       	call   3b950 <JS_DefineObjectName.constprop.0>
   267fe:	83 f8 ff             	cmp    $0xffffffff,%eax
   26801:	0f 84 39 ef ff ff    	je     25740 <JS_CallInternal+0x730>
   26807:	41 0f b6 45 04       	movzbl 0x4(%r13),%eax
   2680c:	49 83 c5 05          	add    $0x5,%r13
   26810:	49 89 c2             	mov    %rax,%r10
   26813:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26817:	ff e0                	jmp    *%rax
   26819:	f3 0f 1e fa          	endbr64
   2681d:	48 83 ec 08          	sub    $0x8,%rsp
   26821:	41 8b 4d 00          	mov    0x0(%r13),%ecx
   26825:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   26829:	4c 89 e7             	mov    %r12,%rdi
   2682c:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   26830:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   26834:	4d 8d 7d 04          	lea    0x4(%r13),%r15
   26838:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   2683c:	68 07 40 00 00       	push   $0x4007
   26841:	e8 2a c1 00 00       	call   32970 <JS_DefinePropertyValue>
   26846:	5a                   	pop    %rdx
   26847:	59                   	pop    %rcx
   26848:	85 c0                	test   %eax,%eax
   2684a:	0f 88 cd 6f 00 00    	js     2d81d <JS_CallInternal+0x880d>
   26850:	41 0f b6 45 04       	movzbl 0x4(%r13),%eax
   26855:	48 83 eb 10          	sub    $0x10,%rbx
   26859:	49 83 c5 05          	add    $0x5,%r13
   2685d:	49 89 c2             	mov    %rax,%r10
   26860:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26864:	ff e0                	jmp    *%rax
   26866:	f3 0f 1e fa          	endbr64
   2686a:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2686e:	48 8d 43 e0          	lea    -0x20(%rbx),%rax
   26872:	4c 8b 7b d0          	mov    -0x30(%rbx),%r15
   26876:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2687d:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   26881:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   26888:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2688c:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   26890:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   26897:	83 7b d8 ff          	cmpl   $0xffffffff,-0x28(%rbx)
   2689b:	0f 85 ca 75 00 00    	jne    2de6b <JS_CallInternal+0x8e5b>
   268a1:	83 f8 f8             	cmp    $0xfffffff8,%eax
   268a4:	0f 85 a8 75 00 00    	jne    2de52 <JS_CallInternal+0x8e42>
   268aa:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   268af:	e8 4c 19 ff ff       	call   18200 <js_get_atom_index>
   268b4:	49 8b 4f 18          	mov    0x18(%r15),%rcx
   268b8:	89 c6                	mov    %eax,%esi
   268ba:	8b 41 18             	mov    0x18(%rcx),%eax
   268bd:	89 f2                	mov    %esi,%edx
   268bf:	21 c2                	and    %eax,%edx
   268c1:	8b 54 91 38          	mov    0x38(%rcx,%rdx,4),%edx
   268c5:	48 85 d2             	test   %rdx,%rdx
   268c8:	0f 84 87 4e 00 00    	je     2b755 <JS_CallInternal+0x6745>
   268ce:	48 8d 3c 85 3c 00 00 	lea    0x3c(,%rax,4),%rdi
   268d5:	00 
   268d6:	48 8d 44 d7 f8       	lea    -0x8(%rdi,%rdx,8),%rax
   268db:	48 01 c8             	add    %rcx,%rax
   268de:	39 70 04             	cmp    %esi,0x4(%rax)
   268e1:	0f 85 60 4e 00 00    	jne    2b747 <JS_CallInternal+0x6737>
   268e7:	48 8d 0d 56 18 0b 00 	lea    0xb1856(%rip),%rcx        # d8144 <_IO_stdin_used+0x144>
   268ee:	4c 89 e7             	mov    %r12,%rdi
   268f1:	31 c0                	xor    %eax,%eax
   268f3:	4d 89 ef             	mov    %r13,%r15
   268f6:	48 8d 15 73 55 0b 00 	lea    0xb5573(%rip),%rdx        # dbe70 <_IO_stdin_used+0x3e70>
   268fd:	e8 ae d1 00 00       	call   33ab0 <__JS_ThrowTypeErrorAtom>
   26902:	83 bd 00 fe ff ff f6 	cmpl   $0xfffffff6,-0x200(%rbp)
   26909:	76 1e                	jbe    26929 <JS_CallInternal+0x1919>
   2690b:	48 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%rbx
   26912:	8b 43 fc             	mov    -0x4(%rbx),%eax
   26915:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   2691b:	83 e8 01             	sub    $0x1,%eax
   2691e:	89 43 fc             	mov    %eax,-0x4(%rbx)
   26921:	85 c0                	test   %eax,%eax
   26923:	0f 8e df 89 00 00    	jle    2f308 <JS_CallInternal+0xa2f8>
   26929:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   26930:	48 8b 43 08          	mov    0x8(%rbx),%rax
   26934:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26937:	0f 86 03 ee ff ff    	jbe    25740 <JS_CallInternal+0x730>
   2693d:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   26944:	48 8b 0b             	mov    (%rbx),%rcx
   26947:	8b 71 fc             	mov    -0x4(%rcx),%esi
   2694a:	8d 56 ff             	lea    -0x1(%rsi),%edx
   2694d:	89 51 fc             	mov    %edx,-0x4(%rcx)
   26950:	85 d2                	test   %edx,%edx
   26952:	0f 8f e8 ed ff ff    	jg     25740 <JS_CallInternal+0x730>
   26958:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2695d:	48 89 c2             	mov    %rax,%rdx
   26960:	48 89 ce             	mov    %rcx,%rsi
   26963:	e8 68 7b ff ff       	call   1e4d0 <__JS_FreeValueRT>
   26968:	e9 d3 ed ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2696d:	0f 1f 00             	nopl   (%rax)
   26970:	f3 0f 1e fa          	endbr64
   26974:	48 8d 43 e0          	lea    -0x20(%rbx),%rax
   26978:	48 8b 38             	mov    (%rax),%rdi
   2697b:	4c 8d 7b f0          	lea    -0x10(%rbx),%r15
   2697f:	48 83 eb 30          	sub    $0x30,%rbx
   26983:	48 8b 40 08          	mov    0x8(%rax),%rax
   26987:	48 8b 0b             	mov    (%rbx),%rcx
   2698a:	49 8b 37             	mov    (%r15),%rsi
   2698d:	49 8b 57 08          	mov    0x8(%r15),%rdx
   26991:	48 89 bd 30 fe ff ff 	mov    %rdi,-0x1d0(%rbp)
   26998:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2699f:	83 7b 08 ff          	cmpl   $0xffffffff,0x8(%rbx)
   269a3:	0f 85 88 75 00 00    	jne    2df31 <JS_CallInternal+0x8f21>
   269a9:	83 fa f8             	cmp    $0xfffffff8,%edx
   269ac:	0f 85 33 75 00 00    	jne    2dee5 <JS_CallInternal+0x8ed5>
   269b2:	49 8b 44 24 10       	mov    0x10(%r12),%rax
   269b7:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   269be:	48 89 c7             	mov    %rax,%rdi
   269c1:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   269c8:	e8 33 18 ff ff       	call   18200 <js_get_atom_index>
   269cd:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   269d4:	89 c6                	mov    %eax,%esi
   269d6:	48 8b 79 18          	mov    0x18(%rcx),%rdi
   269da:	8b 57 18             	mov    0x18(%rdi),%edx
   269dd:	21 d0                	and    %edx,%eax
   269df:	8b 44 87 38          	mov    0x38(%rdi,%rax,4),%eax
   269e3:	48 85 c0             	test   %rax,%rax
   269e6:	0f 84 62 7b 00 00    	je     2e54e <JS_CallInternal+0x953e>
   269ec:	4c 8d 0c 95 3c 00 00 	lea    0x3c(,%rdx,4),%r9
   269f3:	00 
   269f4:	48 83 e8 01          	sub    $0x1,%rax
   269f8:	49 8d 14 c1          	lea    (%r9,%rax,8),%rdx
   269fc:	48 01 fa             	add    %rdi,%rdx
   269ff:	3b 72 04             	cmp    0x4(%rdx),%esi
   26a02:	0f 85 39 7b 00 00    	jne    2e541 <JS_CallInternal+0x9531>
   26a08:	48 8b b5 30 fe ff ff 	mov    -0x1d0(%rbp),%rsi
   26a0f:	48 c1 e0 04          	shl    $0x4,%rax
   26a13:	48 03 41 20          	add    0x20(%rcx),%rax
   26a17:	48 8b 08             	mov    (%rax),%rcx
   26a1a:	48 8b 50 08          	mov    0x8(%rax),%rdx
   26a1e:	48 89 30             	mov    %rsi,(%rax)
   26a21:	48 8b b5 10 fe ff ff 	mov    -0x1f0(%rbp),%rsi
   26a28:	48 89 70 08          	mov    %rsi,0x8(%rax)
   26a2c:	83 fa f6             	cmp    $0xfffffff6,%edx
   26a2f:	76 11                	jbe    26a42 <JS_CallInternal+0x1a32>
   26a31:	8b 41 fc             	mov    -0x4(%rcx),%eax
   26a34:	83 e8 01             	sub    $0x1,%eax
   26a37:	89 41 fc             	mov    %eax,-0x4(%rcx)
   26a3a:	85 c0                	test   %eax,%eax
   26a3c:	0f 8e 8f 74 00 00    	jle    2ded1 <JS_CallInternal+0x8ec1>
   26a42:	48 8b 43 08          	mov    0x8(%rbx),%rax
   26a46:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26a49:	0f 87 15 54 00 00    	ja     2be64 <JS_CallInternal+0x6e54>
   26a4f:	49 8b 47 08          	mov    0x8(%r15),%rax
   26a53:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26a56:	76 14                	jbe    26a6c <JS_CallInternal+0x1a5c>
   26a58:	49 8b 17             	mov    (%r15),%rdx
   26a5b:	8b 4a fc             	mov    -0x4(%rdx),%ecx
   26a5e:	83 e9 01             	sub    $0x1,%ecx
   26a61:	89 4a fc             	mov    %ecx,-0x4(%rdx)
   26a64:	85 c9                	test   %ecx,%ecx
   26a66:	0f 8e 1e 63 00 00    	jle    2cd8a <JS_CallInternal+0x7d7a>
   26a6c:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   26a71:	49 83 c5 01          	add    $0x1,%r13
   26a75:	49 89 c2             	mov    %rax,%r10
   26a78:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26a7c:	ff e0                	jmp    *%rax
   26a7e:	f3 0f 1e fa          	endbr64
   26a82:	48 8d 43 e0          	lea    -0x20(%rbx),%rax
   26a86:	4c 8d 7b f0          	lea    -0x10(%rbx),%r15
   26a8a:	4c 8b 53 e0          	mov    -0x20(%rbx),%r10
   26a8e:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   26a92:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   26a99:	4d 8b 4f 08          	mov    0x8(%r15),%r9
   26a9d:	83 7b e8 ff          	cmpl   $0xffffffff,-0x18(%rbx)
   26aa1:	0f 85 03 74 00 00    	jne    2deaa <JS_CallInternal+0x8e9a>
   26aa7:	41 83 f9 f8          	cmp    $0xfffffff8,%r9d
   26aab:	0f 85 d3 73 00 00    	jne    2de84 <JS_CallInternal+0x8e74>
   26ab1:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   26ab6:	48 89 d6             	mov    %rdx,%rsi
   26ab9:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   26ac0:	4c 89 8d f0 fd ff ff 	mov    %r9,-0x210(%rbp)
   26ac7:	48 89 bd 20 fe ff ff 	mov    %rdi,-0x1e0(%rbp)
   26ace:	48 89 95 10 fe ff ff 	mov    %rdx,-0x1f0(%rbp)
   26ad5:	e8 26 17 ff ff       	call   18200 <js_get_atom_index>
   26ada:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   26ae1:	89 c7                	mov    %eax,%edi
   26ae3:	49 8b 72 18          	mov    0x18(%r10),%rsi
   26ae7:	8b 4e 18             	mov    0x18(%rsi),%ecx
   26aea:	21 c8                	and    %ecx,%eax
   26aec:	8b 44 86 38          	mov    0x38(%rsi,%rax,4),%eax
   26af0:	48 85 c0             	test   %rax,%rax
   26af3:	0f 84 fa 6e 00 00    	je     2d9f3 <JS_CallInternal+0x89e3>
   26af9:	48 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%rdx
   26b00:	4c 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%r9
   26b07:	4c 8d 04 8d 3c 00 00 	lea    0x3c(,%rcx,4),%r8
   26b0e:	00 
   26b0f:	48 83 e8 01          	sub    $0x1,%rax
   26b13:	49 8d 0c c0          	lea    (%r8,%rax,8),%rcx
   26b17:	48 01 f1             	add    %rsi,%rcx
   26b1a:	3b 79 04             	cmp    0x4(%rcx),%edi
   26b1d:	0f 85 c3 6e 00 00    	jne    2d9e6 <JS_CallInternal+0x89d6>
   26b23:	48 c1 e0 04          	shl    $0x4,%rax
   26b27:	49 03 42 20          	add    0x20(%r10),%rax
   26b2b:	48 8b 08             	mov    (%rax),%rcx
   26b2e:	48 8b 40 08          	mov    0x8(%rax),%rax
   26b32:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26b35:	76 04                	jbe    26b3b <JS_CallInternal+0x1b2b>
   26b37:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   26b3b:	41 89 c0             	mov    %eax,%r8d
   26b3e:	41 83 f9 f6          	cmp    $0xfffffff6,%r9d
   26b42:	76 11                	jbe    26b55 <JS_CallInternal+0x1b45>
   26b44:	8b 72 fc             	mov    -0x4(%rdx),%esi
   26b47:	83 ee 01             	sub    $0x1,%esi
   26b4a:	89 72 fc             	mov    %esi,-0x4(%rdx)
   26b4d:	85 f6                	test   %esi,%esi
   26b4f:	0f 8e 5a 62 00 00    	jle    2cdaf <JS_CallInternal+0x7d9f>
   26b55:	48 8b b5 30 fe ff ff 	mov    -0x1d0(%rbp),%rsi
   26b5c:	48 8b 76 08          	mov    0x8(%rsi),%rsi
   26b60:	83 fe f6             	cmp    $0xfffffff6,%esi
   26b63:	76 1b                	jbe    26b80 <JS_CallInternal+0x1b70>
   26b65:	48 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%rdx
   26b6c:	48 8b 3a             	mov    (%rdx),%rdi
   26b6f:	8b 57 fc             	mov    -0x4(%rdi),%edx
   26b72:	83 ea 01             	sub    $0x1,%edx
   26b75:	89 57 fc             	mov    %edx,-0x4(%rdi)
   26b78:	85 d2                	test   %edx,%edx
   26b7a:	0f 8e ef 67 00 00    	jle    2d36f <JS_CallInternal+0x835f>
   26b80:	48 89 4b e0          	mov    %rcx,-0x20(%rbx)
   26b84:	48 89 43 e8          	mov    %rax,-0x18(%rbx)
   26b88:	41 83 f8 06          	cmp    $0x6,%r8d
   26b8c:	0f 84 b7 6e 00 00    	je     2da49 <JS_CallInternal+0x8a39>
   26b92:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   26b97:	4c 89 fb             	mov    %r15,%rbx
   26b9a:	49 83 c5 01          	add    $0x1,%r13
   26b9e:	49 89 c2             	mov    %rax,%r10
   26ba1:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26ba5:	ff e0                	jmp    *%rax
   26ba7:	f3 0f 1e fa          	endbr64
   26bab:	41 8b 75 00          	mov    0x0(%r13),%esi
   26baf:	4c 89 e7             	mov    %r12,%rdi
   26bb2:	4d 8d 7d 04          	lea    0x4(%r13),%r15
   26bb6:	e8 c5 f3 00 00       	call   35f80 <JS_NewSymbolFromAtom.constprop.0>
   26bbb:	83 fa 06             	cmp    $0x6,%edx
   26bbe:	0f 84 7c eb ff ff    	je     25740 <JS_CallInternal+0x730>
   26bc4:	48 89 03             	mov    %rax,(%rbx)
   26bc7:	49 83 c5 05          	add    $0x5,%r13
   26bcb:	48 83 c3 10          	add    $0x10,%rbx
   26bcf:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   26bd3:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   26bd8:	49 89 c2             	mov    %rax,%r10
   26bdb:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26bdf:	ff e0                	jmp    *%rax
   26be1:	f3 0f 1e fa          	endbr64
   26be5:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   26be9:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   26bed:	4c 89 e7             	mov    %r12,%rdi
   26bf0:	4c 8d 7b f0          	lea    -0x10(%rbx),%r15
   26bf4:	e8 a7 de ff ff       	call   24aa0 <js_operator_typeof>
   26bf9:	83 f8 49             	cmp    $0x49,%eax
   26bfc:	0f 84 ad 00 00 00    	je     26caf <JS_CallInternal+0x1c9f>
   26c02:	49 8b 57 08          	mov    0x8(%r15),%rdx
   26c06:	49 8b 0f             	mov    (%r15),%rcx
   26c09:	83 fa f6             	cmp    $0xfffffff6,%edx
   26c0c:	76 11                	jbe    26c1f <JS_CallInternal+0x1c0f>
   26c0e:	8b 41 fc             	mov    -0x4(%rcx),%eax
   26c11:	83 e8 01             	sub    $0x1,%eax
   26c14:	89 41 fc             	mov    %eax,-0x4(%rcx)
   26c17:	85 c0                	test   %eax,%eax
   26c19:	0f 8e 8b 52 00 00    	jle    2beaa <JS_CallInternal+0x6e9a>
   26c1f:	48 c7 43 f0 00 00 00 	movq   $0x0,-0x10(%rbx)
   26c26:	00 
   26c27:	49 83 c5 01          	add    $0x1,%r13
   26c2b:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   26c32:	00 
   26c33:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   26c38:	49 89 c2             	mov    %rax,%r10
   26c3b:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26c3f:	ff e0                	jmp    *%rax
   26c41:	f3 0f 1e fa          	endbr64
   26c45:	83 7b f8 02          	cmpl   $0x2,-0x8(%rbx)
   26c49:	74 15                	je     26c60 <JS_CallInternal+0x1c50>
   26c4b:	4c 8d 7b f0          	lea    -0x10(%rbx),%r15
   26c4f:	eb b1                	jmp    26c02 <JS_CallInternal+0x1bf2>
   26c51:	f3 0f 1e fa          	endbr64
   26c55:	8b 43 f8             	mov    -0x8(%rbx),%eax
   26c58:	83 e8 02             	sub    $0x2,%eax
   26c5b:	83 f8 01             	cmp    $0x1,%eax
   26c5e:	77 eb                	ja     26c4b <JS_CallInternal+0x1c3b>
   26c60:	48 c7 43 f0 01 00 00 	movq   $0x1,-0x10(%rbx)
   26c67:	00 
   26c68:	49 83 c5 01          	add    $0x1,%r13
   26c6c:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   26c73:	00 
   26c74:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   26c79:	49 89 c2             	mov    %rax,%r10
   26c7c:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26c80:	ff e0                	jmp    *%rax
   26c82:	f3 0f 1e fa          	endbr64
   26c86:	83 7b f8 03          	cmpl   $0x3,-0x8(%rbx)
   26c8a:	75 bf                	jne    26c4b <JS_CallInternal+0x1c3b>
   26c8c:	eb d2                	jmp    26c60 <JS_CallInternal+0x1c50>
   26c8e:	f3 0f 1e fa          	endbr64
   26c92:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   26c96:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   26c9a:	4c 89 e7             	mov    %r12,%rdi
   26c9d:	4c 8d 7b f0          	lea    -0x10(%rbx),%r15
   26ca1:	e8 fa dd ff ff       	call   24aa0 <js_operator_typeof>
   26ca6:	83 f8 1b             	cmp    $0x1b,%eax
   26ca9:	0f 85 53 ff ff ff    	jne    26c02 <JS_CallInternal+0x1bf2>
   26caf:	49 8b 47 08          	mov    0x8(%r15),%rax
   26cb3:	49 8b 17             	mov    (%r15),%rdx
   26cb6:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26cb9:	76 a5                	jbe    26c60 <JS_CallInternal+0x1c50>
   26cbb:	8b 4a fc             	mov    -0x4(%rdx),%ecx
   26cbe:	83 e9 01             	sub    $0x1,%ecx
   26cc1:	89 4a fc             	mov    %ecx,-0x4(%rdx)
   26cc4:	85 c9                	test   %ecx,%ecx
   26cc6:	7f 98                	jg     26c60 <JS_CallInternal+0x1c50>
   26cc8:	48 92                	xchg   %rax,%rdx
   26cca:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   26ccf:	48 89 c6             	mov    %rax,%rsi
   26cd2:	e8 f9 77 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   26cd7:	eb 87                	jmp    26c60 <JS_CallInternal+0x1c50>
   26cd9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   26ce0:	f3 0f 1e fa          	endbr64
   26ce4:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   26ce9:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   26cf0:	4d 8d 7d 01          	lea    0x1(%r13),%r15
   26cf4:	48 c1 e0 04          	shl    $0x4,%rax
   26cf8:	48 03 41 50          	add    0x50(%rcx),%rax
   26cfc:	48 8b 10             	mov    (%rax),%rdx
   26cff:	48 8b 40 08          	mov    0x8(%rax),%rax
   26d03:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26d06:	76 04                	jbe    26d0c <JS_CallInternal+0x1cfc>
   26d08:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   26d0c:	48 92                	xchg   %rax,%rdx
   26d0e:	4c 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%r8
   26d15:	45 31 c9             	xor    %r9d,%r9d
   26d18:	4c 89 e7             	mov    %r12,%rdi
   26d1b:	48 8b 8d 88 fe ff ff 	mov    -0x178(%rbp),%rcx
   26d22:	48 89 c6             	mov    %rax,%rsi
   26d25:	e8 56 77 02 00       	call   4e480 <js_closure>
   26d2a:	48 89 03             	mov    %rax,(%rbx)
   26d2d:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   26d31:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   26d35:	0f 84 92 6e 00 00    	je     2dbcd <JS_CallInternal+0x8bbd>
   26d3b:	41 0f b6 45 01       	movzbl 0x1(%r13),%eax
   26d40:	48 83 c3 10          	add    $0x10,%rbx
   26d44:	49 83 c5 02          	add    $0x2,%r13
   26d48:	49 89 c2             	mov    %rax,%r10
   26d4b:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26d4f:	ff e0                	jmp    *%rax
   26d51:	f3 0f 1e fa          	endbr64
   26d55:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   26d5c:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   26d61:	48 c1 e0 04          	shl    $0x4,%rax
   26d65:	48 03 41 50          	add    0x50(%rcx),%rax
   26d69:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   26d6d:	48 8b 10             	mov    (%rax),%rdx
   26d70:	48 8b 40 08          	mov    0x8(%rax),%rax
   26d74:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26d77:	76 04                	jbe    26d7d <JS_CallInternal+0x1d6d>
   26d79:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   26d7d:	48 89 13             	mov    %rdx,(%rbx)
   26d80:	49 83 c5 02          	add    $0x2,%r13
   26d84:	48 89 43 08          	mov    %rax,0x8(%rbx)
   26d88:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   26d8d:	48 89 cb             	mov    %rcx,%rbx
   26d90:	49 89 c2             	mov    %rax,%r10
   26d93:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26d97:	ff e0                	jmp    *%rax
   26d99:	f3 0f 1e fa          	endbr64
   26d9d:	41 0f bf 45 00       	movswl 0x0(%r13),%eax
   26da2:	48 83 c3 10          	add    $0x10,%rbx
   26da6:	49 83 c5 03          	add    $0x3,%r13
   26daa:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   26db1:	00 
   26db2:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   26db6:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   26dbb:	49 89 c2             	mov    %rax,%r10
   26dbe:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26dc2:	ff e0                	jmp    *%rax
   26dc4:	f3 0f 1e fa          	endbr64
   26dc8:	41 0f be 45 00       	movsbl 0x0(%r13),%eax
   26dcd:	48 83 c3 10          	add    $0x10,%rbx
   26dd1:	49 83 c5 02          	add    $0x2,%r13
   26dd5:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   26ddc:	00 
   26ddd:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   26de1:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   26de6:	49 89 c2             	mov    %rax,%r10
   26de9:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26ded:	ff e0                	jmp    *%rax
   26def:	f3 0f 1e fa          	endbr64
   26df3:	e9 08 e5 ff ff       	jmp    25300 <JS_CallInternal+0x2f0>
   26df8:	f3 0f 1e fa          	endbr64
   26dfc:	e9 ff e4 ff ff       	jmp    25300 <JS_CallInternal+0x2f0>
   26e01:	f3 0f 1e fa          	endbr64
   26e05:	e9 f6 e4 ff ff       	jmp    25300 <JS_CallInternal+0x2f0>
   26e0a:	f3 0f 1e fa          	endbr64
   26e0e:	e9 ed e4 ff ff       	jmp    25300 <JS_CallInternal+0x2f0>
   26e13:	f3 0f 1e fa          	endbr64
   26e17:	e9 e4 e4 ff ff       	jmp    25300 <JS_CallInternal+0x2f0>
   26e1c:	f3 0f 1e fa          	endbr64
   26e20:	e9 db e4 ff ff       	jmp    25300 <JS_CallInternal+0x2f0>
   26e25:	f3 0f 1e fa          	endbr64
   26e29:	e9 d2 e4 ff ff       	jmp    25300 <JS_CallInternal+0x2f0>
   26e2e:	f3 0f 1e fa          	endbr64
   26e32:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   26e39:	41 8b 45 00          	mov    0x0(%r13),%eax
   26e3d:	48 c1 e0 04          	shl    $0x4,%rax
   26e41:	48 03 41 50          	add    0x50(%rcx),%rax
   26e45:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   26e49:	48 8b 10             	mov    (%rax),%rdx
   26e4c:	48 8b 40 08          	mov    0x8(%rax),%rax
   26e50:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26e53:	76 04                	jbe    26e59 <JS_CallInternal+0x1e49>
   26e55:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   26e59:	48 89 13             	mov    %rdx,(%rbx)
   26e5c:	49 83 c5 05          	add    $0x5,%r13
   26e60:	48 89 43 08          	mov    %rax,0x8(%rbx)
   26e64:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   26e69:	48 89 cb             	mov    %rcx,%rbx
   26e6c:	49 89 c2             	mov    %rax,%r10
   26e6f:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26e73:	ff e0                	jmp    *%rax
   26e75:	f3 0f 1e fa          	endbr64
   26e79:	49 63 45 00          	movslq 0x0(%r13),%rax
   26e7d:	48 c7 43 08 07 00 00 	movq   $0x7,0x8(%rbx)
   26e84:	00 
   26e85:	49 83 c5 05          	add    $0x5,%r13
   26e89:	48 83 c3 10          	add    $0x10,%rbx
   26e8d:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   26e91:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   26e96:	49 89 c2             	mov    %rax,%r10
   26e99:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26e9d:	ff e0                	jmp    *%rax
   26e9f:	f3 0f 1e fa          	endbr64
   26ea3:	41 8b 45 00          	mov    0x0(%r13),%eax
   26ea7:	48 c7 43 08 00 00 00 	movq   $0x0,0x8(%rbx)
   26eae:	00 
   26eaf:	49 83 c5 05          	add    $0x5,%r13
   26eb3:	48 83 c3 10          	add    $0x10,%rbx
   26eb7:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   26ebb:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   26ec0:	49 89 c2             	mov    %rax,%r10
   26ec3:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26ec7:	ff e0                	jmp    *%rax
   26ec9:	f3 0f 1e fa          	endbr64
   26ecd:	e9 1b e5 ff ff       	jmp    253ed <JS_CallInternal+0x3dd>
   26ed2:	f3 0f 1e fa          	endbr64
   26ed6:	e9 12 e5 ff ff       	jmp    253ed <JS_CallInternal+0x3dd>
   26edb:	f3 0f 1e fa          	endbr64
   26edf:	41 8b 45 00          	mov    0x0(%r13),%eax
   26ee3:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   26eea:	48 c1 e0 04          	shl    $0x4,%rax
   26eee:	48 03 41 50          	add    0x50(%rcx),%rax
   26ef2:	48 8b 10             	mov    (%rax),%rdx
   26ef5:	48 8b 40 08          	mov    0x8(%rax),%rax
   26ef9:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26efc:	76 04                	jbe    26f02 <JS_CallInternal+0x1ef2>
   26efe:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   26f02:	48 92                	xchg   %rax,%rdx
   26f04:	4c 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%r8
   26f0b:	45 31 c9             	xor    %r9d,%r9d
   26f0e:	4c 89 e7             	mov    %r12,%rdi
   26f11:	48 8b 8d 88 fe ff ff 	mov    -0x178(%rbp),%rcx
   26f18:	48 89 c6             	mov    %rax,%rsi
   26f1b:	4d 8d 7d 04          	lea    0x4(%r13),%r15
   26f1f:	e8 5c 75 02 00       	call   4e480 <js_closure>
   26f24:	48 89 03             	mov    %rax,(%rbx)
   26f27:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   26f2b:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   26f2f:	0f 84 03 66 00 00    	je     2d538 <JS_CallInternal+0x8528>
   26f35:	41 0f b6 45 04       	movzbl 0x4(%r13),%eax
   26f3a:	48 83 c3 10          	add    $0x10,%rbx
   26f3e:	49 83 c5 05          	add    $0x5,%r13
   26f42:	49 89 c2             	mov    %rax,%r10
   26f45:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26f49:	ff e0                	jmp    *%rax
   26f4b:	f3 0f 1e fa          	endbr64
   26f4f:	f3 0f 6f 53 e0       	movdqu -0x20(%rbx),%xmm2
   26f54:	f3 0f 6f 4b c0       	movdqu -0x40(%rbx),%xmm1
   26f59:	49 83 c5 01          	add    $0x1,%r13
   26f5d:	f3 0f 6f 43 d0       	movdqu -0x30(%rbx),%xmm0
   26f62:	0f 11 53 c0          	movups %xmm2,-0x40(%rbx)
   26f66:	f3 0f 6f 53 f0       	movdqu -0x10(%rbx),%xmm2
   26f6b:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   26f6f:	0f 11 53 d0          	movups %xmm2,-0x30(%rbx)
   26f73:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   26f77:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   26f7c:	49 89 c2             	mov    %rax,%r10
   26f7f:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26f83:	ff e0                	jmp    *%rax
   26f85:	f3 0f 1e fa          	endbr64
   26f89:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   26f8e:	f3 0f 6f 4b f0       	movdqu -0x10(%rbx),%xmm1
   26f93:	49 83 c5 01          	add    $0x1,%r13
   26f97:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   26f9b:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   26f9f:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   26fa4:	49 89 c2             	mov    %rax,%r10
   26fa7:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26fab:	ff e0                	jmp    *%rax
   26fad:	f3 0f 1e fa          	endbr64
   26fb1:	f3 0f 6f 4b d0       	movdqu -0x30(%rbx),%xmm1
   26fb6:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   26fbb:	49 83 c5 01          	add    $0x1,%r13
   26fbf:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   26fc3:	f3 0f 6f 4b c0       	movdqu -0x40(%rbx),%xmm1
   26fc8:	0f 11 4b d0          	movups %xmm1,-0x30(%rbx)
   26fcc:	f3 0f 6f 4b b0       	movdqu -0x50(%rbx),%xmm1
   26fd1:	0f 11 43 b0          	movups %xmm0,-0x50(%rbx)
   26fd5:	0f 11 4b c0          	movups %xmm1,-0x40(%rbx)
   26fd9:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   26fde:	49 89 c2             	mov    %rax,%r10
   26fe1:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26fe5:	ff e0                	jmp    *%rax
   26fe7:	f3 0f 1e fa          	endbr64
   26feb:	f3 0f 6f 4b d0       	movdqu -0x30(%rbx),%xmm1
   26ff0:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   26ff5:	49 83 c5 01          	add    $0x1,%r13
   26ff9:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   26ffd:	f3 0f 6f 4b c0       	movdqu -0x40(%rbx),%xmm1
   27002:	0f 11 43 c0          	movups %xmm0,-0x40(%rbx)
   27006:	0f 11 4b d0          	movups %xmm1,-0x30(%rbx)
   2700a:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2700f:	49 89 c2             	mov    %rax,%r10
   27012:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27016:	ff e0                	jmp    *%rax
   27018:	f3 0f 1e fa          	endbr64
   2701c:	f3 0f 6f 4b e0       	movdqu -0x20(%rbx),%xmm1
   27021:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   27026:	49 83 c5 01          	add    $0x1,%r13
   2702a:	0f 11 4b f0          	movups %xmm1,-0x10(%rbx)
   2702e:	f3 0f 6f 4b d0       	movdqu -0x30(%rbx),%xmm1
   27033:	0f 11 43 d0          	movups %xmm0,-0x30(%rbx)
   27037:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   2703b:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   27040:	49 89 c2             	mov    %rax,%r10
   27043:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27047:	ff e0                	jmp    *%rax
   27049:	f3 0f 1e fa          	endbr64
   2704d:	f3 0f 6f 4b c0       	movdqu -0x40(%rbx),%xmm1
   27052:	f3 0f 6f 43 b0       	movdqu -0x50(%rbx),%xmm0
   27057:	49 83 c5 01          	add    $0x1,%r13
   2705b:	0f 11 4b b0          	movups %xmm1,-0x50(%rbx)
   2705f:	f3 0f 6f 4b d0       	movdqu -0x30(%rbx),%xmm1
   27064:	0f 11 4b c0          	movups %xmm1,-0x40(%rbx)
   27068:	f3 0f 6f 4b e0       	movdqu -0x20(%rbx),%xmm1
   2706d:	0f 11 4b d0          	movups %xmm1,-0x30(%rbx)
   27071:	f3 0f 6f 4b f0       	movdqu -0x10(%rbx),%xmm1
   27076:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   2707a:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   2707e:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   27083:	49 89 c2             	mov    %rax,%r10
   27086:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2708a:	ff e0                	jmp    *%rax
   2708c:	f3 0f 1e fa          	endbr64
   27090:	f3 0f 6f 4b d0       	movdqu -0x30(%rbx),%xmm1
   27095:	f3 0f 6f 43 c0       	movdqu -0x40(%rbx),%xmm0
   2709a:	49 83 c5 01          	add    $0x1,%r13
   2709e:	0f 11 4b c0          	movups %xmm1,-0x40(%rbx)
   270a2:	f3 0f 6f 4b e0       	movdqu -0x20(%rbx),%xmm1
   270a7:	0f 11 4b d0          	movups %xmm1,-0x30(%rbx)
   270ab:	f3 0f 6f 4b f0       	movdqu -0x10(%rbx),%xmm1
   270b0:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   270b4:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   270b8:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   270bd:	49 89 c2             	mov    %rax,%r10
   270c0:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   270c4:	ff e0                	jmp    *%rax
   270c6:	f3 0f 1e fa          	endbr64
   270ca:	f3 0f 6f 4b e0       	movdqu -0x20(%rbx),%xmm1
   270cf:	f3 0f 6f 43 d0       	movdqu -0x30(%rbx),%xmm0
   270d4:	49 83 c5 01          	add    $0x1,%r13
   270d8:	0f 11 4b d0          	movups %xmm1,-0x30(%rbx)
   270dc:	f3 0f 6f 4b f0       	movdqu -0x10(%rbx),%xmm1
   270e1:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   270e5:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   270e9:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   270ee:	49 89 c2             	mov    %rax,%r10
   270f1:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   270f5:	ff e0                	jmp    *%rax
   270f7:	f3 0f 1e fa          	endbr64
   270fb:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   27100:	f3 0f 6f 4b d0       	movdqu -0x30(%rbx),%xmm1
   27105:	49 83 c5 01          	add    $0x1,%r13
   27109:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   2710d:	0f 11 43 d0          	movups %xmm0,-0x30(%rbx)
   27111:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   27116:	49 89 c2             	mov    %rax,%r10
   27119:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2711d:	ff e0                	jmp    *%rax
   2711f:	f3 0f 1e fa          	endbr64
   27123:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   27128:	0f 11 03             	movups %xmm0,(%rbx)
   2712b:	66 48 0f 7e c2       	movq   %xmm0,%rdx
   27130:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   27135:	48 8b 43 08          	mov    0x8(%rbx),%rax
   27139:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   2713d:	f3 0f 6f 43 d0       	movdqu -0x30(%rbx),%xmm0
   27142:	0f 11 43 e0          	movups %xmm0,-0x20(%rbx)
   27146:	f3 0f 6f 43 c0       	movdqu -0x40(%rbx),%xmm0
   2714b:	0f 11 43 d0          	movups %xmm0,-0x30(%rbx)
   2714f:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27152:	76 04                	jbe    27158 <JS_CallInternal+0x2148>
   27154:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27158:	48 89 53 c0          	mov    %rdx,-0x40(%rbx)
   2715c:	49 83 c5 01          	add    $0x1,%r13
   27160:	48 83 c3 10          	add    $0x10,%rbx
   27164:	48 89 43 b8          	mov    %rax,-0x48(%rbx)
   27168:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2716d:	49 89 c2             	mov    %rax,%r10
   27170:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27174:	ff e0                	jmp    *%rax
   27176:	f3 0f 1e fa          	endbr64
   2717a:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2717f:	0f 11 03             	movups %xmm0,(%rbx)
   27182:	66 48 0f 7e c2       	movq   %xmm0,%rdx
   27187:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   2718c:	48 8b 43 08          	mov    0x8(%rbx),%rax
   27190:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   27194:	f3 0f 6f 43 d0       	movdqu -0x30(%rbx),%xmm0
   27199:	0f 11 43 e0          	movups %xmm0,-0x20(%rbx)
   2719d:	83 f8 f6             	cmp    $0xfffffff6,%eax
   271a0:	76 04                	jbe    271a6 <JS_CallInternal+0x2196>
   271a2:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   271a6:	48 89 53 d0          	mov    %rdx,-0x30(%rbx)
   271aa:	49 83 c5 01          	add    $0x1,%r13
   271ae:	48 83 c3 10          	add    $0x10,%rbx
   271b2:	48 89 43 c8          	mov    %rax,-0x38(%rbx)
   271b6:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   271bb:	49 89 c2             	mov    %rax,%r10
   271be:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   271c2:	ff e0                	jmp    *%rax
   271c4:	f3 0f 1e fa          	endbr64
   271c8:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   271cd:	0f 11 03             	movups %xmm0,(%rbx)
   271d0:	66 48 0f 7e c2       	movq   %xmm0,%rdx
   271d5:	48 8b 43 08          	mov    0x8(%rbx),%rax
   271d9:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   271de:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   271e2:	83 f8 f6             	cmp    $0xfffffff6,%eax
   271e5:	76 04                	jbe    271eb <JS_CallInternal+0x21db>
   271e7:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   271eb:	48 89 53 e0          	mov    %rdx,-0x20(%rbx)
   271ef:	49 83 c5 01          	add    $0x1,%r13
   271f3:	48 83 c3 10          	add    $0x10,%rbx
   271f7:	48 89 43 d8          	mov    %rax,-0x28(%rbx)
   271fb:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   27200:	49 89 c2             	mov    %rax,%r10
   27203:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27207:	ff e0                	jmp    *%rax
   27209:	f3 0f 1e fa          	endbr64
   2720d:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   27212:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   27216:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   2721a:	0f 11 03             	movups %xmm0,(%rbx)
   2721d:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27220:	76 04                	jbe    27226 <JS_CallInternal+0x2216>
   27222:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27226:	48 89 53 f0          	mov    %rdx,-0x10(%rbx)
   2722a:	49 83 c5 01          	add    $0x1,%r13
   2722e:	48 83 c3 10          	add    $0x10,%rbx
   27232:	48 89 43 e8          	mov    %rax,-0x18(%rbx)
   27236:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2723b:	49 89 c2             	mov    %rax,%r10
   2723e:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27242:	ff e0                	jmp    *%rax
   27244:	f3 0f 1e fa          	endbr64
   27248:	48 8b 43 d8          	mov    -0x28(%rbx),%rax
   2724c:	48 8b 53 d0          	mov    -0x30(%rbx),%rdx
   27250:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27253:	76 04                	jbe    27259 <JS_CallInternal+0x2249>
   27255:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27259:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2725d:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   27261:	48 89 13             	mov    %rdx,(%rbx)
   27264:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   27268:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2726b:	76 04                	jbe    27271 <JS_CallInternal+0x2261>
   2726d:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27271:	48 89 43 18          	mov    %rax,0x18(%rbx)
   27275:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   27279:	48 89 53 10          	mov    %rdx,0x10(%rbx)
   2727d:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   27281:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27284:	76 04                	jbe    2728a <JS_CallInternal+0x227a>
   27286:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2728a:	48 89 53 20          	mov    %rdx,0x20(%rbx)
   2728e:	49 83 c5 01          	add    $0x1,%r13
   27292:	48 83 c3 30          	add    $0x30,%rbx
   27296:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2729a:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2729f:	49 89 c2             	mov    %rax,%r10
   272a2:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   272a6:	ff e0                	jmp    *%rax
   272a8:	f3 0f 1e fa          	endbr64
   272ac:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   272b0:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   272b4:	83 f8 f6             	cmp    $0xfffffff6,%eax
   272b7:	76 04                	jbe    272bd <JS_CallInternal+0x22ad>
   272b9:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   272bd:	48 89 43 08          	mov    %rax,0x8(%rbx)
   272c1:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   272c5:	48 89 13             	mov    %rdx,(%rbx)
   272c8:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   272cc:	83 f8 f6             	cmp    $0xfffffff6,%eax
   272cf:	76 04                	jbe    272d5 <JS_CallInternal+0x22c5>
   272d1:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   272d5:	48 89 53 10          	mov    %rdx,0x10(%rbx)
   272d9:	49 83 c5 01          	add    $0x1,%r13
   272dd:	48 83 c3 20          	add    $0x20,%rbx
   272e1:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   272e5:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   272ea:	49 89 c2             	mov    %rax,%r10
   272ed:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   272f1:	ff e0                	jmp    *%rax
   272f3:	f3 0f 1e fa          	endbr64
   272f7:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   272fb:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   272ff:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27302:	76 04                	jbe    27308 <JS_CallInternal+0x22f8>
   27304:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27308:	48 89 13             	mov    %rdx,(%rbx)
   2730b:	49 83 c5 01          	add    $0x1,%r13
   2730f:	48 83 c3 10          	add    $0x10,%rbx
   27313:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   27317:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2731c:	49 89 c2             	mov    %rax,%r10
   2731f:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27323:	ff e0                	jmp    *%rax
   27325:	f3 0f 1e fa          	endbr64
   27329:	48 8b 43 d8          	mov    -0x28(%rbx),%rax
   2732d:	48 8b 4b d0          	mov    -0x30(%rbx),%rcx
   27331:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27334:	76 11                	jbe    27347 <JS_CallInternal+0x2337>
   27336:	8b 71 fc             	mov    -0x4(%rcx),%esi
   27339:	8d 56 ff             	lea    -0x1(%rsi),%edx
   2733c:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2733f:	85 d2                	test   %edx,%edx
   27341:	0f 8e bb 60 00 00    	jle    2d402 <JS_CallInternal+0x83f2>
   27347:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   2734c:	49 83 c5 01          	add    $0x1,%r13
   27350:	48 83 eb 10          	sub    $0x10,%rbx
   27354:	0f 11 43 e0          	movups %xmm0,-0x20(%rbx)
   27358:	f3 0f 6f 03          	movdqu (%rbx),%xmm0
   2735c:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   27360:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   27365:	49 89 c2             	mov    %rax,%r10
   27368:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2736c:	ff e0                	jmp    *%rax
   2736e:	f3 0f 1e fa          	endbr64
   27372:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   27376:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   2737a:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2737d:	76 11                	jbe    27390 <JS_CallInternal+0x2380>
   2737f:	8b 51 fc             	mov    -0x4(%rcx),%edx
   27382:	83 ea 01             	sub    $0x1,%edx
   27385:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27388:	85 d2                	test   %edx,%edx
   2738a:	0f 8e 48 60 00 00    	jle    2d3d8 <JS_CallInternal+0x83c8>
   27390:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   27395:	49 83 c5 01          	add    $0x1,%r13
   27399:	48 83 eb 10          	sub    $0x10,%rbx
   2739d:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   273a1:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   273a6:	49 89 c2             	mov    %rax,%r10
   273a9:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   273ad:	ff e0                	jmp    *%rax
   273af:	f3 0f 1e fa          	endbr64
   273b3:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   273b7:	48 83 eb 10          	sub    $0x10,%rbx
   273bb:	48 8b 0b             	mov    (%rbx),%rcx
   273be:	83 f8 f6             	cmp    $0xfffffff6,%eax
   273c1:	76 11                	jbe    273d4 <JS_CallInternal+0x23c4>
   273c3:	8b 51 fc             	mov    -0x4(%rcx),%edx
   273c6:	83 ea 01             	sub    $0x1,%edx
   273c9:	89 51 fc             	mov    %edx,-0x4(%rcx)
   273cc:	85 d2                	test   %edx,%edx
   273ce:	0f 8e 19 60 00 00    	jle    2d3ed <JS_CallInternal+0x83dd>
   273d4:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   273d9:	49 83 c5 01          	add    $0x1,%r13
   273dd:	49 89 c2             	mov    %rax,%r10
   273e0:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   273e4:	ff e0                	jmp    *%rax
   273e6:	f3 0f 1e fa          	endbr64
   273ea:	8b 8d a8 fe ff ff    	mov    -0x158(%rbp),%ecx
   273f0:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
   273f5:	4c 89 e7             	mov    %r12,%rdi
   273f8:	4d 8d 7d 02          	lea    0x2(%r13),%r15
   273fc:	39 c8                	cmp    %ecx,%eax
   273fe:	0f 4f c1             	cmovg  %ecx,%eax
   27401:	48 63 d0             	movslq %eax,%rdx
   27404:	29 c1                	sub    %eax,%ecx
   27406:	48 c1 e2 04          	shl    $0x4,%rdx
   2740a:	89 ce                	mov    %ecx,%esi
   2740c:	48 03 95 98 fe ff ff 	add    -0x168(%rbp),%rdx
   27413:	e8 38 50 02 00       	call   4c450 <js_create_array>
   27418:	48 89 03             	mov    %rax,(%rbx)
   2741b:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2741f:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   27423:	0f 84 06 6d 00 00    	je     2e12f <JS_CallInternal+0x911f>
   27429:	41 0f b6 45 02       	movzbl 0x2(%r13),%eax
   2742e:	48 83 c3 10          	add    $0x10,%rbx
   27432:	49 83 c5 03          	add    $0x3,%r13
   27436:	49 89 c2             	mov    %rax,%r10
   27439:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2743d:	ff e0                	jmp    *%rax
   2743f:	f3 0f 1e fa          	endbr64
   27443:	4d 8d 7d 01          	lea    0x1(%r13),%r15
   27447:	41 80 7d 00 06       	cmpb   $0x6,0x0(%r13)
   2744c:	0f 87 8b b1 fe ff    	ja     125dd <JS_CallInternal.cold>
   27452:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   27457:	48 8d 15 5a ad 0b 00 	lea    0xbad5a(%rip),%rdx        # e21b8 <qjsc_repl_size+0x4cc>
   2745e:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
   27462:	48 01 d0             	add    %rdx,%rax
   27465:	3e ff e0             	notrack jmp *%rax
   27468:	48 8d 43 10          	lea    0x10(%rbx),%rax
   2746c:	b9 01 00 00 00       	mov    $0x1,%ecx
   27471:	31 f6                	xor    %esi,%esi
   27473:	ba 02 00 00 00       	mov    $0x2,%edx
   27478:	4c 89 e7             	mov    %r12,%rdi
   2747b:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   27482:	e8 69 32 02 00       	call   4a6f0 <JS_NewObjectProtoClass>
   27487:	48 89 03             	mov    %rax,(%rbx)
   2748a:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2748e:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   27492:	0f 84 78 01 00 00    	je     27610 <JS_CallInternal+0x2600>
   27498:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   2749f:	41 0f b6 45 01       	movzbl 0x1(%r13),%eax
   274a4:	49 83 c5 02          	add    $0x2,%r13
   274a8:	49 89 c2             	mov    %rax,%r10
   274ab:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   274af:	ff e0                	jmp    *%rax
   274b1:	48 8b 85 40 fe ff ff 	mov    -0x1c0(%rbp),%rax
   274b8:	48 8b 40 38          	mov    0x38(%rax),%rax
   274bc:	48 85 c0             	test   %rax,%rax
   274bf:	0f 84 a5 80 00 00    	je     2f56a <JS_CallInternal+0xa55a>
   274c5:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   274c9:	48 83 c3 10          	add    $0x10,%rbx
   274cd:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   274d1:	48 c7 43 f8 ff ff ff 	movq   $0xffffffffffffffff,-0x8(%rbx)
   274d8:	ff 
   274d9:	eb c4                	jmp    2749f <JS_CallInternal+0x248f>
   274db:	48 8d 43 10          	lea    0x10(%rbx),%rax
   274df:	49 8b 94 24 58 01 00 	mov    0x158(%r12),%rdx
   274e6:	00 
   274e7:	48 c7 85 58 ff ff ff 	movq   $0x0,-0xa8(%rbp)
   274ee:	00 00 00 00 
   274f2:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   274f9:	8b 85 a8 fe ff ff    	mov    -0x158(%rbp),%eax
   274ff:	48 89 85 50 ff ff ff 	mov    %rax,-0xb0(%rbp)
   27506:	49 8b 84 24 50 01 00 	mov    0x150(%r12),%rax
   2750d:	00 
   2750e:	83 fa f6             	cmp    $0xfffffff6,%edx
   27511:	76 04                	jbe    27517 <JS_CallInternal+0x2507>
   27513:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   27517:	41 83 bc 24 68 01 00 	cmpl   $0xfffffff6,0x168(%r12)
   2751e:	00 f6 
   27520:	48 89 85 60 ff ff ff 	mov    %rax,-0xa0(%rbp)
   27527:	49 8b 84 24 60 01 00 	mov    0x160(%r12),%rax
   2752e:	00 
   2752f:	48 89 95 68 ff ff ff 	mov    %rdx,-0x98(%rbp)
   27536:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
   2753d:	76 04                	jbe    27543 <JS_CallInternal+0x2533>
   2753f:	83 40 fc 02          	addl   $0x2,-0x4(%rax)
   27543:	49 8b 74 24 38       	mov    0x38(%r12),%rsi
   27548:	48 8d 8d 50 ff ff ff 	lea    -0xb0(%rbp),%rcx
   2754f:	ba 08 00 00 00       	mov    $0x8,%edx
   27554:	4c 89 e7             	mov    %r12,%rdi
   27557:	48 89 85 78 ff ff ff 	mov    %rax,-0x88(%rbp)
   2755e:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   27562:	e8 d9 28 02 00       	call   49e40 <JS_NewObjectFromShape>
   27567:	48 89 c1             	mov    %rax,%rcx
   2756a:	83 fa 06             	cmp    $0x6,%edx
   2756d:	0f 84 1a 77 00 00    	je     2ec8d <JS_CallInternal+0x9c7d>
   27573:	8b 85 a8 fe ff ff    	mov    -0x158(%rbp),%eax
   27579:	85 c0                	test   %eax,%eax
   2757b:	0f 8f 9e 74 00 00    	jg     2ea1f <JS_CallInternal+0x9a0f>
   27581:	48 c7 41 30 00 00 00 	movq   $0x0,0x30(%rcx)
   27588:	00 
   27589:	89 41 38             	mov    %eax,0x38(%rcx)
   2758c:	48 89 0b             	mov    %rcx,(%rbx)
   2758f:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   27593:	e9 00 ff ff ff       	jmp    27498 <JS_CallInternal+0x2488>
   27598:	48 8b 95 b8 fe ff ff 	mov    -0x148(%rbp),%rdx
   2759f:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   275a3:	48 8b 42 08          	mov    0x8(%rdx),%rax
   275a7:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   275ab:	83 fa f6             	cmp    $0xfffffff6,%edx
   275ae:	76 04                	jbe    275b4 <JS_CallInternal+0x25a4>
   275b0:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   275b4:	48 89 03             	mov    %rax,(%rbx)
   275b7:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   275bb:	48 89 cb             	mov    %rcx,%rbx
   275be:	e9 dc fe ff ff       	jmp    2749f <JS_CallInternal+0x248f>
   275c3:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   275ca:	48 8d 43 10          	lea    0x10(%rbx),%rax
   275ce:	48 8b 95 98 fe ff ff 	mov    -0x168(%rbp),%rdx
   275d5:	4c 89 e7             	mov    %r12,%rdi
   275d8:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   275df:	8b 85 a8 fe ff ff    	mov    -0x158(%rbp),%eax
   275e5:	44 0f b7 41 38       	movzwl 0x38(%rcx),%r8d
   275ea:	48 8b 8d b8 fe ff ff 	mov    -0x148(%rbp),%rcx
   275f1:	89 c6                	mov    %eax,%esi
   275f3:	41 39 c0             	cmp    %eax,%r8d
   275f6:	44 0f 4f c0          	cmovg  %eax,%r8d
   275fa:	e8 71 2c 02 00       	call   4a270 <js_build_mapped_arguments>
   275ff:	48 89 03             	mov    %rax,(%rbx)
   27602:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   27606:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   2760a:	0f 85 88 fe ff ff    	jne    27498 <JS_CallInternal+0x2488>
   27610:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   27617:	e9 24 e1 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2761c:	48 8d 43 10          	lea    0x10(%rbx),%rax
   27620:	31 f6                	xor    %esi,%esi
   27622:	4c 89 e7             	mov    %r12,%rdi
   27625:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2762c:	e8 8f d8 ff ff       	call   24ec0 <JS_GetScriptOrModuleName>
   27631:	89 c2                	mov    %eax,%edx
   27633:	85 d2                	test   %edx,%edx
   27635:	0f 84 d9 6e 00 00    	je     2e514 <JS_CallInternal+0x9504>
   2763b:	49 8b 84 24 b8 01 00 	mov    0x1b8(%r12),%rax
   27642:	00 
   27643:	49 8d 8c 24 b0 01 00 	lea    0x1b0(%r12),%rcx
   2764a:	00 
   2764b:	48 39 c8             	cmp    %rcx,%rax
   2764e:	75 1d                	jne    2766d <JS_CallInternal+0x265d>
   27650:	e9 95 6e 00 00       	jmp    2e4ea <JS_CallInternal+0x94da>
   27655:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2765c:	00 00 00 00 
   27660:	48 8b 40 08          	mov    0x8(%rax),%rax
   27664:	48 39 c8             	cmp    %rcx,%rax
   27667:	0f 84 f9 6f 00 00    	je     2e666 <JS_CallInternal+0x9656>
   2766d:	3b 50 f8             	cmp    -0x8(%rax),%edx
   27670:	75 ee                	jne    27660 <JS_CallInternal+0x2650>
   27672:	48 83 e8 18          	sub    $0x18,%rax
   27676:	81 fa f2 00 00 00    	cmp    $0xf2,%edx
   2767c:	0f 8f f2 6f 00 00    	jg     2e674 <JS_CallInternal+0x9664>
   27682:	48 89 c6             	mov    %rax,%rsi
   27685:	4c 89 e7             	mov    %r12,%rdi
   27688:	e8 03 d9 ff ff       	call   24f90 <JS_GetImportMeta>
   2768d:	48 89 03             	mov    %rax,(%rbx)
   27690:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   27694:	83 fa 06             	cmp    $0x6,%edx
   27697:	0f 85 fb fd ff ff    	jne    27498 <JS_CallInternal+0x2488>
   2769d:	e9 6e ff ff ff       	jmp    27610 <JS_CallInternal+0x2600>
   276a2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   276a8:	48 8d 43 10          	lea    0x10(%rbx),%rax
   276ac:	83 bd 78 fe ff ff f6 	cmpl   $0xfffffff6,-0x188(%rbp)
   276b3:	76 0b                	jbe    276c0 <JS_CallInternal+0x26b0>
   276b5:	48 8b 8d 58 fe ff ff 	mov    -0x1a8(%rbp),%rcx
   276bc:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   276c0:	48 8b 8d 58 fe ff ff 	mov    -0x1a8(%rbp),%rcx
   276c7:	48 89 0b             	mov    %rcx,(%rbx)
   276ca:	48 8b 8d 78 fe ff ff 	mov    -0x188(%rbp),%rcx
   276d1:	48 89 4b 08          	mov    %rcx,0x8(%rbx)
   276d5:	48 89 c3             	mov    %rax,%rbx
   276d8:	e9 c2 fd ff ff       	jmp    2749f <JS_CallInternal+0x248f>
   276dd:	f3 0f 1e fa          	endbr64
   276e1:	49 8b 44 24 58       	mov    0x58(%r12),%rax
   276e6:	b9 01 00 00 00       	mov    $0x1,%ecx
   276eb:	4c 89 e7             	mov    %r12,%rdi
   276ee:	48 8b 70 10          	mov    0x10(%rax),%rsi
   276f2:	48 8b 50 18          	mov    0x18(%rax),%rdx
   276f6:	e8 f5 2f 02 00       	call   4a6f0 <JS_NewObjectProtoClass>
   276fb:	48 89 03             	mov    %rax,(%rbx)
   276fe:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   27702:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   27706:	0f 84 e3 61 00 00    	je     2d8ef <JS_CallInternal+0x88df>
   2770c:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   27711:	48 83 c3 10          	add    $0x10,%rbx
   27715:	49 83 c5 01          	add    $0x1,%r13
   27719:	49 89 c2             	mov    %rax,%r10
   2771c:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27720:	ff e0                	jmp    *%rax
   27722:	f3 0f 1e fa          	endbr64
   27726:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   2772d:	49 83 c5 01          	add    $0x1,%r13
   27731:	48 83 c3 10          	add    $0x10,%rbx
   27735:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   2773c:	00 
   2773d:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   27742:	49 89 c2             	mov    %rax,%r10
   27745:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27749:	ff e0                	jmp    *%rax
   2774b:	f3 0f 1e fa          	endbr64
   2774f:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   27756:	49 83 c5 01          	add    $0x1,%r13
   2775a:	48 83 c3 10          	add    $0x10,%rbx
   2775e:	48 c7 43 f8 02 00 00 	movq   $0x2,-0x8(%rbx)
   27765:	00 
   27766:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2776b:	49 89 c2             	mov    %rax,%r10
   2776e:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27772:	ff e0                	jmp    *%rax
   27774:	f3 0f 1e fa          	endbr64
   27778:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   2777f:	49 83 c5 01          	add    $0x1,%r13
   27783:	48 83 c3 10          	add    $0x10,%rbx
   27787:	48 c7 43 f8 03 00 00 	movq   $0x3,-0x8(%rbx)
   2778e:	00 
   2778f:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   27794:	49 89 c2             	mov    %rax,%r10
   27797:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2779b:	ff e0                	jmp    *%rax
   2779d:	f3 0f 1e fa          	endbr64
   277a1:	41 8b 75 00          	mov    0x0(%r13),%esi
   277a5:	31 d2                	xor    %edx,%edx
   277a7:	4c 89 e7             	mov    %r12,%rdi
   277aa:	48 83 c3 10          	add    $0x10,%rbx
   277ae:	49 83 c5 05          	add    $0x5,%r13
   277b2:	e8 49 3c 01 00       	call   3b400 <__JS_AtomToValue>
   277b7:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   277bb:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   277bf:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   277c4:	49 89 c2             	mov    %rax,%r10
   277c7:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   277cb:	ff e0                	jmp    *%rax
   277cd:	f3 0f 1e fa          	endbr64
   277d1:	ba 01 00 00 00       	mov    $0x1,%edx
   277d6:	4c 89 e7             	mov    %r12,%rdi
   277d9:	48 83 c3 10          	add    $0x10,%rbx
   277dd:	49 83 c5 01          	add    $0x1,%r13
   277e1:	be 2f 00 00 00       	mov    $0x2f,%esi
   277e6:	e8 15 3c 01 00       	call   3b400 <__JS_AtomToValue>
   277eb:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   277ef:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   277f3:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   277f8:	49 89 c2             	mov    %rax,%r10
   277fb:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   277ff:	ff e0                	jmp    *%rax
   27801:	f3 0f 1e fa          	endbr64
   27805:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   2780c:	49 83 c5 01          	add    $0x1,%r13
   27810:	48 83 c3 10          	add    $0x10,%rbx
   27814:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   2781b:	00 
   2781c:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   27821:	49 89 c2             	mov    %rax,%r10
   27824:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27828:	ff e0                	jmp    *%rax
   2782a:	f3 0f 1e fa          	endbr64
   2782e:	48 8b 85 c0 fe ff ff 	mov    -0x140(%rbp),%rax
   27835:	f6 40 10 01          	testb  $0x1,0x10(%rax)
   27839:	75 0d                	jne    27848 <JS_CallInternal+0x2838>
   2783b:	83 bd 70 fe ff ff ff 	cmpl   $0xffffffff,-0x190(%rbp)
   27842:	0f 85 56 71 00 00    	jne    2e99e <JS_CallInternal+0x998e>
   27848:	83 bd 70 fe ff ff f6 	cmpl   $0xfffffff6,-0x190(%rbp)
   2784f:	76 0b                	jbe    2785c <JS_CallInternal+0x284c>
   27851:	48 8b 85 50 fe ff ff 	mov    -0x1b0(%rbp),%rax
   27858:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2785c:	48 8b 85 70 fe ff ff 	mov    -0x190(%rbp),%rax
   27863:	48 8b 95 50 fe ff ff 	mov    -0x1b0(%rbp),%rdx
   2786a:	48 89 13             	mov    %rdx,(%rbx)
   2786d:	49 83 c5 01          	add    $0x1,%r13
   27871:	48 83 c3 10          	add    $0x10,%rbx
   27875:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   27879:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2787e:	49 89 c2             	mov    %rax,%r10
   27881:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27885:	ff e0                	jmp    *%rax
   27887:	f3 0f 1e fa          	endbr64
   2788b:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   27892:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   27896:	48 8b 40 10          	mov    0x10(%rax),%rax
   2789a:	48 8b 40 18          	mov    0x18(%rax),%rax
   2789e:	48 8b 10             	mov    (%rax),%rdx
   278a1:	48 8b 40 08          	mov    0x8(%rax),%rax
   278a5:	83 f8 f6             	cmp    $0xfffffff6,%eax
   278a8:	76 04                	jbe    278ae <JS_CallInternal+0x289e>
   278aa:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   278ae:	48 89 13             	mov    %rdx,(%rbx)
   278b1:	49 83 c5 01          	add    $0x1,%r13
   278b5:	48 89 43 08          	mov    %rax,0x8(%rbx)
   278b9:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   278be:	48 89 cb             	mov    %rcx,%rbx
   278c1:	49 89 c2             	mov    %rax,%r10
   278c4:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   278c8:	ff e0                	jmp    *%rax
   278ca:	f3 0f 1e fa          	endbr64
   278ce:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   278d5:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   278d9:	48 8b 40 08          	mov    0x8(%rax),%rax
   278dd:	48 8b 40 18          	mov    0x18(%rax),%rax
   278e1:	48 8b 10             	mov    (%rax),%rdx
   278e4:	48 8b 40 08          	mov    0x8(%rax),%rax
   278e8:	83 f8 f6             	cmp    $0xfffffff6,%eax
   278eb:	76 04                	jbe    278f1 <JS_CallInternal+0x28e1>
   278ed:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   278f1:	48 89 13             	mov    %rdx,(%rbx)
   278f4:	49 83 c5 01          	add    $0x1,%r13
   278f8:	48 89 43 08          	mov    %rax,0x8(%rbx)
   278fc:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   27901:	48 89 cb             	mov    %rcx,%rbx
   27904:	49 89 c2             	mov    %rax,%r10
   27907:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2790b:	ff e0                	jmp    *%rax
   2790d:	f3 0f 1e fa          	endbr64
   27911:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   27918:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   2791c:	48 8b 00             	mov    (%rax),%rax
   2791f:	48 8b 40 18          	mov    0x18(%rax),%rax
   27923:	48 8b 10             	mov    (%rax),%rdx
   27926:	48 8b 40 08          	mov    0x8(%rax),%rax
   2792a:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2792d:	76 04                	jbe    27933 <JS_CallInternal+0x2923>
   2792f:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27933:	48 89 13             	mov    %rdx,(%rbx)
   27936:	49 83 c5 01          	add    $0x1,%r13
   2793a:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2793e:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   27943:	48 89 cb             	mov    %rcx,%rbx
   27946:	49 89 c2             	mov    %rax,%r10
   27949:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2794d:	ff e0                	jmp    *%rax
   2794f:	f3 0f 1e fa          	endbr64
   27953:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   27957:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2795b:	83 fa f6             	cmp    $0xfffffff6,%edx
   2795e:	76 04                	jbe    27964 <JS_CallInternal+0x2954>
   27960:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   27964:	48 8b bd 80 fe ff ff 	mov    -0x180(%rbp),%rdi
   2796b:	48 8b 47 38          	mov    0x38(%rdi),%rax
   2796f:	48 8b 77 30          	mov    0x30(%rdi),%rsi
   27973:	48 89 57 38          	mov    %rdx,0x38(%rdi)
   27977:	48 89 4f 30          	mov    %rcx,0x30(%rdi)
   2797b:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2797e:	76 11                	jbe    27991 <JS_CallInternal+0x2981>
   27980:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   27983:	8d 51 ff             	lea    -0x1(%rcx),%edx
   27986:	89 56 fc             	mov    %edx,-0x4(%rsi)
   27989:	85 d2                	test   %edx,%edx
   2798b:	0f 8e 52 56 00 00    	jle    2cfe3 <JS_CallInternal+0x7fd3>
   27991:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   27996:	49 83 c5 01          	add    $0x1,%r13
   2799a:	49 89 c2             	mov    %rax,%r10
   2799d:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   279a1:	ff e0                	jmp    *%rax
   279a3:	f3 0f 1e fa          	endbr64
   279a7:	48 8b 95 80 fe ff ff 	mov    -0x180(%rbp),%rdx
   279ae:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   279b3:	48 83 eb 10          	sub    $0x10,%rbx
   279b7:	48 8b 42 28          	mov    0x28(%rdx),%rax
   279bb:	48 8b 4a 20          	mov    0x20(%rdx),%rcx
   279bf:	0f 11 42 20          	movups %xmm0,0x20(%rdx)
   279c3:	83 f8 f6             	cmp    $0xfffffff6,%eax
   279c6:	76 11                	jbe    279d9 <JS_CallInternal+0x29c9>
   279c8:	8b 71 fc             	mov    -0x4(%rcx),%esi
   279cb:	8d 56 ff             	lea    -0x1(%rsi),%edx
   279ce:	89 51 fc             	mov    %edx,-0x4(%rcx)
   279d1:	85 d2                	test   %edx,%edx
   279d3:	0f 8e 1c 56 00 00    	jle    2cff5 <JS_CallInternal+0x7fe5>
   279d9:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   279de:	49 83 c5 01          	add    $0x1,%r13
   279e2:	49 89 c2             	mov    %rax,%r10
   279e5:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   279e9:	ff e0                	jmp    *%rax
   279eb:	f3 0f 1e fa          	endbr64
   279ef:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   279f3:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   279f7:	83 fa f6             	cmp    $0xfffffff6,%edx
   279fa:	76 04                	jbe    27a00 <JS_CallInternal+0x29f0>
   279fc:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   27a00:	48 8b bd 80 fe ff ff 	mov    -0x180(%rbp),%rdi
   27a07:	48 8b 47 28          	mov    0x28(%rdi),%rax
   27a0b:	48 8b 77 20          	mov    0x20(%rdi),%rsi
   27a0f:	48 89 57 28          	mov    %rdx,0x28(%rdi)
   27a13:	48 89 4f 20          	mov    %rcx,0x20(%rdi)
   27a17:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27a1a:	76 11                	jbe    27a2d <JS_CallInternal+0x2a1d>
   27a1c:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   27a1f:	8d 51 ff             	lea    -0x1(%rcx),%edx
   27a22:	89 56 fc             	mov    %edx,-0x4(%rsi)
   27a25:	85 d2                	test   %edx,%edx
   27a27:	0f 8e 6b 55 00 00    	jle    2cf98 <JS_CallInternal+0x7f88>
   27a2d:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   27a32:	49 83 c5 01          	add    $0x1,%r13
   27a36:	49 89 c2             	mov    %rax,%r10
   27a39:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27a3d:	ff e0                	jmp    *%rax
   27a3f:	f3 0f 1e fa          	endbr64
   27a43:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   27a4a:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   27a4e:	48 8b 50 20          	mov    0x20(%rax),%rdx
   27a52:	48 8b 40 28          	mov    0x28(%rax),%rax
   27a56:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27a59:	76 04                	jbe    27a5f <JS_CallInternal+0x2a4f>
   27a5b:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27a5f:	48 89 13             	mov    %rdx,(%rbx)
   27a62:	49 83 c5 01          	add    $0x1,%r13
   27a66:	48 89 43 08          	mov    %rax,0x8(%rbx)
   27a6a:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   27a6f:	48 89 cb             	mov    %rcx,%rbx
   27a72:	49 89 c2             	mov    %rax,%r10
   27a75:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27a79:	ff e0                	jmp    *%rax
   27a7b:	f3 0f 1e fa          	endbr64
   27a7f:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   27a86:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   27a8a:	48 8b 50 10          	mov    0x10(%rax),%rdx
   27a8e:	48 8b 40 18          	mov    0x18(%rax),%rax
   27a92:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27a95:	76 04                	jbe    27a9b <JS_CallInternal+0x2a8b>
   27a97:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27a9b:	48 89 13             	mov    %rdx,(%rbx)
   27a9e:	49 83 c5 01          	add    $0x1,%r13
   27aa2:	48 89 43 08          	mov    %rax,0x8(%rbx)
   27aa6:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   27aab:	48 89 cb             	mov    %rcx,%rbx
   27aae:	49 89 c2             	mov    %rax,%r10
   27ab1:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27ab5:	ff e0                	jmp    *%rax
   27ab7:	f3 0f 1e fa          	endbr64
   27abb:	48 8b 8d 80 fe ff ff 	mov    -0x180(%rbp),%rcx
   27ac2:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   27ac6:	48 8b 01             	mov    (%rcx),%rax
   27ac9:	83 fa ff             	cmp    $0xffffffff,%edx
   27acc:	0f 84 f3 46 00 00    	je     2c1c5 <JS_CallInternal+0x71b5>
   27ad2:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   27ad6:	83 fa f6             	cmp    $0xfffffff6,%edx
   27ad9:	76 04                	jbe    27adf <JS_CallInternal+0x2acf>
   27adb:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   27adf:	48 89 03             	mov    %rax,(%rbx)
   27ae2:	4c 89 e8             	mov    %r13,%rax
   27ae5:	4d 8d 6d 01          	lea    0x1(%r13),%r13
   27ae9:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   27aed:	0f b6 00             	movzbl (%rax),%eax
   27af0:	48 89 cb             	mov    %rcx,%rbx
   27af3:	49 89 c2             	mov    %rax,%r10
   27af6:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   27afa:	f3 0f 1e fa          	endbr64
   27afe:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   27b05:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   27b09:	48 8b 10             	mov    (%rax),%rdx
   27b0c:	48 8b 40 08          	mov    0x8(%rax),%rax
   27b10:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27b13:	76 04                	jbe    27b19 <JS_CallInternal+0x2b09>
   27b15:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27b19:	48 89 13             	mov    %rdx,(%rbx)
   27b1c:	49 83 c5 01          	add    $0x1,%r13
   27b20:	48 89 43 08          	mov    %rax,0x8(%rbx)
   27b24:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   27b29:	48 89 cb             	mov    %rcx,%rbx
   27b2c:	49 89 c2             	mov    %rax,%r10
   27b2f:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27b33:	ff e0                	jmp    *%rax
   27b35:	f3 0f 1e fa          	endbr64
   27b39:	48 8b 95 80 fe ff ff 	mov    -0x180(%rbp),%rdx
   27b40:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   27b45:	48 83 eb 10          	sub    $0x10,%rbx
   27b49:	48 8b 42 08          	mov    0x8(%rdx),%rax
   27b4d:	48 8b 0a             	mov    (%rdx),%rcx
   27b50:	0f 11 02             	movups %xmm0,(%rdx)
   27b53:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27b56:	76 11                	jbe    27b69 <JS_CallInternal+0x2b59>
   27b58:	8b 71 fc             	mov    -0x4(%rcx),%esi
   27b5b:	8d 56 ff             	lea    -0x1(%rsi),%edx
   27b5e:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27b61:	85 d2                	test   %edx,%edx
   27b63:	0f 8e b6 54 00 00    	jle    2d01f <JS_CallInternal+0x800f>
   27b69:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   27b6e:	49 83 c5 01          	add    $0x1,%r13
   27b72:	49 89 c2             	mov    %rax,%r10
   27b75:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27b79:	ff e0                	jmp    *%rax
   27b7b:	f3 0f 1e fa          	endbr64
   27b7f:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   27b86:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   27b8a:	48 8b 50 30          	mov    0x30(%rax),%rdx
   27b8e:	48 8b 40 38          	mov    0x38(%rax),%rax
   27b92:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27b95:	76 04                	jbe    27b9b <JS_CallInternal+0x2b8b>
   27b97:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27b9b:	48 89 13             	mov    %rdx,(%rbx)
   27b9e:	49 83 c5 01          	add    $0x1,%r13
   27ba2:	48 89 43 08          	mov    %rax,0x8(%rbx)
   27ba6:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   27bab:	48 89 cb             	mov    %rcx,%rbx
   27bae:	49 89 c2             	mov    %rax,%r10
   27bb1:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27bb5:	ff e0                	jmp    *%rax
   27bb7:	f3 0f 1e fa          	endbr64
   27bbb:	48 8b 95 80 fe ff ff 	mov    -0x180(%rbp),%rdx
   27bc2:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   27bc7:	48 83 eb 10          	sub    $0x10,%rbx
   27bcb:	48 8b 42 18          	mov    0x18(%rdx),%rax
   27bcf:	48 8b 4a 10          	mov    0x10(%rdx),%rcx
   27bd3:	0f 11 42 10          	movups %xmm0,0x10(%rdx)
   27bd7:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27bda:	76 11                	jbe    27bed <JS_CallInternal+0x2bdd>
   27bdc:	8b 51 fc             	mov    -0x4(%rcx),%edx
   27bdf:	83 ea 01             	sub    $0x1,%edx
   27be2:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27be5:	85 d2                	test   %edx,%edx
   27be7:	0f 8e 1d 54 00 00    	jle    2d00a <JS_CallInternal+0x7ffa>
   27bed:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   27bf2:	49 83 c5 01          	add    $0x1,%r13
   27bf6:	49 89 c2             	mov    %rax,%r10
   27bf9:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27bfd:	ff e0                	jmp    *%rax
   27bff:	f3 0f 1e fa          	endbr64
   27c03:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   27c07:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   27c0b:	83 fa f6             	cmp    $0xfffffff6,%edx
   27c0e:	76 04                	jbe    27c14 <JS_CallInternal+0x2c04>
   27c10:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   27c14:	48 8b bd 80 fe ff ff 	mov    -0x180(%rbp),%rdi
   27c1b:	48 8b 47 08          	mov    0x8(%rdi),%rax
   27c1f:	48 8b 37             	mov    (%rdi),%rsi
   27c22:	48 89 57 08          	mov    %rdx,0x8(%rdi)
   27c26:	48 89 0f             	mov    %rcx,(%rdi)
   27c29:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27c2c:	76 11                	jbe    27c3f <JS_CallInternal+0x2c2f>
   27c2e:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   27c31:	8d 51 ff             	lea    -0x1(%rcx),%edx
   27c34:	89 56 fc             	mov    %edx,-0x4(%rsi)
   27c37:	85 d2                	test   %edx,%edx
   27c39:	0f 8e 7d 53 00 00    	jle    2cfbc <JS_CallInternal+0x7fac>
   27c3f:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   27c44:	49 83 c5 01          	add    $0x1,%r13
   27c48:	49 89 c2             	mov    %rax,%r10
   27c4b:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27c4f:	ff e0                	jmp    *%rax
   27c51:	f3 0f 1e fa          	endbr64
   27c55:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   27c59:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   27c5d:	83 fa f6             	cmp    $0xfffffff6,%edx
   27c60:	76 04                	jbe    27c66 <JS_CallInternal+0x2c56>
   27c62:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   27c66:	48 8b bd 80 fe ff ff 	mov    -0x180(%rbp),%rdi
   27c6d:	48 8b 47 18          	mov    0x18(%rdi),%rax
   27c71:	48 8b 77 10          	mov    0x10(%rdi),%rsi
   27c75:	48 89 57 18          	mov    %rdx,0x18(%rdi)
   27c79:	48 89 4f 10          	mov    %rcx,0x10(%rdi)
   27c7d:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27c80:	76 11                	jbe    27c93 <JS_CallInternal+0x2c83>
   27c82:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   27c85:	8d 51 ff             	lea    -0x1(%rcx),%edx
   27c88:	89 56 fc             	mov    %edx,-0x4(%rsi)
   27c8b:	85 d2                	test   %edx,%edx
   27c8d:	0f 8e 17 53 00 00    	jle    2cfaa <JS_CallInternal+0x7f9a>
   27c93:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   27c98:	49 83 c5 01          	add    $0x1,%r13
   27c9c:	49 89 c2             	mov    %rax,%r10
   27c9f:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27ca3:	ff e0                	jmp    *%rax
   27ca5:	f3 0f 1e fa          	endbr64
   27ca9:	48 8b b5 80 fe ff ff 	mov    -0x180(%rbp),%rsi
   27cb0:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   27cb5:	48 83 eb 10          	sub    $0x10,%rbx
   27cb9:	48 8b 46 38          	mov    0x38(%rsi),%rax
   27cbd:	48 8b 4e 30          	mov    0x30(%rsi),%rcx
   27cc1:	0f 11 46 30          	movups %xmm0,0x30(%rsi)
   27cc5:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27cc8:	76 11                	jbe    27cdb <JS_CallInternal+0x2ccb>
   27cca:	8b 51 fc             	mov    -0x4(%rcx),%edx
   27ccd:	83 ea 01             	sub    $0x1,%edx
   27cd0:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27cd3:	85 d2                	test   %edx,%edx
   27cd5:	0f 8e f3 52 00 00    	jle    2cfce <JS_CallInternal+0x7fbe>
   27cdb:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   27ce0:	49 83 c5 01          	add    $0x1,%r13
   27ce4:	49 89 c2             	mov    %rax,%r10
   27ce7:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27ceb:	ff e0                	jmp    *%rax
   27ced:	f3 0f 1e fa          	endbr64
   27cf1:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   27cf5:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   27cf9:	83 fa f6             	cmp    $0xfffffff6,%edx
   27cfc:	76 04                	jbe    27d02 <JS_CallInternal+0x2cf2>
   27cfe:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   27d02:	48 8b bd a0 fe ff ff 	mov    -0x160(%rbp),%rdi
   27d09:	48 8b 47 38          	mov    0x38(%rdi),%rax
   27d0d:	48 8b 77 30          	mov    0x30(%rdi),%rsi
   27d11:	48 89 57 38          	mov    %rdx,0x38(%rdi)
   27d15:	48 89 4f 30          	mov    %rcx,0x30(%rdi)
   27d19:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27d1c:	76 11                	jbe    27d2f <JS_CallInternal+0x2d1f>
   27d1e:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   27d21:	8d 51 ff             	lea    -0x1(%rcx),%edx
   27d24:	89 56 fc             	mov    %edx,-0x4(%rsi)
   27d27:	85 d2                	test   %edx,%edx
   27d29:	0f 8e 21 52 00 00    	jle    2cf50 <JS_CallInternal+0x7f40>
   27d2f:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   27d34:	49 83 c5 01          	add    $0x1,%r13
   27d38:	49 89 c2             	mov    %rax,%r10
   27d3b:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27d3f:	ff e0                	jmp    *%rax
   27d41:	f3 0f 1e fa          	endbr64
   27d45:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   27d49:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   27d4d:	83 fa f6             	cmp    $0xfffffff6,%edx
   27d50:	76 04                	jbe    27d56 <JS_CallInternal+0x2d46>
   27d52:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   27d56:	48 8b bd a0 fe ff ff 	mov    -0x160(%rbp),%rdi
   27d5d:	48 8b 47 18          	mov    0x18(%rdi),%rax
   27d61:	48 8b 77 10          	mov    0x10(%rdi),%rsi
   27d65:	48 89 57 18          	mov    %rdx,0x18(%rdi)
   27d69:	48 89 4f 10          	mov    %rcx,0x10(%rdi)
   27d6d:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27d70:	76 11                	jbe    27d83 <JS_CallInternal+0x2d73>
   27d72:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   27d75:	8d 51 ff             	lea    -0x1(%rcx),%edx
   27d78:	89 56 fc             	mov    %edx,-0x4(%rsi)
   27d7b:	85 d2                	test   %edx,%edx
   27d7d:	0f 8e f1 51 00 00    	jle    2cf74 <JS_CallInternal+0x7f64>
   27d83:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   27d88:	49 83 c5 01          	add    $0x1,%r13
   27d8c:	49 89 c2             	mov    %rax,%r10
   27d8f:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27d93:	ff e0                	jmp    *%rax
   27d95:	f3 0f 1e fa          	endbr64
   27d99:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   27d9d:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   27da1:	83 fa f6             	cmp    $0xfffffff6,%edx
   27da4:	76 04                	jbe    27daa <JS_CallInternal+0x2d9a>
   27da6:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   27daa:	48 8b bd a0 fe ff ff 	mov    -0x160(%rbp),%rdi
   27db1:	48 8b 47 28          	mov    0x28(%rdi),%rax
   27db5:	48 8b 77 20          	mov    0x20(%rdi),%rsi
   27db9:	48 89 57 28          	mov    %rdx,0x28(%rdi)
   27dbd:	48 89 4f 20          	mov    %rcx,0x20(%rdi)
   27dc1:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27dc4:	76 11                	jbe    27dd7 <JS_CallInternal+0x2dc7>
   27dc6:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   27dc9:	8d 51 ff             	lea    -0x1(%rcx),%edx
   27dcc:	89 56 fc             	mov    %edx,-0x4(%rsi)
   27dcf:	85 d2                	test   %edx,%edx
   27dd1:	0f 8e 8b 51 00 00    	jle    2cf62 <JS_CallInternal+0x7f52>
   27dd7:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   27ddc:	49 83 c5 01          	add    $0x1,%r13
   27de0:	49 89 c2             	mov    %rax,%r10
   27de3:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27de7:	ff e0                	jmp    *%rax
   27de9:	f3 0f 1e fa          	endbr64
   27ded:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   27df1:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   27df5:	83 fa f6             	cmp    $0xfffffff6,%edx
   27df8:	76 04                	jbe    27dfe <JS_CallInternal+0x2dee>
   27dfa:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   27dfe:	48 8b bd a0 fe ff ff 	mov    -0x160(%rbp),%rdi
   27e05:	48 8b 47 08          	mov    0x8(%rdi),%rax
   27e09:	48 8b 37             	mov    (%rdi),%rsi
   27e0c:	48 89 57 08          	mov    %rdx,0x8(%rdi)
   27e10:	48 89 0f             	mov    %rcx,(%rdi)
   27e13:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27e16:	76 11                	jbe    27e29 <JS_CallInternal+0x2e19>
   27e18:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   27e1b:	8d 51 ff             	lea    -0x1(%rcx),%edx
   27e1e:	89 56 fc             	mov    %edx,-0x4(%rsi)
   27e21:	85 d2                	test   %edx,%edx
   27e23:	0f 8e 5d 51 00 00    	jle    2cf86 <JS_CallInternal+0x7f76>
   27e29:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   27e2e:	49 83 c5 01          	add    $0x1,%r13
   27e32:	49 89 c2             	mov    %rax,%r10
   27e35:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27e39:	ff e0                	jmp    *%rax
   27e3b:	f3 0f 1e fa          	endbr64
   27e3f:	48 8b 95 a0 fe ff ff 	mov    -0x160(%rbp),%rdx
   27e46:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   27e4b:	48 83 eb 10          	sub    $0x10,%rbx
   27e4f:	48 8b 42 38          	mov    0x38(%rdx),%rax
   27e53:	48 8b 4a 30          	mov    0x30(%rdx),%rcx
   27e57:	0f 11 42 30          	movups %xmm0,0x30(%rdx)
   27e5b:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27e5e:	76 11                	jbe    27e71 <JS_CallInternal+0x2e61>
   27e60:	8b 51 fc             	mov    -0x4(%rcx),%edx
   27e63:	83 ea 01             	sub    $0x1,%edx
   27e66:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27e69:	85 d2                	test   %edx,%edx
   27e6b:	0f 8e c5 54 00 00    	jle    2d336 <JS_CallInternal+0x8326>
   27e71:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   27e76:	49 83 c5 01          	add    $0x1,%r13
   27e7a:	49 89 c2             	mov    %rax,%r10
   27e7d:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27e81:	ff e0                	jmp    *%rax
   27e83:	f3 0f 1e fa          	endbr64
   27e87:	48 8b 95 a0 fe ff ff 	mov    -0x160(%rbp),%rdx
   27e8e:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   27e93:	48 83 eb 10          	sub    $0x10,%rbx
   27e97:	48 8b 42 18          	mov    0x18(%rdx),%rax
   27e9b:	48 8b 4a 10          	mov    0x10(%rdx),%rcx
   27e9f:	0f 11 42 10          	movups %xmm0,0x10(%rdx)
   27ea3:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27ea6:	76 11                	jbe    27eb9 <JS_CallInternal+0x2ea9>
   27ea8:	8b 51 fc             	mov    -0x4(%rcx),%edx
   27eab:	83 ea 01             	sub    $0x1,%edx
   27eae:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27eb1:	85 d2                	test   %edx,%edx
   27eb3:	0f 8e e0 55 00 00    	jle    2d499 <JS_CallInternal+0x8489>
   27eb9:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   27ebe:	49 83 c5 01          	add    $0x1,%r13
   27ec2:	49 89 c2             	mov    %rax,%r10
   27ec5:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27ec9:	ff e0                	jmp    *%rax
   27ecb:	f3 0f 1e fa          	endbr64
   27ecf:	48 8b 95 a0 fe ff ff 	mov    -0x160(%rbp),%rdx
   27ed6:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   27edb:	48 83 eb 10          	sub    $0x10,%rbx
   27edf:	48 8b 42 28          	mov    0x28(%rdx),%rax
   27ee3:	48 8b 4a 20          	mov    0x20(%rdx),%rcx
   27ee7:	0f 11 42 20          	movups %xmm0,0x20(%rdx)
   27eeb:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27eee:	76 11                	jbe    27f01 <JS_CallInternal+0x2ef1>
   27ef0:	8b 71 fc             	mov    -0x4(%rcx),%esi
   27ef3:	8d 56 ff             	lea    -0x1(%rsi),%edx
   27ef6:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27ef9:	85 d2                	test   %edx,%edx
   27efb:	0f 8e c2 55 00 00    	jle    2d4c3 <JS_CallInternal+0x84b3>
   27f01:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   27f06:	49 83 c5 01          	add    $0x1,%r13
   27f0a:	49 89 c2             	mov    %rax,%r10
   27f0d:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27f11:	ff e0                	jmp    *%rax
   27f13:	f3 0f 1e fa          	endbr64
   27f17:	48 8b 95 a0 fe ff ff 	mov    -0x160(%rbp),%rdx
   27f1e:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   27f23:	48 83 eb 10          	sub    $0x10,%rbx
   27f27:	48 8b 42 08          	mov    0x8(%rdx),%rax
   27f2b:	48 8b 0a             	mov    (%rdx),%rcx
   27f2e:	0f 11 02             	movups %xmm0,(%rdx)
   27f31:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27f34:	76 11                	jbe    27f47 <JS_CallInternal+0x2f37>
   27f36:	8b 71 fc             	mov    -0x4(%rcx),%esi
   27f39:	8d 56 ff             	lea    -0x1(%rsi),%edx
   27f3c:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27f3f:	85 d2                	test   %edx,%edx
   27f41:	0f 8e 67 55 00 00    	jle    2d4ae <JS_CallInternal+0x849e>
   27f47:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   27f4c:	49 83 c5 01          	add    $0x1,%r13
   27f50:	49 89 c2             	mov    %rax,%r10
   27f53:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27f57:	ff e0                	jmp    *%rax
   27f59:	f3 0f 1e fa          	endbr64
   27f5d:	48 8b 85 a0 fe ff ff 	mov    -0x160(%rbp),%rax
   27f64:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   27f68:	48 8b 50 30          	mov    0x30(%rax),%rdx
   27f6c:	48 8b 40 38          	mov    0x38(%rax),%rax
   27f70:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27f73:	76 04                	jbe    27f79 <JS_CallInternal+0x2f69>
   27f75:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27f79:	48 89 13             	mov    %rdx,(%rbx)
   27f7c:	49 83 c5 01          	add    $0x1,%r13
   27f80:	48 89 43 08          	mov    %rax,0x8(%rbx)
   27f84:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   27f89:	48 89 cb             	mov    %rcx,%rbx
   27f8c:	49 89 c2             	mov    %rax,%r10
   27f8f:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27f93:	ff e0                	jmp    *%rax
   27f95:	f3 0f 1e fa          	endbr64
   27f99:	48 8b 85 a0 fe ff ff 	mov    -0x160(%rbp),%rax
   27fa0:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   27fa4:	48 8b 50 20          	mov    0x20(%rax),%rdx
   27fa8:	48 8b 40 28          	mov    0x28(%rax),%rax
   27fac:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27faf:	76 04                	jbe    27fb5 <JS_CallInternal+0x2fa5>
   27fb1:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27fb5:	48 89 13             	mov    %rdx,(%rbx)
   27fb8:	49 83 c5 01          	add    $0x1,%r13
   27fbc:	48 89 43 08          	mov    %rax,0x8(%rbx)
   27fc0:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   27fc5:	48 89 cb             	mov    %rcx,%rbx
   27fc8:	49 89 c2             	mov    %rax,%r10
   27fcb:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27fcf:	ff e0                	jmp    *%rax
   27fd1:	f3 0f 1e fa          	endbr64
   27fd5:	48 8b 85 a0 fe ff ff 	mov    -0x160(%rbp),%rax
   27fdc:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   27fe0:	48 8b 50 10          	mov    0x10(%rax),%rdx
   27fe4:	48 8b 40 18          	mov    0x18(%rax),%rax
   27fe8:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27feb:	76 04                	jbe    27ff1 <JS_CallInternal+0x2fe1>
   27fed:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27ff1:	48 89 13             	mov    %rdx,(%rbx)
   27ff4:	49 83 c5 01          	add    $0x1,%r13
   27ff8:	48 89 43 08          	mov    %rax,0x8(%rbx)
   27ffc:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   28001:	48 89 cb             	mov    %rcx,%rbx
   28004:	49 89 c2             	mov    %rax,%r10
   28007:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2800b:	ff e0                	jmp    *%rax
   2800d:	f3 0f 1e fa          	endbr64
   28011:	48 8b 8d a0 fe ff ff 	mov    -0x160(%rbp),%rcx
   28018:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   2801c:	48 8b 01             	mov    (%rcx),%rax
   2801f:	83 fa ff             	cmp    $0xffffffff,%edx
   28022:	0f 84 e0 3f 00 00    	je     2c008 <JS_CallInternal+0x6ff8>
   28028:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   2802c:	83 fa f6             	cmp    $0xfffffff6,%edx
   2802f:	76 04                	jbe    28035 <JS_CallInternal+0x3025>
   28031:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   28035:	48 89 03             	mov    %rax,(%rbx)
   28038:	4c 89 e8             	mov    %r13,%rax
   2803b:	4d 8d 6d 01          	lea    0x1(%r13),%r13
   2803f:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   28043:	0f b6 00             	movzbl (%rax),%eax
   28046:	48 89 cb             	mov    %rcx,%rbx
   28049:	49 89 c2             	mov    %rax,%r10
   2804c:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   28050:	f3 0f 1e fa          	endbr64
   28054:	48 8b 85 a0 fe ff ff 	mov    -0x160(%rbp),%rax
   2805b:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   2805f:	48 8b 10             	mov    (%rax),%rdx
   28062:	48 8b 40 08          	mov    0x8(%rax),%rax
   28066:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28069:	76 04                	jbe    2806f <JS_CallInternal+0x305f>
   2806b:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2806f:	48 89 13             	mov    %rdx,(%rbx)
   28072:	49 83 c5 01          	add    $0x1,%r13
   28076:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2807a:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2807f:	48 89 cb             	mov    %rcx,%rbx
   28082:	49 89 c2             	mov    %rax,%r10
   28085:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28089:	ff e0                	jmp    *%rax
   2808b:	f3 0f 1e fa          	endbr64
   2808f:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   28093:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   28097:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   2809a:	76 04                	jbe    280a0 <JS_CallInternal+0x3090>
   2809c:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   280a0:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   280a5:	48 c1 e0 04          	shl    $0x4,%rax
   280a9:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   280b0:	48 8b 50 08          	mov    0x8(%rax),%rdx
   280b4:	48 8b 38             	mov    (%rax),%rdi
   280b7:	48 89 48 08          	mov    %rcx,0x8(%rax)
   280bb:	48 89 30             	mov    %rsi,(%rax)
   280be:	83 fa f6             	cmp    $0xfffffff6,%edx
   280c1:	76 11                	jbe    280d4 <JS_CallInternal+0x30c4>
   280c3:	8b 47 fc             	mov    -0x4(%rdi),%eax
   280c6:	83 e8 01             	sub    $0x1,%eax
   280c9:	89 47 fc             	mov    %eax,-0x4(%rdi)
   280cc:	85 c0                	test   %eax,%eax
   280ce:	0f 8e dd 51 00 00    	jle    2d2b1 <JS_CallInternal+0x82a1>
   280d4:	41 0f b6 45 01       	movzbl 0x1(%r13),%eax
   280d9:	49 83 c5 02          	add    $0x2,%r13
   280dd:	49 89 c2             	mov    %rax,%r10
   280e0:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   280e4:	ff e0                	jmp    *%rax
   280e6:	f3 0f 1e fa          	endbr64
   280ea:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   280ef:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   280f4:	48 83 eb 10          	sub    $0x10,%rbx
   280f8:	48 c1 e0 04          	shl    $0x4,%rax
   280fc:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   28103:	48 8b 50 08          	mov    0x8(%rax),%rdx
   28107:	48 8b 08             	mov    (%rax),%rcx
   2810a:	0f 11 00             	movups %xmm0,(%rax)
   2810d:	83 fa f6             	cmp    $0xfffffff6,%edx
   28110:	76 11                	jbe    28123 <JS_CallInternal+0x3113>
   28112:	8b 41 fc             	mov    -0x4(%rcx),%eax
   28115:	83 e8 01             	sub    $0x1,%eax
   28118:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2811b:	85 c0                	test   %eax,%eax
   2811d:	0f 8e 7c 51 00 00    	jle    2d29f <JS_CallInternal+0x828f>
   28123:	41 0f b6 45 01       	movzbl 0x1(%r13),%eax
   28128:	49 83 c5 02          	add    $0x2,%r13
   2812c:	49 89 c2             	mov    %rax,%r10
   2812f:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28133:	ff e0                	jmp    *%rax
   28135:	f3 0f 1e fa          	endbr64
   28139:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2813e:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   28142:	48 c1 e0 04          	shl    $0x4,%rax
   28146:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   2814d:	48 8b 10             	mov    (%rax),%rdx
   28150:	48 8b 40 08          	mov    0x8(%rax),%rax
   28154:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28157:	76 04                	jbe    2815d <JS_CallInternal+0x314d>
   28159:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2815d:	48 89 13             	mov    %rdx,(%rbx)
   28160:	49 83 c5 02          	add    $0x2,%r13
   28164:	48 89 43 08          	mov    %rax,0x8(%rbx)
   28168:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2816d:	48 89 cb             	mov    %rcx,%rbx
   28170:	49 89 c2             	mov    %rax,%r10
   28173:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28177:	ff e0                	jmp    *%rax
   28179:	f3 0f 1e fa          	endbr64
   2817d:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   28181:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   28185:	4c 89 e7             	mov    %r12,%rdi
   28188:	4c 8d 7b f0          	lea    -0x10(%rbx),%r15
   2818c:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   28193:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   28197:	4d 8b 47 08          	mov    0x8(%r15),%r8
   2819b:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2819f:	e8 3c b4 08 00       	call   b35e0 <js_dynamic_import>
   281a4:	48 89 c1             	mov    %rax,%rcx
   281a7:	48 89 d0             	mov    %rdx,%rax
   281aa:	83 fa 06             	cmp    $0x6,%edx
   281ad:	0f 84 8e 53 00 00    	je     2d541 <JS_CallInternal+0x8531>
   281b3:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   281b7:	83 fe f6             	cmp    $0xfffffff6,%esi
   281ba:	76 15                	jbe    281d1 <JS_CallInternal+0x31c1>
   281bc:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   281c0:	8b 5f fc             	mov    -0x4(%rdi),%ebx
   281c3:	8d 53 ff             	lea    -0x1(%rbx),%edx
   281c6:	89 57 fc             	mov    %edx,-0x4(%rdi)
   281c9:	85 d2                	test   %edx,%edx
   281cb:	0f 8e 77 52 00 00    	jle    2d448 <JS_CallInternal+0x8438>
   281d1:	49 8b 77 08          	mov    0x8(%r15),%rsi
   281d5:	83 fe f6             	cmp    $0xfffffff6,%esi
   281d8:	76 14                	jbe    281ee <JS_CallInternal+0x31de>
   281da:	49 8b 3f             	mov    (%r15),%rdi
   281dd:	8b 5f fc             	mov    -0x4(%rdi),%ebx
   281e0:	8d 53 ff             	lea    -0x1(%rbx),%edx
   281e3:	89 57 fc             	mov    %edx,-0x4(%rdi)
   281e6:	85 d2                	test   %edx,%edx
   281e8:	0f 8e 29 52 00 00    	jle    2d417 <JS_CallInternal+0x8407>
   281ee:	49 89 4f f0          	mov    %rcx,-0x10(%r15)
   281f2:	4c 89 fb             	mov    %r15,%rbx
   281f5:	49 83 c5 01          	add    $0x1,%r13
   281f9:	49 89 47 f8          	mov    %rax,-0x8(%r15)
   281fd:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   28202:	49 89 c2             	mov    %rax,%r10
   28205:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28209:	ff e0                	jmp    *%rax
   2820b:	f3 0f 1e fa          	endbr64
   2820f:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   28216:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2821a:	4c 89 e7             	mov    %r12,%rdi
   2821d:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   28221:	4c 89 68 30          	mov    %r13,0x30(%rax)
   28225:	e8 f6 c5 ff ff       	call   24820 <JS_GetPrototype>
   2822a:	48 89 c1             	mov    %rax,%rcx
   2822d:	49 89 d7             	mov    %rdx,%r15
   28230:	83 fa 06             	cmp    $0x6,%edx
   28233:	0f 84 11 5c 00 00    	je     2de4a <JS_CallInternal+0x8e3a>
   28239:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2823d:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28240:	76 15                	jbe    28257 <JS_CallInternal+0x3247>
   28242:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   28246:	8b 56 fc             	mov    -0x4(%rsi),%edx
   28249:	83 ea 01             	sub    $0x1,%edx
   2824c:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2824f:	85 d2                	test   %edx,%edx
   28251:	0f 8e 22 52 00 00    	jle    2d479 <JS_CallInternal+0x8469>
   28257:	48 89 4b f0          	mov    %rcx,-0x10(%rbx)
   2825b:	49 83 c5 01          	add    $0x1,%r13
   2825f:	4c 89 7b f8          	mov    %r15,-0x8(%rbx)
   28263:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   28268:	49 89 c2             	mov    %rax,%r10
   2826b:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2826f:	ff e0                	jmp    *%rax
   28271:	f3 0f 1e fa          	endbr64
   28275:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   28279:	4c 8d 43 f0          	lea    -0x10(%rbx),%r8
   2827d:	4c 8d 7b e0          	lea    -0x20(%rbx),%r15
   28281:	48 8b 5b f0          	mov    -0x10(%rbx),%rbx
   28285:	4c 89 85 f0 fd ff ff 	mov    %r8,-0x210(%rbp)
   2828c:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   28293:	49 8b 47 08          	mov    0x8(%r15),%rax
   28297:	48 89 9d 30 fe ff ff 	mov    %rbx,-0x1d0(%rbp)
   2829e:	49 8b 58 08          	mov    0x8(%r8),%rbx
   282a2:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   282a9:	83 fb f9             	cmp    $0xfffffff9,%ebx
   282ac:	0f 85 1f 45 00 00    	jne    2c7d1 <JS_CallInternal+0x77c1>
   282b2:	83 f8 f9             	cmp    $0xfffffff9,%eax
   282b5:	0f 85 16 45 00 00    	jne    2c7d1 <JS_CallInternal+0x77c1>
   282bb:	49 8b 74 24 48       	mov    0x48(%r12),%rsi
   282c0:	48 8d 8d 50 ff ff ff 	lea    -0xb0(%rbp),%rcx
   282c7:	ba 12 00 00 00       	mov    $0x12,%edx
   282cc:	4c 89 e7             	mov    %r12,%rdi
   282cf:	48 c7 85 50 ff ff ff 	movq   $0x0,-0xb0(%rbp)
   282d6:	00 00 00 00 
   282da:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   282de:	48 c7 85 58 ff ff ff 	movq   $0x0,-0xa8(%rbp)
   282e5:	00 00 00 00 
   282e9:	e8 52 1b 02 00       	call   49e40 <JS_NewObjectFromShape>
   282ee:	4c 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8
   282f5:	83 fa 06             	cmp    $0x6,%edx
   282f8:	0f 84 eb 44 00 00    	je     2c7e9 <JS_CallInternal+0x77d9>
   282fe:	f3 0f 7e 85 10 fe ff 	movq   -0x1f0(%rbp),%xmm0
   28305:	ff 
   28306:	0f 16 85 30 fe ff ff 	movhps -0x1d0(%rbp),%xmm0
   2830d:	0f 11 40 28          	movups %xmm0,0x28(%rax)
   28311:	49 89 07             	mov    %rax,(%r15)
   28314:	4c 89 c3             	mov    %r8,%rbx
   28317:	49 89 57 08          	mov    %rdx,0x8(%r15)
   2831b:	4d 89 ef             	mov    %r13,%r15
   2831e:	41 83 78 f8 06       	cmpl   $0x6,-0x8(%r8)
   28323:	0f 84 17 d4 ff ff    	je     25740 <JS_CallInternal+0x730>
   28329:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2832e:	49 83 c5 01          	add    $0x1,%r13
   28332:	49 89 c2             	mov    %rax,%r10
   28335:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28339:	ff e0                	jmp    *%rax
   2833b:	f3 0f 1e fa          	endbr64
   2833f:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
   28344:	4d 8d 7d 02          	lea    0x2(%r13),%r15
   28348:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2834c:	4c 89 e7             	mov    %r12,%rdi
   2834f:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   28353:	48 8d b5 dc fe ff ff 	lea    -0x124(%rbp),%rsi
   2835a:	66 89 85 10 fe ff ff 	mov    %ax,-0x1f0(%rbp)
   28361:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   28368:	4c 89 78 30          	mov    %r15,0x30(%rax)
   2836c:	48 8d 43 f0          	lea    -0x10(%rbx),%rax
   28370:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   28377:	e8 84 49 06 00       	call   8cd00 <build_arg_list>
   2837c:	49 89 c2             	mov    %rax,%r10
   2837f:	48 85 c0             	test   %rax,%rax
   28382:	0f 84 b8 d3 ff ff    	je     25740 <JS_CallInternal+0x730>
   28388:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   2838c:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   28390:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   28396:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   2839d:	49 8b 94 24 70 01 00 	mov    0x170(%r12),%rdx
   283a4:	00 
   283a5:	49 8b 8c 24 78 01 00 	mov    0x178(%r12),%rcx
   283ac:	00 
   283ad:	48 89 c6             	mov    %rax,%rsi
   283b0:	48 89 bd f0 fd ff ff 	mov    %rdi,-0x210(%rbp)
   283b7:	48 89 85 20 fe ff ff 	mov    %rax,-0x1e0(%rbp)
   283be:	e8 ed 39 ff ff       	call   1bdb0 <js_strict_eq2.isra.0>
   283c3:	44 8b 9d dc fe ff ff 	mov    -0x124(%rbp),%r11d
   283ca:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   283d1:	85 c0                	test   %eax,%eax
   283d3:	0f 84 7e 3f 00 00    	je     2c357 <JS_CallInternal+0x7347>
   283d9:	0f b7 85 10 fe ff ff 	movzwl -0x1f0(%rbp),%eax
   283e0:	83 e8 02             	sub    $0x2,%eax
   283e3:	45 85 db             	test   %r11d,%r11d
   283e6:	0f 84 5e 3f 00 00    	je     2c34a <JS_CallInternal+0x733a>
   283ec:	49 8b 0a             	mov    (%r10),%rcx
   283ef:	4d 8b 42 08          	mov    0x8(%r10),%r8
   283f3:	48 83 ec 08          	sub    $0x8,%rsp
   283f7:	44 89 9d 20 fe ff ff 	mov    %r11d,-0x1e0(%rbp)
   283fe:	31 f6                	xor    %esi,%esi
   28400:	4c 89 e7             	mov    %r12,%rdi
   28403:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   2840a:	41 b9 02 00 00 00    	mov    $0x2,%r9d
   28410:	ba 03 00 00 00       	mov    $0x3,%edx
   28415:	50                   	push   %rax
   28416:	e8 c5 be 01 00       	call   442e0 <JS_EvalObject>
   2841b:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   28422:	44 8b 9d 20 fe ff ff 	mov    -0x1e0(%rbp),%r11d
   28429:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   28430:	48 89 95 10 fe ff ff 	mov    %rdx,-0x1f0(%rbp)
   28437:	59                   	pop    %rcx
   28438:	5e                   	pop    %rsi
   28439:	45 85 db             	test   %r11d,%r11d
   2843c:	0f 84 78 31 00 00    	je     2b5ba <JS_CallInternal+0x65aa>
   28442:	45 89 d8             	mov    %r11d,%r8d
   28445:	48 89 9d 20 fe ff ff 	mov    %rbx,-0x1e0(%rbp)
   2844c:	4c 89 d3             	mov    %r10,%rbx
   2844f:	49 c1 e0 04          	shl    $0x4,%r8
   28453:	4c 89 95 e8 fd ff ff 	mov    %r10,-0x218(%rbp)
   2845a:	4d 01 d0             	add    %r10,%r8
   2845d:	4d 89 e2             	mov    %r12,%r10
   28460:	4d 89 c4             	mov    %r8,%r12
   28463:	eb 28                	jmp    2848d <JS_CallInternal+0x347d>
   28465:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2846a:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   28471:	00 00 00 00 
   28475:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2847c:	00 00 00 00 
   28480:	48 83 c3 10          	add    $0x10,%rbx
   28484:	4c 39 e3             	cmp    %r12,%rbx
   28487:	0f 84 1c 31 00 00    	je     2b5a9 <JS_CallInternal+0x6599>
   2848d:	48 8b 43 08          	mov    0x8(%rbx),%rax
   28491:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28494:	76 ea                	jbe    28480 <JS_CallInternal+0x3470>
   28496:	48 8b 33             	mov    (%rbx),%rsi
   28499:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   2849c:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2849f:	89 56 fc             	mov    %edx,-0x4(%rsi)
   284a2:	85 d2                	test   %edx,%edx
   284a4:	7f da                	jg     28480 <JS_CallInternal+0x3470>
   284a6:	49 8b 7a 10          	mov    0x10(%r10),%rdi
   284aa:	48 89 c2             	mov    %rax,%rdx
   284ad:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   284b4:	e8 17 60 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   284b9:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   284c0:	eb be                	jmp    28480 <JS_CallInternal+0x3470>
   284c2:	f3 0f 1e fa          	endbr64
   284c6:	83 bd 78 fe ff ff 03 	cmpl   $0x3,-0x188(%rbp)
   284cd:	0f 84 aa 62 00 00    	je     2e77d <JS_CallInternal+0x976d>
   284d3:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   284d8:	49 83 c5 01          	add    $0x1,%r13
   284dc:	49 89 c2             	mov    %rax,%r10
   284df:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   284e3:	ff e0                	jmp    *%rax
   284e5:	f3 0f 1e fa          	endbr64
   284e9:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   284ed:	83 f8 ff             	cmp    $0xffffffff,%eax
   284f0:	0f 84 82 3b 00 00    	je     2c078 <JS_CallInternal+0x7068>
   284f6:	83 f8 03             	cmp    $0x3,%eax
   284f9:	0f 85 11 6a 00 00    	jne    2ef10 <JS_CallInternal+0x9f00>
   284ff:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   28506:	48 c7 43 08 01 00 00 	movq   $0x1,0x8(%rbx)
   2850d:	00 
   2850e:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   28513:	48 83 c3 10          	add    $0x10,%rbx
   28517:	49 83 c5 01          	add    $0x1,%r13
   2851b:	49 89 c2             	mov    %rax,%r10
   2851e:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28522:	ff e0                	jmp    *%rax
   28524:	f3 0f 1e fa          	endbr64
   28528:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2852c:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
   28531:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   28535:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   28538:	76 04                	jbe    2853e <JS_CallInternal+0x352e>
   2853a:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2853e:	48 c1 e0 04          	shl    $0x4,%rax
   28542:	48 03 85 80 fe ff ff 	add    -0x180(%rbp),%rax
   28549:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2854d:	48 8b 38             	mov    (%rax),%rdi
   28550:	48 89 48 08          	mov    %rcx,0x8(%rax)
   28554:	48 89 30             	mov    %rsi,(%rax)
   28557:	83 fa f6             	cmp    $0xfffffff6,%edx
   2855a:	76 11                	jbe    2856d <JS_CallInternal+0x355d>
   2855c:	8b 47 fc             	mov    -0x4(%rdi),%eax
   2855f:	83 e8 01             	sub    $0x1,%eax
   28562:	89 47 fc             	mov    %eax,-0x4(%rdi)
   28565:	85 c0                	test   %eax,%eax
   28567:	0f 8e 5b 4c 00 00    	jle    2d1c8 <JS_CallInternal+0x81b8>
   2856d:	41 0f b6 45 02       	movzbl 0x2(%r13),%eax
   28572:	49 83 c5 03          	add    $0x3,%r13
   28576:	49 89 c2             	mov    %rax,%r10
   28579:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2857d:	ff e0                	jmp    *%rax
   2857f:	f3 0f 1e fa          	endbr64
   28583:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
   28588:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2858d:	48 c1 e0 04          	shl    $0x4,%rax
   28591:	48 03 85 80 fe ff ff 	add    -0x180(%rbp),%rax
   28598:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2859c:	48 8b 08             	mov    (%rax),%rcx
   2859f:	0f 11 00             	movups %xmm0,(%rax)
   285a2:	83 fa f6             	cmp    $0xfffffff6,%edx
   285a5:	76 11                	jbe    285b8 <JS_CallInternal+0x35a8>
   285a7:	8b 41 fc             	mov    -0x4(%rcx),%eax
   285aa:	83 e8 01             	sub    $0x1,%eax
   285ad:	89 41 fc             	mov    %eax,-0x4(%rcx)
   285b0:	85 c0                	test   %eax,%eax
   285b2:	0f 8e 22 4c 00 00    	jle    2d1da <JS_CallInternal+0x81ca>
   285b8:	41 0f b6 45 02       	movzbl 0x2(%r13),%eax
   285bd:	48 83 eb 10          	sub    $0x10,%rbx
   285c1:	49 83 c5 03          	add    $0x3,%r13
   285c5:	49 89 c2             	mov    %rax,%r10
   285c8:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   285cc:	ff e0                	jmp    *%rax
   285ce:	f3 0f 1e fa          	endbr64
   285d2:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   285d6:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   285da:	4c 89 e7             	mov    %r12,%rdi
   285dd:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   285e1:	4c 8b 43 f8          	mov    -0x8(%rbx),%r8
   285e5:	e8 66 b6 00 00       	call   33c50 <JS_CheckBrand>
   285ea:	83 f8 ff             	cmp    $0xffffffff,%eax
   285ed:	0f 84 1d 68 00 00    	je     2ee10 <JS_CallInternal+0x9e00>
   285f3:	85 c0                	test   %eax,%eax
   285f5:	0f 84 fe 67 00 00    	je     2edf9 <JS_CallInternal+0x9de9>
   285fb:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   28600:	49 83 c5 01          	add    $0x1,%r13
   28604:	49 89 c2             	mov    %rax,%r10
   28607:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2860b:	ff e0                	jmp    *%rax
   2860d:	f3 0f 1e fa          	endbr64
   28611:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   28618:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2861c:	83 bd 78 fe ff ff 03 	cmpl   $0x3,-0x188(%rbp)
   28623:	0f 84 54 61 00 00    	je     2e77d <JS_CallInternal+0x976d>
   28629:	48 8b 85 c8 fe ff ff 	mov    -0x138(%rbp),%rax
   28630:	48 8b 95 68 fe ff ff 	mov    -0x198(%rbp),%rdx
   28637:	4c 89 e7             	mov    %r12,%rdi
   2863a:	48 89 c6             	mov    %rax,%rsi
   2863d:	48 89 85 60 fe ff ff 	mov    %rax,-0x1a0(%rbp)
   28644:	48 89 95 68 fe ff ff 	mov    %rdx,-0x198(%rbp)
   2864b:	e8 d0 c1 ff ff       	call   24820 <JS_GetPrototype>
   28650:	48 89 c6             	mov    %rax,%rsi
   28653:	49 89 d7             	mov    %rdx,%r15
   28656:	83 fa 06             	cmp    $0x6,%edx
   28659:	0f 84 da 56 00 00    	je     2dd39 <JS_CallInternal+0x8d29>
   2865f:	48 8b 95 78 fe ff ff 	mov    -0x188(%rbp),%rdx
   28666:	48 8b 85 58 fe ff ff 	mov    -0x1a8(%rbp),%rax
   2866d:	6a 02                	push   $0x2
   2866f:	4c 89 e7             	mov    %r12,%rdi
   28672:	ff b5 98 fe ff ff    	push   -0x168(%rbp)
   28678:	44 8b 8d a8 fe ff ff 	mov    -0x158(%rbp),%r9d
   2867f:	49 89 d0             	mov    %rdx,%r8
   28682:	48 89 c1             	mov    %rax,%rcx
   28685:	4c 89 fa             	mov    %r15,%rdx
   28688:	48 89 b5 30 fe ff ff 	mov    %rsi,-0x1d0(%rbp)
   2868f:	e8 8c 20 07 00       	call   9a720 <JS_CallConstructorInternal>
   28694:	41 5a                	pop    %r10
   28696:	41 5b                	pop    %r11
   28698:	49 89 c0             	mov    %rax,%r8
   2869b:	48 89 d1             	mov    %rdx,%rcx
   2869e:	41 83 ff f6          	cmp    $0xfffffff6,%r15d
   286a2:	76 18                	jbe    286bc <JS_CallInternal+0x36ac>
   286a4:	48 8b b5 30 fe ff ff 	mov    -0x1d0(%rbp),%rsi
   286ab:	8b 46 fc             	mov    -0x4(%rsi),%eax
   286ae:	83 e8 01             	sub    $0x1,%eax
   286b1:	89 46 fc             	mov    %eax,-0x4(%rsi)
   286b4:	85 c0                	test   %eax,%eax
   286b6:	0f 8e 85 56 00 00    	jle    2dd41 <JS_CallInternal+0x8d31>
   286bc:	4d 89 ef             	mov    %r13,%r15
   286bf:	83 f9 06             	cmp    $0x6,%ecx
   286c2:	0f 84 78 d0 ff ff    	je     25740 <JS_CallInternal+0x730>
   286c8:	4c 89 03             	mov    %r8,(%rbx)
   286cb:	49 83 c5 01          	add    $0x1,%r13
   286cf:	48 83 c3 10          	add    $0x10,%rbx
   286d3:	48 89 4b f8          	mov    %rcx,-0x8(%rbx)
   286d7:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   286dc:	49 89 c2             	mov    %rax,%r10
   286df:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   286e3:	ff e0                	jmp    *%rax
   286e5:	f3 0f 1e fa          	endbr64
   286e9:	b8 03 00 00 00       	mov    $0x3,%eax
   286ee:	31 c9                	xor    %ecx,%ecx
   286f0:	e9 0d d1 ff ff       	jmp    25802 <JS_CallInternal+0x7f2>
   286f5:	f3 0f 1e fa          	endbr64
   286f9:	41 0f b7 4d 00       	movzwl 0x0(%r13),%ecx
   286fe:	49 89 da             	mov    %rbx,%r10
   28701:	4d 8d 7d 04          	lea    0x4(%r13),%r15
   28705:	41 0f b7 75 02       	movzwl 0x2(%r13),%esi
   2870a:	49 8b 94 24 70 01 00 	mov    0x170(%r12),%rdx
   28711:	00 
   28712:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   28718:	48 89 c8             	mov    %rcx,%rax
   2871b:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   28721:	49 8b 8c 24 78 01 00 	mov    0x178(%r12),%rcx
   28728:	00 
   28729:	48 c1 e0 04          	shl    $0x4,%rax
   2872d:	66 89 b5 f0 fd ff ff 	mov    %si,-0x210(%rbp)
   28734:	49 29 c2             	sub    %rax,%r10
   28737:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   2873e:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   28745:	49 8b 7a f0          	mov    -0x10(%r10),%rdi
   28749:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   28750:	4c 89 78 30          	mov    %r15,0x30(%rax)
   28754:	49 8b 42 f8          	mov    -0x8(%r10),%rax
   28758:	48 89 bd 20 fe ff ff 	mov    %rdi,-0x1e0(%rbp)
   2875f:	48 89 c6             	mov    %rax,%rsi
   28762:	48 89 85 e8 fd ff ff 	mov    %rax,-0x218(%rbp)
   28769:	e8 42 36 ff ff       	call   1bdb0 <js_strict_eq2.isra.0>
   2876e:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   28775:	85 c0                	test   %eax,%eax
   28777:	0f 84 68 3b 00 00    	je     2c2e5 <JS_CallInternal+0x72d5>
   2877d:	0f b7 85 f0 fd ff ff 	movzwl -0x210(%rbp),%eax
   28784:	44 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9d
   2878b:	83 e8 02             	sub    $0x2,%eax
   2878e:	45 85 c9             	test   %r9d,%r9d
   28791:	0f 84 41 3b 00 00    	je     2c2d8 <JS_CallInternal+0x72c8>
   28797:	49 8b 0a             	mov    (%r10),%rcx
   2879a:	4d 8b 42 08          	mov    0x8(%r10),%r8
   2879e:	48 83 ec 08          	sub    $0x8,%rsp
   287a2:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   287a9:	31 f6                	xor    %esi,%esi
   287ab:	4c 89 e7             	mov    %r12,%rdi
   287ae:	50                   	push   %rax
   287af:	41 b9 02 00 00 00    	mov    $0x2,%r9d
   287b5:	ba 03 00 00 00       	mov    $0x3,%edx
   287ba:	e8 21 bb 01 00       	call   442e0 <JS_EvalObject>
   287bf:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   287c6:	5f                   	pop    %rdi
   287c7:	48 89 c6             	mov    %rax,%rsi
   287ca:	41 58                	pop    %r8
   287cc:	83 fa 06             	cmp    $0x6,%edx
   287cf:	0f 84 6b cf ff ff    	je     25740 <JS_CallInternal+0x730>
   287d5:	48 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%rax
   287dc:	4c 89 ad 10 fe ff ff 	mov    %r13,-0x1f0(%rbp)
   287e3:	4d 8d 7a f0          	lea    -0x10(%r10),%r15
   287e7:	49 89 dd             	mov    %rbx,%r13
   287ea:	48 89 b5 00 fe ff ff 	mov    %rsi,-0x200(%rbp)
   287f1:	48 89 95 f0 fd ff ff 	mov    %rdx,-0x210(%rbp)
   287f8:	4a 8d 1c 10          	lea    (%rax,%r10,1),%rbx
   287fc:	eb 0f                	jmp    2880d <JS_CallInternal+0x37fd>
   287fe:	66 90                	xchg   %ax,%ax
   28800:	49 83 c7 10          	add    $0x10,%r15
   28804:	49 39 df             	cmp    %rbx,%r15
   28807:	0f 84 a5 2e 00 00    	je     2b6b2 <JS_CallInternal+0x66a2>
   2880d:	49 8b 47 08          	mov    0x8(%r15),%rax
   28811:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28814:	76 ea                	jbe    28800 <JS_CallInternal+0x37f0>
   28816:	49 8b 37             	mov    (%r15),%rsi
   28819:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   2881c:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2881f:	89 56 fc             	mov    %edx,-0x4(%rsi)
   28822:	85 d2                	test   %edx,%edx
   28824:	7f da                	jg     28800 <JS_CallInternal+0x37f0>
   28826:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2882b:	48 89 c2             	mov    %rax,%rdx
   2882e:	e8 9d 5c ff ff       	call   1e4d0 <__JS_FreeValueRT>
   28833:	eb cb                	jmp    28800 <JS_CallInternal+0x37f0>
   28835:	f3 0f 1e fa          	endbr64
   28839:	41 0f b6 45 04       	movzbl 0x4(%r13),%eax
   2883e:	41 8b 75 00          	mov    0x0(%r13),%esi
   28842:	4d 8d 7d 05          	lea    0x5(%r13),%r15
   28846:	3c 04                	cmp    $0x4,%al
   28848:	0f 87 b6 44 00 00    	ja     2cd04 <JS_CallInternal+0x7cf4>
   2884e:	48 8d 15 7f 99 0b 00 	lea    0xb997f(%rip),%rdx        # e21d4 <qjsc_repl_size+0x4e8>
   28855:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
   28859:	48 01 d0             	add    %rdx,%rax
   2885c:	3e ff e0             	notrack jmp *%rax
   2885f:	48 8d 35 22 35 0b 00 	lea    0xb3522(%rip),%rsi        # dbd88 <_IO_stdin_used+0x3d88>
   28866:	4c 89 e7             	mov    %r12,%rdi
   28869:	31 c0                	xor    %eax,%eax
   2886b:	e8 10 cf 00 00       	call   35780 <JS_ThrowReferenceError>
   28870:	e9 cb ce ff ff       	jmp    25740 <JS_CallInternal+0x730>
   28875:	48 8d 15 41 fc 0a 00 	lea    0xafc41(%rip),%rdx        # d84bd <_IO_stdin_used+0x4bd>
   2887c:	85 f6                	test   %esi,%esi
   2887e:	0f 85 7f 5d 00 00    	jne    2e603 <JS_CallInternal+0x95f3>
   28884:	48 8d 35 8e fc 0a 00 	lea    0xafc8e(%rip),%rsi        # d8519 <_IO_stdin_used+0x519>
   2888b:	4c 89 e7             	mov    %r12,%rdi
   2888e:	31 c0                	xor    %eax,%eax
   28890:	e8 eb ce 00 00       	call   35780 <JS_ThrowReferenceError>
   28895:	e9 a6 ce ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2889a:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2889f:	89 f2                	mov    %esi,%edx
   288a1:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   288a5:	e8 26 01 ff ff       	call   189d0 <JS_AtomGetStrRT.constprop.0>
   288aa:	48 8d 35 52 fc 0a 00 	lea    0xafc52(%rip),%rsi        # d8503 <_IO_stdin_used+0x503>
   288b1:	4c 89 e7             	mov    %r12,%rdi
   288b4:	48 89 c2             	mov    %rax,%rdx
   288b7:	31 c0                	xor    %eax,%eax
   288b9:	e8 92 ab 00 00       	call   33450 <JS_ThrowSyntaxError>
   288be:	e9 7d ce ff ff       	jmp    25740 <JS_CallInternal+0x730>
   288c3:	4c 89 e7             	mov    %r12,%rdi
   288c6:	e8 25 c3 00 00       	call   34bf0 <JS_ThrowTypeErrorReadOnly.part.0>
   288cb:	e9 70 ce ff ff       	jmp    25740 <JS_CallInternal+0x730>
   288d0:	48 8d 35 d9 34 0b 00 	lea    0xb34d9(%rip),%rsi        # dbdb0 <_IO_stdin_used+0x3db0>
   288d7:	4c 89 e7             	mov    %r12,%rdi
   288da:	31 c0                	xor    %eax,%eax
   288dc:	e8 bf af 00 00       	call   338a0 <JS_ThrowTypeError>
   288e1:	e9 5a ce ff ff       	jmp    25740 <JS_CallInternal+0x730>
   288e6:	f3 0f 1e fa          	endbr64
   288ea:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
   288ef:	48 c1 e0 04          	shl    $0x4,%rax
   288f3:	48 03 85 80 fe ff ff 	add    -0x180(%rbp),%rax
   288fa:	48 8b 10             	mov    (%rax),%rdx
   288fd:	48 8b 40 08          	mov    0x8(%rax),%rax
   28901:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28904:	76 04                	jbe    2890a <JS_CallInternal+0x38fa>
   28906:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2890a:	48 89 13             	mov    %rdx,(%rbx)
   2890d:	49 83 c5 03          	add    $0x3,%r13
   28911:	48 83 c3 10          	add    $0x10,%rbx
   28915:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   28919:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2891e:	49 89 c2             	mov    %rax,%r10
   28921:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28925:	ff e0                	jmp    *%rax
   28927:	f3 0f 1e fa          	endbr64
   2892b:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2892f:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
   28934:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   28938:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   2893b:	76 04                	jbe    28941 <JS_CallInternal+0x3931>
   2893d:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   28941:	48 c1 e0 04          	shl    $0x4,%rax
   28945:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   2894c:	48 8b 50 08          	mov    0x8(%rax),%rdx
   28950:	48 8b 38             	mov    (%rax),%rdi
   28953:	48 89 48 08          	mov    %rcx,0x8(%rax)
   28957:	48 89 30             	mov    %rsi,(%rax)
   2895a:	83 fa f6             	cmp    $0xfffffff6,%edx
   2895d:	76 11                	jbe    28970 <JS_CallInternal+0x3960>
   2895f:	8b 47 fc             	mov    -0x4(%rdi),%eax
   28962:	83 e8 01             	sub    $0x1,%eax
   28965:	89 47 fc             	mov    %eax,-0x4(%rdi)
   28968:	85 c0                	test   %eax,%eax
   2896a:	0f 8e b6 44 00 00    	jle    2ce26 <JS_CallInternal+0x7e16>
   28970:	41 0f b6 45 02       	movzbl 0x2(%r13),%eax
   28975:	49 83 c5 03          	add    $0x3,%r13
   28979:	49 89 c2             	mov    %rax,%r10
   2897c:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28980:	ff e0                	jmp    *%rax
   28982:	f3 0f 1e fa          	endbr64
   28986:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
   2898b:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   28990:	48 c1 e0 04          	shl    $0x4,%rax
   28994:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   2899b:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2899f:	48 8b 08             	mov    (%rax),%rcx
   289a2:	0f 11 00             	movups %xmm0,(%rax)
   289a5:	83 fa f6             	cmp    $0xfffffff6,%edx
   289a8:	76 11                	jbe    289bb <JS_CallInternal+0x39ab>
   289aa:	8b 41 fc             	mov    -0x4(%rcx),%eax
   289ad:	83 e8 01             	sub    $0x1,%eax
   289b0:	89 41 fc             	mov    %eax,-0x4(%rcx)
   289b3:	85 c0                	test   %eax,%eax
   289b5:	0f 8e 9a 43 00 00    	jle    2cd55 <JS_CallInternal+0x7d45>
   289bb:	41 0f b6 45 02       	movzbl 0x2(%r13),%eax
   289c0:	48 83 eb 10          	sub    $0x10,%rbx
   289c4:	49 83 c5 03          	add    $0x3,%r13
   289c8:	49 89 c2             	mov    %rax,%r10
   289cb:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   289cf:	ff e0                	jmp    *%rax
   289d1:	f3 0f 1e fa          	endbr64
   289d5:	e9 66 c9 ff ff       	jmp    25340 <JS_CallInternal+0x330>
   289da:	f3 0f 1e fa          	endbr64
   289de:	e9 5d c9 ff ff       	jmp    25340 <JS_CallInternal+0x330>
   289e3:	f3 0f 1e fa          	endbr64
   289e7:	e9 54 c9 ff ff       	jmp    25340 <JS_CallInternal+0x330>
   289ec:	f3 0f 1e fa          	endbr64
   289f0:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   289f4:	83 f8 fa             	cmp    $0xfffffffa,%eax
   289f7:	0f 8d 41 31 00 00    	jge    2bb3e <JS_CallInternal+0x6b2e>
   289fd:	83 f8 f8             	cmp    $0xfffffff8,%eax
   28a00:	0f 8c 40 31 00 00    	jl     2bb46 <JS_CallInternal+0x6b36>
   28a06:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   28a0b:	49 83 c5 01          	add    $0x1,%r13
   28a0f:	49 89 c2             	mov    %rax,%r10
   28a12:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28a16:	ff e0                	jmp    *%rax
   28a18:	f3 0f 1e fa          	endbr64
   28a1c:	83 7b f8 ff          	cmpl   $0xffffffff,-0x8(%rbx)
   28a20:	74 50                	je     28a72 <JS_CallInternal+0x3a62>
   28a22:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   28a29:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   28a2d:	4c 89 e7             	mov    %r12,%rdi
   28a30:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   28a34:	4c 89 68 30          	mov    %r13,0x30(%rax)
   28a38:	e8 13 24 02 00       	call   4ae50 <JS_ToObject>
   28a3d:	48 89 c1             	mov    %rax,%rcx
   28a40:	49 89 d7             	mov    %rdx,%r15
   28a43:	83 fa 06             	cmp    $0x6,%edx
   28a46:	0f 84 09 5f 00 00    	je     2e955 <JS_CallInternal+0x9945>
   28a4c:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   28a50:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28a53:	76 15                	jbe    28a6a <JS_CallInternal+0x3a5a>
   28a55:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   28a59:	8b 56 fc             	mov    -0x4(%rsi),%edx
   28a5c:	83 ea 01             	sub    $0x1,%edx
   28a5f:	89 56 fc             	mov    %edx,-0x4(%rsi)
   28a62:	85 d2                	test   %edx,%edx
   28a64:	0f 8e f3 5e 00 00    	jle    2e95d <JS_CallInternal+0x994d>
   28a6a:	48 89 4b f0          	mov    %rcx,-0x10(%rbx)
   28a6e:	4c 89 7b f8          	mov    %r15,-0x8(%rbx)
   28a72:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   28a77:	49 83 c5 01          	add    $0x1,%r13
   28a7b:	49 89 c2             	mov    %rax,%r10
   28a7e:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28a82:	ff e0                	jmp    *%rax
   28a84:	f3 0f 1e fa          	endbr64
   28a88:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   28a8f:	4d 8d 7d 04          	lea    0x4(%r13),%r15
   28a93:	41 8b 4d 00          	mov    0x0(%r13),%ecx
   28a97:	4c 89 78 30          	mov    %r15,0x30(%rax)
   28a9b:	49 8b 84 24 90 01 00 	mov    0x190(%r12),%rax
   28aa2:	00 
   28aa3:	89 ca                	mov    %ecx,%edx
   28aa5:	48 8b 70 18          	mov    0x18(%rax),%rsi
   28aa9:	8b 46 18             	mov    0x18(%rsi),%eax
   28aac:	21 c2                	and    %eax,%edx
   28aae:	8b 54 96 38          	mov    0x38(%rsi,%rdx,4),%edx
   28ab2:	48 85 d2             	test   %rdx,%rdx
   28ab5:	0f 84 4d 3a 00 00    	je     2c508 <JS_CallInternal+0x74f8>
   28abb:	48 8d 3c 85 3c 00 00 	lea    0x3c(,%rax,4),%rdi
   28ac2:	00 
   28ac3:	48 8d 44 d7 f8       	lea    -0x8(%rdi,%rdx,8),%rax
   28ac8:	48 01 f0             	add    %rsi,%rax
   28acb:	3b 48 04             	cmp    0x4(%rax),%ecx
   28ace:	0f 85 26 3a 00 00    	jne    2c4fa <JS_CallInternal+0x74ea>
   28ad4:	31 c0                	xor    %eax,%eax
   28ad6:	48 89 03             	mov    %rax,(%rbx)
   28ad9:	49 83 c5 05          	add    $0x5,%r13
   28add:	48 83 c3 10          	add    $0x10,%rbx
   28ae1:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   28ae8:	00 
   28ae9:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   28aee:	49 89 c2             	mov    %rax,%r10
   28af1:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28af5:	ff e0                	jmp    *%rax
   28af7:	f3 0f 1e fa          	endbr64
   28afb:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   28b02:	4c 8b 7b f0          	mov    -0x10(%rbx),%r15
   28b06:	4c 89 e7             	mov    %r12,%rdi
   28b09:	4c 89 68 30          	mov    %r13,0x30(%rax)
   28b0d:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   28b11:	4c 89 fe             	mov    %r15,%rsi
   28b14:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   28b1b:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   28b1f:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   28b26:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   28b2a:	48 89 c2             	mov    %rax,%rdx
   28b2d:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   28b34:	e8 37 db 01 00       	call   46670 <JS_ValueToAtom>
   28b39:	85 c0                	test   %eax,%eax
   28b3b:	0f 84 dd 55 00 00    	je     2e11e <JS_CallInternal+0x910e>
   28b41:	48 8b b5 10 fe ff ff 	mov    -0x1f0(%rbp),%rsi
   28b48:	48 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%rdx
   28b4f:	89 c1                	mov    %eax,%ecx
   28b51:	4c 89 e7             	mov    %r12,%rdi
   28b54:	41 b8 00 80 00 00    	mov    $0x8000,%r8d
   28b5a:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   28b60:	e8 0b 4d 02 00       	call   4d870 <JS_DeleteProperty>
   28b65:	44 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%r9d
   28b6c:	89 c1                	mov    %eax,%ecx
   28b6e:	41 81 f9 f2 00 00 00 	cmp    $0xf2,%r9d
   28b75:	0f 8f f2 39 00 00    	jg     2c56d <JS_CallInternal+0x755d>
   28b7b:	85 c9                	test   %ecx,%ecx
   28b7d:	0f 88 d1 4e 00 00    	js     2da54 <JS_CallInternal+0x8a44>
   28b83:	83 bd 30 fe ff ff f6 	cmpl   $0xfffffff6,-0x1d0(%rbp)
   28b8a:	76 1e                	jbe    28baa <JS_CallInternal+0x3b9a>
   28b8c:	48 8b b5 10 fe ff ff 	mov    -0x1f0(%rbp),%rsi
   28b93:	8b 46 fc             	mov    -0x4(%rsi),%eax
   28b96:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   28b9c:	83 e8 01             	sub    $0x1,%eax
   28b9f:	89 46 fc             	mov    %eax,-0x4(%rsi)
   28ba2:	85 c0                	test   %eax,%eax
   28ba4:	0f 8e 7e 52 00 00    	jle    2de28 <JS_CallInternal+0x8e18>
   28baa:	83 bd 00 fe ff ff f6 	cmpl   $0xfffffff6,-0x200(%rbp)
   28bb1:	76 13                	jbe    28bc6 <JS_CallInternal+0x3bb6>
   28bb3:	41 8b 47 fc          	mov    -0x4(%r15),%eax
   28bb7:	83 e8 01             	sub    $0x1,%eax
   28bba:	41 89 47 fc          	mov    %eax,-0x4(%r15)
   28bbe:	85 c0                	test   %eax,%eax
   28bc0:	0f 8e 96 4e 00 00    	jle    2da5c <JS_CallInternal+0x8a4c>
   28bc6:	31 c0                	xor    %eax,%eax
   28bc8:	85 c9                	test   %ecx,%ecx
   28bca:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   28bd1:	00 
   28bd2:	0f 95 c0             	setne  %al
   28bd5:	48 83 eb 10          	sub    $0x10,%rbx
   28bd9:	49 83 c5 01          	add    $0x1,%r13
   28bdd:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   28be1:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   28be6:	49 89 c2             	mov    %rax,%r10
   28be9:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28bed:	ff e0                	jmp    *%rax
   28bef:	f3 0f 1e fa          	endbr64
   28bf3:	31 c0                	xor    %eax,%eax
   28bf5:	b9 01 00 00 00       	mov    $0x1,%ecx
   28bfa:	e9 c1 cb ff ff       	jmp    257c0 <JS_CallInternal+0x7b0>
   28bff:	f3 0f 1e fa          	endbr64
   28c03:	31 c0                	xor    %eax,%eax
   28c05:	31 c9                	xor    %ecx,%ecx
   28c07:	e9 b4 cb ff ff       	jmp    257c0 <JS_CallInternal+0x7b0>
   28c0c:	f3 0f 1e fa          	endbr64
   28c10:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
   28c15:	48 c1 e0 04          	shl    $0x4,%rax
   28c19:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   28c20:	48 8b 10             	mov    (%rax),%rdx
   28c23:	48 8b 40 08          	mov    0x8(%rax),%rax
   28c27:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28c2a:	76 04                	jbe    28c30 <JS_CallInternal+0x3c20>
   28c2c:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   28c30:	48 89 13             	mov    %rdx,(%rbx)
   28c33:	49 83 c5 03          	add    $0x3,%r13
   28c37:	48 83 c3 10          	add    $0x10,%rbx
   28c3b:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   28c3f:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   28c44:	49 89 c2             	mov    %rax,%r10
   28c47:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28c4b:	ff e0                	jmp    *%rax
   28c4d:	f3 0f 1e fa          	endbr64
   28c51:	4c 8b 43 f8          	mov    -0x8(%rbx),%r8
   28c55:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   28c59:	4c 89 e7             	mov    %r12,%rdi
   28c5c:	4c 89 c2             	mov    %r8,%rdx
   28c5f:	e8 3c be ff ff       	call   24aa0 <js_operator_typeof>
   28c64:	41 89 c7             	mov    %eax,%r15d
   28c67:	41 83 f8 f6          	cmp    $0xfffffff6,%r8d
   28c6b:	76 11                	jbe    28c7e <JS_CallInternal+0x3c6e>
   28c6d:	8b 46 fc             	mov    -0x4(%rsi),%eax
   28c70:	83 e8 01             	sub    $0x1,%eax
   28c73:	89 46 fc             	mov    %eax,-0x4(%rsi)
   28c76:	85 c0                	test   %eax,%eax
   28c78:	0f 8e 96 41 00 00    	jle    2ce14 <JS_CallInternal+0x7e04>
   28c7e:	ba 01 00 00 00       	mov    $0x1,%edx
   28c83:	44 89 fe             	mov    %r15d,%esi
   28c86:	4c 89 e7             	mov    %r12,%rdi
   28c89:	49 83 c5 01          	add    $0x1,%r13
   28c8d:	e8 6e 27 01 00       	call   3b400 <__JS_AtomToValue>
   28c92:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   28c96:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   28c9a:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   28c9f:	49 89 c2             	mov    %rax,%r10
   28ca2:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28ca6:	ff e0                	jmp    *%rax
   28ca8:	f3 0f 1e fa          	endbr64
   28cac:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   28cb3:	4c 8b 4b e8          	mov    -0x18(%rbx),%r9
   28cb7:	4c 89 e7             	mov    %r12,%rdi
   28cba:	4c 8b 7b f0          	mov    -0x10(%rbx),%r15
   28cbe:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   28cc2:	4c 89 68 30          	mov    %r13,0x30(%rax)
   28cc6:	4c 8b 43 f8          	mov    -0x8(%rbx),%r8
   28cca:	4c 89 ca             	mov    %r9,%rdx
   28ccd:	4c 89 f9             	mov    %r15,%rcx
   28cd0:	48 89 b5 00 fe ff ff 	mov    %rsi,-0x200(%rbp)
   28cd7:	4c 89 85 10 fe ff ff 	mov    %r8,-0x1f0(%rbp)
   28cde:	4c 89 8d 30 fe ff ff 	mov    %r9,-0x1d0(%rbp)
   28ce5:	e8 e6 bf 06 00       	call   94cd0 <JS_IsInstanceOf>
   28cea:	85 c0                	test   %eax,%eax
   28cec:	0f 88 1e 30 00 00    	js     2bd10 <JS_CallInternal+0x6d00>
   28cf2:	4c 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9
   28cf9:	4c 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%r8
   28d00:	41 83 f9 f6          	cmp    $0xfffffff6,%r9d
   28d04:	76 18                	jbe    28d1e <JS_CallInternal+0x3d0e>
   28d06:	48 8b b5 00 fe ff ff 	mov    -0x200(%rbp),%rsi
   28d0d:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   28d10:	8d 51 ff             	lea    -0x1(%rcx),%edx
   28d13:	89 56 fc             	mov    %edx,-0x4(%rsi)
   28d16:	85 d2                	test   %edx,%edx
   28d18:	0f 8e a4 58 00 00    	jle    2e5c2 <JS_CallInternal+0x95b2>
   28d1e:	41 83 f8 f6          	cmp    $0xfffffff6,%r8d
   28d22:	76 13                	jbe    28d37 <JS_CallInternal+0x3d27>
   28d24:	41 8b 4f fc          	mov    -0x4(%r15),%ecx
   28d28:	8d 51 ff             	lea    -0x1(%rcx),%edx
   28d2b:	41 89 57 fc          	mov    %edx,-0x4(%r15)
   28d2f:	85 d2                	test   %edx,%edx
   28d31:	0f 8e 09 57 00 00    	jle    2e440 <JS_CallInternal+0x9430>
   28d37:	85 c0                	test   %eax,%eax
   28d39:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   28d40:	00 
   28d41:	0f 95 c0             	setne  %al
   28d44:	48 83 eb 10          	sub    $0x10,%rbx
   28d48:	49 83 c5 01          	add    $0x1,%r13
   28d4c:	0f b6 c0             	movzbl %al,%eax
   28d4f:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   28d53:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   28d58:	49 89 c2             	mov    %rax,%r10
   28d5b:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28d5f:	ff e0                	jmp    *%rax
   28d61:	f3 0f 1e fa          	endbr64
   28d65:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   28d6c:	4c 8b 4b e8          	mov    -0x18(%rbx),%r9
   28d70:	4c 8b 53 f0          	mov    -0x10(%rbx),%r10
   28d74:	4c 8b 7b f8          	mov    -0x8(%rbx),%r15
   28d78:	4c 89 68 30          	mov    %r13,0x30(%rax)
   28d7c:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   28d80:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   28d87:	41 83 f9 ff          	cmp    $0xffffffff,%r9d
   28d8b:	0f 85 71 69 00 00    	jne    2f702 <JS_CallInternal+0xa6f2>
   28d91:	41 83 ff ff          	cmp    $0xffffffff,%r15d
   28d95:	0f 84 65 36 00 00    	je     2c400 <JS_CallInternal+0x73f0>
   28d9b:	4c 89 d6             	mov    %r10,%rsi
   28d9e:	4c 89 fa             	mov    %r15,%rdx
   28da1:	4c 89 e7             	mov    %r12,%rdi
   28da4:	4c 89 8d 00 fe ff ff 	mov    %r9,-0x200(%rbp)
   28dab:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   28db2:	4c 89 bd 18 fe ff ff 	mov    %r15,-0x1e8(%rbp)
   28db9:	e8 b2 d8 01 00       	call   46670 <JS_ValueToAtom>
   28dbe:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   28dc5:	4c 8b 9d 18 fe ff ff 	mov    -0x1e8(%rbp),%r11
   28dcc:	85 c0                	test   %eax,%eax
   28dce:	4c 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%r9
   28dd5:	0f 84 5e 57 00 00    	je     2e539 <JS_CallInternal+0x9529>
   28ddb:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   28de2:	48 8b 71 18          	mov    0x18(%rcx),%rsi
   28de6:	89 c1                	mov    %eax,%ecx
   28de8:	8b 56 18             	mov    0x18(%rsi),%edx
   28deb:	21 d1                	and    %edx,%ecx
   28ded:	8b 4c 8e 38          	mov    0x38(%rsi,%rcx,4),%ecx
   28df1:	48 85 c9             	test   %rcx,%rcx
   28df4:	0f 84 44 58 00 00    	je     2e63e <JS_CallInternal+0x962e>
   28dfa:	48 8d 14 95 3c 00 00 	lea    0x3c(,%rdx,4),%rdx
   28e01:	00 
   28e02:	48 8d 4c ca f8       	lea    -0x8(%rdx,%rcx,8),%rcx
   28e07:	48 01 f1             	add    %rsi,%rcx
   28e0a:	39 41 04             	cmp    %eax,0x4(%rcx)
   28e0d:	0f 85 1d 58 00 00    	jne    2e630 <JS_CallInternal+0x9620>
   28e13:	b9 01 00 00 00       	mov    $0x1,%ecx
   28e18:	3d f2 00 00 00       	cmp    $0xf2,%eax
   28e1d:	0f 8f bf 3b 00 00    	jg     2c9e2 <JS_CallInternal+0x79d2>
   28e23:	41 83 f9 f6          	cmp    $0xfffffff6,%r9d
   28e27:	76 1e                	jbe    28e47 <JS_CallInternal+0x3e37>
   28e29:	48 8b b5 30 fe ff ff 	mov    -0x1d0(%rbp),%rsi
   28e30:	8b 46 fc             	mov    -0x4(%rsi),%eax
   28e33:	89 85 10 fe ff ff    	mov    %eax,-0x1f0(%rbp)
   28e39:	83 e8 01             	sub    $0x1,%eax
   28e3c:	89 46 fc             	mov    %eax,-0x4(%rsi)
   28e3f:	85 c0                	test   %eax,%eax
   28e41:	0f 8e 23 44 00 00    	jle    2d26a <JS_CallInternal+0x825a>
   28e47:	41 83 ff f6          	cmp    $0xfffffff6,%r15d
   28e4b:	76 13                	jbe    28e60 <JS_CallInternal+0x3e50>
   28e4d:	41 8b 42 fc          	mov    -0x4(%r10),%eax
   28e51:	83 e8 01             	sub    $0x1,%eax
   28e54:	41 89 42 fc          	mov    %eax,-0x4(%r10)
   28e58:	85 c0                	test   %eax,%eax
   28e5a:	0f 8e 91 3f 00 00    	jle    2cdf1 <JS_CallInternal+0x7de1>
   28e60:	48 89 4b e0          	mov    %rcx,-0x20(%rbx)
   28e64:	49 83 c5 01          	add    $0x1,%r13
   28e68:	48 83 eb 10          	sub    $0x10,%rbx
   28e6c:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   28e73:	00 
   28e74:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   28e79:	49 89 c2             	mov    %rax,%r10
   28e7c:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28e80:	ff e0                	jmp    *%rax
   28e82:	f3 0f 1e fa          	endbr64
   28e86:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   28e8d:	4c 8b 7b f8          	mov    -0x8(%rbx),%r15
   28e91:	4c 89 68 30          	mov    %r13,0x30(%rax)
   28e95:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   28e99:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   28ea0:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   28ea4:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   28eab:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   28eaf:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   28eb6:	41 83 ff ff          	cmp    $0xffffffff,%r15d
   28eba:	0f 85 0b 5f 00 00    	jne    2edcb <JS_CallInternal+0x9dbb>
   28ec0:	48 8b b5 10 fe ff ff 	mov    -0x1f0(%rbp),%rsi
   28ec7:	48 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%rdx
   28ece:	4c 89 e7             	mov    %r12,%rdi
   28ed1:	e8 9a d7 01 00       	call   46670 <JS_ValueToAtom>
   28ed6:	89 c1                	mov    %eax,%ecx
   28ed8:	85 c0                	test   %eax,%eax
   28eda:	0f 84 20 49 00 00    	je     2d800 <JS_CallInternal+0x87f0>
   28ee0:	48 8b b5 00 fe ff ff 	mov    -0x200(%rbp),%rsi
   28ee7:	4c 89 fa             	mov    %r15,%rdx
   28eea:	4c 89 e7             	mov    %r12,%rdi
   28eed:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   28ef3:	e8 68 6c 04 00       	call   6fb60 <JS_HasProperty>
   28ef8:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   28efe:	41 89 c0             	mov    %eax,%r8d
   28f01:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   28f07:	0f 8f b4 35 00 00    	jg     2c4c1 <JS_CallInternal+0x74b1>
   28f0d:	45 85 c0             	test   %r8d,%r8d
   28f10:	0f 88 d8 62 00 00    	js     2f1ee <JS_CallInternal+0xa1de>
   28f16:	83 bd 30 fe ff ff f6 	cmpl   $0xfffffff6,-0x1d0(%rbp)
   28f1d:	76 1e                	jbe    28f3d <JS_CallInternal+0x3f2d>
   28f1f:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   28f26:	8b 41 fc             	mov    -0x4(%rcx),%eax
   28f29:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   28f2f:	83 e8 01             	sub    $0x1,%eax
   28f32:	89 41 fc             	mov    %eax,-0x4(%rcx)
   28f35:	85 c0                	test   %eax,%eax
   28f37:	0f 8e 32 4e 00 00    	jle    2dd6f <JS_CallInternal+0x8d5f>
   28f3d:	41 83 ff f6          	cmp    $0xfffffff6,%r15d
   28f41:	76 1e                	jbe    28f61 <JS_CallInternal+0x3f51>
   28f43:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   28f4a:	8b 41 fc             	mov    -0x4(%rcx),%eax
   28f4d:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   28f53:	83 e8 01             	sub    $0x1,%eax
   28f56:	89 41 fc             	mov    %eax,-0x4(%rcx)
   28f59:	85 c0                	test   %eax,%eax
   28f5b:	0f 8e 75 4c 00 00    	jle    2dbd6 <JS_CallInternal+0x8bc6>
   28f61:	31 c0                	xor    %eax,%eax
   28f63:	45 85 c0             	test   %r8d,%r8d
   28f66:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   28f6d:	00 
   28f6e:	0f 95 c0             	setne  %al
   28f71:	48 83 eb 10          	sub    $0x10,%rbx
   28f75:	49 83 c5 01          	add    $0x1,%r13
   28f79:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   28f7d:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   28f82:	49 89 c2             	mov    %rax,%r10
   28f85:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28f89:	ff e0                	jmp    *%rax
   28f8b:	f3 0f 1e fa          	endbr64
   28f8f:	48 8b 4b e8          	mov    -0x18(%rbx),%rcx
   28f93:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   28f97:	4c 8b 53 f0          	mov    -0x10(%rbx),%r10
   28f9b:	4c 8b 7b f8          	mov    -0x8(%rbx),%r15
   28f9f:	85 c9                	test   %ecx,%ecx
   28fa1:	0f 85 f7 4c 00 00    	jne    2dc9e <JS_CallInternal+0x8c8e>
   28fa7:	45 85 ff             	test   %r15d,%r15d
   28faa:	0f 85 0a 2d 00 00    	jne    2bcba <JS_CallInternal+0x6caa>
   28fb0:	31 c0                	xor    %eax,%eax
   28fb2:	44 39 d2             	cmp    %r10d,%edx
   28fb5:	0f 95 c0             	setne  %al
   28fb8:	48 89 43 e0          	mov    %rax,-0x20(%rbx)
   28fbc:	49 83 c5 01          	add    $0x1,%r13
   28fc0:	48 83 eb 10          	sub    $0x10,%rbx
   28fc4:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   28fcb:	00 
   28fcc:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   28fd1:	49 89 c2             	mov    %rax,%r10
   28fd4:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28fd8:	ff e0                	jmp    *%rax
   28fda:	f3 0f 1e fa          	endbr64
   28fde:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   28fe2:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   28fe6:	4c 8b 53 f0          	mov    -0x10(%rbx),%r10
   28fea:	4c 8b 43 f8          	mov    -0x8(%rbx),%r8
   28fee:	85 d2                	test   %edx,%edx
   28ff0:	0f 85 a0 4d 00 00    	jne    2dd96 <JS_CallInternal+0x8d86>
   28ff6:	45 85 c0             	test   %r8d,%r8d
   28ff9:	0f 85 8b 2c 00 00    	jne    2bc8a <JS_CallInternal+0x6c7a>
   28fff:	45 31 ff             	xor    %r15d,%r15d
   29002:	44 39 d7             	cmp    %r10d,%edi
   29005:	41 0f 94 c7          	sete   %r15b
   29009:	4c 89 7b e0          	mov    %r15,-0x20(%rbx)
   2900d:	49 83 c5 01          	add    $0x1,%r13
   29011:	48 83 eb 10          	sub    $0x10,%rbx
   29015:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   2901c:	00 
   2901d:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   29022:	49 89 c2             	mov    %rax,%r10
   29025:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29029:	ff e0                	jmp    *%rax
   2902b:	f3 0f 1e fa          	endbr64
   2902f:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   29033:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   29037:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2903b:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2903f:	85 d2                	test   %edx,%edx
   29041:	0f 85 de 51 00 00    	jne    2e225 <JS_CallInternal+0x9215>
   29047:	85 c9                	test   %ecx,%ecx
   29049:	0f 85 11 2c 00 00    	jne    2bc60 <JS_CallInternal+0x6c50>
   2904f:	45 31 ff             	xor    %r15d,%r15d
   29052:	44 39 c7             	cmp    %r8d,%edi
   29055:	41 0f 94 c7          	sete   %r15b
   29059:	41 83 f7 01          	xor    $0x1,%r15d
   2905d:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   29064:	00 
   29065:	49 63 c7             	movslq %r15d,%rax
   29068:	48 89 43 e0          	mov    %rax,-0x20(%rbx)
   2906c:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   29071:	48 83 eb 10          	sub    $0x10,%rbx
   29075:	49 83 c5 01          	add    $0x1,%r13
   29079:	49 89 c2             	mov    %rax,%r10
   2907c:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29080:	ff e0                	jmp    *%rax
   29082:	f3 0f 1e fa          	endbr64
   29086:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2908a:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2908e:	4d 8d 7d 01          	lea    0x1(%r13),%r15
   29092:	83 fa 03             	cmp    $0x3,%edx
   29095:	0f 87 db 33 00 00    	ja     2c476 <JS_CallInternal+0x7466>
   2909b:	48 83 eb 10          	sub    $0x10,%rbx
   2909f:	85 c0                	test   %eax,%eax
   290a1:	75 0d                	jne    290b0 <JS_CallInternal+0x40a0>
   290a3:	41 0f be 45 00       	movsbl 0x0(%r13),%eax
   290a8:	83 e8 01             	sub    $0x1,%eax
   290ab:	48 98                	cltq
   290ad:	49 01 c7             	add    %rax,%r15
   290b0:	41 8b 84 24 a8 01 00 	mov    0x1a8(%r12),%eax
   290b7:	00 
   290b8:	83 e8 01             	sub    $0x1,%eax
   290bb:	41 89 84 24 a8 01 00 	mov    %eax,0x1a8(%r12)
   290c2:	00 
   290c3:	85 c0                	test   %eax,%eax
   290c5:	0f 8e d1 48 00 00    	jle    2d99c <JS_CallInternal+0x898c>
   290cb:	41 0f b6 07          	movzbl (%r15),%eax
   290cf:	4d 8d 6f 01          	lea    0x1(%r15),%r13
   290d3:	49 89 c2             	mov    %rax,%r10
   290d6:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   290da:	f3 0f 1e fa          	endbr64
   290de:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   290e2:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   290e6:	4d 8d 7d 01          	lea    0x1(%r13),%r15
   290ea:	83 fa 03             	cmp    $0x3,%edx
   290ed:	0f 87 63 33 00 00    	ja     2c456 <JS_CallInternal+0x7446>
   290f3:	48 83 eb 10          	sub    $0x10,%rbx
   290f7:	85 c0                	test   %eax,%eax
   290f9:	74 0d                	je     29108 <JS_CallInternal+0x40f8>
   290fb:	41 0f be 45 00       	movsbl 0x0(%r13),%eax
   29100:	83 e8 01             	sub    $0x1,%eax
   29103:	48 98                	cltq
   29105:	49 01 c7             	add    %rax,%r15
   29108:	41 8b 84 24 a8 01 00 	mov    0x1a8(%r12),%eax
   2910f:	00 
   29110:	83 e8 01             	sub    $0x1,%eax
   29113:	41 89 84 24 a8 01 00 	mov    %eax,0x1a8(%r12)
   2911a:	00 
   2911b:	85 c0                	test   %eax,%eax
   2911d:	0f 8e b2 51 00 00    	jle    2e2d5 <JS_CallInternal+0x92c5>
   29123:	41 0f b6 07          	movzbl (%r15),%eax
   29127:	4d 8d 6f 01          	lea    0x1(%r15),%r13
   2912b:	49 89 c2             	mov    %rax,%r10
   2912e:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   29132:	f3 0f 1e fa          	endbr64
   29136:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2913a:	0b 53 e8             	or     -0x18(%rbx),%edx
   2913d:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   29141:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   29145:	0f 85 db 46 00 00    	jne    2d826 <JS_CallInternal+0x8816>
   2914b:	d3 e0                	shl    %cl,%eax
   2914d:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   29154:	00 
   29155:	48 83 eb 10          	sub    $0x10,%rbx
   29159:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2915d:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   29162:	49 83 c5 01          	add    $0x1,%r13
   29166:	49 89 c2             	mov    %rax,%r10
   29169:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2916d:	ff e0                	jmp    *%rax
   2916f:	f3 0f 1e fa          	endbr64
   29173:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   29177:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2917b:	83 f8 03             	cmp    $0x3,%eax
   2917e:	0f 87 ac 30 00 00    	ja     2c230 <JS_CallInternal+0x7220>
   29184:	31 c0                	xor    %eax,%eax
   29186:	85 d2                	test   %edx,%edx
   29188:	0f 95 c0             	setne  %al
   2918b:	85 c0                	test   %eax,%eax
   2918d:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   29194:	00 
   29195:	0f 94 c0             	sete   %al
   29198:	49 83 c5 01          	add    $0x1,%r13
   2919c:	0f b6 c0             	movzbl %al,%eax
   2919f:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   291a3:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   291a8:	49 89 c2             	mov    %rax,%r10
   291ab:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   291af:	ff e0                	jmp    *%rax
   291b1:	f3 0f 1e fa          	endbr64
   291b5:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   291b9:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   291bd:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   291c1:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   291c5:	89 cf                	mov    %ecx,%edi
   291c7:	09 f7                	or     %esi,%edi
   291c9:	0f 85 c1 46 00 00    	jne    2d890 <JS_CallInternal+0x8880>
   291cf:	39 c2                	cmp    %eax,%edx
   291d1:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   291d8:	00 
   291d9:	0f 9f c0             	setg   %al
   291dc:	48 83 eb 10          	sub    $0x10,%rbx
   291e0:	0f b6 c0             	movzbl %al,%eax
   291e3:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   291e7:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   291ec:	49 83 c5 01          	add    $0x1,%r13
   291f0:	49 89 c2             	mov    %rax,%r10
   291f3:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   291f7:	ff e0                	jmp    *%rax
   291f9:	f3 0f 1e fa          	endbr64
   291fd:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
   29202:	48 c1 e0 04          	shl    $0x4,%rax
   29206:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   2920d:	48 8b 50 08          	mov    0x8(%rax),%rdx
   29211:	48 8b 08             	mov    (%rax),%rcx
   29214:	48 c7 40 08 04 00 00 	movq   $0x4,0x8(%rax)
   2921b:	00 
   2921c:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
   29223:	83 fa f6             	cmp    $0xfffffff6,%edx
   29226:	76 11                	jbe    29239 <JS_CallInternal+0x4229>
   29228:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2922b:	83 e8 01             	sub    $0x1,%eax
   2922e:	89 41 fc             	mov    %eax,-0x4(%rcx)
   29231:	85 c0                	test   %eax,%eax
   29233:	0f 8e 12 41 00 00    	jle    2d34b <JS_CallInternal+0x833b>
   29239:	41 0f b6 45 02       	movzbl 0x2(%r13),%eax
   2923e:	49 83 c5 03          	add    $0x3,%r13
   29242:	49 89 c2             	mov    %rax,%r10
   29245:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29249:	ff e0                	jmp    *%rax
   2924b:	f3 0f 1e fa          	endbr64
   2924f:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   29256:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2925a:	83 7b d8 ff          	cmpl   $0xffffffff,-0x28(%rbx)
   2925e:	0f 85 92 5f 00 00    	jne    2f1f6 <JS_CallInternal+0xa1e6>
   29264:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   29268:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   2926c:	48 8d 43 e0          	lea    -0x20(%rbx),%rax
   29270:	4c 89 e7             	mov    %r12,%rdi
   29273:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2927a:	4d 89 ef             	mov    %r13,%r15
   2927d:	e8 ee d3 01 00       	call   46670 <JS_ValueToAtom>
   29282:	89 c1                	mov    %eax,%ecx
   29284:	85 c0                	test   %eax,%eax
   29286:	0f 84 b4 c4 ff ff    	je     25740 <JS_CallInternal+0x730>
   2928c:	48 83 ec 08          	sub    $0x8,%rsp
   29290:	4c 8d 53 d0          	lea    -0x30(%rbx),%r10
   29294:	4c 8d 7b c0          	lea    -0x40(%rbx),%r15
   29298:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2929c:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   292a3:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   292a7:	4c 89 e7             	mov    %r12,%rdi
   292aa:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   292ae:	48 8b 53 d8          	mov    -0x28(%rbx),%rdx
   292b2:	68 00 80 00 00       	push   $0x8000
   292b7:	41 ff 77 08          	push   0x8(%r15)
   292bb:	41 ff 37             	push   (%r15)
   292be:	89 85 10 fe ff ff    	mov    %eax,-0x1f0(%rbp)
   292c4:	e8 87 73 00 00       	call   30650 <JS_SetPropertyInternal>
   292c9:	8b 8d 10 fe ff ff    	mov    -0x1f0(%rbp),%ecx
   292cf:	48 83 c4 20          	add    $0x20,%rsp
   292d3:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   292da:	89 c3                	mov    %eax,%ebx
   292dc:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   292e2:	0f 8f 80 33 00 00    	jg     2c668 <JS_CallInternal+0x7658>
   292e8:	49 8b 47 08          	mov    0x8(%r15),%rax
   292ec:	83 f8 f6             	cmp    $0xfffffff6,%eax
   292ef:	76 14                	jbe    29305 <JS_CallInternal+0x42f5>
   292f1:	49 8b 0f             	mov    (%r15),%rcx
   292f4:	8b 71 fc             	mov    -0x4(%rcx),%esi
   292f7:	8d 56 ff             	lea    -0x1(%rsi),%edx
   292fa:	89 51 fc             	mov    %edx,-0x4(%rcx)
   292fd:	85 d2                	test   %edx,%edx
   292ff:	0f 8e 7c 47 00 00    	jle    2da81 <JS_CallInternal+0x8a71>
   29305:	49 8b 42 08          	mov    0x8(%r10),%rax
   29309:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2930c:	76 14                	jbe    29322 <JS_CallInternal+0x4312>
   2930e:	49 8b 0a             	mov    (%r10),%rcx
   29311:	8b 51 fc             	mov    -0x4(%rcx),%edx
   29314:	83 ea 01             	sub    $0x1,%edx
   29317:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2931a:	85 d2                	test   %edx,%edx
   2931c:	0f 8e 25 50 00 00    	jle    2e347 <JS_CallInternal+0x9337>
   29322:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   29329:	48 8b 41 08          	mov    0x8(%rcx),%rax
   2932d:	83 f8 f6             	cmp    $0xfffffff6,%eax
   29330:	76 14                	jbe    29346 <JS_CallInternal+0x4336>
   29332:	48 8b 09             	mov    (%rcx),%rcx
   29335:	8b 71 fc             	mov    -0x4(%rcx),%esi
   29338:	8d 56 ff             	lea    -0x1(%rsi),%edx
   2933b:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2933e:	85 d2                	test   %edx,%edx
   29340:	0f 8e bb 47 00 00    	jle    2db01 <JS_CallInternal+0x8af1>
   29346:	85 db                	test   %ebx,%ebx
   29348:	0f 88 1b 5c 00 00    	js     2ef69 <JS_CallInternal+0x9f59>
   2934e:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   29353:	4c 89 fb             	mov    %r15,%rbx
   29356:	49 83 c5 01          	add    $0x1,%r13
   2935a:	49 89 c2             	mov    %rax,%r10
   2935d:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29361:	ff e0                	jmp    *%rax
   29363:	f3 0f 1e fa          	endbr64
   29367:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   2936b:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   2936f:	4c 89 e7             	mov    %r12,%rdi
   29372:	4c 8d 7b e0          	lea    -0x20(%rbx),%r15
   29376:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2937d:	4c 89 68 30          	mov    %r13,0x30(%rax)
   29381:	e8 ea d2 01 00       	call   46670 <JS_ValueToAtom>
   29386:	89 c1                	mov    %eax,%ecx
   29388:	85 c0                	test   %eax,%eax
   2938a:	0f 84 69 47 00 00    	je     2daf9 <JS_CallInternal+0x8ae9>
   29390:	83 7b d8 03          	cmpl   $0x3,-0x28(%rbx)
   29394:	0f 84 0a 47 00 00    	je     2daa4 <JS_CallInternal+0x8a94>
   2939a:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   2939e:	48 8b 53 d8          	mov    -0x28(%rbx),%rdx
   293a2:	4c 8d 5b d0          	lea    -0x30(%rbx),%r11
   293a6:	4c 89 e7             	mov    %r12,%rdi
   293a9:	4c 89 9d 10 fe ff ff 	mov    %r11,-0x1f0(%rbp)
   293b0:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   293b6:	e8 a5 67 04 00       	call   6fb60 <JS_HasProperty>
   293bb:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   293c1:	4c 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%r11
   293c8:	85 c0                	test   %eax,%eax
   293ca:	0f 8e 91 50 00 00    	jle    2e461 <JS_CallInternal+0x9451>
   293d0:	48 83 ec 08          	sub    $0x8,%rsp
   293d4:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   293d8:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   293dc:	4c 89 e7             	mov    %r12,%rdi
   293df:	49 8b 33             	mov    (%r11),%rsi
   293e2:	49 8b 53 08          	mov    0x8(%r11),%rdx
   293e6:	68 00 80 00 00       	push   $0x8000
   293eb:	41 ff 73 08          	push   0x8(%r11)
   293ef:	41 ff 33             	push   (%r11)
   293f2:	4c 89 9d 10 fe ff ff 	mov    %r11,-0x1f0(%rbp)
   293f9:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   293ff:	e8 4c 72 00 00       	call   30650 <JS_SetPropertyInternal>
   29404:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2940a:	48 83 c4 20          	add    $0x20,%rsp
   2940e:	4c 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%r11
   29415:	89 c3                	mov    %eax,%ebx
   29417:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2941d:	0f 8f 75 33 00 00    	jg     2c798 <JS_CallInternal+0x7788>
   29423:	49 8b 47 08          	mov    0x8(%r15),%rax
   29427:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2942a:	76 14                	jbe    29440 <JS_CallInternal+0x4430>
   2942c:	49 8b 0f             	mov    (%r15),%rcx
   2942f:	8b 71 fc             	mov    -0x4(%rcx),%esi
   29432:	8d 56 ff             	lea    -0x1(%rsi),%edx
   29435:	89 51 fc             	mov    %edx,-0x4(%rcx)
   29438:	85 d2                	test   %edx,%edx
   2943a:	0f 8e d6 46 00 00    	jle    2db16 <JS_CallInternal+0x8b06>
   29440:	49 8b 43 08          	mov    0x8(%r11),%rax
   29444:	83 f8 f6             	cmp    $0xfffffff6,%eax
   29447:	76 14                	jbe    2945d <JS_CallInternal+0x444d>
   29449:	49 8b 0b             	mov    (%r11),%rcx
   2944c:	8b 51 fc             	mov    -0x4(%rcx),%edx
   2944f:	83 ea 01             	sub    $0x1,%edx
   29452:	89 51 fc             	mov    %edx,-0x4(%rcx)
   29455:	85 d2                	test   %edx,%edx
   29457:	0f 8e 93 4e 00 00    	jle    2e2f0 <JS_CallInternal+0x92e0>
   2945d:	85 db                	test   %ebx,%ebx
   2945f:	0f 88 d0 4f 00 00    	js     2e435 <JS_CallInternal+0x9425>
   29465:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2946a:	4c 89 db             	mov    %r11,%rbx
   2946d:	49 83 c5 01          	add    $0x1,%r13
   29471:	49 89 c2             	mov    %rax,%r10
   29474:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29478:	ff e0                	jmp    *%rax
   2947a:	f3 0f 1e fa          	endbr64
   2947e:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   29482:	41 8b 4d 00          	mov    0x0(%r13),%ecx
   29486:	4d 8d 7d 04          	lea    0x4(%r13),%r15
   2948a:	4c 8b 4b f0          	mov    -0x10(%rbx),%r9
   2948e:	83 f8 ff             	cmp    $0xffffffff,%eax
   29491:	0f 85 95 24 00 00    	jne    2b92c <JS_CallInternal+0x691c>
   29497:	4c 89 cf             	mov    %r9,%rdi
   2949a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   294a0:	4c 8b 47 18          	mov    0x18(%rdi),%r8
   294a4:	41 8b 70 18          	mov    0x18(%r8),%esi
   294a8:	89 f2                	mov    %esi,%edx
   294aa:	21 ca                	and    %ecx,%edx
   294ac:	41 8b 54 90 38       	mov    0x38(%r8,%rdx,4),%edx
   294b1:	48 85 d2             	test   %rdx,%rdx
   294b4:	0f 84 6b 1e 00 00    	je     2b325 <JS_CallInternal+0x6315>
   294ba:	4c 8d 14 b5 3c 00 00 	lea    0x3c(,%rsi,4),%r10
   294c1:	00 
   294c2:	48 83 ea 01          	sub    $0x1,%rdx
   294c6:	49 8d 34 d2          	lea    (%r10,%rdx,8),%rsi
   294ca:	4c 01 c6             	add    %r8,%rsi
   294cd:	3b 4e 04             	cmp    0x4(%rsi),%ecx
   294d0:	0f 85 41 1e 00 00    	jne    2b317 <JS_CallInternal+0x6307>
   294d6:	48 8b 7f 20          	mov    0x20(%rdi),%rdi
   294da:	80 7e 03 3f          	cmpb   $0x3f,0x3(%rsi)
   294de:	0f 87 48 24 00 00    	ja     2b92c <JS_CallInternal+0x691c>
   294e4:	48 c1 e2 04          	shl    $0x4,%rdx
   294e8:	48 01 d7             	add    %rdx,%rdi
   294eb:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   294ef:	48 8b 07             	mov    (%rdi),%rax
   294f2:	83 fa f6             	cmp    $0xfffffff6,%edx
   294f5:	76 04                	jbe    294fb <JS_CallInternal+0x44eb>
   294f7:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   294fb:	48 89 03             	mov    %rax,(%rbx)
   294fe:	49 83 c5 05          	add    $0x5,%r13
   29502:	48 83 c3 10          	add    $0x10,%rbx
   29506:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2950a:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2950f:	49 89 c2             	mov    %rax,%r10
   29512:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29516:	ff e0                	jmp    *%rax
   29518:	f3 0f 1e fa          	endbr64
   2951c:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   29520:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   29524:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   29528:	4c 8b 7b f8          	mov    -0x8(%rbx),%r15
   2952c:	85 d2                	test   %edx,%edx
   2952e:	0f 85 64 4c 00 00    	jne    2e198 <JS_CallInternal+0x9188>
   29534:	45 85 ff             	test   %r15d,%r15d
   29537:	0f 85 ab 27 00 00    	jne    2bce8 <JS_CallInternal+0x6cd8>
   2953d:	31 c9                	xor    %ecx,%ecx
   2953f:	44 39 c7             	cmp    %r8d,%edi
   29542:	0f 94 c1             	sete   %cl
   29545:	48 63 c9             	movslq %ecx,%rcx
   29548:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   2954f:	00 
   29550:	48 89 4b e0          	mov    %rcx,-0x20(%rbx)
   29554:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   29559:	48 83 eb 10          	sub    $0x10,%rbx
   2955d:	49 83 c5 01          	add    $0x1,%r13
   29561:	49 89 c2             	mov    %rax,%r10
   29564:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29568:	ff e0                	jmp    *%rax
   2956a:	f3 0f 1e fa          	endbr64
   2956e:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   29572:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   29576:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   2957a:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2957e:	89 cf                	mov    %ecx,%edi
   29580:	09 f7                	or     %esi,%edi
   29582:	0f 85 15 41 00 00    	jne    2d69d <JS_CallInternal+0x868d>
   29588:	39 c2                	cmp    %eax,%edx
   2958a:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   29591:	00 
   29592:	0f 9d c0             	setge  %al
   29595:	48 83 eb 10          	sub    $0x10,%rbx
   29599:	0f b6 c0             	movzbl %al,%eax
   2959c:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   295a0:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   295a5:	49 83 c5 01          	add    $0x1,%r13
   295a9:	49 89 c2             	mov    %rax,%r10
   295ac:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   295b0:	ff e0                	jmp    *%rax
   295b2:	f3 0f 1e fa          	endbr64
   295b6:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   295ba:	0b 53 e8             	or     -0x18(%rbx),%edx
   295bd:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   295c1:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   295c5:	0f 85 b3 4a 00 00    	jne    2e07e <JS_CallInternal+0x906e>
   295cb:	09 c8                	or     %ecx,%eax
   295cd:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   295d4:	00 
   295d5:	48 83 eb 10          	sub    $0x10,%rbx
   295d9:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   295dd:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   295e2:	49 83 c5 01          	add    $0x1,%r13
   295e6:	49 89 c2             	mov    %rax,%r10
   295e9:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   295ed:	ff e0                	jmp    *%rax
   295ef:	f3 0f 1e fa          	endbr64
   295f3:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   295f7:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   295fb:	83 fa 02             	cmp    $0x2,%edx
   295fe:	0f 87 a7 25 00 00    	ja     2bbab <JS_CallInternal+0x6b9b>
   29604:	85 c0                	test   %eax,%eax
   29606:	0f 84 ac 50 00 00    	je     2e6b8 <JS_CallInternal+0x96a8>
   2960c:	3d 00 00 00 80       	cmp    $0x80000000,%eax
   29611:	0f 84 66 53 00 00    	je     2e97d <JS_CallInternal+0x996d>
   29617:	f7 d8                	neg    %eax
   29619:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   29620:	00 
   29621:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29625:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2962a:	49 83 c5 01          	add    $0x1,%r13
   2962e:	49 89 c2             	mov    %rax,%r10
   29631:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29635:	ff e0                	jmp    *%rax
   29637:	f3 0f 1e fa          	endbr64
   2963b:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2963f:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   29643:	a9 f7 ff ff ff       	test   $0xfffffff7,%eax
   29648:	74 1b                	je     29665 <JS_CallInternal+0x4655>
   2964a:	83 e8 01             	sub    $0x1,%eax
   2964d:	83 f8 01             	cmp    $0x1,%eax
   29650:	0f 87 8d 34 00 00    	ja     2cae3 <JS_CallInternal+0x7ad3>
   29656:	83 e2 ff             	and    $0xffffffff,%edx
   29659:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   29660:	00 
   29661:	48 89 53 f0          	mov    %rdx,-0x10(%rbx)
   29665:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2966a:	49 83 c5 01          	add    $0x1,%r13
   2966e:	49 89 c2             	mov    %rax,%r10
   29671:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29675:	ff e0                	jmp    *%rax
   29677:	f3 0f 1e fa          	endbr64
   2967b:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   29682:	44 89 d2             	mov    %r10d,%edx
   29685:	48 89 de             	mov    %rbx,%rsi
   29688:	4c 89 e7             	mov    %r12,%rdi
   2968b:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2968f:	e8 9c c4 02 00       	call   55b30 <js_binary_arith_slow>
   29694:	85 c0                	test   %eax,%eax
   29696:	0f 85 05 56 00 00    	jne    2eca1 <JS_CallInternal+0x9c91>
   2969c:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   296a1:	48 83 eb 10          	sub    $0x10,%rbx
   296a5:	49 83 c5 01          	add    $0x1,%r13
   296a9:	49 89 c2             	mov    %rax,%r10
   296ac:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   296b0:	ff e0                	jmp    *%rax
   296b2:	f3 0f 1e fa          	endbr64
   296b6:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   296ba:	0b 43 e8             	or     -0x18(%rbx),%eax
   296bd:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   296c1:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   296c5:	75 b4                	jne    2967b <JS_CallInternal+0x466b>
   296c7:	89 c8                	mov    %ecx,%eax
   296c9:	89 d6                	mov    %edx,%esi
   296cb:	85 c9                	test   %ecx,%ecx
   296cd:	78 ac                	js     2967b <JS_CallInternal+0x466b>
   296cf:	85 d2                	test   %edx,%edx
   296d1:	7e a8                	jle    2967b <JS_CallInternal+0x466b>
   296d3:	99                   	cltd
   296d4:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   296db:	00 
   296dc:	49 83 c5 01          	add    $0x1,%r13
   296e0:	48 83 eb 10          	sub    $0x10,%rbx
   296e4:	f7 fe                	idiv   %esi
   296e6:	48 63 d2             	movslq %edx,%rdx
   296e9:	48 89 53 f0          	mov    %rdx,-0x10(%rbx)
   296ed:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   296f2:	49 89 c2             	mov    %rax,%r10
   296f5:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   296f9:	ff e0                	jmp    *%rax
   296fb:	f3 0f 1e fa          	endbr64
   296ff:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   29703:	0b 43 e8             	or     -0x18(%rbx),%eax
   29706:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   2970a:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2970e:	0f 85 67 ff ff ff    	jne    2967b <JS_CallInternal+0x466b>
   29714:	66 0f ef c0          	pxor   %xmm0,%xmm0
   29718:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2971c:	f2 0f 2a c1          	cvtsi2sd %ecx,%xmm0
   29720:	f2 0f 2a ca          	cvtsi2sd %edx,%xmm1
   29724:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
   29728:	66 0f 2f 05 10 4d 0b 	comisd 0xb4d10(%rip),%xmm0        # de440 <__PRETTY_FUNCTION__.0+0xc0>
   2972f:	00 
   29730:	66 48 0f 7e c0       	movq   %xmm0,%rax
   29735:	0f 82 d7 20 00 00    	jb     2b812 <JS_CallInternal+0x6802>
   2973b:	f2 0f 10 0d 05 4d 0b 	movsd  0xb4d05(%rip),%xmm1        # de448 <__PRETTY_FUNCTION__.0+0xc8>
   29742:	00 
   29743:	66 0f 2f c8          	comisd %xmm0,%xmm1
   29747:	0f 82 c5 20 00 00    	jb     2b812 <JS_CallInternal+0x6802>
   2974d:	f2 0f 2c c8          	cvttsd2si %xmm0,%ecx
   29751:	66 0f ef ff          	pxor   %xmm7,%xmm7
   29755:	ba 08 00 00 00       	mov    $0x8,%edx
   2975a:	f2 0f 2a f9          	cvtsi2sd %ecx,%xmm7
   2975e:	66 48 0f 7e fe       	movq   %xmm7,%rsi
   29763:	89 c9                	mov    %ecx,%ecx
   29765:	48 39 f0             	cmp    %rsi,%rax
   29768:	be 00 00 00 00       	mov    $0x0,%esi
   2976d:	48 0f 44 d6          	cmove  %rsi,%rdx
   29771:	48 0f 44 c1          	cmove  %rcx,%rax
   29775:	48 89 43 e0          	mov    %rax,-0x20(%rbx)
   29779:	49 83 c5 01          	add    $0x1,%r13
   2977d:	48 83 eb 10          	sub    $0x10,%rbx
   29781:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   29785:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2978a:	49 89 c2             	mov    %rax,%r10
   2978d:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29791:	ff e0                	jmp    *%rax
   29793:	f3 0f 1e fa          	endbr64
   29797:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2979b:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   2979f:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   297a3:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   297a7:	89 c7                	mov    %eax,%edi
   297a9:	09 f7                	or     %esi,%edi
   297ab:	0f 85 bb 41 00 00    	jne    2d96c <JS_CallInternal+0x895c>
   297b1:	48 63 f2             	movslq %edx,%rsi
   297b4:	48 63 c1             	movslq %ecx,%rax
   297b7:	48 0f af c6          	imul   %rsi,%rax
   297bb:	48 63 f0             	movslq %eax,%rsi
   297be:	48 39 c6             	cmp    %rax,%rsi
   297c1:	0f 85 09 41 00 00    	jne    2d8d0 <JS_CallInternal+0x88c0>
   297c7:	48 85 f6             	test   %rsi,%rsi
   297ca:	0f 84 1e 4e 00 00    	je     2e5ee <JS_CallInternal+0x95de>
   297d0:	83 e0 ff             	and    $0xffffffff,%eax
   297d3:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   297da:	00 
   297db:	48 83 eb 10          	sub    $0x10,%rbx
   297df:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   297e3:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   297e8:	49 83 c5 01          	add    $0x1,%r13
   297ec:	49 89 c2             	mov    %rax,%r10
   297ef:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   297f3:	ff e0                	jmp    *%rax
   297f5:	f3 0f 1e fa          	endbr64
   297f9:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   297fd:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   29801:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   29805:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   29809:	89 c6                	mov    %eax,%esi
   2980b:	09 d6                	or     %edx,%esi
   2980d:	0f 85 1c 41 00 00    	jne    2d92f <JS_CallInternal+0x891f>
   29813:	89 fa                	mov    %edi,%edx
   29815:	48 63 f1             	movslq %ecx,%rsi
   29818:	48 63 c7             	movslq %edi,%rax
   2981b:	29 ca                	sub    %ecx,%edx
   2981d:	48 29 f0             	sub    %rsi,%rax
   29820:	48 63 ca             	movslq %edx,%rcx
   29823:	48 39 c1             	cmp    %rax,%rcx
   29826:	0f 85 e8 40 00 00    	jne    2d914 <JS_CallInternal+0x8904>
   2982c:	89 d0                	mov    %edx,%eax
   2982e:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   29835:	00 
   29836:	48 89 43 e0          	mov    %rax,-0x20(%rbx)
   2983a:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2983f:	48 83 eb 10          	sub    $0x10,%rbx
   29843:	49 83 c5 01          	add    $0x1,%r13
   29847:	49 89 c2             	mov    %rax,%r10
   2984a:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2984e:	ff e0                	jmp    *%rax
   29850:	f3 0f 1e fa          	endbr64
   29854:	45 0f b6 4d 00       	movzbl 0x0(%r13),%r9d
   29859:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2985d:	4d 8d 7d 01          	lea    0x1(%r13),%r15
   29861:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   29865:	49 c1 e1 04          	shl    $0x4,%r9
   29869:	4c 03 8d a0 fe ff ff 	add    -0x160(%rbp),%r9
   29870:	89 ce                	mov    %ecx,%esi
   29872:	49 8b 41 08          	mov    0x8(%r9),%rax
   29876:	09 c6                	or     %eax,%esi
   29878:	0f 85 0f 3d 00 00    	jne    2d58d <JS_CallInternal+0x857d>
   2987e:	49 8b 01             	mov    (%r9),%rax
   29881:	48 63 f2             	movslq %edx,%rsi
   29884:	48 63 c8             	movslq %eax,%rcx
   29887:	01 d0                	add    %edx,%eax
   29889:	48 01 f1             	add    %rsi,%rcx
   2988c:	48 63 d0             	movslq %eax,%rdx
   2988f:	48 39 ca             	cmp    %rcx,%rdx
   29892:	0f 85 dd 3c 00 00    	jne    2d575 <JS_CallInternal+0x8565>
   29898:	89 c0                	mov    %eax,%eax
   2989a:	49 89 01             	mov    %rax,(%r9)
   2989d:	31 c0                	xor    %eax,%eax
   2989f:	49 89 41 08          	mov    %rax,0x8(%r9)
   298a3:	48 83 eb 10          	sub    $0x10,%rbx
   298a7:	41 0f b6 45 01       	movzbl 0x1(%r13),%eax
   298ac:	49 83 c5 02          	add    $0x2,%r13
   298b0:	49 89 c2             	mov    %rax,%r10
   298b3:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   298b7:	ff e0                	jmp    *%rax
   298b9:	f3 0f 1e fa          	endbr64
   298bd:	44 8b 4b f8          	mov    -0x8(%rbx),%r9d
   298c1:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   298c5:	45 85 c9             	test   %r9d,%r9d
   298c8:	0f 85 00 25 00 00    	jne    2bdce <JS_CallInternal+0x6dbe>
   298ce:	3d 00 00 00 80       	cmp    $0x80000000,%eax
   298d3:	0f 84 f5 24 00 00    	je     2bdce <JS_CallInternal+0x6dbe>
   298d9:	83 e8 01             	sub    $0x1,%eax
   298dc:	48 c7 43 08 00 00 00 	movq   $0x0,0x8(%rbx)
   298e3:	00 
   298e4:	48 89 03             	mov    %rax,(%rbx)
   298e7:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   298ec:	48 83 c3 10          	add    $0x10,%rbx
   298f0:	49 83 c5 01          	add    $0x1,%r13
   298f4:	49 89 c2             	mov    %rax,%r10
   298f7:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   298fb:	ff e0                	jmp    *%rax
   298fd:	f3 0f 1e fa          	endbr64
   29901:	44 8b 5b f8          	mov    -0x8(%rbx),%r11d
   29905:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   29909:	45 85 db             	test   %r11d,%r11d
   2990c:	0f 85 36 24 00 00    	jne    2bd48 <JS_CallInternal+0x6d38>
   29912:	3d ff ff ff 7f       	cmp    $0x7fffffff,%eax
   29917:	0f 84 2b 24 00 00    	je     2bd48 <JS_CallInternal+0x6d38>
   2991d:	83 c0 01             	add    $0x1,%eax
   29920:	48 c7 43 08 00 00 00 	movq   $0x0,0x8(%rbx)
   29927:	00 
   29928:	48 89 03             	mov    %rax,(%rbx)
   2992b:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   29930:	48 83 c3 10          	add    $0x10,%rbx
   29934:	49 83 c5 01          	add    $0x1,%r13
   29938:	49 89 c2             	mov    %rax,%r10
   2993b:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2993f:	ff e0                	jmp    *%rax
   29941:	f3 0f 1e fa          	endbr64
   29945:	41 0f b6 4d 00       	movzbl 0x0(%r13),%ecx
   2994a:	4d 8d 7d 01          	lea    0x1(%r13),%r15
   2994e:	48 c1 e1 04          	shl    $0x4,%rcx
   29952:	48 03 8d a0 fe ff ff 	add    -0x160(%rbp),%rcx
   29959:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   2995d:	48 8b 01             	mov    (%rcx),%rax
   29960:	85 d2                	test   %edx,%edx
   29962:	0f 85 34 21 00 00    	jne    2ba9c <JS_CallInternal+0x6a8c>
   29968:	3d 00 00 00 80       	cmp    $0x80000000,%eax
   2996d:	0f 84 29 21 00 00    	je     2ba9c <JS_CallInternal+0x6a8c>
   29973:	83 e8 01             	sub    $0x1,%eax
   29976:	48 c7 41 08 00 00 00 	movq   $0x0,0x8(%rcx)
   2997d:	00 
   2997e:	48 89 01             	mov    %rax,(%rcx)
   29981:	41 0f b6 45 01       	movzbl 0x1(%r13),%eax
   29986:	49 83 c5 02          	add    $0x2,%r13
   2998a:	49 89 c2             	mov    %rax,%r10
   2998d:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29991:	ff e0                	jmp    *%rax
   29993:	f3 0f 1e fa          	endbr64
   29997:	44 8b 7b f8          	mov    -0x8(%rbx),%r15d
   2999b:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2999f:	45 85 ff             	test   %r15d,%r15d
   299a2:	0f 85 70 23 00 00    	jne    2bd18 <JS_CallInternal+0x6d08>
   299a8:	3d 00 00 00 80       	cmp    $0x80000000,%eax
   299ad:	0f 84 65 23 00 00    	je     2bd18 <JS_CallInternal+0x6d08>
   299b3:	83 e8 01             	sub    $0x1,%eax
   299b6:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   299bd:	00 
   299be:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   299c2:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   299c7:	49 83 c5 01          	add    $0x1,%r13
   299cb:	49 89 c2             	mov    %rax,%r10
   299ce:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   299d2:	ff e0                	jmp    *%rax
   299d4:	f3 0f 1e fa          	endbr64
   299d8:	44 8b 43 f8          	mov    -0x8(%rbx),%r8d
   299dc:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   299e0:	45 85 c0             	test   %r8d,%r8d
   299e3:	0f 85 e8 29 00 00    	jne    2c3d1 <JS_CallInternal+0x73c1>
   299e9:	f7 d0                	not    %eax
   299eb:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   299f2:	00 
   299f3:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   299f7:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   299fc:	49 83 c5 01          	add    $0x1,%r13
   29a00:	49 89 c2             	mov    %rax,%r10
   29a03:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29a07:	ff e0                	jmp    *%rax
   29a09:	f3 0f 1e fa          	endbr64
   29a0d:	8b 53 f8             	mov    -0x8(%rbx),%edx
   29a10:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   29a14:	85 d2                	test   %edx,%edx
   29a16:	0f 85 5c 23 00 00    	jne    2bd78 <JS_CallInternal+0x6d68>
   29a1c:	3d ff ff ff 7f       	cmp    $0x7fffffff,%eax
   29a21:	0f 84 51 23 00 00    	je     2bd78 <JS_CallInternal+0x6d68>
   29a27:	83 c0 01             	add    $0x1,%eax
   29a2a:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   29a31:	00 
   29a32:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29a36:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   29a3b:	49 83 c5 01          	add    $0x1,%r13
   29a3f:	49 89 c2             	mov    %rax,%r10
   29a42:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29a46:	ff e0                	jmp    *%rax
   29a48:	f3 0f 1e fa          	endbr64
   29a4c:	41 0f b6 4d 00       	movzbl 0x0(%r13),%ecx
   29a51:	4d 8d 7d 01          	lea    0x1(%r13),%r15
   29a55:	48 c1 e1 04          	shl    $0x4,%rcx
   29a59:	48 03 8d a0 fe ff ff 	add    -0x160(%rbp),%rcx
   29a60:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   29a64:	48 8b 01             	mov    (%rcx),%rax
   29a67:	85 d2                	test   %edx,%edx
   29a69:	0f 85 97 1f 00 00    	jne    2ba06 <JS_CallInternal+0x69f6>
   29a6f:	3d ff ff ff 7f       	cmp    $0x7fffffff,%eax
   29a74:	0f 84 8c 1f 00 00    	je     2ba06 <JS_CallInternal+0x69f6>
   29a7a:	83 c0 01             	add    $0x1,%eax
   29a7d:	48 c7 41 08 00 00 00 	movq   $0x0,0x8(%rcx)
   29a84:	00 
   29a85:	48 89 01             	mov    %rax,(%rcx)
   29a88:	41 0f b6 45 01       	movzbl 0x1(%r13),%eax
   29a8d:	49 83 c5 02          	add    $0x2,%r13
   29a91:	49 89 c2             	mov    %rax,%r10
   29a94:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29a98:	ff e0                	jmp    *%rax
   29a9a:	f3 0f 1e fa          	endbr64
   29a9e:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   29aa5:	48 89 de             	mov    %rbx,%rsi
   29aa8:	4c 89 e7             	mov    %r12,%rdi
   29aab:	4c 89 68 30          	mov    %r13,0x30(%rax)
   29aaf:	e8 5c b5 07 00       	call   a5010 <js_append_enumerate>
   29ab4:	85 c0                	test   %eax,%eax
   29ab6:	0f 85 1f 59 00 00    	jne    2f3db <JS_CallInternal+0xa3cb>
   29abc:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   29ac0:	48 83 eb 10          	sub    $0x10,%rbx
   29ac4:	83 f8 f6             	cmp    $0xfffffff6,%eax
   29ac7:	76 14                	jbe    29add <JS_CallInternal+0x4acd>
   29ac9:	48 8b 0b             	mov    (%rbx),%rcx
   29acc:	8b 51 fc             	mov    -0x4(%rcx),%edx
   29acf:	83 ea 01             	sub    $0x1,%edx
   29ad2:	89 51 fc             	mov    %edx,-0x4(%rcx)
   29ad5:	85 d2                	test   %edx,%edx
   29ad7:	0f 8e 47 37 00 00    	jle    2d224 <JS_CallInternal+0x8214>
   29add:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   29ae2:	49 83 c5 01          	add    $0x1,%r13
   29ae6:	49 89 c2             	mov    %rax,%r10
   29ae9:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29aed:	ff e0                	jmp    *%rax
   29aef:	f3 0f 1e fa          	endbr64
   29af3:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   29af7:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   29afb:	45 31 c9             	xor    %r9d,%r9d
   29afe:	4c 89 e7             	mov    %r12,%rdi
   29b01:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   29b08:	48 8b 4b d0          	mov    -0x30(%rbx),%rcx
   29b0c:	48 c7 85 b0 fd ff ff 	movq   $0x0,-0x250(%rbp)
   29b13:	00 00 00 00 
   29b17:	48 c7 85 b8 fd ff ff 	movq   $0x3,-0x248(%rbp)
   29b1e:	03 00 00 00 
   29b22:	4c 8b 43 d8          	mov    -0x28(%rbx),%r8
   29b26:	4c 89 68 30          	mov    %r13,0x30(%rax)
   29b2a:	48 c7 43 f0 00 00 00 	movq   $0x0,-0x10(%rbx)
   29b31:	00 
   29b32:	48 c7 43 f8 03 00 00 	movq   $0x3,-0x8(%rbx)
   29b39:	00 
   29b3a:	6a 02                	push   $0x2
   29b3c:	6a 00                	push   $0x0
   29b3e:	ff b5 b8 fd ff ff    	push   -0x248(%rbp)
   29b44:	ff b5 b0 fd ff ff    	push   -0x250(%rbp)
   29b4a:	e8 c1 b4 ff ff       	call   25010 <JS_CallInternal>
   29b4f:	48 83 c4 20          	add    $0x20,%rsp
   29b53:	83 fa 06             	cmp    $0x6,%edx
   29b56:	0f 84 fa 40 00 00    	je     2dc56 <JS_CallInternal+0x8c46>
   29b5c:	48 89 03             	mov    %rax,(%rbx)
   29b5f:	49 83 c5 01          	add    $0x1,%r13
   29b63:	48 83 c3 10          	add    $0x10,%rbx
   29b67:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   29b6b:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   29b70:	49 89 c2             	mov    %rax,%r10
   29b73:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29b77:	ff e0                	jmp    *%rax
   29b79:	f3 0f 1e fa          	endbr64
   29b7d:	41 0f b6 4d 00       	movzbl 0x0(%r13),%ecx
   29b82:	41 ba fd ff ff ff    	mov    $0xfffffffd,%r10d
   29b88:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   29b8f:	4d 8d 7d 01          	lea    0x1(%r13),%r15
   29b93:	c7 85 dc fe ff ff 01 	movl   $0x1,-0x124(%rbp)
   29b9a:	00 00 00 
   29b9d:	41 29 ca             	sub    %ecx,%r10d
   29ba0:	4c 89 78 30          	mov    %r15,0x30(%rax)
   29ba4:	4d 63 d2             	movslq %r10d,%r10
   29ba7:	49 c1 e2 04          	shl    $0x4,%r10
   29bab:	49 01 da             	add    %rbx,%r10
   29bae:	49 8b 52 08          	mov    0x8(%r10),%rdx
   29bb2:	83 fa 03             	cmp    $0x3,%edx
   29bb5:	0f 84 a9 3f 00 00    	je     2db64 <JS_CallInternal+0x8b54>
   29bbb:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
   29bc0:	49 8b 32             	mov    (%r10),%rsi
   29bc3:	4c 89 e7             	mov    %r12,%rdi
   29bc6:	4c 8d 8d dc fe ff ff 	lea    -0x124(%rbp),%r9
   29bcd:	29 c8                	sub    %ecx,%eax
   29bcf:	4c 89 95 30 fe ff ff 	mov    %r10,-0x1d0(%rbp)
   29bd6:	48 98                	cltq
   29bd8:	48 c1 e0 04          	shl    $0x4,%rax
   29bdc:	48 01 d8             	add    %rbx,%rax
   29bdf:	48 8b 08             	mov    (%rax),%rcx
   29be2:	4c 8b 40 08          	mov    0x8(%rax),%r8
   29be6:	e8 35 6f 07 00       	call   a0b20 <JS_IteratorNext.constprop.0>
   29beb:	4c 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%r10
   29bf2:	48 89 c1             	mov    %rax,%rcx
   29bf5:	83 fa 06             	cmp    $0x6,%edx
   29bf8:	48 89 d0             	mov    %rdx,%rax
   29bfb:	48 89 d6             	mov    %rdx,%rsi
   29bfe:	48 89 cf             	mov    %rcx,%rdi
   29c01:	0f 84 32 3f 00 00    	je     2db39 <JS_CallInternal+0x8b29>
   29c07:	44 8b 85 dc fe ff ff 	mov    -0x124(%rbp),%r8d
   29c0e:	31 d2                	xor    %edx,%edx
   29c10:	45 85 c0             	test   %r8d,%r8d
   29c13:	0f 85 64 2e 00 00    	jne    2ca7d <JS_CallInternal+0x7a6d>
   29c19:	48 89 3b             	mov    %rdi,(%rbx)
   29c1c:	49 83 c5 02          	add    $0x2,%r13
   29c20:	48 83 c3 20          	add    $0x20,%rbx
   29c24:	48 89 73 e8          	mov    %rsi,-0x18(%rbx)
   29c28:	48 89 53 f0          	mov    %rdx,-0x10(%rbx)
   29c2c:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   29c33:	00 
   29c34:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   29c39:	49 89 c2             	mov    %rax,%r10
   29c3c:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29c40:	ff e0                	jmp    *%rax
   29c42:	f3 0f 1e fa          	endbr64
   29c46:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   29c4d:	31 d2                	xor    %edx,%edx
   29c4f:	48 89 de             	mov    %rbx,%rsi
   29c52:	4c 89 e7             	mov    %r12,%rdi
   29c55:	4c 89 68 30          	mov    %r13,0x30(%rax)
   29c59:	e8 52 57 07 00       	call   9f3b0 <js_for_of_start>
   29c5e:	85 c0                	test   %eax,%eax
   29c60:	0f 85 27 53 00 00    	jne    2ef8d <JS_CallInternal+0x9f7d>
   29c66:	48 c7 43 10 00 00 00 	movq   $0x0,0x10(%rbx)
   29c6d:	00 
   29c6e:	49 83 c5 01          	add    $0x1,%r13
   29c72:	48 83 c3 20          	add    $0x20,%rbx
   29c76:	48 c7 43 f8 05 00 00 	movq   $0x5,-0x8(%rbx)
   29c7d:	00 
   29c7e:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   29c83:	49 89 c2             	mov    %rax,%r10
   29c86:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29c8a:	ff e0                	jmp    *%rax
   29c8c:	f3 0f 1e fa          	endbr64
   29c90:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   29c97:	48 89 de             	mov    %rbx,%rsi
   29c9a:	4c 89 e7             	mov    %r12,%rdi
   29c9d:	4c 89 68 30          	mov    %r13,0x30(%rax)
   29ca1:	e8 fa b5 05 00       	call   852a0 <js_for_in_next>
   29ca6:	85 c0                	test   %eax,%eax
   29ca8:	0f 85 eb 4f 00 00    	jne    2ec99 <JS_CallInternal+0x9c89>
   29cae:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   29cb3:	48 83 c3 20          	add    $0x20,%rbx
   29cb7:	49 83 c5 01          	add    $0x1,%r13
   29cbb:	49 89 c2             	mov    %rax,%r10
   29cbe:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29cc2:	ff e0                	jmp    *%rax
   29cc4:	f3 0f 1e fa          	endbr64
   29cc8:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   29ccc:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   29cd0:	4c 89 e7             	mov    %r12,%rdi
   29cd3:	4d 89 ef             	mov    %r13,%r15
   29cd6:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   29cdd:	4c 89 68 30          	mov    %r13,0x30(%rax)
   29ce1:	e8 2a 5a 04 00       	call   6f710 <build_for_in_iterator>
   29ce6:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29cea:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   29cee:	83 7b f8 06          	cmpl   $0x6,-0x8(%rbx)
   29cf2:	0f 84 48 ba ff ff    	je     25740 <JS_CallInternal+0x730>
   29cf8:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   29cfd:	49 83 c5 01          	add    $0x1,%r13
   29d01:	49 89 c2             	mov    %rax,%r10
   29d04:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29d08:	ff e0                	jmp    *%rax
   29d0a:	f3 0f 1e fa          	endbr64
   29d0e:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   29d12:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   29d16:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   29d1a:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   29d1e:	89 cf                	mov    %ecx,%edi
   29d20:	09 f7                	or     %esi,%edi
   29d22:	0f 85 36 3f 00 00    	jne    2dc5e <JS_CallInternal+0x8c4e>
   29d28:	39 d0                	cmp    %edx,%eax
   29d2a:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   29d31:	00 
   29d32:	0f 9c c0             	setl   %al
   29d35:	48 83 eb 10          	sub    $0x10,%rbx
   29d39:	0f b6 c0             	movzbl %al,%eax
   29d3c:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29d40:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   29d45:	49 83 c5 01          	add    $0x1,%r13
   29d49:	49 89 c2             	mov    %rax,%r10
   29d4c:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29d50:	ff e0                	jmp    *%rax
   29d52:	f3 0f 1e fa          	endbr64
   29d56:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   29d5a:	0b 53 e8             	or     -0x18(%rbx),%edx
   29d5d:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   29d61:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   29d65:	0f 85 0a 3e 00 00    	jne    2db75 <JS_CallInternal+0x8b65>
   29d6b:	31 c8                	xor    %ecx,%eax
   29d6d:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   29d74:	00 
   29d75:	48 83 eb 10          	sub    $0x10,%rbx
   29d79:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29d7d:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   29d82:	49 83 c5 01          	add    $0x1,%r13
   29d86:	49 89 c2             	mov    %rax,%r10
   29d89:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29d8d:	ff e0                	jmp    *%rax
   29d8f:	f3 0f 1e fa          	endbr64
   29d93:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   29d97:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   29d9b:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   29d9e:	76 04                	jbe    29da4 <JS_CallInternal+0x4d94>
   29da0:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   29da4:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   29dab:	48 8b 40 10          	mov    0x10(%rax),%rax
   29daf:	48 8b 40 18          	mov    0x18(%rax),%rax
   29db3:	48 8b 50 08          	mov    0x8(%rax),%rdx
   29db7:	48 8b 38             	mov    (%rax),%rdi
   29dba:	48 89 48 08          	mov    %rcx,0x8(%rax)
   29dbe:	48 89 30             	mov    %rsi,(%rax)
   29dc1:	83 fa f6             	cmp    $0xfffffff6,%edx
   29dc4:	76 11                	jbe    29dd7 <JS_CallInternal+0x4dc7>
   29dc6:	8b 47 fc             	mov    -0x4(%rdi),%eax
   29dc9:	83 e8 01             	sub    $0x1,%eax
   29dcc:	89 47 fc             	mov    %eax,-0x4(%rdi)
   29dcf:	85 c0                	test   %eax,%eax
   29dd1:	0f 8e 86 35 00 00    	jle    2d35d <JS_CallInternal+0x834d>
   29dd7:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   29ddc:	49 83 c5 01          	add    $0x1,%r13
   29de0:	49 89 c2             	mov    %rax,%r10
   29de3:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29de7:	ff e0                	jmp    *%rax
   29de9:	f3 0f 1e fa          	endbr64
   29ded:	83 7b d8 ff          	cmpl   $0xffffffff,-0x28(%rbx)
   29df1:	0f 85 95 22 00 00    	jne    2c08c <JS_CallInternal+0x707c>
   29df7:	44 8b 7b e8          	mov    -0x18(%rbx),%r15d
   29dfb:	45 85 ff             	test   %r15d,%r15d
   29dfe:	0f 85 88 22 00 00    	jne    2c08c <JS_CallInternal+0x707c>
   29e04:	48 8b 53 d0          	mov    -0x30(%rbx),%rdx
   29e08:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   29e0c:	66 83 7a 12 02       	cmpw   $0x2,0x12(%rdx)
   29e11:	0f 85 75 22 00 00    	jne    2c08c <JS_CallInternal+0x707c>
   29e17:	8b 4a 38             	mov    0x38(%rdx),%ecx
   29e1a:	39 c8                	cmp    %ecx,%eax
   29e1c:	0f 83 78 45 00 00    	jae    2e39a <JS_CallInternal+0x938a>
   29e22:	89 c0                	mov    %eax,%eax
   29e24:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   29e29:	48 c1 e0 04          	shl    $0x4,%rax
   29e2d:	48 03 42 30          	add    0x30(%rdx),%rax
   29e31:	48 8b 50 08          	mov    0x8(%rax),%rdx
   29e35:	48 8b 08             	mov    (%rax),%rcx
   29e38:	0f 11 00             	movups %xmm0,(%rax)
   29e3b:	83 fa f6             	cmp    $0xfffffff6,%edx
   29e3e:	76 11                	jbe    29e51 <JS_CallInternal+0x4e41>
   29e40:	8b 41 fc             	mov    -0x4(%rcx),%eax
   29e43:	83 e8 01             	sub    $0x1,%eax
   29e46:	89 41 fc             	mov    %eax,-0x4(%rcx)
   29e49:	85 c0                	test   %eax,%eax
   29e4b:	0f 8e 37 45 00 00    	jle    2e388 <JS_CallInternal+0x9378>
   29e51:	48 8b 43 d8          	mov    -0x28(%rbx),%rax
   29e55:	48 83 eb 30          	sub    $0x30,%rbx
   29e59:	83 f8 f6             	cmp    $0xfffffff6,%eax
   29e5c:	76 14                	jbe    29e72 <JS_CallInternal+0x4e62>
   29e5e:	48 8b 0b             	mov    (%rbx),%rcx
   29e61:	8b 71 fc             	mov    -0x4(%rcx),%esi
   29e64:	8d 56 ff             	lea    -0x1(%rsi),%edx
   29e67:	89 51 fc             	mov    %edx,-0x4(%rcx)
   29e6a:	85 d2                	test   %edx,%edx
   29e6c:	0f 8e ae 45 00 00    	jle    2e420 <JS_CallInternal+0x9410>
   29e72:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   29e77:	49 83 c5 01          	add    $0x1,%r13
   29e7b:	49 89 c2             	mov    %rax,%r10
   29e7e:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29e82:	ff e0                	jmp    *%rax
   29e84:	f3 0f 1e fa          	endbr64
   29e88:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   29e8c:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   29e90:	4c 89 e7             	mov    %r12,%rdi
   29e93:	4c 8d 7b f0          	lea    -0x10(%rbx),%r15
   29e97:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   29e9e:	4c 89 68 30          	mov    %r13,0x30(%rax)
   29ea2:	e8 c9 c7 01 00       	call   46670 <JS_ValueToAtom>
   29ea7:	89 c1                	mov    %eax,%ecx
   29ea9:	85 c0                	test   %eax,%eax
   29eab:	0f 84 48 3d 00 00    	je     2dbf9 <JS_CallInternal+0x8be9>
   29eb1:	48 83 ec 08          	sub    $0x8,%rsp
   29eb5:	4c 8d 5b d0          	lea    -0x30(%rbx),%r11
   29eb9:	48 8d 43 e0          	lea    -0x20(%rbx),%rax
   29ebd:	4c 8b 43 d0          	mov    -0x30(%rbx),%r8
   29ec1:	4c 89 9d 20 fe ff ff 	mov    %r11,-0x1e0(%rbp)
   29ec8:	4c 8b 4b d8          	mov    -0x28(%rbx),%r9
   29ecc:	4c 89 e7             	mov    %r12,%rdi
   29ecf:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   29ed3:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   29ed7:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   29ede:	6a 00                	push   $0x0
   29ee0:	89 8d f0 fd ff ff    	mov    %ecx,-0x210(%rbp)
   29ee6:	e8 15 5a 00 00       	call   2f900 <JS_GetPropertyInternal>
   29eeb:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   29ef1:	4c 8b 9d 20 fe ff ff 	mov    -0x1e0(%rbp),%r11
   29ef8:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   29eff:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   29f05:	48 89 95 10 fe ff ff 	mov    %rdx,-0x1f0(%rbp)
   29f0c:	58                   	pop    %rax
   29f0d:	5a                   	pop    %rdx
   29f0e:	0f 8f 72 25 00 00    	jg     2c486 <JS_CallInternal+0x7476>
   29f14:	83 bd 10 fe ff ff 06 	cmpl   $0x6,-0x1f0(%rbp)
   29f1b:	0f 84 e0 3c 00 00    	je     2dc01 <JS_CallInternal+0x8bf1>
   29f21:	49 8b 47 08          	mov    0x8(%r15),%rax
   29f25:	83 f8 f6             	cmp    $0xfffffff6,%eax
   29f28:	76 14                	jbe    29f3e <JS_CallInternal+0x4f2e>
   29f2a:	49 8b 0f             	mov    (%r15),%rcx
   29f2d:	8b 71 fc             	mov    -0x4(%rcx),%esi
   29f30:	8d 56 ff             	lea    -0x1(%rsi),%edx
   29f33:	89 51 fc             	mov    %edx,-0x4(%rcx)
   29f36:	85 d2                	test   %edx,%edx
   29f38:	0f 8e 12 37 00 00    	jle    2d650 <JS_CallInternal+0x8640>
   29f3e:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   29f45:	48 8b 41 08          	mov    0x8(%rcx),%rax
   29f49:	83 f8 f6             	cmp    $0xfffffff6,%eax
   29f4c:	76 14                	jbe    29f62 <JS_CallInternal+0x4f52>
   29f4e:	48 8b 09             	mov    (%rcx),%rcx
   29f51:	8b 71 fc             	mov    -0x4(%rcx),%esi
   29f54:	8d 56 ff             	lea    -0x1(%rsi),%edx
   29f57:	89 51 fc             	mov    %edx,-0x4(%rcx)
   29f5a:	85 d2                	test   %edx,%edx
   29f5c:	0f 8e a7 3c 00 00    	jle    2dc09 <JS_CallInternal+0x8bf9>
   29f62:	49 8b 43 08          	mov    0x8(%r11),%rax
   29f66:	83 f8 f6             	cmp    $0xfffffff6,%eax
   29f69:	76 14                	jbe    29f7f <JS_CallInternal+0x4f6f>
   29f6b:	49 8b 0b             	mov    (%r11),%rcx
   29f6e:	8b 71 fc             	mov    -0x4(%rcx),%esi
   29f71:	8d 56 ff             	lea    -0x1(%rsi),%edx
   29f74:	89 51 fc             	mov    %edx,-0x4(%rcx)
   29f77:	85 d2                	test   %edx,%edx
   29f79:	0f 8e e1 35 00 00    	jle    2d560 <JS_CallInternal+0x8550>
   29f7f:	48 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%rax
   29f86:	49 83 c5 01          	add    $0x1,%r13
   29f8a:	48 89 43 d0          	mov    %rax,-0x30(%rbx)
   29f8e:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   29f95:	48 89 43 d8          	mov    %rax,-0x28(%rbx)
   29f99:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   29f9e:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   29fa5:	49 89 c2             	mov    %rax,%r10
   29fa8:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29fac:	ff e0                	jmp    *%rax
   29fae:	f3 0f 1e fa          	endbr64
   29fb2:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   29fb6:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   29fba:	4c 8d 5b f0          	lea    -0x10(%rbx),%r11
   29fbe:	83 f8 f6             	cmp    $0xfffffff6,%eax
   29fc1:	76 04                	jbe    29fc7 <JS_CallInternal+0x4fb7>
   29fc3:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   29fc7:	48 92                	xchg   %rax,%rdx
   29fc9:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   29fcd:	4c 89 e7             	mov    %r12,%rdi
   29fd0:	41 b9 07 40 00 00    	mov    $0x4007,%r9d
   29fd6:	49 89 d0             	mov    %rdx,%r8
   29fd9:	48 8b 53 d8          	mov    -0x28(%rbx),%rdx
   29fdd:	41 ff 73 08          	push   0x8(%r11)
   29fe1:	48 89 c1             	mov    %rax,%rcx
   29fe4:	41 ff 33             	push   (%r11)
   29fe7:	4d 89 ef             	mov    %r13,%r15
   29fea:	4c 89 9d 30 fe ff ff 	mov    %r11,-0x1d0(%rbp)
   29ff1:	e8 4a c8 01 00       	call   46840 <JS_DefinePropertyValueValue>
   29ff6:	5f                   	pop    %rdi
   29ff7:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   29ffe:	41 58                	pop    %r8
   2a000:	85 c0                	test   %eax,%eax
   2a002:	0f 88 38 b7 ff ff    	js     25740 <JS_CallInternal+0x730>
   2a008:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2a00d:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   2a014:	49 83 c5 01          	add    $0x1,%r13
   2a018:	49 89 c2             	mov    %rax,%r10
   2a01b:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a01f:	ff e0                	jmp    *%rax
   2a021:	f3 0f 1e fa          	endbr64
   2a025:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2a029:	0b 53 e8             	or     -0x18(%rbx),%edx
   2a02c:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   2a030:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2a034:	0f 85 39 36 00 00    	jne    2d673 <JS_CallInternal+0x8663>
   2a03a:	d3 f8                	sar    %cl,%eax
   2a03c:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   2a043:	00 
   2a044:	48 83 eb 10          	sub    $0x10,%rbx
   2a048:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2a04c:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2a051:	49 83 c5 01          	add    $0x1,%r13
   2a055:	49 89 c2             	mov    %rax,%r10
   2a058:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a05c:	ff e0                	jmp    *%rax
   2a05e:	f3 0f 1e fa          	endbr64
   2a062:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2a066:	0b 53 e8             	or     -0x18(%rbx),%edx
   2a069:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   2a06d:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2a071:	0f 85 6e 36 00 00    	jne    2d6e5 <JS_CallInternal+0x86d5>
   2a077:	d3 e8                	shr    %cl,%eax
   2a079:	85 c0                	test   %eax,%eax
   2a07b:	0f 88 3b 1e 00 00    	js     2bebc <JS_CallInternal+0x6eac>
   2a081:	66 0f 6e c0          	movd   %eax,%xmm0
   2a085:	31 c0                	xor    %eax,%eax
   2a087:	48 89 43 e8          	mov    %rax,-0x18(%rbx)
   2a08b:	48 83 eb 10          	sub    $0x10,%rbx
   2a08f:	f2 0f 11 43 f0       	movsd  %xmm0,-0x10(%rbx)
   2a094:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2a099:	49 83 c5 01          	add    $0x1,%r13
   2a09d:	49 89 c2             	mov    %rax,%r10
   2a0a0:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a0a4:	ff e0                	jmp    *%rax
   2a0a6:	f3 0f 1e fa          	endbr64
   2a0aa:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2a0ae:	0b 53 e8             	or     -0x18(%rbx),%edx
   2a0b1:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   2a0b5:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2a0b9:	0f 85 6d 3b 00 00    	jne    2dc2c <JS_CallInternal+0x8c1c>
   2a0bf:	21 c8                	and    %ecx,%eax
   2a0c1:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   2a0c8:	00 
   2a0c9:	48 83 eb 10          	sub    $0x10,%rbx
   2a0cd:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2a0d1:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2a0d6:	49 83 c5 01          	add    $0x1,%r13
   2a0da:	49 89 c2             	mov    %rax,%r10
   2a0dd:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a0e1:	ff e0                	jmp    *%rax
   2a0e3:	f3 0f 1e fa          	endbr64
   2a0e7:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2a0eb:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   2a0ef:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   2a0f3:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2a0f7:	89 cf                	mov    %ecx,%edi
   2a0f9:	09 f7                	or     %esi,%edi
   2a0fb:	0f 85 0b 36 00 00    	jne    2d70c <JS_CallInternal+0x86fc>
   2a101:	39 d0                	cmp    %edx,%eax
   2a103:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   2a10a:	00 
   2a10b:	0f 9e c0             	setle  %al
   2a10e:	48 83 eb 10          	sub    $0x10,%rbx
   2a112:	0f b6 c0             	movzbl %al,%eax
   2a115:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2a119:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2a11e:	49 83 c5 01          	add    $0x1,%r13
   2a122:	49 89 c2             	mov    %rax,%r10
   2a125:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a129:	ff e0                	jmp    *%rax
   2a12b:	f3 0f 1e fa          	endbr64
   2a12f:	41 8b 45 00          	mov    0x0(%r13),%eax
   2a133:	4c 8b 5b e8          	mov    -0x18(%rbx),%r11
   2a137:	4d 8d 7d 04          	lea    0x4(%r13),%r15
   2a13b:	4c 8b 53 e0          	mov    -0x20(%rbx),%r10
   2a13f:	4c 01 e8             	add    %r13,%rax
   2a142:	41 83 fb ff          	cmp    $0xffffffff,%r11d
   2a146:	75 0c                	jne    2a154 <JS_CallInternal+0x5144>
   2a148:	66 41 83 7a 12 01    	cmpw   $0x1,0x12(%r10)
   2a14e:	0f 84 a9 2a 00 00    	je     2cbfd <JS_CallInternal+0x7bed>
   2a154:	48 83 ec 08          	sub    $0x8,%rsp
   2a158:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2a15c:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2a160:	4c 89 da             	mov    %r11,%rdx
   2a163:	48 8b 8d b8 fe ff ff 	mov    -0x148(%rbp),%rcx
   2a16a:	4c 89 9d 30 fe ff ff 	mov    %r11,-0x1d0(%rbp)
   2a171:	4c 89 d6             	mov    %r10,%rsi
   2a174:	4c 89 e7             	mov    %r12,%rdi
   2a177:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   2a17e:	4c 89 79 30          	mov    %r15,0x30(%rcx)
   2a182:	8b 48 14             	mov    0x14(%rax),%ecx
   2a185:	68 00 80 00 00       	push   $0x8000
   2a18a:	41 53                	push   %r11
   2a18c:	41 52                	push   %r10
   2a18e:	e8 bd 64 00 00       	call   30650 <JS_SetPropertyInternal>
   2a193:	4c 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%r11
   2a19a:	48 83 c4 20          	add    $0x20,%rsp
   2a19e:	89 c1                	mov    %eax,%ecx
   2a1a0:	41 83 fb f6          	cmp    $0xfffffff6,%r11d
   2a1a4:	76 1a                	jbe    2a1c0 <JS_CallInternal+0x51b0>
   2a1a6:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   2a1ad:	41 8b 42 fc          	mov    -0x4(%r10),%eax
   2a1b1:	83 e8 01             	sub    $0x1,%eax
   2a1b4:	41 89 42 fc          	mov    %eax,-0x4(%r10)
   2a1b8:	85 c0                	test   %eax,%eax
   2a1ba:	0f 8e 28 2d 00 00    	jle    2cee8 <JS_CallInternal+0x7ed8>
   2a1c0:	48 83 eb 20          	sub    $0x20,%rbx
   2a1c4:	85 c9                	test   %ecx,%ecx
   2a1c6:	0f 88 74 b5 ff ff    	js     25740 <JS_CallInternal+0x730>
   2a1cc:	41 0f b6 45 04       	movzbl 0x4(%r13),%eax
   2a1d1:	49 83 c5 05          	add    $0x5,%r13
   2a1d5:	49 89 c2             	mov    %rax,%r10
   2a1d8:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a1dc:	ff e0                	jmp    *%rax
   2a1de:	f3 0f 1e fa          	endbr64
   2a1e2:	49 0f be 45 00       	movsbq 0x0(%r13),%rax
   2a1e7:	4d 8d 7c 05 00       	lea    0x0(%r13,%rax,1),%r15
   2a1ec:	41 8b 84 24 a8 01 00 	mov    0x1a8(%r12),%eax
   2a1f3:	00 
   2a1f4:	83 e8 01             	sub    $0x1,%eax
   2a1f7:	41 89 84 24 a8 01 00 	mov    %eax,0x1a8(%r12)
   2a1fe:	00 
   2a1ff:	85 c0                	test   %eax,%eax
   2a201:	0f 8e 42 33 00 00    	jle    2d549 <JS_CallInternal+0x8539>
   2a207:	41 0f b6 07          	movzbl (%r15),%eax
   2a20b:	4d 8d 6f 01          	lea    0x1(%r15),%r13
   2a20f:	49 89 c2             	mov    %rax,%r10
   2a212:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2a216:	f3 0f 1e fa          	endbr64
   2a21a:	49 0f bf 45 00       	movswq 0x0(%r13),%rax
   2a21f:	4d 8d 7c 05 00       	lea    0x0(%r13,%rax,1),%r15
   2a224:	41 8b 84 24 a8 01 00 	mov    0x1a8(%r12),%eax
   2a22b:	00 
   2a22c:	83 e8 01             	sub    $0x1,%eax
   2a22f:	41 89 84 24 a8 01 00 	mov    %eax,0x1a8(%r12)
   2a236:	00 
   2a237:	85 c0                	test   %eax,%eax
   2a239:	0f 8e 99 3e 00 00    	jle    2e0d8 <JS_CallInternal+0x90c8>
   2a23f:	41 0f b6 07          	movzbl (%r15),%eax
   2a243:	4d 8d 6f 01          	lea    0x1(%r15),%r13
   2a247:	49 89 c2             	mov    %rax,%r10
   2a24a:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2a24e:	f3 0f 1e fa          	endbr64
   2a252:	49 63 45 00          	movslq 0x0(%r13),%rax
   2a256:	4d 8d 7c 05 00       	lea    0x0(%r13,%rax,1),%r15
   2a25b:	41 8b 84 24 a8 01 00 	mov    0x1a8(%r12),%eax
   2a262:	00 
   2a263:	83 e8 01             	sub    $0x1,%eax
   2a266:	41 89 84 24 a8 01 00 	mov    %eax,0x1a8(%r12)
   2a26d:	00 
   2a26e:	85 c0                	test   %eax,%eax
   2a270:	0f 8e fb 35 00 00    	jle    2d871 <JS_CallInternal+0x8861>
   2a276:	41 0f b6 07          	movzbl (%r15),%eax
   2a27a:	4d 8d 6f 01          	lea    0x1(%r15),%r13
   2a27e:	49 89 c2             	mov    %rax,%r10
   2a281:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2a285:	f3 0f 1e fa          	endbr64
   2a289:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   2a28d:	4c 8d 7b e0          	lea    -0x20(%rbx),%r15
   2a291:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   2a295:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2a298:	76 11                	jbe    2a2ab <JS_CallInternal+0x529b>
   2a29a:	8b 51 fc             	mov    -0x4(%rcx),%edx
   2a29d:	83 ea 01             	sub    $0x1,%edx
   2a2a0:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2a2a3:	85 d2                	test   %edx,%edx
   2a2a5:	0f 8e 03 31 00 00    	jle    2d3ae <JS_CallInternal+0x839e>
   2a2ab:	4c 8d 5b d0          	lea    -0x30(%rbx),%r11
   2a2af:	83 7b d8 03          	cmpl   $0x3,-0x28(%rbx)
   2a2b3:	74 51                	je     2a306 <JS_CallInternal+0x52f6>
   2a2b5:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2a2bc:	49 8b 53 08          	mov    0x8(%r11),%rdx
   2a2c0:	31 c9                	xor    %ecx,%ecx
   2a2c2:	4c 89 e7             	mov    %r12,%rdi
   2a2c5:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   2a2c9:	4c 89 9d 30 fe ff ff 	mov    %r11,-0x1d0(%rbp)
   2a2d0:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2a2d4:	e8 77 a0 06 00       	call   94350 <JS_IteratorClose>
   2a2d9:	4c 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%r11
   2a2e0:	85 c0                	test   %eax,%eax
   2a2e2:	0f 85 07 54 00 00    	jne    2f6ef <JS_CallInternal+0xa6df>
   2a2e8:	49 8b 43 08          	mov    0x8(%r11),%rax
   2a2ec:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2a2ef:	76 15                	jbe    2a306 <JS_CallInternal+0x52f6>
   2a2f1:	48 8b 4b d0          	mov    -0x30(%rbx),%rcx
   2a2f5:	8b 59 fc             	mov    -0x4(%rcx),%ebx
   2a2f8:	8d 53 ff             	lea    -0x1(%rbx),%edx
   2a2fb:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2a2fe:	85 d2                	test   %edx,%edx
   2a300:	0f 8e b0 44 00 00    	jle    2e7b6 <JS_CallInternal+0x97a6>
   2a306:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2a30b:	4c 89 db             	mov    %r11,%rbx
   2a30e:	49 83 c5 01          	add    $0x1,%r13
   2a312:	49 89 c2             	mov    %rax,%r10
   2a315:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a319:	ff e0                	jmp    *%rax
   2a31b:	f3 0f 1e fa          	endbr64
   2a31f:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   2a323:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
   2a328:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   2a32c:	83 fe f6             	cmp    $0xfffffff6,%esi
   2a32f:	76 04                	jbe    2a335 <JS_CallInternal+0x5325>
   2a331:	83 47 fc 01          	addl   $0x1,-0x4(%rdi)
   2a335:	48 8b 8d 88 fe ff ff 	mov    -0x178(%rbp),%rcx
   2a33c:	48 8b 04 c1          	mov    (%rcx,%rax,8),%rax
   2a340:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a344:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2a348:	48 8b 08             	mov    (%rax),%rcx
   2a34b:	48 89 70 08          	mov    %rsi,0x8(%rax)
   2a34f:	48 89 38             	mov    %rdi,(%rax)
   2a352:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a355:	76 11                	jbe    2a368 <JS_CallInternal+0x5358>
   2a357:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2a35a:	83 e8 01             	sub    $0x1,%eax
   2a35d:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2a360:	85 c0                	test   %eax,%eax
   2a362:	0f 8e 18 2b 00 00    	jle    2ce80 <JS_CallInternal+0x7e70>
   2a368:	41 0f b6 45 02       	movzbl 0x2(%r13),%eax
   2a36d:	49 83 c5 03          	add    $0x3,%r13
   2a371:	49 89 c2             	mov    %rax,%r10
   2a374:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a378:	ff e0                	jmp    *%rax
   2a37a:	f3 0f 1e fa          	endbr64
   2a37e:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
   2a383:	4d 8d 7d 02          	lea    0x2(%r13),%r15
   2a387:	48 89 c1             	mov    %rax,%rcx
   2a38a:	48 c1 e0 04          	shl    $0x4,%rax
   2a38e:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   2a395:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2a399:	83 fa 04             	cmp    $0x4,%edx
   2a39c:	0f 84 4e 3d 00 00    	je     2e0f0 <JS_CallInternal+0x90e0>
   2a3a2:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2a3a6:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2a3aa:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   2a3ad:	76 04                	jbe    2a3b3 <JS_CallInternal+0x53a3>
   2a3af:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2a3b3:	48 8b 38             	mov    (%rax),%rdi
   2a3b6:	48 89 48 08          	mov    %rcx,0x8(%rax)
   2a3ba:	48 89 30             	mov    %rsi,(%rax)
   2a3bd:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a3c0:	76 11                	jbe    2a3d3 <JS_CallInternal+0x53c3>
   2a3c2:	8b 47 fc             	mov    -0x4(%rdi),%eax
   2a3c5:	83 e8 01             	sub    $0x1,%eax
   2a3c8:	89 47 fc             	mov    %eax,-0x4(%rdi)
   2a3cb:	85 c0                	test   %eax,%eax
   2a3cd:	0f 8e 48 2b 00 00    	jle    2cf1b <JS_CallInternal+0x7f0b>
   2a3d3:	41 0f b6 45 02       	movzbl 0x2(%r13),%eax
   2a3d8:	49 83 c5 03          	add    $0x3,%r13
   2a3dc:	49 89 c2             	mov    %rax,%r10
   2a3df:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a3e3:	ff e0                	jmp    *%rax
   2a3e5:	f3 0f 1e fa          	endbr64
   2a3e9:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
   2a3ee:	4d 8d 7d 02          	lea    0x2(%r13),%r15
   2a3f2:	48 89 c1             	mov    %rax,%rcx
   2a3f5:	48 c1 e0 04          	shl    $0x4,%rax
   2a3f9:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   2a400:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2a404:	83 fa 04             	cmp    $0x4,%edx
   2a407:	0f 84 ee 34 00 00    	je     2d8fb <JS_CallInternal+0x88eb>
   2a40d:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2a412:	48 8b 08             	mov    (%rax),%rcx
   2a415:	0f 11 00             	movups %xmm0,(%rax)
   2a418:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a41b:	76 11                	jbe    2a42e <JS_CallInternal+0x541e>
   2a41d:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2a420:	83 e8 01             	sub    $0x1,%eax
   2a423:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2a426:	85 c0                	test   %eax,%eax
   2a428:	0f 8e db 2a 00 00    	jle    2cf09 <JS_CallInternal+0x7ef9>
   2a42e:	41 0f b6 45 02       	movzbl 0x2(%r13),%eax
   2a433:	48 83 eb 10          	sub    $0x10,%rbx
   2a437:	49 83 c5 03          	add    $0x3,%r13
   2a43b:	49 89 c2             	mov    %rax,%r10
   2a43e:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a442:	ff e0                	jmp    *%rax
   2a444:	f3 0f 1e fa          	endbr64
   2a448:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
   2a44d:	4d 8d 7d 02          	lea    0x2(%r13),%r15
   2a451:	48 89 c1             	mov    %rax,%rcx
   2a454:	48 c1 e0 04          	shl    $0x4,%rax
   2a458:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   2a45f:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2a463:	83 fa 04             	cmp    $0x4,%edx
   2a466:	0f 84 f5 3b 00 00    	je     2e061 <JS_CallInternal+0x9051>
   2a46c:	48 8b 00             	mov    (%rax),%rax
   2a46f:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a472:	76 04                	jbe    2a478 <JS_CallInternal+0x5468>
   2a474:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2a478:	48 89 03             	mov    %rax,(%rbx)
   2a47b:	49 83 c5 03          	add    $0x3,%r13
   2a47f:	48 83 c3 10          	add    $0x10,%rbx
   2a483:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2a487:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2a48c:	49 89 c2             	mov    %rax,%r10
   2a48f:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a493:	ff e0                	jmp    *%rax
   2a495:	f3 0f 1e fa          	endbr64
   2a499:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
   2a49e:	4d 8d 7d 02          	lea    0x2(%r13),%r15
   2a4a2:	48 89 c1             	mov    %rax,%rcx
   2a4a5:	48 c1 e0 04          	shl    $0x4,%rax
   2a4a9:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   2a4b0:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2a4b4:	83 fa 04             	cmp    $0x4,%edx
   2a4b7:	0f 84 8b 3b 00 00    	je     2e048 <JS_CallInternal+0x9038>
   2a4bd:	48 8b 00             	mov    (%rax),%rax
   2a4c0:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a4c3:	76 04                	jbe    2a4c9 <JS_CallInternal+0x54b9>
   2a4c5:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2a4c9:	48 89 03             	mov    %rax,(%rbx)
   2a4cc:	49 83 c5 03          	add    $0x3,%r13
   2a4d0:	48 83 c3 10          	add    $0x10,%rbx
   2a4d4:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2a4d8:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2a4dd:	49 89 c2             	mov    %rax,%r10
   2a4e0:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a4e4:	ff e0                	jmp    *%rax
   2a4e6:	f3 0f 1e fa          	endbr64
   2a4ea:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   2a4f1:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
   2a4f6:	0f b7 51 38          	movzwl 0x38(%rcx),%edx
   2a4fa:	4c 8b 79 28          	mov    0x28(%rcx),%r15
   2a4fe:	48 8b 8d b8 fe ff ff 	mov    -0x148(%rbp),%rcx
   2a505:	01 d0                	add    %edx,%eax
   2a507:	48 98                	cltq
   2a509:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
   2a50d:	49 8d 04 87          	lea    (%r15,%rax,4),%rax
   2a511:	44 0f b7 78 0a       	movzwl 0xa(%rax),%r15d
   2a516:	4a 8d 14 fd 00 00 00 	lea    0x0(,%r15,8),%rdx
   2a51d:	00 
   2a51e:	48 03 51 28          	add    0x28(%rcx),%rdx
   2a522:	48 8b 02             	mov    (%rdx),%rax
   2a525:	48 85 c0             	test   %rax,%rax
   2a528:	74 48                	je     2a572 <JS_CallInternal+0x5562>
   2a52a:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2a52f:	f6 41 3c 04          	testb  $0x4,0x3c(%rcx)
   2a533:	0f 85 77 27 00 00    	jne    2ccb0 <JS_CallInternal+0x7ca0>
   2a539:	48 8b 70 18          	mov    0x18(%rax),%rsi
   2a53d:	48 8b 0e             	mov    (%rsi),%rcx
   2a540:	48 8b 76 08          	mov    0x8(%rsi),%rsi
   2a544:	83 fe f6             	cmp    $0xfffffff6,%esi
   2a547:	76 04                	jbe    2a54d <JS_CallInternal+0x553d>
   2a549:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   2a54d:	48 89 70 28          	mov    %rsi,0x28(%rax)
   2a551:	48 8d 70 20          	lea    0x20(%rax),%rsi
   2a555:	66 48 0f 6e e1       	movq   %rcx,%xmm4
   2a55a:	66 48 0f 6e c6       	movq   %rsi,%xmm0
   2a55f:	c6 40 10 01          	movb   $0x1,0x10(%rax)
   2a563:	66 0f 6c c4          	punpcklqdq %xmm4,%xmm0
   2a567:	0f 11 40 18          	movups %xmm0,0x18(%rax)
   2a56b:	48 c7 02 00 00 00 00 	movq   $0x0,(%rdx)
   2a572:	41 0f b6 45 02       	movzbl 0x2(%r13),%eax
   2a577:	49 83 c5 03          	add    $0x3,%r13
   2a57b:	49 89 c2             	mov    %rax,%r10
   2a57e:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a582:	ff e0                	jmp    *%rax
   2a584:	f3 0f 1e fa          	endbr64
   2a588:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
   2a58d:	4d 8d 7d 02          	lea    0x2(%r13),%r15
   2a591:	48 c1 e0 04          	shl    $0x4,%rax
   2a595:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   2a59c:	83 78 08 04          	cmpl   $0x4,0x8(%rax)
   2a5a0:	0f 85 02 3b 00 00    	jne    2e0a8 <JS_CallInternal+0x9098>
   2a5a6:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2a5ab:	49 83 c5 03          	add    $0x3,%r13
   2a5af:	48 83 eb 10          	sub    $0x10,%rbx
   2a5b3:	0f 11 00             	movups %xmm0,(%rax)
   2a5b6:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2a5bb:	49 89 c2             	mov    %rax,%r10
   2a5be:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a5c2:	ff e0                	jmp    *%rax
   2a5c4:	f3 0f 1e fa          	endbr64
   2a5c8:	e9 8d af ff ff       	jmp    2555a <JS_CallInternal+0x54a>
   2a5cd:	f3 0f 1e fa          	endbr64
   2a5d1:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2a5d8:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2a5dd:	48 83 eb 10          	sub    $0x10,%rbx
   2a5e1:	48 8b 40 10          	mov    0x10(%rax),%rax
   2a5e5:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a5e9:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2a5ed:	48 8b 08             	mov    (%rax),%rcx
   2a5f0:	0f 11 00             	movups %xmm0,(%rax)
   2a5f3:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a5f6:	76 11                	jbe    2a609 <JS_CallInternal+0x55f9>
   2a5f8:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2a5fb:	83 e8 01             	sub    $0x1,%eax
   2a5fe:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2a601:	85 c0                	test   %eax,%eax
   2a603:	0f 8e 2b 2a 00 00    	jle    2d034 <JS_CallInternal+0x8024>
   2a609:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2a60e:	49 83 c5 01          	add    $0x1,%r13
   2a612:	49 89 c2             	mov    %rax,%r10
   2a615:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a619:	ff e0                	jmp    *%rax
   2a61b:	f3 0f 1e fa          	endbr64
   2a61f:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2a626:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2a62b:	48 83 eb 10          	sub    $0x10,%rbx
   2a62f:	48 8b 40 08          	mov    0x8(%rax),%rax
   2a633:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a637:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2a63b:	48 8b 08             	mov    (%rax),%rcx
   2a63e:	0f 11 00             	movups %xmm0,(%rax)
   2a641:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a644:	76 11                	jbe    2a657 <JS_CallInternal+0x5647>
   2a646:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2a649:	83 e8 01             	sub    $0x1,%eax
   2a64c:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2a64f:	85 c0                	test   %eax,%eax
   2a651:	0f 8e f3 27 00 00    	jle    2ce4a <JS_CallInternal+0x7e3a>
   2a657:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2a65c:	49 83 c5 01          	add    $0x1,%r13
   2a660:	49 89 c2             	mov    %rax,%r10
   2a663:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a667:	ff e0                	jmp    *%rax
   2a669:	f3 0f 1e fa          	endbr64
   2a66d:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2a674:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2a679:	48 83 eb 10          	sub    $0x10,%rbx
   2a67d:	48 8b 00             	mov    (%rax),%rax
   2a680:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a684:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2a688:	48 8b 08             	mov    (%rax),%rcx
   2a68b:	0f 11 00             	movups %xmm0,(%rax)
   2a68e:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a691:	76 11                	jbe    2a6a4 <JS_CallInternal+0x5694>
   2a693:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2a696:	83 e8 01             	sub    $0x1,%eax
   2a699:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2a69c:	85 c0                	test   %eax,%eax
   2a69e:	0f 8e 94 27 00 00    	jle    2ce38 <JS_CallInternal+0x7e28>
   2a6a4:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2a6a9:	49 83 c5 01          	add    $0x1,%r13
   2a6ad:	49 89 c2             	mov    %rax,%r10
   2a6b0:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a6b4:	ff e0                	jmp    *%rax
   2a6b6:	f3 0f 1e fa          	endbr64
   2a6ba:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2a6c1:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   2a6c5:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a6c9:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a6cd:	48 8b 10             	mov    (%rax),%rdx
   2a6d0:	48 8b 40 08          	mov    0x8(%rax),%rax
   2a6d4:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2a6d7:	76 04                	jbe    2a6dd <JS_CallInternal+0x56cd>
   2a6d9:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2a6dd:	48 89 13             	mov    %rdx,(%rbx)
   2a6e0:	49 83 c5 01          	add    $0x1,%r13
   2a6e4:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2a6e8:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2a6ed:	48 89 cb             	mov    %rcx,%rbx
   2a6f0:	49 89 c2             	mov    %rax,%r10
   2a6f3:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a6f7:	ff e0                	jmp    *%rax
   2a6f9:	f3 0f 1e fa          	endbr64
   2a6fd:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2a701:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2a705:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   2a708:	76 04                	jbe    2a70e <JS_CallInternal+0x56fe>
   2a70a:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2a70e:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2a715:	48 8b 00             	mov    (%rax),%rax
   2a718:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a71c:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2a720:	48 8b 38             	mov    (%rax),%rdi
   2a723:	48 89 48 08          	mov    %rcx,0x8(%rax)
   2a727:	48 89 30             	mov    %rsi,(%rax)
   2a72a:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a72d:	76 11                	jbe    2a740 <JS_CallInternal+0x5730>
   2a72f:	8b 47 fc             	mov    -0x4(%rdi),%eax
   2a732:	83 e8 01             	sub    $0x1,%eax
   2a735:	89 47 fc             	mov    %eax,-0x4(%rdi)
   2a738:	85 c0                	test   %eax,%eax
   2a73a:	0f 8e 52 27 00 00    	jle    2ce92 <JS_CallInternal+0x7e82>
   2a740:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2a745:	49 83 c5 01          	add    $0x1,%r13
   2a749:	49 89 c2             	mov    %rax,%r10
   2a74c:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a750:	ff e0                	jmp    *%rax
   2a752:	f3 0f 1e fa          	endbr64
   2a756:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2a75a:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2a75e:	4d 8d 7d 04          	lea    0x4(%r13),%r15
   2a762:	83 fa 03             	cmp    $0x3,%edx
   2a765:	0f 87 fb 1c 00 00    	ja     2c466 <JS_CallInternal+0x7456>
   2a76b:	48 83 eb 10          	sub    $0x10,%rbx
   2a76f:	85 c0                	test   %eax,%eax
   2a771:	75 0c                	jne    2a77f <JS_CallInternal+0x576f>
   2a773:	41 8b 45 00          	mov    0x0(%r13),%eax
   2a777:	83 e8 04             	sub    $0x4,%eax
   2a77a:	48 98                	cltq
   2a77c:	49 01 c7             	add    %rax,%r15
   2a77f:	41 8b 84 24 a8 01 00 	mov    0x1a8(%r12),%eax
   2a786:	00 
   2a787:	83 e8 01             	sub    $0x1,%eax
   2a78a:	41 89 84 24 a8 01 00 	mov    %eax,0x1a8(%r12)
   2a791:	00 
   2a792:	85 c0                	test   %eax,%eax
   2a794:	0f 8e 24 39 00 00    	jle    2e0be <JS_CallInternal+0x90ae>
   2a79a:	41 0f b6 07          	movzbl (%r15),%eax
   2a79e:	4d 8d 6f 01          	lea    0x1(%r15),%r13
   2a7a2:	49 89 c2             	mov    %rax,%r10
   2a7a5:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2a7a9:	f3 0f 1e fa          	endbr64
   2a7ad:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2a7b1:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2a7b5:	4d 8d 7d 04          	lea    0x4(%r13),%r15
   2a7b9:	83 fa 03             	cmp    $0x3,%edx
   2a7bc:	0f 87 06 1b 00 00    	ja     2c2c8 <JS_CallInternal+0x72b8>
   2a7c2:	48 83 eb 10          	sub    $0x10,%rbx
   2a7c6:	85 c0                	test   %eax,%eax
   2a7c8:	74 0c                	je     2a7d6 <JS_CallInternal+0x57c6>
   2a7ca:	41 8b 45 00          	mov    0x0(%r13),%eax
   2a7ce:	83 e8 04             	sub    $0x4,%eax
   2a7d1:	48 98                	cltq
   2a7d3:	49 01 c7             	add    %rax,%r15
   2a7d6:	41 8b 84 24 a8 01 00 	mov    0x1a8(%r12),%eax
   2a7dd:	00 
   2a7de:	83 e8 01             	sub    $0x1,%eax
   2a7e1:	41 89 84 24 a8 01 00 	mov    %eax,0x1a8(%r12)
   2a7e8:	00 
   2a7e9:	85 c0                	test   %eax,%eax
   2a7eb:	0f 8e 82 37 00 00    	jle    2df73 <JS_CallInternal+0x8f63>
   2a7f1:	41 0f b6 07          	movzbl (%r15),%eax
   2a7f5:	4d 8d 6f 01          	lea    0x1(%r15),%r13
   2a7f9:	49 89 c2             	mov    %rax,%r10
   2a7fc:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2a800:	f3 0f 1e fa          	endbr64
   2a804:	41 0f b7 4d 00       	movzwl 0x0(%r13),%ecx
   2a809:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2a810:	4d 8d 7d 02          	lea    0x2(%r13),%r15
   2a814:	48 8b 04 c8          	mov    (%rax,%rcx,8),%rax
   2a818:	48 8b 50 18          	mov    0x18(%rax),%rdx
   2a81c:	48 8b 42 08          	mov    0x8(%rdx),%rax
   2a820:	83 f8 04             	cmp    $0x4,%eax
   2a823:	0f 84 9b 37 00 00    	je     2dfc4 <JS_CallInternal+0x8fb4>
   2a829:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2a82e:	48 8b 0a             	mov    (%rdx),%rcx
   2a831:	0f 11 02             	movups %xmm0,(%rdx)
   2a834:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2a837:	76 11                	jbe    2a84a <JS_CallInternal+0x583a>
   2a839:	8b 51 fc             	mov    -0x4(%rcx),%edx
   2a83c:	83 ea 01             	sub    $0x1,%edx
   2a83f:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2a842:	85 d2                	test   %edx,%edx
   2a844:	0f 8e 79 2b 00 00    	jle    2d3c3 <JS_CallInternal+0x83b3>
   2a84a:	41 0f b6 45 02       	movzbl 0x2(%r13),%eax
   2a84f:	48 83 eb 10          	sub    $0x10,%rbx
   2a853:	49 83 c5 03          	add    $0x3,%r13
   2a857:	49 89 c2             	mov    %rax,%r10
   2a85a:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a85e:	ff e0                	jmp    *%rax
   2a860:	f3 0f 1e fa          	endbr64
   2a864:	49 8b b4 24 90 01 00 	mov    0x190(%r12),%rsi
   2a86b:	00 
   2a86c:	41 8b 4d 00          	mov    0x0(%r13),%ecx
   2a870:	4d 8d 7d 04          	lea    0x4(%r13),%r15
   2a874:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2a87b:	48 8b 7e 18          	mov    0x18(%rsi),%rdi
   2a87f:	4c 89 78 30          	mov    %r15,0x30(%rax)
   2a883:	89 c8                	mov    %ecx,%eax
   2a885:	8b 57 18             	mov    0x18(%rdi),%edx
   2a888:	21 d0                	and    %edx,%eax
   2a88a:	8b 44 87 38          	mov    0x38(%rdi,%rax,4),%eax
   2a88e:	48 85 c0             	test   %rax,%rax
   2a891:	0f 84 02 23 00 00    	je     2cb99 <JS_CallInternal+0x7b89>
   2a897:	4c 8d 04 95 3c 00 00 	lea    0x3c(,%rdx,4),%r8
   2a89e:	00 
   2a89f:	48 83 e8 01          	sub    $0x1,%rax
   2a8a3:	49 8d 14 c0          	lea    (%r8,%rax,8),%rdx
   2a8a7:	48 01 fa             	add    %rdi,%rdx
   2a8aa:	39 4a 04             	cmp    %ecx,0x4(%rdx)
   2a8ad:	0f 85 d9 22 00 00    	jne    2cb8c <JS_CallInternal+0x7b7c>
   2a8b3:	48 c1 e0 04          	shl    $0x4,%rax
   2a8b7:	48 03 46 20          	add    0x20(%rsi),%rax
   2a8bb:	48 8b 00             	mov    (%rax),%rax
   2a8be:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a8c2:	83 78 08 04          	cmpl   $0x4,0x8(%rax)
   2a8c6:	0f 84 d3 32 00 00    	je     2db9f <JS_CallInternal+0x8b8f>
   2a8cc:	f6 42 03 08          	testb  $0x8,0x3(%rdx)
   2a8d0:	0f 84 af 3c 00 00    	je     2e585 <JS_CallInternal+0x9575>
   2a8d6:	49 8b 84 24 98 01 00 	mov    0x198(%r12),%rax
   2a8dd:	00 
   2a8de:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2a8e1:	76 04                	jbe    2a8e7 <JS_CallInternal+0x58d7>
   2a8e3:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2a8e7:	48 89 33             	mov    %rsi,(%rbx)
   2a8ea:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2a8ee:	31 d2                	xor    %edx,%edx
   2a8f0:	89 ce                	mov    %ecx,%esi
   2a8f2:	4c 89 e7             	mov    %r12,%rdi
   2a8f5:	48 83 c3 20          	add    $0x20,%rbx
   2a8f9:	e8 02 0b 01 00       	call   3b400 <__JS_AtomToValue>
   2a8fe:	49 83 c5 05          	add    $0x5,%r13
   2a902:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2a906:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2a90a:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2a90f:	49 89 c2             	mov    %rax,%r10
   2a912:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a916:	ff e0                	jmp    *%rax
   2a918:	f3 0f 1e fa          	endbr64
   2a91c:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2a920:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2a924:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   2a927:	76 04                	jbe    2a92d <JS_CallInternal+0x591d>
   2a929:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2a92d:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2a934:	48 8b 40 08          	mov    0x8(%rax),%rax
   2a938:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a93c:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2a940:	48 8b 38             	mov    (%rax),%rdi
   2a943:	48 89 48 08          	mov    %rcx,0x8(%rax)
   2a947:	48 89 30             	mov    %rsi,(%rax)
   2a94a:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a94d:	76 11                	jbe    2a960 <JS_CallInternal+0x5950>
   2a94f:	8b 47 fc             	mov    -0x4(%rdi),%eax
   2a952:	83 e8 01             	sub    $0x1,%eax
   2a955:	89 47 fc             	mov    %eax,-0x4(%rdi)
   2a958:	85 c0                	test   %eax,%eax
   2a95a:	0f 8e fc 24 00 00    	jle    2ce5c <JS_CallInternal+0x7e4c>
   2a960:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2a965:	49 83 c5 01          	add    $0x1,%r13
   2a969:	49 89 c2             	mov    %rax,%r10
   2a96c:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a970:	ff e0                	jmp    *%rax
   2a972:	f3 0f 1e fa          	endbr64
   2a976:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2a97d:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2a982:	48 83 eb 10          	sub    $0x10,%rbx
   2a986:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a98a:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a98e:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2a992:	48 8b 08             	mov    (%rax),%rcx
   2a995:	0f 11 00             	movups %xmm0,(%rax)
   2a998:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a99b:	76 11                	jbe    2a9ae <JS_CallInternal+0x599e>
   2a99d:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2a9a0:	83 e8 01             	sub    $0x1,%eax
   2a9a3:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2a9a6:	85 c0                	test   %eax,%eax
   2a9a8:	0f 8e f6 24 00 00    	jle    2cea4 <JS_CallInternal+0x7e94>
   2a9ae:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2a9b3:	49 83 c5 01          	add    $0x1,%r13
   2a9b7:	49 89 c2             	mov    %rax,%r10
   2a9ba:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a9be:	ff e0                	jmp    *%rax
   2a9c0:	f3 0f 1e fa          	endbr64
   2a9c4:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
   2a9c9:	48 8b 8d 88 fe ff ff 	mov    -0x178(%rbp),%rcx
   2a9d0:	48 8b 04 c1          	mov    (%rcx,%rax,8),%rax
   2a9d4:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a9d8:	48 8b 10             	mov    (%rax),%rdx
   2a9db:	48 8b 40 08          	mov    0x8(%rax),%rax
   2a9df:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2a9e2:	76 04                	jbe    2a9e8 <JS_CallInternal+0x59d8>
   2a9e4:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2a9e8:	48 89 13             	mov    %rdx,(%rbx)
   2a9eb:	49 83 c5 03          	add    $0x3,%r13
   2a9ef:	48 83 c3 10          	add    $0x10,%rbx
   2a9f3:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2a9f7:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2a9fc:	49 89 c2             	mov    %rax,%r10
   2a9ff:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2aa03:	ff e0                	jmp    *%rax
   2aa05:	f3 0f 1e fa          	endbr64
   2aa09:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2aa0d:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2aa11:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   2aa14:	76 04                	jbe    2aa1a <JS_CallInternal+0x5a0a>
   2aa16:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2aa1a:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2aa21:	48 8b 40 18          	mov    0x18(%rax),%rax
   2aa25:	48 8b 40 18          	mov    0x18(%rax),%rax
   2aa29:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2aa2d:	48 8b 38             	mov    (%rax),%rdi
   2aa30:	48 89 48 08          	mov    %rcx,0x8(%rax)
   2aa34:	48 89 30             	mov    %rsi,(%rax)
   2aa37:	83 fa f6             	cmp    $0xfffffff6,%edx
   2aa3a:	76 11                	jbe    2aa4d <JS_CallInternal+0x5a3d>
   2aa3c:	8b 47 fc             	mov    -0x4(%rdi),%eax
   2aa3f:	83 e8 01             	sub    $0x1,%eax
   2aa42:	89 47 fc             	mov    %eax,-0x4(%rdi)
   2aa45:	85 c0                	test   %eax,%eax
   2aa47:	0f 8e 21 24 00 00    	jle    2ce6e <JS_CallInternal+0x7e5e>
   2aa4d:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2aa52:	49 83 c5 01          	add    $0x1,%r13
   2aa56:	49 89 c2             	mov    %rax,%r10
   2aa59:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2aa5d:	ff e0                	jmp    *%rax
   2aa5f:	f3 0f 1e fa          	endbr64
   2aa63:	41 0f b7 45 00       	movzwl 0x0(%r13),%eax
   2aa68:	48 8b 8d 88 fe ff ff 	mov    -0x178(%rbp),%rcx
   2aa6f:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2aa74:	48 8b 04 c1          	mov    (%rcx,%rax,8),%rax
   2aa78:	48 8b 40 18          	mov    0x18(%rax),%rax
   2aa7c:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2aa80:	48 8b 08             	mov    (%rax),%rcx
   2aa83:	0f 11 00             	movups %xmm0,(%rax)
   2aa86:	83 fa f6             	cmp    $0xfffffff6,%edx
   2aa89:	76 11                	jbe    2aa9c <JS_CallInternal+0x5a8c>
   2aa8b:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2aa8e:	83 e8 01             	sub    $0x1,%eax
   2aa91:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2aa94:	85 c0                	test   %eax,%eax
   2aa96:	0f 8e 1a 24 00 00    	jle    2ceb6 <JS_CallInternal+0x7ea6>
   2aa9c:	41 0f b6 45 02       	movzbl 0x2(%r13),%eax
   2aaa1:	48 83 eb 10          	sub    $0x10,%rbx
   2aaa5:	49 83 c5 03          	add    $0x3,%r13
   2aaa9:	49 89 c2             	mov    %rax,%r10
   2aaac:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2aab0:	ff e0                	jmp    *%rax
   2aab2:	f3 0f 1e fa          	endbr64
   2aab6:	41 0f b7 55 00       	movzwl 0x0(%r13),%edx
   2aabb:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2aac2:	4d 8d 7d 02          	lea    0x2(%r13),%r15
   2aac6:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   2aaca:	48 8b 40 18          	mov    0x18(%rax),%rax
   2aace:	83 78 08 04          	cmpl   $0x4,0x8(%rax)
   2aad2:	0f 85 b8 34 00 00    	jne    2df90 <JS_CallInternal+0x8f80>
   2aad8:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2aadd:	49 83 c5 03          	add    $0x3,%r13
   2aae1:	48 83 eb 10          	sub    $0x10,%rbx
   2aae5:	0f 11 00             	movups %xmm0,(%rax)
   2aae8:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2aaed:	49 89 c2             	mov    %rax,%r10
   2aaf0:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2aaf4:	ff e0                	jmp    *%rax
   2aaf6:	f3 0f 1e fa          	endbr64
   2aafa:	41 0f b7 4d 00       	movzwl 0x0(%r13),%ecx
   2aaff:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2ab06:	4d 8d 7d 02          	lea    0x2(%r13),%r15
   2ab0a:	48 8b 04 c8          	mov    (%rax,%rcx,8),%rax
   2ab0e:	48 8b 40 18          	mov    0x18(%rax),%rax
   2ab12:	48 8b 10             	mov    (%rax),%rdx
   2ab15:	48 8b 40 08          	mov    0x8(%rax),%rax
   2ab19:	83 f8 04             	cmp    $0x4,%eax
   2ab1c:	0f 84 f1 37 00 00    	je     2e313 <JS_CallInternal+0x9303>
   2ab22:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2ab25:	76 04                	jbe    2ab2b <JS_CallInternal+0x5b1b>
   2ab27:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2ab2b:	48 89 13             	mov    %rdx,(%rbx)
   2ab2e:	49 83 c5 03          	add    $0x3,%r13
   2ab32:	48 83 c3 10          	add    $0x10,%rbx
   2ab36:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2ab3a:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2ab3f:	49 89 c2             	mov    %rax,%r10
   2ab42:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2ab46:	ff e0                	jmp    *%rax
   2ab48:	f3 0f 1e fa          	endbr64
   2ab4c:	45 8b 4d 00          	mov    0x0(%r13),%r9d
   2ab50:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2ab54:	4d 8d 7d 04          	lea    0x4(%r13),%r15
   2ab58:	4c 8b 53 f0          	mov    -0x10(%rbx),%r10
   2ab5c:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2ab63:	4d 01 e9             	add    %r13,%r9
   2ab66:	83 f8 ff             	cmp    $0xffffffff,%eax
   2ab69:	0f 85 b7 35 00 00    	jne    2e126 <JS_CallInternal+0x9116>
   2ab6f:	41 0f b7 42 12       	movzwl 0x12(%r10),%eax
   2ab74:	4d 8b 5a 18          	mov    0x18(%r10),%r11
   2ab78:	66 89 85 10 fe ff ff 	mov    %ax,-0x1f0(%rbp)
   2ab7f:	66 83 f8 01          	cmp    $0x1,%ax
   2ab83:	0f 84 1e 1a 00 00    	je     2c5a7 <JS_CallInternal+0x7597>
   2ab89:	41 8b 49 14          	mov    0x14(%r9),%ecx
   2ab8d:	4c 89 da             	mov    %r11,%rdx
   2ab90:	4c 89 d7             	mov    %r10,%rdi
   2ab93:	66 90                	xchg   %ax,%ax
   2ab95:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2ab9c:	00 00 00 00 
   2aba0:	8b 72 18             	mov    0x18(%rdx),%esi
   2aba3:	89 f0                	mov    %esi,%eax
   2aba5:	21 c8                	and    %ecx,%eax
   2aba7:	8b 44 82 38          	mov    0x38(%rdx,%rax,4),%eax
   2abab:	48 85 c0             	test   %rax,%rax
   2abae:	0f 84 a1 07 00 00    	je     2b355 <JS_CallInternal+0x6345>
   2abb4:	4c 8d 04 b5 3c 00 00 	lea    0x3c(,%rsi,4),%r8
   2abbb:	00 
   2abbc:	48 83 e8 01          	sub    $0x1,%rax
   2abc0:	49 8d 34 c0          	lea    (%r8,%rax,8),%rsi
   2abc4:	48 01 d6             	add    %rdx,%rsi
   2abc7:	39 4e 04             	cmp    %ecx,0x4(%rsi)
   2abca:	0f 85 78 07 00 00    	jne    2b348 <JS_CallInternal+0x6338>
   2abd0:	4c 8b 47 20          	mov    0x20(%rdi),%r8
   2abd4:	80 7e 03 3f          	cmpb   $0x3f,0x3(%rsi)
   2abd8:	0f 87 98 0d 00 00    	ja     2b976 <JS_CallInternal+0x6966>
   2abde:	48 c1 e0 04          	shl    $0x4,%rax
   2abe2:	49 01 c0             	add    %rax,%r8
   2abe5:	48 89 c6             	mov    %rax,%rsi
   2abe8:	49 8b 40 08          	mov    0x8(%r8),%rax
   2abec:	49 8b 08             	mov    (%r8),%rcx
   2abef:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2abf2:	76 04                	jbe    2abf8 <JS_CallInternal+0x5be8>
   2abf4:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   2abf8:	49 89 cf             	mov    %rcx,%r15
   2abfb:	49 39 fa             	cmp    %rdi,%r10
   2abfe:	0f 84 ac 3f 00 00    	je     2ebb0 <JS_CallInternal+0x9ba0>
   2ac04:	49 39 7b 30          	cmp    %rdi,0x30(%r11)
   2ac08:	0f 84 d6 3e 00 00    	je     2eae4 <JS_CallInternal+0x9ad4>
   2ac0e:	4c 89 3b             	mov    %r15,(%rbx)
   2ac11:	49 83 c5 05          	add    $0x5,%r13
   2ac15:	48 83 c3 10          	add    $0x10,%rbx
   2ac19:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2ac1d:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2ac22:	49 89 c2             	mov    %rax,%r10
   2ac25:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2ac29:	ff e0                	jmp    *%rax
   2ac2b:	f3 0f 1e fa          	endbr64
   2ac2f:	41 8b 45 00          	mov    0x0(%r13),%eax
   2ac33:	4c 8b 5b f8          	mov    -0x8(%rbx),%r11
   2ac37:	4d 8d 7d 04          	lea    0x4(%r13),%r15
   2ac3b:	4d 8d 54 05 00       	lea    0x0(%r13,%rax,1),%r10
   2ac40:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2ac44:	41 83 fb ff          	cmp    $0xffffffff,%r11d
   2ac48:	0f 85 76 2f 00 00    	jne    2dbc4 <JS_CallInternal+0x8bb4>
   2ac4e:	48 8b 78 18          	mov    0x18(%rax),%rdi
   2ac52:	66 83 78 12 01       	cmpw   $0x1,0x12(%rax)
   2ac57:	0f 84 c3 19 00 00    	je     2c620 <JS_CallInternal+0x7610>
   2ac5d:	41 8b 4a 14          	mov    0x14(%r10),%ecx
   2ac61:	49 89 c0             	mov    %rax,%r8
   2ac64:	90                   	nop
   2ac65:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2ac6c:	00 00 00 00 
   2ac70:	8b 77 18             	mov    0x18(%rdi),%esi
   2ac73:	89 f2                	mov    %esi,%edx
   2ac75:	21 ca                	and    %ecx,%edx
   2ac77:	8b 54 97 38          	mov    0x38(%rdi,%rdx,4),%edx
   2ac7b:	48 85 d2             	test   %rdx,%rdx
   2ac7e:	0f 84 ff 06 00 00    	je     2b383 <JS_CallInternal+0x6373>
   2ac84:	4c 8d 0c b5 3c 00 00 	lea    0x3c(,%rsi,4),%r9
   2ac8b:	00 
   2ac8c:	48 83 ea 01          	sub    $0x1,%rdx
   2ac90:	49 8d 34 d1          	lea    (%r9,%rdx,8),%rsi
   2ac94:	48 01 fe             	add    %rdi,%rsi
   2ac97:	39 4e 04             	cmp    %ecx,0x4(%rsi)
   2ac9a:	0f 85 d5 06 00 00    	jne    2b375 <JS_CallInternal+0x6365>
   2aca0:	4d 8b 48 20          	mov    0x20(%r8),%r9
   2aca4:	80 7e 03 3f          	cmpb   $0x3f,0x3(%rsi)
   2aca8:	0f 87 19 0d 00 00    	ja     2b9c7 <JS_CallInternal+0x69b7>
   2acae:	48 c1 e2 04          	shl    $0x4,%rdx
   2acb2:	49 01 d1             	add    %rdx,%r9
   2acb5:	49 8b 49 08          	mov    0x8(%r9),%rcx
   2acb9:	49 8b 31             	mov    (%r9),%rsi
   2acbc:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   2acbf:	76 04                	jbe    2acc5 <JS_CallInternal+0x5cb5>
   2acc1:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2acc5:	49 89 f7             	mov    %rsi,%r15
   2acc8:	4c 39 c0             	cmp    %r8,%rax
   2accb:	0f 84 1d 3b 00 00    	je     2e7ee <JS_CallInternal+0x97de>
   2acd1:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2acd5:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2acd8:	76 15                	jbe    2acef <JS_CallInternal+0x5cdf>
   2acda:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2acde:	8b 56 fc             	mov    -0x4(%rsi),%edx
   2ace1:	83 ea 01             	sub    $0x1,%edx
   2ace4:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2ace7:	85 d2                	test   %edx,%edx
   2ace9:	0f 8e d9 21 00 00    	jle    2cec8 <JS_CallInternal+0x7eb8>
   2acef:	4c 89 7b f0          	mov    %r15,-0x10(%rbx)
   2acf3:	49 83 c5 05          	add    $0x5,%r13
   2acf7:	48 89 4b f8          	mov    %rcx,-0x8(%rbx)
   2acfb:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2ad00:	49 89 c2             	mov    %rax,%r10
   2ad03:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2ad07:	ff e0                	jmp    *%rax
   2ad09:	f3 0f 1e fa          	endbr64
   2ad0d:	49 63 45 00          	movslq 0x0(%r13),%rax
   2ad11:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   2ad18:	49 8d 55 04          	lea    0x4(%r13),%rdx
   2ad1c:	48 83 c3 10          	add    $0x10,%rbx
   2ad20:	2b 51 18             	sub    0x18(%rcx),%edx
   2ad23:	4c 01 e8             	add    %r13,%rax
   2ad26:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   2ad2d:	00 
   2ad2e:	48 89 53 f0          	mov    %rdx,-0x10(%rbx)
   2ad32:	4c 8d 68 01          	lea    0x1(%rax),%r13
   2ad36:	0f b6 00             	movzbl (%rax),%eax
   2ad39:	49 89 c2             	mov    %rax,%r10
   2ad3c:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2ad40:	f3 0f 1e fa          	endbr64
   2ad44:	49 63 45 00          	movslq 0x0(%r13),%rax
   2ad48:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   2ad4f:	48 83 c3 10          	add    $0x10,%rbx
   2ad53:	4c 01 e8             	add    %r13,%rax
   2ad56:	2b 41 18             	sub    0x18(%rcx),%eax
   2ad59:	48 c7 43 f8 05 00 00 	movq   $0x5,-0x8(%rbx)
   2ad60:	00 
   2ad61:	49 83 c5 05          	add    $0x5,%r13
   2ad65:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2ad69:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2ad6e:	49 89 c2             	mov    %rax,%r10
   2ad71:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2ad75:	ff e0                	jmp    *%rax
   2ad77:	f3 0f 1e fa          	endbr64
   2ad7b:	44 8b 5b f8          	mov    -0x8(%rbx),%r11d
   2ad7f:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2ad83:	45 85 db             	test   %r11d,%r11d
   2ad86:	0f 85 d8 1c 00 00    	jne    2ca64 <JS_CallInternal+0x7a54>
   2ad8c:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   2ad93:	3b 41 20             	cmp    0x20(%rcx),%eax
   2ad96:	0f 83 c8 1c 00 00    	jae    2ca64 <JS_CallInternal+0x7a54>
   2ad9c:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   2ada3:	89 c0                	mov    %eax,%eax
   2ada5:	48 83 eb 10          	sub    $0x10,%rbx
   2ada9:	48 03 41 18          	add    0x18(%rcx),%rax
   2adad:	4c 8d 68 01          	lea    0x1(%rax),%r13
   2adb1:	0f b6 00             	movzbl (%rax),%eax
   2adb4:	49 89 c2             	mov    %rax,%r10
   2adb7:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2adbb:	f3 0f 1e fa          	endbr64
   2adbf:	4c 8d 7b f0          	lea    -0x10(%rbx),%r15
   2adc3:	48 8b 4b c0          	mov    -0x40(%rbx),%rcx
   2adc7:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   2adcb:	4c 89 e7             	mov    %r12,%rdi
   2adce:	48 8b 53 d8          	mov    -0x28(%rbx),%rdx
   2add2:	4c 8b 43 c8          	mov    -0x38(%rbx),%r8
   2add6:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   2addc:	48 c7 85 c0 fd ff ff 	movq   $0x0,-0x240(%rbp)
   2ade3:	00 00 00 00 
   2ade7:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2adee:	48 c7 85 c8 fd ff ff 	movq   $0x3,-0x238(%rbp)
   2adf5:	03 00 00 00 
   2adf9:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2adfd:	6a 02                	push   $0x2
   2adff:	41 57                	push   %r15
   2ae01:	ff b5 c8 fd ff ff    	push   -0x238(%rbp)
   2ae07:	ff b5 c0 fd ff ff    	push   -0x240(%rbp)
   2ae0d:	e8 fe a1 ff ff       	call   25010 <JS_CallInternal>
   2ae12:	48 83 c4 20          	add    $0x20,%rsp
   2ae16:	48 89 c1             	mov    %rax,%rcx
   2ae19:	48 89 d0             	mov    %rdx,%rax
   2ae1c:	83 fa 06             	cmp    $0x6,%edx
   2ae1f:	0f 84 b8 28 00 00    	je     2d6dd <JS_CallInternal+0x86cd>
   2ae25:	49 8b 77 08          	mov    0x8(%r15),%rsi
   2ae29:	83 fe f6             	cmp    $0xfffffff6,%esi
   2ae2c:	76 15                	jbe    2ae43 <JS_CallInternal+0x5e33>
   2ae2e:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   2ae32:	8b 57 fc             	mov    -0x4(%rdi),%edx
   2ae35:	83 ea 01             	sub    $0x1,%edx
   2ae38:	89 57 fc             	mov    %edx,-0x4(%rdi)
   2ae3b:	85 d2                	test   %edx,%edx
   2ae3d:	0f 8e f6 23 00 00    	jle    2d239 <JS_CallInternal+0x8229>
   2ae43:	48 89 4b f0          	mov    %rcx,-0x10(%rbx)
   2ae47:	49 83 c5 01          	add    $0x1,%r13
   2ae4b:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2ae4f:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2ae54:	49 89 c2             	mov    %rax,%r10
   2ae57:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2ae5b:	ff e0                	jmp    *%rax
   2ae5d:	f3 0f 1e fa          	endbr64
   2ae61:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2ae68:	4c 8b 7b f8          	mov    -0x8(%rbx),%r15
   2ae6c:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2ae70:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2ae74:	41 83 ff ff          	cmp    $0xffffffff,%r15d
   2ae78:	0f 85 69 44 00 00    	jne    2f2e7 <JS_CallInternal+0xa2d7>
   2ae7e:	48 8d 8d dc fe ff ff 	lea    -0x124(%rbp),%rcx
   2ae85:	4c 89 fa             	mov    %r15,%rdx
   2ae88:	48 89 c6             	mov    %rax,%rsi
   2ae8b:	4c 89 e7             	mov    %r12,%rdi
   2ae8e:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2ae95:	e8 06 b7 05 00       	call   865a0 <JS_IteratorGetCompleteValue>
   2ae9a:	48 89 c1             	mov    %rax,%rcx
   2ae9d:	48 89 d0             	mov    %rdx,%rax
   2aea0:	83 fa 06             	cmp    $0x6,%edx
   2aea3:	0f 84 c0 29 00 00    	je     2d869 <JS_CallInternal+0x8859>
   2aea9:	48 8b b5 30 fe ff ff 	mov    -0x1d0(%rbp),%rsi
   2aeb0:	8b 56 fc             	mov    -0x4(%rsi),%edx
   2aeb3:	83 ea 01             	sub    $0x1,%edx
   2aeb6:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2aeb9:	85 d2                	test   %edx,%edx
   2aebb:	0f 8e f7 2a 00 00    	jle    2d9b8 <JS_CallInternal+0x89a8>
   2aec1:	44 8b 8d dc fe ff ff 	mov    -0x124(%rbp),%r9d
   2aec8:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2aecc:	31 c0                	xor    %eax,%eax
   2aece:	48 c7 43 e0 00 00 00 	movq   $0x0,-0x20(%rbx)
   2aed5:	00 
   2aed6:	45 85 c9             	test   %r9d,%r9d
   2aed9:	48 c7 43 e8 05 00 00 	movq   $0x5,-0x18(%rbx)
   2aee0:	00 
   2aee1:	0f 95 c0             	setne  %al
   2aee4:	48 89 4b f0          	mov    %rcx,-0x10(%rbx)
   2aee8:	49 83 c5 01          	add    $0x1,%r13
   2aeec:	48 83 c3 10          	add    $0x10,%rbx
   2aef0:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2aef4:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   2aefb:	00 
   2aefc:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2af01:	49 89 c2             	mov    %rax,%r10
   2af04:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2af08:	ff e0                	jmp    *%rax
   2af0a:	f3 0f 1e fa          	endbr64
   2af0e:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2af15:	ba 01 00 00 00       	mov    $0x1,%edx
   2af1a:	48 89 de             	mov    %rbx,%rsi
   2af1d:	4c 89 e7             	mov    %r12,%rdi
   2af20:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2af24:	e8 87 44 07 00       	call   9f3b0 <js_for_of_start>
   2af29:	85 c0                	test   %eax,%eax
   2af2b:	0f 85 cf 43 00 00    	jne    2f300 <JS_CallInternal+0xa2f0>
   2af31:	48 c7 43 10 00 00 00 	movq   $0x0,0x10(%rbx)
   2af38:	00 
   2af39:	49 83 c5 01          	add    $0x1,%r13
   2af3d:	48 83 c3 20          	add    $0x20,%rbx
   2af41:	48 c7 43 f8 05 00 00 	movq   $0x5,-0x8(%rbx)
   2af48:	00 
   2af49:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2af4e:	49 89 c2             	mov    %rax,%r10
   2af51:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2af55:	ff e0                	jmp    *%rax
   2af57:	f3 0f 1e fa          	endbr64
   2af5b:	83 7b f8 ff          	cmpl   $0xffffffff,-0x8(%rbx)
   2af5f:	0f 85 eb 28 00 00    	jne    2d850 <JS_CallInternal+0x8840>
   2af65:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2af6a:	49 83 c5 01          	add    $0x1,%r13
   2af6e:	49 89 c2             	mov    %rax,%r10
   2af71:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2af75:	ff e0                	jmp    *%rax
   2af77:	f3 0f 1e fa          	endbr64
   2af7b:	45 0f b6 55 00       	movzbl 0x0(%r13),%r10d
   2af80:	4d 8d 7d 01          	lea    0x1(%r13),%r15
   2af84:	48 8b 73 c0          	mov    -0x40(%rbx),%rsi
   2af88:	4c 89 e7             	mov    %r12,%rdi
   2af8b:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2af92:	48 8b 53 c8          	mov    -0x38(%rbx),%rdx
   2af96:	44 88 95 30 fe ff ff 	mov    %r10b,-0x1d0(%rbp)
   2af9d:	49 89 f0             	mov    %rsi,%r8
   2afa0:	4c 89 78 30          	mov    %r15,0x30(%rax)
   2afa4:	44 89 d0             	mov    %r10d,%eax
   2afa7:	49 89 d1             	mov    %rdx,%r9
   2afaa:	83 e0 01             	and    $0x1,%eax
   2afad:	3c 01                	cmp    $0x1,%al
   2afaf:	19 c9                	sbb    %ecx,%ecx
   2afb1:	48 83 ec 08          	sub    $0x8,%rsp
   2afb5:	6a 00                	push   $0x0
   2afb7:	83 e1 ef             	and    $0xffffffef,%ecx
   2afba:	83 c1 17             	add    $0x17,%ecx
   2afbd:	e8 3e 49 00 00       	call   2f900 <JS_GetPropertyInternal>
   2afc2:	5f                   	pop    %rdi
   2afc3:	41 58                	pop    %r8
   2afc5:	48 89 c6             	mov    %rax,%rsi
   2afc8:	83 fa 06             	cmp    $0x6,%edx
   2afcb:	0f 84 6f a7 ff ff    	je     25740 <JS_CallInternal+0x730>
   2afd1:	8d 4a fe             	lea    -0x2(%rdx),%ecx
   2afd4:	b8 01 00 00 00       	mov    $0x1,%eax
   2afd9:	83 f9 01             	cmp    $0x1,%ecx
   2afdc:	0f 87 1e 0e 00 00    	ja     2be00 <JS_CallInternal+0x6df0>
   2afe2:	48 89 03             	mov    %rax,(%rbx)
   2afe5:	49 83 c5 02          	add    $0x2,%r13
   2afe9:	48 83 c3 10          	add    $0x10,%rbx
   2afed:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   2aff4:	00 
   2aff5:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2affa:	49 89 c2             	mov    %rax,%r10
   2affd:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b001:	ff e0                	jmp    *%rax
   2b003:	f3 0f 1e fa          	endbr64
   2b007:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2b00b:	48 8d 4b f0          	lea    -0x10(%rbx),%rcx
   2b00f:	48 8b 5b f8          	mov    -0x8(%rbx),%rbx
   2b013:	48 39 8d 48 fe ff ff 	cmp    %rcx,-0x1b8(%rbp)
   2b01a:	0f 83 5f 05 00 00    	jae    2b57f <JS_CallInternal+0x656f>
   2b020:	48 89 9d 10 fe ff ff 	mov    %rbx,-0x1f0(%rbp)
   2b027:	49 89 cf             	mov    %rcx,%r15
   2b02a:	4c 89 e3             	mov    %r12,%rbx
   2b02d:	4c 8b a5 48 fe ff ff 	mov    -0x1b8(%rbp),%r12
   2b034:	4c 89 85 30 fe ff ff 	mov    %r8,-0x1d0(%rbp)
   2b03b:	eb 0c                	jmp    2b049 <JS_CallInternal+0x6039>
   2b03d:	0f 1f 00             	nopl   (%rax)
   2b040:	4d 39 fc             	cmp    %r15,%r12
   2b043:	0f 83 22 05 00 00    	jae    2b56b <JS_CallInternal+0x655b>
   2b049:	41 83 7f f8 05       	cmpl   $0x5,-0x8(%r15)
   2b04e:	0f 84 17 05 00 00    	je     2b56b <JS_CallInternal+0x655b>
   2b054:	49 8b 47 f8          	mov    -0x8(%r15),%rax
   2b058:	49 83 ef 10          	sub    $0x10,%r15
   2b05c:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2b05f:	76 df                	jbe    2b040 <JS_CallInternal+0x6030>
   2b061:	49 8b 37             	mov    (%r15),%rsi
   2b064:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   2b067:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2b06a:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2b06d:	85 d2                	test   %edx,%edx
   2b06f:	7f cf                	jg     2b040 <JS_CallInternal+0x6030>
   2b071:	48 8b 7b 10          	mov    0x10(%rbx),%rdi
   2b075:	48 89 c2             	mov    %rax,%rdx
   2b078:	e8 53 34 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2b07d:	eb c1                	jmp    2b040 <JS_CallInternal+0x6030>
   2b07f:	f3 0f 1e fa          	endbr64
   2b083:	4c 8b 5b e8          	mov    -0x18(%rbx),%r11
   2b087:	41 8b 4d 00          	mov    0x0(%r13),%ecx
   2b08b:	4d 8d 7d 04          	lea    0x4(%r13),%r15
   2b08f:	4c 8b 53 e0          	mov    -0x20(%rbx),%r10
   2b093:	41 83 fb ff          	cmp    $0xffffffff,%r11d
   2b097:	0f 85 b3 11 00 00    	jne    2c250 <JS_CallInternal+0x7240>
   2b09d:	49 8b 72 18          	mov    0x18(%r10),%rsi
   2b0a1:	8b 46 18             	mov    0x18(%rsi),%eax
   2b0a4:	89 c2                	mov    %eax,%edx
   2b0a6:	21 ca                	and    %ecx,%edx
   2b0a8:	8b 54 96 38          	mov    0x38(%rsi,%rdx,4),%edx
   2b0ac:	48 85 d2             	test   %rdx,%rdx
   2b0af:	0f 84 9b 11 00 00    	je     2c250 <JS_CallInternal+0x7240>
   2b0b5:	48 8d 3c 85 3c 00 00 	lea    0x3c(,%rax,4),%rdi
   2b0bc:	00 
   2b0bd:	48 83 ea 01          	sub    $0x1,%rdx
   2b0c1:	48 8d 04 d7          	lea    (%rdi,%rdx,8),%rax
   2b0c5:	48 01 f0             	add    %rsi,%rax
   2b0c8:	3b 48 04             	cmp    0x4(%rax),%ecx
   2b0cb:	0f 85 71 11 00 00    	jne    2c242 <JS_CallInternal+0x7232>
   2b0d1:	0f b6 40 03          	movzbl 0x3(%rax),%eax
   2b0d5:	49 8b 72 20          	mov    0x20(%r10),%rsi
   2b0d9:	c0 e8 02             	shr    $0x2,%al
   2b0dc:	83 e0 3a             	and    $0x3a,%eax
   2b0df:	3c 02                	cmp    $0x2,%al
   2b0e1:	0f 85 69 11 00 00    	jne    2c250 <JS_CallInternal+0x7240>
   2b0e7:	48 c1 e2 04          	shl    $0x4,%rdx
   2b0eb:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2b0f0:	48 8d 04 16          	lea    (%rsi,%rdx,1),%rax
   2b0f4:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2b0f8:	48 8b 08             	mov    (%rax),%rcx
   2b0fb:	0f 11 00             	movups %xmm0,(%rax)
   2b0fe:	83 fa f6             	cmp    $0xfffffff6,%edx
   2b101:	76 11                	jbe    2b114 <JS_CallInternal+0x6104>
   2b103:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2b106:	83 e8 01             	sub    $0x1,%eax
   2b109:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2b10c:	85 c0                	test   %eax,%eax
   2b10e:	0f 8e a8 33 00 00    	jle    2e4bc <JS_CallInternal+0x94ac>
   2b114:	41 83 fb f6          	cmp    $0xfffffff6,%r11d
   2b118:	76 13                	jbe    2b12d <JS_CallInternal+0x611d>
   2b11a:	41 8b 42 fc          	mov    -0x4(%r10),%eax
   2b11e:	83 e8 01             	sub    $0x1,%eax
   2b121:	41 89 42 fc          	mov    %eax,-0x4(%r10)
   2b125:	85 c0                	test   %eax,%eax
   2b127:	0f 8e 43 34 00 00    	jle    2e570 <JS_CallInternal+0x9560>
   2b12d:	48 83 eb 20          	sub    $0x20,%rbx
   2b131:	41 0f b6 45 04       	movzbl 0x4(%r13),%eax
   2b136:	49 83 c5 05          	add    $0x5,%r13
   2b13a:	49 89 c2             	mov    %rax,%r10
   2b13d:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b141:	ff e0                	jmp    *%rax
   2b143:	f3 0f 1e fa          	endbr64
   2b147:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   2b14b:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   2b14f:	83 fe ff             	cmp    $0xffffffff,%esi
   2b152:	0f 85 ce 06 00 00    	jne    2b826 <JS_CallInternal+0x6816>
   2b158:	48 89 f9             	mov    %rdi,%rcx
   2b15b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2b160:	4c 8b 41 18          	mov    0x18(%rcx),%r8
   2b164:	41 8b 50 18          	mov    0x18(%r8),%edx
   2b168:	89 d0                	mov    %edx,%eax
   2b16a:	83 e0 32             	and    $0x32,%eax
   2b16d:	41 8b 44 80 38       	mov    0x38(%r8,%rax,4),%eax
   2b172:	48 85 c0             	test   %rax,%rax
   2b175:	0f 84 46 01 00 00    	je     2b2c1 <JS_CallInternal+0x62b1>
   2b17b:	4c 8d 0c 95 3c 00 00 	lea    0x3c(,%rdx,4),%r9
   2b182:	00 
   2b183:	48 83 e8 01          	sub    $0x1,%rax
   2b187:	49 8d 14 c1          	lea    (%r9,%rax,8),%rdx
   2b18b:	4c 01 c2             	add    %r8,%rdx
   2b18e:	83 7a 04 32          	cmpl   $0x32,0x4(%rdx)
   2b192:	0f 85 1c 01 00 00    	jne    2b2b4 <JS_CallInternal+0x62a4>
   2b198:	48 8b 49 20          	mov    0x20(%rcx),%rcx
   2b19c:	80 7a 03 3f          	cmpb   $0x3f,0x3(%rdx)
   2b1a0:	0f 87 80 06 00 00    	ja     2b826 <JS_CallInternal+0x6816>
   2b1a6:	48 c1 e0 04          	shl    $0x4,%rax
   2b1aa:	48 01 c1             	add    %rax,%rcx
   2b1ad:	48 8b 41 08          	mov    0x8(%rcx),%rax
   2b1b1:	4c 8b 39             	mov    (%rcx),%r15
   2b1b4:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2b1b7:	76 05                	jbe    2b1be <JS_CallInternal+0x61ae>
   2b1b9:	41 83 47 fc 01       	addl   $0x1,-0x4(%r15)
   2b1be:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   2b1c2:	83 fe f6             	cmp    $0xfffffff6,%esi
   2b1c5:	76 15                	jbe    2b1dc <JS_CallInternal+0x61cc>
   2b1c7:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2b1cb:	8b 51 fc             	mov    -0x4(%rcx),%edx
   2b1ce:	83 ea 01             	sub    $0x1,%edx
   2b1d1:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2b1d4:	85 d2                	test   %edx,%edx
   2b1d6:	0f 8e 74 1f 00 00    	jle    2d150 <JS_CallInternal+0x8140>
   2b1dc:	4c 89 7b f0          	mov    %r15,-0x10(%rbx)
   2b1e0:	49 83 c5 01          	add    $0x1,%r13
   2b1e4:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2b1e8:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2b1ed:	49 89 c2             	mov    %rax,%r10
   2b1f0:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b1f4:	ff e0                	jmp    *%rax
   2b1f6:	f3 0f 1e fa          	endbr64
   2b1fa:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2b1fe:	41 8b 4d 00          	mov    0x0(%r13),%ecx
   2b202:	4d 8d 7d 04          	lea    0x4(%r13),%r15
   2b206:	4c 8b 4b f0          	mov    -0x10(%rbx),%r9
   2b20a:	83 f8 ff             	cmp    $0xffffffff,%eax
   2b20d:	0f 85 cb 06 00 00    	jne    2b8de <JS_CallInternal+0x68ce>
   2b213:	4c 89 cf             	mov    %r9,%rdi
   2b216:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   2b21d:	00 00 00 
   2b220:	4c 8b 47 18          	mov    0x18(%rdi),%r8
   2b224:	41 8b 70 18          	mov    0x18(%r8),%esi
   2b228:	89 f2                	mov    %esi,%edx
   2b22a:	21 ca                	and    %ecx,%edx
   2b22c:	41 8b 54 90 38       	mov    0x38(%r8,%rdx,4),%edx
   2b231:	48 85 d2             	test   %rdx,%rdx
   2b234:	0f 84 b9 00 00 00    	je     2b2f3 <JS_CallInternal+0x62e3>
   2b23a:	4c 8d 14 b5 3c 00 00 	lea    0x3c(,%rsi,4),%r10
   2b241:	00 
   2b242:	48 83 ea 01          	sub    $0x1,%rdx
   2b246:	49 8d 34 d2          	lea    (%r10,%rdx,8),%rsi
   2b24a:	4c 01 c6             	add    %r8,%rsi
   2b24d:	3b 4e 04             	cmp    0x4(%rsi),%ecx
   2b250:	0f 85 8f 00 00 00    	jne    2b2e5 <JS_CallInternal+0x62d5>
   2b256:	48 8b 7f 20          	mov    0x20(%rdi),%rdi
   2b25a:	80 7e 03 3f          	cmpb   $0x3f,0x3(%rsi)
   2b25e:	0f 87 7a 06 00 00    	ja     2b8de <JS_CallInternal+0x68ce>
   2b264:	48 c1 e2 04          	shl    $0x4,%rdx
   2b268:	48 01 d7             	add    %rdx,%rdi
   2b26b:	48 8b 47 08          	mov    0x8(%rdi),%rax
   2b26f:	4c 8b 3f             	mov    (%rdi),%r15
   2b272:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2b275:	76 05                	jbe    2b27c <JS_CallInternal+0x626c>
   2b277:	41 83 47 fc 01       	addl   $0x1,-0x4(%r15)
   2b27c:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   2b280:	83 fe f6             	cmp    $0xfffffff6,%esi
   2b283:	76 15                	jbe    2b29a <JS_CallInternal+0x628a>
   2b285:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2b289:	8b 51 fc             	mov    -0x4(%rcx),%edx
   2b28c:	83 ea 01             	sub    $0x1,%edx
   2b28f:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2b292:	85 d2                	test   %edx,%edx
   2b294:	0f 8e 93 1c 00 00    	jle    2cf2d <JS_CallInternal+0x7f1d>
   2b29a:	4c 89 7b f0          	mov    %r15,-0x10(%rbx)
   2b29e:	49 83 c5 05          	add    $0x5,%r13
   2b2a2:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2b2a6:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2b2ab:	49 89 c2             	mov    %rax,%r10
   2b2ae:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b2b2:	ff e0                	jmp    *%rax
   2b2b4:	8b 02                	mov    (%rdx),%eax
   2b2b6:	25 ff ff ff 03       	and    $0x3ffffff,%eax
   2b2bb:	0f 85 c2 fe ff ff    	jne    2b183 <JS_CallInternal+0x6173>
   2b2c1:	f6 41 10 08          	testb  $0x8,0x10(%rcx)
   2b2c5:	0f 85 51 05 00 00    	jne    2b81c <JS_CallInternal+0x680c>
   2b2cb:	49 8b 48 30          	mov    0x30(%r8),%rcx
   2b2cf:	48 85 c9             	test   %rcx,%rcx
   2b2d2:	0f 85 88 fe ff ff    	jne    2b160 <JS_CallInternal+0x6150>
   2b2d8:	b8 03 00 00 00       	mov    $0x3,%eax
   2b2dd:	45 31 ff             	xor    %r15d,%r15d
   2b2e0:	e9 d9 fe ff ff       	jmp    2b1be <JS_CallInternal+0x61ae>
   2b2e5:	8b 16                	mov    (%rsi),%edx
   2b2e7:	81 e2 ff ff ff 03    	and    $0x3ffffff,%edx
   2b2ed:	0f 85 4f ff ff ff    	jne    2b242 <JS_CallInternal+0x6232>
   2b2f3:	f6 47 10 08          	testb  $0x8,0x10(%rdi)
   2b2f7:	0f 85 d7 05 00 00    	jne    2b8d4 <JS_CallInternal+0x68c4>
   2b2fd:	49 8b 78 30          	mov    0x30(%r8),%rdi
   2b301:	48 85 ff             	test   %rdi,%rdi
   2b304:	0f 85 16 ff ff ff    	jne    2b220 <JS_CallInternal+0x6210>
   2b30a:	b8 03 00 00 00       	mov    $0x3,%eax
   2b30f:	45 31 ff             	xor    %r15d,%r15d
   2b312:	e9 65 ff ff ff       	jmp    2b27c <JS_CallInternal+0x626c>
   2b317:	8b 16                	mov    (%rsi),%edx
   2b319:	81 e2 ff ff ff 03    	and    $0x3ffffff,%edx
   2b31f:	0f 85 9d e1 ff ff    	jne    294c2 <JS_CallInternal+0x44b2>
   2b325:	f6 47 10 08          	testb  $0x8,0x10(%rdi)
   2b329:	0f 85 f3 05 00 00    	jne    2b922 <JS_CallInternal+0x6912>
   2b32f:	49 8b 78 30          	mov    0x30(%r8),%rdi
   2b333:	48 85 ff             	test   %rdi,%rdi
   2b336:	0f 85 64 e1 ff ff    	jne    294a0 <JS_CallInternal+0x4490>
   2b33c:	ba 03 00 00 00       	mov    $0x3,%edx
   2b341:	31 c0                	xor    %eax,%eax
   2b343:	e9 b3 e1 ff ff       	jmp    294fb <JS_CallInternal+0x44eb>
   2b348:	8b 06                	mov    (%rsi),%eax
   2b34a:	25 ff ff ff 03       	and    $0x3ffffff,%eax
   2b34f:	0f 85 67 f8 ff ff    	jne    2abbc <JS_CallInternal+0x5bac>
   2b355:	f6 47 10 08          	testb  $0x8,0x10(%rdi)
   2b359:	0f 85 09 06 00 00    	jne    2b968 <JS_CallInternal+0x6958>
   2b35f:	48 8b 7a 30          	mov    0x30(%rdx),%rdi
   2b363:	48 85 ff             	test   %rdi,%rdi
   2b366:	0f 84 84 18 00 00    	je     2cbf0 <JS_CallInternal+0x7be0>
   2b36c:	48 8b 57 18          	mov    0x18(%rdi),%rdx
   2b370:	e9 2b f8 ff ff       	jmp    2aba0 <JS_CallInternal+0x5b90>
   2b375:	8b 16                	mov    (%rsi),%edx
   2b377:	81 e2 ff ff ff 03    	and    $0x3ffffff,%edx
   2b37d:	0f 85 09 f9 ff ff    	jne    2ac8c <JS_CallInternal+0x5c7c>
   2b383:	41 f6 40 10 08       	testb  $0x8,0x10(%r8)
   2b388:	0f 85 2f 06 00 00    	jne    2b9bd <JS_CallInternal+0x69ad>
   2b38e:	4c 8b 47 30          	mov    0x30(%rdi),%r8
   2b392:	4d 85 c0             	test   %r8,%r8
   2b395:	0f 84 e4 17 00 00    	je     2cb7f <JS_CallInternal+0x7b6f>
   2b39b:	49 8b 78 18          	mov    0x18(%r8),%rdi
   2b39f:	e9 cc f8 ff ff       	jmp    2ac70 <JS_CallInternal+0x5c60>
   2b3a4:	8b b5 a8 fe ff ff    	mov    -0x158(%rbp),%esi
   2b3aa:	41 39 f0             	cmp    %esi,%r8d
   2b3ad:	41 89 f4             	mov    %esi,%r12d
   2b3b0:	45 0f 4e e0          	cmovle %r8d,%r12d
   2b3b4:	45 85 e4             	test   %r12d,%r12d
   2b3b7:	0f 8e fc 15 00 00    	jle    2c9b9 <JS_CallInternal+0x79a9>
   2b3bd:	4d 63 ec             	movslq %r12d,%r13
   2b3c0:	4c 8b bd 98 fe ff ff 	mov    -0x168(%rbp),%r15
   2b3c7:	31 f6                	xor    %esi,%esi
   2b3c9:	49 c1 e5 04          	shl    $0x4,%r13
   2b3cd:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   2b3d4:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2b3db:	00 00 00 00 
   2b3df:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2b3e6:	00 00 00 00 
   2b3ea:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2b3f1:	00 00 00 00 
   2b3f5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2b3fc:	00 00 00 00 
   2b400:	4d 8b 5c 37 08       	mov    0x8(%r15,%rsi,1),%r11
   2b405:	4d 8b 34 37          	mov    (%r15,%rsi,1),%r14
   2b409:	41 83 fb f6          	cmp    $0xfffffff6,%r11d
   2b40d:	76 05                	jbe    2b414 <JS_CallInternal+0x6404>
   2b40f:	41 83 46 fc 01       	addl   $0x1,-0x4(%r14)
   2b414:	4c 89 34 37          	mov    %r14,(%rdi,%rsi,1)
   2b418:	4c 89 5c 37 08       	mov    %r11,0x8(%rdi,%rsi,1)
   2b41d:	48 83 c6 10          	add    $0x10,%rsi
   2b421:	4c 39 ee             	cmp    %r13,%rsi
   2b424:	75 da                	jne    2b400 <JS_CallInternal+0x63f0>
   2b426:	45 39 e0             	cmp    %r12d,%r8d
   2b429:	7e 4d                	jle    2b478 <JS_CallInternal+0x6468>
   2b42b:	45 8d 58 ff          	lea    -0x1(%r8),%r11d
   2b42f:	4d 63 ec             	movslq %r12d,%r13
   2b432:	45 29 e3             	sub    %r12d,%r11d
   2b435:	4c 89 ee             	mov    %r13,%rsi
   2b438:	4d 01 eb             	add    %r13,%r11
   2b43b:	48 c1 e6 04          	shl    $0x4,%rsi
   2b43f:	49 c1 e3 04          	shl    $0x4,%r11
   2b443:	48 01 fe             	add    %rdi,%rsi
   2b446:	4e 8d 5c 1f 10       	lea    0x10(%rdi,%r11,1),%r11
   2b44b:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   2b452:	00 00 00 
   2b455:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2b45c:	00 00 00 00 
   2b460:	48 c7 06 00 00 00 00 	movq   $0x0,(%rsi)
   2b467:	48 83 c6 10          	add    $0x10,%rsi
   2b46b:	48 c7 46 f8 03 00 00 	movq   $0x3,-0x8(%rsi)
   2b472:	00 
   2b473:	4c 39 de             	cmp    %r11,%rsi
   2b476:	75 e8                	jne    2b460 <JS_CallInternal+0x6450>
   2b478:	44 89 85 38 ff ff ff 	mov    %r8d,-0xc8(%rbp)
   2b47f:	48 89 bd 80 fe ff ff 	mov    %rdi,-0x180(%rbp)
   2b486:	e9 65 9d ff ff       	jmp    251f0 <JS_CallInternal+0x1e0>
   2b48b:	48 83 ec 08          	sub    $0x8,%rsp
   2b48f:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   2b495:	49 89 d1             	mov    %rdx,%r9
   2b498:	48 89 c6             	mov    %rax,%rsi
   2b49b:	44 89 95 00 fe ff ff 	mov    %r10d,-0x200(%rbp)
   2b4a2:	4c 89 e7             	mov    %r12,%rdi
   2b4a5:	6a 00                	push   $0x0
   2b4a7:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2b4ae:	e8 4d 44 00 00       	call   2f900 <JS_GetPropertyInternal>
   2b4b3:	4c 89 e7             	mov    %r12,%rdi
   2b4b6:	48 89 c6             	mov    %rax,%rsi
   2b4b9:	e8 62 55 ff ff       	call   20a20 <JS_ToBoolFree>
   2b4be:	4c 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%r8
   2b4c5:	44 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10d
   2b4cc:	41 8b 48 fc          	mov    -0x4(%r8),%ecx
   2b4d0:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2b4d3:	85 d2                	test   %edx,%edx
   2b4d5:	41 89 50 fc          	mov    %edx,-0x4(%r8)
   2b4d9:	41 5b                	pop    %r11
   2b4db:	59                   	pop    %rcx
   2b4dc:	0f 8e ba 38 00 00    	jle    2ed9c <JS_CallInternal+0x9d8c>
   2b4e2:	85 c0                	test   %eax,%eax
   2b4e4:	0f 88 56 a2 ff ff    	js     25740 <JS_CallInternal+0x730>
   2b4ea:	0f 84 da 9e ff ff    	je     253ca <JS_CallInternal+0x3ba>
   2b4f0:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2b4f4:	48 83 eb 10          	sub    $0x10,%rbx
   2b4f8:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2b4fb:	0f 86 f7 a3 ff ff    	jbe    258f8 <JS_CallInternal+0x8e8>
   2b501:	48 8b 0b             	mov    (%rbx),%rcx
   2b504:	8b 71 fc             	mov    -0x4(%rcx),%esi
   2b507:	8d 56 ff             	lea    -0x1(%rsi),%edx
   2b50a:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2b50d:	85 d2                	test   %edx,%edx
   2b50f:	0f 8f e3 a3 ff ff    	jg     258f8 <JS_CallInternal+0x8e8>
   2b515:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2b51a:	48 89 c2             	mov    %rax,%rdx
   2b51d:	48 89 ce             	mov    %rcx,%rsi
   2b520:	e8 ab 2f ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2b525:	e9 ce a3 ff ff       	jmp    258f8 <JS_CallInternal+0x8e8>
   2b52a:	8b 95 10 fe ff ff    	mov    -0x1f0(%rbp),%edx
   2b530:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2b537:	4d 89 ec             	mov    %r13,%r12
   2b53a:	4c 8b ad 00 fe ff ff 	mov    -0x200(%rbp),%r13
   2b541:	83 c2 02             	add    $0x2,%edx
   2b544:	48 63 d2             	movslq %edx,%rdx
   2b547:	49 83 c5 03          	add    $0x3,%r13
   2b54b:	48 c1 e2 04          	shl    $0x4,%rdx
   2b54f:	48 29 d1             	sub    %rdx,%rcx
   2b552:	4c 89 01             	mov    %r8,(%rcx)
   2b555:	48 8d 59 10          	lea    0x10(%rcx),%rbx
   2b559:	48 89 41 08          	mov    %rax,0x8(%rcx)
   2b55d:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2b562:	49 89 c2             	mov    %rax,%r10
   2b565:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b569:	ff e0                	jmp    *%rax
   2b56b:	49 89 dc             	mov    %rbx,%r12
   2b56e:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2b575:	48 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%rbx
   2b57c:	4c 89 f9             	mov    %r15,%rcx
   2b57f:	48 39 8d 48 fe ff ff 	cmp    %rcx,-0x1b8(%rbp)
   2b586:	0f 84 c0 21 00 00    	je     2d74c <JS_CallInternal+0x873c>
   2b58c:	48 89 59 f8          	mov    %rbx,-0x8(%rcx)
   2b590:	49 83 c5 01          	add    $0x1,%r13
   2b594:	48 89 cb             	mov    %rcx,%rbx
   2b597:	4c 89 41 f0          	mov    %r8,-0x10(%rcx)
   2b59b:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2b5a0:	49 89 c2             	mov    %rax,%r10
   2b5a3:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b5a7:	ff e0                	jmp    *%rax
   2b5a9:	4d 89 d4             	mov    %r10,%r12
   2b5ac:	48 8b 9d 20 fe ff ff 	mov    -0x1e0(%rbp),%rbx
   2b5b3:	4c 8b 95 e8 fd ff ff 	mov    -0x218(%rbp),%r10
   2b5ba:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2b5bf:	4c 89 d6             	mov    %r10,%rsi
   2b5c2:	e8 29 aa fe ff       	call   15ff0 <__js_free>
   2b5c7:	83 bd 10 fe ff ff 06 	cmpl   $0x6,-0x1f0(%rbp)
   2b5ce:	0f 84 6c a1 ff ff    	je     25740 <JS_CallInternal+0x730>
   2b5d4:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   2b5d8:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2b5db:	76 15                	jbe    2b5f2 <JS_CallInternal+0x65e2>
   2b5dd:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   2b5e1:	8b 71 fc             	mov    -0x4(%rcx),%esi
   2b5e4:	8d 56 ff             	lea    -0x1(%rsi),%edx
   2b5e7:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2b5ea:	85 d2                	test   %edx,%edx
   2b5ec:	0f 8e 17 2b 00 00    	jle    2e109 <JS_CallInternal+0x90f9>
   2b5f2:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2b5f9:	48 8b 41 08          	mov    0x8(%rcx),%rax
   2b5fd:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2b600:	76 14                	jbe    2b616 <JS_CallInternal+0x6606>
   2b602:	48 8b 09             	mov    (%rcx),%rcx
   2b605:	8b 71 fc             	mov    -0x4(%rcx),%esi
   2b608:	8d 56 ff             	lea    -0x1(%rsi),%edx
   2b60b:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2b60e:	85 d2                	test   %edx,%edx
   2b610:	0f 8e f2 21 00 00    	jle    2d808 <JS_CallInternal+0x87f8>
   2b616:	48 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%rax
   2b61d:	49 83 c5 03          	add    $0x3,%r13
   2b621:	48 89 43 e0          	mov    %rax,-0x20(%rbx)
   2b625:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2b62c:	48 89 43 e8          	mov    %rax,-0x18(%rbx)
   2b630:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2b635:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   2b63c:	49 89 c2             	mov    %rax,%r10
   2b63f:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b643:	ff e0                	jmp    *%rax
   2b645:	80 fa 01             	cmp    $0x1,%dl
   2b648:	0f 84 22 02 00 00    	je     2b870 <JS_CallInternal+0x6860>
   2b64e:	80 cc 10             	or     $0x10,%ah
   2b651:	4c 8d 6b f0          	lea    -0x10(%rbx),%r13
   2b655:	f3 0f 6f 73 f0       	movdqu -0x10(%rbx),%xmm6
   2b65a:	4c 89 e7             	mov    %r12,%rdi
   2b65d:	89 85 d0 fd ff ff    	mov    %eax,-0x230(%rbp)
   2b663:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2b667:	8b b5 30 fe ff ff    	mov    -0x1d0(%rbp),%esi
   2b66d:	0f 29 b5 90 fd ff ff 	movaps %xmm6,-0x270(%rbp)
   2b674:	48 89 85 20 fe ff ff 	mov    %rax,-0x1e0(%rbp)
   2b67b:	49 8b 45 08          	mov    0x8(%r13),%rax
   2b67f:	48 89 85 e8 fd ff ff 	mov    %rax,-0x218(%rbp)
   2b686:	e8 b5 82 01 00       	call   43940 <js_get_function_name>
   2b68b:	4c 8d 05 b2 ca 0a 00 	lea    0xacab2(%rip),%r8        # d8144 <_IO_stdin_used+0x144>
   2b692:	48 8d 35 0e cf 0a 00 	lea    0xacf0e(%rip),%rsi        # d85a7 <_IO_stdin_used+0x5a7>
   2b699:	4c 89 e7             	mov    %r12,%rdi
   2b69c:	48 89 d1             	mov    %rdx,%rcx
   2b69f:	48 89 c2             	mov    %rax,%rdx
   2b6a2:	e8 f9 80 01 00       	call   437a0 <JS_ConcatString3>
   2b6a7:	49 89 c0             	mov    %rax,%r8
   2b6aa:	49 89 d1             	mov    %rdx,%r9
   2b6ad:	e9 62 a9 ff ff       	jmp    26014 <JS_CallInternal+0x1004>
   2b6b2:	8b 85 30 fe ff ff    	mov    -0x1d0(%rbp),%eax
   2b6b8:	4c 89 eb             	mov    %r13,%rbx
   2b6bb:	48 8b b5 00 fe ff ff 	mov    -0x200(%rbp),%rsi
   2b6c2:	4c 8b ad 10 fe ff ff 	mov    -0x1f0(%rbp),%r13
   2b6c9:	48 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%rdx
   2b6d0:	83 c0 01             	add    $0x1,%eax
   2b6d3:	48 98                	cltq
   2b6d5:	49 83 c5 05          	add    $0x5,%r13
   2b6d9:	48 c1 e0 04          	shl    $0x4,%rax
   2b6dd:	48 29 c3             	sub    %rax,%rbx
   2b6e0:	48 89 d9             	mov    %rbx,%rcx
   2b6e3:	48 8d 5b 10          	lea    0x10(%rbx),%rbx
   2b6e7:	48 89 31             	mov    %rsi,(%rcx)
   2b6ea:	48 89 51 08          	mov    %rdx,0x8(%rcx)
   2b6ee:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2b6f3:	49 89 c2             	mov    %rax,%r10
   2b6f6:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b6fa:	ff e0                	jmp    *%rax
   2b6fc:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2b702:	48 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%rbx
   2b709:	4d 89 ec             	mov    %r13,%r12
   2b70c:	48 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%rdx
   2b713:	4c 8b ad 00 fe ff ff 	mov    -0x200(%rbp),%r13
   2b71a:	83 c1 02             	add    $0x2,%ecx
   2b71d:	48 63 c9             	movslq %ecx,%rcx
   2b720:	49 83 c5 03          	add    $0x3,%r13
   2b724:	48 c1 e1 04          	shl    $0x4,%rcx
   2b728:	48 29 cb             	sub    %rcx,%rbx
   2b72b:	48 89 de             	mov    %rbx,%rsi
   2b72e:	48 8d 5b 10          	lea    0x10(%rbx),%rbx
   2b732:	48 89 06             	mov    %rax,(%rsi)
   2b735:	48 89 56 08          	mov    %rdx,0x8(%rsi)
   2b739:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2b73e:	49 89 c2             	mov    %rax,%r10
   2b741:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b745:	ff e0                	jmp    *%rax
   2b747:	8b 10                	mov    (%rax),%edx
   2b749:	81 e2 ff ff ff 03    	and    $0x3ffffff,%edx
   2b74f:	0f 85 81 b1 ff ff    	jne    268d6 <JS_CallInternal+0x18c6>
   2b755:	89 f2                	mov    %esi,%edx
   2b757:	b9 07 00 00 00       	mov    $0x7,%ecx
   2b75c:	4c 89 fe             	mov    %r15,%rsi
   2b75f:	4c 89 e7             	mov    %r12,%rdi
   2b762:	e8 39 e2 01 00       	call   499a0 <add_property>
   2b767:	48 85 c0             	test   %rax,%rax
   2b76a:	0f 84 10 2c 00 00    	je     2e380 <JS_CallInternal+0x9370>
   2b770:	48 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%rbx
   2b777:	48 89 18             	mov    %rbx,(%rax)
   2b77a:	48 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%rbx
   2b781:	48 89 58 08          	mov    %rbx,0x8(%rax)
   2b785:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   2b78c:	48 8b 43 08          	mov    0x8(%rbx),%rax
   2b790:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2b793:	76 14                	jbe    2b7a9 <JS_CallInternal+0x6799>
   2b795:	48 8b 0b             	mov    (%rbx),%rcx
   2b798:	8b 59 fc             	mov    -0x4(%rcx),%ebx
   2b79b:	8d 53 ff             	lea    -0x1(%rbx),%edx
   2b79e:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2b7a1:	85 d2                	test   %edx,%edx
   2b7a3:	0f 8e 17 2b 00 00    	jle    2e2c0 <JS_CallInternal+0x92b0>
   2b7a9:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   2b7ae:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   2b7b5:	49 83 c5 01          	add    $0x1,%r13
   2b7b9:	49 89 c2             	mov    %rax,%r10
   2b7bc:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b7c0:	ff e0                	jmp    *%rax
   2b7c2:	81 bd 30 fe ff ff f2 	cmpl   $0xf2,-0x1d0(%rbp)
   2b7c9:	00 00 00 
   2b7cc:	0f 8f 7d 11 00 00    	jg     2c94f <JS_CallInternal+0x793f>
   2b7d2:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   2b7d6:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2b7d9:	0f 86 0e a9 ff ff    	jbe    260ed <JS_CallInternal+0x10dd>
   2b7df:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   2b7e3:	8b 56 fc             	mov    -0x4(%rsi),%edx
   2b7e6:	83 ea 01             	sub    $0x1,%edx
   2b7e9:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2b7ec:	85 d2                	test   %edx,%edx
   2b7ee:	0f 8f f9 a8 ff ff    	jg     260ed <JS_CallInternal+0x10dd>
   2b7f4:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2b7f9:	48 89 c2             	mov    %rax,%rdx
   2b7fc:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2b802:	e8 c9 2c ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2b807:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2b80d:	e9 db a8 ff ff       	jmp    260ed <JS_CallInternal+0x10dd>
   2b812:	ba 08 00 00 00       	mov    $0x8,%edx
   2b817:	e9 59 df ff ff       	jmp    29775 <JS_CallInternal+0x4765>
   2b81c:	48 89 cf             	mov    %rcx,%rdi
   2b81f:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
   2b826:	48 83 ec 08          	sub    $0x8,%rsp
   2b82a:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2b82e:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2b832:	48 89 f2             	mov    %rsi,%rdx
   2b835:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2b83c:	48 89 fe             	mov    %rdi,%rsi
   2b83f:	b9 32 00 00 00       	mov    $0x32,%ecx
   2b844:	4c 89 e7             	mov    %r12,%rdi
   2b847:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2b84b:	6a 00                	push   $0x0
   2b84d:	e8 ae 40 00 00       	call   2f900 <JS_GetPropertyInternal>
   2b852:	5f                   	pop    %rdi
   2b853:	41 58                	pop    %r8
   2b855:	49 89 c7             	mov    %rax,%r15
   2b858:	48 89 d0             	mov    %rdx,%rax
   2b85b:	83 fa 06             	cmp    $0x6,%edx
   2b85e:	0f 85 5a f9 ff ff    	jne    2b1be <JS_CallInternal+0x61ae>
   2b864:	4d 89 ef             	mov    %r13,%r15
   2b867:	e9 d4 9e ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2b86c:	0f 1f 40 00          	nopl   0x0(%rax)
   2b870:	80 cc 08             	or     $0x8,%ah
   2b873:	4c 8d 6b f0          	lea    -0x10(%rbx),%r13
   2b877:	f3 0f 6f 6b f0       	movdqu -0x10(%rbx),%xmm5
   2b87c:	4c 89 e7             	mov    %r12,%rdi
   2b87f:	89 85 d0 fd ff ff    	mov    %eax,-0x230(%rbp)
   2b885:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2b889:	8b b5 30 fe ff ff    	mov    -0x1d0(%rbp),%esi
   2b88f:	0f 29 ad a0 fd ff ff 	movaps %xmm5,-0x260(%rbp)
   2b896:	48 89 85 20 fe ff ff 	mov    %rax,-0x1e0(%rbp)
   2b89d:	49 8b 45 08          	mov    0x8(%r13),%rax
   2b8a1:	48 89 85 e8 fd ff ff 	mov    %rax,-0x218(%rbp)
   2b8a8:	e8 93 80 01 00       	call   43940 <js_get_function_name>
   2b8ad:	4c 8d 05 90 c8 0a 00 	lea    0xac890(%rip),%r8        # d8144 <_IO_stdin_used+0x144>
   2b8b4:	48 8d 35 e7 cc 0a 00 	lea    0xacce7(%rip),%rsi        # d85a2 <_IO_stdin_used+0x5a2>
   2b8bb:	4c 89 e7             	mov    %r12,%rdi
   2b8be:	48 89 d1             	mov    %rdx,%rcx
   2b8c1:	48 89 c2             	mov    %rax,%rdx
   2b8c4:	e8 d7 7e 01 00       	call   437a0 <JS_ConcatString3>
   2b8c9:	49 89 c0             	mov    %rax,%r8
   2b8cc:	49 89 d1             	mov    %rdx,%r9
   2b8cf:	e9 40 a7 ff ff       	jmp    26014 <JS_CallInternal+0x1004>
   2b8d4:	49 89 f9             	mov    %rdi,%r9
   2b8d7:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   2b8de:	48 8b 95 b8 fe ff ff 	mov    -0x148(%rbp),%rdx
   2b8e5:	48 83 ec 08          	sub    $0x8,%rsp
   2b8e9:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2b8ed:	4c 89 e7             	mov    %r12,%rdi
   2b8f0:	4c 89 7a 30          	mov    %r15,0x30(%rdx)
   2b8f4:	48 89 c2             	mov    %rax,%rdx
   2b8f7:	4c 89 c8             	mov    %r9,%rax
   2b8fa:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2b8fe:	6a 00                	push   $0x0
   2b900:	48 89 c6             	mov    %rax,%rsi
   2b903:	e8 f8 3f 00 00       	call   2f900 <JS_GetPropertyInternal>
   2b908:	41 5b                	pop    %r11
   2b90a:	48 89 c1             	mov    %rax,%rcx
   2b90d:	48 89 d0             	mov    %rdx,%rax
   2b910:	5a                   	pop    %rdx
   2b911:	83 f8 06             	cmp    $0x6,%eax
   2b914:	0f 84 26 9e ff ff    	je     25740 <JS_CallInternal+0x730>
   2b91a:	49 89 cf             	mov    %rcx,%r15
   2b91d:	e9 5a f9 ff ff       	jmp    2b27c <JS_CallInternal+0x626c>
   2b922:	49 89 f9             	mov    %rdi,%r9
   2b925:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   2b92c:	48 83 ec 08          	sub    $0x8,%rsp
   2b930:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2b934:	48 89 c2             	mov    %rax,%rdx
   2b937:	4c 89 c8             	mov    %r9,%rax
   2b93a:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   2b941:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2b945:	4c 89 e7             	mov    %r12,%rdi
   2b948:	4c 89 7e 30          	mov    %r15,0x30(%rsi)
   2b94c:	48 89 c6             	mov    %rax,%rsi
   2b94f:	6a 00                	push   $0x0
   2b951:	e8 aa 3f 00 00       	call   2f900 <JS_GetPropertyInternal>
   2b956:	41 59                	pop    %r9
   2b958:	41 5a                	pop    %r10
   2b95a:	83 fa 06             	cmp    $0x6,%edx
   2b95d:	0f 85 98 db ff ff    	jne    294fb <JS_CallInternal+0x44eb>
   2b963:	e9 d8 9d ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2b968:	48 c7 85 30 fe ff ff 	movq   $0xffffffffffffffff,-0x1d0(%rbp)
   2b96f:	ff ff ff ff 
   2b973:	49 89 fa             	mov    %rdi,%r10
   2b976:	48 83 ec 08          	sub    $0x8,%rsp
   2b97a:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2b97e:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2b982:	4c 89 d6             	mov    %r10,%rsi
   2b985:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2b98c:	4c 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%r11
   2b993:	4c 89 e7             	mov    %r12,%rdi
   2b996:	4c 89 78 30          	mov    %r15,0x30(%rax)
   2b99a:	4c 89 da             	mov    %r11,%rdx
   2b99d:	6a 00                	push   $0x0
   2b99f:	e8 5c 3f 00 00       	call   2f900 <JS_GetPropertyInternal>
   2b9a4:	5e                   	pop    %rsi
   2b9a5:	5f                   	pop    %rdi
   2b9a6:	48 89 c1             	mov    %rax,%rcx
   2b9a9:	48 89 d0             	mov    %rdx,%rax
   2b9ac:	83 fa 06             	cmp    $0x6,%edx
   2b9af:	0f 84 8b 9d ff ff    	je     25740 <JS_CallInternal+0x730>
   2b9b5:	49 89 cf             	mov    %rcx,%r15
   2b9b8:	e9 51 f2 ff ff       	jmp    2ac0e <JS_CallInternal+0x5bfe>
   2b9bd:	4c 89 c0             	mov    %r8,%rax
   2b9c0:	49 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%r11
   2b9c7:	48 83 ec 08          	sub    $0x8,%rsp
   2b9cb:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2b9cf:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2b9d3:	4c 89 da             	mov    %r11,%rdx
   2b9d6:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   2b9dd:	4c 89 e7             	mov    %r12,%rdi
   2b9e0:	4c 89 7e 30          	mov    %r15,0x30(%rsi)
   2b9e4:	48 89 c6             	mov    %rax,%rsi
   2b9e7:	6a 00                	push   $0x0
   2b9e9:	e8 12 3f 00 00       	call   2f900 <JS_GetPropertyInternal>
   2b9ee:	41 59                	pop    %r9
   2b9f0:	41 5a                	pop    %r10
   2b9f2:	48 89 d1             	mov    %rdx,%rcx
   2b9f5:	83 fa 06             	cmp    $0x6,%edx
   2b9f8:	0f 84 42 9d ff ff    	je     25740 <JS_CallInternal+0x730>
   2b9fe:	49 89 c7             	mov    %rax,%r15
   2ba01:	e9 cb f2 ff ff       	jmp    2acd1 <JS_CallInternal+0x5cc1>
   2ba06:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   2ba0d:	4c 89 7e 30          	mov    %r15,0x30(%rsi)
   2ba11:	83 fa f6             	cmp    $0xfffffff6,%edx
   2ba14:	76 04                	jbe    2ba1a <JS_CallInternal+0x6a0a>
   2ba16:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2ba1a:	48 89 95 e8 fe ff ff 	mov    %rdx,-0x118(%rbp)
   2ba21:	4c 89 e7             	mov    %r12,%rdi
   2ba24:	48 8d b5 f0 fe ff ff 	lea    -0x110(%rbp),%rsi
   2ba2b:	ba 8d 00 00 00       	mov    $0x8d,%edx
   2ba30:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2ba37:	48 89 85 e0 fe ff ff 	mov    %rax,-0x120(%rbp)
   2ba3e:	e8 5d 61 02 00       	call   51ba0 <js_unary_arith_slow>
   2ba43:	85 c0                	test   %eax,%eax
   2ba45:	0f 85 f5 9c ff ff    	jne    25740 <JS_CallInternal+0x730>
   2ba4b:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2ba52:	48 8b b5 e0 fe ff ff 	mov    -0x120(%rbp),%rsi
   2ba59:	48 8b 11             	mov    (%rcx),%rdx
   2ba5c:	48 8b 41 08          	mov    0x8(%rcx),%rax
   2ba60:	48 89 31             	mov    %rsi,(%rcx)
   2ba63:	48 8b b5 e8 fe ff ff 	mov    -0x118(%rbp),%rsi
   2ba6a:	48 89 71 08          	mov    %rsi,0x8(%rcx)
   2ba6e:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2ba71:	0f 86 11 e0 ff ff    	jbe    29a88 <JS_CallInternal+0x4a78>
   2ba77:	8b 4a fc             	mov    -0x4(%rdx),%ecx
   2ba7a:	83 e9 01             	sub    $0x1,%ecx
   2ba7d:	89 4a fc             	mov    %ecx,-0x4(%rdx)
   2ba80:	85 c9                	test   %ecx,%ecx
   2ba82:	0f 8f 00 e0 ff ff    	jg     29a88 <JS_CallInternal+0x4a78>
   2ba88:	48 92                	xchg   %rax,%rdx
   2ba8a:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2ba8f:	48 89 c6             	mov    %rax,%rsi
   2ba92:	e8 39 2a ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2ba97:	e9 ec df ff ff       	jmp    29a88 <JS_CallInternal+0x4a78>
   2ba9c:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   2baa3:	4c 89 7e 30          	mov    %r15,0x30(%rsi)
   2baa7:	83 fa f6             	cmp    $0xfffffff6,%edx
   2baaa:	76 04                	jbe    2bab0 <JS_CallInternal+0x6aa0>
   2baac:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2bab0:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
   2bab7:	4c 89 e7             	mov    %r12,%rdi
   2baba:	48 8d b5 00 ff ff ff 	lea    -0x100(%rbp),%rsi
   2bac1:	ba 8c 00 00 00       	mov    $0x8c,%edx
   2bac6:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2bacd:	48 89 85 f0 fe ff ff 	mov    %rax,-0x110(%rbp)
   2bad4:	e8 c7 60 02 00       	call   51ba0 <js_unary_arith_slow>
   2bad9:	85 c0                	test   %eax,%eax
   2badb:	0f 85 5f 9c ff ff    	jne    25740 <JS_CallInternal+0x730>
   2bae1:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2bae8:	48 8b b5 f0 fe ff ff 	mov    -0x110(%rbp),%rsi
   2baef:	48 8b 11             	mov    (%rcx),%rdx
   2baf2:	48 8b 41 08          	mov    0x8(%rcx),%rax
   2baf6:	48 89 31             	mov    %rsi,(%rcx)
   2baf9:	48 8b b5 f8 fe ff ff 	mov    -0x108(%rbp),%rsi
   2bb00:	48 89 71 08          	mov    %rsi,0x8(%rcx)
   2bb04:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2bb07:	0f 86 74 de ff ff    	jbe    29981 <JS_CallInternal+0x4971>
   2bb0d:	8b 4a fc             	mov    -0x4(%rdx),%ecx
   2bb10:	83 e9 01             	sub    $0x1,%ecx
   2bb13:	89 4a fc             	mov    %ecx,-0x4(%rdx)
   2bb16:	85 c9                	test   %ecx,%ecx
   2bb18:	0f 8f 63 de ff ff    	jg     29981 <JS_CallInternal+0x4971>
   2bb1e:	48 92                	xchg   %rax,%rdx
   2bb20:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2bb25:	48 89 c6             	mov    %rax,%rsi
   2bb28:	e8 a3 29 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2bb2d:	e9 4f de ff ff       	jmp    29981 <JS_CallInternal+0x4971>
   2bb32:	b8 06 00 00 00       	mov    $0x6,%eax
   2bb37:	31 c9                	xor    %ecx,%ecx
   2bb39:	e9 c4 9c ff ff       	jmp    25802 <JS_CallInternal+0x7f2>
   2bb3e:	85 c0                	test   %eax,%eax
   2bb40:	0f 84 c0 ce ff ff    	je     28a06 <JS_CallInternal+0x39f6>
   2bb46:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2bb4a:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2bb4e:	b9 01 00 00 00       	mov    $0x1,%ecx
   2bb53:	4c 89 e7             	mov    %r12,%rdi
   2bb56:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2bb5d:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2bb61:	e8 ca 74 01 00       	call   43030 <JS_ToStringInternal>
   2bb66:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2bb6d:	49 89 d7             	mov    %rdx,%r15
   2bb70:	83 fa 06             	cmp    $0x6,%edx
   2bb73:	0f 84 de 30 00 00    	je     2ec57 <JS_CallInternal+0x9c47>
   2bb79:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2bb7d:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2bb80:	76 15                	jbe    2bb97 <JS_CallInternal+0x6b87>
   2bb82:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2bb86:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   2bb89:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2bb8c:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2bb8f:	85 d2                	test   %edx,%edx
   2bb91:	0f 8e ae 30 00 00    	jle    2ec45 <JS_CallInternal+0x9c35>
   2bb97:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2bb9e:	4c 89 7b f8          	mov    %r15,-0x8(%rbx)
   2bba2:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2bba6:	e9 5b ce ff ff       	jmp    28a06 <JS_CallInternal+0x39f6>
   2bbab:	83 fa 08             	cmp    $0x8,%edx
   2bbae:	0f 85 f7 0c 00 00    	jne    2c8ab <JS_CallInternal+0x789b>
   2bbb4:	66 48 0f 6e c0       	movq   %rax,%xmm0
   2bbb9:	66 0f 57 05 ff 9e 0b 	xorpd  0xb9eff(%rip),%xmm0        # e5ac0 <typed_array_size_log2+0x28>
   2bbc0:	00 
   2bbc1:	48 c7 43 f8 08 00 00 	movq   $0x8,-0x8(%rbx)
   2bbc8:	00 
   2bbc9:	f2 0f 11 43 f0       	movsd  %xmm0,-0x10(%rbx)
   2bbce:	e9 52 da ff ff       	jmp    29625 <JS_CallInternal+0x4615>
   2bbd3:	85 c9                	test   %ecx,%ecx
   2bbd5:	0f 85 4c 36 00 00    	jne    2f227 <JS_CallInternal+0xa217>
   2bbdb:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   2bbdf:	4c 8d 6b e0          	lea    -0x20(%rbx),%r13
   2bbe3:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2bbe6:	76 15                	jbe    2bbfd <JS_CallInternal+0x6bed>
   2bbe8:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   2bbec:	8b 51 fc             	mov    -0x4(%rcx),%edx
   2bbef:	83 ea 01             	sub    $0x1,%edx
   2bbf2:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2bbf5:	85 d2                	test   %edx,%edx
   2bbf7:	0f 8e c8 2a 00 00    	jle    2e6c5 <JS_CallInternal+0x96b5>
   2bbfd:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   2bc01:	48 8b 53 d8          	mov    -0x28(%rbx),%rdx
   2bc05:	b9 01 00 00 00       	mov    $0x1,%ecx
   2bc0a:	4c 89 e7             	mov    %r12,%rdi
   2bc0d:	4c 89 eb             	mov    %r13,%rbx
   2bc10:	e8 3b 87 06 00       	call   94350 <JS_IteratorClose>
   2bc15:	e9 43 9d ff ff       	jmp    2595d <JS_CallInternal+0x94d>
   2bc1a:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   2bc1e:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   2bc22:	4c 89 d1             	mov    %r10,%rcx
   2bc25:	4d 89 f8             	mov    %r15,%r8
   2bc28:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   2bc2e:	4c 89 e7             	mov    %r12,%rdi
   2bc31:	4c 89 95 30 fe ff ff 	mov    %r10,-0x1d0(%rbp)
   2bc38:	4c 89 bd 38 fe ff ff 	mov    %r15,-0x1c8(%rbp)
   2bc3f:	e8 ac 18 01 00       	call   3d4f0 <JS_SetPrototypeInternal>
   2bc44:	4c 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%r10
   2bc4b:	85 c0                	test   %eax,%eax
   2bc4d:	0f 89 26 ab ff ff    	jns    26779 <JS_CallInternal+0x1769>
   2bc53:	4d 89 ef             	mov    %r13,%r15
   2bc56:	e9 e5 9a ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2bc5b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2bc60:	83 f9 08             	cmp    $0x8,%ecx
   2bc63:	0f 85 d6 0b 00 00    	jne    2c83f <JS_CallInternal+0x782f>
   2bc69:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2bc6d:	66 49 0f 6e e0       	movq   %r8,%xmm4
   2bc72:	45 31 ff             	xor    %r15d,%r15d
   2bc75:	f2 0f 2a c7          	cvtsi2sd %edi,%xmm0
   2bc79:	66 0f 2e c4          	ucomisd %xmm4,%xmm0
   2bc7d:	41 0f 9b c7          	setnp  %r15b
   2bc81:	44 0f 45 fa          	cmovne %edx,%r15d
   2bc85:	e9 cf d3 ff ff       	jmp    29059 <JS_CallInternal+0x4049>
   2bc8a:	41 83 f8 08          	cmp    $0x8,%r8d
   2bc8e:	0f 85 2d 0d 00 00    	jne    2c9c1 <JS_CallInternal+0x79b1>
   2bc94:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2bc98:	66 49 0f 6e e2       	movq   %r10,%xmm4
   2bc9d:	45 31 ff             	xor    %r15d,%r15d
   2bca0:	b8 00 00 00 00       	mov    $0x0,%eax
   2bca5:	f2 0f 2a c7          	cvtsi2sd %edi,%xmm0
   2bca9:	66 0f 2e c4          	ucomisd %xmm4,%xmm0
   2bcad:	41 0f 9b c7          	setnp  %r15b
   2bcb1:	4c 0f 45 f8          	cmovne %rax,%r15
   2bcb5:	e9 4f d3 ff ff       	jmp    29009 <JS_CallInternal+0x3ff9>
   2bcba:	41 83 ff 08          	cmp    $0x8,%r15d
   2bcbe:	0f 85 c8 0c 00 00    	jne    2c98c <JS_CallInternal+0x797c>
   2bcc4:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2bcc8:	66 49 0f 6e e2       	movq   %r10,%xmm4
   2bccd:	31 c0                	xor    %eax,%eax
   2bccf:	f2 0f 2a c2          	cvtsi2sd %edx,%xmm0
   2bcd3:	66 0f 2e c4          	ucomisd %xmm4,%xmm0
   2bcd7:	ba 01 00 00 00       	mov    $0x1,%edx
   2bcdc:	0f 9a c0             	setp   %al
   2bcdf:	48 0f 45 c2          	cmovne %rdx,%rax
   2bce3:	e9 d0 d2 ff ff       	jmp    28fb8 <JS_CallInternal+0x3fa8>
   2bce8:	41 83 ff 08          	cmp    $0x8,%r15d
   2bcec:	0f 85 77 0a 00 00    	jne    2c769 <JS_CallInternal+0x7759>
   2bcf2:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2bcf6:	66 49 0f 6e e0       	movq   %r8,%xmm4
   2bcfb:	31 c9                	xor    %ecx,%ecx
   2bcfd:	f2 0f 2a c7          	cvtsi2sd %edi,%xmm0
   2bd01:	66 0f 2e c4          	ucomisd %xmm4,%xmm0
   2bd05:	0f 9b c1             	setnp  %cl
   2bd08:	0f 45 ca             	cmovne %edx,%ecx
   2bd0b:	e9 35 d8 ff ff       	jmp    29545 <JS_CallInternal+0x4535>
   2bd10:	4d 89 ef             	mov    %r13,%r15
   2bd13:	e9 28 9a ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2bd18:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2bd1f:	44 89 d2             	mov    %r10d,%edx
   2bd22:	48 89 de             	mov    %rbx,%rsi
   2bd25:	4c 89 e7             	mov    %r12,%rdi
   2bd28:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2bd2c:	e8 6f 5e 02 00       	call   51ba0 <js_unary_arith_slow>
   2bd31:	85 c0                	test   %eax,%eax
   2bd33:	0f 84 89 dc ff ff    	je     299c2 <JS_CallInternal+0x49b2>
   2bd39:	4d 89 ef             	mov    %r13,%r15
   2bd3c:	e9 ff 99 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2bd41:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   2bd48:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2bd4f:	44 89 d2             	mov    %r10d,%edx
   2bd52:	48 89 de             	mov    %rbx,%rsi
   2bd55:	4c 89 e7             	mov    %r12,%rdi
   2bd58:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2bd5c:	e8 4f 63 02 00       	call   520b0 <js_post_inc_slow>
   2bd61:	85 c0                	test   %eax,%eax
   2bd63:	0f 84 c2 db ff ff    	je     2992b <JS_CallInternal+0x491b>
   2bd69:	4d 89 ef             	mov    %r13,%r15
   2bd6c:	e9 cf 99 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2bd71:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   2bd78:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2bd7f:	44 89 d2             	mov    %r10d,%edx
   2bd82:	48 89 de             	mov    %rbx,%rsi
   2bd85:	4c 89 e7             	mov    %r12,%rdi
   2bd88:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2bd8c:	e8 0f 5e 02 00       	call   51ba0 <js_unary_arith_slow>
   2bd91:	85 c0                	test   %eax,%eax
   2bd93:	0f 84 9d dc ff ff    	je     29a36 <JS_CallInternal+0x4a26>
   2bd99:	4d 89 ef             	mov    %r13,%r15
   2bd9c:	e9 9f 99 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2bda1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   2bda8:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   2bdac:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   2bdb0:	4c 89 e7             	mov    %r12,%rdi
   2bdb3:	4d 89 ef             	mov    %r13,%r15
   2bdb6:	e8 b5 a8 01 00       	call   46670 <JS_ValueToAtom>
   2bdbb:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2bdc1:	85 c0                	test   %eax,%eax
   2bdc3:	0f 85 73 a1 ff ff    	jne    25f3c <JS_CallInternal+0xf2c>
   2bdc9:	e9 72 99 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2bdce:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2bdd5:	44 89 d2             	mov    %r10d,%edx
   2bdd8:	48 89 de             	mov    %rbx,%rsi
   2bddb:	4c 89 e7             	mov    %r12,%rdi
   2bdde:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2bde2:	e8 c9 62 02 00       	call   520b0 <js_post_inc_slow>
   2bde7:	85 c0                	test   %eax,%eax
   2bde9:	0f 84 f8 da ff ff    	je     298e7 <JS_CallInternal+0x48d7>
   2bdef:	4d 89 ef             	mov    %r13,%r15
   2bdf2:	e9 49 99 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2bdf7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   2bdfe:	00 00 
   2be00:	48 8b 4b c0          	mov    -0x40(%rbx),%rcx
   2be04:	4c 8b 43 c8          	mov    -0x38(%rbx),%r8
   2be08:	f6 85 30 fe ff ff 02 	testb  $0x2,-0x1d0(%rbp)
   2be0f:	0f 84 32 0c 00 00    	je     2ca47 <JS_CallInternal+0x7a37>
   2be15:	48 83 ec 08          	sub    $0x8,%rsp
   2be19:	45 31 c9             	xor    %r9d,%r9d
   2be1c:	6a 00                	push   $0x0
   2be1e:	4c 89 e7             	mov    %r12,%rdi
   2be21:	e8 4a 3a 00 00       	call   2f870 <JS_CallFree>
   2be26:	48 89 c1             	mov    %rax,%rcx
   2be29:	48 89 d0             	mov    %rdx,%rax
   2be2c:	5a                   	pop    %rdx
   2be2d:	5e                   	pop    %rsi
   2be2e:	83 f8 06             	cmp    $0x6,%eax
   2be31:	0f 84 09 99 ff ff    	je     25740 <JS_CallInternal+0x730>
   2be37:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   2be3b:	83 fe f6             	cmp    $0xfffffff6,%esi
   2be3e:	76 15                	jbe    2be55 <JS_CallInternal+0x6e45>
   2be40:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   2be44:	8b 57 fc             	mov    -0x4(%rdi),%edx
   2be47:	83 ea 01             	sub    $0x1,%edx
   2be4a:	89 57 fc             	mov    %edx,-0x4(%rdi)
   2be4d:	85 d2                	test   %edx,%edx
   2be4f:	0f 8e 9e 2a 00 00    	jle    2e8f3 <JS_CallInternal+0x98e3>
   2be55:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2be59:	31 c0                	xor    %eax,%eax
   2be5b:	48 89 4b f0          	mov    %rcx,-0x10(%rbx)
   2be5f:	e9 7e f1 ff ff       	jmp    2afe2 <JS_CallInternal+0x5fd2>
   2be64:	45 31 c0             	xor    %r8d,%r8d
   2be67:	48 8b 0b             	mov    (%rbx),%rcx
   2be6a:	8b 71 fc             	mov    -0x4(%rcx),%esi
   2be6d:	8d 56 ff             	lea    -0x1(%rsi),%edx
   2be70:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2be73:	85 d2                	test   %edx,%edx
   2be75:	0f 8e ec 0e 00 00    	jle    2cd67 <JS_CallInternal+0x7d57>
   2be7b:	49 8b 47 08          	mov    0x8(%r15),%rax
   2be7f:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2be82:	76 14                	jbe    2be98 <JS_CallInternal+0x6e88>
   2be84:	49 8b 17             	mov    (%r15),%rdx
   2be87:	8b 4a fc             	mov    -0x4(%rdx),%ecx
   2be8a:	83 e9 01             	sub    $0x1,%ecx
   2be8d:	89 4a fc             	mov    %ecx,-0x4(%rdx)
   2be90:	85 c9                	test   %ecx,%ecx
   2be92:	0f 8e f5 0e 00 00    	jle    2cd8d <JS_CallInternal+0x7d7d>
   2be98:	41 83 f8 ff          	cmp    $0xffffffff,%r8d
   2be9c:	0f 85 ca ab ff ff    	jne    26a6c <JS_CallInternal+0x1a5c>
   2bea2:	4d 89 ef             	mov    %r13,%r15
   2bea5:	e9 96 98 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2beaa:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2beaf:	48 89 ce             	mov    %rcx,%rsi
   2beb2:	e8 19 26 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2beb7:	e9 63 ad ff ff       	jmp    26c1f <JS_CallInternal+0x1c0f>
   2bebc:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2bec0:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
   2bec5:	b8 08 00 00 00       	mov    $0x8,%eax
   2beca:	e9 b8 e1 ff ff       	jmp    2a087 <JS_CallInternal+0x5077>
   2becf:	48 89 ce             	mov    %rcx,%rsi
   2bed2:	4c 89 e7             	mov    %r12,%rdi
   2bed5:	4c 89 95 20 fe ff ff 	mov    %r10,-0x1e0(%rbp)
   2bedc:	4c 89 85 00 fe ff ff 	mov    %r8,-0x200(%rbp)
   2bee3:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   2beea:	4c 89 8d e8 fd ff ff 	mov    %r9,-0x218(%rbp)
   2bef1:	e8 1a 0d 01 00       	call   3cc10 <expand_fast_array>
   2bef6:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   2befd:	4c 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%r8
   2bf04:	83 f8 ff             	cmp    $0xffffffff,%eax
   2bf07:	4c 8b 95 20 fe ff ff 	mov    -0x1e0(%rbp),%r10
   2bf0e:	4c 8b 8d e8 fd ff ff 	mov    -0x218(%rbp),%r9
   2bf15:	0f 84 7e 29 00 00    	je     2e899 <JS_CallInternal+0x9889>
   2bf1b:	8b 85 30 fe ff ff    	mov    -0x1d0(%rbp),%eax
   2bf21:	89 41 38             	mov    %eax,0x38(%rcx)
   2bf24:	31 c0                	xor    %eax,%eax
   2bf26:	0f 1f 40 00          	nopl   0x0(%rax)
   2bf2a:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2bf31:	00 00 00 00 
   2bf35:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2bf3c:	00 00 00 00 
   2bf40:	f3 41 0f 6f 04 00    	movdqu (%r8,%rax,1),%xmm0
   2bf46:	48 8b 51 30          	mov    0x30(%rcx),%rdx
   2bf4a:	0f 11 04 02          	movups %xmm0,(%rdx,%rax,1)
   2bf4e:	48 83 c0 10          	add    $0x10,%rax
   2bf52:	4c 39 c8             	cmp    %r9,%rax
   2bf55:	75 e9                	jne    2bf40 <JS_CallInternal+0x6f30>
   2bf57:	48 8b 51 20          	mov    0x20(%rcx),%rdx
   2bf5b:	48 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%rbx
   2bf62:	48 8b 42 08          	mov    0x8(%rdx),%rax
   2bf66:	48 8b 32             	mov    (%rdx),%rsi
   2bf69:	48 c7 42 08 00 00 00 	movq   $0x0,0x8(%rdx)
   2bf70:	00 
   2bf71:	48 89 1a             	mov    %rbx,(%rdx)
   2bf74:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2bf77:	0f 86 db a6 ff ff    	jbe    26658 <JS_CallInternal+0x1648>
   2bf7d:	8b 5e fc             	mov    -0x4(%rsi),%ebx
   2bf80:	8d 53 ff             	lea    -0x1(%rbx),%edx
   2bf83:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2bf86:	85 d2                	test   %edx,%edx
   2bf88:	0f 8f ca a6 ff ff    	jg     26658 <JS_CallInternal+0x1648>
   2bf8e:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2bf93:	48 89 c2             	mov    %rax,%rdx
   2bf96:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   2bf9d:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   2bfa4:	4c 89 85 30 fe ff ff 	mov    %r8,-0x1d0(%rbp)
   2bfab:	e8 20 25 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2bfb0:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   2bfb7:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   2bfbe:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2bfc5:	e9 8e a6 ff ff       	jmp    26658 <JS_CallInternal+0x1648>
   2bfca:	48 8b b5 c0 fe ff ff 	mov    -0x140(%rbp),%rsi
   2bfd1:	4c 03 4e 30          	add    0x30(%rsi),%r9
   2bfd5:	80 79 11 00          	cmpb   $0x0,0x11(%rcx)
   2bfd9:	0f 84 e4 12 00 00    	je     2d2c3 <JS_CallInternal+0x82b3>
   2bfdf:	41 83 fa 3a          	cmp    $0x3a,%r10d
   2bfe3:	0f 84 fb 9c ff ff    	je     25ce4 <JS_CallInternal+0xcd4>
   2bfe9:	41 8b 71 04          	mov    0x4(%r9),%esi
   2bfed:	4c 89 e7             	mov    %r12,%rdi
   2bff0:	83 fa 04             	cmp    $0x4,%edx
   2bff3:	0f 84 e4 36 00 00    	je     2f6dd <JS_CallInternal+0xa6cd>
   2bff9:	e8 f2 8b 00 00       	call   34bf0 <JS_ThrowTypeErrorReadOnly.part.0>
   2bffe:	e9 3d 97 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2c003:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2c008:	41 8b 4d 01          	mov    0x1(%r13),%ecx
   2c00c:	49 8d 4c 0d 01       	lea    0x1(%r13,%rcx,1),%rcx
   2c011:	66 83 78 12 01       	cmpw   $0x1,0x12(%rax)
   2c016:	0f 85 0c c0 ff ff    	jne    28028 <JS_CallInternal+0x3018>
   2c01c:	f6 40 10 08          	testb  $0x8,0x10(%rax)
   2c020:	0f 85 02 c0 ff ff    	jne    28028 <JS_CallInternal+0x3018>
   2c026:	48 8b 70 18          	mov    0x18(%rax),%rsi
   2c02a:	48 39 31             	cmp    %rsi,(%rcx)
   2c02d:	0f 85 f5 bf ff ff    	jne    28028 <JS_CallInternal+0x3018>
   2c033:	8b 51 10             	mov    0x10(%rcx),%edx
   2c036:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   2c03a:	48 c1 e2 04          	shl    $0x4,%rdx
   2c03e:	48 03 50 20          	add    0x20(%rax),%rdx
   2c042:	48 89 d0             	mov    %rdx,%rax
   2c045:	48 8b 12             	mov    (%rdx),%rdx
   2c048:	48 8b 40 08          	mov    0x8(%rax),%rax
   2c04c:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2c04f:	76 04                	jbe    2c055 <JS_CallInternal+0x7045>
   2c051:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2c055:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2c059:	49 8d 45 05          	lea    0x5(%r13),%rax
   2c05d:	48 89 13             	mov    %rdx,(%rbx)
   2c060:	4c 8d 68 01          	lea    0x1(%rax),%r13
   2c064:	0f b6 00             	movzbl (%rax),%eax
   2c067:	48 89 cb             	mov    %rcx,%rbx
   2c06a:	49 89 c2             	mov    %rax,%r10
   2c06d:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2c071:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   2c078:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   2c07f:	48 c7 43 08 01 00 00 	movq   $0x1,0x8(%rbx)
   2c086:	00 
   2c087:	e9 82 c4 ff ff       	jmp    2850e <JS_CallInternal+0x34fe>
   2c08c:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2c093:	48 8d 7b f0          	lea    -0x10(%rbx),%rdi
   2c097:	41 b9 00 80 00 00    	mov    $0x8000,%r9d
   2c09d:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2c0a1:	48 8d 43 e0          	lea    -0x20(%rbx),%rax
   2c0a5:	48 8b 08             	mov    (%rax),%rcx
   2c0a8:	48 83 eb 30          	sub    $0x30,%rbx
   2c0ac:	4c 8b 40 08          	mov    0x8(%rax),%r8
   2c0b0:	48 8b 33             	mov    (%rbx),%rsi
   2c0b3:	48 8b 53 08          	mov    0x8(%rbx),%rdx
   2c0b7:	ff 77 08             	push   0x8(%rdi)
   2c0ba:	ff 37                	push   (%rdi)
   2c0bc:	4c 89 e7             	mov    %r12,%rdi
   2c0bf:	e8 3c 52 00 00       	call   31300 <JS_SetPropertyValue>
   2c0c4:	41 59                	pop    %r9
   2c0c6:	41 5a                	pop    %r10
   2c0c8:	41 89 c7             	mov    %eax,%r15d
   2c0cb:	48 8b 43 08          	mov    0x8(%rbx),%rax
   2c0cf:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2c0d2:	76 14                	jbe    2c0e8 <JS_CallInternal+0x70d8>
   2c0d4:	48 8b 0b             	mov    (%rbx),%rcx
   2c0d7:	8b 51 fc             	mov    -0x4(%rcx),%edx
   2c0da:	83 ea 01             	sub    $0x1,%edx
   2c0dd:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2c0e0:	85 d2                	test   %edx,%edx
   2c0e2:	0f 8e f1 26 00 00    	jle    2e7d9 <JS_CallInternal+0x97c9>
   2c0e8:	45 85 ff             	test   %r15d,%r15d
   2c0eb:	0f 89 81 dd ff ff    	jns    29e72 <JS_CallInternal+0x4e62>
   2c0f1:	4d 89 ef             	mov    %r13,%r15
   2c0f4:	e9 47 96 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2c0f9:	8b 00                	mov    (%rax),%eax
   2c0fb:	25 ff ff ff 03       	and    $0x3ffffff,%eax
   2c100:	0f 85 79 96 ff ff    	jne    2577f <JS_CallInternal+0x76f>
   2c106:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2c10d:	48 83 ec 08          	sub    $0x8,%rsp
   2c111:	31 c9                	xor    %ecx,%ecx
   2c113:	45 31 c9             	xor    %r9d,%r9d
   2c116:	45 31 c0             	xor    %r8d,%r8d
   2c119:	4c 89 e7             	mov    %r12,%rdi
   2c11c:	4c 89 78 30          	mov    %r15,0x30(%rax)
   2c120:	48 8b 85 b0 fe ff ff 	mov    -0x150(%rbp),%rax
   2c127:	48 8b b0 d8 04 00 00 	mov    0x4d8(%rax),%rsi
   2c12e:	48 8b 90 e0 04 00 00 	mov    0x4e0(%rax),%rdx
   2c135:	6a 00                	push   $0x0
   2c137:	e8 14 6a 00 00       	call   32b50 <build_backtrace>
   2c13c:	59                   	pop    %rcx
   2c13d:	5e                   	pop    %rsi
   2c13e:	e9 4e 96 ff ff       	jmp    25791 <JS_CallInternal+0x781>
   2c143:	48 8b 8d b8 fe ff ff 	mov    -0x148(%rbp),%rcx
   2c14a:	48 92                	xchg   %rax,%rdx
   2c14c:	4c 89 fe             	mov    %r15,%rsi
   2c14f:	4c 89 e7             	mov    %r12,%rdi
   2c152:	49 89 d0             	mov    %rdx,%r8
   2c155:	4c 89 ca             	mov    %r9,%rdx
   2c158:	4c 89 8d 30 fe ff ff 	mov    %r9,-0x1d0(%rbp)
   2c15f:	4c 89 69 30          	mov    %r13,0x30(%rcx)
   2c163:	48 89 c1             	mov    %rax,%rcx
   2c166:	e8 d5 3d 00 00       	call   2ff40 <JS_GetPropertyValue>
   2c16b:	48 89 c1             	mov    %rax,%rcx
   2c16e:	48 89 d0             	mov    %rdx,%rax
   2c171:	83 fa 06             	cmp    $0x6,%edx
   2c174:	0f 84 22 2d 00 00    	je     2ee9c <JS_CallInternal+0x9e8c>
   2c17a:	4c 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9
   2c181:	e9 b3 a1 ff ff       	jmp    26339 <JS_CallInternal+0x1329>
   2c186:	48 8b bd b8 fe ff ff 	mov    -0x148(%rbp),%rdi
   2c18d:	49 89 d1             	mov    %rdx,%r9
   2c190:	49 89 f2             	mov    %rsi,%r10
   2c193:	48 89 ca             	mov    %rcx,%rdx
   2c196:	49 89 d0             	mov    %rdx,%r8
   2c199:	48 89 c1             	mov    %rax,%rcx
   2c19c:	4c 89 ce             	mov    %r9,%rsi
   2c19f:	4c 89 d2             	mov    %r10,%rdx
   2c1a2:	4c 89 6f 30          	mov    %r13,0x30(%rdi)
   2c1a6:	4c 89 e7             	mov    %r12,%rdi
   2c1a9:	e8 92 3d 00 00       	call   2ff40 <JS_GetPropertyValue>
   2c1ae:	48 89 c1             	mov    %rax,%rcx
   2c1b1:	48 89 d0             	mov    %rdx,%rax
   2c1b4:	83 fa 06             	cmp    $0x6,%edx
   2c1b7:	0f 84 ba 2a 00 00    	je     2ec77 <JS_CallInternal+0x9c67>
   2c1bd:	48 89 ca             	mov    %rcx,%rdx
   2c1c0:	e9 04 a1 ff ff       	jmp    262c9 <JS_CallInternal+0x12b9>
   2c1c5:	41 8b 4d 01          	mov    0x1(%r13),%ecx
   2c1c9:	49 8d 4c 0d 01       	lea    0x1(%r13,%rcx,1),%rcx
   2c1ce:	66 83 78 12 01       	cmpw   $0x1,0x12(%rax)
   2c1d3:	0f 85 f9 b8 ff ff    	jne    27ad2 <JS_CallInternal+0x2ac2>
   2c1d9:	f6 40 10 08          	testb  $0x8,0x10(%rax)
   2c1dd:	0f 85 ef b8 ff ff    	jne    27ad2 <JS_CallInternal+0x2ac2>
   2c1e3:	48 8b 70 18          	mov    0x18(%rax),%rsi
   2c1e7:	48 39 31             	cmp    %rsi,(%rcx)
   2c1ea:	0f 85 e2 b8 ff ff    	jne    27ad2 <JS_CallInternal+0x2ac2>
   2c1f0:	8b 51 10             	mov    0x10(%rcx),%edx
   2c1f3:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   2c1f7:	48 c1 e2 04          	shl    $0x4,%rdx
   2c1fb:	48 03 50 20          	add    0x20(%rax),%rdx
   2c1ff:	48 89 d0             	mov    %rdx,%rax
   2c202:	48 8b 12             	mov    (%rdx),%rdx
   2c205:	48 8b 40 08          	mov    0x8(%rax),%rax
   2c209:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2c20c:	76 04                	jbe    2c212 <JS_CallInternal+0x7202>
   2c20e:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2c212:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2c216:	49 8d 45 05          	lea    0x5(%r13),%rax
   2c21a:	48 89 13             	mov    %rdx,(%rbx)
   2c21d:	4c 8d 68 01          	lea    0x1(%rax),%r13
   2c221:	0f b6 00             	movzbl (%rax),%eax
   2c224:	48 89 cb             	mov    %rcx,%rbx
   2c227:	49 89 c2             	mov    %rax,%r10
   2c22a:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2c22e:	66 90                	xchg   %ax,%ax
   2c230:	48 92                	xchg   %rax,%rdx
   2c232:	4c 89 e7             	mov    %r12,%rdi
   2c235:	48 89 c6             	mov    %rax,%rsi
   2c238:	e8 e3 47 ff ff       	call   20a20 <JS_ToBoolFree>
   2c23d:	e9 49 cf ff ff       	jmp    2918b <JS_CallInternal+0x417b>
   2c242:	8b 10                	mov    (%rax),%edx
   2c244:	81 e2 ff ff ff 03    	and    $0x3ffffff,%edx
   2c24a:	0f 85 6d ee ff ff    	jne    2b0bd <JS_CallInternal+0x60ad>
   2c250:	48 83 ec 08          	sub    $0x8,%rsp
   2c254:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2c258:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2c25c:	4c 89 da             	mov    %r11,%rdx
   2c25f:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2c266:	4c 89 9d 30 fe ff ff 	mov    %r11,-0x1d0(%rbp)
   2c26d:	4c 89 d6             	mov    %r10,%rsi
   2c270:	4c 89 e7             	mov    %r12,%rdi
   2c273:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   2c27a:	4c 89 78 30          	mov    %r15,0x30(%rax)
   2c27e:	68 00 80 00 00       	push   $0x8000
   2c283:	41 53                	push   %r11
   2c285:	41 52                	push   %r10
   2c287:	e8 c4 43 00 00       	call   30650 <JS_SetPropertyInternal>
   2c28c:	4c 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%r11
   2c293:	48 83 c4 20          	add    $0x20,%rsp
   2c297:	41 83 fb f6          	cmp    $0xfffffff6,%r11d
   2c29b:	76 1a                	jbe    2c2b7 <JS_CallInternal+0x72a7>
   2c29d:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   2c2a4:	41 8b 4a fc          	mov    -0x4(%r10),%ecx
   2c2a8:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2c2ab:	41 89 52 fc          	mov    %edx,-0x4(%r10)
   2c2af:	85 d2                	test   %edx,%edx
   2c2b1:	0f 8e 8e 23 00 00    	jle    2e645 <JS_CallInternal+0x9635>
   2c2b7:	48 83 eb 20          	sub    $0x20,%rbx
   2c2bb:	85 c0                	test   %eax,%eax
   2c2bd:	0f 89 6e ee ff ff    	jns    2b131 <JS_CallInternal+0x6121>
   2c2c3:	e9 78 94 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2c2c8:	48 89 c6             	mov    %rax,%rsi
   2c2cb:	4c 89 e7             	mov    %r12,%rdi
   2c2ce:	e8 4d 47 ff ff       	call   20a20 <JS_ToBoolFree>
   2c2d3:	e9 ea e4 ff ff       	jmp    2a7c2 <JS_CallInternal+0x57b2>
   2c2d8:	31 c9                	xor    %ecx,%ecx
   2c2da:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   2c2e0:	e9 b9 c4 ff ff       	jmp    2879e <JS_CallInternal+0x378e>
   2c2e5:	48 c7 85 70 fd ff ff 	movq   $0x0,-0x290(%rbp)
   2c2ec:	00 00 00 00 
   2c2f0:	48 8b b5 20 fe ff ff 	mov    -0x1e0(%rbp),%rsi
   2c2f7:	31 c9                	xor    %ecx,%ecx
   2c2f9:	4c 89 e7             	mov    %r12,%rdi
   2c2fc:	44 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9d
   2c303:	48 8b 95 e8 fd ff ff 	mov    -0x218(%rbp),%rdx
   2c30a:	48 c7 85 78 fd ff ff 	movq   $0x3,-0x288(%rbp)
   2c311:	03 00 00 00 
   2c315:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   2c31b:	6a 00                	push   $0x0
   2c31d:	41 52                	push   %r10
   2c31f:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   2c326:	ff b5 78 fd ff ff    	push   -0x288(%rbp)
   2c32c:	ff b5 70 fd ff ff    	push   -0x290(%rbp)
   2c332:	e8 d9 8c ff ff       	call   25010 <JS_CallInternal>
   2c337:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   2c33e:	48 83 c4 20          	add    $0x20,%rsp
   2c342:	48 89 c6             	mov    %rax,%rsi
   2c345:	e9 82 c4 ff ff       	jmp    287cc <JS_CallInternal+0x37bc>
   2c34a:	31 c9                	xor    %ecx,%ecx
   2c34c:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   2c352:	e9 9c c0 ff ff       	jmp    283f3 <JS_CallInternal+0x33e3>
   2c357:	48 8b b5 f0 fd ff ff 	mov    -0x210(%rbp),%rsi
   2c35e:	45 89 d9             	mov    %r11d,%r9d
   2c361:	31 c9                	xor    %ecx,%ecx
   2c363:	4c 89 e7             	mov    %r12,%rdi
   2c366:	48 8b 95 20 fe ff ff 	mov    -0x1e0(%rbp),%rdx
   2c36d:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   2c373:	48 c7 85 80 fd ff ff 	movq   $0x0,-0x280(%rbp)
   2c37a:	00 00 00 00 
   2c37e:	48 c7 85 88 fd ff ff 	movq   $0x3,-0x278(%rbp)
   2c385:	03 00 00 00 
   2c389:	6a 02                	push   $0x2
   2c38b:	41 52                	push   %r10
   2c38d:	4c 89 95 e8 fd ff ff 	mov    %r10,-0x218(%rbp)
   2c394:	ff b5 88 fd ff ff    	push   -0x278(%rbp)
   2c39a:	ff b5 80 fd ff ff    	push   -0x280(%rbp)
   2c3a0:	44 89 9d 00 fe ff ff 	mov    %r11d,-0x200(%rbp)
   2c3a7:	e8 64 8c ff ff       	call   25010 <JS_CallInternal>
   2c3ac:	4c 8b 95 e8 fd ff ff 	mov    -0x218(%rbp),%r10
   2c3b3:	44 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%r11d
   2c3ba:	48 83 c4 20          	add    $0x20,%rsp
   2c3be:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   2c3c5:	48 89 95 10 fe ff ff 	mov    %rdx,-0x1f0(%rbp)
   2c3cc:	e9 68 c0 ff ff       	jmp    28439 <JS_CallInternal+0x3429>
   2c3d1:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2c3d8:	48 89 de             	mov    %rbx,%rsi
   2c3db:	4c 89 e7             	mov    %r12,%rdi
   2c3de:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2c3e2:	e8 49 5d 02 00       	call   52130 <js_not_slow>
   2c3e7:	85 c0                	test   %eax,%eax
   2c3e9:	0f 84 08 d6 ff ff    	je     299f7 <JS_CallInternal+0x49e7>
   2c3ef:	4d 89 ef             	mov    %r13,%r15
   2c3f2:	e9 49 93 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2c3f7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   2c3fe:	00 00 
   2c400:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2c407:	4c 89 ca             	mov    %r9,%rdx
   2c40a:	4c 89 d1             	mov    %r10,%rcx
   2c40d:	4d 89 f8             	mov    %r15,%r8
   2c410:	4c 89 e7             	mov    %r12,%rdi
   2c413:	4c 89 8d 00 fe ff ff 	mov    %r9,-0x200(%rbp)
   2c41a:	48 89 c6             	mov    %rax,%rsi
   2c41d:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   2c424:	4c 89 bd 18 fe ff ff 	mov    %r15,-0x1e8(%rbp)
   2c42b:	e8 20 78 00 00       	call   33c50 <JS_CheckBrand>
   2c430:	83 f8 ff             	cmp    $0xffffffff,%eax
   2c433:	0f 84 e2 32 00 00    	je     2f71b <JS_CallInternal+0xa70b>
   2c439:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   2c440:	4c 8b 9d 18 fe ff ff 	mov    -0x1e8(%rbp),%r11
   2c447:	48 63 c8             	movslq %eax,%rcx
   2c44a:	4c 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%r9
   2c451:	e9 cd c9 ff ff       	jmp    28e23 <JS_CallInternal+0x3e13>
   2c456:	48 89 c6             	mov    %rax,%rsi
   2c459:	4c 89 e7             	mov    %r12,%rdi
   2c45c:	e8 bf 45 ff ff       	call   20a20 <JS_ToBoolFree>
   2c461:	e9 8d cc ff ff       	jmp    290f3 <JS_CallInternal+0x40e3>
   2c466:	48 89 c6             	mov    %rax,%rsi
   2c469:	4c 89 e7             	mov    %r12,%rdi
   2c46c:	e8 af 45 ff ff       	call   20a20 <JS_ToBoolFree>
   2c471:	e9 f5 e2 ff ff       	jmp    2a76b <JS_CallInternal+0x575b>
   2c476:	48 89 c6             	mov    %rax,%rsi
   2c479:	4c 89 e7             	mov    %r12,%rdi
   2c47c:	e8 9f 45 ff ff       	call   20a20 <JS_ToBoolFree>
   2c481:	e9 15 cc ff ff       	jmp    2909b <JS_CallInternal+0x408b>
   2c486:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2c48b:	89 c8                	mov    %ecx,%eax
   2c48d:	48 8b 97 48 04 00 00 	mov    0x448(%rdi),%rdx
   2c494:	48 8b 34 c2          	mov    (%rdx,%rax,8),%rsi
   2c498:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2c49b:	83 e8 01             	sub    $0x1,%eax
   2c49e:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2c4a1:	85 c0                	test   %eax,%eax
   2c4a3:	0f 8f 6b da ff ff    	jg     29f14 <JS_CallInternal+0x4f04>
   2c4a9:	4c 89 9d f0 fd ff ff 	mov    %r11,-0x210(%rbp)
   2c4b0:	e8 eb a4 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2c4b5:	4c 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%r11
   2c4bc:	e9 53 da ff ff       	jmp    29f14 <JS_CallInternal+0x4f04>
   2c4c1:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2c4c6:	48 8b 87 48 04 00 00 	mov    0x448(%rdi),%rax
   2c4cd:	48 8b 34 c8          	mov    (%rax,%rcx,8),%rsi
   2c4d1:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2c4d4:	83 e8 01             	sub    $0x1,%eax
   2c4d7:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2c4da:	85 c0                	test   %eax,%eax
   2c4dc:	0f 8f 2b ca ff ff    	jg     28f0d <JS_CallInternal+0x3efd>
   2c4e2:	44 89 85 f0 fd ff ff 	mov    %r8d,-0x210(%rbp)
   2c4e9:	e8 b2 a4 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2c4ee:	44 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8d
   2c4f5:	e9 13 ca ff ff       	jmp    28f0d <JS_CallInternal+0x3efd>
   2c4fa:	8b 10                	mov    (%rax),%edx
   2c4fc:	81 e2 ff ff ff 03    	and    $0x3ffffff,%edx
   2c502:	0f 85 bb c5 ff ff    	jne    28ac3 <JS_CallInternal+0x3ab3>
   2c508:	49 8b b4 24 80 01 00 	mov    0x180(%r12),%rsi
   2c50f:	00 
   2c510:	4c 89 e7             	mov    %r12,%rdi
   2c513:	49 8b 94 24 88 01 00 	mov    0x188(%r12),%rdx
   2c51a:	00 
   2c51b:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2c521:	e8 3a 36 04 00       	call   6fb60 <JS_HasProperty>
   2c526:	85 c0                	test   %eax,%eax
   2c528:	0f 88 12 92 ff ff    	js     25740 <JS_CallInternal+0x730>
   2c52e:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2c534:	b8 01 00 00 00       	mov    $0x1,%eax
   2c539:	0f 84 97 c5 ff ff    	je     28ad6 <JS_CallInternal+0x3ac6>
   2c53f:	49 8b b4 24 80 01 00 	mov    0x180(%r12),%rsi
   2c546:	00 
   2c547:	49 8b 94 24 88 01 00 	mov    0x188(%r12),%rdx
   2c54e:	00 
   2c54f:	45 31 c0             	xor    %r8d,%r8d
   2c552:	4c 89 e7             	mov    %r12,%rdi
   2c555:	e8 16 13 02 00       	call   4d870 <JS_DeleteProperty>
   2c55a:	85 c0                	test   %eax,%eax
   2c55c:	0f 88 de 91 ff ff    	js     25740 <JS_CallInternal+0x730>
   2c562:	0f 95 c0             	setne  %al
   2c565:	0f b6 c0             	movzbl %al,%eax
   2c568:	e9 69 c5 ff ff       	jmp    28ad6 <JS_CallInternal+0x3ac6>
   2c56d:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2c572:	44 89 c8             	mov    %r9d,%eax
   2c575:	48 8b 97 48 04 00 00 	mov    0x448(%rdi),%rdx
   2c57c:	48 8b 34 c2          	mov    (%rdx,%rax,8),%rsi
   2c580:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2c583:	83 e8 01             	sub    $0x1,%eax
   2c586:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2c589:	85 c0                	test   %eax,%eax
   2c58b:	0f 8f ea c5 ff ff    	jg     28b7b <JS_CallInternal+0x3b6b>
   2c591:	89 8d f0 fd ff ff    	mov    %ecx,-0x210(%rbp)
   2c597:	e8 04 a4 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2c59c:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   2c5a2:	e9 d4 c5 ff ff       	jmp    28b7b <JS_CallInternal+0x3b6b>
   2c5a7:	41 f6 42 10 08       	testb  $0x8,0x10(%r10)
   2c5ac:	0f 85 d7 e5 ff ff    	jne    2ab89 <JS_CallInternal+0x5b79>
   2c5b2:	49 8b 49 08          	mov    0x8(%r9),%rcx
   2c5b6:	49 8b 11             	mov    (%r9),%rdx
   2c5b9:	48 85 c9             	test   %rcx,%rcx
   2c5bc:	0f 84 ef 24 00 00    	je     2eab1 <JS_CallInternal+0x9aa1>
   2c5c2:	49 8b 43 30          	mov    0x30(%r11),%rax
   2c5c6:	4c 39 da             	cmp    %r11,%rdx
   2c5c9:	0f 85 ba e5 ff ff    	jne    2ab89 <JS_CallInternal+0x5b79>
   2c5cf:	48 85 c0             	test   %rax,%rax
   2c5d2:	0f 84 b1 e5 ff ff    	je     2ab89 <JS_CallInternal+0x5b79>
   2c5d8:	66 83 78 12 01       	cmpw   $0x1,0x12(%rax)
   2c5dd:	0f 85 a6 e5 ff ff    	jne    2ab89 <JS_CallInternal+0x5b79>
   2c5e3:	f6 40 10 08          	testb  $0x8,0x10(%rax)
   2c5e7:	0f 85 9c e5 ff ff    	jne    2ab89 <JS_CallInternal+0x5b79>
   2c5ed:	48 3b 48 18          	cmp    0x18(%rax),%rcx
   2c5f1:	0f 85 92 e5 ff ff    	jne    2ab89 <JS_CallInternal+0x5b79>
   2c5f7:	41 8b 51 10          	mov    0x10(%r9),%edx
   2c5fb:	48 c1 e2 04          	shl    $0x4,%rdx
   2c5ff:	48 03 50 20          	add    0x20(%rax),%rdx
   2c603:	48 89 d0             	mov    %rdx,%rax
   2c606:	48 8b 12             	mov    (%rdx),%rdx
   2c609:	48 8b 40 08          	mov    0x8(%rax),%rax
   2c60d:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2c610:	76 04                	jbe    2c616 <JS_CallInternal+0x7606>
   2c612:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2c616:	49 89 d7             	mov    %rdx,%r15
   2c619:	e9 f0 e5 ff ff       	jmp    2ac0e <JS_CallInternal+0x5bfe>
   2c61e:	66 90                	xchg   %ax,%ax
   2c620:	f6 40 10 08          	testb  $0x8,0x10(%rax)
   2c624:	0f 85 33 e6 ff ff    	jne    2ac5d <JS_CallInternal+0x5c4d>
   2c62a:	49 39 3a             	cmp    %rdi,(%r10)
   2c62d:	0f 85 2a e6 ff ff    	jne    2ac5d <JS_CallInternal+0x5c4d>
   2c633:	41 8b 52 10          	mov    0x10(%r10),%edx
   2c637:	83 fa ff             	cmp    $0xffffffff,%edx
   2c63a:	0f 84 1d e6 ff ff    	je     2ac5d <JS_CallInternal+0x5c4d>
   2c640:	48 c1 e2 04          	shl    $0x4,%rdx
   2c644:	48 03 50 20          	add    0x20(%rax),%rdx
   2c648:	48 89 d0             	mov    %rdx,%rax
   2c64b:	48 8b 12             	mov    (%rdx),%rdx
   2c64e:	48 8b 48 08          	mov    0x8(%rax),%rcx
   2c652:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   2c655:	76 04                	jbe    2c65b <JS_CallInternal+0x764b>
   2c657:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2c65b:	49 89 d7             	mov    %rdx,%r15
   2c65e:	e9 6e e6 ff ff       	jmp    2acd1 <JS_CallInternal+0x5cc1>
   2c663:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2c668:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2c66d:	48 8b 87 48 04 00 00 	mov    0x448(%rdi),%rax
   2c674:	48 8b 34 c8          	mov    (%rax,%rcx,8),%rsi
   2c678:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2c67b:	83 e8 01             	sub    $0x1,%eax
   2c67e:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2c681:	85 c0                	test   %eax,%eax
   2c683:	0f 8f 5f cc ff ff    	jg     292e8 <JS_CallInternal+0x42d8>
   2c689:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   2c690:	e8 0b a3 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2c695:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   2c69c:	e9 47 cc ff ff       	jmp    292e8 <JS_CallInternal+0x42d8>
   2c6a1:	41 83 ff fa          	cmp    $0xfffffffa,%r15d
   2c6a5:	0f 8d 3a 22 00 00    	jge    2e8e5 <JS_CallInternal+0x98d5>
   2c6ab:	41 83 ff f8          	cmp    $0xfffffff8,%r15d
   2c6af:	7d 6f                	jge    2c720 <JS_CallInternal+0x7710>
   2c6b1:	83 e8 02             	sub    $0x2,%eax
   2c6b4:	83 f8 01             	cmp    $0x1,%eax
   2c6b7:	0f 86 b7 28 00 00    	jbe    2ef74 <JS_CallInternal+0x9f64>
   2c6bd:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2c6c1:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2c6c5:	b9 01 00 00 00       	mov    $0x1,%ecx
   2c6ca:	4c 89 e7             	mov    %r12,%rdi
   2c6cd:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2c6d4:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2c6d8:	e8 53 69 01 00       	call   43030 <JS_ToStringInternal>
   2c6dd:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2c6e4:	49 89 d7             	mov    %rdx,%r15
   2c6e7:	48 89 d0             	mov    %rdx,%rax
   2c6ea:	83 fa 06             	cmp    $0x6,%edx
   2c6ed:	0f 84 fc 2c 00 00    	je     2f3ef <JS_CallInternal+0xa3df>
   2c6f3:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   2c6f7:	83 fe f6             	cmp    $0xfffffff6,%esi
   2c6fa:	76 15                	jbe    2c711 <JS_CallInternal+0x7701>
   2c6fc:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   2c700:	8b 4f fc             	mov    -0x4(%rdi),%ecx
   2c703:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2c706:	89 57 fc             	mov    %edx,-0x4(%rdi)
   2c709:	85 d2                	test   %edx,%edx
   2c70b:	0f 8e a4 28 00 00    	jle    2efb5 <JS_CallInternal+0x9fa5>
   2c711:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2c718:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2c71c:	48 89 4b f0          	mov    %rcx,-0x10(%rbx)
   2c720:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2c727:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2c72b:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2c72f:	41 83 ff f6          	cmp    $0xfffffff6,%r15d
   2c733:	76 04                	jbe    2c739 <JS_CallInternal+0x7729>
   2c735:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2c739:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   2c73d:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   2c741:	48 89 c1             	mov    %rax,%rcx
   2c744:	4d 89 f8             	mov    %r15,%r8
   2c747:	4c 89 e7             	mov    %r12,%rdi
   2c74a:	4d 89 ef             	mov    %r13,%r15
   2c74d:	e8 ee 37 00 00       	call   2ff40 <JS_GetPropertyValue>
   2c752:	48 89 c1             	mov    %rax,%rcx
   2c755:	48 89 d0             	mov    %rdx,%rax
   2c758:	83 fa 06             	cmp    $0x6,%edx
   2c75b:	0f 84 df 8f ff ff    	je     25740 <JS_CallInternal+0x730>
   2c761:	48 89 ca             	mov    %rcx,%rdx
   2c764:	e9 f0 9a ff ff       	jmp    26259 <JS_CallInternal+0x1249>
   2c769:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2c770:	31 d2                	xor    %edx,%edx
   2c772:	48 89 de             	mov    %rbx,%rsi
   2c775:	4c 89 e7             	mov    %r12,%rdi
   2c778:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2c77c:	e8 8f ff 02 00       	call   5c710 <js_eq_slow>
   2c781:	85 c0                	test   %eax,%eax
   2c783:	0f 84 cb cd ff ff    	je     29554 <JS_CallInternal+0x4544>
   2c789:	4d 89 ef             	mov    %r13,%r15
   2c78c:	e9 af 8f ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2c791:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   2c798:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2c79d:	48 8b 87 48 04 00 00 	mov    0x448(%rdi),%rax
   2c7a4:	48 8b 34 c8          	mov    (%rax,%rcx,8),%rsi
   2c7a8:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2c7ab:	83 e8 01             	sub    $0x1,%eax
   2c7ae:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2c7b1:	85 c0                	test   %eax,%eax
   2c7b3:	0f 8f 6a cc ff ff    	jg     29423 <JS_CallInternal+0x4413>
   2c7b9:	4c 89 9d 30 fe ff ff 	mov    %r11,-0x1d0(%rbp)
   2c7c0:	e8 db a1 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2c7c5:	4c 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%r11
   2c7cc:	e9 52 cc ff ff       	jmp    29423 <JS_CallInternal+0x4413>
   2c7d1:	48 8d 35 71 bd 0a 00 	lea    0xabd71(%rip),%rsi        # d8549 <_IO_stdin_used+0x549>
   2c7d8:	4c 89 e7             	mov    %r12,%rdi
   2c7db:	31 c0                	xor    %eax,%eax
   2c7dd:	e8 be 70 00 00       	call   338a0 <JS_ThrowTypeError>
   2c7e2:	4c 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8
   2c7e9:	83 fb f6             	cmp    $0xfffffff6,%ebx
   2c7ec:	76 1e                	jbe    2c80c <JS_CallInternal+0x77fc>
   2c7ee:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2c7f5:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2c7f8:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   2c7fe:	83 e8 01             	sub    $0x1,%eax
   2c801:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2c804:	85 c0                	test   %eax,%eax
   2c806:	0f 8e 8d 2a 00 00    	jle    2f299 <JS_CallInternal+0xa289>
   2c80c:	83 bd 00 fe ff ff f6 	cmpl   $0xfffffff6,-0x200(%rbp)
   2c813:	76 1e                	jbe    2c833 <JS_CallInternal+0x7823>
   2c815:	48 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%rbx
   2c81c:	8b 43 fc             	mov    -0x4(%rbx),%eax
   2c81f:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2c825:	83 e8 01             	sub    $0x1,%eax
   2c828:	89 43 fc             	mov    %eax,-0x4(%rbx)
   2c82b:	85 c0                	test   %eax,%eax
   2c82d:	0f 8e 88 28 00 00    	jle    2f0bb <JS_CallInternal+0xa0ab>
   2c833:	ba 06 00 00 00       	mov    $0x6,%edx
   2c838:	31 c0                	xor    %eax,%eax
   2c83a:	e9 d2 ba ff ff       	jmp    28311 <JS_CallInternal+0x3301>
   2c83f:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2c846:	ba 01 00 00 00       	mov    $0x1,%edx
   2c84b:	48 89 de             	mov    %rbx,%rsi
   2c84e:	4c 89 e7             	mov    %r12,%rdi
   2c851:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2c855:	e8 b6 fe 02 00       	call   5c710 <js_eq_slow>
   2c85a:	85 c0                	test   %eax,%eax
   2c85c:	0f 84 0a c8 ff ff    	je     2906c <JS_CallInternal+0x405c>
   2c862:	4d 89 ef             	mov    %r13,%r15
   2c865:	e9 d6 8e ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2c86a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   2c870:	48 8b 95 b8 fe ff ff 	mov    -0x148(%rbp),%rdx
   2c877:	48 8b b5 c0 fe ff ff 	mov    -0x140(%rbp),%rsi
   2c87e:	48 89 8d a8 fe ff ff 	mov    %rcx,-0x158(%rbp)
   2c885:	48 8b bd b0 fe ff ff 	mov    -0x150(%rbp),%rdi
   2c88c:	48 89 85 c8 fe ff ff 	mov    %rax,-0x138(%rbp)
   2c893:	e8 68 5b ff ff       	call   22400 <close_var_refs>
   2c898:	48 8b 8d a8 fe ff ff 	mov    -0x158(%rbp),%rcx
   2c89f:	48 8b 85 c8 fe ff ff 	mov    -0x138(%rbp),%rax
   2c8a6:	e9 69 8f ff ff       	jmp    25814 <JS_CallInternal+0x804>
   2c8ab:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2c8b2:	44 89 d2             	mov    %r10d,%edx
   2c8b5:	48 89 de             	mov    %rbx,%rsi
   2c8b8:	4c 89 e7             	mov    %r12,%rdi
   2c8bb:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2c8bf:	e8 dc 52 02 00       	call   51ba0 <js_unary_arith_slow>
   2c8c4:	85 c0                	test   %eax,%eax
   2c8c6:	0f 84 59 cd ff ff    	je     29625 <JS_CallInternal+0x4615>
   2c8cc:	4d 89 ef             	mov    %r13,%r15
   2c8cf:	e9 6c 8e ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2c8d4:	0f 1f 40 00          	nopl   0x0(%rax)
   2c8d8:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2c8dd:	48 89 ce             	mov    %rcx,%rsi
   2c8e0:	e8 eb 1b ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2c8e5:	e9 1b 94 ff ff       	jmp    25d05 <JS_CallInternal+0xcf5>
   2c8ea:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2c8ef:	48 89 c2             	mov    %rax,%rdx
   2c8f2:	89 8d 00 fe ff ff    	mov    %ecx,-0x200(%rbp)
   2c8f8:	e8 d3 1b ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2c8fd:	8b 8d 00 fe ff ff    	mov    -0x200(%rbp),%ecx
   2c903:	e9 d8 97 ff ff       	jmp    260e0 <JS_CallInternal+0x10d0>
   2c908:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2c90d:	48 8b b7 48 04 00 00 	mov    0x448(%rdi),%rsi
   2c914:	48 8b 34 ce          	mov    (%rsi,%rcx,8),%rsi
   2c918:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   2c91b:	83 e9 01             	sub    $0x1,%ecx
   2c91e:	89 4e fc             	mov    %ecx,-0x4(%rsi)
   2c921:	85 c9                	test   %ecx,%ecx
   2c923:	0f 8f b6 98 ff ff    	jg     261df <JS_CallInternal+0x11cf>
   2c929:	48 89 95 10 fe ff ff 	mov    %rdx,-0x1f0(%rbp)
   2c930:	48 89 95 30 fe ff ff 	mov    %rdx,-0x1d0(%rbp)
   2c937:	e8 64 a0 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2c93c:	48 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%rdx
   2c943:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2c94a:	e9 90 98 ff ff       	jmp    261df <JS_CallInternal+0x11cf>
   2c94f:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2c954:	8b 85 30 fe ff ff    	mov    -0x1d0(%rbp),%eax
   2c95a:	48 8b 97 48 04 00 00 	mov    0x448(%rdi),%rdx
   2c961:	48 8b 34 c2          	mov    (%rdx,%rax,8),%rsi
   2c965:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2c968:	83 e8 01             	sub    $0x1,%eax
   2c96b:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2c96e:	85 c0                	test   %eax,%eax
   2c970:	0f 8f 5c ee ff ff    	jg     2b7d2 <JS_CallInternal+0x67c2>
   2c976:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2c97c:	e8 1f a0 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2c981:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2c987:	e9 46 ee ff ff       	jmp    2b7d2 <JS_CallInternal+0x67c2>
   2c98c:	41 83 ff f6          	cmp    $0xfffffff6,%r15d
   2c990:	76 13                	jbe    2c9a5 <JS_CallInternal+0x7995>
   2c992:	41 8b 42 fc          	mov    -0x4(%r10),%eax
   2c996:	83 e8 01             	sub    $0x1,%eax
   2c999:	41 89 42 fc          	mov    %eax,-0x4(%r10)
   2c99d:	85 c0                	test   %eax,%eax
   2c99f:	0f 8e 04 23 00 00    	jle    2eca9 <JS_CallInternal+0x9c99>
   2c9a5:	b8 01 00 00 00       	mov    $0x1,%eax
   2c9aa:	e9 09 c6 ff ff       	jmp    28fb8 <JS_CallInternal+0x3fa8>
   2c9af:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
   2c9b4:	e9 09 97 ff ff       	jmp    260c2 <JS_CallInternal+0x10b2>
   2c9b9:	45 31 e4             	xor    %r12d,%r12d
   2c9bc:	e9 65 ea ff ff       	jmp    2b426 <JS_CallInternal+0x6416>
   2c9c1:	41 83 f8 f6          	cmp    $0xfffffff6,%r8d
   2c9c5:	76 13                	jbe    2c9da <JS_CallInternal+0x79ca>
   2c9c7:	41 8b 42 fc          	mov    -0x4(%r10),%eax
   2c9cb:	83 e8 01             	sub    $0x1,%eax
   2c9ce:	41 89 42 fc          	mov    %eax,-0x4(%r10)
   2c9d2:	85 c0                	test   %eax,%eax
   2c9d4:	0f 8e 0a 24 00 00    	jle    2ede4 <JS_CallInternal+0x9dd4>
   2c9da:	45 31 ff             	xor    %r15d,%r15d
   2c9dd:	e9 27 c6 ff ff       	jmp    29009 <JS_CallInternal+0x3ff9>
   2c9e2:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2c9e7:	89 c0                	mov    %eax,%eax
   2c9e9:	48 8b 97 48 04 00 00 	mov    0x448(%rdi),%rdx
   2c9f0:	48 8b 34 c2          	mov    (%rdx,%rax,8),%rsi
   2c9f4:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2c9f7:	83 e8 01             	sub    $0x1,%eax
   2c9fa:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2c9fd:	85 c0                	test   %eax,%eax
   2c9ff:	0f 8f 1e c4 ff ff    	jg     28e23 <JS_CallInternal+0x3e13>
   2ca05:	4c 89 95 f0 fd ff ff 	mov    %r10,-0x210(%rbp)
   2ca0c:	4c 89 9d f8 fd ff ff 	mov    %r11,-0x208(%rbp)
   2ca13:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2ca1a:	4c 89 8d 10 fe ff ff 	mov    %r9,-0x1f0(%rbp)
   2ca21:	e8 7a 9f fe ff       	call   169a0 <JS_FreeAtomStruct>
   2ca26:	4c 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%r10
   2ca2d:	4c 8b 9d f8 fd ff ff 	mov    -0x208(%rbp),%r11
   2ca34:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2ca3b:	4c 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%r9
   2ca42:	e9 dc c3 ff ff       	jmp    28e23 <JS_CallInternal+0x3e13>
   2ca47:	48 83 ec 08          	sub    $0x8,%rsp
   2ca4b:	48 8d 43 f0          	lea    -0x10(%rbx),%rax
   2ca4f:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   2ca55:	50                   	push   %rax
   2ca56:	e9 c3 f3 ff ff       	jmp    2be1e <JS_CallInternal+0x6e0e>
   2ca5b:	49 83 c7 01          	add    $0x1,%r15
   2ca5f:	e9 dc 8c ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2ca64:	48 8d 35 00 bb 0a 00 	lea    0xabb00(%rip),%rsi        # d856b <_IO_stdin_used+0x56b>
   2ca6b:	4c 89 e7             	mov    %r12,%rdi
   2ca6e:	31 c0                	xor    %eax,%eax
   2ca70:	4d 89 ef             	mov    %r13,%r15
   2ca73:	e8 08 90 00 00       	call   35a80 <JS_ThrowInternalError>
   2ca78:	e9 c3 8c ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2ca7d:	49 8b 72 08          	mov    0x8(%r10),%rsi
   2ca81:	83 fe f6             	cmp    $0xfffffff6,%esi
   2ca84:	76 14                	jbe    2ca9a <JS_CallInternal+0x7a8a>
   2ca86:	49 8b 3a             	mov    (%r10),%rdi
   2ca89:	8b 57 fc             	mov    -0x4(%rdi),%edx
   2ca8c:	83 ea 01             	sub    $0x1,%edx
   2ca8f:	89 57 fc             	mov    %edx,-0x4(%rdi)
   2ca92:	85 d2                	test   %edx,%edx
   2ca94:	0f 8e 38 1f 00 00    	jle    2e9d2 <JS_CallInternal+0x99c2>
   2ca9a:	49 c7 02 00 00 00 00 	movq   $0x0,(%r10)
   2caa1:	49 c7 42 08 03 00 00 	movq   $0x3,0x8(%r10)
   2caa8:	00 
   2caa9:	45 85 c0             	test   %r8d,%r8d
   2caac:	0f 88 8e 8c ff ff    	js     25740 <JS_CallInternal+0x730>
   2cab2:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2cab5:	76 11                	jbe    2cac8 <JS_CallInternal+0x7ab8>
   2cab7:	8b 51 fc             	mov    -0x4(%rcx),%edx
   2caba:	83 ea 01             	sub    $0x1,%edx
   2cabd:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2cac0:	85 d2                	test   %edx,%edx
   2cac2:	0f 8e 47 29 00 00    	jle    2f40f <JS_CallInternal+0xa3ff>
   2cac8:	44 8b 95 dc fe ff ff 	mov    -0x124(%rbp),%r10d
   2cacf:	31 d2                	xor    %edx,%edx
   2cad1:	be 03 00 00 00       	mov    $0x3,%esi
   2cad6:	45 85 d2             	test   %r10d,%r10d
   2cad9:	0f 95 c2             	setne  %dl
   2cadc:	31 ff                	xor    %edi,%edi
   2cade:	e9 36 d1 ff ff       	jmp    29c19 <JS_CallInternal+0x4c09>
   2cae3:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2caea:	44 89 d2             	mov    %r10d,%edx
   2caed:	48 89 de             	mov    %rbx,%rsi
   2caf0:	4c 89 e7             	mov    %r12,%rdi
   2caf3:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2caf7:	e8 a4 50 02 00       	call   51ba0 <js_unary_arith_slow>
   2cafc:	85 c0                	test   %eax,%eax
   2cafe:	0f 84 61 cb ff ff    	je     29665 <JS_CallInternal+0x4655>
   2cb04:	4d 89 ef             	mov    %r13,%r15
   2cb07:	e9 34 8c ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2cb0c:	0f 1f 40 00          	nopl   0x0(%rax)
   2cb10:	48 8b b5 c0 fe ff ff 	mov    -0x140(%rbp),%rsi
   2cb17:	48 8b 46 30          	mov    0x30(%rsi),%rax
   2cb1b:	48 01 c8             	add    %rcx,%rax
   2cb1e:	8b 48 04             	mov    0x4(%rax),%ecx
   2cb21:	f6 00 08             	testb  $0x8,(%rax)
   2cb24:	0f 85 aa 2a 00 00    	jne    2f5d4 <JS_CallInternal+0xa5c4>
   2cb2a:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2cb31:	48 83 ec 08          	sub    $0x8,%rsp
   2cb35:	41 83 ea 37          	sub    $0x37,%r10d
   2cb39:	4d 8b 84 24 80 01 00 	mov    0x180(%r12),%r8
   2cb40:	00 
   2cb41:	4d 8b 8c 24 88 01 00 	mov    0x188(%r12),%r9
   2cb48:	00 
   2cb49:	49 8b b4 24 80 01 00 	mov    0x180(%r12),%rsi
   2cb50:	00 
   2cb51:	4c 89 e7             	mov    %r12,%rdi
   2cb54:	4c 89 78 30          	mov    %r15,0x30(%rax)
   2cb58:	49 8b 94 24 88 01 00 	mov    0x188(%r12),%rdx
   2cb5f:	00 
   2cb60:	41 52                	push   %r10
   2cb62:	e8 99 2d 00 00       	call   2f900 <JS_GetPropertyInternal>
   2cb67:	48 89 03             	mov    %rax,(%rbx)
   2cb6a:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2cb6e:	58                   	pop    %rax
   2cb6f:	5a                   	pop    %rdx
   2cb70:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   2cb74:	0f 85 e9 91 ff ff    	jne    25d63 <JS_CallInternal+0xd53>
   2cb7a:	e9 c1 8b ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2cb7f:	b9 03 00 00 00       	mov    $0x3,%ecx
   2cb84:	45 31 ff             	xor    %r15d,%r15d
   2cb87:	e9 45 e1 ff ff       	jmp    2acd1 <JS_CallInternal+0x5cc1>
   2cb8c:	8b 02                	mov    (%rdx),%eax
   2cb8e:	25 ff ff ff 03       	and    $0x3ffffff,%eax
   2cb93:	0f 85 06 dd ff ff    	jne    2a89f <JS_CallInternal+0x588f>
   2cb99:	49 8b b4 24 80 01 00 	mov    0x180(%r12),%rsi
   2cba0:	00 
   2cba1:	4c 89 e7             	mov    %r12,%rdi
   2cba4:	49 8b 94 24 88 01 00 	mov    0x188(%r12),%rdx
   2cbab:	00 
   2cbac:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2cbb2:	e8 a9 2f 04 00       	call   6fb60 <JS_HasProperty>
   2cbb7:	85 c0                	test   %eax,%eax
   2cbb9:	0f 88 81 8b ff ff    	js     25740 <JS_CallInternal+0x730>
   2cbbf:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2cbc5:	0f 84 e3 19 00 00    	je     2e5ae <JS_CallInternal+0x959e>
   2cbcb:	49 8b 94 24 88 01 00 	mov    0x188(%r12),%rdx
   2cbd2:	00 
   2cbd3:	49 8b 84 24 80 01 00 	mov    0x180(%r12),%rax
   2cbda:	00 
   2cbdb:	83 fa f6             	cmp    $0xfffffff6,%edx
   2cbde:	76 04                	jbe    2cbe4 <JS_CallInternal+0x7bd4>
   2cbe0:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2cbe4:	48 89 03             	mov    %rax,(%rbx)
   2cbe7:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2cbeb:	e9 fe dc ff ff       	jmp    2a8ee <JS_CallInternal+0x58de>
   2cbf0:	b8 03 00 00 00       	mov    $0x3,%eax
   2cbf5:	45 31 ff             	xor    %r15d,%r15d
   2cbf8:	e9 11 e0 ff ff       	jmp    2ac0e <JS_CallInternal+0x5bfe>
   2cbfd:	41 f6 42 10 08       	testb  $0x8,0x10(%r10)
   2cc02:	0f 85 4c d5 ff ff    	jne    2a154 <JS_CallInternal+0x5144>
   2cc08:	49 8b 4a 18          	mov    0x18(%r10),%rcx
   2cc0c:	48 39 08             	cmp    %rcx,(%rax)
   2cc0f:	0f 85 3f d5 ff ff    	jne    2a154 <JS_CallInternal+0x5144>
   2cc15:	48 83 78 08 00       	cmpq   $0x0,0x8(%rax)
   2cc1a:	0f 85 34 d5 ff ff    	jne    2a154 <JS_CallInternal+0x5144>
   2cc20:	8b 50 10             	mov    0x10(%rax),%edx
   2cc23:	8b 79 18             	mov    0x18(%rcx),%edi
   2cc26:	48 8d 34 d5 00 00 00 	lea    0x0(,%rdx,8),%rsi
   2cc2d:	00 
   2cc2e:	48 8d 74 be 3c       	lea    0x3c(%rsi,%rdi,4),%rsi
   2cc33:	0f b6 4c 31 03       	movzbl 0x3(%rcx,%rsi,1),%ecx
   2cc38:	c0 e9 02             	shr    $0x2,%cl
   2cc3b:	83 e1 3a             	and    $0x3a,%ecx
   2cc3e:	80 f9 02             	cmp    $0x2,%cl
   2cc41:	0f 85 0d d5 ff ff    	jne    2a154 <JS_CallInternal+0x5144>
   2cc47:	48 89 d0             	mov    %rdx,%rax
   2cc4a:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2cc4f:	4c 89 e7             	mov    %r12,%rdi
   2cc52:	48 83 eb 20          	sub    $0x20,%rbx
   2cc56:	48 c1 e0 04          	shl    $0x4,%rax
   2cc5a:	49 03 42 20          	add    0x20(%r10),%rax
   2cc5e:	4c 89 95 30 fe ff ff 	mov    %r10,-0x1d0(%rbp)
   2cc65:	49 83 c5 05          	add    $0x5,%r13
   2cc69:	48 8b 30             	mov    (%rax),%rsi
   2cc6c:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2cc70:	0f 11 00             	movups %xmm0,(%rax)
   2cc73:	4c 89 9d 10 fe ff ff 	mov    %r11,-0x1f0(%rbp)
   2cc7a:	e8 d1 19 ff ff       	call   1e650 <JS_FreeValue>
   2cc7f:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2cc86:	48 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%rdx
   2cc8d:	4c 89 e7             	mov    %r12,%rdi
   2cc90:	48 89 c6             	mov    %rax,%rsi
   2cc93:	e8 b8 19 ff ff       	call   1e650 <JS_FreeValue>
   2cc98:	41 0f b6 45 ff       	movzbl -0x1(%r13),%eax
   2cc9d:	49 89 c2             	mov    %rax,%r10
   2cca0:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2cca4:	ff e0                	jmp    *%rax
   2cca6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   2ccad:	00 00 00 
   2ccb0:	48 89 ce             	mov    %rcx,%rsi
   2ccb3:	8b 49 ac             	mov    -0x54(%rcx),%ecx
   2ccb6:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2ccbc:	83 e9 01             	sub    $0x1,%ecx
   2ccbf:	89 4e ac             	mov    %ecx,-0x54(%rsi)
   2ccc2:	0f 85 71 d8 ff ff    	jne    2a539 <JS_CallInternal+0x5529>
   2ccc8:	80 bf a0 04 00 00 02 	cmpb   $0x2,0x4a0(%rdi)
   2cccf:	0f 84 64 d8 ff ff    	je     2a539 <JS_CallInternal+0x5529>
   2ccd5:	48 83 ee 50          	sub    $0x50,%rsi
   2ccd9:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2cce0:	e8 7b 56 ff ff       	call   22360 <async_func_free.part.0>
   2cce5:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   2ccec:	4a 8d 14 fd 00 00 00 	lea    0x0(,%r15,8),%rdx
   2ccf3:	00 
   2ccf4:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2ccfb:	48 03 56 28          	add    0x28(%rsi),%rdx
   2ccff:	e9 35 d8 ff ff       	jmp    2a539 <JS_CallInternal+0x5529>
   2cd04:	0f b6 d0             	movzbl %al,%edx
   2cd07:	48 8d 35 21 b8 0a 00 	lea    0xab821(%rip),%rsi        # d852f <_IO_stdin_used+0x52f>
   2cd0e:	4c 89 e7             	mov    %r12,%rdi
   2cd11:	31 c0                	xor    %eax,%eax
   2cd13:	e8 68 8d 00 00       	call   35a80 <JS_ThrowInternalError>
   2cd18:	e9 23 8a ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2cd1d:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cd22:	4c 89 d6             	mov    %r10,%rsi
   2cd25:	4c 89 fa             	mov    %r15,%rdx
   2cd28:	e8 a3 17 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cd2d:	e9 60 9a ff ff       	jmp    26792 <JS_CallInternal+0x1782>
   2cd32:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cd37:	48 89 c2             	mov    %rax,%rdx
   2cd3a:	48 89 ce             	mov    %rcx,%rsi
   2cd3d:	4c 89 8d 30 fe ff ff 	mov    %r9,-0x1d0(%rbp)
   2cd44:	e8 87 17 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cd49:	4c 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9
   2cd50:	e9 b6 99 ff ff       	jmp    2670b <JS_CallInternal+0x16fb>
   2cd55:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cd5a:	48 89 ce             	mov    %rcx,%rsi
   2cd5d:	e8 6e 17 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cd62:	e9 54 bc ff ff       	jmp    289bb <JS_CallInternal+0x39ab>
   2cd67:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cd6c:	48 89 c2             	mov    %rax,%rdx
   2cd6f:	48 89 ce             	mov    %rcx,%rsi
   2cd72:	44 89 85 30 fe ff ff 	mov    %r8d,-0x1d0(%rbp)
   2cd79:	e8 52 17 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cd7e:	44 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8d
   2cd85:	e9 f1 f0 ff ff       	jmp    2be7b <JS_CallInternal+0x6e6b>
   2cd8a:	45 31 c0             	xor    %r8d,%r8d
   2cd8d:	48 92                	xchg   %rax,%rdx
   2cd8f:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cd94:	44 89 85 30 fe ff ff 	mov    %r8d,-0x1d0(%rbp)
   2cd9b:	48 89 c6             	mov    %rax,%rsi
   2cd9e:	e8 2d 17 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cda3:	44 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8d
   2cdaa:	e9 e9 f0 ff ff       	jmp    2be98 <JS_CallInternal+0x6e88>
   2cdaf:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   2cdb6:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cdbb:	48 89 d0             	mov    %rdx,%rax
   2cdbe:	4c 89 ca             	mov    %r9,%rdx
   2cdc1:	48 89 c6             	mov    %rax,%rsi
   2cdc4:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2cdcb:	44 89 85 10 fe ff ff 	mov    %r8d,-0x1f0(%rbp)
   2cdd2:	e8 f9 16 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cdd7:	48 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%rax
   2cdde:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2cde5:	44 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%r8d
   2cdec:	e9 64 9d ff ff       	jmp    26b55 <JS_CallInternal+0x1b45>
   2cdf1:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cdf6:	4c 89 d6             	mov    %r10,%rsi
   2cdf9:	4c 89 fa             	mov    %r15,%rdx
   2cdfc:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2ce03:	e8 c8 16 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2ce08:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2ce0f:	e9 4c c0 ff ff       	jmp    28e60 <JS_CallInternal+0x3e50>
   2ce14:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2ce19:	4c 89 c2             	mov    %r8,%rdx
   2ce1c:	e8 af 16 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2ce21:	e9 58 be ff ff       	jmp    28c7e <JS_CallInternal+0x3c6e>
   2ce26:	48 89 fe             	mov    %rdi,%rsi
   2ce29:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2ce2e:	e8 9d 16 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2ce33:	e9 38 bb ff ff       	jmp    28970 <JS_CallInternal+0x3960>
   2ce38:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2ce3d:	48 89 ce             	mov    %rcx,%rsi
   2ce40:	e8 8b 16 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2ce45:	e9 5a d8 ff ff       	jmp    2a6a4 <JS_CallInternal+0x5694>
   2ce4a:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2ce4f:	48 89 ce             	mov    %rcx,%rsi
   2ce52:	e8 79 16 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2ce57:	e9 fb d7 ff ff       	jmp    2a657 <JS_CallInternal+0x5647>
   2ce5c:	48 89 fe             	mov    %rdi,%rsi
   2ce5f:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2ce64:	e8 67 16 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2ce69:	e9 f2 da ff ff       	jmp    2a960 <JS_CallInternal+0x5950>
   2ce6e:	48 89 fe             	mov    %rdi,%rsi
   2ce71:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2ce76:	e8 55 16 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2ce7b:	e9 cd db ff ff       	jmp    2aa4d <JS_CallInternal+0x5a3d>
   2ce80:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2ce85:	48 89 ce             	mov    %rcx,%rsi
   2ce88:	e8 43 16 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2ce8d:	e9 d6 d4 ff ff       	jmp    2a368 <JS_CallInternal+0x5358>
   2ce92:	48 89 fe             	mov    %rdi,%rsi
   2ce95:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2ce9a:	e8 31 16 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2ce9f:	e9 9c d8 ff ff       	jmp    2a740 <JS_CallInternal+0x5730>
   2cea4:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cea9:	48 89 ce             	mov    %rcx,%rsi
   2ceac:	e8 1f 16 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2ceb1:	e9 f8 da ff ff       	jmp    2a9ae <JS_CallInternal+0x599e>
   2ceb6:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cebb:	48 89 ce             	mov    %rcx,%rsi
   2cebe:	e8 0d 16 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cec3:	e9 d4 db ff ff       	jmp    2aa9c <JS_CallInternal+0x5a8c>
   2cec8:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cecd:	48 89 c2             	mov    %rax,%rdx
   2ced0:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2ced7:	e8 f4 15 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cedc:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2cee3:	e9 07 de ff ff       	jmp    2acef <JS_CallInternal+0x5cdf>
   2cee8:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2ceed:	4c 89 d6             	mov    %r10,%rsi
   2cef0:	4c 89 da             	mov    %r11,%rdx
   2cef3:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2cef9:	e8 d2 15 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cefe:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2cf04:	e9 b7 d2 ff ff       	jmp    2a1c0 <JS_CallInternal+0x51b0>
   2cf09:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cf0e:	48 89 ce             	mov    %rcx,%rsi
   2cf11:	e8 ba 15 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cf16:	e9 13 d5 ff ff       	jmp    2a42e <JS_CallInternal+0x541e>
   2cf1b:	48 89 fe             	mov    %rdi,%rsi
   2cf1e:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cf23:	e8 a8 15 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cf28:	e9 a6 d4 ff ff       	jmp    2a3d3 <JS_CallInternal+0x53c3>
   2cf2d:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cf32:	48 89 f2             	mov    %rsi,%rdx
   2cf35:	48 89 ce             	mov    %rcx,%rsi
   2cf38:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2cf3f:	e8 8c 15 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cf44:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2cf4b:	e9 4a e3 ff ff       	jmp    2b29a <JS_CallInternal+0x628a>
   2cf50:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cf55:	48 89 c2             	mov    %rax,%rdx
   2cf58:	e8 73 15 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cf5d:	e9 cd ad ff ff       	jmp    27d2f <JS_CallInternal+0x2d1f>
   2cf62:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cf67:	48 89 c2             	mov    %rax,%rdx
   2cf6a:	e8 61 15 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cf6f:	e9 63 ae ff ff       	jmp    27dd7 <JS_CallInternal+0x2dc7>
   2cf74:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cf79:	48 89 c2             	mov    %rax,%rdx
   2cf7c:	e8 4f 15 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cf81:	e9 fd ad ff ff       	jmp    27d83 <JS_CallInternal+0x2d73>
   2cf86:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cf8b:	48 89 c2             	mov    %rax,%rdx
   2cf8e:	e8 3d 15 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cf93:	e9 91 ae ff ff       	jmp    27e29 <JS_CallInternal+0x2e19>
   2cf98:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cf9d:	48 89 c2             	mov    %rax,%rdx
   2cfa0:	e8 2b 15 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cfa5:	e9 83 aa ff ff       	jmp    27a2d <JS_CallInternal+0x2a1d>
   2cfaa:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cfaf:	48 89 c2             	mov    %rax,%rdx
   2cfb2:	e8 19 15 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cfb7:	e9 d7 ac ff ff       	jmp    27c93 <JS_CallInternal+0x2c83>
   2cfbc:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cfc1:	48 89 c2             	mov    %rax,%rdx
   2cfc4:	e8 07 15 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cfc9:	e9 71 ac ff ff       	jmp    27c3f <JS_CallInternal+0x2c2f>
   2cfce:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cfd3:	48 89 c2             	mov    %rax,%rdx
   2cfd6:	48 89 ce             	mov    %rcx,%rsi
   2cfd9:	e8 f2 14 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cfde:	e9 f8 ac ff ff       	jmp    27cdb <JS_CallInternal+0x2ccb>
   2cfe3:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cfe8:	48 89 c2             	mov    %rax,%rdx
   2cfeb:	e8 e0 14 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2cff0:	e9 9c a9 ff ff       	jmp    27991 <JS_CallInternal+0x2981>
   2cff5:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2cffa:	48 89 c2             	mov    %rax,%rdx
   2cffd:	48 89 ce             	mov    %rcx,%rsi
   2d000:	e8 cb 14 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d005:	e9 cf a9 ff ff       	jmp    279d9 <JS_CallInternal+0x29c9>
   2d00a:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d00f:	48 89 c2             	mov    %rax,%rdx
   2d012:	48 89 ce             	mov    %rcx,%rsi
   2d015:	e8 b6 14 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d01a:	e9 ce ab ff ff       	jmp    27bed <JS_CallInternal+0x2bdd>
   2d01f:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d024:	48 89 c2             	mov    %rax,%rdx
   2d027:	48 89 ce             	mov    %rcx,%rsi
   2d02a:	e8 a1 14 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d02f:	e9 35 ab ff ff       	jmp    27b69 <JS_CallInternal+0x2b59>
   2d034:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d039:	48 89 ce             	mov    %rcx,%rsi
   2d03c:	e8 8f 14 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d041:	e9 c3 d5 ff ff       	jmp    2a609 <JS_CallInternal+0x55f9>
   2d046:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d04b:	4c 89 ca             	mov    %r9,%rdx
   2d04e:	4c 89 fe             	mov    %r15,%rsi
   2d051:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   2d058:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2d05f:	e8 6c 14 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d064:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   2d06b:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2d072:	e9 db 92 ff ff       	jmp    26352 <JS_CallInternal+0x1342>
   2d077:	48 89 f2             	mov    %rsi,%rdx
   2d07a:	48 89 fe             	mov    %rdi,%rsi
   2d07d:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d082:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2d089:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2d090:	4c 89 85 30 fe ff ff 	mov    %r8,-0x1d0(%rbp)
   2d097:	e8 34 14 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d09c:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2d0a3:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2d0aa:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2d0b1:	e9 f2 94 ff ff       	jmp    265a8 <JS_CallInternal+0x1598>
   2d0b6:	48 89 f2             	mov    %rsi,%rdx
   2d0b9:	48 89 fe             	mov    %rdi,%rsi
   2d0bc:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d0c1:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2d0c8:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2d0cf:	4c 89 85 30 fe ff ff 	mov    %r8,-0x1d0(%rbp)
   2d0d6:	e8 f5 13 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d0db:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2d0e2:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2d0e9:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2d0f0:	e9 d1 94 ff ff       	jmp    265c6 <JS_CallInternal+0x15b6>
   2d0f5:	48 89 f2             	mov    %rsi,%rdx
   2d0f8:	48 89 fe             	mov    %rdi,%rsi
   2d0fb:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d100:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2d107:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2d10e:	e8 bd 13 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d113:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2d11a:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2d121:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2d128:	e9 5e 94 ff ff       	jmp    2658b <JS_CallInternal+0x157b>
   2d12d:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d132:	48 89 c2             	mov    %rax,%rdx
   2d135:	48 89 ce             	mov    %rcx,%rsi
   2d138:	4c 89 8d 30 fe ff ff 	mov    %r9,-0x1d0(%rbp)
   2d13f:	e8 8c 13 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d144:	4c 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9
   2d14b:	e9 9e 95 ff ff       	jmp    266ee <JS_CallInternal+0x16de>
   2d150:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d155:	48 89 f2             	mov    %rsi,%rdx
   2d158:	48 89 ce             	mov    %rcx,%rsi
   2d15b:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2d162:	e8 69 13 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d167:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2d16e:	e9 69 e0 ff ff       	jmp    2b1dc <JS_CallInternal+0x61cc>
   2d173:	8b 9d 30 fe ff ff    	mov    -0x1d0(%rbp),%ebx
   2d179:	85 db                	test   %ebx,%ebx
   2d17b:	74 43                	je     2d1c0 <JS_CallInternal+0x81b0>
   2d17d:	4c 89 c3             	mov    %r8,%rbx
   2d180:	4f 8d 2c 01          	lea    (%r9,%r8,1),%r13
   2d184:	4d 89 c6             	mov    %r8,%r14
   2d187:	eb 09                	jmp    2d192 <JS_CallInternal+0x8182>
   2d189:	48 83 c3 10          	add    $0x10,%rbx
   2d18d:	4c 39 eb             	cmp    %r13,%rbx
   2d190:	74 2b                	je     2d1bd <JS_CallInternal+0x81ad>
   2d192:	48 8b 43 08          	mov    0x8(%rbx),%rax
   2d196:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2d199:	76 ee                	jbe    2d189 <JS_CallInternal+0x8179>
   2d19b:	48 8b 0b             	mov    (%rbx),%rcx
   2d19e:	8b 51 fc             	mov    -0x4(%rcx),%edx
   2d1a1:	83 ea 01             	sub    $0x1,%edx
   2d1a4:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2d1a7:	85 d2                	test   %edx,%edx
   2d1a9:	7f de                	jg     2d189 <JS_CallInternal+0x8179>
   2d1ab:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d1b0:	48 89 c2             	mov    %rax,%rdx
   2d1b3:	48 89 ce             	mov    %rcx,%rsi
   2d1b6:	e8 15 13 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d1bb:	eb cc                	jmp    2d189 <JS_CallInternal+0x8179>
   2d1bd:	4d 89 f0             	mov    %r14,%r8
   2d1c0:	4c 89 c3             	mov    %r8,%rbx
   2d1c3:	e9 78 85 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2d1c8:	48 89 fe             	mov    %rdi,%rsi
   2d1cb:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d1d0:	e8 fb 12 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d1d5:	e9 93 b3 ff ff       	jmp    2856d <JS_CallInternal+0x355d>
   2d1da:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d1df:	48 89 ce             	mov    %rcx,%rsi
   2d1e2:	e8 e9 12 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d1e7:	e9 cc b3 ff ff       	jmp    285b8 <JS_CallInternal+0x35a8>
   2d1ec:	48 83 ec 08          	sub    $0x8,%rsp
   2d1f0:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   2d1f6:	4c 89 e7             	mov    %r12,%rdi
   2d1f9:	49 89 d1             	mov    %rdx,%r9
   2d1fc:	6a 00                	push   $0x0
   2d1fe:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2d205:	4c 89 ee             	mov    %r13,%rsi
   2d208:	e8 f3 26 00 00       	call   2f900 <JS_GetPropertyInternal>
   2d20d:	5f                   	pop    %rdi
   2d20e:	41 58                	pop    %r8
   2d210:	48 89 c1             	mov    %rax,%rcx
   2d213:	48 89 d0             	mov    %rdx,%rax
   2d216:	83 fa 06             	cmp    $0x6,%edx
   2d219:	0f 85 48 89 ff ff    	jne    25b67 <JS_CallInternal+0xb57>
   2d21f:	e9 1c 85 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2d224:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d229:	48 89 c2             	mov    %rax,%rdx
   2d22c:	48 89 ce             	mov    %rcx,%rsi
   2d22f:	e8 9c 12 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d234:	e9 a4 c8 ff ff       	jmp    29add <JS_CallInternal+0x4acd>
   2d239:	48 89 f2             	mov    %rsi,%rdx
   2d23c:	48 89 fe             	mov    %rdi,%rsi
   2d23f:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d244:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2d24b:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2d252:	e8 79 12 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d257:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2d25e:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2d265:	e9 d9 db ff ff       	jmp    2ae43 <JS_CallInternal+0x5e33>
   2d26a:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d26f:	4c 89 ca             	mov    %r9,%rdx
   2d272:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   2d279:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   2d280:	4c 89 9d 08 fe ff ff 	mov    %r11,-0x1f8(%rbp)
   2d287:	e8 44 12 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d28c:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   2d293:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   2d29a:	e9 a8 bb ff ff       	jmp    28e47 <JS_CallInternal+0x3e37>
   2d29f:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d2a4:	48 89 ce             	mov    %rcx,%rsi
   2d2a7:	e8 24 12 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d2ac:	e9 72 ae ff ff       	jmp    28123 <JS_CallInternal+0x3113>
   2d2b1:	48 89 fe             	mov    %rdi,%rsi
   2d2b4:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d2b9:	e8 12 12 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d2be:	e9 11 ae ff ff       	jmp    280d4 <JS_CallInternal+0x30c4>
   2d2c3:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2d2ca:	41 8b 49 04          	mov    0x4(%r9),%ecx
   2d2ce:	4c 89 e7             	mov    %r12,%rdi
   2d2d1:	4c 89 8d 30 fe ff ff 	mov    %r9,-0x1d0(%rbp)
   2d2d8:	49 8b b4 24 80 01 00 	mov    0x180(%r12),%rsi
   2d2df:	00 
   2d2e0:	49 8b 94 24 88 01 00 	mov    0x188(%r12),%rdx
   2d2e7:	00 
   2d2e8:	4c 89 78 30          	mov    %r15,0x30(%rax)
   2d2ec:	e8 6f 28 04 00       	call   6fb60 <JS_HasProperty>
   2d2f1:	85 c0                	test   %eax,%eax
   2d2f3:	0f 88 47 84 ff ff    	js     25740 <JS_CallInternal+0x730>
   2d2f9:	4c 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9
   2d300:	0f 85 d2 01 00 00    	jne    2d4d8 <JS_CallInternal+0x84c8>
   2d306:	49 8b 44 24 10       	mov    0x10(%r12),%rax
   2d30b:	48 8b 80 f0 04 00 00 	mov    0x4f0(%rax),%rax
   2d312:	48 85 c0             	test   %rax,%rax
   2d315:	0f 84 bd 01 00 00    	je     2d4d8 <JS_CallInternal+0x84c8>
   2d31b:	f6 40 3c 01          	testb  $0x1,0x3c(%rax)
   2d31f:	0f 84 b3 01 00 00    	je     2d4d8 <JS_CallInternal+0x84c8>
   2d325:	41 8b 71 04          	mov    0x4(%r9),%esi
   2d329:	4c 89 e7             	mov    %r12,%rdi
   2d32c:	e8 8f 85 00 00       	call   358c0 <JS_ThrowReferenceErrorNotDefined>
   2d331:	e9 0a 84 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2d336:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d33b:	48 89 c2             	mov    %rax,%rdx
   2d33e:	48 89 ce             	mov    %rcx,%rsi
   2d341:	e8 8a 11 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d346:	e9 26 ab ff ff       	jmp    27e71 <JS_CallInternal+0x2e61>
   2d34b:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d350:	48 89 ce             	mov    %rcx,%rsi
   2d353:	e8 78 11 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d358:	e9 dc be ff ff       	jmp    29239 <JS_CallInternal+0x4229>
   2d35d:	48 89 fe             	mov    %rdi,%rsi
   2d360:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d365:	e8 66 11 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d36a:	e9 68 ca ff ff       	jmp    29dd7 <JS_CallInternal+0x4dc7>
   2d36f:	48 89 f2             	mov    %rsi,%rdx
   2d372:	48 89 fe             	mov    %rdi,%rsi
   2d375:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d37a:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   2d381:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   2d388:	44 89 85 30 fe ff ff 	mov    %r8d,-0x1d0(%rbp)
   2d38f:	e8 3c 11 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d394:	48 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%rax
   2d39b:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   2d3a2:	44 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8d
   2d3a9:	e9 d2 97 ff ff       	jmp    26b80 <JS_CallInternal+0x1b70>
   2d3ae:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d3b3:	48 89 c2             	mov    %rax,%rdx
   2d3b6:	48 89 ce             	mov    %rcx,%rsi
   2d3b9:	e8 12 11 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d3be:	e9 e8 ce ff ff       	jmp    2a2ab <JS_CallInternal+0x529b>
   2d3c3:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d3c8:	48 89 c2             	mov    %rax,%rdx
   2d3cb:	48 89 ce             	mov    %rcx,%rsi
   2d3ce:	e8 fd 10 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d3d3:	e9 72 d4 ff ff       	jmp    2a84a <JS_CallInternal+0x583a>
   2d3d8:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d3dd:	48 89 c2             	mov    %rax,%rdx
   2d3e0:	48 89 ce             	mov    %rcx,%rsi
   2d3e3:	e8 e8 10 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d3e8:	e9 a3 9f ff ff       	jmp    27390 <JS_CallInternal+0x2380>
   2d3ed:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d3f2:	48 89 c2             	mov    %rax,%rdx
   2d3f5:	48 89 ce             	mov    %rcx,%rsi
   2d3f8:	e8 d3 10 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d3fd:	e9 d2 9f ff ff       	jmp    273d4 <JS_CallInternal+0x23c4>
   2d402:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d407:	48 89 c2             	mov    %rax,%rdx
   2d40a:	48 89 ce             	mov    %rcx,%rsi
   2d40d:	e8 be 10 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d412:	e9 30 9f ff ff       	jmp    27347 <JS_CallInternal+0x2337>
   2d417:	48 89 f2             	mov    %rsi,%rdx
   2d41a:	48 89 fe             	mov    %rdi,%rsi
   2d41d:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d422:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2d429:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2d430:	e8 9b 10 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d435:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2d43c:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2d443:	e9 a6 ad ff ff       	jmp    281ee <JS_CallInternal+0x31de>
   2d448:	48 89 f2             	mov    %rsi,%rdx
   2d44b:	48 89 fe             	mov    %rdi,%rsi
   2d44e:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d453:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2d45a:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2d461:	e8 6a 10 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d466:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2d46d:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2d474:	e9 58 ad ff ff       	jmp    281d1 <JS_CallInternal+0x31c1>
   2d479:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d47e:	48 89 c2             	mov    %rax,%rdx
   2d481:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2d488:	e8 43 10 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d48d:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2d494:	e9 be ad ff ff       	jmp    28257 <JS_CallInternal+0x3247>
   2d499:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d49e:	48 89 c2             	mov    %rax,%rdx
   2d4a1:	48 89 ce             	mov    %rcx,%rsi
   2d4a4:	e8 27 10 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d4a9:	e9 0b aa ff ff       	jmp    27eb9 <JS_CallInternal+0x2ea9>
   2d4ae:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d4b3:	48 89 c2             	mov    %rax,%rdx
   2d4b6:	48 89 ce             	mov    %rcx,%rsi
   2d4b9:	e8 12 10 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d4be:	e9 84 aa ff ff       	jmp    27f47 <JS_CallInternal+0x2f37>
   2d4c3:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d4c8:	48 89 c2             	mov    %rax,%rdx
   2d4cb:	48 89 ce             	mov    %rcx,%rsi
   2d4ce:	e8 fd 0f ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d4d3:	e9 29 aa ff ff       	jmp    27f01 <JS_CallInternal+0x2ef1>
   2d4d8:	48 83 ec 08          	sub    $0x8,%rsp
   2d4dc:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2d4e0:	48 8b 7b f8          	mov    -0x8(%rbx),%rdi
   2d4e4:	48 83 eb 10          	sub    $0x10,%rbx
   2d4e8:	41 8b 49 04          	mov    0x4(%r9),%ecx
   2d4ec:	49 8b 84 24 80 01 00 	mov    0x180(%r12),%rax
   2d4f3:	00 
   2d4f4:	49 8b 94 24 88 01 00 	mov    0x188(%r12),%rdx
   2d4fb:	00 
   2d4fc:	68 00 80 00 00       	push   $0x8000
   2d501:	49 89 f0             	mov    %rsi,%r8
   2d504:	49 89 f9             	mov    %rdi,%r9
   2d507:	41 ff b4 24 88 01 00 	push   0x188(%r12)
   2d50e:	00 
   2d50f:	48 89 c6             	mov    %rax,%rsi
   2d512:	4c 89 e7             	mov    %r12,%rdi
   2d515:	41 ff b4 24 80 01 00 	push   0x180(%r12)
   2d51c:	00 
   2d51d:	e8 2e 31 00 00       	call   30650 <JS_SetPropertyInternal>
   2d522:	48 83 c4 20          	add    $0x20,%rsp
   2d526:	85 c0                	test   %eax,%eax
   2d528:	0f 89 db 87 ff ff    	jns    25d09 <JS_CallInternal+0xcf9>
   2d52e:	e9 0d 82 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2d533:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2d538:	48 83 c3 10          	add    $0x10,%rbx
   2d53c:	e9 ff 81 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2d541:	4d 89 ef             	mov    %r13,%r15
   2d544:	e9 f7 81 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2d549:	4c 89 e7             	mov    %r12,%rdi
   2d54c:	e8 ef 85 00 00       	call   35b40 <__js_poll_interrupts>
   2d551:	85 c0                	test   %eax,%eax
   2d553:	0f 85 e7 81 ff ff    	jne    25740 <JS_CallInternal+0x730>
   2d559:	e9 a9 cc ff ff       	jmp    2a207 <JS_CallInternal+0x51f7>
   2d55e:	66 90                	xchg   %ax,%ax
   2d560:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d565:	48 89 c2             	mov    %rax,%rdx
   2d568:	48 89 ce             	mov    %rcx,%rsi
   2d56b:	e8 60 0f ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d570:	e9 0a ca ff ff       	jmp    29f7f <JS_CallInternal+0x4f6f>
   2d575:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2d579:	b8 08 00 00 00       	mov    $0x8,%eax
   2d57e:	f2 48 0f 2a c1       	cvtsi2sd %rcx,%xmm0
   2d583:	f2 41 0f 11 01       	movsd  %xmm0,(%r9)
   2d588:	e9 12 c3 ff ff       	jmp    2989f <JS_CallInternal+0x488f>
   2d58d:	83 f8 08             	cmp    $0x8,%eax
   2d590:	0f 84 8b 1d 00 00    	je     2f321 <JS_CallInternal+0xa311>
   2d596:	83 f8 f9             	cmp    $0xfffffff9,%eax
   2d599:	0f 84 f7 11 00 00    	je     2e796 <JS_CallInternal+0x9786>
   2d59f:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   2d5a6:	4c 89 7e 30          	mov    %r15,0x30(%rsi)
   2d5aa:	49 8b 31             	mov    (%r9),%rsi
   2d5ad:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2d5b0:	0f 87 f7 11 00 00    	ja     2e7ad <JS_CallInternal+0x979d>
   2d5b6:	48 89 b5 50 ff ff ff 	mov    %rsi,-0xb0(%rbp)
   2d5bd:	4c 89 e7             	mov    %r12,%rdi
   2d5c0:	48 83 eb 10          	sub    $0x10,%rbx
   2d5c4:	48 8d b5 70 ff ff ff 	lea    -0x90(%rbp),%rsi
   2d5cb:	4c 89 8d 30 fe ff ff 	mov    %r9,-0x1d0(%rbp)
   2d5d2:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
   2d5d9:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
   2d5e0:	48 89 85 58 ff ff ff 	mov    %rax,-0xa8(%rbp)
   2d5e7:	e8 f4 96 02 00       	call   56ce0 <js_add_slow>
   2d5ec:	85 c0                	test   %eax,%eax
   2d5ee:	0f 85 4c 81 ff ff    	jne    25740 <JS_CallInternal+0x730>
   2d5f4:	4c 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9
   2d5fb:	48 8b 95 50 ff ff ff 	mov    -0xb0(%rbp),%rdx
   2d602:	49 8b 09             	mov    (%r9),%rcx
   2d605:	49 8b 41 08          	mov    0x8(%r9),%rax
   2d609:	49 89 11             	mov    %rdx,(%r9)
   2d60c:	48 8b 95 58 ff ff ff 	mov    -0xa8(%rbp),%rdx
   2d613:	49 89 51 08          	mov    %rdx,0x8(%r9)
   2d617:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2d61a:	0f 86 87 c2 ff ff    	jbe    298a7 <JS_CallInternal+0x4897>
   2d620:	8b 51 fc             	mov    -0x4(%rcx),%edx
   2d623:	83 ea 01             	sub    $0x1,%edx
   2d626:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2d629:	85 d2                	test   %edx,%edx
   2d62b:	0f 8f 76 c2 ff ff    	jg     298a7 <JS_CallInternal+0x4897>
   2d631:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d636:	48 89 c2             	mov    %rax,%rdx
   2d639:	48 89 ce             	mov    %rcx,%rsi
   2d63c:	e8 8f 0e ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d641:	e9 61 c2 ff ff       	jmp    298a7 <JS_CallInternal+0x4897>
   2d646:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   2d64d:	00 00 00 
   2d650:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d655:	48 89 c2             	mov    %rax,%rdx
   2d658:	48 89 ce             	mov    %rcx,%rsi
   2d65b:	4c 89 9d f0 fd ff ff 	mov    %r11,-0x210(%rbp)
   2d662:	e8 69 0e ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d667:	4c 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%r11
   2d66e:	e9 cb c8 ff ff       	jmp    29f3e <JS_CallInternal+0x4f2e>
   2d673:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2d67a:	44 89 d2             	mov    %r10d,%edx
   2d67d:	48 89 de             	mov    %rbx,%rsi
   2d680:	4c 89 e7             	mov    %r12,%rdi
   2d683:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2d687:	e8 24 4e 02 00       	call   524b0 <js_binary_logic_slow>
   2d68c:	85 c0                	test   %eax,%eax
   2d68e:	0f 85 30 1f 00 00    	jne    2f5c4 <JS_CallInternal+0xa5b4>
   2d694:	48 83 eb 10          	sub    $0x10,%rbx
   2d698:	e9 af c9 ff ff       	jmp    2a04c <JS_CallInternal+0x503c>
   2d69d:	83 fe 08             	cmp    $0x8,%esi
   2d6a0:	0f 84 87 18 00 00    	je     2ef2d <JS_CallInternal+0x9f1d>
   2d6a6:	83 f9 08             	cmp    $0x8,%ecx
   2d6a9:	75 08                	jne    2d6b3 <JS_CallInternal+0x86a3>
   2d6ab:	85 f6                	test   %esi,%esi
   2d6ad:	0f 84 22 1c 00 00    	je     2f2d5 <JS_CallInternal+0xa2c5>
   2d6b3:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2d6ba:	44 89 d2             	mov    %r10d,%edx
   2d6bd:	48 89 de             	mov    %rbx,%rsi
   2d6c0:	4c 89 e7             	mov    %r12,%rdi
   2d6c3:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2d6c7:	e8 e4 ea 02 00       	call   5c1b0 <js_relational_slow>
   2d6cc:	85 c0                	test   %eax,%eax
   2d6ce:	0f 85 f8 1e 00 00    	jne    2f5cc <JS_CallInternal+0xa5bc>
   2d6d4:	48 83 eb 10          	sub    $0x10,%rbx
   2d6d8:	e9 c3 be ff ff       	jmp    295a0 <JS_CallInternal+0x4590>
   2d6dd:	4d 89 ef             	mov    %r13,%r15
   2d6e0:	e9 5b 80 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2d6e5:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2d6ec:	48 89 de             	mov    %rbx,%rsi
   2d6ef:	4c 89 e7             	mov    %r12,%rdi
   2d6f2:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2d6f6:	e8 e5 4b 02 00       	call   522e0 <js_shr_slow>
   2d6fb:	85 c0                	test   %eax,%eax
   2d6fd:	0f 85 87 20 00 00    	jne    2f78a <JS_CallInternal+0xa77a>
   2d703:	48 83 eb 10          	sub    $0x10,%rbx
   2d707:	e9 88 c9 ff ff       	jmp    2a094 <JS_CallInternal+0x5084>
   2d70c:	83 fe 08             	cmp    $0x8,%esi
   2d70f:	0f 84 53 1c 00 00    	je     2f368 <JS_CallInternal+0xa358>
   2d715:	83 f9 08             	cmp    $0x8,%ecx
   2d718:	75 08                	jne    2d722 <JS_CallInternal+0x8712>
   2d71a:	85 f6                	test   %esi,%esi
   2d71c:	0f 84 7e 1c 00 00    	je     2f3a0 <JS_CallInternal+0xa390>
   2d722:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2d729:	44 89 d2             	mov    %r10d,%edx
   2d72c:	48 89 de             	mov    %rbx,%rsi
   2d72f:	4c 89 e7             	mov    %r12,%rdi
   2d732:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2d736:	e8 75 ea 02 00       	call   5c1b0 <js_relational_slow>
   2d73b:	85 c0                	test   %eax,%eax
   2d73d:	0f 85 a0 1e 00 00    	jne    2f5e3 <JS_CallInternal+0xa5d3>
   2d743:	48 83 eb 10          	sub    $0x10,%rbx
   2d747:	e9 cd c9 ff ff       	jmp    2a119 <JS_CallInternal+0x5109>
   2d74c:	31 c0                	xor    %eax,%eax
   2d74e:	48 8d 35 28 ae 0a 00 	lea    0xaae28(%rip),%rsi        # d857d <_IO_stdin_used+0x57d>
   2d755:	4c 89 e7             	mov    %r12,%rdi
   2d758:	4d 89 ef             	mov    %r13,%r15
   2d75b:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2d762:	4c 89 85 10 fe ff ff 	mov    %r8,-0x1f0(%rbp)
   2d769:	e8 12 83 00 00       	call   35a80 <JS_ThrowInternalError>
   2d76e:	83 fb f6             	cmp    $0xfffffff6,%ebx
   2d771:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2d778:	76 1a                	jbe    2d794 <JS_CallInternal+0x8784>
   2d77a:	4c 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%r8
   2d781:	41 8b 40 fc          	mov    -0x4(%r8),%eax
   2d785:	83 e8 01             	sub    $0x1,%eax
   2d788:	41 89 40 fc          	mov    %eax,-0x4(%r8)
   2d78c:	85 c0                	test   %eax,%eax
   2d78e:	0f 8e f9 18 00 00    	jle    2f08d <JS_CallInternal+0xa07d>
   2d794:	48 89 cb             	mov    %rcx,%rbx
   2d797:	e9 a4 7f ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2d79c:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2d7a0:	48 c7 43 e8 08 00 00 	movq   $0x8,-0x18(%rbx)
   2d7a7:	00 
   2d7a8:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
   2d7ad:	f2 0f 11 43 e0       	movsd  %xmm0,-0x20(%rbx)
   2d7b2:	e9 fd 8b ff ff       	jmp    263b4 <JS_CallInternal+0x13a4>
   2d7b7:	83 fa 08             	cmp    $0x8,%edx
   2d7ba:	0f 84 33 1d 00 00    	je     2f4f3 <JS_CallInternal+0xa4e3>
   2d7c0:	83 f8 08             	cmp    $0x8,%eax
   2d7c3:	0f 84 ff 1c 00 00    	je     2f4c8 <JS_CallInternal+0xa4b8>
   2d7c9:	8d 72 07             	lea    0x7(%rdx),%esi
   2d7cc:	83 fe 01             	cmp    $0x1,%esi
   2d7cf:	0f 86 3a 1d 00 00    	jbe    2f50f <JS_CallInternal+0xa4ff>
   2d7d5:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2d7dc:	48 89 de             	mov    %rbx,%rsi
   2d7df:	4c 89 e7             	mov    %r12,%rdi
   2d7e2:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2d7e6:	e8 f5 94 02 00       	call   56ce0 <js_add_slow>
   2d7eb:	85 c0                	test   %eax,%eax
   2d7ed:	0f 84 c1 8b ff ff    	je     263b4 <JS_CallInternal+0x13a4>
   2d7f3:	4d 89 ef             	mov    %r13,%r15
   2d7f6:	e9 45 7f ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2d7fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2d800:	4d 89 ef             	mov    %r13,%r15
   2d803:	e9 38 7f ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2d808:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d80d:	48 89 c2             	mov    %rax,%rdx
   2d810:	48 89 ce             	mov    %rcx,%rsi
   2d813:	e8 b8 0c ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d818:	e9 f9 dd ff ff       	jmp    2b616 <JS_CallInternal+0x6606>
   2d81d:	48 83 eb 10          	sub    $0x10,%rbx
   2d821:	e9 1a 7f ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2d826:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2d82d:	44 89 d2             	mov    %r10d,%edx
   2d830:	48 89 de             	mov    %rbx,%rsi
   2d833:	4c 89 e7             	mov    %r12,%rdi
   2d836:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2d83a:	e8 71 4c 02 00       	call   524b0 <js_binary_logic_slow>
   2d83f:	85 c0                	test   %eax,%eax
   2d841:	0f 85 5e 1f 00 00    	jne    2f7a5 <JS_CallInternal+0xa795>
   2d847:	48 83 eb 10          	sub    $0x10,%rbx
   2d84b:	e9 0d b9 ff ff       	jmp    2915d <JS_CallInternal+0x414d>
   2d850:	48 8d 35 a9 e5 0a 00 	lea    0xae5a9(%rip),%rsi        # dbe00 <_IO_stdin_used+0x3e00>
   2d857:	4c 89 e7             	mov    %r12,%rdi
   2d85a:	31 c0                	xor    %eax,%eax
   2d85c:	4d 89 ef             	mov    %r13,%r15
   2d85f:	e8 3c 60 00 00       	call   338a0 <JS_ThrowTypeError>
   2d864:	e9 d7 7e ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2d869:	4d 89 ef             	mov    %r13,%r15
   2d86c:	e9 cf 7e ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2d871:	4c 89 e7             	mov    %r12,%rdi
   2d874:	e8 c7 82 00 00       	call   35b40 <__js_poll_interrupts>
   2d879:	85 c0                	test   %eax,%eax
   2d87b:	0f 85 bf 7e ff ff    	jne    25740 <JS_CallInternal+0x730>
   2d881:	e9 f0 c9 ff ff       	jmp    2a276 <JS_CallInternal+0x5266>
   2d886:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   2d88d:	00 00 00 
   2d890:	83 fe 08             	cmp    $0x8,%esi
   2d893:	0f 84 0c 1c 00 00    	je     2f4a5 <JS_CallInternal+0xa495>
   2d899:	83 f9 08             	cmp    $0x8,%ecx
   2d89c:	75 08                	jne    2d8a6 <JS_CallInternal+0x8896>
   2d89e:	85 f6                	test   %esi,%esi
   2d8a0:	0f 84 97 1a 00 00    	je     2f33d <JS_CallInternal+0xa32d>
   2d8a6:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2d8ad:	44 89 d2             	mov    %r10d,%edx
   2d8b0:	48 89 de             	mov    %rbx,%rsi
   2d8b3:	4c 89 e7             	mov    %r12,%rdi
   2d8b6:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2d8ba:	e8 f1 e8 02 00       	call   5c1b0 <js_relational_slow>
   2d8bf:	85 c0                	test   %eax,%eax
   2d8c1:	0f 85 ba 1c 00 00    	jne    2f581 <JS_CallInternal+0xa571>
   2d8c7:	48 83 eb 10          	sub    $0x10,%rbx
   2d8cb:	e9 17 b9 ff ff       	jmp    291e7 <JS_CallInternal+0x41d7>
   2d8d0:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2d8d4:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
   2d8d9:	48 c7 43 e8 08 00 00 	movq   $0x8,-0x18(%rbx)
   2d8e0:	00 
   2d8e1:	48 83 eb 10          	sub    $0x10,%rbx
   2d8e5:	f2 0f 11 43 f0       	movsd  %xmm0,-0x10(%rbx)
   2d8ea:	e9 f4 be ff ff       	jmp    297e3 <JS_CallInternal+0x47d3>
   2d8ef:	4d 89 ef             	mov    %r13,%r15
   2d8f2:	48 83 c3 10          	add    $0x10,%rbx
   2d8f6:	e9 45 7e ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2d8fb:	48 8b b5 c0 fe ff ff 	mov    -0x140(%rbp),%rsi
   2d902:	0f b7 d1             	movzwl %cx,%edx
   2d905:	4c 89 e7             	mov    %r12,%rdi
   2d908:	31 c9                	xor    %ecx,%ecx
   2d90a:	e8 11 80 00 00       	call   35920 <JS_ThrowReferenceErrorUninitialized2.isra.0>
   2d90f:	e9 2c 7e ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2d914:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2d918:	48 c7 43 e8 08 00 00 	movq   $0x8,-0x18(%rbx)
   2d91f:	00 
   2d920:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
   2d925:	f2 0f 11 43 e0       	movsd  %xmm0,-0x20(%rbx)
   2d92a:	e9 0b bf ff ff       	jmp    2983a <JS_CallInternal+0x482a>
   2d92f:	83 fa 08             	cmp    $0x8,%edx
   2d932:	0f 84 0f 1c 00 00    	je     2f547 <JS_CallInternal+0xa537>
   2d938:	83 f8 08             	cmp    $0x8,%eax
   2d93b:	0f 85 3a bd ff ff    	jne    2967b <JS_CallInternal+0x466b>
   2d941:	85 d2                	test   %edx,%edx
   2d943:	0f 85 32 bd ff ff    	jne    2967b <JS_CallInternal+0x466b>
   2d949:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2d94d:	f2 0f 2a c7          	cvtsi2sd %edi,%xmm0
   2d951:	66 48 0f 6e c9       	movq   %rcx,%xmm1
   2d956:	f2 0f 5c c1          	subsd  %xmm1,%xmm0
   2d95a:	48 c7 43 e8 08 00 00 	movq   $0x8,-0x18(%rbx)
   2d961:	00 
   2d962:	f2 0f 11 43 e0       	movsd  %xmm0,-0x20(%rbx)
   2d967:	e9 ce be ff ff       	jmp    2983a <JS_CallInternal+0x482a>
   2d96c:	83 fe 08             	cmp    $0x8,%esi
   2d96f:	0f 84 6d 17 00 00    	je     2f0e2 <JS_CallInternal+0xa0d2>
   2d975:	83 f8 08             	cmp    $0x8,%eax
   2d978:	0f 85 fd bc ff ff    	jne    2967b <JS_CallInternal+0x466b>
   2d97e:	85 f6                	test   %esi,%esi
   2d980:	0f 85 f5 bc ff ff    	jne    2967b <JS_CallInternal+0x466b>
   2d986:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2d98a:	f2 0f 2a c9          	cvtsi2sd %ecx,%xmm1
   2d98e:	66 48 0f 6e c2       	movq   %rdx,%xmm0
   2d993:	f2 0f 59 c1          	mulsd  %xmm1,%xmm0
   2d997:	e9 3d ff ff ff       	jmp    2d8d9 <JS_CallInternal+0x88c9>
   2d99c:	4c 89 e7             	mov    %r12,%rdi
   2d99f:	e8 9c 81 00 00       	call   35b40 <__js_poll_interrupts>
   2d9a4:	85 c0                	test   %eax,%eax
   2d9a6:	0f 85 94 7d ff ff    	jne    25740 <JS_CallInternal+0x730>
   2d9ac:	e9 1a b7 ff ff       	jmp    290cb <JS_CallInternal+0x40bb>
   2d9b1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   2d9b8:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2d9bd:	4c 89 fa             	mov    %r15,%rdx
   2d9c0:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2d9c7:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2d9ce:	e8 fd 0a ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2d9d3:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2d9da:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2d9e1:	e9 db d4 ff ff       	jmp    2aec1 <JS_CallInternal+0x5eb1>
   2d9e6:	8b 01                	mov    (%rcx),%eax
   2d9e8:	25 ff ff ff 03       	and    $0x3ffffff,%eax
   2d9ed:	0f 85 1c 91 ff ff    	jne    26b0f <JS_CallInternal+0x1aff>
   2d9f3:	89 fa                	mov    %edi,%edx
   2d9f5:	48 8b bd 20 fe ff ff 	mov    -0x1e0(%rbp),%rdi
   2d9fc:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2da00:	e8 cb af fe ff       	call   189d0 <JS_AtomGetStrRT.constprop.0>
   2da05:	48 8d 35 14 e4 0a 00 	lea    0xae414(%rip),%rsi        # dbe20 <_IO_stdin_used+0x3e20>
   2da0c:	4c 89 e7             	mov    %r12,%rdi
   2da0f:	48 89 c2             	mov    %rax,%rdx
   2da12:	31 c0                	xor    %eax,%eax
   2da14:	e8 87 5e 00 00       	call   338a0 <JS_ThrowTypeError>
   2da19:	4d 8b 4f 08          	mov    0x8(%r15),%r9
   2da1d:	41 83 f9 f6          	cmp    $0xfffffff6,%r9d
   2da21:	0f 87 f4 0b 00 00    	ja     2e61b <JS_CallInternal+0x960b>
   2da27:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2da2e:	48 8b 70 08          	mov    0x8(%rax),%rsi
   2da32:	83 fe f6             	cmp    $0xfffffff6,%esi
   2da35:	0f 87 6e 16 00 00    	ja     2f0a9 <JS_CallInternal+0xa099>
   2da3b:	31 f6                	xor    %esi,%esi
   2da3d:	48 c7 43 e8 06 00 00 	movq   $0x6,-0x18(%rbx)
   2da44:	00 
   2da45:	48 89 73 e0          	mov    %rsi,-0x20(%rbx)
   2da49:	4c 89 fb             	mov    %r15,%rbx
   2da4c:	4d 89 ef             	mov    %r13,%r15
   2da4f:	e9 ec 7c ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2da54:	4d 89 ef             	mov    %r13,%r15
   2da57:	e9 e4 7c ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2da5c:	48 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%rdx
   2da63:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2da68:	4c 89 fe             	mov    %r15,%rsi
   2da6b:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2da71:	e8 5a 0a ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2da76:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2da7c:	e9 45 b1 ff ff       	jmp    28bc6 <JS_CallInternal+0x3bb6>
   2da81:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2da86:	48 89 c2             	mov    %rax,%rdx
   2da89:	48 89 ce             	mov    %rcx,%rsi
   2da8c:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   2da93:	e8 38 0a ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2da98:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   2da9f:	e9 61 b8 ff ff       	jmp    29305 <JS_CallInternal+0x42f5>
   2daa4:	49 8b 44 24 10       	mov    0x10(%r12),%rax
   2daa9:	48 8b 80 f0 04 00 00 	mov    0x4f0(%rax),%rax
   2dab0:	48 85 c0             	test   %rax,%rax
   2dab3:	0f 84 6b 0e 00 00    	je     2e924 <JS_CallInternal+0x9914>
   2dab9:	f6 40 3c 01          	testb  $0x1,0x3c(%rax)
   2dabd:	0f 84 61 0e 00 00    	je     2e924 <JS_CallInternal+0x9914>
   2dac3:	89 ce                	mov    %ecx,%esi
   2dac5:	4c 89 e7             	mov    %r12,%rdi
   2dac8:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2dace:	4d 89 ef             	mov    %r13,%r15
   2dad1:	e8 ea 7d 00 00       	call   358c0 <JS_ThrowReferenceErrorNotDefined>
   2dad6:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2dadc:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2dae2:	0f 8e 58 7c ff ff    	jle    25740 <JS_CallInternal+0x730>
   2dae8:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2daed:	89 ce                	mov    %ecx,%esi
   2daef:	e8 fc d0 fe ff       	call   1abf0 <JS_FreeAtom.part.0.isra.0>
   2daf4:	e9 47 7c ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2daf9:	4d 89 ef             	mov    %r13,%r15
   2dafc:	e9 3f 7c ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2db01:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2db06:	48 89 c2             	mov    %rax,%rdx
   2db09:	48 89 ce             	mov    %rcx,%rsi
   2db0c:	e8 bf 09 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2db11:	e9 30 b8 ff ff       	jmp    29346 <JS_CallInternal+0x4336>
   2db16:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2db1b:	48 89 c2             	mov    %rax,%rdx
   2db1e:	48 89 ce             	mov    %rcx,%rsi
   2db21:	4c 89 9d 30 fe ff ff 	mov    %r11,-0x1d0(%rbp)
   2db28:	e8 a3 09 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2db2d:	4c 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%r11
   2db34:	e9 07 b9 ff ff       	jmp    29440 <JS_CallInternal+0x4430>
   2db39:	c7 85 dc fe ff ff ff 	movl   $0xffffffff,-0x124(%rbp)
   2db40:	ff ff ff 
   2db43:	49 8b 72 08          	mov    0x8(%r10),%rsi
   2db47:	83 fe f6             	cmp    $0xfffffff6,%esi
   2db4a:	0f 87 fa 0d 00 00    	ja     2e94a <JS_CallInternal+0x993a>
   2db50:	49 c7 02 00 00 00 00 	movq   $0x0,(%r10)
   2db57:	49 c7 42 08 03 00 00 	movq   $0x3,0x8(%r10)
   2db5e:	00 
   2db5f:	e9 dc 7b ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2db64:	ba 01 00 00 00       	mov    $0x1,%edx
   2db69:	be 03 00 00 00       	mov    $0x3,%esi
   2db6e:	31 ff                	xor    %edi,%edi
   2db70:	e9 a4 c0 ff ff       	jmp    29c19 <JS_CallInternal+0x4c09>
   2db75:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2db7c:	44 89 d2             	mov    %r10d,%edx
   2db7f:	48 89 de             	mov    %rbx,%rsi
   2db82:	4c 89 e7             	mov    %r12,%rdi
   2db85:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2db89:	e8 22 49 02 00       	call   524b0 <js_binary_logic_slow>
   2db8e:	85 c0                	test   %eax,%eax
   2db90:	0f 85 64 1b 00 00    	jne    2f6fa <JS_CallInternal+0xa6ea>
   2db96:	48 83 eb 10          	sub    $0x10,%rbx
   2db9a:	e9 de c1 ff ff       	jmp    29d7d <JS_CallInternal+0x4d6d>
   2db9f:	48 8d 15 17 a9 0a 00 	lea    0xaa917(%rip),%rdx        # d84bd <_IO_stdin_used+0x4bd>
   2dba6:	85 c9                	test   %ecx,%ecx
   2dba8:	0f 85 b1 10 00 00    	jne    2ec5f <JS_CallInternal+0x9c4f>
   2dbae:	48 8d 35 64 a9 0a 00 	lea    0xaa964(%rip),%rsi        # d8519 <_IO_stdin_used+0x519>
   2dbb5:	4c 89 e7             	mov    %r12,%rdi
   2dbb8:	31 c0                	xor    %eax,%eax
   2dbba:	e8 c1 7b 00 00       	call   35780 <JS_ThrowReferenceError>
   2dbbf:	e9 7c 7b ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2dbc4:	41 8b 4a 14          	mov    0x14(%r10),%ecx
   2dbc8:	e9 fa dd ff ff       	jmp    2b9c7 <JS_CallInternal+0x69b7>
   2dbcd:	48 83 c3 10          	add    $0x10,%rbx
   2dbd1:	e9 6a 7b ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2dbd6:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2dbdb:	4c 89 fa             	mov    %r15,%rdx
   2dbde:	48 89 ce             	mov    %rcx,%rsi
   2dbe1:	44 89 85 30 fe ff ff 	mov    %r8d,-0x1d0(%rbp)
   2dbe8:	e8 e3 08 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2dbed:	44 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8d
   2dbf4:	e9 68 b3 ff ff       	jmp    28f61 <JS_CallInternal+0x3f51>
   2dbf9:	4d 89 ef             	mov    %r13,%r15
   2dbfc:	e9 3f 7b ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2dc01:	4d 89 ef             	mov    %r13,%r15
   2dc04:	e9 37 7b ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2dc09:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2dc0e:	48 89 c2             	mov    %rax,%rdx
   2dc11:	48 89 ce             	mov    %rcx,%rsi
   2dc14:	4c 89 9d f0 fd ff ff 	mov    %r11,-0x210(%rbp)
   2dc1b:	e8 b0 08 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2dc20:	4c 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%r11
   2dc27:	e9 36 c3 ff ff       	jmp    29f62 <JS_CallInternal+0x4f52>
   2dc2c:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2dc33:	44 89 d2             	mov    %r10d,%edx
   2dc36:	48 89 de             	mov    %rbx,%rsi
   2dc39:	4c 89 e7             	mov    %r12,%rdi
   2dc3c:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2dc40:	e8 6b 48 02 00       	call   524b0 <js_binary_logic_slow>
   2dc45:	85 c0                	test   %eax,%eax
   2dc47:	0f 85 9a 1a 00 00    	jne    2f6e7 <JS_CallInternal+0xa6d7>
   2dc4d:	48 83 eb 10          	sub    $0x10,%rbx
   2dc51:	e9 7b c4 ff ff       	jmp    2a0d1 <JS_CallInternal+0x50c1>
   2dc56:	4d 89 ef             	mov    %r13,%r15
   2dc59:	e9 e2 7a ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2dc5e:	83 fe 08             	cmp    $0x8,%esi
   2dc61:	0f 84 ee 10 00 00    	je     2ed55 <JS_CallInternal+0x9d45>
   2dc67:	83 f9 08             	cmp    $0x8,%ecx
   2dc6a:	75 08                	jne    2dc74 <JS_CallInternal+0x8c64>
   2dc6c:	85 f6                	test   %esi,%esi
   2dc6e:	0f 84 19 11 00 00    	je     2ed8d <JS_CallInternal+0x9d7d>
   2dc74:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2dc7b:	44 89 d2             	mov    %r10d,%edx
   2dc7e:	48 89 de             	mov    %rbx,%rsi
   2dc81:	4c 89 e7             	mov    %r12,%rdi
   2dc84:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2dc88:	e8 23 e5 02 00       	call   5c1b0 <js_relational_slow>
   2dc8d:	85 c0                	test   %eax,%eax
   2dc8f:	0f 85 12 1a 00 00    	jne    2f6a7 <JS_CallInternal+0xa697>
   2dc95:	48 83 eb 10          	sub    $0x10,%rbx
   2dc99:	e9 a2 c0 ff ff       	jmp    29d40 <JS_CallInternal+0x4d30>
   2dc9e:	83 f9 08             	cmp    $0x8,%ecx
   2dca1:	0f 84 3b 12 00 00    	je     2eee2 <JS_CallInternal+0x9ed2>
   2dca7:	83 f9 ff             	cmp    $0xffffffff,%ecx
   2dcaa:	0f 84 f8 11 00 00    	je     2eea8 <JS_CallInternal+0x9e98>
   2dcb0:	8d 41 fe             	lea    -0x2(%rcx),%eax
   2dcb3:	83 f8 01             	cmp    $0x1,%eax
   2dcb6:	0f 86 f3 19 00 00    	jbe    2f6af <JS_CallInternal+0xa69f>
   2dcbc:	83 f9 f9             	cmp    $0xfffffff9,%ecx
   2dcbf:	0f 85 7d 11 00 00    	jne    2ee42 <JS_CallInternal+0x9e32>
   2dcc5:	41 83 ff f9          	cmp    $0xfffffff9,%r15d
   2dcc9:	0f 85 73 11 00 00    	jne    2ee42 <JS_CallInternal+0x9e32>
   2dccf:	4c 89 d6             	mov    %r10,%rsi
   2dcd2:	48 89 d7             	mov    %rdx,%rdi
   2dcd5:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   2dcdc:	48 89 8d f0 fd ff ff 	mov    %rcx,-0x210(%rbp)
   2dce3:	48 89 95 10 fe ff ff 	mov    %rdx,-0x1f0(%rbp)
   2dcea:	e8 01 b7 fe ff       	call   193f0 <js_string_eq.isra.0>
   2dcef:	48 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%rdx
   2dcf6:	48 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%rcx
   2dcfd:	4c 89 e7             	mov    %r12,%rdi
   2dd00:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2dd06:	48 89 d6             	mov    %rdx,%rsi
   2dd09:	48 89 ca             	mov    %rcx,%rdx
   2dd0c:	e8 3f 09 ff ff       	call   1e650 <JS_FreeValue>
   2dd11:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   2dd18:	4d 89 fb             	mov    %r15,%r11
   2dd1b:	4c 89 d6             	mov    %r10,%rsi
   2dd1e:	4c 89 da             	mov    %r11,%rdx
   2dd21:	4c 89 e7             	mov    %r12,%rdi
   2dd24:	e8 27 09 ff ff       	call   1e650 <JS_FreeValue>
   2dd29:	8b 85 30 fe ff ff    	mov    -0x1d0(%rbp),%eax
   2dd2f:	83 f0 01             	xor    $0x1,%eax
   2dd32:	48 98                	cltq
   2dd34:	e9 7f b2 ff ff       	jmp    28fb8 <JS_CallInternal+0x3fa8>
   2dd39:	4d 89 ef             	mov    %r13,%r15
   2dd3c:	e9 ff 79 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2dd41:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2dd46:	48 89 95 10 fe ff ff 	mov    %rdx,-0x1f0(%rbp)
   2dd4d:	4c 89 fa             	mov    %r15,%rdx
   2dd50:	4c 89 85 30 fe ff ff 	mov    %r8,-0x1d0(%rbp)
   2dd57:	e8 74 07 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2dd5c:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   2dd63:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2dd6a:	e9 4d a9 ff ff       	jmp    286bc <JS_CallInternal+0x36ac>
   2dd6f:	48 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%rdx
   2dd76:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2dd7b:	48 89 ce             	mov    %rcx,%rsi
   2dd7e:	44 89 85 f0 fd ff ff 	mov    %r8d,-0x210(%rbp)
   2dd85:	e8 46 07 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2dd8a:	44 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8d
   2dd91:	e9 a7 b1 ff ff       	jmp    28f3d <JS_CallInternal+0x3f2d>
   2dd96:	83 fa 08             	cmp    $0x8,%edx
   2dd99:	0f 84 1f 14 00 00    	je     2f1be <JS_CallInternal+0xa1ae>
   2dd9f:	83 fa ff             	cmp    $0xffffffff,%edx
   2dda2:	0f 84 c9 13 00 00    	je     2f171 <JS_CallInternal+0xa161>
   2dda8:	8d 42 fe             	lea    -0x2(%rdx),%eax
   2ddab:	83 f8 01             	cmp    $0x1,%eax
   2ddae:	0f 86 b8 19 00 00    	jbe    2f76c <JS_CallInternal+0xa75c>
   2ddb4:	83 fa f9             	cmp    $0xfffffff9,%edx
   2ddb7:	0f 85 48 13 00 00    	jne    2f105 <JS_CallInternal+0xa0f5>
   2ddbd:	41 83 f8 f9          	cmp    $0xfffffff9,%r8d
   2ddc1:	0f 85 3e 13 00 00    	jne    2f105 <JS_CallInternal+0xa0f5>
   2ddc7:	4c 89 d6             	mov    %r10,%rsi
   2ddca:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   2ddd1:	4c 89 85 f0 fd ff ff 	mov    %r8,-0x210(%rbp)
   2ddd8:	48 89 95 00 fe ff ff 	mov    %rdx,-0x200(%rbp)
   2dddf:	48 89 bd 30 fe ff ff 	mov    %rdi,-0x1d0(%rbp)
   2dde6:	e8 05 b6 fe ff       	call   193f0 <js_string_eq.isra.0>
   2ddeb:	48 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%rdx
   2ddf2:	4c 89 e7             	mov    %r12,%rdi
   2ddf5:	4c 63 f8             	movslq %eax,%r15
   2ddf8:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2ddff:	48 89 c6             	mov    %rax,%rsi
   2de02:	e8 49 08 ff ff       	call   1e650 <JS_FreeValue>
   2de07:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   2de0e:	4c 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%r11
   2de15:	4c 89 e7             	mov    %r12,%rdi
   2de18:	4c 89 d6             	mov    %r10,%rsi
   2de1b:	4c 89 da             	mov    %r11,%rdx
   2de1e:	e8 2d 08 ff ff       	call   1e650 <JS_FreeValue>
   2de23:	e9 e1 b1 ff ff       	jmp    29009 <JS_CallInternal+0x3ff9>
   2de28:	48 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%rdx
   2de2f:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2de34:	89 8d f0 fd ff ff    	mov    %ecx,-0x210(%rbp)
   2de3a:	e8 91 06 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2de3f:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   2de45:	e9 60 ad ff ff       	jmp    28baa <JS_CallInternal+0x3b9a>
   2de4a:	4d 89 ef             	mov    %r13,%r15
   2de4d:	e9 ee 78 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2de52:	48 8d 35 3c a7 0a 00 	lea    0xaa73c(%rip),%rsi        # d8595 <_IO_stdin_used+0x595>
   2de59:	4c 89 e7             	mov    %r12,%rdi
   2de5c:	31 c0                	xor    %eax,%eax
   2de5e:	4d 89 ef             	mov    %r13,%r15
   2de61:	e8 3a 5a 00 00       	call   338a0 <JS_ThrowTypeError>
   2de66:	e9 97 8a ff ff       	jmp    26902 <JS_CallInternal+0x18f2>
   2de6b:	48 8d 35 15 a7 0a 00 	lea    0xaa715(%rip),%rsi        # d8587 <_IO_stdin_used+0x587>
   2de72:	4c 89 e7             	mov    %r12,%rdi
   2de75:	31 c0                	xor    %eax,%eax
   2de77:	4d 89 ef             	mov    %r13,%r15
   2de7a:	e8 21 5a 00 00       	call   338a0 <JS_ThrowTypeError>
   2de7f:	e9 7e 8a ff ff       	jmp    26902 <JS_CallInternal+0x18f2>
   2de84:	48 8d 35 0a a7 0a 00 	lea    0xaa70a(%rip),%rsi        # d8595 <_IO_stdin_used+0x595>
   2de8b:	4c 89 e7             	mov    %r12,%rdi
   2de8e:	31 c0                	xor    %eax,%eax
   2de90:	e8 0b 5a 00 00       	call   338a0 <JS_ThrowTypeError>
   2de95:	4d 8b 4f 08          	mov    0x8(%r15),%r9
   2de99:	48 89 c1             	mov    %rax,%rcx
   2de9c:	48 89 d0             	mov    %rdx,%rax
   2de9f:	49 8b 17             	mov    (%r15),%rdx
   2dea2:	41 89 c0             	mov    %eax,%r8d
   2dea5:	e9 94 8c ff ff       	jmp    26b3e <JS_CallInternal+0x1b2e>
   2deaa:	48 8d 35 d6 a6 0a 00 	lea    0xaa6d6(%rip),%rsi        # d8587 <_IO_stdin_used+0x587>
   2deb1:	4c 89 e7             	mov    %r12,%rdi
   2deb4:	31 c0                	xor    %eax,%eax
   2deb6:	e8 e5 59 00 00       	call   338a0 <JS_ThrowTypeError>
   2debb:	4d 8b 4f 08          	mov    0x8(%r15),%r9
   2debf:	48 89 c1             	mov    %rax,%rcx
   2dec2:	48 89 d0             	mov    %rdx,%rax
   2dec5:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2dec9:	41 89 c0             	mov    %eax,%r8d
   2decc:	e9 6d 8c ff ff       	jmp    26b3e <JS_CallInternal+0x1b2e>
   2ded1:	48 8b bd f0 fd ff ff 	mov    -0x210(%rbp),%rdi
   2ded8:	48 89 ce             	mov    %rcx,%rsi
   2dedb:	e8 f0 05 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2dee0:	e9 5d 8b ff ff       	jmp    26a42 <JS_CallInternal+0x1a32>
   2dee5:	48 8d 35 a9 a6 0a 00 	lea    0xaa6a9(%rip),%rsi        # d8595 <_IO_stdin_used+0x595>
   2deec:	4c 89 e7             	mov    %r12,%rdi
   2deef:	31 c0                	xor    %eax,%eax
   2def1:	e8 aa 59 00 00       	call   338a0 <JS_ThrowTypeError>
   2def6:	83 bd 10 fe ff ff f6 	cmpl   $0xfffffff6,-0x1f0(%rbp)
   2defd:	76 1e                	jbe    2df1d <JS_CallInternal+0x8f0d>
   2deff:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2df06:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2df09:	89 85 00 fe ff ff    	mov    %eax,-0x200(%rbp)
   2df0f:	83 e8 01             	sub    $0x1,%eax
   2df12:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2df15:	85 c0                	test   %eax,%eax
   2df17:	0f 8e 9f 13 00 00    	jle    2f2bc <JS_CallInternal+0xa2ac>
   2df1d:	48 8b 43 08          	mov    0x8(%rbx),%rax
   2df21:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2df24:	76 1e                	jbe    2df44 <JS_CallInternal+0x8f34>
   2df26:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
   2df2c:	e9 36 df ff ff       	jmp    2be67 <JS_CallInternal+0x6e57>
   2df31:	48 8d 35 4f a6 0a 00 	lea    0xaa64f(%rip),%rsi        # d8587 <_IO_stdin_used+0x587>
   2df38:	4c 89 e7             	mov    %r12,%rdi
   2df3b:	31 c0                	xor    %eax,%eax
   2df3d:	e8 5e 59 00 00       	call   338a0 <JS_ThrowTypeError>
   2df42:	eb b2                	jmp    2def6 <JS_CallInternal+0x8ee6>
   2df44:	49 8b 47 08          	mov    0x8(%r15),%rax
   2df48:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2df4b:	0f 86 51 df ff ff    	jbe    2bea2 <JS_CallInternal+0x6e92>
   2df51:	49 8b 17             	mov    (%r15),%rdx
   2df54:	4d 89 ef             	mov    %r13,%r15
   2df57:	8b 4a fc             	mov    -0x4(%rdx),%ecx
   2df5a:	83 e9 01             	sub    $0x1,%ecx
   2df5d:	89 4a fc             	mov    %ecx,-0x4(%rdx)
   2df60:	85 c9                	test   %ecx,%ecx
   2df62:	0f 8f d8 77 ff ff    	jg     25740 <JS_CallInternal+0x730>
   2df68:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
   2df6e:	e9 1a ee ff ff       	jmp    2cd8d <JS_CallInternal+0x7d7d>
   2df73:	4c 89 e7             	mov    %r12,%rdi
   2df76:	e8 c5 7b 00 00       	call   35b40 <__js_poll_interrupts>
   2df7b:	85 c0                	test   %eax,%eax
   2df7d:	0f 85 bd 77 ff ff    	jne    25740 <JS_CallInternal+0x730>
   2df83:	e9 69 c8 ff ff       	jmp    2a7f1 <JS_CallInternal+0x57e1>
   2df88:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   2df8f:	00 
   2df90:	48 8b 85 c0 fe ff ff 	mov    -0x140(%rbp),%rax
   2df97:	48 8b 40 30          	mov    0x30(%rax),%rax
   2df9b:	8b 44 d0 04          	mov    0x4(%rax,%rdx,8),%eax
   2df9f:	48 8d 15 17 a5 0a 00 	lea    0xaa517(%rip),%rdx        # d84bd <_IO_stdin_used+0x4bd>
   2dfa6:	85 c0                	test   %eax,%eax
   2dfa8:	0f 85 61 12 00 00    	jne    2f20f <JS_CallInternal+0xa1ff>
   2dfae:	48 8d 35 64 a5 0a 00 	lea    0xaa564(%rip),%rsi        # d8519 <_IO_stdin_used+0x519>
   2dfb5:	4c 89 e7             	mov    %r12,%rdi
   2dfb8:	31 c0                	xor    %eax,%eax
   2dfba:	e8 c1 77 00 00       	call   35780 <JS_ThrowReferenceError>
   2dfbf:	e9 7c 77 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2dfc4:	48 8b 85 c0 fe ff ff 	mov    -0x140(%rbp),%rax
   2dfcb:	48 8d 15 eb a4 0a 00 	lea    0xaa4eb(%rip),%rdx        # d84bd <_IO_stdin_used+0x4bd>
   2dfd2:	48 8b 40 30          	mov    0x30(%rax),%rax
   2dfd6:	8b 44 c8 04          	mov    0x4(%rax,%rcx,8),%eax
   2dfda:	85 c0                	test   %eax,%eax
   2dfdc:	0f 85 bb 0f 00 00    	jne    2ef9d <JS_CallInternal+0x9f8d>
   2dfe2:	48 8d 35 30 a5 0a 00 	lea    0xaa530(%rip),%rsi        # d8519 <_IO_stdin_used+0x519>
   2dfe9:	4c 89 e7             	mov    %r12,%rdi
   2dfec:	31 c0                	xor    %eax,%eax
   2dfee:	e8 8d 77 00 00       	call   35780 <JS_ThrowReferenceError>
   2dff3:	e9 48 77 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2dff8:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2dffd:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2e001:	89 c2                	mov    %eax,%edx
   2e003:	4d 89 ef             	mov    %r13,%r15
   2e006:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2e00c:	e8 bf a9 fe ff       	call   189d0 <JS_AtomGetStrRT.constprop.0>
   2e011:	48 8d 35 aa a5 0a 00 	lea    0xaa5aa(%rip),%rsi        # d85c2 <_IO_stdin_used+0x5c2>
   2e018:	4c 89 e7             	mov    %r12,%rdi
   2e01b:	48 89 c2             	mov    %rax,%rdx
   2e01e:	31 c0                	xor    %eax,%eax
   2e020:	e8 5b 77 00 00       	call   35780 <JS_ThrowReferenceError>
   2e025:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2e02b:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2e031:	0f 8e 09 77 ff ff    	jle    25740 <JS_CallInternal+0x730>
   2e037:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e03c:	89 ce                	mov    %ecx,%esi
   2e03e:	e8 ad cb fe ff       	call   1abf0 <JS_FreeAtom.part.0.isra.0>
   2e043:	e9 f8 76 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2e048:	48 8b b5 c0 fe ff ff 	mov    -0x140(%rbp),%rsi
   2e04f:	0f b7 d1             	movzwl %cx,%edx
   2e052:	4c 89 e7             	mov    %r12,%rdi
   2e055:	31 c9                	xor    %ecx,%ecx
   2e057:	e8 c4 78 00 00       	call   35920 <JS_ThrowReferenceErrorUninitialized2.isra.0>
   2e05c:	e9 df 76 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2e061:	48 8b b5 c0 fe ff ff 	mov    -0x140(%rbp),%rsi
   2e068:	48 8b bd 90 fe ff ff 	mov    -0x170(%rbp),%rdi
   2e06f:	0f b7 d1             	movzwl %cx,%edx
   2e072:	31 c9                	xor    %ecx,%ecx
   2e074:	e8 a7 78 00 00       	call   35920 <JS_ThrowReferenceErrorUninitialized2.isra.0>
   2e079:	e9 c2 76 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2e07e:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2e085:	44 89 d2             	mov    %r10d,%edx
   2e088:	48 89 de             	mov    %rbx,%rsi
   2e08b:	4c 89 e7             	mov    %r12,%rdi
   2e08e:	4c 89 68 30          	mov    %r13,0x30(%rax)
   2e092:	e8 19 44 02 00       	call   524b0 <js_binary_logic_slow>
   2e097:	85 c0                	test   %eax,%eax
   2e099:	0f 85 36 16 00 00    	jne    2f6d5 <JS_CallInternal+0xa6c5>
   2e09f:	48 83 eb 10          	sub    $0x10,%rbx
   2e0a3:	e9 35 b5 ff ff       	jmp    295dd <JS_CallInternal+0x45cd>
   2e0a8:	48 8d 35 29 dd 0a 00 	lea    0xadd29(%rip),%rsi        # dbdd8 <_IO_stdin_used+0x3dd8>
   2e0af:	4c 89 e7             	mov    %r12,%rdi
   2e0b2:	31 c0                	xor    %eax,%eax
   2e0b4:	e8 c7 76 00 00       	call   35780 <JS_ThrowReferenceError>
   2e0b9:	e9 82 76 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2e0be:	4c 89 e7             	mov    %r12,%rdi
   2e0c1:	e8 7a 7a 00 00       	call   35b40 <__js_poll_interrupts>
   2e0c6:	85 c0                	test   %eax,%eax
   2e0c8:	0f 85 72 76 ff ff    	jne    25740 <JS_CallInternal+0x730>
   2e0ce:	e9 c7 c6 ff ff       	jmp    2a79a <JS_CallInternal+0x578a>
   2e0d3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2e0d8:	4c 89 e7             	mov    %r12,%rdi
   2e0db:	e8 60 7a 00 00       	call   35b40 <__js_poll_interrupts>
   2e0e0:	85 c0                	test   %eax,%eax
   2e0e2:	0f 85 58 76 ff ff    	jne    25740 <JS_CallInternal+0x730>
   2e0e8:	e9 52 c1 ff ff       	jmp    2a23f <JS_CallInternal+0x522f>
   2e0ed:	0f 1f 00             	nopl   (%rax)
   2e0f0:	48 8b b5 c0 fe ff ff 	mov    -0x140(%rbp),%rsi
   2e0f7:	0f b7 d1             	movzwl %cx,%edx
   2e0fa:	4c 89 e7             	mov    %r12,%rdi
   2e0fd:	31 c9                	xor    %ecx,%ecx
   2e0ff:	e8 1c 78 00 00       	call   35920 <JS_ThrowReferenceErrorUninitialized2.isra.0>
   2e104:	e9 37 76 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2e109:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e10e:	48 89 c2             	mov    %rax,%rdx
   2e111:	48 89 ce             	mov    %rcx,%rsi
   2e114:	e8 b7 03 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2e119:	e9 d4 d4 ff ff       	jmp    2b5f2 <JS_CallInternal+0x65e2>
   2e11e:	4d 89 ef             	mov    %r13,%r15
   2e121:	e9 1a 76 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2e126:	41 8b 49 14          	mov    0x14(%r9),%ecx
   2e12a:	e9 47 d8 ff ff       	jmp    2b976 <JS_CallInternal+0x6966>
   2e12f:	48 83 c3 10          	add    $0x10,%rbx
   2e133:	e9 08 76 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2e138:	0f 85 dd 14 00 00    	jne    2f61b <JS_CallInternal+0xa60b>
   2e13e:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e143:	48 8b 87 f0 04 00 00 	mov    0x4f0(%rdi),%rax
   2e14a:	48 85 c0             	test   %rax,%rax
   2e14d:	0f 84 2d 07 00 00    	je     2e880 <JS_CallInternal+0x9870>
   2e153:	f6 40 3c 01          	testb  $0x1,0x3c(%rax)
   2e157:	0f 84 23 07 00 00    	je     2e880 <JS_CallInternal+0x9870>
   2e15d:	89 ce                	mov    %ecx,%esi
   2e15f:	4c 89 e7             	mov    %r12,%rdi
   2e162:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2e168:	4d 89 ef             	mov    %r13,%r15
   2e16b:	e8 50 77 00 00       	call   358c0 <JS_ThrowReferenceErrorNotDefined>
   2e170:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2e176:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2e17c:	0f 8e be 75 ff ff    	jle    25740 <JS_CallInternal+0x730>
   2e182:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e187:	89 ce                	mov    %ecx,%esi
   2e189:	e8 62 ca fe ff       	call   1abf0 <JS_FreeAtom.part.0.isra.0>
   2e18e:	e9 ad 75 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2e193:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2e198:	83 fa 08             	cmp    $0x8,%edx
   2e19b:	0f 84 8b 0b 00 00    	je     2ed2c <JS_CallInternal+0x9d1c>
   2e1a1:	83 fa ff             	cmp    $0xffffffff,%edx
   2e1a4:	0f 84 3e 0b 00 00    	je     2ece8 <JS_CallInternal+0x9cd8>
   2e1aa:	8d 42 fe             	lea    -0x2(%rdx),%eax
   2e1ad:	83 f8 01             	cmp    $0x1,%eax
   2e1b0:	0f 86 08 0b 00 00    	jbe    2ecbe <JS_CallInternal+0x9cae>
   2e1b6:	83 fa f9             	cmp    $0xfffffff9,%edx
   2e1b9:	0f 85 aa e5 ff ff    	jne    2c769 <JS_CallInternal+0x7759>
   2e1bf:	41 83 ff f9          	cmp    $0xfffffff9,%r15d
   2e1c3:	0f 85 a0 e5 ff ff    	jne    2c769 <JS_CallInternal+0x7759>
   2e1c9:	4c 89 c6             	mov    %r8,%rsi
   2e1cc:	4c 89 85 00 fe ff ff 	mov    %r8,-0x200(%rbp)
   2e1d3:	48 89 bd 10 fe ff ff 	mov    %rdi,-0x1f0(%rbp)
   2e1da:	48 89 95 f0 fd ff ff 	mov    %rdx,-0x210(%rbp)
   2e1e1:	e8 0a b2 fe ff       	call   193f0 <js_string_eq.isra.0>
   2e1e6:	48 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%rdx
   2e1ed:	4c 89 e7             	mov    %r12,%rdi
   2e1f0:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2e1f6:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2e1fd:	48 89 c6             	mov    %rax,%rsi
   2e200:	e8 4b 04 ff ff       	call   1e650 <JS_FreeValue>
   2e205:	4c 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%r8
   2e20c:	4c 89 c6             	mov    %r8,%rsi
   2e20f:	4c 89 fa             	mov    %r15,%rdx
   2e212:	4c 89 e7             	mov    %r12,%rdi
   2e215:	e8 36 04 ff ff       	call   1e650 <JS_FreeValue>
   2e21a:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2e220:	e9 20 b3 ff ff       	jmp    29545 <JS_CallInternal+0x4535>
   2e225:	83 fa 08             	cmp    $0x8,%edx
   2e228:	0f 84 35 0e 00 00    	je     2f063 <JS_CallInternal+0xa053>
   2e22e:	83 fa ff             	cmp    $0xffffffff,%edx
   2e231:	0f 84 d2 0d 00 00    	je     2f009 <JS_CallInternal+0x9ff9>
   2e237:	8d 42 fe             	lea    -0x2(%rdx),%eax
   2e23a:	83 f8 01             	cmp    $0x1,%eax
   2e23d:	0f 86 95 0d 00 00    	jbe    2efd8 <JS_CallInternal+0x9fc8>
   2e243:	83 fa f9             	cmp    $0xfffffff9,%edx
   2e246:	0f 85 f3 e5 ff ff    	jne    2c83f <JS_CallInternal+0x782f>
   2e24c:	83 f9 f9             	cmp    $0xfffffff9,%ecx
   2e24f:	0f 85 ea e5 ff ff    	jne    2c83f <JS_CallInternal+0x782f>
   2e255:	4c 89 c6             	mov    %r8,%rsi
   2e258:	4c 89 85 10 fe ff ff 	mov    %r8,-0x1f0(%rbp)
   2e25f:	48 89 bd 30 fe ff ff 	mov    %rdi,-0x1d0(%rbp)
   2e266:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2e26d:	48 89 95 f0 fd ff ff 	mov    %rdx,-0x210(%rbp)
   2e274:	e8 77 b1 fe ff       	call   193f0 <js_string_eq.isra.0>
   2e279:	48 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%rdx
   2e280:	4c 89 e7             	mov    %r12,%rdi
   2e283:	41 89 c7             	mov    %eax,%r15d
   2e286:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2e28d:	48 89 c6             	mov    %rax,%rsi
   2e290:	e8 bb 03 ff ff       	call   1e650 <JS_FreeValue>
   2e295:	4c 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%r8
   2e29c:	4c 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%r9
   2e2a3:	4c 89 e7             	mov    %r12,%rdi
   2e2a6:	4c 89 c6             	mov    %r8,%rsi
   2e2a9:	4c 89 ca             	mov    %r9,%rdx
   2e2ac:	e8 9f 03 ff ff       	call   1e650 <JS_FreeValue>
   2e2b1:	e9 a3 ad ff ff       	jmp    29059 <JS_CallInternal+0x4049>
   2e2b6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   2e2bd:	00 00 00 
   2e2c0:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e2c5:	48 89 c2             	mov    %rax,%rdx
   2e2c8:	48 89 ce             	mov    %rcx,%rsi
   2e2cb:	e8 00 02 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2e2d0:	e9 d4 d4 ff ff       	jmp    2b7a9 <JS_CallInternal+0x6799>
   2e2d5:	4c 89 e7             	mov    %r12,%rdi
   2e2d8:	e8 63 78 00 00       	call   35b40 <__js_poll_interrupts>
   2e2dd:	85 c0                	test   %eax,%eax
   2e2df:	0f 85 5b 74 ff ff    	jne    25740 <JS_CallInternal+0x730>
   2e2e5:	e9 39 ae ff ff       	jmp    29123 <JS_CallInternal+0x4113>
   2e2ea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   2e2f0:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e2f5:	48 89 c2             	mov    %rax,%rdx
   2e2f8:	48 89 ce             	mov    %rcx,%rsi
   2e2fb:	4c 89 9d 30 fe ff ff 	mov    %r11,-0x1d0(%rbp)
   2e302:	e8 c9 01 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2e307:	4c 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%r11
   2e30e:	e9 4a b1 ff ff       	jmp    2945d <JS_CallInternal+0x444d>
   2e313:	48 8b 85 c0 fe ff ff 	mov    -0x140(%rbp),%rax
   2e31a:	48 8d 15 9c a1 0a 00 	lea    0xaa19c(%rip),%rdx        # d84bd <_IO_stdin_used+0x4bd>
   2e321:	48 8b 40 30          	mov    0x30(%rax),%rax
   2e325:	8b 44 c8 04          	mov    0x4(%rax,%rcx,8),%eax
   2e329:	85 c0                	test   %eax,%eax
   2e32b:	0f 85 c6 10 00 00    	jne    2f3f7 <JS_CallInternal+0xa3e7>
   2e331:	48 8d 35 e1 a1 0a 00 	lea    0xaa1e1(%rip),%rsi        # d8519 <_IO_stdin_used+0x519>
   2e338:	4c 89 e7             	mov    %r12,%rdi
   2e33b:	31 c0                	xor    %eax,%eax
   2e33d:	e8 3e 74 00 00       	call   35780 <JS_ThrowReferenceError>
   2e342:	e9 f9 73 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2e347:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e34c:	48 89 c2             	mov    %rax,%rdx
   2e34f:	48 89 ce             	mov    %rcx,%rsi
   2e352:	e8 79 01 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2e357:	e9 c6 af ff ff       	jmp    29322 <JS_CallInternal+0x4312>
   2e35c:	41 83 ff fa          	cmp    $0xfffffffa,%r15d
   2e360:	0f 8d 57 e3 ff ff    	jge    2c6bd <JS_CallInternal+0x76ad>
   2e366:	41 83 ff f8          	cmp    $0xfffffff8,%r15d
   2e36a:	0f 8c 4d e3 ff ff    	jl     2c6bd <JS_CallInternal+0x76ad>
   2e370:	e9 ab e3 ff ff       	jmp    2c720 <JS_CallInternal+0x7710>
   2e375:	0f 1f 00             	nopl   (%rax)
   2e378:	4d 89 ef             	mov    %r13,%r15
   2e37b:	e9 c0 73 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2e380:	4d 89 ef             	mov    %r13,%r15
   2e383:	e9 7a 85 ff ff       	jmp    26902 <JS_CallInternal+0x18f2>
   2e388:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e38d:	48 89 ce             	mov    %rcx,%rsi
   2e390:	e8 3b 01 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2e395:	e9 b7 ba ff ff       	jmp    29e51 <JS_CallInternal+0x4e41>
   2e39a:	39 c1                	cmp    %eax,%ecx
   2e39c:	0f 85 ea dc ff ff    	jne    2c08c <JS_CallInternal+0x707c>
   2e3a2:	0f b6 4a 10          	movzbl 0x10(%rdx),%ecx
   2e3a6:	f7 d1                	not    %ecx
   2e3a8:	83 e1 12             	and    $0x12,%ecx
   2e3ab:	0f 85 db dc ff ff    	jne    2c08c <JS_CallInternal+0x707c>
   2e3b1:	48 8b 7a 18          	mov    0x18(%rdx),%rdi
   2e3b5:	48 8b 4f 30          	mov    0x30(%rdi),%rcx
   2e3b9:	48 85 c9             	test   %rcx,%rcx
   2e3bc:	74 0a                	je     2e3c8 <JS_CallInternal+0x93b8>
   2e3be:	f6 41 10 01          	testb  $0x1,0x10(%rcx)
   2e3c2:	0f 84 c4 dc ff ff    	je     2c08c <JS_CallInternal+0x707c>
   2e3c8:	48 8b 72 20          	mov    0x20(%rdx),%rsi
   2e3cc:	83 7e 08 00          	cmpl   $0x0,0x8(%rsi)
   2e3d0:	0f 85 b6 dc ff ff    	jne    2c08c <JS_CallInternal+0x707c>
   2e3d6:	8d 48 01             	lea    0x1(%rax),%ecx
   2e3d9:	39 4a 28             	cmp    %ecx,0x28(%rdx)
   2e3dc:	0f 82 aa dc ff ff    	jb     2c08c <JS_CallInternal+0x707c>
   2e3e2:	39 0e                	cmp    %ecx,(%rsi)
   2e3e4:	73 1c                	jae    2e402 <JS_CallInternal+0x93f2>
   2e3e6:	44 8b 47 18          	mov    0x18(%rdi),%r8d
   2e3ea:	42 f6 44 87 3f 08    	testb  $0x8,0x3f(%rdi,%r8,4)
   2e3f0:	0f 84 96 dc ff ff    	je     2c08c <JS_CallInternal+0x707c>
   2e3f6:	89 cf                	mov    %ecx,%edi
   2e3f8:	45 31 db             	xor    %r11d,%r11d
   2e3fb:	48 89 3e             	mov    %rdi,(%rsi)
   2e3fe:	4c 89 5e 08          	mov    %r11,0x8(%rsi)
   2e402:	89 4a 38             	mov    %ecx,0x38(%rdx)
   2e405:	89 c0                	mov    %eax,%eax
   2e407:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2e40c:	48 c1 e0 04          	shl    $0x4,%rax
   2e410:	48 03 42 30          	add    0x30(%rdx),%rax
   2e414:	0f 11 00             	movups %xmm0,(%rax)
   2e417:	e9 35 ba ff ff       	jmp    29e51 <JS_CallInternal+0x4e41>
   2e41c:	0f 1f 40 00          	nopl   0x0(%rax)
   2e420:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e425:	48 89 c2             	mov    %rax,%rdx
   2e428:	48 89 ce             	mov    %rcx,%rsi
   2e42b:	e8 a0 00 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2e430:	e9 3d ba ff ff       	jmp    29e72 <JS_CallInternal+0x4e62>
   2e435:	4d 89 ef             	mov    %r13,%r15
   2e438:	4c 89 db             	mov    %r11,%rbx
   2e43b:	e9 00 73 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2e440:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e445:	4c 89 fe             	mov    %r15,%rsi
   2e448:	4c 89 c2             	mov    %r8,%rdx
   2e44b:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2e451:	e8 7a 00 ff ff       	call   1e4d0 <__JS_FreeValueRT>
   2e456:	8b 85 30 fe ff ff    	mov    -0x1d0(%rbp),%eax
   2e45c:	e9 d6 a8 ff ff       	jmp    28d37 <JS_CallInternal+0x3d27>
   2e461:	0f 85 bc 12 00 00    	jne    2f723 <JS_CallInternal+0xa713>
   2e467:	49 8b 44 24 10       	mov    0x10(%r12),%rax
   2e46c:	48 8b 80 f0 04 00 00 	mov    0x4f0(%rax),%rax
   2e473:	48 85 c0             	test   %rax,%rax
   2e476:	0f 84 54 af ff ff    	je     293d0 <JS_CallInternal+0x43c0>
   2e47c:	f6 40 3c 01          	testb  $0x1,0x3c(%rax)
   2e480:	0f 84 4a af ff ff    	je     293d0 <JS_CallInternal+0x43c0>
   2e486:	89 ce                	mov    %ecx,%esi
   2e488:	4c 89 e7             	mov    %r12,%rdi
   2e48b:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2e491:	4d 89 ef             	mov    %r13,%r15
   2e494:	e8 27 74 00 00       	call   358c0 <JS_ThrowReferenceErrorNotDefined>
   2e499:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2e49f:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2e4a5:	0f 8e 95 72 ff ff    	jle    25740 <JS_CallInternal+0x730>
   2e4ab:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e4b0:	89 ce                	mov    %ecx,%esi
   2e4b2:	e8 39 c7 fe ff       	call   1abf0 <JS_FreeAtom.part.0.isra.0>
   2e4b7:	e9 84 72 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2e4bc:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e4c1:	48 89 ce             	mov    %rcx,%rsi
   2e4c4:	4c 89 9d 10 fe ff ff 	mov    %r11,-0x1f0(%rbp)
   2e4cb:	4c 89 95 30 fe ff ff 	mov    %r10,-0x1d0(%rbp)
   2e4d2:	e8 f9 ff fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2e4d7:	4c 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%r11
   2e4de:	4c 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%r10
   2e4e5:	e9 2a cc ff ff       	jmp    2b114 <JS_CallInternal+0x6104>
   2e4ea:	81 fa f2 00 00 00    	cmp    $0xf2,%edx
   2e4f0:	7e 22                	jle    2e514 <JS_CallInternal+0x9504>
   2e4f2:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e4f7:	48 8b 87 48 04 00 00 	mov    0x448(%rdi),%rax
   2e4fe:	48 8b 34 d0          	mov    (%rax,%rdx,8),%rsi
   2e502:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2e505:	83 e8 01             	sub    $0x1,%eax
   2e508:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2e50b:	85 c0                	test   %eax,%eax
   2e50d:	7f 05                	jg     2e514 <JS_CallInternal+0x9504>
   2e50f:	e8 8c 84 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2e514:	48 8d 35 cd d7 0a 00 	lea    0xad7cd(%rip),%rsi        # dbce8 <_IO_stdin_used+0x3ce8>
   2e51b:	4c 89 e7             	mov    %r12,%rdi
   2e51e:	31 c0                	xor    %eax,%eax
   2e520:	e8 7b 53 00 00       	call   338a0 <JS_ThrowTypeError>
   2e525:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   2e52c:	48 c7 43 08 06 00 00 	movq   $0x6,0x8(%rbx)
   2e533:	00 
   2e534:	e9 d7 90 ff ff       	jmp    27610 <JS_CallInternal+0x2600>
   2e539:	4d 89 ef             	mov    %r13,%r15
   2e53c:	e9 ff 71 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2e541:	8b 02                	mov    (%rdx),%eax
   2e543:	25 ff ff ff 03       	and    $0x3ffffff,%eax
   2e548:	0f 85 a6 84 ff ff    	jne    269f4 <JS_CallInternal+0x19e4>
   2e54e:	48 8d 0d ef 9b 0a 00 	lea    0xa9bef(%rip),%rcx        # d8144 <_IO_stdin_used+0x144>
   2e555:	4c 89 e7             	mov    %r12,%rdi
   2e558:	31 c0                	xor    %eax,%eax
   2e55a:	48 8d 15 bf d8 0a 00 	lea    0xad8bf(%rip),%rdx        # dbe20 <_IO_stdin_used+0x3e20>
   2e561:	e8 4a 55 00 00       	call   33ab0 <__JS_ThrowTypeErrorAtom>
   2e566:	e9 8b f9 ff ff       	jmp    2def6 <JS_CallInternal+0x8ee6>
   2e56b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2e570:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e575:	4c 89 d6             	mov    %r10,%rsi
   2e578:	4c 89 da             	mov    %r11,%rdx
   2e57b:	e8 50 ff fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2e580:	e9 a8 cb ff ff       	jmp    2b12d <JS_CallInternal+0x611d>
   2e585:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e58a:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2e58e:	89 ca                	mov    %ecx,%edx
   2e590:	e8 3b a4 fe ff       	call   189d0 <JS_AtomGetStrRT.constprop.0>
   2e595:	48 8d 35 bd 9f 0a 00 	lea    0xa9fbd(%rip),%rsi        # d8559 <_IO_stdin_used+0x559>
   2e59c:	4c 89 e7             	mov    %r12,%rdi
   2e59f:	48 89 c2             	mov    %rax,%rdx
   2e5a2:	31 c0                	xor    %eax,%eax
   2e5a4:	e8 f7 52 00 00       	call   338a0 <JS_ThrowTypeError>
   2e5a9:	e9 92 71 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2e5ae:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   2e5b5:	48 c7 43 08 03 00 00 	movq   $0x3,0x8(%rbx)
   2e5bc:	00 
   2e5bd:	e9 2c c3 ff ff       	jmp    2a8ee <JS_CallInternal+0x58de>
   2e5c2:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e5c7:	4c 89 ca             	mov    %r9,%rdx
   2e5ca:	89 85 10 fe ff ff    	mov    %eax,-0x1f0(%rbp)
   2e5d0:	4c 89 85 30 fe ff ff 	mov    %r8,-0x1d0(%rbp)
   2e5d7:	e8 f4 fe fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2e5dc:	8b 85 10 fe ff ff    	mov    -0x1f0(%rbp),%eax
   2e5e2:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2e5e9:	e9 30 a7 ff ff       	jmp    28d1e <JS_CallInternal+0x3d0e>
   2e5ee:	09 ca                	or     %ecx,%edx
   2e5f0:	0f 89 da b1 ff ff    	jns    297d0 <JS_CallInternal+0x47c0>
   2e5f6:	f2 0f 10 05 c2 74 0b 	movsd  0xb74c2(%rip),%xmm0        # e5ac0 <typed_array_size_log2+0x28>
   2e5fd:	00 
   2e5fe:	e9 d6 f2 ff ff       	jmp    2d8d9 <JS_CallInternal+0x88c9>
   2e603:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e608:	89 f2                	mov    %esi,%edx
   2e60a:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2e60e:	e8 bd a3 fe ff       	call   189d0 <JS_AtomGetStrRT.constprop.0>
   2e613:	48 89 c2             	mov    %rax,%rdx
   2e616:	e9 69 a2 ff ff       	jmp    28884 <JS_CallInternal+0x3874>
   2e61b:	49 8b 17             	mov    (%r15),%rdx
   2e61e:	41 b8 06 00 00 00    	mov    $0x6,%r8d
   2e624:	31 c9                	xor    %ecx,%ecx
   2e626:	b8 06 00 00 00       	mov    $0x6,%eax
   2e62b:	e9 14 85 ff ff       	jmp    26b44 <JS_CallInternal+0x1b34>
   2e630:	8b 09                	mov    (%rcx),%ecx
   2e632:	81 e1 ff ff ff 03    	and    $0x3ffffff,%ecx
   2e638:	0f 85 c4 a7 ff ff    	jne    28e02 <JS_CallInternal+0x3df2>
   2e63e:	31 c9                	xor    %ecx,%ecx
   2e640:	e9 d3 a7 ff ff       	jmp    28e18 <JS_CallInternal+0x3e08>
   2e645:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e64a:	4c 89 d6             	mov    %r10,%rsi
   2e64d:	4c 89 da             	mov    %r11,%rdx
   2e650:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2e656:	e8 75 fe fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2e65b:	8b 85 30 fe ff ff    	mov    -0x1d0(%rbp),%eax
   2e661:	e9 51 dc ff ff       	jmp    2c2b7 <JS_CallInternal+0x72a7>
   2e666:	81 fa f2 00 00 00    	cmp    $0xf2,%edx
   2e66c:	0f 8e a2 fe ff ff    	jle    2e514 <JS_CallInternal+0x9504>
   2e672:	31 c0                	xor    %eax,%eax
   2e674:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e679:	48 8b 8f 48 04 00 00 	mov    0x448(%rdi),%rcx
   2e680:	48 8b 34 d1          	mov    (%rcx,%rdx,8),%rsi
   2e684:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   2e687:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2e68a:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2e68d:	85 d2                	test   %edx,%edx
   2e68f:	7f 13                	jg     2e6a4 <JS_CallInternal+0x9694>
   2e691:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2e698:	e8 03 83 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2e69d:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2e6a4:	48 85 c0             	test   %rax,%rax
   2e6a7:	0f 85 d5 8f ff ff    	jne    27682 <JS_CallInternal+0x2672>
   2e6ad:	e9 62 fe ff ff       	jmp    2e514 <JS_CallInternal+0x9504>
   2e6b2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   2e6b8:	f2 0f 10 05 00 74 0b 	movsd  0xb7400(%rip),%xmm0        # e5ac0 <typed_array_size_log2+0x28>
   2e6bf:	00 
   2e6c0:	e9 fc d4 ff ff       	jmp    2bbc1 <JS_CallInternal+0x6bb1>
   2e6c5:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e6ca:	48 89 c2             	mov    %rax,%rdx
   2e6cd:	48 89 ce             	mov    %rcx,%rsi
   2e6d0:	e8 fb fd fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2e6d5:	e9 23 d5 ff ff       	jmp    2bbfd <JS_CallInternal+0x6bed>
   2e6da:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e6df:	48 89 ca             	mov    %rcx,%rdx
   2e6e2:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2e6e8:	e8 e3 fd fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2e6ed:	8b 85 30 fe ff ff    	mov    -0x1d0(%rbp),%eax
   2e6f3:	e9 67 75 ff ff       	jmp    25c5f <JS_CallInternal+0xc4f>
   2e6f8:	0f 85 42 70 ff ff    	jne    25740 <JS_CallInternal+0x730>
   2e6fe:	49 8b 44 24 10       	mov    0x10(%r12),%rax
   2e703:	48 8b 80 f0 04 00 00 	mov    0x4f0(%rax),%rax
   2e70a:	48 85 c0             	test   %rax,%rax
   2e70d:	0f 84 d0 0c 00 00    	je     2f3e3 <JS_CallInternal+0xa3d3>
   2e713:	f6 40 3c 01          	testb  $0x1,0x3c(%rax)
   2e717:	0f 84 c6 0c 00 00    	je     2f3e3 <JS_CallInternal+0xa3d3>
   2e71d:	8b b5 f0 fd ff ff    	mov    -0x210(%rbp),%esi
   2e723:	4c 89 e7             	mov    %r12,%rdi
   2e726:	e8 95 71 00 00       	call   358c0 <JS_ThrowReferenceErrorNotDefined>
   2e72b:	e9 10 70 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2e730:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e735:	48 89 c2             	mov    %rax,%rdx
   2e738:	48 89 ce             	mov    %rcx,%rsi
   2e73b:	e8 90 fd fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2e740:	e9 7d 74 ff ff       	jmp    25bc2 <JS_CallInternal+0xbb2>
   2e745:	0f 85 f5 6f ff ff    	jne    25740 <JS_CallInternal+0x730>
   2e74b:	49 8b 44 24 10       	mov    0x10(%r12),%rax
   2e750:	48 8b 80 f0 04 00 00 	mov    0x4f0(%rax),%rax
   2e757:	48 85 c0             	test   %rax,%rax
   2e75a:	0f 84 a2 74 ff ff    	je     25c02 <JS_CallInternal+0xbf2>
   2e760:	f6 40 3c 01          	testb  $0x1,0x3c(%rax)
   2e764:	0f 84 98 74 ff ff    	je     25c02 <JS_CallInternal+0xbf2>
   2e76a:	8b b5 f0 fd ff ff    	mov    -0x210(%rbp),%esi
   2e770:	4c 89 e7             	mov    %r12,%rdi
   2e773:	e8 48 71 00 00       	call   358c0 <JS_ThrowReferenceErrorNotDefined>
   2e778:	e9 c3 6f ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2e77d:	48 8d 35 d4 d5 0a 00 	lea    0xad5d4(%rip),%rsi        # dbd58 <_IO_stdin_used+0x3d58>
   2e784:	4c 89 e7             	mov    %r12,%rdi
   2e787:	31 c0                	xor    %eax,%eax
   2e789:	4d 89 ef             	mov    %r13,%r15
   2e78c:	e8 0f 51 00 00       	call   338a0 <JS_ThrowTypeError>
   2e791:	e9 aa 6f ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2e796:	83 f9 f9             	cmp    $0xfffffff9,%ecx
   2e799:	0f 84 0e 10 00 00    	je     2f7ad <JS_CallInternal+0xa79d>
   2e79f:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   2e7a6:	4c 89 7e 30          	mov    %r15,0x30(%rsi)
   2e7aa:	49 8b 31             	mov    (%r9),%rsi
   2e7ad:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2e7b1:	e9 00 ee ff ff       	jmp    2d5b6 <JS_CallInternal+0x85a6>
   2e7b6:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e7bb:	48 89 c2             	mov    %rax,%rdx
   2e7be:	48 89 ce             	mov    %rcx,%rsi
   2e7c1:	4c 89 9d 30 fe ff ff 	mov    %r11,-0x1d0(%rbp)
   2e7c8:	e8 03 fd fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2e7cd:	4c 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%r11
   2e7d4:	e9 2d bb ff ff       	jmp    2a306 <JS_CallInternal+0x52f6>
   2e7d9:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e7de:	48 89 c2             	mov    %rax,%rdx
   2e7e1:	48 89 ce             	mov    %rcx,%rsi
   2e7e4:	e8 e7 fc fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2e7e9:	e9 fa d8 ff ff       	jmp    2c0e8 <JS_CallInternal+0x70d8>
   2e7ee:	66 83 78 12 01       	cmpw   $0x1,0x12(%rax)
   2e7f3:	0f 85 d8 c4 ff ff    	jne    2acd1 <JS_CallInternal+0x5cc1>
   2e7f9:	f6 40 10 08          	testb  $0x8,0x10(%rax)
   2e7fd:	0f 85 ce c4 ff ff    	jne    2acd1 <JS_CallInternal+0x5cc1>
   2e803:	80 7f 10 00          	cmpb   $0x0,0x10(%rdi)
   2e807:	0f 84 c4 c4 ff ff    	je     2acd1 <JS_CallInternal+0x5cc1>
   2e80d:	49 8b 72 08          	mov    0x8(%r10),%rsi
   2e811:	45 31 db             	xor    %r11d,%r11d
   2e814:	48 c1 fa 04          	sar    $0x4,%rdx
   2e818:	49 8b 02             	mov    (%r10),%rax
   2e81b:	83 47 fc 01          	addl   $0x1,-0x4(%rdi)
   2e81f:	49 89 3a             	mov    %rdi,(%r10)
   2e822:	4d 89 5a 08          	mov    %r11,0x8(%r10)
   2e826:	41 89 52 10          	mov    %edx,0x10(%r10)
   2e82a:	48 85 f6             	test   %rsi,%rsi
   2e82d:	74 26                	je     2e855 <JS_CallInternal+0x9845>
   2e82f:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e834:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2e83b:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2e842:	e8 09 19 ff ff       	call   20150 <js_free_shape>
   2e847:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2e84e:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2e855:	48 85 c0             	test   %rax,%rax
   2e858:	0f 84 73 c4 ff ff    	je     2acd1 <JS_CallInternal+0x5cc1>
   2e85e:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e863:	48 89 c6             	mov    %rax,%rsi
   2e866:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2e86d:	e8 de 18 ff ff       	call   20150 <js_free_shape>
   2e872:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2e879:	e9 53 c4 ff ff       	jmp    2acd1 <JS_CallInternal+0x5cc1>
   2e87e:	66 90                	xchg   %ax,%ax
   2e880:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2e886:	0f 8f c8 0b 00 00    	jg     2f454 <JS_CallInternal+0xa444>
   2e88c:	45 31 ff             	xor    %r15d,%r15d
   2e88f:	b8 03 00 00 00       	mov    $0x3,%eax
   2e894:	e9 4f 79 ff ff       	jmp    261e8 <JS_CallInternal+0x11d8>
   2e899:	41 83 fa f6          	cmp    $0xfffffff6,%r10d
   2e89d:	0f 86 da e8 ff ff    	jbe    2d17d <JS_CallInternal+0x816d>
   2e8a3:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2e8a6:	83 e8 01             	sub    $0x1,%eax
   2e8a9:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2e8ac:	85 c0                	test   %eax,%eax
   2e8ae:	0f 8f c9 e8 ff ff    	jg     2d17d <JS_CallInternal+0x816d>
   2e8b4:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e8b9:	48 89 ce             	mov    %rcx,%rsi
   2e8bc:	4c 89 d2             	mov    %r10,%rdx
   2e8bf:	4c 89 85 10 fe ff ff 	mov    %r8,-0x1f0(%rbp)
   2e8c6:	4c 89 8d 30 fe ff ff 	mov    %r9,-0x1d0(%rbp)
   2e8cd:	e8 fe fb fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2e8d2:	4c 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9
   2e8d9:	4c 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%r8
   2e8e0:	e9 98 e8 ff ff       	jmp    2d17d <JS_CallInternal+0x816d>
   2e8e5:	45 85 ff             	test   %r15d,%r15d
   2e8e8:	0f 85 c3 dd ff ff    	jne    2c6b1 <JS_CallInternal+0x76a1>
   2e8ee:	e9 2d de ff ff       	jmp    2c720 <JS_CallInternal+0x7710>
   2e8f3:	48 89 f2             	mov    %rsi,%rdx
   2e8f6:	48 89 fe             	mov    %rdi,%rsi
   2e8f9:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e8fe:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2e905:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2e90c:	e8 bf fb fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2e911:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2e918:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2e91f:	e9 31 d5 ff ff       	jmp    2be55 <JS_CallInternal+0x6e45>
   2e924:	49 8b 94 24 88 01 00 	mov    0x188(%r12),%rdx
   2e92b:	00 
   2e92c:	49 8b 84 24 80 01 00 	mov    0x180(%r12),%rax
   2e933:	00 
   2e934:	83 fa f6             	cmp    $0xfffffff6,%edx
   2e937:	76 04                	jbe    2e93d <JS_CallInternal+0x992d>
   2e939:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2e93d:	48 89 43 d0          	mov    %rax,-0x30(%rbx)
   2e941:	48 89 53 d8          	mov    %rdx,-0x28(%rbx)
   2e945:	e9 50 aa ff ff       	jmp    2939a <JS_CallInternal+0x438a>
   2e94a:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
   2e950:	e9 31 e1 ff ff       	jmp    2ca86 <JS_CallInternal+0x7a76>
   2e955:	4d 89 ef             	mov    %r13,%r15
   2e958:	e9 e3 6d ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2e95d:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e962:	48 89 c2             	mov    %rax,%rdx
   2e965:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2e96c:	e8 5f fb fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2e971:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2e978:	e9 ed a0 ff ff       	jmp    28a6a <JS_CallInternal+0x3a5a>
   2e97d:	f2 0f 10 05 b3 fa 0a 	movsd  0xafab3(%rip),%xmm0        # de438 <__PRETTY_FUNCTION__.0+0xb8>
   2e984:	00 
   2e985:	e9 37 d2 ff ff       	jmp    2bbc1 <JS_CallInternal+0x6bb1>
   2e98a:	48 8b bd b0 fe ff ff 	mov    -0x150(%rbp),%rdi
   2e991:	4c 89 c6             	mov    %r8,%rsi
   2e994:	e8 a7 3d ff ff       	call   22740 <free_var_ref>
   2e999:	e9 18 70 ff ff       	jmp    259b6 <JS_CallInternal+0x9a6>
   2e99e:	8b 85 70 fe ff ff    	mov    -0x190(%rbp),%eax
   2e9a4:	83 e8 02             	sub    $0x2,%eax
   2e9a7:	83 f8 01             	cmp    $0x1,%eax
   2e9aa:	0f 87 74 0a 00 00    	ja     2f424 <JS_CallInternal+0xa414>
   2e9b0:	49 8b 84 24 88 01 00 	mov    0x188(%r12),%rax
   2e9b7:	00 
   2e9b8:	49 8b 94 24 80 01 00 	mov    0x180(%r12),%rdx
   2e9bf:	00 
   2e9c0:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2e9c3:	0f 86 a1 8e ff ff    	jbe    2786a <JS_CallInternal+0x285a>
   2e9c9:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2e9cd:	e9 98 8e ff ff       	jmp    2786a <JS_CallInternal+0x285a>
   2e9d2:	48 89 f2             	mov    %rsi,%rdx
   2e9d5:	48 89 fe             	mov    %rdi,%rsi
   2e9d8:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2e9dd:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   2e9e4:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2e9eb:	44 89 85 10 fe ff ff 	mov    %r8d,-0x1f0(%rbp)
   2e9f2:	4c 89 95 30 fe ff ff 	mov    %r10,-0x1d0(%rbp)
   2e9f9:	e8 d2 fa fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2e9fe:	48 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%rax
   2ea05:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2ea0c:	44 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%r8d
   2ea13:	4c 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%r10
   2ea1a:	e9 7b e0 ff ff       	jmp    2ca9a <JS_CallInternal+0x7a8a>
   2ea1f:	48 63 b5 a8 fe ff ff 	movslq -0x158(%rbp),%rsi
   2ea26:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2ea2b:	48 89 95 f0 fd ff ff 	mov    %rdx,-0x210(%rbp)
   2ea32:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2ea39:	48 c1 e6 04          	shl    $0x4,%rsi
   2ea3d:	48 89 b5 10 fe ff ff 	mov    %rsi,-0x1f0(%rbp)
   2ea44:	e8 37 74 fe ff       	call   15e80 <__js_malloc>
   2ea49:	4c 8b 95 98 fe ff ff 	mov    -0x168(%rbp),%r10
   2ea50:	48 8b b5 10 fe ff ff 	mov    -0x1f0(%rbp),%rsi
   2ea57:	48 89 c2             	mov    %rax,%rdx
   2ea5a:	31 c0                	xor    %eax,%eax
   2ea5c:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2ea63:	4c 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8
   2ea6a:	48 85 d2             	test   %rdx,%rdx
   2ea6d:	0f 84 78 0b 00 00    	je     2f5eb <JS_CallInternal+0xa5db>
   2ea73:	4d 8b 4c 02 08       	mov    0x8(%r10,%rax,1),%r9
   2ea78:	49 8b 3c 02          	mov    (%r10,%rax,1),%rdi
   2ea7c:	41 83 f9 f6          	cmp    $0xfffffff6,%r9d
   2ea80:	76 04                	jbe    2ea86 <JS_CallInternal+0x9a76>
   2ea82:	83 47 fc 01          	addl   $0x1,-0x4(%rdi)
   2ea86:	48 89 3c 02          	mov    %rdi,(%rdx,%rax,1)
   2ea8a:	4c 89 4c 02 08       	mov    %r9,0x8(%rdx,%rax,1)
   2ea8f:	48 83 c0 10          	add    $0x10,%rax
   2ea93:	48 39 c6             	cmp    %rax,%rsi
   2ea96:	75 db                	jne    2ea73 <JS_CallInternal+0x9a63>
   2ea98:	8b 85 a8 fe ff ff    	mov    -0x158(%rbp),%eax
   2ea9e:	48 89 51 30          	mov    %rdx,0x30(%rcx)
   2eaa2:	89 41 38             	mov    %eax,0x38(%rcx)
   2eaa5:	48 89 0b             	mov    %rcx,(%rbx)
   2eaa8:	4c 89 43 08          	mov    %r8,0x8(%rbx)
   2eaac:	e9 e7 89 ff ff       	jmp    27498 <JS_CallInternal+0x2488>
   2eab1:	4c 39 da             	cmp    %r11,%rdx
   2eab4:	0f 85 cf c0 ff ff    	jne    2ab89 <JS_CallInternal+0x5b79>
   2eaba:	41 8b 41 10          	mov    0x10(%r9),%eax
   2eabe:	83 f8 ff             	cmp    $0xffffffff,%eax
   2eac1:	0f 84 c2 c0 ff ff    	je     2ab89 <JS_CallInternal+0x5b79>
   2eac7:	48 c1 e0 04          	shl    $0x4,%rax
   2eacb:	49 03 42 20          	add    0x20(%r10),%rax
   2eacf:	48 8b 10             	mov    (%rax),%rdx
   2ead2:	48 8b 40 08          	mov    0x8(%rax),%rax
   2ead6:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2ead9:	0f 86 37 db ff ff    	jbe    2c616 <JS_CallInternal+0x7606>
   2eadf:	e9 2e db ff ff       	jmp    2c612 <JS_CallInternal+0x7602>
   2eae4:	66 83 bd 10 fe ff ff 	cmpw   $0x1,-0x1f0(%rbp)
   2eaeb:	01 
   2eaec:	0f 85 1c c1 ff ff    	jne    2ac0e <JS_CallInternal+0x5bfe>
   2eaf2:	41 f6 42 10 08       	testb  $0x8,0x10(%r10)
   2eaf7:	0f 85 11 c1 ff ff    	jne    2ac0e <JS_CallInternal+0x5bfe>
   2eafd:	66 83 7f 12 01       	cmpw   $0x1,0x12(%rdi)
   2eb02:	0f 85 06 c1 ff ff    	jne    2ac0e <JS_CallInternal+0x5bfe>
   2eb08:	f6 47 10 08          	testb  $0x8,0x10(%rdi)
   2eb0c:	0f 85 fc c0 ff ff    	jne    2ac0e <JS_CallInternal+0x5bfe>
   2eb12:	41 80 7b 10 00       	cmpb   $0x0,0x10(%r11)
   2eb17:	0f 84 f1 c0 ff ff    	je     2ac0e <JS_CallInternal+0x5bfe>
   2eb1d:	80 7a 10 00          	cmpb   $0x0,0x10(%rdx)
   2eb21:	0f 84 e7 c0 ff ff    	je     2ac0e <JS_CallInternal+0x5bfe>
   2eb27:	49 8b 49 08          	mov    0x8(%r9),%rcx
   2eb2b:	66 49 0f 6e c3       	movq   %r11,%xmm0
   2eb30:	48 c1 fe 04          	sar    $0x4,%rsi
   2eb34:	4d 8b 01             	mov    (%r9),%r8
   2eb37:	66 48 0f 6e fa       	movq   %rdx,%xmm7
   2eb3c:	41 83 43 fc 01       	addl   $0x1,-0x4(%r11)
   2eb41:	66 0f 6c c7          	punpcklqdq %xmm7,%xmm0
   2eb45:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2eb49:	41 89 71 10          	mov    %esi,0x10(%r9)
   2eb4d:	41 0f 11 01          	movups %xmm0,(%r9)
   2eb51:	48 85 c9             	test   %rcx,%rcx
   2eb54:	74 29                	je     2eb7f <JS_CallInternal+0x9b6f>
   2eb56:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2eb5b:	48 89 ce             	mov    %rcx,%rsi
   2eb5e:	4c 89 85 10 fe ff ff 	mov    %r8,-0x1f0(%rbp)
   2eb65:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2eb6c:	e8 df 15 ff ff       	call   20150 <js_free_shape>
   2eb71:	4c 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%r8
   2eb78:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2eb7f:	4d 85 c0             	test   %r8,%r8
   2eb82:	0f 84 86 c0 ff ff    	je     2ac0e <JS_CallInternal+0x5bfe>
   2eb88:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2eb8d:	4c 89 c6             	mov    %r8,%rsi
   2eb90:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2eb97:	e8 b4 15 ff ff       	call   20150 <js_free_shape>
   2eb9c:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2eba3:	e9 66 c0 ff ff       	jmp    2ac0e <JS_CallInternal+0x5bfe>
   2eba8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   2ebaf:	00 
   2ebb0:	66 41 83 7a 12 01    	cmpw   $0x1,0x12(%r10)
   2ebb6:	0f 85 52 c0 ff ff    	jne    2ac0e <JS_CallInternal+0x5bfe>
   2ebbc:	41 f6 42 10 08       	testb  $0x8,0x10(%r10)
   2ebc1:	0f 85 47 c0 ff ff    	jne    2ac0e <JS_CallInternal+0x5bfe>
   2ebc7:	80 7a 10 00          	cmpb   $0x0,0x10(%rdx)
   2ebcb:	0f 84 3d c0 ff ff    	je     2ac0e <JS_CallInternal+0x5bfe>
   2ebd1:	49 8b 79 08          	mov    0x8(%r9),%rdi
   2ebd5:	45 31 c0             	xor    %r8d,%r8d
   2ebd8:	48 c1 fe 04          	sar    $0x4,%rsi
   2ebdc:	49 8b 09             	mov    (%r9),%rcx
   2ebdf:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2ebe3:	49 89 11             	mov    %rdx,(%r9)
   2ebe6:	4d 89 41 08          	mov    %r8,0x8(%r9)
   2ebea:	41 89 71 10          	mov    %esi,0x10(%r9)
   2ebee:	48 85 ff             	test   %rdi,%rdi
   2ebf1:	74 29                	je     2ec1c <JS_CallInternal+0x9c0c>
   2ebf3:	48 89 fe             	mov    %rdi,%rsi
   2ebf6:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2ebfb:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   2ec02:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2ec09:	e8 42 15 ff ff       	call   20150 <js_free_shape>
   2ec0e:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   2ec15:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2ec1c:	48 85 c9             	test   %rcx,%rcx
   2ec1f:	0f 84 e9 bf ff ff    	je     2ac0e <JS_CallInternal+0x5bfe>
   2ec25:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2ec2a:	48 89 ce             	mov    %rcx,%rsi
   2ec2d:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2ec34:	e8 17 15 ff ff       	call   20150 <js_free_shape>
   2ec39:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2ec40:	e9 c9 bf ff ff       	jmp    2ac0e <JS_CallInternal+0x5bfe>
   2ec45:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2ec4a:	48 89 c2             	mov    %rax,%rdx
   2ec4d:	e8 7e f8 fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2ec52:	e9 40 cf ff ff       	jmp    2bb97 <JS_CallInternal+0x6b87>
   2ec57:	4d 89 ef             	mov    %r13,%r15
   2ec5a:	e9 e1 6a ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2ec5f:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2ec64:	89 ca                	mov    %ecx,%edx
   2ec66:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2ec6a:	e8 61 9d fe ff       	call   189d0 <JS_AtomGetStrRT.constprop.0>
   2ec6f:	48 89 c2             	mov    %rax,%rdx
   2ec72:	e9 37 ef ff ff       	jmp    2dbae <JS_CallInternal+0x8b9e>
   2ec77:	31 ff                	xor    %edi,%edi
   2ec79:	48 c7 43 f8 03 00 00 	movq   $0x3,-0x8(%rbx)
   2ec80:	00 
   2ec81:	4d 89 ef             	mov    %r13,%r15
   2ec84:	48 89 7b f0          	mov    %rdi,-0x10(%rbx)
   2ec88:	e9 b3 6a ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2ec8d:	48 89 03             	mov    %rax,(%rbx)
   2ec90:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2ec94:	e9 77 89 ff ff       	jmp    27610 <JS_CallInternal+0x2600>
   2ec99:	4d 89 ef             	mov    %r13,%r15
   2ec9c:	e9 9f 6a ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2eca1:	4d 89 ef             	mov    %r13,%r15
   2eca4:	e9 97 6a ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2eca9:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2ecae:	4c 89 d6             	mov    %r10,%rsi
   2ecb1:	4c 89 fa             	mov    %r15,%rdx
   2ecb4:	e8 17 f8 fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2ecb9:	e9 e7 dc ff ff       	jmp    2c9a5 <JS_CallInternal+0x7995>
   2ecbe:	41 8d 47 fe          	lea    -0x2(%r15),%eax
   2ecc2:	83 f8 01             	cmp    $0x1,%eax
   2ecc5:	0f 86 af 09 00 00    	jbe    2f67a <JS_CallInternal+0xa66a>
   2eccb:	41 83 ff ff          	cmp    $0xffffffff,%r15d
   2eccf:	0f 85 94 da ff ff    	jne    2c769 <JS_CallInternal+0x7759>
   2ecd5:	41 0f b6 48 11       	movzbl 0x11(%r8),%ecx
   2ecda:	83 e1 01             	and    $0x1,%ecx
   2ecdd:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2ece3:	e9 24 f5 ff ff       	jmp    2e20c <JS_CallInternal+0x91fc>
   2ece8:	41 8d 47 fe          	lea    -0x2(%r15),%eax
   2ecec:	83 f8 01             	cmp    $0x1,%eax
   2ecef:	0f 86 8f 09 00 00    	jbe    2f684 <JS_CallInternal+0xa674>
   2ecf5:	41 83 ff ff          	cmp    $0xffffffff,%r15d
   2ecf9:	0f 85 6a da ff ff    	jne    2c769 <JS_CallInternal+0x7759>
   2ecff:	4c 39 c7             	cmp    %r8,%rdi
   2ed02:	48 89 fe             	mov    %rdi,%rsi
   2ed05:	4c 89 e7             	mov    %r12,%rdi
   2ed08:	4c 89 85 10 fe ff ff 	mov    %r8,-0x1f0(%rbp)
   2ed0f:	0f 94 c1             	sete   %cl
   2ed12:	0f b6 c9             	movzbl %cl,%ecx
   2ed15:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2ed1b:	e8 30 f9 fe ff       	call   1e650 <JS_FreeValue>
   2ed20:	4c 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%r8
   2ed27:	e9 e0 f4 ff ff       	jmp    2e20c <JS_CallInternal+0x91fc>
   2ed2c:	45 85 ff             	test   %r15d,%r15d
   2ed2f:	0f 85 e3 00 00 00    	jne    2ee18 <JS_CallInternal+0x9e08>
   2ed35:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2ed39:	66 48 0f 6e ef       	movq   %rdi,%xmm5
   2ed3e:	31 c9                	xor    %ecx,%ecx
   2ed40:	f2 41 0f 2a c0       	cvtsi2sd %r8d,%xmm0
   2ed45:	66 0f 2e c5          	ucomisd %xmm5,%xmm0
   2ed49:	0f 9b c1             	setnp  %cl
   2ed4c:	41 0f 45 cf          	cmovne %r15d,%ecx
   2ed50:	e9 f0 a7 ff ff       	jmp    29545 <JS_CallInternal+0x4535>
   2ed55:	66 48 0f 6e c0       	movq   %rax,%xmm0
   2ed5a:	83 f9 08             	cmp    $0x8,%ecx
   2ed5d:	74 36                	je     2ed95 <JS_CallInternal+0x9d85>
   2ed5f:	85 c9                	test   %ecx,%ecx
   2ed61:	0f 85 0d ef ff ff    	jne    2dc74 <JS_CallInternal+0x8c64>
   2ed67:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2ed6b:	f2 0f 2a ca          	cvtsi2sd %edx,%xmm1
   2ed6f:	31 c0                	xor    %eax,%eax
   2ed71:	66 0f 2f c8          	comisd %xmm0,%xmm1
   2ed75:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   2ed7c:	00 
   2ed7d:	0f 97 c0             	seta   %al
   2ed80:	48 83 eb 10          	sub    $0x10,%rbx
   2ed84:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2ed88:	e9 b3 af ff ff       	jmp    29d40 <JS_CallInternal+0x4d30>
   2ed8d:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2ed91:	f2 0f 2a c0          	cvtsi2sd %eax,%xmm0
   2ed95:	66 48 0f 6e ca       	movq   %rdx,%xmm1
   2ed9a:	eb d3                	jmp    2ed6f <JS_CallInternal+0x9d5f>
   2ed9c:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2eda1:	4c 89 c6             	mov    %r8,%rsi
   2eda4:	4c 89 ea             	mov    %r13,%rdx
   2eda7:	89 85 00 fe ff ff    	mov    %eax,-0x200(%rbp)
   2edad:	44 89 95 10 fe ff ff 	mov    %r10d,-0x1f0(%rbp)
   2edb4:	e8 17 f7 fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2edb9:	8b 85 00 fe ff ff    	mov    -0x200(%rbp),%eax
   2edbf:	44 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10d
   2edc6:	e9 17 c7 ff ff       	jmp    2b4e2 <JS_CallInternal+0x64d2>
   2edcb:	48 8d 35 04 98 0a 00 	lea    0xa9804(%rip),%rsi        # d85d6 <_IO_stdin_used+0x5d6>
   2edd2:	4c 89 e7             	mov    %r12,%rdi
   2edd5:	31 c0                	xor    %eax,%eax
   2edd7:	4d 89 ef             	mov    %r13,%r15
   2edda:	e8 c1 4a 00 00       	call   338a0 <JS_ThrowTypeError>
   2eddf:	e9 5c 69 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2ede4:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2ede9:	4c 89 d6             	mov    %r10,%rsi
   2edec:	4c 89 c2             	mov    %r8,%rdx
   2edef:	e8 dc f6 fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2edf4:	e9 e1 db ff ff       	jmp    2c9da <JS_CallInternal+0x79ca>
   2edf9:	48 8d 35 eb 96 0a 00 	lea    0xa96eb(%rip),%rsi        # d84eb <_IO_stdin_used+0x4eb>
   2ee00:	4c 89 e7             	mov    %r12,%rdi
   2ee03:	4d 89 ef             	mov    %r13,%r15
   2ee06:	e8 95 4a 00 00       	call   338a0 <JS_ThrowTypeError>
   2ee0b:	e9 30 69 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2ee10:	4d 89 ef             	mov    %r13,%r15
   2ee13:	e9 28 69 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2ee18:	41 83 ff 08          	cmp    $0x8,%r15d
   2ee1c:	0f 85 47 d9 ff ff    	jne    2c769 <JS_CallInternal+0x7759>
   2ee22:	66 48 0f 6e f7       	movq   %rdi,%xmm6
   2ee27:	66 49 0f 6e f8       	movq   %r8,%xmm7
   2ee2c:	31 c9                	xor    %ecx,%ecx
   2ee2e:	b8 00 00 00 00       	mov    $0x0,%eax
   2ee33:	66 0f 2e f7          	ucomisd %xmm7,%xmm6
   2ee37:	0f 9b c1             	setnp  %cl
   2ee3a:	0f 45 c8             	cmovne %eax,%ecx
   2ee3d:	e9 03 a7 ff ff       	jmp    29545 <JS_CallInternal+0x4535>
   2ee42:	4d 89 fb             	mov    %r15,%r11
   2ee45:	49 89 cf             	mov    %rcx,%r15
   2ee48:	48 89 d7             	mov    %rdx,%rdi
   2ee4b:	45 31 c0             	xor    %r8d,%r8d
   2ee4e:	4c 89 d2             	mov    %r10,%rdx
   2ee51:	4c 89 d9             	mov    %r11,%rcx
   2ee54:	4c 89 fe             	mov    %r15,%rsi
   2ee57:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   2ee5e:	4c 89 9d 08 fe ff ff 	mov    %r11,-0x1f8(%rbp)
   2ee65:	48 89 bd 10 fe ff ff 	mov    %rdi,-0x1f0(%rbp)
   2ee6c:	e8 3f cf fe ff       	call   1bdb0 <js_strict_eq2.isra.0>
   2ee71:	48 8b b5 10 fe ff ff 	mov    -0x1f0(%rbp),%rsi
   2ee78:	4c 89 fa             	mov    %r15,%rdx
   2ee7b:	4c 89 e7             	mov    %r12,%rdi
   2ee7e:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2ee84:	e8 c7 f7 fe ff       	call   1e650 <JS_FreeValue>
   2ee89:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   2ee90:	4c 8b 9d 08 fe ff ff 	mov    -0x1f8(%rbp),%r11
   2ee97:	e9 7f ee ff ff       	jmp    2dd1b <JS_CallInternal+0x8d0b>
   2ee9c:	48 83 eb 10          	sub    $0x10,%rbx
   2eea0:	4d 89 ef             	mov    %r13,%r15
   2eea3:	e9 98 68 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2eea8:	31 c0                	xor    %eax,%eax
   2eeaa:	41 83 ff ff          	cmp    $0xffffffff,%r15d
   2eeae:	75 08                	jne    2eeb8 <JS_CallInternal+0x9ea8>
   2eeb0:	31 c0                	xor    %eax,%eax
   2eeb2:	4c 39 d2             	cmp    %r10,%rdx
   2eeb5:	0f 94 c0             	sete   %al
   2eeb8:	48 89 d6             	mov    %rdx,%rsi
   2eebb:	4c 89 e7             	mov    %r12,%rdi
   2eebe:	48 89 ca             	mov    %rcx,%rdx
   2eec1:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   2eec8:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2eece:	e8 7d f7 fe ff       	call   1e650 <JS_FreeValue>
   2eed3:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   2eeda:	4d 89 fb             	mov    %r15,%r11
   2eedd:	e9 39 ee ff ff       	jmp    2dd1b <JS_CallInternal+0x8d0b>
   2eee2:	45 85 ff             	test   %r15d,%r15d
   2eee5:	0f 85 8f 05 00 00    	jne    2f47a <JS_CallInternal+0xa46a>
   2eeeb:	66 48 0f 6e ea       	movq   %rdx,%xmm5
   2eef0:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2eef4:	31 c0                	xor    %eax,%eax
   2eef6:	ba 01 00 00 00       	mov    $0x1,%edx
   2eefb:	f2 41 0f 2a c2       	cvtsi2sd %r10d,%xmm0
   2ef00:	66 0f 2e c5          	ucomisd %xmm5,%xmm0
   2ef04:	0f 9a c0             	setp   %al
   2ef07:	48 0f 45 c2          	cmovne %rdx,%rax
   2ef0b:	e9 a8 a0 ff ff       	jmp    28fb8 <JS_CallInternal+0x3fa8>
   2ef10:	48 8b bd 90 fe ff ff 	mov    -0x170(%rbp),%rdi
   2ef17:	48 8d 35 fa cd 0a 00 	lea    0xacdfa(%rip),%rsi        # dbd18 <_IO_stdin_used+0x3d18>
   2ef1e:	31 c0                	xor    %eax,%eax
   2ef20:	4d 89 ef             	mov    %r13,%r15
   2ef23:	e8 78 49 00 00       	call   338a0 <JS_ThrowTypeError>
   2ef28:	e9 13 68 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2ef2d:	66 48 0f 6e ca       	movq   %rdx,%xmm1
   2ef32:	83 f9 08             	cmp    $0x8,%ecx
   2ef35:	0f 84 a2 03 00 00    	je     2f2dd <JS_CallInternal+0xa2cd>
   2ef3b:	85 c9                	test   %ecx,%ecx
   2ef3d:	0f 85 70 e7 ff ff    	jne    2d6b3 <JS_CallInternal+0x86a3>
   2ef43:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2ef47:	f2 0f 2a c0          	cvtsi2sd %eax,%xmm0
   2ef4b:	31 c0                	xor    %eax,%eax
   2ef4d:	66 0f 2f c8          	comisd %xmm0,%xmm1
   2ef51:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   2ef58:	00 
   2ef59:	0f 93 c0             	setae  %al
   2ef5c:	48 83 eb 10          	sub    $0x10,%rbx
   2ef60:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2ef64:	e9 37 a6 ff ff       	jmp    295a0 <JS_CallInternal+0x4590>
   2ef69:	4c 89 fb             	mov    %r15,%rbx
   2ef6c:	4d 89 ef             	mov    %r13,%r15
   2ef6f:	e9 cc 67 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2ef74:	48 8d 35 31 96 0a 00 	lea    0xa9631(%rip),%rsi        # d85ac <_IO_stdin_used+0x5ac>
   2ef7b:	4c 89 e7             	mov    %r12,%rdi
   2ef7e:	31 c0                	xor    %eax,%eax
   2ef80:	4d 89 ef             	mov    %r13,%r15
   2ef83:	e8 18 49 00 00       	call   338a0 <JS_ThrowTypeError>
   2ef88:	e9 b3 67 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2ef8d:	4d 89 ef             	mov    %r13,%r15
   2ef90:	e9 ab 67 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2ef95:	4d 89 ef             	mov    %r13,%r15
   2ef98:	e9 a3 67 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2ef9d:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2efa2:	89 c2                	mov    %eax,%edx
   2efa4:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2efa8:	e8 23 9a fe ff       	call   189d0 <JS_AtomGetStrRT.constprop.0>
   2efad:	48 89 c2             	mov    %rax,%rdx
   2efb0:	e9 2d f0 ff ff       	jmp    2dfe2 <JS_CallInternal+0x8fd2>
   2efb5:	48 89 f2             	mov    %rsi,%rdx
   2efb8:	48 89 fe             	mov    %rdi,%rsi
   2efbb:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2efc0:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2efc7:	e8 04 f5 fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2efcc:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2efd3:	e9 39 d7 ff ff       	jmp    2c711 <JS_CallInternal+0x7701>
   2efd8:	8d 41 fe             	lea    -0x2(%rcx),%eax
   2efdb:	83 f8 01             	cmp    $0x1,%eax
   2efde:	0f 86 5f 07 00 00    	jbe    2f743 <JS_CallInternal+0xa733>
   2efe4:	83 f9 ff             	cmp    $0xffffffff,%ecx
   2efe7:	0f 85 52 d8 ff ff    	jne    2c83f <JS_CallInternal+0x782f>
   2efed:	45 0f b6 78 11       	movzbl 0x11(%r8),%r15d
   2eff2:	4c 89 c6             	mov    %r8,%rsi
   2eff5:	48 89 ca             	mov    %rcx,%rdx
   2eff8:	4c 89 e7             	mov    %r12,%rdi
   2effb:	41 83 e7 01          	and    $0x1,%r15d
   2efff:	e8 4c f6 fe ff       	call   1e650 <JS_FreeValue>
   2f004:	e9 50 a0 ff ff       	jmp    29059 <JS_CallInternal+0x4049>
   2f009:	8d 41 fe             	lea    -0x2(%rcx),%eax
   2f00c:	83 f8 01             	cmp    $0x1,%eax
   2f00f:	0f 86 39 07 00 00    	jbe    2f74e <JS_CallInternal+0xa73e>
   2f015:	83 f9 ff             	cmp    $0xffffffff,%ecx
   2f018:	0f 85 21 d8 ff ff    	jne    2c83f <JS_CallInternal+0x782f>
   2f01e:	4c 39 c7             	cmp    %r8,%rdi
   2f021:	48 89 fe             	mov    %rdi,%rsi
   2f024:	4c 89 e7             	mov    %r12,%rdi
   2f027:	4c 89 85 30 fe ff ff 	mov    %r8,-0x1d0(%rbp)
   2f02e:	41 0f 94 c7          	sete   %r15b
   2f032:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   2f039:	e8 12 f6 fe ff       	call   1e650 <JS_FreeValue>
   2f03e:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2f045:	4c 89 e7             	mov    %r12,%rdi
   2f048:	45 0f b6 ff          	movzbl %r15b,%r15d
   2f04c:	4c 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%r9
   2f053:	4c 89 c6             	mov    %r8,%rsi
   2f056:	4c 89 ca             	mov    %r9,%rdx
   2f059:	e8 f2 f5 fe ff       	call   1e650 <JS_FreeValue>
   2f05e:	e9 f6 9f ff ff       	jmp    29059 <JS_CallInternal+0x4049>
   2f063:	85 c9                	test   %ecx,%ecx
   2f065:	0f 85 44 03 00 00    	jne    2f3af <JS_CallInternal+0xa39f>
   2f06b:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2f06f:	66 48 0f 6e ef       	movq   %rdi,%xmm5
   2f074:	45 31 ff             	xor    %r15d,%r15d
   2f077:	f2 41 0f 2a c0       	cvtsi2sd %r8d,%xmm0
   2f07c:	66 0f 2e c5          	ucomisd %xmm5,%xmm0
   2f080:	41 0f 9b c7          	setnp  %r15b
   2f084:	44 0f 45 f9          	cmovne %ecx,%r15d
   2f088:	e9 cc 9f ff ff       	jmp    29059 <JS_CallInternal+0x4049>
   2f08d:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2f092:	4c 89 c6             	mov    %r8,%rsi
   2f095:	48 89 da             	mov    %rbx,%rdx
   2f098:	e8 33 f4 fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2f09d:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2f0a4:	e9 eb e6 ff ff       	jmp    2d794 <JS_CallInternal+0x8784>
   2f0a9:	41 b8 06 00 00 00    	mov    $0x6,%r8d
   2f0af:	31 c9                	xor    %ecx,%ecx
   2f0b1:	b8 06 00 00 00       	mov    $0x6,%eax
   2f0b6:	e9 aa 7a ff ff       	jmp    26b65 <JS_CallInternal+0x1b55>
   2f0bb:	48 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%rdx
   2f0c2:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2f0c7:	48 89 de             	mov    %rbx,%rsi
   2f0ca:	4c 89 85 30 fe ff ff 	mov    %r8,-0x1d0(%rbp)
   2f0d1:	e8 fa f3 fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2f0d6:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2f0dd:	e9 51 d7 ff ff       	jmp    2c833 <JS_CallInternal+0x7823>
   2f0e2:	66 48 0f 6e c9       	movq   %rcx,%xmm1
   2f0e7:	83 f8 08             	cmp    $0x8,%eax
   2f0ea:	0f 84 9e e8 ff ff    	je     2d98e <JS_CallInternal+0x897e>
   2f0f0:	85 c0                	test   %eax,%eax
   2f0f2:	0f 85 83 a5 ff ff    	jne    2967b <JS_CallInternal+0x466b>
   2f0f8:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2f0fc:	f2 0f 2a c2          	cvtsi2sd %edx,%xmm0
   2f100:	e9 8e e8 ff ff       	jmp    2d993 <JS_CallInternal+0x8983>
   2f105:	4d 89 c3             	mov    %r8,%r11
   2f108:	49 89 d7             	mov    %rdx,%r15
   2f10b:	45 31 c0             	xor    %r8d,%r8d
   2f10e:	4c 89 d2             	mov    %r10,%rdx
   2f111:	4c 89 d9             	mov    %r11,%rcx
   2f114:	4c 89 fe             	mov    %r15,%rsi
   2f117:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   2f11e:	4c 89 9d 08 fe ff ff 	mov    %r11,-0x1f8(%rbp)
   2f125:	48 89 bd 10 fe ff ff 	mov    %rdi,-0x1f0(%rbp)
   2f12c:	e8 7f cc fe ff       	call   1bdb0 <js_strict_eq2.isra.0>
   2f131:	48 8b b5 10 fe ff ff 	mov    -0x1f0(%rbp),%rsi
   2f138:	4c 89 fa             	mov    %r15,%rdx
   2f13b:	4c 89 e7             	mov    %r12,%rdi
   2f13e:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2f144:	e8 07 f5 fe ff       	call   1e650 <JS_FreeValue>
   2f149:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   2f150:	4c 8b 9d 08 fe ff ff 	mov    -0x1f8(%rbp),%r11
   2f157:	4c 89 e7             	mov    %r12,%rdi
   2f15a:	4c 89 d6             	mov    %r10,%rsi
   2f15d:	4c 89 da             	mov    %r11,%rdx
   2f160:	e8 eb f4 fe ff       	call   1e650 <JS_FreeValue>
   2f165:	4c 63 bd 30 fe ff ff 	movslq -0x1d0(%rbp),%r15
   2f16c:	e9 98 9e ff ff       	jmp    29009 <JS_CallInternal+0x3ff9>
   2f171:	45 31 ff             	xor    %r15d,%r15d
   2f174:	41 83 f8 ff          	cmp    $0xffffffff,%r8d
   2f178:	75 0a                	jne    2f184 <JS_CallInternal+0xa174>
   2f17a:	45 31 ff             	xor    %r15d,%r15d
   2f17d:	4c 39 d7             	cmp    %r10,%rdi
   2f180:	41 0f 94 c7          	sete   %r15b
   2f184:	48 89 fe             	mov    %rdi,%rsi
   2f187:	4c 89 e7             	mov    %r12,%rdi
   2f18a:	4c 89 95 30 fe ff ff 	mov    %r10,-0x1d0(%rbp)
   2f191:	4c 89 85 10 fe ff ff 	mov    %r8,-0x1f0(%rbp)
   2f198:	e8 b3 f4 fe ff       	call   1e650 <JS_FreeValue>
   2f19d:	4c 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%r10
   2f1a4:	4c 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%r11
   2f1ab:	4c 89 e7             	mov    %r12,%rdi
   2f1ae:	4c 89 d6             	mov    %r10,%rsi
   2f1b1:	4c 89 da             	mov    %r11,%rdx
   2f1b4:	e8 97 f4 fe ff       	call   1e650 <JS_FreeValue>
   2f1b9:	e9 4b 9e ff ff       	jmp    29009 <JS_CallInternal+0x3ff9>
   2f1be:	45 85 c0             	test   %r8d,%r8d
   2f1c1:	0f 85 a5 00 00 00    	jne    2f26c <JS_CallInternal+0xa25c>
   2f1c7:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2f1cb:	66 48 0f 6e ef       	movq   %rdi,%xmm5
   2f1d0:	45 31 ff             	xor    %r15d,%r15d
   2f1d3:	b8 00 00 00 00       	mov    $0x0,%eax
   2f1d8:	f2 41 0f 2a c2       	cvtsi2sd %r10d,%xmm0
   2f1dd:	66 0f 2e c5          	ucomisd %xmm5,%xmm0
   2f1e1:	41 0f 9b c7          	setnp  %r15b
   2f1e5:	4c 0f 45 f8          	cmovne %rax,%r15
   2f1e9:	e9 1b 9e ff ff       	jmp    29009 <JS_CallInternal+0x3ff9>
   2f1ee:	4d 89 ef             	mov    %r13,%r15
   2f1f1:	e9 4a 65 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2f1f6:	48 8d 35 8a 93 0a 00 	lea    0xa938a(%rip),%rsi        # d8587 <_IO_stdin_used+0x587>
   2f1fd:	4c 89 e7             	mov    %r12,%rdi
   2f200:	31 c0                	xor    %eax,%eax
   2f202:	4d 89 ef             	mov    %r13,%r15
   2f205:	e8 96 46 00 00       	call   338a0 <JS_ThrowTypeError>
   2f20a:	e9 31 65 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2f20f:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2f214:	89 c2                	mov    %eax,%edx
   2f216:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2f21a:	e8 b1 97 fe ff       	call   189d0 <JS_AtomGetStrRT.constprop.0>
   2f21f:	48 89 c2             	mov    %rax,%rdx
   2f222:	e9 87 ed ff ff       	jmp    2dfae <JS_CallInternal+0x8f9e>
   2f227:	48 8b 85 b0 fe ff ff 	mov    -0x150(%rbp),%rax
   2f22e:	31 d2                	xor    %edx,%edx
   2f230:	48 63 c9             	movslq %ecx,%rcx
   2f233:	f3 0f 6f 80 d8 04 00 	movdqu 0x4d8(%rax),%xmm0
   2f23a:	00 
   2f23b:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   2f23f:	48 89 90 d8 04 00 00 	mov    %rdx,0x4d8(%rax)
   2f246:	48 c7 80 e0 04 00 00 	movq   $0x4,0x4e0(%rax)
   2f24d:	04 00 00 00 
   2f251:	48 8b 85 c0 fe ff ff 	mov    -0x140(%rbp),%rax
   2f258:	48 03 48 18          	add    0x18(%rax),%rcx
   2f25c:	49 89 cf             	mov    %rcx,%r15
   2f25f:	e9 6d 60 ff ff       	jmp    252d1 <JS_CallInternal+0x2c1>
   2f264:	4d 89 ef             	mov    %r13,%r15
   2f267:	e9 d4 64 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2f26c:	41 83 f8 08          	cmp    $0x8,%r8d
   2f270:	0f 85 1c 05 00 00    	jne    2f792 <JS_CallInternal+0xa782>
   2f276:	66 48 0f 6e f7       	movq   %rdi,%xmm6
   2f27b:	66 49 0f 6e fa       	movq   %r10,%xmm7
   2f280:	45 31 ff             	xor    %r15d,%r15d
   2f283:	b8 00 00 00 00       	mov    $0x0,%eax
   2f288:	66 0f 2e f7          	ucomisd %xmm7,%xmm6
   2f28c:	41 0f 9b c7          	setnp  %r15b
   2f290:	4c 0f 45 f8          	cmovne %rax,%r15
   2f294:	e9 70 9d ff ff       	jmp    29009 <JS_CallInternal+0x3ff9>
   2f299:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2f29e:	48 89 ce             	mov    %rcx,%rsi
   2f2a1:	48 89 da             	mov    %rbx,%rdx
   2f2a4:	4c 89 85 f0 fd ff ff 	mov    %r8,-0x210(%rbp)
   2f2ab:	e8 20 f2 fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2f2b0:	4c 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8
   2f2b7:	e9 50 d5 ff ff       	jmp    2c80c <JS_CallInternal+0x77fc>
   2f2bc:	48 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%rdx
   2f2c3:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2f2c8:	48 89 ce             	mov    %rcx,%rsi
   2f2cb:	e8 00 f2 fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2f2d0:	e9 48 ec ff ff       	jmp    2df1d <JS_CallInternal+0x8f0d>
   2f2d5:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2f2d9:	f2 0f 2a ca          	cvtsi2sd %edx,%xmm1
   2f2dd:	66 48 0f 6e c0       	movq   %rax,%xmm0
   2f2e2:	e9 64 fc ff ff       	jmp    2ef4b <JS_CallInternal+0x9f3b>
   2f2e7:	48 8d 35 12 cb 0a 00 	lea    0xacb12(%rip),%rsi        # dbe00 <_IO_stdin_used+0x3e00>
   2f2ee:	4c 89 e7             	mov    %r12,%rdi
   2f2f1:	31 c0                	xor    %eax,%eax
   2f2f3:	4d 89 ef             	mov    %r13,%r15
   2f2f6:	e8 a5 45 00 00       	call   338a0 <JS_ThrowTypeError>
   2f2fb:	e9 40 64 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2f300:	4d 89 ef             	mov    %r13,%r15
   2f303:	e9 38 64 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2f308:	48 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%rdx
   2f30f:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2f314:	48 89 de             	mov    %rbx,%rsi
   2f317:	e8 b4 f1 fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2f31c:	e9 08 76 ff ff       	jmp    26929 <JS_CallInternal+0x1919>
   2f321:	83 f9 08             	cmp    $0x8,%ecx
   2f324:	0f 84 7a 02 00 00    	je     2f5a4 <JS_CallInternal+0xa594>
   2f32a:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   2f331:	4c 89 7e 30          	mov    %r15,0x30(%rsi)
   2f335:	49 8b 31             	mov    (%r9),%rsi
   2f338:	e9 79 e2 ff ff       	jmp    2d5b6 <JS_CallInternal+0x85a6>
   2f33d:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2f341:	f2 0f 2a ca          	cvtsi2sd %edx,%xmm1
   2f345:	66 48 0f 6e c0       	movq   %rax,%xmm0
   2f34a:	31 c0                	xor    %eax,%eax
   2f34c:	66 0f 2f c8          	comisd %xmm0,%xmm1
   2f350:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   2f357:	00 
   2f358:	0f 97 c0             	seta   %al
   2f35b:	48 83 eb 10          	sub    $0x10,%rbx
   2f35f:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2f363:	e9 7f 9e ff ff       	jmp    291e7 <JS_CallInternal+0x41d7>
   2f368:	66 48 0f 6e c0       	movq   %rax,%xmm0
   2f36d:	83 f9 08             	cmp    $0x8,%ecx
   2f370:	74 36                	je     2f3a8 <JS_CallInternal+0xa398>
   2f372:	85 c9                	test   %ecx,%ecx
   2f374:	0f 85 a8 e3 ff ff    	jne    2d722 <JS_CallInternal+0x8712>
   2f37a:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2f37e:	f2 0f 2a ca          	cvtsi2sd %edx,%xmm1
   2f382:	31 c0                	xor    %eax,%eax
   2f384:	66 0f 2f c8          	comisd %xmm0,%xmm1
   2f388:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   2f38f:	00 
   2f390:	0f 93 c0             	setae  %al
   2f393:	48 83 eb 10          	sub    $0x10,%rbx
   2f397:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2f39b:	e9 79 ad ff ff       	jmp    2a119 <JS_CallInternal+0x5109>
   2f3a0:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2f3a4:	f2 0f 2a c0          	cvtsi2sd %eax,%xmm0
   2f3a8:	66 48 0f 6e ca       	movq   %rdx,%xmm1
   2f3ad:	eb d3                	jmp    2f382 <JS_CallInternal+0xa372>
   2f3af:	83 f9 08             	cmp    $0x8,%ecx
   2f3b2:	0f 85 87 d4 ff ff    	jne    2c83f <JS_CallInternal+0x782f>
   2f3b8:	66 48 0f 6e f7       	movq   %rdi,%xmm6
   2f3bd:	66 49 0f 6e f8       	movq   %r8,%xmm7
   2f3c2:	45 31 ff             	xor    %r15d,%r15d
   2f3c5:	b8 00 00 00 00       	mov    $0x0,%eax
   2f3ca:	66 0f 2e f7          	ucomisd %xmm7,%xmm6
   2f3ce:	41 0f 9b c7          	setnp  %r15b
   2f3d2:	44 0f 45 f8          	cmovne %eax,%r15d
   2f3d6:	e9 7e 9c ff ff       	jmp    29059 <JS_CallInternal+0x4049>
   2f3db:	4d 89 ef             	mov    %r13,%r15
   2f3de:	e9 5d 63 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2f3e3:	b8 03 00 00 00       	mov    $0x3,%eax
   2f3e8:	31 c9                	xor    %ecx,%ecx
   2f3ea:	e9 f7 66 ff ff       	jmp    25ae6 <JS_CallInternal+0xad6>
   2f3ef:	4d 89 ef             	mov    %r13,%r15
   2f3f2:	e9 49 63 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2f3f7:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2f3fc:	89 c2                	mov    %eax,%edx
   2f3fe:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2f402:	e8 c9 95 fe ff       	call   189d0 <JS_AtomGetStrRT.constprop.0>
   2f407:	48 89 c2             	mov    %rax,%rdx
   2f40a:	e9 22 ef ff ff       	jmp    2e331 <JS_CallInternal+0x9321>
   2f40f:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2f414:	48 89 c2             	mov    %rax,%rdx
   2f417:	48 89 ce             	mov    %rcx,%rsi
   2f41a:	e8 b1 f0 fe ff       	call   1e4d0 <__JS_FreeValueRT>
   2f41f:	e9 a4 d6 ff ff       	jmp    2cac8 <JS_CallInternal+0x7ab8>
   2f424:	48 8b 85 50 fe ff ff 	mov    -0x1b0(%rbp),%rax
   2f42b:	48 8b 95 70 fe ff ff 	mov    -0x190(%rbp),%rdx
   2f432:	4c 89 e7             	mov    %r12,%rdi
   2f435:	48 89 c6             	mov    %rax,%rsi
   2f438:	e8 13 ba 01 00       	call   4ae50 <JS_ToObject>
   2f43d:	48 89 c1             	mov    %rax,%rcx
   2f440:	48 89 d0             	mov    %rdx,%rax
   2f443:	83 fa 06             	cmp    $0x6,%edx
   2f446:	0f 84 50 01 00 00    	je     2f59c <JS_CallInternal+0xa58c>
   2f44c:	48 89 ca             	mov    %rcx,%rdx
   2f44f:	e9 16 84 ff ff       	jmp    2786a <JS_CallInternal+0x285a>
   2f454:	48 8b 87 48 04 00 00 	mov    0x448(%rdi),%rax
   2f45b:	48 8b 34 c8          	mov    (%rax,%rcx,8),%rsi
   2f45f:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2f462:	83 e8 01             	sub    $0x1,%eax
   2f465:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2f468:	85 c0                	test   %eax,%eax
   2f46a:	0f 8f 1c f4 ff ff    	jg     2e88c <JS_CallInternal+0x987c>
   2f470:	e8 2b 75 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2f475:	e9 12 f4 ff ff       	jmp    2e88c <JS_CallInternal+0x987c>
   2f47a:	41 83 ff 08          	cmp    $0x8,%r15d
   2f47e:	0f 85 05 01 00 00    	jne    2f589 <JS_CallInternal+0xa579>
   2f484:	66 48 0f 6e f2       	movq   %rdx,%xmm6
   2f489:	66 49 0f 6e fa       	movq   %r10,%xmm7
   2f48e:	31 c0                	xor    %eax,%eax
   2f490:	ba 01 00 00 00       	mov    $0x1,%edx
   2f495:	66 0f 2e f7          	ucomisd %xmm7,%xmm6
   2f499:	0f 9a c0             	setp   %al
   2f49c:	48 0f 45 c2          	cmovne %rdx,%rax
   2f4a0:	e9 13 9b ff ff       	jmp    28fb8 <JS_CallInternal+0x3fa8>
   2f4a5:	66 48 0f 6e ca       	movq   %rdx,%xmm1
   2f4aa:	83 f9 08             	cmp    $0x8,%ecx
   2f4ad:	0f 84 92 fe ff ff    	je     2f345 <JS_CallInternal+0xa335>
   2f4b3:	85 c9                	test   %ecx,%ecx
   2f4b5:	0f 85 eb e3 ff ff    	jne    2d8a6 <JS_CallInternal+0x8896>
   2f4bb:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2f4bf:	f2 0f 2a c0          	cvtsi2sd %eax,%xmm0
   2f4c3:	e9 82 fe ff ff       	jmp    2f34a <JS_CallInternal+0xa33a>
   2f4c8:	85 d2                	test   %edx,%edx
   2f4ca:	0f 85 05 e3 ff ff    	jne    2d7d5 <JS_CallInternal+0x87c5>
   2f4d0:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2f4d4:	f2 0f 2a cf          	cvtsi2sd %edi,%xmm1
   2f4d8:	66 48 0f 6e c1       	movq   %rcx,%xmm0
   2f4dd:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
   2f4e1:	48 c7 43 e8 08 00 00 	movq   $0x8,-0x18(%rbx)
   2f4e8:	00 
   2f4e9:	f2 0f 11 43 e0       	movsd  %xmm0,-0x20(%rbx)
   2f4ee:	e9 c1 6e ff ff       	jmp    263b4 <JS_CallInternal+0x13a4>
   2f4f3:	66 48 0f 6e cf       	movq   %rdi,%xmm1
   2f4f8:	83 f8 08             	cmp    $0x8,%eax
   2f4fb:	74 db                	je     2f4d8 <JS_CallInternal+0xa4c8>
   2f4fd:	85 c0                	test   %eax,%eax
   2f4ff:	0f 85 d0 e2 ff ff    	jne    2d7d5 <JS_CallInternal+0x87c5>
   2f505:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2f509:	f2 0f 2a c1          	cvtsi2sd %ecx,%xmm0
   2f50d:	eb ce                	jmp    2f4dd <JS_CallInternal+0xa4cd>
   2f50f:	8d 70 07             	lea    0x7(%rax),%esi
   2f512:	83 fe 01             	cmp    $0x1,%esi
   2f515:	0f 87 ba e2 ff ff    	ja     2d7d5 <JS_CallInternal+0x87c5>
   2f51b:	48 89 fe             	mov    %rdi,%rsi
   2f51e:	49 89 c0             	mov    %rax,%r8
   2f521:	4c 89 e7             	mov    %r12,%rdi
   2f524:	4d 89 ef             	mov    %r13,%r15
   2f527:	e8 a4 44 01 00       	call   439d0 <JS_ConcatString>
   2f52c:	48 8d 5b f0          	lea    -0x10(%rbx),%rbx
   2f530:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2f534:	83 7b f8 06          	cmpl   $0x6,-0x8(%rbx)
   2f538:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2f53c:	0f 85 76 6e ff ff    	jne    263b8 <JS_CallInternal+0x13a8>
   2f542:	e9 f9 61 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2f547:	66 48 0f 6e c7       	movq   %rdi,%xmm0
   2f54c:	83 f8 08             	cmp    $0x8,%eax
   2f54f:	0f 84 fc e3 ff ff    	je     2d951 <JS_CallInternal+0x8941>
   2f555:	85 c0                	test   %eax,%eax
   2f557:	0f 85 1e a1 ff ff    	jne    2967b <JS_CallInternal+0x466b>
   2f55d:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2f561:	f2 0f 2a c9          	cvtsi2sd %ecx,%xmm1
   2f565:	e9 ec e3 ff ff       	jmp    2d956 <JS_CallInternal+0x8946>
   2f56a:	31 ff                	xor    %edi,%edi
   2f56c:	48 c7 43 08 03 00 00 	movq   $0x3,0x8(%rbx)
   2f573:	00 
   2f574:	48 83 c3 10          	add    $0x10,%rbx
   2f578:	48 89 7b f0          	mov    %rdi,-0x10(%rbx)
   2f57c:	e9 1e 7f ff ff       	jmp    2749f <JS_CallInternal+0x248f>
   2f581:	4d 89 ef             	mov    %r13,%r15
   2f584:	e9 b7 61 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2f589:	4c 89 d6             	mov    %r10,%rsi
   2f58c:	4c 89 fa             	mov    %r15,%rdx
   2f58f:	4c 89 e7             	mov    %r12,%rdi
   2f592:	e8 b9 f0 fe ff       	call   1e650 <JS_FreeValue>
   2f597:	e9 09 d4 ff ff       	jmp    2c9a5 <JS_CallInternal+0x7995>
   2f59c:	4d 89 ef             	mov    %r13,%r15
   2f59f:	e9 9c 61 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2f5a4:	66 48 0f 6e c2       	movq   %rdx,%xmm0
   2f5a9:	f2 41 0f 58 01       	addsd  (%r9),%xmm0
   2f5ae:	49 c7 41 08 08 00 00 	movq   $0x8,0x8(%r9)
   2f5b5:	00 
   2f5b6:	48 83 eb 10          	sub    $0x10,%rbx
   2f5ba:	f2 41 0f 11 01       	movsd  %xmm0,(%r9)
   2f5bf:	e9 e3 a2 ff ff       	jmp    298a7 <JS_CallInternal+0x4897>
   2f5c4:	4d 89 ef             	mov    %r13,%r15
   2f5c7:	e9 74 61 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2f5cc:	4d 89 ef             	mov    %r13,%r15
   2f5cf:	e9 6c 61 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2f5d4:	89 ce                	mov    %ecx,%esi
   2f5d6:	4c 89 e7             	mov    %r12,%rdi
   2f5d9:	e8 62 62 00 00       	call   35840 <JS_ThrowReferenceErrorUninitialized>
   2f5de:	e9 5d 61 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2f5e3:	4d 89 ef             	mov    %r13,%r15
   2f5e6:	e9 55 61 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2f5eb:	4d 8b 6c 24 10       	mov    0x10(%r12),%r13
   2f5f0:	41 80 bd e9 04 00 00 	cmpb   $0x0,0x4e9(%r13)
   2f5f7:	00 
   2f5f8:	74 41                	je     2f63b <JS_CallInternal+0xa62b>
   2f5fa:	4c 89 c2             	mov    %r8,%rdx
   2f5fd:	48 89 ce             	mov    %rcx,%rsi
   2f600:	4c 89 e7             	mov    %r12,%rdi
   2f603:	e8 48 f0 fe ff       	call   1e650 <JS_FreeValue>
   2f608:	45 31 c0             	xor    %r8d,%r8d
   2f60b:	48 c7 43 08 06 00 00 	movq   $0x6,0x8(%rbx)
   2f612:	00 
   2f613:	4c 89 03             	mov    %r8,(%rbx)
   2f616:	e9 f5 7f ff ff       	jmp    27610 <JS_CallInternal+0x2600>
   2f61b:	4d 89 ef             	mov    %r13,%r15
   2f61e:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2f624:	0f 8e 16 61 ff ff    	jle    25740 <JS_CallInternal+0x730>
   2f62a:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2f62f:	89 ce                	mov    %ecx,%esi
   2f631:	e8 ba b5 fe ff       	call   1abf0 <JS_FreeAtom.part.0.isra.0>
   2f636:	e9 05 61 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2f63b:	41 c6 85 e9 04 00 00 	movb   $0x1,0x4e9(%r13)
   2f642:	01 
   2f643:	48 8d 35 93 8e 0a 00 	lea    0xa8e93(%rip),%rsi        # d84dd <_IO_stdin_used+0x4dd>
   2f64a:	4c 89 e7             	mov    %r12,%rdi
   2f64d:	31 c0                	xor    %eax,%eax
   2f64f:	4c 89 85 00 fe ff ff 	mov    %r8,-0x200(%rbp)
   2f656:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   2f65d:	e8 1e 64 00 00       	call   35a80 <JS_ThrowInternalError>
   2f662:	41 c6 85 e9 04 00 00 	movb   $0x0,0x4e9(%r13)
   2f669:	00 
   2f66a:	4c 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%r8
   2f671:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   2f678:	eb 80                	jmp    2f5fa <JS_CallInternal+0xa5ea>
   2f67a:	b9 01 00 00 00       	mov    $0x1,%ecx
   2f67f:	e9 c1 9e ff ff       	jmp    29545 <JS_CallInternal+0x4535>
   2f684:	0f b6 4f 11          	movzbl 0x11(%rdi),%ecx
   2f688:	48 89 fe             	mov    %rdi,%rsi
   2f68b:	4c 89 e7             	mov    %r12,%rdi
   2f68e:	83 e1 01             	and    $0x1,%ecx
   2f691:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2f697:	e8 b4 ef fe ff       	call   1e650 <JS_FreeValue>
   2f69c:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2f6a2:	e9 9e 9e ff ff       	jmp    29545 <JS_CallInternal+0x4535>
   2f6a7:	4d 89 ef             	mov    %r13,%r15
   2f6aa:	e9 91 60 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2f6af:	4c 89 d6             	mov    %r10,%rsi
   2f6b2:	4c 89 fa             	mov    %r15,%rdx
   2f6b5:	4c 89 e7             	mov    %r12,%rdi
   2f6b8:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2f6bf:	e8 8c ef fe ff       	call   1e650 <JS_FreeValue>
   2f6c4:	31 c0                	xor    %eax,%eax
   2f6c6:	44 39 bd 30 fe ff ff 	cmp    %r15d,-0x1d0(%rbp)
   2f6cd:	0f 95 c0             	setne  %al
   2f6d0:	e9 e3 98 ff ff       	jmp    28fb8 <JS_CallInternal+0x3fa8>
   2f6d5:	4d 89 ef             	mov    %r13,%r15
   2f6d8:	e9 63 60 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2f6dd:	e8 5e 61 00 00       	call   35840 <JS_ThrowReferenceErrorUninitialized>
   2f6e2:	e9 59 60 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2f6e7:	4d 89 ef             	mov    %r13,%r15
   2f6ea:	e9 51 60 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2f6ef:	4c 89 fb             	mov    %r15,%rbx
   2f6f2:	4d 89 ef             	mov    %r13,%r15
   2f6f5:	e9 46 60 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2f6fa:	4d 89 ef             	mov    %r13,%r15
   2f6fd:	e9 3e 60 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2f702:	48 8d 35 cd 8e 0a 00 	lea    0xa8ecd(%rip),%rsi        # d85d6 <_IO_stdin_used+0x5d6>
   2f709:	4c 89 e7             	mov    %r12,%rdi
   2f70c:	31 c0                	xor    %eax,%eax
   2f70e:	4d 89 ef             	mov    %r13,%r15
   2f711:	e8 8a 41 00 00       	call   338a0 <JS_ThrowTypeError>
   2f716:	e9 25 60 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2f71b:	4d 89 ef             	mov    %r13,%r15
   2f71e:	e9 1d 60 ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2f723:	4d 89 ef             	mov    %r13,%r15
   2f726:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2f72c:	0f 8e 0e 60 ff ff    	jle    25740 <JS_CallInternal+0x730>
   2f732:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
   2f737:	89 ce                	mov    %ecx,%esi
   2f739:	e8 b2 b4 fe ff       	call   1abf0 <JS_FreeAtom.part.0.isra.0>
   2f73e:	e9 fd 5f ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2f743:	41 bf 01 00 00 00    	mov    $0x1,%r15d
   2f749:	e9 0b 99 ff ff       	jmp    29059 <JS_CallInternal+0x4049>
   2f74e:	44 0f b6 7f 11       	movzbl 0x11(%rdi),%r15d
   2f753:	48 89 fe             	mov    %rdi,%rsi
   2f756:	4c 89 e7             	mov    %r12,%rdi
   2f759:	41 83 e7 01          	and    $0x1,%r15d
   2f75d:	e8 ee ee fe ff       	call   1e650 <JS_FreeValue>
   2f762:	e9 f2 98 ff ff       	jmp    29059 <JS_CallInternal+0x4049>
   2f767:	e8 64 25 fe ff       	call   11cd0 <__stack_chk_fail@plt>
   2f76c:	44 39 c2             	cmp    %r8d,%edx
   2f76f:	4c 89 d6             	mov    %r10,%rsi
   2f772:	4c 89 c2             	mov    %r8,%rdx
   2f775:	4c 89 e7             	mov    %r12,%rdi
   2f778:	41 0f 94 c7          	sete   %r15b
   2f77c:	e8 cf ee fe ff       	call   1e650 <JS_FreeValue>
   2f781:	45 0f b6 ff          	movzbl %r15b,%r15d
   2f785:	e9 7f 98 ff ff       	jmp    29009 <JS_CallInternal+0x3ff9>
   2f78a:	4d 89 ef             	mov    %r13,%r15
   2f78d:	e9 ae 5f ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2f792:	4c 89 d6             	mov    %r10,%rsi
   2f795:	4c 89 c2             	mov    %r8,%rdx
   2f798:	4c 89 e7             	mov    %r12,%rdi
   2f79b:	e8 b0 ee fe ff       	call   1e650 <JS_FreeValue>
   2f7a0:	e9 35 d2 ff ff       	jmp    2c9da <JS_CallInternal+0x79ca>
   2f7a5:	4d 89 ef             	mov    %r13,%r15
   2f7a8:	e9 93 5f ff ff       	jmp    25740 <JS_CallInternal+0x730>
   2f7ad:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2f7b4:	49 8b 31             	mov    (%r9),%rsi
   2f7b7:	4c 89 e7             	mov    %r12,%rdi
   2f7ba:	4c 89 8d 10 fe ff ff 	mov    %r9,-0x1f0(%rbp)
   2f7c1:	48 89 95 30 fe ff ff 	mov    %rdx,-0x1d0(%rbp)
   2f7c8:	48 83 eb 10          	sub    $0x10,%rbx
   2f7cc:	4c 89 78 30          	mov    %r15,0x30(%rax)
   2f7d0:	48 89 8d 38 fe ff ff 	mov    %rcx,-0x1c8(%rbp)
   2f7d7:	e8 74 6c fe ff       	call   16450 <JS_ConcatStringInPlace>
   2f7dc:	4c 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%r10
   2f7e3:	4c 8b 9d 38 fe ff ff 	mov    -0x1c8(%rbp),%r11
   2f7ea:	85 c0                	test   %eax,%eax
   2f7ec:	4c 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%r9
   2f7f3:	75 59                	jne    2f84e <JS_CallInternal+0xa83e>
   2f7f5:	49 8b 51 08          	mov    0x8(%r9),%rdx
   2f7f9:	49 8b 01             	mov    (%r9),%rax
   2f7fc:	83 fa f6             	cmp    $0xfffffff6,%edx
   2f7ff:	76 04                	jbe    2f805 <JS_CallInternal+0xa7f5>
   2f801:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2f805:	4c 89 d1             	mov    %r10,%rcx
   2f808:	4d 89 d8             	mov    %r11,%r8
   2f80b:	48 89 c6             	mov    %rax,%rsi
   2f80e:	4c 89 e7             	mov    %r12,%rdi
   2f811:	4c 89 8d 30 fe ff ff 	mov    %r9,-0x1d0(%rbp)
   2f818:	e8 b3 41 01 00       	call   439d0 <JS_ConcatString>
   2f81d:	48 89 c1             	mov    %rax,%rcx
   2f820:	48 89 d0             	mov    %rdx,%rax
   2f823:	83 fa 06             	cmp    $0x6,%edx
   2f826:	0f 84 14 5f ff ff    	je     25740 <JS_CallInternal+0x730>
   2f82c:	4c 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9
   2f833:	4c 89 e7             	mov    %r12,%rdi
   2f836:	49 8b 31             	mov    (%r9),%rsi
   2f839:	49 8b 51 08          	mov    0x8(%r9),%rdx
   2f83d:	49 89 09             	mov    %rcx,(%r9)
   2f840:	49 89 41 08          	mov    %rax,0x8(%r9)
   2f844:	e8 07 ee fe ff       	call   1e650 <JS_FreeValue>
   2f849:	e9 59 a0 ff ff       	jmp    298a7 <JS_CallInternal+0x4897>
   2f84e:	4c 89 d6             	mov    %r10,%rsi
   2f851:	4c 89 da             	mov    %r11,%rdx
   2f854:	4c 89 e7             	mov    %r12,%rdi
   2f857:	e8 f4 ed fe ff       	call   1e650 <JS_FreeValue>
   2f85c:	e9 46 a0 ff ff       	jmp    298a7 <JS_CallInternal+0x4897>

Disassembly of section .fini:
