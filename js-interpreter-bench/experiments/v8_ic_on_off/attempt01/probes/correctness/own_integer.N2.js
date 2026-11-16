// Captured before benchmark loading. No engine-dependent target branch.
;(function () {
  var clockObject=performance, clockFunction=performance.now;
  if(typeof clockFunction!=="function")throw Error("native performance.now missing");
  Object.defineProperty(globalThis,"__icNow",{value:clockFunction.bind(clockObject)});
})();
function m1Read(obj) {
  var sum=0;
  for(var i=0;i<4096;i++) sum+=obj.x;
  return sum;
}
var microObject={x:3};
function microRun(){return m1Read(microObject);}
function microValidate(result){if(result!==12288)throw Error('M1 expected 12288');}

;(function(){var count=2,last,checksum=0;var run=microRun;
 for(var i=0;i<count;i++){last=run();checksum+=last;microValidate(last);}
 microValidate(last);if(checksum!==count*12288)throw Error("checksum");
 console.log("CORRECTNESS:"+JSON.stringify({case:"own_integer",N:count,correctness:"PASS",checksum:checksum,warmup_calls:0,timing_sample:false}));
})();
