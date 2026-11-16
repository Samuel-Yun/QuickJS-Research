function stepPlain(obj, x) {
    return x + obj.bias;
}
function cfDirectLoop(obj, n) {
    var sum = 0;
    for (var i = 0; i < n; i++) {
        sum += stepPlain(obj, i);
    }
    return sum;
}
var cfObject = {bias: 3};

__mlDiagBegin(cfObject,stepPlain,{},{},{},{},Function.prototype.call);
var __cfAnswer=cfDirectLoop(cfObject,4096);
var __cfPaths=__mlDiagEnd();
if(__cfAnswer!==8398848) throw Error('wrong result');
console.log('PATHS '+__cfPaths);
