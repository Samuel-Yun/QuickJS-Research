var IC_CASE = "own_update"; var IC_N = 2;
"use strict";
// IC_CASE and IC_N are supplied by a common, engine-independent prefix.
// Each read/call function below survives both rounds when IC_N = 2.
function readOwn(o) { return o.value; }
function readPrototype(o) { return o.value; }
function callReplacedMethod(o, x) { return o.step(x); }
function readShadowed(o) { return o.value; }
function readChangedPrototype(o) { return o.value; }
function readChangedChain(o) { return o.value; }
function readGetter(o) { return o.value; }
function callFourMaps(o, x) { return o.step(x); }

function requireTrue(value, message) {
    if (value !== true) throw new Error(message);
}
function twice(read, object, values) {
    values.push(read(object));
    values.push(read(object));
}

function ownUpdate() {
    var o = {value: 1}, values = [];
    twice(readOwn, o, values);
    o.value = 7;
    twice(readOwn, o, values);
    return values;
}
function prototypeUpdate() {
    var p = {value: 2}, o = Object.create(p), values = [];
    twice(readPrototype, o, values);
    p.value = 9;
    twice(readPrototype, o, values);
    requireTrue(!Object.prototype.hasOwnProperty.call(o, "value"), "receiver acquired own value");
    return values;
}
function methodReplacement() {
    var receiver;
    var p = {step: function (x) {
        requireTrue(this === receiver, "old method receiver");
        return x + this.bias;
    }};
    receiver = Object.create(p);
    receiver.bias = 4;
    var values = [callReplacedMethod(receiver, 1), callReplacedMethod(receiver, 1)];
    p.step = function (x) {
        requireTrue(this === receiver, "new method receiver");
        return x + this.bias + 10;
    };
    values.push(callReplacedMethod(receiver, 1), callReplacedMethod(receiver, 1));
    requireTrue(!Object.prototype.hasOwnProperty.call(receiver, "step"), "receiver acquired own method");
    return values;
}
function shadowAndDelete() {
    var p = {value: 3}, o = Object.create(p), values = [];
    twice(readShadowed, o, values);
    o.value = 11;
    requireTrue(Object.prototype.hasOwnProperty.call(o, "value"), "own shadow missing");
    twice(readShadowed, o, values);
    requireTrue(delete o.value, "delete failed");
    twice(readShadowed, o, values);
    requireTrue(!Object.prototype.hasOwnProperty.call(o, "value"), "own shadow retained");
    return values;
}
function receiverPrototypeChange() {
    var p1 = {value: 4}, p2 = {value: 12}, o = Object.create(p1), values = [];
    twice(readChangedPrototype, o, values);
    Object.setPrototypeOf(o, p2);
    twice(readChangedPrototype, o, values);
    requireTrue(Object.getPrototypeOf(o) === p2, "receiver prototype not changed");
    return values;
}
function intermediatePrototypeChange() {
    var p1 = {value: 5}, p2 = {value: 13}, middle = Object.create(p1);
    var o = Object.create(middle), values = [];
    twice(readChangedChain, o, values);
    Object.setPrototypeOf(middle, p2);
    twice(readChangedChain, o, values);
    requireTrue(Object.getPrototypeOf(o) === middle, "receiver itself was changed");
    return values;
}
function dataToGetter() {
    var p = {value: 6}, o = Object.create(p), values = [], calls = 0;
    var token = {expected: "getter exception"}, propagated = false;
    twice(readGetter, o, values);
    Object.defineProperty(p, "value", {configurable: true, enumerable: true,
        get: function () {
            requireTrue(this === o, "getter receiver");
            calls++;
            if (calls === 3) throw token;
            return 20 + calls;
        }
    });
    values.push(readGetter(o), readGetter(o));
    try { readGetter(o); }
    catch (e) {
        requireTrue(e === token, "wrong exception");
        propagated = true;
        values.push("expected_exception");
    }
    requireTrue(propagated, "getter exception swallowed");
    values.push(calls, propagated);
    return values;
}
function fourReceiverStructures() {
    var receivers = [], holders = [], values = [];
    function makeMethod(index, extra) {
        return function (x) {
            requireTrue(this === receivers[index], "four-map receiver");
            return this.bias + x + index * 100 + extra;
        };
    }
    for (var k = 0; k < 4; k++) {
        var p = {step: makeMethod(k, 0)}, o = Object.create(p);
        o.bias = (k + 1) * 10;
        // Distinct own key sets, not merely four identities with one shape.
        for (var j = 0; j <= k; j++) o["marker_" + k + "_" + j] = j;
        holders.push(p);
        receivers.push(o);
    }
    for (var r = 0; r < 2; r++) {
        for (var i = 0; i < 4; i++) values.push(callFourMaps(receivers[i], i + 1));
    }
    holders[3].step = makeMethod(3, 4100);
    for (var s = 0; s < 2; s++) {
        for (var t = 0; t < 4; t++) values.push(callFourMaps(receivers[t], t + 1));
    }
    return values;
}
var icCases = {
    own_update: ownUpdate,
    prototype_update: prototypeUpdate,
    method_replace: methodReplacement,
    shadow_delete: shadowAndDelete,
    receiver_prototype: receiverPrototypeChange,
    intermediate_prototype: intermediatePrototypeChange,
    data_to_getter: dataToGetter,
    four_receivers: fourReceiverStructures
};
requireTrue(IC_N === 1 || IC_N === 2, "unexpected N");
requireTrue(typeof icCases[IC_CASE] === "function", "unknown case");
var icRounds = [];
for (var icRound = 0; icRound < IC_N; icRound++) icRounds.push(icCases[IC_CASE]());
console.log("IC_CORRECTNESS=" + JSON.stringify({case: IC_CASE, n: IC_N, rounds: icRounds}));
