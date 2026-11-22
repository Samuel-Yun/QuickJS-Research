"""Use actual executed images and actual Release dispatch-table targets."""
import json
from pathlib import Path
import re
import struct
import subprocess

from build import HERE,sha,save


def table(binary):
    symbols=subprocess.check_output(['nm','-a','-S',str(binary)],text=True)
    line=next(l for l in symbols.splitlines() if 'dispatch_table.' in l and l.split()[1]=='0000000000000800')
    address=int(line.split()[0],16);d=binary.read_bytes()
    assert d[:6]==b'\x7fELF\x02\x01'
    offset=struct.unpack_from('<Q',d,32)[0];size,n=struct.unpack_from('<HH',d,54)
    for i in range(n):
        h=struct.unpack_from('<IIQQQQQQ',d,offset+i*size)
        if h[0]==1 and h[3]<=address and address+2048<=h[3]+h[5]:
            p=h[2]+address-h[3];return struct.unpack_from('<256Q',d,p)
    raise AssertionError('ELF data segment')


def cfg(binary,start):
    raw=subprocess.check_output(['objdump','-d','--no-show-raw-insn','--disassemble=JS_CallInternal',str(binary)],text=True)
    instructions={}
    for line in raw.splitlines():
        m=re.match(r'^\s*([0-9a-f]+):\s+(\S+)\s*(.*)$',line)
        if m:instructions[int(m[1],16)]=(m[2],m[3],line)
    positions=sorted(instructions);nexts={a:b for a,b in zip(positions,positions[1:])}
    todo=[start];seen=set()
    while todo:
        a=todo.pop()
        if a in seen or a not in instructions:continue
        seen.add(a);op,operand,_=instructions[a]
        if op.startswith('ret') or op in ['ud2','int3']:continue
        if op.startswith('j'):
            target=re.match(r'([0-9a-f]+)\b',operand)
            if target:todo.append(int(target[1],16))
            if op=='jmp':continue
        if a in nexts:todo.append(nexts[a])
    return [instructions[a][2] for a in sorted(seen)]


def main():
    out=HERE/'assembly';out.mkdir(exist_ok=True);summary={}
    for label in ['OLD_D16','D16_STATIC']:
        m=json.loads((HERE/(label+'.release.manifest.json')).read_text())
        binary=Path(m['binary']);assert sha(binary)==m['binary_sha256']
        dispatch=table(binary);result={}
        for mode in ['short','wide']:
            path=HERE/'targeted/counts'/(label+'.'+mode+'.image.jsonl')
            images=[json.loads(s) for s in path.read_text().splitlines()];assert len(images)==1
            image=images[0];ops=image['opcodes']
            expected='v6s_get_arg0' if label=='D16_STATIC' and mode=='short' else 'v6_get_arg0'
            prefix=next(o for o in ops if o['name']==expected)
            field=next(o for o in ops if o['name']==('get_field_rdi16' if mode=='short' else 'get_field_rdi'))
            assert field['size']==(3 if mode=='short' else 5)
            lines=cfg(binary,dispatch[prefix['opcode']])
            field16=next(o['opcode'] for o in json.loads((HERE/'targeted/counts'/(label+'.short.image.jsonl')).read_text())['opcodes'] if o['name']=='get_field_rdi16')
            format_checks=[s for s in lines if re.search(r'\bcmp\w*\s+\$0x'+format(field16,'x')+r',\(',s)]
            if label=='OLD_D16':assert format_checks,(label,mode,lines)
            else:assert not format_checks,(label,mode,format_checks)
            (out/(label+'.'+mode+'.cfg.asm.txt')).write_text('\n'.join(lines)+'\n')
            result[mode]=dict(prefix=prefix['name'],entry=hex(dispatch[prefix['opcode']]),
                bytecode_length=image['bytes'],field_instruction_bytes=field['size'],
                next_opcode_format_checks=format_checks,reachable_instruction_count=len(lines))
        # These regular DEFs are adjacent in the real compiled header, so the
        # corresponding loc0 opcode is adjacent to the sampled arg0 opcode.
        header=(binary.parent/'quickjs-opcode.h').read_text()
        for mode in ['short','wide']:
            image=json.loads((HERE/'targeted/counts'/(label+'.'+mode+'.image.jsonl')).read_text())
            short_prefix=label=='D16_STATIC' and mode=='short'
            arg_name='v6s_get_arg0' if short_prefix else 'v6_get_arg0'
            loc_name='v6s_get_loc0' if short_prefix else 'v6_get_loc0'
            a,b=[header.index('DEF('+n+',') for n in ([arg_name,loc_name] if short_prefix else [loc_name,arg_name])]
            assert a<b and header[a:b].count('DEF(')==1
            arg_opcode=next(o['opcode'] for o in image['opcodes'] if o['name']==arg_name)
            loc_opcode=arg_opcode+(1 if short_prefix else -1)
            lines=cfg(binary,dispatch[loc_opcode])
            checks=[s for s in lines if re.search(r'\bcmp\w*\s+\$0x'+format(field16,'x')+r',\(',s)]
            assert bool(checks)==(label=='OLD_D16'),(label,mode,checks)
            (out/(label+'.'+mode+'.loc0.cfg.asm.txt')).write_text('\n'.join(lines)+'\n')
            result[mode+'_loc0']=dict(prefix=loc_name,entry=hex(dispatch[loc_opcode]),
                field_instruction_bytes=3 if mode=='short' else 5,
                next_opcode_format_checks=checks,reachable_instruction_count=len(lines))
        summary[label]=dict(binary_sha256=m['binary_sha256'],paths=result)
    save(out/'proof.json',dict(status='PASS',actual_images=True,actual_Release_assembly=True,versions=summary))
    report=['# D16_STATIC：实际字节码和 Release 机器码', '',
        '字节码取自独立计数构建中首次进入执行的 byte_code_buf；汇编取自未插桩 Release 的真实 dispatch_table 入口。'
        '从入口跟随条件分支和直接跳转，到下一次间接分派停止；不把编译输出当执行镜像。', '',
        '| 版本 | 输入 | 融合前缀 | 读取指令字节 | 判断下一条是否短格式 |', '|---|---|---|---:|---:|']
    for l,s in summary.items():
        for mode,p in s['paths'].items():
            report.append(f'| {l} | {mode} | {p["prefix"]} | {p["field_instruction_bytes"]} | {len(p["next_opcode_format_checks"])} |')
    report += ['', '旧 D16 的两种融合入口都会检查下一条 opcode 是否 get_field_rdi16；'
        'STATIC 在准备阶段选择专用前缀，源码中不读下一条 opcode 来决定格式。'
        '两个 STATIC handler 分别固定 get_u16/跳过 3 字节、get_u32/跳过 5 字节。'
        '真实 CFG 指令保存在同目录 .asm.txt；字节码原始字节在 ../targeted/counts/*.image.jsonl。', '']
    (out/'results.md').write_text('\n'.join(report));print('ASSEMBLY_PROOF_PASS',flush=True)


if __name__=='__main__':main()
