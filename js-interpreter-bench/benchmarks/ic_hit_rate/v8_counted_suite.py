"""Exact original-ELF V8 IC accounting for the seven microbenchmark inputs."""
import argparse
import csv
from datetime import datetime
import hashlib
import json
import os
from pathlib import Path
import subprocess
import sys
from zoneinfo import ZoneInfo

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
PERF = ROOT / "experiments/ic_microbench_20261109/performance02"
RATES = [0, 25, 50, 75, 90, 99, 100]
N = 201326592


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def write(path, value):
    path.write_text(json.dumps(value, ensure_ascii=False, indent=2) + "\n")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()
    out = args.output.resolve()
    out.mkdir(parents=True, exist_ok=False)
    os.sched_setaffinity(0, {2})
    frozen = {str(HERE / name): sha(HERE / name) for name in [
        "own_read.js", "v8_gdb_counts.py", "v8_gdb_driver.py", "v8_counted_suite.py"]}
    runtime = json.loads((PERF / "runtime_manifest.json").read_text())["V8_ON"]
    write(out / "protocol.json", dict(started_at=datetime.now(ZoneInfo("Asia/Shanghai")).isoformat(),
        scope="readLoop's sole named property load; original V8 ELF under GDB",
        rates=RATES, N=N, cpu=2, formal_performance_samples=0,
        gating="9 short probes with direct named-load entry counts before seven complete runs",
        numerator="N - no_feedback - ic_miss; generic fallback must be zero",
        definition="no-feedback reads are not IC hits; no-feedback runtime fallback is a subset, not subtracted twice",
        flags=["--jitless", "--no-lazy", "--use-ic", "--allow-natives-syntax"],
        flags_not_added=["--log-ic", "--runtime-call-stats", "--no-lazy-feedback-allocation"],
        frozen_tools=frozen, runtime=runtime))
    (out / "inputs").mkdir()
    for path in frozen:
        (out / "inputs" / Path(path).name).write_bytes(Path(path).read_bytes())
    original = (HERE / "own_read.js").read_text()
    kernel = original[original.index("function readLoop("):original.index("function selfTest(")]

    def run(rate, n, gate):
        name = ("gate" if gate else "full") + f".hit{rate}.N{n}"
        dest = out / name
        command = [sys.executable, "-B", str(HERE / "v8_gdb_counts.py"), "--output", str(dest),
                   "--rate", str(rate), "--iterations", str(n)]
        if gate:
            command.append("--gate-total")
        result = subprocess.run(command, capture_output=True, text=True, timeout=240)
        (out / (name + ".stdout")).write_text(result.stdout)
        (out / (name + ".stderr")).write_text(result.stderr)
        assert result.returncode == 0, (name, result.stderr[-3000:])
        record = json.loads((dest / "counter.json").read_text())
        assert record["status"] == "PASS"
        c = record["counts"]
        assert c["generic_runtime_fallback"] == c["no_feedback_runtime_fallback"] == 0, c
        assert 0 <= c["ic_miss"] + c["no_feedback"] <= n
        if gate:
            assert c["named_load_entries"] == n
        else:
            assert c["named_load_entries"] == 0  # direct-entry breakpoints disabled for long runs
        marked = (dest / "marked.js").read_text()
        marked_kernel = marked[marked.index("function readLoop("):marked.index("function selfTest(")]
        assert marked_kernel == kernel
        misses = c["ic_miss"] + c["no_feedback"]
        return dict(input_parameter_percent=rate, N=n, **c, nonhits=misses,
                    cached_hits=n-misses, actual_hit_percent=100*(n-misses)/n)

    gates = [run(rate, n, True) for rate in [0, 50, 100] for n in [1, 11, 16]]
    write(out / "gates.json", dict(status="PASS", results=gates))
    print("V8_COUNTER_GATES_PASS 9", flush=True)
    prior = json.loads((PERF / "analysis.json").read_text())["summary"]
    prior = {r["requested_hit_percent"]: r for r in prior}
    rows = []
    for rate in RATES:
        row = run(rate, N, False)
        row["EVAL_COLD_actual_hit_percent"] = prior[rate]["actual_hit_percent"]
        row["V8_ON_seconds_previous_5round_median"] = prior[rate]["V8_ON_seconds"]
        rows.append(row)
        print(f"input={rate}% V8 hits={row['cached_hits']} no_feedback={row['no_feedback']} "
              f"ic_miss={row['ic_miss']} rate={row['actual_hit_percent']:.9f}%", flush=True)
    for path, digest in frozen.items():
        assert sha(Path(path)) == digest
    assert sha(Path(runtime["path"])) == runtime["sha256"]
    write(out / "results.json", dict(status="PASS", total_short_probes=9, full_probes=7,
        completed_at=datetime.now(ZoneInfo("Asia/Shanghai")).isoformat(), results=rows))
    with (out / "results.csv").open("w", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=list(rows[0]))
        writer.writeheader()
        writer.writerows(rows)
    lines = ["# V8_ON --jitless：七组输入的实际 IC 命中率", "",
        "使用此前性能测试完全相同的原 V8 ELF、snapshot、--jitless --no-lazy --use-ic；",
        "新增 --allow-natives-syntax 仅供两处 SystemBreak 区间标记。没有开启 IC 日志、RCS 或强制提前分配反馈。",
        "GDB 只启动并跟踪本测试的子进程，不修改 ELF 文件；临时软件断点用于原生路径计数。",
        "每组独立进程执行 201,326,592 次 obj.x。所有 readLoop 内核源码逐字节一致；",
        "参数属性读取和全局函数解析均移到标记区间外。诊断计时不进入正式性能结果。", "",
        "| 输入参数（按 EVAL 单槽设计） | EVAL 实测命中率 | V8 无反馈访问 | V8 IC miss | V8 命中次数 | V8 实际命中率 |",
        "|---:|---:|---:|---:|---:|---:|"]
    for r in rows:
        lines.append(f"| {r['input_parameter_percent']}% | {r['EVAL_COLD_actual_hit_percent']:.9f}% | "
            f"{r['no_feedback']} | {r['ic_miss']} | {r['cached_hits']:,} | {r['actual_hit_percent']:.9f}% |")
    lines += ["", "计算口径：命中率 = (N − 无反馈访问 − IC miss) / N。",
        "Runtime_LoadNoFeedbackIC_Miss 属于无反馈分支子集，不重复扣除；本次该子集及通用 Runtime_GetProperty 回退均为零。",
        "对稳定的普通自身数据属性，缓存处理成功包含单态和多态处理成功。",
        "无反馈阶段即使能用通用快速属性查找完成，也不算 IC 命中。", "",
        "验证：9 个短探针在 0/50/100% 输入下各运行 N=1/11/16，同时直接数 GetNamedPropertyHandler 入口，",
        "确认目标读取入口恰好等于 N；所有断点必须解析成唯一地址，不能有 pending 断点。",
        "两处区间端点均通过原生 SystemBreak 堆栈确认。完整运行不在每次命中处设置断点，",
        "只统计未命中/无反馈等少数分支，再由固定单次读取循环次数补出命中数。", "",
        "七组实际命中率都接近 100%，因此此前 V8 在这些输入下的耗时差异不能解读为其命中率从 0% 升到 100%。",
        "本次只统计此微基准的稳定普通自身属性读取，不声称该计数口径可直接套到任意 getter/Proxy/字典属性。", ""]
    (out / "summary.md").write_text("\n".join(lines))
    print("V8_COUNTED_SUITE_PASS", flush=True)


if __name__ == "__main__":
    main()
