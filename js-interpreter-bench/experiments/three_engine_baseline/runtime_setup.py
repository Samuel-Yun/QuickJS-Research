#!/usr/bin/env python3
"""Prepare pinned Linux runtimes in the authorized WSL cohort; no benchmarks."""
from __future__ import annotations

import argparse
from datetime import datetime, timezone
import hashlib
import json
import os
from pathlib import Path
import platform
import shutil
import subprocess
import tarfile
import zipfile

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
STORE = Path('/home/mzyx/three_engine_20261004')
QJS_COMMIT = '04be246001599f5995fa2f2d8c91a0f198d3f34c'
JSC_COMMIT = 'fd3406f133a4e56d7aaf399ba5611ae44b8da7e9'
JSC = Path('/home/mzyx/jsc_build_fd3406f/JSCOnly/Release/bin/jsc')
JSC_LIB = JSC.parent.parent / 'lib/libJavaScriptCore.so.1.0.0'
V8_URL = 'https://storage.googleapis.com/chromium-v8/official/canary/v8-linux64-rel-15.6.21.zip'
V8_ARCHIVE = ROOT / 'engines/v8-official-linux64-15.6.21/v8-linux64-rel-15.6.21.zip'

def sha(path):
    h = hashlib.sha256()
    with Path(path).open('rb') as f:
        for block in iter(lambda: f.read(1024 * 1024), b''):
            h.update(block)
    return h.hexdigest()

def save(path, value):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    if not isinstance(value, (str, bytes)):
        value = json.dumps(value, indent=2, ensure_ascii=False) + '\n'
    data = value.encode('utf-8') if isinstance(value, str) else value
    if path.exists():
        if path.read_bytes() != data:
            raise RuntimeError('refuse to overwrite evidence: ' + str(path))
    else:
        with path.open('xb') as f:
            f.write(data)

def capture(cmd, cwd=None, timeout=120):
    p = subprocess.run(cmd, cwd=cwd, capture_output=True, text=True,
                       errors='replace', timeout=timeout, check=False)
    return {'command': cmd, 'cwd': str(cwd or ROOT), 'exit_code': p.returncode,
            'stdout': p.stdout, 'stderr': p.stderr}

def preservation():
    paths = [ROOT / 'README.md', ROOT / 'baseline_manifest.md']
    for directory in ('notes', 'scripts', 'results', 'experiments/interpreter_mode_execution',
                      'experiments/octane', 'experiments/octane_strict', 'experiments/jsc_baseline'):
        paths.extend(p for p in (ROOT / directory).rglob('*')
                     if p.is_file() and '__pycache__' not in p.parts)
    paths.extend([ROOT / 'engines/quickjs-upstream/qjs.exe',
                  *[p for p in (ROOT / 'engines/v8-official-15.6.21/runtime').iterdir() if p.is_file()]])
    return {str(p.relative_to(ROOT)): sha(p) for p in sorted(set(paths))}

def protect():
    path = HERE / 'preservation_before.json'
    current = preservation()
    if path.exists():
        if json.loads(path.read_text()) != current:
            raise RuntimeError('old baseline/raw/summary changed since preparation started')
    else:
        save(path, current)

def artifact(path):
    p = Path(path).resolve()
    return {'path': str(p), 'sha256': sha(p), 'size_bytes': p.stat().st_size}

