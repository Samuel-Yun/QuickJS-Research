"""Copy the pinned M source and apply only the restricted H capability."""
import difflib
import shutil
from run import HERE, STORE, capture, one, read, save, sha, stamp, verify


def main():
    src, expected = verify()
    assert read(HERE/'analysis/audit.json')['status'] == 'ADMITTED_CONTINUE_H'
    dst = STORE/'H'
    assert not dst.exists()
    for name in expected:
        target = dst/name
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(src/name, target)
    changed = ['read_ic_types.h','read_ic_opcodes.inc','read_ic_runtime.inc','quickjs.c']
    for name in changed[:3]:
        shutil.copy2(HERE/'implementation'/name, dst/name)
    p = dst/'quickjs.c'
    s = p.read_text()
    s = one(s, '                    mark_func(rt, &b->read_ic_sites[ri].shape->header);',
            '                    mark_func(rt, &b->read_ic_sites[ri].shape->header);\n                if (b->read_ic_sites[ri].holder_shape)\n                    mark_func(rt, &b->read_ic_sites[ri].holder_shape->header);')
    p.write_text(s)
    patch = ''.join(''.join(difflib.unified_diff((src/name).read_text().splitlines(True), (dst/name).read_text().splitlines(True), fromfile='a/'+name, tofile='b/'+name)) for name in changed)
    save(HERE/'patches/M_to_H.patch', patch)
    actual_changed = [name for name in expected if sha(src/name) != sha(dst/name)]
    assert sorted(actual_changed) == sorted(changed), actual_changed
    r = capture('build_H_release', ['make','-j2','qjs','qjsc'], dst)
    assert r['exit_code'] == 0
    save(HERE/'H_manifest.json', dict(timestamp=stamp(), source=str(dst), binary=str(dst/'qjs'),
         sha256=sha(dst/'qjs'), qjsc_sha256=sha(dst/'qjsc'), source_files={name:sha(dst/name) for name in expected},
         changed_source_files=actual_changed, patch_sha256=sha(HERE/'patches/M_to_H.patch'),
         compiler='GCC 13.3.0', flags='-O2 -g -fwrapv; unchanged M Makefile',
         LTO=False, PGO=False, NDEBUG=False, diagnostic=False))
    verify()
    print('H_RELEASE_READY', flush=True)


if __name__ == '__main__':
    main()
