function __tebSunSpiderWorkload() {
// The Great Computer Language Shootout
//  http://shootout.alioth.debian.org
//
//  Contributed by Ian Osgood

var last = 42, A = 3877, C = 29573, M = 139968;

function rand(max) {
  last = (last * A + C) % M;
  return max * last / M;
}

var ALU =
  "GGCCGGGCGCGGTGGCTCACGCCTGTAATCCCAGCACTTTGG" +
  "GAGGCCGAGGCGGGCGGATCACCTGAGGTCAGGAGTTCGAGA" +
  "CCAGCCTGGCCAACATGGTGAAACCCCGTCTCTACTAAAAAT" +
  "ACAAAAATTAGCCGGGCGTGGTGGCGCGCGCCTGTAATCCCA" +
  "GCTACTCGGGAGGCTGAGGCAGGAGAATCGCTTGAACCCGGG" +
  "AGGCGGAGGTTGCAGTGAGCCGAGATCGCGCCACTGCACTCC" +
  "AGCCTGGGCGACAGAGCGAGACTCCGTCTCAAAAA";

var IUB = {
  a:0.27, c:0.12, g:0.12, t:0.27,
  B:0.02, D:0.02, H:0.02, K:0.02,
  M:0.02, N:0.02, R:0.02, S:0.02,
  V:0.02, W:0.02, Y:0.02
}

var HomoSap = {
  a: 0.3029549426680,
  c: 0.1979883004921,
  g: 0.1975473066391,
  t: 0.3015094502008
}

function makeCumulative(table) {
  var last = null;
  for (var c in table) {
    if (last) table[c] += table[last];
    last = c;
  }
}

function fastaRepeat(n, seq) {
  var seqi = 0, lenOut = 60;
  while (n>0) {
    if (n<lenOut) lenOut = n;
    if (seqi + lenOut < seq.length) {
      ret += seq.substring(seqi, seqi+lenOut).length;
      seqi += lenOut;
    } else {
      var s = seq.substring(seqi);
      seqi = lenOut - s.length;
      ret += (s + seq.substring(0, seqi)).length;
    }
    n -= lenOut;
  }
}

function fastaRandom(n, table) {
  var line = new Array(60);
  makeCumulative(table);
  while (n>0) {
    if (n<line.length) line = new Array(n);
    for (var i=0; i<line.length; i++) {
      var r = rand(1);
      for (var c in table) {
        if (r < table[c]) {
          line[i] = c;
          break;
        }
      }
    }
    ret += line.join('').length;
    n -= line.length;
  }
}

var ret = 0;

var count = 7;
fastaRepeat(2*count*100000, ALU);
fastaRandom(3*count*1000, IUB);
fastaRandom(5*count*1000, HomoSap);

var expected = 1456000;

if (ret != expected)
    throw "ERROR: bad result: expected " + expected + " but got " + ret;


return String(ret);
}
;(function (__tebWorkload) {
  var __tebConfig = {"case":"string-fasta","N":16,"phase":"measure"}, __tebN = __tebConfig.N;
  var __tebIndex, __tebResult, __tebElapsed = null, __tebStarted = null, __tebStopped = null;
  var __tebAllowed = ["1456000"];
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
