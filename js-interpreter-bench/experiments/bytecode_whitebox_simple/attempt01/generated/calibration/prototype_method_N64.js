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

;(function () {
    var __wbN = 64, __wbLast, __wbChecksum = 0;
    var __wbStart = benchNow();
    for (var __wbRepeat = 0; __wbRepeat < __wbN; __wbRepeat++) {
        __wbLast = wbPrototypeMethod(wbPrototypeObject, 4096);
        __wbChecksum = (__wbChecksum + __wbLast) | 0;
    }
    var __wbElapsed = benchNow() - __wbStart;
    if (__wbLast !== 8398848 || __wbChecksum !== 537526272) throw new Error('wrong result');
    console.log('WB_RESULT ' + JSON.stringify({N:__wbN,last:__wbLast,checksum:__wbChecksum,elapsed_ms:__wbElapsed}));
})();
