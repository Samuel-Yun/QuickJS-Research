;(function(){
  var config=__CONFIG__,suite=BenchmarkSuite.suites[0];
  if(BenchmarkSuite.suites.length!==1||suite.name!==__SUITE__)throw Error('suite registration');
  var test=suite.benchmarks[__INDEX__];
  if(test.name!==__BENCHMARK__)throw Error('benchmark registration');
  if(suite.name!=='Crypto')BenchmarkSuite.ResetRNG();
  if(suite.name==='RegExp')regExpBenchmark=new RegExpBenchmark();
  else test.Setup();
  if(suite.name==='Crypto'&&test.name==='Decrypt')encrypt();
  var run=test.run, now=__icoNow, count=config.N;
  var runSource=config.phase==='correctness'?String(run):null;
  var started=now();
  for(var iteration=0;iteration<count;iteration++)run();
  var stopped=now();
  if(suite.name==='Crypto'&&test.name==='Encrypt')decrypt();
  var extra=0;
  if(suite.name==='NavierStokes')while(nsFrameCounter<15){run();extra++;}
  var checksum=suite.name==='Crypto'?encrypted:null;
  test.TearDown();
  console.log('OCTANE_IC_RESULT:'+JSON.stringify({case:config.case,N:config.N,
    mode:'USE_IC_OCTANE_FIRST_CALL_INCLUSIVE_V1',phase:config.phase,
    start_ms:started,stop_ms:stopped,elapsed_ms:stopped-started,
    elapsed_per_Run_ms:(stopped-started)/config.N,checksum:checksum,
    extra_validation_calls:extra,run_source:runSource,correctness:'PASS',warmup_calls:0}));
})();
