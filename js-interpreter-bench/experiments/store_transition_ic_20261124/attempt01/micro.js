/* Input setup is outside timing; same file, N and result checks in both VMs. */
var mode = scriptArgs[1] || 'plain';
var N = +(scriptArgs[2] || 65536);
function writeX(o, x) { o.x = x; }
function Calc(x) { this.pad = 1; this.x = x + 1; }
Calc.prototype = Object.create(null);
function makeFull() { return {a:0,b:0,c:0,d:0}; }
function run(n) {
    var sum=0, o;
    for (var i=0;i<n;i++) {
        if (mode === 'plus_one') { o=new Calc(3); sum+=o.x; }
        else {
            if (mode === 'overwrite') o={x:1,pad:0};
            else if (mode === 'resize') o=makeFull();
            else if (mode === 'alternate' && (i&1)) o={other:0};
            else {o=Object.create(null);o.pad=1;}
            writeX(o,3); sum+=o.x;
        }
    }
    return sum;
}
var t=performance.now(); var result=run(N);var ms=performance.now()-t;
if(result!==N*(mode==='plus_one'?4:3))throw Error('checksum '+result);
print(JSON.stringify({case:mode,iterations:N,checksum:result,elapsed_ms:ms}));
