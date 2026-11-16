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
