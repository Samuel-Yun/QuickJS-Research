"""Read the frozen upstream archive, without touching historic files."""
import sys,tarfile
from pathlib import Path
H=Path(__file__).resolve().parent
with tarfile.open(H.parents[1]/'legacy_ng_ic_slotfix/attempt01/recovery/sources/base.tar.gz') as t:
    name=sys.argv[1] if len(sys.argv)>1 else 'quickjs.c'
    s=t.extractfile(name).read().decode().splitlines()
    for arg in sys.argv[2:]:
        if ':' in arg:
            a,b=map(int,arg.split(':'));print('\n'.join(f'{i+1}: {s[i]}' for i in range(a-1,b)))
        else:print('\n'.join(f'{i+1}: {l}' for i,l in enumerate(s) if arg in l))
