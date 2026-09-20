"use strict";

let checksum = 17;
for (let i = 1; i <= 250; i++) {
  checksum = (checksum * 31 + i * 7 - (i % 5) * 11) % 1000003;
}

console.log("CHECKSUM:integer_arithmetic:" + checksum);
