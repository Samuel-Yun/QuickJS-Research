function stableOwn(obj) { return obj.x; }
var stableObject={x:3}, sum=0;for(var i=0;i<10000;i++)sum+=stableOwn(stableObject);
if(sum!==30000)throw Error("checksum");console.log("OWN_PASS "+sum);
console.log("FEEDBACK "+JSON.stringify(%GetFeedback(stableOwn)));
