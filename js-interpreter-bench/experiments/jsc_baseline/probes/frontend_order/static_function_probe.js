function staticWorkload(x) {
    var sum = 0;
    for (var i = 0; i < 100; ++i)
        sum += (x + i) ^ 7;
    return sum;
}
printErr('MARKER_BEFORE_TIMER');
var started = Date.now();
printErr('MARKER_TIMER_START');
var result = staticWorkload(7);
var elapsed = Date.now() - started;
printErr('MARKER_TIMER_STOP');
print('FRONTEND_RESULT:' + result + ':' + elapsed);
