function workload() {
// The Computer Language Shootout
// http://shootout.alioth.debian.org/
// contributed by Isaac Gouy

function ack(m,n){
   if (m==0) { return n+1; }
   if (n==0) { return ack(m-1,1); }
   return ack(m-1, ack(m,n-1) );
}

function fib(n) {
    if (n < 2){ return 1; }
    return fib(n-2) + fib(n-1);
}

function tak(x,y,z) {
    if (y >= x) return z;
    return tak(tak(x-1,y,z), tak(y-1,z,x), tak(z-1,x,y));
}

var result = 0;

for ( var i = 3; i <= 5; i++ ) {
    result += ack(3,i);
    result += fib(17.0+i);
    result += tak(3*i+3,2*i+2,i+1);
}

var expected = 57775;
if (result != expected)
    throw "ERROR: bad result: expected " + expected + " but got " + result;


return String(result);
}
var lastResult;
var timerStart = Date.now();
for (var repeatIndex = 0; repeatIndex < 4; ++repeatIndex) lastResult = workload();
var elapsedMs = Date.now() - timerStart;
var allowedChecksums = ["57775"];
if (allowedChecksums.indexOf(lastResult) < 0) throw Error('checksum mismatch: ' + lastResult);
if (!Number.isInteger(elapsedMs) || elapsedMs < 0) throw Error('invalid elapsed time');
console.log('IM_EXEC:' + JSON.stringify({test:"controlflow-recursive",n:4,elapsed_ms:elapsedMs,checksum:lastResult}));
