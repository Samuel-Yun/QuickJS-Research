"""Bounded foreground WSL recorder. Preserves host bytes even if Linux never starts.

Usage (Windows): python host_run.py LABEL --timeout 30 -- WSL_ARGUMENTS...
No WSL restart/configuration change; no old worker/queue execution.
"""
import argparse
import datetime
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import time

HERE = Path(__file__).resolve().parent


def now():
    return datetime.datetime.now(datetime.timezone.utc).isoformat()


def write_new(path, data):
    path.parent.mkdir(parents=True, exist_ok=True)
    if not isinstance(data, bytes):
        data = (json.dumps(data, ensure_ascii=False, indent=2) + "\n").encode("utf-8")
    with path.open("xb") as out:
        out.write(data)
        out.flush()
        os.fsync(out.fileno())


def decode(data):
    # WSL service errors can be UTF-16LE, whereas Linux stdout is UTF-8.
    if data.startswith(b'w\x00s\x00l\x00') and b'\n\x00' in data:
        end=data.index(b'\n\x00')+2
        return dict(encoding='UTF-16LE WSL prefix + UTF-8 child suffix',
                    text=data[:end].decode('utf-16-le',errors='replace')+data[end:].decode('utf-8',errors='replace'))
    encoding = "utf-16-le" if data and data.count(b"\x00") > len(data) // 10 else "utf-8"
    return dict(encoding=encoding, text=data.decode(encoding, errors="replace"))


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("label")
    parser.add_argument("--timeout", type=float, default=30)
    parser.add_argument("--hypothesis", required=True)
    parser.add_argument("--changed-factor", required=True)
    # Separate at -- so flags to wsl.exe are not interpreted here.
    ix = sys.argv.index("--")
    args = parser.parse_args(sys.argv[1:ix])
    command = [shutil.which("wsl.exe") or "wsl.exe"] + sys.argv[ix + 1:]
    dest = HERE / "recovery" / args.label
    dest.mkdir(parents=True, exist_ok=False)
    started = dict(command=command, timestamp=now(), host_pid=os.getpid(),
                   cwd=os.getcwd(), hypothesis=args.hypothesis,
                   changed_factor=args.changed_factor, timeout_s=args.timeout,
                   host_platform=sys.platform,
                   disk={drive: shutil.disk_usage(drive)._asdict()
                         for drive in ["C:/", "F:/"] if Path(drive).exists()})
    write_new(dest / "started.json", started)
    clock = time.perf_counter_ns()
    process = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    timed_out = False
    try:
        stdout, stderr = process.communicate(timeout=args.timeout)
    except subprocess.TimeoutExpired:
        timed_out = True
        # Only this recorder's own wsl client is terminated, not the distro,
        # unrelated processes, or any pre-existing worker.
        process.kill()
        stdout, stderr = process.communicate(timeout=10)
    finished = dict(**started, completed_at=now(), host_child_pid=process.pid,
                    wsl_exit_code=process.returncode,
                    wsl_exit_u32=process.returncode & 0xffffffff,
                    host_terminated_client=timed_out,
                    external_wall_ms=(time.perf_counter_ns() - clock) / 1e6,
                    stdout=decode(stdout), stderr=decode(stderr),
                    stdout_sha256=hashlib.sha256(stdout).hexdigest(),
                    stderr_sha256=hashlib.sha256(stderr).hexdigest(),
                    linux_child_exit_code=None, linux_child_signal=None,
                    linux_boot_before=None, linux_boot_after=None,
                    linux_child_cpu_ms=None, linux_single_process_peak_rss_kib=None,
                    missing_linux_evidence="UNKNOWN unless child JSON is actually produced")
    write_new(dest / "stdout.bin", stdout)
    write_new(dest / "stderr.bin", stderr)
    write_new(dest / "host.json", finished)
    print(json.dumps(finished, ensure_ascii=True, indent=2), flush=True)
    return 0 if process.returncode == 0 and not timed_out else 1


if __name__ == "__main__":
    raise SystemExit(main())
