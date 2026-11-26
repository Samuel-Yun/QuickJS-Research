var out=[],setters=0;
function site(c,x,y){return new c(x,y);}
function C(x,y){this.x=x;this.y=y;}
function warm(c){var empty=Object.create(c.prototype),o;for(var i=0;i<80;i++)o=site(c,3,4);return [o.x,o.y,Object.getPrototypeOf(empty)===c.prototype];}
function sample(label,c){try{var o=site(c,3,4);out.push([label,o.x,o.y,o.z,setters]);}catch(e){out.push([label,e.name,e.message,setters]);}}
out.push(['warm',warm(C)]);
var old=C.prototype;C.prototype={};out.push(['new_prototype',warm(C),Object.getPrototypeOf(site(C,3,4))!==old]);
Object.defineProperty(C.prototype,'x',{set:function(v){setters++;this.z=v+10;},configurable:true});sample('own_setter',C);
delete C.prototype.x;sample('delete_setter',C);
Object.defineProperty(C.prototype,'x',{value:99,writable:false,configurable:true});sample('own_readonly',C);
delete C.prototype.x;sample('delete_readonly',C);
var parent={};Object.setPrototypeOf(C.prototype,parent);out.push(['parent_warm',warm(C)]);
Object.defineProperty(parent,'x',{set:function(v){setters++;this.z=v+20;},configurable:true});sample('parent_setter',C);
delete parent.x;Object.defineProperty(parent,'y',{value:88,writable:false,configurable:true});sample('parent_readonly',C);
delete parent.y;sample('parent_delete',C);
var far={};Object.defineProperty(far,'x',{value:66,writable:false});Object.setPrototypeOf(parent,far);sample('chain_changed',C);
Object.defineProperty(C.prototype,'x',{value:1,writable:true,configurable:true});sample('nearest_writable',C);
delete C.prototype.x;sample('nearest_deleted',C);
function Strict(x,y){'use strict';this.x=x;this.y=y;}
var p={};Strict.prototype=p;out.push(['strict_warm',warm(Strict)]);
Object.defineProperty(p,'x',{value:9,writable:false});sample('strict_throw',Strict);
function Unhashed(x,y){this.x=x;this.y=y;}
var u={drop:1};delete u.drop;Unhashed.prototype=u;out.push(['unhashed',warm(Unhashed)]);
var proxy=new Proxy({}, {set:function(t,k,v,r){setters++;return Reflect.set(t,k,v,r);}});
C.prototype=proxy;sample('proxy_proto',C);
var deep={};for(var j=0;j<7;j++)deep=Object.create(deep);C.prototype=deep;out.push(['deep',warm(C)]);
print(JSON.stringify(out));
