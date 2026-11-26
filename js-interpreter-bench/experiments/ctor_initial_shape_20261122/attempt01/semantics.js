function C(x,y){this.x=x;this.y=y;}
function D(x,y){this.x=x;this.y=y;}
function E(x,y){this.x=x;this.y=y;}
function F(x,y){this.x=x;this.y=y;}
function G(x,y){this.x=x;this.y=y;}
var proto={},empty=Object.create(proto),ctors=[C,D,E,F,G],out=[],setters=0;
for(var i=0;i<ctors.length;i++)ctors[i].prototype=proto;
function make(c,x,y){return new c(x,y);}
for(var i=0;i<40;i++){var a=make(ctors[i%5],i,2);out.push(a.x+a.y);}
out.push(make(C,8).x,make(C,8,9).y);
Object.defineProperty(proto,'x',{set:function(v){setters++;this.z=v+10;},configurable:true});
for(var i=0;i<5;i++){var a=make(ctors[i],3,4);out.push(a.z,a.y);}
delete proto.x;
Object.defineProperty(proto,'x',{value:11,writable:false,configurable:true});
out.push(make(C,3,4).x);
delete proto.x;
var parent={};Object.defineProperty(parent,'x',{value:22,writable:false,configurable:true});
Object.setPrototypeOf(proto,parent);
Object.defineProperty(proto,'x',{value:33,writable:true,configurable:true});
out.push(make(C,3,4).x); // nearest writable descriptor hides the ancestor
delete proto.x;out.push(make(C,3,4).x);
Object.setPrototypeOf(proto,Object.prototype);
var old=proto;C.prototype={};var keep=Object.create(C.prototype);
out.push(make(C,7,9).x,Object.getPrototypeOf(make(C,7,9))===C.prototype);
C.prototype=old;
var original=Object.getPrototypeOf(proto);
Object.setPrototypeOf(proto,new Proxy({}, {get:function(t,k){return t[k];}}));
out.push(make(C,5,6).y);Object.setPrototypeOf(proto,original);
function Bad(x,y){this.x=x+0;this.y=y;}
out.push(make(Bad,7,8).x,make(C,9,10).y,make(Bad,11,12).y);
function Throwing(){throw Error('ctor');}
try{make(Throwing,1,2);}catch(e){out.push(e.message);}
try{make({},1,2);}catch(e){out.push(e.name);}
// A long chain falls back at the unchanged depth limit.
var deep={};for(var i=0;i<35;i++)deep=Object.create(deep);
C.prototype=deep;out.push(make(C,12,13).x);C.prototype=old;
out.push(setters);
print(JSON.stringify(out));
