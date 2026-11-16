var out=[],seen=[];
function Pair(a,b){this.x=a;this.y=b;}
function Shift(a,b){this.x=a+1;this.y=b;}
function make(c,a,b){return new c(a,b);}
function Wrap(){this.setup.apply(this,arguments);}
function Init(a,b){var p=make(Pair,a,b);this.args=[arguments.length,p.x,p.y,arguments[3]];}
Wrap.prototype.setup=Init;
for(var i=0;i<100;i++)out.push((new Wrap(i,2,3,4)).args);
for(i=0;i<100;i++)out.push(make(Shift,i,3).x);
for(i=0;i<100;i++)out.push(make(Pair,i,3).x);
var nativeApply=Function.prototype.apply;
Init.apply=function(t,a){seen.push(a.length,a.callee===Wrap);return nativeApply.call(Init,t,a);};out.push((new Wrap(7,8,9)).args);delete Init.apply;
Object.defineProperty(Pair.prototype,'x',{set:function(v){this.z=v;},configurable:true});out.push((new Wrap(8,9)).args);delete Pair.prototype.x;
function Other(a,b){this.x=b;this.y=a;}Pair=Other;
for(i=0;i<100;i++)out.push((new Wrap(i,4)).args);
Object.defineProperty(Wrap.prototype,'setup',{get:function(){seen.push('target');return Init;},configurable:true});out.push((new Wrap(6)).args);
Object.defineProperty(Wrap.prototype,'setup',{value:Init,writable:true,configurable:true});out.push((new Wrap()).args);out.push(seen);print(JSON.stringify(out));
