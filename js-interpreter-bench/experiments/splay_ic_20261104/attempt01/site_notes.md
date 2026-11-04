# 位置及源码解释（未完成部分明确标注）

权威离线重算为 `summary_v2/`；初次 `summary/` 保留。所有数字只来自新稀疏系列，密集系列仅用于同三个位置的计数核对，非时间合并。

## 原始位置

`SplayTree.prototype.splay_` 的源 SHA256 为 `138762086ed599b42111191883e57a62e65533df210601253b636eddb39abd43`。完整原始源码和实际最终字节码见 `summary_v2/{A,M}_splay_bytecode.md`，原字节及 opcode 起点均保留；非 atom 操作数仅给原字节，不伪造完整反汇编。

```javascript
if (key < current.key) {
  // 原程序左侧旋转/链接分支，详见完整源码
} else if (key > current.key) {
  if (!current.right) { break; }
  // 原程序右侧旋转/链接分支，详见完整源码
}
```

这只是源码定位片段，省略处非连续执行序列。目标函数/循环均未改写。

|表达式|QJS 真实 PC|V8 真实 PC / 槽|
|---|---:|---|
|左侧比较中的 current.key|43|41 / FBV[12]|
|右侧比较中的 current.key|138|118 / FBV[12]|
|右侧分支的 !current.right|147|127 / FBV[26]|

QJS 每条静态读点各有 site；实际 d8 在这两个 key 表达式复用反馈槽。仅此差别不能推出谁快，也不能把 V8 多态更新与 M 单槽替换视为相同事件。

## QuickJS 的工作

- M 先从五字节 opcode 读 site index，定位16B site，再做 tag/class/exotic、shape和 offset 哨兵检查。命中从**当前对象**的 prop 数组取值，保留 Dup 和 receiver 的原所有权语义。
- 不匹配则取 site.atom，执行原 find；PC43的实际 miss 是一桶/一候选，命中普通 own data 后进入 rdi_update。
- 当前shape与缓存shape不同且已占槽时，更新前保活新shape，再释放旧shape，保存新shape/offset。实际记录的替换证实当时是不同shape，不是仅凭树指针变化作的推测。
- 没有采到各shape完整布局/生命周期统计，offset是否一致、变化由哪个字段引起，仍 UNKNOWN。

源码依据为旧目录固定 M `read_ic_opcodes.inc:2–66`、`read_ic_runtime.inc:5–40`；其源SHA与本次复核一致。实际 ELF 的既有 `machinecode/M_read_paths.asm` 与本次M binary同SHA：0x23f46是site定位缩放，0x23f80起是内联hash桶/链；0x29ce0附近是get_field命中候选。窗口不连续，不能把省略处分支视为已实测；本轮未补全更新端native动态执行证明。

## V8 的工作与可观测边界

完整实际目标dump为 `summary_v2/V8_splay_bytecode.txt`。`v8/N2.key_left_right_transitions.txt` 的 key 更新事件在同进程字节码地址可对应到目标位置，出现0→1、1→P。原始IC/Map日志压缩归档及双SHA在 `v8/`。

参考源码的 GetNamedProperty 取得receiver/name/槽/vector后，由LoadIC处理Map/handler；多态反馈可以接纳多个Map，失败进入runtime lookup/更新。这是固定参考源码解释，不冒充当前binary每次实际走到哪一支。

Run 前后 `%DebugPrint` 实际只输出同一 JSFunction 身份。未取得反馈槽内容、逐次快路径或回退计数。`v8/status_v2.json` 更正原status过强措辞；原记录不删除。不能报告“V8该点100%命中”。

## 统计范围

`diagnostic_sites.csv` 保留case、engine、repetitions、阶段、函数源码SHA、实例id、真实PC及属性；同名/匿名函数不自动合并。相同源码在原文件多处出现时标 UNKNOWN_SHARED_SOURCE。`function_mapping.csv` 另保留规范化opcode/atom/非atom操作数字节指纹及独立实例，跨进程实例号本身不是永久身份。

`phase_totals.csv` 中 read 汇总与 write/其它helper分开；A的IC计数0表示未接IC，不是A没有属性操作。全局find另列未处于属性opcode上下文的部分。加载和编译仍是合并阶段，不能声称二者已经单独计量。
