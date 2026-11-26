// One readX bytecode site; sequence construction is outside timing.
function readX(o) { return o.x; }
function run(sequence, n) {
    var sum = 0;
    for (var i = 0; i < n; i++) sum += readX(sequence[i & 1]);
    return sum;
}
var n = scriptArgs.length > 1 ? +scriptArgs[1] : 1048576;
var a = {x: 3, a: 0};
var b = {x: 3, b: 0};
var sequence = [a, a];
var start = Date.now();
var checksum = run(sequence, n);
var elapsed = Date.now() - start;
if (checksum !== 3 * n) throw Error('checksum: ' + checksum);
print(JSON.stringify({iterations: n, checksum: checksum, elapsed_ms: elapsed}));
