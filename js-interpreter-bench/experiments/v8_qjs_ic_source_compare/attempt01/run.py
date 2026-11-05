"""48 bounded semantic checks only. No VM builds, benchmarks, timers or traces."""
import argparse
import csv
import hashlib
import io
import json
import os
import platform
import subprocess
import time
from datetime import datetime, timezone
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
PREVIOUS = ROOT / "experiments/function_value_call_path/attempt01/manifest.json"
EXPECTED_HASHES = {
    "QJS_A": "584335adb82c6052395e5a9526ca1be05480d5d8e60469fd14403156b62a8dd1",
    "QJS_M": "7b6fa1e896e31988b9d8a5276581477776fbd01ab079a64394b6111def7d87ef",
    "V8_ON": "83b744a5953d2662ea723564d4035a333782a0cc85232d1025929a925150b133",
}

def sha(path):
    h = hashlib.sha256()
    with Path(path).open("rb") as f:
        for chunk in iter(lambda: f.read(1048576), b""):
            h.update(chunk)
    return h.hexdigest()

def read(path):
    return json.loads(Path(path).read_text(encoding="utf-8"))

def save(path, value):
    path = Path(path)
    data = value if isinstance(value, bytes) else (
        value if isinstance(value, str) else json.dumps(value, ensure_ascii=False, indent=2) + "\n"
    ).encode("utf-8")
    path.parent.mkdir(parents=True, exist_ok=True)
    if path.exists():
        if path.read_bytes() != data:
            raise RuntimeError("Refusing to overwrite: " + str(path))
    else:
        with path.open("xb") as stream:
            stream.write(data)

def stamp():
    return datetime.now(timezone.utc).isoformat()

def identity():
    old = read(PREVIOUS)
    result = dict(timestamp=stamp(), platform=platform.platform(), host=platform.node(),
                  kernel=platform.release(), architecture=platform.machine(),
                  WSL="microsoft" in platform.release().lower(),
                  provenance_manifest=str(PREVIOUS), provenance_manifest_sha256=sha(PREVIOUS),
                  commands=old["commands"], artifacts={}, dependencies=[], sources={})
    if platform.system() != "Linux":
        raise RuntimeError("Run under the existing WSL cohort; Windows engines are not substitutes")
    if os.environ.get("LD_PRELOAD") or os.environ.get("LD_AUDIT"):
        raise RuntimeError("Unexpected native instrumentation environment")
    for name, expected in EXPECTED_HASHES.items():
        a = old["artifacts"][name]
        actual = sha(a["path"])
        result["artifacts"][name] = dict(path=a["path"], sha256=actual, expected_sha256=expected,
                                         matches=(actual == expected), size_bytes=Path(a["path"]).stat().st_size)
        if actual != expected:
            raise RuntimeError("Frozen runtime identity mismatch: " + name)
    for dep in old["v8_dependencies"]:
        actual = sha(dep["path"])
        if actual != dep["sha256"]:
            raise RuntimeError("Frozen V8 dependency mismatch: " + dep["path"])
        result["dependencies"].append(dict(dep, actual_sha256=actual))
    if result["commands"]["V8_ON"][2:] != ["--jitless", "--no-lazy", "--use-ic"]:
        raise RuntimeError("Unexpected existing V8 runtime flags")
    for variant in ("A", "M"):
        source = Path(old[variant + "_source"])
        result["sources"][variant] = dict(path=str(source), files={})
        files = ["quickjs.c", "quickjs.h", "quickjs-opcode.h", "LICENSE"]
        if variant == "M":
            files += ["read_ic_config.h", "read_ic_types.h", "read_ic_prepare.inc", "read_ic_runtime.inc", "read_ic_opcodes.inc"]
        for rel in files:
            actual = sha(source / rel)
            expected = old[variant + "_source_files"][rel]
            if actual != expected:
                raise RuntimeError("Source identity mismatch: " + str(source / rel))
            result["sources"][variant]["files"][rel] = actual
    return result

