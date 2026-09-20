"use strict";

let checksum = 0;

function guarded(value) {
  try {
    if (value % 5 === 0) {
      throw new RangeError("multiple of five");
    }
    if (value % 7 === 0) {
      throw value;
    }
    checksum += value;
  } catch (error) {
    if (error instanceof RangeError) {
      checksum += 100 + value;
    } else {
      checksum += 200 + error;
    }
  } finally {
    checksum += 3;
  }
}

for (let i = 1; i <= 30; i++) {
  guarded(i);
}

try {
  try {
    throw new Error("x");
  } finally {
    checksum += 17;
  }
} catch (error) {
  checksum += error.message.charCodeAt(0);
}

console.log("CHECKSUM:exceptions:" + checksum);
