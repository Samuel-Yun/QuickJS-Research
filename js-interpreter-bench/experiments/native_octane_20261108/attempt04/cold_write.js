/* Static feedback hints remain safe when the preceding read is skipped. */
(function(){
 function eq(a,b){if(a!==b)throw Error('cold hint '+a+'/'+b);}
 function conditional(o,v,read){if(read)o.x;o.x=v;return v;}
 function strictConditional(o,v,read){'use strict';if(read)o.x;o.x=v;return v;}
 var a={x:1},b={pad:1,x:2};
 for(var i=0;i<100;i++){eq(conditional(a,i,true),i);eq(a.x,i);eq(conditional(b,i,false),i);eq(b.x,i);eq(b.pad,1);}
 var errors=0;
 for(var x of [null,undefined]){
  try{conditional(x,7,false);}catch(e){if(!(e instanceof TypeError))throw e;errors++;}
 }
 for(x of [0,1,false,true,'string']){
  eq(conditional(x,11,false),11);
  try{strictConditional(x,13,false);}catch(e){if(!(e instanceof TypeError))throw e;errors++;}
 }
 eq(errors,7);
 var ro=Object.freeze({x:17});eq(conditional(ro,19,false),19);eq(ro.x,17);
 var p={get x(){return 23;},set x(v){this.saved=v;}};var child=Object.create(p);
 conditional(child,29,false);eq(child.saved,29);eq(child.x,23);
 print('COLD_SHARED_WRITE_PASS');
})();
