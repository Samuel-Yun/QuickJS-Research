function assert(x){if(!x)throw Error('check');}
function make(){return function(){this.boot.apply(this,arguments);};}
function normalized(a,b,c){if(!a)a=0.0;if(!b)b=0.0;if(!c)c=0.0;this.alpha=a;this.beta=b;this.gamma=c;}
function inline(a,b,c){this.alpha=a?a:0;this.beta=b?b:0;this.gamma=c?c:0;}
var C=make(),D=make();C.prototype.boot=normalized;D.prototype.boot=inline;
function create(K,a,b,c,d){return new K(a,b,c,d);}
var out=[];
if(typeof __ep_begin==='function')__ep_begin();
for(var j=0;j<300;j++){
 var o=create(j&1?C:D,3,5,7);assert(o.alpha===3&&o.beta===5&&o.gamma===7);
}
for(var k=0;k<2;k++)for(var v of [0,-0,NaN,Infinity,-Infinity,1e-300,undefined,null,false,'',true,'9']){
 var K=k?C:D,o=create(K,v,v,v,{unused:1});
 var expect=v?v:0;
 assert(Object.is(o.alpha,expect)&&Object.is(o.beta,expect)&&Object.is(o.gamma,expect));
 out.push(typeof expect==='number'?String(expect):typeof expect+':'+expect);
}
for(var i=0;i<100;i++)create(C,3,5,7);
var old=C.prototype.boot;
C.prototype.boot=function(a,b,c){this.alpha=c?c:0;this.beta=a?a:0;this.gamma=b?b:0;};
var x=create(C,3,5,7);assert(x.alpha===7&&x.beta===3&&x.gamma===5);C.prototype.boot=old;
var getter=0;
Object.defineProperty(C.prototype,'boot',{get:function(){getter++;return old;},configurable:true});
assert(create(C,3,5,7).gamma===7&&getter===1);
Object.defineProperty(C.prototype,'boot',{value:old,writable:true,configurable:true});
var apply=Function.prototype.apply,applies=0;
Function.prototype.apply=function(t,a){applies++;return Reflect.apply(apply,this,[t,a]);};
assert(create(C,3,5,7).alpha===3&&applies===1);Function.prototype.apply=apply;
var sets=0;
Object.defineProperty(C.prototype,'alpha',{set:function(v){sets+=v;},configurable:true});
assert(!Object.prototype.hasOwnProperty.call(create(C,3,5,7),'alpha')&&sets===3);delete C.prototype.alpha;
Object.defineProperty(C.prototype,'alpha',{value:101,writable:false,configurable:true});
assert(create(C,3,5,7).alpha===101);delete C.prototype.alpha;
var P=make();P.prototype={boot:inline};var p=Reflect.construct(C,[3,5,7],P);assert(Object.getPrototypeOf(p)===P.prototype&&p.gamma===7);
var originalProto=C.prototype;C.prototype={boot:inline};assert(Object.getPrototypeOf(create(C,1,2,3))===C.prototype);C.prototype=originalProto;
old.apply=function(){throw Error('apply changed');};try{create(C,1,2,3);throw Error('missing exception');}catch(e){assert(e.message==='apply changed');}delete old.apply;
if(typeof __ep_end==='function')__ep_end();
print(JSON.stringify({values:out,getter:getter,setter:sets,apply:applies,pass:true}));
