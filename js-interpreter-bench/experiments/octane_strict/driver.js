// New harness only. Concatenated after byte-identical frozen upstream sources.
;(function () {
  var suite = BenchmarkSuite.suites[0];
  if (BenchmarkSuite.suites.length !== 1 || suite.name !== __SUITE__)
    throw new Error('suite registration mismatch');
  var test = suite.benchmarks[__INDEX__];
  if (test.name !== __BENCHMARK__) throw new Error('benchmark registration mismatch');
  // Transport shim only: workload and timer are identical on both engines.
  var args = typeof scriptArgs !== 'undefined' ? scriptArgs : argumentsForD8;
  var config = null;
  for (var a = 0; a < args.length; a++) {
    if (String(args[a]).indexOf('STRICT_CONFIG=') === 0)
      config = JSON.parse(String(args[a]).substring(14));
  }
  if (!config || !(config.N > 0) || config.N !== Math.floor(config.N))
    throw new Error('missing strict config');
  var N = config.N;
  var mode = config.mode;
  var now = config.timer === 'performance.now' ?
    function () { return performance.now(); } : Date.now;
  BenchmarkSuite.ResetRNG();
  if (suite.name === 'RegExp') {
    // Upstream regexp.js:48-50: preserve constructor, omit performance priming Run.
    regExpBenchmark = new RegExpBenchmark();
  } else {
    test.Setup();
  }
  if (suite.name === 'Crypto' && test.name === 'Decrypt') {
    // Required input dependency, NOT an advance Decrypt invocation.
    encrypt();
  }
  var start, elapsed = 0, i;
  if (mode === 'frontend') {
    console.log('STATIC_RUN_OBJECT_BEFORE_TIMER:' + suite.name + '/' + test.name + ':function=' + test.run.name);
    console.log('TIMER_START_MARKER:' + suite.name + '/' + test.name);
    start = now();
    for (i = 0; i < N; i++) test.run();
    elapsed = now() - start;
    console.log('TIMER_STOP_MARKER:' + suite.name + '/' + test.name);
  } else if (mode === 'correctness') {
    // Separate process; extra validation is NEVER in the formal timed loop.
    for (i = 0; i < N; i++) {
      test.run();
      if (suite.name === 'Crypto' && test.name === 'Encrypt') decrypt();
    }
  } else if (mode === 'measure') {
    start = now();
    for (i = 0; i < N; i++) test.run();
    elapsed = now() - start;
  } else {
    throw new Error('unexpected mode');
  }
  // Preserve the upstream validation mechanism, including its coverage limits.
  var extraValidationCalls = 0;
  if (suite.name === 'Crypto' && test.name === 'Encrypt' && mode !== 'correctness')
    decrypt();
  if (suite.name === 'NavierStokes') {
    // Upstream only asserts the 15th frame. Small-N gates must reach that check.
    while (nsFrameCounter < 15) {
      test.run();
      extraValidationCalls++;
    }
  }
  test.TearDown();
  console.log('OCTANE_STRICT_RESULT:' + JSON.stringify({
    suite: suite.name, benchmark: test.name, N: N, mode: mode,
    timer: config.timer, elapsed_ms: elapsed, elapsed_per_call_ms: elapsed / N,
    extra_validation_calls: extraValidationCalls, correctness: 'PASS'
  }));
})();
