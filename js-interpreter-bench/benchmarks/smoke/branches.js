"use strict";

let checksum = 0;
for (let i = 0; i < 1000; i++) {
  switch (i % 6) {
    case 0:
      checksum += i * 3;
      break;
    case 1:
      checksum -= i * 2;
      break;
    case 2:
      checksum += Math.floor(i / 2);
      break;
    case 3:
      checksum ^= i;
      break;
    case 4:
      checksum += 17;
      break;
    default:
      checksum -= 9;
      break;
  }

  if (i % 4 === 0) {
    checksum += 5;
  } else if (i % 4 === 1) {
    checksum -= 3;
  }
}

console.log("CHECKSUM:branches:" + checksum);
