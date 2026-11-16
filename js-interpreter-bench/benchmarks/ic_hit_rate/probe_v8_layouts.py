"""Count V8 IC misses for ordinary many-Map layouts after explicit warmup."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import subprocess

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
PERF = ROOT / "experiments/ic_microbench_20261109/performance02"


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--output", required=True, type=Path)
    p.add_argument("--shapes", type=int, default=65536)
    p.add_argument("--run-length", type=int, default=1)
    p.add_argument("--iterations", type=int, default=4096)
    p.add_argument("--phase", type=int, default=0)
    p.add_argument("--gate-total", action="store_true")
    args = p.parse_args()
    out = args.output.resolve()
    out.mkdir(parents=True, exist_ok=False)
    runtime = json.loads((PERF / "runtime_manifest.json").read_text())["V8_ON"]
    assert sha(Path(runtime["path"])) == runtime["sha256"]
    source = (HERE / "own_read_layouts.js").read_text()
    anchor = "    var checksum = readLoop(data.sequence, config.iterations, mask);"
    assert source.count(anchor) == 1
    marked = source.replace(anchor,
        "    var microSequence = data.sequence, microIterations = config.iterations, microReader = readLoop;\n"
        "    %SystemBreak();\n"
        "    var checksum = microReader(microSequence, microIterations, mask);\n"
        "    %SystemBreak();")
    validation = '''function validateLayouts(objects) {
    var fast = 0, adjacentDifferent = 0, sameOrderDifferent = 0;
    for (var i = 0; i < objects.length; i++) {
        if (%HasFastProperties(objects[i])) fast++;
        if (i > 0 && !%HaveSameMap(objects[i-1], objects[i])) adjacentDifferent++;
        if (i > 1 && !%HaveSameMap(objects[i-2], objects[i])) sameOrderDifferent++;
    }
    if (fast !== objects.length || adjacentDifferent !== objects.length-1 ||
        sameOrderDifferent !== Math.max(0,objects.length-2))
        throw Error("Layout validation failed");
    print("LAYOUT_VALIDATION:"+JSON.stringify({fast_objects:fast, adjacent_distinct_maps:adjacentDifferent,
        same_order_distinct_maps:sameOrderDifferent}));
}
'''
    values = ["own_read_layouts.js", "--shapes", str(args.shapes), "--run-length", str(args.run_length),
        "--iterations", str(args.iterations), "--phase", str(args.phase), "--min-ms", "0"]
    script = out / "marked.js"
    script.write_text("globalThis.scriptArgs = " + json.dumps(values) + ";\n" + validation + marked)
    driver = out / "gdb_driver.py"
    driver.write_bytes((HERE / "v8_gdb_driver.py").read_bytes())
    config = dict(output_json=str(out / "counter.json"), gate_total=args.gate_total,
                  counter_cap=1000000, iterations=args.iterations, rate=None)
    (out / "config.json").write_text(json.dumps(config, indent=2) + "\n")
    snapshot = next(d["path"] for d in runtime["dependencies"] if d["path"].endswith("snapshot_blob.bin"))
    cmd = ["gdb", "--batch", "-q", "-nx", "-x", str(driver), "--args", runtime["path"],
        "--snapshot_blob=" + snapshot, "--jitless", "--no-lazy", "--use-ic", "--allow-natives-syntax", str(script)]
    env = dict(os.environ, TZ="Asia/Shanghai", LC_ALL="C", LANG="C", IC_V8_GDB_CONFIG=str(out / "config.json"))
    os.sched_setaffinity(0, {2})
    (out / "manifest.json").write_text(json.dumps(dict(runtime=runtime, command=cmd,
        source_sha256=sha(HERE / "own_read_layouts.js"), script_sha256=sha(script),
        driver_sha256=sha(driver), runner_sha256=sha(Path(__file__)),
        purpose="diagnostic counts only; preallocated ordinary own-property objects; explicitly warmed kernel"), indent=2) + "\n")
    result = subprocess.run(cmd, capture_output=True, text=True, env=env, timeout=300)
    (out / "gdb.stdout").write_text(result.stdout)
    (out / "gdb.stderr").write_text(result.stderr)
    assert result.returncode == 0, result.stderr[-2000:]
    counted = json.loads((out / "counter.json").read_text())
    assert counted["status"] == "PASS", counted
    counts = counted["counts"]
    assert counts["generic_runtime_fallback"] == counts["no_feedback_runtime_fallback"] == 0, counts
    if args.gate_total:
        assert counts["named_load_entries"] == args.iterations
    payload = next(json.loads(line) for line in result.stdout.splitlines() if line.startswith('{"kind":"layout_read"'))
    validation = next(json.loads(line[len("LAYOUT_VALIDATION:"):]) for line in result.stdout.splitlines() if line.startswith("LAYOUT_VALIDATION:"))
    assert payload["checksum"] == args.iterations * 3
    nonhits = counts["ic_miss"] + counts["no_feedback"]
    assert 0 <= nonhits <= args.iterations
    report = dict(status="PASS", settings=vars(args) | {"output":str(out)}, payload=payload,
        validation=validation, counts=counts, hits=args.iterations-nonhits,
        actual_hit_percent=100*(args.iterations-nonhits)/args.iterations)
    (out / "results.json").write_text(json.dumps(report, indent=2) + "\n")
    assert sha(Path(runtime["path"])) == runtime["sha256"]
    print(json.dumps(dict(shapes=args.shapes, run_length=args.run_length,
        N=args.iterations, actual_hit_percent=report["actual_hit_percent"], counts=counts)), flush=True)


if __name__ == "__main__":
    main()
