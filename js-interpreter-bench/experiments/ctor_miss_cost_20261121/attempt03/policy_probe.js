"use strict";
function C(x,a){this.x=x;this.a=a;}
function D(x,a){this.x=x;this.a=a;}
var proto={};C.prototype=proto;D.prototype=proto;var empty=Object.create(proto);
function ctorLoop(ctor,x,a){return new ctor(x,a);}
var sum=0;
for(var i=0;i<20;i++)sum+=ctorLoop(C,3,0).x;
sum+=ctorLoop(D,3,0).x; // one identity miss
Object.defineProperty(proto,'x',{set:function(v){this.z=v+1;},configurable:true});
sum+=ctorLoop(C,3,0).z; // same target, other guard fails; break the streak
delete proto.x;
sum+=ctorLoop(D,3,0).x; // first mismatch after interruption
sum+=ctorLoop(D,3,0).x; // second mismatch, allow learning
sum+=ctorLoop(D,3,0).x; // now a positive hit in the new policy
if(sum!==76 || Object.getPrototypeOf(empty)!==proto)throw Error('policy checksum');
print('policy_sum='+sum);
