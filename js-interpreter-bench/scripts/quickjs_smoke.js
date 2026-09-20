"use strict";

(function () {
    let failures = 0;

    function check(name, actual, expected) {
        if (actual === expected) {
            print("PASS " + name + ": " + String(actual));
        } else {
            failures++;
            print("FAIL " + name + ": expected=" + String(expected) +
                  " actual=" + String(actual));
        }
    }

    check("arithmetic", 6 * 7 + 8, 50);

    let sum = 0;
    for (let i = 1; i <= 100; i++) {
        sum += i;
    }
    check("loop", sum, 5050);

    function add(a, b) {
        return a + b;
    }
    check("function", add(19, 23), 42);

    const values = [3, 5, 7];
    check("array", values[0] + values[2] + values.length, 13);

    const object = { base: 40, offset: 2 };
    check("object_property", object.base + object.offset, 42);

    const text = "Quick" + "JS" + " " + "baseline";
    check("string", text, "QuickJS baseline");

    if (failures !== 0) {
        throw new Error("Smoke test failures: " + failures);
    }

    print("SMOKE_RESULT: PASS");
})();
