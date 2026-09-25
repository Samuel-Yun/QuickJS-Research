#!/usr/bin/env python3
"""Pin official Octane 2.0 and generate identical single-suite JS for both shells."""

from __future__ import annotations

import hashlib
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parents[2]
HERE = Path(__file__).resolve().parent
UPSTREAM = ROOT / "benchmarks/octane/upstream"
COMMIT = "570ad1ccfe86e3eecba0636c8f932ac08edec517"

# File order follows upstream run.js. A suite may require several source files.
CASES = {
    "Richards": ("richards.js",),
    "DeltaBlue": ("deltablue.js",),
    "Crypto": ("crypto.js",),
    "RayTrace": ("raytrace.js",),
    "EarleyBoyer": ("earley-boyer.js",),
    "RegExp": ("regexp.js",),
    "Splay": ("splay.js",),
    "NavierStokes": ("navier-stokes.js",),
    "PdfJS": ("pdfjs.js",),
    "Mandreel": ("mandreel.js",),
    "Gameboy": ("gbemu-part1.js", "gbemu-part2.js"),
    "CodeLoad": ("code-load.js",),
    "Box2D": ("box2d.js",),
    "zlib": ("zlib.js", "zlib-data.js"),
    "Typescript": ("typescript.js", "typescript-input.js", "typescript-compiler.js"),
}


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def git(*args: str) -> str:
    result = subprocess.run(
        ["git", "-c", f"safe.directory={UPSTREAM.as_posix()}", "-C", str(UPSTREAM), *args],
        capture_output=True, check=True,
    )
    return result.stdout.decode("utf-8").strip()


def verify_upstream() -> list[str]:
    if git("rev-parse", "HEAD") != COMMIT:
        raise RuntimeError("Octane commit differs from frozen commit")
    if git("status", "--porcelain"):
        raise RuntimeError("Octane upstream worktree is dirty")
    tracked = git("ls-files").splitlines()
    if "base.js" not in tracked or "run.js" not in tracked:
        raise RuntimeError("incomplete Octane checkout")
    return tracked


def manifest() -> Path:
    tracked = verify_upstream()
    lines = [f"{sha256((UPSTREAM / name).read_bytes())}  {name}" for name in tracked]
    output = HERE / "upstream_sha256.txt"
    content = "\n".join(lines) + "\n"
    if output.exists():
        if output.read_text(encoding="utf-8") != content:
            raise RuntimeError("Octane SHA-256 manifest differs")
    else:
        with output.open("x", encoding="utf-8", newline="\n") as f:
            f.write(content)
    return output


def script_for(case: str) -> Path:
    if case not in CASES:
        raise ValueError(case)
    verify_upstream()
    sources = ("base.js", *CASES[case])
    # Concatenation is only a transport adaptation: no original source is edited.
    body = b"\n;\n".join((UPSTREAM / name).read_bytes() for name in sources)
    driver = f"""
;(function() {{
  if (BenchmarkSuite.suites.length !== 1 || BenchmarkSuite.suites[0].name !== {case!r})
    throw new Error('Octane suite registration mismatch');
  var resultNames = [];
  var scoreSeen = false;
  BenchmarkSuite.RunSuites({{
    NotifyResult: function(name, score) {{
      if (score === 'Skipped' || !isFinite(Number(score)) || Number(score) <= 0)
        throw new Error('Invalid Octane result: ' + name + ': ' + score);
      resultNames.push(name);
    }},
    NotifyError: function(name, error) {{
      throw new Error('Octane self-check failed: ' + name + ': ' + error);
    }},
    NotifyScore: function(score) {{
      if (!isFinite(Number(score)) || Number(score) <= 0)
        throw new Error('Invalid Octane score: ' + score);
      scoreSeen = true;
    }}
  }});
  if (!scoreSeen || resultNames.length < 1)
    throw new Error('Octane suite did not complete');
  console.log('OCTANE_PASS:{case}:results=' + resultNames.join('|'));
}})();
""".encode("ascii")
    output = HERE / "generated" / f"{case}.js"
    output.parent.mkdir(parents=True, exist_ok=True)
    content = body + b"\n" + driver
    if output.exists():
        if output.read_bytes() != content:
            raise RuntimeError(f"generated case differs: {output}")
    else:
        with output.open("xb") as f:
            f.write(content)
    return output


def _write_generated(name: str, content: bytes) -> Path:
    output = HERE / "generated" / name
    output.parent.mkdir(parents=True, exist_ok=True)
    if output.exists():
        if output.read_bytes() != content:
            raise RuntimeError(f"generated script differs: {output}")
    else:
        with output.open("xb") as f:
            f.write(content)
    return output


def native_timing_script(case: str) -> Path:
    """Original Octane harness time: microseconds per benchmark.run call."""
    original = script_for(case).read_bytes()
    driver = f"""
;(function() {{
  var suite = BenchmarkSuite.suites[0];
  if (suite.results.length !== suite.benchmarks.length)
    throw new Error('incomplete Octane timing results');
  var parts = [];
  for (var i = 0; i < suite.results.length; i++) {{
    var result = suite.results[i];
    if (!(result.time > 0) || !isFinite(result.time))
      throw new Error('invalid Octane timing');
    parts.push(result.benchmark.name + '=' + result.time);
  }}
  console.log('OCTANE_TIME:{case}:' + parts.join('|'));
}})();
""".encode("ascii")
    return _write_generated(f"{case}.native_timing.js", original + driver)


def fixed_work_script(case: str, multiplier: int) -> Path:
    """Same original suite workload and checks, with fixed calls per benchmark."""
    if case not in CASES or not 1 <= multiplier <= 512:
        raise ValueError((case, multiplier))
    verify_upstream()
    body = b"\n;\n".join((UPSTREAM / name).read_bytes()
                           for name in ("base.js", *CASES[case]))
    driver = f"""
;(function() {{
  if (BenchmarkSuite.suites.length !== 1 || BenchmarkSuite.suites[0].name !== {case!r})
    throw new Error('Octane suite registration mismatch');
  BenchmarkSuite.ResetRNG();
  var tests = BenchmarkSuite.suites[0].benchmarks;
  var parts = [];
  for (var j = 0; j < tests.length; j++) {{
    var test = tests[j];
    var count = test.minIterations * {multiplier};
    test.Setup();
    for (var i = 0; i < count; i++) test.run();
    test.TearDown();
    parts.push(test.name + '=' + count);
  }}
  console.log('OCTANE_PASS:{case}:results=' + parts.join('|'));
}})();
""".encode("ascii")
    return _write_generated(f"{case}.fixed_x{multiplier}.js", body + b"\n" + driver)


def main() -> None:
    path = manifest()
    for case in CASES:
        script_for(case)
    print(f"Octane 2.0 commit {COMMIT}; {len(CASES)} suites; manifest {sha256(path.read_bytes())}")


if __name__ == "__main__":
    main()
