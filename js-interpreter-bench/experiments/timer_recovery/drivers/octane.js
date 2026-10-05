;(function () {
  var __tebConfig = __CONFIG__, __tebSuite = BenchmarkSuite.suites[0];
  if (BenchmarkSuite.suites.length !== 1 || __tebSuite.name !== __SUITE__)
    throw new Error('suite registration mismatch');
  var __tebTest = __tebSuite.benchmarks[__INDEX__];
  if (__tebTest.name !== __BENCHMARK__) throw new Error('benchmark registration mismatch');
  var __tebN = __tebConfig.N, __tebIndex, __tebElapsed = null;
  var __tebStarted = null, __tebStopped = null;
  BenchmarkSuite.ResetRNG();
  if (__tebSuite.name === 'RegExp') {
    // Frozen strict adaptation: required input construction, omit priming Run.
    regExpBenchmark = new RegExpBenchmark();
  } else { __tebTest.Setup(); }
  if (__tebSuite.name === 'Crypto' && __tebTest.name === 'Decrypt') encrypt();
  if (__tebConfig.phase === 'correctness') {
    for (__tebIndex = 0; __tebIndex < __tebN; ++__tebIndex) {
      __tebTest.run();
      if (__tebSuite.name === 'Crypto' && __tebTest.name === 'Encrypt') decrypt();
    }
  } else {
    __tebStarted = benchNow();
    for (__tebIndex = 0; __tebIndex < __tebN; ++__tebIndex) __tebTest.run();
    __tebStopped = benchNow();
    __tebElapsed = __tebStopped - __tebStarted;
  }
  var __tebExtraCalls = 0;
  if (__tebSuite.name === 'Crypto' && __tebTest.name === 'Encrypt' && __tebConfig.phase !== 'correctness') decrypt();
  if (__tebSuite.name === 'NavierStokes') {
    while (nsFrameCounter < 15) { __tebTest.run(); ++__tebExtraCalls; }
  }
  __tebTest.TearDown();
  if (__tebElapsed !== null && (!Number.isFinite(__tebElapsed) || __tebElapsed < 0))
    throw new Error('invalid monotonic interval');
  console.log('TEB_RESULT:' + JSON.stringify({
    benchmark: 'Octane', case: __tebConfig.case, suite: __tebSuite.name,
    subbenchmark: __tebTest.name, mode: 'MAIN_MONOTONIC_V1', phase: __tebConfig.phase, N: __tebN,
    correctness: 'PASS', extra_validation_calls: __tebExtraCalls, checksum: null,
    timer: 'benchNow', start_ms: __tebStarted, stop_ms: __tebStopped, elapsed_ms: __tebElapsed,
    elapsed_per_call_ms: __tebElapsed === null ? null : __tebElapsed / __tebN, warmup_calls: 0
  }));
})();
