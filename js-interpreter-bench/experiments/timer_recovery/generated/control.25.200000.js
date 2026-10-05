// Configuration embedded identically for all shells. Not a benchmark workload.
;(function () {
  var cfg={"duration_ms": 25, "calls": 200000}, previous=benchNow(), minimum=Infinity, backwards=0, i, x;
  if(cfg.calls) {
    for(i=0;i<cfg.calls;i++) {x=benchNow(); if(x<previous) ++backwards;
      if(x>previous) minimum=Math.min(minimum,x-previous); previous=x;}
  }
  var wall=Date.now(), start=benchNow();
  while(benchNow()-start<cfg.duration_ms) { x=(x||0)+1; }
  var elapsed=benchNow()-start;
  console.log('TIMER_CONTROL:'+JSON.stringify({duration_ms:cfg.duration_ms,
    elapsed_ms:elapsed,date_elapsed_ms:Date.now()-wall,backwards:backwards,
    minimum_positive_delta_ms:isFinite(minimum)?minimum:null,checksum:x||0}));
})();
