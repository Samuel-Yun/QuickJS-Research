"use strict";
function ctorLoop(sequence,n) {
    var obj,sum=0;
    for(var i=0;i<n;i++) {
        var C=sequence[i&65535];
        obj=new C(3,7);
        sum+=obj.x+obj.y;
    }
    return sum;
}
var mode=scriptArgs[1]||'rotate2',n=+(scriptArgs[2]||65536);
var constructors=[
    function(x,y){this.x=x;this.y=y;},
    function(x,y){this.x=x;this.y=y;},
    function(x,y){this.x=x;this.y=y;},
    function(x,y){this.x=x;this.y=y;},
    function(x,y){this.x=x;this.y=y;}
];
var proto={},empty=Object.create(proto);
for(var k=0;k<constructors.length;k++)constructors[k].prototype=proto;
var width=mode==='all'?1:mode==='switch'?2:+mode.slice(6);
var sequence=[];
for(var i=0;i<65536;i++)sequence[i]=constructors[mode==='switch'?(i<32768?0:1):i%width];
var start=performance.now(),checksum=ctorLoop(sequence,n),elapsed=performance.now()-start;
if(checksum!==10*n || Object.getPrototypeOf(empty)!==proto)throw Error('checksum');
print(JSON.stringify({pattern:mode,iterations:n,checksum:checksum,elapsed_ms:elapsed}));
