"""Small-program bytecode study. Run inside the existing Ubuntu WSL distro.
All records are write-once; resume skips completed positions, never old baselines.
"""
import argparse
import csv
import hashlib
import io
import itertools
import json
import math
import os
import platform
import random
import re
import statistics
import subprocess
import time
from datetime import datetime, timezone
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
ENGINES = ("quickjs", "v8")
MODE = "FIRST_CALL_INCLUSIVE_INTERPRETER_MODE_MONOTONIC_SIMPLE_V1"
SEED = 20261015
DIAG = "/home/mzyx/richards_method_diag_04be246_attempt01/qjs"
DIAG_SHA = "4ee461e65357dfbd7e332159d096cd44ab5b088f31c4ea6706baff4d8f9722cd"


def read(path):
    return json.loads(Path(path).read_text(encoding="utf-8"))


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def save(path, value):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    data = value if isinstance(value, bytes) else (value if isinstance(value, str) else json.dumps(value, ensure_ascii=False, indent=2) + "\n").encode("utf-8")
    if path.exists():
        if path.read_bytes() != data:
            raise RuntimeError("Write-once conflict: " + str(path))
    else:
        path.write_bytes(data)


def export(path, rows):
    if not rows:
        return
    out = io.StringIO(newline="")
    writer = csv.DictWriter(out, fieldnames=list(rows[0]))
    writer.writeheader()
    for row in rows:
        writer.writerow({k: json.dumps(v, separators=(",", ":")) if isinstance(v, (list, dict)) else v for k, v in row.items()})
    save(path, out.getvalue())


def config():
    return read(HERE / "cases/config.json")


def manifest():
    return read(HERE / "manifest.json")


def capture(path, command, timeout=180, env=None):
    if path.exists():
        return read(path)
    before = time.perf_counter_ns()
    stamp = datetime.now(timezone.utc).isoformat()
    try:
        p = subprocess.run(command, cwd=ROOT, env=env, capture_output=True, timeout=timeout)
        result = dict(exit_code=p.returncode, stdout=p.stdout.decode(errors="replace"), stderr=p.stderr.decode(errors="replace"))
    except subprocess.TimeoutExpired as exc:
        result = dict(exit_code=None, stdout=(exc.stdout or b"").decode(errors="replace"), stderr=(exc.stderr or b"").decode(errors="replace"), error="TIMEOUT")
    result.update(command=list(map(str, command)), timestamp_utc=stamp, outer_wall_ns=time.perf_counter_ns() - before,
                  load_average=os.getloadavg(), boot_id=Path("/proc/sys/kernel/random/boot_id").read_text().strip(),
                  LD_PRELOAD=(env or os.environ).get("LD_PRELOAD"))
    save(path, result)
    return result


def verify():
    m = manifest()
    assert (platform.node(), platform.release(), platform.machine()) == (m["host"], m["kernel"], "x86_64"), "Host changed"
    for e in ENGINES:
        r = m["engines"][e]
        for f in [r["binary"]] + r["dependencies"] + r["dynamic_libraries"] + m["adapters"][e]:
            assert sha(f["path"]) == f["sha256"], "Changed artifact: " + f["path"]
    for rel, digest in m["inputs"].items():
        assert sha(HERE / rel) == digest, "Changed input: " + rel
    assert not os.environ.get("LD_PRELOAD"), "Unexpected preload"
    return m


