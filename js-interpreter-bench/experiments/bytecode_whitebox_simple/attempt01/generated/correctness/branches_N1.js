// Fixed sequence; each arm executes twice. The independent sum is 3+8+1+16=28.
function wbBranches(values) {
    var sum = 0;
    for (var i = 0; i < values.length; i++) {
        var x = values[i];
        if (x >= 0) sum += x * 2;
        else sum -= x;
    }
    return sum;
}
var wbBranchInput = [-3, 4, -1, 8];

;(function () {
    var __wbN = 1, __wbLast, __wbChecksum = 0;
    var __wbStart = benchNow();
    for (var __wbRepeat = 0; __wbRepeat < __wbN; __wbRepeat++) {
        __wbLast = wbBranches(wbBranchInput);
        __wbChecksum = (__wbChecksum + __wbLast) | 0;
    }
    var __wbElapsed = benchNow() - __wbStart;
    if (__wbLast !== 28 || __wbChecksum !== 28) throw new Error('wrong result');
    console.log('WB_RESULT ' + JSON.stringify({N:__wbN,last:__wbLast,checksum:__wbChecksum,elapsed_ms:__wbElapsed}));
})();
