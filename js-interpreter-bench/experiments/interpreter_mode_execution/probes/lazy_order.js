"use strict";

function nestedProbe(value) {
  return Math.imul(value + 11, 7);
}

function workload() {
  var result = 0;
  for (var i = 0; i < 31; ++i) result += nestedProbe(i);
  return result;
}

print("MARKER_BEFORE_TIMER");
var start = Date.now();
var checksum = workload();
var elapsed = Date.now() - start;
print("MARKER_AFTER_TIMER checksum=" + checksum + " elapsed_ms=" + elapsed);
