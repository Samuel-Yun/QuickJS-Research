function step(x) {
    return x + 1;
}

function methodLoop(obj) {
    var sum = 0;
    for (var i = 0; i < 4096; i++) {
        sum += obj.step(i);
    }
    return sum;
}

var sharedProto = { step: step };
var microObject;
if (CASE_KIND === "own") {
    microObject = { step: step };
} else {
    microObject = Object.create(sharedProto);
}

function microRun() {
    return methodLoop(microObject);
}

function microValidate(result) {
    if (result !== 8390656) throw Error("expected 8390656");
}
