// Mechanism regressions. Identical assertions for baseline and port.
var checks = 0;
function eq(a, b, name) {
  if (a !== b) throw Error(name + ': got '+a+' expected '+b);
  ++checks;
}
function readX(o) { return o.x; }
function writeX(o,v) { 'use strict'; o.x=v; return o.x; }
function shared(o,write,v) { 'use strict'; if(write) o.x=v; return o.x; }
var a={x:1,y:2}, b={x:9,y:8};
for(var i=0;i<100;i++){eq(readX(a),1,'same shape a');eq(readX(b),9,'same shape b');}
a.x=33;eq(readX(a),33,'current value, not cached value');
var c={y:4,x:5};for(i=0;i<20;i++)eq(readX(c),5,'different offset');
a.z=8;eq(readX(a),33,'add shape');delete a.x;eq(readX(a),undefined,'deleted');
a.x=44;eq(readX(a),44,'recreated');
var g=0,s=0,receiver=null;
Object.defineProperty(a,'x',{get:function(){g++;receiver=this;return 17;},set:function(v){s++;receiver=this;},configurable:true});
eq(readX(a),17,'getter');eq(g,1,'get count');eq(receiver,a,'getter this');
eq(writeX(a,90),17,'setter');eq(s,1,'set count');eq(g,2,'postwrite getter count');eq(receiver,a,'setter this');
Object.defineProperty(a,'x',{value:61,writable:true,configurable:true});
eq(readX(a),61,'getter->data');eq(writeX(a,'str'),'str','write type');
Object.defineProperty(a,'x',{get:function(){throw Error('getter throw');},configurable:true});
var caught=false;try{readX(a);}catch(e){caught=e.message==='getter throw';}eq(caught,true,'getter exception');
var proto={x:20}, o=Object.create(proto);eq(readX(o),20,'inherited');
o.x=21;eq(readX(o),21,'own shadow');delete o.x;eq(readX(o),20,'delete shadow');
Object.setPrototypeOf(o,{x:30});eq(readX(o),30,'proto changed');
var traps=0,px=new Proxy({x:41},{get:function(t,k,r){traps++;return Reflect.get(t,k,r);}});
eq(readX(px),41,'proxy');eq(traps,1,'proxy get count');
eq(readX('abc'),undefined,'primitive');eq((function(o){return o.length;})('abc'),3,'length');
var ta=new Uint8Array(2);ta.x=81;eq(readX(ta),81,'typed array own');
var rw={x:1},ro={x:2};Object.defineProperty(ro,'x',{writable:false});
eq(shared(rw,true,8),8,'prime write opcode');
eq(shared(ro,false),2,'shared read inserts readonly shape');
caught=false;try{shared(ro,true,99);}catch(e){caught=e instanceof TypeError;}
eq(caught,true,'shared cached readonly must throw');eq(ro.x,2,'readonly unchanged');
for(i=0;i<100;i++)eq(writeX(rw,i),i,'write update');
var empty={};eq(writeX(empty,7),7,'new property write');
Object.freeze(rw);caught=false;try{writeX(rw,99);}catch(e){caught=e instanceof TypeError;}eq(caught,true,'frozen write');
var setters=0,sp={set x(v){setters++;this.y=v;}},sc=Object.create(sp);
eq(writeX(sc,5),undefined,'inherited setter');eq(sc.y,5,'setter receiver');eq(setters,1,'setter count');
for(i=0;i<300;i++) {
  var f=Function('o','return o.x;');
  eq(f({x:i}),i,'short lived function');
  var cycle={x:i};cycle.self=cycle;eq(f(cycle),i,'cycle shape');
}
console.log('IC_REGRESSION_PASS checks='+checks);
