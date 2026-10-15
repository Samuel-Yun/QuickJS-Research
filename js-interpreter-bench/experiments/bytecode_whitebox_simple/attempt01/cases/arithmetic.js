// Inputs are Number integers: a=7, b=3, c=4; expected 15.
function wbArithmetic(a, b, c) {
    var x = a + b * c;
    var y = a - b;
    if (x > y) return x - y;
    return x + y;
}
