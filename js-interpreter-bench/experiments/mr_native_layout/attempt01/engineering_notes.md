# 保留的失败、修正与范围

1. 首个独立M诊断构建失败：counter.inc使用malloc，而QuickJS源码将malloc宏重命名为malloc_is_forbidden。没有生成正式样本；raw/build/M_diagnostic_build.1.json和patches/M_diagnostic.patch保留。诊断分配改为此前工具已用的calloc，另建M_diagnostic2；不改变正式M/R源码、布局或编译对象。
2. 首版汇编padding缺少GNU property note。虽然原对象不变，新增对象参与FEATURE_1_AND合并后改变ELF/PLT，p000入口比base前移1952字节；零条件门禁失败，未进入pilot/正式。所有首版制品身份、map、sections及raw保留。
3. 仍用原定text-padding-object单一方法，0/16/32/48不变；将原quickjs.o的GNU property note原字节附到padding汇编。新输出放独立final/目录，初始manifest.json不覆盖，新冻结manifest.final.json。base只是原qjs复制，不重编译；全部正式路径相同长度。最终p000与base.text相同，八个条件通过N1/N2。
4. 同一note修正未增加优化flags或强制CET运行策略；ELF的IBT/SHSTK属性不证明宿主运行时启用了硬件保护。没有为了追分改padding值。
5. WSL的工具调用会出现localhost代理警告；少量PowerShell到bash的带管道命令转义失败。相关源码读取改为本地archive读取，研究脚本用直接python入口。未因这些失败安装/升级工具链。
6. perf能力一次尝试返回127，保存原错误，不做sudo/内核/宿主/ASLR更改。无硬件计数或native动态分支采样。
7. 当前raw的objects和link_inputs_sha256标识未变的原始对象/系统链接输入；最终padding对象hash与确切链接命令在冻结manifest.final.json中，按condition及binary SHA关联。初始与最终制品不能混用。
8. 采样前N1/N2分派门禁使用原有correctness driver；目标函数相同，但driver的计时/逐次检查分支与正式measure不同。正式采样结束后，另用原测量脚本生成器的N1/N2 measurement driver独立复核16进程，不重建诊断制品，不并行采样，不把其时间入正式结果。两个scope分开保留，不能混用其全进程查询/命中数。两套均确认M/R规范码与按PC归一的dispatch相同，三个micro无退出。
