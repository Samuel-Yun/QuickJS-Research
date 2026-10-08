;(function () {
  var config = __CONFIG__, suite = BenchmarkSuite.suites[0], test = suite.benchmarks[0];
  if (suite.name !== 'Richards' || test.name !== 'Richards') throw Error('wrong input');
  // Fixed intrinsic and prototype descriptors; NO workload call before the timer.
  var method = TaskControlBlock.prototype.run, call = Function.prototype.call;
  var desc = Object.getOwnPropertyDescriptor(TaskControlBlock.prototype, 'run');
  if (!desc || desc.value !== method || desc.get || method.call !== call) throw Error('method constraints');
  Object.defineProperty(method, 'call', {value: call, writable: false, configurable: false});
  BenchmarkSuite.ResetRNG();
  test.Setup();
  if (typeof __mlDiagBegin === 'function') __mlDiagBegin(TaskControlBlock.prototype, method, IdleTask.prototype, WorkerTask.prototype, HandlerTask.prototype, DeviceTask.prototype, call);
  var start = benchNow();
  for (var i = 0; i < config.N; ++i) test.run();
  var stop = benchNow();
  if (typeof __mlDiagEnd === 'function') console.log('ML_COUNTERS:' + __mlDiagEnd());
  test.TearDown();
  if (TaskControlBlock.prototype.run !== method || method.call !== call || !Number.isFinite(stop - start) || stop <= start) throw Error('postcondition/timer');
  // Every unmodified Run asserts these ACTUAL scheduler counters before returning.
  // This is an assertion certificate, not an independently invented numeric oracle.
  console.log('ML_RESULT:' + JSON.stringify({variant: config.variant, N: config.N, mode: 'FIRST_CALL_INCLUSIVE_INTERPRETER_MODE_DERIVED_METHOD_LOOKUP_V1', start_ms: start, stop_ms: stop, elapsed_ms: stop-start, elapsed_per_call_ms: (stop-start)/config.N, checksum: config.N + ':2322:928', correctness: 'PASS', warmup_calls: 0, original_assertions_per_run: 1}));
})();
