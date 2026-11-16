function __tebSunSpiderWorkload() {
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
;(function (__tebWorkload) {
  var __tebConfig = {"case":"controlflow-recursive","N":8,"phase":"measure"}, __tebN = __tebConfig.N;
  var __tebIndex, __tebResult, __tebElapsed = null, __tebStarted = null, __tebStopped = null;
  var __tebAllowed = ["57775"];
  if (__tebConfig.phase === 'correctness') {
    for (__tebIndex = 0; __tebIndex < __tebN; ++__tebIndex) {
      __tebResult = __tebWorkload();
      if (__tebAllowed.indexOf(__tebResult) < 0)
        throw new Error('checksum mismatch at call ' + __tebIndex + ':' + __tebResult);
    }
  } else {
    __tebStarted = benchNow();
    for (__tebIndex = 0; __tebIndex < __tebN; ++__tebIndex)
      __tebResult = __tebWorkload();
    __tebStopped = benchNow();
    __tebElapsed = __tebStopped - __tebStarted;
    if (__tebAllowed.indexOf(__tebResult) < 0) throw new Error('checksum mismatch');
  }
  if (__tebElapsed !== null && (!Number.isFinite(__tebElapsed) || __tebElapsed < 0))
    throw new Error('invalid monotonic interval');
  console.log('TEB_RESULT:' + JSON.stringify({
    benchmark: 'SunSpider', case: __tebConfig.case, mode: 'MAIN_MONOTONIC_V1',
    phase: __tebConfig.phase, N: __tebN, checksum: __tebResult, correctness: 'PASS',
    timer: 'benchNow', start_ms: __tebStarted, stop_ms: __tebStopped, elapsed_ms: __tebElapsed,
    elapsed_per_call_ms: __tebElapsed === null ? null : __tebElapsed / __tebN, warmup_calls: 0
  }));
})(__tebSunSpiderWorkload);
