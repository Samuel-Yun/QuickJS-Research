__four_begin();
var out=[],calls=0;
function C(a,b){this.x=a;this.y=b;}
function D(a,b){this.x=b;this.y=a;}
var parent={},proto=C.prototype;Object.setPrototypeOf(proto,parent);
function make(c,a,b){return new c(a,b);}
function sample(){var r;for(var i=0;i<40;i++)r=make(C,i,9);out.push(r.x,r.y,calls);}
sample();Object.defineProperty(proto,'x',{configurable:true,set:function(v){calls+=v;}});sample();delete proto.x;sample();
Object.defineProperty(parent,'x',{configurable:true,set:function(v){calls+=v;}});sample();delete parent.x;sample();
Object.defineProperty(parent,'y',{configurable:true,writable:false,value:77});sample();delete parent.y;sample();
Object.defineProperty(proto,'x',{configurable:true,writable:true,value:13});sample();Object.defineProperty(proto,'x',{writable:false});sample();delete proto.x;sample();
var newer={};Object.defineProperty(newer,'y',{set:function(v){calls+=v;},configurable:true});Object.setPrototypeOf(parent,newer);sample();Object.setPrototypeOf(parent,Object.prototype);sample();
for(var i=0;i<40;i++){var r=make(i%2?D:C,i,6);out.push(r.x,r.y);}
Object.freeze(parent);sample();sample();print(JSON.stringify(out));

__four_end();