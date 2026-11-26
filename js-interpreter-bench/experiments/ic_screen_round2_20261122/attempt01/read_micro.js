function readX(o){return o.x;}
function readWide(o,flag){if(flag)return o.x;return o.y;}
var mode=scriptArgs[1]||'short',n=+(scriptArgs[2]||16777216);
var reader=mode==='short'?readX:readWide,obj={x:3,y:3},sum=0;
var start=performance.now();
for(var i=0;i<n;i++)sum+=reader(obj,true);
var elapsed=performance.now()-start;
if(sum!==3*n)throw Error('checksum');
print(JSON.stringify({pattern:mode,iterations:n,checksum:sum,elapsed_ms:elapsed}));
