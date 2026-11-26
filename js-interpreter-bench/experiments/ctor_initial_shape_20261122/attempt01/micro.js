function C(x,y){this.x=x;this.y=y;}
function D(x,y){this.x=x;this.y=y;}
function E(x,y){this.x=x;this.y=y;}
function loop(ctors,n,pattern){
    var sum=0;
    for(var i=0;i<n;i++){
        var index=pattern==='all'?0:pattern==='alternate'?(i&1):pattern==='rotate3'?(i%3):
            pattern==='c_then_e'?(i<n/2?0:2):(i<2?0:i<4?1:i<n/2?0:2);
        var target=ctors[index];var o=new target(3,7);sum+=o.x+o.y;
    }
    return sum;
}
var pattern=scriptArgs[1]||'all',n=+(scriptArgs[2]||16777216),proto={};
C.prototype=D.prototype=E.prototype=proto;var keep=Object.create(proto);
var ctors=[C,D,E];var start=performance.now();var checksum=loop(ctors,n,pattern);
var elapsed=performance.now()-start;
if(checksum!==10*n || Object.getPrototypeOf(keep)!==proto)throw Error('checksum');
print(JSON.stringify({pattern:pattern,iterations:n,checksum:checksum,elapsed_ms:elapsed}));
