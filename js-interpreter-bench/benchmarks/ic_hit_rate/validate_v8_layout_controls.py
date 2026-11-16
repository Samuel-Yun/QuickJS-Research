"""Validate sustainable low-hit input and repeat-count controls for V8."""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess
import sys

HERE = Path(__file__).resolve().parent


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()
    out = args.output.resolve()
    out.mkdir(parents=True, exist_ok=False)
    cases = [
        dict(name="one_shape", shapes=1, run=1, n=4096),
        dict(name="two_shapes", shapes=2, run=1, n=4096),
        dict(name="sixteen_shapes", shapes=16, run=1, n=4096),
        dict(name="large_pool_cycle", shapes=65536, run=1, n=65536),
        dict(name="repeat2", shapes=65536, run=2, n=4096),
        dict(name="repeat4", shapes=65536, run=4, n=4096),
        dict(name="repeat16", shapes=65536, run=16, n=4096),
    ]
    tools = [HERE / name for name in ["own_read_layouts.js", "probe_v8_layouts.py",
                                      "v8_gdb_driver.py", "validate_v8_layout_controls.py"]]
    frozen = {str(path): sha(path) for path in tools}
    (out / "protocol.json").write_text(json.dumps(dict(
        purpose="input control validation only, not formal performance comparison", cases=cases,
        sequence_length=1048576, warmup_iterations=2097152,
        construction="ordinary Object.create(unique ordinary prototype), two own data fields; alternate x insertion position",
        frozen_tools=frozen), indent=2) + "\n")
    (out / "inputs").mkdir()
    for path in tools:
        (out / "inputs" / path.name).write_bytes(path.read_bytes())
    results = []
    for case in cases:
        cmd = [sys.executable, "-B", str(HERE / "probe_v8_layouts.py"), "--output", str(out / case["name"]),
            "--shapes", str(case["shapes"]), "--run-length", str(case["run"]),
            "--iterations", str(case["n"])]
        if case["n"] == 4096:
            cmd.append("--gate-total")
        process = subprocess.run(cmd, capture_output=True, text=True, timeout=320)
        (out / (case["name"] + ".stdout")).write_text(process.stdout)
        (out / (case["name"] + ".stderr")).write_text(process.stderr)
        assert process.returncode == 0, (case, process.stderr[-3000:])
        result = json.loads((out / case["name"] / "results.json").read_text())
        assert result["status"] == "PASS"
        result["case"] = case["name"]
        results.append(result)
        print(case["name"], f"hit={result['actual_hit_percent']:.6f}%", result["counts"], flush=True)
    for name, digest in frozen.items():
        assert sha(Path(name)) == digest
    by_name = {row["case"]: row for row in results}
    assert by_name["large_pool_cycle"]["actual_hit_percent"] < 1
    for name in ["one_shape", "two_shapes", "sixteen_shapes"]:
        assert by_name[name]["actual_hit_percent"] > 99
    assert 49 <= by_name["repeat2"]["actual_hit_percent"] <= 52
    assert 74 <= by_name["repeat4"]["actual_hit_percent"] <= 77
    assert 93 <= by_name["repeat16"]["actual_hit_percent"] <= 95
    (out / "results.json").write_text(json.dumps(dict(status="PASS", results=results), indent=2) + "\n")
    lines = ["# V8 低命中输入及重复次数控制", "",
        "原 V8_ON --jitless --no-lazy --use-ic，保持所有缓存开启。原生断点计数，仅供机制诊断。",
        "对象/原型和序列全部预先创建，每个对象只有 x 与 pad 两个普通自身数据属性；",
        "独立原型区分 Map，交替改变 x 的字段位置。所有对象经 V8 验证仍为 fast properties。",
        "同一个读取位置预热 2,097,152 次，再统计后续访问，排除仅首次见到形状的解释。", "",
        "| 形状数 | 每形状连续读取次数 | 本次统计读取数 | IC miss | 无反馈 | 实测命中率 |",
        "|---:|---:|---:|---:|---:|---:|"]
    for r in results:
        s,c = r["settings"],r["counts"]
        lines.append(f"| {s['shapes']:,} | {s['run_length']} | {s['iterations']:,} | {c['ic_miss']:,} | {c['no_feedback']} | {r['actual_hit_percent']:.6f}% |")
    lines += ["", "大池 run=1 验证覆盖预热后一个完整的 65,536 形状周期，命中率低于 1%。",
        "其他调节设置是 4,096 次诊断窗口，不冒充原先 201,326,592 次完整计数。",
        "命中率由 N−IC miss−无反馈次数补出；通用/嵌套回退均为零。",
        "短窗口额外直接数命名属性读取入口，全部恰好等于 N。",
        "本轮未做三引擎五轮计时；不同形状数/原型/工作集的输入不能直接与旧表时间拼接。",
        "形状数、连续重复次数是输入参数，实测比例仍受缓存布局、分支分布和分配结果影响，不能保证任意机器/版本精确命中指定百分比。", ""]
    (out / "summary.md").write_text("\n".join(lines))
    print("V8_LAYOUT_CONTROLS_PASS", flush=True)


if __name__ == "__main__":
    main()
