"""Summarize the explicitly requested single timing round; never reruns engines."""
import argparse
import collections
import csv
import gzip
import hashlib
import json
from pathlib import Path


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("directory", type=Path)
    p.add_argument("--plot", action="store_true")
    args = p.parse_args()
    out = args.directory.resolve()
    protocol = json.loads((out / "protocol.json").read_text())
    complete = json.loads((out / "completion.json").read_text())
    assert complete["status"] == "PASS_COMPLETE" and complete["timing_samples"] == 18
    assert sha(out / "protocol.json") == json.loads((out / "frozen.json").read_text())["protocol_sha256"]
    assert sha(out / "runs.jsonl") == complete["raw_sha256"]
    for name, digest in protocol["frozen_files"].items():
        assert sha(Path(name)) == digest
    raw = [json.loads(line) for line in (out / "runs.jsonl").read_text().splitlines()]
    assert all(r["status"] == "PASS" for r in raw)
    assert collections.Counter(r["phase"] for r in raw) == dict(gate=6, measure=18)
    assert all(raw[i]["stopped_ns"] <= raw[i+1]["started_ns"] for i in range(len(raw)-1))
    samples = [r for r in raw if r["phase"] == "measure"]
    schedule = json.loads((out / "schedule.json").read_text())
    for row, entry in zip(samples, schedule, strict=True):
        assert all(row[k] == entry[k] for k in ["case", "label", "position"])
    indexed = {(r["case"], r["label"]):r for r in samples}
    assert len(indexed) == 18
    counts = json.loads((out / "counts/results.json").read_text())
    assert counts["status"] == "PASS"
    results = []
    for case, shapes, repeat in protocol["cases"]:
        e, v = counts["EVAL_COLD"][case], counts["V8_ON"][case]
        assert e["hits"]+e["misses"] == e["N"] == 65536
        c = json.loads((out / "counts" / case / "counter.json").read_text())
        assert c["before_reset"]["queries"] == protocol["warmup_iterations"]
        assert c["measured"]["queries"] == 65536
        row = dict(case=case, shapes=shapes, run_length=repeat,
            EVAL_COLD_diagnostic_hit_percent=e["actual_hit_percent"],
            V8_ON_diagnostic_hit_percent=v["actual_hit_percent"],
            EVAL_diagnostic_N=e["N"], V8_diagnostic_N=v["N"],
            V8_diagnostic_method=v["method"])
        for label in ["A", "EVAL_COLD", "V8_ON"]:
            r = indexed[case,label]
            payload = r["payload"]
            assert payload["iterations"] == protocol["N"] and payload["checksum"] == 3*protocol["N"]
            assert payload["shapes"] == shapes and payload["run_length"] == repeat
            if label == "A": assert payload["elapsed_ms"] > 3000
            row[label+"_seconds"] = payload["elapsed_ms"]/1000
        row["EVAL_change_vs_A_percent"] = 100*(row["EVAL_COLD_seconds"]/row["A_seconds"]-1)
        row["V8_change_vs_A_percent"] = 100*(row["V8_ON_seconds"]/row["A_seconds"]-1)
        row["EVAL_change_vs_V8_percent"] = 100*(row["EVAL_COLD_seconds"]/row["V8_ON_seconds"]-1)
        results.append(row)
    with (out / "comparison.csv").open("w", newline="") as stream:
        w = csv.DictWriter(stream, fieldnames=list(results[0]));w.writeheader();w.writerows(results)
    (out / "analysis.json").write_text(json.dumps(dict(results=results), indent=2)+"\n")
    lines = ["# 新布局输入：三引擎单轮耗时", "",
        "按用户要求每点仅 1 个独立进程，没有补测；单位为秒。括号百分比相对同组原版 A，负数更快。",
        f"三者每点固定 {protocol['N']:,} 次读取，序列长 {protocol['sequence_length']:,}，预热 {protocol['warmup_iterations']:,} 次，CPU 2。",
        "原始未插桩 Release ELF；V8_ON --jitless --no-lazy --use-ic。Setup 与预热不进入表中计时。", "",
        "| 连续读取次数 | EVAL 诊断命中率 | V8 诊断命中率 | 原版 QJS A | EVAL_COLD | 相对 A | V8_ON --jitless | 相对 A |",
        "|---:|---:|---:|---:|---:|---:|---:|---:|"]
    for r in results:
        label = "单形状对照" if r["case"] == "mono" else str(r["run_length"])
        lines.append(f"| {label} | {r['EVAL_COLD_diagnostic_hit_percent']:.2f}% | {r['V8_ON_diagnostic_hit_percent']:.2f}% | "
            f"{r['A_seconds']:.4f} | {r['EVAL_COLD_seconds']:.4f} | {r['EVAL_change_vs_A_percent']:+.2f}% | "
            f"{r['V8_ON_seconds']:.4f} | {r['V8_change_vs_A_percent']:+.2f}% |")
    lines += ["", "前五组固定 65,536 个对象/形状、同一序列长度，只改变连续重复次数；单形状对照只有一个对象，工作集更小，单独解释。",
        "命中率来自独立诊断窗口，不是 134,217,728 次计时过程的全程计数。",
        "EVAL 为本次六个 65,536 次读取窗口，利用已有诊断 ELF，在第一次 JS performance.now 时将计数归零，第二次捕获，排除了预热。",
        "V8 的重复 1/2/4/16 和单形状数据沿用之前已核实的同源码/布局/序列/预热参数诊断，",
        "重复 8 为本次补充的 4,096 次窗口。V8 诊断样本量分别为 65,536 或 4,096，详见 comparison.csv。",
        "分配布局、访问分布和采样窗口会影响 V8 的小幅残余命中；表中近似命中档位不冒充计时过程的精确全程比例。",
        "命中计数的时间没有混入本表。每点仅一轮，无法估计测量方差；小差异需后续复测。",
        "连续重复次数还会影响局部性/分支模式，跨行时间变化不能全部归因于 IC 命中率。", ""]
    (out / "results.md").write_text("\n".join(lines))
    (out / "raw/runs.jsonl.gz").write_bytes(gzip.compress((out / "runs.jsonl").read_bytes(), mtime=0))
    audit = dict(status="PASS_COMPLETE_OFFLINE", timing_processes=18, correctness_processes=6,
        rounds_per_point=1, all_A_exceed_3_seconds=True, serial_processes=True,
        same_script_for_three_engines_per_case=True, counter_windows_exclude_warmup=True,
        raw_sha256=sha(out / "runs.jsonl"), analyzer_sha256=sha(Path(__file__)))
    (out / "audit.json").write_text(json.dumps(audit, indent=2)+"\n")
    if args.plot:
        import matplotlib
        matplotlib.use("Agg")
        import matplotlib.pyplot as plt
        fig, axes = plt.subplots(1,2,figsize=(11,4.3))
        main_rows = results[:-1]
        x = [r["EVAL_COLD_diagnostic_hit_percent"] for r in main_rows]
        colors={"A":"#555555","EVAL_COLD":"#18754b","V8_ON":"#285ba8"}
        for label in ["A","EVAL_COLD","V8_ON"]:
            axes[0].plot(x,[r[label+"_seconds"] for r in main_rows],"o-",label=label,color=colors[label])
        for label,key in [("EVAL_COLD","EVAL_change_vs_A_percent"),("V8_ON","V8_change_vs_A_percent")]:
            axes[1].plot(x,[r[key] for r in main_rows],"o-",label=label,color=colors[label])
        axes[0].set_ylabel("Timed loop (seconds)");axes[1].set_ylabel("Time change vs matched A (%)")
        axes[1].axhline(0,color="#555555",linestyle="--",linewidth=1)
        for ax in axes:
            ax.set_xlabel("Input repeat fraction (%)")
            ax.set_xlim(-2,100);ax.grid(alpha=.2);ax.legend(frameon=False)
        fig.suptitle("One run per point; 65,536 layouts; 134,217,728 reads")
        fig.tight_layout()
        fig.savefig(out / "timing_curve.png",dpi=170)
        fig.savefig(out / "timing_curve.svg")
        plt.close(fig)
    print((out / "results.md").read_text())


if __name__ == "__main__":
    main()
