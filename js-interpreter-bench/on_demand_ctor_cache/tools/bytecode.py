#!/usr/bin/env python3
"""Execute a classic JS script, then inspect its live bytecode buffers."""
import argparse
from datetime import datetime
import difflib
import hashlib
import json
import os
from pathlib import Path
import subprocess
import sys
from zoneinfo import ZoneInfo

PACKAGE = Path(__file__).resolve().parents[1]
HELPER = PACKAGE / 'tools/bytecode_snapshot.inc'


def digest(data):
    return hashlib.sha256(data).hexdigest()


def save_json(path, value):
    path.write_text(json.dumps(value, ensure_ascii=False, indent=2) + '\n')


def inspection_sources(engine):
    manifest = json.loads((PACKAGE / 'manifest.json').read_text())
    key = 'original' if engine == 'A' else 'modified'
    source = {}
    for name, expected in manifest[key].items():
        data = (PACKAGE / key / name).read_bytes()
        if digest(data) != expected:
            raise RuntimeError(f'冻结源码不一致：{key}/{name}')
        source[name] = data
    modified = dict(source)
    q = source['quickjs.c'].decode()
    declaration = 'static JSValue __JS_EvalInternal(JSContext *ctx, JSValueConst this_obj,'
    assert q.count(declaration) == 1
    q = q.replace(declaration, 'static int bc_after_script(JSContext *ctx, JSValueConst root);\n\n' + declaration, 1)
    anchor = '        ret_val = JS_EvalFunctionInternal(ctx, fun_obj, this_obj, var_refs, sf);'
    assert q.count(anchor) == 1
    # Keep a single root bytecode reference across execution, and inspect only
    # the requested outer file. Internal evals/headers run normally.
    replacement = '''        const char *bc_file = getenv("QJS_INSPECT_FILE");
        BOOL bc_selected = bc_file && !strcmp(filename, bc_file) &&
                           eval_type == JS_EVAL_TYPE_GLOBAL;
        JSValue bc_root = bc_selected ? JS_DupValue(ctx, fun_obj) : JS_UNDEFINED;
''' + anchor + '''
        if (bc_selected && !JS_IsException(ret_val) && bc_after_script(ctx, bc_root) < 0) {
            JS_FreeValue(ctx, ret_val);
            ret_val = JS_ThrowInternalError(ctx, "could not write bytecode snapshot");
        }
        JS_FreeValue(ctx, bc_root);'''
    q = q.replace(anchor, replacement, 1)
    q += '\n' + ('#define BC_METHOD 1\n' if engine == 'method' else '')
    q += '#include "bytecode_snapshot.inc"\n'
    modified['quickjs.c'] = q.encode()
    modified['bytecode_snapshot.inc'] = HELPER.read_bytes()
    return source, modified


def build(engine, jobs):
    original, source = inspection_sources(engine)
    hashes = {n: digest(b) for n, b in sorted(source.items())}
    signature = digest(json.dumps(hashes, sort_keys=True).encode())
    work = PACKAGE / 'build/bytecode' / (engine + '-' + signature[:16])
    stamp = work / 'inspection.json'
    if stamp.exists():
        info = json.loads(stamp.read_text())
        if all(digest((work / n).read_bytes()) == h for n, h in hashes.items()) and (
                digest((work / 'qjs').read_bytes()) == info['elf_sha256']):
            return work / 'qjs', info
        raise RuntimeError(f'查看用构建已被手动修改，保留现场：{work}')
    work.mkdir(parents=True, exist_ok=True)
    for name, data in source.items():
        p = work / name
        p.parent.mkdir(parents=True, exist_ok=True)
        p.write_bytes(data)
    patch = ''.join(''.join(difflib.unified_diff(
        original.get(n, b'').decode().splitlines(True), data.decode().splitlines(True),
        fromfile='a/' + n if n in original else '/dev/null', tofile='b/' + n))
        for n, data in source.items() if data != original.get(n))
    (work / 'inspection.patch').write_text(patch)
    print(f'首次生成 {engine} 字节码查看构建…', flush=True)
    command = ['make', f'-j{jobs}', '-o', 'repl.c', 'qjs']
    with (work / 'build.log').open('w') as log:
        r = subprocess.run(command, cwd=work, stdout=log, stderr=subprocess.STDOUT)
    if r.returncode:
        raise RuntimeError(f'构建失败，查看 {work / "build.log"}')
    info = dict(engine=engine, sources=hashes, signature=signature,
                elf_sha256=digest((work / 'qjs').read_bytes()), command=command,
                inspection_only=True, interpreter_handlers_changed=False)
    save_json(stamp, info)
    return work / 'qjs', info


