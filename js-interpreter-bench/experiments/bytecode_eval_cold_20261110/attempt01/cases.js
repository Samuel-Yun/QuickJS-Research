'use strict';

// Same input file on both engines. Small counts are for state inspection,
// not performance measurement. No GUARDED_OFFSET code is used.
function ownRead(o) {
    return o.x;
}

function ownLoop(o, n) {
    var sum = 0;
    for (var i = 0; i < n; i++) {
        sum += o.x;
    }
    return sum;
}

function protoCall(o) {
    return o.step();
}

function readStore(o) {
    o.x = o.x + 1;
    return o.x;
}

function mathCall(o) {
    return o.sqrt(9);
}

var evalRead = eval('(function evalRead(o) { return o.x; })');
var unusedEval = eval('(function unusedEval(o) { return o.x; })');
var own = { x: 3, pad: 0 };
var proto = { step: function step() { return this.x + 1; } };
var inherited = Object.create(proto);
inherited.x = 3;
var counter = { x: 0, pad: 0 };

function snapshot(stage) {
    __snapshot(ownRead, stage + '.ownRead', own);
    __snapshot(ownLoop, stage + '.ownLoop', own);
    __snapshot(protoCall, stage + '.protoCall', inherited);
    __snapshot(readStore, stage + '.readStore', counter);
    __snapshot(mathCall, stage + '.mathCall', Math);
    __snapshot(evalRead, stage + '.evalRead', own);
    __snapshot(unusedEval, stage + '.unusedEval', own);
}

function check(actual, expected) {
    if (actual !== expected) throw Error(actual + ' != ' + expected);
}

snapshot('before');
check(ownRead(own), 3);
check(ownLoop(own, 1), 3);
check(protoCall(inherited), 4);
check(readStore(counter), 1);
check(mathCall(Math), 3);
check(evalRead(own), 3);
snapshot('first');

for (var repeat = 0; repeat < 16; repeat++) {
    check(ownRead(own), 3);
    check(ownLoop(own, 16), 48);
    check(protoCall(inherited), 4);
    check(readStore(counter), repeat + 2);
    check(mathCall(Math), 3);
    check(evalRead(own), 3);
}
snapshot('warm');
print('BYTECODE_CASES_PASS');
