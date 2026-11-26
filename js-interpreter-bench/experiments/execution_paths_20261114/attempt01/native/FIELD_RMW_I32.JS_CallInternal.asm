
/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/execution_paths_20261114/attempt01/work/FIELD_RMW_I32.release/qjs:     file format elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .plt.got:

Disassembly of section .plt.sec:

Disassembly of section .text:

0000000000025310 <JS_CallInternal>:
   25310:	55                   	push   %rbp
   25311:	48 89 e5             	mov    %rsp,%rbp
   25314:	41 57                	push   %r15
   25316:	4d 89 c7             	mov    %r8,%r15
   25319:	41 56                	push   %r14
   2531b:	49 89 ce             	mov    %rcx,%r14
   2531e:	41 55                	push   %r13
   25320:	49 89 d5             	mov    %rdx,%r13
   25323:	41 54                	push   %r12
   25325:	49 89 f4             	mov    %rsi,%r12
   25328:	53                   	push   %rbx
   25329:	48 81 ec 68 02 00 00 	sub    $0x268,%rsp
   25330:	48 8b 45 10          	mov    0x10(%rbp),%rax
   25334:	48 89 bd 90 fe ff ff 	mov    %rdi,-0x170(%rbp)
   2533b:	48 89 b5 c8 fe ff ff 	mov    %rsi,-0x138(%rbp)
   25342:	48 89 85 58 fe ff ff 	mov    %rax,-0x1a8(%rbp)
   25349:	48 8b 45 18          	mov    0x18(%rbp),%rax
   2534d:	48 89 b5 60 fe ff ff 	mov    %rsi,-0x1a0(%rbp)
   25354:	48 89 85 78 fe ff ff 	mov    %rax,-0x188(%rbp)
   2535b:	48 8b 45 20          	mov    0x20(%rbp),%rax
   2535f:	48 89 95 68 fe ff ff 	mov    %rdx,-0x198(%rbp)
   25366:	48 89 8d 50 fe ff ff 	mov    %rcx,-0x1b0(%rbp)
   2536d:	4c 89 85 70 fe ff ff 	mov    %r8,-0x190(%rbp)
   25374:	44 89 8d a8 fe ff ff 	mov    %r9d,-0x158(%rbp)
   2537b:	48 89 85 98 fe ff ff 	mov    %rax,-0x168(%rbp)
   25382:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
   25389:	00 00 
   2538b:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
   2538f:	48 8b 47 10          	mov    0x10(%rdi),%rax
   25393:	48 89 85 b0 fe ff ff 	mov    %rax,-0x150(%rbp)
   2539a:	8b 87 a8 01 00 00    	mov    0x1a8(%rdi),%eax
   253a0:	89 85 c0 fe ff ff    	mov    %eax,-0x140(%rbp)
   253a6:	83 e8 01             	sub    $0x1,%eax
   253a9:	89 87 a8 01 00 00    	mov    %eax,0x1a8(%rdi)
   253af:	85 c0                	test   %eax,%eax
   253b1:	0f 8e 99 05 00 00    	jle    25950 <JS_CallInternal+0x640>
   253b7:	41 83 fd ff          	cmp    $0xffffffff,%r13d
   253bb:	0f 85 cf 05 00 00    	jne    25990 <JS_CallInternal+0x680>
   253c1:	48 8b 85 c8 fe ff ff 	mov    -0x138(%rbp),%rax
   253c8:	0f b7 40 12          	movzwl 0x12(%rax),%eax
   253cc:	66 83 f8 0d          	cmp    $0xd,%ax
   253d0:	0f 85 a6 07 00 00    	jne    25b7c <JS_CallInternal+0x86c>
   253d6:	48 8b 85 c8 fe ff ff 	mov    -0x138(%rbp),%rax
   253dd:	48 8b 40 28          	mov    0x28(%rax),%rax
   253e1:	48 89 85 c0 fe ff ff 	mov    %rax,-0x140(%rbp)
   253e8:	44 0f b7 40 38       	movzwl 0x38(%rax),%r8d
   253ed:	44 3b 85 a8 fe ff ff 	cmp    -0x158(%rbp),%r8d
   253f4:	0f 8f f4 01 00 00    	jg     255ee <JS_CallInternal+0x2de>
   253fa:	8b 45 28             	mov    0x28(%rbp),%eax
   253fd:	83 e0 02             	and    $0x2,%eax
   25400:	41 0f 45 c0          	cmovne %r8d,%eax
   25404:	48 8b bd c0 fe ff ff 	mov    -0x140(%rbp),%rdi
   2540b:	4c 8b 9d b0 fe ff ff 	mov    -0x150(%rbp),%r11
   25412:	44 0f b7 57 3a       	movzwl 0x3a(%rdi),%r10d
   25417:	0f b7 77 3e          	movzwl 0x3e(%rdi),%esi
   2541b:	0f b7 57 40          	movzwl 0x40(%rdi),%edx
   2541f:	48 89 ef             	mov    %rbp,%rdi
   25422:	48 89 f1             	mov    %rsi,%rcx
   25425:	44 01 d6             	add    %r10d,%esi
   25428:	4c 89 d3             	mov    %r10,%rbx
   2542b:	01 c6                	add    %eax,%esi
   2542d:	49 89 d1             	mov    %rdx,%r9
   25430:	48 63 f6             	movslq %esi,%rsi
   25433:	48 8d 34 72          	lea    (%rdx,%rsi,2),%rsi
   25437:	48 c1 e6 03          	shl    $0x3,%rsi
   2543b:	48 29 f7             	sub    %rsi,%rdi
   2543e:	49 3b bb d0 04 00 00 	cmp    0x4d0(%r11),%rdi
   25445:	0f 82 ce 07 00 00    	jb     25c19 <JS_CallInternal+0x909>
   2544b:	48 8b bd c0 fe ff ff 	mov    -0x140(%rbp),%rdi
   25452:	48 83 c6 17          	add    $0x17,%rsi
   25456:	49 89 f3             	mov    %rsi,%r11
   25459:	0f b6 7f 10          	movzbl 0x10(%rdi),%edi
   2545d:	49 81 e3 00 f0 ff ff 	and    $0xfffffffffffff000,%r11
   25464:	4c 89 a5 08 ff ff ff 	mov    %r12,-0xf8(%rbp)
   2546b:	4c 89 ad 10 ff ff ff 	mov    %r13,-0xf0(%rbp)
   25472:	89 bd 3c ff ff ff    	mov    %edi,-0xc4(%rbp)
   25478:	8b bd a8 fe ff ff    	mov    -0x158(%rbp),%edi
   2547e:	89 bd 38 ff ff ff    	mov    %edi,-0xc8(%rbp)
   25484:	48 8b bd c8 fe ff ff 	mov    -0x138(%rbp),%rdi
   2548b:	48 8b 7f 30          	mov    0x30(%rdi),%rdi
   2548f:	48 89 bd 88 fe ff ff 	mov    %rdi,-0x178(%rbp)
   25496:	48 89 e7             	mov    %rsp,%rdi
   25499:	4c 29 df             	sub    %r11,%rdi
   2549c:	48 39 fc             	cmp    %rdi,%rsp
   2549f:	74 15                	je     254b6 <JS_CallInternal+0x1a6>
   254a1:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
   254a8:	48 83 8c 24 f8 0f 00 	orq    $0x0,0xff8(%rsp)
   254af:	00 00 
   254b1:	48 39 fc             	cmp    %rdi,%rsp
   254b4:	75 eb                	jne    254a1 <JS_CallInternal+0x191>
   254b6:	81 e6 f0 0f 00 00    	and    $0xff0,%esi
   254bc:	48 29 f4             	sub    %rsi,%rsp
   254bf:	48 85 f6             	test   %rsi,%rsi
   254c2:	74 06                	je     254ca <JS_CallInternal+0x1ba>
   254c4:	48 83 4c 34 f8 00    	orq    $0x0,-0x8(%rsp,%rsi,1)
   254ca:	48 8b b5 98 fe ff ff 	mov    -0x168(%rbp),%rsi
   254d1:	48 8d 7c 24 0f       	lea    0xf(%rsp),%rdi
   254d6:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
   254da:	48 89 bd 28 fe ff ff 	mov    %rdi,-0x1d8(%rbp)
   254e1:	48 89 b5 80 fe ff ff 	mov    %rsi,-0x180(%rbp)
   254e8:	85 c0                	test   %eax,%eax
   254ea:	0f 85 2c 67 00 00    	jne    2bc1c <JS_CallInternal+0x690c>
   254f0:	48 98                	cltq
   254f2:	48 c1 e0 04          	shl    $0x4,%rax
   254f6:	48 01 f8             	add    %rdi,%rax
   254f9:	48 89 85 a0 fe ff ff 	mov    %rax,-0x160(%rbp)
   25500:	48 89 85 20 ff ff ff 	mov    %rax,-0xe0(%rbp)
   25507:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2550e:	48 89 85 18 ff ff ff 	mov    %rax,-0xe8(%rbp)
   25515:	45 85 d2             	test   %r10d,%r10d
   25518:	74 3e                	je     25558 <JS_CallInternal+0x248>
   2551a:	48 8b bd a0 fe ff ff 	mov    -0x160(%rbp),%rdi
   25521:	48 89 de             	mov    %rbx,%rsi
   25524:	48 c1 e6 04          	shl    $0x4,%rsi
   25528:	48 89 f8             	mov    %rdi,%rax
   2552b:	48 01 fe             	add    %rdi,%rsi
   2552e:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   25535:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2553c:	00 00 00 00 
   25540:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
   25547:	48 83 c0 10          	add    $0x10,%rax
   2554b:	48 c7 40 f8 03 00 00 	movq   $0x3,-0x8(%rax)
   25552:	00 
   25553:	48 39 f0             	cmp    %rsi,%rax
   25556:	75 e8                	jne    25540 <JS_CallInternal+0x230>
   25558:	48 c1 e3 04          	shl    $0x4,%rbx
   2555c:	48 c1 e1 04          	shl    $0x4,%rcx
   25560:	48 03 9d a0 fe ff ff 	add    -0x160(%rbp),%rbx
   25567:	48 8d 3c 0b          	lea    (%rbx,%rcx,1),%rdi
   2556b:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
   25572:	66 45 85 c9          	test   %r9w,%r9w
   25576:	74 0b                	je     25583 <JS_CallInternal+0x273>
   25578:	48 c1 e2 03          	shl    $0x3,%rdx
   2557c:	31 f6                	xor    %esi,%esi
   2557e:	e8 dd c2 fe ff       	call   11860 <memset@plt>
   25583:	48 8b bd b0 fe ff ff 	mov    -0x150(%rbp),%rdi
   2558a:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   25591:	48 89 9d 48 fe ff ff 	mov    %rbx,-0x1b8(%rbp)
   25598:	48 8b 87 f0 04 00 00 	mov    0x4f0(%rdi),%rax
   2559f:	4c 8b 79 18          	mov    0x18(%rcx),%r15
   255a3:	4c 8b 69 48          	mov    0x48(%rcx),%r13
   255a7:	48 8b 8d c8 fe ff ff 	mov    -0x138(%rbp),%rcx
   255ae:	48 89 85 00 ff ff ff 	mov    %rax,-0x100(%rbp)
   255b5:	48 8d 85 00 ff ff ff 	lea    -0x100(%rbp),%rax
   255bc:	48 89 87 f0 04 00 00 	mov    %rax,0x4f0(%rdi)
   255c3:	48 89 8d 40 fe ff ff 	mov    %rcx,-0x1c0(%rbp)
   255ca:	48 89 85 b8 fe ff ff 	mov    %rax,-0x148(%rbp)
   255d1:	41 0f b6 07          	movzbl (%r15),%eax
   255d5:	4c 8d 35 64 57 0e 00 	lea    0xe5764(%rip),%r14        # 10ad40 <dispatch_table.85>
   255dc:	4d 8d 67 01          	lea    0x1(%r15),%r12
   255e0:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   255e4:	49 89 c2             	mov    %rax,%r10
   255e7:	b8 01 00 00 00       	mov    $0x1,%eax
   255ec:	ff e2                	jmp    *%rdx
   255ee:	44 89 c0             	mov    %r8d,%eax
   255f1:	e9 0e fe ff ff       	jmp    25404 <JS_CallInternal+0xf4>
   255f6:	f3 0f 1e fa          	endbr64
   255fa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   25600:	f3 0f 1e fa          	endbr64
   25604:	41 8d 82 4d ff ff ff 	lea    -0xb3(%r10),%eax
   2560b:	48 c7 43 08 00 00 00 	movq   $0x0,0x8(%rbx)
   25612:	00 
   25613:	49 83 c4 01          	add    $0x1,%r12
   25617:	48 83 c3 10          	add    $0x10,%rbx
   2561b:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2561f:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   25625:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   25629:	49 89 c2             	mov    %rax,%r10
   2562c:	b8 01 00 00 00       	mov    $0x1,%eax
   25631:	ff e2                	jmp    *%rdx
   25633:	f3 0f 1e fa          	endbr64
   25637:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   2563e:	00 00 
   25640:	f3 0f 1e fa          	endbr64
   25644:	41 8b 44 24 04       	mov    0x4(%r12),%eax
   25649:	4d 8d 7c 24 09       	lea    0x9(%r12),%r15
   2564e:	41 8b 0c 24          	mov    (%r12),%ecx
   25652:	4c 89 ef             	mov    %r13,%rdi
   25655:	f3 0f 6f 5b f0       	movdqu -0x10(%rbx),%xmm3
   2565a:	44 89 95 00 fe ff ff 	mov    %r10d,-0x200(%rbp)
   25661:	89 85 20 fe ff ff    	mov    %eax,-0x1e0(%rbp)
   25667:	41 0f b6 44 24 08    	movzbl 0x8(%r12),%eax
   2566d:	0f 29 9d 30 fe ff ff 	movaps %xmm3,-0x1d0(%rbp)
   25674:	48 8b 95 38 fe ff ff 	mov    -0x1c8(%rbp),%rdx
   2567b:	88 85 10 fe ff ff    	mov    %al,-0x1f0(%rbp)
   25681:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   25688:	89 8d f0 fd ff ff    	mov    %ecx,-0x210(%rbp)
   2568e:	49 89 d4             	mov    %rdx,%r12
   25691:	4c 89 78 30          	mov    %r15,0x30(%rax)
   25695:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2569c:	48 89 c6             	mov    %rax,%rsi
   2569f:	48 89 85 e8 fd ff ff 	mov    %rax,-0x218(%rbp)
   256a6:	e8 f5 ab 04 00       	call   702a0 <JS_HasProperty>
   256ab:	85 c0                	test   %eax,%eax
   256ad:	0f 88 9d 03 00 00    	js     25a50 <JS_CallInternal+0x740>
   256b3:	0f 84 b7 66 00 00    	je     2bd70 <JS_CallInternal+0x6a60>
   256b9:	80 bd 10 fe ff ff 00 	cmpb   $0x0,-0x1f0(%rbp)
   256c0:	44 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10d
   256c7:	0f 85 01 06 00 00    	jne    25cce <JS_CallInternal+0x9be>
   256cd:	41 83 ea 71          	sub    $0x71,%r10d
   256d1:	41 83 fa 04          	cmp    $0x4,%r10d
   256d5:	0f 87 0f 05 00 00    	ja     25bea <JS_CallInternal+0x8da>
   256db:	48 8d 15 82 da 0b 00 	lea    0xbda82(%rip),%rdx        # e3164 <qjsc_repl_size+0x4b8>
   256e2:	4a 63 04 92          	movslq (%rdx,%r10,4),%rax
   256e6:	48 01 d0             	add    %rdx,%rax
   256e9:	3e ff e0             	notrack jmp *%rax
   256ec:	f3 0f 1e fa          	endbr64
   256f0:	f3 0f 1e fa          	endbr64
   256f4:	45 8d 8a 14 ff ff ff 	lea    -0xec(%r10),%r9d
   256fb:	4d 89 e7             	mov    %r12,%r15
   256fe:	4d 63 e1             	movslq %r9d,%r12
   25701:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   25708:	49 89 db             	mov    %rbx,%r11
   2570b:	31 c9                	xor    %ecx,%ecx
   2570d:	49 c1 e4 04          	shl    $0x4,%r12
   25711:	44 89 95 00 fe ff ff 	mov    %r10d,-0x200(%rbp)
   25718:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   2571e:	4c 89 ef             	mov    %r13,%rdi
   25721:	4d 29 e3             	sub    %r12,%r11
   25724:	4c 89 78 30          	mov    %r15,0x30(%rax)
   25728:	49 8b 73 f0          	mov    -0x10(%r11),%rsi
   2572c:	49 8b 53 f8          	mov    -0x8(%r11),%rdx
   25730:	6a 00                	push   $0x0
   25732:	41 53                	push   %r11
   25734:	4c 89 9d 10 fe ff ff 	mov    %r11,-0x1f0(%rbp)
   2573b:	6a 03                	push   $0x3
   2573d:	6a 00                	push   $0x0
   2573f:	44 89 8d 30 fe ff ff 	mov    %r9d,-0x1d0(%rbp)
   25746:	e8 c5 fb ff ff       	call   25310 <JS_CallInternal>
   2574b:	48 83 c4 20          	add    $0x20,%rsp
   2574f:	49 89 c0             	mov    %rax,%r8
   25752:	48 89 d0             	mov    %rdx,%rax
   25755:	83 fa 06             	cmp    $0x6,%edx
   25758:	0f 84 f2 02 00 00    	je     25a50 <JS_CallInternal+0x740>
   2575e:	4c 89 c1             	mov    %r8,%rcx
   25761:	83 bd 00 fe ff ff 23 	cmpl   $0x23,-0x200(%rbp)
   25768:	0f 84 a4 03 00 00    	je     25b12 <JS_CallInternal+0x802>
   2576e:	4c 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%r11
   25775:	44 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9d
   2577c:	4d 01 dc             	add    %r11,%r12
   2577f:	45 85 c9             	test   %r9d,%r9d
   25782:	0f 88 a3 00 00 00    	js     2582b <JS_CallInternal+0x51b>
   25788:	48 89 9d 10 fe ff ff 	mov    %rbx,-0x1f0(%rbp)
   2578f:	49 8d 5b f0          	lea    -0x10(%r11),%rbx
   25793:	4c 89 85 f0 fd ff ff 	mov    %r8,-0x210(%rbp)
   2579a:	4d 89 e8             	mov    %r13,%r8
   2579d:	49 89 d5             	mov    %rdx,%r13
   257a0:	44 89 8d 00 fe ff ff 	mov    %r9d,-0x200(%rbp)
   257a7:	eb 20                	jmp    257c9 <JS_CallInternal+0x4b9>
   257a9:	90                   	nop
   257aa:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   257b1:	00 00 00 00 
   257b5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   257bc:	00 00 00 00 
   257c0:	48 83 c3 10          	add    $0x10,%rbx
   257c4:	4c 39 e3             	cmp    %r12,%rbx
   257c7:	74 47                	je     25810 <JS_CallInternal+0x500>
   257c9:	48 8b 53 08          	mov    0x8(%rbx),%rdx
   257cd:	83 fa f6             	cmp    $0xfffffff6,%edx
   257d0:	76 ee                	jbe    257c0 <JS_CallInternal+0x4b0>
   257d2:	48 8b 33             	mov    (%rbx),%rsi
   257d5:	8b 46 fc             	mov    -0x4(%rsi),%eax
   257d8:	83 e8 01             	sub    $0x1,%eax
   257db:	89 46 fc             	mov    %eax,-0x4(%rsi)
   257de:	85 c0                	test   %eax,%eax
   257e0:	7f de                	jg     257c0 <JS_CallInternal+0x4b0>
   257e2:	49 8b 78 10          	mov    0x10(%r8),%rdi
   257e6:	48 83 c3 10          	add    $0x10,%rbx
   257ea:	4c 89 85 30 fe ff ff 	mov    %r8,-0x1d0(%rbp)
   257f1:	e8 7a 90 ff ff       	call   1e870 <__JS_FreeValueRT>
   257f6:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   257fd:	4c 39 e3             	cmp    %r12,%rbx
   25800:	75 c7                	jne    257c9 <JS_CallInternal+0x4b9>
   25802:	0f 1f 00             	nopl   (%rax)
   25805:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2580c:	00 00 00 00 
   25810:	4c 89 e8             	mov    %r13,%rax
   25813:	48 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%rbx
   2581a:	4d 89 c5             	mov    %r8,%r13
   2581d:	44 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%r9d
   25824:	4c 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8
   2582b:	41 83 c1 01          	add    $0x1,%r9d
   2582f:	4d 8d 67 01          	lea    0x1(%r15),%r12
   25833:	4d 63 c9             	movslq %r9d,%r9
   25836:	49 c1 e1 04          	shl    $0x4,%r9
   2583a:	4c 29 cb             	sub    %r9,%rbx
   2583d:	48 89 da             	mov    %rbx,%rdx
   25840:	48 8d 5b 10          	lea    0x10(%rbx),%rbx
   25844:	4c 89 02             	mov    %r8,(%rdx)
   25847:	48 89 42 08          	mov    %rax,0x8(%rdx)
   2584b:	41 0f b6 07          	movzbl (%r15),%eax
   2584f:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   25853:	49 89 c2             	mov    %rax,%r10
   25856:	b8 01 00 00 00       	mov    $0x1,%eax
   2585b:	ff e2                	jmp    *%rdx
   2585d:	f3 0f 1e fa          	endbr64
   25861:	f3 0f 1e fa          	endbr64
   25865:	41 8b 04 24          	mov    (%r12),%eax
   25869:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   2586d:	31 f6                	xor    %esi,%esi
   2586f:	ba 02 00 00 00       	mov    $0x2,%edx
   25874:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   2587b:	4c 89 ef             	mov    %r13,%rdi
   2587e:	b9 01 00 00 00       	mov    $0x1,%ecx
   25883:	4d 8d 7c 24 06       	lea    0x6(%r12),%r15
   25888:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2588e:	41 0f b7 44 24 04    	movzwl 0x4(%r12),%eax
   25894:	44 89 95 f0 fd ff ff 	mov    %r10d,-0x210(%rbp)
   2589b:	66 89 85 00 fe ff ff 	mov    %ax,-0x200(%rbp)
   258a2:	e8 89 55 02 00       	call   4ae30 <JS_NewObjectProtoClass>
   258a7:	48 89 03             	mov    %rax,(%rbx)
   258aa:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   258ae:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   258b2:	0f 84 fe 03 00 00    	je     25cb6 <JS_CallInternal+0x9a6>
   258b8:	44 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%r10d
   258bf:	41 83 fa 78          	cmp    $0x78,%r10d
   258c3:	0f 85 c2 03 00 00    	jne    25c8b <JS_CallInternal+0x97b>
   258c9:	0f b7 85 00 fe ff ff 	movzwl -0x200(%rbp),%eax
   258d0:	48 8b 8d 88 fe ff ff 	mov    -0x178(%rbp),%rcx
   258d7:	4c 8b 04 c1          	mov    (%rcx,%rax,8),%r8
   258db:	41 83 40 fc 01       	addl   $0x1,-0x4(%r8)
   258e0:	48 8b 33             	mov    (%rbx),%rsi
   258e3:	8b 95 30 fe ff ff    	mov    -0x1d0(%rbp),%edx
   258e9:	b9 22 00 00 00       	mov    $0x22,%ecx
   258ee:	4c 89 ef             	mov    %r13,%rdi
   258f1:	4c 89 85 00 fe ff ff 	mov    %r8,-0x200(%rbp)
   258f8:	e8 a3 49 02 00       	call   4a2a0 <add_property>
   258fd:	4c 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%r8
   25904:	48 85 c0             	test   %rax,%rax
   25907:	0f 84 4b 97 00 00    	je     2f058 <JS_CallInternal+0x9d48>
   2590d:	4c 89 00             	mov    %r8,(%rax)
   25910:	8b b5 30 fe ff ff    	mov    -0x1d0(%rbp),%esi
   25916:	31 d2                	xor    %edx,%edx
   25918:	4c 89 ef             	mov    %r13,%rdi
   2591b:	48 83 c3 20          	add    $0x20,%rbx
   2591f:	49 83 c4 07          	add    $0x7,%r12
   25923:	e8 d8 63 01 00       	call   3bd00 <__JS_AtomToValue>
   25928:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   2592f:	48 89 51 08          	mov    %rdx,0x8(%rcx)
   25933:	48 89 01             	mov    %rax,(%rcx)
   25936:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2593c:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   25940:	49 89 c2             	mov    %rax,%r10
   25943:	b8 01 00 00 00       	mov    $0x1,%eax
   25948:	ff e2                	jmp    *%rdx
   2594a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   25950:	e8 eb 0a 01 00       	call   36440 <__js_poll_interrupts>
   25955:	85 c0                	test   %eax,%eax
   25957:	0f 84 5a fa ff ff    	je     253b7 <JS_CallInternal+0xa7>
   2595d:	31 c0                	xor    %eax,%eax
   2595f:	ba 06 00 00 00       	mov    $0x6,%edx
   25964:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   25968:	64 48 2b 0c 25 28 00 	sub    %fs:0x28,%rcx
   2596f:	00 00 
   25971:	0f 85 e9 a5 00 00    	jne    2ff60 <JS_CallInternal+0xac50>
   25977:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
   2597b:	5b                   	pop    %rbx
   2597c:	41 5c                	pop    %r12
   2597e:	41 5d                	pop    %r13
   25980:	41 5e                	pop    %r14
   25982:	41 5f                	pop    %r15
   25984:	5d                   	pop    %rbp
   25985:	c3                   	ret
   25986:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   2598d:	00 00 00 
   25990:	f6 45 28 04          	testb  $0x4,0x28(%rbp)
   25994:	0f 84 c6 03 00 00    	je     25d60 <JS_CallInternal+0xa50>
   2599a:	48 8b 85 c8 fe ff ff 	mov    -0x138(%rbp),%rax
   259a1:	48 8b 48 58          	mov    0x58(%rax),%rcx
   259a5:	48 8b 78 70          	mov    0x70(%rax),%rdi
   259a9:	48 8d 70 50          	lea    0x50(%rax),%rsi
   259ad:	48 8b 50 68          	mov    0x68(%rax),%rdx
   259b1:	48 89 b5 b8 fe ff ff 	mov    %rsi,-0x148(%rbp)
   259b8:	48 8b 59 28          	mov    0x28(%rcx),%rbx
   259bc:	48 89 8d 40 fe ff ff 	mov    %rcx,-0x1c0(%rbp)
   259c3:	48 8b 49 30          	mov    0x30(%rcx),%rcx
   259c7:	48 89 bd a0 fe ff ff 	mov    %rdi,-0x160(%rbp)
   259ce:	4c 8b 6b 48          	mov    0x48(%rbx),%r13
   259d2:	48 89 9d c0 fe ff ff 	mov    %rbx,-0x140(%rbp)
   259d9:	48 89 8d 88 fe ff ff 	mov    %rcx,-0x178(%rbp)
   259e0:	48 89 c1             	mov    %rax,%rcx
   259e3:	0f b7 43 3a          	movzwl 0x3a(%rbx),%eax
   259e7:	44 8b 59 24          	mov    0x24(%rcx),%r11d
   259eb:	48 8b 99 90 00 00 00 	mov    0x90(%rcx),%rbx
   259f2:	48 89 95 28 fe ff ff 	mov    %rdx,-0x1d8(%rbp)
   259f9:	48 c1 e0 04          	shl    $0x4,%rax
   259fd:	4c 8b b9 80 00 00 00 	mov    0x80(%rcx),%r15
   25a04:	48 c7 81 90 00 00 00 	movq   $0x0,0x90(%rcx)
   25a0b:	00 00 00 00 
   25a0f:	48 01 f8             	add    %rdi,%rax
   25a12:	48 8b bd b0 fe ff ff 	mov    -0x150(%rbp),%rdi
   25a19:	48 89 85 48 fe ff ff 	mov    %rax,-0x1b8(%rbp)
   25a20:	48 8b 87 f0 04 00 00 	mov    0x4f0(%rdi),%rax
   25a27:	48 89 41 50          	mov    %rax,0x50(%rcx)
   25a2b:	48 89 b7 f0 04 00 00 	mov    %rsi,0x4f0(%rdi)
   25a32:	45 85 db             	test   %r11d,%r11d
   25a35:	0f 84 87 02 00 00    	je     25cc2 <JS_CallInternal+0x9b2>
   25a3b:	48 8b 85 28 fe ff ff 	mov    -0x1d8(%rbp),%rax
   25a42:	48 89 85 80 fe ff ff 	mov    %rax,-0x180(%rbp)
   25a49:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   25a50:	48 8b 85 b0 fe ff ff 	mov    -0x150(%rbp),%rax
   25a57:	83 b8 e0 04 00 00 ff 	cmpl   $0xffffffff,0x4e0(%rax)
   25a5e:	75 41                	jne    25aa1 <JS_CallInternal+0x791>
   25a60:	48 8b 80 d8 04 00 00 	mov    0x4d8(%rax),%rax
   25a67:	66 83 78 12 03       	cmpw   $0x3,0x12(%rax)
   25a6c:	75 33                	jne    25aa1 <JS_CallInternal+0x791>
   25a6e:	48 8b 48 18          	mov    0x18(%rax),%rcx
   25a72:	8b 51 18             	mov    0x18(%rcx),%edx
   25a75:	89 d0                	mov    %edx,%eax
   25a77:	83 e0 39             	and    $0x39,%eax
   25a7a:	8b 44 81 38          	mov    0x38(%rcx,%rax,4),%eax
   25a7e:	48 85 c0             	test   %rax,%rax
   25a81:	0f 84 c9 6f 00 00    	je     2ca50 <JS_CallInternal+0x7740>
   25a87:	48 8d 14 95 3c 00 00 	lea    0x3c(,%rdx,4),%rdx
   25a8e:	00 
   25a8f:	48 8d 44 c2 f8       	lea    -0x8(%rdx,%rax,8),%rax
   25a94:	48 01 c8             	add    %rcx,%rax
   25a97:	83 78 04 39          	cmpl   $0x39,0x4(%rax)
   25a9b:	0f 85 a2 6f 00 00    	jne    2ca43 <JS_CallInternal+0x7733>
   25aa1:	48 8b 85 b0 fe ff ff 	mov    -0x150(%rbp),%rax
   25aa8:	80 b8 e8 04 00 00 00 	cmpb   $0x0,0x4e8(%rax)
   25aaf:	0f 84 a8 01 00 00    	je     25c5d <JS_CallInternal+0x94d>
   25ab5:	48 8b 85 c0 fe ff ff 	mov    -0x140(%rbp),%rax
   25abc:	f6 40 11 30          	testb  $0x30,0x11(%rax)
   25ac0:	0f 84 41 69 00 00    	je     2c407 <JS_CallInternal+0x70f7>
   25ac6:	4d 89 fc             	mov    %r15,%r12
   25ac9:	b8 06 00 00 00       	mov    $0x6,%eax
   25ace:	31 c9                	xor    %ecx,%ecx
   25ad0:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   25ad7:	4c 89 66 30          	mov    %r12,0x30(%rsi)
   25adb:	48 89 5e 40          	mov    %rbx,0x40(%rsi)
   25adf:	48 8b 9d b8 fe ff ff 	mov    -0x148(%rbp),%rbx
   25ae6:	48 8b 13             	mov    (%rbx),%rdx
   25ae9:	48 8b 9d b0 fe ff ff 	mov    -0x150(%rbp),%rbx
   25af0:	48 89 93 f0 04 00 00 	mov    %rdx,0x4f0(%rbx)
   25af7:	48 89 c2             	mov    %rax,%rdx
   25afa:	48 89 c8             	mov    %rcx,%rax
   25afd:	e9 62 fe ff ff       	jmp    25964 <JS_CallInternal+0x654>
   25b02:	f3 0f 1e fa          	endbr64
   25b06:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   25b0a:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   25b0e:	48 83 eb 10          	sub    $0x10,%rbx
   25b12:	48 8b b5 c0 fe ff ff 	mov    -0x140(%rbp),%rsi
   25b19:	66 83 7e 40 00       	cmpw   $0x0,0x40(%rsi)
   25b1e:	0f 85 9c 76 00 00    	jne    2d1c0 <JS_CallInternal+0x7eb0>
   25b24:	4c 8b a5 28 fe ff ff 	mov    -0x1d8(%rbp),%r12
   25b2b:	49 39 dc             	cmp    %rbx,%r12
   25b2e:	73 af                	jae    25adf <JS_CallInternal+0x7cf>
   25b30:	49 89 c6             	mov    %rax,%r14
   25b33:	49 89 cf             	mov    %rcx,%r15
   25b36:	eb 15                	jmp    25b4d <JS_CallInternal+0x83d>
   25b38:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   25b3f:	00 
   25b40:	49 83 c4 10          	add    $0x10,%r12
   25b44:	49 39 dc             	cmp    %rbx,%r12
   25b47:	0f 83 c1 00 00 00    	jae    25c0e <JS_CallInternal+0x8fe>
   25b4d:	49 8b 74 24 08       	mov    0x8(%r12),%rsi
   25b52:	83 fe f6             	cmp    $0xfffffff6,%esi
   25b55:	76 e9                	jbe    25b40 <JS_CallInternal+0x830>
   25b57:	49 8b 14 24          	mov    (%r12),%rdx
   25b5b:	8b 42 fc             	mov    -0x4(%rdx),%eax
   25b5e:	83 e8 01             	sub    $0x1,%eax
   25b61:	89 42 fc             	mov    %eax,-0x4(%rdx)
   25b64:	85 c0                	test   %eax,%eax
   25b66:	7f d8                	jg     25b40 <JS_CallInternal+0x830>
   25b68:	48 89 d0             	mov    %rdx,%rax
   25b6b:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   25b6f:	48 89 f2             	mov    %rsi,%rdx
   25b72:	48 89 c6             	mov    %rax,%rsi
   25b75:	e8 f6 8c ff ff       	call   1e870 <__JS_FreeValueRT>
   25b7a:	eb c4                	jmp    25b40 <JS_CallInternal+0x830>
   25b7c:	48 8b 8d b0 fe ff ff 	mov    -0x150(%rbp),%rcx
   25b83:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
   25b87:	48 c1 e0 03          	shl    $0x3,%rax
   25b8b:	48 03 81 58 04 00 00 	add    0x458(%rcx),%rax
   25b92:	48 8b 40 18          	mov    0x18(%rax),%rax
   25b96:	48 85 c0             	test   %rax,%rax
   25b99:	0f 84 c1 01 00 00    	je     25d60 <JS_CallInternal+0xa50>
   25b9f:	8b 5d 28             	mov    0x28(%rbp),%ebx
   25ba2:	44 8b 8d a8 fe ff ff 	mov    -0x158(%rbp),%r9d
   25ba9:	4c 89 f1             	mov    %r14,%rcx
   25bac:	4d 89 f8             	mov    %r15,%r8
   25baf:	48 8b bd 90 fe ff ff 	mov    -0x170(%rbp),%rdi
   25bb6:	4c 89 e6             	mov    %r12,%rsi
   25bb9:	4c 89 ea             	mov    %r13,%rdx
   25bbc:	53                   	push   %rbx
   25bbd:	ff b5 98 fe ff ff    	push   -0x168(%rbp)
   25bc3:	ff d0                	call   *%rax
   25bc5:	41 59                	pop    %r9
   25bc7:	41 5a                	pop    %r10
   25bc9:	e9 96 fd ff ff       	jmp    25964 <JS_CallInternal+0x654>
   25bce:	8b b5 f0 fd ff ff    	mov    -0x210(%rbp),%esi
   25bd4:	31 d2                	xor    %edx,%edx
   25bd6:	4c 89 ef             	mov    %r13,%rdi
   25bd9:	48 83 c3 10          	add    $0x10,%rbx
   25bdd:	e8 1e 61 01 00       	call   3bd00 <__JS_AtomToValue>
   25be2:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   25be6:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   25bea:	8b 85 20 fe ff ff    	mov    -0x1e0(%rbp),%eax
   25bf0:	83 e8 05             	sub    $0x5,%eax
   25bf3:	48 98                	cltq
   25bf5:	49 01 c7             	add    %rax,%r15
   25bf8:	41 0f b6 07          	movzbl (%r15),%eax
   25bfc:	4d 8d 67 01          	lea    0x1(%r15),%r12
   25c00:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   25c04:	49 89 c2             	mov    %rax,%r10
   25c07:	b8 01 00 00 00       	mov    $0x1,%eax
   25c0c:	ff e2                	jmp    *%rdx
   25c0e:	4c 89 f0             	mov    %r14,%rax
   25c11:	4c 89 f9             	mov    %r15,%rcx
   25c14:	e9 c6 fe ff ff       	jmp    25adf <JS_CallInternal+0x7cf>
   25c19:	48 8b bd 90 fe ff ff 	mov    -0x170(%rbp),%rdi
   25c20:	48 8d 35 a7 38 0b 00 	lea    0xb38a7(%rip),%rsi        # d94ce <_IO_stdin_used+0x4ce>
   25c27:	31 c0                	xor    %eax,%eax
   25c29:	e8 52 07 01 00       	call   36380 <JS_ThrowInternalError>
   25c2e:	e9 31 fd ff ff       	jmp    25964 <JS_CallInternal+0x654>
   25c33:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   25c37:	48 89 ce             	mov    %rcx,%rsi
   25c3a:	4c 89 e2             	mov    %r12,%rdx
   25c3d:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   25c44:	e8 27 8c ff ff       	call   1e870 <__JS_FreeValueRT>
   25c49:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   25c50:	41 83 fc 05          	cmp    $0x5,%r12d
   25c54:	0f 84 fb 68 00 00    	je     2c555 <JS_CallInternal+0x7245>
   25c5a:	4c 89 f3             	mov    %r14,%rbx
   25c5d:	48 39 9d 48 fe ff ff 	cmp    %rbx,-0x1b8(%rbp)
   25c64:	0f 83 4b fe ff ff    	jae    25ab5 <JS_CallInternal+0x7a5>
   25c6a:	4c 8b 63 f8          	mov    -0x8(%rbx),%r12
   25c6e:	4c 8d 73 f0          	lea    -0x10(%rbx),%r14
   25c72:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   25c76:	41 83 fc f6          	cmp    $0xfffffff6,%r12d
   25c7a:	76 d4                	jbe    25c50 <JS_CallInternal+0x940>
   25c7c:	8b 41 fc             	mov    -0x4(%rcx),%eax
   25c7f:	83 e8 01             	sub    $0x1,%eax
   25c82:	89 41 fc             	mov    %eax,-0x4(%rcx)
   25c85:	85 c0                	test   %eax,%eax
   25c87:	7f c7                	jg     25c50 <JS_CallInternal+0x940>
   25c89:	eb a8                	jmp    25c33 <JS_CallInternal+0x923>
   25c8b:	31 c9                	xor    %ecx,%ecx
   25c8d:	0f b7 95 00 fe ff ff 	movzwl -0x200(%rbp),%edx
   25c94:	41 83 fa 77          	cmp    $0x77,%r10d
   25c98:	4c 89 ef             	mov    %r13,%rdi
   25c9b:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   25ca2:	0f 94 c1             	sete   %cl
   25ca5:	e8 86 3f 02 00       	call   49c30 <get_var_ref>
   25caa:	49 89 c0             	mov    %rax,%r8
   25cad:	48 85 c0             	test   %rax,%rax
   25cb0:	0f 85 2a fc ff ff    	jne    258e0 <JS_CallInternal+0x5d0>
   25cb6:	48 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%rbx
   25cbd:	e9 8e fd ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   25cc2:	48 89 95 80 fe ff ff 	mov    %rdx,-0x180(%rbp)
   25cc9:	e9 03 f9 ff ff       	jmp    255d1 <JS_CallInternal+0x2c1>
   25cce:	48 83 ec 08          	sub    $0x8,%rsp
   25cd2:	4d 89 e1             	mov    %r12,%r9
   25cd5:	4c 89 e2             	mov    %r12,%rdx
   25cd8:	4c 89 ef             	mov    %r13,%rdi
   25cdb:	44 89 95 10 fe ff ff 	mov    %r10d,-0x1f0(%rbp)
   25ce2:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   25ce9:	b9 f1 00 00 00       	mov    $0xf1,%ecx
   25cee:	6a 00                	push   $0x0
   25cf0:	48 8b b5 e8 fd ff ff 	mov    -0x218(%rbp),%rsi
   25cf7:	e8 f4 a4 00 00       	call   301f0 <JS_GetPropertyInternal>
   25cfc:	5e                   	pop    %rsi
   25cfd:	5f                   	pop    %rdi
   25cfe:	49 89 c0             	mov    %rax,%r8
   25d01:	49 89 d4             	mov    %rdx,%r12
   25d04:	83 fa 06             	cmp    $0x6,%edx
   25d07:	0f 84 43 fd ff ff    	je     25a50 <JS_CallInternal+0x740>
   25d0d:	83 fa ff             	cmp    $0xffffffff,%edx
   25d10:	44 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10d
   25d17:	0f 84 ee 5f 00 00    	je     2bd0b <JS_CallInternal+0x69fb>
   25d1d:	83 fa f6             	cmp    $0xfffffff6,%edx
   25d20:	0f 86 a7 f9 ff ff    	jbe    256cd <JS_CallInternal+0x3bd>
   25d26:	8b 40 fc             	mov    -0x4(%rax),%eax
   25d29:	83 e8 01             	sub    $0x1,%eax
   25d2c:	41 89 40 fc          	mov    %eax,-0x4(%r8)
   25d30:	85 c0                	test   %eax,%eax
   25d32:	0f 8f 95 f9 ff ff    	jg     256cd <JS_CallInternal+0x3bd>
   25d38:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   25d3c:	4c 89 c6             	mov    %r8,%rsi
   25d3f:	44 89 95 10 fe ff ff 	mov    %r10d,-0x1f0(%rbp)
   25d46:	e8 25 8b ff ff       	call   1e870 <__JS_FreeValueRT>
   25d4b:	44 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10d
   25d52:	e9 76 f9 ff ff       	jmp    256cd <JS_CallInternal+0x3bd>
   25d57:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   25d5e:	00 00 
   25d60:	48 8b bd 90 fe ff ff 	mov    -0x170(%rbp),%rdi
   25d67:	48 8d 35 14 4e 0b 00 	lea    0xb4e14(%rip),%rsi        # dab82 <_IO_stdin_used+0x1b82>
   25d6e:	31 c0                	xor    %eax,%eax
   25d70:	e8 1b e4 00 00       	call   34190 <JS_ThrowTypeError>
   25d75:	e9 ea fb ff ff       	jmp    25964 <JS_CallInternal+0x654>
   25d7a:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   25d81:	48 8b 95 38 fe ff ff 	mov    -0x1c8(%rbp),%rdx
   25d88:	4c 89 ef             	mov    %r13,%rdi
   25d8b:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   25d91:	48 89 c6             	mov    %rax,%rsi
   25d94:	48 89 95 10 fe ff ff 	mov    %rdx,-0x1f0(%rbp)
   25d9b:	49 89 c4             	mov    %rax,%r12
   25d9e:	e8 fd a4 04 00       	call   702a0 <JS_HasProperty>
   25da3:	48 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%rdx
   25daa:	85 c0                	test   %eax,%eax
   25dac:	0f 8e f6 93 00 00    	jle    2f1a8 <JS_CallInternal+0x9e98>
   25db2:	48 83 ec 08          	sub    $0x8,%rsp
   25db6:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   25dbc:	49 89 d1             	mov    %rdx,%r9
   25dbf:	4c 89 e6             	mov    %r12,%rsi
   25dc2:	6a 00                	push   $0x0
   25dc4:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   25dcb:	4c 89 ef             	mov    %r13,%rdi
   25dce:	e8 1d a4 00 00       	call   301f0 <JS_GetPropertyInternal>
   25dd3:	41 59                	pop    %r9
   25dd5:	41 5a                	pop    %r10
   25dd7:	48 89 c1             	mov    %rax,%rcx
   25dda:	48 89 d0             	mov    %rdx,%rax
   25ddd:	83 fa 06             	cmp    $0x6,%edx
   25de0:	0f 84 6a fc ff ff    	je     25a50 <JS_CallInternal+0x740>
   25de6:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   25dea:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   25dee:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   25df2:	48 89 4b f0          	mov    %rcx,-0x10(%rbx)
   25df6:	83 fa f6             	cmp    $0xfffffff6,%edx
   25df9:	0f 86 eb fd ff ff    	jbe    25bea <JS_CallInternal+0x8da>
   25dff:	8b 46 fc             	mov    -0x4(%rsi),%eax
   25e02:	83 e8 01             	sub    $0x1,%eax
   25e05:	89 46 fc             	mov    %eax,-0x4(%rsi)
   25e08:	85 c0                	test   %eax,%eax
   25e0a:	0f 8f da fd ff ff    	jg     25bea <JS_CallInternal+0x8da>
   25e10:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   25e14:	e8 57 8a ff ff       	call   1e870 <__JS_FreeValueRT>
   25e19:	e9 cc fd ff ff       	jmp    25bea <JS_CallInternal+0x8da>
   25e1e:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   25e25:	48 8b 95 38 fe ff ff 	mov    -0x1c8(%rbp),%rdx
   25e2c:	4c 89 ef             	mov    %r13,%rdi
   25e2f:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   25e35:	48 89 c6             	mov    %rax,%rsi
   25e38:	48 89 95 10 fe ff ff 	mov    %rdx,-0x1f0(%rbp)
   25e3f:	49 89 c4             	mov    %rax,%r12
   25e42:	e8 59 a4 04 00       	call   702a0 <JS_HasProperty>
   25e47:	85 c0                	test   %eax,%eax
   25e49:	0f 88 01 fc ff ff    	js     25a50 <JS_CallInternal+0x740>
   25e4f:	48 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%rdx
   25e56:	b8 03 00 00 00       	mov    $0x3,%eax
   25e5b:	b9 00 00 00 00       	mov    $0x0,%ecx
   25e60:	0f 85 ee 7b 00 00    	jne    2da54 <JS_CallInternal+0x8744>
   25e66:	48 89 0b             	mov    %rcx,(%rbx)
   25e69:	48 83 c3 10          	add    $0x10,%rbx
   25e6d:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   25e71:	e9 74 fd ff ff       	jmp    25bea <JS_CallInternal+0x8da>
   25e76:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   25e7d:	48 8b 95 38 fe ff ff 	mov    -0x1c8(%rbp),%rdx
   25e84:	45 31 c0             	xor    %r8d,%r8d
   25e87:	4c 89 ef             	mov    %r13,%rdi
   25e8a:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   25e90:	48 89 c6             	mov    %rax,%rsi
   25e93:	e8 18 81 02 00       	call   4dfb0 <JS_DeleteProperty>
   25e98:	41 89 c4             	mov    %eax,%r12d
   25e9b:	85 c0                	test   %eax,%eax
   25e9d:	0f 88 ad fb ff ff    	js     25a50 <JS_CallInternal+0x740>
   25ea3:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   25ea7:	83 f8 f6             	cmp    $0xfffffff6,%eax
   25eaa:	76 15                	jbe    25ec1 <JS_CallInternal+0xbb1>
   25eac:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   25eb0:	8b 71 fc             	mov    -0x4(%rcx),%esi
   25eb3:	8d 56 ff             	lea    -0x1(%rsi),%edx
   25eb6:	89 51 fc             	mov    %edx,-0x4(%rcx)
   25eb9:	85 d2                	test   %edx,%edx
   25ebb:	0f 8e 1e 93 00 00    	jle    2f1df <JS_CallInternal+0x9ecf>
   25ec1:	31 c0                	xor    %eax,%eax
   25ec3:	45 85 e4             	test   %r12d,%r12d
   25ec6:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   25ecd:	00 
   25ece:	0f 95 c0             	setne  %al
   25ed1:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   25ed5:	e9 10 fd ff ff       	jmp    25bea <JS_CallInternal+0x8da>
   25eda:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   25ee1:	48 8b 95 38 fe ff ff 	mov    -0x1c8(%rbp),%rdx
   25ee8:	4c 89 ef             	mov    %r13,%rdi
   25eeb:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   25ef1:	48 89 c6             	mov    %rax,%rsi
   25ef4:	e8 a7 a3 04 00       	call   702a0 <JS_HasProperty>
   25ef9:	85 c0                	test   %eax,%eax
   25efb:	0f 8e 3c 90 00 00    	jle    2ef3d <JS_CallInternal+0x9c2d>
   25f01:	48 83 ec 08          	sub    $0x8,%rsp
   25f05:	4c 8b 43 e0          	mov    -0x20(%rbx),%r8
   25f09:	4c 8b 4b e8          	mov    -0x18(%rbx),%r9
   25f0d:	4c 89 ef             	mov    %r13,%rdi
   25f10:	4c 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%r10
   25f17:	4c 8b 9d 38 fe ff ff 	mov    -0x1c8(%rbp),%r11
   25f1e:	68 00 80 00 00       	push   $0x8000
   25f23:	4c 8d 63 e0          	lea    -0x20(%rbx),%r12
   25f27:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   25f2d:	41 53                	push   %r11
   25f2f:	4c 89 d6             	mov    %r10,%rsi
   25f32:	4c 89 da             	mov    %r11,%rdx
   25f35:	41 52                	push   %r10
   25f37:	e8 04 b0 00 00       	call   30f40 <JS_SetPropertyInternal>
   25f3c:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   25f40:	48 83 c4 20          	add    $0x20,%rsp
   25f44:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   25f47:	76 15                	jbe    25f5e <JS_CallInternal+0xc4e>
   25f49:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   25f4d:	8b 5e fc             	mov    -0x4(%rsi),%ebx
   25f50:	8d 53 ff             	lea    -0x1(%rbx),%edx
   25f53:	89 56 fc             	mov    %edx,-0x4(%rsi)
   25f56:	85 d2                	test   %edx,%edx
   25f58:	0f 8e 0e 91 00 00    	jle    2f06c <JS_CallInternal+0x9d5c>
   25f5e:	4c 89 e3             	mov    %r12,%rbx
   25f61:	85 c0                	test   %eax,%eax
   25f63:	0f 89 81 fc ff ff    	jns    25bea <JS_CallInternal+0x8da>
   25f69:	e9 e2 fa ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   25f6e:	66 90                	xchg   %ax,%ax
   25f70:	f3 0f 1e fa          	endbr64
   25f74:	f3 0f 1e fa          	endbr64
   25f78:	31 c0                	xor    %eax,%eax
   25f7a:	b9 02 00 00 00       	mov    $0x2,%ecx
   25f7f:	e9 4c fb ff ff       	jmp    25ad0 <JS_CallInternal+0x7c0>
   25f84:	f3 0f 1e fa          	endbr64
   25f88:	f3 0f 1e fa          	endbr64
   25f8c:	48 83 ec 08          	sub    $0x8,%rsp
   25f90:	31 c0                	xor    %eax,%eax
   25f92:	41 83 fa 54          	cmp    $0x54,%r10d
   25f96:	41 0f b6 4c 24 04    	movzbl 0x4(%r12),%ecx
   25f9c:	0f 94 c0             	sete   %al
   25f9f:	41 8b 14 24          	mov    (%r12),%edx
   25fa3:	48 89 de             	mov    %rbx,%rsi
   25fa6:	4c 89 ef             	mov    %r13,%rdi
   25fa9:	50                   	push   %rax
   25faa:	4c 8b 8d b8 fe ff ff 	mov    -0x148(%rbp),%r9
   25fb1:	4d 8d 7c 24 05       	lea    0x5(%r12),%r15
   25fb6:	4c 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%r8
   25fbd:	e8 3e c8 06 00       	call   92800 <js_op_define_class>
   25fc2:	41 58                	pop    %r8
   25fc4:	41 59                	pop    %r9
   25fc6:	83 f8 ff             	cmp    $0xffffffff,%eax
   25fc9:	0f 84 81 fa ff ff    	je     25a50 <JS_CallInternal+0x740>
   25fcf:	41 0f b6 44 24 05    	movzbl 0x5(%r12),%eax
   25fd5:	49 83 c4 06          	add    $0x6,%r12
   25fd9:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   25fdd:	49 89 c2             	mov    %rax,%r10
   25fe0:	b8 01 00 00 00       	mov    $0x1,%eax
   25fe5:	ff e2                	jmp    *%rdx
   25fe7:	f3 0f 1e fa          	endbr64
   25feb:	f3 0f 1e fa          	endbr64
   25fef:	41 83 fa 52          	cmp    $0x52,%r10d
   25ff3:	0f 94 85 10 fe ff ff 	sete   -0x1f0(%rbp)
   25ffa:	0f 84 e9 66 00 00    	je     2c6e9 <JS_CallInternal+0x73d9>
   26000:	41 8b 04 24          	mov    (%r12),%eax
   26004:	4d 8d 7c 24 04       	lea    0x4(%r12),%r15
   26009:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2600f:	0f b6 8d 10 fe ff ff 	movzbl -0x1f0(%rbp),%ecx
   26016:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
   2601b:	41 0f b6 17          	movzbl (%r15),%edx
   2601f:	bf 03 00 00 00       	mov    $0x3,%edi
   26024:	48 c7 85 e0 fd ff ff 	movq   $0x0,-0x220(%rbp)
   2602b:	00 00 00 00 
   2602f:	29 c8                	sub    %ecx,%eax
   26031:	89 8d b4 fd ff ff    	mov    %ecx,-0x24c(%rbp)
   26037:	48 98                	cltq
   26039:	48 89 bd a8 fd ff ff 	mov    %rdi,-0x258(%rbp)
   26040:	48 c1 e0 04          	shl    $0x4,%rax
   26044:	48 89 bd 98 fd ff ff 	mov    %rdi,-0x268(%rbp)
   2604b:	48 c7 85 b8 fd ff ff 	movq   $0x3,-0x248(%rbp)
   26052:	03 00 00 00 
   26056:	48 01 d8             	add    %rbx,%rax
   26059:	48 8b 08             	mov    (%rax),%rcx
   2605c:	48 8b 40 08          	mov    0x8(%rax),%rax
   26060:	48 89 85 e8 fd ff ff 	mov    %rax,-0x218(%rbp)
   26067:	89 d0                	mov    %edx,%eax
   26069:	83 e0 04             	and    $0x4,%eax
   2606c:	48 89 8d 20 fe ff ff 	mov    %rcx,-0x1e0(%rbp)
   26073:	3c 01                	cmp    $0x1,%al
   26075:	19 c0                	sbb    %eax,%eax
   26077:	31 f6                	xor    %esi,%esi
   26079:	83 e0 fc             	and    $0xfffffffc,%eax
   2607c:	48 89 b5 a0 fd ff ff 	mov    %rsi,-0x260(%rbp)
   26083:	48 89 b5 90 fd ff ff 	mov    %rsi,-0x270(%rbp)
   2608a:	05 05 45 00 00       	add    $0x4505,%eax
   2608f:	83 e2 03             	and    $0x3,%edx
   26092:	0f 85 a6 5d 00 00    	jne    2be3e <JS_CallInternal+0x6b2e>
   26098:	0d 02 22 00 00       	or     $0x2202,%eax
   2609d:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   260a1:	4c 8d 63 f0          	lea    -0x10(%rbx),%r12
   260a5:	4c 89 ef             	mov    %r13,%rdi
   260a8:	89 85 b0 fd ff ff    	mov    %eax,-0x250(%rbp)
   260ae:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   260b2:	48 89 8d e0 fd ff ff 	mov    %rcx,-0x220(%rbp)
   260b9:	8b b5 30 fe ff ff    	mov    -0x1d0(%rbp),%esi
   260bf:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   260c6:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   260ca:	49 8b 44 24 08       	mov    0x8(%r12),%rax
   260cf:	48 89 8d b8 fd ff ff 	mov    %rcx,-0x248(%rbp)
   260d6:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   260dd:	e8 5e e1 01 00       	call   44240 <js_get_function_name>
   260e2:	49 89 c0             	mov    %rax,%r8
   260e5:	49 89 d1             	mov    %rdx,%r9
   260e8:	41 83 f9 06          	cmp    $0x6,%r9d
   260ec:	0f 84 a7 71 00 00    	je     2d299 <JS_CallInternal+0x7f89>
   260f2:	48 83 ec 08          	sub    $0x8,%rsp
   260f6:	48 8b b5 00 fe ff ff 	mov    -0x200(%rbp),%rsi
   260fd:	b9 3a 00 00 00       	mov    $0x3a,%ecx
   26102:	4c 89 ef             	mov    %r13,%rdi
   26105:	6a 01                	push   $0x1
   26107:	48 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%rdx
   2610e:	e8 4d d1 00 00       	call   33260 <JS_DefinePropertyValue>
   26113:	41 5a                	pop    %r10
   26115:	41 5b                	pop    %r11
   26117:	85 c0                	test   %eax,%eax
   26119:	0f 88 7a 71 00 00    	js     2d299 <JS_CallInternal+0x7f89>
   2611f:	48 8b 8d 20 fe ff ff 	mov    -0x1e0(%rbp),%rcx
   26126:	4c 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%r8
   2612d:	4c 89 ef             	mov    %r13,%rdi
   26130:	48 8b b5 00 fe ff ff 	mov    -0x200(%rbp),%rsi
   26137:	48 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%rdx
   2613e:	e8 cd a1 ff ff       	call   20310 <js_method_set_home_object>
   26143:	8b 85 b0 fd ff ff    	mov    -0x250(%rbp),%eax
   26149:	48 83 ec 08          	sub    $0x8,%rsp
   2614d:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   26153:	4c 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%r8
   2615a:	4c 8b 8d b8 fd ff ff 	mov    -0x248(%rbp),%r9
   26161:	4c 89 ef             	mov    %r13,%rdi
   26164:	48 8b b5 20 fe ff ff 	mov    -0x1e0(%rbp),%rsi
   2616b:	48 8b 95 e8 fd ff ff 	mov    -0x218(%rbp),%rdx
   26172:	50                   	push   %rax
   26173:	ff b5 98 fd ff ff    	push   -0x268(%rbp)
   26179:	ff b5 90 fd ff ff    	push   -0x270(%rbp)
   2617f:	ff b5 a8 fd ff ff    	push   -0x258(%rbp)
   26185:	ff b5 a0 fd ff ff    	push   -0x260(%rbp)
   2618b:	e8 40 c2 00 00       	call   323d0 <JS_DefineProperty>
   26190:	48 83 c4 30          	add    $0x30,%rsp
   26194:	89 c1                	mov    %eax,%ecx
   26196:	49 8b 44 24 08       	mov    0x8(%r12),%rax
   2619b:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2619e:	76 15                	jbe    261b5 <JS_CallInternal+0xea5>
   261a0:	49 8b 34 24          	mov    (%r12),%rsi
   261a4:	8b 56 fc             	mov    -0x4(%rsi),%edx
   261a7:	83 ea 01             	sub    $0x1,%edx
   261aa:	89 56 fc             	mov    %edx,-0x4(%rsi)
   261ad:	85 d2                	test   %edx,%edx
   261af:	0f 8e 3f 70 00 00    	jle    2d1f4 <JS_CallInternal+0x7ee4>
   261b5:	80 bd 10 fe ff ff 00 	cmpb   $0x0,-0x1f0(%rbp)
   261bc:	0f 85 2e 60 00 00    	jne    2c1f0 <JS_CallInternal+0x6ee0>
   261c2:	8b 85 b4 fd ff ff    	mov    -0x24c(%rbp),%eax
   261c8:	83 c0 01             	add    $0x1,%eax
   261cb:	48 98                	cltq
   261cd:	48 c1 e0 04          	shl    $0x4,%rax
   261d1:	48 29 c3             	sub    %rax,%rbx
   261d4:	85 c9                	test   %ecx,%ecx
   261d6:	0f 88 84 71 00 00    	js     2d360 <JS_CallInternal+0x8050>
   261dc:	41 0f b6 47 01       	movzbl 0x1(%r15),%eax
   261e1:	4d 8d 67 02          	lea    0x2(%r15),%r12
   261e5:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   261e9:	49 89 c2             	mov    %rax,%r10
   261ec:	b8 01 00 00 00       	mov    $0x1,%eax
   261f1:	ff e2                	jmp    *%rdx
   261f3:	f3 0f 1e fa          	endbr64
   261f7:	f3 0f 1e fa          	endbr64
   261fb:	31 f6                	xor    %esi,%esi
   261fd:	ba 02 00 00 00       	mov    $0x2,%edx
   26202:	41 80 7c 24 ff f9    	cmpb   $0xf9,-0x1(%r12)
   26208:	b9 03 00 00 00       	mov    $0x3,%ecx
   2620d:	48 0f 44 d6          	cmove  %rsi,%rdx
   26211:	be 01 00 00 00       	mov    $0x1,%esi
   26216:	48 0f 44 ce          	cmove  %rsi,%rcx
   2621a:	4c 01 e2             	add    %r12,%rdx
   2621d:	0f b6 3a             	movzbl (%rdx),%edi
   26220:	4c 8d 14 0a          	lea    (%rdx,%rcx,1),%r10
   26224:	45 8b 7a 01          	mov    0x1(%r10),%r15d
   26228:	8d b7 3d ff ff ff    	lea    -0xc3(%rdi),%esi
   2622e:	83 fe 03             	cmp    $0x3,%esi
   26231:	0f 86 34 5e 00 00    	jbe    2c06b <JS_CallInternal+0x6d5b>
   26237:	8d b7 31 ff ff ff    	lea    -0xcf(%rdi),%esi
   2623d:	83 fe 03             	cmp    $0x3,%esi
   26240:	0f 86 f0 63 00 00    	jbe    2c636 <JS_CallInternal+0x7326>
   26246:	81 ff f6 00 00 00    	cmp    $0xf6,%edi
   2624c:	0f 84 7e 72 00 00    	je     2d4d0 <JS_CallInternal+0x81c0>
   26252:	81 ff f7 00 00 00    	cmp    $0xf7,%edi
   26258:	0f 84 20 74 00 00    	je     2d67e <JS_CallInternal+0x836e>
   2625e:	83 ff 55             	cmp    $0x55,%edi
   26261:	0f 84 61 7a 00 00    	je     2dcc8 <JS_CallInternal+0x89b8>
   26267:	48 8b b5 a0 fe ff ff 	mov    -0x160(%rbp),%rsi
   2626e:	83 ff 58             	cmp    $0x58,%edi
   26271:	0f 84 51 7a 00 00    	je     2dcc8 <JS_CallInternal+0x89b8>
   26277:	48 8b 3e             	mov    (%rsi),%rdi
   2627a:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   2627e:	41 0f b6 72 05       	movzbl 0x5(%r10),%esi
   26283:	44 8d 4e 4e          	lea    0x4e(%rsi),%r9d
   26287:	41 80 f9 08          	cmp    $0x8,%r9b
   2628b:	0f 86 ed 5d 00 00    	jbe    2c07e <JS_CallInternal+0x6d6e>
   26291:	40 80 fe bb          	cmp    $0xbb,%sil
   26295:	0f 84 a9 73 00 00    	je     2d644 <JS_CallInternal+0x8334>
   2629b:	40 80 fe bc          	cmp    $0xbc,%sil
   2629f:	0f 84 c9 73 00 00    	je     2d66e <JS_CallInternal+0x835e>
   262a5:	45 31 db             	xor    %r11d,%r11d
   262a8:	40 80 fe 01          	cmp    $0x1,%sil
   262ac:	0f 84 5c 76 00 00    	je     2d90e <JS_CallInternal+0x85fe>
   262b2:	83 f8 01             	cmp    $0x1,%eax
   262b5:	75 0a                	jne    262c1 <JS_CallInternal+0xfb1>
   262b7:	41 83 f8 ff          	cmp    $0xffffffff,%r8d
   262bb:	0f 84 52 61 00 00    	je     2c413 <JS_CallInternal+0x7103>
   262c1:	48 8d 43 10          	lea    0x10(%rbx),%rax
   262c5:	41 83 f8 f6          	cmp    $0xfffffff6,%r8d
   262c9:	76 04                	jbe    262cf <JS_CallInternal+0xfbf>
   262cb:	83 47 fc 01          	addl   $0x1,-0x4(%rdi)
   262cf:	48 89 3b             	mov    %rdi,(%rbx)
   262d2:	49 01 cc             	add    %rcx,%r12
   262d5:	4c 89 43 08          	mov    %r8,0x8(%rbx)
   262d9:	0f b6 12             	movzbl (%rdx),%edx
   262dc:	48 89 c3             	mov    %rax,%rbx
   262df:	b8 01 00 00 00       	mov    $0x1,%eax
   262e4:	49 89 d2             	mov    %rdx,%r10
   262e7:	49 8b 14 d6          	mov    (%r14,%rdx,8),%rdx
   262eb:	ff e2                	jmp    *%rdx
   262ed:	f3 0f 1e fa          	endbr64
   262f1:	f3 0f 1e fa          	endbr64
   262f5:	41 0f b7 04 24       	movzwl (%r12),%eax
   262fa:	48 8b 8d 88 fe ff ff 	mov    -0x178(%rbp),%rcx
   26301:	4d 8d 7c 24 02       	lea    0x2(%r12),%r15
   26306:	48 8b 0c c1          	mov    (%rcx,%rax,8),%rcx
   2630a:	4c 8d 0c c5 00 00 00 	lea    0x0(,%rax,8),%r9
   26311:	00 
   26312:	48 8b 41 18          	mov    0x18(%rcx),%rax
   26316:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2631a:	83 fa 04             	cmp    $0x4,%edx
   2631d:	0f 84 34 65 00 00    	je     2c857 <JS_CallInternal+0x7547>
   26323:	80 79 12 00          	cmpb   $0x0,0x12(%rcx)
   26327:	0f 85 2a 65 00 00    	jne    2c857 <JS_CallInternal+0x7547>
   2632d:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   26332:	48 8b 08             	mov    (%rax),%rcx
   26335:	0f 11 00             	movups %xmm0,(%rax)
   26338:	83 fa f6             	cmp    $0xfffffff6,%edx
   2633b:	76 11                	jbe    2634e <JS_CallInternal+0x103e>
   2633d:	8b 41 fc             	mov    -0x4(%rcx),%eax
   26340:	83 e8 01             	sub    $0x1,%eax
   26343:	89 41 fc             	mov    %eax,-0x4(%rcx)
   26346:	85 c0                	test   %eax,%eax
   26348:	0f 8e 3a 6f 00 00    	jle    2d288 <JS_CallInternal+0x7f78>
   2634e:	48 83 eb 10          	sub    $0x10,%rbx
   26352:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   26358:	49 83 c4 03          	add    $0x3,%r12
   2635c:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   26360:	49 89 c2             	mov    %rax,%r10
   26363:	b8 01 00 00 00       	mov    $0x1,%eax
   26368:	ff e2                	jmp    *%rdx
   2636a:	f3 0f 1e fa          	endbr64
   2636e:	f3 0f 1e fa          	endbr64
   26372:	41 0f b7 04 24       	movzwl (%r12),%eax
   26377:	48 8b b5 88 fe ff ff 	mov    -0x178(%rbp),%rsi
   2637e:	4d 8d 7c 24 02       	lea    0x2(%r12),%r15
   26383:	48 8d 0c c5 00 00 00 	lea    0x0(,%rax,8),%rcx
   2638a:	00 
   2638b:	48 8b 04 c6          	mov    (%rsi,%rax,8),%rax
   2638f:	48 8b 40 18          	mov    0x18(%rax),%rax
   26393:	48 8b 10             	mov    (%rax),%rdx
   26396:	48 8b 40 08          	mov    0x8(%rax),%rax
   2639a:	83 f8 04             	cmp    $0x4,%eax
   2639d:	0f 84 a9 70 00 00    	je     2d44c <JS_CallInternal+0x813c>
   263a3:	83 f8 f6             	cmp    $0xfffffff6,%eax
   263a6:	76 04                	jbe    263ac <JS_CallInternal+0x109c>
   263a8:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   263ac:	48 89 13             	mov    %rdx,(%rbx)
   263af:	48 89 43 08          	mov    %rax,0x8(%rbx)
   263b3:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   263b9:	48 83 c3 10          	add    $0x10,%rbx
   263bd:	49 83 c4 03          	add    $0x3,%r12
   263c1:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   263c5:	49 89 c2             	mov    %rax,%r10
   263c8:	b8 01 00 00 00       	mov    $0x1,%eax
   263cd:	ff e2                	jmp    *%rdx
   263cf:	f3 0f 1e fa          	endbr64
   263d3:	f3 0f 1e fa          	endbr64
   263d7:	45 0f b7 0c 24       	movzwl (%r12),%r9d
   263dc:	4d 8d 7c 24 02       	lea    0x2(%r12),%r15
   263e1:	4c 89 ef             	mov    %r13,%rdi
   263e4:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   263eb:	44 89 95 f0 fd ff ff 	mov    %r10d,-0x210(%rbp)
   263f2:	45 0f b7 d9          	movzwl %r9w,%r11d
   263f6:	4c 89 7e 30          	mov    %r15,0x30(%rsi)
   263fa:	49 c1 e3 04          	shl    $0x4,%r11
   263fe:	44 89 8d 10 fe ff ff 	mov    %r9d,-0x1f0(%rbp)
   26405:	4c 89 d8             	mov    %r11,%rax
   26408:	49 89 db             	mov    %rbx,%r11
   2640b:	49 29 c3             	sub    %rax,%r11
   2640e:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   26415:	49 8b 73 f0          	mov    -0x10(%r11),%rsi
   26419:	49 8b 4b e0          	mov    -0x20(%r11),%rcx
   2641d:	4d 8b 43 e8          	mov    -0x18(%r11),%r8
   26421:	49 8b 53 f8          	mov    -0x8(%r11),%rdx
   26425:	6a 00                	push   $0x0
   26427:	41 53                	push   %r11
   26429:	4c 89 9d 00 fe ff ff 	mov    %r11,-0x200(%rbp)
   26430:	6a 03                	push   $0x3
   26432:	6a 00                	push   $0x0
   26434:	e8 d7 ee ff ff       	call   25310 <JS_CallInternal>
   26439:	48 83 c4 20          	add    $0x20,%rsp
   2643d:	48 89 c6             	mov    %rax,%rsi
   26440:	48 89 d0             	mov    %rdx,%rax
   26443:	83 fa 06             	cmp    $0x6,%edx
   26446:	0f 84 04 f6 ff ff    	je     25a50 <JS_CallInternal+0x740>
   2644c:	48 89 f1             	mov    %rsi,%rcx
   2644f:	83 bd f0 fd ff ff 25 	cmpl   $0x25,-0x210(%rbp)
   26456:	0f 84 b6 f6 ff ff    	je     25b12 <JS_CallInternal+0x802>
   2645c:	4c 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%r11
   26463:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2646a:	4c 89 a5 00 fe ff ff 	mov    %r12,-0x200(%rbp)
   26471:	48 89 9d 30 fe ff ff 	mov    %rbx,-0x1d0(%rbp)
   26478:	48 89 b5 f0 fd ff ff 	mov    %rsi,-0x210(%rbp)
   2647f:	4d 8d 7b e0          	lea    -0x20(%r11),%r15
   26483:	4e 8d 24 19          	lea    (%rcx,%r11,1),%r12
   26487:	eb 24                	jmp    264ad <JS_CallInternal+0x119d>
   26489:	90                   	nop
   2648a:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   26491:	00 00 00 00 
   26495:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2649c:	00 00 00 00 
   264a0:	49 83 c7 10          	add    $0x10,%r15
   264a4:	4d 39 e7             	cmp    %r12,%r15
   264a7:	0f 84 fc 58 00 00    	je     2bda9 <JS_CallInternal+0x6a99>
   264ad:	49 8b 4f 08          	mov    0x8(%r15),%rcx
   264b1:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   264b4:	76 ea                	jbe    264a0 <JS_CallInternal+0x1190>
   264b6:	49 8b 37             	mov    (%r15),%rsi
   264b9:	8b 5e fc             	mov    -0x4(%rsi),%ebx
   264bc:	8d 53 ff             	lea    -0x1(%rbx),%edx
   264bf:	89 56 fc             	mov    %edx,-0x4(%rsi)
   264c2:	85 d2                	test   %edx,%edx
   264c4:	7f da                	jg     264a0 <JS_CallInternal+0x1190>
   264c6:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   264ca:	48 89 ca             	mov    %rcx,%rdx
   264cd:	48 89 85 20 fe ff ff 	mov    %rax,-0x1e0(%rbp)
   264d4:	e8 97 83 ff ff       	call   1e870 <__JS_FreeValueRT>
   264d9:	48 8b 85 20 fe ff ff 	mov    -0x1e0(%rbp),%rax
   264e0:	eb be                	jmp    264a0 <JS_CallInternal+0x1190>
   264e2:	f3 0f 1e fa          	endbr64
   264e6:	f3 0f 1e fa          	endbr64
   264ea:	45 0f b7 0c 24       	movzwl (%r12),%r9d
   264ef:	4d 8d 7c 24 02       	lea    0x2(%r12),%r15
   264f4:	e9 05 f2 ff ff       	jmp    256fe <JS_CallInternal+0x3ee>
   264f9:	f3 0f 1e fa          	endbr64
   264fd:	f3 0f 1e fa          	endbr64
   26501:	48 8b 85 c0 fe ff ff 	mov    -0x140(%rbp),%rax
   26508:	4c 89 e2             	mov    %r12,%rdx
   2650b:	44 89 d1             	mov    %r10d,%ecx
   2650e:	4c 89 ef             	mov    %r13,%rdi
   26511:	48 8d 35 18 69 0b 00 	lea    0xb6918(%rip),%rsi        # dce30 <_IO_stdin_used+0x3e30>
   26518:	4d 89 e7             	mov    %r12,%r15
   2651b:	48 2b 50 18          	sub    0x18(%rax),%rdx
   2651f:	31 c0                	xor    %eax,%eax
   26521:	83 ea 01             	sub    $0x1,%edx
   26524:	e8 57 fe 00 00       	call   36380 <JS_ThrowInternalError>
   26529:	e9 22 f5 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2652e:	f3 0f 1e fa          	endbr64
   26532:	4d 8d 7c 24 02       	lea    0x2(%r12),%r15
   26537:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   2653b:	48 8b 53 d8          	mov    -0x28(%rbx),%rdx
   2653f:	4c 89 ef             	mov    %r13,%rdi
   26542:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   26549:	45 0f b7 0c 24       	movzwl (%r12),%r9d
   2654e:	4c 8d 43 e0          	lea    -0x20(%rbx),%r8
   26552:	b9 02 00 00 00       	mov    $0x2,%ecx
   26557:	4c 89 85 30 fe ff ff 	mov    %r8,-0x1d0(%rbp)
   2655e:	4c 89 78 30          	mov    %r15,0x30(%rax)
   26562:	e8 99 5d 08 00       	call   ac300 <js_function_apply>
   26567:	48 89 d1             	mov    %rdx,%rcx
   2656a:	83 fa 06             	cmp    $0x6,%edx
   2656d:	0f 84 dd f4 ff ff    	je     25a50 <JS_CallInternal+0x740>
   26573:	48 8b 73 d8          	mov    -0x28(%rbx),%rsi
   26577:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2657e:	83 fe f6             	cmp    $0xfffffff6,%esi
   26581:	76 15                	jbe    26598 <JS_CallInternal+0x1288>
   26583:	48 8b 7b d0          	mov    -0x30(%rbx),%rdi
   26587:	8b 57 fc             	mov    -0x4(%rdi),%edx
   2658a:	83 ea 01             	sub    $0x1,%edx
   2658d:	89 57 fc             	mov    %edx,-0x4(%rdi)
   26590:	85 d2                	test   %edx,%edx
   26592:	0f 8e 1d 74 00 00    	jle    2d9b5 <JS_CallInternal+0x86a5>
   26598:	49 8b 70 08          	mov    0x8(%r8),%rsi
   2659c:	83 fe f6             	cmp    $0xfffffff6,%esi
   2659f:	76 14                	jbe    265b5 <JS_CallInternal+0x12a5>
   265a1:	49 8b 38             	mov    (%r8),%rdi
   265a4:	8b 57 fc             	mov    -0x4(%rdi),%edx
   265a7:	83 ea 01             	sub    $0x1,%edx
   265aa:	89 57 fc             	mov    %edx,-0x4(%rdi)
   265ad:	85 d2                	test   %edx,%edx
   265af:	0f 8e 7b 75 00 00    	jle    2db30 <JS_CallInternal+0x8820>
   265b5:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   265b9:	83 fe f6             	cmp    $0xfffffff6,%esi
   265bc:	76 15                	jbe    265d3 <JS_CallInternal+0x12c3>
   265be:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   265c2:	8b 57 fc             	mov    -0x4(%rdi),%edx
   265c5:	83 ea 01             	sub    $0x1,%edx
   265c8:	89 57 fc             	mov    %edx,-0x4(%rdi)
   265cb:	85 d2                	test   %edx,%edx
   265cd:	0f 8e b7 70 00 00    	jle    2d68a <JS_CallInternal+0x837a>
   265d3:	48 89 43 d0          	mov    %rax,-0x30(%rbx)
   265d7:	49 83 c4 03          	add    $0x3,%r12
   265db:	48 89 4b d8          	mov    %rcx,-0x28(%rbx)
   265df:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   265e5:	4c 89 c3             	mov    %r8,%rbx
   265e8:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   265ec:	49 89 c2             	mov    %rax,%r10
   265ef:	b8 01 00 00 00       	mov    $0x1,%eax
   265f4:	ff e2                	jmp    *%rdx
   265f6:	f3 0f 1e fa          	endbr64
   265fa:	49 8b 75 30          	mov    0x30(%r13),%rsi
   265fe:	41 0f b7 0c 24       	movzwl (%r12),%ecx
   26603:	ba 02 00 00 00       	mov    $0x2,%edx
   26608:	4c 89 ef             	mov    %r13,%rdi
   2660b:	4d 8d 7c 24 02       	lea    0x2(%r12),%r15
   26610:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   26614:	49 89 c9             	mov    %rcx,%r9
   26617:	49 c1 e1 04          	shl    $0x4,%r9
   2661b:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   26621:	4c 29 cb             	sub    %r9,%rbx
   26624:	48 89 8d f0 fd ff ff 	mov    %rcx,-0x210(%rbp)
   2662b:	31 c9                	xor    %ecx,%ecx
   2662d:	4c 89 8d 00 fe ff ff 	mov    %r9,-0x200(%rbp)
   26634:	48 89 9d 10 fe ff ff 	mov    %rbx,-0x1f0(%rbp)
   2663b:	e8 40 3f 02 00       	call   4a580 <JS_NewObjectFromShape>
   26640:	4c 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%r8
   26647:	4c 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%r9
   2664e:	83 fa 06             	cmp    $0x6,%edx
   26651:	48 89 c1             	mov    %rax,%rcx
   26654:	49 89 d2             	mov    %rdx,%r10
   26657:	0f 84 8f 73 00 00    	je     2d9ec <JS_CallInternal+0x86dc>
   2665d:	8b 95 30 fe ff ff    	mov    -0x1d0(%rbp),%edx
   26663:	85 d2                	test   %edx,%edx
   26665:	0f 85 25 62 00 00    	jne    2c890 <JS_CallInternal+0x7580>
   2666b:	4d 89 50 08          	mov    %r10,0x8(%r8)
   2666f:	49 8d 58 10          	lea    0x10(%r8),%rbx
   26673:	49 83 c4 03          	add    $0x3,%r12
   26677:	49 89 08             	mov    %rcx,(%r8)
   2667a:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   26680:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   26684:	49 89 c2             	mov    %rax,%r10
   26687:	b8 01 00 00 00       	mov    $0x1,%eax
   2668c:	ff e2                	jmp    *%rdx
   2668e:	f3 0f 1e fa          	endbr64
   26692:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   26696:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2669a:	4c 89 ef             	mov    %r13,%rdi
   2669d:	4c 8d 7b f0          	lea    -0x10(%rbx),%r15
   266a1:	e8 fa e6 ff ff       	call   24da0 <js_operator_typeof>
   266a6:	83 f8 1b             	cmp    $0x1b,%eax
   266a9:	0f 84 9b 26 00 00    	je     28d4a <JS_CallInternal+0x3a3a>
   266af:	49 8b 57 08          	mov    0x8(%r15),%rdx
   266b3:	49 8b 0f             	mov    (%r15),%rcx
   266b6:	83 fa f6             	cmp    $0xfffffff6,%edx
   266b9:	76 11                	jbe    266cc <JS_CallInternal+0x13bc>
   266bb:	8b 41 fc             	mov    -0x4(%rcx),%eax
   266be:	83 e8 01             	sub    $0x1,%eax
   266c1:	89 41 fc             	mov    %eax,-0x4(%rcx)
   266c4:	85 c0                	test   %eax,%eax
   266c6:	0f 8e 0c 60 00 00    	jle    2c6d8 <JS_CallInternal+0x73c8>
   266cc:	48 c7 43 f0 00 00 00 	movq   $0x0,-0x10(%rbx)
   266d3:	00 
   266d4:	49 83 c4 01          	add    $0x1,%r12
   266d8:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   266df:	00 
   266e0:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   266e6:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   266ea:	49 89 c2             	mov    %rax,%r10
   266ed:	b8 01 00 00 00       	mov    $0x1,%eax
   266f2:	ff e2                	jmp    *%rdx
   266f4:	f3 0f 1e fa          	endbr64
   266f8:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   266fc:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   26700:	4c 89 ef             	mov    %r13,%rdi
   26703:	49 83 c4 01          	add    $0x1,%r12
   26707:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2670b:	4c 8b 43 e8          	mov    -0x18(%rbx),%r8
   2670f:	e8 fc 9b ff ff       	call   20310 <js_method_set_home_object>
   26714:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2671a:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2671e:	49 89 c2             	mov    %rax,%r10
   26721:	b8 01 00 00 00       	mov    $0x1,%eax
   26726:	ff e2                	jmp    *%rdx
   26728:	f3 0f 1e fa          	endbr64
   2672c:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   26733:	4c 8b 7b f8          	mov    -0x8(%rbx),%r15
   26737:	4c 8b 53 f0          	mov    -0x10(%rbx),%r10
   2673b:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2673f:	41 83 ff ff          	cmp    $0xffffffff,%r15d
   26743:	0f 84 53 5e 00 00    	je     2c59c <JS_CallInternal+0x728c>
   26749:	41 83 ff 02          	cmp    $0x2,%r15d
   2674d:	0f 84 49 5e 00 00    	je     2c59c <JS_CallInternal+0x728c>
   26753:	41 83 ff f6          	cmp    $0xfffffff6,%r15d
   26757:	76 13                	jbe    2676c <JS_CallInternal+0x145c>
   26759:	41 8b 42 fc          	mov    -0x4(%r10),%eax
   2675d:	83 e8 01             	sub    $0x1,%eax
   26760:	41 89 42 fc          	mov    %eax,-0x4(%r10)
   26764:	85 c0                	test   %eax,%eax
   26766:	0f 8e b1 71 00 00    	jle    2d91d <JS_CallInternal+0x860d>
   2676c:	41 0f b6 04 24       	movzbl (%r12),%eax
   26771:	48 83 eb 10          	sub    $0x10,%rbx
   26775:	49 83 c4 01          	add    $0x1,%r12
   26779:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2677d:	49 89 c2             	mov    %rax,%r10
   26780:	b8 01 00 00 00       	mov    $0x1,%eax
   26785:	ff e2                	jmp    *%rdx
   26787:	f3 0f 1e fa          	endbr64
   2678b:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   26792:	48 89 de             	mov    %rbx,%rsi
   26795:	4c 89 ef             	mov    %r13,%rdi
   26798:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2679c:	e8 af ef 07 00       	call   a5750 <js_append_enumerate>
   267a1:	85 c0                	test   %eax,%eax
   267a3:	0f 85 83 96 00 00    	jne    2fe2c <JS_CallInternal+0xab1c>
   267a9:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   267ad:	48 83 eb 10          	sub    $0x10,%rbx
   267b1:	83 f8 f6             	cmp    $0xfffffff6,%eax
   267b4:	76 14                	jbe    267ca <JS_CallInternal+0x14ba>
   267b6:	48 8b 0b             	mov    (%rbx),%rcx
   267b9:	8b 71 fc             	mov    -0x4(%rcx),%esi
   267bc:	8d 56 ff             	lea    -0x1(%rsi),%edx
   267bf:	89 51 fc             	mov    %edx,-0x4(%rcx)
   267c2:	85 d2                	test   %edx,%edx
   267c4:	0f 8e 76 72 00 00    	jle    2da40 <JS_CallInternal+0x8730>
   267ca:	41 0f b6 04 24       	movzbl (%r12),%eax
   267cf:	49 83 c4 01          	add    $0x1,%r12
   267d3:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   267d7:	49 89 c2             	mov    %rax,%r10
   267da:	b8 01 00 00 00       	mov    $0x1,%eax
   267df:	ff e2                	jmp    *%rdx
   267e1:	f3 0f 1e fa          	endbr64
   267e5:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   267e9:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   267ed:	4c 8d 5b f0          	lea    -0x10(%rbx),%r11
   267f1:	83 f8 f6             	cmp    $0xfffffff6,%eax
   267f4:	76 04                	jbe    267fa <JS_CallInternal+0x14ea>
   267f6:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   267fa:	48 92                	xchg   %rax,%rdx
   267fc:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   26800:	4c 89 ef             	mov    %r13,%rdi
   26803:	41 b9 07 40 00 00    	mov    $0x4007,%r9d
   26809:	49 89 d0             	mov    %rdx,%r8
   2680c:	48 8b 53 d8          	mov    -0x28(%rbx),%rdx
   26810:	41 ff 73 08          	push   0x8(%r11)
   26814:	48 89 c1             	mov    %rax,%rcx
   26817:	41 ff 33             	push   (%r11)
   2681a:	4d 89 e7             	mov    %r12,%r15
   2681d:	4c 89 9d 30 fe ff ff 	mov    %r11,-0x1d0(%rbp)
   26824:	e8 17 09 02 00       	call   47140 <JS_DefinePropertyValueValue>
   26829:	5f                   	pop    %rdi
   2682a:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   26831:	41 58                	pop    %r8
   26833:	85 c0                	test   %eax,%eax
   26835:	0f 88 15 f2 ff ff    	js     25a50 <JS_CallInternal+0x740>
   2683b:	41 0f b6 04 24       	movzbl (%r12),%eax
   26840:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   26847:	49 83 c4 01          	add    $0x1,%r12
   2684b:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2684f:	49 89 c2             	mov    %rax,%r10
   26852:	b8 01 00 00 00       	mov    $0x1,%eax
   26857:	ff e2                	jmp    *%rdx
   26859:	f3 0f 1e fa          	endbr64
   2685d:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   26864:	4c 89 60 30          	mov    %r12,0x30(%rax)
   26868:	83 7b d8 ff          	cmpl   $0xffffffff,-0x28(%rbx)
   2686c:	0f 85 a3 93 00 00    	jne    2fc15 <JS_CallInternal+0xa905>
   26872:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   26876:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   2687a:	48 8d 43 e0          	lea    -0x20(%rbx),%rax
   2687e:	4c 89 ef             	mov    %r13,%rdi
   26881:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   26888:	4d 89 e7             	mov    %r12,%r15
   2688b:	e8 e0 06 02 00       	call   46f70 <JS_ValueToAtom>
   26890:	89 c1                	mov    %eax,%ecx
   26892:	85 c0                	test   %eax,%eax
   26894:	0f 84 b6 f1 ff ff    	je     25a50 <JS_CallInternal+0x740>
   2689a:	48 83 ec 08          	sub    $0x8,%rsp
   2689e:	4c 8d 53 d0          	lea    -0x30(%rbx),%r10
   268a2:	4c 8d 7b c0          	lea    -0x40(%rbx),%r15
   268a6:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   268aa:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   268b1:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   268b5:	4c 89 ef             	mov    %r13,%rdi
   268b8:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   268bc:	48 8b 53 d8          	mov    -0x28(%rbx),%rdx
   268c0:	68 00 80 00 00       	push   $0x8000
   268c5:	41 ff 77 08          	push   0x8(%r15)
   268c9:	41 ff 37             	push   (%r15)
   268cc:	89 85 10 fe ff ff    	mov    %eax,-0x1f0(%rbp)
   268d2:	e8 69 a6 00 00       	call   30f40 <JS_SetPropertyInternal>
   268d7:	8b 8d 10 fe ff ff    	mov    -0x1f0(%rbp),%ecx
   268dd:	48 83 c4 20          	add    $0x20,%rsp
   268e1:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   268e8:	89 c3                	mov    %eax,%ebx
   268ea:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   268f0:	0f 8f 92 67 00 00    	jg     2d088 <JS_CallInternal+0x7d78>
   268f6:	49 8b 47 08          	mov    0x8(%r15),%rax
   268fa:	83 f8 f6             	cmp    $0xfffffff6,%eax
   268fd:	76 14                	jbe    26913 <JS_CallInternal+0x1603>
   268ff:	49 8b 0f             	mov    (%r15),%rcx
   26902:	8b 71 fc             	mov    -0x4(%rcx),%esi
   26905:	8d 56 ff             	lea    -0x1(%rsi),%edx
   26908:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2690b:	85 d2                	test   %edx,%edx
   2690d:	0f 8e e2 7c 00 00    	jle    2e5f5 <JS_CallInternal+0x92e5>
   26913:	49 8b 42 08          	mov    0x8(%r10),%rax
   26917:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2691a:	76 14                	jbe    26930 <JS_CallInternal+0x1620>
   2691c:	49 8b 0a             	mov    (%r10),%rcx
   2691f:	8b 71 fc             	mov    -0x4(%rcx),%esi
   26922:	8d 56 ff             	lea    -0x1(%rsi),%edx
   26925:	89 51 fc             	mov    %edx,-0x4(%rcx)
   26928:	85 d2                	test   %edx,%edx
   2692a:	0f 8e b1 7c 00 00    	jle    2e5e1 <JS_CallInternal+0x92d1>
   26930:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   26937:	48 8b 41 08          	mov    0x8(%rcx),%rax
   2693b:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2693e:	76 14                	jbe    26954 <JS_CallInternal+0x1644>
   26940:	48 8b 09             	mov    (%rcx),%rcx
   26943:	8b 71 fc             	mov    -0x4(%rcx),%esi
   26946:	8d 56 ff             	lea    -0x1(%rsi),%edx
   26949:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2694c:	85 d2                	test   %edx,%edx
   2694e:	0f 8e 1e 7d 00 00    	jle    2e672 <JS_CallInternal+0x9362>
   26954:	85 db                	test   %ebx,%ebx
   26956:	0f 88 05 91 00 00    	js     2fa61 <JS_CallInternal+0xa751>
   2695c:	41 0f b6 04 24       	movzbl (%r12),%eax
   26961:	4c 89 fb             	mov    %r15,%rbx
   26964:	49 83 c4 01          	add    $0x1,%r12
   26968:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2696c:	49 89 c2             	mov    %rax,%r10
   2696f:	b8 01 00 00 00       	mov    $0x1,%eax
   26974:	ff e2                	jmp    *%rdx
   26976:	f3 0f 1e fa          	endbr64
   2697a:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   2697e:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   26982:	4c 89 ef             	mov    %r13,%rdi
   26985:	4c 8d 7b e0          	lea    -0x20(%rbx),%r15
   26989:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   26990:	4c 89 60 30          	mov    %r12,0x30(%rax)
   26994:	e8 d7 05 02 00       	call   46f70 <JS_ValueToAtom>
   26999:	89 c1                	mov    %eax,%ecx
   2699b:	85 c0                	test   %eax,%eax
   2699d:	0f 84 c7 7c 00 00    	je     2e66a <JS_CallInternal+0x935a>
   269a3:	83 7b d8 03          	cmpl   $0x3,-0x28(%rbx)
   269a7:	0f 84 6a 7c 00 00    	je     2e617 <JS_CallInternal+0x9307>
   269ad:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   269b1:	48 8b 53 d8          	mov    -0x28(%rbx),%rdx
   269b5:	4c 8d 5b d0          	lea    -0x30(%rbx),%r11
   269b9:	4c 89 ef             	mov    %r13,%rdi
   269bc:	4c 89 9d 10 fe ff ff 	mov    %r11,-0x1f0(%rbp)
   269c3:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   269c9:	e8 d2 98 04 00       	call   702a0 <JS_HasProperty>
   269ce:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   269d4:	4c 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%r11
   269db:	85 c0                	test   %eax,%eax
   269dd:	0f 8e 8c 82 00 00    	jle    2ec6f <JS_CallInternal+0x995f>
   269e3:	48 83 ec 08          	sub    $0x8,%rsp
   269e7:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   269eb:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   269ef:	4c 89 ef             	mov    %r13,%rdi
   269f2:	49 8b 33             	mov    (%r11),%rsi
   269f5:	49 8b 53 08          	mov    0x8(%r11),%rdx
   269f9:	68 00 80 00 00       	push   $0x8000
   269fe:	41 ff 73 08          	push   0x8(%r11)
   26a02:	41 ff 33             	push   (%r11)
   26a05:	4c 89 9d 10 fe ff ff 	mov    %r11,-0x1f0(%rbp)
   26a0c:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   26a12:	e8 29 a5 00 00       	call   30f40 <JS_SetPropertyInternal>
   26a17:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   26a1d:	48 83 c4 20          	add    $0x20,%rsp
   26a21:	4c 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%r11
   26a28:	89 c3                	mov    %eax,%ebx
   26a2a:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   26a30:	0f 8f 8a 66 00 00    	jg     2d0c0 <JS_CallInternal+0x7db0>
   26a36:	49 8b 47 08          	mov    0x8(%r15),%rax
   26a3a:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26a3d:	76 14                	jbe    26a53 <JS_CallInternal+0x1743>
   26a3f:	49 8b 0f             	mov    (%r15),%rcx
   26a42:	8b 71 fc             	mov    -0x4(%rcx),%esi
   26a45:	8d 56 ff             	lea    -0x1(%rsi),%edx
   26a48:	89 51 fc             	mov    %edx,-0x4(%rcx)
   26a4b:	85 d2                	test   %edx,%edx
   26a4d:	0f 8e 33 7c 00 00    	jle    2e686 <JS_CallInternal+0x9376>
   26a53:	49 8b 43 08          	mov    0x8(%r11),%rax
   26a57:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26a5a:	76 14                	jbe    26a70 <JS_CallInternal+0x1760>
   26a5c:	49 8b 0b             	mov    (%r11),%rcx
   26a5f:	8b 71 fc             	mov    -0x4(%rcx),%esi
   26a62:	8d 56 ff             	lea    -0x1(%rsi),%edx
   26a65:	89 51 fc             	mov    %edx,-0x4(%rcx)
   26a68:	85 d2                	test   %edx,%edx
   26a6a:	0f 8e ae 7c 00 00    	jle    2e71e <JS_CallInternal+0x940e>
   26a70:	85 db                	test   %ebx,%ebx
   26a72:	0f 88 ec 81 00 00    	js     2ec64 <JS_CallInternal+0x9954>
   26a78:	41 0f b6 04 24       	movzbl (%r12),%eax
   26a7d:	4c 89 db             	mov    %r11,%rbx
   26a80:	49 83 c4 01          	add    $0x1,%r12
   26a84:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   26a88:	49 89 c2             	mov    %rax,%r10
   26a8b:	b8 01 00 00 00       	mov    $0x1,%eax
   26a90:	ff e2                	jmp    *%rdx
   26a92:	f3 0f 1e fa          	endbr64
   26a96:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   26a9a:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   26a9e:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   26aa2:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   26aa6:	83 fe ff             	cmp    $0xffffffff,%esi
   26aa9:	0f 85 de 5f 00 00    	jne    2ca8d <JS_CallInternal+0x777d>
   26aaf:	85 c9                	test   %ecx,%ecx
   26ab1:	0f 85 d6 5f 00 00    	jne    2ca8d <JS_CallInternal+0x777d>
   26ab7:	66 83 7a 12 02       	cmpw   $0x2,0x12(%rdx)
   26abc:	0f 85 cb 5f 00 00    	jne    2ca8d <JS_CallInternal+0x777d>
   26ac2:	3b 42 38             	cmp    0x38(%rdx),%eax
   26ac5:	0f 83 c2 5f 00 00    	jae    2ca8d <JS_CallInternal+0x777d>
   26acb:	89 c0                	mov    %eax,%eax
   26acd:	48 c1 e0 04          	shl    $0x4,%rax
   26ad1:	48 03 42 30          	add    0x30(%rdx),%rax
   26ad5:	48 8b 10             	mov    (%rax),%rdx
   26ad8:	48 8b 40 08          	mov    0x8(%rax),%rax
   26adc:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26adf:	76 04                	jbe    26ae5 <JS_CallInternal+0x17d5>
   26ae1:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   26ae5:	48 89 53 f0          	mov    %rdx,-0x10(%rbx)
   26ae9:	49 83 c4 01          	add    $0x1,%r12
   26aed:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   26af1:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   26af7:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   26afb:	49 89 c2             	mov    %rax,%r10
   26afe:	b8 01 00 00 00       	mov    $0x1,%eax
   26b03:	ff e2                	jmp    *%rdx
   26b05:	f3 0f 1e fa          	endbr64
   26b09:	83 7b d8 ff          	cmpl   $0xffffffff,-0x28(%rbx)
   26b0d:	0f 85 76 5e 00 00    	jne    2c989 <JS_CallInternal+0x7679>
   26b13:	44 8b 7b e8          	mov    -0x18(%rbx),%r15d
   26b17:	45 85 ff             	test   %r15d,%r15d
   26b1a:	0f 85 69 5e 00 00    	jne    2c989 <JS_CallInternal+0x7679>
   26b20:	48 8b 53 d0          	mov    -0x30(%rbx),%rdx
   26b24:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   26b28:	66 83 7a 12 02       	cmpw   $0x2,0x12(%rdx)
   26b2d:	0f 85 56 5e 00 00    	jne    2c989 <JS_CallInternal+0x7679>
   26b33:	8b 4a 38             	mov    0x38(%rdx),%ecx
   26b36:	39 c8                	cmp    %ecx,%eax
   26b38:	0f 83 48 83 00 00    	jae    2ee86 <JS_CallInternal+0x9b76>
   26b3e:	89 c0                	mov    %eax,%eax
   26b40:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   26b45:	48 c1 e0 04          	shl    $0x4,%rax
   26b49:	48 03 42 30          	add    0x30(%rdx),%rax
   26b4d:	48 8b 50 08          	mov    0x8(%rax),%rdx
   26b51:	48 8b 08             	mov    (%rax),%rcx
   26b54:	0f 11 00             	movups %xmm0,(%rax)
   26b57:	83 fa f6             	cmp    $0xfffffff6,%edx
   26b5a:	76 11                	jbe    26b6d <JS_CallInternal+0x185d>
   26b5c:	8b 41 fc             	mov    -0x4(%rcx),%eax
   26b5f:	83 e8 01             	sub    $0x1,%eax
   26b62:	89 41 fc             	mov    %eax,-0x4(%rcx)
   26b65:	85 c0                	test   %eax,%eax
   26b67:	0f 8e 83 81 00 00    	jle    2ecf0 <JS_CallInternal+0x99e0>
   26b6d:	48 8b 43 d8          	mov    -0x28(%rbx),%rax
   26b71:	48 83 eb 30          	sub    $0x30,%rbx
   26b75:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26b78:	76 14                	jbe    26b8e <JS_CallInternal+0x187e>
   26b7a:	48 8b 0b             	mov    (%rbx),%rcx
   26b7d:	8b 71 fc             	mov    -0x4(%rcx),%esi
   26b80:	8d 56 ff             	lea    -0x1(%rsi),%edx
   26b83:	89 51 fc             	mov    %edx,-0x4(%rcx)
   26b86:	85 d2                	test   %edx,%edx
   26b88:	0f 8e 5b 82 00 00    	jle    2ede9 <JS_CallInternal+0x9ad9>
   26b8e:	41 0f b6 04 24       	movzbl (%r12),%eax
   26b93:	49 83 c4 01          	add    $0x1,%r12
   26b97:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   26b9b:	49 89 c2             	mov    %rax,%r10
   26b9e:	b8 01 00 00 00       	mov    $0x1,%eax
   26ba3:	ff e2                	jmp    *%rdx
   26ba5:	f3 0f 1e fa          	endbr64
   26ba9:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   26bb0:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   26bb4:	4c 89 ef             	mov    %r13,%rdi
   26bb7:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   26bbb:	4c 89 60 30          	mov    %r12,0x30(%rax)
   26bbf:	e8 ac 03 02 00       	call   46f70 <JS_ValueToAtom>
   26bc4:	89 c1                	mov    %eax,%ecx
   26bc6:	85 c0                	test   %eax,%eax
   26bc8:	0f 84 6b 8b 00 00    	je     2f739 <JS_CallInternal+0xa429>
   26bce:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   26bd2:	83 fa 03             	cmp    $0x3,%edx
   26bd5:	0f 84 f5 7a 00 00    	je     2e6d0 <JS_CallInternal+0x93c0>
   26bdb:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   26bdf:	4c 89 ef             	mov    %r13,%rdi
   26be2:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   26be8:	e8 b3 96 04 00       	call   702a0 <JS_HasProperty>
   26bed:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   26bf3:	85 c0                	test   %eax,%eax
   26bf5:	0f 8e 95 81 00 00    	jle    2ed90 <JS_CallInternal+0x9a80>
   26bfb:	48 83 ec 08          	sub    $0x8,%rsp
   26bff:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   26c03:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   26c07:	4c 89 ef             	mov    %r13,%rdi
   26c0a:	6a 00                	push   $0x0
   26c0c:	49 89 f0             	mov    %rsi,%r8
   26c0f:	49 89 d1             	mov    %rdx,%r9
   26c12:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   26c18:	e8 d3 95 00 00       	call   301f0 <JS_GetPropertyInternal>
   26c1d:	59                   	pop    %rcx
   26c1e:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   26c24:	49 89 c7             	mov    %rax,%r15
   26c27:	5e                   	pop    %rsi
   26c28:	48 89 d0             	mov    %rdx,%rax
   26c2b:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   26c31:	0f 8f da 65 00 00    	jg     2d211 <JS_CallInternal+0x7f01>
   26c37:	83 fa 06             	cmp    $0x6,%edx
   26c3a:	0f 84 bd 81 00 00    	je     2edfd <JS_CallInternal+0x9aed>
   26c40:	4c 89 3b             	mov    %r15,(%rbx)
   26c43:	49 83 c4 01          	add    $0x1,%r12
   26c47:	48 83 c3 10          	add    $0x10,%rbx
   26c4b:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   26c4f:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   26c55:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   26c59:	49 89 c2             	mov    %rax,%r10
   26c5c:	b8 01 00 00 00       	mov    $0x1,%eax
   26c61:	ff e2                	jmp    *%rdx
   26c63:	f3 0f 1e fa          	endbr64
   26c67:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   26c6b:	4c 8b 7b f8          	mov    -0x8(%rbx),%r15
   26c6f:	83 f8 ff             	cmp    $0xffffffff,%eax
   26c72:	0f 85 b0 7c 00 00    	jne    2e928 <JS_CallInternal+0x9618>
   26c78:	45 85 ff             	test   %r15d,%r15d
   26c7b:	0f 85 4f 63 00 00    	jne    2cfd0 <JS_CallInternal+0x7cc0>
   26c81:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   26c85:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   26c89:	66 83 7a 12 02       	cmpw   $0x2,0x12(%rdx)
   26c8e:	0f 85 ab 63 00 00    	jne    2d03f <JS_CallInternal+0x7d2f>
   26c94:	3b 42 38             	cmp    0x38(%rdx),%eax
   26c97:	0f 83 a2 63 00 00    	jae    2d03f <JS_CallInternal+0x7d2f>
   26c9d:	89 c0                	mov    %eax,%eax
   26c9f:	48 c1 e0 04          	shl    $0x4,%rax
   26ca3:	48 03 42 30          	add    0x30(%rdx),%rax
   26ca7:	48 8b 10             	mov    (%rax),%rdx
   26caa:	48 8b 40 08          	mov    0x8(%rax),%rax
   26cae:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26cb1:	76 04                	jbe    26cb7 <JS_CallInternal+0x19a7>
   26cb3:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   26cb7:	48 89 13             	mov    %rdx,(%rbx)
   26cba:	49 83 c4 01          	add    $0x1,%r12
   26cbe:	48 83 c3 10          	add    $0x10,%rbx
   26cc2:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   26cc6:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   26ccc:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   26cd0:	49 89 c2             	mov    %rax,%r10
   26cd3:	b8 01 00 00 00       	mov    $0x1,%eax
   26cd8:	ff e2                	jmp    *%rdx
   26cda:	f3 0f 1e fa          	endbr64
   26cde:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   26ce2:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   26ce6:	4c 89 ef             	mov    %r13,%rdi
   26ce9:	4c 8d 7b f0          	lea    -0x10(%rbx),%r15
   26ced:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   26cf4:	4c 89 60 30          	mov    %r12,0x30(%rax)
   26cf8:	e8 73 02 02 00       	call   46f70 <JS_ValueToAtom>
   26cfd:	89 c1                	mov    %eax,%ecx
   26cff:	85 c0                	test   %eax,%eax
   26d01:	0f 84 f7 7b 00 00    	je     2e8fe <JS_CallInternal+0x95ee>
   26d07:	48 83 ec 08          	sub    $0x8,%rsp
   26d0b:	4c 8d 5b d0          	lea    -0x30(%rbx),%r11
   26d0f:	48 8d 43 e0          	lea    -0x20(%rbx),%rax
   26d13:	4c 8b 43 d0          	mov    -0x30(%rbx),%r8
   26d17:	4c 89 9d 20 fe ff ff 	mov    %r11,-0x1e0(%rbp)
   26d1e:	4c 8b 4b d8          	mov    -0x28(%rbx),%r9
   26d22:	4c 89 ef             	mov    %r13,%rdi
   26d25:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   26d29:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   26d2d:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   26d34:	6a 00                	push   $0x0
   26d36:	89 8d f0 fd ff ff    	mov    %ecx,-0x210(%rbp)
   26d3c:	e8 af 94 00 00       	call   301f0 <JS_GetPropertyInternal>
   26d41:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   26d47:	4c 8b 9d 20 fe ff ff 	mov    -0x1e0(%rbp),%r11
   26d4e:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   26d55:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   26d5b:	48 89 95 10 fe ff ff 	mov    %rdx,-0x1f0(%rbp)
   26d62:	58                   	pop    %rax
   26d63:	5a                   	pop    %rdx
   26d64:	0f 8f 35 61 00 00    	jg     2ce9f <JS_CallInternal+0x7b8f>
   26d6a:	83 bd 10 fe ff ff 06 	cmpl   $0x6,-0x1f0(%rbp)
   26d71:	0f 84 7f 7b 00 00    	je     2e8f6 <JS_CallInternal+0x95e6>
   26d77:	49 8b 47 08          	mov    0x8(%r15),%rax
   26d7b:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26d7e:	76 14                	jbe    26d94 <JS_CallInternal+0x1a84>
   26d80:	49 8b 0f             	mov    (%r15),%rcx
   26d83:	8b 71 fc             	mov    -0x4(%rcx),%esi
   26d86:	8d 56 ff             	lea    -0x1(%rsi),%edx
   26d89:	89 51 fc             	mov    %edx,-0x4(%rcx)
   26d8c:	85 d2                	test   %edx,%edx
   26d8e:	0f 8e 72 7b 00 00    	jle    2e906 <JS_CallInternal+0x95f6>
   26d94:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   26d9b:	48 8b 41 08          	mov    0x8(%rcx),%rax
   26d9f:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26da2:	76 14                	jbe    26db8 <JS_CallInternal+0x1aa8>
   26da4:	48 8b 09             	mov    (%rcx),%rcx
   26da7:	8b 71 fc             	mov    -0x4(%rcx),%esi
   26daa:	8d 56 ff             	lea    -0x1(%rsi),%edx
   26dad:	89 51 fc             	mov    %edx,-0x4(%rcx)
   26db0:	85 d2                	test   %edx,%edx
   26db2:	0f 8e ea 77 00 00    	jle    2e5a2 <JS_CallInternal+0x9292>
   26db8:	49 8b 43 08          	mov    0x8(%r11),%rax
   26dbc:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26dbf:	76 14                	jbe    26dd5 <JS_CallInternal+0x1ac5>
   26dc1:	49 8b 0b             	mov    (%r11),%rcx
   26dc4:	8b 71 fc             	mov    -0x4(%rcx),%esi
   26dc7:	8d 56 ff             	lea    -0x1(%rsi),%edx
   26dca:	89 51 fc             	mov    %edx,-0x4(%rcx)
   26dcd:	85 d2                	test   %edx,%edx
   26dcf:	0f 8e ef 77 00 00    	jle    2e5c4 <JS_CallInternal+0x92b4>
   26dd5:	48 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%rax
   26ddc:	49 83 c4 01          	add    $0x1,%r12
   26de0:	48 89 43 d0          	mov    %rax,-0x30(%rbx)
   26de4:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   26deb:	48 89 43 d8          	mov    %rax,-0x28(%rbx)
   26def:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   26df5:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   26dfc:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   26e00:	49 89 c2             	mov    %rax,%r10
   26e03:	b8 01 00 00 00       	mov    $0x1,%eax
   26e08:	ff e2                	jmp    *%rdx
   26e0a:	f3 0f 1e fa          	endbr64
   26e0e:	4c 8b 4b e8          	mov    -0x18(%rbx),%r9
   26e12:	4c 8b 7b e0          	mov    -0x20(%rbx),%r15
   26e16:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   26e1a:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   26e1e:	41 83 f9 ff          	cmp    $0xffffffff,%r9d
   26e22:	0f 85 d8 5b 00 00    	jne    2ca00 <JS_CallInternal+0x76f0>
   26e28:	85 c0                	test   %eax,%eax
   26e2a:	0f 85 d0 5b 00 00    	jne    2ca00 <JS_CallInternal+0x76f0>
   26e30:	66 41 83 7f 12 02    	cmpw   $0x2,0x12(%r15)
   26e36:	0f 85 c4 5b 00 00    	jne    2ca00 <JS_CallInternal+0x76f0>
   26e3c:	41 3b 57 38          	cmp    0x38(%r15),%edx
   26e40:	0f 83 ba 5b 00 00    	jae    2ca00 <JS_CallInternal+0x76f0>
   26e46:	89 d0                	mov    %edx,%eax
   26e48:	48 c1 e0 04          	shl    $0x4,%rax
   26e4c:	49 03 47 30          	add    0x30(%r15),%rax
   26e50:	48 8b 08             	mov    (%rax),%rcx
   26e53:	48 8b 40 08          	mov    0x8(%rax),%rax
   26e57:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26e5a:	76 04                	jbe    26e60 <JS_CallInternal+0x1b50>
   26e5c:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   26e60:	41 83 f9 f6          	cmp    $0xfffffff6,%r9d
   26e64:	76 13                	jbe    26e79 <JS_CallInternal+0x1b69>
   26e66:	41 8b 77 fc          	mov    -0x4(%r15),%esi
   26e6a:	8d 56 ff             	lea    -0x1(%rsi),%edx
   26e6d:	41 89 57 fc          	mov    %edx,-0x4(%r15)
   26e71:	85 d2                	test   %edx,%edx
   26e73:	0f 8e 13 6c 00 00    	jle    2da8c <JS_CallInternal+0x877c>
   26e79:	48 89 4b e0          	mov    %rcx,-0x20(%rbx)
   26e7d:	49 83 c4 01          	add    $0x1,%r12
   26e81:	48 83 eb 10          	sub    $0x10,%rbx
   26e85:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   26e89:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   26e8f:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   26e93:	49 89 c2             	mov    %rax,%r10
   26e96:	b8 01 00 00 00       	mov    $0x1,%eax
   26e9b:	ff e2                	jmp    *%rdx
   26e9d:	f3 0f 1e fa          	endbr64
   26ea1:	41 0f b6 0c 24       	movzbl (%r12),%ecx
   26ea6:	4d 8d 7c 24 01       	lea    0x1(%r12),%r15
   26eab:	48 c1 e1 04          	shl    $0x4,%rcx
   26eaf:	48 03 8d a0 fe ff ff 	add    -0x160(%rbp),%rcx
   26eb6:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   26eba:	48 8b 01             	mov    (%rcx),%rax
   26ebd:	85 d2                	test   %edx,%edx
   26ebf:	0f 85 18 54 00 00    	jne    2c2dd <JS_CallInternal+0x6fcd>
   26ec5:	3d 00 00 00 80       	cmp    $0x80000000,%eax
   26eca:	0f 84 0d 54 00 00    	je     2c2dd <JS_CallInternal+0x6fcd>
   26ed0:	83 e8 01             	sub    $0x1,%eax
   26ed3:	48 c7 41 08 00 00 00 	movq   $0x0,0x8(%rcx)
   26eda:	00 
   26edb:	48 89 01             	mov    %rax,(%rcx)
   26ede:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
   26ee4:	49 83 c4 02          	add    $0x2,%r12
   26ee8:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   26eec:	49 89 c2             	mov    %rax,%r10
   26eef:	b8 01 00 00 00       	mov    $0x1,%eax
   26ef4:	ff e2                	jmp    *%rdx
   26ef6:	f3 0f 1e fa          	endbr64
   26efa:	41 0f b6 0c 24       	movzbl (%r12),%ecx
   26eff:	4d 8d 7c 24 01       	lea    0x1(%r12),%r15
   26f04:	48 c1 e1 04          	shl    $0x4,%rcx
   26f08:	48 03 8d a0 fe ff ff 	add    -0x160(%rbp),%rcx
   26f0f:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   26f13:	48 8b 01             	mov    (%rcx),%rax
   26f16:	85 d2                	test   %edx,%edx
   26f18:	0f 85 54 54 00 00    	jne    2c372 <JS_CallInternal+0x7062>
   26f1e:	3d ff ff ff 7f       	cmp    $0x7fffffff,%eax
   26f23:	0f 84 49 54 00 00    	je     2c372 <JS_CallInternal+0x7062>
   26f29:	83 c0 01             	add    $0x1,%eax
   26f2c:	48 c7 41 08 00 00 00 	movq   $0x0,0x8(%rcx)
   26f33:	00 
   26f34:	48 89 01             	mov    %rax,(%rcx)
   26f37:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
   26f3d:	49 83 c4 02          	add    $0x2,%r12
   26f41:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   26f45:	49 89 c2             	mov    %rax,%r10
   26f48:	b8 01 00 00 00       	mov    $0x1,%eax
   26f4d:	ff e2                	jmp    *%rdx
   26f4f:	f3 0f 1e fa          	endbr64
   26f53:	45 0f b7 0c 24       	movzwl (%r12),%r9d
   26f58:	49 89 da             	mov    %rbx,%r10
   26f5b:	4d 8d 7c 24 02       	lea    0x2(%r12),%r15
   26f60:	4c 89 ef             	mov    %r13,%rdi
   26f63:	4c 89 c8             	mov    %r9,%rax
   26f66:	44 89 8d 30 fe ff ff 	mov    %r9d,-0x1d0(%rbp)
   26f6d:	48 c1 e0 04          	shl    $0x4,%rax
   26f71:	49 29 c2             	sub    %rax,%r10
   26f74:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   26f7b:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   26f82:	49 8b 4a f0          	mov    -0x10(%r10),%rcx
   26f86:	49 8b 72 e0          	mov    -0x20(%r10),%rsi
   26f8a:	4d 8b 42 f8          	mov    -0x8(%r10),%r8
   26f8e:	49 8b 52 e8          	mov    -0x18(%r10),%rdx
   26f92:	4c 89 78 30          	mov    %r15,0x30(%rax)
   26f96:	6a 00                	push   $0x0
   26f98:	41 52                	push   %r10
   26f9a:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   26fa1:	e8 ba 3e 07 00       	call   9ae60 <JS_CallConstructorInternal>
   26fa6:	59                   	pop    %rcx
   26fa7:	5e                   	pop    %rsi
   26fa8:	83 fa 06             	cmp    $0x6,%edx
   26fab:	0f 84 9f ea ff ff    	je     25a50 <JS_CallInternal+0x740>
   26fb1:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   26fb8:	48 89 95 f0 fd ff ff 	mov    %rdx,-0x210(%rbp)
   26fbf:	48 89 9d 10 fe ff ff 	mov    %rbx,-0x1f0(%rbp)
   26fc6:	4d 8d 7a e0          	lea    -0x20(%r10),%r15
   26fca:	4c 03 95 00 fe ff ff 	add    -0x200(%rbp),%r10
   26fd1:	4c 89 a5 00 fe ff ff 	mov    %r12,-0x200(%rbp)
   26fd8:	4d 89 d4             	mov    %r10,%r12
   26fdb:	eb 10                	jmp    26fed <JS_CallInternal+0x1cdd>
   26fdd:	0f 1f 00             	nopl   (%rax)
   26fe0:	49 83 c7 10          	add    $0x10,%r15
   26fe4:	4d 39 e7             	cmp    %r12,%r15
   26fe7:	0f 84 63 4f 00 00    	je     2bf50 <JS_CallInternal+0x6c40>
   26fed:	49 8b 4f 08          	mov    0x8(%r15),%rcx
   26ff1:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   26ff4:	76 ea                	jbe    26fe0 <JS_CallInternal+0x1cd0>
   26ff6:	49 8b 37             	mov    (%r15),%rsi
   26ff9:	8b 5e fc             	mov    -0x4(%rsi),%ebx
   26ffc:	8d 53 ff             	lea    -0x1(%rbx),%edx
   26fff:	89 56 fc             	mov    %edx,-0x4(%rsi)
   27002:	85 d2                	test   %edx,%edx
   27004:	7f da                	jg     26fe0 <JS_CallInternal+0x1cd0>
   27006:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2700a:	48 89 ca             	mov    %rcx,%rdx
   2700d:	48 89 85 20 fe ff ff 	mov    %rax,-0x1e0(%rbp)
   27014:	e8 57 78 ff ff       	call   1e870 <__JS_FreeValueRT>
   27019:	48 8b 85 20 fe ff ff 	mov    -0x1e0(%rbp),%rax
   27020:	eb be                	jmp    26fe0 <JS_CallInternal+0x1cd0>
   27022:	f3 0f 1e fa          	endbr64
   27026:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2702a:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2702e:	4d 8d 7c 24 01       	lea    0x1(%r12),%r15
   27033:	83 fa 03             	cmp    $0x3,%edx
   27036:	0f 87 39 5c 00 00    	ja     2cc75 <JS_CallInternal+0x7965>
   2703c:	48 83 eb 10          	sub    $0x10,%rbx
   27040:	85 c0                	test   %eax,%eax
   27042:	75 0d                	jne    27051 <JS_CallInternal+0x1d41>
   27044:	41 0f be 04 24       	movsbl (%r12),%eax
   27049:	83 e8 01             	sub    $0x1,%eax
   2704c:	48 98                	cltq
   2704e:	49 01 c7             	add    %rax,%r15
   27051:	41 8b 85 a8 01 00 00 	mov    0x1a8(%r13),%eax
   27058:	83 e8 01             	sub    $0x1,%eax
   2705b:	41 89 85 a8 01 00 00 	mov    %eax,0x1a8(%r13)
   27062:	85 c0                	test   %eax,%eax
   27064:	0f 8e 84 6e 00 00    	jle    2deee <JS_CallInternal+0x8bde>
   2706a:	41 0f b6 07          	movzbl (%r15),%eax
   2706e:	4d 8d 67 01          	lea    0x1(%r15),%r12
   27072:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   27076:	49 89 c2             	mov    %rax,%r10
   27079:	b8 01 00 00 00       	mov    $0x1,%eax
   2707e:	ff e2                	jmp    *%rdx
   27080:	f3 0f 1e fa          	endbr64
   27084:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   27088:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2708c:	4d 8d 7c 24 01       	lea    0x1(%r12),%r15
   27091:	83 fa 03             	cmp    $0x3,%edx
   27094:	0f 87 cb 5b 00 00    	ja     2cc65 <JS_CallInternal+0x7955>
   2709a:	48 83 eb 10          	sub    $0x10,%rbx
   2709e:	85 c0                	test   %eax,%eax
   270a0:	74 0d                	je     270af <JS_CallInternal+0x1d9f>
   270a2:	41 0f be 04 24       	movsbl (%r12),%eax
   270a7:	83 e8 01             	sub    $0x1,%eax
   270aa:	48 98                	cltq
   270ac:	49 01 c7             	add    %rax,%r15
   270af:	41 8b 85 a8 01 00 00 	mov    0x1a8(%r13),%eax
   270b6:	83 e8 01             	sub    $0x1,%eax
   270b9:	41 89 85 a8 01 00 00 	mov    %eax,0x1a8(%r13)
   270c0:	85 c0                	test   %eax,%eax
   270c2:	0f 8e bc 6e 00 00    	jle    2df84 <JS_CallInternal+0x8c74>
   270c8:	41 0f b6 07          	movzbl (%r15),%eax
   270cc:	4d 8d 67 01          	lea    0x1(%r15),%r12
   270d0:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   270d4:	49 89 c2             	mov    %rax,%r10
   270d7:	b8 01 00 00 00       	mov    $0x1,%eax
   270dc:	ff e2                	jmp    *%rdx
   270de:	f3 0f 1e fa          	endbr64
   270e2:	e9 09 e6 ff ff       	jmp    256f0 <JS_CallInternal+0x3e0>
   270e7:	f3 0f 1e fa          	endbr64
   270eb:	b8 03 00 00 00       	mov    $0x3,%eax
   270f0:	31 c9                	xor    %ecx,%ecx
   270f2:	e9 d9 e9 ff ff       	jmp    25ad0 <JS_CallInternal+0x7c0>
   270f7:	f3 0f 1e fa          	endbr64
   270fb:	31 c0                	xor    %eax,%eax
   270fd:	b9 01 00 00 00       	mov    $0x1,%ecx
   27102:	e9 c9 e9 ff ff       	jmp    25ad0 <JS_CallInternal+0x7c0>
   27107:	f3 0f 1e fa          	endbr64
   2710b:	31 c0                	xor    %eax,%eax
   2710d:	31 c9                	xor    %ecx,%ecx
   2710f:	e9 bc e9 ff ff       	jmp    25ad0 <JS_CallInternal+0x7c0>
   27114:	f3 0f 1e fa          	endbr64
   27118:	e9 23 e5 ff ff       	jmp    25640 <JS_CallInternal+0x330>
   2711d:	f3 0f 1e fa          	endbr64
   27121:	e9 1a e5 ff ff       	jmp    25640 <JS_CallInternal+0x330>
   27126:	f3 0f 1e fa          	endbr64
   2712a:	e9 11 e5 ff ff       	jmp    25640 <JS_CallInternal+0x330>
   2712f:	f3 0f 1e fa          	endbr64
   27133:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   27137:	83 f8 fa             	cmp    $0xfffffffa,%eax
   2713a:	0f 8d a8 53 00 00    	jge    2c4e8 <JS_CallInternal+0x71d8>
   27140:	83 f8 f8             	cmp    $0xfffffff8,%eax
   27143:	0f 8c a7 53 00 00    	jl     2c4f0 <JS_CallInternal+0x71e0>
   27149:	41 0f b6 04 24       	movzbl (%r12),%eax
   2714e:	49 83 c4 01          	add    $0x1,%r12
   27152:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   27156:	49 89 c2             	mov    %rax,%r10
   27159:	b8 01 00 00 00       	mov    $0x1,%eax
   2715e:	ff e2                	jmp    *%rdx
   27160:	f3 0f 1e fa          	endbr64
   27164:	83 7b f8 ff          	cmpl   $0xffffffff,-0x8(%rbx)
   27168:	74 5b                	je     271c5 <JS_CallInternal+0x1eb5>
   2716a:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   27171:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   27175:	4c 89 ef             	mov    %r13,%rdi
   27178:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2717c:	4c 89 60 30          	mov    %r12,0x30(%rax)
   27180:	e8 0b 44 02 00       	call   4b590 <JS_ToObject>
   27185:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2718c:	49 89 d7             	mov    %rdx,%r15
   2718f:	83 fa 06             	cmp    $0x6,%edx
   27192:	0f 84 1e 7e 00 00    	je     2efb6 <JS_CallInternal+0x9ca6>
   27198:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2719c:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2719f:	76 15                	jbe    271b6 <JS_CallInternal+0x1ea6>
   271a1:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   271a5:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   271a8:	8d 51 ff             	lea    -0x1(%rcx),%edx
   271ab:	89 56 fc             	mov    %edx,-0x4(%rsi)
   271ae:	85 d2                	test   %edx,%edx
   271b0:	0f 8e 08 7e 00 00    	jle    2efbe <JS_CallInternal+0x9cae>
   271b6:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   271bd:	4c 89 7b f8          	mov    %r15,-0x8(%rbx)
   271c1:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   271c5:	41 0f b6 04 24       	movzbl (%r12),%eax
   271ca:	49 83 c4 01          	add    $0x1,%r12
   271ce:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   271d2:	49 89 c2             	mov    %rax,%r10
   271d5:	b8 01 00 00 00       	mov    $0x1,%eax
   271da:	ff e2                	jmp    *%rdx
   271dc:	f3 0f 1e fa          	endbr64
   271e0:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   271e7:	4d 8d 7c 24 04       	lea    0x4(%r12),%r15
   271ec:	41 8b 0c 24          	mov    (%r12),%ecx
   271f0:	4c 89 78 30          	mov    %r15,0x30(%rax)
   271f4:	49 8b 85 90 01 00 00 	mov    0x190(%r13),%rax
   271fb:	89 ca                	mov    %ecx,%edx
   271fd:	48 8b 70 18          	mov    0x18(%rax),%rsi
   27201:	8b 46 18             	mov    0x18(%rsi),%eax
   27204:	21 c2                	and    %eax,%edx
   27206:	8b 54 96 38          	mov    0x38(%rsi,%rdx,4),%edx
   2720a:	48 85 d2             	test   %rdx,%rdx
   2720d:	0f 84 2b 5c 00 00    	je     2ce3e <JS_CallInternal+0x7b2e>
   27213:	48 8d 3c 85 3c 00 00 	lea    0x3c(,%rax,4),%rdi
   2721a:	00 
   2721b:	48 8d 44 d7 f8       	lea    -0x8(%rdi,%rdx,8),%rax
   27220:	48 01 f0             	add    %rsi,%rax
   27223:	3b 48 04             	cmp    0x4(%rax),%ecx
   27226:	0f 85 04 5c 00 00    	jne    2ce30 <JS_CallInternal+0x7b20>
   2722c:	31 c0                	xor    %eax,%eax
   2722e:	48 89 03             	mov    %rax,(%rbx)
   27231:	49 83 c4 05          	add    $0x5,%r12
   27235:	48 83 c3 10          	add    $0x10,%rbx
   27239:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   27240:	00 
   27241:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27247:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2724b:	49 89 c2             	mov    %rax,%r10
   2724e:	b8 01 00 00 00       	mov    $0x1,%eax
   27253:	ff e2                	jmp    *%rdx
   27255:	f3 0f 1e fa          	endbr64
   27259:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   27260:	4c 8b 7b f0          	mov    -0x10(%rbx),%r15
   27264:	4c 89 ef             	mov    %r13,%rdi
   27267:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2726b:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   2726f:	4c 89 fe             	mov    %r15,%rsi
   27272:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   27279:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   2727d:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   27284:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   27288:	48 89 c2             	mov    %rax,%rdx
   2728b:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   27292:	e8 d9 fc 01 00       	call   46f70 <JS_ValueToAtom>
   27297:	85 c0                	test   %eax,%eax
   27299:	0f 84 1d 72 00 00    	je     2e4bc <JS_CallInternal+0x91ac>
   2729f:	48 8b b5 10 fe ff ff 	mov    -0x1f0(%rbp),%rsi
   272a6:	48 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%rdx
   272ad:	89 c1                	mov    %eax,%ecx
   272af:	4c 89 ef             	mov    %r13,%rdi
   272b2:	41 b8 00 80 00 00    	mov    $0x8000,%r8d
   272b8:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   272be:	e8 ed 6c 02 00       	call   4dfb0 <JS_DeleteProperty>
   272c3:	44 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%r9d
   272ca:	89 c1                	mov    %eax,%ecx
   272cc:	41 81 f9 f2 00 00 00 	cmp    $0xf2,%r9d
   272d3:	0f 8f 47 5c 00 00    	jg     2cf20 <JS_CallInternal+0x7c10>
   272d9:	85 c9                	test   %ecx,%ecx
   272db:	0f 88 8c 74 00 00    	js     2e76d <JS_CallInternal+0x945d>
   272e1:	83 bd 30 fe ff ff f6 	cmpl   $0xfffffff6,-0x1d0(%rbp)
   272e8:	76 1e                	jbe    27308 <JS_CallInternal+0x1ff8>
   272ea:	48 8b b5 10 fe ff ff 	mov    -0x1f0(%rbp),%rsi
   272f1:	8b 46 fc             	mov    -0x4(%rsi),%eax
   272f4:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   272fa:	83 e8 01             	sub    $0x1,%eax
   272fd:	89 46 fc             	mov    %eax,-0x4(%rsi)
   27300:	85 c0                	test   %eax,%eax
   27302:	0f 8e bc 71 00 00    	jle    2e4c4 <JS_CallInternal+0x91b4>
   27308:	83 bd 00 fe ff ff f6 	cmpl   $0xfffffff6,-0x200(%rbp)
   2730f:	76 13                	jbe    27324 <JS_CallInternal+0x2014>
   27311:	41 8b 47 fc          	mov    -0x4(%r15),%eax
   27315:	83 e8 01             	sub    $0x1,%eax
   27318:	41 89 47 fc          	mov    %eax,-0x4(%r15)
   2731c:	85 c0                	test   %eax,%eax
   2731e:	0f 8e 74 71 00 00    	jle    2e498 <JS_CallInternal+0x9188>
   27324:	31 c0                	xor    %eax,%eax
   27326:	85 c9                	test   %ecx,%ecx
   27328:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   2732f:	00 
   27330:	0f 95 c0             	setne  %al
   27333:	48 83 eb 10          	sub    $0x10,%rbx
   27337:	49 83 c4 01          	add    $0x1,%r12
   2733b:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2733f:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27345:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   27349:	49 89 c2             	mov    %rax,%r10
   2734c:	b8 01 00 00 00       	mov    $0x1,%eax
   27351:	ff e2                	jmp    *%rdx
   27353:	f3 0f 1e fa          	endbr64
   27357:	4c 8b 43 f8          	mov    -0x8(%rbx),%r8
   2735b:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2735f:	4c 89 ef             	mov    %r13,%rdi
   27362:	4c 89 c2             	mov    %r8,%rdx
   27365:	e8 36 da ff ff       	call   24da0 <js_operator_typeof>
   2736a:	41 89 c7             	mov    %eax,%r15d
   2736d:	41 83 f8 f6          	cmp    $0xfffffff6,%r8d
   27371:	76 11                	jbe    27384 <JS_CallInternal+0x2074>
   27373:	8b 46 fc             	mov    -0x4(%rsi),%eax
   27376:	83 e8 01             	sub    $0x1,%eax
   27379:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2737c:	85 c0                	test   %eax,%eax
   2737e:	0f 8e 10 65 00 00    	jle    2d894 <JS_CallInternal+0x8584>
   27384:	ba 01 00 00 00       	mov    $0x1,%edx
   27389:	44 89 fe             	mov    %r15d,%esi
   2738c:	4c 89 ef             	mov    %r13,%rdi
   2738f:	49 83 c4 01          	add    $0x1,%r12
   27393:	e8 68 49 01 00       	call   3bd00 <__JS_AtomToValue>
   27398:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2739c:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   273a0:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   273a6:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   273aa:	49 89 c2             	mov    %rax,%r10
   273ad:	b8 01 00 00 00       	mov    $0x1,%eax
   273b2:	ff e2                	jmp    *%rdx
   273b4:	f3 0f 1e fa          	endbr64
   273b8:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   273bf:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   273c3:	48 8b 40 10          	mov    0x10(%rax),%rax
   273c7:	48 8b 40 18          	mov    0x18(%rax),%rax
   273cb:	48 8b 10             	mov    (%rax),%rdx
   273ce:	48 8b 40 08          	mov    0x8(%rax),%rax
   273d2:	83 f8 f6             	cmp    $0xfffffff6,%eax
   273d5:	76 04                	jbe    273db <JS_CallInternal+0x20cb>
   273d7:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   273db:	48 89 13             	mov    %rdx,(%rbx)
   273de:	49 83 c4 01          	add    $0x1,%r12
   273e2:	48 89 43 08          	mov    %rax,0x8(%rbx)
   273e6:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   273ec:	48 89 cb             	mov    %rcx,%rbx
   273ef:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   273f3:	49 89 c2             	mov    %rax,%r10
   273f6:	b8 01 00 00 00       	mov    $0x1,%eax
   273fb:	ff e2                	jmp    *%rdx
   273fd:	f3 0f 1e fa          	endbr64
   27401:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   27408:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   2740c:	48 8b 40 08          	mov    0x8(%rax),%rax
   27410:	48 8b 40 18          	mov    0x18(%rax),%rax
   27414:	48 8b 10             	mov    (%rax),%rdx
   27417:	48 8b 40 08          	mov    0x8(%rax),%rax
   2741b:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2741e:	76 04                	jbe    27424 <JS_CallInternal+0x2114>
   27420:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27424:	48 89 13             	mov    %rdx,(%rbx)
   27427:	49 83 c4 01          	add    $0x1,%r12
   2742b:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2742f:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27435:	48 89 cb             	mov    %rcx,%rbx
   27438:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2743c:	49 89 c2             	mov    %rax,%r10
   2743f:	b8 01 00 00 00       	mov    $0x1,%eax
   27444:	ff e2                	jmp    *%rdx
   27446:	f3 0f 1e fa          	endbr64
   2744a:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   27451:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   27455:	48 8b 00             	mov    (%rax),%rax
   27458:	48 8b 40 18          	mov    0x18(%rax),%rax
   2745c:	48 8b 10             	mov    (%rax),%rdx
   2745f:	48 8b 40 08          	mov    0x8(%rax),%rax
   27463:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27466:	76 04                	jbe    2746c <JS_CallInternal+0x215c>
   27468:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2746c:	48 89 13             	mov    %rdx,(%rbx)
   2746f:	49 83 c4 01          	add    $0x1,%r12
   27473:	48 89 43 08          	mov    %rax,0x8(%rbx)
   27477:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2747d:	48 89 cb             	mov    %rcx,%rbx
   27480:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   27484:	49 89 c2             	mov    %rax,%r10
   27487:	b8 01 00 00 00       	mov    $0x1,%eax
   2748c:	ff e2                	jmp    *%rdx
   2748e:	f3 0f 1e fa          	endbr64
   27492:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   27496:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2749a:	83 fa f6             	cmp    $0xfffffff6,%edx
   2749d:	76 04                	jbe    274a3 <JS_CallInternal+0x2193>
   2749f:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   274a3:	48 8b bd 80 fe ff ff 	mov    -0x180(%rbp),%rdi
   274aa:	48 8b 47 38          	mov    0x38(%rdi),%rax
   274ae:	48 8b 77 30          	mov    0x30(%rdi),%rsi
   274b2:	48 89 57 38          	mov    %rdx,0x38(%rdi)
   274b6:	48 89 4f 30          	mov    %rcx,0x30(%rdi)
   274ba:	83 f8 f6             	cmp    $0xfffffff6,%eax
   274bd:	76 11                	jbe    274d0 <JS_CallInternal+0x21c0>
   274bf:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   274c2:	8d 51 ff             	lea    -0x1(%rcx),%edx
   274c5:	89 56 fc             	mov    %edx,-0x4(%rsi)
   274c8:	85 d2                	test   %edx,%edx
   274ca:	0f 8e d5 63 00 00    	jle    2d8a5 <JS_CallInternal+0x8595>
   274d0:	41 0f b6 04 24       	movzbl (%r12),%eax
   274d5:	49 83 c4 01          	add    $0x1,%r12
   274d9:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   274dd:	49 89 c2             	mov    %rax,%r10
   274e0:	b8 01 00 00 00       	mov    $0x1,%eax
   274e5:	ff e2                	jmp    *%rdx
   274e7:	f3 0f 1e fa          	endbr64
   274eb:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   274ef:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   274f3:	83 fa f6             	cmp    $0xfffffff6,%edx
   274f6:	76 04                	jbe    274fc <JS_CallInternal+0x21ec>
   274f8:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   274fc:	48 8b bd 80 fe ff ff 	mov    -0x180(%rbp),%rdi
   27503:	48 8b 47 28          	mov    0x28(%rdi),%rax
   27507:	48 8b 77 20          	mov    0x20(%rdi),%rsi
   2750b:	48 89 57 28          	mov    %rdx,0x28(%rdi)
   2750f:	48 89 4f 20          	mov    %rcx,0x20(%rdi)
   27513:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27516:	76 11                	jbe    27529 <JS_CallInternal+0x2219>
   27518:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   2751b:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2751e:	89 56 fc             	mov    %edx,-0x4(%rsi)
   27521:	85 d2                	test   %edx,%edx
   27523:	0f 8e 8d 63 00 00    	jle    2d8b6 <JS_CallInternal+0x85a6>
   27529:	41 0f b6 04 24       	movzbl (%r12),%eax
   2752e:	49 83 c4 01          	add    $0x1,%r12
   27532:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   27536:	49 89 c2             	mov    %rax,%r10
   27539:	b8 01 00 00 00       	mov    $0x1,%eax
   2753e:	ff e2                	jmp    *%rdx
   27540:	f3 0f 1e fa          	endbr64
   27544:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   27548:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2754c:	83 fa f6             	cmp    $0xfffffff6,%edx
   2754f:	76 04                	jbe    27555 <JS_CallInternal+0x2245>
   27551:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   27555:	48 8b bd 80 fe ff ff 	mov    -0x180(%rbp),%rdi
   2755c:	48 8b 47 08          	mov    0x8(%rdi),%rax
   27560:	48 8b 37             	mov    (%rdi),%rsi
   27563:	48 89 57 08          	mov    %rdx,0x8(%rdi)
   27567:	48 89 0f             	mov    %rcx,(%rdi)
   2756a:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2756d:	76 11                	jbe    27580 <JS_CallInternal+0x2270>
   2756f:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   27572:	8d 51 ff             	lea    -0x1(%rcx),%edx
   27575:	89 56 fc             	mov    %edx,-0x4(%rsi)
   27578:	85 d2                	test   %edx,%edx
   2757a:	0f 8e 58 63 00 00    	jle    2d8d8 <JS_CallInternal+0x85c8>
   27580:	41 0f b6 04 24       	movzbl (%r12),%eax
   27585:	49 83 c4 01          	add    $0x1,%r12
   27589:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2758d:	49 89 c2             	mov    %rax,%r10
   27590:	b8 01 00 00 00       	mov    $0x1,%eax
   27595:	ff e2                	jmp    *%rdx
   27597:	f3 0f 1e fa          	endbr64
   2759b:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2759f:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   275a3:	83 fa f6             	cmp    $0xfffffff6,%edx
   275a6:	76 04                	jbe    275ac <JS_CallInternal+0x229c>
   275a8:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   275ac:	48 8b bd 80 fe ff ff 	mov    -0x180(%rbp),%rdi
   275b3:	48 8b 47 18          	mov    0x18(%rdi),%rax
   275b7:	48 8b 77 10          	mov    0x10(%rdi),%rsi
   275bb:	48 89 57 18          	mov    %rdx,0x18(%rdi)
   275bf:	48 89 4f 10          	mov    %rcx,0x10(%rdi)
   275c3:	83 f8 f6             	cmp    $0xfffffff6,%eax
   275c6:	76 11                	jbe    275d9 <JS_CallInternal+0x22c9>
   275c8:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   275cb:	8d 51 ff             	lea    -0x1(%rcx),%edx
   275ce:	89 56 fc             	mov    %edx,-0x4(%rsi)
   275d1:	85 d2                	test   %edx,%edx
   275d3:	0f 8e ee 62 00 00    	jle    2d8c7 <JS_CallInternal+0x85b7>
   275d9:	41 0f b6 04 24       	movzbl (%r12),%eax
   275de:	49 83 c4 01          	add    $0x1,%r12
   275e2:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   275e6:	49 89 c2             	mov    %rax,%r10
   275e9:	b8 01 00 00 00       	mov    $0x1,%eax
   275ee:	ff e2                	jmp    *%rdx
   275f0:	f3 0f 1e fa          	endbr64
   275f4:	48 8b b5 80 fe ff ff 	mov    -0x180(%rbp),%rsi
   275fb:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   27600:	48 83 eb 10          	sub    $0x10,%rbx
   27604:	48 8b 46 38          	mov    0x38(%rsi),%rax
   27608:	48 8b 4e 30          	mov    0x30(%rsi),%rcx
   2760c:	0f 11 46 30          	movups %xmm0,0x30(%rsi)
   27610:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27613:	76 11                	jbe    27626 <JS_CallInternal+0x2316>
   27615:	8b 71 fc             	mov    -0x4(%rcx),%esi
   27618:	8d 56 ff             	lea    -0x1(%rsi),%edx
   2761b:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2761e:	85 d2                	test   %edx,%edx
   27620:	0f 8e c3 62 00 00    	jle    2d8e9 <JS_CallInternal+0x85d9>
   27626:	41 0f b6 04 24       	movzbl (%r12),%eax
   2762b:	49 83 c4 01          	add    $0x1,%r12
   2762f:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   27633:	49 89 c2             	mov    %rax,%r10
   27636:	b8 01 00 00 00       	mov    $0x1,%eax
   2763b:	ff e2                	jmp    *%rdx
   2763d:	f3 0f 1e fa          	endbr64
   27641:	48 8b b5 80 fe ff ff 	mov    -0x180(%rbp),%rsi
   27648:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2764d:	48 83 eb 10          	sub    $0x10,%rbx
   27651:	48 8b 46 28          	mov    0x28(%rsi),%rax
   27655:	48 8b 4e 20          	mov    0x20(%rsi),%rcx
   27659:	0f 11 46 20          	movups %xmm0,0x20(%rsi)
   2765d:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27660:	76 11                	jbe    27673 <JS_CallInternal+0x2363>
   27662:	8b 71 fc             	mov    -0x4(%rcx),%esi
   27665:	8d 56 ff             	lea    -0x1(%rsi),%edx
   27668:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2766b:	85 d2                	test   %edx,%edx
   2766d:	0f 8e e5 61 00 00    	jle    2d858 <JS_CallInternal+0x8548>
   27673:	41 0f b6 04 24       	movzbl (%r12),%eax
   27678:	49 83 c4 01          	add    $0x1,%r12
   2767c:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   27680:	49 89 c2             	mov    %rax,%r10
   27683:	b8 01 00 00 00       	mov    $0x1,%eax
   27688:	ff e2                	jmp    *%rdx
   2768a:	f3 0f 1e fa          	endbr64
   2768e:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   27695:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   27699:	48 8b 50 20          	mov    0x20(%rax),%rdx
   2769d:	48 8b 40 28          	mov    0x28(%rax),%rax
   276a1:	83 f8 f6             	cmp    $0xfffffff6,%eax
   276a4:	76 04                	jbe    276aa <JS_CallInternal+0x239a>
   276a6:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   276aa:	48 89 13             	mov    %rdx,(%rbx)
   276ad:	49 83 c4 01          	add    $0x1,%r12
   276b1:	48 89 43 08          	mov    %rax,0x8(%rbx)
   276b5:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   276bb:	48 89 cb             	mov    %rcx,%rbx
   276be:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   276c2:	49 89 c2             	mov    %rax,%r10
   276c5:	b8 01 00 00 00       	mov    $0x1,%eax
   276ca:	ff e2                	jmp    *%rdx
   276cc:	f3 0f 1e fa          	endbr64
   276d0:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   276d7:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   276db:	48 8b 50 10          	mov    0x10(%rax),%rdx
   276df:	48 8b 40 18          	mov    0x18(%rax),%rax
   276e3:	83 f8 f6             	cmp    $0xfffffff6,%eax
   276e6:	76 04                	jbe    276ec <JS_CallInternal+0x23dc>
   276e8:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   276ec:	48 89 13             	mov    %rdx,(%rbx)
   276ef:	49 83 c4 01          	add    $0x1,%r12
   276f3:	48 89 43 08          	mov    %rax,0x8(%rbx)
   276f7:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   276fd:	48 89 cb             	mov    %rcx,%rbx
   27700:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   27704:	49 89 c2             	mov    %rax,%r10
   27707:	b8 01 00 00 00       	mov    $0x1,%eax
   2770c:	ff e2                	jmp    *%rdx
   2770e:	f3 0f 1e fa          	endbr64
   27712:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   27719:	48 8b 10             	mov    (%rax),%rdx
   2771c:	48 8b 40 08          	mov    0x8(%rax),%rax
   27720:	83 f8 ff             	cmp    $0xffffffff,%eax
   27723:	0f 84 a3 53 00 00    	je     2cacc <JS_CallInternal+0x77bc>
   27729:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   2772d:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27730:	76 04                	jbe    27736 <JS_CallInternal+0x2426>
   27732:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27736:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2773a:	4c 89 e0             	mov    %r12,%rax
   2773d:	48 89 13             	mov    %rdx,(%rbx)
   27740:	48 89 cb             	mov    %rcx,%rbx
   27743:	4c 8d 60 01          	lea    0x1(%rax),%r12
   27747:	0f b6 00             	movzbl (%rax),%eax
   2774a:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2774e:	49 89 c2             	mov    %rax,%r10
   27751:	b8 01 00 00 00       	mov    $0x1,%eax
   27756:	ff e2                	jmp    *%rdx
   27758:	f3 0f 1e fa          	endbr64
   2775c:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   27763:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   27767:	48 8b 10             	mov    (%rax),%rdx
   2776a:	48 8b 40 08          	mov    0x8(%rax),%rax
   2776e:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27771:	76 04                	jbe    27777 <JS_CallInternal+0x2467>
   27773:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27777:	48 89 13             	mov    %rdx,(%rbx)
   2777a:	49 83 c4 01          	add    $0x1,%r12
   2777e:	48 89 43 08          	mov    %rax,0x8(%rbx)
   27782:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27788:	48 89 cb             	mov    %rcx,%rbx
   2778b:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2778f:	49 89 c2             	mov    %rax,%r10
   27792:	b8 01 00 00 00       	mov    $0x1,%eax
   27797:	ff e2                	jmp    *%rdx
   27799:	f3 0f 1e fa          	endbr64
   2779d:	48 8b b5 80 fe ff ff 	mov    -0x180(%rbp),%rsi
   277a4:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   277a9:	48 83 eb 10          	sub    $0x10,%rbx
   277ad:	48 8b 46 08          	mov    0x8(%rsi),%rax
   277b1:	48 8b 0e             	mov    (%rsi),%rcx
   277b4:	0f 11 06             	movups %xmm0,(%rsi)
   277b7:	83 f8 f6             	cmp    $0xfffffff6,%eax
   277ba:	76 11                	jbe    277cd <JS_CallInternal+0x24bd>
   277bc:	8b 71 fc             	mov    -0x4(%rcx),%esi
   277bf:	8d 56 ff             	lea    -0x1(%rsi),%edx
   277c2:	89 51 fc             	mov    %edx,-0x4(%rcx)
   277c5:	85 d2                	test   %edx,%edx
   277c7:	0f 8e b3 60 00 00    	jle    2d880 <JS_CallInternal+0x8570>
   277cd:	41 0f b6 04 24       	movzbl (%r12),%eax
   277d2:	49 83 c4 01          	add    $0x1,%r12
   277d6:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   277da:	49 89 c2             	mov    %rax,%r10
   277dd:	b8 01 00 00 00       	mov    $0x1,%eax
   277e2:	ff e2                	jmp    *%rdx
   277e4:	f3 0f 1e fa          	endbr64
   277e8:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   277ef:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   277f3:	48 8b 50 30          	mov    0x30(%rax),%rdx
   277f7:	48 8b 40 38          	mov    0x38(%rax),%rax
   277fb:	83 f8 f6             	cmp    $0xfffffff6,%eax
   277fe:	76 04                	jbe    27804 <JS_CallInternal+0x24f4>
   27800:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27804:	48 89 13             	mov    %rdx,(%rbx)
   27807:	49 83 c4 01          	add    $0x1,%r12
   2780b:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2780f:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27815:	48 89 cb             	mov    %rcx,%rbx
   27818:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2781c:	49 89 c2             	mov    %rax,%r10
   2781f:	b8 01 00 00 00       	mov    $0x1,%eax
   27824:	ff e2                	jmp    *%rdx
   27826:	f3 0f 1e fa          	endbr64
   2782a:	48 8b b5 80 fe ff ff 	mov    -0x180(%rbp),%rsi
   27831:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   27836:	48 83 eb 10          	sub    $0x10,%rbx
   2783a:	48 8b 46 18          	mov    0x18(%rsi),%rax
   2783e:	48 8b 4e 10          	mov    0x10(%rsi),%rcx
   27842:	0f 11 46 10          	movups %xmm0,0x10(%rsi)
   27846:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27849:	76 11                	jbe    2785c <JS_CallInternal+0x254c>
   2784b:	8b 71 fc             	mov    -0x4(%rcx),%esi
   2784e:	8d 56 ff             	lea    -0x1(%rsi),%edx
   27851:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27854:	85 d2                	test   %edx,%edx
   27856:	0f 8e 10 60 00 00    	jle    2d86c <JS_CallInternal+0x855c>
   2785c:	41 0f b6 04 24       	movzbl (%r12),%eax
   27861:	49 83 c4 01          	add    $0x1,%r12
   27865:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   27869:	49 89 c2             	mov    %rax,%r10
   2786c:	b8 01 00 00 00       	mov    $0x1,%eax
   27871:	ff e2                	jmp    *%rdx
   27873:	f3 0f 1e fa          	endbr64
   27877:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2787b:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2787f:	83 fa f6             	cmp    $0xfffffff6,%edx
   27882:	76 04                	jbe    27888 <JS_CallInternal+0x2578>
   27884:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   27888:	48 8b bd a0 fe ff ff 	mov    -0x160(%rbp),%rdi
   2788f:	48 8b 47 38          	mov    0x38(%rdi),%rax
   27893:	48 8b 77 30          	mov    0x30(%rdi),%rsi
   27897:	48 89 57 38          	mov    %rdx,0x38(%rdi)
   2789b:	48 89 4f 30          	mov    %rcx,0x30(%rdi)
   2789f:	83 f8 f6             	cmp    $0xfffffff6,%eax
   278a2:	76 11                	jbe    278b5 <JS_CallInternal+0x25a5>
   278a4:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   278a7:	8d 51 ff             	lea    -0x1(%rcx),%edx
   278aa:	89 56 fc             	mov    %edx,-0x4(%rsi)
   278ad:	85 d2                	test   %edx,%edx
   278af:	0f 8e 5f 5f 00 00    	jle    2d814 <JS_CallInternal+0x8504>
   278b5:	41 0f b6 04 24       	movzbl (%r12),%eax
   278ba:	49 83 c4 01          	add    $0x1,%r12
   278be:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   278c2:	49 89 c2             	mov    %rax,%r10
   278c5:	b8 01 00 00 00       	mov    $0x1,%eax
   278ca:	ff e2                	jmp    *%rdx
   278cc:	f3 0f 1e fa          	endbr64
   278d0:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   278d4:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   278d8:	83 fa f6             	cmp    $0xfffffff6,%edx
   278db:	76 04                	jbe    278e1 <JS_CallInternal+0x25d1>
   278dd:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   278e1:	48 8b bd a0 fe ff ff 	mov    -0x160(%rbp),%rdi
   278e8:	48 8b 47 18          	mov    0x18(%rdi),%rax
   278ec:	48 8b 77 10          	mov    0x10(%rdi),%rsi
   278f0:	48 89 57 18          	mov    %rdx,0x18(%rdi)
   278f4:	48 89 4f 10          	mov    %rcx,0x10(%rdi)
   278f8:	83 f8 f6             	cmp    $0xfffffff6,%eax
   278fb:	76 11                	jbe    2790e <JS_CallInternal+0x25fe>
   278fd:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   27900:	8d 51 ff             	lea    -0x1(%rcx),%edx
   27903:	89 56 fc             	mov    %edx,-0x4(%rsi)
   27906:	85 d2                	test   %edx,%edx
   27908:	0f 8e 28 5f 00 00    	jle    2d836 <JS_CallInternal+0x8526>
   2790e:	41 0f b6 04 24       	movzbl (%r12),%eax
   27913:	49 83 c4 01          	add    $0x1,%r12
   27917:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2791b:	49 89 c2             	mov    %rax,%r10
   2791e:	b8 01 00 00 00       	mov    $0x1,%eax
   27923:	ff e2                	jmp    *%rdx
   27925:	f3 0f 1e fa          	endbr64
   27929:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2792d:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   27931:	83 fa f6             	cmp    $0xfffffff6,%edx
   27934:	76 04                	jbe    2793a <JS_CallInternal+0x262a>
   27936:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   2793a:	48 8b bd a0 fe ff ff 	mov    -0x160(%rbp),%rdi
   27941:	48 8b 47 28          	mov    0x28(%rdi),%rax
   27945:	48 8b 77 20          	mov    0x20(%rdi),%rsi
   27949:	48 89 57 28          	mov    %rdx,0x28(%rdi)
   2794d:	48 89 4f 20          	mov    %rcx,0x20(%rdi)
   27951:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27954:	76 11                	jbe    27967 <JS_CallInternal+0x2657>
   27956:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   27959:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2795c:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2795f:	85 d2                	test   %edx,%edx
   27961:	0f 8e be 5e 00 00    	jle    2d825 <JS_CallInternal+0x8515>
   27967:	41 0f b6 04 24       	movzbl (%r12),%eax
   2796c:	49 83 c4 01          	add    $0x1,%r12
   27970:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   27974:	49 89 c2             	mov    %rax,%r10
   27977:	b8 01 00 00 00       	mov    $0x1,%eax
   2797c:	ff e2                	jmp    *%rdx
   2797e:	f3 0f 1e fa          	endbr64
   27982:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   27986:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2798a:	83 fa f6             	cmp    $0xfffffff6,%edx
   2798d:	76 04                	jbe    27993 <JS_CallInternal+0x2683>
   2798f:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   27993:	48 8b bd a0 fe ff ff 	mov    -0x160(%rbp),%rdi
   2799a:	48 8b 47 08          	mov    0x8(%rdi),%rax
   2799e:	48 8b 37             	mov    (%rdi),%rsi
   279a1:	48 89 57 08          	mov    %rdx,0x8(%rdi)
   279a5:	48 89 0f             	mov    %rcx,(%rdi)
   279a8:	83 f8 f6             	cmp    $0xfffffff6,%eax
   279ab:	76 11                	jbe    279be <JS_CallInternal+0x26ae>
   279ad:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   279b0:	8d 51 ff             	lea    -0x1(%rcx),%edx
   279b3:	89 56 fc             	mov    %edx,-0x4(%rsi)
   279b6:	85 d2                	test   %edx,%edx
   279b8:	0f 8e 89 5e 00 00    	jle    2d847 <JS_CallInternal+0x8537>
   279be:	41 0f b6 04 24       	movzbl (%r12),%eax
   279c3:	49 83 c4 01          	add    $0x1,%r12
   279c7:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   279cb:	49 89 c2             	mov    %rax,%r10
   279ce:	b8 01 00 00 00       	mov    $0x1,%eax
   279d3:	ff e2                	jmp    *%rdx
   279d5:	f3 0f 1e fa          	endbr64
   279d9:	48 8b b5 a0 fe ff ff 	mov    -0x160(%rbp),%rsi
   279e0:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   279e5:	48 83 eb 10          	sub    $0x10,%rbx
   279e9:	48 8b 46 38          	mov    0x38(%rsi),%rax
   279ed:	48 8b 4e 30          	mov    0x30(%rsi),%rcx
   279f1:	0f 11 46 30          	movups %xmm0,0x30(%rsi)
   279f5:	83 f8 f6             	cmp    $0xfffffff6,%eax
   279f8:	76 11                	jbe    27a0b <JS_CallInternal+0x26fb>
   279fa:	8b 71 fc             	mov    -0x4(%rcx),%esi
   279fd:	8d 56 ff             	lea    -0x1(%rsi),%edx
   27a00:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27a03:	85 d2                	test   %edx,%edx
   27a05:	0f 8e b9 5d 00 00    	jle    2d7c4 <JS_CallInternal+0x84b4>
   27a0b:	41 0f b6 04 24       	movzbl (%r12),%eax
   27a10:	49 83 c4 01          	add    $0x1,%r12
   27a14:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   27a18:	49 89 c2             	mov    %rax,%r10
   27a1b:	b8 01 00 00 00       	mov    $0x1,%eax
   27a20:	ff e2                	jmp    *%rdx
   27a22:	f3 0f 1e fa          	endbr64
   27a26:	48 8b b5 a0 fe ff ff 	mov    -0x160(%rbp),%rsi
   27a2d:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   27a32:	48 83 eb 10          	sub    $0x10,%rbx
   27a36:	48 8b 46 18          	mov    0x18(%rsi),%rax
   27a3a:	48 8b 4e 10          	mov    0x10(%rsi),%rcx
   27a3e:	0f 11 46 10          	movups %xmm0,0x10(%rsi)
   27a42:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27a45:	76 11                	jbe    27a58 <JS_CallInternal+0x2748>
   27a47:	8b 71 fc             	mov    -0x4(%rcx),%esi
   27a4a:	8d 56 ff             	lea    -0x1(%rsi),%edx
   27a4d:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27a50:	85 d2                	test   %edx,%edx
   27a52:	0f 8e 94 5d 00 00    	jle    2d7ec <JS_CallInternal+0x84dc>
   27a58:	41 0f b6 04 24       	movzbl (%r12),%eax
   27a5d:	49 83 c4 01          	add    $0x1,%r12
   27a61:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   27a65:	49 89 c2             	mov    %rax,%r10
   27a68:	b8 01 00 00 00       	mov    $0x1,%eax
   27a6d:	ff e2                	jmp    *%rdx
   27a6f:	f3 0f 1e fa          	endbr64
   27a73:	48 8b b5 a0 fe ff ff 	mov    -0x160(%rbp),%rsi
   27a7a:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   27a7f:	48 83 eb 10          	sub    $0x10,%rbx
   27a83:	48 8b 46 28          	mov    0x28(%rsi),%rax
   27a87:	48 8b 4e 20          	mov    0x20(%rsi),%rcx
   27a8b:	0f 11 46 20          	movups %xmm0,0x20(%rsi)
   27a8f:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27a92:	76 11                	jbe    27aa5 <JS_CallInternal+0x2795>
   27a94:	8b 71 fc             	mov    -0x4(%rcx),%esi
   27a97:	8d 56 ff             	lea    -0x1(%rsi),%edx
   27a9a:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27a9d:	85 d2                	test   %edx,%edx
   27a9f:	0f 8e 33 5d 00 00    	jle    2d7d8 <JS_CallInternal+0x84c8>
   27aa5:	41 0f b6 04 24       	movzbl (%r12),%eax
   27aaa:	49 83 c4 01          	add    $0x1,%r12
   27aae:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   27ab2:	49 89 c2             	mov    %rax,%r10
   27ab5:	b8 01 00 00 00       	mov    $0x1,%eax
   27aba:	ff e2                	jmp    *%rdx
   27abc:	f3 0f 1e fa          	endbr64
   27ac0:	48 8b b5 a0 fe ff ff 	mov    -0x160(%rbp),%rsi
   27ac7:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   27acc:	48 83 eb 10          	sub    $0x10,%rbx
   27ad0:	48 8b 46 08          	mov    0x8(%rsi),%rax
   27ad4:	48 8b 0e             	mov    (%rsi),%rcx
   27ad7:	0f 11 06             	movups %xmm0,(%rsi)
   27ada:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27add:	76 11                	jbe    27af0 <JS_CallInternal+0x27e0>
   27adf:	8b 71 fc             	mov    -0x4(%rcx),%esi
   27ae2:	8d 56 ff             	lea    -0x1(%rsi),%edx
   27ae5:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27ae8:	85 d2                	test   %edx,%edx
   27aea:	0f 8e 10 5d 00 00    	jle    2d800 <JS_CallInternal+0x84f0>
   27af0:	41 0f b6 04 24       	movzbl (%r12),%eax
   27af5:	49 83 c4 01          	add    $0x1,%r12
   27af9:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   27afd:	49 89 c2             	mov    %rax,%r10
   27b00:	b8 01 00 00 00       	mov    $0x1,%eax
   27b05:	ff e2                	jmp    *%rdx
   27b07:	f3 0f 1e fa          	endbr64
   27b0b:	48 8b 85 a0 fe ff ff 	mov    -0x160(%rbp),%rax
   27b12:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   27b16:	48 8b 50 30          	mov    0x30(%rax),%rdx
   27b1a:	48 8b 40 38          	mov    0x38(%rax),%rax
   27b1e:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27b21:	76 04                	jbe    27b27 <JS_CallInternal+0x2817>
   27b23:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27b27:	48 89 13             	mov    %rdx,(%rbx)
   27b2a:	49 83 c4 01          	add    $0x1,%r12
   27b2e:	48 89 43 08          	mov    %rax,0x8(%rbx)
   27b32:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27b38:	48 89 cb             	mov    %rcx,%rbx
   27b3b:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   27b3f:	49 89 c2             	mov    %rax,%r10
   27b42:	b8 01 00 00 00       	mov    $0x1,%eax
   27b47:	ff e2                	jmp    *%rdx
   27b49:	f3 0f 1e fa          	endbr64
   27b4d:	48 8b 85 a0 fe ff ff 	mov    -0x160(%rbp),%rax
   27b54:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   27b58:	48 8b 50 20          	mov    0x20(%rax),%rdx
   27b5c:	48 8b 40 28          	mov    0x28(%rax),%rax
   27b60:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27b63:	76 04                	jbe    27b69 <JS_CallInternal+0x2859>
   27b65:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27b69:	48 89 13             	mov    %rdx,(%rbx)
   27b6c:	49 83 c4 01          	add    $0x1,%r12
   27b70:	48 89 43 08          	mov    %rax,0x8(%rbx)
   27b74:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27b7a:	48 89 cb             	mov    %rcx,%rbx
   27b7d:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   27b81:	49 89 c2             	mov    %rax,%r10
   27b84:	b8 01 00 00 00       	mov    $0x1,%eax
   27b89:	ff e2                	jmp    *%rdx
   27b8b:	f3 0f 1e fa          	endbr64
   27b8f:	48 8b 85 a0 fe ff ff 	mov    -0x160(%rbp),%rax
   27b96:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   27b9a:	48 8b 50 10          	mov    0x10(%rax),%rdx
   27b9e:	48 8b 40 18          	mov    0x18(%rax),%rax
   27ba2:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27ba5:	76 04                	jbe    27bab <JS_CallInternal+0x289b>
   27ba7:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27bab:	48 89 13             	mov    %rdx,(%rbx)
   27bae:	49 83 c4 01          	add    $0x1,%r12
   27bb2:	48 89 43 08          	mov    %rax,0x8(%rbx)
   27bb6:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27bbc:	48 89 cb             	mov    %rcx,%rbx
   27bbf:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   27bc3:	49 89 c2             	mov    %rax,%r10
   27bc6:	b8 01 00 00 00       	mov    $0x1,%eax
   27bcb:	ff e2                	jmp    *%rdx
   27bcd:	f3 0f 1e fa          	endbr64
   27bd1:	48 8b 85 a0 fe ff ff 	mov    -0x160(%rbp),%rax
   27bd8:	48 8b 10             	mov    (%rax),%rdx
   27bdb:	48 8b 40 08          	mov    0x8(%rax),%rax
   27bdf:	83 f8 ff             	cmp    $0xffffffff,%eax
   27be2:	0f 84 f3 50 00 00    	je     2ccdb <JS_CallInternal+0x79cb>
   27be8:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   27bec:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27bef:	76 04                	jbe    27bf5 <JS_CallInternal+0x28e5>
   27bf1:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27bf5:	48 89 43 08          	mov    %rax,0x8(%rbx)
   27bf9:	4c 89 e0             	mov    %r12,%rax
   27bfc:	48 89 13             	mov    %rdx,(%rbx)
   27bff:	48 89 cb             	mov    %rcx,%rbx
   27c02:	4c 8d 60 01          	lea    0x1(%rax),%r12
   27c06:	0f b6 00             	movzbl (%rax),%eax
   27c09:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   27c0d:	49 89 c2             	mov    %rax,%r10
   27c10:	b8 01 00 00 00       	mov    $0x1,%eax
   27c15:	ff e2                	jmp    *%rdx
   27c17:	f3 0f 1e fa          	endbr64
   27c1b:	48 8b 85 a0 fe ff ff 	mov    -0x160(%rbp),%rax
   27c22:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   27c26:	48 8b 10             	mov    (%rax),%rdx
   27c29:	48 8b 40 08          	mov    0x8(%rax),%rax
   27c2d:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27c30:	76 04                	jbe    27c36 <JS_CallInternal+0x2926>
   27c32:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27c36:	48 89 13             	mov    %rdx,(%rbx)
   27c39:	49 83 c4 01          	add    $0x1,%r12
   27c3d:	48 89 43 08          	mov    %rax,0x8(%rbx)
   27c41:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27c47:	48 89 cb             	mov    %rcx,%rbx
   27c4a:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   27c4e:	49 89 c2             	mov    %rax,%r10
   27c51:	b8 01 00 00 00       	mov    $0x1,%eax
   27c56:	ff e2                	jmp    *%rdx
   27c58:	f3 0f 1e fa          	endbr64
   27c5c:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   27c60:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   27c64:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   27c67:	76 04                	jbe    27c6d <JS_CallInternal+0x295d>
   27c69:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   27c6d:	41 0f b6 04 24       	movzbl (%r12),%eax
   27c72:	48 c1 e0 04          	shl    $0x4,%rax
   27c76:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   27c7d:	48 8b 50 08          	mov    0x8(%rax),%rdx
   27c81:	48 8b 38             	mov    (%rax),%rdi
   27c84:	48 89 48 08          	mov    %rcx,0x8(%rax)
   27c88:	48 89 30             	mov    %rsi,(%rax)
   27c8b:	83 fa f6             	cmp    $0xfffffff6,%edx
   27c8e:	76 11                	jbe    27ca1 <JS_CallInternal+0x2991>
   27c90:	8b 47 fc             	mov    -0x4(%rdi),%eax
   27c93:	83 e8 01             	sub    $0x1,%eax
   27c96:	89 47 fc             	mov    %eax,-0x4(%rdi)
   27c99:	85 c0                	test   %eax,%eax
   27c9b:	0f 8e 44 60 00 00    	jle    2dce5 <JS_CallInternal+0x89d5>
   27ca1:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
   27ca7:	49 83 c4 02          	add    $0x2,%r12
   27cab:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   27caf:	49 89 c2             	mov    %rax,%r10
   27cb2:	b8 01 00 00 00       	mov    $0x1,%eax
   27cb7:	ff e2                	jmp    *%rdx
   27cb9:	f3 0f 1e fa          	endbr64
   27cbd:	41 0f b6 04 24       	movzbl (%r12),%eax
   27cc2:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   27cc7:	48 83 eb 10          	sub    $0x10,%rbx
   27ccb:	48 c1 e0 04          	shl    $0x4,%rax
   27ccf:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   27cd6:	48 8b 50 08          	mov    0x8(%rax),%rdx
   27cda:	48 8b 08             	mov    (%rax),%rcx
   27cdd:	0f 11 00             	movups %xmm0,(%rax)
   27ce0:	83 fa f6             	cmp    $0xfffffff6,%edx
   27ce3:	76 11                	jbe    27cf6 <JS_CallInternal+0x29e6>
   27ce5:	8b 41 fc             	mov    -0x4(%rcx),%eax
   27ce8:	83 e8 01             	sub    $0x1,%eax
   27ceb:	89 41 fc             	mov    %eax,-0x4(%rcx)
   27cee:	85 c0                	test   %eax,%eax
   27cf0:	0f 8e 78 5e 00 00    	jle    2db6e <JS_CallInternal+0x885e>
   27cf6:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
   27cfc:	49 83 c4 02          	add    $0x2,%r12
   27d00:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   27d04:	49 89 c2             	mov    %rax,%r10
   27d07:	b8 01 00 00 00       	mov    $0x1,%eax
   27d0c:	ff e2                	jmp    *%rdx
   27d0e:	f3 0f 1e fa          	endbr64
   27d12:	41 0f b6 04 24       	movzbl (%r12),%eax
   27d17:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   27d1b:	48 c1 e0 04          	shl    $0x4,%rax
   27d1f:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   27d26:	48 8b 10             	mov    (%rax),%rdx
   27d29:	48 8b 40 08          	mov    0x8(%rax),%rax
   27d2d:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27d30:	76 04                	jbe    27d36 <JS_CallInternal+0x2a26>
   27d32:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27d36:	48 89 13             	mov    %rdx,(%rbx)
   27d39:	49 83 c4 02          	add    $0x2,%r12
   27d3d:	48 89 43 08          	mov    %rax,0x8(%rbx)
   27d41:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27d47:	48 89 cb             	mov    %rcx,%rbx
   27d4a:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   27d4e:	49 89 c2             	mov    %rax,%r10
   27d51:	b8 01 00 00 00       	mov    $0x1,%eax
   27d56:	ff e2                	jmp    *%rdx
   27d58:	f3 0f 1e fa          	endbr64
   27d5c:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   27d60:	4c 8d 43 f0          	lea    -0x10(%rbx),%r8
   27d64:	4c 8d 7b e0          	lea    -0x20(%rbx),%r15
   27d68:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   27d6c:	49 8b 58 08          	mov    0x8(%r8),%rbx
   27d70:	4c 89 85 f0 fd ff ff 	mov    %r8,-0x210(%rbp)
   27d77:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   27d7e:	49 8b 47 08          	mov    0x8(%r15),%rax
   27d82:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   27d89:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   27d90:	83 fb f9             	cmp    $0xfffffff9,%ebx
   27d93:	0f 85 5f 53 00 00    	jne    2d0f8 <JS_CallInternal+0x7de8>
   27d99:	83 f8 f9             	cmp    $0xfffffff9,%eax
   27d9c:	0f 85 56 53 00 00    	jne    2d0f8 <JS_CallInternal+0x7de8>
   27da2:	49 8b 75 48          	mov    0x48(%r13),%rsi
   27da6:	48 8d 8d 50 ff ff ff 	lea    -0xb0(%rbp),%rcx
   27dad:	ba 12 00 00 00       	mov    $0x12,%edx
   27db2:	4c 89 ef             	mov    %r13,%rdi
   27db5:	48 c7 85 50 ff ff ff 	movq   $0x0,-0xb0(%rbp)
   27dbc:	00 00 00 00 
   27dc0:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   27dc4:	48 c7 85 58 ff ff ff 	movq   $0x0,-0xa8(%rbp)
   27dcb:	00 00 00 00 
   27dcf:	e8 ac 27 02 00       	call   4a580 <JS_NewObjectFromShape>
   27dd4:	4c 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8
   27ddb:	83 fa 06             	cmp    $0x6,%edx
   27dde:	0f 84 2c 53 00 00    	je     2d110 <JS_CallInternal+0x7e00>
   27de4:	f3 0f 7e 85 10 fe ff 	movq   -0x1f0(%rbp),%xmm0
   27deb:	ff 
   27dec:	0f 16 85 30 fe ff ff 	movhps -0x1d0(%rbp),%xmm0
   27df3:	0f 11 40 28          	movups %xmm0,0x28(%rax)
   27df7:	49 89 07             	mov    %rax,(%r15)
   27dfa:	4c 89 c3             	mov    %r8,%rbx
   27dfd:	49 89 57 08          	mov    %rdx,0x8(%r15)
   27e01:	4d 89 e7             	mov    %r12,%r15
   27e04:	41 83 78 f8 06       	cmpl   $0x6,-0x8(%r8)
   27e09:	0f 84 41 dc ff ff    	je     25a50 <JS_CallInternal+0x740>
   27e0f:	41 0f b6 04 24       	movzbl (%r12),%eax
   27e14:	49 83 c4 01          	add    $0x1,%r12
   27e18:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   27e1c:	49 89 c2             	mov    %rax,%r10
   27e1f:	b8 01 00 00 00       	mov    $0x1,%eax
   27e24:	ff e2                	jmp    *%rdx
   27e26:	f3 0f 1e fa          	endbr64
   27e2a:	4d 8d 7c 24 02       	lea    0x2(%r12),%r15
   27e2f:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   27e33:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   27e37:	4c 89 ef             	mov    %r13,%rdi
   27e3a:	41 0f b7 04 24       	movzwl (%r12),%eax
   27e3f:	48 8d b5 dc fe ff ff 	lea    -0x124(%rbp),%rsi
   27e46:	66 89 85 10 fe ff ff 	mov    %ax,-0x1f0(%rbp)
   27e4d:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   27e54:	4c 89 78 30          	mov    %r15,0x30(%rax)
   27e58:	48 8d 43 f0          	lea    -0x10(%rbx),%rax
   27e5c:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   27e63:	e8 d8 55 06 00       	call   8d440 <build_arg_list>
   27e68:	49 89 c2             	mov    %rax,%r10
   27e6b:	48 85 c0             	test   %rax,%rax
   27e6e:	0f 84 dc db ff ff    	je     25a50 <JS_CallInternal+0x740>
   27e74:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   27e78:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   27e7c:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   27e82:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   27e89:	49 8b 95 70 01 00 00 	mov    0x170(%r13),%rdx
   27e90:	49 8b 8d 78 01 00 00 	mov    0x178(%r13),%rcx
   27e97:	48 89 c6             	mov    %rax,%rsi
   27e9a:	48 89 bd f0 fd ff ff 	mov    %rdi,-0x210(%rbp)
   27ea1:	48 89 85 20 fe ff ff 	mov    %rax,-0x1e0(%rbp)
   27ea8:	e8 03 3f ff ff       	call   1bdb0 <js_strict_eq2.isra.0>
   27ead:	44 8b 9d dc fe ff ff 	mov    -0x124(%rbp),%r11d
   27eb4:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   27ebb:	85 c0                	test   %eax,%eax
   27ebd:	0f 84 9b 4c 00 00    	je     2cb5e <JS_CallInternal+0x784e>
   27ec3:	0f b7 85 10 fe ff ff 	movzwl -0x1f0(%rbp),%eax
   27eca:	83 e8 02             	sub    $0x2,%eax
   27ecd:	45 85 db             	test   %r11d,%r11d
   27ed0:	0f 84 7b 4c 00 00    	je     2cb51 <JS_CallInternal+0x7841>
   27ed6:	49 8b 0a             	mov    (%r10),%rcx
   27ed9:	4d 8b 42 08          	mov    0x8(%r10),%r8
   27edd:	48 83 ec 08          	sub    $0x8,%rsp
   27ee1:	44 89 9d 20 fe ff ff 	mov    %r11d,-0x1e0(%rbp)
   27ee8:	31 f6                	xor    %esi,%esi
   27eea:	4c 89 ef             	mov    %r13,%rdi
   27eed:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   27ef4:	41 b9 02 00 00 00    	mov    $0x2,%r9d
   27efa:	ba 03 00 00 00       	mov    $0x3,%edx
   27eff:	50                   	push   %rax
   27f00:	e8 db cc 01 00       	call   44be0 <JS_EvalObject>
   27f05:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   27f0c:	44 8b 9d 20 fe ff ff 	mov    -0x1e0(%rbp),%r11d
   27f13:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   27f1a:	48 89 95 10 fe ff ff 	mov    %rdx,-0x1f0(%rbp)
   27f21:	59                   	pop    %rcx
   27f22:	5e                   	pop    %rsi
   27f23:	45 85 db             	test   %r11d,%r11d
   27f26:	0f 84 94 3f 00 00    	je     2bec0 <JS_CallInternal+0x6bb0>
   27f2c:	45 89 d8             	mov    %r11d,%r8d
   27f2f:	48 89 9d 20 fe ff ff 	mov    %rbx,-0x1e0(%rbp)
   27f36:	4c 89 d3             	mov    %r10,%rbx
   27f39:	49 c1 e0 04          	shl    $0x4,%r8
   27f3d:	4c 89 95 e8 fd ff ff 	mov    %r10,-0x218(%rbp)
   27f44:	4d 01 d0             	add    %r10,%r8
   27f47:	4d 89 ea             	mov    %r13,%r10
   27f4a:	4d 89 e5             	mov    %r12,%r13
   27f4d:	4d 89 c4             	mov    %r8,%r12
   27f50:	eb 1b                	jmp    27f6d <JS_CallInternal+0x2c5d>
   27f52:	0f 1f 00             	nopl   (%rax)
   27f55:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   27f5c:	00 00 00 00 
   27f60:	48 83 c3 10          	add    $0x10,%rbx
   27f64:	4c 39 e3             	cmp    %r12,%rbx
   27f67:	0f 84 3f 3f 00 00    	je     2beac <JS_CallInternal+0x6b9c>
   27f6d:	48 8b 43 08          	mov    0x8(%rbx),%rax
   27f71:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27f74:	76 ea                	jbe    27f60 <JS_CallInternal+0x2c50>
   27f76:	48 8b 33             	mov    (%rbx),%rsi
   27f79:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   27f7c:	8d 51 ff             	lea    -0x1(%rcx),%edx
   27f7f:	89 56 fc             	mov    %edx,-0x4(%rsi)
   27f82:	85 d2                	test   %edx,%edx
   27f84:	7f da                	jg     27f60 <JS_CallInternal+0x2c50>
   27f86:	49 8b 7a 10          	mov    0x10(%r10),%rdi
   27f8a:	48 89 c2             	mov    %rax,%rdx
   27f8d:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   27f94:	e8 d7 68 ff ff       	call   1e870 <__JS_FreeValueRT>
   27f99:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   27fa0:	eb be                	jmp    27f60 <JS_CallInternal+0x2c50>
   27fa2:	f3 0f 1e fa          	endbr64
   27fa6:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   27faa:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   27fae:	83 f8 03             	cmp    $0x3,%eax
   27fb1:	0f 87 2f 4e 00 00    	ja     2cde6 <JS_CallInternal+0x7ad6>
   27fb7:	31 c0                	xor    %eax,%eax
   27fb9:	85 d2                	test   %edx,%edx
   27fbb:	0f 95 c0             	setne  %al
   27fbe:	85 c0                	test   %eax,%eax
   27fc0:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   27fc7:	00 
   27fc8:	0f 94 c0             	sete   %al
   27fcb:	49 83 c4 01          	add    $0x1,%r12
   27fcf:	0f b6 c0             	movzbl %al,%eax
   27fd2:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   27fd6:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27fdc:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   27fe0:	49 89 c2             	mov    %rax,%r10
   27fe3:	b8 01 00 00 00       	mov    $0x1,%eax
   27fe8:	ff e2                	jmp    *%rdx
   27fea:	f3 0f 1e fa          	endbr64
   27fee:	4d 8d 7c 24 01       	lea    0x1(%r12),%r15
   27ff3:	48 8b 73 c0          	mov    -0x40(%rbx),%rsi
   27ff7:	48 8b 53 c8          	mov    -0x38(%rbx),%rdx
   27ffb:	4c 89 ef             	mov    %r13,%rdi
   27ffe:	45 0f b6 14 24       	movzbl (%r12),%r10d
   28003:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2800a:	49 89 f0             	mov    %rsi,%r8
   2800d:	49 89 d1             	mov    %rdx,%r9
   28010:	4c 89 78 30          	mov    %r15,0x30(%rax)
   28014:	44 89 d0             	mov    %r10d,%eax
   28017:	83 e0 01             	and    $0x1,%eax
   2801a:	44 88 95 30 fe ff ff 	mov    %r10b,-0x1d0(%rbp)
   28021:	3c 01                	cmp    $0x1,%al
   28023:	19 c9                	sbb    %ecx,%ecx
   28025:	48 83 ec 08          	sub    $0x8,%rsp
   28029:	6a 00                	push   $0x0
   2802b:	83 e1 ef             	and    $0xffffffef,%ecx
   2802e:	83 c1 17             	add    $0x17,%ecx
   28031:	e8 ba 81 00 00       	call   301f0 <JS_GetPropertyInternal>
   28036:	5f                   	pop    %rdi
   28037:	41 58                	pop    %r8
   28039:	48 89 c6             	mov    %rax,%rsi
   2803c:	83 fa 06             	cmp    $0x6,%edx
   2803f:	0f 84 0b da ff ff    	je     25a50 <JS_CallInternal+0x740>
   28045:	8d 4a fe             	lea    -0x2(%rdx),%ecx
   28048:	b8 01 00 00 00       	mov    $0x1,%eax
   2804d:	83 f9 01             	cmp    $0x1,%ecx
   28050:	0f 87 8a 47 00 00    	ja     2c7e0 <JS_CallInternal+0x74d0>
   28056:	48 89 03             	mov    %rax,(%rbx)
   28059:	49 83 c4 02          	add    $0x2,%r12
   2805d:	48 83 c3 10          	add    $0x10,%rbx
   28061:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   28068:	00 
   28069:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2806f:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   28073:	49 89 c2             	mov    %rax,%r10
   28076:	b8 01 00 00 00       	mov    $0x1,%eax
   2807b:	ff e2                	jmp    *%rdx
   2807d:	f3 0f 1e fa          	endbr64
   28081:	41 0f b6 04 24       	movzbl (%r12),%eax
   28086:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   2808d:	4d 8d 7c 24 01       	lea    0x1(%r12),%r15
   28092:	48 c1 e0 04          	shl    $0x4,%rax
   28096:	48 03 41 50          	add    0x50(%rcx),%rax
   2809a:	48 8b 10             	mov    (%rax),%rdx
   2809d:	48 8b 40 08          	mov    0x8(%rax),%rax
   280a1:	83 f8 f6             	cmp    $0xfffffff6,%eax
   280a4:	76 04                	jbe    280aa <JS_CallInternal+0x2d9a>
   280a6:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   280aa:	48 92                	xchg   %rax,%rdx
   280ac:	4c 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%r8
   280b3:	45 31 c9             	xor    %r9d,%r9d
   280b6:	4c 89 ef             	mov    %r13,%rdi
   280b9:	48 8b 8d 88 fe ff ff 	mov    -0x178(%rbp),%rcx
   280c0:	48 89 c6             	mov    %rax,%rsi
   280c3:	e8 f8 6a 02 00       	call   4ebc0 <js_closure>
   280c8:	48 89 03             	mov    %rax,(%rbx)
   280cb:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   280cf:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   280d3:	0f 84 68 62 00 00    	je     2e341 <JS_CallInternal+0x9031>
   280d9:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
   280df:	48 83 c3 10          	add    $0x10,%rbx
   280e3:	49 83 c4 02          	add    $0x2,%r12
   280e7:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   280eb:	49 89 c2             	mov    %rax,%r10
   280ee:	b8 01 00 00 00       	mov    $0x1,%eax
   280f3:	ff e2                	jmp    *%rdx
   280f5:	f3 0f 1e fa          	endbr64
   280f9:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   28100:	44 89 d2             	mov    %r10d,%edx
   28103:	48 89 de             	mov    %rbx,%rsi
   28106:	4c 89 ef             	mov    %r13,%rdi
   28109:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2810d:	e8 5e e1 02 00       	call   56270 <js_binary_arith_slow>
   28112:	85 c0                	test   %eax,%eax
   28114:	0f 85 9f 7b 00 00    	jne    2fcb9 <JS_CallInternal+0xa9a9>
   2811a:	41 0f b6 04 24       	movzbl (%r12),%eax
   2811f:	48 83 eb 10          	sub    $0x10,%rbx
   28123:	49 83 c4 01          	add    $0x1,%r12
   28127:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2812b:	49 89 c2             	mov    %rax,%r10
   2812e:	b8 01 00 00 00       	mov    $0x1,%eax
   28133:	ff e2                	jmp    *%rdx
   28135:	f3 0f 1e fa          	endbr64
   28139:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2813d:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   28141:	4c 89 ef             	mov    %r13,%rdi
   28144:	48 83 eb 10          	sub    $0x10,%rbx
   28148:	4d 89 e7             	mov    %r12,%r15
   2814b:	e8 e0 c8 ff ff       	call   24a30 <JS_Throw>
   28150:	e9 fb d8 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   28155:	f3 0f 1e fa          	endbr64
   28159:	41 0f b7 04 24       	movzwl (%r12),%eax
   2815e:	48 c1 e0 04          	shl    $0x4,%rax
   28162:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   28169:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2816d:	48 8b 08             	mov    (%rax),%rcx
   28170:	48 c7 40 08 04 00 00 	movq   $0x4,0x8(%rax)
   28177:	00 
   28178:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
   2817f:	83 fa f6             	cmp    $0xfffffff6,%edx
   28182:	76 11                	jbe    28195 <JS_CallInternal+0x2e85>
   28184:	8b 41 fc             	mov    -0x4(%rcx),%eax
   28187:	83 e8 01             	sub    $0x1,%eax
   2818a:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2818d:	85 c0                	test   %eax,%eax
   2818f:	0f 8e cb 5b 00 00    	jle    2dd60 <JS_CallInternal+0x8a50>
   28195:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   2819b:	49 83 c4 03          	add    $0x3,%r12
   2819f:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   281a3:	49 89 c2             	mov    %rax,%r10
   281a6:	b8 01 00 00 00       	mov    $0x1,%eax
   281ab:	ff e2                	jmp    *%rdx
   281ad:	f3 0f 1e fa          	endbr64
   281b1:	41 0f b7 14 24       	movzwl (%r12),%edx
   281b6:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   281bd:	4d 8d 7c 24 02       	lea    0x2(%r12),%r15
   281c2:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   281c6:	48 8b 40 18          	mov    0x18(%rax),%rax
   281ca:	83 78 08 04          	cmpl   $0x4,0x8(%rax)
   281ce:	0f 85 4c 5c 00 00    	jne    2de20 <JS_CallInternal+0x8b10>
   281d4:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   281d9:	49 83 c4 03          	add    $0x3,%r12
   281dd:	48 83 eb 10          	sub    $0x10,%rbx
   281e1:	0f 11 00             	movups %xmm0,(%rax)
   281e4:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   281ea:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   281ee:	49 89 c2             	mov    %rax,%r10
   281f1:	b8 01 00 00 00       	mov    $0x1,%eax
   281f6:	ff e2                	jmp    *%rdx
   281f8:	f3 0f 1e fa          	endbr64
   281fc:	41 0f b7 0c 24       	movzwl (%r12),%ecx
   28201:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   28208:	4d 8d 7c 24 02       	lea    0x2(%r12),%r15
   2820d:	48 8b 04 c8          	mov    (%rax,%rcx,8),%rax
   28211:	48 8b 50 18          	mov    0x18(%rax),%rdx
   28215:	48 8b 42 08          	mov    0x8(%rdx),%rax
   28219:	83 f8 04             	cmp    $0x4,%eax
   2821c:	0f 84 ce 5f 00 00    	je     2e1f0 <JS_CallInternal+0x8ee0>
   28222:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   28227:	48 8b 0a             	mov    (%rdx),%rcx
   2822a:	0f 11 02             	movups %xmm0,(%rdx)
   2822d:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28230:	76 11                	jbe    28243 <JS_CallInternal+0x2f33>
   28232:	8b 71 fc             	mov    -0x4(%rcx),%esi
   28235:	8d 56 ff             	lea    -0x1(%rsi),%edx
   28238:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2823b:	85 d2                	test   %edx,%edx
   2823d:	0f 8e 2e 5b 00 00    	jle    2dd71 <JS_CallInternal+0x8a61>
   28243:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   28249:	48 83 eb 10          	sub    $0x10,%rbx
   2824d:	49 83 c4 03          	add    $0x3,%r12
   28251:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   28255:	49 89 c2             	mov    %rax,%r10
   28258:	b8 01 00 00 00       	mov    $0x1,%eax
   2825d:	ff e2                	jmp    *%rdx
   2825f:	f3 0f 1e fa          	endbr64
   28263:	48 8b 43 d8          	mov    -0x28(%rbx),%rax
   28267:	48 8b 53 d0          	mov    -0x30(%rbx),%rdx
   2826b:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2826e:	76 04                	jbe    28274 <JS_CallInternal+0x2f64>
   28270:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   28274:	48 89 43 08          	mov    %rax,0x8(%rbx)
   28278:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   2827c:	48 89 13             	mov    %rdx,(%rbx)
   2827f:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   28283:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28286:	76 04                	jbe    2828c <JS_CallInternal+0x2f7c>
   28288:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2828c:	48 89 43 18          	mov    %rax,0x18(%rbx)
   28290:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   28294:	48 89 53 10          	mov    %rdx,0x10(%rbx)
   28298:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2829c:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2829f:	76 04                	jbe    282a5 <JS_CallInternal+0x2f95>
   282a1:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   282a5:	48 89 53 20          	mov    %rdx,0x20(%rbx)
   282a9:	49 83 c4 01          	add    $0x1,%r12
   282ad:	48 83 c3 30          	add    $0x30,%rbx
   282b1:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   282b5:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   282bb:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   282bf:	49 89 c2             	mov    %rax,%r10
   282c2:	b8 01 00 00 00       	mov    $0x1,%eax
   282c7:	ff e2                	jmp    *%rdx
   282c9:	f3 0f 1e fa          	endbr64
   282cd:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   282d1:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   282d5:	83 f8 f6             	cmp    $0xfffffff6,%eax
   282d8:	76 04                	jbe    282de <JS_CallInternal+0x2fce>
   282da:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   282de:	48 89 43 08          	mov    %rax,0x8(%rbx)
   282e2:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   282e6:	48 89 13             	mov    %rdx,(%rbx)
   282e9:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   282ed:	83 f8 f6             	cmp    $0xfffffff6,%eax
   282f0:	76 04                	jbe    282f6 <JS_CallInternal+0x2fe6>
   282f2:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   282f6:	48 89 53 10          	mov    %rdx,0x10(%rbx)
   282fa:	49 83 c4 01          	add    $0x1,%r12
   282fe:	48 83 c3 20          	add    $0x20,%rbx
   28302:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   28306:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2830c:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   28310:	49 89 c2             	mov    %rax,%r10
   28313:	b8 01 00 00 00       	mov    $0x1,%eax
   28318:	ff e2                	jmp    *%rdx
   2831a:	f3 0f 1e fa          	endbr64
   2831e:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   28322:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   28326:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28329:	76 04                	jbe    2832f <JS_CallInternal+0x301f>
   2832b:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2832f:	48 89 13             	mov    %rdx,(%rbx)
   28332:	49 83 c4 01          	add    $0x1,%r12
   28336:	48 83 c3 10          	add    $0x10,%rbx
   2833a:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2833e:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28344:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   28348:	49 89 c2             	mov    %rax,%r10
   2834b:	b8 01 00 00 00       	mov    $0x1,%eax
   28350:	ff e2                	jmp    *%rdx
   28352:	f3 0f 1e fa          	endbr64
   28356:	48 8b 43 d8          	mov    -0x28(%rbx),%rax
   2835a:	48 8b 4b d0          	mov    -0x30(%rbx),%rcx
   2835e:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28361:	76 11                	jbe    28374 <JS_CallInternal+0x3064>
   28363:	8b 71 fc             	mov    -0x4(%rcx),%esi
   28366:	8d 56 ff             	lea    -0x1(%rsi),%edx
   28369:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2836c:	85 d2                	test   %edx,%edx
   2836e:	0f 8e 11 5a 00 00    	jle    2dd85 <JS_CallInternal+0x8a75>
   28374:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   28379:	49 83 c4 01          	add    $0x1,%r12
   2837d:	48 83 eb 10          	sub    $0x10,%rbx
   28381:	0f 11 43 e0          	movups %xmm0,-0x20(%rbx)
   28385:	f3 0f 6f 03          	movdqu (%rbx),%xmm0
   28389:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   2838d:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28393:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   28397:	49 89 c2             	mov    %rax,%r10
   2839a:	b8 01 00 00 00       	mov    $0x1,%eax
   2839f:	ff e2                	jmp    *%rdx
   283a1:	f3 0f 1e fa          	endbr64
   283a5:	f3 0f 6f 4b c0       	movdqu -0x40(%rbx),%xmm1
   283aa:	f3 0f 6f 43 b0       	movdqu -0x50(%rbx),%xmm0
   283af:	49 83 c4 01          	add    $0x1,%r12
   283b3:	0f 11 4b b0          	movups %xmm1,-0x50(%rbx)
   283b7:	f3 0f 6f 4b d0       	movdqu -0x30(%rbx),%xmm1
   283bc:	0f 11 4b c0          	movups %xmm1,-0x40(%rbx)
   283c0:	f3 0f 6f 4b e0       	movdqu -0x20(%rbx),%xmm1
   283c5:	0f 11 4b d0          	movups %xmm1,-0x30(%rbx)
   283c9:	f3 0f 6f 4b f0       	movdqu -0x10(%rbx),%xmm1
   283ce:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   283d2:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   283d6:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   283dc:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   283e0:	49 89 c2             	mov    %rax,%r10
   283e3:	b8 01 00 00 00       	mov    $0x1,%eax
   283e8:	ff e2                	jmp    *%rdx
   283ea:	f3 0f 1e fa          	endbr64
   283ee:	f3 0f 6f 4b d0       	movdqu -0x30(%rbx),%xmm1
   283f3:	f3 0f 6f 43 c0       	movdqu -0x40(%rbx),%xmm0
   283f8:	49 83 c4 01          	add    $0x1,%r12
   283fc:	0f 11 4b c0          	movups %xmm1,-0x40(%rbx)
   28400:	f3 0f 6f 4b e0       	movdqu -0x20(%rbx),%xmm1
   28405:	0f 11 4b d0          	movups %xmm1,-0x30(%rbx)
   28409:	f3 0f 6f 4b f0       	movdqu -0x10(%rbx),%xmm1
   2840e:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   28412:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   28416:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2841c:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   28420:	49 89 c2             	mov    %rax,%r10
   28423:	b8 01 00 00 00       	mov    $0x1,%eax
   28428:	ff e2                	jmp    *%rdx
   2842a:	f3 0f 1e fa          	endbr64
   2842e:	f3 0f 6f 4b e0       	movdqu -0x20(%rbx),%xmm1
   28433:	f3 0f 6f 43 d0       	movdqu -0x30(%rbx),%xmm0
   28438:	49 83 c4 01          	add    $0x1,%r12
   2843c:	0f 11 4b d0          	movups %xmm1,-0x30(%rbx)
   28440:	f3 0f 6f 4b f0       	movdqu -0x10(%rbx),%xmm1
   28445:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   28449:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   2844d:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28453:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   28457:	49 89 c2             	mov    %rax,%r10
   2845a:	b8 01 00 00 00       	mov    $0x1,%eax
   2845f:	ff e2                	jmp    *%rdx
   28461:	f3 0f 1e fa          	endbr64
   28465:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   2846a:	f3 0f 6f 4b d0       	movdqu -0x30(%rbx),%xmm1
   2846f:	49 83 c4 01          	add    $0x1,%r12
   28473:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   28477:	0f 11 43 d0          	movups %xmm0,-0x30(%rbx)
   2847b:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28481:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   28485:	49 89 c2             	mov    %rax,%r10
   28488:	b8 01 00 00 00       	mov    $0x1,%eax
   2848d:	ff e2                	jmp    *%rdx
   2848f:	f3 0f 1e fa          	endbr64
   28493:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   28498:	0f 11 03             	movups %xmm0,(%rbx)
   2849b:	66 48 0f 7e c2       	movq   %xmm0,%rdx
   284a0:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   284a5:	48 8b 43 08          	mov    0x8(%rbx),%rax
   284a9:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   284ad:	f3 0f 6f 43 d0       	movdqu -0x30(%rbx),%xmm0
   284b2:	0f 11 43 e0          	movups %xmm0,-0x20(%rbx)
   284b6:	f3 0f 6f 43 c0       	movdqu -0x40(%rbx),%xmm0
   284bb:	0f 11 43 d0          	movups %xmm0,-0x30(%rbx)
   284bf:	83 f8 f6             	cmp    $0xfffffff6,%eax
   284c2:	76 04                	jbe    284c8 <JS_CallInternal+0x31b8>
   284c4:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   284c8:	48 89 53 c0          	mov    %rdx,-0x40(%rbx)
   284cc:	49 83 c4 01          	add    $0x1,%r12
   284d0:	48 83 c3 10          	add    $0x10,%rbx
   284d4:	48 89 43 b8          	mov    %rax,-0x48(%rbx)
   284d8:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   284de:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   284e2:	49 89 c2             	mov    %rax,%r10
   284e5:	b8 01 00 00 00       	mov    $0x1,%eax
   284ea:	ff e2                	jmp    *%rdx
   284ec:	f3 0f 1e fa          	endbr64
   284f0:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   284f5:	0f 11 03             	movups %xmm0,(%rbx)
   284f8:	66 48 0f 7e c2       	movq   %xmm0,%rdx
   284fd:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   28502:	48 8b 43 08          	mov    0x8(%rbx),%rax
   28506:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   2850a:	f3 0f 6f 43 d0       	movdqu -0x30(%rbx),%xmm0
   2850f:	0f 11 43 e0          	movups %xmm0,-0x20(%rbx)
   28513:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28516:	76 04                	jbe    2851c <JS_CallInternal+0x320c>
   28518:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2851c:	48 89 53 d0          	mov    %rdx,-0x30(%rbx)
   28520:	49 83 c4 01          	add    $0x1,%r12
   28524:	48 83 c3 10          	add    $0x10,%rbx
   28528:	48 89 43 c8          	mov    %rax,-0x38(%rbx)
   2852c:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28532:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   28536:	49 89 c2             	mov    %rax,%r10
   28539:	b8 01 00 00 00       	mov    $0x1,%eax
   2853e:	ff e2                	jmp    *%rdx
   28540:	f3 0f 1e fa          	endbr64
   28544:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   28549:	0f 11 03             	movups %xmm0,(%rbx)
   2854c:	66 48 0f 7e c2       	movq   %xmm0,%rdx
   28551:	48 8b 43 08          	mov    0x8(%rbx),%rax
   28555:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   2855a:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   2855e:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28561:	76 04                	jbe    28567 <JS_CallInternal+0x3257>
   28563:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   28567:	48 89 53 e0          	mov    %rdx,-0x20(%rbx)
   2856b:	49 83 c4 01          	add    $0x1,%r12
   2856f:	48 83 c3 10          	add    $0x10,%rbx
   28573:	48 89 43 d8          	mov    %rax,-0x28(%rbx)
   28577:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2857d:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   28581:	49 89 c2             	mov    %rax,%r10
   28584:	b8 01 00 00 00       	mov    $0x1,%eax
   28589:	ff e2                	jmp    *%rdx
   2858b:	f3 0f 1e fa          	endbr64
   2858f:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   28594:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   28598:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   2859c:	0f 11 03             	movups %xmm0,(%rbx)
   2859f:	83 f8 f6             	cmp    $0xfffffff6,%eax
   285a2:	76 04                	jbe    285a8 <JS_CallInternal+0x3298>
   285a4:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   285a8:	48 89 53 f0          	mov    %rdx,-0x10(%rbx)
   285ac:	49 83 c4 01          	add    $0x1,%r12
   285b0:	48 83 c3 10          	add    $0x10,%rbx
   285b4:	48 89 43 e8          	mov    %rax,-0x18(%rbx)
   285b8:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   285be:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   285c2:	49 89 c2             	mov    %rax,%r10
   285c5:	b8 01 00 00 00       	mov    $0x1,%eax
   285ca:	ff e2                	jmp    *%rdx
   285cc:	f3 0f 1e fa          	endbr64
   285d0:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   285d5:	f3 0f 6f 4b f0       	movdqu -0x10(%rbx),%xmm1
   285da:	49 83 c4 01          	add    $0x1,%r12
   285de:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   285e2:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   285e6:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   285ec:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   285f0:	49 89 c2             	mov    %rax,%r10
   285f3:	b8 01 00 00 00       	mov    $0x1,%eax
   285f8:	ff e2                	jmp    *%rdx
   285fa:	f3 0f 1e fa          	endbr64
   285fe:	f3 0f 6f 4b d0       	movdqu -0x30(%rbx),%xmm1
   28603:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   28608:	49 83 c4 01          	add    $0x1,%r12
   2860c:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   28610:	f3 0f 6f 4b c0       	movdqu -0x40(%rbx),%xmm1
   28615:	0f 11 4b d0          	movups %xmm1,-0x30(%rbx)
   28619:	f3 0f 6f 4b b0       	movdqu -0x50(%rbx),%xmm1
   2861e:	0f 11 43 b0          	movups %xmm0,-0x50(%rbx)
   28622:	0f 11 4b c0          	movups %xmm1,-0x40(%rbx)
   28626:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2862c:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   28630:	49 89 c2             	mov    %rax,%r10
   28633:	b8 01 00 00 00       	mov    $0x1,%eax
   28638:	ff e2                	jmp    *%rdx
   2863a:	f3 0f 1e fa          	endbr64
   2863e:	f3 0f 6f 4b d0       	movdqu -0x30(%rbx),%xmm1
   28643:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   28648:	49 83 c4 01          	add    $0x1,%r12
   2864c:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   28650:	f3 0f 6f 4b c0       	movdqu -0x40(%rbx),%xmm1
   28655:	0f 11 43 c0          	movups %xmm0,-0x40(%rbx)
   28659:	0f 11 4b d0          	movups %xmm1,-0x30(%rbx)
   2865d:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28663:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   28667:	49 89 c2             	mov    %rax,%r10
   2866a:	b8 01 00 00 00       	mov    $0x1,%eax
   2866f:	ff e2                	jmp    *%rdx
   28671:	f3 0f 1e fa          	endbr64
   28675:	f3 0f 6f 4b e0       	movdqu -0x20(%rbx),%xmm1
   2867a:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2867f:	49 83 c4 01          	add    $0x1,%r12
   28683:	0f 11 4b f0          	movups %xmm1,-0x10(%rbx)
   28687:	f3 0f 6f 4b d0       	movdqu -0x30(%rbx),%xmm1
   2868c:	0f 11 43 d0          	movups %xmm0,-0x30(%rbx)
   28690:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   28694:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2869a:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2869e:	49 89 c2             	mov    %rax,%r10
   286a1:	b8 01 00 00 00       	mov    $0x1,%eax
   286a6:	ff e2                	jmp    *%rdx
   286a8:	f3 0f 1e fa          	endbr64
   286ac:	41 8b 04 24          	mov    (%r12),%eax
   286b0:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   286b7:	48 c1 e0 04          	shl    $0x4,%rax
   286bb:	48 03 41 50          	add    0x50(%rcx),%rax
   286bf:	48 8b 10             	mov    (%rax),%rdx
   286c2:	48 8b 40 08          	mov    0x8(%rax),%rax
   286c6:	83 f8 f6             	cmp    $0xfffffff6,%eax
   286c9:	76 04                	jbe    286cf <JS_CallInternal+0x33bf>
   286cb:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   286cf:	48 92                	xchg   %rax,%rdx
   286d1:	4c 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%r8
   286d8:	45 31 c9             	xor    %r9d,%r9d
   286db:	4c 89 ef             	mov    %r13,%rdi
   286de:	48 8b 8d 88 fe ff ff 	mov    -0x178(%rbp),%rcx
   286e5:	48 89 c6             	mov    %rax,%rsi
   286e8:	4d 8d 7c 24 04       	lea    0x4(%r12),%r15
   286ed:	e8 ce 64 02 00       	call   4ebc0 <js_closure>
   286f2:	48 89 03             	mov    %rax,(%rbx)
   286f5:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   286f9:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   286fd:	0f 84 78 58 00 00    	je     2df7b <JS_CallInternal+0x8c6b>
   28703:	41 0f b6 44 24 04    	movzbl 0x4(%r12),%eax
   28709:	48 83 c3 10          	add    $0x10,%rbx
   2870d:	49 83 c4 05          	add    $0x5,%r12
   28711:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   28715:	49 89 c2             	mov    %rax,%r10
   28718:	b8 01 00 00 00       	mov    $0x1,%eax
   2871d:	ff e2                	jmp    *%rdx
   2871f:	f3 0f 1e fa          	endbr64
   28723:	f3 0f 6f 53 e0       	movdqu -0x20(%rbx),%xmm2
   28728:	f3 0f 6f 4b c0       	movdqu -0x40(%rbx),%xmm1
   2872d:	49 83 c4 01          	add    $0x1,%r12
   28731:	f3 0f 6f 43 d0       	movdqu -0x30(%rbx),%xmm0
   28736:	0f 11 53 c0          	movups %xmm2,-0x40(%rbx)
   2873a:	f3 0f 6f 53 f0       	movdqu -0x10(%rbx),%xmm2
   2873f:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   28743:	0f 11 53 d0          	movups %xmm2,-0x30(%rbx)
   28747:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   2874b:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28751:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   28755:	49 89 c2             	mov    %rax,%r10
   28758:	b8 01 00 00 00       	mov    $0x1,%eax
   2875d:	ff e2                	jmp    *%rdx
   2875f:	f3 0f 1e fa          	endbr64
   28763:	e9 88 cf ff ff       	jmp    256f0 <JS_CallInternal+0x3e0>
   28768:	f3 0f 1e fa          	endbr64
   2876c:	49 8b 45 58          	mov    0x58(%r13),%rax
   28770:	b9 01 00 00 00       	mov    $0x1,%ecx
   28775:	4c 89 ef             	mov    %r13,%rdi
   28778:	48 8b 70 10          	mov    0x10(%rax),%rsi
   2877c:	48 8b 50 18          	mov    0x18(%rax),%rdx
   28780:	e8 ab 26 02 00       	call   4ae30 <JS_NewObjectProtoClass>
   28785:	48 89 03             	mov    %rax,(%rbx)
   28788:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2878c:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   28790:	0f 84 0a 58 00 00    	je     2dfa0 <JS_CallInternal+0x8c90>
   28796:	41 0f b6 04 24       	movzbl (%r12),%eax
   2879b:	48 83 c3 10          	add    $0x10,%rbx
   2879f:	49 83 c4 01          	add    $0x1,%r12
   287a3:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   287a7:	49 89 c2             	mov    %rax,%r10
   287aa:	b8 01 00 00 00       	mov    $0x1,%eax
   287af:	ff e2                	jmp    *%rdx
   287b1:	f3 0f 1e fa          	endbr64
   287b5:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   287bc:	49 83 c4 01          	add    $0x1,%r12
   287c0:	48 83 c3 10          	add    $0x10,%rbx
   287c4:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   287cb:	00 
   287cc:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   287d2:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   287d6:	49 89 c2             	mov    %rax,%r10
   287d9:	b8 01 00 00 00       	mov    $0x1,%eax
   287de:	ff e2                	jmp    *%rdx
   287e0:	f3 0f 1e fa          	endbr64
   287e4:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   287eb:	49 83 c4 01          	add    $0x1,%r12
   287ef:	48 83 c3 10          	add    $0x10,%rbx
   287f3:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   287fa:	00 
   287fb:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28801:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   28805:	49 89 c2             	mov    %rax,%r10
   28808:	b8 01 00 00 00       	mov    $0x1,%eax
   2880d:	ff e2                	jmp    *%rdx
   2880f:	f3 0f 1e fa          	endbr64
   28813:	48 8b 85 c0 fe ff ff 	mov    -0x140(%rbp),%rax
   2881a:	f6 40 10 01          	testb  $0x1,0x10(%rax)
   2881e:	75 0d                	jne    2882d <JS_CallInternal+0x351d>
   28820:	83 bd 70 fe ff ff ff 	cmpl   $0xffffffff,-0x190(%rbp)
   28827:	0f 85 fa 6b 00 00    	jne    2f427 <JS_CallInternal+0xa117>
   2882d:	83 bd 70 fe ff ff f6 	cmpl   $0xfffffff6,-0x190(%rbp)
   28834:	76 0b                	jbe    28841 <JS_CallInternal+0x3531>
   28836:	48 8b 85 50 fe ff ff 	mov    -0x1b0(%rbp),%rax
   2883d:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   28841:	48 8b 85 70 fe ff ff 	mov    -0x190(%rbp),%rax
   28848:	48 8b 95 50 fe ff ff 	mov    -0x1b0(%rbp),%rdx
   2884f:	48 89 13             	mov    %rdx,(%rbx)
   28852:	49 83 c4 01          	add    $0x1,%r12
   28856:	48 83 c3 10          	add    $0x10,%rbx
   2885a:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2885e:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28864:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   28868:	49 89 c2             	mov    %rax,%r10
   2886b:	b8 01 00 00 00       	mov    $0x1,%eax
   28870:	ff e2                	jmp    *%rdx
   28872:	f3 0f 1e fa          	endbr64
   28876:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   2887a:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   2887e:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28881:	76 11                	jbe    28894 <JS_CallInternal+0x3584>
   28883:	8b 71 fc             	mov    -0x4(%rcx),%esi
   28886:	8d 56 ff             	lea    -0x1(%rsi),%edx
   28889:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2888c:	85 d2                	test   %edx,%edx
   2888e:	0f 8e b8 54 00 00    	jle    2dd4c <JS_CallInternal+0x8a3c>
   28894:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   28899:	49 83 c4 01          	add    $0x1,%r12
   2889d:	48 83 eb 10          	sub    $0x10,%rbx
   288a1:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   288a5:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   288ab:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   288af:	49 89 c2             	mov    %rax,%r10
   288b2:	b8 01 00 00 00       	mov    $0x1,%eax
   288b7:	ff e2                	jmp    *%rdx
   288b9:	f3 0f 1e fa          	endbr64
   288bd:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   288c4:	49 83 c4 01          	add    $0x1,%r12
   288c8:	48 83 c3 10          	add    $0x10,%rbx
   288cc:	48 c7 43 f8 02 00 00 	movq   $0x2,-0x8(%rbx)
   288d3:	00 
   288d4:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   288da:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   288de:	49 89 c2             	mov    %rax,%r10
   288e1:	b8 01 00 00 00       	mov    $0x1,%eax
   288e6:	ff e2                	jmp    *%rdx
   288e8:	f3 0f 1e fa          	endbr64
   288ec:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   288f3:	49 83 c4 01          	add    $0x1,%r12
   288f7:	48 83 c3 10          	add    $0x10,%rbx
   288fb:	48 c7 43 f8 03 00 00 	movq   $0x3,-0x8(%rbx)
   28902:	00 
   28903:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28909:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2890d:	49 89 c2             	mov    %rax,%r10
   28910:	b8 01 00 00 00       	mov    $0x1,%eax
   28915:	ff e2                	jmp    *%rdx
   28917:	f3 0f 1e fa          	endbr64
   2891b:	41 8b 34 24          	mov    (%r12),%esi
   2891f:	31 d2                	xor    %edx,%edx
   28921:	4c 89 ef             	mov    %r13,%rdi
   28924:	48 83 c3 10          	add    $0x10,%rbx
   28928:	49 83 c4 05          	add    $0x5,%r12
   2892c:	e8 cf 33 01 00       	call   3bd00 <__JS_AtomToValue>
   28931:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   28935:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   28939:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2893f:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   28943:	49 89 c2             	mov    %rax,%r10
   28946:	b8 01 00 00 00       	mov    $0x1,%eax
   2894b:	ff e2                	jmp    *%rdx
   2894d:	f3 0f 1e fa          	endbr64
   28951:	ba 01 00 00 00       	mov    $0x1,%edx
   28956:	4c 89 ef             	mov    %r13,%rdi
   28959:	48 83 c3 10          	add    $0x10,%rbx
   2895d:	49 83 c4 01          	add    $0x1,%r12
   28961:	be 2f 00 00 00       	mov    $0x2f,%esi
   28966:	e8 95 33 01 00       	call   3bd00 <__JS_AtomToValue>
   2896b:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2896f:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   28973:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28979:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2897d:	49 89 c2             	mov    %rax,%r10
   28980:	b8 01 00 00 00       	mov    $0x1,%eax
   28985:	ff e2                	jmp    *%rdx
   28987:	f3 0f 1e fa          	endbr64
   2898b:	8b 8d a8 fe ff ff    	mov    -0x158(%rbp),%ecx
   28991:	41 0f b7 04 24       	movzwl (%r12),%eax
   28996:	4c 89 ef             	mov    %r13,%rdi
   28999:	4d 8d 7c 24 02       	lea    0x2(%r12),%r15
   2899e:	39 c8                	cmp    %ecx,%eax
   289a0:	0f 4f c1             	cmovg  %ecx,%eax
   289a3:	48 63 d0             	movslq %eax,%rdx
   289a6:	29 c1                	sub    %eax,%ecx
   289a8:	48 c1 e2 04          	shl    $0x4,%rdx
   289ac:	89 ce                	mov    %ecx,%esi
   289ae:	48 03 95 98 fe ff ff 	add    -0x168(%rbp),%rdx
   289b5:	e8 d6 41 02 00       	call   4cb90 <js_create_array>
   289ba:	48 89 03             	mov    %rax,(%rbx)
   289bd:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   289c1:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   289c5:	0f 84 a7 55 00 00    	je     2df72 <JS_CallInternal+0x8c62>
   289cb:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   289d1:	48 83 c3 10          	add    $0x10,%rbx
   289d5:	49 83 c4 03          	add    $0x3,%r12
   289d9:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   289dd:	49 89 c2             	mov    %rax,%r10
   289e0:	b8 01 00 00 00       	mov    $0x1,%eax
   289e5:	ff e2                	jmp    *%rdx
   289e7:	f3 0f 1e fa          	endbr64
   289eb:	4d 8d 7c 24 01       	lea    0x1(%r12),%r15
   289f0:	41 80 3c 24 06       	cmpb   $0x6,(%r12)
   289f5:	0f 87 e2 9b fe ff    	ja     125dd <JS_CallInternal.cold>
   289fb:	41 0f b6 04 24       	movzbl (%r12),%eax
   28a00:	48 8d 15 71 a7 0b 00 	lea    0xba771(%rip),%rdx        # e3178 <qjsc_repl_size+0x4cc>
   28a07:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
   28a0b:	48 01 d0             	add    %rdx,%rax
   28a0e:	3e ff e0             	notrack jmp *%rax
   28a11:	48 8d 43 10          	lea    0x10(%rbx),%rax
   28a15:	b9 01 00 00 00       	mov    $0x1,%ecx
   28a1a:	31 f6                	xor    %esi,%esi
   28a1c:	ba 02 00 00 00       	mov    $0x2,%edx
   28a21:	4c 89 ef             	mov    %r13,%rdi
   28a24:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   28a2b:	e8 00 24 02 00       	call   4ae30 <JS_NewObjectProtoClass>
   28a30:	48 89 03             	mov    %rax,(%rbx)
   28a33:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   28a37:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   28a3b:	0f 84 f3 00 00 00    	je     28b34 <JS_CallInternal+0x3824>
   28a41:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   28a48:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
   28a4e:	49 83 c4 02          	add    $0x2,%r12
   28a52:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   28a56:	49 89 c2             	mov    %rax,%r10
   28a59:	b8 01 00 00 00       	mov    $0x1,%eax
   28a5e:	ff e2                	jmp    *%rdx
   28a60:	48 8b 85 40 fe ff ff 	mov    -0x1c0(%rbp),%rax
   28a67:	48 8b 40 38          	mov    0x38(%rax),%rax
   28a6b:	48 85 c0             	test   %rax,%rax
   28a6e:	0f 84 8a 71 00 00    	je     2fbfe <JS_CallInternal+0xa8ee>
   28a74:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   28a78:	48 83 c3 10          	add    $0x10,%rbx
   28a7c:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   28a80:	48 c7 43 f8 ff ff ff 	movq   $0xffffffffffffffff,-0x8(%rbx)
   28a87:	ff 
   28a88:	eb be                	jmp    28a48 <JS_CallInternal+0x3738>
   28a8a:	48 8d 43 10          	lea    0x10(%rbx),%rax
   28a8e:	83 bd 78 fe ff ff f6 	cmpl   $0xfffffff6,-0x188(%rbp)
   28a95:	76 0b                	jbe    28aa2 <JS_CallInternal+0x3792>
   28a97:	48 8b 8d 58 fe ff ff 	mov    -0x1a8(%rbp),%rcx
   28a9e:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   28aa2:	48 8b 8d 58 fe ff ff 	mov    -0x1a8(%rbp),%rcx
   28aa9:	48 89 0b             	mov    %rcx,(%rbx)
   28aac:	48 8b 8d 78 fe ff ff 	mov    -0x188(%rbp),%rcx
   28ab3:	48 89 4b 08          	mov    %rcx,0x8(%rbx)
   28ab7:	48 89 c3             	mov    %rax,%rbx
   28aba:	eb 8c                	jmp    28a48 <JS_CallInternal+0x3738>
   28abc:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   28ac3:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   28ac7:	48 8b 56 10          	mov    0x10(%rsi),%rdx
   28acb:	48 8b 46 08          	mov    0x8(%rsi),%rax
   28acf:	83 fa f6             	cmp    $0xfffffff6,%edx
   28ad2:	76 04                	jbe    28ad8 <JS_CallInternal+0x37c8>
   28ad4:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   28ad8:	48 89 03             	mov    %rax,(%rbx)
   28adb:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   28adf:	48 89 cb             	mov    %rcx,%rbx
   28ae2:	e9 61 ff ff ff       	jmp    28a48 <JS_CallInternal+0x3738>
   28ae7:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   28aee:	48 8d 43 10          	lea    0x10(%rbx),%rax
   28af2:	48 8b 95 98 fe ff ff 	mov    -0x168(%rbp),%rdx
   28af9:	4c 89 ef             	mov    %r13,%rdi
   28afc:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   28b03:	8b 85 a8 fe ff ff    	mov    -0x158(%rbp),%eax
   28b09:	44 0f b7 41 38       	movzwl 0x38(%rcx),%r8d
   28b0e:	48 8b 8d b8 fe ff ff 	mov    -0x148(%rbp),%rcx
   28b15:	89 c6                	mov    %eax,%esi
   28b17:	41 39 c0             	cmp    %eax,%r8d
   28b1a:	44 0f 4f c0          	cmovg  %eax,%r8d
   28b1e:	e8 8d 1e 02 00       	call   4a9b0 <js_build_mapped_arguments>
   28b23:	48 89 03             	mov    %rax,(%rbx)
   28b26:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   28b2a:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   28b2e:	0f 85 0d ff ff ff    	jne    28a41 <JS_CallInternal+0x3731>
   28b34:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   28b3b:	e9 10 cf ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   28b40:	48 8d 43 10          	lea    0x10(%rbx),%rax
   28b44:	49 8b 95 58 01 00 00 	mov    0x158(%r13),%rdx
   28b4b:	48 c7 85 58 ff ff ff 	movq   $0x0,-0xa8(%rbp)
   28b52:	00 00 00 00 
   28b56:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   28b5d:	8b 85 a8 fe ff ff    	mov    -0x158(%rbp),%eax
   28b63:	48 89 85 50 ff ff ff 	mov    %rax,-0xb0(%rbp)
   28b6a:	49 8b 85 50 01 00 00 	mov    0x150(%r13),%rax
   28b71:	83 fa f6             	cmp    $0xfffffff6,%edx
   28b74:	76 04                	jbe    28b7a <JS_CallInternal+0x386a>
   28b76:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   28b7a:	48 89 85 60 ff ff ff 	mov    %rax,-0xa0(%rbp)
   28b81:	49 8b 85 60 01 00 00 	mov    0x160(%r13),%rax
   28b88:	41 83 bd 68 01 00 00 	cmpl   $0xfffffff6,0x168(%r13)
   28b8f:	f6 
   28b90:	48 89 95 68 ff ff ff 	mov    %rdx,-0x98(%rbp)
   28b97:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
   28b9e:	76 04                	jbe    28ba4 <JS_CallInternal+0x3894>
   28ba0:	83 40 fc 02          	addl   $0x2,-0x4(%rax)
   28ba4:	49 8b 75 38          	mov    0x38(%r13),%rsi
   28ba8:	48 8d 8d 50 ff ff ff 	lea    -0xb0(%rbp),%rcx
   28baf:	ba 08 00 00 00       	mov    $0x8,%edx
   28bb4:	4c 89 ef             	mov    %r13,%rdi
   28bb7:	48 89 85 78 ff ff ff 	mov    %rax,-0x88(%rbp)
   28bbe:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   28bc2:	e8 b9 19 02 00       	call   4a580 <JS_NewObjectFromShape>
   28bc7:	48 89 c1             	mov    %rax,%rcx
   28bca:	83 fa 06             	cmp    $0x6,%edx
   28bcd:	0f 84 61 72 00 00    	je     2fe34 <JS_CallInternal+0xab24>
   28bd3:	8b 85 a8 fe ff ff    	mov    -0x158(%rbp),%eax
   28bd9:	85 c0                	test   %eax,%eax
   28bdb:	0f 8f a8 64 00 00    	jg     2f089 <JS_CallInternal+0x9d79>
   28be1:	48 c7 41 30 00 00 00 	movq   $0x0,0x30(%rcx)
   28be8:	00 
   28be9:	89 41 38             	mov    %eax,0x38(%rcx)
   28bec:	48 89 0b             	mov    %rcx,(%rbx)
   28bef:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   28bf3:	e9 49 fe ff ff       	jmp    28a41 <JS_CallInternal+0x3731>
   28bf8:	48 8d 43 10          	lea    0x10(%rbx),%rax
   28bfc:	31 f6                	xor    %esi,%esi
   28bfe:	4c 89 ef             	mov    %r13,%rdi
   28c01:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   28c08:	e8 b3 c5 ff ff       	call   251c0 <JS_GetScriptOrModuleName>
   28c0d:	89 c2                	mov    %eax,%edx
   28c0f:	85 d2                	test   %edx,%edx
   28c11:	0f 84 17 62 00 00    	je     2ee2e <JS_CallInternal+0x9b1e>
   28c17:	49 8b 85 b8 01 00 00 	mov    0x1b8(%r13),%rax
   28c1e:	49 8d 8d b0 01 00 00 	lea    0x1b0(%r13),%rcx
   28c25:	48 39 c1             	cmp    %rax,%rcx
   28c28:	75 13                	jne    28c3d <JS_CallInternal+0x392d>
   28c2a:	e9 d6 61 00 00       	jmp    2ee05 <JS_CallInternal+0x9af5>
   28c2f:	90                   	nop
   28c30:	48 8b 40 08          	mov    0x8(%rax),%rax
   28c34:	48 39 c1             	cmp    %rax,%rcx
   28c37:	0f 84 c9 63 00 00    	je     2f006 <JS_CallInternal+0x9cf6>
   28c3d:	3b 50 f8             	cmp    -0x8(%rax),%edx
   28c40:	75 ee                	jne    28c30 <JS_CallInternal+0x3920>
   28c42:	48 83 e8 18          	sub    $0x18,%rax
   28c46:	81 fa f2 00 00 00    	cmp    $0xf2,%edx
   28c4c:	0f 8f c2 63 00 00    	jg     2f014 <JS_CallInternal+0x9d04>
   28c52:	48 89 c6             	mov    %rax,%rsi
   28c55:	4c 89 ef             	mov    %r13,%rdi
   28c58:	e8 33 c6 ff ff       	call   25290 <JS_GetImportMeta>
   28c5d:	48 89 03             	mov    %rax,(%rbx)
   28c60:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   28c64:	83 fa 06             	cmp    $0x6,%edx
   28c67:	0f 85 d4 fd ff ff    	jne    28a41 <JS_CallInternal+0x3731>
   28c6d:	e9 c2 fe ff ff       	jmp    28b34 <JS_CallInternal+0x3824>
   28c72:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   28c78:	f3 0f 1e fa          	endbr64
   28c7c:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   28c80:	48 83 eb 10          	sub    $0x10,%rbx
   28c84:	48 8b 0b             	mov    (%rbx),%rcx
   28c87:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28c8a:	76 11                	jbe    28c9d <JS_CallInternal+0x398d>
   28c8c:	8b 71 fc             	mov    -0x4(%rcx),%esi
   28c8f:	8d 56 ff             	lea    -0x1(%rsi),%edx
   28c92:	89 51 fc             	mov    %edx,-0x4(%rcx)
   28c95:	85 d2                	test   %edx,%edx
   28c97:	0f 8e 94 4c 00 00    	jle    2d931 <JS_CallInternal+0x8621>
   28c9d:	41 0f b6 04 24       	movzbl (%r12),%eax
   28ca2:	49 83 c4 01          	add    $0x1,%r12
   28ca6:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   28caa:	49 89 c2             	mov    %rax,%r10
   28cad:	b8 01 00 00 00       	mov    $0x1,%eax
   28cb2:	ff e2                	jmp    *%rdx
   28cb4:	f3 0f 1e fa          	endbr64
   28cb8:	83 7b f8 03          	cmpl   $0x3,-0x8(%rbx)
   28cbc:	74 18                	je     28cd6 <JS_CallInternal+0x39c6>
   28cbe:	4c 8d 7b f0          	lea    -0x10(%rbx),%r15
   28cc2:	e9 e8 d9 ff ff       	jmp    266af <JS_CallInternal+0x139f>
   28cc7:	f3 0f 1e fa          	endbr64
   28ccb:	8b 43 f8             	mov    -0x8(%rbx),%eax
   28cce:	83 e8 02             	sub    $0x2,%eax
   28cd1:	83 f8 01             	cmp    $0x1,%eax
   28cd4:	77 e8                	ja     28cbe <JS_CallInternal+0x39ae>
   28cd6:	48 c7 43 f0 01 00 00 	movq   $0x1,-0x10(%rbx)
   28cdd:	00 
   28cde:	49 83 c4 01          	add    $0x1,%r12
   28ce2:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   28ce9:	00 
   28cea:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28cf0:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   28cf4:	49 89 c2             	mov    %rax,%r10
   28cf7:	b8 01 00 00 00       	mov    $0x1,%eax
   28cfc:	ff e2                	jmp    *%rdx
   28cfe:	f3 0f 1e fa          	endbr64
   28d02:	41 0f b6 04 24       	movzbl (%r12),%eax
   28d07:	49 83 c4 01          	add    $0x1,%r12
   28d0b:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   28d0f:	49 89 c2             	mov    %rax,%r10
   28d12:	b8 01 00 00 00       	mov    $0x1,%eax
   28d17:	ff e2                	jmp    *%rdx
   28d19:	f3 0f 1e fa          	endbr64
   28d1d:	31 c0                	xor    %eax,%eax
   28d1f:	b9 03 00 00 00       	mov    $0x3,%ecx
   28d24:	e9 a7 cd ff ff       	jmp    25ad0 <JS_CallInternal+0x7c0>
   28d29:	f3 0f 1e fa          	endbr64
   28d2d:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   28d31:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   28d35:	4c 89 ef             	mov    %r13,%rdi
   28d38:	4c 8d 7b f0          	lea    -0x10(%rbx),%r15
   28d3c:	e8 5f c0 ff ff       	call   24da0 <js_operator_typeof>
   28d41:	83 f8 49             	cmp    $0x49,%eax
   28d44:	0f 85 65 d9 ff ff    	jne    266af <JS_CallInternal+0x139f>
   28d4a:	49 8b 47 08          	mov    0x8(%r15),%rax
   28d4e:	49 8b 17             	mov    (%r15),%rdx
   28d51:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28d54:	76 80                	jbe    28cd6 <JS_CallInternal+0x39c6>
   28d56:	8b 4a fc             	mov    -0x4(%rdx),%ecx
   28d59:	83 e9 01             	sub    $0x1,%ecx
   28d5c:	89 4a fc             	mov    %ecx,-0x4(%rdx)
   28d5f:	85 c9                	test   %ecx,%ecx
   28d61:	0f 8f 6f ff ff ff    	jg     28cd6 <JS_CallInternal+0x39c6>
   28d67:	48 92                	xchg   %rax,%rdx
   28d69:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   28d6d:	48 89 c6             	mov    %rax,%rsi
   28d70:	e8 fb 5a ff ff       	call   1e870 <__JS_FreeValueRT>
   28d75:	e9 5c ff ff ff       	jmp    28cd6 <JS_CallInternal+0x39c6>
   28d7a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   28d80:	f3 0f 1e fa          	endbr64
   28d84:	83 7b f8 02          	cmpl   $0x2,-0x8(%rbx)
   28d88:	0f 85 30 ff ff ff    	jne    28cbe <JS_CallInternal+0x39ae>
   28d8e:	e9 43 ff ff ff       	jmp    28cd6 <JS_CallInternal+0x39c6>
   28d93:	f3 0f 1e fa          	endbr64
   28d97:	e9 64 c8 ff ff       	jmp    25600 <JS_CallInternal+0x2f0>
   28d9c:	f3 0f 1e fa          	endbr64
   28da0:	e9 5b c8 ff ff       	jmp    25600 <JS_CallInternal+0x2f0>
   28da5:	f3 0f 1e fa          	endbr64
   28da9:	e9 52 c8 ff ff       	jmp    25600 <JS_CallInternal+0x2f0>
   28dae:	f3 0f 1e fa          	endbr64
   28db2:	e9 49 c8 ff ff       	jmp    25600 <JS_CallInternal+0x2f0>
   28db7:	f3 0f 1e fa          	endbr64
   28dbb:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   28dc2:	41 8b 04 24          	mov    (%r12),%eax
   28dc6:	48 c1 e0 04          	shl    $0x4,%rax
   28dca:	48 03 41 50          	add    0x50(%rcx),%rax
   28dce:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   28dd2:	48 8b 10             	mov    (%rax),%rdx
   28dd5:	48 8b 40 08          	mov    0x8(%rax),%rax
   28dd9:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28ddc:	76 04                	jbe    28de2 <JS_CallInternal+0x3ad2>
   28dde:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   28de2:	48 89 13             	mov    %rdx,(%rbx)
   28de5:	49 83 c4 05          	add    $0x5,%r12
   28de9:	48 89 43 08          	mov    %rax,0x8(%rbx)
   28ded:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28df3:	48 89 cb             	mov    %rcx,%rbx
   28df6:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   28dfa:	49 89 c2             	mov    %rax,%r10
   28dfd:	b8 01 00 00 00       	mov    $0x1,%eax
   28e02:	ff e2                	jmp    *%rdx
   28e04:	f3 0f 1e fa          	endbr64
   28e08:	49 63 04 24          	movslq (%r12),%rax
   28e0c:	48 c7 43 08 07 00 00 	movq   $0x7,0x8(%rbx)
   28e13:	00 
   28e14:	49 83 c4 05          	add    $0x5,%r12
   28e18:	48 83 c3 10          	add    $0x10,%rbx
   28e1c:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   28e20:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28e26:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   28e2a:	49 89 c2             	mov    %rax,%r10
   28e2d:	b8 01 00 00 00       	mov    $0x1,%eax
   28e32:	ff e2                	jmp    *%rdx
   28e34:	f3 0f 1e fa          	endbr64
   28e38:	41 8b 04 24          	mov    (%r12),%eax
   28e3c:	48 c7 43 08 00 00 00 	movq   $0x0,0x8(%rbx)
   28e43:	00 
   28e44:	49 83 c4 05          	add    $0x5,%r12
   28e48:	48 83 c3 10          	add    $0x10,%rbx
   28e4c:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   28e50:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28e56:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   28e5a:	49 89 c2             	mov    %rax,%r10
   28e5d:	b8 01 00 00 00       	mov    $0x1,%eax
   28e62:	ff e2                	jmp    *%rdx
   28e64:	f3 0f 1e fa          	endbr64
   28e68:	e9 93 c7 ff ff       	jmp    25600 <JS_CallInternal+0x2f0>
   28e6d:	f3 0f 1e fa          	endbr64
   28e71:	e9 8a c7 ff ff       	jmp    25600 <JS_CallInternal+0x2f0>
   28e76:	f3 0f 1e fa          	endbr64
   28e7a:	e9 81 c7 ff ff       	jmp    25600 <JS_CallInternal+0x2f0>
   28e7f:	f3 0f 1e fa          	endbr64
   28e83:	41 0f bf 04 24       	movswl (%r12),%eax
   28e88:	48 83 c3 10          	add    $0x10,%rbx
   28e8c:	49 83 c4 03          	add    $0x3,%r12
   28e90:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   28e97:	00 
   28e98:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   28e9c:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28ea2:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   28ea6:	49 89 c2             	mov    %rax,%r10
   28ea9:	b8 01 00 00 00       	mov    $0x1,%eax
   28eae:	ff e2                	jmp    *%rdx
   28eb0:	f3 0f 1e fa          	endbr64
   28eb4:	41 0f be 04 24       	movsbl (%r12),%eax
   28eb9:	48 83 c3 10          	add    $0x10,%rbx
   28ebd:	49 83 c4 02          	add    $0x2,%r12
   28ec1:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   28ec8:	00 
   28ec9:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   28ecd:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28ed3:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   28ed7:	49 89 c2             	mov    %rax,%r10
   28eda:	b8 01 00 00 00       	mov    $0x1,%eax
   28edf:	ff e2                	jmp    *%rdx
   28ee1:	f3 0f 1e fa          	endbr64
   28ee5:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   28eec:	41 0f b6 04 24       	movzbl (%r12),%eax
   28ef1:	48 c1 e0 04          	shl    $0x4,%rax
   28ef5:	48 03 41 50          	add    0x50(%rcx),%rax
   28ef9:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   28efd:	48 8b 10             	mov    (%rax),%rdx
   28f00:	48 8b 40 08          	mov    0x8(%rax),%rax
   28f04:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28f07:	76 04                	jbe    28f0d <JS_CallInternal+0x3bfd>
   28f09:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   28f0d:	48 89 13             	mov    %rdx,(%rbx)
   28f10:	49 83 c4 02          	add    $0x2,%r12
   28f14:	48 89 43 08          	mov    %rax,0x8(%rbx)
   28f18:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28f1e:	48 89 cb             	mov    %rcx,%rbx
   28f21:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   28f25:	49 89 c2             	mov    %rax,%r10
   28f28:	b8 01 00 00 00       	mov    $0x1,%eax
   28f2d:	ff e2                	jmp    *%rdx
   28f2f:	f3 0f 1e fa          	endbr64
   28f33:	41 0f b7 04 24       	movzwl (%r12),%eax
   28f38:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   28f3d:	48 c1 e0 04          	shl    $0x4,%rax
   28f41:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   28f48:	48 8b 50 08          	mov    0x8(%rax),%rdx
   28f4c:	48 8b 08             	mov    (%rax),%rcx
   28f4f:	0f 11 00             	movups %xmm0,(%rax)
   28f52:	83 fa f6             	cmp    $0xfffffff6,%edx
   28f55:	76 11                	jbe    28f68 <JS_CallInternal+0x3c58>
   28f57:	8b 41 fc             	mov    -0x4(%rcx),%eax
   28f5a:	83 e8 01             	sub    $0x1,%eax
   28f5d:	89 41 fc             	mov    %eax,-0x4(%rcx)
   28f60:	85 c0                	test   %eax,%eax
   28f62:	0f 8e 95 49 00 00    	jle    2d8fd <JS_CallInternal+0x85ed>
   28f68:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   28f6e:	48 83 eb 10          	sub    $0x10,%rbx
   28f72:	49 83 c4 03          	add    $0x3,%r12
   28f76:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   28f7a:	49 89 c2             	mov    %rax,%r10
   28f7d:	b8 01 00 00 00       	mov    $0x1,%eax
   28f82:	ff e2                	jmp    *%rdx
   28f84:	f3 0f 1e fa          	endbr64
   28f88:	41 0f b7 04 24       	movzwl (%r12),%eax
   28f8d:	48 c1 e0 04          	shl    $0x4,%rax
   28f91:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   28f98:	48 8b 10             	mov    (%rax),%rdx
   28f9b:	48 8b 40 08          	mov    0x8(%rax),%rax
   28f9f:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28fa2:	76 04                	jbe    28fa8 <JS_CallInternal+0x3c98>
   28fa4:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   28fa8:	48 89 13             	mov    %rdx,(%rbx)
   28fab:	49 83 c4 03          	add    $0x3,%r12
   28faf:	48 83 c3 10          	add    $0x10,%rbx
   28fb3:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   28fb7:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28fbd:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   28fc1:	49 89 c2             	mov    %rax,%r10
   28fc4:	b8 01 00 00 00       	mov    $0x1,%eax
   28fc9:	ff e2                	jmp    *%rdx
   28fcb:	f3 0f 1e fa          	endbr64
   28fcf:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   28fd3:	41 0f b7 04 24       	movzwl (%r12),%eax
   28fd8:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   28fdc:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   28fdf:	76 04                	jbe    28fe5 <JS_CallInternal+0x3cd5>
   28fe1:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   28fe5:	48 c1 e0 04          	shl    $0x4,%rax
   28fe9:	48 03 85 80 fe ff ff 	add    -0x180(%rbp),%rax
   28ff0:	48 8b 50 08          	mov    0x8(%rax),%rdx
   28ff4:	48 8b 38             	mov    (%rax),%rdi
   28ff7:	48 89 48 08          	mov    %rcx,0x8(%rax)
   28ffb:	48 89 30             	mov    %rsi,(%rax)
   28ffe:	83 fa f6             	cmp    $0xfffffff6,%edx
   29001:	76 11                	jbe    29014 <JS_CallInternal+0x3d04>
   29003:	8b 47 fc             	mov    -0x4(%rdi),%eax
   29006:	83 e8 01             	sub    $0x1,%eax
   29009:	89 47 fc             	mov    %eax,-0x4(%rdi)
   2900c:	85 c0                	test   %eax,%eax
   2900e:	0f 8e 0b 4b 00 00    	jle    2db1f <JS_CallInternal+0x880f>
   29014:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   2901a:	49 83 c4 03          	add    $0x3,%r12
   2901e:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   29022:	49 89 c2             	mov    %rax,%r10
   29025:	b8 01 00 00 00       	mov    $0x1,%eax
   2902a:	ff e2                	jmp    *%rdx
   2902c:	f3 0f 1e fa          	endbr64
   29030:	41 0f b7 04 24       	movzwl (%r12),%eax
   29035:	48 c1 e0 04          	shl    $0x4,%rax
   29039:	48 03 85 80 fe ff ff 	add    -0x180(%rbp),%rax
   29040:	48 8b 10             	mov    (%rax),%rdx
   29043:	48 8b 40 08          	mov    0x8(%rax),%rax
   29047:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2904a:	76 04                	jbe    29050 <JS_CallInternal+0x3d40>
   2904c:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   29050:	48 89 13             	mov    %rdx,(%rbx)
   29053:	49 83 c4 03          	add    $0x3,%r12
   29057:	48 83 c3 10          	add    $0x10,%rbx
   2905b:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2905f:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29065:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   29069:	49 89 c2             	mov    %rax,%r10
   2906c:	b8 01 00 00 00       	mov    $0x1,%eax
   29071:	ff e2                	jmp    *%rdx
   29073:	f3 0f 1e fa          	endbr64
   29077:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2907b:	41 0f b7 04 24       	movzwl (%r12),%eax
   29080:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   29084:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   29087:	76 04                	jbe    2908d <JS_CallInternal+0x3d7d>
   29089:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2908d:	48 c1 e0 04          	shl    $0x4,%rax
   29091:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   29098:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2909c:	48 8b 38             	mov    (%rax),%rdi
   2909f:	48 89 48 08          	mov    %rcx,0x8(%rax)
   290a3:	48 89 30             	mov    %rsi,(%rax)
   290a6:	83 fa f6             	cmp    $0xfffffff6,%edx
   290a9:	76 11                	jbe    290bc <JS_CallInternal+0x3dac>
   290ab:	8b 47 fc             	mov    -0x4(%rdi),%eax
   290ae:	83 e8 01             	sub    $0x1,%eax
   290b1:	89 47 fc             	mov    %eax,-0x4(%rdi)
   290b4:	85 c0                	test   %eax,%eax
   290b6:	0f 8e 52 4a 00 00    	jle    2db0e <JS_CallInternal+0x87fe>
   290bc:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   290c2:	49 83 c4 03          	add    $0x3,%r12
   290c6:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   290ca:	49 89 c2             	mov    %rax,%r10
   290cd:	b8 01 00 00 00       	mov    $0x1,%eax
   290d2:	ff e2                	jmp    *%rdx
   290d4:	f3 0f 1e fa          	endbr64
   290d8:	41 0f b7 04 24       	movzwl (%r12),%eax
   290dd:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   290e2:	48 c1 e0 04          	shl    $0x4,%rax
   290e6:	48 03 85 80 fe ff ff 	add    -0x180(%rbp),%rax
   290ed:	48 8b 50 08          	mov    0x8(%rax),%rdx
   290f1:	48 8b 08             	mov    (%rax),%rcx
   290f4:	0f 11 00             	movups %xmm0,(%rax)
   290f7:	83 fa f6             	cmp    $0xfffffff6,%edx
   290fa:	76 11                	jbe    2910d <JS_CallInternal+0x3dfd>
   290fc:	8b 41 fc             	mov    -0x4(%rcx),%eax
   290ff:	83 e8 01             	sub    $0x1,%eax
   29102:	89 41 fc             	mov    %eax,-0x4(%rcx)
   29105:	85 c0                	test   %eax,%eax
   29107:	0f 8e ff 45 00 00    	jle    2d70c <JS_CallInternal+0x83fc>
   2910d:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   29113:	48 83 eb 10          	sub    $0x10,%rbx
   29117:	49 83 c4 03          	add    $0x3,%r12
   2911b:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2911f:	49 89 c2             	mov    %rax,%r10
   29122:	b8 01 00 00 00       	mov    $0x1,%eax
   29127:	ff e2                	jmp    *%rdx
   29129:	f3 0f 1e fa          	endbr64
   2912d:	41 0f b7 0c 24       	movzwl (%r12),%ecx
   29132:	49 89 da             	mov    %rbx,%r10
   29135:	4d 8d 7c 24 04       	lea    0x4(%r12),%r15
   2913a:	41 0f b7 74 24 02    	movzwl 0x2(%r12),%esi
   29140:	49 8b 95 70 01 00 00 	mov    0x170(%r13),%rdx
   29147:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   2914d:	48 89 c8             	mov    %rcx,%rax
   29150:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   29156:	49 8b 8d 78 01 00 00 	mov    0x178(%r13),%rcx
   2915d:	48 c1 e0 04          	shl    $0x4,%rax
   29161:	66 89 b5 f0 fd ff ff 	mov    %si,-0x210(%rbp)
   29168:	49 29 c2             	sub    %rax,%r10
   2916b:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   29172:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   29179:	49 8b 7a f0          	mov    -0x10(%r10),%rdi
   2917d:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   29184:	4c 89 78 30          	mov    %r15,0x30(%rax)
   29188:	49 8b 42 f8          	mov    -0x8(%r10),%rax
   2918c:	48 89 bd 20 fe ff ff 	mov    %rdi,-0x1e0(%rbp)
   29193:	48 89 c6             	mov    %rax,%rsi
   29196:	48 89 85 e8 fd ff ff 	mov    %rax,-0x218(%rbp)
   2919d:	e8 0e 2c ff ff       	call   1bdb0 <js_strict_eq2.isra.0>
   291a2:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   291a9:	85 c0                	test   %eax,%eax
   291ab:	0f 84 4f 3a 00 00    	je     2cc00 <JS_CallInternal+0x78f0>
   291b1:	0f b7 85 f0 fd ff ff 	movzwl -0x210(%rbp),%eax
   291b8:	44 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9d
   291bf:	83 e8 02             	sub    $0x2,%eax
   291c2:	45 85 c9             	test   %r9d,%r9d
   291c5:	0f 84 79 39 00 00    	je     2cb44 <JS_CallInternal+0x7834>
   291cb:	49 8b 0a             	mov    (%r10),%rcx
   291ce:	4d 8b 42 08          	mov    0x8(%r10),%r8
   291d2:	48 83 ec 08          	sub    $0x8,%rsp
   291d6:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   291dd:	31 f6                	xor    %esi,%esi
   291df:	4c 89 ef             	mov    %r13,%rdi
   291e2:	50                   	push   %rax
   291e3:	41 b9 02 00 00 00    	mov    $0x2,%r9d
   291e9:	ba 03 00 00 00       	mov    $0x3,%edx
   291ee:	e8 ed b9 01 00       	call   44be0 <JS_EvalObject>
   291f3:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   291fa:	5f                   	pop    %rdi
   291fb:	48 89 c6             	mov    %rax,%rsi
   291fe:	41 58                	pop    %r8
   29200:	83 fa 06             	cmp    $0x6,%edx
   29203:	0f 84 47 c8 ff ff    	je     25a50 <JS_CallInternal+0x740>
   29209:	48 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%rax
   29210:	4c 89 a5 10 fe ff ff 	mov    %r12,-0x1f0(%rbp)
   29217:	4d 8d 7a f0          	lea    -0x10(%r10),%r15
   2921b:	49 89 dc             	mov    %rbx,%r12
   2921e:	48 89 b5 00 fe ff ff 	mov    %rsi,-0x200(%rbp)
   29225:	48 89 95 f0 fd ff ff 	mov    %rdx,-0x210(%rbp)
   2922c:	4a 8d 1c 10          	lea    (%rax,%r10,1),%rbx
   29230:	eb 1b                	jmp    2924d <JS_CallInternal+0x3f3d>
   29232:	0f 1f 00             	nopl   (%rax)
   29235:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2923c:	00 00 00 00 
   29240:	49 83 c7 10          	add    $0x10,%r15
   29244:	49 39 df             	cmp    %rbx,%r15
   29247:	0f 84 51 2d 00 00    	je     2bf9e <JS_CallInternal+0x6c8e>
   2924d:	49 8b 57 08          	mov    0x8(%r15),%rdx
   29251:	83 fa f6             	cmp    $0xfffffff6,%edx
   29254:	76 ea                	jbe    29240 <JS_CallInternal+0x3f30>
   29256:	49 8b 37             	mov    (%r15),%rsi
   29259:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2925c:	83 e8 01             	sub    $0x1,%eax
   2925f:	89 46 fc             	mov    %eax,-0x4(%rsi)
   29262:	85 c0                	test   %eax,%eax
   29264:	7f da                	jg     29240 <JS_CallInternal+0x3f30>
   29266:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2926a:	e8 01 56 ff ff       	call   1e870 <__JS_FreeValueRT>
   2926f:	eb cf                	jmp    29240 <JS_CallInternal+0x3f30>
   29271:	f3 0f 1e fa          	endbr64
   29275:	41 0f b6 44 24 04    	movzbl 0x4(%r12),%eax
   2927b:	41 8b 34 24          	mov    (%r12),%esi
   2927f:	4d 8d 7c 24 05       	lea    0x5(%r12),%r15
   29284:	3c 04                	cmp    $0x4,%al
   29286:	0f 87 2b 42 00 00    	ja     2d4b7 <JS_CallInternal+0x81a7>
   2928c:	48 8d 15 01 9f 0b 00 	lea    0xb9f01(%rip),%rdx        # e3194 <qjsc_repl_size+0x4e8>
   29293:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
   29297:	48 01 d0             	add    %rdx,%rax
   2929a:	3e ff e0             	notrack jmp *%rax
   2929d:	48 8d 35 cc 3a 0b 00 	lea    0xb3acc(%rip),%rsi        # dcd70 <_IO_stdin_used+0x3d70>
   292a4:	4c 89 ef             	mov    %r13,%rdi
   292a7:	31 c0                	xor    %eax,%eax
   292a9:	e8 d2 cd 00 00       	call   36080 <JS_ThrowReferenceError>
   292ae:	e9 9d c7 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   292b3:	48 8d 15 03 02 0b 00 	lea    0xb0203(%rip),%rdx        # d94bd <_IO_stdin_used+0x4bd>
   292ba:	85 f6                	test   %esi,%esi
   292bc:	0f 85 4e 61 00 00    	jne    2f410 <JS_CallInternal+0xa100>
   292c2:	48 8d 35 50 02 0b 00 	lea    0xb0250(%rip),%rsi        # d9519 <_IO_stdin_used+0x519>
   292c9:	4c 89 ef             	mov    %r13,%rdi
   292cc:	31 c0                	xor    %eax,%eax
   292ce:	e8 ad cd 00 00       	call   36080 <JS_ThrowReferenceError>
   292d3:	e9 78 c7 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   292d8:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   292dc:	89 f2                	mov    %esi,%edx
   292de:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   292e2:	e8 e9 f6 fe ff       	call   189d0 <JS_AtomGetStrRT.constprop.0>
   292e7:	48 8d 35 15 02 0b 00 	lea    0xb0215(%rip),%rsi        # d9503 <_IO_stdin_used+0x503>
   292ee:	4c 89 ef             	mov    %r13,%rdi
   292f1:	48 89 c2             	mov    %rax,%rdx
   292f4:	31 c0                	xor    %eax,%eax
   292f6:	e8 45 aa 00 00       	call   33d40 <JS_ThrowSyntaxError>
   292fb:	e9 50 c7 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   29300:	48 8d 35 91 3a 0b 00 	lea    0xb3a91(%rip),%rsi        # dcd98 <_IO_stdin_used+0x3d98>
   29307:	4c 89 ef             	mov    %r13,%rdi
   2930a:	31 c0                	xor    %eax,%eax
   2930c:	e8 7f ae 00 00       	call   34190 <JS_ThrowTypeError>
   29311:	e9 3a c7 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   29316:	4c 89 ef             	mov    %r13,%rdi
   29319:	e8 d2 c1 00 00       	call   354f0 <JS_ThrowTypeErrorReadOnly.part.0>
   2931e:	e9 2d c7 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   29323:	f3 0f 1e fa          	endbr64
   29327:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2932b:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   2932f:	4c 89 ef             	mov    %r13,%rdi
   29332:	4c 8d 7b f0          	lea    -0x10(%rbx),%r15
   29336:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2933d:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   29341:	4d 8b 47 08          	mov    0x8(%r15),%r8
   29345:	4c 89 60 30          	mov    %r12,0x30(%rax)
   29349:	e8 d2 a9 08 00       	call   b3d20 <js_dynamic_import>
   2934e:	48 89 c1             	mov    %rax,%rcx
   29351:	48 89 d0             	mov    %rdx,%rax
   29354:	83 fa 06             	cmp    $0x6,%edx
   29357:	0f 84 dc 4f 00 00    	je     2e339 <JS_CallInternal+0x9029>
   2935d:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   29361:	83 fe f6             	cmp    $0xfffffff6,%esi
   29364:	76 15                	jbe    2937b <JS_CallInternal+0x406b>
   29366:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   2936a:	8b 5f fc             	mov    -0x4(%rdi),%ebx
   2936d:	8d 53 ff             	lea    -0x1(%rbx),%edx
   29370:	89 57 fc             	mov    %edx,-0x4(%rdi)
   29373:	85 d2                	test   %edx,%edx
   29375:	0f 8e 0c 49 00 00    	jle    2dc87 <JS_CallInternal+0x8977>
   2937b:	49 8b 77 08          	mov    0x8(%r15),%rsi
   2937f:	83 fe f6             	cmp    $0xfffffff6,%esi
   29382:	76 14                	jbe    29398 <JS_CallInternal+0x4088>
   29384:	49 8b 3f             	mov    (%r15),%rdi
   29387:	8b 5f fc             	mov    -0x4(%rdi),%ebx
   2938a:	8d 53 ff             	lea    -0x1(%rbx),%edx
   2938d:	89 57 fc             	mov    %edx,-0x4(%rdi)
   29390:	85 d2                	test   %edx,%edx
   29392:	0f 8e 46 47 00 00    	jle    2dade <JS_CallInternal+0x87ce>
   29398:	49 89 4f f0          	mov    %rcx,-0x10(%r15)
   2939c:	4c 89 fb             	mov    %r15,%rbx
   2939f:	49 83 c4 01          	add    $0x1,%r12
   293a3:	49 89 47 f8          	mov    %rax,-0x8(%r15)
   293a7:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   293ad:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   293b1:	49 89 c2             	mov    %rax,%r10
   293b4:	b8 01 00 00 00       	mov    $0x1,%eax
   293b9:	ff e2                	jmp    *%rdx
   293bb:	f3 0f 1e fa          	endbr64
   293bf:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   293c6:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   293ca:	4c 89 ef             	mov    %r13,%rdi
   293cd:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   293d1:	4c 89 60 30          	mov    %r12,0x30(%rax)
   293d5:	e8 46 b7 ff ff       	call   24b20 <JS_GetPrototype>
   293da:	48 89 c1             	mov    %rax,%rcx
   293dd:	49 89 d7             	mov    %rdx,%r15
   293e0:	83 fa 06             	cmp    $0x6,%edx
   293e3:	0f 84 48 4f 00 00    	je     2e331 <JS_CallInternal+0x9021>
   293e9:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   293ed:	83 f8 f6             	cmp    $0xfffffff6,%eax
   293f0:	76 15                	jbe    29407 <JS_CallInternal+0x40f7>
   293f2:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   293f6:	8b 56 fc             	mov    -0x4(%rsi),%edx
   293f9:	83 ea 01             	sub    $0x1,%edx
   293fc:	89 56 fc             	mov    %edx,-0x4(%rsi)
   293ff:	85 d2                	test   %edx,%edx
   29401:	0f 8e 61 48 00 00    	jle    2dc68 <JS_CallInternal+0x8958>
   29407:	48 89 4b f0          	mov    %rcx,-0x10(%rbx)
   2940b:	49 83 c4 01          	add    $0x1,%r12
   2940f:	4c 89 7b f8          	mov    %r15,-0x8(%rbx)
   29413:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29419:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2941d:	49 89 c2             	mov    %rax,%r10
   29420:	b8 01 00 00 00       	mov    $0x1,%eax
   29425:	ff e2                	jmp    *%rdx
   29427:	f3 0f 1e fa          	endbr64
   2942b:	83 bd 78 fe ff ff 03 	cmpl   $0x3,-0x188(%rbp)
   29432:	0f 84 b5 5b 00 00    	je     2efed <JS_CallInternal+0x9cdd>
   29438:	41 0f b6 04 24       	movzbl (%r12),%eax
   2943d:	49 83 c4 01          	add    $0x1,%r12
   29441:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   29445:	49 89 c2             	mov    %rax,%r10
   29448:	b8 01 00 00 00       	mov    $0x1,%eax
   2944d:	ff e2                	jmp    *%rdx
   2944f:	f3 0f 1e fa          	endbr64
   29453:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   29457:	83 f8 ff             	cmp    $0xffffffff,%eax
   2945a:	0f 84 d0 36 00 00    	je     2cb30 <JS_CallInternal+0x7820>
   29460:	83 f8 03             	cmp    $0x3,%eax
   29463:	0f 85 03 66 00 00    	jne    2fa6c <JS_CallInternal+0xa75c>
   29469:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   29470:	48 c7 43 08 01 00 00 	movq   $0x1,0x8(%rbx)
   29477:	00 
   29478:	41 0f b6 04 24       	movzbl (%r12),%eax
   2947d:	48 83 c3 10          	add    $0x10,%rbx
   29481:	49 83 c4 01          	add    $0x1,%r12
   29485:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   29489:	49 89 c2             	mov    %rax,%r10
   2948c:	b8 01 00 00 00       	mov    $0x1,%eax
   29491:	ff e2                	jmp    *%rdx
   29493:	f3 0f 1e fa          	endbr64
   29497:	b8 03 00 00 00       	mov    $0x3,%eax
   2949c:	31 c9                	xor    %ecx,%ecx
   2949e:	e9 6f c6 ff ff       	jmp    25b12 <JS_CallInternal+0x802>
   294a3:	f3 0f 1e fa          	endbr64
   294a7:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   294ab:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   294af:	4c 89 ef             	mov    %r13,%rdi
   294b2:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   294b6:	4c 8b 43 f8          	mov    -0x8(%rbx),%r8
   294ba:	e8 81 b0 00 00       	call   34540 <JS_CheckBrand>
   294bf:	83 f8 ff             	cmp    $0xffffffff,%eax
   294c2:	0f 84 5e 65 00 00    	je     2fa26 <JS_CallInternal+0xa716>
   294c8:	85 c0                	test   %eax,%eax
   294ca:	0f 84 3f 65 00 00    	je     2fa0f <JS_CallInternal+0xa6ff>
   294d0:	41 0f b6 04 24       	movzbl (%r12),%eax
   294d5:	49 83 c4 01          	add    $0x1,%r12
   294d9:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   294dd:	49 89 c2             	mov    %rax,%r10
   294e0:	b8 01 00 00 00       	mov    $0x1,%eax
   294e5:	ff e2                	jmp    *%rdx
   294e7:	f3 0f 1e fa          	endbr64
   294eb:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   294f2:	4c 89 60 30          	mov    %r12,0x30(%rax)
   294f6:	83 bd 78 fe ff ff 03 	cmpl   $0x3,-0x188(%rbp)
   294fd:	0f 84 ea 5a 00 00    	je     2efed <JS_CallInternal+0x9cdd>
   29503:	48 8b 85 c8 fe ff ff 	mov    -0x138(%rbp),%rax
   2950a:	48 8b 95 68 fe ff ff 	mov    -0x198(%rbp),%rdx
   29511:	4c 89 ef             	mov    %r13,%rdi
   29514:	48 89 c6             	mov    %rax,%rsi
   29517:	48 89 85 60 fe ff ff 	mov    %rax,-0x1a0(%rbp)
   2951e:	48 89 95 68 fe ff ff 	mov    %rdx,-0x198(%rbp)
   29525:	e8 f6 b5 ff ff       	call   24b20 <JS_GetPrototype>
   2952a:	48 89 c6             	mov    %rax,%rsi
   2952d:	49 89 d7             	mov    %rdx,%r15
   29530:	83 fa 06             	cmp    $0x6,%edx
   29533:	0f 84 3c 52 00 00    	je     2e775 <JS_CallInternal+0x9465>
   29539:	48 8b 95 78 fe ff ff 	mov    -0x188(%rbp),%rdx
   29540:	48 8b 85 58 fe ff ff 	mov    -0x1a8(%rbp),%rax
   29547:	6a 02                	push   $0x2
   29549:	4c 89 ef             	mov    %r13,%rdi
   2954c:	ff b5 98 fe ff ff    	push   -0x168(%rbp)
   29552:	44 8b 8d a8 fe ff ff 	mov    -0x158(%rbp),%r9d
   29559:	49 89 d0             	mov    %rdx,%r8
   2955c:	48 89 c1             	mov    %rax,%rcx
   2955f:	4c 89 fa             	mov    %r15,%rdx
   29562:	48 89 b5 30 fe ff ff 	mov    %rsi,-0x1d0(%rbp)
   29569:	e8 f2 18 07 00       	call   9ae60 <JS_CallConstructorInternal>
   2956e:	41 5a                	pop    %r10
   29570:	41 5b                	pop    %r11
   29572:	49 89 c0             	mov    %rax,%r8
   29575:	48 89 d1             	mov    %rdx,%rcx
   29578:	41 83 ff f6          	cmp    $0xfffffff6,%r15d
   2957c:	76 18                	jbe    29596 <JS_CallInternal+0x4286>
   2957e:	48 8b b5 30 fe ff ff 	mov    -0x1d0(%rbp),%rsi
   29585:	8b 46 fc             	mov    -0x4(%rsi),%eax
   29588:	83 e8 01             	sub    $0x1,%eax
   2958b:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2958e:	85 c0                	test   %eax,%eax
   29590:	0f 8e aa 51 00 00    	jle    2e740 <JS_CallInternal+0x9430>
   29596:	4d 89 e7             	mov    %r12,%r15
   29599:	83 f9 06             	cmp    $0x6,%ecx
   2959c:	0f 84 ae c4 ff ff    	je     25a50 <JS_CallInternal+0x740>
   295a2:	4c 89 03             	mov    %r8,(%rbx)
   295a5:	49 83 c4 01          	add    $0x1,%r12
   295a9:	48 83 c3 10          	add    $0x10,%rbx
   295ad:	48 89 4b f8          	mov    %rcx,-0x8(%rbx)
   295b1:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   295b7:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   295bb:	49 89 c2             	mov    %rax,%r10
   295be:	b8 01 00 00 00       	mov    $0x1,%eax
   295c3:	ff e2                	jmp    *%rdx
   295c5:	f3 0f 1e fa          	endbr64
   295c9:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   295cd:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   295d1:	4c 8d 4b f0          	lea    -0x10(%rbx),%r9
   295d5:	4c 89 ef             	mov    %r13,%rdi
   295d8:	4c 8b 43 f8          	mov    -0x8(%rbx),%r8
   295dc:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   295e0:	4c 89 8d 30 fe ff ff 	mov    %r9,-0x1d0(%rbp)
   295e7:	4c 8d 7b e0          	lea    -0x20(%rbx),%r15
   295eb:	e8 00 3a 02 00       	call   4cff0 <JS_AddBrand>
   295f0:	4c 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9
   295f7:	83 f8 ff             	cmp    $0xffffffff,%eax
   295fa:	0f 84 07 64 00 00    	je     2fa07 <JS_CallInternal+0xa6f7>
   29600:	49 8b 47 08          	mov    0x8(%r15),%rax
   29604:	83 f8 f6             	cmp    $0xfffffff6,%eax
   29607:	76 15                	jbe    2961e <JS_CallInternal+0x430e>
   29609:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   2960d:	8b 59 fc             	mov    -0x4(%rcx),%ebx
   29610:	8d 53 ff             	lea    -0x1(%rbx),%edx
   29613:	89 51 fc             	mov    %edx,-0x4(%rcx)
   29616:	85 d2                	test   %edx,%edx
   29618:	0f 8e 9e 44 00 00    	jle    2dabc <JS_CallInternal+0x87ac>
   2961e:	49 8b 41 08          	mov    0x8(%r9),%rax
   29622:	83 f8 f6             	cmp    $0xfffffff6,%eax
   29625:	76 14                	jbe    2963b <JS_CallInternal+0x432b>
   29627:	49 8b 09             	mov    (%r9),%rcx
   2962a:	8b 59 fc             	mov    -0x4(%rcx),%ebx
   2962d:	8d 53 ff             	lea    -0x1(%rbx),%edx
   29630:	89 51 fc             	mov    %edx,-0x4(%rcx)
   29633:	85 d2                	test   %edx,%edx
   29635:	0f 8e 19 46 00 00    	jle    2dc54 <JS_CallInternal+0x8944>
   2963b:	41 0f b6 04 24       	movzbl (%r12),%eax
   29640:	4c 89 fb             	mov    %r15,%rbx
   29643:	49 83 c4 01          	add    $0x1,%r12
   29647:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2964b:	49 89 c2             	mov    %rax,%r10
   2964e:	b8 01 00 00 00       	mov    $0x1,%eax
   29653:	ff e2                	jmp    *%rdx
   29655:	f3 0f 1e fa          	endbr64
   29659:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   29660:	4c 8b 7b f8          	mov    -0x8(%rbx),%r15
   29664:	4c 89 60 30          	mov    %r12,0x30(%rax)
   29668:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   2966c:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   29673:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   29677:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2967e:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   29682:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   29689:	41 83 ff ff          	cmp    $0xffffffff,%r15d
   2968d:	0f 85 e6 5f 00 00    	jne    2f679 <JS_CallInternal+0xa369>
   29693:	48 8b b5 10 fe ff ff 	mov    -0x1f0(%rbp),%rsi
   2969a:	48 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%rdx
   296a1:	4c 89 ef             	mov    %r13,%rdi
   296a4:	e8 c7 d8 01 00       	call   46f70 <JS_ValueToAtom>
   296a9:	89 c1                	mov    %eax,%ecx
   296ab:	85 c0                	test   %eax,%eax
   296ad:	0f 84 33 48 00 00    	je     2dee6 <JS_CallInternal+0x8bd6>
   296b3:	48 8b b5 00 fe ff ff 	mov    -0x200(%rbp),%rsi
   296ba:	4c 89 fa             	mov    %r15,%rdx
   296bd:	4c 89 ef             	mov    %r13,%rdi
   296c0:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   296c6:	e8 d5 6b 04 00       	call   702a0 <JS_HasProperty>
   296cb:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   296d1:	41 89 c0             	mov    %eax,%r8d
   296d4:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   296da:	0f 8f 18 37 00 00    	jg     2cdf8 <JS_CallInternal+0x7ae8>
   296e0:	45 85 c0             	test   %r8d,%r8d
   296e3:	0f 88 6b 67 00 00    	js     2fe54 <JS_CallInternal+0xab44>
   296e9:	83 bd 30 fe ff ff f6 	cmpl   $0xfffffff6,-0x1d0(%rbp)
   296f0:	76 1e                	jbe    29710 <JS_CallInternal+0x4400>
   296f2:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   296f9:	8b 41 fc             	mov    -0x4(%rcx),%eax
   296fc:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   29702:	83 e8 01             	sub    $0x1,%eax
   29705:	89 41 fc             	mov    %eax,-0x4(%rcx)
   29708:	85 c0                	test   %eax,%eax
   2970a:	0f 8e 9c 48 00 00    	jle    2dfac <JS_CallInternal+0x8c9c>
   29710:	41 83 ff f6          	cmp    $0xfffffff6,%r15d
   29714:	76 1e                	jbe    29734 <JS_CallInternal+0x4424>
   29716:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2971d:	8b 41 fc             	mov    -0x4(%rcx),%eax
   29720:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   29726:	83 e8 01             	sub    $0x1,%eax
   29729:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2972c:	85 c0                	test   %eax,%eax
   2972e:	0f 8e 4c 4e 00 00    	jle    2e580 <JS_CallInternal+0x9270>
   29734:	31 c0                	xor    %eax,%eax
   29736:	45 85 c0             	test   %r8d,%r8d
   29739:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   29740:	00 
   29741:	0f 95 c0             	setne  %al
   29744:	48 83 eb 10          	sub    $0x10,%rbx
   29748:	49 83 c4 01          	add    $0x1,%r12
   2974c:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29750:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29756:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2975a:	49 89 c2             	mov    %rax,%r10
   2975d:	b8 01 00 00 00       	mov    $0x1,%eax
   29762:	ff e2                	jmp    *%rdx
   29764:	f3 0f 1e fa          	endbr64
   29768:	48 8b 4b e8          	mov    -0x18(%rbx),%rcx
   2976c:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   29770:	4c 8b 53 f0          	mov    -0x10(%rbx),%r10
   29774:	4c 8b 7b f8          	mov    -0x8(%rbx),%r15
   29778:	85 c9                	test   %ecx,%ecx
   2977a:	0f 85 65 4d 00 00    	jne    2e4e5 <JS_CallInternal+0x91d5>
   29780:	45 85 ff             	test   %r15d,%r15d
   29783:	0f 85 57 2e 00 00    	jne    2c5e0 <JS_CallInternal+0x72d0>
   29789:	31 c0                	xor    %eax,%eax
   2978b:	44 39 d2             	cmp    %r10d,%edx
   2978e:	0f 95 c0             	setne  %al
   29791:	48 89 43 e0          	mov    %rax,-0x20(%rbx)
   29795:	49 83 c4 01          	add    $0x1,%r12
   29799:	48 83 eb 10          	sub    $0x10,%rbx
   2979d:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   297a4:	00 
   297a5:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   297ab:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   297af:	49 89 c2             	mov    %rax,%r10
   297b2:	b8 01 00 00 00       	mov    $0x1,%eax
   297b7:	ff e2                	jmp    *%rdx
   297b9:	f3 0f 1e fa          	endbr64
   297bd:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   297c1:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   297c5:	4c 8b 53 f0          	mov    -0x10(%rbx),%r10
   297c9:	4c 8b 43 f8          	mov    -0x8(%rbx),%r8
   297cd:	85 d2                	test   %edx,%edx
   297cf:	0f 85 7f 46 00 00    	jne    2de54 <JS_CallInternal+0x8b44>
   297d5:	45 85 c0             	test   %r8d,%r8d
   297d8:	0f 85 95 2e 00 00    	jne    2c673 <JS_CallInternal+0x7363>
   297de:	45 31 ff             	xor    %r15d,%r15d
   297e1:	44 39 d7             	cmp    %r10d,%edi
   297e4:	41 0f 94 c7          	sete   %r15b
   297e8:	4c 89 7b e0          	mov    %r15,-0x20(%rbx)
   297ec:	49 83 c4 01          	add    $0x1,%r12
   297f0:	48 83 eb 10          	sub    $0x10,%rbx
   297f4:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   297fb:	00 
   297fc:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29802:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   29806:	49 89 c2             	mov    %rax,%r10
   29809:	b8 01 00 00 00       	mov    $0x1,%eax
   2980e:	ff e2                	jmp    *%rdx
   29810:	f3 0f 1e fa          	endbr64
   29814:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   29818:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   2981c:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   29820:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   29824:	85 d2                	test   %edx,%edx
   29826:	0f 85 49 4b 00 00    	jne    2e375 <JS_CallInternal+0x9065>
   2982c:	85 c9                	test   %ecx,%ecx
   2982e:	0f 85 15 2e 00 00    	jne    2c649 <JS_CallInternal+0x7339>
   29834:	45 31 ff             	xor    %r15d,%r15d
   29837:	44 39 c7             	cmp    %r8d,%edi
   2983a:	41 0f 94 c7          	sete   %r15b
   2983e:	41 83 f7 01          	xor    $0x1,%r15d
   29842:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   29849:	00 
   2984a:	49 63 c7             	movslq %r15d,%rax
   2984d:	48 89 43 e0          	mov    %rax,-0x20(%rbx)
   29851:	41 0f b6 04 24       	movzbl (%r12),%eax
   29856:	48 83 eb 10          	sub    $0x10,%rbx
   2985a:	49 83 c4 01          	add    $0x1,%r12
   2985e:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   29862:	49 89 c2             	mov    %rax,%r10
   29865:	b8 01 00 00 00       	mov    $0x1,%eax
   2986a:	ff e2                	jmp    *%rdx
   2986c:	f3 0f 1e fa          	endbr64
   29870:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   29874:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   29878:	4c 89 ef             	mov    %r13,%rdi
   2987b:	4d 89 e7             	mov    %r12,%r15
   2987e:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   29882:	4c 8b 43 e8          	mov    -0x18(%rbx),%r8
   29886:	e8 c5 da 01 00       	call   47350 <JS_DefineObjectNameComputed.constprop.0>
   2988b:	83 f8 ff             	cmp    $0xffffffff,%eax
   2988e:	0f 84 bc c1 ff ff    	je     25a50 <JS_CallInternal+0x740>
   29894:	41 0f b6 04 24       	movzbl (%r12),%eax
   29899:	49 83 c4 01          	add    $0x1,%r12
   2989d:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   298a1:	49 89 c2             	mov    %rax,%r10
   298a4:	b8 01 00 00 00       	mov    $0x1,%eax
   298a9:	ff e2                	jmp    *%rdx
   298ab:	f3 0f 1e fa          	endbr64
   298af:	41 8b 0c 24          	mov    (%r12),%ecx
   298b3:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   298b7:	4c 89 ef             	mov    %r13,%rdi
   298ba:	4d 8d 7c 24 04       	lea    0x4(%r12),%r15
   298bf:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   298c3:	e8 88 29 01 00       	call   3c250 <JS_DefineObjectName.constprop.0>
   298c8:	83 f8 ff             	cmp    $0xffffffff,%eax
   298cb:	0f 84 7f c1 ff ff    	je     25a50 <JS_CallInternal+0x740>
   298d1:	41 0f b6 44 24 04    	movzbl 0x4(%r12),%eax
   298d7:	49 83 c4 05          	add    $0x5,%r12
   298db:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   298df:	49 89 c2             	mov    %rax,%r10
   298e2:	b8 01 00 00 00       	mov    $0x1,%eax
   298e7:	ff e2                	jmp    *%rdx
   298e9:	f3 0f 1e fa          	endbr64
   298ed:	44 8b 7b f8          	mov    -0x8(%rbx),%r15d
   298f1:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   298f5:	45 85 ff             	test   %r15d,%r15d
   298f8:	0f 85 42 2e 00 00    	jne    2c740 <JS_CallInternal+0x7430>
   298fe:	3d 00 00 00 80       	cmp    $0x80000000,%eax
   29903:	0f 84 37 2e 00 00    	je     2c740 <JS_CallInternal+0x7430>
   29909:	83 e8 01             	sub    $0x1,%eax
   2990c:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   29913:	00 
   29914:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29918:	41 0f b6 04 24       	movzbl (%r12),%eax
   2991d:	49 83 c4 01          	add    $0x1,%r12
   29921:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   29925:	49 89 c2             	mov    %rax,%r10
   29928:	b8 01 00 00 00       	mov    $0x1,%eax
   2992d:	ff e2                	jmp    *%rdx
   2992f:	f3 0f 1e fa          	endbr64
   29933:	8b 53 f8             	mov    -0x8(%rbx),%edx
   29936:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2993a:	85 d2                	test   %edx,%edx
   2993c:	0f 85 74 2e 00 00    	jne    2c7b6 <JS_CallInternal+0x74a6>
   29942:	3d ff ff ff 7f       	cmp    $0x7fffffff,%eax
   29947:	0f 84 69 2e 00 00    	je     2c7b6 <JS_CallInternal+0x74a6>
   2994d:	83 c0 01             	add    $0x1,%eax
   29950:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   29957:	00 
   29958:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2995c:	41 0f b6 04 24       	movzbl (%r12),%eax
   29961:	49 83 c4 01          	add    $0x1,%r12
   29965:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   29969:	49 89 c2             	mov    %rax,%r10
   2996c:	b8 01 00 00 00       	mov    $0x1,%eax
   29971:	ff e2                	jmp    *%rdx
   29973:	f3 0f 1e fa          	endbr64
   29977:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2997e:	4c 8b 4b e8          	mov    -0x18(%rbx),%r9
   29982:	4c 89 ef             	mov    %r13,%rdi
   29985:	4c 8b 7b f0          	mov    -0x10(%rbx),%r15
   29989:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   2998d:	4c 89 60 30          	mov    %r12,0x30(%rax)
   29991:	4c 8b 43 f8          	mov    -0x8(%rbx),%r8
   29995:	4c 89 ca             	mov    %r9,%rdx
   29998:	4c 89 f9             	mov    %r15,%rcx
   2999b:	48 89 b5 00 fe ff ff 	mov    %rsi,-0x200(%rbp)
   299a2:	4c 89 85 10 fe ff ff 	mov    %r8,-0x1f0(%rbp)
   299a9:	4c 89 8d 30 fe ff ff 	mov    %r9,-0x1d0(%rbp)
   299b0:	e8 5b ba 06 00       	call   95410 <JS_IsInstanceOf>
   299b5:	85 c0                	test   %eax,%eax
   299b7:	0f 88 e6 2c 00 00    	js     2c6a3 <JS_CallInternal+0x7393>
   299bd:	4c 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9
   299c4:	4c 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%r8
   299cb:	41 83 f9 f6          	cmp    $0xfffffff6,%r9d
   299cf:	76 18                	jbe    299e9 <JS_CallInternal+0x46d9>
   299d1:	48 8b b5 00 fe ff ff 	mov    -0x200(%rbp),%rsi
   299d8:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   299db:	8d 51 ff             	lea    -0x1(%rcx),%edx
   299de:	89 56 fc             	mov    %edx,-0x4(%rsi)
   299e1:	85 d2                	test   %edx,%edx
   299e3:	0f 8e 6a 54 00 00    	jle    2ee53 <JS_CallInternal+0x9b43>
   299e9:	41 83 f8 f6          	cmp    $0xfffffff6,%r8d
   299ed:	76 13                	jbe    29a02 <JS_CallInternal+0x46f2>
   299ef:	41 8b 4f fc          	mov    -0x4(%r15),%ecx
   299f3:	8d 51 ff             	lea    -0x1(%rcx),%edx
   299f6:	41 89 57 fc          	mov    %edx,-0x4(%r15)
   299fa:	85 d2                	test   %edx,%edx
   299fc:	0f 8e 6e 53 00 00    	jle    2ed70 <JS_CallInternal+0x9a60>
   29a02:	85 c0                	test   %eax,%eax
   29a04:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   29a0b:	00 
   29a0c:	0f 95 c0             	setne  %al
   29a0f:	48 83 eb 10          	sub    $0x10,%rbx
   29a13:	49 83 c4 01          	add    $0x1,%r12
   29a17:	0f b6 c0             	movzbl %al,%eax
   29a1a:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29a1e:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29a24:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   29a28:	49 89 c2             	mov    %rax,%r10
   29a2b:	b8 01 00 00 00       	mov    $0x1,%eax
   29a30:	ff e2                	jmp    *%rdx
   29a32:	f3 0f 1e fa          	endbr64
   29a36:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   29a3d:	4c 8b 4b e8          	mov    -0x18(%rbx),%r9
   29a41:	4c 8b 53 f0          	mov    -0x10(%rbx),%r10
   29a45:	4c 8b 7b f8          	mov    -0x8(%rbx),%r15
   29a49:	4c 89 60 30          	mov    %r12,0x30(%rax)
   29a4d:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   29a51:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   29a58:	41 83 f9 ff          	cmp    $0xffffffff,%r9d
   29a5c:	0f 85 0b 65 00 00    	jne    2ff6d <JS_CallInternal+0xac5d>
   29a62:	41 83 ff ff          	cmp    $0xffffffff,%r15d
   29a66:	0f 84 19 32 00 00    	je     2cc85 <JS_CallInternal+0x7975>
   29a6c:	4c 89 d6             	mov    %r10,%rsi
   29a6f:	4c 89 fa             	mov    %r15,%rdx
   29a72:	4c 89 ef             	mov    %r13,%rdi
   29a75:	4c 89 8d 00 fe ff ff 	mov    %r9,-0x200(%rbp)
   29a7c:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   29a83:	4c 89 bd 18 fe ff ff 	mov    %r15,-0x1e8(%rbp)
   29a8a:	e8 e1 d4 01 00       	call   46f70 <JS_ValueToAtom>
   29a8f:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   29a96:	4c 8b 9d 18 fe ff ff 	mov    -0x1e8(%rbp),%r11
   29a9d:	85 c0                	test   %eax,%eax
   29a9f:	4c 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%r9
   29aa6:	0f 84 d2 53 00 00    	je     2ee7e <JS_CallInternal+0x9b6e>
   29aac:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   29ab3:	48 8b 71 18          	mov    0x18(%rcx),%rsi
   29ab7:	89 c1                	mov    %eax,%ecx
   29ab9:	8b 56 18             	mov    0x18(%rsi),%edx
   29abc:	21 d1                	and    %edx,%ecx
   29abe:	8b 4c 8e 38          	mov    0x38(%rsi,%rcx,4),%ecx
   29ac2:	48 85 c9             	test   %rcx,%rcx
   29ac5:	0f 84 ea 57 00 00    	je     2f2b5 <JS_CallInternal+0x9fa5>
   29acb:	48 8d 14 95 3c 00 00 	lea    0x3c(,%rdx,4),%rdx
   29ad2:	00 
   29ad3:	48 8d 4c ca f8       	lea    -0x8(%rdx,%rcx,8),%rcx
   29ad8:	48 01 f1             	add    %rsi,%rcx
   29adb:	39 41 04             	cmp    %eax,0x4(%rcx)
   29ade:	0f 85 c3 57 00 00    	jne    2f2a7 <JS_CallInternal+0x9f97>
   29ae4:	b9 01 00 00 00       	mov    $0x1,%ecx
   29ae9:	3d f2 00 00 00       	cmp    $0xf2,%eax
   29aee:	0f 8f 75 38 00 00    	jg     2d369 <JS_CallInternal+0x8059>
   29af4:	41 83 f9 f6          	cmp    $0xfffffff6,%r9d
   29af8:	76 1e                	jbe    29b18 <JS_CallInternal+0x4808>
   29afa:	48 8b b5 30 fe ff ff 	mov    -0x1d0(%rbp),%rsi
   29b01:	8b 46 fc             	mov    -0x4(%rsi),%eax
   29b04:	89 85 10 fe ff ff    	mov    %eax,-0x1f0(%rbp)
   29b0a:	83 e8 01             	sub    $0x1,%eax
   29b0d:	89 46 fc             	mov    %eax,-0x4(%rsi)
   29b10:	85 c0                	test   %eax,%eax
   29b12:	0f 8e 00 42 00 00    	jle    2dd18 <JS_CallInternal+0x8a08>
   29b18:	41 83 ff f6          	cmp    $0xfffffff6,%r15d
   29b1c:	76 13                	jbe    29b31 <JS_CallInternal+0x4821>
   29b1e:	41 8b 42 fc          	mov    -0x4(%r10),%eax
   29b22:	83 e8 01             	sub    $0x1,%eax
   29b25:	41 89 42 fc          	mov    %eax,-0x4(%r10)
   29b29:	85 c0                	test   %eax,%eax
   29b2b:	0f 8e 68 42 00 00    	jle    2dd99 <JS_CallInternal+0x8a89>
   29b31:	48 89 4b e0          	mov    %rcx,-0x20(%rbx)
   29b35:	49 83 c4 01          	add    $0x1,%r12
   29b39:	48 83 eb 10          	sub    $0x10,%rbx
   29b3d:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   29b44:	00 
   29b45:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29b4b:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   29b4f:	49 89 c2             	mov    %rax,%r10
   29b52:	b8 01 00 00 00       	mov    $0x1,%eax
   29b57:	ff e2                	jmp    *%rdx
   29b59:	f3 0f 1e fa          	endbr64
   29b5d:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   29b61:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   29b65:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   29b69:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   29b6d:	89 cf                	mov    %ecx,%edi
   29b6f:	09 f7                	or     %esi,%edi
   29b71:	0f 85 61 47 00 00    	jne    2e2d8 <JS_CallInternal+0x8fc8>
   29b77:	39 d0                	cmp    %edx,%eax
   29b79:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   29b80:	00 
   29b81:	0f 9c c0             	setl   %al
   29b84:	48 83 eb 10          	sub    $0x10,%rbx
   29b88:	0f b6 c0             	movzbl %al,%eax
   29b8b:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29b8f:	41 0f b6 04 24       	movzbl (%r12),%eax
   29b94:	49 83 c4 01          	add    $0x1,%r12
   29b98:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   29b9c:	49 89 c2             	mov    %rax,%r10
   29b9f:	b8 01 00 00 00       	mov    $0x1,%eax
   29ba4:	ff e2                	jmp    *%rdx
   29ba6:	f3 0f 1e fa          	endbr64
   29baa:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   29bae:	0b 53 e8             	or     -0x18(%rbx),%edx
   29bb1:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   29bb5:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   29bb9:	0f 85 40 44 00 00    	jne    2dfff <JS_CallInternal+0x8cef>
   29bbf:	31 c8                	xor    %ecx,%eax
   29bc1:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   29bc8:	00 
   29bc9:	48 83 eb 10          	sub    $0x10,%rbx
   29bcd:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29bd1:	41 0f b6 04 24       	movzbl (%r12),%eax
   29bd6:	49 83 c4 01          	add    $0x1,%r12
   29bda:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   29bde:	49 89 c2             	mov    %rax,%r10
   29be1:	b8 01 00 00 00       	mov    $0x1,%eax
   29be6:	ff e2                	jmp    *%rdx
   29be8:	f3 0f 1e fa          	endbr64
   29bec:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   29bf0:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   29bf4:	45 31 c9             	xor    %r9d,%r9d
   29bf7:	4c 89 ef             	mov    %r13,%rdi
   29bfa:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   29c01:	48 8b 4b d0          	mov    -0x30(%rbx),%rcx
   29c05:	48 c7 85 c0 fd ff ff 	movq   $0x0,-0x240(%rbp)
   29c0c:	00 00 00 00 
   29c10:	48 c7 85 c8 fd ff ff 	movq   $0x3,-0x238(%rbp)
   29c17:	03 00 00 00 
   29c1b:	4c 8b 43 d8          	mov    -0x28(%rbx),%r8
   29c1f:	4c 89 60 30          	mov    %r12,0x30(%rax)
   29c23:	48 c7 43 f0 00 00 00 	movq   $0x0,-0x10(%rbx)
   29c2a:	00 
   29c2b:	48 c7 43 f8 03 00 00 	movq   $0x3,-0x8(%rbx)
   29c32:	00 
   29c33:	6a 02                	push   $0x2
   29c35:	6a 00                	push   $0x0
   29c37:	ff b5 c8 fd ff ff    	push   -0x238(%rbp)
   29c3d:	ff b5 c0 fd ff ff    	push   -0x240(%rbp)
   29c43:	e8 c8 b6 ff ff       	call   25310 <JS_CallInternal>
   29c48:	48 83 c4 20          	add    $0x20,%rsp
   29c4c:	83 fa 06             	cmp    $0x6,%edx
   29c4f:	0f 84 1f 48 00 00    	je     2e474 <JS_CallInternal+0x9164>
   29c55:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   29c59:	49 83 c4 01          	add    $0x1,%r12
   29c5d:	48 83 c3 10          	add    $0x10,%rbx
   29c61:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29c65:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29c6b:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   29c6f:	49 89 c2             	mov    %rax,%r10
   29c72:	b8 01 00 00 00       	mov    $0x1,%eax
   29c77:	ff e2                	jmp    *%rdx
   29c79:	f3 0f 1e fa          	endbr64
   29c7d:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   29c81:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   29c85:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   29c89:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   29c8d:	89 c6                	mov    %eax,%esi
   29c8f:	09 d6                	or     %edx,%esi
   29c91:	0f 85 01 4b 00 00    	jne    2e798 <JS_CallInternal+0x9488>
   29c97:	89 fa                	mov    %edi,%edx
   29c99:	48 63 f1             	movslq %ecx,%rsi
   29c9c:	48 63 c7             	movslq %edi,%rax
   29c9f:	29 ca                	sub    %ecx,%edx
   29ca1:	48 29 f0             	sub    %rsi,%rax
   29ca4:	48 63 ca             	movslq %edx,%rcx
   29ca7:	48 39 c1             	cmp    %rax,%rcx
   29caa:	0f 85 cd 4a 00 00    	jne    2e77d <JS_CallInternal+0x946d>
   29cb0:	89 d0                	mov    %edx,%eax
   29cb2:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   29cb9:	00 
   29cba:	48 89 43 e0          	mov    %rax,-0x20(%rbx)
   29cbe:	41 0f b6 04 24       	movzbl (%r12),%eax
   29cc3:	48 83 eb 10          	sub    $0x10,%rbx
   29cc7:	49 83 c4 01          	add    $0x1,%r12
   29ccb:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   29ccf:	49 89 c2             	mov    %rax,%r10
   29cd2:	b8 01 00 00 00       	mov    $0x1,%eax
   29cd7:	ff e2                	jmp    *%rdx
   29cd9:	f3 0f 1e fa          	endbr64
   29cdd:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   29ce1:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   29ce5:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   29ce8:	76 04                	jbe    29cee <JS_CallInternal+0x49de>
   29cea:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   29cee:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   29cf5:	48 8b 40 10          	mov    0x10(%rax),%rax
   29cf9:	48 8b 40 18          	mov    0x18(%rax),%rax
   29cfd:	48 8b 50 08          	mov    0x8(%rax),%rdx
   29d01:	48 8b 38             	mov    (%rax),%rdi
   29d04:	48 89 48 08          	mov    %rcx,0x8(%rax)
   29d08:	48 89 30             	mov    %rsi,(%rax)
   29d0b:	83 fa f6             	cmp    $0xfffffff6,%edx
   29d0e:	76 11                	jbe    29d21 <JS_CallInternal+0x4a11>
   29d10:	8b 47 fc             	mov    -0x4(%rdi),%eax
   29d13:	83 e8 01             	sub    $0x1,%eax
   29d16:	89 47 fc             	mov    %eax,-0x4(%rdi)
   29d19:	85 c0                	test   %eax,%eax
   29d1b:	0f 8e d5 3f 00 00    	jle    2dcf6 <JS_CallInternal+0x89e6>
   29d21:	41 0f b6 04 24       	movzbl (%r12),%eax
   29d26:	49 83 c4 01          	add    $0x1,%r12
   29d2a:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   29d2e:	49 89 c2             	mov    %rax,%r10
   29d31:	b8 01 00 00 00       	mov    $0x1,%eax
   29d36:	ff e2                	jmp    *%rdx
   29d38:	f3 0f 1e fa          	endbr64
   29d3c:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   29d40:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   29d44:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   29d47:	76 04                	jbe    29d4d <JS_CallInternal+0x4a3d>
   29d49:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   29d4d:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   29d54:	48 8b 40 08          	mov    0x8(%rax),%rax
   29d58:	48 8b 40 18          	mov    0x18(%rax),%rax
   29d5c:	48 8b 50 08          	mov    0x8(%rax),%rdx
   29d60:	48 8b 38             	mov    (%rax),%rdi
   29d63:	48 89 48 08          	mov    %rcx,0x8(%rax)
   29d67:	48 89 30             	mov    %rsi,(%rax)
   29d6a:	83 fa f6             	cmp    $0xfffffff6,%edx
   29d6d:	76 11                	jbe    29d80 <JS_CallInternal+0x4a70>
   29d6f:	8b 47 fc             	mov    -0x4(%rdi),%eax
   29d72:	83 e8 01             	sub    $0x1,%eax
   29d75:	89 47 fc             	mov    %eax,-0x4(%rdi)
   29d78:	85 c0                	test   %eax,%eax
   29d7a:	0f 8e 87 3f 00 00    	jle    2dd07 <JS_CallInternal+0x89f7>
   29d80:	41 0f b6 04 24       	movzbl (%r12),%eax
   29d85:	49 83 c4 01          	add    $0x1,%r12
   29d89:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   29d8d:	49 89 c2             	mov    %rax,%r10
   29d90:	b8 01 00 00 00       	mov    $0x1,%eax
   29d95:	ff e2                	jmp    *%rdx
   29d97:	f3 0f 1e fa          	endbr64
   29d9b:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   29d9f:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   29da3:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   29da7:	4c 8b 7b f8          	mov    -0x8(%rbx),%r15
   29dab:	85 d2                	test   %edx,%edx
   29dad:	0f 85 ee 4b 00 00    	jne    2e9a1 <JS_CallInternal+0x9691>
   29db3:	45 85 ff             	test   %r15d,%r15d
   29db6:	0f 85 52 28 00 00    	jne    2c60e <JS_CallInternal+0x72fe>
   29dbc:	31 c9                	xor    %ecx,%ecx
   29dbe:	44 39 c7             	cmp    %r8d,%edi
   29dc1:	0f 94 c1             	sete   %cl
   29dc4:	48 63 c9             	movslq %ecx,%rcx
   29dc7:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   29dce:	00 
   29dcf:	48 89 4b e0          	mov    %rcx,-0x20(%rbx)
   29dd3:	41 0f b6 04 24       	movzbl (%r12),%eax
   29dd8:	48 83 eb 10          	sub    $0x10,%rbx
   29ddc:	49 83 c4 01          	add    $0x1,%r12
   29de0:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   29de4:	49 89 c2             	mov    %rax,%r10
   29de7:	b8 01 00 00 00       	mov    $0x1,%eax
   29dec:	ff e2                	jmp    *%rdx
   29dee:	f3 0f 1e fa          	endbr64
   29df2:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   29df6:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   29dfa:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   29dfe:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   29e02:	89 cf                	mov    %ecx,%edi
   29e04:	09 f7                	or     %esi,%edi
   29e06:	0f 85 55 4b 00 00    	jne    2e961 <JS_CallInternal+0x9651>
   29e0c:	39 c2                	cmp    %eax,%edx
   29e0e:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   29e15:	00 
   29e16:	0f 9d c0             	setge  %al
   29e19:	48 83 eb 10          	sub    $0x10,%rbx
   29e1d:	0f b6 c0             	movzbl %al,%eax
   29e20:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29e24:	41 0f b6 04 24       	movzbl (%r12),%eax
   29e29:	49 83 c4 01          	add    $0x1,%r12
   29e2d:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   29e31:	49 89 c2             	mov    %rax,%r10
   29e34:	b8 01 00 00 00       	mov    $0x1,%eax
   29e39:	ff e2                	jmp    *%rdx
   29e3b:	f3 0f 1e fa          	endbr64
   29e3f:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   29e43:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   29e47:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   29e4b:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   29e4f:	89 cf                	mov    %ecx,%edi
   29e51:	09 f7                	or     %esi,%edi
   29e53:	0f 85 af 40 00 00    	jne    2df08 <JS_CallInternal+0x8bf8>
   29e59:	39 c2                	cmp    %eax,%edx
   29e5b:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   29e62:	00 
   29e63:	0f 9f c0             	setg   %al
   29e66:	48 83 eb 10          	sub    $0x10,%rbx
   29e6a:	0f b6 c0             	movzbl %al,%eax
   29e6d:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29e71:	41 0f b6 04 24       	movzbl (%r12),%eax
   29e76:	49 83 c4 01          	add    $0x1,%r12
   29e7a:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   29e7e:	49 89 c2             	mov    %rax,%r10
   29e81:	b8 01 00 00 00       	mov    $0x1,%eax
   29e86:	ff e2                	jmp    *%rdx
   29e88:	f3 0f 1e fa          	endbr64
   29e8c:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   29e90:	0b 53 e8             	or     -0x18(%rbx),%edx
   29e93:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   29e97:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   29e9b:	0f 85 8d 4b 00 00    	jne    2ea2e <JS_CallInternal+0x971e>
   29ea1:	d3 f8                	sar    %cl,%eax
   29ea3:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   29eaa:	00 
   29eab:	48 83 eb 10          	sub    $0x10,%rbx
   29eaf:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29eb3:	41 0f b6 04 24       	movzbl (%r12),%eax
   29eb8:	49 83 c4 01          	add    $0x1,%r12
   29ebc:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   29ec0:	49 89 c2             	mov    %rax,%r10
   29ec3:	b8 01 00 00 00       	mov    $0x1,%eax
   29ec8:	ff e2                	jmp    *%rdx
   29eca:	f3 0f 1e fa          	endbr64
   29ece:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   29ed2:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   29ed6:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   29eda:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   29ede:	89 cf                	mov    %ecx,%edi
   29ee0:	09 f7                	or     %esi,%edi
   29ee2:	0f 85 3c 43 00 00    	jne    2e224 <JS_CallInternal+0x8f14>
   29ee8:	39 d0                	cmp    %edx,%eax
   29eea:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   29ef1:	00 
   29ef2:	0f 9e c0             	setle  %al
   29ef5:	48 83 eb 10          	sub    $0x10,%rbx
   29ef9:	0f b6 c0             	movzbl %al,%eax
   29efc:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29f00:	41 0f b6 04 24       	movzbl (%r12),%eax
   29f05:	49 83 c4 01          	add    $0x1,%r12
   29f09:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   29f0d:	49 89 c2             	mov    %rax,%r10
   29f10:	b8 01 00 00 00       	mov    $0x1,%eax
   29f15:	ff e2                	jmp    *%rdx
   29f17:	f3 0f 1e fa          	endbr64
   29f1b:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   29f1f:	0b 53 e8             	or     -0x18(%rbx),%edx
   29f22:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   29f26:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   29f2a:	0f 85 c6 4c 00 00    	jne    2ebf6 <JS_CallInternal+0x98e6>
   29f30:	09 c8                	or     %ecx,%eax
   29f32:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   29f39:	00 
   29f3a:	48 83 eb 10          	sub    $0x10,%rbx
   29f3e:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29f42:	41 0f b6 04 24       	movzbl (%r12),%eax
   29f47:	49 83 c4 01          	add    $0x1,%r12
   29f4b:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   29f4f:	49 89 c2             	mov    %rax,%r10
   29f52:	b8 01 00 00 00       	mov    $0x1,%eax
   29f57:	ff e2                	jmp    *%rdx
   29f59:	f3 0f 1e fa          	endbr64
   29f5d:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   29f61:	0b 53 e8             	or     -0x18(%rbx),%edx
   29f64:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   29f68:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   29f6c:	0f 85 f2 42 00 00    	jne    2e264 <JS_CallInternal+0x8f54>
   29f72:	d3 e0                	shl    %cl,%eax
   29f74:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   29f7b:	00 
   29f7c:	48 83 eb 10          	sub    $0x10,%rbx
   29f80:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29f84:	41 0f b6 04 24       	movzbl (%r12),%eax
   29f89:	49 83 c4 01          	add    $0x1,%r12
   29f8d:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   29f91:	49 89 c2             	mov    %rax,%r10
   29f94:	b8 01 00 00 00       	mov    $0x1,%eax
   29f99:	ff e2                	jmp    *%rdx
   29f9b:	f3 0f 1e fa          	endbr64
   29f9f:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   29fa3:	0b 53 e8             	or     -0x18(%rbx),%edx
   29fa6:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   29faa:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   29fae:	0f 85 94 3f 00 00    	jne    2df48 <JS_CallInternal+0x8c38>
   29fb4:	21 c8                	and    %ecx,%eax
   29fb6:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   29fbd:	00 
   29fbe:	48 83 eb 10          	sub    $0x10,%rbx
   29fc2:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29fc6:	41 0f b6 04 24       	movzbl (%r12),%eax
   29fcb:	49 83 c4 01          	add    $0x1,%r12
   29fcf:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   29fd3:	49 89 c2             	mov    %rax,%r10
   29fd6:	b8 01 00 00 00       	mov    $0x1,%eax
   29fdb:	ff e2                	jmp    *%rdx
   29fdd:	f3 0f 1e fa          	endbr64
   29fe1:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   29fe5:	0b 53 e8             	or     -0x18(%rbx),%edx
   29fe8:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   29fec:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   29ff0:	0f 85 57 41 00 00    	jne    2e14d <JS_CallInternal+0x8e3d>
   29ff6:	d3 e8                	shr    %cl,%eax
   29ff8:	85 c0                	test   %eax,%eax
   29ffa:	0f 88 44 28 00 00    	js     2c844 <JS_CallInternal+0x7534>
   2a000:	66 0f 6e c0          	movd   %eax,%xmm0
   2a004:	31 c0                	xor    %eax,%eax
   2a006:	48 89 43 e8          	mov    %rax,-0x18(%rbx)
   2a00a:	48 83 eb 10          	sub    $0x10,%rbx
   2a00e:	f2 0f 11 43 f0       	movsd  %xmm0,-0x10(%rbx)
   2a013:	41 0f b6 04 24       	movzbl (%r12),%eax
   2a018:	49 83 c4 01          	add    $0x1,%r12
   2a01c:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2a020:	49 89 c2             	mov    %rax,%r10
   2a023:	b8 01 00 00 00       	mov    $0x1,%eax
   2a028:	ff e2                	jmp    *%rdx
   2a02a:	f3 0f 1e fa          	endbr64
   2a02e:	44 8b 43 f8          	mov    -0x8(%rbx),%r8d
   2a032:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2a036:	45 85 c0             	test   %r8d,%r8d
   2a039:	0f 85 99 2b 00 00    	jne    2cbd8 <JS_CallInternal+0x78c8>
   2a03f:	f7 d0                	not    %eax
   2a041:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   2a048:	00 
   2a049:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2a04d:	41 0f b6 04 24       	movzbl (%r12),%eax
   2a052:	49 83 c4 01          	add    $0x1,%r12
   2a056:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2a05a:	49 89 c2             	mov    %rax,%r10
   2a05d:	b8 01 00 00 00       	mov    $0x1,%eax
   2a062:	ff e2                	jmp    *%rdx
   2a064:	f3 0f 1e fa          	endbr64
   2a068:	44 8b 4b f8          	mov    -0x8(%rbx),%r9d
   2a06c:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2a070:	45 85 c9             	test   %r9d,%r9d
   2a073:	0f 85 96 26 00 00    	jne    2c70f <JS_CallInternal+0x73ff>
   2a079:	3d 00 00 00 80       	cmp    $0x80000000,%eax
   2a07e:	0f 84 8b 26 00 00    	je     2c70f <JS_CallInternal+0x73ff>
   2a084:	83 e8 01             	sub    $0x1,%eax
   2a087:	48 c7 43 08 00 00 00 	movq   $0x0,0x8(%rbx)
   2a08e:	00 
   2a08f:	48 89 03             	mov    %rax,(%rbx)
   2a092:	41 0f b6 04 24       	movzbl (%r12),%eax
   2a097:	48 83 c3 10          	add    $0x10,%rbx
   2a09b:	49 83 c4 01          	add    $0x1,%r12
   2a09f:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2a0a3:	49 89 c2             	mov    %rax,%r10
   2a0a6:	b8 01 00 00 00       	mov    $0x1,%eax
   2a0ab:	ff e2                	jmp    *%rdx
   2a0ad:	f3 0f 1e fa          	endbr64
   2a0b1:	41 8b 04 24          	mov    (%r12),%eax
   2a0b5:	4c 8b 5b e8          	mov    -0x18(%rbx),%r11
   2a0b9:	4d 8d 7c 24 04       	lea    0x4(%r12),%r15
   2a0be:	4c 8b 53 e0          	mov    -0x20(%rbx),%r10
   2a0c2:	4c 01 e0             	add    %r12,%rax
   2a0c5:	41 83 fb ff          	cmp    $0xffffffff,%r11d
   2a0c9:	75 0c                	jne    2a0d7 <JS_CallInternal+0x4dc7>
   2a0cb:	66 41 83 7a 12 01    	cmpw   $0x1,0x12(%r10)
   2a0d1:	0f 84 65 34 00 00    	je     2d53c <JS_CallInternal+0x822c>
   2a0d7:	48 83 ec 08          	sub    $0x8,%rsp
   2a0db:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2a0df:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2a0e3:	4c 89 da             	mov    %r11,%rdx
   2a0e6:	48 8b 8d b8 fe ff ff 	mov    -0x148(%rbp),%rcx
   2a0ed:	4c 89 9d 30 fe ff ff 	mov    %r11,-0x1d0(%rbp)
   2a0f4:	4c 89 d6             	mov    %r10,%rsi
   2a0f7:	4c 89 ef             	mov    %r13,%rdi
   2a0fa:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   2a101:	4c 89 79 30          	mov    %r15,0x30(%rcx)
   2a105:	8b 48 14             	mov    0x14(%rax),%ecx
   2a108:	68 00 80 00 00       	push   $0x8000
   2a10d:	41 53                	push   %r11
   2a10f:	41 52                	push   %r10
   2a111:	e8 2a 6e 00 00       	call   30f40 <JS_SetPropertyInternal>
   2a116:	4c 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%r11
   2a11d:	48 83 c4 20          	add    $0x20,%rsp
   2a121:	89 c1                	mov    %eax,%ecx
   2a123:	41 83 fb f6          	cmp    $0xfffffff6,%r11d
   2a127:	76 1a                	jbe    2a143 <JS_CallInternal+0x4e33>
   2a129:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   2a130:	41 8b 42 fc          	mov    -0x4(%r10),%eax
   2a134:	83 e8 01             	sub    $0x1,%eax
   2a137:	41 89 42 fc          	mov    %eax,-0x4(%r10)
   2a13b:	85 c0                	test   %eax,%eax
   2a13d:	0f 8e cf 3a 00 00    	jle    2dc12 <JS_CallInternal+0x8902>
   2a143:	48 83 eb 20          	sub    $0x20,%rbx
   2a147:	85 c9                	test   %ecx,%ecx
   2a149:	0f 88 01 b9 ff ff    	js     25a50 <JS_CallInternal+0x740>
   2a14f:	41 0f b6 44 24 04    	movzbl 0x4(%r12),%eax
   2a155:	49 83 c4 05          	add    $0x5,%r12
   2a159:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2a15d:	49 89 c2             	mov    %rax,%r10
   2a160:	b8 01 00 00 00       	mov    $0x1,%eax
   2a165:	ff e2                	jmp    *%rdx
   2a167:	f3 0f 1e fa          	endbr64
   2a16b:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2a16f:	0b 43 e8             	or     -0x18(%rbx),%eax
   2a172:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   2a176:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2a17a:	0f 85 79 df ff ff    	jne    280f9 <JS_CallInternal+0x2de9>
   2a180:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2a184:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2a188:	f2 0f 2a c1          	cvtsi2sd %ecx,%xmm0
   2a18c:	f2 0f 2a ca          	cvtsi2sd %edx,%xmm1
   2a190:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
   2a194:	66 0f 2f 05 64 52 0b 	comisd 0xb5264(%rip),%xmm0        # df400 <__PRETTY_FUNCTION__.0+0xc0>
   2a19b:	00 
   2a19c:	66 48 0f 7e c0       	movq   %xmm0,%rax
   2a1a1:	0f 82 eb 1e 00 00    	jb     2c092 <JS_CallInternal+0x6d82>
   2a1a7:	f2 0f 10 0d 59 52 0b 	movsd  0xb5259(%rip),%xmm1        # df408 <__PRETTY_FUNCTION__.0+0xc8>
   2a1ae:	00 
   2a1af:	66 0f 2f c8          	comisd %xmm0,%xmm1
   2a1b3:	0f 82 d9 1e 00 00    	jb     2c092 <JS_CallInternal+0x6d82>
   2a1b9:	f2 0f 2c c8          	cvttsd2si %xmm0,%ecx
   2a1bd:	66 0f ef ff          	pxor   %xmm7,%xmm7
   2a1c1:	ba 08 00 00 00       	mov    $0x8,%edx
   2a1c6:	f2 0f 2a f9          	cvtsi2sd %ecx,%xmm7
   2a1ca:	66 48 0f 7e fe       	movq   %xmm7,%rsi
   2a1cf:	89 c9                	mov    %ecx,%ecx
   2a1d1:	48 39 f0             	cmp    %rsi,%rax
   2a1d4:	be 00 00 00 00       	mov    $0x0,%esi
   2a1d9:	48 0f 44 d6          	cmove  %rsi,%rdx
   2a1dd:	48 0f 44 c1          	cmove  %rcx,%rax
   2a1e1:	48 89 53 e8          	mov    %rdx,-0x18(%rbx)
   2a1e5:	49 83 c4 01          	add    $0x1,%r12
   2a1e9:	48 83 eb 10          	sub    $0x10,%rbx
   2a1ed:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2a1f1:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2a1f7:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2a1fb:	49 89 c2             	mov    %rax,%r10
   2a1fe:	b8 01 00 00 00       	mov    $0x1,%eax
   2a203:	ff e2                	jmp    *%rdx
   2a205:	f3 0f 1e fa          	endbr64
   2a209:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2a20d:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   2a211:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   2a215:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2a219:	89 c7                	mov    %eax,%edi
   2a21b:	09 f7                	or     %esi,%edi
   2a21d:	0f 85 ea 45 00 00    	jne    2e80d <JS_CallInternal+0x94fd>
   2a223:	48 63 f2             	movslq %edx,%rsi
   2a226:	48 63 c1             	movslq %ecx,%rax
   2a229:	48 0f af c6          	imul   %rsi,%rax
   2a22d:	48 63 f0             	movslq %eax,%rsi
   2a230:	48 39 c6             	cmp    %rax,%rsi
   2a233:	0f 85 b5 45 00 00    	jne    2e7ee <JS_CallInternal+0x94de>
   2a239:	48 85 f6             	test   %rsi,%rsi
   2a23c:	0f 84 bf 4a 00 00    	je     2ed01 <JS_CallInternal+0x99f1>
   2a242:	83 e0 ff             	and    $0xffffffff,%eax
   2a245:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   2a24c:	00 
   2a24d:	48 83 eb 10          	sub    $0x10,%rbx
   2a251:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2a255:	41 0f b6 04 24       	movzbl (%r12),%eax
   2a25a:	49 83 c4 01          	add    $0x1,%r12
   2a25e:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2a262:	49 89 c2             	mov    %rax,%r10
   2a265:	b8 01 00 00 00       	mov    $0x1,%eax
   2a26a:	ff e2                	jmp    *%rdx
   2a26c:	f3 0f 1e fa          	endbr64
   2a270:	49 0f be 04 24       	movsbq (%r12),%rax
   2a275:	4d 8d 3c 04          	lea    (%r12,%rax,1),%r15
   2a279:	41 8b 85 a8 01 00 00 	mov    0x1a8(%r13),%eax
   2a280:	83 e8 01             	sub    $0x1,%eax
   2a283:	41 89 85 a8 01 00 00 	mov    %eax,0x1a8(%r13)
   2a28a:	85 c0                	test   %eax,%eax
   2a28c:	0f 8e 8e 49 00 00    	jle    2ec20 <JS_CallInternal+0x9910>
   2a292:	41 0f b6 07          	movzbl (%r15),%eax
   2a296:	4d 8d 67 01          	lea    0x1(%r15),%r12
   2a29a:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2a29e:	49 89 c2             	mov    %rax,%r10
   2a2a1:	b8 01 00 00 00       	mov    $0x1,%eax
   2a2a6:	ff e2                	jmp    *%rdx
   2a2a8:	f3 0f 1e fa          	endbr64
   2a2ac:	49 63 04 24          	movslq (%r12),%rax
   2a2b0:	4d 8d 3c 04          	lea    (%r12,%rax,1),%r15
   2a2b4:	41 8b 85 a8 01 00 00 	mov    0x1a8(%r13),%eax
   2a2bb:	83 e8 01             	sub    $0x1,%eax
   2a2be:	41 89 85 a8 01 00 00 	mov    %eax,0x1a8(%r13)
   2a2c5:	85 c0                	test   %eax,%eax
   2a2c7:	0f 8e 6b 49 00 00    	jle    2ec38 <JS_CallInternal+0x9928>
   2a2cd:	41 0f b6 07          	movzbl (%r15),%eax
   2a2d1:	4d 8d 67 01          	lea    0x1(%r15),%r12
   2a2d5:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2a2d9:	49 89 c2             	mov    %rax,%r10
   2a2dc:	b8 01 00 00 00       	mov    $0x1,%eax
   2a2e1:	ff e2                	jmp    *%rdx
   2a2e3:	f3 0f 1e fa          	endbr64
   2a2e7:	49 8b b5 90 01 00 00 	mov    0x190(%r13),%rsi
   2a2ee:	41 8b 0c 24          	mov    (%r12),%ecx
   2a2f2:	4d 8d 7c 24 04       	lea    0x4(%r12),%r15
   2a2f7:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2a2fe:	48 8b 7e 18          	mov    0x18(%rsi),%rdi
   2a302:	4c 89 78 30          	mov    %r15,0x30(%rax)
   2a306:	89 c8                	mov    %ecx,%eax
   2a308:	8b 57 18             	mov    0x18(%rdi),%edx
   2a30b:	21 d0                	and    %edx,%eax
   2a30d:	8b 44 87 38          	mov    0x38(%rdi,%rax,4),%eax
   2a311:	48 85 c0             	test   %rax,%rax
   2a314:	0f 84 cf 31 00 00    	je     2d4e9 <JS_CallInternal+0x81d9>
   2a31a:	4c 8d 04 95 3c 00 00 	lea    0x3c(,%rdx,4),%r8
   2a321:	00 
   2a322:	48 83 e8 01          	sub    $0x1,%rax
   2a326:	49 8d 14 c0          	lea    (%r8,%rax,8),%rdx
   2a32a:	48 01 fa             	add    %rdi,%rdx
   2a32d:	39 4a 04             	cmp    %ecx,0x4(%rdx)
   2a330:	0f 85 a6 31 00 00    	jne    2d4dc <JS_CallInternal+0x81cc>
   2a336:	48 c1 e0 04          	shl    $0x4,%rax
   2a33a:	48 03 46 20          	add    0x20(%rsi),%rax
   2a33e:	48 8b 00             	mov    (%rax),%rax
   2a341:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a345:	83 78 08 04          	cmpl   $0x4,0x8(%rax)
   2a349:	0f 84 69 48 00 00    	je     2ebb8 <JS_CallInternal+0x98a8>
   2a34f:	f6 42 03 08          	testb  $0x8,0x3(%rdx)
   2a353:	0f 84 6f 49 00 00    	je     2ecc8 <JS_CallInternal+0x99b8>
   2a359:	49 8b 85 98 01 00 00 	mov    0x198(%r13),%rax
   2a360:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2a363:	76 04                	jbe    2a369 <JS_CallInternal+0x5059>
   2a365:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2a369:	48 89 33             	mov    %rsi,(%rbx)
   2a36c:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2a370:	31 d2                	xor    %edx,%edx
   2a372:	89 ce                	mov    %ecx,%esi
   2a374:	4c 89 ef             	mov    %r13,%rdi
   2a377:	48 83 c3 20          	add    $0x20,%rbx
   2a37b:	e8 80 19 01 00       	call   3bd00 <__JS_AtomToValue>
   2a380:	49 83 c4 05          	add    $0x5,%r12
   2a384:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2a388:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2a38c:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2a392:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2a396:	49 89 c2             	mov    %rax,%r10
   2a399:	b8 01 00 00 00       	mov    $0x1,%eax
   2a39e:	ff e2                	jmp    *%rdx
   2a3a0:	f3 0f 1e fa          	endbr64
   2a3a4:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2a3a8:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2a3ac:	83 fa 02             	cmp    $0x2,%edx
   2a3af:	0f 87 0b 21 00 00    	ja     2c4c0 <JS_CallInternal+0x71b0>
   2a3b5:	85 c0                	test   %eax,%eax
   2a3b7:	0f 84 12 4c 00 00    	je     2efcf <JS_CallInternal+0x9cbf>
   2a3bd:	3d 00 00 00 80       	cmp    $0x80000000,%eax
   2a3c2:	0f 84 ac 4b 00 00    	je     2ef74 <JS_CallInternal+0x9c64>
   2a3c8:	f7 d8                	neg    %eax
   2a3ca:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   2a3d1:	00 
   2a3d2:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2a3d6:	41 0f b6 04 24       	movzbl (%r12),%eax
   2a3db:	49 83 c4 01          	add    $0x1,%r12
   2a3df:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2a3e3:	49 89 c2             	mov    %rax,%r10
   2a3e6:	b8 01 00 00 00       	mov    $0x1,%eax
   2a3eb:	ff e2                	jmp    *%rdx
   2a3ed:	f3 0f 1e fa          	endbr64
   2a3f1:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2a3f5:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2a3f9:	a9 f7 ff ff ff       	test   $0xfffffff7,%eax
   2a3fe:	74 1b                	je     2a41b <JS_CallInternal+0x510b>
   2a400:	83 e8 01             	sub    $0x1,%eax
   2a403:	83 f8 01             	cmp    $0x1,%eax
   2a406:	0f 87 2b 2f 00 00    	ja     2d337 <JS_CallInternal+0x8027>
   2a40c:	83 e2 ff             	and    $0xffffffff,%edx
   2a40f:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   2a416:	00 
   2a417:	48 89 53 f0          	mov    %rdx,-0x10(%rbx)
   2a41b:	41 0f b6 04 24       	movzbl (%r12),%eax
   2a420:	49 83 c4 01          	add    $0x1,%r12
   2a424:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2a428:	49 89 c2             	mov    %rax,%r10
   2a42b:	b8 01 00 00 00       	mov    $0x1,%eax
   2a430:	ff e2                	jmp    *%rdx
   2a432:	f3 0f 1e fa          	endbr64
   2a436:	44 8b 5b f8          	mov    -0x8(%rbx),%r11d
   2a43a:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2a43e:	45 85 db             	test   %r11d,%r11d
   2a441:	0f 85 64 22 00 00    	jne    2c6ab <JS_CallInternal+0x739b>
   2a447:	3d ff ff ff 7f       	cmp    $0x7fffffff,%eax
   2a44c:	0f 84 59 22 00 00    	je     2c6ab <JS_CallInternal+0x739b>
   2a452:	83 c0 01             	add    $0x1,%eax
   2a455:	48 c7 43 08 00 00 00 	movq   $0x0,0x8(%rbx)
   2a45c:	00 
   2a45d:	48 89 03             	mov    %rax,(%rbx)
   2a460:	41 0f b6 04 24       	movzbl (%r12),%eax
   2a465:	48 83 c3 10          	add    $0x10,%rbx
   2a469:	49 83 c4 01          	add    $0x1,%r12
   2a46d:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2a471:	49 89 c2             	mov    %rax,%r10
   2a474:	b8 01 00 00 00       	mov    $0x1,%eax
   2a479:	ff e2                	jmp    *%rdx
   2a47b:	f3 0f 1e fa          	endbr64
   2a47f:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2a483:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   2a487:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   2a48b:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2a48f:	89 c6                	mov    %eax,%esi
   2a491:	09 d6                	or     %edx,%esi
   2a493:	0f 85 0a 3d 00 00    	jne    2e1a3 <JS_CallInternal+0x8e93>
   2a499:	48 63 f1             	movslq %ecx,%rsi
   2a49c:	48 63 c7             	movslq %edi,%rax
   2a49f:	8d 14 39             	lea    (%rcx,%rdi,1),%edx
   2a4a2:	48 01 f0             	add    %rsi,%rax
   2a4a5:	48 63 ca             	movslq %edx,%rcx
   2a4a8:	48 39 c1             	cmp    %rax,%rcx
   2a4ab:	0f 85 d7 3c 00 00    	jne    2e188 <JS_CallInternal+0x8e78>
   2a4b1:	89 d0                	mov    %edx,%eax
   2a4b3:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   2a4ba:	00 
   2a4bb:	48 89 43 e0          	mov    %rax,-0x20(%rbx)
   2a4bf:	48 83 eb 10          	sub    $0x10,%rbx
   2a4c3:	41 0f b6 04 24       	movzbl (%r12),%eax
   2a4c8:	49 83 c4 01          	add    $0x1,%r12
   2a4cc:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2a4d0:	49 89 c2             	mov    %rax,%r10
   2a4d3:	b8 01 00 00 00       	mov    $0x1,%eax
   2a4d8:	ff e2                	jmp    *%rdx
   2a4da:	f3 0f 1e fa          	endbr64
   2a4de:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   2a4e2:	4c 8d 7b e0          	lea    -0x20(%rbx),%r15
   2a4e6:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   2a4ea:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2a4ed:	76 11                	jbe    2a500 <JS_CallInternal+0x51f0>
   2a4ef:	8b 71 fc             	mov    -0x4(%rcx),%esi
   2a4f2:	8d 56 ff             	lea    -0x1(%rsi),%edx
   2a4f5:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2a4f8:	85 d2                	test   %edx,%edx
   2a4fa:	0f 8e 1d 32 00 00    	jle    2d71d <JS_CallInternal+0x840d>
   2a500:	4c 8d 5b d0          	lea    -0x30(%rbx),%r11
   2a504:	83 7b d8 03          	cmpl   $0x3,-0x28(%rbx)
   2a508:	74 51                	je     2a55b <JS_CallInternal+0x524b>
   2a50a:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2a511:	49 8b 53 08          	mov    0x8(%r11),%rdx
   2a515:	31 c9                	xor    %ecx,%ecx
   2a517:	4c 89 ef             	mov    %r13,%rdi
   2a51a:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   2a51e:	4c 89 9d 30 fe ff ff 	mov    %r11,-0x1d0(%rbp)
   2a525:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2a529:	e8 62 a5 06 00       	call   94a90 <JS_IteratorClose>
   2a52e:	4c 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%r11
   2a535:	85 c0                	test   %eax,%eax
   2a537:	0f 85 67 59 00 00    	jne    2fea4 <JS_CallInternal+0xab94>
   2a53d:	49 8b 43 08          	mov    0x8(%r11),%rax
   2a541:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2a544:	76 15                	jbe    2a55b <JS_CallInternal+0x524b>
   2a546:	48 8b 4b d0          	mov    -0x30(%rbx),%rcx
   2a54a:	8b 59 fc             	mov    -0x4(%rcx),%ebx
   2a54d:	8d 53 ff             	lea    -0x1(%rbx),%edx
   2a550:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2a553:	85 d2                	test   %edx,%edx
   2a555:	0f 8e 0b 4c 00 00    	jle    2f166 <JS_CallInternal+0x9e56>
   2a55b:	41 0f b6 04 24       	movzbl (%r12),%eax
   2a560:	4c 89 db             	mov    %r11,%rbx
   2a563:	49 83 c4 01          	add    $0x1,%r12
   2a567:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2a56b:	49 89 c2             	mov    %rax,%r10
   2a56e:	b8 01 00 00 00       	mov    $0x1,%eax
   2a573:	ff e2                	jmp    *%rdx
   2a575:	f3 0f 1e fa          	endbr64
   2a579:	83 7b f8 ff          	cmpl   $0xffffffff,-0x8(%rbx)
   2a57d:	0f 85 c7 3d 00 00    	jne    2e34a <JS_CallInternal+0x903a>
   2a583:	41 0f b6 04 24       	movzbl (%r12),%eax
   2a588:	49 83 c4 01          	add    $0x1,%r12
   2a58c:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2a590:	49 89 c2             	mov    %rax,%r10
   2a593:	b8 01 00 00 00       	mov    $0x1,%eax
   2a598:	ff e2                	jmp    *%rdx
   2a59a:	f3 0f 1e fa          	endbr64
   2a59e:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2a5a2:	0b 43 e8             	or     -0x18(%rbx),%eax
   2a5a5:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   2a5a9:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2a5ad:	0f 85 46 db ff ff    	jne    280f9 <JS_CallInternal+0x2de9>
   2a5b3:	89 c8                	mov    %ecx,%eax
   2a5b5:	89 d6                	mov    %edx,%esi
   2a5b7:	85 c9                	test   %ecx,%ecx
   2a5b9:	0f 88 3a db ff ff    	js     280f9 <JS_CallInternal+0x2de9>
   2a5bf:	85 d2                	test   %edx,%edx
   2a5c1:	0f 8e 32 db ff ff    	jle    280f9 <JS_CallInternal+0x2de9>
   2a5c7:	99                   	cltd
   2a5c8:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   2a5cf:	00 
   2a5d0:	49 83 c4 01          	add    $0x1,%r12
   2a5d4:	48 83 eb 10          	sub    $0x10,%rbx
   2a5d8:	f7 fe                	idiv   %esi
   2a5da:	48 63 d2             	movslq %edx,%rdx
   2a5dd:	48 89 53 f0          	mov    %rdx,-0x10(%rbx)
   2a5e1:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2a5e7:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2a5eb:	49 89 c2             	mov    %rax,%r10
   2a5ee:	b8 01 00 00 00       	mov    $0x1,%eax
   2a5f3:	ff e2                	jmp    *%rdx
   2a5f5:	f3 0f 1e fa          	endbr64
   2a5f9:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   2a5fd:	41 0f b7 04 24       	movzwl (%r12),%eax
   2a602:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   2a606:	83 fe f6             	cmp    $0xfffffff6,%esi
   2a609:	76 04                	jbe    2a60f <JS_CallInternal+0x52ff>
   2a60b:	83 47 fc 01          	addl   $0x1,-0x4(%rdi)
   2a60f:	48 8b 8d 88 fe ff ff 	mov    -0x178(%rbp),%rcx
   2a616:	48 8b 04 c1          	mov    (%rcx,%rax,8),%rax
   2a61a:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a61e:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2a622:	48 8b 08             	mov    (%rax),%rcx
   2a625:	48 89 70 08          	mov    %rsi,0x8(%rax)
   2a629:	48 89 38             	mov    %rdi,(%rax)
   2a62c:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a62f:	76 11                	jbe    2a642 <JS_CallInternal+0x5332>
   2a631:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2a634:	83 e8 01             	sub    $0x1,%eax
   2a637:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2a63a:	85 c0                	test   %eax,%eax
   2a63c:	0f 8e 00 31 00 00    	jle    2d742 <JS_CallInternal+0x8432>
   2a642:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   2a648:	49 83 c4 03          	add    $0x3,%r12
   2a64c:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2a650:	49 89 c2             	mov    %rax,%r10
   2a653:	b8 01 00 00 00       	mov    $0x1,%eax
   2a658:	ff e2                	jmp    *%rdx
   2a65a:	f3 0f 1e fa          	endbr64
   2a65e:	41 0f b7 04 24       	movzwl (%r12),%eax
   2a663:	48 8b 8d 88 fe ff ff 	mov    -0x178(%rbp),%rcx
   2a66a:	48 8b 04 c1          	mov    (%rcx,%rax,8),%rax
   2a66e:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a672:	48 8b 10             	mov    (%rax),%rdx
   2a675:	48 8b 40 08          	mov    0x8(%rax),%rax
   2a679:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2a67c:	76 04                	jbe    2a682 <JS_CallInternal+0x5372>
   2a67e:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2a682:	48 89 13             	mov    %rdx,(%rbx)
   2a685:	49 83 c4 03          	add    $0x3,%r12
   2a689:	48 83 c3 10          	add    $0x10,%rbx
   2a68d:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2a691:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2a697:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2a69b:	49 89 c2             	mov    %rax,%r10
   2a69e:	b8 01 00 00 00       	mov    $0x1,%eax
   2a6a3:	ff e2                	jmp    *%rdx
   2a6a5:	f3 0f 1e fa          	endbr64
   2a6a9:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2a6ad:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2a6b1:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   2a6b4:	76 04                	jbe    2a6ba <JS_CallInternal+0x53aa>
   2a6b6:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2a6ba:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2a6c1:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a6c5:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a6c9:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2a6cd:	48 8b 38             	mov    (%rax),%rdi
   2a6d0:	48 89 48 08          	mov    %rcx,0x8(%rax)
   2a6d4:	48 89 30             	mov    %rsi,(%rax)
   2a6d7:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a6da:	76 11                	jbe    2a6ed <JS_CallInternal+0x53dd>
   2a6dc:	8b 47 fc             	mov    -0x4(%rdi),%eax
   2a6df:	83 e8 01             	sub    $0x1,%eax
   2a6e2:	89 47 fc             	mov    %eax,-0x4(%rdi)
   2a6e5:	85 c0                	test   %eax,%eax
   2a6e7:	0f 8e 44 30 00 00    	jle    2d731 <JS_CallInternal+0x8421>
   2a6ed:	41 0f b6 04 24       	movzbl (%r12),%eax
   2a6f2:	49 83 c4 01          	add    $0x1,%r12
   2a6f6:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2a6fa:	49 89 c2             	mov    %rax,%r10
   2a6fd:	b8 01 00 00 00       	mov    $0x1,%eax
   2a702:	ff e2                	jmp    *%rdx
   2a704:	f3 0f 1e fa          	endbr64
   2a708:	41 0f b7 04 24       	movzwl (%r12),%eax
   2a70d:	48 8b 8d 88 fe ff ff 	mov    -0x178(%rbp),%rcx
   2a714:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2a719:	48 8b 04 c1          	mov    (%rcx,%rax,8),%rax
   2a71d:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a721:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2a725:	48 8b 08             	mov    (%rax),%rcx
   2a728:	0f 11 00             	movups %xmm0,(%rax)
   2a72b:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a72e:	76 11                	jbe    2a741 <JS_CallInternal+0x5431>
   2a730:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2a733:	83 e8 01             	sub    $0x1,%eax
   2a736:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2a739:	85 c0                	test   %eax,%eax
   2a73b:	0f 8e 76 35 00 00    	jle    2dcb7 <JS_CallInternal+0x89a7>
   2a741:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   2a747:	48 83 eb 10          	sub    $0x10,%rbx
   2a74b:	49 83 c4 03          	add    $0x3,%r12
   2a74f:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2a753:	49 89 c2             	mov    %rax,%r10
   2a756:	b8 01 00 00 00       	mov    $0x1,%eax
   2a75b:	ff e2                	jmp    *%rdx
   2a75d:	f3 0f 1e fa          	endbr64
   2a761:	41 0f b7 0c 24       	movzwl (%r12),%ecx
   2a766:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2a76d:	4d 8d 7c 24 02       	lea    0x2(%r12),%r15
   2a772:	48 8b 04 c8          	mov    (%rax,%rcx,8),%rax
   2a776:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a77a:	48 8b 10             	mov    (%rax),%rdx
   2a77d:	48 8b 40 08          	mov    0x8(%rax),%rax
   2a781:	83 f8 04             	cmp    $0x4,%eax
   2a784:	0f 84 b0 40 00 00    	je     2e83a <JS_CallInternal+0x952a>
   2a78a:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2a78d:	76 04                	jbe    2a793 <JS_CallInternal+0x5483>
   2a78f:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2a793:	48 89 13             	mov    %rdx,(%rbx)
   2a796:	49 83 c4 03          	add    $0x3,%r12
   2a79a:	48 83 c3 10          	add    $0x10,%rbx
   2a79e:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2a7a2:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2a7a8:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2a7ac:	49 89 c2             	mov    %rax,%r10
   2a7af:	b8 01 00 00 00       	mov    $0x1,%eax
   2a7b4:	ff e2                	jmp    *%rdx
   2a7b6:	f3 0f 1e fa          	endbr64
   2a7ba:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2a7c1:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2a7c6:	48 83 eb 10          	sub    $0x10,%rbx
   2a7ca:	48 8b 40 10          	mov    0x10(%rax),%rax
   2a7ce:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a7d2:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2a7d6:	48 8b 08             	mov    (%rax),%rcx
   2a7d9:	0f 11 00             	movups %xmm0,(%rax)
   2a7dc:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a7df:	76 11                	jbe    2a7f2 <JS_CallInternal+0x54e2>
   2a7e1:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2a7e4:	83 e8 01             	sub    $0x1,%eax
   2a7e7:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2a7ea:	85 c0                	test   %eax,%eax
   2a7ec:	0f 8e 83 2f 00 00    	jle    2d775 <JS_CallInternal+0x8465>
   2a7f2:	41 0f b6 04 24       	movzbl (%r12),%eax
   2a7f7:	49 83 c4 01          	add    $0x1,%r12
   2a7fb:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2a7ff:	49 89 c2             	mov    %rax,%r10
   2a802:	b8 01 00 00 00       	mov    $0x1,%eax
   2a807:	ff e2                	jmp    *%rdx
   2a809:	f3 0f 1e fa          	endbr64
   2a80d:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2a814:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2a819:	48 83 eb 10          	sub    $0x10,%rbx
   2a81d:	48 8b 40 08          	mov    0x8(%rax),%rax
   2a821:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a825:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2a829:	48 8b 08             	mov    (%rax),%rcx
   2a82c:	0f 11 00             	movups %xmm0,(%rax)
   2a82f:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a832:	76 11                	jbe    2a845 <JS_CallInternal+0x5535>
   2a834:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2a837:	83 e8 01             	sub    $0x1,%eax
   2a83a:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2a83d:	85 c0                	test   %eax,%eax
   2a83f:	0f 8e 1f 2f 00 00    	jle    2d764 <JS_CallInternal+0x8454>
   2a845:	41 0f b6 04 24       	movzbl (%r12),%eax
   2a84a:	49 83 c4 01          	add    $0x1,%r12
   2a84e:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2a852:	49 89 c2             	mov    %rax,%r10
   2a855:	b8 01 00 00 00       	mov    $0x1,%eax
   2a85a:	ff e2                	jmp    *%rdx
   2a85c:	f3 0f 1e fa          	endbr64
   2a860:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2a867:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2a86c:	48 83 eb 10          	sub    $0x10,%rbx
   2a870:	48 8b 00             	mov    (%rax),%rax
   2a873:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a877:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2a87b:	48 8b 08             	mov    (%rax),%rcx
   2a87e:	0f 11 00             	movups %xmm0,(%rax)
   2a881:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a884:	76 11                	jbe    2a897 <JS_CallInternal+0x5587>
   2a886:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2a889:	83 e8 01             	sub    $0x1,%eax
   2a88c:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2a88f:	85 c0                	test   %eax,%eax
   2a891:	0f 8e bc 2e 00 00    	jle    2d753 <JS_CallInternal+0x8443>
   2a897:	41 0f b6 04 24       	movzbl (%r12),%eax
   2a89c:	49 83 c4 01          	add    $0x1,%r12
   2a8a0:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2a8a4:	49 89 c2             	mov    %rax,%r10
   2a8a7:	b8 01 00 00 00       	mov    $0x1,%eax
   2a8ac:	ff e2                	jmp    *%rdx
   2a8ae:	f3 0f 1e fa          	endbr64
   2a8b2:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2a8b9:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   2a8bd:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a8c1:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a8c5:	48 8b 10             	mov    (%rax),%rdx
   2a8c8:	48 8b 40 08          	mov    0x8(%rax),%rax
   2a8cc:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2a8cf:	76 04                	jbe    2a8d5 <JS_CallInternal+0x55c5>
   2a8d1:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2a8d5:	48 89 13             	mov    %rdx,(%rbx)
   2a8d8:	49 83 c4 01          	add    $0x1,%r12
   2a8dc:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2a8e0:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2a8e6:	48 89 cb             	mov    %rcx,%rbx
   2a8e9:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2a8ed:	49 89 c2             	mov    %rax,%r10
   2a8f0:	b8 01 00 00 00       	mov    $0x1,%eax
   2a8f5:	ff e2                	jmp    *%rdx
   2a8f7:	f3 0f 1e fa          	endbr64
   2a8fb:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2a8ff:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2a903:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   2a906:	76 04                	jbe    2a90c <JS_CallInternal+0x55fc>
   2a908:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2a90c:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2a913:	48 8b 00             	mov    (%rax),%rax
   2a916:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a91a:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2a91e:	48 8b 38             	mov    (%rax),%rdi
   2a921:	48 89 48 08          	mov    %rcx,0x8(%rax)
   2a925:	48 89 30             	mov    %rsi,(%rax)
   2a928:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a92b:	76 11                	jbe    2a93e <JS_CallInternal+0x562e>
   2a92d:	8b 47 fc             	mov    -0x4(%rdi),%eax
   2a930:	83 e8 01             	sub    $0x1,%eax
   2a933:	89 47 fc             	mov    %eax,-0x4(%rdi)
   2a936:	85 c0                	test   %eax,%eax
   2a938:	0f 8e 8a 2d 00 00    	jle    2d6c8 <JS_CallInternal+0x83b8>
   2a93e:	41 0f b6 04 24       	movzbl (%r12),%eax
   2a943:	49 83 c4 01          	add    $0x1,%r12
   2a947:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2a94b:	49 89 c2             	mov    %rax,%r10
   2a94e:	b8 01 00 00 00       	mov    $0x1,%eax
   2a953:	ff e2                	jmp    *%rdx
   2a955:	f3 0f 1e fa          	endbr64
   2a959:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2a960:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2a965:	48 83 eb 10          	sub    $0x10,%rbx
   2a969:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a96d:	48 8b 40 18          	mov    0x18(%rax),%rax
   2a971:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2a975:	48 8b 08             	mov    (%rax),%rcx
   2a978:	0f 11 00             	movups %xmm0,(%rax)
   2a97b:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a97e:	76 11                	jbe    2a991 <JS_CallInternal+0x5681>
   2a980:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2a983:	83 e8 01             	sub    $0x1,%eax
   2a986:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2a989:	85 c0                	test   %eax,%eax
   2a98b:	0f 8e 48 2d 00 00    	jle    2d6d9 <JS_CallInternal+0x83c9>
   2a991:	41 0f b6 04 24       	movzbl (%r12),%eax
   2a996:	49 83 c4 01          	add    $0x1,%r12
   2a99a:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2a99e:	49 89 c2             	mov    %rax,%r10
   2a9a1:	b8 01 00 00 00       	mov    $0x1,%eax
   2a9a6:	ff e2                	jmp    *%rdx
   2a9a8:	f3 0f 1e fa          	endbr64
   2a9ac:	41 0f b7 04 24       	movzwl (%r12),%eax
   2a9b1:	4d 8d 7c 24 02       	lea    0x2(%r12),%r15
   2a9b6:	48 89 c1             	mov    %rax,%rcx
   2a9b9:	48 c1 e0 04          	shl    $0x4,%rax
   2a9bd:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   2a9c4:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2a9c8:	83 fa 04             	cmp    $0x4,%edx
   2a9cb:	0f 84 04 3e 00 00    	je     2e7d5 <JS_CallInternal+0x94c5>
   2a9d1:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2a9d5:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2a9d9:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   2a9dc:	76 04                	jbe    2a9e2 <JS_CallInternal+0x56d2>
   2a9de:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2a9e2:	48 8b 38             	mov    (%rax),%rdi
   2a9e5:	48 89 48 08          	mov    %rcx,0x8(%rax)
   2a9e9:	48 89 30             	mov    %rsi,(%rax)
   2a9ec:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a9ef:	76 11                	jbe    2aa02 <JS_CallInternal+0x56f2>
   2a9f1:	8b 47 fc             	mov    -0x4(%rdi),%eax
   2a9f4:	83 e8 01             	sub    $0x1,%eax
   2a9f7:	89 47 fc             	mov    %eax,-0x4(%rdi)
   2a9fa:	85 c0                	test   %eax,%eax
   2a9fc:	0f 8e f9 2c 00 00    	jle    2d6fb <JS_CallInternal+0x83eb>
   2aa02:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   2aa08:	49 83 c4 03          	add    $0x3,%r12
   2aa0c:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2aa10:	49 89 c2             	mov    %rax,%r10
   2aa13:	b8 01 00 00 00       	mov    $0x1,%eax
   2aa18:	ff e2                	jmp    *%rdx
   2aa1a:	f3 0f 1e fa          	endbr64
   2aa1e:	41 0f b7 04 24       	movzwl (%r12),%eax
   2aa23:	4d 8d 7c 24 02       	lea    0x2(%r12),%r15
   2aa28:	48 89 c1             	mov    %rax,%rcx
   2aa2b:	48 c1 e0 04          	shl    $0x4,%rax
   2aa2f:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   2aa36:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2aa3a:	83 fa 04             	cmp    $0x4,%edx
   2aa3d:	0f 84 6c 3e 00 00    	je     2e8af <JS_CallInternal+0x959f>
   2aa43:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2aa48:	48 8b 08             	mov    (%rax),%rcx
   2aa4b:	0f 11 00             	movups %xmm0,(%rax)
   2aa4e:	83 fa f6             	cmp    $0xfffffff6,%edx
   2aa51:	76 11                	jbe    2aa64 <JS_CallInternal+0x5754>
   2aa53:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2aa56:	83 e8 01             	sub    $0x1,%eax
   2aa59:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2aa5c:	85 c0                	test   %eax,%eax
   2aa5e:	0f 8e 86 2c 00 00    	jle    2d6ea <JS_CallInternal+0x83da>
   2aa64:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   2aa6a:	48 83 eb 10          	sub    $0x10,%rbx
   2aa6e:	49 83 c4 03          	add    $0x3,%r12
   2aa72:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2aa76:	49 89 c2             	mov    %rax,%r10
   2aa79:	b8 01 00 00 00       	mov    $0x1,%eax
   2aa7e:	ff e2                	jmp    *%rdx
   2aa80:	f3 0f 1e fa          	endbr64
   2aa84:	41 0f b7 04 24       	movzwl (%r12),%eax
   2aa89:	4d 8d 7c 24 02       	lea    0x2(%r12),%r15
   2aa8e:	48 89 c1             	mov    %rax,%rcx
   2aa91:	48 c1 e0 04          	shl    $0x4,%rax
   2aa95:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   2aa9c:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2aaa0:	83 fa 04             	cmp    $0x4,%edx
   2aaa3:	0f 84 1f 3e 00 00    	je     2e8c8 <JS_CallInternal+0x95b8>
   2aaa9:	48 8b 00             	mov    (%rax),%rax
   2aaac:	83 fa f6             	cmp    $0xfffffff6,%edx
   2aaaf:	76 04                	jbe    2aab5 <JS_CallInternal+0x57a5>
   2aab1:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2aab5:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2aab9:	49 83 c4 03          	add    $0x3,%r12
   2aabd:	48 83 c3 10          	add    $0x10,%rbx
   2aac1:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2aac5:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2aacb:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2aacf:	49 89 c2             	mov    %rax,%r10
   2aad2:	b8 01 00 00 00       	mov    $0x1,%eax
   2aad7:	ff e2                	jmp    *%rdx
   2aad9:	f3 0f 1e fa          	endbr64
   2aadd:	41 0f b7 04 24       	movzwl (%r12),%eax
   2aae2:	4d 8d 7c 24 02       	lea    0x2(%r12),%r15
   2aae7:	48 89 c1             	mov    %rax,%rcx
   2aaea:	48 c1 e0 04          	shl    $0x4,%rax
   2aaee:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   2aaf5:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2aaf9:	83 fa 04             	cmp    $0x4,%edx
   2aafc:	0f 84 16 38 00 00    	je     2e318 <JS_CallInternal+0x9008>
   2ab02:	48 8b 00             	mov    (%rax),%rax
   2ab05:	83 fa f6             	cmp    $0xfffffff6,%edx
   2ab08:	76 04                	jbe    2ab0e <JS_CallInternal+0x57fe>
   2ab0a:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2ab0e:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2ab12:	49 83 c4 03          	add    $0x3,%r12
   2ab16:	48 83 c3 10          	add    $0x10,%rbx
   2ab1a:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2ab1e:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2ab24:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2ab28:	49 89 c2             	mov    %rax,%r10
   2ab2b:	b8 01 00 00 00       	mov    $0x1,%eax
   2ab30:	ff e2                	jmp    *%rdx
   2ab32:	f3 0f 1e fa          	endbr64
   2ab36:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   2ab3d:	41 0f b7 04 24       	movzwl (%r12),%eax
   2ab42:	0f b7 51 38          	movzwl 0x38(%rcx),%edx
   2ab46:	4c 8b 79 28          	mov    0x28(%rcx),%r15
   2ab4a:	48 8b 8d b8 fe ff ff 	mov    -0x148(%rbp),%rcx
   2ab51:	01 d0                	add    %edx,%eax
   2ab53:	48 98                	cltq
   2ab55:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
   2ab59:	49 8d 04 87          	lea    (%r15,%rax,4),%rax
   2ab5d:	44 0f b7 78 0a       	movzwl 0xa(%rax),%r15d
   2ab62:	4a 8d 14 fd 00 00 00 	lea    0x0(,%r15,8),%rdx
   2ab69:	00 
   2ab6a:	48 03 51 28          	add    0x28(%rcx),%rdx
   2ab6e:	48 8b 02             	mov    (%rdx),%rax
   2ab71:	48 85 c0             	test   %rax,%rax
   2ab74:	74 47                	je     2abbd <JS_CallInternal+0x58ad>
   2ab76:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ab7a:	f6 41 3c 04          	testb  $0x4,0x3c(%rcx)
   2ab7e:	0f 85 6c 2a 00 00    	jne    2d5f0 <JS_CallInternal+0x82e0>
   2ab84:	48 8b 70 18          	mov    0x18(%rax),%rsi
   2ab88:	48 8b 0e             	mov    (%rsi),%rcx
   2ab8b:	48 8b 76 08          	mov    0x8(%rsi),%rsi
   2ab8f:	83 fe f6             	cmp    $0xfffffff6,%esi
   2ab92:	76 04                	jbe    2ab98 <JS_CallInternal+0x5888>
   2ab94:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   2ab98:	48 89 70 28          	mov    %rsi,0x28(%rax)
   2ab9c:	48 8d 70 20          	lea    0x20(%rax),%rsi
   2aba0:	66 48 0f 6e e1       	movq   %rcx,%xmm4
   2aba5:	66 48 0f 6e c6       	movq   %rsi,%xmm0
   2abaa:	c6 40 10 01          	movb   $0x1,0x10(%rax)
   2abae:	66 0f 6c c4          	punpcklqdq %xmm4,%xmm0
   2abb2:	0f 11 40 18          	movups %xmm0,0x18(%rax)
   2abb6:	48 c7 02 00 00 00 00 	movq   $0x0,(%rdx)
   2abbd:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   2abc3:	49 83 c4 03          	add    $0x3,%r12
   2abc7:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2abcb:	49 89 c2             	mov    %rax,%r10
   2abce:	b8 01 00 00 00       	mov    $0x1,%eax
   2abd3:	ff e2                	jmp    *%rdx
   2abd5:	f3 0f 1e fa          	endbr64
   2abd9:	41 0f b7 04 24       	movzwl (%r12),%eax
   2abde:	4d 8d 7c 24 02       	lea    0x2(%r12),%r15
   2abe3:	48 c1 e0 04          	shl    $0x4,%rax
   2abe7:	48 03 85 a0 fe ff ff 	add    -0x160(%rbp),%rax
   2abee:	83 78 08 04          	cmpl   $0x4,0x8(%rax)
   2abf2:	0f 85 a1 3c 00 00    	jne    2e899 <JS_CallInternal+0x9589>
   2abf8:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2abfd:	49 83 c4 03          	add    $0x3,%r12
   2ac01:	48 83 eb 10          	sub    $0x10,%rbx
   2ac05:	0f 11 00             	movups %xmm0,(%rax)
   2ac08:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2ac0e:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2ac12:	49 89 c2             	mov    %rax,%r10
   2ac15:	b8 01 00 00 00       	mov    $0x1,%eax
   2ac1a:	ff e2                	jmp    *%rdx
   2ac1c:	f3 0f 1e fa          	endbr64
   2ac20:	e9 3c ac ff ff       	jmp    25861 <JS_CallInternal+0x551>
   2ac25:	f3 0f 1e fa          	endbr64
   2ac29:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2ac2d:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2ac31:	4d 8d 7c 24 04       	lea    0x4(%r12),%r15
   2ac36:	83 fa 03             	cmp    $0x3,%edx
   2ac39:	0f 87 11 21 00 00    	ja     2cd50 <JS_CallInternal+0x7a40>
   2ac3f:	48 83 eb 10          	sub    $0x10,%rbx
   2ac43:	85 c0                	test   %eax,%eax
   2ac45:	75 0c                	jne    2ac53 <JS_CallInternal+0x5943>
   2ac47:	41 8b 04 24          	mov    (%r12),%eax
   2ac4b:	83 e8 04             	sub    $0x4,%eax
   2ac4e:	48 98                	cltq
   2ac50:	49 01 c7             	add    %rax,%r15
   2ac53:	41 8b 85 a8 01 00 00 	mov    0x1a8(%r13),%eax
   2ac5a:	83 e8 01             	sub    $0x1,%eax
   2ac5d:	41 89 85 a8 01 00 00 	mov    %eax,0x1a8(%r13)
   2ac64:	85 c0                	test   %eax,%eax
   2ac66:	0f 8e 34 3f 00 00    	jle    2eba0 <JS_CallInternal+0x9890>
   2ac6c:	41 0f b6 07          	movzbl (%r15),%eax
   2ac70:	4d 8d 67 01          	lea    0x1(%r15),%r12
   2ac74:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2ac78:	49 89 c2             	mov    %rax,%r10
   2ac7b:	b8 01 00 00 00       	mov    $0x1,%eax
   2ac80:	ff e2                	jmp    *%rdx
   2ac82:	f3 0f 1e fa          	endbr64
   2ac86:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2ac8a:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2ac8e:	4d 8d 7c 24 04       	lea    0x4(%r12),%r15
   2ac93:	83 fa 03             	cmp    $0x3,%edx
   2ac96:	0f 87 a4 20 00 00    	ja     2cd40 <JS_CallInternal+0x7a30>
   2ac9c:	48 83 eb 10          	sub    $0x10,%rbx
   2aca0:	85 c0                	test   %eax,%eax
   2aca2:	74 0c                	je     2acb0 <JS_CallInternal+0x59a0>
   2aca4:	41 8b 04 24          	mov    (%r12),%eax
   2aca8:	83 e8 04             	sub    $0x4,%eax
   2acab:	48 98                	cltq
   2acad:	49 01 c7             	add    %rax,%r15
   2acb0:	41 8b 85 a8 01 00 00 	mov    0x1a8(%r13),%eax
   2acb7:	83 e8 01             	sub    $0x1,%eax
   2acba:	41 89 85 a8 01 00 00 	mov    %eax,0x1a8(%r13)
   2acc1:	85 c0                	test   %eax,%eax
   2acc3:	0f 8e b3 37 00 00    	jle    2e47c <JS_CallInternal+0x916c>
   2acc9:	41 0f b6 07          	movzbl (%r15),%eax
   2accd:	4d 8d 67 01          	lea    0x1(%r15),%r12
   2acd1:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2acd5:	49 89 c2             	mov    %rax,%r10
   2acd8:	b8 01 00 00 00       	mov    $0x1,%eax
   2acdd:	ff e2                	jmp    *%rdx
   2acdf:	f3 0f 1e fa          	endbr64
   2ace3:	45 0f b6 0c 24       	movzbl (%r12),%r9d
   2ace8:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2acec:	4d 8d 7c 24 01       	lea    0x1(%r12),%r15
   2acf1:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2acf5:	49 c1 e1 04          	shl    $0x4,%r9
   2acf9:	4c 03 8d a0 fe ff ff 	add    -0x160(%rbp),%r9
   2ad00:	89 ce                	mov    %ecx,%esi
   2ad02:	49 8b 41 08          	mov    0x8(%r9),%rax
   2ad06:	09 c6                	or     %eax,%esi
   2ad08:	0f 85 da 3d 00 00    	jne    2eae8 <JS_CallInternal+0x97d8>
   2ad0e:	49 8b 01             	mov    (%r9),%rax
   2ad11:	48 63 f2             	movslq %edx,%rsi
   2ad14:	48 63 c8             	movslq %eax,%rcx
   2ad17:	01 d0                	add    %edx,%eax
   2ad19:	48 01 f1             	add    %rsi,%rcx
   2ad1c:	48 63 d0             	movslq %eax,%rdx
   2ad1f:	48 39 ca             	cmp    %rcx,%rdx
   2ad22:	0f 85 a8 3d 00 00    	jne    2ead0 <JS_CallInternal+0x97c0>
   2ad28:	89 c0                	mov    %eax,%eax
   2ad2a:	49 89 01             	mov    %rax,(%r9)
   2ad2d:	31 c0                	xor    %eax,%eax
   2ad2f:	49 89 41 08          	mov    %rax,0x8(%r9)
   2ad33:	48 83 eb 10          	sub    $0x10,%rbx
   2ad37:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
   2ad3d:	49 83 c4 02          	add    $0x2,%r12
   2ad41:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2ad45:	49 89 c2             	mov    %rax,%r10
   2ad48:	b8 01 00 00 00       	mov    $0x1,%eax
   2ad4d:	ff e2                	jmp    *%rdx
   2ad4f:	f3 0f 1e fa          	endbr64
   2ad53:	48 8d 43 e0          	lea    -0x20(%rbx),%rax
   2ad57:	48 8b 38             	mov    (%rax),%rdi
   2ad5a:	4c 8d 7b f0          	lea    -0x10(%rbx),%r15
   2ad5e:	48 83 eb 30          	sub    $0x30,%rbx
   2ad62:	48 8b 40 08          	mov    0x8(%rax),%rax
   2ad66:	48 8b 0b             	mov    (%rbx),%rcx
   2ad69:	49 8b 37             	mov    (%r15),%rsi
   2ad6c:	49 8b 57 08          	mov    0x8(%r15),%rdx
   2ad70:	48 89 bd 30 fe ff ff 	mov    %rdi,-0x1d0(%rbp)
   2ad77:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2ad7e:	83 7b 08 ff          	cmpl   $0xffffffff,0x8(%rbx)
   2ad82:	0f 85 aa 33 00 00    	jne    2e132 <JS_CallInternal+0x8e22>
   2ad88:	83 fa f8             	cmp    $0xfffffff8,%edx
   2ad8b:	0f 85 51 33 00 00    	jne    2e0e2 <JS_CallInternal+0x8dd2>
   2ad91:	49 8b 45 10          	mov    0x10(%r13),%rax
   2ad95:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2ad9c:	48 89 c7             	mov    %rax,%rdi
   2ad9f:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   2ada6:	e8 55 d4 fe ff       	call   18200 <js_get_atom_index>
   2adab:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2adb2:	89 c6                	mov    %eax,%esi
   2adb4:	48 8b 79 18          	mov    0x18(%rcx),%rdi
   2adb8:	8b 57 18             	mov    0x18(%rdi),%edx
   2adbb:	21 d0                	and    %edx,%eax
   2adbd:	8b 44 87 38          	mov    0x38(%rdi,%rax,4),%eax
   2adc1:	48 85 c0             	test   %rax,%rax
   2adc4:	0f 84 7f 3f 00 00    	je     2ed49 <JS_CallInternal+0x9a39>
   2adca:	4c 8d 0c 95 3c 00 00 	lea    0x3c(,%rdx,4),%r9
   2add1:	00 
   2add2:	48 83 e8 01          	sub    $0x1,%rax
   2add6:	49 8d 14 c1          	lea    (%r9,%rax,8),%rdx
   2adda:	48 01 fa             	add    %rdi,%rdx
   2addd:	3b 72 04             	cmp    0x4(%rdx),%esi
   2ade0:	0f 85 56 3f 00 00    	jne    2ed3c <JS_CallInternal+0x9a2c>
   2ade6:	48 8b b5 30 fe ff ff 	mov    -0x1d0(%rbp),%rsi
   2aded:	48 c1 e0 04          	shl    $0x4,%rax
   2adf1:	48 03 41 20          	add    0x20(%rcx),%rax
   2adf5:	48 8b 08             	mov    (%rax),%rcx
   2adf8:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2adfc:	48 89 30             	mov    %rsi,(%rax)
   2adff:	48 8b b5 10 fe ff ff 	mov    -0x1f0(%rbp),%rsi
   2ae06:	48 89 70 08          	mov    %rsi,0x8(%rax)
   2ae0a:	83 fa f6             	cmp    $0xfffffff6,%edx
   2ae0d:	76 11                	jbe    2ae20 <JS_CallInternal+0x5b10>
   2ae0f:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2ae12:	83 e8 01             	sub    $0x1,%eax
   2ae15:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2ae18:	85 c0                	test   %eax,%eax
   2ae1a:	0f 8e ae 32 00 00    	jle    2e0ce <JS_CallInternal+0x8dbe>
   2ae20:	48 8b 43 08          	mov    0x8(%rbx),%rax
   2ae24:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2ae27:	0f 87 43 19 00 00    	ja     2c770 <JS_CallInternal+0x7460>
   2ae2d:	49 8b 47 08          	mov    0x8(%r15),%rax
   2ae31:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2ae34:	76 14                	jbe    2ae4a <JS_CallInternal+0x5b3a>
   2ae36:	49 8b 17             	mov    (%r15),%rdx
   2ae39:	8b 4a fc             	mov    -0x4(%rdx),%ecx
   2ae3c:	83 e9 01             	sub    $0x1,%ecx
   2ae3f:	89 4a fc             	mov    %ecx,-0x4(%rdx)
   2ae42:	85 c9                	test   %ecx,%ecx
   2ae44:	0f 8e b2 2f 00 00    	jle    2ddfc <JS_CallInternal+0x8aec>
   2ae4a:	41 0f b6 04 24       	movzbl (%r12),%eax
   2ae4f:	49 83 c4 01          	add    $0x1,%r12
   2ae53:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2ae57:	49 89 c2             	mov    %rax,%r10
   2ae5a:	b8 01 00 00 00       	mov    $0x1,%eax
   2ae5f:	ff e2                	jmp    *%rdx
   2ae61:	f3 0f 1e fa          	endbr64
   2ae65:	48 8d 43 e0          	lea    -0x20(%rbx),%rax
   2ae69:	4c 8d 7b f0          	lea    -0x10(%rbx),%r15
   2ae6d:	4c 8b 53 e0          	mov    -0x20(%rbx),%r10
   2ae71:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2ae75:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2ae7c:	4d 8b 4f 08          	mov    0x8(%r15),%r9
   2ae80:	83 7b e8 ff          	cmpl   $0xffffffff,-0x18(%rbx)
   2ae84:	0f 85 1d 32 00 00    	jne    2e0a7 <JS_CallInternal+0x8d97>
   2ae8a:	41 83 f9 f8          	cmp    $0xfffffff8,%r9d
   2ae8e:	0f 85 ed 31 00 00    	jne    2e081 <JS_CallInternal+0x8d71>
   2ae94:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ae98:	48 89 d6             	mov    %rdx,%rsi
   2ae9b:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   2aea2:	4c 89 8d f0 fd ff ff 	mov    %r9,-0x210(%rbp)
   2aea9:	48 89 bd 20 fe ff ff 	mov    %rdi,-0x1e0(%rbp)
   2aeb0:	48 89 95 10 fe ff ff 	mov    %rdx,-0x1f0(%rbp)
   2aeb7:	e8 44 d3 fe ff       	call   18200 <js_get_atom_index>
   2aebc:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   2aec3:	89 c7                	mov    %eax,%edi
   2aec5:	49 8b 72 18          	mov    0x18(%r10),%rsi
   2aec9:	8b 4e 18             	mov    0x18(%rsi),%ecx
   2aecc:	21 c8                	and    %ecx,%eax
   2aece:	8b 44 86 38          	mov    0x38(%rsi,%rax,4),%eax
   2aed2:	48 85 c0             	test   %rax,%rax
   2aed5:	0f 84 38 35 00 00    	je     2e413 <JS_CallInternal+0x9103>
   2aedb:	48 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%rdx
   2aee2:	4c 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%r9
   2aee9:	4c 8d 04 8d 3c 00 00 	lea    0x3c(,%rcx,4),%r8
   2aef0:	00 
   2aef1:	48 83 e8 01          	sub    $0x1,%rax
   2aef5:	49 8d 0c c0          	lea    (%r8,%rax,8),%rcx
   2aef9:	48 01 f1             	add    %rsi,%rcx
   2aefc:	3b 79 04             	cmp    0x4(%rcx),%edi
   2aeff:	0f 85 01 35 00 00    	jne    2e406 <JS_CallInternal+0x90f6>
   2af05:	48 c1 e0 04          	shl    $0x4,%rax
   2af09:	49 03 42 20          	add    0x20(%r10),%rax
   2af0d:	48 8b 08             	mov    (%rax),%rcx
   2af10:	48 8b 40 08          	mov    0x8(%rax),%rax
   2af14:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2af17:	76 04                	jbe    2af1d <JS_CallInternal+0x5c0d>
   2af19:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   2af1d:	41 89 c0             	mov    %eax,%r8d
   2af20:	41 83 f9 f6          	cmp    $0xfffffff6,%r9d
   2af24:	76 11                	jbe    2af37 <JS_CallInternal+0x5c27>
   2af26:	8b 72 fc             	mov    -0x4(%rdx),%esi
   2af29:	83 ee 01             	sub    $0x1,%esi
   2af2c:	89 72 fc             	mov    %esi,-0x4(%rdx)
   2af2f:	85 f6                	test   %esi,%esi
   2af31:	0f 8e 84 2e 00 00    	jle    2ddbb <JS_CallInternal+0x8aab>
   2af37:	48 8b b5 30 fe ff ff 	mov    -0x1d0(%rbp),%rsi
   2af3e:	48 8b 76 08          	mov    0x8(%rsi),%rsi
   2af42:	83 fe f6             	cmp    $0xfffffff6,%esi
   2af45:	76 1b                	jbe    2af62 <JS_CallInternal+0x5c52>
   2af47:	48 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%rdx
   2af4e:	48 8b 3a             	mov    (%rdx),%rdi
   2af51:	8b 57 fc             	mov    -0x4(%rdi),%edx
   2af54:	83 ea 01             	sub    $0x1,%edx
   2af57:	89 57 fc             	mov    %edx,-0x4(%rdi)
   2af5a:	85 d2                	test   %edx,%edx
   2af5c:	0f 8e 24 28 00 00    	jle    2d786 <JS_CallInternal+0x8476>
   2af62:	48 89 4b e0          	mov    %rcx,-0x20(%rbx)
   2af66:	48 89 43 e8          	mov    %rax,-0x18(%rbx)
   2af6a:	41 83 f8 06          	cmp    $0x6,%r8d
   2af6e:	0f 84 f5 34 00 00    	je     2e469 <JS_CallInternal+0x9159>
   2af74:	41 0f b6 04 24       	movzbl (%r12),%eax
   2af79:	4c 89 fb             	mov    %r15,%rbx
   2af7c:	49 83 c4 01          	add    $0x1,%r12
   2af80:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2af84:	49 89 c2             	mov    %rax,%r10
   2af87:	b8 01 00 00 00       	mov    $0x1,%eax
   2af8c:	ff e2                	jmp    *%rdx
   2af8e:	f3 0f 1e fa          	endbr64
   2af92:	41 0f b6 3c 24       	movzbl (%r12),%edi
   2af97:	48 8b 8d b8 fe ff ff 	mov    -0x148(%rbp),%rcx
   2af9e:	4d 8d 7c 24 01       	lea    0x1(%r12),%r15
   2afa3:	45 31 c9             	xor    %r9d,%r9d
   2afa6:	89 fa                	mov    %edi,%edx
   2afa8:	89 f8                	mov    %edi,%eax
   2afaa:	4c 89 79 30          	mov    %r15,0x30(%rcx)
   2afae:	c1 fa 02             	sar    $0x2,%edx
   2afb1:	83 e0 03             	and    $0x3,%eax
   2afb4:	83 e2 07             	and    $0x7,%edx
   2afb7:	f7 d0                	not    %eax
   2afb9:	f7 d2                	not    %edx
   2afbb:	48 98                	cltq
   2afbd:	48 63 d2             	movslq %edx,%rdx
   2afc0:	48 c1 e0 04          	shl    $0x4,%rax
   2afc4:	48 c1 e2 04          	shl    $0x4,%rdx
   2afc8:	48 01 d8             	add    %rbx,%rax
   2afcb:	48 01 da             	add    %rbx,%rdx
   2afce:	48 8b 30             	mov    (%rax),%rsi
   2afd1:	48 8b 0a             	mov    (%rdx),%rcx
   2afd4:	4c 8b 42 08          	mov    0x8(%rdx),%r8
   2afd8:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2afdc:	89 f8                	mov    %edi,%eax
   2afde:	4c 89 ef             	mov    %r13,%rdi
   2afe1:	c1 f8 05             	sar    $0x5,%eax
   2afe4:	f7 d0                	not    %eax
   2afe6:	48 98                	cltq
   2afe8:	48 c1 e0 04          	shl    $0x4,%rax
   2afec:	ff 74 03 08          	push   0x8(%rbx,%rax,1)
   2aff0:	ff 34 03             	push   (%rbx,%rax,1)
   2aff3:	e8 88 90 06 00       	call   94080 <JS_CopyDataProperties>
   2aff8:	59                   	pop    %rcx
   2aff9:	5e                   	pop    %rsi
   2affa:	85 c0                	test   %eax,%eax
   2affc:	0f 85 4e aa ff ff    	jne    25a50 <JS_CallInternal+0x740>
   2b002:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
   2b008:	49 83 c4 02          	add    $0x2,%r12
   2b00c:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2b010:	49 89 c2             	mov    %rax,%r10
   2b013:	b8 01 00 00 00       	mov    $0x1,%eax
   2b018:	ff e2                	jmp    *%rdx
   2b01a:	f3 0f 1e fa          	endbr64
   2b01e:	49 0f bf 04 24       	movswq (%r12),%rax
   2b023:	4d 8d 3c 04          	lea    (%r12,%rax,1),%r15
   2b027:	41 8b 85 a8 01 00 00 	mov    0x1a8(%r13),%eax
   2b02e:	83 e8 01             	sub    $0x1,%eax
   2b031:	41 89 85 a8 01 00 00 	mov    %eax,0x1a8(%r13)
   2b038:	85 c0                	test   %eax,%eax
   2b03a:	0f 8e 7d 32 00 00    	jle    2e2bd <JS_CallInternal+0x8fad>
   2b040:	41 0f b6 07          	movzbl (%r15),%eax
   2b044:	4d 8d 67 01          	lea    0x1(%r15),%r12
   2b048:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2b04c:	49 89 c2             	mov    %rax,%r10
   2b04f:	b8 01 00 00 00       	mov    $0x1,%eax
   2b054:	ff e2                	jmp    *%rdx
   2b056:	f3 0f 1e fa          	endbr64
   2b05a:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2b05e:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2b062:	4c 89 ef             	mov    %r13,%rdi
   2b065:	4d 89 e7             	mov    %r12,%r15
   2b068:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2b06f:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2b073:	e8 d8 4d 04 00       	call   6fe50 <build_for_in_iterator>
   2b078:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2b07c:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2b080:	83 7b f8 06          	cmpl   $0x6,-0x8(%rbx)
   2b084:	0f 84 c6 a9 ff ff    	je     25a50 <JS_CallInternal+0x740>
   2b08a:	41 0f b6 04 24       	movzbl (%r12),%eax
   2b08f:	49 83 c4 01          	add    $0x1,%r12
   2b093:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2b097:	49 89 c2             	mov    %rax,%r10
   2b09a:	b8 01 00 00 00       	mov    $0x1,%eax
   2b09f:	ff e2                	jmp    *%rdx
   2b0a1:	f3 0f 1e fa          	endbr64
   2b0a5:	45 8b 0c 24          	mov    (%r12),%r9d
   2b0a9:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2b0ad:	4d 8d 7c 24 04       	lea    0x4(%r12),%r15
   2b0b2:	4c 8b 53 f0          	mov    -0x10(%rbx),%r10
   2b0b6:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2b0bd:	4d 01 e1             	add    %r12,%r9
   2b0c0:	83 f8 ff             	cmp    $0xffffffff,%eax
   2b0c3:	0f 85 a3 32 00 00    	jne    2e36c <JS_CallInternal+0x905c>
   2b0c9:	41 0f b7 42 12       	movzwl 0x12(%r10),%eax
   2b0ce:	4d 8b 5a 18          	mov    0x18(%r10),%r11
   2b0d2:	66 89 85 10 fe ff ff 	mov    %ax,-0x1f0(%rbp)
   2b0d9:	66 83 f8 01          	cmp    $0x1,%ax
   2b0dd:	0f 84 76 1e 00 00    	je     2cf59 <JS_CallInternal+0x7c49>
   2b0e3:	41 8b 49 14          	mov    0x14(%r9),%ecx
   2b0e7:	4c 89 da             	mov    %r11,%rdx
   2b0ea:	4c 89 d7             	mov    %r10,%rdi
   2b0ed:	0f 1f 00             	nopl   (%rax)
   2b0f0:	8b 72 18             	mov    0x18(%rdx),%esi
   2b0f3:	89 f0                	mov    %esi,%eax
   2b0f5:	21 c8                	and    %ecx,%eax
   2b0f7:	8b 44 82 38          	mov    0x38(%rdx,%rax,4),%eax
   2b0fb:	48 85 c0             	test   %rax,%rax
   2b0fe:	0f 84 c9 0a 00 00    	je     2bbcd <JS_CallInternal+0x68bd>
   2b104:	4c 8d 04 b5 3c 00 00 	lea    0x3c(,%rsi,4),%r8
   2b10b:	00 
   2b10c:	48 83 e8 01          	sub    $0x1,%rax
   2b110:	49 8d 34 c0          	lea    (%r8,%rax,8),%rsi
   2b114:	48 01 d6             	add    %rdx,%rsi
   2b117:	39 4e 04             	cmp    %ecx,0x4(%rsi)
   2b11a:	0f 85 a0 0a 00 00    	jne    2bbc0 <JS_CallInternal+0x68b0>
   2b120:	4c 8b 47 20          	mov    0x20(%rdi),%r8
   2b124:	80 7e 03 3f          	cmpb   $0x3f,0x3(%rsi)
   2b128:	0f 87 68 11 00 00    	ja     2c296 <JS_CallInternal+0x6f86>
   2b12e:	48 c1 e0 04          	shl    $0x4,%rax
   2b132:	49 01 c0             	add    %rax,%r8
   2b135:	48 89 c6             	mov    %rax,%rsi
   2b138:	49 8b 40 08          	mov    0x8(%r8),%rax
   2b13c:	49 8b 08             	mov    (%r8),%rcx
   2b13f:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2b142:	76 04                	jbe    2b148 <JS_CallInternal+0x5e38>
   2b144:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   2b148:	49 89 cf             	mov    %rcx,%r15
   2b14b:	49 39 fa             	cmp    %rdi,%r10
   2b14e:	0f 84 68 41 00 00    	je     2f2bc <JS_CallInternal+0x9fac>
   2b154:	49 39 7b 30          	cmp    %rdi,0x30(%r11)
   2b158:	0f 84 6b 4b 00 00    	je     2fcc9 <JS_CallInternal+0xa9b9>
   2b15e:	4c 89 3b             	mov    %r15,(%rbx)
   2b161:	49 83 c4 05          	add    $0x5,%r12
   2b165:	48 83 c3 10          	add    $0x10,%rbx
   2b169:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2b16d:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2b173:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2b177:	49 89 c2             	mov    %rax,%r10
   2b17a:	b8 01 00 00 00       	mov    $0x1,%eax
   2b17f:	ff e2                	jmp    *%rdx
   2b181:	f3 0f 1e fa          	endbr64
   2b185:	41 8b 04 24          	mov    (%r12),%eax
   2b189:	4c 8b 5b f8          	mov    -0x8(%rbx),%r11
   2b18d:	4d 8d 7c 24 04       	lea    0x4(%r12),%r15
   2b192:	4d 8d 14 04          	lea    (%r12,%rax,1),%r10
   2b196:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2b19a:	41 83 fb ff          	cmp    $0xffffffff,%r11d
   2b19e:	0f 85 bf 31 00 00    	jne    2e363 <JS_CallInternal+0x9053>
   2b1a4:	48 8b 78 18          	mov    0x18(%rax),%rdi
   2b1a8:	66 83 78 12 01       	cmpw   $0x1,0x12(%rax)
   2b1ad:	0f 84 26 1d 00 00    	je     2ced9 <JS_CallInternal+0x7bc9>
   2b1b3:	41 8b 4a 14          	mov    0x14(%r10),%ecx
   2b1b7:	49 89 c0             	mov    %rax,%r8
   2b1ba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   2b1c0:	8b 77 18             	mov    0x18(%rdi),%esi
   2b1c3:	89 f2                	mov    %esi,%edx
   2b1c5:	21 ca                	and    %ecx,%edx
   2b1c7:	8b 54 97 38          	mov    0x38(%rdi,%rdx,4),%edx
   2b1cb:	48 85 d2             	test   %rdx,%rdx
   2b1ce:	0f 84 27 0a 00 00    	je     2bbfb <JS_CallInternal+0x68eb>
   2b1d4:	4c 8d 0c b5 3c 00 00 	lea    0x3c(,%rsi,4),%r9
   2b1db:	00 
   2b1dc:	48 83 ea 01          	sub    $0x1,%rdx
   2b1e0:	49 8d 34 d1          	lea    (%r9,%rdx,8),%rsi
   2b1e4:	48 01 fe             	add    %rdi,%rsi
   2b1e7:	39 4e 04             	cmp    %ecx,0x4(%rsi)
   2b1ea:	0f 85 fd 09 00 00    	jne    2bbed <JS_CallInternal+0x68dd>
   2b1f0:	4d 8b 48 20          	mov    0x20(%r8),%r9
   2b1f4:	80 7e 03 3f          	cmpb   $0x3f,0x3(%rsi)
   2b1f8:	0f 87 4b 10 00 00    	ja     2c249 <JS_CallInternal+0x6f39>
   2b1fe:	48 c1 e2 04          	shl    $0x4,%rdx
   2b202:	49 01 d1             	add    %rdx,%r9
   2b205:	49 8b 49 08          	mov    0x8(%r9),%rcx
   2b209:	49 8b 31             	mov    (%r9),%rsi
   2b20c:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   2b20f:	76 04                	jbe    2b215 <JS_CallInternal+0x5f05>
   2b211:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2b215:	49 89 f7             	mov    %rsi,%r15
   2b218:	4c 39 c0             	cmp    %r8,%rax
   2b21b:	0f 84 d2 3f 00 00    	je     2f1f3 <JS_CallInternal+0x9ee3>
   2b221:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2b225:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2b228:	76 15                	jbe    2b23f <JS_CallInternal+0x5f2f>
   2b22a:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2b22e:	8b 56 fc             	mov    -0x4(%rsi),%edx
   2b231:	83 ea 01             	sub    $0x1,%edx
   2b234:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2b237:	85 d2                	test   %edx,%edx
   2b239:	0f 8e 62 29 00 00    	jle    2dba1 <JS_CallInternal+0x8891>
   2b23f:	4c 89 7b f0          	mov    %r15,-0x10(%rbx)
   2b243:	49 83 c4 05          	add    $0x5,%r12
   2b247:	48 89 4b f8          	mov    %rcx,-0x8(%rbx)
   2b24b:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2b251:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2b255:	49 89 c2             	mov    %rax,%r10
   2b258:	b8 01 00 00 00       	mov    $0x1,%eax
   2b25d:	ff e2                	jmp    *%rdx
   2b25f:	f3 0f 1e fa          	endbr64
   2b263:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2b267:	41 8b 0c 24          	mov    (%r12),%ecx
   2b26b:	4d 8d 7c 24 04       	lea    0x4(%r12),%r15
   2b270:	4c 8b 4b f0          	mov    -0x10(%rbx),%r9
   2b274:	83 f8 ff             	cmp    $0xffffffff,%eax
   2b277:	0f 85 30 0f 00 00    	jne    2c1ad <JS_CallInternal+0x6e9d>
   2b27d:	4d 89 c8             	mov    %r9,%r8
   2b280:	49 8b 78 18          	mov    0x18(%r8),%rdi
   2b284:	8b 77 18             	mov    0x18(%rdi),%esi
   2b287:	89 f2                	mov    %esi,%edx
   2b289:	21 ca                	and    %ecx,%edx
   2b28b:	8b 54 97 38          	mov    0x38(%rdi,%rdx,4),%edx
   2b28f:	48 85 d2             	test   %rdx,%rdx
   2b292:	0f 84 d1 08 00 00    	je     2bb69 <JS_CallInternal+0x6859>
   2b298:	4c 8d 14 b5 3c 00 00 	lea    0x3c(,%rsi,4),%r10
   2b29f:	00 
   2b2a0:	48 83 ea 01          	sub    $0x1,%rdx
   2b2a4:	49 8d 34 d2          	lea    (%r10,%rdx,8),%rsi
   2b2a8:	48 01 fe             	add    %rdi,%rsi
   2b2ab:	3b 4e 04             	cmp    0x4(%rsi),%ecx
   2b2ae:	0f 85 a7 08 00 00    	jne    2bb5b <JS_CallInternal+0x684b>
   2b2b4:	49 8b 78 20          	mov    0x20(%r8),%rdi
   2b2b8:	80 7e 03 3f          	cmpb   $0x3f,0x3(%rsi)
   2b2bc:	0f 87 eb 0e 00 00    	ja     2c1ad <JS_CallInternal+0x6e9d>
   2b2c2:	48 c1 e2 04          	shl    $0x4,%rdx
   2b2c6:	48 01 d7             	add    %rdx,%rdi
   2b2c9:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   2b2cd:	48 8b 07             	mov    (%rdi),%rax
   2b2d0:	83 fa f6             	cmp    $0xfffffff6,%edx
   2b2d3:	76 04                	jbe    2b2d9 <JS_CallInternal+0x5fc9>
   2b2d5:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2b2d9:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2b2dd:	49 83 c4 05          	add    $0x5,%r12
   2b2e1:	48 83 c3 10          	add    $0x10,%rbx
   2b2e5:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2b2e9:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2b2ef:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2b2f3:	49 89 c2             	mov    %rax,%r10
   2b2f6:	b8 01 00 00 00       	mov    $0x1,%eax
   2b2fb:	ff e2                	jmp    *%rdx
   2b2fd:	f3 0f 1e fa          	endbr64
   2b301:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2b305:	41 8b 0c 24          	mov    (%r12),%ecx
   2b309:	4d 8d 7c 24 04       	lea    0x4(%r12),%r15
   2b30e:	4c 8b 4b f0          	mov    -0x10(%rbx),%r9
   2b312:	83 f8 ff             	cmp    $0xffffffff,%eax
   2b315:	0f 85 44 0e 00 00    	jne    2c15f <JS_CallInternal+0x6e4f>
   2b31b:	4d 89 c8             	mov    %r9,%r8
   2b31e:	66 90                	xchg   %ax,%ax
   2b320:	49 8b 78 18          	mov    0x18(%r8),%rdi
   2b324:	8b 77 18             	mov    0x18(%rdi),%esi
   2b327:	89 f2                	mov    %esi,%edx
   2b329:	21 ca                	and    %ecx,%edx
   2b32b:	8b 54 97 38          	mov    0x38(%rdi,%rdx,4),%edx
   2b32f:	48 85 d2             	test   %rdx,%rdx
   2b332:	0f 84 63 08 00 00    	je     2bb9b <JS_CallInternal+0x688b>
   2b338:	4c 8d 14 b5 3c 00 00 	lea    0x3c(,%rsi,4),%r10
   2b33f:	00 
   2b340:	48 83 ea 01          	sub    $0x1,%rdx
   2b344:	49 8d 34 d2          	lea    (%r10,%rdx,8),%rsi
   2b348:	48 01 fe             	add    %rdi,%rsi
   2b34b:	39 4e 04             	cmp    %ecx,0x4(%rsi)
   2b34e:	0f 85 39 08 00 00    	jne    2bb8d <JS_CallInternal+0x687d>
   2b354:	49 8b 78 20          	mov    0x20(%r8),%rdi
   2b358:	80 7e 03 3f          	cmpb   $0x3f,0x3(%rsi)
   2b35c:	0f 87 fd 0d 00 00    	ja     2c15f <JS_CallInternal+0x6e4f>
   2b362:	48 c1 e2 04          	shl    $0x4,%rdx
   2b366:	48 01 d7             	add    %rdx,%rdi
   2b369:	48 8b 47 08          	mov    0x8(%rdi),%rax
   2b36d:	4c 8b 3f             	mov    (%rdi),%r15
   2b370:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2b373:	76 05                	jbe    2b37a <JS_CallInternal+0x606a>
   2b375:	41 83 47 fc 01       	addl   $0x1,-0x4(%r15)
   2b37a:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   2b37e:	83 fe f6             	cmp    $0xfffffff6,%esi
   2b381:	76 15                	jbe    2b398 <JS_CallInternal+0x6088>
   2b383:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2b387:	8b 51 fc             	mov    -0x4(%rcx),%edx
   2b38a:	83 ea 01             	sub    $0x1,%edx
   2b38d:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2b390:	85 d2                	test   %edx,%edx
   2b392:	0f 8e 9a 28 00 00    	jle    2dc32 <JS_CallInternal+0x8922>
   2b398:	4c 89 7b f0          	mov    %r15,-0x10(%rbx)
   2b39c:	49 83 c4 05          	add    $0x5,%r12
   2b3a0:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2b3a4:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2b3aa:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2b3ae:	49 89 c2             	mov    %rax,%r10
   2b3b1:	b8 01 00 00 00       	mov    $0x1,%eax
   2b3b6:	ff e2                	jmp    *%rdx
   2b3b8:	f3 0f 1e fa          	endbr64
   2b3bc:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2b3c0:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   2b3c4:	83 f9 ff             	cmp    $0xffffffff,%ecx
   2b3c7:	0f 85 d9 0c 00 00    	jne    2c0a6 <JS_CallInternal+0x6d96>
   2b3cd:	48 89 fe             	mov    %rdi,%rsi
   2b3d0:	4c 8b 46 18          	mov    0x18(%rsi),%r8
   2b3d4:	41 8b 50 18          	mov    0x18(%r8),%edx
   2b3d8:	89 d0                	mov    %edx,%eax
   2b3da:	83 e0 32             	and    $0x32,%eax
   2b3dd:	41 8b 44 80 38       	mov    0x38(%r8,%rax,4),%eax
   2b3e2:	48 85 c0             	test   %rax,%rax
   2b3e5:	0f 84 4c 07 00 00    	je     2bb37 <JS_CallInternal+0x6827>
   2b3eb:	4c 8d 0c 95 3c 00 00 	lea    0x3c(,%rdx,4),%r9
   2b3f2:	00 
   2b3f3:	48 83 e8 01          	sub    $0x1,%rax
   2b3f7:	49 8d 14 c1          	lea    (%r9,%rax,8),%rdx
   2b3fb:	4c 01 c2             	add    %r8,%rdx
   2b3fe:	83 7a 04 32          	cmpl   $0x32,0x4(%rdx)
   2b402:	0f 85 22 07 00 00    	jne    2bb2a <JS_CallInternal+0x681a>
   2b408:	48 8b 76 20          	mov    0x20(%rsi),%rsi
   2b40c:	80 7a 03 3f          	cmpb   $0x3f,0x3(%rdx)
   2b410:	0f 87 90 0c 00 00    	ja     2c0a6 <JS_CallInternal+0x6d96>
   2b416:	48 c1 e0 04          	shl    $0x4,%rax
   2b41a:	48 01 c6             	add    %rax,%rsi
   2b41d:	48 8b 46 08          	mov    0x8(%rsi),%rax
   2b421:	4c 8b 3e             	mov    (%rsi),%r15
   2b424:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2b427:	76 05                	jbe    2b42e <JS_CallInternal+0x611e>
   2b429:	41 83 47 fc 01       	addl   $0x1,-0x4(%r15)
   2b42e:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   2b432:	83 fe f6             	cmp    $0xfffffff6,%esi
   2b435:	76 15                	jbe    2b44c <JS_CallInternal+0x613c>
   2b437:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2b43b:	8b 51 fc             	mov    -0x4(%rcx),%edx
   2b43e:	83 ea 01             	sub    $0x1,%edx
   2b441:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2b444:	85 d2                	test   %edx,%edx
   2b446:	0f 8e 33 27 00 00    	jle    2db7f <JS_CallInternal+0x886f>
   2b44c:	4c 89 7b f0          	mov    %r15,-0x10(%rbx)
   2b450:	49 83 c4 01          	add    $0x1,%r12
   2b454:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2b458:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2b45e:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2b462:	49 89 c2             	mov    %rax,%r10
   2b465:	b8 01 00 00 00       	mov    $0x1,%eax
   2b46a:	ff e2                	jmp    *%rdx
   2b46c:	f3 0f 1e fa          	endbr64
   2b470:	48 83 ec 08          	sub    $0x8,%rsp
   2b474:	41 8b 0c 24          	mov    (%r12),%ecx
   2b478:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   2b47c:	4c 89 ef             	mov    %r13,%rdi
   2b47f:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2b483:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2b487:	4d 8d 7c 24 04       	lea    0x4(%r12),%r15
   2b48c:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   2b490:	68 07 40 00 00       	push   $0x4007
   2b495:	e8 c6 7d 00 00       	call   33260 <JS_DefinePropertyValue>
   2b49a:	5a                   	pop    %rdx
   2b49b:	59                   	pop    %rcx
   2b49c:	85 c0                	test   %eax,%eax
   2b49e:	0f 88 34 31 00 00    	js     2e5d8 <JS_CallInternal+0x92c8>
   2b4a4:	41 0f b6 44 24 04    	movzbl 0x4(%r12),%eax
   2b4aa:	48 83 eb 10          	sub    $0x10,%rbx
   2b4ae:	49 83 c4 05          	add    $0x5,%r12
   2b4b2:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2b4b6:	49 89 c2             	mov    %rax,%r10
   2b4b9:	b8 01 00 00 00       	mov    $0x1,%eax
   2b4be:	ff e2                	jmp    *%rdx
   2b4c0:	f3 0f 1e fa          	endbr64
   2b4c4:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2b4c8:	48 8d 43 e0          	lea    -0x20(%rbx),%rax
   2b4cc:	4c 8b 7b d0          	mov    -0x30(%rbx),%r15
   2b4d0:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2b4d7:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   2b4db:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   2b4e2:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2b4e6:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   2b4ea:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2b4f1:	83 7b d8 ff          	cmpl   $0xffffffff,-0x28(%rbx)
   2b4f5:	0f 85 e2 36 00 00    	jne    2ebdd <JS_CallInternal+0x98cd>
   2b4fb:	83 f8 f8             	cmp    $0xfffffff8,%eax
   2b4fe:	0f 85 54 35 00 00    	jne    2ea58 <JS_CallInternal+0x9748>
   2b504:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2b508:	e8 f3 cc fe ff       	call   18200 <js_get_atom_index>
   2b50d:	49 8b 4f 18          	mov    0x18(%r15),%rcx
   2b511:	89 c6                	mov    %eax,%esi
   2b513:	8b 41 18             	mov    0x18(%rcx),%eax
   2b516:	89 f2                	mov    %esi,%edx
   2b518:	21 c2                	and    %eax,%edx
   2b51a:	8b 54 91 38          	mov    0x38(%rcx,%rdx,4),%edx
   2b51e:	48 85 d2             	test   %rdx,%rdx
   2b521:	0f 84 d2 0a 00 00    	je     2bff9 <JS_CallInternal+0x6ce9>
   2b527:	48 8d 3c 85 3c 00 00 	lea    0x3c(,%rax,4),%rdi
   2b52e:	00 
   2b52f:	48 8d 44 d7 f8       	lea    -0x8(%rdi,%rdx,8),%rax
   2b534:	48 01 c8             	add    %rcx,%rax
   2b537:	3b 70 04             	cmp    0x4(%rax),%esi
   2b53a:	0f 85 ab 0a 00 00    	jne    2bfeb <JS_CallInternal+0x6cdb>
   2b540:	48 8d 0d fd db 0a 00 	lea    0xadbfd(%rip),%rcx        # d9144 <_IO_stdin_used+0x144>
   2b547:	4c 89 ef             	mov    %r13,%rdi
   2b54a:	31 c0                	xor    %eax,%eax
   2b54c:	4d 89 e7             	mov    %r12,%r15
   2b54f:	48 8d 15 02 19 0b 00 	lea    0xb1902(%rip),%rdx        # dce58 <_IO_stdin_used+0x3e58>
   2b556:	e8 45 8e 00 00       	call   343a0 <__JS_ThrowTypeErrorAtom>
   2b55b:	83 bd 00 fe ff ff f6 	cmpl   $0xfffffff6,-0x200(%rbp)
   2b562:	76 1e                	jbe    2b582 <JS_CallInternal+0x6272>
   2b564:	48 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%rbx
   2b56b:	8b 43 fc             	mov    -0x4(%rbx),%eax
   2b56e:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   2b574:	83 e8 01             	sub    $0x1,%eax
   2b577:	89 43 fc             	mov    %eax,-0x4(%rbx)
   2b57a:	85 c0                	test   %eax,%eax
   2b57c:	0f 8e da 48 00 00    	jle    2fe5c <JS_CallInternal+0xab4c>
   2b582:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   2b589:	48 8b 43 08          	mov    0x8(%rbx),%rax
   2b58d:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2b590:	0f 86 ba a4 ff ff    	jbe    25a50 <JS_CallInternal+0x740>
   2b596:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   2b59d:	48 8b 0b             	mov    (%rbx),%rcx
   2b5a0:	8b 71 fc             	mov    -0x4(%rcx),%esi
   2b5a3:	8d 56 ff             	lea    -0x1(%rsi),%edx
   2b5a6:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2b5a9:	85 d2                	test   %edx,%edx
   2b5ab:	0f 8f 9f a4 ff ff    	jg     25a50 <JS_CallInternal+0x740>
   2b5b1:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2b5b5:	48 89 c2             	mov    %rax,%rdx
   2b5b8:	48 89 ce             	mov    %rcx,%rsi
   2b5bb:	e8 b0 32 ff ff       	call   1e870 <__JS_FreeValueRT>
   2b5c0:	e9 8b a4 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2b5c5:	0f 1f 00             	nopl   (%rax)
   2b5c8:	f3 0f 1e fa          	endbr64
   2b5cc:	41 8b 34 24          	mov    (%r12),%esi
   2b5d0:	4c 89 ef             	mov    %r13,%rdi
   2b5d3:	4d 8d 7c 24 04       	lea    0x4(%r12),%r15
   2b5d8:	e8 a3 b2 00 00       	call   36880 <JS_NewSymbolFromAtom.constprop.0>
   2b5dd:	83 fa 06             	cmp    $0x6,%edx
   2b5e0:	0f 84 6a a4 ff ff    	je     25a50 <JS_CallInternal+0x740>
   2b5e6:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2b5ea:	49 83 c4 05          	add    $0x5,%r12
   2b5ee:	48 83 c3 10          	add    $0x10,%rbx
   2b5f2:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2b5f6:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2b5fc:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2b600:	49 89 c2             	mov    %rax,%r10
   2b603:	b8 01 00 00 00       	mov    $0x1,%eax
   2b608:	ff e2                	jmp    *%rdx
   2b60a:	f3 0f 1e fa          	endbr64
   2b60e:	4c 8b 5b e8          	mov    -0x18(%rbx),%r11
   2b612:	41 8b 0c 24          	mov    (%r12),%ecx
   2b616:	4d 8d 7c 24 04       	lea    0x4(%r12),%r15
   2b61b:	4c 8b 53 e0          	mov    -0x20(%rbx),%r10
   2b61f:	41 83 fb ff          	cmp    $0xffffffff,%r11d
   2b623:	0f 85 45 17 00 00    	jne    2cd6e <JS_CallInternal+0x7a5e>
   2b629:	49 8b 72 18          	mov    0x18(%r10),%rsi
   2b62d:	8b 46 18             	mov    0x18(%rsi),%eax
   2b630:	89 c2                	mov    %eax,%edx
   2b632:	21 ca                	and    %ecx,%edx
   2b634:	8b 54 96 38          	mov    0x38(%rsi,%rdx,4),%edx
   2b638:	48 85 d2             	test   %rdx,%rdx
   2b63b:	0f 84 2d 17 00 00    	je     2cd6e <JS_CallInternal+0x7a5e>
   2b641:	48 8d 3c 85 3c 00 00 	lea    0x3c(,%rax,4),%rdi
   2b648:	00 
   2b649:	48 83 ea 01          	sub    $0x1,%rdx
   2b64d:	48 8d 04 d7          	lea    (%rdi,%rdx,8),%rax
   2b651:	48 01 f0             	add    %rsi,%rax
   2b654:	3b 48 04             	cmp    0x4(%rax),%ecx
   2b657:	0f 85 03 17 00 00    	jne    2cd60 <JS_CallInternal+0x7a50>
   2b65d:	0f b6 40 03          	movzbl 0x3(%rax),%eax
   2b661:	49 8b 72 20          	mov    0x20(%r10),%rsi
   2b665:	c0 e8 02             	shr    $0x2,%al
   2b668:	83 e0 3a             	and    $0x3a,%eax
   2b66b:	3c 02                	cmp    $0x2,%al
   2b66d:	0f 85 fb 16 00 00    	jne    2cd6e <JS_CallInternal+0x7a5e>
   2b673:	48 c1 e2 04          	shl    $0x4,%rdx
   2b677:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2b67c:	48 8d 04 16          	lea    (%rsi,%rdx,1),%rax
   2b680:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2b684:	48 8b 08             	mov    (%rax),%rcx
   2b687:	0f 11 00             	movups %xmm0,(%rax)
   2b68a:	83 fa f6             	cmp    $0xfffffff6,%edx
   2b68d:	76 11                	jbe    2b6a0 <JS_CallInternal+0x6390>
   2b68f:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2b692:	83 e8 01             	sub    $0x1,%eax
   2b695:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2b698:	85 c0                	test   %eax,%eax
   2b69a:	0f 8e 70 38 00 00    	jle    2ef10 <JS_CallInternal+0x9c00>
   2b6a0:	41 83 fb f6          	cmp    $0xfffffff6,%r11d
   2b6a4:	76 13                	jbe    2b6b9 <JS_CallInternal+0x63a9>
   2b6a6:	41 8b 42 fc          	mov    -0x4(%r10),%eax
   2b6aa:	83 e8 01             	sub    $0x1,%eax
   2b6ad:	41 89 42 fc          	mov    %eax,-0x4(%r10)
   2b6b1:	85 c0                	test   %eax,%eax
   2b6b3:	0f 8e 67 36 00 00    	jle    2ed20 <JS_CallInternal+0x9a10>
   2b6b9:	48 83 eb 20          	sub    $0x20,%rbx
   2b6bd:	41 0f b6 44 24 04    	movzbl 0x4(%r12),%eax
   2b6c3:	49 83 c4 05          	add    $0x5,%r12
   2b6c7:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2b6cb:	49 89 c2             	mov    %rax,%r10
   2b6ce:	b8 01 00 00 00       	mov    $0x1,%eax
   2b6d3:	ff e2                	jmp    *%rdx
   2b6d5:	f3 0f 1e fa          	endbr64
   2b6d9:	4c 8d 7b f0          	lea    -0x10(%rbx),%r15
   2b6dd:	48 8b 4b c0          	mov    -0x40(%rbx),%rcx
   2b6e1:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   2b6e5:	4c 89 ef             	mov    %r13,%rdi
   2b6e8:	48 8b 53 d8          	mov    -0x28(%rbx),%rdx
   2b6ec:	4c 8b 43 c8          	mov    -0x38(%rbx),%r8
   2b6f0:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   2b6f6:	48 c7 85 d0 fd ff ff 	movq   $0x0,-0x230(%rbp)
   2b6fd:	00 00 00 00 
   2b701:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2b708:	48 c7 85 d8 fd ff ff 	movq   $0x3,-0x228(%rbp)
   2b70f:	03 00 00 00 
   2b713:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2b717:	6a 02                	push   $0x2
   2b719:	41 57                	push   %r15
   2b71b:	ff b5 d8 fd ff ff    	push   -0x228(%rbp)
   2b721:	ff b5 d0 fd ff ff    	push   -0x230(%rbp)
   2b727:	e8 e4 9b ff ff       	call   25310 <JS_CallInternal>
   2b72c:	48 83 c4 20          	add    $0x20,%rsp
   2b730:	48 89 c1             	mov    %rax,%rcx
   2b733:	48 89 d0             	mov    %rdx,%rax
   2b736:	83 fa 06             	cmp    $0x6,%edx
   2b739:	0f 84 06 2a 00 00    	je     2e145 <JS_CallInternal+0x8e35>
   2b73f:	49 8b 77 08          	mov    0x8(%r15),%rsi
   2b743:	83 fe f6             	cmp    $0xfffffff6,%esi
   2b746:	76 15                	jbe    2b75d <JS_CallInternal+0x644d>
   2b748:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   2b74c:	8b 57 fc             	mov    -0x4(%rdi),%edx
   2b74f:	83 ea 01             	sub    $0x1,%edx
   2b752:	89 57 fc             	mov    %edx,-0x4(%rdi)
   2b755:	85 d2                	test   %edx,%edx
   2b757:	0f 8e 85 24 00 00    	jle    2dbe2 <JS_CallInternal+0x88d2>
   2b75d:	48 89 4b f0          	mov    %rcx,-0x10(%rbx)
   2b761:	49 83 c4 01          	add    $0x1,%r12
   2b765:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2b769:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2b76f:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2b773:	49 89 c2             	mov    %rax,%r10
   2b776:	b8 01 00 00 00       	mov    $0x1,%eax
   2b77b:	ff e2                	jmp    *%rdx
   2b77d:	f3 0f 1e fa          	endbr64
   2b781:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2b785:	48 8d 4b f0          	lea    -0x10(%rbx),%rcx
   2b789:	48 8b 5b f8          	mov    -0x8(%rbx),%rbx
   2b78d:	48 39 8d 48 fe ff ff 	cmp    %rcx,-0x1b8(%rbp)
   2b794:	0f 83 74 06 00 00    	jae    2be0e <JS_CallInternal+0x6afe>
   2b79a:	48 89 d8             	mov    %rbx,%rax
   2b79d:	4c 89 a5 30 fe ff ff 	mov    %r12,-0x1d0(%rbp)
   2b7a4:	4c 89 eb             	mov    %r13,%rbx
   2b7a7:	49 89 cf             	mov    %rcx,%r15
   2b7aa:	4c 89 85 10 fe ff ff 	mov    %r8,-0x1f0(%rbp)
   2b7b1:	4c 8b a5 48 fe ff ff 	mov    -0x1b8(%rbp),%r12
   2b7b8:	49 89 c5             	mov    %rax,%r13
   2b7bb:	eb 0c                	jmp    2b7c9 <JS_CallInternal+0x64b9>
   2b7bd:	0f 1f 00             	nopl   (%rax)
   2b7c0:	4d 39 fc             	cmp    %r15,%r12
   2b7c3:	0f 83 2b 06 00 00    	jae    2bdf4 <JS_CallInternal+0x6ae4>
   2b7c9:	41 83 7f f8 05       	cmpl   $0x5,-0x8(%r15)
   2b7ce:	0f 84 20 06 00 00    	je     2bdf4 <JS_CallInternal+0x6ae4>
   2b7d4:	49 8b 47 f8          	mov    -0x8(%r15),%rax
   2b7d8:	49 83 ef 10          	sub    $0x10,%r15
   2b7dc:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2b7df:	76 df                	jbe    2b7c0 <JS_CallInternal+0x64b0>
   2b7e1:	49 8b 37             	mov    (%r15),%rsi
   2b7e4:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   2b7e7:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2b7ea:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2b7ed:	85 d2                	test   %edx,%edx
   2b7ef:	7f cf                	jg     2b7c0 <JS_CallInternal+0x64b0>
   2b7f1:	48 8b 7b 10          	mov    0x10(%rbx),%rdi
   2b7f5:	48 89 c2             	mov    %rax,%rdx
   2b7f8:	e8 73 30 ff ff       	call   1e870 <__JS_FreeValueRT>
   2b7fd:	eb c1                	jmp    2b7c0 <JS_CallInternal+0x64b0>
   2b7ff:	f3 0f 1e fa          	endbr64
   2b803:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2b80a:	4c 8b 7b f8          	mov    -0x8(%rbx),%r15
   2b80e:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2b812:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2b816:	41 83 ff ff          	cmp    $0xffffffff,%r15d
   2b81a:	0f 85 e0 42 00 00    	jne    2fb00 <JS_CallInternal+0xa7f0>
   2b820:	48 8d 8d dc fe ff ff 	lea    -0x124(%rbp),%rcx
   2b827:	4c 89 fa             	mov    %r15,%rdx
   2b82a:	48 89 c6             	mov    %rax,%rsi
   2b82d:	4c 89 ef             	mov    %r13,%rdi
   2b830:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2b837:	e8 a4 b4 05 00       	call   86ce0 <JS_IteratorGetCompleteValue>
   2b83c:	48 89 c1             	mov    %rax,%rcx
   2b83f:	48 89 d0             	mov    %rdx,%rax
   2b842:	83 fa 06             	cmp    $0x6,%edx
   2b845:	0f 84 de 27 00 00    	je     2e029 <JS_CallInternal+0x8d19>
   2b84b:	48 8b b5 30 fe ff ff 	mov    -0x1d0(%rbp),%rsi
   2b852:	8b 56 fc             	mov    -0x4(%rsi),%edx
   2b855:	83 ea 01             	sub    $0x1,%edx
   2b858:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2b85b:	85 d2                	test   %edx,%edx
   2b85d:	0f 8e 6f 27 00 00    	jle    2dfd2 <JS_CallInternal+0x8cc2>
   2b863:	44 8b 8d dc fe ff ff 	mov    -0x124(%rbp),%r9d
   2b86a:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2b86e:	31 c0                	xor    %eax,%eax
   2b870:	48 c7 43 e0 00 00 00 	movq   $0x0,-0x20(%rbx)
   2b877:	00 
   2b878:	45 85 c9             	test   %r9d,%r9d
   2b87b:	48 c7 43 e8 05 00 00 	movq   $0x5,-0x18(%rbx)
   2b882:	00 
   2b883:	0f 95 c0             	setne  %al
   2b886:	48 89 4b f0          	mov    %rcx,-0x10(%rbx)
   2b88a:	49 83 c4 01          	add    $0x1,%r12
   2b88e:	48 83 c3 10          	add    $0x10,%rbx
   2b892:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2b896:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   2b89d:	00 
   2b89e:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2b8a4:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2b8a8:	49 89 c2             	mov    %rax,%r10
   2b8ab:	b8 01 00 00 00       	mov    $0x1,%eax
   2b8b0:	ff e2                	jmp    *%rdx
   2b8b2:	f3 0f 1e fa          	endbr64
   2b8b6:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2b8bd:	ba 01 00 00 00       	mov    $0x1,%edx
   2b8c2:	48 89 de             	mov    %rbx,%rsi
   2b8c5:	4c 89 ef             	mov    %r13,%rdi
   2b8c8:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2b8cc:	e8 1f 42 07 00       	call   9faf0 <js_for_of_start>
   2b8d1:	85 c0                	test   %eax,%eax
   2b8d3:	0f 85 ee 44 00 00    	jne    2fdc7 <JS_CallInternal+0xaab7>
   2b8d9:	48 c7 43 10 00 00 00 	movq   $0x0,0x10(%rbx)
   2b8e0:	00 
   2b8e1:	49 83 c4 01          	add    $0x1,%r12
   2b8e5:	48 83 c3 20          	add    $0x20,%rbx
   2b8e9:	48 c7 43 f8 05 00 00 	movq   $0x5,-0x8(%rbx)
   2b8f0:	00 
   2b8f1:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2b8f7:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2b8fb:	49 89 c2             	mov    %rax,%r10
   2b8fe:	b8 01 00 00 00       	mov    $0x1,%eax
   2b903:	ff e2                	jmp    *%rdx
   2b905:	f3 0f 1e fa          	endbr64
   2b909:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2b910:	31 d2                	xor    %edx,%edx
   2b912:	48 89 de             	mov    %rbx,%rsi
   2b915:	4c 89 ef             	mov    %r13,%rdi
   2b918:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2b91c:	e8 cf 41 07 00       	call   9faf0 <js_for_of_start>
   2b921:	85 c0                	test   %eax,%eax
   2b923:	0f 85 9e 3c 00 00    	jne    2f5c7 <JS_CallInternal+0xa2b7>
   2b929:	48 c7 43 10 00 00 00 	movq   $0x0,0x10(%rbx)
   2b930:	00 
   2b931:	49 83 c4 01          	add    $0x1,%r12
   2b935:	48 83 c3 20          	add    $0x20,%rbx
   2b939:	48 c7 43 f8 05 00 00 	movq   $0x5,-0x8(%rbx)
   2b940:	00 
   2b941:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2b947:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2b94b:	49 89 c2             	mov    %rax,%r10
   2b94e:	b8 01 00 00 00       	mov    $0x1,%eax
   2b953:	ff e2                	jmp    *%rdx
   2b955:	f3 0f 1e fa          	endbr64
   2b959:	49 63 04 24          	movslq (%r12),%rax
   2b95d:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   2b964:	49 8d 54 24 04       	lea    0x4(%r12),%rdx
   2b969:	48 83 c3 10          	add    $0x10,%rbx
   2b96d:	2b 51 18             	sub    0x18(%rcx),%edx
   2b970:	4c 01 e0             	add    %r12,%rax
   2b973:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   2b97a:	00 
   2b97b:	48 89 53 f0          	mov    %rdx,-0x10(%rbx)
   2b97f:	4c 8d 60 01          	lea    0x1(%rax),%r12
   2b983:	0f b6 00             	movzbl (%rax),%eax
   2b986:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2b98a:	49 89 c2             	mov    %rax,%r10
   2b98d:	b8 01 00 00 00       	mov    $0x1,%eax
   2b992:	ff e2                	jmp    *%rdx
   2b994:	f3 0f 1e fa          	endbr64
   2b998:	41 0f b6 0c 24       	movzbl (%r12),%ecx
   2b99d:	41 ba fd ff ff ff    	mov    $0xfffffffd,%r10d
   2b9a3:	4d 8d 7c 24 01       	lea    0x1(%r12),%r15
   2b9a8:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2b9af:	c7 85 dc fe ff ff 01 	movl   $0x1,-0x124(%rbp)
   2b9b6:	00 00 00 
   2b9b9:	41 29 ca             	sub    %ecx,%r10d
   2b9bc:	4c 89 78 30          	mov    %r15,0x30(%rax)
   2b9c0:	4d 63 d2             	movslq %r10d,%r10
   2b9c3:	49 c1 e2 04          	shl    $0x4,%r10
   2b9c7:	49 01 da             	add    %rbx,%r10
   2b9ca:	49 8b 52 08          	mov    0x8(%r10),%rdx
   2b9ce:	83 fa 03             	cmp    $0x3,%edx
   2b9d1:	0f 84 0e 2f 00 00    	je     2e8e5 <JS_CallInternal+0x95d5>
   2b9d7:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
   2b9dc:	49 8b 32             	mov    (%r10),%rsi
   2b9df:	4c 89 ef             	mov    %r13,%rdi
   2b9e2:	4c 8d 8d dc fe ff ff 	lea    -0x124(%rbp),%r9
   2b9e9:	29 c8                	sub    %ecx,%eax
   2b9eb:	4c 89 95 30 fe ff ff 	mov    %r10,-0x1d0(%rbp)
   2b9f2:	48 98                	cltq
   2b9f4:	48 c1 e0 04          	shl    $0x4,%rax
   2b9f8:	48 01 d8             	add    %rbx,%rax
   2b9fb:	48 8b 08             	mov    (%rax),%rcx
   2b9fe:	4c 8b 40 08          	mov    0x8(%rax),%r8
   2ba02:	e8 59 58 07 00       	call   a1260 <JS_IteratorNext.constprop.0>
   2ba07:	4c 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%r10
   2ba0e:	48 89 c1             	mov    %rax,%rcx
   2ba11:	83 fa 06             	cmp    $0x6,%edx
   2ba14:	48 89 d0             	mov    %rdx,%rax
   2ba17:	48 89 d6             	mov    %rdx,%rsi
   2ba1a:	48 89 cf             	mov    %rcx,%rdi
   2ba1d:	0f 84 4b 2e 00 00    	je     2e86e <JS_CallInternal+0x955e>
   2ba23:	44 8b 85 dc fe ff ff 	mov    -0x124(%rbp),%r8d
   2ba2a:	31 d2                	xor    %edx,%edx
   2ba2c:	45 85 c0             	test   %r8d,%r8d
   2ba2f:	0f 85 98 19 00 00    	jne    2d3cd <JS_CallInternal+0x80bd>
   2ba35:	48 89 53 10          	mov    %rdx,0x10(%rbx)
   2ba39:	49 83 c4 02          	add    $0x2,%r12
   2ba3d:	48 83 c3 20          	add    $0x20,%rbx
   2ba41:	48 89 7b e0          	mov    %rdi,-0x20(%rbx)
   2ba45:	48 89 73 e8          	mov    %rsi,-0x18(%rbx)
   2ba49:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   2ba50:	00 
   2ba51:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2ba57:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2ba5b:	49 89 c2             	mov    %rax,%r10
   2ba5e:	b8 01 00 00 00       	mov    $0x1,%eax
   2ba63:	ff e2                	jmp    *%rdx
   2ba65:	f3 0f 1e fa          	endbr64
   2ba69:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2ba70:	48 89 de             	mov    %rbx,%rsi
   2ba73:	4c 89 ef             	mov    %r13,%rdi
   2ba76:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2ba7a:	e8 61 9f 05 00       	call   859e0 <js_for_in_next>
   2ba7f:	85 c0                	test   %eax,%eax
   2ba81:	0f 85 15 3b 00 00    	jne    2f59c <JS_CallInternal+0xa28c>
   2ba87:	41 0f b6 04 24       	movzbl (%r12),%eax
   2ba8c:	48 83 c3 20          	add    $0x20,%rbx
   2ba90:	49 83 c4 01          	add    $0x1,%r12
   2ba94:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2ba98:	49 89 c2             	mov    %rax,%r10
   2ba9b:	b8 01 00 00 00       	mov    $0x1,%eax
   2baa0:	ff e2                	jmp    *%rdx
   2baa2:	f3 0f 1e fa          	endbr64
   2baa6:	44 8b 5b f8          	mov    -0x8(%rbx),%r11d
   2baaa:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2baae:	45 85 db             	test   %r11d,%r11d
   2bab1:	0f 85 7c 19 00 00    	jne    2d433 <JS_CallInternal+0x8123>
   2bab7:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   2babe:	3b 41 20             	cmp    0x20(%rcx),%eax
   2bac1:	0f 83 6c 19 00 00    	jae    2d433 <JS_CallInternal+0x8123>
   2bac7:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   2bace:	89 c0                	mov    %eax,%eax
   2bad0:	48 83 eb 10          	sub    $0x10,%rbx
   2bad4:	48 03 41 18          	add    0x18(%rcx),%rax
   2bad8:	4c 8d 60 01          	lea    0x1(%rax),%r12
   2badc:	0f b6 00             	movzbl (%rax),%eax
   2badf:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2bae3:	49 89 c2             	mov    %rax,%r10
   2bae6:	b8 01 00 00 00       	mov    $0x1,%eax
   2baeb:	ff e2                	jmp    *%rdx
   2baed:	f3 0f 1e fa          	endbr64
   2baf1:	49 63 04 24          	movslq (%r12),%rax
   2baf5:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
   2bafc:	48 83 c3 10          	add    $0x10,%rbx
   2bb00:	4c 01 e0             	add    %r12,%rax
   2bb03:	2b 41 18             	sub    0x18(%rcx),%eax
   2bb06:	48 c7 43 f8 05 00 00 	movq   $0x5,-0x8(%rbx)
   2bb0d:	00 
   2bb0e:	49 83 c4 05          	add    $0x5,%r12
   2bb12:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2bb16:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2bb1c:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2bb20:	49 89 c2             	mov    %rax,%r10
   2bb23:	b8 01 00 00 00       	mov    $0x1,%eax
   2bb28:	ff e2                	jmp    *%rdx
   2bb2a:	8b 02                	mov    (%rdx),%eax
   2bb2c:	25 ff ff ff 03       	and    $0x3ffffff,%eax
   2bb31:	0f 85 bc f8 ff ff    	jne    2b3f3 <JS_CallInternal+0x60e3>
   2bb37:	f6 46 10 08          	testb  $0x8,0x10(%rsi)
   2bb3b:	0f 85 5b 05 00 00    	jne    2c09c <JS_CallInternal+0x6d8c>
   2bb41:	49 8b 70 30          	mov    0x30(%r8),%rsi
   2bb45:	48 85 f6             	test   %rsi,%rsi
   2bb48:	0f 85 82 f8 ff ff    	jne    2b3d0 <JS_CallInternal+0x60c0>
   2bb4e:	b8 03 00 00 00       	mov    $0x3,%eax
   2bb53:	45 31 ff             	xor    %r15d,%r15d
   2bb56:	e9 d3 f8 ff ff       	jmp    2b42e <JS_CallInternal+0x611e>
   2bb5b:	8b 16                	mov    (%rsi),%edx
   2bb5d:	81 e2 ff ff ff 03    	and    $0x3ffffff,%edx
   2bb63:	0f 85 37 f7 ff ff    	jne    2b2a0 <JS_CallInternal+0x5f90>
   2bb69:	41 f6 40 10 08       	testb  $0x8,0x10(%r8)
   2bb6e:	0f 85 2f 06 00 00    	jne    2c1a3 <JS_CallInternal+0x6e93>
   2bb74:	4c 8b 47 30          	mov    0x30(%rdi),%r8
   2bb78:	4d 85 c0             	test   %r8,%r8
   2bb7b:	0f 85 ff f6 ff ff    	jne    2b280 <JS_CallInternal+0x5f70>
   2bb81:	ba 03 00 00 00       	mov    $0x3,%edx
   2bb86:	31 c0                	xor    %eax,%eax
   2bb88:	e9 4c f7 ff ff       	jmp    2b2d9 <JS_CallInternal+0x5fc9>
   2bb8d:	8b 16                	mov    (%rsi),%edx
   2bb8f:	81 e2 ff ff ff 03    	and    $0x3ffffff,%edx
   2bb95:	0f 85 a5 f7 ff ff    	jne    2b340 <JS_CallInternal+0x6030>
   2bb9b:	41 f6 40 10 08       	testb  $0x8,0x10(%r8)
   2bba0:	0f 85 af 05 00 00    	jne    2c155 <JS_CallInternal+0x6e45>
   2bba6:	4c 8b 47 30          	mov    0x30(%rdi),%r8
   2bbaa:	4d 85 c0             	test   %r8,%r8
   2bbad:	0f 85 6d f7 ff ff    	jne    2b320 <JS_CallInternal+0x6010>
   2bbb3:	b8 03 00 00 00       	mov    $0x3,%eax
   2bbb8:	45 31 ff             	xor    %r15d,%r15d
   2bbbb:	e9 ba f7 ff ff       	jmp    2b37a <JS_CallInternal+0x606a>
   2bbc0:	8b 06                	mov    (%rsi),%eax
   2bbc2:	25 ff ff ff 03       	and    $0x3ffffff,%eax
   2bbc7:	0f 85 3f f5 ff ff    	jne    2b10c <JS_CallInternal+0x5dfc>
   2bbcd:	f6 47 10 08          	testb  $0x8,0x10(%rdi)
   2bbd1:	0f 85 b1 06 00 00    	jne    2c288 <JS_CallInternal+0x6f78>
   2bbd7:	48 8b 7a 30          	mov    0x30(%rdx),%rdi
   2bbdb:	48 85 ff             	test   %rdi,%rdi
   2bbde:	0f 84 70 1a 00 00    	je     2d654 <JS_CallInternal+0x8344>
   2bbe4:	48 8b 57 18          	mov    0x18(%rdi),%rdx
   2bbe8:	e9 03 f5 ff ff       	jmp    2b0f0 <JS_CallInternal+0x5de0>
   2bbed:	8b 16                	mov    (%rsi),%edx
   2bbef:	81 e2 ff ff ff 03    	and    $0x3ffffff,%edx
   2bbf5:	0f 85 e1 f5 ff ff    	jne    2b1dc <JS_CallInternal+0x5ecc>
   2bbfb:	41 f6 40 10 08       	testb  $0x8,0x10(%r8)
   2bc00:	0f 85 39 06 00 00    	jne    2c23f <JS_CallInternal+0x6f2f>
   2bc06:	4c 8b 47 30          	mov    0x30(%rdi),%r8
   2bc0a:	4d 85 c0             	test   %r8,%r8
   2bc0d:	0f 84 4e 1a 00 00    	je     2d661 <JS_CallInternal+0x8351>
   2bc13:	49 8b 78 18          	mov    0x18(%r8),%rdi
   2bc17:	e9 a4 f5 ff ff       	jmp    2b1c0 <JS_CallInternal+0x5eb0>
   2bc1c:	8b b5 a8 fe ff ff    	mov    -0x158(%rbp),%esi
   2bc22:	41 39 f0             	cmp    %esi,%r8d
   2bc25:	41 89 f4             	mov    %esi,%r12d
   2bc28:	45 0f 4e e0          	cmovle %r8d,%r12d
   2bc2c:	45 85 e4             	test   %r12d,%r12d
   2bc2f:	0f 8e 4b 16 00 00    	jle    2d280 <JS_CallInternal+0x7f70>
   2bc35:	4d 63 ec             	movslq %r12d,%r13
   2bc38:	4c 8b bd 98 fe ff ff 	mov    -0x168(%rbp),%r15
   2bc3f:	31 f6                	xor    %esi,%esi
   2bc41:	49 c1 e5 04          	shl    $0x4,%r13
   2bc45:	0f 1f 40 00          	nopl   0x0(%rax)
   2bc49:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2bc50:	00 00 00 00 
   2bc54:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2bc5b:	00 00 00 00 
   2bc5f:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2bc66:	00 00 00 00 
   2bc6a:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2bc71:	00 00 00 00 
   2bc75:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2bc7c:	00 00 00 00 
   2bc80:	4d 8b 5c 37 08       	mov    0x8(%r15,%rsi,1),%r11
   2bc85:	4d 8b 34 37          	mov    (%r15,%rsi,1),%r14
   2bc89:	41 83 fb f6          	cmp    $0xfffffff6,%r11d
   2bc8d:	76 05                	jbe    2bc94 <JS_CallInternal+0x6984>
   2bc8f:	41 83 46 fc 01       	addl   $0x1,-0x4(%r14)
   2bc94:	4c 89 34 37          	mov    %r14,(%rdi,%rsi,1)
   2bc98:	4c 89 5c 37 08       	mov    %r11,0x8(%rdi,%rsi,1)
   2bc9d:	48 83 c6 10          	add    $0x10,%rsi
   2bca1:	4c 39 ee             	cmp    %r13,%rsi
   2bca4:	75 da                	jne    2bc80 <JS_CallInternal+0x6970>
   2bca6:	45 39 e0             	cmp    %r12d,%r8d
   2bca9:	7e 4d                	jle    2bcf8 <JS_CallInternal+0x69e8>
   2bcab:	45 8d 58 ff          	lea    -0x1(%r8),%r11d
   2bcaf:	4d 63 ec             	movslq %r12d,%r13
   2bcb2:	45 29 e3             	sub    %r12d,%r11d
   2bcb5:	4c 89 ee             	mov    %r13,%rsi
   2bcb8:	4d 01 eb             	add    %r13,%r11
   2bcbb:	48 c1 e6 04          	shl    $0x4,%rsi
   2bcbf:	49 c1 e3 04          	shl    $0x4,%r11
   2bcc3:	48 01 fe             	add    %rdi,%rsi
   2bcc6:	4e 8d 5c 1f 10       	lea    0x10(%rdi,%r11,1),%r11
   2bccb:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   2bcd2:	00 00 00 
   2bcd5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2bcdc:	00 00 00 00 
   2bce0:	48 c7 06 00 00 00 00 	movq   $0x0,(%rsi)
   2bce7:	48 83 c6 10          	add    $0x10,%rsi
   2bceb:	48 c7 46 f8 03 00 00 	movq   $0x3,-0x8(%rsi)
   2bcf2:	00 
   2bcf3:	4c 39 de             	cmp    %r11,%rsi
   2bcf6:	75 e8                	jne    2bce0 <JS_CallInternal+0x69d0>
   2bcf8:	44 89 85 38 ff ff ff 	mov    %r8d,-0xc8(%rbp)
   2bcff:	48 89 bd 80 fe ff ff 	mov    %rdi,-0x180(%rbp)
   2bd06:	e9 e5 97 ff ff       	jmp    254f0 <JS_CallInternal+0x1e0>
   2bd0b:	48 83 ec 08          	sub    $0x8,%rsp
   2bd0f:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   2bd15:	49 89 d1             	mov    %rdx,%r9
   2bd18:	48 89 c6             	mov    %rax,%rsi
   2bd1b:	44 89 95 00 fe ff ff 	mov    %r10d,-0x200(%rbp)
   2bd22:	4c 89 ef             	mov    %r13,%rdi
   2bd25:	6a 00                	push   $0x0
   2bd27:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2bd2e:	e8 bd 44 00 00       	call   301f0 <JS_GetPropertyInternal>
   2bd33:	4c 89 ef             	mov    %r13,%rdi
   2bd36:	48 89 c6             	mov    %rax,%rsi
   2bd39:	e8 62 50 ff ff       	call   20da0 <JS_ToBoolFree>
   2bd3e:	4c 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%r8
   2bd45:	44 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10d
   2bd4c:	41 8b 48 fc          	mov    -0x4(%r8),%ecx
   2bd50:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2bd53:	85 d2                	test   %edx,%edx
   2bd55:	41 89 50 fc          	mov    %edx,-0x4(%r8)
   2bd59:	41 5b                	pop    %r11
   2bd5b:	59                   	pop    %rcx
   2bd5c:	0f 8e 19 3a 00 00    	jle    2f77b <JS_CallInternal+0xa46b>
   2bd62:	85 c0                	test   %eax,%eax
   2bd64:	0f 88 e6 9c ff ff    	js     25a50 <JS_CallInternal+0x740>
   2bd6a:	0f 84 5d 99 ff ff    	je     256cd <JS_CallInternal+0x3bd>
   2bd70:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2bd74:	48 83 eb 10          	sub    $0x10,%rbx
   2bd78:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2bd7b:	0f 86 77 9e ff ff    	jbe    25bf8 <JS_CallInternal+0x8e8>
   2bd81:	48 8b 0b             	mov    (%rbx),%rcx
   2bd84:	8b 71 fc             	mov    -0x4(%rcx),%esi
   2bd87:	8d 56 ff             	lea    -0x1(%rsi),%edx
   2bd8a:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2bd8d:	85 d2                	test   %edx,%edx
   2bd8f:	0f 8f 63 9e ff ff    	jg     25bf8 <JS_CallInternal+0x8e8>
   2bd95:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2bd99:	48 89 c2             	mov    %rax,%rdx
   2bd9c:	48 89 ce             	mov    %rcx,%rsi
   2bd9f:	e8 cc 2a ff ff       	call   1e870 <__JS_FreeValueRT>
   2bda4:	e9 4f 9e ff ff       	jmp    25bf8 <JS_CallInternal+0x8e8>
   2bda9:	8b 95 10 fe ff ff    	mov    -0x1f0(%rbp),%edx
   2bdaf:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2bdb6:	4c 8b a5 00 fe ff ff 	mov    -0x200(%rbp),%r12
   2bdbd:	48 8b b5 f0 fd ff ff 	mov    -0x210(%rbp),%rsi
   2bdc4:	83 c2 02             	add    $0x2,%edx
   2bdc7:	48 63 d2             	movslq %edx,%rdx
   2bdca:	49 83 c4 03          	add    $0x3,%r12
   2bdce:	48 c1 e2 04          	shl    $0x4,%rdx
   2bdd2:	48 29 d1             	sub    %rdx,%rcx
   2bdd5:	48 89 31             	mov    %rsi,(%rcx)
   2bdd8:	48 8d 59 10          	lea    0x10(%rcx),%rbx
   2bddc:	48 89 41 08          	mov    %rax,0x8(%rcx)
   2bde0:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2bde6:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2bdea:	49 89 c2             	mov    %rax,%r10
   2bded:	b8 01 00 00 00       	mov    $0x1,%eax
   2bdf2:	ff e2                	jmp    *%rdx
   2bdf4:	4c 89 e8             	mov    %r13,%rax
   2bdf7:	4c 8b a5 30 fe ff ff 	mov    -0x1d0(%rbp),%r12
   2bdfe:	49 89 dd             	mov    %rbx,%r13
   2be01:	4c 89 f9             	mov    %r15,%rcx
   2be04:	4c 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%r8
   2be0b:	48 89 c3             	mov    %rax,%rbx
   2be0e:	48 39 8d 48 fe ff ff 	cmp    %rcx,-0x1b8(%rbp)
   2be15:	0f 84 16 22 00 00    	je     2e031 <JS_CallInternal+0x8d21>
   2be1b:	48 89 59 f8          	mov    %rbx,-0x8(%rcx)
   2be1f:	49 83 c4 01          	add    $0x1,%r12
   2be23:	48 89 cb             	mov    %rcx,%rbx
   2be26:	4c 89 41 f0          	mov    %r8,-0x10(%rcx)
   2be2a:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2be30:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2be34:	49 89 c2             	mov    %rax,%r10
   2be37:	b8 01 00 00 00       	mov    $0x1,%eax
   2be3c:	ff e2                	jmp    *%rdx
   2be3e:	80 fa 01             	cmp    $0x1,%dl
   2be41:	0f 84 a9 02 00 00    	je     2c0f0 <JS_CallInternal+0x6de0>
   2be47:	80 cc 10             	or     $0x10,%ah
   2be4a:	4c 8d 63 f0          	lea    -0x10(%rbx),%r12
   2be4e:	f3 0f 6f 73 f0       	movdqu -0x10(%rbx),%xmm6
   2be53:	4c 89 ef             	mov    %r13,%rdi
   2be56:	89 85 b0 fd ff ff    	mov    %eax,-0x250(%rbp)
   2be5c:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2be60:	8b b5 30 fe ff ff    	mov    -0x1d0(%rbp),%esi
   2be66:	0f 29 b5 90 fd ff ff 	movaps %xmm6,-0x270(%rbp)
   2be6d:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   2be74:	49 8b 44 24 08       	mov    0x8(%r12),%rax
   2be79:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   2be80:	e8 bb 83 01 00       	call   44240 <js_get_function_name>
   2be85:	4c 8d 05 b8 d2 0a 00 	lea    0xad2b8(%rip),%r8        # d9144 <_IO_stdin_used+0x144>
   2be8c:	48 8d 35 14 d7 0a 00 	lea    0xad714(%rip),%rsi        # d95a7 <_IO_stdin_used+0x5a7>
   2be93:	4c 89 ef             	mov    %r13,%rdi
   2be96:	48 89 d1             	mov    %rdx,%rcx
   2be99:	48 89 c2             	mov    %rax,%rdx
   2be9c:	e8 ff 81 01 00       	call   440a0 <JS_ConcatString3>
   2bea1:	49 89 c0             	mov    %rax,%r8
   2bea4:	49 89 d1             	mov    %rdx,%r9
   2bea7:	e9 3c a2 ff ff       	jmp    260e8 <JS_CallInternal+0xdd8>
   2beac:	4d 89 ec             	mov    %r13,%r12
   2beaf:	48 8b 9d 20 fe ff ff 	mov    -0x1e0(%rbp),%rbx
   2beb6:	4d 89 d5             	mov    %r10,%r13
   2beb9:	4c 8b 95 e8 fd ff ff 	mov    -0x218(%rbp),%r10
   2bec0:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2bec4:	4c 89 d6             	mov    %r10,%rsi
   2bec7:	e8 24 a1 fe ff       	call   15ff0 <__js_free>
   2becc:	83 bd 10 fe ff ff 06 	cmpl   $0x6,-0x1f0(%rbp)
   2bed3:	0f 84 77 9b ff ff    	je     25a50 <JS_CallInternal+0x740>
   2bed9:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   2bedd:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2bee0:	76 15                	jbe    2bef7 <JS_CallInternal+0x6be7>
   2bee2:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   2bee6:	8b 71 fc             	mov    -0x4(%rcx),%esi
   2bee9:	8d 56 ff             	lea    -0x1(%rsi),%edx
   2beec:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2beef:	85 d2                	test   %edx,%edx
   2bef1:	0f 8e c5 27 00 00    	jle    2e6bc <JS_CallInternal+0x93ac>
   2bef7:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2befe:	48 8b 41 08          	mov    0x8(%rcx),%rax
   2bf02:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2bf05:	76 14                	jbe    2bf1b <JS_CallInternal+0x6c0b>
   2bf07:	48 8b 09             	mov    (%rcx),%rcx
   2bf0a:	8b 71 fc             	mov    -0x4(%rcx),%esi
   2bf0d:	8d 56 ff             	lea    -0x1(%rsi),%edx
   2bf10:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2bf13:	85 d2                	test   %edx,%edx
   2bf15:	0f 8e 8d 27 00 00    	jle    2e6a8 <JS_CallInternal+0x9398>
   2bf1b:	48 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%rax
   2bf22:	49 83 c4 03          	add    $0x3,%r12
   2bf26:	48 89 43 e0          	mov    %rax,-0x20(%rbx)
   2bf2a:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2bf31:	48 89 43 e8          	mov    %rax,-0x18(%rbx)
   2bf35:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2bf3b:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   2bf42:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2bf46:	49 89 c2             	mov    %rax,%r10
   2bf49:	b8 01 00 00 00       	mov    $0x1,%eax
   2bf4e:	ff e2                	jmp    *%rdx
   2bf50:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2bf56:	48 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%rbx
   2bf5d:	4c 8b a5 00 fe ff ff 	mov    -0x200(%rbp),%r12
   2bf64:	48 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%rdx
   2bf6b:	83 c1 02             	add    $0x2,%ecx
   2bf6e:	48 63 c9             	movslq %ecx,%rcx
   2bf71:	49 83 c4 03          	add    $0x3,%r12
   2bf75:	48 c1 e1 04          	shl    $0x4,%rcx
   2bf79:	48 29 cb             	sub    %rcx,%rbx
   2bf7c:	48 89 de             	mov    %rbx,%rsi
   2bf7f:	48 8d 5b 10          	lea    0x10(%rbx),%rbx
   2bf83:	48 89 56 08          	mov    %rdx,0x8(%rsi)
   2bf87:	48 89 06             	mov    %rax,(%rsi)
   2bf8a:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2bf90:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2bf94:	49 89 c2             	mov    %rax,%r10
   2bf97:	b8 01 00 00 00       	mov    $0x1,%eax
   2bf9c:	ff e2                	jmp    *%rdx
   2bf9e:	8b 85 30 fe ff ff    	mov    -0x1d0(%rbp),%eax
   2bfa4:	48 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%rdx
   2bfab:	4c 89 e1             	mov    %r12,%rcx
   2bfae:	48 8b b5 00 fe ff ff 	mov    -0x200(%rbp),%rsi
   2bfb5:	4c 8b a5 10 fe ff ff 	mov    -0x1f0(%rbp),%r12
   2bfbc:	83 c0 01             	add    $0x1,%eax
   2bfbf:	48 98                	cltq
   2bfc1:	49 83 c4 05          	add    $0x5,%r12
   2bfc5:	48 c1 e0 04          	shl    $0x4,%rax
   2bfc9:	48 29 c1             	sub    %rax,%rcx
   2bfcc:	48 89 51 08          	mov    %rdx,0x8(%rcx)
   2bfd0:	48 8d 59 10          	lea    0x10(%rcx),%rbx
   2bfd4:	48 89 31             	mov    %rsi,(%rcx)
   2bfd7:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2bfdd:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2bfe1:	49 89 c2             	mov    %rax,%r10
   2bfe4:	b8 01 00 00 00       	mov    $0x1,%eax
   2bfe9:	ff e2                	jmp    *%rdx
   2bfeb:	8b 10                	mov    (%rax),%edx
   2bfed:	81 e2 ff ff ff 03    	and    $0x3ffffff,%edx
   2bff3:	0f 85 36 f5 ff ff    	jne    2b52f <JS_CallInternal+0x621f>
   2bff9:	89 f2                	mov    %esi,%edx
   2bffb:	b9 07 00 00 00       	mov    $0x7,%ecx
   2c000:	4c 89 fe             	mov    %r15,%rsi
   2c003:	4c 89 ef             	mov    %r13,%rdi
   2c006:	e8 95 e2 01 00       	call   4a2a0 <add_property>
   2c00b:	48 85 c0             	test   %rax,%rax
   2c00e:	0f 84 20 2d 00 00    	je     2ed34 <JS_CallInternal+0x9a24>
   2c014:	48 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%rbx
   2c01b:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2c022:	48 89 18             	mov    %rbx,(%rax)
   2c025:	48 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%rbx
   2c02c:	48 89 58 08          	mov    %rbx,0x8(%rax)
   2c030:	48 8b 41 08          	mov    0x8(%rcx),%rax
   2c034:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2c037:	76 14                	jbe    2c04d <JS_CallInternal+0x6d3d>
   2c039:	48 8b 09             	mov    (%rcx),%rcx
   2c03c:	8b 59 fc             	mov    -0x4(%rcx),%ebx
   2c03f:	8d 53 ff             	lea    -0x1(%rbx),%edx
   2c042:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2c045:	85 d2                	test   %edx,%edx
   2c047:	0f 8e 27 21 00 00    	jle    2e174 <JS_CallInternal+0x8e64>
   2c04d:	41 0f b6 04 24       	movzbl (%r12),%eax
   2c052:	48 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%rbx
   2c059:	49 83 c4 01          	add    $0x1,%r12
   2c05d:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2c061:	49 89 c2             	mov    %rax,%r10
   2c064:	b8 01 00 00 00       	mov    $0x1,%eax
   2c069:	ff e2                	jmp    *%rdx
   2c06b:	48 63 f6             	movslq %esi,%rsi
   2c06e:	48 c1 e6 04          	shl    $0x4,%rsi
   2c072:	48 03 b5 a0 fe ff ff 	add    -0x160(%rbp),%rsi
   2c079:	e9 f9 a1 ff ff       	jmp    26277 <JS_CallInternal+0xf67>
   2c07e:	40 0f b6 c6          	movzbl %sil,%eax
   2c082:	41 bb 01 00 00 00    	mov    $0x1,%r11d
   2c088:	2d b3 00 00 00       	sub    $0xb3,%eax
   2c08d:	e9 20 a2 ff ff       	jmp    262b2 <JS_CallInternal+0xfa2>
   2c092:	ba 08 00 00 00       	mov    $0x8,%edx
   2c097:	e9 45 e1 ff ff       	jmp    2a1e1 <JS_CallInternal+0x4ed1>
   2c09c:	48 89 f7             	mov    %rsi,%rdi
   2c09f:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
   2c0a6:	48 83 ec 08          	sub    $0x8,%rsp
   2c0aa:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2c0ae:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2c0b2:	48 89 ca             	mov    %rcx,%rdx
   2c0b5:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2c0bc:	48 89 fe             	mov    %rdi,%rsi
   2c0bf:	b9 32 00 00 00       	mov    $0x32,%ecx
   2c0c4:	4c 89 ef             	mov    %r13,%rdi
   2c0c7:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2c0cb:	6a 00                	push   $0x0
   2c0cd:	e8 1e 41 00 00       	call   301f0 <JS_GetPropertyInternal>
   2c0d2:	5f                   	pop    %rdi
   2c0d3:	41 58                	pop    %r8
   2c0d5:	49 89 c7             	mov    %rax,%r15
   2c0d8:	48 89 d0             	mov    %rdx,%rax
   2c0db:	83 fa 06             	cmp    $0x6,%edx
   2c0de:	0f 85 4a f3 ff ff    	jne    2b42e <JS_CallInternal+0x611e>
   2c0e4:	4d 89 e7             	mov    %r12,%r15
   2c0e7:	e9 64 99 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2c0ec:	0f 1f 40 00          	nopl   0x0(%rax)
   2c0f0:	80 cc 08             	or     $0x8,%ah
   2c0f3:	4c 8d 63 f0          	lea    -0x10(%rbx),%r12
   2c0f7:	f3 0f 6f 6b f0       	movdqu -0x10(%rbx),%xmm5
   2c0fc:	4c 89 ef             	mov    %r13,%rdi
   2c0ff:	89 85 b0 fd ff ff    	mov    %eax,-0x250(%rbp)
   2c105:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2c109:	8b b5 30 fe ff ff    	mov    -0x1d0(%rbp),%esi
   2c10f:	0f 29 ad a0 fd ff ff 	movaps %xmm5,-0x260(%rbp)
   2c116:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   2c11d:	49 8b 44 24 08       	mov    0x8(%r12),%rax
   2c122:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   2c129:	e8 12 81 01 00       	call   44240 <js_get_function_name>
   2c12e:	4c 8d 05 0f d0 0a 00 	lea    0xad00f(%rip),%r8        # d9144 <_IO_stdin_used+0x144>
   2c135:	48 8d 35 66 d4 0a 00 	lea    0xad466(%rip),%rsi        # d95a2 <_IO_stdin_used+0x5a2>
   2c13c:	4c 89 ef             	mov    %r13,%rdi
   2c13f:	48 89 d1             	mov    %rdx,%rcx
   2c142:	48 89 c2             	mov    %rax,%rdx
   2c145:	e8 56 7f 01 00       	call   440a0 <JS_ConcatString3>
   2c14a:	49 89 c0             	mov    %rax,%r8
   2c14d:	49 89 d1             	mov    %rdx,%r9
   2c150:	e9 93 9f ff ff       	jmp    260e8 <JS_CallInternal+0xdd8>
   2c155:	4d 89 c1             	mov    %r8,%r9
   2c158:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   2c15f:	48 83 ec 08          	sub    $0x8,%rsp
   2c163:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2c167:	48 89 c2             	mov    %rax,%rdx
   2c16a:	4c 89 c8             	mov    %r9,%rax
   2c16d:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   2c174:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2c178:	4c 89 ef             	mov    %r13,%rdi
   2c17b:	4c 89 7e 30          	mov    %r15,0x30(%rsi)
   2c17f:	48 89 c6             	mov    %rax,%rsi
   2c182:	6a 00                	push   $0x0
   2c184:	e8 67 40 00 00       	call   301f0 <JS_GetPropertyInternal>
   2c189:	41 5b                	pop    %r11
   2c18b:	48 89 c1             	mov    %rax,%rcx
   2c18e:	48 89 d0             	mov    %rdx,%rax
   2c191:	5a                   	pop    %rdx
   2c192:	83 f8 06             	cmp    $0x6,%eax
   2c195:	0f 84 b5 98 ff ff    	je     25a50 <JS_CallInternal+0x740>
   2c19b:	49 89 cf             	mov    %rcx,%r15
   2c19e:	e9 d7 f1 ff ff       	jmp    2b37a <JS_CallInternal+0x606a>
   2c1a3:	4d 89 c1             	mov    %r8,%r9
   2c1a6:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   2c1ad:	48 83 ec 08          	sub    $0x8,%rsp
   2c1b1:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2c1b5:	48 89 c2             	mov    %rax,%rdx
   2c1b8:	4c 89 c8             	mov    %r9,%rax
   2c1bb:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   2c1c2:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2c1c6:	4c 89 ef             	mov    %r13,%rdi
   2c1c9:	4c 89 7e 30          	mov    %r15,0x30(%rsi)
   2c1cd:	48 89 c6             	mov    %rax,%rsi
   2c1d0:	6a 00                	push   $0x0
   2c1d2:	e8 19 40 00 00       	call   301f0 <JS_GetPropertyInternal>
   2c1d7:	41 59                	pop    %r9
   2c1d9:	41 5a                	pop    %r10
   2c1db:	83 fa 06             	cmp    $0x6,%edx
   2c1de:	0f 85 f5 f0 ff ff    	jne    2b2d9 <JS_CallInternal+0x5fc9>
   2c1e4:	e9 67 98 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2c1e9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   2c1f0:	81 bd 30 fe ff ff f2 	cmpl   $0xf2,-0x1d0(%rbp)
   2c1f7:	00 00 00 
   2c1fa:	0f 8f c4 10 00 00    	jg     2d2c4 <JS_CallInternal+0x7fb4>
   2c200:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   2c204:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2c207:	0f 86 b5 9f ff ff    	jbe    261c2 <JS_CallInternal+0xeb2>
   2c20d:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   2c211:	8b 56 fc             	mov    -0x4(%rsi),%edx
   2c214:	83 ea 01             	sub    $0x1,%edx
   2c217:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2c21a:	85 d2                	test   %edx,%edx
   2c21c:	0f 8f a0 9f ff ff    	jg     261c2 <JS_CallInternal+0xeb2>
   2c222:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2c226:	48 89 c2             	mov    %rax,%rdx
   2c229:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2c22f:	e8 3c 26 ff ff       	call   1e870 <__JS_FreeValueRT>
   2c234:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2c23a:	e9 83 9f ff ff       	jmp    261c2 <JS_CallInternal+0xeb2>
   2c23f:	4c 89 c0             	mov    %r8,%rax
   2c242:	49 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%r11
   2c249:	48 83 ec 08          	sub    $0x8,%rsp
   2c24d:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2c251:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2c255:	4c 89 da             	mov    %r11,%rdx
   2c258:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   2c25f:	4c 89 ef             	mov    %r13,%rdi
   2c262:	4c 89 7e 30          	mov    %r15,0x30(%rsi)
   2c266:	48 89 c6             	mov    %rax,%rsi
   2c269:	6a 00                	push   $0x0
   2c26b:	e8 80 3f 00 00       	call   301f0 <JS_GetPropertyInternal>
   2c270:	41 59                	pop    %r9
   2c272:	41 5a                	pop    %r10
   2c274:	48 89 d1             	mov    %rdx,%rcx
   2c277:	83 fa 06             	cmp    $0x6,%edx
   2c27a:	0f 84 d0 97 ff ff    	je     25a50 <JS_CallInternal+0x740>
   2c280:	49 89 c7             	mov    %rax,%r15
   2c283:	e9 99 ef ff ff       	jmp    2b221 <JS_CallInternal+0x5f11>
   2c288:	48 c7 85 30 fe ff ff 	movq   $0xffffffffffffffff,-0x1d0(%rbp)
   2c28f:	ff ff ff ff 
   2c293:	49 89 fa             	mov    %rdi,%r10
   2c296:	48 83 ec 08          	sub    $0x8,%rsp
   2c29a:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2c29e:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2c2a2:	4c 89 d6             	mov    %r10,%rsi
   2c2a5:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2c2ac:	4c 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%r11
   2c2b3:	4c 89 ef             	mov    %r13,%rdi
   2c2b6:	4c 89 78 30          	mov    %r15,0x30(%rax)
   2c2ba:	4c 89 da             	mov    %r11,%rdx
   2c2bd:	6a 00                	push   $0x0
   2c2bf:	e8 2c 3f 00 00       	call   301f0 <JS_GetPropertyInternal>
   2c2c4:	5e                   	pop    %rsi
   2c2c5:	5f                   	pop    %rdi
   2c2c6:	48 89 c1             	mov    %rax,%rcx
   2c2c9:	48 89 d0             	mov    %rdx,%rax
   2c2cc:	83 fa 06             	cmp    $0x6,%edx
   2c2cf:	0f 84 7b 97 ff ff    	je     25a50 <JS_CallInternal+0x740>
   2c2d5:	49 89 cf             	mov    %rcx,%r15
   2c2d8:	e9 81 ee ff ff       	jmp    2b15e <JS_CallInternal+0x5e4e>
   2c2dd:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   2c2e4:	4c 89 7e 30          	mov    %r15,0x30(%rsi)
   2c2e8:	83 fa f6             	cmp    $0xfffffff6,%edx
   2c2eb:	76 04                	jbe    2c2f1 <JS_CallInternal+0x6fe1>
   2c2ed:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2c2f1:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
   2c2f8:	4c 89 ef             	mov    %r13,%rdi
   2c2fb:	48 8d b5 00 ff ff ff 	lea    -0x100(%rbp),%rsi
   2c302:	ba 8c 00 00 00       	mov    $0x8c,%edx
   2c307:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2c30e:	48 89 85 f0 fe ff ff 	mov    %rax,-0x110(%rbp)
   2c315:	e8 c6 5f 02 00       	call   522e0 <js_unary_arith_slow>
   2c31a:	85 c0                	test   %eax,%eax
   2c31c:	0f 85 2e 97 ff ff    	jne    25a50 <JS_CallInternal+0x740>
   2c322:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2c329:	48 8b b5 f0 fe ff ff 	mov    -0x110(%rbp),%rsi
   2c330:	48 8b 11             	mov    (%rcx),%rdx
   2c333:	48 8b 41 08          	mov    0x8(%rcx),%rax
   2c337:	48 89 31             	mov    %rsi,(%rcx)
   2c33a:	48 8b b5 f8 fe ff ff 	mov    -0x108(%rbp),%rsi
   2c341:	48 89 71 08          	mov    %rsi,0x8(%rcx)
   2c345:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2c348:	0f 86 90 ab ff ff    	jbe    26ede <JS_CallInternal+0x1bce>
   2c34e:	8b 4a fc             	mov    -0x4(%rdx),%ecx
   2c351:	83 e9 01             	sub    $0x1,%ecx
   2c354:	89 4a fc             	mov    %ecx,-0x4(%rdx)
   2c357:	85 c9                	test   %ecx,%ecx
   2c359:	0f 8f 7f ab ff ff    	jg     26ede <JS_CallInternal+0x1bce>
   2c35f:	48 92                	xchg   %rax,%rdx
   2c361:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2c365:	48 89 c6             	mov    %rax,%rsi
   2c368:	e8 03 25 ff ff       	call   1e870 <__JS_FreeValueRT>
   2c36d:	e9 6c ab ff ff       	jmp    26ede <JS_CallInternal+0x1bce>
   2c372:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   2c379:	4c 89 7e 30          	mov    %r15,0x30(%rsi)
   2c37d:	83 fa f6             	cmp    $0xfffffff6,%edx
   2c380:	76 04                	jbe    2c386 <JS_CallInternal+0x7076>
   2c382:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2c386:	48 89 95 e8 fe ff ff 	mov    %rdx,-0x118(%rbp)
   2c38d:	4c 89 ef             	mov    %r13,%rdi
   2c390:	48 8d b5 f0 fe ff ff 	lea    -0x110(%rbp),%rsi
   2c397:	ba 8d 00 00 00       	mov    $0x8d,%edx
   2c39c:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2c3a3:	48 89 85 e0 fe ff ff 	mov    %rax,-0x120(%rbp)
   2c3aa:	e8 31 5f 02 00       	call   522e0 <js_unary_arith_slow>
   2c3af:	85 c0                	test   %eax,%eax
   2c3b1:	0f 85 99 96 ff ff    	jne    25a50 <JS_CallInternal+0x740>
   2c3b7:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2c3be:	48 8b b5 e0 fe ff ff 	mov    -0x120(%rbp),%rsi
   2c3c5:	48 8b 11             	mov    (%rcx),%rdx
   2c3c8:	48 8b 41 08          	mov    0x8(%rcx),%rax
   2c3cc:	48 89 31             	mov    %rsi,(%rcx)
   2c3cf:	48 8b b5 e8 fe ff ff 	mov    -0x118(%rbp),%rsi
   2c3d6:	48 89 71 08          	mov    %rsi,0x8(%rcx)
   2c3da:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2c3dd:	0f 86 54 ab ff ff    	jbe    26f37 <JS_CallInternal+0x1c27>
   2c3e3:	8b 4a fc             	mov    -0x4(%rdx),%ecx
   2c3e6:	83 e9 01             	sub    $0x1,%ecx
   2c3e9:	89 4a fc             	mov    %ecx,-0x4(%rdx)
   2c3ec:	85 c9                	test   %ecx,%ecx
   2c3ee:	0f 8f 43 ab ff ff    	jg     26f37 <JS_CallInternal+0x1c27>
   2c3f4:	48 92                	xchg   %rax,%rdx
   2c3f6:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2c3fa:	48 89 c6             	mov    %rax,%rsi
   2c3fd:	e8 6e 24 ff ff       	call   1e870 <__JS_FreeValueRT>
   2c402:	e9 30 ab ff ff       	jmp    26f37 <JS_CallInternal+0x1c27>
   2c407:	b8 06 00 00 00       	mov    $0x6,%eax
   2c40c:	31 c9                	xor    %ecx,%ecx
   2c40e:	e9 ff 96 ff ff       	jmp    25b12 <JS_CallInternal+0x802>
   2c413:	66 83 7f 12 01       	cmpw   $0x1,0x12(%rdi)
   2c418:	0f 85 a3 9e ff ff    	jne    262c1 <JS_CallInternal+0xfb1>
   2c41e:	f6 47 10 08          	testb  $0x8,0x10(%rdi)
   2c422:	0f 85 99 9e ff ff    	jne    262c1 <JS_CallInternal+0xfb1>
   2c428:	4b 8d 74 3a 01       	lea    0x1(%r10,%r15,1),%rsi
   2c42d:	48 83 7e 08 00       	cmpq   $0x0,0x8(%rsi)
   2c432:	0f 85 89 9e ff ff    	jne    262c1 <JS_CallInternal+0xfb1>
   2c438:	48 8b 47 18          	mov    0x18(%rdi),%rax
   2c43c:	48 39 06             	cmp    %rax,(%rsi)
   2c43f:	0f 85 7c 9e ff ff    	jne    262c1 <JS_CallInternal+0xfb1>
   2c445:	44 8b 7e 10          	mov    0x10(%rsi),%r15d
   2c449:	44 8b 48 18          	mov    0x18(%rax),%r9d
   2c44d:	4a 8d 34 fd 00 00 00 	lea    0x0(,%r15,8),%rsi
   2c454:	00 
   2c455:	4a 8d 74 8e 3c       	lea    0x3c(%rsi,%r9,4),%rsi
   2c45a:	0f b6 44 30 03       	movzbl 0x3(%rax,%rsi,1),%eax
   2c45f:	c0 e8 02             	shr    $0x2,%al
   2c462:	83 e0 3a             	and    $0x3a,%eax
   2c465:	3c 02                	cmp    $0x2,%al
   2c467:	0f 85 54 9e ff ff    	jne    262c1 <JS_CallInternal+0xfb1>
   2c46d:	4c 89 f8             	mov    %r15,%rax
   2c470:	48 c1 e0 04          	shl    $0x4,%rax
   2c474:	48 03 47 20          	add    0x20(%rdi),%rax
   2c478:	83 78 08 00          	cmpl   $0x0,0x8(%rax)
   2c47c:	0f 85 3f 9e ff ff    	jne    262c1 <JS_CallInternal+0xfb1>
   2c482:	8b 30                	mov    (%rax),%esi
   2c484:	81 fe ff ff ff 7f    	cmp    $0x7fffffff,%esi
   2c48a:	0f 84 31 9e ff ff    	je     262c1 <JS_CallInternal+0xfb1>
   2c490:	8d 4e 01             	lea    0x1(%rsi),%ecx
   2c493:	48 89 08             	mov    %rcx,(%rax)
   2c496:	31 c9                	xor    %ecx,%ecx
   2c498:	48 89 48 08          	mov    %rcx,0x8(%rax)
   2c49c:	41 8d 43 0b          	lea    0xb(%r11),%eax
   2c4a0:	48 98                	cltq
   2c4a2:	49 01 c2             	add    %rax,%r10
   2c4a5:	41 0f b6 02          	movzbl (%r10),%eax
   2c4a9:	4d 8d 62 01          	lea    0x1(%r10),%r12
   2c4ad:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2c4b1:	49 89 c2             	mov    %rax,%r10
   2c4b4:	b8 01 00 00 00       	mov    $0x1,%eax
   2c4b9:	ff e2                	jmp    *%rdx
   2c4bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2c4c0:	83 fa 08             	cmp    $0x8,%edx
   2c4c3:	0f 85 8e 0d 00 00    	jne    2d257 <JS_CallInternal+0x7f47>
   2c4c9:	66 48 0f 6e c0       	movq   %rax,%xmm0
   2c4ce:	66 0f 57 05 aa a5 0b 	xorpd  0xba5aa(%rip),%xmm0        # e6a80 <typed_array_size_log2+0x28>
   2c4d5:	00 
   2c4d6:	48 c7 43 f8 08 00 00 	movq   $0x8,-0x8(%rbx)
   2c4dd:	00 
   2c4de:	f2 0f 11 43 f0       	movsd  %xmm0,-0x10(%rbx)
   2c4e3:	e9 ee de ff ff       	jmp    2a3d6 <JS_CallInternal+0x50c6>
   2c4e8:	85 c0                	test   %eax,%eax
   2c4ea:	0f 84 59 ac ff ff    	je     27149 <JS_CallInternal+0x1e39>
   2c4f0:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2c4f4:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2c4f8:	b9 01 00 00 00       	mov    $0x1,%ecx
   2c4fd:	4c 89 ef             	mov    %r13,%rdi
   2c500:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2c507:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2c50b:	e8 20 74 01 00       	call   43930 <JS_ToStringInternal>
   2c510:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2c517:	49 89 d7             	mov    %rdx,%r15
   2c51a:	83 fa 06             	cmp    $0x6,%edx
   2c51d:	0f 84 9e 37 00 00    	je     2fcc1 <JS_CallInternal+0xa9b1>
   2c523:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2c527:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2c52a:	76 15                	jbe    2c541 <JS_CallInternal+0x7231>
   2c52c:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2c530:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   2c533:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2c536:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2c539:	85 d2                	test   %edx,%edx
   2c53b:	0f 8e 9b 2a 00 00    	jle    2efdc <JS_CallInternal+0x9ccc>
   2c541:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2c548:	4c 89 7b f8          	mov    %r15,-0x8(%rbx)
   2c54c:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2c550:	e9 f4 ab ff ff       	jmp    27149 <JS_CallInternal+0x1e39>
   2c555:	85 c9                	test   %ecx,%ecx
   2c557:	0f 85 74 2f 00 00    	jne    2f4d1 <JS_CallInternal+0xa1c1>
   2c55d:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   2c561:	4c 8d 63 e0          	lea    -0x20(%rbx),%r12
   2c565:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2c568:	76 15                	jbe    2c57f <JS_CallInternal+0x726f>
   2c56a:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   2c56e:	8b 71 fc             	mov    -0x4(%rcx),%esi
   2c571:	8d 56 ff             	lea    -0x1(%rsi),%edx
   2c574:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2c577:	85 d2                	test   %edx,%edx
   2c579:	0f 8e da 2e 00 00    	jle    2f459 <JS_CallInternal+0xa149>
   2c57f:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   2c583:	48 8b 53 d8          	mov    -0x28(%rbx),%rdx
   2c587:	b9 01 00 00 00       	mov    $0x1,%ecx
   2c58c:	4c 89 ef             	mov    %r13,%rdi
   2c58f:	4c 89 e3             	mov    %r12,%rbx
   2c592:	e8 f9 84 06 00       	call   94a90 <JS_IteratorClose>
   2c597:	e9 c1 96 ff ff       	jmp    25c5d <JS_CallInternal+0x94d>
   2c59c:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   2c5a0:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   2c5a4:	4c 89 d1             	mov    %r10,%rcx
   2c5a7:	4d 89 f8             	mov    %r15,%r8
   2c5aa:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   2c5b0:	4c 89 ef             	mov    %r13,%rdi
   2c5b3:	4c 89 95 30 fe ff ff 	mov    %r10,-0x1d0(%rbp)
   2c5ba:	4c 89 bd 38 fe ff ff 	mov    %r15,-0x1c8(%rbp)
   2c5c1:	e8 2a 18 01 00       	call   3ddf0 <JS_SetPrototypeInternal>
   2c5c6:	4c 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%r10
   2c5cd:	85 c0                	test   %eax,%eax
   2c5cf:	0f 89 7e a1 ff ff    	jns    26753 <JS_CallInternal+0x1443>
   2c5d5:	4d 89 e7             	mov    %r12,%r15
   2c5d8:	e9 73 94 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2c5dd:	0f 1f 00             	nopl   (%rax)
   2c5e0:	41 83 ff 08          	cmp    $0x8,%r15d
   2c5e4:	0f 85 16 0d 00 00    	jne    2d300 <JS_CallInternal+0x7ff0>
   2c5ea:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2c5ee:	66 49 0f 6e e2       	movq   %r10,%xmm4
   2c5f3:	31 c0                	xor    %eax,%eax
   2c5f5:	f2 0f 2a c2          	cvtsi2sd %edx,%xmm0
   2c5f9:	66 0f 2e c4          	ucomisd %xmm4,%xmm0
   2c5fd:	ba 01 00 00 00       	mov    $0x1,%edx
   2c602:	0f 9a c0             	setp   %al
   2c605:	48 0f 45 c2          	cmovne %rdx,%rax
   2c609:	e9 83 d1 ff ff       	jmp    29791 <JS_CallInternal+0x4481>
   2c60e:	41 83 ff 08          	cmp    $0x8,%r15d
   2c612:	0f 85 80 0b 00 00    	jne    2d198 <JS_CallInternal+0x7e88>
   2c618:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2c61c:	66 49 0f 6e e0       	movq   %r8,%xmm4
   2c621:	31 c9                	xor    %ecx,%ecx
   2c623:	f2 0f 2a c7          	cvtsi2sd %edi,%xmm0
   2c627:	66 0f 2e c4          	ucomisd %xmm4,%xmm0
   2c62b:	0f 9b c1             	setnp  %cl
   2c62e:	0f 45 ca             	cmovne %edx,%ecx
   2c631:	e9 8e d7 ff ff       	jmp    29dc4 <JS_CallInternal+0x4ab4>
   2c636:	48 63 f6             	movslq %esi,%rsi
   2c639:	48 c1 e6 04          	shl    $0x4,%rsi
   2c63d:	48 03 b5 80 fe ff ff 	add    -0x180(%rbp),%rsi
   2c644:	e9 2e 9c ff ff       	jmp    26277 <JS_CallInternal+0xf67>
   2c649:	83 f9 08             	cmp    $0x8,%ecx
   2c64c:	0f 85 14 0b 00 00    	jne    2d166 <JS_CallInternal+0x7e56>
   2c652:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2c656:	66 49 0f 6e e0       	movq   %r8,%xmm4
   2c65b:	45 31 ff             	xor    %r15d,%r15d
   2c65e:	f2 0f 2a c7          	cvtsi2sd %edi,%xmm0
   2c662:	66 0f 2e c4          	ucomisd %xmm4,%xmm0
   2c666:	41 0f 9b c7          	setnp  %r15b
   2c66a:	44 0f 45 fa          	cmovne %edx,%r15d
   2c66e:	e9 cb d1 ff ff       	jmp    2983e <JS_CallInternal+0x452e>
   2c673:	41 83 f8 08          	cmp    $0x8,%r8d
   2c677:	0f 85 26 0c 00 00    	jne    2d2a3 <JS_CallInternal+0x7f93>
   2c67d:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2c681:	66 49 0f 6e e2       	movq   %r10,%xmm4
   2c686:	45 31 ff             	xor    %r15d,%r15d
   2c689:	b8 00 00 00 00       	mov    $0x0,%eax
   2c68e:	f2 0f 2a c7          	cvtsi2sd %edi,%xmm0
   2c692:	66 0f 2e c4          	ucomisd %xmm4,%xmm0
   2c696:	41 0f 9b c7          	setnp  %r15b
   2c69a:	4c 0f 45 f8          	cmovne %rax,%r15
   2c69e:	e9 45 d1 ff ff       	jmp    297e8 <JS_CallInternal+0x44d8>
   2c6a3:	4d 89 e7             	mov    %r12,%r15
   2c6a6:	e9 a5 93 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2c6ab:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2c6b2:	44 89 d2             	mov    %r10d,%edx
   2c6b5:	48 89 de             	mov    %rbx,%rsi
   2c6b8:	4c 89 ef             	mov    %r13,%rdi
   2c6bb:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2c6bf:	e8 2c 61 02 00       	call   527f0 <js_post_inc_slow>
   2c6c4:	85 c0                	test   %eax,%eax
   2c6c6:	0f 84 94 dd ff ff    	je     2a460 <JS_CallInternal+0x5150>
   2c6cc:	4d 89 e7             	mov    %r12,%r15
   2c6cf:	e9 7c 93 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2c6d4:	0f 1f 40 00          	nopl   0x0(%rax)
   2c6d8:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2c6dc:	48 89 ce             	mov    %rcx,%rsi
   2c6df:	e8 8c 21 ff ff       	call   1e870 <__JS_FreeValueRT>
   2c6e4:	e9 e3 9f ff ff       	jmp    266cc <JS_CallInternal+0x13bc>
   2c6e9:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   2c6ed:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   2c6f1:	4c 89 ef             	mov    %r13,%rdi
   2c6f4:	4d 89 e7             	mov    %r12,%r15
   2c6f7:	e8 74 a8 01 00       	call   46f70 <JS_ValueToAtom>
   2c6fc:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2c702:	85 c0                	test   %eax,%eax
   2c704:	0f 85 05 99 ff ff    	jne    2600f <JS_CallInternal+0xcff>
   2c70a:	e9 41 93 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2c70f:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2c716:	44 89 d2             	mov    %r10d,%edx
   2c719:	48 89 de             	mov    %rbx,%rsi
   2c71c:	4c 89 ef             	mov    %r13,%rdi
   2c71f:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2c723:	e8 c8 60 02 00       	call   527f0 <js_post_inc_slow>
   2c728:	85 c0                	test   %eax,%eax
   2c72a:	0f 84 62 d9 ff ff    	je     2a092 <JS_CallInternal+0x4d82>
   2c730:	4d 89 e7             	mov    %r12,%r15
   2c733:	e9 18 93 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2c738:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   2c73f:	00 
   2c740:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2c747:	44 89 d2             	mov    %r10d,%edx
   2c74a:	48 89 de             	mov    %rbx,%rsi
   2c74d:	4c 89 ef             	mov    %r13,%rdi
   2c750:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2c754:	e8 87 5b 02 00       	call   522e0 <js_unary_arith_slow>
   2c759:	85 c0                	test   %eax,%eax
   2c75b:	0f 84 b7 d1 ff ff    	je     29918 <JS_CallInternal+0x4608>
   2c761:	4d 89 e7             	mov    %r12,%r15
   2c764:	e9 e7 92 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2c769:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   2c770:	45 31 c0             	xor    %r8d,%r8d
   2c773:	48 8b 0b             	mov    (%rbx),%rcx
   2c776:	8b 71 fc             	mov    -0x4(%rcx),%esi
   2c779:	8d 56 ff             	lea    -0x1(%rsi),%edx
   2c77c:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2c77f:	85 d2                	test   %edx,%edx
   2c781:	0f 8e 39 14 00 00    	jle    2dbc0 <JS_CallInternal+0x88b0>
   2c787:	49 8b 47 08          	mov    0x8(%r15),%rax
   2c78b:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2c78e:	76 14                	jbe    2c7a4 <JS_CallInternal+0x7494>
   2c790:	49 8b 17             	mov    (%r15),%rdx
   2c793:	8b 4a fc             	mov    -0x4(%rdx),%ecx
   2c796:	83 e9 01             	sub    $0x1,%ecx
   2c799:	89 4a fc             	mov    %ecx,-0x4(%rdx)
   2c79c:	85 c9                	test   %ecx,%ecx
   2c79e:	0f 8e 5b 16 00 00    	jle    2ddff <JS_CallInternal+0x8aef>
   2c7a4:	41 83 f8 ff          	cmp    $0xffffffff,%r8d
   2c7a8:	0f 85 9c e6 ff ff    	jne    2ae4a <JS_CallInternal+0x5b3a>
   2c7ae:	4d 89 e7             	mov    %r12,%r15
   2c7b1:	e9 9a 92 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2c7b6:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2c7bd:	44 89 d2             	mov    %r10d,%edx
   2c7c0:	48 89 de             	mov    %rbx,%rsi
   2c7c3:	4c 89 ef             	mov    %r13,%rdi
   2c7c6:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2c7ca:	e8 11 5b 02 00       	call   522e0 <js_unary_arith_slow>
   2c7cf:	85 c0                	test   %eax,%eax
   2c7d1:	0f 84 85 d1 ff ff    	je     2995c <JS_CallInternal+0x464c>
   2c7d7:	4d 89 e7             	mov    %r12,%r15
   2c7da:	e9 71 92 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2c7df:	90                   	nop
   2c7e0:	48 8b 4b c0          	mov    -0x40(%rbx),%rcx
   2c7e4:	4c 8b 43 c8          	mov    -0x38(%rbx),%r8
   2c7e8:	f6 85 30 fe ff ff 02 	testb  $0x2,-0x1d0(%rbp)
   2c7ef:	0f 84 2e 0b 00 00    	je     2d323 <JS_CallInternal+0x8013>
   2c7f5:	48 83 ec 08          	sub    $0x8,%rsp
   2c7f9:	45 31 c9             	xor    %r9d,%r9d
   2c7fc:	6a 00                	push   $0x0
   2c7fe:	4c 89 ef             	mov    %r13,%rdi
   2c801:	e8 5a 39 00 00       	call   30160 <JS_CallFree>
   2c806:	48 89 c1             	mov    %rax,%rcx
   2c809:	48 89 d0             	mov    %rdx,%rax
   2c80c:	5a                   	pop    %rdx
   2c80d:	5e                   	pop    %rsi
   2c80e:	83 f8 06             	cmp    $0x6,%eax
   2c811:	0f 84 39 92 ff ff    	je     25a50 <JS_CallInternal+0x740>
   2c817:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   2c81b:	83 fe f6             	cmp    $0xfffffff6,%esi
   2c81e:	76 15                	jbe    2c835 <JS_CallInternal+0x7525>
   2c820:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   2c824:	8b 57 fc             	mov    -0x4(%rdi),%edx
   2c827:	83 ea 01             	sub    $0x1,%edx
   2c82a:	89 57 fc             	mov    %edx,-0x4(%rdi)
   2c82d:	85 d2                	test   %edx,%edx
   2c82f:	0f 8e 38 2c 00 00    	jle    2f46d <JS_CallInternal+0xa15d>
   2c835:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2c839:	31 c0                	xor    %eax,%eax
   2c83b:	48 89 4b f0          	mov    %rcx,-0x10(%rbx)
   2c83f:	e9 12 b8 ff ff       	jmp    28056 <JS_CallInternal+0x2d46>
   2c844:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2c848:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
   2c84d:	b8 08 00 00 00       	mov    $0x8,%eax
   2c852:	e9 af d7 ff ff       	jmp    2a006 <JS_CallInternal+0x4cf6>
   2c857:	48 8b b5 c0 fe ff ff 	mov    -0x140(%rbp),%rsi
   2c85e:	4c 03 4e 30          	add    0x30(%rsi),%r9
   2c862:	80 79 11 00          	cmpb   $0x0,0x11(%rcx)
   2c866:	0f 84 d9 10 00 00    	je     2d945 <JS_CallInternal+0x8635>
   2c86c:	41 83 fa 3a          	cmp    $0x3a,%r10d
   2c870:	0f 84 b7 9a ff ff    	je     2632d <JS_CallInternal+0x101d>
   2c876:	41 8b 71 04          	mov    0x4(%r9),%esi
   2c87a:	4c 89 ef             	mov    %r13,%rdi
   2c87d:	83 fa 04             	cmp    $0x4,%edx
   2c880:	0f 84 b1 36 00 00    	je     2ff37 <JS_CallInternal+0xac27>
   2c886:	e8 65 8c 00 00       	call   354f0 <JS_ThrowTypeErrorReadOnly.part.0>
   2c88b:	e9 c0 91 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2c890:	48 89 ce             	mov    %rcx,%rsi
   2c893:	4c 89 ef             	mov    %r13,%rdi
   2c896:	4c 89 95 20 fe ff ff 	mov    %r10,-0x1e0(%rbp)
   2c89d:	4c 89 85 00 fe ff ff 	mov    %r8,-0x200(%rbp)
   2c8a4:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   2c8ab:	4c 89 8d e8 fd ff ff 	mov    %r9,-0x218(%rbp)
   2c8b2:	e8 59 0c 01 00       	call   3d510 <expand_fast_array>
   2c8b7:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   2c8be:	4c 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%r8
   2c8c5:	83 f8 ff             	cmp    $0xffffffff,%eax
   2c8c8:	4c 8b 95 20 fe ff ff 	mov    -0x1e0(%rbp),%r10
   2c8cf:	4c 8b 8d e8 fd ff ff 	mov    -0x218(%rbp),%r9
   2c8d6:	0f 84 74 2a 00 00    	je     2f350 <JS_CallInternal+0xa040>
   2c8dc:	8b 85 30 fe ff ff    	mov    -0x1d0(%rbp),%eax
   2c8e2:	89 41 38             	mov    %eax,0x38(%rcx)
   2c8e5:	31 c0                	xor    %eax,%eax
   2c8e7:	0f 1f 00             	nopl   (%rax)
   2c8ea:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2c8f1:	00 00 00 00 
   2c8f5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2c8fc:	00 00 00 00 
   2c900:	f3 41 0f 6f 04 00    	movdqu (%r8,%rax,1),%xmm0
   2c906:	48 8b 51 30          	mov    0x30(%rcx),%rdx
   2c90a:	0f 11 04 02          	movups %xmm0,(%rdx,%rax,1)
   2c90e:	48 83 c0 10          	add    $0x10,%rax
   2c912:	4c 39 c8             	cmp    %r9,%rax
   2c915:	75 e9                	jne    2c900 <JS_CallInternal+0x75f0>
   2c917:	48 8b 51 20          	mov    0x20(%rcx),%rdx
   2c91b:	48 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%rbx
   2c922:	48 8b 42 08          	mov    0x8(%rdx),%rax
   2c926:	48 8b 32             	mov    (%rdx),%rsi
   2c929:	48 c7 42 08 00 00 00 	movq   $0x0,0x8(%rdx)
   2c930:	00 
   2c931:	48 89 1a             	mov    %rbx,(%rdx)
   2c934:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2c937:	0f 86 2e 9d ff ff    	jbe    2666b <JS_CallInternal+0x135b>
   2c93d:	8b 5e fc             	mov    -0x4(%rsi),%ebx
   2c940:	8d 53 ff             	lea    -0x1(%rbx),%edx
   2c943:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2c946:	85 d2                	test   %edx,%edx
   2c948:	0f 8f 1d 9d ff ff    	jg     2666b <JS_CallInternal+0x135b>
   2c94e:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2c952:	48 89 c2             	mov    %rax,%rdx
   2c955:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   2c95c:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   2c963:	4c 89 85 30 fe ff ff 	mov    %r8,-0x1d0(%rbp)
   2c96a:	e8 01 1f ff ff       	call   1e870 <__JS_FreeValueRT>
   2c96f:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   2c976:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   2c97d:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2c984:	e9 e2 9c ff ff       	jmp    2666b <JS_CallInternal+0x135b>
   2c989:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2c990:	48 8d 7b f0          	lea    -0x10(%rbx),%rdi
   2c994:	41 b9 00 80 00 00    	mov    $0x8000,%r9d
   2c99a:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2c99e:	48 8d 43 e0          	lea    -0x20(%rbx),%rax
   2c9a2:	48 8b 08             	mov    (%rax),%rcx
   2c9a5:	48 83 eb 30          	sub    $0x30,%rbx
   2c9a9:	4c 8b 40 08          	mov    0x8(%rax),%r8
   2c9ad:	48 8b 33             	mov    (%rbx),%rsi
   2c9b0:	48 8b 53 08          	mov    0x8(%rbx),%rdx
   2c9b4:	ff 77 08             	push   0x8(%rdi)
   2c9b7:	ff 37                	push   (%rdi)
   2c9b9:	4c 89 ef             	mov    %r13,%rdi
   2c9bc:	e8 2f 52 00 00       	call   31bf0 <JS_SetPropertyValue>
   2c9c1:	41 59                	pop    %r9
   2c9c3:	41 5a                	pop    %r10
   2c9c5:	41 89 c7             	mov    %eax,%r15d
   2c9c8:	48 8b 43 08          	mov    0x8(%rbx),%rax
   2c9cc:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2c9cf:	76 14                	jbe    2c9e5 <JS_CallInternal+0x76d5>
   2c9d1:	48 8b 0b             	mov    (%rbx),%rcx
   2c9d4:	8b 71 fc             	mov    -0x4(%rcx),%esi
   2c9d7:	8d 56 ff             	lea    -0x1(%rsi),%edx
   2c9da:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2c9dd:	85 d2                	test   %edx,%edx
   2c9df:	0f 8e ae 28 00 00    	jle    2f293 <JS_CallInternal+0x9f83>
   2c9e5:	45 85 ff             	test   %r15d,%r15d
   2c9e8:	0f 89 a0 a1 ff ff    	jns    26b8e <JS_CallInternal+0x187e>
   2c9ee:	4d 89 e7             	mov    %r12,%r15
   2c9f1:	e9 5a 90 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2c9f6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   2c9fd:	00 00 00 
   2ca00:	48 8b 8d b8 fe ff ff 	mov    -0x148(%rbp),%rcx
   2ca07:	48 92                	xchg   %rax,%rdx
   2ca09:	4c 89 fe             	mov    %r15,%rsi
   2ca0c:	4c 89 ef             	mov    %r13,%rdi
   2ca0f:	49 89 d0             	mov    %rdx,%r8
   2ca12:	4c 89 ca             	mov    %r9,%rdx
   2ca15:	4c 89 8d 30 fe ff ff 	mov    %r9,-0x1d0(%rbp)
   2ca1c:	4c 89 61 30          	mov    %r12,0x30(%rcx)
   2ca20:	48 89 c1             	mov    %rax,%rcx
   2ca23:	e8 08 3e 00 00       	call   30830 <JS_GetPropertyValue>
   2ca28:	48 89 c1             	mov    %rax,%rcx
   2ca2b:	48 89 d0             	mov    %rdx,%rax
   2ca2e:	83 fa 06             	cmp    $0x6,%edx
   2ca31:	0f 84 72 2d 00 00    	je     2f7a9 <JS_CallInternal+0xa499>
   2ca37:	4c 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9
   2ca3e:	e9 1d a4 ff ff       	jmp    26e60 <JS_CallInternal+0x1b50>
   2ca43:	8b 00                	mov    (%rax),%eax
   2ca45:	25 ff ff ff 03       	and    $0x3ffffff,%eax
   2ca4a:	0f 85 3f 90 ff ff    	jne    25a8f <JS_CallInternal+0x77f>
   2ca50:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2ca57:	48 83 ec 08          	sub    $0x8,%rsp
   2ca5b:	31 c9                	xor    %ecx,%ecx
   2ca5d:	45 31 c9             	xor    %r9d,%r9d
   2ca60:	45 31 c0             	xor    %r8d,%r8d
   2ca63:	4c 89 ef             	mov    %r13,%rdi
   2ca66:	4c 89 78 30          	mov    %r15,0x30(%rax)
   2ca6a:	48 8b 85 b0 fe ff ff 	mov    -0x150(%rbp),%rax
   2ca71:	48 8b b0 d8 04 00 00 	mov    0x4d8(%rax),%rsi
   2ca78:	48 8b 90 e0 04 00 00 	mov    0x4e0(%rax),%rdx
   2ca7f:	6a 00                	push   $0x0
   2ca81:	e8 ba 69 00 00       	call   33440 <build_backtrace>
   2ca86:	59                   	pop    %rcx
   2ca87:	5e                   	pop    %rsi
   2ca88:	e9 14 90 ff ff       	jmp    25aa1 <JS_CallInternal+0x791>
   2ca8d:	48 8b bd b8 fe ff ff 	mov    -0x148(%rbp),%rdi
   2ca94:	49 89 d1             	mov    %rdx,%r9
   2ca97:	49 89 f2             	mov    %rsi,%r10
   2ca9a:	48 89 ca             	mov    %rcx,%rdx
   2ca9d:	49 89 d0             	mov    %rdx,%r8
   2caa0:	48 89 c1             	mov    %rax,%rcx
   2caa3:	4c 89 ce             	mov    %r9,%rsi
   2caa6:	4c 89 d2             	mov    %r10,%rdx
   2caa9:	4c 89 67 30          	mov    %r12,0x30(%rdi)
   2caad:	4c 89 ef             	mov    %r13,%rdi
   2cab0:	e8 7b 3d 00 00       	call   30830 <JS_GetPropertyValue>
   2cab5:	48 89 c1             	mov    %rax,%rcx
   2cab8:	48 89 d0             	mov    %rdx,%rax
   2cabb:	83 fa 06             	cmp    $0x6,%edx
   2cabe:	0f 84 6a 31 00 00    	je     2fc2e <JS_CallInternal+0xa91e>
   2cac4:	48 89 ca             	mov    %rcx,%rdx
   2cac7:	e9 19 a0 ff ff       	jmp    26ae5 <JS_CallInternal+0x17d5>
   2cacc:	41 8b 4c 24 01       	mov    0x1(%r12),%ecx
   2cad1:	49 8d 4c 0c 01       	lea    0x1(%r12,%rcx,1),%rcx
   2cad6:	66 83 7a 12 01       	cmpw   $0x1,0x12(%rdx)
   2cadb:	0f 85 48 ac ff ff    	jne    27729 <JS_CallInternal+0x2419>
   2cae1:	f6 42 10 08          	testb  $0x8,0x10(%rdx)
   2cae5:	0f 85 3e ac ff ff    	jne    27729 <JS_CallInternal+0x2419>
   2caeb:	48 8b 72 18          	mov    0x18(%rdx),%rsi
   2caef:	48 39 31             	cmp    %rsi,(%rcx)
   2caf2:	0f 85 31 ac ff ff    	jne    27729 <JS_CallInternal+0x2419>
   2caf8:	8b 41 10             	mov    0x10(%rcx),%eax
   2cafb:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   2caff:	48 c1 e0 04          	shl    $0x4,%rax
   2cb03:	48 03 42 20          	add    0x20(%rdx),%rax
   2cb07:	48 8b 10             	mov    (%rax),%rdx
   2cb0a:	48 8b 40 08          	mov    0x8(%rax),%rax
   2cb0e:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2cb11:	76 04                	jbe    2cb17 <JS_CallInternal+0x7807>
   2cb13:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2cb17:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2cb1b:	49 8d 44 24 05       	lea    0x5(%r12),%rax
   2cb20:	48 89 13             	mov    %rdx,(%rbx)
   2cb23:	48 89 cb             	mov    %rcx,%rbx
   2cb26:	e9 18 ac ff ff       	jmp    27743 <JS_CallInternal+0x2433>
   2cb2b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2cb30:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   2cb37:	48 c7 43 08 01 00 00 	movq   $0x1,0x8(%rbx)
   2cb3e:	00 
   2cb3f:	e9 34 c9 ff ff       	jmp    29478 <JS_CallInternal+0x4168>
   2cb44:	31 c9                	xor    %ecx,%ecx
   2cb46:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   2cb4c:	e9 81 c6 ff ff       	jmp    291d2 <JS_CallInternal+0x3ec2>
   2cb51:	31 c9                	xor    %ecx,%ecx
   2cb53:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   2cb59:	e9 7f b3 ff ff       	jmp    27edd <JS_CallInternal+0x2bcd>
   2cb5e:	48 8b b5 f0 fd ff ff 	mov    -0x210(%rbp),%rsi
   2cb65:	45 89 d9             	mov    %r11d,%r9d
   2cb68:	31 c9                	xor    %ecx,%ecx
   2cb6a:	4c 89 ef             	mov    %r13,%rdi
   2cb6d:	48 8b 95 20 fe ff ff 	mov    -0x1e0(%rbp),%rdx
   2cb74:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   2cb7a:	48 c7 85 80 fd ff ff 	movq   $0x0,-0x280(%rbp)
   2cb81:	00 00 00 00 
   2cb85:	48 c7 85 88 fd ff ff 	movq   $0x3,-0x278(%rbp)
   2cb8c:	03 00 00 00 
   2cb90:	6a 02                	push   $0x2
   2cb92:	41 52                	push   %r10
   2cb94:	4c 89 95 e8 fd ff ff 	mov    %r10,-0x218(%rbp)
   2cb9b:	ff b5 88 fd ff ff    	push   -0x278(%rbp)
   2cba1:	ff b5 80 fd ff ff    	push   -0x280(%rbp)
   2cba7:	44 89 9d 00 fe ff ff 	mov    %r11d,-0x200(%rbp)
   2cbae:	e8 5d 87 ff ff       	call   25310 <JS_CallInternal>
   2cbb3:	4c 8b 95 e8 fd ff ff 	mov    -0x218(%rbp),%r10
   2cbba:	44 8b 9d 00 fe ff ff 	mov    -0x200(%rbp),%r11d
   2cbc1:	48 83 c4 20          	add    $0x20,%rsp
   2cbc5:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   2cbcc:	48 89 95 10 fe ff ff 	mov    %rdx,-0x1f0(%rbp)
   2cbd3:	e9 4b b3 ff ff       	jmp    27f23 <JS_CallInternal+0x2c13>
   2cbd8:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2cbdf:	48 89 de             	mov    %rbx,%rsi
   2cbe2:	4c 89 ef             	mov    %r13,%rdi
   2cbe5:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2cbe9:	e8 82 5c 02 00       	call   52870 <js_not_slow>
   2cbee:	85 c0                	test   %eax,%eax
   2cbf0:	0f 84 57 d4 ff ff    	je     2a04d <JS_CallInternal+0x4d3d>
   2cbf6:	4d 89 e7             	mov    %r12,%r15
   2cbf9:	e9 52 8e ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2cbfe:	66 90                	xchg   %ax,%ax
   2cc00:	48 c7 85 70 fd ff ff 	movq   $0x0,-0x290(%rbp)
   2cc07:	00 00 00 00 
   2cc0b:	48 8b b5 20 fe ff ff 	mov    -0x1e0(%rbp),%rsi
   2cc12:	31 c9                	xor    %ecx,%ecx
   2cc14:	4c 89 ef             	mov    %r13,%rdi
   2cc17:	44 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9d
   2cc1e:	48 8b 95 e8 fd ff ff 	mov    -0x218(%rbp),%rdx
   2cc25:	48 c7 85 78 fd ff ff 	movq   $0x3,-0x288(%rbp)
   2cc2c:	03 00 00 00 
   2cc30:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   2cc36:	6a 00                	push   $0x0
   2cc38:	41 52                	push   %r10
   2cc3a:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   2cc41:	ff b5 78 fd ff ff    	push   -0x288(%rbp)
   2cc47:	ff b5 70 fd ff ff    	push   -0x290(%rbp)
   2cc4d:	e8 be 86 ff ff       	call   25310 <JS_CallInternal>
   2cc52:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   2cc59:	48 83 c4 20          	add    $0x20,%rsp
   2cc5d:	48 89 c6             	mov    %rax,%rsi
   2cc60:	e9 9b c5 ff ff       	jmp    29200 <JS_CallInternal+0x3ef0>
   2cc65:	48 89 c6             	mov    %rax,%rsi
   2cc68:	4c 89 ef             	mov    %r13,%rdi
   2cc6b:	e8 30 41 ff ff       	call   20da0 <JS_ToBoolFree>
   2cc70:	e9 25 a4 ff ff       	jmp    2709a <JS_CallInternal+0x1d8a>
   2cc75:	48 89 c6             	mov    %rax,%rsi
   2cc78:	4c 89 ef             	mov    %r13,%rdi
   2cc7b:	e8 20 41 ff ff       	call   20da0 <JS_ToBoolFree>
   2cc80:	e9 b7 a3 ff ff       	jmp    2703c <JS_CallInternal+0x1d2c>
   2cc85:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2cc8c:	4c 89 ca             	mov    %r9,%rdx
   2cc8f:	4c 89 d1             	mov    %r10,%rcx
   2cc92:	4d 89 f8             	mov    %r15,%r8
   2cc95:	4c 89 ef             	mov    %r13,%rdi
   2cc98:	4c 89 8d 00 fe ff ff 	mov    %r9,-0x200(%rbp)
   2cc9f:	48 89 c6             	mov    %rax,%rsi
   2cca2:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   2cca9:	4c 89 bd 18 fe ff ff 	mov    %r15,-0x1e8(%rbp)
   2ccb0:	e8 8b 78 00 00       	call   34540 <JS_CheckBrand>
   2ccb5:	83 f8 ff             	cmp    $0xffffffff,%eax
   2ccb8:	0f 84 42 34 00 00    	je     30100 <JS_CallInternal+0xadf0>
   2ccbe:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   2ccc5:	4c 8b 9d 18 fe ff ff 	mov    -0x1e8(%rbp),%r11
   2cccc:	48 63 c8             	movslq %eax,%rcx
   2cccf:	4c 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%r9
   2ccd6:	e9 19 ce ff ff       	jmp    29af4 <JS_CallInternal+0x47e4>
   2ccdb:	41 8b 4c 24 01       	mov    0x1(%r12),%ecx
   2cce0:	49 8d 4c 0c 01       	lea    0x1(%r12,%rcx,1),%rcx
   2cce5:	66 83 7a 12 01       	cmpw   $0x1,0x12(%rdx)
   2ccea:	0f 85 f8 ae ff ff    	jne    27be8 <JS_CallInternal+0x28d8>
   2ccf0:	f6 42 10 08          	testb  $0x8,0x10(%rdx)
   2ccf4:	0f 85 ee ae ff ff    	jne    27be8 <JS_CallInternal+0x28d8>
   2ccfa:	48 8b 72 18          	mov    0x18(%rdx),%rsi
   2ccfe:	48 39 31             	cmp    %rsi,(%rcx)
   2cd01:	0f 85 e1 ae ff ff    	jne    27be8 <JS_CallInternal+0x28d8>
   2cd07:	8b 41 10             	mov    0x10(%rcx),%eax
   2cd0a:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   2cd0e:	48 c1 e0 04          	shl    $0x4,%rax
   2cd12:	48 03 42 20          	add    0x20(%rdx),%rax
   2cd16:	48 8b 10             	mov    (%rax),%rdx
   2cd19:	48 8b 40 08          	mov    0x8(%rax),%rax
   2cd1d:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2cd20:	76 04                	jbe    2cd26 <JS_CallInternal+0x7a16>
   2cd22:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2cd26:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2cd2a:	49 8d 44 24 05       	lea    0x5(%r12),%rax
   2cd2f:	48 89 13             	mov    %rdx,(%rbx)
   2cd32:	48 89 cb             	mov    %rcx,%rbx
   2cd35:	e9 c8 ae ff ff       	jmp    27c02 <JS_CallInternal+0x28f2>
   2cd3a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   2cd40:	48 89 c6             	mov    %rax,%rsi
   2cd43:	4c 89 ef             	mov    %r13,%rdi
   2cd46:	e8 55 40 ff ff       	call   20da0 <JS_ToBoolFree>
   2cd4b:	e9 4c df ff ff       	jmp    2ac9c <JS_CallInternal+0x598c>
   2cd50:	48 89 c6             	mov    %rax,%rsi
   2cd53:	4c 89 ef             	mov    %r13,%rdi
   2cd56:	e8 45 40 ff ff       	call   20da0 <JS_ToBoolFree>
   2cd5b:	e9 df de ff ff       	jmp    2ac3f <JS_CallInternal+0x592f>
   2cd60:	8b 10                	mov    (%rax),%edx
   2cd62:	81 e2 ff ff ff 03    	and    $0x3ffffff,%edx
   2cd68:	0f 85 db e8 ff ff    	jne    2b649 <JS_CallInternal+0x6339>
   2cd6e:	48 83 ec 08          	sub    $0x8,%rsp
   2cd72:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2cd76:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2cd7a:	4c 89 da             	mov    %r11,%rdx
   2cd7d:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2cd84:	4c 89 9d 30 fe ff ff 	mov    %r11,-0x1d0(%rbp)
   2cd8b:	4c 89 d6             	mov    %r10,%rsi
   2cd8e:	4c 89 ef             	mov    %r13,%rdi
   2cd91:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   2cd98:	4c 89 78 30          	mov    %r15,0x30(%rax)
   2cd9c:	68 00 80 00 00       	push   $0x8000
   2cda1:	41 53                	push   %r11
   2cda3:	41 52                	push   %r10
   2cda5:	e8 96 41 00 00       	call   30f40 <JS_SetPropertyInternal>
   2cdaa:	4c 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%r11
   2cdb1:	48 83 c4 20          	add    $0x20,%rsp
   2cdb5:	41 83 fb f6          	cmp    $0xfffffff6,%r11d
   2cdb9:	76 1a                	jbe    2cdd5 <JS_CallInternal+0x7ac5>
   2cdbb:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   2cdc2:	41 8b 4a fc          	mov    -0x4(%r10),%ecx
   2cdc6:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2cdc9:	41 89 52 fc          	mov    %edx,-0x4(%r10)
   2cdcd:	85 d2                	test   %edx,%edx
   2cdcf:	0f 8e b3 23 00 00    	jle    2f188 <JS_CallInternal+0x9e78>
   2cdd5:	48 83 eb 20          	sub    $0x20,%rbx
   2cdd9:	85 c0                	test   %eax,%eax
   2cddb:	0f 89 dc e8 ff ff    	jns    2b6bd <JS_CallInternal+0x63ad>
   2cde1:	e9 6a 8c ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2cde6:	48 92                	xchg   %rax,%rdx
   2cde8:	4c 89 ef             	mov    %r13,%rdi
   2cdeb:	48 89 c6             	mov    %rax,%rsi
   2cdee:	e8 ad 3f ff ff       	call   20da0 <JS_ToBoolFree>
   2cdf3:	e9 c6 b1 ff ff       	jmp    27fbe <JS_CallInternal+0x2cae>
   2cdf8:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2cdfc:	48 8b 87 48 04 00 00 	mov    0x448(%rdi),%rax
   2ce03:	48 8b 34 c8          	mov    (%rax,%rcx,8),%rsi
   2ce07:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2ce0a:	83 e8 01             	sub    $0x1,%eax
   2ce0d:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2ce10:	85 c0                	test   %eax,%eax
   2ce12:	0f 8f c8 c8 ff ff    	jg     296e0 <JS_CallInternal+0x43d0>
   2ce18:	44 89 85 f0 fd ff ff 	mov    %r8d,-0x210(%rbp)
   2ce1f:	e8 7c 9b fe ff       	call   169a0 <JS_FreeAtomStruct>
   2ce24:	44 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8d
   2ce2b:	e9 b0 c8 ff ff       	jmp    296e0 <JS_CallInternal+0x43d0>
   2ce30:	8b 10                	mov    (%rax),%edx
   2ce32:	81 e2 ff ff ff 03    	and    $0x3ffffff,%edx
   2ce38:	0f 85 dd a3 ff ff    	jne    2721b <JS_CallInternal+0x1f0b>
   2ce3e:	49 8b b5 80 01 00 00 	mov    0x180(%r13),%rsi
   2ce45:	49 8b 95 88 01 00 00 	mov    0x188(%r13),%rdx
   2ce4c:	4c 89 ef             	mov    %r13,%rdi
   2ce4f:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2ce55:	e8 46 34 04 00       	call   702a0 <JS_HasProperty>
   2ce5a:	85 c0                	test   %eax,%eax
   2ce5c:	0f 88 ee 8b ff ff    	js     25a50 <JS_CallInternal+0x740>
   2ce62:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2ce68:	b8 01 00 00 00       	mov    $0x1,%eax
   2ce6d:	0f 84 bb a3 ff ff    	je     2722e <JS_CallInternal+0x1f1e>
   2ce73:	49 8b b5 80 01 00 00 	mov    0x180(%r13),%rsi
   2ce7a:	49 8b 95 88 01 00 00 	mov    0x188(%r13),%rdx
   2ce81:	45 31 c0             	xor    %r8d,%r8d
   2ce84:	4c 89 ef             	mov    %r13,%rdi
   2ce87:	e8 24 11 02 00       	call   4dfb0 <JS_DeleteProperty>
   2ce8c:	85 c0                	test   %eax,%eax
   2ce8e:	0f 88 bc 8b ff ff    	js     25a50 <JS_CallInternal+0x740>
   2ce94:	0f 95 c0             	setne  %al
   2ce97:	0f b6 c0             	movzbl %al,%eax
   2ce9a:	e9 8f a3 ff ff       	jmp    2722e <JS_CallInternal+0x1f1e>
   2ce9f:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2cea3:	89 c8                	mov    %ecx,%eax
   2cea5:	48 8b 97 48 04 00 00 	mov    0x448(%rdi),%rdx
   2ceac:	48 8b 34 c2          	mov    (%rdx,%rax,8),%rsi
   2ceb0:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2ceb3:	83 e8 01             	sub    $0x1,%eax
   2ceb6:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2ceb9:	85 c0                	test   %eax,%eax
   2cebb:	0f 8f a9 9e ff ff    	jg     26d6a <JS_CallInternal+0x1a5a>
   2cec1:	4c 89 9d f0 fd ff ff 	mov    %r11,-0x210(%rbp)
   2cec8:	e8 d3 9a fe ff       	call   169a0 <JS_FreeAtomStruct>
   2cecd:	4c 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%r11
   2ced4:	e9 91 9e ff ff       	jmp    26d6a <JS_CallInternal+0x1a5a>
   2ced9:	f6 40 10 08          	testb  $0x8,0x10(%rax)
   2cedd:	0f 85 d0 e2 ff ff    	jne    2b1b3 <JS_CallInternal+0x5ea3>
   2cee3:	49 39 3a             	cmp    %rdi,(%r10)
   2cee6:	0f 85 c7 e2 ff ff    	jne    2b1b3 <JS_CallInternal+0x5ea3>
   2ceec:	41 8b 52 10          	mov    0x10(%r10),%edx
   2cef0:	83 fa ff             	cmp    $0xffffffff,%edx
   2cef3:	0f 84 ba e2 ff ff    	je     2b1b3 <JS_CallInternal+0x5ea3>
   2cef9:	48 c1 e2 04          	shl    $0x4,%rdx
   2cefd:	48 03 50 20          	add    0x20(%rax),%rdx
   2cf01:	48 89 d0             	mov    %rdx,%rax
   2cf04:	48 8b 12             	mov    (%rdx),%rdx
   2cf07:	48 8b 48 08          	mov    0x8(%rax),%rcx
   2cf0b:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   2cf0e:	76 04                	jbe    2cf14 <JS_CallInternal+0x7c04>
   2cf10:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2cf14:	49 89 d7             	mov    %rdx,%r15
   2cf17:	e9 05 e3 ff ff       	jmp    2b221 <JS_CallInternal+0x5f11>
   2cf1c:	0f 1f 40 00          	nopl   0x0(%rax)
   2cf20:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2cf24:	44 89 c8             	mov    %r9d,%eax
   2cf27:	48 8b 97 48 04 00 00 	mov    0x448(%rdi),%rdx
   2cf2e:	48 8b 34 c2          	mov    (%rdx,%rax,8),%rsi
   2cf32:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2cf35:	83 e8 01             	sub    $0x1,%eax
   2cf38:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2cf3b:	85 c0                	test   %eax,%eax
   2cf3d:	0f 8f 96 a3 ff ff    	jg     272d9 <JS_CallInternal+0x1fc9>
   2cf43:	89 8d f0 fd ff ff    	mov    %ecx,-0x210(%rbp)
   2cf49:	e8 52 9a fe ff       	call   169a0 <JS_FreeAtomStruct>
   2cf4e:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   2cf54:	e9 80 a3 ff ff       	jmp    272d9 <JS_CallInternal+0x1fc9>
   2cf59:	41 f6 42 10 08       	testb  $0x8,0x10(%r10)
   2cf5e:	0f 85 7f e1 ff ff    	jne    2b0e3 <JS_CallInternal+0x5dd3>
   2cf64:	49 8b 49 08          	mov    0x8(%r9),%rcx
   2cf68:	49 8b 11             	mov    (%r9),%rdx
   2cf6b:	48 85 c9             	test   %rcx,%rcx
   2cf6e:	0f 84 60 24 00 00    	je     2f3d4 <JS_CallInternal+0xa0c4>
   2cf74:	49 8b 43 30          	mov    0x30(%r11),%rax
   2cf78:	4c 39 da             	cmp    %r11,%rdx
   2cf7b:	0f 85 62 e1 ff ff    	jne    2b0e3 <JS_CallInternal+0x5dd3>
   2cf81:	48 85 c0             	test   %rax,%rax
   2cf84:	0f 84 59 e1 ff ff    	je     2b0e3 <JS_CallInternal+0x5dd3>
   2cf8a:	66 83 78 12 01       	cmpw   $0x1,0x12(%rax)
   2cf8f:	0f 85 4e e1 ff ff    	jne    2b0e3 <JS_CallInternal+0x5dd3>
   2cf95:	f6 40 10 08          	testb  $0x8,0x10(%rax)
   2cf99:	0f 85 44 e1 ff ff    	jne    2b0e3 <JS_CallInternal+0x5dd3>
   2cf9f:	48 3b 48 18          	cmp    0x18(%rax),%rcx
   2cfa3:	0f 85 3a e1 ff ff    	jne    2b0e3 <JS_CallInternal+0x5dd3>
   2cfa9:	41 8b 51 10          	mov    0x10(%r9),%edx
   2cfad:	48 c1 e2 04          	shl    $0x4,%rdx
   2cfb1:	48 03 50 20          	add    0x20(%rax),%rdx
   2cfb5:	48 89 d0             	mov    %rdx,%rax
   2cfb8:	48 8b 12             	mov    (%rdx),%rdx
   2cfbb:	48 8b 40 08          	mov    0x8(%rax),%rax
   2cfbf:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2cfc2:	76 04                	jbe    2cfc8 <JS_CallInternal+0x7cb8>
   2cfc4:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2cfc8:	49 89 d7             	mov    %rdx,%r15
   2cfcb:	e9 8e e1 ff ff       	jmp    2b15e <JS_CallInternal+0x5e4e>
   2cfd0:	41 83 ff fa          	cmp    $0xfffffffa,%r15d
   2cfd4:	7d 06                	jge    2cfdc <JS_CallInternal+0x7ccc>
   2cfd6:	41 83 ff f8          	cmp    $0xfffffff8,%r15d
   2cfda:	7d 63                	jge    2d03f <JS_CallInternal+0x7d2f>
   2cfdc:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2cfe0:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2cfe4:	b9 01 00 00 00       	mov    $0x1,%ecx
   2cfe9:	4c 89 ef             	mov    %r13,%rdi
   2cfec:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2cff3:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2cff7:	e8 34 69 01 00       	call   43930 <JS_ToStringInternal>
   2cffc:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2d003:	49 89 d7             	mov    %rdx,%r15
   2d006:	48 89 d0             	mov    %rdx,%rax
   2d009:	83 fa 06             	cmp    $0x6,%edx
   2d00c:	0f 84 79 2d 00 00    	je     2fd8b <JS_CallInternal+0xaa7b>
   2d012:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   2d016:	83 fe f6             	cmp    $0xfffffff6,%esi
   2d019:	76 15                	jbe    2d030 <JS_CallInternal+0x7d20>
   2d01b:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   2d01f:	8b 4f fc             	mov    -0x4(%rdi),%ecx
   2d022:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2d025:	89 57 fc             	mov    %edx,-0x4(%rdi)
   2d028:	85 d2                	test   %edx,%edx
   2d02a:	0f 8e 63 2d 00 00    	jle    2fd93 <JS_CallInternal+0xaa83>
   2d030:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2d037:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2d03b:	48 89 4b f0          	mov    %rcx,-0x10(%rbx)
   2d03f:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2d046:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2d04a:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2d04e:	41 83 ff f6          	cmp    $0xfffffff6,%r15d
   2d052:	76 04                	jbe    2d058 <JS_CallInternal+0x7d48>
   2d054:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2d058:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   2d05c:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   2d060:	48 89 c1             	mov    %rax,%rcx
   2d063:	4d 89 f8             	mov    %r15,%r8
   2d066:	4c 89 ef             	mov    %r13,%rdi
   2d069:	4d 89 e7             	mov    %r12,%r15
   2d06c:	e8 bf 37 00 00       	call   30830 <JS_GetPropertyValue>
   2d071:	48 89 c1             	mov    %rax,%rcx
   2d074:	48 89 d0             	mov    %rdx,%rax
   2d077:	83 fa 06             	cmp    $0x6,%edx
   2d07a:	0f 84 d0 89 ff ff    	je     25a50 <JS_CallInternal+0x740>
   2d080:	48 89 ca             	mov    %rcx,%rdx
   2d083:	e9 2f 9c ff ff       	jmp    26cb7 <JS_CallInternal+0x19a7>
   2d088:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d08c:	48 8b 87 48 04 00 00 	mov    0x448(%rdi),%rax
   2d093:	48 8b 34 c8          	mov    (%rax,%rcx,8),%rsi
   2d097:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2d09a:	83 e8 01             	sub    $0x1,%eax
   2d09d:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2d0a0:	85 c0                	test   %eax,%eax
   2d0a2:	0f 8f 4e 98 ff ff    	jg     268f6 <JS_CallInternal+0x15e6>
   2d0a8:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   2d0af:	e8 ec 98 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2d0b4:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   2d0bb:	e9 36 98 ff ff       	jmp    268f6 <JS_CallInternal+0x15e6>
   2d0c0:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d0c4:	48 8b 87 48 04 00 00 	mov    0x448(%rdi),%rax
   2d0cb:	48 8b 34 c8          	mov    (%rax,%rcx,8),%rsi
   2d0cf:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2d0d2:	83 e8 01             	sub    $0x1,%eax
   2d0d5:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2d0d8:	85 c0                	test   %eax,%eax
   2d0da:	0f 8f 56 99 ff ff    	jg     26a36 <JS_CallInternal+0x1726>
   2d0e0:	4c 89 9d 30 fe ff ff 	mov    %r11,-0x1d0(%rbp)
   2d0e7:	e8 b4 98 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2d0ec:	4c 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%r11
   2d0f3:	e9 3e 99 ff ff       	jmp    26a36 <JS_CallInternal+0x1726>
   2d0f8:	48 8d 35 4a c4 0a 00 	lea    0xac44a(%rip),%rsi        # d9549 <_IO_stdin_used+0x549>
   2d0ff:	4c 89 ef             	mov    %r13,%rdi
   2d102:	31 c0                	xor    %eax,%eax
   2d104:	e8 87 70 00 00       	call   34190 <JS_ThrowTypeError>
   2d109:	4c 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8
   2d110:	83 fb f6             	cmp    $0xfffffff6,%ebx
   2d113:	76 1e                	jbe    2d133 <JS_CallInternal+0x7e23>
   2d115:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2d11c:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2d11f:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   2d125:	83 e8 01             	sub    $0x1,%eax
   2d128:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2d12b:	85 c0                	test   %eax,%eax
   2d12d:	0f 8e 85 29 00 00    	jle    2fab8 <JS_CallInternal+0xa7a8>
   2d133:	83 bd 00 fe ff ff f6 	cmpl   $0xfffffff6,-0x200(%rbp)
   2d13a:	76 1e                	jbe    2d15a <JS_CallInternal+0x7e4a>
   2d13c:	48 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%rbx
   2d143:	8b 43 fc             	mov    -0x4(%rbx),%eax
   2d146:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2d14c:	83 e8 01             	sub    $0x1,%eax
   2d14f:	89 43 fc             	mov    %eax,-0x4(%rbx)
   2d152:	85 c0                	test   %eax,%eax
   2d154:	0f 8e 80 29 00 00    	jle    2fada <JS_CallInternal+0xa7ca>
   2d15a:	ba 06 00 00 00       	mov    $0x6,%edx
   2d15f:	31 c0                	xor    %eax,%eax
   2d161:	e9 91 ac ff ff       	jmp    27df7 <JS_CallInternal+0x2ae7>
   2d166:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2d16d:	ba 01 00 00 00       	mov    $0x1,%edx
   2d172:	48 89 de             	mov    %rbx,%rsi
   2d175:	4c 89 ef             	mov    %r13,%rdi
   2d178:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2d17c:	e8 cf fc 02 00       	call   5ce50 <js_eq_slow>
   2d181:	85 c0                	test   %eax,%eax
   2d183:	0f 84 c8 c6 ff ff    	je     29851 <JS_CallInternal+0x4541>
   2d189:	4d 89 e7             	mov    %r12,%r15
   2d18c:	e9 bf 88 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2d191:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   2d198:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2d19f:	31 d2                	xor    %edx,%edx
   2d1a1:	48 89 de             	mov    %rbx,%rsi
   2d1a4:	4c 89 ef             	mov    %r13,%rdi
   2d1a7:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2d1ab:	e8 a0 fc 02 00       	call   5ce50 <js_eq_slow>
   2d1b0:	85 c0                	test   %eax,%eax
   2d1b2:	0f 84 1b cc ff ff    	je     29dd3 <JS_CallInternal+0x4ac3>
   2d1b8:	4d 89 e7             	mov    %r12,%r15
   2d1bb:	e9 90 88 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2d1c0:	48 8b 95 b8 fe ff ff 	mov    -0x148(%rbp),%rdx
   2d1c7:	48 8b bd b0 fe ff ff 	mov    -0x150(%rbp),%rdi
   2d1ce:	48 89 8d a8 fe ff ff 	mov    %rcx,-0x158(%rbp)
   2d1d5:	48 89 85 c8 fe ff ff 	mov    %rax,-0x138(%rbp)
   2d1dc:	e8 1f 55 ff ff       	call   22700 <close_var_refs>
   2d1e1:	48 8b 8d a8 fe ff ff 	mov    -0x158(%rbp),%rcx
   2d1e8:	48 8b 85 c8 fe ff ff 	mov    -0x138(%rbp),%rax
   2d1ef:	e9 30 89 ff ff       	jmp    25b24 <JS_CallInternal+0x814>
   2d1f4:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d1f8:	48 89 c2             	mov    %rax,%rdx
   2d1fb:	89 8d 00 fe ff ff    	mov    %ecx,-0x200(%rbp)
   2d201:	e8 6a 16 ff ff       	call   1e870 <__JS_FreeValueRT>
   2d206:	8b 8d 00 fe ff ff    	mov    -0x200(%rbp),%ecx
   2d20c:	e9 a4 8f ff ff       	jmp    261b5 <JS_CallInternal+0xea5>
   2d211:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d215:	48 8b b7 48 04 00 00 	mov    0x448(%rdi),%rsi
   2d21c:	48 8b 34 ce          	mov    (%rsi,%rcx,8),%rsi
   2d220:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   2d223:	83 e9 01             	sub    $0x1,%ecx
   2d226:	89 4e fc             	mov    %ecx,-0x4(%rsi)
   2d229:	85 c9                	test   %ecx,%ecx
   2d22b:	0f 8f 06 9a ff ff    	jg     26c37 <JS_CallInternal+0x1927>
   2d231:	48 89 95 10 fe ff ff 	mov    %rdx,-0x1f0(%rbp)
   2d238:	48 89 95 30 fe ff ff 	mov    %rdx,-0x1d0(%rbp)
   2d23f:	e8 5c 97 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2d244:	48 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%rdx
   2d24b:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2d252:	e9 e0 99 ff ff       	jmp    26c37 <JS_CallInternal+0x1927>
   2d257:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2d25e:	44 89 d2             	mov    %r10d,%edx
   2d261:	48 89 de             	mov    %rbx,%rsi
   2d264:	4c 89 ef             	mov    %r13,%rdi
   2d267:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2d26b:	e8 70 50 02 00       	call   522e0 <js_unary_arith_slow>
   2d270:	85 c0                	test   %eax,%eax
   2d272:	0f 84 5e d1 ff ff    	je     2a3d6 <JS_CallInternal+0x50c6>
   2d278:	4d 89 e7             	mov    %r12,%r15
   2d27b:	e9 d0 87 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2d280:	45 31 e4             	xor    %r12d,%r12d
   2d283:	e9 1e ea ff ff       	jmp    2bca6 <JS_CallInternal+0x6996>
   2d288:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d28c:	48 89 ce             	mov    %rcx,%rsi
   2d28f:	e8 dc 15 ff ff       	call   1e870 <__JS_FreeValueRT>
   2d294:	e9 b5 90 ff ff       	jmp    2634e <JS_CallInternal+0x103e>
   2d299:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
   2d29e:	e9 f3 8e ff ff       	jmp    26196 <JS_CallInternal+0xe86>
   2d2a3:	41 83 f8 f6          	cmp    $0xfffffff6,%r8d
   2d2a7:	76 13                	jbe    2d2bc <JS_CallInternal+0x7fac>
   2d2a9:	41 8b 42 fc          	mov    -0x4(%r10),%eax
   2d2ad:	83 e8 01             	sub    $0x1,%eax
   2d2b0:	41 89 42 fc          	mov    %eax,-0x4(%r10)
   2d2b4:	85 c0                	test   %eax,%eax
   2d2b6:	0f 8e 84 2b 00 00    	jle    2fe40 <JS_CallInternal+0xab30>
   2d2bc:	45 31 ff             	xor    %r15d,%r15d
   2d2bf:	e9 24 c5 ff ff       	jmp    297e8 <JS_CallInternal+0x44d8>
   2d2c4:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d2c8:	8b 85 30 fe ff ff    	mov    -0x1d0(%rbp),%eax
   2d2ce:	48 8b 97 48 04 00 00 	mov    0x448(%rdi),%rdx
   2d2d5:	48 8b 34 c2          	mov    (%rdx,%rax,8),%rsi
   2d2d9:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2d2dc:	83 e8 01             	sub    $0x1,%eax
   2d2df:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2d2e2:	85 c0                	test   %eax,%eax
   2d2e4:	0f 8f 16 ef ff ff    	jg     2c200 <JS_CallInternal+0x6ef0>
   2d2ea:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2d2f0:	e8 ab 96 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2d2f5:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2d2fb:	e9 00 ef ff ff       	jmp    2c200 <JS_CallInternal+0x6ef0>
   2d300:	41 83 ff f6          	cmp    $0xfffffff6,%r15d
   2d304:	76 13                	jbe    2d319 <JS_CallInternal+0x8009>
   2d306:	41 8b 42 fc          	mov    -0x4(%r10),%eax
   2d30a:	83 e8 01             	sub    $0x1,%eax
   2d30d:	41 89 42 fc          	mov    %eax,-0x4(%r10)
   2d311:	85 c0                	test   %eax,%eax
   2d313:	0f 8e 4e 24 00 00    	jle    2f767 <JS_CallInternal+0xa457>
   2d319:	b8 01 00 00 00       	mov    $0x1,%eax
   2d31e:	e9 6e c4 ff ff       	jmp    29791 <JS_CallInternal+0x4481>
   2d323:	48 83 ec 08          	sub    $0x8,%rsp
   2d327:	48 8d 43 f0          	lea    -0x10(%rbx),%rax
   2d32b:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   2d331:	50                   	push   %rax
   2d332:	e9 c7 f4 ff ff       	jmp    2c7fe <JS_CallInternal+0x74ee>
   2d337:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2d33e:	44 89 d2             	mov    %r10d,%edx
   2d341:	48 89 de             	mov    %rbx,%rsi
   2d344:	4c 89 ef             	mov    %r13,%rdi
   2d347:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2d34b:	e8 90 4f 02 00       	call   522e0 <js_unary_arith_slow>
   2d350:	85 c0                	test   %eax,%eax
   2d352:	0f 84 c3 d0 ff ff    	je     2a41b <JS_CallInternal+0x510b>
   2d358:	4d 89 e7             	mov    %r12,%r15
   2d35b:	e9 f0 86 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2d360:	49 83 c7 01          	add    $0x1,%r15
   2d364:	e9 e7 86 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2d369:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d36d:	89 c0                	mov    %eax,%eax
   2d36f:	48 8b 97 48 04 00 00 	mov    0x448(%rdi),%rdx
   2d376:	48 8b 34 c2          	mov    (%rdx,%rax,8),%rsi
   2d37a:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2d37d:	83 e8 01             	sub    $0x1,%eax
   2d380:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2d383:	85 c0                	test   %eax,%eax
   2d385:	0f 8f 69 c7 ff ff    	jg     29af4 <JS_CallInternal+0x47e4>
   2d38b:	4c 89 95 f0 fd ff ff 	mov    %r10,-0x210(%rbp)
   2d392:	4c 89 9d f8 fd ff ff 	mov    %r11,-0x208(%rbp)
   2d399:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2d3a0:	4c 89 8d 10 fe ff ff 	mov    %r9,-0x1f0(%rbp)
   2d3a7:	e8 f4 95 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2d3ac:	4c 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%r10
   2d3b3:	4c 8b 9d f8 fd ff ff 	mov    -0x208(%rbp),%r11
   2d3ba:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2d3c1:	4c 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%r9
   2d3c8:	e9 27 c7 ff ff       	jmp    29af4 <JS_CallInternal+0x47e4>
   2d3cd:	49 8b 72 08          	mov    0x8(%r10),%rsi
   2d3d1:	83 fe f6             	cmp    $0xfffffff6,%esi
   2d3d4:	76 14                	jbe    2d3ea <JS_CallInternal+0x80da>
   2d3d6:	49 8b 3a             	mov    (%r10),%rdi
   2d3d9:	8b 57 fc             	mov    -0x4(%rdi),%edx
   2d3dc:	83 ea 01             	sub    $0x1,%edx
   2d3df:	89 57 fc             	mov    %edx,-0x4(%rdi)
   2d3e2:	85 d2                	test   %edx,%edx
   2d3e4:	0f 8e 30 1d 00 00    	jle    2f11a <JS_CallInternal+0x9e0a>
   2d3ea:	49 c7 02 00 00 00 00 	movq   $0x0,(%r10)
   2d3f1:	49 c7 42 08 03 00 00 	movq   $0x3,0x8(%r10)
   2d3f8:	00 
   2d3f9:	45 85 c0             	test   %r8d,%r8d
   2d3fc:	0f 88 4e 86 ff ff    	js     25a50 <JS_CallInternal+0x740>
   2d402:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2d405:	76 11                	jbe    2d418 <JS_CallInternal+0x8108>
   2d407:	8b 71 fc             	mov    -0x4(%rcx),%esi
   2d40a:	8d 56 ff             	lea    -0x1(%rsi),%edx
   2d40d:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2d410:	85 d2                	test   %edx,%edx
   2d412:	0f 8e 9b 21 00 00    	jle    2f5b3 <JS_CallInternal+0xa2a3>
   2d418:	44 8b 95 dc fe ff ff 	mov    -0x124(%rbp),%r10d
   2d41f:	31 d2                	xor    %edx,%edx
   2d421:	be 03 00 00 00       	mov    $0x3,%esi
   2d426:	45 85 d2             	test   %r10d,%r10d
   2d429:	0f 95 c2             	setne  %dl
   2d42c:	31 ff                	xor    %edi,%edi
   2d42e:	e9 02 e6 ff ff       	jmp    2ba35 <JS_CallInternal+0x6725>
   2d433:	48 8d 35 31 c1 0a 00 	lea    0xac131(%rip),%rsi        # d956b <_IO_stdin_used+0x56b>
   2d43a:	4c 89 ef             	mov    %r13,%rdi
   2d43d:	31 c0                	xor    %eax,%eax
   2d43f:	4d 89 e7             	mov    %r12,%r15
   2d442:	e8 39 8f 00 00       	call   36380 <JS_ThrowInternalError>
   2d447:	e9 04 86 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2d44c:	48 8b b5 c0 fe ff ff 	mov    -0x140(%rbp),%rsi
   2d453:	48 8b 46 30          	mov    0x30(%rsi),%rax
   2d457:	48 01 c8             	add    %rcx,%rax
   2d45a:	8b 48 04             	mov    0x4(%rax),%ecx
   2d45d:	f6 00 08             	testb  $0x8,(%rax)
   2d460:	0f 85 c2 2a 00 00    	jne    2ff28 <JS_CallInternal+0xac18>
   2d466:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2d46d:	48 83 ec 08          	sub    $0x8,%rsp
   2d471:	41 83 ea 37          	sub    $0x37,%r10d
   2d475:	4d 8b 85 80 01 00 00 	mov    0x180(%r13),%r8
   2d47c:	4d 8b 8d 88 01 00 00 	mov    0x188(%r13),%r9
   2d483:	49 8b b5 80 01 00 00 	mov    0x180(%r13),%rsi
   2d48a:	4c 89 ef             	mov    %r13,%rdi
   2d48d:	4c 89 78 30          	mov    %r15,0x30(%rax)
   2d491:	49 8b 95 88 01 00 00 	mov    0x188(%r13),%rdx
   2d498:	41 52                	push   %r10
   2d49a:	e8 51 2d 00 00       	call   301f0 <JS_GetPropertyInternal>
   2d49f:	48 89 03             	mov    %rax,(%rbx)
   2d4a2:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2d4a6:	58                   	pop    %rax
   2d4a7:	5a                   	pop    %rdx
   2d4a8:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   2d4ac:	0f 85 01 8f ff ff    	jne    263b3 <JS_CallInternal+0x10a3>
   2d4b2:	e9 99 85 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2d4b7:	0f b6 d0             	movzbl %al,%edx
   2d4ba:	48 8d 35 6e c0 0a 00 	lea    0xac06e(%rip),%rsi        # d952f <_IO_stdin_used+0x52f>
   2d4c1:	4c 89 ef             	mov    %r13,%rdi
   2d4c4:	31 c0                	xor    %eax,%eax
   2d4c6:	e8 b5 8e 00 00       	call   36380 <JS_ThrowInternalError>
   2d4cb:	e9 80 85 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2d4d0:	48 8b b5 a0 fe ff ff 	mov    -0x160(%rbp),%rsi
   2d4d7:	e9 9b 8d ff ff       	jmp    26277 <JS_CallInternal+0xf67>
   2d4dc:	8b 02                	mov    (%rdx),%eax
   2d4de:	25 ff ff ff 03       	and    $0x3ffffff,%eax
   2d4e3:	0f 85 39 ce ff ff    	jne    2a322 <JS_CallInternal+0x5012>
   2d4e9:	49 8b b5 80 01 00 00 	mov    0x180(%r13),%rsi
   2d4f0:	49 8b 95 88 01 00 00 	mov    0x188(%r13),%rdx
   2d4f7:	4c 89 ef             	mov    %r13,%rdi
   2d4fa:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2d500:	e8 9b 2d 04 00       	call   702a0 <JS_HasProperty>
   2d505:	85 c0                	test   %eax,%eax
   2d507:	0f 88 43 85 ff ff    	js     25a50 <JS_CallInternal+0x740>
   2d50d:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2d513:	0f 84 37 17 00 00    	je     2ec50 <JS_CallInternal+0x9940>
   2d519:	49 8b 95 88 01 00 00 	mov    0x188(%r13),%rdx
   2d520:	49 8b 85 80 01 00 00 	mov    0x180(%r13),%rax
   2d527:	83 fa f6             	cmp    $0xfffffff6,%edx
   2d52a:	76 04                	jbe    2d530 <JS_CallInternal+0x8220>
   2d52c:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2d530:	48 89 03             	mov    %rax,(%rbx)
   2d533:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2d537:	e9 34 ce ff ff       	jmp    2a370 <JS_CallInternal+0x5060>
   2d53c:	41 f6 42 10 08       	testb  $0x8,0x10(%r10)
   2d541:	0f 85 90 cb ff ff    	jne    2a0d7 <JS_CallInternal+0x4dc7>
   2d547:	49 8b 4a 18          	mov    0x18(%r10),%rcx
   2d54b:	48 39 08             	cmp    %rcx,(%rax)
   2d54e:	0f 85 83 cb ff ff    	jne    2a0d7 <JS_CallInternal+0x4dc7>
   2d554:	48 83 78 08 00       	cmpq   $0x0,0x8(%rax)
   2d559:	0f 85 78 cb ff ff    	jne    2a0d7 <JS_CallInternal+0x4dc7>
   2d55f:	8b 50 10             	mov    0x10(%rax),%edx
   2d562:	8b 79 18             	mov    0x18(%rcx),%edi
   2d565:	48 8d 34 d5 00 00 00 	lea    0x0(,%rdx,8),%rsi
   2d56c:	00 
   2d56d:	48 8d 74 be 3c       	lea    0x3c(%rsi,%rdi,4),%rsi
   2d572:	0f b6 4c 31 03       	movzbl 0x3(%rcx,%rsi,1),%ecx
   2d577:	c0 e9 02             	shr    $0x2,%cl
   2d57a:	83 e1 3a             	and    $0x3a,%ecx
   2d57d:	80 f9 02             	cmp    $0x2,%cl
   2d580:	0f 85 51 cb ff ff    	jne    2a0d7 <JS_CallInternal+0x4dc7>
   2d586:	48 89 d0             	mov    %rdx,%rax
   2d589:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2d58e:	4c 89 ef             	mov    %r13,%rdi
   2d591:	48 83 eb 20          	sub    $0x20,%rbx
   2d595:	48 c1 e0 04          	shl    $0x4,%rax
   2d599:	49 03 42 20          	add    0x20(%r10),%rax
   2d59d:	4c 89 95 30 fe ff ff 	mov    %r10,-0x1d0(%rbp)
   2d5a4:	49 83 c4 05          	add    $0x5,%r12
   2d5a8:	48 8b 30             	mov    (%rax),%rsi
   2d5ab:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2d5af:	0f 11 00             	movups %xmm0,(%rax)
   2d5b2:	4c 89 9d 10 fe ff ff 	mov    %r11,-0x1f0(%rbp)
   2d5b9:	e8 32 14 ff ff       	call   1e9f0 <JS_FreeValue>
   2d5be:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2d5c5:	48 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%rdx
   2d5cc:	4c 89 ef             	mov    %r13,%rdi
   2d5cf:	48 89 c6             	mov    %rax,%rsi
   2d5d2:	e8 19 14 ff ff       	call   1e9f0 <JS_FreeValue>
   2d5d7:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2d5dd:	49 8b 14 c6          	mov    (%r14,%rax,8),%rdx
   2d5e1:	49 89 c2             	mov    %rax,%r10
   2d5e4:	b8 01 00 00 00       	mov    $0x1,%eax
   2d5e9:	ff e2                	jmp    *%rdx
   2d5eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2d5f0:	48 89 ce             	mov    %rcx,%rsi
   2d5f3:	8b 49 ac             	mov    -0x54(%rcx),%ecx
   2d5f6:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2d5fc:	83 e9 01             	sub    $0x1,%ecx
   2d5ff:	89 4e ac             	mov    %ecx,-0x54(%rsi)
   2d602:	0f 85 7c d5 ff ff    	jne    2ab84 <JS_CallInternal+0x5874>
   2d608:	80 bf a0 04 00 00 02 	cmpb   $0x2,0x4a0(%rdi)
   2d60f:	0f 84 6f d5 ff ff    	je     2ab84 <JS_CallInternal+0x5874>
   2d615:	48 83 ee 50          	sub    $0x50,%rsi
   2d619:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2d620:	e8 3b 50 ff ff       	call   22660 <async_func_free.part.0>
   2d625:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   2d62c:	4a 8d 14 fd 00 00 00 	lea    0x0(,%r15,8),%rdx
   2d633:	00 
   2d634:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2d63b:	48 03 56 28          	add    0x28(%rsi),%rdx
   2d63f:	e9 40 d5 ff ff       	jmp    2ab84 <JS_CallInternal+0x5874>
   2d644:	41 0f be 42 06       	movsbl 0x6(%r10),%eax
   2d649:	41 bb 02 00 00 00    	mov    $0x2,%r11d
   2d64f:	e9 5e 8c ff ff       	jmp    262b2 <JS_CallInternal+0xfa2>
   2d654:	b8 03 00 00 00       	mov    $0x3,%eax
   2d659:	45 31 ff             	xor    %r15d,%r15d
   2d65c:	e9 fd da ff ff       	jmp    2b15e <JS_CallInternal+0x5e4e>
   2d661:	b9 03 00 00 00       	mov    $0x3,%ecx
   2d666:	45 31 ff             	xor    %r15d,%r15d
   2d669:	e9 b3 db ff ff       	jmp    2b221 <JS_CallInternal+0x5f11>
   2d66e:	41 0f bf 42 06       	movswl 0x6(%r10),%eax
   2d673:	41 bb 03 00 00 00    	mov    $0x3,%r11d
   2d679:	e9 34 8c ff ff       	jmp    262b2 <JS_CallInternal+0xfa2>
   2d67e:	48 8b b5 80 fe ff ff 	mov    -0x180(%rbp),%rsi
   2d685:	e9 ed 8b ff ff       	jmp    26277 <JS_CallInternal+0xf67>
   2d68a:	48 89 f2             	mov    %rsi,%rdx
   2d68d:	48 89 fe             	mov    %rdi,%rsi
   2d690:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d694:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2d69b:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2d6a2:	4c 89 85 30 fe ff ff 	mov    %r8,-0x1d0(%rbp)
   2d6a9:	e8 c2 11 ff ff       	call   1e870 <__JS_FreeValueRT>
   2d6ae:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2d6b5:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2d6bc:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2d6c3:	e9 0b 8f ff ff       	jmp    265d3 <JS_CallInternal+0x12c3>
   2d6c8:	48 89 fe             	mov    %rdi,%rsi
   2d6cb:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d6cf:	e8 9c 11 ff ff       	call   1e870 <__JS_FreeValueRT>
   2d6d4:	e9 65 d2 ff ff       	jmp    2a93e <JS_CallInternal+0x562e>
   2d6d9:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d6dd:	48 89 ce             	mov    %rcx,%rsi
   2d6e0:	e8 8b 11 ff ff       	call   1e870 <__JS_FreeValueRT>
   2d6e5:	e9 a7 d2 ff ff       	jmp    2a991 <JS_CallInternal+0x5681>
   2d6ea:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d6ee:	48 89 ce             	mov    %rcx,%rsi
   2d6f1:	e8 7a 11 ff ff       	call   1e870 <__JS_FreeValueRT>
   2d6f6:	e9 69 d3 ff ff       	jmp    2aa64 <JS_CallInternal+0x5754>
   2d6fb:	48 89 fe             	mov    %rdi,%rsi
   2d6fe:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d702:	e8 69 11 ff ff       	call   1e870 <__JS_FreeValueRT>
   2d707:	e9 f6 d2 ff ff       	jmp    2aa02 <JS_CallInternal+0x56f2>
   2d70c:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d710:	48 89 ce             	mov    %rcx,%rsi
   2d713:	e8 58 11 ff ff       	call   1e870 <__JS_FreeValueRT>
   2d718:	e9 f0 b9 ff ff       	jmp    2910d <JS_CallInternal+0x3dfd>
   2d71d:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d721:	48 89 c2             	mov    %rax,%rdx
   2d724:	48 89 ce             	mov    %rcx,%rsi
   2d727:	e8 44 11 ff ff       	call   1e870 <__JS_FreeValueRT>
   2d72c:	e9 cf cd ff ff       	jmp    2a500 <JS_CallInternal+0x51f0>
   2d731:	48 89 fe             	mov    %rdi,%rsi
   2d734:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d738:	e8 33 11 ff ff       	call   1e870 <__JS_FreeValueRT>
   2d73d:	e9 ab cf ff ff       	jmp    2a6ed <JS_CallInternal+0x53dd>
   2d742:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d746:	48 89 ce             	mov    %rcx,%rsi
   2d749:	e8 22 11 ff ff       	call   1e870 <__JS_FreeValueRT>
   2d74e:	e9 ef ce ff ff       	jmp    2a642 <JS_CallInternal+0x5332>
   2d753:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d757:	48 89 ce             	mov    %rcx,%rsi
   2d75a:	e8 11 11 ff ff       	call   1e870 <__JS_FreeValueRT>
   2d75f:	e9 33 d1 ff ff       	jmp    2a897 <JS_CallInternal+0x5587>
   2d764:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d768:	48 89 ce             	mov    %rcx,%rsi
   2d76b:	e8 00 11 ff ff       	call   1e870 <__JS_FreeValueRT>
   2d770:	e9 d0 d0 ff ff       	jmp    2a845 <JS_CallInternal+0x5535>
   2d775:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d779:	48 89 ce             	mov    %rcx,%rsi
   2d77c:	e8 ef 10 ff ff       	call   1e870 <__JS_FreeValueRT>
   2d781:	e9 6c d0 ff ff       	jmp    2a7f2 <JS_CallInternal+0x54e2>
   2d786:	48 89 f2             	mov    %rsi,%rdx
   2d789:	48 89 fe             	mov    %rdi,%rsi
   2d78c:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d790:	48 89 85 00 fe ff ff 	mov    %rax,-0x200(%rbp)
   2d797:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   2d79e:	44 89 85 30 fe ff ff 	mov    %r8d,-0x1d0(%rbp)
   2d7a5:	e8 c6 10 ff ff       	call   1e870 <__JS_FreeValueRT>
   2d7aa:	48 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%rax
   2d7b1:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   2d7b8:	44 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8d
   2d7bf:	e9 9e d7 ff ff       	jmp    2af62 <JS_CallInternal+0x5c52>
   2d7c4:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d7c8:	48 89 c2             	mov    %rax,%rdx
   2d7cb:	48 89 ce             	mov    %rcx,%rsi
   2d7ce:	e8 9d 10 ff ff       	call   1e870 <__JS_FreeValueRT>
   2d7d3:	e9 33 a2 ff ff       	jmp    27a0b <JS_CallInternal+0x26fb>
   2d7d8:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d7dc:	48 89 c2             	mov    %rax,%rdx
   2d7df:	48 89 ce             	mov    %rcx,%rsi
   2d7e2:	e8 89 10 ff ff       	call   1e870 <__JS_FreeValueRT>
   2d7e7:	e9 b9 a2 ff ff       	jmp    27aa5 <JS_CallInternal+0x2795>
   2d7ec:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d7f0:	48 89 c2             	mov    %rax,%rdx
   2d7f3:	48 89 ce             	mov    %rcx,%rsi
   2d7f6:	e8 75 10 ff ff       	call   1e870 <__JS_FreeValueRT>
   2d7fb:	e9 58 a2 ff ff       	jmp    27a58 <JS_CallInternal+0x2748>
   2d800:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d804:	48 89 c2             	mov    %rax,%rdx
   2d807:	48 89 ce             	mov    %rcx,%rsi
   2d80a:	e8 61 10 ff ff       	call   1e870 <__JS_FreeValueRT>
   2d80f:	e9 dc a2 ff ff       	jmp    27af0 <JS_CallInternal+0x27e0>
   2d814:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d818:	48 89 c2             	mov    %rax,%rdx
   2d81b:	e8 50 10 ff ff       	call   1e870 <__JS_FreeValueRT>
   2d820:	e9 90 a0 ff ff       	jmp    278b5 <JS_CallInternal+0x25a5>
   2d825:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d829:	48 89 c2             	mov    %rax,%rdx
   2d82c:	e8 3f 10 ff ff       	call   1e870 <__JS_FreeValueRT>
   2d831:	e9 31 a1 ff ff       	jmp    27967 <JS_CallInternal+0x2657>
   2d836:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d83a:	48 89 c2             	mov    %rax,%rdx
   2d83d:	e8 2e 10 ff ff       	call   1e870 <__JS_FreeValueRT>
   2d842:	e9 c7 a0 ff ff       	jmp    2790e <JS_CallInternal+0x25fe>
   2d847:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d84b:	48 89 c2             	mov    %rax,%rdx
   2d84e:	e8 1d 10 ff ff       	call   1e870 <__JS_FreeValueRT>
   2d853:	e9 66 a1 ff ff       	jmp    279be <JS_CallInternal+0x26ae>
   2d858:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d85c:	48 89 c2             	mov    %rax,%rdx
   2d85f:	48 89 ce             	mov    %rcx,%rsi
   2d862:	e8 09 10 ff ff       	call   1e870 <__JS_FreeValueRT>
   2d867:	e9 07 9e ff ff       	jmp    27673 <JS_CallInternal+0x2363>
   2d86c:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d870:	48 89 c2             	mov    %rax,%rdx
   2d873:	48 89 ce             	mov    %rcx,%rsi
   2d876:	e8 f5 0f ff ff       	call   1e870 <__JS_FreeValueRT>
   2d87b:	e9 dc 9f ff ff       	jmp    2785c <JS_CallInternal+0x254c>
   2d880:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d884:	48 89 c2             	mov    %rax,%rdx
   2d887:	48 89 ce             	mov    %rcx,%rsi
   2d88a:	e8 e1 0f ff ff       	call   1e870 <__JS_FreeValueRT>
   2d88f:	e9 39 9f ff ff       	jmp    277cd <JS_CallInternal+0x24bd>
   2d894:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d898:	4c 89 c2             	mov    %r8,%rdx
   2d89b:	e8 d0 0f ff ff       	call   1e870 <__JS_FreeValueRT>
   2d8a0:	e9 df 9a ff ff       	jmp    27384 <JS_CallInternal+0x2074>
   2d8a5:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d8a9:	48 89 c2             	mov    %rax,%rdx
   2d8ac:	e8 bf 0f ff ff       	call   1e870 <__JS_FreeValueRT>
   2d8b1:	e9 1a 9c ff ff       	jmp    274d0 <JS_CallInternal+0x21c0>
   2d8b6:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d8ba:	48 89 c2             	mov    %rax,%rdx
   2d8bd:	e8 ae 0f ff ff       	call   1e870 <__JS_FreeValueRT>
   2d8c2:	e9 62 9c ff ff       	jmp    27529 <JS_CallInternal+0x2219>
   2d8c7:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d8cb:	48 89 c2             	mov    %rax,%rdx
   2d8ce:	e8 9d 0f ff ff       	call   1e870 <__JS_FreeValueRT>
   2d8d3:	e9 01 9d ff ff       	jmp    275d9 <JS_CallInternal+0x22c9>
   2d8d8:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d8dc:	48 89 c2             	mov    %rax,%rdx
   2d8df:	e8 8c 0f ff ff       	call   1e870 <__JS_FreeValueRT>
   2d8e4:	e9 97 9c ff ff       	jmp    27580 <JS_CallInternal+0x2270>
   2d8e9:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d8ed:	48 89 c2             	mov    %rax,%rdx
   2d8f0:	48 89 ce             	mov    %rcx,%rsi
   2d8f3:	e8 78 0f ff ff       	call   1e870 <__JS_FreeValueRT>
   2d8f8:	e9 29 9d ff ff       	jmp    27626 <JS_CallInternal+0x2316>
   2d8fd:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d901:	48 89 ce             	mov    %rcx,%rsi
   2d904:	e8 67 0f ff ff       	call   1e870 <__JS_FreeValueRT>
   2d909:	e9 5a b6 ff ff       	jmp    28f68 <JS_CallInternal+0x3c58>
   2d90e:	41 8b 42 06          	mov    0x6(%r10),%eax
   2d912:	41 bb 05 00 00 00    	mov    $0x5,%r11d
   2d918:	e9 95 89 ff ff       	jmp    262b2 <JS_CallInternal+0xfa2>
   2d91d:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d921:	4c 89 d6             	mov    %r10,%rsi
   2d924:	4c 89 fa             	mov    %r15,%rdx
   2d927:	e8 44 0f ff ff       	call   1e870 <__JS_FreeValueRT>
   2d92c:	e9 3b 8e ff ff       	jmp    2676c <JS_CallInternal+0x145c>
   2d931:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d935:	48 89 c2             	mov    %rax,%rdx
   2d938:	48 89 ce             	mov    %rcx,%rsi
   2d93b:	e8 30 0f ff ff       	call   1e870 <__JS_FreeValueRT>
   2d940:	e9 58 b3 ff ff       	jmp    28c9d <JS_CallInternal+0x398d>
   2d945:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2d94c:	41 8b 49 04          	mov    0x4(%r9),%ecx
   2d950:	4c 89 ef             	mov    %r13,%rdi
   2d953:	4c 89 8d 30 fe ff ff 	mov    %r9,-0x1d0(%rbp)
   2d95a:	49 8b b5 80 01 00 00 	mov    0x180(%r13),%rsi
   2d961:	49 8b 95 88 01 00 00 	mov    0x188(%r13),%rdx
   2d968:	4c 89 78 30          	mov    %r15,0x30(%rax)
   2d96c:	e8 2f 29 04 00       	call   702a0 <JS_HasProperty>
   2d971:	85 c0                	test   %eax,%eax
   2d973:	0f 88 d7 80 ff ff    	js     25a50 <JS_CallInternal+0x740>
   2d979:	4c 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9
   2d980:	0f 85 eb 10 00 00    	jne    2ea71 <JS_CallInternal+0x9761>
   2d986:	49 8b 45 10          	mov    0x10(%r13),%rax
   2d98a:	48 8b 80 f0 04 00 00 	mov    0x4f0(%rax),%rax
   2d991:	48 85 c0             	test   %rax,%rax
   2d994:	0f 84 d7 10 00 00    	je     2ea71 <JS_CallInternal+0x9761>
   2d99a:	f6 40 3c 01          	testb  $0x1,0x3c(%rax)
   2d99e:	0f 84 cd 10 00 00    	je     2ea71 <JS_CallInternal+0x9761>
   2d9a4:	41 8b 71 04          	mov    0x4(%r9),%esi
   2d9a8:	4c 89 ef             	mov    %r13,%rdi
   2d9ab:	e8 10 88 00 00       	call   361c0 <JS_ThrowReferenceErrorNotDefined>
   2d9b0:	e9 9b 80 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2d9b5:	48 89 f2             	mov    %rsi,%rdx
   2d9b8:	48 89 fe             	mov    %rdi,%rsi
   2d9bb:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d9bf:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2d9c6:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2d9cd:	e8 9e 0e ff ff       	call   1e870 <__JS_FreeValueRT>
   2d9d2:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2d9d9:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2d9e0:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2d9e7:	e9 ac 8b ff ff       	jmp    26598 <JS_CallInternal+0x1288>
   2d9ec:	8b 9d 30 fe ff ff    	mov    -0x1d0(%rbp),%ebx
   2d9f2:	85 db                	test   %ebx,%ebx
   2d9f4:	74 42                	je     2da38 <JS_CallInternal+0x8728>
   2d9f6:	4c 89 c3             	mov    %r8,%rbx
   2d9f9:	4f 8d 24 01          	lea    (%r9,%r8,1),%r12
   2d9fd:	4d 89 c6             	mov    %r8,%r14
   2da00:	eb 09                	jmp    2da0b <JS_CallInternal+0x86fb>
   2da02:	48 83 c3 10          	add    $0x10,%rbx
   2da06:	4c 39 e3             	cmp    %r12,%rbx
   2da09:	74 2a                	je     2da35 <JS_CallInternal+0x8725>
   2da0b:	48 8b 43 08          	mov    0x8(%rbx),%rax
   2da0f:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2da12:	76 ee                	jbe    2da02 <JS_CallInternal+0x86f2>
   2da14:	48 8b 0b             	mov    (%rbx),%rcx
   2da17:	8b 71 fc             	mov    -0x4(%rcx),%esi
   2da1a:	8d 56 ff             	lea    -0x1(%rsi),%edx
   2da1d:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2da20:	85 d2                	test   %edx,%edx
   2da22:	7f de                	jg     2da02 <JS_CallInternal+0x86f2>
   2da24:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2da28:	48 89 c2             	mov    %rax,%rdx
   2da2b:	48 89 ce             	mov    %rcx,%rsi
   2da2e:	e8 3d 0e ff ff       	call   1e870 <__JS_FreeValueRT>
   2da33:	eb cd                	jmp    2da02 <JS_CallInternal+0x86f2>
   2da35:	4d 89 f0             	mov    %r14,%r8
   2da38:	4c 89 c3             	mov    %r8,%rbx
   2da3b:	e9 10 80 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2da40:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2da44:	48 89 c2             	mov    %rax,%rdx
   2da47:	48 89 ce             	mov    %rcx,%rsi
   2da4a:	e8 21 0e ff ff       	call   1e870 <__JS_FreeValueRT>
   2da4f:	e9 76 8d ff ff       	jmp    267ca <JS_CallInternal+0x14ba>
   2da54:	48 83 ec 08          	sub    $0x8,%rsp
   2da58:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   2da5e:	4c 89 ef             	mov    %r13,%rdi
   2da61:	49 89 d1             	mov    %rdx,%r9
   2da64:	6a 00                	push   $0x0
   2da66:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2da6d:	4c 89 e6             	mov    %r12,%rsi
   2da70:	e8 7b 27 00 00       	call   301f0 <JS_GetPropertyInternal>
   2da75:	5f                   	pop    %rdi
   2da76:	41 58                	pop    %r8
   2da78:	48 89 c1             	mov    %rax,%rcx
   2da7b:	48 89 d0             	mov    %rdx,%rax
   2da7e:	83 fa 06             	cmp    $0x6,%edx
   2da81:	0f 85 df 83 ff ff    	jne    25e66 <JS_CallInternal+0xb56>
   2da87:	e9 c4 7f ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2da8c:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2da90:	4c 89 ca             	mov    %r9,%rdx
   2da93:	4c 89 fe             	mov    %r15,%rsi
   2da96:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2da9d:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2daa4:	e8 c7 0d ff ff       	call   1e870 <__JS_FreeValueRT>
   2daa9:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2dab0:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2dab7:	e9 bd 93 ff ff       	jmp    26e79 <JS_CallInternal+0x1b69>
   2dabc:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dac0:	48 89 c2             	mov    %rax,%rdx
   2dac3:	48 89 ce             	mov    %rcx,%rsi
   2dac6:	4c 89 8d 30 fe ff ff 	mov    %r9,-0x1d0(%rbp)
   2dacd:	e8 9e 0d ff ff       	call   1e870 <__JS_FreeValueRT>
   2dad2:	4c 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9
   2dad9:	e9 40 bb ff ff       	jmp    2961e <JS_CallInternal+0x430e>
   2dade:	48 89 f2             	mov    %rsi,%rdx
   2dae1:	48 89 fe             	mov    %rdi,%rsi
   2dae4:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dae8:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2daef:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2daf6:	e8 75 0d ff ff       	call   1e870 <__JS_FreeValueRT>
   2dafb:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2db02:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2db09:	e9 8a b8 ff ff       	jmp    29398 <JS_CallInternal+0x4088>
   2db0e:	48 89 fe             	mov    %rdi,%rsi
   2db11:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2db15:	e8 56 0d ff ff       	call   1e870 <__JS_FreeValueRT>
   2db1a:	e9 9d b5 ff ff       	jmp    290bc <JS_CallInternal+0x3dac>
   2db1f:	48 89 fe             	mov    %rdi,%rsi
   2db22:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2db26:	e8 45 0d ff ff       	call   1e870 <__JS_FreeValueRT>
   2db2b:	e9 e4 b4 ff ff       	jmp    29014 <JS_CallInternal+0x3d04>
   2db30:	48 89 f2             	mov    %rsi,%rdx
   2db33:	48 89 fe             	mov    %rdi,%rsi
   2db36:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2db3a:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2db41:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2db48:	4c 89 85 30 fe ff ff 	mov    %r8,-0x1d0(%rbp)
   2db4f:	e8 1c 0d ff ff       	call   1e870 <__JS_FreeValueRT>
   2db54:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2db5b:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2db62:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2db69:	e9 47 8a ff ff       	jmp    265b5 <JS_CallInternal+0x12a5>
   2db6e:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2db72:	48 89 ce             	mov    %rcx,%rsi
   2db75:	e8 f6 0c ff ff       	call   1e870 <__JS_FreeValueRT>
   2db7a:	e9 77 a1 ff ff       	jmp    27cf6 <JS_CallInternal+0x29e6>
   2db7f:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2db83:	48 89 f2             	mov    %rsi,%rdx
   2db86:	48 89 ce             	mov    %rcx,%rsi
   2db89:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2db90:	e8 db 0c ff ff       	call   1e870 <__JS_FreeValueRT>
   2db95:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2db9c:	e9 ab d8 ff ff       	jmp    2b44c <JS_CallInternal+0x613c>
   2dba1:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dba5:	48 89 c2             	mov    %rax,%rdx
   2dba8:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2dbaf:	e8 bc 0c ff ff       	call   1e870 <__JS_FreeValueRT>
   2dbb4:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2dbbb:	e9 7f d6 ff ff       	jmp    2b23f <JS_CallInternal+0x5f2f>
   2dbc0:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dbc4:	48 89 c2             	mov    %rax,%rdx
   2dbc7:	48 89 ce             	mov    %rcx,%rsi
   2dbca:	44 89 85 30 fe ff ff 	mov    %r8d,-0x1d0(%rbp)
   2dbd1:	e8 9a 0c ff ff       	call   1e870 <__JS_FreeValueRT>
   2dbd6:	44 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8d
   2dbdd:	e9 a5 eb ff ff       	jmp    2c787 <JS_CallInternal+0x7477>
   2dbe2:	48 89 f2             	mov    %rsi,%rdx
   2dbe5:	48 89 fe             	mov    %rdi,%rsi
   2dbe8:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dbec:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2dbf3:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2dbfa:	e8 71 0c ff ff       	call   1e870 <__JS_FreeValueRT>
   2dbff:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2dc06:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2dc0d:	e9 4b db ff ff       	jmp    2b75d <JS_CallInternal+0x644d>
   2dc12:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dc16:	4c 89 d6             	mov    %r10,%rsi
   2dc19:	4c 89 da             	mov    %r11,%rdx
   2dc1c:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2dc22:	e8 49 0c ff ff       	call   1e870 <__JS_FreeValueRT>
   2dc27:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2dc2d:	e9 11 c5 ff ff       	jmp    2a143 <JS_CallInternal+0x4e33>
   2dc32:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dc36:	48 89 f2             	mov    %rsi,%rdx
   2dc39:	48 89 ce             	mov    %rcx,%rsi
   2dc3c:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2dc43:	e8 28 0c ff ff       	call   1e870 <__JS_FreeValueRT>
   2dc48:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2dc4f:	e9 44 d7 ff ff       	jmp    2b398 <JS_CallInternal+0x6088>
   2dc54:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dc58:	48 89 c2             	mov    %rax,%rdx
   2dc5b:	48 89 ce             	mov    %rcx,%rsi
   2dc5e:	e8 0d 0c ff ff       	call   1e870 <__JS_FreeValueRT>
   2dc63:	e9 d3 b9 ff ff       	jmp    2963b <JS_CallInternal+0x432b>
   2dc68:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dc6c:	48 89 c2             	mov    %rax,%rdx
   2dc6f:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2dc76:	e8 f5 0b ff ff       	call   1e870 <__JS_FreeValueRT>
   2dc7b:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2dc82:	e9 80 b7 ff ff       	jmp    29407 <JS_CallInternal+0x40f7>
   2dc87:	48 89 f2             	mov    %rsi,%rdx
   2dc8a:	48 89 fe             	mov    %rdi,%rsi
   2dc8d:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dc91:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2dc98:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2dc9f:	e8 cc 0b ff ff       	call   1e870 <__JS_FreeValueRT>
   2dca4:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2dcab:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2dcb2:	e9 c4 b6 ff ff       	jmp    2937b <JS_CallInternal+0x406b>
   2dcb7:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dcbb:	48 89 ce             	mov    %rcx,%rsi
   2dcbe:	e8 ad 0b ff ff       	call   1e870 <__JS_FreeValueRT>
   2dcc3:	e9 79 ca ff ff       	jmp    2a741 <JS_CallInternal+0x5431>
   2dcc8:	0f b7 72 01          	movzwl 0x1(%rdx),%esi
   2dccc:	48 c1 e6 04          	shl    $0x4,%rsi
   2dcd0:	83 ff 58             	cmp    $0x58,%edi
   2dcd3:	0f 85 1a 1b 00 00    	jne    2f7f3 <JS_CallInternal+0xa4e3>
   2dcd9:	48 03 b5 80 fe ff ff 	add    -0x180(%rbp),%rsi
   2dce0:	e9 92 85 ff ff       	jmp    26277 <JS_CallInternal+0xf67>
   2dce5:	48 89 fe             	mov    %rdi,%rsi
   2dce8:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dcec:	e8 7f 0b ff ff       	call   1e870 <__JS_FreeValueRT>
   2dcf1:	e9 ab 9f ff ff       	jmp    27ca1 <JS_CallInternal+0x2991>
   2dcf6:	48 89 fe             	mov    %rdi,%rsi
   2dcf9:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dcfd:	e8 6e 0b ff ff       	call   1e870 <__JS_FreeValueRT>
   2dd02:	e9 1a c0 ff ff       	jmp    29d21 <JS_CallInternal+0x4a11>
   2dd07:	48 89 fe             	mov    %rdi,%rsi
   2dd0a:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dd0e:	e8 5d 0b ff ff       	call   1e870 <__JS_FreeValueRT>
   2dd13:	e9 68 c0 ff ff       	jmp    29d80 <JS_CallInternal+0x4a70>
   2dd18:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dd1c:	4c 89 ca             	mov    %r9,%rdx
   2dd1f:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   2dd26:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   2dd2d:	4c 89 9d 08 fe ff ff 	mov    %r11,-0x1f8(%rbp)
   2dd34:	e8 37 0b ff ff       	call   1e870 <__JS_FreeValueRT>
   2dd39:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   2dd40:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   2dd47:	e9 cc bd ff ff       	jmp    29b18 <JS_CallInternal+0x4808>
   2dd4c:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dd50:	48 89 c2             	mov    %rax,%rdx
   2dd53:	48 89 ce             	mov    %rcx,%rsi
   2dd56:	e8 15 0b ff ff       	call   1e870 <__JS_FreeValueRT>
   2dd5b:	e9 34 ab ff ff       	jmp    28894 <JS_CallInternal+0x3584>
   2dd60:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dd64:	48 89 ce             	mov    %rcx,%rsi
   2dd67:	e8 04 0b ff ff       	call   1e870 <__JS_FreeValueRT>
   2dd6c:	e9 24 a4 ff ff       	jmp    28195 <JS_CallInternal+0x2e85>
   2dd71:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dd75:	48 89 c2             	mov    %rax,%rdx
   2dd78:	48 89 ce             	mov    %rcx,%rsi
   2dd7b:	e8 f0 0a ff ff       	call   1e870 <__JS_FreeValueRT>
   2dd80:	e9 be a4 ff ff       	jmp    28243 <JS_CallInternal+0x2f33>
   2dd85:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dd89:	48 89 c2             	mov    %rax,%rdx
   2dd8c:	48 89 ce             	mov    %rcx,%rsi
   2dd8f:	e8 dc 0a ff ff       	call   1e870 <__JS_FreeValueRT>
   2dd94:	e9 db a5 ff ff       	jmp    28374 <JS_CallInternal+0x3064>
   2dd99:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dd9d:	4c 89 d6             	mov    %r10,%rsi
   2dda0:	4c 89 fa             	mov    %r15,%rdx
   2dda3:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2ddaa:	e8 c1 0a ff ff       	call   1e870 <__JS_FreeValueRT>
   2ddaf:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2ddb6:	e9 76 bd ff ff       	jmp    29b31 <JS_CallInternal+0x4821>
   2ddbb:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   2ddc2:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ddc6:	48 89 d0             	mov    %rdx,%rax
   2ddc9:	4c 89 ca             	mov    %r9,%rdx
   2ddcc:	48 89 c6             	mov    %rax,%rsi
   2ddcf:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2ddd6:	44 89 85 10 fe ff ff 	mov    %r8d,-0x1f0(%rbp)
   2dddd:	e8 8e 0a ff ff       	call   1e870 <__JS_FreeValueRT>
   2dde2:	48 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%rax
   2dde9:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2ddf0:	44 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%r8d
   2ddf7:	e9 3b d1 ff ff       	jmp    2af37 <JS_CallInternal+0x5c27>
   2ddfc:	45 31 c0             	xor    %r8d,%r8d
   2ddff:	48 92                	xchg   %rax,%rdx
   2de01:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2de05:	44 89 85 30 fe ff ff 	mov    %r8d,-0x1d0(%rbp)
   2de0c:	48 89 c6             	mov    %rax,%rsi
   2de0f:	e8 5c 0a ff ff       	call   1e870 <__JS_FreeValueRT>
   2de14:	44 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8d
   2de1b:	e9 84 e9 ff ff       	jmp    2c7a4 <JS_CallInternal+0x7494>
   2de20:	48 8b 85 c0 fe ff ff 	mov    -0x140(%rbp),%rax
   2de27:	48 8b 40 30          	mov    0x30(%rax),%rax
   2de2b:	8b 44 d0 04          	mov    0x4(%rax,%rdx,8),%eax
   2de2f:	48 8d 15 87 b6 0a 00 	lea    0xab687(%rip),%rdx        # d94bd <_IO_stdin_used+0x4bd>
   2de36:	85 c0                	test   %eax,%eax
   2de38:	0f 85 b2 1b 00 00    	jne    2f9f0 <JS_CallInternal+0xa6e0>
   2de3e:	48 8d 35 d4 b6 0a 00 	lea    0xab6d4(%rip),%rsi        # d9519 <_IO_stdin_used+0x519>
   2de45:	4c 89 ef             	mov    %r13,%rdi
   2de48:	31 c0                	xor    %eax,%eax
   2de4a:	e8 31 82 00 00       	call   36080 <JS_ThrowReferenceError>
   2de4f:	e9 fc 7b ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2de54:	83 fa 08             	cmp    $0x8,%edx
   2de57:	0f 84 75 1d 00 00    	je     2fbd2 <JS_CallInternal+0xa8c2>
   2de5d:	83 fa ff             	cmp    $0xffffffff,%edx
   2de60:	0f 84 1f 1d 00 00    	je     2fb85 <JS_CallInternal+0xa875>
   2de66:	8d 42 fe             	lea    -0x2(%rdx),%eax
   2de69:	83 f8 01             	cmp    $0x1,%eax
   2de6c:	0f 86 6b 21 00 00    	jbe    2ffdd <JS_CallInternal+0xaccd>
   2de72:	83 fa f9             	cmp    $0xfffffff9,%edx
   2de75:	0f 85 9e 1c 00 00    	jne    2fb19 <JS_CallInternal+0xa809>
   2de7b:	41 83 f8 f9          	cmp    $0xfffffff9,%r8d
   2de7f:	0f 85 94 1c 00 00    	jne    2fb19 <JS_CallInternal+0xa809>
   2de85:	4c 89 d6             	mov    %r10,%rsi
   2de88:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   2de8f:	4c 89 85 f0 fd ff ff 	mov    %r8,-0x210(%rbp)
   2de96:	48 89 95 00 fe ff ff 	mov    %rdx,-0x200(%rbp)
   2de9d:	48 89 bd 30 fe ff ff 	mov    %rdi,-0x1d0(%rbp)
   2dea4:	e8 47 b5 fe ff       	call   193f0 <js_string_eq.isra.0>
   2dea9:	48 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%rdx
   2deb0:	4c 89 ef             	mov    %r13,%rdi
   2deb3:	4c 63 f8             	movslq %eax,%r15
   2deb6:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2debd:	48 89 c6             	mov    %rax,%rsi
   2dec0:	e8 2b 0b ff ff       	call   1e9f0 <JS_FreeValue>
   2dec5:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   2decc:	4c 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%r11
   2ded3:	4c 89 ef             	mov    %r13,%rdi
   2ded6:	4c 89 d6             	mov    %r10,%rsi
   2ded9:	4c 89 da             	mov    %r11,%rdx
   2dedc:	e8 0f 0b ff ff       	call   1e9f0 <JS_FreeValue>
   2dee1:	e9 02 b9 ff ff       	jmp    297e8 <JS_CallInternal+0x44d8>
   2dee6:	4d 89 e7             	mov    %r12,%r15
   2dee9:	e9 62 7b ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2deee:	4c 89 ef             	mov    %r13,%rdi
   2def1:	e8 4a 85 00 00       	call   36440 <__js_poll_interrupts>
   2def6:	85 c0                	test   %eax,%eax
   2def8:	0f 85 52 7b ff ff    	jne    25a50 <JS_CallInternal+0x740>
   2defe:	e9 67 91 ff ff       	jmp    2706a <JS_CallInternal+0x1d5a>
   2df03:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2df08:	83 fe 08             	cmp    $0x8,%esi
   2df0b:	0f 84 ee 18 00 00    	je     2f7ff <JS_CallInternal+0xa4ef>
   2df11:	83 f9 08             	cmp    $0x8,%ecx
   2df14:	75 08                	jne    2df1e <JS_CallInternal+0x8c0e>
   2df16:	85 f6                	test   %esi,%esi
   2df18:	0f 84 19 19 00 00    	je     2f837 <JS_CallInternal+0xa527>
   2df1e:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2df25:	44 89 d2             	mov    %r10d,%edx
   2df28:	48 89 de             	mov    %rbx,%rsi
   2df2b:	4c 89 ef             	mov    %r13,%rdi
   2df2e:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2df32:	e8 b9 e9 02 00       	call   5c8f0 <js_relational_slow>
   2df37:	85 c0                	test   %eax,%eax
   2df39:	0f 85 47 20 00 00    	jne    2ff86 <JS_CallInternal+0xac76>
   2df3f:	48 83 eb 10          	sub    $0x10,%rbx
   2df43:	e9 29 bf ff ff       	jmp    29e71 <JS_CallInternal+0x4b61>
   2df48:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2df4f:	44 89 d2             	mov    %r10d,%edx
   2df52:	48 89 de             	mov    %rbx,%rsi
   2df55:	4c 89 ef             	mov    %r13,%rdi
   2df58:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2df5c:	e8 8f 4c 02 00       	call   52bf0 <js_binary_logic_slow>
   2df61:	85 c0                	test   %eax,%eax
   2df63:	0f 85 92 20 00 00    	jne    2fffb <JS_CallInternal+0xaceb>
   2df69:	48 83 eb 10          	sub    $0x10,%rbx
   2df6d:	e9 54 c0 ff ff       	jmp    29fc6 <JS_CallInternal+0x4cb6>
   2df72:	48 83 c3 10          	add    $0x10,%rbx
   2df76:	e9 d5 7a ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2df7b:	48 83 c3 10          	add    $0x10,%rbx
   2df7f:	e9 cc 7a ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2df84:	4c 89 ef             	mov    %r13,%rdi
   2df87:	e8 b4 84 00 00       	call   36440 <__js_poll_interrupts>
   2df8c:	85 c0                	test   %eax,%eax
   2df8e:	0f 85 bc 7a ff ff    	jne    25a50 <JS_CallInternal+0x740>
   2df94:	e9 2f 91 ff ff       	jmp    270c8 <JS_CallInternal+0x1db8>
   2df99:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   2dfa0:	4d 89 e7             	mov    %r12,%r15
   2dfa3:	48 83 c3 10          	add    $0x10,%rbx
   2dfa7:	e9 a4 7a ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2dfac:	48 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%rdx
   2dfb3:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dfb7:	48 89 ce             	mov    %rcx,%rsi
   2dfba:	44 89 85 f0 fd ff ff 	mov    %r8d,-0x210(%rbp)
   2dfc1:	e8 aa 08 ff ff       	call   1e870 <__JS_FreeValueRT>
   2dfc6:	44 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8d
   2dfcd:	e9 3e b7 ff ff       	jmp    29710 <JS_CallInternal+0x4400>
   2dfd2:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dfd6:	4c 89 fa             	mov    %r15,%rdx
   2dfd9:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2dfe0:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2dfe7:	e8 84 08 ff ff       	call   1e870 <__JS_FreeValueRT>
   2dfec:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2dff3:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2dffa:	e9 64 d8 ff ff       	jmp    2b863 <JS_CallInternal+0x6553>
   2dfff:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2e006:	44 89 d2             	mov    %r10d,%edx
   2e009:	48 89 de             	mov    %rbx,%rsi
   2e00c:	4c 89 ef             	mov    %r13,%rdi
   2e00f:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2e013:	e8 d8 4b 02 00       	call   52bf0 <js_binary_logic_slow>
   2e018:	85 c0                	test   %eax,%eax
   2e01a:	0f 85 1c 20 00 00    	jne    3003c <JS_CallInternal+0xad2c>
   2e020:	48 83 eb 10          	sub    $0x10,%rbx
   2e024:	e9 a8 bb ff ff       	jmp    29bd1 <JS_CallInternal+0x48c1>
   2e029:	4d 89 e7             	mov    %r12,%r15
   2e02c:	e9 1f 7a ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2e031:	31 c0                	xor    %eax,%eax
   2e033:	48 8d 35 43 b5 0a 00 	lea    0xab543(%rip),%rsi        # d957d <_IO_stdin_used+0x57d>
   2e03a:	4c 89 ef             	mov    %r13,%rdi
   2e03d:	4d 89 e7             	mov    %r12,%r15
   2e040:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2e047:	4c 89 85 10 fe ff ff 	mov    %r8,-0x1f0(%rbp)
   2e04e:	e8 2d 83 00 00       	call   36380 <JS_ThrowInternalError>
   2e053:	83 fb f6             	cmp    $0xfffffff6,%ebx
   2e056:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2e05d:	76 1a                	jbe    2e079 <JS_CallInternal+0x8d69>
   2e05f:	4c 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%r8
   2e066:	41 8b 40 fc          	mov    -0x4(%r8),%eax
   2e06a:	83 e8 01             	sub    $0x1,%eax
   2e06d:	41 89 40 fc          	mov    %eax,-0x4(%r8)
   2e071:	85 c0                	test   %eax,%eax
   2e073:	0f 8e 3d 14 00 00    	jle    2f4b6 <JS_CallInternal+0xa1a6>
   2e079:	48 89 cb             	mov    %rcx,%rbx
   2e07c:	e9 cf 79 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2e081:	48 8d 35 0d b5 0a 00 	lea    0xab50d(%rip),%rsi        # d9595 <_IO_stdin_used+0x595>
   2e088:	4c 89 ef             	mov    %r13,%rdi
   2e08b:	31 c0                	xor    %eax,%eax
   2e08d:	e8 fe 60 00 00       	call   34190 <JS_ThrowTypeError>
   2e092:	4d 8b 4f 08          	mov    0x8(%r15),%r9
   2e096:	48 89 c1             	mov    %rax,%rcx
   2e099:	48 89 d0             	mov    %rdx,%rax
   2e09c:	49 8b 17             	mov    (%r15),%rdx
   2e09f:	41 89 c0             	mov    %eax,%r8d
   2e0a2:	e9 79 ce ff ff       	jmp    2af20 <JS_CallInternal+0x5c10>
   2e0a7:	48 8d 35 d9 b4 0a 00 	lea    0xab4d9(%rip),%rsi        # d9587 <_IO_stdin_used+0x587>
   2e0ae:	4c 89 ef             	mov    %r13,%rdi
   2e0b1:	31 c0                	xor    %eax,%eax
   2e0b3:	e8 d8 60 00 00       	call   34190 <JS_ThrowTypeError>
   2e0b8:	4d 8b 4f 08          	mov    0x8(%r15),%r9
   2e0bc:	48 89 c1             	mov    %rax,%rcx
   2e0bf:	48 89 d0             	mov    %rdx,%rax
   2e0c2:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2e0c6:	41 89 c0             	mov    %eax,%r8d
   2e0c9:	e9 52 ce ff ff       	jmp    2af20 <JS_CallInternal+0x5c10>
   2e0ce:	48 8b bd f0 fd ff ff 	mov    -0x210(%rbp),%rdi
   2e0d5:	48 89 ce             	mov    %rcx,%rsi
   2e0d8:	e8 93 07 ff ff       	call   1e870 <__JS_FreeValueRT>
   2e0dd:	e9 3e cd ff ff       	jmp    2ae20 <JS_CallInternal+0x5b10>
   2e0e2:	48 8d 35 ac b4 0a 00 	lea    0xab4ac(%rip),%rsi        # d9595 <_IO_stdin_used+0x595>
   2e0e9:	4c 89 ef             	mov    %r13,%rdi
   2e0ec:	31 c0                	xor    %eax,%eax
   2e0ee:	e8 9d 60 00 00       	call   34190 <JS_ThrowTypeError>
   2e0f3:	83 bd 10 fe ff ff f6 	cmpl   $0xfffffff6,-0x1f0(%rbp)
   2e0fa:	76 1e                	jbe    2e11a <JS_CallInternal+0x8e0a>
   2e0fc:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2e103:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2e106:	89 85 00 fe ff ff    	mov    %eax,-0x200(%rbp)
   2e10c:	83 e8 01             	sub    $0x1,%eax
   2e10f:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2e112:	85 c0                	test   %eax,%eax
   2e114:	0f 8e 86 19 00 00    	jle    2faa0 <JS_CallInternal+0xa790>
   2e11a:	48 8b 43 08          	mov    0x8(%rbx),%rax
   2e11e:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2e121:	0f 86 67 01 00 00    	jbe    2e28e <JS_CallInternal+0x8f7e>
   2e127:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
   2e12d:	e9 41 e6 ff ff       	jmp    2c773 <JS_CallInternal+0x7463>
   2e132:	48 8d 35 4e b4 0a 00 	lea    0xab44e(%rip),%rsi        # d9587 <_IO_stdin_used+0x587>
   2e139:	4c 89 ef             	mov    %r13,%rdi
   2e13c:	31 c0                	xor    %eax,%eax
   2e13e:	e8 4d 60 00 00       	call   34190 <JS_ThrowTypeError>
   2e143:	eb ae                	jmp    2e0f3 <JS_CallInternal+0x8de3>
   2e145:	4d 89 e7             	mov    %r12,%r15
   2e148:	e9 03 79 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2e14d:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2e154:	48 89 de             	mov    %rbx,%rsi
   2e157:	4c 89 ef             	mov    %r13,%rdi
   2e15a:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2e15e:	e8 bd 48 02 00       	call   52a20 <js_shr_slow>
   2e163:	85 c0                	test   %eax,%eax
   2e165:	0f 85 c1 1e 00 00    	jne    3002c <JS_CallInternal+0xad1c>
   2e16b:	48 83 eb 10          	sub    $0x10,%rbx
   2e16f:	e9 9f be ff ff       	jmp    2a013 <JS_CallInternal+0x4d03>
   2e174:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e178:	48 89 c2             	mov    %rax,%rdx
   2e17b:	48 89 ce             	mov    %rcx,%rsi
   2e17e:	e8 ed 06 ff ff       	call   1e870 <__JS_FreeValueRT>
   2e183:	e9 c5 de ff ff       	jmp    2c04d <JS_CallInternal+0x6d3d>
   2e188:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2e18c:	48 c7 43 e8 08 00 00 	movq   $0x8,-0x18(%rbx)
   2e193:	00 
   2e194:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
   2e199:	f2 0f 11 43 e0       	movsd  %xmm0,-0x20(%rbx)
   2e19e:	e9 1c c3 ff ff       	jmp    2a4bf <JS_CallInternal+0x51af>
   2e1a3:	83 fa 08             	cmp    $0x8,%edx
   2e1a6:	0f 84 4e 14 00 00    	je     2f5fa <JS_CallInternal+0xa2ea>
   2e1ac:	83 f8 08             	cmp    $0x8,%eax
   2e1af:	0f 84 1a 14 00 00    	je     2f5cf <JS_CallInternal+0xa2bf>
   2e1b5:	8d 72 07             	lea    0x7(%rdx),%esi
   2e1b8:	83 fe 01             	cmp    $0x1,%esi
   2e1bb:	0f 86 55 14 00 00    	jbe    2f616 <JS_CallInternal+0xa306>
   2e1c1:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2e1c8:	48 89 de             	mov    %rbx,%rsi
   2e1cb:	4c 89 ef             	mov    %r13,%rdi
   2e1ce:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2e1d2:	e8 49 92 02 00       	call   57420 <js_add_slow>
   2e1d7:	85 c0                	test   %eax,%eax
   2e1d9:	0f 84 e0 c2 ff ff    	je     2a4bf <JS_CallInternal+0x51af>
   2e1df:	4d 89 e7             	mov    %r12,%r15
   2e1e2:	e9 69 78 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2e1e7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   2e1ee:	00 00 
   2e1f0:	48 8b 85 c0 fe ff ff 	mov    -0x140(%rbp),%rax
   2e1f7:	48 8d 15 bf b2 0a 00 	lea    0xab2bf(%rip),%rdx        # d94bd <_IO_stdin_used+0x4bd>
   2e1fe:	48 8b 40 30          	mov    0x30(%rax),%rax
   2e202:	8b 44 c8 04          	mov    0x4(%rax,%rcx,8),%eax
   2e206:	85 c0                	test   %eax,%eax
   2e208:	0f 85 7b 18 00 00    	jne    2fa89 <JS_CallInternal+0xa779>
   2e20e:	48 8d 35 04 b3 0a 00 	lea    0xab304(%rip),%rsi        # d9519 <_IO_stdin_used+0x519>
   2e215:	4c 89 ef             	mov    %r13,%rdi
   2e218:	31 c0                	xor    %eax,%eax
   2e21a:	e8 61 7e 00 00       	call   36080 <JS_ThrowReferenceError>
   2e21f:	e9 2c 78 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2e224:	83 fe 08             	cmp    $0x8,%esi
   2e227:	0f 84 37 13 00 00    	je     2f564 <JS_CallInternal+0xa254>
   2e22d:	83 f9 08             	cmp    $0x8,%ecx
   2e230:	75 08                	jne    2e23a <JS_CallInternal+0x8f2a>
   2e232:	85 f6                	test   %esi,%esi
   2e234:	0f 84 6a 13 00 00    	je     2f5a4 <JS_CallInternal+0xa294>
   2e23a:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2e241:	44 89 d2             	mov    %r10d,%edx
   2e244:	48 89 de             	mov    %rbx,%rsi
   2e247:	4c 89 ef             	mov    %r13,%rdi
   2e24a:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2e24e:	e8 9d e6 02 00       	call   5c8f0 <js_relational_slow>
   2e253:	85 c0                	test   %eax,%eax
   2e255:	0f 85 d9 1d 00 00    	jne    30034 <JS_CallInternal+0xad24>
   2e25b:	48 83 eb 10          	sub    $0x10,%rbx
   2e25f:	e9 9c bc ff ff       	jmp    29f00 <JS_CallInternal+0x4bf0>
   2e264:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2e26b:	44 89 d2             	mov    %r10d,%edx
   2e26e:	48 89 de             	mov    %rbx,%rsi
   2e271:	4c 89 ef             	mov    %r13,%rdi
   2e274:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2e278:	e8 73 49 02 00       	call   52bf0 <js_binary_logic_slow>
   2e27d:	85 c0                	test   %eax,%eax
   2e27f:	0f 85 9f 1d 00 00    	jne    30024 <JS_CallInternal+0xad14>
   2e285:	48 83 eb 10          	sub    $0x10,%rbx
   2e289:	e9 f6 bc ff ff       	jmp    29f84 <JS_CallInternal+0x4c74>
   2e28e:	49 8b 47 08          	mov    0x8(%r15),%rax
   2e292:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2e295:	0f 86 13 e5 ff ff    	jbe    2c7ae <JS_CallInternal+0x749e>
   2e29b:	49 8b 17             	mov    (%r15),%rdx
   2e29e:	4d 89 e7             	mov    %r12,%r15
   2e2a1:	8b 4a fc             	mov    -0x4(%rdx),%ecx
   2e2a4:	83 e9 01             	sub    $0x1,%ecx
   2e2a7:	89 4a fc             	mov    %ecx,-0x4(%rdx)
   2e2aa:	85 c9                	test   %ecx,%ecx
   2e2ac:	0f 8f 9e 77 ff ff    	jg     25a50 <JS_CallInternal+0x740>
   2e2b2:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
   2e2b8:	e9 42 fb ff ff       	jmp    2ddff <JS_CallInternal+0x8aef>
   2e2bd:	4c 89 ef             	mov    %r13,%rdi
   2e2c0:	e8 7b 81 00 00       	call   36440 <__js_poll_interrupts>
   2e2c5:	85 c0                	test   %eax,%eax
   2e2c7:	0f 85 83 77 ff ff    	jne    25a50 <JS_CallInternal+0x740>
   2e2cd:	e9 6e cd ff ff       	jmp    2b040 <JS_CallInternal+0x5d30>
   2e2d2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   2e2d8:	83 fe 08             	cmp    $0x8,%esi
   2e2db:	0f 84 b1 13 00 00    	je     2f692 <JS_CallInternal+0xa382>
   2e2e1:	83 f9 08             	cmp    $0x8,%ecx
   2e2e4:	75 08                	jne    2e2ee <JS_CallInternal+0x8fde>
   2e2e6:	85 f6                	test   %esi,%esi
   2e2e8:	0f 84 60 13 00 00    	je     2f64e <JS_CallInternal+0xa33e>
   2e2ee:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2e2f5:	44 89 d2             	mov    %r10d,%edx
   2e2f8:	48 89 de             	mov    %rbx,%rsi
   2e2fb:	4c 89 ef             	mov    %r13,%rdi
   2e2fe:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2e302:	e8 e9 e5 02 00       	call   5c8f0 <js_relational_slow>
   2e307:	85 c0                	test   %eax,%eax
   2e309:	0f 85 8d 1b 00 00    	jne    2fe9c <JS_CallInternal+0xab8c>
   2e30f:	48 83 eb 10          	sub    $0x10,%rbx
   2e313:	e9 77 b8 ff ff       	jmp    29b8f <JS_CallInternal+0x487f>
   2e318:	48 8b b5 c0 fe ff ff 	mov    -0x140(%rbp),%rsi
   2e31f:	0f b7 d1             	movzwl %cx,%edx
   2e322:	4c 89 ef             	mov    %r13,%rdi
   2e325:	31 c9                	xor    %ecx,%ecx
   2e327:	e8 f4 7e 00 00       	call   36220 <JS_ThrowReferenceErrorUninitialized2.isra.0>
   2e32c:	e9 1f 77 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2e331:	4d 89 e7             	mov    %r12,%r15
   2e334:	e9 17 77 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2e339:	4d 89 e7             	mov    %r12,%r15
   2e33c:	e9 0f 77 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2e341:	48 83 c3 10          	add    $0x10,%rbx
   2e345:	e9 06 77 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2e34a:	48 8d 35 97 ea 0a 00 	lea    0xaea97(%rip),%rsi        # dcde8 <_IO_stdin_used+0x3de8>
   2e351:	4c 89 ef             	mov    %r13,%rdi
   2e354:	31 c0                	xor    %eax,%eax
   2e356:	4d 89 e7             	mov    %r12,%r15
   2e359:	e8 32 5e 00 00       	call   34190 <JS_ThrowTypeError>
   2e35e:	e9 ed 76 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2e363:	41 8b 4a 14          	mov    0x14(%r10),%ecx
   2e367:	e9 dd de ff ff       	jmp    2c249 <JS_CallInternal+0x6f39>
   2e36c:	41 8b 49 14          	mov    0x14(%r9),%ecx
   2e370:	e9 21 df ff ff       	jmp    2c296 <JS_CallInternal+0x6f86>
   2e375:	83 fa 08             	cmp    $0x8,%edx
   2e378:	0f 84 c3 13 00 00    	je     2f741 <JS_CallInternal+0xa431>
   2e37e:	83 fa ff             	cmp    $0xffffffff,%edx
   2e381:	0f 84 58 13 00 00    	je     2f6df <JS_CallInternal+0xa3cf>
   2e387:	8d 42 fe             	lea    -0x2(%rdx),%eax
   2e38a:	83 f8 01             	cmp    $0x1,%eax
   2e38d:	0f 86 1b 13 00 00    	jbe    2f6ae <JS_CallInternal+0xa39e>
   2e393:	83 fa f9             	cmp    $0xfffffff9,%edx
   2e396:	0f 85 ca ed ff ff    	jne    2d166 <JS_CallInternal+0x7e56>
   2e39c:	83 f9 f9             	cmp    $0xfffffff9,%ecx
   2e39f:	0f 85 c1 ed ff ff    	jne    2d166 <JS_CallInternal+0x7e56>
   2e3a5:	4c 89 c6             	mov    %r8,%rsi
   2e3a8:	4c 89 85 10 fe ff ff 	mov    %r8,-0x1f0(%rbp)
   2e3af:	48 89 bd 30 fe ff ff 	mov    %rdi,-0x1d0(%rbp)
   2e3b6:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2e3bd:	48 89 95 f0 fd ff ff 	mov    %rdx,-0x210(%rbp)
   2e3c4:	e8 27 b0 fe ff       	call   193f0 <js_string_eq.isra.0>
   2e3c9:	48 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%rdx
   2e3d0:	4c 89 ef             	mov    %r13,%rdi
   2e3d3:	41 89 c7             	mov    %eax,%r15d
   2e3d6:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2e3dd:	48 89 c6             	mov    %rax,%rsi
   2e3e0:	e8 0b 06 ff ff       	call   1e9f0 <JS_FreeValue>
   2e3e5:	4c 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%r8
   2e3ec:	4c 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%r9
   2e3f3:	4c 89 ef             	mov    %r13,%rdi
   2e3f6:	4c 89 c6             	mov    %r8,%rsi
   2e3f9:	4c 89 ca             	mov    %r9,%rdx
   2e3fc:	e8 ef 05 ff ff       	call   1e9f0 <JS_FreeValue>
   2e401:	e9 38 b4 ff ff       	jmp    2983e <JS_CallInternal+0x452e>
   2e406:	8b 01                	mov    (%rcx),%eax
   2e408:	25 ff ff ff 03       	and    $0x3ffffff,%eax
   2e40d:	0f 85 de ca ff ff    	jne    2aef1 <JS_CallInternal+0x5be1>
   2e413:	89 fa                	mov    %edi,%edx
   2e415:	48 8b bd 20 fe ff ff 	mov    -0x1e0(%rbp),%rdi
   2e41c:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2e420:	e8 ab a5 fe ff       	call   189d0 <JS_AtomGetStrRT.constprop.0>
   2e425:	48 8d 35 dc e9 0a 00 	lea    0xae9dc(%rip),%rsi        # dce08 <_IO_stdin_used+0x3e08>
   2e42c:	4c 89 ef             	mov    %r13,%rdi
   2e42f:	48 89 c2             	mov    %rax,%rdx
   2e432:	31 c0                	xor    %eax,%eax
   2e434:	e8 57 5d 00 00       	call   34190 <JS_ThrowTypeError>
   2e439:	4d 8b 4f 08          	mov    0x8(%r15),%r9
   2e43d:	41 83 f9 f6          	cmp    $0xfffffff6,%r9d
   2e441:	0f 87 3a 0b 00 00    	ja     2ef81 <JS_CallInternal+0x9c71>
   2e447:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2e44e:	48 8b 70 08          	mov    0x8(%rax),%rsi
   2e452:	83 fe f6             	cmp    $0xfffffff6,%esi
   2e455:	0f 87 86 13 00 00    	ja     2f7e1 <JS_CallInternal+0xa4d1>
   2e45b:	31 f6                	xor    %esi,%esi
   2e45d:	48 c7 43 e8 06 00 00 	movq   $0x6,-0x18(%rbx)
   2e464:	00 
   2e465:	48 89 73 e0          	mov    %rsi,-0x20(%rbx)
   2e469:	4c 89 fb             	mov    %r15,%rbx
   2e46c:	4d 89 e7             	mov    %r12,%r15
   2e46f:	e9 dc 75 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2e474:	4d 89 e7             	mov    %r12,%r15
   2e477:	e9 d4 75 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2e47c:	4c 89 ef             	mov    %r13,%rdi
   2e47f:	e8 bc 7f 00 00       	call   36440 <__js_poll_interrupts>
   2e484:	85 c0                	test   %eax,%eax
   2e486:	0f 85 c4 75 ff ff    	jne    25a50 <JS_CallInternal+0x740>
   2e48c:	e9 38 c8 ff ff       	jmp    2acc9 <JS_CallInternal+0x59b9>
   2e491:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   2e498:	48 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%rdx
   2e49f:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e4a3:	4c 89 fe             	mov    %r15,%rsi
   2e4a6:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2e4ac:	e8 bf 03 ff ff       	call   1e870 <__JS_FreeValueRT>
   2e4b1:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2e4b7:	e9 68 8e ff ff       	jmp    27324 <JS_CallInternal+0x2014>
   2e4bc:	4d 89 e7             	mov    %r12,%r15
   2e4bf:	e9 8c 75 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2e4c4:	48 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%rdx
   2e4cb:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e4cf:	89 8d f0 fd ff ff    	mov    %ecx,-0x210(%rbp)
   2e4d5:	e8 96 03 ff ff       	call   1e870 <__JS_FreeValueRT>
   2e4da:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   2e4e0:	e9 23 8e ff ff       	jmp    27308 <JS_CallInternal+0x1ff8>
   2e4e5:	83 f9 08             	cmp    $0x8,%ecx
   2e4e8:	0f 84 83 14 00 00    	je     2f971 <JS_CallInternal+0xa661>
   2e4ee:	83 f9 ff             	cmp    $0xffffffff,%ecx
   2e4f1:	0f 84 40 14 00 00    	je     2f937 <JS_CallInternal+0xa627>
   2e4f7:	8d 41 fe             	lea    -0x2(%rcx),%eax
   2e4fa:	83 f8 01             	cmp    $0x1,%eax
   2e4fd:	0f 86 05 1c 00 00    	jbe    30108 <JS_CallInternal+0xadf8>
   2e503:	83 f9 f9             	cmp    $0xfffffff9,%ecx
   2e506:	0f 85 d1 13 00 00    	jne    2f8dd <JS_CallInternal+0xa5cd>
   2e50c:	41 83 ff f9          	cmp    $0xfffffff9,%r15d
   2e510:	0f 85 c7 13 00 00    	jne    2f8dd <JS_CallInternal+0xa5cd>
   2e516:	4c 89 d6             	mov    %r10,%rsi
   2e519:	48 89 d7             	mov    %rdx,%rdi
   2e51c:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   2e523:	48 89 8d f0 fd ff ff 	mov    %rcx,-0x210(%rbp)
   2e52a:	48 89 95 10 fe ff ff 	mov    %rdx,-0x1f0(%rbp)
   2e531:	e8 ba ae fe ff       	call   193f0 <js_string_eq.isra.0>
   2e536:	48 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%rdx
   2e53d:	48 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%rcx
   2e544:	4c 89 ef             	mov    %r13,%rdi
   2e547:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2e54d:	48 89 d6             	mov    %rdx,%rsi
   2e550:	48 89 ca             	mov    %rcx,%rdx
   2e553:	e8 98 04 ff ff       	call   1e9f0 <JS_FreeValue>
   2e558:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   2e55f:	4d 89 fb             	mov    %r15,%r11
   2e562:	4c 89 d6             	mov    %r10,%rsi
   2e565:	4c 89 da             	mov    %r11,%rdx
   2e568:	4c 89 ef             	mov    %r13,%rdi
   2e56b:	e8 80 04 ff ff       	call   1e9f0 <JS_FreeValue>
   2e570:	8b 85 30 fe ff ff    	mov    -0x1d0(%rbp),%eax
   2e576:	83 f0 01             	xor    $0x1,%eax
   2e579:	48 98                	cltq
   2e57b:	e9 11 b2 ff ff       	jmp    29791 <JS_CallInternal+0x4481>
   2e580:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e584:	4c 89 fa             	mov    %r15,%rdx
   2e587:	48 89 ce             	mov    %rcx,%rsi
   2e58a:	44 89 85 30 fe ff ff 	mov    %r8d,-0x1d0(%rbp)
   2e591:	e8 da 02 ff ff       	call   1e870 <__JS_FreeValueRT>
   2e596:	44 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8d
   2e59d:	e9 92 b1 ff ff       	jmp    29734 <JS_CallInternal+0x4424>
   2e5a2:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e5a6:	48 89 c2             	mov    %rax,%rdx
   2e5a9:	48 89 ce             	mov    %rcx,%rsi
   2e5ac:	4c 89 9d f0 fd ff ff 	mov    %r11,-0x210(%rbp)
   2e5b3:	e8 b8 02 ff ff       	call   1e870 <__JS_FreeValueRT>
   2e5b8:	4c 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%r11
   2e5bf:	e9 f4 87 ff ff       	jmp    26db8 <JS_CallInternal+0x1aa8>
   2e5c4:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e5c8:	48 89 c2             	mov    %rax,%rdx
   2e5cb:	48 89 ce             	mov    %rcx,%rsi
   2e5ce:	e8 9d 02 ff ff       	call   1e870 <__JS_FreeValueRT>
   2e5d3:	e9 fd 87 ff ff       	jmp    26dd5 <JS_CallInternal+0x1ac5>
   2e5d8:	48 83 eb 10          	sub    $0x10,%rbx
   2e5dc:	e9 6f 74 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2e5e1:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e5e5:	48 89 c2             	mov    %rax,%rdx
   2e5e8:	48 89 ce             	mov    %rcx,%rsi
   2e5eb:	e8 80 02 ff ff       	call   1e870 <__JS_FreeValueRT>
   2e5f0:	e9 3b 83 ff ff       	jmp    26930 <JS_CallInternal+0x1620>
   2e5f5:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e5f9:	48 89 c2             	mov    %rax,%rdx
   2e5fc:	48 89 ce             	mov    %rcx,%rsi
   2e5ff:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   2e606:	e8 65 02 ff ff       	call   1e870 <__JS_FreeValueRT>
   2e60b:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   2e612:	e9 fc 82 ff ff       	jmp    26913 <JS_CallInternal+0x1603>
   2e617:	49 8b 45 10          	mov    0x10(%r13),%rax
   2e61b:	48 8b 80 f0 04 00 00 	mov    0x4f0(%rax),%rax
   2e622:	48 85 c0             	test   %rax,%rax
   2e625:	0f 84 85 0d 00 00    	je     2f3b0 <JS_CallInternal+0xa0a0>
   2e62b:	f6 40 3c 01          	testb  $0x1,0x3c(%rax)
   2e62f:	0f 84 7b 0d 00 00    	je     2f3b0 <JS_CallInternal+0xa0a0>
   2e635:	89 ce                	mov    %ecx,%esi
   2e637:	4c 89 ef             	mov    %r13,%rdi
   2e63a:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2e640:	4d 89 e7             	mov    %r12,%r15
   2e643:	e8 78 7b 00 00       	call   361c0 <JS_ThrowReferenceErrorNotDefined>
   2e648:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2e64e:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2e654:	0f 8e f6 73 ff ff    	jle    25a50 <JS_CallInternal+0x740>
   2e65a:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e65e:	89 ce                	mov    %ecx,%esi
   2e660:	e8 8b c5 fe ff       	call   1abf0 <JS_FreeAtom.part.0.isra.0>
   2e665:	e9 e6 73 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2e66a:	4d 89 e7             	mov    %r12,%r15
   2e66d:	e9 de 73 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2e672:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e676:	48 89 c2             	mov    %rax,%rdx
   2e679:	48 89 ce             	mov    %rcx,%rsi
   2e67c:	e8 ef 01 ff ff       	call   1e870 <__JS_FreeValueRT>
   2e681:	e9 ce 82 ff ff       	jmp    26954 <JS_CallInternal+0x1644>
   2e686:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e68a:	48 89 c2             	mov    %rax,%rdx
   2e68d:	48 89 ce             	mov    %rcx,%rsi
   2e690:	4c 89 9d 30 fe ff ff 	mov    %r11,-0x1d0(%rbp)
   2e697:	e8 d4 01 ff ff       	call   1e870 <__JS_FreeValueRT>
   2e69c:	4c 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%r11
   2e6a3:	e9 ab 83 ff ff       	jmp    26a53 <JS_CallInternal+0x1743>
   2e6a8:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e6ac:	48 89 c2             	mov    %rax,%rdx
   2e6af:	48 89 ce             	mov    %rcx,%rsi
   2e6b2:	e8 b9 01 ff ff       	call   1e870 <__JS_FreeValueRT>
   2e6b7:	e9 5f d8 ff ff       	jmp    2bf1b <JS_CallInternal+0x6c0b>
   2e6bc:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e6c0:	48 89 c2             	mov    %rax,%rdx
   2e6c3:	48 89 ce             	mov    %rcx,%rsi
   2e6c6:	e8 a5 01 ff ff       	call   1e870 <__JS_FreeValueRT>
   2e6cb:	e9 27 d8 ff ff       	jmp    2bef7 <JS_CallInternal+0x6be7>
   2e6d0:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e6d4:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2e6d8:	89 c2                	mov    %eax,%edx
   2e6da:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2e6e0:	4d 89 e7             	mov    %r12,%r15
   2e6e3:	e8 e8 a2 fe ff       	call   189d0 <JS_AtomGetStrRT.constprop.0>
   2e6e8:	48 8d 35 d3 ae 0a 00 	lea    0xaaed3(%rip),%rsi        # d95c2 <_IO_stdin_used+0x5c2>
   2e6ef:	4c 89 ef             	mov    %r13,%rdi
   2e6f2:	48 89 c2             	mov    %rax,%rdx
   2e6f5:	31 c0                	xor    %eax,%eax
   2e6f7:	e8 84 79 00 00       	call   36080 <JS_ThrowReferenceError>
   2e6fc:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2e702:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2e708:	0f 8e 42 73 ff ff    	jle    25a50 <JS_CallInternal+0x740>
   2e70e:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e712:	89 ce                	mov    %ecx,%esi
   2e714:	e8 d7 c4 fe ff       	call   1abf0 <JS_FreeAtom.part.0.isra.0>
   2e719:	e9 32 73 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2e71e:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e722:	48 89 c2             	mov    %rax,%rdx
   2e725:	48 89 ce             	mov    %rcx,%rsi
   2e728:	4c 89 9d 30 fe ff ff 	mov    %r11,-0x1d0(%rbp)
   2e72f:	e8 3c 01 ff ff       	call   1e870 <__JS_FreeValueRT>
   2e734:	4c 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%r11
   2e73b:	e9 30 83 ff ff       	jmp    26a70 <JS_CallInternal+0x1760>
   2e740:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e744:	48 89 95 10 fe ff ff 	mov    %rdx,-0x1f0(%rbp)
   2e74b:	4c 89 fa             	mov    %r15,%rdx
   2e74e:	4c 89 85 30 fe ff ff 	mov    %r8,-0x1d0(%rbp)
   2e755:	e8 16 01 ff ff       	call   1e870 <__JS_FreeValueRT>
   2e75a:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   2e761:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2e768:	e9 29 ae ff ff       	jmp    29596 <JS_CallInternal+0x4286>
   2e76d:	4d 89 e7             	mov    %r12,%r15
   2e770:	e9 db 72 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2e775:	4d 89 e7             	mov    %r12,%r15
   2e778:	e9 d3 72 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2e77d:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2e781:	48 c7 43 e8 08 00 00 	movq   $0x8,-0x18(%rbx)
   2e788:	00 
   2e789:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
   2e78e:	f2 0f 11 43 e0       	movsd  %xmm0,-0x20(%rbx)
   2e793:	e9 26 b5 ff ff       	jmp    29cbe <JS_CallInternal+0x49ae>
   2e798:	83 fa 08             	cmp    $0x8,%edx
   2e79b:	0f 84 45 16 00 00    	je     2fde6 <JS_CallInternal+0xaad6>
   2e7a1:	83 f8 08             	cmp    $0x8,%eax
   2e7a4:	0f 85 4f 99 ff ff    	jne    280f9 <JS_CallInternal+0x2de9>
   2e7aa:	85 d2                	test   %edx,%edx
   2e7ac:	0f 85 47 99 ff ff    	jne    280f9 <JS_CallInternal+0x2de9>
   2e7b2:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2e7b6:	f2 0f 2a c7          	cvtsi2sd %edi,%xmm0
   2e7ba:	66 48 0f 6e c9       	movq   %rcx,%xmm1
   2e7bf:	f2 0f 5c c1          	subsd  %xmm1,%xmm0
   2e7c3:	48 c7 43 e8 08 00 00 	movq   $0x8,-0x18(%rbx)
   2e7ca:	00 
   2e7cb:	f2 0f 11 43 e0       	movsd  %xmm0,-0x20(%rbx)
   2e7d0:	e9 e9 b4 ff ff       	jmp    29cbe <JS_CallInternal+0x49ae>
   2e7d5:	48 8b b5 c0 fe ff ff 	mov    -0x140(%rbp),%rsi
   2e7dc:	0f b7 d1             	movzwl %cx,%edx
   2e7df:	4c 89 ef             	mov    %r13,%rdi
   2e7e2:	31 c9                	xor    %ecx,%ecx
   2e7e4:	e8 37 7a 00 00       	call   36220 <JS_ThrowReferenceErrorUninitialized2.isra.0>
   2e7e9:	e9 62 72 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2e7ee:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2e7f2:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
   2e7f7:	48 c7 43 e8 08 00 00 	movq   $0x8,-0x18(%rbx)
   2e7fe:	00 
   2e7ff:	48 83 eb 10          	sub    $0x10,%rbx
   2e803:	f2 0f 11 43 f0       	movsd  %xmm0,-0x10(%rbx)
   2e808:	e9 48 ba ff ff       	jmp    2a255 <JS_CallInternal+0x4f45>
   2e80d:	83 fe 08             	cmp    $0x8,%esi
   2e810:	0f 84 f3 15 00 00    	je     2fe09 <JS_CallInternal+0xaaf9>
   2e816:	83 f8 08             	cmp    $0x8,%eax
   2e819:	0f 85 da 98 ff ff    	jne    280f9 <JS_CallInternal+0x2de9>
   2e81f:	85 f6                	test   %esi,%esi
   2e821:	0f 85 d2 98 ff ff    	jne    280f9 <JS_CallInternal+0x2de9>
   2e827:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2e82b:	f2 0f 2a c9          	cvtsi2sd %ecx,%xmm1
   2e82f:	66 48 0f 6e c2       	movq   %rdx,%xmm0
   2e834:	f2 0f 59 c1          	mulsd  %xmm1,%xmm0
   2e838:	eb bd                	jmp    2e7f7 <JS_CallInternal+0x94e7>
   2e83a:	48 8b 85 c0 fe ff ff 	mov    -0x140(%rbp),%rax
   2e841:	48 8d 15 75 ac 0a 00 	lea    0xaac75(%rip),%rdx        # d94bd <_IO_stdin_used+0x4bd>
   2e848:	48 8b 40 30          	mov    0x30(%rax),%rax
   2e84c:	8b 44 c8 04          	mov    0x4(%rax,%rcx,8),%eax
   2e850:	85 c0                	test   %eax,%eax
   2e852:	0f 85 77 15 00 00    	jne    2fdcf <JS_CallInternal+0xaabf>
   2e858:	48 8d 35 ba ac 0a 00 	lea    0xaacba(%rip),%rsi        # d9519 <_IO_stdin_used+0x519>
   2e85f:	4c 89 ef             	mov    %r13,%rdi
   2e862:	31 c0                	xor    %eax,%eax
   2e864:	e8 17 78 00 00       	call   36080 <JS_ThrowReferenceError>
   2e869:	e9 e2 71 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2e86e:	c7 85 dc fe ff ff ff 	movl   $0xffffffff,-0x124(%rbp)
   2e875:	ff ff ff 
   2e878:	49 8b 72 08          	mov    0x8(%r10),%rsi
   2e87c:	83 fe f6             	cmp    $0xfffffff6,%esi
   2e87f:	0f 87 03 0a 00 00    	ja     2f288 <JS_CallInternal+0x9f78>
   2e885:	49 c7 02 00 00 00 00 	movq   $0x0,(%r10)
   2e88c:	49 c7 42 08 03 00 00 	movq   $0x3,0x8(%r10)
   2e893:	00 
   2e894:	e9 b7 71 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2e899:	48 8d 35 20 e5 0a 00 	lea    0xae520(%rip),%rsi        # dcdc0 <_IO_stdin_used+0x3dc0>
   2e8a0:	4c 89 ef             	mov    %r13,%rdi
   2e8a3:	31 c0                	xor    %eax,%eax
   2e8a5:	e8 d6 77 00 00       	call   36080 <JS_ThrowReferenceError>
   2e8aa:	e9 a1 71 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2e8af:	48 8b b5 c0 fe ff ff 	mov    -0x140(%rbp),%rsi
   2e8b6:	0f b7 d1             	movzwl %cx,%edx
   2e8b9:	4c 89 ef             	mov    %r13,%rdi
   2e8bc:	31 c9                	xor    %ecx,%ecx
   2e8be:	e8 5d 79 00 00       	call   36220 <JS_ThrowReferenceErrorUninitialized2.isra.0>
   2e8c3:	e9 88 71 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2e8c8:	48 8b b5 c0 fe ff ff 	mov    -0x140(%rbp),%rsi
   2e8cf:	48 8b bd 90 fe ff ff 	mov    -0x170(%rbp),%rdi
   2e8d6:	0f b7 d1             	movzwl %cx,%edx
   2e8d9:	31 c9                	xor    %ecx,%ecx
   2e8db:	e8 40 79 00 00       	call   36220 <JS_ThrowReferenceErrorUninitialized2.isra.0>
   2e8e0:	e9 6b 71 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2e8e5:	ba 01 00 00 00       	mov    $0x1,%edx
   2e8ea:	be 03 00 00 00       	mov    $0x3,%esi
   2e8ef:	31 ff                	xor    %edi,%edi
   2e8f1:	e9 3f d1 ff ff       	jmp    2ba35 <JS_CallInternal+0x6725>
   2e8f6:	4d 89 e7             	mov    %r12,%r15
   2e8f9:	e9 52 71 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2e8fe:	4d 89 e7             	mov    %r12,%r15
   2e901:	e9 4a 71 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2e906:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e90a:	48 89 c2             	mov    %rax,%rdx
   2e90d:	48 89 ce             	mov    %rcx,%rsi
   2e910:	4c 89 9d f0 fd ff ff 	mov    %r11,-0x210(%rbp)
   2e917:	e8 54 ff fe ff       	call   1e870 <__JS_FreeValueRT>
   2e91c:	4c 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%r11
   2e923:	e9 6c 84 ff ff       	jmp    26d94 <JS_CallInternal+0x1a84>
   2e928:	41 83 ff fa          	cmp    $0xfffffffa,%r15d
   2e92c:	0f 8d 69 0a 00 00    	jge    2f39b <JS_CallInternal+0xa08b>
   2e932:	41 83 ff f8          	cmp    $0xfffffff8,%r15d
   2e936:	0f 8d 03 e7 ff ff    	jge    2d03f <JS_CallInternal+0x7d2f>
   2e93c:	83 e8 02             	sub    $0x2,%eax
   2e93f:	83 f8 01             	cmp    $0x1,%eax
   2e942:	0f 87 94 e6 ff ff    	ja     2cfdc <JS_CallInternal+0x7ccc>
   2e948:	48 8d 35 5d ac 0a 00 	lea    0xaac5d(%rip),%rsi        # d95ac <_IO_stdin_used+0x5ac>
   2e94f:	4c 89 ef             	mov    %r13,%rdi
   2e952:	31 c0                	xor    %eax,%eax
   2e954:	4d 89 e7             	mov    %r12,%r15
   2e957:	e8 34 58 00 00       	call   34190 <JS_ThrowTypeError>
   2e95c:	e9 ef 70 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2e961:	83 fe 08             	cmp    $0x8,%esi
   2e964:	0f 84 07 13 00 00    	je     2fc71 <JS_CallInternal+0xa961>
   2e96a:	83 f9 08             	cmp    $0x8,%ecx
   2e96d:	75 08                	jne    2e977 <JS_CallInternal+0x9667>
   2e96f:	85 f6                	test   %esi,%esi
   2e971:	0f 84 3e 14 00 00    	je     2fdb5 <JS_CallInternal+0xaaa5>
   2e977:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2e97e:	44 89 d2             	mov    %r10d,%edx
   2e981:	48 89 de             	mov    %rbx,%rsi
   2e984:	4c 89 ef             	mov    %r13,%rdi
   2e987:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2e98b:	e8 60 df 02 00       	call   5c8f0 <js_relational_slow>
   2e990:	85 c0                	test   %eax,%eax
   2e992:	0f 85 84 16 00 00    	jne    3001c <JS_CallInternal+0xad0c>
   2e998:	48 83 eb 10          	sub    $0x10,%rbx
   2e99c:	e9 83 b4 ff ff       	jmp    29e24 <JS_CallInternal+0x4b14>
   2e9a1:	83 fa 08             	cmp    $0x8,%edx
   2e9a4:	0f 84 0a 0f 00 00    	je     2f8b4 <JS_CallInternal+0xa5a4>
   2e9aa:	83 fa ff             	cmp    $0xffffffff,%edx
   2e9ad:	0f 84 bd 0e 00 00    	je     2f870 <JS_CallInternal+0xa560>
   2e9b3:	8d 42 fe             	lea    -0x2(%rdx),%eax
   2e9b6:	83 f8 01             	cmp    $0x1,%eax
   2e9b9:	0f 86 87 0e 00 00    	jbe    2f846 <JS_CallInternal+0xa536>
   2e9bf:	83 fa f9             	cmp    $0xfffffff9,%edx
   2e9c2:	0f 85 d0 e7 ff ff    	jne    2d198 <JS_CallInternal+0x7e88>
   2e9c8:	41 83 ff f9          	cmp    $0xfffffff9,%r15d
   2e9cc:	0f 85 c6 e7 ff ff    	jne    2d198 <JS_CallInternal+0x7e88>
   2e9d2:	4c 89 c6             	mov    %r8,%rsi
   2e9d5:	4c 89 85 00 fe ff ff 	mov    %r8,-0x200(%rbp)
   2e9dc:	48 89 bd 10 fe ff ff 	mov    %rdi,-0x1f0(%rbp)
   2e9e3:	48 89 95 f0 fd ff ff 	mov    %rdx,-0x210(%rbp)
   2e9ea:	e8 01 aa fe ff       	call   193f0 <js_string_eq.isra.0>
   2e9ef:	48 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%rdx
   2e9f6:	4c 89 ef             	mov    %r13,%rdi
   2e9f9:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2e9ff:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2ea06:	48 89 c6             	mov    %rax,%rsi
   2ea09:	e8 e2 ff fe ff       	call   1e9f0 <JS_FreeValue>
   2ea0e:	4c 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%r8
   2ea15:	4c 89 c6             	mov    %r8,%rsi
   2ea18:	4c 89 fa             	mov    %r15,%rdx
   2ea1b:	4c 89 ef             	mov    %r13,%rdi
   2ea1e:	e8 cd ff fe ff       	call   1e9f0 <JS_FreeValue>
   2ea23:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2ea29:	e9 96 b3 ff ff       	jmp    29dc4 <JS_CallInternal+0x4ab4>
   2ea2e:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2ea35:	44 89 d2             	mov    %r10d,%edx
   2ea38:	48 89 de             	mov    %rbx,%rsi
   2ea3b:	4c 89 ef             	mov    %r13,%rdi
   2ea3e:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2ea42:	e8 a9 41 02 00       	call   52bf0 <js_binary_logic_slow>
   2ea47:	85 c0                	test   %eax,%eax
   2ea49:	0f 85 25 14 00 00    	jne    2fe74 <JS_CallInternal+0xab64>
   2ea4f:	48 83 eb 10          	sub    $0x10,%rbx
   2ea53:	e9 5b b4 ff ff       	jmp    29eb3 <JS_CallInternal+0x4ba3>
   2ea58:	48 8d 35 36 ab 0a 00 	lea    0xaab36(%rip),%rsi        # d9595 <_IO_stdin_used+0x595>
   2ea5f:	4c 89 ef             	mov    %r13,%rdi
   2ea62:	31 c0                	xor    %eax,%eax
   2ea64:	4d 89 e7             	mov    %r12,%r15
   2ea67:	e8 24 57 00 00       	call   34190 <JS_ThrowTypeError>
   2ea6c:	e9 ea ca ff ff       	jmp    2b55b <JS_CallInternal+0x624b>
   2ea71:	48 83 ec 08          	sub    $0x8,%rsp
   2ea75:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2ea79:	48 8b 7b f8          	mov    -0x8(%rbx),%rdi
   2ea7d:	48 83 eb 10          	sub    $0x10,%rbx
   2ea81:	41 8b 49 04          	mov    0x4(%r9),%ecx
   2ea85:	49 8b 85 80 01 00 00 	mov    0x180(%r13),%rax
   2ea8c:	49 8b 95 88 01 00 00 	mov    0x188(%r13),%rdx
   2ea93:	68 00 80 00 00       	push   $0x8000
   2ea98:	49 89 f0             	mov    %rsi,%r8
   2ea9b:	49 89 f9             	mov    %rdi,%r9
   2ea9e:	41 ff b5 88 01 00 00 	push   0x188(%r13)
   2eaa5:	48 89 c6             	mov    %rax,%rsi
   2eaa8:	4c 89 ef             	mov    %r13,%rdi
   2eaab:	41 ff b5 80 01 00 00 	push   0x180(%r13)
   2eab2:	e8 89 24 00 00       	call   30f40 <JS_SetPropertyInternal>
   2eab7:	48 83 c4 20          	add    $0x20,%rsp
   2eabb:	85 c0                	test   %eax,%eax
   2eabd:	0f 89 8f 78 ff ff    	jns    26352 <JS_CallInternal+0x1042>
   2eac3:	e9 88 6f ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2eac8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   2eacf:	00 
   2ead0:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2ead4:	b8 08 00 00 00       	mov    $0x8,%eax
   2ead9:	f2 48 0f 2a c1       	cvtsi2sd %rcx,%xmm0
   2eade:	f2 41 0f 11 01       	movsd  %xmm0,(%r9)
   2eae3:	e9 47 c2 ff ff       	jmp    2ad2f <JS_CallInternal+0x5a1f>
   2eae8:	83 f8 08             	cmp    $0x8,%eax
   2eaeb:	0f 84 3d 0f 00 00    	je     2fa2e <JS_CallInternal+0xa71e>
   2eaf1:	83 f8 f9             	cmp    $0xfffffff9,%eax
   2eaf4:	0f 84 9c 04 00 00    	je     2ef96 <JS_CallInternal+0x9c86>
   2eafa:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   2eb01:	4c 89 7e 30          	mov    %r15,0x30(%rsi)
   2eb05:	49 8b 31             	mov    (%r9),%rsi
   2eb08:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2eb0b:	0f 87 9c 04 00 00    	ja     2efad <JS_CallInternal+0x9c9d>
   2eb11:	48 89 b5 50 ff ff ff 	mov    %rsi,-0xb0(%rbp)
   2eb18:	4c 89 ef             	mov    %r13,%rdi
   2eb1b:	48 83 eb 10          	sub    $0x10,%rbx
   2eb1f:	48 8d b5 70 ff ff ff 	lea    -0x90(%rbp),%rsi
   2eb26:	4c 89 8d 30 fe ff ff 	mov    %r9,-0x1d0(%rbp)
   2eb2d:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
   2eb34:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
   2eb3b:	48 89 85 58 ff ff ff 	mov    %rax,-0xa8(%rbp)
   2eb42:	e8 d9 88 02 00       	call   57420 <js_add_slow>
   2eb47:	85 c0                	test   %eax,%eax
   2eb49:	0f 85 01 6f ff ff    	jne    25a50 <JS_CallInternal+0x740>
   2eb4f:	4c 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9
   2eb56:	48 8b 95 50 ff ff ff 	mov    -0xb0(%rbp),%rdx
   2eb5d:	49 8b 09             	mov    (%r9),%rcx
   2eb60:	49 8b 41 08          	mov    0x8(%r9),%rax
   2eb64:	49 89 11             	mov    %rdx,(%r9)
   2eb67:	48 8b 95 58 ff ff ff 	mov    -0xa8(%rbp),%rdx
   2eb6e:	49 89 51 08          	mov    %rdx,0x8(%r9)
   2eb72:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2eb75:	0f 86 bc c1 ff ff    	jbe    2ad37 <JS_CallInternal+0x5a27>
   2eb7b:	8b 71 fc             	mov    -0x4(%rcx),%esi
   2eb7e:	8d 56 ff             	lea    -0x1(%rsi),%edx
   2eb81:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2eb84:	85 d2                	test   %edx,%edx
   2eb86:	0f 8f ab c1 ff ff    	jg     2ad37 <JS_CallInternal+0x5a27>
   2eb8c:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2eb90:	48 89 c2             	mov    %rax,%rdx
   2eb93:	48 89 ce             	mov    %rcx,%rsi
   2eb96:	e8 d5 fc fe ff       	call   1e870 <__JS_FreeValueRT>
   2eb9b:	e9 97 c1 ff ff       	jmp    2ad37 <JS_CallInternal+0x5a27>
   2eba0:	4c 89 ef             	mov    %r13,%rdi
   2eba3:	e8 98 78 00 00       	call   36440 <__js_poll_interrupts>
   2eba8:	85 c0                	test   %eax,%eax
   2ebaa:	0f 85 a0 6e ff ff    	jne    25a50 <JS_CallInternal+0x740>
   2ebb0:	e9 b7 c0 ff ff       	jmp    2ac6c <JS_CallInternal+0x595c>
   2ebb5:	0f 1f 00             	nopl   (%rax)
   2ebb8:	48 8d 15 fe a8 0a 00 	lea    0xaa8fe(%rip),%rdx        # d94bd <_IO_stdin_used+0x4bd>
   2ebbf:	85 c9                	test   %ecx,%ecx
   2ebc1:	0f 85 83 0e 00 00    	jne    2fa4a <JS_CallInternal+0xa73a>
   2ebc7:	48 8d 35 4b a9 0a 00 	lea    0xaa94b(%rip),%rsi        # d9519 <_IO_stdin_used+0x519>
   2ebce:	4c 89 ef             	mov    %r13,%rdi
   2ebd1:	31 c0                	xor    %eax,%eax
   2ebd3:	e8 a8 74 00 00       	call   36080 <JS_ThrowReferenceError>
   2ebd8:	e9 73 6e ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2ebdd:	48 8d 35 a3 a9 0a 00 	lea    0xaa9a3(%rip),%rsi        # d9587 <_IO_stdin_used+0x587>
   2ebe4:	4c 89 ef             	mov    %r13,%rdi
   2ebe7:	31 c0                	xor    %eax,%eax
   2ebe9:	4d 89 e7             	mov    %r12,%r15
   2ebec:	e8 9f 55 00 00       	call   34190 <JS_ThrowTypeError>
   2ebf1:	e9 65 c9 ff ff       	jmp    2b55b <JS_CallInternal+0x624b>
   2ebf6:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   2ebfd:	44 89 d2             	mov    %r10d,%edx
   2ec00:	48 89 de             	mov    %rbx,%rsi
   2ec03:	4c 89 ef             	mov    %r13,%rdi
   2ec06:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2ec0a:	e8 e1 3f 02 00       	call   52bf0 <js_binary_logic_slow>
   2ec0f:	85 c0                	test   %eax,%eax
   2ec11:	0f 85 2d 14 00 00    	jne    30044 <JS_CallInternal+0xad34>
   2ec17:	48 83 eb 10          	sub    $0x10,%rbx
   2ec1b:	e9 22 b3 ff ff       	jmp    29f42 <JS_CallInternal+0x4c32>
   2ec20:	4c 89 ef             	mov    %r13,%rdi
   2ec23:	e8 18 78 00 00       	call   36440 <__js_poll_interrupts>
   2ec28:	85 c0                	test   %eax,%eax
   2ec2a:	0f 85 20 6e ff ff    	jne    25a50 <JS_CallInternal+0x740>
   2ec30:	e9 5d b6 ff ff       	jmp    2a292 <JS_CallInternal+0x4f82>
   2ec35:	0f 1f 00             	nopl   (%rax)
   2ec38:	4c 89 ef             	mov    %r13,%rdi
   2ec3b:	e8 00 78 00 00       	call   36440 <__js_poll_interrupts>
   2ec40:	85 c0                	test   %eax,%eax
   2ec42:	0f 85 08 6e ff ff    	jne    25a50 <JS_CallInternal+0x740>
   2ec48:	e9 80 b6 ff ff       	jmp    2a2cd <JS_CallInternal+0x4fbd>
   2ec4d:	0f 1f 00             	nopl   (%rax)
   2ec50:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   2ec57:	48 c7 43 08 03 00 00 	movq   $0x3,0x8(%rbx)
   2ec5e:	00 
   2ec5f:	e9 0c b7 ff ff       	jmp    2a370 <JS_CallInternal+0x5060>
   2ec64:	4d 89 e7             	mov    %r12,%r15
   2ec67:	4c 89 db             	mov    %r11,%rbx
   2ec6a:	e9 e1 6d ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2ec6f:	0f 85 60 12 00 00    	jne    2fed5 <JS_CallInternal+0xabc5>
   2ec75:	49 8b 45 10          	mov    0x10(%r13),%rax
   2ec79:	48 8b 80 f0 04 00 00 	mov    0x4f0(%rax),%rax
   2ec80:	48 85 c0             	test   %rax,%rax
   2ec83:	0f 84 5a 7d ff ff    	je     269e3 <JS_CallInternal+0x16d3>
   2ec89:	f6 40 3c 01          	testb  $0x1,0x3c(%rax)
   2ec8d:	0f 84 50 7d ff ff    	je     269e3 <JS_CallInternal+0x16d3>
   2ec93:	89 ce                	mov    %ecx,%esi
   2ec95:	4c 89 ef             	mov    %r13,%rdi
   2ec98:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2ec9e:	4d 89 e7             	mov    %r12,%r15
   2eca1:	e8 1a 75 00 00       	call   361c0 <JS_ThrowReferenceErrorNotDefined>
   2eca6:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2ecac:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2ecb2:	0f 8e 98 6d ff ff    	jle    25a50 <JS_CallInternal+0x740>
   2ecb8:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ecbc:	89 ce                	mov    %ecx,%esi
   2ecbe:	e8 2d bf fe ff       	call   1abf0 <JS_FreeAtom.part.0.isra.0>
   2ecc3:	e9 88 6d ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2ecc8:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2eccc:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2ecd0:	89 ca                	mov    %ecx,%edx
   2ecd2:	e8 f9 9c fe ff       	call   189d0 <JS_AtomGetStrRT.constprop.0>
   2ecd7:	48 8d 35 7b a8 0a 00 	lea    0xaa87b(%rip),%rsi        # d9559 <_IO_stdin_used+0x559>
   2ecde:	4c 89 ef             	mov    %r13,%rdi
   2ece1:	48 89 c2             	mov    %rax,%rdx
   2ece4:	31 c0                	xor    %eax,%eax
   2ece6:	e8 a5 54 00 00       	call   34190 <JS_ThrowTypeError>
   2eceb:	e9 60 6d ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2ecf0:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ecf4:	48 89 ce             	mov    %rcx,%rsi
   2ecf7:	e8 74 fb fe ff       	call   1e870 <__JS_FreeValueRT>
   2ecfc:	e9 6c 7e ff ff       	jmp    26b6d <JS_CallInternal+0x185d>
   2ed01:	09 ca                	or     %ecx,%edx
   2ed03:	0f 89 39 b5 ff ff    	jns    2a242 <JS_CallInternal+0x4f32>
   2ed09:	f2 0f 10 05 6f 7d 0b 	movsd  0xb7d6f(%rip),%xmm0        # e6a80 <typed_array_size_log2+0x28>
   2ed10:	00 
   2ed11:	e9 e1 fa ff ff       	jmp    2e7f7 <JS_CallInternal+0x94e7>
   2ed16:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   2ed1d:	00 00 00 
   2ed20:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ed24:	4c 89 d6             	mov    %r10,%rsi
   2ed27:	4c 89 da             	mov    %r11,%rdx
   2ed2a:	e8 41 fb fe ff       	call   1e870 <__JS_FreeValueRT>
   2ed2f:	e9 85 c9 ff ff       	jmp    2b6b9 <JS_CallInternal+0x63a9>
   2ed34:	4d 89 e7             	mov    %r12,%r15
   2ed37:	e9 1f c8 ff ff       	jmp    2b55b <JS_CallInternal+0x624b>
   2ed3c:	8b 02                	mov    (%rdx),%eax
   2ed3e:	25 ff ff ff 03       	and    $0x3ffffff,%eax
   2ed43:	0f 85 89 c0 ff ff    	jne    2add2 <JS_CallInternal+0x5ac2>
   2ed49:	48 8d 0d f4 a3 0a 00 	lea    0xaa3f4(%rip),%rcx        # d9144 <_IO_stdin_used+0x144>
   2ed50:	4c 89 ef             	mov    %r13,%rdi
   2ed53:	31 c0                	xor    %eax,%eax
   2ed55:	48 8d 15 ac e0 0a 00 	lea    0xae0ac(%rip),%rdx        # dce08 <_IO_stdin_used+0x3e08>
   2ed5c:	e8 3f 56 00 00       	call   343a0 <__JS_ThrowTypeErrorAtom>
   2ed61:	e9 8d f3 ff ff       	jmp    2e0f3 <JS_CallInternal+0x8de3>
   2ed66:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   2ed6d:	00 00 00 
   2ed70:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ed74:	4c 89 fe             	mov    %r15,%rsi
   2ed77:	4c 89 c2             	mov    %r8,%rdx
   2ed7a:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2ed80:	e8 eb fa fe ff       	call   1e870 <__JS_FreeValueRT>
   2ed85:	8b 85 30 fe ff ff    	mov    -0x1d0(%rbp),%eax
   2ed8b:	e9 72 ac ff ff       	jmp    29a02 <JS_CallInternal+0x46f2>
   2ed90:	0f 85 ab 11 00 00    	jne    2ff41 <JS_CallInternal+0xac31>
   2ed96:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ed9a:	48 8b 87 f0 04 00 00 	mov    0x4f0(%rdi),%rax
   2eda1:	48 85 c0             	test   %rax,%rax
   2eda4:	0f 84 f3 06 00 00    	je     2f49d <JS_CallInternal+0xa18d>
   2edaa:	f6 40 3c 01          	testb  $0x1,0x3c(%rax)
   2edae:	0f 84 e9 06 00 00    	je     2f49d <JS_CallInternal+0xa18d>
   2edb4:	89 ce                	mov    %ecx,%esi
   2edb6:	4c 89 ef             	mov    %r13,%rdi
   2edb9:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2edbf:	4d 89 e7             	mov    %r12,%r15
   2edc2:	e8 f9 73 00 00       	call   361c0 <JS_ThrowReferenceErrorNotDefined>
   2edc7:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   2edcd:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2edd3:	0f 8e 77 6c ff ff    	jle    25a50 <JS_CallInternal+0x740>
   2edd9:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2eddd:	89 ce                	mov    %ecx,%esi
   2eddf:	e8 0c be fe ff       	call   1abf0 <JS_FreeAtom.part.0.isra.0>
   2ede4:	e9 67 6c ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2ede9:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2eded:	48 89 c2             	mov    %rax,%rdx
   2edf0:	48 89 ce             	mov    %rcx,%rsi
   2edf3:	e8 78 fa fe ff       	call   1e870 <__JS_FreeValueRT>
   2edf8:	e9 91 7d ff ff       	jmp    26b8e <JS_CallInternal+0x187e>
   2edfd:	4d 89 e7             	mov    %r12,%r15
   2ee00:	e9 4b 6c ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2ee05:	81 fa f2 00 00 00    	cmp    $0xf2,%edx
   2ee0b:	7e 21                	jle    2ee2e <JS_CallInternal+0x9b1e>
   2ee0d:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ee11:	48 8b 87 48 04 00 00 	mov    0x448(%rdi),%rax
   2ee18:	48 8b 34 d0          	mov    (%rax,%rdx,8),%rsi
   2ee1c:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2ee1f:	83 e8 01             	sub    $0x1,%eax
   2ee22:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2ee25:	85 c0                	test   %eax,%eax
   2ee27:	7f 05                	jg     2ee2e <JS_CallInternal+0x9b1e>
   2ee29:	e8 72 7b fe ff       	call   169a0 <JS_FreeAtomStruct>
   2ee2e:	48 8d 35 9b de 0a 00 	lea    0xade9b(%rip),%rsi        # dccd0 <_IO_stdin_used+0x3cd0>
   2ee35:	4c 89 ef             	mov    %r13,%rdi
   2ee38:	31 c0                	xor    %eax,%eax
   2ee3a:	e8 51 53 00 00       	call   34190 <JS_ThrowTypeError>
   2ee3f:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   2ee46:	48 c7 43 08 06 00 00 	movq   $0x6,0x8(%rbx)
   2ee4d:	00 
   2ee4e:	e9 e1 9c ff ff       	jmp    28b34 <JS_CallInternal+0x3824>
   2ee53:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ee57:	4c 89 ca             	mov    %r9,%rdx
   2ee5a:	89 85 10 fe ff ff    	mov    %eax,-0x1f0(%rbp)
   2ee60:	4c 89 85 30 fe ff ff 	mov    %r8,-0x1d0(%rbp)
   2ee67:	e8 04 fa fe ff       	call   1e870 <__JS_FreeValueRT>
   2ee6c:	8b 85 10 fe ff ff    	mov    -0x1f0(%rbp),%eax
   2ee72:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2ee79:	e9 6b ab ff ff       	jmp    299e9 <JS_CallInternal+0x46d9>
   2ee7e:	4d 89 e7             	mov    %r12,%r15
   2ee81:	e9 ca 6b ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2ee86:	39 c1                	cmp    %eax,%ecx
   2ee88:	0f 85 fb da ff ff    	jne    2c989 <JS_CallInternal+0x7679>
   2ee8e:	0f b6 4a 10          	movzbl 0x10(%rdx),%ecx
   2ee92:	f7 d1                	not    %ecx
   2ee94:	83 e1 12             	and    $0x12,%ecx
   2ee97:	0f 85 ec da ff ff    	jne    2c989 <JS_CallInternal+0x7679>
   2ee9d:	48 8b 7a 18          	mov    0x18(%rdx),%rdi
   2eea1:	48 8b 4f 30          	mov    0x30(%rdi),%rcx
   2eea5:	48 85 c9             	test   %rcx,%rcx
   2eea8:	74 0a                	je     2eeb4 <JS_CallInternal+0x9ba4>
   2eeaa:	f6 41 10 01          	testb  $0x1,0x10(%rcx)
   2eeae:	0f 84 d5 da ff ff    	je     2c989 <JS_CallInternal+0x7679>
   2eeb4:	48 8b 72 20          	mov    0x20(%rdx),%rsi
   2eeb8:	83 7e 08 00          	cmpl   $0x0,0x8(%rsi)
   2eebc:	0f 85 c7 da ff ff    	jne    2c989 <JS_CallInternal+0x7679>
   2eec2:	8d 48 01             	lea    0x1(%rax),%ecx
   2eec5:	39 4a 28             	cmp    %ecx,0x28(%rdx)
   2eec8:	0f 82 bb da ff ff    	jb     2c989 <JS_CallInternal+0x7679>
   2eece:	39 0e                	cmp    %ecx,(%rsi)
   2eed0:	73 1c                	jae    2eeee <JS_CallInternal+0x9bde>
   2eed2:	44 8b 47 18          	mov    0x18(%rdi),%r8d
   2eed6:	42 f6 44 87 3f 08    	testb  $0x8,0x3f(%rdi,%r8,4)
   2eedc:	0f 84 a7 da ff ff    	je     2c989 <JS_CallInternal+0x7679>
   2eee2:	89 cf                	mov    %ecx,%edi
   2eee4:	45 31 db             	xor    %r11d,%r11d
   2eee7:	48 89 3e             	mov    %rdi,(%rsi)
   2eeea:	4c 89 5e 08          	mov    %r11,0x8(%rsi)
   2eeee:	89 4a 38             	mov    %ecx,0x38(%rdx)
   2eef1:	89 c0                	mov    %eax,%eax
   2eef3:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2eef8:	48 c1 e0 04          	shl    $0x4,%rax
   2eefc:	48 03 42 30          	add    0x30(%rdx),%rax
   2ef00:	0f 11 00             	movups %xmm0,(%rax)
   2ef03:	e9 65 7c ff ff       	jmp    26b6d <JS_CallInternal+0x185d>
   2ef08:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   2ef0f:	00 
   2ef10:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ef14:	48 89 ce             	mov    %rcx,%rsi
   2ef17:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   2ef1e:	4c 89 9d 30 fe ff ff 	mov    %r11,-0x1d0(%rbp)
   2ef25:	e8 46 f9 fe ff       	call   1e870 <__JS_FreeValueRT>
   2ef2a:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   2ef31:	4c 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%r11
   2ef38:	e9 63 c7 ff ff       	jmp    2b6a0 <JS_CallInternal+0x6390>
   2ef3d:	0f 85 0d 6b ff ff    	jne    25a50 <JS_CallInternal+0x740>
   2ef43:	49 8b 45 10          	mov    0x10(%r13),%rax
   2ef47:	48 8b 80 f0 04 00 00 	mov    0x4f0(%rax),%rax
   2ef4e:	48 85 c0             	test   %rax,%rax
   2ef51:	0f 84 aa 6f ff ff    	je     25f01 <JS_CallInternal+0xbf1>
   2ef57:	f6 40 3c 01          	testb  $0x1,0x3c(%rax)
   2ef5b:	0f 84 a0 6f ff ff    	je     25f01 <JS_CallInternal+0xbf1>
   2ef61:	8b b5 f0 fd ff ff    	mov    -0x210(%rbp),%esi
   2ef67:	4c 89 ef             	mov    %r13,%rdi
   2ef6a:	e8 51 72 00 00       	call   361c0 <JS_ThrowReferenceErrorNotDefined>
   2ef6f:	e9 dc 6a ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2ef74:	f2 0f 10 05 7c 04 0b 	movsd  0xb047c(%rip),%xmm0        # df3f8 <__PRETTY_FUNCTION__.0+0xb8>
   2ef7b:	00 
   2ef7c:	e9 55 d5 ff ff       	jmp    2c4d6 <JS_CallInternal+0x71c6>
   2ef81:	49 8b 17             	mov    (%r15),%rdx
   2ef84:	41 b8 06 00 00 00    	mov    $0x6,%r8d
   2ef8a:	31 c9                	xor    %ecx,%ecx
   2ef8c:	b8 06 00 00 00       	mov    $0x6,%eax
   2ef91:	e9 90 bf ff ff       	jmp    2af26 <JS_CallInternal+0x5c16>
   2ef96:	83 f9 f9             	cmp    $0xfffffff9,%ecx
   2ef99:	0f 84 ad 10 00 00    	je     3004c <JS_CallInternal+0xad3c>
   2ef9f:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   2efa6:	4c 89 7e 30          	mov    %r15,0x30(%rsi)
   2efaa:	49 8b 31             	mov    (%r9),%rsi
   2efad:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2efb1:	e9 5b fb ff ff       	jmp    2eb11 <JS_CallInternal+0x9801>
   2efb6:	4d 89 e7             	mov    %r12,%r15
   2efb9:	e9 92 6a ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2efbe:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2efc2:	48 89 c2             	mov    %rax,%rdx
   2efc5:	e8 a6 f8 fe ff       	call   1e870 <__JS_FreeValueRT>
   2efca:	e9 e7 81 ff ff       	jmp    271b6 <JS_CallInternal+0x1ea6>
   2efcf:	f2 0f 10 05 a9 7a 0b 	movsd  0xb7aa9(%rip),%xmm0        # e6a80 <typed_array_size_log2+0x28>
   2efd6:	00 
   2efd7:	e9 fa d4 ff ff       	jmp    2c4d6 <JS_CallInternal+0x71c6>
   2efdc:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2efe0:	48 89 c2             	mov    %rax,%rdx
   2efe3:	e8 88 f8 fe ff       	call   1e870 <__JS_FreeValueRT>
   2efe8:	e9 54 d5 ff ff       	jmp    2c541 <JS_CallInternal+0x7231>
   2efed:	48 8d 35 4c dd 0a 00 	lea    0xadd4c(%rip),%rsi        # dcd40 <_IO_stdin_used+0x3d40>
   2eff4:	4c 89 ef             	mov    %r13,%rdi
   2eff7:	31 c0                	xor    %eax,%eax
   2eff9:	4d 89 e7             	mov    %r12,%r15
   2effc:	e8 8f 51 00 00       	call   34190 <JS_ThrowTypeError>
   2f001:	e9 4a 6a ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2f006:	81 fa f2 00 00 00    	cmp    $0xf2,%edx
   2f00c:	0f 8e 1c fe ff ff    	jle    2ee2e <JS_CallInternal+0x9b1e>
   2f012:	31 c0                	xor    %eax,%eax
   2f014:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f018:	48 8b 8f 48 04 00 00 	mov    0x448(%rdi),%rcx
   2f01f:	48 8b 34 d1          	mov    (%rcx,%rdx,8),%rsi
   2f023:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   2f026:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2f029:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2f02c:	85 d2                	test   %edx,%edx
   2f02e:	7f 13                	jg     2f043 <JS_CallInternal+0x9d33>
   2f030:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2f037:	e8 64 79 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2f03c:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2f043:	48 85 c0             	test   %rax,%rax
   2f046:	0f 85 06 9c ff ff    	jne    28c52 <JS_CallInternal+0x3942>
   2f04c:	e9 dd fd ff ff       	jmp    2ee2e <JS_CallInternal+0x9b1e>
   2f051:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   2f058:	48 8b bd b0 fe ff ff 	mov    -0x150(%rbp),%rdi
   2f05f:	4c 89 c6             	mov    %r8,%rsi
   2f062:	e8 d9 39 ff ff       	call   22a40 <free_var_ref>
   2f067:	e9 4a 6c ff ff       	jmp    25cb6 <JS_CallInternal+0x9a6>
   2f06c:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f070:	48 89 ca             	mov    %rcx,%rdx
   2f073:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2f079:	e8 f2 f7 fe ff       	call   1e870 <__JS_FreeValueRT>
   2f07e:	8b 85 30 fe ff ff    	mov    -0x1d0(%rbp),%eax
   2f084:	e9 d5 6e ff ff       	jmp    25f5e <JS_CallInternal+0xc4e>
   2f089:	48 63 b5 a8 fe ff ff 	movslq -0x158(%rbp),%rsi
   2f090:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f094:	48 89 95 f0 fd ff ff 	mov    %rdx,-0x210(%rbp)
   2f09b:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2f0a2:	48 c1 e6 04          	shl    $0x4,%rsi
   2f0a6:	48 89 b5 10 fe ff ff 	mov    %rsi,-0x1f0(%rbp)
   2f0ad:	e8 ce 6d fe ff       	call   15e80 <__js_malloc>
   2f0b2:	4c 8b 95 98 fe ff ff 	mov    -0x168(%rbp),%r10
   2f0b9:	48 8b b5 10 fe ff ff 	mov    -0x1f0(%rbp),%rsi
   2f0c0:	48 89 c2             	mov    %rax,%rdx
   2f0c3:	31 c0                	xor    %eax,%eax
   2f0c5:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2f0cc:	4c 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8
   2f0d3:	48 85 d2             	test   %rdx,%rdx
   2f0d6:	0f 84 18 0e 00 00    	je     2fef4 <JS_CallInternal+0xabe4>
   2f0dc:	4d 8b 4c 02 08       	mov    0x8(%r10,%rax,1),%r9
   2f0e1:	49 8b 3c 02          	mov    (%r10,%rax,1),%rdi
   2f0e5:	41 83 f9 f6          	cmp    $0xfffffff6,%r9d
   2f0e9:	76 04                	jbe    2f0ef <JS_CallInternal+0x9ddf>
   2f0eb:	83 47 fc 01          	addl   $0x1,-0x4(%rdi)
   2f0ef:	48 89 3c 02          	mov    %rdi,(%rdx,%rax,1)
   2f0f3:	4c 89 4c 02 08       	mov    %r9,0x8(%rdx,%rax,1)
   2f0f8:	48 83 c0 10          	add    $0x10,%rax
   2f0fc:	48 39 c6             	cmp    %rax,%rsi
   2f0ff:	75 db                	jne    2f0dc <JS_CallInternal+0x9dcc>
   2f101:	8b 85 a8 fe ff ff    	mov    -0x158(%rbp),%eax
   2f107:	48 89 51 30          	mov    %rdx,0x30(%rcx)
   2f10b:	89 41 38             	mov    %eax,0x38(%rcx)
   2f10e:	48 89 0b             	mov    %rcx,(%rbx)
   2f111:	4c 89 43 08          	mov    %r8,0x8(%rbx)
   2f115:	e9 27 99 ff ff       	jmp    28a41 <JS_CallInternal+0x3731>
   2f11a:	48 89 f2             	mov    %rsi,%rdx
   2f11d:	48 89 fe             	mov    %rdi,%rsi
   2f120:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f124:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   2f12b:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2f132:	44 89 85 10 fe ff ff 	mov    %r8d,-0x1f0(%rbp)
   2f139:	4c 89 95 30 fe ff ff 	mov    %r10,-0x1d0(%rbp)
   2f140:	e8 2b f7 fe ff       	call   1e870 <__JS_FreeValueRT>
   2f145:	48 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%rax
   2f14c:	48 8b 8d 00 fe ff ff 	mov    -0x200(%rbp),%rcx
   2f153:	44 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%r8d
   2f15a:	4c 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%r10
   2f161:	e9 84 e2 ff ff       	jmp    2d3ea <JS_CallInternal+0x80da>
   2f166:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f16a:	48 89 c2             	mov    %rax,%rdx
   2f16d:	48 89 ce             	mov    %rcx,%rsi
   2f170:	4c 89 9d 30 fe ff ff 	mov    %r11,-0x1d0(%rbp)
   2f177:	e8 f4 f6 fe ff       	call   1e870 <__JS_FreeValueRT>
   2f17c:	4c 8b 9d 30 fe ff ff 	mov    -0x1d0(%rbp),%r11
   2f183:	e9 d3 b3 ff ff       	jmp    2a55b <JS_CallInternal+0x524b>
   2f188:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f18c:	4c 89 d6             	mov    %r10,%rsi
   2f18f:	4c 89 da             	mov    %r11,%rdx
   2f192:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2f198:	e8 d3 f6 fe ff       	call   1e870 <__JS_FreeValueRT>
   2f19d:	8b 85 30 fe ff ff    	mov    -0x1d0(%rbp),%eax
   2f1a3:	e9 2d dc ff ff       	jmp    2cdd5 <JS_CallInternal+0x7ac5>
   2f1a8:	0f 85 a2 68 ff ff    	jne    25a50 <JS_CallInternal+0x740>
   2f1ae:	49 8b 45 10          	mov    0x10(%r13),%rax
   2f1b2:	48 8b 80 f0 04 00 00 	mov    0x4f0(%rax),%rax
   2f1b9:	48 85 c0             	test   %rax,%rax
   2f1bc:	0f 84 eb 0a 00 00    	je     2fcad <JS_CallInternal+0xa99d>
   2f1c2:	f6 40 3c 01          	testb  $0x1,0x3c(%rax)
   2f1c6:	0f 84 e1 0a 00 00    	je     2fcad <JS_CallInternal+0xa99d>
   2f1cc:	8b b5 f0 fd ff ff    	mov    -0x210(%rbp),%esi
   2f1d2:	4c 89 ef             	mov    %r13,%rdi
   2f1d5:	e8 e6 6f 00 00       	call   361c0 <JS_ThrowReferenceErrorNotDefined>
   2f1da:	e9 71 68 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2f1df:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f1e3:	48 89 c2             	mov    %rax,%rdx
   2f1e6:	48 89 ce             	mov    %rcx,%rsi
   2f1e9:	e8 82 f6 fe ff       	call   1e870 <__JS_FreeValueRT>
   2f1ee:	e9 ce 6c ff ff       	jmp    25ec1 <JS_CallInternal+0xbb1>
   2f1f3:	66 83 78 12 01       	cmpw   $0x1,0x12(%rax)
   2f1f8:	0f 85 23 c0 ff ff    	jne    2b221 <JS_CallInternal+0x5f11>
   2f1fe:	f6 40 10 08          	testb  $0x8,0x10(%rax)
   2f202:	0f 85 19 c0 ff ff    	jne    2b221 <JS_CallInternal+0x5f11>
   2f208:	80 7f 10 00          	cmpb   $0x0,0x10(%rdi)
   2f20c:	0f 84 0f c0 ff ff    	je     2b221 <JS_CallInternal+0x5f11>
   2f212:	49 8b 72 08          	mov    0x8(%r10),%rsi
   2f216:	45 31 db             	xor    %r11d,%r11d
   2f219:	48 c1 fa 04          	sar    $0x4,%rdx
   2f21d:	49 8b 02             	mov    (%r10),%rax
   2f220:	83 47 fc 01          	addl   $0x1,-0x4(%rdi)
   2f224:	49 89 3a             	mov    %rdi,(%r10)
   2f227:	4d 89 5a 08          	mov    %r11,0x8(%r10)
   2f22b:	41 89 52 10          	mov    %edx,0x10(%r10)
   2f22f:	48 85 f6             	test   %rsi,%rsi
   2f232:	74 25                	je     2f259 <JS_CallInternal+0x9f49>
   2f234:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f238:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2f23f:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2f246:	e8 a5 12 ff ff       	call   204f0 <js_free_shape>
   2f24b:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2f252:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2f259:	48 85 c0             	test   %rax,%rax
   2f25c:	0f 84 bf bf ff ff    	je     2b221 <JS_CallInternal+0x5f11>
   2f262:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f266:	48 89 c6             	mov    %rax,%rsi
   2f269:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2f270:	e8 7b 12 ff ff       	call   204f0 <js_free_shape>
   2f275:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2f27c:	e9 a0 bf ff ff       	jmp    2b221 <JS_CallInternal+0x5f11>
   2f281:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   2f288:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
   2f28e:	e9 43 e1 ff ff       	jmp    2d3d6 <JS_CallInternal+0x80c6>
   2f293:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f297:	48 89 c2             	mov    %rax,%rdx
   2f29a:	48 89 ce             	mov    %rcx,%rsi
   2f29d:	e8 ce f5 fe ff       	call   1e870 <__JS_FreeValueRT>
   2f2a2:	e9 3e d7 ff ff       	jmp    2c9e5 <JS_CallInternal+0x76d5>
   2f2a7:	8b 09                	mov    (%rcx),%ecx
   2f2a9:	81 e1 ff ff ff 03    	and    $0x3ffffff,%ecx
   2f2af:	0f 85 1e a8 ff ff    	jne    29ad3 <JS_CallInternal+0x47c3>
   2f2b5:	31 c9                	xor    %ecx,%ecx
   2f2b7:	e9 2d a8 ff ff       	jmp    29ae9 <JS_CallInternal+0x47d9>
   2f2bc:	66 41 83 7a 12 01    	cmpw   $0x1,0x12(%r10)
   2f2c2:	0f 85 96 be ff ff    	jne    2b15e <JS_CallInternal+0x5e4e>
   2f2c8:	41 f6 42 10 08       	testb  $0x8,0x10(%r10)
   2f2cd:	0f 85 8b be ff ff    	jne    2b15e <JS_CallInternal+0x5e4e>
   2f2d3:	80 7a 10 00          	cmpb   $0x0,0x10(%rdx)
   2f2d7:	0f 84 81 be ff ff    	je     2b15e <JS_CallInternal+0x5e4e>
   2f2dd:	49 8b 79 08          	mov    0x8(%r9),%rdi
   2f2e1:	45 31 c0             	xor    %r8d,%r8d
   2f2e4:	48 c1 fe 04          	sar    $0x4,%rsi
   2f2e8:	49 8b 09             	mov    (%r9),%rcx
   2f2eb:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2f2ef:	49 89 11             	mov    %rdx,(%r9)
   2f2f2:	4d 89 41 08          	mov    %r8,0x8(%r9)
   2f2f6:	41 89 71 10          	mov    %esi,0x10(%r9)
   2f2fa:	48 85 ff             	test   %rdi,%rdi
   2f2fd:	74 28                	je     2f327 <JS_CallInternal+0xa017>
   2f2ff:	48 89 fe             	mov    %rdi,%rsi
   2f302:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f306:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   2f30d:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2f314:	e8 d7 11 ff ff       	call   204f0 <js_free_shape>
   2f319:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   2f320:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2f327:	48 85 c9             	test   %rcx,%rcx
   2f32a:	0f 84 2e be ff ff    	je     2b15e <JS_CallInternal+0x5e4e>
   2f330:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f334:	48 89 ce             	mov    %rcx,%rsi
   2f337:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2f33e:	e8 ad 11 ff ff       	call   204f0 <js_free_shape>
   2f343:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2f34a:	e9 0f be ff ff       	jmp    2b15e <JS_CallInternal+0x5e4e>
   2f34f:	90                   	nop
   2f350:	41 83 fa f6          	cmp    $0xfffffff6,%r10d
   2f354:	0f 86 9c e6 ff ff    	jbe    2d9f6 <JS_CallInternal+0x86e6>
   2f35a:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2f35d:	83 e8 01             	sub    $0x1,%eax
   2f360:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2f363:	85 c0                	test   %eax,%eax
   2f365:	0f 8f 8b e6 ff ff    	jg     2d9f6 <JS_CallInternal+0x86e6>
   2f36b:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f36f:	48 89 ce             	mov    %rcx,%rsi
   2f372:	4c 89 d2             	mov    %r10,%rdx
   2f375:	4c 89 85 10 fe ff ff 	mov    %r8,-0x1f0(%rbp)
   2f37c:	4c 89 8d 30 fe ff ff 	mov    %r9,-0x1d0(%rbp)
   2f383:	e8 e8 f4 fe ff       	call   1e870 <__JS_FreeValueRT>
   2f388:	4c 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9
   2f38f:	4c 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%r8
   2f396:	e9 5b e6 ff ff       	jmp    2d9f6 <JS_CallInternal+0x86e6>
   2f39b:	45 85 ff             	test   %r15d,%r15d
   2f39e:	0f 85 98 f5 ff ff    	jne    2e93c <JS_CallInternal+0x962c>
   2f3a4:	e9 96 dc ff ff       	jmp    2d03f <JS_CallInternal+0x7d2f>
   2f3a9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   2f3b0:	49 8b 95 88 01 00 00 	mov    0x188(%r13),%rdx
   2f3b7:	49 8b 85 80 01 00 00 	mov    0x180(%r13),%rax
   2f3be:	83 fa f6             	cmp    $0xfffffff6,%edx
   2f3c1:	76 04                	jbe    2f3c7 <JS_CallInternal+0xa0b7>
   2f3c3:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2f3c7:	48 89 43 d0          	mov    %rax,-0x30(%rbx)
   2f3cb:	48 89 53 d8          	mov    %rdx,-0x28(%rbx)
   2f3cf:	e9 d9 75 ff ff       	jmp    269ad <JS_CallInternal+0x169d>
   2f3d4:	4c 39 da             	cmp    %r11,%rdx
   2f3d7:	0f 85 06 bd ff ff    	jne    2b0e3 <JS_CallInternal+0x5dd3>
   2f3dd:	41 8b 41 10          	mov    0x10(%r9),%eax
   2f3e1:	83 f8 ff             	cmp    $0xffffffff,%eax
   2f3e4:	0f 84 f9 bc ff ff    	je     2b0e3 <JS_CallInternal+0x5dd3>
   2f3ea:	48 c1 e0 04          	shl    $0x4,%rax
   2f3ee:	49 03 42 20          	add    0x20(%r10),%rax
   2f3f2:	48 8b 10             	mov    (%rax),%rdx
   2f3f5:	48 8b 40 08          	mov    0x8(%rax),%rax
   2f3f9:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2f3fc:	0f 86 c6 db ff ff    	jbe    2cfc8 <JS_CallInternal+0x7cb8>
   2f402:	e9 bd db ff ff       	jmp    2cfc4 <JS_CallInternal+0x7cb4>
   2f407:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   2f40e:	00 00 
   2f410:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f414:	89 f2                	mov    %esi,%edx
   2f416:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2f41a:	e8 b1 95 fe ff       	call   189d0 <JS_AtomGetStrRT.constprop.0>
   2f41f:	48 89 c2             	mov    %rax,%rdx
   2f422:	e9 9b 9e ff ff       	jmp    292c2 <JS_CallInternal+0x3fb2>
   2f427:	8b 85 70 fe ff ff    	mov    -0x190(%rbp),%eax
   2f42d:	83 e8 02             	sub    $0x2,%eax
   2f430:	83 f8 01             	cmp    $0x1,%eax
   2f433:	0f 87 d5 00 00 00    	ja     2f50e <JS_CallInternal+0xa1fe>
   2f439:	49 8b 85 88 01 00 00 	mov    0x188(%r13),%rax
   2f440:	49 8b 95 80 01 00 00 	mov    0x180(%r13),%rdx
   2f447:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2f44a:	0f 86 ff 93 ff ff    	jbe    2884f <JS_CallInternal+0x353f>
   2f450:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2f454:	e9 f6 93 ff ff       	jmp    2884f <JS_CallInternal+0x353f>
   2f459:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f45d:	48 89 c2             	mov    %rax,%rdx
   2f460:	48 89 ce             	mov    %rcx,%rsi
   2f463:	e8 08 f4 fe ff       	call   1e870 <__JS_FreeValueRT>
   2f468:	e9 12 d1 ff ff       	jmp    2c57f <JS_CallInternal+0x726f>
   2f46d:	48 89 f2             	mov    %rsi,%rdx
   2f470:	48 89 fe             	mov    %rdi,%rsi
   2f473:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f477:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2f47e:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   2f485:	e8 e6 f3 fe ff       	call   1e870 <__JS_FreeValueRT>
   2f48a:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2f491:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2f498:	e9 98 d3 ff ff       	jmp    2c835 <JS_CallInternal+0x7525>
   2f49d:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2f4a3:	0f 8f 95 00 00 00    	jg     2f53e <JS_CallInternal+0xa22e>
   2f4a9:	45 31 ff             	xor    %r15d,%r15d
   2f4ac:	b8 03 00 00 00       	mov    $0x3,%eax
   2f4b1:	e9 8a 77 ff ff       	jmp    26c40 <JS_CallInternal+0x1930>
   2f4b6:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f4ba:	4c 89 c6             	mov    %r8,%rsi
   2f4bd:	48 89 da             	mov    %rbx,%rdx
   2f4c0:	e8 ab f3 fe ff       	call   1e870 <__JS_FreeValueRT>
   2f4c5:	48 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%rcx
   2f4cc:	e9 a8 eb ff ff       	jmp    2e079 <JS_CallInternal+0x8d69>
   2f4d1:	48 8b 85 b0 fe ff ff 	mov    -0x150(%rbp),%rax
   2f4d8:	31 d2                	xor    %edx,%edx
   2f4da:	48 63 c9             	movslq %ecx,%rcx
   2f4dd:	f3 0f 6f 80 d8 04 00 	movdqu 0x4d8(%rax),%xmm0
   2f4e4:	00 
   2f4e5:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   2f4e9:	48 89 90 d8 04 00 00 	mov    %rdx,0x4d8(%rax)
   2f4f0:	48 c7 80 e0 04 00 00 	movq   $0x4,0x4e0(%rax)
   2f4f7:	04 00 00 00 
   2f4fb:	48 8b 85 c0 fe ff ff 	mov    -0x140(%rbp),%rax
   2f502:	48 03 48 18          	add    0x18(%rax),%rcx
   2f506:	49 89 cf             	mov    %rcx,%r15
   2f509:	e9 c3 60 ff ff       	jmp    255d1 <JS_CallInternal+0x2c1>
   2f50e:	48 8b 85 50 fe ff ff 	mov    -0x1b0(%rbp),%rax
   2f515:	48 8b 95 70 fe ff ff 	mov    -0x190(%rbp),%rdx
   2f51c:	4c 89 ef             	mov    %r13,%rdi
   2f51f:	48 89 c6             	mov    %rax,%rsi
   2f522:	e8 69 c0 01 00       	call   4b590 <JS_ToObject>
   2f527:	48 89 c1             	mov    %rax,%rcx
   2f52a:	48 89 d0             	mov    %rdx,%rax
   2f52d:	83 fa 06             	cmp    $0x6,%edx
   2f530:	0f 84 2f 0a 00 00    	je     2ff65 <JS_CallInternal+0xac55>
   2f536:	48 89 ca             	mov    %rcx,%rdx
   2f539:	e9 11 93 ff ff       	jmp    2884f <JS_CallInternal+0x353f>
   2f53e:	48 8b 87 48 04 00 00 	mov    0x448(%rdi),%rax
   2f545:	48 8b 34 c8          	mov    (%rax,%rcx,8),%rsi
   2f549:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2f54c:	83 e8 01             	sub    $0x1,%eax
   2f54f:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2f552:	85 c0                	test   %eax,%eax
   2f554:	0f 8f 4f ff ff ff    	jg     2f4a9 <JS_CallInternal+0xa199>
   2f55a:	e8 41 74 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2f55f:	e9 45 ff ff ff       	jmp    2f4a9 <JS_CallInternal+0xa199>
   2f564:	66 48 0f 6e c0       	movq   %rax,%xmm0
   2f569:	83 f9 08             	cmp    $0x8,%ecx
   2f56c:	74 3e                	je     2f5ac <JS_CallInternal+0xa29c>
   2f56e:	85 c9                	test   %ecx,%ecx
   2f570:	0f 85 c4 ec ff ff    	jne    2e23a <JS_CallInternal+0x8f2a>
   2f576:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2f57a:	f2 0f 2a ca          	cvtsi2sd %edx,%xmm1
   2f57e:	31 c0                	xor    %eax,%eax
   2f580:	66 0f 2f c8          	comisd %xmm0,%xmm1
   2f584:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   2f58b:	00 
   2f58c:	0f 93 c0             	setae  %al
   2f58f:	48 83 eb 10          	sub    $0x10,%rbx
   2f593:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2f597:	e9 64 a9 ff ff       	jmp    29f00 <JS_CallInternal+0x4bf0>
   2f59c:	4d 89 e7             	mov    %r12,%r15
   2f59f:	e9 ac 64 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2f5a4:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2f5a8:	f2 0f 2a c0          	cvtsi2sd %eax,%xmm0
   2f5ac:	66 48 0f 6e ca       	movq   %rdx,%xmm1
   2f5b1:	eb cb                	jmp    2f57e <JS_CallInternal+0xa26e>
   2f5b3:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f5b7:	48 89 c2             	mov    %rax,%rdx
   2f5ba:	48 89 ce             	mov    %rcx,%rsi
   2f5bd:	e8 ae f2 fe ff       	call   1e870 <__JS_FreeValueRT>
   2f5c2:	e9 51 de ff ff       	jmp    2d418 <JS_CallInternal+0x8108>
   2f5c7:	4d 89 e7             	mov    %r12,%r15
   2f5ca:	e9 81 64 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2f5cf:	85 d2                	test   %edx,%edx
   2f5d1:	0f 85 ea eb ff ff    	jne    2e1c1 <JS_CallInternal+0x8eb1>
   2f5d7:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2f5db:	f2 0f 2a cf          	cvtsi2sd %edi,%xmm1
   2f5df:	66 48 0f 6e c1       	movq   %rcx,%xmm0
   2f5e4:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
   2f5e8:	48 c7 43 e8 08 00 00 	movq   $0x8,-0x18(%rbx)
   2f5ef:	00 
   2f5f0:	f2 0f 11 43 e0       	movsd  %xmm0,-0x20(%rbx)
   2f5f5:	e9 c5 ae ff ff       	jmp    2a4bf <JS_CallInternal+0x51af>
   2f5fa:	66 48 0f 6e cf       	movq   %rdi,%xmm1
   2f5ff:	83 f8 08             	cmp    $0x8,%eax
   2f602:	74 db                	je     2f5df <JS_CallInternal+0xa2cf>
   2f604:	85 c0                	test   %eax,%eax
   2f606:	0f 85 b5 eb ff ff    	jne    2e1c1 <JS_CallInternal+0x8eb1>
   2f60c:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2f610:	f2 0f 2a c1          	cvtsi2sd %ecx,%xmm0
   2f614:	eb ce                	jmp    2f5e4 <JS_CallInternal+0xa2d4>
   2f616:	8d 70 07             	lea    0x7(%rax),%esi
   2f619:	83 fe 01             	cmp    $0x1,%esi
   2f61c:	0f 87 9f eb ff ff    	ja     2e1c1 <JS_CallInternal+0x8eb1>
   2f622:	48 89 fe             	mov    %rdi,%rsi
   2f625:	49 89 c0             	mov    %rax,%r8
   2f628:	4c 89 ef             	mov    %r13,%rdi
   2f62b:	4d 89 e7             	mov    %r12,%r15
   2f62e:	e8 9d 4c 01 00       	call   442d0 <JS_ConcatString>
   2f633:	48 8d 5b f0          	lea    -0x10(%rbx),%rbx
   2f637:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2f63b:	83 7b f8 06          	cmpl   $0x6,-0x8(%rbx)
   2f63f:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2f643:	0f 85 7a ae ff ff    	jne    2a4c3 <JS_CallInternal+0x51b3>
   2f649:	e9 02 64 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2f64e:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2f652:	f2 0f 2a c0          	cvtsi2sd %eax,%xmm0
   2f656:	66 48 0f 6e ca       	movq   %rdx,%xmm1
   2f65b:	31 c0                	xor    %eax,%eax
   2f65d:	66 0f 2f c8          	comisd %xmm0,%xmm1
   2f661:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   2f668:	00 
   2f669:	0f 97 c0             	seta   %al
   2f66c:	48 83 eb 10          	sub    $0x10,%rbx
   2f670:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2f674:	e9 16 a5 ff ff       	jmp    29b8f <JS_CallInternal+0x487f>
   2f679:	48 8d 35 56 9f 0a 00 	lea    0xa9f56(%rip),%rsi        # d95d6 <_IO_stdin_used+0x5d6>
   2f680:	4c 89 ef             	mov    %r13,%rdi
   2f683:	31 c0                	xor    %eax,%eax
   2f685:	4d 89 e7             	mov    %r12,%r15
   2f688:	e8 03 4b 00 00       	call   34190 <JS_ThrowTypeError>
   2f68d:	e9 be 63 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2f692:	66 48 0f 6e c0       	movq   %rax,%xmm0
   2f697:	83 f9 08             	cmp    $0x8,%ecx
   2f69a:	74 ba                	je     2f656 <JS_CallInternal+0xa346>
   2f69c:	85 c9                	test   %ecx,%ecx
   2f69e:	0f 85 4a ec ff ff    	jne    2e2ee <JS_CallInternal+0x8fde>
   2f6a4:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2f6a8:	f2 0f 2a ca          	cvtsi2sd %edx,%xmm1
   2f6ac:	eb ad                	jmp    2f65b <JS_CallInternal+0xa34b>
   2f6ae:	8d 41 fe             	lea    -0x2(%rcx),%eax
   2f6b1:	83 f8 01             	cmp    $0x1,%eax
   2f6b4:	0f 86 d4 08 00 00    	jbe    2ff8e <JS_CallInternal+0xac7e>
   2f6ba:	83 f9 ff             	cmp    $0xffffffff,%ecx
   2f6bd:	0f 85 a3 da ff ff    	jne    2d166 <JS_CallInternal+0x7e56>
   2f6c3:	45 0f b6 78 11       	movzbl 0x11(%r8),%r15d
   2f6c8:	4c 89 c6             	mov    %r8,%rsi
   2f6cb:	48 89 ca             	mov    %rcx,%rdx
   2f6ce:	4c 89 ef             	mov    %r13,%rdi
   2f6d1:	41 83 e7 01          	and    $0x1,%r15d
   2f6d5:	e8 16 f3 fe ff       	call   1e9f0 <JS_FreeValue>
   2f6da:	e9 5f a1 ff ff       	jmp    2983e <JS_CallInternal+0x452e>
   2f6df:	8d 41 fe             	lea    -0x2(%rcx),%eax
   2f6e2:	83 f8 01             	cmp    $0x1,%eax
   2f6e5:	0f 86 18 09 00 00    	jbe    30003 <JS_CallInternal+0xacf3>
   2f6eb:	83 f9 ff             	cmp    $0xffffffff,%ecx
   2f6ee:	0f 85 72 da ff ff    	jne    2d166 <JS_CallInternal+0x7e56>
   2f6f4:	4c 39 c7             	cmp    %r8,%rdi
   2f6f7:	48 89 fe             	mov    %rdi,%rsi
   2f6fa:	4c 89 ef             	mov    %r13,%rdi
   2f6fd:	4c 89 85 30 fe ff ff 	mov    %r8,-0x1d0(%rbp)
   2f704:	41 0f 94 c7          	sete   %r15b
   2f708:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   2f70f:	e8 dc f2 fe ff       	call   1e9f0 <JS_FreeValue>
   2f714:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2f71b:	4c 89 ef             	mov    %r13,%rdi
   2f71e:	45 0f b6 ff          	movzbl %r15b,%r15d
   2f722:	4c 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%r9
   2f729:	4c 89 c6             	mov    %r8,%rsi
   2f72c:	4c 89 ca             	mov    %r9,%rdx
   2f72f:	e8 bc f2 fe ff       	call   1e9f0 <JS_FreeValue>
   2f734:	e9 05 a1 ff ff       	jmp    2983e <JS_CallInternal+0x452e>
   2f739:	4d 89 e7             	mov    %r12,%r15
   2f73c:	e9 0f 63 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2f741:	85 c9                	test   %ecx,%ecx
   2f743:	75 70                	jne    2f7b5 <JS_CallInternal+0xa4a5>
   2f745:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2f749:	66 48 0f 6e ef       	movq   %rdi,%xmm5
   2f74e:	45 31 ff             	xor    %r15d,%r15d
   2f751:	f2 41 0f 2a c0       	cvtsi2sd %r8d,%xmm0
   2f756:	66 0f 2e c5          	ucomisd %xmm5,%xmm0
   2f75a:	41 0f 9b c7          	setnp  %r15b
   2f75e:	44 0f 45 f9          	cmovne %ecx,%r15d
   2f762:	e9 d7 a0 ff ff       	jmp    2983e <JS_CallInternal+0x452e>
   2f767:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f76b:	4c 89 d6             	mov    %r10,%rsi
   2f76e:	4c 89 fa             	mov    %r15,%rdx
   2f771:	e8 fa f0 fe ff       	call   1e870 <__JS_FreeValueRT>
   2f776:	e9 9e db ff ff       	jmp    2d319 <JS_CallInternal+0x8009>
   2f77b:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f77f:	4c 89 c6             	mov    %r8,%rsi
   2f782:	4c 89 e2             	mov    %r12,%rdx
   2f785:	89 85 00 fe ff ff    	mov    %eax,-0x200(%rbp)
   2f78b:	44 89 95 10 fe ff ff 	mov    %r10d,-0x1f0(%rbp)
   2f792:	e8 d9 f0 fe ff       	call   1e870 <__JS_FreeValueRT>
   2f797:	8b 85 00 fe ff ff    	mov    -0x200(%rbp),%eax
   2f79d:	44 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10d
   2f7a4:	e9 b9 c5 ff ff       	jmp    2bd62 <JS_CallInternal+0x6a52>
   2f7a9:	48 83 eb 10          	sub    $0x10,%rbx
   2f7ad:	4d 89 e7             	mov    %r12,%r15
   2f7b0:	e9 9b 62 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2f7b5:	83 f9 08             	cmp    $0x8,%ecx
   2f7b8:	0f 85 a8 d9 ff ff    	jne    2d166 <JS_CallInternal+0x7e56>
   2f7be:	66 48 0f 6e f7       	movq   %rdi,%xmm6
   2f7c3:	66 49 0f 6e f8       	movq   %r8,%xmm7
   2f7c8:	45 31 ff             	xor    %r15d,%r15d
   2f7cb:	b8 00 00 00 00       	mov    $0x0,%eax
   2f7d0:	66 0f 2e f7          	ucomisd %xmm7,%xmm6
   2f7d4:	41 0f 9b c7          	setnp  %r15b
   2f7d8:	44 0f 45 f8          	cmovne %eax,%r15d
   2f7dc:	e9 5d a0 ff ff       	jmp    2983e <JS_CallInternal+0x452e>
   2f7e1:	41 b8 06 00 00 00    	mov    $0x6,%r8d
   2f7e7:	31 c9                	xor    %ecx,%ecx
   2f7e9:	b8 06 00 00 00       	mov    $0x6,%eax
   2f7ee:	e9 54 b7 ff ff       	jmp    2af47 <JS_CallInternal+0x5c37>
   2f7f3:	48 03 b5 a0 fe ff ff 	add    -0x160(%rbp),%rsi
   2f7fa:	e9 78 6a ff ff       	jmp    26277 <JS_CallInternal+0xf67>
   2f7ff:	66 48 0f 6e ca       	movq   %rdx,%xmm1
   2f804:	83 f9 08             	cmp    $0x8,%ecx
   2f807:	74 36                	je     2f83f <JS_CallInternal+0xa52f>
   2f809:	85 c9                	test   %ecx,%ecx
   2f80b:	0f 85 0d e7 ff ff    	jne    2df1e <JS_CallInternal+0x8c0e>
   2f811:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2f815:	f2 0f 2a c0          	cvtsi2sd %eax,%xmm0
   2f819:	31 c0                	xor    %eax,%eax
   2f81b:	66 0f 2f c8          	comisd %xmm0,%xmm1
   2f81f:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   2f826:	00 
   2f827:	0f 97 c0             	seta   %al
   2f82a:	48 83 eb 10          	sub    $0x10,%rbx
   2f82e:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2f832:	e9 3a a6 ff ff       	jmp    29e71 <JS_CallInternal+0x4b61>
   2f837:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2f83b:	f2 0f 2a ca          	cvtsi2sd %edx,%xmm1
   2f83f:	66 48 0f 6e c0       	movq   %rax,%xmm0
   2f844:	eb d3                	jmp    2f819 <JS_CallInternal+0xa509>
   2f846:	41 8d 47 fe          	lea    -0x2(%r15),%eax
   2f84a:	83 f8 01             	cmp    $0x1,%eax
   2f84d:	0f 86 db 08 00 00    	jbe    3012e <JS_CallInternal+0xae1e>
   2f853:	41 83 ff ff          	cmp    $0xffffffff,%r15d
   2f857:	0f 85 3b d9 ff ff    	jne    2d198 <JS_CallInternal+0x7e88>
   2f85d:	41 0f b6 48 11       	movzbl 0x11(%r8),%ecx
   2f862:	83 e1 01             	and    $0x1,%ecx
   2f865:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2f86b:	e9 a5 f1 ff ff       	jmp    2ea15 <JS_CallInternal+0x9705>
   2f870:	41 8d 47 fe          	lea    -0x2(%r15),%eax
   2f874:	83 f8 01             	cmp    $0x1,%eax
   2f877:	0f 86 bb 08 00 00    	jbe    30138 <JS_CallInternal+0xae28>
   2f87d:	41 83 ff ff          	cmp    $0xffffffff,%r15d
   2f881:	0f 85 11 d9 ff ff    	jne    2d198 <JS_CallInternal+0x7e88>
   2f887:	4c 39 c7             	cmp    %r8,%rdi
   2f88a:	48 89 fe             	mov    %rdi,%rsi
   2f88d:	4c 89 ef             	mov    %r13,%rdi
   2f890:	4c 89 85 10 fe ff ff 	mov    %r8,-0x1f0(%rbp)
   2f897:	0f 94 c1             	sete   %cl
   2f89a:	0f b6 c9             	movzbl %cl,%ecx
   2f89d:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   2f8a3:	e8 48 f1 fe ff       	call   1e9f0 <JS_FreeValue>
   2f8a8:	4c 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%r8
   2f8af:	e9 61 f1 ff ff       	jmp    2ea15 <JS_CallInternal+0x9705>
   2f8b4:	45 85 ff             	test   %r15d,%r15d
   2f8b7:	0f 85 de 00 00 00    	jne    2f99b <JS_CallInternal+0xa68b>
   2f8bd:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2f8c1:	66 48 0f 6e ef       	movq   %rdi,%xmm5
   2f8c6:	31 c9                	xor    %ecx,%ecx
   2f8c8:	f2 41 0f 2a c0       	cvtsi2sd %r8d,%xmm0
   2f8cd:	66 0f 2e c5          	ucomisd %xmm5,%xmm0
   2f8d1:	0f 9b c1             	setnp  %cl
   2f8d4:	41 0f 45 cf          	cmovne %r15d,%ecx
   2f8d8:	e9 e7 a4 ff ff       	jmp    29dc4 <JS_CallInternal+0x4ab4>
   2f8dd:	4d 89 fb             	mov    %r15,%r11
   2f8e0:	49 89 cf             	mov    %rcx,%r15
   2f8e3:	48 89 d7             	mov    %rdx,%rdi
   2f8e6:	45 31 c0             	xor    %r8d,%r8d
   2f8e9:	4c 89 d2             	mov    %r10,%rdx
   2f8ec:	4c 89 d9             	mov    %r11,%rcx
   2f8ef:	4c 89 fe             	mov    %r15,%rsi
   2f8f2:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   2f8f9:	4c 89 9d 08 fe ff ff 	mov    %r11,-0x1f8(%rbp)
   2f900:	48 89 bd 10 fe ff ff 	mov    %rdi,-0x1f0(%rbp)
   2f907:	e8 a4 c4 fe ff       	call   1bdb0 <js_strict_eq2.isra.0>
   2f90c:	48 8b b5 10 fe ff ff 	mov    -0x1f0(%rbp),%rsi
   2f913:	4c 89 fa             	mov    %r15,%rdx
   2f916:	4c 89 ef             	mov    %r13,%rdi
   2f919:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2f91f:	e8 cc f0 fe ff       	call   1e9f0 <JS_FreeValue>
   2f924:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   2f92b:	4c 8b 9d 08 fe ff ff 	mov    -0x1f8(%rbp),%r11
   2f932:	e9 2b ec ff ff       	jmp    2e562 <JS_CallInternal+0x9252>
   2f937:	31 c0                	xor    %eax,%eax
   2f939:	41 83 ff ff          	cmp    $0xffffffff,%r15d
   2f93d:	75 08                	jne    2f947 <JS_CallInternal+0xa637>
   2f93f:	31 c0                	xor    %eax,%eax
   2f941:	4c 39 d2             	cmp    %r10,%rdx
   2f944:	0f 94 c0             	sete   %al
   2f947:	48 89 d6             	mov    %rdx,%rsi
   2f94a:	4c 89 ef             	mov    %r13,%rdi
   2f94d:	48 89 ca             	mov    %rcx,%rdx
   2f950:	4c 89 95 10 fe ff ff 	mov    %r10,-0x1f0(%rbp)
   2f957:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2f95d:	e8 8e f0 fe ff       	call   1e9f0 <JS_FreeValue>
   2f962:	4c 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%r10
   2f969:	4d 89 fb             	mov    %r15,%r11
   2f96c:	e9 f1 eb ff ff       	jmp    2e562 <JS_CallInternal+0x9252>
   2f971:	45 85 ff             	test   %r15d,%r15d
   2f974:	75 4f                	jne    2f9c5 <JS_CallInternal+0xa6b5>
   2f976:	66 48 0f 6e ea       	movq   %rdx,%xmm5
   2f97b:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2f97f:	31 c0                	xor    %eax,%eax
   2f981:	ba 01 00 00 00       	mov    $0x1,%edx
   2f986:	f2 41 0f 2a c2       	cvtsi2sd %r10d,%xmm0
   2f98b:	66 0f 2e c5          	ucomisd %xmm5,%xmm0
   2f98f:	0f 9a c0             	setp   %al
   2f992:	48 0f 45 c2          	cmovne %rdx,%rax
   2f996:	e9 f6 9d ff ff       	jmp    29791 <JS_CallInternal+0x4481>
   2f99b:	41 83 ff 08          	cmp    $0x8,%r15d
   2f99f:	0f 85 f3 d7 ff ff    	jne    2d198 <JS_CallInternal+0x7e88>
   2f9a5:	66 48 0f 6e f7       	movq   %rdi,%xmm6
   2f9aa:	66 49 0f 6e f8       	movq   %r8,%xmm7
   2f9af:	31 c9                	xor    %ecx,%ecx
   2f9b1:	b8 00 00 00 00       	mov    $0x0,%eax
   2f9b6:	66 0f 2e f7          	ucomisd %xmm7,%xmm6
   2f9ba:	0f 9b c1             	setnp  %cl
   2f9bd:	0f 45 c8             	cmovne %eax,%ecx
   2f9c0:	e9 ff a3 ff ff       	jmp    29dc4 <JS_CallInternal+0x4ab4>
   2f9c5:	41 83 ff 08          	cmp    $0x8,%r15d
   2f9c9:	0f 85 e0 04 00 00    	jne    2feaf <JS_CallInternal+0xab9f>
   2f9cf:	66 48 0f 6e f2       	movq   %rdx,%xmm6
   2f9d4:	66 49 0f 6e fa       	movq   %r10,%xmm7
   2f9d9:	31 c0                	xor    %eax,%eax
   2f9db:	ba 01 00 00 00       	mov    $0x1,%edx
   2f9e0:	66 0f 2e f7          	ucomisd %xmm7,%xmm6
   2f9e4:	0f 9a c0             	setp   %al
   2f9e7:	48 0f 45 c2          	cmovne %rdx,%rax
   2f9eb:	e9 a1 9d ff ff       	jmp    29791 <JS_CallInternal+0x4481>
   2f9f0:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f9f4:	89 c2                	mov    %eax,%edx
   2f9f6:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2f9fa:	e8 d1 8f fe ff       	call   189d0 <JS_AtomGetStrRT.constprop.0>
   2f9ff:	48 89 c2             	mov    %rax,%rdx
   2fa02:	e9 37 e4 ff ff       	jmp    2de3e <JS_CallInternal+0x8b2e>
   2fa07:	4d 89 e7             	mov    %r12,%r15
   2fa0a:	e9 41 60 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2fa0f:	48 8d 35 d5 9a 0a 00 	lea    0xa9ad5(%rip),%rsi        # d94eb <_IO_stdin_used+0x4eb>
   2fa16:	4c 89 ef             	mov    %r13,%rdi
   2fa19:	4d 89 e7             	mov    %r12,%r15
   2fa1c:	e8 6f 47 00 00       	call   34190 <JS_ThrowTypeError>
   2fa21:	e9 2a 60 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2fa26:	4d 89 e7             	mov    %r12,%r15
   2fa29:	e9 22 60 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2fa2e:	83 f9 08             	cmp    $0x8,%ecx
   2fa31:	0f 84 45 04 00 00    	je     2fe7c <JS_CallInternal+0xab6c>
   2fa37:	48 8b b5 b8 fe ff ff 	mov    -0x148(%rbp),%rsi
   2fa3e:	4c 89 7e 30          	mov    %r15,0x30(%rsi)
   2fa42:	49 8b 31             	mov    (%r9),%rsi
   2fa45:	e9 c7 f0 ff ff       	jmp    2eb11 <JS_CallInternal+0x9801>
   2fa4a:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2fa4e:	89 ca                	mov    %ecx,%edx
   2fa50:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2fa54:	e8 77 8f fe ff       	call   189d0 <JS_AtomGetStrRT.constprop.0>
   2fa59:	48 89 c2             	mov    %rax,%rdx
   2fa5c:	e9 66 f1 ff ff       	jmp    2ebc7 <JS_CallInternal+0x98b7>
   2fa61:	4c 89 fb             	mov    %r15,%rbx
   2fa64:	4d 89 e7             	mov    %r12,%r15
   2fa67:	e9 e4 5f ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2fa6c:	48 8b bd 90 fe ff ff 	mov    -0x170(%rbp),%rdi
   2fa73:	48 8d 35 86 d2 0a 00 	lea    0xad286(%rip),%rsi        # dcd00 <_IO_stdin_used+0x3d00>
   2fa7a:	31 c0                	xor    %eax,%eax
   2fa7c:	4d 89 e7             	mov    %r12,%r15
   2fa7f:	e8 0c 47 00 00       	call   34190 <JS_ThrowTypeError>
   2fa84:	e9 c7 5f ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2fa89:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2fa8d:	89 c2                	mov    %eax,%edx
   2fa8f:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2fa93:	e8 38 8f fe ff       	call   189d0 <JS_AtomGetStrRT.constprop.0>
   2fa98:	48 89 c2             	mov    %rax,%rdx
   2fa9b:	e9 6e e7 ff ff       	jmp    2e20e <JS_CallInternal+0x8efe>
   2faa0:	48 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%rdx
   2faa7:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2faab:	48 89 ce             	mov    %rcx,%rsi
   2faae:	e8 bd ed fe ff       	call   1e870 <__JS_FreeValueRT>
   2fab3:	e9 62 e6 ff ff       	jmp    2e11a <JS_CallInternal+0x8e0a>
   2fab8:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2fabc:	48 89 ce             	mov    %rcx,%rsi
   2fabf:	48 89 da             	mov    %rbx,%rdx
   2fac2:	4c 89 85 f0 fd ff ff 	mov    %r8,-0x210(%rbp)
   2fac9:	e8 a2 ed fe ff       	call   1e870 <__JS_FreeValueRT>
   2face:	4c 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8
   2fad5:	e9 59 d6 ff ff       	jmp    2d133 <JS_CallInternal+0x7e23>
   2fada:	48 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%rdx
   2fae1:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2fae5:	48 89 de             	mov    %rbx,%rsi
   2fae8:	4c 89 85 30 fe ff ff 	mov    %r8,-0x1d0(%rbp)
   2faef:	e8 7c ed fe ff       	call   1e870 <__JS_FreeValueRT>
   2faf4:	4c 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%r8
   2fafb:	e9 5a d6 ff ff       	jmp    2d15a <JS_CallInternal+0x7e4a>
   2fb00:	48 8d 35 e1 d2 0a 00 	lea    0xad2e1(%rip),%rsi        # dcde8 <_IO_stdin_used+0x3de8>
   2fb07:	4c 89 ef             	mov    %r13,%rdi
   2fb0a:	31 c0                	xor    %eax,%eax
   2fb0c:	4d 89 e7             	mov    %r12,%r15
   2fb0f:	e8 7c 46 00 00       	call   34190 <JS_ThrowTypeError>
   2fb14:	e9 37 5f ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2fb19:	4d 89 c3             	mov    %r8,%r11
   2fb1c:	49 89 d7             	mov    %rdx,%r15
   2fb1f:	45 31 c0             	xor    %r8d,%r8d
   2fb22:	4c 89 d2             	mov    %r10,%rdx
   2fb25:	4c 89 d9             	mov    %r11,%rcx
   2fb28:	4c 89 fe             	mov    %r15,%rsi
   2fb2b:	4c 89 95 00 fe ff ff 	mov    %r10,-0x200(%rbp)
   2fb32:	4c 89 9d 08 fe ff ff 	mov    %r11,-0x1f8(%rbp)
   2fb39:	48 89 bd 10 fe ff ff 	mov    %rdi,-0x1f0(%rbp)
   2fb40:	e8 6b c2 fe ff       	call   1bdb0 <js_strict_eq2.isra.0>
   2fb45:	48 8b b5 10 fe ff ff 	mov    -0x1f0(%rbp),%rsi
   2fb4c:	4c 89 fa             	mov    %r15,%rdx
   2fb4f:	4c 89 ef             	mov    %r13,%rdi
   2fb52:	89 85 30 fe ff ff    	mov    %eax,-0x1d0(%rbp)
   2fb58:	e8 93 ee fe ff       	call   1e9f0 <JS_FreeValue>
   2fb5d:	4c 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%r10
   2fb64:	4c 8b 9d 08 fe ff ff 	mov    -0x1f8(%rbp),%r11
   2fb6b:	4c 89 ef             	mov    %r13,%rdi
   2fb6e:	4c 89 d6             	mov    %r10,%rsi
   2fb71:	4c 89 da             	mov    %r11,%rdx
   2fb74:	e8 77 ee fe ff       	call   1e9f0 <JS_FreeValue>
   2fb79:	4c 63 bd 30 fe ff ff 	movslq -0x1d0(%rbp),%r15
   2fb80:	e9 63 9c ff ff       	jmp    297e8 <JS_CallInternal+0x44d8>
   2fb85:	45 31 ff             	xor    %r15d,%r15d
   2fb88:	41 83 f8 ff          	cmp    $0xffffffff,%r8d
   2fb8c:	75 0a                	jne    2fb98 <JS_CallInternal+0xa888>
   2fb8e:	45 31 ff             	xor    %r15d,%r15d
   2fb91:	4c 39 d7             	cmp    %r10,%rdi
   2fb94:	41 0f 94 c7          	sete   %r15b
   2fb98:	48 89 fe             	mov    %rdi,%rsi
   2fb9b:	4c 89 ef             	mov    %r13,%rdi
   2fb9e:	4c 89 95 30 fe ff ff 	mov    %r10,-0x1d0(%rbp)
   2fba5:	4c 89 85 10 fe ff ff 	mov    %r8,-0x1f0(%rbp)
   2fbac:	e8 3f ee fe ff       	call   1e9f0 <JS_FreeValue>
   2fbb1:	4c 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%r10
   2fbb8:	4c 8b 9d 10 fe ff ff 	mov    -0x1f0(%rbp),%r11
   2fbbf:	4c 89 ef             	mov    %r13,%rdi
   2fbc2:	4c 89 d6             	mov    %r10,%rsi
   2fbc5:	4c 89 da             	mov    %r11,%rdx
   2fbc8:	e8 23 ee fe ff       	call   1e9f0 <JS_FreeValue>
   2fbcd:	e9 16 9c ff ff       	jmp    297e8 <JS_CallInternal+0x44d8>
   2fbd2:	45 85 c0             	test   %r8d,%r8d
   2fbd5:	75 6d                	jne    2fc44 <JS_CallInternal+0xa934>
   2fbd7:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2fbdb:	66 48 0f 6e ef       	movq   %rdi,%xmm5
   2fbe0:	45 31 ff             	xor    %r15d,%r15d
   2fbe3:	b8 00 00 00 00       	mov    $0x0,%eax
   2fbe8:	f2 41 0f 2a c2       	cvtsi2sd %r10d,%xmm0
   2fbed:	66 0f 2e c5          	ucomisd %xmm5,%xmm0
   2fbf1:	41 0f 9b c7          	setnp  %r15b
   2fbf5:	4c 0f 45 f8          	cmovne %rax,%r15
   2fbf9:	e9 ea 9b ff ff       	jmp    297e8 <JS_CallInternal+0x44d8>
   2fbfe:	31 ff                	xor    %edi,%edi
   2fc00:	48 c7 43 08 03 00 00 	movq   $0x3,0x8(%rbx)
   2fc07:	00 
   2fc08:	48 83 c3 10          	add    $0x10,%rbx
   2fc0c:	48 89 7b f0          	mov    %rdi,-0x10(%rbx)
   2fc10:	e9 33 8e ff ff       	jmp    28a48 <JS_CallInternal+0x3738>
   2fc15:	48 8d 35 6b 99 0a 00 	lea    0xa996b(%rip),%rsi        # d9587 <_IO_stdin_used+0x587>
   2fc1c:	4c 89 ef             	mov    %r13,%rdi
   2fc1f:	31 c0                	xor    %eax,%eax
   2fc21:	4d 89 e7             	mov    %r12,%r15
   2fc24:	e8 67 45 00 00       	call   34190 <JS_ThrowTypeError>
   2fc29:	e9 22 5e ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2fc2e:	31 ff                	xor    %edi,%edi
   2fc30:	48 c7 43 f8 03 00 00 	movq   $0x3,-0x8(%rbx)
   2fc37:	00 
   2fc38:	4d 89 e7             	mov    %r12,%r15
   2fc3b:	48 89 7b f0          	mov    %rdi,-0x10(%rbx)
   2fc3f:	e9 0c 5e ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2fc44:	41 83 f8 08          	cmp    $0x8,%r8d
   2fc48:	0f 85 74 02 00 00    	jne    2fec2 <JS_CallInternal+0xabb2>
   2fc4e:	66 48 0f 6e f7       	movq   %rdi,%xmm6
   2fc53:	66 49 0f 6e fa       	movq   %r10,%xmm7
   2fc58:	45 31 ff             	xor    %r15d,%r15d
   2fc5b:	b8 00 00 00 00       	mov    $0x0,%eax
   2fc60:	66 0f 2e f7          	ucomisd %xmm7,%xmm6
   2fc64:	41 0f 9b c7          	setnp  %r15b
   2fc68:	4c 0f 45 f8          	cmovne %rax,%r15
   2fc6c:	e9 77 9b ff ff       	jmp    297e8 <JS_CallInternal+0x44d8>
   2fc71:	66 48 0f 6e ca       	movq   %rdx,%xmm1
   2fc76:	83 f9 08             	cmp    $0x8,%ecx
   2fc79:	0f 84 3e 01 00 00    	je     2fdbd <JS_CallInternal+0xaaad>
   2fc7f:	85 c9                	test   %ecx,%ecx
   2fc81:	0f 85 f0 ec ff ff    	jne    2e977 <JS_CallInternal+0x9667>
   2fc87:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2fc8b:	f2 0f 2a c0          	cvtsi2sd %eax,%xmm0
   2fc8f:	31 c0                	xor    %eax,%eax
   2fc91:	66 0f 2f c8          	comisd %xmm0,%xmm1
   2fc95:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   2fc9c:	00 
   2fc9d:	0f 93 c0             	setae  %al
   2fca0:	48 83 eb 10          	sub    $0x10,%rbx
   2fca4:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2fca8:	e9 77 a1 ff ff       	jmp    29e24 <JS_CallInternal+0x4b14>
   2fcad:	b8 03 00 00 00       	mov    $0x3,%eax
   2fcb2:	31 c9                	xor    %ecx,%ecx
   2fcb4:	e9 2d 61 ff ff       	jmp    25de6 <JS_CallInternal+0xad6>
   2fcb9:	4d 89 e7             	mov    %r12,%r15
   2fcbc:	e9 8f 5d ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2fcc1:	4d 89 e7             	mov    %r12,%r15
   2fcc4:	e9 87 5d ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2fcc9:	66 83 bd 10 fe ff ff 	cmpw   $0x1,-0x1f0(%rbp)
   2fcd0:	01 
   2fcd1:	0f 85 87 b4 ff ff    	jne    2b15e <JS_CallInternal+0x5e4e>
   2fcd7:	41 f6 42 10 08       	testb  $0x8,0x10(%r10)
   2fcdc:	0f 85 7c b4 ff ff    	jne    2b15e <JS_CallInternal+0x5e4e>
   2fce2:	66 83 7f 12 01       	cmpw   $0x1,0x12(%rdi)
   2fce7:	0f 85 71 b4 ff ff    	jne    2b15e <JS_CallInternal+0x5e4e>
   2fced:	f6 47 10 08          	testb  $0x8,0x10(%rdi)
   2fcf1:	0f 85 67 b4 ff ff    	jne    2b15e <JS_CallInternal+0x5e4e>
   2fcf7:	41 80 7b 10 00       	cmpb   $0x0,0x10(%r11)
   2fcfc:	0f 84 5c b4 ff ff    	je     2b15e <JS_CallInternal+0x5e4e>
   2fd02:	80 7a 10 00          	cmpb   $0x0,0x10(%rdx)
   2fd06:	0f 84 52 b4 ff ff    	je     2b15e <JS_CallInternal+0x5e4e>
   2fd0c:	49 8b 49 08          	mov    0x8(%r9),%rcx
   2fd10:	66 49 0f 6e c3       	movq   %r11,%xmm0
   2fd15:	48 c1 fe 04          	sar    $0x4,%rsi
   2fd19:	4d 8b 01             	mov    (%r9),%r8
   2fd1c:	66 48 0f 6e fa       	movq   %rdx,%xmm7
   2fd21:	41 83 43 fc 01       	addl   $0x1,-0x4(%r11)
   2fd26:	66 0f 6c c7          	punpcklqdq %xmm7,%xmm0
   2fd2a:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2fd2e:	41 89 71 10          	mov    %esi,0x10(%r9)
   2fd32:	41 0f 11 01          	movups %xmm0,(%r9)
   2fd36:	48 85 c9             	test   %rcx,%rcx
   2fd39:	74 28                	je     2fd63 <JS_CallInternal+0xaa53>
   2fd3b:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2fd3f:	48 89 ce             	mov    %rcx,%rsi
   2fd42:	4c 89 85 10 fe ff ff 	mov    %r8,-0x1f0(%rbp)
   2fd49:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2fd50:	e8 9b 07 ff ff       	call   204f0 <js_free_shape>
   2fd55:	4c 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%r8
   2fd5c:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2fd63:	4d 85 c0             	test   %r8,%r8
   2fd66:	0f 84 f2 b3 ff ff    	je     2b15e <JS_CallInternal+0x5e4e>
   2fd6c:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2fd70:	4c 89 c6             	mov    %r8,%rsi
   2fd73:	48 89 85 30 fe ff ff 	mov    %rax,-0x1d0(%rbp)
   2fd7a:	e8 71 07 ff ff       	call   204f0 <js_free_shape>
   2fd7f:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   2fd86:	e9 d3 b3 ff ff       	jmp    2b15e <JS_CallInternal+0x5e4e>
   2fd8b:	4d 89 e7             	mov    %r12,%r15
   2fd8e:	e9 bd 5c ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2fd93:	48 89 f2             	mov    %rsi,%rdx
   2fd96:	48 89 fe             	mov    %rdi,%rsi
   2fd99:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2fd9d:	48 89 85 10 fe ff ff 	mov    %rax,-0x1f0(%rbp)
   2fda4:	e8 c7 ea fe ff       	call   1e870 <__JS_FreeValueRT>
   2fda9:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2fdb0:	e9 7b d2 ff ff       	jmp    2d030 <JS_CallInternal+0x7d20>
   2fdb5:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2fdb9:	f2 0f 2a ca          	cvtsi2sd %edx,%xmm1
   2fdbd:	66 48 0f 6e c0       	movq   %rax,%xmm0
   2fdc2:	e9 c8 fe ff ff       	jmp    2fc8f <JS_CallInternal+0xa97f>
   2fdc7:	4d 89 e7             	mov    %r12,%r15
   2fdca:	e9 81 5c ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2fdcf:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2fdd3:	89 c2                	mov    %eax,%edx
   2fdd5:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2fdd9:	e8 f2 8b fe ff       	call   189d0 <JS_AtomGetStrRT.constprop.0>
   2fdde:	48 89 c2             	mov    %rax,%rdx
   2fde1:	e9 72 ea ff ff       	jmp    2e858 <JS_CallInternal+0x9548>
   2fde6:	66 48 0f 6e c7       	movq   %rdi,%xmm0
   2fdeb:	83 f8 08             	cmp    $0x8,%eax
   2fdee:	0f 84 c6 e9 ff ff    	je     2e7ba <JS_CallInternal+0x94aa>
   2fdf4:	85 c0                	test   %eax,%eax
   2fdf6:	0f 85 fd 82 ff ff    	jne    280f9 <JS_CallInternal+0x2de9>
   2fdfc:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2fe00:	f2 0f 2a c9          	cvtsi2sd %ecx,%xmm1
   2fe04:	e9 b6 e9 ff ff       	jmp    2e7bf <JS_CallInternal+0x94af>
   2fe09:	66 48 0f 6e c9       	movq   %rcx,%xmm1
   2fe0e:	83 f8 08             	cmp    $0x8,%eax
   2fe11:	0f 84 18 ea ff ff    	je     2e82f <JS_CallInternal+0x951f>
   2fe17:	85 c0                	test   %eax,%eax
   2fe19:	0f 85 da 82 ff ff    	jne    280f9 <JS_CallInternal+0x2de9>
   2fe1f:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2fe23:	f2 0f 2a c2          	cvtsi2sd %edx,%xmm0
   2fe27:	e9 08 ea ff ff       	jmp    2e834 <JS_CallInternal+0x9524>
   2fe2c:	4d 89 e7             	mov    %r12,%r15
   2fe2f:	e9 1c 5c ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2fe34:	48 89 03             	mov    %rax,(%rbx)
   2fe37:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2fe3b:	e9 f4 8c ff ff       	jmp    28b34 <JS_CallInternal+0x3824>
   2fe40:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2fe44:	4c 89 d6             	mov    %r10,%rsi
   2fe47:	4c 89 c2             	mov    %r8,%rdx
   2fe4a:	e8 21 ea fe ff       	call   1e870 <__JS_FreeValueRT>
   2fe4f:	e9 68 d4 ff ff       	jmp    2d2bc <JS_CallInternal+0x7fac>
   2fe54:	4d 89 e7             	mov    %r12,%r15
   2fe57:	e9 f4 5b ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2fe5c:	48 8b 95 00 fe ff ff 	mov    -0x200(%rbp),%rdx
   2fe63:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2fe67:	48 89 de             	mov    %rbx,%rsi
   2fe6a:	e8 01 ea fe ff       	call   1e870 <__JS_FreeValueRT>
   2fe6f:	e9 0e b7 ff ff       	jmp    2b582 <JS_CallInternal+0x6272>
   2fe74:	4d 89 e7             	mov    %r12,%r15
   2fe77:	e9 d4 5b ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2fe7c:	66 48 0f 6e c2       	movq   %rdx,%xmm0
   2fe81:	f2 41 0f 58 01       	addsd  (%r9),%xmm0
   2fe86:	49 c7 41 08 08 00 00 	movq   $0x8,0x8(%r9)
   2fe8d:	00 
   2fe8e:	48 83 eb 10          	sub    $0x10,%rbx
   2fe92:	f2 41 0f 11 01       	movsd  %xmm0,(%r9)
   2fe97:	e9 9b ae ff ff       	jmp    2ad37 <JS_CallInternal+0x5a27>
   2fe9c:	4d 89 e7             	mov    %r12,%r15
   2fe9f:	e9 ac 5b ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2fea4:	4c 89 fb             	mov    %r15,%rbx
   2fea7:	4d 89 e7             	mov    %r12,%r15
   2feaa:	e9 a1 5b ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2feaf:	4c 89 d6             	mov    %r10,%rsi
   2feb2:	4c 89 fa             	mov    %r15,%rdx
   2feb5:	4c 89 ef             	mov    %r13,%rdi
   2feb8:	e8 33 eb fe ff       	call   1e9f0 <JS_FreeValue>
   2febd:	e9 57 d4 ff ff       	jmp    2d319 <JS_CallInternal+0x8009>
   2fec2:	4c 89 d6             	mov    %r10,%rsi
   2fec5:	4c 89 c2             	mov    %r8,%rdx
   2fec8:	4c 89 ef             	mov    %r13,%rdi
   2fecb:	e8 20 eb fe ff       	call   1e9f0 <JS_FreeValue>
   2fed0:	e9 e7 d3 ff ff       	jmp    2d2bc <JS_CallInternal+0x7fac>
   2fed5:	4d 89 e7             	mov    %r12,%r15
   2fed8:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2fede:	0f 8e 6c 5b ff ff    	jle    25a50 <JS_CallInternal+0x740>
   2fee4:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2fee8:	89 ce                	mov    %ecx,%esi
   2feea:	e8 01 ad fe ff       	call   1abf0 <JS_FreeAtom.part.0.isra.0>
   2feef:	e9 5c 5b ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2fef4:	4d 8b 65 10          	mov    0x10(%r13),%r12
   2fef8:	41 80 bc 24 e9 04 00 	cmpb   $0x0,0x4e9(%r12)
   2feff:	00 00 
   2ff01:	0f 84 92 00 00 00    	je     2ff99 <JS_CallInternal+0xac89>
   2ff07:	4c 89 c2             	mov    %r8,%rdx
   2ff0a:	48 89 ce             	mov    %rcx,%rsi
   2ff0d:	4c 89 ef             	mov    %r13,%rdi
   2ff10:	e8 db ea fe ff       	call   1e9f0 <JS_FreeValue>
   2ff15:	45 31 c0             	xor    %r8d,%r8d
   2ff18:	48 c7 43 08 06 00 00 	movq   $0x6,0x8(%rbx)
   2ff1f:	00 
   2ff20:	4c 89 03             	mov    %r8,(%rbx)
   2ff23:	e9 0c 8c ff ff       	jmp    28b34 <JS_CallInternal+0x3824>
   2ff28:	89 ce                	mov    %ecx,%esi
   2ff2a:	4c 89 ef             	mov    %r13,%rdi
   2ff2d:	e8 0e 62 00 00       	call   36140 <JS_ThrowReferenceErrorUninitialized>
   2ff32:	e9 19 5b ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2ff37:	e8 04 62 00 00       	call   36140 <JS_ThrowReferenceErrorUninitialized>
   2ff3c:	e9 0f 5b ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2ff41:	4d 89 e7             	mov    %r12,%r15
   2ff44:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2ff4a:	0f 8e 00 5b ff ff    	jle    25a50 <JS_CallInternal+0x740>
   2ff50:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ff54:	89 ce                	mov    %ecx,%esi
   2ff56:	e8 95 ac fe ff       	call   1abf0 <JS_FreeAtom.part.0.isra.0>
   2ff5b:	e9 f0 5a ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2ff60:	e8 6b 1d fe ff       	call   11cd0 <__stack_chk_fail@plt>
   2ff65:	4d 89 e7             	mov    %r12,%r15
   2ff68:	e9 e3 5a ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2ff6d:	48 8d 35 62 96 0a 00 	lea    0xa9662(%rip),%rsi        # d95d6 <_IO_stdin_used+0x5d6>
   2ff74:	4c 89 ef             	mov    %r13,%rdi
   2ff77:	31 c0                	xor    %eax,%eax
   2ff79:	4d 89 e7             	mov    %r12,%r15
   2ff7c:	e8 0f 42 00 00       	call   34190 <JS_ThrowTypeError>
   2ff81:	e9 ca 5a ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2ff86:	4d 89 e7             	mov    %r12,%r15
   2ff89:	e9 c2 5a ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   2ff8e:	41 bf 01 00 00 00    	mov    $0x1,%r15d
   2ff94:	e9 a5 98 ff ff       	jmp    2983e <JS_CallInternal+0x452e>
   2ff99:	41 c6 84 24 e9 04 00 	movb   $0x1,0x4e9(%r12)
   2ffa0:	00 01 
   2ffa2:	48 8d 35 34 95 0a 00 	lea    0xa9534(%rip),%rsi        # d94dd <_IO_stdin_used+0x4dd>
   2ffa9:	4c 89 ef             	mov    %r13,%rdi
   2ffac:	31 c0                	xor    %eax,%eax
   2ffae:	4c 89 85 00 fe ff ff 	mov    %r8,-0x200(%rbp)
   2ffb5:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   2ffbc:	e8 bf 63 00 00       	call   36380 <JS_ThrowInternalError>
   2ffc1:	4c 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%r8
   2ffc8:	41 c6 84 24 e9 04 00 	movb   $0x0,0x4e9(%r12)
   2ffcf:	00 00 
   2ffd1:	48 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%rcx
   2ffd8:	e9 2a ff ff ff       	jmp    2ff07 <JS_CallInternal+0xabf7>
   2ffdd:	44 39 c2             	cmp    %r8d,%edx
   2ffe0:	4c 89 d6             	mov    %r10,%rsi
   2ffe3:	4c 89 c2             	mov    %r8,%rdx
   2ffe6:	4c 89 ef             	mov    %r13,%rdi
   2ffe9:	41 0f 94 c7          	sete   %r15b
   2ffed:	e8 fe e9 fe ff       	call   1e9f0 <JS_FreeValue>
   2fff2:	45 0f b6 ff          	movzbl %r15b,%r15d
   2fff6:	e9 ed 97 ff ff       	jmp    297e8 <JS_CallInternal+0x44d8>
   2fffb:	4d 89 e7             	mov    %r12,%r15
   2fffe:	e9 4d 5a ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   30003:	44 0f b6 7f 11       	movzbl 0x11(%rdi),%r15d
   30008:	48 89 fe             	mov    %rdi,%rsi
   3000b:	4c 89 ef             	mov    %r13,%rdi
   3000e:	41 83 e7 01          	and    $0x1,%r15d
   30012:	e8 d9 e9 fe ff       	call   1e9f0 <JS_FreeValue>
   30017:	e9 22 98 ff ff       	jmp    2983e <JS_CallInternal+0x452e>
   3001c:	4d 89 e7             	mov    %r12,%r15
   3001f:	e9 2c 5a ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   30024:	4d 89 e7             	mov    %r12,%r15
   30027:	e9 24 5a ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   3002c:	4d 89 e7             	mov    %r12,%r15
   3002f:	e9 1c 5a ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   30034:	4d 89 e7             	mov    %r12,%r15
   30037:	e9 14 5a ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   3003c:	4d 89 e7             	mov    %r12,%r15
   3003f:	e9 0c 5a ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   30044:	4d 89 e7             	mov    %r12,%r15
   30047:	e9 04 5a ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   3004c:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   30053:	49 8b 31             	mov    (%r9),%rsi
   30056:	4c 89 ef             	mov    %r13,%rdi
   30059:	4c 89 8d 10 fe ff ff 	mov    %r9,-0x1f0(%rbp)
   30060:	48 89 95 30 fe ff ff 	mov    %rdx,-0x1d0(%rbp)
   30067:	48 83 eb 10          	sub    $0x10,%rbx
   3006b:	4c 89 78 30          	mov    %r15,0x30(%rax)
   3006f:	48 89 8d 38 fe ff ff 	mov    %rcx,-0x1c8(%rbp)
   30076:	e8 d5 63 fe ff       	call   16450 <JS_ConcatStringInPlace>
   3007b:	4c 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%r10
   30082:	4c 8b 9d 38 fe ff ff 	mov    -0x1c8(%rbp),%r11
   30089:	85 c0                	test   %eax,%eax
   3008b:	4c 8b 8d 10 fe ff ff 	mov    -0x1f0(%rbp),%r9
   30092:	75 59                	jne    300ed <JS_CallInternal+0xaddd>
   30094:	49 8b 51 08          	mov    0x8(%r9),%rdx
   30098:	49 8b 01             	mov    (%r9),%rax
   3009b:	83 fa f6             	cmp    $0xfffffff6,%edx
   3009e:	76 04                	jbe    300a4 <JS_CallInternal+0xad94>
   300a0:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   300a4:	4c 89 d1             	mov    %r10,%rcx
   300a7:	4d 89 d8             	mov    %r11,%r8
   300aa:	48 89 c6             	mov    %rax,%rsi
   300ad:	4c 89 ef             	mov    %r13,%rdi
   300b0:	4c 89 8d 30 fe ff ff 	mov    %r9,-0x1d0(%rbp)
   300b7:	e8 14 42 01 00       	call   442d0 <JS_ConcatString>
   300bc:	48 89 c1             	mov    %rax,%rcx
   300bf:	48 89 d0             	mov    %rdx,%rax
   300c2:	83 fa 06             	cmp    $0x6,%edx
   300c5:	0f 84 85 59 ff ff    	je     25a50 <JS_CallInternal+0x740>
   300cb:	4c 8b 8d 30 fe ff ff 	mov    -0x1d0(%rbp),%r9
   300d2:	4c 89 ef             	mov    %r13,%rdi
   300d5:	49 8b 31             	mov    (%r9),%rsi
   300d8:	49 8b 51 08          	mov    0x8(%r9),%rdx
   300dc:	49 89 09             	mov    %rcx,(%r9)
   300df:	49 89 41 08          	mov    %rax,0x8(%r9)
   300e3:	e8 08 e9 fe ff       	call   1e9f0 <JS_FreeValue>
   300e8:	e9 4a ac ff ff       	jmp    2ad37 <JS_CallInternal+0x5a27>
   300ed:	4c 89 d6             	mov    %r10,%rsi
   300f0:	4c 89 da             	mov    %r11,%rdx
   300f3:	4c 89 ef             	mov    %r13,%rdi
   300f6:	e8 f5 e8 fe ff       	call   1e9f0 <JS_FreeValue>
   300fb:	e9 37 ac ff ff       	jmp    2ad37 <JS_CallInternal+0x5a27>
   30100:	4d 89 e7             	mov    %r12,%r15
   30103:	e9 48 59 ff ff       	jmp    25a50 <JS_CallInternal+0x740>
   30108:	4c 89 d6             	mov    %r10,%rsi
   3010b:	4c 89 fa             	mov    %r15,%rdx
   3010e:	4c 89 ef             	mov    %r13,%rdi
   30111:	48 89 8d 30 fe ff ff 	mov    %rcx,-0x1d0(%rbp)
   30118:	e8 d3 e8 fe ff       	call   1e9f0 <JS_FreeValue>
   3011d:	31 c0                	xor    %eax,%eax
   3011f:	44 39 bd 30 fe ff ff 	cmp    %r15d,-0x1d0(%rbp)
   30126:	0f 95 c0             	setne  %al
   30129:	e9 63 96 ff ff       	jmp    29791 <JS_CallInternal+0x4481>
   3012e:	b9 01 00 00 00       	mov    $0x1,%ecx
   30133:	e9 8c 9c ff ff       	jmp    29dc4 <JS_CallInternal+0x4ab4>
   30138:	0f b6 4f 11          	movzbl 0x11(%rdi),%ecx
   3013c:	48 89 fe             	mov    %rdi,%rsi
   3013f:	4c 89 ef             	mov    %r13,%rdi
   30142:	83 e1 01             	and    $0x1,%ecx
   30145:	89 8d 30 fe ff ff    	mov    %ecx,-0x1d0(%rbp)
   3014b:	e8 a0 e8 fe ff       	call   1e9f0 <JS_FreeValue>
   30150:	8b 8d 30 fe ff ff    	mov    -0x1d0(%rbp),%ecx
   30156:	e9 69 9c ff ff       	jmp    29dc4 <JS_CallInternal+0x4ab4>

Disassembly of section .fini:
