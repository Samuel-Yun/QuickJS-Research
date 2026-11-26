"""GDB Python driver: count exceptional named-load paths between SystemBreaks."""
import json
import os
from pathlib import Path
import gdb

config = json.loads(Path(os.environ["IC_V8_GDB_CONFIG"]).read_text())
counts = {"ic_miss": 0, "no_feedback": 0, "no_feedback_runtime_fallback": 0,
          "named_load_entries": 0, "generic_runtime_fallback": 0, "noninlined_builtin": 0}
first_stacks = {}
stops = []
cap_reached = False


def stopped(event):
    stops.append(getattr(event, "stop_signal", type(event).__name__))


gdb.events.stop.connect(stopped)
gdb.execute("set pagination off")
gdb.execute("set confirm off")
gdb.execute("set debuginfod enabled off")
gdb.execute("set disable-randomization off")
gdb.execute("set print thread-events off")
gdb.execute("handle SIGTRAP stop nopass")


class Counter(gdb.Breakpoint):
    def __init__(self, spec, key):
        super().__init__(spec, internal=True)
        self.key = key

    def stop(self):
        global cap_reached
        counts[self.key] += 1
        if self.key not in first_stacks:
            first_stacks[self.key] = gdb.execute("bt 6", to_string=True)
        if counts[self.key] >= config["counter_cap"]:
            cap_reached = True
            return True
        return False


result = {"status": "STARTED", "config": config}
try:
    gdb.execute("run")
    assert len(stops) == 1, stops
    first_marker_stack = gdb.execute("bt 5", to_string=True)
    assert "SystemBreak" in first_marker_stack, first_marker_stack
    breakpoints = [
        Counter("v8::internal::Runtime_LoadIC_Miss", "ic_miss"),
        Counter("Builtins_LoadIC_NoFeedback", "no_feedback"),
        Counter("v8::internal::Runtime_LoadNoFeedbackIC_Miss", "no_feedback_runtime_fallback"),
        Counter("v8::internal::Runtime_GetProperty", "generic_runtime_fallback"),
        Counter("Builtins_LoadIC_Noninlined", "noninlined_builtin"),
    ]
    if config["gate_total"]:
        breakpoints.append(Counter("Builtins_GetNamedPropertyHandler", "named_load_entries"))
    assert all(not point.pending and len(point.locations) == 1 for point in breakpoints), "unresolved or ambiguous breakpoint"
    gdb.execute("continue")
    if cap_reached:
        raise RuntimeError("Counter safety cap reached; not an exact completed measurement")
    assert len(stops) == 2, stops
    last_marker_stack = gdb.execute("bt 5", to_string=True)
    assert "SystemBreak" in last_marker_stack, last_marker_stack
    for point in breakpoints:
        point.enabled = False
    gdb.execute("continue")
    assert gdb.selected_inferior().pid == 0, "inferior did not exit"
    result.update(status="PASS", counts=counts, first_path_stacks=first_stacks,
                  first_marker_stack=first_marker_stack, last_marker_stack=last_marker_stack)
except Exception as exc:
    result.update(status="FAIL", error=str(exc), counts=counts, first_path_stacks=first_stacks)
finally:
    result["stop_events"] = stops
    Path(config["output_json"]).write_text(json.dumps(result, indent=2) + "\n")
    print("V8_GDB_COUNTER_STATUS:" + result["status"], flush=True)
