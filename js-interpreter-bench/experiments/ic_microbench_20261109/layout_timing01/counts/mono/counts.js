globalThis.scriptArgs = ["own_read_layouts.js", "--shapes", "1", "--run-length", "1", "--sequence-length", "1048576", "--iterations", "65536", "--warmup-cycles", "2", "--phase", "0", "--min-ms", "0"];
/* Many ordinary own-property layouts; all allocation is outside the hot loop. */
"use strict";

function options(args) {
    var c = {shapes: 65536, runLength: 1, sequenceLength: 1048576,
             iterations: 201326592, warmupCycles: 2, phase: 0, minMs: 3000};
    var keys = {"--shapes": "shapes", "--run-length": "runLength",
        "--sequence-length": "sequenceLength", "--iterations": "iterations",
        "--warmup-cycles": "warmupCycles", "--phase": "phase", "--min-ms": "minMs"};
    for (var i = 1; i < args.length; i++) {
        var name = args[i];
        if (name === "--help") {
            print("qjs own_read_layouts.js [--shapes 65536] [--run-length 1] " +
                "[--sequence-length 1048576] [--iterations 201326592] " +
                "[--warmup-cycles 2] [--phase 0] [--min-ms 3000]");
            return null;
        }
        if (!Object.prototype.hasOwnProperty.call(keys, name) || i + 1 >= args.length)
            throw Error("Unknown/incomplete option: " + name);
        var v = Number(args[++i]);
        if (!Number.isFinite(v) || !Number.isInteger(v) || v < 0)
            throw Error("Expected nonnegative integer: " + name);
        c[keys[name]] = v;
    }
    for (var key of ["shapes", "runLength", "sequenceLength"]) {
        var n = c[key];
        if (n < 1 || n > 8388608 || (n & (n - 1)) !== 0)
            throw Error(key + " must be a power of two in [1, 8388608]");
    }
    if (c.shapes > 65536 || c.shapes * c.runLength > c.sequenceLength)
        throw Error("Require shapes<=65536 and shapes*runLength<=sequenceLength");
    if (c.iterations < 1 || c.iterations > 500000000 || c.warmupCycles > 16 ||
        c.warmupCycles * c.sequenceLength > 500000000)
        throw Error("Iteration/warmup limit exceeded");
    return c;
}

function makeSequence(config) {
    var objects = new Array(config.shapes);
    for (var i = 0; i < objects.length; i++) {
        // A unique ordinary prototype gives every receiver a distinct Map.
        // Alternate x's insertion position to avoid one shared field handler
        // covering all layouts through V8's homomorphic IC.
        var obj = Object.create({});
        if (i & 1) { obj.pad = 0; obj.x = 3; }
        else { obj.x = 3; obj.pad = 0; }
        objects[i] = obj;
    }
    var sequence = new Array(config.sequenceLength);
    for (var j = 0; j < sequence.length; j++) {
        var index = (Math.floor(j / config.runLength) + config.phase) & (config.shapes - 1);
        sequence[j] = objects[index];
    }
    return {objects: objects, sequence: sequence};
}

function readLoop(sequence, iterations, mask) {
    var obj, sum = 0;
    for (var i = 0; i < iterations; i++) {
        obj = sequence[i & mask];
        sum += obj.x;
    }
    return sum;
}

function main() {
    var config = options(scriptArgs);
    if (config === null) return;
    var data = makeSequence(config), mask = config.sequenceLength - 1;
    if (typeof globalThis.validateLayouts === "function") validateLayouts(data.objects);
    var warmupIterations = config.sequenceLength * config.warmupCycles;
    if (warmupIterations && readLoop(data.sequence, warmupIterations, mask) !== warmupIterations * 3)
        throw Error("Warmup checksum mismatch");
    var start = performance.now();
    var checksum = readLoop(data.sequence, config.iterations, mask);
    var elapsedMs = performance.now() - start;
    if (checksum !== config.iterations * 3) throw Error("Checksum mismatch");
    print(JSON.stringify({kind: "layout_read", shapes: config.shapes,
        run_length: config.runLength, sequence_length: config.sequenceLength,
        iterations: config.iterations, warmup_iterations: warmupIterations,
        phase: config.phase, within_run_repeat_percent: config.shapes === 1 ? 100 : 100 * (1 - 1 / config.runLength),
        actual_ic_hit_percent: null, checksum: checksum, elapsed_ms: elapsedMs,
        duration_pass: elapsedMs > config.minMs}));
    if (elapsedMs <= config.minMs) throw Error("Increase --iterations to exceed --min-ms");
}

main();
