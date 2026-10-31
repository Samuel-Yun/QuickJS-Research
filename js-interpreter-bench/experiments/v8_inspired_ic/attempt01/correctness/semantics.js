/* Same source/independent expectations on A, E, frozen d8; no engine branch. */
(function(){
  var checks=0, scenes=0;
  function eq(a,b){checks++;if(!Object.is(a,b))throw Error('check '+checks+': '+a+' !== '+b);}
  function hot(f,o,want){for(var i=0;i<40;i++)eq(f(o),want);}
  function read(o){return o.x;}
  function method(o){return o.step(4);}
  function store(o,v){o.x=v;return o.x;}
  scenes++; var o={x:3};hot(read,o,3);o.x=12;hot(read,o,12);
  o.x={token:1};hot(read,o,o.x);o.x=NaN;hot(read,o,NaN);
  o.x=1.25;hot(read,o,1.25);o.x='str';hot(read,o,'str');
  scenes++; var shapes=[];
  for(var k=0;k<8;k++){var a={};a['s'+k]=k;a.x=k+10;shapes.push(a);}
  function poly(o){return o.x;}
  for(var count of [1,2,4,5,8])for(var i=0;i<160;i++)eq(poly(shapes[i%count]),i%count+10);
  scenes++; var p={x:11,step:function(v){return this.bias+v;}}, child=Object.create(p);child.bias=3;
  hot(read,child,11);hot(method,child,7);p.x=13;hot(read,child,13);
  p.step=function(v){return this.bias*v;};hot(method,child,12);
  child.x=17;hot(read,child,17);delete child.x;hot(read,child,13);
  delete p.x;hot(read,child,undefined);p.x=21;hot(read,child,21);
  scenes++; var top={x:7}, mid=Object.create(top), leaf=Object.create(mid);
  hot(read,leaf,7);mid.x=8;hot(read,leaf,8);delete mid.x;hot(read,leaf,7);
  Object.setPrototypeOf(mid,{x:9});hot(read,leaf,9);
  Object.setPrototypeOf(leaf,{x:10});hot(read,leaf,10);
  scenes++;var deep={x:31};for(var i=0;i<7;i++)deep=Object.create(deep);hot(read,deep,31);
  scenes++;var marker={},calls=0;
  Object.defineProperty(p,'x',{get:function(){calls++;eq(this,child);return this.bias+30;},configurable:true});
  hot(read,child,33);eq(calls,40);
  Object.defineProperty(p,'x',{value:19,writable:true,configurable:true});hot(read,child,19);
  Object.defineProperty(p,'x',{get:function(){eq(this,child);throw marker;},configurable:true});
  for(var i=0;i<16;i++){try{read(child);throw Error('missing throw');}catch(e){eq(e,marker);}}
  scenes++;var re={x:4}, proxyCount=0;
  var proxy=new Proxy(re,{get:function(t,key,receiver){proxyCount++;return Reflect.get(t,key,receiver);}});
  hot(read,proxy,4);eq(proxyCount,40);
  var proxyProto=new Proxy({x:81},{get:function(t,key,receiver){eq(receiver,pc);return 82;}}),pc=Object.create(proxyProto);
  hot(read,pc,82);
  scenes++;var target={x:0};for(var i=0;i<160;i++)eq(store(target,i),i);
  Object.defineProperty(target,'x',{writable:false});
  function strictWrite(obj){'use strict';obj.x=91;}
  var strict=false;try{strictWrite(target);}catch(e){strict=e instanceof TypeError;}eq(strict,true);eq(target.x,159);
  function sloppyWrite(obj){obj.x=92;return obj.x;}hot(sloppyWrite,target,159);
  scenes++;var st=Object.create({});var observed=0;
  Object.defineProperty(Object.getPrototypeOf(st),'x',{set:function(v){eq(this,st);observed=v;},configurable:true});
  for(var i=0;i<40;i++){store(st,i);eq(observed,i);}eq(Object.hasOwn(st,'x'),false);
  Object.defineProperty(st,'x',{value:6,writable:true,configurable:true});hot(read,st,6);
  scenes++;var trap=0, ps=new Proxy({x:0},{set:function(t,key,v,r){trap++;return Reflect.set(t,key,v,r);}});
  for(var i=0;i<40;i++)eq(store(ps,i),i);eq(trap,40);
  scenes++;var obj={bias:3,step:function(x){return this.bias+x;}};hot(method,obj,7);obj.step=4;
  try{method(obj);throw Error('not callable');}catch(e){eq(e instanceof TypeError,true);}
  scenes++;function separate(o){return [o.a,o.a];}for(var i=0;i<40;i++){var r=separate({a:i});eq(r[0],i);eq(r[1],i);}
  for(var j=0;j<40;j++){var compiled=Function('o','return o.x');hot(compiled,{x:j},j);}
  scenes++;var keyed={a:3,b:5},keyCalls=0,key={toString:function(){keyCalls++;return 'a';}};
  function kr(o,k){return o[k];}function kw(o,k,v){o[k]=v;return o[k];}
  eq(kr(keyed,key),3);eq(keyCalls,1);eq(kw(keyed,'b',7),7);
  var array=[1,,3];eq(kr(array,1),undefined);eq(kw(array,5,9),9);eq(array.length,6);
  scenes++;eq(typeof eicMissingBinding,'undefined');
  try{Function('return eicMissingBinding')();throw Error('not missing');}catch(e){eq(e instanceof ReferenceError,true);}
  try{Function('"use strict";eicMissingBinding=1')();throw Error('not strict');}catch(e){eq(e instanceof ReferenceError,true);}
  try{Function('return x;let x=1')();throw Error('not TDZ');}catch(e){eq(e instanceof ReferenceError,true);}
  scenes++;var unhash={x:2};Object.defineProperty(unhash,'x',{enumerable:false});hot(read,unhash,2);
  Object.defineProperty(unhash,'x',{get:function(){return 23;},configurable:true});hot(read,unhash,23);
  scenes++;var frozen=Object.freeze({x:6});hot(read,frozen,6);hot(sloppyWrite,frozen,6);
  eq(read('abc'),undefined);try{read(null);throw Error('null');}catch(e){eq(e instanceof TypeError,true);}
  console.log('EIC_SEMANTICS_PASS '+JSON.stringify({scenes:scenes,assertions:checks}));
})();
