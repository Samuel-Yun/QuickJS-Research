"""Check the fixed workload exceeds 3 s on the previously confirmed original A."""
import argparse
from datetime import datetime
import hashlib
import json
import os
from pathlib import Path
import platform
import subprocess
import time
from zoneinfo import ZoneInfo

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
SCRIPT = HERE / "own_read.js"
RATES = [0, 25, 50, 75, 90, 99, 100]
EXPECTED_A_SHA = "9018bc2d8a37bfdff4b816aa0a28d1a4bc2ed51fbf68d4cdf76d8fe0ce1d4635"


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def write(path, data):
    path.write_text(json.dumps(data, indent=2, ensure_ascii=False) + "\n")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", required=True, type=Path,
                        help="new directory; existing results are never overwritten")
    parser.add_argument("--iterations", type=int, default=201326592)
    parser.add_argument("--cpu", type=int, default=2)
    args = parser.parse_args()
    if not 1 <= args.iterations <= 500000000:
        parser.error("iterations must be in [1, 500000000]")
    if args.cpu not in os.sched_getaffinity(0):
        parser.error("CPU is not in this process's allowed CPU set")
    qjs = ROOT / "experiments/native_octane_20261107/attempt01/work/A/qjs"
    if sha(qjs) != EXPECTED_A_SHA:
        raise RuntimeError("Original A executable hash does not match the confirmed binary")
    source_sha = sha(SCRIPT)
    args.output.mkdir(parents=True, exist_ok=False)
    os.sched_setaffinity(0, {args.cpu})
    env = dict(os.environ, TZ="Asia/Shanghai", LC_ALL="C", LANG="C")
    if env.get("LD_PRELOAD") or env.get("LD_AUDIT"):
        raise RuntimeError("Unexpected dynamic loader instrumentation")
    write(args.output / "manifest.json", {
        "started_at": datetime.now(ZoneInfo("Asia/Shanghai")).isoformat(),
        "purpose": "duration and correctness validation, not a performance comparison",
        "qjs": str(qjs), "qjs_sha256": EXPECTED_A_SHA,
        "script": str(SCRIPT), "script_sha256": source_sha,
        "runner_sha256": sha(Path(__file__)),
        "iterations": args.iterations, "rates": RATES, "sequence_length": 65536,
        "min_ms_exclusive": 3000, "cpu": args.cpu,
        "platform": platform.platform(), "warmup_calls": 0,
        "actual_ic_counters": False,
    })

    def run(name, extra):
        command = [str(qjs), str(SCRIPT)] + extra
        start = time.perf_counter()
        process = subprocess.run(command, capture_output=True, text=True,
                                 env=env, timeout=1200)
        wall_ms = (time.perf_counter() - start) * 1000
        (args.output / (name + ".stdout")).write_text(process.stdout)
        (args.output / (name + ".stderr")).write_text(process.stderr)
        write(args.output / (name + ".process.json"), {
            "command": command, "returncode": process.returncode,
            "external_wall_ms": wall_ms,
        })
        if process.returncode != 0:
            raise RuntimeError(f"{name} failed; stdout/stderr preserved in {args.output}")
        return json.loads(process.stdout.strip())

    check = run("self_test", ["--self-test"])
    if check != {"kind": "self_test", "status": "PASS", "cases": 126}:
        raise RuntimeError("self-test did not pass")
    results = []
    for rate in RATES:
        result = run(f"A.hit{rate}", ["--hit-percent", str(rate), "--iterations",
                     str(args.iterations), "--sequence-length", "65536", "--min-ms", "3000"])
        if (result["iterations"] != args.iterations or
            result["requested_hit_percent"] != rate or
            result["checksum"] != 3 * args.iterations or
            not result["duration_pass"] or result["elapsed_ms"] <= 3000):
            raise RuntimeError("result validation failed")
        results.append(result)
        print(f"A requested={rate:3d}% modeled={result['modeled_hit_percent']:.6f}% "
              f"elapsed={result['elapsed_ms'] / 1000:.4f} s", flush=True)
    if sha(SCRIPT) != source_sha or sha(qjs) != EXPECTED_A_SHA:
        raise RuntimeError("script or executable changed during validation")
    write(args.output / "results.json", {
        "status": "PASS", "self_test_cases": check["cases"],
        "all_seven_exceed_3_seconds": True, "results": results,
        "completed_at": datetime.now(ZoneInfo("Asia/Shanghai")).isoformat(),
    })


if __name__ == "__main__":
    main()
