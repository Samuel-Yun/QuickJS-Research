function ownProbe(obj) { return obj.x + 1; }
var o={x:3}, answer=0; for(var i=0;i<10000;i++)answer+=ownProbe(o);
if(answer!==40000)throw Error("checksum"); console.log("PROBE_PASS "+answer);
