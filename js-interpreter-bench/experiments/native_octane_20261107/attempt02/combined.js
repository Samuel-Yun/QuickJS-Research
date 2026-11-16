/* Interaction checks for prepared borrowed own loads and inherited calls. */
(function () {
  function eq(a,b) { if(a!==b)throw Error('combined mismatch '+a+'/'+b); }
  function own(o) { return o.x; }
  function local(o) { var p=o; return p.x; }
  function invoke(o) { return o.step(); }
  function mixed(o) { return o.x+o.step(); }
  var proto={step:function(){return this.x+1;}},o=Object.create(proto);o.x=7;
  for(var i=0;i<256;i++){eq(own(o),7);eq(local(o),7);eq(invoke(o),8);eq(mixed(o),15);}
  o.x=11;eq(mixed(o),23);
  proto.step=function(){return this.x+3;};eq(mixed(o),25);
  o.step=function(){return 31;};eq(mixed(o),42);delete o.step;eq(mixed(o),25);
  Object.defineProperty(proto,'step',{configurable:true,get:function(){
    this.x=41;return function(){return this.x+5;};
  }});
  eq(invoke(o),46);eq(own(o),41);
  Object.defineProperty(o,'x',{configurable:true,get:function(){return 53;}});eq(mixed(o),111);
  delete o.x;o.x=7;
  Object.setPrototypeOf(o,{step:function(){return 19;}});eq(mixed(o),26);
  var proxy=new Proxy({x:23,step:function(){return this.x;}},{get:function(t,k,r){return Reflect.get(t,k,r);}});
  eq(own(proxy),23);eq(mixed(proxy),46);
  for(i=0;i<32;i++) {
    var a={x:i},b={pad:1,x:i+1};eq(own(a),i);eq(own(b),i+1);
    Object.defineProperty(a,'x',{get:function(){throw Error('expected getter');}});
    var caught=false;try{own(a);}catch(e){caught=e.message==='expected getter';}eq(caught,true);
  }
  for(i=0;i<2;i++){var caught=false;try{own(i?undefined:null);}catch(e){caught=e instanceof TypeError;}eq(caught,true);}
  print('COMBINED_SEMANTICS_PASS');
})();
