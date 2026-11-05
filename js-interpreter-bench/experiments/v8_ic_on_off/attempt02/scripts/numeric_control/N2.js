// Native clock captured before benchmark loading; identical across conditions.
;(function(){
  var object=performance, method=performance.now;
  if(typeof method!=="function")throw Error("native performance.now missing");
  Object.defineProperty(globalThis,"__icSwitchNow",{value:method.bind(object)});
})();
function m4Loop(limit) {
  var sum=0;
  for(var i=0;i<limit;i++)sum+=i;
  return sum;
}
function microRun(){return m4Loop(4096);}
function microValidate(result){if(result!==8386560)throw Error('M4 expected 8386560');}

;(function(){
  var count=2,last,checksum=0;var run=microRun;
  var now=__icSwitchNow;
  var start=now();
  for(var iteration=0;iteration<count;iteration++){last=run();checksum+=last;}
  var stop=now();
  microValidate(last);if(checksum!==count*8386560)throw Error("checksum");
  console.log("IC_SWITCH_RESULT:"+JSON.stringify({case:"numeric_control",N:count,mode:"USE_IC_CONFIGURATION_FIRST_CALL_INCLUSIVE_V1",
    start_ms:start,stop_ms:stop,elapsed_ms:stop-start,elapsed_per_Run_ms:(stop-start)/count,
    checksum:checksum,correctness:"PASS",warmup_calls:0}));
})();
