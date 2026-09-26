function workload() {
// Copyright (c) 2004 by Arthur Langereis (arthur_ext at domain xfinitegames, tld com)


var result = 0;

// 1 op = 2 assigns, 16 compare/branches, 8 ANDs, (0-8) ADDs, 8 SHLs
// O(n)
function bitsinbyte(b) {
var m = 1, c = 0;
while(m<0x100) {
if(b & m) c++;
m <<= 1;
}
return c;
}

function TimeFunc(func) {
var x, y, t;
var sum = 0;
for(var x=0; x<350; x++)
for(var y=0; y<256; y++) sum += func(y);
return sum;
}

result = TimeFunc(bitsinbyte);

var expected = 358400;
if (result != expected)
    throw "ERROR: bad result: expected " + expected + " but got " + result;


return String(result);
}
var lastResult;
var timerStart = Date.now();
for (var repeatIndex = 0; repeatIndex < 1; ++repeatIndex) lastResult = workload();
var elapsedMs = Date.now() - timerStart;
var allowedChecksums = ["358400"];
if (allowedChecksums.indexOf(lastResult) < 0) throw Error('checksum mismatch: ' + lastResult);
if (!Number.isInteger(elapsedMs) || elapsedMs < 0) throw Error('invalid elapsed time');
console.log('IM_EXEC:' + JSON.stringify({test:"bitops-bits-in-byte",n:1,elapsed_ms:elapsedMs,checksum:lastResult}));
