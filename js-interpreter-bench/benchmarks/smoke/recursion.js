"use strict";

function fibonacci(n) {
  if (n < 2) {
    return n;
  }
  return fibonacci(n - 1) + fibonacci(n - 2);
}

function factorial(n) {
  return n <= 1 ? 1 : n * factorial(n - 1);
}

function gcd(a, b) {
  return b === 0 ? a : gcd(b, a % b);
}

const checksum = fibonacci(20) + factorial(10) + gcd(1071, 462);
console.log("CHECKSUM:recursion:" + checksum);
