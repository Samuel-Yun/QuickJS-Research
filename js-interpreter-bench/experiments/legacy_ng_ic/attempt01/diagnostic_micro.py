"""Small mechanism counters only, separate from Octane formal timing."""
import json
import os
from pathlib import Path
from diagnostic import DEST
from build import capture
from prepare_sources import HERE,save

def check(label,source):
    path=HERE/'correctness/micro'/f'{label}.js';save(path,source)
    report=HERE/'raw/diagnostic_micro'/f'{label}.json'
    if report.exists():return
    os.environ['LEGACY_IC_REPORT']=str(report);report.parent.mkdir(parents=True,exist_ok=True)
    r=capture('micro_'+label,[DEST/'qjs',path]);del os.environ['LEGACY_IC_REPORT']
    assert r['exit_code']==0 and 'MICRO_PASS' in r['stdout'] and report.exists()
    data=json.loads(report.read_text());assert data['live_bytes_after_runtime_free']==0
    for d in data['units_detail']:
        for k in ['read','write']:assert d[k+'_queries']==d[k+'_hits']+d[k+'_fallback']

for shapes in [1,2,4,5,8]:
    check('shapes'+str(shapes),f'''
function microRead(o){{return o.x;}}
var objects=[],sum=0,expected=0;
for(var j=0;j<{shapes};j++){{var o={{}};o['extra'+j]=j;o.x=j+1;objects.push(o);}}
for(var i=0;i<8000;i++){{sum+=microRead(objects[i%{shapes}]);expected+=i%{shapes}+1;}}
if(sum!==expected)throw Error('wrong checksum');
console.log('MICRO_PASS '+sum);
''')
check('shared_sites','''
function microShared(a,b){var x=a.x;return x+b.x;}
var a={x:1,z:2},b={z:3,x:4},sum=0;
for(var i=0;i<8000;i++)sum+=microShared(a,b);
if(sum!==40000)throw Error('wrong checksum');
console.log('MICRO_PASS '+sum);
''')
check('many_functions','''
var sum=0,o={x:7};
for(var i=0;i<400;i++){var fn=Function('o','return o.x;');sum+=fn(o);}
if(sum!==2800)throw Error('wrong checksum');console.log('MICRO_PASS '+sum);
''')
check('one_function','''
function microSingle(o){return o.x;}
var sum=0,o={x:7};for(var i=0;i<400;i++)sum+=microSingle(o);
if(sum!==2800)throw Error('wrong checksum');console.log('MICRO_PASS '+sum);
''')
check('shape_change','''
function microChange(o){return o.x;}
var o={x:1,y:2};for(var i=0;i<100;i++)if(microChange(o)!==1)throw Error('initial');
delete o.x;o.x=8;for(var i=0;i<100;i++)if(microChange(o)!==8)throw Error('changed');
Object.defineProperty(o,'x',{get:function(){return 19;}});
for(var i=0;i<100;i++)if(microChange(o)!==19)throw Error('getter');
console.log('MICRO_PASS');
''')
print('MICRO_DIAGNOSTICS_PASS',flush=True)
