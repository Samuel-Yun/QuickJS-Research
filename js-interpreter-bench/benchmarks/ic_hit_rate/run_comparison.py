"""Five-round release timing of A/EVAL_COLD/V8_ON, plus separate IC counts."""
from datetime import datetime
import argparse
import hashlib
import itertools
import json
import os
from pathlib import Path
import platform
import random
import subprocess
import time
from zoneinfo import ZoneInfo

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
LABELS = ["A", "EVAL_COLD", "V8_ON"]
RATES = [0, 25, 50, 75, 90, 99, 100]
ROUNDS, ITERATIONS, LENGTH, SEED = 5, 201326592, 65536, 2026110901
DIAG = ROOT / "experiments/ic_microbench_20261109/diagnostic01"


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def write(path, data):
    path.write_text(json.dumps(data, indent=2, ensure_ascii=False) + "\n")


def now():
    return datetime.now(ZoneInfo("Asia/Shanghai")).isoformat()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", required=True, type=Path, help="new experiment directory")
    parser.add_argument("--cpu", type=int, default=2)
    args = parser.parse_args()
    if args.cpu not in os.sched_getaffinity(0):
        parser.error("CPU is not available")
    out = args.output.resolve()
    out.mkdir(parents=True, exist_ok=False)
    scripts = out / "scripts"
    scripts.mkdir()
    raw = out / "raw"
    raw.mkdir()
    source = (HERE / "own_read.js").read_bytes()
    (out / "own_read.js").write_bytes(source)
    (out / "runner.py").write_bytes(Path(__file__).read_bytes())
    runtimes = json.loads((ROOT / "experiments/native_confirmation_20261108/attempt02/runtime_manifest.json").read_text())
    diag_manifest = json.loads((DIAG / "build_manifest.json").read_text())
    diag_qjs = DIAG / "work/EVAL_COLD_DIAG/qjs"
    (out / "diagnostic_build_manifest.json").write_bytes((DIAG / "build_manifest.json").read_bytes())
    write(out / "runtime_manifest.json", runtimes)
    os.sched_setaffinity(0, {args.cpu})
    env = dict(os.environ, TZ="Asia/Shanghai", LC_ALL="C", LANG="C")
    if env.get("LD_PRELOAD") or env.get("LD_AUDIT"):
        raise RuntimeError("Unexpected loader instrumentation")

    file_hashes = {}

    def wrapper(name, rate=None, n=None):
        values = ["own_read.js", "--self-test"] if rate is None else [
            "own_read.js", "--hit-percent", str(rate), "--iterations", str(n),
            "--sequence-length", str(LENGTH), "--min-ms", "0"]
        # Identical wrapper bytes for all three engines; setup is outside timing.
        path = scripts / (name + ".js")
        path.write_bytes(("globalThis.scriptArgs = " + json.dumps(values) + ";\n").encode() + source)
        file_hashes[str(path)] = sha(path)
        return path

    self_script = wrapper("self_test")
    gate_scripts = {(rate, n): wrapper(f"gate.hit{rate}.N{n}", rate, n)
                    for rate in RATES for n in [4096, 65537]}
    measure_scripts = {rate: wrapper(f"measure.hit{rate}", rate, ITERATIONS) for rate in RATES}
    orders = {}
    for rate in RATES:
        permutations = list(itertools.permutations(LABELS))
        random.Random(SEED + rate).shuffle(permutations)
        orders[rate] = permutations[:ROUNDS]  # each position occurs once or twice per label
    schedule = []
    for rep in range(ROUNDS):
        rates = RATES.copy()
        random.Random(SEED * 10 + rep).shuffle(rates)
        for rate in rates:
            for position, label in enumerate(orders[rate][rep]):
                schedule.append(dict(rep=rep, rate=rate, label=label, position=position))
    write(out / "schedule.json", schedule)
    for name in ["own_read.js", "runner.py", "runtime_manifest.json", "schedule.json", "diagnostic_build_manifest.json"]:
        file_hashes[str(out / name)] = sha(out / name)
    protocol = dict(started_at=now(), rounds=ROUNDS, iterations=ITERATIONS,
        sequence_length=LENGTH, rates=RATES, labels=LABELS, seed=SEED, cpu=args.cpu,
        timing="performance.now() around first readLoop call; setup/model/checks excluded",
        statistics="median of 5 independent processes per point; relative changes are ratios of medians; sample CV and full range retained",
        warmup_calls=0, no_trimming=True, stopping_rule="exactly 5 rounds; no selective remeasurement",
        gate="3 engine self-tests, then 42 short correctness processes (N=4096 and 65537) before any performance samples",
        diagnostic="after all performance samples: 7 independent diagnostic processes on identical full-size script bytes",
        V8_ON_flags=["--jitless", "--no-lazy", "--use-ic"],
        A_duration_requirement="each formal A kernel must exceed 3000 ms",
        interpretation="x-axis is EVAL_COLD actual hit rate; A has no added IC and V8 hit rates are not measured",
        frozen_files=file_hashes, diagnostic_elf=str(diag_qjs),
        diagnostic_elf_sha256=diag_manifest["diagnostic_elf_sha256"])
    write(out / "protocol.json", protocol)
    protocol_sha = sha(out / "protocol.json")
    write(out / "frozen.json", dict(protocol_sha256=protocol_sha))
    write(out / "environment.before.json", dict(time=now(), platform=platform.platform(),
        boot_id=Path("/proc/sys/kernel/random/boot_id").read_text().strip(),
        affinity=sorted(os.sched_getaffinity(0)), cpuinfo=Path("/proc/cpuinfo").read_text(),
        clock=time.get_clock_info("monotonic").__dict__))

    def verify():
        assert sha(out / "protocol.json") == protocol_sha
        for name, digest in file_hashes.items():
            assert sha(Path(name)) == digest, name
        for info in runtimes.values():
            assert sha(Path(info["path"])) == info["sha256"]
            for dep in info.get("dependencies", []) + info.get("system_libraries", []):
                assert sha(Path(dep["path"])) == dep["sha256"]
        assert sha(diag_qjs) == diag_manifest["diagnostic_elf_sha256"]

    def execute(phase, label, script, name, **identity):
        command = [str(diag_qjs)] if label == "EVAL_COLD_DIAG" else [runtimes[label]["path"]]
        if label == "V8_ON":
            snapshot = next(dep["path"] for dep in runtimes[label]["dependencies"] if dep["path"].endswith("snapshot_blob.bin"))
            command += ["--snapshot_blob=" + snapshot, "--jitless", "--no-lazy", "--use-ic"]
        command += [str(script)]
        started = time.monotonic_ns()
        result = subprocess.run(command, env=env, capture_output=True, text=True, timeout=900)
        stopped = time.monotonic_ns()
        (raw / (name + ".stdout")).write_text(result.stdout)
        (raw / (name + ".stderr")).write_text(result.stderr)
        row = dict(phase=phase, label=label, command=command, script_sha256=sha(script),
            returncode=result.returncode, started_ns=started, stopped_ns=stopped,
            external_wall_ms=(stopped-started)/1e6, **identity)
        try:
            assert result.returncode == 0, result.stderr[-1000:]
            row["payload"] = json.loads(result.stdout.strip())
            if label != "EVAL_COLD_DIAG":
                assert not result.stderr, result.stderr
            else:
                prefix = "IC_MICRO_COUNTS:"
                assert len(result.stderr.splitlines()) == 1 and result.stderr.startswith(prefix)
                row["counts"] = json.loads(result.stderr[len(prefix):])
            if phase == "self_test":
                assert row["payload"] == dict(kind="self_test", status="PASS", cases=126)
            else:
                p = row["payload"]
                assert p["iterations"] == identity["iterations"] and p["requested_hit_percent"] == identity["rate"]
                assert p["checksum"] == 3 * p["iterations"] and p["warmup_calls"] == 0
                assert 0 < p["elapsed_ms"] <= row["external_wall_ms"] + 5
                if phase == "measure" and label == "A":
                    assert p["elapsed_ms"] > 3000, "A did not exceed 3 seconds"
                if label == "EVAL_COLD_DIAG":
                    c = row["counts"]
                    assert c["capacity"] == c["watched_sites"] == c["cold_misses"] == 1
                    assert c["queries"] == c["hits"] + c["misses"] == p["iterations"]
                    assert c["hits"] == c["fused_hits"] + c["regular_hits"] == p["modeled_hits"]
                    assert c["misses"] == c["fills"] == p["modeled_misses"]
            row["status"] = "PASS"
        except Exception as exc:
            row["status"] = "FAIL"
            row["error"] = str(exc)
        with (out / "runs.jsonl").open("a") as stream:
            stream.write(json.dumps(row) + "\n")
            stream.flush()
            os.fsync(stream.fileno())
        if row["status"] != "PASS":
            raise RuntimeError(f"{name} failed: {row.get('error')}; raw output preserved")
        return row

    verify()
    for label in LABELS:
        execute("self_test", label, self_script, "self_test." + label)
    for rate in RATES:
        for n in [4096, 65537]:
            for label in LABELS:
                execute("correctness", label, gate_scripts[rate, n], f"gate.hit{rate}.N{n}.{label}", rate=rate, iterations=n)
    write(out / "correctness_gate.json", dict(status="PASS", self_tests=3, short_processes=42))
    print("CORRECTNESS_GATE_PASS", flush=True)
    count = 0
    for item in schedule:
        if count % (len(RATES) * len(LABELS)) == 0:
            verify()
        rate, label, rep = item["rate"], item["label"], item["rep"]
        row = execute("measure", label, measure_scripts[rate], f"measure.rep{rep}.hit{rate}.{label}",
                      rate=rate, rep=rep, position=item["position"], iterations=ITERATIONS)
        count += 1
        write(out / "progress.json", dict(status="RUNNING", completed=count, total=len(schedule),
              rep=rep, rate=rate, label=label, elapsed_ms=row["payload"]["elapsed_ms"], updated_at=now()))
        if count % 3 == 0:
            print(f"TIMING {count}/{len(schedule)} round={rep+1} input={rate}%", flush=True)
    verify()
    for rate in RATES:
        execute("diagnostic", "EVAL_COLD_DIAG", measure_scripts[rate], f"counts.hit{rate}", rate=rate, iterations=ITERATIONS)
        print(f"ACTUAL_COUNTS_MATCH input={rate}%", flush=True)
    verify()
    write(out / "completion.json", dict(status="PASS_COMPLETE", timing_samples=count,
        diagnostic_processes=7, short_correctness_processes=42, self_test_processes=3,
        completed_at=now(), raw_sha256=sha(out / "runs.jsonl")))
    write(out / "progress.json", dict(status="COMPLETE", completed=count, total=count, updated_at=now()))
    print("COMPARISON_COMPLETE", flush=True)


if __name__ == "__main__":
    main()
