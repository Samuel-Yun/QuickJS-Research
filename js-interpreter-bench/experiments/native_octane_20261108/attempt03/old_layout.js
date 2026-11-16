/* Mixed record kinds, prototype-to-own transitions, and compound assignments. */
(function(){
 function eq(a,b){if(a!==b)throw Error('layout semantics '+a+'/'+b);}
 function mixed(o){return o.a+o.b+o.c+o.step();}
 function method(o){return o.step();}
 function read(o){return o.a;}
 var proto={step:function(){return this.a+1;}},o=Object.create(proto);
 o.a=1;o.b=2;o.c=3;
 for(var i=0;i<256;i++){eq(mixed(o),8);eq(method(o),2);eq(read(o),1);}
 o.step=function(){return 17;};eq(mixed(o),23);eq(method(o),17);
 delete o.step;eq(mixed(o),8);eq(method(o),2);
 Object.defineProperty(proto,'step',{get:function(){this.b=9;return function(){return this.c;};},configurable:true});
 eq(method(o),3);eq(mixed(o),16);
 Object.setPrototypeOf(o,{step:function(){return 19;}});eq(mixed(o),32);
 var p={x:1},child=Object.create(p);
 function increment(obj){obj.x+=1;return obj.x;}
 for(i=0;i<64;i++)eq(increment(child),i+2);
 eq(p.x,1);delete child.x;eq(increment(child),2);
 var caught=false,prox=new Proxy(o,{get:function(t,k,r){if(k==='step')throw Error('proxy');return Reflect.get(t,k,r);}});
 try{mixed(prox);}catch(e){caught=e.message==='proxy';}eq(caught,true);
 for(i=0;i<100;i++){
   var a={a:i,b:2,c:3,step:function(){return 7;}};
   eq(mixed(a),i+12);delete a.step;
   Object.setPrototypeOf(a,{step:function(){return 11;}});eq(mixed(a),i+16);
 }
 print('LAYOUT_SEMANTICS_PASS');
})();
