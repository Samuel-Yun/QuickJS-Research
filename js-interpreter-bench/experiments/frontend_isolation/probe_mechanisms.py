#!/usr/bin/env python3
"""Capture help and small capability probes; no performance measurement."""

import hashlib
from pathlib import Path
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "scripts"))
import run_sunspider as baseline  # noqa: E402

OUT = Path(__file__).resolve().parent / "raw" / "mechanism"
PROBE = Path(__file__).resolve().parent / "correctness" / "qjsc_probe.js"


def capture(name: str, args: list[str]) -> None:
    completed = subprocess.run(args, cwd=ROOT, capture_output=True, check=False,
                               env=baseline.environments()["quickjs"])
    content = (f"COMMAND: {' '.join(args)}\nEXIT_CODE: {completed.returncode}\n"
               f"STDOUT:\n{baseline.normalize_output(completed.stdout)}\n"
               f"STDERR:\n{baseline.normalize_output(completed.stderr)}\n")
    with (OUT / name).open("x", encoding="utf-8", newline="\n") as f:
        f.write(content)


def main() -> None:
    baseline.verify_frozen_inputs()
    qjsc = ROOT / "engines/quickjs-upstream/qjsc.exe"
    expected = "db80b47e8383afd76b95bea2f76354591c9b5667c16b4fec73632eacf6445092"
    if hashlib.sha256(qjsc.read_bytes()).hexdigest() != expected:
        raise RuntimeError("qjsc hash mismatch")
    OUT.mkdir(parents=True, exist_ok=True)
    capture("quickjs_qjs_help.txt", [str(baseline.QUICKJS_BINARY), "--help"])
    capture("quickjs_qjsc_help.txt", [str(qjsc), "--help"])
    v8 = [str(baseline.V8_BINARY), f"--snapshot_blob={baseline.V8_SNAPSHOT}"]
    capture("v8_help.txt", v8 + ["--help"])
    capture("v8_cache_smoke.txt", v8 + ["--max-opt=0", "--cache=code", str(PROBE)])
    capture("quickjs_source_smoke.txt", [str(baseline.QUICKJS_BINARY), str(PROBE)])
    compiled = Path(__file__).resolve().parent / "generated/qjsc_probe.exe"
    if compiled.is_file():
        capture("quickjs_precompiled_smoke.txt", [str(compiled)])
    print(f"Captured mechanism evidence in {OUT}")


if __name__ == "__main__":
    main()
