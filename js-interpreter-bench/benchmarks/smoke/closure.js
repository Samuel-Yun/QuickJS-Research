"use strict";

function makeCounter(start, step) {
  let value = start;
  return function (multiplier) {
    value += step;
    return value * multiplier;
  };
}

const increasing = makeCounter(3, 2);
const decreasing = makeCounter(10, -1);
let checksum = 0;

for (let i = 0; i < 20; i++) {
  checksum += increasing((i % 3) + 1);
  checksum += decreasing((i % 4) + 1);
}

console.log("CHECKSUM:closure:" + checksum);
