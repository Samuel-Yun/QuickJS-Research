"use strict";

const iterations = arguments.length > 0 ? Number(arguments[0]) : 500000;

if (!Number.isFinite(iterations) || iterations < 1) {
  throw new Error("iterations must be a positive finite number");
}

function tierProbeTarget(value) {
  let result = Math.imul((value | 0) + 17, 31);
  result ^= result >>> 7;
  return result | 0;
}

let checksum = 0;
for (let i = 0; i < iterations; i++) {
  checksum = (checksum + tierProbeTarget(i)) | 0;
}

print(
  "V8_TIER_PROBE iterations=" + iterations +
  " checksum=" + checksum
);
