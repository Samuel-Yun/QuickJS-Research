"use strict";
class C {constructor(x,a){this.x=x;this.a=a;}}
function loop(n){var sum=0;for(var i=0;i<n;i++){var o=new C(3,0);sum+=o.x;}return sum;}
var n=scriptArgs.length>1?+scriptArgs[1]:8388608;
var empty=Object.create(C.prototype);
var start=performance.now();var checksum=loop(n);var elapsed=performance.now()-start;
if(checksum!==3*n || Object.getPrototypeOf(empty)!==C.prototype)throw Error('checksum');
print(JSON.stringify({kind:'class_guard_fixture',iterations:n,checksum:checksum,elapsed_ms:elapsed}));
