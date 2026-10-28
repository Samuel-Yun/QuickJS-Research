// Captured before workload/base.js. Linux upstream performance.now -> CLOCK_MONOTONIC.
;(function () {
  var __clockObject = performance, __clockFunction = performance.now;
  if (typeof __clockFunction !== 'function') throw new Error('native clock missing');
  Object.defineProperty(globalThis, 'benchNow', {value: function () {
    return __clockFunction.call(__clockObject);
  }, writable: false, configurable: false});
})();

;
var CASE_KIND="own";
function step(x) {
    return x + 1;
}

function methodLoop(obj) {
    var sum = 0;
    for (var i = 0; i < 4096; i++) {
        sum += obj.step(i);
    }
    return sum;
}

var sharedProto = { step: step };
var microObject;
if (CASE_KIND === "own") {
    microObject = { step: step };
} else {
    microObject = Object.create(sharedProto);
}

function microRun() {
    return methodLoop(microObject);
}

function microValidate(result) {
    if (result !== 8390656) throw Error("expected 8390656");
}

;
;(function(){
 var count=16384,last,checksum=0,start=null,stop=null;
 if(false){for(var j=0;j<count;j++){last=microRun();microValidate(last);checksum+=last;}}
 else{start=benchNow();for(var j=0;j<count;j++){last=microRun();checksum+=last;}stop=benchNow();microValidate(last);}
 if(!Number.isFinite(checksum)||checksum!==count*8390656)throw Error('checksum');
 console.log('TEB_RESULT:'+JSON.stringify({case:"own_method_control",N:count,mode:"INHERITED_METHOD_FIRST_CALL_INCLUSIVE_V1",phase:"measure",
 correctness:'PASS',checksum:checksum,last:last,start_ms:start,stop_ms:stop,elapsed_ms:start===null?null:stop-start,
 warmup_calls:0,inner_iterations:4096,first_Run_included:true}));
})();
