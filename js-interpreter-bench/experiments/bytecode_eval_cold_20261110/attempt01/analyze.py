"""Explain captured live bytecode and audit the raw snapshot records offline."""
import csv
import hashlib
import io
import json
from pathlib import Path
import re

HERE = Path(__file__).resolve().parent


def read(name):
    return json.loads((HERE/name).read_text())


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    data = {label:{r['label']:r for r in read('snapshots/'+label+'.json')} for label in ['A','EVAL_COLD']}
    cases = ['ownRead','ownLoop','protoCall','readStore','mathCall','evalRead','unusedEval']
    summaries = []
    for label, rows in data.items():
        raw = read('raw/'+label+'.json')
        assert raw['returncode'] == 0 and not raw['stderr']
        parsed = [json.loads(s[len('BYTECODE_SNAPSHOT:'):]) for s in raw['stdout'].splitlines() if s.startswith('BYTECODE_SNAPSHOT:')]
        assert parsed == list(rows.values())
        manifest = read(label+'.manifest.json')
        original = Path(manifest['original'])
        assert sha(original/'qjs') == manifest['release_elf_sha256']
        assert all(sha(original/name)==digest for name,digest in manifest['release_sources'].items())
        for row in rows.values():
            pc = 0
            valid_pcs = {i['pc'] for i in row['opcodes']}
            for ins in row['opcodes']:
                assert pc == ins['pc']
                code = bytes.fromhex(ins['raw'])
                assert len(code) == ins['size'] and code[0] == ins['op']
                if 'target' in ins: assert ins['target'] in valid_pcs
                if 'site_index' in ins:
                    index = ins['site_index']
                    assert row['sites'][index]['atom'] == ins['atom']
                    assert int.from_bytes(code[1:],'little') == ins['site_delta']
                    aligned = (row['byte_code_len']+7)&~7
                    assert ins['pc']+1+ins['site_delta'] == aligned+index*row['site_size']
                pc += ins['size']
            assert pc == row['byte_code_len']
    for name in cases:
        a = data['A']['warm.'+name]
        e = data['EVAL_COLD']['warm.'+name]
        assert a['byte_code_len'] == e['byte_code_len']
        assert (a['arg_count'],a['var_count'],a['stack_size']) == (e['arg_count'],e['var_count'],e['stack_size'])
        summaries.append(dict(function=name,bytecode_bytes=a['byte_code_len'],
            static_instructions_A=len(a['opcodes']),static_instructions_EVAL=len(e['opcodes']),
            EVAL_IC_sites=e['ic_count'], EVAL_IC_record_bytes=e['ic_count']*e['site_size'],
            EVAL_additional_execution_buffer_bytes=(((e['byte_code_len']+7)&~7)+e['ic_count']*e['site_size']) if e['ic_count'] else 0))
    stream = io.StringIO(newline='')
    writer = csv.DictWriter(stream,fieldnames=list(summaries[0]))
    writer.writeheader();writer.writerows(summaries)
    (HERE/'summary.csv').write_text(stream.getvalue())

    # Preserve excerpts from ORIGINAL Release ELF disassembly, not diagnostic ELF.
    selections = {
        'A':[('get_arg0 entry',0x26f91,0x26fcc),('get_field body',0x295a6,0x29662)],
        'EVAL_COLD':[('v6_get_arg0 entry',0x27a37,0x27a52),('object guard and fused hit',0x2c145,0x2c1ae)],
    }
    for label,blocks in selections.items():
        text = (HERE/'native'/f'{label}.JS_CallInternal.txt').read_text()
        assert '<JS_CallInternal>:' in text
        output = ['Original frozen Release ELF: '+read(label+'.manifest.json')['original']+'/qjs',
                  'Selected blocks only. Other branch destinations remain in the full dump.',
                  'These are static instructions, not measured cycles or retired-instruction counts.','']
        for title,lo,hi in blocks:
            output += [title]
            instructions = []
            for line in text.splitlines():
                m = re.match(r'^\s*([0-9a-f]+):\s',line)
                if m and lo <= int(m[1],16) < hi: instructions.append(line)
            assert instructions,title
            output += instructions+['']
        (HERE/'native'/f'{label}.own_read_excerpt.txt').write_text('\n'.join(output))

    text = '''# A 与 EVAL_COLD：字节码和解释器执行路径

本次分析只比较原版 A 与原 EVAL_COLD，不使用 GUARDED_OFFSET。
两者是解释器：本次 JavaScript 编译得到的是字节码；x86-64 汇编来自预先由 GCC 编译好的解释器。
不存在为每个 JavaScript 函数另行 JIT 生成一段机器码的过程。

## 采集方式

- 相同 `cases.js`，7个函数，调用前/首次调用后/重复调用后三个阶段，两版共42份快照。
- 在冻结源码的独立诊断副本中追加只读快照函数，不改变编译器、IC准备或opcode执行逻辑。
- 从函数当前的 `byte_code_buf` 和 IC 记录解码，避免默认 DUMP_BYTECODE 在改写之前打印而漏掉差异。
- 原 Release 源码和 ELF 均校验未变；`native/` 的汇编直接取自原 Release ELF。
- 次数很小，仅用于检查代码和状态；没有新增性能测量。这里的 warm 指缓存已经填充，不是 JIT 优化。

原始输入：[cases.js](cases.js)。全部结构化快照：[A](snapshots/A.json)、[EVAL_COLD](snapshots/EVAL_COLD.json)。

## 1. 最小自身属性读取：长度相同，命中时少一次分派和一对接收对象引用计数

```javascript
function ownRead(o) { return o.x; }
```

A 实际字节码：

```text
0000  get_arg0
0001  get_field x
0006  return
```

EVAL_COLD 实际字节码：

```text
0000  v6_get_arg0
0001  get_field_rdi x [IC0; delta=6]
0006  return
```

两版都为7字节、3条静态指令。`v6` 是本项目自定义指令命名，与 V8 无关。
差异在实际执行：缓存命中时，`v6_get_arg0` 内部检查普通对象类型和 shape，
按 `site->prop_offset` 取出属性值并推进 pc，直接进入 return，不再分派 get_field_rdi。

A 执行路径：

```text
get_arg0：复制接收对象值到栈，并增加对象引用计数
get_field：按 atom 查属性哈希桶；检查描述符；读取当前值；释放栈上的接收对象
return
```

EVAL_COLD 命中路径：

```text
v6_get_arg0：借用参数对象；检查类型/shape；按缓存槽位读取当前值；跳过下一条指令
return
```

因此这一个位置在稳定命中时：分派3→2、属性哈希查找1→0、接收对象的一对引用计数操作1→0。
属性值本身的 JS_DupValue 语义仍然保留；本例 x 为整数，不需要它的堆引用计数操作。
未命中时 v6_get_arg0 会正常复制对象入栈，再执行 get_field_rdi 的回退查找并尝试填充。

### delta 与属性 offset 不是同一件事

这里 get_field_rdi 的四字节操作数6，表示从操作数字段地址前进6字节找到 IC0。
IC0里另外保存 shape 和 prop_offset。本例 x 的 prop_offset 正好是0，是 JSProperty 数组索引。
机器码中乘16得到字节偏移；若 x 位于别的属性位置，prop_offset 就不再是0。

## 2. 放进循环：每轮只是11次分派降到10次，循环控制和加法都还在

```javascript
function ownLoop(o, n) {
    var sum = 0;
    for (var i = 0; i < n; i++) sum += o.x;
    return sum;
}
```

两版均为24字节、17条静态指令。唯一改写仍是 get_arg0/get_field 这对指令。
循环稳态中，4条条件判断指令加7条循环体/回跳指令，A合计11次分派；EVAL命中后为10次。
初始化与最后一次失败的条件判断另计。缓存已热且 n≥1 时，整次函数分派数：

```text
A：         11*n + 10
EVAL_COLD： 10*n + 10
```

若 n=16，则186→170。这个数由实际字节码和处理器控制流推导，并非硬件计数器测量。
它表示分派次数变化，不能换算成相同幅度的耗时变化。

仍然执行的操作包括：计数变量读取、n读取、比较、条件跳转、sum读取、加法、sum写回、递增和回跳。
因此 IC 很高，也不会把整个循环变成一次数组读取或消除这些工作。

完整循环：[A](bytecode/A/warm.ownLoop.txt)、[EVAL_COLD](bytecode/EVAL_COLD/warm.ownLoop.txt)。

## 3. 原型方法：没有融合掉一条指令，但省掉接收对象和直接原型的属性查找

```javascript
function protoCall(o) { return o.step(); }
```

```text
A：         get_arg0; get_field2 step;     tail_call_method 0
EVAL_COLD： get_arg0; get_field2_rdi IC0;  tail_call_method 0
```

两版均9字节、3条静态指令。这里 get_field2 需要保留调用的 this，当前实现没有 B2 借用融合。
快照证实重复调用后 IC0 的 receiver shape 和 holder_shape 都非空。
A 要先在接收对象上找不到 step，再去直接原型找到；EVAL检查接收者和直接原型的 shape 后按位置取方法。
方法调用、this绑定和被调函数体继续执行，并没有因为 IC 命中而消失。

## 4. 读后写：写入复用前面的读缓存

```javascript
function readStore(o) { o.x = o.x + 1; return o.x; }
```

A：

```text
get_arg0
get_arg0; get_field x
push_1; add
put_field x
get_arg0; get_field x
return
```

EVAL_COLD：

```text
get_arg0
v6_get_arg0; get_field_rdi x [IC0]
push_1; add
put_field_shared x [IC0]
v6_get_arg0; get_field_rdi x [IC1]
return
```

两版均21字节、9条静态指令。稳态命中时 EVAL 跳过两次 get_field_rdi 分派，实际分派9→7。
读取 RHS、写入 LHS、读取返回值这三次属性哈希查找可变成0次。
写入仍检查对象/shape及可写普通属性标志，随后更新当前值；不能省掉可写性检查。
两个读位点有两条 IC 记录，put_field_shared 没有第三条记录，它指回 IC0。

## 5. Math：指令改写不代表成功加速

```javascript
function mathCall(o) { return o.sqrt(9); } // 传 Math
```

```text
A：         get_arg0; get_field2 sqrt;    push_i8 9; tail_call_method 1
EVAL_COLD： get_arg0; get_field2_rdi IC0; push_i8 9; tail_call_method 1
```

两版均11字节、4条静态指令。首次调用后和重复调用后，EVAL的 IC0.shape 始终为 NULL；
接收者 Math 的 is_hashed 为 false。因此 EVAL 虽然执行了 IC 指令，仍然先尝试缓存、失败后做正常查找。
这与上一轮对 Mandreel/zlib 的原因统计一致。sqrt函数执行本身也完全保留。

## 6. EVAL_COLD 的 cold：影响何时准备，不是热代码生成得更激进

evalRead 与 ownRead 函数体相同，但来源是 eval。

|阶段|A 的 evalRead|EVAL_COLD 的 evalRead|
|---|---|---|
|首次调用前|get_arg0/get_field，无IC|get_arg0/get_field，ic_ready=false，0条记录，cold类|
|首次调用后|字节码不变|v6_get_arg0/get_field_rdi，ic_ready=true，1条已填充记录，普通函数类|
|重复调用后|字节码不变|字节码不再变化，缓存已填充|

没有调用的 unusedEval 在三个阶段都保持 ic_ready=false、0条记录，且仍是普通 get_arg0/get_field。
它已完成 JavaScript 解析和字节码编译；省的是 IC 扫描、执行图像复制和记录分配，不是所有编译工作。
调用后 evalRead 的热指令形态与 ownRead 一样，没有额外的 JIT 层级或第二轮机器码生成。

## 7. 原 Release ELF 的 x86-64 证据

A 的 get_field 分支中，确实存在 atom掩码、哈希桶读取、atom比较和冲突跳转；
EVAL 的借用融合命中分支中，确实是 shape比较后加载 prop_offset、乘16、访问对象 prop数组。

节选自原 ELF，省略其余守卫和分支：

```asm
; A: atom 已经是整数；这里不是重新计算字符串哈希
295d9: and    %ecx,%edx
295db: mov    0x38(%rdi,%rdx,4),%edx   ; 读取属性桶
295fb: cmp    0x4(%rsi),%ecx           ; 比较 atom
295fe: jne    2aa50                    ; 冲突时继续链

; EVAL_COLD: 已通过对象类型守卫
2c167: cmp    %rsi,(%rcx)              ; receiver shape == cached shape
2c16a: jne    27a52                    ; 失败时走正常读取
2c170: mov    0x10(%rcx),%edx          ; IC.prop_offset
2c177: shl    $0x4,%rdx                ; sizeof(JSProperty) == 16
2c17b: add    0x20(%rax),%rdx          ; object.prop + offset
```

[A属性路径节选](native/A.own_read_excerpt.txt)、[EVAL属性路径节选](native/EVAL_COLD.own_read_excerpt.txt)。
完整解释器反汇编：[A](native/A.JS_CallInternal.txt)、[EVAL_COLD](native/EVAL_COLD.JS_CallInternal.txt)。
不同寄存器分配、跳转距离或静态汇编行数不能直接当作周期数；本次没有测 cycles、branch misses 或 cache misses。

## 8. 这次分析能确认的优化边界

|例子|稳态调用者分派 A→EVAL|目标属性哈希查找 A→EVAL|仍保留的主要工作|
|---|---|---|---|
|ownRead|3→2|1→0|类型/shape检查、读取当前值、返回|
|ownLoop 每轮|11→10|1→0|循环控制、加法、栈读写|
|protoCall|3→3|至少2→0|this绑定、方法调用与函数体|
|readStore|9→7|3→0|加法、写入标志检查与更新|
|mathCall|4→4|1→1（普通数据属性稳态）|额外IC探测、原查找、sqrt调用|

分派数是从实际指令和稳定命中路径推导的；不包含调用者之外的原生/JS函数体执行。
从这里可以区分三种问题：本身不支持缓存；缓存支持但守卫/分派成本仍高；属性访问只占程序的一小部分。
进一步定位耗时需要在这些相同内核上分别测原路径、命中路径、未命中路径，并结合采样/硬件计数器，不能只看命中率。
'''
    text += '\n## 字节码与记录存储\n\n'
    text += '|函数|字节码字节数（两版相同）|静态指令数（两版相同）|EVAL IC记录数|记录字节数|额外执行缓冲区字节数|\n'
    text += '|---|---:|---:|---:|---:|---:|\n'
    for row in summaries:
        text += '|'+ '|'.join(str(row[k]) for k in ['function','bytecode_bytes','static_instructions_A','EVAL_IC_sites','EVAL_IC_record_bytes','EVAL_additional_execution_buffer_bytes'])+'|\n'
    text += '\n额外执行缓冲区包含对齐后的代码副本和IC记录，不是函数总内存占用。unusedEval尚未准备，因此没有这个额外缓冲区。\n'
    (HERE/'results.md').write_text(text)
    (HERE/'independent_check.json').write_text(json.dumps(dict(status='PASS',raw_snapshots_match=True,
        checked_snapshots=42,all_instruction_boundaries_valid=True,all_branch_targets_valid=True,
        all_IC_deltas_resolve_to_correct_record=True,stack_frame_metadata_equal=True,
        original_release_sources_and_ELFs_unchanged=True),indent=2)+'\n')
    print('OFFLINE_ANALYSIS_PASS')


if __name__ == '__main__':
    main()
