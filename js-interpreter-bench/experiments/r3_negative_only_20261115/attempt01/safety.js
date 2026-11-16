var out=[],count=0;
function Good(a,b){this.x=a;this.y=b;}
function Bad(a,b){this.x=a+1;this.y=b;}
function Bad2(a,b){this.x=a*2;this.y=b;}
function point(c,a,b){return new c(a,b);}
for(var k=0;k<4;k++){var c=[Bad,Good,Bad2,Good][k];for(var i=0;i<80;i++){var o=point(c,i,3);out.push(o.x,o.y);}}
Object.defineProperty(Good.prototype,'x',{set:function(v){count+=v;},configurable:true});for(i=0;i<8;i++)out.push(point(Good,i,2).x);delete Good.prototype.x;
for(i=0;i<80;i++)out.push(point(Good,i,2).x);
var cold=(new Function('return function(a,b){this.x=a;this.y=b;}'))();for(i=0;i<80;i++)out.push(point(cold,i,3).x);
function ThrowSometimes(a,b){if(a<0)throw marker;this.x=a+1;this.y=b;}
var marker={};for(i=0;i<80;i++)point(ThrowSometimes,i,2);try{point(ThrowSometimes,-1,2);}catch(e){out.push(e===marker);}
var p=new Proxy(Good,{construct:function(t,a,n){count++;return Reflect.construct(t,a,n);}});out.push(point(p,3,4).x);p=Proxy.revocable(Good,{});p.revoke();try{point(p.proxy,1,2);}catch(e){out.push(e instanceof TypeError);}
out.push(Reflect.construct(Good,[1,2],Bad).y,count);print(JSON.stringify(out));
