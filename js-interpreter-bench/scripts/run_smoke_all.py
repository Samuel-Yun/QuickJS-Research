#!/usr/bin/env python3
"""Run the frozen QuickJS/V8 correctness suite and write raw CSV evidence."""

from __future__ import annotations

import argparse
import csv
import hashlib
import os
from pathlib import Path
import subprocess
import sys


PROJECT_ROOT = Path(__file__).resolve().parent.parent
SMOKE_DIRECTORY = PROJECT_ROOT / "benchmarks" / "smoke"
DEFAULT_OUTPUT = PROJECT_ROOT / "results" / "raw" / "correctness.csv"

# Frozen engine artifacts. Do not discover another binary from PATH.
QUICKJS_BINARY = PROJECT_ROOT / "engines" / "quickjs-upstream" / "qjs.exe"
QUICKJS_SHA256 = "6ef16219978ed1cf7d6590b9c9603c65874ad30ac465c67e5fb819da8786b573"
QUICKJS_RUNTIME_DIRECTORY = Path(r"E:\mingw64\bin")
QUICKJS_RUNTIME_DLL = QUICKJS_RUNTIME_DIRECTORY / "libwinpthread-1.dll"
QUICKJS_RUNTIME_DLL_SHA256 = "c7c7dced65fff71c7bb61f80c771c562f533d26d72722d9d6091129a3b03d5ce"

V8_RUNTIME_DIRECTORY = (
    PROJECT_ROOT / "engines" / "v8-official-15.6.21" / "runtime"
)
V8_BINARY = V8_RUNTIME_DIRECTORY / "d8.exe"
V8_BINARY_SHA256 = "1808fe93e1838ba0a0489363fddb1a0399da99c533f537c39b621e4a55cf7d87"
V8_SNAPSHOT = V8_RUNTIME_DIRECTORY / "snapshot_blob.bin"
V8_SNAPSHOT_SHA256 = "900160d7d689b8e7b0c71c5f164a045b608bf5504329ad6dcba8e526ed6df975"
V8_ICU_DATA = V8_RUNTIME_DIRECTORY / "icudtl.dat"
V8_ICU_DATA_SHA256 = "495c45cc7a65562ec461f860c310c6b66e006acd96833f61d1aa31f77fe18cf1"
V8_FLAGS = ("--max-opt=0",)

