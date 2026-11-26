(function () {
  function check(ok) { if (!ok) throw Error('call targeted'); }
  var p = {m: function () { return this.value; }}, o = Object.create(p); o.value = 7;
  function zero(o) { return o.m(); }
  for (var i=0;i<32;i++) check(zero(o) === 7);
  p.m = function () { return this.value + 1; }; check(zero(o) === 8);
  o.m = function () { return 10; }; check(zero(o) === 10); delete o.m;
  check(zero(o) === 8);
  var count=0;
  Object.defineProperty(p,'m',{get:function(){count++;return function(){return 13;};},configurable:true});
  check(zero(o) === 13 && count===1);
  Object.defineProperty(p,'m',{value:function(x){return x+1;},writable:true,configurable:true});
  function argument(){p.m=function(x){return x+100;};return 5;}
  check(o.m(argument())===6); check(o.m(5)===105);
  p.m=1;try{zero(o);check(false);}catch(e){check(e instanceof TypeError);}
  p.m=function(){delete p.m; return this.value;};check(zero(o)===7);
  p.m=function(){throw Error('method throw');};
  try{zero(o);check(false);}catch(e){check(e.message==='method throw');}
  p.m=function(){return null;};check(zero(o)===null);
  var token={};p.m=function(){return token;};check(zero(o)===token);
  print('V6_CALL_TARGETED_PASS');
})();
