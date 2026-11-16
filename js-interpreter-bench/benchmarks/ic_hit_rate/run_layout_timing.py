"""One-round release timing for the many-layout IC hit-rate inputs."""
import argparse
from datetime import datetime
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
CASES = [("repeat1", 65536, 1), ("repeat2", 65536, 2), ("repeat4", 65536, 4),
         ("repeat8", 65536, 8), ("repeat16", 65536, 16), ("mono", 1, 1)]
N, LENGTH, WARMUP_CYCLES, SEED = 134217728, 1048576, 2, 2026110902


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def write(path, value):
    path.write_text(json.dumps(value, indent=2, ensure_ascii=False) + "\n")


def now():
    return datetime.now(ZoneInfo("Asia/Shanghai")).isoformat()


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--output", required=True, type=Path)
    args = p.parse_args()
    out = args.output.resolve()
    out.mkdir(parents=True, exist_ok=False)
    (out / "scripts").mkdir()
    (out / "raw").mkdir()
    source = (HERE / "own_read_layouts.js").read_bytes()
    (out / "source.js").write_bytes(source)
    (out / "runner.py").write_bytes(Path(__file__).read_bytes())
    runtimes = json.loads((ROOT / "experiments/native_confirmation_20261108/attempt02/runtime_manifest.json").read_text())
    write(out / "runtime_manifest.json", runtimes)
    os.sched_setaffinity(0, {2})
    env = dict(os.environ, TZ="Asia/Shanghai", LC_ALL="C", LANG="C")
    assert not env.get("LD_PRELOAD") and not env.get("LD_AUDIT")
    hashes = {}

    def script(case, n, phase):
        name, shapes, repeat = case
        values = ["own_read_layouts.js", "--shapes", str(shapes), "--run-length", str(repeat),
            "--sequence-length", str(LENGTH), "--iterations", str(n), "--warmup-cycles", str(WARMUP_CYCLES),
            "--phase", "0", "--min-ms", "0"]
        path = out / "scripts" / f"{phase}.{name}.js"
        path.write_bytes(("globalThis.scriptArgs = " + json.dumps(values) + ";\n").encode() + source)
        hashes[str(path)] = sha(path)
        return path

    formal = {case[0]: script(case, N, "measure") for case in CASES}
    gates = {case[0]: script(case, 4096, "gate") for case in [CASES[0], CASES[-1]]}
    permutations = list(itertools.permutations(LABELS))
    random.Random(SEED).shuffle(permutations)
    ordered = CASES.copy()
    random.Random(SEED + 1).shuffle(ordered)
    schedule = []
    for index, case in enumerate(ordered):
        for position, label in enumerate(permutations[index]):
            schedule.append(dict(case=case[0], label=label, position=position, shapes=case[1], run_length=case[2]))
    write(out / "schedule.json", schedule)
    for name in ["source.js", "runner.py", "runtime_manifest.json", "schedule.json"]:
        hashes[str(out / name)] = sha(out / name)
    protocol = dict(started_at=now(), rounds=1, N=N, sequence_length=LENGTH,
        warmup_iterations=LENGTH*WARMUP_CYCLES, cases=CASES, labels=LABELS, cpu=2, seed=SEED,
        timing="performance.now around one readLoop invocation after two full sequence warmup cycles; setup excluded",
        engine_policy="same script bytes and parameters per case; original release ELFs, no instrumentation",
        stopping_rule="exactly one timing process per engine/input, no selective retries or trimming",
        case_order="shuffled; all six engine permutations used once, two occurrences per label/position overall",
        A_duration_requirement="all A measurement intervals strictly exceed 3000 ms",
        statistics="single observations, no variance estimate",
        mono_caveat="one shape changes receiver working set; separately labelled reference",
        frozen_files=hashes)
    write(out / "protocol.json", protocol)
    protocol_sha = sha(out / "protocol.json")
    write(out / "frozen.json", dict(protocol_sha256=protocol_sha))
    write(out / "environment.json", dict(time=now(), platform=platform.platform(),
        boot_id=Path("/proc/sys/kernel/random/boot_id").read_text().strip(), affinity=sorted(os.sched_getaffinity(0))))

    def verify():
        assert sha(out / "protocol.json") == protocol_sha
        for name, digest in hashes.items():
            assert sha(Path(name)) == digest
        for runtime in runtimes.values():
            assert sha(Path(runtime["path"])) == runtime["sha256"]
            for d in runtime.get("dependencies", []) + runtime.get("system_libraries", []):
                assert sha(Path(d["path"])) == d["sha256"]

    def run(label, case, phase, n, position):
        command = [runtimes[label]["path"]]
        if label == "V8_ON":
            snapshot = next(d["path"] for d in runtimes[label]["dependencies"] if d["path"].endswith("snapshot_blob.bin"))
            command += ["--snapshot_blob="+snapshot, "--jitless", "--no-lazy", "--use-ic"]
        path = formal[case] if phase == "measure" else gates[case]
        command.append(str(path))
        t0 = time.monotonic_ns()
        process = subprocess.run(command, capture_output=True, text=True, env=env, timeout=900)
        t1 = time.monotonic_ns()
        basename = phase + "." + case + "." + label
        (out / "raw" / (basename + ".stdout")).write_text(process.stdout)
        (out / "raw" / (basename + ".stderr")).write_text(process.stderr)
        row = dict(phase=phase, label=label, case=case, position=position, command=command,
            script_sha256=sha(path), returncode=process.returncode, started_ns=t0, stopped_ns=t1,
            external_wall_ms=(t1-t0)/1e6)
        try:
            assert process.returncode == 0 and not process.stderr, process.stderr[-2000:]
            payload = json.loads(process.stdout.strip())
            row["payload"] = payload
            assert payload["iterations"] == n and payload["checksum"] == n*3
            assert payload["sequence_length"] == LENGTH and payload["warmup_iterations"] == LENGTH*WARMUP_CYCLES
            assert payload["elapsed_ms"] > 0 and payload["elapsed_ms"] <= row["external_wall_ms"]+5
            if label == "A" and phase == "measure":
                assert payload["elapsed_ms"] > 3000, "A below three seconds"
            row["status"] = "PASS"
        except Exception as exc:
            row["status"] = "FAIL"
            row["error"] = str(exc)
        with (out / "runs.jsonl").open("a") as stream:
            stream.write(json.dumps(row)+"\n"); stream.flush(); os.fsync(stream.fileno())
        assert row["status"] == "PASS", row
        return row

    verify()
    for case in gates:
        for label in LABELS:
            run(label, case, "gate", 4096, 0)
    write(out / "correctness_gate.json", dict(status="PASS", processes=6))
    print("GATE_PASS", flush=True)
    for index, entry in enumerate(schedule):
        verify()
        row = run(entry["label"], entry["case"], "measure", N, entry["position"])
        write(out / "progress.json", dict(status="RUNNING", completed=index+1, total=len(schedule),
            case=entry["case"], label=entry["label"], elapsed_ms=row["payload"]["elapsed_ms"], updated_at=now()))
        print(f"{index+1}/18 {entry['case']} {entry['label']} {row['payload']['elapsed_ms']/1000:.4f}s", flush=True)
    verify()
    write(out / "completion.json", dict(status="PASS_COMPLETE", timing_samples=18, correctness_processes=6,
        completed_at=now(), raw_sha256=sha(out / "runs.jsonl")))
    write(out / "progress.json", dict(status="COMPLETE", completed=18, total=18, updated_at=now()))
    print("LAYOUT_TIMING_COMPLETE", flush=True)


if __name__ == "__main__":
    main()
