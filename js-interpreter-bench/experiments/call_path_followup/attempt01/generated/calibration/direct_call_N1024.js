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

;(function () {
    var __wbN = 1024, __wbLast, __wbChecksum = 0;
    var __wbStart = benchNow();
    for (var __wbRepeat = 0; __wbRepeat < __wbN; __wbRepeat++) {
        __wbLast = cfDirectLoop(cfObject,4096);
        __wbChecksum = (__wbChecksum + __wbLast) | 0;
    }
    var __wbElapsed = benchNow() - __wbStart;
    if (__wbLast !== 8398848 || __wbChecksum !== 10485760) throw new Error('wrong result');
    console.log('WB_RESULT ' + JSON.stringify({N:__wbN,last:__wbLast,checksum:__wbChecksum,elapsed_ms:__wbElapsed}));
})();
