
/home/mzyx/jsc_build_fd3406f/JSCOnly/Release/lib/libJavaScriptCore.so.1.0.0:     file format elf64-x86-64


Disassembly of section .text:

00000000001a12e1 <llint_op_get_by_val>:
  1a12e1:	45 0f b7 54 24 4c    	movzx  r10d,WORD PTR [r12+0x4c]
  1a12e7:	45 85 d2             	test   r10d,r10d
  1a12ea:	75 08                	jne    1a12f4 <llint_op_get_by_val+0x13>
  1a12ec:	45 8b 94 24 00 01 00 	mov    r10d,DWORD PTR [r12+0x100]
  1a12f3:	00 
  1a12f4:	43 0f b6 54 05 05    	movzx  edx,BYTE PTR [r13+r8*1+0x5]
  1a12fa:	c1 e2 04             	shl    edx,0x4
  1a12fd:	41 01 d2             	add    r10d,edx
  1a1300:	4d 01 e2             	add    r10,r12
  1a1303:	49 83 c2 03          	add    r10,0x3
  1a1307:	49 83 e2 fc          	and    r10,0xfffffffffffffffc
  1a130b:	4b 0f be 54 05 02    	movsx  rdx,BYTE PTR [r13+r8*1+0x2]
  1a1311:	48 83 fa 10          	cmp    rdx,0x10
  1a1315:	7d 07                	jge    1a131e <llint_op_get_by_val+0x3d>
  1a1317:	48 8b 44 d5 00       	mov    rax,QWORD PTR [rbp+rdx*8+0x0]
  1a131c:	eb 10                	jmp    1a132e <llint_op_get_by_val+0x4d>
  1a131e:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  1a1322:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
  1a1329:	48 8b 44 d0 80       	mov    rax,QWORD PTR [rax+rdx*8-0x80]
  1a132e:	4c 85 f8             	test   rax,r15
  1a1331:	0f 85 4e 03 00 00    	jne    1a1685 <llint_op_get_by_val+0x3a4>
  1a1337:	48 89 c2             	mov    rdx,rax
  1a133a:	8b 32                	mov    esi,DWORD PTR [rdx]
  1a133c:	41 89 32             	mov    DWORD PTR [r10],esi
  1a133f:	0f b6 52 04          	movzx  edx,BYTE PTR [rdx+0x4]
  1a1343:	4b 0f be 4c 05 03    	movsx  rcx,BYTE PTR [r13+r8*1+0x3]
  1a1349:	48 83 f9 10          	cmp    rcx,0x10
  1a134d:	7d 07                	jge    1a1356 <llint_op_get_by_val+0x75>
  1a134f:	48 8b 74 cd 00       	mov    rsi,QWORD PTR [rbp+rcx*8+0x0]
  1a1354:	eb 10                	jmp    1a1366 <llint_op_get_by_val+0x85>
  1a1356:	48 8b 75 10          	mov    rsi,QWORD PTR [rbp+0x10]
  1a135a:	48 8b b6 a0 00 00 00 	mov    rsi,QWORD PTR [rsi+0xa0]
  1a1361:	48 8b 74 ce 80       	mov    rsi,QWORD PTR [rsi+rcx*8-0x80]
  1a1366:	4c 39 f6             	cmp    rsi,r14
  1a1369:	0f 82 16 03 00 00    	jb     1a1685 <llint_op_get_by_val+0x3a4>
  1a136f:	48 63 f6             	movsxd rsi,esi
  1a1372:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  1a1376:	49 be 00 00 00 00 00 	movabs r14,0xfffe000000000000
  1a137d:	00 fe ff 
  1a1380:	83 e2 0e             	and    edx,0xe
  1a1383:	83 fa 04             	cmp    edx,0x4
  1a1386:	74 05                	je     1a138d <llint_op_get_by_val+0xac>
  1a1388:	83 fa 08             	cmp    edx,0x8
  1a138b:	75 1e                	jne    1a13ab <llint_op_get_by_val+0xca>
  1a138d:	3b 71 f8             	cmp    esi,DWORD PTR [rcx-0x8]
  1a1390:	0f 83 ef 02 00 00    	jae    1a1685 <llint_op_get_by_val+0x3a4>
  1a1396:	4b 0f be 44 05 01    	movsx  rax,BYTE PTR [r13+r8*1+0x1]
  1a139c:	48 8b 14 f1          	mov    rdx,QWORD PTR [rcx+rsi*8]
  1a13a0:	48 85 d2             	test   rdx,rdx
  1a13a3:	0f 84 dc 02 00 00    	je     1a1685 <llint_op_get_by_val+0x3a4>
  1a13a9:	eb 52                	jmp    1a13fd <llint_op_get_by_val+0x11c>
  1a13ab:	83 fa 06             	cmp    edx,0x6
  1a13ae:	75 28                	jne    1a13d8 <llint_op_get_by_val+0xf7>
  1a13b0:	3b 71 f8             	cmp    esi,DWORD PTR [rcx-0x8]
  1a13b3:	0f 83 cc 02 00 00    	jae    1a1685 <llint_op_get_by_val+0x3a4>
  1a13b9:	4b 0f be 44 05 01    	movsx  rax,BYTE PTR [r13+r8*1+0x1]
  1a13bf:	f2 0f 10 04 f1       	movsd  xmm0,QWORD PTR [rcx+rsi*8]
  1a13c4:	66 0f 2e c0          	ucomisd xmm0,xmm0
  1a13c8:	0f 8a b7 02 00 00    	jp     1a1685 <llint_op_get_by_val+0x3a4>
  1a13ce:	66 48 0f 7e c2       	movq   rdx,xmm0
  1a13d3:	4c 29 f2             	sub    rdx,r14
  1a13d6:	eb 25                	jmp    1a13fd <llint_op_get_by_val+0x11c>
  1a13d8:	83 ea 0a             	sub    edx,0xa
  1a13db:	83 fa 02             	cmp    edx,0x2
  1a13de:	77 45                	ja     1a1425 <llint_op_get_by_val+0x144>
  1a13e0:	3b 71 fc             	cmp    esi,DWORD PTR [rcx-0x4]
  1a13e3:	0f 83 9c 02 00 00    	jae    1a1685 <llint_op_get_by_val+0x3a4>
  1a13e9:	4b 0f be 44 05 01    	movsx  rax,BYTE PTR [r13+r8*1+0x1]
  1a13ef:	48 8b 54 f1 10       	mov    rdx,QWORD PTR [rcx+rsi*8+0x10]
  1a13f4:	48 85 d2             	test   rdx,rdx
  1a13f7:	0f 84 88 02 00 00    	je     1a1685 <llint_op_get_by_val+0x3a4>
  1a13fd:	48 89 54 c5 00       	mov    QWORD PTR [rbp+rax*8+0x0],rdx
  1a1402:	47 0f b6 54 05 04    	movzx  r10d,BYTE PTR [r13+r8*1+0x4]
  1a1408:	4d 6b d2 f0          	imul   r10,r10,0xfffffffffffffff0
  1a140c:	4b 89 54 14 f0       	mov    QWORD PTR [r12+r10*1-0x10],rdx
  1a1411:	49 83 c0 06          	add    r8,0x6
  1a1415:	43 0f b6 44 05 00    	movzx  eax,BYTE PTR [r13+r8*1+0x0]
  1a141b:	48 8d 35 de fb 21 02 	lea    rsi,[rip+0x221fbde]        # 23c1000 <os_script_config_storage>
  1a1422:	ff 24 c6             	jmp    QWORD PTR [rsi+rax*8]
  1a1425:	0f b6 50 05          	movzx  edx,BYTE PTR [rax+0x5]
  1a1429:	83 ea 31             	sub    edx,0x31
  1a142c:	83 fa 0a             	cmp    edx,0xa
  1a142f:	0f 83 50 02 00 00    	jae    1a1685 <llint_op_get_by_val+0x3a4>
  1a1435:	f6 40 28 06          	test   BYTE PTR [rax+0x28],0x6
  1a1439:	0f 85 46 02 00 00    	jne    1a1685 <llint_op_get_by_val+0x3a4>
  1a143f:	48 3b 70 18          	cmp    rsi,QWORD PTR [rax+0x18]
  1a1443:	0f 83 3c 02 00 00    	jae    1a1685 <llint_op_get_by_val+0x3a4>
  1a1449:	48 81 fe ff ff ff 7f 	cmp    rsi,0x7fffffff
  1a1450:	76 0b                	jbe    1a145d <llint_op_get_by_val+0x17c>
  1a1452:	41 8b 4a 08          	mov    ecx,DWORD PTR [r10+0x8]
  1a1456:	83 c9 04             	or     ecx,0x4
  1a1459:	41 89 4a 08          	mov    DWORD PTR [r10+0x8],ecx
  1a145d:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  1a1461:	48 8b 05 20 a4 1e 02 	mov    rax,QWORD PTR [rip+0x21ea420]        # 238b888 <g_config@@Base-0x42778>
  1a1468:	0f b6 40 22          	movzx  eax,BYTE PTR [rax+0x22]
  1a146c:	84 c0                	test   al,al
  1a146e:	75 0e                	jne    1a147e <llint_op_get_by_val+0x19d>
  1a1470:	48 8b 05 c9 9d 1e 02 	mov    rax,QWORD PTR [rip+0x21e9dc9]        # 238b240 <disablePrimitiveGigacageRequested@@Base-0x47118>
  1a1477:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  1a147a:	84 c0                	test   al,al
  1a147c:	75 20                	jne    1a149e <llint_op_get_by_val+0x1bd>
  1a147e:	48 8b 05 03 a4 1e 02 	mov    rax,QWORD PTR [rip+0x21ea403]        # 238b888 <g_config@@Base-0x42778>
  1a1485:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
  1a1489:	48 85 c0             	test   rax,rax
  1a148c:	74 10                	je     1a149e <llint_op_get_by_val+0x1bd>
  1a148e:	49 bb ff ff ff ff 0f 	movabs r11,0xfffffffff
  1a1495:	00 00 00 
  1a1498:	4c 21 d9             	and    rcx,r11
  1a149b:	48 01 c1             	add    rcx,rax
  1a149e:	83 fa 04             	cmp    edx,0x4
  1a14a1:	0f 87 21 01 00 00    	ja     1a15c8 <llint_op_get_by_val+0x2e7>
  1a14a7:	83 fa 02             	cmp    edx,0x2
  1a14aa:	0f 87 a9 00 00 00    	ja     1a1559 <llint_op_get_by_val+0x278>
  1a14b0:	83 fa 00             	cmp    edx,0x0
  1a14b3:	77 35                	ja     1a14ea <llint_op_get_by_val+0x209>
  1a14b5:	0f be 04 31          	movsx  eax,BYTE PTR [rcx+rsi*1]
  1a14b9:	4c 09 f0             	or     rax,r14
  1a14bc:	4b 0f be 74 05 01    	movsx  rsi,BYTE PTR [r13+r8*1+0x1]
  1a14c2:	48 89 44 f5 00       	mov    QWORD PTR [rbp+rsi*8+0x0],rax
  1a14c7:	43 0f b6 74 05 04    	movzx  esi,BYTE PTR [r13+r8*1+0x4]
  1a14cd:	48 6b f6 f0          	imul   rsi,rsi,0xfffffffffffffff0
  1a14d1:	49 89 44 34 f0       	mov    QWORD PTR [r12+rsi*1-0x10],rax
  1a14d6:	49 83 c0 06          	add    r8,0x6
  1a14da:	43 0f b6 44 05 00    	movzx  eax,BYTE PTR [r13+r8*1+0x0]
  1a14e0:	48 8d 35 19 fb 21 02 	lea    rsi,[rip+0x221fb19]        # 23c1000 <os_script_config_storage>
  1a14e7:	ff 24 c6             	jmp    QWORD PTR [rsi+rax*8]
  1a14ea:	83 fa 01             	cmp    edx,0x1
  1a14ed:	77 35                	ja     1a1524 <llint_op_get_by_val+0x243>
  1a14ef:	0f b6 04 31          	movzx  eax,BYTE PTR [rcx+rsi*1]
  1a14f3:	4c 09 f0             	or     rax,r14
  1a14f6:	4b 0f be 74 05 01    	movsx  rsi,BYTE PTR [r13+r8*1+0x1]
  1a14fc:	48 89 44 f5 00       	mov    QWORD PTR [rbp+rsi*8+0x0],rax
  1a1501:	43 0f b6 74 05 04    	movzx  esi,BYTE PTR [r13+r8*1+0x4]
  1a1507:	48 6b f6 f0          	imul   rsi,rsi,0xfffffffffffffff0
  1a150b:	49 89 44 34 f0       	mov    QWORD PTR [r12+rsi*1-0x10],rax
  1a1510:	49 83 c0 06          	add    r8,0x6
  1a1514:	43 0f b6 44 05 00    	movzx  eax,BYTE PTR [r13+r8*1+0x0]
  1a151a:	48 8d 35 df fa 21 02 	lea    rsi,[rip+0x221fadf]        # 23c1000 <os_script_config_storage>
  1a1521:	ff 24 c6             	jmp    QWORD PTR [rsi+rax*8]
  1a1524:	0f b6 04 31          	movzx  eax,BYTE PTR [rcx+rsi*1]
  1a1528:	4c 09 f0             	or     rax,r14
  1a152b:	4b 0f be 74 05 01    	movsx  rsi,BYTE PTR [r13+r8*1+0x1]
  1a1531:	48 89 44 f5 00       	mov    QWORD PTR [rbp+rsi*8+0x0],rax
  1a1536:	43 0f b6 74 05 04    	movzx  esi,BYTE PTR [r13+r8*1+0x4]
  1a153c:	48 6b f6 f0          	imul   rsi,rsi,0xfffffffffffffff0
  1a1540:	49 89 44 34 f0       	mov    QWORD PTR [r12+rsi*1-0x10],rax
  1a1545:	49 83 c0 06          	add    r8,0x6
  1a1549:	43 0f b6 44 05 00    	movzx  eax,BYTE PTR [r13+r8*1+0x0]
  1a154f:	48 8d 35 aa fa 21 02 	lea    rsi,[rip+0x221faaa]        # 23c1000 <os_script_config_storage>
  1a1556:	ff 24 c6             	jmp    QWORD PTR [rsi+rax*8]
  1a1559:	83 fa 03             	cmp    edx,0x3
  1a155c:	77 35                	ja     1a1593 <llint_op_get_by_val+0x2b2>
  1a155e:	0f bf 04 71          	movsx  eax,WORD PTR [rcx+rsi*2]
  1a1562:	4c 09 f0             	or     rax,r14
  1a1565:	4b 0f be 74 05 01    	movsx  rsi,BYTE PTR [r13+r8*1+0x1]
  1a156b:	48 89 44 f5 00       	mov    QWORD PTR [rbp+rsi*8+0x0],rax
  1a1570:	43 0f b6 74 05 04    	movzx  esi,BYTE PTR [r13+r8*1+0x4]
  1a1576:	48 6b f6 f0          	imul   rsi,rsi,0xfffffffffffffff0
  1a157a:	49 89 44 34 f0       	mov    QWORD PTR [r12+rsi*1-0x10],rax
  1a157f:	49 83 c0 06          	add    r8,0x6
  1a1583:	43 0f b6 44 05 00    	movzx  eax,BYTE PTR [r13+r8*1+0x0]
  1a1589:	48 8d 35 70 fa 21 02 	lea    rsi,[rip+0x221fa70]        # 23c1000 <os_script_config_storage>
  1a1590:	ff 24 c6             	jmp    QWORD PTR [rsi+rax*8]
  1a1593:	0f b7 04 71          	movzx  eax,WORD PTR [rcx+rsi*2]
  1a1597:	4c 09 f0             	or     rax,r14
  1a159a:	4b 0f be 74 05 01    	movsx  rsi,BYTE PTR [r13+r8*1+0x1]
  1a15a0:	48 89 44 f5 00       	mov    QWORD PTR [rbp+rsi*8+0x0],rax
  1a15a5:	43 0f b6 74 05 04    	movzx  esi,BYTE PTR [r13+r8*1+0x4]
  1a15ab:	48 6b f6 f0          	imul   rsi,rsi,0xfffffffffffffff0
  1a15af:	49 89 44 34 f0       	mov    QWORD PTR [r12+rsi*1-0x10],rax
  1a15b4:	49 83 c0 06          	add    r8,0x6
  1a15b8:	43 0f b6 44 05 00    	movzx  eax,BYTE PTR [r13+r8*1+0x0]
  1a15be:	48 8d 35 3b fa 21 02 	lea    rsi,[rip+0x221fa3b]        # 23c1000 <os_script_config_storage>
  1a15c5:	ff 24 c6             	jmp    QWORD PTR [rsi+rax*8]
  1a15c8:	83 fa 06             	cmp    edx,0x6
  1a15cb:	77 72                	ja     1a163f <llint_op_get_by_val+0x35e>
  1a15cd:	83 fa 05             	cmp    edx,0x5
  1a15d0:	77 34                	ja     1a1606 <llint_op_get_by_val+0x325>
  1a15d2:	8b 04 b1             	mov    eax,DWORD PTR [rcx+rsi*4]
  1a15d5:	4c 09 f0             	or     rax,r14
  1a15d8:	4b 0f be 74 05 01    	movsx  rsi,BYTE PTR [r13+r8*1+0x1]
  1a15de:	48                   	rex.W
  1a15df:	89                   	.byte 0x89
  1a15e0:	44                   	rex.R
