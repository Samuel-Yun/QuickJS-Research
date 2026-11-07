// Bounded semantic checks; no workload or timing changes.
function ok(x, label) { if (!x) throw Error(label); }
function read(o) { return o.x; }
function method(o) { return o.step(3); }
function assign(o,v) { o.x=v; return o.x; }
function fill(o,n) { for(var i=0;i<n;i++)o['p'+i]=i+1; return o; }
for(var size=0;size<=16;size++) {
  var o=fill({},size); o.x=3;
  for(var k=0;k<40;k++)ok(read(o)===3,'read/grow');
  o.x={a:7};ok(read(o).a===7,'new value');
  delete o.x;o.x=9;ok(read(o)===9,'delete/readd');
  Object.defineProperty(o,'x',{get:function(){return 12;},configurable:true});
  ok(read(o)===12,'getter');
  Object.defineProperty(o,'x',{value:18,writable:false,configurable:true});
  assign(o,22);ok(read(o)===18,'readonly');
  for(var i=0;i<size;i+=2)delete o['p'+i];
  fill(o,24);ok(o.p23===24,'compact/grow');
}
for(var count of [1,2,4,8]) {
  var objects=[];
  for(var s=0;s<count;s++) {var o=fill({},s);o.x=s+10;objects.push(o);}
  for(var i=0;i<300;i++)ok(read(objects[i%count])===i%count+10,'poly');
  for(var s=0;s<count;s++)objects[s].x+=100;
  for(var i=0;i<80;i++)ok(read(objects[i%count])===i%count+110,'poly values');
}
var proto={x:17,step:function(x){return this.bias+x;}};
var child=Object.create(proto);child.bias=4;
ok(method(child)===7 && read(child)===17,'prototype receiver');
child.x=20;ok(read(child)===20,'shadow');delete child.x;
proto.x=21;ok(read(child)===21,'prototype changed');
var calls=0;
Object.defineProperty(proto,'x',{set:function(v){calls+=v;},get:function(){return 7;},configurable:true});
assign(child,3);ok(calls===3 && !child.hasOwnProperty('x'),'inherited setter');
var nullobj=Object.create(null);ok(assign(nullobj,5)===5,'nullproto');
Object.preventExtensions(nullobj);nullobj.y=3;ok(!('y' in nullobj),'extensible');
var proxy=new Proxy({x:8},{get:function(o,k){return o[k]+1;}});
ok(read(proxy)===9,'proxy');
var hits=0;
var getter={get x(){hits++;return hits;}};
for(var i=1;i<=80;i++)ok(read(getter)===i,'getter executed once');
for(var round=0;round<100;round++) {
  var a=fill({},round%12),b={};a.x=b;b.x=a;
  ok(read(a)===b,'cycle');
}
print('V7_TARGETED_PASS');
