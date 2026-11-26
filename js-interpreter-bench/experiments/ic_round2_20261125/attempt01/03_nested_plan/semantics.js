if(typeof __ep_begin==="function")__ep_begin();
var out=[];
function make(){return function(){this.initialize.apply(this,arguments);};}
var ns={Color:make()};ns.Color.prototype={initialize:function(a,b,c){this.a=a?a:0;this.b=b?b:0;this.c=c?c:0;}};
var Outer=make();Outer.prototype={initialize:function(){this.field=new ns.Color(0,0,0);}};
var Pair=make();Pair.prototype={initialize:function(a,b){this.one=a;this.two=b;}};
function run0(){return new Outer();}
function run2(a,b){return new Pair(a,b);}
var prev;
for(var i=0;i<150;i++){var a=run0();out.push(a.field.a,a.field.b,a.field.c,prev?prev!==a&&prev.field!==a.field:true);prev=a;var b=run2(i,-i);out.push(b.one,b.two);}
var old=ns.Color;ns.Color=make();ns.Color.prototype={initialize:function(a,b,c){this.a=9;}};out.push(run0().field.a);ns.Color=old;
var seen=0;Object.defineProperty(ns,'Color',{get:function(){seen++;return old;},configurable:true});out.push(run0().field.a,seen);Object.defineProperty(ns,'Color',{value:old,writable:true,configurable:true});
var orig=Outer.prototype.initialize;Outer.prototype.initialize=function(){this.field=99;};out.push(run0().field);Outer.prototype.initialize=orig;
var oldapply=Function.prototype.apply;Function.prototype.apply=function(t,args){seen++;return oldapply.call(this,t,args);};out.push(run0().field.a);Function.prototype.apply=oldapply;
var proto=Outer.prototype,parent=Object.getPrototypeOf(proto),setter=0;Object.setPrototypeOf(proto,{set field(x){setter++;}});out.push(run0().field,setter);Object.setPrototypeOf(proto,parent);
Pair.prototype={initialize:function(a,b){this.one=a;this.two=b;}};out.push(run2(12,13).two);
print(JSON.stringify(out));

if(typeof __ep_end==="function")__ep_end();
