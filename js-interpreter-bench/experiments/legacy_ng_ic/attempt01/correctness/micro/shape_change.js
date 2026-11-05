
function microChange(o){return o.x;}
var o={x:1,y:2};for(var i=0;i<100;i++)if(microChange(o)!==1)throw Error('initial');
delete o.x;o.x=8;for(var i=0;i<100;i++)if(microChange(o)!==8)throw Error('changed');
Object.defineProperty(o,'x',{get:function(){return 19;}});
for(var i=0;i<100;i++)if(microChange(o)!==19)throw Error('getter');
console.log('MICRO_PASS');
