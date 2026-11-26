'use strict';
__four_begin();
var out=[],events=[];
function C(x,y){this.x=x;this.y=y;}
function D(x,y){this.y=x;this.x=y;}
function make(F,x,y){return new F(x,y);}
function show(o){return [o.x,o.y,Object.getPrototypeOf(o)===C.prototype];}
for(var i=0;i<32;i++)out.push(show(make(C,i,2)));
out.push(show(make(D,3,4)),show(make(C,5,6)));
C.prototype={tag:17};out.push(show(make(C,7,8)));
Object.defineProperty(C.prototype,'x',{configurable:true,set:function(v){events.push('x='+v);}});
out.push(show(make(C,9,10)),events.slice());delete C.prototype.x;out.push(show(make(C,11,12)));
Object.defineProperty(Object.prototype,'y',{configurable:true,writable:false,value:81});
try{make(C,13,14);}catch(e){events.push(e instanceof TypeError);}delete Object.prototype.y;
out.push(show(make(C,15,16)));
var proxyProto=new Proxy({},{set:function(t,k,v,r){events.push(k);return Reflect.set(t,k,v,r);}});
C.prototype=proxyProto;out.push(show(make(C,17,18)),events.slice());
C.prototype=3;out.push(show(make(C,19,20)));
C.prototype={};out.push(show(make(C,undefined,undefined)));
function missing(){return new C(1);}out.push(show(missing()));
function Returned(x,y){this.x=x;return {custom:y};}out.push(make(Returned,4,5).custom);
function Escapes(x,y){events.push(this);this.x=x;this.y=y;}var z=make(Escapes,7,8);out.push(events.pop()===z,z.x,z.y);
var P=new Proxy(C,{construct:function(t,a,n){events.push('construct');return Reflect.construct(t,a,n);}});out.push(show(make(P,21,22)));
Object.defineProperty(C.prototype,'x',{configurable:true,get:function(){return 2;}});
try{make(C,3,4);}catch(e){out.push(e instanceof TypeError);}delete C.prototype.x;
for(i=0;i<1000;i++)make(C,{n:i},[i]);
out.push(events.map(function(v){return typeof v==='object'?'object':v;}));print(JSON.stringify(out));

__four_end();
