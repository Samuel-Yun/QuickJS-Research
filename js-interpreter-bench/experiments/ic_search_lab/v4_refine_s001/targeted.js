(function () {
    var assertions = 0;
    function eq(actual, expected) {
        assertions++;
        if (actual !== expected) throw Error("refine " + assertions + " " + actual + " / " + expected);
    }
    function read(o) { return o.x; }
    function invoke(o, x) { return o.step(x); }
    var a = {x: 11}, b = {x: 22, extra: 0}, c = {pad: 0, x: 33};
    for (var i = 0; i < 512; i++) {
        eq(read(a), 11); eq(read(b), 22); eq(read(c), 33);
    }
    a.x = 99; b.x = "changed"; c.x = 1.25;
    eq(read(a), 99); eq(read(b), "changed"); eq(read(c), 1.25);
    var nested = {answer: 42}; b.x = nested; eq(read(b), nested);
    delete b.x; eq(read(b), undefined);
    b.y = 78; eq(read(b), undefined);
    Object.setPrototypeOf(b, {x: 71}); eq(read(b), 71);
    Object.defineProperty(b, "x", {configurable: true, get: function () { return this.y + 1; }});
    eq(read(b), 79);
    Object.defineProperty(b, "x", {configurable: true, value: 81, writable: false});
    eq(read(b), 81);
    delete b.x; eq(read(b), 71);
    Object.setPrototypeOf(b, {x: 73}); eq(read(b), 73);
    var calls = 0;
    var proxy = new Proxy({x: 91}, {
        get: function (target, key, receiver) { calls++; return Reflect.get(target, key, receiver); }
    });
    eq(read(proxy), 91); eq(read(proxy), 91); eq(calls, 2);
    var fail = {get x() { throw Error("expected getter"); }};
    var thrown = false;
    try { read(fail); } catch (error) { thrown = error.message === "expected getter"; }
    eq(thrown, true);
    var step = function (x) { return this.bias + x; };
    var own = {bias: 3, step: step};
    var inherited = Object.create({step: step}); inherited.bias = 5;
    for (i = 0; i < 64; i++) {
        eq(invoke(own, i), i + 3); eq(invoke(inherited, i), i + 5);
    }
    var special = [{x: 1}, [1, 2], new String("abc"), new Uint8Array(4)];
    special[1].x = 2; special[2].x = 3; special[3].x = 4;
    for (i = 0; i < special.length; i++) eq(read(special[i]), i + 1);
    for (i = 0; i < 64; i++) {
        var object = {x: i};
        eq(read(object), i);
        for (var j = 0; j < 8; j++) object["p" + j] = j;
        eq(read(object), i);
        delete object.x;
        eq(read(object), undefined);
        object.x = i + 1; eq(read(object), i + 1);
    }
    eq(read("text"), undefined); eq(read(7), undefined);
    console.log("REFINE_TARGETED_PASS:" + assertions);
})();
