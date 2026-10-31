// Captured before workload/base.js. Linux upstream performance.now -> CLOCK_MONOTONIC.
;(function () {
  var __clockObject = performance, __clockFunction = performance.now;
  if (typeof __clockFunction !== 'function') throw new Error('native clock missing');
  Object.defineProperty(globalThis, 'benchNow', {value: function () {
    return __clockFunction.call(__clockObject);
  }, writable: false, configurable: false});
})();

;
var CASE_KIND="function_value_read";
function step(x) {
    return x + 1;
}

function valueReadLoop(obj, expected) {
    var sum = 0, last;
    for (var i = 0; i < 4096; i++) {
        last = obj.slot;
        sum += i + 1;
    }
    if (last !== expected) throw Error("value identity");
    return sum;
}

function methodCallLoop(obj, expected) {
    var sum = 0;
    for (var i = 0; i < 4096; i++) {
        sum += obj.slot(i);
    }
    return sum;
}

function localCallLoop(obj, expected) {
    var fn = obj.slot, sum = 0;
    for (var i = 0; i < 4096; i++) {
        sum += fn(i);
    }
    return sum;
}

var expectedValue = CASE_KIND === "number_value_read" ? 3 : step;
var microObject = { slot: expectedValue };
var selectedLoop =
    CASE_KIND === "number_value_read" || CASE_KIND === "function_value_read"
        ? valueReadLoop
        : CASE_KIND === "own_method_call" ? methodCallLoop : localCallLoop;

function microRun() {
    return selectedLoop(microObject, expectedValue);
}

// Driver compatibility only; target functions above follow the supplied design.
function microValidate(result) {
    if (result !== 8390656) throw Error("expected 8390656");
}

;
;(function(){
 var count=16384,last,checksum=0,start=null,stop=null;
 if(true){for(var j=0;j<count;j++){last=microRun();microValidate(last);checksum+=last;}}
 else{start=benchNow();for(var j=0;j<count;j++){last=microRun();checksum+=last;}stop=benchNow();microValidate(last);}
 if(!Number.isFinite(checksum)||checksum!==count*8390656)throw Error('checksum');
 console.log('TEB_RESULT:'+JSON.stringify({case:"function_value_read",N:count,mode:"FUNCTION_VALUE_FIRST_CALL_INCLUSIVE_V1",phase:"correctness",
 correctness:'PASS',checksum:checksum,last:last,start_ms:start,stop_ms:stop,elapsed_ms:start===null?null:stop-start,
 warmup_calls:0,inner_iterations:4096,first_Run_included:true}));
})();
