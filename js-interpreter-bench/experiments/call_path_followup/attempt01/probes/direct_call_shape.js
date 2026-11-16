function stepPlain(obj, x) {
    return x + obj.bias;
}
function cfDirectLoop(obj, n) {
    var sum = 0;
    for (var i = 0; i < n; i++) {
        sum += stepPlain(obj, i);
    }
    return sum;
}
var cfObject = {bias: 3};

if(cfObject.bias!==3 || !Object.prototype.hasOwnProperty.call(cfObject,'bias')) throw Error('bias');
console.log('SHAPE_OK');
