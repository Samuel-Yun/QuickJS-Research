"""Inspect V8 feedback states; this deliberately does not estimate hit rates."""
import argparse
import gzip
import hashlib
import json
from pathlib import Path
import subprocess

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
PERF = ROOT / "experiments/ic_microbench_20261109/performance02"


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    out = args.output.resolve()
    out.mkdir(parents=True, exist_ok=False)
    runtime = json.loads((PERF / "runtime_manifest.json").read_text())["V8_ON"]
    assert sha(Path(runtime["path"])) == runtime["sha256"]
    snapshot = next(dep["path"] for dep in runtime["dependencies"] if dep["path"].endswith("snapshot_blob.bin"))
    metadata = dict(purpose="IC states only, not per-access hit rates or performance",
                    runtime=runtime, tool_sha256=sha(Path(__file__)), cases=[])
    for rate in [0, 100]:
        base = PERF / "scripts" / f"measure.hit{rate}.js"
        script = out / f"state.hit{rate}.js"
        script.write_bytes(base.read_bytes() + b"\n%DebugPrint(readLoop);\n")
        log = out / f"v8.hit{rate}.log"
        command = [runtime["path"], "--snapshot_blob=" + snapshot,
                   "--jitless", "--no-lazy", "--use-ic", "--allow-natives-syntax",
                   "--print-bytecode", "--print-bytecode-filter=readLoop", "--log-ic",
                   "--no-logfile-per-isolate", "--logfile=" + str(log), str(script)]
        result = subprocess.run(command, capture_output=True, text=True, timeout=180)
        (out / f"state.hit{rate}.stdout").write_text(result.stdout)
        (out / f"state.hit{rate}.stderr").write_text(result.stderr)
        assert result.returncode == 0, result.stderr[-2000:]
        assert '"checksum":603979776' in result.stdout
        log_bytes = log.read_bytes()
        (out / f"v8.hit{rate}.log.gz").write_bytes(gzip.compress(log_bytes, mtime=0))
        events = [line for line in log_bytes.decode(errors="replace").splitlines()
                  if line.startswith("LoadIC,") and ",x," in line]
        (out / f"x.hit{rate}.transitions.txt").write_text("\n".join(events) + "\n")
        metadata["cases"].append(dict(EVAL_COLD_input_rate=rate, command=command,
            formal_script_sha256=sha(base), diagnostic_script_sha256=sha(script),
            log_sha256=sha(log), x_LoadIC_events=events, actual_hit_rate=None))
        print("STATE_PROBE", rate, "x_events", events, flush=True)
    assert sha(Path(runtime["path"])) == runtime["sha256"]
    (out / "manifest.json").write_text(json.dumps(metadata, indent=2) + "\n")


if __name__ == "__main__":
    main()
