function C(x,y){this.x=x;this.y=y;}
function D(x,y){this.x=x;this.y=y;}
function make(c,x,y){return new c(x,y);}
var out=[],calls=0;
// No deliberately retained empty instance shape.
for(var run=0;run<20;run++){
    var proto={};C.prototype=proto;D.prototype=proto;
    for(var i=0;i<20;i++){var o=make(i&1?C:D,i,7);out.push(o.x+o.y);}
    Object.defineProperty(proto,'x',{set:function(v){calls++;this.z=v+100;},configurable:true});
    var o=make(C,3,4);out.push(o.z,o.y);
    delete proto.x;
    Object.defineProperty(proto,'x',{value:88,writable:false,configurable:true});out.push(make(C,3,4).x);
    delete proto.x;
    var parent={};Object.defineProperty(parent,'x',{value:99,writable:false,configurable:true});
    Object.setPrototypeOf(proto,parent);
    Object.defineProperty(proto,'x',{value:1,writable:true,configurable:true});out.push(make(C,3,4).x);
    delete proto.x;out.push(make(C,3,4).x);
    Object.setPrototypeOf(proto,Object.prototype);
    out.push(make(C,2).y,make(C,4,5).y);
}
function Strict(x,y){'use strict';this.x=x;this.y=y;}
var p={};Object.defineProperty(p,'x',{value:1,writable:false});Strict.prototype=p;
try{make(Strict,3,4);}catch(e){out.push(e.name);}
var proxy=new Proxy(function(x,y){this.x=x;this.y=y;},{});out.push(make(proxy,7,8).y);
function Thrower(){throw Error('ctor');}
try{make(Thrower,1,2);}catch(e){out.push(e.message);}
out.push(calls);print(JSON.stringify(out));
