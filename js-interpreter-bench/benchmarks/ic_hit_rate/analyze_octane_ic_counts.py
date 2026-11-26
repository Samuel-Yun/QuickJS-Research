"""Audit single-process Octane named-read diagnostics; never uses their times."""
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
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("directory", type=Path)
    args = parser.parse_args()
    out = args.directory.resolve()
    protocol = json.loads((out / "protocol.json").read_text())
    completed = json.loads((out / "completion.json").read_text())
    assert completed["status"] == "PASS_COMPLETE" and completed["diagnostic_processes"] == 34
    assert sha(out / "protocol.json") == json.loads((out / "frozen.json").read_text())["protocol_sha256"]
    assert sha(out / "runs.jsonl") == completed["raw_sha256"]
    for name,digest in protocol["frozen_files"].items(): assert sha(Path(name))==digest
    records = [json.loads(s) for s in (out / "runs.jsonl").read_text().splitlines()]
    assert len(records)==34 and all(r["status"]=="PASS" and r["returncode"]==0 for r in records)
    assert all(records[i]["stopped_ns"] <= records[i+1]["started_ns"] for i in range(33))
    grouped = {(r["case"],r["label"]):r for r in records}
    assert len(grouped)==34
    old = out.parents[1] / "native_confirmation_20261108/attempt02/per_case_comparisons.csv"
    with old.open() as stream:
        old_times = {r["case"]:float(r["change_pct"]) for r in csv.DictReader(stream)
                     if r["kind"]=="octane" and r["condition"]=="EVAL_COLD" and r["denominator"]=="A"}
    rows=[]
    unequal=[]
    for case in protocol["scripts"]:
        e,v = grouped[case,"EVAL_COLD"],grouped[case,"V8_ON"]
        for record in [e,v]:
            info = protocol["scripts"][case][record["label"]]
            assert record["N"] == info["N"]
            assert sha(Path(info["original_script"])) == info["original_sha256"]
            assert record["queries"] == record["hits"]+record["misses"]+record["no_feedback"]
            assert 0 <= record["hits"] <= record["queries"]
        assert v["raw_counts"]["bad_frame"]==0
        if e["queries"]!=v["queries"]: unequal.append(case)
        formed=v["queries"]-v["no_feedback"]
        row=dict(case=case,N=e["N"],EVAL_queries=e["queries"],EVAL_hits=e["hits"],EVAL_misses=e["misses"],
            EVAL_hit_percent=100*e["hits"]/e["queries"],
            EVAL_fused_hits=e["raw_counts"]["fused_hits"],EVAL_proto_hits=e["raw_counts"]["proto_hits"],
            V8_queries=v["queries"],V8_hits=v["hits"],V8_IC_misses=v["misses"],V8_no_feedback=v["no_feedback"],
            V8_hit_percent=100*v["hits"]/v["queries"],
            V8_hit_percent_given_feedback=100*v["hits"]/formed if formed else None,
            V8_no_feedback_percent=100*v["no_feedback"]/v["queries"],
            V8_length_queries_excluded=v["raw_counts"]["length_queries"],
            V8_generic_runtime_calls=v["generic_runtime_calls"],
            original_30round_EVAL_time_change_vs_A_percent=old_times[case])
        rows.append(row)
    with (out / "comparison.csv").open("w",newline="") as stream:
        w=csv.DictWriter(stream,fieldnames=list(rows[0]));w.writeheader();w.writerows(rows)
    totals={}
    for label in ["EVAL_COLD","V8_ON"]:
        selected=[r for r in records if r["label"]==label]
        q=sum(r["queries"] for r in selected);h=sum(r["hits"] for r in selected)
        m=sum(r["misses"] for r in selected);nf=sum(r["no_feedback"] for r in selected)
        totals[label]=dict(queries=q,hits=h,misses=m,no_feedback=nf,hit_percent=100*h/q,
                          hit_percent_given_feedback=100*h/(q-nf))
    (out / "summary.json").write_text(json.dumps(dict(rows=rows,weighted_totals=totals,
        unequal_query_count_cases=unequal),indent=2)+"\n")
    lines=["# Octane：EVAL_COLD 与 V8_ON --jitless 命中率（单轮诊断）", "",
        "17 表项 × 2 引擎，各 1 个诊断进程。每进程沿用原 30 轮计时的 Run 次数 N，",
        "而非只执行一次内部 Run；无工作负载预热，只统计原计时区间内的 Run 循环。",
        "Setup、脚本加载和事后验证不计入。原计时结果保持不变，本轮诊断时间不参与性能比较。", "",
        "统一范围：显式命名属性读取，排除 length、数组下标、全局变量读取与属性写入。",
        "EVAL 含融合读取和直接原型命中；V8 含单态/多态/其他缓存 handler 复用。",
        "缓存命中不等同于每次都只做 field offset 读取，V8 的 getter、字典属性等处理方式可能不同。", "",
        "主口径：命中 / 全部上述读取；V8 尚无反馈的读取不算命中。",
        "辅助口径：V8 命中 /（全部读取 − 无反馈读取），仅用于解释反馈建立后的行为，不与 EVAL 主口径混用。", "",
        "| Octane 表项 | EVAL_COLD 命中率 | V8 全部读取命中占比 | V8 已有反馈时命中率 |",
        "|---|---:|---:|---:|"]
    for r in rows:
        lines.append(f"| {r['case']} | {r['EVAL_hit_percent']:.4f}% | {r['V8_hit_percent']:.4f}% | {r['V8_hit_percent_given_feedback']:.4f}% |")
    lines += ["", "## 原始次数与反馈", "",
        "| 表项 | N | EVAL 读取数 | V8 读取数 | V8 无反馈读取数 | V8 IC miss |",
        "|---|---:|---:|---:|---:|---:|"]
    for r in rows:
        lines.append(f"| {r['case']} | {r['N']} | {r['EVAL_queries']:,} | {r['V8_queries']:,} | {r['V8_no_feedback']:,} | {r['V8_IC_misses']:,} |")
    lines += ["", "## 读取次数加权汇总", "",
        "仅按本批各表项原 N 产生的实际读取次数加权；不是 Octane 耗时的几何平均，也不是对命中率做算术平均。", ""]
    for label,t in totals.items():
        lines.append(f"- {label}: {t['hits']:,} / {t['queries']:,} = {t['hit_percent']:.6f}%。")
    lines += ["", "## 身份与局限", "",
        "EVAL 使用独立计数构建，正式 Release 源码/ELF未改；统计所有已准备的非 length 命名读取。",
        "V8 仍为相同 SHA 的原 ELF，通过单独 LD_PRELOAD 库为当前进程设置本地计数跳板，磁盘 ELF 不变；",
        "保留寄存器/标志，使用 Run 开始/结束标记。不开启 log-ic、RCS、强制反馈分配等改变缓存初始化的诊断选项。",
        "计数器先通过已知次数的原生 GDB 对照、length、宽/超宽指令、嵌套 getter、异常和原型读取校验。",
        "15/17 表项的两引擎读取总数完全一致；PdfJS 差 15,472 次（约 0.058%），zlib 差 1 次，",
        "暂未逐位点定位差异，保留各引擎的实际分母，不强行改齐。不同引擎的分支/适配/指令行为仍可能不同。",
        "缓存命中率并不等于该操作占总时间的比例，不能由本表直接推导可取得的时间收益。",
        "本轮仅一次诊断，无跨进程波动估计；工具插桩和新增标记可能影响分配/GC时机。", ""]
    (out / "results.md").write_text("\n".join(lines))
    (out / "raw/runs.jsonl.gz").write_bytes(gzip.compress((out / "runs.jsonl").read_bytes(),mtime=0))
    audit=dict(status="PASS_COMPLETE_OFFLINE",diagnostic_processes=34,cases=17,
        serial_no_overlap=True,all_payloads_PASS=True,queries_equal_hit_plus_miss_plus_no_feedback=True,
        all_V8_frame_filters_valid=True,unequal_query_count_cases=unequal,
        formal_timing_samples_added=0,raw_sha256=sha(out / "runs.jsonl"),analyzer_sha256=sha(Path(__file__)))
    (out / "audit.json").write_text(json.dumps(audit,indent=2)+"\n")
    print(json.dumps(dict(weighted_totals=totals,audit=audit),indent=2))


if __name__=="__main__":main()
