(function () {
  var checks=0;
  function eq(a,b){checks++;if(a!==b)throw Error('v2check '+checks+': '+String(a)+' / '+String(b));}
  function read(o,k){if(k===0)return o.x;if(k===1)return o.y;return o.z;}
  function readAgain(o){return o.x;}
  var x={x:3,y:5,z:7}, y={pad:99,x:11,y:13,z:17};
  for(var i=0;i<1000;i++){
    eq(read(x,0),3);eq(read(x,1),5);eq(read(x,2),7);
    eq(read(y,0),11);eq(readAgain(y),11);
  }
  x.x={a:19};eq(read(x,0).a,19);
  delete x.x;eq(read(x,0),undefined);x.x=23;eq(read(x,0),23);
  for(var j=0;j<80;j++){x['t'+j]=j;eq(read(x,0),23);delete x['t'+j];}
  Object.defineProperty(x,'x',{configurable:true,get:function(){return this.y+31;}});eq(read(x,0),36);
  Object.defineProperty(x,'x',{configurable:true,writable:false,value:41});eq(read(x,0),41);
  var sym=Symbol('field');x[sym]=43;eq(x[sym],43);delete x[sym];eq(x[sym],undefined);
  var parent={x:47}, child=Object.create(parent);eq(readAgain(child),47);parent.x=53;eq(readAgain(child),53);
  child.x=59;eq(readAgain(child),59);delete child.x;eq(readAgain(child),53);
  Object.setPrototypeOf(child,{x:61});eq(readAgain(child),61);
  var arr=[1,2];arr.x=67;eq(readAgain(arr),67);
  var ta=new Uint8Array(3);ta.x=71;eq(readAgain(ta),71);
  var target={x:73}, count=0;
  var proxy=new Proxy(target,{get:function(o,k,r){count++;return Reflect.get(o,k,r);}});
  eq(readAgain(proxy),73);eq(readAgain(proxy),73);eq(count,2);
  function method(o){return o.step(3);}
  var obj={bias:79,step:function(n){return this.bias+n;}};eq(method(obj),82);
  var bad=false;try{readAgain(null);}catch(e){bad=e instanceof TypeError;}eq(bad,true);
  for(var q=0;q<200;q++){var o={x:q};eq(readAgain(o),q);}
  function* gen(o){yield o.x;return o.y;}
  var it=gen({x:83,y:89});eq(it.next().value,83);eq(it.next().value,89);eq(it.next().done,true);
  (async function(){return readAgain({x:97});})().then(function(v){eq(v,97);console.log('V2_ASYNC_PASS');});
  console.log('V2_SEMANTIC_PASS:'+checks);
})();
