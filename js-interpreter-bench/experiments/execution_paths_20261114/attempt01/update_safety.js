'use strict';
var tests=0;
function eq(a,b){tests++;if(!Object.is(a,b))throw Error(String(a)+' != '+String(b));}
function inc(o){o.x++;}
function plus(o){o.x+=1;}
function post(o){return o.x++;}
function pre(o){return ++o.x;}
var o={x:0};for(var i=0;i<100;i++){inc(o);eq(o.x,i+1);}
o.x='7';inc(o);eq(o.x,8);o.x='7';plus(o);eq(o.x,'71');
o.x=2147483647;inc(o);eq(o.x,2147483648);o.x=2.5;inc(o);eq(o.x,3.5);
o.x=1n;inc(o);eq(o.x,2n);
eq(post({x:5}),5);eq(pre({x:5}),6);
var gets=0,sets=0,value=0;
Object.defineProperty(o,'x',{configurable:true,get:function(){gets++;return '9';},set:function(v){sets++;value=v;}});
inc(o);eq(gets,1);eq(sets,1);eq(value,10);
Object.defineProperty(o,'x',{configurable:true,writable:true,value:1});for(var i=0;i<20;i++)inc(o);
Object.defineProperty(o,'x',{configurable:true,writable:false,value:9});var thrown=false;try{inc(o);}catch(e){thrown=e instanceof TypeError;}eq(thrown,true);eq(o.x,9);
var target={x:3},traps=[];var p=new Proxy(target,{get:function(t,k,r){traps.push('g');return Reflect.get(t,k,r);},set:function(t,k,v,r){traps.push('s');return Reflect.set(t,k,v,r);}});
inc(p);eq(target.x,4);eq(traps.join(''),'gs');
var proto={x:4},child=Object.create(proto);inc(child);eq(child.x,5);eq(proto.x,4);
function Branch(o,b){if(b)o.x++;else o.x=100;return o.x;}
eq(Branch({x:1},false),100);eq(Branch({x:1},true),2);
print('UPDATE_SAFETY_PASS '+tests);
