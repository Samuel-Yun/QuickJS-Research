// Captured before workload/base.js. Linux upstream performance.now -> CLOCK_MONOTONIC.
;(function () {
  var __clockObject = performance, __clockFunction = performance.now;
  if (typeof __clockFunction !== 'function') throw new Error('native clock missing');
  Object.defineProperty(globalThis, 'benchNow', {value: function () {
    return __clockFunction.call(__clockObject);
  }, writable: false, configurable: false});
})();

var a=benchNow(),p=a,min=Infinity,changes=0;for(var i=0;i<100000;i++){var t=benchNow();if(t<p)throw Error('backward');if(t>p){min=Math.min(min,t-p);changes++;}p=t;}if(!changes)throw Error('no progress');console.log(JSON.stringify({changes:changes,min_positive_ms:min,start_ms:a,stop_ms:p}));
