function cfInline(obj, n) {
    var sum = 0;
    for (var i = 0; i < n; i++) {
        sum += i + obj.bias;
    }
    return sum;
}
var cfObject = {bias: 3};

;(function () {
    var __wbN = 32768, __wbLast, __wbChecksum = 0;
    var __wbStart = benchNow();
    for (var __wbRepeat = 0; __wbRepeat < __wbN; __wbRepeat++) {
        __wbLast = cfInline(cfObject,4096);
        __wbChecksum = (__wbChecksum + __wbLast) | 0;
    }
    var __cfDiagnosticStop = benchNow(); var __wbElapsed = __cfDiagnosticStop - __wbStart;
    if (__wbLast !== 8398848 || __wbChecksum !== 335544320) throw new Error('wrong result');
    console.log('WB_RESULT ' + JSON.stringify({start_ms:__wbStart,stop_ms:__cfDiagnosticStop,N:__wbN,last:__wbLast,checksum:__wbChecksum,elapsed_ms:__wbElapsed}));
})();
