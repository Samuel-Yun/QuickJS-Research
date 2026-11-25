/* One fixed x read point per entry. Receiver setup is outside timing. */
var kind=scriptArgs[1]||'object';var mode=scriptArgs[2]||'fused';var N=+(scriptArgs[3]||65536);
var receiver;
if(kind==='function')receiver=function Example(){return 1;};
else if(kind==='regexp')receiver=/abc/g;
else if(kind==='array')receiver=[11,22,33];
else receiver={};
receiver.x=3;
function readX(o){return o.x;}
function readPlain(k,o){return o.x;}
function fusedLoop(o,n){var sum=0;for(var i=0;i<n;i++)sum+=readX(o);return sum;}
function plainLoop(o,n){var sum=0;for(var i=0;i<n;i++)sum+=readPlain(0,o);return sum;}
var t=performance.now();var result=mode==='plain'?plainLoop(receiver,N):fusedLoop(receiver,N);var elapsed=performance.now()-t;
if(result!==3*N)throw Error('checksum '+result);
print(JSON.stringify({kind:kind,mode:mode,iterations:N,checksum:result,elapsed_ms:elapsed}));
