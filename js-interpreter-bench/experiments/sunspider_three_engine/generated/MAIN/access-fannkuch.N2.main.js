function __tebSunSpiderWorkload() {
/* The Great Computer Language Shootout
   http://shootout.alioth.debian.org/
   contributed by Isaac Gouy */

function fannkuch(n) {
   var check = 0;
   var perm = Array(n);
   var perm1 = Array(n);
   var count = Array(n);
   var maxPerm = Array(n);
   var maxFlipsCount = 0;
   var m = n - 1;

   for (var i = 0; i < n; i++) perm1[i] = i;
   var r = n;

   while (true) {
      // write-out the first 30 permutations
      if (check < 30){
         var s = "";
         for(var i=0; i<n; i++) s += (perm1[i]+1).toString();
         check++;
      }

      while (r != 1) { count[r - 1] = r; r--; }
      if (!(perm1[0] == 0 || perm1[m] == m)) {
         for (var i = 0; i < n; i++) perm[i] = perm1[i];

         var flipsCount = 0;
         var k;

         while (!((k = perm[0]) == 0)) {
            var k2 = (k + 1) >> 1;
            for (var i = 0; i < k2; i++) {
               var temp = perm[i]; perm[i] = perm[k - i]; perm[k - i] = temp;
            }
            flipsCount++;
         }

         if (flipsCount > maxFlipsCount) {
            maxFlipsCount = flipsCount;
            for (var i = 0; i < n; i++) maxPerm[i] = perm1[i];
         }
      }

      while (true) {
         if (r == n) return maxFlipsCount;
         var perm0 = perm1[0];
         var i = 0;
         while (i < r) {
            var j = i + 1;
            perm1[i] = perm1[j];
            i = j;
         }
         perm1[r] = perm0;

         count[r] = count[r] - 1;
         if (count[r] > 0) break;
         r++;
      }
   }
}

var n = 8;
var ret = fannkuch(n);

var expected = 22;
if (ret != expected)
    throw "ERROR: bad result: expected " + expected + " but got " + ret;


return String(ret);
}
;(function (__tebWorkload) {
  var __tebConfig = {"case":"access-fannkuch","N":2,"mode":"main"};
  var __tebN = __tebConfig.N;
  var __tebIndex, __tebResult, __tebElapsed = null;
  var __tebAllowed = ["22"];
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
