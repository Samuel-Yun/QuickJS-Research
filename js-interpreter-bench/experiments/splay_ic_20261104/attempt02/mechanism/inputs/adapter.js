// Native monotonic clock captured before preload/base/workload, common to qjs/d8.
;(function(){
  var object=performance, method=performance.now;
  if(typeof method!=="function")throw Error("native performance.now missing");
  Object.defineProperty(globalThis,"__icoNow",{value:method.bind(object)});
})();
