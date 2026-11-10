"""One diagnostic process per Octane item/engine; reuse original timed Run counts."""
import argparse
from datetime import datetime
import hashlib
import json
import os
from pathlib import Path
import subprocess
import time
from zoneinfo import ZoneInfo

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
OLD = ROOT / "experiments/native_confirmation_20261108/attempt02"


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def write(path, data):
    path.write_text(json.dumps(data, indent=2, ensure_ascii=False)+"\n")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()
    out = args.output.resolve()
    assert not (out / "protocol.json").exists()
    (out / "scripts").mkdir()
    (out / "raw").mkdir()
    old = json.loads((OLD / "protocol.json").read_text())
    runtime = json.loads((OLD / "runtime_manifest.json").read_text())
    eval_manifest = json.loads((out / "eval_diagnostic/build_manifest.json").read_text())
    qjs = out / "eval_diagnostic/work/EVAL_COLD_DIAG/qjs"
    library = out / "v8_native_counts.so"
    os.sched_setaffinity(0, {2})
    env = dict(os.environ, TZ="Asia/Shanghai", LC_ALL="C", LANG="C")
    assert not env.get("LD_PRELOAD") and not env.get("LD_AUDIT")
    cases = old["scripts"]["octane"]
    scripts = {}
    for case, info in cases.items():
        original = info["measure"]
        src = Path(original["path"])
        assert sha(src) == original["sha256"]
        text = src.read_text()
        assert text.count("  var started=now();") == text.count("  var stopped=now();") == 1
        scripts[case] = {}
        for label in ["EVAL_COLD", "V8_ON"]:
            begin = "__oct_count_begin();" if label == "EVAL_COLD" else "%SystemBreak();"
            end = "__oct_count_end();" if label == "EVAL_COLD" else "%SystemBreak();"
            marked = text.replace("  var started=now();", "  var started=now();\n  "+begin, 1)
            marked = marked.replace("  var stopped=now();", "  "+end+"\n  var stopped=now();", 1)
            path = out / "scripts" / (case+"."+label+".js")
            path.write_text(marked)
            scripts[case][label] = dict(path=str(path), sha256=sha(path), N=original["N"],
                original_script=str(src), original_sha256=original["sha256"])
    frozen = {str(HERE / n):sha(HERE / n) for n in ["run_octane_ic_counts.py", "v8_octane_native_counts.c", "build_octane_eval_counts.py"]}
    frozen[str(qjs)] = sha(qjs)
    frozen[str(library)] = sha(library)
    frozen[str(out / "eval_diagnostic/build_manifest.json")] = sha(out / "eval_diagnostic/build_manifest.json")
    assert sha(qjs) == eval_manifest["diagnostic_elf_sha256"]
    protocol = dict(started_at=datetime.now(ZoneInfo("Asia/Shanghai")).isoformat(),
        scope="explicit prepared/bytecode named reads excluding length; Run interval only",
        labels=["EVAL_COLD", "V8_ON"], diagnostic_processes_per_item=1,
        case_count=len(cases), original_Run_N_reused=True, scripts=scripts, cpu=2,
        no_workload_warmup=True, setup_and_postvalidation_excluded=True,
        counters="EVAL full prepared/fused/prototype reads; V8 original ELF in-process native trampolines, query/miss/no-feedback counts",
        V8_cache_hit_definition="named bytecode read not entering no-feedback or IC-miss dispatch; may include getter/dictionary/generic handlers, not necessarily field-offset-only",
        V8_length_compressed_name="0xe39, verified in two original-ELF probes and mixed-length calibration",
        calibrations=["calibration01", "calibration02", "calibration03"],
        frozen_files=frozen, runtime=runtime,
        flags_V8=["--jitless","--no-lazy","--use-ic","--allow-natives-syntax"],
        formal_timing_samples_added=0)
    write(out / "protocol.json", protocol)
    digest = sha(out / "protocol.json")
    write(out / "frozen.json", dict(protocol_sha256=digest))
    write(out / "environment.json", dict(time=datetime.now(ZoneInfo("Asia/Shanghai")).isoformat(),
        affinity=sorted(os.sched_getaffinity(0)), boot_id=Path("/proc/sys/kernel/random/boot_id").read_text().strip()))

    def verify():
        assert sha(out / "protocol.json") == digest
        for name, h in frozen.items(): assert sha(Path(name)) == h, name
        for label in ["EVAL_COLD","V8_ON"]:
            r = runtime[label]
            assert sha(Path(r["path"])) == r["sha256"]
            for d in r.get("dependencies", []) + r.get("system_libraries", []):
                assert sha(Path(d["path"])) == d["sha256"]
        for paths in scripts.values():
            for info in paths.values(): assert sha(Path(info["path"])) == info["sha256"]

    total = 2*len(cases)
    done = 0
    verify()
    for case, paths in scripts.items():
        for label, info in paths.items():
            verify()
            command = [str(qjs)] if label=="EVAL_COLD" else [runtime[label]["path"]]
            child_env = env.copy()
            if label=="V8_ON":
                snapshot=next(d["path"] for d in runtime[label]["dependencies"] if d["path"].endswith("snapshot_blob.bin"))
                command += ["--snapshot_blob="+snapshot,"--jitless","--no-lazy","--use-ic","--allow-natives-syntax"]
                child_env["LD_PRELOAD"] = str(library)
            elif case=="zlib.zlib":
                command += ["--std","-I",str(ROOT / "experiments/v8_inspired_ic/attempt03/inputs/zlib_read.js")]
            command.append(info["path"])
            t0=time.monotonic_ns()
            p=subprocess.run(command,capture_output=True,text=True,env=child_env,timeout=600)
            t1=time.monotonic_ns()
            name=case+"."+label
            (out / "raw" / (name+".stdout")).write_text(p.stdout)
            (out / "raw" / (name+".stderr")).write_text(p.stderr)
            row=dict(case=case,label=label,N=info["N"],command=command,returncode=p.returncode,
                started_ns=t0,stopped_ns=t1,external_wall_ms=(t1-t0)/1e6,script_sha256=info["sha256"])
            try:
                assert p.returncode==0, p.stderr[-2000:]
                prefix="OCTANE_IC_COUNTS:" if label=="EVAL_COLD" else "V8_OCTANE_COUNTS:"
                lines=p.stderr.strip().splitlines()
                assert len(lines)==1 and lines[0].startswith(prefix),p.stderr[-2000:]
                c=json.loads(lines[0][len(prefix):]);row["raw_counts"]=c
                payloads=[json.loads(s[len("OCTANE_IC_RESULT:"):]) for s in p.stdout.splitlines() if s.startswith("OCTANE_IC_RESULT:")]
                assert len(payloads)==1 and payloads[0]["correctness"]=="PASS" and payloads[0]["N"]==info["N"]
                row["validation_payload"]=payloads[0]
                if label=="EVAL_COLD":
                    q,h,m=c["queries"],c["hits"],c["misses"]
                    assert q==h+m and c["fused_hits"]<=h and c["proto_hits"]<=h
                    row.update(queries=q,hits=h,misses=m,no_feedback=0)
                else:
                    assert c["bad_frame"]==0,c
                    q=c["queries_all"]-c["length_queries"]
                    m=c["misses_all"]-c["length_misses"]
                    nf=c["no_feedback_all"]-c["length_no_feedback"]
                    assert q>=0 and m>=0 and nf>=0 and m+nf<=q,c
                    row.update(queries=q,hits=q-m-nf,misses=m,no_feedback=nf,
                        generic_runtime_calls=c["generic_runtime_all"]-c["length_generic_runtime"])
                row["hit_percent"] = 100*row["hits"]/row["queries"] if row["queries"] else None
                row["status"]="PASS"
            except Exception as exc:
                row.update(status="FAIL",error=str(exc))
            with (out / "runs.jsonl").open("a") as stream:
                stream.write(json.dumps(row)+"\n");stream.flush();os.fsync(stream.fileno())
            assert row["status"]=="PASS",row
            done+=1
            write(out / "progress.json",dict(status="RUNNING",completed=done,total=total,case=case,label=label))
            print(f"{done}/{total} {case} {label} hit={row['hit_percent']}% queries={row['queries']}",flush=True)
    verify()
    write(out / "completion.json",dict(status="PASS_COMPLETE",diagnostic_processes=done,
        raw_sha256=sha(out / "runs.jsonl"),completed_at=datetime.now(ZoneInfo("Asia/Shanghai")).isoformat()))
    write(out / "progress.json",dict(status="COMPLETE",completed=done,total=total))


if __name__=="__main__":main()
