'use strict';
__four_begin();
var output=[];
function f(o){return o.x*o.y;}
function g(a,b){return a.x+b.y;}
function wide(a,b,c,d,o){return o.x+o.y;}
var o={x:3,y:4};for(var i=0;i<20;i++)output.push(f(o));
o.x=7;o.y=8;output.push(f(o));
o.x='7';output.push(f(o));o.x={valueOf:function(){return 5;}};output.push(f(o));
delete o.x;output.push(String(f(o)));o.x=6;output.push(f(o));
var getter=0;Object.defineProperty(o,'x',{configurable:true,get:function(){getter++;o.y=11;return 2;}});
output.push(f(o),getter);Object.defineProperty(o,'x',{configurable:true,writable:true,value:4});output.push(f(o));
var proto={x:9};var inherited=Object.create(proto);inherited.y=3;output.push(f(inherited));
var traps=[];var proxy=new Proxy({x:2,y:9},{get:function(t,k,r){traps.push(k);return Reflect.get(t,k,r);}});
output.push(f(proxy),traps.join(','));
output.push(g({x:2},{y:17}),wide(0,0,0,0,{x:2,y:4}));
for(i=0;i<100;i++){var q=i%2?{z:1,x:i,y:2}:{x:i,y:3};output.push(f(q));}
var marker={};var bad={get x(){throw marker;},y:8};try{f(bad);}catch(e){output.push(e===marker);}
Object.setPrototypeOf(o,{x:99});output.push(f(o));
print(JSON.stringify(output));

__four_end();
