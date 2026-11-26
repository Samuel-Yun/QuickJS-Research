var out=[],gets=0;
function readX(o){return o.x;}
function readXY(o){return [o.x,o.y];}
function readMethod(o){return o.m();}
var a={x:3,a:0},b={pad:99,x:5};
for(var i=0;i<20;i++)out.push(readX(i&1?b:a));
a.x=13;b.x=15;out.push(readX(a),readX(b));
delete a.x;out.push(readX(a));a.pad=99;a.x=17;out.push(readX(a));
Object.defineProperty(b,'x',{get:function(){gets++;return this.pad+1;},configurable:true});out.push(readX(b),gets);
delete b.x;Object.setPrototypeOf(b,{x:23});out.push(readX(b));
var p=new Proxy({x:29},{get:function(t,k,r){gets++;return Reflect.get(t,k,r);}});out.push(readX(p),gets);
var proto={m:function(){return this.x+1;}},m=Object.create(proto);m.x=31;
for(var j=0;j<10;j++)out.push(readMethod(m));
proto.m=function(){return this.x+2;};out.push(readMethod(m));
Object.defineProperty(proto,'m',{get:function(){gets++;return function(){return this.x+3;};},configurable:true});out.push(readMethod(m),gets);
var xy={x:37,y:41};for(var k=0;k<10;k++)out.push(readXY(xy));
delete xy.x;Object.defineProperty(xy,'y',{get:function(){return 43;},configurable:true});out.push(readXY(xy));
try{readX(null);}catch(e){out.push(e.name,e.message);}
var boom={};Object.defineProperty(boom,'x',{get:function(){throw RangeError('getter');}});
try{readX(boom);}catch(e){out.push(e.name,e.message);}
out.push(readX('abc'));
print(JSON.stringify(out));
