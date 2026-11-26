"""Audit and summarize the fixed five-round microbenchmark comparison."""
import argparse
import collections
import csv
import gzip
import hashlib
import json
from pathlib import Path
import statistics

LABELS = ["A", "EVAL_COLD", "V8_ON"]


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def write(path, value):
    path.write_text(json.dumps(value, ensure_ascii=False, indent=2) + "\n")


def csv_file(path, rows):
    with path.open("w", newline="") as output:
        writer = csv.DictWriter(output, fieldnames=list(rows[0]))
        writer.writeheader()
        writer.writerows(rows)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("directory", type=Path)
    parser.add_argument("--plot", action="store_true", help="requires matplotlib; never runs an engine")
    args = parser.parse_args()
    here = args.directory.resolve()
    completion = json.loads((here / "completion.json").read_text())
    protocol = json.loads((here / "protocol.json").read_text())
    assert completion["status"] == "PASS_COMPLETE"
    assert sha(here / "protocol.json") == json.loads((here / "frozen.json").read_text())["protocol_sha256"]
    for path, digest in protocol["frozen_files"].items():
        assert sha(Path(path)) == digest, path
    assert sha(here / "runs.jsonl") == completion["raw_sha256"]
    rows = [json.loads(line) for line in (here / "runs.jsonl").read_text().splitlines()]
    assert all(row["status"] == "PASS" and row["returncode"] == 0 for row in rows)
    phase_counts = collections.Counter(row["phase"] for row in rows)
    assert phase_counts == dict(self_test=3, correctness=42, measure=105, diagnostic=7)
    assert all(rows[i]["stopped_ns"] <= rows[i + 1]["started_ns"] for i in range(len(rows) - 1))
    measured = [row for row in rows if row["phase"] == "measure"]
    schedule = json.loads((here / "schedule.json").read_text())
    for row, item in zip(measured, schedule, strict=True):
        assert all(row[key] == item[key] for key in ["rate", "rep", "position", "label"])
    assert len({(r["rate"], r["rep"], r["label"]) for r in measured}) == 105
    diagnostics = {row["rate"]: row for row in rows if row["phase"] == "diagnostic"}
    assert len(diagnostics) == 7
    grouped = collections.defaultdict(list)
    samples = []
    for row in measured:
        p = row["payload"]
        assert p["iterations"] == protocol["iterations"] and p["checksum"] == 3 * protocol["iterations"]
        assert row["script_sha256"] == diagnostics[row["rate"]]["script_sha256"]
        if row["label"] == "A":
            assert p["elapsed_ms"] > 3000
        grouped[row["rate"], row["label"]].append(p["elapsed_ms"])
        samples.append(dict(rate=row["rate"], label=row["label"], rep=row["rep"],
            position=row["position"], elapsed_ms=p["elapsed_ms"], external_wall_ms=row["external_wall_ms"]))
    summary, stats = [], []
    for rate in protocol["rates"]:
        diag = diagnostics[rate]
        c, p = diag["counts"], diag["payload"]
        assert c["queries"] == c["hits"] + c["misses"] == protocol["iterations"]
        assert c["hits"] == p["modeled_hits"] and c["misses"] == p["modeled_misses"]
        assert c["hits"] == c["fused_hits"] + c["regular_hits"]
        assert c["regular_queries"] == c["misses"] + c["regular_hits"]
        assert c["cold_misses"] == 1 and c["fills"] == c["misses"]
        point = dict(requested_hit_percent=rate, modeled_hit_percent=p["modeled_hit_percent"],
            actual_hit_percent=100 * c["hits"] / c["queries"], actual_hits=c["hits"], actual_misses=c["misses"])
        for label in LABELS:
            values = grouped[rate, label]
            assert len(values) == 5
            median = statistics.median(values)
            assert median == sorted(values)[2]
            stats.append(dict(rate=rate, label=label, n=5, median_ms=median,
                mean_ms=statistics.mean(values), min_ms=min(values), max_ms=max(values),
                sample_cv_percent=100 * statistics.stdev(values) / statistics.mean(values),
                ns_per_read_including_loop=median * 1e6 / protocol["iterations"]))
            point[label + "_seconds"] = median / 1000
        point["EVAL_COLD_change_vs_A_percent"] = 100 * (point["EVAL_COLD_seconds"] / point["A_seconds"] - 1)
        point["V8_ON_change_vs_A_percent"] = 100 * (point["V8_ON_seconds"] / point["A_seconds"] - 1)
        point["EVAL_COLD_change_vs_V8_ON_percent"] = 100 * (point["EVAL_COLD_seconds"] / point["V8_ON_seconds"] - 1)
        summary.append(point)
    by_rate = {point["requested_hit_percent"]: point for point in summary}
    endpoints = {label + "_100_vs_0_percent": 100 *
                 (by_rate[100][label + "_seconds"] / by_rate[0][label + "_seconds"] - 1)
                 for label in LABELS}
    endpoints["EVAL_COLD_gain_over_A_at_0_percent"] = -by_rate[0]["EVAL_COLD_change_vs_A_percent"]
    endpoints["EVAL_COLD_gain_over_A_at_100_percent"] = -by_rate[100]["EVAL_COLD_change_vs_A_percent"]
    csv_file(here / "samples.csv", samples)
    csv_file(here / "statistics.csv", stats)
    csv_file(here / "comparison.csv", summary)
    write(here / "analysis.json", dict(summary=summary, endpoints=endpoints, statistics=stats))
    lines = ["# 属性读取微基准：A / EVAL_COLD / V8_ON --jitless", "",
        "每点 5 个独立进程，表中为计时循环耗时中位数（秒）；负百分比表示耗时降低。",
        "固定 CPU 2，每次 201,326,592 次读取，七组使用相同循环次数、内核与校验值。",
        "原始 Release ELF，无工作负载预热，首次 readLoop 调用包含在计时中；Setup 在计时外。",
        "V8 参数：--jitless --no-lazy --use-ic（另提供原 snapshot_blob）。", "",
        "| 设置参数 | 理论命中率 | EVAL_COLD 实测命中率 | A（秒） | EVAL_COLD（秒） | 相对 A | V8_ON（秒） | 相对 A | EVAL 相对 V8 |",
        "|---:|---:|---:|---:|---:|---:|---:|---:|---:|"]
    for p in summary:
        lines.append(f"| {p['requested_hit_percent']}% | {p['modeled_hit_percent']:.9f}% | "
            f"{p['actual_hit_percent']:.9f}% | {p['A_seconds']:.4f} | {p['EVAL_COLD_seconds']:.4f} | "
            f"{p['EVAL_COLD_change_vs_A_percent']:+.2f}% | {p['V8_ON_seconds']:.4f} | "
            f"{p['V8_ON_change_vs_A_percent']:+.2f}% | {p['EVAL_COLD_change_vs_V8_ON_percent']:+.2f}% |")
    lines += ["", "## 波动范围", "",
        "各单元为五轮最小—最大值（秒），括号为样本标准差/均值 CV。保留全部样本，未剔除慢点。", "",
        "| 设置参数 | A | EVAL_COLD | V8_ON |", "|---:|---:|---:|---:|"]
    indexed = {(s["rate"], s["label"]): s for s in stats}
    for rate in protocol["rates"]:
        cells = []
        for label in LABELS:
            s = indexed[rate, label]
            cells.append(f"{s['min_ms']/1000:.4f}—{s['max_ms']/1000:.4f}（{s['sample_cv_percent']:.2f}%）")
        lines.append(f"| {rate}% | " + " | ".join(cells) + " |")
    lines += ["", "## 解释边界", "",
        f"EVAL_COLD 从 0% 输入到 100% 输入的耗时变化为 {endpoints['EVAL_COLD_100_vs_0_percent']:+.2f}%。",
        f"相应 A 变化 {endpoints['A_100_vs_0_percent']:+.2f}%，V8_ON 变化 {endpoints['V8_ON_100_vs_0_percent']:+.2f}%。",
        "实际命中率来自正式计时之后的独立诊断进程，每点一次完整循环，与该点性能样本使用完全相同的脚本字节。",
        "诊断版时间不参与上述统计。命中率只描述 EVAL_COLD 的目标读取位置，不能当作 A 或 V8 的 IC 命中率。",
        "收益包含当前 EVAL_COLD 的 IC 和融合读取等组合效果，不能单独归因于省掉哈希查找。",
        "循环还包含数组取对象、赋值、累加和循环控制，不能把每次循环时间直接当作 IC 指令延迟。",
        "访问分布随命中率而变，分支预测/局部性也可能贡献差异，尚无因果拆分。",
        "五轮为初步比较，不足以证明细小差异在其他机器和访问分布下也成立。", ""]
    (here / "results.md").write_text("\n".join(lines))
    packed = gzip.compress((here / "runs.jsonl").read_bytes(), mtime=0)
    (here / "raw/runs.jsonl.gz").write_bytes(packed)
    write(here / "audit.json", dict(status="PASS_COMPLETE_OFFLINE", phase_counts=phase_counts,
        no_overlapping_processes=True, all_A_exceed_3_seconds=True,
        all_actual_counts_match_model=True, same_script_bytes_for_all_engines_and_diagnostics=True,
        raw_sha256=sha(here / "runs.jsonl"), compressed_raw_sha256=sha(here / "raw/runs.jsonl.gz"),
        analyzer_sha256=sha(Path(__file__))))

    if args.plot:
        import matplotlib
        matplotlib.use("Agg")
        import matplotlib.pyplot as plt
        x = [p["actual_hit_percent"] for p in summary]
        fig, axes = plt.subplots(1, 2, figsize=(12, 4.6))
        colors = {"A": "#555555", "EVAL_COLD": "#18754b", "V8_ON": "#285ba8"}
        for label in LABELS:
            y = [p[label + "_seconds"] for p in summary]
            lower = [v-indexed[p["requested_hit_percent"], label]["min_ms"]/1000 for p, v in zip(summary, y)]
            upper = [indexed[p["requested_hit_percent"], label]["max_ms"]/1000-v for p, v in zip(summary, y)]
            axes[0].errorbar(x, y, yerr=[lower, upper], marker="o", markersize=4,
                capsize=3, linewidth=1.7, color=colors[label], label=label if label != "V8_ON" else "V8_ON --jitless")
        axes[0].set_ylabel("Timed loop (seconds)")
        axes[0].set_title("Median and full range of 5 runs")
        axes[0].set_ylim(bottom=0)
        for label in ["EVAL_COLD", "V8_ON"]:
            axes[1].plot(x, [p[label + "_change_vs_A_percent"] for p in summary],
                marker="o", markersize=4, linewidth=1.7, color=colors[label], label=label)
        axes[1].axhline(0, color=colors["A"], linewidth=1, linestyle="--")
        axes[1].set_ylabel("Time change vs matched A (%)")
        axes[1].set_title("Below zero = faster than A")
        for ax in axes:
            ax.set_xlabel("Input pattern (EVAL_COLD actual hit rate, %)")
            ax.set_xlim(-2, 102)
            ax.grid(True, alpha=.2)
            ax.legend(frameon=False)
        fig.suptitle("Own-property read: 201,326,592 reads per process", fontsize=13)
        fig.tight_layout()
        fig.savefig(here / "hit_rate_timing.svg")
        fig.savefig(here / "hit_rate_timing.png", dpi=180)
        plt.close(fig)
    print(json.dumps(dict(audit="PASS", endpoints=endpoints), indent=2))


if __name__ == "__main__":
    main()
