// Captured before workload/base.js; this does not replace performance.now or Date.now.
;(function () {
  var __clockObject = performance, __clockFunction = performance.now;
  if (typeof __clockFunction !== 'function') throw new Error('native clock missing');
  Object.defineProperty(globalThis, 'benchNow', {value: function () {
    return __clockFunction.call(__clockObject);
  }, writable: false, configurable: false});
})();
