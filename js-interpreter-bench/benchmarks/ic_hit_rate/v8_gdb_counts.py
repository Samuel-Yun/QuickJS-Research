"""Original V8 ELF: bounded debugger counting of named-load miss/no-feedback paths."""
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
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--iterations", type=int, default=16)
    parser.add_argument("--rate", type=int, default=0)
    parser.add_argument("--gate-total", action="store_true")
    args = parser.parse_args()
    out = args.output.resolve()
    out.mkdir(parents=True, exist_ok=False)
    runtime = json.loads((PERF / "runtime_manifest.json").read_text())["V8_ON"]
    assert sha(Path(runtime["path"])) == runtime["sha256"]
    source = (HERE / "own_read.js").read_text()
    old = "    var checksum = readLoop(data.sequence, config.iterations, mask);"
    assert source.count(old) == 1
    marked = source.replace(old,
        "    var microSequence = data.sequence, microIterations = config.iterations, microReader = readLoop;\n"
        "    %SystemBreak();\n"
        "    var checksum = microReader(microSequence, microIterations, mask);\n"
        "    %SystemBreak();")
    values = ["own_read.js", "--hit-percent", str(args.rate), "--iterations", str(args.iterations),
              "--sequence-length", "65536", "--min-ms", "0"]
    script = out / "marked.js"
    script.write_text("globalThis.scriptArgs = " + json.dumps(values) + ";\n" + marked)
    driver = out / "gdb_driver.py"
    driver.write_bytes((HERE / "v8_gdb_driver.py").read_bytes())
    config = dict(output_json=str(out / "counter.json"), gate_total=args.gate_total,
                  counter_cap=10000, iterations=args.iterations, rate=args.rate)
    (out / "config.json").write_text(json.dumps(config, indent=2) + "\n")
    snapshot = next(d["path"] for d in runtime["dependencies"] if d["path"].endswith("snapshot_blob.bin"))
    command = ["gdb", "--batch", "-q", "-nx", "-x", str(driver), "--args", runtime["path"],
               "--snapshot_blob=" + snapshot, "--jitless", "--no-lazy", "--use-ic",
               "--allow-natives-syntax", str(script)]
    env = dict(os.environ, TZ="Asia/Shanghai", LC_ALL="C", LANG="C",
               IC_V8_GDB_CONFIG=str(out / "config.json"))
    os.sched_setaffinity(0, {2})
    write_manifest = dict(runtime=runtime, command=command, source_sha256=sha(HERE / "own_read.js"),
        script_sha256=sha(script), driver_sha256=sha(driver), runner_sha256=sha(Path(__file__)),
        note="diagnostic only; counts only between two native SystemBreak markers; no IC logging flags")
    (out / "manifest.json").write_text(json.dumps(write_manifest, indent=2) + "\n")
    result = subprocess.run(command, capture_output=True, text=True, env=env, timeout=180)
    (out / "gdb.stdout").write_text(result.stdout)
    (out / "gdb.stderr").write_text(result.stderr)
    assert result.returncode == 0, result.stderr[-2000:]
    measured = json.loads((out / "counter.json").read_text())
    assert measured["status"] == "PASS", measured
    if args.gate_total:
        assert measured["counts"]["named_load_entries"] == args.iterations, measured
    payloads = [json.loads(line) for line in result.stdout.splitlines() if line.startswith('{"kind":"own_read"')]
    assert len(payloads) == 1 and payloads[0]["checksum"] == 3 * args.iterations
    assert sha(Path(runtime["path"])) == runtime["sha256"]
    print(json.dumps(measured["counts"]), flush=True)


if __name__ == "__main__":
    main()
