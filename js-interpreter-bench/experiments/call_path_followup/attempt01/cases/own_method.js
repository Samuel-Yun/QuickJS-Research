function stepMethod(x) {
    return x + this.bias;
}
function cfMethodLoop(obj, n) {
    var sum = 0;
    for (var i = 0; i < n; i++) {
        sum += obj.step(i);
    }
    return sum;
}
var cfObject = {bias: 3, step: stepMethod};