def prepare():
    path = HERE / "manifest.json"
    if path.exists():
        verify()
        return
    prior = read(ROOT / "experiments/timer_recovery/manifest.json")
    assert platform.machine() == "x86_64" and "microsoft" in platform.release().lower()
    engines = {e: prior["engines"][e] for e in ENGINES}
    adapters = {e: [dict(path=str(ROOT / "experiments/three_engine_baseline/adapters" / (e + ".js")),
                         sha256=sha(ROOT / "experiments/three_engine_baseline/adapters" / (e + ".js"))),
                    engines[e]["timer_adapter"]] for e in ENGINES}
    m = dict(cohort=prior["cohort_id"], mode=MODE, host=platform.node(), kernel=platform.release(),
             architecture=platform.machine(), engines=engines, adapters=adapters,
             diagnostic_quickjs=dict(path=DIAG, sha256=DIAG_SHA, purpose="final bytecode only; never timed",
                                     provenance="experiments/richards_method_lookup/attempt01/source_evidence/diagnostic_build.json"),
             seed=SEED, repetitions=30, threshold_ms=1000, max_N=2**24, timeout_s=180,
             source_commit_proof_v8="UNKNOWN: version tag reference is not prebuilt source attestation",
             reused_mode_evidence="experiments/three_engine_baseline/probes/tier/summary.json",
             inputs={str(p.relative_to(HERE)): sha(p) for p in sorted((HERE / "cases").glob("*"))},
             entry_script_sha256=sha(__file__))
    save(path, m)
    verify()
    assert sha(DIAG) == DIAG_SHA
    env = capture(HERE / "raw/environment.json", ["sh", "-c", "uname -a; cat /etc/os-release; lscpu; free -b; df -h / /mnt/c; gcc --version; python3 --version; uptime; cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor 2>/dev/null; true"])
    save(HERE / "environment.txt", env["stdout"] + "\nPower/frequency policy under WSL2: UNKNOWN; no governor exposed. Windows background processes uncontrolled.\n")
    v = engines["v8"]["command_prefix"]
    help_record = capture(HERE / "raw/v8_help.json", v + ["--help"])
    assert "--print-bytecode" in help_record["stdout"] and "--print-bytecode-filter" in help_record["stdout"]
    capture(HERE / "raw/v8_flags.json", v + ["--print-flag-values", "-e", "print('FLAGS_OK')"])
    capture(HERE / "raw/qjs_help.json", engines["quickjs"]["command_prefix"] + ["--help"])
    save(HERE / "execution_contract.json", dict(mode=MODE, clock="existing benchNow wrapper over native performance.now; monotonic",
         before_timer=["process and VM startup", "adapters", "source loading and static function compilation", "objects/input setup"],
         timed=["first target invocation and remaining N-1 calls", "repeat driver and int32 checksum", "loop support operations", "runtime/helper/GC/builtin costs as encountered"],
         after_timer=["result validation", "JSON output", "process shutdown"], warmup=False,
         v8_flags=engines["v8"]["runtime_flags"], same_script=True,
         timing_not="pure interpreter-loop self time; no operation-level self time or frontend-percentage claim"))
    # Protect all pre-existing research files without including this new experiment.
    old = {}
    for directory in ("experiments", "benchmarks", "results", "notes", "scripts", "patches"):
        for p in (ROOT / directory).rglob("*"):
            if p.is_file() and "bytecode_whitebox_simple" not in p.parts and "__pycache__" not in p.parts:
                old[str(p.relative_to(ROOT))] = sha(p)
    save(HERE / "raw/preservation_before.json", old)
    print("PREPARED", flush=True)


def script(case, n, phase):
    c = config()[case]
    body = (HERE / "cases" / (case + ".js")).read_text()
    # A namespace-isolated shared driver; exact same bytes executed by both shells.
    driver = """
;(function () {
    var __wbN = N_VALUE, __wbLast, __wbChecksum = 0;
    var __wbStart = benchNow();
    for (var __wbRepeat = 0; __wbRepeat < __wbN; __wbRepeat++) {
        __wbLast = CALL_VALUE;
        __wbChecksum = (__wbChecksum + __wbLast) | 0;
    }
    var __wbElapsed = benchNow() - __wbStart;
    if (__wbLast !== EXPECTED_VALUE || __wbChecksum !== CHECKSUM_VALUE) throw new Error('wrong result');
    console.log('WB_RESULT ' + JSON.stringify({N:__wbN,last:__wbLast,checksum:__wbChecksum,elapsed_ms:__wbElapsed}));
})();
"""
    chk = ((c["expected"] * n + 2**31) % 2**32) - 2**31
    driver = driver.replace("N_VALUE", str(n)).replace("CALL_VALUE", c["call"]).replace("EXPECTED_VALUE", str(c["expected"])).replace("CHECKSUM_VALUE", str(chk))
    p = HERE / "generated" / phase / (case + "_N" + str(n) + ".js")
    save(p, body + driver)
    return p


