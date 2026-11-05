;(function () {
  'use strict';
  var __wbCfg = {"variant":"navier_array","group":"navier","N":128,"expected":144411880};
  var __wbData, __wbSource, __wbAcc = 0;
  if (__wbCfg.group === 'richards') {
    __wbData = new Array(1024);
    for (var __wbI=0; __wbI<1024; ++__wbI)
      __wbData[__wbI] = {link:null,id:__wbI,priority:0,queue:null,task:null,state:__wbI&7};
  } else {
    __wbData = new Array(4356); __wbSource = new Array(4356);
    for(var __wbI=0;__wbI<4356;__wbI++) {__wbData[__wbI]=0;__wbSource[__wbI]=0;}
    for(var __wbJ=1;__wbJ<=64;__wbJ++)for(var __wbI=1;__wbI<=64;__wbI++)
      __wbSource[__wbJ*66+__wbI]=((__wbI*17+__wbJ*31)&255)/256;
  }
  function __wbKernel(x,x0) {
  var width=64,height=64,rowSize=66,iterations=20,a=1,invC=0.25;
  for(var k=0;k<iterations;k++)for(var j=1;j<=height;j++) {
    var lastRow=(j-1)*rowSize,currentRow=j*rowSize,nextRow=(j+1)*rowSize;
    var lastX=x[currentRow];++currentRow;
    for(var i=1;i<=width;i++)
      lastX=x[currentRow]=(x0[currentRow]+a*(lastX+x[++currentRow]+x[++lastRow]+x[++nextRow]))*invC;
  }
  return 0;
}

  var __wbStart=benchNow();
  for(var __wbRep=0;__wbRep<__wbCfg.N;__wbRep++)
    __wbAcc=(__wbAcc+__wbKernel(__wbData,__wbSource))>>>0;
  var __wbStop=benchNow();
  var __wbChecksum=__wbAcc;
  if(__wbCfg.group==='navier') {
    __wbChecksum=0;
    for(var __wbI=0;__wbI<4356;__wbI++)
      __wbChecksum=(__wbChecksum+Math.floor(__wbData[__wbI]*1048576+0.5))>>>0;
  }
  if(__wbChecksum!==__wbCfg.expected)throw new Error('checksum '+__wbChecksum+' expected '+__wbCfg.expected);
  console.log('WB_RESULT:'+JSON.stringify({mode:'MAIN_MONOTONIC_V1_DERIVED',variant:__wbCfg.variant,
    N:__wbCfg.N,checksum:__wbChecksum,correctness:'PASS',warmup_calls:0,
    start_ms:__wbStart,stop_ms:__wbStop,elapsed_ms:__wbStop-__wbStart}));
})();
