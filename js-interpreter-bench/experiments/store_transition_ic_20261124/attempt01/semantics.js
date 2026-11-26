'use strict';
var trace=[];
function store(o,v){o.x=v;return o.x;}
function check(x){if(!x)throw Error('check failed');}
var proto=Object.create(null);
for(var i=0;i<1000;i++){var o=Object.create(proto);check(store(o,i)===i);}
Object.defineProperty(proto,'x',{configurable:true,set:function(v){trace.push('setter:'+v);},get:function(){return 91;}});
var o=Object.create(proto);check(store(o,7)===91);check(!Object.hasOwn(o,'x'));
delete proto.x;
Object.defineProperty(proto,'x',{value:42,writable:false,configurable:true});
try{store(Object.create(proto),8);throw Error('missing error');}catch(e){check(e instanceof TypeError);trace.push('readonly');}
delete proto.x;
var upper=Object.create(null);Object.setPrototypeOf(proto,upper);
for(var i=0;i<100;i++)check(store(Object.create(proto),i)===i);
Object.defineProperty(upper,'x',{set:function(v){trace.push('upper:'+v);},configurable:true});
store(Object.create(proto),9);delete upper.x;
var other={x:44};Object.setPrototypeOf(proto,other);
check(store(Object.create(proto),10)===10);check(other.x===44);
var closed=Object.preventExtensions(Object.create(proto));
try{store(closed,1);throw Error('missing error');}catch(e){check(e instanceof TypeError);trace.push('closed');}
var own={x:3};check(store(own,5)===5);delete own.x;check(store(own,6)===6);
Object.defineProperty(own,'x',{get:function(){return 70;},configurable:true});
try{store(own,1);throw Error('missing error');}catch(e){check(e instanceof TypeError);trace.push('getter');}
var calls=0;var proxy=new Proxy({}, {set:function(t,k,v,r){calls++;return Reflect.set(t,k,v,r);}});check(store(proxy,12)===12);check(calls===1);
var throwing=new Proxy({}, {set:function(){throw Error('proxy error');}});
try{store(throwing,2);}catch(e){trace.push(e.message);}
var unhash={a:1};delete unhash.a;Object.defineProperty(unhash,'z',{get:function(){return 1;}});
for(var i=0;i<100;i++){var q=Object.create(unhash);check(store(q,i)===i);}
for(var n=0;n<20;n++){var p={};var tmp=Object.create(p);store(tmp,n);p.cycle=tmp;}
if(typeof std!=='undefined')std.gc();
trace.push('PASS');print(JSON.stringify(trace));
