function cfInline(obj, n) {
    var sum = 0;
    for (var i = 0; i < n; i++) {
        sum += i + obj.bias;
    }
    return sum;
}
var cfObject = {bias: 3};

__mlDiagBegin(cfObject,cfInline,{},{},{},{},Function.prototype.call);
var __cfAnswer=cfInline(cfObject,4096);
var __cfPaths=__mlDiagEnd();
if(__cfAnswer!==8398848) throw Error('wrong result');
console.log('PATHS '+__cfPaths);
