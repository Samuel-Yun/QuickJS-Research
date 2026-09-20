#!/usr/bin/env python3
"""Validate and benchmark frozen QuickJS/V8 on fixed SunSpider 1.0.2."""

from __future__ import annotations

import argparse
import csv
import hashlib
import os
from pathlib import Path
import random
import statistics
import subprocess
import sys
import time


PROJECT_ROOT = Path(__file__).resolve().parent.parent
SUNSPIDER_ROOT = PROJECT_ROOT / "benchmarks" / "sunspider"
UPSTREAM_DIRECTORY = SUNSPIDER_ROOT / "upstream" / "sunspider-1.0.2"
STANDALONE_DIRECTORY = SUNSPIDER_ROOT / "standalone" / "sunspider-1.0.2"
UPSTREAM_MANIFEST = SUNSPIDER_ROOT / "SHA256SUMS.upstream.txt"
STANDALONE_MANIFEST = SUNSPIDER_ROOT / "SHA256SUMS.standalone.txt"
STANDALONE_PATCH = PROJECT_ROOT / "patches" / "sunspider-1.0.2-standalone.patch"

SOURCE_VERSION = "SunSpider 1.0.2"
SOURCE_COMMIT = "fd3406f133a4e56d7aaf399ba5611ae44b8da7e9"
UPSTREAM_MANIFEST_SHA256 = "bbe7f444daea654cac808800081ecaab7b30a749d72ef6071fe248229c193790"
STANDALONE_MANIFEST_SHA256 = "e383efe54a39e8c18010135390ce2fc98c2618f55bc5078f43fc45c3a8ef98fd"
STANDALONE_PATCH_SHA256 = "82ef95ca6a1c7728d2f6b651eaefba6df6765d2f522ef5d7f49127821a40ccb7"

CORRECTNESS_OUTPUT = PROJECT_ROOT / "results" / "raw" / "sunspider_correctness.csv"
RAW_OUTPUT = PROJECT_ROOT / "results" / "raw" / "sunspider.csv"
SUMMARY_OUTPUT = PROJECT_ROOT / "results" / "processed" / "sunspider_summary.csv"

# Frozen engine artifacts. Never discover or update an engine from PATH.
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
    "3d-cube",
    "3d-morph",
    "3d-raytrace",
    "access-binary-trees",
    "access-fannkuch",
    "access-nbody",
    "access-nsieve",
    "bitops-3bit-bits-in-byte",
    "bitops-bits-in-byte",
    "bitops-bitwise-and",
    "bitops-nsieve-bits",
    "controlflow-recursive",
    "crypto-aes",
    "crypto-md5",
    "crypto-sha1",
    "date-format-tofte",
    "date-format-xparb",
    "math-cordic",
    "math-partial-sums",
    "math-spectral-norm",
    "regexp-dna",
    "string-base64",
    "string-fasta",
    "string-tagcloud",
    "string-unpack-code",
    "string-validate-input",
)
ENGINES = ("quickjs", "v8_ignition")
SCHEDULE_SEED = 20260920


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


def read_manifest(path: Path) -> dict[str, str]:
    entries: dict[str, str] = {}
    for line_number, line in enumerate(path.read_text(encoding="utf-8").splitlines(), 1):
        if not line:
            continue
        try:
            digest, filename = line.split("  ", 1)
        except ValueError as error:
            raise RuntimeError(f"invalid manifest line {path}:{line_number}") from error
        if filename in entries:
            raise RuntimeError(f"duplicate manifest entry: {filename}")
        entries[filename] = digest
    return entries


def verify_directory(directory: Path, manifest: dict[str, str], label: str) -> None:
    actual_names = {path.name for path in directory.iterdir() if path.is_file()}
    expected_names = set(manifest)
    if actual_names != expected_names:
        missing = sorted(expected_names - actual_names)
        extra = sorted(actual_names - expected_names)
        raise RuntimeError(f"{label} file set mismatch: missing={missing}, extra={extra}")
    for filename, expected in manifest.items():
        require_hash(directory / filename, expected, f"{label}/{filename}")


