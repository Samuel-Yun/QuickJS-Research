// n=4096; sum(0..4095)=4096*4095/2=8386560, below signed int32.
function wbNumericLoop(n) {
    var sum = 0;
    for (var i = 0; i < n; i++) {
        sum += i;
    }
    return sum;
}
