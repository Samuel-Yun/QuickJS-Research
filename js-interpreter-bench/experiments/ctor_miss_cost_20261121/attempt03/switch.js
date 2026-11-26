"use strict";
function ctorLoop(sequence,iterations,mask){
    var C,obj,sum=0;
    for(var i=0;i<iterations;i++){
        C=sequence[i&mask];
        obj=new C(3,0);
        sum+=obj.x;
    }
    return sum;
}
function main(){
    var n=Number(scriptArgs[1]||'67108864');
    if(n%2 || n<=0)throw Error('even positive N required');
    var A=function(x,a){this.x=x;this.a=a;};
    var B=function(x,a){this.x=x;this.a=a;};
    var proto={};A.prototype=proto;B.prototype=proto;var empty=Object.create(proto);
    var length=65536,sequenceC=new Array(length),sequenceD=new Array(length);
    for(var k=0;k<length;k++){sequenceC[k]=A;sequenceD[k]=B;}
    // Two invocations of the SAME function preserve its SAME static new site.
    // Arrays are prepared before timing; no phase branch enters ctorLoop.
    var t0=performance.now();
    var sumC=ctorLoop(sequenceC,n/2,length-1);
    var t1=performance.now();
    var sumD=ctorLoop(sequenceD,n/2,length-1);
    var t2=performance.now();
    if(sumC!==3*n/2 || sumD!==3*n/2 || Object.getPrototypeOf(empty)!==proto)throw Error('checksum');
    print(JSON.stringify({kind:'ctor',pattern:'c_then_d',iterations:n,
        checksum:sumC+sumD,elapsed_ms:t2-t0,C_ms:t1-t0,D_ms:t2-t1,warmup_calls:0}));
}
main();
