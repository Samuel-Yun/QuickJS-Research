
function microSingle(o){return o.x;}
var sum=0,o={x:7};for(var i=0;i<400;i++)sum+=microSingle(o);
if(sum!==2800)throw Error('wrong checksum');console.log('MICRO_PASS '+sum);
