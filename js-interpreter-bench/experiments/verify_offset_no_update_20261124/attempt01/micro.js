// Reuses the read_shape_miss scaffold: sequence setup excluded, run() timed.
function readX(o) { return o.x; }
// Arg1 is deliberately not a borrowed arg0/loc0 load.
function readPlain(unused, o) { return o.x; }
function run(sequence,n,plain) {
    var sum=0;
    if(plain) {
        for(var i=0;i<n;i++)sum+=readPlain(0,sequence[i&1]);
    } else {
        for(var i=0;i<n;i++)sum+=readX(sequence[i&1]);
    }
    return sum;
}
var mode=scriptArgs[1] || 'same_slot';
var n=scriptArgs.length>2?+scriptArgs[2]:1048576;
var plain=scriptArgs[3]==='plain';
var a={x:3,a:0};
var b=mode==='different_slot'?{pad:99,x:5}:{x:5,b:0};
var sequence=mode==='stable'?[a,a]:[a,b];
var start=Date.now();
var checksum=run(sequence,n,plain);
var elapsed=Date.now()-start;
var expected=mode==='stable'?3*n:3*Math.ceil(n/2)+5*Math.floor(n/2);
if(checksum!==expected)throw Error('checksum: '+checksum+' expected '+expected);
print(JSON.stringify({case:mode,plain:plain,iterations:n,checksum:checksum,elapsed_ms:elapsed}));
