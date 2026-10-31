// Inputs are Number integers: a=7, b=3, c=4; expected 15.
function wbArithmetic(a, b, c) {
    var x = a + b * c;
    var y = a - b;
    if (x > y) return x - y;
    return x + y;
}

;(function () {
    var __wbN = 64, __wbLast, __wbChecksum = 0;
    var __wbStart = benchNow();
    for (var __wbRepeat = 0; __wbRepeat < __wbN; __wbRepeat++) {
        __wbLast = wbArithmetic(7, 3, 4);
        __wbChecksum = (__wbChecksum + __wbLast) | 0;
    }
    var __wbElapsed = benchNow() - __wbStart;
    if (__wbLast !== 15 || __wbChecksum !== 960) throw new Error('wrong result');
    console.log('WB_RESULT ' + JSON.stringify({N:__wbN,last:__wbLast,checksum:__wbChecksum,elapsed_ms:__wbElapsed}));
})();
