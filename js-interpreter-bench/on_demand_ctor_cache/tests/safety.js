var out=[];
function Unsupported(a){this.x=a+1;}
function Good(a,b){this.x=a;this.y=b;}
function Other(a,b){this.x=b;this.y=a;}
function slot(c,a,b){return new c(a,b);}
for(var i=0;i<100;i++)out.push(slot(Unsupported,i,9).x);
for(i=0;i<100;i++){var o=slot(Good,i,9);out.push(o.x,o.y);}
for(i=0;i<100;i++){o=slot(i%2?Other:Good,i,8);out.push(o.x,o.y);}
Good.prototype={};Object.defineProperty(Good.prototype,'x',{set:function(v){this.z=v;},configurable:true});out.push(slot(Good,7,8).z);delete Good.prototype.x;
for(i=0;i<20;i++)out.push(slot(Good,i,3).x);
var lazy=(new Function('return function(a){this.x=a;}'))();for(i=0;i<20;i++)out.push(slot(lazy,i).x);
var proxy=new Proxy(Good,{construct:function(t,a,n){return Reflect.construct(t,a,n);}});out.push(slot(proxy,2,3).x);
try{slot(function(){throw Error('fail');},1,2);}catch(e){out.push(e.message);}
print(JSON.stringify(out));
