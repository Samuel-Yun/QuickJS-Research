// Independent diagnostic ONLY; not a modification of a frozen workload.
print('CC_TOP:' + JSON.stringify({prior:typeof globalThis.__ccState, objectPrior:typeof globalThis.__ccHeap}));
if (typeof globalThis.__ccState !== 'undefined') throw new Error('producer global leaked');
globalThis.__ccState = 0;
globalThis.__ccHeap = {value:0};
function cacheStaticCallee(x) { return x * 3 + 1; }
function cacheStaticWorkload() {
  if (++globalThis.__ccState === 1) print('CC_FIRST_CALL');
  var sum=0;
  for(var i=0;i<1000;++i) sum += cacheStaticCallee(i);
  globalThis.__ccHeap.value=sum;
  return sum;
}
print('CC_TIMER_START');
var __ccStart=benchNow();
var __ccResult=cacheStaticWorkload();
var __ccStop=benchNow();
print('CC_TIMER_STOP');
if (__ccResult!==1499500 || __ccState!==1 || __ccHeap.value!==1499500) throw new Error('probe correctness');
print('CC_RESULT:'+JSON.stringify({checksum:__ccResult,calls:__ccState,elapsed_ms:__ccStop-__ccStart}));
