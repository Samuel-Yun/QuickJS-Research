'use strict';
function put(o,v){o.x=v;return o.x;}
var proto=Object.create(null),keep=Object.create(proto),sum=0,values=[];
for(var i=0;i<2000;i++){
 var o=Object.create(proto),v={n:i};
 if(put(o,v)!==v||o.x!==v)throw Error('identity');
 values.push(v);sum+=o.x.n;
}
if(sum!==1999000||values[17].n!==17)throw Error('lifetime');
var rhs=0,setters=0;
function next(){rhs++;return {id:rhs};}
Object.defineProperty(proto,'x',{set:function(v){setters++;if(v.id!==rhs)throw Error('rhs');},configurable:true});
put(Object.create(proto),next());
if(rhs!==1||setters!==1)throw Error('replayed side effects');
delete proto.x;
function putIndex(o,v){o['2147483648']=v;return o['2147483648'];}
for(var i=0;i<100;i++){var o=Object.create(null);if(putIndex(o,i)!==i)throw Error('index');}
print('OWNERSHIP_AND_RHS_AND_LARGE_INDEX_PASS');
