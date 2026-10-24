(function () {
  var assertions=0;
  function ok(b){++assertions;if(!b)throw Error('read semantics '+assertions);}
  function read(o){return o.x;}
  var anchor={},a={x:3},b={x:4};
  for(var i=0;i<32;i++){ok(read(a)===3);ok(read(b)===4);}
  a.x=anchor;for(i=0;i<32;i++)ok(read(a)===anchor);
  a.x='new';ok(read(a)==='new');delete a.x;ok(read(a)===undefined);
  var gets=0;Object.defineProperty(a,'x',{configurable:true,get:function(){gets++;return anchor;}});
  for(i=0;i<16;i++)ok(read(a)===anchor);ok(gets===16);
  var traps=0,p=new Proxy({x:7},{get:function(t,k){traps++;return t[k];}});
  for(i=0;i<16;i++)ok(read(p)===7);ok(traps===16);
  var throws=0;Object.defineProperty(a,'x',{get:function(){throws++;throw Error('sentinel');}});
  for(i=0;i<8;i++){try{read(a);ok(false);}catch(e){ok(e.message==='sentinel');}}ok(throws===8);
  function method(x){ok(this===m);return x+this.bias;}
  function caller(o,x){return o.step(x);}
  var m={bias:3,step:method};for(i=0;i<64;i++)ok(caller(m,i)===i+3);
  var ro={};Object.defineProperty(ro,'x',{value:9,writable:false});
  for(i=0;i<16;i++)ok(read(ro)===9);
  function strictWrite(o){'use strict';o.x=10;}
  try{strictWrite(ro);ok(false);}catch(e){ok(e instanceof TypeError);}ok(read(ro)===9);
  console.log('READ_SEMANTICS_PASS assertions='+assertions+' scenarios=7');
})();
