// Native monotonic clock captured before preload/base/workload, common to qjs/d8.
;(function(){
  var object=performance, method=performance.now;
  if(typeof method!=="function")throw Error("native performance.now missing");
  Object.defineProperty(globalThis,"__icoNow",{value:method.bind(object)});
})();

var begin=__icoNow(),last=begin,changes=0,min=Infinity;for(var i=0;i<50000;i++){var now=__icoNow();if(now<last)throw Error("nonmonotonic");if(now>last){changes++;min=Math.min(min,now-last);}last=now;}console.log("CLOCK:"+JSON.stringify({begin:begin,end:last,elapsed:last-begin,changes:changes,min_positive_ms:min}));
