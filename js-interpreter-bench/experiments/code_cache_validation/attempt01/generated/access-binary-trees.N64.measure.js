function __tebSunSpiderWorkload() {
/* The Great Computer Language Shootout
   http://shootout.alioth.debian.org/
   contributed by Isaac Gouy */

function TreeNode(left,right,item){
   this.left = left;
   this.right = right;
   this.item = item;
}

TreeNode.prototype.itemCheck = function(){
   if (this.left==null) return this.item;
   else return this.item + this.left.itemCheck() - this.right.itemCheck();
}

function bottomUpTree(item,depth){
   if (depth>0){
      return new TreeNode(
          bottomUpTree(2*item-1, depth-1)
         ,bottomUpTree(2*item, depth-1)
         ,item
      );
   }
   else {
      return new TreeNode(null,null,item);
   }
}

var ret = 0;

for ( var n = 4; n <= 7; n += 1 ) {
    var minDepth = 4;
    var maxDepth = Math.max(minDepth + 2, n);
    var stretchDepth = maxDepth + 1;
    
    var check = bottomUpTree(0,stretchDepth).itemCheck();
    
    var longLivedTree = bottomUpTree(0,maxDepth);
    for (var depth=minDepth; depth<=maxDepth; depth+=2){
        var iterations = 1 << (maxDepth - depth + minDepth);

        check = 0;
        for (var i=1; i<=iterations; i++){
            check += bottomUpTree(i,depth).itemCheck();
            check += bottomUpTree(-i,depth).itemCheck();
        }
    }

    ret += longLivedTree.itemCheck();
}

var expected = -4;
if (ret != expected)
    throw "ERROR: bad result: expected " + expected + " but got " + ret;
return String(ret);
}
;(function (__tebWorkload) {
  var __tebConfig = {"case":"access-binary-trees","N":64,"phase":"measure"}, __tebN = __tebConfig.N;
  var __tebIndex, __tebResult, __tebElapsed = null, __tebStarted = null, __tebStopped = null;
  var __tebAllowed = ["-4"];
  if (__tebConfig.phase === 'correctness') {
    for (__tebIndex = 0; __tebIndex < __tebN; ++__tebIndex) {
      __tebResult = __tebWorkload();
      if (__tebAllowed.indexOf(__tebResult) < 0)
        throw new Error('checksum mismatch at call ' + __tebIndex + ':' + __tebResult);
    }
  } else {
    __tebStarted = benchNow();
    for (__tebIndex = 0; __tebIndex < __tebN; ++__tebIndex)
      __tebResult = __tebWorkload();
    __tebStopped = benchNow();
    __tebElapsed = __tebStopped - __tebStarted;
    if (__tebAllowed.indexOf(__tebResult) < 0) throw new Error('checksum mismatch');
  }
  if (__tebElapsed !== null && (!Number.isFinite(__tebElapsed) || __tebElapsed < 0))
    throw new Error('invalid monotonic interval');
  console.log('TEB_RESULT:' + JSON.stringify({
    benchmark: 'SunSpider', case: __tebConfig.case, mode: 'MAIN_MONOTONIC_V1',
    phase: __tebConfig.phase, N: __tebN, checksum: __tebResult, correctness: 'PASS',
    timer: 'benchNow', start_ms: __tebStarted, stop_ms: __tebStopped, elapsed_ms: __tebElapsed,
    elapsed_per_call_ms: __tebElapsed === null ? null : __tebElapsed / __tebN, warmup_calls: 0
  }));
})(__tebSunSpiderWorkload);
