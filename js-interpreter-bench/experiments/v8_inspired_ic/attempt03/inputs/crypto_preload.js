// BENCH_ONLY_XORSHIFT32_PRELOAD_V1; NEVER use this deterministic RNG for security.
// Installed before base.js/crypto.js; state is never reset in Setup or Run.
var __icoRngSeed=305419896, __icoRngState=__icoRngSeed>>>0;
Math.random=function(){
  var s=__icoRngState;s^=s<<13;s^=s>>>17;s^=s<<5;
  __icoRngState=s>>>0;return __icoRngState/4294967296;
};
