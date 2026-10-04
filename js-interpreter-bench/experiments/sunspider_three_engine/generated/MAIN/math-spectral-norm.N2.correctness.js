function __tebSunSpiderWorkload() {
// The Great Computer Language Shootout
// http://shootout.alioth.debian.org/
//
// contributed by Ian Osgood

function A(i,j) {
  return 1/((i+j)*(i+j+1)/2+i+1);
}

function Au(u,v) {
  for (var i=0; i<u.length; ++i) {
    var t = 0;
    for (var j=0; j<u.length; ++j)
      t += A(i,j) * u[j];
    v[i] = t;
  }
}

function Atu(u,v) {
  for (var i=0; i<u.length; ++i) {
    var t = 0;
    for (var j=0; j<u.length; ++j)
      t += A(j,i) * u[j];
    v[i] = t;
  }
}

function AtAu(u,v,w) {
  Au(u,w);
  Atu(w,v);
}

function spectralnorm(n) {
  var i, u=[], v=[], w=[], vv=0, vBv=0;
  for (i=0; i<n; ++i) {
    u[i] = 1; v[i] = w[i] = 0;
  }
  for (i=0; i<10; ++i) {
    AtAu(u,v,w);
    AtAu(v,u,w);
  }
  for (i=0; i<n; ++i) {
    vBv += u[i]*v[i];
    vv  += v[i]*v[i];
  }
  return Math.sqrt(vBv/vv);
}

var total = 0;

for (var i = 6; i <= 48; i *= 2) {
    total += spectralnorm(i);
}

var expected = 5.086694231303284;

if (total != expected)
    throw "ERROR: bad result: expected " + expected + " but got " + total;


return String(total);
}
;(function (__tebWorkload) {
  var __tebConfig = {"case":"math-spectral-norm","N":2,"mode":"correctness"};
  var __tebN = __tebConfig.N;
  var __tebIndex, __tebResult, __tebElapsed = null;
  var __tebAllowed = ["5.086694231303284"];
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
