var out=[],events=[],depth=0;
function Wrap(){this.setup.apply(this,arguments);}
function Init(a,b){this.args=[arguments.length,a,b,arguments[3]];a=91;this.changed=arguments[0];}
Wrap.prototype.setup=Init;
for(var i=0;i<24;i++){var o=new Wrap(i,2,3,4);out.push(o.args,o.changed);}
out.push((new Wrap()).args,(new Wrap(1)).args);
var nativeApply=Function.prototype.apply;
Init.apply=function(t,a){events.push(a.length,a[0],a.callee===Wrap);return nativeApply.call(Init,t,a);};out.push((new Wrap(7,8,9)).args);delete Init.apply;
Object.defineProperty(Wrap.prototype,'setup',{configurable:true,get:function(){events.push('get-target');return Init;}});out.push((new Wrap(1,2)).args);
Object.defineProperty(Wrap.prototype,'setup',{configurable:true,writable:true,value:Init});
Object.defineProperty(Init,'apply',{configurable:true,get:function(){events.push('get-apply');return nativeApply;}});out.push((new Wrap(3,4)).args);delete Init.apply;
Function.prototype.apply=function(t,a){events.push('custom-native-slot');return nativeApply.call(this,t,a);};out.push((new Wrap(5,6)).args);Function.prototype.apply=nativeApply;
var proxy=new Proxy(Init,{apply:function(t,r,a){events.push('proxy-target');return Reflect.apply(t,r,a);}});Wrap.prototype.setup=proxy;out.push((new Wrap(7)).args);Wrap.prototype.setup=Init;
var proto=Wrap.prototype;Wrap.prototype=new Proxy({setup:Init},{get:function(t,k,r){events.push(k);return Reflect.get(t,k,r);}});out.push((new Wrap(8)).args);Wrap.prototype=proto;
function Rec(a){if(!depth){depth++;Rec.apply(this);depth--;}events.push(arguments.length);this.v=a;}
Wrap.prototype.setup=Rec;for(i=0;i<8;i++)new Wrap(1,2,3);
Wrap.prototype.setup=function(){throw marker;};var marker={};try{new Wrap(1);}catch(e){out.push(e===marker);}
Wrap.prototype.setup=function(){throw Error('stack');};try{new Wrap(1);}catch(e){out.push(/apply/.test(e.stack),/Wrap/.test(e.stack));}
Wrap.prototype.setup=Init;var receiver={setup:Init};Wrap.call(receiver,7,8);out.push(receiver.args);out.push(events);print(JSON.stringify(out));
