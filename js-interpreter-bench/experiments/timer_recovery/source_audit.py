"""Capture pinned clock source evidence; never download/build an engine."""
from pathlib import Path
import sys
import urllib.request
import base64
import json
import hashlib
HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
sys.path.insert(0, str(ROOT / 'experiments/three_engine_baseline'))
from runtime_setup import save, sha
import cohort

cohort.verify()
locations = {
 'quickjs': (ROOT / 'engines/quickjs-upstream/quickjs-libc.c', [(2129,2172),(4098,4118)]),
 'jsc_shell': (ROOT / 'engines/webkit-fd3406f/Source/JavaScriptCore/jsc.cpp', [(930,950),(3551,3563)]),
 'jsc_clock': (ROOT / 'engines/webkit-fd3406f/Source/WTF/wtf/CurrentTime.cpp', [(293,319)]),
}
report = {}
for name,(path,ranges) in locations.items():
    lines = path.read_text(encoding='utf-8').splitlines()
    excerpt = '\n'.join(f'{i+1}: {lines[i]}' for a,b in ranges for i in range(a-1,b)) + '\n'
    save(HERE / 'source' / (name+'.txt'), excerpt)
    report[name] = {'path': str(path), 'sha256': sha(path), 'ranges': ranges}
attempts=[]
commit='37fb84941c9be9f9914ee50b1ad366f06a1bd764'
for filename in ('src/d8/d8.cc','src/base/platform/time.cc'):
    dest=HERE/'source'/('v8.'+filename.replace('/','_'))
    if dest.exists():
        report[filename]={'source_commit_reference':commit,'sha256':sha(dest),'saved':str(dest)}
        continue
    urls=[f'https://raw.githubusercontent.com/v8/v8/{commit}/{filename}',
          f'https://chromium.googlesource.com/v8/v8/+/{commit}/{filename}?format=TEXT']
    for url in urls:
        try:
            with urllib.request.urlopen(url,timeout=20) as response:
                data=response.read()
            if 'format=TEXT' in url:data=base64.b64decode(data)
            if len(data)<1000:raise ValueError('implausible source length')
            save(dest,data)
            attempts.append({'url':url,'status':'PASS','sha256':sha(dest)})
            report[filename]={'url':url,'source_commit_reference':commit,'sha256':sha(dest),'saved':str(dest),
                              'artifact_exact_commit_proven':False}
            break
        except Exception as e:
            attempts.append({'url':url,'status':'FAIL','error':str(e)})
    else:report[filename]={'status':'UNKNOWN','artifact_exact_commit_proven':False}
save(HERE/'source/audit.json',{'local_sources':report,'download_attempts':attempts,
     'v8_reference_is_not_artifact_commit_proof':True})
print(json.dumps({'source_audit':report,'attempts':attempts},indent=2),flush=True)
