'use strict';
var out=[];
function getter(){return this.x;}
function invoke(o){return o.m(0);}
var o={x:17,m:getter};for(var i=0;i<32;i++)out.push(invoke(o));
o.x=23;out.push(invoke(o));o.x={hello:42};out.push(invoke(o).hello);
o.m=function(){return this.x+3;};o.x=4;out.push(invoke(o));o.m=getter;out.push(invoke(o));
function swap(){o.m=function(){return 99;};return 1;}
function order(o,fn){var r=o.m(fn());out.push('after');return r;}
for(i=0;i<8;i++)out.push(order(o,function(){return 0;}));out.push(order(o,swap),invoke(o));
o.m=getter;var count=0;Object.defineProperty(o,'x',{configurable:true,get:function(){count++;return 11;}});
out.push(invoke(o),count);Object.defineProperty(o,'x',{configurable:true,writable:true,value:'str'});out.push(invoke(o));
delete o.x;Object.setPrototypeOf(o,{x:31});out.push(invoke(o));
var proxy=new Proxy({x:7,m:getter},{get:function(t,k,r){out.push(k);return Reflect.get(t,k,r);}});out.push(invoke(proxy));
var marker={};Object.defineProperty(o,'x',{get:function(){throw marker;},configurable:true});try{invoke(o);}catch(e){out.push(e===marker);}
o.m=null;try{invoke(o);}catch(e){out.push(e instanceof TypeError);}
var b={x:8,m:getter},c={y:2,x:9,m:getter};for(i=0;i<20;i++)out.push(invoke(i%2?b:c));
var bound=getter.bind({x:51});b.m=bound;out.push(invoke(b));
b.m=new Proxy(getter,{apply:function(t,x,args){return 81;}});out.push(invoke(b));
out.push(getter.call(3));try{getter.call(null);}catch(e){out.push(e instanceof TypeError);}
print(JSON.stringify(out));
