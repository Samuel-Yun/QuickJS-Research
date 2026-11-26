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
    var mode=scriptArgs[1]||'positive',rate=Number(scriptArgs[2]||'100'),n=Number(scriptArgs[3]||'8388608');
    var length=65536,half=length/2;
    var A,B;
    if(mode==='positive'){
        A=function(x,a){this.x=x;this.a=a;};
        B=function(x,a){this.x=x;this.a=a;};
    }else{
        A=function(x,a){this.x=x+0;this.a=a;};
        B=function(x,a){this.x=x+0;this.a=a;};
    }
    // Same prototype and result layout: only constructor identity changes.
    // The empty object keeps the existing plan's empty-shape prerequisite available.
    var proto={};A.prototype=proto;B.prototype=proto;var empty=Object.create(proto);
    var sequence=new Array(length),pairs=Math.round((1-rate/100)*half),position=0;
    if(!pairs){for(var k=0;k<length;k++)sequence[k]=A;}
    else for(var pair=0;pair<pairs;pair++){
        var run=Math.floor((pair+1)*half/pairs)-Math.floor(pair*half/pairs);
        for(var shape=0;shape<2;shape++)for(var j=0;j<run;j++)sequence[position++]=shape?B:A;
    }
    var start=performance.now();
    var checksum=ctorLoop(sequence,n,length-1);
    var elapsed=performance.now()-start;
    if(checksum!==3*n || Object.getPrototypeOf(empty)!==proto)throw Error('checksum');
    print(JSON.stringify({kind:'ctor',mode:mode,target:rate,iterations:n,checksum:checksum,elapsed_ms:elapsed,warmup_calls:0}));
}
main();
