"use strict";

let sum = 0.0;
for (let i = 1; i <= 1000; i++) {
  sum += i / 10.0;
}

const mixed = (sum / 3.0) * 0.75;
const checksum = Math.round(mixed * 1000.0);
console.log("CHECKSUM:floating_point:" + checksum);
