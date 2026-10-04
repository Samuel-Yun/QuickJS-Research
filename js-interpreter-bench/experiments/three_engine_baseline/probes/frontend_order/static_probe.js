function __tebStaticChild(value) { return (value + 3) ^ 7; }
function __tebStaticWorkload(value) {
  var sum = 0;
  for (var i = 0; i < 100; ++i) sum += __tebStaticChild(value + i);
  return sum;
}
__TEB_marker('TEB_BEFORE_PREPARE');
// Only getter APIs; neither function is executed before the timer marker.
if (typeof numberOfDFGCompiles === 'function')
  __TEB_marker('TEB_CODEBLOCK_PRESENCE_BEFORE:' + numberOfDFGCompiles(__tebStaticWorkload));
__TEB_marker('TEB_TIMER_START');
var __tebStaticStart = Date.now();
var __tebStaticResult = __tebStaticWorkload(7);
var __tebStaticElapsed = Date.now() - __tebStaticStart;
__TEB_marker('TEB_TIMER_STOP');
if (typeof numberOfDFGCompiles === 'function')
  __TEB_marker('TEB_CODEBLOCK_PRESENCE_AFTER:' + numberOfDFGCompiles(__tebStaticWorkload));
print('TEB_STATIC_RESULT:' + __tebStaticResult);
