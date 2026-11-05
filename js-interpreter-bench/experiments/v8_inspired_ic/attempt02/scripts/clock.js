// Native monotonic clock captured before preload/base/workload, common to qjs/d8.
;(function(){
  var object=performance, method=performance.now;
  if(typeof method!=="function")throw Error("native performance.now missing");
  Object.defineProperty(globalThis,"__icoNow",{value:method.bind(object)});
})();

var a=__icoNow(),last=a,min=Infinity,changes=0;for(var i=0;i<50000;i++){var b=__icoNow();if(b<last)throw Error("clock");if(b>last){min=Math.min(min,b-last);changes++;}last=b;}console.log(JSON.stringify({elapsed:last-a,min:min,changes:changes}));
