"""Independent correctness/instrumentation builds; never used for timing."""
import concurrent.futures
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess

HERE = Path(__file__).resolve().parent
WORK = HERE / 'work/GUARDED_OFFSET'


def capture(command, cwd, name, env=None):
    result = subprocess.run(list(map(str, command)), cwd=cwd, env=env,
                            capture_output=True, text=True, timeout=300)
    row = dict(command=list(map(str, command)), cwd=str(cwd), returncode=result.returncode,
               stdout=result.stdout, stderr=result.stderr)
    (HERE / (name + '.json')).write_text(json.dumps(row, indent=2) + '\n')
    assert result.returncode == 0, name
    return row


def build(kind):
    dest = HERE / kind
    shutil.copytree(WORK, dest, ignore=shutil.ignore_patterns('.obj', 'qjs', 'qjsc'))
    if kind == 'diagnostic':
        target = dest / 'read_ic_runtime.inc'
        target.write_text('#define RDI_OFFSET_DIAGNOSTIC 1\n' + target.read_text())
        flags = []
    else:
        flags = ['CONFIG_ASAN=y', 'CONFIG_UBSAN=y']
    capture(['make', '-j2', '-o', 'repl.c', *flags, 'qjs'], dest, kind + '.build')
    return dest


def main():
    with concurrent.futures.ThreadPoolExecutor(max_workers=2) as pool:
        builds = list(pool.map(build, ['diagnostic', 'sanitizer']))
    diagnostic, sanitizer = builds
    env = dict(os.environ, ASAN_OPTIONS='detect_leaks=0:abort_on_error=1',
               UBSAN_OPTIONS='halt_on_error=1:print_stacktrace=1')
    tests = {}
    for label, binary, local_env in [
        ('release', WORK / 'qjs', None),
        ('diagnostic', diagnostic / 'qjs', None),
        ('sanitizer', sanitizer / 'qjs', env),
    ]:
        row = capture([binary, HERE / 'safety.js'], HERE, label + '.safety', local_env)
        assert row['stdout'].strip() == 'SAFETY_PASS 194'
        if label != 'diagnostic':
            assert not row['stderr']
        tests[label] = row
    sample = HERE / 'math_probe.js'
    sample.write_text('var sum=0; for(var i=0;i<16;++i)sum+=Math.sqrt(4); if(sum!==32)throw Error(sum); print(sum);\n')
    row = capture([diagnostic / 'qjs', sample], HERE, 'math_probe')
    prefix = 'OFFSET_COUNTS:'
    counts = [json.loads(line[len(prefix):]) for line in row['stderr'].splitlines() if line.startswith(prefix)]
    assert counts == [dict(fills=1, hits=14, rejects=0)], counts
    tests['math_probe'] = counts[0]
    tests['status'] = 'PASS'
    tests['sanitizer_leak_detection'] = False
    tests['sanitizer_scope'] = 'targeted mutation/receiver/read-store tests, not all Octane or test262'
    tests['release_elf_sha256'] = hashlib.sha256((WORK / 'qjs').read_bytes()).hexdigest()
    (HERE / 'qualification.json').write_text(json.dumps(tests, indent=2) + '\n')
    print('QUALIFICATION_PASS', counts, flush=True)


if __name__ == '__main__':
    main()
