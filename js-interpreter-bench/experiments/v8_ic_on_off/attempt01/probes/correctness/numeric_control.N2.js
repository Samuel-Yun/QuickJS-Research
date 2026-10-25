// Captured before benchmark loading. No engine-dependent target branch.
;(function () {
  var clockObject=performance, clockFunction=performance.now;
  if(typeof clockFunction!=="function")throw Error("native performance.now missing");
  Object.defineProperty(globalThis,"__icNow",{value:clockFunction.bind(clockObject)});
})();
function m4Loop(limit) {
  var sum=0;
  for(var i=0;i<limit;i++)sum+=i;
  return sum;
}
function microRun(){return m4Loop(4096);}
function microValidate(result){if(result!==8386560)throw Error('M4 expected 8386560');}

;(function(){var count=2,last,checksum=0;var run=microRun;
 for(var i=0;i<count;i++){last=run();checksum+=last;microValidate(last);}
 microValidate(last);if(checksum!==count*8386560)throw Error("checksum");
 console.log("CORRECTNESS:"+JSON.stringify({case:"numeric_control",N:count,correctness:"PASS",checksum:checksum,warmup_calls:0,timing_sample:false}));
})();
