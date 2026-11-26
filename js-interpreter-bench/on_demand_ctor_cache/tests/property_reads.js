var out=[];
function own(o){return o.x;}
function method(o){return o.m();}
var proto={m:function(){return this.x+1;}};
var a=Object.create(proto);a.x=3;
for(var i=0;i<100;i++)out.push(own(a),method(a));
proto.m=function(){return this.x+2;};out.push(method(a));
a.m=function(){return this.x+3;};out.push(method(a));delete a.m;
Object.defineProperty(proto,'m',{get:function(){return function(){return this.x+4;};},configurable:true});
out.push(method(a));
Object.defineProperty(a,'x',{get:function(){return 8;},configurable:true});out.push(own(a),method(a));
delete a.x;proto.x=9;out.push(own(a));
var proxy=new Proxy({x:11},{get:function(t,k,r){return Reflect.get(t,k,r);}});out.push(own(proxy));
print(JSON.stringify(out));
