// Native clock captured before benchmark loading; identical across conditions.
;(function(){
  var object=performance, method=performance.now;
  if(typeof method!=="function")throw Error("native performance.now missing");
  Object.defineProperty(globalThis,"__icSwitchNow",{value:method.bind(object)});
})();
function m1Read(obj) {
  var sum=0;
  for(var i=0;i<4096;i++) sum+=obj.x;
  return sum;
}
var microObject={x:3};
function microRun(){return m1Read(microObject);}
function microValidate(result){if(result!==12288)throw Error('M1 expected 12288');}

;(function(){
  var count=2,last,checksum=0;var run=microRun;
  var now=__icSwitchNow;
  var start=now();
  for(var iteration=0;iteration<count;iteration++){last=run();checksum+=last;}
  var stop=now();
  microValidate(last);if(checksum!==count*12288)throw Error("checksum");
  console.log("IC_SWITCH_RESULT:"+JSON.stringify({case:"own_integer",N:count,mode:"USE_IC_CONFIGURATION_FIRST_CALL_INCLUSIVE_V1",
    start_ms:start,stop_ms:stop,elapsed_ms:stop-start,elapsed_per_Run_ms:(stop-start)/count,
    checksum:checksum,correctness:"PASS",warmup_calls:0}));
})();
