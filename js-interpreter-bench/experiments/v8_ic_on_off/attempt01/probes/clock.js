// Captured before benchmark loading. No engine-dependent target branch.
;(function () {
  var clockObject=performance, clockFunction=performance.now;
  if(typeof clockFunction!=="function")throw Error("native performance.now missing");
  Object.defineProperty(globalThis,"__icNow",{value:clockFunction.bind(clockObject)});
})();

var values=[],t0=__icNow(),t=t0; for(var i=0;i<10000;i++){var next=__icNow();if(next<t)throw Error("nonmonotonic");t=next;} var stop=__icNow();
console.log("CLOCK:"+JSON.stringify({start_ms:t0,stop_ms:stop,elapsed_ms:stop-t0,calls:10002,timing_sample:false}));
