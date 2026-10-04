function __tebSunSpiderWorkload() {
// The Computer Language Shootout
// http://shootout.alioth.debian.org/
// contributed by Isaac Gouy

function partial(n){
    var a1 = a2 = a3 = a4 = a5 = a6 = a7 = a8 = a9 = 0.0;
    var twothirds = 2.0/3.0;
    var alt = -1.0;
    var k2 = k3 = sk = ck = 0.0;
    
    for (var k = 1; k <= n; k++){
        k2 = k*k;
        k3 = k2*k;
        sk = Math.sin(k);
        ck = Math.cos(k);
        alt = -alt;
        
        a1 += Math.pow(twothirds,k-1);
        a2 += Math.pow(k,-0.5);
        a3 += 1.0/(k*(k+1.0));
        a4 += 1.0/(k3 * sk*sk);
        a5 += 1.0/(k3 * ck*ck);
        a6 += 1.0/k;
        a7 += 1.0/k2;
        a8 += alt/k;
        a9 += alt/(2*k -1);
    }
    
    // NOTE: We don't try to validate anything from pow(),  sin() or cos() because those aren't
    // well-specified in ECMAScript.
    return a6 + a7 + a8 + a9;
}

var total = 0;

for (var i = 1024; i <= 16384; i *= 2) {
    total += partial(i);
}

var expected = 60.08994194659945;

if (total != expected) {
    throw "ERROR: bad result: expected " + expected + " but got " + total;
}


return String(total);
}
;(function (__tebWorkload) {
  var __tebConfig = {"case":"math-partial-sums","N":2,"mode":"correctness"};
  var __tebN = __tebConfig.N;
  var __tebIndex, __tebResult, __tebElapsed = null;
  var __tebAllowed = ["60.08994194659945"];
  if (__tebConfig.mode === 'correctness') {
    for (__tebIndex = 0; __tebIndex < __tebN; ++__tebIndex) {
      __tebResult = __tebWorkload();
      if (__tebAllowed.indexOf(__tebResult) < 0)
        throw new Error('checksum mismatch at call ' + __tebIndex + ':' + __tebResult);
    }
  } else {
    // DIAGNOSTIC is a separate, explicitly warmed policy, never mixed into MAIN.
    if (__tebConfig.mode === 'diagnostic') __tebWorkload();
    if (__tebConfig.mode === 'frontend') __TEB_marker('TEB_TIMER_START');
    var __tebStarted = Date.now();
    for (__tebIndex = 0; __tebIndex < __tebN; ++__tebIndex)
      __tebResult = __tebWorkload();
    __tebElapsed = Date.now() - __tebStarted;
    if (__tebConfig.mode === 'frontend') __TEB_marker('TEB_TIMER_STOP');
    if (__tebAllowed.indexOf(__tebResult) < 0) throw new Error('checksum mismatch');
  }
  if (__tebElapsed !== null && (!Number.isInteger(__tebElapsed) || __tebElapsed < 0))
    throw new Error('invalid timer interval');
  console.log('TEB_RESULT:' + JSON.stringify({
    benchmark: 'SunSpider', case: __tebConfig.case, mode: __tebConfig.mode,
    N: __tebN, checksum: __tebResult, correctness: 'PASS',
    timer: 'Date.now', elapsed_ms: __tebElapsed,
    elapsed_per_call_ms: __tebElapsed === null ? null : __tebElapsed / __tebN,
    warmup_calls: __tebConfig.mode === 'diagnostic' ? 1 : 0
  }));
})(__tebSunSpiderWorkload);
