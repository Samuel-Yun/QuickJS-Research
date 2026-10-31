function wbStep(x) {
    return x + this.bias;
}
function wbPrototypeMethod(obj, n) {
    var sum = 0;
    for (var i = 0; i < n; i++) {
        sum += obj.step(i);
    }
    return sum;
}
// Two receivers share one stable prototype/method; only the first is timed.
var wbSharedPrototype = {step: wbStep};
var wbPrototypeObject = Object.create(wbSharedPrototype);
wbPrototypeObject.bias = 3;
var wbPrototypeSibling = Object.create(wbSharedPrototype);
wbPrototypeSibling.bias = 5;

__mlDiagBegin(wbPrototypeObject,wbStep,{},{},{},{},Function.prototype.call);
var __wbAnswer=wbPrototypeMethod(wbPrototypeObject, 4096);
var __wbPaths=__mlDiagEnd();
if(__wbAnswer!==8398848) throw Error('wrong result');
console.log('PATHS '+__wbPaths);
