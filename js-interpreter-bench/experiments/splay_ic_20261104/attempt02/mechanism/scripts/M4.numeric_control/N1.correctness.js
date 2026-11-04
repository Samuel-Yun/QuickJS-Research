// Captured before workload/base.js. Linux upstream performance.now -> CLOCK_MONOTONIC.
;(function () {
  var __clockObject = performance, __clockFunction = performance.now;
  if (typeof __clockFunction !== 'function') throw new Error('native clock missing');
  Object.defineProperty(globalThis, 'benchNow', {value: function () {
    return __clockFunction.call(__clockObject);
  }, writable: false, configurable: false});
})();

;
function m4Loop(limit) {
  var sum=0;
  for(var i=0;i<limit;i++)sum+=i;
  return sum;
}
function microRun(){return m4Loop(4096);}
function microValidate(result){if(result!==8386560)throw Error('M4 expected 8386560');}

;
;(function(){var config={"case": "M4.numeric_control", "N": 1, "phase": "correctness"},last,checksum=0;
var start=benchNow();for(var k=0;k<config.N;k++){last=microRun();checksum+=last;}var stop=benchNow();
microValidate(last);if(checksum!==config.N*8386560)throw Error('checksum');
console.log('MICRO_RESULT:'+JSON.stringify({case:config.case,N:config.N,checksum:checksum,last:last,
mode:'FIRST_CALL_INCLUSIVE_MICRO_V1',phase:config.phase,correctness:'PASS',warmup_calls:0,start_ms:start,stop_ms:stop,elapsed_ms:stop-start}));})();