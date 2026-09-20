"use strict";

function add(a, b) {
  return a + b;
}

function multiply(a, b) {
  return a * b;
}

function applyTwice(fn, value, argument) {
  return fn(fn(value, argument), argument);
}

let checksum = 0;
for (let i = 1; i <= 50; i++) {
  checksum += applyTwice(add, i, 3) + multiply(i % 7, i % 11);
}

console.log("CHECKSUM:functions:" + checksum);