def quickjs():
    protect()
    source = STORE / ('quickjs-' + QJS_COMMIT)
    archive = HERE / 'quickjs-04be246-source.tar'
    if not source.exists():
        source.mkdir(parents=True)
        with tarfile.open(archive) as f:
            f.extractall(source, filter='data')
    if (source / 'VERSION').read_text().strip() != '2026-06-04':
        raise RuntimeError('QuickJS source version mismatch')
    log = HERE / 'runtime/quickjs_build.log'
    if not (source / 'qjs').exists():
        p = capture(['make', '-j2', 'qjs', 'qjsc'], source, 600)
        save(log, p['stdout'] + p['stderr'])
        save(HERE / 'runtime/quickjs_build_command.json', {k: v for k, v in p.items() if k not in ('stdout', 'stderr')})
        if p['exit_code']:
            raise RuntimeError('QuickJS build failed; preserved log')
    version = capture([str(source / 'qjs'), '--help'])
    save(HERE / 'runtime/quickjs_help.json', version)
    save(HERE / 'runtime/quickjs_source.json', {
        'repository': 'https://github.com/bellard/quickjs.git', 'commit': QJS_COMMIT,
        'source_archive': artifact(archive), 'source_path': str(source),
        'source_identity': 'git archive of exact clean existing official checkout; no patch',
        'compiler': capture(['gcc', '--version']), 'compiler_path': shutil.which('gcc'),
        'build_command': ['make', '-j2', 'qjs', 'qjsc'],
        'optimization': '-O2 from upstream Makefile; no LTO/sanitizer/march=native supplied',
        'assertions': 'upstream Makefile defaults; no NDEBUG override',
        'qjs': artifact(source / 'qjs'), 'qjsc': artifact(source / 'qjsc')})
    print('QuickJS Linux optimized build prepared', flush=True)

