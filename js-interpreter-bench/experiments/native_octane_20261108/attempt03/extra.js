/* New loading forms and call arities, including exceptional and reentrant paths. */
(function(){
 function eq(a,b){if(a!==b)throw Error('experiment semantics '+a+'/'+b);}
 function arg1(unused,o){return o.x;}
 function loc1(a){var unused=0,o=a;return o.x+unused;}
 function both(a,b){var x=a,y=b;return x.x+y.x;}
 function sum(a,b,c,d){return (a||0)+(b||0)+(c||0)+(d||0);}
 var a={x:3},b={pad:1,x:7};
 for(var i=0;i<200;i++){eq(arg1(null,i&1?a:b),i&1?3:7);eq(loc1(a),3);eq(both(a,b),10);}
 a.x=11;eq(arg1(0,a),11);eq(loc1(a),11);
 Object.defineProperty(a,'x',{get:function(){b.x++;return 19;},configurable:true});
 eq(arg1(0,a),19);eq(loc1(a),19);eq(b.x,9);
 delete a.x;Object.setPrototypeOf(a,{x:23});eq(arg1(0,a),23);eq(loc1(a),23);
 var prox=new Proxy(a,{get:function(o,k){return k==='x'?29:Reflect.get(o,k);}});
 eq(arg1(0,prox),29);eq(loc1(prox),29);
 var obj={bias:7,step:function(a,b,c){return this.bias+(a||0)+(b||0)+(c||0);}};
 for(i=0;i<100;i++){
   eq(sum(),0);eq(sum(1),1);eq(sum(1,2),3);eq(sum(1,2,3),6);eq(sum(1,2,3,4),10);
   eq(obj.step(),7);eq(obj.step(1),8);eq(obj.step(1,2),10);eq(obj.step(1,2,3),13);
 }
 var caught=0;function fail(a,b){throw a.x+b.x;}
 for(i=0;i<20;i++)try{fail({x:1},{x:2});}catch(e){eq(e,3);caught++;}eq(caught,20);
 function closure(a){return function(b){return a.x+b.x;};}
 eq(closure({x:5})({x:8}),13);
 function defaults(a,b){a={x:13};return b===undefined?a.x:b.x;}
 eq(defaults({x:1}),13);eq(defaults({x:1},{x:17}),17);
 var dynamic=eval('(function(a,b){return b.x;})');eq(dynamic(0,{x:31}),31);
 var bound=arg1.bind(null,0);eq(bound({x:37}),37);
 var callable=new Proxy(sum,{apply:function(f,t,args){return Reflect.apply(f,t,args)+1;}});
 eq(callable(1,2),4);
 print('NEW_PATH_SEMANTICS_PASS');
})();
