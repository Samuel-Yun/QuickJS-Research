function workload() {
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
var lastResult;
var timerStart = Date.now();
for (var repeatIndex = 0; repeatIndex < 64; ++repeatIndex) lastResult = workload();
var elapsedMs = Date.now() - timerStart;
var allowedChecksums = ["-1286749544853"];
if (allowedChecksums.indexOf(lastResult) < 0) throw Error('checksum mismatch: ' + lastResult);
if (!Number.isInteger(elapsedMs) || elapsedMs < 0) throw Error('invalid elapsed time');
console.log('IM_EXEC:' + JSON.stringify({test:"bitops-nsieve-bits",n:64,elapsed_ms:elapsedMs,checksum:lastResult}));
