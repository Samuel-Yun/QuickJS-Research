// Inputs are Number integers: a=7, b=3, c=4; expected 15.
function wbArithmetic(a, b, c) {
    var x = a + b * c;
    var y = a - b;
    if (x > y) return x - y;
    return x + y;
}

// n=4096; sum(0..4095)=4096*4095/2=8386560, below signed int32.
function wbNumericLoop(n) {
    var sum = 0;
    for (var i = 0; i < n; i++) {
        sum += i;
    }
    return sum;
}

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

function wbOwnProperty(obj, n) {
    var sum = 0;
    for (var i = 0; i < n; i++) {
        sum += obj.value;
    }
    return sum;
}
// Creation occurs before the timer; a stable ordinary own data property.
var wbOwnObject = {value: 3};

function wbStep(x) {
    return x + this.bias;
}
function wbPrototypeMethod(obj, n) {
    var sum = 0;
    for (var i = 0; i < n; i++) {
        sum += obj.step(i);
    }
    return sum;
}
// Two receivers share one stable prototype/method; only the first is timed.
var wbSharedPrototype = {step: wbStep};
var wbPrototypeObject = Object.create(wbSharedPrototype);
wbPrototypeObject.bias = 3;
var wbPrototypeSibling = Object.create(wbSharedPrototype);
wbPrototypeSibling.bias = 5;

;(function(){
 var answers=[wbArithmetic(7,3,4),wbArithmetic(7,-3,4),wbBranches([-3]),wbBranches([4]),wbBranches([-1]),wbBranches([8])];
 if(JSON.stringify(answers)!=='[15,5,3,8,1,16]') throw Error('arm check failed');
 if(!Object.prototype.hasOwnProperty.call(wbOwnObject,'value')) throw Error('not own');
 if(Object.prototype.hasOwnProperty.call(wbPrototypeObject,'step')) throw Error('method is own');
 if(Object.getPrototypeOf(wbPrototypeObject)!==Object.getPrototypeOf(wbPrototypeSibling)) throw Error('prototype differs');
 if(wbPrototypeObject.step!==wbPrototypeSibling.step) throw Error('method differs');
 if(wbPrototypeMethod(wbPrototypeSibling,4096)!==8407040) throw Error('receiver semantics');
 console.log('SEMANTICS '+JSON.stringify({arm_results:answers,full_branch_result:wbBranches(wbBranchInput),positive_inputs:2,negative_inputs:2,shared_method:true}));
})();
