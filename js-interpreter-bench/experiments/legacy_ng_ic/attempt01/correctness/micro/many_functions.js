
var sum=0,o={x:7};
for(var i=0;i<400;i++){var fn=Function('o','return o.x;');sum+=fn(o);}
if(sum!==2800)throw Error('wrong checksum');console.log('MICRO_PASS '+sum);
