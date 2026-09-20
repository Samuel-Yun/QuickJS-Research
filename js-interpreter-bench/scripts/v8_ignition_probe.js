"use strict";

const iterations = arguments.length > 0 ? Number(arguments[0]) : 200000;

function hot(value) {
  return ((value + 7) * 3) | 0;
}

let checksum = 0;
for (let i = 0; i < iterations; i++) {
  checksum = (checksum + hot(i)) | 0;
}

print("V8_IGNITION_PROBE iterations=" + iterations + " checksum=" + checksum);
