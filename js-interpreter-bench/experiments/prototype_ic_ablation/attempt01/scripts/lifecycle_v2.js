// Independent bounded H regressions, revision 2; original failed test retained.
var assertions = 0;
function eq(a,b) { assertions++; if (a !== b) throw Error('assert '+assertions); }
function rdDelete(o) { return o.x; }
function rdDescriptor(o) { return o.x; }
function callType(o) { return o.step(2); }
function rdReentry(o) { return o.x; }
function rdShape(o) { return o.x; }
function rdSwap(o) { return o.x; }
var p={x:7},o=Object.create(p);
eq(rdDelete(o),7); eq(rdDelete(o),7);
delete p.x; eq(rdDelete(o),undefined); p.x=9; eq(rdDelete(o),9); eq(rdDelete(o),9);
p={x:5}; o=Object.create(p); eq(rdDescriptor(o),5); eq(rdDescriptor(o),5);
var receiver=o,gets=0;
Object.defineProperty(p,'x',{configurable:true,get:function(){eq(this,receiver);gets++;return 11;}});
eq(rdDescriptor(o),11); eq(gets,1);
Object.defineProperty(p,'x',{value:13,writable:true,configurable:true});
eq(rdDescriptor(o),13); eq(rdDescriptor(o),13);
p={step:function(x){eq(this,receiver);return x+4;}};o=Object.create(p);receiver=o;
eq(callType(o),6);eq(callType(o),6);p.step=42;
var threw=false;try{callType(o);}catch(e){eq(e instanceof TypeError,true);threw=true;}eq(threw,true);
p={x:2};o=Object.create(p);eq(rdReentry(o),2);eq(rdReentry(o),2);
var token={},nested={x:19};
Object.defineProperty(p,'x',{configurable:true,get:function(){
  var v=rdReentry(nested);eq(v,gets===99?23:19);nested.x=23;
  if(gets===99)throw token;return v;
}});
eq(rdReentry(o),19);eq(rdReentry(nested),23);gets=99;
threw=false;try{rdReentry(o);}catch(e){eq(e,token);threw=true;}eq(threw,true);
p={x:3};o=Object.create(p);eq(rdShape(o),3);eq(rdShape(o),3);
p.extra=8;eq(rdShape(o),3);eq(rdShape(o),3);delete p.extra;eq(rdShape(o),3);
o.extra=6;eq(rdShape(o),3);Object.setPrototypeOf(o,Object.create({x:31}));eq(rdShape(o),31);
var proxy=new Proxy({x:41},{get:function(t,k,r){return Reflect.get(t,k,r);}});
Object.setPrototypeOf(o,proxy);eq(rdShape(o),41);
p={x:1};o=Object.create(p);eq(rdSwap(o),1);eq(rdSwap(o),1);
o.x=4;eq(rdSwap(o),4);eq(rdSwap(o),4);delete o.x;eq(rdSwap(o),1);eq(rdSwap(o),1);
for (var j=0;j<320;j++) {
  (function(index){
    var f=Function('o','return o.x;'),holder={x:index};
    holder.fn=f;var obj=Object.create(holder);
    eq(f(obj),index);eq(f(obj),index);
    holder.x=index+1;eq(f(obj),index+1);
  })(j);
}
console.log('H_LIFECYCLE_PASS assertions='+assertions+' cyclic_functions=320');
