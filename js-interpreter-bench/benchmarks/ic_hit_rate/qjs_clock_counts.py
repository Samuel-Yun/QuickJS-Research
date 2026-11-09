"""GDB Python: reset existing EVAL_COLD diagnostic counters at first JS clock."""
import gdb
import json
import os
from pathlib import Path

config = json.loads(Path(os.environ["QJS_CLOCK_COUNT_CONFIG"]).read_text())
names = ["queries", "hits", "misses", "fused_hits", "regular_hits", "regular_queries", "cold_misses", "fills"]
result = {"clock_calls": 0, "status": "STARTED"}


def read_counts():
    return {name: int(gdb.parse_and_eval("'quickjs.c'::micro_ic_" + name)) for name in names}


class Clock(gdb.Breakpoint):
    def stop(self):
        try:
            result["clock_calls"] += 1
            if result["clock_calls"] == 1:
                result["before_reset"] = read_counts()
                for name in names:
                    gdb.execute("set variable 'quickjs.c'::micro_ic_" + name + " = 0", to_string=True)
            elif result["clock_calls"] == 2:
                result["measured"] = read_counts()
                self.enabled = False
        except Exception as exc:
            result.update(status="FAIL", error=str(exc))
            return True
        return False


gdb.execute("set pagination off")
gdb.execute("set confirm off")
gdb.execute("set debuginfod enabled off")
gdb.execute("set disable-randomization off")
point = Clock("js_os_now", internal=True)
assert not point.pending and len(point.locations) == 1
gdb.execute("run")
if result["status"] != "FAIL":
    try:
        assert gdb.selected_inferior().pid == 0
        assert result["clock_calls"] == 2
        assert result["before_reset"]["queries"] == config["warmup_N"]
        c = result["measured"]
        assert c["queries"] == c["hits"] + c["misses"] == config["N"]
        result["status"] = "PASS"
    except Exception as exc:
        result.update(status="FAIL", error=str(exc))
Path(config["output"]).write_text(json.dumps(result, indent=2) + "\n")
