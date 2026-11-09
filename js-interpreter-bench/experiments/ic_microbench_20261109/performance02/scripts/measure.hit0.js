globalThis.scriptArgs = ["own_read.js", "--hit-percent", "0", "--iterations", "201326592", "--sequence-length", "65536", "--min-ms", "0"];
/* Standalone QuickJS microbenchmark. See README.md for the cache model. */
"use strict";

function options(args) {
    var result = {hitPercent: 100, iterations: 201326592,
                  sequenceLength: 65536, minMs: 3000, selfTest: false};
    var names = {"--hit-percent": "hitPercent", "--iterations": "iterations",
                 "--sequence-length": "sequenceLength", "--min-ms": "minMs"};
    for (var i = 1; i < args.length; i++) {
        var arg = args[i];
        if (arg === "--self-test") { result.selfTest = true; continue; }
        if (arg === "--help") {
            print("qjs own_read.js [--hit-percent 0..100] [--iterations N] " +
                  "[--sequence-length power_of_two] [--min-ms 3000] [--self-test]");
            return null;
        }
        if (!Object.prototype.hasOwnProperty.call(names, arg) || i + 1 >= args.length)
            throw Error("Unknown or incomplete option: " + arg);
        var value = Number(args[++i]);
        if (!Number.isFinite(value)) throw Error("Invalid number for " + arg);
        result[names[arg]] = value;
    }
    if (result.hitPercent < 0 || result.hitPercent > 100)
        throw Error("hit-percent must be in [0, 100]");
    // Keep both i and sum=3*N within the signed int32 range for every setting.
    if (!Number.isInteger(result.iterations) || result.iterations < 1 ||
        result.iterations > 500000000)
        throw Error("iterations must be an integer in [1, 500000000]");
    var length = result.sequenceLength;
    if (!Number.isInteger(length) || length < 2 || length > 1048576 ||
        (length & (length - 1)) !== 0)
        throw Error("sequence-length must be a power of two in [2, 1048576]");
    if (result.minMs < 0) throw Error("min-ms must be nonnegative");
    return result;
}

function makeSequence(hitPercent, length) {
    // x has the same slot and value in both layouts; padding names change shape.
    // Each layout has two distinct receiver objects with the same shape.
    var objects = [{x: 3, a: 0}, {x: 3, a: 0},
                   {x: 3, b: 0}, {x: 3, b: 0}];
    var sequence = new Array(length), shapes = new Uint8Array(length);
    var half = length / 2;
    var pairs = Math.round((1 - hitPercent / 100) * half);
    // A cycle needs an even number of shape changes. Reserve zero for 100%.
    if (hitPercent < 100 && pairs === 0) pairs = 1;
    var position = 0;
    if (pairs === 0) {
        for (var i = 0; i < length; i++) {
            shapes[i] = 0;
            sequence[i] = objects[i & 1];
        }
    } else {
        // Paired equal runs keep the two shapes exactly 50:50 at every rate <100.
        for (var pair = 0; pair < pairs; pair++) {
            var run = Math.floor((pair + 1) * half / pairs) -
                      Math.floor(pair * half / pairs);
            for (var shape = 0; shape < 2; shape++) {
                for (var j = 0; j < run; j++) {
                    shapes[position] = shape;
                    sequence[position] = objects[shape * 2 + ((position >>> 1) & 1)];
                    position++;
                }
            }
        }
        if (position !== length) throw Error("sequence construction failed");
    }
    return {sequence: sequence, shapes: shapes, cycleTransitions: pairs * 2};
}

function model(shapes, iterations) {
    var length = shapes.length, tail = iterations % length;
    var changes = 0, prefixChanges = 0;
    for (var i = 1; i < length; i++) {
        if (shapes[i] !== shapes[i - 1]) {
            changes++;
            if (i < tail) prefixChanges++;
        }
    }
    var boundary = shapes[0] !== shapes[length - 1] ? 1 : 0;
    var transitions = Math.floor(iterations / length) * (changes + boundary) +
                      prefixChanges - (tail === 0 ? boundary : 0);
    // Initially empty, one-entry last-shape cache, successful fill on every miss.
    var misses = transitions + 1;
    return {hits: iterations - misses, misses: misses,
            hitPercent: 100 * (iterations - misses) / iterations,
            cyclicHitPercent: 100 * (1 - (changes + boundary) / length)};
}

// Exactly one named property-read site in the timed kernel. No RNG, shape
// construction, rate-dependent branch, counter or clock call inside this loop.
function readLoop(sequence, iterations, mask) {
    var obj, sum = 0;
    for (var i = 0; i < iterations; i++) {
        obj = sequence[i & mask];
        sum += obj.x;
    }
    return sum;
}

function selfTest() {
    var tests = 0;
    for (var length of [2, 8, 64]) {
        for (var rate of [0, 25, 50, 75, 90, 99, 100]) {
            var data = makeSequence(rate, length), zeros = 0;
            for (var shape of data.shapes) if (shape === 0) zeros++;
            if (rate < 100 && zeros !== length / 2) throw Error("shape balance");
            for (var n of [1, 2, length - 1, length, length + 1, length * 3 + 5]) {
                var hits = 0, previous = -1;
                for (var i = 0; i < n; i++) {
                    var current = data.shapes[i & (length - 1)];
                    if (current === previous) hits++;
                    previous = current;
                }
                var expected = model(data.shapes, n);
                if (hits !== expected.hits || expected.misses !== n - hits)
                    throw Error("cache-model mismatch");
                // Use a separate target function so readLoop remains uncalled.
                var sum = 0;
                for (var j = 0; j < n; j++) sum += data.sequence[j & (length - 1)].x;
                if (sum !== 3 * n) throw Error("checksum mismatch");
                tests++;
            }
        }
    }
    print(JSON.stringify({kind: "self_test", status: "PASS", cases: tests}));
}

function main() {
    var config = options(scriptArgs);
    if (config === null) return;
    if (config.selfTest) { selfTest(); return; }
    if (typeof performance !== "object" || typeof performance.now !== "function")
        throw Error("A monotonic performance.now() is required");
    var data = makeSequence(config.hitPercent, config.sequenceLength);
    var prediction = model(data.shapes, config.iterations);
    var mask = config.sequenceLength - 1;
    var start = performance.now();
    var checksum = readLoop(data.sequence, config.iterations, mask);
    var elapsedMs = performance.now() - start;
    if (checksum !== config.iterations * 3) throw Error("wrong checksum");
    var durationPass = elapsedMs > config.minMs;
    print(JSON.stringify({kind: "own_read", requested_hit_percent: config.hitPercent,
        iterations: config.iterations, sequence_length: config.sequenceLength,
        modeled_hits: prediction.hits, modeled_misses: prediction.misses,
        modeled_hit_percent: prediction.hitPercent,
        cyclic_hit_percent: prediction.cyclicHitPercent,
        actual_ic_hit_percent: null, checksum: checksum, elapsed_ms: elapsedMs,
        ns_per_read_including_loop: elapsedMs * 1e6 / config.iterations,
        warmup_calls: 0, min_ms: config.minMs, duration_pass: durationPass}));
    if (!durationPass)
        throw Error("Timed kernel must exceed " + config.minMs +
                    " ms; increase --iterations (current " + config.iterations + ")");
}

main();
