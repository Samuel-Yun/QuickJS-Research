import hashlib,json,tarfile,urllib.request
from pathlib import Path
HERE=Path(__file__).resolve().parent;dest=HERE/'external';dest.mkdir(exist_ok=True)
ITEMS=[('acorn','8.14.1','e9ca7f9939683a07d74565636ab8cc29f5fbc886a3e7a54af22c2f9e0f59930f',['dist/acorn.js']),('lodash','4.17.21','6a087ac9e5702a0c9d60fbcd48696012646ec8df1491dea472b150e79fcaf804',['lodash.js']),('markdown-it','14.1.0','7c4fab4d4d39fe98206a7fbbed4b1e3578f2b70b6b69d309413e33eec140e19f',['dist/markdown-it.js','README.md'])]
rows=[]
for name,version,expected,members in ITEMS:
 url=f'https://registry.npmjs.org/{name}/-/{name}-{version}.tgz';p=dest/f'{name}-{version}.tgz'
 if not p.exists():p.write_bytes(urllib.request.urlopen(url,timeout=45).read())
 actual=hashlib.sha256(p.read_bytes()).hexdigest();assert actual==expected,(name,actual)
 files={}
 with tarfile.open(p)as tf:
  for m in members:
   data=tf.extractfile('package/'+m).read();out=dest/(name+'-'+version)/m;out.parent.mkdir(parents=True,exist_ok=True);out.write_bytes(data);files[m]=dict(bytes=len(data),sha256=hashlib.sha256(data).hexdigest())
 rows.append(dict(package=name,version=version,url=url,tarball_sha256=actual,files=files));print('VERIFIED',name,version,flush=True)
(dest/'manifest.json').write_text(json.dumps(rows,indent=2)+'\n')
