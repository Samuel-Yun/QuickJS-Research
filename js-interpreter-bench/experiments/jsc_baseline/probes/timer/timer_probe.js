function inspectClock(name, clock) {
    var last = clock();
    var minPositiveDelta = Infinity;
    var backwards = 0;
    var changes = 0;
    for (var i = 0; i < 100000; ++i) {
        var now = clock();
        var delta = now - last;
        if (delta < 0)
            ++backwards;
        if (delta > 0) {
            ++changes;
            if (delta < minPositiveDelta)
                minPositiveDelta = delta;
        }
        last = now;
    }
    print(name + ':changes=' + changes + ',min_positive_delta_ms=' +
        (minPositiveDelta === Infinity ? 'NONE' : minPositiveDelta) +
        ',backwards=' + backwards);
}
inspectClock('Date.now', Date.now);
if (typeof performance !== 'undefined' && typeof performance.now === 'function')
    inspectClock('performance.now', function () { return performance.now(); });
else
    print('performance.now:UNAVAILABLE');
