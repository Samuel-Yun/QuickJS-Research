'use strict';
var out=[];
function f(a,i,start){var s=start;s+=a[i];i=0;return s;}
var a=[3,7];for(var i=0;i<32;i++)out.push(f(a,i&1,11));
a[0]=19;out.push(f(a,0,11));a[0]=1.5;out.push(f(a,0,11));a[0]='hi';out.push(f(a,0,11));
a[0]=1;out.push(f(a,0,2147483647),1/f([0],0,-0));
a[-1]=31;a['0.5']=13;out.push(f(a,-1,2),f(a,'0',2),f(a,.5,2),String(f(a,99,2)));
delete a[0];var count=0;Object.defineProperty(Array.prototype,'0',{configurable:true,get:function(){count++;return 29;},set:function(v){Object.defineProperty(this,'0',{configurable:true,writable:true,enumerable:true,value:v});}});
var inherited=f(a,0,2);delete Array.prototype[0];out.push(inherited,count);
Object.defineProperty(a,'0',{configurable:true,get:function(){count++;return 41;}});out.push(f(a,0,2),count);
var marker={};Object.defineProperty(a,'0',{configurable:true,get:function(){throw marker;}});try{f(a,0,2);}catch(e){out.push(e===marker);}
var proxy=new Proxy([4],{get:function(t,k,r){out.push('get:'+k);return Reflect.get(t,k,r);}});out.push(f(proxy,0,3));
out.push(String(f([1n],0,2n)));try{f([1n],0,2);}catch(e){out.push(e instanceof TypeError);}
function tricky(a){var s=3;function mutate(){s=99;return 0;}s+=a[mutate()];a=null;return s;}
for(i=0;i<8;i++)out.push(tricky([4]));
function temporary(){var s=2;s+=[5][0];var t=0;return s+t;}out.push(temporary());
out.push(f(new Uint8Array([8]),0,3),String(f(new Uint8Array([8]),4,3)));
var buf=new ArrayBuffer(4,{maxByteLength:8}),ta=new Uint8Array(buf);ta[0]=7;out.push(f(ta,0,3));
if(typeof buf.resize==='function'){buf.resize(0);out.push(String(f(ta,0,3)));buf.resize(8);out.push(f(ta,0,3));}
if(typeof buf.transfer==='function'){buf.transfer();out.push(String(f(ta,0,3)));}
print(JSON.stringify(out));
