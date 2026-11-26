'use strict';
function readX(o){return o.x;}
function readPlain(k,o){return o.x;}
function check(v){if(!v)throw Error('check');}
var out=[],gets=0;
for(var kind=0;kind<5;kind++){
 var o=kind===0?{}:kind===1?function F(){return 1;}:kind===2?/a/g:kind===3?[]:new Uint8Array(4);
 o.x={n:7};var value=o.x;
 for(var i=0;i<100;i++){check(readX(o)===value);check(readPlain(0,o)===value);}
 o.x=9;check(readX(o)===9);
 if(typeof o==='function'){o();check(readX(o)===9);}
 delete o.x;check(readX(o)===undefined);
 Object.defineProperty(o,'x',{get:function(){gets++;return 17;},configurable:true});
 check(readX(o)===17);check(readPlain(0,o)===17);
 delete o.x;Object.setPrototypeOf(o,{x:23});check(readX(o)===23);
 Object.defineProperty(o,'x',{value:31,writable:false,configurable:true});check(readX(o)===31);
 function update(t){t.x=t.x+1;return t.x;}
 try{update(o);throw Error('readonly accepted');}catch(e){check(e instanceof TypeError);}
 out.push(kind);
}
check(gets===10);
var trap=0,p=new Proxy({x:29},{get:function(t,k,r){trap++;return Reflect.get(t,k,r);}});
for(var i=0;i<100;i++)check(readX(p)===29);check(trap===100);
var revoked=Proxy.revocable({x:1},{});revoked.revoke();try{readX(revoked.proxy);throw Error('no throw');}catch(e){check(e instanceof TypeError);}
function numeric(o){return o['0'];}
function large(o){return o['2147483648'];}
var arr=[3],typed=new Uint8Array([5]);var box=new String('z');
for(var i=0;i<50;i++){check(numeric({'0':7})===7);check(numeric(arr)===3);check(numeric(typed)===5);check(numeric(box)==='z');}
arr.length=0;check(numeric(arr)===undefined);arr[0]=11;check(numeric(arr)===11);
var num=Object.create(null);num['2147483648']=13;check(large(num)===13);delete num['2147483648'];check(large(num)===undefined);
// Reads broaden, shared writes must keep their original independent guard.
function increment(o){o.x=o.x+1;return o.x;}
var f=function G(){};f.x=0;for(var i=0;i<100;i++)check(increment(f)===i+1);
var re=/x/;re.x=0;for(var i=0;i<100;i++)check(increment(re)===i+1);
function readLoc0(o,k){var a=o;var b=k+1;return a.x+b;}
check(readLoc0({x:3},2)===6);check(readLoc0(re,2)===103);
for(var i=0;i<40;i++){var cycle=[];cycle.x=cycle;check(readX(cycle)===cycle);}
print(JSON.stringify({out:out,gets:gets,proxy_gets:trap,pass:true}));
