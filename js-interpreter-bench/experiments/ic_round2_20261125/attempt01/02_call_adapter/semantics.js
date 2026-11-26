if(typeof __ep_begin==="function")__ep_begin();
var out=[];
function setA(a){this.a=a;}
function setB(a){this.a=a;}
function empty(){}
function adapted(f,o,a){return f.call(o,a);}
for(var i=0;i<100;i++){var o={a:0};out.push(adapted(i%2?setA:setB,o,i));out.push(o.a);}
var extra={};setA.call(extra,3,4,5);out.push(extra.a);
var few={};setA.call(few);out.push(few.a);
var custom=function(){};custom.call=function(t,a){t.a=a+100;};var c={};adapted(custom,c,3);out.push(c.a);
var hits=0, p={};Object.defineProperty(p,'a',{set:function(v){hits++;this.z=v;},configurable:true});var q=Object.create(p);adapted(setA,q,7);out.push(hits,q.z);
var locked={};Object.defineProperty(locked,'a',{value:11,writable:false});adapted(setA,locked,20);out.push(locked.a);
function strictSet(a){'use strict';this.a=a;}
try{adapted(strictSet,locked,2);}catch(e){out.push(e.name);}
var value={n:1};var own={a:null};adapted(setA,own,value);out.push(own.a===value);
var gets=0;var arr={get x(){gets++;return 17;}};var z={};adapted(setA,z,arr.x);out.push(gets,z.a);
var traps=0;var prox=new Proxy({},{set:function(t,k,v){traps++;t[k]=v;return true;}});adapted(setA,prox,5);out.push(traps,prox.a);
function observe(){return new Error().stack.indexOf('call (native)')>=0;}
out.push(observe.call({}));
for(var i=0;i<100;i++)empty.call({});
print(JSON.stringify(out));

if(typeof __ep_end==="function")__ep_end();
