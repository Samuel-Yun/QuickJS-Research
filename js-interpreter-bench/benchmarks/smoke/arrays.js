"use strict";

const values = [];
for (let i = 0; i < 40; i++) {
  values.push((i * i + 3 * i) % 97);
}

values.reverse();
values.splice(5, 3, 11, 22, 33);

let checksum = 0;
for (let i = 0; i < values.length; i++) {
  checksum = (checksum + values[i] * (i + 1)) % 1000003;
}

console.log("CHECKSUM:arrays:" + checksum);