def command(engine, p, extra=(), diag=False):
    m = manifest()
    prefix = m["engines"][engine]["command_prefix"][:]
    if diag:
        prefix[0] = DIAG
    prefix += list(extra)
    a = [x["path"] for x in m["adapters"][engine]]
    return prefix + (["-I", a[0], "-I", a[1], str(p)] if engine == "quickjs" else a + [str(p)])


def sample(case, engine, n, phase, position, extra=(), diag=False):
    p = script(case, n, phase)
    path = HERE / "raw" / phase / (position + "_" + engine + "_" + case + ".json")
    env = dict(os.environ)
    if diag:
        env["ML_DUMP"] = "1"
    r = capture(path, command(engine, p, extra, diag), env=env)
    matches = re.findall(r"^WB_RESULT (.+)$", r["stdout"], re.M)
    value = json.loads(matches[-1]) if matches else {}
    c = config()[case]
    checksum = ((c["expected"] * n + 2**31) % 2**32) - 2**31
    valid = (r["exit_code"] == 0 and value.get("N") == n and value.get("last") == c["expected"]
             and value.get("checksum") == checksum and isinstance(value.get("elapsed_ms"), (int, float))
             and math.isfinite(value["elapsed_ms"]) and value["elapsed_ms"] > 0)
    return dict(case=case, engine=engine, phase=phase, position=position, N=n, valid=valid,
                elapsed_ms=value.get("elapsed_ms"), elapsed_per_call_ms=value.get("elapsed_ms", 0) / n,
                checksum=value.get("checksum"), exit_code=r["exit_code"], script_sha256=sha(p),
                target_sha256=sha(HERE / "cases" / (case + ".js")), binary_sha256=sha(DIAG) if diag else manifest()["engines"][engine]["binary"]["sha256"],
                command=r["command"], timestamp_utc=r["timestamp_utc"], outer_wall_ns=r["outer_wall_ns"],
                stdout=r["stdout"], stderr=r["stderr"], record=str(path.relative_to(HERE)), mode=MODE,
                cohort=manifest()["cohort"])


def correctness():
    verify()
    rows = []
    for case in config():
        for n in (1, 2, 64):
            for engine in ENGINES:
                r = sample(case, engine, n, "correctness", "N" + str(n))
                rows.append(r)
                print("CORRECTNESS", case, engine, n, r["valid"], flush=True)
    export(HERE / "correctness.csv", rows)
    assert all(r["valid"] for r in rows), "Correctness gate failed"


