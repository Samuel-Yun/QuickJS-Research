"use strict";
function readLoop(sequence, iterations, mask) {
    var obj, sum = 0;
    for (var i = 0; i < iterations; i++) {
        obj = sequence[i & mask];
        sum += obj.x;
    }
    return sum;
}

function ownRead(o){return o.x;}
var a={x:3,a:0},b={x:3,b:0};for(var i=0;i<8;i++)ownRead(a);__snapshot(ownRead,"ownRead_live",a);readLoop([a,a],16,1);__snapshot(readLoop,"readLoop_live",a);
