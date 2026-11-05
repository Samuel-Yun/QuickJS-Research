function step(x) {
    return x + 1;
}

function valueReadLoop(obj, expected) {
    var sum = 0, last;
    for (var i = 0; i < 4096; i++) {
        last = obj.slot;
        sum += i + 1;
    }
    if (last !== expected) throw Error("value identity");
    return sum;
}

function methodCallLoop(obj, expected) {
    var sum = 0;
    for (var i = 0; i < 4096; i++) {
        sum += obj.slot(i);
    }
    return sum;
}

function localCallLoop(obj, expected) {
    var fn = obj.slot, sum = 0;
    for (var i = 0; i < 4096; i++) {
        sum += fn(i);
    }
    return sum;
}

var expectedValue = CASE_KIND === "number_value_read" ? 3 : step;
var microObject = { slot: expectedValue };
var selectedLoop =
    CASE_KIND === "number_value_read" || CASE_KIND === "function_value_read"
        ? valueReadLoop
        : CASE_KIND === "own_method_call" ? methodCallLoop : localCallLoop;

function microRun() {
    return selectedLoop(microObject, expectedValue);
}

// Driver compatibility only; target functions above follow the supplied design.
function microValidate(result) {
    if (result !== 8390656) throw Error("expected 8390656");
}
