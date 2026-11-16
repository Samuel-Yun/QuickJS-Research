// Native monotonic clock captured before preload/base/workload, common to qjs/d8.
;(function(){
  var object=performance, method=performance.now;
  if(typeof method!=="function")throw Error("native performance.now missing");
  Object.defineProperty(globalThis,"__icoNow",{value:method.bind(object)});
})();

var now=__icoNow,start=now(),last=start;for(var i=0;i<10000;i++){var n=now();if(n<last)throw Error("nonmonotonic");last=n;}var stop=now();console.log("CLOCK:"+JSON.stringify({start:start,stop:stop,elapsed:stop-start}));
