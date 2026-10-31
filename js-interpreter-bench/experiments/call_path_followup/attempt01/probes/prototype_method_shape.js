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
var cfPrototype = {step: stepMethod};
var cfObject = Object.create(cfPrototype);
cfObject.bias = 3;

if(cfObject.bias!==3 || !Object.prototype.hasOwnProperty.call(cfObject,'bias')) throw Error('bias');
if(Object.prototype.hasOwnProperty.call(cfObject,'step')!==false || cfObject.step!==stepMethod) throw Error('step');
console.log('SHAPE_OK');