def dumps():
    verify()
    assert sha(DIAG) == DIAG_SHA
    sizes = {m[0]: dict(size=int(m[1]), pop=int(m[2]), push=int(m[3]), fmt=m[4])
             for m in re.findall(r"^DEF\(\s*(\w+),\s*(\d+),\s*(\d+),\s*(\d+),\s*(\w+)\)", (ROOT / "engines/quickjs-upstream/quickjs-opcode.h").read_text(), re.M)}
    totals = []
    for case, c in config().items():
        q = sample(case, "quickjs", 1, "dump", "final", diag=True)
        assert q["valid"]
        save(HERE / "bytecode/quickjs" / (case + ".full.txt"), q["stdout"])
        for name in c["functions"]:
            # This revision prints a filename/line/column followed by 'function: name'.
            text = q["stdout"]
            match = re.search(r"(?m)^.*: function: " + re.escape(name) + r"$", text)
            if not match:
                raise RuntimeError("Cannot locate QuickJS function " + name)
            end = re.search(r"(?m)^.*: function: |^WB_RESULT ", text[match.end():])
            block = text[match.start(): match.end() + end.start()] if end else text[match.start():]
            ins, pc = [], 0
            for line in block.splitlines():
                m = re.match(r"^\s*(?:(\d+):\s+)?(\w+)(?:\s+(.*))?$", line)
                if m and m[2] in sizes:
                    if m[1] is not None:
                        assert int(m[1]) == pc, (name, pc, line)
                    ins.append(dict(offset=pc, opcode=m[2], operands=m[3] or "", **sizes[m[2]]))
                    pc += sizes[m[2]]["size"]
            assert ins and ins[-1]["opcode"] in ("return", "return_undef")
            save(HERE / "bytecode/quickjs" / (name + ".txt"), block)
            save(HERE / "bytecode/quickjs" / (name + ".decoded.json"), ins)
            totals.append(dict(case=case, engine="quickjs", function=name, instructions=len(ins), bytes=pc,
                               method="decoded opcode widths; printed branch PCs cross-checked", raw=q["record"]))
            v = sample(case, "v8", 1, "dump", name, extra=("--print-bytecode", "--print-bytecode-filter=" + name))
            assert v["valid"]
            save(HERE / "bytecode/v8" / (name + ".txt"), v["stdout"])
            vi = []
            for line in v["stdout"].splitlines():
                m = re.search(r"@\s*(\d+)\s*:\s*((?:[0-9a-f]{2}\s+)+)([A-Z]\w*)(.*)$", line)
                if m:
                    vi.append(dict(offset=int(m[1]), size=len(m[2].split()), hex=m[2].split(), opcode=m[3], operands=m[4].strip()))
            length = int(re.search(r"Bytecode length: (\d+)", v["stdout"])[1])
            assert vi and sum(x["size"] for x in vi) == length
            assert [x["offset"] for x in vi] == list(itertools.accumulate([0] + [x["size"] for x in vi[:-1]]))
            save(HERE / "bytecode/v8" / (name + ".decoded.json"), vi)
            totals.append(dict(case=case, engine="v8", function=name, instructions=len(vi), bytes=length,
                               method="instruction hex widths and offsets validated against Bytecode length", raw=v["record"]))
            print("DUMP", name, "QJS", len(ins), pc, "V8", len(vi), length, flush=True)
    export(HERE / "bytecode/static_counts.csv", totals)


def calibrate():
    verify()
    assert (HERE / "correctness.csv").exists()
    for case, c in config().items():
        if not c["timed"]:
            continue
        selected = HERE / "calibration" / (case + ".json")
        if selected.exists():
            continue
        rows, n = [], 1
        while n <= manifest()["max_N"]:
            pair = [sample(case, e, n, "calibration", "N" + str(n)) for e in ENGINES]
            rows += pair
            assert all(x["valid"] for x in pair), "Calibration failed"
            print("CALIBRATE", case, n, [round(x["elapsed_ms"], 3) for x in pair], flush=True)
            if min(x["elapsed_ms"] for x in pair) >= manifest()["threshold_ms"]:
                # Independent checks in fresh processes at selected N; no performance warmup.
                for e in ENGINES:
                    check = sample(case, e, n, "selected_correctness", "selected")
                    assert check["valid"]
                save(selected, dict(case=case, N=n, threshold_ms=1000, pilot=pair, all_pass=True))
                export(HERE / "calibration" / (case + ".csv"), rows)
                break
            n *= 2
        else:
            raise RuntimeError("Calibration N cap")


def schedule():
    p = HERE / "schedule.json"
    if p.exists():
        return read(p)
    rng = random.Random(SEED)
    cases = [x for x, c in config().items() if c["timed"]]
    orders = {}
    for c in cases:
        orders[c] = [list(ENGINES), list(reversed(ENGINES))] * 15
        rng.shuffle(orders[c])
    out = []
    for rep in range(30):
        shuffled = cases[:]
        rng.shuffle(shuffled)
        for case in shuffled:
            for order, engine in enumerate(orders[case][rep]):
                out.append(dict(rep=rep, case=case, order=order + 1, engine=engine))
    save(p, out)
    return out


