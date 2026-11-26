// Same readX scaffold as earlier experiments. Input setup is outside timing.
function readX(o){return o.x;}
function run(sequence,n){var sum=0;for(var i=0;i<n;i++)sum+=readX(sequence[i&3]);return sum;}
var mode=scriptArgs[1]||'same_slot';
var n=scriptArgs.length>2?+scriptArgs[2]:1048576;
var a={x:3,a:0},b,sequence,expected;
if(mode==='stable'){sequence=[a,a,a,a];expected=3*n;}
else if(mode==='same_slot'){b={x:5,b:0};sequence=[a,b,a,b];expected=4*n;}
else if(mode==='different_slot'){b={pad:99,x:5};sequence=[a,b,a,b];expected=4*n;}
else if(mode==='multi'){
    sequence=[a,{pad:99,x:5},{p0:11,p1:12,x:7},{p0:21,p1:22,p2:23,x:9}];expected=6*n;
}else throw Error('mode');
if(n<4 || n%4)throw Error('N must be a positive multiple of 4');
var start=performance.now();var checksum=run(sequence,n);var elapsed=performance.now()-start;
if(checksum!==expected)throw Error('checksum '+checksum+' expected '+expected);
print(JSON.stringify({case:mode,iterations:n,checksum:checksum,elapsed_ms:elapsed,warmup_calls:0}));
