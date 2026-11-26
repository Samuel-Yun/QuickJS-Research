function C(x,y){this.x=x;this.y=y;}
function make(c){return new c(3,4);}
var out=[],setters=0;
var variants=[{}, {marker:1}, {x:8,marker:1}, {a:1,b:2,c:3}];
for(var p of variants){
    C.prototype=p;var keep=Object.create(p);
    for(var i=0;i<8;i++){var o=make(C);out.push(o.x,o.y);}
}
var far={};Object.defineProperty(far,'x',{value:99,writable:false,configurable:true});
var near=Object.create(far);near.marker=1;
Object.defineProperty(near,'x',{value:88,writable:true,configurable:true});
C.prototype=near;out.push(make(C).x); // nearest writable wins
delete near.x;out.push(make(C).x); // ancestor readonly wins
Object.defineProperty(near,'x',{set:function(v){setters++;this.z=v+10;},get:function(){return 77;},configurable:true});
var o=make(C);out.push(o.x,o.y,o.z);
delete near.x;
Object.defineProperty(near,'x',{value:55,writable:false,configurable:true});out.push(make(C).x);
// Holes in a small physical descriptor table are ignored.
var holes={a:1,b:2};delete holes.a;delete holes.b;
C.prototype=holes;out.push(make(C).x);
// Large physical table, few live descriptors: use the conservative large path.
var large={a:1,b:2,c:3,d:4};delete large.a;delete large.b;delete large.c;
C.prototype=large;out.push(make(C).y);
var exotic=new Proxy({}, {set:function(t,k,v,r){setters++;return Reflect.set(t,k,v,r);}});
C.prototype=exotic;out.push(make(C).x);
var deep={};for(var i=0;i<35;i++)deep=Object.create(deep);
C.prototype=deep;out.push(make(C).y,setters);
print(JSON.stringify(out));