def finalize():
    protect()
    if platform.system() != 'Linux' or platform.machine() != 'x86_64':
        raise RuntimeError('requires the selected Linux x86_64 cohort')
    if sha(JSC) != '65c824a055405bf62b05e21d54515a72a1f0187a4d91225d00a6da969d35879f' or sha(JSC_LIB) != '2ba4fe56f79c97cafafe065454bd5b5c6c168e536ab00d33d5cc48f65b375f79':
        raise RuntimeError('Phase 1 JSC artifact changed')
    v8 = STORE / 'v8-linux64-rel-15.6.21'
    v8.mkdir(parents=True, exist_ok=True)
    with zipfile.ZipFile(V8_ARCHIVE) as f:
        bad = f.testzip()
        if bad:
            raise RuntimeError('V8 ZIP CRC failure: ' + bad)
        for info in f.infolist():
            target = (v8 / info.filename).resolve()
            if not target.is_relative_to(v8.resolve()):
                raise RuntimeError('unsafe archive path')
        if not (v8 / 'd8').exists():
            f.extractall(v8)
        archive_members = f.namelist()
    (v8 / 'd8').chmod(0o755)
    snapshot = v8 / 'snapshot_blob.bin'
    version = capture([str(v8 / 'd8'), '--snapshot_blob=' + str(snapshot), '--version'])
    save(HERE / 'runtime/v8_version.json', version)
    if version['exit_code'] or 'V8 version 15.6.21' not in version['stdout']:
        raise RuntimeError('wrong or unusable exact V8 artifact')
    qjs = json.loads((HERE / 'runtime/quickjs_source.json').read_text())
    manifest = {
        'schema_version': 1, 'cohort_id': 'wsl2-ubuntu2404-x64-20261004',
        'created_at_utc': datetime.now(timezone.utc).isoformat(),
        'platform_class': 'WSL2', 'distro': 'Ubuntu', 'architecture': 'x86_64',
        'project_root': str(ROOT), 'runtime_store': str(STORE),
        'same_host_os_architecture_required': True,
        'old_windows_data_comparable': False,
        'protocol_exception': 'User authorized a separate same-distro WSL2 cohort on 2026-10-04; old Windows definitions unchanged',
        'engines': {
            'quickjs': {'engine': 'upstream QuickJS', 'shell': 'qjs', 'version': '2026-06-04',
                        'source_repository': qjs['repository'], 'source_commit': QJS_COMMIT,
                        'binary': qjs['qjs'], 'dependencies': [], 'runtime_flags': [],
                        'command_prefix': [qjs['qjs']['path']], 'compiler': qjs['compiler'],
                        'build_mode': 'upstream optimized -O2; debug symbols retained',
                        'build_flags_evidence': 'runtime/quickjs_build.log'},
            'v8': {'engine': 'V8', 'shell': 'd8', 'version': '15.6.21',
                   'binary': artifact(v8 / 'd8'), 'dependencies': [artifact(p) for p in (snapshot, v8 / 'icudtl.dat') if p.exists()],
                   'archive': artifact(V8_ARCHIVE), 'download_url': V8_URL,
                   'binary_source': 'official chromium-v8 canary rel storage; no jsvu wrapper',
                   'archive_members': archive_members, 'source_commit': None,
                   'version_tag_commit_reference': '37fb84941c9be9f9914ee50b1ad366f06a1bd764',
                   'version_tag_is_artifact_commit_proof': False, 'compiler': None, 'full_gn_args': None,
                   'build_mode': 'official rel artifact; metadata file retained if present',
                   'runtime_flags': ['--max-opt=0', '--no-lazy'],
                   'command_prefix': [str(v8 / 'd8'), '--snapshot_blob=' + str(snapshot), '--max-opt=0', '--no-lazy']},
            'jsc': {'engine': 'JavaScriptCore', 'shell': 'jsc', 'version': JSC_COMMIT,
                    'source_repository': 'https://github.com/WebKit/WebKit', 'source_commit': JSC_COMMIT,
                    'binary': artifact(JSC), 'dependencies': [artifact(JSC_LIB)],
                    'compiler': 'GCC/G++ 13.3.0 (Ubuntu 13.3.0-6ubuntu2~24.04.1)',
                    'build_mode': 'JSCOnly Release -O3 -DNDEBUG; ENABLE_C_LOOP=OFF; lightweight _GLIBCXX_ASSERTIONS=1',
                    'build_flags_evidence': '../jsc_baseline/build_configuration.txt',
                    'runtime_flags': ['--useJIT=false', '--useLLInt=true', '--validateOptions=true'],
                    'command_prefix': [str(JSC), '--useJIT=false', '--useLLInt=true', '--validateOptions=true']}
        }
    }
    system_libraries = {}
    for engine, info in manifest['engines'].items():
        result = capture(['ldd', info['binary']['path']])
        save(HERE / ('runtime/' + engine + '_ldd.json'), result)
        libraries = {}
        for line in result['stdout'].splitlines():
            for token in line.split():
                if token.startswith('/') and Path(token).is_file():
                    libraries[token] = artifact(token)
        system_libraries[engine] = list(libraries.values())
        info['dynamic_libraries'] = list(libraries.values())
        save(HERE / ('runtime/' + engine + '_file.json'), capture(['file', info['binary']['path']]))
    metadata = v8 / 'v8_build_config.json'
    if metadata.exists():
        manifest['engines']['v8']['build_metadata'] = json.loads(metadata.read_text())
        manifest['engines']['v8']['build_metadata_artifact'] = artifact(metadata)
    save(HERE / 'manifest.json', manifest)
    cmds = {
        'uname': ['uname', '-a'], 'os': ['cat', '/etc/os-release'],
        'cpu': ['lscpu'], 'memory': ['free', '-b'], 'disk': ['df', '-h', '/home/mzyx'],
        'gcc': ['gcc', '--version'], 'make': ['make', '--version'], 'python': ['python3', '--version'],
        'cmake': ['cmake', '--version'], 'ninja': ['ninja', '--version'],
        'load': ['cat', '/proc/loadavg'], 'processes': ['ps', '-eo', 'comm,pcpu,pmem', '--sort=-pcpu'],
        'frequency_interfaces': ['bash', '-lc', 'for p in /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq; do if test -r "$p"; then cat "$p"; else echo "$p UNKNOWN"; fi; done']}
    environment = {k: capture(cmd) for k, cmd in cmds.items()}
    save(HERE / 'runtime/environment_snapshot.json', environment)
    save(HERE / 'environment.txt', 'Cohort: ' + manifest['cohort_id'] + '\nWSL2 Ubuntu x86_64 on the same Windows host\n'
         + 'This cohort may only compare its three Linux runtimes with each other, never old Windows timings.\n'
         + '\n'.join(k + ':\n' + v['stdout'] + v['stderr'] for k, v in environment.items())
         + '\nCPU temperature, per-sample physical frequency, power limits, scheduler isolation: UNKNOWN.\n'
         + 'Background processes/load are a preparation-time snapshot, not a guarantee for future measurements.\n')
    print('All three exact-version runtimes prepared and manifest frozen', flush=True)

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('stage', choices=['quickjs', 'finalize'])
    args = parser.parse_args()
    if args.stage == 'quickjs': quickjs()
    else: finalize()

if __name__ == '__main__': main()
