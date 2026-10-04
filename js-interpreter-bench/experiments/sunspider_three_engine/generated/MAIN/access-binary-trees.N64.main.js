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
  var __tebConfig = {"case":"access-binary-trees","N":64,"mode":"main"};
  var __tebN = __tebConfig.N;
  var __tebIndex, __tebResult, __tebElapsed = null;
  var __tebAllowed = ["-4"];
  if (__tebConfig.mode === 'correctness') {
    for (__tebIndex = 0; __tebIndex < __tebN; ++__tebIndex) {
      __tebResult = __tebWorkload();
      if (__tebAllowed.indexOf(__tebResult) < 0)
        throw new Error('checksum mismatch at call ' + __tebIndex + ':' + __tebResult);
    }
  } else {
    // DIAGNOSTIC is a separate, explicitly warmed policy, never mixed into MAIN.
    if (__tebConfig.mode === 'diagnostic') __tebWorkload();
    if (__tebConfig.mode === 'frontend') __TEB_marker('TEB_TIMER_START');
    var __tebStarted = Date.now();
    for (__tebIndex = 0; __tebIndex < __tebN; ++__tebIndex)
      __tebResult = __tebWorkload();
    __tebElapsed = Date.now() - __tebStarted;
    if (__tebConfig.mode === 'frontend') __TEB_marker('TEB_TIMER_STOP');
    if (__tebAllowed.indexOf(__tebResult) < 0) throw new Error('checksum mismatch');
  }
  if (__tebElapsed !== null && (!Number.isInteger(__tebElapsed) || __tebElapsed < 0))
    throw new Error('invalid timer interval');
  console.log('TEB_RESULT:' + JSON.stringify({
    benchmark: 'SunSpider', case: __tebConfig.case, mode: __tebConfig.mode,
    N: __tebN, checksum: __tebResult, correctness: 'PASS',
    timer: 'Date.now', elapsed_ms: __tebElapsed,
    elapsed_per_call_ms: __tebElapsed === null ? null : __tebElapsed / __tebN,
    warmup_calls: __tebConfig.mode === 'diagnostic' ? 1 : 0
  }));
})(__tebSunSpiderWorkload);
