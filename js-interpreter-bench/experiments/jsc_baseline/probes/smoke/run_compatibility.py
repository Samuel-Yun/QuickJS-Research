"""One-shot JSC correctness compatibility smoke; never a performance runner."""

import csv
import json
import subprocess
from pathlib import Path

JSC_BINARY = Path("/home/mzyx/jsc_build_fd3406f/JSCOnly/Release/bin/jsc")
ROOT = Path(__file__).resolve().parents[4]
EXPERIMENT = ROOT / "experiments" / "jsc_baseline"
RAW = EXPERIMENT / "probes" / "smoke" / "compatibility_raw"
ADAPTER = EXPERIMENT / "probes" / "smoke" / "shell_adapter.js"
OCTANE_ADAPTER = EXPERIMENT / "probes" / "smoke" / "octane_correctness_adapter.js"

CASES = [
    ("SunSpider", "bitops-bitwise-and", ROOT / "experiments/interpreter_mode_execution/generated/bitops-bitwise-and-n1.js", ADAPTER, "IM_EXEC:"),
    ("SunSpider", "controlflow-recursive", ROOT / "experiments/interpreter_mode_execution/generated/controlflow-recursive-n1.js", ADAPTER, "IM_EXEC:"),
    ("SunSpider", "regexp-dna", ROOT / "experiments/interpreter_mode_execution/generated/regexp-dna-n1.js", ADAPTER, "IM_EXEC:"),
    ("SunSpider", "string-unpack-code", ROOT / "experiments/interpreter_mode_execution/generated/string-unpack-code-n1.js", ADAPTER, "IM_EXEC:"),
    ("Octane", "Richards", ROOT / "experiments/octane_strict/generated/Richards.Richards.js", OCTANE_ADAPTER, "OCTANE_STRICT_RESULT:"),
    ("Octane", "NavierStokes", ROOT / "experiments/octane_strict/generated/NavierStokes.NavierStokes.js", OCTANE_ADAPTER, "OCTANE_STRICT_RESULT:"),
    ("Octane", "RegExp", ROOT / "experiments/octane_strict/generated/RegExp.RegExp.js", OCTANE_ADAPTER, "OCTANE_STRICT_RESULT:"),
    ("Octane", "CodeLoadClosure", ROOT / "experiments/octane_strict/generated/CodeLoad.CodeLoadClosure.js", OCTANE_ADAPTER, "OCTANE_STRICT_RESULT:"),
]


def main() -> None:
    RAW.mkdir(parents=True, exist_ok=True)
    rows = []
    for benchmark, case, workload, adapter, prefix in CASES:
        tag = f"{benchmark.lower()}_{case}"
        stdout_path = RAW / f"{tag}.stdout.txt"
        stderr_path = RAW / f"{tag}.stderr.txt"
        try:
            result = subprocess.run(
                [str(JSC_BINARY), "--useJIT=false", "--validateOptions=true", str(adapter), str(workload)],
                capture_output=True,
                text=True,
                timeout=90,
                check=False,
            )
            stdout, stderr = result.stdout, result.stderr
            exit_code = result.returncode
            evidence = [line[len(prefix):] for line in stdout.splitlines() if line.startswith(prefix)]
            validation = "NO_RESULT"
            issue = ""
            status = "FAIL"
            if exit_code == 0 and len(evidence) == 1:
                try:
                    payload = json.loads(evidence[0])
                    if benchmark == "SunSpider":
                        valid = payload.get("test") == case and "checksum" in payload
                    else:
                        suite = "CodeLoad" if case == "CodeLoadClosure" else case
                        valid = (payload.get("suite") == suite and payload.get("mode") == "correctness"
                                 and payload.get("correctness") == "PASS")
                    validation = "PASS" if valid else "RESULT_MISMATCH"
                    status = "PASS" if valid else "FAIL"
                except json.JSONDecodeError as exc:
                    validation = "INVALID_JSON"
                    issue = str(exc)
            else:
                issue = "nonzero exit or missing/duplicate result marker"
            if status != "PASS" and not issue:
                issue = validation
        except subprocess.TimeoutExpired as exc:
            stdout = exc.stdout.decode(errors="replace") if isinstance(exc.stdout, bytes) else (exc.stdout or "")
            stderr = exc.stderr.decode(errors="replace") if isinstance(exc.stderr, bytes) else (exc.stderr or "")
            exit_code = "TIMEOUT"
            status = "TIMEOUT"
            validation = "TIMEOUT"
            issue = "90 s correctness-smoke timeout"
        stdout_path.write_text(stdout, encoding="utf-8")
        stderr_path.write_text(stderr, encoding="utf-8")
        rows.append({
            "benchmark": benchmark,
            "case": case,
            "JSC status": status,
            "validation": validation,
            "issue": issue,
            "potential fix": "UNKNOWN" if status != "PASS" else "none",
            "exit_code": exit_code,
            "stdout_path": str(stdout_path.relative_to(EXPERIMENT)),
            "stderr_path": str(stderr_path.relative_to(EXPERIMENT)),
        })
        print(f"{benchmark}/{case}: {status} ({validation})", flush=True)

    with (EXPERIMENT / "compatibility_smoke.csv").open("w", newline="", encoding="utf-8") as file:
        writer = csv.DictWriter(file, fieldnames=list(rows[0]))
        writer.writeheader()
        writer.writerows(rows)


if __name__ == "__main__":
    main()
