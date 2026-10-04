;(function () {
  function __tebProbe(__tebClock) {
    var __tebPrevious = __tebClock(), __tebMinimum = Infinity;
    var __tebBackwards = 0, __tebChanges = 0, __tebIndex, __tebValue;
    for (__tebIndex = 0; __tebIndex < 200000; ++__tebIndex) {
      __tebValue = __tebClock();
      if (__tebValue < __tebPrevious) ++__tebBackwards;
      if (__tebValue > __tebPrevious) {
        ++__tebChanges;
        __tebMinimum = Math.min(__tebMinimum, __tebValue - __tebPrevious);
      }
      __tebPrevious = __tebValue;
    }
    return {minimum_positive_delta_ms: isFinite(__tebMinimum) ? __tebMinimum : null,
            backwards: __tebBackwards, changes: __tebChanges};
  }
  var __tebNativePerformance = typeof performance !== 'undefined' && typeof performance.now === 'function';
  console.log('TEB_TIMER:' + JSON.stringify({date_available: typeof Date.now === 'function',
    date: __tebProbe(Date.now), native_performance_available: __tebNativePerformance,
    performance: __tebNativePerformance ? __tebProbe(function () { return performance.now(); }) : null}));
})();