def correctness():
    if (HERE / "correctness.csv").exists():
        raise RuntimeError("This attempt has finished. Use audit, or make another attempt; do not rerun.")
    try:
        before = identity()
    except (OSError, RuntimeError) as exc:
        save(HERE / "runtime_blocked.json", dict(status="BLOCKED_RUNTIME", error=str(exc), timestamp=stamp()))
        raise
    save(HERE / "runtime_before.json", before)
    expected = read(HERE / "expected.json")
    common = (HERE / "cases.js").read_text(encoding="utf-8")
    rows = []
    for case, events in expected.items():
        for n in (1, 2):
            script = HERE / "scripts" / (case + ".N" + str(n) + ".js")
            save(script, "var IC_CASE = " + json.dumps(case) + "; var IC_N = " + str(n) + ";\n" + common)
            wanted = dict(case=case, n=n, rounds=[events] * n)
            for engine, prefix in before["commands"].items():
                path = HERE / "raw" / (case + ".N" + str(n) + "." + engine + ".json")
                if path.exists():
                    record = read(path)
                    if record["script_sha256"] != sha(script):
                        raise RuntimeError("Cannot resume changed workload")
                else:
                    command = prefix + [str(script)]
                    started = time.perf_counter_ns()
                    try:
                        process = subprocess.run(command, cwd=str(Path(prefix[0]).parent),
                                                 capture_output=True, text=True, timeout=15)
                        out, err, code = process.stdout, process.stderr, process.returncode
                        timed_out = False
                    except subprocess.TimeoutExpired as exc:
                        def decoded(value):
                            return value.decode(errors="replace") if isinstance(value, bytes) else value or ""
                        out, err, code = decoded(exc.stdout), decoded(exc.stderr), None
                        timed_out = True
                    actual = None
                    markers = [s[len("IC_CORRECTNESS="):] for s in out.splitlines() if s.startswith("IC_CORRECTNESS=")]
                    try:
                        if len(markers) == 1:
                            actual = json.loads(markers[0])
                    except ValueError:
                        pass
                    valid = code == 0 and actual == wanted and not timed_out
                    record = dict(engine=engine, case=case, n=n, command=command,
                                  cwd=str(Path(prefix[0]).parent),
                                  binary_sha256=before["artifacts"][engine]["sha256"],
                                  dependencies=before["dependencies"] if engine == "V8_ON" else [],
                                  script_sha256=sha(script), common_js_sha256=sha(HERE / "cases.js"),
                                  expected=wanted, actual=actual, stdout=out, stderr=err,
                                  exit_code=code, timed_out=timed_out, valid=valid,
                                  status="PASS" if valid else "FAIL", timestamp=stamp(),
                                  wall_time_ns_diagnostic_only=time.perf_counter_ns() - started)
                    save(path, record)
                rows.append({k: record[k] for k in ("case", "engine", "n", "status", "exit_code", "valid", "script_sha256")})
                print(case, n, engine, record["status"], flush=True)
    after = identity()
    save(HERE / "runtime_after.json", after)
    buffer = io.StringIO(newline="")
    writer = csv.DictWriter(buffer, list(rows[0]), lineterminator="\n")
    writer.writeheader()
    writer.writerows(rows)
    save(HERE / "correctness.csv", buffer.getvalue())
    save(HERE / "correctness_summary.json", dict(expected_processes=48, actual_processes=len(rows),
         passed=sum(r["valid"] for r in rows), failed=sum(not r["valid"] for r in rows),
         process_time_is_performance_data=False, internal_cache_events=None,
         status="PASS" if len(rows) == 48 and all(r["valid"] for r in rows) else "FAIL"))
    if not all(r["valid"] for r in rows):
        raise RuntimeError("Correctness failure: preserve raw and investigate, do not change expected output")

def audit():
    rows = list(csv.DictReader((HERE / "correctness.csv").open(encoding="utf-8")))
    records = [read(p) for p in sorted((HERE / "raw").glob("*.json"))]
    wanted_keys = {(case, engine, n) for case in read(HERE / "expected.json") for engine in EXPECTED_HASHES for n in (1, 2)}
    actual_keys = {(r["case"], r["engine"], r["n"]) for r in records}
    assert len(rows) == len(records) == len(wanted_keys) == 48
    assert actual_keys == wanted_keys
    csv_keys = {(r["case"], r["engine"], int(r["n"])) for r in rows}
    assert csv_keys == wanted_keys
    independent_expected = read(HERE / "expected.json")
    before, after = read(HERE / "runtime_before.json"), read(HERE / "runtime_after.json")
    assert before["artifacts"] == after["artifacts"]
    assert before["dependencies"] == after["dependencies"]
    assert before["sources"] == after["sources"]
    for record in records:
        assert record["binary_sha256"] == EXPECTED_HASHES[record["engine"]]
        assert record["exit_code"] == 0 and record["valid"]
        assert record["actual"] == record["expected"]
        assert record["actual"] == dict(case=record["case"], n=record["n"],
                                         rounds=[independent_expected[record["case"]]] * record["n"])
        assert record["common_js_sha256"] == sha(HERE / "cases.js")
        script = HERE / "scripts" / (record["case"] + ".N" + str(record["n"]) + ".js")
        assert record["script_sha256"] == sha(script)
        assert record["command"][:-1] == before["commands"][record["engine"]]
        if record["engine"] == "V8_ON":
            assert record["command"][2:5] == ["--jitless", "--no-lazy", "--use-ic"]
    print(json.dumps(dict(status="PASS", records=48, cases=8, engines=3,
                          internal_cache_events="UNKNOWN", performance_samples=0), indent=2))

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("stage", choices=("correctness", "audit"))
    args = parser.parse_args()
    globals()[args.stage]()
