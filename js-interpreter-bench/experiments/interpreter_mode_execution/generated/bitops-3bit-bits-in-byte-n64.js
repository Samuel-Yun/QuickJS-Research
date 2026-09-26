function workload() {
// Copyright (c) 2004 by Arthur Langereis (arthur_ext at domain xfinitegames, tld com

var result = 0;

// 1 op = 6 ANDs, 3 SHRs, 3 SHLs, 4 assigns, 2 ADDs
// O(1)
function fast3bitlookup(b) {
var c, bi3b = 0xE994; // 0b1110 1001 1001 0100; // 3 2 2 1  2 1 1 0
c  = 3 & (bi3b >> ((b << 1) & 14));
c += 3 & (bi3b >> ((b >> 2) & 14));
c += 3 & (bi3b >> ((b >> 5) & 6));
return c;

/*
lir4,0xE994; 9 instructions, no memory access, minimal register dependence, 6 shifts, 2 adds, 1 inline assign
rlwinmr5,r3,1,28,30
rlwinmr6,r3,30,28,30
rlwinmr7,r3,27,29,30
rlwnmr8,r4,r5,30,31
rlwnmr9,r4,r6,30,31
rlwnmr10,r4,r7,30,31
addr3,r8,r9
addr3,r3,r10
*/
}


function TimeFunc(func) {
var x, y, t;
var sum = 0;
for(var x=0; x<500; x++)
for(var y=0; y<256; y++) sum += func(y);
return sum;
}

sum = TimeFunc(fast3bitlookup);

var expected = 512000;
if (sum != expected)
    throw "ERROR: bad result: expected " + expected + " but got " + sum;

return String(sum);
}
var lastResult;
var timerStart = Date.now();
for (var repeatIndex = 0; repeatIndex < 64; ++repeatIndex) lastResult = workload();
var elapsedMs = Date.now() - timerStart;
var allowedChecksums = ["512000"];
if (allowedChecksums.indexOf(lastResult) < 0) throw Error('checksum mismatch: ' + lastResult);
if (!Number.isInteger(elapsedMs) || elapsedMs < 0) throw Error('invalid elapsed time');
console.log('IM_EXEC:' + JSON.stringify({test:"bitops-3bit-bits-in-byte",n:64,elapsed_ms:elapsedMs,checksum:lastResult}));
