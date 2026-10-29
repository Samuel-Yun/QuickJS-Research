"""Render exact recorded instructions; unknown operand encodings remain raw hex."""
from common import *
from diagnostics import NAMES,TARGET
def main():
    doc=['# 实际最终字节码与本轮操纵检查','','原始命令/输出在 raw/commands/dump.V8.*.json；QuickJS原始完整报告在raw/diagnostic/*.json.gz。下列QuickJS是从最终code_before_hex和实际opcode元数据解码，不是手写等价序列；DUMP_BYTECODE=0只提供名称，不打印中间IR。两个独立诊断版不用于正式计时。','',
         '每案例完整目标caller、step、microRun分别列出；其它共同函数的完整dump也保存在bytecode/<case>/。QJS按atom字符串作跨进程对应，原atom/site index和rawbytes在JSON；不能用绝对指针跨进程比较。V8仅移除绝对地址，保留真实PC/字节/操作数。静态指令数与编码字节分开，不是动态dispatch或执行成本。','']
    lengths=[]
    for case in CASES:
        doc+=['## '+case,'']
        for v in ['A','M']:
            for fname in [TARGET[case],'step','microRun']:
                f=read(HERE/'bytecode'/case/f'{v}.{fname}.json');raw=f['raw'];code=bytes.fromhex(raw['code_before_hex']);assert code==bytes.fromhex(raw['code_after_hex'])
                ops=raw['opcodes'];lines=[];assert sum(op['size'] for op in ops)==len(code)
                for op in ops:
                    pc=op['pc'];nm=op['before_op'];b=code[pc+1:pc+op['size']];atom=bytes.fromhex(op['atom_hex']).decode(errors='replace')
                    if atom:operand=(str(int.from_bytes(b,'little'))+' ['+atom+']')
                    elif nm in ['call','call_method','tail_call','tail_call_method','inc_loc','get_var']:operand=str(int.from_bytes(b,'little')) if b else ''
                    else:operand='bytes:'+b.hex() if b else ''
                    lines.append(f'{pc:3} {nm} {operand}'.rstrip())
                doc += [f'### {v} / {fname}: {len(ops)}条，{len(code)}B','',f'源码SHA `{f["source_sha256"]}`；compiled instance {f["instance_id"]}。','```javascript',f['source'],'```','```text',*lines,'```','']
                lengths.append(dict(case=case,condition=v,function=fname,static_instructions=len(ops),bytecode_bytes=len(code),phase='final executable encoding before first invocation',formal_performance_binary=False))
        for fname in [TARGET[case],'step','microRun']:
            ins=read(HERE/'bytecode'/case/f'V8.{fname}.json');count=sum(len(op['bytes']) for op in ins)
            block=(HERE/'bytecode'/case/f'V8.{fname}.txt').read_text();m=re.search(r'Bytecode length: (\d+)',block);assert m and int(m[1])==count
            doc += [f'### V8 / {fname}: {len(ins)}条，{count}B','```text',*[f'{op["pc"]:3} {op["instruction"]}' for op in ins],'```','']
            lengths.append(dict(case=case,condition='V8_ON',function=fname,static_instructions=len(ins),bytecode_bytes=count,phase='no-lazy final BytecodeArray, original release binary',formal_performance_binary=True))
    doc+=['## 按操作理解，而非逐条硬配','','- 两read使用同一个valueReadLoop编码。QuickJS PC12取得slot、17覆盖last；18–23进行i+1和sum累加；28–31做最终身份检查。V8 PC13/17读取并保存last，18–29加法/保存，39–44身份检查。循环中没有step调用；错误分支的call未执行由A/M实际call计数0支持。',
          '- own方法：QJS get_field2/_rdi先保留obj，再压方法；call_method传一个参数。V8 GetNamedProperty FBV[0]把结果给accumulator，Star3保存函数，再CallProperty1 FBV[2]传obj和i。读取反馈与调用反馈不同。',
          '- local：QJS PC1和V8 PC0的slot读取在循环入口比较之前；后续回跳目标分别PC11和PC9，不会回到字段读取。QJS循环内get_loc0仍复制函数；V8将fn保存在r0供CallUndefinedReceiver1使用。fn并非每进程只取一次，而是每个Run一次。',
          '- 所有call案例的step只做x+1；QJS get_arg0/push_1/add/return，无push_this；V8 Ldar a0/AddSmi1/Return。QJS的a0命名在这里不用来指V8物理寄存器，V8的a0/r0都是字节码参数/虚拟寄存器。',
          '- 原始跳转操作数字节未解成绝对PC时显示bytes:，不冒充已解码目标。完整V8文本保留原跳转注释，QJS回跳位置以源实现读取相对编码核对；不能按文本行数替代指令数。',
          '- 数字/函数值的差异不会自动生成另一个读取opcode；M查询/返回tag计数提供真实执行证据，见path_counts.csv。调用次数另见call_counts.csv，不与属性operation混计。','']
    save(HERE/'bytecode_evidence.md','\n'.join(doc));csvout(HERE/'bytecode_lengths.csv',lengths)
if __name__=='__main__':main()
