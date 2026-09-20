"use strict";

const text = "QuickJS|Ignition|字节码|🙂";
const transformed =
  text.slice(0, 7) +
  text.substring(8, 16) +
  text.replace("Ignition", "IGN");

let checksum = 2166136261 >>> 0;
for (let i = 0; i < transformed.length; i++) {
  checksum ^= transformed.charCodeAt(i);
  checksum = Math.imul(checksum, 16777619) >>> 0;
}
checksum = (checksum ^ text.indexOf("字节码")) >>> 0;

console.log("CHECKSUM:strings:" + checksum);
