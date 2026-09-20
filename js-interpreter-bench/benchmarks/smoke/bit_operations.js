"use strict";

let checksum = 0x12345678;
for (let i = 0; i < 128; i++) {
  checksum = Math.imul(checksum ^ i, 2654435761) >>> 0;
  checksum = ((checksum << 7) | (checksum >>> 25)) >>> 0;
  checksum = (checksum ^ (checksum >>> 13)) >>> 0;
}

console.log("CHECKSUM:bit_operations:" + (checksum >>> 0));
