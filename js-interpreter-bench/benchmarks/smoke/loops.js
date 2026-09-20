"use strict";

let checksum = 0;
for (let i = 1; i <= 30; i++) {
  for (let j = 1; j <= 20; j++) {
    let k = 0;
    while (k < 5) {
      checksum += (i * j + k) % 97;
      k++;
    }
  }
}

console.log("CHECKSUM:loops:" + checksum);
