function __tebSunSpiderWorkload() {
// Copyright (c) 2004 by Arthur Langereis (arthur_ext at domain xfinitegames, tld com)


var result = 0;

// 1 op = 2 assigns, 16 compare/branches, 8 ANDs, (0-8) ADDs, 8 SHLs
// O(n)
function bitsinbyte(b) {
var m = 1, c = 0;
while(m<0x100) {
if(b & m) c++;
m <<= 1;
}
return c;
}

function TimeFunc(func) {
var x, y, t;
var sum = 0;
for(var x=0; x<350; x++)
for(var y=0; y<256; y++) sum += func(y);
return sum;
}

result = TimeFunc(bitsinbyte);

var expected = 358400;
if (result != expected)
    throw "ERROR: bad result: expected " + expected + " but got " + result;


return String(result);
}
;(function (__tebWorkload) {
  var __tebConfig = {"case":"bitops-bits-in-byte","N":2,"mode":"correctness"};
  var __tebN = __tebConfig.N;
  var __tebIndex, __tebResult, __tebElapsed = null;
  var __tebAllowed = ["358400"];
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
