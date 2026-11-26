var checks=0;
function check(a,b){checks++;if(a!==b)throw Error('offset regression '+checks);}
function readWide(o){return o.target;}
function invoke(o,x){return o.target(x);}
function plus(x){check(this,current);return this.bias+x;}
var current={bias:7,target:plus};
for(var k=0;k<40;k++)check(invoke(current,k),7+k);
current.target=function(x){check(this,current);return x-this.bias;};
for(k=0;k<40;k++)check(invoke(current,k),k-7);
var offsets=[0,1,15,16,255,1024];
for(var n of offsets){
 var o={},anchor={};for(var j=0;j<n;j++)o['before'+j]=j;
 o.target=anchor;for(k=0;k<64;k++)check(readWide(o),anchor);
 o.target=9;for(k=0;k<64;k++)check(readWide(o),9);
 /* Force property storage/shape changes; never cache its former base. */
 for(j=0;j<128;j++)o['after'+j]=j;
 for(k=0;k<64;k++)check(readWide(o),9);
 delete o.target;check(readWide(o),undefined);o.target=anchor;check(readWide(o),anchor);
 Object.defineProperty(o,'target',{get:function(){return 73;},configurable:true});check(readWide(o),73);
 Object.defineProperty(o,'target',{value:anchor,writable:true,configurable:true});check(readWide(o),anchor);
}
var a=Function('o','return o.target;'),b=Function('o','return o.target;');
for(k=0;k<100;k++){check(a({target:k}),k);check(b({pad:1,target:-k}),-k);}
console.log('OFFSET_REGRESSION_PASS checks='+checks+' scenarios=10');
