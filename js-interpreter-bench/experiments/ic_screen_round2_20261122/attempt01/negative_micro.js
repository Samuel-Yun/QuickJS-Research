function site(c,x,y){return new c(x,y);}
function C(x,y){this.x=x;this.y=y;}
function U(x,y){this.x=x+0;this.y=y;}
function V(x,y){this.x=x+0;this.y=y;}
var mode=scriptArgs[1]||'negative',n=+(scriptArgs[2]||65536);
var p={},keep=Object.create(p);C.prototype=U.prototype=V.prototype=p;
var sum=0,start=performance.now();
for(var i=0;i<n;i++){
    var target=mode==='negative'?U:mode==='alternate'?(i&1?U:V):i<n/2?C:U;
    var o=site(target,3,4);sum+=o.x+o.y;
}
var elapsed=performance.now()-start;
if(sum!==7*n || Object.getPrototypeOf(keep)!==p)throw Error('checksum');
print(JSON.stringify({pattern:mode,iterations:n,checksum:sum,elapsed_ms:elapsed}));
