/* Focused chain and read-feedback-sharing write semantics. */
(function(){
 function eq(a,b){if(a!==b)throw Error('new IC semantics '+a+'/'+b);}
 function chain(o){return o.a.b;}
 function localChain(arg){var o=arg;return o.a.b;}
 function write(o,v){var old=o.x;o.x=v;return old;}
 function increment(o){o.x++;return o.x;}
 var o={a:{b:7},x:1};
 for(var i=0;i<200;i++){eq(chain(o),7);eq(localChain(o),7);eq(write(o,i),i?i-1:1);}
 o.a.b=11;eq(chain(o),11);o.a={pad:0,b:13};eq(chain(o),13);
 Object.defineProperty(o.a,'b',{get:function(){o.x++;return 17;},configurable:true});eq(chain(o),17);
 Object.defineProperty(o,'a',{get:function(){return {b:19};},configurable:true});eq(localChain(o),19);
 var hits=0,prox=new Proxy({a:{b:23},x:3},{get:function(t,k,r){hits++;return Reflect.get(t,k,r);},set:function(t,k,v,r){hits++;return Reflect.set(t,k,v,r);}});
 eq(chain(prox),23);eq(write(prox,5),3);eq(hits,3);
 var inner=new Proxy({b:29},{get:function(t,k){hits++;return t[k];}});eq(chain({a:inner}),29);
 var failed=0;try{chain({a:null});}catch(e){failed++;}eq(failed,1);
 var p={x:31},child=Object.create(p);eq(write(child,37),31);eq(child.x,37);eq(p.x,31);
 for(i=0;i<100;i++)eq(increment(child),38+i);
 Object.defineProperty(child,'x',{value:41,writable:false,configurable:true});
 eq(write(child,43),41);eq(child.x,41);
 function strictWrite(o,v){'use strict';var x=o.x;o.x=v;return x;}
 try{strictWrite(child,47);}catch(e){failed++;}eq(failed,2);
 var seen=0,setter={get x(){return 53;},set x(v){seen=v;}};
 eq(write(setter,59),53);eq(seen,59);
 function reentrant(o,v){var a=o.x;o.x=v;return a;}
 var re={x:61};Object.defineProperty(re,'x',{get:function(){Object.defineProperty(re,'x',{value:67,writable:true,configurable:true});return 61;},configurable:true});
 eq(reentrant(re,71),61);eq(re.x,71);
 var frozen=Object.freeze({x:73});eq(write(frozen,79),73);eq(frozen.x,73);
 for(i=0;i<100;i++){var q={x:i};eq(write(q,i+1),i);delete q.x;eq(write(q,i+2),undefined);}
 var arr=[1,2,3];function len(a,v){var old=a.length;a.length=v;return old;}eq(len(arr,1),3);eq(arr.length,1);
 function* gen(a){yield a.a.b;yield write(a,83);}
 var g=gen({a:{b:89},x:97});eq(g.next().value,89);eq(g.next().value,97);
 var f=eval('(function(o,v){var x=o.x;o.x=v;return o.a.b+x;})');eq(f({x:2,a:{b:3}},5),5);
 print('CHAIN_SHARED_STORE_SEMANTICS_PASS');
})();