TESTS = (
    ("integer_arithmetic", "integer_arithmetic.js", "CHECKSUM:integer_arithmetic:114042"),
    ("floating_point", "floating_point.js", "CHECKSUM:floating_point:12512500"),
    ("loops", "loops.js", "CHECKSUM:loops:133507"),
    ("branches", "branches.js", "CHECKSUM:branches:118045"),
    ("functions", "functions.js", "CHECKSUM:functions:2258"),
    ("recursion", "recursion.js", "CHECKSUM:recursion:3635586"),
    ("arrays", "arrays.js", "CHECKSUM:arrays:33242"),
    (
        "object_property_access",
        "object_property_access.js",
        "CHECKSUM:object_property_access:2917",
    ),
    ("strings", "strings.js", "CHECKSUM:strings:4005789660"),
    ("closure", "closure.js", "CHECKSUM:closure:893"),
    ("exceptions", "exceptions.js", "CHECKSUM:exceptions:2092"),
    ("bit_operations", "bit_operations.js", "CHECKSUM:bit_operations:1920732617"),
)


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as source:
        for chunk in iter(lambda: source.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def require_hash(path: Path, expected: str, label: str) -> None:
    if not path.is_file():
        raise RuntimeError(f"{label} not found: {path}")
    actual = sha256(path)
    if actual != expected:
        raise RuntimeError(
            f"{label} SHA-256 mismatch: expected {expected}, got {actual}"
        )


def normalize_output(data: bytes) -> str:
    return data.decode("utf-8", errors="replace").replace("\r\n", "\n").rstrip("\n")


def run_one(
    engine: str,
    command: list[str],
    test_name: str,
    expected_stdout: str,
    environment: dict[str, str],
    timeout_seconds: float,
) -> dict[str, object]:
    try:
        completed = subprocess.run(
            command,
            cwd=PROJECT_ROOT,
            env=environment,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            check=False,
            timeout=timeout_seconds,
        )
        stdout = normalize_output(completed.stdout)
        stderr = normalize_output(completed.stderr)
        exit_code = completed.returncode
    except subprocess.TimeoutExpired as error:
        stdout = normalize_output(error.stdout or b"")
        captured_stderr = normalize_output(error.stderr or b"")
        timeout_message = f"TIMEOUT after {timeout_seconds:g} seconds"
        stderr = (
            f"{captured_stderr}\n{timeout_message}" if captured_stderr else timeout_message
        )
        exit_code = -1
    except OSError as error:
        stdout = ""
        stderr = f"OSERROR: {error}"
        exit_code = -1

    valid = exit_code == 0 and stdout == expected_stdout and stderr == ""
    return {
        "engine": engine,
        "test": test_name,
        "stdout": stdout,
        "stderr": stderr,
        "exit_code": exit_code,
        "valid": "true" if valid else "false",
    }


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--output",
        type=Path,
        default=DEFAULT_OUTPUT,
        help="new CSV output path; existing raw evidence is never overwritten",
    )
    parser.add_argument(
        "--timeout",
        type=float,
        default=30.0,
        help="per-test timeout in seconds (default: 30)",
    )
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    output_path = args.output.resolve()
    if args.timeout <= 0:
        raise RuntimeError("timeout must be positive")
    if output_path.exists():
        raise RuntimeError(
            f"refusing to overwrite raw evidence: {output_path}; use --output with a new path"
        )

    require_hash(QUICKJS_BINARY, QUICKJS_SHA256, "QuickJS binary")
    require_hash(
        QUICKJS_RUNTIME_DLL,
        QUICKJS_RUNTIME_DLL_SHA256,
        "QuickJS libwinpthread runtime",
    )
    require_hash(V8_BINARY, V8_BINARY_SHA256, "V8 binary")
    require_hash(V8_SNAPSHOT, V8_SNAPSHOT_SHA256, "V8 snapshot")
    require_hash(V8_ICU_DATA, V8_ICU_DATA_SHA256, "V8 ICU data")

    quickjs_environment = os.environ.copy()
    quickjs_environment["PATH"] = os.pathsep.join(
        (str(QUICKJS_RUNTIME_DIRECTORY), quickjs_environment.get("PATH", ""))
    )
    v8_environment = os.environ.copy()

    rows: list[dict[str, object]] = []
    for test_name, filename, expected_stdout in TESTS:
        test_path = SMOKE_DIRECTORY / filename
        if not test_path.is_file():
            raise RuntimeError(f"smoke test not found: {test_path}")

        rows.append(
            run_one(
                "quickjs",
                [str(QUICKJS_BINARY), str(test_path)],
                test_name,
                expected_stdout,
                quickjs_environment,
                args.timeout,
            )
        )
        rows.append(
            run_one(
                "v8_ignition",
                [
                    str(V8_BINARY),
                    f"--snapshot_blob={V8_SNAPSHOT}",
                    *V8_FLAGS,
                    str(test_path),
                ],
                test_name,
                expected_stdout,
                v8_environment,
                args.timeout,
            )
        )

    output_path.parent.mkdir(parents=True, exist_ok=True)
    temporary_path = output_path.with_name(output_path.name + ".tmp")
    try:
        with temporary_path.open("x", encoding="utf-8", newline="") as output_file:
            writer = csv.DictWriter(
                output_file,
                fieldnames=("engine", "test", "stdout", "stderr", "exit_code", "valid"),
            )
            writer.writeheader()
            writer.writerows(rows)
        temporary_path.rename(output_path)
    finally:
        if temporary_path.exists():
            temporary_path.unlink()

    passed = sum(row["valid"] == "true" for row in rows)
    total = len(rows)
    print(f"CORRECTNESS_RESULT: {'PASS' if passed == total else 'FAIL'} {passed}/{total}")
    print(f"CSV: {output_path}")
    return 0 if passed == total else 1


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except RuntimeError as error:
        print(f"ERROR: {error}", file=sys.stderr)
        raise SystemExit(2)
