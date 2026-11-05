function stepMethod(x) {
    return x + this.bias;
}
function cfMethodLoop(obj, n) {
    var sum = 0;
    for (var i = 0; i < n; i++) {
        sum += obj.step(i);
    }
    return sum;
}
var cfObject = {bias: 3, step: stepMethod};

__mlDiagBegin(cfObject,stepMethod,{},{},{},{},Function.prototype.call);
var __cfAnswer=cfMethodLoop(cfObject,4096);
var __cfPaths=__mlDiagEnd();
if(__cfAnswer!==8398848) throw Error('wrong result');
console.log('PATHS '+__cfPaths);
