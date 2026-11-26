"use strict";
var out=[];
function C(x,a){this.x=x;this.a=a;}
function D(x,a){this.x=x;this.a=a;}
var proto={};C.prototype=proto;D.prototype=proto;
var empty=Object.create(proto);
function slot(ctor,x,a){return new ctor(x,a);}
for(var i=0;i<100;i++)out.push(slot(C,i,9).x);
for(i=0;i<100;i++)out.push(slot(D,i,8).a);
for(i=0;i<100;i++)out.push(slot(C,i,7).a);
// Same target, changed descriptors: a learned plan must recheck qualification.
Object.defineProperty(proto,'x',{set:function(v){this.z=v+1;},configurable:true});
out.push(slot(C,10,3).z);
delete proto.x;
out.push(slot(C,11,4).x);
Object.defineProperty(proto,'x',{value:1,writable:false,configurable:true});
try{slot(C,12,5);}catch(e){out.push(e.name);}
delete proto.x;
var other={};C.prototype=other;var empty2=Object.create(other);
out.push(slot(C,13,6).x);
try{slot(function(){throw Error('expected');},1,2);}catch(e){out.push(e.message);}
try{slot(1,1,2);}catch(e){out.push(e.name);}
out.push(slot(C,14,7).x,Object.getPrototypeOf(empty)===proto,Object.getPrototypeOf(empty2)===other);
print(JSON.stringify(out));
