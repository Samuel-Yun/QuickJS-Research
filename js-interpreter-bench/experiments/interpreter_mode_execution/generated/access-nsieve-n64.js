function workload() {
// The Great Computer Language Shootout
// http://shootout.alioth.debian.org/
//
// modified by Isaac Gouy

function pad(number,width){
   var s = number.toString();
   var prefixWidth = width - s.length;
   if (prefixWidth>0){
      for (var i=1; i<=prefixWidth; i++) s = " " + s;
   }
   return s;
}

function nsieve(m, isPrime){
   var i, k, count;

   for (i=2; i<=m; i++) { isPrime[i] = true; }
   count = 0;

   for (i=2; i<=m; i++){
      if (isPrime[i]) {
         for (k=i+i; k<=m; k+=i) isPrime[k] = false;
         count++;
      }
   }
   return count;
}

function sieve() {
    var sum = 0;
    for (var i = 1; i <= 3; i++ ) {
        var m = (1<<i)*10000;
        var flags = Array(m+1);
        sum += nsieve(m, flags);
    }
    return sum;
}

var result = sieve();

var expected = 14302;
if (result != expected)
    throw "ERROR: bad result: expected " + expected + " but got " + result;



return String(result);
}
var lastResult;
var timerStart = Date.now();
for (var repeatIndex = 0; repeatIndex < 64; ++repeatIndex) lastResult = workload();
var elapsedMs = Date.now() - timerStart;
var allowedChecksums = ["14302"];
if (allowedChecksums.indexOf(lastResult) < 0) throw Error('checksum mismatch: ' + lastResult);
if (!Number.isInteger(elapsedMs) || elapsedMs < 0) throw Error('invalid elapsed time');
console.log('IM_EXEC:' + JSON.stringify({test:"access-nsieve",n:64,elapsed_ms:elapsedMs,checksum:lastResult}));
