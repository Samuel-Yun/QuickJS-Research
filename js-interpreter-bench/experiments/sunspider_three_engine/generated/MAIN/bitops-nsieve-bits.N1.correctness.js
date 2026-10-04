function __tebSunSpiderWorkload() {
// The Great Computer Language Shootout
//  http://shootout.alioth.debian.org
//
//  Contributed by Ian Osgood

function pad(n,width) {
  var s = n.toString();
  while (s.length < width) s = ' ' + s;
  return s;
}

function primes(isPrime, n) {
  var i, count = 0, m = 10000<<n, size = m+31>>5;

  for (i=0; i<size; i++) isPrime[i] = 0xffffffff;

  for (i=2; i<m; i++)
    if (isPrime[i>>5] & 1<<(i&31)) {
      for (var j=i+i; j<m; j+=i)
        isPrime[j>>5] &= ~(1<<(j&31));
      count++;
    }
}

function sieve() {
    for (var i = 4; i <= 4; i++) {
        var isPrime = new Array((10000<<i)+31>>5);
        primes(isPrime, i);
    }
    return isPrime;
}

var result = sieve();

var sum = 0;
for (var i = 0; i < result.length; ++i)
    sum += result[i];

var expected = -1286749544853;
if (sum != expected)
    throw "ERROR: bad result: expected " + expected + " but got " + sum;


return String(sum);
}
;(function (__tebWorkload) {
  var __tebConfig = {"case":"bitops-nsieve-bits","N":1,"mode":"correctness"};
  var __tebN = __tebConfig.N;
  var __tebIndex, __tebResult, __tebElapsed = null;
  var __tebAllowed = ["-1286749544853"];
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
