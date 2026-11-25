// Classes install an ordinary data .prototype without the function AUTOINIT.
// This is a semantic fixture, not a substitute for real-workload coverage.
var out=[],calls=0;
function make(c){return new c(3,4);}
function warm(c){var empty=Object.create(c.prototype),o;for(var i=0;i<80;i++)o=make(c);return [o.x,o.y,Object.getPrototypeOf(empty)===c.prototype];}
class A {constructor(x,y){this.x=x;this.y=y;}}
out.push(['initial',warm(A)]);
A.extra=1;out.push(['callee_shape_changed',warm(A)]);
delete A.extra;out.push(['callee_unhashed',warm(A)]);
class B {constructor(x,y){this.x=x;this.y=y;}}
out.push(['B_initial',warm(B)]);
B.prototype.pad=99;out.push(['harmless_proto_change',warm(B)]);
class C {constructor(x,y){this.x=x;this.y=y;}}
out.push(['C_initial',warm(C)]);
Object.defineProperty(C.prototype,'x',{set:function(v){calls++;this.z=v+10;},configurable:true});
var c=make(C);out.push(['setter',c.x,c.y,c.z,calls]);
delete C.prototype.x;c=make(C);out.push(['delete',c.x,c.y,calls]);
Object.defineProperty(C.prototype,'x',{value:99,writable:false,configurable:true});
try{make(C);}catch(e){out.push(['readonly',e.name]);}
delete C.prototype.x;
class D {constructor(x,y){this.x=x;this.y=y;}}
out.push(['D_initial',warm(D)]);
Object.setPrototypeOf(D.prototype,{x:77});var d=make(D);out.push(['change_chain',d.x,d.y]);
class E {constructor(x,y){this.x=x;this.y=y;}}
out.push(['E_initial',warm(E)]);
Object.defineProperty(Object.prototype,'x',{set:function(v){calls++;this.z=v+20;},configurable:true});
var e=make(E);out.push(['upper_setter',e.x,e.y,e.z,calls]);delete Object.prototype.x;
print(JSON.stringify(out));
