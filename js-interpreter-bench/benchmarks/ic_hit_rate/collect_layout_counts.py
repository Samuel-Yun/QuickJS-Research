"""Short diagnostic counts associated with the single-round layout timings."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import subprocess

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
LAB = ROOT / "experiments/ic_microbench_20261109"


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    out = args.output.resolve()
    out.mkdir(parents=True, exist_ok=False)
    perf = LAB / "layout_timing01"
    qjs = LAB / "diagnostic01/work/EVAL_COLD_DIAG/qjs"
    manifest = json.loads((LAB / "diagnostic01/build_manifest.json").read_text())
    assert sha(qjs) == manifest["diagnostic_elf_sha256"]
    os.sched_setaffinity(0, {2})
    driver = out / "qjs_clock_counts.py"
    driver.write_bytes((HERE / "qjs_clock_counts.py").read_bytes())
    counts = {}
    for case in ["repeat1", "repeat2", "repeat4", "repeat8", "repeat16", "mono"]:
        dest = out / case
        dest.mkdir()
        original = (perf / "scripts" / ("measure." + case + ".js")).read_text()
        assert original.count('"134217728"') == 1
        script = dest / "counts.js"
        script.write_text(original.replace('"134217728"', '"65536"', 1))
        config = dest / "config.json"
        config.write_text(json.dumps(dict(N=65536, warmup_N=2097152, output=str(dest / "counter.json"))) + "\n")
        cmd = ["gdb", "--batch", "-q", "-nx", "-x", str(driver), "--args", str(qjs), str(script)]
        env = dict(os.environ, TZ="Asia/Shanghai", LC_ALL="C", LANG="C", QJS_CLOCK_COUNT_CONFIG=str(config))
        p = subprocess.run(cmd, capture_output=True, text=True, env=env, timeout=90)
        (dest / "stdout").write_text(p.stdout)
        (dest / "stderr").write_text(p.stderr)
        (dest / "process.json").write_text(json.dumps(dict(command=cmd, returncode=p.returncode, script_sha256=sha(script))) + "\n")
        assert p.returncode == 0, p.stderr
        r = json.loads((dest / "counter.json").read_text())
        assert r["status"] == "PASS", r
        c = r["measured"]
        assert c["hits"] == c["fused_hits"] + c["regular_hits"]
        counts[case] = dict(N=65536, hits=c["hits"], misses=c["misses"], actual_hit_percent=100*c["hits"]/65536,
                            method="existing diagnostic ELF, counters reset at first JS performance.now; captured at second")
        print("EVAL", case, counts[case]["actual_hit_percent"], flush=True)
    cmd = ["python3", "-B", str(HERE / "probe_v8_layouts.py"), "--output", str(out / "v8_repeat8"),
           "--shapes", "65536", "--run-length", "8", "--iterations", "4096", "--gate-total"]
    p = subprocess.run(cmd, capture_output=True, text=True, timeout=120)
    (out / "v8_repeat8.stdout").write_text(p.stdout)
    (out / "v8_repeat8.stderr").write_text(p.stderr)
    assert p.returncode == 0, p.stderr
    print(p.stdout, end="", flush=True)
    previous = json.loads((LAB / "v8_layout_controls01/results.json").read_text())["results"]
    mapping = {"repeat1":"large_pool_cycle", "repeat2":"repeat2", "repeat4":"repeat4", "repeat16":"repeat16", "mono":"one_shape"}
    v8 = {}
    for case, old_name in mapping.items():
        r = next(r for r in previous if r["case"] == old_name)
        v8[case] = dict(actual_hit_percent=r["actual_hit_percent"], N=r["settings"]["iterations"],
            method="prior matched-input diagnostic, same source/layout/sequence/warmup", source=str(LAB / "v8_layout_controls01/results.json"))
    r = json.loads((out / "v8_repeat8/results.json").read_text())
    v8["repeat8"] = dict(actual_hit_percent=r["actual_hit_percent"], N=4096,
        method="new matched-input diagnostic", source=str(out / "v8_repeat8/results.json"))
    assert sha(qjs) == manifest["diagnostic_elf_sha256"]
    (out / "results.json").write_text(json.dumps(dict(status="PASS", EVAL_COLD=counts, V8_ON=v8,
        note="independent count windows, not instrumentation of the timing samples",
        qjs_diagnostic_sha256=sha(qjs), driver_sha256=sha(driver), runner_sha256=sha(Path(__file__))), indent=2) + "\n")


if __name__ == "__main__":
    main()
