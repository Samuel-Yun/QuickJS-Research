// Native clock captured before benchmark loading; identical across conditions.
;(function(){
  var object=performance, method=performance.now;
  if(typeof method!=="function")throw Error("native performance.now missing");
  Object.defineProperty(globalThis,"__icSwitchNow",{value:method.bind(object)});
})();

var now=__icSwitchNow,start=now(),last=start;
for(var i=0;i<10000;i++){var next=now();if(next<last)throw Error("nonmonotonic");last=next;}
var stop=now();console.log("CLOCK:"+JSON.stringify({start_ms:start,stop_ms:stop,elapsed_ms:stop-start,calls:10002}));
