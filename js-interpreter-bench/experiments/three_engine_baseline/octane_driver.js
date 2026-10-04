;(function () {
  var __tebConfig = __CONFIG__;
  var __tebSuite = BenchmarkSuite.suites[0];
  if (BenchmarkSuite.suites.length !== 1 || __tebSuite.name !== __SUITE__)
    throw new Error('suite registration mismatch');
  var __tebTest = __tebSuite.benchmarks[__INDEX__];
  if (__tebTest.name !== __BENCHMARK__) throw new Error('benchmark registration mismatch');
  var __tebN = __tebConfig.N, __tebIndex, __tebElapsed = null;
  BenchmarkSuite.ResetRNG();
  if (__tebSuite.name === 'RegExp') {
    // Same disclosed adaptation as old strict: construct input, omit priming Run.
    regExpBenchmark = new RegExpBenchmark();
  } else {
    __tebTest.Setup();
  }
  if (__tebSuite.name === 'Crypto' && __tebTest.name === 'Decrypt') encrypt();
  if (__tebConfig.mode === 'correctness') {
    for (__tebIndex = 0; __tebIndex < __tebN; ++__tebIndex) {
      __tebTest.run();
      if (__tebSuite.name === 'Crypto' && __tebTest.name === 'Encrypt') decrypt();
    }
  } else {
    if (__tebConfig.mode === 'diagnostic') __tebTest.run();
    if (__tebConfig.mode === 'frontend')
      __TEB_marker('TEB_TIMER_START:' + __tebSuite.name + '/' + __tebTest.name);
    var __tebStarted = Date.now();
    for (__tebIndex = 0; __tebIndex < __tebN; ++__tebIndex) __tebTest.run();
    __tebElapsed = Date.now() - __tebStarted;
    if (__tebConfig.mode === 'frontend')
      __TEB_marker('TEB_TIMER_STOP:' + __tebSuite.name + '/' + __tebTest.name);
  }
  var __tebExtraCalls = 0;
  if (__tebSuite.name === 'Crypto' && __tebTest.name === 'Encrypt' && __tebConfig.mode !== 'correctness') decrypt();
  // Original NavierStokes assertion covers frame 15; validate low N after region.
  if (__tebSuite.name === 'NavierStokes') {
    while (nsFrameCounter < 15) { __tebTest.run(); ++__tebExtraCalls; }
  }
  __tebTest.TearDown();
  if (__tebElapsed !== null && (!Number.isInteger(__tebElapsed) || __tebElapsed < 0))
    throw new Error('invalid timer interval');
  console.log('TEB_RESULT:' + JSON.stringify({
    benchmark: 'Octane', case: __tebConfig.case, suite: __tebSuite.name,
    subbenchmark: __tebTest.name, mode: __tebConfig.mode, N: __tebN,
    correctness: 'PASS', extra_validation_calls: __tebExtraCalls,
    timer: 'Date.now', elapsed_ms: __tebElapsed,
    elapsed_per_call_ms: __tebElapsed === null ? null : __tebElapsed / __tebN,
    warmup_calls: __tebConfig.mode === 'diagnostic' ? 1 : 0
  }));
})();