def verify_frozen_inputs() -> None:
    require_hash(QUICKJS_BINARY, QUICKJS_SHA256, "QuickJS binary")
    require_hash(
        QUICKJS_RUNTIME_DLL,
        QUICKJS_RUNTIME_DLL_SHA256,
        "QuickJS libwinpthread runtime",
    )
    require_hash(V8_BINARY, V8_BINARY_SHA256, "V8 binary")
    require_hash(V8_SNAPSHOT, V8_SNAPSHOT_SHA256, "V8 snapshot")
    require_hash(V8_ICU_DATA, V8_ICU_DATA_SHA256, "V8 ICU data")
    require_hash(UPSTREAM_MANIFEST, UPSTREAM_MANIFEST_SHA256, "upstream manifest")
    require_hash(STANDALONE_MANIFEST, STANDALONE_MANIFEST_SHA256, "standalone manifest")
    require_hash(STANDALONE_PATCH, STANDALONE_PATCH_SHA256, "standalone patch")

    upstream_hashes = read_manifest(UPSTREAM_MANIFEST)
    standalone_hashes = read_manifest(STANDALONE_MANIFEST)
    verify_directory(UPSTREAM_DIRECTORY, upstream_hashes, "SunSpider upstream")
    verify_directory(STANDALONE_DIRECTORY, standalone_hashes, "SunSpider standalone")

    list_tests = tuple(
        line.strip()
        for line in (STANDALONE_DIRECTORY / "LIST").read_text(encoding="utf-8").splitlines()
        if line.strip()
    )
    if list_tests != TESTS:
        raise RuntimeError(f"SunSpider LIST mismatch: {list_tests!r}")


def environments() -> dict[str, dict[str, str]]:
    quickjs_environment = os.environ.copy()
    quickjs_environment["PATH"] = os.pathsep.join(
        (str(QUICKJS_RUNTIME_DIRECTORY), quickjs_environment.get("PATH", ""))
    )
    return {
        "quickjs": quickjs_environment,
        "v8_ignition": os.environ.copy(),
    }


def command_for(engine: str, test: str) -> list[str]:
    test_path = STANDALONE_DIRECTORY / f"{test}.js"
    if engine == "quickjs":
        return [str(QUICKJS_BINARY), str(test_path)]
    if engine == "v8_ignition":
        return [
            str(V8_BINARY),
            f"--snapshot_blob={V8_SNAPSHOT}",
            *V8_FLAGS,
            str(test_path),
        ]
    raise RuntimeError(f"unknown engine: {engine}")


def normalize_output(data: bytes) -> str:
    return data.decode("utf-8", errors="replace").replace("\r\n", "\n").rstrip("\n")


def invoke(
    engine: str,
    test: str,
    environment: dict[str, str],
    timeout_seconds: float,
    measure: bool,
) -> tuple[str, str, int, bool, int | None]:
    start = time.perf_counter_ns() if measure else None
    try:
        completed = subprocess.run(
            command_for(engine, test),
            cwd=PROJECT_ROOT,
            env=environment,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            check=False,
            timeout=timeout_seconds,
        )
        exit_code = completed.returncode
        stdout = normalize_output(completed.stdout)
        stderr = normalize_output(completed.stderr)
    except subprocess.TimeoutExpired as error:
        exit_code = -1
        stdout = normalize_output(error.stdout or b"")
        captured_stderr = normalize_output(error.stderr or b"")
        timeout_message = f"TIMEOUT after {timeout_seconds:g} seconds"
        stderr = (
            f"{captured_stderr}\n{timeout_message}" if captured_stderr else timeout_message
        )
    except OSError as error:
        exit_code = -1
        stdout = ""
        stderr = f"OSERROR: {error}"
    end = time.perf_counter_ns() if measure else None
    elapsed = end - start if start is not None and end is not None else None
    valid = exit_code == 0 and stdout == "" and stderr == ""
    return stdout, stderr, exit_code, valid, elapsed


