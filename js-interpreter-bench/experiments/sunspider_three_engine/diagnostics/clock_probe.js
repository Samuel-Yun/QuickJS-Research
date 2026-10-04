// Clock-quality diagnostic only. It is never part of MAIN or benchmark sampling.
;(function () {
  var startP = performance.now(), startD = Date.now();
  var prevP = startP, prevD = startD, negative = [], steps = [], count = 0;
  var p, d, deltaD, deltaP;
  do {
    p = performance.now(); d = Date.now(); ++count;
    deltaD = d - prevD; deltaP = p - prevP;
    if (deltaD < 0) negative.push({date_delta_ms:deltaD, perf_delta_ms:deltaP,
                                after_monotonic_ms:p-startP});
    if (Math.abs(deltaD-deltaP) > 50)
      steps.push({date_delta_ms:deltaD, perf_delta_ms:deltaP,
                  after_monotonic_ms:p-startP});
    prevP = p; prevD = d;
  } while (p-startP < 5000 && count < 100000000);
  console.log('CLOCK_DIAGNOSTIC:' + JSON.stringify({timer_used_for_control:'performance.now',
    Date_elapsed_ms:d-startD, performance_elapsed_ms:p-startP,
    samples:count, backwards:negative, inconsistent_steps:steps}));
})();
