if(typeof __ep_begin==='function')__ep_begin();
var out=[],calls=0;
function C(){}
var mid=Object.create(Function.prototype);Object.setPrototypeOf(C,mid);
function test(v){return v instanceof C;}
var a=new C();for(var i=0;i<100;i++)out.push(test(a),test(1));
Object.defineProperty(mid,Symbol.hasInstance,{value:function(v){calls++;return v===17;},writable:true,configurable:true});out.push(test(a),test(17),calls);
mid[Symbol.hasInstance]=function(v){calls++;return v===19;};out.push(test(17),test(19),calls);
Object.defineProperty(mid,Symbol.hasInstance,{get:function(){calls++;return function(){calls++;return false;};},configurable:true});out.push(test(a),calls);
delete mid[Symbol.hasInstance];out.push(test(a),test(1));
var old=C.prototype;C.prototype={};out.push(test(a),test(new C()));C.prototype=old;out.push(test(a));
var newer=Object.create(Function.prototype);Object.defineProperty(newer,Symbol.hasInstance,{value:function(){calls++;return true;},configurable:true});Object.setPrototypeOf(mid,newer);out.push(test(1),calls);
Object.setPrototypeOf(C,Function.prototype);out.push(test(a));
for(var j=0;j<30;j++)mid['p'+j]=j;Object.setPrototypeOf(C,mid);out.push(test(a));for(var j=0;j<28;j++)delete mid['p'+j];out.push(test(a));
Object.setPrototypeOf(mid,Function.prototype);out.push(test(a));
print(JSON.stringify(out));
if(typeof __ep_end==='function')__ep_end();
