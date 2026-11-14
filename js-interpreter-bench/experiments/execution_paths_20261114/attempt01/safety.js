'use strict';
var checks=0;
function eq(a,b,label){ checks++;if(!Object.is(a,b))throw Error(label+': '+String(a)+' != '+String(b)); }
function rmw(o){o.x=o.x+1;}
function rmwReturn(o){o.x=o.x+1;return o.x;}
function rmwTwo(o){o.x=o.x+2;}
function localRmw(a){var o=a; o.x=o.x+1;return o.x;}
function sumLoop(n,seed){var s=seed;for(var i=0;i<n;i++)s+=i;return s;}
function constantLoop(){var s=0;for(var i=0;i<16;i++)s+=i;return s;}
function reference(n,seed){var s=seed;for(var i=0;i<n;i++){s=s+i;}return s;}

var o={x:0,pad:0};
for(var j=0;j<30;j++){rmw(o);eq(o.x,j+1,'int32 RMW');}
for(var j=0;j<15;j++)eq(localRmw(o),31+j,'local RMW');
eq(rmwReturn(o),46,'return continuation');
rmwTwo(o);eq(o.x,48,'constant 2 fallback');
o.x=2147483647;rmw(o);eq(o.x,2147483648,'int32 positive overflow');
o.x=-2147483648;rmw(o);eq(o.x,-2147483647,'int32 lower bound');
o.x='a';rmw(o);eq(o.x,'a1','string addition');
o.x=1.5;rmw(o);eq(o.x,2.5,'float addition');
o.x=NaN;rmw(o);eq(o.x,NaN,'NaN');
o.x=-0;rmw(o);eq(o.x,1,'negative zero');
o.x=undefined;rmw(o);eq(o.x,NaN,'undefined');
o.x=null;rmw(o);eq(o.x,1,'null');
o.x={valueOf:function(){return 8;}};rmw(o);eq(o.x,9,'ToPrimitive');
var threw=false;o.x=1n;try{rmw(o);}catch(e){threw=e instanceof TypeError;}eq(threw,true,'BigInt mixed add');
o.x=2;
var getCount=0,setCount=0,setValue=0;
Object.defineProperty(o,'x',{configurable:true,get:function(){getCount++;return 7;},set:function(v){setCount++;setValue=v;}});
rmw(o);eq(getCount,1,'getter once');eq(setCount,1,'setter once');eq(setValue,8,'setter value');
Object.defineProperty(o,'x',{configurable:true,writable:true,value:5});
for(var j=0;j<10;j++)rmw(o);
Object.defineProperty(o,'x',{configurable:true,writable:false,value:100});
threw=false;try{rmw(o);}catch(e){threw=e instanceof TypeError;}eq(threw,true,'readonly');eq(o.x,100,'readonly unchanged');
Object.defineProperty(o,'x',{configurable:true,writable:true,value:1});
for(var j=0;j<20;j++)o['p'+j]=j;
rmw(o);eq(o.x,2,'shape growth');
delete o.x;rmw(o);eq(o.x,NaN,'deleted field');
var proto={x:10};var child=Object.create(proto);rmw(child);eq(child.x,11,'inherited data');eq(proto.x,10,'prototype unchanged');
var target={x:3},traps=[];
var proxy=new Proxy(target,{get:function(t,k,r){traps.push('get:'+k);return Reflect.get(t,k,r);},set:function(t,k,v,r){traps.push('set:'+k);return Reflect.set(t,k,v,r);}});
rmw(proxy);eq(target.x,4,'proxy value');eq(traps.join(','),'get:x,set:x','proxy order');
var throwing={};var sentinel={};Object.defineProperty(throwing,'x',{get:function(){throw sentinel;}});
var caught;try{rmw(throwing);}catch(e){caught=e;}eq(caught,sentinel,'throwing getter');
for(var j=0;j<10;j++)eq(eval('(function(o){o.x=o.x+1;return o.x;})')({x:j}),j+1,'eval cold');
// Legal branch paths before/after the recognized sequence.
function branch(o,yes){if(yes)o.x=o.x+1;else o.x=40;return o.x;}
eq(branch({x:1},false),40,'branch else');eq(branch({x:1},true),2,'branch then');
// Force wide slot operands without matching source text in the engine.
var declarations=[];for(var j=0;j<8;j++)declarations.push('v'+j+'='+j);
var wide=Function('a','var '+declarations.join(',')+',o=a;o.x=o.x+1;return o.x+v0;');
for(var j=0;j<12;j++)eq(wide({x:j}),j+1,'wide local slot');

for(var n of [0,1,2,16,100,500,10000,100000]) {
    eq(sumLoop(n,0),reference(n,0),'integer loop '+n);
    eq(sumLoop(n,1.5),reference(n,1.5),'nonint accumulator '+n);
}
eq(sumLoop(4,2147483646),2147483652,'accumulator overflow');
eq(sumLoop(4,'x'),'x0123','string accumulator fallback');
eq(sumLoop(3.5,0),6,'float bound fallback');
eq(sumLoop(-2,7),7,'negative bound');
eq(constantLoop(),120,'constant bound');
function captured(n){var s=0;function get(){return s;}for(var i=0;i<n;i++)s+=i;return get();}
eq(captured(20),190,'captured accumulator');
function breakLoop(n){var s=0;for(var i=0;i<n;i++){if(i==4)break;s+=i;}return s;}
eq(breakLoop(100),6,'break not matched');
print('EXECUTION_SAFETY_PASS '+checks);