def operand(op):
    data = bytes.fromhex(op['raw'])[1:]
    fmt, pc = op['format'], op['pc']
    uint = lambda raw: int.from_bytes(raw, 'little')
    sint = lambda raw: int.from_bytes(raw, 'little', signed=True)
    if 'site_index' in op:
        return f'{op["atom"]}  IC[{op["site_index"]}] delta={op["delta"]}'
    if 'constructor_index' in op:
        return f'record[{op["constructor_index"]}] argc={op["argc"]}'
    if fmt.startswith('atom'):
        text = op['atom']
        if fmt in ['atom_u8', 'atom_u16']:
            text += ', ' + str(uint(data[4:]))
        elif fmt in ['atom_label_u8', 'atom_label_u16']:
            text += f', ->{pc+5+sint(data[4:8])}, {uint(data[8:])}'
        return text
    if fmt in ['label8', 'label16', 'label']:
        return f'->{pc+1+sint(data)}'
    if fmt == 'label_u16':
        return f'->{pc+1+sint(data[:4])}, {uint(data[4:])}'
    if fmt == 'npop_u16':
        return f'argc={uint(data[:2])}, {uint(data[2:])}'
    if fmt in ['u8', 'u16', 'u32', 'loc8', 'loc', 'arg', 'var_ref', 'const8', 'const', 'npop']:
        return str(uint(data))
    if fmt in ['i8', 'i16', 'i32']:
        return str(sint(data))
    if fmt == 'npopx':
        return 'argc=' + op['name'][-1]
    if fmt == 'none_int':
        return '-1' if op['name'] == 'push_minus1' else op['name'].removeprefix('push_')
    return ''


