function assert(v){if(!v)throw Error('check');}
function branch(a,obj){if(a<obj.k){return -1;}else if(a>obj.k){return 1;}return 0;}
function local(z,x){var a=z,obj=x; if(a<obj.k){var sum=0;for(var i=0;i<4;i++)sum+=i;return -sum;}else if(a>obj.k){return 6;}return 0;}
var out=[];if(typeof __ep_begin==='function')__ep_begin();
for(var i=0;i<1000;i++){assert(branch(2,{k:3})===-1);assert(branch(4,{k:3})===1);assert(branch(3,{k:3})===0);}
for(var a of [NaN,-0,0,1,-1,Infinity,-Infinity,3.5])for(var k of [NaN,-0,0,1,-1,Infinity,-Infinity,3.5]){
 var expected=a<k?-1:a>k?1:0;assert(branch(a,{k:k})===expected);assert(local(a,{k:k})===expected*6);out.push(expected);
}
var reads=0,o={get k(){reads++;return 3;}};
assert(branch(2,o)===-1&&reads===1);reads=0;assert(branch(4,o)===1&&reads===2);
reads=0;assert(branch(NaN,o)===0&&reads===2);
var obj={k:3},calls=0,value={valueOf:function(){calls++;obj.k=calls===1?9:0;return 5;}};
assert(branch(value,obj)===0&&calls===2&&obj.k===0);
// First comparison gets old k=3, valueOf sets k=9. The second read must see 9.
var count=0,p=new Proxy({k:3},{get:function(t,n){count++;return t[n];}});assert(branch(4,p)===1&&count===2);
var f={k:'3'};assert(branch(4,f)===1);delete f.k;assert(branch(4,f)===0);
var base={k:3};assert(branch(4,Object.create(base))===1);
Object.defineProperty(base,'k',{get:function(){return 9;}});assert(branch(4,Object.create(base))===-1);
if(typeof __ep_end==='function')__ep_end();
print(JSON.stringify({values:out,getter:reads,valueOf:calls,proxy:count,pass:true}));