def measure():
    verify()
    for pos in schedule():
        n = read(HERE / "calibration" / (pos["case"] + ".json"))["N"]
        label = "rep%02d_order%d" % (pos["rep"], pos["order"])
        r = sample(pos["case"], pos["engine"], n, "formal", label)
        assert r["valid"], "Formal failure retained: " + r["record"]
        print("FORMAL", pos["rep"], pos["case"], pos["engine"], round(r["elapsed_ms"], 3), flush=True)
    verify()


def summarize():
    m = verify()
    rows = []
    for pos in schedule():
        n = read(HERE / "calibration" / (pos["case"] + ".json"))["N"]
        label = "rep%02d_order%d" % (pos["rep"], pos["order"])
        assert (HERE / "raw/formal" / (label + "_" + pos["engine"] + "_" + pos["case"] + ".json")).exists(), "Missing formal position"
        r = sample(pos["case"], pos["engine"], n, "formal", label)
        rows.append(dict(**r, rep=pos["rep"], order=pos["order"]))
    assert len(rows) == 180 and all(r["valid"] for r in rows)
    summaries = []
    for case, c in config().items():
        if not c["timed"]:
            continue
        per = {}
        for e in ENGINES:
            group = [x for x in rows if x["case"] == case and x["engine"] == e]
            assert len(group) == 30 and len(set(x["rep"] for x in group)) == 30
            assert sum(x["order"] == 1 for x in group) == 15
            assert len(set(x["script_sha256"] for x in group)) == 1
            vals = [x["elapsed_per_call_ms"] for x in group]
            qs = statistics.quantiles(vals, n=4, method="inclusive")
            per[e] = dict(median=statistics.median(vals), q1=qs[0], q3=qs[2], mean=statistics.mean(vals),
                          stddev=statistics.stdev(vals), IQR=qs[2]-qs[0], min=min(vals), max=max(vals))
        assert len(set(x["script_sha256"] for x in rows if x["case"] == case)) == 1
        for e in ENGINES:
            summaries.append(dict(case=case, engine=e, count=30, N=read(HERE / "calibration" / (case + ".json"))["N"],
                                  **per[e], v8_over_quickjs=per["v8"]["median"] / per["quickjs"]["median"], unit="ms per target invocation"))
    preservation = read(HERE / "raw/preservation_before.json")
    unchanged = all((ROOT / rel).is_file() and sha(ROOT / rel) == digest for rel, digest in preservation.items())
    audit = dict(status="COMPLETE" if unchanged else "FAILED_PRESERVATION", formal_valid=len(rows), formal_expected=180,
                 six_case_correctness_records=len(list((HERE / "raw/correctness").glob("*.json"))),
                 balanced_order=True, same_script_both_engines=True, flags_preserved=True, artifacts_hash_verified=True,
                 old_files_unchanged=unchanged, quartiles="Python statistics.quantiles inclusive = linear rank (n-1)*p",
                 diagnostics_in_formal=False, warmed_up=False, overall_geometric_mean=None,
                 exact_v8_source_commit=None, exact_v8_build_flags=None, counts_dynamic_measured=False,
                 runner_sha256_at_finish=sha(__file__))
    export(HERE / "raw/timing.csv", rows)
    export(HERE / "summary.csv", summaries)
    save(HERE / "audit.json", audit)
    assert unchanged
    print(json.dumps(audit, indent=2), flush=True)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("stage", choices=("prepare", "correctness", "dump", "calibrate", "measure", "summarize", "evidence", "all"))
    stage = parser.parse_args().stage
    functions = dict(prepare=prepare, correctness=correctness, dump=dumps, calibrate=calibrate, measure=measure, summarize=summarize)
    if stage == "evidence":
        from evidence import main as collect_evidence
        collect_evidence()
    elif stage == "all":
        for function in functions.values():
            function()
    else:
        functions[stage]()


if __name__ == "__main__":
    main()
