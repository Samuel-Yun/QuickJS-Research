'use strict';
var checks=0;function eq(a,b){checks++;if(!Object.is(a,b))throw Error(a+' != '+b);}
function create(p){var o=Object.create(p);o.a=1;o.b=2;o.c=3;return o;}
var keep=[],p={p:7},q={p:9};
for(var i=0;i<2000;i++){
 var o=create(i&1?p:q);keep.push(o);eq(o.a+o.b+o.c,6);eq(o.p,i&1?7:9);
 if(i%13===0){delete o.a;o.a=5;eq(o.a,5);}
 if(i%17===0){Object.defineProperty(o,'b',{get:function(){return 10;},configurable:true});eq(o.b,10);}
 if(i%19===0){Object.defineProperty(o,'c',{value:8,writable:false});eq(o.c,8);}
}
for(var i=0;i<1000;i++){
 var a={};Object.defineProperty(a,'x',{value:1,writable:!!(i&1),configurable:true,enumerable:!!(i&2)});eq(a.x,1);
 var d=Object.getOwnPropertyDescriptor(a,'x');eq(d.writable,!!(i&1));eq(d.enumerable,!!(i&2));
}
var setters=0,proto={};Object.defineProperty(proto,'x',{set:function(v){setters+=v;}});
for(var i=0;i<50;i++){var a=Object.create(proto);a.x=1;eq(Object.prototype.hasOwnProperty.call(a,'x'),false);}
eq(setters,50);
var frozen=Object.preventExtensions({}),threw=false;try{frozen.x=1;}catch(e){threw=e instanceof TypeError;}eq(threw,true);
print('EDGE_SAFETY_PASS '+checks);
