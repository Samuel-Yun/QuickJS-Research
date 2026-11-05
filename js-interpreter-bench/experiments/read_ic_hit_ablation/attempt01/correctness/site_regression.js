var siteAssertions=0,siteScenarios=0;
function eq(a,b){siteAssertions++;if(a!==b)throw Error('site regression '+siteAssertions+': '+a+' vs '+b);}
function rd(o){return o.x;}
function shapes(n){var a=[];for(var j=0;j<n;j++){var o={};for(var k=0;k<=j;k++)o['p'+j+'_'+k]=k;o.x=j+1;a.push(o);}return a;}
for(var n of [1,2,4,8]){siteScenarios++;var a=shapes(n);for(var i=0;i<4096;i++)eq(rd(a[i%n]),i%n+1);}
siteScenarios++;var a={x:1},b={x:2},anchor={};for(i=0;i<16;i++){eq(rd(a),1);eq(rd(b),2);}a.x=anchor;eq(rd(a),anchor);a.x='new';eq(rd(a),'new');
siteScenarios++;function two(a,b){return a.x+b.x;}a={x:3,z:1};b={z:1,x:4};for(i=0;i<100;i++)eq(two(a,b),7);
siteScenarios++;a=shapes(4);for(i=0;i<32;i++)rd(a[i%4]);delete a[1].x;eq(rd(a[1]),undefined);a[1].x=41;eq(rd(a[1]),41);delete a[1].p1_0;a[1].q=9;eq(rd(a[1]),41);
siteScenarios++;var gets=0,sets=0,store=7;o={x:4};for(i=0;i<32;i++)rd(o);
Object.defineProperty(o,'x',{configurable:true,get:function(){gets++;return store;},set:function(v){sets++;store=v;}});
for(i=0;i<16;i++){o.x=i;eq(rd(o),i);}eq(gets,16);eq(sets,16);
Object.defineProperty(o,'x',{value:99,writable:true,configurable:true});eq(rd(o),99);
siteScenarios++;var traps=0,p=new Proxy({x:12},{get:function(t,k,r){traps++;return Reflect.get(t,k,r);}});for(i=0;i<16;i++)eq(rd(p),12);eq(traps,16);
siteScenarios++;o={x:3};for(i=0;i<32;i++)rd(o);var throws=0;Object.defineProperty(o,'x',{get:function(){throws++;throw Error('xthrow');}});
for(i=0;i<8;i++){try{rd(o);eq(true,false);}catch(e){eq(e.message,'xthrow');}}eq(throws,8);
siteScenarios++;var proto={x:22};o=Object.create(proto);for(i=0;i<16;i++)eq(rd(o),22);Object.setPrototypeOf(o,{x:23});eq(rd(o),23);o.x=24;for(i=0;i<16;i++)eq(rd(o),24);delete o.x;eq(rd(o),23);
siteScenarios++;function meth(x){eq(this,receiver);return x+this.bias;}function call(o,x){return o.step(x);}var receiver={bias:3,step:meth};for(i=0;i<64;i++)eq(call(receiver,i),i+3);
siteScenarios++;var arr=[];arr.x=51;var ta=new Uint8Array(3);ta.x=52;var re=/abc/g;re.x=53;for(i=0;i<16;i++){eq(rd(arr),51);eq(rd(ta),52);eq(rd(re),53);eq(rd(3),undefined);eq(rd('abc'),undefined);}try{rd(null);eq(true,false);}catch(e){eq(e instanceof TypeError,true);}
siteScenarios++;o={x:7};for(i=0;i<32;i++)rd(o);Object.defineProperty(o,'x',{writable:false});function wr(o){'use strict';o.x=8;}try{wr(o);eq(true,false);}catch(e){eq(e instanceof TypeError,true);}eq(rd(o),7);
siteScenarios++;for(var z=0;z<200;z++){var fn=Function('a','return a.x;'),many=shapes(8);for(i=0;i<32;i++)eq(fn(many[i%8]),i%8+1);fn=null;many=null;}
console.log('SITE_REGRESSION_PASS scenarios='+siteScenarios+' assertions='+siteAssertions);
