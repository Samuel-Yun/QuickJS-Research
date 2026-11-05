function cfInline(obj, n) {
    var sum = 0;
    for (var i = 0; i < n; i++) {
        sum += i + obj.bias;
    }
    return sum;
}
var cfObject = {bias: 3};
