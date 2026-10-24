function wbOwnProperty(obj, n) {
    var sum = 0;
    for (var i = 0; i < n; i++) {
        sum += obj.value;
    }
    return sum;
}
// Creation occurs before the timer; a stable ordinary own data property.
var wbOwnObject = {value: 3};

;(function () {
    var __wbN = 8, __wbLast, __wbChecksum = 0;
    var __wbStart = benchNow();
    for (var __wbRepeat = 0; __wbRepeat < __wbN; __wbRepeat++) {
        __wbLast = wbOwnProperty(wbOwnObject, 4096);
        __wbChecksum = (__wbChecksum + __wbLast) | 0;
    }
    var __wbElapsed = benchNow() - __wbStart;
    if (__wbLast !== 12288 || __wbChecksum !== 98304) throw new Error('wrong result');
    console.log('WB_RESULT ' + JSON.stringify({N:__wbN,last:__wbLast,checksum:__wbChecksum,elapsed_ms:__wbElapsed}));
})();
