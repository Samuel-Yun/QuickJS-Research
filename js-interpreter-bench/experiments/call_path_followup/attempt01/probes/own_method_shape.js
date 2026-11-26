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

if(cfObject.bias!==3 || !Object.prototype.hasOwnProperty.call(cfObject,'bias')) throw Error('bias');
if(Object.prototype.hasOwnProperty.call(cfObject,'step')!==true || cfObject.step!==stepMethod) throw Error('step');
console.log('SHAPE_OK');
