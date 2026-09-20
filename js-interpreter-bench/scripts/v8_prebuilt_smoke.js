"use strict";

function add(a, b) {
  return a + b;
}

const values = [1, 2, 3, 4];
const object = { label: "v8", total: 0 };
for (const value of values) {
  object.total = add(object.total, value);
}

if (object.total !== 10 || object.label !== "v8") {
  throw new Error("V8 prebuilt smoke test failed");
}

print("V8_PREBUILT_SMOKE=PASS total=" + object.total);
