function assert(v){if(!v)throw Error('check');}
function Pair(a,b){this.a=a;this.b=b;}
var empty=Object.create(Pair.prototype),out=[];
function create(a,b){return new Pair(a,b);}
if(typeof __ep_begin==='function')__ep_begin();
for(var i=0;i<2000;i++){
 var token={i:i},o=create(token,i);assert(o.a===token&&o.b===i);out.push(o.b);
 // Force migration, then delete and compact. Object references transfer once.
 for(var k=0;k<24;k++)o['f'+k]={k:k};
 for(var k=0;k<24;k++)assert(o['f'+k].k===k);
 for(var k=0;k<23;k++)delete o['f'+k];
 assert(o.a===token&&o.f23.k===23);o.a=o;o.b=token;
}
var x=create({v:7},{v:8});Object.preventExtensions(x);try{Object.defineProperty(x,'c',{value:9});throw Error('extension');}catch(e){assert(e instanceof TypeError);}
assert(x.a.v===7&&x.b.v===8);
Object.defineProperty(Pair.prototype,'a',{set:function(v){this.seen=v;},configurable:true});
var q=create(3,4);assert(q.seen===3&&!Object.prototype.hasOwnProperty.call(q,'a'));delete Pair.prototype.a;
if(typeof __ep_end==='function')__ep_end();
assert(Object.getPrototypeOf(empty)===Pair.prototype);print(JSON.stringify({last:out[out.length-1],sum:out.length,pass:true}));
