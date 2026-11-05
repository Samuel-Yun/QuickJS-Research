(function () {
  var assertions = 0;
  function eq(a,b) { assertions++; if (a !== b) throw Error('check '+assertions+': '+String(a)+' != '+String(b)); }
  function read(o) { return o.x; }
  function method(o) { return o.step(7); }
  var a={x:1}, b={padding:2,x:3}, c={x:4,padding:2};
  for(var i=0;i<2000;i++){eq(read(a),1);eq(read(b),3);eq(read(c),4);}
  a.x=19;eq(read(a),19);a.x={tag:23};eq(read(a).tag,23);
  a.y=3;eq(read(a).tag,23);delete a.x;eq(read(a),undefined);
  Object.defineProperty(a,'x',{configurable:true,get:function(){return this.y+1;}});eq(read(a),4);
  Object.defineProperty(a,'x',{configurable:true,writable:true,value:25});eq(read(a),25);
  var proto={x:31}, child=Object.create(proto);eq(read(child),31);proto.x=32;eq(read(child),32);
  child.x=33;eq(read(child),33);delete child.x;eq(read(child),32);
  Object.setPrototypeOf(child,{x:34});eq(read(child),34);
  var calls=0, proxy=new Proxy({x:41},{get:function(t,k,r){calls++;return Reflect.get(t,k,r);}});
  eq(read(proxy),41);eq(read(proxy),41);eq(calls,2);
  var thrown=false;Object.defineProperty(a,'x',{configurable:true,get:function(){throw Error('expected');}});
  try {read(a);} catch(e){thrown=e.message==='expected';}eq(thrown,true);
  var p={step:function(x){return this.bias+x;}}, o=Object.create(p);o.bias=3;eq(method(o),10);
  o.step=function(x){return this.bias-x;};eq(method(o),-4);delete o.step;eq(method(o),10);
  var arr=[1,2];arr.x=51;eq(read(arr),51);
  var fixed=Object.freeze({x:61});eq(read(fixed),61);
  for(var j=0;j<1000;j++){var temp={x:{value:j}};eq(read(temp).value,j);}
  console.log('CHECKS_PASS:'+assertions);
})();
