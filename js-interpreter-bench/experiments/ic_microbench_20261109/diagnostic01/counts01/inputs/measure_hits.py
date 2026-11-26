"""Measure actual IC hit counts on an isolated instrumented EVAL_COLD binary."""
import argparse
from datetime import datetime
import hashlib
import json
import os
from pathlib import Path
import subprocess
from zoneinfo import ZoneInfo

HERE = Path(__file__).resolve().parent
RATES = [0, 25, 50, 75, 90, 99, 100]


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def write(path, value):
    path.write_text(json.dumps(value, ensure_ascii=False, indent=2) + "\n")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--diagnostic-dir", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path, help="new results directory")
    parser.add_argument("--iterations", type=int, default=201326592)
    parser.add_argument("--cpu", type=int, default=2)
    args = parser.parse_args()
    if not 1 <= args.iterations <= 500000000:
        parser.error("iterations must be in [1, 500000000]")
    if args.cpu not in os.sched_getaffinity(0):
        parser.error("CPU is not available")
    diag = args.diagnostic_dir.resolve()
    manifest = json.loads((diag / "build_manifest.json").read_text())
    qjs = diag / "work/EVAL_COLD_DIAG/qjs"

    def verify_sources():
        if sha(qjs) != manifest["diagnostic_elf_sha256"]:
            raise RuntimeError("Diagnostic ELF changed")
        if sha(Path(manifest["release_elf"])) != manifest["release_elf_sha256"]:
            raise RuntimeError("Original release ELF changed")
        for name, digest in manifest["all_diagnostic_sources"].items():
            if sha(qjs.parent / name) != digest:
                raise RuntimeError(f"Diagnostic source changed: {name}")

    verify_sources()
    args.output.mkdir(parents=True, exist_ok=False)
    inputs = args.output / "inputs"
    inputs.mkdir()
    script = inputs / "own_read.js"
    script.write_bytes((HERE / "own_read.js").read_bytes())
    for name in ["build_diagnostic.py", "measure_hits.py"]:
        (inputs / name).write_bytes((HERE / name).read_bytes())
    write(args.output / "manifest.json", dict(
        purpose="mechanism counts only; instrumented times are not performance results",
        started_at=datetime.now(ZoneInfo("Asia/Shanghai")).isoformat(),
        qjs=str(qjs), qjs_sha256=sha(qjs), script_sha256=sha(script),
        build_manifest_sha256=sha(diag / "build_manifest.json"),
        runner_sha256=sha(Path(__file__)), rates=RATES,
        iterations=args.iterations, cpu=args.cpu, sequence_length=65536,
        warmup_calls=0, formal_performance_samples=0,
        denominator="queries at readLoop's sole x-read site, including fused successful reads",
    ))
    os.sched_setaffinity(0, {args.cpu})
    env = dict(os.environ, TZ="Asia/Shanghai", LC_ALL="C", LANG="C")
    if env.get("LD_PRELOAD") or env.get("LD_AUDIT"):
        raise RuntimeError("Unexpected dynamic loader instrumentation")

    def run(name, rate, iterations):
        command = [str(qjs), str(script.resolve()), "--hit-percent", str(rate),
                   "--iterations", str(iterations), "--sequence-length", "65536", "--min-ms", "0"]
        result = subprocess.run(command, capture_output=True, text=True, env=env, timeout=1200)
        (args.output / (name + ".stdout")).write_text(result.stdout)
        (args.output / (name + ".stderr")).write_text(result.stderr)
        write(args.output / (name + ".process.json"), dict(command=command, returncode=result.returncode))
        if result.returncode:
            raise RuntimeError(f"{name} failed; raw outputs preserved")
        js = json.loads(result.stdout.strip())
        prefix = "IC_MICRO_COUNTS:"
        lines = result.stderr.splitlines()
        if len(lines) != 1 or not lines[0].startswith(prefix):
            raise RuntimeError(f"Unexpected diagnostic output: {result.stderr[:1000]}")
        counts = json.loads(lines[0][len(prefix):])
        if (counts["watched_sites"] != 1 or counts["capacity"] != 1 or
            counts["function"] != "readLoop" or counts["atom"] != "x" or
            counts["queries"] != iterations or counts["queries"] != counts["hits"] + counts["misses"] or
            counts["hits"] != counts["fused_hits"] + counts["regular_hits"] or
            counts["regular_queries"] != counts["misses"] + counts["regular_hits"] or
            counts["cold_misses"] != 1 or counts["fills"] != counts["misses"]):
            raise RuntimeError(f"Counter consistency check failed: {counts}")
        if js["checksum"] != iterations * 3 or js["iterations"] != iterations:
            raise RuntimeError("Workload checksum failed")
        if counts["hits"] != js["modeled_hits"] or counts["misses"] != js["modeled_misses"]:
            raise RuntimeError(f"Observed counts differ from the model: {name}")
        return dict(requested_hit_percent=rate, iterations=iterations,
                    modeled_hit_percent=js["modeled_hit_percent"],
                    actual_hit_percent=100 * counts["hits"] / counts["queries"],
                    matches_model=True, **counts)

    gates = []
    for rate in [0, 50, 100]:
        for n in [1, 2, 65537]:
            gates.append(run(f"gate.hit{rate}.N{n}", rate, n))
    write(args.output / "counter_checks.json", dict(status="PASS", checks=gates))
    rows = []
    for rate in RATES:
        row = run(f"EVAL_COLD_DIAG.hit{rate}", rate, args.iterations)
        rows.append(row)
        print(f"requested={rate:3d}% actual={row['actual_hit_percent']:.9f}% "
              f"hits={row['hits']} misses={row['misses']} MATCH", flush=True)
    verify_sources()
    write(args.output / "results.json", dict(status="PASS", counter_checks=9,
          completed_at=datetime.now(ZoneInfo("Asia/Shanghai")).isoformat(), results=rows))
    lines = ["# EVAL_COLD 实际 IC 命中率", "",
        "独立诊断版，缓存结构/条件/替换策略保持原版 EVAL_COLD；只增加计数。",
        "统计 readLoop 中唯一的 obj.x 读取位置，包括融合读取成功路径和普通 IC 路径。",
        f"每种设置执行 {args.iterations:,} 次属性读取；计数包含首次冷未命中。", "",
        "| 目标命中率 | 理论命中率 | 实际命中率 | 命中次数 | 未命中次数 |",
        "|---:|---:|---:|---:|---:|"]
    for row in rows:
        lines.append(f"| {row['requested_hit_percent']}% | {row['modeled_hit_percent']:.9f}% | "
                     f"{row['actual_hit_percent']:.9f}% | {row['hits']:,} | {row['misses']:,} |")
    lines += ["", "七组实际命中/未命中次数均与理论值逐次计数一致。",
        "另有 9 个短边界检查：0/50/100% 各测试 1、2、65,537 次，核实冷启动与跨周期边界。",
        "每组均检查 queries=hits+misses=iterations；hits=fused_hits+regular_hits；fills=misses。",
        "本次统计的命中全部走融合读取成功路径；仅统计普通 IC 指令会漏掉这些命中。",
        "诊断二进制的计时受插桩影响，原始 stdout 虽有时间字段，本报告不用于比较性能。",
        "实际命中率保存在 results.json 与原始 *.stderr；原脚本 stdout 中的 actual_ic_hit_percent 仍为 null。", ""]
    (args.output / "summary.md").write_text("\n".join(lines))


if __name__ == "__main__":
    main()
