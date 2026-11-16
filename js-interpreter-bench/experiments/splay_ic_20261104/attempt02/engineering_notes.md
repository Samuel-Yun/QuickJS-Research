# 实际恢复、工程失败与停止原因

本轮从干净myx/f4f1672开始，只新增attempt02。初始没有发现适用AGENTS。
Windows/Python通道可用；目标运行环境仍为同一个Ubuntu WSL2，未假装存在另一台Linux主机。

## 有界恢复策略及全部任务记录

恢复策略按三组推进，并非只调用三次wsl.exe；每个实际调用分别保存，不掩盖额外的preflight、编译修错或检查。

1. **最小前台任务、明确Linux cwd。** 初始只读ps失败；带宿主记录的`/bin/true`同样返回`Wsl/Service/E_UNEXPECTED`。只加入`--cd /`后最小命令返回0，再通过实际制品preflight和四个Splay N1/N2进程。cwd变化与成功同时发生，不能证明错误根因就是cwd。
2. **缩小诊断元数据、只服务三个Splay位置。** 新诊断不再为所有函数/每个字节/每个阶段建立和保留历史。M_light构建、实际ELF/SHA/smoke通过；接着C构建时客户端无Python异常地退出1，缺少Linux子进程完成记录。
3. **最后一次资源并发调整：make -j2→-j1。** 不变更编译/链接选项。先复核M_light，成功采集Splay N1/N2布局，再串行构建C和C_light，实际ELF/SHA/smoke均通过。然而后续16个正确性及M.N1计数成功后，C_ON.N1待保存处再次中断。未继续第四轮环境恢复或正式长任务。

`recovery/*/host.json`列出所有宿主起止、命令、wsl退出、超时标志、原始stdout/stderr字节hash及磁盘。
01失败、02成功、03preflight成功、04四进程成功、05脚本元数据失败、06编译错误、07不明中断、08串行恢复成功、09发布成功、10门禁中断、11仅宿主状态查询。
最后11未启动Linux，报告Ubuntu为Stopped。

## 已知工程错误，均保留

- preflight首次直接调用成功完成文件smoke，但汇总旧依赖记录时重复`actual_sha256`关键字引发TypeError。旧preflight顶层environment/processes仍保留；修复为字典覆盖并另写check02，没有改旧身份。
- 通用宿主包装器两次审批超时，未创建子任务。不是Linux失败；随后用明确只读stat缩小核验，直接preflight获准执行。没有关闭权限/TLS/安全检查。
- build01在编译前遇到旧精简dump没有`operand_before`字段；改从真实`code_before_hex`的小端操作数字节解码。
- build02因QuickJS把`free`映射为禁止使用的符号，诊断节点释放链接失败。仅在VM实现之后的独立诊断tail取消该宏，把libc calloc节点与libc free配对；未改VM分配器或正式读取逻辑。
- build03 M_light构建完成，后续C没有完成记录；其目录/patch保留，未覆盖。build04是新C目录，沿用同一控制源码、单任务make。
- `Get-WinEvent`无法找到某些日志且Hyper-V/Host-Network日志无权限；CIM也拒绝访问。未更改权限或启用日志。内核/WSL根因证据保持UNKNOWN。
- 末尾一次未提升权限的宿主list查询返回E_ACCESSDENIED，是工具权限边界，不当作引擎错误；随后仅宿主提升权限list成功并保存为11。

## 精确停点

`mechanism/started/light_diagnostic/Splay.Splay/C_ON.N1.rep00.pos0.json`：

- parent记录时间：2026-11-04T09:28:56.561225Z。
- boot：`6d309557-57ab-4965-876a-8012e95f8efd`。
- C_light发布时SHA：`01ae78c00b5963553a7229204e37fdbf1fee03b3f168156c1d17aaf318cb5623`。
- JS SHA：`cb1b90aee2fdcee348d3b272a9c1a7ced3d2c730e5cf57dc34ceaa24a78b6f7a`。
- 没有对应raw/process/counter；该marker在Popen前落盘，**不能据此确认引擎已经实际启动**。
- 宿主任务10退出1，无Python traceback；不是宿主超时或本脚本主动kill。
- 随后宿主查询Ubuntu已Stopped。未运行Linux取新boot或中断后ELF，所以这两项UNKNOWN。

不排除诊断实现问题，也不排除宿主/WSL问题；没有证据把它归为OOM、C_light崩溃或性能回归。
已完成Splay诊断单进程wait4峰值约147528—147736KiB；编译子进程树约345572—346580KiB。后者包含make编译任务，不能冒称单个engine RSS。
资源值来自本次具体wait4子进程，不对累积children maxrss做差。小smoke的wait4还可能包含fork继承页的高水位，未用它推断版本内存相等。
磁盘C约10.4—10.7GB空闲、F约68.9GB；这些值不能确定失败原因。

## 当前入口的安全状态

旧STOP_WORKER未删除。新STOP_EXECUTION禁止run.py继续采样；旧raw不覆盖，孤立位置不自动补跑。
reproduce.py仅供后续明确恢复，先核验实际文件再跑15秒上限；它会提前保存真实Linux child pid/boot。
没有OPT，没有运行ASan/UBSan或新保存加载/qjsc运行门禁，不把单纯qjsc编译成功称为这些测试通过。
Richards只在固定17项目录中保留，没有新增专项运行、独立插桩或复测；SunSpider未跑。
