// n=4096; sum(0..4095)=4096*4095/2=8386560, below signed int32.
function wbNumericLoop(n) {
    var sum = 0;
    for (var i = 0; i < n; i++) {
        sum += i;
    }
    return sum;
}

;(function () {
    var __wbN = 4, __wbLast, __wbChecksum = 0;
    var __wbStart = benchNow();
    for (var __wbRepeat = 0; __wbRepeat < __wbN; __wbRepeat++) {
        __wbLast = wbNumericLoop(4096);
        __wbChecksum = (__wbChecksum + __wbLast) | 0;
    }
    var __wbElapsed = benchNow() - __wbStart;
    if (__wbLast !== 8386560 || __wbChecksum !== 33546240) throw new Error('wrong result');
    console.log('WB_RESULT ' + JSON.stringify({N:__wbN,last:__wbLast,checksum:__wbChecksum,elapsed_ms:__wbElapsed}));
})();