def run_correctness(timeout_seconds: float) -> None:
    if CORRECTNESS_OUTPUT.exists():
        raise RuntimeError(f"refusing to overwrite raw evidence: {CORRECTNESS_OUTPUT}")
    CORRECTNESS_OUTPUT.parent.mkdir(parents=True, exist_ok=True)
    engine_environments = environments()
    rows: list[dict[str, object]] = []
    for test in TESTS:
        for engine in ENGINES:
            stdout, stderr, exit_code, valid, _ = invoke(
                engine,
                test,
                engine_environments[engine],
                timeout_seconds,
                measure=False,
            )
            rows.append(
                {
                    "engine": engine,
                    "test": test,
                    "stdout": stdout,
                    "stderr": stderr,
                    "exit_code": exit_code,
                    "valid": "true" if valid else "false",
                }
            )

    with CORRECTNESS_OUTPUT.open("x", encoding="utf-8", newline="") as output_file:
        writer = csv.DictWriter(
            output_file,
            fieldnames=("engine", "test", "stdout", "stderr", "exit_code", "valid"),
        )
        writer.writeheader()
        writer.writerows(rows)

    passed = sum(row["valid"] == "true" for row in rows)
    total = len(rows)
    print(f"SUNSPIDER_CORRECTNESS: {'PASS' if passed == total else 'FAIL'} {passed}/{total}")
    print(f"CSV: {CORRECTNESS_OUTPUT}")
    if passed != total:
        raise RuntimeError("SunSpider correctness gate failed; benchmark was not run")


def require_correctness_pass() -> None:
    if not CORRECTNESS_OUTPUT.is_file():
        raise RuntimeError("correctness evidence is missing; run the correctness phase first")
    with CORRECTNESS_OUTPUT.open("r", encoding="utf-8", newline="") as source:
        rows = list(csv.DictReader(source))
    expected_pairs = {(engine, test) for engine in ENGINES for test in TESTS}
    actual_pairs = {(row["engine"], row["test"]) for row in rows}
    if len(rows) != len(expected_pairs) or actual_pairs != expected_pairs:
        raise RuntimeError("correctness evidence does not cover every engine/test pair exactly once")
    if any(row["valid"] != "true" for row in rows):
        raise RuntimeError("correctness evidence contains invalid rows")


def tukey_iqr(values: list[int]) -> float:
    ordered = sorted(values)
    midpoint = len(ordered) // 2
    lower = ordered[:midpoint]
    upper = ordered[midpoint:] if len(ordered) % 2 == 0 else ordered[midpoint + 1 :]
    return float(statistics.median(upper) - statistics.median(lower))


def write_summary(rows: list[dict[str, object]], iterations: int) -> None:
    if SUMMARY_OUTPUT.exists():
        raise RuntimeError(f"refusing to overwrite processed output: {SUMMARY_OUTPUT}")
    if any(row["valid"] != "true" for row in rows):
        raise RuntimeError("formal run contains invalid rows; summary was not generated")

    grouped: dict[tuple[str, str], list[int]] = {}
    for row in rows:
        key = (str(row["engine"]), str(row["test"]))
        grouped.setdefault(key, []).append(int(row["wall_time_ns"]))

    summary_rows: list[dict[str, object]] = []
    for test in TESTS:
        quickjs_values = grouped[("quickjs", test)]
        v8_values = grouped[("v8_ignition", test)]
        if len(quickjs_values) != iterations or len(v8_values) != iterations:
            raise RuntimeError(f"sample count mismatch for {test}")

        quickjs_median = float(statistics.median(quickjs_values))
        v8_median = float(statistics.median(v8_values))
        summary_rows.append(
            {
                "test": test,
                "quickjs_n": len(quickjs_values),
                "quickjs_median_ns": f"{quickjs_median:.3f}",
                "quickjs_mean_ns": f"{statistics.mean(quickjs_values):.3f}",
                "quickjs_stddev_ns": f"{statistics.stdev(quickjs_values):.3f}",
                "quickjs_iqr_ns": f"{tukey_iqr(quickjs_values):.3f}",
                "quickjs_min_ns": min(quickjs_values),
                "quickjs_max_ns": max(quickjs_values),
                "v8_n": len(v8_values),
                "v8_median_ns": f"{v8_median:.3f}",
                "v8_mean_ns": f"{statistics.mean(v8_values):.3f}",
                "v8_stddev_ns": f"{statistics.stdev(v8_values):.3f}",
                "v8_iqr_ns": f"{tukey_iqr(v8_values):.3f}",
                "v8_min_ns": min(v8_values),
                "v8_max_ns": max(v8_values),
                "v8_over_quickjs_ratio": f"{v8_median / quickjs_median:.9f}",
            }
        )

    SUMMARY_OUTPUT.parent.mkdir(parents=True, exist_ok=True)
    with SUMMARY_OUTPUT.open("x", encoding="utf-8", newline="") as output_file:
        writer = csv.DictWriter(output_file, fieldnames=tuple(summary_rows[0]))
        writer.writeheader()
        writer.writerows(summary_rows)


