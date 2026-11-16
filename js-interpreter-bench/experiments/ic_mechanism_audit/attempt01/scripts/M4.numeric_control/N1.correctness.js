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
;(function(){
 var count=1,last,checksum=0,start=null,stop=null;
 if(true){for(var j=0;j<count;j++){last=microRun();microValidate(last);checksum+=last;}}
 else{start=benchNow();for(var j=0;j<count;j++){last=microRun();checksum+=last;}stop=benchNow();microValidate(last);}
 if(!Number.isFinite(checksum)||checksum!==count*8386560)throw Error('checksum');
 console.log('TEB_RESULT:'+JSON.stringify({case:"M4.numeric_control",N:count,mode:"IC_MECHANISM_AUDIT_FIRST_CALL_INCLUSIVE_V1",phase:"correctness",
 correctness:'PASS',checksum:checksum,last:last,start_ms:start,stop_ms:stop,elapsed_ms:start===null?null:stop-start,
 warmup_calls:0,inner_iterations:4096,first_Run_included:true}));
})();
