function assert(v){if(!v)throw Error('entry check');}
// Three incoming routes to the same condition: left/right continue and the
// ordinary equal fallthrough. Original internal branch entries stay in place.
function loop(a,o,n){var x=a,sum=0;while(n-->0){if(x<o.k){sum+=10;x+=2;continue;}else if(x>o.k){sum++;x-=2;continue;}else{sum+=100;x=NaN;}}return [sum,x];}
var out=[];
for(var i=0;i<100;i++){
 var a=loop(1,{k:2},10),b=loop(3,{k:2},10),e=loop(2,{k:2},10);
 assert(a[0]===55&&a[1]===1&&b[0]===55&&b[1]===3&&e[0]===1000&&Number.isNaN(e[1]));
}
out.push(loop('1',{k:2},4));assert(out[0][0]===13&&out[0][1]===6);
function branch(a,o){if(a<o.k)return -1;else if(a>o.k)return 1;return 0;}
for(var i=0;i<100;i++)assert(branch(2,{k:3})===-1);
var reads=0,o={get k(){reads++;throw Error('getter failure');}};
try{branch(4,o);throw Error('did not throw');}catch(e){assert(e.message==='getter failure');}
assert(reads===1);out.push(reads);print(JSON.stringify(out));
