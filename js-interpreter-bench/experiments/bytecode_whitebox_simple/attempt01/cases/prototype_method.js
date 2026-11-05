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