def disassemble(snapshots):
    lines = []
    for b in snapshots:
        name = b['function'] or '<anonymous>'
        lines += [f'函数 [{b["id"]}] {name}  parent={b["parent"]}  '
                  f'args={b["arg_count"]} locals={b["var_count"]} '
                  f'bytes={b["byte_code_len"]}',
                  'offset  opcode                     操作数', '-' * 72]
        for op in b['opcodes']:
            value = operand(op)
            if 'binding' in op:
                value += f' ({op["binding"]})'
            lines.append(f'{op["pc"]:06d}  {op["name"]:<26} {value}')
        for s in b['read_sites']:
            state = ('直接原型' if s['holder_shape'] else '自有字段') if s['shape'] else '未填充'
            lines.append(f'  IC[{s["index"]}] {s["atom"]}: {state}, offset={s["offset"]}')
        for s in b['constructor_sites']:
            lines.append(f'  record[{s["index"]}] pc={s["pc"]}, argc={s["argc"]}, '
                         f'正计划={s["positive_plan"]}, 负目标={s["negative_target"]}')
        lines.append('')
    return '\n'.join(lines) + '\n'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('script', type=Path, help='要实际执行的普通 JS 脚本')
    parser.add_argument('--engine', choices=['A', 'method', 'both'], default='method')
    parser.add_argument('--function', action='append', default=[], dest='functions',
                        help='只显示这个函数名或编号，可重复指定；<script> 表示脚本主体')
    parser.add_argument('--list-functions', action='store_true', help='执行后列出函数名称/编号')
    parser.add_argument('--args', nargs=argparse.REMAINDER, default=[], help='传给 JS 的参数，放在命令最后')
    parser.add_argument('--preload', action='append', type=Path, default=[], help='额外 -I 预加载脚本')
    parser.add_argument('--std', action='store_true')
    parser.add_argument('--cpu', type=int, default=2)
    parser.add_argument('--jobs', type=int, default=2)
    parser.add_argument('--timeout', type=float, default=600)
    parser.add_argument('--output', type=Path)
    args = parser.parse_args()
    script = args.script.resolve()
    if not script.is_file():
        parser.error(f'找不到 JS：{script}')
    if script.suffix == '.mjs':
        parser.error('当前查看入口用于普通 JS 脚本，不支持模块')
    if args.cpu not in os.sched_getaffinity(0):
        parser.error(f'CPU {args.cpu} 不可用')
    if args.jobs < 1 or args.timeout <= 0:
        parser.error('jobs 和 timeout 必须大于 0')
    engines = ['A', 'method'] if args.engine == 'both' else [args.engine]
    stamp = datetime.now(ZoneInfo('Asia/Shanghai')).strftime('%Y%m%d_%H%M%S_%f')
    output = (args.output or PACKAGE / 'bytecode_runs' / stamp).resolve()
    output.mkdir(parents=True, exist_ok=False)
    save_json(output / 'status.json', dict(complete=False))
    records, texts = {}, {}
    print('这是字节码查看构建，运行时间不用于性能比较。', flush=True)
    for engine in engines:
        binary, info = build(engine, args.jobs)
        path = output / (engine + '.snapshots.jsonl')
        env = dict(os.environ, TZ='Asia/Shanghai', LANG='C', LC_ALL='C',
                   QJS_INSPECT_FILE=str(script), QJS_INSPECT_OUTPUT=str(path))
        command = ['taskset', '-c', str(args.cpu), str(binary)]
        preload = [p.resolve() for p in args.preload]
        if script == PACKAGE / 'tests/octane/zlib.js':
            preload.insert(0, PACKAGE / 'tests/support/zlib_read.js')
        if args.std or preload:
            command.append('--std')
        for p in preload:
            command += ['-I', str(p)]
        command += [str(script), *args.args]
        print(f'\n=== {engine}：运行 {script.name} ===', flush=True)
        try:
            r = subprocess.run(command, capture_output=True, text=True, env=env, timeout=args.timeout)
            stdout, stderr = r.stdout, r.stderr
        except subprocess.TimeoutExpired as exc:
            (output / (engine + '.stdout')).write_bytes(exc.stdout or b'')
            (output / (engine + '.stderr')).write_bytes(exc.stderr or b'')
            raise RuntimeError(f'{engine} 超时；输出已保留到 {output}') from exc
        (output / (engine + '.stdout')).write_text(stdout)
        (output / (engine + '.stderr')).write_text(stderr)
        records[engine] = dict(command=command, source_signature=info['signature'],
                               binary_sha256=info['elf_sha256'], exit_code=r.returncode)
        save_json(output / 'run.json', dict(script=str(script), script_sha256=digest(script.read_bytes()),
                                            functions=args.functions, engines=records))
        if stdout:
            print(stdout, end='' if stdout.endswith('\n') else '\n')
        if stderr:
            print(stderr, file=sys.stderr, end='' if stderr.endswith('\n') else '\n')
        if r.returncode:
            raise RuntimeError(f'{engine} 执行失败（退出码 {r.returncode}），没有伪造运行后快照：{output}')
        if not path.exists():
            raise RuntimeError(f'没有运行后快照；模块、显式 quit 或尚未完成的异步工作不在此入口范围：{output}')
        snapshots = [json.loads(line) for line in path.read_text().splitlines()]
        if args.list_functions:
            for b in snapshots:
                print(f'[{b["id"]}] {b["function"] or "<anonymous>"}  parent={b["parent"]}')
        selected = snapshots
        if args.functions:
            for name in args.functions:
                matched = [b for b in snapshots if name in [b['function'], str(b['id'])]
                           or (name == '<script>' and b['parent'] == -1)]
                if not matched:
                    raise RuntimeError(f'找不到函数 {name!r}；用 --list-functions 看本脚本的静态函数列表')
            selected = [b for b in snapshots if any(name in [b['function'], str(b['id'])]
                        or (name == '<script>' and b['parent'] == -1) for name in args.functions)]
        text = disassemble(selected)
        (output / (engine + '.txt')).write_text(text)
        texts[engine] = text
        if not args.list_functions:
            print(text)
    if engines == ['A', 'method']:
        diff = ''.join(difflib.unified_diff(texts['A'].splitlines(True), texts['method'].splitlines(True),
                                            fromfile='A.txt', tofile='method.txt'))
        (output / 'compare.diff').write_text(diff)
    save_json(output / 'status.json', dict(complete=True, inspection_only=True))
    print(f'运行输出、完整快照、可读字节码和差异：{output}')
    return 0


if __name__ == '__main__':
    try:
        sys.exit(main())
    except (RuntimeError, OSError, ValueError) as exc:
        print(f'字节码查看失败：{exc}', file=sys.stderr)
        sys.exit(1)
