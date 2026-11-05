function wbSmallFunction(x) {
    return x * 2 + 1;
}
// n=4096; sum(2*i+1)=n*n=16777216, below signed int32.
function wbDirectCall(n) {
    var sum = 0;
    for (var i = 0; i < n; i++) {
        sum += wbSmallFunction(i);
    }
    return sum;
}

;(function () {
    var __wbN = 2, __wbLast, __wbChecksum = 0;
    var __wbStart = benchNow();
    for (var __wbRepeat = 0; __wbRepeat < __wbN; __wbRepeat++) {
        __wbLast = wbDirectCall(4096);
        __wbChecksum = (__wbChecksum + __wbLast) | 0;
    }
    var __wbElapsed = benchNow() - __wbStart;
    if (__wbLast !== 16777216 || __wbChecksum !== 33554432) throw new Error('wrong result');
    console.log('WB_RESULT ' + JSON.stringify({N:__wbN,last:__wbLast,checksum:__wbChecksum,elapsed_ms:__wbElapsed}));
})();