def run_benchmark(iterations: int, timeout_seconds: float) -> None:
    if iterations < 30:
        raise RuntimeError("formal SunSpider requires at least 30 iterations per engine/test")
    require_correctness_pass()
    if RAW_OUTPUT.exists():
        raise RuntimeError(f"refusing to overwrite raw evidence: {RAW_OUTPUT}")
    if SUMMARY_OUTPUT.exists():
        raise RuntimeError(f"refusing to overwrite processed output: {SUMMARY_OUTPUT}")

    RAW_OUTPUT.parent.mkdir(parents=True, exist_ok=True)
    engine_environments = environments()
    rng = random.Random(SCHEDULE_SEED)
    rows: list[dict[str, object]] = []

    with RAW_OUTPUT.open("x", encoding="utf-8", newline="") as output_file:
        writer = csv.DictWriter(
            output_file,
            fieldnames=("engine", "test", "iteration", "wall_time_ns", "exit_code", "valid"),
        )
        writer.writeheader()

        for iteration in range(1, iterations + 1):
            test_order = list(TESTS)
            rng.shuffle(test_order)
            for test in test_order:
                test_index = TESTS.index(test)
                engine_order = (
                    ENGINES if (iteration + test_index) % 2 else tuple(reversed(ENGINES))
                )
                for engine in engine_order:
                    _, _, exit_code, valid, elapsed = invoke(
                        engine,
                        test,
                        engine_environments[engine],
                        timeout_seconds,
                        measure=True,
                    )
                    if elapsed is None:
                        raise RuntimeError("internal timing error")
                    row: dict[str, object] = {
                        "engine": engine,
                        "test": test,
                        "iteration": iteration,
                        "wall_time_ns": elapsed,
                        "exit_code": exit_code,
                        "valid": "true" if valid else "false",
                    }
                    writer.writerow(row)
                    rows.append(row)
                output_file.flush()
            print(f"completed iteration {iteration}/{iterations}", flush=True)

    write_summary(rows, iterations)
    valid_count = sum(row["valid"] == "true" for row in rows)
    print(f"SUNSPIDER_FORMAL: {'PASS' if valid_count == len(rows) else 'FAIL'} {valid_count}/{len(rows)}")
    print(f"RAW: {RAW_OUTPUT}")
    print(f"SUMMARY: {SUMMARY_OUTPUT}")
    if valid_count != len(rows):
        raise RuntimeError("formal run contains invalid rows")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("phase", choices=("correctness", "benchmark"))
    parser.add_argument("--iterations", type=int, default=30)
    parser.add_argument("--timeout", type=float, default=120.0)
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    if args.timeout <= 0:
        raise RuntimeError("timeout must be positive")
    verify_frozen_inputs()
    print(f"SOURCE: {SOURCE_VERSION} @ {SOURCE_COMMIT}")
    print(f"V8_FLAGS: {' '.join(V8_FLAGS)}")
    if args.phase == "correctness":
        run_correctness(args.timeout)
    else:
        run_benchmark(args.iterations, args.timeout)
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except RuntimeError as error:
        print(f"ERROR: {error}", file=sys.stderr)
        raise SystemExit(2)
