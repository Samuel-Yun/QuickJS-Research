// Nine independent scenario groups; assertion count includes repeated accesses.
var slotChecks=0;
function slotEq(a,b){if(a!==b)throw Error('slot mismatch '+a+' != '+b);slotChecks++;}
function slotRead(o){return o.x;}
function slotWrite(o,v){'use strict';o.x=v;return o.x;}
function slotObjects(n){var a=[];for(var j=0;j<n;j++){var o={};o['unique'+j]=j;o.x=j+1;a.push(o);}return a;}
// 1--5: all capacities and oversubscription, values and offsets independent.
for(var ns=0;ns<5;ns++){
  var size=[1,2,4,5,8][ns],objects=slotObjects(size);
  for(var si=0;si<4000;si++){var ix=si%size;slotEq(slotRead(objects[ix]),ix+1);}
  for(si=0;si<size;si++){objects[si].x='v'+si;slotEq(slotRead(objects[si]),'v'+si);slotEq(slotWrite(objects[si],si+20),si+20);}
}
// 6: same shape, different objects; no cached values.
var sa={x:1,y:2},sb={x:9,y:3};for(si=0;si<100;si++){slotEq(slotRead(sa),1);slotEq(slotRead(sb),9);}
sa.x=31;slotEq(slotRead(sa),31);
// 7: atom remains shared across source sites, not converted to site caches.
function slotShared(a,b){return a.x+b.x;}
var sx={x:2,y:3},sy={y:4,x:7};for(si=0;si<100;si++)slotEq(slotShared(sx,sy),9);
// 8: delete/redefine/accessor/read-only/prototype/Proxy after occupying slots.
objects=slotObjects(4);for(si=0;si<100;si++)slotRead(objects[si%4]);
delete objects[1].x;slotEq(slotRead(objects[1]),undefined);objects[1].x=22;slotEq(slotRead(objects[1]),22);
var gets=0;Object.defineProperty(objects[2],'x',{get:function(){gets++;return this.unique2+40;},configurable:true});
slotEq(slotRead(objects[2]),42);slotEq(gets,1);
Object.defineProperty(objects[3],'x',{writable:false});var threw=false;try{slotWrite(objects[3],9);}catch(e){threw=e instanceof TypeError;}slotEq(threw,true);slotEq(objects[3].x,4);
var sp={x:55},so=Object.create(sp);slotEq(slotRead(so),55);Object.setPrototypeOf(so,{x:56});slotEq(slotRead(so),56);
var traps=0;var proxy=new Proxy({x:64},{get:function(t,k,r){traps++;return Reflect.get(t,k,r);}});slotEq(slotRead(proxy),64);slotEq(traps,1);
// 9: functions/shapes outlive former receivers, then are collectable together.
for(var group=0;group<120;group++){
  var fn=Function('o','return o.x;'),many=slotObjects(8);
  for(si=0;si<64;si++)slotEq(fn(many[si%8]),si%8+1);
  many=null;slotEq(fn({x:72}),72);fn=null;
}
console.log('MULTISLOT_PASS scenarios=9 assertions='+slotChecks);
